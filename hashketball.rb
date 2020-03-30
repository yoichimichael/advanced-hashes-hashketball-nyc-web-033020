#require 'pry'

def game_hash
  { :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black, White"],
    :players => [
        {:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1},
        {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7},
        {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15},
        {:player_name=>"Mason Plumlee", :number=>1, :shoe=>19, :points=>26, :rebounds=>11, :assists=>6, :steals=>3, :blocks=>8, :slam_dunks=>5},
        {:player_name=>"Jason Terry", :number=>31, :shoe=>15, :points=>19, :rebounds=>2, :assists=>2, :steals=>4, :blocks=>11, :slam_dunks=>1}
    ]
},
     :away => {
       :team_name => "Charlotte Hornets",
       :colors => ["Turquoise", "Purple"],
       :players => [
         {:player_name=>"Jeff Adrien", :number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2},
         {:player_name=>"Bismack Biyombo", :number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>22, :blocks=>15, :slam_dunks=>10},
         {:player_name=>"DeSagna Diop", :number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4, :blocks=>5, :slam_dunks=>5},
         {:player_name=>"Ben Gordon", :number=>8, :shoe=>15, :points=>33, :rebounds=>3, :assists=>2, :steals=>1, :blocks=>1, :slam_dunks=>0},
         {:player_name=>"Kemba Walker", :number=>33, :shoe=>15, :points=>6, :rebounds=>12, :assists=>12, :steals=>7, :blocks=>5, :slam_dunks=>12}
    ]
}
     }
end

def num_points_scored(player)
    home_roster = game_hash[:home][:players]
    away_roster = game_hash[:away][:players]
    home_roster.select { |hash| return hash[:points] if hash.has_value?(player) }
    away_roster.select { |hash| return hash[:points] if hash.has_value?(player) }
end

def shoe_size(player)
    home_roster = game_hash[:home][:players]
    away_roster = game_hash[:away][:players]
    home_roster.select { |hash| return hash[:shoe] if hash.has_value?(player) }
    away_roster.select { |hash| return hash[:shoe] if hash.has_value?(player) }
end

def team_colors(team)
    home_team = game_hash[:home]
    away_team = game_hash[:away]
    if home_team.has_value?(team)
        home_team[:colors][0].split(", ")
    elsif away_team.has_value?(team)
        away_team[:colors]#[0].split(", ")
    end
end

def team_names
    [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
    home_team = game_hash[:home]
    away_team = game_hash[:away]
    if home_team.has_value?(team)
      h_roster_nums = []
      home_team[:players].map { |hash| h_roster_nums << hash[:number] }
      return h_roster_nums.sort
    end
    if away_team.has_value?(team)
      a_roster_nums = []
      away_team[:players].map { |hash| a_roster_nums << hash[:number] }
      return a_roster_nums.sort
    end
end

def player_stats(player)
    home_roster = game_hash[:home][:players]
		away_roster = game_hash[:away][:players]

    home_roster.select do |hash|
			if hash.has_value?(player)
				hash.shift
				return hash
      end
		end

		away_roster.select do |hash|
			if hash.has_value?(player)
				hash.shift
				return hash
      end
    end
end

def big_shoe_rebounds
  home_roster = game_hash[:home][:players]
  away_roster = game_hash[:away][:players]

  home_shoes = []
  away_shoes = []

  home_roster.map { |hash| home_shoes << hash[:shoe]}
  away_roster.map { |hash| away_shoes << hash[:shoe]}

	h_biggest = home_shoes.sort![-1]
	a_biggest = away_shoes.sort![-1]

	if h_biggest > a_biggest
		home_roster.select do |hash|
			if hash[:shoe] == h_biggest
				return hash[:rebounds]
			end
		end
	else
		away_roster.select do |hash|
			if hash[:shoe] == a_biggest
				return hash[:rebounds]
			end
		end
	end
end

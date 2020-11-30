library(tidyverse)
library(googlesheets4)
gs4_deauth()

sheets <- c("frontpage", 
            "strategy-types", 
            "strategy-tools", 
            "research", 
            "publications", 
            "resources",
            "timeline",
            "faq")

store_sheet_in_csv <- function(sheet_name){
  read_sheet("https://docs.google.com/spreadsheets/d/1hddbgVzCwsvMLOtI1cDBmaLFkGMmV_eDeAEfRtcATrg/edit?usp=sharing",
             sheet = sheet_name, col_types = "c") %>% 
    write_csv(here::here(str_c("data/", sheet_name, ".csv")))
}

walk(sheets, store_sheet_in_csv)
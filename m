Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32764.1793879739406896329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cBfELS1U;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1599620f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879738; x=1794484538; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hgWmGqnLgMXsLU2Jj6TQpKK46StBxXJJePm1Wvg/1U=;
        b=cBfELS1UiL+slxHRnQmWfeuY5L14r+36zVNVrSFT7ak/eJnz/ikBp8n+HkehDOZahT
         KAqq/oG/XxZ7dJYSPQDXDkOYm0q8UvpTQQqBxOer5kAmRBmD0HNoWO+IhdTMAjZ1pWuO
         J54/pQtmf3jVg5N+riMgqa3dxMVFcLf/0fNiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879738; x=1794484538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hgWmGqnLgMXsLU2Jj6TQpKK46StBxXJJePm1Wvg/1U=;
        b=mWgRpUigyozMa9FMZ1OYjjjwrMgJr6go3ZgcjyDC2KFmMiWi50Y4NaJogg2reOwOan
         Zshyh+38xm8pAYS+NgbdtsMzF045wj4mInf3jvIpjwDTafW9nvMeAUPEePase5mk+M7K
         nppCcgkrdhiygTwLNTcBttIsmA9v+Y8tX1uCzeRq4zatFoy8Uzitfc/t9BxZ9oeH/Ky0
         pU97VTuZ7JxpGCn/+r6FhaqhE/FKLuJRh5MWnlMO6sohXW3IUro/ytDsnDtj47LK8gfM
         Gm8LFsuYWDqYvQlTtQvRrncvIi0f/IlloTV70L+xQef1amw0HEow4HuAhwicrL0zo6oh
         WTlg==
X-Gm-Message-State: APuU4Z8ArcdjJlXIxQAg/H+PxJmaRPZWwK3YAuUxQFyv9myeL+qpcUt9
	pBAC7O37v6wKJ+QtEZQspEwimMscmRvWP47XM4zhD6kNuHS1THvoC6oqjhcWgf8rwUhP0StJ9pT
	NxQN/
X-Gm-Gg: AYBFou0RXrvMLG+ZQO9KzK7NuFEkm8DWYGX76+fQtpaJK2VzrZqoQ7SwoOmh9/XUVaA
	3LADx94Xn9q896mji9G9zRvvm1+4RLv7q50TC1Q22yBLpXpKCzhHTXJhobAUgPPGEuGdFDc36db
	opvXjp3D8rs41aFWOEPvXAl7WV7p6Zi0GIjGcBkVjiFOK2C1u74wcnFTWjGao64n98zUkr2HuxB
	82dmADj/TAaeDEeCijF3SMI2ptB8ERddukXjiWxoCSfG12K9Gg8LkWYWGKKssJ+tsPAcX5cEZVn
	yelsAeyXDhC8n0xWDEEgZGXX08P0uqaASpkG2CZO3LFC9j3Qjf4B0lU8ly0m4Kn+E6CJT8eXu/7
	MFTe0ry6krfU2niBxB888PXpqOit1WN03y9SvNaxnSaLLiX3Qe9S4pXn+bUyvT2xjgxLIEgegoQ
	pSPuRoJoWZDgY5Yw5Ui8tDZ+3YthCXGFG8UgkMPLvgtGsycSeylNs8WZ8ELRKAcKZTl4PIZBNk8
	m6G/SIprng96egJmCOrVlkxYkPwXPK1Mv6g1aXC30a+fL5QwAKqM4JW07Fq08Oxad0tpn4kwJ6d
	nskZ23dNubE8BXflGjOaEFysYfcxYf/fe8WNDZ06hkggYY1K2gkhGdygzVykslqU/xjvUQ/xgcY
	B1BuTmhxA1UqYfdH+kNEHFHPlFWNiDHZ5bye1arIGlojSvKId0arJjA==
X-Received: by 2002:a05:600c:6208:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4ac182dc32cmr418005065e9.12.1793879737650;
        Thu, 05 Nov 2026 03:55:37 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:37 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/19] python3-dateparser: Upgrade 1.4.3 -> 1.5.0
Date: Thu,  5 Nov 2026 13:55:17 +0200
Message-ID: <20261105115526.634289-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131910
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.5.0:

Breaking changes:

- DateData.period can take the new values "quarter" and
  "part_of_day", and with RETURN_TIME_AS_PERIOD enabled a relative
  date with hours, minutes or seconds, such as "2 hours ago", now
  has the "time" period instead of "day" (#1417, #1437, #1473)
- Stop caching and sharing Settings instances: creating one with
  the same settings twice now gives two different objects, and the
  Settings.registry_key attribute no longer exists
- Remove the leftovers of fastText support from dateparser_cli: the
  fasttext_manager and exceptions modules and
  utils.create_data_model_home(); utils.dateparser_model_home and
  utils.DEFAULT_WINDOWS_CACHE_DIR are now pathlib.Path objects

- Remove Locale.to_parserinfo() and HijriDate.weekday(), which
  always raised an exception (#1406, #1457)

Deprecations:

- Deprecate dateparser.timezone_parser.convert_to_local_tz()
  and dateparser.timezone_parser.build_tz_offsets()
- Emit a FutureWarning naming the TZ value from parse(),
  DateDataParser and search_dates() when the local timezone cannot
  be determined; a future version will raise RuntimeError instead
  of failing to parse the date (#1403, #1556)
- Deprecate dateparser.utils.registry() and Settings.get_key(),
  which now emit a FutureWarning (#1442, #1556)
- Deprecate get_week_start() and get_week_end() in
  dateparser.utils.time_spans, and calling generate_time_span()
  without base_date or settings; all of them now emit a
  FutureWarning (#1393, #1556)
- Deprecate dateparser.date.RE_TRIM_COLONS (GHSA-fmxc-97cw-ph6p
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-fmxc-97cw-ph6p>_)

Security fixes:

- Make sentence splitting in search_dates() linear on long
  punctuation runs, to prevent quadratic backtracking (ReDoS) for
  Arabic, Bengali, Cantonese, Chinese, Hindi, Japanese and Persian
  (GHSA-rx9v-94ff-9cc2
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-rx9v-94ff-9cc2>_)
- Prevent quadratic regex matching (ReDoS) on long digit runs in
  Cantonese, Chinese and Japanese, and a ValueError on runs of more
  than 4,300 digits on Python 3.10.7 and later (GHSA-g8fh-jxm9-6qfx
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-g8fh-jxm9-6qfx>_)
- Bound the lookahead of the Chinese month simplification, to
  prevent quadratic parsing time on long runs of numbers followed
  by 月 (GHSA-q7fp-xwcm-6x9f
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-q7fp-xwcm-6x9f>_)
- Prevent quadratic regex matching (ReDoS) on long runs of digits
  or whitespace (GHSA-gqj4-wf6c-wmcg
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-gqj4-wf6c-wmcg>_)
- Strip trailing colons in linear time, to prevent quadratic
  backtracking (ReDoS) on long colon runs (GHSA-fmxc-97cw-ph6p
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-fmxc-97cw-ph6p>_)
- Split strings into known words in linear time, to prevent
  quadratic parsing time on long runs of words like month names
  (GHSA-jxmm-w6rw-32ch
  <https://github.com/scrapinghub/dateparser/security/advisories/GHSA-jxmm-w6rw-32ch>_)

New features:

- Add a STRICT_DATE_ORDER setting that turns an explicit DATE_ORDER
  from a preference into a requirement: "year" reads a two-digit
  year only from the position DATE_ORDER gives it, and "all" also
  keeps the day and month where the order puts them
- Add a TIMEZONE_ABBREVIATIONS setting to override the offset of
  timezone abbreviations, e.g. to read IST as India Standard Time
  instead of Israel Standard Time
- Parse parts of the day, such as "tomorrow morning", "this
  evening" or "8 in the evening", at the times set by the new
  PARTS_OF_DAY setting; the new DateData.part_of_day attribute
  tells which one was found
- Add DateData.parts, which lists the date parts (day, month, year,
  time…) read from the input rather than filled in from defaults
- Add an add_period argument to search_dates() to also return the
  period of each date
- Add a date_formats argument to search_dates(), to find dates
  written in the given formats; it requires strategy="ngram" and
  raises ValueError with the default "split" strategy
- Add the French Republican calendar and the Minguo (Taiwanese)
  calendar (#1483, #1489)
- Parse calendar quarters, such as "2025Q1", "2025-Q3" or "Q4
  2025", as a month of that quarter picked by PREFER_MONTH_OF_YEAR
  (by default, the month as far into the quarter as the current
  month is into its own)
- Parse "last", "this" and "next" before a weekday in English, e.g.
  "next Friday", as the closest occurrence of that weekday before,
  on or after, and after the current date, whatever
  PREFER_DATES_FROM is, except for the abbreviations "wed", "sat"
  and "sun"; search_dates() now includes the word in its matches
- Parse "the Nth of last/this/next month" as a day of that month
- Parse Roman numeral years written in capitals, e.g. "5 March
  MDCCLXXVI"; a short one such as "MMX" is read as a year only next
  to a month name, e.g. "April MMX"
- Parse dates with a bare UTC offset, such as "+03"
- Parse AM/PM written before the time, e.g. "PM 2:26" or "下午
  02:26:26"
- Parse ISO 8601 fractional seconds written with a decimal comma,
  e.g. "12:30:45,123"
- Parse English number words from thirteen to ninety-nine, e.g.
  "forty-five seconds ago"
- Parse "fortnight" and "century" in English relative dates, and
  read "a decade from now" as the future instead of the past
- Match month and weekday names in date_formats in the given
  languages, so formats with literal text work, e.g. "el %d de %B
  de %Y" for "el 15 de junio de 2020" with languages=["es"]
- When a date does not parse, try the other meanings of ambiguous
  words, such as Spanish "mar" (martes or marzo), and read
  a token that is both a weekday and a month abbreviation as the
  weekday when that is what fits
- In search_dates(), find dates written:

  - right after a label and a colon in Chinese or Japanese, e.g.
    "日期：2020年12月28日"
  - next to a relative date without a comma
  - joined by words that search skips, like "and"
  - inside parentheses, square brackets or straight quotes, e.g.
    'He said "May 5, 2020"' or "(Friday)"

Fixes:

- Take the current date, used to fill in the missing parts of a
  date such as "12:30" or "Nov" and to apply PREFER_DATES_FROM,
  from the TIMEZONE setting (the local time zone by default)
  instead of UTC
- Keep the %z offset when parsing with date_formats, and return a
  timezone-aware date for it unless RETURN_AS_TIMEZONE_AWARE is
  False
- Read year-first dates, such as "2021-01-13", as YMD unless
  DATE_ORDER starts with the year
- Swap the day and the month when they do not fit an explicit
  DATE_ORDER, whatever its value, e.g. "01/13/2021" with DMY
- Read a lone number next to a four-digit year as the month under
  any DATE_ORDER
- Apply PREFER_DAY_OF_MONTH before PREFER_DATES_FROM picks the year
 , and apply PREFER_DAY_OF_MONTH and PREFER_MONTH_OF_YEAR
  to relative dates such as "last year"
- Apply an explicit DATE_ORDER to every date that search_dates()
  finds, not only to the first one
- Stop dropping extra numbers when parsing dates: a string with
  more numbers than a date has, such as "5 10 Jan 2020" or
  "03/04/2021 5", now returns None instead of a date built from
  some of them
- Stop reading two adjacent numbers of a Russian numeric date as
  one compound ordinal, so parse("20 03 2021", languages=["ru"])
  returns 20 March 2021 instead of the 23rd of the current month
- Return None for strings with only skipped words, such as "year"
  or "hour minute", instead of today, which also stops
  search_dates() from returning them (#1440, #1564)
- Stop ignoring numbers without a unit in relative dates, so
  "03/06/2020 hour", "03/06/2020 day" or "01.02.2011 godz. 08:39"
  no longer parse as a number of hours or days ago
- Stop reading "Nth day" as a number of days, e.g. "the 1st day of
  March 2015"
- Parse "at 22h" and "à 22h" as a time of day, not as hours ago; a
  bare "à 22h" is still read as English hours ago unless
  languages=["fr"] is given or the text has other French words,
  such as "demain à 22h"
- Keep the future direction of a relative expression that
  search_dates() finds next to punctuation, e.g. "in 2 hours,
  thanks"
- Stop French "sept" being read as 7 when it means September, e.g.
  "1 sept 2024" with languages=["fr"] and "le 3 sept à 10h" with or
  without languages; "sept" now means 7 only before a duration unit
  or a clock time ("sept jours", "sept heures", "sept:30"), so a
  day written as a word, as in "sept mai 2020", no longer parses,
  and a bare "sept" is read as September
- Parse dates with a numeric offset followed by a redundant
  timezone abbreviation, e.g. "-0500 (CDT)", or with an
  abbreviation glued to the time, e.g. "2019-09-28WIB19:17:34"
- Recognize UTC offsets written with Unicode dash-like characters,
  such as "−05:00"
- Keep complete week dates (year, week number and weekday) when
  parsing with date_formats, including %G ISO week years
- Fix negative timestamps with subseconds
- Keep AM when searching for dates after a time
- Keep full stops between digits in search_dates() sentences
- Fix search_dates() dropping text next to a standalone accent mark
- Fix search_dates() raising IndexError for the zh-Hans, zh-Hant
  and yue locales, including when it detects one of them in the
  text, e.g. "聽日"
- In search_dates(), include the closing bracket in the matched
  text, e.g. "8 May 2020 (16:05)", and stop including separators
  such as "/" or "|"
- Split a relative date from a numeric date that follows it in
  search_dates(), e.g. "3 days later on 2010-05-10"
- Stop growing internal caches with every distinct RELATIVE_BASE
  value
- Fix parse() and DateDataParser returning None when region does
  not match the language of the text, e.g. parse("12 mars 2020",
  languages=["fr"], region="MX") or parse("5 de marzo de 2020",
  region="US")
- Fix dateparser.utils.get_logger() raising AttributeError when
  logging.config had not been imported

Improvements:

- Speed up parse() by about 35%, skip locales that cannot
  change the outcome of a failed parse, and speed up import
  by compiling the timezone regexes lazily
- Arabic: parse relative dates that use قبل for "ago",
  Egyptian and informal ة→ه spellings, numbered Levantine
  month names such as "كانون 2" in the ar-SY, ar-JO, ar-LB, ar-PS
  and ar-IQ locales only, e.g. locales=["ar-SY"] or region="SY"
 , Arabic dates typed with Persian yeh and kaf and Persian
  dates typed with Arabic ones, and Arabic month names and
  Arabic-Indic digits in Hijri dates
- Chinese: add the supplementary data of zh to zh-Hans and zh-Hant
 , and parse 后天, 大后天 and 大前天 as relative days
- Chinese and Japanese: parse dates with spaces around 年, 月 and 日
- French: parse "midi" as noon, e.g. "demain à midi" ("après-midi"
  and "avant midi" are still not read as noon); this also applies
  when no languages are given, so search_dates() can return "MIDI"
  in an English text as 12:00
- Indonesian: add old-style month abbreviations, such as "Djan" or
  "Peb"
- Korean: parse absolute dates written with 년, 월, 일, 시 and 분
- Slovak: parse "pozajtra"
- Swedish: parse ordinal day suffixes like "24:e" and "1:a"
- Thai: parse relative dates with spaced ago/in words
- Vietnamese: parse dates with zero-padded months
- Add type hints
- Document search_dates() in the API reference, add a
  performance section, explain how DEFAULT_LANGUAGES
  relates to the languages argument and how date_formats
  falls back to the other parsers
- Show the whole README on PyPI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-dateparser_1.4.3.bb => python3-dateparser_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.4.3.bb => python3-dateparser_1.5.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.4.3.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.5.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.5.0.bb
index ad8b590c25..a4db2d495a 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "bab8c43a746266e68142f4926e69438ce551441aa88e54e78bb6410bf3ee7000"
+SRC_URI[sha256sum] = "08d62f2c00d3a1e806fc59d40c79e7554e31d84d3b8c6145820af051c92e7292"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


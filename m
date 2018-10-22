Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5742460191
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 15:48:00 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f17-v6so13761831wrs.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=zvB9YI8I5kynkFKjEG069izIktFC0qh5lRmsoITzs7Q=;
	b=ZCeXbCcaAJScC9fe3Kke0aCbDgIiS4KBghBbV3urKTTCL1BNqMVwABljfy/tRi4Cao
	c2VaOwIIBm6IKRw4zfgpVG4lNI9te/WALQh49H7u3oejHOUfaXRBaU1sNXlhuZjRZAJP
	eABvbmuYa/UzVyRxHMIUWP7rmJROXcMuAvL1cQaGRVV5QIFyO2q5Fhms+BagCleJoS6X
	f3bb6W6XcfSdvc8zF3s1mPxrym2OMLfQ1ZRjPE4s4eWlP/gPyUIAInUlyTR1jTQLGzx0
	E+o4sEfrVEAM5R674bHwxPFkGgMVfct/rE/D1Tke8mrTuvFO07v+WWyxuFct7I6EzPgS
	QGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zvB9YI8I5kynkFKjEG069izIktFC0qh5lRmsoITzs7Q=;
	b=btQ6XV6Wq1wxpZ/A0SAQNZBkK9deAzxtJ35lPIg6mfEG/X+evG8xXX5Z6Vp49T0iSp
	gR+8v3cYqqhvoX6Y5msZwG17rasf9ebGgZxjs6YFAdS1QxH8XaF0j8eph6M1HeiZf8hk
	Zp7cH7PayQ2pxXH4tCKXTxoY90FRyJhMpCLE36u+86tZiYHVc9DjLMf6iTDjQyJcRQp2
	ynGFWcPMSCQVvE6OCrfxW4pFSIgYPLcH3pNWVEugwxRCCWTj/bZzHd6jd92tq0Z8XWHX
	Pt3KUSSpRa9jXP2aRRgOoRCxI+XiksxacZPl7ZlwsXg3nMJCko5fN4G+Iu7epxvSsSt9
	WH1g==
X-Gm-Message-State: ABuFfohBqQZMgiVEoumUv2x7b5r/liK7sfa6Jd3ovgzzjaL4ZxjOt98P
	mHAoYF7vTvbFTfMIhUocu1s/+yTvCTk=
X-Google-Smtp-Source: ACcGV61mn/SCFj+fmUgCz87hu6kJHoFKne2Ojg6wAWVBj7CeCl/WznqgpjNnF8ELogUndLELErbgyg==
X-Received: by 2002:a05:6000:8e:: with SMTP id
	m14mr19846672wrx.302.1540223277539; 
	Mon, 22 Oct 2018 08:47:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm25893153wmv.6.2018.10.22.08.47.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 08:47:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Oct 2018 16:47:55 +0100
Message-Id: <1540223275-8169-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] postgresql: Fix build issue with timezone 2018f update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 15:48:01 -0000

Sync our copy of the timezone library with IANA release tzcode2018f.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...py-of-the-timezone-library-with-IANA-rele.patch | 1164 ++++
 ...e-zone-data-files-to-tzdata-release-2018f.patch | 6452 ++++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb  |    2 +
 3 files changed, 7618 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch
new file mode 100644
index 0000000..6d8c46e
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch
@@ -0,0 +1,1164 @@
+From 12bfb778ce688fc662a6cb35f6298734fcf4856f Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Fri, 19 Oct 2018 19:36:34 -0400
+Subject: [PATCH] Sync our copy of the timezone library with IANA release
+ tzcode2018f.
+
+About half of this is purely cosmetic changes to reduce the diff between
+our code and theirs, like inserting "const" markers where they have them.
+
+The other half is tracking actual code changes in zic.c and localtime.c.
+I don't think any of these represent near-term compatibility hazards, but
+it seems best to stay up to date.
+
+I also fixed longstanding bugs in our code for producing the
+known_abbrevs.txt list, which by chance hadn't been exposed before,
+but which resulted in some garbage output after applying the upstream
+changes in zic.c.  Notably, because upstream removed their old phony
+transitions at the Big Bang, it's now necessary to cope with TZif files
+containing no DST transition times at all.
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/timezone/README      |   2 +-
+ src/timezone/localtime.c | 126 ++++++++++++------
+ src/timezone/pgtz.h      |  10 +-
+ src/timezone/private.h   |   3 +
+ src/timezone/strftime.c  |  10 +-
+ src/timezone/tzfile.h    |   7 +-
+ src/timezone/zic.c       | 330 ++++++++++++++++++++++++++---------------------
+ 7 files changed, 291 insertions(+), 197 deletions(-)
+
+Index: postgresql-10.5/src/timezone/README
+===================================================================
+--- postgresql-10.5.orig/src/timezone/README
++++ postgresql-10.5/src/timezone/README
+@@ -55,7 +55,7 @@ match properly on the old version.
+ Time Zone code
+ ==============
+ 
+-The code in this directory is currently synced with tzcode release 2018e.
++The code in this directory is currently synced with tzcode release 2018f.
+ There are many cosmetic (and not so cosmetic) differences from the
+ original tzcode library, but diffs in the upstream version should usually
+ be propagated to our version.  Here are some notes about that.
+Index: postgresql-10.5/src/timezone/localtime.c
+===================================================================
+--- postgresql-10.5.orig/src/timezone/localtime.c
++++ postgresql-10.5/src/timezone/localtime.c
+@@ -1,3 +1,5 @@
++/* Convert timestamp from pg_time_t to struct pg_tm.  */
++
+ /*
+  * This file is in the public domain, so clarified as of
+  * 1996-06-05 by Arthur David Olson.
+@@ -117,7 +119,7 @@ init_ttinfo(struct ttinfo *s, int32 gmto
+ }
+ 
+ static int32
+-detzcode(const char *codep)
++detzcode(const char *const codep)
+ {
+ 	int32		result;
+ 	int			i;
+@@ -143,7 +145,7 @@ detzcode(const char *codep)
+ }
+ 
+ static int64
+-detzcode64(const char *codep)
++detzcode64(const char *const codep)
+ {
+ 	uint64		result;
+ 	int			i;
+@@ -258,8 +260,13 @@ tzloadbody(char const *name, char *canon
+ 		int32		charcnt = detzcode(up->tzhead.tzh_charcnt);
+ 		char const *p = up->buf + tzheadsize;
+ 
++		/*
++		 * Although tzfile(5) currently requires typecnt to be nonzero,
++		 * support future formats that may allow zero typecnt in files that
++		 * have a TZ string and no transitions.
++		 */
+ 		if (!(0 <= leapcnt && leapcnt < TZ_MAX_LEAPS
+-			  && 0 < typecnt && typecnt < TZ_MAX_TYPES
++			  && 0 <= typecnt && typecnt < TZ_MAX_TYPES
+ 			  && 0 <= timecnt && timecnt < TZ_MAX_TIMES
+ 			  && 0 <= charcnt && charcnt < TZ_MAX_CHARS
+ 			  && (ttisstdcnt == typecnt || ttisstdcnt == 0)
+@@ -416,8 +423,7 @@ tzloadbody(char const *name, char *canon
+ 		struct state *ts = &lsp->u.st;
+ 
+ 		up->buf[nread - 1] = '\0';
+-		if (tzparse(&up->buf[1], ts, false)
+-			&& ts->typecnt == 2)
++		if (tzparse(&up->buf[1], ts, false))
+ 		{
+ 			/*
+ 			 * Attempt to reuse existing abbreviations. Without this,
+@@ -430,7 +436,7 @@ tzloadbody(char const *name, char *canon
+ 			int			gotabbr = 0;
+ 			int			charcnt = sp->charcnt;
+ 
+-			for (i = 0; i < 2; i++)
++			for (i = 0; i < ts->typecnt; i++)
+ 			{
+ 				char	   *tsabbr = ts->chars + ts->ttis[i].tt_abbrind;
+ 				int			j;
+@@ -455,7 +461,7 @@ tzloadbody(char const *name, char *canon
+ 					}
+ 				}
+ 			}
+-			if (gotabbr == 2)
++			if (gotabbr == ts->typecnt)
+ 			{
+ 				sp->charcnt = charcnt;
+ 
+@@ -470,7 +476,8 @@ tzloadbody(char const *name, char *canon
+ 					sp->timecnt--;
+ 
+ 				for (i = 0; i < ts->timecnt; i++)
+-					if (sp->ats[sp->timecnt - 1] < ts->ats[i])
++					if (sp->timecnt == 0
++						|| sp->ats[sp->timecnt - 1] < ts->ats[i])
+ 						break;
+ 				while (i < ts->timecnt
+ 					   && sp->timecnt < TZ_MAX_TIMES)
+@@ -481,11 +488,13 @@ tzloadbody(char const *name, char *canon
+ 					sp->timecnt++;
+ 					i++;
+ 				}
+-				sp->ttis[sp->typecnt++] = ts->ttis[0];
+-				sp->ttis[sp->typecnt++] = ts->ttis[1];
++				for (i = 0; i < ts->typecnt; i++)
++					sp->ttis[sp->typecnt++] = ts->ttis[i];
+ 			}
+ 		}
+ 	}
++	if (sp->typecnt == 0)
++		return EINVAL;
+ 	if (sp->timecnt > 1)
+ 	{
+ 		for (i = 1; i < sp->timecnt; ++i)
+@@ -507,6 +516,18 @@ tzloadbody(char const *name, char *canon
+ 	}
+ 
+ 	/*
++	 * Infer sp->defaulttype from the data.  Although this default type is
++	 * always zero for data from recent tzdb releases, things are trickier for
++	 * data from tzdb 2018e or earlier.
++	 *
++	 * The first set of heuristics work around bugs in 32-bit data generated
++	 * by tzdb 2013c or earlier.  The workaround is for zones like
++	 * Australia/Macquarie where timestamps before the first transition have a
++	 * time type that is not the earliest standard-time type.  See:
++	 * https://mm.icann.org/pipermail/tz/2013-May/019368.html
++	 */
++
++	/*
+ 	 * If type 0 is unused in transitions, it's the type to use for early
+ 	 * times.
+ 	 */
+@@ -529,6 +550,11 @@ tzloadbody(char const *name, char *canon
+ 	}
+ 
+ 	/*
++	 * The next heuristics are for data generated by tzdb 2018e or earlier,
++	 * for zones like EST5EDT where the first transition is to DST.
++	 */
++
++	/*
+ 	 * If no result yet, find the first standard type. If there is none, punt
+ 	 * to type zero.
+ 	 */
+@@ -542,7 +568,14 @@ tzloadbody(char const *name, char *canon
+ 				break;
+ 			}
+ 	}
++
++	/*
++	 * A simple 'sp->defaulttype = 0;' would suffice here if we didn't have to
++	 * worry about 2018e-or-earlier data.  Even simpler would be to remove the
++	 * defaulttype member and just use 0 in its place.
++	 */
+ 	sp->defaulttype = i;
++
+ 	return 0;
+ }
+ 
+@@ -601,10 +634,11 @@ static const int year_lengths[2] = {
+ };
+ 
+ /*
+- * Given a pointer into a time zone string, scan until a character that is not
+- * a valid character in a zone name is found. Return a pointer to that
+- * character.
++ * Given a pointer into a timezone string, scan until a character that is not
++ * a valid character in a time zone abbreviation is found.
++ * Return a pointer to that character.
+  */
++
+ static const char *
+ getzname(const char *strp)
+ {
+@@ -617,15 +651,17 @@ getzname(const char *strp)
+ }
+ 
+ /*
+- * Given a pointer into an extended time zone string, scan until the ending
+- * delimiter of the zone name is located. Return a pointer to the delimiter.
++ * Given a pointer into an extended timezone string, scan until the ending
++ * delimiter of the time zone abbreviation is located.
++ * Return a pointer to the delimiter.
+  *
+  * As with getzname above, the legal character set is actually quite
+  * restricted, with other characters producing undefined results.
+  * We don't do any checking here; checking is done later in common-case code.
+  */
++
+ static const char *
+-getqzname(const char *strp, int delim)
++getqzname(const char *strp, const int delim)
+ {
+ 	int			c;
+ 
+@@ -635,13 +671,14 @@ getqzname(const char *strp, int delim)
+ }
+ 
+ /*
+- * Given a pointer into a time zone string, extract a number from that string.
++ * Given a pointer into a timezone string, extract a number from that string.
+  * Check that the number is within a specified range; if it is not, return
+  * NULL.
+  * Otherwise, return a pointer to the first character not part of the number.
+  */
++
+ static const char *
+-getnum(const char *strp, int *nump, int min, int max)
++getnum(const char *strp, int *const nump, const int min, const int max)
+ {
+ 	char		c;
+ 	int			num;
+@@ -663,14 +700,15 @@ getnum(const char *strp, int *nump, int
+ }
+ 
+ /*
+- * Given a pointer into a time zone string, extract a number of seconds,
++ * Given a pointer into a timezone string, extract a number of seconds,
+  * in hh[:mm[:ss]] form, from the string.
+  * If any error occurs, return NULL.
+  * Otherwise, return a pointer to the first character not part of the number
+  * of seconds.
+  */
++
+ static const char *
+-getsecs(const char *strp, int32 *secsp)
++getsecs(const char *strp, int32 *const secsp)
+ {
+ 	int			num;
+ 
+@@ -704,13 +742,14 @@ getsecs(const char *strp, int32 *secsp)
+ }
+ 
+ /*
+- * Given a pointer into a time zone string, extract an offset, in
++ * Given a pointer into a timezone string, extract an offset, in
+  * [+-]hh[:mm[:ss]] form, from the string.
+  * If any error occurs, return NULL.
+  * Otherwise, return a pointer to the first character not part of the time.
+  */
++
+ static const char *
+-getoffset(const char *strp, int32 *offsetp)
++getoffset(const char *strp, int32 *const offsetp)
+ {
+ 	bool		neg = false;
+ 
+@@ -730,13 +769,14 @@ getoffset(const char *strp, int32 *offse
+ }
+ 
+ /*
+- * Given a pointer into a time zone string, extract a rule in the form
++ * Given a pointer into a timezone string, extract a rule in the form
+  * date[/time]. See POSIX section 8 for the format of "date" and "time".
+  * If a valid rule is not found, return NULL.
+  * Otherwise, return a pointer to the first character not part of the rule.
+  */
++
+ static const char *
+-getrule(const char *strp, struct rule *rulep)
++getrule(const char *strp, struct rule *const rulep)
+ {
+ 	if (*strp == 'J')
+ 	{
+@@ -795,9 +835,10 @@ getrule(const char *strp, struct rule *r
+  * Given a year, a rule, and the offset from UT at the time that rule takes
+  * effect, calculate the year-relative time that rule takes effect.
+  */
++
+ static int32
+-transtime(int year, const struct rule *rulep,
+-		  int32 offset)
++transtime(const int year, const struct rule *const rulep,
++		  const int32 offset)
+ {
+ 	bool		leapyear;
+ 	int32		value;
+@@ -981,7 +1022,7 @@ tzparse(const char *name, struct state *
+ 		{
+ 			dstname = name;
+ 			name = getzname(name);
+-			dstlen = name - dstname;	/* length of DST zone name */
++			dstlen = name - dstname;	/* length of DST abbr. */
+ 		}
+ 		if (!dstlen)
+ 			return false;
+@@ -1023,8 +1064,8 @@ tzparse(const char *name, struct state *
+ 			/*
+ 			 * Two transitions per year, from EPOCH_YEAR forward.
+ 			 */
+-			init_ttinfo(&sp->ttis[0], -dstoffset, true, stdlen + 1);
+-			init_ttinfo(&sp->ttis[1], -stdoffset, false, 0);
++			init_ttinfo(&sp->ttis[0], -stdoffset, false, 0);
++			init_ttinfo(&sp->ttis[1], -dstoffset, true, stdlen + 1);
+ 			sp->defaulttype = 0;
+ 			timecnt = 0;
+ 			janfirst = 0;
+@@ -1073,19 +1114,15 @@ tzparse(const char *name, struct state *
+ 					if (!increment_overflow_time
+ 						(&sp->ats[timecnt],
+ 						 janoffset + starttime))
+-						sp->types[timecnt++] = reversed;
+-					else if (janoffset)
+-						sp->defaulttype = reversed;
++						sp->types[timecnt++] = !reversed;
+ 					sp->ats[timecnt] = janfirst;
+ 					if (!increment_overflow_time
+ 						(&sp->ats[timecnt],
+ 						 janoffset + endtime))
+ 					{
+-						sp->types[timecnt++] = !reversed;
++						sp->types[timecnt++] = reversed;
+ 						yearlim = year + YEARSPERREPEAT + 1;
+ 					}
+-					else if (janoffset)
+-						sp->defaulttype = !reversed;
+ 				}
+ 				if (increment_overflow_time
+ 					(&janfirst, janoffset + yearsecs))
+@@ -1094,7 +1131,10 @@ tzparse(const char *name, struct state *
+ 			}
+ 			sp->timecnt = timecnt;
+ 			if (!timecnt)
++			{
++				sp->ttis[0] = sp->ttis[1];
+ 				sp->typecnt = 1;	/* Perpetual DST.  */
++			}
+ 			else if (YEARSPERREPEAT < year - yearbeg)
+ 				sp->goback = sp->goahead = true;
+ 		}
+@@ -1163,7 +1203,6 @@ tzparse(const char *name, struct state *
+ 					 * otherwise, add the standard time offset to the
+ 					 * transition time.
+ 					 */
+-
+ 					/*
+ 					 * Transitions from DST to DDST will effectively disappear
+ 					 * since POSIX provides for only one DST offset.
+@@ -1217,7 +1256,7 @@ tzparse(const char *name, struct state *
+ }
+ 
+ static void
+-gmtload(struct state *sp)
++gmtload(struct state *const sp)
+ {
+ 	if (tzload(gmt, NULL, sp, true) != 0)
+ 		tzparse(gmt, sp, true);
+@@ -1232,7 +1271,7 @@ gmtload(struct state *sp)
+  */
+ static struct pg_tm *
+ localsub(struct state const *sp, pg_time_t const *timep,
+-		 struct pg_tm *tmp)
++		 struct pg_tm *const tmp)
+ {
+ 	const struct ttinfo *ttisp;
+ 	int			i;
+@@ -1300,6 +1339,11 @@ localsub(struct state const *sp, pg_time
+ 	}
+ 	ttisp = &sp->ttis[i];
+ 
++	/*
++	 * To get (wrong) behavior that's compatible with System V Release 2.0
++	 * you'd replace the statement below with t += ttisp->tt_gmtoff;
++	 * timesub(&t, 0L, sp, tmp);
++	 */
+ 	result = timesub(&t, ttisp->tt_gmtoff, sp, tmp);
+ 	if (result)
+ 	{
+@@ -1322,8 +1366,10 @@ pg_localtime(const pg_time_t *timep, con
+  *
+  * Except we have a private "struct state" for GMT, so no sp is passed in.
+  */
++
+ static struct pg_tm *
+-gmtsub(pg_time_t const *timep, int32 offset, struct pg_tm *tmp)
++gmtsub(pg_time_t const *timep, int32 offset,
++	   struct pg_tm *tmp)
+ {
+ 	struct pg_tm *result;
+ 
+@@ -1337,6 +1383,7 @@ gmtsub(pg_time_t const *timep, int32 off
+ 		gmt_is_set = true;
+ 		gmtload(gmtptr);
+ 	}
++
+ 	result = timesub(timep, offset, gmtptr, tmp);
+ 
+ 	/*
+@@ -1361,6 +1408,7 @@ pg_gmtime(const pg_time_t *timep)
+  * Return the number of leap years through the end of the given year
+  * where, to make the math easy, the answer for year zero is defined as zero.
+  */
++
+ static int
+ leaps_thru_end_of_nonneg(int y)
+ {
+Index: postgresql-10.5/src/timezone/pgtz.h
+===================================================================
+--- postgresql-10.5.orig/src/timezone/pgtz.h
++++ postgresql-10.5/src/timezone/pgtz.h
+@@ -49,10 +49,16 @@ struct state
+ 	pg_time_t	ats[TZ_MAX_TIMES];
+ 	unsigned char types[TZ_MAX_TIMES];
+ 	struct ttinfo ttis[TZ_MAX_TYPES];
+-	char		chars[BIGGEST(BIGGEST(TZ_MAX_CHARS + 1, 3 /* sizeof gmt */ ),
++	char		chars[BIGGEST(BIGGEST(TZ_MAX_CHARS + 1, 4 /* sizeof gmt */ ),
+ 							  (2 * (TZ_STRLEN_MAX + 1)))];
+ 	struct lsinfo lsis[TZ_MAX_LEAPS];
+-	int			defaulttype;	/* for early times or if no transitions */
++
++	/*
++	 * The time type to use for early times or if no transitions. It is always
++	 * zero for recent tzdb releases. It might be nonzero for data from tzdb
++	 * 2018e or earlier.
++	 */
++	int			defaulttype;
+ };
+ 
+ 
+Index: postgresql-10.5/src/timezone/private.h
+===================================================================
+--- postgresql-10.5.orig/src/timezone/private.h
++++ postgresql-10.5/src/timezone/private.h
+@@ -1,4 +1,7 @@
++/* Private header for tzdb code.  */
++
+ #ifndef PRIVATE_H
++
+ #define PRIVATE_H
+ 
+ /*
+Index: postgresql-10.5/src/timezone/strftime.c
+===================================================================
+--- postgresql-10.5.orig/src/timezone/strftime.c
++++ postgresql-10.5/src/timezone/strftime.c
+@@ -1,4 +1,4 @@
+-/* Convert a broken-down timestamp to a string. */
++/* Convert a broken-down timestamp to a string.  */
+ 
+ /*
+  * Copyright 1989 The Regents of the University of California.
+@@ -115,7 +115,7 @@ static char *_add(const char *, char *,
+ static char *_conv(int, const char *, char *, const char *);
+ static char *_fmt(const char *, const struct pg_tm *, char *, const char *,
+ 	 enum warn *);
+-static char *_yconv(int, int, bool, bool, char *, const char *);
++static char *_yconv(int, int, bool, bool, char *, char const *);
+ 
+ 
+ size_t
+@@ -441,7 +441,8 @@ _fmt(const char *format, const struct pg
+ 
+ 					/*
+ 					 * C99 and later say that %Z must be replaced by the empty
+-					 * string if the time zone is not determinable.
++					 * string if the time zone abbreviation is not
++					 * determinable.
+ 					 */
+ 					continue;
+ 				case 'z':
+@@ -519,6 +520,7 @@ _add(const char *str, char *pt, const ch
+  * same output as %Y, and that %Y contains at least 4 bytes,
+  * with more only if necessary.
+  */
++
+ static char *
+ _yconv(int a, int b, bool convert_top, bool convert_yy,
+ 	   char *pt, const char *ptlim)
+@@ -526,7 +528,7 @@ _yconv(int a, int b, bool convert_top, b
+ 	int			lead;
+ 	int			trail;
+ 
+-#define DIVISOR 100
++#define DIVISOR	100
+ 	trail = a % DIVISOR + b % DIVISOR;
+ 	lead = a / DIVISOR + b / DIVISOR + trail / DIVISOR;
+ 	trail %= DIVISOR;
+Index: postgresql-10.5/src/timezone/tzfile.h
+===================================================================
+--- postgresql-10.5.orig/src/timezone/tzfile.h
++++ postgresql-10.5/src/timezone/tzfile.h
+@@ -1,4 +1,7 @@
++/* Layout and location of TZif files.  */
++
+ #ifndef TZFILE_H
++
+ #define TZFILE_H
+ 
+ /*
+@@ -21,14 +24,14 @@
+  * Information about time zone files.
+  */
+ 
+-#define TZDEFAULT	"localtime"
++#define TZDEFAULT	"/etc/localtime"
+ #define TZDEFRULES	"posixrules"
+ 
+ /*
+  * Each file begins with. . .
+  */
+ 
+-#define TZ_MAGIC	"TZif"
++#define	TZ_MAGIC	"TZif"
+ 
+ struct tzhead
+ {
+Index: postgresql-10.5/src/timezone/zic.c
+===================================================================
+--- postgresql-10.5.orig/src/timezone/zic.c
++++ postgresql-10.5/src/timezone/zic.c
+@@ -1,3 +1,5 @@
++/* Compile .zi time zone data into TZif binary files.  */
++
+ /*
+  * This file is in the public domain, so clarified as of
+  * 2006-07-17 by Arthur David Olson.
+@@ -130,8 +132,7 @@ static void adjleap(void);
+ static void associate(void);
+ static void dolink(const char *, const char *, bool);
+ static char **getfields(char *buf);
+-static zic_t gethms(const char *string, const char *errstring,
+-	   bool);
++static zic_t gethms(const char *string, const char *errstring);
+ static zic_t getstdoff(char *, bool *);
+ static void infile(const char *filename);
+ static void inleap(char **fields, int nfields);
+@@ -162,7 +163,7 @@ enum
+ PERCENT_Z_LEN_BOUND = sizeof "+995959" - 1};
+ 
+ /* If true, work around a bug in Qt 5.6.1 and earlier, which mishandles
+-   tz binary files whose POSIX-TZ-style strings contain '<'; see
++   TZif files whose POSIX-TZ-style strings contain '<'; see
+    QTBUG-53071 <https://bugreports.qt.io/browse/QTBUG-53071>.  This
+    workaround will no longer be needed when Qt 5.6.1 and earlier are
+    obsolete, say in the year 2021.  */
+@@ -211,7 +212,7 @@ static int	typecnt;
+ #define ZF_RULE		3
+ #define ZF_FORMAT	4
+ #define ZF_TILYEAR	5
+-#define ZF_TILMONTH 6
++#define ZF_TILMONTH	6
+ #define ZF_TILDAY	7
+ #define ZF_TILTIME	8
+ #define ZONE_MINFIELDS	5
+@@ -224,12 +225,12 @@ static int	typecnt;
+ #define ZFC_GMTOFF	0
+ #define ZFC_RULE	1
+ #define ZFC_FORMAT	2
+-#define ZFC_TILYEAR 3
++#define ZFC_TILYEAR	3
+ #define ZFC_TILMONTH	4
+ #define ZFC_TILDAY	5
+-#define ZFC_TILTIME 6
+-#define ZONEC_MINFIELDS 3
+-#define ZONEC_MAXFIELDS 7
++#define ZFC_TILTIME	6
++#define ZONEC_MINFIELDS	3
++#define ZONEC_MAXFIELDS	7
+ 
+ /*
+  * Which files are which on a Rule line.
+@@ -244,7 +245,7 @@ static int	typecnt;
+ #define RF_TOD		7
+ #define RF_STDOFF	8
+ #define RF_ABBRVAR	9
+-#define RULE_FIELDS 10
++#define RULE_FIELDS	10
+ 
+ /*
+  * Which fields are which on a Link line.
+@@ -252,7 +253,7 @@ static int	typecnt;
+ 
+ #define LF_FROM		1
+ #define LF_TO		2
+-#define LINK_FIELDS 3
++#define LINK_FIELDS	3
+ 
+ /*
+  * Which fields are which on a Leap line.
+@@ -264,7 +265,7 @@ static int	typecnt;
+ #define LP_TIME		4
+ #define LP_CORR		5
+ #define LP_ROLL		6
+-#define LEAP_FIELDS 7
++#define LEAP_FIELDS	7
+ 
+ /*
+  * Year synonyms.
+@@ -998,48 +999,6 @@ dolink(char const *fromfield, char const
+ static zic_t const min_time = MINVAL(zic_t, TIME_T_BITS_IN_FILE);
+ static zic_t const max_time = MAXVAL(zic_t, TIME_T_BITS_IN_FILE);
+ 
+-/*
+- * Estimated time of the Big Bang, in seconds since the POSIX epoch.
+- * rounded downward to the negation of a power of two that is
+- * comfortably outside the error bounds.
+- *
+- * For the time of the Big Bang, see:
+- *
+- * Ade PAR, Aghanim N, Armitage-Caplan C et al.  Planck 2013 results.
+- * I. Overview of products and scientific results.
+- * arXiv:1303.5062 2013-03-20 20:10:01 UTC
+- * <https://arxiv.org/pdf/1303.5062v1> [PDF]
+- *
+- * Page 36, Table 9, row Age/Gyr, column Planck+WP+highL+BAO 68% limits
+- * gives the value 13.798 plus-or-minus 0.037 billion years.
+- * Multiplying this by 1000000000 and then by 31557600 (the number of
+- * seconds in an astronomical year) gives a value that is comfortably
+- * less than 2**59, so BIG_BANG is - 2**59.
+- *
+- * BIG_BANG is approximate, and may change in future versions.
+- * Please do not rely on its exact value.
+- */
+-
+-#ifndef BIG_BANG
+-#define BIG_BANG (- (((zic_t) 1) << 59))
+-#endif
+-
+-/* If true, work around GNOME bug 730332
+-   <https://bugzilla.gnome.org/show_bug.cgi?id=730332>
+-   by refusing to output time stamps before BIG_BANG.
+-   Such time stamps are physically suspect anyway.
+-
+-   The GNOME bug is scheduled to be fixed in GNOME 3.22, and if so
+-   this workaround will no longer be needed when GNOME 3.21 and
+-   earlier are obsolete, say in the year 2021.  */
+-enum
+-{
+-WORK_AROUND_GNOME_BUG_730332 = true};
+-
+-static const zic_t early_time = (WORK_AROUND_GNOME_BUG_730332
+-								 ? BIG_BANG
+-								 : MINVAL(zic_t, TIME_T_BITS_IN_FILE));
+-
+ /* Return true if NAME is a directory.  */
+ static bool
+ itsdir(char const *name)
+@@ -1281,8 +1240,9 @@ infile(const char *name)
+  * A null string maps to zero.
+  * Call error with errstring and return zero on errors.
+  */
++
+ static zic_t
+-gethms(char const *string, char const *errstring, bool signable)
++gethms(char const *string, char const *errstring)
+ {
+ 	/* PG: make hh be int not zic_t to avoid sscanf portability issues */
+ 	int			hh;
+@@ -1299,9 +1259,7 @@ gethms(char const *string, char const *e
+ 
+ 	if (string == NULL || *string == '\0')
+ 		return 0;
+-	if (!signable)
+-		sign = 1;
+-	else if (*string == '-')
++	if (*string == '-')
+ 	{
+ 		sign = -1;
+ 		++string;
+@@ -1384,7 +1342,7 @@ getstdoff(char *field, bool *isdst)
+ 				break;
+ 		}
+ 	}
+-	stdoff = gethms(field, _("invalid saved time"), true);
++	stdoff = gethms(field, _("invalid saved time"));
+ 	*isdst = dst < 0 ? stdoff != 0 : dst;
+ 	return stdoff;
+ }
+@@ -1399,10 +1357,29 @@ inrule(char **fields, int nfields)
+ 		error(_("wrong number of fields on Rule line"));
+ 		return;
+ 	}
+-	if (*fields[RF_NAME] == '\0')
++	switch (*fields[RF_NAME])
+ 	{
+-		error(_("nameless rule"));
+-		return;
++		case '\0':
++		case ' ':
++		case '\f':
++		case '\n':
++		case '\r':
++		case '\t':
++		case '\v':
++		case '+':
++		case '-':
++		case '0':
++		case '1':
++		case '2':
++		case '3':
++		case '4':
++		case '5':
++		case '6':
++		case '7':
++		case '8':
++		case '9':
++			error(_("Invalid rule name \"%s\""), fields[RF_NAME]);
++			return;
+ 	}
+ 	r.r_filename = filename;
+ 	r.r_linenum = linenum;
+@@ -1507,7 +1484,7 @@ inzsub(char **fields, int nfields, bool
+ 	}
+ 	z.z_filename = filename;
+ 	z.z_linenum = linenum;
+-	z.z_gmtoff = gethms(fields[i_gmtoff], _("invalid UT offset"), true);
++	z.z_gmtoff = gethms(fields[i_gmtoff], _("invalid UT offset"));
+ 	if ((cp = strchr(fields[i_format], '%')) != NULL)
+ 	{
+ 		if ((*++cp != 's' && *cp != 'z') || strchr(cp, '%')
+@@ -1649,7 +1626,7 @@ inleap(char **fields, int nfields)
+ 		return;
+ 	}
+ 	t = dayoff * SECSPERDAY;
+-	tod = gethms(fields[LP_TIME], _("invalid time of day"), false);
++	tod = gethms(fields[LP_TIME], _("invalid time of day"));
+ 	cp = fields[LP_CORR];
+ 	{
+ 		bool		positive;
+@@ -1757,7 +1734,7 @@ rulesub(struct rule *rp, const char *loy
+ 				break;
+ 		}
+ 	}
+-	rp->r_tod = gethms(dp, _("invalid time of day"), false);
++	rp->r_tod = gethms(dp, _("invalid time of day"));
+ 	free(dp);
+ 
+ 	/*
+@@ -1942,7 +1919,43 @@ is32(const zic_t x)
+ }
+ 
+ static void
+-writezone(const char *const name, const char *const string, char version)
++swaptypes(int i, int j)
++{
++	{
++		zic_t		t = gmtoffs[i];
++
++		gmtoffs[i] = gmtoffs[j];
++		gmtoffs[j] = t;
++	}
++	{
++		char		t = isdsts[i];
++
++		isdsts[i] = isdsts[j];
++		isdsts[j] = t;
++	}
++	{
++		unsigned char t = abbrinds[i];
++
++		abbrinds[i] = abbrinds[j];
++		abbrinds[j] = t;
++	}
++	{
++		bool		t = ttisstds[i];
++
++		ttisstds[i] = ttisstds[j];
++		ttisstds[j] = t;
++	}
++	{
++		bool		t = ttisgmts[i];
++
++		ttisgmts[i] = ttisgmts[j];
++		ttisgmts[j] = t;
++	}
++}
++
++static void
++writezone(const char *const name, const char *const string, char version,
++		  int defaulttype)
+ {
+ 	FILE	   *fp;
+ 	ptrdiff_t	i,
+@@ -1977,14 +1990,12 @@ writezone(const char *const name, const
+ 
+ 		toi = 0;
+ 		fromi = 0;
+-		while (fromi < timecnt && attypes[fromi].at < early_time)
+-			++fromi;
+ 		for (; fromi < timecnt; ++fromi)
+ 		{
+-			if (toi > 1 && ((attypes[fromi].at +
+-							 gmtoffs[attypes[toi - 1].type]) <=
+-							(attypes[toi - 1].at +
+-							 gmtoffs[attypes[toi - 2].type])))
++			if (toi != 0 && ((attypes[fromi].at +
++							  gmtoffs[attypes[toi - 1].type]) <=
++							 (attypes[toi - 1].at + gmtoffs[toi == 1 ? 0
++															: attypes[toi - 2].type])))
+ 			{
+ 				attypes[toi - 1].type =
+ 					attypes[fromi].type;
+@@ -2019,8 +2030,8 @@ writezone(const char *const name, const
+ 	}
+ 
+ 	/*
+-	 * Work around QTBUG-53071 for time stamps less than y2038_boundary - 1,
+-	 * by inserting a no-op transition at time y2038_boundary - 1. This works
++	 * Work around QTBUG-53071 for timestamps less than y2038_boundary - 1, by
++	 * inserting a no-op transition at time y2038_boundary - 1. This works
+ 	 * only for timestamps before the boundary, which should be good enough in
+ 	 * practice as QTBUG-53071 should be long-dead by 2038.
+ 	 */
+@@ -2116,7 +2127,8 @@ writezone(const char *const name, const
+ 		int			thisleapi,
+ 					thisleapcnt,
+ 					thisleaplim;
+-		int			writetype[TZ_MAX_TYPES];
++		int			old0;
++		char		omittype[TZ_MAX_TYPES];
+ 		int			typemap[TZ_MAX_TYPES];
+ 		int			thistypecnt;
+ 		char		thischars[TZ_MAX_CHARS];
+@@ -2144,28 +2156,19 @@ writezone(const char *const name, const
+ 			error(_("too many transition times"));
+ 		thistimelim = thistimei + thistimecnt;
+ 		thisleaplim = thisleapi + thisleapcnt;
+-		for (i = 0; i < typecnt; ++i)
+-			writetype[i] = thistimecnt == timecnt;
+-		if (thistimecnt == 0)
+-		{
+-			/*
+-			 * No transition times fall in the current (32- or 64-bit) window.
+-			 */
+-			if (typecnt != 0)
+-				writetype[typecnt - 1] = true;
+-		}
+-		else
+-		{
+-			for (i = thistimei - 1; i < thistimelim; ++i)
+-				if (i >= 0)
+-					writetype[types[i]] = true;
++		memset(omittype, true, typecnt);
++		omittype[defaulttype] = false;
++		for (i = thistimei; i < thistimelim; i++)
++			omittype[types[i]] = false;
++
++		/*
++		 * Reorder types to make DEFAULTTYPE type 0. Use TYPEMAP to swap OLD0
++		 * and DEFAULTTYPE so that DEFAULTTYPE appears as type 0 in the output
++		 * instead of OLD0.  TYPEMAP also omits unused types.
++		 */
++		old0 = strlen(omittype);
++		swaptypes(old0, defaulttype);
+ 
+-			/*
+-			 * For America/Godthab and Antarctica/Palmer
+-			 */
+-			if (thistimei == 0)
+-				writetype[0] = true;
+-		}
+ #ifndef LEAVE_SOME_PRE_2011_SYSTEMS_IN_THE_LURCH
+ 
+ 		/*
+@@ -2187,8 +2190,8 @@ writezone(const char *const name, const
+ 					mrudst = types[i];
+ 				else
+ 					mrustd = types[i];
+-			for (i = 0; i < typecnt; ++i)
+-				if (writetype[i])
++			for (i = old0; i < typecnt; i++)
++				if (!omittype[i])
+ 				{
+ 					if (isdsts[i])
+ 						hidst = i;
+@@ -2205,7 +2208,7 @@ writezone(const char *const name, const
+ 							   ttisstds[mrudst],
+ 							   ttisgmts[mrudst]);
+ 				isdsts[mrudst] = 1;
+-				writetype[type] = true;
++				omittype[type] = false;
+ 			}
+ 			if (histd >= 0 && mrustd >= 0 && histd != mrustd &&
+ 				gmtoffs[histd] != gmtoffs[mrustd])
+@@ -2217,22 +2220,26 @@ writezone(const char *const name, const
+ 							   ttisstds[mrustd],
+ 							   ttisgmts[mrustd]);
+ 				isdsts[mrustd] = 0;
+-				writetype[type] = true;
++				omittype[type] = false;
+ 			}
+ 		}
+ #endif							/* !defined
+ 								 * LEAVE_SOME_PRE_2011_SYSTEMS_IN_THE_LURCH */
+ 		thistypecnt = 0;
+-		for (i = 0; i < typecnt; ++i)
+-			typemap[i] = writetype[i] ? thistypecnt++ : -1;
++		for (i = old0; i < typecnt; i++)
++			if (!omittype[i])
++				typemap[i == old0 ? defaulttype
++						: i == defaulttype ? old0 : i]
++					= thistypecnt++;
++
+ 		for (i = 0; i < sizeof indmap / sizeof indmap[0]; ++i)
+ 			indmap[i] = -1;
+ 		thischarcnt = 0;
+-		for (i = 0; i < typecnt; ++i)
++		for (i = old0; i < typecnt; i++)
+ 		{
+ 			char	   *thisabbr;
+ 
+-			if (!writetype[i])
++			if (omittype[i])
+ 				continue;
+ 			if (indmap[abbrinds[i]] >= 0)
+ 				continue;
+@@ -2267,23 +2274,16 @@ writezone(const char *const name, const
+ 		DO(tzh_typecnt);
+ 		DO(tzh_charcnt);
+ #undef DO
+-		for (i = thistimei; i < thistimelim; ++i)
+-			if (pass == 1)
+ 
+-				/*
+-				 * Output an INT32_MIN "transition" if appropriate; see above.
+-				 */
+-				puttzcode(((ats[i] < PG_INT32_MIN) ?
+-						   PG_INT32_MIN : ats[i]), fp);
+-			else
++		/* PG: print current timezone abbreviations if requested */
++		if (print_abbrevs && pass == 2)
++		{
++			/* Print "type" data for periods ending after print_cutoff */
++			for (i = thistimei; i < thistimelim; ++i)
+ 			{
+-				puttzcode64(ats[i], fp);
+-
+-				/* Print current timezone abbreviations if requested */
+-				if (print_abbrevs &&
+-					(i == thistimelim - 1 || ats[i + 1] > print_cutoff))
++				if (i == thistimelim - 1 || ats[i + 1] > print_cutoff)
+ 				{
+-					unsigned char tm = typemap[types[i]];
++					unsigned char tm = types[i];
+ 					char	   *thisabbrev = &thischars[indmap[abbrinds[tm]]];
+ 
+ 					/* filter out assorted junk entries */
+@@ -2295,6 +2295,32 @@ writezone(const char *const name, const
+ 								isdsts[tm] ? "\tD" : "");
+ 				}
+ 			}
++			/* Print the default type if we have no transitions at all */
++			if (thistimei >= thistimelim)
++			{
++				unsigned char tm = defaulttype;
++				char	   *thisabbrev = &thischars[indmap[abbrinds[tm]]];
++
++				/* filter out assorted junk entries */
++				if (strcmp(thisabbrev, GRANDPARENTED) != 0 &&
++					strcmp(thisabbrev, "zzz") != 0)
++					fprintf(stdout, "%s\t" INT64_FORMAT "%s\n",
++							thisabbrev,
++							gmtoffs[tm],
++							isdsts[tm] ? "\tD" : "");
++			}
++		}
++
++		for (i = thistimei; i < thistimelim; ++i)
++			if (pass == 1)
++
++				/*
++				 * Output an INT32_MIN "transition" if appropriate; see above.
++				 */
++				puttzcode(((ats[i] < PG_INT32_MIN) ?
++						   PG_INT32_MIN : ats[i]), fp);
++			else
++				puttzcode64(ats[i], fp);
+ 		for (i = thistimei; i < thistimelim; ++i)
+ 		{
+ 			unsigned char uc;
+@@ -2302,8 +2328,8 @@ writezone(const char *const name, const
+ 			uc = typemap[types[i]];
+ 			fwrite(&uc, sizeof uc, 1, fp);
+ 		}
+-		for (i = 0; i < typecnt; ++i)
+-			if (writetype[i])
++		for (i = old0; i < typecnt; i++)
++			if (!omittype[i])
+ 			{
+ 				puttzcode(gmtoffs[i], fp);
+ 				putc(isdsts[i], fp);
+@@ -2346,12 +2372,13 @@ writezone(const char *const name, const
+ 				puttzcode64(todo, fp);
+ 			puttzcode(corr[i], fp);
+ 		}
+-		for (i = 0; i < typecnt; ++i)
+-			if (writetype[i])
++		for (i = old0; i < typecnt; i++)
++			if (!omittype[i])
+ 				putc(ttisstds[i], fp);
+-		for (i = 0; i < typecnt; ++i)
+-			if (writetype[i])
++		for (i = old0; i < typecnt; i++)
++			if (!omittype[i])
+ 				putc(ttisgmts[i], fp);
++		swaptypes(old0, defaulttype);
+ 	}
+ 	fprintf(fp, "\n%s\n", string);
+ 	close_file(fp, directory, name);
+@@ -2757,6 +2784,7 @@ outzone(const struct zone *zpfirst, ptrd
+ 	zic_t		one = 1;
+ 	zic_t		y2038_boundary = one << 31;
+ 	zic_t		max_year0;
++	int			defaulttype = -1;
+ 
+ 	max_abbr_len = 2 + max_format_len + max_abbrvar_len;
+ 	max_envvar_len = 2 * max_abbr_len + 5 * 9;
+@@ -2880,9 +2908,9 @@ outzone(const struct zone *zpfirst, ptrd
+ 		 */
+ 		stdoff = 0;
+ 		zp = &zpfirst[i];
+-		usestart = i > 0 && (zp - 1)->z_untiltime > early_time;
++		usestart = i > 0 && (zp - 1)->z_untiltime > min_time;
+ 		useuntil = i < (zonecount - 1);
+-		if (useuntil && zp->z_untiltime <= early_time)
++		if (useuntil && zp->z_untiltime <= min_time)
+ 			continue;
+ 		gmtoff = zp->z_gmtoff;
+ 		eat(zp->z_filename, zp->z_linenum);
+@@ -2901,7 +2929,7 @@ outzone(const struct zone *zpfirst, ptrd
+ 				usestart = false;
+ 			}
+ 			else
+-				addtt(early_time, type);
++				defaulttype = type;
+ 		}
+ 		else
+ 			for (year = min_year; year <= max_year; ++year)
+@@ -3032,6 +3060,8 @@ outzone(const struct zone *zpfirst, ptrd
+ 					offset = oadd(zp->z_gmtoff, rp->r_stdoff);
+ 					type = addtype(offset, ab, rp->r_isdst,
+ 								   rp->r_todisstd, rp->r_todisgmt);
++					if (defaulttype < 0 && !rp->r_isdst)
++						defaulttype = type;
+ 					if (rp->r_hiyear == ZIC_MAX
+ 						&& !(0 <= lastatmax
+ 							 && ktime < attypes[lastatmax].at))
+@@ -3050,11 +3080,15 @@ outzone(const struct zone *zpfirst, ptrd
+ 			if (*startbuf == '\0')
+ 				error(_("cannot determine time zone abbreviation to use just after until time"));
+ 			else
+-				addtt(starttime,
+-					  addtype(startoff, startbuf,
+-							  startoff != zp->z_gmtoff,
+-							  startttisstd,
+-							  startttisgmt));
++			{
++				bool		isdst = startoff != zp->z_gmtoff;
++
++				type = addtype(startoff, startbuf, isdst,
++							   startttisstd, startttisgmt);
++				if (defaulttype < 0 && !isdst)
++					defaulttype = type;
++				addtt(starttime, type);
++			}
+ 		}
+ 
+ 		/*
+@@ -3071,6 +3105,8 @@ outzone(const struct zone *zpfirst, ptrd
+ 				starttime = tadd(starttime, -gmtoff);
+ 		}
+ 	}
++	if (defaulttype < 0)
++		defaulttype = 0;
+ 	if (0 <= lastatmax)
+ 		attypes[lastatmax].dontmerge = true;
+ 	if (do_extend)
+@@ -3100,7 +3136,7 @@ outzone(const struct zone *zpfirst, ptrd
+ 			attypes[timecnt - 1].dontmerge = true;
+ 		}
+ 	}
+-	writezone(zpfirst->z_name, envvar, version);
++	writezone(zpfirst->z_name, envvar, version, defaulttype);
+ 	free(startbuf);
+ 	free(ab);
+ 	free(envvar);
+@@ -3109,21 +3145,6 @@ outzone(const struct zone *zpfirst, ptrd
+ static void
+ addtt(zic_t starttime, int type)
+ {
+-	if (starttime <= early_time
+-		|| (timecnt == 1 && attypes[0].at < early_time))
+-	{
+-		gmtoffs[0] = gmtoffs[type];
+-		isdsts[0] = isdsts[type];
+-		ttisstds[0] = ttisstds[type];
+-		ttisgmts[0] = ttisgmts[type];
+-		if (abbrinds[type] != 0)
+-			strcpy(chars, &chars[abbrinds[type]]);
+-		abbrinds[0] = 0;
+-		charcnt = strlen(chars) + 1;
+-		typecnt = 1;
+-		timecnt = 0;
+-		type = 0;
+-	}
+ 	attypes = growalloc(attypes, sizeof *attypes, timecnt, &timecnt_alloc);
+ 	attypes[timecnt].at = starttime;
+ 	attypes[timecnt].dontmerge = false;
+@@ -3361,7 +3382,7 @@ is_alpha(char a)
+ }
+ 
+ /* If A is an uppercase character in the C locale, return its lowercase
+- * counterpart.  Otherwise, return A.  */
++   counterpart.  Otherwise, return A.  */
+ static char
+ lowerit(char a)
+ {
+@@ -3628,6 +3649,18 @@ rpytime(const struct rule *rp, zic_t wan
+ 	dayoff = 0;
+ 	m = TM_JANUARY;
+ 	y = EPOCH_YEAR;
++	if (y < wantedy)
++	{
++		wantedy -= y;
++		dayoff = (wantedy / YEARSPERREPEAT) * (SECSPERREPEAT / SECSPERDAY);
++		wantedy %= YEARSPERREPEAT;
++		wantedy += y;
++	}
++	else if (wantedy < 0)
++	{
++		dayoff = (wantedy / YEARSPERREPEAT) * (SECSPERREPEAT / SECSPERDAY);
++		wantedy %= YEARSPERREPEAT;
++	}
+ 	while (wantedy != y)
+ 	{
+ 		if (wantedy > y)
+@@ -3706,7 +3739,6 @@ will not work with pre-2004 versions of
+ 	if (dayoff > max_time / SECSPERDAY)
+ 		return max_time;
+ 	t = (zic_t) dayoff * SECSPERDAY;
+-
+ 	return tadd(t, rp->r_tod);
+ }
+ 
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch
new file mode 100644
index 0000000..41e763c
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch
@@ -0,0 +1,6452 @@
+From 13877d30f2ec93f6043937f76af207dcc614a4e7 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Fri, 19 Oct 2018 17:01:34 -0400
+Subject: [PATCH] Update time zone data files to tzdata release 2018f.
+
+DST law changes in Chile, Fiji, and Russia (Volgograd).
+Historical corrections for China, Japan, Macau, and North Korea.
+
+Note: like the previous tzdata update, this involves a depressingly
+large amount of semantically-meaningless churn in tzdata.zi.  That
+is a consequence of upstream's data compression method assigning
+unstable abbreviations to DST rulesets.  I complained about that
+to them last time, and this version now uses an assignment method
+that pays some heed to not changing abbreviations unnecessarily.
+So hopefully, that'll be better going forward.
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/timezone/data/tzdata.zi      | 5273 +++++++++++++++++++-------------------
+ src/timezone/known_abbrevs.txt   |    1 +
+ src/timezone/tznames/America.txt |    3 +
+ src/timezone/tznames/Asia.txt    |    4 +
+ src/timezone/tznames/Default     |    3 +
+ src/timezone/tznames/Pacific.txt |    3 +
+ 6 files changed, 2660 insertions(+), 2627 deletions(-)
+
+diff --git a/src/timezone/data/tzdata.zi b/src/timezone/data/tzdata.zi
+index c470112..6d98902 100644
+--- a/src/timezone/data/tzdata.zi
++++ b/src/timezone/data/tzdata.zi
+@@ -1,36 +1,36 @@
+-# version 2018e
++# version 2018f
+ # This zic input file is in the public domain.
+-R A 1916 o - Jun 14 23s 1 S
+-R A 1916 1919 - O Sun>=1 23s 0 -
+-R A 1917 o - Mar 24 23s 1 S
+-R A 1918 o - Mar 9 23s 1 S
+-R A 1919 o - Mar 1 23s 1 S
+-R A 1920 o - F 14 23s 1 S
+-R A 1920 o - O 23 23s 0 -
+-R A 1921 o - Mar 14 23s 1 S
+-R A 1921 o - Jun 21 23s 0 -
+-R A 1939 o - S 11 23s 1 S
+-R A 1939 o - N 19 1 0 -
+-R A 1944 1945 - Ap M>=1 2 1 S
+-R A 1944 o - O 8 2 0 -
+-R A 1945 o - S 16 1 0 -
+-R A 1971 o - Ap 25 23s 1 S
+-R A 1971 o - S 26 23s 0 -
+-R A 1977 o - May 6 0 1 S
+-R A 1977 o - O 21 0 0 -
+-R A 1978 o - Mar 24 1 1 S
+-R A 1978 o - S 22 3 0 -
+-R A 1980 o - Ap 25 0 1 S
+-R A 1980 o - O 31 2 0 -
++R d 1916 o - Jun 14 23s 1 S
++R d 1916 1919 - O Sun>=1 23s 0 -
++R d 1917 o - Mar 24 23s 1 S
++R d 1918 o - Mar 9 23s 1 S
++R d 1919 o - Mar 1 23s 1 S
++R d 1920 o - F 14 23s 1 S
++R d 1920 o - O 23 23s 0 -
++R d 1921 o - Mar 14 23s 1 S
++R d 1921 o - Jun 21 23s 0 -
++R d 1939 o - S 11 23s 1 S
++R d 1939 o - N 19 1 0 -
++R d 1944 1945 - Ap M>=1 2 1 S
++R d 1944 o - O 8 2 0 -
++R d 1945 o - S 16 1 0 -
++R d 1971 o - Ap 25 23s 1 S
++R d 1971 o - S 26 23s 0 -
++R d 1977 o - May 6 0 1 S
++R d 1977 o - O 21 0 0 -
++R d 1978 o - Mar 24 1 1 S
++R d 1978 o - S 22 3 0 -
++R d 1980 o - Ap 25 0 1 S
++R d 1980 o - O 31 2 0 -
+ Z Africa/Algiers 0:12:12 - LMT 1891 Mar 15 0:1
+ 0:9:21 - PMT 1911 Mar 11
+-0 A WE%sT 1940 F 25 2
+-1 A CE%sT 1946 O 7
++0 d WE%sT 1940 F 25 2
++1 d CE%sT 1946 O 7
+ 0 - WET 1956 Ja 29
+ 1 - CET 1963 Ap 14
+-0 A WE%sT 1977 O 21
+-1 A CE%sT 1979 O 26
+-0 A WE%sT 1981 May
++0 d WE%sT 1977 O 21
++1 d CE%sT 1979 O 26
++0 d WE%sT 1981 May
+ 1 - CET
+ Z Atlantic/Cape_Verde -1:34:4 - LMT 1912 Ja 1 2u
+ -2 - -02 1942 S
+@@ -52,44 +52,44 @@ Li Africa/Abidjan Africa/Lome
+ Li Africa/Abidjan Africa/Nouakchott
+ Li Africa/Abidjan Africa/Ouagadougou
+ Li Africa/Abidjan Atlantic/St_Helena
+-R B 1940 o - Jul 15 0 1 S
+-R B 1940 o - O 1 0 0 -
+-R B 1941 o - Ap 15 0 1 S
+-R B 1941 o - S 16 0 0 -
+-R B 1942 1944 - Ap 1 0 1 S
+-R B 1942 o - O 27 0 0 -
+-R B 1943 1945 - N 1 0 0 -
+-R B 1945 o - Ap 16 0 1 S
+-R B 1957 o - May 10 0 1 S
+-R B 1957 1958 - O 1 0 0 -
+-R B 1958 o - May 1 0 1 S
+-R B 1959 1981 - May 1 1 1 S
+-R B 1959 1965 - S 30 3 0 -
+-R B 1966 1994 - O 1 3 0 -
+-R B 1982 o - Jul 25 1 1 S
+-R B 1983 o - Jul 12 1 1 S
+-R B 1984 1988 - May 1 1 1 S
+-R B 1989 o - May 6 1 1 S
+-R B 1990 1994 - May 1 1 1 S
+-R B 1995 2010 - Ap lastF 0s 1 S
+-R B 1995 2005 - S lastTh 24 0 -
+-R B 2006 o - S 21 24 0 -
+-R B 2007 o - S Th>=1 24 0 -
+-R B 2008 o - Au lastTh 24 0 -
+-R B 2009 o - Au 20 24 0 -
+-R B 2010 o - Au 10 24 0 -
+-R B 2010 o - S 9 24 1 S
+-R B 2010 o - S lastTh 24 0 -
+-R B 2014 o - May 15 24 1 S
+-R B 2014 o - Jun 26 24 0 -
+-R B 2014 o - Jul 31 24 1 S
+-R B 2014 o - S lastTh 24 0 -
++R K 1940 o - Jul 15 0 1 S
++R K 1940 o - O 1 0 0 -
++R K 1941 o - Ap 15 0 1 S
++R K 1941 o - S 16 0 0 -
++R K 1942 1944 - Ap 1 0 1 S
++R K 1942 o - O 27 0 0 -
++R K 1943 1945 - N 1 0 0 -
++R K 1945 o - Ap 16 0 1 S
++R K 1957 o - May 10 0 1 S
++R K 1957 1958 - O 1 0 0 -
++R K 1958 o - May 1 0 1 S
++R K 1959 1981 - May 1 1 1 S
++R K 1959 1965 - S 30 3 0 -
++R K 1966 1994 - O 1 3 0 -
++R K 1982 o - Jul 25 1 1 S
++R K 1983 o - Jul 12 1 1 S
++R K 1984 1988 - May 1 1 1 S
++R K 1989 o - May 6 1 1 S
++R K 1990 1994 - May 1 1 1 S
++R K 1995 2010 - Ap lastF 0s 1 S
++R K 1995 2005 - S lastTh 24 0 -
++R K 2006 o - S 21 24 0 -
++R K 2007 o - S Th>=1 24 0 -
++R K 2008 o - Au lastTh 24 0 -
++R K 2009 o - Au 20 24 0 -
++R K 2010 o - Au 10 24 0 -
++R K 2010 o - S 9 24 1 S
++R K 2010 o - S lastTh 24 0 -
++R K 2014 o - May 15 24 1 S
++R K 2014 o - Jun 26 24 0 -
++R K 2014 o - Jul 31 24 1 S
++R K 2014 o - S lastTh 24 0 -
+ Z Africa/Cairo 2:5:9 - LMT 1900 O
+-2 B EE%sT
+-R C 1920 1942 - S 1 0 0:20 -
+-R C 1920 1942 - D 31 0 0 -
++2 K EE%sT
++R GH 1920 1942 - S 1 0 0:20 -
++R GH 1920 1942 - D 31 0 0 -
+ Z Africa/Accra -0:0:52 - LMT 1918
+-0 C GMT/+0020
++0 GH GMT/+0020
+ Z Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
+ -1 - -01 1975
+ 0 - GMT
+@@ -111,99 +111,99 @@ Z Africa/Monrovia -0:43:8 - LMT 1882
+ -0:43:8 - MMT 1919 Mar
+ -0:44:30 - MMT 1972 Ja 7
+ 0 - GMT
+-R D 1951 o - O 14 2 1 S
+-R D 1952 o - Ja 1 0 0 -
+-R D 1953 o - O 9 2 1 S
+-R D 1954 o - Ja 1 0 0 -
+-R D 1955 o - S 30 0 1 S
+-R D 1956 o - Ja 1 0 0 -
+-R D 1982 1984 - Ap 1 0 1 S
+-R D 1982 1985 - O 1 0 0 -
+-R D 1985 o - Ap 6 0 1 S
+-R D 1986 o - Ap 4 0 1 S
+-R D 1986 o - O 3 0 0 -
+-R D 1987 1989 - Ap 1 0 1 S
+-R D 1987 1989 - O 1 0 0 -
+-R D 1997 o - Ap 4 0 1 S
+-R D 1997 o - O 4 0 0 -
+-R D 2013 o - Mar lastF 1 1 S
+-R D 2013 o - O lastF 2 0 -
++R L 1951 o - O 14 2 1 S
++R L 1952 o - Ja 1 0 0 -
++R L 1953 o - O 9 2 1 S
++R L 1954 o - Ja 1 0 0 -
++R L 1955 o - S 30 0 1 S
++R L 1956 o - Ja 1 0 0 -
++R L 1982 1984 - Ap 1 0 1 S
++R L 1982 1985 - O 1 0 0 -
++R L 1985 o - Ap 6 0 1 S
++R L 1986 o - Ap 4 0 1 S
++R L 1986 o - O 3 0 0 -
++R L 1987 1989 - Ap 1 0 1 S
++R L 1987 1989 - O 1 0 0 -
++R L 1997 o - Ap 4 0 1 S
++R L 1997 o - O 4 0 0 -
++R L 2013 o - Mar lastF 1 1 S
++R L 2013 o - O lastF 2 0 -
+ Z Africa/Tripoli 0:52:44 - LMT 1920
+-1 D CE%sT 1959
++1 L CE%sT 1959
+ 2 - EET 1982
+-1 D CE%sT 1990 May 4
++1 L CE%sT 1990 May 4
+ 2 - EET 1996 S 30
+-1 D CE%sT 1997 O 4
++1 L CE%sT 1997 O 4
+ 2 - EET 2012 N 10 2
+-1 D CE%sT 2013 O 25 2
++1 L CE%sT 2013 O 25 2
+ 2 - EET
+-R E 1982 o - O 10 0 1 -
+-R E 1983 o - Mar 21 0 0 -
+-R E 2008 o - O lastSun 2 1 -
+-R E 2009 o - Mar lastSun 2 0 -
++R MU 1982 o - O 10 0 1 -
++R MU 1983 o - Mar 21 0 0 -
++R MU 2008 o - O lastSun 2 1 -
++R MU 2009 o - Mar lastSun 2 0 -
+ Z Indian/Mauritius 3:50 - LMT 1907
+-4 E +04/+05
+-R F 1939 o - S 12 0 1 S
+-R F 1939 o - N 19 0 0 -
+-R F 1940 o - F 25 0 1 S
+-R F 1945 o - N 18 0 0 -
+-R F 1950 o - Jun 11 0 1 S
+-R F 1950 o - O 29 0 0 -
+-R F 1967 o - Jun 3 12 1 S
+-R F 1967 o - O 1 0 0 -
+-R F 1974 o - Jun 24 0 1 S
+-R F 1974 o - S 1 0 0 -
+-R F 1976 1977 - May 1 0 1 S
+-R F 1976 o - Au 1 0 0 -
+-R F 1977 o - S 28 0 0 -
+-R F 1978 o - Jun 1 0 1 S
+-R F 1978 o - Au 4 0 0 -
+-R F 2008 o - Jun 1 0 1 S
+-R F 2008 o - S 1 0 0 -
+-R F 2009 o - Jun 1 0 1 S
+-R F 2009 o - Au 21 0 0 -
+-R F 2010 o - May 2 0 1 S
+-R F 2010 o - Au 8 0 0 -
+-R F 2011 o - Ap 3 0 1 S
+-R F 2011 o - Jul 31 0 0 -
+-R F 2012 2013 - Ap lastSun 2 1 S
+-R F 2012 o - Jul 20 3 0 -
+-R F 2012 o - Au 20 2 1 S
+-R F 2012 o - S 30 3 0 -
+-R F 2013 o - Jul 7 3 0 -
+-R F 2013 o - Au 10 2 1 S
+-R F 2013 ma - O lastSun 3 0 -
+-R F 2014 2021 - Mar lastSun 2 1 S
+-R F 2014 o - Jun 28 3 0 -
+-R F 2014 o - Au 2 2 1 S
+-R F 2015 o - Jun 14 3 0 -
+-R F 2015 o - Jul 19 2 1 S
+-R F 2016 o - Jun 5 3 0 -
+-R F 2016 o - Jul 10 2 1 S
+-R F 2017 o - May 21 3 0 -
+-R F 2017 o - Jul 2 2 1 S
+-R F 2018 o - May 13 3 0 -
+-R F 2018 o - Jun 17 2 1 S
+-R F 2019 o - May 5 3 0 -
+-R F 2019 o - Jun 9 2 1 S
+-R F 2020 o - Ap 19 3 0 -
+-R F 2020 o - May 24 2 1 S
+-R F 2021 o - Ap 11 3 0 -
+-R F 2021 o - May 16 2 1 S
+-R F 2022 o - May 8 2 1 S
+-R F 2023 o - Ap 23 2 1 S
+-R F 2024 o - Ap 14 2 1 S
+-R F 2025 o - Ap 6 2 1 S
+-R F 2026 ma - Mar lastSun 2 1 S
+-R F 2036 o - O 19 3 0 -
+-R F 2037 o - O 4 3 0 -
++4 MU +04/+05
++R M 1939 o - S 12 0 1 S
++R M 1939 o - N 19 0 0 -
++R M 1940 o - F 25 0 1 S
++R M 1945 o - N 18 0 0 -
++R M 1950 o - Jun 11 0 1 S
++R M 1950 o - O 29 0 0 -
++R M 1967 o - Jun 3 12 1 S
++R M 1967 o - O 1 0 0 -
++R M 1974 o - Jun 24 0 1 S
++R M 1974 o - S 1 0 0 -
++R M 1976 1977 - May 1 0 1 S
++R M 1976 o - Au 1 0 0 -
++R M 1977 o - S 28 0 0 -
++R M 1978 o - Jun 1 0 1 S
++R M 1978 o - Au 4 0 0 -
++R M 2008 o - Jun 1 0 1 S
++R M 2008 o - S 1 0 0 -
++R M 2009 o - Jun 1 0 1 S
++R M 2009 o - Au 21 0 0 -
++R M 2010 o - May 2 0 1 S
++R M 2010 o - Au 8 0 0 -
++R M 2011 o - Ap 3 0 1 S
++R M 2011 o - Jul 31 0 0 -
++R M 2012 2013 - Ap lastSun 2 1 S
++R M 2012 o - Jul 20 3 0 -
++R M 2012 o - Au 20 2 1 S
++R M 2012 o - S 30 3 0 -
++R M 2013 o - Jul 7 3 0 -
++R M 2013 o - Au 10 2 1 S
++R M 2013 ma - O lastSun 3 0 -
++R M 2014 2021 - Mar lastSun 2 1 S
++R M 2014 o - Jun 28 3 0 -
++R M 2014 o - Au 2 2 1 S
++R M 2015 o - Jun 14 3 0 -
++R M 2015 o - Jul 19 2 1 S
++R M 2016 o - Jun 5 3 0 -
++R M 2016 o - Jul 10 2 1 S
++R M 2017 o - May 21 3 0 -
++R M 2017 o - Jul 2 2 1 S
++R M 2018 o - May 13 3 0 -
++R M 2018 o - Jun 17 2 1 S
++R M 2019 o - May 5 3 0 -
++R M 2019 o - Jun 9 2 1 S
++R M 2020 o - Ap 19 3 0 -
++R M 2020 o - May 24 2 1 S
++R M 2021 o - Ap 11 3 0 -
++R M 2021 o - May 16 2 1 S
++R M 2022 o - May 8 2 1 S
++R M 2023 o - Ap 23 2 1 S
++R M 2024 o - Ap 14 2 1 S
++R M 2025 o - Ap 6 2 1 S
++R M 2026 ma - Mar lastSun 2 1 S
++R M 2036 o - O 19 3 0 -
++R M 2037 o - O 4 3 0 -
+ Z Africa/Casablanca -0:30:20 - LMT 1913 O 26
+-0 F WE%sT 1984 Mar 16
++0 M WE%sT 1984 Mar 16
+ 1 - CET 1986
+-0 F WE%sT
++0 M WE%sT
+ Z Africa/El_Aaiun -0:52:48 - LMT 1934
+ -1 - -01 1976 Ap 14
+-0 F WE%sT
++0 M WE%sT
+ Z Africa/Maputo 2:10:20 - LMT 1903 Mar
+ 2 - CAT
+ Li Africa/Maputo Africa/Blantyre
+@@ -213,15 +213,15 @@ Li Africa/Maputo Africa/Harare
+ Li Africa/Maputo Africa/Kigali
+ Li Africa/Maputo Africa/Lubumbashi
+ Li Africa/Maputo Africa/Lusaka
+-R G 1994 o - Mar 21 0 -1 WAT
+-R G 1994 2017 - S Sun>=1 2 0 CAT
+-R G 1995 2017 - Ap Sun>=1 2 -1 WAT
++R NA 1994 o - Mar 21 0 -1 WAT
++R NA 1994 2017 - S Sun>=1 2 0 CAT
++R NA 1995 2017 - Ap Sun>=1 2 -1 WAT
+ Z Africa/Windhoek 1:8:24 - LMT 1892 F 8
+ 1:30 - +0130 1903 Mar
+ 2 - SAST 1942 S 20 2
+ 2 1 SAST 1943 Mar 21 2
+ 2 - SAST 1990 Mar 21
+-2 G %s
++2 NA %s
+ Z Africa/Lagos 0:13:36 - LMT 1919 S
+ 1 - WAT
+ Li Africa/Lagos Africa/Bangui
+@@ -241,52 +241,52 @@ Z Africa/Sao_Tome 0:26:56 - LMT 1884
+ 1 - WAT
+ Z Indian/Mahe 3:41:48 - LMT 1906 Jun
+ 4 - +04
+-R H 1942 1943 - S Sun>=15 2 1 -
+-R H 1943 1944 - Mar Sun>=15 2 0 -
++R SA 1942 1943 - S Sun>=15 2 1 -
++R SA 1943 1944 - Mar Sun>=15 2 0 -
+ Z Africa/Johannesburg 1:52 - LMT 1892 F 8
+ 1:30 - SAST 1903 Mar
+-2 H SAST
++2 SA SAST
+ Li Africa/Johannesburg Africa/Maseru
+ Li Africa/Johannesburg Africa/Mbabane
+-R I 1970 o - May 1 0 1 S
+-R I 1970 1985 - O 15 0 0 -
+-R I 1971 o - Ap 30 0 1 S
+-R I 1972 1985 - Ap lastSun 0 1 S
++R SD 1970 o - May 1 0 1 S
++R SD 1970 1985 - O 15 0 0 -
++R SD 1971 o - Ap 30 0 1 S
++R SD 1972 1985 - Ap lastSun 0 1 S
+ Z Africa/Khartoum 2:10:8 - LMT 1931
+-2 I CA%sT 2000 Ja 15 12
++2 SD CA%sT 2000 Ja 15 12
+ 3 - EAT 2017 N
+ 2 - CAT
+ Z Africa/Juba 2:6:28 - LMT 1931
+-2 I CA%sT 2000 Ja 15 12
++2 SD CA%sT 2000 Ja 15 12
+ 3 - EAT
+-R J 1939 o - Ap 15 23s 1 S
+-R J 1939 o - N 18 23s 0 -
+-R J 1940 o - F 25 23s 1 S
+-R J 1941 o - O 6 0 0 -
+-R J 1942 o - Mar 9 0 1 S
+-R J 1942 o - N 2 3 0 -
+-R J 1943 o - Mar 29 2 1 S
+-R J 1943 o - Ap 17 2 0 -
+-R J 1943 o - Ap 25 2 1 S
+-R J 1943 o - O 4 2 0 -
+-R J 1944 1945 - Ap M>=1 2 1 S
+-R J 1944 o - O 8 0 0 -
+-R J 1945 o - S 16 0 0 -
+-R J 1977 o - Ap 30 0s 1 S
+-R J 1977 o - S 24 0s 0 -
+-R J 1978 o - May 1 0s 1 S
+-R J 1978 o - O 1 0s 0 -
+-R J 1988 o - Jun 1 0s 1 S
+-R J 1988 1990 - S lastSun 0s 0 -
+-R J 1989 o - Mar 26 0s 1 S
+-R J 1990 o - May 1 0s 1 S
+-R J 2005 o - May 1 0s 1 S
+-R J 2005 o - S 30 1s 0 -
+-R J 2006 2008 - Mar lastSun 2s 1 S
+-R J 2006 2008 - O lastSun 2s 0 -
++R n 1939 o - Ap 15 23s 1 S
++R n 1939 o - N 18 23s 0 -
++R n 1940 o - F 25 23s 1 S
++R n 1941 o - O 6 0 0 -
++R n 1942 o - Mar 9 0 1 S
++R n 1942 o - N 2 3 0 -
++R n 1943 o - Mar 29 2 1 S
++R n 1943 o - Ap 17 2 0 -
++R n 1943 o - Ap 25 2 1 S
++R n 1943 o - O 4 2 0 -
++R n 1944 1945 - Ap M>=1 2 1 S
++R n 1944 o - O 8 0 0 -
++R n 1945 o - S 16 0 0 -
++R n 1977 o - Ap 30 0s 1 S
++R n 1977 o - S 24 0s 0 -
++R n 1978 o - May 1 0s 1 S
++R n 1978 o - O 1 0s 0 -
++R n 1988 o - Jun 1 0s 1 S
++R n 1988 1990 - S lastSun 0s 0 -
++R n 1989 o - Mar 26 0s 1 S
++R n 1990 o - May 1 0s 1 S
++R n 2005 o - May 1 0s 1 S
++R n 2005 o - S 30 1s 0 -
++R n 2006 2008 - Mar lastSun 2s 1 S
++R n 2006 2008 - O lastSun 2s 0 -
+ Z Africa/Tunis 0:40:44 - LMT 1881 May 12
+ 0:9:21 - PMT 1911 Mar 11
+-1 J CE%sT
++1 n CE%sT
+ Z Antarctica/Casey 0 - -00 1969
+ 8 - +08 2009 O 18 2
+ 11 - +11 2010 Mar 5 2
+@@ -314,10 +314,10 @@ Z Antarctica/DumontDUrville 0 - -00 1947
+ 10 - +10
+ Z Antarctica/Syowa 0 - -00 1957 Ja 29
+ 3 - +03
+-R K 2005 ma - Mar lastSun 1u 2 +02
+-R K 2004 ma - O lastSun 1u 0 +00
++R Tr 2005 ma - Mar lastSun 1u 2 +02
++R Tr 2004 ma - O lastSun 1u 0 +00
+ Z Antarctica/Troll 0 - -00 2005 F 12
+-0 K %s
++0 Tr %s
+ Z Antarctica/Vostok 0 - -00 1957 D 16
+ 6 - +06
+ Z Antarctica/Rothera 0 - -00 1976 D
+@@ -325,33 +325,33 @@ Z Antarctica/Rothera 0 - -00 1976 D
+ Z Asia/Kabul 4:36:48 - LMT 1890
+ 4 - +04 1945
+ 4:30 - +0430
+-R L 2011 o - Mar lastSun 2s 1 -
+-R L 2011 o - O lastSun 2s 0 -
++R AM 2011 o - Mar lastSun 2s 1 -
++R AM 2011 o - O lastSun 2s 0 -
+ Z Asia/Yerevan 2:58 - LMT 1924 May 2
+ 3 - +03 1957 Mar
+-4 M +04/+05 1991 Mar 31 2s
+-3 M +03/+04 1995 S 24 2s
++4 R +04/+05 1991 Mar 31 2s
++3 R +03/+04 1995 S 24 2s
+ 4 - +04 1997
+-4 M +04/+05 2011
+-4 L +04/+05
+-R N 1997 2015 - Mar lastSun 4 1 -
+-R N 1997 2015 - O lastSun 5 0 -
++4 R +04/+05 2011
++4 AM +04/+05
++R AZ 1997 2015 - Mar lastSun 4 1 -
++R AZ 1997 2015 - O lastSun 5 0 -
+ Z Asia/Baku 3:19:24 - LMT 1924 May 2
+ 3 - +03 1957 Mar
+-4 M +04/+05 1991 Mar 31 2s
+-3 M +03/+04 1992 S lastSun 2s
++4 R +04/+05 1991 Mar 31 2s
++3 R +03/+04 1992 S lastSun 2s
+ 4 - +04 1996
+-4 O +04/+05 1997
+-4 N +04/+05
+-R P 2009 o - Jun 19 23 1 -
+-R P 2009 o - D 31 24 0 -
++4 E +04/+05 1997
++4 AZ +04/+05
++R BD 2009 o - Jun 19 23 1 -
++R BD 2009 o - D 31 24 0 -
+ Z Asia/Dhaka 6:1:40 - LMT 1890
+ 5:53:20 - HMT 1941 O
+ 6:30 - +0630 1942 May 15
+ 5:30 - +0530 1942 S
+ 6:30 - +0630 1951 S 30
+ 6 - +06 2009
+-6 P +06/+07
++6 BD +06/+07
+ Z Asia/Thimphu 5:58:36 - LMT 1947 Au 15
+ 5:30 - +0530 1987 O
+ 6 - +06
+@@ -366,103 +366,127 @@ Z Asia/Yangon 6:24:47 - LMT 1880
+ 6:30 - +0630 1942 May
+ 9 - +09 1945 May 3
+ 6:30 - +0630
+-R Q 1940 o - Jun 3 0 1 D
+-R Q 1940 1941 - O 1 0 0 S
+-R Q 1941 o - Mar 16 0 1 D
+-R R 1986 o - May 4 0 1 D
+-R R 1986 1991 - S Sun>=11 0 0 S
+-R R 1987 1991 - Ap Sun>=10 0 1 D
++R Sh 1940 o - Jun 1 0 1 D
++R Sh 1940 o - O 12 24 0 S
++R Sh 1941 o - Mar 15 0 1 D
++R Sh 1941 o - N 1 24 0 S
++R Sh 1942 o - Ja 31 0 1 D
++R Sh 1945 o - S 1 24 0 S
++R Sh 1946 o - May 15 0 1 D
++R Sh 1946 o - S 30 24 0 S
++R Sh 1947 o - Ap 15 0 1 D
++R Sh 1947 o - O 31 24 0 S
++R Sh 1948 1949 - May 1 0 1 D
++R Sh 1948 1949 - S 30 24 0 S
++R CN 1986 o - May 4 2 1 D
++R CN 1986 1991 - S Sun>=11 2 0 S
++R CN 1987 1991 - Ap Sun>=11 2 1 D
+ Z Asia/Shanghai 8:5:43 - LMT 1901
+-8 Q C%sT 1949
+-8 R C%sT
++8 Sh C%sT 1949 May 28
++8 CN C%sT
+ Z Asia/Urumqi 5:50:20 - LMT 1928
+ 6 - +06
+-R S 1941 o - Ap 1 3:30 1 S
+-R S 1941 o - S 30 3:30 0 -
+-R S 1946 o - Ap 20 3:30 1 S
+-R S 1946 o - D 1 3:30 0 -
+-R S 1947 o - Ap 13 3:30 1 S
+-R S 1947 o - D 30 3:30 0 -
+-R S 1948 o - May 2 3:30 1 S
+-R S 1948 1951 - O lastSun 3:30 0 -
+-R S 1952 o - O 25 3:30 0 -
+-R S 1949 1953 - Ap Sun>=1 3:30 1 S
+-R S 1953 o - N 1 3:30 0 -
+-R S 1954 1964 - Mar Sun>=18 3:30 1 S
+-R S 1954 o - O 31 3:30 0 -
+-R S 1955 1964 - N Sun>=1 3:30 0 -
+-R S 1965 1976 - Ap Sun>=16 3:30 1 S
+-R S 1965 1976 - O Sun>=16 3:30 0 -
+-R S 1973 o - D 30 3:30 1 S
+-R S 1979 o - May Sun>=8 3:30 1 S
+-R S 1979 o - O Sun>=16 3:30 0 -
++R HK 1941 o - Ap 1 3:30 1 S
++R HK 1941 o - S 30 3:30 0 -
++R HK 1946 o - Ap 20 3:30 1 S
++R HK 1946 o - D 1 3:30 0 -
++R HK 1947 o - Ap 13 3:30 1 S
++R HK 1947 o - D 30 3:30 0 -
++R HK 1948 o - May 2 3:30 1 S
++R HK 1948 1951 - O lastSun 3:30 0 -
++R HK 1952 o - O 25 3:30 0 -
++R HK 1949 1953 - Ap Sun>=1 3:30 1 S
++R HK 1953 o - N 1 3:30 0 -
++R HK 1954 1964 - Mar Sun>=18 3:30 1 S
++R HK 1954 o - O 31 3:30 0 -
++R HK 1955 1964 - N Sun>=1 3:30 0 -
++R HK 1965 1976 - Ap Sun>=16 3:30 1 S
++R HK 1965 1976 - O Sun>=16 3:30 0 -
++R HK 1973 o - D 30 3:30 1 S
++R HK 1979 o - May Sun>=8 3:30 1 S
++R HK 1979 o - O Sun>=16 3:30 0 -
+ Z Asia/Hong_Kong 7:36:42 - LMT 1904 O 30
+-8 S HK%sT 1941 D 25
++8 HK HK%sT 1941 D 25
+ 9 - JST 1945 S 15
+-8 S HK%sT
+-R T 1946 o - May 15 0 1 D
+-R T 1946 o - O 1 0 0 S
+-R T 1947 o - Ap 15 0 1 D
+-R T 1947 o - N 1 0 0 S
+-R T 1948 1951 - May 1 0 1 D
+-R T 1948 1951 - O 1 0 0 S
+-R T 1952 o - Mar 1 0 1 D
+-R T 1952 1954 - N 1 0 0 S
+-R T 1953 1959 - Ap 1 0 1 D
+-R T 1955 1961 - O 1 0 0 S
+-R T 1960 1961 - Jun 1 0 1 D
+-R T 1974 1975 - Ap 1 0 1 D
+-R T 1974 1975 - O 1 0 0 S
+-R T 1979 o - Jul 1 0 1 D
+-R T 1979 o - O 1 0 0 S
++8 HK HK%sT
++R f 1946 o - May 15 0 1 D
++R f 1946 o - O 1 0 0 S
++R f 1947 o - Ap 15 0 1 D
++R f 1947 o - N 1 0 0 S
++R f 1948 1951 - May 1 0 1 D
++R f 1948 1951 - O 1 0 0 S
++R f 1952 o - Mar 1 0 1 D
++R f 1952 1954 - N 1 0 0 S
++R f 1953 1959 - Ap 1 0 1 D
++R f 1955 1961 - O 1 0 0 S
++R f 1960 1961 - Jun 1 0 1 D
++R f 1974 1975 - Ap 1 0 1 D
++R f 1974 1975 - O 1 0 0 S
++R f 1979 o - Jul 1 0 1 D
++R f 1979 o - O 1 0 0 S
+ Z Asia/Taipei 8:6 - LMT 1896
+ 8 - CST 1937 O
+ 9 - JST 1945 S 21 1
+-8 T C%sT
+-R U 1961 1962 - Mar Sun>=16 3:30 1 D
+-R U 1961 1964 - N Sun>=1 3:30 0 S
+-R U 1963 o - Mar Sun>=16 0 1 D
+-R U 1964 o - Mar Sun>=16 3:30 1 D
+-R U 1965 o - Mar Sun>=16 0 1 D
+-R U 1965 o - O 31 0 0 S
+-R U 1966 1971 - Ap Sun>=16 3:30 1 D
+-R U 1966 1971 - O Sun>=16 3:30 0 S
+-R U 1972 1974 - Ap Sun>=15 0 1 D
+-R U 1972 1973 - O Sun>=15 0 0 S
+-R U 1974 1977 - O Sun>=15 3:30 0 S
+-R U 1975 1977 - Ap Sun>=15 3:30 1 D
+-R U 1978 1980 - Ap Sun>=15 0 1 D
+-R U 1978 1980 - O Sun>=15 0 0 S
+-Z Asia/Macau 7:34:20 - LMT 1911 D 31 16u
+-8 U C%sT
+-R V 1975 o - Ap 13 0 1 S
+-R V 1975 o - O 12 0 0 -
+-R V 1976 o - May 15 0 1 S
+-R V 1976 o - O 11 0 0 -
+-R V 1977 1980 - Ap Sun>=1 0 1 S
+-R V 1977 o - S 25 0 0 -
+-R V 1978 o - O 2 0 0 -
+-R V 1979 1997 - S lastSun 0 0 -
+-R V 1981 1998 - Mar lastSun 0 1 S
++8 f C%sT
++R _ 1942 1943 - Ap 30 23 1 -
++R _ 1942 o - N 17 23 0 -
++R _ 1943 o - S 30 23 0 S
++R _ 1946 o - Ap 30 23s 1 D
++R _ 1946 o - S 30 23s 0 S
++R _ 1947 o - Ap 19 23s 1 D
++R _ 1947 o - N 30 23s 0 S
++R _ 1948 o - May 2 23s 1 D
++R _ 1948 o - O 31 23s 0 S
++R _ 1949 1950 - Ap Sat>=1 23s 1 D
++R _ 1949 1950 - O lastSat 23s 0 S
++R _ 1951 o - Mar 31 23s 1 D
++R _ 1951 o - O 28 23s 0 S
++R _ 1952 1953 - Ap Sat>=1 23s 1 D
++R _ 1952 o - N 1 23s 0 S
++R _ 1953 1954 - O lastSat 23s 0 S
++R _ 1954 1956 - Mar Sat>=17 23s 1 D
++R _ 1955 o - N 5 23s 0 S
++R _ 1956 1964 - N Sun>=1 3:30 0 S
++R _ 1957 1964 - Mar Sun>=18 3:30 1 D
++R _ 1965 1973 - Ap Sun>=16 3:30 1 D
++R _ 1965 1966 - O Sun>=16 2:30 0 S
++R _ 1967 1976 - O Sun>=16 3:30 0 S
++R _ 1973 o - D 30 3:30 1 D
++R _ 1975 1976 - Ap Sun>=16 3:30 1 D
++R _ 1979 o - May 13 3:30 1 D
++R _ 1979 o - O Sun>=16 3:30 0 S
++Z Asia/Macau 7:34:10 - LMT 1904 O 30
++8 - CST 1941 D 21 23
++9 _ +09/+10 1945 S 30 24
++8 _ C%sT
++R CY 1975 o - Ap 13 0 1 S
++R CY 1975 o - O 12 0 0 -
++R CY 1976 o - May 15 0 1 S
++R CY 1976 o - O 11 0 0 -
++R CY 1977 1980 - Ap Sun>=1 0 1 S
++R CY 1977 o - S 25 0 0 -
++R CY 1978 o - O 2 0 0 -
++R CY 1979 1997 - S lastSun 0 0 -
++R CY 1981 1998 - Mar lastSun 0 1 S
+ Z Asia/Nicosia 2:13:28 - LMT 1921 N 14
+-2 V EE%sT 1998 S
+-2 O EE%sT
++2 CY EE%sT 1998 S
++2 E EE%sT
+ Z Asia/Famagusta 2:15:48 - LMT 1921 N 14
+-2 V EE%sT 1998 S
+-2 O EE%sT 2016 S 8
++2 CY EE%sT 1998 S
++2 E EE%sT 2016 S 8
+ 3 - +03 2017 O 29 1u
+-2 O EE%sT
++2 E EE%sT
+ Li Asia/Nicosia Europe/Nicosia
+ Z Asia/Tbilisi 2:59:11 - LMT 1880
+ 2:59:11 - TBMT 1924 May 2
+ 3 - +03 1957 Mar
+-4 M +04/+05 1991 Mar 31 2s
+-3 M +03/+04 1992
+-3 W +03/+04 1994 S lastSun
+-4 W +04/+05 1996 O lastSun
++4 R +04/+05 1991 Mar 31 2s
++3 R +03/+04 1992
++3 e +03/+04 1994 S lastSun
++4 e +04/+05 1996 O lastSun
+ 4 1 +05 1997 Mar lastSun
+-4 W +04/+05 2004 Jun 27
+-3 M +03/+04 2005 Mar lastSun 2
++4 e +04/+05 2004 Jun 27
++3 R +03/+04 2005 Mar lastSun 2
+ 4 - +04
+ Z Asia/Dili 8:22:20 - LMT 1912
+ 8 - +08 1942 F 21 23
+@@ -504,72 +528,72 @@ Z Asia/Jayapura 9:22:48 - LMT 1932 N
+ 9 - +09 1944 S
+ 9:30 - +0930 1964
+ 9 - WIT
+-R X 1978 1980 - Mar 21 0 1 -
+-R X 1978 o - O 21 0 0 -
+-R X 1979 o - S 19 0 0 -
+-R X 1980 o - S 23 0 0 -
+-R X 1991 o - May 3 0 1 -
+-R X 1992 1995 - Mar 22 0 1 -
+-R X 1991 1995 - S 22 0 0 -
+-R X 1996 o - Mar 21 0 1 -
+-R X 1996 o - S 21 0 0 -
+-R X 1997 1999 - Mar 22 0 1 -
+-R X 1997 1999 - S 22 0 0 -
+-R X 2000 o - Mar 21 0 1 -
+-R X 2000 o - S 21 0 0 -
+-R X 2001 2003 - Mar 22 0 1 -
+-R X 2001 2003 - S 22 0 0 -
+-R X 2004 o - Mar 21 0 1 -
+-R X 2004 o - S 21 0 0 -
+-R X 2005 o - Mar 22 0 1 -
+-R X 2005 o - S 22 0 0 -
+-R X 2008 o - Mar 21 0 1 -
+-R X 2008 o - S 21 0 0 -
+-R X 2009 2011 - Mar 22 0 1 -
+-R X 2009 2011 - S 22 0 0 -
+-R X 2012 o - Mar 21 0 1 -
+-R X 2012 o - S 21 0 0 -
+-R X 2013 2015 - Mar 22 0 1 -
+-R X 2013 2015 - S 22 0 0 -
+-R X 2016 o - Mar 21 0 1 -
+-R X 2016 o - S 21 0 0 -
+-R X 2017 2019 - Mar 22 0 1 -
+-R X 2017 2019 - S 22 0 0 -
+-R X 2020 o - Mar 21 0 1 -
+-R X 2020 o - S 21 0 0 -
+-R X 2021 2023 - Mar 22 0 1 -
+-R X 2021 2023 - S 22 0 0 -
+-R X 2024 o - Mar 21 0 1 -
+-R X 2024 o - S 21 0 0 -
+-R X 2025 2027 - Mar 22 0 1 -
+-R X 2025 2027 - S 22 0 0 -
+-R X 2028 2029 - Mar 21 0 1 -
+-R X 2028 2029 - S 21 0 0 -
+-R X 2030 2031 - Mar 22 0 1 -
+-R X 2030 2031 - S 22 0 0 -
+-R X 2032 2033 - Mar 21 0 1 -
+-R X 2032 2033 - S 21 0 0 -
+-R X 2034 2035 - Mar 22 0 1 -
+-R X 2034 2035 - S 22 0 0 -
+-R X 2036 ma - Mar 21 0 1 -
+-R X 2036 ma - S 21 0 0 -
++R i 1978 1980 - Mar 21 0 1 -
++R i 1978 o - O 21 0 0 -
++R i 1979 o - S 19 0 0 -
++R i 1980 o - S 23 0 0 -
++R i 1991 o - May 3 0 1 -
++R i 1992 1995 - Mar 22 0 1 -
++R i 1991 1995 - S 22 0 0 -
++R i 1996 o - Mar 21 0 1 -
++R i 1996 o - S 21 0 0 -
++R i 1997 1999 - Mar 22 0 1 -
++R i 1997 1999 - S 22 0 0 -
++R i 2000 o - Mar 21 0 1 -
++R i 2000 o - S 21 0 0 -
++R i 2001 2003 - Mar 22 0 1 -
++R i 2001 2003 - S 22 0 0 -
++R i 2004 o - Mar 21 0 1 -
++R i 2004 o - S 21 0 0 -
++R i 2005 o - Mar 22 0 1 -
++R i 2005 o - S 22 0 0 -
++R i 2008 o - Mar 21 0 1 -
++R i 2008 o - S 21 0 0 -
++R i 2009 2011 - Mar 22 0 1 -
++R i 2009 2011 - S 22 0 0 -
++R i 2012 o - Mar 21 0 1 -
++R i 2012 o - S 21 0 0 -
++R i 2013 2015 - Mar 22 0 1 -
++R i 2013 2015 - S 22 0 0 -
++R i 2016 o - Mar 21 0 1 -
++R i 2016 o - S 21 0 0 -
++R i 2017 2019 - Mar 22 0 1 -
++R i 2017 2019 - S 22 0 0 -
++R i 2020 o - Mar 21 0 1 -
++R i 2020 o - S 21 0 0 -
++R i 2021 2023 - Mar 22 0 1 -
++R i 2021 2023 - S 22 0 0 -
++R i 2024 o - Mar 21 0 1 -
++R i 2024 o - S 21 0 0 -
++R i 2025 2027 - Mar 22 0 1 -
++R i 2025 2027 - S 22 0 0 -
++R i 2028 2029 - Mar 21 0 1 -
++R i 2028 2029 - S 21 0 0 -
++R i 2030 2031 - Mar 22 0 1 -
++R i 2030 2031 - S 22 0 0 -
++R i 2032 2033 - Mar 21 0 1 -
++R i 2032 2033 - S 21 0 0 -
++R i 2034 2035 - Mar 22 0 1 -
++R i 2034 2035 - S 22 0 0 -
++R i 2036 ma - Mar 21 0 1 -
++R i 2036 ma - S 21 0 0 -
+ Z Asia/Tehran 3:25:44 - LMT 1916
+ 3:25:44 - TMT 1946
+ 3:30 - +0330 1977 N
+-4 X +04/+05 1979
+-3:30 X +0330/+0430
+-R Y 1982 o - May 1 0 1 -
+-R Y 1982 1984 - O 1 0 0 -
+-R Y 1983 o - Mar 31 0 1 -
+-R Y 1984 1985 - Ap 1 0 1 -
+-R Y 1985 1990 - S lastSun 1s 0 -
+-R Y 1986 1990 - Mar lastSun 1s 1 -
+-R Y 1991 2007 - Ap 1 3s 1 -
+-R Y 1991 2007 - O 1 3s 0 -
++4 i +04/+05 1979
++3:30 i +0330/+0430
++R IQ 1982 o - May 1 0 1 -
++R IQ 1982 1984 - O 1 0 0 -
++R IQ 1983 o - Mar 31 0 1 -
++R IQ 1984 1985 - Ap 1 0 1 -
++R IQ 1985 1990 - S lastSun 1s 0 -
++R IQ 1986 1990 - Mar lastSun 1s 1 -
++R IQ 1991 2007 - Ap 1 3s 1 -
++R IQ 1991 2007 - O 1 3s 0 -
+ Z Asia/Baghdad 2:57:40 - LMT 1890
+ 2:57:36 - BMT 1918
+ 3 - +03 1982 May
+-3 Y +03/+04
++3 IQ +03/+04
+ R Z 1940 o - Jun 1 0 1 D
+ R Z 1942 1944 - N 1 0 0 S
+ R Z 1943 o - Ap 1 2 1 D
+@@ -659,163 +683,163 @@ R Z 2013 ma - O lastSun 2 0 S
+ Z Asia/Jerusalem 2:20:54 - LMT 1880
+ 2:20:40 - JMT 1918
+ 2 Z I%sT
+-R a 1948 o - May Sat>=1 24 1 D
+-R a 1948 1951 - S Sun>=9 0 0 S
+-R a 1949 o - Ap Sat>=1 24 1 D
+-R a 1950 1951 - May Sat>=1 24 1 D
++R JP 1948 o - May Sat>=1 24 1 D
++R JP 1948 1951 - S Sat>=8 25 0 S
++R JP 1949 o - Ap Sat>=1 24 1 D
++R JP 1950 1951 - May Sat>=1 24 1 D
+ Z Asia/Tokyo 9:18:59 - LMT 1887 D 31 15u
+-9 a J%sT
+-R b 1973 o - Jun 6 0 1 S
+-R b 1973 1975 - O 1 0 0 -
+-R b 1974 1977 - May 1 0 1 S
+-R b 1976 o - N 1 0 0 -
+-R b 1977 o - O 1 0 0 -
+-R b 1978 o - Ap 30 0 1 S
+-R b 1978 o - S 30 0 0 -
+-R b 1985 o - Ap 1 0 1 S
+-R b 1985 o - O 1 0 0 -
+-R b 1986 1988 - Ap F>=1 0 1 S
+-R b 1986 1990 - O F>=1 0 0 -
+-R b 1989 o - May 8 0 1 S
+-R b 1990 o - Ap 27 0 1 S
+-R b 1991 o - Ap 17 0 1 S
+-R b 1991 o - S 27 0 0 -
+-R b 1992 o - Ap 10 0 1 S
+-R b 1992 1993 - O F>=1 0 0 -
+-R b 1993 1998 - Ap F>=1 0 1 S
+-R b 1994 o - S F>=15 0 0 -
+-R b 1995 1998 - S F>=15 0s 0 -
+-R b 1999 o - Jul 1 0s 1 S
+-R b 1999 2002 - S lastF 0s 0 -
+-R b 2000 2001 - Mar lastTh 0s 1 S
+-R b 2002 2012 - Mar lastTh 24 1 S
+-R b 2003 o - O 24 0s 0 -
+-R b 2004 o - O 15 0s 0 -
+-R b 2005 o - S lastF 0s 0 -
+-R b 2006 2011 - O lastF 0s 0 -
+-R b 2013 o - D 20 0 0 -
+-R b 2014 ma - Mar lastTh 24 1 S
+-R b 2014 ma - O lastF 0s 0 -
++9 JP J%sT
++R J 1973 o - Jun 6 0 1 S
++R J 1973 1975 - O 1 0 0 -
++R J 1974 1977 - May 1 0 1 S
++R J 1976 o - N 1 0 0 -
++R J 1977 o - O 1 0 0 -
++R J 1978 o - Ap 30 0 1 S
++R J 1978 o - S 30 0 0 -
++R J 1985 o - Ap 1 0 1 S
++R J 1985 o - O 1 0 0 -
++R J 1986 1988 - Ap F>=1 0 1 S
++R J 1986 1990 - O F>=1 0 0 -
++R J 1989 o - May 8 0 1 S
++R J 1990 o - Ap 27 0 1 S
++R J 1991 o - Ap 17 0 1 S
++R J 1991 o - S 27 0 0 -
++R J 1992 o - Ap 10 0 1 S
++R J 1992 1993 - O F>=1 0 0 -
++R J 1993 1998 - Ap F>=1 0 1 S
++R J 1994 o - S F>=15 0 0 -
++R J 1995 1998 - S F>=15 0s 0 -
++R J 1999 o - Jul 1 0s 1 S
++R J 1999 2002 - S lastF 0s 0 -
++R J 2000 2001 - Mar lastTh 0s 1 S
++R J 2002 2012 - Mar lastTh 24 1 S
++R J 2003 o - O 24 0s 0 -
++R J 2004 o - O 15 0s 0 -
++R J 2005 o - S lastF 0s 0 -
++R J 2006 2011 - O lastF 0s 0 -
++R J 2013 o - D 20 0 0 -
++R J 2014 ma - Mar lastTh 24 1 S
++R J 2014 ma - O lastF 0s 0 -
+ Z Asia/Amman 2:23:44 - LMT 1931
+-2 b EE%sT
++2 J EE%sT
+ Z Asia/Almaty 5:7:48 - LMT 1924 May 2
+ 5 - +05 1930 Jun 21
+-6 M +06/+07 1991 Mar 31 2s
+-5 M +05/+06 1992 Ja 19 2s
+-6 M +06/+07 2004 O 31 2s
++6 R +06/+07 1991 Mar 31 2s
++5 R +05/+06 1992 Ja 19 2s
++6 R +06/+07 2004 O 31 2s
+ 6 - +06
+ Z Asia/Qyzylorda 4:21:52 - LMT 1924 May 2
+ 4 - +04 1930 Jun 21
+ 5 - +05 1981 Ap
+ 5 1 +06 1981 O
+ 6 - +06 1982 Ap
+-5 M +05/+06 1991 Mar 31 2s
+-4 M +04/+05 1991 S 29 2s
+-5 M +05/+06 1992 Ja 19 2s
+-6 M +06/+07 1992 Mar 29 2s
+-5 M +05/+06 2004 O 31 2s
++5 R +05/+06 1991 Mar 31 2s
++4 R +04/+05 1991 S 29 2s
++5 R +05/+06 1992 Ja 19 2s
++6 R +06/+07 1992 Mar 29 2s
++5 R +05/+06 2004 O 31 2s
+ 6 - +06
+ Z Asia/Aqtobe 3:48:40 - LMT 1924 May 2
+ 4 - +04 1930 Jun 21
+ 5 - +05 1981 Ap
+ 5 1 +06 1981 O
+ 6 - +06 1982 Ap
+-5 M +05/+06 1991 Mar 31 2s
+-4 M +04/+05 1992 Ja 19 2s
+-5 M +05/+06 2004 O 31 2s
++5 R +05/+06 1991 Mar 31 2s
++4 R +04/+05 1992 Ja 19 2s
++5 R +05/+06 2004 O 31 2s
+ 5 - +05
+ Z Asia/Aqtau 3:21:4 - LMT 1924 May 2
+ 4 - +04 1930 Jun 21
+ 5 - +05 1981 O
+ 6 - +06 1982 Ap
+-5 M +05/+06 1991 Mar 31 2s
+-4 M +04/+05 1992 Ja 19 2s
+-5 M +05/+06 1994 S 25 2s
+-4 M +04/+05 2004 O 31 2s
++5 R +05/+06 1991 Mar 31 2s
++4 R +04/+05 1992 Ja 19 2s
++5 R +05/+06 1994 S 25 2s
++4 R +04/+05 2004 O 31 2s
+ 5 - +05
+ Z Asia/Atyrau 3:27:44 - LMT 1924 May 2
+ 3 - +03 1930 Jun 21
+ 5 - +05 1981 O
+ 6 - +06 1982 Ap
+-5 M +05/+06 1991 Mar 31 2s
+-4 M +04/+05 1992 Ja 19 2s
+-5 M +05/+06 1999 Mar 28 2s
+-4 M +04/+05 2004 O 31 2s
++5 R +05/+06 1991 Mar 31 2s
++4 R +04/+05 1992 Ja 19 2s
++5 R +05/+06 1999 Mar 28 2s
++4 R +04/+05 2004 O 31 2s
+ 5 - +05
+ Z Asia/Oral 3:25:24 - LMT 1924 May 2
+ 3 - +03 1930 Jun 21
+ 5 - +05 1981 Ap
+ 5 1 +06 1981 O
+ 6 - +06 1982 Ap
+-5 M +05/+06 1989 Mar 26 2s
+-4 M +04/+05 1992 Ja 19 2s
+-5 M +05/+06 1992 Mar 29 2s
+-4 M +04/+05 2004 O 31 2s
++5 R +05/+06 1989 Mar 26 2s
++4 R +04/+05 1992 Ja 19 2s
++5 R +05/+06 1992 Mar 29 2s
++4 R +04/+05 2004 O 31 2s
+ 5 - +05
+-R c 1992 1996 - Ap Sun>=7 0s 1 -
+-R c 1992 1996 - S lastSun 0 0 -
+-R c 1997 2005 - Mar lastSun 2:30 1 -
+-R c 1997 2004 - O lastSun 2:30 0 -
++R KG 1992 1996 - Ap Sun>=7 0s 1 -
++R KG 1992 1996 - S lastSun 0 0 -
++R KG 1997 2005 - Mar lastSun 2:30 1 -
++R KG 1997 2004 - O lastSun 2:30 0 -
+ Z Asia/Bishkek 4:58:24 - LMT 1924 May 2
+ 5 - +05 1930 Jun 21
+-6 M +06/+07 1991 Mar 31 2s
+-5 M +05/+06 1991 Au 31 2
+-5 c +05/+06 2005 Au 12
++6 R +06/+07 1991 Mar 31 2s
++5 R +05/+06 1991 Au 31 2
++5 KG +05/+06 2005 Au 12
+ 6 - +06
+-R d 1948 o - Jun 1 0 1 D
+-R d 1948 o - S 13 0 0 S
+-R d 1949 o - Ap 3 0 1 D
+-R d 1949 1951 - S Sun>=8 0 0 S
+-R d 1950 o - Ap 1 0 1 D
+-R d 1951 o - May 6 0 1 D
+-R d 1955 o - May 5 0 1 D
+-R d 1955 o - S 9 0 0 S
+-R d 1956 o - May 20 0 1 D
+-R d 1956 o - S 30 0 0 S
+-R d 1957 1960 - May Sun>=1 0 1 D
+-R d 1957 1960 - S Sun>=18 0 0 S
+-R d 1987 1988 - May Sun>=8 2 1 D
+-R d 1987 1988 - O Sun>=8 3 0 S
++R KR 1948 o - Jun 1 0 1 D
++R KR 1948 o - S 13 0 0 S
++R KR 1949 o - Ap 3 0 1 D
++R KR 1949 1951 - S Sun>=8 0 0 S
++R KR 1950 o - Ap 1 0 1 D
++R KR 1951 o - May 6 0 1 D
++R KR 1955 o - May 5 0 1 D
++R KR 1955 o - S 9 0 0 S
++R KR 1956 o - May 20 0 1 D
++R KR 1956 o - S 30 0 0 S
++R KR 1957 1960 - May Sun>=1 0 1 D
++R KR 1957 1960 - S Sun>=18 0 0 S
++R KR 1987 1988 - May Sun>=8 2 1 D
++R KR 1987 1988 - O Sun>=8 3 0 S
+ Z Asia/Seoul 8:27:52 - LMT 1908 Ap
+ 8:30 - KST 1912
+ 9 - JST 1945 S 8
+ 9 - KST 1954 Mar 21
+-8:30 d K%sT 1961 Au 10
+-9 d K%sT
++8:30 KR K%sT 1961 Au 10
++9 KR K%sT
+ Z Asia/Pyongyang 8:23 - LMT 1908 Ap
+ 8:30 - KST 1912
+ 9 - JST 1945 Au 24
+ 9 - KST 2015 Au 15
+-8:30 - KST 2018 May 5
++8:30 - KST 2018 May 4 23:30
+ 9 - KST
+-R e 1920 o - Mar 28 0 1 S
+-R e 1920 o - O 25 0 0 -
+-R e 1921 o - Ap 3 0 1 S
+-R e 1921 o - O 3 0 0 -
+-R e 1922 o - Mar 26 0 1 S
+-R e 1922 o - O 8 0 0 -
+-R e 1923 o - Ap 22 0 1 S
+-R e 1923 o - S 16 0 0 -
+-R e 1957 1961 - May 1 0 1 S
+-R e 1957 1961 - O 1 0 0 -
+-R e 1972 o - Jun 22 0 1 S
+-R e 1972 1977 - O 1 0 0 -
+-R e 1973 1977 - May 1 0 1 S
+-R e 1978 o - Ap 30 0 1 S
+-R e 1978 o - S 30 0 0 -
+-R e 1984 1987 - May 1 0 1 S
+-R e 1984 1991 - O 16 0 0 -
+-R e 1988 o - Jun 1 0 1 S
+-R e 1989 o - May 10 0 1 S
+-R e 1990 1992 - May 1 0 1 S
+-R e 1992 o - O 4 0 0 -
+-R e 1993 ma - Mar lastSun 0 1 S
+-R e 1993 1998 - S lastSun 0 0 -
+-R e 1999 ma - O lastSun 0 0 -
++R l 1920 o - Mar 28 0 1 S
++R l 1920 o - O 25 0 0 -
++R l 1921 o - Ap 3 0 1 S
++R l 1921 o - O 3 0 0 -
++R l 1922 o - Mar 26 0 1 S
++R l 1922 o - O 8 0 0 -
++R l 1923 o - Ap 22 0 1 S
++R l 1923 o - S 16 0 0 -
++R l 1957 1961 - May 1 0 1 S
++R l 1957 1961 - O 1 0 0 -
++R l 1972 o - Jun 22 0 1 S
++R l 1972 1977 - O 1 0 0 -
++R l 1973 1977 - May 1 0 1 S
++R l 1978 o - Ap 30 0 1 S
++R l 1978 o - S 30 0 0 -
++R l 1984 1987 - May 1 0 1 S
++R l 1984 1991 - O 16 0 0 -
++R l 1988 o - Jun 1 0 1 S
++R l 1989 o - May 10 0 1 S
++R l 1990 1992 - May 1 0 1 S
++R l 1992 o - O 4 0 0 -
++R l 1993 ma - Mar lastSun 0 1 S
++R l 1993 1998 - S lastSun 0 0 -
++R l 1999 ma - O lastSun 0 0 -
+ Z Asia/Beirut 2:22 - LMT 1880
+-2 e EE%sT
+-R f 1935 1941 - S 14 0 0:20 -
+-R f 1935 1941 - D 14 0 0 -
++2 l EE%sT
++R NB 1935 1941 - S 14 0 0:20 -
++R NB 1935 1941 - D 14 0 0 -
+ Z Asia/Kuala_Lumpur 6:46:46 - LMT 1901
+ 6:55:25 - SMT 1905 Jun
+ 7 - +07 1933
+@@ -827,98 +851,98 @@ Z Asia/Kuala_Lumpur 6:46:46 - LMT 1901
+ 8 - +08
+ Z Asia/Kuching 7:21:20 - LMT 1926 Mar
+ 7:30 - +0730 1933
+-8 f +08/+0820 1942 F 16
++8 NB +08/+0820 1942 F 16
+ 9 - +09 1945 S 12
+ 8 - +08
+ Z Indian/Maldives 4:54 - LMT 1880
+ 4:54 - MMT 1960
+ 5 - +05
+-R g 1983 1984 - Ap 1 0 1 -
+-R g 1983 o - O 1 0 0 -
+-R g 1985 1998 - Mar lastSun 0 1 -
+-R g 1984 1998 - S lastSun 0 0 -
+-R g 2001 o - Ap lastSat 2 1 -
+-R g 2001 2006 - S lastSat 2 0 -
+-R g 2002 2006 - Mar lastSat 2 1 -
+-R g 2015 2016 - Mar lastSat 2 1 -
+-R g 2015 2016 - S lastSat 0 0 -
++R X 1983 1984 - Ap 1 0 1 -
++R X 1983 o - O 1 0 0 -
++R X 1985 1998 - Mar lastSun 0 1 -
++R X 1984 1998 - S lastSun 0 0 -
++R X 2001 o - Ap lastSat 2 1 -
++R X 2001 2006 - S lastSat 2 0 -
++R X 2002 2006 - Mar lastSat 2 1 -
++R X 2015 2016 - Mar lastSat 2 1 -
++R X 2015 2016 - S lastSat 0 0 -
+ Z Asia/Hovd 6:6:36 - LMT 1905 Au
+ 6 - +06 1978
+-7 g +07/+08
++7 X +07/+08
+ Z Asia/Ulaanbaatar 7:7:32 - LMT 1905 Au
+ 7 - +07 1978
+-8 g +08/+09
++8 X +08/+09
+ Z Asia/Choibalsan 7:38 - LMT 1905 Au
+ 7 - +07 1978
+ 8 - +08 1983 Ap
+-9 g +09/+10 2008 Mar 31
+-8 g +08/+09
++9 X +09/+10 2008 Mar 31
++8 X +08/+09
+ Z Asia/Kathmandu 5:41:16 - LMT 1920
+ 5:30 - +0530 1986
+ 5:45 - +0545
+-R h 2002 o - Ap Sun>=2 0 1 S
+-R h 2002 o - O Sun>=2 0 0 -
+-R h 2008 o - Jun 1 0 1 S
+-R h 2008 2009 - N 1 0 0 -
+-R h 2009 o - Ap 15 0 1 S
++R PK 2002 o - Ap Sun>=2 0 1 S
++R PK 2002 o - O Sun>=2 0 0 -
++R PK 2008 o - Jun 1 0 1 S
++R PK 2008 2009 - N 1 0 0 -
++R PK 2009 o - Ap 15 0 1 S
+ Z Asia/Karachi 4:28:12 - LMT 1907
+ 5:30 - +0530 1942 S
+ 5:30 1 +0630 1945 O 15
+ 5:30 - +0530 1951 S 30
+ 5 - +05 1971 Mar 26
+-5 h PK%sT
+-R i 1999 2005 - Ap F>=15 0 1 S
+-R i 1999 2003 - O F>=15 0 0 -
+-R i 2004 o - O 1 1 0 -
+-R i 2005 o - O 4 2 0 -
+-R i 2006 2007 - Ap 1 0 1 S
+-R i 2006 o - S 22 0 0 -
+-R i 2007 o - S Th>=8 2 0 -
+-R i 2008 2009 - Mar lastF 0 1 S
+-R i 2008 o - S 1 0 0 -
+-R i 2009 o - S F>=1 1 0 -
+-R i 2010 o - Mar 26 0 1 S
+-R i 2010 o - Au 11 0 0 -
+-R i 2011 o - Ap 1 0:1 1 S
+-R i 2011 o - Au 1 0 0 -
+-R i 2011 o - Au 30 0 1 S
+-R i 2011 o - S 30 0 0 -
+-R i 2012 2014 - Mar lastTh 24 1 S
+-R i 2012 o - S 21 1 0 -
+-R i 2013 o - S F>=21 0 0 -
+-R i 2014 2015 - O F>=21 0 0 -
+-R i 2015 o - Mar lastF 24 1 S
+-R i 2016 ma - Mar Sat>=22 1 1 S
+-R i 2016 ma - O lastSat 1 0 -
++5 PK PK%sT
++R P 1999 2005 - Ap F>=15 0 1 S
++R P 1999 2003 - O F>=15 0 0 -
++R P 2004 o - O 1 1 0 -
++R P 2005 o - O 4 2 0 -
++R P 2006 2007 - Ap 1 0 1 S
++R P 2006 o - S 22 0 0 -
++R P 2007 o - S Th>=8 2 0 -
++R P 2008 2009 - Mar lastF 0 1 S
++R P 2008 o - S 1 0 0 -
++R P 2009 o - S F>=1 1 0 -
++R P 2010 o - Mar 26 0 1 S
++R P 2010 o - Au 11 0 0 -
++R P 2011 o - Ap 1 0:1 1 S
++R P 2011 o - Au 1 0 0 -
++R P 2011 o - Au 30 0 1 S
++R P 2011 o - S 30 0 0 -
++R P 2012 2014 - Mar lastTh 24 1 S
++R P 2012 o - S 21 1 0 -
++R P 2013 o - S F>=21 0 0 -
++R P 2014 2015 - O F>=21 0 0 -
++R P 2015 o - Mar lastF 24 1 S
++R P 2016 ma - Mar Sat>=22 1 1 S
++R P 2016 ma - O lastSat 1 0 -
+ Z Asia/Gaza 2:17:52 - LMT 1900 O
+ 2 Z EET/EEST 1948 May 15
+-2 B EE%sT 1967 Jun 5
++2 K EE%sT 1967 Jun 5
+ 2 Z I%sT 1996
+-2 b EE%sT 1999
+-2 i EE%sT 2008 Au 29
++2 J EE%sT 1999
++2 P EE%sT 2008 Au 29
+ 2 - EET 2008 S
+-2 i EE%sT 2010
++2 P EE%sT 2010
+ 2 - EET 2010 Mar 27 0:1
+-2 i EE%sT 2011 Au
++2 P EE%sT 2011 Au
+ 2 - EET 2012
+-2 i EE%sT
++2 P EE%sT
+ Z Asia/Hebron 2:20:23 - LMT 1900 O
+ 2 Z EET/EEST 1948 May 15
+-2 B EE%sT 1967 Jun 5
++2 K EE%sT 1967 Jun 5
+ 2 Z I%sT 1996
+-2 b EE%sT 1999
+-2 i EE%sT
+-R j 1936 o - N 1 0 1 -
+-R j 1937 o - F 1 0 0 -
+-R j 1954 o - Ap 12 0 1 -
+-R j 1954 o - Jul 1 0 0 -
+-R j 1978 o - Mar 22 0 1 -
+-R j 1978 o - S 21 0 0 -
++2 J EE%sT 1999
++2 P EE%sT
++R PH 1936 o - N 1 0 1 D
++R PH 1937 o - F 1 0 0 S
++R PH 1954 o - Ap 12 0 1 D
++R PH 1954 o - Jul 1 0 0 S
++R PH 1978 o - Mar 22 0 1 D
++R PH 1978 o - S 21 0 0 S
+ Z Asia/Manila -15:56 - LMT 1844 D 31
+ 8:4 - LMT 1899 May 11
+-8 j +08/+09 1942 May
+-9 - +09 1944 N
+-8 j +08/+09
++8 PH P%sT 1942 May
++9 - JST 1944 N
++8 PH P%sT
+ Z Asia/Qatar 3:26:8 - LMT 1920
+ 4 - +04 1972 Jun
+ 3 - +03
+@@ -945,52 +969,52 @@ Z Asia/Colombo 5:19:24 - LMT 1880
+ 6:30 - +0630 1996 O 26 0:30
+ 6 - +06 2006 Ap 15 0:30
+ 5:30 - +0530
+-R k 1920 1923 - Ap Sun>=15 2 1 S
+-R k 1920 1923 - O Sun>=1 2 0 -
+-R k 1962 o - Ap 29 2 1 S
+-R k 1962 o - O 1 2 0 -
+-R k 1963 1965 - May 1 2 1 S
+-R k 1963 o - S 30 2 0 -
+-R k 1964 o - O 1 2 0 -
+-R k 1965 o - S 30 2 0 -
+-R k 1966 o - Ap 24 2 1 S
+-R k 1966 1976 - O 1 2 0 -
+-R k 1967 1978 - May 1 2 1 S
+-R k 1977 1978 - S 1 2 0 -
+-R k 1983 1984 - Ap 9 2 1 S
+-R k 1983 1984 - O 1 2 0 -
+-R k 1986 o - F 16 2 1 S
+-R k 1986 o - O 9 2 0 -
+-R k 1987 o - Mar 1 2 1 S
+-R k 1987 1988 - O 31 2 0 -
+-R k 1988 o - Mar 15 2 1 S
+-R k 1989 o - Mar 31 2 1 S
+-R k 1989 o - O 1 2 0 -
+-R k 1990 o - Ap 1 2 1 S
+-R k 1990 o - S 30 2 0 -
+-R k 1991 o - Ap 1 0 1 S
+-R k 1991 1992 - O 1 0 0 -
+-R k 1992 o - Ap 8 0 1 S
+-R k 1993 o - Mar 26 0 1 S
+-R k 1993 o - S 25 0 0 -
+-R k 1994 1996 - Ap 1 0 1 S
+-R k 1994 2005 - O 1 0 0 -
+-R k 1997 1998 - Mar lastM 0 1 S
+-R k 1999 2006 - Ap 1 0 1 S
+-R k 2006 o - S 22 0 0 -
+-R k 2007 o - Mar lastF 0 1 S
+-R k 2007 o - N F>=1 0 0 -
+-R k 2008 o - Ap F>=1 0 1 S
+-R k 2008 o - N 1 0 0 -
+-R k 2009 o - Mar lastF 0 1 S
+-R k 2010 2011 - Ap F>=1 0 1 S
+-R k 2012 ma - Mar lastF 0 1 S
+-R k 2009 ma - O lastF 0 0 -
++R S 1920 1923 - Ap Sun>=15 2 1 S
++R S 1920 1923 - O Sun>=1 2 0 -
++R S 1962 o - Ap 29 2 1 S
++R S 1962 o - O 1 2 0 -
++R S 1963 1965 - May 1 2 1 S
++R S 1963 o - S 30 2 0 -
++R S 1964 o - O 1 2 0 -
++R S 1965 o - S 30 2 0 -
++R S 1966 o - Ap 24 2 1 S
++R S 1966 1976 - O 1 2 0 -
++R S 1967 1978 - May 1 2 1 S
++R S 1977 1978 - S 1 2 0 -
++R S 1983 1984 - Ap 9 2 1 S
++R S 1983 1984 - O 1 2 0 -
++R S 1986 o - F 16 2 1 S
++R S 1986 o - O 9 2 0 -
++R S 1987 o - Mar 1 2 1 S
++R S 1987 1988 - O 31 2 0 -
++R S 1988 o - Mar 15 2 1 S
++R S 1989 o - Mar 31 2 1 S
++R S 1989 o - O 1 2 0 -
++R S 1990 o - Ap 1 2 1 S
++R S 1990 o - S 30 2 0 -
++R S 1991 o - Ap 1 0 1 S
++R S 1991 1992 - O 1 0 0 -
++R S 1992 o - Ap 8 0 1 S
++R S 1993 o - Mar 26 0 1 S
++R S 1993 o - S 25 0 0 -
++R S 1994 1996 - Ap 1 0 1 S
++R S 1994 2005 - O 1 0 0 -
++R S 1997 1998 - Mar lastM 0 1 S
++R S 1999 2006 - Ap 1 0 1 S
++R S 2006 o - S 22 0 0 -
++R S 2007 o - Mar lastF 0 1 S
++R S 2007 o - N F>=1 0 0 -
++R S 2008 o - Ap F>=1 0 1 S
++R S 2008 o - N 1 0 0 -
++R S 2009 o - Mar lastF 0 1 S
++R S 2010 2011 - Ap F>=1 0 1 S
++R S 2012 ma - Mar lastF 0 1 S
++R S 2009 ma - O lastF 0 0 -
+ Z Asia/Damascus 2:25:12 - LMT 1920
+-2 k EE%sT
++2 S EE%sT
+ Z Asia/Dushanbe 4:35:12 - LMT 1924 May 2
+ 5 - +05 1930 Jun 21
+-6 M +06/+07 1991 Mar 31 2s
++6 R +06/+07 1991 Mar 31 2s
+ 5 1 +05/+06 1991 S 9 2s
+ 5 - +05
+ Z Asia/Bangkok 6:42:4 - LMT 1880
+@@ -1000,8 +1024,8 @@ Li Asia/Bangkok Asia/Phnom_Penh
+ Li Asia/Bangkok Asia/Vientiane
+ Z Asia/Ashgabat 3:53:32 - LMT 1924 May 2
+ 4 - +04 1930 Jun 21
+-5 M +05/+06 1991 Mar 31 2
+-4 M +04/+05 1992 Ja 19 2
++5 R +05/+06 1991 Mar 31 2
++4 R +04/+05 1992 Ja 19 2
+ 5 - +05
+ Z Asia/Dubai 3:41:12 - LMT 1920
+ 4 - +04
+@@ -1011,12 +1035,12 @@ Z Asia/Samarkand 4:27:53 - LMT 1924 May 2
+ 5 - +05 1981 Ap
+ 5 1 +06 1981 O
+ 6 - +06 1982 Ap
+-5 M +05/+06 1992
++5 R +05/+06 1992
+ 5 - +05
+ Z Asia/Tashkent 4:37:11 - LMT 1924 May 2
+ 5 - +05 1930 Jun 21
+-6 M +06/+07 1991 Mar 31 2
+-5 M +05/+06 1992
++6 R +06/+07 1991 Mar 31 2
++5 R +05/+06 1992
+ 5 - +05
+ Z Asia/Ho_Chi_Minh 7:6:40 - LMT 1906 Jul
+ 7:6:30 - PLMT 1911 May
+@@ -1028,176 +1052,176 @@ Z Asia/Ho_Chi_Minh 7:6:40 - LMT 1906 Jul
+ 7 - +07 1959 D 31 23
+ 8 - +08 1975 Jun 13
+ 7 - +07
+-R l 1917 o - Ja 1 0:1 1 D
+-R l 1917 o - Mar 25 2 0 S
+-R l 1942 o - Ja 1 2 1 D
+-R l 1942 o - Mar 29 2 0 S
+-R l 1942 o - S 27 2 1 D
+-R l 1943 1944 - Mar lastSun 2 0 S
+-R l 1943 o - O 3 2 1 D
++R AU 1917 o - Ja 1 0:1 1 D
++R AU 1917 o - Mar 25 2 0 S
++R AU 1942 o - Ja 1 2 1 D
++R AU 1942 o - Mar 29 2 0 S
++R AU 1942 o - S 27 2 1 D
++R AU 1943 1944 - Mar lastSun 2 0 S
++R AU 1943 o - O 3 2 1 D
+ Z Australia/Darwin 8:43:20 - LMT 1895 F
+ 9 - ACST 1899 May
+-9:30 l AC%sT
+-R m 1974 o - O lastSun 2s 1 D
+-R m 1975 o - Mar Sun>=1 2s 0 S
+-R m 1983 o - O lastSun 2s 1 D
+-R m 1984 o - Mar Sun>=1 2s 0 S
+-R m 1991 o - N 17 2s 1 D
+-R m 1992 o - Mar Sun>=1 2s 0 S
+-R m 2006 o - D 3 2s 1 D
+-R m 2007 2009 - Mar lastSun 2s 0 S
+-R m 2007 2008 - O lastSun 2s 1 D
++9:30 AU AC%sT
++R AW 1974 o - O lastSun 2s 1 D
++R AW 1975 o - Mar Sun>=1 2s 0 S
++R AW 1983 o - O lastSun 2s 1 D
++R AW 1984 o - Mar Sun>=1 2s 0 S
++R AW 1991 o - N 17 2s 1 D
++R AW 1992 o - Mar Sun>=1 2s 0 S
++R AW 2006 o - D 3 2s 1 D
++R AW 2007 2009 - Mar lastSun 2s 0 S
++R AW 2007 2008 - O lastSun 2s 1 D
+ Z Australia/Perth 7:43:24 - LMT 1895 D
+-8 l AW%sT 1943 Jul
+-8 m AW%sT
++8 AU AW%sT 1943 Jul
++8 AW AW%sT
+ Z Australia/Eucla 8:35:28 - LMT 1895 D
+-8:45 l +0845/+0945 1943 Jul
+-8:45 m +0845/+0945
+-R n 1971 o - O lastSun 2s 1 D
+-R n 1972 o - F lastSun 2s 0 S
+-R n 1989 1991 - O lastSun 2s 1 D
+-R n 1990 1992 - Mar Sun>=1 2s 0 S
+-R o 1992 1993 - O lastSun 2s 1 D
+-R o 1993 1994 - Mar Sun>=1 2s 0 S
++8:45 AU +0845/+0945 1943 Jul
++8:45 AW +0845/+0945
++R AQ 1971 o - O lastSun 2s 1 D
++R AQ 1972 o - F lastSun 2s 0 S
++R AQ 1989 1991 - O lastSun 2s 1 D
++R AQ 1990 1992 - Mar Sun>=1 2s 0 S
++R Ho 1992 1993 - O lastSun 2s 1 D
++R Ho 1993 1994 - Mar Sun>=1 2s 0 S
+ Z Australia/Brisbane 10:12:8 - LMT 1895
+-10 l AE%sT 1971
+-10 n AE%sT
++10 AU AE%sT 1971
++10 AQ AE%sT
+ Z Australia/Lindeman 9:55:56 - LMT 1895
+-10 l AE%sT 1971
+-10 n AE%sT 1992 Jul
+-10 o AE%sT
+-R p 1971 1985 - O lastSun 2s 1 D
+-R p 1986 o - O 19 2s 1 D
+-R p 1987 2007 - O lastSun 2s 1 D
+-R p 1972 o - F 27 2s 0 S
+-R p 1973 1985 - Mar Sun>=1 2s 0 S
+-R p 1986 1990 - Mar Sun>=15 2s 0 S
+-R p 1991 o - Mar 3 2s 0 S
+-R p 1992 o - Mar 22 2s 0 S
+-R p 1993 o - Mar 7 2s 0 S
+-R p 1994 o - Mar 20 2s 0 S
+-R p 1995 2005 - Mar lastSun 2s 0 S
+-R p 2006 o - Ap 2 2s 0 S
+-R p 2007 o - Mar lastSun 2s 0 S
+-R p 2008 ma - Ap Sun>=1 2s 0 S
+-R p 2008 ma - O Sun>=1 2s 1 D
++10 AU AE%sT 1971
++10 AQ AE%sT 1992 Jul
++10 Ho AE%sT
++R AS 1971 1985 - O lastSun 2s 1 D
++R AS 1986 o - O 19 2s 1 D
++R AS 1987 2007 - O lastSun 2s 1 D
++R AS 1972 o - F 27 2s 0 S
++R AS 1973 1985 - Mar Sun>=1 2s 0 S
++R AS 1986 1990 - Mar Sun>=15 2s 0 S
++R AS 1991 o - Mar 3 2s 0 S
++R AS 1992 o - Mar 22 2s 0 S
++R AS 1993 o - Mar 7 2s 0 S
++R AS 1994 o - Mar 20 2s 0 S
++R AS 1995 2005 - Mar lastSun 2s 0 S
++R AS 2006 o - Ap 2 2s 0 S
++R AS 2007 o - Mar lastSun 2s 0 S
++R AS 2008 ma - Ap Sun>=1 2s 0 S
++R AS 2008 ma - O Sun>=1 2s 1 D
+ Z Australia/Adelaide 9:14:20 - LMT 1895 F
+ 9 - ACST 1899 May
+-9:30 l AC%sT 1971
+-9:30 p AC%sT
+-R q 1967 o - O Sun>=1 2s 1 D
+-R q 1968 o - Mar lastSun 2s 0 S
+-R q 1968 1985 - O lastSun 2s 1 D
+-R q 1969 1971 - Mar Sun>=8 2s 0 S
+-R q 1972 o - F lastSun 2s 0 S
+-R q 1973 1981 - Mar Sun>=1 2s 0 S
+-R q 1982 1983 - Mar lastSun 2s 0 S
+-R q 1984 1986 - Mar Sun>=1 2s 0 S
+-R q 1986 o - O Sun>=15 2s 1 D
+-R q 1987 1990 - Mar Sun>=15 2s 0 S
+-R q 1987 o - O Sun>=22 2s 1 D
+-R q 1988 1990 - O lastSun 2s 1 D
+-R q 1991 1999 - O Sun>=1 2s 1 D
+-R q 1991 2005 - Mar lastSun 2s 0 S
+-R q 2000 o - Au lastSun 2s 1 D
+-R q 2001 ma - O Sun>=1 2s 1 D
+-R q 2006 o - Ap Sun>=1 2s 0 S
+-R q 2007 o - Mar lastSun 2s 0 S
+-R q 2008 ma - Ap Sun>=1 2s 0 S
++9:30 AU AC%sT 1971
++9:30 AS AC%sT
++R AT 1967 o - O Sun>=1 2s 1 D
++R AT 1968 o - Mar lastSun 2s 0 S
++R AT 1968 1985 - O lastSun 2s 1 D
++R AT 1969 1971 - Mar Sun>=8 2s 0 S
++R AT 1972 o - F lastSun 2s 0 S
++R AT 1973 1981 - Mar Sun>=1 2s 0 S
++R AT 1982 1983 - Mar lastSun 2s 0 S
++R AT 1984 1986 - Mar Sun>=1 2s 0 S
++R AT 1986 o - O Sun>=15 2s 1 D
++R AT 1987 1990 - Mar Sun>=15 2s 0 S
++R AT 1987 o - O Sun>=22 2s 1 D
++R AT 1988 1990 - O lastSun 2s 1 D
++R AT 1991 1999 - O Sun>=1 2s 1 D
++R AT 1991 2005 - Mar lastSun 2s 0 S
++R AT 2000 o - Au lastSun 2s 1 D
++R AT 2001 ma - O Sun>=1 2s 1 D
++R AT 2006 o - Ap Sun>=1 2s 0 S
++R AT 2007 o - Mar lastSun 2s 0 S
++R AT 2008 ma - Ap Sun>=1 2s 0 S
+ Z Australia/Hobart 9:49:16 - LMT 1895 S
+ 10 - AEST 1916 O 1 2
+ 10 1 AEDT 1917 F
+-10 l AE%sT 1967
+-10 q AE%sT
++10 AU AE%sT 1967
++10 AT AE%sT
+ Z Australia/Currie 9:35:28 - LMT 1895 S
+ 10 - AEST 1916 O 1 2
+ 10 1 AEDT 1917 F
+-10 l AE%sT 1971 Jul
+-10 q AE%sT
+-R r 1971 1985 - O lastSun 2s 1 D
+-R r 1972 o - F lastSun 2s 0 S
+-R r 1973 1985 - Mar Sun>=1 2s 0 S
+-R r 1986 1990 - Mar Sun>=15 2s 0 S
+-R r 1986 1987 - O Sun>=15 2s 1 D
+-R r 1988 1999 - O lastSun 2s 1 D
+-R r 1991 1994 - Mar Sun>=1 2s 0 S
+-R r 1995 2005 - Mar lastSun 2s 0 S
+-R r 2000 o - Au lastSun 2s 1 D
+-R r 2001 2007 - O lastSun 2s 1 D
+-R r 2006 o - Ap Sun>=1 2s 0 S
+-R r 2007 o - Mar lastSun 2s 0 S
+-R r 2008 ma - Ap Sun>=1 2s 0 S
+-R r 2008 ma - O Sun>=1 2s 1 D
++10 AU AE%sT 1971 Jul
++10 AT AE%sT
++R AV 1971 1985 - O lastSun 2s 1 D
++R AV 1972 o - F lastSun 2s 0 S
++R AV 1973 1985 - Mar Sun>=1 2s 0 S
++R AV 1986 1990 - Mar Sun>=15 2s 0 S
++R AV 1986 1987 - O Sun>=15 2s 1 D
++R AV 1988 1999 - O lastSun 2s 1 D
++R AV 1991 1994 - Mar Sun>=1 2s 0 S
++R AV 1995 2005 - Mar lastSun 2s 0 S
++R AV 2000 o - Au lastSun 2s 1 D
++R AV 2001 2007 - O lastSun 2s 1 D
++R AV 2006 o - Ap Sun>=1 2s 0 S
++R AV 2007 o - Mar lastSun 2s 0 S
++R AV 2008 ma - Ap Sun>=1 2s 0 S
++R AV 2008 ma - O Sun>=1 2s 1 D
+ Z Australia/Melbourne 9:39:52 - LMT 1895 F
+-10 l AE%sT 1971
+-10 r AE%sT
+-R s 1971 1985 - O lastSun 2s 1 D
+-R s 1972 o - F 27 2s 0 S
+-R s 1973 1981 - Mar Sun>=1 2s 0 S
+-R s 1982 o - Ap Sun>=1 2s 0 S
+-R s 1983 1985 - Mar Sun>=1 2s 0 S
+-R s 1986 1989 - Mar Sun>=15 2s 0 S
+-R s 1986 o - O 19 2s 1 D
+-R s 1987 1999 - O lastSun 2s 1 D
+-R s 1990 1995 - Mar Sun>=1 2s 0 S
+-R s 1996 2005 - Mar lastSun 2s 0 S
+-R s 2000 o - Au lastSun 2s 1 D
+-R s 2001 2007 - O lastSun 2s 1 D
+-R s 2006 o - Ap Sun>=1 2s 0 S
+-R s 2007 o - Mar lastSun 2s 0 S
+-R s 2008 ma - Ap Sun>=1 2s 0 S
+-R s 2008 ma - O Sun>=1 2s 1 D
++10 AU AE%sT 1971
++10 AV AE%sT
++R AN 1971 1985 - O lastSun 2s 1 D
++R AN 1972 o - F 27 2s 0 S
++R AN 1973 1981 - Mar Sun>=1 2s 0 S
++R AN 1982 o - Ap Sun>=1 2s 0 S
++R AN 1983 1985 - Mar Sun>=1 2s 0 S
++R AN 1986 1989 - Mar Sun>=15 2s 0 S
++R AN 1986 o - O 19 2s 1 D
++R AN 1987 1999 - O lastSun 2s 1 D
++R AN 1990 1995 - Mar Sun>=1 2s 0 S
++R AN 1996 2005 - Mar lastSun 2s 0 S
++R AN 2000 o - Au lastSun 2s 1 D
++R AN 2001 2007 - O lastSun 2s 1 D
++R AN 2006 o - Ap Sun>=1 2s 0 S
++R AN 2007 o - Mar lastSun 2s 0 S
++R AN 2008 ma - Ap Sun>=1 2s 0 S
++R AN 2008 ma - O Sun>=1 2s 1 D
+ Z Australia/Sydney 10:4:52 - LMT 1895 F
+-10 l AE%sT 1971
+-10 s AE%sT
++10 AU AE%sT 1971
++10 AN AE%sT
+ Z Australia/Broken_Hill 9:25:48 - LMT 1895 F
+ 10 - AEST 1896 Au 23
+ 9 - ACST 1899 May
+-9:30 l AC%sT 1971
+-9:30 s AC%sT 2000
+-9:30 p AC%sT
+-R t 1981 1984 - O lastSun 2 1 -
+-R t 1982 1985 - Mar Sun>=1 2 0 -
+-R t 1985 o - O lastSun 2 0:30 -
+-R t 1986 1989 - Mar Sun>=15 2 0 -
+-R t 1986 o - O 19 2 0:30 -
+-R t 1987 1999 - O lastSun 2 0:30 -
+-R t 1990 1995 - Mar Sun>=1 2 0 -
+-R t 1996 2005 - Mar lastSun 2 0 -
+-R t 2000 o - Au lastSun 2 0:30 -
+-R t 2001 2007 - O lastSun 2 0:30 -
+-R t 2006 o - Ap Sun>=1 2 0 -
+-R t 2007 o - Mar lastSun 2 0 -
+-R t 2008 ma - Ap Sun>=1 2 0 -
+-R t 2008 ma - O Sun>=1 2 0:30 -
++9:30 AU AC%sT 1971
++9:30 AN AC%sT 2000
++9:30 AS AC%sT
++R LH 1981 1984 - O lastSun 2 1 -
++R LH 1982 1985 - Mar Sun>=1 2 0 -
++R LH 1985 o - O lastSun 2 0:30 -
++R LH 1986 1989 - Mar Sun>=15 2 0 -
++R LH 1986 o - O 19 2 0:30 -
++R LH 1987 1999 - O lastSun 2 0:30 -
++R LH 1990 1995 - Mar Sun>=1 2 0 -
++R LH 1996 2005 - Mar lastSun 2 0 -
++R LH 2000 o - Au lastSun 2 0:30 -
++R LH 2001 2007 - O lastSun 2 0:30 -
++R LH 2006 o - Ap Sun>=1 2 0 -
++R LH 2007 o - Mar lastSun 2 0 -
++R LH 2008 ma - Ap Sun>=1 2 0 -
++R LH 2008 ma - O Sun>=1 2 0:30 -
+ Z Australia/Lord_Howe 10:36:20 - LMT 1895 F
+ 10 - AEST 1981 Mar
+-10:30 t +1030/+1130 1985 Jul
+-10:30 t +1030/+11
++10:30 LH +1030/+1130 1985 Jul
++10:30 LH +1030/+11
+ Z Antarctica/Macquarie 0 - -00 1899 N
+ 10 - AEST 1916 O 1 2
+ 10 1 AEDT 1917 F
+-10 l AE%sT 1919 Ap 1 0s
++10 AU AE%sT 1919 Ap 1 0s
+ 0 - -00 1948 Mar 25
+-10 l AE%sT 1967
+-10 q AE%sT 2010 Ap 4 3
++10 AU AE%sT 1967
++10 AT AE%sT 2010 Ap 4 3
+ 11 - +11
+ Z Indian/Christmas 7:2:52 - LMT 1895 F
+ 7 - +07
+ Z Indian/Cocos 6:27:40 - LMT 1900
+ 6:30 - +0630
+-R u 1998 1999 - N Sun>=1 2 1 -
+-R u 1999 2000 - F lastSun 3 0 -
+-R u 2009 o - N 29 2 1 -
+-R u 2010 o - Mar lastSun 3 0 -
+-R u 2010 2013 - O Sun>=21 2 1 -
+-R u 2011 o - Mar Sun>=1 3 0 -
+-R u 2012 2013 - Ja Sun>=18 3 0 -
+-R u 2014 o - Ja Sun>=18 2 0 -
+-R u 2014 ma - N Sun>=1 2 1 -
+-R u 2015 ma - Ja Sun>=14 3 0 -
++R FJ 1998 1999 - N Sun>=1 2 1 -
++R FJ 1999 2000 - F lastSun 3 0 -
++R FJ 2009 o - N 29 2 1 -
++R FJ 2010 o - Mar lastSun 3 0 -
++R FJ 2010 2013 - O Sun>=21 2 1 -
++R FJ 2011 o - Mar Sun>=1 3 0 -
++R FJ 2012 2013 - Ja Sun>=18 3 0 -
++R FJ 2014 o - Ja Sun>=18 2 0 -
++R FJ 2014 ma - N Sun>=1 2 1 -
++R FJ 2015 ma - Ja Sun>=13 3 0 -
+ Z Pacific/Fiji 11:55:44 - LMT 1915 O 26
+-12 u +12/+13
++12 FJ +12/+13
+ Z Pacific/Gambier -8:59:48 - LMT 1912 O
+ -9 - -09
+ Z Pacific/Marquesas -9:18 - LMT 1912 O
+@@ -1239,50 +1263,50 @@ Z Pacific/Nauru 11:7:40 - LMT 1921 Ja 15
+ 9 - +09 1944 Au 15
+ 11:30 - +1130 1979 May
+ 12 - +12
+-R v 1977 1978 - D Sun>=1 0 1 -
+-R v 1978 1979 - F 27 0 0 -
+-R v 1996 o - D 1 2s 1 -
+-R v 1997 o - Mar 2 2s 0 -
++R NC 1977 1978 - D Sun>=1 0 1 -
++R NC 1978 1979 - F 27 0 0 -
++R NC 1996 o - D 1 2s 1 -
++R NC 1997 o - Mar 2 2s 0 -
+ Z Pacific/Noumea 11:5:48 - LMT 1912 Ja 13
+-11 v +11/+12
+-R w 1927 o - N 6 2 1 S
+-R w 1928 o - Mar 4 2 0 M
+-R w 1928 1933 - O Sun>=8 2 0:30 S
+-R w 1929 1933 - Mar Sun>=15 2 0 M
+-R w 1934 1940 - Ap lastSun 2 0 M
+-R w 1934 1940 - S lastSun 2 0:30 S
+-R w 1946 o - Ja 1 0 0 S
+-R w 1974 o - N Sun>=1 2s 1 D
+-R x 1974 o - N Sun>=1 2:45s 1 -
+-R w 1975 o - F lastSun 2s 0 S
+-R x 1975 o - F lastSun 2:45s 0 -
+-R w 1975 1988 - O lastSun 2s 1 D
+-R x 1975 1988 - O lastSun 2:45s 1 -
+-R w 1976 1989 - Mar Sun>=1 2s 0 S
+-R x 1976 1989 - Mar Sun>=1 2:45s 0 -
+-R w 1989 o - O Sun>=8 2s 1 D
+-R x 1989 o - O Sun>=8 2:45s 1 -
+-R w 1990 2006 - O Sun>=1 2s 1 D
+-R x 1990 2006 - O Sun>=1 2:45s 1 -
+-R w 1990 2007 - Mar Sun>=15 2s 0 S
+-R x 1990 2007 - Mar Sun>=15 2:45s 0 -
+-R w 2007 ma - S lastSun 2s 1 D
+-R x 2007 ma - S lastSun 2:45s 1 -
+-R w 2008 ma - Ap Sun>=1 2s 0 S
+-R x 2008 ma - Ap Sun>=1 2:45s 0 -
++11 NC +11/+12
++R NZ 1927 o - N 6 2 1 S
++R NZ 1928 o - Mar 4 2 0 M
++R NZ 1928 1933 - O Sun>=8 2 0:30 S
++R NZ 1929 1933 - Mar Sun>=15 2 0 M
++R NZ 1934 1940 - Ap lastSun 2 0 M
++R NZ 1934 1940 - S lastSun 2 0:30 S
++R NZ 1946 o - Ja 1 0 0 S
++R NZ 1974 o - N Sun>=1 2s 1 D
++R k 1974 o - N Sun>=1 2:45s 1 -
++R NZ 1975 o - F lastSun 2s 0 S
++R k 1975 o - F lastSun 2:45s 0 -
++R NZ 1975 1988 - O lastSun 2s 1 D
++R k 1975 1988 - O lastSun 2:45s 1 -
++R NZ 1976 1989 - Mar Sun>=1 2s 0 S
++R k 1976 1989 - Mar Sun>=1 2:45s 0 -
++R NZ 1989 o - O Sun>=8 2s 1 D
++R k 1989 o - O Sun>=8 2:45s 1 -
++R NZ 1990 2006 - O Sun>=1 2s 1 D
++R k 1990 2006 - O Sun>=1 2:45s 1 -
++R NZ 1990 2007 - Mar Sun>=15 2s 0 S
++R k 1990 2007 - Mar Sun>=15 2:45s 0 -
++R NZ 2007 ma - S lastSun 2s 1 D
++R k 2007 ma - S lastSun 2:45s 1 -
++R NZ 2008 ma - Ap Sun>=1 2s 0 S
++R k 2008 ma - Ap Sun>=1 2:45s 0 -
+ Z Pacific/Auckland 11:39:4 - LMT 1868 N 2
+-11:30 w NZ%sT 1946
+-12 w NZ%sT
++11:30 NZ NZ%sT 1946
++12 NZ NZ%sT
+ Z Pacific/Chatham 12:13:48 - LMT 1868 N 2
+ 12:15 - +1215 1946
+-12:45 x +1245/+1345
++12:45 k +1245/+1345
+ Li Pacific/Auckland Antarctica/McMurdo
+-R y 1978 o - N 12 0 0:30 -
+-R y 1979 1991 - Mar Sun>=1 0 0 -
+-R y 1979 1990 - O lastSun 0 0:30 -
++R CK 1978 o - N 12 0 0:30 -
++R CK 1979 1991 - Mar Sun>=1 0 0 -
++R CK 1979 1990 - O lastSun 0 0:30 -
+ Z Pacific/Rarotonga -10:39:4 - LMT 1901
+ -10:30 - -1030 1978 N 12
+--10 y -10/-0930
++-10 CK -10/-0930
+ Z Pacific/Niue -11:19:40 - LMT 1901
+ -11:20 - -1120 1951
+ -11:30 - -1130 1978 O
+@@ -1311,570 +1335,570 @@ Z Pacific/Pago_Pago 12:37:12 - LMT 1892 Jul 5
+ -11:22:48 - LMT 1911
+ -11 - SST
+ Li Pacific/Pago_Pago Pacific/Midway
+-R z 2010 o - S lastSun 0 1 -
+-R z 2011 o - Ap Sat>=1 4 0 -
+-R z 2011 o - S lastSat 3 1 -
+-R z 2012 ma - Ap Sun>=1 4 0 -
+-R z 2012 ma - S lastSun 3 1 -
++R WS 2010 o - S lastSun 0 1 -
++R WS 2011 o - Ap Sat>=1 4 0 -
++R WS 2011 o - S lastSat 3 1 -
++R WS 2012 ma - Ap Sun>=1 4 0 -
++R WS 2012 ma - S lastSun 3 1 -
+ Z Pacific/Apia 12:33:4 - LMT 1892 Jul 5
+ -11:26:56 - LMT 1911
+ -11:30 - -1130 1950
+--11 z -11/-10 2011 D 29 24
+-13 z +13/+14
++-11 WS -11/-10 2011 D 29 24
++13 WS +13/+14
+ Z Pacific/Guadalcanal 10:39:48 - LMT 1912 O
+ 11 - +11
+ Z Pacific/Fakaofo -11:24:56 - LMT 1901
+ -11 - -11 2011 D 30
+ 13 - +13
+-R ! 1999 o - O 7 2s 1 -
+-R ! 2000 o - Mar 19 2s 0 -
+-R ! 2000 2001 - N Sun>=1 2 1 -
+-R ! 2001 2002 - Ja lastSun 2 0 -
+-R ! 2016 o - N Sun>=1 2 1 -
+-R ! 2017 o - Ja Sun>=15 3 0 -
++R TO 1999 o - O 7 2s 1 -
++R TO 2000 o - Mar 19 2s 0 -
++R TO 2000 2001 - N Sun>=1 2 1 -
++R TO 2001 2002 - Ja lastSun 2 0 -
++R TO 2016 o - N Sun>=1 2 1 -
++R TO 2017 o - Ja Sun>=15 3 0 -
+ Z Pacific/Tongatapu 12:19:20 - LMT 1901
+ 12:20 - +1220 1941
+ 13 - +13 1999
+-13 ! +13/+14
++13 TO +13/+14
+ Z Pacific/Funafuti 11:56:52 - LMT 1901
+ 12 - +12
+ Z Pacific/Wake 11:6:28 - LMT 1901
+ 12 - +12
+-R $ 1983 o - S 25 0 1 -
+-R $ 1984 1991 - Mar Sun>=23 0 0 -
+-R $ 1984 o - O 23 0 1 -
+-R $ 1985 1991 - S Sun>=23 0 1 -
+-R $ 1992 1993 - Ja Sun>=23 0 0 -
+-R $ 1992 o - O Sun>=23 0 1 -
++R VU 1983 o - S 25 0 1 -
++R VU 1984 1991 - Mar Sun>=23 0 0 -
++R VU 1984 o - O 23 0 1 -
++R VU 1985 1991 - S Sun>=23 0 1 -
++R VU 1992 1993 - Ja Sun>=23 0 0 -
++R VU 1992 o - O Sun>=23 0 1 -
+ Z Pacific/Efate 11:13:16 - LMT 1912 Ja 13
+-11 $ +11/+12
++11 VU +11/+12
+ Z Pacific/Wallis 12:15:20 - LMT 1901
+ 12 - +12
+-R % 1916 o - May 21 2s 1 BST
+-R % 1916 o - O 1 2s 0 GMT
+-R % 1917 o - Ap 8 2s 1 BST
+-R % 1917 o - S 17 2s 0 GMT
+-R % 1918 o - Mar 24 2s 1 BST
+-R % 1918 o - S 30 2s 0 GMT
+-R % 1919 o - Mar 30 2s 1 BST
+-R % 1919 o - S 29 2s 0 GMT
+-R % 1920 o - Mar 28 2s 1 BST
+-R % 1920 o - O 25 2s 0 GMT
+-R % 1921 o - Ap 3 2s 1 BST
+-R % 1921 o - O 3 2s 0 GMT
+-R % 1922 o - Mar 26 2s 1 BST
+-R % 1922 o - O 8 2s 0 GMT
+-R % 1923 o - Ap Sun>=16 2s 1 BST
+-R % 1923 1924 - S Sun>=16 2s 0 GMT
+-R % 1924 o - Ap Sun>=9 2s 1 BST
+-R % 1925 1926 - Ap Sun>=16 2s 1 BST
+-R % 1925 1938 - O Sun>=2 2s 0 GMT
+-R % 1927 o - Ap Sun>=9 2s 1 BST
+-R % 1928 1929 - Ap Sun>=16 2s 1 BST
+-R % 1930 o - Ap Sun>=9 2s 1 BST
+-R % 1931 1932 - Ap Sun>=16 2s 1 BST
+-R % 1933 o - Ap Sun>=9 2s 1 BST
+-R % 1934 o - Ap Sun>=16 2s 1 BST
+-R % 1935 o - Ap Sun>=9 2s 1 BST
+-R % 1936 1937 - Ap Sun>=16 2s 1 BST
+-R % 1938 o - Ap Sun>=9 2s 1 BST
+-R % 1939 o - Ap Sun>=16 2s 1 BST
+-R % 1939 o - N Sun>=16 2s 0 GMT
+-R % 1940 o - F Sun>=23 2s 1 BST
+-R % 1941 o - May Sun>=2 1s 2 BDST
+-R % 1941 1943 - Au Sun>=9 1s 1 BST
+-R % 1942 1944 - Ap Sun>=2 1s 2 BDST
+-R % 1944 o - S Sun>=16 1s 1 BST
+-R % 1945 o - Ap M>=2 1s 2 BDST
+-R % 1945 o - Jul Sun>=9 1s 1 BST
+-R % 1945 1946 - O Sun>=2 2s 0 GMT
+-R % 1946 o - Ap Sun>=9 2s 1 BST
+-R % 1947 o - Mar 16 2s 1 BST
+-R % 1947 o - Ap 13 1s 2 BDST
+-R % 1947 o - Au 10 1s 1 BST
+-R % 1947 o - N 2 2s 0 GMT
+-R % 1948 o - Mar 14 2s 1 BST
+-R % 1948 o - O 31 2s 0 GMT
+-R % 1949 o - Ap 3 2s 1 BST
+-R % 1949 o - O 30 2s 0 GMT
+-R % 1950 1952 - Ap Sun>=14 2s 1 BST
+-R % 1950 1952 - O Sun>=21 2s 0 GMT
+-R % 1953 o - Ap Sun>=16 2s 1 BST
+-R % 1953 1960 - O Sun>=2 2s 0 GMT
+-R % 1954 o - Ap Sun>=9 2s 1 BST
+-R % 1955 1956 - Ap Sun>=16 2s 1 BST
+-R % 1957 o - Ap Sun>=9 2s 1 BST
+-R % 1958 1959 - Ap Sun>=16 2s 1 BST
+-R % 1960 o - Ap Sun>=9 2s 1 BST
+-R % 1961 1963 - Mar lastSun 2s 1 BST
+-R % 1961 1968 - O Sun>=23 2s 0 GMT
+-R % 1964 1967 - Mar Sun>=19 2s 1 BST
+-R % 1968 o - F 18 2s 1 BST
+-R % 1972 1980 - Mar Sun>=16 2s 1 BST
+-R % 1972 1980 - O Sun>=23 2s 0 GMT
+-R % 1981 1995 - Mar lastSun 1u 1 BST
+-R % 1981 1989 - O Sun>=23 1u 0 GMT
+-R % 1990 1995 - O Sun>=22 1u 0 GMT
++R G 1916 o - May 21 2s 1 BST
++R G 1916 o - O 1 2s 0 GMT
++R G 1917 o - Ap 8 2s 1 BST
++R G 1917 o - S 17 2s 0 GMT
++R G 1918 o - Mar 24 2s 1 BST
++R G 1918 o - S 30 2s 0 GMT
++R G 1919 o - Mar 30 2s 1 BST
++R G 1919 o - S 29 2s 0 GMT
++R G 1920 o - Mar 28 2s 1 BST
++R G 1920 o - O 25 2s 0 GMT
++R G 1921 o - Ap 3 2s 1 BST
++R G 1921 o - O 3 2s 0 GMT
++R G 1922 o - Mar 26 2s 1 BST
++R G 1922 o - O 8 2s 0 GMT
++R G 1923 o - Ap Sun>=16 2s 1 BST
++R G 1923 1924 - S Sun>=16 2s 0 GMT
++R G 1924 o - Ap Sun>=9 2s 1 BST
++R G 1925 1926 - Ap Sun>=16 2s 1 BST
++R G 1925 1938 - O Sun>=2 2s 0 GMT
++R G 1927 o - Ap Sun>=9 2s 1 BST
++R G 1928 1929 - Ap Sun>=16 2s 1 BST
++R G 1930 o - Ap Sun>=9 2s 1 BST
++R G 1931 1932 - Ap Sun>=16 2s 1 BST
++R G 1933 o - Ap Sun>=9 2s 1 BST
++R G 1934 o - Ap Sun>=16 2s 1 BST
++R G 1935 o - Ap Sun>=9 2s 1 BST
++R G 1936 1937 - Ap Sun>=16 2s 1 BST
++R G 1938 o - Ap Sun>=9 2s 1 BST
++R G 1939 o - Ap Sun>=16 2s 1 BST
++R G 1939 o - N Sun>=16 2s 0 GMT
++R G 1940 o - F Sun>=23 2s 1 BST
++R G 1941 o - May Sun>=2 1s 2 BDST
++R G 1941 1943 - Au Sun>=9 1s 1 BST
++R G 1942 1944 - Ap Sun>=2 1s 2 BDST
++R G 1944 o - S Sun>=16 1s 1 BST
++R G 1945 o - Ap M>=2 1s 2 BDST
++R G 1945 o - Jul Sun>=9 1s 1 BST
++R G 1945 1946 - O Sun>=2 2s 0 GMT
++R G 1946 o - Ap Sun>=9 2s 1 BST
++R G 1947 o - Mar 16 2s 1 BST
++R G 1947 o - Ap 13 1s 2 BDST
++R G 1947 o - Au 10 1s 1 BST
++R G 1947 o - N 2 2s 0 GMT
++R G 1948 o - Mar 14 2s 1 BST
++R G 1948 o - O 31 2s 0 GMT
++R G 1949 o - Ap 3 2s 1 BST
++R G 1949 o - O 30 2s 0 GMT
++R G 1950 1952 - Ap Sun>=14 2s 1 BST
++R G 1950 1952 - O Sun>=21 2s 0 GMT
++R G 1953 o - Ap Sun>=16 2s 1 BST
++R G 1953 1960 - O Sun>=2 2s 0 GMT
++R G 1954 o - Ap Sun>=9 2s 1 BST
++R G 1955 1956 - Ap Sun>=16 2s 1 BST
++R G 1957 o - Ap Sun>=9 2s 1 BST
++R G 1958 1959 - Ap Sun>=16 2s 1 BST
++R G 1960 o - Ap Sun>=9 2s 1 BST
++R G 1961 1963 - Mar lastSun 2s 1 BST
++R G 1961 1968 - O Sun>=23 2s 0 GMT
++R G 1964 1967 - Mar Sun>=19 2s 1 BST
++R G 1968 o - F 18 2s 1 BST
++R G 1972 1980 - Mar Sun>=16 2s 1 BST
++R G 1972 1980 - O Sun>=23 2s 0 GMT
++R G 1981 1995 - Mar lastSun 1u 1 BST
++R G 1981 1989 - O Sun>=23 1u 0 GMT
++R G 1990 1995 - O Sun>=22 1u 0 GMT
+ Z Europe/London -0:1:15 - LMT 1847 D 1 0s
+-0 % %s 1968 O 27
++0 G %s 1968 O 27
+ 1 - BST 1971 O 31 2u
+-0 % %s 1996
+-0 O GMT/BST
++0 G %s 1996
++0 E GMT/BST
+ Li Europe/London Europe/Jersey
+ Li Europe/London Europe/Guernsey
+ Li Europe/London Europe/Isle_of_Man
+-R & 1971 o - O 31 2u -1 -
+-R & 1972 1980 - Mar Sun>=16 2u 0 -
+-R & 1972 1980 - O Sun>=23 2u -1 -
+-R & 1981 ma - Mar lastSun 1u 0 -
+-R & 1981 1989 - O Sun>=23 1u -1 -
+-R & 1990 1995 - O Sun>=22 1u -1 -
+-R & 1996 ma - O lastSun 1u -1 -
++R IE 1971 o - O 31 2u -1 -
++R IE 1972 1980 - Mar Sun>=16 2u 0 -
++R IE 1972 1980 - O Sun>=23 2u -1 -
++R IE 1981 ma - Mar lastSun 1u 0 -
++R IE 1981 1989 - O Sun>=23 1u -1 -
++R IE 1990 1995 - O Sun>=22 1u -1 -
++R IE 1996 ma - O lastSun 1u -1 -
+ Z Europe/Dublin -0:25 - LMT 1880 Au 2
+ -0:25:21 - DMT 1916 May 21 2s
+ -0:25:21 1 IST 1916 O 1 2s
+-0 % %s 1921 D 6
+-0 % GMT/IST 1940 F 25 2s
++0 G %s 1921 D 6
++0 G GMT/IST 1940 F 25 2s
+ 0 1 IST 1946 O 6 2s
+ 0 - GMT 1947 Mar 16 2s
+ 0 1 IST 1947 N 2 2s
+ 0 - GMT 1948 Ap 18 2s
+-0 % GMT/IST 1968 O 27
+-1 & IST/GMT
+-R O 1977 1980 - Ap Sun>=1 1u 1 S
+-R O 1977 o - S lastSun 1u 0 -
+-R O 1978 o - O 1 1u 0 -
+-R O 1979 1995 - S lastSun 1u 0 -
+-R O 1981 ma - Mar lastSun 1u 1 S
+-R O 1996 ma - O lastSun 1u 0 -
+-R ' 1977 1980 - Ap Sun>=1 1s 1 S
+-R ' 1977 o - S lastSun 1s 0 -
+-R ' 1978 o - O 1 1s 0 -
+-R ' 1979 1995 - S lastSun 1s 0 -
+-R ' 1981 ma - Mar lastSun 1s 1 S
+-R ' 1996 ma - O lastSun 1s 0 -
+-R ( 1916 o - Ap 30 23 1 S
+-R ( 1916 o - O 1 1 0 -
+-R ( 1917 1918 - Ap M>=15 2s 1 S
+-R ( 1917 1918 - S M>=15 2s 0 -
+-R ( 1940 o - Ap 1 2s 1 S
+-R ( 1942 o - N 2 2s 0 -
+-R ( 1943 o - Mar 29 2s 1 S
+-R ( 1943 o - O 4 2s 0 -
+-R ( 1944 1945 - Ap M>=1 2s 1 S
+-R ( 1944 o - O 2 2s 0 -
+-R ( 1945 o - S 16 2s 0 -
+-R ( 1977 1980 - Ap Sun>=1 2s 1 S
+-R ( 1977 o - S lastSun 2s 0 -
+-R ( 1978 o - O 1 2s 0 -
+-R ( 1979 1995 - S lastSun 2s 0 -
+-R ( 1981 ma - Mar lastSun 2s 1 S
+-R ( 1996 ma - O lastSun 2s 0 -
+-R W 1977 1980 - Ap Sun>=1 0 1 S
+-R W 1977 o - S lastSun 0 0 -
+-R W 1978 o - O 1 0 0 -
+-R W 1979 1995 - S lastSun 0 0 -
+-R W 1981 ma - Mar lastSun 0 1 S
+-R W 1996 ma - O lastSun 0 0 -
+-R M 1917 o - Jul 1 23 1 MST
+-R M 1917 o - D 28 0 0 MMT
+-R M 1918 o - May 31 22 2 MDST
+-R M 1918 o - S 16 1 1 MST
+-R M 1919 o - May 31 23 2 MDST
+-R M 1919 o - Jul 1 0u 1 MSD
+-R M 1919 o - Au 16 0 0 MSK
+-R M 1921 o - F 14 23 1 MSD
+-R M 1921 o - Mar 20 23 2 +05
+-R M 1921 o - S 1 0 1 MSD
+-R M 1921 o - O 1 0 0 -
+-R M 1981 1984 - Ap 1 0 1 S
+-R M 1981 1983 - O 1 0 0 -
+-R M 1984 1995 - S lastSun 2s 0 -
+-R M 1985 2010 - Mar lastSun 2s 1 S
+-R M 1996 2010 - O lastSun 2s 0 -
+-Z WET 0 O WE%sT
+-Z CET 1 ( CE%sT
+-Z MET 1 ( ME%sT
+-Z EET 2 O EE%sT
+-R ) 1940 o - Jun 16 0 1 S
+-R ) 1942 o - N 2 3 0 -
+-R ) 1943 o - Mar 29 2 1 S
+-R ) 1943 o - Ap 10 3 0 -
+-R ) 1974 o - May 4 0 1 S
+-R ) 1974 o - O 2 0 0 -
+-R ) 1975 o - May 1 0 1 S
+-R ) 1975 o - O 2 0 0 -
+-R ) 1976 o - May 2 0 1 S
+-R ) 1976 o - O 3 0 0 -
+-R ) 1977 o - May 8 0 1 S
+-R ) 1977 o - O 2 0 0 -
+-R ) 1978 o - May 6 0 1 S
+-R ) 1978 o - O 1 0 0 -
+-R ) 1979 o - May 5 0 1 S
+-R ) 1979 o - S 30 0 0 -
+-R ) 1980 o - May 3 0 1 S
+-R ) 1980 o - O 4 0 0 -
+-R ) 1981 o - Ap 26 0 1 S
+-R ) 1981 o - S 27 0 0 -
+-R ) 1982 o - May 2 0 1 S
+-R ) 1982 o - O 3 0 0 -
+-R ) 1983 o - Ap 18 0 1 S
+-R ) 1983 o - O 1 0 0 -
+-R ) 1984 o - Ap 1 0 1 S
++0 G GMT/IST 1968 O 27
++1 IE IST/GMT
++R E 1977 1980 - Ap Sun>=1 1u 1 S
++R E 1977 o - S lastSun 1u 0 -
++R E 1978 o - O 1 1u 0 -
++R E 1979 1995 - S lastSun 1u 0 -
++R E 1981 ma - Mar lastSun 1u 1 S
++R E 1996 ma - O lastSun 1u 0 -
++R W- 1977 1980 - Ap Sun>=1 1s 1 S
++R W- 1977 o - S lastSun 1s 0 -
++R W- 1978 o - O 1 1s 0 -
++R W- 1979 1995 - S lastSun 1s 0 -
++R W- 1981 ma - Mar lastSun 1s 1 S
++R W- 1996 ma - O lastSun 1s 0 -
++R c 1916 o - Ap 30 23 1 S
++R c 1916 o - O 1 1 0 -
++R c 1917 1918 - Ap M>=15 2s 1 S
++R c 1917 1918 - S M>=15 2s 0 -
++R c 1940 o - Ap 1 2s 1 S
++R c 1942 o - N 2 2s 0 -
++R c 1943 o - Mar 29 2s 1 S
++R c 1943 o - O 4 2s 0 -
++R c 1944 1945 - Ap M>=1 2s 1 S
++R c 1944 o - O 2 2s 0 -
++R c 1945 o - S 16 2s 0 -
++R c 1977 1980 - Ap Sun>=1 2s 1 S
++R c 1977 o - S lastSun 2s 0 -
++R c 1978 o - O 1 2s 0 -
++R c 1979 1995 - S lastSun 2s 0 -
++R c 1981 ma - Mar lastSun 2s 1 S
++R c 1996 ma - O lastSun 2s 0 -
++R e 1977 1980 - Ap Sun>=1 0 1 S
++R e 1977 o - S lastSun 0 0 -
++R e 1978 o - O 1 0 0 -
++R e 1979 1995 - S lastSun 0 0 -
++R e 1981 ma - Mar lastSun 0 1 S
++R e 1996 ma - O lastSun 0 0 -
++R R 1917 o - Jul 1 23 1 MST
++R R 1917 o - D 28 0 0 MMT
++R R 1918 o - May 31 22 2 MDST
++R R 1918 o - S 16 1 1 MST
++R R 1919 o - May 31 23 2 MDST
++R R 1919 o - Jul 1 0u 1 MSD
++R R 1919 o - Au 16 0 0 MSK
++R R 1921 o - F 14 23 1 MSD
++R R 1921 o - Mar 20 23 2 +05
++R R 1921 o - S 1 0 1 MSD
++R R 1921 o - O 1 0 0 -
++R R 1981 1984 - Ap 1 0 1 S
++R R 1981 1983 - O 1 0 0 -
++R R 1984 1995 - S lastSun 2s 0 -
++R R 1985 2010 - Mar lastSun 2s 1 S
++R R 1996 2010 - O lastSun 2s 0 -
++Z WET 0 E WE%sT
++Z CET 1 c CE%sT
++Z MET 1 c ME%sT
++Z EET 2 E EE%sT
++R q 1940 o - Jun 16 0 1 S
++R q 1942 o - N 2 3 0 -
++R q 1943 o - Mar 29 2 1 S
++R q 1943 o - Ap 10 3 0 -
++R q 1974 o - May 4 0 1 S
++R q 1974 o - O 2 0 0 -
++R q 1975 o - May 1 0 1 S
++R q 1975 o - O 2 0 0 -
++R q 1976 o - May 2 0 1 S
++R q 1976 o - O 3 0 0 -
++R q 1977 o - May 8 0 1 S
++R q 1977 o - O 2 0 0 -
++R q 1978 o - May 6 0 1 S
++R q 1978 o - O 1 0 0 -
++R q 1979 o - May 5 0 1 S
++R q 1979 o - S 30 0 0 -
++R q 1980 o - May 3 0 1 S
++R q 1980 o - O 4 0 0 -
++R q 1981 o - Ap 26 0 1 S
++R q 1981 o - S 27 0 0 -
++R q 1982 o - May 2 0 1 S
++R q 1982 o - O 3 0 0 -
++R q 1983 o - Ap 18 0 1 S
++R q 1983 o - O 1 0 0 -
++R q 1984 o - Ap 1 0 1 S
+ Z Europe/Tirane 1:19:20 - LMT 1914
+ 1 - CET 1940 Jun 16
+-1 ) CE%sT 1984 Jul
+-1 O CE%sT
++1 q CE%sT 1984 Jul
++1 E CE%sT
+ Z Europe/Andorra 0:6:4 - LMT 1901
+ 0 - WET 1946 S 30
+ 1 - CET 1985 Mar 31 2
+-1 O CE%sT
+-R * 1920 o - Ap 5 2s 1 S
+-R * 1920 o - S 13 2s 0 -
+-R * 1946 o - Ap 14 2s 1 S
+-R * 1946 1948 - O Sun>=1 2s 0 -
+-R * 1947 o - Ap 6 2s 1 S
+-R * 1948 o - Ap 18 2s 1 S
+-R * 1980 o - Ap 6 0 1 S
+-R * 1980 o - S 28 0 0 -
++1 E CE%sT
++R a 1920 o - Ap 5 2s 1 S
++R a 1920 o - S 13 2s 0 -
++R a 1946 o - Ap 14 2s 1 S
++R a 1946 1948 - O Sun>=1 2s 0 -
++R a 1947 o - Ap 6 2s 1 S
++R a 1948 o - Ap 18 2s 1 S
++R a 1980 o - Ap 6 0 1 S
++R a 1980 o - S 28 0 0 -
+ Z Europe/Vienna 1:5:21 - LMT 1893 Ap
+-1 ( CE%sT 1920
+-1 * CE%sT 1940 Ap 1 2s
+-1 ( CE%sT 1945 Ap 2 2s
++1 c CE%sT 1920
++1 a CE%sT 1940 Ap 1 2s
++1 c CE%sT 1945 Ap 2 2s
+ 1 1 CEST 1945 Ap 12 2s
+ 1 - CET 1946
+-1 * CE%sT 1981
+-1 O CE%sT
++1 a CE%sT 1981
++1 E CE%sT
+ Z Europe/Minsk 1:50:16 - LMT 1880
+ 1:50 - MMT 1924 May 2
+ 2 - EET 1930 Jun 21
+ 3 - MSK 1941 Jun 28
+-1 ( CE%sT 1944 Jul 3
+-3 M MSK/MSD 1990
++1 c CE%sT 1944 Jul 3
++3 R MSK/MSD 1990
+ 3 - MSK 1991 Mar 31 2s
+-2 M EE%sT 2011 Mar 27 2s
++2 R EE%sT 2011 Mar 27 2s
+ 3 - +03
+-R + 1918 o - Mar 9 0s 1 S
+-R + 1918 1919 - O Sat>=1 23s 0 -
+-R + 1919 o - Mar 1 23s 1 S
+-R + 1920 o - F 14 23s 1 S
+-R + 1920 o - O 23 23s 0 -
+-R + 1921 o - Mar 14 23s 1 S
+-R + 1921 o - O 25 23s 0 -
+-R + 1922 o - Mar 25 23s 1 S
+-R + 1922 1927 - O Sat>=1 23s 0 -
+-R + 1923 o - Ap 21 23s 1 S
+-R + 1924 o - Mar 29 23s 1 S
+-R + 1925 o - Ap 4 23s 1 S
+-R + 1926 o - Ap 17 23s 1 S
+-R + 1927 o - Ap 9 23s 1 S
+-R + 1928 o - Ap 14 23s 1 S
+-R + 1928 1938 - O Sun>=2 2s 0 -
+-R + 1929 o - Ap 21 2s 1 S
+-R + 1930 o - Ap 13 2s 1 S
+-R + 1931 o - Ap 19 2s 1 S
+-R + 1932 o - Ap 3 2s 1 S
+-R + 1933 o - Mar 26 2s 1 S
+-R + 1934 o - Ap 8 2s 1 S
+-R + 1935 o - Mar 31 2s 1 S
+-R + 1936 o - Ap 19 2s 1 S
+-R + 1937 o - Ap 4 2s 1 S
+-R + 1938 o - Mar 27 2s 1 S
+-R + 1939 o - Ap 16 2s 1 S
+-R + 1939 o - N 19 2s 0 -
+-R + 1940 o - F 25 2s 1 S
+-R + 1944 o - S 17 2s 0 -
+-R + 1945 o - Ap 2 2s 1 S
+-R + 1945 o - S 16 2s 0 -
+-R + 1946 o - May 19 2s 1 S
+-R + 1946 o - O 7 2s 0 -
++R b 1918 o - Mar 9 0s 1 S
++R b 1918 1919 - O Sat>=1 23s 0 -
++R b 1919 o - Mar 1 23s 1 S
++R b 1920 o - F 14 23s 1 S
++R b 1920 o - O 23 23s 0 -
++R b 1921 o - Mar 14 23s 1 S
++R b 1921 o - O 25 23s 0 -
++R b 1922 o - Mar 25 23s 1 S
++R b 1922 1927 - O Sat>=1 23s 0 -
++R b 1923 o - Ap 21 23s 1 S
++R b 1924 o - Mar 29 23s 1 S
++R b 1925 o - Ap 4 23s 1 S
++R b 1926 o - Ap 17 23s 1 S
++R b 1927 o - Ap 9 23s 1 S
++R b 1928 o - Ap 14 23s 1 S
++R b 1928 1938 - O Sun>=2 2s 0 -
++R b 1929 o - Ap 21 2s 1 S
++R b 1930 o - Ap 13 2s 1 S
++R b 1931 o - Ap 19 2s 1 S
++R b 1932 o - Ap 3 2s 1 S
++R b 1933 o - Mar 26 2s 1 S
++R b 1934 o - Ap 8 2s 1 S
++R b 1935 o - Mar 31 2s 1 S
++R b 1936 o - Ap 19 2s 1 S
++R b 1937 o - Ap 4 2s 1 S
++R b 1938 o - Mar 27 2s 1 S
++R b 1939 o - Ap 16 2s 1 S
++R b 1939 o - N 19 2s 0 -
++R b 1940 o - F 25 2s 1 S
++R b 1944 o - S 17 2s 0 -
++R b 1945 o - Ap 2 2s 1 S
++R b 1945 o - S 16 2s 0 -
++R b 1946 o - May 19 2s 1 S
++R b 1946 o - O 7 2s 0 -
+ Z Europe/Brussels 0:17:30 - LMT 1880
+ 0:17:30 - BMT 1892 May 1 12
+ 0 - WET 1914 N 8
+ 1 - CET 1916 May
+-1 ( CE%sT 1918 N 11 11u
+-0 + WE%sT 1940 May 20 2s
+-1 ( CE%sT 1944 S 3
+-1 + CE%sT 1977
+-1 O CE%sT
+-R , 1979 o - Mar 31 23 1 S
+-R , 1979 o - O 1 1 0 -
+-R , 1980 1982 - Ap Sat>=1 23 1 S
+-R , 1980 o - S 29 1 0 -
+-R , 1981 o - S 27 2 0 -
++1 c CE%sT 1918 N 11 11u
++0 b WE%sT 1940 May 20 2s
++1 c CE%sT 1944 S 3
++1 b CE%sT 1977
++1 E CE%sT
++R BG 1979 o - Mar 31 23 1 S
++R BG 1979 o - O 1 1 0 -
++R BG 1980 1982 - Ap Sat>=1 23 1 S
++R BG 1980 o - S 29 1 0 -
++R BG 1981 o - S 27 2 0 -
+ Z Europe/Sofia 1:33:16 - LMT 1880
+ 1:56:56 - IMT 1894 N 30
+ 2 - EET 1942 N 2 3
+-1 ( CE%sT 1945
++1 c CE%sT 1945
+ 1 - CET 1945 Ap 2 3
+ 2 - EET 1979 Mar 31 23
+-2 , EE%sT 1982 S 26 3
+-2 ( EE%sT 1991
+-2 W EE%sT 1997
+-2 O EE%sT
+-R . 1945 o - Ap M>=1 2s 1 S
+-R . 1945 o - O 1 2s 0 -
+-R . 1946 o - May 6 2s 1 S
+-R . 1946 1949 - O Sun>=1 2s 0 -
+-R . 1947 1948 - Ap Sun>=15 2s 1 S
+-R . 1949 o - Ap 9 2s 1 S
++2 BG EE%sT 1982 S 26 3
++2 c EE%sT 1991
++2 e EE%sT 1997
++2 E EE%sT
++R CZ 1945 o - Ap M>=1 2s 1 S
++R CZ 1945 o - O 1 2s 0 -
++R CZ 1946 o - May 6 2s 1 S
++R CZ 1946 1949 - O Sun>=1 2s 0 -
++R CZ 1947 1948 - Ap Sun>=15 2s 1 S
++R CZ 1949 o - Ap 9 2s 1 S
+ Z Europe/Prague 0:57:44 - LMT 1850
+ 0:57:44 - PMT 1891 O
+-1 ( CE%sT 1945 May 9
+-1 . CE%sT 1946 D 1 3
++1 c CE%sT 1945 May 9
++1 CZ CE%sT 1946 D 1 3
+ 1 -1 GMT 1947 F 23 2
+-1 . CE%sT 1979
+-1 O CE%sT
+-R / 1916 o - May 14 23 1 S
+-R / 1916 o - S 30 23 0 -
+-R / 1940 o - May 15 0 1 S
+-R / 1945 o - Ap 2 2s 1 S
+-R / 1945 o - Au 15 2s 0 -
+-R / 1946 o - May 1 2s 1 S
+-R / 1946 o - S 1 2s 0 -
+-R / 1947 o - May 4 2s 1 S
+-R / 1947 o - Au 10 2s 0 -
+-R / 1948 o - May 9 2s 1 S
+-R / 1948 o - Au 8 2s 0 -
++1 CZ CE%sT 1979
++1 E CE%sT
++R D 1916 o - May 14 23 1 S
++R D 1916 o - S 30 23 0 -
++R D 1940 o - May 15 0 1 S
++R D 1945 o - Ap 2 2s 1 S
++R D 1945 o - Au 15 2s 0 -
++R D 1946 o - May 1 2s 1 S
++R D 1946 o - S 1 2s 0 -
++R D 1947 o - May 4 2s 1 S
++R D 1947 o - Au 10 2s 0 -
++R D 1948 o - May 9 2s 1 S
++R D 1948 o - Au 8 2s 0 -
+ Z Europe/Copenhagen 0:50:20 - LMT 1890
+ 0:50:20 - CMT 1894
+-1 / CE%sT 1942 N 2 2s
+-1 ( CE%sT 1945 Ap 2 2
+-1 / CE%sT 1980
+-1 O CE%sT
++1 D CE%sT 1942 N 2 2s
++1 c CE%sT 1945 Ap 2 2
++1 D CE%sT 1980
++1 E CE%sT
+ Z Atlantic/Faroe -0:27:4 - LMT 1908 Ja 11
+ 0 - WET 1981
+-0 O WE%sT
+-R : 1991 1992 - Mar lastSun 2 1 D
+-R : 1991 1992 - S lastSun 2 0 S
+-R : 1993 2006 - Ap Sun>=1 2 1 D
+-R : 1993 2006 - O lastSun 2 0 S
+-R : 2007 ma - Mar Sun>=8 2 1 D
+-R : 2007 ma - N Sun>=1 2 0 S
++0 E WE%sT
++R Th 1991 1992 - Mar lastSun 2 1 D
++R Th 1991 1992 - S lastSun 2 0 S
++R Th 1993 2006 - Ap Sun>=1 2 1 D
++R Th 1993 2006 - O lastSun 2 0 S
++R Th 2007 ma - Mar Sun>=8 2 1 D
++R Th 2007 ma - N Sun>=1 2 0 S
+ Z America/Danmarkshavn -1:14:40 - LMT 1916 Jul 28
+ -3 - -03 1980 Ap 6 2
+--3 O -03/-02 1996
++-3 E -03/-02 1996
+ 0 - GMT
+ Z America/Scoresbysund -1:27:52 - LMT 1916 Jul 28
+ -2 - -02 1980 Ap 6 2
+--2 ( -02/-01 1981 Mar 29
+--1 O -01/+00
++-2 c -02/-01 1981 Mar 29
++-1 E -01/+00
+ Z America/Godthab -3:26:56 - LMT 1916 Jul 28
+ -3 - -03 1980 Ap 6 2
+--3 O -03/-02
++-3 E -03/-02
+ Z America/Thule -4:35:8 - LMT 1916 Jul 28
+--4 : A%sT
++-4 Th A%sT
+ Z Europe/Tallinn 1:39 - LMT 1880
+ 1:39 - TMT 1918 F
+-1 ( CE%sT 1919 Jul
++1 c CE%sT 1919 Jul
+ 1:39 - TMT 1921 May
+ 2 - EET 1940 Au 6
+ 3 - MSK 1941 S 15
+-1 ( CE%sT 1944 S 22
+-3 M MSK/MSD 1989 Mar 26 2s
++1 c CE%sT 1944 S 22
++3 R MSK/MSD 1989 Mar 26 2s
+ 2 1 EEST 1989 S 24 2s
+-2 ( EE%sT 1998 S 22
+-2 O EE%sT 1999 O 31 4
++2 c EE%sT 1998 S 22
++2 E EE%sT 1999 O 31 4
+ 2 - EET 2002 F 21
+-2 O EE%sT
+-R ; 1942 o - Ap 2 24 1 S
+-R ; 1942 o - O 4 1 0 -
+-R ; 1981 1982 - Mar lastSun 2 1 S
+-R ; 1981 1982 - S lastSun 3 0 -
++2 E EE%sT
++R FI 1942 o - Ap 2 24 1 S
++R FI 1942 o - O 4 1 0 -
++R FI 1981 1982 - Mar lastSun 2 1 S
++R FI 1981 1982 - S lastSun 3 0 -
+ Z Europe/Helsinki 1:39:49 - LMT 1878 May 31
+ 1:39:49 - HMT 1921 May
+-2 ; EE%sT 1983
+-2 O EE%sT
++2 FI EE%sT 1983
++2 E EE%sT
+ Li Europe/Helsinki Europe/Mariehamn
+-R < 1916 o - Jun 14 23s 1 S
+-R < 1916 1919 - O Sun>=1 23s 0 -
+-R < 1917 o - Mar 24 23s 1 S
+-R < 1918 o - Mar 9 23s 1 S
+-R < 1919 o - Mar 1 23s 1 S
+-R < 1920 o - F 14 23s 1 S
+-R < 1920 o - O 23 23s 0 -
+-R < 1921 o - Mar 14 23s 1 S
+-R < 1921 o - O 25 23s 0 -
+-R < 1922 o - Mar 25 23s 1 S
+-R < 1922 1938 - O Sat>=1 23s 0 -
+-R < 1923 o - May 26 23s 1 S
+-R < 1924 o - Mar 29 23s 1 S
+-R < 1925 o - Ap 4 23s 1 S
+-R < 1926 o - Ap 17 23s 1 S
+-R < 1927 o - Ap 9 23s 1 S
+-R < 1928 o - Ap 14 23s 1 S
+-R < 1929 o - Ap 20 23s 1 S
+-R < 1930 o - Ap 12 23s 1 S
+-R < 1931 o - Ap 18 23s 1 S
+-R < 1932 o - Ap 2 23s 1 S
+-R < 1933 o - Mar 25 23s 1 S
+-R < 1934 o - Ap 7 23s 1 S
+-R < 1935 o - Mar 30 23s 1 S
+-R < 1936 o - Ap 18 23s 1 S
+-R < 1937 o - Ap 3 23s 1 S
+-R < 1938 o - Mar 26 23s 1 S
+-R < 1939 o - Ap 15 23s 1 S
+-R < 1939 o - N 18 23s 0 -
+-R < 1940 o - F 25 2 1 S
+-R < 1941 o - May 5 0 2 M
+-R < 1941 o - O 6 0 1 S
+-R < 1942 o - Mar 9 0 2 M
+-R < 1942 o - N 2 3 1 S
+-R < 1943 o - Mar 29 2 2 M
+-R < 1943 o - O 4 3 1 S
+-R < 1944 o - Ap 3 2 2 M
+-R < 1944 o - O 8 1 1 S
+-R < 1945 o - Ap 2 2 2 M
+-R < 1945 o - S 16 3 0 -
+-R < 1976 o - Mar 28 1 1 S
+-R < 1976 o - S 26 1 0 -
++R F 1916 o - Jun 14 23s 1 S
++R F 1916 1919 - O Sun>=1 23s 0 -
++R F 1917 o - Mar 24 23s 1 S
++R F 1918 o - Mar 9 23s 1 S
++R F 1919 o - Mar 1 23s 1 S
++R F 1920 o - F 14 23s 1 S
++R F 1920 o - O 23 23s 0 -
++R F 1921 o - Mar 14 23s 1 S
++R F 1921 o - O 25 23s 0 -
++R F 1922 o - Mar 25 23s 1 S
++R F 1922 1938 - O Sat>=1 23s 0 -
++R F 1923 o - May 26 23s 1 S
++R F 1924 o - Mar 29 23s 1 S
++R F 1925 o - Ap 4 23s 1 S
++R F 1926 o - Ap 17 23s 1 S
++R F 1927 o - Ap 9 23s 1 S
++R F 1928 o - Ap 14 23s 1 S
++R F 1929 o - Ap 20 23s 1 S
++R F 1930 o - Ap 12 23s 1 S
++R F 1931 o - Ap 18 23s 1 S
++R F 1932 o - Ap 2 23s 1 S
++R F 1933 o - Mar 25 23s 1 S
++R F 1934 o - Ap 7 23s 1 S
++R F 1935 o - Mar 30 23s 1 S
++R F 1936 o - Ap 18 23s 1 S
++R F 1937 o - Ap 3 23s 1 S
++R F 1938 o - Mar 26 23s 1 S
++R F 1939 o - Ap 15 23s 1 S
++R F 1939 o - N 18 23s 0 -
++R F 1940 o - F 25 2 1 S
++R F 1941 o - May 5 0 2 M
++R F 1941 o - O 6 0 1 S
++R F 1942 o - Mar 9 0 2 M
++R F 1942 o - N 2 3 1 S
++R F 1943 o - Mar 29 2 2 M
++R F 1943 o - O 4 3 1 S
++R F 1944 o - Ap 3 2 2 M
++R F 1944 o - O 8 1 1 S
++R F 1945 o - Ap 2 2 2 M
++R F 1945 o - S 16 3 0 -
++R F 1976 o - Mar 28 1 1 S
++R F 1976 o - S 26 1 0 -
+ Z Europe/Paris 0:9:21 - LMT 1891 Mar 15 0:1
+ 0:9:21 - PMT 1911 Mar 11 0:1
+-0 < WE%sT 1940 Jun 14 23
+-1 ( CE%sT 1944 Au 25
+-0 < WE%sT 1945 S 16 3
+-1 < CE%sT 1977
+-1 O CE%sT
+-R = 1946 o - Ap 14 2s 1 S
+-R = 1946 o - O 7 2s 0 -
+-R = 1947 1949 - O Sun>=1 2s 0 -
+-R = 1947 o - Ap 6 3s 1 S
+-R = 1947 o - May 11 2s 2 M
+-R = 1947 o - Jun 29 3 1 S
+-R = 1948 o - Ap 18 2s 1 S
+-R = 1949 o - Ap 10 2s 1 S
+-R > 1945 o - May 24 2 2 M
+-R > 1945 o - S 24 3 1 S
+-R > 1945 o - N 18 2s 0 -
++0 F WE%sT 1940 Jun 14 23
++1 c CE%sT 1944 Au 25
++0 F WE%sT 1945 S 16 3
++1 F CE%sT 1977
++1 E CE%sT
++R DE 1946 o - Ap 14 2s 1 S
++R DE 1946 o - O 7 2s 0 -
++R DE 1947 1949 - O Sun>=1 2s 0 -
++R DE 1947 o - Ap 6 3s 1 S
++R DE 1947 o - May 11 2s 2 M
++R DE 1947 o - Jun 29 3 1 S
++R DE 1948 o - Ap 18 2s 1 S
++R DE 1949 o - Ap 10 2s 1 S
++R So 1945 o - May 24 2 2 M
++R So 1945 o - S 24 3 1 S
++R So 1945 o - N 18 2s 0 -
+ Z Europe/Berlin 0:53:28 - LMT 1893 Ap
+-1 ( CE%sT 1945 May 24 2
+-1 > CE%sT 1946
+-1 = CE%sT 1980
+-1 O CE%sT
++1 c CE%sT 1945 May 24 2
++1 So CE%sT 1946
++1 DE CE%sT 1980
++1 E CE%sT
+ Li Europe/Zurich Europe/Busingen
+ Z Europe/Gibraltar -0:21:24 - LMT 1880 Au 2 0s
+-0 % %s 1957 Ap 14 2
++0 G %s 1957 Ap 14 2
+ 1 - CET 1982
+-1 O CE%sT
+-R ? 1932 o - Jul 7 0 1 S
+-R ? 1932 o - S 1 0 0 -
+-R ? 1941 o - Ap 7 0 1 S
+-R ? 1942 o - N 2 3 0 -
+-R ? 1943 o - Mar 30 0 1 S
+-R ? 1943 o - O 4 0 0 -
+-R ? 1952 o - Jul 1 0 1 S
+-R ? 1952 o - N 2 0 0 -
+-R ? 1975 o - Ap 12 0s 1 S
+-R ? 1975 o - N 26 0s 0 -
+-R ? 1976 o - Ap 11 2s 1 S
+-R ? 1976 o - O 10 2s 0 -
+-R ? 1977 1978 - Ap Sun>=1 2s 1 S
+-R ? 1977 o - S 26 2s 0 -
+-R ? 1978 o - S 24 4 0 -
+-R ? 1979 o - Ap 1 9 1 S
+-R ? 1979 o - S 29 2 0 -
+-R ? 1980 o - Ap 1 0 1 S
+-R ? 1980 o - S 28 0 0 -
++1 E CE%sT
++R g 1932 o - Jul 7 0 1 S
++R g 1932 o - S 1 0 0 -
++R g 1941 o - Ap 7 0 1 S
++R g 1942 o - N 2 3 0 -
++R g 1943 o - Mar 30 0 1 S
++R g 1943 o - O 4 0 0 -
++R g 1952 o - Jul 1 0 1 S
++R g 1952 o - N 2 0 0 -
++R g 1975 o - Ap 12 0s 1 S
++R g 1975 o - N 26 0s 0 -
++R g 1976 o - Ap 11 2s 1 S
++R g 1976 o - O 10 2s 0 -
++R g 1977 1978 - Ap Sun>=1 2s 1 S
++R g 1977 o - S 26 2s 0 -
++R g 1978 o - S 24 4 0 -
++R g 1979 o - Ap 1 9 1 S
++R g 1979 o - S 29 2 0 -
++R g 1980 o - Ap 1 0 1 S
++R g 1980 o - S 28 0 0 -
+ Z Europe/Athens 1:34:52 - LMT 1895 S 14
+ 1:34:52 - AMT 1916 Jul 28 0:1
+-2 ? EE%sT 1941 Ap 30
+-1 ? CE%sT 1944 Ap 4
+-2 ? EE%sT 1981
+-2 O EE%sT
+-R @ 1918 o - Ap 1 3 1 S
+-R @ 1918 o - S 16 3 0 -
+-R @ 1919 o - Ap 15 3 1 S
+-R @ 1919 o - N 24 3 0 -
+-R @ 1945 o - May 1 23 1 S
+-R @ 1945 o - N 1 0 0 -
+-R @ 1946 o - Mar 31 2s 1 S
+-R @ 1946 1949 - O Sun>=1 2s 0 -
+-R @ 1947 1949 - Ap Sun>=4 2s 1 S
+-R @ 1950 o - Ap 17 2s 1 S
+-R @ 1950 o - O 23 2s 0 -
+-R @ 1954 1955 - May 23 0 1 S
+-R @ 1954 1955 - O 3 0 0 -
+-R @ 1956 o - Jun Sun>=1 0 1 S
+-R @ 1956 o - S lastSun 0 0 -
+-R @ 1957 o - Jun Sun>=1 1 1 S
+-R @ 1957 o - S lastSun 3 0 -
+-R @ 1980 o - Ap 6 1 1 S
++2 g EE%sT 1941 Ap 30
++1 g CE%sT 1944 Ap 4
++2 g EE%sT 1981
++2 E EE%sT
++R h 1918 o - Ap 1 3 1 S
++R h 1918 o - S 16 3 0 -
++R h 1919 o - Ap 15 3 1 S
++R h 1919 o - N 24 3 0 -
++R h 1945 o - May 1 23 1 S
++R h 1945 o - N 1 0 0 -
++R h 1946 o - Mar 31 2s 1 S
++R h 1946 1949 - O Sun>=1 2s 0 -
++R h 1947 1949 - Ap Sun>=4 2s 1 S
++R h 1950 o - Ap 17 2s 1 S
++R h 1950 o - O 23 2s 0 -
++R h 1954 1955 - May 23 0 1 S
++R h 1954 1955 - O 3 0 0 -
++R h 1956 o - Jun Sun>=1 0 1 S
++R h 1956 o - S lastSun 0 0 -
++R h 1957 o - Jun Sun>=1 1 1 S
++R h 1957 o - S lastSun 3 0 -
++R h 1980 o - Ap 6 1 1 S
+ Z Europe/Budapest 1:16:20 - LMT 1890 O
+-1 ( CE%sT 1918
+-1 @ CE%sT 1941 Ap 8
+-1 ( CE%sT 1945
+-1 @ CE%sT 1980 S 28 2s
+-1 O CE%sT
+-R [ 1917 1919 - F 19 23 1 -
+-R [ 1917 o - O 21 1 0 -
+-R [ 1918 1919 - N 16 1 0 -
+-R [ 1921 o - Mar 19 23 1 -
+-R [ 1921 o - Jun 23 1 0 -
+-R [ 1939 o - Ap 29 23 1 -
+-R [ 1939 o - O 29 2 0 -
+-R [ 1940 o - F 25 2 1 -
+-R [ 1940 1941 - N Sun>=2 1s 0 -
+-R [ 1941 1942 - Mar Sun>=2 1s 1 -
+-R [ 1943 1946 - Mar Sun>=1 1s 1 -
+-R [ 1942 1948 - O Sun>=22 1s 0 -
+-R [ 1947 1967 - Ap Sun>=1 1s 1 -
+-R [ 1949 o - O 30 1s 0 -
+-R [ 1950 1966 - O Sun>=22 1s 0 -
+-R [ 1967 o - O 29 1s 0 -
++1 c CE%sT 1918
++1 h CE%sT 1941 Ap 8
++1 c CE%sT 1945
++1 h CE%sT 1980 S 28 2s
++1 E CE%sT
++R w 1917 1919 - F 19 23 1 -
++R w 1917 o - O 21 1 0 -
++R w 1918 1919 - N 16 1 0 -
++R w 1921 o - Mar 19 23 1 -
++R w 1921 o - Jun 23 1 0 -
++R w 1939 o - Ap 29 23 1 -
++R w 1939 o - O 29 2 0 -
++R w 1940 o - F 25 2 1 -
++R w 1940 1941 - N Sun>=2 1s 0 -
++R w 1941 1942 - Mar Sun>=2 1s 1 -
++R w 1943 1946 - Mar Sun>=1 1s 1 -
++R w 1942 1948 - O Sun>=22 1s 0 -
++R w 1947 1967 - Ap Sun>=1 1s 1 -
++R w 1949 o - O 30 1s 0 -
++R w 1950 1966 - O Sun>=22 1s 0 -
++R w 1967 o - O 29 1s 0 -
+ Z Atlantic/Reykjavik -1:28 - LMT 1908
+--1 [ -01/+00 1968 Ap 7 1s
++-1 w -01/+00 1968 Ap 7 1s
+ 0 - GMT
+-R \ 1916 o - Jun 3 24 1 S
+-R \ 1916 1917 - S 30 24 0 -
+-R \ 1917 o - Mar 31 24 1 S
+-R \ 1918 o - Mar 9 24 1 S
+-R \ 1918 o - O 6 24 0 -
+-R \ 1919 o - Mar 1 24 1 S
+-R \ 1919 o - O 4 24 0 -
+-R \ 1920 o - Mar 20 24 1 S
+-R \ 1920 o - S 18 24 0 -
+-R \ 1940 o - Jun 14 24 1 S
+-R \ 1942 o - N 2 2s 0 -
+-R \ 1943 o - Mar 29 2s 1 S
+-R \ 1943 o - O 4 2s 0 -
+-R \ 1944 o - Ap 2 2s 1 S
+-R \ 1944 o - S 17 2s 0 -
+-R \ 1945 o - Ap 2 2 1 S
+-R \ 1945 o - S 15 1 0 -
+-R \ 1946 o - Mar 17 2s 1 S
+-R \ 1946 o - O 6 2s 0 -
+-R \ 1947 o - Mar 16 0s 1 S
+-R \ 1947 o - O 5 0s 0 -
+-R \ 1948 o - F 29 2s 1 S
+-R \ 1948 o - O 3 2s 0 -
+-R \ 1966 1968 - May Sun>=22 0s 1 S
+-R \ 1966 o - S 24 24 0 -
+-R \ 1967 1969 - S Sun>=22 0s 0 -
+-R \ 1969 o - Jun 1 0s 1 S
+-R \ 1970 o - May 31 0s 1 S
+-R \ 1970 o - S lastSun 0s 0 -
+-R \ 1971 1972 - May Sun>=22 0s 1 S
+-R \ 1971 o - S lastSun 0s 0 -
+-R \ 1972 o - O 1 0s 0 -
+-R \ 1973 o - Jun 3 0s 1 S
+-R \ 1973 1974 - S lastSun 0s 0 -
+-R \ 1974 o - May 26 0s 1 S
+-R \ 1975 o - Jun 1 0s 1 S
+-R \ 1975 1977 - S lastSun 0s 0 -
+-R \ 1976 o - May 30 0s 1 S
+-R \ 1977 1979 - May Sun>=22 0s 1 S
+-R \ 1978 o - O 1 0s 0 -
+-R \ 1979 o - S 30 0s 0 -
++R I 1916 o - Jun 3 24 1 S
++R I 1916 1917 - S 30 24 0 -
++R I 1917 o - Mar 31 24 1 S
++R I 1918 o - Mar 9 24 1 S
++R I 1918 o - O 6 24 0 -
++R I 1919 o - Mar 1 24 1 S
++R I 1919 o - O 4 24 0 -
++R I 1920 o - Mar 20 24 1 S
++R I 1920 o - S 18 24 0 -
++R I 1940 o - Jun 14 24 1 S
++R I 1942 o - N 2 2s 0 -
++R I 1943 o - Mar 29 2s 1 S
++R I 1943 o - O 4 2s 0 -
++R I 1944 o - Ap 2 2s 1 S
++R I 1944 o - S 17 2s 0 -
++R I 1945 o - Ap 2 2 1 S
++R I 1945 o - S 15 1 0 -
++R I 1946 o - Mar 17 2s 1 S
++R I 1946 o - O 6 2s 0 -
++R I 1947 o - Mar 16 0s 1 S
++R I 1947 o - O 5 0s 0 -
++R I 1948 o - F 29 2s 1 S
++R I 1948 o - O 3 2s 0 -
++R I 1966 1968 - May Sun>=22 0s 1 S
++R I 1966 o - S 24 24 0 -
++R I 1967 1969 - S Sun>=22 0s 0 -
++R I 1969 o - Jun 1 0s 1 S
++R I 1970 o - May 31 0s 1 S
++R I 1970 o - S lastSun 0s 0 -
++R I 1971 1972 - May Sun>=22 0s 1 S
++R I 1971 o - S lastSun 0s 0 -
++R I 1972 o - O 1 0s 0 -
++R I 1973 o - Jun 3 0s 1 S
++R I 1973 1974 - S lastSun 0s 0 -
++R I 1974 o - May 26 0s 1 S
++R I 1975 o - Jun 1 0s 1 S
++R I 1975 1977 - S lastSun 0s 0 -
++R I 1976 o - May 30 0s 1 S
++R I 1977 1979 - May Sun>=22 0s 1 S
++R I 1978 o - O 1 0s 0 -
++R I 1979 o - S 30 0s 0 -
+ Z Europe/Rome 0:49:56 - LMT 1866 S 22
+ 0:49:56 - RMT 1893 O 31 23:49:56
+-1 \ CE%sT 1943 S 10
+-1 ( CE%sT 1944 Jun 4
+-1 \ CE%sT 1980
+-1 O CE%sT
++1 I CE%sT 1943 S 10
++1 c CE%sT 1944 Jun 4
++1 I CE%sT 1980
++1 E CE%sT
+ Li Europe/Rome Europe/Vatican
+ Li Europe/Rome Europe/San_Marino
+-R ] 1989 1996 - Mar lastSun 2s 1 S
+-R ] 1989 1996 - S lastSun 2s 0 -
++R LV 1989 1996 - Mar lastSun 2s 1 S
++R LV 1989 1996 - S lastSun 2s 0 -
+ Z Europe/Riga 1:36:34 - LMT 1880
+ 1:36:34 - RMT 1918 Ap 15 2
+ 1:36:34 1 LST 1918 S 16 3
+@@ -1883,13 +1907,13 @@ Z Europe/Riga 1:36:34 - LMT 1880
+ 1:36:34 - RMT 1926 May 11
+ 2 - EET 1940 Au 5
+ 3 - MSK 1941 Jul
+-1 ( CE%sT 1944 O 13
+-3 M MSK/MSD 1989 Mar lastSun 2s
++1 c CE%sT 1944 O 13
++3 R MSK/MSD 1989 Mar lastSun 2s
+ 2 1 EEST 1989 S lastSun 2s
+-2 ] EE%sT 1997 Ja 21
+-2 O EE%sT 2000 F 29
++2 LV EE%sT 1997 Ja 21
++2 E EE%sT 2000 F 29
+ 2 - EET 2001 Ja 2
+-2 O EE%sT
++2 E EE%sT
+ Li Europe/Zurich Europe/Vaduz
+ Z Europe/Vilnius 1:41:16 - LMT 1880
+ 1:24 - WMT 1917
+@@ -1898,783 +1922,776 @@ Z Europe/Vilnius 1:41:16 - LMT 1880
+ 2 - EET 1920 O 9
+ 1 - CET 1940 Au 3
+ 3 - MSK 1941 Jun 24
+-1 ( CE%sT 1944 Au
+-3 M MSK/MSD 1989 Mar 26 2s
+-2 M EE%sT 1991 S 29 2s
+-2 ( EE%sT 1998
++1 c CE%sT 1944 Au
++3 R MSK/MSD 1989 Mar 26 2s
++2 R EE%sT 1991 S 29 2s
++2 c EE%sT 1998
+ 2 - EET 1998 Mar 29 1u
+-1 O CE%sT 1999 O 31 1u
++1 E CE%sT 1999 O 31 1u
+ 2 - EET 2003
+-2 O EE%sT
+-R ^ 1916 o - May 14 23 1 S
+-R ^ 1916 o - O 1 1 0 -
+-R ^ 1917 o - Ap 28 23 1 S
+-R ^ 1917 o - S 17 1 0 -
+-R ^ 1918 o - Ap M>=15 2s 1 S
+-R ^ 1918 o - S M>=15 2s 0 -
+-R ^ 1919 o - Mar 1 23 1 S
+-R ^ 1919 o - O 5 3 0 -
+-R ^ 1920 o - F 14 23 1 S
+-R ^ 1920 o - O 24 2 0 -
+-R ^ 1921 o - Mar 14 23 1 S
+-R ^ 1921 o - O 26 2 0 -
+-R ^ 1922 o - Mar 25 23 1 S
+-R ^ 1922 o - O Sun>=2 1 0 -
+-R ^ 1923 o - Ap 21 23 1 S
+-R ^ 1923 o - O Sun>=2 2 0 -
+-R ^ 1924 o - Mar 29 23 1 S
+-R ^ 1924 1928 - O Sun>=2 1 0 -
+-R ^ 1925 o - Ap 5 23 1 S
+-R ^ 1926 o - Ap 17 23 1 S
+-R ^ 1927 o - Ap 9 23 1 S
+-R ^ 1928 o - Ap 14 23 1 S
+-R ^ 1929 o - Ap 20 23 1 S
++2 E EE%sT
++R LX 1916 o - May 14 23 1 S
++R LX 1916 o - O 1 1 0 -
++R LX 1917 o - Ap 28 23 1 S
++R LX 1917 o - S 17 1 0 -
++R LX 1918 o - Ap M>=15 2s 1 S
++R LX 1918 o - S M>=15 2s 0 -
++R LX 1919 o - Mar 1 23 1 S
++R LX 1919 o - O 5 3 0 -
++R LX 1920 o - F 14 23 1 S
++R LX 1920 o - O 24 2 0 -
++R LX 1921 o - Mar 14 23 1 S
++R LX 1921 o - O 26 2 0 -
++R LX 1922 o - Mar 25 23 1 S
++R LX 1922 o - O Sun>=2 1 0 -
++R LX 1923 o - Ap 21 23 1 S
++R LX 1923 o - O Sun>=2 2 0 -
++R LX 1924 o - Mar 29 23 1 S
++R LX 1924 1928 - O Sun>=2 1 0 -
++R LX 1925 o - Ap 5 23 1 S
++R LX 1926 o - Ap 17 23 1 S
++R LX 1927 o - Ap 9 23 1 S
++R LX 1928 o - Ap 14 23 1 S
++R LX 1929 o - Ap 20 23 1 S
+ Z Europe/Luxembourg 0:24:36 - LMT 1904 Jun
+-1 ^ CE%sT 1918 N 25
+-0 ^ WE%sT 1929 O 6 2s
+-0 + WE%sT 1940 May 14 3
+-1 ( WE%sT 1944 S 18 3
+-1 + CE%sT 1977
+-1 O CE%sT
+-R _ 1973 o - Mar 31 0s 1 S
+-R _ 1973 o - S 29 0s 0 -
+-R _ 1974 o - Ap 21 0s 1 S
+-R _ 1974 o - S 16 0s 0 -
+-R _ 1975 1979 - Ap Sun>=15 2 1 S
+-R _ 1975 1980 - S Sun>=15 2 0 -
+-R _ 1980 o - Mar 31 2 1 S
++1 LX CE%sT 1918 N 25
++0 LX WE%sT 1929 O 6 2s
++0 b WE%sT 1940 May 14 3
++1 c WE%sT 1944 S 18 3
++1 b CE%sT 1977
++1 E CE%sT
++R MT 1973 o - Mar 31 0s 1 S
++R MT 1973 o - S 29 0s 0 -
++R MT 1974 o - Ap 21 0s 1 S
++R MT 1974 o - S 16 0s 0 -
++R MT 1975 1979 - Ap Sun>=15 2 1 S
++R MT 1975 1980 - S Sun>=15 2 0 -
++R MT 1980 o - Mar 31 2 1 S
+ Z Europe/Malta 0:58:4 - LMT 1893 N 2 0s
+-1 \ CE%sT 1973 Mar 31
+-1 _ CE%sT 1981
+-1 O CE%sT
+-R ` 1997 ma - Mar lastSun 2 1 S
+-R ` 1997 ma - O lastSun 3 0 -
++1 I CE%sT 1973 Mar 31
++1 MT CE%sT 1981
++1 E CE%sT
++R MD 1997 ma - Mar lastSun 2 1 S
++R MD 1997 ma - O lastSun 3 0 -
+ Z Europe/Chisinau 1:55:20 - LMT 1880
+ 1:55 - CMT 1918 F 15
+ 1:44:24 - BMT 1931 Jul 24
+-2 { EE%sT 1940 Au 15
++2 z EE%sT 1940 Au 15
+ 2 1 EEST 1941 Jul 17
+-1 ( CE%sT 1944 Au 24
+-3 M MSK/MSD 1990 May 6 2
+-2 M EE%sT 1992
+-2 W EE%sT 1997
+-2 ` EE%sT
++1 c CE%sT 1944 Au 24
++3 R MSK/MSD 1990 May 6 2
++2 R EE%sT 1992
++2 e EE%sT 1997
++2 MD EE%sT
+ Z Europe/Monaco 0:29:32 - LMT 1891 Mar 15
+ 0:9:21 - PMT 1911 Mar 11
+-0 < WE%sT 1945 S 16 3
+-1 < CE%sT 1977
+-1 O CE%sT
+-R | 1916 o - May 1 0 1 NST
+-R | 1916 o - O 1 0 0 AMT
+-R | 1917 o - Ap 16 2s 1 NST
+-R | 1917 o - S 17 2s 0 AMT
+-R | 1918 1921 - Ap M>=1 2s 1 NST
+-R | 1918 1921 - S lastM 2s 0 AMT
+-R | 1922 o - Mar lastSun 2s 1 NST
+-R | 1922 1936 - O Sun>=2 2s 0 AMT
+-R | 1923 o - Jun F>=1 2s 1 NST
+-R | 1924 o - Mar lastSun 2s 1 NST
+-R | 1925 o - Jun F>=1 2s 1 NST
+-R | 1926 1931 - May 15 2s 1 NST
+-R | 1932 o - May 22 2s 1 NST
+-R | 1933 1936 - May 15 2s 1 NST
+-R | 1937 o - May 22 2s 1 NST
+-R | 1937 o - Jul 1 0 1 S
+-R | 1937 1939 - O Sun>=2 2s 0 -
+-R | 1938 1939 - May 15 2s 1 S
+-R | 1945 o - Ap 2 2s 1 S
+-R | 1945 o - S 16 2s 0 -
++0 F WE%sT 1945 S 16 3
++1 F CE%sT 1977
++1 E CE%sT
++R N 1916 o - May 1 0 1 NST
++R N 1916 o - O 1 0 0 AMT
++R N 1917 o - Ap 16 2s 1 NST
++R N 1917 o - S 17 2s 0 AMT
++R N 1918 1921 - Ap M>=1 2s 1 NST
++R N 1918 1921 - S lastM 2s 0 AMT
++R N 1922 o - Mar lastSun 2s 1 NST
++R N 1922 1936 - O Sun>=2 2s 0 AMT
++R N 1923 o - Jun F>=1 2s 1 NST
++R N 1924 o - Mar lastSun 2s 1 NST
++R N 1925 o - Jun F>=1 2s 1 NST
++R N 1926 1931 - May 15 2s 1 NST
++R N 1932 o - May 22 2s 1 NST
++R N 1933 1936 - May 15 2s 1 NST
++R N 1937 o - May 22 2s 1 NST
++R N 1937 o - Jul 1 0 1 S
++R N 1937 1939 - O Sun>=2 2s 0 -
++R N 1938 1939 - May 15 2s 1 S
++R N 1945 o - Ap 2 2s 1 S
++R N 1945 o - S 16 2s 0 -
+ Z Europe/Amsterdam 0:19:32 - LMT 1835
+-0:19:32 | %s 1937 Jul
+-0:20 | +0020/+0120 1940 May 16
+-1 ( CE%sT 1945 Ap 2 2
+-1 | CE%sT 1977
+-1 O CE%sT
+-R } 1916 o - May 22 1 1 S
+-R } 1916 o - S 30 0 0 -
+-R } 1945 o - Ap 2 2s 1 S
+-R } 1945 o - O 1 2s 0 -
+-R } 1959 1964 - Mar Sun>=15 2s 1 S
+-R } 1959 1965 - S Sun>=15 2s 0 -
+-R } 1965 o - Ap 25 2s 1 S
++0:19:32 N %s 1937 Jul
++0:20 N +0020/+0120 1940 May 16
++1 c CE%sT 1945 Ap 2 2
++1 N CE%sT 1977
++1 E CE%sT
++R NO 1916 o - May 22 1 1 S
++R NO 1916 o - S 30 0 0 -
++R NO 1945 o - Ap 2 2s 1 S
++R NO 1945 o - O 1 2s 0 -
++R NO 1959 1964 - Mar Sun>=15 2s 1 S
++R NO 1959 1965 - S Sun>=15 2s 0 -
++R NO 1965 o - Ap 25 2s 1 S
+ Z Europe/Oslo 0:43 - LMT 1895
+-1 } CE%sT 1940 Au 10 23
+-1 ( CE%sT 1945 Ap 2 2
+-1 } CE%sT 1980
+-1 O CE%sT
++1 NO CE%sT 1940 Au 10 23
++1 c CE%sT 1945 Ap 2 2
++1 NO CE%sT 1980
++1 E CE%sT
+ Li Europe/Oslo Arctic/Longyearbyen
+-R ~ 1918 1919 - S 16 2s 0 -
+-R ~ 1919 o - Ap 15 2s 1 S
+-R ~ 1944 o - Ap 3 2s 1 S
+-R ~ 1944 o - O 4 2 0 -
+-R ~ 1945 o - Ap 29 0 1 S
+-R ~ 1945 o - N 1 0 0 -
+-R ~ 1946 o - Ap 14 0s 1 S
+-R ~ 1946 o - O 7 2s 0 -
+-R ~ 1947 o - May 4 2s 1 S
+-R ~ 1947 1949 - O Sun>=1 2s 0 -
+-R ~ 1948 o - Ap 18 2s 1 S
+-R ~ 1949 o - Ap 10 2s 1 S
+-R ~ 1957 o - Jun 2 1s 1 S
+-R ~ 1957 1958 - S lastSun 1s 0 -
+-R ~ 1958 o - Mar 30 1s 1 S
+-R ~ 1959 o - May 31 1s 1 S
+-R ~ 1959 1961 - O Sun>=1 1s 0 -
+-R ~ 1960 o - Ap 3 1s 1 S
+-R ~ 1961 1964 - May lastSun 1s 1 S
+-R ~ 1962 1964 - S lastSun 1s 0 -
++R O 1918 1919 - S 16 2s 0 -
++R O 1919 o - Ap 15 2s 1 S
++R O 1944 o - Ap 3 2s 1 S
++R O 1944 o - O 4 2 0 -
++R O 1945 o - Ap 29 0 1 S
++R O 1945 o - N 1 0 0 -
++R O 1946 o - Ap 14 0s 1 S
++R O 1946 o - O 7 2s 0 -
++R O 1947 o - May 4 2s 1 S
++R O 1947 1949 - O Sun>=1 2s 0 -
++R O 1948 o - Ap 18 2s 1 S
++R O 1949 o - Ap 10 2s 1 S
++R O 1957 o - Jun 2 1s 1 S
++R O 1957 1958 - S lastSun 1s 0 -
++R O 1958 o - Mar 30 1s 1 S
++R O 1959 o - May 31 1s 1 S
++R O 1959 1961 - O Sun>=1 1s 0 -
++R O 1960 o - Ap 3 1s 1 S
++R O 1961 1964 - May lastSun 1s 1 S
++R O 1962 1964 - S lastSun 1s 0 -
+ Z Europe/Warsaw 1:24 - LMT 1880
+ 1:24 - WMT 1915 Au 5
+-1 ( CE%sT 1918 S 16 3
+-2 ~ EE%sT 1922 Jun
+-1 ~ CE%sT 1940 Jun 23 2
+-1 ( CE%sT 1944 O
+-1 ~ CE%sT 1977
+-1 ' CE%sT 1988
+-1 O CE%sT
+-R AA 1916 o - Jun 17 23 1 S
+-R AA 1916 o - N 1 1 0 -
+-R AA 1917 o - F 28 23s 1 S
+-R AA 1917 1921 - O 14 23s 0 -
+-R AA 1918 o - Mar 1 23s 1 S
+-R AA 1919 o - F 28 23s 1 S
+-R AA 1920 o - F 29 23s 1 S
+-R AA 1921 o - F 28 23s 1 S
+-R AA 1924 o - Ap 16 23s 1 S
+-R AA 1924 o - O 14 23s 0 -
+-R AA 1926 o - Ap 17 23s 1 S
+-R AA 1926 1929 - O Sat>=1 23s 0 -
+-R AA 1927 o - Ap 9 23s 1 S
+-R AA 1928 o - Ap 14 23s 1 S
+-R AA 1929 o - Ap 20 23s 1 S
+-R AA 1931 o - Ap 18 23s 1 S
+-R AA 1931 1932 - O Sat>=1 23s 0 -
+-R AA 1932 o - Ap 2 23s 1 S
+-R AA 1934 o - Ap 7 23s 1 S
+-R AA 1934 1938 - O Sat>=1 23s 0 -
+-R AA 1935 o - Mar 30 23s 1 S
+-R AA 1936 o - Ap 18 23s 1 S
+-R AA 1937 o - Ap 3 23s 1 S
+-R AA 1938 o - Mar 26 23s 1 S
+-R AA 1939 o - Ap 15 23s 1 S
+-R AA 1939 o - N 18 23s 0 -
+-R AA 1940 o - F 24 23s 1 S
+-R AA 1940 1941 - O 5 23s 0 -
+-R AA 1941 o - Ap 5 23s 1 S
+-R AA 1942 1945 - Mar Sat>=8 23s 1 S
+-R AA 1942 o - Ap 25 22s 2 M
+-R AA 1942 o - Au 15 22s 1 S
+-R AA 1942 1945 - O Sat>=24 23s 0 -
+-R AA 1943 o - Ap 17 22s 2 M
+-R AA 1943 1945 - Au Sat>=25 22s 1 S
+-R AA 1944 1945 - Ap Sat>=21 22s 2 M
+-R AA 1946 o - Ap Sat>=1 23s 1 S
+-R AA 1946 o - O Sat>=1 23s 0 -
+-R AA 1947 1949 - Ap Sun>=1 2s 1 S
+-R AA 1947 1949 - O Sun>=1 2s 0 -
+-R AA 1951 1965 - Ap Sun>=1 2s 1 S
+-R AA 1951 1965 - O Sun>=1 2s 0 -
+-R AA 1977 o - Mar 27 0s 1 S
+-R AA 1977 o - S 25 0s 0 -
+-R AA 1978 1979 - Ap Sun>=1 0s 1 S
+-R AA 1978 o - O 1 0s 0 -
+-R AA 1979 1982 - S lastSun 1s 0 -
+-R AA 1980 o - Mar lastSun 0s 1 S
+-R AA 1981 1982 - Mar lastSun 1s 1 S
+-R AA 1983 o - Mar lastSun 2s 1 S
++1 c CE%sT 1918 S 16 3
++2 O EE%sT 1922 Jun
++1 O CE%sT 1940 Jun 23 2
++1 c CE%sT 1944 O
++1 O CE%sT 1977
++1 W- CE%sT 1988
++1 E CE%sT
++R p 1916 o - Jun 17 23 1 S
++R p 1916 o - N 1 1 0 -
++R p 1917 o - F 28 23s 1 S
++R p 1917 1921 - O 14 23s 0 -
++R p 1918 o - Mar 1 23s 1 S
++R p 1919 o - F 28 23s 1 S
++R p 1920 o - F 29 23s 1 S
++R p 1921 o - F 28 23s 1 S
++R p 1924 o - Ap 16 23s 1 S
++R p 1924 o - O 14 23s 0 -
++R p 1926 o - Ap 17 23s 1 S
++R p 1926 1929 - O Sat>=1 23s 0 -
++R p 1927 o - Ap 9 23s 1 S
++R p 1928 o - Ap 14 23s 1 S
++R p 1929 o - Ap 20 23s 1 S
++R p 1931 o - Ap 18 23s 1 S
++R p 1931 1932 - O Sat>=1 23s 0 -
++R p 1932 o - Ap 2 23s 1 S
++R p 1934 o - Ap 7 23s 1 S
++R p 1934 1938 - O Sat>=1 23s 0 -
++R p 1935 o - Mar 30 23s 1 S
++R p 1936 o - Ap 18 23s 1 S
++R p 1937 o - Ap 3 23s 1 S
++R p 1938 o - Mar 26 23s 1 S
++R p 1939 o - Ap 15 23s 1 S
++R p 1939 o - N 18 23s 0 -
++R p 1940 o - F 24 23s 1 S
++R p 1940 1941 - O 5 23s 0 -
++R p 1941 o - Ap 5 23s 1 S
++R p 1942 1945 - Mar Sat>=8 23s 1 S
++R p 1942 o - Ap 25 22s 2 M
++R p 1942 o - Au 15 22s 1 S
++R p 1942 1945 - O Sat>=24 23s 0 -
++R p 1943 o - Ap 17 22s 2 M
++R p 1943 1945 - Au Sat>=25 22s 1 S
++R p 1944 1945 - Ap Sat>=21 22s 2 M
++R p 1946 o - Ap Sat>=1 23s 1 S
++R p 1946 o - O Sat>=1 23s 0 -
++R p 1947 1949 - Ap Sun>=1 2s 1 S
++R p 1947 1949 - O Sun>=1 2s 0 -
++R p 1951 1965 - Ap Sun>=1 2s 1 S
++R p 1951 1965 - O Sun>=1 2s 0 -
++R p 1977 o - Mar 27 0s 1 S
++R p 1977 o - S 25 0s 0 -
++R p 1978 1979 - Ap Sun>=1 0s 1 S
++R p 1978 o - O 1 0s 0 -
++R p 1979 1982 - S lastSun 1s 0 -
++R p 1980 o - Mar lastSun 0s 1 S
++R p 1981 1982 - Mar lastSun 1s 1 S
++R p 1983 o - Mar lastSun 2s 1 S
+ Z Europe/Lisbon -0:36:45 - LMT 1884
+ -0:36:45 - LMT 1912 Ja 1 0u
+-0 AA WE%sT 1966 Ap 3 2
++0 p WE%sT 1966 Ap 3 2
+ 1 - CET 1976 S 26 1
+-0 AA WE%sT 1983 S 25 1s
+-0 ' WE%sT 1992 S 27 1s
+-1 O CE%sT 1996 Mar 31 1u
+-0 O WE%sT
++0 p WE%sT 1983 S 25 1s
++0 W- WE%sT 1992 S 27 1s
++1 E CE%sT 1996 Mar 31 1u
++0 E WE%sT
+ Z Atlantic/Azores -1:42:40 - LMT 1884
+ -1:54:32 - HMT 1912 Ja 1 2u
+--2 AA -02/-01 1942 Ap 25 22s
+--2 AA +00 1942 Au 15 22s
+--2 AA -02/-01 1943 Ap 17 22s
+--2 AA +00 1943 Au 28 22s
+--2 AA -02/-01 1944 Ap 22 22s
+--2 AA +00 1944 Au 26 22s
+--2 AA -02/-01 1945 Ap 21 22s
+--2 AA +00 1945 Au 25 22s
+--2 AA -02/-01 1966 Ap 3 2
+--1 AA -01/+00 1983 S 25 1s
+--1 ' -01/+00 1992 S 27 1s
+-0 O WE%sT 1993 Mar 28 1u
+--1 O -01/+00
++-2 p -02/-01 1942 Ap 25 22s
++-2 p +00 1942 Au 15 22s
++-2 p -02/-01 1943 Ap 17 22s
++-2 p +00 1943 Au 28 22s
++-2 p -02/-01 1944 Ap 22 22s
++-2 p +00 1944 Au 26 22s
++-2 p -02/-01 1945 Ap 21 22s
++-2 p +00 1945 Au 25 22s
++-2 p -02/-01 1966 Ap 3 2
++-1 p -01/+00 1983 S 25 1s
++-1 W- -01/+00 1992 S 27 1s
++0 E WE%sT 1993 Mar 28 1u
++-1 E -01/+00
+ Z Atlantic/Madeira -1:7:36 - LMT 1884
+ -1:7:36 - FMT 1912 Ja 1 1u
+--1 AA -01/+00 1942 Ap 25 22s
+--1 AA +01 1942 Au 15 22s
+--1 AA -01/+00 1943 Ap 17 22s
+--1 AA +01 1943 Au 28 22s
+--1 AA -01/+00 1944 Ap 22 22s
+--1 AA +01 1944 Au 26 22s
+--1 AA -01/+00 1945 Ap 21 22s
+--1 AA +01 1945 Au 25 22s
+--1 AA -01/+00 1966 Ap 3 2
+-0 AA WE%sT 1983 S 25 1s
+-0 O WE%sT
+-R { 1932 o - May 21 0s 1 S
+-R { 1932 1939 - O Sun>=1 0s 0 -
+-R { 1933 1939 - Ap Sun>=2 0s 1 S
+-R { 1979 o - May 27 0 1 S
+-R { 1979 o - S lastSun 0 0 -
+-R { 1980 o - Ap 5 23 1 S
+-R { 1980 o - S lastSun 1 0 -
+-R { 1991 1993 - Mar lastSun 0s 1 S
+-R { 1991 1993 - S lastSun 0s 0 -
++-1 p -01/+00 1942 Ap 25 22s
++-1 p +01 1942 Au 15 22s
++-1 p -01/+00 1943 Ap 17 22s
++-1 p +01 1943 Au 28 22s
++-1 p -01/+00 1944 Ap 22 22s
++-1 p +01 1944 Au 26 22s
++-1 p -01/+00 1945 Ap 21 22s
++-1 p +01 1945 Au 25 22s
++-1 p -01/+00 1966 Ap 3 2
++0 p WE%sT 1983 S 25 1s
++0 E WE%sT
++R z 1932 o - May 21 0s 1 S
++R z 1932 1939 - O Sun>=1 0s 0 -
++R z 1933 1939 - Ap Sun>=2 0s 1 S
++R z 1979 o - May 27 0 1 S
++R z 1979 o - S lastSun 0 0 -
++R z 1980 o - Ap 5 23 1 S
++R z 1980 o - S lastSun 1 0 -
++R z 1991 1993 - Mar lastSun 0s 1 S
++R z 1991 1993 - S lastSun 0s 0 -
+ Z Europe/Bucharest 1:44:24 - LMT 1891 O
+ 1:44:24 - BMT 1931 Jul 24
+-2 { EE%sT 1981 Mar 29 2s
+-2 ( EE%sT 1991
+-2 { EE%sT 1994
+-2 W EE%sT 1997
+-2 O EE%sT
++2 z EE%sT 1981 Mar 29 2s
++2 c EE%sT 1991
++2 z EE%sT 1994
++2 e EE%sT 1997
++2 E EE%sT
+ Z Europe/Kaliningrad 1:22 - LMT 1893 Ap
+-1 ( CE%sT 1945
+-2 ~ CE%sT 1946
+-3 M MSK/MSD 1989 Mar 26 2s
+-2 M EE%sT 2011 Mar 27 2s
++1 c CE%sT 1945
++2 O CE%sT 1946
++3 R MSK/MSD 1989 Mar 26 2s
++2 R EE%sT 2011 Mar 27 2s
+ 3 - +03 2014 O 26 2s
+ 2 - EET
+ Z Europe/Moscow 2:30:17 - LMT 1880
+ 2:30:17 - MMT 1916 Jul 3
+-2:31:19 M %s 1919 Jul 1 0u
+-3 M %s 1921 O
+-3 M MSK/MSD 1922 O
++2:31:19 R %s 1919 Jul 1 0u
++3 R %s 1921 O
++3 R MSK/MSD 1922 O
+ 2 - EET 1930 Jun 21
+-3 M MSK/MSD 1991 Mar 31 2s
+-2 M EE%sT 1992 Ja 19 2s
+-3 M MSK/MSD 2011 Mar 27 2s
++3 R MSK/MSD 1991 Mar 31 2s
++2 R EE%sT 1992 Ja 19 2s
++3 R MSK/MSD 2011 Mar 27 2s
+ 4 - MSK 2014 O 26 2s
+ 3 - MSK
+ Z Europe/Simferopol 2:16:24 - LMT 1880
+ 2:16 - SMT 1924 May 2
+ 2 - EET 1930 Jun 21
+ 3 - MSK 1941 N
+-1 ( CE%sT 1944 Ap 13
+-3 M MSK/MSD 1990
++1 c CE%sT 1944 Ap 13
++3 R MSK/MSD 1990
+ 3 - MSK 1990 Jul 1 2
+ 2 - EET 1992
+-2 W EE%sT 1994 May
+-3 W MSK/MSD 1996 Mar 31 0s
++2 e EE%sT 1994 May
++3 e MSK/MSD 1996 Mar 31 0s
+ 3 1 MSD 1996 O 27 3s
+-3 M MSK/MSD 1997
++3 R MSK/MSD 1997
+ 3 - MSK 1997 Mar lastSun 1u
+-2 O EE%sT 2014 Mar 30 2
++2 E EE%sT 2014 Mar 30 2
+ 4 - MSK 2014 O 26 2s
+ 3 - MSK
+ Z Europe/Astrakhan 3:12:12 - LMT 1924 May
+ 3 - +03 1930 Jun 21
+-4 M +04/+05 1989 Mar 26 2s
+-3 M +03/+04 1991 Mar 31 2s
++4 R +04/+05 1989 Mar 26 2s
++3 R +03/+04 1991 Mar 31 2s
+ 4 - +04 1992 Mar 29 2s
+-3 M +03/+04 2011 Mar 27 2s
++3 R +03/+04 2011 Mar 27 2s
+ 4 - +04 2014 O 26 2s
+ 3 - +03 2016 Mar 27 2s
+ 4 - +04
+ Z Europe/Volgograd 2:57:40 - LMT 1920 Ja 3
+ 3 - +03 1930 Jun 21
+ 4 - +04 1961 N 11
+-4 M +04/+05 1988 Mar 27 2s
+-3 M +03/+04 1991 Mar 31 2s
++4 R +04/+05 1988 Mar 27 2s
++3 R +03/+04 1991 Mar 31 2s
+ 4 - +04 1992 Mar 29 2s
+-3 M +03/+04 2011 Mar 27 2s
++3 R +03/+04 2011 Mar 27 2s
+ 4 - +04 2014 O 26 2s
+-3 - +03
++3 - +03 2018 O 28 2s
++4 - +04
+ Z Europe/Saratov 3:4:18 - LMT 1919 Jul 1 0u
+ 3 - +03 1930 Jun 21
+-4 M +04/+05 1988 Mar 27 2s
+-3 M +03/+04 1991 Mar 31 2s
++4 R +04/+05 1988 Mar 27 2s
++3 R +03/+04 1991 Mar 31 2s
+ 4 - +04 1992 Mar 29 2s
+-3 M +03/+04 2011 Mar 27 2s
++3 R +03/+04 2011 Mar 27 2s
+ 4 - +04 2014 O 26 2s
+ 3 - +03 2016 D 4 2s
+ 4 - +04
+ Z Europe/Kirov 3:18:48 - LMT 1919 Jul 1 0u
+ 3 - +03 1930 Jun 21
+-4 M +04/+05 1989 Mar 26 2s
+-3 M +03/+04 1991 Mar 31 2s
++4 R +04/+05 1989 Mar 26 2s
++3 R +03/+04 1991 Mar 31 2s
+ 4 - +04 1992 Mar 29 2s
+-3 M +03/+04 2011 Mar 27 2s
++3 R +03/+04 2011 Mar 27 2s
+ 4 - +04 2014 O 26 2s
+ 3 - +03
+ Z Europe/Samara 3:20:20 - LMT 1919 Jul 1 0u
+ 3 - +03 1930 Jun 21
+ 4 - +04 1935 Ja 27
+-4 M +04/+05 1989 Mar 26 2s
+-3 M +03/+04 1991 Mar 31 2s
+-2 M +02/+03 1991 S 29 2s
++4 R +04/+05 1989 Mar 26 2s
++3 R +03/+04 1991 Mar 31 2s
++2 R +02/+03 1991 S 29 2s
+ 3 - +03 1991 O 20 3
+-4 M +04/+05 2010 Mar 28 2s
+-3 M +03/+04 2011 Mar 27 2s
++4 R +04/+05 2010 Mar 28 2s
++3 R +03/+04 2011 Mar 27 2s
+ 4 - +04
+ Z Europe/Ulyanovsk 3:13:36 - LMT 1919 Jul 1 0u
+ 3 - +03 1930 Jun 21
+-4 M +04/+05 1989 Mar 26 2s
+-3 M +03/+04 1991 Mar 31 2s
+-2 M +02/+03 1992 Ja 19 2s
+-3 M +03/+04 2011 Mar 27 2s
++4 R +04/+05 1989 Mar 26 2s
++3 R +03/+04 1991 Mar 31 2s
++2 R +02/+03 1992 Ja 19 2s
++3 R +03/+04 2011 Mar 27 2s
+ 4 - +04 2014 O 26 2s
+ 3 - +03 2016 Mar 27 2s
+ 4 - +04
+ Z Asia/Yekaterinburg 4:2:33 - LMT 1916 Jul 3
+ 3:45:5 - PMT 1919 Jul 15 4
+ 4 - +04 1930 Jun 21
+-5 M +05/+06 1991 Mar 31 2s
+-4 M +04/+05 1992 Ja 19 2s
+-5 M +05/+06 2011 Mar 27 2s
++5 R +05/+06 1991 Mar 31 2s
++4 R +04/+05 1992 Ja 19 2s
++5 R +05/+06 2011 Mar 27 2s
+ 6 - +06 2014 O 26 2s
+ 5 - +05
+ Z Asia/Omsk 4:53:30 - LMT 1919 N 14
+ 5 - +05 1930 Jun 21
+-6 M +06/+07 1991 Mar 31 2s
+-5 M +05/+06 1992 Ja 19 2s
+-6 M +06/+07 2011 Mar 27 2s
++6 R +06/+07 1991 Mar 31 2s
++5 R +05/+06 1992 Ja 19 2s
++6 R +06/+07 2011 Mar 27 2s
+ 7 - +07 2014 O 26 2s
+ 6 - +06
+ Z Asia/Barnaul 5:35 - LMT 1919 D 10
+ 6 - +06 1930 Jun 21
+-7 M +07/+08 1991 Mar 31 2s
+-6 M +06/+07 1992 Ja 19 2s
+-7 M +07/+08 1995 May 28
+-6 M +06/+07 2011 Mar 27 2s
++7 R +07/+08 1991 Mar 31 2s
++6 R +06/+07 1992 Ja 19 2s
++7 R +07/+08 1995 May 28
++6 R +06/+07 2011 Mar 27 2s
+ 7 - +07 2014 O 26 2s
+ 6 - +06 2016 Mar 27 2s
+ 7 - +07
+ Z Asia/Novosibirsk 5:31:40 - LMT 1919 D 14 6
+ 6 - +06 1930 Jun 21
+-7 M +07/+08 1991 Mar 31 2s
+-6 M +06/+07 1992 Ja 19 2s
+-7 M +07/+08 1993 May 23
+-6 M +06/+07 2011 Mar 27 2s
++7 R +07/+08 1991 Mar 31 2s
++6 R +06/+07 1992 Ja 19 2s
++7 R +07/+08 1993 May 23
++6 R +06/+07 2011 Mar 27 2s
+ 7 - +07 2014 O 26 2s
+ 6 - +06 2016 Jul 24 2s
+ 7 - +07
+ Z Asia/Tomsk 5:39:51 - LMT 1919 D 22
+ 6 - +06 1930 Jun 21
+-7 M +07/+08 1991 Mar 31 2s
+-6 M +06/+07 1992 Ja 19 2s
+-7 M +07/+08 2002 May 1 3
+-6 M +06/+07 2011 Mar 27 2s
++7 R +07/+08 1991 Mar 31 2s
++6 R +06/+07 1992 Ja 19 2s
++7 R +07/+08 2002 May 1 3
++6 R +06/+07 2011 Mar 27 2s
+ 7 - +07 2014 O 26 2s
+ 6 - +06 2016 May 29 2s
+ 7 - +07
+ Z Asia/Novokuznetsk 5:48:48 - LMT 1924 May
+ 6 - +06 1930 Jun 21
+-7 M +07/+08 1991 Mar 31 2s
+-6 M +06/+07 1992 Ja 19 2s
+-7 M +07/+08 2010 Mar 28 2s
+-6 M +06/+07 2011 Mar 27 2s
++7 R +07/+08 1991 Mar 31 2s
++6 R +06/+07 1992 Ja 19 2s
++7 R +07/+08 2010 Mar 28 2s
++6 R +06/+07 2011 Mar 27 2s
+ 7 - +07
+ Z Asia/Krasnoyarsk 6:11:26 - LMT 1920 Ja 6
+ 6 - +06 1930 Jun 21
+-7 M +07/+08 1991 Mar 31 2s
+-6 M +06/+07 1992 Ja 19 2s
+-7 M +07/+08 2011 Mar 27 2s
++7 R +07/+08 1991 Mar 31 2s
++6 R +06/+07 1992 Ja 19 2s
++7 R +07/+08 2011 Mar 27 2s
+ 8 - +08 2014 O 26 2s
+ 7 - +07
+ Z Asia/Irkutsk 6:57:5 - LMT 1880
+ 6:57:5 - IMT 1920 Ja 25
+ 7 - +07 1930 Jun 21
+-8 M +08/+09 1991 Mar 31 2s
+-7 M +07/+08 1992 Ja 19 2s
+-8 M +08/+09 2011 Mar 27 2s
++8 R +08/+09 1991 Mar 31 2s
++7 R +07/+08 1992 Ja 19 2s
++8 R +08/+09 2011 Mar 27 2s
+ 9 - +09 2014 O 26 2s
+ 8 - +08
+ Z Asia/Chita 7:33:52 - LMT 1919 D 15
+ 8 - +08 1930 Jun 21
+-9 M +09/+10 1991 Mar 31 2s
+-8 M +08/+09 1992 Ja 19 2s
+-9 M +09/+10 2011 Mar 27 2s
++9 R +09/+10 1991 Mar 31 2s
++8 R +08/+09 1992 Ja 19 2s
++9 R +09/+10 2011 Mar 27 2s
+ 10 - +10 2014 O 26 2s
+ 8 - +08 2016 Mar 27 2
+ 9 - +09
+ Z Asia/Yakutsk 8:38:58 - LMT 1919 D 15
+ 8 - +08 1930 Jun 21
+-9 M +09/+10 1991 Mar 31 2s
+-8 M +08/+09 1992 Ja 19 2s
+-9 M +09/+10 2011 Mar 27 2s
++9 R +09/+10 1991 Mar 31 2s
++8 R +08/+09 1992 Ja 19 2s
++9 R +09/+10 2011 Mar 27 2s
+ 10 - +10 2014 O 26 2s
+ 9 - +09
+ Z Asia/Vladivostok 8:47:31 - LMT 1922 N 15
+ 9 - +09 1930 Jun 21
+-10 M +10/+11 1991 Mar 31 2s
+-9 M +09/+10 1992 Ja 19 2s
+-10 M +10/+11 2011 Mar 27 2s
++10 R +10/+11 1991 Mar 31 2s
++9 R +09/+10 1992 Ja 19 2s
++10 R +10/+11 2011 Mar 27 2s
+ 11 - +11 2014 O 26 2s
+ 10 - +10
+ Z Asia/Khandyga 9:2:13 - LMT 1919 D 15
+ 8 - +08 1930 Jun 21
+-9 M +09/+10 1991 Mar 31 2s
+-8 M +08/+09 1992 Ja 19 2s
+-9 M +09/+10 2004
+-10 M +10/+11 2011 Mar 27 2s
++9 R +09/+10 1991 Mar 31 2s
++8 R +08/+09 1992 Ja 19 2s
++9 R +09/+10 2004
++10 R +10/+11 2011 Mar 27 2s
+ 11 - +11 2011 S 13 0s
+ 10 - +10 2014 O 26 2s
+ 9 - +09
+ Z Asia/Sakhalin 9:30:48 - LMT 1905 Au 23
+ 9 - +09 1945 Au 25
+-11 M +11/+12 1991 Mar 31 2s
+-10 M +10/+11 1992 Ja 19 2s
+-11 M +11/+12 1997 Mar lastSun 2s
+-10 M +10/+11 2011 Mar 27 2s
++11 R +11/+12 1991 Mar 31 2s
++10 R +10/+11 1992 Ja 19 2s
++11 R +11/+12 1997 Mar lastSun 2s
++10 R +10/+11 2011 Mar 27 2s
+ 11 - +11 2014 O 26 2s
+ 10 - +10 2016 Mar 27 2s
+ 11 - +11
+ Z Asia/Magadan 10:3:12 - LMT 1924 May 2
+ 10 - +10 1930 Jun 21
+-11 M +11/+12 1991 Mar 31 2s
+-10 M +10/+11 1992 Ja 19 2s
+-11 M +11/+12 2011 Mar 27 2s
++11 R +11/+12 1991 Mar 31 2s
++10 R +10/+11 1992 Ja 19 2s
++11 R +11/+12 2011 Mar 27 2s
+ 12 - +12 2014 O 26 2s
+ 10 - +10 2016 Ap 24 2s
+ 11 - +11
+ Z Asia/Srednekolymsk 10:14:52 - LMT 1924 May 2
+ 10 - +10 1930 Jun 21
+-11 M +11/+12 1991 Mar 31 2s
+-10 M +10/+11 1992 Ja 19 2s
+-11 M +11/+12 2011 Mar 27 2s
++11 R +11/+12 1991 Mar 31 2s
++10 R +10/+11 1992 Ja 19 2s
++11 R +11/+12 2011 Mar 27 2s
+ 12 - +12 2014 O 26 2s
+ 11 - +11
+ Z Asia/Ust-Nera 9:32:54 - LMT 1919 D 15
+ 8 - +08 1930 Jun 21
+-9 M +09/+10 1981 Ap
+-11 M +11/+12 1991 Mar 31 2s
+-10 M +10/+11 1992 Ja 19 2s
+-11 M +11/+12 2011 Mar 27 2s
++9 R +09/+10 1981 Ap
++11 R +11/+12 1991 Mar 31 2s
++10 R +10/+11 1992 Ja 19 2s
++11 R +11/+12 2011 Mar 27 2s
+ 12 - +12 2011 S 13 0s
+ 11 - +11 2014 O 26 2s
+ 10 - +10
+ Z Asia/Kamchatka 10:34:36 - LMT 1922 N 10
+ 11 - +11 1930 Jun 21
+-12 M +12/+13 1991 Mar 31 2s
+-11 M +11/+12 1992 Ja 19 2s
+-12 M +12/+13 2010 Mar 28 2s
+-11 M +11/+12 2011 Mar 27 2s
++12 R +12/+13 1991 Mar 31 2s
++11 R +11/+12 1992 Ja 19 2s
++12 R +12/+13 2010 Mar 28 2s
++11 R +11/+12 2011 Mar 27 2s
+ 12 - +12
+ Z Asia/Anadyr 11:49:56 - LMT 1924 May 2
+ 12 - +12 1930 Jun 21
+-13 M +13/+14 1982 Ap 1 0s
+-12 M +12/+13 1991 Mar 31 2s
+-11 M +11/+12 1992 Ja 19 2s
+-12 M +12/+13 2010 Mar 28 2s
+-11 M +11/+12 2011 Mar 27 2s
++13 R +13/+14 1982 Ap 1 0s
++12 R +12/+13 1991 Mar 31 2s
++11 R +11/+12 1992 Ja 19 2s
++12 R +12/+13 2010 Mar 28 2s
++11 R +11/+12 2011 Mar 27 2s
+ 12 - +12
+ Z Europe/Belgrade 1:22 - LMT 1884
+ 1 - CET 1941 Ap 18 23
+-1 ( CE%sT 1945
++1 c CE%sT 1945
+ 1 - CET 1945 May 8 2s
+ 1 1 CEST 1945 S 16 2s
+ 1 - CET 1982 N 27
+-1 O CE%sT
++1 E CE%sT
+ Li Europe/Belgrade Europe/Ljubljana
+ Li Europe/Belgrade Europe/Podgorica
+ Li Europe/Belgrade Europe/Sarajevo
+ Li Europe/Belgrade Europe/Skopje
+ Li Europe/Belgrade Europe/Zagreb
+ Li Europe/Prague Europe/Bratislava
+-R AB 1918 o - Ap 15 23 1 S
+-R AB 1918 1919 - O 6 24s 0 -
+-R AB 1919 o - Ap 6 23 1 S
+-R AB 1924 o - Ap 16 23 1 S
+-R AB 1924 o - O 4 24s 0 -
+-R AB 1926 o - Ap 17 23 1 S
+-R AB 1926 1929 - O Sat>=1 24s 0 -
+-R AB 1927 o - Ap 9 23 1 S
+-R AB 1928 o - Ap 15 0 1 S
+-R AB 1929 o - Ap 20 23 1 S
+-R AB 1937 o - Jun 16 23 1 S
+-R AB 1937 o - O 2 24s 0 -
+-R AB 1938 o - Ap 2 23 1 S
+-R AB 1938 o - Ap 30 23 2 M
+-R AB 1938 o - O 2 24 1 S
+-R AB 1939 o - O 7 24s 0 -
+-R AB 1942 o - May 2 23 1 S
+-R AB 1942 o - S 1 1 0 -
+-R AB 1943 1946 - Ap Sat>=13 23 1 S
+-R AB 1943 1944 - O Sun>=1 1 0 -
+-R AB 1945 1946 - S lastSun 1 0 -
+-R AB 1949 o - Ap 30 23 1 S
+-R AB 1949 o - O 2 1 0 -
+-R AB 1974 1975 - Ap Sat>=12 23 1 S
+-R AB 1974 1975 - O Sun>=1 1 0 -
+-R AB 1976 o - Mar 27 23 1 S
+-R AB 1976 1977 - S lastSun 1 0 -
+-R AB 1977 o - Ap 2 23 1 S
+-R AB 1978 o - Ap 2 2s 1 S
+-R AB 1978 o - O 1 2s 0 -
+-R AC 1967 o - Jun 3 12 1 S
+-R AC 1967 o - O 1 0 0 -
+-R AC 1974 o - Jun 24 0 1 S
+-R AC 1974 o - S 1 0 0 -
+-R AC 1976 1977 - May 1 0 1 S
+-R AC 1976 o - Au 1 0 0 -
+-R AC 1977 o - S 28 0 0 -
+-R AC 1978 o - Jun 1 0 1 S
+-R AC 1978 o - Au 4 0 0 -
++R s 1918 o - Ap 15 23 1 S
++R s 1918 1919 - O 6 24s 0 -
++R s 1919 o - Ap 6 23 1 S
++R s 1924 o - Ap 16 23 1 S
++R s 1924 o - O 4 24s 0 -
++R s 1926 o - Ap 17 23 1 S
++R s 1926 1929 - O Sat>=1 24s 0 -
++R s 1927 o - Ap 9 23 1 S
++R s 1928 o - Ap 15 0 1 S
++R s 1929 o - Ap 20 23 1 S
++R s 1937 o - Jun 16 23 1 S
++R s 1937 o - O 2 24s 0 -
++R s 1938 o - Ap 2 23 1 S
++R s 1938 o - Ap 30 23 2 M
++R s 1938 o - O 2 24 1 S
++R s 1939 o - O 7 24s 0 -
++R s 1942 o - May 2 23 1 S
++R s 1942 o - S 1 1 0 -
++R s 1943 1946 - Ap Sat>=13 23 1 S
++R s 1943 1944 - O Sun>=1 1 0 -
++R s 1945 1946 - S lastSun 1 0 -
++R s 1949 o - Ap 30 23 1 S
++R s 1949 o - O 2 1 0 -
++R s 1974 1975 - Ap Sat>=12 23 1 S
++R s 1974 1975 - O Sun>=1 1 0 -
++R s 1976 o - Mar 27 23 1 S
++R s 1976 1977 - S lastSun 1 0 -
++R s 1977 o - Ap 2 23 1 S
++R s 1978 o - Ap 2 2s 1 S
++R s 1978 o - O 1 2s 0 -
+ Z Europe/Madrid -0:14:44 - LMT 1900 D 31 23:45:16
+-0 AB WE%sT 1940 Mar 16 23
+-1 AB CE%sT 1979
+-1 O CE%sT
++0 s WE%sT 1940 Mar 16 23
++1 s CE%sT 1979
++1 E CE%sT
+ Z Africa/Ceuta -0:21:16 - LMT 1900 D 31 23:38:44
+ 0 - WET 1918 May 6 23
+ 0 1 WEST 1918 O 7 23
+ 0 - WET 1924
+-0 AB WE%sT 1929
+-0 AC WE%sT 1984 Mar 16
++0 s WE%sT 1929
++0 - WET 1967
++0 M WE%sT 1984 Mar 16
+ 1 - CET 1986
+-1 O CE%sT
++1 E CE%sT
+ Z Atlantic/Canary -1:1:36 - LMT 1922 Mar
+ -1 - -01 1946 S 30 1
+ 0 - WET 1980 Ap 6 0s
+ 0 1 WEST 1980 S 28 1u
+-0 O WE%sT
++0 E WE%sT
+ Z Europe/Stockholm 1:12:12 - LMT 1879
+ 1:0:14 - SET 1900
+ 1 - CET 1916 May 14 23
+ 1 1 CEST 1916 O 1 1
+ 1 - CET 1980
+-1 O CE%sT
+-R AD 1941 1942 - May M>=1 1 1 S
+-R AD 1941 1942 - O M>=1 2 0 -
++1 E CE%sT
++R CH 1941 1942 - May M>=1 1 1 S
++R CH 1941 1942 - O M>=1 2 0 -
+ Z Europe/Zurich 0:34:8 - LMT 1853 Jul 16
+ 0:29:46 - BMT 1894 Jun
+-1 AD CE%sT 1981
+-1 O CE%sT
+-R AE 1916 o - May 1 0 1 S
+-R AE 1916 o - O 1 0 0 -
+-R AE 1920 o - Mar 28 0 1 S
+-R AE 1920 o - O 25 0 0 -
+-R AE 1921 o - Ap 3 0 1 S
+-R AE 1921 o - O 3 0 0 -
+-R AE 1922 o - Mar 26 0 1 S
+-R AE 1922 o - O 8 0 0 -
+-R AE 1924 o - May 13 0 1 S
+-R AE 1924 1925 - O 1 0 0 -
+-R AE 1925 o - May 1 0 1 S
+-R AE 1940 o - Jun 30 0 1 S
+-R AE 1940 o - O 5 0 0 -
+-R AE 1940 o - D 1 0 1 S
+-R AE 1941 o - S 21 0 0 -
+-R AE 1942 o - Ap 1 0 1 S
+-R AE 1942 o - N 1 0 0 -
+-R AE 1945 o - Ap 2 0 1 S
+-R AE 1945 o - O 8 0 0 -
+-R AE 1946 o - Jun 1 0 1 S
+-R AE 1946 o - O 1 0 0 -
+-R AE 1947 1948 - Ap Sun>=16 0 1 S
+-R AE 1947 1950 - O Sun>=2 0 0 -
+-R AE 1949 o - Ap 10 0 1 S
+-R AE 1950 o - Ap 19 0 1 S
+-R AE 1951 o - Ap 22 0 1 S
+-R AE 1951 o - O 8 0 0 -
+-R AE 1962 o - Jul 15 0 1 S
+-R AE 1962 o - O 8 0 0 -
+-R AE 1964 o - May 15 0 1 S
+-R AE 1964 o - O 1 0 0 -
+-R AE 1970 1972 - May Sun>=2 0 1 S
+-R AE 1970 1972 - O Sun>=2 0 0 -
+-R AE 1973 o - Jun 3 1 1 S
+-R AE 1973 o - N 4 3 0 -
+-R AE 1974 o - Mar 31 2 1 S
+-R AE 1974 o - N 3 5 0 -
+-R AE 1975 o - Mar 30 0 1 S
+-R AE 1975 1976 - O lastSun 0 0 -
+-R AE 1976 o - Jun 1 0 1 S
+-R AE 1977 1978 - Ap Sun>=1 0 1 S
+-R AE 1977 o - O 16 0 0 -
+-R AE 1979 1980 - Ap Sun>=1 3 1 S
+-R AE 1979 1982 - O M>=11 0 0 -
+-R AE 1981 1982 - Mar lastSun 3 1 S
+-R AE 1983 o - Jul 31 0 1 S
+-R AE 1983 o - O 2 0 0 -
+-R AE 1985 o - Ap 20 0 1 S
+-R AE 1985 o - S 28 0 0 -
+-R AE 1986 1993 - Mar lastSun 1s 1 S
+-R AE 1986 1995 - S lastSun 1s 0 -
+-R AE 1994 o - Mar 20 1s 1 S
+-R AE 1995 2006 - Mar lastSun 1s 1 S
+-R AE 1996 2006 - O lastSun 1s 0 -
++1 CH CE%sT 1981
++1 E CE%sT
++R T 1916 o - May 1 0 1 S
++R T 1916 o - O 1 0 0 -
++R T 1920 o - Mar 28 0 1 S
++R T 1920 o - O 25 0 0 -
++R T 1921 o - Ap 3 0 1 S
++R T 1921 o - O 3 0 0 -
++R T 1922 o - Mar 26 0 1 S
++R T 1922 o - O 8 0 0 -
++R T 1924 o - May 13 0 1 S
++R T 1924 1925 - O 1 0 0 -
++R T 1925 o - May 1 0 1 S
++R T 1940 o - Jun 30 0 1 S
++R T 1940 o - O 5 0 0 -
++R T 1940 o - D 1 0 1 S
++R T 1941 o - S 21 0 0 -
++R T 1942 o - Ap 1 0 1 S
++R T 1942 o - N 1 0 0 -
++R T 1945 o - Ap 2 0 1 S
++R T 1945 o - O 8 0 0 -
++R T 1946 o - Jun 1 0 1 S
++R T 1946 o - O 1 0 0 -
++R T 1947 1948 - Ap Sun>=16 0 1 S
++R T 1947 1950 - O Sun>=2 0 0 -
++R T 1949 o - Ap 10 0 1 S
++R T 1950 o - Ap 19 0 1 S
++R T 1951 o - Ap 22 0 1 S
++R T 1951 o - O 8 0 0 -
++R T 1962 o - Jul 15 0 1 S
++R T 1962 o - O 8 0 0 -
++R T 1964 o - May 15 0 1 S
++R T 1964 o - O 1 0 0 -
++R T 1970 1972 - May Sun>=2 0 1 S
++R T 1970 1972 - O Sun>=2 0 0 -
++R T 1973 o - Jun 3 1 1 S
++R T 1973 o - N 4 3 0 -
++R T 1974 o - Mar 31 2 1 S
++R T 1974 o - N 3 5 0 -
++R T 1975 o - Mar 30 0 1 S
++R T 1975 1976 - O lastSun 0 0 -
++R T 1976 o - Jun 1 0 1 S
++R T 1977 1978 - Ap Sun>=1 0 1 S
++R T 1977 o - O 16 0 0 -
++R T 1979 1980 - Ap Sun>=1 3 1 S
++R T 1979 1982 - O M>=11 0 0 -
++R T 1981 1982 - Mar lastSun 3 1 S
++R T 1983 o - Jul 31 0 1 S
++R T 1983 o - O 2 0 0 -
++R T 1985 o - Ap 20 0 1 S
++R T 1985 o - S 28 0 0 -
++R T 1986 1993 - Mar lastSun 1s 1 S
++R T 1986 1995 - S lastSun 1s 0 -
++R T 1994 o - Mar 20 1s 1 S
++R T 1995 2006 - Mar lastSun 1s 1 S
++R T 1996 2006 - O lastSun 1s 0 -
+ Z Europe/Istanbul 1:55:52 - LMT 1880
+ 1:56:56 - IMT 1910 O
+-2 AE EE%sT 1978 O 15
+-3 AE +03/+04 1985 Ap 20
+-2 AE EE%sT 2007
+-2 O EE%sT 2011 Mar 27 1u
++2 T EE%sT 1978 O 15
++3 T +03/+04 1985 Ap 20
++2 T EE%sT 2007
++2 E EE%sT 2011 Mar 27 1u
+ 2 - EET 2011 Mar 28 1u
+-2 O EE%sT 2014 Mar 30 1u
++2 E EE%sT 2014 Mar 30 1u
+ 2 - EET 2014 Mar 31 1u
+-2 O EE%sT 2015 O 25 1u
++2 E EE%sT 2015 O 25 1u
+ 2 1 EEST 2015 N 8 1u
+-2 O EE%sT 2016 S 7
++2 E EE%sT 2016 S 7
+ 3 - +03
+ Li Europe/Istanbul Asia/Istanbul
+ Z Europe/Kiev 2:2:4 - LMT 1880
+ 2:2:4 - KMT 1924 May 2
+ 2 - EET 1930 Jun 21
+ 3 - MSK 1941 S 20
+-1 ( CE%sT 1943 N 6
+-3 M MSK/MSD 1990 Jul 1 2
++1 c CE%sT 1943 N 6
++3 R MSK/MSD 1990 Jul 1 2
+ 2 1 EEST 1991 S 29 3
+-2 W EE%sT 1995
+-2 O EE%sT
++2 e EE%sT 1995
++2 E EE%sT
+ Z Europe/Uzhgorod 1:29:12 - LMT 1890 O
+ 1 - CET 1940
+-1 ( CE%sT 1944 O
++1 c CE%sT 1944 O
+ 1 1 CEST 1944 O 26
+ 1 - CET 1945 Jun 29
+-3 M MSK/MSD 1990
++3 R MSK/MSD 1990
+ 3 - MSK 1990 Jul 1 2
+ 1 - CET 1991 Mar 31 3
+ 2 - EET 1992
+-2 W EE%sT 1995
+-2 O EE%sT
++2 e EE%sT 1995
++2 E EE%sT
+ Z Europe/Zaporozhye 2:20:40 - LMT 1880
+ 2:20 - +0220 1924 May 2
+ 2 - EET 1930 Jun 21
+ 3 - MSK 1941 Au 25
+-1 ( CE%sT 1943 O 25
+-3 M MSK/MSD 1991 Mar 31 2
+-2 W EE%sT 1995
+-2 O EE%sT
+-R AF 1918 1919 - Mar lastSun 2 1 D
+-R AF 1918 1919 - O lastSun 2 0 S
+-R AF 1942 o - F 9 2 1 W
+-R AF 1945 o - Au 14 23u 1 P
+-R AF 1945 o - S lastSun 2 0 S
+-R AF 1967 2006 - O lastSun 2 0 S
+-R AF 1967 1973 - Ap lastSun 2 1 D
+-R AF 1974 o - Ja 6 2 1 D
+-R AF 1975 o - F 23 2 1 D
+-R AF 1976 1986 - Ap lastSun 2 1 D
+-R AF 1987 2006 - Ap Sun>=1 2 1 D
+-R AF 2007 ma - Mar Sun>=8 2 1 D
+-R AF 2007 ma - N Sun>=1 2 0 S
++1 c CE%sT 1943 O 25
++3 R MSK/MSD 1991 Mar 31 2
++2 e EE%sT 1995
++2 E EE%sT
++R u 1918 1919 - Mar lastSun 2 1 D
++R u 1918 1919 - O lastSun 2 0 S
++R u 1942 o - F 9 2 1 W
++R u 1945 o - Au 14 23u 1 P
++R u 1945 o - S lastSun 2 0 S
++R u 1967 2006 - O lastSun 2 0 S
++R u 1967 1973 - Ap lastSun 2 1 D
++R u 1974 o - Ja 6 2 1 D
++R u 1975 o - F 23 2 1 D
++R u 1976 1986 - Ap lastSun 2 1 D
++R u 1987 2006 - Ap Sun>=1 2 1 D
++R u 2007 ma - Mar Sun>=8 2 1 D
++R u 2007 ma - N Sun>=1 2 0 S
+ Z EST -5 - EST
+ Z MST -7 - MST
+ Z HST -10 - HST
+-Z EST5EDT -5 AF E%sT
+-Z CST6CDT -6 AF C%sT
+-Z MST7MDT -7 AF M%sT
+-Z PST8PDT -8 AF P%sT
+-R AG 1920 o - Mar lastSun 2 1 D
+-R AG 1920 o - O lastSun 2 0 S
+-R AG 1921 1966 - Ap lastSun 2 1 D
+-R AG 1921 1954 - S lastSun 2 0 S
+-R AG 1955 1966 - O lastSun 2 0 S
++Z EST5EDT -5 u E%sT
++Z CST6CDT -6 u C%sT
++Z MST7MDT -7 u M%sT
++Z PST8PDT -8 u P%sT
++R NY 1920 o - Mar lastSun 2 1 D
++R NY 1920 o - O lastSun 2 0 S
++R NY 1921 1966 - Ap lastSun 2 1 D
++R NY 1921 1954 - S lastSun 2 0 S
++R NY 1955 1966 - O lastSun 2 0 S
+ Z America/New_York -4:56:2 - LMT 1883 N 18 12:3:58
+--5 AF E%sT 1920
+--5 AG E%sT 1942
+--5 AF E%sT 1946
+--5 AG E%sT 1967
+--5 AF E%sT
+-R AH 1920 o - Jun 13 2 1 D
+-R AH 1920 1921 - O lastSun 2 0 S
+-R AH 1921 o - Mar lastSun 2 1 D
+-R AH 1922 1966 - Ap lastSun 2 1 D
+-R AH 1922 1954 - S lastSun 2 0 S
+-R AH 1955 1966 - O lastSun 2 0 S
++-5 u E%sT 1920
++-5 NY E%sT 1942
++-5 u E%sT 1946
++-5 NY E%sT 1967
++-5 u E%sT
++R Ch 1920 o - Jun 13 2 1 D
++R Ch 1920 1921 - O lastSun 2 0 S
++R Ch 1921 o - Mar lastSun 2 1 D
++R Ch 1922 1966 - Ap lastSun 2 1 D
++R Ch 1922 1954 - S lastSun 2 0 S
++R Ch 1955 1966 - O lastSun 2 0 S
+ Z America/Chicago -5:50:36 - LMT 1883 N 18 12:9:24
+--6 AF C%sT 1920
+--6 AH C%sT 1936 Mar 1 2
++-6 u C%sT 1920
++-6 Ch C%sT 1936 Mar 1 2
+ -5 - EST 1936 N 15 2
+--6 AH C%sT 1942
+--6 AF C%sT 1946
+--6 AH C%sT 1967
+--6 AF C%sT
++-6 Ch C%sT 1942
++-6 u C%sT 1946
++-6 Ch C%sT 1967
++-6 u C%sT
+ Z America/North_Dakota/Center -6:45:12 - LMT 1883 N 18 12:14:48
+--7 AF M%sT 1992 O 25 2
+--6 AF C%sT
++-7 u M%sT 1992 O 25 2
++-6 u C%sT
+ Z America/North_Dakota/New_Salem -6:45:39 - LMT 1883 N 18 12:14:21
+--7 AF M%sT 2003 O 26 2
+--6 AF C%sT
++-7 u M%sT 2003 O 26 2
++-6 u C%sT
+ Z America/North_Dakota/Beulah -6:47:7 - LMT 1883 N 18 12:12:53
+--7 AF M%sT 2010 N 7 2
+--6 AF C%sT
+-R AI 1920 1921 - Mar lastSun 2 1 D
+-R AI 1920 o - O lastSun 2 0 S
+-R AI 1921 o - May 22 2 0 S
+-R AI 1965 1966 - Ap lastSun 2 1 D
+-R AI 1965 1966 - O lastSun 2 0 S
++-7 u M%sT 2010 N 7 2
++-6 u C%sT
++R De 1920 1921 - Mar lastSun 2 1 D
++R De 1920 o - O lastSun 2 0 S
++R De 1921 o - May 22 2 0 S
++R De 1965 1966 - Ap lastSun 2 1 D
++R De 1965 1966 - O lastSun 2 0 S
+ Z America/Denver -6:59:56 - LMT 1883 N 18 12:0:4
+--7 AF M%sT 1920
+--7 AI M%sT 1942
+--7 AF M%sT 1946
+--7 AI M%sT 1967
+--7 AF M%sT
+-R AJ 1948 o - Mar 14 2:1 1 D
+-R AJ 1949 o - Ja 1 2 0 S
+-R AJ 1950 1966 - Ap lastSun 1 1 D
+-R AJ 1950 1961 - S lastSun 2 0 S
+-R AJ 1962 1966 - O lastSun 2 0 S
++-7 u M%sT 1920
++-7 De M%sT 1942
++-7 u M%sT 1946
++-7 De M%sT 1967
++-7 u M%sT
++R CA 1948 o - Mar 14 2:1 1 D
++R CA 1949 o - Ja 1 2 0 S
++R CA 1950 1966 - Ap lastSun 1 1 D
++R CA 1950 1961 - S lastSun 2 0 S
++R CA 1962 1966 - O lastSun 2 0 S
+ Z America/Los_Angeles -7:52:58 - LMT 1883 N 18 12:7:2
+--8 AF P%sT 1946
+--8 AJ P%sT 1967
+--8 AF P%sT
++-8 u P%sT 1946
++-8 CA P%sT 1967
++-8 u P%sT
+ Z America/Juneau 15:2:19 - LMT 1867 O 19 15:33:32
+ -8:57:41 - LMT 1900 Au 20 12
+ -8 - PST 1942
+--8 AF P%sT 1946
++-8 u P%sT 1946
+ -8 - PST 1969
+--8 AF P%sT 1980 Ap 27 2
+--9 AF Y%sT 1980 O 26 2
+--8 AF P%sT 1983 O 30 2
+--9 AF Y%sT 1983 N 30
+--9 AF AK%sT
++-8 u P%sT 1980 Ap 27 2
++-9 u Y%sT 1980 O 26 2
++-8 u P%sT 1983 O 30 2
++-9 u Y%sT 1983 N 30
++-9 u AK%sT
+ Z America/Sitka 14:58:47 - LMT 1867 O 19 15:30
+ -9:1:13 - LMT 1900 Au 20 12
+ -8 - PST 1942
+--8 AF P%sT 1946
++-8 u P%sT 1946
+ -8 - PST 1969
+--8 AF P%sT 1983 O 30 2
+--9 AF Y%sT 1983 N 30
+--9 AF AK%sT
++-8 u P%sT 1983 O 30 2
++-9 u Y%sT 1983 N 30
++-9 u AK%sT
+ Z America/Metlakatla 15:13:42 - LMT 1867 O 19 15:44:55
+ -8:46:18 - LMT 1900 Au 20 12
+ -8 - PST 1942
+--8 AF P%sT 1946
++-8 u P%sT 1946
+ -8 - PST 1969
+--8 AF P%sT 1983 O 30 2
++-8 u P%sT 1983 O 30 2
+ -8 - PST 2015 N 1 2
+--9 AF AK%sT
++-9 u AK%sT
+ Z America/Yakutat 14:41:5 - LMT 1867 O 19 15:12:18
+ -9:18:55 - LMT 1900 Au 20 12
+ -9 - YST 1942
+--9 AF Y%sT 1946
++-9 u Y%sT 1946
+ -9 - YST 1969
+--9 AF Y%sT 1983 N 30
+--9 AF AK%sT
++-9 u Y%sT 1983 N 30
++-9 u AK%sT
+ Z America/Anchorage 14:0:24 - LMT 1867 O 19 14:31:37
+ -9:59:36 - LMT 1900 Au 20 12
+ -10 - AST 1942
+--10 AF A%sT 1967 Ap
++-10 u A%sT 1967 Ap
+ -10 - AHST 1969
+--10 AF AH%sT 1983 O 30 2
+--9 AF Y%sT 1983 N 30
+--9 AF AK%sT
++-10 u AH%sT 1983 O 30 2
++-9 u Y%sT 1983 N 30
++-9 u AK%sT
+ Z America/Nome 12:58:22 - LMT 1867 O 19 13:29:35
+ -11:1:38 - LMT 1900 Au 20 12
+ -11 - NST 1942
+--11 AF N%sT 1946
++-11 u N%sT 1946
+ -11 - NST 1967 Ap
+ -11 - BST 1969
+--11 AF B%sT 1983 O 30 2
+--9 AF Y%sT 1983 N 30
+--9 AF AK%sT
++-11 u B%sT 1983 O 30 2
++-9 u Y%sT 1983 N 30
++-9 u AK%sT
+ Z America/Adak 12:13:22 - LMT 1867 O 19 12:44:35
+ -11:46:38 - LMT 1900 Au 20 12
+ -11 - NST 1942
+--11 AF N%sT 1946
++-11 u N%sT 1946
+ -11 - NST 1967 Ap
+ -11 - BST 1969
+--11 AF B%sT 1983 O 30 2
+--10 AF AH%sT 1983 N 30
+--10 AF H%sT
++-11 u B%sT 1983 O 30 2
++-10 u AH%sT 1983 N 30
++-10 u H%sT
+ Z Pacific/Honolulu -10:31:26 - LMT 1896 Ja 13 12
+ -10:30 - HST 1933 Ap 30 2
+ -10:30 1 HDT 1933 May 21 12
+@@ -2683,531 +2700,531 @@ Z Pacific/Honolulu -10:31:26 - LMT 1896 Ja 13 12
+ -10:30 - HST 1947 Jun 8 2
+ -10 - HST
+ Z America/Phoenix -7:28:18 - LMT 1883 N 18 11:31:42
+--7 AF M%sT 1944 Ja 1 0:1
++-7 u M%sT 1944 Ja 1 0:1
+ -7 - MST 1944 Ap 1 0:1
+--7 AF M%sT 1944 O 1 0:1
++-7 u M%sT 1944 O 1 0:1
+ -7 - MST 1967
+--7 AF M%sT 1968 Mar 21
++-7 u M%sT 1968 Mar 21
+ -7 - MST
+ Z America/Boise -7:44:49 - LMT 1883 N 18 12:15:11
+--8 AF P%sT 1923 May 13 2
+--7 AF M%sT 1974
++-8 u P%sT 1923 May 13 2
++-7 u M%sT 1974
+ -7 - MST 1974 F 3 2
+--7 AF M%sT
+-R AK 1941 o - Jun 22 2 1 D
+-R AK 1941 1954 - S lastSun 2 0 S
+-R AK 1946 1954 - Ap lastSun 2 1 D
++-7 u M%sT
++R In 1941 o - Jun 22 2 1 D
++R In 1941 1954 - S lastSun 2 0 S
++R In 1946 1954 - Ap lastSun 2 1 D
+ Z America/Indiana/Indianapolis -5:44:38 - LMT 1883 N 18 12:15:22
+--6 AF C%sT 1920
+--6 AK C%sT 1942
+--6 AF C%sT 1946
+--6 AK C%sT 1955 Ap 24 2
++-6 u C%sT 1920
++-6 In C%sT 1942
++-6 u C%sT 1946
++-6 In C%sT 1955 Ap 24 2
+ -5 - EST 1957 S 29 2
+ -6 - CST 1958 Ap 27 2
+ -5 - EST 1969
+--5 AF E%sT 1971
++-5 u E%sT 1971
+ -5 - EST 2006
+--5 AF E%sT
+-R AL 1951 o - Ap lastSun 2 1 D
+-R AL 1951 o - S lastSun 2 0 S
+-R AL 1954 1960 - Ap lastSun 2 1 D
+-R AL 1954 1960 - S lastSun 2 0 S
++-5 u E%sT
++R Ma 1951 o - Ap lastSun 2 1 D
++R Ma 1951 o - S lastSun 2 0 S
++R Ma 1954 1960 - Ap lastSun 2 1 D
++R Ma 1954 1960 - S lastSun 2 0 S
+ Z America/Indiana/Marengo -5:45:23 - LMT 1883 N 18 12:14:37
+--6 AF C%sT 1951
+--6 AL C%sT 1961 Ap 30 2
++-6 u C%sT 1951
++-6 Ma C%sT 1961 Ap 30 2
+ -5 - EST 1969
+--5 AF E%sT 1974 Ja 6 2
++-5 u E%sT 1974 Ja 6 2
+ -6 1 CDT 1974 O 27 2
+--5 AF E%sT 1976
++-5 u E%sT 1976
+ -5 - EST 2006
+--5 AF E%sT
+-R AM 1946 o - Ap lastSun 2 1 D
+-R AM 1946 o - S lastSun 2 0 S
+-R AM 1953 1954 - Ap lastSun 2 1 D
+-R AM 1953 1959 - S lastSun 2 0 S
+-R AM 1955 o - May 1 0 1 D
+-R AM 1956 1963 - Ap lastSun 2 1 D
+-R AM 1960 o - O lastSun 2 0 S
+-R AM 1961 o - S lastSun 2 0 S
+-R AM 1962 1963 - O lastSun 2 0 S
++-5 u E%sT
++R V 1946 o - Ap lastSun 2 1 D
++R V 1946 o - S lastSun 2 0 S
++R V 1953 1954 - Ap lastSun 2 1 D
++R V 1953 1959 - S lastSun 2 0 S
++R V 1955 o - May 1 0 1 D
++R V 1956 1963 - Ap lastSun 2 1 D
++R V 1960 o - O lastSun 2 0 S
++R V 1961 o - S lastSun 2 0 S
++R V 1962 1963 - O lastSun 2 0 S
+ Z America/Indiana/Vincennes -5:50:7 - LMT 1883 N 18 12:9:53
+--6 AF C%sT 1946
+--6 AM C%sT 1964 Ap 26 2
++-6 u C%sT 1946
++-6 V C%sT 1964 Ap 26 2
+ -5 - EST 1969
+--5 AF E%sT 1971
++-5 u E%sT 1971
+ -5 - EST 2006 Ap 2 2
+--6 AF C%sT 2007 N 4 2
+--5 AF E%sT
+-R AN 1946 o - Ap lastSun 2 1 D
+-R AN 1946 o - S lastSun 2 0 S
+-R AN 1953 1954 - Ap lastSun 2 1 D
+-R AN 1953 1959 - S lastSun 2 0 S
+-R AN 1955 o - May 1 0 1 D
+-R AN 1956 1963 - Ap lastSun 2 1 D
+-R AN 1960 o - O lastSun 2 0 S
+-R AN 1961 o - S lastSun 2 0 S
+-R AN 1962 1963 - O lastSun 2 0 S
++-6 u C%sT 2007 N 4 2
++-5 u E%sT
++R Pe 1946 o - Ap lastSun 2 1 D
++R Pe 1946 o - S lastSun 2 0 S
++R Pe 1953 1954 - Ap lastSun 2 1 D
++R Pe 1953 1959 - S lastSun 2 0 S
++R Pe 1955 o - May 1 0 1 D
++R Pe 1956 1963 - Ap lastSun 2 1 D
++R Pe 1960 o - O lastSun 2 0 S
++R Pe 1961 o - S lastSun 2 0 S
++R Pe 1962 1963 - O lastSun 2 0 S
+ Z America/Indiana/Tell_City -5:47:3 - LMT 1883 N 18 12:12:57
+--6 AF C%sT 1946
+--6 AN C%sT 1964 Ap 26 2
++-6 u C%sT 1946
++-6 Pe C%sT 1964 Ap 26 2
+ -5 - EST 1969
+--5 AF E%sT 1971
++-5 u E%sT 1971
+ -5 - EST 2006 Ap 2 2
+--6 AF C%sT
+-R AO 1955 o - May 1 0 1 D
+-R AO 1955 1960 - S lastSun 2 0 S
+-R AO 1956 1964 - Ap lastSun 2 1 D
+-R AO 1961 1964 - O lastSun 2 0 S
++-6 u C%sT
++R Pi 1955 o - May 1 0 1 D
++R Pi 1955 1960 - S lastSun 2 0 S
++R Pi 1956 1964 - Ap lastSun 2 1 D
++R Pi 1961 1964 - O lastSun 2 0 S
+ Z America/Indiana/Petersburg -5:49:7 - LMT 1883 N 18 12:10:53
+--6 AF C%sT 1955
+--6 AO C%sT 1965 Ap 25 2
++-6 u C%sT 1955
++-6 Pi C%sT 1965 Ap 25 2
+ -5 - EST 1966 O 30 2
+--6 AF C%sT 1977 O 30 2
++-6 u C%sT 1977 O 30 2
+ -5 - EST 2006 Ap 2 2
+--6 AF C%sT 2007 N 4 2
+--5 AF E%sT
+-R AP 1947 1961 - Ap lastSun 2 1 D
+-R AP 1947 1954 - S lastSun 2 0 S
+-R AP 1955 1956 - O lastSun 2 0 S
+-R AP 1957 1958 - S lastSun 2 0 S
+-R AP 1959 1961 - O lastSun 2 0 S
++-6 u C%sT 2007 N 4 2
++-5 u E%sT
++R St 1947 1961 - Ap lastSun 2 1 D
++R St 1947 1954 - S lastSun 2 0 S
++R St 1955 1956 - O lastSun 2 0 S
++R St 1957 1958 - S lastSun 2 0 S
++R St 1959 1961 - O lastSun 2 0 S
+ Z America/Indiana/Knox -5:46:30 - LMT 1883 N 18 12:13:30
+--6 AF C%sT 1947
+--6 AP C%sT 1962 Ap 29 2
++-6 u C%sT 1947
++-6 St C%sT 1962 Ap 29 2
+ -5 - EST 1963 O 27 2
+--6 AF C%sT 1991 O 27 2
++-6 u C%sT 1991 O 27 2
+ -5 - EST 2006 Ap 2 2
+--6 AF C%sT
+-R AQ 1946 1960 - Ap lastSun 2 1 D
+-R AQ 1946 1954 - S lastSun 2 0 S
+-R AQ 1955 1956 - O lastSun 2 0 S
+-R AQ 1957 1960 - S lastSun 2 0 S
++-6 u C%sT
++R Pu 1946 1960 - Ap lastSun 2 1 D
++R Pu 1946 1954 - S lastSun 2 0 S
++R Pu 1955 1956 - O lastSun 2 0 S
++R Pu 1957 1960 - S lastSun 2 0 S
+ Z America/Indiana/Winamac -5:46:25 - LMT 1883 N 18 12:13:35
+--6 AF C%sT 1946
+--6 AQ C%sT 1961 Ap 30 2
++-6 u C%sT 1946
++-6 Pu C%sT 1961 Ap 30 2
+ -5 - EST 1969
+--5 AF E%sT 1971
++-5 u E%sT 1971
+ -5 - EST 2006 Ap 2 2
+--6 AF C%sT 2007 Mar 11 2
+--5 AF E%sT
++-6 u C%sT 2007 Mar 11 2
++-5 u E%sT
+ Z America/Indiana/Vevay -5:40:16 - LMT 1883 N 18 12:19:44
+--6 AF C%sT 1954 Ap 25 2
++-6 u C%sT 1954 Ap 25 2
+ -5 - EST 1969
+--5 AF E%sT 1973
++-5 u E%sT 1973
+ -5 - EST 2006
+--5 AF E%sT
+-R AR 1921 o - May 1 2 1 D
+-R AR 1921 o - S 1 2 0 S
+-R AR 1941 1961 - Ap lastSun 2 1 D
+-R AR 1941 o - S lastSun 2 0 S
+-R AR 1946 o - Jun 2 2 0 S
+-R AR 1950 1955 - S lastSun 2 0 S
+-R AR 1956 1960 - O lastSun 2 0 S
++-5 u E%sT
++R v 1921 o - May 1 2 1 D
++R v 1921 o - S 1 2 0 S
++R v 1941 1961 - Ap lastSun 2 1 D
++R v 1941 o - S lastSun 2 0 S
++R v 1946 o - Jun 2 2 0 S
++R v 1950 1955 - S lastSun 2 0 S
++R v 1956 1960 - O lastSun 2 0 S
+ Z America/Kentucky/Louisville -5:43:2 - LMT 1883 N 18 12:16:58
+--6 AF C%sT 1921
+--6 AR C%sT 1942
+--6 AF C%sT 1946
+--6 AR C%sT 1961 Jul 23 2
++-6 u C%sT 1921
++-6 v C%sT 1942
++-6 u C%sT 1946
++-6 v C%sT 1961 Jul 23 2
+ -5 - EST 1968
+--5 AF E%sT 1974 Ja 6 2
++-5 u E%sT 1974 Ja 6 2
+ -6 1 CDT 1974 O 27 2
+--5 AF E%sT
++-5 u E%sT
+ Z America/Kentucky/Monticello -5:39:24 - LMT 1883 N 18 12:20:36
+--6 AF C%sT 1946
++-6 u C%sT 1946
+ -6 - CST 1968
+--6 AF C%sT 2000 O 29 2
+--5 AF E%sT
+-R AS 1948 o - Ap lastSun 2 1 D
+-R AS 1948 o - S lastSun 2 0 S
++-6 u C%sT 2000 O 29 2
++-5 u E%sT
++R Dt 1948 o - Ap lastSun 2 1 D
++R Dt 1948 o - S lastSun 2 0 S
+ Z America/Detroit -5:32:11 - LMT 1905
+ -6 - CST 1915 May 15 2
+ -5 - EST 1942
+--5 AF E%sT 1946
+--5 AS E%sT 1973
+--5 AF E%sT 1975
++-5 u E%sT 1946
++-5 Dt E%sT 1973
++-5 u E%sT 1975
+ -5 - EST 1975 Ap 27 2
+--5 AF E%sT
+-R AT 1946 o - Ap lastSun 2 1 D
+-R AT 1946 o - S lastSun 2 0 S
+-R AT 1966 o - Ap lastSun 2 1 D
+-R AT 1966 o - O lastSun 2 0 S
++-5 u E%sT
++R Me 1946 o - Ap lastSun 2 1 D
++R Me 1946 o - S lastSun 2 0 S
++R Me 1966 o - Ap lastSun 2 1 D
++R Me 1966 o - O lastSun 2 0 S
+ Z America/Menominee -5:50:27 - LMT 1885 S 18 12
+--6 AF C%sT 1946
+--6 AT C%sT 1969 Ap 27 2
++-6 u C%sT 1946
++-6 Me C%sT 1969 Ap 27 2
+ -5 - EST 1973 Ap 29 2
+--6 AF C%sT
+-R AU 1918 o - Ap 14 2 1 D
+-R AU 1918 o - O 27 2 0 S
+-R AU 1942 o - F 9 2 1 W
+-R AU 1945 o - Au 14 23u 1 P
+-R AU 1945 o - S 30 2 0 S
+-R AU 1974 1986 - Ap lastSun 2 1 D
+-R AU 1974 2006 - O lastSun 2 0 S
+-R AU 1987 2006 - Ap Sun>=1 2 1 D
+-R AU 2007 ma - Mar Sun>=8 2 1 D
+-R AU 2007 ma - N Sun>=1 2 0 S
+-R AV 1917 o - Ap 8 2 1 D
+-R AV 1917 o - S 17 2 0 S
+-R AV 1919 o - May 5 23 1 D
+-R AV 1919 o - Au 12 23 0 S
+-R AV 1920 1935 - May Sun>=1 23 1 D
+-R AV 1920 1935 - O lastSun 23 0 S
+-R AV 1936 1941 - May M>=9 0 1 D
+-R AV 1936 1941 - O M>=2 0 0 S
+-R AV 1946 1950 - May Sun>=8 2 1 D
+-R AV 1946 1950 - O Sun>=2 2 0 S
+-R AV 1951 1986 - Ap lastSun 2 1 D
+-R AV 1951 1959 - S lastSun 2 0 S
+-R AV 1960 1986 - O lastSun 2 0 S
+-R AV 1987 o - Ap Sun>=1 0:1 1 D
+-R AV 1987 2006 - O lastSun 0:1 0 S
+-R AV 1988 o - Ap Sun>=1 0:1 2 DD
+-R AV 1989 2006 - Ap Sun>=1 0:1 1 D
+-R AV 2007 2011 - Mar Sun>=8 0:1 1 D
+-R AV 2007 2010 - N Sun>=1 0:1 0 S
++-6 u C%sT
++R C 1918 o - Ap 14 2 1 D
++R C 1918 o - O 27 2 0 S
++R C 1942 o - F 9 2 1 W
++R C 1945 o - Au 14 23u 1 P
++R C 1945 o - S 30 2 0 S
++R C 1974 1986 - Ap lastSun 2 1 D
++R C 1974 2006 - O lastSun 2 0 S
++R C 1987 2006 - Ap Sun>=1 2 1 D
++R C 2007 ma - Mar Sun>=8 2 1 D
++R C 2007 ma - N Sun>=1 2 0 S
++R j 1917 o - Ap 8 2 1 D
++R j 1917 o - S 17 2 0 S
++R j 1919 o - May 5 23 1 D
++R j 1919 o - Au 12 23 0 S
++R j 1920 1935 - May Sun>=1 23 1 D
++R j 1920 1935 - O lastSun 23 0 S
++R j 1936 1941 - May M>=9 0 1 D
++R j 1936 1941 - O M>=2 0 0 S
++R j 1946 1950 - May Sun>=8 2 1 D
++R j 1946 1950 - O Sun>=2 2 0 S
++R j 1951 1986 - Ap lastSun 2 1 D
++R j 1951 1959 - S lastSun 2 0 S
++R j 1960 1986 - O lastSun 2 0 S
++R j 1987 o - Ap Sun>=1 0:1 1 D
++R j 1987 2006 - O lastSun 0:1 0 S
++R j 1988 o - Ap Sun>=1 0:1 2 DD
++R j 1989 2006 - Ap Sun>=1 0:1 1 D
++R j 2007 2011 - Mar Sun>=8 0:1 1 D
++R j 2007 2010 - N Sun>=1 0:1 0 S
+ Z America/St_Johns -3:30:52 - LMT 1884
+--3:30:52 AV N%sT 1918
+--3:30:52 AU N%sT 1919
+--3:30:52 AV N%sT 1935 Mar 30
+--3:30 AV N%sT 1942 May 11
+--3:30 AU N%sT 1946
+--3:30 AV N%sT 2011 N
+--3:30 AU N%sT
++-3:30:52 j N%sT 1918
++-3:30:52 C N%sT 1919
++-3:30:52 j N%sT 1935 Mar 30
++-3:30 j N%sT 1942 May 11
++-3:30 C N%sT 1946
++-3:30 j N%sT 2011 N
++-3:30 C N%sT
+ Z America/Goose_Bay -4:1:40 - LMT 1884
+ -3:30:52 - NST 1918
+--3:30:52 AU N%sT 1919
++-3:30:52 C N%sT 1919
+ -3:30:52 - NST 1935 Mar 30
+ -3:30 - NST 1936
+--3:30 AV N%sT 1942 May 11
+--3:30 AU N%sT 1946
+--3:30 AV N%sT 1966 Mar 15 2
+--4 AV A%sT 2011 N
+--4 AU A%sT
+-R AW 1916 o - Ap 1 0 1 D
+-R AW 1916 o - O 1 0 0 S
+-R AW 1920 o - May 9 0 1 D
+-R AW 1920 o - Au 29 0 0 S
+-R AW 1921 o - May 6 0 1 D
+-R AW 1921 1922 - S 5 0 0 S
+-R AW 1922 o - Ap 30 0 1 D
+-R AW 1923 1925 - May Sun>=1 0 1 D
+-R AW 1923 o - S 4 0 0 S
+-R AW 1924 o - S 15 0 0 S
+-R AW 1925 o - S 28 0 0 S
+-R AW 1926 o - May 16 0 1 D
+-R AW 1926 o - S 13 0 0 S
+-R AW 1927 o - May 1 0 1 D
+-R AW 1927 o - S 26 0 0 S
+-R AW 1928 1931 - May Sun>=8 0 1 D
+-R AW 1928 o - S 9 0 0 S
+-R AW 1929 o - S 3 0 0 S
+-R AW 1930 o - S 15 0 0 S
+-R AW 1931 1932 - S M>=24 0 0 S
+-R AW 1932 o - May 1 0 1 D
+-R AW 1933 o - Ap 30 0 1 D
+-R AW 1933 o - O 2 0 0 S
+-R AW 1934 o - May 20 0 1 D
+-R AW 1934 o - S 16 0 0 S
+-R AW 1935 o - Jun 2 0 1 D
+-R AW 1935 o - S 30 0 0 S
+-R AW 1936 o - Jun 1 0 1 D
+-R AW 1936 o - S 14 0 0 S
+-R AW 1937 1938 - May Sun>=1 0 1 D
+-R AW 1937 1941 - S M>=24 0 0 S
+-R AW 1939 o - May 28 0 1 D
+-R AW 1940 1941 - May Sun>=1 0 1 D
+-R AW 1946 1949 - Ap lastSun 2 1 D
+-R AW 1946 1949 - S lastSun 2 0 S
+-R AW 1951 1954 - Ap lastSun 2 1 D
+-R AW 1951 1954 - S lastSun 2 0 S
+-R AW 1956 1959 - Ap lastSun 2 1 D
+-R AW 1956 1959 - S lastSun 2 0 S
+-R AW 1962 1973 - Ap lastSun 2 1 D
+-R AW 1962 1973 - O lastSun 2 0 S
++-3:30 j N%sT 1942 May 11
++-3:30 C N%sT 1946
++-3:30 j N%sT 1966 Mar 15 2
++-4 j A%sT 2011 N
++-4 C A%sT
++R H 1916 o - Ap 1 0 1 D
++R H 1916 o - O 1 0 0 S
++R H 1920 o - May 9 0 1 D
++R H 1920 o - Au 29 0 0 S
++R H 1921 o - May 6 0 1 D
++R H 1921 1922 - S 5 0 0 S
++R H 1922 o - Ap 30 0 1 D
++R H 1923 1925 - May Sun>=1 0 1 D
++R H 1923 o - S 4 0 0 S
++R H 1924 o - S 15 0 0 S
++R H 1925 o - S 28 0 0 S
++R H 1926 o - May 16 0 1 D
++R H 1926 o - S 13 0 0 S
++R H 1927 o - May 1 0 1 D
++R H 1927 o - S 26 0 0 S
++R H 1928 1931 - May Sun>=8 0 1 D
++R H 1928 o - S 9 0 0 S
++R H 1929 o - S 3 0 0 S
++R H 1930 o - S 15 0 0 S
++R H 1931 1932 - S M>=24 0 0 S
++R H 1932 o - May 1 0 1 D
++R H 1933 o - Ap 30 0 1 D
++R H 1933 o - O 2 0 0 S
++R H 1934 o - May 20 0 1 D
++R H 1934 o - S 16 0 0 S
++R H 1935 o - Jun 2 0 1 D
++R H 1935 o - S 30 0 0 S
++R H 1936 o - Jun 1 0 1 D
++R H 1936 o - S 14 0 0 S
++R H 1937 1938 - May Sun>=1 0 1 D
++R H 1937 1941 - S M>=24 0 0 S
++R H 1939 o - May 28 0 1 D
++R H 1940 1941 - May Sun>=1 0 1 D
++R H 1946 1949 - Ap lastSun 2 1 D
++R H 1946 1949 - S lastSun 2 0 S
++R H 1951 1954 - Ap lastSun 2 1 D
++R H 1951 1954 - S lastSun 2 0 S
++R H 1956 1959 - Ap lastSun 2 1 D
++R H 1956 1959 - S lastSun 2 0 S
++R H 1962 1973 - Ap lastSun 2 1 D
++R H 1962 1973 - O lastSun 2 0 S
+ Z America/Halifax -4:14:24 - LMT 1902 Jun 15
+--4 AW A%sT 1918
+--4 AU A%sT 1919
+--4 AW A%sT 1942 F 9 2s
+--4 AU A%sT 1946
+--4 AW A%sT 1974
+--4 AU A%sT
++-4 H A%sT 1918
++-4 C A%sT 1919
++-4 H A%sT 1942 F 9 2s
++-4 C A%sT 1946
++-4 H A%sT 1974
++-4 C A%sT
+ Z America/Glace_Bay -3:59:48 - LMT 1902 Jun 15
+--4 AU A%sT 1953
+--4 AW A%sT 1954
++-4 C A%sT 1953
++-4 H A%sT 1954
+ -4 - AST 1972
+--4 AW A%sT 1974
+--4 AU A%sT
+-R AX 1933 1935 - Jun Sun>=8 1 1 D
+-R AX 1933 1935 - S Sun>=8 1 0 S
+-R AX 1936 1938 - Jun Sun>=1 1 1 D
+-R AX 1936 1938 - S Sun>=1 1 0 S
+-R AX 1939 o - May 27 1 1 D
+-R AX 1939 1941 - S Sat>=21 1 0 S
+-R AX 1940 o - May 19 1 1 D
+-R AX 1941 o - May 4 1 1 D
+-R AX 1946 1972 - Ap lastSun 2 1 D
+-R AX 1946 1956 - S lastSun 2 0 S
+-R AX 1957 1972 - O lastSun 2 0 S
+-R AX 1993 2006 - Ap Sun>=1 0:1 1 D
+-R AX 1993 2006 - O lastSun 0:1 0 S
++-4 H A%sT 1974
++-4 C A%sT
++R o 1933 1935 - Jun Sun>=8 1 1 D
++R o 1933 1935 - S Sun>=8 1 0 S
++R o 1936 1938 - Jun Sun>=1 1 1 D
++R o 1936 1938 - S Sun>=1 1 0 S
++R o 1939 o - May 27 1 1 D
++R o 1939 1941 - S Sat>=21 1 0 S
++R o 1940 o - May 19 1 1 D
++R o 1941 o - May 4 1 1 D
++R o 1946 1972 - Ap lastSun 2 1 D
++R o 1946 1956 - S lastSun 2 0 S
++R o 1957 1972 - O lastSun 2 0 S
++R o 1993 2006 - Ap Sun>=1 0:1 1 D
++R o 1993 2006 - O lastSun 0:1 0 S
+ Z America/Moncton -4:19:8 - LMT 1883 D 9
+ -5 - EST 1902 Jun 15
+--4 AU A%sT 1933
+--4 AX A%sT 1942
+--4 AU A%sT 1946
+--4 AX A%sT 1973
+--4 AU A%sT 1993
+--4 AX A%sT 2007
+--4 AU A%sT
++-4 C A%sT 1933
++-4 o A%sT 1942
++-4 C A%sT 1946
++-4 o A%sT 1973
++-4 C A%sT 1993
++-4 o A%sT 2007
++-4 C A%sT
+ Z America/Blanc-Sablon -3:48:28 - LMT 1884
+--4 AU A%sT 1970
++-4 C A%sT 1970
+ -4 - AST
+-R AY 1919 o - Mar 30 23:30 1 D
+-R AY 1919 o - O 26 0 0 S
+-R AY 1920 o - May 2 2 1 D
+-R AY 1920 o - S 26 0 0 S
+-R AY 1921 o - May 15 2 1 D
+-R AY 1921 o - S 15 2 0 S
+-R AY 1922 1923 - May Sun>=8 2 1 D
+-R AY 1922 1926 - S Sun>=15 2 0 S
+-R AY 1924 1927 - May Sun>=1 2 1 D
+-R AY 1927 1932 - S lastSun 2 0 S
+-R AY 1928 1931 - Ap lastSun 2 1 D
+-R AY 1932 o - May 1 2 1 D
+-R AY 1933 1940 - Ap lastSun 2 1 D
+-R AY 1933 o - O 1 2 0 S
+-R AY 1934 1939 - S lastSun 2 0 S
+-R AY 1945 1946 - S lastSun 2 0 S
+-R AY 1946 o - Ap lastSun 2 1 D
+-R AY 1947 1949 - Ap lastSun 0 1 D
+-R AY 1947 1948 - S lastSun 0 0 S
+-R AY 1949 o - N lastSun 0 0 S
+-R AY 1950 1973 - Ap lastSun 2 1 D
+-R AY 1950 o - N lastSun 2 0 S
+-R AY 1951 1956 - S lastSun 2 0 S
+-R AY 1957 1973 - O lastSun 2 0 S
++R t 1919 o - Mar 30 23:30 1 D
++R t 1919 o - O 26 0 0 S
++R t 1920 o - May 2 2 1 D
++R t 1920 o - S 26 0 0 S
++R t 1921 o - May 15 2 1 D
++R t 1921 o - S 15 2 0 S
++R t 1922 1923 - May Sun>=8 2 1 D
++R t 1922 1926 - S Sun>=15 2 0 S
++R t 1924 1927 - May Sun>=1 2 1 D
++R t 1927 1932 - S lastSun 2 0 S
++R t 1928 1931 - Ap lastSun 2 1 D
++R t 1932 o - May 1 2 1 D
++R t 1933 1940 - Ap lastSun 2 1 D
++R t 1933 o - O 1 2 0 S
++R t 1934 1939 - S lastSun 2 0 S
++R t 1945 1946 - S lastSun 2 0 S
++R t 1946 o - Ap lastSun 2 1 D
++R t 1947 1949 - Ap lastSun 0 1 D
++R t 1947 1948 - S lastSun 0 0 S
++R t 1949 o - N lastSun 0 0 S
++R t 1950 1973 - Ap lastSun 2 1 D
++R t 1950 o - N lastSun 2 0 S
++R t 1951 1956 - S lastSun 2 0 S
++R t 1957 1973 - O lastSun 2 0 S
+ Z America/Toronto -5:17:32 - LMT 1895
+--5 AU E%sT 1919
+--5 AY E%sT 1942 F 9 2s
+--5 AU E%sT 1946
+--5 AY E%sT 1974
+--5 AU E%sT
++-5 C E%sT 1919
++-5 t E%sT 1942 F 9 2s
++-5 C E%sT 1946
++-5 t E%sT 1974
++-5 C E%sT
+ Z America/Thunder_Bay -5:57 - LMT 1895
+ -6 - CST 1910
+ -5 - EST 1942
+--5 AU E%sT 1970
+--5 AY E%sT 1973
++-5 C E%sT 1970
++-5 t E%sT 1973
+ -5 - EST 1974
+--5 AU E%sT
++-5 C E%sT
+ Z America/Nipigon -5:53:4 - LMT 1895
+--5 AU E%sT 1940 S 29
++-5 C E%sT 1940 S 29
+ -5 1 EDT 1942 F 9 2s
+--5 AU E%sT
++-5 C E%sT
+ Z America/Rainy_River -6:18:16 - LMT 1895
+--6 AU C%sT 1940 S 29
++-6 C C%sT 1940 S 29
+ -6 1 CDT 1942 F 9 2s
+--6 AU C%sT
++-6 C C%sT
+ Z America/Atikokan -6:6:28 - LMT 1895
+--6 AU C%sT 1940 S 29
++-6 C C%sT 1940 S 29
+ -6 1 CDT 1942 F 9 2s
+--6 AU C%sT 1945 S 30 2
++-6 C C%sT 1945 S 30 2
+ -5 - EST
+-R AZ 1916 o - Ap 23 0 1 D
+-R AZ 1916 o - S 17 0 0 S
+-R AZ 1918 o - Ap 14 2 1 D
+-R AZ 1918 o - O 27 2 0 S
+-R AZ 1937 o - May 16 2 1 D
+-R AZ 1937 o - S 26 2 0 S
+-R AZ 1942 o - F 9 2 1 W
+-R AZ 1945 o - Au 14 23u 1 P
+-R AZ 1945 o - S lastSun 2 0 S
+-R AZ 1946 o - May 12 2 1 D
+-R AZ 1946 o - O 13 2 0 S
+-R AZ 1947 1949 - Ap lastSun 2 1 D
+-R AZ 1947 1949 - S lastSun 2 0 S
+-R AZ 1950 o - May 1 2 1 D
+-R AZ 1950 o - S 30 2 0 S
+-R AZ 1951 1960 - Ap lastSun 2 1 D
+-R AZ 1951 1958 - S lastSun 2 0 S
+-R AZ 1959 o - O lastSun 2 0 S
+-R AZ 1960 o - S lastSun 2 0 S
+-R AZ 1963 o - Ap lastSun 2 1 D
+-R AZ 1963 o - S 22 2 0 S
+-R AZ 1966 1986 - Ap lastSun 2s 1 D
+-R AZ 1966 2005 - O lastSun 2s 0 S
+-R AZ 1987 2005 - Ap Sun>=1 2s 1 D
++R W 1916 o - Ap 23 0 1 D
++R W 1916 o - S 17 0 0 S
++R W 1918 o - Ap 14 2 1 D
++R W 1918 o - O 27 2 0 S
++R W 1937 o - May 16 2 1 D
++R W 1937 o - S 26 2 0 S
++R W 1942 o - F 9 2 1 W
++R W 1945 o - Au 14 23u 1 P
++R W 1945 o - S lastSun 2 0 S
++R W 1946 o - May 12 2 1 D
++R W 1946 o - O 13 2 0 S
++R W 1947 1949 - Ap lastSun 2 1 D
++R W 1947 1949 - S lastSun 2 0 S
++R W 1950 o - May 1 2 1 D
++R W 1950 o - S 30 2 0 S
++R W 1951 1960 - Ap lastSun 2 1 D
++R W 1951 1958 - S lastSun 2 0 S
++R W 1959 o - O lastSun 2 0 S
++R W 1960 o - S lastSun 2 0 S
++R W 1963 o - Ap lastSun 2 1 D
++R W 1963 o - S 22 2 0 S
++R W 1966 1986 - Ap lastSun 2s 1 D
++R W 1966 2005 - O lastSun 2s 0 S
++R W 1987 2005 - Ap Sun>=1 2s 1 D
+ Z America/Winnipeg -6:28:36 - LMT 1887 Jul 16
+--6 AZ C%sT 2006
+--6 AU C%sT
+-R Aa 1918 o - Ap 14 2 1 D
+-R Aa 1918 o - O 27 2 0 S
+-R Aa 1930 1934 - May Sun>=1 0 1 D
+-R Aa 1930 1934 - O Sun>=1 0 0 S
+-R Aa 1937 1941 - Ap Sun>=8 0 1 D
+-R Aa 1937 o - O Sun>=8 0 0 S
+-R Aa 1938 o - O Sun>=1 0 0 S
+-R Aa 1939 1941 - O Sun>=8 0 0 S
+-R Aa 1942 o - F 9 2 1 W
+-R Aa 1945 o - Au 14 23u 1 P
+-R Aa 1945 o - S lastSun 2 0 S
+-R Aa 1946 o - Ap Sun>=8 2 1 D
+-R Aa 1946 o - O Sun>=8 2 0 S
+-R Aa 1947 1957 - Ap lastSun 2 1 D
+-R Aa 1947 1957 - S lastSun 2 0 S
+-R Aa 1959 o - Ap lastSun 2 1 D
+-R Aa 1959 o - O lastSun 2 0 S
+-R Ab 1957 o - Ap lastSun 2 1 D
+-R Ab 1957 o - O lastSun 2 0 S
+-R Ab 1959 1961 - Ap lastSun 2 1 D
+-R Ab 1959 o - O lastSun 2 0 S
+-R Ab 1960 1961 - S lastSun 2 0 S
++-6 W C%sT 2006
++-6 C C%sT
++R r 1918 o - Ap 14 2 1 D
++R r 1918 o - O 27 2 0 S
++R r 1930 1934 - May Sun>=1 0 1 D
++R r 1930 1934 - O Sun>=1 0 0 S
++R r 1937 1941 - Ap Sun>=8 0 1 D
++R r 1937 o - O Sun>=8 0 0 S
++R r 1938 o - O Sun>=1 0 0 S
++R r 1939 1941 - O Sun>=8 0 0 S
++R r 1942 o - F 9 2 1 W
++R r 1945 o - Au 14 23u 1 P
++R r 1945 o - S lastSun 2 0 S
++R r 1946 o - Ap Sun>=8 2 1 D
++R r 1946 o - O Sun>=8 2 0 S
++R r 1947 1957 - Ap lastSun 2 1 D
++R r 1947 1957 - S lastSun 2 0 S
++R r 1959 o - Ap lastSun 2 1 D
++R r 1959 o - O lastSun 2 0 S
++R Sw 1957 o - Ap lastSun 2 1 D
++R Sw 1957 o - O lastSun 2 0 S
++R Sw 1959 1961 - Ap lastSun 2 1 D
++R Sw 1959 o - O lastSun 2 0 S
++R Sw 1960 1961 - S lastSun 2 0 S
+ Z America/Regina -6:58:36 - LMT 1905 S
+--7 Aa M%sT 1960 Ap lastSun 2
++-7 r M%sT 1960 Ap lastSun 2
+ -6 - CST
+ Z America/Swift_Current -7:11:20 - LMT 1905 S
+--7 AU M%sT 1946 Ap lastSun 2
+--7 Aa M%sT 1950
+--7 Ab M%sT 1972 Ap lastSun 2
++-7 C M%sT 1946 Ap lastSun 2
++-7 r M%sT 1950
++-7 Sw M%sT 1972 Ap lastSun 2
+ -6 - CST
+-R Ac 1918 1919 - Ap Sun>=8 2 1 D
+-R Ac 1918 o - O 27 2 0 S
+-R Ac 1919 o - May 27 2 0 S
+-R Ac 1920 1923 - Ap lastSun 2 1 D
+-R Ac 1920 o - O lastSun 2 0 S
+-R Ac 1921 1923 - S lastSun 2 0 S
+-R Ac 1942 o - F 9 2 1 W
+-R Ac 1945 o - Au 14 23u 1 P
+-R Ac 1945 o - S lastSun 2 0 S
+-R Ac 1947 o - Ap lastSun 2 1 D
+-R Ac 1947 o - S lastSun 2 0 S
+-R Ac 1967 o - Ap lastSun 2 1 D
+-R Ac 1967 o - O lastSun 2 0 S
+-R Ac 1969 o - Ap lastSun 2 1 D
+-R Ac 1969 o - O lastSun 2 0 S
+-R Ac 1972 1986 - Ap lastSun 2 1 D
+-R Ac 1972 2006 - O lastSun 2 0 S
++R Ed 1918 1919 - Ap Sun>=8 2 1 D
++R Ed 1918 o - O 27 2 0 S
++R Ed 1919 o - May 27 2 0 S
++R Ed 1920 1923 - Ap lastSun 2 1 D
++R Ed 1920 o - O lastSun 2 0 S
++R Ed 1921 1923 - S lastSun 2 0 S
++R Ed 1942 o - F 9 2 1 W
++R Ed 1945 o - Au 14 23u 1 P
++R Ed 1945 o - S lastSun 2 0 S
++R Ed 1947 o - Ap lastSun 2 1 D
++R Ed 1947 o - S lastSun 2 0 S
++R Ed 1967 o - Ap lastSun 2 1 D
++R Ed 1967 o - O lastSun 2 0 S
++R Ed 1969 o - Ap lastSun 2 1 D
++R Ed 1969 o - O lastSun 2 0 S
++R Ed 1972 1986 - Ap lastSun 2 1 D
++R Ed 1972 2006 - O lastSun 2 0 S
+ Z America/Edmonton -7:33:52 - LMT 1906 S
+--7 Ac M%sT 1987
+--7 AU M%sT
+-R Ad 1918 o - Ap 14 2 1 D
+-R Ad 1918 o - O 27 2 0 S
+-R Ad 1942 o - F 9 2 1 W
+-R Ad 1945 o - Au 14 23u 1 P
+-R Ad 1945 o - S 30 2 0 S
+-R Ad 1946 1986 - Ap lastSun 2 1 D
+-R Ad 1946 o - O 13 2 0 S
+-R Ad 1947 1961 - S lastSun 2 0 S
+-R Ad 1962 2006 - O lastSun 2 0 S
++-7 Ed M%sT 1987
++-7 C M%sT
++R Va 1918 o - Ap 14 2 1 D
++R Va 1918 o - O 27 2 0 S
++R Va 1942 o - F 9 2 1 W
++R Va 1945 o - Au 14 23u 1 P
++R Va 1945 o - S 30 2 0 S
++R Va 1946 1986 - Ap lastSun 2 1 D
++R Va 1946 o - O 13 2 0 S
++R Va 1947 1961 - S lastSun 2 0 S
++R Va 1962 2006 - O lastSun 2 0 S
+ Z America/Vancouver -8:12:28 - LMT 1884
+--8 Ad P%sT 1987
+--8 AU P%sT
++-8 Va P%sT 1987
++-8 C P%sT
+ Z America/Dawson_Creek -8:0:56 - LMT 1884
+--8 AU P%sT 1947
+--8 Ad P%sT 1972 Au 30 2
++-8 C P%sT 1947
++-8 Va P%sT 1972 Au 30 2
+ -7 - MST
+ Z America/Fort_Nelson -8:10:47 - LMT 1884
+--8 Ad P%sT 1946
++-8 Va P%sT 1946
+ -8 - PST 1947
+--8 Ad P%sT 1987
+--8 AU P%sT 2015 Mar 8 2
++-8 Va P%sT 1987
++-8 C P%sT 2015 Mar 8 2
+ -7 - MST
+ Z America/Creston -7:46:4 - LMT 1884
+ -7 - MST 1916 O
+ -8 - PST 1918 Jun 2
+ -7 - MST
+-R Ae 1918 o - Ap 14 2 1 D
+-R Ae 1918 o - O 27 2 0 S
+-R Ae 1919 o - May 25 2 1 D
+-R Ae 1919 o - N 1 0 0 S
+-R Ae 1942 o - F 9 2 1 W
+-R Ae 1945 o - Au 14 23u 1 P
+-R Ae 1945 o - S 30 2 0 S
+-R Ae 1965 o - Ap lastSun 0 2 DD
+-R Ae 1965 o - O lastSun 2 0 S
+-R Ae 1980 1986 - Ap lastSun 2 1 D
+-R Ae 1980 2006 - O lastSun 2 0 S
+-R Ae 1987 2006 - Ap Sun>=1 2 1 D
++R Y 1918 o - Ap 14 2 1 D
++R Y 1918 o - O 27 2 0 S
++R Y 1919 o - May 25 2 1 D
++R Y 1919 o - N 1 0 0 S
++R Y 1942 o - F 9 2 1 W
++R Y 1945 o - Au 14 23u 1 P
++R Y 1945 o - S 30 2 0 S
++R Y 1965 o - Ap lastSun 0 2 DD
++R Y 1965 o - O lastSun 2 0 S
++R Y 1980 1986 - Ap lastSun 2 1 D
++R Y 1980 2006 - O lastSun 2 0 S
++R Y 1987 2006 - Ap Sun>=1 2 1 D
+ Z America/Pangnirtung 0 - -00 1921
+--4 Ae A%sT 1995 Ap Sun>=1 2
+--5 AU E%sT 1999 O 31 2
+--6 AU C%sT 2000 O 29 2
+--5 AU E%sT
++-4 Y A%sT 1995 Ap Sun>=1 2
++-5 C E%sT 1999 O 31 2
++-6 C C%sT 2000 O 29 2
++-5 C E%sT
+ Z America/Iqaluit 0 - -00 1942 Au
+--5 Ae E%sT 1999 O 31 2
+--6 AU C%sT 2000 O 29 2
+--5 AU E%sT
++-5 Y E%sT 1999 O 31 2
++-6 C C%sT 2000 O 29 2
++-5 C E%sT
+ Z America/Resolute 0 - -00 1947 Au 31
+--6 Ae C%sT 2000 O 29 2
++-6 Y C%sT 2000 O 29 2
+ -5 - EST 2001 Ap 1 3
+--6 AU C%sT 2006 O 29 2
++-6 C C%sT 2006 O 29 2
+ -5 - EST 2007 Mar 11 3
+--6 AU C%sT
++-6 C C%sT
+ Z America/Rankin_Inlet 0 - -00 1957
+--6 Ae C%sT 2000 O 29 2
++-6 Y C%sT 2000 O 29 2
+ -5 - EST 2001 Ap 1 3
+--6 AU C%sT
++-6 C C%sT
+ Z America/Cambridge_Bay 0 - -00 1920
+--7 Ae M%sT 1999 O 31 2
+--6 AU C%sT 2000 O 29 2
++-7 Y M%sT 1999 O 31 2
++-6 C C%sT 2000 O 29 2
+ -5 - EST 2000 N 5
+ -6 - CST 2001 Ap 1 3
+--7 AU M%sT
++-7 C M%sT
+ Z America/Yellowknife 0 - -00 1935
+--7 Ae M%sT 1980
+--7 AU M%sT
++-7 Y M%sT 1980
++-7 C M%sT
+ Z America/Inuvik 0 - -00 1953
+--8 Ae P%sT 1979 Ap lastSun 2
+--7 Ae M%sT 1980
+--7 AU M%sT
++-8 Y P%sT 1979 Ap lastSun 2
++-7 Y M%sT 1980
++-7 C M%sT
+ Z America/Whitehorse -9:0:12 - LMT 1900 Au 20
+--9 Ae Y%sT 1967 May 28
+--8 Ae P%sT 1980
+--8 AU P%sT
++-9 Y Y%sT 1967 May 28
++-8 Y P%sT 1980
++-8 C P%sT
+ Z America/Dawson -9:17:40 - LMT 1900 Au 20
+--9 Ae Y%sT 1973 O 28
+--8 Ae P%sT 1980
+--8 AU P%sT
+-R Af 1939 o - F 5 0 1 D
+-R Af 1939 o - Jun 25 0 0 S
+-R Af 1940 o - D 9 0 1 D
+-R Af 1941 o - Ap 1 0 0 S
+-R Af 1943 o - D 16 0 1 W
+-R Af 1944 o - May 1 0 0 S
+-R Af 1950 o - F 12 0 1 D
+-R Af 1950 o - Jul 30 0 0 S
+-R Af 1996 2000 - Ap Sun>=1 2 1 D
+-R Af 1996 2000 - O lastSun 2 0 S
+-R Af 2001 o - May Sun>=1 2 1 D
+-R Af 2001 o - S lastSun 2 0 S
+-R Af 2002 ma - Ap Sun>=1 2 1 D
+-R Af 2002 ma - O lastSun 2 0 S
++-9 Y Y%sT 1973 O 28
++-8 Y P%sT 1980
++-8 C P%sT
++R m 1939 o - F 5 0 1 D
++R m 1939 o - Jun 25 0 0 S
++R m 1940 o - D 9 0 1 D
++R m 1941 o - Ap 1 0 0 S
++R m 1943 o - D 16 0 1 W
++R m 1944 o - May 1 0 0 S
++R m 1950 o - F 12 0 1 D
++R m 1950 o - Jul 30 0 0 S
++R m 1996 2000 - Ap Sun>=1 2 1 D
++R m 1996 2000 - O lastSun 2 0 S
++R m 2001 o - May Sun>=1 2 1 D
++R m 2001 o - S lastSun 2 0 S
++R m 2002 ma - Ap Sun>=1 2 1 D
++R m 2002 ma - O lastSun 2 0 S
+ Z America/Cancun -5:47:4 - LMT 1922 Ja 1 0:12:56
+ -6 - CST 1981 D 23
+--5 Af E%sT 1998 Au 2 2
+--6 Af C%sT 2015 F 1 2
++-5 m E%sT 1998 Au 2 2
++-6 m C%sT 2015 F 1 2
+ -5 - EST
+ Z America/Merida -5:58:28 - LMT 1922 Ja 1 0:1:32
+ -6 - CST 1981 D 23
+ -5 - EST 1982 D 2
+--6 Af C%sT
++-6 m C%sT
+ Z America/Matamoros -6:40 - LMT 1921 D 31 23:20
+ -6 - CST 1988
+--6 AF C%sT 1989
+--6 Af C%sT 2010
+--6 AF C%sT
++-6 u C%sT 1989
++-6 m C%sT 2010
++-6 u C%sT
+ Z America/Monterrey -6:41:16 - LMT 1921 D 31 23:18:44
+ -6 - CST 1988
+--6 AF C%sT 1989
+--6 Af C%sT
++-6 u C%sT 1989
++-6 m C%sT
+ Z America/Mexico_City -6:36:36 - LMT 1922 Ja 1 0:23:24
+ -7 - MST 1927 Jun 10 23
+ -6 - CST 1930 N 15
+ -7 - MST 1931 May 1 23
+ -6 - CST 1931 O
+ -7 - MST 1932 Ap
+--6 Af C%sT 2001 S 30 2
++-6 m C%sT 2001 S 30 2
+ -6 - CST 2002 F 20
+--6 Af C%sT
++-6 m C%sT
+ Z America/Ojinaga -6:57:40 - LMT 1922 Ja 1 0:2:20
+ -7 - MST 1927 Jun 10 23
+ -6 - CST 1930 N 15
+@@ -3215,10 +3232,10 @@ Z America/Ojinaga -6:57:40 - LMT 1922 Ja 1 0:2:20
+ -6 - CST 1931 O
+ -7 - MST 1932 Ap
+ -6 - CST 1996
+--6 Af C%sT 1998
++-6 m C%sT 1998
+ -6 - CST 1998 Ap Sun>=1 3
+--7 Af M%sT 2010
+--7 AF M%sT
++-7 m M%sT 2010
++-7 u M%sT
+ Z America/Chihuahua -7:4:20 - LMT 1921 D 31 23:55:40
+ -7 - MST 1927 Jun 10 23
+ -6 - CST 1930 N 15
+@@ -3226,9 +3243,9 @@ Z America/Chihuahua -7:4:20 - LMT 1921 D 31 23:55:40
+ -6 - CST 1931 O
+ -7 - MST 1932 Ap
+ -6 - CST 1996
+--6 Af C%sT 1998
++-6 m C%sT 1998
+ -6 - CST 1998 Ap Sun>=1 3
+--7 Af M%sT
++-7 m M%sT
+ Z America/Hermosillo -7:23:52 - LMT 1921 D 31 23:36:8
+ -7 - MST 1927 Jun 10 23
+ -6 - CST 1930 N 15
+@@ -3238,7 +3255,7 @@ Z America/Hermosillo -7:23:52 - LMT 1921 D 31 23:36:8
+ -6 - CST 1942 Ap 24
+ -7 - MST 1949 Ja 14
+ -8 - PST 1970
+--7 Af M%sT 1999
++-7 m M%sT 1999
+ -7 - MST
+ Z America/Mazatlan -7:5:40 - LMT 1921 D 31 23:54:20
+ -7 - MST 1927 Jun 10 23
+@@ -3249,7 +3266,7 @@ Z America/Mazatlan -7:5:40 - LMT 1921 D 31 23:54:20
+ -6 - CST 1942 Ap 24
+ -7 - MST 1949 Ja 14
+ -8 - PST 1970
+--7 Af M%sT
++-7 m M%sT
+ Z America/Bahia_Banderas -7:1 - LMT 1921 D 31 23:59
+ -7 - MST 1927 Jun 10 23
+ -6 - CST 1930 N 15
+@@ -3259,8 +3276,8 @@ Z America/Bahia_Banderas -7:1 - LMT 1921 D 31 23:59
+ -6 - CST 1942 Ap 24
+ -7 - MST 1949 Ja 14
+ -8 - PST 1970
+--7 Af M%sT 2010 Ap 4 2
+--6 Af C%sT
++-7 m M%sT 2010 Ap 4 2
++-6 m C%sT
+ Z America/Tijuana -7:48:4 - LMT 1922 Ja 1 0:11:56
+ -7 - MST 1924
+ -8 - PST 1927 Jun 10 23
+@@ -3273,315 +3290,315 @@ Z America/Tijuana -7:48:4 - LMT 1922 Ja 1 0:11:56
+ -8 - PST 1948 Ap 5
+ -8 1 PDT 1949 Ja 14
+ -8 - PST 1954
+--8 AJ P%sT 1961
++-8 CA P%sT 1961
+ -8 - PST 1976
+--8 AF P%sT 1996
+--8 Af P%sT 2001
+--8 AF P%sT 2002 F 20
+--8 Af P%sT 2010
+--8 AF P%sT
+-R Ag 1964 1975 - O lastSun 2 0 S
+-R Ag 1964 1975 - Ap lastSun 2 1 D
++-8 u P%sT 1996
++-8 m P%sT 2001
++-8 u P%sT 2002 F 20
++-8 m P%sT 2010
++-8 u P%sT
++R BS 1964 1975 - O lastSun 2 0 S
++R BS 1964 1975 - Ap lastSun 2 1 D
+ Z America/Nassau -5:9:30 - LMT 1912 Mar 2
+--5 Ag E%sT 1976
+--5 AF E%sT
+-R Ah 1977 o - Jun 12 2 1 D
+-R Ah 1977 1978 - O Sun>=1 2 0 S
+-R Ah 1978 1980 - Ap Sun>=15 2 1 D
+-R Ah 1979 o - S 30 2 0 S
+-R Ah 1980 o - S 25 2 0 S
++-5 BS E%sT 1976
++-5 u E%sT
++R BB 1977 o - Jun 12 2 1 D
++R BB 1977 1978 - O Sun>=1 2 0 S
++R BB 1978 1980 - Ap Sun>=15 2 1 D
++R BB 1979 o - S 30 2 0 S
++R BB 1980 o - S 25 2 0 S
+ Z America/Barbados -3:58:29 - LMT 1924
+ -3:58:29 - BMT 1932
+--4 Ah A%sT
+-R Ai 1918 1942 - O Sun>=2 0 0:30 -0530
+-R Ai 1919 1943 - F Sun>=9 0 0 CST
+-R Ai 1973 o - D 5 0 1 CDT
+-R Ai 1974 o - F 9 0 0 CST
+-R Ai 1982 o - D 18 0 1 CDT
+-R Ai 1983 o - F 12 0 0 CST
++-4 BB A%sT
++R BZ 1918 1942 - O Sun>=2 0 0:30 -0530
++R BZ 1919 1943 - F Sun>=9 0 0 CST
++R BZ 1973 o - D 5 0 1 CDT
++R BZ 1974 o - F 9 0 0 CST
++R BZ 1982 o - D 18 0 1 CDT
++R BZ 1983 o - F 12 0 0 CST
+ Z America/Belize -5:52:48 - LMT 1912 Ap
+--6 Ai %s
++-6 BZ %s
+ Z Atlantic/Bermuda -4:19:18 - LMT 1930 Ja 1 2
+ -4 - AST 1974 Ap 28 2
+--4 AU A%sT 1976
+--4 AF A%sT
+-R Aj 1979 1980 - F lastSun 0 1 D
+-R Aj 1979 1980 - Jun Sun>=1 0 0 S
+-R Aj 1991 1992 - Ja Sat>=15 0 1 D
+-R Aj 1991 o - Jul 1 0 0 S
+-R Aj 1992 o - Mar 15 0 0 S
++-4 C A%sT 1976
++-4 u A%sT
++R CR 1979 1980 - F lastSun 0 1 D
++R CR 1979 1980 - Jun Sun>=1 0 0 S
++R CR 1991 1992 - Ja Sat>=15 0 1 D
++R CR 1991 o - Jul 1 0 0 S
++R CR 1992 o - Mar 15 0 0 S
+ Z America/Costa_Rica -5:36:13 - LMT 1890
+ -5:36:13 - SJMT 1921 Ja 15
+--6 Aj C%sT
+-R Ak 1928 o - Jun 10 0 1 D
+-R Ak 1928 o - O 10 0 0 S
+-R Ak 1940 1942 - Jun Sun>=1 0 1 D
+-R Ak 1940 1942 - S Sun>=1 0 0 S
+-R Ak 1945 1946 - Jun Sun>=1 0 1 D
+-R Ak 1945 1946 - S Sun>=1 0 0 S
+-R Ak 1965 o - Jun 1 0 1 D
+-R Ak 1965 o - S 30 0 0 S
+-R Ak 1966 o - May 29 0 1 D
+-R Ak 1966 o - O 2 0 0 S
+-R Ak 1967 o - Ap 8 0 1 D
+-R Ak 1967 1968 - S Sun>=8 0 0 S
+-R Ak 1968 o - Ap 14 0 1 D
+-R Ak 1969 1977 - Ap lastSun 0 1 D
+-R Ak 1969 1971 - O lastSun 0 0 S
+-R Ak 1972 1974 - O 8 0 0 S
+-R Ak 1975 1977 - O lastSun 0 0 S
+-R Ak 1978 o - May 7 0 1 D
+-R Ak 1978 1990 - O Sun>=8 0 0 S
+-R Ak 1979 1980 - Mar Sun>=15 0 1 D
+-R Ak 1981 1985 - May Sun>=5 0 1 D
+-R Ak 1986 1989 - Mar Sun>=14 0 1 D
+-R Ak 1990 1997 - Ap Sun>=1 0 1 D
+-R Ak 1991 1995 - O Sun>=8 0s 0 S
+-R Ak 1996 o - O 6 0s 0 S
+-R Ak 1997 o - O 12 0s 0 S
+-R Ak 1998 1999 - Mar lastSun 0s 1 D
+-R Ak 1998 2003 - O lastSun 0s 0 S
+-R Ak 2000 2003 - Ap Sun>=1 0s 1 D
+-R Ak 2004 o - Mar lastSun 0s 1 D
+-R Ak 2006 2010 - O lastSun 0s 0 S
+-R Ak 2007 o - Mar Sun>=8 0s 1 D
+-R Ak 2008 o - Mar Sun>=15 0s 1 D
+-R Ak 2009 2010 - Mar Sun>=8 0s 1 D
+-R Ak 2011 o - Mar Sun>=15 0s 1 D
+-R Ak 2011 o - N 13 0s 0 S
+-R Ak 2012 o - Ap 1 0s 1 D
+-R Ak 2012 ma - N Sun>=1 0s 0 S
+-R Ak 2013 ma - Mar Sun>=8 0s 1 D
++-6 CR C%sT
++R Q 1928 o - Jun 10 0 1 D
++R Q 1928 o - O 10 0 0 S
++R Q 1940 1942 - Jun Sun>=1 0 1 D
++R Q 1940 1942 - S Sun>=1 0 0 S
++R Q 1945 1946 - Jun Sun>=1 0 1 D
++R Q 1945 1946 - S Sun>=1 0 0 S
++R Q 1965 o - Jun 1 0 1 D
++R Q 1965 o - S 30 0 0 S
++R Q 1966 o - May 29 0 1 D
++R Q 1966 o - O 2 0 0 S
++R Q 1967 o - Ap 8 0 1 D
++R Q 1967 1968 - S Sun>=8 0 0 S
++R Q 1968 o - Ap 14 0 1 D
++R Q 1969 1977 - Ap lastSun 0 1 D
++R Q 1969 1971 - O lastSun 0 0 S
++R Q 1972 1974 - O 8 0 0 S
++R Q 1975 1977 - O lastSun 0 0 S
++R Q 1978 o - May 7 0 1 D
++R Q 1978 1990 - O Sun>=8 0 0 S
++R Q 1979 1980 - Mar Sun>=15 0 1 D
++R Q 1981 1985 - May Sun>=5 0 1 D
++R Q 1986 1989 - Mar Sun>=14 0 1 D
++R Q 1990 1997 - Ap Sun>=1 0 1 D
++R Q 1991 1995 - O Sun>=8 0s 0 S
++R Q 1996 o - O 6 0s 0 S
++R Q 1997 o - O 12 0s 0 S
++R Q 1998 1999 - Mar lastSun 0s 1 D
++R Q 1998 2003 - O lastSun 0s 0 S
++R Q 2000 2003 - Ap Sun>=1 0s 1 D
++R Q 2004 o - Mar lastSun 0s 1 D
++R Q 2006 2010 - O lastSun 0s 0 S
++R Q 2007 o - Mar Sun>=8 0s 1 D
++R Q 2008 o - Mar Sun>=15 0s 1 D
++R Q 2009 2010 - Mar Sun>=8 0s 1 D
++R Q 2011 o - Mar Sun>=15 0s 1 D
++R Q 2011 o - N 13 0s 0 S
++R Q 2012 o - Ap 1 0s 1 D
++R Q 2012 ma - N Sun>=1 0s 0 S
++R Q 2013 ma - Mar Sun>=8 0s 1 D
+ Z America/Havana -5:29:28 - LMT 1890
+ -5:29:36 - HMT 1925 Jul 19 12
+--5 Ak C%sT
+-R Al 1966 o - O 30 0 1 EDT
+-R Al 1967 o - F 28 0 0 EST
+-R Al 1969 1973 - O lastSun 0 0:30 -0430
+-R Al 1970 o - F 21 0 0 EST
+-R Al 1971 o - Ja 20 0 0 EST
+-R Al 1972 1974 - Ja 21 0 0 EST
++-5 Q C%sT
++R DO 1966 o - O 30 0 1 EDT
++R DO 1967 o - F 28 0 0 EST
++R DO 1969 1973 - O lastSun 0 0:30 -0430
++R DO 1970 o - F 21 0 0 EST
++R DO 1971 o - Ja 20 0 0 EST
++R DO 1972 1974 - Ja 21 0 0 EST
+ Z America/Santo_Domingo -4:39:36 - LMT 1890
+ -4:40 - SDMT 1933 Ap 1 12
+--5 Al %s 1974 O 27
++-5 DO %s 1974 O 27
+ -4 - AST 2000 O 29 2
+--5 AF E%sT 2000 D 3 1
++-5 u E%sT 2000 D 3 1
+ -4 - AST
+-R Am 1987 1988 - May Sun>=1 0 1 D
+-R Am 1987 1988 - S lastSun 0 0 S
++R SV 1987 1988 - May Sun>=1 0 1 D
++R SV 1987 1988 - S lastSun 0 0 S
+ Z America/El_Salvador -5:56:48 - LMT 1921
+--6 Am C%sT
+-R An 1973 o - N 25 0 1 D
+-R An 1974 o - F 24 0 0 S
+-R An 1983 o - May 21 0 1 D
+-R An 1983 o - S 22 0 0 S
+-R An 1991 o - Mar 23 0 1 D
+-R An 1991 o - S 7 0 0 S
+-R An 2006 o - Ap 30 0 1 D
+-R An 2006 o - O 1 0 0 S
++-6 SV C%sT
++R GT 1973 o - N 25 0 1 D
++R GT 1974 o - F 24 0 0 S
++R GT 1983 o - May 21 0 1 D
++R GT 1983 o - S 22 0 0 S
++R GT 1991 o - Mar 23 0 1 D
++R GT 1991 o - S 7 0 0 S
++R GT 2006 o - Ap 30 0 1 D
++R GT 2006 o - O 1 0 0 S
+ Z America/Guatemala -6:2:4 - LMT 1918 O 5
+--6 An C%sT
+-R Ao 1983 o - May 8 0 1 D
+-R Ao 1984 1987 - Ap lastSun 0 1 D
+-R Ao 1983 1987 - O lastSun 0 0 S
+-R Ao 1988 1997 - Ap Sun>=1 1s 1 D
+-R Ao 1988 1997 - O lastSun 1s 0 S
+-R Ao 2005 2006 - Ap Sun>=1 0 1 D
+-R Ao 2005 2006 - O lastSun 0 0 S
+-R Ao 2012 2015 - Mar Sun>=8 2 1 D
+-R Ao 2012 2015 - N Sun>=1 2 0 S
+-R Ao 2017 ma - Mar Sun>=8 2 1 D
+-R Ao 2017 ma - N Sun>=1 2 0 S
++-6 GT C%sT
++R HT 1983 o - May 8 0 1 D
++R HT 1984 1987 - Ap lastSun 0 1 D
++R HT 1983 1987 - O lastSun 0 0 S
++R HT 1988 1997 - Ap Sun>=1 1s 1 D
++R HT 1988 1997 - O lastSun 1s 0 S
++R HT 2005 2006 - Ap Sun>=1 0 1 D
++R HT 2005 2006 - O lastSun 0 0 S
++R HT 2012 2015 - Mar Sun>=8 2 1 D
++R HT 2012 2015 - N Sun>=1 2 0 S
++R HT 2017 ma - Mar Sun>=8 2 1 D
++R HT 2017 ma - N Sun>=1 2 0 S
+ Z America/Port-au-Prince -4:49:20 - LMT 1890
+ -4:49 - PPMT 1917 Ja 24 12
+--5 Ao E%sT
+-R Ap 1987 1988 - May Sun>=1 0 1 D
+-R Ap 1987 1988 - S lastSun 0 0 S
+-R Ap 2006 o - May Sun>=1 0 1 D
+-R Ap 2006 o - Au M>=1 0 0 S
++-5 HT E%sT
++R HN 1987 1988 - May Sun>=1 0 1 D
++R HN 1987 1988 - S lastSun 0 0 S
++R HN 2006 o - May Sun>=1 0 1 D
++R HN 2006 o - Au M>=1 0 0 S
+ Z America/Tegucigalpa -5:48:52 - LMT 1921 Ap
+--6 Ap C%sT
++-6 HN C%sT
+ Z America/Jamaica -5:7:10 - LMT 1890
+ -5:7:10 - KMT 1912 F
+ -5 - EST 1974
+--5 AF E%sT 1984
++-5 u E%sT 1984
+ -5 - EST
+ Z America/Martinique -4:4:20 - LMT 1890
+ -4:4:20 - FFMT 1911 May
+ -4 - AST 1980 Ap 6
+ -4 1 ADT 1980 S 28
+ -4 - AST
+-R Aq 1979 1980 - Mar Sun>=16 0 1 D
+-R Aq 1979 1980 - Jun M>=23 0 0 S
+-R Aq 2005 o - Ap 10 0 1 D
+-R Aq 2005 o - O Sun>=1 0 0 S
+-R Aq 2006 o - Ap 30 2 1 D
+-R Aq 2006 o - O Sun>=1 1 0 S
++R NI 1979 1980 - Mar Sun>=16 0 1 D
++R NI 1979 1980 - Jun M>=23 0 0 S
++R NI 2005 o - Ap 10 0 1 D
++R NI 2005 o - O Sun>=1 0 0 S
++R NI 2006 o - Ap 30 2 1 D
++R NI 2006 o - O Sun>=1 1 0 S
+ Z America/Managua -5:45:8 - LMT 1890
+ -5:45:12 - MMT 1934 Jun 23
+ -6 - CST 1973 May
+ -5 - EST 1975 F 16
+--6 Aq C%sT 1992 Ja 1 4
++-6 NI C%sT 1992 Ja 1 4
+ -5 - EST 1992 S 24
+ -6 - CST 1993
+ -5 - EST 1997
+--6 Aq C%sT
++-6 NI C%sT
+ Z America/Panama -5:18:8 - LMT 1890
+ -5:19:36 - CMT 1908 Ap 22
+ -5 - EST
+ Li America/Panama America/Cayman
+ Z America/Puerto_Rico -4:24:25 - LMT 1899 Mar 28 12
+ -4 - AST 1942 May 3
+--4 AF A%sT 1946
++-4 u A%sT 1946
+ -4 - AST
+ Z America/Miquelon -3:44:40 - LMT 1911 May 15
+ -4 - AST 1980 May
+ -3 - -03 1987
+--3 AU -03/-02
++-3 C -03/-02
+ Z America/Grand_Turk -4:44:32 - LMT 1890
+ -5:7:10 - KMT 1912 F
+ -5 - EST 1979
+--5 AF E%sT 2015 N Sun>=1 2
++-5 u E%sT 2015 N Sun>=1 2
+ -4 - AST 2018 Mar 11 3
+--5 AF E%sT
+-R Ar 1930 o - D 1 0 1 -
+-R Ar 1931 o - Ap 1 0 0 -
+-R Ar 1931 o - O 15 0 1 -
+-R Ar 1932 1940 - Mar 1 0 0 -
+-R Ar 1932 1939 - N 1 0 1 -
+-R Ar 1940 o - Jul 1 0 1 -
+-R Ar 1941 o - Jun 15 0 0 -
+-R Ar 1941 o - O 15 0 1 -
+-R Ar 1943 o - Au 1 0 0 -
+-R Ar 1943 o - O 15 0 1 -
+-R Ar 1946 o - Mar 1 0 0 -
+-R Ar 1946 o - O 1 0 1 -
+-R Ar 1963 o - O 1 0 0 -
+-R Ar 1963 o - D 15 0 1 -
+-R Ar 1964 1966 - Mar 1 0 0 -
+-R Ar 1964 1966 - O 15 0 1 -
+-R Ar 1967 o - Ap 2 0 0 -
+-R Ar 1967 1968 - O Sun>=1 0 1 -
+-R Ar 1968 1969 - Ap Sun>=1 0 0 -
+-R Ar 1974 o - Ja 23 0 1 -
+-R Ar 1974 o - May 1 0 0 -
+-R Ar 1988 o - D 1 0 1 -
+-R Ar 1989 1993 - Mar Sun>=1 0 0 -
+-R Ar 1989 1992 - O Sun>=15 0 1 -
+-R Ar 1999 o - O Sun>=1 0 1 -
+-R Ar 2000 o - Mar 3 0 0 -
+-R Ar 2007 o - D 30 0 1 -
+-R Ar 2008 2009 - Mar Sun>=15 0 0 -
+-R Ar 2008 o - O Sun>=15 0 1 -
++-5 u E%sT
++R A 1930 o - D 1 0 1 -
++R A 1931 o - Ap 1 0 0 -
++R A 1931 o - O 15 0 1 -
++R A 1932 1940 - Mar 1 0 0 -
++R A 1932 1939 - N 1 0 1 -
++R A 1940 o - Jul 1 0 1 -
++R A 1941 o - Jun 15 0 0 -
++R A 1941 o - O 15 0 1 -
++R A 1943 o - Au 1 0 0 -
++R A 1943 o - O 15 0 1 -
++R A 1946 o - Mar 1 0 0 -
++R A 1946 o - O 1 0 1 -
++R A 1963 o - O 1 0 0 -
++R A 1963 o - D 15 0 1 -
++R A 1964 1966 - Mar 1 0 0 -
++R A 1964 1966 - O 15 0 1 -
++R A 1967 o - Ap 2 0 0 -
++R A 1967 1968 - O Sun>=1 0 1 -
++R A 1968 1969 - Ap Sun>=1 0 0 -
++R A 1974 o - Ja 23 0 1 -
++R A 1974 o - May 1 0 0 -
++R A 1988 o - D 1 0 1 -
++R A 1989 1993 - Mar Sun>=1 0 0 -
++R A 1989 1992 - O Sun>=15 0 1 -
++R A 1999 o - O Sun>=1 0 1 -
++R A 2000 o - Mar 3 0 0 -
++R A 2007 o - D 30 0 1 -
++R A 2008 2009 - Mar Sun>=15 0 0 -
++R A 2008 o - O Sun>=15 0 1 -
+ Z America/Argentina/Buenos_Aires -3:53:48 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
+--3 Ar -03/-02
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
++-3 A -03/-02
+ Z America/Argentina/Cordoba -4:16:48 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1991 Mar 3
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1991 Mar 3
+ -4 - -04 1991 O 20
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
+--3 Ar -03/-02
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
++-3 A -03/-02
+ Z America/Argentina/Salta -4:21:40 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1991 Mar 3
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1991 Mar 3
+ -4 - -04 1991 O 20
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Z America/Argentina/Tucuman -4:20:52 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1991 Mar 3
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1991 Mar 3
+ -4 - -04 1991 O 20
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 Jun
+ -4 - -04 2004 Jun 13
+--3 Ar -03/-02
++-3 A -03/-02
+ Z America/Argentina/La_Rioja -4:27:24 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1991 Mar
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1991 Mar
+ -4 - -04 1991 May 7
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 Jun
+ -4 - -04 2004 Jun 20
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Z America/Argentina/San_Juan -4:34:4 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1991 Mar
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1991 Mar
+ -4 - -04 1991 May 7
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 May 31
+ -4 - -04 2004 Jul 25
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Z America/Argentina/Jujuy -4:21:12 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1990 Mar 4
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1990 Mar 4
+ -4 - -04 1990 O 28
+ -4 1 -03 1991 Mar 17
+ -4 - -04 1991 O 6
+ -3 1 -02 1992
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Z America/Argentina/Catamarca -4:23:8 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1991 Mar 3
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1991 Mar 3
+ -4 - -04 1991 O 20
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 Jun
+ -4 - -04 2004 Jun 20
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Z America/Argentina/Mendoza -4:35:16 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1990 Mar 4
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1990 Mar 4
+ -4 - -04 1990 O 15
+ -4 1 -03 1991 Mar
+ -4 - -04 1991 O 15
+ -4 1 -03 1992 Mar
+ -4 - -04 1992 O 18
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 May 23
+ -4 - -04 2004 S 26
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 2008 O 18
+ -3 - -03
+-R As 2008 2009 - Mar Sun>=8 0 0 -
+-R As 2007 2008 - O Sun>=8 0 1 -
++R Sa 2008 2009 - Mar Sun>=8 0 0 -
++R Sa 2007 2008 - O Sun>=8 0 1 -
+ Z America/Argentina/San_Luis -4:25:24 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1990
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1990
+ -3 1 -02 1990 Mar 14
+ -4 - -04 1990 O 15
+ -4 1 -03 1991 Mar
+@@ -3590,286 +3607,288 @@ Z America/Argentina/San_Luis -4:25:24 - LMT 1894 O 31
+ -4 1 -03 2000 Mar 3
+ -3 - -03 2004 May 31
+ -4 - -04 2004 Jul 25
+--3 Ar -03/-02 2008 Ja 21
+--4 As -04/-03 2009 O 11
++-3 A -03/-02 2008 Ja 21
++-4 Sa -04/-03 2009 O 11
+ -3 - -03
+ Z America/Argentina/Rio_Gallegos -4:36:52 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 Jun
+ -4 - -04 2004 Jun 20
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Z America/Argentina/Ushuaia -4:33:12 - LMT 1894 O 31
+ -4:16:48 - CMT 1920 May
+ -4 - -04 1930 D
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1999 O 3
+--4 Ar -04/-03 2000 Mar 3
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1999 O 3
++-4 A -04/-03 2000 Mar 3
+ -3 - -03 2004 May 30
+ -4 - -04 2004 Jun 20
+--3 Ar -03/-02 2008 O 18
++-3 A -03/-02 2008 O 18
+ -3 - -03
+ Li America/Curacao America/Aruba
+ Z America/La_Paz -4:32:36 - LMT 1890
+ -4:32:36 - CMT 1931 O 15
+ -4:32:36 1 BST 1932 Mar 21
+ -4 - -04
+-R At 1931 o - O 3 11 1 -
+-R At 1932 1933 - Ap 1 0 0 -
+-R At 1932 o - O 3 0 1 -
+-R At 1949 1952 - D 1 0 1 -
+-R At 1950 o - Ap 16 1 0 -
+-R At 1951 1952 - Ap 1 0 0 -
+-R At 1953 o - Mar 1 0 0 -
+-R At 1963 o - D 9 0 1 -
+-R At 1964 o - Mar 1 0 0 -
+-R At 1965 o - Ja 31 0 1 -
+-R At 1965 o - Mar 31 0 0 -
+-R At 1965 o - D 1 0 1 -
+-R At 1966 1968 - Mar 1 0 0 -
+-R At 1966 1967 - N 1 0 1 -
+-R At 1985 o - N 2 0 1 -
+-R At 1986 o - Mar 15 0 0 -
+-R At 1986 o - O 25 0 1 -
+-R At 1987 o - F 14 0 0 -
+-R At 1987 o - O 25 0 1 -
+-R At 1988 o - F 7 0 0 -
+-R At 1988 o - O 16 0 1 -
+-R At 1989 o - Ja 29 0 0 -
+-R At 1989 o - O 15 0 1 -
+-R At 1990 o - F 11 0 0 -
+-R At 1990 o - O 21 0 1 -
+-R At 1991 o - F 17 0 0 -
+-R At 1991 o - O 20 0 1 -
+-R At 1992 o - F 9 0 0 -
+-R At 1992 o - O 25 0 1 -
+-R At 1993 o - Ja 31 0 0 -
+-R At 1993 1995 - O Sun>=11 0 1 -
+-R At 1994 1995 - F Sun>=15 0 0 -
+-R At 1996 o - F 11 0 0 -
+-R At 1996 o - O 6 0 1 -
+-R At 1997 o - F 16 0 0 -
+-R At 1997 o - O 6 0 1 -
+-R At 1998 o - Mar 1 0 0 -
+-R At 1998 o - O 11 0 1 -
+-R At 1999 o - F 21 0 0 -
+-R At 1999 o - O 3 0 1 -
+-R At 2000 o - F 27 0 0 -
+-R At 2000 2001 - O Sun>=8 0 1 -
+-R At 2001 2006 - F Sun>=15 0 0 -
+-R At 2002 o - N 3 0 1 -
+-R At 2003 o - O 19 0 1 -
+-R At 2004 o - N 2 0 1 -
+-R At 2005 o - O 16 0 1 -
+-R At 2006 o - N 5 0 1 -
+-R At 2007 o - F 25 0 0 -
+-R At 2007 o - O Sun>=8 0 1 -
+-R At 2008 2017 - O Sun>=15 0 1 -
+-R At 2008 2011 - F Sun>=15 0 0 -
+-R At 2012 o - F Sun>=22 0 0 -
+-R At 2013 2014 - F Sun>=15 0 0 -
+-R At 2015 o - F Sun>=22 0 0 -
+-R At 2016 2022 - F Sun>=15 0 0 -
+-R At 2018 ma - N Sun>=1 0 1 -
+-R At 2023 o - F Sun>=22 0 0 -
+-R At 2024 2025 - F Sun>=15 0 0 -
+-R At 2026 o - F Sun>=22 0 0 -
+-R At 2027 2033 - F Sun>=15 0 0 -
+-R At 2034 o - F Sun>=22 0 0 -
+-R At 2035 2036 - F Sun>=15 0 0 -
+-R At 2037 o - F Sun>=22 0 0 -
+-R At 2038 ma - F Sun>=15 0 0 -
++R B 1931 o - O 3 11 1 -
++R B 1932 1933 - Ap 1 0 0 -
++R B 1932 o - O 3 0 1 -
++R B 1949 1952 - D 1 0 1 -
++R B 1950 o - Ap 16 1 0 -
++R B 1951 1952 - Ap 1 0 0 -
++R B 1953 o - Mar 1 0 0 -
++R B 1963 o - D 9 0 1 -
++R B 1964 o - Mar 1 0 0 -
++R B 1965 o - Ja 31 0 1 -
++R B 1965 o - Mar 31 0 0 -
++R B 1965 o - D 1 0 1 -
++R B 1966 1968 - Mar 1 0 0 -
++R B 1966 1967 - N 1 0 1 -
++R B 1985 o - N 2 0 1 -
++R B 1986 o - Mar 15 0 0 -
++R B 1986 o - O 25 0 1 -
++R B 1987 o - F 14 0 0 -
++R B 1987 o - O 25 0 1 -
++R B 1988 o - F 7 0 0 -
++R B 1988 o - O 16 0 1 -
++R B 1989 o - Ja 29 0 0 -
++R B 1989 o - O 15 0 1 -
++R B 1990 o - F 11 0 0 -
++R B 1990 o - O 21 0 1 -
++R B 1991 o - F 17 0 0 -
++R B 1991 o - O 20 0 1 -
++R B 1992 o - F 9 0 0 -
++R B 1992 o - O 25 0 1 -
++R B 1993 o - Ja 31 0 0 -
++R B 1993 1995 - O Sun>=11 0 1 -
++R B 1994 1995 - F Sun>=15 0 0 -
++R B 1996 o - F 11 0 0 -
++R B 1996 o - O 6 0 1 -
++R B 1997 o - F 16 0 0 -
++R B 1997 o - O 6 0 1 -
++R B 1998 o - Mar 1 0 0 -
++R B 1998 o - O 11 0 1 -
++R B 1999 o - F 21 0 0 -
++R B 1999 o - O 3 0 1 -
++R B 2000 o - F 27 0 0 -
++R B 2000 2001 - O Sun>=8 0 1 -
++R B 2001 2006 - F Sun>=15 0 0 -
++R B 2002 o - N 3 0 1 -
++R B 2003 o - O 19 0 1 -
++R B 2004 o - N 2 0 1 -
++R B 2005 o - O 16 0 1 -
++R B 2006 o - N 5 0 1 -
++R B 2007 o - F 25 0 0 -
++R B 2007 o - O Sun>=8 0 1 -
++R B 2008 2017 - O Sun>=15 0 1 -
++R B 2008 2011 - F Sun>=15 0 0 -
++R B 2012 o - F Sun>=22 0 0 -
++R B 2013 2014 - F Sun>=15 0 0 -
++R B 2015 o - F Sun>=22 0 0 -
++R B 2016 2022 - F Sun>=15 0 0 -
++R B 2018 ma - N Sun>=1 0 1 -
++R B 2023 o - F Sun>=22 0 0 -
++R B 2024 2025 - F Sun>=15 0 0 -
++R B 2026 o - F Sun>=22 0 0 -
++R B 2027 2033 - F Sun>=15 0 0 -
++R B 2034 o - F Sun>=22 0 0 -
++R B 2035 2036 - F Sun>=15 0 0 -
++R B 2037 o - F Sun>=22 0 0 -
++R B 2038 ma - F Sun>=15 0 0 -
+ Z America/Noronha -2:9:40 - LMT 1914
+--2 At -02/-01 1990 S 17
++-2 B -02/-01 1990 S 17
+ -2 - -02 1999 S 30
+--2 At -02/-01 2000 O 15
++-2 B -02/-01 2000 O 15
+ -2 - -02 2001 S 13
+--2 At -02/-01 2002 O
++-2 B -02/-01 2002 O
+ -2 - -02
+ Z America/Belem -3:13:56 - LMT 1914
+--3 At -03/-02 1988 S 12
++-3 B -03/-02 1988 S 12
+ -3 - -03
+ Z America/Santarem -3:38:48 - LMT 1914
+--4 At -04/-03 1988 S 12
++-4 B -04/-03 1988 S 12
+ -4 - -04 2008 Jun 24
+ -3 - -03
+ Z America/Fortaleza -2:34 - LMT 1914
+--3 At -03/-02 1990 S 17
++-3 B -03/-02 1990 S 17
+ -3 - -03 1999 S 30
+--3 At -03/-02 2000 O 22
++-3 B -03/-02 2000 O 22
+ -3 - -03 2001 S 13
+--3 At -03/-02 2002 O
++-3 B -03/-02 2002 O
+ -3 - -03
+ Z America/Recife -2:19:36 - LMT 1914
+--3 At -03/-02 1990 S 17
++-3 B -03/-02 1990 S 17
+ -3 - -03 1999 S 30
+--3 At -03/-02 2000 O 15
++-3 B -03/-02 2000 O 15
+ -3 - -03 2001 S 13
+--3 At -03/-02 2002 O
++-3 B -03/-02 2002 O
+ -3 - -03
+ Z America/Araguaina -3:12:48 - LMT 1914
+--3 At -03/-02 1990 S 17
++-3 B -03/-02 1990 S 17
+ -3 - -03 1995 S 14
+--3 At -03/-02 2003 S 24
++-3 B -03/-02 2003 S 24
+ -3 - -03 2012 O 21
+--3 At -03/-02 2013 S
++-3 B -03/-02 2013 S
+ -3 - -03
+ Z America/Maceio -2:22:52 - LMT 1914
+--3 At -03/-02 1990 S 17
++-3 B -03/-02 1990 S 17
+ -3 - -03 1995 O 13
+--3 At -03/-02 1996 S 4
++-3 B -03/-02 1996 S 4
+ -3 - -03 1999 S 30
+--3 At -03/-02 2000 O 22
++-3 B -03/-02 2000 O 22
+ -3 - -03 2001 S 13
+--3 At -03/-02 2002 O
++-3 B -03/-02 2002 O
+ -3 - -03
+ Z America/Bahia -2:34:4 - LMT 1914
+--3 At -03/-02 2003 S 24
++-3 B -03/-02 2003 S 24
+ -3 - -03 2011 O 16
+--3 At -03/-02 2012 O 21
++-3 B -03/-02 2012 O 21
+ -3 - -03
+ Z America/Sao_Paulo -3:6:28 - LMT 1914
+--3 At -03/-02 1963 O 23
++-3 B -03/-02 1963 O 23
+ -3 1 -02 1964
+--3 At -03/-02
++-3 B -03/-02
+ Z America/Campo_Grande -3:38:28 - LMT 1914
+--4 At -04/-03
++-4 B -04/-03
+ Z America/Cuiaba -3:44:20 - LMT 1914
+--4 At -04/-03 2003 S 24
++-4 B -04/-03 2003 S 24
+ -4 - -04 2004 O
+--4 At -04/-03
++-4 B -04/-03
+ Z America/Porto_Velho -4:15:36 - LMT 1914
+--4 At -04/-03 1988 S 12
++-4 B -04/-03 1988 S 12
+ -4 - -04
+ Z America/Boa_Vista -4:2:40 - LMT 1914
+--4 At -04/-03 1988 S 12
++-4 B -04/-03 1988 S 12
+ -4 - -04 1999 S 30
+--4 At -04/-03 2000 O 15
++-4 B -04/-03 2000 O 15
+ -4 - -04
+ Z America/Manaus -4:0:4 - LMT 1914
+--4 At -04/-03 1988 S 12
++-4 B -04/-03 1988 S 12
+ -4 - -04 1993 S 28
+--4 At -04/-03 1994 S 22
++-4 B -04/-03 1994 S 22
+ -4 - -04
+ Z America/Eirunepe -4:39:28 - LMT 1914
+--5 At -05/-04 1988 S 12
++-5 B -05/-04 1988 S 12
+ -5 - -05 1993 S 28
+--5 At -05/-04 1994 S 22
++-5 B -05/-04 1994 S 22
+ -5 - -05 2008 Jun 24
+ -4 - -04 2013 N 10
+ -5 - -05
+ Z America/Rio_Branco -4:31:12 - LMT 1914
+--5 At -05/-04 1988 S 12
++-5 B -05/-04 1988 S 12
+ -5 - -05 2008 Jun 24
+ -4 - -04 2013 N 10
+ -5 - -05
+-R Au 1927 1931 - S 1 0 1 -
+-R Au 1928 1932 - Ap 1 0 0 -
+-R Au 1968 o - N 3 4u 1 -
+-R Au 1969 o - Mar 30 3u 0 -
+-R Au 1969 o - N 23 4u 1 -
+-R Au 1970 o - Mar 29 3u 0 -
+-R Au 1971 o - Mar 14 3u 0 -
+-R Au 1970 1972 - O Sun>=9 4u 1 -
+-R Au 1972 1986 - Mar Sun>=9 3u 0 -
+-R Au 1973 o - S 30 4u 1 -
+-R Au 1974 1987 - O Sun>=9 4u 1 -
+-R Au 1987 o - Ap 12 3u 0 -
+-R Au 1988 1990 - Mar Sun>=9 3u 0 -
+-R Au 1988 1989 - O Sun>=9 4u 1 -
+-R Au 1990 o - S 16 4u 1 -
+-R Au 1991 1996 - Mar Sun>=9 3u 0 -
+-R Au 1991 1997 - O Sun>=9 4u 1 -
+-R Au 1997 o - Mar 30 3u 0 -
+-R Au 1998 o - Mar Sun>=9 3u 0 -
+-R Au 1998 o - S 27 4u 1 -
+-R Au 1999 o - Ap 4 3u 0 -
+-R Au 1999 2010 - O Sun>=9 4u 1 -
+-R Au 2000 2007 - Mar Sun>=9 3u 0 -
+-R Au 2008 o - Mar 30 3u 0 -
+-R Au 2009 o - Mar Sun>=9 3u 0 -
+-R Au 2010 o - Ap Sun>=1 3u 0 -
+-R Au 2011 o - May Sun>=2 3u 0 -
+-R Au 2011 o - Au Sun>=16 4u 1 -
+-R Au 2012 2014 - Ap Sun>=23 3u 0 -
+-R Au 2012 2014 - S Sun>=2 4u 1 -
+-R Au 2016 ma - May Sun>=9 3u 0 -
+-R Au 2016 ma - Au Sun>=9 4u 1 -
++R x 1927 1931 - S 1 0 1 -
++R x 1928 1932 - Ap 1 0 0 -
++R x 1968 o - N 3 4u 1 -
++R x 1969 o - Mar 30 3u 0 -
++R x 1969 o - N 23 4u 1 -
++R x 1970 o - Mar 29 3u 0 -
++R x 1971 o - Mar 14 3u 0 -
++R x 1970 1972 - O Sun>=9 4u 1 -
++R x 1972 1986 - Mar Sun>=9 3u 0 -
++R x 1973 o - S 30 4u 1 -
++R x 1974 1987 - O Sun>=9 4u 1 -
++R x 1987 o - Ap 12 3u 0 -
++R x 1988 1990 - Mar Sun>=9 3u 0 -
++R x 1988 1989 - O Sun>=9 4u 1 -
++R x 1990 o - S 16 4u 1 -
++R x 1991 1996 - Mar Sun>=9 3u 0 -
++R x 1991 1997 - O Sun>=9 4u 1 -
++R x 1997 o - Mar 30 3u 0 -
++R x 1998 o - Mar Sun>=9 3u 0 -
++R x 1998 o - S 27 4u 1 -
++R x 1999 o - Ap 4 3u 0 -
++R x 1999 2010 - O Sun>=9 4u 1 -
++R x 2000 2007 - Mar Sun>=9 3u 0 -
++R x 2008 o - Mar 30 3u 0 -
++R x 2009 o - Mar Sun>=9 3u 0 -
++R x 2010 o - Ap Sun>=1 3u 0 -
++R x 2011 o - May Sun>=2 3u 0 -
++R x 2011 o - Au Sun>=16 4u 1 -
++R x 2012 2014 - Ap Sun>=23 3u 0 -
++R x 2012 2014 - S Sun>=2 4u 1 -
++R x 2016 2018 - May Sun>=9 3u 0 -
++R x 2016 2018 - Au Sun>=9 4u 1 -
++R x 2019 ma - Ap Sun>=2 3u 0 -
++R x 2019 ma - S Sun>=2 4u 1 -
+ Z America/Santiago -4:42:46 - LMT 1890
+ -4:42:46 - SMT 1910 Ja 10
+ -5 - -05 1916 Jul
+ -4:42:46 - SMT 1918 S 10
+ -4 - -04 1919 Jul
+ -4:42:46 - SMT 1927 S
+--5 Au -05/-04 1932 S
++-5 x -05/-04 1932 S
+ -4 - -04 1942 Jun
+ -5 - -05 1942 Au
+ -4 - -04 1946 Jul 15
+ -4 1 -03 1946 S
+ -4 - -04 1947 Ap
+ -5 - -05 1947 May 21 23
+--4 Au -04/-03
++-4 x -04/-03
+ Z America/Punta_Arenas -4:43:40 - LMT 1890
+ -4:42:46 - SMT 1910 Ja 10
+ -5 - -05 1916 Jul
+ -4:42:46 - SMT 1918 S 10
+ -4 - -04 1919 Jul
+ -4:42:46 - SMT 1927 S
+--5 Au -05/-04 1932 S
++-5 x -05/-04 1932 S
+ -4 - -04 1942 Jun
+ -5 - -05 1942 Au
+ -4 - -04 1947 Ap
+ -5 - -05 1947 May 21 23
+--4 Au -04/-03 2016 D 4
++-4 x -04/-03 2016 D 4
+ -3 - -03
+ Z Pacific/Easter -7:17:28 - LMT 1890
+ -7:17:28 - EMT 1932 S
+--7 Au -07/-06 1982 Mar 14 3u
+--6 Au -06/-05
++-7 x -07/-06 1982 Mar 14 3u
++-6 x -06/-05
+ Z Antarctica/Palmer 0 - -00 1965
+--4 Ar -04/-03 1969 O 5
+--3 Ar -03/-02 1982 May
+--4 Au -04/-03 2016 D 4
++-4 A -04/-03 1969 O 5
++-3 A -03/-02 1982 May
++-4 x -04/-03 2016 D 4
+ -3 - -03
+-R Av 1992 o - May 3 0 1 -
+-R Av 1993 o - Ap 4 0 0 -
++R CO 1992 o - May 3 0 1 -
++R CO 1993 o - Ap 4 0 0 -
+ Z America/Bogota -4:56:16 - LMT 1884 Mar 13
+ -4:56:16 - BMT 1914 N 23
+--5 Av -05/-04
++-5 CO -05/-04
+ Z America/Curacao -4:35:47 - LMT 1912 F 12
+ -4:30 - -0430 1965
+ -4 - AST
+ Li America/Curacao America/Lower_Princes
+ Li America/Curacao America/Kralendijk
+-R Aw 1992 o - N 28 0 1 -
+-R Aw 1993 o - F 5 0 0 -
++R EC 1992 o - N 28 0 1 -
++R EC 1993 o - F 5 0 0 -
+ Z America/Guayaquil -5:19:20 - LMT 1890
+ -5:14 - QMT 1931
+--5 Aw -05/-04
++-5 EC -05/-04
+ Z Pacific/Galapagos -5:58:24 - LMT 1931
+ -5 - -05 1986
+--6 Aw -06/-05
+-R Ax 1937 1938 - S lastSun 0 1 -
+-R Ax 1938 1942 - Mar Sun>=19 0 0 -
+-R Ax 1939 o - O 1 0 1 -
+-R Ax 1940 1942 - S lastSun 0 1 -
+-R Ax 1943 o - Ja 1 0 0 -
+-R Ax 1983 o - S lastSun 0 1 -
+-R Ax 1984 1985 - Ap lastSun 0 0 -
+-R Ax 1984 o - S 16 0 1 -
+-R Ax 1985 2000 - S Sun>=9 0 1 -
+-R Ax 1986 2000 - Ap Sun>=16 0 0 -
+-R Ax 2001 2010 - Ap Sun>=15 2 0 -
+-R Ax 2001 2010 - S Sun>=1 2 1 -
++-6 EC -06/-05
++R FK 1937 1938 - S lastSun 0 1 -
++R FK 1938 1942 - Mar Sun>=19 0 0 -
++R FK 1939 o - O 1 0 1 -
++R FK 1940 1942 - S lastSun 0 1 -
++R FK 1943 o - Ja 1 0 0 -
++R FK 1983 o - S lastSun 0 1 -
++R FK 1984 1985 - Ap lastSun 0 0 -
++R FK 1984 o - S 16 0 1 -
++R FK 1985 2000 - S Sun>=9 0 1 -
++R FK 1986 2000 - Ap Sun>=16 0 0 -
++R FK 2001 2010 - Ap Sun>=15 2 0 -
++R FK 2001 2010 - S Sun>=1 2 1 -
+ Z Atlantic/Stanley -3:51:24 - LMT 1890
+ -3:51:24 - SMT 1912 Mar 12
+--4 Ax -04/-03 1983 May
+--3 Ax -03/-02 1985 S 15
+--4 Ax -04/-03 2010 S 5 2
++-4 FK -04/-03 1983 May
++-3 FK -03/-02 1985 S 15
++-4 FK -04/-03 2010 S 5 2
+ -3 - -03
+ Z America/Cayenne -3:29:20 - LMT 1911 Jul
+ -4 - -04 1967 O
+@@ -3878,46 +3897,46 @@ Z America/Guyana -3:52:40 - LMT 1915 Mar
+ -3:45 - -0345 1975 Jul 31
+ -3 - -03 1991
+ -4 - -04
+-R Ay 1975 1988 - O 1 0 1 -
+-R Ay 1975 1978 - Mar 1 0 0 -
+-R Ay 1979 1991 - Ap 1 0 0 -
+-R Ay 1989 o - O 22 0 1 -
+-R Ay 1990 o - O 1 0 1 -
+-R Ay 1991 o - O 6 0 1 -
+-R Ay 1992 o - Mar 1 0 0 -
+-R Ay 1992 o - O 5 0 1 -
+-R Ay 1993 o - Mar 31 0 0 -
+-R Ay 1993 1995 - O 1 0 1 -
+-R Ay 1994 1995 - F lastSun 0 0 -
+-R Ay 1996 o - Mar 1 0 0 -
+-R Ay 1996 2001 - O Sun>=1 0 1 -
+-R Ay 1997 o - F lastSun 0 0 -
+-R Ay 1998 2001 - Mar Sun>=1 0 0 -
+-R Ay 2002 2004 - Ap Sun>=1 0 0 -
+-R Ay 2002 2003 - S Sun>=1 0 1 -
+-R Ay 2004 2009 - O Sun>=15 0 1 -
+-R Ay 2005 2009 - Mar Sun>=8 0 0 -
+-R Ay 2010 ma - O Sun>=1 0 1 -
+-R Ay 2010 2012 - Ap Sun>=8 0 0 -
+-R Ay 2013 ma - Mar Sun>=22 0 0 -
++R y 1975 1988 - O 1 0 1 -
++R y 1975 1978 - Mar 1 0 0 -
++R y 1979 1991 - Ap 1 0 0 -
++R y 1989 o - O 22 0 1 -
++R y 1990 o - O 1 0 1 -
++R y 1991 o - O 6 0 1 -
++R y 1992 o - Mar 1 0 0 -
++R y 1992 o - O 5 0 1 -
++R y 1993 o - Mar 31 0 0 -
++R y 1993 1995 - O 1 0 1 -
++R y 1994 1995 - F lastSun 0 0 -
++R y 1996 o - Mar 1 0 0 -
++R y 1996 2001 - O Sun>=1 0 1 -
++R y 1997 o - F lastSun 0 0 -
++R y 1998 2001 - Mar Sun>=1 0 0 -
++R y 2002 2004 - Ap Sun>=1 0 0 -
++R y 2002 2003 - S Sun>=1 0 1 -
++R y 2004 2009 - O Sun>=15 0 1 -
++R y 2005 2009 - Mar Sun>=8 0 0 -
++R y 2010 ma - O Sun>=1 0 1 -
++R y 2010 2012 - Ap Sun>=8 0 0 -
++R y 2013 ma - Mar Sun>=22 0 0 -
+ Z America/Asuncion -3:50:40 - LMT 1890
+ -3:50:40 - AMT 1931 O 10
+ -4 - -04 1972 O
+ -3 - -03 1974 Ap
+--4 Ay -04/-03
+-R Az 1938 o - Ja 1 0 1 -
+-R Az 1938 o - Ap 1 0 0 -
+-R Az 1938 1939 - S lastSun 0 1 -
+-R Az 1939 1940 - Mar Sun>=24 0 0 -
+-R Az 1986 1987 - Ja 1 0 1 -
+-R Az 1986 1987 - Ap 1 0 0 -
+-R Az 1990 o - Ja 1 0 1 -
+-R Az 1990 o - Ap 1 0 0 -
+-R Az 1994 o - Ja 1 0 1 -
+-R Az 1994 o - Ap 1 0 0 -
++-4 y -04/-03
++R PE 1938 o - Ja 1 0 1 -
++R PE 1938 o - Ap 1 0 0 -
++R PE 1938 1939 - S lastSun 0 1 -
++R PE 1939 1940 - Mar Sun>=24 0 0 -
++R PE 1986 1987 - Ja 1 0 1 -
++R PE 1986 1987 - Ap 1 0 0 -
++R PE 1990 o - Ja 1 0 1 -
++R PE 1990 o - Ap 1 0 0 -
++R PE 1994 o - Ja 1 0 1 -
++R PE 1994 o - Ap 1 0 0 -
+ Z America/Lima -5:8:12 - LMT 1890
+ -5:8:36 - LMT 1908 Jul 28
+--5 Az -05/-04
++-5 PE -05/-04
+ Z Atlantic/South_Georgia -2:26:8 - LMT 1890
+ -2 - -02
+ Z America/Paramaribo -3:40:40 - LMT 1911
+@@ -3940,65 +3959,65 @@ Li America/Port_of_Spain America/St_Lucia
+ Li America/Port_of_Spain America/St_Thomas
+ Li America/Port_of_Spain America/St_Vincent
+ Li America/Port_of_Spain America/Tortola
+-R A! 1923 1925 - O 1 0 0:30 -
+-R A! 1924 1926 - Ap 1 0 0 -
+-R A! 1933 1938 - O lastSun 0 0:30 -
+-R A! 1934 1941 - Mar lastSat 24 0 -
+-R A! 1939 o - O 1 0 0:30 -
+-R A! 1940 o - O 27 0 0:30 -
+-R A! 1941 o - Au 1 0 0:30 -
+-R A! 1942 o - D 14 0 0:30 -
+-R A! 1943 o - Mar 14 0 0 -
+-R A! 1959 o - May 24 0 0:30 -
+-R A! 1959 o - N 15 0 0 -
+-R A! 1960 o - Ja 17 0 1 -
+-R A! 1960 o - Mar 6 0 0 -
+-R A! 1965 o - Ap 4 0 1 -
+-R A! 1965 o - S 26 0 0 -
+-R A! 1968 o - May 27 0 0:30 -
+-R A! 1968 o - D 1 0 0 -
+-R A! 1970 o - Ap 25 0 1 -
+-R A! 1970 o - Jun 14 0 0 -
+-R A! 1972 o - Ap 23 0 1 -
+-R A! 1972 o - Jul 16 0 0 -
+-R A! 1974 o - Ja 13 0 1:30 -
+-R A! 1974 o - Mar 10 0 0:30 -
+-R A! 1974 o - S 1 0 0 -
+-R A! 1974 o - D 22 0 1 -
+-R A! 1975 o - Mar 30 0 0 -
+-R A! 1976 o - D 19 0 1 -
+-R A! 1977 o - Mar 6 0 0 -
+-R A! 1977 o - D 4 0 1 -
+-R A! 1978 1979 - Mar Sun>=1 0 0 -
+-R A! 1978 o - D 17 0 1 -
+-R A! 1979 o - Ap 29 0 1 -
+-R A! 1980 o - Mar 16 0 0 -
+-R A! 1987 o - D 14 0 1 -
+-R A! 1988 o - F 28 0 0 -
+-R A! 1988 o - D 11 0 1 -
+-R A! 1989 o - Mar 5 0 0 -
+-R A! 1989 o - O 29 0 1 -
+-R A! 1990 o - F 25 0 0 -
+-R A! 1990 1991 - O Sun>=21 0 1 -
+-R A! 1991 1992 - Mar Sun>=1 0 0 -
+-R A! 1992 o - O 18 0 1 -
+-R A! 1993 o - F 28 0 0 -
+-R A! 2004 o - S 19 0 1 -
+-R A! 2005 o - Mar 27 2 0 -
+-R A! 2005 o - O 9 2 1 -
+-R A! 2006 2015 - Mar Sun>=8 2 0 -
+-R A! 2006 2014 - O Sun>=1 2 1 -
++R U 1923 1925 - O 1 0 0:30 -
++R U 1924 1926 - Ap 1 0 0 -
++R U 1933 1938 - O lastSun 0 0:30 -
++R U 1934 1941 - Mar lastSat 24 0 -
++R U 1939 o - O 1 0 0:30 -
++R U 1940 o - O 27 0 0:30 -
++R U 1941 o - Au 1 0 0:30 -
++R U 1942 o - D 14 0 0:30 -
++R U 1943 o - Mar 14 0 0 -
++R U 1959 o - May 24 0 0:30 -
++R U 1959 o - N 15 0 0 -
++R U 1960 o - Ja 17 0 1 -
++R U 1960 o - Mar 6 0 0 -
++R U 1965 o - Ap 4 0 1 -
++R U 1965 o - S 26 0 0 -
++R U 1968 o - May 27 0 0:30 -
++R U 1968 o - D 1 0 0 -
++R U 1970 o - Ap 25 0 1 -
++R U 1970 o - Jun 14 0 0 -
++R U 1972 o - Ap 23 0 1 -
++R U 1972 o - Jul 16 0 0 -
++R U 1974 o - Ja 13 0 1:30 -
++R U 1974 o - Mar 10 0 0:30 -
++R U 1974 o - S 1 0 0 -
++R U 1974 o - D 22 0 1 -
++R U 1975 o - Mar 30 0 0 -
++R U 1976 o - D 19 0 1 -
++R U 1977 o - Mar 6 0 0 -
++R U 1977 o - D 4 0 1 -
++R U 1978 1979 - Mar Sun>=1 0 0 -
++R U 1978 o - D 17 0 1 -
++R U 1979 o - Ap 29 0 1 -
++R U 1980 o - Mar 16 0 0 -
++R U 1987 o - D 14 0 1 -
++R U 1988 o - F 28 0 0 -
++R U 1988 o - D 11 0 1 -
++R U 1989 o - Mar 5 0 0 -
++R U 1989 o - O 29 0 1 -
++R U 1990 o - F 25 0 0 -
++R U 1990 1991 - O Sun>=21 0 1 -
++R U 1991 1992 - Mar Sun>=1 0 0 -
++R U 1992 o - O 18 0 1 -
++R U 1993 o - F 28 0 0 -
++R U 2004 o - S 19 0 1 -
++R U 2005 o - Mar 27 2 0 -
++R U 2005 o - O 9 2 1 -
++R U 2006 2015 - Mar Sun>=8 2 0 -
++R U 2006 2014 - O Sun>=1 2 1 -
+ Z America/Montevideo -3:44:51 - LMT 1908 Jun 10
+ -3:44:51 - MMT 1920 May
+ -4 - -04 1923 O
+--3:30 A! -0330/-03 1942 D 14
+--3 A! -03/-0230 1960
+--3 A! -03/-02 1968
+--3 A! -03/-0230 1970
+--3 A! -03/-02 1974
+--3 A! -03/-0130 1974 Mar 10
+--3 A! -03/-0230 1974 D 22
+--3 A! -03/-02
++-3:30 U -0330/-03 1942 D 14
++-3 U -03/-0230 1960
++-3 U -03/-02 1968
++-3 U -03/-0230 1970
++-3 U -03/-02 1974
++-3 U -03/-0130 1974 Mar 10
++-3 U -03/-0230 1974 D 22
++-3 U -03/-02
+ Z America/Caracas -4:27:44 - LMT 1890
+ -4:27:40 - CMT 1912 F 12
+ -4:30 - -0430 1965
+diff --git a/src/timezone/known_abbrevs.txt b/src/timezone/known_abbrevs.txt
+index 67d2f0b..2ae443a 100644
+--- a/src/timezone/known_abbrevs.txt
++++ b/src/timezone/known_abbrevs.txt
+@@ -92,6 +92,7 @@ NZST	43200
+ PDT	-25200	D
+ PKT	18000
+ PST	-28800
++PST	28800
+ SAST	7200
+ SST	-39600
+ UCT	0
+diff --git a/src/timezone/tznames/America.txt b/src/timezone/tznames/America.txt
+index 1c5eb1f..2594c37 100644
+--- a/src/timezone/tznames/America.txt
++++ b/src/timezone/tznames/America.txt
+@@ -237,6 +237,9 @@ PDT    -25200 D  # Pacific Daylight Time
+ PET    -18000    # Peru Time (obsolete)
+ PMDT    -7200 D  # Pierre & Miquelon Daylight Time (obsolete)
+ PMST   -10800    # Pierre & Miquelon Standard Time (obsolete)
++# CONFLICT! PST is not unique
++# Other timezones:
++#  - PST: Philippine Standard Time
+ PST    -28800    # Pacific Standard Time
+                  #     (America/Dawson)
+                  #     (America/Los_Angeles)
+diff --git a/src/timezone/tznames/Asia.txt b/src/timezone/tznames/Asia.txt
+index e1fa931..1133339 100644
+--- a/src/timezone/tznames/Asia.txt
++++ b/src/timezone/tznames/Asia.txt
+@@ -158,6 +158,10 @@ PKT     18000    # Pakistan Time
+                  #     (Asia/Karachi)
+ PKST    21600 D  # Pakistan Summer Time
+                  #     (Asia/Karachi)
++# CONFLICT! PST is not unique
++# Other timezones:
++#  - PST: Pacific Standard Time (America)
++PST     28800    # Philippine Standard Time
+ QYZT    21600    # Kizilorda Time (obsolete)
+ SAKST   Asia/Sakhalin  # Sakhalin Summer Time (obsolete)
+ SAKT    Asia/Sakhalin  # Sakhalin Time (obsolete)
+diff --git a/src/timezone/tznames/Default b/src/timezone/tznames/Default
+index 3826096..1532413 100644
+--- a/src/timezone/tznames/Default
++++ b/src/timezone/tznames/Default
+@@ -181,6 +181,9 @@ PDT    -25200 D  # Pacific Daylight Time
+                  #     (America/Whitehorse)
+ PMDT    -7200 D  # Pierre & Miquelon Daylight Time (obsolete)
+ PMST   -10800    # Pierre & Miquelon Standard Time (obsolete)
++# CONFLICT! PST is not unique
++# Other timezones:
++#  - PST: Philippine Standard Time
+ PST    -28800    # Pacific Standard Time
+                  #     (America/Dawson)
+                  #     (America/Los_Angeles)
+diff --git a/src/timezone/tznames/Pacific.txt b/src/timezone/tznames/Pacific.txt
+index c86248b..c30008c 100644
+--- a/src/timezone/tznames/Pacific.txt
++++ b/src/timezone/tznames/Pacific.txt
+@@ -52,6 +52,9 @@ NZST    43200    # New Zealand Standard Time
+ PGT     36000    # Papua New Guinea Time (obsolete)
+ PHOT    Pacific/Enderbury  # Phoenix Islands Time (Kiribati) (obsolete)
+ PONT    39600    # Ponape Time (Micronesia) (obsolete)
++# CONFLICT! PST is not unique
++# Other timezones:
++#  - PST: Philippine Standard Time
+ PST    -28800    # Pacific Standard Time
+                  #     (America/Dawson)
+                  #     (America/Los_Angeles)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
index acd3d85..1a02f15 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
 
 SRC_URI += "\
     file://not-check-libperl.patch \
+    file://0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch \
+    file://0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch \
 "
 
 SRC_URI[md5sum] = "a5fe5fdff2d6c28f65601398be0950df"
-- 
2.7.4



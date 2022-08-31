Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F56C0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 05:41:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.22142.1661924505250613616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JBKqAybZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id jm11so13154303plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2Xb+97G3XMcYHjjlH0m9eaITWd9lGGd4H1EFvwOGpyc=;
        b=JBKqAybZkDtE9IxhAfAVvKzuPVJHWJAyHbk6ycb1B7QBipjyBQH03gtdkU0LnEpFCj
         YoFULqWEAXiF5P9ln1eL6r1VvN9IB2z50Z/AY2QSzMvvPMkSn5R0jGawi7Zbjd4VoKiv
         axQYOpIe0KrCg6hFctr+h12EzC5vKePbTuuJVQQyHAiY9rWN8s+0mSEFTPyDhCIePc5r
         2ANtTbqS+r1vQBq2t+kwfeS5ZUAKuI9eGJKrwQzhxGjjWJkro9cTRLjiPujm4I9rZUAZ
         WyVyWLWtzvXvRB6uIOehV7/fNFGMQQ33RIfr7dq4Gc/6jDNyFYRDR0gktUndq2NPkyIV
         69xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2Xb+97G3XMcYHjjlH0m9eaITWd9lGGd4H1EFvwOGpyc=;
        b=s/myl6/5rswOqwiOmqlviy53pcC2u38WiSB3jTL6OA0P9WRM/dv06LqyD86yQd9Sz7
         8gfjgh38Z83wGxqf2T6CNbAE2xyX2Dr41zCgY/SdFKvY9p81z9tvEg3F6Hx6u+KXGCZE
         J9fUHDxP/oYTEi6njOKw5OQwegcenUpQkFU+35OyPbYPpQbn7SZDUs3rPhHil0LLagoH
         i0bdQY9v0C59Hic5NAwsBZ8hJkKXvT8pMaWV+isxjjxDBmr1UTYNLzeuXUNWrAljw0DE
         xq5LNZ4DR9aA+IHgyZr/OWvAL5Js2oe8i9rZeK/Mw03aAWdyEHlAnpxQq+HApNNOKY7W
         i94Q==
X-Gm-Message-State: ACgBeo0wPBew8v1TnZxZglQkjBS/NDZpgOPaHNDNrRLLyEnGUtMpO0WP
	qHWRXNE8kAjnqniD15Ce+bnoUukX31c9Ng==
X-Google-Smtp-Source: 
 AA6agR51JyLFd/2SgdCB2e/0X1h+L30dfnBXjf9WBzyG1CIqStfQjuZjYem95emnRTzMN3jh4pHkgQ==
X-Received: by 2002:a17:903:2003:b0:175:24eb:62b0 with SMTP id
 s3-20020a170903200300b0017524eb62b0mr5454704pla.60.1661924504198;
        Tue, 30 Aug 2022 22:41:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e80400b001733c13cc81sm7275181plg.169.2022.08.30.22.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:41:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] psqlodbc: Upgrade to 13.02.0000
Date: Tue, 30 Aug 2022 22:41:36 -0700
Message-Id: <20220831054139.3493726-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831054139.3493726-1-raj.khem@gmail.com>
References: <20220831054139.3493726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 05:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98571

Forward port patches
Merged .inc into .bb for easing out devtool use

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...qlodbc-donot-use-the-hardcode-libdir.patch | 17 ++++---
 .../psqlodbc-fix-for-ptest-support.patch      | 51 ++++++-------------
 ...move-some-checks-for-cross-compiling.patch | 42 ++++++++++-----
 .../psqlodbc/psqlodbc_09.05.0300.bb           | 14 -----
 .../{psqlodbc.inc => psqlodbc_13.02.0000.bb}  | 16 +++++-
 5 files changed, 68 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc.inc => psqlodbc_13.02.0000.bb} (77%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
index 7eda038756..acfaa3f6be 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
@@ -1,26 +1,27 @@
-[PATCH] do not use the hardcode libdir
+From 8f3ed8df4721991958a5becf75a69493d67e7514 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Tue, 5 Sep 2017 10:24:10 +0800
+Subject: [PATCH] [PATCH] do not use the hardcode libdir
 
 Upstream-status: Pending
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9b88d4c..df5ad7a 100644
+index 00b359e..ba50e6f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -140,7 +140,7 @@ if test "$with_libpq" != yes; then
+@@ -114,7 +114,7 @@ if test "$with_libpq" != yes; then
  	if test -d "$with_libpq"; then
- 		PATH="$PATH:$with_libpq/bin"
- 		CPPFLAGS="$CPPFLAGS -I$with_libpq/include"
+ 		PATH="$with_libpq/bin:$PATH"
+ 		CPPFLAGS="$CPPFLAGS -I$with_libpq/include -I$with_libpq/include/postgresql/internal"
 -		LDFLAGS="$LDFLAGS -L$with_libpq/lib"
 +		LDFLAGS="$LDFLAGS -L$with_libpq/${base_libdir}"
  	else
  		if test -x "$with_libpq"; then
  			PG_CONFIG=$with_libpq
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
index a8f14e7689..30e67b7dfb 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
@@ -1,3 +1,6 @@
+From 96896b88776d0080609ec830cf9538d2babe665a Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 5 Sep 2017 10:24:10 +0800
 Subject: [PATCH] psqlodbc: fixes for ptest support
 
 * Fix the LIBODBC since we don't use ODBC_CONFIG.
@@ -9,27 +12,28 @@ Subject: [PATCH] psqlodbc: fixes for ptest support
 Upstream-Status: Inappropriate [OE ptest specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  test/Makefile.in    |  2 +-
  test/odbcini-gen.sh |  8 ++++----
- test/runsuite.c     | 26 +++++++++++++-------------
- 3 files changed, 18 insertions(+), 18 deletions(-)
+ test/runsuite.c     | 20 ++++++++++----------
+ 3 files changed, 15 insertions(+), 15 deletions(-)
 
 diff --git a/test/Makefile.in b/test/Makefile.in
-index 8710616..fcb470e 100644
+index 3f9a9af..09406ae 100644
 --- a/test/Makefile.in
 +++ b/test/Makefile.in
-@@ -18,7 +18,7 @@ CFLAGS = @CFLAGS@
+@@ -19,7 +19,7 @@ CPPFLAGS = @CPPFLAGS@ -I..	# config.h
  ODBC_CONFIG = @ODBC_CONFIG@
  PROVE = @PROVE@
  
--LIBODBC := $(shell $(ODBC_CONFIG) --libs)
+-LIBODBC = @LIBODBC@
 +LIBODBC = -lodbc
  
  all: $(TESTBINS) runsuite reset-db
  
 diff --git a/test/odbcini-gen.sh b/test/odbcini-gen.sh
-index d2c2c87..6068d9d 100755
+index 2eaba35..6555cdb 100755
 --- a/test/odbcini-gen.sh
 +++ b/test/odbcini-gen.sh
 @@ -6,7 +6,7 @@
@@ -41,7 +45,7 @@ index d2c2c87..6068d9d 100755
  driver=${drvr}.so
  if test ! -e $driver ; then
  	driver=${drvr}.dll
-@@ -33,10 +33,10 @@ Driver          = psqlodbc test driver
+@@ -52,10 +52,10 @@ Driver          = PostgreSQL Unicode
  Trace           = No
  TraceFile               =
  Database                = contrib_regression
@@ -56,10 +60,10 @@ index d2c2c87..6068d9d 100755
  RowVersioning           = No
  ShowSystemTables                = No
 diff --git a/test/runsuite.c b/test/runsuite.c
-index 583cf35..fd2a90e 100644
+index 3be5732..cd842dc 100644
 --- a/test/runsuite.c
 +++ b/test/runsuite.c
-@@ -51,7 +51,7 @@ bailout(const char *fmt, ...)
+@@ -55,7 +55,7 @@ bailout(const char *fmt, ...)
  
  /* Given a test program's name, get the test name */
  void
@@ -68,7 +72,7 @@ index 583cf35..fd2a90e 100644
  {
  	const char *basename;
  #ifdef WIN32
-@@ -65,7 +65,7 @@ parse_argument(const char *in, char *testname, char *binname)
+@@ -69,7 +69,7 @@ parse_argument(const char *in, char *testname, char *binname)
  	if (strchr(in, DIR_SEP) == NULL)
  	{
  		strcpy(testname, in);
@@ -77,7 +81,7 @@ index 583cf35..fd2a90e 100644
  		return;
  	}
  
-@@ -127,7 +127,7 @@ int main(int argc, char **argv)
+@@ -131,7 +131,7 @@ int main(int argc, char **argv)
  	failures = 0;
  	for (i = 1, j = 1; i <= numtests; i++, j++)
  	{
@@ -86,7 +90,7 @@ index 583cf35..fd2a90e 100644
  		if (runtest(binname, testname, i, inputdir) != 0)
  			failures++;
  	}
-@@ -157,29 +157,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
+@@ -161,29 +161,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
  #ifndef WIN32
  	snprintf(cmdline, sizeof(cmdline),
  			 "ODBCSYSINI=. ODBCINSTINI=./odbcinst.ini ODBCINI=./odbc.ini "
@@ -123,26 +127,3 @@ index 583cf35..fd2a90e 100644
  		ret = 0;
  	}
  	fflush(stdout);
-@@ -196,7 +196,7 @@ rundiff(const char *testname, const char *inputdir)
- 	char	   *result;
- 	size_t		result_len;
- 
--	snprintf(filename, sizeof(filename), "results/%s.out", testname);
-+	snprintf(filename, sizeof(filename), "%s/results/%s.out", inputdir, testname);
- 	result = slurpfile(filename, &result_len);
- 
- 	outputno = 0;
-@@ -244,8 +244,8 @@ rundiff(const char *testname, const char *inputdir)
- 	 * files and print the smallest diff?
- 	 */
- 	snprintf(cmdline, sizeof(cmdline),
--			 "diff -c %s/expected/%s.out results/%s.out >> regression.diffs",
--			 inputdir, testname, testname);
-+			 "diff -c %s/expected/%s.out %s/results/%s.out >> regression.diffs",
-+			 inputdir, testname, inputdir, testname);
- 	if (system(cmdline) == -1)
- 		printf("# diff failed\n");
- 
--- 
-2.8.2
-
diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
index 1d988182e7..9131d70be6 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
@@ -1,3 +1,6 @@
+From 8ca6b0c72b6b933642ec7c4ebb83734244fec46f Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Tue, 5 Sep 2017 10:24:10 +0800
 Subject: [PATCH] remove some checks for cross-compiling
 
 some lib check is not suitable for
@@ -8,15 +11,16 @@ Upstream-Status: Inappropriate [not a real bug,just for cross-compiling]
 Signed-off-by: Song.Li <Song.Li@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
- configure.ac | 66 +++++++-----------------------------------------------------
- 1 file changed, 7 insertions(+), 59 deletions(-)
+ configure.ac | 80 +++++-----------------------------------------------
+ 1 file changed, 7 insertions(+), 73 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index df5ad7a..b72bd4c 100644
+index 7f79563..00b359e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -46,57 +46,19 @@ AC_ARG_WITH(iodbc, [  --with-iodbc[[=DIR]]	  [[default=no]] DIR is the iODBC bas
+@@ -57,71 +57,20 @@ AC_ARG_WITH(iodbc, [  --with-iodbc[[=DIR]]	  [[default=no]] DIR is the iODBC bas
  if test "$with_iodbc" != no; then
  	with_unixodbc=no
  	AC_DEFINE(WITH_IODBC, 1, [Define to 1 to build with iODBC support])
@@ -34,6 +38,7 @@ index df5ad7a..b72bd4c 100644
 -	fi
  fi
  
+ wo_odbc_config=__without_odbc_config
  if test "$with_unixodbc" != no; then
  	AC_DEFINE(WITH_UNIXODBC, 1,
              [Define to 1 to build with unixODBC support])
@@ -42,7 +47,9 @@ index df5ad7a..b72bd4c 100644
 -	else
 -		ODBC_CONFIG=$with_unixodbc
 -	fi
--	if test ! -x "${ODBC_CONFIG}/bin/odbc_config"; then
+-	if test "${ODBC_CONFIG}" = "${wo_odbc_config}"; then
+-		:
+-	elif test ! -x "${ODBC_CONFIG}/bin/odbc_config"; then
 -		if test ! -x "${ODBC_CONFIG}"; then
 -			AC_MSG_ERROR([odbc_config not found (required for unixODBC build)])
 -		fi
@@ -62,22 +69,33 @@ index df5ad7a..b72bd4c 100644
 -		# Linking libiodoc is rather problematic
 -		[ODBC_LIBDIR=`${ODBC_CONFIG} --libs | sed -e "s/^\(-L\|.*[ \t]-L\)\([^ \n\r\f\t]*\).*$/-L\2/"`]
 -		LDFLAGS="$LDFLAGS ${ODBC_LIBDIR}"
+-		LIBODBC=`${ODBC_CONFIG} --libs`	# for regression test
+-	elif test "${ODBC_CONFIG}" = "${wo_odbc_config}"; then
+-		ODBC_INCLUDE=/usr/include
+-		CPPFLAGS="$CPPFLAGS -I${ODBC_INCLUDE}"
+-		ODBC_LIBDiR=""
+-		LIBODBC="-lodbc"	# for regression test
 -	else
 -		ODBC_INCLUDE=`${ODBC_CONFIG} --include-prefix`
 -		CPPFLAGS="$CPPFLAGS -I${ODBC_INCLUDE}"
--		# Linking libodoc is rather problematic
+-		# Linking libodbc is rather problematic
 -		ODBC_LIBDIR=`${ODBC_CONFIG} --lib-prefix`
--		LDFLAGS="$LDFLAGS -L${ODBC_LIBDIR}"
+-		if test "${ODBC_LIBDIR}" != ""; then
+-			LDFLAGS="$LDFLAGS -L${ODBC_LIBDIR}"
+-		fi
+-		LIBODBC=`${ODBC_CONFIG} --libs`	# for regression test
 -	fi
 -	AC_MSG_NOTICE([using $ODBC_INCLUDE $ODBC_LIBDIR])
+-	AC_MSG_NOTICE([using $LIBODBC for regression test])
 -fi
+-AC_SUBST(LIBODBC)
 +ODBC_LIBS="-lodbcinst"
 +LIBS="$LIBS ${ODBC_LIBS}"
 +AC_MSG_NOTICE([using $ODBC_INCLUDE $ODBC_LIBS])
  
  #
  # SQLCOLATTRIBUTE_SQLLEN check
-@@ -176,18 +138,10 @@ PGAC_ARG_BOOL(enable, pthreads, yes,
+@@ -190,19 +139,10 @@ PGAC_ARG_BOOL(enable, pthreads, yes,
  # Find libpq headers and libraries
  #
  
@@ -87,8 +105,9 @@ index df5ad7a..b72bd4c 100644
 -
 -if test -n "$PG_CONFIG"; then
 -  pg_includedir=`"$PG_CONFIG" --includedir`
+-  pg_pkg_includedir=`"$PG_CONFIG" --pkgincludedir`
 -  pg_libdir=`"$PG_CONFIG" --libdir`
--  CPPFLAGS="$CPPFLAGS -I$pg_includedir"
+-  CPPFLAGS="$CPPFLAGS -I$pg_includedir -I$pg_pkg_includedir/internal"
 -  LDFLAGS="$LDFLAGS -L$pg_libdir"
 -fi
 -
@@ -100,7 +119,7 @@ index df5ad7a..b72bd4c 100644
  
  # 1. Programs
  
-@@ -211,12 +165,6 @@ if test "$with_iodbc" != no; then
+@@ -226,12 +166,6 @@ if test "$with_iodbc" != no; then
                   [AC_MSG_ERROR([iODBC library "iodbcinst" not found])])
  fi
  
@@ -113,6 +132,3 @@ index df5ad7a..b72bd4c 100644
  AC_CHECK_LIB(pq, PQsetSingleRowMode, [],
  	      [AC_MSG_ERROR([libpq library version >= 9.2 is required])])
  
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
deleted file mode 100644
index b0fc35eb97..0000000000
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${PN}.inc
-
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
-
-SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
-    file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
-    file://psqlodbc-donot-use-the-hardcode-libdir.patch \
-    file://psqlodbc-fix-for-ptest-support.patch \
-    file://run-ptest \
-"
-
-SRC_URI[md5sum] = "4c6e0b22187d7bb1c998ffac89e50f6b"
-SRC_URI[sha256sum] = "9521f328bf28aaaf5c8488dc89792b614f9d6271742c0baf9bb41c97537764a8"
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc.inc b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
similarity index 77%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc.inc
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
index ae20a72a11..299abee000 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc.inc
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
@@ -16,6 +16,18 @@ DESCRIPTION = "\
 SECTION = "libs"
 HOMEPAGE = "http://psqlodbc.projects.postgresql.org/"
 
+LICENSE = "LGPL-2.0-only"
+LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
+
+SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
+    file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
+    file://psqlodbc-donot-use-the-hardcode-libdir.patch \
+    file://psqlodbc-fix-for-ptest-support.patch \
+    file://run-ptest \
+"
+
+SRC_URI[sha256sum] = "b39b7e5c41fd6475c551112fa724bf57c4a446175ec4188a90e2844cc1612585"
+
 DEPENDS += "postgresql unixodbc"
 
 EXTRA_OECONF = "\
@@ -24,8 +36,7 @@ EXTRA_OECONF = "\
     --with-unixodbc=yes \
     --with-libpq=${STAGING_LIBDIR}/.. \
     --enable-pthreads \
-    --disable-unicode \
-    LIBS="-lpthread" \
+    LIBS='-lpthread' \
 "
 
 inherit autotools pkgconfig ptest
@@ -48,3 +59,4 @@ FILES:${PN} += "${libdir}"
 
 # The tests need a local PostgreSQL server running
 RDEPENDS:${PN}-ptest = "postgresql"
+
-- 
2.37.3



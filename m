Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453C2C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24398.1786747624790543468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s5+o22mc;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso1004403a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747624; x=1787352424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btv0bWUBO/Qnsquo4KHFoQqKKf9wqB9huR0sw04z2BQ=;
        b=s5+o22mcoMXxuPezQeVg7KyLTVgVSXtbyONZLmTzWnoZoqaiLSJnxmvQgBJ+x4zORi
         xUTOS45tqunjIEi88KrSAsj3bvLMZy2DrhQ/UbosW1EWIfp9J1wCRnECcNyrohY59LuV
         aorRnYVKzdL33r4C4z8hdfFqVVIzO7ppxmtdn/ozBvUWw5b3lCyfyaqg89VEG1p52The
         LFwI2MwvqhiJSxM3G/PnNtxI11+DelKmF4bvr3G1OZW7nGqeGrGAtLQvWiumhGabqL0L
         M8qLPq6LeF8r04Mi/gO/LENmsoa4IT/q7DWuNOOp7XR28gQR5OkpjZbTTdqqDMnDV1ev
         g9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747624; x=1787352424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=btv0bWUBO/Qnsquo4KHFoQqKKf9wqB9huR0sw04z2BQ=;
        b=ieXxsTmdAmQBBKDkrcVG3E/62Of+hlVQZURrc8tSZvCttfQoW4qW74nynxXamlIfHD
         ixcYUR7MV28/Vk+OSg7FMeRE9Pn+quGJ3Mssrqbpjy8AkgCmeBRUIPSFHF17EHShAR9W
         eucq7xJsPTx6FTY0dPdhfbtEN/PxEWiPrg4JMQvF9tsvmyF9GPnqcUXksdSYEcRbp/GT
         C7UmywpjHNPn7UpvlGosYI5AJpFBW9UlmZux+cUIorqOrv8Q9k35d6IgGhA2gzUKyRqx
         7W8aHjxXxKTSKtA9cH1Hlf+fZ2iwfWgsK52Cg//ba2II5DsmRQFZIbL77/toGhHFWiHv
         qw9A==
X-Gm-Message-State: AOJu0Yx3H9PnZ0tz+89g1hJkI5VJLR9OX2CEZmP++ggir/bbju/QVkSa
	5Tod1OExZsn9qWiN9hjmLb4O18YrD9fK+76GkgBglURF9zZ9tom0yWkQQAnhK4BU
X-Gm-Gg: AR+sD10E19ujxwVQS/D5MQHsllNLyabMpk8FhmgKBgMCObrwy/MMy86iLAU5SyKfmdG
	JpN69CA6TX3JJOSoEZe5WRkbl+mHluC402R1vrj/ZGysta+3Uy0RA43brnDGRtDSzi2eDSJuCbk
	SMKXn+E6R41rUSWLfMRfwRVLTB6r12vL4veEMkkDMJeKZcKTtc9+cfVbFdHClgu+u3MtTPG2rdK
	Ktd3OHE9lZSVe07C8j0G1OVw0iFEZpL7QCfz2A96/QGcT260xI7fRBckTP4aAUYn89X+YIoa8uu
	YbYziSyjZtKJXsrduiPC9Md8ia66XZ0T5tOZ8DOgnSdUC/1CzJtrfzKqAkwSQ0KOXPL5JKKpEWN
	peEEDaApDgkNVCF+JyW31ookgoB3mpLDEuE7VDilkLMEeGMjtnfPkMWHlfaGTXEfRQIwsz2AphB
	klmO6wRlivp5/uGl0zbNzDHPgiMiXAAWt0jl3uQgl6sTaqTQ2+l5EQUYixOjN8ItOBRZTUzrjkH
	mVuK/P8lZg93K3R1j938kBgvcs52aXjIukuK+vokesXXddFhuqBAeY9kku94wzqLWCju5SUdoMy
	uqr8umxLeAJEQSaI8dYFz241M23nr/egO6uzCIbK+3DhZOd1FXlYFcUksDb2whNKNqGJbsYE+fC
	5MC/QuupmLxYziJONr0V0IF9tjMbaEzHvbPsIwRuWPllQ+w==
X-Received: by 2002:a05:6300:670a:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3cc7199308fmr11476125637.1.1786747624052;
        Fri, 14 Aug 2026 15:47:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 073/109] psqlodbc: upgrade 17.00.0007 -> 18.00.0002
Date: Fri, 14 Aug 2026 15:44:59 -0700
Message-ID: <20260814224539.1523174-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129137

Tracks the postgresql 18 major release this driver targets. Rebased
psqlodbc-fix-for-ptest-support.patch onto 18.00.0002: upstream now generates
a second (ANSI) DSN block alongside the original Unicode one, so the
localhost/postgres/5432 test defaults are applied to both; upstream also
added a server_version parameter to runtest() and native TAP "ok"/"not ok"
progress lines, neither of which this patch touches -- it continues to
reformat the final per-test line to PASS:/FAIL:, which is what
ptest-runner's log parser matches on.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../psqlodbc-fix-for-ptest-support.patch      | 44 ++++++++++++++-----
 ...c_17.00.0007.bb => psqlodbc_18.00.0002.bb} |  2 +-
 2 files changed, 33 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_17.00.0007.bb => psqlodbc_18.00.0002.bb} (97%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
index a1f60b2692..140342d5ef 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
@@ -9,6 +9,13 @@ Subject: [PATCH] psqlodbc: fixes for ptest support
 * Fix the output format for ptest.
 * Fix the results and exe dir.
 
+Rebased on 18.00.0002: upstream now generates a second (ANSI) DSN block
+alongside the original Unicode one, so the localhost/postgres/5432 defaults
+are applied to both; upstream also added a server_version parameter to
+runtest() and native TAP "ok"/"not ok" progress lines, neither of which this
+patch touches -- it only continues to reformat the final PASS:/FAIL: lines
+per-test, which is what ptest-runner's log parser matches on.
+
 Upstream-Status: Inappropriate [OE ptest specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
@@ -19,10 +26,9 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  3 files changed, 16 insertions(+), 16 deletions(-)
 
 diff --git a/test/Makefile.in b/test/Makefile.in
-index 3f9a9af..09406ae 100644
 --- a/test/Makefile.in
 +++ b/test/Makefile.in
-@@ -19,7 +19,7 @@ CPPFLAGS = @CPPFLAGS@ -I..	# config.h
+@@ -19,7 +19,7 @@
  ODBC_CONFIG = @ODBC_CONFIG@
  PROVE = @PROVE@
  
@@ -32,7 +38,6 @@ index 3f9a9af..09406ae 100644
  all: $(TESTBINS) runsuite reset-db
  
 diff --git a/test/odbcini-gen.sh b/test/odbcini-gen.sh
-index 2eaba35..d7c03ba 100755
 --- a/test/odbcini-gen.sh
 +++ b/test/odbcini-gen.sh
 @@ -6,7 +6,7 @@
@@ -44,7 +49,7 @@ index 2eaba35..d7c03ba 100755
  driver=${drvr}.so
  if test ! -e $driver ; then
  	driver=${drvr}.dll
-@@ -16,7 +16,7 @@ if test ! -e $driver ; then
+@@ -16,7 +16,7 @@
  	fi
  fi
  
@@ -53,7 +58,21 @@ index 2eaba35..d7c03ba 100755
  drivera=${drvra}.so
  if test ! -e $drivera ; then
  	drivera=${drvra}.dll
-@@ -52,10 +52,10 @@ Driver          = PostgreSQL Unicode
+@@ -52,10 +52,10 @@
+ Trace           = No
+ TraceFile               =
+ Database                = contrib_regression
+-Servername              =
+-Username                =
++Servername              = localhost
++Username                = postgres
+ Password                =
+-Port                    =
++Port                    = 5432
+ ReadOnly                = No
+ RowVersioning           = No
+ ShowSystemTables                = No
+@@ -78,10 +78,10 @@
  Trace           = No
  TraceFile               =
  Database                = contrib_regression
@@ -68,10 +87,9 @@ index 2eaba35..d7c03ba 100755
  RowVersioning           = No
  ShowSystemTables                = No
 diff --git a/test/runsuite.c b/test/runsuite.c
-index 6ac3709..023ac1d 100644
 --- a/test/runsuite.c
 +++ b/test/runsuite.c
-@@ -55,7 +55,7 @@ bailout(const char *fmt, ...)
+@@ -55,7 +55,7 @@
  
  /* Given a test program's name, get the test name */
  void
@@ -80,7 +98,7 @@ index 6ac3709..023ac1d 100644
  {
  	const char *basename;
  #ifdef WIN32
-@@ -69,7 +69,7 @@ parse_argument(const char *in, char *testname, char *binname)
+@@ -69,7 +69,7 @@
  	if (strchr(in, DIR_SEP) == NULL)
  	{
  		strcpy(testname, in);
@@ -89,16 +107,16 @@ index 6ac3709..023ac1d 100644
  		return;
  	}
  
-@@ -131,7 +131,7 @@ int main(int argc, char **argv)
+@@ -139,7 +139,7 @@
  	failures = 0;
  	for (i = 1, j = 1; i <= numtests; i++, j++)
  	{
 -		parse_argument(argv[j], testname, binname);
 +		parse_argument(argv[j], testname, binname, inputdir);
- 		if (runtest(binname, testname, i, inputdir) != 0)
+ 		if (runtest(binname, testname, i, inputdir, server_version) != 0)
  			failures++;
  	}
-@@ -161,29 +161,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
+@@ -169,29 +169,29 @@
  #ifndef WIN32
  	snprintf(cmdline, sizeof(cmdline),
  			 "ODBCSYSINI=. ODBCINSTINI=./odbcinst.ini ODBCINI=./odbc.ini "
@@ -115,7 +133,7 @@ index 6ac3709..023ac1d 100644
  #endif
  	rc = system(cmdline);
  
- 	diff = rundiff(testname, inputdir);
+ 	diff = rundiff(testname, inputdir, server_version);
  	if (rc != 0)
  	{
 -		printf("not ok %d - %s test returned %d\n", testno, testname, rc);
@@ -135,3 +153,5 @@ index 6ac3709..023ac1d 100644
  		ret = 0;
  	}
  	fflush(stdout);
+--
+2.43.0
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
similarity index 97%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
index 92ee2594f9..ae1d603e1d 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
            file://run-ptest \
            "
 
-SRCREV = "8038cee43d6dff468320008ea928f3eaa1186726"
+SRCREV = "95b35ac7cb2c9ea9df087fda08a695d89b8f8134"
 PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
 
 DEPENDS += "postgresql unixodbc"


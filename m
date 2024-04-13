Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7032FC4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 06:07:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5643.1712988420755119299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 23:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mx4TYT2A;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e40042c13eso11619805ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 23:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712988420; x=1713593220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkVBa9ujnufDfg3/RcvOJsfBS9sip+Qmj7Hj3qkxgag=;
        b=mx4TYT2APYQL/DlFPPCuWWuEC4Ip+I+dAK2/+2qseYlaz3PJqNiZMdVutDeWGEElpv
         0RwvzkW8qAHHnY2TSfIoh4oX/zLdMvAM5QwRyxyYZO6ZQDxJQc8Fw8C2mMhDWkjhDdSj
         QvChp7AqWbH79qH50ci9gpYXHmMlPB+0yfiQ0RhxE8afJemsEwYfuc1sZLBz3hzCbade
         ojiCnbwqd2JOf0ilDwajGuiKTr9q8hrEs3SzaYBHuzzpKiWhXaLgs8G8KC1Wg5HDCvbF
         1gNg8CMZ9NoVQWWitmSL25TZjvw5pFavbJvRvUvl0ehQDig59aaSH5oPZnOhUXSEuLWn
         vhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712988420; x=1713593220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkVBa9ujnufDfg3/RcvOJsfBS9sip+Qmj7Hj3qkxgag=;
        b=ZriGVztzjpux6HtNKhEDvdS47Bp1sH4hCOAjks0kDV02EnfaR83XnUYG/KmEeyKWlb
         LZkReifNh4kLSnFYTTIMhP1n5wYeYPlfkRXvCwJV95B77EX9ObVNoLK9o54Od5UnzNFI
         +AOYrn5njKAcmwDaMudYpJBx22ivO+GebFnYVp5PGovdvjOjh5PIsFbfxUGhHci04e6v
         Fc8o8X0gWmcwT2WjeayAvVpfAct7qWIuakJaQT4NeMnNNf2BBsG5LIRVCeXbTUfl3wEc
         3/10dreKTYfvxQzaTJJfOXSpROyA3r7hg7rpjcZ0CmfJV3Z1Mq1zv45glgAhkX/LSpDV
         xpxA==
X-Gm-Message-State: AOJu0YxyZCCzAL8LIl1SsPmbMB41PqEdCgC0/s2sLfzEiQMsUwheIP+2
	Grk+L6E+t0ajCD8HMBXhNLtXRcqIs0U5tuo6TeeHuGhZ0oyDaNpepB4u69Lt
X-Google-Smtp-Source: AGHT+IH0cXOs8oKaR6BWSPP844KK7wkfNYDHJAEYf8C5Byx1nTx5NRlzylilMSboXoPdFjjlcxIhLQ==
X-Received: by 2002:a17:903:2b0c:b0:1e4:196b:bb77 with SMTP id mc12-20020a1709032b0c00b001e4196bbb77mr4741061plb.69.1712988419670;
        Fri, 12 Apr 2024 23:06:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001e49428f313sm3953366plb.261.2024.04.12.23.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 23:06:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] psqlodbc: Fix ptests
Date: Fri, 12 Apr 2024 23:06:53 -0700
Message-ID: <20240413060653.2147909-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240413060653.2147909-1-raj.khem@gmail.com>
References: <20240413060653.2147909-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Apr 2024 06:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109948

There are two still left
Failed ptests:
{'psqlodbc': ['30_-_lfconversion', '43_-_result-conversions']}

These need using unicode postgresql driver perhaps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../psqlodbc-fix-for-ptest-support.patch      | 19 +++++++++++--------
 .../psqlodbc/psqlodbc_16.00.0000.bb           |  4 ++--
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
index 30e67b7dfb..081c6d0fd0 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
@@ -19,8 +19,6 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  test/runsuite.c     | 20 ++++++++++----------
  3 files changed, 15 insertions(+), 15 deletions(-)
 
-diff --git a/test/Makefile.in b/test/Makefile.in
-index 3f9a9af..09406ae 100644
 --- a/test/Makefile.in
 +++ b/test/Makefile.in
 @@ -19,7 +19,7 @@ CPPFLAGS = @CPPFLAGS@ -I..	# config.h
@@ -32,8 +30,6 @@ index 3f9a9af..09406ae 100644
  
  all: $(TESTBINS) runsuite reset-db
  
-diff --git a/test/odbcini-gen.sh b/test/odbcini-gen.sh
-index 2eaba35..6555cdb 100755
 --- a/test/odbcini-gen.sh
 +++ b/test/odbcini-gen.sh
 @@ -6,7 +6,7 @@
@@ -45,6 +41,15 @@ index 2eaba35..6555cdb 100755
  driver=${drvr}.so
  if test ! -e $driver ; then
  	driver=${drvr}.dll
+@@ -16,7 +16,7 @@ if test ! -e $driver ; then
+ 	fi
+ fi
+ 
+-drvra=../.libs/psqlodbca
++drvra=@LIBDIR@/psqlodbca
+ drivera=${drvra}.so
+ if test ! -e $drivera ; then
+ 	drivera=${drvra}.dll
 @@ -52,10 +52,10 @@ Driver          = PostgreSQL Unicode
  Trace           = No
  TraceFile               =
@@ -59,8 +64,6 @@ index 2eaba35..6555cdb 100755
  ReadOnly                = No
  RowVersioning           = No
  ShowSystemTables                = No
-diff --git a/test/runsuite.c b/test/runsuite.c
-index 3be5732..cd842dc 100644
 --- a/test/runsuite.c
 +++ b/test/runsuite.c
 @@ -55,7 +55,7 @@ bailout(const char *fmt, ...)
@@ -72,7 +75,7 @@ index 3be5732..cd842dc 100644
  {
  	const char *basename;
  #ifdef WIN32
-@@ -69,7 +69,7 @@ parse_argument(const char *in, char *testname, char *binname)
+@@ -69,7 +69,7 @@ parse_argument(const char *in, char *tes
  	if (strchr(in, DIR_SEP) == NULL)
  	{
  		strcpy(testname, in);
@@ -90,7 +93,7 @@ index 3be5732..cd842dc 100644
  		if (runtest(binname, testname, i, inputdir) != 0)
  			failures++;
  	}
-@@ -161,29 +161,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
+@@ -161,29 +161,29 @@ runtest(const char *binname, const char
  #ifndef WIN32
  	snprintf(cmdline, sizeof(cmdline),
  			 "ODBCSYSINI=. ODBCINSTINI=./odbcinst.ini ODBCINI=./odbc.ini "
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
index 97333f679d..a1ef8e75e9 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
@@ -58,5 +58,5 @@ do_install_ptest() {
 FILES:${PN} += "${libdir}"
 
 # The tests need a local PostgreSQL server running
-RDEPENDS:${PN}-ptest = "postgresql"
-
+RDEPENDS:${PN}-ptest += "psqlodbc postgresql diffutils"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils locale-base-en-us glibc-gconv glibc-charmaps"
-- 
2.44.0



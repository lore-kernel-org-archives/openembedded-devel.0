Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2AECD5BAC
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 12:39:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7287.1779539958547443871
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 05:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NZRt36Db;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b4650d5f5cso33847195ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779539958; x=1780144758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VAzqu7ECC86brspISSQjcsJ6gLkFkoKBy7gLMBzzrb8=;
        b=NZRt36Db2ylB8Jjl53UJ+cUP0j0Bu5gJPnqxmwTbFTEcv4PX5r170DCfBoAYJSwzXV
         yNc/IniJm41SfANut5O5APcyaC9StKD2ZJC3rebjehjO8kGYGwKPb1QZ2I+JMtIQjK2w
         pXGT2lfvmAQEJTdl9yOKNbEpWKn+nrHeFEZvUITrVOq3BV6BQYOV8T4ymYBBmhQassOF
         fSuaG21Gq8aUFu1QyWd3Mg5lfImdqLQKb8+sFcRW3NIsu5pu9B06Ie+8bfK6HppGdlkW
         aTCBxxYP//65mNlxVDfeCsT7TTF7D4EjdOYFp7FC54Fyc8qSH3ENw5WksQzPES4qvAgj
         R17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779539958; x=1780144758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAzqu7ECC86brspISSQjcsJ6gLkFkoKBy7gLMBzzrb8=;
        b=BYS3xFPft+qccYS1SiP4fzGQaGJsTBFrt3UziKaodm8SGEhGkqb+9Bo3Kvx5EuD6fb
         E5ew9TYyQOhJ6HiNsYR6OFzxFm9fNg79e/pVpdg+EJR2bM2flOwuuRnQ1GwTGrMrHVAE
         D4wCmK2LSZqb9W/ZMN6xsRlHlM2BWq02R/r/xQthJXyNA9uOkGthW8z9SmcGQQPhbPln
         3f40ujm5+AcBKmHKaMKzBusCtZNqioBqpLQkNsISuYie7ZrqyQcdqUP6r2bwYO5grucH
         3oDhn2NS4fM+XbqiGEhD9l+yP4mZYQwwBeMoElWKjpcbk81c5tlW1rqt6Q0rsjHq2nZA
         NvVQ==
X-Gm-Message-State: AOJu0YwcdGKHS9IkR8A2OQefbmXDFRcCGGjpD9fSdvWCsV3bLiKxtmXU
	MxS24is3cx0bAAb4Z+XWG785mG7tubGBONnzRdUQTjxI331bHsMDoMnH9Rbjl2DV
X-Gm-Gg: Acq92OHY/V7lvwKGrGnk57vJdf4hX+3G9gBeuJ7I7RrEnHrvsKxpsZG3M34eJkTgwpB
	qk9gizcYQm0NS0F3xqz4Rh/8B0TdyCCweE7PCQ2DxqcGXrE6koCi3laDhu9qbwCw9dfS/Ofg6SQ
	dxMIz0eGuZ1XzBMKQnRcaJgCH9ZzcK57lwAWNO0AW60Iqxss1A3RPvcmGtARfBQIDcyr4BPTDJH
	GpXWmy3GoBGCFQPSZ7g4xP51yq8mHuhJu/x+/9o1f70o5O3FICEhwNyY9Gjnc8O5R8vU4Es6RwB
	il7Yn5fA9xUPJ+xSWghalUpfoWYIAaEznEP1ZatPH+Zwtt6SuddjXhiFegOcWirrmHD2A7pHUFy
	8eurDpDjzgRNLIHsFlWbbvNWdKOOrGpIlpPxsSsQ79ty/00J7cZQg4tbGh28Xla7JHTOZvieaaL
	tZEYUKpi9VrnEuLLzs1B184WnYCU6SVxe1SvP8kIOlgFragQU=
X-Received: by 2002:a17:903:24c:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2beb06c45e1mr74500155ad.41.1779539957685;
        Sat, 23 May 2026 05:39:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3058sm46152515ad.39.2026.05.23.05.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:39:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/3] postgresql: upgrade 16.12 -> 16.14
Date: Sun, 24 May 2026 00:39:03 +1200
Message-ID: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 12:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127176

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also refreshed patches to resolve patch fuzz QA issue.

Bug fix releases
https://www.postgresql.org/docs/release/16.13/
https://www.postgresql.org/docs/release/16.14/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../files/0001-Add-support-for-RISC-V.patch           |  7 ++-----
 .../files/0002-Improve-reproducibility.patch          |  7 ++-----
 ...figure.ac-bypass-autoconf-2.69-version-check.patch | 11 ++++-------
 .../0004-config_info.c-not-expose-build-info.patch    |  9 +++------
 ...005-postgresql-fix-ptest-failure-of-sysviews.patch |  7 ++-----
 .../postgresql/files/not-check-libperl.patch          |  9 +++------
 .../{postgresql_16.12.bb => postgresql_16.14.bb}      |  2 +-
 7 files changed, 17 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.12.bb => postgresql_16.14.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index ebd3e03685..466206f87d 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -1,7 +1,7 @@
-From ba079b8d6a50796db41bb0ddf4c22bfe022ef898 Mon Sep 17 00:00:00 2001
+From c0f5c3d176baf893658e9534256887633e18e3c4 Mon Sep 17 00:00:00 2001
 From: "Richard W.M. Jones" <rjones@redhat.com>
 Date: Sun, 20 Nov 2016 15:04:52 +0000
-Subject: [PATCH 1/5] Add support for RISC-V.
+Subject: [PATCH] Add support for RISC-V.
 
 The architecture is sufficiently similar to aarch64 that simply
 extending the existing aarch64 macro works.
@@ -38,6 +38,3 @@ index c9fa84c..9b491e8 100644
  
  
  /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
index b3e87cbc46..cce3319caa 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
@@ -1,7 +1,7 @@
-From 084cc44215c1d5e6d33bc3d2e1d24da4fc98bdcd Mon Sep 17 00:00:00 2001
+From 97d56c79bf8807563d58cb08a8c5f3e3422e8740 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 28 Dec 2020 16:38:21 +0800
-Subject: [PATCH 2/5] Improve reproducibility,
+Subject: [PATCH] Improve reproducibility,
 
 Remove build patch from binaries which pg_config do
 not record var-CC, var-CFLAGS, and configure
@@ -36,6 +36,3 @@ index 113029b..58842a6 100644
  override CPPFLAGS += -DVAL_CFLAGS_SL="\"$(CFLAGS_SL)\""
  override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
  override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 64d82e52c6..6c6a2c3323 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,7 +1,7 @@
-From 30b1b37d309f67ba6d58f2197bd917107bc7d56c Mon Sep 17 00:00:00 2001
+From 0a068e697b54037664eb485d1f31342f07caac0b Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
-Subject: [PATCH 3/5] configure.ac: bypass autoconf 2.69 version check
+Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
 
 for upgrade to autoconf 2.71
 
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4f25567..b6b1eff 100644
+index 9e30e42..4a5937f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.12], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.14], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,6 +27,3 @@ index 4f25567..b6b1eff 100644
  AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index ff0582ab80..f75f306b0c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -1,7 +1,7 @@
-From 5be3ffdf767c1efcbfd2d1be87aa83f2e37e348e Mon Sep 17 00:00:00 2001
+From 474b18fefb4adbf394b30529a11348104c077299 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 1 Aug 2022 15:44:38 +0800
-Subject: [PATCH 4/5] config_info.c: not expose build info
+Subject: [PATCH] config_info.c: not expose build info
 
 Don't collect the build information to fix the buildpaths issue.
 
@@ -14,7 +14,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 27f382d..3dd6bb1 100644
+index 4a5937f..ece6463 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Group])
@@ -114,6 +114,3 @@ index 09e78a6..86e4230 100644
  	configdata[i].name = pstrdup("VERSION");
  	configdata[i].setting = pstrdup("PostgreSQL " PG_VERSION);
  	i++;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
index af36da4927..0bc9ac9a27 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -1,7 +1,7 @@
-From 1a8b94140988d2ee5ff987b0bb3e7c3e936b8c01 Mon Sep 17 00:00:00 2001
+From 83a2f0e9989269516f344fd665fa26c9828b5599 Mon Sep 17 00:00:00 2001
 From: Manoj Saun <manojsingh.saun@windriver.com>
 Date: Wed, 22 Mar 2023 08:07:26 +0000
-Subject: [PATCH 5/5] postgresql: fix ptest failure of sysviews
+Subject: [PATCH] postgresql: fix ptest failure of sysviews
 
 The patch "0001-config_info.c-not-expose-build-info.patch" hides the debug info
 in pg_config table which reduces the count of rows from pg_config and leads to
@@ -44,6 +44,3 @@ index 351e469..84c113e 100644
  
  -- We expect no cursors in this test; see also portals.sql
  select count(*) = 0 as ok from pg_cursors;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 1f735f322b..b84b106232 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -1,4 +1,4 @@
-From 56b830edecff1cac5f8a8a956e7a7eeef2aa7c17 Mon Sep 17 00:00:00 2001
+From 31543bddfed8882fa2d37998d966f3985fcdf351 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 13:25:15 +0800
 Subject: [PATCH] not check libperl under cross compiling
@@ -20,10 +20,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index fba79ee..7170f26 100644
+index ecdfefd..9e30e42 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2297,7 +2297,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2307,7 +2307,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
@@ -32,6 +32,3 @@ index fba79ee..7170f26 100644
    ac_save_CPPFLAGS=$CPPFLAGS
    CPPFLAGS="$CPPFLAGS $perl_includespec"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.12.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.14.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.12.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.14.bb
index fca2a487b4..36134bbd15 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.12.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.14.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "b253ee949303ef5df00e24002600da4fb37e5ccfafa78718c6ea6a936b4d97f1"
+SRC_URI[sha256sum] = "f6d077142737920858ce958ccdb75c6ee137a63b5b0853c70693d401ac7e3471"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."


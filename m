Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DE3C54F32
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.16490.1747731316776524975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AB42RQPa;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731320; x=1779267320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RnpD36tN0OeUT5o1un2pRPS9xhSIBhVJFgq8Tk+Vl5Y=;
  b=AB42RQPaI07WeybzDizTDrRHINB8umNK0SJb2NlVcUO+6yEB6gNvvri4
   aIvl3W9xxqpfqHfykA3qguTs0dCKhJn3YQLxInnG0XkBMd13RAdgBOVOT
   PV4ugsvXi9QqaQyPeayWMzfXYUc5oeKjVbUy5K5i45fBaJO8xW5e1CxIV
   v2VytVsISghv1c3R631MNig3BDQLouYhcxpEpdQ9URsVq0sm9HNrevzk2
   detmPyr/z063F47o3zkQWxfyNfsCxwP4wqyc1CnLKiZUBi+Rjk5yo2pwN
   6f9PgRxzTjTuuvWCX/glNudRWOaxO3e0bY9pkgenkv6BA2BB+L4lPqsAH
   A==;
X-CSE-ConnectionGUID: ZFjjX9b7REidWVCOQPeNGw==
X-CSE-MsgGUID: e6IwSDQPTs2V4gVyOQvdHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="199238458"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="199238458"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B5286D4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74960D7293
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A3171A009A;
	Tue, 20 May 2025 16:55:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/27] postgresql: upgrade 17.4 -> 17.5
Date: Tue, 20 May 2025 16:54:50 +0800
Message-Id: <1747731299-20448-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117497

From: Wang Mingyu <wangmy@fujitsu.com>

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
0004-config_info.c-not-expose-build-info.patch
not-check-libperl.patch
refreshed for 17.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gure.ac-bypass-autoconf-2.69-version-check.patch |  9 +++------
 .../0004-config_info.c-not-expose-build-info.patch  | 13 +++++--------
 .../postgresql/files/not-check-libperl.patch        |  9 +++------
 .../{postgresql_17.4.bb => postgresql_17.5.bb}      |  2 +-
 4 files changed, 12 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.4.bb => postgresql_17.5.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 92ac335a7b..4382741da9 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 5ce7d8398f6aff41eee8c8c80eeaad2fcb3da1fc Mon Sep 17 00:00:00 2001
+From 84febaf9330fe99802f75bcd0606ac7d86c35b25 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a8a61c5..27c2760 100644
+index 493d5cd..f0fa973 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,6 +27,3 @@ index a8a61c5..27c2760 100644
  AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index ff0582ab80..d94f028036 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -1,7 +1,7 @@
-From 5be3ffdf767c1efcbfd2d1be87aa83f2e37e348e Mon Sep 17 00:00:00 2001
+From 62733bdc9346651637d9e5ac7cbf8d7311ef5d97 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 1 Aug 2022 15:44:38 +0800
-Subject: [PATCH 4/5] config_info.c: not expose build info
+Subject: [PATCH] config_info.c: not expose build info
 
 Don't collect the build information to fix the buildpaths issue.
 
@@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 27f382d..3dd6bb1 100644
+index f0fa973..8ccd8bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Group])
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
  AC_PREFIX_DEFAULT(/usr/local/pgsql)
@@ -27,7 +27,7 @@ index 27f382d..3dd6bb1 100644
  [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
  [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
 diff --git a/src/common/config_info.c b/src/common/config_info.c
-index 09e78a6..86e4230 100644
+index 89c1ccb..a2206de 100644
 --- a/src/common/config_info.c
 +++ b/src/common/config_info.c
 @@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
@@ -114,6 +114,3 @@ index 09e78a6..86e4230 100644
  	configdata[i].name = pstrdup("VERSION");
  	configdata[i].setting = pstrdup("PostgreSQL " PG_VERSION);
  	i++;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 1f735f322b..a2f0500a8c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -1,4 +1,4 @@
-From 56b830edecff1cac5f8a8a956e7a7eeef2aa7c17 Mon Sep 17 00:00:00 2001
+From 1a9416bae71aa935797add3fa11407732ad010c0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 13:25:15 +0800
 Subject: [PATCH] not check libperl under cross compiling
@@ -20,10 +20,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index fba79ee..7170f26 100644
+index f398184..493d5cd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2297,7 +2297,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2336,7 +2336,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
@@ -32,6 +32,3 @@ index fba79ee..7170f26 100644
    ac_save_CPPFLAGS=$CPPFLAGS
    CPPFLAGS="$CPPFLAGS $perl_includespec"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
index b1c95ed244..b7fce886f8 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7"
+SRC_URI[sha256sum] = "fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.43.0



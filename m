Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CDFC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 00:58:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.407.1705971521479268257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 16:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146410791"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146410791"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:58:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 72D35DF0E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:58:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C8D5D9487
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:58:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33FCC22CDE3
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:58:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D04191A006A;
	Tue, 23 Jan 2024 08:58:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] htop: upgrade 3.2.2 -> 3.3.0
Date: Tue, 23 Jan 2024 08:58:23 +0800
Message-Id: <1705971503-24480-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--1.131500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yTo39wOA02LhTJDl9FKHbrkg9R3V8qg5xNb2
	e7N2CFQy+7QcRaVoa8n/tdOuViNvuC/7QU2czuUNlVHM/F6YkvQLLztSdvsxGDqUJVT3gpbTyeX
	VW/8z+AigqZowaleikHgGgctngrOyMu6pEp5ajsUZgmFGHqyx64KMU5VqphqVoHmOTZNdeMWUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly/bDbr65FANnRoLkbmW3pwwYNW
	wmCJCfY7zfir45NlAR7fCQjMQVXLp2SkMJANOSzpSJRhXxicvrGyGkXVxS8t3Asr8ElsO9p/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 00:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108382

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-pkg-config.patch
refreshed for 3.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/htop/files/0001-Use-pkg-config.patch  | 8 ++++----
 .../recipes-support/htop/{htop_3.2.2.bb => htop_3.3.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_3.2.2.bb => htop_3.3.0.bb} (96%)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
index d85aa1563..3d113efa1 100644
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -1,4 +1,4 @@
-From 98ed72177c49a8015a443b3ec272fee3fb5a4eb3 Mon Sep 17 00:00:00 2001
+From 0d49ee6416e389b9a7ba693588c2eaf129306a01 Mon Sep 17 00:00:00 2001
 From: Paul Barker <pbarker@toganlabs.com>
 Date: Sun, 5 Nov 2017 22:07:30 +0000
 Subject: [PATCH] htop: Update to v2.0.2
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [`ncurses*-config` can be used outside of OpenEmb
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0e69096..d20014f 100644
+index e4df238a..2a31b201 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -322,10 +322,10 @@ AC_ARG_ENABLE([unicode],
+@@ -391,10 +391,10 @@ AC_ARG_ENABLE([unicode],
                [],
                [enable_unicode=yes])
  if test "x$enable_unicode" = xyes; then
@@ -34,7 +34,7 @@ index 0e69096..d20014f 100644
         HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
          HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
           HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
-@@ -342,8 +342,8 @@ if test "x$enable_unicode" = xyes; then
+@@ -416,8 +416,8 @@ if test "x$enable_unicode" = xyes; then
     # (at this point we already link against a working ncurses library with wide character support)
     AC_SEARCH_LIBS([keypad], [tinfow tinfo])
  else
diff --git a/meta-oe/recipes-support/htop/htop_3.2.2.bb b/meta-oe/recipes-support/htop/htop_3.3.0.bb
similarity index 96%
rename from meta-oe/recipes-support/htop/htop_3.2.2.bb
rename to meta-oe/recipes-support/htop/htop_3.3.0.bb
index 68d4a3f8f..cd5b766f0 100644
--- a/meta-oe/recipes-support/htop/htop_3.2.2.bb
+++ b/meta-oe/recipes-support/htop/htop_3.3.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
 "
-SRCREV = "55c10eccd71b6b016a50237bc8c8508b7bf66783"
+SRCREV = "68c970c7ef4a0682760ed570b3d82388ae7ccf54"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



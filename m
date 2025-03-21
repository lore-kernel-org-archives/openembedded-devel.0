Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5992FC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 03:39:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.13313.1742528354465172780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 20:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fzGaBxiP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742528354; x=1774064354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BU+h6df+R5D5wSsP/7GQR5vmvA13iZrNNzp2fXzgjSk=;
  b=fzGaBxiPf9TO3giNNxe/FGYXaNXBmq/AdG4FEluiMtA5omE8c02bu7Db
   DtkMp99YgomNX0mhMMAjHwsB6nIBo3t3O7t/2LcfaFFMc0oa3lM9+eUn0
   Qh1RYckY7zCYvpMt59Gh/KRKCbY5M2JXUmvp4vBG1xiILrmEcsXN1uMdU
   Yt+A+6FUNNLxeQRGsCsAOcdcmW+cjFyLtUoRb0RJPtWtIoOQuPRFqSL6J
   WA09/A4DT+eoiSAMf0wzVAgLV6wYpiEoj5dilY0cfOnBhaHRh4W9qpMQb
   UygPLDy2hqpnOxvHtEd0loQyU8jqh+kKA9MPrWoAdPG+soicNEVYjX1ls
   Q==;
X-CSE-ConnectionGUID: l0JXX3ykSpS1LcpN27qjZg==
X-CSE-MsgGUID: +NUcUnMhRCa1SVI8g8UB0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="172684276"
X-IronPort-AV: E=Sophos;i="6.14,263,1736780400"; 
   d="scan'208";a="172684276"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:39:12 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0570D4808
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 12:39:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE9B4D52E2
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 12:39:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3FC3B1A00AE;
	Fri, 21 Mar 2025 11:39:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 2/4] gjs: upgrade 1.82.1 -> 1.84.1
Date: Fri, 21 Mar 2025 11:39:00 +0800
Message-Id: <1742528342-27448-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
References: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 03:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116159

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Support-cross-builds-a-bit-better.patch
0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
refreshed for 1.84.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gjs/0001-Support-cross-builds-a-bit-better.patch  | 10 +++++-----
 ...ild-Do-not-add-dir-installed-tests-when-inst.patch | 11 +++++------
 .../gjs/{gjs_1.82.1.bb => gjs_1.84.1.bb}              |  2 +-
 3 files changed, 11 insertions(+), 12 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.82.1.bb => gjs_1.84.1.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
index c66d42da62..ab3b85b606 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-better.patch
@@ -1,4 +1,4 @@
-From 8e7a25b0171eb60c802168593355354dff7806f5 Mon Sep 17 00:00:00 2001
+From b6996f3683f0a1428657636c372ef7af8d0b43ff Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Wed, 27 Oct 2021 20:18:47 +0200
 Subject: [PATCH] Support cross builds a bit better
@@ -17,7 +17,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index f3081fc..ac958d3 100644
+index a969ce2..1885afc 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -252,6 +252,7 @@ release builds of SpiderMonkey. Try configuring SpiderMonkey with
@@ -34,9 +34,9 @@ index f3081fc..ac958d3 100644
  endif
 +endif # not meson.is_cross_build()
  
- have_printf_alternative_int = cc.compiles('''
- #include <stdio.h>
-@@ -656,7 +658,7 @@ subdir('installed-tests')
+ ### Check for external programs ################################################
+ 
+@@ -651,7 +653,7 @@ subdir('installed-tests')
  
  # Note: The test program in test/ needs to be ported
  #       to Windows before we can build it on Windows.
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
index bca27c33d4..9558ad75e2 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
@@ -1,13 +1,12 @@
-From 6a70d3ac658988dda49d51ed8b46584b716a9c7c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+From d0424474da5d6b6a3360d081886c289852242378 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller=20installed=5Ftests=20is=20false?=
+ <schnitzeltony@gmail.com>
 Date: Wed, 27 Oct 2021 20:04:02 +0200
 Subject: [PATCH] meson.build: Do not add dir installed-tests when
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-From: =?UTF-8?q?Andreas=20M=C3=BCller=20installed=5Ftests=20is=20false?=
- <schnitzeltony@gmail.com>
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -24,10 +23,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index ac958d3..e773508 100644
+index 1885afc..6333c06 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -654,7 +654,9 @@ gi_tests = subproject('gobject-introspection-tests',
+@@ -649,7 +649,9 @@ gi_tests = subproject('gobject-introspection-tests',
      default_options: ['werror=false', 'cairo=true',
          'install_dir=@0@'.format(installed_tests_execdir)])
  
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
index fd4e9c6f8a..55bd38c97c 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-128 cairo"
 
 inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig multilib_script
 
-SRC_URI[archive.sha256sum] = "fb39aa5636576de0e5a1171f56a1a5825e2bd1a69972fb120ba78bd109b5693c"
+SRC_URI[archive.sha256sum] = "44796b91318dbbe221a13909f00fd872ef92f38c68603e0e3574e46bc6bac32c"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.43.0



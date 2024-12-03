Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C0EE6C5F0
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8215.1733185028024875654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CdGMraq3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185029; x=1764721029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Hj+GYx37+6GoP5+CsZ1POOdNiJ5Oz1964ix6cMmdBAI=;
  b=CdGMraq36xFF/EfWis8YHz69Cwt/ut4oXZcbz8PFmSUGOf5IdSmbxzBH
   AhJla64Yo9FI/vLNV5YtJfzBMobCgb43XiiHr7RyBMGYXMG+g73HM8jsq
   ltHdK+++dtRkwhW0sb0PonudELGoDlqTM9yuLzrf9lYpsexL4J70bEmuf
   mY0BlkJf6RAoCWWFCWxqvC37kE9V43qh5lYwbto15tWF6SY+3K3P8Byvg
   ubSiqpE26MooEM1uo/Y+AyXTt+b1aR0YM/hcKRCvh5Q7mY2iEG4chvOx3
   YA3HirpyAkESZjRQRDa2PiUo1k8PMOqn9lg631APLgoJEDud++9uqBcOV
   A==;
X-CSE-ConnectionGUID: nHsnhdNDQkaU7m5JrWklKw==
X-CSE-MsgGUID: 0TP8gA2qTregSG+MeSRo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161830287"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161830287"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:08 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE3B6D4F62
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A8C45CF7D9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3813F20071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D87161A0003;
	Tue,  3 Dec 2024 08:17:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 33/34] tinysparql: upgrade 3.8.0 -> 3.8.1
Date: Tue,  3 Dec 2024 08:16:38 +0800
Message-Id: <1733184999-27041-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--3.892100-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhMir
	dQwFSTzq/9FzCWH6Yv3FLqTgoGRsK7BAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6uw/I+coNEnxKFeojD/r+TofDSIGnaDB4cQNQCplRkzpi7ngo5v+d0z+Mu0UJyeG8+JN
	YnO/CORyreb8Xf//jlUohz+xKeF4GY37wz4y436LGWmeVAULKHgjDdudOPBHowAYdq1VTXo4uVC
	Dz2gMcK4vM1YF6AJbbCCfuIMF6xLd934/rDAK3zlGdyD+QE2h8Yo1vwXjsSa54/QHGpFjoht0iP
	yHG+VaGoxh7hYllh3In2an4Y7PVX+mzb3tqyW5lqv1iHdgsPLmHyyBzMyaJaUrFvXfvigD7+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114175

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-reproducibility.patch
refreshed for 3.8.1

Changelog:
============
* Fix leak iterating bus-based cursors
* Fix allowed extension for Turtle files in ontology definitions
* Test fixes

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../tinysparql/0001-fix-reproducibility.patch | 27 ++++++-------------
 ...inysparql_3.8.0.bb => tinysparql_3.8.1.bb} |  2 +-
 2 files changed, 9 insertions(+), 20 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.8.0.bb => tinysparql_3.8.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch
index 23da5bb97e..67c0bdfebc 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch
@@ -1,4 +1,4 @@
-From 1eec06fc1ef26e4954507001c1c2f981eab8d77d Mon Sep 17 00:00:00 2001
+From e4552b9c5dbe8816266f332c5e20796d46eb5b16 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Sep 2023 02:47:55 +0200
 Subject: [PATCH] tracker: fix reproducibility issue
@@ -14,13 +14,12 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  meson.build                        | 6 +++---
  src/libtracker-common/meson.build  | 4 ++--
- src/libtracker-http/meson.build    | 8 ++++----
- src/libtracker-http/tracker-http.c | 4 ++--
+ src/libtracker-http/tracker-http.c | 2 +-
  src/libtracker-sparql/meson.build  | 4 ++--
- 5 files changed, 13 insertions(+), 13 deletions(-)
+ 4 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 41c00fafc..6e7282cb7 100644
+index 8552c6d..d72ff52 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -333,7 +333,7 @@ have_rtld_noload = cc.has_header_symbol('dlfcn.h', 'RTLD_NOLOAD')
@@ -44,7 +43,7 @@ index 41c00fafc..6e7282cb7 100644
  
  tracker_uninstalled_cli_dir = join_paths(meson.current_build_dir(), 'src', 'tracker')
 diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/meson.build
-index 72c2ae073..12218c870 100644
+index 72c2ae0..12218c8 100644
 --- a/src/libtracker-common/meson.build
 +++ b/src/libtracker-common/meson.build
 @@ -51,10 +51,10 @@ libtracker_common = static_library('tracker-common',
@@ -61,10 +60,10 @@ index 72c2ae073..12218c870 100644
    include_directories: [configinc, srcinc],
    gnu_symbol_visibility: 'hidden',
 diff --git a/src/libtracker-http/tracker-http.c b/src/libtracker-http/tracker-http.c
-index dd82e9928..3cc68b240 100644
+index dd82e99..cb3f1f7 100644
 --- a/src/libtracker-http/tracker-http.c
 +++ b/src/libtracker-http/tracker-http.c
-@@ -53,13 +53,13 @@ ensure_types (void)
+@@ -53,7 +53,7 @@ ensure_types (void)
  
  		current_dir = g_get_current_dir ();
  
@@ -73,15 +72,8 @@ index dd82e9928..3cc68b240 100644
  			/* Detect in-build runtime of this code, this may happen
  			 * building introspection information or running tests.
  			 * We want the in-tree modules to be loaded then.
- 			 */
- 			module_path = g_strdup_printf (BUILD_LIBDIR "/%s", modules[i]);
--		} else {
-+		} else {
- 			module_path = g_strdup_printf (PRIVATE_LIBDIR "/%s", modules[i]);
- 		}
- 
 diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/meson.build
-index 5eccb92fc..161f6ea21 100644
+index 5eccb92..161f6ea 100644
 --- a/src/libtracker-sparql/meson.build
 +++ b/src/libtracker-sparql/meson.build
 @@ -102,10 +102,10 @@ libtracker_sparql_private = static_library('tracker-sparql-private',
@@ -97,6 +89,3 @@ index 5eccb92fc..161f6ea21 100644
      ] + tracker_c_args,
  
      dependencies: [libtracker_sparql_dependencies],
--- 
-2.46.0
-
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.8.1.bb
index 628384464d..0da2d1764c 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.1.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "c0fcda77520f531548b2395137dcd193ee9cde5e222d3c9d273f030d1762a504"
+SRC_URI[archive.sha256sum] = "53e04add1ecb4d08caa1317f477fdf0e7148eaac5462831f2374880092ffb295"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.34.1



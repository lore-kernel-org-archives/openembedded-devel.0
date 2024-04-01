Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0354CD1298
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.39357.1711983100517075574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D8O1cYCu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983111; x=1743519111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U7qN4URx3OQZj/5PFDgp15NcTWqcf9soNN085YTI//c=;
  b=D8O1cYCupNhH2/zPWeT2IB+3Yu9tyU9XI0SYmV33k+XKzXr0hkcYtYsK
   hb5dZakHQZkpaYJp8HRaBC3i5z9WhBQ5MfTLlJlHpjpSCWprwepm1KJ4I
   BlEqtEimyK/cUiKnsvvjbhr0C6bvHcn7zM/neGz+0HMG5finLhD3t1ybV
   by/m/gJGh6Roe+w/baJN++KY7CIxO0LlFeEK0QnCDRIycgtLyzSPxoMTN
   3KffwI0yrjOcnWtZ4Tx4cYoJE7gRvMq0TDwJndwMsaqzUKINNHje7JcW0
   PvzqLO0v2N6KXTsUcpfCzPX/R32ajOe5Px7Qp7n5GdjO0r9Op0FJqBDby
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133627010"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133627010"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A80C4E48C8
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E248AD5602
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BF5F20093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 32C461A000A;
	Mon,  1 Apr 2024 22:51:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 45/47] tracker: upgrade 3.7.0 -> 3.7.1
Date: Mon,  1 Apr 2024 22:51:17 +0800
Message-Id: <1711983079-16849-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--11.801300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhPBC
	OSw/1nNkUQoRpxlU5BWJkPXW/h6KPrBAQLqGlKivuce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYiXd6AfHhre0trZWHaNDZ4Q8+i/lP6Xo8dY3ddD/vCxPyIKHzIGoT61jEV
	FWWnJhnMNa4fgHS3xVZ//EYBRSUfeY37wz4y436NDQPgxOmF8E6SmFaeUM9vf5UUyIMY0GrSna6
	HXiFYjusX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+z/EFJbTdS0pQ6WoUKkvK4xWJUW
	l93rlDgjmunRkJHdKTg7x/Up8pGG
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109760

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-reproducibility.patch
refreshed for 3.7.1.

Changelog:
==========
* Fix possible stalls in D-Bus endpoint batch updates
* Better API documentation around handling of corrupted
  databases
* Test improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/0001-fix-reproducibility.patch      | 17 +++++++----------
 .../{tracker_3.7.0.bb => tracker_3.7.1.bb}      |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.0.bb => tracker_3.7.1.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
index 4a11f8314..4527f9efa 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
@@ -1,4 +1,4 @@
-From e5acd475f796420b4887969f2b0057dbf67979b3 Mon Sep 17 00:00:00 2001
+From ae34fb111e1f2498f37b21c0c32ace6c9928ad66 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Sep 2023 02:47:55 +0200
 Subject: [PATCH] tracker: fix reproducibility issue
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  3 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 8442a216f..82844d7fd 100644
+index bc9f93a..6c86e5a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -348,7 +348,7 @@ have_rtld_noload = cc.has_header_symbol('dlfcn.h', 'RTLD_NOLOAD')
+@@ -357,7 +357,7 @@ have_rtld_noload = cc.has_header_symbol('dlfcn.h', 'RTLD_NOLOAD')
  conf.set('HAVE_RTLD_NOLOAD', have_rtld_noload)
  
  # Config that goes in some other generated files (.desktop, .service, etc)
@@ -30,7 +30,7 @@ index 8442a216f..82844d7fd 100644
  conf.set('libexecdir', join_paths(get_option('prefix'), get_option('libexecdir')))
  
  configure_file(input: 'config.h.meson.in',
-@@ -388,8 +388,8 @@ subdir('docs')
+@@ -396,8 +396,8 @@ subdir('docs')
  subdir('utils')
  
  test_c_args = tracker_c_args + [
@@ -42,7 +42,7 @@ index 8442a216f..82844d7fd 100644
  
  tracker_uninstalled_cli_dir = join_paths(meson.current_build_dir(), 'src', 'tracker')
 diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/meson.build
-index 9355d1c0d..cdbc05f28 100644
+index 9355d1c..cdbc05f 100644
 --- a/src/libtracker-common/meson.build
 +++ b/src/libtracker-common/meson.build
 @@ -51,10 +51,10 @@ libtracker_common = static_library('tracker-common',
@@ -59,10 +59,10 @@ index 9355d1c0d..cdbc05f28 100644
    include_directories: [configinc, srcinc],
    gnu_symbol_visibility: 'hidden',
 diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/meson.build
-index 36288f5c3..61086a697 100644
+index 4143eac..b73f1c9 100644
 --- a/src/libtracker-sparql/meson.build
 +++ b/src/libtracker-sparql/meson.build
-@@ -96,10 +96,10 @@ libtracker_sparql_private = static_library('tracker-sparql-private',
+@@ -98,10 +98,10 @@ libtracker_sparql_private = static_library('tracker-sparql-private',
      c_args: [
  	'-include', 'libtracker-sparql/tracker-private.h',
          '-DPRIVATE_LIBDIR="@0@"'.format(tracker_internal_libs_dir),
@@ -75,6 +75,3 @@ index 36288f5c3..61086a697 100644
      ] + tracker_c_args,
  
      dependencies: [libtracker_sparql_dependencies, gvdb_dep],
--- 
-2.41.0
-
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
index a41da6d46..1d5c79ab4 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion python3native
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] = "46b8c16ff289d9507baa112c717845a200fe3d1ffcc2324562e02c40db9a151d"
+SRC_URI[archive.sha256sum] = "cd91b885ee9839cde5387f8e05ed24a7108d1627629cb6b1b2aa51a9603e130a"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.34.1



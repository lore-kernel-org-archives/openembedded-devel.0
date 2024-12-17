Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6408DE77186
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.77395.1734426117233642159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wi2XIRaV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426117; x=1765962117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kv737Wyg2iWgkajihY5B3MdzbAwXHvMMp++zNmblaA0=;
  b=Wi2XIRaVLiWx6+N3AOYJNramj4p5wYWY2ltlaAjy8ZkAqoPFoJgFJA+A
   xjK1RvXl+iRAG+fG9+PRrlG/BkYcubkb+qcEI3V0uTqcPRAL78QxXnclO
   WxPW+IyE0jcq8d5bdWAHLNlyiSWVwwo6i9Z6V8e6ZE3BPe02nl/EFXEap
   Mbv7oSyLXGdTjCjseT7wZdn2+QaJQnl0h6qosl1w9M3tzXE2pawhfaepP
   k1Lasz4adILwei7yp88mZi2PBzi/XpmJTMB7Kc9mEkLY51zih13Odh82E
   o27m0YLITg7/d4ZxZAkYma/HMO6VWc8j0RUC7NZH49bb3NM4jTUFVI/9X
   A==;
X-CSE-ConnectionGUID: 4Um00227So+t7NE8KRcHhg==
X-CSE-MsgGUID: HaXZI6E+R8K6hOHiuO70RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="172377472"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="172377472"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 95F33D501B
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E70ED971B
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F3403347B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA8351A000B;
	Tue, 17 Dec 2024 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 16/17] tinysparql: upgrade 3.8.1 -> 3.8.2
Date: Tue, 17 Dec 2024 17:01:35 +0800
Message-Id: <1734426096-18300-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--5.820700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhGK9
	bQZf9PqTJEDiHJuJSEkSuJRtSU84o39JXYBaBfzu/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQu/s
	1bKPusfSZPHwEuBkHDVdmvsTeI8IJB1Q7P5DZjXXQ0D4MTphfBDFVRYZezcLzh+COkGSdO5E7eK
	BFNfX9irmIQj3QvnqhptTC/3BZpP3lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7tmT1
	kghryF9nmGCZhbk8pjs7Y42JJumCV7Kvl50+rtE66XHIc5w+gc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114365

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-reproducibility.patch
refreshed for 3.8.2

Changelog:
===========
* Hide again unintentionally leaked tracker_http_* symbols
* Doc building improvements

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../tracker/tinysparql/0001-fix-reproducibility.patch     | 8 ++++----
 .../tracker/{tinysparql_3.8.1.bb => tinysparql_3.8.2.bb}  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.8.1.bb => tinysparql_3.8.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch
index 67c0bdfebc..28e66af7d6 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibility.patch
@@ -1,4 +1,4 @@
-From e4552b9c5dbe8816266f332c5e20796d46eb5b16 Mon Sep 17 00:00:00 2001
+From dd163864c5ee28e153e982e47502039dad2f3787 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Sep 2023 02:47:55 +0200
 Subject: [PATCH] tracker: fix reproducibility issue
@@ -19,7 +19,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  4 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 8552c6d..d72ff52 100644
+index 3a624ad..8c02aad 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -333,7 +333,7 @@ have_rtld_noload = cc.has_header_symbol('dlfcn.h', 'RTLD_NOLOAD')
@@ -73,10 +73,10 @@ index dd82e99..cb3f1f7 100644
  			 * building introspection information or running tests.
  			 * We want the in-tree modules to be loaded then.
 diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/meson.build
-index 5eccb92..161f6ea 100644
+index bafc2ac..859da3e 100644
 --- a/src/libtracker-sparql/meson.build
 +++ b/src/libtracker-sparql/meson.build
-@@ -102,10 +102,10 @@ libtracker_sparql_private = static_library('tracker-sparql-private',
+@@ -103,10 +103,10 @@ libtracker_sparql_private = static_library('tracker-sparql-private',
      c_args: [
  	'-include', 'libtracker-sparql/tracker-private.h',
          '-DPRIVATE_LIBDIR="@0@"'.format(tracker_internal_libs_dir),
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.1.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.8.1.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.8.2.bb
index 0da2d1764c..16c7bfd0d1 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.2.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "53e04add1ecb4d08caa1317f477fdf0e7148eaac5462831f2374880092ffb295"
+SRC_URI[archive.sha256sum] = "bb8643386c8edc591a03205d4a0eda661dcdd2094473bffb9bbdb94e93589cb2"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.43.0



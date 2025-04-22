Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2A0C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.35432.1745311780134685303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tKKUte8D;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311779; x=1776847779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mA13CIbl026PvjBg9EmD5hhQHPQxbsUG1WzWWrbMzSk=;
  b=tKKUte8DOSRVet/jN83HvNwRBRogEVKTgvmMpSk7yqHpIjFegl2JmbZa
   i0EsFInHa8EBKAAtjOJhDrJv+C5L1F8clGqHA7MGlVzkkHVNM7NjfDSMr
   kTei+FwzzeqL6GU2qgNarxNXD/E6n8ZKxX/D/92Q1D8UoIVwYB+l5jIln
   WON3sEqt7JL4tIH3BaqkmU5QCJaz0RCOo3sWz2KnQBrJwgbPoinfXhUiE
   JTEYWnvxPMKz0awRxtYLiWIWx/vCM55pH1B74j7304dV0T6QhWi4QOO9Y
   q9yemX5pRQ2R9xPu+0XR1h0EYNVaky4vsztIiAKpC3jvijcgex3ShLHY1
   g==;
X-CSE-ConnectionGUID: Z8bD9FBjQR2ebR2uoTkdIA==
X-CSE-MsgGUID: KsUEpmTUQ1KNSRgaoDIGNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="185691858"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="185691858"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F1A5C3F9A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E810D3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 041ED1A009B;
	Tue, 22 Apr 2025 16:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 30/30] tinysparql: upgrade 3.9.1 -> 3.9.2
Date: Tue, 22 Apr 2025 16:49:21 +0800
Message-Id: <1745311761-1912-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117043

From: Wang Mingyu <wangmy@fujitsu.com>

0001-src-libtracker-sparql-meson.build-dont-create-compat.patch
refreshed for 3.9.2

Changelog:
=========
* Fix installing pre-generated documentation in tarballs
* Performance improvements in handling parser errors
* Fixes for issues reported by OSS Fuzz

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibtracker-sparql-meson.build-dont-create-compat.patch | 9 +++------
 .../tracker/{tinysparql_3.9.1.bb => tinysparql_3.9.2.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.9.1.bb => tinysparql_3.9.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-compat.patch b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-compat.patch
index e8c1904565..a9ed1caa52 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-compat.patch
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-compat.patch
@@ -1,4 +1,4 @@
-From 0dfdbeef174c18e846b98af816a9675c12a42845 Mon Sep 17 00:00:00 2001
+From 64d537a8e5e8dd2f651d8fe214b73bbc96cc5655 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 20 Sep 2024 16:43:44 +0200
 Subject: [PATCH] src/libtracker-sparql/meson.build: dont create compatibility
@@ -16,10 +16,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/libtinysparql/meson.build b/src/libtinysparql/meson.build
-index 5eccb92fc..6ed7c2b1f 100644
+index 031f7e1..11f8a96 100644
 --- a/src/libtinysparql/meson.build
 +++ b/src/libtinysparql/meson.build
-@@ -247,6 +247,6 @@ endif
+@@ -246,6 +246,6 @@ endif
  
  tracker_sparql_uninstalled_dir = meson.current_build_dir()
  
@@ -27,6 +27,3 @@ index 5eccb92fc..6ed7c2b1f 100644
 +#meson.add_install_script('symlink-libtracker-sparql.sh', get_option('libdir'), meson.current_build_dir())
  
  meson.override_dependency('tinysparql-3.0', tracker_sparql_dep)
--- 
-2.46.0
-
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.1.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.9.1.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.9.2.bb
index b254253a5d..1194b1f71b 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.2.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gi-docgen bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "98e8933b946d8c54a77eadabd7f1d14cddd88fa43eef0d0ace3c0fcce646722b"
+SRC_URI[archive.sha256sum] = "14ce039024135e181022bcce4b1aad2e00377dd9c7d812b98391ccfc756dad8e"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.43.0



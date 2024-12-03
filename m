Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3A2E69EB3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8070.1733185014399800145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pgpre1/1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185015; x=1764721015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HzJABdZGTlrg9eGVGNQ+2gzcJWV0Qjn3DTs9KGWkFm4=;
  b=pgpre1/1k0jUgJnGFHxRk9GHymSvRnuG1mjKzWKtkP8R3HTJFQCsMVAr
   VjsFlXEsqYeQa+BoBqKIaWTVW1rLMOpP5j10leRiEwDnC6QzbtUxYC1Zr
   JIELgqFvoITRWKZP9zuZCRLv2pxpHxZJkcslI7Q0++kFynM1djxUuHjjj
   iAeonvcdAtKS7EX4NEMIOnmCu/cf92Y/yJNPvawYAOL9YmYs3pL/hAKnU
   FJHiLrRV4XHoiwiXo9I4fec8KukXoZbtNOUR9tfAJHC4KWzVRf8exWFHi
   0nMNXYMePEMad0IwNPUHUGIJL2rTC2WN+4lyK0ez+jd37sg+8womX5xFw
   g==;
X-CSE-ConnectionGUID: wSDuIESGSTyWIDUz7vPlDg==
X-CSE-MsgGUID: pRX8+eQUROOoOi1edcJJBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406406"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406406"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 76D4C279A9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CFE9D3F1D
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF5F420071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C6361A0003;
	Tue,  3 Dec 2024 08:16:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 09/34] localsearch: upgrade 3.8.0 -> 3.8.1
Date: Tue,  3 Dec 2024 08:16:14 +0800
Message-Id: <1733184999-27041-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--1.510400-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhP6N
	VYgJ2lwX04FHBUZVJIbXvM56a4jFam94Ipa1otxouce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYiXd6AfHhre0trZWHaNDZ4R85pjA/x1xfuMuseq8CJLLxrLmMm+vGoykLR
	5cMEnz0cVFYPj+SB0bci+BUTjBZhvxtRHCfVBMefCW/PNRRp/ZegIHHX2L4Yw9l6vw5mwGC8yI+
	8+g+Pi/+pXq6lwbJTPZ00tL3d4N3RlW/yxvXyp5WTWEh5N2a9F9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO2W79Uq8KMo9bPrwMeBDvZSqLKpAJhDT3xDWTJ/FdcSVVuXoUZdC3u7NMC/+3jWJK+8ith
	BzuQRYmg7spg7xK1HU0oSES/Gjme/aNHwQI50SfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114150

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-reproducibility.patch
refreshed for 3.8.1

Changelog:
============
* Fix multiple leaks in metadata extractors
* Fix reporting of metadata extraction progress in "localsearch daemon -f"
  and "localsearch status"
* Cache mounts for generating stable content identifiers
* Added missing includes necessary for Musl libc

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../localsearch/0001-fix-reproducibility.patch       | 12 ++++++------
 .../{localsearch_3.8.0.bb => localsearch_3.8.1.bb}   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.8.0.bb => localsearch_3.8.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibility.patch
index 8f9dcdc3e6..6c1d978135 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibility.patch
@@ -1,4 +1,4 @@
-From db5149a0c9297d1053c2d0c01ed116cdcf5d14f0 Mon Sep 17 00:00:00 2001
+From 57f4279008394831826ea2ff449b06b29c08ce68 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 12 Sep 2023 17:00:41 +0200
 Subject: [PATCH] meson: fix reproducibility
@@ -20,7 +20,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  5 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 4a2994a..31b1798 100644
+index 7ae103c..cc61e84 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -371,7 +371,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.project_version()))
@@ -53,10 +53,10 @@ index 4a2994a..31b1798 100644
  
  if get_option('tests_tap_protocol')
 diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtracker-miners-common/tracker-landlock.c
-index 0aca8ed..e6c28b6 100644
+index 0ad90d0..354f5d1 100644
 --- a/src/libtracker-miners-common/tracker-landlock.c
 +++ b/src/libtracker-miners-common/tracker-landlock.c
-@@ -282,7 +282,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+@@ -283,7 +283,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
  			          LANDLOCK_ACCESS_FS_READ_DIR);
  		}
  	}
@@ -65,7 +65,7 @@ index 0aca8ed..e6c28b6 100644
  	current_dir = g_get_current_dir ();
  
  	/* Detect running in-tree */
-@@ -302,7 +302,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+@@ -303,7 +303,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
  			          in_tree_rules[i].flags);
  		}
  	}
@@ -75,7 +75,7 @@ index 0aca8ed..e6c28b6 100644
  #ifdef MINER_FS_CACHE_LOCATION
  	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
 diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
-index 42c4573..73577c3 100644
+index 1e16618..286580a 100644
 --- a/src/miners/fs/meson.build
 +++ b/src/miners/fs/meson.build
 @@ -68,8 +68,8 @@ executable('localsearch-@0@'.format(tracker_api_major),
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.8.0.bb b/meta-gnome/recipes-gnome/tracker/localsearch_3.8.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.8.0.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.8.1.bb
index 916e489617..c80d6dd102 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.8.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.8.1.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "e4e83a1daebb5263915b45b719731e3f7041d959cbd637ea29afbe910c92bbf9"
+SRC_URI[archive.sha256sum] = "a7b24a4f07805df7543a4dd023684fcde5ee699ca00eb5b09123a049d3aeccd8"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.34.1



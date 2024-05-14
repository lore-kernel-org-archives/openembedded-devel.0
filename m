Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4821CC25B7D
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.10758.1715677843301773887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C7VQkXUu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677845; x=1747213845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D7qTA2wlp3DtpoRczAeTy31F77K0tmcZHRaz1Xel91E=;
  b=C7VQkXUuFZEco8eCcQRCEjTtYodX1lr28eMfvyTKuZezrrcwYx04YXll
   NUxIOlZhslR1v91lEQ54rUH1R3Lj34pGL/K7ejfqWjCPWsi/qfSuuOVCL
   E85V/GdfvaMRW9WJaND6IjbVSVBFZOaLStUUxAehah4peG5WsUzpQbaAs
   ledZE5kAdbkgfphIrl/+5IIc7sZ9tSq18ttUU3zMPcsR/P/OrvBPupzRL
   1UhnlAFtRnrFQb3x5kvKGG1yfrL9bsdhiElqErYjTGHTY/A9zY920BeDj
   s4Pre/ppcqgdGO0tR/+oqf2JYEEc44G05jBFPna4NXP8ony2wQhtoja6d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="157675062"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="157675062"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8288FDC142
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F47ED52E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4116220076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2DC11A000B;
	Tue, 14 May 2024 17:10:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 42/44] tracker-miners: upgrade 3.7.2 -> 3.7.3
Date: Tue, 14 May 2024 17:10:15 +0800
Message-Id: <1715677817-2223-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--5.203000-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhIPC
	H9f9cyBSra1MFj2AtFXdQfQdktYTuKNu8YiLlIJQ/9mRo9wUk+Vh1mb42cZVB5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3J7eCbzD7i9RmyTBaqiJvc+32SXw3QiFz88X
	4OiGZRZb2jand2PRF8rLxasEOdu7sN8j953SMxjkXBhxFdFgcQWQ3R4k5PTnBM+b8yxBqvA7YXd
	mPuTQvHx0bDOUsN5IwWYQr/uiq2tuUOexubVvUfb056mCmF00ZV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNQwWxr7XDKH8nsbY+apRGIB4G0QzClBcADLlIjz76Tfqbudpai8GA8oMow4
	SQyxKsQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110386

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-reproducibility.patch
refreshed for 3.7.3

Changelog:
============
* Fix possible crashes handling live changes to extractor
  configuration
* Make it easier to run tracker-extract-3 under Valgrind
* Plug a leak on misdetected JPEG files
* Many further metadata extraction tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker-miners/0001-fix-reproducibility.patch | 15 ++++++---------
 ...er-miners_3.7.2.bb => tracker-miners_3.7.3.bb} |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.2.bb => tracker-miners_3.7.3.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
index ea239c41f..0812e88a9 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
@@ -1,4 +1,4 @@
-From 2bbd07843e8ec34311cafab35f21b40c86e0dd7f Mon Sep 17 00:00:00 2001
+From 1b7a34b7de9eb2ae776f7cf4dc6221f49b2395ee Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 12 Sep 2023 17:00:41 +0200
 Subject: [PATCH] meson: fix reproducibility
@@ -20,7 +20,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  5 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index a838344..6945f63 100644
+index 37f5148..18f4bfa 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -393,7 +393,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.project_version()))
@@ -53,10 +53,10 @@ index a838344..6945f63 100644
  
  if get_option('tests_tap_protocol')
 diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtracker-miners-common/tracker-landlock.c
-index 95c652e..608cee4 100644
+index 6d4510b..189d2fb 100644
 --- a/src/libtracker-miners-common/tracker-landlock.c
 +++ b/src/libtracker-miners-common/tracker-landlock.c
-@@ -276,7 +276,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+@@ -282,7 +282,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
  			          LANDLOCK_ACCESS_FS_READ_DIR);
  		}
  	}
@@ -65,7 +65,7 @@ index 95c652e..608cee4 100644
  	current_dir = g_get_current_dir ();
  
  	/* Detect running in-tree */
-@@ -296,7 +296,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+@@ -302,7 +302,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
  			          in_tree_rules[i].flags);
  		}
  	}
@@ -90,7 +90,7 @@ index 6e58832..04750f8 100644
      ],
      install: true,
 diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson.build
-index 16ce367..bbd494d 100644
+index 2e4f61d..b47581c 100644
 --- a/src/tracker-extract/meson.build
 +++ b/src/tracker-extract/meson.build
 @@ -158,7 +158,7 @@ endif
@@ -115,6 +115,3 @@ index 8c081fd..9792082 100644
  
  libtracker_miner_test_deps = [tracker_miners_common_dep, tracker_miner_dep, tracker_sparql]
  
--- 
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
index a1fefe6a0..2b2dc7c4b 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "eb4f2b288a0cbe9e614871cb0048274461cfe1cb8467ac817b102d3873dbcba5"
+SRC_URI[archive.sha256sum] = "e74388154b5c197b4b7ee42f0dce8c5fbbddd4d361093ef88d4fb303e33da5fe"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.34.1



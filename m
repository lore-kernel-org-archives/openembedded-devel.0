Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722C1C36012
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.61525.1742893329607333293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oELzhlWa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893329; x=1774429329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nAqaE+3JsBq2oLp8Tm0qUy6aNMM3eIT6yaQQ9gsGVWQ=;
  b=oELzhlWaLNv9pQS4TXOmQDnOBR4bEwrb48VSbfeliPlPjUbBg8RxSZLH
   6K+EJ6gToDM0njmRnE0LDW7YQEaSTV/hldypdegxACzfkf5FYnDmuCLhn
   3FRyk1zhynpbetGo+3gXJ1kPNb+9RFGkihZZ2Kpmv/YPxEDKumiwd4k+5
   MpyHY3eVmftyD2il8ygMO3Ta9a9uqmMOdT5ISA6qkCyDPR8v/8UYHNtsZ
   6DibX7Luwj9QsbmpIk1ajs1R66ttllOABvvhQwurETT7PpjVXzxZniUtH
   Vj2KuKDXQ+gxHPPwIyTL7cp3wbfii5Z87piq6/olhlwCfD8QMvLAj8l4a
   w==;
X-CSE-ConnectionGUID: l2YfyJssRZS+iFzIjFNSpw==
X-CSE-MsgGUID: QWKU7ab4TxO8WZmWzW/GKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182576213"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182576213"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:07 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18844C2270
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D022CD4BCF
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A76D1A009A;
	Tue, 25 Mar 2025 17:02:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/45] imlib2: upgrade 1.12.3 -> 1.12.4
Date: Tue, 25 Mar 2025 17:01:14 +0800
Message-Id: <1742893312-3809-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116231

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- imlib2_view: Toggle anti-alias flag on 'a'
- test_load_2: Add another y4m test image
- scaling: Fix potential crash when scaling large images
- test_grab: Work around linewidth=0 bug
- test: Enable skipping tests for specific files
- test: By default skip CRC checks on jxl images
- test: Colorize Skip message
- SVG loader: Suppress warning
- test: Enable skipping loader flushing
- test: Correct CFLAGS when building with alternative library packages
- test_load_2: Adjustment for libheif-1.19.x
- imlib2_load/view: Show image alpha status too
- imlib2_load/view: Add -h option for help
- imlib2_conv: Optionally produce scaled image
- imlib2_conv: Optionally render image on background before saving
- test: Change test images
- savers: Add common save parameter handler
- HEIF saver: Add one
- scale: Rearrange some variable declarations
- scale/blend: Add some missing consts
- blend: Some mostly cosmetic changes
- blend: Rename some variables for clarity
- loaders: Fix gcc15 warnings
- test: Make top-level clean clean test too
- SVG loader: Handle .svgz too
- test: Fix top-level distclean
- PNG loader: Debug printout tweaks
- image: Trivial simplification
- image: Add optional alpha check requested by loaders
- SVG loader: Check alpha in pixel data
- imlib2_view: Optionally show crc32 of image data
- test: Some trivial ouput tweaks
- test: Change many no-alpha test images to not have alpha data
- test: Corrections after no-alpha update
- GIF loader: Fix minor issue when loading transparent gifs
- test: Add transparent gif check
- Y4M Loader: Trivial simplification
- autofoo: Make building demo programs optional (default enabled)
- autofoo: No longer link modules with libImlib2.la
- test_save: Add qoi
- specs: Optionally build split rpms
- XBM loader: Debug printout tweaks
- AVIF loader: Indent
- AVIF saver: Add one
- HEIF loader: Demote avif support if regular avif loader is built
- test: Add basic avif test
- test: test_grab needs -lX11
- test: Avoid warnings from _FORTIFY_SOURCE
- AVIF loader: add new loader based on libavif
- Y4M Loader: replace fps_{den,num} with frametime_us
- Y4M Loader: provide the pixel aspect ratio directly
- autofoo: don't hardcode zlib flags
- QOI Loader: sync with upstream
- QOI Saver: add one

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 8e5febd7a1..3bfd701d96 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.12.3"
-SRCREV = "143c60194c0948aac484d37bb23c59edea2ccf19"
+PV = "1.12.4"
+SRCREV = "fd4310864f820ca4db56fd663a504cdc4f840ffe"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.43.0



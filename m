Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27FBD1489A
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 03:08:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23836.1767841675423367834
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 19:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hbx0XbbH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767841675; x=1799377675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r2WvaOlvGBhqB8osIbvk9cbfbpM8L/de/cW5Xwwp29c=;
  b=Hbx0XbbHIeeyYun5jWcrBMO7RZ8SmrF3jstTSzWrqxkQUbqY1TlrF6sC
   zgfsQ31o/4KziTjg8B5VeWKxGA3tR5t4nXgy5lbtXiUe405dfsnUj6ru3
   /UIZFP1fH/mdfkpjRCRkbGCeT0Ubt4pv6UR6SJF7KVhCtf1SUcPS5vjfE
   0C/Vfwdcw/mVWFibzjkhUuUzO64sXBfnR3UJvPFi3SwSd82CZuZh7/ZH2
   ML6zly7c5V5qFMLnnKvP22P1v9yr8el36za2xsWQnHUFmC/R6kgJFE//7
   lxhIYvELHBmu6HiN7UUvtufEmBJHnepBEYWi8pka2Nou8yeXWR+LtozJD
   A==;
X-CSE-ConnectionGUID: dgVvkfK6Q8Om71s8x1jPoA==
X-CSE-MsgGUID: aOopXc4WTpyDjDplJPcbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="213097999"
X-IronPort-AV: E=Sophos;i="6.21,209,1763391600"; 
   d="scan'208";a="213097999"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 12:07:53 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id AC3884071C5
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 03:07:53 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 60BC8C01624
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 03:07:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 84141180012D;
	Thu,  8 Jan 2026 03:07:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] imlib2: upgrade 1.12.5 -> 1.12.6
Date: Thu,  8 Jan 2026 11:07:46 +0800
Message-ID: <20260108030746.496-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 03:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123244

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Y4M loader: add support for 10-bit 4:4:4
- Y4M loader: add support for 10-bit 4:2:2
- Y4M loader: add example for 8-bit mono
- Y4M loader: add support for 10-bit mono
- Y4M loader: fix support for full-range mono
- Y4M loader: fix support for odd dimensions
- Y4M loader: add support for 12/14/16-bit mono
- test/images: Remove intermediate generated file
- imlib2_view: Set title
- imlib2_view: Scale image when resizing window
- imlib2_view: A couple of fixes to previous commit
- test_load_2: Add new y4m test images
- test_load_2: Add more new y4m test images
- test_load_2: Add more new y4m test images
- autofoo: Use AM_LIBTOOLFLAGS, not LIBTOOLFLAGS
- gradients: Fix rendering of gradients in larger images
- imlib2_conv: Fix constness warning
- gradients: Better gradients with angles
- Compile cleanly with -Wdouble-promotion
- XPM loader: Add missing progress callback on incomplete image data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../imlib2/{imlib2_git.bb => imlib2_1.12.6.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/imlib2/{imlib2_git.bb => imlib2_1.12.6.bb} (92%)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_1.12.6.bb
similarity index 92%
rename from meta-oe/recipes-graphics/imlib2/imlib2_git.bb
rename to meta-oe/recipes-graphics/imlib2/imlib2_1.12.6.bb
index 66e9f8a0c4..faa1eb9006 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_1.12.6.bb
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.12.5"
-SRCREV = "df73df52ddf0e1ea40507f5ee8c6b794b328b3bc"
+SRCREV = "8c6a7640c91d7815a6318d3641554869c62cc926"
 
 inherit autotools pkgconfig lib_package
 
 AUTO_LIBNAME_PKGS = ""
 
-SRC_URI = "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=https;branch=master;tag=v${PV}"
 
 PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
-- 
2.43.0



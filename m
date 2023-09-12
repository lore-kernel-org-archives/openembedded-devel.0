Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEF3CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 12:11:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.23189.1694520679701366685
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 05:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OCx65qg5;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694520679; x=1726056679;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i4ICTqDRpe4nogiQ1Ws5crvlDJ2nHBemPDwIYuIRJG4=;
  b=OCx65qg56UyuJniYPB5umL3NBA4w7Pdbfpg4rTOB0nFqeYguCvF4ZBYT
   kk6J/E0CztRjCXkOHOBYoqfMhqFHZ8XhJTJ8EuLuCIw2fdVlxx/sUB2Vm
   /EkW9i4UBWnDcJjkvU88coE2ztz7K4oM0YNEALkfXcnRwY5nf1miB0KG+
   42oe73lxeeP8EI2+PQ5YTnJPAsQ3H0+8VPtDrMEfY+0ZUFdAK42bSvRyx
   fH1kuAcuTjT1Unqrq0Y3eCtCdNY5juhyXUWcb3B+pLGUBms5vEdMIZEnN
   wiL09eN3JE4s7dWw/t0i4FUkFL8IhSAvv2uH2yl2DYtNMeX2x8asiJGbN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442370513"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="442370513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 05:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917411684"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="917411684"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 12 Sep 2023 05:11:18 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl: fix CVE-2022-34568
Date: Tue, 12 Sep 2023 19:51:41 +0800
Message-Id: <20230912115141.1246940-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 12:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104846

From: Lee Chee Yang <chee.yang.lee@intel.com>

CVE-2022-34568 affected
From (including) 1.2.1
Up to (including) 1.2.15

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2022-34568.patch | 28 +++++++++++++++++++
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch
new file mode 100644
index 0000000000..7561300cb3
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch
@@ -0,0 +1,28 @@
+CVE: CVE-2022-34568
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/d7e00208738a0bc6af302723fe64908ac35b777b ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
+From: Ozkan Sezer <sezeroz@gmail.com>
+Date: Sat, 18 Jun 2022 14:55:00 +0300
+Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
+
+Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
+---
+ src/video/x11/SDL_x11yuv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/video/x11/SDL_x11yuv.c b/src/video/x11/SDL_x11yuv.c
+index 62698dfd9..0d5754e3e 100644
+--- a/src/video/x11/SDL_x11yuv.c
++++ b/src/video/x11/SDL_x11yuv.c
+@@ -374,8 +374,8 @@ SDL_Overlay *X11_CreateYUVOverlay(_THIS, int width, int height, Uint32 format, S
+ #ifdef PITCH_WORKAROUND
+ 		if ( hwdata->image != NULL && hwdata->image->pitches[0] != (width*bpp) ) {
+ 			/* Ajust overlay width according to pitch */ 
+-			XFree(hwdata->image);
+ 			width = hwdata->image->pitches[0] / bpp;
++			XFree(hwdata->image);
+ 			hwdata->image = SDL_NAME(XvCreateImage)(GFX_Display, xv_port, format,
+ 								0, width, height);
+ 		}
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 814e6cd0dd..a817d3834a 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://CVE-2019-7638.patch \
            file://CVE-2019-7576.patch \
            file://CVE-2019-13616.patch \
+           file://CVE-2022-34568.patch \
           "
 
 UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.37.3



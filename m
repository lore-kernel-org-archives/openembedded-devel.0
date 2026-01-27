Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1140BD2D8C7
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7124.1769507041712997004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HnXCHZeH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507042; x=1801043042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Byfb/hS1ZemU8UqPefD3AwkgqVRhPiS6hWv9KA0q7M=;
  b=HnXCHZeHPYFRrhvAAWJp8pPpTXgm5rRe10XuvBHMJpDoQkyWOFheveut
   QuD1nQJJdGx4rBulOCggRCJXF6GUyBkPa+a2EDE9TKwxlsmtf0oy8u53u
   1fnazVA6mQrwlW6M/LDJAUsyIWwCPAR+wYNOQXeo498IY72QojRMoPwF6
   wuSg6L+bIEep+dz6WPEuqqGLmtrA6oeoyZe0ozcVBwg8LYaahcc12BKgl
   h3Bww9NmoPdT8/Lc+Ui86yxtRF88j3KrhvUugVSyD5b75vaeLARrFOOML
   Mrj7MIz1okTnKJEZGckCdQbxwzFj3+YyJqz4pxyv4AFijQlZ3Ncgn1L+7
   g==;
X-CSE-ConnectionGUID: CpGKwe9eRpCo7+ddF6gX9Q==
X-CSE-MsgGUID: fGdLaWJxT6WYfrz+2IuB3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="231321707"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="231321707"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:00 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0392D1002BAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ABB8F1809C2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 1AE692000212;
	Tue, 27 Jan 2026 09:43:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/25] imagemagick: upgrade 7.1.2-12 -> 7.1.2-13
Date: Tue, 27 Jan 2026 17:43:21 +0800
Message-ID: <20260127094339.1081-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123917

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: change license url to https://imagemagick.org/license/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-12.bb => imagemagick_7.1.2-13.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-12.bb => imagemagick_7.1.2-13.bb} (98%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
similarity index 98%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 535ba7df65..0eb072f84c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f9de66264141265b203cde9902819ea \
-                    file://NOTICE;md5=bcbf1f1897b40ec8df39700cb560e9ed"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f56ade64cf079aff7232f7dbeaea992 \
+                    file://NOTICE;md5=3974428a57d34b981abb7acc416dde8f"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "bdd4fa561d7bf4c6afd40ee9c89e9f9e82b6e88b"
+SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0



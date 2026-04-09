Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAA5EA3C31
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128824.1775730815457469612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q2ezKPTk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730816; x=1807266816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PciMPm0DX5f7Ay/+WdnvJ5mUtIn7HIbDqK9XcOymEBA=;
  b=Q2ezKPTkK0nza2EDxEu5Nx21T+b4p1ba5Ux1EIz1swFzTQqt2/toLFOL
   i2vkYSkM4PikEEkdSPHt1ecxRttU8SpxG5pKHFNmAPVdv0UaQMhmFHlgl
   N2vD6qYCboHsLksnav2NvVB0AoOBnLHeejqy52xZhyCRcdOQKLc9iNoO8
   0devavYJ2+qPRapML1MApWhWehQXxXuEQSt7mA6dGmWYwLcOntECeutUW
   Ak9wS9Epw044nM61qgdMfT4bwqsAXVTJ4y5/xNMSNhW2atKkvBZxhjG1G
   QQBUPPfmV9ipMtEn5zwZ5HLqn2qfshVGcJuF4azjCdWz21ou8uYjDQbGu
   Q==;
X-CSE-ConnectionGUID: lseWxZPnQoWTJHGrgxSO2Q==
X-CSE-MsgGUID: hkveN8U5QOul/eO5xVAelw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="240796117"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="240796117"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E7BE61002B85
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:33 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A1FBD8D65FB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 346AD4046A8;
	Thu,  9 Apr 2026 10:33:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/37] libsdl3-image: upgrade 3.4.0 -> 3.4.2
Date: Thu,  9 Apr 2026 18:31:56 +0800
Message-ID: <20260409103223.1574-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126159

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Non-animated images can now be loaded as single frame animations
- Fixed animated WebP frame composition
- Fixed potential buffer overflow in tRNS handling
- Fixed out of bounds read in XCF image loader (CVE-2026-35444)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libsdl3-image_3.4.0.bb => libsdl3-image_3.4.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.4.0.bb => libsdl3-image_3.4.2.bb} (83%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
similarity index 83%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
index 324332eb84..0f7ce92efd 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
 
 DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
 
-SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.4.x"
-SRCREV = "ad58ecfc27a1bd09e510ceff8bbbdb1094806476"
+SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.4.x;tag=release-${PV}"
+SRCREV = "96a73a551a857b7c8d0ca3cc553a266eabbab6a7"
 
 EXTRA_OECMAKE += "-DSDLIMAGE_JXL=ON"
 
-- 
2.43.0



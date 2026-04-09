Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F808EA3C2F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129120.1775730813363895421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tgAUx4U8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730814; x=1807266814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y5dXtmUse8xw4iEPxSx1q/hNOufLtof6hvaXdo6jMqc=;
  b=tgAUx4U8042l4g8lUKcJcTmZ1G5L3mM3X0pXSdEiokIsrAswzdT2Pr1S
   Dp9OMyHCAfBXAjSt3CWpytKcbW1XLcdNac0T8HnMJ2gRLbgCYd6z2rWo2
   73d2GpaZt8nCkyyN2v5XFviIm32zMNqjeFRYpdbZ0OlCbRekPGEPdPGr3
   ZMF1DkpmmjafQb1c/RAk4XervMoPnSRUwZGtFHD1D61JJ+ZuqOWhrTC1Y
   zEoPFS6zk9dj2ObAFQ8Y49Tf2/NsDKu9knwRxwOtmMrfAs54dSUDoRfD6
   JzKY/qji9fMk25VeTdwgsLSOmwY8OICXhhjE01BB5GDdekkqHhSK2J6j0
   w==;
X-CSE-ConnectionGUID: OgBGSX1zS12iSS7KCUff8Q==
X-CSE-MsgGUID: bjEyDr53RluqpRnejOsgPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236327342"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236327342"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:32 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AA6FE1C0621A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:31 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 63E3E8D65FB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DDAAE405988;
	Thu,  9 Apr 2026 10:33:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/37] libsdl2-image: upgrade 2.8.8 -> 2.8.10
Date: Thu,  9 Apr 2026 18:31:55 +0800
Message-ID: <20260409103223.1574-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126158

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-image_2.8.8.bb => libsdl2-image_2.8.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.8.8.bb => libsdl2-image_2.8.10.bb} (82%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.10.bb
similarity index 82%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.10.bb
index c15e986dc3..27ddc35381 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2213b56fdaff2220d0e38c8e420cbe1a83c87374190cba8c70af2156097ce30a"
+SRC_URI[sha256sum] = "ebc059d01c007a62f4b04f10cf858527c875062532296943174df9a80264fd65"
 
 S = "${UNPACKDIR}/SDL2_image-${PV}"
 
-- 
2.43.0



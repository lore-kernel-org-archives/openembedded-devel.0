Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4E7CD5834
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3061.1767781761258228737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KELUrZ8f;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781761; x=1799317761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xC47hsKpnmtFqBmZ5P2Nai//7uZfFLtkCpUYhI+oXUQ=;
  b=KELUrZ8f9TQTQgdPJLBhdeHS9zh+UvtTC11e6PVCRoJVnLexwj7/+Kzw
   Gi3M2y931DEn2GMrNJD/SnK7t8Cw+hcotd+eMARsk0o2gTG3XpV/RoLHJ
   WX63nUQm75qPGBmsi/xzzkiBfg7Z81bq9+UuSVGtTu7a4gEg3EPk9ZAze
   eH0JqKqzkF7ZTLrKrlXGQTh1ZJoRYrVYKfgj0rpn+ftXXU5Xm+PKIgmi6
   xf3ACLSpEHInwwLKReCDj1ploRPOOh2XII/u8xRaAOAUexElO/ZR7X7rP
   K4wj+R5EJcYVYLnPkAYTwIpNBe57n6vG6K6iO57Fi5pHYoLLT+SJkfvlh
   A==;
X-CSE-ConnectionGUID: TR4F2eXLRteDJd6Ffi0B5g==
X-CSE-MsgGUID: /XCvf9poQ8eav74DAPwS7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="204045513"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="204045513"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C3F10C01AF7
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:19 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 77143896E27
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9337982173E;
	Wed,  7 Jan 2026 10:29:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/24] libsdl3-image: upgrade 3.2.4 -> 3.2.6
Date: Wed,  7 Jan 2026 18:28:40 +0800
Message-ID: <20260107102855.228-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123207

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3-image_3.2.4.bb => libsdl3-image_3.2.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.2.4.bb => libsdl3-image_3.2.6.bb} (87%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
similarity index 87%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
index ac425f6ad2..7c2f4026f2 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.2.x"
-SRCREV = "11154afb7855293159588b245b446a4ef09e574f"
+SRCREV = "d78dd65454f442bfdbc373201165f1ef579484ab"
 
 
 inherit cmake pkgconfig
-- 
2.43.0



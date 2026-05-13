Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52A5CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:58 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.256.1778646049775520849
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=chBbqKgz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646049; x=1810182049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9gMCFLnz9Fqsq7yTvSvClzrmnZQ27/BQ5suuGcjWnd4=;
  b=chBbqKgzOgN9kXWiMwfIvyRoJQvNlPr38l1vAckthLIjeSvJx5WVBSL2
   swXFal6AmCohF9UkfmmtVoa65NL5vI8VpwvrTdj5IZxnA7W7s+hx3WY2B
   G6TticZwQDMIVzNd9MsBFQSM929SrY/rin8vQQtLJdfjs8ln96HUf+igT
   XpbcWog/dgRl3oaaQtjTxHV9hPyS3xtbuOGt4Y+u5JG8vBF8P2mPBusfc
   rzOkYoAEl29efqfm2sIluZpDZb/aNIFUvFWEO3nKCkYO1ZcIZ63HN/hcX
   S8o62wRclCq6RoN342rK5HlL3CyKUvnh3gNKfp0r6U3GiJ601Pld+3R29
   Q==;
X-CSE-ConnectionGUID: tZQwRwAeQMaVrhmd9pmVPg==
X-CSE-MsgGUID: bp3jCzeeS3Ke0WWdZw92nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="219134727"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="219134727"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 30D81820732
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:48 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E15491801FC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 818581400254;
	Wed, 13 May 2026 04:20:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 55/56] xterm: upgrade 409 -> 410
Date: Wed, 13 May 2026 12:19:51 +0800
Message-ID: <20260513041952.450-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126937

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_409.bb => xterm_410.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_409.bb => xterm_410.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_409.bb b/meta-oe/recipes-graphics/xorg-app/xterm_410.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_409.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_410.bb
index d013a73ab4..d10fb999fe 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_409.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_410.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a81
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "349dc755c49299ca4b8e3a90f7201dff41877a1e6ac16129e439d76493246c40"
+SRC_URI[sha256sum] = "7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0



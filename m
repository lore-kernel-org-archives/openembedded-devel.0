Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D320FD7F86
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92753.1772187325784266391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nyDmeZv2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187329; x=1803723329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/D4iV3j0SBgLentFhbrz4fFau+ei93LeckaWiv1qaA4=;
  b=nyDmeZv21Hy2beakIcRMHu7OyGuHO3XNKHvHV2WP53td0bhUp4vlYcak
   ObAFKkRUeXEeZf2+eB8ixK6hIj6Hqj1x7m2H098pBONZB3QRCMEGvdt8i
   mT9NJCb0J95OaFF5TYc1BaTRaZ8uj0cdWBmGARF/t+YPhalGoWeDqRi9k
   KEnJ2tAV+J9Wg3c1korXt9Nus465h+XtZ19BvcTT2HvVe2sOlVWWCxLQ2
   1iuSPuctrK8IBpGfFTYCbCBj/Uubw+jpm5826pD3jErtFtuTctkU5LtIH
   WFgUPcNFsCGBGe4I8B7Ztc+r6d4u4Zsw3Jrpq1v7KdHciwg4PYCnstFa4
   Q==;
X-CSE-ConnectionGUID: 4ISE5/JkQ8Kh92881nefWA==
X-CSE-MsgGUID: CxCQGNMRS4GdzJSC6AfWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219257639"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219257639"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 85C201C000B2
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:28 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 35A691009E1B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5925218005A1;
	Fri, 27 Feb 2026 10:15:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 42/52] swagger-ui: upgrade 5.30.3 -> 5.31.2
Date: Fri, 27 Feb 2026 18:13:17 +0800
Message-ID: <20260227101327.1432-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124742

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.30.3.bb => swagger-ui_5.31.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.30.3.bb => swagger-ui_5.31.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.31.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.31.2.bb
index 3d152e15ad..9495daf6ab 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.31.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "199761a94d03753ec62c23bb4ba162bb73c3cfc7"
+SRCREV = "a398208d1723ce5dae956cb2a060864092d436c0"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



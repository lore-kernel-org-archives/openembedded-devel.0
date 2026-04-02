Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56D51112259
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7190.1775096052976715283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UscFhrMW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096052; x=1806632052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vlV2TwG3kqJEK5WT38U9eMamIebmK3+bV6Q/Ej1gNew=;
  b=UscFhrMWYajgDXaOlfIIirFG70RSOzlXFv1eFbSsTEffOCBP2dctB/1l
   82LB+qUxhK8kETjiYZXtwHH9ar2/3eclfHLghtGRznwdaWWFI/uy6GX3P
   Tyj6eQ/IJLQuV/TQr3vtDJb9NkGGD6GrTkF9IYH8ogtqzZNrHuasChrRl
   PWHJOfC77jb4jEp2TDDFwEzsYTb3zelGAPRbeKmFA1sN+uhjUmcGAZoEK
   Gk1VM6Z8dBzQ4wLySEwK1lwSMGJYoSLMsPHrU/9WK4JC8gKtyvnK974GX
   KWonu5dzLSk583y4IdQja+m8VQdL+mxzq5DhS9xs6cUBIe4aAf9Sbpmlt
   w==;
X-CSE-ConnectionGUID: b3nAS2NrQHObf52vYnzM/Q==
X-CSE-MsgGUID: 9fxOiqGRT8esZyKUilWaTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224160833"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224160833"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:11 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DA838C01598
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:12 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 94C87140060E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 375A41003740;
	Thu,  2 Apr 2026 02:14:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/39] fastfetch: upgrade 2.60.0 -> 2.61.0
Date: Thu,  2 Apr 2026 10:13:20 +0800
Message-ID: <20260402021355.1324-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125920

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfetch/{fastfetch_2.60.0.bb => fastfetch_2.61.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.60.0.bb => fastfetch_2.61.0.bb} (97%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
similarity index 97%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
index dbb999969b..8d2daeb24f 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 
 DEPENDS = "yyjson"
 
-SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=dev;tag=${PV}"
-SRCREV = "06ecc9c4805794ca8d632844e64950e82a6d5f7e"
+SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "e5d600600614f5496b02907a11a7bc80c369d266"
 
 inherit cmake pkgconfig
 
-- 
2.43.0



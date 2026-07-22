Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F08DC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44634.1784715888279986838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r/kWI2ZX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715889; x=1816251889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qxXwogh4WAtmxARytsbfXV+8Y6snRx94nMMOOw6u+kQ=;
  b=r/kWI2ZXr0Gx/nJlbvTtwVaaBm/a34FaSvjeFunyNFMzglAGb/p080tg
   X28cP/a/1w5VXEVMjVy+knDXhxus2uJ/Tsh8KL/FAwLpW4KqwNchvHRXx
   JV5sRed+Z0mgoaa1gxEmJWatnpZOcFHj6TC+Z3n+nEfNnVssGo1BxGS12
   1TJDtuQxWaMHyELBemKRciOj5i+74AqdLqjZhgtrXpElUCTZQGeV4a9ki
   gxa6kVjClbOpATb6wKXfweWg3rsbFXucBU54EInMOMTJ0tIW4lKglYfAB
   XKnXpISVWSB4pLKvgVI0FzHsc7LvatGau+0EK1L01+sxiUInA2EPplt1f
   A==;
X-CSE-ConnectionGUID: ZEGMx7LaQ/6Ut0IimWameQ==
X-CSE-MsgGUID: y8c5JwZCRBG1mAuQtIB1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="246377115"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="246377115"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3F70D8204D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:48 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E7EC41801FC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 0150C4064B2;
	Wed, 22 Jul 2026 10:24:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/37] python3-yarl: upgrade 1.24.2 -> 1.24.5
Date: Wed, 22 Jul 2026 18:23:16 +0800
Message-ID: <20260722102320.1019-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128403

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.24.2.bb => python3-yarl_1.24.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.24.2.bb => python3-yarl_1.24.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.24.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-yarl_1.24.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
index 4f6e4795b7..e3e7518eed 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9ac374123c6fd7abf64d1fec93962b0bd4ee2c19751755a762a72dd96c0378f8"
+SRC_URI[sha256sum] = "e81b83143bee16329c23db3c1b2d82b29892fcbcb849186d2f6e98a5abe9a57f"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.43.0



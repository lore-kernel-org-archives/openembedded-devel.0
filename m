Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C77CCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17471.1777546261645951050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J9ywfTL4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546264; x=1809082264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M40OoF4/iBvR4G8XjbL1O9/ArAjizYwRHs/eVewkyi8=;
  b=J9ywfTL4u+uhG1x/VVZkVAEV3GbtJf6R2FT8wfsZZVVcSEp7oaQpbHV9
   Sti7qHuvt70hjWW9X0Qi1hGsiWWid9L79Q2rxOEhb4AFhnKHVeszSHAwc
   KmFWLkZ+quA6V0AeuF7UD6eynXahkBvSinsAOrb53JI0RIsq8L2HUaZy/
   ClnR49nSmJPrYVCo72mQxGFSfK1fW6Bdkiie6j6ukL1jAyuVZDJMqZPuV
   vew6dO3rATH7t1H5uCtOCTrGqWWW2V4iSuZpVQ2gu1QTGdI8v057bieRU
   MYw4DHblCdvdL1KNCKF48WEekCGX6yhGSrD0iSWBb+Bhn+bBv/bnvFQbr
   w==;
X-CSE-ConnectionGUID: BRs6BaDOTAq9UYclpTohCg==
X-CSE-MsgGUID: VGQNSDXmThyNSA6UkDwXZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116278"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116278"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:03 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7DDE51C000D7
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 25E411000092
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 96468180113C;
	Thu, 30 Apr 2026 10:51:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 59/64] swagger-ui: upgrade 5.32.2 -> 5.32.5
Date: Thu, 30 Apr 2026 18:49:18 +0800
Message-ID: <20260430104924.1106-59-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126729

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.2.bb => swagger-ui_5.32.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.2.bb => swagger-ui_5.32.5.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
index 7684b1dccc..d494f0ffd6 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "d02a2df106961d8cb6bceb6b4b3aa8d9f6faaf4a"
+SRCREV = "dcb493cdbf58fa885047513bd176a644f92c4955"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



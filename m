Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1511C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:30 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5644.1785218849872221420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fIO699P3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218850; x=1816754850;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=k9I5X73EkzHIZ4S4wZ1pCtQJe8asgAOTilZtkEZdXzg=;
  b=fIO699P3KDbZSiGVsuUjGy6+9cRi5oRhcSYMan4HyxOFImN82f1IeWP4
   bYwKUtQi0LNZohNAk17rHCUIilTxmURzFPuFXWrlu656AbN77TPHxGRnk
   ThgqwQHl25QdgOawr4S1pBJThUa+W42c2sWhUYEtvdhyqQrS+zcKLidqK
   pOAKDGWKSKzSuEdjGckUp/IZ/4uqFXgMpd0R6ZanU11p4SdP10IwbPSqF
   887Q8jW3exlPj1SrRcHW71KMZ/Ph7GKe6sXilmUjyfjWs78fF/KDYrRb4
   dmTJJq4hjSJmpfvdN+yHi+YI7pZ/GyF5Jb5ah7xC9d8oGsrXeaorYdqQK
   w==;
X-CSE-ConnectionGUID: U/LQ1kBJQbuCQbBCfAZ/WA==
X-CSE-MsgGUID: jqmaomtyR9W3WWosS80FVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="246995101"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="246995101"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4E36A1C1C717
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:28 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 08BB5C011A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:28 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5CAE310005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:26 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] swagger-ui: upgrade 5.32.9 -> 5.32.11
Date: Tue, 28 Jul 2026 14:06:43 +0800
Message-ID: <20260728060645.819-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128500

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.9.bb => swagger-ui_5.32.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.9.bb => swagger-ui_5.32.11.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
index 8878f2ea00..19000d6f35 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "08bb057df45fa778351ccea63dfedf848d5c5edf"
+SRCREV = "414a60c9a40408d37821297682b8a190a840a79b"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA21CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:22:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11142.1760433748709794064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e3r+hnSo;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433749; x=1791969749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kn/dk6PH3w1n09Re3cQyfN8NWp8pAYfa6alIWP9XnI=;
  b=e3r+hnSonBbf6FRtJGzA1eaxmRFYEqPQaVKldJr3wtcT09WEDI6cY+Yj
   4cEgNb/7l9HUXuGp4kna0ppoVlkvrdxmfDGW0yeYa4aKa8hFzFpvGNbhQ
   wCxq3MT92KJATjmtQvQ84AvhKXJaHVcrInGaQQQoxQXNCltO6U3sJZB+g
   Mqctlph/Nzlq2slcc4DhA4TPwieo8dy2Ss0UVRVDVrsZOq0g4gVGdWJlR
   sADEoREatWq3MBqgOrIK6sHO2ZcBWrvsYnCns3tVbeFEd8m0XqSzmDqIv
   hMIRNIdr2lJ3g394jFXVeHdqsALnm5iiAT0jTU3r+nHGBIYlqI27/Vkw0
   w==;
X-CSE-ConnectionGUID: SI5ddZotRzmG+LW1XMP86Q==
X-CSE-MsgGUID: 3TFAREa1RyS5s6tidTeR1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="204394638"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="204394638"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:22:27 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 339A21002B98
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:22:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E449B14003BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:22:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 679B2101BB76;
	Tue, 14 Oct 2025 09:22:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 44/44] swagger-ui: upgrade 5.29.0 -> 5.29.4
Date: Tue, 14 Oct 2025 17:19:27 +0800
Message-ID: <20251014091927.493-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120601

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.29.0.bb => swagger-ui_5.29.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.29.0.bb => swagger-ui_5.29.4.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.4.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.4.bb
index 7ac04bf493..2dca388ac2 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "26e6d3cce2a49195681116c97318b2a38c06e21c"
+SRCREV = "526c9ee9227e07e55eb45a4c1749dd0880f97ea1"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



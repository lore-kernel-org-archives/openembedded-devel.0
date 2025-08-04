Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D077DCA0EC7
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13437.1754296436254496950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kt5INKGn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296443; x=1785832443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ptobmNz4T3TZ1VVz5Bm8kqzOWtPDttGEqtOgeoyD6U8=;
  b=kt5INKGn+403/ceLzVFvx3OpCJRPCufNxwRH3n2c0Hw9tNJM2Vlm0rxG
   LIuO5Gi1mUePcJ4aWR8Si0SKv1hRQDzSxJSmJKPUrX+s6Y6alJT4PnKu/
   /wF9AGQUtbKHgu8xc7i3TVmRQtBnzakRFuADNMgK146wQ/fuQejPfav0g
   fWo/E80lpuo+GF5WJFiffqAEr+lPBzlZg2QOIHyTFIx5z75mxNYQ90Z8n
   PrEWdFyn3KHUipGsQ8i7ErJ3LXIdkhmyYTcr1mhDSl7mmFDjZHcCC2RCz
   vWlhMSfgQ7sfvlIbdyAN9NUOP6kVTYxpII9iMyEsgG/jt8AOO07cLHzWf
   A==;
X-CSE-ConnectionGUID: +LdufC4rS9e1q6y84SpkDw==
X-CSE-MsgGUID: G+dz7zLSRK26ap9oKgIy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208301719"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208301719"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:34:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 590AE1C00086
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BFBA31C00197
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C97281A0073;
	Mon,  4 Aug 2025 16:33:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 17/18] swagger-ui: upgrade 5.27.0 -> 5.27.1
Date: Mon,  4 Aug 2025 16:33:39 +0800
Message-ID: <20250804083340.1649-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118849

From: Wang Mingyu <wangmy@fujitsu.com>

bugfix:
 use open-cli instead of require('open') for Node 20+ compatibility

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.27.0.bb => swagger-ui_5.27.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.27.0.bb => swagger-ui_5.27.1.bb} (92%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.1.bb
similarity index 92%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.1.bb
index 4dc1b86125..f1eb6e4423 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.1.bb
@@ -10,9 +10,9 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https"
+SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "7b86721ad6494216d8bad0540c737efe1885688c"
+SRCREV = "43ed706e9519841e97401cfad83faca564b37eaf"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



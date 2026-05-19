Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BBACD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:33 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19059.1779190888169761246
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ch8afy9+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190888; x=1810726888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KA+xd73sFFgNf9qsU9vQ6A/UYnP8ExuR3Qpv7l5jhLM=;
  b=Ch8afy9+CK9YE8M73xwEm3ac270aindMTEJbyLGQQv8STk3eSnToB7LH
   LHd+QGET3319cHCbrjYT+1j6nVAWfU0KcitOkd9jzl1oC4hAkdgzSvtld
   wG+OpaRQoBoSbFE86FI3YonsJNRzmFWF09t1bkGopmFBBjr0Fp5Sq5pCu
   ujLnAwb3PSl6nuw3HUQ4tBv+ng1AZjkFuJx1AUAaaJA7Af7kNeKHsHNVR
   EtYYpFyKQOoOA1yQww08zwXiw00hw6kZxuBoc0rXjefLx2iLX11xsyP7D
   ILcXZr9Xg0URdIOoSyzeqR0gx2pOHaFSDm5NiI+/J+jNatt+FY1RKqUP+
   A==;
X-CSE-ConnectionGUID: K/3rKnnKScWOO1qIFgvs8A==
X-CSE-MsgGUID: 3GrCuJYyR36YUXtNAT96Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="227255674"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="227255674"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:26 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A3466304B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:26 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 587FA1800EAB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D32A8405EC2;
	Tue, 19 May 2026 11:41:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 36/38] swagger-ui: upgrade 5.32.5 -> 5.32.6
Date: Tue, 19 May 2026 19:39:19 +0800
Message-ID: <20260519113921.655-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127098

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.5.bb => swagger-ui_5.32.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.5.bb => swagger-ui_5.32.6.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
index d494f0ffd6..4f157f1692 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "dcb493cdbf58fa885047513bd176a644f92c4955"
+SRCREV = "dcdca62c8b64a0a54e4decd4e1a6c3c712fdcc60"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



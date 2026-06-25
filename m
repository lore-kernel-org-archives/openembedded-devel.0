Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ECBCDE00A
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7248.1782378165096127818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J3ZmfZIr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378166; x=1813914166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rDIz6SbVH6JBHurQlLvcUsBnHNyNGAvC4lmyhXASDh8=;
  b=J3ZmfZIruZYsyf834I38W4v0LLU+fjRfx8L54OmUTdgjDhj6eGW6EHPP
   prhmnJ1tPj4jnaKfR9VCNNJEZuzLab44FUCCdwu1CT2zWsP2sGMBTQ0B5
   R3A/ZakmZSLIfsuqpCE3X1/ycLRwgVuJBVtDPYubYeP04r9yNcky6+yxQ
   k396aW9yjW0FAslU3bYd6EXtmo/USbjZfwMGVRYU02TTcaw1z2g7YAhMl
   8zqiHq4EpxKOQAZbXKVSnvTPKe0UIP4BGoEIqI00oeMl+EtfdeGjD+1gY
   WAFMu809LEk59otJHsHOyb6hwUrxs7Ww/1+VR6DvUVas804KqiDn0ueyj
   w==;
X-CSE-ConnectionGUID: 0Je9RqcjRFG6NiIdcTvy0Q==
X-CSE-MsgGUID: 1h0J3GgEQ/WmyAMBayhqpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="231468280"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="231468280"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:45 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7B47C1002819
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 35339C0245A
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3C63D1017329;
	Thu, 25 Jun 2026 09:02:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 45/47] swagger-ui: upgrade 5.32.6 -> 5.32.7
Date: Thu, 25 Jun 2026 17:01:25 +0800
Message-ID: <20260625090127.1563-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127777

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.6.bb => swagger-ui_5.32.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.6.bb => swagger-ui_5.32.7.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
index 4f157f1692..788a8f5638 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "dcdca62c8b64a0a54e4decd4e1a6c3c712fdcc60"
+SRCREV = "bf6a8f05dcde5904cab31e666e80e456a05782f2"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0



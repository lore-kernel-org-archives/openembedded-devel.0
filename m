Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490A2C54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5636.1785218840901881105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fyS8THi3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218845; x=1816754845;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8g9Mi30F5Amkdh2nLFcr6Iptt16s/KtvviTYPX04BB4=;
  b=fyS8THi39oKLHe6W7oxYx6djSl8MRwL1SZPGKjRrxYX3yBj3hSaFV7TQ
   zNszqj1lDUhhsyIGmL0VR9pMWpp2mECumk3bUqe2WxBtriKuxo/xREs83
   yokInaO/ug6WKke4vNuComAaV2SxY0Jeo327ZTxFxWocIJyXXbraK4n2I
   gflKrTIXLsNHd53XRsnvg31jxyUpQJTk8Y3hULq8aUAAX1VsTtg0XBenD
   B/k3lq6+9prD3nC+xRmpXZgUVzU7tfMHugXooBPRQ+uBG8qC+8aKZltWF
   DpySe2Lqd9+YoR7/1xTbQc9mTdaqaZ1O/xEAlRhTpzwMqpY3+4rcY6kcb
   w==;
X-CSE-ConnectionGUID: H/EsCVGYRWCZdn9uppD5XA==
X-CSE-MsgGUID: NebRLbosQNmvJFs8uxcMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248843315"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248843315"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:25 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9F4F31002BA9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 588C884939E
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:21 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B75A910005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:19 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-soupsieve: upgrade 2.9 -> 2.9.1
Date: Tue, 28 Jul 2026 14:06:38 +0800
Message-ID: <20260728060645.819-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128495

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.9.bb => python3-soupsieve_2.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.9.bb => python3-soupsieve_2.9.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.9.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.9.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.9.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.9.1.bb
index f1ad4c0cc5..bbe421b496 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "acee8417325c5653e1377dc31eccad59eb82cbc65942afe6174c53b3aaad63fc"
+SRC_URI[sha256sum] = "c33e6605bbc71dd628b00c632d58ae607c22bade247e52553928f83bbb75b4ba"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0



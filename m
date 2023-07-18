Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFEFC25B5E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.689.1689654379725723008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124880132"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124880132"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 35E51DAE0E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74C5DCF7C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EF70A20077821;
	Tue, 18 Jul 2023 13:26:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.21.0 -> 2.22.0
Date: Tue, 18 Jul 2023 12:25:33 +0800
Message-Id: <1689654348-30702-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-1.044400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrN5dqZcIK7VgCiXI7bHFUBWK5
	HqEciwE0NmVYIPY+Gy13aWU5jdY62ASSMyiuqBkeP0HVIeixJdBHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNX/QRe2mNLkbKUpW3EwpYBWl/f9++5vrQ7wIU68prNjQ2icTJdvUier9XL1jijAVj7qSQ
	E7n9TUOqD9/8OF65/s1//HcKmSFQPzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103922

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Features
----------
    Adding meta header for trust boundary
    Introduce compatibility with native namespace packages

Bug Fixes
-----------
    Deprecate UserAccessTokenCredentials

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.21.0.bb => python3-google-auth_2.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.21.0.bb => python3-google-auth_2.22.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
index ab32ec4793..ff3f422f33 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b28e8048e57727e7cf0e5bd8e7276b212aef476654a09511354aa82753b45c66"
+SRC_URI[sha256sum] = "164cba9af4e6e4e40c3a4f90a1a6c12ee56f14c0b4868d1ca91b32826ab334ce"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



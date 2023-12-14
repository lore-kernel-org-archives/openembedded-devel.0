Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB53AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:53:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.17789.1702544019684185685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143321698"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143321698"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:53:37 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0569ACF1D1
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:53:35 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 473D863410
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:53:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3677286A76;
	Thu, 14 Dec 2023 17:53:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.14.0 -> 2.15.0
Date: Thu, 14 Dec 2023 16:53:25 +0800
Message-Id: <1702544005-27841-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10-2.490400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwRj2RhErgldERf
	FXhvyeZlugoU/6gQC0r1iYn6sKOOEQtUo+vOXxr5A9lly13c/gH4g3OQ8ZO3RwfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3R6Hc/10cUNraHj2CHn6NY/67osa8+b9Ph3q47LRQI7bsl4
	RCodCumzMjk7ATlPWbrBLGShyRfMqF1deirGVbW+yR+UhxmonUdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107433

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add support for Python 3.12
-Add type annotations to wrapped grpc calls
-Add universe_domain argument to ClientOptions
-Introduce compatibility with native namespace packages
-Fix regression in bidi causing Thread-ConsumeBidirectionalStream caught
 unexpected exception and will exit
-Replace deprecated datetime.datetime.utcnow() 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.14.0.bb => python3-google-api-core_2.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.14.0.bb => python3-google-api-core_2.15.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.14.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.15.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.15.0.bb
index b620e553e..7ce2ad7ad 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.15.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5368a4502b793d9bbf812a5912e13e4e69f9bd87f6efb508460c43f5bbd1ce41"
+SRC_URI[sha256sum] = "abc978a72658f14a2df1e5e12532effe40f94f868f6e23d95133bd6abcca35ca"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883B7C7EE2E
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2147.1685951605774656817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="107515907"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="107515907"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 297BED4240
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 69141BF3C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80E022FC85E5;
	Mon,  5 Jun 2023 16:53:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-nocaselist: upgrade 1.1.1 -> 2.0.0
Date: Mon,  5 Jun 2023 15:53:05 +0800
Message-Id: <1685951589-29920-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGNA4NqdM7aY0gyKXAUOPYkQQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz3zW+O32bbYAf97
	Ak10KjVXC7BDf754XodHa8DR+p5/nHq4/ho24+mE8NUFNIQ0xR5L5ideHr/JowRRIn3b2BM+wIT
	kRGpF7aiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103119

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocaselist_1.1.1.bb => python3-nocaselist_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.1.1.bb => python3-nocaselist_2.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.1.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
index 89a44ea53e..29a3c86067 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "5272b232e08246696ab26fe0ebbd28b8989dac9ee5732b50264950323b513d23"
+SRC_URI[sha256sum] = "456aa000c6777c5d21b029c52e532f94328d4fb4f15ad2a4dd3dd62db30b3892"
 
 inherit pypi setuptools3
 
-- 
2.34.1



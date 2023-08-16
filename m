Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64BEC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:40:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.151746.1692150002788001021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="129515772"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="129515772"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:40:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C428C68E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:39:58 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D24EBCFBDD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:39:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED14B2FC7919;
	Wed, 16 Aug 2023 10:39:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.7.0 -> 6.8.0
Date: Wed, 16 Aug 2023 09:39:23 +0800
Message-Id: <1692149963-5216-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10-3.472200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuUODlja8vigOuP
	tzInVvR/K88wcMnNkfha/ZpuyfQdQj13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8kffP
	BaMANhX3YJEUfDojP/J0RPnyOnrZKGPrA89Rqw8BEFeJGd1c86qywk79Yjgq0nP9y50iIiChKJ1
	FqkY1LlqC5bIC8LO4ezm9G3v5wwO5dNcxSNWWXYfpFUcoE3MwJLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104381

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Bugfixes
----------
    Fix the type for the optional param asking for "full transactions" when subscribing to newPendingTransactions via eth_subscribe to bool. (#3067)

Improved Documentation
-----------------------
    Change docs to reflect AsyncHTTPProvider does accept ENS names now (#3070)

Features
-----------
    Return structured JSON-RPC errors for missing or unimplemented eth-tester methods. (#3061)
    ENS name-to-address support for eth_subscribe. (#3066)
    Asynchronous iterator support for AsyncWeb3 with WebsocketProviderV2 using async for syntax. (#3067)

Internal Changes - for web3.py Contributors
--------------------------------------------
    Minor fixes to type hinting in the core tests setup fixtures. (#3069)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.7.0.bb => python3-web3_6.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.7.0.bb => python3-web3_6.8.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
index c842639678..3b144e6fcc 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "dc05e4130ed2e1e67a18a6f012cd3095440f37c0b8334038071d5510176debb5"
+SRC_URI[sha256sum] = "5db6ed63bca526a5542d9a84778c8b549199009b9f71079ff53a7b82dadf0d0b"
 
 inherit pypi setuptools3
 
-- 
2.34.1



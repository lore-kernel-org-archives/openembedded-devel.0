Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D39C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2110.1685951605228143629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="119509709"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="119509709"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DCC4DA68A
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB515BF3CA
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E053E2FC85E5;
	Mon,  5 Jun 2023 16:53:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.19.0 -> 2.19.1
Date: Mon,  5 Jun 2023 15:53:04 +0800
Message-Id: <1685951589-29920-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-2.855300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrWq/snXbxpCDfc2Xd6VJ+yhM8
	+aSWc/4YIX+UmmSwEkdnvY9hxB9vc6JEq6b8z4ap/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNbcminIUJMhOq0nvLvulijX7K1CkRawXlWnLkoTtbznoD6XSTDKaHXlv29FmqgD9PWN2G
	IHTqoDqI5+47DoWE1R+llzuuTbYhAQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103121

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Bug Fixes
---------
    Check id token error response (#1315) (2a71f7b)
    Fix "AttributeError: 'str' object has no attribute 'get'" (dac7cc3)

Documentation
--------------
    Replacing abc.com with example.com (dac7cc3)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.19.0.bb => python3-google-auth_2.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.19.0.bb => python3-google-auth_2.19.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.19.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.19.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.19.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.19.1.bb
index 52d93abac1..05757adfee 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.19.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f39d528077ac540793dd3c22a8706178f157642a67d874db25c640b7fead277e"
+SRC_URI[sha256sum] = "a9cfa88b3e16196845e64a3658eb953992129d13ac7337b064c6546f77c17183"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



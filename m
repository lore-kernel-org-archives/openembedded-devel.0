Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5C2CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 09:01:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.116268.1698051681585730678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 02:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124891110"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124891110"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 18:01:19 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24494D618A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 18:01:17 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62BECD5040
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 18:01:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57D2487287;
	Mon, 23 Oct 2023 18:01:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2023.8.8 -> 2023.10.3
Date: Mon, 23 Oct 2023 17:00:57 +0800
Message-Id: <1698051657-26394-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKGG1FWkFL1YZ0+G61rfyKcIehCCGvpoPsSWW
	SwAbhMfJhNqbeJxqc00sL5iibbMDpbSTqy8WuFI3gW5nK8qqY55QOz92EzScj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 09:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105685

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 pdated to Unicode 15.1.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2023.8.8.bb => python3-regex_2023.10.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2023.8.8.bb => python3-regex_2023.10.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2023.8.8.bb b/meta-python/recipes-devtools/python/python3-regex_2023.10.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2023.8.8.bb
rename to meta-python/recipes-devtools/python/python3-regex_2023.10.3.bb
index 1676bab26a..c26d55f474 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2023.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2023.10.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fcbdc5f2b0f1cd0f6a56cdb46fe41d2cce1e644e3b68832f3eeebc5fb0f7712e"
+SRC_URI[sha256sum] = "3fef4f844d2290ee0ba57addcec17eec9e3df73f10a2748485dfd6a3a188cc0f"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1



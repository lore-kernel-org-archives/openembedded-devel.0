Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C3AEE49BF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:05:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2543.1693965942661167559
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132258441"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="132258441"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:05:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 12E97DB3CA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:05:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EB55D5EA3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:05:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEFD22007684B;
	Wed,  6 Sep 2023 11:05:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.8.0 -> 6.9.0
Date: Wed,  6 Sep 2023 10:05:29 +0800
Message-Id: <1693965929-15083-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLqQ7y0L2O/CY+3iMAHq4DX1wH2mQyCrBCZ7O
	GeBiKCu3G7P7y/fJ5KnCZLgPLq6HyUMPurjSUqirc6yg48CY4Q0LsPzwqBKsj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104764

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.8.0.bb => python3-web3_6.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.8.0.bb => python3-web3_6.9.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.9.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.9.0.bb
index 3b144e6fcc..92146696e0 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "5db6ed63bca526a5542d9a84778c8b549199009b9f71079ff53a7b82dadf0d0b"
+SRC_URI[sha256sum] = "cb454d0180e63ba1d83143dccf7c623581ba58e222edb006f48252d8a7b948e0"
 
 inherit pypi setuptools3
 
-- 
2.34.1



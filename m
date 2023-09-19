Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF51CD5498
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:49:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2558.1695109783160659371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120912332"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120912332"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:49:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1F28CD6DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:49:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0627CCFBA2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:49:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F4452FC6B2A;
	Tue, 19 Sep 2023 16:49:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.22.0 -> 2.23.0
Date: Tue, 19 Sep 2023 15:49:06 +0800
Message-Id: <1695109746-7892-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--0.109300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyXRiOSHPJchasU
	VUL5/1GebwhejA5B4kHT6WgEF6O/XxLmJd2F/yFuIVybEvvop47Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1FmsFE2oE4k37OR5qRmbMti4YRbbdPaA0DRzLGlmE72XBbWo2wJamSRUjO
	dkYl5L/CKylEBZ7i7LMCRoj61ISpeJMQblkcv7gBDlYzH+FaIxTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104986

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features
---------
 Add get_bq_config_path() to _cloud_sdk.py (9f52f66)
 Add get_bq_config_path() to _cloud_sdk.py (#1358) (9f52f66)

Bug Fixes
----------
 Expose universe domain in credentials (#1380) (8b8fce6)
 Make external_account resistant to string type 'expires_in' responses from non-compliant services (#1379) (01d3770)
 Missing ssj for impersonate cred (#1377) (7d453dc)
 Skip checking projectid on cred if env var is set (#1349) (a4135a3)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.22.0.bb => python3-google-auth_2.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.22.0.bb => python3-google-auth_2.23.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.23.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.23.0.bb
index 23def6c52c..f7fb76b3f6 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.23.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "164cba9af4e6e4e40c3a4f90a1a6c12ee56f14c0b4868d1ca91b32826ab334ce"
+SRC_URI[sha256sum] = "753a26312e6f1eaeec20bc6f2644a10926697da93446e1f8e24d6d32d45a922a"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



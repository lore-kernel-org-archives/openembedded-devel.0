Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C660EB64DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2284.1687157428740983818
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121337600"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121337600"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DFB81D3EC5
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:23 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33407CF7C7
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 641B82FC8442;
	Mon, 19 Jun 2023 15:50:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.19.1 -> 2.20.0
Date: Mon, 19 Jun 2023 14:48:18 +0800
Message-Id: <1687157308-17342-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-2.553400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyr1gUu9f1F/8+r
	UB0s9z9CwvXsHgPTL3fcyfM7nxF3TSxuH7Ew87wfA9lly13c/gH4g3OQ8ZO3RwfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcuyHytLwLdm1PtRpI7DQY9y9BnvblgPB5FQxP
	aNc7fhN6uAvCShP8l+cKpZdhCjQcjCZ4TXuezSol19/uzxy+1La7IxgwXHNav6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103369

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features
---------
    Add public API load_credentials_from_dict (#1326) (5467ad7)

Bug Fixes
---------
    Expiry in compute_engine.IDTokenCredentials (#1327) (56a6159), closes #1323
    Expiry in impersonated_credentials.IDTokenCredentials (#1330) (d1b887c)
    Invalid dev version identifiers in setup.py (#1322) (a9b8f12), closes #1321

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.19.1.bb => python3-google-auth_2.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.19.1.bb => python3-google-auth_2.20.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.20.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.19.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.20.0.bb
index 05757adfe..2127e4356 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.20.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a9cfa88b3e16196845e64a3658eb953992129d13ac7337b064c6546f77c17183"
+SRC_URI[sha256sum] = "030af34138909ccde0fbce611afc178f1d65d32fbff281f25738b1fe1c6f3eaa"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



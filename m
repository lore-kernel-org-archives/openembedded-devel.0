Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8C5C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:47:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.152107.1692150417441273338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128322717"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128322717"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:46:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 766E3D3EB2
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:46:52 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BA234D5E89
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:46:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D32EB86ADA;
	Wed, 16 Aug 2023 10:46:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rdflib: upgrade 6.3.2 -> 7.0.0
Date: Wed, 16 Aug 2023 09:46:16 +0800
Message-Id: <1692150376-5784-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10-3.581100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJZUipC+zHNir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Hf7mdD84mFnYPp
	eF4FI8ipbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4rmc
	JHZrH07c5FOGhF7+EecmdvNH+09ux6pnfBinne64v0p8aLLRpFQPieAdR7dwbS8/QPGjoIj5ImF
	bdfEYQgez3HBm9FS+WCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104396

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/RDFLib/rdflib/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rdflib_6.3.2.bb => python3-rdflib_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.3.2.bb => python3-rdflib_7.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
index 1b4bb5a40e..952c210116 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
 
-SRC_URI[sha256sum] = "72af591ff704f4caacea7ecc0c5a9056b8553e0489dd4f35a9bc52dbd41522e0"
+SRC_URI[sha256sum] = "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8c84e0d0036e995ae"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53460C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:13:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6308.1692864822234130136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117554942"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117554942"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:13:40 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E6EC5CA1EB
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:13:37 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 22428D9496
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:13:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B38F87878;
	Thu, 24 Aug 2023 17:13:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.96.0 -> 2.97.0
Date: Thu, 24 Aug 2023 16:13:19 +0800
Message-Id: <1692864799-2579-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.005
X-TMASE-Result: 10-0.228100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xKTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbRpDS92omiP1QvEWlakG/UZD1Wow1J/713LMKsKkVJPA7RYlJFES3aCuq8RK0fnWfG2E/
	PKOlFhZtconibsvT/ZcTK31QF08+PIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104571

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/releases/tag/v2.97.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.96.0.bb => python3-google-api-python-client_2.97.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.96.0.bb => python3-google-api-python-client_2.97.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.96.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.97.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.96.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.97.0.bb
index 442237ec78..1ee9f5bdba 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.96.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.97.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f712373d03d338af57b9f5fe98c91f4b5baaa8765469b015bc623c4681c5bd51"
+SRC_URI[sha256sum] = "48277291894876a1ca7ed4127e055e81f81e6343ced1b544a7200ae2c119dcd7"
 
 inherit pypi setuptools3
 
-- 
2.34.1



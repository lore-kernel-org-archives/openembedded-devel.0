Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A00C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:31:15 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13846.1700634666183634894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119925687"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119925687"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:31:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 25125E6881
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:31:02 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 586A8BDC8A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:31:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2791C2FC843A;
	Wed, 22 Nov 2023 15:31:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pastedeploy: upgrade 3.0.1 -> 3.1.0
Date: Wed, 22 Nov 2023 14:30:19 +0800
Message-Id: <1700634619-8139-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--0.213600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyueDr/Y+Fuko76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzXLUrZreQ8MKO4u
	vDw0HBXssoH2zsPFeOyF3Di7QWJ5+/6lnRxzkwTubXqF9gFfFZSqKDcn7N3iikjiydUj6Z1puEX
	TB5zhRAiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107001

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix python_requires package metadata to support Python 3.7+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pastedeploy_3.0.1.bb => python3-pastedeploy_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pastedeploy_3.0.1.bb => python3-pastedeploy_3.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pastedeploy_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index cb10dd98d..27f32bf1a 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
 inherit pypi
 PYPI_PACKAGE = "PasteDeploy"
 
-SRC_URI[sha256sum] = "5f4b4d5fddd39b8947ea727161e366bf55b90efc60a4d1dd7976b9031d0b4e5f"
+SRC_URI[sha256sum] = "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed418b6a7ff6a095a95"
 
 S = "${WORKDIR}/PasteDeploy-${PV}"
 
-- 
2.34.1



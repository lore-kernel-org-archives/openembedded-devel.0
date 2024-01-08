Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D615C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:46:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.6926.1704721605607592640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145456325"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145456325"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:46:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A86DD2A02
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:46:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 783E8D4C1B
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:46:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01C976BEE0
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:46:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4D2B1A0072;
	Mon,  8 Jan 2024 21:46:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.111.0 -> 2.112.0
Date: Mon,  8 Jan 2024 21:45:24 +0800
Message-Id: <1704721524-30691-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6u9s
	s9AcXCng92MuuTgwCBaMl7MhTfjxC0aQ904ZJ/i1oSedi1ABoLM8CLPJFCVDRDb9S/zxGxkpesH
	D91sB7jcV8qdAiU+1aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108154

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.112.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.111.0.bb => python3-google-api-python-client_2.112.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.111.0.bb => python3-google-api-python-client_2.112.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.111.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.112.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.111.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.112.0.bb
index 89613516e..b1614b854 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.111.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.112.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3a45a53c031478d1c82c7162dd25c9a965247bca6bd438af0838a9d9b8219405"
+SRC_URI[sha256sum] = "c3bcb5fd70d57f4c94b30c0dbeade53c216febfbf1d771eeb1a2fa74bd0d6756"
 
 inherit pypi setuptools3
 
-- 
2.34.1



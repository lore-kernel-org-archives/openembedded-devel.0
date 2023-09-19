Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9A6CD5496
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:48:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2554.1695109737923979768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="112056808"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="112056808"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:48:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 732FACA1ED
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:48:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A465E15320
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:48:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BB3420079116;
	Tue, 19 Sep 2023 16:48:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.97.0 -> 2.99.0
Date: Tue, 19 Sep 2023 15:48:32 +0800
Message-Id: <1695109712-7853-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5xn1
	8PawHBPzwr8QYbAmpjWMME96voF+BPGe0MxBL+q5b6EOWoa6KPMg34yneUSvjytA3BQ5Y59bG/U
	AhwB9+35BQcgFWH3/uCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104985

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.99.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.97.0.bb => python3-google-api-python-client_2.99.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.97.0.bb => python3-google-api-python-client_2.99.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.97.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.99.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.97.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.99.0.bb
index 1ee9f5bdba..def02dee7c 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.97.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.99.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "48277291894876a1ca7ed4127e055e81f81e6343ced1b544a7200ae2c119dcd7"
+SRC_URI[sha256sum] = "e733fd0f2c8793b1a000d5e69ac81b1b9ec0665b445b7ed83bdbbb0038973306"
 
 inherit pypi setuptools3
 
-- 
2.34.1



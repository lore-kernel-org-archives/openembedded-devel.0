Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D5BC001DF
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2315.1687157422805220444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121324659"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121324659"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 30725DDC62
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:22 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F703D4BF5
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 845032FC8442;
	Mon, 19 Jun 2023 15:50:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.11.0 -> 2.11.1
Date: Mon, 19 Jun 2023 14:48:15 +0800
Message-Id: <1687157308-17342-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-0.742800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yYL5ja7E+OhyF4r8H5YrEqzqFRQsrMdGBCLm
	4/WzmuzLPhlGT3eI3qxnvY9hxB9vc6JEq6b8z4ap/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNc8a24tZSZIcQYxpSUCFkbLBISOHXaDXoFO3PyvsNHK33K5h0LsPBxJqF2eLsSbmo2GaZ
	Kgjy4QXKoeVNcj2Aezaf/KSYDZ33pltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103365

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
==========
 Add actionable errors for GCE long running operations
 Invalid dev version identifiers in setup.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.11.0.bb => python3-google-api-core_2.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.11.0.bb => python3-google-api-core_2.11.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.11.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
index 439358d05..8ac34e639 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4b9bb5d5a380a0befa0573b302651b8a9a89262c1730e37bf423cec511804c22"
+SRC_URI[sha256sum] = "25d29e05a0058ed5f19c61c0a78b1b53adea4d9364b464d014fbda941f6d1c9a"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2762CC10F19
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.691.1689654381913818393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111105"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111105"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:20 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70E49CA1F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A2DA5D8B86
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 158A9200854E2;
	Tue, 18 Jul 2023 13:26:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.172 -> 2.4.173
Date: Tue, 18 Jul 2023 12:25:37 +0800
Message-Id: <1689654348-30702-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--4.100700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mryqyllX6UJIu5Kntb4FrAoPP4
	CrImNN3D4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLn22EcSrQBnaBl62lPHvgXFfViMFFmQDLdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtwQJpPbw+6Yt2OwJ+wERTSMx/lztM8v8eAsFQtr/CJiBrqW+Ai9U8s0ZsT
	GncGwsAHwEKd2bwNILtZJT+wGqOGsd41ThSABAPHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103927

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Maybe fixing a CakePHP issue.
- Use proper endpoint to unpublish event.
- Feat: introduce setter for galaxies.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.172.bb => python3-pymisp_2.4.173.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.172.bb => python3-pymisp_2.4.173.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
index 59ddac388d..10cc52a7e9 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "7d1d8b6f38f210b28934a206f9c1470542e9da7e"
+SRCREV = "ccae32ae716c143bea09954e860238e193bc78c6"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1



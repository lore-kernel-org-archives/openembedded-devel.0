Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850BFCD549E
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:55:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2698.1695110132066578437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132746949"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132746949"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:55:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3824DDB4D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:55:27 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 80647D5E9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:55:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DF2786F10;
	Tue, 19 Sep 2023 16:55:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.11.1 -> 4.11.3
Date: Tue, 19 Sep 2023 15:54:41 +0800
Message-Id: <1695110081-8168-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10-1.455900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyta2pCpL+NfM76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDVtKL
	+3JtVWXjKnODIvV2EryD3ck57qSOe+1pxdHS6IbKVsxfHHK6jcEOP/BzG/oPYIowFTuJ02ptGK1
	rg2Tqnjp/cPQofs7ov87Nf3vaFHKFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
docs(plugin): explain plugin registration
Fix error caused by a bad base_python path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.11.1.bb => python3-tox_4.11.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.11.1.bb => python3-tox_4.11.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.11.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.11.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.11.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.11.3.bb
index bbb77e713d..be42c4b6f6 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.11.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "8a8cc94b7269f8e43dfc636eff2da4b33a199a4e575b5b086cc51aae24ac4262"
+SRC_URI[sha256sum] = "5039f68276461fae6a9452a3b2c7295798f00a0e92edcd9a3b78ba1a73577951"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



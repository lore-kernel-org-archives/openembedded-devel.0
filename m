Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95200EE49B2
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:05:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2588.1693965923200933558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130905371"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130905371"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:05:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47B9FD29E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:05:19 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 744432800B
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:05:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 306FB2FC03EE;
	Wed,  6 Sep 2023 11:05:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.3 -> 20.24.4
Date: Wed,  6 Sep 2023 10:05:07 +0800
Message-Id: <1693965907-15047-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-1.357700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysRf1Efw/TWTb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Kzv
	NcCYzPJ97lFMSIRLuE8fclDiZOR1ZTXFsv4uM1CGTcH5/CF8G7oE1V0oZpLIIj9now3mmebC5oC
	nKhaNALetS2+t7jpMqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104763

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix typo found by codespell
Updating extend.rst typo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.24.3.bb => python3-virtualenv_20.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.3.bb => python3-virtualenv_20.24.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.3.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.4.bb
index 874a022f53..889c73b2f1 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "e5c3b4ce817b0b328af041506a2a299418c98747c4b1e68cb7527e74ced23efc"
+SRC_URI[sha256sum] = "772b05bfda7ed3b8ecd16021ca9716273ad9f4467c801f27e83ac73430246dca"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



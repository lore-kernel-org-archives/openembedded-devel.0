Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33D5C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:51:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.151945.1692150660252695411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="115967252"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="115967252"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:50:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26342CD7E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:56 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 590F7D6150
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6914486E22;
	Wed, 16 Aug 2023 10:50:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-yamlloader: upgrade 1.2.2 -> 1.3.2
Date: Wed, 16 Aug 2023 09:50:34 +0800
Message-Id: <1692150634-6024-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--0.907300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrRUYppGmT91eYOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w630W
	AOExMRNlo9SEwAnt9MbzHn4xb0OQXBx2FxcgLCqobmIsuMoD5Dy1KQ2Z2eOjSS2TdqTrBsP+4KW
	zediBpzKKAYl6U37r6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104402

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Python 3.11 upgrade, drop 3.7 (use old version < 1.3 if desired in Python 3.7)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-yamlloader_1.2.2.bb => python3-yamlloader_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.2.2.bb => python3-yamlloader_1.3.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
index 9fdba49110..030ad8812a 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "35669fd7b9f8c6b38db861a51701542c42672b46e8ab63253486a8cb8377b687"
+SRC_URI[sha256sum] = "7dbd98421d8090c521655f1b06ca030067f29df5253a8878126bce3a90f56817"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



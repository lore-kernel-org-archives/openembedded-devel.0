Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F2FC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:49:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.28664.1701161375359101094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="141442099"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="141442099"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:49:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4980D9D8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:49:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC65ED947D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:49:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3134B20079102;
	Tue, 28 Nov 2023 17:49:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.6 -> 20.24.7
Date: Tue, 28 Nov 2023 16:47:29 +0800
Message-Id: <1701161249-28639-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10-0.282400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrXs5nqGvDCfPSCgqR50UUhb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5TQy
	7AspsjO2CT1PeQ7oRdslT39ekMErUJux40mZU8AQUVvSZ1/Mq/siXsgod8UWyzbniDj8u8eSlze
	N1iBKw+U2sVZtkY1ISCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107091

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Allow platformdirs v4
-Bump wheels package 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.24.6.bb => python3-virtualenv_20.24.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.6.bb => python3-virtualenv_20.24.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.7.bb
index aa11534f7..a4e5607e7 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "02ece4f56fbf939dbbc33c0715159951d6bf14aaf5457b092e4548e1382455af"
+SRC_URI[sha256sum] = "69050ffb42419c91f6c1284a7b24e0475d793447e35929b488bf6a0aade39353"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



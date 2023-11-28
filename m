Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C16C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:36:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.28487.1701160608433992326
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="140702857"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="140702857"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:36:46 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8553D64B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:36:43 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19686D9471
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:36:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5987D8418A;
	Tue, 28 Nov 2023 17:36:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pdm: upgrade 2.10.3 -> 2.10.4
Date: Tue, 28 Nov 2023 16:35:11 +0800
Message-Id: <1701160511-28280-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-0.026100-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrGiQ8GIEGP3+YDmJlthD81W2N
	lYzGZgQknxqDdiad/gtNZAP7qzzSA1romRa6X9R8A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf6WZ8G/zxUhNvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIGwPC/c/i0TMPurqSYz4kP/BcdKVjIFly/IG2/Wy2vRntrl
	rvjpI2ON2n8+kd02MueXvsKmqTGKj4+5XD51IzQ6Bj4J9AommBLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107083

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Do not detect as requirements.txt if the file is a python script.
-Provide information of the original line when parsing requirement fails.
-Resolve -r requirements paths relative to the requirement file they are specified 
-Updating package now overwrites the old files instead of removing before installing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.10.3.bb => python3-pdm_2.10.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.10.3.bb => python3-pdm_2.10.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.10.3.bb b/meta-python/recipes-devtools/python/python3-pdm_2.10.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.10.3.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.10.4.bb
index 54da38927..fffefb3c6 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.10.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "46dafc8a4fe268c46479876e52c6967f7a9aa385e1e574e64248670a37b358ff"
+SRC_URI[sha256sum] = "6dfd9d4cb59043edecb2d0b47d208e55d89d333ba7197deb05cca2dfbc7a4bfb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F9DC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:43:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.28470.1701160977419545347
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="142788506"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="142788506"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:42:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53A71C2138
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:42:53 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44A57BF499
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:42:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 34B142FC6F92;
	Tue, 28 Nov 2023 17:42:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.4.0 -> 3.5.0
Date: Tue, 28 Nov 2023 16:41:44 +0800
Message-Id: <1701160904-28487-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-0.977700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrqf/efKFN1nBQZ//SkC0u0r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtILgbJOZ434Bs1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w73af
	W3TDVxMQ2SXB30ISbAWKkZiI72c8wA/Q0DJ/v3lPN1G8xPVBJOCVZqIb1KS3D52qFaeRI9LKf/B
	eGO2oH6AjxOf2D6HHuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107088

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 #632: --dist=loadscope now sorts scopes by number of tests to assign largest scopes early 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.4.0.bb => python3-pytest-xdist_3.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.4.0.bb => python3-pytest-xdist_3.5.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.5.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.5.0.bb
index c3b84c70c..89b503957 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "3a94a931dd9e268e0b871a877d09fe2efb6175c2c23d60d56a6001359002b832"
+SRC_URI[sha256sum] = "cbb36f3d67e0c478baa57fa4edc8843887e0f6cfc42d677530a36d7472b32d8a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0ACEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:27 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4899.1688699661020337029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="124904190"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="124904190"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:18 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 615D6D50B5
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:16 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9460817CBC
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE3BE881D9;
	Fri,  7 Jul 2023 12:14:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.23.0 -> 20.23.1
Date: Fri,  7 Jul 2023 11:13:46 +0800
Message-Id: <1688699627-2519-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--2.202600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr/1vXbkGjWeVs1Ir4NZzFmnQi
	GZe0jWAMjDVMw6TJvuE7blYJVFl87+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt1ESbiE7ut2MgL9v6stI3zUNpsU1HwBE1t+VbLfXQYMvdL4R1QUQPZIAWW
	AoEjDh7gspqqvHcRk9qxpE5Arq1liN6kcoa6nBmHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103705

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
release 20.23.0
Bump pypa/gh-action-pypi-publish from 1.8.5 to 1.8.6
feat:update and simplify nushell activation
Fix deprecation warning
Replace unmaintained pytest-freezegun
Update cli_interface.rst
Add ruff, test latest OS and bump setuptools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.23.0.bb => python3-virtualenv_20.23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.23.0.bb => python3-virtualenv_20.23.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.23.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.23.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.23.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.23.1.bb
index 38487488a9..53771e2a27 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.23.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "a85caa554ced0c0afbd0d638e7e2d7b5f92d23478d05d17a76daeac8f279f924"
+SRC_URI[sha256sum] = "8ff19a38c1021c742148edc4f81cb43d7f8c6816d2ede2ab72af5b84c749ade1"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



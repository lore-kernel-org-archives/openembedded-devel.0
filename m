Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CD4C04A6A
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7505.1687850059217278055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101082642"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101082642"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:22 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FFB6C68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:20 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8472F852
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id F362888D20;
	Tue, 27 Jun 2023 16:14:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.4.1 -> 4.5
Date: Tue, 27 Jun 2023 15:12:14 +0800
Message-Id: <1687849939-19941-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--1.320600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrcV3n4J/0zUPHwEnu5JwrbUhC
	tyheYJgV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4Kzy
	JcndJeCDfUzWQYov6pQoIXH5QJSSPGF6YGTxdW1BiHhD+DvvNWh8Hn8M7+eJc2Qi7ygrJO1vSfV
	M6HlNzrb5957rqvbf6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103606

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Change macOS default configuration dir from ~/Library/Preferences to ~/Library/Application Support
 Simplify git command, by letting exceptions go through

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyscaffold_4.4.1.bb => python3-pyscaffold_4.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.4.1.bb => python3-pyscaffold_4.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.5.bb
index 8af13b6f2b..dda81e2256 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.5.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "4dbdb76c45ad860dfe64e00103c18a6279ce382ddd5a7f18651c129c5539a0ab"
+SRC_URI[sha256sum] = "d849f9a2e15bdcf165e19f96835f0b17e1a2d59d4c561c445b827a081de6d262"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.34.1



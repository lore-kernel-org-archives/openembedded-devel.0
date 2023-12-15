Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9782C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:29:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.45867.1702600136561053942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143671441"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143671441"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:28:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DA7ED9DAD
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:28:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B92CD67A7
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:28:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E34D2FC5B42;
	Fri, 15 Dec 2023 09:28:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.11.3 -> 6.12.0
Date: Fri, 15 Dec 2023 08:28:33 +0800
Message-Id: <1702600113-1864-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--8.194500-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrXKb6k/oWKMI7TItwyO7eH3MW
	fmr8UEU8rd40lCgJPQiCKarLrS+KiuimkKfNjSYcRU4X3Mu13Ixb4dXBMpIkhswHSQ+yXjTDoHy
	0bASrKBp4asfCviMWduqu92XH6Oia0iQCu+T0AFkdZEkR8Y/meQwMqNovfwOolPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDdyBRU/cKn69EITY2UGMiNwpeqaZhManGJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetsgO3bswsOnS3QfwsVk0UbtuRXh7bFKB7uIa35fbHfHrftb6
	xpV2iLUx/CX/4xkF7E2xJH4I9JE5lExlQIQeRG0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107476

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Make downloadable versions of docs available in pdf, htmlzip, and epub formats
-Add 2023 user survey fine art banner in the docs
-Polish the community resources docs page
-Implement createAccessList RPC endpoint to create an EIP-2930 access list.
-Run flaky eth-tester tests on CI
-Pin pytest-asyncio dependency to <0.23
-Fix collision of w3 variable when initializing contract with function of the same name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.11.3.bb => python3-web3_6.12.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.11.3.bb => python3-web3_6.12.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb b/meta-python/recipes-devtools/python/python3-web3_6.12.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.12.0.bb
index 2c7aca9ba..f0f126508 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.12.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "f9bec9d2339bf649fe25293435a5c897a4b035aa96d6c33670ed467acf59dbe7"
+SRC_URI[sha256sum] = "81a68519ff4416eee7f16d4dbc498e70deb90908c7c1d7bebc950e5f3d1f29d5"
 
 inherit pypi setuptools3
 
-- 
2.34.1



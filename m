Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B82C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:25:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.116202.1698049504906298489
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137213749"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137213749"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:25:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51C24CD7E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:25:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 85AD3D88A7
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:24:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEDB82005932A;
	Mon, 23 Oct 2023 17:24:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-abi: upgrade 3.0.1 -> 4.2.1
Date: Mon, 23 Oct 2023 16:24:41 +0800
Message-Id: <1698049481-24759-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-0.932700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/ySAWHOR37+ATcDzcoONn/M6UoooDQSUSrb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6vV7
	hgOgszbyWzDngrKTpbm8n8ksp/HTCN1lMvGsGtNZ6L8YcnhjxUnbkkpLffsEnsE9wWgYHdXQVY/
	pT4c+vq3/YyKHXO9pSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105645

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2023.

Changelog:
 https://github.com/ethereum/eth-abi/blob/master/docs/release_notes.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-abi_3.0.1.bb => python3-eth-abi_4.2.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_3.0.1.bb => python3-eth-abi_4.2.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_3.0.1.bb b/meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-eth-abi_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb
index 3d8a67ba56..c01860acd7 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python utilities for working with Ethereum ABI definitions, especiall
 HOMEPAGE = "https://github.com/ethereum/eth-abi"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=731f4de9c79bfeba6d8d55f83d0d2423"
 
-SRC_URI[sha256sum] = "c3872e3ac1e9ef3f8c6599aaca4ee536d536eefca63a6892ab937f0560edb656"
+SRC_URI[sha256sum] = "60d88788d53725794cdb07c0f0bb0df2a31a6e1ad19644313fe6117ac24eeeb0"
 
 PYPI_PACKAGE = "eth_abi"
 
-- 
2.34.1



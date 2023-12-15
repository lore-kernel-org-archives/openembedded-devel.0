Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9F4C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:17:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.45645.1702599437037760193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131430490"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131430490"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:17:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AD10DD624B
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:17:12 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9C30D2BA9
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:17:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D29DC2FC5B42;
	Fri, 15 Dec 2023 09:17:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-rlp: upgrade 0.3.0 -> 1.0.0
Date: Fri, 15 Dec 2023 08:16:53 +0800
Message-Id: <1702599413-1539-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--2.041300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyohlnMbn2V9FE5
	i6jtS+HHraob308tFze8hLStuBxCuuxuEpSKm2TEA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRpsoDCmkF1K5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkgsJLFSlpXdxgnvyh50Shf07jxFYGOnMkaSGs
	yT1jtnnNDVtr3jGtrIQVbgIYY5+dIc4tJlQVRU69Yvczlb6PmugUznXu7tpzEu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107469

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Drop python 3.7 support
-Add python 3.11 support
-Merge updates from template, including use pre-commit for linting, and
 changing the name of the master branch to main

License-Update: Copyright year updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-rlp_0.3.0.bb => python3-eth-rlp_1.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-rlp_0.3.0.bb => python3-eth-rlp_1.0.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-rlp_1.0.0.bb
index d19a65755..5cd0d0544 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "RLP definitions for common Ethereum objects in Python"
 HOMEPAGE = "https://github.com/ethereum/eth-rlp"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "f3263b548df718855d9a8dbd754473f383c0efc82914b0b849572ce3e06e71a6"
+SRC_URI[sha256sum] = "a988d713a36452e7c6da71186798343f687eaf3aeb7f99266750dd9e1f754c7b"
 
 inherit pypi setuptools3
 
-- 
2.34.1



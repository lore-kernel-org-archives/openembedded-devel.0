Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE38CF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.48965.1727682246012878576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rePYHWRW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682247; x=1759218247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=P7pJfw+xr/iMvT3a40A0vp5V4GPds74nTnxE+LMNdRE=;
  b=rePYHWRWXhVm1wJkP5jRraMtb/bwBDOBsm693U84q+caSCB+Rm7mijs8
   tn6HQ5Dx6xwTvkse6T+iWT2sqslIl4RZBOZCY+PWhezZ8mx8ilRovnViz
   T+ngACP2qum19nPukkN6gmcdrJjnSzPSP2P6DY+UdrejeHuYDDqZnVIg6
   He5LX2g8hjlftWZwLZ2hD8+EhCTVY8FMha8O0hKX1CfrVYW+PWCtUQWOL
   JSboZqUsSLJ+4ZqRIKGVgqR33IxrvT3DcZ/yfcdekTilgaop2UttejcFX
   BCTftb1Cu9pvO9Dawbk+szyeqE8bKK55/yu6MVY2zGsCj0WnWgcvNuHY0
   w==;
X-CSE-ConnectionGUID: tdqqfcthRxGsfwuC255c4g==
X-CSE-MsgGUID: oST/plxgQBuCpcsQPvD1uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602104"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602104"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 382C1D5A48
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74834CFBBD
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D37282007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8582B1A000A;
	Mon, 30 Sep 2024 15:44:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/40] python3-web3: upgrade 6.20.1 -> 7.3.0
Date: Mon, 30 Sep 2024 15:43:00 +0800
Message-Id: <1727682185-12664-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-2.490700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yVK9xlSOuRoW3oMN+MARa6nQarzCEH4/6lpN
	bXTsWM8c4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzYk9rALxzSz0BwX
	hQboNFrDUszUM0Laz++SF666Yycy4FIoDhroGk5ZWBiSDOzdkA7yfjTNLu0ISYvmLX4lBr4V0Rc
	xUWIk09iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112595

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: merge template, fill vars, lint

Changelog:
 https://github.com/ethereum/web3.py/blob/v7.3.0/docs/release_notes.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.20.1.bb => python3-web3_7.3.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.20.1.bb => python3-web3_7.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.20.1.bb b/meta-python/recipes-devtools/python/python3-web3_7.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-web3_6.20.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.3.0.bb
index b3487b6d8..b0b67dfac 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.3.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A Python library for interacting with Ethereum."
 HOMEPAGE = "https://github.com/ethereum/web3.py"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c8694da5a97575618474d9caf8c812da"
 
-SRC_URI[sha256sum] = "a29bc1863734e1c05f128ddbc56878f299ea71776806e667b581a83b5d5be0ed"
+SRC_URI[sha256sum] = "74d52cfcc23b8e99c837190128b932923f38fca290ae2cf2d690edbf622252a0"
 
 inherit pypi setuptools3
 
-- 
2.34.1



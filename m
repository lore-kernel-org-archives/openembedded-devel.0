Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3ACCC02192
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.32746.1737360862049576996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=js+IbsRe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V41oZATogJaAOPk7OEhO7Mp1n2pMsvuk0n1noPitxng=;
  b=js+IbsRe//bJuy+fQf2EcfQqG8Z8NDjrPyGHfVGI/FzzgvpRdu3giIGQ
   3/hQRJsXT830n8XG8zQLq58WW9yNLPCUofcE/SeDOwV2MnuZFru3IZa+L
   dcHJxJtC4kuht0Q8vb2mFqYDHZw42ipGFZS+6Yrlck26GrePwMpRpRFjH
   LJQT9t4Pdvw+Lc2hUcmXS42r7GtN/5otyp2KODsPSoszeKSfYyq22nC7t
   W+AK8nLkiU/B0NKi5ELsfW7YOSuumfMwLfyPoWPkJwLb0EcUW9qWfJm0p
   bxWBF8frwzatAPUp3uuVOTX7hB5DDGUHimmqCBoIh4HiK5ozMj1vk0JN0
   Q==;
X-CSE-ConnectionGUID: 7QdBuNfvT7e2oRUzYAOdDg==
X-CSE-MsgGUID: 4S8SxpHWQLivPzKZ6m4nqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="166587903"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="166587903"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D78B7E076B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AEF76D5077
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4318C6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4B921A0074;
	Mon, 20 Jan 2025 16:14:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/32] python3-eth-abi: upgrade 5.1.0 -> 5.2.0
Date: Mon, 20 Jan 2025 16:13:53 +0800
Message-Id: <1737360846-4824-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--1.079400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhA88
	0Lzc32ISX9t4w91/vrbuNT8xdcEnQyR+hpBHvIiqsDpn40N9M3lUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw7cgUVP3Cp+vRCE2NlBjIjcXwSgW5EYVHWNp9
	wlZtMgueLzNWBegCW2wgn7iDBesS0nRE+fI6etkqpcgQcd3P5uYFbwo4e3dPs070yhXzIO31HCv
	huKwbuVaameYqLVTYXx0GNo0oBcMYlIRMUuegFxBKHpzTitIfVKmhtJJXVaFUu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114981

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
===========
- Merge template, adding py313 support, replace bumpversion with bump-my-version, raise required hypothesis versions.
- Merge template, fixing docs CI and other various updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-abi_5.1.0.bb => python3-eth-abi_5.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_5.1.0.bb => python3-eth-abi_5.2.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
index 29b96005ee..e1459653ea 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python utilities for working with Ethereum ABI definitions, especiall
 HOMEPAGE = "https://github.com/ethereum/eth-abi"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=731f4de9c79bfeba6d8d55f83d0d2423"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b6a85414b7d058ab1c58e11611c21b2"
 
-SRC_URI[sha256sum] = "33ddd756206e90f7ddff1330cc8cac4aa411a824fe779314a0a52abea2c8fc14"
+SRC_URI[sha256sum] = "178703fa98c07d8eecd5ae569e7e8d159e493ebb6eeb534a8fe973fbc4e40ef0"
 
 PYPI_PACKAGE = "eth_abi"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



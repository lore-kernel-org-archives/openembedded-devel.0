Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72006C2BBCA
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2493.1718161130528599590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K3upj4zr;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161131; x=1749697131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t21MwdSqEzOgahIPA3lj+3GHszemQdi1MhCLdLFsW8Y=;
  b=K3upj4zrC0Ta2PzTGBXhQcuHUubxrpXtwIWsUPi8mYnbMg+Yr5en4+ah
   j5l+tBCFabSpMLxcefKk+v7dRxXt5yA8y/mWvc0WS+QiRpQPR/2GKxXv/
   XSz5Lni88XaGHwfLpkFGsdmGvdy2GfpTjr0WWkkJNj5EkHtwg7VWhk8iZ
   w5N+8OazxHKDb0a9/1fi03BZCAXvbUUCMRS9jOtHPqi3xsaoFAIdxD3pR
   P4+2EgtuolrIYdSyVoPRrT0fgXMIvbE0KFP+IRIHh/U44ULVVp7MhGyfM
   KmjRWsmtVZqchAIfhxYquavFfAiYFFGu103PFmtVWORuWDZxv0Nv+1y3t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141617829"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141617829"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AE30D801D
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9976EBF3FF
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3424720071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A02F01A000C;
	Wed, 12 Jun 2024 10:58:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/43] python3-snagboot: upgrade 1.2 -> 1.3
Date: Wed, 12 Jun 2024 10:58:04 +0800
Message-Id: <1718161096-29710-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.689200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr19HxM7JKfzCDKIMJb+j2aAjJ
	lierVE/nvQrOFwtemmEX+T5/+efOjR1YpEPWJiyzP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6o1nTPm+8HXV1wBHAYFTVNwW0i719Lv565x7uAXGEprZiQDIJsDspXmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1zLYFIXTGSwLeZhDEvzLWq2Bv0hTgHTvgunZbA5p07LT710HRXvOld72NV
	X7CBcqnZM5g4GiUw+CuP1Q6XTaefaOjxkdtxyuoqgQYbcz5U7JTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110868

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
treewide:
----------
support passing USB paths (e.g. 3-1.2) to snagboot instead of
vid:pid addresses

i.MX:
-------
Drop libhidapi dependency and add custom HID implementation
Add support for i.MX53 SoCs

AM335x:
-------
Improve POSIX compliance of setup script and make it compatible
with Fish shell

AM62x:
--------
Update recovery flow for newer versions of U-Boot
Add board template for phyBOARD-Lyra

snagflash:
----------
Handle "continue" command gracefully
Generalize handling of command parameters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_1.2.bb => python3-snagboot_1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_1.2.bb => python3-snagboot_1.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.2.bb b/meta-python/recipes-devtools/python/python3-snagboot_1.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_1.2.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_1.3.bb
index 57a3280de..5ed5169ae 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_1.3.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "3d5cdd5ffe7355deba27657e6f45d45538a398f92215d219a8cfd6e716f67c34"
+SRC_URI[sha256sum] = "b9d781bdc79d92d940e27d89d3025eab6dc459087dad126766e2bf76dc9dddee"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



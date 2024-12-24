Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA48C02187
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.30507.1735032443754317723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qhKkC97X;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oPDQOpHNS2mV7kUiW3QdJZcd1o+SUg98xgwq+MaNGhw=;
  b=qhKkC97XeUdmIdk7WOXuTmNFw4X47OR0ZMPM6AwQCKIvFaA54yJ47avD
   3enxg9zGwemzV4uaZZETl+fJG/TH5nabtaOtH1a5Ve+6CRy+N1DLPpM2m
   0vRQUN5zGIz7ZT3D5USeA/opMKQoRzekhnhIQsZJMLjdk2TygEDpbmsek
   xY11pWucVqOMtKq7KhXOgl3Hn6qEMNlRrpbxMlaBR0v9BDooqftGbERNg
   CQtAmfVOWTRgbkhEapCT0dqCCyPYz5NLVwM8yC4nze2vxk9OHtWcaHzn4
   PtV92beKQj6R/yv/LfMwC0czFgan8lUrjR5rig+5hH48LApJYt5RK4Tnz
   g==;
X-CSE-ConnectionGUID: F1n3ghv1ScuqTnEEB5316g==
X-CSE-MsgGUID: UQC0JmcUQwKuJybATGTa9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="173157098"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="173157098"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:21 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 35345D4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B742D3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C54E6BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 62BAA1A0073;
	Tue, 24 Dec 2024 17:27:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/67] python3-eth-utils: upgrade 5.0.0 -> 5.1.0
Date: Tue, 24 Dec 2024 17:26:16 +0800
Message-Id: <1735032421-13513-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--1.281500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrCluvHiJ2f4VUjspoiX02F+Bd
	RKvQ909j6zBPuCbw++lKtne3LfonHVaBvJpACoM8A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf3PhwfmFb3pg7Cl8sx4HBG+EpCHUsKYYGmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1UN5t7GlgT5vYW3ShX0I7lpMe3fiFpR653xNNQhaYzS60zMuxaZCmpCm1z
	KBO83mvdGSCOnkYxA7ISTuotvYHF44s9ML6f/PWBDlYzH+FaIxTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114497

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bugfixes
----------
- Correct error message in "from_wei" and "to_wei"
- Remove unused hexbytes dependency that is causing a cyclic dependency issue

Features
----------
- Removed "_BaseHasLogger" and "_BaseHasExtendedDebugLogger", and the "logger"
  attribute in the "HasLogger" and "HasExtendedDebugLogger" is type hinted directly.
- Add new humanize_hexstr function
- Add "memoryview" to accepted input type for "to_hex" , "to_int" , "to_bytes" , and "to_text"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_5.0.0.bb => python3-eth-utils_5.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_5.0.0.bb => python3-eth-utils_5.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_5.1.0.bb
index f57a83132d..6561e7cf65 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "a5eb9555f43f4579eb83cb84f9dda9f3d6663bbd4a5a6b693f8d35045f305a1f"
+SRC_URI[sha256sum] = "84c6314b9cf1fcd526107464bbf487e3f87097a2e753360d5ed319f7d42e3f20"
 
 PYPI_PACKAGE = "eth_utils"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



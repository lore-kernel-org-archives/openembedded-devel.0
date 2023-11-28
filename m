Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF83C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:29:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.28368.1701160147047663387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120643072"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120643072"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:29:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45F29D772E
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:29:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 813ABF931
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:29:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B4EAB2005019B;
	Tue, 28 Nov 2023 17:29:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.1.2 -> 4.1.3
Date: Tue, 28 Nov 2023 16:25:53 +0800
Message-Id: <1701159953-28050-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10-2.208900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMVx/3ZYby786FHRWx2FGsL3+
	LeooTp2MayDsErw/KBg+wIF4H6NKm8RBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsLnNnmjezCQeOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtU1jw8wzbuCr77QHi6RIod4uulEvwTpgOVzTLT9M1LKK2LFcFlr0sC/SgL
	C/RENpjFGwcYr40JILoekCsinRNpjk03k/QHQngHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107078

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Removed a couple of files that accidentally got included in the previous release.
-The 8-bit float formats have been renamed 'e4m3float' and 'e5m2float'.
-Some refactoring and performance optimizations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.1.2.bb => python3-bitstring_4.1.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.2.bb => python3-bitstring_4.1.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.2.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
index 7a049733b..8831d84cb 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf"
+SRC_URI[sha256sum] = "1b47c84644a961ba8503db2bba8a5965ab53e81474becdf0a18383b5b5f3f795"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1



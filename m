Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5893C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:13:26 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2569.1700122403602564825
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="140026958"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="140026958"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:13:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DB137D63C5
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:13:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 32933E0C26
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:13:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70F4F40E91;
	Thu, 16 Nov 2023 17:13:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.12.0 -> 2.14.0
Date: Thu, 16 Nov 2023 16:10:51 +0800
Message-Id: <1700122251-21927-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-0.775700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx7YhuCO/3iFfMI
	NXcIwLY+KqrQ7lLcMnygKELwwYMNFm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNTWVDuyOFO+x6I1mvcLFLpNQt5hUTy+nLpBJqwt+ueJZPTInYQNP25873XZHgoYwCLjid
	vSRMbT0zdoIVcHmZ2+cZI6TB07HPWJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106786

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add support for tuples to the marshaller
-Re-release since the previous release ran out of space on PyPI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.12.0.bb => python3-dbus-fast_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.12.0.bb => python3-dbus-fast_2.14.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.12.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.14.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.14.0.bb
index 05502e223..5ce05c383 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "849478e11d251fa4ebb99ce5bfee332cb6383c63ef0bc97bae23cef4e0badf9c"
+SRC_URI[sha256sum] = "91a88fea66b4e69ce73ac4c1ac04952c4fbd5e9b902400649013778a177129ea"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1



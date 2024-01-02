Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9707C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:06:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.24257.1704179158677119110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="124376339"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="124376339"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:05:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 62A2CD6186
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:05:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98309415A8
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:05:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2070D6BC4D
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:05:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B81801A0070;
	Tue,  2 Jan 2024 15:05:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-netaddr: upgrade 0.9.0 -> 0.10.0
Date: Tue,  2 Jan 2024 15:05:24 +0800
Message-Id: <1704179124-7972-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-1.086700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Aejl8XURi8fGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4rmc
	JHZrH07c5FOGhF7+EecmdvNH+09ux6pnfBinne6wTAW+ImQNyiOL3J0tMAQFgfdSql5qsXhVHHA
	z7gQuR5VAJlP+BZ39iCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://netaddr.readthedocs.io/en/latest/changes.html#release-0-10-0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-netaddr_0.9.0.bb => python3-netaddr_0.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.9.0.bb => python3-netaddr_0.10.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.10.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.10.0.bb
index 471d939a8..15350e942 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
 
-SRC_URI[sha256sum] = "7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f08baf5f1194da0128"
+SRC_URI[sha256sum] = "4c30c54adf4ea4318b3c055ea3d8c7f6554a50aa2cd8aea4605a23caa0b0229e"
 
 inherit pypi setuptools3
 
-- 
2.34.1



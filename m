Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AD4C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:49:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.6986.1704721772261122019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="147085980"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085980"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:49:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED02DD69D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:49:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2190030FB0
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:49:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A79F5202D4B5B
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:49:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5F0C81A0072;
	Mon,  8 Jan 2024 21:49:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-netaddr: upgrade 0.9.0 -> 0.10.1
Date: Mon,  8 Jan 2024 21:49:03 +0800
Message-Id: <1704721743-30824-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-1.086700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Aejl8XURi8fGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4rmc
	JHZrH07c5FOGhF7+EecmdvNH+09ux6pnfBinne67TnTHyn09RMtkvNMkgzQyuRBcbuKPwTKj34t
	O+tKYoNe4tpMT6g0ZKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108157

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://netaddr.readthedocs.io/en/latest/changes.html#release-0-10-1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-netaddr_0.9.0.bb => python3-netaddr_0.10.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.9.0.bb => python3-netaddr_0.10.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
index 471d939a8..ce16cc178 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
 
-SRC_URI[sha256sum] = "7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f08baf5f1194da0128"
+SRC_URI[sha256sum] = "f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf"
 
 inherit pypi setuptools3
 
-- 
2.34.1



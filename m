Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EB6C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:15:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2676.1700122513202282438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119252725"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119252725"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:15:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B442BD9DA5
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:15:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6939DA22A
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:15:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1887140B6E;
	Thu, 16 Nov 2023 17:15:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.3.0 -> 2.3.1
Date: Thu, 16 Nov 2023 16:13:58 +0800
Message-Id: <1700122438-22002-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--3.426200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr70GLyvzOg0xeGtGjUrjdVeze
	iquv6lvKOuzeNmOGKnPMWdWOCsSsggw8Nmue9wz3qoeab9Xgz88ejl8XURi8fJ7X/WkkrtTLvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLP71CYOC6hQvhj9i
	VPnLrR6V19xcFjDkroiPFlxr7T3C3OsdfiqWZJd/YA5Cx7DXSbnVXonDGVsZFnVCzcfZp3s1MBw
	1Ek82XOIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106788

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-ome users were experiencing encoding issues when parsing the networks json.
 Use UTF-8 explicitly.
-Fix character encoding issue
-Fix and add new test cases for invalid Network chain_id values.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_2.3.0.bb => python3-eth-utils_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.3.0.bb => python3-eth-utils_2.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.3.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.3.1.bb
index 627395502..1f641832f 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.3.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "085b42f5745f46d22a186fbd873d79f66a79171c02eccd78792d1dddd672f324"
+SRC_URI[sha256sum] = "56a969b0536d4969dcb27e580521de35abf2dbed8b1bf072b5c80770c4324e27"
 
 inherit pypi setuptools3
 
-- 
2.34.1



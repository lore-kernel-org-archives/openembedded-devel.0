Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B795BC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:29:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.1186.1705973334753494670
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="148607103"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="148607103"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:28:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B7591E7574
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:28:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2011D88AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:28:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EF022008FF8E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:28:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 15BB11A006A;
	Tue, 23 Jan 2024 09:28:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-keys: upgrade 0.4.0 -> 0.5.0
Date: Tue, 23 Jan 2024 09:28:30 +0800
Message-Id: <1705973310-25302-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--3.057300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jGdv
	IBM8UuLSw5EFSWH+vYgzqb+uToWtDDOfD6L6toKjlXePXNM4FjNUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi9M9Ngo2hsGSdVNZaI2n6/67YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSOTHMmrsCwJLm9j
	afnwbD/3NvvygmQbIUMoBU/io9LxIUZzNHemo6OB8Pj32wh8gFdYZQiZo9yL1YpZMMsSpbX/a65
	l+fqY0HsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108398

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
===========
-Drop python 3.6 and 3.7 support
-Add python 3.11 support
-Merge template updates, notably using pre-commit for linting and change the name of the master branch to main

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-keys_0.4.0.bb => python3-eth-keys_0.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-keys_0.4.0.bb => python3-eth-keys_0.5.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
index b0b1aad76..aabfff1b1 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A common API for Ethereum key operations with pluggable backends."
 HOMEPAGE = "https://github.com/ethereum/eth-keys"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "7d18887483bc9b8a3fdd8e32ddcb30044b9f08fcb24a380d93b6eee3a5bb3216"
+SRC_URI[sha256sum] = "a0abccb83f3d84322591a2c047a1e3aa52ea86b185fa3e82ce311d120ca2791e"
 
 inherit pypi setuptools3
 
-- 
2.34.1



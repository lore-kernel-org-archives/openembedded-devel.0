Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A023DC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:07:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2590.1700122063793007006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119251877"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119251877"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:07:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C7D8D4F5A
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:07:39 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 54769CF7E7
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:07:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 38AAA2FC703D;
	Thu, 16 Nov 2023 17:07:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-linux-procfs: upgrade 0.7.1 -> 0.7.3
Date: Thu, 16 Nov 2023 16:03:15 +0800
Message-Id: <1700121795-21735-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10--4.993300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yTiEPRj9j9rvcDzcoONn/M6hLh9e7qvSIgbo
	TDS3zulA+HFUiys+kAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3i2Lg
	EVfggSliqt0lGde+cdh8oz5BPysqkMzwe5s18okO5x7uAXGEprfOd2ImQcUyE6H7FUlmeuHyUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyv+GJsUvajjuSmBhEtkotcIXOb
	JgQL4fTWSrZuvqlXxl7RDAjAlg8CdMdQwqduWFkir7ZN+xhbCKqvUo1psbvq6Tncdp4zCmw/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106782

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Change the COPYING file for SPDX licenses

Changelog:
============
-python-linux-procfs: Remove specfiles and update version
-procfs/utilist/__init__/setup/bitmasklist_test/setup.py/: Added SPDX licence

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-linux-procfs_0.7.1.bb => python3-linux-procfs_0.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-linux-procfs_0.7.1.bb => python3-linux-procfs_0.7.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
index d51eecf97..8c53d38ce 100644
--- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Python classes to extract information from the Linux kernel /proc
 HOMEPAGE = "https://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git/"
 SECTION = "devel/python"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6855782848d572347212f667a2d637"
 
 SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git;branch=main"
-SRCREV = "7f43598387e44e2da93ead2e075b7232429e4cc4"
+SRCREV = "59ecd1ba018141a02ffe59c16a9346991dfd0d48"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



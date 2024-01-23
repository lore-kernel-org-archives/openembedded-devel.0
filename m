Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E0DC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:57:44 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.1756.1705975056221243903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126338573"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126338573"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:57:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48068D64AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:57:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8368AD5B4D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:57:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 12C2B6B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:57:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E82D1A006A;
	Tue, 23 Jan 2024 09:57:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.11.4 -> 4.12.1
Date: Tue, 23 Jan 2024 09:57:17 +0800
Message-Id: <1705975037-26354-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--0.175100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuYOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDX+Mt
	3AgL2cnbxzUbQnKdQ2RssR10WcGlfkOnoCPbDu+4UjBsOHOotrqwYDJiIhQq42SuAJrQCGLoicQ
	vc4ntUA3d9uZYi8teiqBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108423

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix tox version requirement in docs
-Fix Tox failing with --installpkg and multi testenvs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.11.4.bb => python3-tox_4.12.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.11.4.bb => python3-tox_4.12.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.11.4.bb b/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.11.4.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
index 62c15a7db..6d092c6ff 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.11.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "73a7240778fabf305aeb05ab8ea26e575e042ab5a18d71d0ed13e343a51d6ce1"
+SRC_URI[sha256sum] = "61aafbeff1bd8a5af84e54ef6e8402f53c6a6066d0782336171ddfbf5362122e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



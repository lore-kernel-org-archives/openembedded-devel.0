Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDAFC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:35:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.115986.1698050149759395188
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137215120"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137215120"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:35:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68934CA1E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:35:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F958D531C
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:35:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D74E26C9F5;
	Mon, 23 Oct 2023 17:35:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.27.5 -> 3.27.7
Date: Mon, 23 Oct 2023 16:35:30 +0800
Message-Id: <1698050130-25170-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--6.422800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeUpItvvrTT/t76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Bsce70VI2yoYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9EOwBXM346/+xNuWfAfdPVf/uDXX4adImG6ja1JC+d5IkuxD
	AU7cx61U+7q146Seda
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105655

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
bump cmake from 3.27.5 to 3.27.6
bump pypa/cibuildwheel from 2.16.1 to 2.16.2
update pre-commit hooks
bump ninja from 1.11.1 to 1.11.1.1
update pre-commit hooks
Update to CMake 3.27.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.27.5.bb => python3-cmake_3.27.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.27.5.bb => python3-cmake_3.27.7.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.27.5.bb b/meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.27.5.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb
index ad58c6d1d9..b613fd3a19 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.27.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "101d4e56154658c974e9425acd31f0fedde3ce68b47263fd14f789b028f8a13a"
+SRC_URI[sha256sum] = "9f4a7c7be2a25de5901f045618f41b833ea6c0f647115201d38e4fdf7e2815bc"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1



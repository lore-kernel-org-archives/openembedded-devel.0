Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97D5C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:42:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.152014.1692150118724827341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128237461"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128237461"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:41:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 53645DDC61
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:41:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BAC7D6165
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:41:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2676220050193;
	Wed, 16 Aug 2023 10:41:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.27.0 -> 3.27.2
Date: Wed, 16 Aug 2023 09:41:25 +0800
Message-Id: <1692150085-5362-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--6.422800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeUpItvvrTT/t76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Bsce70VI2yoYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9EOwBXM346/+zoJbYkz8Go8JplmTxk5M25PnRXWrxHxaniPI
	d8tJU3w0pMI1rgQpNh
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104385

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
chore(deps): bump cmake from 3.27.0 to 3.27.1
chore(deps): bump pypa/cibuildwheel from 2.14.1 to 2.15.0
chore(deps): update pre-commit hooks
Update to CMake 3.27.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.27.0.bb => python3-cmake_3.27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.27.0.bb => python3-cmake_3.27.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.27.0.bb b/meta-python/recipes-devtools/python/python3-cmake_3.27.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.27.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.27.2.bb
index 81116752f0..46a38cf9a8 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.27.2.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "d03f0a76a2b96805044ad1178b92aeeb5f695caa6776a32522bb5c430a55b4e8"
+SRC_URI[sha256sum] = "7cd6e2d7d5a1125f8c26c4f65214f8c942e3f276f98c16cb62ae382c35609f25"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1



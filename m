Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBA7C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:32:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2826.1700123532730491593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="118692137"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="118692137"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:32:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 11EA8E8D29
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:32:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47D27D94AB
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:32:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C8DA21BEA6;
	Thu, 16 Nov 2023 17:32:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.3.1 -> 3.4.0
Date: Thu, 16 Nov 2023 16:31:04 +0800
Message-Id: <1700123464-22460-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--0.851300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrNGC/UiT7n19GQgIVrmBL5Ala
	FzN4biirc5yKkanilhMNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7Oki
	GGidO7I9AYdLFXr37PgYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVd0RIAWGOy8GJrfK796K/b6B5cLS5uW9VCj/jQfujU9iHCCZuWrmT+GIn784p0H/tMH9
	jv2glW3SBHNfRyZ/SFIn002PlRLqwQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106799

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Wait for workers to finish reporting when test run stops early.
-Added support for Python 3.12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.3.1.bb => python3-pytest-xdist_3.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.3.1.bb => python3-pytest-xdist_3.4.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.4.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.4.0.bb
index 6001977a4..c3b84c70c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "d5ee0520eb1b7bcca50a60a518ab7a7707992812c578198f8b44fdfac78e8c93"
+SRC_URI[sha256sum] = "3a94a931dd9e268e0b871a877d09fe2efb6175c2c23d60d56a6001359002b832"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



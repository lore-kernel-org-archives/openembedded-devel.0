Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675DAC7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:17 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.6215.1684997896257249828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117405306"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117405306"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F770C68E5
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBDD31417B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6865C2007CA83;
	Thu, 25 May 2023 15:58:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.3.0 -> 3.3.1
Date: Thu, 25 May 2023 14:57:55 +0800
Message-Id: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-5.098100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yYL5ja7E+OhyqxxYRyql7kufDmnJjR2YuzuR
	oA1LVbPUHzwMMeL6eSK/eXR4hAC4pA407JLUrwByA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYlBuUGhpXEr25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0SyO81X3yak8yhd/uI/3WmzR+8JTIoYDNbQDd6icMEhznS+z
	Kb2Bvu9xLvHwFlTq28EYJ/I8qg78bZi480c9P102Tjy7akeQ+TVYRjjdCKoow==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102835

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
========
-#907: Avoid remote calls during startup as execnet by default does not ensure
 remote affinity with the main thread and might accidentally schedule the
 pytest worker into a non-main thread, which breaks numerous frameworks, for
 example asyncio, anyio, PyQt/PySide, etc.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.3.0.bb => python3-pytest-xdist_3.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.3.0.bb => python3-pytest-xdist_3.3.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.1.bb
index aa3606680..6001977a4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "d42c9efb388da35480878ef4b2993704c6cea800c8bafbe85a8cdc461baf0748"
+SRC_URI[sha256sum] = "d5ee0520eb1b7bcca50a60a518ab7a7707992812c578198f8b44fdfac78e8c93"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C22C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:16:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2685.1700122557674136925
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139691030"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139691030"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:15:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 63119D4F5B
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:15:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A185B21D48
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:15:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BE12140E91;
	Thu, 16 Nov 2023 17:15:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-geomet: upgrade 1.0.0 -> 1.1.0
Date: Thu, 16 Nov 2023 16:15:10 +0800
Message-Id: <1700122510-22059-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--0.515900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr5MBc083IM4RvJLFMcZQ57xYh
	VvZyLkyNXr7NXg/pSgTqrvdlx+jomv12TsqRMnfHOjf3A4DTYuGCJKEqkH7OTZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1oMLOoNHsM9kLixrsCJ1jTwSC6qIZ5nkmjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcuBjn9RtZ9UmsWAh6gCUGkvYNoDOWLiVoAgGV
	w+jyfntvmlrZQJ0GL6GdX+kMnI4SX+IbBjSaegLSGqYa2DvWy+UMimNOheorf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106789

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Move project metadata to pyproject.toml, modify build scripts
-pyproject.toml: include the full README.md as the readme contents
-Remove dependency on six
-Fix geojson to esrijson conversion with custom SRID
-Add explicit support for Python3.11
-docs: Simplify release process, make patch versioning more clear
-Add explicit support for Python3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-geomet_1.0.0.bb => python3-geomet_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-geomet_1.0.0.bb => python3-geomet_1.1.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-geomet_1.0.0.bb b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-geomet_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
index 84356cf6f..72b2bbcb7 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "cb52411978ee01ff104ab48f108d7333b14423ae7a15a65fee25b7d29b
 
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=master"
-SRCREV = "7fff4438510c30e592db858b2d519eddb5837a6c"
+SRCREV = "6ac73c312b52aca328db2e61d90c5e363b62639f"
 
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "geomet"
-- 
2.34.1



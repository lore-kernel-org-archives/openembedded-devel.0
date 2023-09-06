Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4B2CCFA17
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:01:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2436.1693965671247826332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130726696"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130726696"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:01:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BFF7CF1C0
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:01:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A959CD5EB2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:01:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31FD26B346;
	Wed,  6 Sep 2023 11:01:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-kiwisolver: upgrade 1.4.4 -> 1.4.5
Date: Wed,  6 Sep 2023 10:00:56 +0800
Message-Id: <1693965656-14595-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--3.897300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMot14c1CG8jk6Qbi+9i6D549
	w7RyUajuPdxLmQIs6AcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNTAyjrjtjWjkP1eXQBJPHvWMceV2tbmDU2aYZPy0eAP8emGnzo+C3EjaahU0IiUn3W8wQ
	NMsWAi4xox2UIFfnF97+iZMac6C3AQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104752

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
-implement exceptions in Python PR #162 This allows to expose in a natural
 manner the object relevant to the exception: constraint or edit_variable
-add missing signature of Constraint.violated for Python wrapper PR #166
-add support for Python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-kiwisolver_1.4.4.bb => python3-kiwisolver_1.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.4.bb => python3-kiwisolver_1.4.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.4.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb
index acc8bd5b6f..a1949b1138 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
 
-SRC_URI[sha256sum] = "d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955"
+SRC_URI[sha256sum] = "e57e563a57fb22a142da34f38acc2fc1a5c864bc29ca1517a88abc963e60d6ec"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



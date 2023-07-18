Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C18C16B13
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.737.1689654381427479985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124958078"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124958078"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7A1DC3F94
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C991CF7C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A57F020077821;
	Tue, 18 Jul 2023 13:26:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.23.1 -> 20.24.0
Date: Tue, 18 Jul 2023 12:25:40 +0800
Message-Id: <1689654348-30702-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--1.805300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvVbZFdXapsKSmU
	P9th0lnVUmd9UAGWwK0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNSoBv32SuKPVDXKtDboqq1Ppop1I9UxEArvrHkqMlFKhzj/iiGfvHzj/KFt4OOxKjazkP
	eaNfEbYhSUBK3AyICQuZsXRjenOd/K+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103930

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-release 20.23.1
-Fix the CI
-Quickstart guide
-Updated CLI documentation with config file name
-Exclude dependabot and pre-commit ci from release notes
-Export VIRTUAL_ENV_PROMPT in activation scripts (#2194)
-Upgrade setuptools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.23.1.bb => python3-virtualenv_20.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.23.1.bb => python3-virtualenv_20.24.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.23.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.23.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.0.bb
index 53771e2a27..8b849df31d 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "8ff19a38c1021c742148edc4f81cb43d7f8c6816d2ede2ab72af5b84c749ade1"
+SRC_URI[sha256sum] = "e2a7cef9da880d693b933db7654367754f14e20650dc60e8ee7385571f8593a3"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



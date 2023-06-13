Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E991C88CBF
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.3821.1686620448027044036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108574458"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108574458"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96E2AC53CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 89F69D4BEA
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DFCA820074724;
	Tue, 13 Jun 2023 10:40:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.0.8 -> 3.1.0
Date: Tue, 13 Jun 2023 09:40:08 +0800
Message-Id: <1686620422-29962-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-1.385600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrBpEC0DNwn/oHLsE/DpfB9/BU
	q5JsuvxSB35JUm0KMAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7U9a
	6zfLFA1bss9r//dw7twYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtoKwAJMWxgOfndDoqk1V6cZ03QXZ6UEI7kZGmN30AC7IOAxrRrTZlvE2G9
	jMuK4Bz6O7ifSJfOnVLr+iC0h03m3zMHMw7mF5oHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103237

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    setup.py -> pyproject.toml migration start (#427)
    Improve user install logic in activate-global-python-argcomplete (#437)
    Ensure Python 3.7 compatibility in check_console_script (#436)
    ZSH implementation fixes (#431, #433)
    Documentation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.0.8.bb => python3-argcomplete_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.0.8.bb => python3-argcomplete_3.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.0.8.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.0.8.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
index 19b513138..859ef7b10 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "b9ca96448e14fa459d7450a4ab5a22bbf9cee4ba7adddf03e65c398b5daeea28"
+SRC_URI[sha256sum] = "3a81445fa51c9875c36789ae5386d5e95c5c43d503963a0029a747aea74de1e3"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1



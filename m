Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF09AC25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:52:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.116173.1698051159632878258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138663051"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138663051"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:52:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8514DDC75
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:52:34 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E3C0BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:52:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 20CD8879A4;
	Mon, 23 Oct 2023 17:52:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.10.0 -> 3.11.0
Date: Mon, 23 Oct 2023 16:52:19 +0800
Message-Id: <1698051139-26019-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--0.905400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mre7Z0UyQO5TN4YeSlHZYFopYB
	p1O9i+OrmC+wH+KoDcpgRSO3u2jqi7BAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW74Xkcr5uQiOy1h1eUc+p685UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KsylTOw1nwXUEWACXg76WsbVX7qx1LBnvx7VL6Gqq3XLfe6oBdULVRfLtDP/plNzwJoDr
	TV86HuuiLr0G18M/2H9G0nr4yFSIPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105676

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
README: Fix CI badge
Fix documentation build
Add support for Homebrew-installed software

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-platformdirs_3.10.0.bb => python3-platformdirs_3.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.10.0.bb => python3-platformdirs_3.11.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb
index 264b06d676..5a65d67706 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "b45696dab2d7cc691a3226759c0d3b00c47c8b6e293d96f6436f733303f77f6d"
+SRC_URI[sha256sum] = "cf8ee52a3afdb965072dcc652433e0c7e3e40cf5ea1477cd4b3b1d2eb75495b3"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1



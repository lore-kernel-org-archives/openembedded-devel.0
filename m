Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B153C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:37:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6613.1698104272301121531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="124953003"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="124953003"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:37:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B46FED6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:37:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EF05AD5EBD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:37:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F26770BE1;
	Tue, 24 Oct 2023 08:37:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.10.1 -> 5.11.2
Date: Tue, 24 Oct 2023 07:36:06 +0800
Message-Id: <1698104166-31808-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-1.967900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogwIsQZbtzZwuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOcB+Y1SRgHxxqBz
	mTv+Z+CVnc/bBLje9iX+i8dK7hsywGr6yNtyqor6wmJi06fB1tYEDvKOuqQnyu0XJ4obVS5Tx20
	I8+MZLOgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105698

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-More Typing Adoption
-Typing fixups
-More typing cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-traitlets_5.10.1.bb => python3-traitlets_5.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.10.1.bb => python3-traitlets_5.11.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.10.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.10.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb
index 7df1d66ccc..f2f70b8187 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "db9c4aa58139c3ba850101913915c042bdba86f7c8a0dda1c6f7f92c5da8e542"
+SRC_URI[sha256sum] = "7564b5bf8d38c40fa45498072bf4dc5e8346eb087bbf1e2ae2d8774f6a0f078e"
 
 inherit pypi python_hatchling
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9E2C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:22:15 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6307.1704720133910057320
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="147085413"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085413"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:22:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 28355D6477
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:22:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EA90B4B3C
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:22:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D1A386895A
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:22:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 89CBB1A0072;
	Mon,  8 Jan 2024 21:22:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libcloudproviders: upgrade 0.3.4 -> 0.3.5
Date: Mon,  8 Jan 2024 21:21:40 +0800
Message-Id: <1704720100-29955-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--1.479800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQkt9BigJAcVqQ5
	DAOsl5Pl4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2Q8eMEhzK9tqKdE
	VEQ71Y0GxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzUNBLz02/KM0ZI1
	uVI9G3fzjZHYbkpm7Zq8Zxe2/VemMdynKzBdb3WYU7N03r7++nmUl6gqxJMj4OqJxJhH/7OsIJw
	NRN8adkiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108135

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
* Fix a bug: Alt+Down (moving line(s) down) or Alt+Up (moving line(s) up) wrt.
  the undo/redo history and cursor positioning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcloudproviders_0.3.4.bb => libcloudproviders_0.3.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0.3.4.bb => libcloudproviders_0.3.5.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.5.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.5.bb
index 1c03f41c2..7f9bb2638 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.5.bb
@@ -8,4 +8,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "e3d7160c3e45fe3216c07c7988bb4fc81397c32d1fc6113af0edfe8632039f65"
+SRC_URI[archive.sha256sum] = "b987456eddaf715ba9d623aa2bc501ab1b697dffeb11aaa783a637275df186da"
-- 
2.34.1



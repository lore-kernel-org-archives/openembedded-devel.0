Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EA4C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:04:24 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.541.1705971863977593567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="134930822"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="134930822"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:04:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CACB0D9D97
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:04:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 01EFFBF4A1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:04:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98D9A2007B700
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:04:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F8AD1A006A;
	Tue, 23 Jan 2024 09:04:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] minicoredumper: upgrade 2.0.6 -> 2.0.7
Date: Tue, 23 Jan 2024 09:03:40 +0800
Message-Id: <1705971820-24697-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--2.747200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysqJYDiLjQhJ7WO
	DdZ1PDmEEpOBzVcqqX4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErT0swHSFcVJ6MC5DTEMxpeQ32S
	61JcPB8fegKf/r6b46nk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5VEg
	fdcxaxyx+U+/lx2DXnz7wKAi/qu61RGO6JdaRaOZ4ZFGsofJEAynHs4XZSNUZ2KZ1omiRUT/Qr9
	JdfGkKXNLZSdHVWdrCCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix robust mutex list dumping if a robust mutex uses the
  PTHREAD_PRIO_INHERIT attribute.
* Avoid bogus error messages when dumping registered data for
  non-crashing processes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{minicoredumper_2.0.6.bb => minicoredumper_2.0.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.6.bb => minicoredumper_2.0.7.bb} (97%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.6.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
similarity index 97%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.6.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index dfe9f7b51..0c3827141 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.6.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -9,7 +9,7 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig ptest systemd update-rc.d
 
-SRCREV = "da62115c0fab3a4608e4b0ee0c8aa0cf134c14ca"
+SRCREV = "ca6e7ad62b4cf984de84aa081024c4e45632cecb"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
-- 
2.34.1



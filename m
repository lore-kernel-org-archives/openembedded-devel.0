Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B863BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:50:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.17750.1702543836534778297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="144920051"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="144920051"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:50:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0542ED9DB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:50:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39C01D3F3B
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:50:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FAFD202DB306;
	Thu, 14 Dec 2023 17:50:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.15.0 -> 2.21.0
Date: Thu, 14 Dec 2023 16:50:21 +0800
Message-Id: <1702543821-27676-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-0.671700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrtOtXYgbXjdfMB0kPsl40wwjH
	L9oxvu+EX64KjR1hKzrXgVbKoEEGVu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtOd/WZx6Mp+fZQ0TMXm1zGR0Ylq/XFW9+6sxeNropaC7C014WoMnXub1dB
	cG3hTIX8M3UOHxE4FRlECwuzLP5xwB7Ral/BssIHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107429

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Speed up message callbacks
-Speed up run time constructed method handlers
-Speed up ServiceInterface callbacks with cython methods
-Small speed up to the aio message reader
-Reduce duplicate code in aio MessageBus
-Speed up sending messages with call on the MessageBus

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.15.0.bb => python3-dbus-fast_2.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.15.0.bb => python3-dbus-fast_2.21.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.15.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.21.0.bb
index b3cb377ec..5698ae99f 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "c98c7dfc3c589d6a5ded3427addfef1f9199525422f976e10d70a5c10558f5bf"
+SRC_URI[sha256sum] = "f582f6f16791ced6067dab325fae444edf7ce0704315b90c2a473090636a6fe0"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1



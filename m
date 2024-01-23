Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C209CC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:12:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.680.1705972358307280534
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="125712224"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="125712224"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:12:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6B3ED6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:12:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31AC4D506E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:12:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A646520081320
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:12:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 300631A006A;
	Tue, 23 Jan 2024 09:12:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 4.2.0 -> 4.2.2
Date: Tue, 23 Jan 2024 09:12:20 +0800
Message-Id: <1705972340-24883-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--1.032800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrjlQQ+MHi1dPhA4WtAM986dYB
	wywlIkSUwYk8vN7TNl4xfzRy6VoheWJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsOLnuPsjYgiorWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNeen+gInutwpY8WemHBgsuYr8HSJQr2BJLeoGUeLOkBw2WqLZ2pY4eRlflmUdzSKYcZvP
	QiihYOC8t3aCgE43pFn+S0fA8y73wQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-sharkd is not installed by the Windows installer.
-Fuzz job crash output: fuzz-2024-01-01-7740.pcap.
-Can't open a snoop file from the Open dialog box unless I select \"All files\" as the file type.
-Add s4607 dissector to \"decode as\"
-Updater for 4.2.1 hangs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.2.0.bb => wireshark_4.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.0.bb => wireshark_4.2.2.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.0.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.2.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.0.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.2.bb
index 4a4768092..a2ab112e9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "0e428492f4c3625d61a7ccff008dc0e429d16ab8caccad4403157ea92b48a75b"
+SRC_URI[sha256sum] = "9e3672be8c6caf9279a5a13582d6711ab699ae2a79323e92a99409c1ead98521"
 
 PE = "1"
 
-- 
2.34.1



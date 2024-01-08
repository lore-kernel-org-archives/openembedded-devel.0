Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2200EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:27:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.6402.1704720440574613881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="145719235"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145719235"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:27:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B989D7AC6
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:27:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A74C7B4E30
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:27:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B0926895A
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:27:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4E981A0072;
	Mon,  8 Jan 2024 21:27:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.44.0 -> 1.44.2
Date: Mon,  8 Jan 2024 21:26:54 +0800
Message-Id: <1704720414-30159-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--6.161900-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr3hng3KTHeTYlsQ9ktMX8f5Qb
	1h7aUchT1joxU3t+0uTehhwMAOeYDbnYYc5tkWxnACHjGJ46JtkntGeqbHuvm3hh5KUdlgWizo8
	mBsnXL/V+H7FNjKOX3Vo4rfBbwEOR+OSlyTrKzFUD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpijeb9I4dYb9vymVDB8yZElJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkKfq1DGT3PVLQqRwn94ddY7xZfOLuFk1lAJLqMq3ESh1+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108140

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
* Better log IPv4 Address Conflict Detection (ACD) conflicts
* Remove the upper limit of 65535 for PIDs read from the PID file
* Allow missing default gateway with oFono
* Honor the CLICOLOR_FORCE environment variable
* Fix generating connection with IPv6 method disabled vs ignored
* Fix possible segmentation fault when doing a checkpoint rollback
* Documentation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.44.0.bb => networkmanager_1.44.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.44.0.bb => networkmanager_1.44.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.2.bb
index 07a85b68a..a2c65f61d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.2.bb
@@ -42,7 +42,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63be20d2f298779fb9f"
+SRC_URI[sha256sum] = "4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1



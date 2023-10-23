Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7525C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:16:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.115768.1698049005473752687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125175811"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125175811"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:16:27 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7651DCF1C9
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:16:25 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B3D37D506E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:16:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9558288575;
	Mon, 23 Oct 2023 17:16:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.11.1 -> 2.11.2
Date: Mon, 23 Oct 2023 16:15:17 +0800
Message-Id: <1698048917-24277-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-0.819800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrMoS2PLq1B76F+6hJ+w2rjR1F
	1qUwAoFD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6uxW
	P7AlD8NPJ+Hc1ra3Im3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7uBp
	wrByNjWKpbUcckQKJenwtiUGf/Amhp5Od11FGMrng2VMu27H2blHn7CIXjOVn/dXKg4+HLTEKH6
	Dctt5uPXKwFbeRF6HqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105633

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Backported #9378: backported wArrayList (optional) copy on insert
Backported #9360: backported certificate algorithm detection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.11.1.bb => freerdp_2.11.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.1.bb => freerdp_2.11.2.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.11.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
index 063a63b1e3..c8d996d416 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "9d3d40bf3e429c0cd6609f686c0e73ed0eff0a07"
+SRCREV = "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            file://0001-Fix-const-qualifier-error.patch \
-- 
2.34.1



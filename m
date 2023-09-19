Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FDAEE0218
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:31:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2188.1695108661284692521
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132644689"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132644689"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:31:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97798DE6B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:30:56 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C6154D88A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:30:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id EF21186F10;
	Tue, 19 Sep 2023 16:30:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.11.0 -> 2.11.1
Date: Tue, 19 Sep 2023 15:30:41 +0800
Message-Id: <1695108641-6943-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10--1.347200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvfKapXkCLRBfq6
	5RK/zjY14CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6Ksm
	10TThDCKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2EwMR4qe5+CcOB
	litZYmiVIOyaJc8eeRsHOPzJeFT+Ap5P43c2GvEkU940OzjbUsMgNVBbmc4VW/z7JIjV0k7d6fx
	900C4lgiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104962

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * Backported #9356: Fix issues with order updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.11.0.bb => freerdp_2.11.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.0.bb => freerdp_2.11.1.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.1.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.1.bb
index 4a5a763c8e..063a63b1e3 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.1.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "1384b3c33b9bd7599633cc54bf20cf20ec6be83c"
+SRCREV = "9d3d40bf3e429c0cd6609f686c0e73ed0eff0a07"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            file://0001-Fix-const-qualifier-error.patch \
-- 
2.34.1



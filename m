Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E56CD5483
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:33:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2233.1695108790143079325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111493978"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111493978"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:33:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FF11DE6BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:33:06 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 337E6D88B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:33:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3077B884FE;
	Tue, 19 Sep 2023 16:33:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libcloudproviders: upgrade 0.3.2 -> 0.3.4
Date: Tue, 19 Sep 2023 15:32:56 +0800
Message-Id: <1695108776-7145-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10--4.010800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mryqyllX6UJItYC5LPd7BvbT/4
	0Ae7LpB/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2Q8eMEhzK9tqKdE
	VEQ71Y0GxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2I7PCRoKnjWbVh
	8+ZzIRxtBWYNV0TFcJ5HMxGJ7JO5RA3drLE3p6ic0CUGlCLjynLmqETcSkNyxeOw5Acos52I8DU
	qt1ta/niB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104967

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Re-release du to release tarball issue
* Use a new way to register providers using .desktop files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcloudproviders_0.3.2.bb => libcloudproviders_0.3.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0.3.2.bb => libcloudproviders_0.3.4.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.2.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.2.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
index 401c83fcdc..36089238f6 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.2.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
@@ -8,4 +8,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "24a9f3fffaf49f1d9d45d6ec35ba9f9e59a5a1040b51ce7835611131966c6819"
+SRC_URI[archive.sha256sum] = "e3d7160c3e45fe3216c07c7988bb4fc81397c32d1fc6113af0edfe8632039f65"
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7313C0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2314.1687157422040252285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="120836475"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="120836475"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA8A5D29E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:20 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04A48D4BFB
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D9A72FC847B;
	Mon, 19 Jun 2023 15:50:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.3.15 -> 1.4.1
Date: Mon, 19 Jun 2023 14:48:13 +0800
Message-Id: <1687157308-17342-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--3.144600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrC//1TMV5chPVjNsehGf0vXf9
	C9ZSAECa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzB++VzZZC22K/0s
	PlRRyPZB8Svr22FCQ8OWyXAXbV+Tmkb/e6xz2F06YwMyc8WdNOco3yCFKyZFKxrCW0LG/pCL/hK
	VnnEn72iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103362

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Make a retrocompatible version of 1.4.0 change about supporting VIXIECRON bug.
 Added "implement_cron_bug" flag to make the cron parser compatible with a bug in Vixie/ISC Cron

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_1.3.15.bb => python3-croniter_1.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.15.bb => python3-croniter_1.4.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.15.bb b/meta-python/recipes-devtools/python/python3-croniter_1.4.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.15.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.4.1.bb
index b00ab2615..e9f84eb9e 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.15.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "924a38fda88f675ec6835667e1d32ac37ff0d65509c2152729d16ff205e32a65"
+SRC_URI[sha256sum] = "1a6df60eacec3b7a0aa52a8f2ef251ae3dd2a7c7c8b9874e73e791636d55a361"
 
 inherit pypi setuptools3
 
-- 
2.34.1



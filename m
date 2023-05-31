Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EA7C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8607.1685518844926403710
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="98397953"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="98397953"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E343CD7E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C13AFD4BF9
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1732968957;
	Wed, 31 May 2023 16:40:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.3.14 -> 1.3.15
Date: Wed, 31 May 2023 15:40:08 +0800
Message-Id: <1685518820-20028-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-1.343400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrVnV
	bfL/Cqfz4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzKEQoTdjOVqgz5O
	5CD/bVs1nDC9wXtuNQz0CnXmODjcP/X2xky0hMwg7GNl0xprVQTSy/mvMO/KiiFRpUBnRa/5kq3
	e5na1X0iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102914

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix hashed expressions omitting some entries
Enhance .match() precision for 6 position expressions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_1.3.14.bb => python3-croniter_1.3.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.14.bb => python3-croniter_1.3.15.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.15.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.15.bb
index af8892eb7..b00ab2615 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "d067b1f95b553c6e82d95a983c465695913dcd12f47a8b9aa938a0450d94dd5e"
+SRC_URI[sha256sum] = "924a38fda88f675ec6835667e1d32ac37ff0d65509c2152729d16ff205e32a65"
 
 inherit pypi setuptools3
 
-- 
2.34.1



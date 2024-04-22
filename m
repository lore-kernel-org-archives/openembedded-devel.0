Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23243C41513
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.14073.1713777373314830962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fmR0BgnZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777374; x=1745313374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7K13U8MELZYgTJYHVaqZQ2pr8+fFqtzWHpi81lKFFxs=;
  b=fmR0BgnZ1ZsdxmAehYIslqEInQ+a+5ZdJcu+xQUTwdTPdM0zYByKukLj
   OpVsX76Nea+18VQwYHWt96nSlH5pOSNv3CqZuNU3aNtMyzEE93UB77J1B
   RS/THV/zuewAIzrMaSsSUeiOz+eS98U5YZS2A2KtYs1JnI8EjHOJUiHSD
   YX6++wKFLpGCqWDnyfUzRmoQMSzVfxjQVUPL0Y5iqCU36nlHedCpFc6At
   nCnRjTtfo5Z2/ZxG2wbdlZXmLGbtaX36PCuh80QTNtzib41wKQI9AWuno
   4VBC0FfRDuUsDOIOWuaO8rW6+vlBcoozLqBqN7dqp5e/gvRH8A/zpQ6Tn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="156594054"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="156594054"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:12 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26679D4C2C
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F52097A51
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E5C2E6BD75
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 907FF1A000B;
	Mon, 22 Apr 2024 17:16:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/15] python3-regex: upgrade 2023.12.25 -> 2024.4.16
Date: Mon, 22 Apr 2024 17:15:43 +0800
Message-Id: <1713777345-29264-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10--0.494600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mryqyllX6UJIs8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzcHRNbCaxV4HLS9
	LvBFgaiOttmcOS4jYZulRRtLK3FaA5dKLqSBb7IPkmZ8DfBClqAyb5FGqph8j302LGjMqwqfLRQ
	O9Hn0y/iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110095

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Git issue 525: segfault when fuzzy matching empty list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2023.12.25.bb => python3-regex_2024.4.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2023.12.25.bb => python3-regex_2024.4.16.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2023.12.25.bb b/meta-python/recipes-devtools/python/python3-regex_2024.4.16.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2023.12.25.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.4.16.bb
index d7ac61608..18a6f3d65 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2023.12.25.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.4.16.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "29171aa128da69afdf4bde412d5bedc335f2ca8fcfe4489038577d05f16181e5"
+SRC_URI[sha256sum] = "fa454d26f2e87ad661c4f0c5a5fe4cf6aab1e307d1b94f16ffdfcb089ba685c0"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1



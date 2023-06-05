Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB9C7EE2F
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2116.1685951613977362737
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="98916283"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="98916283"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68D5BD5041
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA38FF811
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D70F52FC8688;
	Mon,  5 Jun 2023 16:53:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2023.5.5 -> 2023.6.3
Date: Mon,  5 Jun 2023 15:53:07 +0800
Message-Id: <1685951589-29920-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-0.135400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mryqyllX6UJIuD1hLxlLxt3b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzh9SZ8XVaLFnPMJ
	WtF1Uo5oyE+BI2X1t2Nn0dIZjQp73A5hqAlWmJGGB6ESjL+7TIJNz9YPebL298UGBMeEuZJJad+
	cDN4hKhiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103123

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
  # Git issue 498: Conditional negative lookahead inside positive lookahead fails to match
    Conditional node needed an additional member that points to the true branch.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2023.5.5.bb => python3-regex_2023.6.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2023.5.5.bb => python3-regex_2023.6.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2023.5.5.bb b/meta-python/recipes-devtools/python/python3-regex_2023.6.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2023.5.5.bb
rename to meta-python/recipes-devtools/python/python3-regex_2023.6.3.bb
index ddd8402465..f653f32fe2 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2023.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2023.6.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7d76a8a1fc9da08296462a18f16620ba73bcbf5909e42383b253ef34d9d5141e"
+SRC_URI[sha256sum] = "72d1a25bf36d2050ceb35b517afe13864865268dfb45910e2e17a84be6cbfeb0"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1



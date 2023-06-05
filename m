Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8837DC7EE2A
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2117.1685951614307805783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="98192159"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="98192159"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ED574DDC60
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:30 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EFD42BF3C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CBCC2FC85E5;
	Mon,  5 Jun 2023 16:53:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.24.0 -> 1.25.0
Date: Mon,  5 Jun 2023 15:53:09 +0800
Message-Id: <1685951589-29920-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10--2.276900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvM+yMbBXXWKeRsk
	AdaEfeQK+FyTwBk2ojyX9moRF8wW9+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz3T2Zspyb3NFqcO
	g+zi92PGkdXDB1BPz/8taIYRhcpKAjMljdya39gEi2l+p4qcQdcZyODmgpXBir+5UaFz4BgSVvR
	7FBshi5iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103125

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Support urllib3>=2.0.0 (#2148)
    Auto-retry tests on failure (#2134)
    Correct importlib.metadata check in test_modules (#2149)
    Fix distribution name normalization (PEP-0503) (#2144)
    Fix functions_to_trace typing (#2141)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.24.0.bb => python3-sentry-sdk_1.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.24.0.bb => python3-sentry-sdk_1.25.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.24.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.24.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.0.bb
index 9e4b87da9..10e77ae60 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "0bbcecda9f51936904c1030e7fef0fe693e633888f02a14d1cb68646a50e83b3"
+SRC_URI[sha256sum] = "5be3296fc574fa8a4d9b213b4dcf8c8d0246c08f8bd78315c6286f386c37555a"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1



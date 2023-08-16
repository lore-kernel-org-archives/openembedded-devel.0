Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50DFC001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:38:55 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.151729.1692149929584812904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107669085"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107669085"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:38:47 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39AA8DDC64
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:38:45 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 648F6D8BB4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:38:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74D7586E22;
	Wed, 16 Aug 2023 10:38:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade 1.59.1 -> 1.60.0
Date: Wed, 16 Aug 2023 09:38:20 +0800
Message-Id: <1692149900-5107-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--2.749600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5ubkFZd8r6UXoBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzkOCk2JGbumu3rV
	mL47fyRQ9F5uVZGhaZ8UxGW82zy3V05pfrC9w65cy8S9vc2lNfAOB+CHW2pw8wApwAKKCY88r7y
	GjNvjP9iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add google/api/policy.proto
Add method_policies to Control

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.59.1.bb => python3-googleapis-common-protos_1.60.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.59.1.bb => python3-googleapis-common-protos_1.60.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
index a6b3d4eacc..5c9ba5fb4b 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b35d530fe825fb4227857bc47ad84c33c809ac96f312e13182bdeaa2abe1178a"
+SRC_URI[sha256sum] = "e73ebb404098db405ba95d1e1ae0aa91c3e15a71da031a2eeb6b2e23e7bc3708"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.34.1



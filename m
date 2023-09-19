Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968FECD54A3
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:58:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2795.1695110322589076146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132484097"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132484097"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:58:40 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 85D58CA1EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:58:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B88C7D4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:58:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C58F62FC8066;
	Tue, 19 Sep 2023 16:58:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.1.2 -> 3.1.3
Date: Tue, 19 Sep 2023 15:57:58 +0800
Message-Id: <1695110278-8335-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--1.699800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrnGHnXg+7RhmU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrdnDBfeuhQVjjt97fAQw4mWB1LuOiHcpCcJovEVor8S1P+N+wdd8oegFwP
	sH6f6pLSfeAgqPk/5UjWBApcyY9pYY3+VezjIcHR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added support for custom total formulas to worksheet tables.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.1.2.bb => python3-xlsxwriter_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.2.bb => python3-xlsxwriter_3.1.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.2.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.3.bb
index 805a3b7dd1..6952d533da 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.3.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "78751099a770273f1c98b8d6643351f68f98ae8e6acf9d09d37dc6798f8cd3de"
+SRC_URI[sha256sum] = "696c16458d50712a3a5f902676c045ddb4c1bd1b54595f501e582d549abdbdb9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



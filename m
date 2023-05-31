Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43BEC77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:41:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8565.1685518854901716240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="98312280"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="98312280"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6852DDC64
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F24B6D88AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7901968957;
	Wed, 31 May 2023 16:40:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.1.1 -> 3.1.2
Date: Wed, 31 May 2023 15:40:18 +0800
Message-Id: <1685518820-20028-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--4.108800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrP8UQejhp29oRBtVagi8jbb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SX/jiJWKCrmyLtxg9xb4NY0dT6aRhuxD8d9i6z1k+DuB0uy
	9suagojSBd3nyd1jrJOLwS+YfwMHArf4noHpxT6Kpy0GAhQcJHS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102923

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Added worksheet page break preview mode via "worksheet.set_pagebreak_view()".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.1.1.bb => python3-xlsxwriter_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.1.bb => python3-xlsxwriter_3.1.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.1.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.2.bb
index ff3a62281..805a3b7dd 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.2.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "03459ee76f664470c4c63a8977cab624fb259d0fc1faac64dc9cc6f3cc08f945"
+SRC_URI[sha256sum] = "78751099a770273f1c98b8d6643351f68f98ae8e6acf9d09d37dc6798f8cd3de"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



Return-Path: <bhargav_das@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F64C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 18:37:36 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web10.2124.1683052650903449106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 11:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: bhargav_das@mentor.com)
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="4633635"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 02 May 2023 10:37:30 -0800
IronPort-SDR: bWh0/YAqB9EQuGiTkdcLX7sob7ZI72mUwRQus1RNfFSf2BENhhC2aXA8qULYuG9AnuC7F6LTnl
 vz5DY/rP2gDGsMtfyge7QYjIYUNSh8X3pPq7JQOdutdZtq8n+HlA1HaRCwuJ7zmOJr5d7PHI43
 saUGtJncUsHC04zFJuF68yhy3gemwH+MYxgmwjeEZILSpeTWyqs1DGm25V4JcgE/AZYXCD+q/I
 5xaNVquhALnlbWbgZxiLjCcvXUHs5GKTADbas+XEGmg2Hc07dDnmV9GWilESoUYUyiIwm6UUy+
 ETs=
From: Bhargav Das <bhargav_das@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Bhargav Das <bhargav.das@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] tslib: Add native & nativestdk package support
Date: Wed, 3 May 2023 00:07:08 +0530
Message-ID: <20230502183709.150505-1-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 18:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102275

From: Bhargav Das <bhargav.das@siemens.com>

Add support for building native and nativesdk variants.

Signed-off-by: Bhargav Das <bhargav.das@siemens.com>
---
 meta-oe/recipes-graphics/tslib/tslib_1.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
index c2000b264..cb2563225 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
@@ -81,3 +81,5 @@ FILES:tslib-uinput += "${bindir}/ts_uinput"
 
 FILES:tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_print_mt \
                      ${bindir}/ts_test ${bindir}/ts_test_mt ${bindir}/ts_verify ${bindir}/ts_finddev ${bindir}/ts_conf"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1



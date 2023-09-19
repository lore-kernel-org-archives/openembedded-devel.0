Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6304ECD548C
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:39:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2341.1695109189001649404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132614198"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132614198"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:39:47 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48D0EC3F84
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:39:44 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FE2AD3F11
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:39:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id AD9F82FC8066;
	Tue, 19 Sep 2023 16:39:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] psqlodbc: upgrade 15.00.0000 -> 16.00.0000
Date: Tue, 19 Sep 2023 15:39:33 +0800
Message-Id: <1695109173-7480-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10-2.052600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBGvINcfHqheBiEGSH1NomL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeHtzXL7lPwD/31w
	l3qzgklKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtpmd/ehreR4Wgoy
	tBWPueXTjJ24CWFuhlCoIPCUYXiHEAP5BvNXYZrpgJsb02Kq0M9n1W8bYGcFlGL5d2g2V/ZtdXa
	1e9lTbzoKMKbkEq7FbyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104976

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Use autoconf to check for stdbool.h.
 Make it possible to use standard bool on Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../psqlodbc/{psqlodbc_15.00.0000.bb => psqlodbc_16.00.0000.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_15.00.0000.bb => psqlodbc_16.00.0000.bb} (96%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_15.00.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
similarity index 96%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_15.00.0000.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
index be79caef0b..97333f679d 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_15.00.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ca57d6349532ea7fb4fae17bbfc107abe5a155ca2f43446315f9e23764b3f8ec"
+SRC_URI[sha256sum] = "afd892f89d2ecee8d3f3b2314f1bd5bf2d02201872c6e3431e5c31096eca4c8b"
 
 DEPENDS += "postgresql unixodbc"
 
-- 
2.34.1



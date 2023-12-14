Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63E1C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:49:26 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.17730.1702543764328285180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="122643409"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="122643409"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:49:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B4A33C137D
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:49:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E5B64D94AA
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:49:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34B0A353854;
	Thu, 14 Dec 2023 17:49:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.1.3 -> 4.1.4
Date: Thu, 14 Dec 2023 16:48:48 +0800
Message-Id: <1702543728-27602-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFGirKEaqDiu6vt8/D/mLSy/zVD
	rupKt3HWh4hcF3LZR8LPFxwOfo8phbnavE1KeRQb2HBHSS6EO0ibYaVX3zilpAOuiQuQc5OOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107427

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
'bytes' token can't be used without explicit length.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.1.3.bb => python3-bitstring_4.1.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.3.bb => python3-bitstring_4.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
index 8831d84cb..6fc2cf480 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "1b47c84644a961ba8503db2bba8a5965ab53e81474becdf0a18383b5b5f3f795"
+SRC_URI[sha256sum] = "94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1



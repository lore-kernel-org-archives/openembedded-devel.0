Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD59C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:52:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6883.1698105117605171655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="125586370"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="125586370"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:51:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D15AACD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:51:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 08E20D88A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:51:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C33102FC5D89;
	Tue, 24 Oct 2023 08:51:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 4.0.8 -> 4.0.10
Date: Tue, 24 Oct 2023 07:51:13 +0800
Message-Id: <1698105073-32443-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27954.003
X-TMASE-Result: 10-0.857900-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yTAdpuStCriJVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOSHCU59h5KrFV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SvEEC5rCigIFi8sX6QXwiSrdlPSepMY+M/hp34S2oUlIcpC
	45Y8KjVsw31OLLmZVDoGKsHvCMpLC8IS3JX4X6rBO1qwFBVqWoS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105713

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
Error loading g729.so plugin with Wireshark 4.0.9 and 3.6.17 on macOS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.0.8.bb => wireshark_4.0.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.0.8.bb => wireshark_4.0.10.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.0.8.bb b/meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.0.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb
index 2117e9ee3c..008aa8cb12 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.0.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8"
+SRC_URI[sha256sum] = "b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898"
 
 PE = "1"
 
-- 
2.34.1



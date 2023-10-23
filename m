Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE8ECDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:50:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.116502.1698051037016064404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136685266"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136685266"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:50:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A14FD63C5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:50:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D5ECFD5EA8
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:50:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 105DD34786;
	Mon, 23 Oct 2023 17:50:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jedi: upgrade 0.19.0 -> 0.19.1
Date: Mon, 23 Oct 2023 16:50:08 +0800
Message-Id: <1698051008-25909-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S6dvcsdJ7nT6MFUlML0FzvXAE9W+VYjI16nBTy2s7CSGnQN
	7KzcsEVMY1XKJO0d2Mu16wMPLoFWOolh0FbI0Su1njQRiYnpmCS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105673

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Python 3.12 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jedi_0.19.0.bb => python3-jedi_0.19.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.19.0.bb => python3-jedi_0.19.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.19.0.bb b/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-jedi_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
index 58e8cc17a1..f335625188 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[sha256sum] = "bcf9894f1753969cbac8022a8c2eaee06bfa3724e4192470aaffe7eb6272b0c4"
+SRC_URI[sha256sum] = "cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd"
 
 RDEPENDS:${PN} = " \
 	${PYTHON_PN}-parso \
-- 
2.34.1



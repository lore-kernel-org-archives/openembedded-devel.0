Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06116CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:46:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.116458.1698050754457648012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138662553"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138662553"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:45:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17BE7D4F6F
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:45:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D3AAD39CC
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:45:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86A052005932A;
	Mon, 23 Oct 2023 17:45:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade 1.60.0 -> 1.61.0
Date: Mon, 23 Oct 2023 16:43:15 +0800
Message-Id: <1698050595-25649-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--1.287600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwS+fKi1+IrguV
	MctAPCgt4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2ToUdFbHYUawmkh
	1mX1Vkyd6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6gjY
	zjEWCx49kLJEr61q/y3lRxpzlmXnoypYnwwH0c/hWK4Q0WGpC0wJwe0V5+FOkJPQQBELOYqOlwL
	QD8qdZ1LQ0DAX12njCCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105667

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add google/api/field_info.proto
Add IDENTIFIER to FieldBehavior enum

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.60.0.bb => python3-googleapis-common-protos_1.61.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.60.0.bb => python3-googleapis-common-protos_1.61.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb
index 5c9ba5fb4b..171bc67b78 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e73ebb404098db405ba95d1e1ae0aa91c3e15a71da031a2eeb6b2e23e7bc3708"
+SRC_URI[sha256sum] = "8a64866a97f6304a7179873a465d6eee97b7a24ec6cfd78e0f575e96b821240b"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.34.1



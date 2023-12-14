Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB311C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:54:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.17809.1702544091429808841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143315531"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143315531"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:54:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F7F4C1634
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:54:47 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7281BD60F6
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:54:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 52B9E86A76;
	Thu, 14 Dec 2023 17:54:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade 1.61.0 -> 1.62.0
Date: Thu, 14 Dec 2023 16:54:37 +0800
Message-Id: <1702544077-27916-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--3.213600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxkmInFtzPDn4QJ
	VvT2WIqX4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2ToUdFbHYUawmkh
	1mX1Vkyd6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6+1Q
	OCniN8wX8cFwyhDg3D/yutVqwQ4z0vehST6xAs0vmjms/Ge1BjVDcQoiiDMe1Yqb+7wG9nugXFD
	uitIlH1hCGa2KlqqCmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107435

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add auto_populated_fields field of MethodSettings in google/api/client_pb2
-Add support for Python 3.12
-Migrate to native namespace packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.61.0.bb => python3-googleapis-common-protos_1.62.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.61.0.bb => python3-googleapis-common-protos_1.62.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
index 171bc67b7..1536ba5e0 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8a64866a97f6304a7179873a465d6eee97b7a24ec6cfd78e0f575e96b821240b"
+SRC_URI[sha256sum] = "83f0ece9f94e5672cced82f592d2a5edf527a96ed1794f0bab36d5735c996277"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.34.1



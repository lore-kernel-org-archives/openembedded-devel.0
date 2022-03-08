Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6630C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 02:18:11 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.3990.1646705891046352832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 18:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2282I9fG014230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 7 Mar 2022 18:18:09 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 7 Mar 2022 18:18:09 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 7 Mar 2022 18:18:08 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] networkmanager: fix installed-vs-shipped
 error
Date: Tue, 8 Mar 2022 10:18:06 +0800
Message-ID: <20220308021806.1313-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 02:18:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95876

From: Kai Kang <kai.kang@windriver.com>

Fix installed-vs-shipped error of networkmanager:

| ERROR: networkmanager-1.36.0-r0 do_package: QA Issue: networkmanager:
         Files/directories were installed but not shipped in any package:
|   /usr/lib/firewalld
|   /usr/lib/firewalld/zones
|   /usr/lib/firewalld/zones/nm-shared.xml
| Please set FILES such that these items are packaged. Alternatively if they
    are unneeded, avoid installing them or delete them with in do_install.
| networkmanager: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../networkmanager/networkmanager_1.36.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
index f6d1b6c38..0ab8cad21 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
@@ -182,7 +182,7 @@ FILES:${PN}-dev += " \
 FILES:${PN} += " \
     ${libexecdir} \
     ${libdir}/NetworkManager \
-    ${libdir}/firewalld/zones \
+    ${nonarch_libdir}/firewalld/zones \
     ${nonarch_libdir}/NetworkManager/conf.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
-- 
2.17.1



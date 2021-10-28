Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AEBC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 06:33:44 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.7892.1635402822681512244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 23:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19S6XfVD018948
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 23:33:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19S6XeKI018577
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 23:33:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 23:33:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 27 Oct 2021 23:33:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-webserver][PATCH] Apache: Several CVE fixes
Date: Thu, 28 Oct 2021 14:32:26 +0800
Message-ID: <20211028063226.18498-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Oct 2021 06:33:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93636

From: Armin Kuster <akuster@mvista.com>

Source: Apache.org
MR: 113457, 113453
Type: Security Fix
Disposition: Backport from apache.org 2.4.51
ChangeID: 9d7b58f49487baff99bf8f101e53217425a2b81f
Description:

Bug fix only update. LTS version
https://httpd.apache.org/security/vulnerabilities_24.html

Fixes CVEs:
CVE-2021-42013
CVE-2021-41524
CVE-2021-41773

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
index e5d187957..4b36c50d5 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b"
+SRC_URI[sha256sum] = "20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.17.1



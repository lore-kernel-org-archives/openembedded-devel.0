Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6818EC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 19:12:13 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.1248.1646161932293941545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 11:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 221JCBYf015709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 1 Mar 2022 11:12:11 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 11:12:10 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 11:12:10 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 11:12:10 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] nss: fix CVE-2022-22747
Date: Tue, 1 Mar 2022 14:12:10 -0500
Message-ID: <20220301191210.19499-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 19:12:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95645

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...k-for-missing-signedData-field-r-kee.patch | 55 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.64.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1735028-check-for-missing-signedData-field-r-kee.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1735028-check-for-missing-signedData-field-r-kee.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1735028-check-for-missing-signedData-field-r-kee.patch
new file mode 100644
index 000000000..38b982b48
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1735028-check-for-missing-signedData-field-r-kee.patch
@@ -0,0 +1,55 @@
+From 074e29e6724d443d3161ee2982ba7f017d3075dd Mon Sep 17 00:00:00 2001
+From: "John M. Schanck" <jschanck@mozilla.com>
+Date: Mon, 11 Oct 2021 22:09:25 +0000
+Subject: [PATCH] Bug 1735028 - check for missing signedData field r=keeler
+
+Differential Revision: https://phabricator.services.mozilla.com/D128112
+
+Upstream-Status: Backport [074e29e6724d443d3161ee2982ba7f017d3075dd]
+CVE: CVE-2022-22747
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ gtests/certdb_gtest/decode_certs_unittest.cc | 13 +++++++++++++
+ lib/pkcs7/certread.c                         |  5 +++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/nss/gtests/certdb_gtest/decode_certs_unittest.cc b/nss/gtests/certdb_gtest/decode_certs_unittest.cc
+index 405194edc..3317ae8ee 100644
+--- a/nss/gtests/certdb_gtest/decode_certs_unittest.cc
++++ b/nss/gtests/certdb_gtest/decode_certs_unittest.cc
+@@ -26,3 +26,16 @@ TEST_F(DecodeCertsTest, EmptyCertPackage) {
+                          sizeof(emptyCertPackage)));
+   EXPECT_EQ(SEC_ERROR_BAD_DER, PR_GetError());
+ }
++
++TEST_F(DecodeCertsTest, EmptySignedData) {
++  // This represents a PKCS#7 ContentInfo of contentType
++  // 1.2.840.113549.1.7.2 (signedData) with missing content.
++  unsigned char emptySignedData[] = {0x30, 0x80, 0x06, 0x09, 0x2a, 0x86,
++                                     0x48, 0x86, 0xf7, 0x0d, 0x01, 0x07,
++                                     0x02, 0x00, 0x00, 0x05, 0x00};
++
++  EXPECT_EQ(nullptr,
++            CERT_DecodeCertFromPackage(reinterpret_cast<char*>(emptySignedData),
++                                       sizeof(emptySignedData)));
++  EXPECT_EQ(SEC_ERROR_BAD_DER, PR_GetError());
++}
+diff --git a/nss/lib/pkcs7/certread.c b/nss/lib/pkcs7/certread.c
+index 3091f9947..15094f2d7 100644
+--- a/nss/lib/pkcs7/certread.c
++++ b/nss/lib/pkcs7/certread.c
+@@ -139,6 +139,11 @@ SEC_ReadPKCS7Certs(SECItem *pkcs7Item, CERTImportCertificateFunc f, void *arg)
+         goto done;
+     }
+ 
++    if (contentInfo.content.signedData == NULL) {
++        PORT_SetError(SEC_ERROR_BAD_DER);
++        goto done;
++    }
++
+     rv = SECSuccess;
+ 
+     certs = contentInfo.content.signedData->certificates;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
index ccb5201d4..d16aec65d 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch \
+           file://0001-Bug-1735028-check-for-missing-signedData-field-r-kee.patch \
            "
 SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
 
-- 
2.33.0



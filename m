Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D288EC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 12:57:41 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.6843.1644584261361893299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q7IMQO9g;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so11832668pjl.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=OIk8GIVPr43mONRdEORS2cWypFJ4k7qbb8q4FwNc2oo=;
        b=Q7IMQO9gBWXsOGW41pZStBtRm/5xFLnBYJaz9gfmWc/P7qQCM7CVlbdk2ei+h/lL+5
         mc+Y2j2/E0+SvfQDn6V5rN4XqI6vYkz78hUo+8E981GFyx7kB9fB23KTcJha1LYNk7zK
         Wu261PF3iH8KmCtPV7mcBi/ps/gdyaDP9NA2fv8LNNn6SKd+wLOS9wZ4CA95PnEsMlbZ
         +/rd4Sh+6PFwxAlNKN1q9OuNgP5BsjGTTZvFWt5TUU8CDuwCVfvqzho4eYQjbtKPxbeY
         Zu/TzVFpa17tAgg6OGSXK5sh+hmoZBxnsLQzsUs6gyZ7LzfP56om5QkLU0X58bqD6AAr
         bTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OIk8GIVPr43mONRdEORS2cWypFJ4k7qbb8q4FwNc2oo=;
        b=Ss4BuNKNif9RBFLck9LfJG4SDH6rf/cDY9MBk41Qt+zWF9MWu4KsrYpi9mw5ILLMtQ
         0R7plcbR6fPzs/LT48Qm0oZ7o7ppnMHH9FtNCW8PkG3NifUunnu643MfKD6dvod6W9aX
         cgTJlupTxlw6pWAJq2KeLRVmX7w+8wHDfWuZPpY4Xhtq7EuZHati4uxKlLJlD/KlvNXz
         3OFiOd2zCWJXd2mbDSPHJSsUgmGHyvqSEdOIhiTPkv+ijKhiCnoM99hvPtyjMEevJqtB
         hTUrBzWYVeXR+HlCaEf3Nqptn1uk2X0poFtNOgKVtEg9vvl7dOV0tG8Yvc4EHfP1Tn0j
         7cGw==
X-Gm-Message-State: AOAM530yW6vZAZlRh3MaSPo1PiWgEnY52/C/uO7DfAiU6OrVJ4b5XAow
	kPilIdt156+tiOXOlhpTdKyek7azu6s=
X-Google-Smtp-Source: 
 ABdhPJxtUQcfoVGVnPMT9H+b4odoNWVjClMRTp99klhjxALc9Il3lvNGyax26Z5NXxSp6J6qxeqLbw==
X-Received: by 2002:a17:902:d641:: with SMTP id
 y1mr1476267plh.64.1644584260480;
        Fri, 11 Feb 2022 04:57:40 -0800 (PST)
Received: from localhost.localdomain ([150.129.206.7])
        by smtp.gmail.com with ESMTPSA id
 em22sm4018741pjb.35.2022.02.11.04.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 04:57:39 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-oe][dunfell][PATCH] nss: Add fix for CVE-2022-22747
Date: Fri, 11 Feb 2022 18:23:22 +0530
Message-Id: <20220211125322.17665-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 12:57:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95297

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2022-22747

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../nss/nss/CVE-2022-22747.patch              | 63 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch b/meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch
new file mode 100644
index 000000000..cccb73187
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch
@@ -0,0 +1,63 @@
+# HG changeset patch
+# User John M. Schanck <jschanck@mozilla.com>
+# Date 1633990165 0
+# Node ID 7ff99e71f3e37faed12bc3cc90a3eed27e3418d0
+# Parent  f80fafd04cf82b4d315c8fe42bb4639703f6ee4f
+Bug 1735028 - check for missing signedData field r=keeler
+
+Differential Revision: https://phabricator.services.mozilla.com/D128112
+
+Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/raw-rev/7ff99e71f3e37faed12bc3cc90a3eed27e3418d0]
+CVE: CVE-2022-22747
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+diff --git a/nss/gtests/certdb_gtest/decode_certs_unittest.cc b/nss/gtests/certdb_gtest/decode_certs_unittest.cc
+--- a/nss/gtests/certdb_gtest/decode_certs_unittest.cc
++++ b/nss/gtests/certdb_gtest/decode_certs_unittest.cc
+@@ -21,8 +21,21 @@ TEST_F(DecodeCertsTest, EmptyCertPackage
+   unsigned char emptyCertPackage[] = {0x30, 0x0f, 0x06, 0x09, 0x60, 0x86,
+                                       0x48, 0x01, 0x86, 0xf8, 0x42, 0x02,
+                                       0x05, 0xa0, 0x02, 0x30, 0x00};
+   EXPECT_EQ(nullptr, CERT_DecodeCertFromPackage(
+                          reinterpret_cast<char*>(emptyCertPackage),
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
+--- a/nss/lib/pkcs7/certread.c
++++ b/nss/lib/pkcs7/certread.c
+@@ -134,16 +134,21 @@ SEC_ReadPKCS7Certs(SECItem *pkcs7Item, C
+                            pkcs7Item) != SECSuccess) {
+         goto done;
+     }
+ 
+     if (GetContentTypeTag(&contentInfo) != SEC_OID_PKCS7_SIGNED_DATA) {
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
+     if (certs) {
+         count = 0;
+ 
+         while (*certs) {
+             count++;
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index f03473b1a..8b59f7ea8 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://CVE-2020-12403_1.patch \
            file://CVE-2020-12403_2.patch \
            file://CVE-2021-43527.patch \
+           file://CVE-2022-22747.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.17.1



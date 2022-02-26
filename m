Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC03C433FE
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:41:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.6802.1645890086121871856
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Op0EyV4W;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso7462711pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F8F3o9lIwhE04Bw+5M8h6XVYwzPGSXApEwq2twgMBFM=;
        b=Op0EyV4Wr0jfc5fc+7SJlMbM/y7gtcWE46XSD7+J6i4X5HqnE+gPN7tmMZHy07/jW4
         zDDLWNcy924fm4jAptROn06sysr1nNWNv+BT4u5PLfctliwwpXX6SsShqzhLFSGu2HMK
         s4/uMsfqNEbjDjHFY6F4kfGWsZIBSjhhgD2hOBJmGq5Q28hW62dFSUuRkZczwve/ugIk
         SXRoNdYWFEVQ27GIf0sS0vhLfu9HsMDRiATQgTIXj4AeGfkz2pH8/ii2iNqh9Y83hSzp
         vOvZcHN6jGrOlGVOpLK6QY4WhJ6EcUBYIhuSrdHyUSCdKBZgNSrff+21qqH7jTxQfeIK
         CrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8F3o9lIwhE04Bw+5M8h6XVYwzPGSXApEwq2twgMBFM=;
        b=gXMGl/s320xXYaiX482b5Ro4zO7EygRO2sqR5t0g5Dyz9XVUrKWmxLmUXKmMZ2QDtF
         GWnZ2/qE8nJEwCXlb3eGGqMdnpyNqc7fA3pDaMS1f4rQGCjASXAtVjgUNKX+3nmR+W5X
         zgvdm4Am+rtLiC1idWSaoR8WE3Wu4FPExzxvAH+iaz34x0UBiX7xxIm76Tb8l0RhxTnx
         qzq4BOZWadGldAz5pS7IM3mf/vb0yBKRyQKj/+Yfj4m6QpvKwxdfZvO63YtdVqTRIQPR
         aJvQE8S/SKJ0rnA89RkhQJkMK/KVkEsPHeD7qBBCKm8GuCUYQ/PhHBZd+/8UngZjJiYe
         Ocwg==
X-Gm-Message-State: AOAM531xtKlLvd16p71KKkHWXCKO4ivNzgoFaLSFgbj851rGP/I/waoo
	93ecnh5Vnx5aRsLp4X/1xjTpDzwMWRg=
X-Google-Smtp-Source: 
 ABdhPJzp2zIdKS8MSQsVCkJXCJY8CgklRSGDMIq7SPebOIeS9Jt0BAYywj1d5hbih2HRUQj9U/i/KA==
X-Received: by 2002:a17:90a:7889:b0:1bc:7786:2aac with SMTP id
 x9-20020a17090a788900b001bc77862aacmr8473911pjk.47.1645890085461;
        Sat, 26 Feb 2022 07:41:25 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004e136d54a15sm7676075pfv.105.2022.02.26.07.41.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:41:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/5] nss: Add fix for CVE-2022-22747
Date: Sat, 26 Feb 2022 07:41:16 -0800
Message-Id: 
 <aa5b9a1ff04212f6c725128730d4e36bdadf6516.1645890015.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645890015.git.akuster808@gmail.com>
References: <cover.1645890015.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 15:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95546

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2022-22747

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nss/nss/CVE-2022-22747.patch              | 63 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch b/meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch
new file mode 100644
index 0000000000..cccb73187d
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
index f03473b1a0..8b59f7ea8f 100644
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
2.25.1



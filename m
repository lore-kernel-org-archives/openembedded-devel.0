Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F735C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 05:33:14 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.11485.1636695193657029100
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 21:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GYG+sj3k;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id n23so7094732pgh.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 21:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1CHphO9RjhWzIQ5QA2JVW8intoJUqsxHfty6n2doX2M=;
        b=GYG+sj3kajal3epA7rHMrU3dGzVGbvSnu+KQ0BupEat4/fEa/oozPkBsO4o7XaSKyQ
         R3+FuGyQAySvaQEXKBNxBt3f50B+/zMgrLHxHllcqSlksiyq5IY2OTBbBk6RdM/m51Lu
         j9NBCdSl5QRIYDFL62NW+BQ6oAXI3/C/DHC7NQF7clqyUypPYnrO09xYuM8dQDahB+/Z
         VxX00ix+ux6yhlwBFUKZex3TCZw05ijC54rM/AvQMgqjPd+Sdy6btRa55nuwI4PoIuw1
         31tJrDCJbX5rUnwr14AwbbYWq1UBmQCRRadhUN6dmsVGXZLWtAw7YTr9K30leaPBjXyx
         Kp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1CHphO9RjhWzIQ5QA2JVW8intoJUqsxHfty6n2doX2M=;
        b=z5aSJZvaVuJ1TpnPAnKp8hBYCnhjaB3K7VkQVKU3/VAQ3sHJcVOZP46aw6hQz38p39
         ZZZkyOhTq9X/eDzQepFzJBGLTe6FfwIS4o2zQUE+9A//R9UKdUunpitjExI3EdjDDX6L
         jfL1nmzfmqPnPxeJ6DGj7G6O9CL6tUWfJWyjXB2415VyHIu7YrgdWVvEiEmAATv2HYPw
         Goy3gg1t25VqaodcYhotGWyBIMo15ZRws2rsWyiqZ+dRB1G5wqB1PeyujxLfMsQMlK8F
         s6uNSF5obbujFcXMD+VJ446K5tsWlcOJC4iQZZ6bK4O1w+z5Mn+KI9BOpPDzzvF83DHS
         OoHA==
X-Gm-Message-State: AOAM530vjSSN89kAPIeX5FgLlSi/o8ABH9ELR+qC/M5JG0b7OEo9bu+w
	O0Od8pnP74vO4+9+CemRko+h+Q53/egPYw==
X-Google-Smtp-Source: 
 ABdhPJwA63a1++lebevZHqVF2OcBQvIfzIGZsS1yCGQun+8Orf4bwqlT8lMFIoKz+Efd81yW5ZQmyg==
X-Received: by 2002:a05:6a00:1348:b0:481:179c:ce9b with SMTP id
 k8-20020a056a00134800b00481179cce9bmr11637390pfu.27.1636695192836;
        Thu, 11 Nov 2021 21:33:12 -0800 (PST)
Received: from localhost.localdomain ([103.238.107.155])
        by smtp.gmail.com with ESMTPSA id
 u6sm4899974pfg.157.2021.11.11.21.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 21:33:12 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-oe][dunfell][PATCH] nss: Fix CVE-2020-12403
Date: Fri, 12 Nov 2021 11:02:36 +0530
Message-Id: <20211112053236.17530-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 05:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93912

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch for CVE-2020-12403

Link:
https://github.com/nss-dev/nss/commit/9ff9d3925d31ab265a965ab1d16d76c496ddb5c8
https://github.com/nss-dev/nss/commit/06b2b1c50bd4eaa7f65d858e5e3f44f678cb3c45

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../nss/nss/CVE-2020-12403_1.patch            | 65 +++++++++++++++
 .../nss/nss/CVE-2020-12403_2.patch            | 80 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  2 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12403_1.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2020-12403_1.patch b/meta-oe/recipes-support/nss/nss/CVE-2020-12403_1.patch
new file mode 100644
index 0000000000..a229a2d20f
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2020-12403_1.patch
@@ -0,0 +1,65 @@
+From 9ff9d3925d31ab265a965ab1d16d76c496ddb5c8 Mon Sep 17 00:00:00 2001
+From: Benjamin Beurdouche <bbeurdouche@mozilla.com>
+Date: Sat, 18 Jul 2020 00:13:38 +0000
+Subject: [PATCH] Bug 1636771 - Fix incorrect call to Chacha20Poly1305 by
+ PKCS11. r=jcj,kjacobs,rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D74801
+
+--HG--
+extra : moz-landing-system : lando
+---
+ nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc | 11 +++++++++--
+ nss/lib/freebl/chacha20poly1305.c                       |  2 +-
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+CVE: CVE-2020-12403
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/9ff9d3925d31ab265a965ab1d16d76c496ddb5c8]
+Comment: Refreshed path for whole patchset
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+diff --git a/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc b/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc
+index 41f9da71d6..3ea17678d9 100644
+--- a/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc
++++ b/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc
+@@ -45,7 +45,7 @@ class Pkcs11ChaCha20Poly1305Test
+     SECItem params = {siBuffer, reinterpret_cast<unsigned char*>(&aead_params),
+                       sizeof(aead_params)};
+ 
+-    // Encrypt with bad parameters.
++    // Encrypt with bad parameters (TagLen is too long).
+     unsigned int encrypted_len = 0;
+     std::vector<uint8_t> encrypted(data_len + aead_params.ulTagLen);
+     aead_params.ulTagLen = 158072;
+@@ -54,9 +54,16 @@ class Pkcs11ChaCha20Poly1305Test
+                      &encrypted_len, encrypted.size(), data, data_len);
+     EXPECT_EQ(SECFailure, rv);
+     EXPECT_EQ(0U, encrypted_len);
+-    aead_params.ulTagLen = 16;
++
++    // Encrypt with bad parameters (TagLen is too short).
++    aead_params.ulTagLen = 2;
++    rv = PK11_Encrypt(key.get(), kMech, &params, encrypted.data(),
++                      &encrypted_len, encrypted.size(), data, data_len);
++    EXPECT_EQ(SECFailure, rv);
++    EXPECT_EQ(0U, encrypted_len);
+ 
+     // Encrypt.
++    aead_params.ulTagLen = 16;
+     rv = PK11_Encrypt(key.get(), kMech, &params, encrypted.data(),
+                       &encrypted_len, encrypted.size(), data, data_len);
+ 
+diff --git a/nss/lib/freebl/chacha20poly1305.c b/nss/lib/freebl/chacha20poly1305.c
+index 970c6436da..5c294a9eaf 100644
+--- a/nss/lib/freebl/chacha20poly1305.c
++++ b/nss/lib/freebl/chacha20poly1305.c
+@@ -81,7 +81,7 @@ ChaCha20Poly1305_InitContext(ChaCha20Poly1305Context *ctx,
+         PORT_SetError(SEC_ERROR_BAD_KEY);
+         return SECFailure;
+     }
+-    if (tagLen == 0 || tagLen > 16) {
++    if (tagLen != 16) {
+         PORT_SetError(SEC_ERROR_INPUT_LEN);
+         return SECFailure;
+     }
+
diff --git a/meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch b/meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch
new file mode 100644
index 0000000000..7b093d0cda
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch
@@ -0,0 +1,80 @@
+From 06b2b1c50bd4eaa7f65d858e5e3f44f678cb3c45 Mon Sep 17 00:00:00 2001
+From: Benjamin Beurdouche <bbeurdouche@mozilla.com>
+Date: Sat, 18 Jul 2020 00:13:14 +0000
+Subject: [PATCH] Bug 1636771 - Disable PKCS11 incremental mode for ChaCha20.
+ r=kjacobs,rrelyea
+
+Depends on D74801
+
+Differential Revision: https://phabricator.services.mozilla.com/D83994
+
+--HG--
+extra : moz-landing-system : lando
+---
+ nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc | 49 +++++++++++++++++++++
+ nss/lib/softoken/pkcs11c.c                      |  1 +
+ 2 files changed, 50 insertions(+)
+
+CVE: CVE-2020-12403
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/06b2b1c50bd4eaa7f65d858e5e3f44f678cb3c45]
+Comment: Refreshed path for whole patchset and removed change for pkcs11c.c
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+diff --git a/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc b/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc
+index 38982fd885..700750cc90 100644
+--- a/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc
++++ b/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc
+@@ -77,4 +77,53 @@ TEST(Pkcs11CipherOp, SingleCtxMultipleUnalignedCipherOps) {
+   NSS_ShutdownContext(globalctx);
+ }
+ 
++TEST(Pkcs11CipherOp, SingleCtxMultipleUnalignedCipherOpsChaCha20) {
++  PK11SlotInfo* slot;
++  PK11SymKey* key;
++  PK11Context* ctx;
++
++  NSSInitContext* globalctx =
++      NSS_InitContext("", "", "", "", NULL,
++                      NSS_INIT_READONLY | NSS_INIT_NOCERTDB | NSS_INIT_NOMODDB |
++                          NSS_INIT_FORCEOPEN | NSS_INIT_NOROOTINIT);
++
++  const CK_MECHANISM_TYPE cipher = CKM_NSS_CHACHA20_CTR;
++
++  slot = PK11_GetInternalSlot();
++  ASSERT_TRUE(slot);
++
++  // Use arbitrary bytes for the ChaCha20 key and IV
++  uint8_t key_bytes[32];
++  for (size_t i = 0; i < 32; i++) {
++    key_bytes[i] = i;
++  }
++  SECItem keyItem = {siBuffer, key_bytes, 32};
++
++  uint8_t iv_bytes[16];
++  for (size_t i = 0; i < 16; i++) {
++    key_bytes[i] = i;
++  }
++  SECItem ivItem = {siBuffer, iv_bytes, 16};
++
++  SECItem* param = PK11_ParamFromIV(cipher, &ivItem);
++
++  key = PK11_ImportSymKey(slot, cipher, PK11_OriginUnwrap, CKA_ENCRYPT,
++                          &keyItem, NULL);
++  ctx = PK11_CreateContextBySymKey(cipher, CKA_ENCRYPT, key, param);
++  ASSERT_TRUE(key);
++  ASSERT_TRUE(ctx);
++
++  uint8_t outbuf[128];
++  // This is supposed to fail for Chacha20. This is because the underlying
++  // PK11_CipherOp operation is calling the C_EncryptUpdate function for
++  // which multi-part is disabled for ChaCha20 in counter mode.
++  ASSERT_EQ(GetBytes(ctx, outbuf, 7), SECFailure);
++
++  PK11_FreeSymKey(key);
++  PK11_FreeSlot(slot);
++  SECITEM_FreeItem(param, PR_TRUE);
++  PK11_DestroyContext(ctx, PR_TRUE);
++  NSS_ShutdownContext(globalctx);
++}
++
+ }  // namespace nss_test
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index ac046ed0fe..14f670c32a 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -37,6 +37,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch \
            file://CVE-2020-12401.patch \
            file://CVE-2020-6829_12400.patch \
+           file://CVE-2020-12403_1.patch \
+           file://CVE-2020-12403_2.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.17.1



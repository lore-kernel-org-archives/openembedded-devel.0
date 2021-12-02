Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A47CC433FE
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 12:19:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.7247.1638447553303463088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A5ikEpia;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so4493364pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oS0we338D7shjwaZEUpLsYz26G1xVhe57He2ZGsYGlQ=;
        b=A5ikEpiaA8OaIMogD8+nR5EL2gUpkk+0qpfRX2KhdeozEn/NOo8HA8++rXyZugEz5I
         As+gTcFPRoOsfr/rp2za7zkyfIl+R6yqLyuWRtaAYJ1mnRTbFCYa0M6q/JGDLQxWQM4Z
         AM31R67v9yxTzwW+YI0CiwggFat7xnC59Fkqux6sEsK33oHrDQbiNigzBuzw9Sd0diSW
         sUbumBRP5Cy1ZB6WzQSuK30ZWkpwV5d43KuAeXjUMyC2PlO0TcpmNASS5ZHq0+QMQsnN
         /MVqFpm2PiEQGqR0G9gs/9F3gKzpdy/799Um7U8HTPuVSTnir5X+uaQsmnAxM+/DxK+x
         FiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oS0we338D7shjwaZEUpLsYz26G1xVhe57He2ZGsYGlQ=;
        b=48dSvQvEkCZ//W0h9yntJLJVdwPdQ53nhsEJkkYAWRkSC3au+Im60IVTfyJB+LGU9i
         Ctl+2s4aMbdahIUwIdM64R6xO8CkSk4Ph4HwjnSPDvV9P6XTyZeWg4Axvw8Q19oqqYOF
         FZU2JaxLPbg3WdX0+ACeOVdQx0nazyccdjEDtesTVPFDQZGCaNFhwotHIQdU+u1KwbP3
         XdNTWkcVLrXL8ylpocRa+vhrBbg7drr4dIESy+XgccQHrSjvCSBT9wk32G81wJYsbrQy
         2qhQCX18cKRAhI7vAqW0PZHv+nZk7386SXuzNYCIB+Xn0t9Y4PiWaZvwbAWEX2uG4Da9
         ngCw==
X-Gm-Message-State: AOAM533XibFTeyuzo6jBi+zDossdRCVRT73kN6PMe79ao42OjmVeZs+7
	pDVtnGTM+Mgc1q9zGqkW6Pm0j1YhpcQ=
X-Google-Smtp-Source: 
 ABdhPJxiNnINy8quK6Zn6pSCsbsaC2sdLx7dbODeVb+sqcQHoPZxKBHN9IFzA1/0frGFFI20ilfrPg==
X-Received: by 2002:a17:903:2091:b0:142:8567:e794 with SMTP id
 d17-20020a170903209100b001428567e794mr15089841plc.50.1638447552398;
        Thu, 02 Dec 2021 04:19:12 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9b75:b57e:d1aa:6e39])
        by smtp.gmail.com with ESMTPSA id
 d2sm3396881pfj.42.2021.12.02.04.19.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:19:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/5] nss: Fix CVE-2020-12403
Date: Thu,  2 Dec 2021 04:19:02 -0800
Message-Id: 
 <bcf93614a0f89585360e534b4751220afe052013.1638447451.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638447451.git.akuster808@gmail.com>
References: <cover.1638447451.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 12:19:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94180

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch for CVE-2020-12403

Link:
https://github.com/nss-dev/nss/commit/9ff9d3925d31ab265a965ab1d16d76c496ddb5c8
https://github.com/nss-dev/nss/commit/06b2b1c50bd4eaa7f65d858e5e3f44f678cb3c45

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1



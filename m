Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52495C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 05:51:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.14425.1752817871543028505
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 22:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Xo9RHcCE;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167b30so16417135ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 22:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752817871; x=1753422671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLz2yFvdjtCbTsolLirFxvmmDydlOl/zp82nLWFjU8w=;
        b=Xo9RHcCEgpdqEhJ6OZAzSeLgRJiTbxvJu/ZimbBMrEZEt6VeDQBtv/KaG2vNpUDBCh
         c3CSzglft7BecROuTQVRU/X49j6y5ZpKZNPK3trIgzYFohYU7IAq6PUKb24DNHgBHvf8
         6iXfc4YWDSfoTWvsUg6v+0yermwqr5YGhaSq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817871; x=1753422671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLz2yFvdjtCbTsolLirFxvmmDydlOl/zp82nLWFjU8w=;
        b=ikgerlK3ITxrtRsTEL99K7fKwrwG0gkm0zDSwjzMUIQ1dV4UZW3vDx93SN14137u2/
         tLP5wt5K6XHkjrSasODjQvI7a5HhvmZry/+lOl34rW5rPwFWjemWy0ngF9gflLWNpT37
         LFJwts7p6PeG+zMJcm2oEWNOEwLU9RggjXRdRTZExlgbfkLu63N2INs7U04wAckTCIGx
         fDByeBi4cd/UXTF5jgxMW6/LVC6zy/t5IderGUOI2vBKxxuN5QEWwZIXvxXDs1wuzBqN
         wcXurrlmMnUI6HB3KZYWIn3K3m/YNv/WFmUizXb5HrLyes09WS5NrJ/IoSBg7eIKMeEF
         ug7A==
X-Gm-Message-State: AOJu0Yx2LBhlRoLcLX9CygDF0K7CL943ZKlayjHZ4iUd6mV9Oi4zyH6h
	by80eUV0lv/oBPcqOUVx09Cv3EzmEcxo2086dJMN3cSrZ707/jM5VZQGdtEzo/001pSDBpPmONk
	Ai31y
X-Gm-Gg: ASbGncvgDg7Hdc9WoNGFj9Pn0EzymWfhk8bSmkcQHsilS5EL50s5acy1XKRnRfx9q9y
	LHCt4bVF/oxU+Fx1ThvBOqUWOeAFQE3+IocuBJsPhtf9WvYzsIlJaIArvRMvNcxrFNQjoZbTQnO
	K0+VXOJNf/Rqe0ULgGYV9XhX1vKyrFfSB83NN4KeBX0vLVp055K2YWF4DJ6FoZHxkGEjx50igQo
	R/c3j+nuoR8I78D8Xa3SKJcgusTYcwvssigdLCRyRBD/OHuZVcl1yQqsVyJD6cH0dsgBUNhHach
	7bUGpQCo8HL4J3s/cuGQt4c0BEh8XCJoJrxXDIxW1HHDOUUHCpBUSg4fa9QxCoYDVQYxp9pAAYP
	Zu/neelfbEQoXd1SEuYViOXagdR5pEVAibz0=
X-Google-Smtp-Source: AGHT+IHFRo/SAP91WFXTCnJV6vEEU1fxwkg6lNnzqOgexET1d4SjeKnauRyk/sbmAI0D9Bh4SsOiRw==
X-Received: by 2002:a17:902:d4ca:b0:235:2ac3:51f2 with SMTP id d9443c01a7336-23e2578d93amr130693195ad.45.1752817870546;
        Thu, 17 Jul 2025 22:51:10 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3c95sm5945425ad.34.2025.07.17.22.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 22:51:10 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] libssh: fix CVE-2025-5351 & CVE-2025-5372
Date: Fri, 18 Jul 2025 11:20:50 +0530
Message-ID: <20250718055050.32393-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 05:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118622

* CVE-2025-5351 - Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/commit/?id=6ddb730a27338983851248af59b128b995aad256
* CVE-2025-5372 - Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/commit/?id=a9d8a3d44829cf9182b252bc951f35fb0d573972

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2025-5351.patch         |  38 +++++
 .../libssh/libssh/CVE-2025-5372.patch         | 150 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
 3 files changed, 190 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch
new file mode 100644
index 0000000000..09bf3d8bd5
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch
@@ -0,0 +1,38 @@
+From 6ddb730a27338983851248af59b128b995aad256 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 6 May 2025 22:43:31 +0200
+Subject: CVE-2025-5351 pki_crypto: Avoid double-free on low-memory conditions
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6ddb730a27338983851248af59b128b995aad256]
+CVE: CVE-2025-5351
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/pki_crypto.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/pki_crypto.c b/src/pki_crypto.c
+index 5b0d7ded..aec49544 100644
+--- a/src/pki_crypto.c
++++ b/src/pki_crypto.c
+@@ -2023,6 +2023,7 @@ ssh_string pki_publickey_to_blob(const ssh_key key)
+             bignum_safe_free(bn);
+             bignum_safe_free(be);
+             OSSL_PARAM_free(params);
++            params = NULL;
+ #endif /* OPENSSL_VERSION_NUMBER */
+             break;
+         }
+@@ -2143,6 +2144,7 @@ ssh_string pki_publickey_to_blob(const ssh_key key)
+  */
+ #if 0
+                 OSSL_PARAM_free(params);
++                params = NULL;
+ #endif /* OPENSSL_VERSION_NUMBER */
+ 
+                 if (key->type == SSH_KEYTYPE_SK_ECDSA &&
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch
new file mode 100644
index 0000000000..c9c0cfe156
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch
@@ -0,0 +1,150 @@
+From a9d8a3d44829cf9182b252bc951f35fb0d573972 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 14 May 2025 14:07:58 +0200
+Subject: CVE-2025-5372 libgcrypto: Simplify error checking and handling of
+ return codes in ssh_kdf()
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=a9d8a3d44829cf9182b252bc951f35fb0d573972]
+CVE: CVE-2025-5372
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/libcrypto.c | 62 ++++++++++++++++++++++---------------------------
+ 1 file changed, 28 insertions(+), 34 deletions(-)
+
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index 4f945d90..76e067d3 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -163,7 +163,7 @@ int ssh_kdf(struct ssh_crypto_struct *crypto,
+             uint8_t key_type, unsigned char *output,
+             size_t requested_len)
+ {
+-    int rc = -1;
++    int ret = SSH_ERROR, rv;
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+     EVP_KDF_CTX *ctx = EVP_KDF_CTX_new_id(EVP_KDF_SSHKDF);
+ #else
+@@ -185,81 +185,75 @@ int ssh_kdf(struct ssh_crypto_struct *crypto,
+     }
+ 
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+-    rc = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_MD,
++    rv = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_MD,
+                       sshkdf_digest_to_md(crypto->digest_type));
+-    if (rc != 1) {
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_KEY, key, key_len);
+-    if (rc != 1) {
++    rv = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_KEY, key, key_len);
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_SSHKDF_XCGHASH,
++    rv = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_SSHKDF_XCGHASH,
+                       crypto->secret_hash, crypto->digest_len);
+-    if (rc != 1) {
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_SSHKDF_TYPE, key_type);
+-    if (rc != 1) {
++    rv = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_SSHKDF_TYPE, key_type);
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_SSHKDF_SESSION_ID,
++    rv = EVP_KDF_ctrl(ctx, EVP_KDF_CTRL_SET_SSHKDF_SESSION_ID,
+                       crypto->session_id, crypto->session_id_len);
+-    if (rc != 1) {
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = EVP_KDF_derive(ctx, output, requested_len);
+-    if (rc != 1) {
++    rv = EVP_KDF_derive(ctx, output, requested_len);
++    if (rv != 1) {
+         goto out;
+     }
+ #else
+-    rc = OSSL_PARAM_BLD_push_utf8_string(param_bld, OSSL_KDF_PARAM_DIGEST,
++    rv = OSSL_PARAM_BLD_push_utf8_string(param_bld, OSSL_KDF_PARAM_DIGEST,
+                                          md, strlen(md));
+-    if (rc != 1) {
+-        rc = -1;
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = OSSL_PARAM_BLD_push_octet_string(param_bld, OSSL_KDF_PARAM_KEY,
++    rv = OSSL_PARAM_BLD_push_octet_string(param_bld, OSSL_KDF_PARAM_KEY,
+                                           key, key_len);
+-    if (rc != 1) {
+-        rc = -1;
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = OSSL_PARAM_BLD_push_octet_string(param_bld,
++    rv = OSSL_PARAM_BLD_push_octet_string(param_bld,
+                                           OSSL_KDF_PARAM_SSHKDF_XCGHASH,
+                                           crypto->secret_hash,
+                                           crypto->digest_len);
+-    if (rc != 1) {
+-        rc = -1;
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = OSSL_PARAM_BLD_push_octet_string(param_bld,
++    rv = OSSL_PARAM_BLD_push_octet_string(param_bld,
+                                           OSSL_KDF_PARAM_SSHKDF_SESSION_ID,
+                                           crypto->session_id,
+                                           crypto->session_id_len);
+-    if (rc != 1) {
+-        rc = -1;
++    if (rv != 1) {
+         goto out;
+     }
+-    rc = OSSL_PARAM_BLD_push_utf8_string(param_bld, OSSL_KDF_PARAM_SSHKDF_TYPE,
++    rv = OSSL_PARAM_BLD_push_utf8_string(param_bld, OSSL_KDF_PARAM_SSHKDF_TYPE,
+                                          (const char*)&key_type, 1);
+-    if (rc != 1) {
+-        rc = -1;
++    if (rv != 1) {
+         goto out;
+     }
+ 
+     params = OSSL_PARAM_BLD_to_param(param_bld);
+     if (params == NULL) {
+-        rc = -1;
+         goto out;
+     }
+ 
+-    rc = EVP_KDF_derive(ctx, output, requested_len, params);
+-    if (rc != 1) {
+-        rc = -1;
++    rv = EVP_KDF_derive(ctx, output, requested_len, params);
++    if (rv != 1) {
+         goto out;
+     }
+ #endif /* OPENSSL_VERSION_NUMBER */
++    ret = SSH_OK;
+ 
+ out:
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+@@ -267,8 +261,8 @@ out:
+     OSSL_PARAM_free(params);
+ #endif
+     EVP_KDF_CTX_free(ctx);
+-    if (rc < 0) {
+-        return rc;
++    if (ret < 0) {
++        return ret;
+     }
+     return 0;
+ }
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 3123500f51..64835c5e08 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
            file://CVE-2025-5318.patch \
+           file://CVE-2025-5351.patch \
+           file://CVE-2025-5372.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.49.0



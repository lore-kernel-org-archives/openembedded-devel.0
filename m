Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD20CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:53:48 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.43186.1758513678922482175
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 21:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bs1C9KyM;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b551991a9baso288903a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 21:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758513678; x=1759118478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srNM4KQYuPZ8eE7bnI9+u1zjYmTkqM+fdv3rQ3a2+aM=;
        b=Bs1C9KyM0Xv8tFrTIASSaV3+j6fFKDitXsTGdGr7WTZGB3//wIi7W6GL9cr/yt3SGj
         Q2re7KLq7eI3NNKbcyrXiWy/hbSdXMVTdknb5XUZ0AGojBm5AMED82eHZhSRqhbA3hHi
         nZrdOIiLVZwm2JyoQEQLXDMrDCi1xfFu6BBhnfDYvqKeekCk3e2IUV6sBCwdTGFlkpLe
         DPwGqO74SBfg8lBiOz25devW+m/EOYpxZzvFLrC+xYwdllRAMBN+mA9s7o0fjRlc9BMl
         abDVUS2Qu+59anFbz6TS7nhOFcMs4D6PVSIxVO2+z5x2eTf/pjNLueBBGuOZ6jjVWXgS
         z9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758513678; x=1759118478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srNM4KQYuPZ8eE7bnI9+u1zjYmTkqM+fdv3rQ3a2+aM=;
        b=IwNW52S11gS0RPMzUf/KFvR3hk7EbhlgQ5qwFSncH/A5lhnDyq+5w5+IVxilYEOtX4
         Hdz+h9vfyqzMpOGuaoXaRBnnRXkue0/bxWiND0wT5ESiBRCeTtdJO4VF9RgAummzX/yd
         DgQdvLdrQP5BgWyFGcuM6wou3ixMimL2k2EhbzCwgtn+rmKMxq9bDSXG/l58+eZAWUYl
         CHIBNdSoS65w2zjwlc7B5GuC+JBI6k9jjtlZI5LmGfzSG+QvcqNsGvV4yJokcUaQz75J
         bKjqoZb2aUPcnbDqt1f5qdXsBrlQdUhwpbvt4RhLQ/N4m5gMsDAKgWCl7dsXYEFR7DJJ
         idvQ==
X-Gm-Message-State: AOJu0YyeUzjhg9Yuk2cEyMcPnLUa7cvv4xim0qEeyuXwsZjqnASJvqYU
	QdCxvI3BId0btc52sQt/KgO6cWoLX2a5X9r+uOImCKCwFCUzc1g9VZfP8atJiA==
X-Gm-Gg: ASbGnctgRh7SVNUtv2ReRqnK2zyeiEyPKlFmjyLb+jI51ArwO9Xg8N6TQ98X0LOqfOW
	ftYplQ7jElRUKyScXewadUdfI+8m7/dzuAnhi4B4BmPgK8YgnmdwclizhgvPYrHw5Odvo47I5G5
	4tg4Cwk/sFsLQyT7pLDWrzu4lmazNVAbOL/zz4gQXfFem8xXgj/SUKbjMh0K5S1HxzPhMvVzH7g
	SCkI9F4EeldcafV2jtR3M/Xnt9nTVlorUTsZO8P83eY9qAK8yIdL3byrDRcspgo/fwilhOIoWo4
	wptywZMmca0bXsGd6OrIiKpJ/lB/upNfCTjBDCe0AtmzUGGRdLk/+qgLsyNA9nPK1ffjuX2BySx
	+vcJMAq1bxmJv+8kJml+vDHYJzvhgYKXLRdNDLA==
X-Google-Smtp-Source: AGHT+IFxf6mCADX5FGR/LFsgFt/pHPxPGCyRmmU9sTZ6/Xanp2s28BfUDuLqBHwYIeIZsj5jbpv7qA==
X-Received: by 2002:a17:90b:1b49:b0:32e:685f:ccd5 with SMTP id 98e67ed59e1d1-33098398134mr7392196a91.7.1758513677871;
        Sun, 21 Sep 2025 21:01:17 -0700 (PDT)
Received: from LL-3324L.kpit.com ([223.233.85.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77ecd565828sm7482089b3a.89.2025.09.21.21.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 21:01:17 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [meta-oe][master][PATCH] iperf3: Fix CVE-2025-54349
Date: Mon, 22 Sep 2025 09:33:01 +0530
Message-Id: <20250922040301.2149568-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119643

This commit fix heap overflow for iperf3 package

Reference: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54349.patch        | 80 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
new file mode 100644
index 0000000000..61e1888685
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
@@ -0,0 +1,80 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54349
+CVE: CVE-2025-54349
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+---
+diff --git a/iperf_auth.c b/iperf_auth.c
+index 72e85fc..91c4133 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
+ }
+ 
+ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
++    int ret =0;	
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_PKEY_CTX *ctx;
+ #else
+@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     keysize = RSA_size(rsa);
+ #endif
+     rsa_buffer  = OPENSSL_malloc(keysize * 2);
+-    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
++    // Note: +1 for NULL
++    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+@@ -322,11 +324,12 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+ #if OPENSSL_VERSION_MAJOR >= 3
+     plaintext_len = keysize;
+     EVP_PKEY_decrypt_init(ctx);
+-    int ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
++
++    ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
+     if (ret < 0){
+         goto errreturn;
+     }
+-    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
++    ret = EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
+     EVP_PKEY_CTX_free(ctx);
+ #else
+     plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
+@@ -337,7 +340,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     BIO_free(bioBuff);
+ 
+     /* Treat a decryption error as an empty string. */
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         plaintext_len = 0;
+     }
+ 
+@@ -386,7 +389,7 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
+     int plaintext_len;
+     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
+     free(encrypted_b64);
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         return -1;
+     }
+     plaintext[plaintext_len] = '\0';
+@@ -394,16 +397,19 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
+     char *s_username, *s_password;
+     s_username = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_username == NULL) {
++	OPENSSL_free(plaintext);
+ 	return -1;
+     }
+     s_password = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_password == NULL) {
++	OPENSSL_free(plaintext);
+ 	free(s_username);
+ 	return -1;
+     }
+ 
+     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
+     if (rc != 3) {
++	OPENSSL_free(plaintext);
+ 	free(s_password);
+ 	free(s_username);
+ 	return -1;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index 08f29937c0..265611e533 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -16,7 +16,8 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://0001-fix-build-with-gcc-15.patch \
-           "
+           file://CVE-2025-54349.patch \
+          "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
 
-- 
2.34.1



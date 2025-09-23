Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACC3CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9541.1758603185216303146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 21:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BM91u9GS;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-267fa729a63so9820665ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758603184; x=1759207984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srNM4KQYuPZ8eE7bnI9+u1zjYmTkqM+fdv3rQ3a2+aM=;
        b=BM91u9GS8lVuuApjcEXA9FpuCKehUk5M5pSMq/7C1PfmzQCwpNbcgWQV/GMnke/pSz
         JHpwEF/FK340clRD2fu9GH1DrQduoh9FYLjB8NOQPSEEMMgKXtC6Mu2VriSKBjEzFiiN
         a6q+t5keLFQwAeBAsNF4C8kEbdd2vO3XIklyEEt1xb7icDK435mf3/tZ7ZATztceFN+3
         +CYbm25rsZd7mgphheLykabdlHy25ZYShgjUl6S+M7KS16drvpGiv52YHFpD+ul7+2M2
         wpnhcNuyoljpUft8y/uDF8Qg2qQ7FQic8zq/yS+53JHoTOPoVmvxvYlSOpusm2iCP7IO
         X0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758603184; x=1759207984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srNM4KQYuPZ8eE7bnI9+u1zjYmTkqM+fdv3rQ3a2+aM=;
        b=Tpb3GgKCjInRcTehFIQJfq5A2HS4E+VYfjIfVDHHw2UTz7gFy/KbU4/dr2pjUlfpD6
         I30AC4zp5CNCdSMXAxhtNsCPBI6MKa0fl9biGyyN2spbsCPUwMpcsBGE10X8fN9t+ReZ
         m25tLpWi2T9wWlZ9p2cOyexbJjoIAeioeBCWlWJkFdqmWH5L6yUvFyoWrJNF/fPT9Djd
         MatDLbMUmy0KPXljjY5KjljMmizJKIwIKh+FbdIihsWK+cKX73digujWN4heEFSc88vw
         czBseC5t77AeCbDX43chiiPI+9YwvkVGjfXaBlcKQ8M7F9ofx/P8Joaol72MwQ5Vsp1x
         JE+Q==
X-Gm-Message-State: AOJu0Yx+wohre7Uf3faTC3nfhZ4umqC32p32oXvWQLcHcubycwevlb1d
	tbqz6X0Hi+/aNvJRGEG9MWncdm4BjxF+McP6MvJCzroJyCyX81MpBxUnHKLF2A==
X-Gm-Gg: ASbGncv70Bx2T+fqzHQmnVZFE8eL3yLHyfxKUe1p0j54/zkQVmDsZDiF8V+y4EBwK+0
	Urj0KgS1+qYyBP8Z6P7tT8v0xA+6e7VMuLNQa2tYdRBDhmyoERKOMVqHy3wbKMXkOdG6BB3zMBW
	l7re33pvz0r18jUcrkBgmwH4L8SFdmzPQkH7yWz6r2FTY56SNhYNizBCf7w4mZPVfWdOyTRgJcw
	+uvYAYo77OfMj/TRRZ+fFvRgUAU4NkCqJGDTUnkwi0pKt4fHp58z9wdpT84JAIcQcs35KSUqxTr
	9MJxuiFdg032AEJmstLJa/N0/Ro5QVsBzZruH6BWkMq5FyfofzSBHb8+Uq8upw2nJnwfjaBSppw
	jUafJ5Iz8KTluackYXWF6ixU1lt/0IuSkcM5GC/7H6ZE=
X-Google-Smtp-Source: AGHT+IHNhkXsZA0pj1UYTJJtzCwksZKm6QsMDlauRDchp4M5vhTuw2xBEM+akCXEv91ULxk60uMsjg==
X-Received: by 2002:a17:903:249:b0:26a:f96c:3099 with SMTP id d9443c01a7336-27cc2aac9demr8362655ad.3.1758603184160;
        Mon, 22 Sep 2025 21:53:04 -0700 (PDT)
Received: from LL-3324L.kpit.com ([2401:4900:1c45:4aaf:f702:9ced:7f9b:68e6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df57asm149566215ad.67.2025.09.22.21.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 21:53:03 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [meta-oe][master][PATCH V2 1/2] iperf3: Fix CVE-2025-54349
Date: Tue, 23 Sep 2025 10:24:54 +0530
Message-Id: <20250923045455.2478307-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119658

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



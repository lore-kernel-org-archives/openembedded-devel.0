Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1B4C7619A
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 15:54:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.17367.1679414040780186541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ngN24haz;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id iw3so16488629plb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679414040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvk4jsfa7gDJ8eGsESSV5zlXgC0jP0S89rQWQ2krfho=;
        b=ngN24hazdIbtezuXnkatIvuR4x8RlYUapKQp51IdiZTSubdhy357EkWEI6GcBo7xe3
         WYYBYwLrJieFvacLlclruw51hezoPnChIAIdyCXnjnvsSKrlnDxJtkv/nn+2OI3HaFXq
         D7rhDOSMPc11qHp/ZcGuhPTpOutNhJJL7sjuoD+M7EQQHohb3vOY+QQsfD5zOP7koCL2
         lR+JQOwZKwo0swW6J4mJEpMOZSXDbz+bvB/Iz9LR6d6jWz/9mYXn1tf/bLsyAb/9bAph
         6v1MmXhRU2UN6eQfbM+ilEPMlWNvPdYuqebdRFWJYk1FPZsrz8s4fQSaWiVYrTNMQG1r
         /ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679414040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvk4jsfa7gDJ8eGsESSV5zlXgC0jP0S89rQWQ2krfho=;
        b=sJiZb0JWURHmSoGg+y3yVcLFcAz5QUiaB5+td4vDaUfVa6HZuAVjIbfzG9xldQrBjG
         wRxur6Ws9+KOYb+pXAWIRxLlZ/pJ0kkPuCYeHmS8twEd60lbPcDU4ixa8rb4OjKJ6AI5
         dwyDFJo1M2+ISnjLZHCwl3dY2zHpGZFr+CAiiaSQsyYCVFNQcOJTufURWucODni8nL7R
         AgiX35lbzd3c9Fgn412+bmhaBqxiUN8wdZq55omx4HiDgRg8zsd4/Bv7KBtHzRfEeRoh
         7UKF2JHKFF2OLUny0nUjk8Xdb05lnmMStDCMKjrMB5/VKE15vwQwyHJzVWtTU1a3EOcm
         gwlA==
X-Gm-Message-State: AO0yUKWzI8o6lKIxafPXgovwFL4U5GY0Q6i2hDW5CRdOdugep6/Iw35K
	1GL/DV76sJ3eWx6zkpDfKAMDOp1AHjdVSA==
X-Google-Smtp-Source: AK7set9IinhTZNl73pL+WuzmfRenkrvvr+NJ6HVEsZGlU34eSZiyUOKdaJoEwP0WHk/QHd18YCzeLQ==
X-Received: by 2002:a17:903:645:b0:19c:c9d0:5bf8 with SMTP id kh5-20020a170903064500b0019cc9d05bf8mr2431295plb.35.1679414039879;
        Tue, 21 Mar 2023 08:53:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::86bb])
        by smtp.gmail.com with ESMTPSA id f21-20020a170902ab9500b001a076568da9sm8879210plr.216.2023.03.21.08.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:53:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libssh: Fix build with clang16
Date: Tue, 21 Mar 2023 08:53:55 -0700
Message-Id: <20230321155355.834207-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321155355.834207-1-raj.khem@gmail.com>
References: <20230321155355.834207-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 15:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101619

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...prototype-of-des3_encrypt-des3_decry.patch | 46 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.4.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
new file mode 100644
index 0000000000..19775fa529
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
@@ -0,0 +1,46 @@
+From 0cade4573334571055127a2d4fe3641e2397948d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2023 21:59:19 -0700
+Subject: [PATCH] libgcrypt.c: Fix prototype of des3_encrypt/des3_decrypt
+
+This is to match the prototype for callback functions which are now emitted as
+errors by clang16
+
+Fixes
+
+TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/src/libgcrypt.c:903:20: error: incompatible function pointer types initializing 'void (*)(struct ssh_cipher_struct *, void *, void *, size_t)' (aka 'void (*)(struct ssh_cipher_struct *, void *, void *, unsigned int)') with an expression of type 'void (struct ssh_cipher_struct *, void *, void *, unsigned long)' [-Wincompatible-function-pointer-types]
+    .encrypt     = des3_encrypt,
+                   ^~~~~~~~~~~~
+TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/src/libgcrypt.c:904:20: error: incompatible function pointer types initializing 'void (*)(struct ssh_cipher_struct *, void *, void *, size_t)' (aka 'void (*)(struct ssh_cipher_struct *, void *, void *, unsigned int)') with an expression of type 'void (struct ssh_cipher_struct *, void *, void *, unsigned long)' [-Wincompatible-function-pointer-types]
+    .decrypt     = des3_decrypt
+                   ^~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libgcrypt.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libgcrypt.c b/src/libgcrypt.c
+index da5588ad..e482b654 100644
+--- a/src/libgcrypt.c
++++ b/src/libgcrypt.c
+@@ -469,12 +469,12 @@ static int des3_set_key(struct ssh_cipher_struct *cipher, void *key, void *IV) {
+ }
+ 
+ static void des3_encrypt(struct ssh_cipher_struct *cipher, void *in,
+-    void *out, unsigned long len) {
++    void *out, size_t len) {
+   gcry_cipher_encrypt(cipher->key[0], out, len, in, len);
+ }
+ 
+ static void des3_decrypt(struct ssh_cipher_struct *cipher, void *in,
+-    void *out, unsigned long len) {
++    void *out, size_t len) {
+   gcry_cipher_decrypt(cipher->key[0], out, len, in, len);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index 801644d95a..4b2ced5e50 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "zlib openssl"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10 \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
+           file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
 SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
-- 
2.40.0



Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFDFC46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:15 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.17186.1703059090671808519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=c9WHpz3s;
 spf=pass (domain: mvista.com, ip: 209.85.167.171, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bb7344a0e1so29658b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 23:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703059089; x=1703663889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAqLrn9bAdOLblt5VoOUCO7yHVKU66w5fKjNMRNKNws=;
        b=c9WHpz3ssU1RsxN3+2/zSjjJRU+XF3xrO1QIKGn8Ljm4tbr6OsN5o9sI8BkMUdowzU
         Z0/SV0jkMLu+nLbQQXZdi76Fs7MXjEzxHi8sJfGX5oMGa/VdoP8XCTtIFrEcqEW9eMUZ
         qQNwVIcWu8yaiPuxdO86B3JX5nuQaxwURqtnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059089; x=1703663889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAqLrn9bAdOLblt5VoOUCO7yHVKU66w5fKjNMRNKNws=;
        b=CeinUL7pGJRp+7nYsz8iqvuhCmUBTeRCXJaMxw6Za3dmR3Er51x5eXuzUVzGgEcgpc
         vH7+B/apmlWk7YP8ghzQbm2O05Sw0JM3D0/fH5RM0mQinKHyX8AYNI7sYvY5UlykYzt5
         sgn5HeU5I9kov9YUV1dL2upWNnG2lZQw5ChKZtPoZTDtYZW6p8Vs0k58Q67ncNQckcmp
         XFlHWvOg0XHRLeGk18sv3O3icjXnYxbAtcNe3/6rykzO147dcokWTIo2GEqZOp4xisn2
         lKvX/opVjy9T18fMx2GdB8uMuuTVcZllOLJYcKkk0QBWgp0Ekk5bS8xVeuimoOnNUO3i
         IxQg==
X-Gm-Message-State: AOJu0YycF78tvHaxQGD9QgNF9BuxQHLe/tXvfd8NkklrWEGO24rpjk3r
	FvHsjWANtJctHYjAchlYj7hzwODFDGMtoD/xEeU=
X-Google-Smtp-Source: AGHT+IGUwdUtkc8RFHNC6D5vHHUd5RbIp8qy1TDnnnYunvQsKC2tgHuA8N1QSI1qBKYFW9PSN7mAbg==
X-Received: by 2002:a05:6808:f91:b0:3b9:e48f:d653 with SMTP id o17-20020a0568080f9100b003b9e48fd653mr22693767oiw.66.1703059089098;
        Tue, 19 Dec 2023 23:58:09 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b006d451d8d7f3sm6794230pfo.76.2023.12.19.23.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:58:08 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [OE-core][kirkstone][PATCH v2 3/4] libssh: Fix build with clang16
Date: Wed, 20 Dec 2023 13:25:42 +0530
Message-Id: <20231220075543.96481-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220075543.96481-1-vanusuri@mvista.com>
References: <20231220075543.96481-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 07:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107648

From: Vijay Anusuri <vanusuri@mvista.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=9323b287ef588f41c13f3520de85eb198f6eaf83

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...prototype-of-des3_encrypt-des3_decry.patch | 46 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.4.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
new file mode 100644
index 000000000..19775fa52
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
index 801644d95..4b2ced5e5 100644
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
2.25.1



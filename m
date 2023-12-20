Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AADBC46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 08:55:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.18016.1703062500234635318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 00:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KqDj8z3K;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d3954833a5so3793500b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 00:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703062499; x=1703667299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAqLrn9bAdOLblt5VoOUCO7yHVKU66w5fKjNMRNKNws=;
        b=KqDj8z3K+eBsExg8zz7Zek1HEkKJIM5rSH6YIqe3CSKM2LbqAUHA/qvsNABmfuyIkc
         7Ad1Fs6aJd2ENU4BSiTLQnKsUorF6y+P3Z7QYH9SgJY5UMmWN+oNaXBAgYQzvyMOdm8I
         Gj4/8lALkah2FCIdljxhMw/77rbIpjEh7nXEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062499; x=1703667299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAqLrn9bAdOLblt5VoOUCO7yHVKU66w5fKjNMRNKNws=;
        b=VOPfLLAX9+jgMW/b8zk/HR+0s3X4KLkVuV4bMjwd66Hf/TNVA8Sraw0GGESVcoy2ZY
         v9zBrDv4cOXr0ZfZT4Hm+BTENDhKoT6mVvM3DJdCd4SBlpQ4XVqnuY6An9ZM++LE//ej
         g540mOs+YVF2Yx+dF0dlCzdtVBKkuHpiTmQF6th45dbxo3lgd25rlLkI0Xa2RE5F7CsE
         2IbYdGVUN17jAy4S1o9B3a919ZWqKV+5nCzs247fKNopKFdJbHOsF+4jHo2xm3CL97a4
         qIfEOEmQuDgA0cefx2nm5r3WXnEweyHxQT7k6jzb6funbKiRr+q5OZ+RlUq/dYxsqFUo
         DScA==
X-Gm-Message-State: AOJu0YwHXRPFn3DTv6Nw8HD0lqjk8Xsn23TLb+gsN57sIaa7qfcAnrXn
	zNb2WMGjM6bcSfp5IzGUDtDmxS5WNsTruwl+X5E=
X-Google-Smtp-Source: AGHT+IFKErSQaZr48qGEDHlNl3wp7R7xsy2TLAK23KgL3jNUChcpnLf2g1xXXSDCuiHoy1opngmSmA==
X-Received: by 2002:a05:6a00:278f:b0:6d9:6081:602c with SMTP id bd15-20020a056a00278f00b006d96081602cmr334230pfb.19.1703062498917;
        Wed, 20 Dec 2023 00:54:58 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb2:ae:9c0e:43e0:a383:ef58])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b006d3dd365a76sm7254213pfb.2.2023.12.20.00.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:54:58 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH v3 3/4] libssh: Fix build with clang16
Date: Wed, 20 Dec 2023 14:24:37 +0530
Message-Id: <20231220085438.97520-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220085438.97520-1-vanusuri@mvista.com>
References: <20231220085438.97520-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 08:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107652

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



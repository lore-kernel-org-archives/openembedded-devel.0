Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2790BC3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:41:10 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.7885.1723304462868036756
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIo9TFwr;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0bf677e0feso3128262276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304462; x=1723909262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qdBi2i0vCyyHxQ2wrbDi6WX2mvbqcY62qK/5a6e19aw=;
        b=GIo9TFwrdFXogCpZBw3L+oNL3jpnd6EDUUwRquwRrg80OYCnEI2WnP/St9bpb3yqX2
         PC/wc/vUg0i9xNAw4ejyorNfVORljlF9Kkiwtric7f5uKDqXk9kUZ8gBIgk3ocb6Hx1M
         wll4bnw1PXQ2OX65BOP4TP4i7+7O7+WenuXjQKO853i6GiDVr+gml+VMI6OXtcjJQ6Va
         Xl2Fw9q2ENk2xc1o7sJpI9SLl52SXdJtY6OgCs+RWe09lQe6551fXx2OPkkqQs61khPy
         8pwWMQHFU5eoj3vNr4iY9ZUwICxQ+VQs6MBE5vuSaAlEYFU1rwwu5yck0J9KRlCp+Mer
         Q6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304462; x=1723909262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdBi2i0vCyyHxQ2wrbDi6WX2mvbqcY62qK/5a6e19aw=;
        b=PwMF25kKr9x+mWjlVGXsRXa2/Fx0HKE0QyZnFUhSRq6Z5hslAQ4aZoYDn0UNn+mKWx
         pc6sppw91lo8i2niuE57RnWGFNw6tQQ2qz9K4Ss3dBOCEiWRu1gwhm+cbteEPKqbGm9K
         OuyB29tGvESC7BHz/Wx31A43YPjvZMiJo/RSzDOlMOj382b+Rr4bs/DlmIz+OX5ZHdid
         4U5JyMKLG5ZH5lpWb48/nvXJiASIXLdJsxZpRnAPa/82tyMD7l9Ig808Cj65ndWwPTlD
         FrXJ2WxeLH16x9pxFI3C4hgqhDgpuptjpzh9JDpGyCh+YDDWBTUdFkAkJjjfB4itJq54
         RXtg==
X-Gm-Message-State: AOJu0YwB0RWBeLrvL1OuMPkTow4L5ozEZVLxXnmKJyTTOktjGDrIS59B
	PcJskhkhgrsxNfhn1StRixycCG7dGUd8v0yVQR2ZhVpcLlQOBnOKizOkaQ==
X-Google-Smtp-Source: AGHT+IFfPk8Ltk5jepMFru006aABjOpnGLBmmQAKh/is3Qbb3rUtrgQP7g/6LQEsOrVOIRRDL72g+Q==
X-Received: by 2002:a05:6902:1704:b0:e0b:5b37:d0c9 with SMTP id 3f1490d57ef6-e0eb9944700mr5643812276.14.1723304461829;
        Sat, 10 Aug 2024 08:41:01 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8c78df6sm384671276.48.2024.08.10.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:41:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] pkcs11-provider: backport a fix for build with gcc-14
Date: Sat, 10 Aug 2024 11:41:00 -0400
Message-Id: <20240810154100.900690-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111751

From: Martin Jansa <martin.jansa@gmail.com>

* fails only with 32bit MACHINEs, e.g. full log from qemux86:
  http://errors.yoctoproject.org/Errors/Details/790494/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 23777ac6dd8920fc7ffa02fb829b30e0da3af19b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...001-Fix-types-for-old-32-bit-systems.patch | 49 +++++++++++++++++++
 .../pkcs11-provider/pkcs11-provider_0.3.bb    |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/pkcs11-provider/pkcs11-provider/0001-Fix-types-for-old-32-bit-systems.patch

diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider/0001-Fix-types-for-old-32-bit-systems.patch b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider/0001-Fix-types-for-old-32-bit-systems.patch
new file mode 100644
index 0000000000..189a0e21b3
--- /dev/null
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider/0001-Fix-types-for-old-32-bit-systems.patch
@@ -0,0 +1,49 @@
+From 088f038de633b5de777fb0f95cd9598f320151f6 Mon Sep 17 00:00:00 2001
+From: Simo Sorce <simo@redhat.com>
+Date: Wed, 5 Jun 2024 11:22:35 -0400
+Subject: [PATCH] Fix types for old 32 bit systems
+
+On x86 CK_ULONG and size_t have different sizes, ensure we use
+compatible types on our helper functions.
+
+Signed-off-by: Simo Sorce <simo@redhat.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/latchset/pkcs11-provider/commit/9fa16b7fd398b62f06cb10892fe93dc574d67399]
+
+ src/asymmetric_cipher.c | 4 ++--
+ src/util.h              | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/asymmetric_cipher.c b/src/asymmetric_cipher.c
+index 4d87b1c..3256fd2 100644
+--- a/src/asymmetric_cipher.c
++++ b/src/asymmetric_cipher.c
+@@ -251,12 +251,12 @@ static int p11prov_rsaenc_decrypt_init(void *ctx, void *provkey,
+ static int
+ p11prov_tls_constant_time_depadding(struct p11prov_rsaenc_ctx *encctx,
+                                     unsigned char *out, unsigned char *buf,
+-                                    size_t *out_size, CK_ULONG *ret_cond)
++                                    CK_ULONG *out_size, CK_ULONG *ret_cond)
+ {
+     unsigned char randbuf[SSL_MAX_MASTER_KEY_LENGTH];
+     CK_ULONG ver_cond = 0;
+     CK_ULONG cond = 0;
+-    size_t length = SSL_MAX_MASTER_KEY_LENGTH;
++    CK_ULONG length = SSL_MAX_MASTER_KEY_LENGTH;
+     int err;
+ 
+     /* always generate a random buffer, to constant_time swap in
+diff --git a/src/util.h b/src/util.h
+index bcbc2db..1b24666 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -120,7 +120,7 @@ static inline int constant_select_int(CK_ULONG cond, int a, int b)
+     return (int)((A & mask) | (B & ~mask));
+ }
+ 
+-static inline void constant_select_buf(CK_ULONG cond, size_t size,
++static inline void constant_select_buf(CK_ULONG cond, CK_ULONG size,
+                                        unsigned char *dst, unsigned char *a,
+                                        unsigned char *b)
+ {
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
index 816ee967c1..daf0c2137d 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
@@ -18,7 +18,9 @@ DEPENDS = "\
 
 SRCREV = "58040b4e32975cc1d7f39e424ee7b0097cd11311"
 
-SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https \
+    file://0001-Fix-types-for-old-32-bit-systems.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



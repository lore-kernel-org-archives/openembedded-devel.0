Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3478EC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:21:21 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.3854.1720776080263387416
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gdzyi9Po;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a77c4309fc8so264760166b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720776079; x=1721380879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/I220l3at8/14r4w/PvIDL3+vV2NSgYodjZjTzyEQYI=;
        b=Gdzyi9PoJevf8WOamZS52PC5U99IqkUNjxRW3+bn8rynPkSGszDBDLoHpR9sUGUyMq
         /8okW5tpyzMLt/Ni/URU5eZ+orsURmE3fUOZpHSNnkiOwO9CoCW+WRAsW05gbHhVl2Tl
         VHejC2sZGEls+bJDGteVlTkWXHtrFWXIkVF71FPhwVdXBtp+X/c14NSKcpc3SLQQenXJ
         q9atGv7Ytb9l/043x/eI3D6xgjZ8zg+0GXTiz1WNzT/IbwYHYJ+ZJ6GhM0alnpwAc6fO
         +1oHQOlpmfs/X+PL1NRQkbvUavvKF/8wiiE0KYIgGAu6DuWRxhxagXxQcAJ07GLJVOm2
         pueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720776079; x=1721380879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I220l3at8/14r4w/PvIDL3+vV2NSgYodjZjTzyEQYI=;
        b=Q4D97SJesJfjxCKdOxnD42XvK10rEgntijK1t0VZQ1huUjz5lwF/BXEU452MylOmr+
         PXlCoqktyUPY34Q1XYoVNmsGkYJdb/mmqBiwwvMLmCZPv2N0nx37OFCBU6yS73wis/SC
         lrk1ZyOqX47tm1+GWzzlX+MR1UcmBV5M4vQY+VEjkm8ZJIBl374fJyHKnr4d+CTHTIjt
         5jd1ToXsl1tjQomH8rSKAKEWijc6h7Bzh8mGhDZc6myg8weIp4TpMi4DwdNwxLpy0rLH
         lwzOcbIkkCTh1+YfxUCFFFYBFo09+AMxOmjKWIrEwMadMLaKjJYJO2Ao05NBuoojkkxB
         /B9w==
X-Gm-Message-State: AOJu0YyIu5M1pf9FJXa5UkVjLDaWBlkV3MfnaVfZ2QsxFNKAue+vHQjO
	XkMYn7otVDFn0vzQSIwBcKnHyZlvPqtTZmZg2hYbZLfS7DNqPtx3R4FqrQ==
X-Google-Smtp-Source: AGHT+IGuArYTWklQ926AWgdUq+QQO4lCbRLcCHglaKUpNvt5BzqBuo9uzbtDiALuBhXtT7s//9hclw==
X-Received: by 2002:a17:907:7d8a:b0:a6f:59dc:4ece with SMTP id a640c23a62f3a-a780b68a9ecmr872372266b.2.1720776078460;
        Fri, 12 Jul 2024 02:21:18 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7ff00bsm327046666b.118.2024.07.12.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 02:21:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: niko.mauno@vaisala.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] pkcs11-provider: backport a fix for build with gcc-14
Date: Fri, 12 Jul 2024 11:21:12 +0200
Message-ID: <20240712092112.434579-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 09:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111317

* fails only with 32bit MACHINEs, e.g. full log from qemux86:
  http://errors.yoctoproject.org/Errors/Details/790494/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
2.45.2



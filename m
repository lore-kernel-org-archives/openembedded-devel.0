Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3337FC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:24:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3833.1720776239060601524
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7V4FzCE;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42726d6eca5so13693155e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720776237; x=1721381037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOYcMtsIDbIMIvRixoZB/8ROjQVHv00otek3Yz1Ykk8=;
        b=U7V4FzCEAae6PEwWdRC6wt/3Cx+ZbnaHNwVjxhLUprRECqXhoMAww9YOaLhSZaomqo
         3NVtVZIYh9XQf8u2qMQdA9EB82E0qq28bLAAdYooiuSecUYW1IhldrTZwPyBpuLM/kdI
         Tyil47fOOE0+SB6X6xMSzhfRHRAd/uc4JfZCkHSw6jHH4SJhBZqoPb2+Tl+mFT5tKKxt
         unrB2PIlODFTbgrBterCpnXle+TauU/Y+6ku5oKUo7OAmWj/JsKgK3RrifjOCSq1C1xk
         hW8ef+dCLw1ytnGfVvwZMqk909AtlJQXLs0Q8+eYhtfKR9DDXAI9VCNphznELuWKgO9s
         8hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720776237; x=1721381037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOYcMtsIDbIMIvRixoZB/8ROjQVHv00otek3Yz1Ykk8=;
        b=jRivyKr25p2IVpR1KbL1oXhznjLuzk2nDveE9TBT3iMHQjyi38UMIsMCd5zHbM/VH1
         GNQp+Z6sxVdxdVGyFrwgzjGXvw4JfKRrUbm1vo4LZmDBI0D6SZsvpxGf/i8ffTcoRfAc
         lDiOSyz7gAQumlFXNkFYd4TmcLPvFOtadVEdXJM09fCnz/43gDOX4QmFfhBoT8s5g5tv
         /sxB5gEvEpEs5JvoB56Bq1YCDnHGe9VgTJdB+rpyd56xyhe/4Bna5PvV1qcFfyk8Q5Pu
         KgQR6fPG9cQ7Tdnb/WdzoWV3gyPqruO2mKo8ipTI9ziyI/8Ar7itfdWDWyas5T3lerB6
         lvxQ==
X-Gm-Message-State: AOJu0Yz+6IiZa5jyFNyrAq4ENt+doaMPVrsdP62bhjPSKpi3OQ69eDQs
	KqgskfWrfYZMvC8mczTqPLI+A4i0Aa+YqG7bK5J71GGRZ+Btblxvf6amUA==
X-Google-Smtp-Source: AGHT+IHDrTKwYiBSn0q1/SYLzd9IT8O/c1+kINugCtjC8naxvu+U/bzkACK6EQdPaO4xdc+Cv6fg/Q==
X-Received: by 2002:a05:600c:5596:b0:426:6edf:6597 with SMTP id 5b1f17b1804b1-426707db700mr65893835e9.19.1720776237160;
        Fri, 12 Jul 2024 02:23:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f09d1d8sm16599205e9.0.2024.07.12.02.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 02:23:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: niko.mauno@vaisala.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2] pkcs11-provider: backport a fix for build with gcc-14
Date: Fri, 12 Jul 2024 11:23:52 +0200
Message-ID: <20240712092352.438058-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 09:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111318

* fails only with 32bit MACHINEs, e.g. full log from qemux86:
  http://errors.yoctoproject.org/Errors/Details/790494/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: send from master (with 0.5 version) instead of scartgap (with 0.3)

 ...001-Fix-types-for-old-32-bit-systems.patch | 49 +++++++++++++++++++
 .../pkcs11-provider/pkcs11-provider_0.5.bb    |  4 +-
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
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
index 6c19b6616a..fcd8fe631e 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
@@ -14,7 +14,9 @@ DEPENDS = "openssl"
 
 SRCREV = "3a4fdd2a2e5643af2a0f857b66a19b9fa109d40f"
 
-SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https \
+    file://0001-Fix-types-for-old-32-bit-systems.patch \
+"
 
 S = "${WORKDIR}/git"
 


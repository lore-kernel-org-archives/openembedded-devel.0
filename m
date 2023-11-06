Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EAEC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 05:16:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.47682.1699247806924070211
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 21:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YspGvXrY;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso36788485ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 21:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699247806; x=1699852606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ru3TPq9t4nI+bGIbdWzxGNZedoOTPLQlt1aFVlJIfH8=;
        b=YspGvXrYuL17hH1vue9WAYLcp6RjZQEw2jN2hZen2KV5gZGCWLKlrnW9ILV2EPkBwZ
         iVa5SNf3+6CAShNKRw81wp4SpStieZDKMRBDV3Std50SlODF1fy/0hsRJUlQ1hRFF7Ed
         HYL1dAxh5Z7E+mAhh9SAH8Uo3AhEM2o+hMN82OrJijyix1OVdsoG4xy561TKtEA6jxV6
         GDTMKdfA0S4IeDrhpqkDLDFd0ZXK4xPsY/335tZc0r3A3FLMaG3gvK2QEXCsZxF83kr6
         /YLximR+1fSzmJXt5Vf4tyEQHFVOn9ggnUrH7zNGe2MobhUk7OuEUyxNsraL0QA/lKaL
         L4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699247806; x=1699852606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ru3TPq9t4nI+bGIbdWzxGNZedoOTPLQlt1aFVlJIfH8=;
        b=HqyUvddgEJ6bot+Ql2F259zrNds7f+drGTIRgZV8tK7FAFLmmBdotkuQWZT7QJ3YrA
         FjXcZVwENyWaJ2AxQkuS0MXrSh4TuJRCf1RJVbXHgg0ZHH8aZexU8+4tdFU+Fdij7TLM
         iF+cT3y7Zb9lb1yitqtsW9yTLw3wFBWrH+V0MzFH2ttfOCUAJgh/TbI2/TG3mXu8K+8b
         lRZew0UMzGL1Tgn4q65IifhIEJ7+5ku2M5MhfLkkemv+9E8epsXzebOiCqMZJJC5gmRE
         TeE1VfVnYP/dpdfqO8TNU71FmcoK1czGx4urIwJ7KpgzcM8YyVMFx5UgC3g+JDf1wrv8
         iJpw==
X-Gm-Message-State: AOJu0YzpYo1HhuSWB9/TTruzxIU1A67HC3WUAXWJt27iBD2Cefu/g6sN
	1kpXKDFffSte+HsAEuqojKEV1ScqlVdRlQ==
X-Google-Smtp-Source: AGHT+IFwt5wKXvA5MTqjEyIEtTsTLwQRNqV0gdViL/6mdHhtt4mDvZ8n/+PiflFu4ora8US9e3G4/w==
X-Received: by 2002:a17:90b:1014:b0:280:c4be:3c85 with SMTP id gm20-20020a17090b101400b00280c4be3c85mr13018226pjb.23.1699247805693;
        Sun, 05 Nov 2023 21:16:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id mr22-20020a17090b239600b0028012be0764sm4761416pjb.20.2023.11.05.21.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 21:16:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libsodium: Fix build with clang on aarch64
Date: Sun,  5 Nov 2023 21:16:43 -0800
Message-ID: <20231106051643.1492659-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 05:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106394

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-target-pragma-after-arm_neon.h-incl.patch | 49 +++++++++++++++++++
 .../libsodium/libsodium_1.0.19.bb             |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch b/meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch
new file mode 100644
index 0000000000..7a6fae7997
--- /dev/null
+++ b/meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch
@@ -0,0 +1,49 @@
+From d3253310f7c0fc0f1aad6864e3b57958ea1bb9c5 Mon Sep 17 00:00:00 2001
+From: tux3 <barrdetwix@gmail.com>
+Date: Mon, 16 Oct 2023 16:42:04 +0200
+Subject: [PATCH] fix(aarch64): Move target #pragma after arm_neon.h include
+
+Fix per https://github.com/android/ndk/issues/1945
+
+If the pragma is done before the header include,
+in NDK 26 the attribute may apply to the functions in arm_neon.h
+
+Upstream-Status: Backport [https://github.com/jedisct1/libsodium/pull/1321]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c   | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c b/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
+index 0a5a128..aa76f5c 100644
+--- a/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
++++ b/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
+@@ -19,12 +19,6 @@
+ #define __vectorcall
+ #endif
+ 
+-#ifdef __clang__
+-#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
+-#elif defined(__GNUC__)
+-#pragma GCC target("+simd+crypto")
+-#endif
+-
+ #ifndef __ARM_FEATURE_CRYPTO
+ #define __ARM_FEATURE_CRYPTO 1
+ #endif
+@@ -34,6 +28,12 @@
+ 
+ #include <arm_neon.h>
+ 
++#ifdef __clang__
++#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
++#elif defined(__GNUC__)
++#pragma GCC target("+simd+crypto")
++#endif
++
+ #define ABYTES    crypto_aead_aes256gcm_ABYTES
+ #define NPUBBYTES crypto_aead_aes256gcm_NPUBBYTES
+ #define KEYBYTES  crypto_aead_aes256gcm_KEYBYTES
+-- 
+2.42.1
+
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
index 824ac45c87..2e678f3f0f 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
@@ -4,7 +4,8 @@ BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=49ce3b426e6a002e23a1387248e6dbe9"
 
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz \
+           file://0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch"
 SRC_URI[sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
 
 inherit autotools
-- 
2.42.1



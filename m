Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E77C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 04:05:23 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.29476.1711512314715283055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 21:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUL+37sj;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1de0f92e649so44681755ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 21:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711512314; x=1712117114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vZOPeCcGbWIkTnGOTkYHdvZ+y4E6U3mE0GxlDGOq9Y=;
        b=GUL+37sjbFnQw73rVk6ggQ9S1cF4QjPjY7EITS3zZubvMXxK5F5iGzZ0OWp/ggDIxy
         5txKZKJSsucGneLqvaLcpqMwo7N3JGU1rdzlL2rR4bnI3+auXG5g26WpK+Lr3Od3ju4h
         jKnRp1M0BrcMEYFmWPVJnqBNQAX0JBznstqa7ffYYK4a+yicuFBUzlWcg1Izp/AH68ut
         KkOTvxdKM1Z8ijodFJywU+G+JaTMayusWR1MieYGlhiokOXlz8EJsdhM1oH63Z+jDzZ3
         OCy9AiRbnGipuWpTqpcspyI4LZ87fOOq4ty5vY8e8+x9uUE9C2nxiW+k9C2Iiqh1QqYa
         dP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711512314; x=1712117114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vZOPeCcGbWIkTnGOTkYHdvZ+y4E6U3mE0GxlDGOq9Y=;
        b=Cje9UFwrOwr+hE5SdHySNeca7IYD91nDf0yB4DEwqzg0po0ImckKhJ9Zjz6HkJ1Cwy
         1h3RrZ17oXRnEN8vZ1Mt+t+VXtvcS5Rv+DQl4ILIBK6cToqg3e63+FxoTqj+UqXoBuK6
         lw03QUpgcpXn/jBc7XqOf2OXK0hs1DESRVfGUqepx5nHd8g94UsciPmEXkFRt7+zirym
         Iwv9awCbGLX6AHNO0Stf6ykne3BS+Nuuoe9PLjS3wtP9K3asHdtU1RVwiaMdKiU+8Hwr
         lM9jvmV5CW/G4Q7WggzMmRuXh+lgDAb2aDAljA5ihe8wwxD1DhdzUCA4bpPsrYq55O4I
         76Gg==
X-Gm-Message-State: AOJu0YxozSFwb9hrGW2Jq38KJWYQpVasA9DKEUOz6iPgAydfQFU94eAe
	zTxYMp4OH8zQWkftbiTeX/HaxJlfFPbAVF48y23gJV047HGfzsE4kPcrgupM
X-Google-Smtp-Source: AGHT+IF7PQ38uVnu1da6Z6pgNaDegMgQ78Ob4xfhkmMJw1tWHL1gPL4625hwadK22W5xmAuGwuJtLA==
X-Received: by 2002:a17:90b:3108:b0:29b:9d82:9d55 with SMTP id gc8-20020a17090b310800b0029b9d829d55mr4438056pjb.8.1711512313754;
        Tue, 26 Mar 2024 21:05:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7a27])
        by smtp.gmail.com with ESMTPSA id gn11-20020a17090ac78b00b0029bce05b7dfsm465308pjb.32.2024.03.26.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:05:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix libsodium build on aarch64/clang
Date: Tue, 26 Mar 2024 21:05:11 -0700
Message-ID: <20240327040511.2748702-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 04:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109635

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0008-libsodium-aarch64_crypto.patch | 38 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.15.0.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch b/meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch
new file mode 100644
index 0000000000..c2c51148f6
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch
@@ -0,0 +1,38 @@
+Move target #pragma after arm_neon.h include
+
+Fix per android/ndk#1945
+
+If the pragma is done before the header include,
+when using clang compiler attribute may apply to the functions in arm_neon.h
+
+Upstream-Status: Submitted [https://github.com/jedisct1/libsodium/pull/1321]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
++++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
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
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
index 0667fdaecf..beb247c254 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0005-Pass-noline-flag-to-flex.patch \
            file://0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch \
            file://0007-CMakeLists.txt-do-not-use-ccache.patch \
+           file://0008-libsodium-aarch64_crypto.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "
-- 
2.44.0



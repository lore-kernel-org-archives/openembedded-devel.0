Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D620EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 11:51:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.5757.1687780269729315529
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 04:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=StguGrko;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a01so10788655e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 04:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687780268; x=1690372268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbvKS9JaWbPFa53yh0xB1NPGIZ9noAZ08v17vObNMpU=;
        b=StguGrkoAKh4gNGxsA5klgH+vVHpz/RVn/WW6RADQ1lNCjqvXOtbaIrQaC35tR2iIX
         eOoIID0tPnd3c6X3bU6cCR8mixJa9kZG+BCi9lp0ZkcAdrlgc3j5h81lEmAKyPfxQ3RL
         5CZIpPdjS7VUn9l2Mf3aS+K15bDLGN7R/SNLMzLB12Q3LLQcK/A/ceo5TH/i+ET92R3a
         r/gunSKHeJqkMKZOzdx23u+jICIhOGnWs1k475pHcOtH6qDxwp93xWKM+tdXSc05A5Hp
         h/qxhdi0cl4oF46d8K5Y2dR62MjTs7ADMkUxCaQocdHJ+vnOHk7pQrru8fKdqX1taFNl
         EYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780268; x=1690372268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbvKS9JaWbPFa53yh0xB1NPGIZ9noAZ08v17vObNMpU=;
        b=F2jgCTjxXfNaSIHF3OxTca08LADYhK5Dzx6NOvm2H8ojPff6zfQA1K0g/+tZOFU10I
         T6Cv1JT4eELbICoE5CQPHh46doxqTWhooqK2CH47fsOSyrNBD7L8nC3ZeN7o8P8NI4I3
         kG+/US7TMuNHvhSvryhfokLrrghrQ9Bjjosj/adFNDnTiRoAE+6/oERuxZGuFs77FFZd
         TPOQgM+413qAg2bkeMoHN8OIf8wZZIybwjziiTIrQA8kt2bhnFDQu35OWpg218GDWK+w
         ITAmHhuCCab/Yj344Dphf0OpMVtv61MB/TWTjJZ/hD/bDidgCre4IB2U0ygY/uGYUtJz
         m/Gg==
X-Gm-Message-State: AC+VfDx6gB5k8WOT/E68PA4Uexj9dVYuMuH9JxGrt8oVrRyEEaryriuG
	2xs3e+qI+PodXMd/ATbaV5utjvCBQ52H6g==
X-Google-Smtp-Source: ACHHUZ4xatNJ8CnXbJnKxbVyU07K8wKP3jzNppMsMcRO/uZ1ADmuVWKtOZs6Hy+Gf4rXyUbRRQmNpg==
X-Received: by 2002:a7b:c3d0:0:b0:3fb:31b:d52c with SMTP id t16-20020a7bc3d0000000b003fb031bd52cmr728201wmj.39.1687780267819;
        Mon, 26 Jun 2023 04:51:07 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id f24-20020a7bc8d8000000b003f907bdeef3sm10326086wml.26.2023.06.26.04.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 04:51:07 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: fix builds with crypto extensions
Date: Mon, 26 Jun 2023 14:50:40 +0300
Message-Id: <20230626115040.71199-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 11:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103575

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++++++++++++
 ...t-target-attribute-when-building-wit.patch | 34 +++++++++++++++++++
 .../mbedtls/mbedtls_3.4.0.bb                  |  8 ++---
 3 files changed, 70 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
new file mode 100644
index 000000000..d98d8fa57
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
@@ -0,0 +1,33 @@
+From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Sun, 25 Jun 2023 19:58:08 +0300
+Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
+ instructions
+
+Building mbedtls with different aarch64 tuning variations revealed
+that we should use the crypto extensions without forcing a particular
+architecture version or core, as that can create issues.
+
+Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/7834]
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ library/aesce.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/aesce.c b/library/aesce.c
+index fe056dc4c..843de3973 100644
+--- a/library/aesce.c
++++ b/library/aesce.c
+@@ -60,7 +60,7 @@
+ #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
+ #       endif
+ #       pragma GCC push_options
+-#       pragma GCC target ("arch=armv8-a+crypto")
++#       pragma GCC target ("+crypto")
+ #       define MBEDTLS_POP_TARGET_PRAGMA
+ #   else
+ #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
new file mode 100644
index 000000000..4775c8ddb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
@@ -0,0 +1,34 @@
+From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Mon, 26 Jun 2023 12:07:21 +0300
+Subject: [PATCH] aesce: use correct target attribute when building with clang
+
+Seems clang has its own issues when it comes to crypto extensions,
+and right now the best way to avoid them is to accurately enable
+the needed instructions instead of the broad crypto feature.
+
+E.g.: https://github.com/llvm/llvm-project/issues/61645
+
+Upstream-Status: Pending
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ library/aesce.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/aesce.c b/library/aesce.c
+index 843de3973..7bea088ba 100644
+--- a/library/aesce.c
++++ b/library/aesce.c
+@@ -53,7 +53,7 @@
+ #       if __clang_major__ < 4
+ #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
+ #       endif
+-#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
++#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
+ #       define MBEDTLS_POP_TARGET_PRAGMA
+ #   elif defined(__GNUC__)
+ #       if __GNUC__ < 6
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
index ebc6ba573..b8c9662de 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -25,8 +25,9 @@ SECTION = "libs"
 S = "${WORKDIR}/git"
 SRCREV = "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-           file://run-ptest \
-          "
+	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
+	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
+	file://run-ptest"
 
 inherit cmake update-alternatives ptest
 
@@ -41,9 +42,6 @@ PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
 
 EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
 
-# Needs crypto instructions on aarch64
-TUNE_CCARGS_MARCH_OPTS:append:aarch64 = "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
-
 # For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
 CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
 
-- 
2.25.1



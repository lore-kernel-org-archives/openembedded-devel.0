Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D907BCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:07:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.39310.1697206070135106409
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PBj5dXUO;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so22328155e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697206068; x=1697810868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jjZSm2novk4uzCCD3gHmE7UhrlVwtlEEfhTDY5zww0=;
        b=PBj5dXUONhnDYvm4/O7PRg8ouA5dHiO9acl+vrcljW2c0QeUYhSA0rJPM+KWZdy/76
         dJ9U4Iz0XmymTPlnZT8pu/ZhvgYKrjy+l+kEKnDi87PZTqDlrDbmPuAfjok+Uj7YLVQx
         lNHtfVFt7A8Eb5eB8F5pvZJrJKO0cJs7i5yXQKj8WRn3jBbPk9sdYuamG5wVmMJ8ombM
         KDNwPGrTy7HT7SJu5xyfqISVrVfjkuaIsnmjhHQnpuCH1+CpCijwLT+puXHVT3iBKlbT
         zWUnq9Zx0NR4UQzUpIoHE+J6hEUYY1YulGcNgr8Wsu6cCYC3RwC5XFbmvZurrdkD9M8b
         yC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206068; x=1697810868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jjZSm2novk4uzCCD3gHmE7UhrlVwtlEEfhTDY5zww0=;
        b=q89DlB6dar4YDQk4CvgdSjvYACMwQAH09m/dlYovfbRsT2Kp/TcgpjsqQHj0L7g0P3
         +PULYIXz5vV+5Ruf/i22KN3iayR3vwxtsZajg8Re8/6FxZWue9YZK+rEzDjXqDLnIoXx
         q25FmLmrRG+jGtb6n3aaB/dj5e4+tkh0zrTMUlTsvpjTAqlZretMwL6bC7eiJr6nQ/X/
         hraiCs3YSLjUdKQt+hkaZmTEdatQclqZWOoTnlMDBCuESZR2Jskg5txbJ0X4jGOtRJ/x
         +uoxmhkLEifngWvSs17cu7Uydh0cYMgL7W5K3BV1m0LWXs5G3T/NrG07kvHhKkmxWULE
         R2qw==
X-Gm-Message-State: AOJu0Yzfuwoi6TDpOU7zERL4my16IY9y5LaaJ6ruQEWlLP9u9kS8iQns
	l+K14YHwEdXDIfrAYZcfXVdlWex6S1SkXPMe
X-Google-Smtp-Source: AGHT+IG2S0kpjoaVAkJM6Xok1VXKeWJrEKrMtEm92pkh0qb7+ZaC6OIdrwDS9hflHH7XeBtzifMMDw==
X-Received: by 2002:a05:600c:2218:b0:3f7:cb42:fa28 with SMTP id z24-20020a05600c221800b003f7cb42fa28mr23026408wml.28.1697206068331;
        Fri, 13 Oct 2023 07:07:48 -0700 (PDT)
Received: from uk-l1.. (cpc147796-finc20-2-0-cust5.4-2.cable.virginm.net. [86.20.236.6])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b004053a6b8c41sm235672wmq.12.2023.10.13.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:07:47 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH v3] mbedtls: upgrade 3.4.1 -> 3.5.0
Date: Fri, 13 Oct 2023 15:07:19 +0100
Message-Id: <20231013140719.344880-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 14:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105470

* Includes security fix for CVE-2023-43615 - Buffer overread in TLS stream cipher suites
* Includes security fix for CVE-2023-45199 - Buffer overflow in TLS handshake parsing with ECDH
* Includes aesce compilation fixes

Full changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.5.0

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...cify-an-arch-version-when-enabling-c.patch | 33 ------------------
 ...t-target-attribute-when-building-wit.patch | 34 -------------------
 .../{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb}    |  4 +--
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
deleted file mode 100644
index 44d74754c..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Sun, 25 Jun 2023 19:58:08 +0300
-Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
- instructions
-
-Building mbedtls with different aarch64 tuning variations revealed
-that we should use the crypto extensions without forcing a particular
-architecture version or core, as that can create issues.
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/471a975942dec76bf0ccb92b6c6da055385683fb]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesce.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/aesce.c b/library/aesce.c
-index fe056dc4c..843de3973 100644
---- a/library/aesce.c
-+++ b/library/aesce.c
-@@ -60,7 +60,7 @@
- #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
- #       endif
- #       pragma GCC push_options
--#       pragma GCC target ("arch=armv8-a+crypto")
-+#       pragma GCC target ("+crypto")
- #       define MBEDTLS_POP_TARGET_PRAGMA
- #   else
- #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
deleted file mode 100644
index c8f6cb750..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Mon, 26 Jun 2023 12:07:21 +0300
-Subject: [PATCH] aesce: use correct target attribute when building with clang
-
-Seems clang has its own issues when it comes to crypto extensions,
-and right now the best way to avoid them is to accurately enable
-the needed instructions instead of the broad crypto feature.
-
-E.g.: https://github.com/llvm/llvm-project/issues/61645
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/aa4f6219014d863bed51453e5261178adc66be34]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesce.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/aesce.c b/library/aesce.c
-index 843de3973..7bea088ba 100644
---- a/library/aesce.c
-+++ b/library/aesce.c
-@@ -53,7 +53,7 @@
- #       if __clang_major__ < 4
- #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
- #       endif
--#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
-+#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
- #       define MBEDTLS_POP_TARGET_PRAGMA
- #   elif defined(__GNUC__)
- #       if __GNUC__ < 6
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
index a6f8583b2..1fd187ab2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
@@ -23,10 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "72718dd87e087215ce9155a826ee5a66cfbe9631"
+SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
-	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
 	file://run-ptest"
 
 inherit cmake update-alternatives ptest
-- 
2.34.1



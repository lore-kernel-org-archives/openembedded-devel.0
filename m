Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E3C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:17:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.34526.1697188626304845868
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mFpLMxar;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so1801710f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 02:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697188624; x=1697793424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M63IugQlDKanE1pQYcE0d0Hmqv+zS7kbcfv0Qd9Dje4=;
        b=mFpLMxarVgcw6ravU4AEEDNynzVX30TPS5vuwmo96nVlBGr7tihHL6ParisNQ6NYQT
         wKKJxYcjJMUHtG5r+MlLMbz3RDvNUvdMd4eUIQLw2P7+yBLfzY5JzHBzrcmEsEugHcR1
         GD+nTQgU7eLiAE83Ap98XibOwYwBJ1Tqz35YwGpetnAyaU5+2a80LGy3QJzs/dayqIV+
         5olD+FyAH5/+5LHuStfUgxHX4tGpp/SlJQFy47TVxdriOQpmzEFYqGZ/qNQEcIgIqqdz
         TG+bQNy8TtUTiyPWf5aJku2rMYDd/LL++2Us6qmCN4HfBKkFBt83plboUeb8gXQKrcwN
         GD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697188624; x=1697793424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M63IugQlDKanE1pQYcE0d0Hmqv+zS7kbcfv0Qd9Dje4=;
        b=GZNyL1EL5zBFlW4uQzuXFg6WaYx3dgv9+kWeOZPMLXtbTwE1M5PBDdN+DKf0XjbrvY
         +tz2sfB4jTnvSb9A78KnMIknmqdhpSxWokJmE4qS5vOJRN8/Xk8ooUfEqvh8uHTI/rkj
         KDo9KU4icdNmaO6GK9NY5u09/mwOlsA/DPsQQDP8MmiCwjLZfj5D83zq2iDHuPaMyHj3
         OZ4AfAJ0rpM1KPDLoNmUPhYW5lV5Rk7YyNJKIyNJJG77vzZ6gBtuOsnUYDi5Z6EOdPLc
         1T5gQOs5H9nlS5yKumhmigXVw+tgJ9407Ed7zVRqgIninuz8lh6iVkJqaE1kNx8UfcCt
         gMLw==
X-Gm-Message-State: AOJu0Yx6+IAWxSYjc0KBkltRyaImTFXF9bwyk/GtRgBxarPaqAokAaYM
	Vyzl1qwkW6XHApe9YHCv9yLvnLcl2PDjRA==
X-Google-Smtp-Source: AGHT+IF/JZ638ZDubkKtvRvhE9ZyM21F6zLPrr2xXBe8pIrOU5V/SogXgN8LKWJoMmKiJ56Ty6AJKA==
X-Received: by 2002:a05:6000:613:b0:329:6d66:85c0 with SMTP id bn19-20020a056000061300b003296d6685c0mr21333870wrb.43.1697188624472;
        Fri, 13 Oct 2023 02:17:04 -0700 (PDT)
Received: from uk-l1.. (cpc147796-finc20-2-0-cust5.4-2.cable.virginm.net. [86.20.236.6])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b0032d9337e7d1sm3391101wro.11.2023.10.13.02.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 02:17:03 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 3.4.1 -> 3.5.0
Date: Fri, 13 Oct 2023 10:16:44 +0100
Message-Id: <20231013091644.314001-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105463

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



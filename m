Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0C8EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 16:06:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.17486.1686672400711170327
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 09:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=g4iPH1yC;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f8c65020dfso11238665e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686672399; x=1689264399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8eLY2XisTN4o6tn27qNCmTt8GkwxS7d3GN+heEKqMQ=;
        b=g4iPH1yCYvCeXKXJKk9ysU19inDT4iPKAj+A9w2mQyjiOY4sCyjpVqDeH1Ur1Jv5w/
         sO08YHSm11gAs/YMobbgEzEcW67Ag48NzwvRrNEXjI2l3NXHmnZYe53OhovD0aXIZ6Yx
         7HU9T4h+02qS/fx9hwq/unfmZLBHNp89vsG/lT0Cd3sxlDkEbdxQsPkBok5tVSpsU1HY
         yPzs/QT2aPyDIlgnnDtZig+4OT6TDWxJQ5B+utDhCsLaXjGP0JScL4iUulL0FRUkeiBC
         0671z6XFK/yhjJtl9J8dUBi3aMjHKr0Pcv7n+L/3gfzDJ4fpYCifuHGnXTRUeXwp92og
         nx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686672399; x=1689264399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8eLY2XisTN4o6tn27qNCmTt8GkwxS7d3GN+heEKqMQ=;
        b=JmIMiPMn9QqS1zPuqKPlA0amRsvLeDJ29C1WHDW7K7BvjpbR93pDSE3PQJLVFAwage
         y4wo0NGo0a3jH6K0P1UiuuCqS0+3yyVjeyY0LW+228XaRNUQqPfafVy/lEJlw/V5JLrK
         YTnX8kZFbFQQ+DzUmk7eEyMJMGw451CKLGz31JtF+XRF0QUZe/A1nY/ocA6VWfQcBW+u
         hW2m9WgQAs8RuRHEz1Si4NzYAxqO6onTJ2RiCR/pUBb9ztFLleO10m7L69OgathhLhwC
         ENhz0vaNaPIywZ3uK8cqjzLGuM9iPC6ZHMSzzViorso9wFyhPTy0tYH4STQL0u5DAP49
         JeCQ==
X-Gm-Message-State: AC+VfDzIHbl60+bxJ6Tj2pGqBAfh3F0SynE2mBsMqVg5d0cIZWBeir5A
	Yh9XByBVDQybOX4FLR6JJO50VRUDN4E=
X-Google-Smtp-Source: ACHHUZ4d/rLfMuVDEJFgB/jh+2XsL7oDVcZ6WuKIC9hgUz4os07gBPpIKjeORWXRcl3oX5YCgqw4pg==
X-Received: by 2002:a05:600c:230a:b0:3f1:6fb3:ffcc with SMTP id 10-20020a05600c230a00b003f16fb3ffccmr10437306wmo.22.1686672398901;
        Tue, 13 Jun 2023 09:06:38 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id f26-20020a1c6a1a000000b003f7ea771b5dsm15033171wmc.1.2023.06.13.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 09:06:38 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][kirkstone][PATCH] mbedtls: add support for v3.x
Date: Tue, 13 Jun 2023 19:06:21 +0300
Message-Id: <20230613160621.100974-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 16:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103271

Version 3.4.0 adds a lot of improvements and fixes (a notable one
being initial support for PKCS7 CMS), but since this is a pretty
big jump, let's keep both versions for a while, so the v2.x users
can upgrade to 3.x in a timely manner if needed.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/mbedtls/run-ptest                 | 17 +++++
 .../mbedtls/mbedtls_3.4.0.bb                  | 76 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
new file mode 100644
index 000000000..059ab4ecb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests=$(find * -type f -name 'test_suite_*')
+
+for f in $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
new file mode 100644
index 000000000..351aa43ac
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -0,0 +1,76 @@
+SUMMARY = "Lightweight crypto and SSL/TLS library"
+DESCRIPTION = "mbedtls is a lean open source crypto library          \
+for providing SSL and TLS support in your programs. It offers        \
+an intuitive API and documented header files, so you can actually    \
+understand what the code does. It features:                          \
+                                                                     \
+ - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
+   Camellia and XTEA                                                 \
+ - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
+ - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
+ - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
+   ECDSA and ECDH                                                    \
+ - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
+ - Abstraction layers for ciphers, hashes, public key operations,    \
+   platform abstraction and threading                                \
+"
+
+HOMEPAGE = "https://tls.mbed.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SECTION = "libs"
+
+S = "${WORKDIR}/git"
+SRCREV = "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
+SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
+           file://run-ptest \
+          "
+
+inherit cmake update-alternatives ptest
+
+PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
+PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
+PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
+# Make X.509 and TLS calls use PSA
+# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md
+PACKAGECONFIG[psa] = ""
+PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
+
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
+
+# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
+CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
+
+PROVIDES += "polarssl"
+RPROVIDES:${PN} = "polarssl"
+
+PACKAGES =+ "${PN}-programs"
+FILES:${PN}-programs = "${bindir}/"
+
+ALTERNATIVE:${PN}-programs = "hello"
+ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "mbed_tls"
+
+# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
+CVE_CHECK_IGNORE += "CVE-2021-43666"
+# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
+CVE_CHECK_IGNORE += "CVE-2021-45451"
+
+# Export source files/headers needed by Arm Trusted Firmware
+sysroot_stage_all:append() {
+	sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
+	sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
+}
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
+	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
+	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1



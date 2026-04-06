Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A374F46C45
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 14:15:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55856.1775484903708108494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 07:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m8ZBmQ9U;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d43e09de5so253128f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775484902; x=1776089702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjfcXVatPrGyfNbdhTOYzuKfO6qL3No+HZfe6cF2yso=;
        b=m8ZBmQ9UmcqJjEQnwtuzANje0PvAF4kijCSY/wLZ6wKn2jHxF133xFzpsueTNwANfK
         Yuiwh2GKDYCCsTs84y8nnynPJp/3WkmEilU4XbHoVJkIATqFDz6nqkYwDzwY7sKIc7wR
         fq4BEyrT3hdSLn2ysqXuRXy70+fmlH1bvyup13I19a8I0rw3Q5HrQJDdwzC4eIlGDo76
         UKANfrkWLcBZsrVjUr0nVD3r+VlikM7Cvwfu+AgL0OnkHhRsX6UVfwJRuIW0b0OAaAm+
         ABSbYDNV8/X7X88IOwfLcwcQX6Msn/lG52IMJtp0F9KPkjIxOBYu+eyiyxln03ttvzsQ
         P5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775484902; x=1776089702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjfcXVatPrGyfNbdhTOYzuKfO6qL3No+HZfe6cF2yso=;
        b=Yb6JOaYoAizNZ7rJ6fDRIRXPtMam4fjNfN+MxdOV/vzgtSd9ZEeaJ5OKBlAhuiP5lD
         qxXe0niJhDg8ReaOLz2DwR7kiWD5TIHEtvKkQhD6R074VKKWc6n4XcKlbwCv9GDB/Jed
         RY3bi87ReXY4tsdR84Bo1ZUIbj+3feI6tb6G8x0yRbV5IUv8amdHnZMynkVhE3y4VVQc
         voBEUCtGHR5IPcN6cgyuzvnzqc9eD6Hi05Qy6281mE1lm1uOOUzChDsAxEMUBsZB2YAh
         KKUbebZEzmBGYBWSw2jqiV+CkzK6zP9YL+YzDXzPXU8UKm+b9Af86vXa+awhqIoHXkXh
         yGng==
X-Gm-Message-State: AOJu0Yy+BVWbFVkAjE7koybcL7T+vLO9AylsuBvn1Nergs8K1952hb5a
	boSPtYwBYCbcZYuHAzveIvXSoXfglH2YGFKOtLapKjZF6Ts4bablvC82y5pRNw==
X-Gm-Gg: AeBDieu8CoAaiYErdNzH3P3MGI2qqe0+tnbBIeqdZOPbMZD7LUFxZPS3m/zVGScm1fl
	b2P+t+5up7TwFTJfEvwnjjIaQUKoTsf79HuVGjTuF3Y2bzro5e52Q81PpREilxP1g/CLS67CCjK
	iLgI1aFkgTPIkIp3Or/Z+cDTZVoy+eNuIAk1242E3uNdi3K+qML2M8gZOy99sbbX5dsf2eC7uHS
	/PzDLyiDsDrZGcLuRrVbVFSJp8rDgATqjIIvgMtvs7AODbFNRNKUuNIUWIDvIcLU/da5wEEbr/k
	zT3RJXtxNaK86LDicHolzOz5jd+LvHHTUnwtVjC1cgArNM0M2VSmjb8hrKz8DUSX/fXF7aEXQC1
	A/u7c3+3VniCLZklI5oZ5A39d3MhroyC3004+P4wPRYV4j7bPOHUN5dEG6HNWYDAraDUSFJdrfn
	rNzFZdOwuQNUsZW7I/QmKn
X-Received: by 2002:a05:6000:1869:b0:43d:dd:8cad with SMTP id ffacd0b85a97d-43d292cbccdmr17936172f8f.32.1775484901963;
        Mon, 06 Apr 2026 07:15:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f7d4esm35554567f8f.34.2026.04.06.07.15.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:15:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] mbedtls: drop recipe for v2
Date: Mon,  6 Apr 2026 16:14:59 +0200
Message-ID: <20260406141500.3557451-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 14:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126045

It has been unmaintained/EOL for over a year - there is
a recipe for a newer, still supported version.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mbedtls/mbedtls_2.28.10.bb                | 79 -------------------
 1 file changed, 79 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
deleted file mode 100644
index b126aee7db..0000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ /dev/null
@@ -1,79 +0,0 @@
-SUMMARY = "Lightweight crypto and SSL/TLS library"
-DESCRIPTION = "mbedtls is a lean open source crypto library          \
-for providing SSL and TLS support in your programs. It offers        \
-an intuitive API and documented header files, so you can actually    \
-understand what the code does. It features:                          \
-                                                                     \
- - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
-   Camellia and XTEA                                                 \
- - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
- - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
- - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
-   ECDSA and ECDH                                                    \
- - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
- - Abstraction layers for ciphers, hashes, public key operations,    \
-   platform abstraction and threading                                \
-"
-
-HOMEPAGE = "https://tls.mbed.org/"
-
-LICENSE = "Apache-2.0 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
-
-SECTION = "libs"
-
-SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28;tag=${BPN} \
-           file://run-ptest \
-          "
-
-inherit cmake update-alternatives ptest
-
-PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
-PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
-PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
-PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
-# Make X.509 and TLS calls use PSA
-# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md
-PACKAGECONFIG[psa] = ""
-PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
-
-EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
-
-# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
-CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
-
-PROVIDES += "polarssl"
-RPROVIDES:${PN} = "polarssl"
-
-PACKAGES =+ "${PN}-programs"
-FILES:${PN}-programs = "${bindir}/"
-
-ALTERNATIVE:${PN}-programs = "${@bb.utils.contains('PACKAGECONFIG', 'programs', 'hello', '', d)}"
-ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
-
-BBCLASSEXTEND = "native nativesdk"
-
-CVE_PRODUCT = "mbed_tls"
-
-CVE_STATUS[CVE-2021-43666] = "backported-patch: Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310"
-CVE_STATUS[CVE-2021-45451] = "backported-patch: Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c"
-
-# Strip host paths from autogenerated test files
-do_compile:append() {
-	sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
-	sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
-}
-
-# Export source files/headers needed by Arm Trusted Firmware
-sysroot_stage_all:append() {
-	sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
-	sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
-}
-
-do_install_ptest () {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
-	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
-	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
-}


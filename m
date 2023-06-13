Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB16EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 19:19:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.20.1686683940373180237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 12:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ldtBoorO;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-977c8423dccso1423591866b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686683939; x=1689275939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07M6LjBbobDHZarNs+3ii5cVlk27jm2iZqBO2rtFmW8=;
        b=ldtBoorOatIl06d03XxszKMYEnhu5TOE91s8P4e4pqzRgAAPc7y4i82sAZw7TqhxEn
         vwgRM5JWN484ZNSnUg7S5cglCTdlBcrWdDNf2qOu4XHMhewzdTz3yuI1XiItJEQV/mvl
         TmqV9Ke6qC8LhRFdRHLAY2Ms5oZwwetNWMkfPwW7iplGgDjdLLf8PTYvKhe/WGLduj5m
         rcA+FDTV7x0w8JIS46eYqWorHNHw6jN4DAGVKhb0t8nkevc18HL/IKydjxMsdiz51JvQ
         R6rSHiLX0mV9u1aihw6VCc1mMmv+pYxZqJ8aApUO+V23cZUvfzIr/b8dZtCjDYtkBfgW
         RZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686683939; x=1689275939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07M6LjBbobDHZarNs+3ii5cVlk27jm2iZqBO2rtFmW8=;
        b=fZxEP3icQ6TYVmP06oa4qalElot54e8KB5HRdv7jJ0SiP/hLySCjJzbTGegz2pck0k
         zTfUdovLBh7d8CbEJYXFJnAaVbqOeyTEUNarmQq0Ue1EJ+X67OTQXQQPT5xs18dUcRsk
         mUH1VT5QIVekcwClBI7w1Sb3hO3ofZcutVw1aoOquzWL/Ivdbg/FabKeN/C36akQVsSh
         SErHqLHyOJT0aPZnm1pi690baKeyrJg4XuPN6gTWeZllMkk/GPYJ3/vtBNQ0PA0g82eE
         CfN39jlWAH9i8y+aAQsOyR1cr+o4NX67WL4WvjveFoM39v1HhlE0VvYqSX7qSzbdMDio
         bG6w==
X-Gm-Message-State: AC+VfDyhPcaG1lReMKsGU8kb6OAtCJ/Ev+M+v7QrWehCOTsz5eKu3s0s
	NxBBVve0Y40ua36B6FliKVu04g++zZw=
X-Google-Smtp-Source: ACHHUZ7SxM/8IOW5aQRqholNi1VKnBFIdF9qm4HS1/Usu4IGhazojqwIz5bjiO3FbnSOz+cuG3rnWQ==
X-Received: by 2002:a17:907:8694:b0:977:d468:827 with SMTP id qa20-20020a170907869400b00977d4680827mr14283759ejc.17.1686683938579;
        Tue, 13 Jun 2023 12:18:58 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709064f1000b0096f89fd4bf8sm6926161eju.122.2023.06.13.12.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 12:18:57 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: add support for v3.x
Date: Tue, 13 Jun 2023 22:17:58 +0300
Message-Id: <20230613191758.29502-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 19:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103275

Version 3.4.0 adds a lot of improvements and fixes (a notable one
being initial support for PKCS7 CMS), but since this is a pretty
big jump, let's keep both versions for a while, so the v2.x users
can upgrade to 3.x in a timely manner if needed.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/mbedtls_3.4.0.bb                  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb

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



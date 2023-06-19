Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86A9EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 18:26:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.15070.1687199177406216449
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 11:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=n3gSvRlr;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-519608ddbf7so3906905a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 11:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687199175; x=1689791175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq8rOC3+fdBs5gq3a/ov0dT99tNV1V6ToGzdnQUgBfs=;
        b=n3gSvRlrCFxGcfDF1v5yGl7CLE70gk523wbrLzylIx4tk8g+oJ9HwcHxdtuy0JUkar
         ADVigTDabkq/RiZoyJWcQ1QBXxmKul4Gc3wpwn9SD/QkRL742d50A/KXlrsLItVOa/G4
         UBSdkW6y04euys/g1TyC/P/+CKGgO1eZOJwXiczEwx8NrNMeDGrE1Rh4/6l0YuMb5ZlS
         NwrehSg61wA1c90dL0jHINJdwvLbMdmbH4HAJr/lzbG+V8EZrTWu+pSIJya7L50htBtx
         zJnqxLECg0MAhhJcGwsw+TAdQ56fhkRK3hgG/xiX+bhbEbWB27kkV4T/vdrR15bokECt
         f65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687199175; x=1689791175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq8rOC3+fdBs5gq3a/ov0dT99tNV1V6ToGzdnQUgBfs=;
        b=BQ2xJcyCG+CYL8d+NEr5jEou/30v+VzkHM3wFPMQttIcbbor8Q9DJL1XcNTxnG9bmu
         Q97IJBDcxeNkKEotxrggknBBruSh/AyaFzfxXPvhxBn35MRyLvM+ibV7F/Rboj6CvO2R
         JDZwgbBoQBDbDM1rzGF40em39xPAFGRtDEeMjDtyseQ1CHy/SSWEzHmrtb39BeFuPxxy
         WxfCo5jH5WOcPyTsxOv0nxPg6gSSGZqBnh+TriHSPuXYG1ToEHXJYyzgCorKnz6YuU1Z
         Xy9LnTXyJjJm0E7mG/wPmPdQMZYXbMQjcTSM2gp5+wVAX6dwDNkgdHlbDY++GRtu+rO5
         PfPA==
X-Gm-Message-State: AC+VfDxaxBsiBMD6l1ydhHORIioi+eH+uadczAAAIXTFGTYxZMZY19/G
	rPMlLe0wXuRm2PWNU4UWC3ElQOeYVFHTmXlw
X-Google-Smtp-Source: ACHHUZ68hbUhLy6arNb2hs8dgxiNlCFmWKzf3S1l4Ta8RFMyeHLqdZ0o6Smjw0ffb/Mtetn+119j1Q==
X-Received: by 2002:a17:906:9b8b:b0:96f:4927:7a96 with SMTP id dd11-20020a1709069b8b00b0096f49277a96mr9205735ejc.70.1687199175507;
        Mon, 19 Jun 2023 11:26:15 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709063a0900b00988c0c175c6sm28770eje.189.2023.06.19.11.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 11:26:14 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH v2] mbedtls: add support for v3.x
Date: Mon, 19 Jun 2023 21:25:59 +0300
Message-Id: <20230619182559.104504-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 18:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103441

Version 3.4.0 adds a lot of improvements and fixes (a notable one
being initial support for PKCS7 CMS), but since this is a pretty
big jump, let's keep both versions for a while, so the v2.x users
can upgrade to 3.x in a timely manner if needed.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/mbedtls_3.4.0.bb                  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
new file mode 100644
index 000000000..ebc6ba573
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -0,0 +1,85 @@
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
+# Needs crypto instructions on aarch64
+TUNE_CCARGS_MARCH_OPTS:append:aarch64 = "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
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
+# Strip host paths from autogenerated test files
+do_compile:append() {
+	sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
+	sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
+}
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



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72E2F9936C
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 10:57:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16895.1776941817821033968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 03:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fw1ezIwD;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43fe62837baso3940598f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776941816; x=1777546616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d42FTPBBknBfnaDD3zzpmyeOUriHsH246b+djB9RXik=;
        b=fw1ezIwDP0JSg/PV1eaOAXzBVFtHHi8mWxvUWk/J2HsjxZ6S/gCL/jqe2Z6TnFMQsA
         l3HUJ6gpg8mRWVr850q5m0YNfpyXt7gjJWV5yWMzPnjvMWq1C7PzeUyGOHOhOXzzzUGF
         5A8TgNx81Hg5HN7YzOApp/S4W/bxgGVGKSV8JlsbDRuO9co8X/mrISNSDPwW4bxfBDu3
         22WHJv+E38zDT9zLOf0O+uPNM5R1PD1azZCvKTTtYt7Cxy6551VZt+MPC5hPCy47JqFJ
         yXg7xF1O0O8tYaHSP85CxX1laG61cHOa7+Spe+OFJickyWEVlS02I8dc7B9mDbzh1DHE
         9JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941816; x=1777546616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d42FTPBBknBfnaDD3zzpmyeOUriHsH246b+djB9RXik=;
        b=iEY7HmFKjIIEmOAOvqT6BYm/AP8ibVQt0iLVaXxEAR0yUVKzNzt0PVdilw/uwpaoWG
         9HaKuyjeE+snki4s4bvzfBnqCkPcNUnGDCHTxu2aBKMG/ez3fpJSg7OVd3V3+ifh26II
         cH7FJlTHcznUNbXby3cKvOWug9g4W5yli8G1n/oUsgP2mKebglP3XNJm9VqUV/W/RNMW
         hSsNydiXVA6QYCl+tgaoS3cMDErg9JoCAW8ZKfWZpilxHkh+n5U508QznuBwnAZPeFdg
         rPBy3AjMYBZnHrz8BlL4ZK4rTEvptC0C/V0uPT/BwC+bMI+QyEVGY06EQqgYxIX8ige4
         qktw==
X-Gm-Message-State: AOJu0YyHvm9YNKJCghWz+ok9I4GUkwWKiJwUSwWIxvtSKopPUFxPSPWf
	qRGJ1bDdCdOD61QOXaSUIxFKC1YdlfVz+vOyv9pQcSQDIkFYoWigU6TragKkbw==
X-Gm-Gg: AeBDiet8ls0VFD7Znfxg/GIY2wO+WJQg1mHPptMPrIAJFoOwlJyKz8RXLiItqwNQVQw
	j9l5gPE/XDChl4cqouhTRPFHRlb5LgOA0AQBWwMMrxFjjI5/pkvGhOYWjkz2GoCo+f4qVyq2vQi
	z6YnEd4qhtXxs3/4wp1E8cBEqhK/dtsIDSUxHgk0NFTzOcsxsrWshaTLl9Xnb50/UxTURtlc+IZ
	0pbLETibb+ZmGRWQbM1AeyLL8ljwV8QTmUASVtkuVOFPob029yWPh8tBpBb/3wrQ59eKgQ0TNEb
	p4V50/qLVAGiMZ+z7equse8iG7eMb8JuuGu5NAqGpkb+OQGbRMQWG18u+Ss2YMu0I4/OzOqgCDC
	7I1hwioF+3SXkgHdEL1KEtMXfFStn/gkZDFyLjVViwwU1SlvQlLh/JhZNT8Lm8+nrGCZ7z7t5I5
	6X1ILQTZrPbUNtc1HCp99CaOmzRm0WnNs=
X-Received: by 2002:a05:6000:184b:b0:43d:70de:1c71 with SMTP id ffacd0b85a97d-43fe3db2e7bmr39426171f8f.11.1776941815731;
        Thu, 23 Apr 2026 03:56:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb13a0sm52591534f8f.8.2026.04.23.03.56.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:56:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mbedtls: add recipe for v4.1.0
Date: Thu, 23 Apr 2026 12:56:54 +0200
Message-ID: <20260423105654.3659814-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 10:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126573

This is the current LTS version for mbedtls, add it next to the existing recipe
for v3.6. This new version will be supported longer than v3.6, but there are
some incompatibilities between the two (see migration guide[1] and changelog[2]).

This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was dropped, as it is
now the regular behavior, without an option to turn it off. update-alternatives
class is also removed - it was required due to a sample program called "hello",
which has been removed from this release.

Added two small patches:
- one to handle the CC env var correctly from Python. This is submitted for upstream.
- one to use qemu to run cross-compiled binaries instead of running them as they are.
  This is not upstreamed, as it is OE specific.

Ptests passed successfully:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-04-23T07:29
BEGIN: /usr/lib/mbedtls/ptest
PASS: test_suite_config.mbedtls_boolean
PASS: test_suite_config.tls_combinations
PASS: test_suite_constant_time_hmac
PASS: test_suite_debug
PASS: test_suite_error
PASS: test_suite_mps
PASS: test_suite_net
PASS: test_suite_pkcs7
PASS: test_suite_ssl
PASS: test_suite_ssl.records
PASS: test_suite_ssl.tls-defrag
PASS: test_suite_ssl_decrypt.misc
PASS: test_suite_test_helpers
PASS: test_suite_timing
PASS: test_suite_version
PASS: test_suite_x509_oid
PASS: test_suite_x509parse
PASS: test_suite_x509write
DURATION: 7
END: /usr/lib/mbedtls/ptest
2026-04-23T07:29
STOP: ptest-runner
TOTAL: 1 FAIL: 0

[1]: https://github.com/Mbed-TLS/mbedtls/blob/development/docs/4.0-migration-guide.md
[2]: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-4.1.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
 ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
 .../mbedtls/mbedtls_4.1.0.bb                  | 93 +++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
new file mode 100644
index 0000000000..adddb7ad8e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
@@ -0,0 +1,33 @@
+From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 23 Apr 2026 08:54:02 +0200
+Subject: [PATCH] c_build_helper: Split cc command line
+
+Optionally the CC/HOSTCC environment variable can hold the command to
+invoke the C compiler, however this command can also contain extra
+arguments, not only the binary name. In this particular case Python
+was treating the whole value as a single binary name, and was trying
+to execute as such (e.g. "cc -arg1 -arg2" instead of "cc" and the arguments
+separately), which results in failure.
+
+Split the compiler command into its components to invoke it correctly.
+
+Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls-framework/pull/301]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ scripts/mbedtls_framework/c_build_helper.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbedtls_framework/c_build_helper.py
+index 59bb326e2..85dbb628f 100644
+--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
+@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename, include_dirs):
+     cc = os.getenv('HOSTCC', None)
+     if cc is None:
+         cc = os.getenv('CC', 'cc')
+-    cmd = [cc]
++    cmd = cc.split()
+ 
+     proc = subprocess.Popen(cmd,
+                             stdout=subprocess.DEVNULL,
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
new file mode 100644
index 0000000000..a9e8bb2ed9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
@@ -0,0 +1,29 @@
+From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 23 Apr 2026 09:14:40 +0200
+Subject: [PATCH] use qemuwrapper to run cross-compiled binary
+
+The build process executes a compiled binary to get some details,
+however this results in a failure in case of cross-compiling.
+
+Run it with qemuwrapper, that is created in the recipe.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ scripts/mbedtls_framework/c_build_helper.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbedtls_framework/c_build_helper.py
+index 59bb326e2..5c4c211ee 100644
+--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
+@@ -169,7 +169,7 @@ def get_c_expression_values(
+                              .format(caller, c_name))
+         else:
+             os.remove(c_name)
+-        output = subprocess.check_output([exe_name])
++        output = subprocess.check_output(['../../../qemuwrapper', exe_name])
+         return output.decode('ascii').strip().split('\n')
+     finally:
+         remove_file_if_exists(exe_name)
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
new file mode 100644
index 0000000000..aa637db776
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
@@ -0,0 +1,93 @@
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
+HOMEPAGE = "https://www.trustedfirmware.org/projects/mbed-tls/"
+BUGTRACKER = "https://github.com/Mbed-TLS/mbedtls/issues"
+
+LICENSE = "Apache-2.0 | GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
+
+SECTION = "libs"
+
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-4.1;tag=v${PV} \
+           file://run-ptest \
+           file://0001-c_build_helper-Split-cc-command-line.patch \
+           "
+
+SRC_URI:append:class-target = " file://0001-use-qemuwrapper-to-run-cross-compiled-binary.patch"
+
+SRCREV = "0fe989b6b514192783c469039edd325fd0989806"
+
+DEPENDS += "python3-jinja2-native qemu-native"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+inherit cmake ptest python3-dir qemu
+
+PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
+PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
+PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
+PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
+
+PROVIDES += "polarssl"
+RPROVIDES:${PN} = "polarssl"
+
+PACKAGES =+ "${PN}-programs"
+FILES:${PN}-programs = "${bindir}/"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "mbed_tls"
+
+PYTHONPATH:class-target = "${RECIPE_SYSROOT_NATIVE}${PYTHON_SITEPACKAGES_DIR}"
+PYTHONPATH:class-native = "${PYTHON_SITEPACKAGES_DIR}"
+export PYTHONPATH
+
+do_configure:prepend() {
+	# during building tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
+        # runs some of the cross-compiled binaries.
+
+	qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_LIBDIR}')])}"
+	cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+
+	chmod +x ${WORKDIR}/qemuwrapper
+
+}
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
+	install -d ${D}${PTEST_PATH}/framework
+	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
+	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
+	cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
+}


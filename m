Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBD8C64EC5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 15:25:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.543.1675869950331717944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 07:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=AQAMg4oG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so1735292wmb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npn1WaG22IV81BF555c934wNQgGFGYHqerw0E+jBl6g=;
        b=AQAMg4oGaiG0lGAuCGRSkpaXfpQulUIod0GvUKuXZAU7DjztJJtlXknpTpWVnfhVAU
         7+ELny6Bl8xmhD6IGP0Sg7dgoNyShNrVAgopM2C5CPPNMrRd8lhGimBYSKKNFdGPkARI
         uTdh26l3tmoylM8pC3O8JCt2gAERma4cpii1GWm+q4utEfVf1JJ2eCw2heuVV2WqetEU
         0OrQPl5ESyyjYgTqmYSdDlT4RrgxzixKXg+J42Fk1fzZpTgiZfnGNGR785GYHSMUzOpi
         DuDrjj3fpJYS2Fwg0YT8V1I3yfz5Vn+8uzk4LZd+WtrEDk7MZ3t5PCmUL1BPzFhAasP4
         wYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Npn1WaG22IV81BF555c934wNQgGFGYHqerw0E+jBl6g=;
        b=S1zhmZ/XQwSTWOSgNg5qDu8RgBmV1JbrbePgeKDNdTaiTTdheEcLnLdMD+eEkeCsuA
         XKqQ8I+/pzNxhwhVNSGA6cO2a3iP6UZPt/fUPFGmwzs6nNMa3XtjOuFYCdE5O6L3FhG0
         p+zxk8Uxnxc/6aPBllkViqilNofQrObtnadL0Sb8zuRXPXghFwHeG7pDTMrB1r6lTMp+
         EOOpeyKMUNmmDwevUSsKAjR6vIoJ1/63QSE67r3cqvw7+U2OK65XJdts7uTvC2RZVQaY
         smTiDDWj9NvykDdhkaNWwqfss+ggVAjrwU8RyMddo0O+2Zse5Is1GSxmRLfIzyjdCV/J
         MsUg==
X-Gm-Message-State: AO0yUKW5mfzpuA/H1I6FeZdSocA4K+JlEtuffkhtoKedyip2bdr1+tkE
	UqMSuA+ZN2Tv2Qz7Z6KGNe0j/A==
X-Google-Smtp-Source: AK7set/4ZO2/lqdPZIB1Kl6jSsvTmlI6NgyWKyIPsZZcwaVfdVnnc52xITtdIorduoSvcBsDSFE5pg==
X-Received: by 2002:a05:600c:4d22:b0:3db:1200:996e with SMTP id u34-20020a05600c4d2200b003db1200996emr6865242wmp.16.1675869948611;
        Wed, 08 Feb 2023 07:25:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a9fe:4fba:ab76:6149])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c3b8200b003dfe659f9b1sm6713239wms.3.2023.02.08.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:25:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 2/3] libgpiod: add a recipe for libgpiod v2.0-rc1
Date: Wed,  8 Feb 2023 16:25:40 +0100
Message-Id: <20230208152541.136848-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208152541.136848-1-brgl@bgdev.pl>
References: <20230208152541.136848-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 15:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100999

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a recipe for libgpiod v2 release candidate. Let's put common
bits and pieces into an .inc file and the source fetching into a
separate include that will be later reused by the python bindings that
for v2 will be moved into a separate recipe in meta-python.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../{files => libgpiod-1.6.4}/run-ptest       |  0
 .../libgpiod/libgpiod-2.0-rc1/run-ptest       | 24 ++++++++
 .../recipes-support/libgpiod/libgpiod-src.inc |  1 +
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 61 +++++++++++++++++++
 .../libgpiod/libgpiod_1.6.4.bb                | 56 ++---------------
 .../libgpiod/libgpiod_2.0-rc1.bb              | 21 +++++++
 6 files changed, 113 insertions(+), 50 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{files => libgpiod-1.6.4}/run-ptest (100%)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc1/run-ptest
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-src.inc
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.inc
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc1.bb

diff --git a/meta-oe/recipes-support/libgpiod/files/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-1.6.4/run-ptest
similarity index 100%
rename from meta-oe/recipes-support/libgpiod/files/run-ptest
rename to meta-oe/recipes-support/libgpiod/libgpiod-1.6.4/run-ptest
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc1/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc1/run-ptest
new file mode 100644
index 000000000..9475f0253
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc1/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+testbins="gpiod-test gpio-tools-test gpiod-cxx-test"
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd $ptestdir/tests
+
+# libgpiod v2 uses gpio-sim - a configfs-based testing module. We need to
+# make sure configfs is mounted before running any tests.
+modprobe configfs
+mountpoint /sys/kernel/config > /dev/null || mount -t configfs configfs /sys/kernel/config
+
+for testbin in $testbins; do
+	if test -e ./$testbin; then
+		./$testbin > ./$testbin.out 2>&1
+		if [ $? -ne 0 ]; then
+			echo "FAIL: $testbin"
+		else
+			echo "PASS: $testbin"
+		fi
+	else
+		echo "SKIP: $testbin"
+	fi
+done
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-src.inc b/meta-oe/recipes-support/libgpiod/libgpiod-src.inc
new file mode 100644
index 000000000..6bab4c1f4
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-src.inc
@@ -0,0 +1 @@
+SRC_URI += "https://www.kernel.org/pub/software/libs/libgpiod/libgpiod-${PV}.tar.xz"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
new file mode 100644
index 000000000..abb6544ec
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -0,0 +1,61 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
+
+require libgpiod-src.inc
+
+inherit autotools pkgconfig ptest
+
+SRC_URI += "file://run-ptest"
+
+PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
+
+# Enable cxx bindings by default.
+PACKAGECONFIG ?= " \
+    cxx \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+
+# Always build tools - they don't have any additional
+# requirements over the library.
+EXTRA_OECONF = "--enable-tools"
+
+DEPENDS += "autoconf-archive-native"
+
+PACKAGES =+ "${PN}-tools libgpiodcxx"
+FILES:${PN}-tools += " \
+    ${bindir}/gpiodetect \
+    ${bindir}/gpioinfo \
+    ${bindir}/gpioget \
+    ${bindir}/gpioset \
+    ${bindir}/gpiomon \
+"
+FILES:${PN}-ptest += " \
+    ${bindir}/gpiod-test \
+    ${bindir}/gpio-tools-test \
+    ${bindir}/gpio-tools-test.bats \
+    ${bindir}/gpiod-cxx-test \
+"
+FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
+
+RRECOMMENDS:${PN}-ptest += "coreutils"
+RDEPENDS:${PN}-ptest += "bats"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+
+    # These are the core C library tests
+    install -m 0755 ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
+
+    # Tools are always built so let's always install them for ptest even if
+    # we're not selecting libgpiod-tools.
+    install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
+    for tool in ${FILES:${PN}-tools}; do
+        install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
+    done
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
+        install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
+    fi
+}
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
index 70a77c883..df0e3f104 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
@@ -1,80 +1,36 @@
-SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
+require libgpiod.inc
 
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI = " \
-    https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
-    file://run-ptest \
-"
-
-SRC_URI[md5sum] = "7a2cca6ead9296c27e877070dd8853bc"
 SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
 
-inherit autotools pkgconfig python3native ptest
+inherit python3native
 
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
-PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
-# Enable cxx bindings by default.
-PACKAGECONFIG ?= "cxx \
-		  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
-
 # Always build tools - they don't have any additional
 # requirements over the library.
 EXTRA_OECONF = "--enable-tools"
 
-DEPENDS += "autoconf-archive-native"
-
-PACKAGES =+ "${PN}-tools libgpiodcxx ${PN}-python"
-FILES:${PN}-tools = " \
-    ${bindir}/gpiodetect \
-    ${bindir}/gpioinfo \
-    ${bindir}/gpioget \
-    ${bindir}/gpioset \
-    ${bindir}/gpiofind \
-    ${bindir}/gpiomon \
-"
+PACKAGES =+ "${PN}-python"
+FILES:${PN}-tools += "${bindir}/gpiofind"
 FILES:${PN}-ptest += " \
-    ${bindir}/gpiod-test \
-    ${bindir}/gpio-tools-test \
-    ${bindir}/gpio-tools-test.bats \
-    ${bindir}/gpiod-cxx-test \
     ${bindir}/gpiod_py_test.py \
     ${libdir}/libgpiomockup.so.* \
 "
-FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 
 RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
 RRECOMMENDS:${PN}-ptest += " \
     kernel-module-gpio-mockup \
-    coreutils \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '', d)} \
 "
-RDEPENDS:${PN}-ptest += "bats python3-packaging"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-
-    # These are the core C library tests
-    install -m 0755 ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
-
-    # Tools are always built so let's always install them for ptest even if
-    # we're not selecting libgpiod-tools.
-    install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
-    for tool in ${FILES:${PN}-tools}; do
-        install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
-    done
-
-    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
-        install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
-    fi
+RDEPENDS:${PN}-ptest += "python3-packaging"
 
+do_install_ptest:append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
         install -m 0755 ${S}/bindings/python/tests/gpiod_py_test.py ${D}${PTEST_PATH}/tests/
     fi
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc1.bb
new file mode 100644
index 000000000..6894932ee
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc1.bb
@@ -0,0 +1,21 @@
+require libgpiod.inc
+
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSES/LGPL-2.1-or-later.txt;md5=4b54a1fd55a448865a0b32d41598759d \
+    file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
+"
+
+SRC_URI[sha256sum] = "64a718e8f8e022afc1880bae0b6ddc874fca1ce1bf8a2ac88bab4ccca6b66a1e"
+
+S = "${WORKDIR}/libgpiod-2.0"
+
+# We must enable gpioset-interactive for all gpio-tools tests to pass
+PACKAGECONFIG[tests] = "--enable-tests --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
+PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
+
+FILES:${PN}-tools += "${bindir}/gpionotify"
+FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
+
+RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim"
-- 
2.37.2



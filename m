Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1315AC77B77
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 11:52:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7190.1681473116240358092
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 04:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=dIACYHfc;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id r20so1409207wra.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681473115; x=1684065115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isQvspYrormjndV80siKsgSa5WDp2NmyrQf87wXkCsE=;
        b=dIACYHfcZ2PgTEuUWwnCpmhDW89AEP5wdU8p0xx0nEycFsZgStaobn8nQbatcYXW6q
         I/hD1FTqPfEPYR9IAH0HSsEI0QiUKcmalC/nURc3+/IOTp5npCftcn/FzsbeHAFSYQvA
         EYuWuqJYcT9IuFrAqwadz2MNLYmIexcIz+yXACtEoPDWWooZp6hFj0YTvd78+NvGwEUH
         RJFziP6TdI4yc4YKFHumn6YKpaH7WIR4N0ClCMS55ErcaHaQH8TtmEB1wkdLccuu3LFH
         F5brI14Dsif6dE1xYfWq92+USoz4db6fU1DKVDpdN1JtINLmhN7lTQtzc1ivedDOQ8sI
         y1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681473115; x=1684065115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isQvspYrormjndV80siKsgSa5WDp2NmyrQf87wXkCsE=;
        b=N2u44/dHZosHTva+Fh5o9r3h7syS5vvH7L0pXqPaq436vxWhfJnrdmjFDb+kxlrWO5
         hy5buL57ns2FMpJhG5Wfuw/MaN2V7fx6E8ddJFVfREjdTRChbcwiTEErjtqJyHyt8AaM
         uLMf0A9SmXV4rUjjnaWdUFdKIq5ogY6eRT7p+rWeIbWfmSqyiY8SdnN7445LWCkCrBMG
         x1xVbx6I2RAHZ4zNokRu63edjtfR9XVJ1RYu3+VHD634yCDNYoccOwrfHUqM8eRplTaK
         iRCs7fXv16BeCDPG1JDYdW/41kLMKJhwAuvJTBXswuTTVEtLfWbvqYBSBLknGn8tpbe3
         TGrw==
X-Gm-Message-State: AAQBX9csgLaLbgwasrFPihEsjv9rYHK9YcX55CduWjAvu30JK6e+hTNp
	VqMGieryoJXhYjfbYk5B2Vkm1Q==
X-Google-Smtp-Source: AKy350ZcALVyLH+9aZZ/GFJ6pY09yqnhv2JothIuHl/NhBLG2kauGGTPWWFuIoq//4V0129F8+Kc8w==
X-Received: by 2002:adf:e788:0:b0:2f7:85e0:de75 with SMTP id n8-20020adfe788000000b002f785e0de75mr787504wrm.19.1681473114703;
        Fri, 14 Apr 2023 04:51:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6b0:9ea2:8124:b254])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b002efb3566b0asm3379523wro.52.2023.04.14.04.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:51:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH v2 3/4] python3-gpiod: fetch sources from pypi
Date: Fri, 14 Apr 2023 13:51:46 +0200
Message-Id: <20230414115147.136593-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230414115147.136593-1-brgl@bgdev.pl>
References: <20230414115147.136593-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 11:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Python bindings to libgpiod are now available on pypi. The source
package is a limited subset of the original repository. As such the
ptest package now requires the libgpiod-ptest to be available at
run-time (for libgpiosim.so against which the test C extension is
linked).

The problem with installing the C extensions for tests is now fixed so
drop the do_install:append(). We no longer have to pass any additional
CFLAGS to setup.py either.

We update the version of the recipe but the changes only apply to
building and packaging, there are no functional changes to the code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-gpiod_2.0.1.bb             | 38 ++++++++++++++
 .../python/python3-gpiod_2.0.bb               | 49 -------------------
 2 files changed, 38 insertions(+), 49 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
new file mode 100644
index 000000000..f833e6903
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Python bindings for libgpiod."
+AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
+
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
+# The actual license files live in the upstream libgpiod from which the pypi
+# package is spun out.
+LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=120334ed83ec0cb248605e775bd13b87"
+
+SRC_URI += "file://run-ptest"
+
+SRC_URI[sha256sum] = "d5c0f9502e97e7359b9dd601e29f15d668983ce50f5c13323f3302845f790fa6"
+
+inherit setuptools3 ptest pypi
+
+PYPI_PACKAGE = "libgpiod"
+
+DEPENDS += "libgpiod"
+RDEPENDS:${PN} += " \
+    libgpiod (>= 2.0) \
+    python3-datetime \
+    python3-profile \
+"
+RDEPENDS:${PN}-ptest += " \
+    libgpiod-ptest \
+    python3-setuptools \
+"
+
+export GPIOD_WITH_TESTS = "${@bb.utils.contains("PTEST_ENABLED", "1", "1", "0", d)}"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim
+    install -d ${D}${PTEST_PATH}/gpiod-test/procname
+    install -m 0644 ${S}/tests/*.py ${D}${PTEST_PATH}/gpiod-test/
+    install -m 0644 ${B}/build/lib*/tests/gpiosim/_ext* ${D}${PTEST_PATH}/gpiod-test/gpiosim
+    install -m 0644 ${S}/tests/gpiosim/*.py ${D}${PTEST_PATH}/gpiod-test/gpiosim
+    install -m 0644 ${B}/build/lib*/tests/procname/_ext* ${D}${PTEST_PATH}/gpiod-test/procname
+    install -m 0644 ${S}/tests/procname/*.py ${D}${PTEST_PATH}/gpiod-test/procname
+}
diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
deleted file mode 100644
index e39d5beb1..000000000
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Python bindings for libgpiod."
-AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
-
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
-LIC_FILES_CHKSUM = " \
-    file://../../LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://../../LICENSES/LGPL-2.1-or-later.txt;md5=4b54a1fd55a448865a0b32d41598759d \
-    file://../../LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
-"
-
-require recipes-support/libgpiod/libgpiod-src.inc
-
-SRC_URI += "file://run-ptest"
-
-SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
-S = "${WORKDIR}/libgpiod-${PV}/bindings/python"
-
-inherit setuptools3 ptest
-
-DEPENDS += "libgpiod"
-RDEPENDS:${PN} += " \
-    libgpiod (>= 2.0) \
-    python3-datetime \
-    python3-profile \
-"
-RDEPENDS:${PN}-ptest += "python3-setuptools"
-
-export GPIOD_WITH_TESTS = "${@bb.utils.contains("PTEST_ENABLED", "1", "1", "0", d)}"
-PTEST_CFLAGS = "${@bb.utils.contains("PTEST_ENABLED", "1", "-I../../tests/gpiosim", "", d)}"
-# Setuptools store full filesystem paths in DWARF files. Map them to './' to
-# avoid QA warnings.
-export CFLAGS = "${PTEST_CFLAGS} -fdebug-prefix-map=${B}=./"
-
-do_install:append() {
-    # Python setuptools have an issue where they install C extensions even if
-    # they're not in the list of packages to be packaged. This is how the test
-    # extensions end up being installed. Remove them here.
-    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/tests/
-}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim
-    install -d ${D}${PTEST_PATH}/gpiod-test/procname
-    install -m 0644 ${B}/tests/*.py ${D}${PTEST_PATH}/gpiod-test/
-    install -m 0644 ${B}/build/lib*/tests/gpiosim/_ext* ${D}${PTEST_PATH}/gpiod-test/gpiosim
-    install -m 0644 ${B}/tests/gpiosim/*.py ${D}${PTEST_PATH}/gpiod-test/gpiosim
-    install -m 0644 ${B}/build/lib*/tests/procname/_ext* ${D}${PTEST_PATH}/gpiod-test/procname
-    install -m 0644 ${B}/tests/procname/*.py ${D}${PTEST_PATH}/gpiod-test/procname
-}
-- 
2.37.2



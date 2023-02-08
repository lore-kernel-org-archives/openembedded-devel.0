Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB5AC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 15:25:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.541.1675869950861532711
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 07:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=F6fVcuBw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1756619wms.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yijMRAhcpGUpwaLDewNuxZGUM/3gs1mO1+5hNrAm14Y=;
        b=F6fVcuBwPE8I9siQdSoYMVAB5V/j0aLBZVM/UYLvQ0EGKtw9umCOqUtuI7wd2lByHW
         5WCPHU5lgG4zDezWGZDuiUfUBTYUoJZtVaXpqp3TNMSd7I1RBirbHLvi6vqY+NVXcyjB
         iJHRB8RkhMbEbZmzDfVVXgKarrBBAsHYb9ucvcqce+2/EWl2D1Tq0RBhEdBp85j7xMJz
         vukOzBRZtA1HO+J3IzPhPcOmC6/RPNgJDuAKoJfNjb+pe1HXo/1UP/Szsl+fNiHQ1mSx
         MtnAD9ksM8CzoCHrysXu2XyP54aA+E6tHwWUB+m6+PYM0MAB4VWMCWKAFBX46AdN6/AG
         yfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yijMRAhcpGUpwaLDewNuxZGUM/3gs1mO1+5hNrAm14Y=;
        b=S9CPeCs7fZYCmTY7/fJyTPlhoM+7DI9oI0RPlryXWf5REBm2i0UcpJB+QuznGlRAEv
         3MIY/bWmaNctWQyzOfhKpvimFGHK8W25nHyoXIxqdeK/Dklqhjxy4YxOVW/6mFHC2EiA
         plOccD3q6zxctcQYpx9UAjVOtSMIVTk9QIgdwhReD6NUrfV/TNTrk4kiH06TOT6SDCmS
         YLiCPdZ3OdY20ql9NK9mpzmdcYU8DIwkRM0hNNc4SL6mIv7NUeCCPVeY34t1HUxymaex
         EoxIoWTIU2U+KLWo100/T7tBRjKq4YEqM2NvagM8y5ueyJnIGZPQpgRBrDhSVCJsu+W/
         XLqA==
X-Gm-Message-State: AO0yUKXiWWMATlAgfa7SS1FLd2v5tFW8raBb/gIYG3l1LxNZIxzsS3yf
	uv84v8jjMWopuvKVlsL7hyx8Rg==
X-Google-Smtp-Source: AK7set91FqOeTTxmthFf+xLRmBps/UqjToPCSxft+/HFB88YeIAz34wmFCoN3VK6ijRr1jGqqiBxzg==
X-Received: by 2002:a05:600c:3317:b0:3e0:111:28a9 with SMTP id q23-20020a05600c331700b003e0011128a9mr6845918wmp.22.1675869949386;
        Wed, 08 Feb 2023 07:25:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a9fe:4fba:ab76:6149])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c3b8200b003dfe659f9b1sm6713239wms.3.2023.02.08.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:25:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 3/3] python3-gpiod: new package
Date: Wed,  8 Feb 2023 16:25:41 +0100
Message-Id: <20230208152541.136848-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208152541.136848-1-brgl@bgdev.pl>
References: <20230208152541.136848-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 15:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101000

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for libgpiod v2 python bindings. This is a release
candidate but once the proper v2.0 is released, it will be made public
on pypi and the recipe modified accordingly.

As libgpiod python bindings now use setuptools and not make, we can
separate the recipe from the rest of the library.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-gpiod/run-ptest            | 15 +++++++
 .../python/python3-gpiod_2.0-rc1.bb           | 45 +++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0-rc1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2275ccd6c..2428674c4 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -157,6 +157,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-gmqtt \
     python3-gnupg \
     python3-google-api-python-client \
+    python3-gpiod \
     python3-gpsd-py3 \
     python3-graphviz \
     python3-greenlet \
diff --git a/meta-python/recipes-devtools/python/python3-gpiod/run-ptest b/meta-python/recipes-devtools/python/python3-gpiod/run-ptest
new file mode 100644
index 000000000..bf1244b07
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpiod/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+cd $(dirname "$(readlink -f "$0")")
+
+# python3-gpiod uses gpio-sim - a configfs-based testing module. We need to
+# make sure configfs is mounted before running any tests.
+modprobe configfs
+mountpoint /sys/kernel/config > /dev/null || mount -t configfs configfs /sys/kernel/config
+
+python3 -m gpiod-test -v > ./python3-gpiod.out 2>&1
+if [ $? -ne 0 ]; then
+	echo "FAIL: python3-gpiod"
+else
+	echo "PASS: python3-gpiod"
+fi
diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc1.bb
new file mode 100644
index 000000000..a05cc3619
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc1.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Python bindings for libgpiod."
+AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
+
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
+LIC_FILES_CHKSUM = " \
+    file://../../LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://../../LICENSES/LGPL-2.1-or-later.txt;md5=4b54a1fd55a448865a0b32d41598759d \
+    file://../../LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
+"
+
+require recipes-support/libgpiod/libgpiod-src.inc
+
+SRC_URI += "file://run-ptest"
+
+SRC_URI[sha256sum] = "64a718e8f8e022afc1880bae0b6ddc874fca1ce1bf8a2ac88bab4ccca6b66a1e"
+S = "${WORKDIR}/libgpiod-2.0/bindings/python"
+
+inherit setuptools3 ptest
+
+DEPENDS += "libgpiod"
+RDEPENDS:${PN} += "libgpiod (>= 2.0)"
+RDEPENDS:${PN}-ptest += "python3-setuptools"
+
+export GPIOD_WITH_TESTS = "${@bb.utils.contains("PTEST_ENABLED", "1", "1", "0", d)}"
+PTEST_CFLAGS = "${@bb.utils.contains("PTEST_ENABLED", "1", "-I../../tests/gpiosim", "", d)}"
+# Setuptools store full filesystem paths in DWARF files. Map them to './' to
+# avoid QA warnings.
+export CFLAGS = "${PTEST_CFLAGS} -fdebug-prefix-map=${B}=./"
+
+do_install:append() {
+    # Python setuptools have an issue where they install C extensions even if
+    # they're not in the list of packages to be packaged. This is how the test
+    # extensions end up being installed. Remove them here.
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/tests/
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim
+    install -d ${D}${PTEST_PATH}/gpiod-test/procname
+    install -m 0644 ${B}/tests/*.py ${D}${PTEST_PATH}/gpiod-test/
+    install -m 0644 ${B}/build/lib*/tests/gpiosim/_ext* ${D}${PTEST_PATH}/gpiod-test/gpiosim
+    install -m 0644 ${B}/tests/gpiosim/*.py ${D}${PTEST_PATH}/gpiod-test/gpiosim
+    install -m 0644 ${B}/build/lib*/tests/procname/_ext* ${D}${PTEST_PATH}/gpiod-test/procname
+    install -m 0644 ${B}/tests/procname/*.py ${D}${PTEST_PATH}/gpiod-test/procname
+}
-- 
2.37.2



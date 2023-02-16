Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9173FC636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:49:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5978.1676537386306085818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=fJ29dEZ3;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id k5so824597wrh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 00:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSarJ0f3SuLCiAfo2SoYeiUi7rmmqehb3hn1/lyuEwM=;
        b=fJ29dEZ3Zs2L/no6R7yVldbFZmEdROBe7SOrBpfmprWHU+wcsAc7DM+tgu264G1KhX
         s5YGoWaVJYm/x1YNcPjZq295h1RwddBxbohd01WOs112WY+V+rPkJiMO04pY3FZjOXNt
         9uetHos8CO3MJOZw0DJ/2u82BN/DuLwWiOxaIT2PceivHpIUaOQYUyygJsOSpRNCQ8nH
         fzoXBZKNpI9nF+tThzk/7Mq/shCNR3PARtGErkIbEjHNlSJViJ7mkjZ4wrLV5SHtd0nU
         4Ye+RbiDQBIDzHOF+Re22DaHNkj97r14mbDsymgv8H132OwxaTfP7jFqvSR+XPXN1bEg
         3OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSarJ0f3SuLCiAfo2SoYeiUi7rmmqehb3hn1/lyuEwM=;
        b=gXHZe+DVy0L8Pv13rkPkATkekB2msPPrNGJiXMhCxcUdblE6F2rDw/tLivMIF8lna8
         gTXsOxWMCxM6iwlC4bIMXWfuA7rSl633VFN49TNZJjxGxGYlxgDt0Pk4u30bz804ZbeV
         oWxxLy3s/OaEq3EOU4PBsQ+kpX00aVclkofIzb/o7e3otOzxQ7+Q2q5n5LykbZF/eXyw
         a7gaarGUDfvKv+5UQjBB+RdsshwV5ghp+dXCeKbuNgB0/VMRQIefP/UTg6SbAWCFRO7M
         tWeUb0p6obtdGFZ6wSl6ZNUnA/+lbVm/nCplB5TjCCf9Vs/vSzZEnXe0SQzlceeeXmli
         qKSQ==
X-Gm-Message-State: AO0yUKUahlGcj0BK70J5m4hw6xfuasvt+4hMQ5MfOqwIppkQfdICeG8V
	eMFKyOVwxTapLVTI6o54dNsYEJGPno7RF/sS
X-Google-Smtp-Source: AK7set+qWt6YyLygXwHnLi21tjyUGbgzoR3SDAnK+lj4jW/0r+C/v/OXHD1bSV5dwxMFp3qlyg3hPA==
X-Received: by 2002:adf:fdc3:0:b0:2c5:4480:b590 with SMTP id i3-20020adffdc3000000b002c54480b590mr4289055wrs.54.1676537384685;
        Thu, 16 Feb 2023 00:49:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d5004000000b002c5706f7c6dsm891326wrt.94.2023.02.16.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 00:49:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH v2 2/2] python3-gpiod: new package
Date: Thu, 16 Feb 2023 09:49:37 +0100
Message-Id: <20230216084937.7365-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230216084937.7365-1-brgl@bgdev.pl>
References: <20230216084937.7365-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101098

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
 .../python/python3-gpiod_2.0-rc2.bb           | 45 +++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb

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
diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb
new file mode 100644
index 000000000..0a16ce06b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb
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
+SRC_URI[sha256sum] = "1b931bfabef897911e59d45c80b8930c43fa72f08aab9c03e8dfd4005881c09e"
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



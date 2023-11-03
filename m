Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F770C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:04:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.64160.1699041856366670396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=3FWt0G0J;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4084de32db5so21292275e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699041855; x=1699646655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1b3cPxPBp2fa8p/f7tHrhHw9sxUrYWBmeMEGJU2Gyk=;
        b=3FWt0G0Jt9ct9Bu0l/GCRX7dM3vpVnCWoMVy4a2I3jo0SPCsKM5Uxq3njz3+yJH5U7
         x/jXOD7KVdK7WZ6H86ScNu6QmCn0MvCeOWFrS2GlkFgQISmkOf+t4lWfkpqTXMKaQ+WM
         4eJ8sRuq25Ml91b9HkiweKvGOONRIKtSUZUnazQzvnpEtJQwNAatuu4PDcRlhJFyn6FU
         OyLmwVveA/VYXHfZ1m+eHWL5weTDhZRMFgOlj0zMJQwXYq8ApFEWHBZzMfJI2+sxbW4/
         15bLdw7Vnia+CSM5Rzms+MAz9vT+pONKSPTG693c0CPKUzwtkQdh2KseUa5HeenfEG7M
         CEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699041855; x=1699646655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1b3cPxPBp2fa8p/f7tHrhHw9sxUrYWBmeMEGJU2Gyk=;
        b=EFf5yeGSeDZuU+3zB9iH/QS4mQrRnYDLpioQYGQwn/UWlkGeEfue/NOwoDpzefW4gJ
         ufUNwyq0ED4ZfXdJDn1fe/BE3OrvNS7NmV6KEtTilzIrIUAXHC4IERaSbsAKOB5ZRdUV
         qtOYfYvP5FmefG3HIToSJ9ydTq12TGMRszTjk34T0tDgCGp5yWX/4Q+UWdBVabmVRjh2
         69v/KVozeCUkrc8IOGQFctZSYouzR6OxSkOzkNOneHZU7fCtddb2UiYcDO8DtXznCfN2
         OlrmFuWpG8XFLvFQ447r0s/yx6cDfYGmOqoj60jvjtYuG2/Dy+Pe6hXbuTkA5PZKfSPT
         Y51Q==
X-Gm-Message-State: AOJu0YztpO6hU/UL9XxjurzX8sUyoM9JL247/WFxT6twlx2EF7zv67YC
	PU5iU89dJAg7OO3HWiN2IYC4GQ==
X-Google-Smtp-Source: AGHT+IEU9sUrd+b7zAnJ1h305IQMPYFcOSCRdx4pMjjfC5Ugki0sbSZHMaC6AgvncGPUkRF9zf6a5A==
X-Received: by 2002:a05:600c:c0f:b0:409:5d7d:b26d with SMTP id fm15-20020a05600c0c0f00b004095d7db26dmr6692298wmb.15.1699041854591;
        Fri, 03 Nov 2023 13:04:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:46da:49a1:7e38:ff1e])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c459000b003fefaf299b6sm3545565wmo.38.2023.11.03.13.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:04:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 2/2] libgpiod: update to v2.1
Date: Fri,  3 Nov 2023 21:04:06 +0100
Message-Id: <20231103200406.338830-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103200406.338830-1-brgl@bgdev.pl>
References: <20231103200406.338830-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106086

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a small release bringing in a bunch of improvements and a couple
new interfaces. Details are available in NEWS.

We need to move the code in recipes around a bit as the tests now use
shunit2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest   | 2 +-
 meta-oe/recipes-support/libgpiod/libgpiod.inc             | 3 ---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb        | 8 +++++++-
 .../libgpiod/{libgpiod_2.0.2.bb => libgpiod_2.1.bb}       | 7 ++++++-
 4 files changed, 14 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.2.bb => libgpiod_2.1.bb} (79%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
index 9475f0253..29ec0d102 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-testbins="gpiod-test gpio-tools-test gpiod-cxx-test"
+testbins="gpiod-test gpio-tools-test.bash gpiod-cxx-test"
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd $ptestdir/tests
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index 0eda47bba..dc1fb4fe9 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -33,7 +33,6 @@ FILES:${PN}-tools += " \
 FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 RRECOMMENDS:${PN}-ptest += "coreutils"
-RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PTEST_ENABLED', '1', 'bats', '', d)}"
 
 do_install:append() {
     rm -f ${D}${bindir}/gpiod-test
@@ -50,8 +49,6 @@ do_install_ptest() {
 
     # Tools are always built so let's always install them for ptest even if
     # we're not selecting libgpiod-tools.
-    install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
     for tool in ${FILES:${PN}-tools}; do
         install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
     done
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
index b28aa8e69..111a5727b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
@@ -30,9 +30,15 @@ RRECOMMENDS:${PN}-ptest += " \
     kernel-module-gpio-mockup \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '', d)} \
 "
-RDEPENDS:${PN}-ptest += "python3-packaging"
+RDEPENDS:${PN}-ptest += " \
+    python3-packaging \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'bats', '', d)} \
+"
 
 do_install_ptest:append() {
+    install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
+
     if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
         install -m 0755 ${S}/bindings/python/tests/gpiod_py_test.py ${D}${PTEST_PATH}/tests/
     fi
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
similarity index 79%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
index 7533e0a25..1e92d0079 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI[sha256sum] = "c3c923dc63b7b1b02639c9179c81e3d9febf0887bbaa59775990229cdbedb88b"
+SRC_URI[sha256sum] = "fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
@@ -20,8 +20,13 @@ FILES:${PN}-tools += "${bindir}/gpionotify"
 FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
 FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
 
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2', '', d)} \
+"
 RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim"
 
 do_install_ptest:append() {
+    install -m 0755 ${S}/tools/gpio-tools-test.bash ${D}${PTEST_PATH}/tests/
     install -m 0644 ${S}/tests/gpiosim/gpiosim.h ${D}${includedir}/gpiosim.h
 }
-- 
2.39.2



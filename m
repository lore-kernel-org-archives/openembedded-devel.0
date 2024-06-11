Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2DBC41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:04:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5018.1718096674337492824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=eD+3yRuM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso18144425e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718096672; x=1718701472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbnT9Sxnhw2cRie75zZvgD/9i+8l0tMNCqUrImWVkpo=;
        b=eD+3yRuMkLooqCpPoIA/u5zvmEGHH27bppfwzvZiokHvICWN7ng5FgLoAeuHcYVkCS
         FCJIGX6Qz3mk5dKE/iz5tn9obKFr/VsIheLHMcyggFyku3mDNRcswqHbeUrRW09QYlnX
         RAfCRLYna5BigYJEULqy6IhOU3tiw4T+OYiQcvg1jcw42/+m8lcJBLawd1veMPgIqLS0
         Y1aCDM89NyGGA5krkjmUptxfn+ENgzKnq+8/reePPQKiju+zVDixg9XXLiNC5dyE+SVn
         cXLoHSyhsSefO+22L3IEbqoXAJ/8l6ycnvIRmBcF9r4bwn1E9MIjTX8dU8fpsUgaKIPh
         BhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096672; x=1718701472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbnT9Sxnhw2cRie75zZvgD/9i+8l0tMNCqUrImWVkpo=;
        b=WxZWxvdCI1b3igywYUmeJcMpRflPg7soBQMS3etarj3rCwIZQ01NtaMCWbyOMlI70y
         FwcxbVWTCMv/h2Oe1bnS7/5aZpRveGHsZO68qe3qRqaBsNqR+gl0qO4YbTK4uU3irimy
         YrQZmsOQf1jqUMSTrSz1CjfcCp3sTFkF5mB/0uPZXE6UvvKDIoIb+WhJn2QgDOyPp7TA
         UuwabE7P5f1J7wXInGkK/7sBv+4bpfX6/qa2dID2ogKgTHwOJp1DnKePiL9kQP6eNTnQ
         VCiRA2rqGfObqCHxGvqb9AaiCdkvKxs352PXfpCccEM79KWXY4jOJBUVNP+bWQBKXUBA
         V1ow==
X-Forwarded-Encrypted: i=1; AJvYcCUYenHSiZWHWfWV/VYd44y5vSlg3440PMbDSuWeg4xwQkRToTLkCe1ckPzEYEQ60Vup/hTknp1zHnJHW7Mlyg4IaVsF/ZKQlsWs45T134zOJwWKrj0kpCZUjw==
X-Gm-Message-State: AOJu0YwLMlzPmeZG+j3EyDgfX1buR+t1vw1Z0trVgmz0x8CJFKCVlNnl
	ZjZVG7fZcwTHqhg05gHHA8eXSNMmWnjSMY/p6Yl2pqvfBJuQPxj972MBP+YO9OE=
X-Google-Smtp-Source: AGHT+IHrL5PnGSc8m1SLv8OFo+oAmOEQOqRWwmt8g6WZZCyqzKN+34xjzZSN4nutQQlqh9aobMu+Cg==
X-Received: by 2002:a05:6000:82:b0:34f:8f7c:8fe2 with SMTP id ffacd0b85a97d-35f2b27c1a1mr1704035f8f.10.1718096672617;
        Tue, 11 Jun 2024 02:04:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:38d:e428:e1bc:56b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421dd8c3a9esm59166345e9.27.2024.06.11.02.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:04:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] libgpiod: disable C++ tests for libgpiod v1.6.x
Date: Tue, 11 Jun 2024 11:04:03 +0200
Message-ID: <20240611090403.26474-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611090403.26474-1-brgl@bgdev.pl>
References: <20240611090403.26474-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 09:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110823

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Catch2 recipe is moving to version 3 of the Catch2 API which will make
the C++ tests in libgpiod uncompatible. libgpiod v2 as ported to the new
interface but v1.6.x will not be so just disable building the C++ tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../0001-bindings-cxx-disable-tests.patch     | 33 +++++++++++++++++++
 .../libgpiod/libgpiod-1.x/run-ptest           |  2 +-
 meta-oe/recipes-support/libgpiod/libgpiod.inc |  4 ---
 .../libgpiod/libgpiod_1.6.5.bb                |  2 ++
 .../libgpiod/libgpiod_2.1.2.bb                |  1 +
 5 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-bindings-cxx-disable-tests.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-bindings-cxx-disable-tests.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-bindings-cxx-disable-tests.patch
new file mode 100644
index 000000000..0b850ba13
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-bindings-cxx-disable-tests.patch
@@ -0,0 +1,33 @@
+From 8293f0b8a329beed542f5c8a2efa4641759fccf4 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+Date: Tue, 11 Jun 2024 10:34:14 +0200
+Subject: [PATCH] bindings: cxx: disable tests
+
+Meta-openembedded is moving to catch2 v3 which will make the C++ tests
+incompatible with the testing library. As this is an older version of
+the project, just disable C++ tests entirely.
+
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+---
+Upstream-Status: Inappropriate [upstream continues to use Catch2 v2]
+
+ bindings/cxx/Makefile.am | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
+index 5c40ceb..d901836 100644
+--- a/bindings/cxx/Makefile.am
++++ b/bindings/cxx/Makefile.am
+@@ -19,9 +19,3 @@ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libgpiodcxx.pc
+ 
+ SUBDIRS = . examples
+-
+-if WITH_TESTS
+-
+-SUBDIRS += tests
+-
+-endif
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/run-ptest
index 61b9b69fc..a56c2bb68 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-testbins="gpiod-test gpio-tools-test gpiod-cxx-test gpiod_py_test.py"
+testbins="gpiod-test gpio-tools-test gpiod_py_test.py"
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd $ptestdir/tests
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index dc1fb4fe9..7b68f77d2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -52,9 +52,5 @@ do_install_ptest() {
     for tool in ${FILES:${PN}-tools}; do
         install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
     done
-
-    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
-        install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
-    fi
 }
 
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index 74b49a57b..079583949 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -3,6 +3,8 @@ require libgpiod.inc
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
+SRC_URI += "file://0001-bindings-cxx-disable-tests.patch"
+
 SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
index 6e4fbd2a3..137461880 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN}-ptest += " \
 RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
 
 do_install_ptest:append() {
+    install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
     install -m 0755 ${S}/tools/gpio-tools-test.bash ${D}${PTEST_PATH}/tests/
     install -m 0644 ${S}/tests/gpiosim/gpiosim.h ${D}${includedir}/gpiosim.h
 }
-- 
2.40.1



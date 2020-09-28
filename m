Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.35788.1601297130841981307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=Quo+HhJL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.67, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f67.google.com with SMTP id o5so1127593wrn.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWiJ8X1SU/u518Drv6INZA9KhhTSYlk5K4jNAeuTQwA=;
        b=Quo+HhJLd5HAevrxnTmu369B48RpNRWb/NAkMxbhsAIX/h0jH6QHUfSQ3n8Kz6529V
         AsP3i80n7DOhlUFUs942dkg8HcsmL5F5DblOXNhsHnImpHPsKeZnpYffvLmYdbZ1pGOp
         P5sHFCABQc6bwsA5TL55tK1cS/MkVsmywf53s70rAZ+D5I9yKmil1WLAh/I/T/WwH9di
         FHPX+TAYAp21POTj31Rr9sY7S66ISH7e7m1ppqQRQ6MH2sd9rwvsHzqPppULq9uzC5ZN
         YosfTqklgsw6Xhk24yc/m04lDZEuRU3Jso+BwpdHL9owUNZvx7OiBU21RllYJM/dlfI4
         8OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWiJ8X1SU/u518Drv6INZA9KhhTSYlk5K4jNAeuTQwA=;
        b=tSQA5iqZaK508th8wWBGMSKpENO6RayAO7A36aIYC2UCaUfZcqunWDjRqk1sqSNTUR
         nsbjPieZMcFyWl+NneKbjnKMehf4peRKc1TNbBM7cto8ud5OU0mjP93Z1hTBuiJDeV0o
         4YxuiB2V3rSuFFAQ2fJZaXgjjXTbpx1Dq1U3lVgSyCuOT8lWNTak2Fh5Qxs14LExVfqa
         YQc16ePayyTg58LNBiv5cclMo9OPr3jlgrf4LO/YE5Rys6saTgDGJpSH9t6xbhTHcgbt
         OQ6ozmbNMm10BvQ6XoXFvdqOl1e03X1k6Ejm0JiVmS91MgEYBhwv1X29F+Z5pDmXd4fk
         bsow==
X-Gm-Message-State: AOAM532pi6oqtFEW0z7Ah0YG7avTzk/Jh/DztLQpWQFPZ6czjXzZYoWM
	90uVTZl+PL+YIpO9ugKIBnRCmA==
X-Google-Smtp-Source: ABdhPJzwILgh9fApunWcURZfDZ5W5Q/ql/ihq6fEh/+hR0rVhRWmeT6TCr2VBeIxMWg3+q1xcsgisA==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr1542748wrr.402.1601297129238;
        Mon, 28 Sep 2020 05:45:29 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id n3sm1135993wmn.28.2020.09.28.05.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 05:45:28 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: consolidate the recipe files
Date: Mon, 28 Sep 2020 14:45:26 +0200
Message-Id: <20200928124526.27734-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

After dropping the support for v0.3.x, we no longer need the split into
.bb and .inc files. Let's move the contents of libgpiod.inc into
libgpiod_1.4.4.bb.

While at it: do some refactoring: let's use ${BPN} in the URL, consolidate
certain variables and add some explanatory comments.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 19 ---------------
 .../libgpiod/libgpiod_1.4.4.bb                | 24 +++++++++++++++----
 2 files changed, 19 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.inc

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
deleted file mode 100644
index cae3145dd..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
-
-SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-
-EXTRA_OECONF = "--enable-tools"
-
-PACKAGES =+ " ${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}/*"
-
-PACKAGES =+ "libgpiodcxx"
-FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
index b5a64a554..6433675ca 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
@@ -1,17 +1,31 @@
-require libgpiod.inc
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+AUTHOR = "Bartosz Golaszewski <bgolaszewski@baylibre.com>"
 
-DEPENDS += "autoconf-archive-native"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
+SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "064c2627397e6641c52de09a26951112"
 SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314b67699"
 
-# enable cxx bindings
-PACKAGECONFIG ?= "cxx"
+inherit autotools pkgconfig python3native
 
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
-inherit python3native
+# Enable cxx bindings by default.
+PACKAGECONFIG ?= "cxx"
+
+# Always build tools - they don't have any additional
+# requirements over the library.
+EXTRA_OECONF = "--enable-tools"
+
+DEPENDS += "autoconf-archive-native"
+
+PACKAGES =+ "${PN}-tools libgpiodcxx"
+FILES_${PN}-tools = "${bindir}/*"
+FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.26.1


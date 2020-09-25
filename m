Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.5927.1601034285859566239
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 04:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=z2yf7HnL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id e2so2958464wme.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2020 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YaK2zteiuy+foY5rIxA5Y0U2xCcwEzSXX5+Aa7PLOSA=;
        b=z2yf7HnLgb0kX6onKIaKRh4QGTwkd1qYE0REkFjf7NQAE3dSQSHgIB8umpyFg9kLu+
         J19rrzL+cb8di/8FCzj/IgVd4M7AYPXnk9BLwLzo+W/UoWyWTpoLr73vkJIbgKLMUnVY
         rIYnCrsiPhiFBE605u5dYB1QBnF588fb5u48qstpqH+Yw5iFucRYYk7q1mPkLZBgXzVL
         XZiZDJz569mMO1IntKxwbXb1EM9YoQKZGvcrcogXrpABtP2BPYfPe4fOtVJu8wiUojkS
         lU99wAEEIfsj1Jsscgkdhr+H3HRPOoAXcCpyi+v+NoQLe5zqJhdtfjt49dgHxnzRW7EH
         djIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YaK2zteiuy+foY5rIxA5Y0U2xCcwEzSXX5+Aa7PLOSA=;
        b=QsbITBcsQu/wvJAyUfC1yvVpRrcNI7hesbuVe0zADSGmbi0MDOw22FZK76YDUA1xOe
         vtBGZHR+9rU1hsMwg5kbED/SlBi9ziar6zbBtYBT2MeztChk9hdaumDis+oaEAt/+mNp
         Aim8baliHN8XPVAuRkCG6ILwXSSEjkcgMTkM2PvjhbQ5afzYSKaGzxswJ97xDZ5EPpJm
         y3sEMsyDi0vFmDk3T9U6fH69TisZFJI2QokWG4Z4YSfspTExZ9x2+97bOajRcGaGEjZf
         ta774OxdOZOPRl/+abPrYRMLb5uVQsGd3WCxq2K81G9dW48RNagfulTk+t/aYnxrd9De
         L3wQ==
X-Gm-Message-State: AOAM530DnnLKofaiEgBE8mRzE8jRWugafrlW6pr8KLSAff3CXhONljrD
	5QrxZMJ5OOsuMjreYgNqyKOqHQ==
X-Google-Smtp-Source: ABdhPJyfyzRgBlh7r3/jdQ2a0Bw0Tt1I2oXHSWNMPwYBq20nn0R0qusjZ+mu3N8mef6WeMR/LbLPFw==
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr2728400wmj.172.1601034284226;
        Fri, 25 Sep 2020 04:44:44 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id o15sm2524459wmh.29.2020.09.25.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 04:44:43 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: refactor the recipe
Date: Fri, 25 Sep 2020 13:44:41 +0200
Message-Id: <20200925114441.13905-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

After dropping the support for v0.3.x let's refactor the entire recipe.
Let's move most definitions into libgpiod.inc and only leave the hashes
in libgpiod_1.4.4.bb. Let's use ${BPN} in the URL, consolidate certain
variables and add some explanatory comments.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 21 ++++++++++++++-----
 .../libgpiod/libgpiod_1.4.4.bb                | 15 -------------
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index cae3145dd..ec81b3bdd 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -3,17 +3,28 @@ SUMMARY = "C library and tools for interacting with the linux GPIO character dev
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
+SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig python3native
 
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
+PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
+# Enable cxx bindings by default.
+PACKAGECONFIG ?= "cxx"
+
+# Always build tools - they don't have any additional
+# requirements over the library.
 EXTRA_OECONF = "--enable-tools"
 
-PACKAGES =+ " ${PN}-tools"
+DEPENDS += "autoconf-archive-native"
 
+PACKAGES =+ "${PN}-tools libgpiodcxx"
 FILES_${PN}-tools = "${bindir}/*"
-
-PACKAGES =+ "libgpiodcxx"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
+RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
index b5a64a554..6cb43f994 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
@@ -1,19 +1,4 @@
 require libgpiod.inc
 
-DEPENDS += "autoconf-archive-native"
-
 SRC_URI[md5sum] = "064c2627397e6641c52de09a26951112"
 SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314b67699"
-
-# enable cxx bindings
-PACKAGECONFIG ?= "cxx"
-
-PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
-PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
-
-inherit python3native
-
-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
-RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
-- 
2.26.1


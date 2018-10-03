Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id AC61C72EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id s12-v6so6804738wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QWkIHYtLEosrhyOrkf+bseL0V7eFw6eL6/T4xalSm3o=;
	b=GNPyAddGyMm7KrdhNvY/N9u0k62gHrD1ZSaFPpZf8h0dJzMy+thzrKy8W+rBV0zVfG
	wmgLYpnYqsUtjSasOiVr1yHd/6fRrIrVkYYEi77sdzcqKH/uEkMg6jePZd/rk5aM3PCT
	Mkxf3GDMPhp1k4gZLQa2bgsBl0hHqGVHYAVx+FL5NtDrycjXhQP8OPRIRGs9Z08PSJSw
	IItZB/6SxYY/1m/JRPmd6C+tMBab34O/SFN5R0SCm5GicoZaQuwU4/EjHt1YTOqD75G3
	7j4Qr16+NtEsSV7VX4WyumlYa/aqfpVqBbETXKbqTkpizThQFfnmgHRYtLs0DIs6M5Qp
	6lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QWkIHYtLEosrhyOrkf+bseL0V7eFw6eL6/T4xalSm3o=;
	b=l/jeQSp7VjjfGr1k1oZk2nKUGbREvGEuyCbFqoJ0KWpyimP/BLJ0l2RdTgp8dttS+U
	WXvwRTvq6oJp87ziqdW8M9gt4nfVyKjT+pe2ZUvcEK+r/IRxDi5QNoBEMIFbfmZ0kIWn
	+JmJpD4aJv/sPb8jK1uwkTOPhDz6nnghpE3pmTfA0l01AQa9lTvUQN8TsvCjfmAN89xK
	g/o4BGUzlzdSBP/35NNT+gdN0OzX4zkH1+4ylRtgablB9v+/7/GqiLTau+CSMs2A3+wo
	YfX1l1azB39yD2S235PMEMrB5ScUre9S0R/tGjW7tPNA9LcbsBmcB8ST0zcrnXHBabYQ
	ZWpg==
X-Gm-Message-State: ABuFfojjoNCS+51oXaAZsN2rtEHD100QAnkLSgXAZcxMjFSwVfWkH3pz
	yfw73vlLwe6PAvb0fJyRByzGd9YN
X-Google-Smtp-Source: ACcGV61KT7YDOzfa82sE518XC0HMN1MW169tyBTX3SIeIOBQbfgJnF/os5E7pdEixvoWaC1lTg8UKA==
X-Received: by 2002:a1c:1203:: with SMTP id 3-v6mr2418543wms.21.1538594715763; 
	Wed, 03 Oct 2018 12:25:15 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:49 +0200
Message-Id: <20181003192455.24921-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] openjpeg: cmake fixes to prepare update of poppler
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2018 19:25:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Move *,cmake from ${libdir}/cmake to ${libdir}/cmake/<name-and-version>
  That is standard location cmake files are installed.
* Do not export executables - they will not be found in dependant's sysroot

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ke-files-are-installed-at-common-location.patch | 48 ++++++++++++++++++++++
 ...cmake-to-export-binaries-they-don-t-make-.patch | 31 ++++++++++++++
 .../recipes-graphics/openjpeg/openjpeg_2.3.0.bb    | 10 ++---
 3 files changed, 84 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch
new file mode 100644
index 000000000..5c5fe64f2
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.patch
@@ -0,0 +1,48 @@
+From fe491c0919f5adc8d626cb98c5ec19d0b99dfe20 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 27 Sep 2018 23:45:04 +0200
+Subject: [PATCH] Ensure cmake files are installed at common location
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* Otherwise recent poppler is not able to find them
+* Include path needs adjustment with this change
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ CMakeLists.txt                | 2 +-
+ cmake/OpenJPEGConfig.cmake.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ff70a06f..23d2fac4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -150,7 +150,7 @@ if(NOT OPENJPEG_INSTALL_PACKAGE_DIR)
+   # We could install *.cmake files in share/ however those files contains
+   # hardcoded path to libraries on a multi-arch system (fedora/debian) those
+   # path will be different (lib/i386-linux-gnu vs lib/x86_64-linux-gnu)
+-  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/${OPENJPEG_INSTALL_SUBDIR}")
++  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/cmake/${OPENJPEG_INSTALL_SUBDIR}")
+ endif()
+ 
+ if (APPLE)
+diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.in
+index b20294ca..6a2f4baf 100644
+--- a/cmake/OpenJPEGConfig.cmake.in
++++ b/cmake/OpenJPEGConfig.cmake.in
+@@ -26,7 +26,7 @@ get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
+ if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
+   # This is an install tree
+   include(${SELF_DIR}/OpenJPEGTargets.cmake)
+-  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../@OPENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
++  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../../@OPENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
+   set(OPENJPEG_INCLUDE_DIRS ${OPENJPEG_INCLUDE_ROOT})
+ 
+ else()
+-- 
+2.14.4
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
new file mode 100644
index 000000000..0ba13cf88
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
@@ -0,0 +1,31 @@
+From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 28 Sep 2018 00:38:50 +0200
+Subject: [PATCH] Do not ask cmake to export binaries - they don't make it
+ dependants sysroots
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/bin/jp2/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
+index 4324c36d..2c11fe02 100644
+--- a/src/bin/jp2/CMakeLists.txt
++++ b/src/bin/jp2/CMakeLists.txt
+@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
+   endif()
+   # Install exe
+   install(TARGETS ${exe}
+-    EXPORT OpenJPEGTargets
+     DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Applications
+   )
+   if(OPJ_USE_DSYMUTIL)
+-- 
+2.14.4
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
index d5d06206d..c50d55e4b 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
 DEPENDS = "libpng tiff lcms zlib"
 
-SRC_URI = "git://github.com/uclouvain/openjpeg.git"
+SRC_URI = " \
+    git://github.com/uclouvain/openjpeg.git \
+    file://0001-Ensure-cmake-files-are-installed-at-common-location.patch \
+    file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+"
 SRCREV = "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
 S = "${WORKDIR}/git"
 
 inherit cmake
-
-# standard path for *.cmake
-EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
-                  -DOPENJPEG_INSTALL_LIB_DIR:PATH=${libdir}"
-- 
2.14.4



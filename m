Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1A86E362
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:47:43 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id w61so1589735wes.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j5r8J+kATpFkafGC6/6RS3IHdYlFT5zmVNFhduRwYGM=;
	b=mZXGvzxRVSQkJicBxF3mdh/TaZ3B+y1c5aiEMQ446ILSzv9HsD96QBTxeMlo3qlmcY
	KGHmCRwpgcM7ZYmPp8qJvtTeJIdRQYwiHo2IjHZ+lEzB7K4nELGvoyGqYAF6lvaemrFE
	Tj4ZARBiwu+If4ju/934Zlnf0YZPQMJFAZ4fuTlNeYaT7FnYOBvYtD8NyLXacybxzkoD
	Q63XaVmuaAh688nNJDcn7LJITSlQBBdDK7dCCh8kX3d3/LoxKa4v6MC146atPgztuZVz
	skPcwS41cg4fZHtGDDNNjjmQ80/VBHnh0vIkKYnqK2shADpAF49XJywQHmW+IXWguQzd
	K3OA==
X-Gm-Message-State: ALoCoQl9U52aciZ+YV7ZSSFoZyDv4P2ppvOgp/YBZYRia2edujsLttgmc3WxhIyczN+KFC15xUsb
X-Received: by 10.180.77.131 with SMTP id s3mr1561012wiw.25.1389782864210;
	Wed, 15 Jan 2014 02:47:44 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm6016854wiy.3.2014.01.15.02.47.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:47:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:47:31 +0000
Message-Id: <1389782854-14355-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
References: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][meta-oe 2/5] waffle: remove, migrated to oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 10:47:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/waffle/files/cflags.patch |   27 ----------------
 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb    |   34 --------------------
 2 files changed, 61 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/waffle/files/cflags.patch
 delete mode 100644 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb

diff --git a/meta-oe/recipes-graphics/waffle/files/cflags.patch b/meta-oe/recipes-graphics/waffle/files/cflags.patch
deleted file mode 100644
index 3819756..0000000
--- a/meta-oe/recipes-graphics/waffle/files/cflags.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 2abec1cb3c17fa5ec8d945d79acd74a39c38293a Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 12 Dec 2012 12:57:18 +0000
-Subject: cmake: respect existing CMAKE_C_FLAGS
-
-When cross-compiling it's not unusual to need specific arguments passed to gcc
-such as --sysroot.  Ensure that these are passed on from the toolchain file by
-appending to CMAKE_C_FLAGS instead of overwriting it.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: waffle-1.2.2/CMakeLists.txt
-===================================================================
---- waffle-1.2.2.orig/CMakeLists.txt	2012-11-28 00:43:40.000000000 +0000
-+++ waffle-1.2.2/CMakeLists.txt	2013-02-13 11:34:02.476188233 +0000
-@@ -212,7 +212,7 @@
- # ------------------------------------------------------------------------------
- 
- # FIXME: Only enable c99 if compiler supports it.
--set(CMAKE_C_FLAGS "--std=c99 -Wall -Werror=implicit-function-declaration")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c99 -Wall -Werror=implicit-function-declaration")
- if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
-     # On MacOS, the SSE2 headers trigger this error.
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=missing-prototypes")
diff --git a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
deleted file mode 100644
index 4f80191..0000000
--- a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
-                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
-
-SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
-           file://cflags.patch"
-
-SRC_URI[md5sum] = "fdd07cea7709422fbf72418ee63a285d"
-SRC_URI[sha256sum] = "7e342c859b58d4e051b347ef3d7740ed2f3b6c506b93daec272724afe7dd1311"
-
-inherit cmake
-
-# This should be overridden per-machine to reflect the capabilities of the GL
-# stack.
-PACKAGECONFIG ??= "glx"
-
-# I say virtual/libgl, actually wants gl.pc
-PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
-
-# I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
-# DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,,virtual/libgl wayland"
-
-# I say virtual/libgl, actually wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
-
-# I say virtual/libgl, actually wants egl.pc
-PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
-
-# Take the flags added by PACKAGECONFIG and pass them to cmake.
-EXTRA_OECMAKE = "${EXTRA_OECONF}"
-
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.7.10.4



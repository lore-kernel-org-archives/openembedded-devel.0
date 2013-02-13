Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5eJZ-0003nb-6o
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Feb 2013 16:32:16 +0100
Received: by mail-wi0-f172.google.com with SMTP id ez12so5828197wid.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 07:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=p3KEArB/Zt8PJTZVuzHqw40v5FlMSvS0AOemU7U8ClM=;
	b=R0/O9CSHhFBZE/5kcRHZw+GVapR1LvrPYyT5vtH29qI51GYmrxEk195YI/HkgEPkY7
	DYqAbh/+GhpuuEZUQE4CclsMEaMiWObqlaRpb61wnnqWhsQRaKCXGRCrUgvSfDPdkuXS
	W1yByiBD6ZzOxWKHkwr87ZxQE8VQgxbG9SOeVK1w6M8+XYCULv6oFfuoM5itQ0S6WuQe
	v0C9wWz/TwYKQZvHXY+jLCshNW0bLNmff6dBKydHnda2HYeqFgXap5uGnE3TPCrlWKkj
	RaoBx/6kzQJekuk/A/BB3e+mVzm6EoyOqD7jinglC2b8CwZ2AdC65fCnDbIFzCJsvBDv
	cHNg==
X-Received: by 10.194.236.166 with SMTP id uv6mr38760977wjc.34.1360768564206; 
	Wed, 13 Feb 2013 07:16:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm36352496wiy.2.2013.02.13.07.16.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 07:16:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2013 15:13:49 +0000
Message-Id: <1360768429-28203-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnbp6+qaAUbH8gUSD6FeZh1qdU72nCKBSLpa3RnGaZs57ZVl/732Lrtc7Z7Cw6THGDblwHU
Subject: [PATCH] waffle: new package, a GL deferred resolution library.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2013 15:32:23 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/waffle/files/cflags.patch |   27 ++++++++++++++++
 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb    |   34 ++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/waffle/files/cflags.patch
 create mode 100644 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb

diff --git a/meta-oe/recipes-graphics/waffle/files/cflags.patch b/meta-oe/recipes-graphics/waffle/files/cflags.patch
new file mode 100644
index 0000000..3819756
--- /dev/null
+++ b/meta-oe/recipes-graphics/waffle/files/cflags.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 2abec1cb3c17fa5ec8d945d79acd74a39c38293a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 12 Dec 2012 12:57:18 +0000
+Subject: cmake: respect existing CMAKE_C_FLAGS
+
+When cross-compiling it's not unusual to need specific arguments passed to gcc
+such as --sysroot.  Ensure that these are passed on from the toolchain file by
+appending to CMAKE_C_FLAGS instead of overwriting it.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: waffle-1.2.2/CMakeLists.txt
+===================================================================
+--- waffle-1.2.2.orig/CMakeLists.txt	2012-11-28 00:43:40.000000000 +0000
++++ waffle-1.2.2/CMakeLists.txt	2013-02-13 11:34:02.476188233 +0000
+@@ -212,7 +212,7 @@
+ # ------------------------------------------------------------------------------
+ 
+ # FIXME: Only enable c99 if compiler supports it.
+-set(CMAKE_C_FLAGS "--std=c99 -Wall -Werror=implicit-function-declaration")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c99 -Wall -Werror=implicit-function-declaration")
+ if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
+     # On MacOS, the SSE2 headers trigger this error.
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=missing-prototypes")
diff --git a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
new file mode 100644
index 0000000..4f80191
--- /dev/null
+++ b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
@@ -0,0 +1,34 @@
+SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
+                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
+
+SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
+           file://cflags.patch"
+
+SRC_URI[md5sum] = "fdd07cea7709422fbf72418ee63a285d"
+SRC_URI[sha256sum] = "7e342c859b58d4e051b347ef3d7740ed2f3b6c506b93daec272724afe7dd1311"
+
+inherit cmake
+
+# This should be overridden per-machine to reflect the capabilities of the GL
+# stack.
+PACKAGECONFIG ??= "glx"
+
+# I say virtual/libgl, actually wants gl.pc
+PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
+
+# I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
+# DISTRO_FEATURE.
+PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,,virtual/libgl wayland"
+
+# I say virtual/libgl, actually wants gbm.pc egl.pc
+PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
+
+# I say virtual/libgl, actually wants egl.pc
+PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
+
+# Take the flags added by PACKAGECONFIG and pass them to cmake.
+EXTRA_OECMAKE = "${EXTRA_OECONF}"
+
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.7.10.4




Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E66B6B06C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 16:15:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a16so8255277wrv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2019 08:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VQ1PcbSLC10lbS9jo+we9vL2/i+52TBTQ8ZvmLTBerc=;
	b=nRfUeBwQ8ZSV21CnWBDtwCYUIK858D5kRLMmyWy2xBR1D8FMXQI3lYtG4bYxZWfeRt
	QAJutnK323uxXf7pd8Q/Su1JeWzEcZp9REYMdwrX+EsKGyUZ8NJWoXzFcvcys0CAytJx
	3HPFi5lc60L5Ck/QmebMm1Pah//dvB3vn6Hd6/c4CuPRaUPaC/vEBrVCAQUOBSs+4rei
	DBTzbAD49h0lYJWHsLC9MdT8pZfdf6N0DMLGPzsCNVKOuVb0owhwsFubwef5lp0zziim
	dfCP26KEQaVxYkx9OaQR3+7xNF66neoQy1PvyKO1beKQfHD5waEuRBqDLPVLwh0pSLr/
	x97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VQ1PcbSLC10lbS9jo+we9vL2/i+52TBTQ8ZvmLTBerc=;
	b=cDE6mlkJpAVBdQq0g9XI4GxdSq/d7475DLOqdiOiYCpNlBpeoGo3ZyG/h93MJ/VuJ8
	jqDPQgtniIDeGCm12xCR03UL9bClQUjQWBpoi7kf5IJGsJEdA60YEvWPRfA6sPsqPRlC
	rWZAWXZ4qkRh7BLvD6sC/Eu/J3I8JE9qeogmkw3liVpInS2PCJTDyKSA+ZP89MdQNywX
	ldA0Ukpyk4vGdjic/SORb7XI8N9JNVszWGKC2aeaxDrWhZxiiIicbsXc/fpB/UaujyBh
	xU5ldWUAex0zTD2ugEPs5Sw0/GYXjoM8TKVBUlXWm4HhPIc4Tiy4Fol+Ot5S9LwuSIRW
	CYcQ==
X-Gm-Message-State: AHQUAuYutRp3Eei5HSl8YnJmTvymY6qXzOMpIXdqrQyB/DzkHzeTzKyf
	5Lvg5JugJYiy0ALh1XcryrvhDX+sQL0=
X-Google-Smtp-Source: AHgI3IbKEt7MDc1Nt8WysX32QFzgFNgfw/axTX+8veNc63eK81nO9lKGROW/fNdWeuBsQluUzH71Bw==
X-Received: by 2002:a5d:47d1:: with SMTP id l17mr8412587wrs.319.1549469722894; 
	Wed, 06 Feb 2019 08:15:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a4sm7619742wmm.22.2019.02.06.08.15.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 08:15:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Feb 2019 16:15:19 +0000
Message-Id: <20190206161519.2078-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glmark2: update to current git
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
X-List-Received-Date: Wed, 06 Feb 2019 16:15:23 -0000

Remove two patches merged upstream.  The other patch isn't required so can be
deleted.

Remove explicit --std=c++11 as the wscript adds --std=c++14 now.

Change PV to contain the full date just in case we want to update more than once
a month.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glmark2/files/0001-Fix-clang-warnings.patch    | 31 ----------------
 .../files/Fix-configure-for-sqrt-check.patch       | 21 -----------
 ...-packages-to-be-used-by-the-enabled-flavo.patch | 43 ----------------------
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   | 13 ++-----
 4 files changed, 3 insertions(+), 105 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch
deleted file mode 100644
index cdf09faec8..0000000000
--- a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 35e9f80518d666db5f9c62e8072ffbc307b4af4f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Aug 2017 08:30:01 -0700
-Subject: [PATCH] Fix clang warnings
-
-../src/native-state-drm.cpp:334:20: error: cannot pass object of non-trivial type 'std::__cxx11::basic_string<char>' through variadic function; call will abort at runtime [-Wnon-pod-varargs]
-                   dev_path);
-                   ^
-1 error generated.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/native-state-drm.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
-index dc2b323..62566ee 100644
---- a/src/native-state-drm.cpp
-+++ b/src/native-state-drm.cpp
-@@ -331,7 +331,7 @@ static int open_using_udev_scan()
-     if (!valid_fd(fd)) {
-         // %m is GLIBC specific... Maybe use strerror here...
-         Log::error("Tried to use '%s' but failed.\nReason : %m",
--                   dev_path);
-+                   dev_path.c_str());
-     }
-     else
-         Log::debug("Success!\n");
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
deleted file mode 100644
index 7de05ee583..0000000000
--- a/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 9fb298c398f88a63d71432be1410d52fae089063 Mon Sep 17 00:00:00 2001
-From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Mon, 8 Aug 2016 11:39:54 -0500
-
----
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index ca843f4..eb4a26a 100644
---- a/wscript
-+++ b/wscript
-@@ -84,7 +84,7 @@ def configure(ctx):
-         ctx.check_cc(lib = lib, uselib_store = uselib)
- 
-     # Check required functions
--    req_funcs = [('memset', 'string.h', []) ,('sqrt', 'math.h', ['m'])]
-+    req_funcs = [('memset', 'string.h', [])]
-     for func, header, uselib in req_funcs:
-         ctx.check_cc(function_name = func, header_name = header,
-                       uselib = uselib, mandatory = True)
diff --git a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch b/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
deleted file mode 100644
index 72b8debe56..0000000000
--- a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: Otavio Salvador <otavio@ossystems.com.br>
-Subject: [PATCH] build: Check packages to be used by the enabled flavors
-Organization: O.S. Systems Software LTDA.
-
-The packages shouldn't be dynamically detected otherwise the build
-predictability is lost. We now have all packages as mandatory but
-dependent of the flavors which use them.
-
-Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/8]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- wscript | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/wscript b/wscript
-index cab62a3..e7eaed0 100644
---- a/wscript
-+++ b/wscript
-@@ -121,13 +121,17 @@ def configure(ctx):
-                 ('mirclient','mirclient', '0.13', list_contains(ctx.options.flavors, 'mir')),
-                 ('wayland-client','wayland-client', None, list_contains(ctx.options.flavors, 'wayland')),
-                 ('wayland-egl','wayland-egl', None, list_contains(ctx.options.flavors, 'wayland'))]
--    for (pkg, uselib, atleast, mandatory) in opt_pkgs:
-+    for (pkg, uselib, atleast, check) in opt_pkgs:
-+        # Check packages required by the flavors
-+        if not check:
-+            continue
-+
-         if atleast is None:
-             ctx.check_cfg(package = pkg, uselib_store = uselib,
--                          args = '--cflags --libs', mandatory = mandatory)
-+                          args = '--cflags --libs', mandatory = True)
-         else:
-             ctx.check_cfg(package = pkg, uselib_store = uselib, atleast_version=atleast,
--                          args = '--cflags --libs', mandatory = mandatory)
-+                          args = '--cflags --libs', mandatory = True)
- 
- 
-     # Prepend CXX flags so that they can be overriden by the
--- 
-2.4.6
-
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 99050e7047..7ed5cd0281 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -10,16 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS = "libpng jpeg udev"
 
-PV = "2017.07+${SRCPV}"
+PV = "20190205+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
-SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
-           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-           file://Fix-configure-for-sqrt-check.patch \
-           file://0001-Fix-clang-warnings.patch \
-           "
-SRCREV = "ed20c633f1926d1dd78e3e89043c85a81302cbe6"
+SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
+SRCREV = "0c90dd48df43a6b0db1d9aabca6298240f4968f7"
 
 S = "${WORKDIR}/git"
 
@@ -31,9 +27,6 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl
                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
                   drm-gl drm-gles2"
 
-# Enable C++11 features
-CXXFLAGS += "-std=c++11"
-
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
 PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm virtual/libgbm"
-- 
2.11.0



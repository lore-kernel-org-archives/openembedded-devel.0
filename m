Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E736661A0E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:14:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j7so6147875wrp.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 02:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+g8HbLd+7Q+1H4Pt4kipvrSkM8dGX2kYTa0FknEkDfY=;
	b=F8MeB13DwwH0bn4vnyifU1udUh7LKY8ezW533yYcItEmL8Ta92gOziHgO7ylEB/jq/
	LYremN0VI6FWdEOhl2MaJxdCW+hnOI9XEN2VFLYHUG/0jbe19Ms7BDEbEozIrZwHUnLc
	w9uxzn69WE1FFfyRc83MHWuSUXNFS7h5EtPeEFEa8j21Dds7TofjglANYXfWSgk+dp1S
	rPHsoQbdYNuwOL3XsYkvEIysk//Xbql0wLq1sur9GBSFf8nb3U4swzh03qUu3aTUmS8M
	jEaNzIyGJvtrau/cTz6DNvA61mQ1M8SHMvqNB46NeZpIVe6bHv+M+ahcj7uutvWDq405
	oxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+g8HbLd+7Q+1H4Pt4kipvrSkM8dGX2kYTa0FknEkDfY=;
	b=BpDWqM4qf8Xg7z55OsUT7wl09X6gbAYT4KDaf6YHHSS390UiEvIiUIvwrVQP7zAaXY
	WNTZ6b5JmS4xGXchkk0SVoSuBWhBD1KCiPa/uye5XfRac4YigC/c/8tOwpF5PizPb1W/
	R8OTRAqqAGFLGXUxr2Qr7y36KKdlfhZvP3Fdmuq1AIgt7AgjOwcnoFrm2DvyOpEaDE+o
	Oi73Qko2/vPHixP2lMl5Fu+ueO2RUQ9PpCwFvF+VhVJkL9YsYCOBsFfWn6KKj5R6qdym
	cdtYo6bG50ZOzZVAS6HBHiP6fugKLmhh2yG/AGQP7xoJz1gdOkjbOInI28OPXLkesa3r
	DC9A==
X-Gm-Message-State: APjAAAXDGvf2t22NRSOkGncFVvbkt/1wLUDfZpE3gAKiib/wiyBsoSaU
	geY7h4frdUV0iLu4RgWJGGwLEHl6
X-Google-Smtp-Source: APXvYqwdH32ojYhbCA7ICN8msj19WA4Y9aORQuMKEq8q/IRTC4P8PKdp76dVI0pbByY5FLV1ieoAxQ==
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr9663183wrp.335.1582971259425; 
	Sat, 29 Feb 2020 02:14:19 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id i7sm724461wro.87.2020.02.29.02.14.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 02:14:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Feb 2020 11:13:36 +0100
Message-Id: <20200229101336.30490-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200229101336.30490-1-alex.kanavin@gmail.com>
References: <20200229101336.30490-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] piglist: add from oe-core
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
X-List-Received-Date: Sat, 29 Feb 2020 10:14:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-bash-completions-in-the-right-place.patch | 35 ++++++++++
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch | 32 ++++++++++
 meta-oe/recipes-graphics/piglit/piglit_git.bb | 64 +++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
 create mode 100644 meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
 create mode 100644 meta-oe/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch b/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
new file mode 100644
index 000000000..e07e810a7
--- /dev/null
+++ b/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
@@ -0,0 +1,35 @@
+From 26faa2c157a27a18a9f767976730fe0c115e3af4 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 13 Jul 2016 19:19:02 +0300
+Subject: [PATCH] cmake: install bash-completions in the right place
+
+The completionsdir variable is a full path and should not be
+prefixed.
+
+This does mean the files may be installed outside of
+CMAKE_INSTALL_PREFIX -- the alternative is more difficult and
+means that bash completion files may be installed where
+bash-completion can't find them.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [mailing list]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8e2abba..784a8f9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -532,7 +532,7 @@ install (
+ if (BASH_COMPLETION_FOUND)
+ 	install(
+ 		FILES completions/bash/piglit
+-		DESTINATION ${CMAKE_INSTALL_PREFIX}/${BASH_COMPLETION_COMPLETIONSDIR}/
++		DESTINATION ${BASH_COMPLETION_COMPLETIONSDIR}/
+ 	)
+ endif (BASH_COMPLETION_FOUND)
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
new file mode 100644
index 000000000..5d6ec368b
--- /dev/null
+++ b/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -0,0 +1,32 @@
+From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Thu, 4 Oct 2018 14:43:17 +0200
+Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
+
+WAYLAND_wayland-client_INCLUDEDIR is an internal variable and is not correctly
+set when cross compiling. WAYLAND_INCLUDE_DIRS includes the correct path even
+when cross compiling.
+
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+Upstream-Status: Submitted [piglit@lists.freedesktop.org]
+---
+ tests/util/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
+index a5f080156..a303a9f58 100644
+--- a/tests/util/CMakeLists.txt
++++ b/tests/util/CMakeLists.txt
+@@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
+ 			piglit-framework-gl/piglit_wl_framework.c
+ 		)
+ 		list(APPEND UTIL_GL_INCLUDES
+-			${WAYLAND_wayland-client_INCLUDEDIR}
++			${WAYLAND_INCLUDE_DIRS}
+ 		)
+ 	endif()
+ 	if(PIGLIT_HAS_X11)
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-graphics/piglit/piglit_git.bb b/meta-oe/recipes-graphics/piglit/piglit_git.bb
new file mode 100644
index 000000000..58d10d6b9
--- /dev/null
+++ b/meta-oe/recipes-graphics/piglit/piglit_git.bb
@@ -0,0 +1,64 @@
+SUMMARY = "OpenGL driver testing framework"
+DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
+implementations."
+LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
+
+SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
+           file://0001-cmake-install-bash-completions-in-the-right-place.patch \
+           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
+           "
+UPSTREAM_CHECK_COMMITS = "1"
+
+SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
+# (when PV goes above 1.0 remove the trailing r)
+PV = "1.0+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
+X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
+
+DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
+
+inherit cmake pkgconfig python3native features_check bash-completion
+
+# depends on virtual/libgl
+REQUIRED_DISTRO_FEATURES += "opengl"
+
+# The built scripts go into the temporary directory according to tempfile
+# (typically /tmp) which can race if multiple builds happen on the same machine,
+# so tell it to use a directory in ${B} to avoid overwriting.
+export TEMP = "${B}/temp/"
+do_compile[dirs] =+ "${B}/temp/"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
+PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
+
+
+do_configure_prepend() {
+   if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
+        sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit/glut_wrap.h
+        sed -i -e "/^#.*include.*<GL\/glut.h>$/d" ${S}/src/piglit/glut_wrap.h
+   fi
+}
+
+# Forcibly strip because Piglit is *huge*
+OECMAKE_TARGET_INSTALL = "install/strip"
+
+RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
+	python3-misc \
+	python3-unixadmin python3-xml python3-multiprocessing \
+	python3-six python3-shell python3-io \
+	python3-netserver bash \
+	"
+
+INSANE_SKIP_${PN} += "dev-so already-stripped"
+
+# As nothing builds against Piglit we don't need to have anything in the
+# sysroot, especially when this is ~2GB of test suite
+SYSROOT_DIRS_remove = "${libdir}"
+
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
-- 
2.25.1



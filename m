Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 347AA615E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 09:28:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48XT825zkTz2Q;
	Wed,  4 Mar 2020 10:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583314099;
	bh=pXaFzuC4TUurbO9LaKpvtPPnoFO6VPHJUWhRkI3Iwgo=;
	h=From:To:Cc:Subject:Date:From;
	b=l/QdDYYzF9Y0EIXeAiEO77+FyEULPA4YTqjTNE1zIpJOYDFmzJEzlsEGR5PKwBdWf
	ShHvn9QYP6/GytlokqeFacK/4n+PsbsW0Qunfeewe6nAXMn7kyFIfdtY6H/rBRBN9I
	x9Isr/oMqrQnE343AEg7GN1gGd/hIC00dNal62V4IefCLudzZrtga+pbsR2fSIFAiA
	S0J/U3WIJCaKIva0SePWVukde0S1jCUqY76KGpq15VF3PJhep/pVHy8Ix9sRmMixZV
	vso4qRDxTCE2XwiZrIPiIRGmrSyydauqnIsqmVMzWVtu3ZfDutZNG8dPc0Msa/gdIJ
	8EBrJ0X+/lf/Bzei+82LKs1ZxZ00pAkGK2ytDR0maUSxur0dr/9448aribNRlmd1ng
	zWinL/XFGSATnJY1wXCjtH7OfZWI8Kv6isw9wsSXYPXr2BCEaeBn8910kGAyI5odaC
	mYkMcR69red9SW4Hl9pV9J+gH3W3Y2MExwe11aPvR3DBJuk+ojtMY3AGaqmz78b4WL
	DpXLHgzCwAYRvcvm/qeF1mP48Yh0B6B5KpAYNvQh1oAR+LMeHTyC7CTr40G2IELeB7
	uQXrpqYfWz7jKKITWNUcydUvl4xLNrgReSzbtQrRwTcE6i3rcZ/BsJTlJ5VjI7uVI5
	EonxsA2Q4rWe05Oh6hao4Hoc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2020 11:28:17 +0200
Message-Id: <20200304092817.6711-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] Revert "piglist: add from oe-core"
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
X-List-Received-Date: Wed, 04 Mar 2020 09:28:19 -0000

This reverts commit af22a7a46ab6306aa4d59037e59b4dcf373b2603.

The recipe is staying in OE-core.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-bash-completions-in-the-right-place.patch | 35 ----------
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch | 32 ----------
 meta-oe/recipes-graphics/piglit/piglit_git.bb | 64 -------------------
 3 files changed, 131 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
 delete mode 100644 meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
 delete mode 100644 meta-oe/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch b/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
deleted file mode 100644
index e07e810a7..000000000
--- a/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 26faa2c157a27a18a9f767976730fe0c115e3af4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 13 Jul 2016 19:19:02 +0300
-Subject: [PATCH] cmake: install bash-completions in the right place
-
-The completionsdir variable is a full path and should not be
-prefixed.
-
-This does mean the files may be installed outside of
-CMAKE_INSTALL_PREFIX -- the alternative is more difficult and
-means that bash completion files may be installed where
-bash-completion can't find them.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [mailing list]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8e2abba..784a8f9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -532,7 +532,7 @@ install (
- if (BASH_COMPLETION_FOUND)
- 	install(
- 		FILES completions/bash/piglit
--		DESTINATION ${CMAKE_INSTALL_PREFIX}/${BASH_COMPLETION_COMPLETIONSDIR}/
-+		DESTINATION ${BASH_COMPLETION_COMPLETIONSDIR}/
- 	)
- endif (BASH_COMPLETION_FOUND)
- 
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
deleted file mode 100644
index 5d6ec368b..000000000
--- a/meta-oe/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Thu, 4 Oct 2018 14:43:17 +0200
-Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
-
-WAYLAND_wayland-client_INCLUDEDIR is an internal variable and is not correctly
-set when cross compiling. WAYLAND_INCLUDE_DIRS includes the correct path even
-when cross compiling.
-
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-Upstream-Status: Submitted [piglit@lists.freedesktop.org]
----
- tests/util/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index a5f080156..a303a9f58 100644
---- a/tests/util/CMakeLists.txt
-+++ b/tests/util/CMakeLists.txt
-@@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
- 			piglit-framework-gl/piglit_wl_framework.c
- 		)
- 		list(APPEND UTIL_GL_INCLUDES
--			${WAYLAND_wayland-client_INCLUDEDIR}
-+			${WAYLAND_INCLUDE_DIRS}
- 		)
- 	endif()
- 	if(PIGLIT_HAS_X11)
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-graphics/piglit/piglit_git.bb b/meta-oe/recipes-graphics/piglit/piglit_git.bb
deleted file mode 100644
index 58d10d6b9..000000000
--- a/meta-oe/recipes-graphics/piglit/piglit_git.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY = "OpenGL driver testing framework"
-DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
-implementations."
-LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
-
-SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
-           file://0001-cmake-install-bash-completions-in-the-right-place.patch \
-           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
-           "
-UPSTREAM_CHECK_COMMITS = "1"
-
-SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
-# (when PV goes above 1.0 remove the trailing r)
-PV = "1.0+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
-X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
-
-DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
-
-inherit cmake pkgconfig python3native features_check bash-completion
-
-# depends on virtual/libgl
-REQUIRED_DISTRO_FEATURES += "opengl"
-
-# The built scripts go into the temporary directory according to tempfile
-# (typically /tmp) which can race if multiple builds happen on the same machine,
-# so tell it to use a directory in ${B} to avoid overwriting.
-export TEMP = "${B}/temp/"
-do_compile[dirs] =+ "${B}/temp/"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
-PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
-
-
-do_configure_prepend() {
-   if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
-        sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit/glut_wrap.h
-        sed -i -e "/^#.*include.*<GL\/glut.h>$/d" ${S}/src/piglit/glut_wrap.h
-   fi
-}
-
-# Forcibly strip because Piglit is *huge*
-OECMAKE_TARGET_INSTALL = "install/strip"
-
-RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
-	python3-misc \
-	python3-unixadmin python3-xml python3-multiprocessing \
-	python3-six python3-shell python3-io \
-	python3-netserver bash \
-	"
-
-INSANE_SKIP_${PN} += "dev-so already-stripped"
-
-# As nothing builds against Piglit we don't need to have anything in the
-# sysroot, especially when this is ~2GB of test suite
-SYSROOT_DIRS_remove = "${libdir}"
-
-# Can't be built with ccache
-CCACHE_DISABLE = "1"
-- 
2.17.1



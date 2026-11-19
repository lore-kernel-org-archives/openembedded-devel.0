Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11739.1795085361574175077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=EMaRRtCn;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout06.t-online.de (Postfix) with SMTP id 4A08C13B9
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:49:19 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzhd-4JwVds0; Thu, 19 Nov 2026 11:49:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] neovim: add recipe for 0.12.6
Date: Thu, 19 Nov 2026 11:47:49 +0100
Message-ID: <20261119104903.176376-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119104903.176376-1-f_l_k@t-online.de>
References: <20261119104903.176376-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795085358-C1FF89BF-1D867213/0/0 CLEAN NORMAL
X-TOI-MSGID: 8ee030af-9378-409f-ba89-5a9688c31b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795085359; i=f_l_k@t-online.de;
	bh=q8KcineArTpBS22zu7rHkpIM41qLcDwxydgb9DsJ2UU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EMaRRtCnbj5tlIS4+q/+zMH1df6PsT6JBs5SDpUD0wlkWSu8vLeVyGaTWcXAJNH+d
	 nSQr7CqjuJVT+8Bh7nJ+z4RIHF6l2DQ1mWMGlBw1+xOwFDspxaPbxgDXXCV/QBKyv6
	 g+2paVC+JvbKPmhIGWcn5xal3NjwuNbouoy8lNZyL/2cs4wSf2LTY9klHOHKm9U7ri
	 6wBNRSM3TS4v/i3aHO4J3S+oot21zPoYl9wm4V+J5RHY3Ek8oqLtoRJbp5nuaYIt5h
	 xk1CHiNCdO8fkvS/lOfXhZpgID1+qPvF4kznPwu3QlBeSpTu679X7/WxWXyQ/OsYaU
	 eiAsZbCmp4NGQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132675
Content-Type: text/plain; charset="utf-8"

Neovim is a Vim-based text editor with Lua scripting and built-in
tree-sitter support. It uses the system LuaJIT, libuv, luv, lpeg,
utf8proc and libtree-sitter; the native build provides the nvim and
nlua0 the target build runs to generate sources. It recommends the
grammars upstream bundles (c, lua, markdown, query, vim, vimdoc), and
provides vi and vim through update-alternatives with priority 95, below
vim and above vim-tiny.

0001-cmake-allow-omitting-build-paths-from-the-binary.patch keeps the
compiler flags and the build directory out of the binary for
reproducibility; Upstream-Status: Inappropriate [OE specific].

Tested on intel-corei7-64: nvim runs, :help is highlighted with
tree-sitter, and all grammars and queries load.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...omitting-build-paths-from-the-binary.patch | 43 ++++++++++++
 .../recipes-support/neovim/neovim_0.12.6.bb   | 66 +++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta-oe/recipes-support/neovim/neovim/0001-cmake-allo=
w-omitting-build-paths-from-the-binary.patch
 create mode 100644 meta-oe/recipes-support/neovim/neovim_0.12.6.bb

diff --git a/meta-oe/recipes-support/neovim/neovim/0001-cmake-allow-omitt=
ing-build-paths-from-the-binary.patch b/meta-oe/recipes-support/neovim/ne=
ovim/0001-cmake-allow-omitting-build-paths-from-the-binary.patch
new file mode 100644
index 0000000000..ec15ef1b78
--- /dev/null
+++ b/meta-oe/recipes-support/neovim/neovim/0001-cmake-allow-omitting-bui=
ld-paths-from-the-binary.patch
@@ -0,0 +1,43 @@
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 19 Sep 2026 18:10:00 +0200
+Subject: [PATCH] cmake: allow omitting build paths from the binary
+
+The ":version" output embeds the full compiler path, the sysroot and all
+include directories, and VTERM_TEST_FILE embeds the build directory. Bot=
h
+end up in the installed nvim binary and make it non-reproducible.
+
+Add NVIM_OMIT_VERSION_CFLAGS to drop the compile flags from the version
+string and let VTERM_TEST_FILE be overridden from the command line.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ CMakeLists.txt              | 4 +++-
+ cmake.config/CMakeLists.txt | 3 +++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -51,7 +51,9 @@
+ #----------------------------------------------------------------------=
---------
+ set(FUNCS_DATA ${PROJECT_BINARY_DIR}/funcs_data.mpack)
+ set(TOUCHES_DIR ${PROJECT_BINARY_DIR}/touches)
+-set(VTERM_TEST_FILE ${PROJECT_BINARY_DIR}/test/vterm_test_output)
++if(NOT VTERM_TEST_FILE)
++  set(VTERM_TEST_FILE ${PROJECT_BINARY_DIR}/test/vterm_test_output)
++endif()
+=20
+ file(GLOB DOCFILES CONFIGURE_DEPENDS ${PROJECT_SOURCE_DIR}/runtime/doc/=
*.txt)
+=20
+--- a/cmake.config/CMakeLists.txt
++++ b/cmake.config/CMakeLists.txt
+@@ -184,6 +184,9 @@
+ append_target_expression(PREFIX "-I" PROPERTY INCLUDE_DIRECTORIES)
+ string(REPLACE ";" " " VERSION_STRING "${VERSION_STRING}")
+ string(REPLACE "  " " " VERSION_STRING "${VERSION_STRING}")
++if(NVIM_OMIT_VERSION_CFLAGS)
++  set(VERSION_STRING "")
++endif()
+=20
+ configure_file(versiondef.h.in auto/versiondef.h.gen)
+=20
diff --git a/meta-oe/recipes-support/neovim/neovim_0.12.6.bb b/meta-oe/re=
cipes-support/neovim/neovim_0.12.6.bb
new file mode 100644
index 0000000000..e8f7e22e08
--- /dev/null
+++ b/meta-oe/recipes-support/neovim/neovim_0.12.6.bb
@@ -0,0 +1,66 @@
+SUMMARY =3D "Vim-fork focused on extensibility and usability"
+HOMEPAGE =3D "https://neovim.io"
+LICENSE =3D "Apache-2.0 AND Vim"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D05b485c2880cb0b3d7dc27f07=
456ace1"
+
+DEPENDS =3D " \
+    luajit \
+    luajit-native \
+    utf8proc \
+    libuv \
+    luv \
+    lpeg \
+    libtreesitter \
+"
+DEPENDS:append:class-target =3D " neovim-native"
+
+SRC_URI =3D " \
+    git://github.com/neovim/neovim.git;protocol=3Dhttps;branch=3Drelease=
-0.12;tag=3Dv${PV} \
+    file://0001-cmake-allow-omitting-build-paths-from-the-binary.patch \
+"
+SRCREV =3D "779c36969e31080503be2dfccbcc3f999e289606"
+
+inherit cmake pkgconfig gettext mime-xdg update-alternatives
+
+EXTRA_OECMAKE =3D " \
+    -DENABLE_UNIBILIUM=3DOFF \
+    -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+    -DNVIM_OMIT_VERSION_CFLAGS=3DON \
+    -DVTERM_TEST_FILE=3D/tmp/nvim_vterm_test_output \
+"
+EXTRA_OECMAKE:append:class-native =3D " -DICONV_INCLUDE_DIR=3D${STAGING_=
INCDIR_NATIVE}"
+EXTRA_OECMAKE:append:class-target =3D " \
+    -DNVIM_HOST_PRG=3D${STAGING_BINDIR_NATIVE}/nvim \
+    -DNLUA0_HOST_PRG=3D${STAGING_LIBDIR_NATIVE}/nvim/libnlua0.so \
+"
+
+# The target build runs the native nvim and its nlua0 module to generate
+# sources and runtime files; upstream does not install nlua0.
+do_install:append:class-native() {
+    install -d ${D}${libdir}/nvim
+    install -m 0755 ${B}/lib/libnlua0.so ${D}${libdir}/nvim/libnlua0.so
+}
+
+FILES:${PN} +=3D " \
+    ${libdir}/nvim \
+    ${datadir}/nvim \
+    ${datadir}/applications \
+    ${datadir}/icons \
+"
+
+ALTERNATIVE:${PN} =3D "vi vim"
+ALTERNATIVE_TARGET =3D "${bindir}/nvim"
+ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
+ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
+ALTERNATIVE_PRIORITY =3D "95"
+
+RRECOMMENDS:${PN}:class-target +=3D " \
+    tree-sitter-c \
+    tree-sitter-lua \
+    tree-sitter-markdown \
+    tree-sitter-query \
+    tree-sitter-vim \
+    tree-sitter-vimdoc \
+"
+
+BBCLASSEXTEND =3D "native"
--=20
2.56.0


Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B443C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 19:31:53 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1702.1705951909096799085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 11:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 8E9BE1EA79
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 20:31:17 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.62]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rS00q-0XEiVl0; Mon, 22 Jan 2024 20:31:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] lua: add recipe for lua-5.2
Date: Mon, 22 Jan 2024 20:31:07 +0100
Message-ID: <20240122193109.3041355-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705951876-0CA7E850-63DD6BAC/0/0 CLEAN NORMAL
X-TOI-MSGID: 6f60f0d3-8ea1-4c64-a654-c27f617905a0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 19:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108374

mpv only supports lua-5.2 and luajit. Add lua-5.2 to unblock gui build
for platforms that dont support luajit

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../lua/lua-5.2/Makefile-build-so.patch       | 82 +++++++++++++++++++
 .../recipes-devtools/lua/lua-5.2/lua.pc.in    | 10 +++
 .../recipes-devtools/lua/lua-5.2/run-ptest    | 19 +++++
 meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb | 67 +++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-s=
o.patch
 create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
 create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
 create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb

diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch=
 b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
new file mode 100644
index 000000000..343d1ddd6
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
@@ -0,0 +1,82 @@
+Upstream-Status: Inappropriate [Upstream doesn't support so libs]
+
+diff -ru lua-5.2.1/Makefile lua-5.2.1.new/Makefile
+--- a/Makefile	2012-05-17 16:05:54.000000000 +0200
++++ b/Makefile	2012-09-12 22:39:07.162748096 +0200
+@@ -38,16 +38,16 @@
+ # Convenience platforms targets.
+ PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix solaris
+=20
++# Lua version and release.
++V=3D 5.2
++R=3D $V.3
++
+ # What to install.
+ TO_BIN=3D lua luac
+ TO_INC=3D lua.h luaconf.h lualib.h lauxlib.h lua.hpp
+-TO_LIB=3D liblua.a
++TO_LIB=3D liblua.a liblua.so.$(R)
+ TO_MAN=3D lua.1 luac.1
+=20
+-# Lua version and release.
+-V=3D 5.2
+-R=3D $V.3
+-
+ # Targets start here.
+ all:	$(PLAT)
+=20
+@@ -63,7 +63,8 @@
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
+-
++	ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so.$(V)
++	ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so
+ uninstall:
+ 	cd src && cd $(INSTALL_BIN) && $(RM) $(TO_BIN)
+ 	cd src && cd $(INSTALL_INC) && $(RM) $(TO_INC)
+diff -ru lua-5.2.1/src/luaconf.h lua-5.2.1.new/src/luaconf.h
+--- lua-5.2.1/src/luaconf.h	2012-05-11 16:14:42.000000000 +0200
++++ lua-5.2.1.new/src/luaconf.h	2012-09-12 22:40:27.986622772 +0200
+@@ -100,7 +100,7 @@
+ #else			/* }{ */
+=20
+ #define LUA_VDIR	LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
+-#define LUA_ROOT	"/usr/local/"
++#define LUA_ROOT	"/usr"
+ #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR
+ #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR
+ #define LUA_PATH_DEFAULT  \
+diff -ru lua-5.2.1/src/Makefile lua-5.2.1.new/src/Makefile
+--- lua-5.2.1/src/Makefile	2012-03-09 17:32:16.000000000 +0100
++++ lua-5.2.1.new/src/Makefile	2012-09-12 22:38:08.591386896 +0200
+@@ -29,6 +29,7 @@
+ PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix solaris
+=20
+ LUA_A=3D	liblua.a
++LUA_SO=3D liblua.so
+ CORE_O=3D	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o =
llex.o \
+ 	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
+ 	ltm.o lundump.o lvm.o lzio.o
+@@ -43,7 +44,7 @@
+ LUAC_O=3D	luac.o
+=20
+ ALL_O=3D $(BASE_O) $(LUA_O) $(LUAC_O)
+-ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T)
++ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T) $(LUA_SO)
+ ALL_A=3D $(LUA_A)
+=20
+ # Targets start here.
+@@ -59,6 +60,12 @@
+ 	$(AR) $@ $(BASE_O)
+ 	$(RANLIB) $@
+=20
++$(LUA_SO): $(CORE_O) $(LIB_O)
++	$(CC) -shared -ldl -Wl,-soname,$(LUA_SO).5.2 -o $@.5.2.3 $? -lm $(MYLD=
FLAGS)
++
++
++
++
+ $(LUA_T): $(LUA_O) $(LUA_A)
+ 	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
+=20
diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in b/meta-oe/rec=
ipes-devtools/lua/lua-5.2/lua.pc.in
new file mode 100644
index 000000000..c26775fa7
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
@@ -0,0 +1,10 @@
+libdir=3D@LIBDIR@
+includedir=3D@INCLUDEDIR@
+
+Name: Lua
+Description: Lua language engine
+Version: @VERSION@
+Requires:
+Libs: -L${libdir} -llua -lm -ldl
+Cflags: -I${includedir}
+
diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest b/meta-oe/rec=
ipes-devtools/lua/lua-5.2/run-ptest
new file mode 100644
index 000000000..8e085e1af
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+cd test
+lua -e"_U=3Dtrue" all.lua > lua-test.tmp
+
+echo "--- test output ---"
+cat lua-test.tmp
+echo ""
+echo ""
+echo "--- ptest result ---"
+
+grep "final OK \!\!\!" lua-test.tmp > /dev/null
+if [ $? -eq 0 ]; then
+   echo "PASS: lua"
+else
+   echo "FAIL: lua"
+fi
+
+rm -f lua-test.tmp
diff --git a/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb b/meta-oe/reci=
pes-devtools/lua/lua-5.2_5.2.3.bb
new file mode 100644
index 000000000..58f716337
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
@@ -0,0 +1,67 @@
+SUMMARY =3D "Lua is a powerful light-weight programming language designe=
d \
+for extending applications."
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D381;endline=3D3=
99;md5=3D07ddfddb01fa4ed9f2fb5e8eeae817a4"
+HOMEPAGE =3D "http://www.lua.org/"
+
+SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc \
+           file://lua.pc.in \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.=
lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest file:/=
/run-ptest ', '', d)} \
+           file://Makefile-build-so.patch \
+           "
+
+# if no test suite matches PV release of Lua exactly, download the suite=
 for the closest Lua release.
+PV_testsuites =3D "5.2.2"
+
+SRC_URI[tarballsrc.sha256sum] =3D "13c2fb97961381f7d06d5b5cea55b743c1638=
00896fd5c5e2356201d3619002d"
+SRC_URI[tarballtest.sha256sum] =3D "07c1071c66d9cb4dc80200ed430fc21ebbbc=
cf1f55148b87eb0b9522932e4eb6"
+
+S =3D "${WORKDIR}/lua-${PV}"
+
+DEPENDS =3D "readline"
+inherit pkgconfig binconfig ptest
+
+TARGET_CC_ARCH +=3D " -fPIC  ${LDFLAGS}"
+EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -fPIC' MYLDFL=
AGS=3D'${LDFLAGS}'"
+
+do_configure:prepend() {
+    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
+    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
+}
+
+do_compile () {
+    oe_runmake linux
+}
+
+do_install () {
+    oe_runmake \
+        'INSTALL_TOP=3D${D}${prefix}' \
+        'INSTALL_BIN=3D${D}${bindir}' \
+        'INSTALL_INC=3D${D}${includedir}/' \
+        'INSTALL_MAN=3D${D}${mandir}/man1' \
+        'INSTALL_SHARE=3D${D}${datadir}' \
+        'INSTALL_LIB=3D${D}${libdir}' \
+        'INSTALL_CMOD=3D${D}${libdir}' \
+        install
+    install -d ${D}${libdir}/pkgconfig  ${D}${datadir}/doc/lua
+
+    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@=
#${includedir}# ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
+    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
+    install -m 0644 doc/*.{gif,png,css,html} ${D}${datadir}/doc/lua
+    rm -rf ${D}${datadir}/lua
+}
+
+do_install_ptest () {
+        cp -R --no-dereference --preserve=3Dmode,links -v ${WORKDIR}/lua=
-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
+}
+
+do_install_ptest:append:libc-musl () {
+        # locale tests does not work on musl, due to limited locale impl=
ementation
+        # https://wiki.musl-libc.org/open-issues.html#Locale-limitations
+        sed -i -e 's|os.setlocale("pt_BR") or os.setlocale("ptb")|false|=
g' ${D}${PTEST_PATH}/test/literals.lua
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS =3D "${PN}-dev:${includedir}/luaconf.h"
--=20
2.43.0



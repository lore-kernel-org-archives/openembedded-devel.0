Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 806A37D913
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 06:13:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3B6DgZn006776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 23:13:43 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 10 Apr 2019 23:13:42 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Apr 2019 23:13:42 -0700
Message-ID: <20190411061342.65548-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lua: upgrade from v5.3.4 to v5.3.5
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
X-List-Received-Date: Thu, 11 Apr 2019 06:13:42 -0000
Content-Type: text/plain

The v5.3.5 release covers CVE-2019-6706 which is vulnerable.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb | 59 -----------------------------
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb | 63 +++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lua/lua_5.3.4.bb
 create mode 100644 meta-oe/recipes-devtools/lua/lua_5.3.5.bb

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
deleted file mode 100644
index 8f4e8fe..0000000
--- a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-DESCRIPTION = "Lua is a powerful light-weight programming language designed \
-for extending applications."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=60aa5cfdbd40086501778d9b6ebf29ee"
-HOMEPAGE = "http://www.lua.org/"
-
-DEPENDS = "readline"
-SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
-           file://lua.pc.in \
-           "
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
-           'http://www.lua.org/tests/lua-${PV}-tests.tar.gz;name=tarballtest \
-            file://run-ptest \
-           ', '', d)}"
-
-SRC_URI[tarballsrc.md5sum] = "53a9c68bcc0eda58bdc2095ad5cdfc63"
-SRC_URI[tarballsrc.sha256sum] = "f681aa518233bc407e23acf0f5887c884f17436f000d453b2491a9f11a52400c"
-SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
-SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
-
-inherit pkgconfig binconfig ptest
-
-UCLIBC_PATCHES += "file://uclibc-pthread.patch"
-SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
-
-TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
-EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLDFLAGS='${LDFLAGS}'"
-
-do_configure_prepend() {
-    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
-}
-
-do_compile () {
-    oe_runmake linux
-}
-
-do_install () {
-    oe_runmake \
-        'INSTALL_TOP=${D}${prefix}' \
-        'INSTALL_BIN=${D}${bindir}' \
-        'INSTALL_INC=${D}${includedir}/' \
-        'INSTALL_MAN=${D}${mandir}/man1' \
-        'INSTALL_SHARE=${D}${datadir}/lua' \
-        'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
-        install
-    install -d ${D}${libdir}/pkgconfig
-
-    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
-    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.3
-    rmdir ${D}${datadir}/lua
-}
-
-do_install_ptest () {
-        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
new file mode 100644
index 0000000..265e251
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "Lua is a powerful light-weight programming language designed \
+for extending applications."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=60aa5cfdbd40086501778d9b6ebf29ee"
+HOMEPAGE = "http://www.lua.org/"
+
+DEPENDS = "readline"
+SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
+           file://lua.pc.in \
+           "
+
+# if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
+PV_testsuites = "5.3.4"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
+           'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest \
+            file://run-ptest \
+           ', '', d)}"
+
+SRC_URI[tarballsrc.md5sum] = "4f4b4f323fd3514a68e0ab3da8ce3455"
+SRC_URI[tarballsrc.sha256sum] = "0c2eed3f960446e1a3e4b9a1ca2f3ff893b6ce41942cf54d5dd59ab4b3b058ac"
+SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
+SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
+
+inherit pkgconfig binconfig ptest
+
+UCLIBC_PATCHES += "file://uclibc-pthread.patch"
+SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
+
+TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
+EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLDFLAGS='${LDFLAGS}'"
+
+do_configure_prepend() {
+    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
+}
+
+do_compile () {
+    oe_runmake linux
+}
+
+do_install () {
+    oe_runmake \
+        'INSTALL_TOP=${D}${prefix}' \
+        'INSTALL_BIN=${D}${bindir}' \
+        'INSTALL_INC=${D}${includedir}/' \
+        'INSTALL_MAN=${D}${mandir}/man1' \
+        'INSTALL_SHARE=${D}${datadir}/lua' \
+        'INSTALL_LIB=${D}${libdir}' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
+        install
+    install -d ${D}${libdir}/pkgconfig
+
+    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
+    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
+    rmdir ${D}${datadir}/lua/5.3
+    rmdir ${D}${datadir}/lua
+}
+
+do_install_ptest () {
+        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1



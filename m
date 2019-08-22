Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 94B007F295
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 440161038D5;
	Thu, 22 Aug 2019 17:17:29 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:16 +0200
Message-Id: <20190822171723.18657-11-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 10/17] evolution-data-server: Fix package gobject-introspection support.
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
X-List-Received-Date: Thu, 22 Aug 2019 17:17:29 -0000
Content-Transfer-Encoding: 8bit

It has been broken since the pacakge was migrated from autotools to
cmake. Make it usable once again.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...ntrispection-support-to-work-with-OE.patch | 75 +++++++++++++++++++
 .../eds/evolution-data-server_3.32.4.bb       | 21 ++++--
 2 files changed, 90 insertions(+), 6 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
new file mode 100644
index 000000000..c00082a2c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
@@ -0,0 +1,75 @@
+From d84f4fd68441e934b37be2a6917abad52c5d1bda Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <tworaz@tworaz.net>
+Date: Fri, 16 Aug 2019 21:22:16 +0200
+Subject: [PATCH 7/7] Modify gobject-intrispection support to work with OE.
+
+1. Use tools provided by the recipe sysroot instread of host ones.
+2. Make sure all the required dirs make it into g-ir-scanner via
+   LDFLAGS.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
+---
+ cmake/modules/GObjectIntrospection.cmake | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/modules/GObjectIntrospection.cmake b/cmake/modules/GObjectIntrospection.cmake
+index 5be5042..67c035a 100644
+--- a/cmake/modules/GObjectIntrospection.cmake
++++ b/cmake/modules/GObjectIntrospection.cmake
+@@ -20,6 +20,9 @@ if(ENABLE_INTROSPECTION)
+ 	pkg_check_variable(G_IR_SCANNER gobject-introspection-1.0 g_ir_scanner)
+ 	pkg_check_variable(G_IR_COMPILER gobject-introspection-1.0 g_ir_compiler)
+ 
++	string(CONCAT G_IR_SCANNER $ENV{PKG_CONFIG_SYSROOT_DIR} "${G_IR_SCANNER}")
++	string(CONCAT G_IR_COMPILER $ENV{PKG_CONFIG_SYSROOT_DIR} "${G_IR_COMPILER}")
++
+ 	if(NOT G_IR_SCANNER)
+ 		message(FATAL_ERROR "g-ir-scanner not provided by gobject-introspection-1.0, you can disable GObject introspection by -DENABLE_INTROSPECTION=OFF")
+ 	endif(NOT G_IR_SCANNER)
+@@ -116,7 +119,7 @@ macro(gir_add_introspection gir)
+ 		file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${_gir_name}_files "${_gir_files}")
+ 
+ 		add_custom_command(
+-			COMMAND ${CMAKE_COMMAND} -E env "CC='${CMAKE_C_COMPILER}'" LDFLAGS=
++			COMMAND ${CMAKE_COMMAND} -E env "CC='${CMAKE_C_COMPILER}'" LDFLAGS=${INTROSPECTION_SCANNER_LDFLAGS}
+ 				${INTROSPECTION_SCANNER_ENV}
+ 				${G_IR_SCANNER}
+ 				${INTROSPECTION_SCANNER_ARGS}
+@@ -186,6 +189,7 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
+ 	unset(INTROSPECTION_SCANNER_ARGS)
+ 	unset(INTROSPECTION_SCANNER_ENV)
+ 	unset(INTROSPECTION_COMPILER_ARGS)
++	unset(INTROSPECTION_SCANNER_LDFLAGS)
+ 
+ 	set(${gir_vars_prefix} ${gir_library})
+ 	set(${gir_vars_prefix}_SCANNERFLAGS "--warn-all")
+@@ -223,12 +227,12 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
+ 		--add-include-path=${CMAKE_CURRENT_SOURCE_DIR}
+ 		--library-path=${CMAKE_BINARY_DIR}
+ 		--library-path=${CMAKE_BINARY_DIR}/src
++		--library-path=${CMAKE_BINARY_DIR}/src/private
+ 		--library-path=${CMAKE_CURRENT_BINARY_DIR}
+ 		${_gir_extra_libdirs}
+ 		${_gir_identifies_prefixes}
+ 		${_gir_deps}
+ 		--add-include-path=${SHARE_INSTALL_PREFIX}/gir-1.0
+-		--library-path=${LIB_INSTALL_DIR}
+ 		${_extra_library_path}
+ 		--pkg-export ${pkg_export_prefix}-${gir_library_version}
+ 		--c-include=${c_include}
+@@ -279,6 +283,10 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
+ 		)
+ 	endif(UNIX)
+ 
++	_gir_list_prefix(_gir_scanner_ldflags ${gir_extra_libdirs_var} "-Wl,-rpath-link=")
++	string(REPLACE ";" " " _gir_scanner_ldflags "${_gir_scanner_ldflags}")
++	set(INTROSPECTION_SCANNER_LDFLAGS "${_gir_scanner_ldflags}")
++
+ 	set(INTROSPECTION_SCANNER_ENV
+ 		${_loader_library_path_var}="${_extra_loader_library_path_native}"
+ 	)
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 97e4dd5b2..b1e177ff9 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
            file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
+           file://0007-Modify-gobject-intrispection-support-to-work-with-OE.patch \
            file://iconv-detect.h \
            "
 SRC_URI[archive.md5sum] = "57820f3f88fc554e1a58665a52e12c05"
@@ -37,10 +38,11 @@ EXTRA_OECMAKE = " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'introspection', '', d)}"
 PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
 PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkitgtk"
 PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
+PACKAGECONFIG[introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
@@ -53,7 +55,6 @@ do_configure_append () {
 }
 
 do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
     # CMake does not support building native binaries when cross compiling. As result
     # it always cross compiles them for the target and then aborts when they fail to run.
     # To work around this manually build required tools and patch cmake targets to use
@@ -88,21 +89,27 @@ RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
 
 FILES_libcamel = "${libdir}/libcamel-*.so.* \
                   ${libdir}/libcamel-provider-*.so.* \
+                  ${libdir}/girepository-*/Camel-*.typelib \
                   ${libdir}/evolution-data-server*/camel-providers/*.so \
                   ${libdir}/evolution-data-server*/camel-providers/*.urls"
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
-                      ${includedir}/evolution-data-server*/camel"
+                      ${includedir}/evolution-data-server*/camel \
+                      ${datadir}/gir-*/Camel-*.gir"
 
-FILES_libebook = "${libdir}/libebook-*.so.*"
+FILES_libebook = "${libdir}/libebook-*.so.* \
+                  ${libdir}/girepository-*/EBook-*.typelib"
 FILES_libebook-dev = "${libdir}/libebook-1.2.so \
                       ${libdir}/pkgconfig/libebook-*.pc \
+                      ${datadir}/gir-*/EBook-*.gir \
                       ${includedir}/evolution-data-server*/libebook/*.h"
 RRECOMMENDS_libebook = "libedata-book"
 
-FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.*"
+FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.* \
+                           ${libdir}/girepository-*/EBookContacts-*.typelib"
 FILES_libebook-contacts-dev = "${libdir}/libebook-contacts-*.so \
                                ${libdir}/pkgconfig/libebook-contacts-*.pc \
+                               ${datadir}/gir-*/EBookContacts-*.gir \
                                ${includedir}/evolution-data-server*/libebook-contacts/*.h"
 
 FILES_libecal = "${libdir}/libecal-*.so.* \
@@ -129,7 +136,8 @@ FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
                           ${libdir}/pkgconfig/libedata-cal-*.pc \
                           ${includedir}/evolution-data-server-*/libedata-cal"
 
-FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
+FILES_libedataserver = "${libdir}/libedataserver-*.so.* \
+                        ${libdir}/girepository-*/EDataServer-*.typelib"
 FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
                             ${libdir}/pkgconfig/libedataserver-*.pc \
                             ${includedir}/evolution-data-server-*/libedataserver/*.h"
@@ -137,4 +145,5 @@ FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
 FILES_libedataserverui = "${libdir}/libedataserverui-*.so.*"
 FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
                               ${libdir}/pkgconfig/libedataserverui-*.pc \
+                              ${datadir}/gir-*/EDataServerUI-*.gir \
                               ${includedir}/evolution-data-server-*/libedataserverui/*.h"
-- 
2.21.0



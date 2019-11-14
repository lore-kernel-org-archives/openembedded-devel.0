Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D94B7F9B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:43 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i12so8019999wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2iKCcsBKoFz0SljzZwwCizqSpxBw/QYw0INqy9KDlDk=;
	b=ONdo56Fju0bQzuArvHwwSMev4P3SJx9y9LqOrBAr/yuwpj+GO/3WU8JVq1xhnumuAH
	cbme+TRmpehZPKHPlFU6MEFlhCSiTCMdGa1B3O16U/QTpZG1lDlqILsph0S+Wh0pP2Ht
	GxzSgoySeuBFb58Yk/9uClAfcXYOwMnMSRxYC2DJF6l4dSEXt10USEaLAIm4NOLIEDIb
	RPBZ9kpT9MKR1MvYXMpcXKVMYpFHN486/9n2MNJENRROsAckIm8aMM5fVll8o48DZVD0
	agdfCkkqMv8IpI1DyopTIpqjTroJgJ7jGOkL4M0adS/DoMCdIeL5g3xUjoSEt4etfU6H
	TaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2iKCcsBKoFz0SljzZwwCizqSpxBw/QYw0INqy9KDlDk=;
	b=hinL152rM7sMwZfCA/aDvKyROpKB8YgOJSWKVfedcxxYBn7uDQp/X0kyudnWXLHgSk
	s+QIz1wIzTSwXmBPp1lhHkvdEoIHRt/6XQadsU4dw1OeKXWq5soj+FdF2f92Wo2XTODp
	zpCPqdW2edBPzjKkl1XSkmZpM/iS4Aq/lW7jgtJfqFN2PMcquf09axyBcTyw5qQQihmV
	CnaDpw0e2ekGwtMD9dZF2q5+db6A60CUfR6k0u6BUAiQ4vmrPAm7/GaVAmLCo3ljv255
	w+aKfEyOAIzGeNNCfKyWkEt8gbUk3XY2rg9gilpOEaW7UNt7inPkTyQkVE/svEPurRw/
	n0Rg==
X-Gm-Message-State: APjAAAWVp2/IG9TbrLlDlb6XK5+Mouue1eq75GPaW6UbOFMgYHLO70j/
	KvD/2Tv397guS3fusam7akLuuJ4M
X-Google-Smtp-Source: APXvYqyzfP+bOgr1ZHezOAaQDsS62XM0G8GUYbknV7Tna03Ze8BNBCpQXTM2VenWbAZ5lhFIa5cYFg==
X-Received: by 2002:adf:f6d1:: with SMTP id y17mr9735210wrp.255.1573760983108; 
	Thu, 14 Nov 2019 11:49:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:18 +0100
Message-Id: <20191114194930.2786-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/16] evolution-data-server: upgrade 3.26.6 -> 3.34.1 and rework
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* a native variant had to be introduced for code-generator tools
* gobject-introspection builds theoretically :) Unfortunataelly qemu runs
  with 100% CPU load and never returns -> disable introspection for now
* add PACKAGECONFIGs for new dependencies - disabled by default
* give up fine grained packaging: It was broken over the years completely
  and nobody seemed to take care.
* ICU-patch does not apply anymore and it seems upstream has fixed issues
  with ICU
* add upstream-version-is-even to inherit
* rename folder containing recipe
* get rid of gconf dependency

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...for-address-localization-when-LC_ADD.patch |  33 -----
 ...-to-LDFLAGS-when-linking-libphonenum.patch |  36 ------
 ...ntrispection-support-to-work-with-OE.patch |  75 ------------
 .../eds/evolution-data-server_3.32.4.bb       | 113 ------------------
 .../evolution-data-server-native.bb           |  23 ++++
 .../evolution-data-server.bb                  |  70 +++++++++++
 .../evolution-data-server.inc                 |  15 +++
 ...keLists.txt-Remove-TRY_RUN-for-iconv.patch |  28 +++--
 ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch |   0
 ...the-Novell-sample-contact-with-somet.patch |   0
 .../0004-call-native-helpers.patch}           |  33 +++--
 .../evolution-data-server/iconv-detect.h      |   0
 12 files changed, 137 insertions(+), 289 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch (60%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch (100%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch (100%)
 rename meta-gnome/recipes-gnome/{eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch => evolution-data-server/evolution-data-server/0004-call-native-helpers.patch} (52%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/iconv-detect.h (100%)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
deleted file mode 100644
index 55ab5a7fc..000000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 95425206e7317e59b7ca06d7f838ad357cdd200c Mon Sep 17 00:00:00 2001
-From: Piotr Tworek <tworaz@tworaz.net>
-Date: Wed, 14 Aug 2019 00:31:54 +0200
-Subject: [PATCH 5/7] Use LC_MESSAGES for address localization when LC_ADDRESS
- is not available.
-
-Musl does not define LC_ADDRESS unfortunately.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
----
- src/addressbook/libebook-contacts/e-phone-number-private.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/addressbook/libebook-contacts/e-phone-number-private.cpp b/src/addressbook/libebook-contacts/e-phone-number-private.cpp
-index 4c5aebb..9abcebd 100644
---- a/src/addressbook/libebook-contacts/e-phone-number-private.cpp
-+++ b/src/addressbook/libebook-contacts/e-phone-number-private.cpp
-@@ -36,6 +36,10 @@
- #include <phonenumbers/logger.h>
- #include <phonenumbers/phonenumberutil.h>
- 
-+#ifndef LC_ADDRESS
-+#define LC_ADDRESS LC_MESSAGES
-+#endif
-+
- using i18n::phonenumbers::PhoneNumber;
- using i18n::phonenumbers::PhoneNumberUtil;
- 
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
deleted file mode 100644
index c0c1427fd..000000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fb9164bbca5b425f1cf1bb3cac51d06afe81938a Mon Sep 17 00:00:00 2001
-From: Piotr Tworek <tworaz@tworaz.net>
-Date: Wed, 14 Aug 2019 00:47:59 +0200
-Subject: [PATCH 6/7] Dont add /usr/lib to LDFLAGS when linking libphonenumber.
-
-This will refer to host lib dir which is not what we want.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
----
- cmake/modules/FindPhonenumber.cmake | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/cmake/modules/FindPhonenumber.cmake b/cmake/modules/FindPhonenumber.cmake
-index 04d1056..70c0c41 100644
---- a/cmake/modules/FindPhonenumber.cmake
-+++ b/cmake/modules/FindPhonenumber.cmake
-@@ -37,12 +37,10 @@ string(TOUPPER "${WITH_PHONENUMBER}" optupper)
- if(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINARY_DIR}"))
- 	set(WITH_PHONENUMBER "ON")
- 	set(PHONENUMBER_INCLUDE_DIRS "${INCLUDE_INSTALL_DIR}")
--	set(PHONENUMBER_LIB_DIRS ${LIB_INSTALL_DIR})
--	set(PHONENUMBER_LDFLAGS -L${PHONENUMBER_LIB_DIRS} ${PHONENUMBER_LDFLAGS})
-+	set(PHONENUMBER_LDFLAGS  ${PHONENUMBER_LDFLAGS})
- else(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINARY_DIR}"))
- 	set(PHONENUMBER_INCLUDE_DIRS "${WITH_PHONENUMBER}/include")
--	set(PHONENUMBER_LIB_DIRS ${WITH_PHONENUMBER}/lib${LIB_SUFFIX})
--	set(PHONENUMBER_LDFLAGS -L${PHONENUMBER_LIB_DIRS} ${PHONENUMBER_LDFLAGS})
-+	set(PHONENUMBER_LDFLAGS ${PHONENUMBER_LDFLAGS})
- endif(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINARY_DIR}"))
- 
- unset(bindirlen)
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
deleted file mode 100644
index c00082a2c..000000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From d84f4fd68441e934b37be2a6917abad52c5d1bda Mon Sep 17 00:00:00 2001
-From: Piotr Tworek <tworaz@tworaz.net>
-Date: Fri, 16 Aug 2019 21:22:16 +0200
-Subject: [PATCH 7/7] Modify gobject-intrispection support to work with OE.
-
-1. Use tools provided by the recipe sysroot instread of host ones.
-2. Make sure all the required dirs make it into g-ir-scanner via
-   LDFLAGS.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
----
- cmake/modules/GObjectIntrospection.cmake | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/modules/GObjectIntrospection.cmake b/cmake/modules/GObjectIntrospection.cmake
-index 5be5042..67c035a 100644
---- a/cmake/modules/GObjectIntrospection.cmake
-+++ b/cmake/modules/GObjectIntrospection.cmake
-@@ -20,6 +20,9 @@ if(ENABLE_INTROSPECTION)
- 	pkg_check_variable(G_IR_SCANNER gobject-introspection-1.0 g_ir_scanner)
- 	pkg_check_variable(G_IR_COMPILER gobject-introspection-1.0 g_ir_compiler)
- 
-+	string(CONCAT G_IR_SCANNER $ENV{PKG_CONFIG_SYSROOT_DIR} "${G_IR_SCANNER}")
-+	string(CONCAT G_IR_COMPILER $ENV{PKG_CONFIG_SYSROOT_DIR} "${G_IR_COMPILER}")
-+
- 	if(NOT G_IR_SCANNER)
- 		message(FATAL_ERROR "g-ir-scanner not provided by gobject-introspection-1.0, you can disable GObject introspection by -DENABLE_INTROSPECTION=OFF")
- 	endif(NOT G_IR_SCANNER)
-@@ -116,7 +119,7 @@ macro(gir_add_introspection gir)
- 		file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${_gir_name}_files "${_gir_files}")
- 
- 		add_custom_command(
--			COMMAND ${CMAKE_COMMAND} -E env "CC='${CMAKE_C_COMPILER}'" LDFLAGS=
-+			COMMAND ${CMAKE_COMMAND} -E env "CC='${CMAKE_C_COMPILER}'" LDFLAGS=${INTROSPECTION_SCANNER_LDFLAGS}
- 				${INTROSPECTION_SCANNER_ENV}
- 				${G_IR_SCANNER}
- 				${INTROSPECTION_SCANNER_ARGS}
-@@ -186,6 +189,7 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
- 	unset(INTROSPECTION_SCANNER_ARGS)
- 	unset(INTROSPECTION_SCANNER_ENV)
- 	unset(INTROSPECTION_COMPILER_ARGS)
-+	unset(INTROSPECTION_SCANNER_LDFLAGS)
- 
- 	set(${gir_vars_prefix} ${gir_library})
- 	set(${gir_vars_prefix}_SCANNERFLAGS "--warn-all")
-@@ -223,12 +227,12 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
- 		--add-include-path=${CMAKE_CURRENT_SOURCE_DIR}
- 		--library-path=${CMAKE_BINARY_DIR}
- 		--library-path=${CMAKE_BINARY_DIR}/src
-+		--library-path=${CMAKE_BINARY_DIR}/src/private
- 		--library-path=${CMAKE_CURRENT_BINARY_DIR}
- 		${_gir_extra_libdirs}
- 		${_gir_identifies_prefixes}
- 		${_gir_deps}
- 		--add-include-path=${SHARE_INSTALL_PREFIX}/gir-1.0
--		--library-path=${LIB_INSTALL_DIR}
- 		${_extra_library_path}
- 		--pkg-export ${pkg_export_prefix}-${gir_library_version}
- 		--c-include=${c_include}
-@@ -279,6 +283,10 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
- 		)
- 	endif(UNIX)
- 
-+	_gir_list_prefix(_gir_scanner_ldflags ${gir_extra_libdirs_var} "-Wl,-rpath-link=")
-+	string(REPLACE ";" " " _gir_scanner_ldflags "${_gir_scanner_ldflags}")
-+	set(INTROSPECTION_SCANNER_LDFLAGS "${_gir_scanner_ldflags}")
-+
- 	set(INTROSPECTION_SCANNER_ENV
- 		${_loader_library_path_var}="${_extra_loader_library_path_native}"
- 	)
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
deleted file mode 100644
index b4174cbb0..000000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ /dev/null
@@ -1,113 +0,0 @@
-SUMMARY = "Evolution database backend server"
-HOMEPAGE = "http://www.gnome.org/projects/evolution/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
-                    file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
-                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543 \
-                    file://src/calendar/libecal/e-cal.h;endline=24;md5=e699ec3866f73f129f7a4ffffdcfc196"
-
-DEPENDS = " \
-    intltool-native gperf-native glib-2.0-native \
-    glib-2.0 gtk+3 libgnome-keyring libgdata libcanberra icu \
-    dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
-"
-
-inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative upstream-version-is-even vala
-
-SRC_URI += "file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
-            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
-            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
-            file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
-            file://0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch \
-            file://0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch \
-            file://0007-Modify-gobject-intrispection-support-to-work-with-OE.patch \
-            file://iconv-detect.h \
-           "
-SRC_URI[archive.md5sum] = "57820f3f88fc554e1a58665a52e12c05"
-SRC_URI[archive.sha256sum] = "83f67cb4b680e892b22b51bcde64c788b7ac63e92a99de401fb347e3794f4c7f"
-
-LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
-LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
-
-EXTRA_OECMAKE = " \
-    -D${LKSTRFTIME} \
-    -DSYSCONF_INSTALL_DIR=${sysconfdir} \
-    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
-"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'introspection', '', d)}"
-PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
-PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkitgtk"
-PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
-PACKAGECONFIG[goa] = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
-PACKAGECONFIG[weather] = "-DENABLE_WEATHER=ON,-DENABLE_WEATHER=OFF,libgweather"
-PACKAGECONFIG[phonenumber] = "-DWITH_PHONENUMBER=ON,-DWITH_PHONENUMBER=OFF,libphonenumber"
-PACKAGECONFIG[introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
-PACKAGECONFIG[vala] = "-DENABLE_VALA_BINDINGS=ON -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen,-DENABLE_VALA_BINDINGS=OFF"
-
-# -ldb needs this on some platforms
-LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
-
-do_configure_append () {
-    cp ${WORKDIR}/iconv-detect.h ${S}/src
-
-    # fix native perl shebang
-    sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/tools/addressbook-export/csv2vcard
-}
-
-do_compile_prepend() {
-    # CMake does not support building native binaries when cross compiling. As result
-    # it always cross compiles them for the target and then aborts when they fail to run.
-    # To work around this manually build required tools and patch cmake targets to use
-    # those native binaries we built here.
-    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${B} ${S}/src/camel/camel-gen-tables.c \
-        -o ${B}/src/camel/camel-gen-tables-native
-    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${B} $(pkg-config-native --cflags glib-2.0) \
-        ${S}/src/addressbook/libebook-contacts/gen-western-table.c \
-        -o ${B}/src/addressbook/libebook-contacts/gen-western-table-native \
-        $(pkg-config-native --libs glib-2.0)
-}
-
-
-PACKAGES =+ "libebook-contacts libebook-contacts-dev \
-             libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
-             libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
-             libedataserver libedataserver-dev \
-             libedataserverui libedataserverui-dev"
-
-FILES_${PN} =+ "${systemd_user_unitdir} \
-                ${datadir}/dbus-1 \
-                ${datadir}/evolution-data-server-*/ui/"
-RDEPENDS_${PN} += "perl"
-
-FILES_libcamel = "${libdir}/libcamel-*.so.* \
-                  ${libdir}/libcamel-provider-*.so.* \
-                  ${libdir}/girepository-*/Camel-*.typelib \
-                  ${libdir}/evolution-data-server*/camel-providers/*.so \
-                  ${libdir}/evolution-data-server*/camel-providers/*.urls"
-FILES_libebook = "${libdir}/libebook-*.so.* \
-                  ${libdir}/girepository-*/EBook-*.typelib"
-RRECOMMENDS_libebook = "libedata-book"
-
-FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.* \
-                           ${libdir}/girepository-*/EBookContacts-*.typelib"
-
-FILES_libecal = "${libdir}/libecal-*.so.*"
-RRECOMMENDS_libecal = "libedata-cal tzdata"
-
-FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
-                       ${datadir}/dbus-1/services/*.AddressBook.service \
-                       ${libdir}/libedata-book-*.so.* \
-                       ${libdir}/evolution-data-server-*/extensions/libebook*.so"
-
-FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
-                      ${datadir}/dbus-1/services/*.Calendar.service \
-                      ${libdir}/libedata-cal-*.so.* \
-                      ${libdir}/evolution-data-server-*/extensions/libecal*.so"
-
-FILES_libedataserver = "${libdir}/libedataserver-*.so.* \
-                        ${libdir}/girepository-*/EDataServer-*.typelib"
-
-FILES_libedataserverui = "${libdir}/libedataserverui-*.so.*"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
new file mode 100644
index 000000000..681a61c33
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
@@ -0,0 +1,23 @@
+require ${BPN}.inc
+
+inherit native
+
+DEPENDS = "glib-2.0-native"
+
+# build native helpers
+do_compile() {
+    cd ${S}/src/camel
+    sed -i 's:#include "evolution-data-server-config.h"::g' camel-gen-tables.c
+    ${CC} -o ${B}/camel-gen-tables camel-gen-tables.c ${CFLAGS} ${LDFLAGS}
+
+    LDFLAGS_glib=`pkg-config glib-2.0 --libs`
+    CFLAGS_glib=`pkg-config glib-2.0 --cflags`
+    cd ${S}/src/addressbook/libebook-contacts
+    sed -i 's:#include "evolution-data-server-config.h"::g' gen-western-table.c
+    ${CC} -o ${B}/gen-western-table gen-western-table.c ${CFLAGS} ${CFLAGS_glib} ${LDFLAGS} ${LDFLAGS_glib}
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${B}/* ${D}${bindir}
+}
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
new file mode 100644
index 000000000..a8bb69f00
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -0,0 +1,70 @@
+require ${BPN}.inc
+
+DEPENDS = " \
+    ${BPN}-native intltool-native gperf-native \
+    glib-2.0 gtk+3 libgdata \
+    dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
+"
+
+inherit distro_features_check cmake gtk-doc gettext gobject-introspection perlnative pythonnative
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI += " \
+    file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
+    file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
+    file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+    file://0004-call-native-helpers.patch \
+    file://iconv-detect.h \
+"
+
+LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
+LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
+
+# For arm qemu-arm runs at 100% CPU load and never returns - so disable introspection for now
+GI_DATA_ENABLED="False"
+
+EXTRA_OECMAKE = " \
+    -DSYSCONF_INSTALL_DIR=${sysconfdir} \
+    -DWITH_KRB5=OFF \
+    -DENABLE_GOA=OFF \
+    -DENABLE_UOA=OFF \
+    -DENABLE_GOOGLE_AUTH=OFF \
+    -DENABLE_WEATHER=OFF \
+    -DENABLE_INTROSPECTION=${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'ON', 'OFF', d)} \
+    -D${LKSTRFTIME} \
+    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+"
+
+PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
+PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,webkitgtk json-glib"
+
+# BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs when
+# searching for openldap-libs
+PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
+
+# -ldb needs this on some platforms
+LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
+
+do_configure_append () {
+    cp ${WORKDIR}/iconv-detect.h ${S}/src
+
+    # fix native perl shebang
+    sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/tools/addressbook-export/csv2vcard
+
+    # fix abs path for g-ir-scanner-wrapper
+    sed  -i ${B}/build.ninja \
+        -e 's: ${bindir}/g-ir-scanner-wrapper: ${STAGING_BINDIR}/g-ir-scanner-wrapper:g'
+}
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
+}
+
+FILES_${PN} =+ " \
+    ${datadir}/dbus-1 \
+    ${datadir}/evolution-data-server-*/ui/ \
+    ${systemd_user_unitdir} \
+"
+
+RDEPENDS_${PN} += "perl"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
new file mode 100644
index 000000000..2e5176ce7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Evolution database backend server"
+HOMEPAGE = "http://www.gnome.org/projects/evolution/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2 & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
+                    file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
+                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543"
+
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "d1701875bbac80d6d62e9acfc6c43bea"
+SRC_URI[archive.sha256sum] = "6ff56ba04cb639e627fe9d6e0ada106a10cadd68a0d53b8ec72b4e285df53abe"
+PV = "3.34.1"
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
similarity index 60%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
index cc9dca4ea..e8c6d6a76 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
@@ -1,7 +1,7 @@
-From e32075119803f9fffbba01a31083e416cb213011 Mon Sep 17 00:00:00 2001
+From 131b88a81aba3d72d566bc8a9d968941a98e0007 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Tue, 19 Dec 2017 16:37:20 +0100
-Subject: [PATCH 1/7] CMakeLists.txt: Remove TRY_RUN for iconv
+Date: Sun, 31 Mar 2019 18:11:55 +0200
+Subject: [PATCH] CMakeLists.txt: Remove TRY_RUN for iconv
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,22 +13,24 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- CMakeLists.txt | 6 ------
- 1 file changed, 6 deletions(-)
+ CMakeLists.txt | 11 -----------
+ 1 file changed, 11 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9d72db..ed99904 100644
+index 1672daf..0b3e4e0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -526,15 +526,9 @@ endif(NOT HAVE_ICONV)
+@@ -524,17 +524,6 @@ if(NOT HAVE_ICONV)
+ 	message(FATAL_ERROR "You need to install a working iconv implementation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
+ endif(NOT HAVE_ICONV)
  
- set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
- file(TO_NATIVE_PATH "${CMAKE_BINARY_DIR}/" _binary_dir_with_separator)
+-set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
+-file(TO_NATIVE_PATH "${CMAKE_BINARY_DIR}/" _binary_dir_with_separator)
 -CHECK_C_SOURCE_RUNS("#define ICONV_DETECT_BUILD_DIR \"${_binary_dir_with_separator}\"
 -		     #include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _correct_iconv)
- unset(_binary_dir_with_separator)
- unset(CMAKE_REQUIRED_LIBRARIES)
- 
+-unset(_binary_dir_with_separator)
+-unset(CMAKE_REQUIRED_LIBRARIES)
+-
 -if(NOT _correct_iconv)
 -	message(FATAL_ERROR "You need to install a working iconv implementation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
 -endif(NOT _correct_iconv)
@@ -37,5 +39,5 @@ index f9d72db..ed99904 100644
  # Backtraces for debugging
  # ******************************
 -- 
-2.21.0
+2.20.1
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
similarity index 52%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch
rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
index 67023df2c..e320f6342 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
@@ -1,26 +1,21 @@
-From 30bd4ae3badb152c9f81c6d34014c586fa0cc825 Mon Sep 17 00:00:00 2001
-From: Piotr Tworek <tworaz@tworaz.net>
-Date: Mon, 12 Aug 2019 14:13:52 +0200
-Subject: [PATCH 4/7] Add native suffix to exacutables produced and run during
- build process.
+From 9c375e3fcf8ff778a5010a07a7da4b6a58adec7c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 31 Mar 2019 19:11:31 +0200
+Subject: [PATCH] call native helpers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-CMake can't build tools for the host system when cross compiling. As
-result eds currently fails to build in OE due to some programs being
-cross compiled for the target and run on the host. To work around this
-limitation modify existing targets using build time generated binaries
-to invoke binaries suffixed with -native. We can inject such binaries
-into expected locations prior to invoking ninja in do_compile.
+Upstream-Status: Inappropriate[oe-specific]
 
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  src/addressbook/libebook-contacts/CMakeLists.txt | 2 +-
  src/camel/CMakeLists.txt                         | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/addressbook/libebook-contacts/CMakeLists.txt b/src/addressbook/libebook-contacts/CMakeLists.txt
-index e9e3259..2ae72a8 100644
+index e9e3259..e749d1b 100644
 --- a/src/addressbook/libebook-contacts/CMakeLists.txt
 +++ b/src/addressbook/libebook-contacts/CMakeLists.txt
 @@ -25,7 +25,7 @@ target_link_libraries(gen-western-table
@@ -28,12 +23,12 @@ index e9e3259..2ae72a8 100644
  add_custom_command(
  	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
 -	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
-+	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table-native "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
++	COMMAND gen-western-table "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
  	DEPENDS gen-western-table e-name-western-tables.h.in
  )
  
 diff --git a/src/camel/CMakeLists.txt b/src/camel/CMakeLists.txt
-index be626a8..9226b2b 100644
+index be626a8..14ac8b8 100644
 --- a/src/camel/CMakeLists.txt
 +++ b/src/camel/CMakeLists.txt
 @@ -10,7 +10,7 @@ target_include_directories(camel-gen-tables PUBLIC
@@ -41,10 +36,10 @@ index be626a8..9226b2b 100644
  add_custom_command(
  	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
 -	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
-+	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables-native >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
++	COMMAND camel-gen-tables >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
  	DEPENDS camel-gen-tables
  )
  
 -- 
-2.21.0
+2.20.1
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/iconv-detect.h
similarity index 100%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h
rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/iconv-detect.h
-- 
2.21.0



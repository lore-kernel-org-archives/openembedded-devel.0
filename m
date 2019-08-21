Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id BF21379C7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 18:49:31 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 4B7751021F9;
	Wed, 21 Aug 2019 18:49:32 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2019 20:49:27 +0200
Message-Id: <20190821184927.3393-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH v2 3/3] evolution-data-server: Update to version 3.32.4
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
X-List-Received-Date: Wed, 21 Aug 2019 18:49:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the latest stable upstream release. Unfortunately the package
needs a bit more than a simple version bump to be in a good shape. The
list of changes includes.
1. Work around cmake broken cross-compilation support. Unfortunately
   cmake does not support building stuff for both target and host
   machine. This is unfortunate since current versions of esd do compile
   and try to run camel-gen-tables and gen-western-table tools. To work
   around this problem patch cmake files to invoke those tools suffixed
   with "native" keyword. Such tools are then manually compiled in
   do_compile_prepend. Fortunately they are pretty simple and don't have
   dependencies besides glib-2.0 which we do have readily available.
2. Actually enable and fix gobject introspection support. The recipe does
   inherit gobject-introspection class but this bbclass does not know
   how to handle cmake projects. We need to do it manually by specifying
   ENABLE_INTROSPECTION cmake option. For this to work we also need
   patch eds custom cmake GIR handling code to find necessary tools
   provided in sysroot-native. After the necessary files are generated
   we need to assign them to proper packages.
3. Fix package vala support. As with gir the recipe does inherit vala
   bbclass, but bindings will not be generated until ENABLE_VALA_BINDINGS
   cmake option is turned on. Add PACKAGECONFIG for that and make sure
   vala files are shipped in appropriate dev packages.
4. Add PACKAGECONFIGs for all the extra features eds offers. Its worth
   noting that some PACKAGECONFIG entries added here do not currently
   have their dependencies provided by oe-core or meta-openembedded.
   Those are goa, weather and phonenumber. They do build and work if
   those extra dependencies are provided by another meta layer. I'd also
   plan to upstrem recipes for those at a later stage.

This patch also performs a lot of other smaller cleanups like:
* Dropping leftovers from long gone autotools support.
* Inherit upstream-version-is-even.
* List some additional DEPENDencies the package hass.,
* Drop X11 as a required distro feature to build eds.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...keLists.txt-Remove-TRY_RUN-for-iconv.patch | 20 +++--
 ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch | 10 +--
 ...the-Novell-sample-contact-with-somet.patch | 10 +--
 ...x-to-exacutables-produced-and-run-du.patch | 50 +++++++++++
 ...nded-way-to-handle-the-icu-namespace.patch | 46 -----------
 ...for-address-localization-when-LC_ADD.patch | 33 ++++++++
 ...-to-LDFLAGS-when-linking-libphonenum.patch | 36 ++++++++
 ...ntrispection-support-to-work-with-OE.patch | 75 +++++++++++++++++
 ...6.6.bb => evolution-data-server_3.32.4.bb} | 82 ++++++++++++-------
 9 files changed, 269 insertions(+), 93 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
 rename meta-gnome/recipes-gnome/eds/{evolution-data-server_3.26.6.bb => evolution-data-server_3.32.4.bb} (56%)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
index a821a14ab..cc9dca4ea 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
@@ -1,7 +1,7 @@
-From 131b88a81aba3d72d566bc8a9d968941a98e0007 Mon Sep 17 00:00:00 2001
+From e32075119803f9fffbba01a31083e416cb213011 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Tue, 19 Dec 2017 16:37:20 +0100
-Subject: [PATCH] CMakeLists.txt: Remove TRY_RUN for iconv
+Subject: [PATCH 1/7] CMakeLists.txt: Remove TRY_RUN for iconv
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,18 +13,20 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- CMakeLists.txt | 5 -----
- 1 file changed, 5 deletions(-)
+ CMakeLists.txt | 6 ------
+ 1 file changed, 6 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8d07772..a2396f2 100644
+index f9d72db..ed99904 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -521,13 +521,8 @@ if(NOT HAVE_ICONV)
- endif(NOT HAVE_ICONV)
+@@ -526,15 +526,9 @@ endif(NOT HAVE_ICONV)
  
  set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
--CHECK_C_SOURCE_RUNS("#include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _correct_iconv)
+ file(TO_NATIVE_PATH "${CMAKE_BINARY_DIR}/" _binary_dir_with_separator)
+-CHECK_C_SOURCE_RUNS("#define ICONV_DETECT_BUILD_DIR \"${_binary_dir_with_separator}\"
+-		     #include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _correct_iconv)
+ unset(_binary_dir_with_separator)
  unset(CMAKE_REQUIRED_LIBRARIES)
  
 -if(NOT _correct_iconv)
@@ -35,5 +37,5 @@ index 8d07772..a2396f2 100644
  # Backtraces for debugging
  # ******************************
 -- 
-2.14.3
+2.21.0
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
index c8dc7e12c..23c3a96d4 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
@@ -1,7 +1,7 @@
-From 210b204d9edd71202454ff04013cc52b23c598e4 Mon Sep 17 00:00:00 2001
+From 20bd8946a5c73290d961df151e82033171639c0d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Tue, 19 Dec 2017 16:55:13 +0100
-Subject: [PATCH] CMakeLists.txt: remove CHECK_C_SOURCE_RUNS check
+Subject: [PATCH 2/7] CMakeLists.txt: remove CHECK_C_SOURCE_RUNS check
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,10 +15,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 23 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a2396f2..f3b271b 100644
+index ed99904..9a2e99f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -573,29 +573,6 @@ CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
+@@ -579,29 +579,6 @@ CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
  CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
  			int main(void) { char *detail = nl_langinfo (_NL_ADDRESS_COUNTRY_AB2); return 0; }" HAVE__NL_ADDRESS_COUNTRY_AB2)
  
@@ -49,5 +49,5 @@ index a2396f2..f3b271b 100644
  # system mail stuff
  # ******************************
 -- 
-2.14.3
+2.21.0
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
index 3cdfa8b6f..c9e6f96f5 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
@@ -1,14 +1,14 @@
-From 4df8bd8ae4258289663b27af1207027c7ee06340 Mon Sep 17 00:00:00 2001
+From d616eddf3a214a49900344f4455155879d3b82db Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sun, 4 Aug 2013 09:13:25 +0200
-Subject: [PATCH 1/5] contact: Replace the Novell sample contact with something
+Subject: [PATCH 3/7] contact: Replace the Novell sample contact with something
  more appropriate
 
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/addressbook/libedata-book/ximian-vcard.h | 179 ++++++++++++++++++-------------
- 2 files changed, 103 insertions(+), 77 deletions(-)
+ src/addressbook/libedata-book/ximian-vcard.h | 179 +++++++++++--------
+ 1 file changed, 102 insertions(+), 77 deletions(-)
 
 diff --git a/src/addressbook/libedata-book/ximian-vcard.h b/src/addressbook/libedata-book/ximian-vcard.h
 index 782d37b..5b0b250 100644
@@ -198,5 +198,5 @@ index 782d37b..5b0b250 100644
 +" gQIUKE+H+C/wMGX8Ias1s6CQAAAABJRU5ErkJggg==\n" \
  "END:VCARD"
 -- 
-1.8.3.2
+2.21.0
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch
new file mode 100644
index 000000000..67023df2c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch
@@ -0,0 +1,50 @@
+From 30bd4ae3badb152c9f81c6d34014c586fa0cc825 Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <tworaz@tworaz.net>
+Date: Mon, 12 Aug 2019 14:13:52 +0200
+Subject: [PATCH 4/7] Add native suffix to exacutables produced and run during
+ build process.
+
+CMake can't build tools for the host system when cross compiling. As
+result eds currently fails to build in OE due to some programs being
+cross compiled for the target and run on the host. To work around this
+limitation modify existing targets using build time generated binaries
+to invoke binaries suffixed with -native. We can inject such binaries
+into expected locations prior to invoking ninja in do_compile.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
+---
+ src/addressbook/libebook-contacts/CMakeLists.txt | 2 +-
+ src/camel/CMakeLists.txt                         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/addressbook/libebook-contacts/CMakeLists.txt b/src/addressbook/libebook-contacts/CMakeLists.txt
+index e9e3259..2ae72a8 100644
+--- a/src/addressbook/libebook-contacts/CMakeLists.txt
++++ b/src/addressbook/libebook-contacts/CMakeLists.txt
+@@ -25,7 +25,7 @@ target_link_libraries(gen-western-table
+ 
+ add_custom_command(
+ 	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
+-	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
++	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table-native "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
+ 	DEPENDS gen-western-table e-name-western-tables.h.in
+ )
+ 
+diff --git a/src/camel/CMakeLists.txt b/src/camel/CMakeLists.txt
+index be626a8..9226b2b 100644
+--- a/src/camel/CMakeLists.txt
++++ b/src/camel/CMakeLists.txt
+@@ -10,7 +10,7 @@ target_include_directories(camel-gen-tables PUBLIC
+ 
+ add_custom_command(
+ 	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
+-	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
++	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables-native >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
+ 	DEPENDS camel-gen-tables
+ )
+ 
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
deleted file mode 100644
index d3b0ac673..000000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 698a0e104dcbe4b630df848fd4af7c59f76cdc37 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 May 2018 17:46:52 -0700
-Subject: [PATCH] Use recommended way to handle the icu namespace
-
-Fixes build with icu >= 61
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libedataserver/e-alphabet-index-private.cpp | 2 ++
- src/libedataserver/e-transliterator-private.cpp | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/libedataserver/e-alphabet-index-private.cpp b/src/libedataserver/e-alphabet-index-private.cpp
-index d3e44f4..ddffd99 100644
---- a/src/libedataserver/e-alphabet-index-private.cpp
-+++ b/src/libedataserver/e-alphabet-index-private.cpp
-@@ -33,9 +33,11 @@
- 
- /* ICU headers */
- #include <unicode/alphaindex.h>
-+#include <unicode/ustring.h>
- 
- using icu::AlphabeticIndex;
- using icu::Locale;
-+using U_ICU_NAMESPACE::UnicodeString;
- 
- struct _EAlphabetIndex {
- 	AlphabeticIndex *priv;
-diff --git a/src/libedataserver/e-transliterator-private.cpp b/src/libedataserver/e-transliterator-private.cpp
-index bb15593..573446f 100644
---- a/src/libedataserver/e-transliterator-private.cpp
-+++ b/src/libedataserver/e-transliterator-private.cpp
-@@ -33,8 +33,10 @@
- 
- /* ICU headers */
- #include <unicode/translit.h>
-+#include <unicode/ustring.h>
- 
- using icu::Transliterator;
-+using U_ICU_NAMESPACE::UnicodeString;
- 
- struct _ETransliterator {
- 	Transliterator *priv;
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
new file mode 100644
index 000000000..55ab5a7fc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
@@ -0,0 +1,33 @@
+From 95425206e7317e59b7ca06d7f838ad357cdd200c Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <tworaz@tworaz.net>
+Date: Wed, 14 Aug 2019 00:31:54 +0200
+Subject: [PATCH 5/7] Use LC_MESSAGES for address localization when LC_ADDRESS
+ is not available.
+
+Musl does not define LC_ADDRESS unfortunately.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
+---
+ src/addressbook/libebook-contacts/e-phone-number-private.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/addressbook/libebook-contacts/e-phone-number-private.cpp b/src/addressbook/libebook-contacts/e-phone-number-private.cpp
+index 4c5aebb..9abcebd 100644
+--- a/src/addressbook/libebook-contacts/e-phone-number-private.cpp
++++ b/src/addressbook/libebook-contacts/e-phone-number-private.cpp
+@@ -36,6 +36,10 @@
+ #include <phonenumbers/logger.h>
+ #include <phonenumbers/phonenumberutil.h>
+ 
++#ifndef LC_ADDRESS
++#define LC_ADDRESS LC_MESSAGES
++#endif
++
+ using i18n::phonenumbers::PhoneNumber;
+ using i18n::phonenumbers::PhoneNumberUtil;
+ 
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
new file mode 100644
index 000000000..c0c1427fd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
@@ -0,0 +1,36 @@
+From fb9164bbca5b425f1cf1bb3cac51d06afe81938a Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <tworaz@tworaz.net>
+Date: Wed, 14 Aug 2019 00:47:59 +0200
+Subject: [PATCH 6/7] Dont add /usr/lib to LDFLAGS when linking libphonenumber.
+
+This will refer to host lib dir which is not what we want.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
+---
+ cmake/modules/FindPhonenumber.cmake | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cmake/modules/FindPhonenumber.cmake b/cmake/modules/FindPhonenumber.cmake
+index 04d1056..70c0c41 100644
+--- a/cmake/modules/FindPhonenumber.cmake
++++ b/cmake/modules/FindPhonenumber.cmake
+@@ -37,12 +37,10 @@ string(TOUPPER "${WITH_PHONENUMBER}" optupper)
+ if(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINARY_DIR}"))
+ 	set(WITH_PHONENUMBER "ON")
+ 	set(PHONENUMBER_INCLUDE_DIRS "${INCLUDE_INSTALL_DIR}")
+-	set(PHONENUMBER_LIB_DIRS ${LIB_INSTALL_DIR})
+-	set(PHONENUMBER_LDFLAGS -L${PHONENUMBER_LIB_DIRS} ${PHONENUMBER_LDFLAGS})
++	set(PHONENUMBER_LDFLAGS  ${PHONENUMBER_LDFLAGS})
+ else(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINARY_DIR}"))
+ 	set(PHONENUMBER_INCLUDE_DIRS "${WITH_PHONENUMBER}/include")
+-	set(PHONENUMBER_LIB_DIRS ${WITH_PHONENUMBER}/lib${LIB_SUFFIX})
+-	set(PHONENUMBER_LDFLAGS -L${PHONENUMBER_LIB_DIRS} ${PHONENUMBER_LDFLAGS})
++	set(PHONENUMBER_LDFLAGS ${PHONENUMBER_LDFLAGS})
+ endif(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINARY_DIR}"))
+ 
+ unset(bindirlen)
+-- 
+2.21.0
+
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
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
similarity index 56%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
rename to meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 1949fc7fd..eb56248ce 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -9,43 +9,44 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://src/calendar/libecal/e-cal.h;endline=24;md5=e699ec3866f73f129f7a4ffffdcfc196"
 
 DEPENDS = " \
-    intltool-native gperf-native \
-    glib-2.0 gtk+3 gconf libgnome-keyring libgdata \
+    intltool-native gperf-native glib-2.0-native \
+    glib-2.0 gtk+3 gconf libgnome-keyring libgdata libcanberra icu \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
-inherit distro_features_check gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative vala upstream-version-is-even
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+           file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
+           file://0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch \
+           file://0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch \
+           file://0007-Modify-gobject-intrispection-support-to-work-with-OE.patch \
            file://iconv-detect.h \
-           file://0004-Use-recommended-way-to-handle-the-icu-namespace.patch \
            "
-SRC_URI[archive.md5sum] = "ae7bbf543b2c3ff79af27e0edea5d472"
-SRC_URI[archive.sha256sum] = "e43aa1847ddc02965f560261ef88d18fb8704eddaa55555bf96b884a33e510ec"
+SRC_URI[archive.md5sum] = "57820f3f88fc554e1a58665a52e12c05"
+SRC_URI[archive.sha256sum] = "83f67cb4b680e892b22b51bcde64c788b7ac63e92a99de401fb347e3794f4c7f"
 
 LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
 
 EXTRA_OECMAKE = " \
-    -DWITH_KRB5=OFF \
-    -DENABLE_GOA=OFF \
-    -DENABLE_UOA=OFF \
-    -DENABLE_GOOGLE_AUTH=OFF \
-    -DENABLE_WEATHER=OFF \
     -D${LKSTRFTIME} \
+    -DSYSCONF_INSTALL_DIR=${sysconfdir} \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'introspection', '', d)}"
 PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
-
-EXTRA_OECONF = "--with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-nntp --disable-gtk-doc"
+PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkitgtk"
+PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
+PACKAGECONFIG[goa] = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
+PACKAGECONFIG[weather] = "-DENABLE_WEATHER=ON,-DENABLE_WEATHER=OFF,libgweather"
+PACKAGECONFIG[phonenumber] = "-DWITH_PHONENUMBER=ON,-DWITH_PHONENUMBER=OFF,libphonenumber"
+PACKAGECONFIG[introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
+PACKAGECONFIG[vala] = "-DENABLE_VALA_BINDINGS=ON -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen,-DENABLE_VALA_BINDINGS=OFF"
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
@@ -58,11 +59,19 @@ do_configure_append () {
 }
 
 do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
+    # CMake does not support building native binaries when cross compiling. As result
+    # it always cross compiles them for the target and then aborts when they fail to run.
+    # To work around this manually build required tools and patch cmake targets to use
+    # those native binaries we built here.
+    ${BUILD_CC} -I${B} ${S}/src/camel/camel-gen-tables.c -o ${B}/src/camel/camel-gen-tables-native
+    ${BUILD_CC} -I${B} $(pkg-config-native --cflags --libs glib-2.0) \
+        ${S}/src/addressbook/libebook-contacts/gen-western-table.c \
+        -o ${B}/src/addressbook/libebook-contacts/gen-western-table-native
 }
 
 
-PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
+PACKAGES =+ "libebook-contacts libebook-contacts-dev \
+             libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
              libedataserver libedataserver-dev \
              libedataserverui libedataserverui-dev"
@@ -82,19 +91,32 @@ RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
 
 FILES_libcamel = "${libdir}/libcamel-*.so.* \
                   ${libdir}/libcamel-provider-*.so.* \
+                  ${libdir}/girepository-*/Camel-*.typelib \
                   ${libdir}/evolution-data-server*/camel-providers/*.so \
                   ${libdir}/evolution-data-server*/camel-providers/*.urls"
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
-                      ${libdir}/evolution-data-server*/camel-providers/*.la \
-                      ${includedir}/evolution-data-server*/camel"
+                      ${includedir}/evolution-data-server*/camel \
+                      ${datadir}/gir-*/Camel-*.gir \
+                      ${datadir}/vala/vapi/camel-*"
 
-FILES_libebook = "${libdir}/libebook-*.so.*"
-FILES_libebook-dev = "${libdir}/libebook-1.2.so \
+FILES_libebook = "${libdir}/libebook-*.so.* \
+                  ${libdir}/girepository-*/EBook-*.typelib"
+FILES_libebook-dev = "${libdir}/libebook-*.so \
                       ${libdir}/pkgconfig/libebook-*.pc \
+                      ${datadir}/gir-*/EBook-*.gir \
+                      ${datadir}/vala/vapi/libebook-*.* \
                       ${includedir}/evolution-data-server*/libebook/*.h"
 RRECOMMENDS_libebook = "libedata-book"
 
+FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.* \
+                           ${libdir}/girepository-*/EBookContacts-*.typelib"
+FILES_libebook-contacts-dev = "${libdir}/libebook-contacts-*.so \
+                               ${libdir}/pkgconfig/libebook-contacts-*.pc \
+                               ${datadir}/gir-*/EBookContacts-*.gir \
+                               ${datadir}/vala/vapi/libebook-contacts-* \
+                               ${includedir}/evolution-data-server*/libebook-contacts/*.h"
+
 FILES_libecal = "${libdir}/libecal-*.so.* \
                  ${datadir}/evolution-data-server-1.4/zoneinfo"
 FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
@@ -109,7 +131,6 @@ FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                        ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
 FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
                            ${libdir}/pkgconfig/libedata-book-*.pc \
-                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
                            ${includedir}/evolution-data-server-*/libedata-book"
 
 FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
@@ -118,15 +139,20 @@ FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
                       ${libdir}/evolution-data-server-*/extensions/libecal*.so"
 FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
                           ${libdir}/pkgconfig/libedata-cal-*.pc \
-                          ${includedir}/evolution-data-server-*/libedata-cal \
-                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
+                          ${includedir}/evolution-data-server-*/libedata-cal"
 
-FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
+FILES_libedataserver = "${libdir}/libedataserver-*.so.* \
+                        ${libdir}/girepository-*/EDataServer-*.typelib"
 FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
                             ${libdir}/pkgconfig/libedataserver-*.pc \
+                            ${datadir}/git-*/EDataServer-*.gir \
+                            ${datadir}/vala/vapi/libedataserver-* \
                             ${includedir}/evolution-data-server-*/libedataserver/*.h"
 
-FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution-data-server-1.4/glade/*.glade"
+FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* \
+                          ${libdir}/girepository-*/EDataServerUI-*.typelib"
 FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
                               ${libdir}/pkgconfig/libedataserverui-*.pc \
+                              ${datadir}/gir-*/EDataServerUI-*.gir \
+                              ${datadir}/vala/vapi/libedataserverui-* \
                               ${includedir}/evolution-data-server-*/libedataserverui/*.h"
-- 
2.21.0



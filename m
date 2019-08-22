Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id C10F87F27E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:26 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 6AC57103809;
	Thu, 22 Aug 2019 17:17:27 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:07 +0200
Message-Id: <20190822171723.18657-2-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 01/17] evolution-data-server: Update to version 3.32.4
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
X-List-Received-Date: Thu, 22 Aug 2019 17:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0004-Use-recommended-way-to-handle-the-icu-namespace.patch patch is
  already included in this release. Drop it.
* To make this update possible we need to work around cmake inability to
  compile code for the host machine while cross compiling. To work
  around this necessary tools are manually compiled in the
  do_compile_prepend step. Custom patch is then used to modify project
  cmake files to invoke provided host tools instead of those produced
  during cross build.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...keLists.txt-Remove-TRY_RUN-for-iconv.patch | 20 ++++----
 ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch | 10 ++--
 ...the-Novell-sample-contact-with-somet.patch | 10 ++--
 ...x-to-exacutables-produced-and-run-du.patch | 50 +++++++++++++++++++
 ...nded-way-to-handle-the-icu-namespace.patch | 46 -----------------
 ...6.6.bb => evolution-data-server_3.32.4.bb} | 20 ++++++--
 6 files changed, 86 insertions(+), 70 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
 rename meta-gnome/recipes-gnome/eds/{evolution-data-server_3.26.6.bb => evolution-data-server_3.32.4.bb} (84%)

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
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
rename to meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 1949fc7fd..ddb62597f 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://src/calendar/libecal/e-cal.h;endline=24;md5=e699ec3866f73f129f7a4ffffdcfc196"
 
 DEPENDS = " \
-    intltool-native gperf-native \
-    glib-2.0 gtk+3 gconf libgnome-keyring libgdata \
+    intltool-native gperf-native glib-2.0-native \
+    glib-2.0 gtk+3 gconf libgnome-keyring libgdata libcanberra icu \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
@@ -22,11 +22,11 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+           file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
            file://iconv-detect.h \
-           file://0004-Use-recommended-way-to-handle-the-icu-namespace.patch \
            "
-SRC_URI[archive.md5sum] = "ae7bbf543b2c3ff79af27e0edea5d472"
-SRC_URI[archive.sha256sum] = "e43aa1847ddc02965f560261ef88d18fb8704eddaa55555bf96b884a33e510ec"
+SRC_URI[archive.md5sum] = "57820f3f88fc554e1a58665a52e12c05"
+SRC_URI[archive.sha256sum] = "83f67cb4b680e892b22b51bcde64c788b7ac63e92a99de401fb347e3794f4c7f"
 
 LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
@@ -59,6 +59,16 @@ do_configure_append () {
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
+    # CMake does not support building native binaries when cross compiling. As result
+    # it always cross compiles them for the target and then aborts when they fail to run.
+    # To work around this manually build required tools and patch cmake targets to use
+    # those native binaries we built here.
+    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${B} ${S}/src/camel/camel-gen-tables.c \
+        -o ${B}/src/camel/camel-gen-tables-native
+    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${B} $(pkg-config-native --cflags glib-2.0) \
+        ${S}/src/addressbook/libebook-contacts/gen-western-table.c \
+        -o ${B}/src/addressbook/libebook-contacts/gen-western-table-native \
+        $(pkg-config-native --libs glib-2.0)
 }
 
 
-- 
2.21.0



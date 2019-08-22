Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id D3B037F2EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 09FA51038D9;
	Thu, 22 Aug 2019 17:17:30 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:20 +0200
Message-Id: <20190822171723.18657-15-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 14/17] evolution-data-server: Add PACKAGECONFIG entry for phonenumber.
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

This feature needs some minor patches to be usable. First the
libphonenumber does not use pkgconfig so eds has its own cmake support
for detection location of the lib. Unfortunately this ends up adding
-L/usr/lib to LDFLAGS.

Another problem can be observed when building the code agains musl libc.
Libphoneumber support code in eds tries to use LC_ADDRESS to determine
the language which should be used for some address related localization
features libphonenumber has. Since LC_ADDRESS is not available in musl
the build will fail. We can use LC_MESSAGES for musl however.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...for-address-localization-when-LC_ADD.patch | 33 +++++++++++++++++
 ...-to-LDFLAGS-when-linking-libphonenum.patch | 36 +++++++++++++++++++
 .../eds/evolution-data-server_3.32.4.bb       |  3 ++
 3 files changed, 72 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch

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
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 4f1adb530..8d6c3aded 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
            file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
+           file://0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch \
+           file://0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch \
            file://0007-Modify-gobject-intrispection-support-to-work-with-OE.patch \
            file://iconv-detect.h \
            "
@@ -42,6 +44,7 @@ PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkit
 PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[goa] = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
 PACKAGECONFIG[weather] = "-DENABLE_WEATHER=ON,-DENABLE_WEATHER=OFF,libgweather"
+PACKAGECONFIG[phonenumber] = "-DWITH_PHONENUMBER=ON,-DWITH_PHONENUMBER=OFF,libphonenumber"
 PACKAGECONFIG[introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
 PACKAGECONFIG[vala] = "-DENABLE_VALA_BINDINGS=ON -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen,-DENABLE_VALA_BINDINGS=OFF"
 
-- 
2.21.0



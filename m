Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id C46D76067D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 20:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2018 15:47:54 -0500
Message-Id: <20181211204754.25956-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gtest: update to 1.8.1
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
X-List-Received-Date: Tue, 11 Dec 2018 20:48:28 -0000
Content-Transfer-Encoding: quoted-printable

Update to 1.8.1, which has proper pkg-config support (so
Add-pkg-config-support.patch can be dropped).

Also the canonical gtest seems to have moved out of the google github
organization into something called abseil.  Update HOMEPAGE and SRC_URI
to match.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../gtest/gtest/Add-pkg-config-support.patch  | 106 ------------------
 .../gtest/{gtest_1.8.0.bb =3D> gtest_1.8.1.bb}  |   7 +-
 2 files changed, 3 insertions(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-test/gtest/gtest/Add-pkg-config-suppo=
rt.patch
 rename meta-oe/recipes-test/gtest/{gtest_1.8.0.bb =3D> gtest_1.8.1.bb} (=
69%)

diff --git a/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patc=
h b/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
deleted file mode 100644
index 4c8977b49..000000000
--- a/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From ec9256bb704e94f41407fc8ace6a580491430196 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Thu, 15 Dec 2016 04:35:41 -0800
-Subject: [PATCH] Add pkg-config support
-
-Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
-Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- googlemock/CMakeLists.txt | 9 +++++++--
- googlemock/gmock.pc.in    | 9 +++++++++
- googletest/CMakeLists.txt | 9 +++++++--
- googletest/gtest.pc.in    | 9 +++++++++
- 4 files changed, 32 insertions(+), 4 deletions(-)
- create mode 100644 googlemock/gmock.pc.in
- create mode 100644 googletest/gtest.pc.in
-
-diff --git a/googlemock/CMakeLists.txt b/googlemock/CMakeLists.txt
-index beb259a..f17e2d7 100644
---- a/googlemock/CMakeLists.txt
-+++ b/googlemock/CMakeLists.txt
-@@ -27,6 +27,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
-   pre_project_set_up_hermetic_build()
- endif()
-=20
-+# pkg-config support
-+configure_file("gmock.pc.in" "gmock.pc" @ONLY)
-+
- #######################################################################=
#
- #
- # Project-wide settings
-@@ -104,9 +107,11 @@ endif()
- #
- # Install rules
- install(TARGETS gmock gmock_main
--  DESTINATION lib)
-+  DESTINATION ${CMAKE_INSTALL_LIBDIR})
- install(DIRECTORY ${gmock_SOURCE_DIR}/include/gmock
--  DESTINATION include)
-+  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
-+  DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/")
-=20
- #######################################################################=
#
- #
-diff --git a/googlemock/gmock.pc.in b/googlemock/gmock.pc.in
-new file mode 100644
-index 0000000..04bc0b4
---- /dev/null
-+++ b/googlemock/gmock.pc.in
-@@ -0,0 +1,9 @@
-+Name: libgmock
-+Version: 1.8.0
-+Description: Google's framework for writing C++ tests on a variety of p=
latforms
-+
-+prefix=3D@CMAKE_INSTALL_PREFIX@
-+includedir=3D@CMAKE_INSTALL_INCLUDEDIR@
-+libdir=3D@CMAKE_INSTALL_LIBDIR@
-+Cflags:-I${includedir}/gmock
-+Libs: -L${libdir} -lgmock -lgmock_main
-diff --git a/googletest/CMakeLists.txt b/googletest/CMakeLists.txt
-index 621d0f0..58aaf54 100644
---- a/googletest/CMakeLists.txt
-+++ b/googletest/CMakeLists.txt
-@@ -34,6 +34,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
-   pre_project_set_up_hermetic_build()
- endif()
-=20
-+# pkg-config support
-+configure_file("gtest.pc.in" "gtest.pc" @ONLY)
-+
- #######################################################################=
#
- #
- # Project-wide settings
-@@ -103,9 +106,11 @@ endif()
- #
- # Install rules
- install(TARGETS gtest gtest_main
--  DESTINATION lib)
-+  DESTINATION ${CMAKE_INSTALL_LIBDIR})
- install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
--  DESTINATION include)
-+  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gtest.pc"
-+  DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/")
-=20
- #######################################################################=
#
- #
-diff --git a/googletest/gtest.pc.in b/googletest/gtest.pc.in
-new file mode 100644
-index 0000000..fb95152
---- /dev/null
-+++ b/googletest/gtest.pc.in
-@@ -0,0 +1,9 @@
-+Name: libgtest
-+Version: 1.8.0
-+Description: Google's framework for writing C++ tests on a variety of p=
latforms
-+
-+prefix=3D@CMAKE_INSTALL_PREFIX@
-+includedir=3D@CMAKE_INSTALL_INCLUDEDIR@
-+libdir=3D@CMAKE_INSTALL_LIBDIR@
-+Cflags:-I${includedir}/gtest
-+Libs: -L${libdir} -lgtest -lgtest_main
---=20
-1.9.1
-
diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-=
test/gtest/gtest_1.8.1.bb
similarity index 69%
rename from meta-oe/recipes-test/gtest/gtest_1.8.0.bb
rename to meta-oe/recipes-test/gtest/gtest_1.8.1.bb
index 48cf4e04b..23862c930 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Google's framework for writing C++ tests"
-HOMEPAGE =3D "https://github.com/google/googletest"
+HOMEPAGE =3D "https://github.com/abseil/googletest"
 SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://googlemock/LICENSE;md5=3Dcbbd27594afd089daa=
160d3a16dd515a \
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D "file://googlemock/LICENSE;md5=3Dcb=
bd27594afd089daa160d3a16dd51
 PROVIDES +=3D "gmock"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "ec44c6c1675c25b9827aacd08c02433cccde7780"
+SRCREV =3D "2fe3bd994b3189899d93f1d5a881e725e046fdc2"
 SRC_URI =3D "\
-    git://github.com/google/googletest.git;protocol=3Dhttps; \
-    file://Add-pkg-config-support.patch \
+    git://github.com/abseil/googletest.git;protocol=3Dhttps; \
 "
=20
 inherit cmake
--=20
2.19.2


Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1107.1615492495896899746
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 11:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=m293nnyI;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9E04B20B39C5;
	Thu, 11 Mar 2021 11:54:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9E04B20B39C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1615492495;
	bh=FrXMZyYO0HnAws8Kim2+d3a54W1Ahvs0FrmsAmBVPNk=;
	h=From:To:Cc:Subject:Date:From;
	b=m293nnyIY3b7O7gjtRSYvgNeu+xMHX08zM03VC/i7B1oR6WgQJkvjdu90mNmB4LOk
	 X7p3MmIZ5OduL2VlOiDS0x1bwiu8ecxiN9Z6DONJ2AHqQd/imzC0ddy51j9rJZl/v5
	 NALjf8qVNLEsoPiOYhgjOEzMNy5uXeuvc1wbYezA=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] c-ares: Upgrade to 1.17.1
Date: Thu, 11 Mar 2021 12:54:44 -0700
Message-Id: <20210311195444.2891760-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>

Fixes CVE-2020-8277 [1]
[1] https://nvd.nist.gov/vuln/detail/CVE-2020-8277

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 ...rror-mv-libcares.pc.cmakein-to-libcar.patch | 10 ++++------
 .../c-ares/cmake-install-libcares.pc.patch     | 18 ++++++++----------
 .../{c-ares_1.16.1.bb =3D> c-ares_1.17.1.bb}     |  4 ++--
 3 files changed, 14 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.1.bb =3D> c-ares_1.17=
.1.bb} (89%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-err=
or-mv-libcares.pc.cmakein-to-libcar.patch b/meta-oe/recipes-support/c-are=
s/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
index 8f15f8424..f593045ee 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-l=
ibcares.pc.cmakein-to-libcar.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-l=
ibcares.pc.cmakein-to-libcar.patch
@@ -1,19 +1,20 @@
-From f2f1e134bf5d9d0789942848e03006af8d926cf8 Mon Sep 17 00:00:00 2001
+From 2c3e1b4f8768297c59e63e85addf821d922821d9 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Tue, 17 Mar 2020 12:53:35 +0800
 Subject: [PATCH] fix configure error : mv libcares.pc.cmakein to
  libcares.pc.cmake
=20
 Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3a5878d..c2e5740 100644
+index d963d13..facd49f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -563,7 +563,7 @@ IF (CARES_STATIC)
+@@ -560,7 +560,7 @@ IF (CARES_STATIC)
  ENDIF()
 =20
  # Write ares_config.h configuration file.  This is used only for the bu=
ild.
@@ -22,6 +23,3 @@ index 3a5878d..c2e5740 100644
 =20
 =20
 =20
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares=
.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.=
pc.patch
index 0eb7e4bbb..3219be23c 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.pat=
ch
+++ b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.pat=
ch
@@ -1,4 +1,4 @@
-From 12414304245cce6ef0e8b9547949be5109845353 Mon Sep 17 00:00:00 2001
+From d399ee2b00e0797e3edc1b6f4c0214b407d26574 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 13:33:33 +0800
 Subject: [PATCH] cmake: Install libcares.pc
@@ -11,12 +11,13 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.co=
m>
 update to 1.14.0, fix patch warning
=20
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  CMakeLists.txt | 28 +++++++++++++++++++++++-----
  1 file changed, 23 insertions(+), 5 deletions(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd123e1..3a5878d 100644
+index 08c0247..d963d13 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
@@ -50,9 +51,9 @@ index fd123e1..3a5878d 100644
 =20
  # When checking for symbols, we need to make sure we set the proper
  # headers, libraries, and definitions for the detection to work properl=
y
-@@ -554,6 +557,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY=
_DIR}/ares_build.h)
- # Write ares_config.h configuration file.  This is used only for the bu=
ild.
- CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h=
)
+@@ -551,6 +554,15 @@ ENDIF()
+ # Record toplevel CMakeLists.txt path
+ set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
 =20
 +# Pass required CFLAGS to pkg-config in case of static library
 +IF (CARES_STATIC)
@@ -66,10 +67,10 @@ index fd123e1..3a5878d 100644
 =20
  # TRANSFORM_MAKEFILE_INC
  #
-@@ -728,6 +740,12 @@ IF (CARES_INSTALL)
- 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Dev=
el DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+@@ -625,6 +637,12 @@ IF (CARES_INSTALL)
  ENDIF ()
 =20
+=20
 +# pkg-config file
 +IF (CARES_INSTALL)
 +       SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
@@ -79,6 +80,3 @@ index fd123e1..3a5878d 100644
  # Legacy chain-building variables (provided for compatibility with old =
code).
  # Don't use these, external code should be updated to refer to the alia=
ses directly (e.g., Cares::cares).
  SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/re=
cipes-support/c-ares/c-ares_1.17.1.bb
similarity index 89%
rename from meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
index 67dd70180..7861abe59 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
@@ -5,14 +5,14 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd=
48b006"
=20
-PV =3D "1.16.0+gitr${SRCPV}"
+PV =3D "1.17.1+gitr${SRCPV}"
=20
 SRC_URI =3D "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.pat=
ch \
 "
-SRCREV =3D "74a1426ba60e2cd7977e53a22ef839c87415066e"
+SRCREV =3D "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"
=20
--=20
2.25.1


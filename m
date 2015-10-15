Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5A484770F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:52:10 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so15324882wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=tAqWMDqL62h8msdtEGGGgEj00nIVN0iKwU1hOBsYeXY=;
	b=CPYU5JfWRdz7PdeWttGGH++wiv87EnLXdjs/E9KEC7F7CgEJGy54cf/D+3UzN0uepH
	Cv9WKOQ3zuj5BT503y+DALMMhmlkOsOSHSzescmWifunnXweYNNjFJP2k+wr6RdWpXLG
	rXR9xDNp0sqYmQlsMDVHgCF0N9wnzb2EIUooxm/i8QYkhOt6XHyXpByh99xD7NaRlwpr
	YhKCtOKP67SY7wDIhlczuHTeQ+Rcs2JEcZzEoyGqBm7hcapqe19LKMw/+pwgzS3y0Q1j
	w6RjFgFN39gTz1gOtuXj7SCm931sx0773/vD8Et3Fyzw5lUHD82vII9I7pMiV+wgyA1g
	hnAQ==
X-Received: by 10.180.8.5 with SMTP id n5mr35235977wia.94.1444909930458;
	Thu, 15 Oct 2015 04:52:10 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	p4sm23312499wia.15.2015.10.15.04.52.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 04:52:09 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 15 Oct 2015 13:52:09 +0200
Message-Id: <0450B04D-3FE9-414A-BC9B-211671E67847@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-java][PATCH 2/6] icedtea7-native: compiling without x11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 11:52:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Allow building icedtea7 without any X11 dependency.

This affects the native part only which is required to bootstrap =
openjdk-8-native
for cross-compiling openjdk-8, but should be adoptable for =
cross-compiled recipe
as well as for openjdk-6.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/icedtea/icedtea7-native.inc           | 14 ++++-
 .../openjdk-7-03b147/allow-headless-build.patch    | 72 =
++++++++++++++++++++++
 ...-disable-sun.applet-for-tools-in-headless.patch | 10 +++
 .../icedtea-disable-x11-in-headless.patch          | 15 +++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  | 10 +++
 5 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 =
recipes-core/icedtea/openjdk-7-03b147/allow-headless-build.patch
 create mode 100644 =
recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-sun.applet-for-tools=
-in-headless.patch
 create mode 100644 =
recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-x11-in-headless.patc=
h

diff --git a/recipes-core/icedtea/icedtea7-native.inc =
b/recipes-core/icedtea/icedtea7-native.inc
index b29fd34..69dd0ae 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -5,13 +5,18 @@ INC_PR =3D "r1"
=20
 DEPENDS =3D "virtual/javac-native virtual/java-native classpath-native =
\
            rhino-native ant-native libxslt-native attr-native \
-           libx11-native xproto-native libxt-native libxext-native =
libxrender-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
-           fontconfig-native zip-native alsa-lib-native \
+           fontconfig-native zip-native \
 	   unzip-native \
           "
=20
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[x11] =3D ",--disable-headful,libx11-native xproto-native =
libxt-native libxext-native libxrender-native"
+
+OEMAKE_BUILD_HEADLESS_ONLY =3D "${@base_contains('PACKAGECONFIG', =
'x11', '', 'BUILD_HEADLESS_ONLY=3D1', d)}"
+CFLAGS_append =3D "${@base_contains('PACKAGECONFIG', 'x11', '', ' =
-DHEADLESS=3Dtrue', d)}"
+
 inherit native java autotools
=20
 JAVA_HOME[unexport] =3D "1"
@@ -27,6 +32,7 @@ SRC_URI =3D " \
   ${LANGTOOLS_URI} \
   ${ICEDTEA_PATCHES} \
   ${OPENJDK_PATCHES} \
+  file://allow-headless-build.patch;striplevel=3D0 \
   "
=20
 S =3D "${WORKDIR}/${ICEDTEA}"
@@ -124,6 +130,8 @@ do_configure_prepend() {
 	done
 }
=20
+POST_CONFIGURE_CLEAN_X11 =3D "${@base_contains('PACKAGECONFIG', 'x11', =
'', 'rm openjdk*/jdk/src/solaris/classes/sun/awt/X11/*.java', d)}"
+
 do_configure_append() {
 	oe_runmake patch-fsg
=20
@@ -143,6 +151,7 @@ do_configure_append() {
 			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
 			$F
 	done
+	${POST_CONFIGURE_CLEAN_X11}
 	oe_runmake patch-boot
 }
=20
@@ -152,6 +161,7 @@ EXTRA_OEMAKE =3D ' \
                 OE_CXXFLAGS=3D"${CXXFLAGS}" \
                 OE_LDFLAGS=3D"${LDFLAGS}" \
                 ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
+		${OEMAKE_BUILD_HEADLESS_ONLY} \
                '
=20
 do_compile() {
diff --git =
a/recipes-core/icedtea/openjdk-7-03b147/allow-headless-build.patch =
b/recipes-core/icedtea/openjdk-7-03b147/allow-headless-build.patch
new file mode 100644
index 0000000..80a98b1
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/allow-headless-build.patch
@@ -0,0 +1,72 @@
+--- acinclude.m4.orig	2015-08-18 11:58:23.000000000 +0200
++++ acinclude.m4	2015-08-18 11:58:30.000000000 +0200
+@@ -2178,3 +2178,37 @@
+ AM_CONDITIONAL([NO_BYTECODE7], test x"${it_cv_bytecode7}" =3D "xyes")
+ AC_PROVIDE([$0])dnl
+ ])
++AC_DEFUN_ONCE([JDKOPT_SETUP_JDK_OPTIONS],
++[
++
++  =
##########################################################################=
#####
++  #
++  # Should we build a JDK/JVM with headful support (ie a graphical =
ui)?
++  # We always build headless support.
++  #
++  AC_MSG_CHECKING([headful support])
++  AC_ARG_ENABLE([headful], [AS_HELP_STRING([--disable-headful],
++      [disable building headful support (graphical UI support) =
@<:@enabled@:>@])],
++      [SUPPORT_HEADFUL=3D${enable_headful}], [SUPPORT_HEADFUL=3Dyes])
++
++  SUPPORT_HEADLESS=3Dyes
++  BUILD_HEADLESS=3D"BUILD_HEADLESS:=3Dtrue"
++
++  if test "x$SUPPORT_HEADFUL" =3D xyes; then
++    # We are building both headful and headless.
++    headful_msg=3D"include support for both headful and headless"
++  fi
++
++  if test "x$SUPPORT_HEADFUL" =3D xno; then
++    # Thus we are building headless only.
++    BUILD_HEADLESS=3D"BUILD_HEADLESS:=3Dtrue"
++    headful_msg=3D"headless only"
++  fi
++
++  AC_MSG_RESULT([$headful_msg])
++
++  AC_SUBST(SUPPORT_HEADLESS)
++  AC_SUBST(SUPPORT_HEADFUL)
++  AC_SUBST(BUILD_HEADLESS)
++
++])
+--- configure.ac.orig	2015-08-18 11:33:37.000000000 +0200
++++ configure.ac	2015-08-18 11:55:26.000000000 +0200
+@@ -55,9 +55,13 @@
+ IT_DISABLE_LANGTOOLS_TESTS
+ IT_DISABLE_JDK_TESTS
+=20
++JDKOPT_SETUP_JDK_OPTIONS
++
++if test "x$SUPPORT_HEADFUL" =3D xyes; then
+ # Use xvfb-run if found to run gui tests (check-jdk).
+ AC_CHECK_PROG(XVFB_RUN_CMD, xvfb-run, [xvfb-run -a -e xvfb-errors], =
[])
+ AC_SUBST(XVFB_RUN_CMD)
++fi
+=20
+ AC_MSG_CHECKING([whether to include PulseAudio support])
+ AC_ARG_ENABLE([pulse-java],
+@@ -174,6 +178,7 @@
+ IT_CHECK_FOR_SYSCALLS
+ AC_CONFIG_FILES([remove-intree-libraries.sh])
+=20
++if test "x$SUPPORT_HEADFUL" =3D xyes; then
+ dnl Check for Xproto headers and libraries.
+ PKG_CHECK_MODULES(XPROTO, xproto,[XPROTO_FOUND=3Dyes],[XPROTO_FOUND=3Dno=
])
+ if test "x${XPROTO_FOUND}" =3D xno
+@@ -213,6 +218,7 @@
+ Try installing libXrender-devel or configure --disable-xrender.])
+   fi
+ fi
++fi
+=20
+ if test "x${ENABLE_SYSTEMTAP}" =3D xyes; then
+ AC_CHECK_HEADER([sys/sdt.h], [SDT_H_FOUND=3D'yes'],
diff --git =
a/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-sun.applet-for-too=
ls-in-headless.patch =
b/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-sun.applet-for-too=
ls-in-headless.patch
new file mode 100644
index 0000000..336043f
--- /dev/null
+++ =
b/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-sun.applet-for-too=
ls-in-headless.patch
@@ -0,0 +1,10 @@
+--- openjdk/jdk/make/common/Release.gmk.orig	2015-08-20 =
10:08:34.631526528 +0200
++++ openjdk/jdk/make/common/Release.gmk	2015-08-20 =
10:10:13.823526901 +0200
+@@ -340,7 +340,6 @@
+ 	sun/security/tools/SignatureFile.class \
+ 	sun/security/tools/TimestampedSigner.class \
+ 	sun/rmi/rmic		\
+-	sun/applet		\
+ 	sun/jvmstat		\
+ 	com/sun/javadoc		\
+ 	com/sun/jdi		\
diff --git =
a/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-x11-in-headless.pa=
tch =
b/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-x11-in-headless.pa=
tch
new file mode 100644
index 0000000..b7cf7a3
--- /dev/null
+++ =
b/recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-x11-in-headless.pa=
tch
@@ -0,0 +1,15 @@
+--- openjdk/jdk/make/sun/awt/FILES_c_unix.gmk.orig	2015-08-19 =
11:53:47.209867982 +0200
++++ openjdk/jdk/make/sun/awt/FILES_c_unix.gmk	2015-08-19 =
11:57:48.677868529 +0200
+@@ -207,12 +207,6 @@
+ 	awt_MToolkit.c \
+ 	fontpath.c \
+ 	VDrawingArea.c \
+-	X11Color.c \
+-	X11Renderer.c \
+-	X11PMBlitLoops.c \
+-	X11SurfaceData.c \
+-	X11FontScaler_md.c \
+-	X11TextRenderer_md.c \
+         OGLBlitLoops.c \
+         OGLBufImgOps.c \
+         OGLContext.c \
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc =
b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 01e7a3d..98266f7 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -82,8 +82,17 @@ OPENJDK_PATCHES =3D " \
 	file://icedtea-flags.patch;apply=3Dno \
 	=
file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=3D=
no \
 	file://icedtea-change-to-gdb-debug-format.patch;apply=3Dno \
+	file://icedtea-disable-x11-in-headless.patch;apply=3Dno \
+	=
file://icedtea-disable-sun.applet-for-tools-in-headless.patch;apply=3Dno =
\
         "
=20
+OPENJDK_HEADLESS_PATCHES =3D " \
+	patches/icedtea-disable-x11-in-headless.patch \
+	patches/icedtea-disable-sun.applet-for-tools-in-headless.patch \
+	"
+
+CLEAN_X11_DISTRIBUTION_PATCH =3D "${@base_contains('PACKAGECONFIG', =
'x11', '', '${OPENJDK_HEADLESS_PATCHES}', d)}"
+
 export DISTRIBUTION_PATCHES =3D " \
         patches/icedtea-ecj-disable-compilation.patch \
 	patches/icedtea-unbreak-float.patch \
@@ -93,4 +102,5 @@ export DISTRIBUTION_PATCHES =3D " \
 	patches/icedtea-flags.patch \
 	=
patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
 	patches/icedtea-change-to-gdb-debug-format.patch \
+	${CLEAN_X11_DISTRIBUTION_PATCH} \
         "
--=20
2.3.8 (Apple Git-58)


--=20
Jens Rehsack - rehsack@gmail.com



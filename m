Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xW-00066v-Cr
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:26:29 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2265385fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sSOR5i13CRB/4iCIiPsDUH6ojAT/3J+pVSDbuAm1MKU=;
	b=OZN7y/wLSRhZqC/QYf+Skr9AaNl/ZodQKUA2DJD7zYw5KYpxB2MjSa9GPCv4ECJze9
	okqRq/yW8QO9yYiuz8FAcMn2xUkkBVcD1IqbPGfRtrn1D9tq5/PJxPw29Q+6yE+c0lkA
	A0BBCBmfl20OBRnJwjpWJ2lZcw1MzgH5oHUJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uLI/fILOX4fQnq0HPFTLM+HRqKU/OY6VTIUfxjr/cPBNPFPfg/bYoNzQNGx75w9UiE
	VpTX/I53DveWF13VddoxHRSPYxYmk9fIY0e1BsyYtjDJjQSBbb6U1mQB/e43UQk8LFXo
	z0Enp+uvZ2pNUZcu5gBF+WkmmmExmtDdU2Vt0=
Received: by 10.223.15.216 with SMTP id l24mr487940faa.92.1277468402099;
	Fri, 25 Jun 2010 05:20:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e10sm37832908fak.38.2010.06.25.05.20.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:35 +0200
Message-Id: <1277468383-16679-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/9] mesa: remove old 6.0 and 6.4 recipes which are not using any include file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jun 2010 12:28:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/mesa-6.0.1/Make-config.patch |   26 ---------------
 recipes/mesa/mesa-6.0.1/mklib.patch       |   22 -------------
 recipes/mesa/mesa_6.0.1.bb                |   29 -----------------
 recipes/mesa/mesa_6.4.1+cvs20060101.bb    |   48 -----------------------------
 4 files changed, 0 insertions(+), 125 deletions(-)
 delete mode 100644 recipes/mesa/mesa-6.0.1/Make-config.patch
 delete mode 100644 recipes/mesa/mesa-6.0.1/mklib.patch
 delete mode 100644 recipes/mesa/mesa_6.0.1.bb
 delete mode 100644 recipes/mesa/mesa_6.4.1+cvs20060101.bb

diff --git a/recipes/mesa/mesa-6.0.1/Make-config.patch b/recipes/mesa/mesa-6.0.1/Make-config.patch
deleted file mode 100644
index cfe8890..0000000
--- a/recipes/mesa/mesa-6.0.1/Make-config.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- mesa/Make-config.orig	2004-06-25 13:09:44.000000000 +0100
-+++ mesa/Make-config	2004-06-25 14:18:27.000000000 +0100
-@@ -643,16 +643,16 @@
- 	"GLUT_LIB = libglut.so" \
- 	"GLW_LIB = libGLw.so" \
- 	"OSMESA_LIB = libOSMesa.so" \
--	"CC = gcc" \
--	"CXX = g++" \
--	"CFLAGS = -O3 -ansi -pedantic -fPIC -ffast-math -D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE -DUSE_XSHM -DPTHREADS -I/usr/X11R6/include" \
--	"CXXFLAGS = -O3 -ansi -pedantic -fPIC -ffast-math -D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE" \
-+	"CC = $(CC)" \
-+	"CXX = $(CXX)" \
-+	"CFLAGS = -ansi -pedantic -fPIC -ffast-math -D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE -DUSE_XSHM -DPTHREADS $(CFLAGS)" \
-+	"CXXFLAGS = -ansi -pedantic -fPIC -ffast-math -D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE $(CXXFLAGS)" \
- 	"GLUT_CFLAGS = -fexceptions" \
--	"GL_LIB_DEPS = -L/usr/X11R6/lib -lX11 -lXext -lm -lpthread" \
-+	"GL_LIB_DEPS = $(LDFLAGS) -lX11 -lXext -lm -lpthread" \
- 	"OSMESA_LIB_DEPS = -L$(TOP)/lib -lGL" \
- 	"GLU_LIB_DEPS = -L$(TOP)/lib -lGL -lm" \
--	"GLUT_LIB_DEPS = -L$(TOP)/lib -lGLU -lGL -L/usr/X11R6/lib -lX11 -lXmu -lXt -lXi -lm" \
--	"GLW_LIB_DEPS = -L$(TOP)/lib -lGL -L/usr/X11R6/lib -lXt -lX11" \
-+	"GLUT_LIB_DEPS = $(LDFLAGS) -L$(TOP)/lib -lGLU -lGL -lX11 -lXmu -lXt -lXi -lm" \
-+	"GLW_LIB_DEPS = $(LDFLAGS) -L$(TOP)/lib -lGL -lXt -lX11" \
- 	"APP_LIB_DEPS = -lglut -lGLU -lGL -lm"
- 
- linux-static:
diff --git a/recipes/mesa/mesa-6.0.1/mklib.patch b/recipes/mesa/mesa-6.0.1/mklib.patch
deleted file mode 100644
index 7dc1ec7..0000000
--- a/recipes/mesa/mesa-6.0.1/mklib.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- mesa/bin/mklib.old	2004-06-25 14:08:41.000000000 +0100
-+++ mesa/bin/mklib	2004-06-25 14:23:09.000000000 +0100
-@@ -64,6 +64,7 @@
- 	'-install')   shift 1; INSTALLDIR=$1;;
- 	'-arch')      shift 1; ARCH=$1;;
- 	'-archopt')   shift 1; ARCHOPT=$1;;
-+	-Wl*)	      DEPS="$DEPS $1";;
- 	-*)           echo "mklib: Unknown option: " $1 ; exit 1;;
- 	*) break
-     esac
-@@ -137,9 +138,9 @@
-             echo "mklib: Making" $ARCH "shared library: " ${LIBNAME}.so.${VERSION}
- 
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK="g++"
-+                LINK="$CXX"
-             else
--                LINK="gcc"
-+                LINK="$CC"
-             fi
- 
-             # rm any old libs
diff --git a/recipes/mesa/mesa_6.0.1.bb b/recipes/mesa/mesa_6.0.1.bb
deleted file mode 100644
index 3b37b8f..0000000
--- a/recipes/mesa/mesa_6.0.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SECTION = "unknown"
-SRC_URI = "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 \
-	file://Make-config.patch \
-	file://mklib.patch"
-S = "${WORKDIR}/Mesa-${PV}"
-PE = "2"
-LICENSE = "LGPL"
-# gcc-3.4 blows up in gtktext with -frename-registers on arm-linux
-CXXFLAGS := "${@'${CXXFLAGS}'.replace('-frename-registers', '')}"
-DEPENDS = "makedepend-native"
-
-do_compile() {
-	oe_runmake linux CC="${CC}" CXX="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LD="${LD}" LDFLAGS="${LDFLAGS}"
-}
-
-do_install() {
-	install -d ${D}${libdir}
-	cp -pP lib/* ${D}${libdir}/
-	install -d ${D}${includedir}
-	cp -R include/GL ${D}${includedir}/
-}
-
-do_stage() {
-        cp -pP lib/* ${STAGING_LIBDIR}/
-        cp -R include/GL ${STAGING_INCDIR}/
-}
-
-SRC_URI[md5sum] = "b7f14088c5c2f14490d2739a91102112"
-SRC_URI[sha256sum] = "2de039f7abe10569b681ea1d9e21fb65fd0081c8f4db40fb62b332acb11679fb"
diff --git a/recipes/mesa/mesa_6.4.1+cvs20060101.bb b/recipes/mesa/mesa_6.4.1+cvs20060101.bb
deleted file mode 100644
index 9fceca1..0000000
--- a/recipes/mesa/mesa_6.4.1+cvs20060101.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SECTION = "unknown"
-
-SRCDATE = "20060101"
-PV = "6.4.1+cvs${SRCDATE}"
-PE = "2"
-PR = "r1"
-
-SRC_URI = "${FREEDESKTOP_CVS}/mesa;module=Mesa;method=pserver;date=${SRCDATE} \
-	file://mklib-rpath-link.patch"
-S = "${WORKDIR}/Mesa"
-
-LICENSE = "LGPL"
-
-RDEPENDS_${PN} = "expat"
-DEPENDS = "makedepend-native xf86vidmodeproto glproto virtual/libx11 libxext libxxf86vm libxi libxmu libice"
-
-# gcc-3.4 blows up in gtktext with -frename-registers on arm-linux
-CXXFLAGS := "${@'${CXXFLAGS}'.replace('-frename-registers', '')}"
-
-do_configure() {
-	cd configs
-
-	ln -sf linux current
-	sed -e "s%CC *= *.*%CC = ${CC}%" -i current
-	sed -e "s%CXX *= *.*%CXX = ${CXX}%" -i current
-	sed -e "s%LD *= *.*%LD = ${LD}%" -i current
-	sed -e "s%OPT_FLAGS *= *.*%OPT_FLAGS = ${TARGET_CFLAGS}%" -i current
-	sed -e "s%X11_INCLUDES *= *.*%X11_INCLUDES = -I${STAGING_INCDIR}/X11%" -i current
-	sed -e "s%EXTRA_LIB_PATH *= *.*%EXTRA_LIB_PATH = ${LDFLAGS}%" -i current
-	sed -i s:\$\(CC\):gcc:g  ../src/mesa/x86/Makefile
-	echo "SRC_DIRS = mesa glu glut/glx" >> current
-}
-
-do_compile() {
-	oe_runmake default
-}
-
-do_install() {
-	install -d ${D}${libdir}
-	cp -pP lib/* ${D}${libdir}/
-	install -d ${D}${includedir}
-	cp -R include/GL ${D}${includedir}/
-}
-
-do_stage() {
-        cp -pP lib/* ${STAGING_LIBDIR}/
-        cp -R include/GL ${STAGING_INCDIR}/
-}
-- 
1.7.0.2




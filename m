Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MU0XB-0003JA-Lr
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 17:48:43 +0200
Received: from tamarin.localnet (123-192-186-20.dynamic.kbronet.com.tw
	[123.192.186.20])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id AACA91B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2009 15:35:47 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jul 2009 17:33:14 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
MIME-Version: 1.0
Message-Id: <200907231733.14601.holger+oe@freyther.de>
Subject: [PATCH] Fix qt4-embedded compilation
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
X-List-Received-Date: Thu, 23 Jul 2009 15:48:50 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey,

I need the below patch to be able to compile qt4-embedded without trying to=
=20
download a PowerVR sdk for the OMAP when building on x86...

I think the gles/OpenVG backend can be added back whenever the normal build=
 is=20
not broken, or maybe someone finds the time to find out why it broke.

holger


=46rom 36d8a5f1daf3aab9ad1b4faa672d796dadfe906d Mon Sep 17 00:00:00 2001
=46rom: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Thu, 23 Jul 2009 17:27:33 +0200
Subject: [PATCH] qt4-embedded: Fix compilation of qt4-embedded

The addition of the qt4-embedded-gles recipe broke the normal
plain qt4-embedded build. A plain bitbake qt4-embedded will attempt
to build both due some magic I don't yet understand.
=2D--
 recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch |   18 --------------
 recipes/qt4/qt4-embedded-gles_4.5.2.bb             |   25=20
=2D-------------------
 2 files changed, 0 insertions(+), 43 deletions(-)
 delete mode 100644 recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
 delete mode 100644 recipes/qt4/qt4-embedded-gles_4.5.2.bb

diff --git a/recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch=20
b/recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
deleted file mode 100644
index c3bf39f..0000000
=2D-- a/recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
+++ /dev/null
@@ -1,18 +0,0 @@
=2D--- /tmp/qglscreen_qws.h	2009-07-09 09:39:40.000000000 +0200
=2D+++ qt-embedded-linux-opensource-src-4.5.2/src/opengl/qglscreen_qws.h=09
2009-07-09 09:40:11.000000000 +0200
=2D@@ -60,7 +60,6 @@
=2D #else
=2D #include <GLES/egl.h>
=2D #endif
=2D-#if !defined(EGL_VERSION_1_3) && !defined(QEGL_NATIVE_TYPES_DEFINED)
=2D #undef EGLNativeWindowType
=2D #undef EGLNativePixmapType
=2D #undef EGLNativeDisplayType
=2D@@ -68,7 +67,6 @@
=2D typedef NativePixmapType EGLNativePixmapType;
=2D typedef NativeDisplayType EGLNativeDisplayType;
=2D #define QEGL_NATIVE_TYPES_DEFINED 1
=2D-#endif
=2D=20
=2D QT_BEGIN_HEADER
=2D=20
diff --git a/recipes/qt4/qt4-embedded-gles_4.5.2.bb b/recipes/qt4/qt4-embed=
ded-
gles_4.5.2.bb
deleted file mode 100644
index 31bfe0f..0000000
=2D-- a/recipes/qt4/qt4-embedded-gles_4.5.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
=2D# recipe to build GLES gfxdriver
=2D
=2DFILESPATHPKG =3D. "qt4-embedded-${PV}:qt4-embedded:"
=2D
=2DQT_CONFIG_FLAGS +=3D "-D QT_QWS_CLIENTBLIT -depths 16,24,32 -opengl es1 -
plugin-gfx-powervr"
=2D
=2Drequire qt4-embedded_${PV}.bb
=2D
=2DDEPENDS +=3D "virtual/egl"
=2DSRC_URI +=3D "file://sgx-hack.patch;patch=3D1"
=2D
=2Dexport EXTRA_QMAKE_MUNGE =3D " glmunge "
=2D
=2Dglmunge() {
=2D	sed -e /QMAKE_INCDIR_OPENGL/d -e /QMAKE_LIBDIR_OPENGL/d -e=20
/QMAKE_LIBS_OPENGL/d -e /QMAKE_LIBS_OPENGL_QT/d -i=20
mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
=2D
=2D	echo "QMAKE_INCDIR_OPENGL =3D ${STAGING_INCDIR}/GLES/" >>=20
mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
=2D	echo "QMAKE_LIBDIR_OPENGL  =3D ${STAGING_LIBDIR}" >>=20
mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
=2D	echo "QMAKE_LIBS_OPENGL =3D -lEGL -lGLES_CM -lIMGegl -lsrv_um" >>=20
mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
=2D	echo "QMAKE_LIBS_OPENGL_QT =3D -lEGL -lGLES_CM -lIMGegl -lsrv_um" >>=20
mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
=2D	sed -i -e s:MBX_SYNC:HW_SYNC:g=20
${S}/src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c
=2D}
=2D
=2D
=2D
=2D-=20
1.6.3.3




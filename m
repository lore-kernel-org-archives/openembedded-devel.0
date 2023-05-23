Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C3FC7EE2A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 12:18:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20573.1684844314457240986
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 05:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F1A8139F;
	Tue, 23 May 2023 05:19:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F5E93F6C4;
	Tue, 23 May 2023 05:18:33 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] hplip: build against libusb1
Date: Tue, 23 May 2023 13:18:29 +0100
Message-Id: <20230523121831.1877208-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102732

From: Ross Burton <ross.burton@arm.com>

Build against the maintained libusb1 instead of the obsolete
libusb-compat.  Update the patch to use pkg-config so that it does the
correct linkage too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hplip/hplip/fix-libusb-paths.patch        | 76 ++++++++++++++-----
 .../recipes-extended/hplip/hplip_3.22.10.bb   |  3 +-
 2 files changed, 57 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch =
b/meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch
index 6aa1de0a8a..f2cd2be60d 100644
--- a/meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch
@@ -1,33 +1,69 @@
-Upstream-Status: Inappropriate [configuration]
+Don't hardcode paths to libusb, instead use pkg-config.
=20
---- a/configure.in
-+++ b/configure.in
-@@ -599,6 +599,8 @@ if test "$class_driver" =3D "no" && test "
-       AC_CHECK_HEADERS(usb.h, ,[AC_MSG_ERROR([cannot find libusb-devel =
support], 11)])
-    else
-       AC_CHECK_LIB([usb-1.0], [libusb_init], [LIBS=3D"$LIBS"], [AC_MSG_=
ERROR([cannot find libusb 1.0 support], 2)])
-+      LIBUSBINCLUDEROOT?=3D"/usr/include/"
-+      AC_ARG_VAR(LIBUSBINCLUDEROOT, [path to libusb-1.0 folder])
-       AC_CHECK_HEADERS(libusb-1.0/libusb.h, ,[AC_MSG_ERROR([cannot find=
 libusb-1.0-devel support], 11)])
-    fi
- fi
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index b77327f..29e838a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -109,7 +109,7 @@ libhpmud_la_SOURCES +=3D io/hpmud/musb_lib
- libhpmud_la_LDFLAGS +=3D -lusb
+@@ -107,12 +107,11 @@ libhpmud_la_SOURCES =3D io/hpmud/hpmud.c io/hpmud/=
mlc.c io/hpmud/model.c io/hpmud/
+=20
+ if LIBUSB01_BUILD
+ libhpmud_la_SOURCES +=3D io/hpmud/musb_libusb01.c=20
+-libhpmud_la_LDFLAGS +=3D -lusb
  else
  libhpmud_la_SOURCES +=3D io/hpmud/musb.c=20
 -libhpmud_la_CFLAGS  +=3D -I/usr/include/libusb-1.0
-+libhpmud_la_CFLAGS  +=3D -I$(LIBUSBINCLUDEROOT)/libusb-1.0
- libhpmud_la_LDFLAGS +=3D -lusb-1.0
+-libhpmud_la_LDFLAGS +=3D -lusb-1.0
  endif
++libhpmud_la_CFLAGS  +=3D $(USB_CFLAGS)
++libhpmud_la_LDFLAGS +=3D $(USB_LIBS)
+=20
+=20
+ if NETWORK_BUILD
+@@ -356,7 +355,7 @@ hpmudextdir =3D $(pyexecdir)
+ hpmudext_LTLIBRARIES =3D hpmudext.la
+ hpmudext_la_LDFLAGS =3D -module -avoid-version
+ hpmudext_la_SOURCES =3D io/mudext/hpmudext.c
+-hpmudext_la_CFLAGS =3D -I$(PYTHONINCLUDEDIR)
++hpmudext_la_CFLAGS =3D -I$(PYTHONINCLUDEDIR) $(USB_CFLAGS)
+ hpmudext_la_LIBADD =3D libhpmud.la
 =20
-@@ -362,7 +362,7 @@ hpmudext_la_CFLAGS +=3D -Iprotocol/discove
+ if NETWORK_BUILD
+@@ -364,9 +363,6 @@ hpmudext_la_LIBADD +=3D libhpdiscovery.la
+ hpmudext_la_CFLAGS +=3D -Iprotocol/discovery
  endif
 =20
- if !LIBUSB01_BUILD
+-if !LIBUSB01_BUILD
 -hpmudext_la_CFLAGS +=3D-I/usr/include/libusb-1.0=20
-+hpmudext_la_CFLAGS +=3D-I$(LIBUSBINCLUDEROOT)/libusb-1.0=20
- endif
+-endif
  endif #!HPLIP_CLASS_DRIVER
  # ui (qt3)
+ if GUI_BUILD
+diff --git a/configure.in b/configure.in
+index b1c690c..4a65c97 100644
+--- a/configure.in
++++ b/configure.in
+@@ -36,6 +36,7 @@ AC_PROG_CXX
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_LIBTOOL
++PKG_PROG_PKG_CONFIG
+=20
+ # Checks for required libraries, don't set global -lpthread, -lm, -ljpe=
g, ... here, set in Makefile.
+ AC_CHECK_LIB([pthread], [pthread_create], [LIBS=3D"$LIBS"], [AC_MSG_ERR=
OR([cannot find libpthread support], 7)])
+@@ -620,11 +621,9 @@ if test "$class_driver" =3D "no" && test "$hpijs_on=
ly_build" =3D "no" && test "$hpcu
+    AC_CHECK_LIB([cups], [cupsDoFileRequest], [LIBS=3D"$LIBS"], [AC_MSG_=
ERROR([cannot find libcups support], 9)])
+    AC_CHECK_HEADERS(cups/cups.h, ,[AC_MSG_ERROR([cannot find cups-devel=
 support], 3)])
+    if test "$libusb01_build" =3D "yes"; then
+-      AC_CHECK_LIB([usb], [usb_init], [LIBS=3D"$LIBS"], [AC_MSG_ERROR([=
cannot find libusb support], 2)])
+-      AC_CHECK_HEADERS(usb.h, ,[AC_MSG_ERROR([cannot find libusb-devel =
support], 11)])
++      PKG_CHECK_MODULES([USB], [libusb])
+    else
+-      AC_CHECK_LIB([usb-1.0], [libusb_init], [LIBS=3D"$LIBS"], [AC_MSG_=
ERROR([cannot find libusb 1.0 support], 2)])
+-      AC_CHECK_HEADERS(libusb-1.0/libusb.h, ,[AC_MSG_ERROR([cannot find=
 libusb-1.0-devel support], 11)])
++      PKG_CHECK_MODULES([USB], [libusb-1.0])
+    fi
+ fi
+=20
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/re=
cipes-extended/hplip/hplip_3.22.10.bb
index ca683483b6..3ccfa7d662 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz =
\
            file://0001-Drop-using-register-storage-classifier.patch"
 SRC_URI[sha256sum] =3D "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e6=
2a8382d0c1366624"
=20
-DEPENDS +=3D "cups python3 libusb"
+DEPENDS +=3D "cups python3 libusb1"
=20
 inherit autotools-brokensep python3-dir python3native python3targetconfi=
g pkgconfig systemd
=20
@@ -29,7 +29,6 @@ export STAGING_LIBDIR
 CFLAGS +=3D "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI=
}"
=20
 EXTRA_OECONF +=3D "\
-        LIBUSBINCLUDEROOT=3D${STAGING_INCDIR} \
         --enable-cups-drv-install \
         --enable-cups-ppd-install \
         --disable-network-build \
--=20
2.34.1



Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B601C021BE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15895.1740506964769336025
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B2A51BCB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECE133F6A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] libgphoto2: remove redundant autoconfing
Date: Tue, 25 Feb 2025 18:09:10 +0000
Message-ID: <20250225180917.3232793-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225180917.3232793-1-ross.burton@arm.com>
References: <20250225180917.3232793-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115591

The configure scripts do the right thing now, so there's no need to
patch configure.ac or manually invoke the sub-configure.

Also remove obsolete FILES, -dbg is packaged automatically and we don't
install .la files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...01-configure.ac-remove-AM_PO_SUBDIRS.patch | 41 -------------------
 .../gphoto2/libgphoto2_2.5.31.bb              | 15 -------
 2 files changed, 56 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-conf=
igure.ac-remove-AM_PO_SUBDIRS.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.a=
c-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto=
2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
deleted file mode 100644
index fd647b7386..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remov=
e-AM_PO_SUBDIRS.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 31a5d2f7db18737aef08c34e8707b4f69f7e5156 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Sun, 21 Oct 2012 17:59:20 +0200
-Subject: [PATCH] configure.ac: remove AM_PO_SUBDIRS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-together with oe autotools.bbclass this is done twice and causes:
-
-| autoreconf: running: aclocal --system-acdir=3D/home/Superandy/tmp/oe-c=
ore-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-=
r2/libgphoto2-2.4.11/aclocal-copy/ --automake-acdir=3D/home/Superandy/tmp=
/oe-core-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/Sup=
erandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/lib=
gphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-co=
re-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r=
2/libgphoto2-2.4.11/m4m/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7=
a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/=
auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angst=
rom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ --force -I =
auto-m4 -I m4m
-| configure.ac:230: error: `po-directories' is already registered with A=
C_CONFIG_COMMANDS.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
- configure.ac                 |    1 -
- libgphoto2_port/configure.ac |    1 -
- 2 files changed, 0 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -282,7 +282,6 @@ dnl ------------------------------------
- GP_GETTEXT_SETUP([GETTEXT_PACKAGE_LIBGPHOTO2],
-                  [${PACKAGE}-${LIBGPHOTO2_CURRENT_MIN}],
-                  [po])
--AM_PO_SUBDIRS()
- AM_GNU_GETTEXT_VERSION([0.19.1])
- AM_GNU_GETTEXT([external])
- AM_ICONV()
---- a/libgphoto2_port/configure.ac
-+++ b/libgphoto2_port/configure.ac
-@@ -122,7 +122,6 @@ dnl ------------------------------------
- GP_GETTEXT_SETUP([GETTEXT_PACKAGE_LIBGPHOTO2_PORT],
-                  [${PACKAGE}-${LIBGPHOTO2_PORT_CURRENT_MIN}],
-                  [po])
--AM_PO_SUBDIRS()
- AM_GNU_GETTEXT_VERSION([0.19.1])
- AM_GNU_GETTEXT([external])
- AM_ICONV()
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb b/meta=
-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
index 57c9d199eb..0b58e8e75f 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
@@ -11,7 +11,6 @@ DEPENDS =3D "libtool jpeg virtual/libusb0 libexif zlib =
libxml2"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=3D=
libgphoto2 \
            file://40-libgphoto2.rules \
-           file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
            file://fix-build-with-gcc-14.patch \
 "
@@ -25,18 +24,6 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[gd] =3D ",--without-gdlib,gd"
 PACKAGECONFIG[serial] =3D "--enable-serial,--disable-serial,lockdev"
=20
-do_configure:prepend() {
-    rm -rf ${S}/libgphoto2_port/auto-m4/*
-    rm -rf ${S}/auto-m4/*
-}
-
-do_configure:append() {
-    cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/libgphot=
o2_port/po/
-    cd ${S}/libgphoto2_port/
-    autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $=
acpaths
-    cd ${S}
-}
-
 do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
     install -m 0644 ${UNPACKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
@@ -49,6 +36,4 @@ RRECOMMENDS:${PN} =3D "libgphoto2-camlibs"
 FILES:libgphotoport =3D "${libdir}/libgphoto2_port.so.*"
=20
 FILES:${PN} +=3D "${nonarch_base_libdir}/udev/*"
-FILES:${PN}-dbg +=3D "${libdir}/*/*/.debug"
-FILES:${PN}-dev +=3D "${libdir}/*/*/*.la"
 FILES:${PN}-doc +=3D "${datadir}/libgphoto2_port/0.12.?/vcamera/README.t=
xt"
--=20
2.43.0



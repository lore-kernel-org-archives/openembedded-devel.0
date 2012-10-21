Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TPyfA-0004UO-Kr
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Oct 2012 18:46:08 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1014819wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2012 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=IIcX9buR0oGSzUsl0A/8VajaYyUkVI3Dnr4QwCXxlVE=;
	b=MI6wALvhrg4SrCt3QAaFcEpTS/rgj3UULC7ajBKJD9eZsYRycyiB/+xsDhfCHRIcud
	CbQ2FephtBwLbJkVZ6s1gs2O+Ww6LXrR695U8y356SCzT+xMpyGhbikh/u2U+qcR2lQF
	fGpJKrChFBarKJ+rJ1SSWHm+4A75oRT0yRKNqyae6gMQHWSig24Ad2Qc1Gn5X2+Jfp/j
	X0UNATeQStYxptEMTip+1mLNrB7PjhV6fnM/0LL9Hg8sm+V/dHwZLQZiIblfq8fftIpy
	elfIi7qcIEIJUX/3STrpmY4D8FQbceGsDdMdwxsP+il4+KLVaVBYb4HVMIud6Id0G+2f
	IwIw==
Received: by 10.216.198.66 with SMTP id u44mr4000785wen.133.1350837165093;
	Sun, 21 Oct 2012 09:32:45 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1781.dip.t-dialin.net.
	[79.223.23.129])
	by mx.google.com with ESMTPS id m14sm46626199wie.8.2012.10.21.09.32.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 09:32:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:41:43 +0200
Message-Id: <1350837703-1341-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] libgphoto2: fix build
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
X-List-Received-Date: Sun, 21 Oct 2012 16:46:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

autoconf.bbclass forces building po dirs by copying po/Makefile.in.in. We have
to care for libgphoto2_port/po/Makefile.in.in too and have to remove
AM_PO_SUBDIRS() from configure.ac since that causes

| autoreconf: running: aclocal --system-acdir=/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/aclocal-copy/ --automake-acdir=/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ --force -I auto-m4 -I m4m
| configure.ac:230: error: `po-directories' is already registered with AC_CONFIG_COMMANDS.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-configure.ac-remove-AM_PO_SUBDIRS.patch   |   48 ++++++++++++++++++++
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    4 +-
 2 files changed, 51 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
new file mode 100644
index 0000000..5e135db
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
@@ -0,0 +1,48 @@
+From 31a5d2f7db18737aef08c34e8707b4f69f7e5156 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 21 Oct 2012 17:59:20 +0200
+Subject: [PATCH] configure.ac: remove AM_PO_SUBDIRS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+together with oe autotools.bbclass this is done twice and causes:
+
+| autoreconf: running: aclocal --system-acdir=/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/aclocal-copy/ --automake-acdir=/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ --force -I auto-m4 -I m4m
+| configure.ac:230: error: `po-directories' is already registered with AC_CONFIG_COMMANDS.
+
+Upstream-Status: Inapropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac                 |    1 -
+ libgphoto2_port/configure.ac |    1 -
+ 2 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2f8e1b8..2e90acf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -227,7 +227,6 @@ ALL_LINGUAS="da de es eu fr hu it ja nl pl ru sv uk vi zh_CN"
+ GP_GETTEXT_HACK([${PACKAGE}-${LIBGPHOTO2_CURRENT_MIN}],[The gPhoto Team],[${MAIL_GPHOTO_TRANSLATION}])
+ AM_GNU_GETTEXT_VERSION([0.14.1])
+ AM_GNU_GETTEXT([external])
+-AM_PO_SUBDIRS()
+ AM_ICONV()
+ GP_GETTEXT_FLAGS()
+ 
+diff --git a/libgphoto2_port/configure.ac b/libgphoto2_port/configure.ac
+index 0b66d58..df47357 100644
+--- a/libgphoto2_port/configure.ac
++++ b/libgphoto2_port/configure.ac
+@@ -116,7 +116,6 @@ GP_GETTEXT_HACK([${PACKAGE}-${LIBGPHOTO2_PORT_CURRENT_MIN}],[Lutz Mueller and ot
+ ALL_LINGUAS="cs da de fr es eu it ja nl pl pt_BR ru sk sv uk vi zh_CN zh_TW"
+ AM_GNU_GETTEXT_VERSION([0.14.1])
+ AM_GNU_GETTEXT([external])
+-AM_PO_SUBDIRS()
+ AM_ICONV()
+ GP_GETTEXT_FLAGS()
+ 
+-- 
+1.7.4.4
+
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index fbce4fd..d7f6ac0 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://10-camera-libgphoto2-device.fdi \
            file://10-camera-libgphoto2.fdi \
            file://40-libgphoto2.rules \
+           file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
 SRC_URI[libgphoto2.md5sum] = "16a22b9739e45a95980ed62705fe7333"
@@ -25,6 +26,7 @@ inherit autotools pkgconfig gettext lib_package
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
 do_configure_append() {
+	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
 	cd ${S}/libgphoto2_port/
 	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 	cd ${S}
-- 
1.7.4.4




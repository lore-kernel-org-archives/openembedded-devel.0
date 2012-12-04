Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1Tg1j0-0001Kr-0c
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 00:16:27 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so7024654ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 15:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=gQsuiR/aUWfV4X4tDbIlLhud3QkGYRC+PIcwvYaSqu8=;
	b=JiqFqMiZipKIszA2FhthntaMFvkMzVZxdQq6TImvGnfvRqWM6DTeZfD1D0SYgIPEjl
	fVmUAWEoGeNxMJikFZJVv2OxxIGrEWcvES3QcKzYAEVuWIO5XK2ji1fDdBEEM3y7NlU/
	4+LsNdOMeAUk7LY97tXYvelu7HZ4NPiprCXG5lDspILGbDeFDjgkWhgNH0HfA96m8jLd
	n8q/KefwmX76PWHmnqY1lcoGsT9Xt1mwwbVvVxpy2e80raNRCn6jCN7leo02A1GNFbrU
	EoTtuGDWEBfdM2AmyvuR0vF0nag284fuCd7QV6w6G5qyhN7Kn/KTeUfwf/eoSqUpbHKn
	sxEA==
Received: by 10.50.5.239 with SMTP id v15mr4478833igv.41.1354662122431;
	Tue, 04 Dec 2012 15:02:02 -0800 (PST)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPS id px5sm11129837igc.0.2012.12.04.15.02.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 15:02:01 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 17:01:58 -0600
Message-Id: <1354662118-31597-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [meta-oe][danny][PATCH] Revert "libgphoto2: fix build"
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
X-List-Received-Date: Tue, 04 Dec 2012 23:16:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Peter A. Bigot" <pab@pabigot.com>

This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.

Patch made in response to oe-core commit 841ea3c1c breaks builds using
oe-core danny branch which branched before that commit.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../0001-configure.ac-remove-AM_PO_SUBDIRS.patch   |   48 --------------------
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    2 -
 2 files changed, 0 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
deleted file mode 100644
index 5e135db..0000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 31a5d2f7db18737aef08c34e8707b4f69f7e5156 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 21 Oct 2012 17:59:20 +0200
-Subject: [PATCH] configure.ac: remove AM_PO_SUBDIRS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-together with oe autotools.bbclass this is done twice and causes:
-
-| autoreconf: running: aclocal --system-acdir=/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/aclocal-copy/ --automake-acdir=/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ --force -I auto-m4 -I m4m
-| configure.ac:230: error: `po-directories' is already registered with AC_CONFIG_COMMANDS.
-
-Upstream-Status: Inapropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac                 |    1 -
- libgphoto2_port/configure.ac |    1 -
- 2 files changed, 0 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2f8e1b8..2e90acf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -227,7 +227,6 @@ ALL_LINGUAS="da de es eu fr hu it ja nl pl ru sv uk vi zh_CN"
- GP_GETTEXT_HACK([${PACKAGE}-${LIBGPHOTO2_CURRENT_MIN}],[The gPhoto Team],[${MAIL_GPHOTO_TRANSLATION}])
- AM_GNU_GETTEXT_VERSION([0.14.1])
- AM_GNU_GETTEXT([external])
--AM_PO_SUBDIRS()
- AM_ICONV()
- GP_GETTEXT_FLAGS()
- 
-diff --git a/libgphoto2_port/configure.ac b/libgphoto2_port/configure.ac
-index 0b66d58..df47357 100644
---- a/libgphoto2_port/configure.ac
-+++ b/libgphoto2_port/configure.ac
-@@ -116,7 +116,6 @@ GP_GETTEXT_HACK([${PACKAGE}-${LIBGPHOTO2_PORT_CURRENT_MIN}],[Lutz Mueller and ot
- ALL_LINGUAS="cs da de fr es eu it ja nl pl pt_BR ru sk sv uk vi zh_CN zh_TW"
- AM_GNU_GETTEXT_VERSION([0.14.1])
- AM_GNU_GETTEXT([external])
--AM_PO_SUBDIRS()
- AM_ICONV()
- GP_GETTEXT_FLAGS()
- 
--- 
-1.7.4.4
-
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index d7f6ac0..affe571 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -15,7 +15,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://10-camera-libgphoto2-device.fdi \
            file://10-camera-libgphoto2.fdi \
            file://40-libgphoto2.rules \
-           file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
 SRC_URI[libgphoto2.md5sum] = "16a22b9739e45a95980ed62705fe7333"
@@ -26,7 +25,6 @@ inherit autotools pkgconfig gettext lib_package
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
 do_configure_append() {
-	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
 	cd ${S}/libgphoto2_port/
 	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 	cd ${S}
-- 
1.7.7.6




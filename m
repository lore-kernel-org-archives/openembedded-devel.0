Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AA05370714
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 17:13:34 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so4858999wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VQ8HblQ2vHgHVqUKCAfXvRJHK5AVIYSCePy2wiQJ6FU=;
	b=LufrdkvwfTMx7lkmEzJa89Npc4DThQ2wLv2OycMA+z7weNWBgqkbyv00NCXWPp4ti4
	IOvzgpsIojDXiOlR/xtRb9fRzKoJuHBWZmlnwZkkRzeenGAbYrlLAq3D1Z3mgsA7XlqJ
	hHuf4wpE5M4CHtYdhxvYBQfnH5dJRjuwG8uRYn7oXnuRwGp/V3zliMxTCHtqkwjzX6PN
	koWlsIpL5Qf+cskxpQRaluwYBzn6q0+YWe4xZQehHetGlQuno8eQhe7FWuVwmfvVTXfg
	OA+v2d7OStx1+1LZK/+X7yaJD/L2L0bCC3NjBJbwNV5kshKEnspSq1mDnUYAhWXeg6Hs
	cNJg==
X-Received: by 10.180.106.104 with SMTP id gt8mr5208757wib.13.1412529215344;
	Sun, 05 Oct 2014 10:13:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gg18sm8535691wic.21.2014.10.05.10.13.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 10:13:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Oct 2014 19:14:31 +0200
Message-Id: <1412529272-10914-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412529272-10914-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412529272-10914-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] subsurface: blacklist until it's upgraded for libdivecomputer compatibility
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
X-List-Received-Date: Sun, 05 Oct 2014 17:13:41 -0000

* I've started with upgrade, but requires lot more changes which I'm not
  comfortable to finish on something I cannot test in runtime

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../subsurface/subsurface/libm.patch               | 17 ---------------
 .../subsurface/subsurface/pkgconfig.patch          | 22 -------------------
 .../recipes-extended/subsurface/subsurface_git.bb  | 25 ++++++----------------
 3 files changed, 7 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/subsurface/subsurface/libm.patch
 delete mode 100644 meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch

diff --git a/meta-oe/recipes-extended/subsurface/subsurface/libm.patch b/meta-oe/recipes-extended/subsurface/subsurface/libm.patch
deleted file mode 100644
index 7995608..0000000
--- a/meta-oe/recipes-extended/subsurface/subsurface/libm.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-| /media/build1/poky/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.9.0/ld: divelist.o: undefined reference to symbol 'pow@@GLIBC_2.0'
-| /media/build1/poky/build1/tmp/sysroots/qemux86/lib/libm.so.6: error adding symbols: DSO missing from command line
-| collect2: error: ld returned 1 exit status
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2014-07-17 20:59:03.152489041 +0000
-+++ git/Makefile	2014-07-17 20:59:19.020489473 +0000
-@@ -50,7 +50,7 @@
- LIBDIVECOMPUTERCFLAGS = -I$(LIBDIVECOMPUTERINCLUDES)
- LIBDIVECOMPUTER = $(LIBDIVECOMPUTERARCHIVE) $(LIBUSB)
- 
--LIBS = $(LIBXML2) $(LIBGTK) $(LIBDIVECOMPUTER) -lpthread
-+LIBS = $(LIBXML2) $(LIBGTK) $(LIBDIVECOMPUTER) -lpthread -lm
- 
- OBJS =	main.o dive.o profile.o info.o equipment.o divelist.o \
- 	parse-xml.o save-xml.o libdivecomputer.o print.o uemis.o \
diff --git a/meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch b/meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch
deleted file mode 100644
index 1f294fc..0000000
--- a/meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2014-07-17 20:53:23.620479788 +0000
-+++ git/Makefile	2014-07-17 20:56:07.992484267 +0000
-@@ -45,7 +45,7 @@
- # about it if it doesn't.
- LIBUSB = $(shell pkg-config --libs libusb-1.0 2> /dev/null)
- 
--LIBXML2 = $(shell xml2-config --libs)
-+LIBXML2 = $(shell pkg-config --libs libxml-2.0)
- LIBGTK = $(shell pkg-config --libs gtk+-2.0 glib-2.0 gconf-2.0)
- LIBDIVECOMPUTERCFLAGS = -I$(LIBDIVECOMPUTERINCLUDES)
- LIBDIVECOMPUTER = $(LIBDIVECOMPUTERARCHIVE) $(LIBUSB)
-@@ -71,7 +71,7 @@
- 	$(INSTALL) $(MANFILES) $(MANDIR)
- 
- parse-xml.o: parse-xml.c dive.h
--	$(CC) $(CFLAGS) `pkg-config --cflags glib-2.0` -c `xml2-config --cflags`  parse-xml.c
-+	$(CC) $(CFLAGS) `pkg-config --cflags glib-2.0` -c `pkg-config --cflags libxml-2.0`  parse-xml.c
- 
- save-xml.o: save-xml.c dive.h
- 	$(CC) $(CFLAGS) `pkg-config --cflags glib-2.0` -c save-xml.c
diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index fc50eb6..1edb19e 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -4,29 +4,18 @@ LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0 gconf"
 
-inherit gtk-icon-cache
+PNBLACKLIST[subsurface] = "Needs to be upgraded for compatibility with new libdivecomputer"
+
+inherit gtk-icon-cache cmake
 
 inherit gitpkgv
 PKGV = "${GITPKGVTAG}"
-PV = "1.1"
+PV = "4.2"
 
-SRCREV = "bd275d73ac06823619230915a3aa29deddc996fb"
-SRC_URI = "git://subsurface.hohndel.org/subsurface.git \
-           file://pkgconfig.patch \
-           file://libm.patch"
+SRCREV = "f61ee20ba356ecfc4c5b247f548f52d588179c94"
+SRC_URI = "git://subsurface.hohndel.org/subsurface.git"
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CC='${CC}' \
-                libdc-usr=${STAGING_INCDIR}/libdivecomputer/* \
-                LIBDIVECOMPUTERINCLUDES=${STAGING_INCDIR}/libdivecomputer \
-                LIBDIVECOMPUTERARCHIVE=${STAGING_LIBDIR}/libdivecomputer.a \
-"
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-    rm ${D}${datadir}/icons/hicolor/icon-theme.cache
-}
-
-FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/subsurface.svg"
+#FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/subsurface.svg"
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-iso8859-15"
 
-- 
2.1.1



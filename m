Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1B93273831
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 22:25:15 +0000 (UTC)
Received: by iecrp18 with SMTP id rp18so43391381iec.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fZFzTa0eYsxfthefHmhWcZjGwqmSZnSN0KND6xhJ6kw=;
	b=Wtexkkvu2kVI31SBHWDvwEIZzcMfvMmnaQj4NgrjBpQ1lDEabjsUqtgfhvgEazKdhI
	9tRLZG5YjcjAF2wy8I9oL6NBMRgPiTM7XA4lO/Qlvsti85q1Ia6G/4RqxZCh/8zOSM5K
	STxU20G6+uEhVxf2HnscGskDTeYglOg9tBrYL29FFM83JYkIXNa7cF/IA/ZO8EW+6C6R
	UPE81T2a/Qxn4j+noZllD2CWvZEgdnkZ0H5Gccs83dlfjqDLfsW4/3naey/Ykl+mXpWJ
	XYEtW09VY7jl2zP6PKBIxflmPxjhoFZy3uKESwkT6hyGx47Cx65wNi03NUgZc2iIc6VQ
	kMaw==
X-Received: by 10.50.43.168 with SMTP id x8mr18466742igl.28.1425248717155;
	Sun, 01 Mar 2015 14:25:17 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id d6sm6852297ioe.44.2015.03.01.14.25.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Mar 2015 14:25:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2015 22:25:07 +0000
Message-Id: <1425248708-4076-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
References: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/4] v4l-utils: RPROVIDE media-ctl
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
X-List-Received-Date: Sun, 01 Mar 2015 22:25:16 -0000

media-ctl recipe was subsumed into v4l-utils
but there are apps which still have rdeps on media-ctl

Change-Id: I7c24fec3752e80f67730150504b7192ad4fea0c4
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...a-ctl-Don-t-install-libmediactl-and-libv4.patch | 41 ++++++++++++++++++++++
 .../v4l-utils/export-mediactl-headers.patch        | 15 ++++++++
 .../v4l2apps/v4l-utils/mediactl-pkgconfig.patch    | 12 +++++++
 .../recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb | 16 +++++++--
 4 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
new file mode 100644
index 0000000..4b3de3c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
@@ -0,0 +1,41 @@
+From 4ee15a8a69b84526ece1180a288a37db077bcd9b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Feb 2015 21:55:36 +0000
+Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
+ libv4l2subdev"
+
+This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Conflicts:
+	utils/media-ctl/Makefile.am
+---
+ utils/media-ctl/Makefile.am | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
+index a3931fb..fe1fea5 100644
+--- a/utils/media-ctl/Makefile.am
++++ b/utils/media-ctl/Makefile.am
+@@ -1,14 +1,9 @@
+-noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
+-
++lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
+ libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
+-libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
+-libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
+-
++libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
++libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
+ libv4l2subdev_la_SOURCES = libv4l2subdev.c
+ libv4l2subdev_la_LIBADD = libmediactl.la
+-libv4l2subdev_la_CFLAGS = -static
+-libv4l2subdev_la_LDFLAGS = -static
+-
+ mediactl_includedir=$(includedir)/mediactl
+ noinst_HEADERS = mediactl.h v4l2subdev.h
+ 
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
new file mode 100644
index 0000000..c610e7e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
@@ -0,0 +1,15 @@
+Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+===================================================================
+--- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
++++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+@@ -4,8 +4,8 @@ libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS
+ libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
+ libv4l2subdev_la_SOURCES = libv4l2subdev.c
+ libv4l2subdev_la_LIBADD = libmediactl.la
+-mediactl_includedir=$(includedir)/mediactl
+-noinst_HEADERS = mediactl.h v4l2subdev.h
++otherincludedir = $(includedir)/mediactl
++otherinclude_HEADERS = mediactl.h v4l2subdev.h
+ 
+ pkgconfig_DATA = libmediactl.pc
+ bin_PROGRAMS = media-ctl
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
new file mode 100644
index 0000000..34fb3cf
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
@@ -0,0 +1,12 @@
+Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+===================================================================
+--- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
++++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+@@ -7,6 +7,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
+ mediactl_includedir=$(includedir)/mediactl
+ noinst_HEADERS = mediactl.h v4l2subdev.h
+ 
++pkgconfig_DATA = libmediactl.pc
+ bin_PROGRAMS = media-ctl
+ media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
+ media_ctl_LDADD = libmediactl.la libv4l2subdev.la
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index 219ed15..ba6e692 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -8,21 +8,31 @@ DEPENDS = "jpeg \
 
 inherit autotools gettext pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[mediactl] = "--enable-v4l-utils,--disable-v4l-utils,,"
 # libv4l was absorbed into this, let OE know that
-PROVIDES = "libv4l"
+PROVIDES = "libv4l media-ctl"
+PROVIDES += "${@base_contains('PACKAGECONFIG', 'mediactl', 'media-ctl', '', d)}"
+RPROVIDES_${PN} += "${@base_contains('PACKAGECONFIG', 'mediactl', 'media-ctl', '', d)}"
 
-SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2"
+SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
+           file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
+           file://mediactl-pkgconfig.patch \
+           file://export-mediactl-headers.patch \
+          "
 SRC_URI[md5sum] = "9cb3c178f937954e65bf30920af433ef"
 SRC_URI[sha256sum] = "d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
+PACKAGES =+ "media-ctl rc-keymaps libv4l libv4l-dbg libv4l-dev"
 
+FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
 FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
 FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
 FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
                  ${libdir}/libdvbv5*${SOLIBS} \
                  ${libdir}/libv4l/*-decomp"
+
 FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.1.4



Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlL1-0005rZ-Fb
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:42:51 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=c4lZ+icd0CwSvSYUsXE69/VzqmKnu3ahXYxEUW81twQ=;
	b=AIWF42h1zJxwctTxjYHQEgDhlGoX5FwPmQRHmaBM/ESOBQvYu+2HCbTBGL1XAjSVvV
	2HOUQsAsCdCDdsa358siVHKkqgQt+8AcSFMtBPHuScdruYbFsvn3sL5+A1bpGxQvLkpM
	wvayynLev70vk5mymFnimxnrO5ZB5eteQPfl0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ba7nZi1SZtAsZpRs1a3F7I+mMqyCCX4P2kN3GuTR6314WKWIShoipl37qnMmCGjHW6
	tnKRFgDS8/wJkBtFMJ7Q+PUvs3kvFohJIVc50vOWFlmDt7ri7PbdlpLAW5Bk7gLWKFQB
	XS0jWD8uIwOprpdpQWTQwRydYGzTvUJh4YbqQ=
Received: by 10.223.98.5 with SMTP id o5mr2663056fan.33.1305027607397;
	Tue, 10 May 2011 04:40:07 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c24sm2345814fak.31.2011.05.10.04.40.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:40:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:40:00 +0200
Message-Id: <7d981567a51e69b39500fe45e060c9f77aa93950.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/9] gst-plugins-base: drop 0.10.30 from meta-oe, there is 0.10.32 in oe-core
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
X-List-Received-Date: Tue, 10 May 2011 11:42:51 -0000

* gst-python needs at least 0.10.32
* http://lists.freedesktop.org/archives/gstreamer-bugs/2011-January/073592.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gst-plugins-base-tremor.patch                  |   17 --------
 .../gstreamer/gst-plugins-base_0.10.30.bb          |   22 ----------
 .../recipes-multimedia/gstreamer/gst-plugins.inc   |   41 --------------------
 3 files changed, 0 insertions(+), 80 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-base-0.10.30/gst-plugins-base-tremor.patch
 delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-base_0.10.30.bb
 delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins.inc

diff --git a/meta-oe/recipes-multimedia/gstreamer/gst-plugins-base-0.10.30/gst-plugins-base-tremor.patch b/meta-oe/recipes-multimedia/gstreamer/gst-plugins-base-0.10.30/gst-plugins-base-tremor.patch
deleted file mode 100644
index a6494fd..0000000
--- a/meta-oe/recipes-multimedia/gstreamer/gst-plugins-base-0.10.30/gst-plugins-base-tremor.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Remove -DTREMOR option since Tremor has dropped its internal
-libogg2, and gst-plugins-base has dependency on that.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN gst-plugins-base-0.10.30-orig/ext/vorbis/Makefile.am gst-plugins-base-0.10.30/ext/vorbis/Makefile.am
---- gst-plugins-base-0.10.30-orig/ext/vorbis/Makefile.am	2010-11-17 16:11:03.000000000 +0800
-+++ gst-plugins-base-0.10.30/ext/vorbis/Makefile.am	2010-11-17 16:12:41.000000000 +0800
-@@ -28,7 +28,7 @@
- libgstivorbisdec_la_SOURCES = gstivorbisdec.c \
- 	gstvorbisdec.c gstvorbisdeclib.c gstvorbiscommon.c
- libgstivorbisdec_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS) \
--	-DTREMOR $(IVORBIS_CFLAGS)
-+	$(IVORBIS_CFLAGS)
- libgstivorbisdec_la_LIBADD = \
- 	$(top_builddir)/gst-libs/gst/tag/libgsttag-@GST_MAJORMINOR@.la \
- 	$(top_builddir)/gst-libs/gst/audio/libgstaudio-@GST_MAJORMINOR@.la \
diff --git a/meta-oe/recipes-multimedia/gstreamer/gst-plugins-base_0.10.30.bb b/meta-oe/recipes-multimedia/gstreamer/gst-plugins-base_0.10.30.bb
deleted file mode 100644
index 9347ef4..0000000
--- a/meta-oe/recipes-multimedia/gstreamer/gst-plugins-base_0.10.30.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require gst-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
-                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
-
-DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis libxv libtheora"
-
-SRC_URI += " file://gst-plugins-base-tremor.patch"
-
-PR = "r2"
-
-inherit gettext
-
-EXTRA_OECONF += "--disable-freetypetest --disable-pango"
-
-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm -f ${S}/m4/lib-link.m4
-}
diff --git a/meta-oe/recipes-multimedia/gstreamer/gst-plugins.inc b/meta-oe/recipes-multimedia/gstreamer/gst-plugins.inc
deleted file mode 100644
index cd3e0a0..0000000
--- a/meta-oe/recipes-multimedia/gstreamer/gst-plugins.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Plugins for GStreamer"
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
-SECTION = "multimedia"
-PRIORITY = "optional"
-DEPENDS = "gstreamer"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2"
-
-EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-LIBV = "0.10"
-#FILES_${PN} += "${libdir}/gstreamer-${LIBV}/*.so"
-#FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/*.la ${libdir}/gstreamer-${LIBV}/*.a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
-
-PACKAGES_DYNAMIC = "${PN}-*"
-
-# orc.m4 calls pkg-config ----variable=orcc orc-0.4 to get the path to orcc,
-# resulting in /usr/bin/orcc. Force it to use the staged orcc.
-do_configure_append() {
- 	for i in $(find ${S} -name "Makefile") ; do
-		sed -i -e s:${bindir}/orcc:${STAGING_BINDIR_NATIVE}/orcc:g $i
- 	done
-}
-
-python populate_packages_prepend () {
-	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
-	postinst = bb.data.getVar('plugin_postinst', d, 1)
-
-#	Can't package separate debug packages yet
-#	do_split_packages(d, gst_libdir, '\.debug/libgst(.*)\.so$', bb.data.expand('${PN}-%s-dbg', d), 'GStreamer plugin for %s (with debugging symbols)', recursive=True, extra_depends=bb.data.expand('${PN}-dbg', d), match_path=True)
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
-}
-
-ALLOW_EMPTY = "1"
-- 
1.7.5.rc3




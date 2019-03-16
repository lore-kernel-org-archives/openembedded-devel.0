Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8976BCD6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 01:45:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id h34so7588075pgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 18:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2FCLLIA+2ngRWxSHcsQdpwpHmDjIutnVZJw6dvazBS4=;
	b=uRjiXrh57b0Hg0GLEjcCc3uflA05W3lNoVaSq4poQjs8UcphLcXejOOwgX4zxdAah/
	bnmF+9YGPrmM6+PZFV3jtanMU5pEgsObqBgfB29KmJYzQSoybzcPwc85WbpDuulMA01N
	JhsmNrjkdQGRCArKf/P/C7iodMzIXg++lmfdciMFxL0TM9pvrdVqQb0H6Gv++OFhtoWn
	3Mlj40SlJRM+mOST88CEdoL+K6GmPnwI/3Ha7v1B+UuWE02AbPxAzdM9y24IFO9sJFSV
	f6J+3hRwH0sc9LkiCRzslUzsTc64BK0bdkfUHctZ6KUutSXmhtC2+k5WZd7edOl4XgcE
	hIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2FCLLIA+2ngRWxSHcsQdpwpHmDjIutnVZJw6dvazBS4=;
	b=jNU3Pm7l/9UJi9KwlfPXLxG2wjNf+VYqASM/d4bmxlGQITXBucqjgxBesCej+Yi5A9
	Y+TVwEx3IY/qNLFO1+IayxbvDvXiYBvuIYk1ZBcVgyCDhbXWONZm8c6GsqMP5tXt3iWS
	nJY3MJ4CxvaBWZ9JMq+guqJMmMB1ysgBwklXQLuOLzqQL+8/stqq6iE/Y6Yfqopypj6S
	pwTkv0c8tUpNG/oOZVA1URH2s3v9KBw6OmgDizsTZl28ygwIdUbtyIwiFDrIHX9xVgOz
	63BMyU274vZnheDGGTCKMn2qcWKQbYpZYydjm/dKEfRusAzstiAZfB1CP650/PYeIXkZ
	6Ucg==
X-Gm-Message-State: APjAAAV/a1FER54jOMVwnHpoBY/JOKVJxa1l2ET2O3iJcd40HeuU8gLu
	nFkY+Gp1JQGvTP0aOsty1yw61LCI
X-Google-Smtp-Source: APXvYqyxBa/FCZFzC2s9E0CkgKts34aK7GAkaFuXDinADNFSrTBLr3fmug0/zkY+/27siVBh1cV2vA==
X-Received: by 2002:a62:484:: with SMTP id 126mr7088719pfe.91.1552700703921;
	Fri, 15 Mar 2019 18:45:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	d26sm4377527pfn.86.2019.03.15.18.45.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 18:45:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:44:45 -0700
Message-Id: <20190316014446.42828-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Mar 2019 12:41:25 +0000
Cc: Roland Krikava <rkrikava@gmail.com>, Shane Wang <shane.wang@intel.com>,
	Jeremy Stashluk <jstashluk@dekaresearch.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Sebastian Droege <sebastian.droege@collabora.co.uk>
Subject: [meta-multimedia][PATCH 1/2] gstreamer-0.10: Remove recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Mar 2019 01:45:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has been over 5+ years for migration to gstreamer 1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb |  14 -
 .../gst-fluendo-mpegdemux_0.10.85.bb          |  12 -
 .../gstreamer-0.10/gst-fluendo.inc            |  14 -
 .../gstreamer-0.10/gst-meta-base_0.10.bb      |  73 ---
 .../gstreamer-0.10/gst-openmax/gcc_4.6.patch  |  18 -
 .../gst-openmax/ptr-array.patch               |  46 --
 .../gstreamer-0.10/gst-openmax_0.10.1.bb      |  35 --
 .../gst-plugins-bad/buffer-overflow-mp4.patch |  36 --
 .../gstreamer-0.10/gst-plugins-bad_0.10.23.bb |  61 ---
 ...don-t-do-crazy-things-to-GLIB_CFLAGS.patch |  32 --
 ...x-build-on-x86-if-emmintrin.h-is-ava.patch |  37 --
 .../configure.ac-fix-subparse-plugin.patch    |  27 -
 .../gst-plugins-base-tremor.patch             |  20 -
 .../gst-plugins-base_0.10.36.bb               |  43 --
 ...itional-gl-framebuffer-undefined-use.patch |  35 --
 .../gst-plugins-gl/rpi-egl-gles2-dep.patch    |  22 -
 .../gstreamer-0.10/gst-plugins-gl_0.10.3.bb   |  29 --
 ...ith-recent-kernels-the-v4l2_buffer-i.patch |  33 --
 ...e-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |  45 --
 .../0407-mulawdec-fix-integer-overrun.patch   |  47 --
 .../gst-plugins-good_0.10.31.bb               |  47 --
 ...for-libcdio-s-recent-cd-text-api-cha.patch | 193 -------
 .../0002-Fix-opencore-include-paths.patch     |  58 ---
 .../gst-plugins-ugly_0.10.19.bb               |  35 --
 .../gstreamer-0.10/gst-plugins.inc            |  29 --
 ...d-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |  38 --
 .../gstreamer-0.10/gst-rtsp_0.10.8.bb         |  18 -
 ...lf-comparison-always-evaluates-to-tr.patch |  32 --
 ...rse-make-grammar.y-work-with-Bison-3.patch |  35 --
 ...don-t-do-crazy-things-to-GLIB_CFLAGS.patch |  32 --
 .../gstreamer-0.10.36/check_fix.patch         |  19 -
 .../gst-inspect-check-error.patch             |  16 -
 .../gstreamer-0.10.36/gstregistrybinary.c     | 487 ------------------
 .../gstreamer-0.10.36/gstregistrybinary.h     | 194 -------
 .../gstreamer-0.10/gstreamer_0.10.36.bb       |  50 --
 35 files changed, 1962 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4.6.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-array.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/check_fix.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.c
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.h
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
deleted file mode 100644
index 1e2cd2a4ab..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gst-fluendo.inc
-
-SUMMARY = "Fluendo closed-format mp3 GStreamer plug-in"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=259a43dd1c9854b71fc396f74699f4d2"
-LICENSE_FLAGS = "commercial"
-
-GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF += "${GSTREAMER_DEBUG} --with-gstreamer-api=0.10"
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-SRC_URI[md5sum] = "adf0390f3416bb72f91c358528be0c38"
-SRC_URI[sha256sum] = "dae0d0559a4e159c0dd92b7e18de059a5783f8d038904c7de4ca6393f7d55c7d"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
deleted file mode 100644
index 7bba41a341..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require gst-fluendo.inc
-
-SUMMARY = "Fluendo MPEG Transport Stream and Program Stream demuxer for GStreamer"
-LICENSE = "MPLv1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
-                    file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
-LICENSE_FLAGS = "commercial"
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-SRC_URI[md5sum] = "7c4fb993f80b9ae631b11897733f0970"
-SRC_URI[sha256sum] = "df04c91cc8e5d9a892c2492ed989974b4547beaa2a3647649e85113317897424"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
deleted file mode 100644
index 7a77d624f2..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Fluendo closed-format GStreamer plug-in"
-SECTION = "multimedia"
-HOMEPAGE = "https://core.fluendo.com/gstreamer/trac/wiki"
-DEPENDS = "gstreamer gst-plugins-base zlib"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://core.fluendo.com/gstreamer/src/${BPN}/${BPN}-${PV}.tar.bz2"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = "--disable-valgrind"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
deleted file mode 100644
index 88f1abf68a..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "GStreamer package groups"
-LICENSE = "MIT"
-
-COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"
-DEPENDS_UGLY="${@'gst-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
-DEPENDS_BAD="${@'gst-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
-DEPENDS = "gstreamer gst-plugins-base gst-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
-
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-
-PR = "r13"
-
-PACKAGES = "\
-    gst-meta-base \
-    gst-meta-x11-base \
-    gst-meta-audio \
-    gst-meta-debug \
-    gst-meta-video"
-
-ALLOW_EMPTY_gst-meta-base = "1"
-ALLOW_EMPTY_gst-meta-x11-base = "1"
-ALLOW_EMPTY_gst-meta-audio = "1"
-ALLOW_EMPTY_gst-meta-debug = "1"
-ALLOW_EMPTY_gst-meta-video = "1"
-
-RDEPENDS_gst-meta-base = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', '', d)} \
-    gstreamer \
-    gst-plugins-base-playbin \
-    gst-plugins-base-decodebin \
-    gst-plugins-base-decodebin2 \
-    gst-plugins-base-gio \
-    gst-plugins-base-alsa \
-    gst-plugins-base-volume \
-    gst-plugins-base-audioconvert \
-    gst-plugins-base-audioresample \
-    gst-plugins-base-typefindfunctions \
-    gst-plugins-base-videoscale \
-    gst-plugins-base-ffmpegcolorspace \
-    gst-plugins-good-autodetect \
-    gst-plugins-good-souphttpsrc"
-
-RRECOMMENDS_gst-meta-x11-base = "\
-    gst-plugins-base-ximagesink \
-    gst-plugins-base-xvimagesink"
-
-RDEPENDS_gst-meta-audio = "\
-    gst-meta-base \
-    gst-plugins-base-vorbis \
-    gst-plugins-base-ogg \
-    gst-plugins-good-wavparse \
-    gst-plugins-good-flac \
-    ${COMMERCIAL_AUDIO_PLUGINS}"
-
-
-RDEPENDS_gst-meta-debug = "\
-    gst-meta-base \
-    gst-plugins-good-debug \
-    gst-plugins-base-audiotestsrc \
-    gst-plugins-base-videotestsrc"
-
-
-RDEPENDS_gst-meta-video = "\
-    gst-meta-base \
-    gst-plugins-good-avi \
-    gst-plugins-good-matroska \
-    gst-plugins-base-theora \
-    ${COMMERCIAL_VIDEO_PLUGINS}"
-
-RRECOMMENDS_gst-meta-video = "\
-    gst-meta-audio"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4.6.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4.6.patch
deleted file mode 100644
index 57a63b5a0f..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4.6.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: gst-openmax-0.10.1/omx/gstomx.c
-===================================================================
---- gst-openmax-0.10.1.orig/omx/gstomx.c	2010-09-30 18:00:24.000000000 -0700
-+++ gst-openmax-0.10.1/omx/gstomx.c	2011-05-17 23:08:08.794535872 -0700
-@@ -238,7 +238,8 @@
-     const gchar *element_name = gst_structure_nth_field_name (element_table, i);
-     GstStructure *element = get_element_entry (element_name);
-     const gchar *type_name, *parent_type_name;
--    const gchar *component_name, *component_role, *library_name;
-+    const gchar *component_name, *library_name;
-+    const gchar __attribute__((__unused__)) *component_role;
-     GType type;
-     gint rank;
- 
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-array.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-array.patch
deleted file mode 100644
index 5965bbafbb..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-array.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Rename static functions that use GLib naming conventions as one of them
-(g_ptr_array_insert) has now been added to GLib.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/omx/gstomx_util.c b/omx/gstomx_util.c
-index 423e441..579dbf5 100644
---- a/omx/gstomx_util.c
-+++ b/omx/gstomx_util.c
-@@ -85,7 +85,7 @@ static gboolean initialized;
-  */
- 
- static void
--g_ptr_array_clear (GPtrArray * array)
-+omx_g_ptr_array_clear (GPtrArray * array)
- {
-   guint index;
-   for (index = 0; index < array->len; index++)
-@@ -93,7 +93,7 @@ g_ptr_array_clear (GPtrArray * array)
- }
- 
- static void
--g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
-+omx_g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
- {
-   if (index + 1 > array->len) {
-     g_ptr_array_set_size (array, index + 1);
-@@ -394,7 +394,7 @@ g_omx_core_unload (GOmxCore * core)
-   }
- 
-   core_for_each_port (core, g_omx_port_free);
--  g_ptr_array_clear (core->ports);
-+  omx_g_ptr_array_clear (core->ports);
- }
- 
- static inline GOmxPort *
-@@ -418,7 +418,7 @@ g_omx_core_new_port (GOmxCore * core, guint index)
-   }
- 
-   port = g_omx_port_new (core, index);
--  g_ptr_array_insert (core->ports, index, port);
-+  omx_g_ptr_array_insert (core->ports, index, port);
- 
-   return port;
- }
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
deleted file mode 100644
index 2e01579569..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "GStreamer plug-in for communication with OpenMAX IL components"
-DESCRIPTION = "GstOpenMAX is a GStreamer plug-in that allows \
-communication with OpenMAX Integration Layer (IL) components. OpenMAX \
-IL is an industry standard that provides an abstraction layer for \
-computer graphics, video, and sound routines."
-HOMEPAGE = "http://freedesktop.org/wiki/GstOpenMAX"
-DEPENDS = "gstreamer"
-RDEPENDS_${PN} = "libomxil"
-LICENSE = "LGPLv2.1"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://util/sem.h;beginline=1;endline=20;md5=accce5550d5583b839b441a0623f09fc"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.tar.bz2 \
-           file://gcc_4.6.patch \
-           file://ptr-array.patch \
-           "
-
-inherit autotools pkgconfig
-
-# Tell configure that this isn't a development snapshot so we don't want
-# -Werror (hopefully fixed in 0.10.2)
-export GST_CVS="no"
-
-EXTRA_OECONF += "--disable-valgrind"
-
-PR = "r4"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/libgstomx.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/libgstomx.la"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/libgstomx.a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug/"
-
-SRC_URI[md5sum] = "4d0370bfe99dea20918c84347abadb4e"
-SRC_URI[sha256sum] = "9074d5a0591995133d19cfb15144f19664f902c1623f996595695cf2c2070e1f"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
deleted file mode 100644
index 235acda8bf..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Description: Fix buffer overflow in mp4 parsing
-Author: Ralph Giles <giles@mozilla.com>
----
-Backport patch from debian to fix CVE-2015-0797.
-https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23-7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch
-
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
---- gst-plugins-bad0.10-0.10.23.orig/gst/videoparsers/gsth264parse.c
-+++ gst-plugins-bad0.10-0.10.23/gst/videoparsers/gsth264parse.c
-@@ -384,6 +384,11 @@ gst_h264_parse_wrap_nal (GstH264Parse *
- 
-   GST_DEBUG_OBJECT (h264parse, "nal length %d", size);
- 
-+  if (size > G_MAXUINT32 - nl) {
-+    GST_ELEMENT_ERROR (h264parse, STREAM, FAILED, (NULL),
-+        ("overflow in nal size"));
-+    return NULL;
-+  }
-   buf = gst_buffer_new_and_alloc (size + nl + 4);
-   if (format == GST_H264_PARSE_FORMAT_AVC) {
-     GST_WRITE_UINT32_BE (GST_BUFFER_DATA (buf), size << (32 - 8 * nl));
-@@ -452,6 +457,11 @@ gst_h264_parse_process_nal (GstH264Parse
-     GST_DEBUG_OBJECT (h264parse, "not processing nal size %u", nalu->size);
-     return;
-   }
-+  if (G_UNLIKELY (nalu->size > 20 * 1024 * 1024)) {
-+    GST_DEBUG_OBJECT (h264parse, "not processing nal size %u (too big)",
-+        nalu->size);
-+    return;
-+  }
- 
-   /* we have a peek as well */
-   nal_type = nalu->type;
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
deleted file mode 100644
index 38fccc8d01..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-require gst-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=629b0c7a665d155a6677778f4460ec06 \
-                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
-
-DEPENDS += "gst-plugins-base"
-
-PR = "r4"
-
-SRC_URI += "file://buffer-overflow-mp4.patch"
-
-inherit gettext gsettings
-
-EXTRA_OECONF += "--disable-experimental \
-                 --disable-sdl --disable-cdaudio --disable-directfb \
-                 --disable-vdpau --disable-apexsink"
-
-PACKAGECONFIG ??= "bzip curl \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'rsvg', '', d)}"
-
-PACKAGECONFIG[bzip] = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[rsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-PACKAGECONFIG[neon] = "--enable-neon,--disable-neon,neon"
-PACKAGECONFIG[mms] = "--enable-libmms,--disable-libmms,libmms"
-PACKAGECONFIG[cog] = "--enable-cog,--disable-cog,libpng"
-PACKAGECONFIG[faad] = "--enable-faad,--disable-faad,faad2"
-PACKAGECONFIG[jp2k] = "--enable-jp2k,--disable-jp2k,jasper"
-PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
-PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus"
-PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
-PACKAGECONFIG[vp8] = "--enable-vp8,--disable-vp8,libvpx"
-PACKAGECONFIG[ass] = "--enable-assrender,--disable-assrender,libass"
-PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
-PACKAGECONFIG[schro] = "--enable-schro,--disable-schro,schroedinger"
-PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
-PACKAGECONFIG[faac] = "--enable-faac,--disable-faac,faac"
-PACKAGECONFIG[rtmp] = "--enable-rtmp,--disable-rtmp,rtmpdump"
-PACKAGECONFIG[voamrwbenc] = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[voaacenc] = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
-PACKAGECONFIG[resindvd] = "--enable-resindvd,--disable-resindvd,libdvdnav libdvdread"
-PACKAGECONFIG[zbar] = "--enable-zbar,--disable-zbar,zbar jpeg"
-
-ARM_INSTRUCTION_SET = "arm"
-
-PACKAGES =+ "${PN}-resindvd"
-FILES_${PN}-resindvd = "${libdir}/gstreamer-${LIBV}/libresindvd.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/libresindvd.la"
-FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
-
-do_configure_prepend() {
-    # This m4 file contains nastiness which conflicts with libtool 2.2.2
-    rm ${S}/m4/lib-link.m4 || true
-}
-
-SRC_URI[md5sum] = "fcb09798114461955260e4d940db5987"
-SRC_URI[sha256sum] = "0eae7d1a1357ae8377fded6a1b42e663887beabe0e6cc336e2ef9ada42e11491"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
deleted file mode 100644
index 29fbec5f80..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5478eafecf618cd8e742cc1b96d688a2c7ce5a79 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 2 Oct 2016 21:49:33 +0200
-Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-we are definitely not one of those poor souls mentioned
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- common/m4/gst-glib2.m4 | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
-index b01f02f..4569ae5 100644
---- a/common/m4/gst-glib2.m4
-+++ b/common/m4/gst-glib2.m4
-@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
-   fi
- 
-   dnl for the poor souls who for example have glib in /usr/local
--  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
- 
-   AC_SUBST(GLIB_EXTRA_CFLAGS)
- ])
--- 
-2.5.5
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
deleted file mode 100644
index 52142562ab..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-audioresample: Fix build on x86 if emmintrin.h is available but can't be used
-
-On x86, EMMINTRIN is defined but not usable without SSE so check for
-__SSE__ and __SSE2__ as well.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=670690
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- gst/audioresample/resample.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
-index 98d006c..481fa01 100644
---- a/gst/audioresample/resample.c
-+++ b/gst/audioresample/resample.c
-@@ -77,13 +77,13 @@
- #define EXPORT G_GNUC_INTERNAL
- 
- #ifdef _USE_SSE
--#ifndef HAVE_XMMINTRIN_H
-+#if !defined(__SSE__) || !defined(HAVE_XMMINTRIN_H)
- #undef _USE_SSE
- #endif
- #endif
- 
- #ifdef _USE_SSE2
--#ifndef HAVE_EMMINTRIN_H
-+#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
- #undef _USE_SSE2
- #endif
- #endif
--- 
-1.7.1
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
deleted file mode 100644
index b8602c80d7..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Submitted [similar patch by other author, bugzilla]
-Bugtracker-URL: https://bugzilla.gnome.org/show_bug.cgi?id=663600
-
-Prepend PKG_CONFIG_SYSROOT to includedir, so configure doesn't
-search for gstconfig.h in /usr/include.
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
----
- configure.ac |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1901bcf..460fb0a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -435,7 +435,7 @@ AG_GST_CHECK_PLUGIN(volume)
- dnl check for gstreamer core features (subsystems)
- dnl FIXME: this assumes srcdir == builddir for uninstalled setups
- GST_CONFIGPATH=`$PKG_CONFIG --variable=includedir gstreamer-0.10`"/gst/gstconfig.h"
--AG_GST_PARSE_SUBSYSTEM_DISABLES($GST_CONFIGPATH)
-+AG_GST_PARSE_SUBSYSTEM_DISABLES($PKG_CONFIG_SYSROOT_DIR$GST_CONFIGPATH)
- AM_CONDITIONAL(USE_XML, test $GST_DISABLE_XML != "1")
- 
- dnl disable plug-ins that require libxml2's HTML support if it is not available
--- 
-1.7.5.4
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
deleted file mode 100644
index 99dbc9d52e..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Remove -DTREMOR option since Tremor has dropped its internal
-libogg2, and gst-plugins-base has dependency on that.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-diff -r 70065fb4e085 ext/vorbis/Makefile.am
---- a/ext/vorbis/Makefile.am	Tue Mar 13 16:36:56 2012 +0800
-+++ b/ext/vorbis/Makefile.am	Tue Mar 13 16:38:53 2012 +0800
-@@ -30,7 +30,7 @@
- 	gstvorbisdec.c gstvorbisdeclib.c gstvorbiscommon.c
- libgstivorbisdec_la_CFLAGS = \
- 	$(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS) \
--	-DTREMOR $(IVORBIS_CFLAGS)
-+	$(IVORBIS_CFLAGS)
- libgstivorbisdec_la_LIBADD = \
- 	$(top_builddir)/gst-libs/gst/tag/libgsttag-@GST_MAJORMINOR@.la \
- 	$(top_builddir)/gst-libs/gst/audio/libgstaudio-@GST_MAJORMINOR@.la \
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
deleted file mode 100644
index f2354648df..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-require gst-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
-                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
-
-DEPENDS += "alsa-lib libogg libvorbis libtheora util-linux tremor glib-2.0-native"
-
-SRC_URI += "file://gst-plugins-base-tremor.patch \
-            file://configure.ac-fix-subparse-plugin.patch \
-            file://audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch \
-            file://0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch \
-"
-
-SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
-SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
-
-PR = "r8"
-
-inherit gettext
-
-EXTRA_OECONF += "--disable-freetypetest"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
-PACKAGECONFIG[x11] = "--enable-x --enable-xvideo,--disable-x --disable-xvideo,virtual/libx11 libxv libsm libice"
-PACKAGECONFIG[cdparanoia] = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
-
-do_configure_prepend() {
-    # This m4 file contains nastiness which conflicts with libtool 2.2.2
-    rm -f ${S}/m4/lib-link.m4
-}
-
-FILES_${PN} += "${datadir}/${BPN}"
-
-CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-
-# /usr/bin/gst-visualise-0.10 is a perl script.
-RDEPENDS_${PN}-apps += "perl"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
deleted file mode 100644
index bc2f88b241..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 14d51cbefef19737e7ab2b6818ee1d3bdb248d12 Mon Sep 17 00:00:00 2001
-From: Jeremy Stashluk <jstashluk@dekaresearch.com>
-Date: Wed, 6 Feb 2013 09:59:48 -0500
-Subject: [PATCH] conditional gl framebuffer undefined use
-
-The OpenGL extension GL_ARB_framebuffer_object defines the macro
-GL_FRAMEBUFFER_UNDEFINED. The macro will only need to map to an error
-string if the extension provides functions that might return the macro.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
----
- gst-libs/gst/gl/gstgldisplay.c |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gst-libs/gst/gl/gstgldisplay.c b/gst-libs/gst/gl/gstgldisplay.c
-index 3ed0b71..64c6c2c 100644
---- a/gst-libs/gst/gl/gstgldisplay.c
-+++ b/gst-libs/gst/gl/gstgldisplay.c
-@@ -2177,9 +2177,11 @@ gst_gl_display_check_framebuffer_status (void)
-       GST_ERROR ("GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS");
-       break;
- 
-+#if defined(GL_ARB_framebuffer_object)
-     case GL_FRAMEBUFFER_UNDEFINED:
-       GST_ERROR ("GL_FRAMEBUFFER_UNDEFINED");
-       break;
-+#endif
- 
-     default:
-       GST_ERROR ("General FBO error");
--- 
-1.7.9.5
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
deleted file mode 100644
index 7db1c5afcc..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Check for header and library separately and check for GLESv2 before egl
-this is to overcome an annoying issue with rpi/userland where egl depends
-on sysmbols from libGLESv2
-
--Khem
-Index: gst-plugins-gl-0.10.3/configure.ac
-===================================================================
---- gst-plugins-gl-0.10.3.orig/configure.ac
-+++ gst-plugins-gl-0.10.3/configure.ac
-@@ -183,8 +183,10 @@ case $host in
-     else
-       AC_CHECK_HEADERS([EGL/egl.h], [HAVE_EGL=yes], [HAVE_EGL=no])
-       if test "x$HAVE_EGL" = "xyes"; then
--        AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h,, AC_MSG_ERROR([EGL is required]))
--        AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.h,, AC_MSG_ERROR([OpenGLES2 is required]))
-+        AC_CHECK_HEADERS([GLES2/gl2.h],, AC_MSG_ERROR([OpenGLES2 is required]))
-+        AC_CHECK_LIB(GLESv2,[glTexImage2D],, AC_MSG_ERROR([OpenGLES2 is required]))
-+        AC_CHECK_HEADERS([EGL/egl.h],, AC_MSG_ERROR([EGL is required]))
-+        AC_CHECK_LIB(EGL,[eglGetError],, AC_MSG_ERROR([EGL is required]))
-         GL_LIBS="$LIBS $X_LIBS -lEGL -lGLESv2"
-         GL_BACKEND=x11ES2
-         GL_TYPE=gles
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
deleted file mode 100644
index f3eaf30940..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require gst-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-SRC_URI[md5sum] = "ac70ede13f79978d56eaed8abaa3c938"
-SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
-
-SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch \
-             file://rpi-egl-gles2-dep.patch \
-"
-
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
-
-PR = "r4"
-
-inherit gettext distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-# This package doesn't have a configure switch for EGL or GL, so forcibly tell
-# configure that it can't find gl.h so it always uses EGL.  If/when we have some
-# way for machines to specify their preferred GL flavour this can be
-# automatically adapted.
-EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-apps = "1"
-ALLOW_EMPTY_${PN}-glib = "1"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
deleted file mode 100644
index 6456d3c6c2..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 12d18fe4e98e7c232d59b56d529a0521f293fe6d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 5 Sep 2012 18:54:42 +0200
-Subject: [PATCH] v4l2: fix build with recent kernels, the v4l2_buffer input
- field was removed
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-[1] http://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=9f2aa8d47f835ea155aaf635f618c0fc1ca87012
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- sys/v4l2/gstv4l2bufferpool.c |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
-index b81c6a4..51cc0ce 100644
---- a/sys/v4l2/gstv4l2bufferpool.c
-+++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint index, GstCaps * caps)
-     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
-         ret->vbuffer.m.offset);
-   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.length);
--  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input);
- 
-   data = (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
-       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
--- 
-1.7.6.5
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
deleted file mode 100644
index bd0de583a5..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ccb01de8096a32d86d47b0d92ec3416c57ee4d25 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Thu, 22 Aug 2013 12:15:54 -0400
-Subject: [PATCH] v4l2_calls: define V4L2_CID_HCENTER and V4L2_CID_VCENTER
-
-kernel commit 24b9f5017 [[media] V4L: Remove deprecated image centering controls]
-removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after three
-years of depreciation.
-
-The ioctl values are still free, and the case statement which processess them
-in v4l2 userspace falls through to the proper replacement. So in the short
-term, we can explicitly define them using the old absolute values, and everything
-will work.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- sys/v4l2/v4l2_calls.c |    9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
-index 309bfb6..3c64544 100644
---- a/sys/v4l2/v4l2_calls.c
-+++ b/sys/v4l2/v4l2_calls.c
-@@ -54,11 +54,16 @@
- #include "gst/gst-i18n-plugin.h"
- 
- /* Those are ioctl calls */
-+
-+/* V4L2_CID_HCENTER has been removed from the mainline kernel, but
-+   the ioctl space is still present. Since these values fall through
-+   to their replacement, it is safe (in the short term) to re-use the
-+    old values explictily */
- #ifndef V4L2_CID_HCENTER
--#define V4L2_CID_HCENTER V4L2_CID_HCENTER_DEPRECATED
-+#define V4L2_CID_HCENTER V4L2_CID_BASE+22
- #endif
- #ifndef V4L2_CID_VCENTER
--#define V4L2_CID_VCENTER V4L2_CID_VCENTER_DEPRECATED
-+#define V4L2_CID_VCENTER V4L2_CID_BASE+23
- #endif
- 
- GST_DEBUG_CATEGORY_EXTERN (v4l2_debug);
--- 
-1.7.10.4
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
deleted file mode 100644
index 48b8e98b81..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From ce94b2c2b91b6db190c121860e12a6afafce7ae1 Mon Sep 17 00:00:00 2001
-From: Roland Krikava <rkrikava@gmail.com>
-Date: Fri, 2 Nov 2012 12:38:44 -0400
-Subject: [PATCH 407/440] mulawdec: fix integer overrun
-
-There might be more than 65535 samples in a chunk of data.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=687469
-
-Commit - 3be45f70220310ec1c60d819f90b5f2ae03b5d83 in 0.10 branch
-
-Upstream Status:  Backported
-
-Signed-off-by: Roland Krikava <rkrikava@gmail.com>
----
- gst/law/mulaw-conversion.c |    6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gst/law/mulaw-conversion.c b/gst/law/mulaw-conversion.c
-index 8afae80..190a9f5 100644
---- a/gst/law/mulaw-conversion.c
-+++ b/gst/law/mulaw-conversion.c
-@@ -51,9 +51,10 @@ mulaw_encode (gint16 * in, guint8 * out, gint numsamples)
-     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
-     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
-   };
--  gint16 sign, exponent, mantissa, i;
-+  gint16 sign, exponent, mantissa;
-   gint16 sample;
-   guint8 ulawbyte;
-+  gint i;
- 
-   for (i = 0; i < numsamples; i++) {
-     sample = in[i];
-@@ -102,7 +103,8 @@ mulaw_decode (guint8 * in, gint16 * out, gint numsamples)
-   static gint16 exp_lut[8] = { 0, 132, 396, 924, 1980, 4092, 8316, 16764 };
-   gint16 sign, exponent, mantissa;
-   guint8 ulawbyte;
--  gint16 linear, i;
-+  gint16 linear;
-+  gint i;
- 
-   for (i = 0; i < numsamples; i++) {
-     ulawbyte = in[i];
--- 
-1.7.9.5
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
deleted file mode 100644
index f993cfc111..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-require gst-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
-                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-
-PR = "r8"
-
-PACKAGECONFIG ?= "jpeg v4l \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
-PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
-PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,libgudev"
-# sub-feature of v4l, but control separately since libv4l is not part of oe-core
-PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
-PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-PACKAGECONFIG[x11] = "--enable-x,--disable-x,virtual/libx11 libxfixes libxdamage"
-PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libiec61883 libavc1394"
-
-DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
-            speex libsoup-2.4 libcap"
-
-inherit gettext gconf
-
-SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
-            file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch \
-            file://0407-mulawdec-fix-integer-overrun.patch \
-"
-EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal \
-                 --disable-examples --disable-taglib"
-
-do_configure_prepend() {
-    # This m4 file contains nastiness which conflicts with libtool 2.2.2
-    rm ${S}/m4/lib-link.m4 || true
-}
-
-SRC_URI[md5sum] = "24f98a294a2b521e1b29412bdadae2e6"
-SRC_URI[sha256sum] = "7e27840e40a7932ef2dc032d7201f9f41afcaf0b437daf5d1d44dc96d9e35ac6"
-
-FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
-FILES_${PN}-equalizer += "${datadir}/gstreamer-0.10/presets/*.prs"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
deleted file mode 100644
index 1f72fc036c..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 649bd92cd2600719862ad5189899212409dd0a67 Mon Sep 17 00:00:00 2001
-From: Leon Merten Lohse <leon@green-side.de>
-Date: Thu, 3 May 2012 23:50:30 +0100
-Subject: [PATCH] cdio: compensate for libcdio's recent cd-text api changes
-
-https://bugzilla.gnome.org/show_bug.cgi?id=675112
-
-Conflicts:
-
-	ext/cdio/gstcdiocddasrc.c
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-
-Upstream-Status: Backport
----
- ext/cdio/gstcdio.c        | 35 ++++++++++++++++++++++++++++-------
- ext/cdio/gstcdio.h        | 16 ++++++++++++++++
- ext/cdio/gstcdiocddasrc.c | 19 +++++++++++++++++++
- 3 files changed, 63 insertions(+), 7 deletions(-)
-
-diff --git a/ext/cdio/gstcdio.c b/ext/cdio/gstcdio.c
-index 2f58d18..483ebf5 100644
---- a/ext/cdio/gstcdio.c
-+++ b/ext/cdio/gstcdio.c
-@@ -30,12 +30,16 @@
- GST_DEBUG_CATEGORY (gst_cdio_debug);
- 
- void
--gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext,
-+gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext, track_t track,
-     cdtext_field_t field, const gchar * gst_tag, GstTagList ** p_tags)
- {
-   const gchar *txt;
- 
-+#if LIBCDIO_VERSION_NUM > 83
-+  txt = cdtext_get_const (cdtext, field, track);
-+#else
-   txt = cdtext_get_const (field, cdtext);
-+#endif
-   if (txt == NULL || *txt == '\0') {
-     GST_DEBUG_OBJECT (src, "empty CD-TEXT field %u (%s)", field, gst_tag);
-     return;
-@@ -57,6 +61,12 @@ gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext,
- }
- 
- GstTagList *
-+#if LIBCDIO_VERSION_NUM > 83
-+gst_cdio_get_cdtext (GstObject * src, cdtext_t * t, track_t track)
-+{
-+  GstTagList *tags = NULL;
-+
-+#else
- gst_cdio_get_cdtext (GstObject * src, CdIo * cdio, track_t track)
- {
-   GstTagList *tags = NULL;
-@@ -67,14 +77,22 @@ gst_cdio_get_cdtext (GstObject * src, CdIo * cdio, track_t track)
-     GST_DEBUG_OBJECT (src, "no CD-TEXT for track %u", track);
-     return NULL;
-   }
-+#endif
- 
--  gst_cdio_add_cdtext_field (src, t, CDTEXT_PERFORMER, GST_TAG_ARTIST, &tags);
--  gst_cdio_add_cdtext_field (src, t, CDTEXT_TITLE, GST_TAG_TITLE, &tags);
-+  gst_cdio_add_cdtext_field (src, t, track, CDTEXT_FIELD_PERFORMER,
-+      GST_TAG_ARTIST, &tags);
-+  gst_cdio_add_cdtext_field (src, t, track, CDTEXT_FIELD_TITLE, GST_TAG_TITLE,
-+      &tags);
- 
-   return tags;
- }
- 
- void
-+#if LIBCDIO_VERSION_NUM > 83
-+gst_cdio_add_cdtext_album_tags (GstObject * src, cdtext_t * t,
-+    GstTagList * tags)
-+{
-+#else
- gst_cdio_add_cdtext_album_tags (GstObject * src, CdIo * cdio, GstTagList * tags)
- {
-   cdtext_t *t;
-@@ -84,11 +102,14 @@ gst_cdio_add_cdtext_album_tags (GstObject * src, CdIo * cdio, GstTagList * tags)
-     GST_DEBUG_OBJECT (src, "no CD-TEXT for album");
-     return;
-   }
-+#endif
- 
--  /* FIXME: map CDTEXT_PERFORMER to GST_TAG_ALBUM_ARTIST once we have that */
--  gst_cdio_add_cdtext_field (src, t, CDTEXT_TITLE, GST_TAG_ALBUM, &tags);
--  gst_cdio_add_cdtext_field (src, t, CDTEXT_GENRE, GST_TAG_GENRE, &tags);
--
-+  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_PERFORMER,
-+      GST_TAG_ALBUM_ARTIST, &tags);
-+  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_TITLE, GST_TAG_ALBUM,
-+      &tags);
-+  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_GENRE, GST_TAG_GENRE,
-+      &tags);
-   GST_DEBUG ("CD-TEXT album tags: %" GST_PTR_FORMAT, tags);
- }
- 
-diff --git a/ext/cdio/gstcdio.h b/ext/cdio/gstcdio.h
-index ef31ed0..c6da580 100644
---- a/ext/cdio/gstcdio.h
-+++ b/ext/cdio/gstcdio.h
-@@ -24,22 +24,38 @@
- #include <gst/gst.h>
- #include <cdio/cdio.h>
- #include <cdio/cdtext.h>
-+#include <cdio/version.h>
-+
-+#if LIBCDIO_VERSION_NUM <= 83
-+  #define CDTEXT_FIELD_PERFORMER CDTEXT_PERFORMER
-+  #define CDTEXT_FIELD_GENRE     CDTEXT_GENRE
-+  #define CDTEXT_FIELD_TITLE     CDTEXT_TITLE
-+#endif
- 
- GST_DEBUG_CATEGORY_EXTERN (gst_cdio_debug);
- #define GST_CAT_DEFAULT gst_cdio_debug
- 
- void     gst_cdio_add_cdtext_field (GstObject      * src,
-                                     cdtext_t       * cdtext,
-+                                    track_t          track,
-                                     cdtext_field_t   field,
-                                     const gchar    * gst_tag,
-                                     GstTagList    ** p_tags);
- 
- GstTagList  * gst_cdio_get_cdtext  (GstObject      * src,
-+#if LIBCDIO_VERSION_NUM > 83
-+                                    cdtext_t       * t,
-+#else
-                                     CdIo           * cdio,
-+#endif
-                                     track_t          track);
- 
- void      gst_cdio_add_cdtext_album_tags (GstObject  * src,
-+#if LIBCDIO_VERSION_NUM > 83
-+                                          cdtext_t   * t,
-+#else
-                                           CdIo       * cdio,
-+#endif
-                                           GstTagList * tags);
- 
- #endif /* __GST_CDIO_H__ */
-diff --git a/ext/cdio/gstcdiocddasrc.c b/ext/cdio/gstcdiocddasrc.c
-index 615a0c8..830839e 100644
---- a/ext/cdio/gstcdiocddasrc.c
-+++ b/ext/cdio/gstcdiocddasrc.c
-@@ -206,6 +206,9 @@ gst_cdio_cdda_src_open (GstAudioCdSrc * audiocdsrc, const gchar * device)
-   GstCdioCddaSrc *src;
-   discmode_t discmode;
-   gint first_track, num_tracks, i;
-+#if LIBCDIO_VERSION_NUM > 83
-+  cdtext_t *cdtext;
-+#endif
- 
-   src = GST_CDIO_CDDA_SRC (audiocdsrc);
- 
-@@ -244,8 +244,18 @@ gst_cdio_cdda_src_open (GstCddaBaseSrc * cddabasesrc, const gchar * device)
-   if (src->read_speed != -1)
-     cdio_set_speed (src->cdio, src->read_speed);
- 
-+#if LIBCDIO_VERSION_NUM > 83
-+  cdtext = cdio_get_cdtext (src->cdio);
-+
-+  if (NULL == cdtext)
-+    GST_DEBUG_OBJECT (src, "no CD-TEXT on disc");
-+  else
-+    gst_cdio_add_cdtext_album_tags (GST_OBJECT_CAST (src), cdtext,
-+        cddabasesrc->tags);
-+#else
-   gst_cdio_add_cdtext_album_tags (GST_OBJECT_CAST (src), src->cdio,
-       cddabasesrc->tags);
-+#endif
- 
-   GST_LOG_OBJECT (src, "%u tracks, first track: %d", num_tracks, first_track);
- 
-@@ -250,8 +263,14 @@ gst_cdio_cdda_src_open (GstAudioCdSrc * audiocdsrc, const gchar * device)
-      * the right thing here (for cddb id calculations etc. as well) */
-     track.start = cdio_get_track_lsn (src->cdio, i + first_track);
-     track.end = track.start + len_sectors - 1;  /* -1? */
-+#if LIBCDIO_VERSION_NUM > 83
-+    if (NULL != cdtext)
-+      track.tags = gst_cdio_get_cdtext (GST_OBJECT (src), cdtext,
-+          i + first_track);
-+#else
-     track.tags = gst_cdio_get_cdtext (GST_OBJECT (src), src->cdio,
-         i + first_track);
-+#endif
- 
-     gst_audio_cd_src_add_track (GST_AUDIO_CD_SRC (src), &track);
-   }
--- 
-2.1.0
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch
deleted file mode 100644
index 3fd6a26974..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From e634bc6420826f760f6519a9f134c6a4d3412ef8 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Mon, 19 Oct 2015 15:26:24 +0200
-Subject: [PATCH] Fix opencore include paths
-
-Upstream-Status: Inappropriate [no upstream - GStreamer 0.10 is no longer being maintained]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- ext/amrnb/amrnbdec.h    | 2 +-
- ext/amrnb/amrnbenc.h    | 2 +-
- ext/amrwbdec/amrwbdec.h | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/ext/amrnb/amrnbdec.h b/ext/amrnb/amrnbdec.h
-index 1e81839..01b7154 100644
---- a/ext/amrnb/amrnbdec.h
-+++ b/ext/amrnb/amrnbdec.h
-@@ -22,7 +22,7 @@
- 
- #include <gst/gst.h>
- #include <gst/audio/gstaudiodecoder.h>
--#include <interf_dec.h>
-+#include <opencore-amrnb/interf_dec.h>
- 
- G_BEGIN_DECLS
- 
-diff --git a/ext/amrnb/amrnbenc.h b/ext/amrnb/amrnbenc.h
-index 7f673ac..5be39b5 100644
---- a/ext/amrnb/amrnbenc.h
-+++ b/ext/amrnb/amrnbenc.h
-@@ -21,7 +21,7 @@
- #define __GST_AMRNBENC_H__
- 
- #include <gst/gst.h>
--#include <interf_enc.h>
-+#include <opencore-amrnb/interf_enc.h>
- #include <gst/audio/gstaudioencoder.h>
- 
- G_BEGIN_DECLS
-diff --git a/ext/amrwbdec/amrwbdec.h b/ext/amrwbdec/amrwbdec.h
-index c3528fc..f27c6d2 100644
---- a/ext/amrwbdec/amrwbdec.h
-+++ b/ext/amrwbdec/amrwbdec.h
-@@ -22,8 +22,8 @@
- 
- #include <gst/gst.h>
- #include <gst/audio/gstaudiodecoder.h>
--#include <dec_if.h>
--#include <if_rom.h>
-+#include <opencore-amrwb/dec_if.h>
-+#include <opencore-amrwb/if_rom.h>
- 
- G_BEGIN_DECLS
- 
--- 
-1.9.1
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
deleted file mode 100644
index 199b47d762..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require gst-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://gst/synaesthesia/synaescope.h;beginline=1;endline=20;md5=99f301df7b80490c6ff8305fcc712838 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 \
-                    file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
-
-DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r3"
-
-inherit gettext
-
-EXTRA_OECONF += "--with-plugins=a52dec,lame,id3tag,mad,mpeg2dec,mpegstream,mpegaudioparse,asfdemux,realmedia \
-                 --disable-orc"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[x264] = "--enable-x264,--disable-x264,x264"
-PACKAGECONFIG[cdio] = "--enable-cdio,--disable-cdio,libcdio"
-PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread,libdvdread"
-PACKAGECONFIG[amrnb] = "--enable-amrnb,--disable-amrnb,opencore-amr"
-PACKAGECONFIG[amrwb] = "--enable-amrwb,--disable-amrwb,opencore-amr"
-
-do_configure_prepend() {
-    # This m4 file contains nastiness which conflicts with libtool 2.2.2
-    rm ${S}/m4/lib-link.m4 || true
-}
-
-SRC_URI[md5sum] = "1d81c593e22a6cdf0f2b4f57eae93df2"
-SRC_URI[sha256sum] = "1ca90059275c0f5dca71d4d1601a8f429b7852baed0723e820703b977e2c8df0"
-SRC_URI += "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch \
-            file://0002-Fix-opencore-include-paths.patch"
-
-FILES_${PN}-amrnb += "${datadir}/gstreamer-0.10/presets/GstAmrnbEnc.prs"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
deleted file mode 100644
index 6e163a8c49..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Plugins for the GStreamer multimedia framework"
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
-SECTION = "multimedia"
-DEPENDS = "gstreamer"
-
-# gobject-introspection to get --disable-introspection into UNKNOWN_CONFIGURE_WHITELIST
-inherit autotools pkgconfig gobject-introspection
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
-
-GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_DEBUG} --disable-examples --disable-introspection"
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-LIBV = "0.10"
-require recipes-multimedia/gstreamer/gst-plugins-package.inc
-
-PACKAGES_DYNAMIC += "^${PN}-.*"
-
-# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
-# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
-oe_runconf_prepend() {
-    if [ -e ${S}/po/Makefile.in.in ]; then
-        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
-    fi
-}
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
deleted file mode 100644
index 69b21dd874..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-index gst-rtsp_0.10.8/bindings/python/Makefile.am
-Index: gst-rtsp-0.10.8/bindings/python/Makefile.am
-===================================================================
---- gst-rtsp-0.10.8.orig/bindings/python/Makefile.am
-+++ gst-rtsp-0.10.8/bindings/python/Makefile.am
-@@ -14,7 +14,7 @@ defs_DATA = $(DEFS)
- defsdir = $(pkgdatadir)/$(GST_MAJORMINOR)/defs
- OVERRIDES = rtspserver.override
- 
--INCLUDES = -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
-+AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
- 
- rtspserver_la_CFLAGS = -I$(top_srcdir)/src \
- 		$(PYGOBJECT_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
-Index: gst-rtsp-0.10.8/examples/Makefile.am
-===================================================================
---- gst-rtsp-0.10.8.orig/examples/Makefile.am
-+++ gst-rtsp-0.10.8/examples/Makefile.am
-@@ -1,6 +1,6 @@
- noinst_PROGRAMS = test-video test-ogg test-mp4 test-readme test-launch test-sdp test-uri test-auth
- 
--INCLUDES = -I$(top_srcdir) -I$(srcdir)
-+AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir)
- 
- AM_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
- AM_LDFLAGS = \
-Index: gst-rtsp-0.10.8/tests/Makefile.am
-===================================================================
---- gst-rtsp-0.10.8.orig/tests/Makefile.am
-+++ gst-rtsp-0.10.8/tests/Makefile.am
-@@ -1,6 +1,6 @@
- noinst_PROGRAMS = test-cleanup
- 
--INCLUDES = -I$(top_srcdir) -I$(srcdir)
-+AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir)
- 
- AM_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
- AM_LDFLAGS = \
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
deleted file mode 100644
index b78bcaf5ac..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "GStreamer RTSP server"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch"
-SRC_URI[md5sum] = "b511af07000595f63c3a705946221643"
-SRC_URI[sha256sum] = "9915887cf8515bda87462c69738646afb715b597613edc7340477ccab63a6617"
-
-DEPENDS = "gst-plugins-base gstreamer"
-
-EXTRA_OECONF = "--disable-introspection"
-
-# Configure always checks for Python so inherit pythonnative. Better solution
-# would be to disable the checks entirely.
-inherit autotools pythonnative gettext
-
-FILES_${PN}-dev += "${datadir}/vala/vapi/"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
deleted file mode 100644
index d07749682b..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ed7f4802222234eef192aa3f74bc92268f338f97 Mon Sep 17 00:00:00 2001
-From: Sebastian Droege <sebastian.droege@collabora.co.uk>
-Date: Tue, 6 Mar 2012 12:28:02 +0100
-Subject: [PATCH] baseparse: Fix 'self-comparison always evaluates to true'
-
-This was really a bug.
-
-Commit is ed7f4802222234eef192aa3f74bc92268f338f97 in 0.10 branch
-
-Upstream Status:  Backported
-
-Signed-off-by: Sebastian Droege <sebastian.droege@collabora.co.uk>
----
- libs/gst/base/gstbaseparse.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
-index 851ec1d..108ee89 100644
---- a/libs/gst/base/gstbaseparse.c
-+++ b/libs/gst/base/gstbaseparse.c
-@@ -3899,7 +3899,7 @@ gst_base_parse_handle_seek (GstBaseParse * parse, GstEvent * event)
-        seek event (in bytes) to upstream. Segment / flush handling happens
-        in corresponding src event handlers */
-     GST_DEBUG_OBJECT (parse, "seek in PUSH mode");
--    if (seekstop >= 0 && seekpos <= seekpos)
-+    if (seekstop >= 0 && seekstop <= seekpos)
-       seekstop = seekpos;
-     new_event = gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
-         GST_SEEK_TYPE_SET, seekpos, stop_type, seekstop);
--- 
-1.7.9.5
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
deleted file mode 100644
index dc2d606122..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 60516f4798894f958fc53b470e1283318d0f8706 Mon Sep 17 00:00:00 2001
-From: Kerrick Staley <kerrick@kerrickstaley.com>
-Date: Tue, 20 Aug 2013 23:59:29 -0700
-Subject: [PATCH 1/2] parse: make grammar.y work with Bison 3
-
-YYLEX_PARAM is no longer supported in Bison 3.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=706462
----
- gst/parse/grammar.y | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
-index 24fc87b..7f9dd16 100644
---- a/gst/parse/grammar.y
-+++ b/gst/parse/grammar.y
-@@ -26,7 +26,6 @@
-  */
- 
- #define YYERROR_VERBOSE 1
--#define YYLEX_PARAM scanner
- 
- #define YYENABLE_NLS 0
- 
-@@ -648,6 +647,7 @@ static int yyerror (void *scanner, graph_t *graph, const char *s);
- %right '.'
- %left '!' '='
- 
-+%lex-param { void *scanner }
- %parse-param { void *scanner }
- %parse-param { graph_t *graph }
- %pure-parser
--- 
-2.7.2
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
deleted file mode 100644
index 8db3966313..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4b145ceb22bbce7ba6e209c6ab61f2d5867e69f9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 1 Nov 2016 19:02:30 +0100
-Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-we are definitely not one of those poor souls mentioned
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- common/m4/gst-glib2.m4 | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
-index b01f02f..4569ae5 100644
---- a/common/m4/gst-glib2.m4
-+++ b/common/m4/gst-glib2.m4
-@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
-   fi
- 
-   dnl for the poor souls who for example have glib in /usr/local
--  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
- 
-   AC_SUBST(GLIB_EXTRA_CFLAGS)
- ])
--- 
-2.5.5
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/check_fix.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/check_fix.patch
deleted file mode 100644
index 5d8bb13403..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/check_fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-# gstreamer: Fix a problem with configure if check has already been built
-# Richard Purdie <rpurdie@linux.intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-diff -urN gstreamer-0.10.29-orig/configure.ac gstreamer-0.10.29/configure.ac
---- gstreamer-0.10.29-orig/configure.ac	2010-06-26 12:49:27.774930773 +0800
-+++ gstreamer-0.10.29/configure.ac	2010-06-26 12:51:12.899200233 +0800
-@@ -543,8 +543,10 @@
-       *) BUILD_CHECK=yes ;;
-     esac
- ])
-+
- dnl bit of a misnomer, but keep the conditional named like this so we don't
- dnl have to change too much elsewhere
-+HAVE_CHECK=no
- AM_CONDITIONAL(HAVE_CHECK, test "x$BUILD_CHECK" = "xyes")
- 
- dnl configure the desired buffer alignment
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch
deleted file mode 100644
index 30be85f59d..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-# Fix crash with gst-inspect
-# Chris Lord <chris@openedhand.com>
-
-Upstream-Status: Pending
-
---- gstreamer-0.10.9/tools/gst-inspect.c.old	2006-09-12 11:56:53.000000000 +0100
-+++ gstreamer-0.10.9/tools/gst-inspect.c	2006-09-12 11:57:27.000000000 +0100
-@@ -1123,7 +1123,7 @@
-   g_option_context_add_main_entries (ctx, options, GETTEXT_PACKAGE);
-   g_option_context_add_group (ctx, gst_init_get_option_group ());
-   if (!g_option_context_parse (ctx, &argc, &argv, &err)) {
--    g_print ("Error initializing: %s\n", err->message);
-+    g_print ("Error initializing: %s\n", err ? err->message : "(null)");
-     exit (1);
-   }
-   g_option_context_free (ctx);
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.c b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.c
deleted file mode 100644
index c1f3e71af6..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.c
+++ /dev/null
@@ -1,487 +0,0 @@
-/* GStreamer
- * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
- *                    2000 Wim Taymans <wtay@chello.be>
- *                    2005 David A. Schleef <ds@schleef.org>
- *
- * gstregistryxml.c: GstRegistry object, support routines
- *
- * This library is free software; you can redistribute it and/or
- * modify it ulnder the terms of the GNU Library General Public
- * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Library General Public License for more details.
- *
- * You should have received a copy of the GNU Library General Public
- * License along with this library; if not, write to the
- * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
- * Boston, MA 02111-1307, USA.
- */
-
-
-#include <gst/gstregistrybinary.h>
-
-/*
-** Simple handy function to write a memory location to the registry cache file
-*/
-inline static gboolean
-gst_registry_binary_write(GstRegistry *registry, const void *mem, const ssize_t size)
-{
-  if (write(registry->cache_file, mem, size) != size)
-    {
-      GST_ERROR("Failed to write binary registry element: ptr=%p size=%u error=%s\n",
-		mem, size, strerror(errno));
-      return FALSE;
-    }
-  return TRUE;
-}
-
-/*
-** Save features GstBinary style
-*/
-static gboolean 
-gst_registry_binary_fill_feature(GList **list, GstPluginFeature *orig, GstBinaryPluginFeature *dest, const char *name)
-{
-  GstBinaryChunck *chk;
-
-  if ((chk = calloc(1, sizeof (GstBinaryChunck))) == NULL)
-    return FALSE;
-
-  chk->data = dest;
-  chk->size = sizeof (GstBinaryPluginFeature);
-
-  *list = g_list_append(*list, chk);
-
-  dest->rank = orig->rank;
-  if (!strncpy(dest->typename, name, GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN) ||
-      !strncpy(dest->name, orig->name, GST_BINARY_REGISTRY_TYPENAME_NAME_LEN))
-    {
-      GST_ERROR("Failed to write binary registry feature");
-      goto fail;
-    }
-  
-  if (GST_IS_ELEMENT_FACTORY(orig))
-    {
-      GstElementFactory *factory = GST_ELEMENT_FACTORY(orig);
-      
-      if (!strncpy(dest->longname, factory->details.longname, GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN) ||
-	  !strncpy(dest->class, factory->details.klass, GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN) ||
-	  !strncpy(dest->description, factory->details.description, GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN) ||
-	  !strncpy(dest->author, factory->details.author, GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN))
-	{
-	  GST_ERROR("Failed to write binary registry feature");
-	  goto fail;
-	}
-    }
-  
-  dest->npadtemplates = dest->ninterfaces = dest->nuritypes = 0;
-  return TRUE;
-
- fail:
-  free(chk);
-  return FALSE;
-}
-
-
-/*
-** Initialize the GstBinaryRegistryMagic, setting both our magic number and gstreamer major/minor version
-*/
-inline static gboolean
-gst_registry_binary_initialize_magic(GstBinaryRegistryMagic *m)
-{
-  if (!strncpy(m->magic, GST_MAGIC_BINARY_REGISTRY_STR, GST_MAGIC_BINARY_REGISTRY_LEN) ||
-      !strncpy(m->version, GST_MAJORMINOR, GST_BINARY_REGISTRY_VERSION_LEN))
-    {
-      GST_ERROR("Failed to write magic to the registry magic structure");
-      return FALSE;
-    }
-  return TRUE;
-}
-
-/*
-** Check GstBinaryRegistryMagic validity.
-** Return a pointer pointing right after the magic structure
-*/
-static gchar *
-gst_registry_binary_check_magic(gchar *in)
-{
-  GstBinaryRegistryMagic *m = (GstBinaryRegistryMagic *) in;
-
-  if (m == NULL || m->magic == NULL || m->version == NULL)
-    {
-      GST_ERROR("Binary registry magic structure is broken");
-      return NULL;
-    }
-  if (strncmp(m->magic, GST_MAGIC_BINARY_REGISTRY_STR, GST_MAGIC_BINARY_REGISTRY_LEN) != 0)
-    {
-      GST_ERROR("Binary registry magic is different : %02x%02x%02x%02x != %02x%02x%02x%02x",
-		GST_MAGIC_BINARY_REGISTRY_STR[0] & 0xff, GST_MAGIC_BINARY_REGISTRY_STR[1] & 0xff,
-		GST_MAGIC_BINARY_REGISTRY_STR[2] & 0xff, GST_MAGIC_BINARY_REGISTRY_STR[3] & 0xff,
-		m->magic[0] & 0xff, m->magic[1] & 0xff, m->magic[2] & 0xff, m->magic[3] & 0xff);
-      return NULL;
-    }
-  if (strncmp(m->version, GST_MAJORMINOR, GST_BINARY_REGISTRY_VERSION_LEN))
-    {
-      GST_ERROR("Binary registry magic version is different : %s != %s",
-		GST_MAJORMINOR, m->version);
-      return NULL;
-    }
-  return (in + sizeof (GstBinaryRegistryMagic));
-}
-
-/*
-** Adapt a GstPlugin to our GstBinaryPluginElement structure, and write it to the 
-** registry file.
-*/   
-static gboolean
-gst_registry_binary_save_plugin(GList **list, GstRegistry *registry, GstPlugin *plugin)
-{
-  GstBinaryPluginElement *e;
-  GstBinaryChunck *chk;
-  GList *walk;
-
-  if ((e = calloc(1, sizeof (GstBinaryPluginElement))) == NULL ||
-      (chk = calloc(1, sizeof (GstBinaryChunck))) == NULL)
-    return FALSE;
-
-  chk->data = e;
-  chk->size = sizeof (GstBinaryPluginElement);
-  *list = g_list_append(*list, chk);
-
-  if (!strncpy(e->name, plugin->desc.name, GST_BINARY_REGISTRY_NAME_LEN)		       	||
-      !strncpy(e->description, plugin->desc.description, GST_BINARY_REGISTRY_DESCRIPTION_LEN)	||
-      !strncpy(e->filename, plugin->filename, _POSIX_PATH_MAX)					||
-      !strncpy(e->version, plugin->desc.version, GST_BINARY_REGISTRY_VERSION_LEN)		||
-      !strncpy(e->license, plugin->desc.license, GST_BINARY_REGISTRY_LICENSE_LEN)		||
-      !strncpy(e->source, plugin->desc.source, GST_BINARY_REGISTRY_SOURCE_LEN)			||
-      !strncpy(e->package, plugin->desc.package, GST_BINARY_REGISTRY_PACKAGE_LEN)		||
-      !strncpy(e->origin, plugin->desc.origin, GST_BINARY_REGISTRY_ORIGIN_LEN))
-    {
-      GST_DEBUG("Can't adapt GstPlugin to GstBinaryPluginElement");
-      goto fail;
-    }
-
-  e->size = plugin->file_size;
-  e->m32p = plugin->file_mtime;
-  
-  GList *ft_list = gst_registry_get_feature_list_by_plugin(registry, plugin->desc.name);
-
-  for (walk = ft_list; walk; walk = g_list_next(walk), e->nfeatures++)
-    {
-      GstPluginFeature *curfeat = GST_PLUGIN_FEATURE (walk->data);
-      GstBinaryPluginFeature *newfeat;
-      const char *feat_name = g_type_name(G_OBJECT_TYPE(curfeat));
-      
-      if ((newfeat = calloc(1, sizeof (GstBinaryPluginFeature))) == NULL)
-	  goto fail;
-
-      if (!feat_name || !gst_registry_binary_fill_feature(list, curfeat, newfeat, feat_name))
-	{
-	  GST_ERROR("Can't fill plugin feature, aborting.");
-	  goto fail;
-	}
-    }
-
-  GST_DEBUG("Found %d features in plugin \"%s\"\n", e->nfeatures, e->name);
-  return TRUE;
-
- fail:
-  free(chk);
-  free(e);
-  return FALSE;
-}
-
-/*
-** Write the cache to file. Part of the code was taken from gstregistryxml.c
-*/
-gboolean 
-gst_registry_binary_write_cache(GstRegistry *registry, const char *location)
-{
-  GList *walk;
-  char *tmp_location;
-  GstBinaryRegistryMagic *magic;
-  GstBinaryChunck *magic_chunck;
-  GList *to_write = NULL;
- 
-  GST_INFO("Writing binary registry cache");
-
-  g_return_val_if_fail (GST_IS_REGISTRY (registry), FALSE);
-  tmp_location = g_strconcat (location, ".tmpXXXXXX", NULL);
-  registry->cache_file = g_mkstemp (tmp_location);
-  if (registry->cache_file == -1)
-    {
-      char *dir;
-
-      /* oops, I bet the directory doesn't exist */
-      dir = g_path_get_dirname (location);
-      g_mkdir_with_parents (dir, 0777);
-      g_free (dir);
-      
-      registry->cache_file = g_mkstemp (tmp_location);
-    }
-
-  if (registry->cache_file == -1)
-    goto fail;
-
-  if ((magic = calloc(1, sizeof (GstBinaryRegistryMagic))) == NULL ||
-      !gst_registry_binary_initialize_magic(magic))
-    goto fail;
-
-  if ((magic_chunck = calloc(1, sizeof (GstBinaryChunck))) == NULL)
-    goto fail;
-
-  magic_chunck->data = magic;
-  magic_chunck->size = sizeof (GstBinaryRegistryMagic);
-  to_write = g_list_append(to_write, magic_chunck); 
-
-  /* Iterate trough the list of plugins in the GstRegistry and adapt them to our structures */
-  for (walk = g_list_last(registry->plugins); walk; walk = g_list_previous(walk))
-    {
-      GstPlugin *plugin = GST_PLUGIN(walk->data);
-      
-      if (!plugin->filename)
-	continue;
-	  
-      if (plugin->flags & GST_PLUGIN_FLAG_CACHED)
-	{
-	  int ret;
-	  struct stat statbuf;
-	  
-	  ret = g_stat (plugin->filename, &statbuf);
-	  if ((ret = g_stat (plugin->filename, &statbuf)) < 0 	||
-	      plugin->file_mtime != statbuf.st_mtime		||
-	      plugin->file_size != statbuf.st_size)
-	    continue;
-	}
-
-      if (!gst_registry_binary_save_plugin(&to_write, registry, plugin))
-	{
-	  GST_ERROR("Can't write binary plugin information for \"%s\"", plugin->filename);
-	  continue; /* Try anyway */
-	}
-    }
-
-  for (walk = g_list_first(to_write); walk; walk = g_list_next(walk))
-    {
-      GstBinaryChunck *cur = walk->data;
-
-      if (!gst_registry_binary_write(registry, cur->data, cur->size))
-	{
-	  free(cur->data);
-	  free(cur);
-	  g_list_free(to_write);
-	  goto fail;
-	}
-      free(cur->data);
-      free(cur);
-    }
-  g_list_free(to_write);
-
-  if (close(registry->cache_file) < 0)
-    {
-      GST_DEBUG("Can't close registry file : %s", strerror(errno));
-      goto fail;
-    }
-  
-  if (g_file_test (tmp_location, G_FILE_TEST_EXISTS)) {
-#ifdef WIN32
-    remove (location);
-#endif
-    rename (tmp_location, location);
-  }
-
-  g_free (tmp_location);
-  return TRUE;
-
- fail:
-  g_free(tmp_location);
-  return FALSE;
-}
-
-static GstPluginFeature*
-gst_registry_binary_load_feature(GstBinaryPluginFeature *in)
-{
-  GstPluginFeature *feature;
-  GType type;
-
-  if (!in->typename || !*(in->typename))
-    return NULL;
-
-  /*  GST_INFO("Plugin feature typename : %s", in->typename);*/
-
-  if (!(type = g_type_from_name(in->typename)))
-    {
-      GST_ERROR("Unknown type from typename");
-      return NULL;
-    }
-  feature = g_object_new (type, NULL);
-
-  if (!feature) {
-    GST_ERROR("Can't create feature from type");
-    return NULL;
-  }
-
-  if (!GST_IS_PLUGIN_FEATURE (feature)) {
-    /* don't really know what it is */
-    if (GST_IS_OBJECT (feature))
-      gst_object_unref (feature);
-    else
-      g_object_unref (feature);
-    return NULL;
-  }
-
-  feature->name = g_strdup(in->name);
-  feature->rank = in->rank;
-
-  if (GST_IS_ELEMENT_FACTORY(feature))
-    {
-      GstElementFactory *factory = GST_ELEMENT_FACTORY(feature);
-
-      factory->details.longname = g_strdup(in->longname);
-      factory->details.klass = g_strdup(in->class);
-      factory->details.description = g_strdup(in->description);
-      factory->details.author = g_strdup(in->author);
-
-      /*      GST_INFO("Element factory : %s", factory->details.longname); */
-    }
-
-  GST_DEBUG("Added feature %p with name %s", feature, feature->name);
-  return feature;
-}
-
-/*
-** Make a new plugin from current GstBinaryPluginElement structure
-** and save it to the GstRegistry. Return an offset to the next
-** GstBinaryPluginElement structure.
-*/
-static unsigned long
-gst_registry_binary_get_binary_plugin(GstRegistry *registry, gchar *in)
-{
-  GstBinaryPluginElement *p = (GstBinaryPluginElement *) in;
-  GstPlugin *plugin = NULL;
-  GList *plugin_features = NULL;
-  GstBinaryPluginFeature *feat;
-  unsigned int i;
-  unsigned long offset;
-
-  plugin = g_object_new (GST_TYPE_PLUGIN, NULL);
-
-  plugin->flags |= GST_PLUGIN_FLAG_CACHED;
-
-  plugin->desc.name = g_strdup(p->name);
-  plugin->desc.description= g_strdup(p->description);
-  plugin->filename = g_strdup(p->filename);
-  plugin->desc.version = g_strdup(p->version);
-  plugin->desc.license = g_strdup(p->license);
-  plugin->desc.source = g_strdup(p->source);
-  plugin->desc.package = g_strdup(p->package);
-  plugin->desc.origin = g_strdup(p->origin);
-  plugin->file_mtime = p->m32p;
-  plugin->file_size = p->size;
-  plugin->basename = g_path_get_basename (plugin->filename);
-
-  if (plugin->file_mtime < 0 || plugin->file_size < 0)
-    {
-      GST_ERROR("Plugin time or file size is not valid !");
-      g_free(plugin);
-      return -1;
-    }
-
-  if (p->nfeatures < 0)
-    {
-      GST_ERROR("The number of feature structure is not valid !");
-      gst_object_unref(plugin);
-      return -1;
-    }
-
-  for (feat = (GstBinaryPluginFeature *) (in + sizeof (GstBinaryPluginElement)), i = 0; 
-       i < p->nfeatures; i++, feat++)
-    {
-      GstPluginFeature *gstfeat;
-
-      if ((gstfeat = gst_registry_binary_load_feature(feat)) == NULL)
-	{
-	  g_list_free(plugin_features);
-	  g_free(plugin);
-	  GST_ERROR("Error while loading binary feature");
-	  return -1;
-	}
-      gstfeat->plugin_name = g_strdup(plugin->desc.name);
-      plugin_features = g_list_prepend(plugin_features, gstfeat);
-    }
-  
-  GST_DEBUG("Added plugin \"%s\" to global registry from binary registry", plugin->desc.name); 
-  GList *g;
-
-  gst_registry_add_plugin (registry, plugin);
-  for (g = plugin_features; g; g = g_list_next (g))
-    gst_registry_add_feature (registry, GST_PLUGIN_FEATURE (g->data));
-  /*  g_list_free(plugin_features); */
-
-  offset = sizeof (GstBinaryPluginElement) + p->nfeatures * sizeof (GstBinaryPluginFeature);
-  return offset;
-}
-
-
-/*
-** Read the cache and adapt it to fill GstRegistry
-*/ 
-gboolean 
-gst_registry_binary_read_cache(GstRegistry *registry, const char *location)
-{
-  GMappedFile *mapped = NULL;
-  GTimer *timer = NULL;
-  gchar *contents = NULL;
-  gdouble seconds;
-  unsigned long offset, inc;
-  gsize size;
-
-  /* make sure these types exist */
-  GST_TYPE_ELEMENT_FACTORY;
-  GST_TYPE_TYPE_FIND_FACTORY;
-  GST_TYPE_INDEX_FACTORY;
-
-  timer = g_timer_new ();
-
-  if ((mapped = g_mapped_file_new(location, FALSE, NULL)) == NULL ||
-      (contents = g_mapped_file_get_contents(mapped)) == NULL)
-    {
-      GST_ERROR("Can't load file : %s", strerror(errno));
-      return FALSE;
-    }
-  if ((contents = gst_registry_binary_check_magic(contents)) == NULL)
-    {
-      GST_ERROR("Binary registry type not recognized (invalid magic)");
-      g_mapped_file_free(mapped);
-      return FALSE;
-    }
-
-  if ((size = g_mapped_file_get_length(mapped)) < sizeof (GstBinaryPluginElement))
-    {
-      GST_INFO("No binary plugins structure to read");
-      return TRUE; /* This is not really an error */
-    }
-
-  for (offset = inc = 0; (offset + sizeof (GstBinaryPluginElement)) < size &&
-	 (inc = gst_registry_binary_get_binary_plugin(registry, contents + offset)) > 0;
-       offset += inc)
-    ; /* May want in the future to do something here */
-  if (inc < 0)
-    {
-      GST_DEBUG("Problem while reading binary registry");
-      return FALSE;
-    }
-
-  g_timer_stop (timer);
-  seconds = g_timer_elapsed (timer, NULL);
-  g_timer_destroy (timer);
-
-  GST_INFO ("loaded %s in %f seconds", location, seconds);
-
-  if (mapped)
-    g_mapped_file_free (mapped);
-  return TRUE;
-}
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.h b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.h
deleted file mode 100644
index 2ef24d765d..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.h
+++ /dev/null
@@ -1,194 +0,0 @@
-/* GStreamer
- * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
- *                    2000 Wim Taymans <wim.taymans@chello.be>
- *
- * gstregistry.h: Header for registry handling
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Library General Public
- * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Library General Public License for more details.
- *
- * You should have received a copy of the GNU Library General Public
- * License along with this library; if not, write to the
- * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
- * Boston, MA 02111-1307, USA.
- */
-
-/* SUGGESTIONS AND TODO :
-** ====================
-** - Use a compressed registry, but would induce performance loss
-** - Encrypt the registry, for security purpose, but would also reduce performances
-** - Also have a non-mmap based cache reading (work with file descriptors)
-*/
-
-#ifndef __GST_REGISTRYBINARY_H__
-#define __GST_REGISTRYBINARY_H__
-
-#ifdef HAVE_CONFIG_H
-#  include "config.h"
-#endif
-
-#include <stdio.h>
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <dirent.h>
-#include <fcntl.h>
-#include <sys/mman.h>
-#ifdef HAVE_UNISTD_H
-#include <unistd.h>
-#endif
-
-#include <gst/gst_private.h>
-#include <gst/gstelement.h>
-#include <gst/gsttypefind.h>
-#include <gst/gsttypefindfactory.h>
-#include <gst/gsturi.h>
-#include <gst/gstinfo.h>
-#include <gst/gstenumtypes.h>
-#include <gst/gstregistry.h>
-#include <gst/gstpadtemplate.h>
-
-#include "glib-compat-private.h"
-#include <glib/gstdio.h>
-
-/* A magic, written at the beginning of the file */
-#define GST_MAGIC_BINARY_REGISTRY_STR "\xc0\xde\xf0\x0d"
-#define GST_MAGIC_BINARY_REGISTRY_LEN (4)
-#define GST_MAGIC_BINARY_VERSION_LEN (64)
-
-typedef struct _GstBinaryRegistryMagic
-{
-  char magic[GST_MAGIC_BINARY_REGISTRY_LEN];
-  char version[GST_MAGIC_BINARY_VERSION_LEN];
-} GstBinaryRegistryMagic;
-
-
-/* Used to store pointers to write */
-typedef struct _GstBinaryChunck
-{
-  void *data;
-  unsigned int size;
-} GstBinaryChunck;
-
-
-/* A structure containing (staticely) every information needed for a plugin
-**
-** Notes :
-** "nfeatures" is used to say how many GstBinaryPluginFeature structures we will have 
-** right after the structure itself.
-*/
-
-/* Various lenght defines for our GstBinaryPluginElement structure 
-** Note : We could eventually use smaller size
-*/
-#define GST_BINARY_REGISTRY_NAME_LEN (256)
-#define GST_BINARY_REGISTRY_DESCRIPTION_LEN (1024)
-#define GST_BINARY_REGISTRY_VERSION_LEN (64)
-#define GST_BINARY_REGISTRY_LICENSE_LEN (256)
-#define GST_BINARY_REGISTRY_SOURCE_LEN (256)
-#define GST_BINARY_REGISTRY_PACKAGE_LEN (1024)
-#define GST_BINARY_REGISTRY_ORIGIN_LEN (1024)
-
-typedef struct _GstBinaryPluginElement
-{
-  char name[GST_BINARY_REGISTRY_NAME_LEN];
-  char description[GST_BINARY_REGISTRY_DESCRIPTION_LEN];
-  char filename[_POSIX_PATH_MAX];
-  char version[GST_BINARY_REGISTRY_VERSION_LEN];
-  char license[GST_BINARY_REGISTRY_LICENSE_LEN];
-  char source[GST_BINARY_REGISTRY_SOURCE_LEN];
-  char package[GST_BINARY_REGISTRY_PACKAGE_LEN];
-  char origin[GST_BINARY_REGISTRY_ORIGIN_LEN];
-  unsigned long size;
-  unsigned long m32p;
-  unsigned int nfeatures;
-} GstBinaryPluginElement;
-
-
-/* A structure containing the plugin features
-**
-** Note :
-** "npadtemplates" is used to store the number of GstBinaryPadTemplate structures following the structure itself.
-** "ninterfaces" is used to store the number of GstBinaryInterface structures following the structure itself.
-** "nuritypes" is used to store the number of GstBinaryUriType structures following the structure itself.
-*/
-#define GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN (256)
-#define GST_BINARY_REGISTRY_TYPENAME_NAME_LEN (256)
-#define GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN (1024)
-#define GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN (512)
-#define GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN (1024)
-#define GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN (256)
-
-typedef struct _GstBinaryPluginFeature
-{
-  char typename[GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN];
-  char name[GST_BINARY_REGISTRY_TYPENAME_NAME_LEN];
-  unsigned long rank;
-  char longname[GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN];
-  char class[GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN];
-  char description[GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN];
-  char author[GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN];
-  unsigned int npadtemplates;
-  unsigned int ninterfaces;
-  unsigned int nuritypes;
-} GstBinaryPluginFeature;
-
-
-/* 
-** A structure containing the static pad templates of a plugin feature 
-*/
-#define GST_BINARY_REGISTRY_PADTEMPLATE_NAME_LEN (256)
-#define GST_BINARY_REGISTRY_PADTEMPLATE_CAP_LEN (1024)
-
-typedef struct _GstBinaryPadTemplate
-{
-  char name[GST_BINARY_REGISTRY_PADTEMPLATE_NAME_LEN];
-  char cap[GST_BINARY_REGISTRY_PADTEMPLATE_CAP_LEN];
-  int direction;					/* Either 0:"sink" or 1:"src" */
-  GstPadPresence presence;
-} GstBinaryPadTemplate;
-
-/*
-** A very simple structure defining the plugin feature interface string
-*/
-#define GST_BINARY_REGISTRY_INTERFACE_INTERFACE_LEN (512)
-typedef struct _GstBinaryInterface
-{
-  char interface[GST_BINARY_REGISTRY_INTERFACE_INTERFACE_LEN];
-  unsigned long size;
-} GstBinaryInterface;
-
-/* Uri Type */
-typedef struct _GstBinaryUriType
-{
-  GstURIType type;
-  unsigned long nuriprotocols;
-} GstBinaryUriType;
-
-/* 
-** Function prototypes
-*/
-
-/* Local prototypes */
-inline static gboolean gst_registry_binary_write(GstRegistry *registry, const void *mem, const ssize_t size);
-inline static gboolean gst_registry_binary_initialize_magic(GstBinaryRegistryMagic *m);
-static gboolean gst_registry_binary_fill_feature(GList **list, GstPluginFeature *, GstBinaryPluginFeature *, const char *);
-static gboolean gst_registry_binary_save_plugin(GList **list, GstRegistry *registry, GstPlugin *plugin);
-static gchar *gst_registry_binary_check_magic(gchar *in);
-static GstPluginFeature *gst_registry_binary_load_feature(GstBinaryPluginFeature *);
-static unsigned long gst_registry_binary_get_binary_plugin(GstRegistry *registry, gchar *in);
-
-/* Exportable */
-gboolean gst_registry_binary_write_cache(GstRegistry *registry, const char *location);
-gboolean gst_registry_binary_read_cache(GstRegistry *registry, const char *location);
-
-#endif /* !__GST_REGISTRYBINARY_H__ */
-
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
deleted file mode 100644
index 56d82205ee..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "GStreamer multimedia framework"
-DESCRIPTION = "GStreamer is a multimedia framework for encoding and decoding video and sound. \
-It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime."
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
-SECTION = "multimedia"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
-DEPENDS = "glib-2.0 libxml2 bison-native flex-native glib-2.0-native"
-
-PR = "r2"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
-           file://check_fix.patch \
-           file://gst-inspect-check-error.patch \
-           file://0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch \
-           file://0001-parse-make-grammar.y-work-with-Bison-3.patch \
-           file://0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch \
-"
-
-SRC_URI[md5sum] = "a0cf7d6877f694a1a2ad2b4d1ecb890b"
-SRC_URI[sha256sum] = "e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de29b5d82bb41ae7a30"
-
-inherit autotools pkgconfig gettext
-
-GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
-            --disable-dependency-tracking --disable-check \
-            --disable-examples --disable-tests \
-            --disable-valgrind ${GSTREAMER_DEBUG} \
-            --disable-introspection \
-            "
-
-CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
-
-# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
-# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
-oe_runconf_prepend() {
-        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
-}
-
-#do_compile_prepend () {
-#    mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
-#}
-
-FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dev += " ${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-FILES_${PN}-dbg += " ${libdir}/gstreamer-0.10/.debug/ ${libexecdir}/gstreamer-0.10/.debug/"
-- 
2.21.0



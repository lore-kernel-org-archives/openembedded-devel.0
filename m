Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvw-00006o-8B
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C38E8314B86C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:04:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id T27RlIn6kZu5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:56 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 5ADE6314B8DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:53 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:53 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:45 +0000
Message-Id: <1291914227-25068-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/8] gst-plugins-bad: remove unpinned versions
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:34 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../gst-plugins-bad/gst-plugins-directfb-fix.patch |   32 ------
 .../gstreamer/gst-plugins-bad/ivorbis-thumb.patch  |   11 --
 recipes/gstreamer/gst-plugins-bad/vorbisdec.h      |   87 -----------------
 recipes/gstreamer/gst-plugins-bad/vorbisenc.h      |  101 --------------------
 recipes/gstreamer/gst-plugins-bad_0.10.11.bb       |   15 ---
 recipes/gstreamer/gst-plugins-bad_0.10.12.bb       |   14 ---
 recipes/gstreamer/gst-plugins-bad_0.10.18.bb       |   11 --
 recipes/gstreamer/gst-plugins-bad_0.10.19.bb       |   11 --
 recipes/gstreamer/gst-plugins-bad_0.10.6.bb        |   16 ---
 recipes/gstreamer/gst-plugins-bad_0.10.9.bb        |   17 ----
 10 files changed, 0 insertions(+), 315 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-plugins-bad/gst-plugins-directfb-fix.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-bad/ivorbis-thumb.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-bad/vorbisdec.h
 delete mode 100644 recipes/gstreamer/gst-plugins-bad/vorbisenc.h
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.11.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.12.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.18.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.19.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.6.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.9.bb

diff --git a/recipes/gstreamer/gst-plugins-bad/gst-plugins-directfb-fix.patch b/recipes/gstreamer/gst-plugins-bad/gst-plugins-directfb-fix.patch
deleted file mode 100644
index f8f516b..0000000
--- a/recipes/gstreamer/gst-plugins-bad/gst-plugins-directfb-fix.patch
+++ /dev/null
@@ -1,32 +0,0 @@
---- gst-plugins-bad-0.10.5-r1.orig/gst-plugins-bad-0.10.5/examples/directfb/gstdfb.c	2007-08-24 08:23:23.000000000 +0100
-+++ gst-plugins-bad-0.10.5-r1/gst-plugins-bad-0.10.5/examples/directfb/gstdfb.c	2007-08-24 08:24:28.000000000 +0100
-@@ -35,7 +35,7 @@
- #include <math.h>
- #include <time.h>
- 
--#include <directfb.h>
-+#include <directfb/directfb.h>
- #include <gst/gst.h>
- #include <string.h>
- 
---- gst-plugins-bad-0.10.5-r1.orig/gst-plugins-bad-0.10.5/ext/directfb/dfb-example.c	2007-08-24 08:23:24.000000000 +0100
-+++ gst-plugins-bad-0.10.5-r1/gst-plugins-bad-0.10.5/ext/directfb/dfb-example.c	2007-08-24 08:24:41.000000000 +0100
-@@ -1,5 +1,5 @@
- 
--#include <directfb.h>
-+#include <directfb/directfb.h>
- #include <gst/gst.h>
- 
- static IDirectFB *dfb = NULL;
-
---- gst-plugins-bad-0.10.5-r1.orig/gst-plugins-bad-0.10.5/ext/directfb/dfbvideosink.h	2007-08-24 08:23:24.000000000 +0100
-+++ gst-plugins-bad-0.10.5-r1/gst-plugins-bad-0.10.5/ext/directfb/dfbvideosink.h	2007-08-24 08:24:56.000000000 +0100
-@@ -22,7 +22,7 @@
- 
- #include <gst/video/gstvideosink.h>
- 
--#include <directfb.h>
-+#include <directfb/directfb.h>
- 
- G_BEGIN_DECLS
- 
diff --git a/recipes/gstreamer/gst-plugins-bad/ivorbis-thumb.patch b/recipes/gstreamer/gst-plugins-bad/ivorbis-thumb.patch
deleted file mode 100644
index c94a788..0000000
--- a/recipes/gstreamer/gst-plugins-bad/ivorbis-thumb.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- bad/ext/ivorbis/vorbisdec.c~	2008-01-22 09:55:22.000000000 +0000
-+++ bad/ext/ivorbis/vorbisdec.c	2008-10-27 20:12:43.000000000 +0000
-@@ -792,7 +792,7 @@
- }
- 
- /* Taken from Tremor, misc.h */
--#ifdef _ARM_ASSEM_
-+#if defined(_ARM_ASSEM_) && !defined(__thumb__)
- static inline ogg_int32_t
- CLIP_TO_15 (ogg_int32_t x)
- {
diff --git a/recipes/gstreamer/gst-plugins-bad/vorbisdec.h b/recipes/gstreamer/gst-plugins-bad/vorbisdec.h
deleted file mode 100644
index 3bc29f2..0000000
--- a/recipes/gstreamer/gst-plugins-bad/vorbisdec.h
+++ /dev/null
@@ -1,87 +0,0 @@
-/* -*- c-basic-offset: 2 -*-
- * GStreamer
- * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
- *
- * Tremor modifications <2006>:
- *   Chris Lord, OpenedHand Ltd. <chris@openedhand.com>, http://www.o-hand.com/
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
-
-#ifndef __GST_IVORBIS_DEC_H__
-#define __GST_IVORBIS_DEC_H__
-
-
-#include <gst/gst.h>
-#include <tremor/ivorbiscodec.h>
-
-G_BEGIN_DECLS
-
-#define GST_TYPE_IVORBIS_DEC \
-  (gst_ivorbis_dec_get_type())
-#define GST_IVORBIS_DEC(obj) \
-  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_IVORBIS_DEC,GstIVorbisDec))
-#define GST_IVORBIS_DEC_CLASS(klass) \
-  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_IVORBIS_DEC,GstIVorbisDecClass))
-#define GST_IS_IVORBIS_DEC(obj) \
-  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_IVORBIS_DEC))
-#define GST_IS_IVORBIS_DEC_CLASS(klass) \
-  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_IVORBIS_DEC))
-
-typedef struct _GstIVorbisDec GstIVorbisDec;
-typedef struct _GstIVorbisDecClass GstIVorbisDecClass;
-
-/**
- * GstIVorbisDec:
- *
- * Opaque data structure.
- */
-struct _GstIVorbisDec {
-  GstElement            element;
-
-  GstPad *              sinkpad;
-  GstPad *              srcpad;
-
-  vorbis_dsp_state      vd;
-  vorbis_info           vi;
-  vorbis_comment        vc;
-  vorbis_block          vb;
-  guint64               granulepos;
-
-  gboolean              initialized;
-
-  GList                 *queued;
-
-  GstSegment		segment;
-  gboolean		discont;
-
-  GstClockTime          cur_timestamp; /* only used with non-ogg container formats */
-  GstClockTime          prev_timestamp; /* only used with non-ogg container formats */
-
-  GList			*pendingevents;
-  GstTagList		*taglist;
-};
-
-struct _GstIVorbisDecClass {
-  GstElementClass parent_class;
-};
-
-GType gst_ivorbis_dec_get_type(void);
-
-G_END_DECLS
-
-#endif /* __GST_IVORBIS_DEC_H__ */
diff --git a/recipes/gstreamer/gst-plugins-bad/vorbisenc.h b/recipes/gstreamer/gst-plugins-bad/vorbisenc.h
deleted file mode 100644
index 7170baa..0000000
--- a/recipes/gstreamer/gst-plugins-bad/vorbisenc.h
+++ /dev/null
@@ -1,101 +0,0 @@
-/* GStreamer
- * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
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
-
-#ifndef __VORBISENC_H__
-#define __VORBISENC_H__
-
-
-#include <config.h>
-#include <gst/gst.h>
-
-#include <tremor/codec.h>
-
-#ifdef __cplusplus
-extern "C" {
-#endif /* __cplusplus */
-
-#define GST_TYPE_VORBISENC \
-  (vorbisenc_get_type())
-#define GST_VORBISENC(obj) \
-  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_VORBISENC,VorbisEnc))
-#define GST_VORBISENC_CLASS(klass) \
-  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_VORBISENC,VorbisEncClass))
-#define GST_IS_VORBISENC(obj) \
-  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_VORBISENC))
-#define GST_IS_VORBISENC_CLASS(obj) \
-  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_VORBISENC))
-
-typedef struct _VorbisEnc VorbisEnc;
-typedef struct _VorbisEncClass VorbisEncClass;
-
-struct _VorbisEnc {
-  GstElement 	   element;
-
-  GstPad          *sinkpad,
-                  *srcpad;
-
-  ogg_stream_state os; /* take physical pages, weld into a logical
-			                              stream of packets */
-  ogg_page         og; /* one Ogg bitstream page.  Vorbis packets are inside */
-  ogg_packet       op; /* one raw packet of data for decode */
-
-  vorbis_info      vi; /* struct that stores all the static vorbis bitstream
-				                            settings */
-  vorbis_comment   vc; /* struct that stores all the user comments */
-
-  vorbis_dsp_state vd; /* central working state for the packet->PCM decoder */
-  vorbis_block     vb; /* local working space for packet->PCM decode */
-
-  gboolean         eos;
-
-  gboolean         managed;
-  gint             bitrate;
-  gint             min_bitrate;
-  gint             max_bitrate;
-  gfloat           quality;
-  gboolean	   quality_set;
-  gint             serial;
-
-  gint             channels;
-  gint             frequency;
-
-  guint64	   samples_in;
-  guint64	   bytes_out;
-
-  GstCaps         *metadata;
-
-  gboolean         setup;
-  gboolean         flush_header;
-  gchar		  *last_message;
-};
-
-struct _VorbisEncClass {
-  GstElementClass parent_class;
-};
-
-GType vorbisenc_get_type(void);
-
-
-#ifdef __cplusplus
-}
-#endif /* __cplusplus */
-
-
-#endif /* __VORBISENC_H__ */
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.11.bb b/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
deleted file mode 100644
index b798523..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
-            file://ivorbis-thumb.patch"
-DEPENDS += "gst-plugins-base directfb"
-
-do_compile_prepend() {
-	# work around missing files in upstream tarball (upstream bug #454078)
-	install -m 0644 ${WORKDIR}/vorbis*.h ${S}/ext/ivorbis/
-}
-
-SRC_URI[archive.md5sum] = "75a3359ece6a1c11a9e5463d79e274e8"
-SRC_URI[archive.sha256sum] = "b50072ff6f36087b8ecebf509e6d44ab2e91292b1a3a5806a7f1437a382723e9"
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.12.bb b/recipes/gstreamer/gst-plugins-bad_0.10.12.bb
deleted file mode 100644
index c357470..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.12.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
-            file://ivorbis-thumb.patch"
-
-DEPENDS += "gst-plugins-base openssl directfb"
-
-do_compile_prepend() {
-	# work around missing files in upstream tarball (upstream bug #454078)
-	install -m 0644 ${WORKDIR}/vorbis*.h ${S}/ext/ivorbis/
-}
-
-SRC_URI[archive.md5sum] = "63309cf0bb21f3efd4e43868c314f919"
-SRC_URI[archive.sha256sum] = "18387f78b721ce6b56c02f886ec89774a4e58b7883c70ab2ae6c1af58f1661c9"
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.18.bb b/recipes/gstreamer/gst-plugins-bad_0.10.18.bb
deleted file mode 100644
index a4ab2de..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.18.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI[archive.md5sum] = "84838893b447e774d401a698ff812b32"
-SRC_URI[archive.sha256sum] = "2f800127e00da0f157358f87b06563b3de23cbc630fbf6295b43405e52e02070"
-
-DEPENDS += "orc-native orc gst-plugins-base openssl directfb"
-
-PR = "${INC_PR}.0"
-
-# We don't have vdpau headers in OE and it creates crosscompile badness
-EXTRA_OECONF_append = " --disable-vdpau "
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.19.bb b/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
deleted file mode 100644
index 2351431..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI[archive.md5sum] = "368f72e2a1c7a6e8fe60394e4315259b"
-SRC_URI[archive.sha256sum] = "7b6c49f22caad3b573aee481381355b38ac9f2077f291d9f33a9a808a2568888"
-
-DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb libmodplug"
-
-PR = "${INC_PR}.3"
-
-# We don't have vdpau headers in OE and it creates crosscompile badness
-EXTRA_OECONF_append = " --disable-vdpau --enable-sdl"
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.6.bb b/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
deleted file mode 100644
index 45c3617..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
-            file://gst-plugins-directfb-fix.patch;striplevel=2 \
-            file://ivorbis-thumb.patch"
-DEPENDS += "gst-plugins-base directfb"
-
-do_compile_prepend() {
-	# work around missing files in upstream tarball (upstream bug #454078)
-	install -m 0644 ${WORKDIR}/vorbis*.h ${S}/ext/ivorbis/
-}
-
-SRC_URI[archive.md5sum] = "fb47838aa0ccef52683cea5d89364053"
-SRC_URI[archive.sha256sum] = "c702dab34d3b330ec06d915a91a937dadb0a93ace25bbe8e337223ddb834efe6"
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.9.bb b/recipes/gstreamer/gst-plugins-bad_0.10.9.bb
deleted file mode 100644
index 038fbd9..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.9.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require gst-plugins.inc
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
-            file://gst-plugins-directfb-fix.patch;striplevel=2 \
-            file://ivorbis-thumb.patch"
-
-DEPENDS += "gst-plugins-base openssl"
-EXTRA_OECONF += " ac_cv_openssldir=no"
-
-do_compile_prepend() {
-	# work around missing files in upstream tarball (upstream bug #454078)
-	install -m 0644 ${WORKDIR}/vorbis*.h ${S}/ext/ivorbis/
-}
-
-SRC_URI[archive.md5sum] = "ff555a86e74a9249e56b43405c8df3e4"
-SRC_URI[archive.sha256sum] = "d8215aa4c3069531609091619386abfa2f331ed95607b1525d9464a06d814e4f"
-- 
1.7.2.3




Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A22CF76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:44 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so6855748wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=c7X6avuqr6pO5VXlxup6H9hz7JWYpWucQ65v+H2mQ5g=;
	b=qpyydc2ezBFh7uoHI+LBXDwKuU6DJff6DcMBkFsHNMkS7Tcsy8jq/32EkmCEsCSkJa
	r3Pt1dF2uWW8PfSqqfxntZVkxSBebmKpsZJGdIKbgqTkgOJZ3vdAx1gfaIiQNxWXeiaI
	2F/eh5F8Vz4bHTNx6A5b7dnV+7cGosG3O+Nf63NyZWx1fgGdl5Tnu7QgMOUe+Dy7neNk
	YGUA7LMG05rqbv752TO8YIqtWKUrYWutfn+G0h8p8vEPxY8c4un1EAqVUa4UxTp411us
	IcfN+QzUV6C9Ql0tUATWBwjS9gNEfFKuoNPEM1OhaKWz9W5KAhSQpkwb2D5XgiDoCoGT
	bxBA==
X-Received: by 10.194.246.199 with SMTP id xy7mr17697133wjc.61.1442450504287; 
	Wed, 16 Sep 2015 17:41:44 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:14 +0200
Message-Id: <1442450491-14912-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/19] gst-plugins-ugly: prepare for update of libcdio
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libcdio's API has changed for version > 0.82

Build tested with libcdio 0.93 (next patch) and PACAKGECONFIG += "cdio"

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...sate-for-libcdio-s-recent-cd-text-api-cha.patch | 193 +++++++++++++++++++++
 .../gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
new file mode 100644
index 0000000..1f72fc0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
@@ -0,0 +1,193 @@
+From 649bd92cd2600719862ad5189899212409dd0a67 Mon Sep 17 00:00:00 2001
+From: Leon Merten Lohse <leon@green-side.de>
+Date: Thu, 3 May 2012 23:50:30 +0100
+Subject: [PATCH] cdio: compensate for libcdio's recent cd-text api changes
+
+https://bugzilla.gnome.org/show_bug.cgi?id=675112
+
+Conflicts:
+
+	ext/cdio/gstcdiocddasrc.c
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+Upstream-Status: Backport
+---
+ ext/cdio/gstcdio.c        | 35 ++++++++++++++++++++++++++++-------
+ ext/cdio/gstcdio.h        | 16 ++++++++++++++++
+ ext/cdio/gstcdiocddasrc.c | 19 +++++++++++++++++++
+ 3 files changed, 63 insertions(+), 7 deletions(-)
+
+diff --git a/ext/cdio/gstcdio.c b/ext/cdio/gstcdio.c
+index 2f58d18..483ebf5 100644
+--- a/ext/cdio/gstcdio.c
++++ b/ext/cdio/gstcdio.c
+@@ -30,12 +30,16 @@
+ GST_DEBUG_CATEGORY (gst_cdio_debug);
+ 
+ void
+-gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext,
++gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext, track_t track,
+     cdtext_field_t field, const gchar * gst_tag, GstTagList ** p_tags)
+ {
+   const gchar *txt;
+ 
++#if LIBCDIO_VERSION_NUM > 83
++  txt = cdtext_get_const (cdtext, field, track);
++#else
+   txt = cdtext_get_const (field, cdtext);
++#endif
+   if (txt == NULL || *txt == '\0') {
+     GST_DEBUG_OBJECT (src, "empty CD-TEXT field %u (%s)", field, gst_tag);
+     return;
+@@ -57,6 +61,12 @@ gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext,
+ }
+ 
+ GstTagList *
++#if LIBCDIO_VERSION_NUM > 83
++gst_cdio_get_cdtext (GstObject * src, cdtext_t * t, track_t track)
++{
++  GstTagList *tags = NULL;
++
++#else
+ gst_cdio_get_cdtext (GstObject * src, CdIo * cdio, track_t track)
+ {
+   GstTagList *tags = NULL;
+@@ -67,14 +77,22 @@ gst_cdio_get_cdtext (GstObject * src, CdIo * cdio, track_t track)
+     GST_DEBUG_OBJECT (src, "no CD-TEXT for track %u", track);
+     return NULL;
+   }
++#endif
+ 
+-  gst_cdio_add_cdtext_field (src, t, CDTEXT_PERFORMER, GST_TAG_ARTIST, &tags);
+-  gst_cdio_add_cdtext_field (src, t, CDTEXT_TITLE, GST_TAG_TITLE, &tags);
++  gst_cdio_add_cdtext_field (src, t, track, CDTEXT_FIELD_PERFORMER,
++      GST_TAG_ARTIST, &tags);
++  gst_cdio_add_cdtext_field (src, t, track, CDTEXT_FIELD_TITLE, GST_TAG_TITLE,
++      &tags);
+ 
+   return tags;
+ }
+ 
+ void
++#if LIBCDIO_VERSION_NUM > 83
++gst_cdio_add_cdtext_album_tags (GstObject * src, cdtext_t * t,
++    GstTagList * tags)
++{
++#else
+ gst_cdio_add_cdtext_album_tags (GstObject * src, CdIo * cdio, GstTagList * tags)
+ {
+   cdtext_t *t;
+@@ -84,11 +102,14 @@ gst_cdio_add_cdtext_album_tags (GstObject * src, CdIo * cdio, GstTagList * tags)
+     GST_DEBUG_OBJECT (src, "no CD-TEXT for album");
+     return;
+   }
++#endif
+ 
+-  /* FIXME: map CDTEXT_PERFORMER to GST_TAG_ALBUM_ARTIST once we have that */
+-  gst_cdio_add_cdtext_field (src, t, CDTEXT_TITLE, GST_TAG_ALBUM, &tags);
+-  gst_cdio_add_cdtext_field (src, t, CDTEXT_GENRE, GST_TAG_GENRE, &tags);
+-
++  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_PERFORMER,
++      GST_TAG_ALBUM_ARTIST, &tags);
++  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_TITLE, GST_TAG_ALBUM,
++      &tags);
++  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_GENRE, GST_TAG_GENRE,
++      &tags);
+   GST_DEBUG ("CD-TEXT album tags: %" GST_PTR_FORMAT, tags);
+ }
+ 
+diff --git a/ext/cdio/gstcdio.h b/ext/cdio/gstcdio.h
+index ef31ed0..c6da580 100644
+--- a/ext/cdio/gstcdio.h
++++ b/ext/cdio/gstcdio.h
+@@ -24,22 +24,38 @@
+ #include <gst/gst.h>
+ #include <cdio/cdio.h>
+ #include <cdio/cdtext.h>
++#include <cdio/version.h>
++
++#if LIBCDIO_VERSION_NUM <= 83
++  #define CDTEXT_FIELD_PERFORMER CDTEXT_PERFORMER
++  #define CDTEXT_FIELD_GENRE     CDTEXT_GENRE
++  #define CDTEXT_FIELD_TITLE     CDTEXT_TITLE
++#endif
+ 
+ GST_DEBUG_CATEGORY_EXTERN (gst_cdio_debug);
+ #define GST_CAT_DEFAULT gst_cdio_debug
+ 
+ void     gst_cdio_add_cdtext_field (GstObject      * src,
+                                     cdtext_t       * cdtext,
++                                    track_t          track,
+                                     cdtext_field_t   field,
+                                     const gchar    * gst_tag,
+                                     GstTagList    ** p_tags);
+ 
+ GstTagList  * gst_cdio_get_cdtext  (GstObject      * src,
++#if LIBCDIO_VERSION_NUM > 83
++                                    cdtext_t       * t,
++#else
+                                     CdIo           * cdio,
++#endif
+                                     track_t          track);
+ 
+ void      gst_cdio_add_cdtext_album_tags (GstObject  * src,
++#if LIBCDIO_VERSION_NUM > 83
++                                          cdtext_t   * t,
++#else
+                                           CdIo       * cdio,
++#endif
+                                           GstTagList * tags);
+ 
+ #endif /* __GST_CDIO_H__ */
+diff --git a/ext/cdio/gstcdiocddasrc.c b/ext/cdio/gstcdiocddasrc.c
+index 615a0c8..830839e 100644
+--- a/ext/cdio/gstcdiocddasrc.c
++++ b/ext/cdio/gstcdiocddasrc.c
+@@ -206,6 +206,9 @@ gst_cdio_cdda_src_open (GstAudioCdSrc * audiocdsrc, const gchar * device)
+   GstCdioCddaSrc *src;
+   discmode_t discmode;
+   gint first_track, num_tracks, i;
++#if LIBCDIO_VERSION_NUM > 83
++  cdtext_t *cdtext;
++#endif
+ 
+   src = GST_CDIO_CDDA_SRC (audiocdsrc);
+ 
+@@ -244,8 +244,18 @@ gst_cdio_cdda_src_open (GstCddaBaseSrc * cddabasesrc, const gchar * device)
+   if (src->read_speed != -1)
+     cdio_set_speed (src->cdio, src->read_speed);
+ 
++#if LIBCDIO_VERSION_NUM > 83
++  cdtext = cdio_get_cdtext (src->cdio);
++
++  if (NULL == cdtext)
++    GST_DEBUG_OBJECT (src, "no CD-TEXT on disc");
++  else
++    gst_cdio_add_cdtext_album_tags (GST_OBJECT_CAST (src), cdtext,
++        cddabasesrc->tags);
++#else
+   gst_cdio_add_cdtext_album_tags (GST_OBJECT_CAST (src), src->cdio,
+       cddabasesrc->tags);
++#endif
+ 
+   GST_LOG_OBJECT (src, "%u tracks, first track: %d", num_tracks, first_track);
+ 
+@@ -250,8 +263,14 @@ gst_cdio_cdda_src_open (GstAudioCdSrc * audiocdsrc, const gchar * device)
+      * the right thing here (for cddb id calculations etc. as well) */
+     track.start = cdio_get_track_lsn (src->cdio, i + first_track);
+     track.end = track.start + len_sectors - 1;  /* -1? */
++#if LIBCDIO_VERSION_NUM > 83
++    if (NULL != cdtext)
++      track.tags = gst_cdio_get_cdtext (GST_OBJECT (src), cdtext,
++          i + first_track);
++#else
+     track.tags = gst_cdio_get_cdtext (GST_OBJECT (src), src->cdio,
+         i + first_track);
++#endif
+ 
+     gst_audio_cd_src_add_track (GST_AUDIO_CD_SRC (src), &track);
+   }
+-- 
+2.1.0
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
index 2fdf03f..11f20ca 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
@@ -27,3 +27,4 @@ do_configure_prepend() {
 
 SRC_URI[md5sum] = "1d81c593e22a6cdf0f2b4f57eae93df2"
 SRC_URI[sha256sum] = "1ca90059275c0f5dca71d4d1601a8f429b7852baed0723e820703b977e2c8df0"
+SRC_URI += "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch"
-- 
2.1.0



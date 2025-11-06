Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0246CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 19:25:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6239.1762457139036223541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Nov 2025 11:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hG72MglN;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47109187c32so6440155e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762457137; x=1763061937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijzIzvx7DoXbtUKgVmt/Gq724lTKzf2RohhwtMyWbCE=;
        b=hG72MglN+lZ3iRK/PdNpw6UbyzSAVBEfqpxUhtoiw01+FVZ5CIY5EEB/Jo4NK/vakK
         3mgYpLYduMrndnPgt6/wH7IiILJ/bZlqbmcT/L6+5PES+fDF+f6qD89OV0qliIvTZ+E/
         CyzTDahLUm+nW4zzvcxxOOFvO3Fv4X7QHfZ9pc9s+J1MxsTWRfEaRTU+ovSZplsz7jwI
         byXuEzCfnt5lrk57yZaqUB6BfSBLhrLLwq0V7xZlluvkd5ezv/rnRbVW2Pv3Gd2KADoH
         6D0mpMpi6Q3cr0sjpdVBc+83J1NIG7dffn0JlpzoT9Ejex3AJl5sx3KN9bN5A6vzLcB/
         7uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762457137; x=1763061937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijzIzvx7DoXbtUKgVmt/Gq724lTKzf2RohhwtMyWbCE=;
        b=jSs4OSrCq0VVc3waQtCfQixbI3pcP4blrxip+sFoh3EtURmrnw7k0emvrEAJgkjjL7
         vzpo25eJfqPH3S+nrbmuDrlLWQQY5Mvsgo6fNBtCkaR2/RfwUeUEIqgDQrTRnm+Acluq
         +aXUSh/JcDLoqXLl37w2uvciXFn5SdxdyD0XeTFYmcBO4Jcz2dDoVA5Z+gflWGpmIyfa
         1vZOOaqgX72TDYh1ejDyGMLHy/sd0s9mN0rXv0WBiXxWBFX2fyMNTQaT5nBeIIUZHc7i
         rFXZ/LwSTSWcLUwLD/oG7tsizEc0IKgiC6OARY7mp8w2SXpV8ZGB+UfPhXJEThhbySBU
         wxeA==
X-Gm-Message-State: AOJu0YxUwsFSwEjZzdKCV8WIjwCmKXhGt7Kzgf4ozXTtBcnrt55mt5hd
	ZUAwHHlDu7GYEvU+1cORoE//SQoxGG6j4H65B8kXeKBRdGur2a8sf3438VIYEUlW
X-Gm-Gg: ASbGncvkT81pHgB9dBE60ooaSB3aRNo5DoYfxj3teLV+iB6iXhHqdRaCnUjbrteRw8R
	CMnAmyH7UX2F4JgxnnjAOTk6KNYs9dcP6cMEnNHaBr1qcoAZtbxZ7lbCQSzboCjuYy+Hhl9VXsu
	FnHDEFhdoKyAZ+mbXMmAA976skcPbEf9NcZVPPRJIWjED6AZ8kPEqzruHqp5A76k4gbb+/332bl
	OU2+qaDgWyCdqNtrLtH4YBGJoFt+7eGEC2audlDQyr+H4TOhmaFeX1Z/AUI+mxaNHmN1/GFlskd
	8JqmqTXKEelkH/ZStiO/XmWfsIePWHkJ8uvNgVPyhPvC8fx6TlKmM/q8F+dmBS3KoLgCC1i/LY3
	VieE7wQrO7s03MotnQmlcjcpMuYo2ADkmeXJA/6m5yfTf/Hikv84VexDqdwpWBvmVcoXYQBwyHA
	==
X-Google-Smtp-Source: AGHT+IGa0jF7Qivg/ZiaVVYx8KXWt/aXW0XMjFBoesehJcdeVIEuwM+RR/4MZZcoQP48+k20fG5wXw==
X-Received: by 2002:a05:6000:420c:b0:429:d742:87d8 with SMTP id ffacd0b85a97d-42ae58818fdmr341293f8f.20.1762457137236;
        Thu, 06 Nov 2025 11:25:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b28asm777789f8f.6.2025.11.06.11.25.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:25:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/2] gimp: patch CVE-2022-32990
Date: Thu,  6 Nov 2025 20:25:35 +0100
Message-ID: <20251106192535.2538484-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106192535.2538484-1-skandigraun@gmail.com>
References: <20251106192535.2538484-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 19:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121366

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-32990

Pick the patches that resolved the issue mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2022-32990-1.patch          |  97 ++++++++++
 .../gimp/gimp/CVE-2022-32990-2.patch          | 178 ++++++++++++++++++
 .../gimp/gimp/CVE-2022-32990-3.patch          |  35 ++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb  |   3 +
 4 files changed, 313 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch
new file mode 100644
index 0000000000..a3af142c5a
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-1.patch
@@ -0,0 +1,97 @@
+From 74426d562c0a36287d6ef86bf9caf29022edf0a3 Mon Sep 17 00:00:00 2001
+From: Jacob Boerema <jgboerema@gmail.com>
+Date: Sun, 5 Jun 2022 16:48:10 -0400
+Subject: [PATCH] app: check max dimensions when loading xcf files
+
+Improvements in loading broken xcf files, based on examining issue #8230.
+Besides checking for a minimum width and height, GIMP also has a maximum
+size we can and should check.
+
+In the case of the image itself, we change invalid dimensions to a size of
+1 in hope that the individual layers etc will have the correct size.
+For layer, we will also try to go on, but for channel and layer mask, we
+will give up.
+
+(cherry picked from commit 24c962b95e5c740dff7a87a1f0ccdbf6c0a8c21e)
+
+CVE: CVE-2022-32990
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/e7d4b580e514029f28dc9bd59c66187e166db47c]
+Signed-off-by: Gyorgy Sarvari
+---
+ app/xcf/xcf-load.c | 36 +++++++++++++++++++++++++++++-------
+ 1 file changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/app/xcf/xcf-load.c b/app/xcf/xcf-load.c
+index a178e40..a01cf41 100644
+--- a/app/xcf/xcf-load.c
++++ b/app/xcf/xcf-load.c
+@@ -183,10 +183,19 @@ xcf_load_image (Gimp     *gimp,
+   xcf_read_int32 (info, (guint32 *) &width, 1);
+   xcf_read_int32 (info, (guint32 *) &height, 1);
+   xcf_read_int32 (info, (guint32 *) &image_type, 1);
+-  if (image_type < GIMP_RGB || image_type > GIMP_INDEXED ||
+-      width <= 0 || height <= 0)
++  if (image_type < GIMP_RGB || image_type > GIMP_INDEXED)
+     goto hard_error;
+ 
++  /* Be lenient with corrupt image dimensions.
++   * Hopefully layer dimensions will be valid. */
++  if (width <= 0 || height <= 0 ||
++      width > GIMP_MAX_IMAGE_SIZE || height > GIMP_MAX_IMAGE_SIZE)
++    {
++      GIMP_LOG (XCF, "Invalid image size %d x %d, setting to 1x1.", width, height);
++      width  = 1;
++      height = 1;
++    }
++
+   if (info->file_version >= 4)
+     {
+       gint p;
+@@ -1923,7 +1932,8 @@ xcf_load_layer (XcfInfo    *info,
+       return NULL;
+     }
+ 
+-  if (width <= 0 || height <= 0)
++  if (width <= 0 || height <= 0 ||
++      width > GIMP_MAX_IMAGE_SIZE || height > GIMP_MAX_IMAGE_SIZE)
+     {
+       gboolean is_group_layer = FALSE;
+       gboolean is_text_layer  = FALSE;
+@@ -2085,10 +2095,16 @@ xcf_load_channel (XcfInfo   *info,
+   /* read in the layer width, height and name */
+   xcf_read_int32 (info, (guint32 *) &width,  1);
+   xcf_read_int32 (info, (guint32 *) &height, 1);
+-  if (width <= 0 || height <= 0)
+-    return NULL;
++  if (width <= 0 || height <= 0 ||
++      width > GIMP_MAX_IMAGE_SIZE || height > GIMP_MAX_IMAGE_SIZE)
++    {
++      GIMP_LOG (XCF, "Invalid channel size %d x %d.", width, height);
++      return NULL;
++    }
+ 
+   xcf_read_string (info, &name, 1);
++  GIMP_LOG (XCF, "Channel width=%d, height=%d, name='%s'",
++            width, height, name);
+ 
+   /* create a new channel */
+   channel = gimp_channel_new (image, width, height, name, &color);
+@@ -2157,10 +2173,16 @@ xcf_load_layer_mask (XcfInfo   *info,
+   /* read in the layer width, height and name */
+   xcf_read_int32 (info, (guint32 *) &width,  1);
+   xcf_read_int32 (info, (guint32 *) &height, 1);
+-  if (width <= 0 || height <= 0)
+-    return NULL;
++  if (width <= 0 || height <= 0 ||
++      width > GIMP_MAX_IMAGE_SIZE || height > GIMP_MAX_IMAGE_SIZE)
++    {
++      GIMP_LOG (XCF, "Invalid layer mask size %d x %d.", width, height);
++      return NULL;
++    }
+ 
+   xcf_read_string (info, &name, 1);
++  GIMP_LOG (XCF, "Layer mask width=%d, height=%d, name='%s'",
++            width, height, name);
+ 
+   /* create a new layer mask */
+   layer_mask = gimp_layer_mask_new (image, width, height, name, &color);
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch
new file mode 100644
index 0000000000..ed206eaebd
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-2.patch
@@ -0,0 +1,178 @@
+From d31b4f5cd36c1d111d3f6653b0af2d45e6a3e453 Mon Sep 17 00:00:00 2001
+From: Jacob Boerema <jgboerema@gmail.com>
+Date: Sun, 5 Jun 2022 18:44:45 -0400
+Subject: [PATCH] app: check for invalid offsets when loading XCF files
+
+More safety checks for detecting broken xcf files, also based on examining
+issue #8230.
+
+After reading an offset where layer, channel, etc. data is stored, we
+add a check to make sure that offset is not before where we read the
+offset value. Because the data is always written after the offset that
+points to it.
+
+(cherry picked from commit a842869247eb2cae2b40476b5d93f88d8b01aa27)
+
+CVE: CVE-2022-32990
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/744959433647bdefcdf00b3f0d575f6812cd0d6d]
+Signed-off-by: Gyorgy Sarvari
+---
+ app/xcf/xcf-load.c | 55 ++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 53 insertions(+), 2 deletions(-)
+
+diff --git a/app/xcf/xcf-load.c b/app/xcf/xcf-load.c
+index a01cf41..48f4fb1 100644
+--- a/app/xcf/xcf-load.c
++++ b/app/xcf/xcf-load.c
+@@ -485,6 +485,13 @@ xcf_load_image (Gimp     *gimp,
+        */
+       saved_pos = info->cp;
+ 
++      if (offset < saved_pos)
++        {
++          GIMP_LOG (XCF, "Invalid layer offset: %" G_GOFFSET_FORMAT
++                    " at offset: %" G_GOFFSET_FORMAT, offset, saved_pos);
++          goto error;
++        }
++
+       /* seek to the layer offset */
+       if (! xcf_seek_pos (info, offset, NULL))
+         goto error;
+@@ -625,6 +632,13 @@ xcf_load_image (Gimp     *gimp,
+        */
+       saved_pos = info->cp;
+ 
++      if (offset < saved_pos)
++        {
++          GIMP_LOG (XCF, "Invalid channel offset: %" G_GOFFSET_FORMAT
++                    " at offset: % "G_GOFFSET_FORMAT, offset, saved_pos);
++          goto error;
++        }
++
+       /* seek to the channel offset */
+       if (! xcf_seek_pos (info, offset, NULL))
+         goto error;
+@@ -634,6 +648,7 @@ xcf_load_image (Gimp     *gimp,
+       if (!channel)
+         {
+           n_broken_channels++;
++          GIMP_LOG (XCF, "Failed to load channel.");
+ 
+           if (! xcf_seek_pos (info, saved_pos, NULL))
+             goto error;
+@@ -1881,6 +1896,7 @@ xcf_load_layer (XcfInfo    *info,
+   const Babl        *format;
+   gboolean           is_fs_drawable;
+   gchar             *name;
++  goffset            cur_offset;
+ 
+   /* check and see if this is the drawable the floating selection
+    *  is attached to. if it is then we'll do the attachment in our caller.
+@@ -1998,6 +2014,7 @@ xcf_load_layer (XcfInfo    *info,
+     }
+ 
+   /* read the hierarchy and layer mask offsets */
++  cur_offset = info->cp;
+   xcf_read_offset (info, &hierarchy_offset,  1);
+   xcf_read_offset (info, &layer_mask_offset, 1);
+ 
+@@ -2007,6 +2024,11 @@ xcf_load_layer (XcfInfo    *info,
+    */
+   if (! gimp_viewable_get_children (GIMP_VIEWABLE (layer)))
+     {
++      if (hierarchy_offset < cur_offset)
++        {
++          GIMP_LOG (XCF, "Invalid layer hierarchy offset!");
++          goto error;
++        }
+       if (! xcf_seek_pos (info, hierarchy_offset, NULL))
+         goto error;
+ 
+@@ -2030,6 +2052,11 @@ xcf_load_layer (XcfInfo    *info,
+   /* read in the layer mask */
+   if (layer_mask_offset != 0)
+     {
++      if (layer_mask_offset < cur_offset)
++        {
++          GIMP_LOG (XCF, "Invalid layer mask offset!");
++          goto error;
++        }
+       if (! xcf_seek_pos (info, layer_mask_offset, NULL))
+         goto error;
+ 
+@@ -2086,6 +2113,7 @@ xcf_load_channel (XcfInfo   *info,
+   gboolean     is_fs_drawable;
+   gchar       *name;
+   GimpRGB      color = { 0.0, 0.0, 0.0, GIMP_OPACITY_OPAQUE };
++  goffset      cur_offset;
+ 
+   /* check and see if this is the drawable the floating selection
+    *  is attached to. if it is then we'll do the attachment in our caller.
+@@ -2118,9 +2146,16 @@ xcf_load_channel (XcfInfo   *info,
+ 
+   xcf_progress_update (info);
+ 
+-  /* read the hierarchy and layer mask offsets */
++  /* read the hierarchy offset */
++  cur_offset = info->cp;
+   xcf_read_offset (info, &hierarchy_offset, 1);
+ 
++  if (hierarchy_offset < cur_offset)
++    {
++      GIMP_LOG (XCF, "Invalid hierarchy offset!");
++      goto error;
++    }
++
+   /* read in the hierarchy */
+   if (! xcf_seek_pos (info, hierarchy_offset, NULL))
+     goto error;
+@@ -2164,6 +2199,7 @@ xcf_load_layer_mask (XcfInfo   *info,
+   gboolean       is_fs_drawable;
+   gchar         *name;
+   GimpRGB        color = { 0.0, 0.0, 0.0, GIMP_OPACITY_OPAQUE };
++  goffset        cur_offset;
+ 
+   /* check and see if this is the drawable the floating selection
+    *  is attached to. if it is then we'll do the attachment in our caller.
+@@ -2197,9 +2233,16 @@ xcf_load_layer_mask (XcfInfo   *info,
+ 
+   xcf_progress_update (info);
+ 
+-  /* read the hierarchy and layer mask offsets */
++  /* read the hierarchy offset */
++  cur_offset = info->cp;
+   xcf_read_offset (info, &hierarchy_offset, 1);
+ 
++  if (hierarchy_offset < cur_offset)
++    {
++      GIMP_LOG (XCF, "Invalid hierarchy offset!");
++      goto error;
++    }
++
+   /* read in the hierarchy */
+   if (! xcf_seek_pos (info, hierarchy_offset, NULL))
+     goto error;
+@@ -2237,6 +2280,7 @@ xcf_load_buffer (XcfInfo    *info,
+   gint        width;
+   gint        height;
+   gint        bpp;
++  goffset     cur_offset;
+ 
+   format = gegl_buffer_get_format (buffer);
+ 
+@@ -2252,8 +2296,15 @@ xcf_load_buffer (XcfInfo    *info,
+       bpp    != babl_format_get_bytes_per_pixel (format))
+     return FALSE;
+ 
++  cur_offset = info->cp;
+   xcf_read_offset (info, &offset, 1); /* top level */
+ 
++  if (offset < cur_offset)
++    {
++      GIMP_LOG (XCF, "Invalid buffer offset!");
++      return FALSE;
++    }
++
+   /* seek to the level offset */
+   if (! xcf_seek_pos (info, offset, NULL))
+     return FALSE;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch
new file mode 100644
index 0000000000..01f7c7fc20
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-32990-3.patch
@@ -0,0 +1,35 @@
+From 81860b9a56d83f429824aa0073c2152b49f9d332 Mon Sep 17 00:00:00 2001
+From: Jacob Boerema <jgboerema@gmail.com>
+Date: Sun, 5 Jun 2022 15:38:24 -0400
+Subject: [PATCH] app: fix #8230 crash in gimp_layer_invalidate_boundary when
+ channel is NULL
+
+gimp_channel_is_empty returns FALSE if channel is NULL. This causes
+gimp_layer_invalidate_boundary to crash if the mask channel is NULL.
+
+With a NULL channel gimp_channel_is_empty should return TRUE, just like
+the similar gimp_image_is_empty does, because returning FALSE here
+suggests we have a non empty channel.
+
+(cherry picked from commit 22af0bcfe67c1c86381f33975ca7fdbde6b36b39)
+
+CVE: CVE-2022-32990
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/744959433647bdefcdf00b3f0d575f6812cd0d6d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ app/core/gimpchannel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/app/core/gimpchannel.c b/app/core/gimpchannel.c
+index a9b7546..784551a 100644
+--- a/app/core/gimpchannel.c
++++ b/app/core/gimpchannel.c
+@@ -1824,7 +1824,7 @@ gimp_channel_boundary (GimpChannel         *channel,
+ gboolean
+ gimp_channel_is_empty (GimpChannel *channel)
+ {
+-  g_return_val_if_fail (GIMP_IS_CHANNEL (channel), FALSE);
++  g_return_val_if_fail (GIMP_IS_CHANNEL (channel), TRUE);
+ 
+   return GIMP_CHANNEL_GET_CLASS (channel)->is_empty (channel);
+ }
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 3f3e56f6ec..ad9d34ef6d 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -45,6 +45,9 @@ SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2022-30067.patch \
+           file://CVE-2022-32990-1.patch \
+           file://CVE-2022-32990-2.patch \
+           file://CVE-2022-32990-3.patch \
            "
 SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
 


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48485D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:53:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44451.1767019981641126189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PvdpruYf;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso87665435e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019980; x=1767624780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiu6wI+AzLjkPFSV3R3T7/ZFu0n5D7c8TkbgplQePR0=;
        b=PvdpruYf0HA4anD5KlioHAp6fWMEC+Za/vaHEDXWSPz/V/0OBjxiNx9oHI1BJXFk5B
         WSRRPg/CUK21WmlHz/J+tgz3+KX7EeOjW4CyfHtt+BM4n25JLE8NHrG6VQYyDDjv0Ye4
         xSef4Tjn5eZgY9ahhGyFquT5omQOatGUcZD7ZXIyfmS9IhdQQu2+dxKNp6nU+Ow4WBao
         ianYphm90CuFUfR+znMQK4yILAaiZIKfBoUx5KHYaKuOrIomanroCur422cAqL/trVb3
         iu25pF/uD2+eqQyFPfRTxCtWnqy6JxEJWP+PEejexU4aja8gNMPgAO1VNQ3YjZsS6jS1
         adCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019980; x=1767624780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiu6wI+AzLjkPFSV3R3T7/ZFu0n5D7c8TkbgplQePR0=;
        b=kiTqVtUk5hF+g09dxSTUW3vIzeilJxYlHMZBzHTZZsyxDp/Wu5fn3nPIAgDjcZRTJu
         bkIMZvwx6sNJYSphhI/lE4cnREP4o6Xk4mj9n3dhq3lH37AGV2MKVDeYfx1+SFdXTiQs
         8jt5NwjipYOQRqSYgsv+4RDnEauyQUkabRN1X6s0gnq+Ih99lw5n1TDHIjYXHP05YBww
         iQw9J4fXqEqxbKS7zvOS+2TxnolmnCOQ06bZHGgvP1Mfacm71opTq+rYFwpQAET3zpc8
         yVtNlLOEe2uJ0JdxqALlm39vO2i/YdEzeaeaUALjev7FTqgIvzrusZaIHS4ytjBZlGES
         WFZg==
X-Gm-Message-State: AOJu0Ywffkhd2n+NFRP/7mK7CVRMUEGToFIJS0U6orP1nb0dhO7+dBym
	gsMjJJxqYFQ5w5nk0dCjGs9BfqSSS6BJ4DD2dI4OAjETn4cSiYPLVIbt8sKNEw==
X-Gm-Gg: AY/fxX6Uj7M8ZTpqiMTSoIT88C012kNbztrH27tPA3EBLv82DzBAqlLf074BEvgv+Pa
	9PkUGCCTDds/vbOrvq+cez0k/YhGj5ioL3zQb/DHEnQ6Ctx8JB5bQhu3N3OrLdOa9pzF/enGFVZ
	GGwR0+9PzT4hQW/jzHKT8n8ayKDV4lZXS+3+GGS9ClfUbITFVGacKgXbU0tXIo3/eyqRfEPYwY8
	TSr9anB1DUlSDDxzFzNSHdiWVH0R/yCh1Q48eLz1Dxw2vsYAc1Ek1tXiDzoljzNMAhHZ9ah7EZ3
	0xTFQk5pfAkmLAx0mVsCiSrmPtG4lz3eFo18DpgD8W/ZbcKXnrybpTyup5Wx3waPBBCwvkdJZ/o
	rNI+4OAW+pcaYbgTcibev2gC8V+AM/m31uINwAFJynind4KdsIjaJ+mwrOOPw3Mso+5YRpcQFyK
	AaS5Zr+jZI
X-Google-Smtp-Source: AGHT+IHRrr7/RqcOMx0tSzTeVB8dqkvYA9hYsf1iTW+6o1tHTOj2grXIBfDC4DeVQ9iylTc4DNrNoQ==
X-Received: by 2002:a05:600c:8b56:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d5b21d77emr21667215e9.36.1767019979909;
        Mon, 29 Dec 2025 06:52:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm601067785e9.6.2025.12.29.06.52.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:52:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] gimp: patch CVE-2025-14425
Date: Mon, 29 Dec 2025 15:52:56 +0100
Message-ID: <20251229145256.489179-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145256.489179-1-skandigraun@gmail.com>
References: <20251229145256.489179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122994

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14425

Backport the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-14425.patch            | 79 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
new file mode 100644
index 0000000000..44e9587570
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
@@ -0,0 +1,79 @@
+From 042e27792026460badbe49664c02fe181e95cb2b Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 12 Nov 2025 13:25:44 +0000
+Subject: [PATCH] plug-ins: Mitigate ZDI-CAN-28248 for JP2 images
+
+From: Alx Sa <cmyk.student@gmail.com>
+
+Resolves #15285
+Per the report, it's possible to exceed the size of the pixel buffer
+with a high precision_scaled value, as we size it to the width * bpp.
+This patch includes precision_scaled in the allocation calculation.
+It also adds a g_size_checked_mul () check to ensure there's no
+overflow, and moves the pixel and buffer memory freeing to occur
+in the out section so that it always runs even on failure.
+
+CVE: CVE-2025-14425
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/cd1c88a0364ad1444c06536731972a99bd8643fd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-jp2-load.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/plug-ins/common/file-jp2-load.c b/plug-ins/common/file-jp2-load.c
+index 064b616..604313a 100644
+--- a/plug-ins/common/file-jp2-load.c
++++ b/plug-ins/common/file-jp2-load.c
+@@ -1045,14 +1045,15 @@ load_image (GimpProcedure     *procedure,
+   GimpColorProfile    *profile    = NULL;
+   GimpImage           *gimp_image = NULL;
+   GimpLayer           *layer;
++  GeglBuffer          *buffer     = NULL;
++  guchar              *pixels     = NULL;
++  gsize                pixels_size;
+   GimpImageType        image_type;
+   GimpImageBaseType    base_type;
+   gint                 width;
+   gint                 height;
+   gint                 num_components;
+-  GeglBuffer          *buffer;
+   gint                 i, j, k, it;
+-  guchar              *pixels;
+   const Babl          *file_format;
+   gint                 bpp;
+   GimpPrecision        image_precision;
+@@ -1318,7 +1319,15 @@ load_image (GimpProcedure     *procedure,
+   bpp = babl_format_get_bytes_per_pixel (file_format);
+ 
+   buffer = gimp_drawable_get_buffer (GIMP_DRAWABLE (layer));
+-  pixels = g_new0 (guchar, width * bpp);
++
++  if (! g_size_checked_mul (&pixels_size, width, (bpp * (precision_scaled / 8))))
++    {
++      g_set_error (error, GIMP_PLUG_IN_ERROR, 0,
++                   _("Defined row size is too large in JP2 image '%s'."),
++                   gimp_file_get_utf8_name (file));
++      goto out;
++    }
++  pixels = g_new0 (guchar, pixels_size);
+ 
+   for (i = 0; i < height; i++)
+     {
+@@ -1344,13 +1353,13 @@ load_image (GimpProcedure     *procedure,
+         gegl_buffer_set (buffer, GEGL_RECTANGLE (0, i, width, 1), 0,
+                          file_format, pixels, GEGL_AUTO_ROWSTRIDE);
+     }
+-
+-  g_free (pixels);
+-
+-  g_object_unref (buffer);
+   gimp_progress_update (1.0);
+ 
+  out:
++  if (pixels)
++    g_free (pixels);
++  if (buffer)
++    g_object_unref (buffer);
+   if (profile)
+     g_object_unref (profile);
+   if (image)
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
index bc55aed06f..fa192555bc 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
@@ -64,6 +64,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
            file://CVE-2025-14422.patch \
            file://CVE-2025-14423.patch \
            file://CVE-2025-14424.patch \
+           file://CVE-2025-14425.patch \
            "
 SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
 


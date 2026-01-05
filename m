Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896A2C2A08D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61067.1767607365443741414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g6Tv/ilc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so78171675e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607364; x=1768212164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Osp8JKgSiTGnuManCcrkwZdzHQCcslUCIpQBzJoUX8o=;
        b=g6Tv/ilc7Ry0LPpjg4lurWynypIGxrWhfTdbfdJ2GdvHa2gGUDhaU007CUwosj/5XY
         NNQGsTaEPn6wVLagu++g/kFKbXvOkRUg4vJk2GskYKgrQDnvdQB/CNBPiDI+LR7j102v
         X8XDigqrj5c7txsovufVOIi12kPrJWy9LbUlC9yE/lry9lA9totP1yof193L4zLKlRii
         OFNMxdVzEIsVyv1skqT+tezC+hUj2+LkGRmksvFOz4+o4tYcrIM+MHzfMPg/b0VcZBeF
         W7xoyda/RP9MZ4ZUnd3qu9WleWkw03AA2B0fatoxbhIuXe6mTyOvPIFrz4KuDzRi7ntx
         6otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607364; x=1768212164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Osp8JKgSiTGnuManCcrkwZdzHQCcslUCIpQBzJoUX8o=;
        b=GspJ65tObs9E0TKPaMqgcplqLyEW+ORwX3/nVIxsWiuUd8vg57sX15vKzzLogJBEEw
         RYzUXpNd+jiEGiKPHEpMQU1mCMWwFc9YdWRAucBZHQzcaKmpfny6d9NOacKnkmMreAjA
         rtpDuq82oXVeV6LL/6JGpGfqY/7ftyR2E79csHyfrsdXHhUID71vDBqz4rrF5CRxKI9p
         OH3160O0D6DCAuswdPpkD48NEz2V9w3+9vWiYcurkztE1CQCWMpGDssGf8CVb4oDvRX1
         vO2IU/q621TqFwryBUANQVIbstBRYfQFpDsh8CTpcFm0T5Htw+GoOaCmmP+7YZaMaqDj
         VTxw==
X-Gm-Message-State: AOJu0YwyXxZjiekKKI96lzfRx21kKnOqKd9xbcbTtT8Vee8Kgd/kzx78
	ifvKoFwrUJ4ilu/E58nScrrfMMUK5G2W+7ECT7b0VOuaOGHhcfVXrkPlgzkh2Q==
X-Gm-Gg: AY/fxX7v8+MiCVIhTLZq7Sdg+NdjxMDvDdjc8j8osLtPNi0VxBcFRLhVZWmCgDZqYWb
	dft687PootdK6A3X/mAKxe3ne0Z2HpQN6s8sRn/6fGSdQeAeuY8wvJdiJUUwg0BHyvqru4FUQjq
	LI2TvlLZ7uW4JFE3vtsyozDQZN9APSzuRJFGIFfAvwXpk7eA/hpofZn+D3pXigZEiag+t9khDWR
	9rLkaUl5jD0R+DB7bSJI2GdQXnR5ehU4urfL3bBV0TrUAejQ8bLKzJVI3p5WR4XXQowwiPF7BzM
	1YvBFmJCYrd62U2thurHad8dFe5Mdj2Jl3hZzEVin2c3gps5g0Rri5M7NJQvPOCGE4gv8ckRmuR
	j6bv2+BZv1jfBV8rjMbfwlM5jULOfvs/GHz2LhwdzOjEUAAQ6TkKTrs1rMAlw6FrJOl6S1XaSNL
	CNL/gc/oANM85uy44KY7o=
X-Google-Smtp-Source: AGHT+IFS/SYDxfjU1fzZS4+ZP9BoVF7PWnL4D5wv9dtyESpzaWkfPIYEb5KOyHHGVK8U6sJm47tc5w==
X-Received: by 2002:a05:600c:37ce:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47d195911admr605790895e9.33.1767607363592;
        Mon, 05 Jan 2026 02:02:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 07/17] gimp: patch CVE-2025-14425
Date: Mon,  5 Jan 2026 11:02:27 +0100
Message-ID: <20260105100237.3081345-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123138

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14425

Backport the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 49732c90c0a4e1b3fc3679456ce2bd2819b144d0)
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
 


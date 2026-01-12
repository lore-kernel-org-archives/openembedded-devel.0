Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5573D2503A
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:00 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27574.1768196094544089940
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6HhSfJi;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c6d3676455so3097211a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768196093; x=1768800893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FI3tCj74+mKBrJ0jQjrPPs5Q6VrfWBXlD9VLOuLbuD0=;
        b=A6HhSfJi1kmA7n5VtC57/UAqeD4kjPC+sI/liYcM7j9EYCWhDP2lr7rhhgECzZOR6A
         IZJLmB8+ojMqWL77flKVeiXY5R6e+QulORcHZsPLH0es64EoJ8n0eN77Qm6j+G5+Eb2k
         ltnJJzET7bbWMDdwAVLHuIY39dZLTi5mNuIoz04i89gz5ZSwVKOxjJwlsoxveMvlPKqw
         dNs/oLXoHuk3Fo2ocl5qavhzISL5kyygor4mJa5STqmk+sbOT4bftq4G//JPbPX4FZyv
         gPM0BZZgcoh4inBcSTF07JBl7y2RMi4/1M+VEBAMfDPVYnYZxFecBI9QR45BMphX9QsS
         Jdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196093; x=1768800893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FI3tCj74+mKBrJ0jQjrPPs5Q6VrfWBXlD9VLOuLbuD0=;
        b=nMn5GudrSbOzchcfhfRAkq2bP5oYXiaYr1zE5SZc/8Ok0n5P2UBo5GzT8voVG+r3D8
         PA8KXzLp73dssulAYh2QbtXP0Z87DAxK3ZLOYbIkW1TA4aeZHDh+cr/6ddjlC8WsMODl
         +BrroWLkRsdlnrQklVBltcSxkSOOXAehS4F2BhzwUXB5pMe8eUkXBxMt9N4bdca/2rPK
         WImvvP9rM8jDjFeF8Kz6rJZq2GG1gZMlbCP5LtKS4MWkwk4EK9XzkySiNQevWn6tHAaY
         xwVE7Efd5uLCIrBfYBmUpyYPdxnmzRdkwhgqm5y2qNiLHv9zNFeY1AEha761JobHw40q
         MAbg==
X-Gm-Message-State: AOJu0YwP7hsat8QOS7BEUF4GSrUNUJMECTv1GBSKli5/TsZfJ1aY57Jk
	t97F9tJxkoE04TrArmCLrsmuU/akdzvmFckLNO7Vdn+v4vKfDOJ1r/P9roNbeg==
X-Gm-Gg: AY/fxX6L6O2tLzWJgQZkydcwOYSr1Nww4dfF/oD5Ir+xOo2ac1g8nqH4DxKgGigpjqh
	dNvFxUGQMR61L1rz7dkoLmsApVUX4byQGZqOnE+79AaW10q6yse4amtHqXFQaY4dbqWEsZTtars
	l5e+6UdyONZ6EEsvjwiJCOjrbyiF/PYhAnv4jVHJ3uXinsR9/4/Wg/zDmGUN3TfkbA6Mwsm6snz
	Xx/m/V+GC2uS6tmtHFsscM1b0rYckcXP4i4vnBiVYrFWxwxMCx6ruCPOSUmxVymIaRl5EaZb2Ab
	v+yk8keKWBjgWn3yWSsVYjKJC6R8Qm4LojtT5+8caMwPMUnaSj6VfC3FwH3pLs6InqKU+AdO++q
	x8zuxHi8Ml6wA/X9RRLE9FSscytpEN0kKUJ5JjZAA9pjK6TjqKbtSIM8A4JNQeRFkRzMiqD/XQR
	NBlQYkJ0G//HfeRpGz1hM5nds=
X-Google-Smtp-Source: AGHT+IHHSHDAsqj+NtNNYN4Q39HDOb29BXVyypf51koOEJ9v7xB/vq8Cp1qXHxyBgxFg0k85iolDSA==
X-Received: by 2002:a05:6830:6515:b0:7c7:5458:75f8 with SMTP id 46e09a7af769-7ce50a89807mr8713349a34.29.1768196093523;
        Sun, 11 Jan 2026 21:34:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm13038512a34.23.2026.01.11.21.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:34:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][scarthgap][PATCH 3/6] gimp: patch CVE-2025-14422
Date: Mon, 12 Jan 2026 18:34:37 +1300
Message-ID: <20260112053440.3694238-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
References: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123352

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gimp/gimp/CVE-2025-14422.patch            | 64 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  4 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
new file mode 100644
index 0000000000..acaf5f199b
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
@@ -0,0 +1,64 @@
+From bea9e174a3c4c02338f6c64bab05e6a8c667c09f Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Sun, 23 Nov 2025 16:43:51 +0000
+Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
+
+Resolves #15286
+Adds a check to the memory allocation
+in pnm_load_raw () with g_size_checked_mul ()
+to see if the size would go out of bounds.
+If so, we don't try to allocate and load the
+image.
+
+CVE: CVE-2025-14422
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/4ff2d773d58064e6130495de498e440f4a6d5edb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ plug-ins/common/file-pnm.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
+index 2132eeccf4..f514c2b1d7 100644
+--- a/plug-ins/common/file-pnm.c
++++ b/plug-ins/common/file-pnm.c
+@@ -554,7 +554,7 @@ load_image (GFile   *file,
+             GError **error)
+ {
+   GInputStream    *input;
+-  GeglBuffer      *buffer;
++  GeglBuffer      *buffer = NULL;
+   gint32 volatile  image_ID = -1;
+   gint32           layer_ID;
+   char             buf[BUFLEN + 4];  /* buffer for random things like scanning */
+@@ -584,6 +584,9 @@ load_image (GFile   *file,
+       g_object_unref (input);
+       g_free (pnminfo);
+ 
++      if (buffer)
++        g_object_unref (buffer);
++
+       if (image_ID != -1)
+         gimp_image_delete (image_ID);
+ 
+@@ -819,6 +822,7 @@ pnm_load_raw (PNMScanner *scan,
+   GInputStream *input;
+   gint          bpc;
+   guchar       *data, *d;
++  gsize         data_size;
+   gushort      *s;
+   gint          x, y, i;
+   gint          start, end, scanlines;
+@@ -829,7 +833,12 @@ pnm_load_raw (PNMScanner *scan,
+     bpc = 1;
+ 
+   /* No overflow as long as gimp_tile_height() < 1365 = 2^(31 - 18) / 6 */
+-  data = g_new (guchar, gimp_tile_height () * info->xres * info->np * bpc);
++  if (! g_size_checked_mul (&data_size, gimp_tile_height (), info->xres) ||
++      ! g_size_checked_mul (&data_size, data_size, info->np)             ||
++      ! g_size_checked_mul (&data_size, data_size, bpc))
++    CHECK_FOR_ERROR (FALSE, info->jmpbuf, _("Unsupported maximum value."));
++
++  data = g_new (guchar, data_size);
+ 
+   input = pnmscanner_input (scan);
+ 
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 32b51dcdb5..096f40f79d 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -46,7 +46,9 @@ SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-configure-Keep-first-line-of-compiler-version-string.patch \
-           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch"
+           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch \
+           file://CVE-2025-14422.patch \
+"
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 
 EXTRA_OECONF = "--disable-python \


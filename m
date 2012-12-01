Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TebWl-0005un-9U
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2012 02:05:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so612694eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 16:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wZgPj7dAru1Jcj5VdiuZfTOpSlIX4vgQHaHND4GaGzg=;
	b=vc58P7UY76VDy8b5Z0NebYJtWpy39smXH3EC868pNijlz3mKo1Ky0GRbwLRKYYzAtZ
	kQQ0hKoZw8KTEfVzRWzmUjJG8GaDAYDKhr2c2gCmRuhNJK6ZCjm9YmjOfzzuxSHy65NS
	D7apTudjjvRlrkN3suRS/vpC2TolMDTqyhmg6ihzLblh14WzSkLNQahSRvcF8F3lrm6l
	kqPhj1A2SXzsMJZyq9IY1SfD9ycBx/WsjFQvQ8oSmhaMdXSSTDFJ3EVpDaSmDCrDxvas
	4XVQbnFdKsqw/kKtoESBqhZ1+knpIRMEiC07R4RkKCwXoa4B6ptwTkScaR4tphtnMklb
	yO4w==
Received: by 10.14.175.133 with SMTP id z5mr10346486eel.15.1354323097788;
	Fri, 30 Nov 2012 16:51:37 -0800 (PST)
Received: from localhost.localdomain (p5B0A35D2.dip.t-dialin.net.
	[91.10.53.210])
	by mx.google.com with ESMTPS id 43sm13899997eed.10.2012.11.30.16.51.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 16:51:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2012 01:51:21 +0100
Message-Id: <1354323081-8405-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1354323081-8405-1-git-send-email-schnitzeltony@googlemail.com>
References: <1354323081-8405-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/3] gimp: update to 2.8.2
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
X-List-Received-Date: Sat, 01 Dec 2012 01:05:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gimp/gimp/gimp-2.6.11-poppler18.patch          |  150 --------------------
 .../gimp/{gimp_2.6.11.bb => gimp_2.8.2.bb}         |   13 +-
 2 files changed, 5 insertions(+), 158 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
 rename meta-oe/recipes-graphics/gimp/{gimp_2.6.11.bb => gimp_2.8.2.bb} (60%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch b/meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
deleted file mode 100644
index 0ebfd89..0000000
--- a/meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 9b3e1c91fd2eac69da6947ec9c7fbf10096ba237 Mon Sep 17 00:00:00 2001
-From: Mukund Sivaraman <muks@banu.com>
-Date: Wed, 20 Apr 2011 13:25:44 +0000
-Subject: file-pdf-load: Don't use deprecated API (bug #646947)
-
-Upstream-Status: Applied
-
----
-diff --git a/plug-ins/common/file-pdf-load.c b/plug-ins/common/file-pdf-load.c
-index c2d5512..6183403 100644
---- a/plug-ins/common/file-pdf.c
-+++ b/plug-ins/common/file-pdf.c
-@@ -4,6 +4,9 @@
-  *
-  * Copyright (C) 2005 Nathan Summers
-  *
-+ * Some code borrowed from poppler.git/glib/poppler-page.cc
-+ * Copyright (C) 2005, Red Hat, Inc.
-+ *
-  * This program is free software; you can redistribute it and/or modify
-  * it under the terms of the GNU General Public License as published by
-  * the Free Software Foundation; either version 2 of the License, or
-@@ -582,6 +585,84 @@ layer_from_pixbuf (gint32        image,
-   return layer;
- }
- 
-+static void
-+copy_cairo_surface_to_pixbuf (cairo_surface_t *surface,
-+                              GdkPixbuf       *pixbuf)
-+{
-+  int cairo_width, cairo_height, cairo_rowstride;
-+  unsigned char *pixbuf_data, *dst, *cairo_data;
-+  int pixbuf_rowstride, pixbuf_n_channels;
-+  unsigned int *src;
-+  int x, y;
-+
-+  cairo_width = cairo_image_surface_get_width (surface);
-+  cairo_height = cairo_image_surface_get_height (surface);
-+  cairo_rowstride = cairo_image_surface_get_stride (surface);
-+  cairo_data = cairo_image_surface_get_data (surface);
-+
-+  pixbuf_data = gdk_pixbuf_get_pixels (pixbuf);
-+  pixbuf_rowstride = gdk_pixbuf_get_rowstride (pixbuf);
-+  pixbuf_n_channels = gdk_pixbuf_get_n_channels (pixbuf);
-+
-+  if (cairo_width > gdk_pixbuf_get_width (pixbuf))
-+    cairo_width = gdk_pixbuf_get_width (pixbuf);
-+  if (cairo_height > gdk_pixbuf_get_height (pixbuf))
-+    cairo_height = gdk_pixbuf_get_height (pixbuf);
-+
-+  for (y = 0; y < cairo_height; y++)
-+    {
-+      src = (unsigned int *) (cairo_data + y * cairo_rowstride);
-+      dst = pixbuf_data + y * pixbuf_rowstride;
-+
-+      for (x = 0; x < cairo_width; x++)
-+        {
-+          dst[0] = (*src >> 16) & 0xff;
-+          dst[1] = (*src >> 8) & 0xff;
-+          dst[2] = (*src >> 0) & 0xff;
-+
-+          if (pixbuf_n_channels == 4)
-+            dst[3] = (*src >> 24) & 0xff;
-+
-+          dst += pixbuf_n_channels;
-+          src++;
-+        }
-+    }
-+}
-+
-+static GdkPixbuf *
-+render_page_to_pixbuf (PopplerPage *page,
-+                       int          width,
-+                       int          height,
-+                       double       scale)
-+{
-+  GdkPixbuf *pixbuf;
-+  cairo_surface_t *surface;
-+  cairo_t *cr;
-+
-+  pixbuf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8, width, height);
-+  surface = cairo_image_surface_create (CAIRO_FORMAT_ARGB32, width, height);
-+  cr = cairo_create (surface);
-+
-+  cairo_save (cr);
-+  cairo_translate (cr, 0.0, 0.0);
-+
-+  if (scale != 1.0)
-+    cairo_scale (cr, scale, scale);
-+
-+  poppler_page_render (page, cr);
-+  cairo_restore (cr);
-+
-+  cairo_set_operator (cr, CAIRO_OPERATOR_DEST_OVER);
-+  cairo_set_source_rgb (cr, 1.0, 1.0, 1.0);
-+  cairo_paint (cr);
-+
-+  cairo_destroy (cr);
-+  copy_cairo_surface_to_pixbuf (surface, pixbuf);
-+  cairo_surface_destroy (surface);
-+
-+  return pixbuf;
-+}
-+
- static gint32
- load_image (PopplerDocument        *doc,
-             const gchar            *filename,
-@@ -613,7 +694,7 @@ load_image (PopplerDocument        *doc,
-       gdouble      page_width;
-       gdouble      page_height;
- 
--      GdkPixbuf   *buf;
-+      GdkPixbuf   *pixbuf;
-       gint         width;
-       gint         height;
- 
-@@ -643,15 +724,13 @@ load_image (PopplerDocument        *doc,
-           gimp_image_set_resolution (image_ID, resolution, resolution);
-         }
- 
--      buf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8, width, height);
--
--      poppler_page_render_to_pixbuf (page, 0, 0, width, height, scale, 0, buf);
-+      pixbuf = render_page_to_pixbuf (page, width, height, scale);
- 
--      layer_from_pixbuf (image_ID, page_label, i, buf,
-+      layer_from_pixbuf (image_ID, page_label, i, pixbuf,
-                          doc_progress, 1.0 / pages->n_pages);
- 
-       g_free (page_label);
--      g_object_unref (buf);
-+      g_object_unref (pixbuf);
- 
-       doc_progress = (double) (i + 1) / pages->n_pages;
-       gimp_progress_update (doc_progress);
-@@ -729,11 +808,7 @@ get_thumbnail (PopplerDocument *doc,
-       width  *= scale;
-       height *= scale;
- 
--      pixbuf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8,
--                               width, height);
--
--      poppler_page_render_to_pixbuf (page,
--                                     0, 0, width, height, scale, 0, pixbuf);
-+      pixbuf = render_page_to_pixbuf (page, width, height, scale);
-     }
- 
-   g_object_unref (page);
---
-cgit v0.9.0.2
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
similarity index 60%
rename from meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
index f952883..44e66ea 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
@@ -1,19 +1,16 @@
 DESCRIPTION = "The GIMP is the GNU Image Manipulation Program."
 HOMEPAGE = "http://www.gimp.org"
 SECTION = "x11/graphics"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=878e3965c7b52d85827c75f5a2f3b314"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff webkit-gtk lcms gegl poppler"
 
-PR = "r1"
-
 inherit gnome
 
-SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.6/gimp-${PV}.tar.bz2 \
-           file://gimp-2.6.11-poppler18.patch"
-SRC_URI[md5sum] = "bb2939fe13e54fc7255cef5d097bb5dd"
-SRC_URI[sha256sum] = "9b6d08d0803b3912ea596d1b77b9c21ee13778c23388a225c004b8c1587cb0a1"
+SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b542138820ca3a41cbd63fc331907955"
+SRC_URI[sha256sum] = "0cd1a7e67e132ead810e16e31ff929394c83fcf841e4a295c45d6f3829601ad9"
 
 EXTRA_OECONF = "--disable-python \
                 --without-wmf"
-- 
1.7.4.4




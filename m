Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RpfPB-0001AB-Q7
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 13:23:17 +0100
Received: by eekd41 with SMTP id d41so1322271eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 04:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=YKx4f5thBW/Iot0owVdjLZcfAZmZINPb3AWtBdCmmv0=;
	b=UZeWwQ+h/dq6SIblp3Bc8uQ0FlBwg7PPYWDFA1EOhqvHZlEquncM7lQDrokHY4Ro6Y
	weF8dWofbHqRI7mFEyefD6Z2LQ/rYTTXwr9qwJNHKqyCAgGIc/qrNOhDlNYBYWW2R6qz
	pblIOc88L3yeocTJX4UUp/K1vpIMNlvGDCTRU=
Received: by 10.14.17.101 with SMTP id i77mr4446991eei.30.1327407332634;
	Tue, 24 Jan 2012 04:15:32 -0800 (PST)
Received: from localhost.localdomain (ip-95-222-156-232.unitymediagroup.de.
	[95.222.156.232])
	by mx.google.com with ESMTPS id r2sm66900145eef.7.2012.01.24.04.15.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 04:15:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jan 2012 13:15:37 +0100
Message-Id: <1327407337-28571-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1327407337-28571-1-git-send-email-schnitzeltony@googlemail.com>
References: <1327407337-28571-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][V2 1/1] gimp: initial add 2.6.11
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
X-List-Received-Date: Tue, 24 Jan 2012 12:23:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* based on oe-classic [1]-[2]
* build tested incremental & from scratch in angstrom environment
* run tested on overo

[1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gimp.inc
[2] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gimp_2.6.8.bb

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gimp/gimp/gimp-2.6.11-poppler18.patch          |  150 ++++++++++++++++++++
 meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb       |   24 +++
 2 files changed, 174 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb

diff --git a/meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch b/meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
new file mode 100644
index 0000000..0ebfd89
--- /dev/null
+++ b/meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
@@ -0,0 +1,150 @@
+From 9b3e1c91fd2eac69da6947ec9c7fbf10096ba237 Mon Sep 17 00:00:00 2001
+From: Mukund Sivaraman <muks@banu.com>
+Date: Wed, 20 Apr 2011 13:25:44 +0000
+Subject: file-pdf-load: Don't use deprecated API (bug #646947)
+
+Upstream-Status: Applied
+
+---
+diff --git a/plug-ins/common/file-pdf-load.c b/plug-ins/common/file-pdf-load.c
+index c2d5512..6183403 100644
+--- a/plug-ins/common/file-pdf.c
++++ b/plug-ins/common/file-pdf.c
+@@ -4,6 +4,9 @@
+  *
+  * Copyright (C) 2005 Nathan Summers
+  *
++ * Some code borrowed from poppler.git/glib/poppler-page.cc
++ * Copyright (C) 2005, Red Hat, Inc.
++ *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+  * the Free Software Foundation; either version 2 of the License, or
+@@ -582,6 +585,84 @@ layer_from_pixbuf (gint32        image,
+   return layer;
+ }
+ 
++static void
++copy_cairo_surface_to_pixbuf (cairo_surface_t *surface,
++                              GdkPixbuf       *pixbuf)
++{
++  int cairo_width, cairo_height, cairo_rowstride;
++  unsigned char *pixbuf_data, *dst, *cairo_data;
++  int pixbuf_rowstride, pixbuf_n_channels;
++  unsigned int *src;
++  int x, y;
++
++  cairo_width = cairo_image_surface_get_width (surface);
++  cairo_height = cairo_image_surface_get_height (surface);
++  cairo_rowstride = cairo_image_surface_get_stride (surface);
++  cairo_data = cairo_image_surface_get_data (surface);
++
++  pixbuf_data = gdk_pixbuf_get_pixels (pixbuf);
++  pixbuf_rowstride = gdk_pixbuf_get_rowstride (pixbuf);
++  pixbuf_n_channels = gdk_pixbuf_get_n_channels (pixbuf);
++
++  if (cairo_width > gdk_pixbuf_get_width (pixbuf))
++    cairo_width = gdk_pixbuf_get_width (pixbuf);
++  if (cairo_height > gdk_pixbuf_get_height (pixbuf))
++    cairo_height = gdk_pixbuf_get_height (pixbuf);
++
++  for (y = 0; y < cairo_height; y++)
++    {
++      src = (unsigned int *) (cairo_data + y * cairo_rowstride);
++      dst = pixbuf_data + y * pixbuf_rowstride;
++
++      for (x = 0; x < cairo_width; x++)
++        {
++          dst[0] = (*src >> 16) & 0xff;
++          dst[1] = (*src >> 8) & 0xff;
++          dst[2] = (*src >> 0) & 0xff;
++
++          if (pixbuf_n_channels == 4)
++            dst[3] = (*src >> 24) & 0xff;
++
++          dst += pixbuf_n_channels;
++          src++;
++        }
++    }
++}
++
++static GdkPixbuf *
++render_page_to_pixbuf (PopplerPage *page,
++                       int          width,
++                       int          height,
++                       double       scale)
++{
++  GdkPixbuf *pixbuf;
++  cairo_surface_t *surface;
++  cairo_t *cr;
++
++  pixbuf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8, width, height);
++  surface = cairo_image_surface_create (CAIRO_FORMAT_ARGB32, width, height);
++  cr = cairo_create (surface);
++
++  cairo_save (cr);
++  cairo_translate (cr, 0.0, 0.0);
++
++  if (scale != 1.0)
++    cairo_scale (cr, scale, scale);
++
++  poppler_page_render (page, cr);
++  cairo_restore (cr);
++
++  cairo_set_operator (cr, CAIRO_OPERATOR_DEST_OVER);
++  cairo_set_source_rgb (cr, 1.0, 1.0, 1.0);
++  cairo_paint (cr);
++
++  cairo_destroy (cr);
++  copy_cairo_surface_to_pixbuf (surface, pixbuf);
++  cairo_surface_destroy (surface);
++
++  return pixbuf;
++}
++
+ static gint32
+ load_image (PopplerDocument        *doc,
+             const gchar            *filename,
+@@ -613,7 +694,7 @@ load_image (PopplerDocument        *doc,
+       gdouble      page_width;
+       gdouble      page_height;
+ 
+-      GdkPixbuf   *buf;
++      GdkPixbuf   *pixbuf;
+       gint         width;
+       gint         height;
+ 
+@@ -643,15 +724,13 @@ load_image (PopplerDocument        *doc,
+           gimp_image_set_resolution (image_ID, resolution, resolution);
+         }
+ 
+-      buf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8, width, height);
+-
+-      poppler_page_render_to_pixbuf (page, 0, 0, width, height, scale, 0, buf);
++      pixbuf = render_page_to_pixbuf (page, width, height, scale);
+ 
+-      layer_from_pixbuf (image_ID, page_label, i, buf,
++      layer_from_pixbuf (image_ID, page_label, i, pixbuf,
+                          doc_progress, 1.0 / pages->n_pages);
+ 
+       g_free (page_label);
+-      g_object_unref (buf);
++      g_object_unref (pixbuf);
+ 
+       doc_progress = (double) (i + 1) / pages->n_pages;
+       gimp_progress_update (doc_progress);
+@@ -729,11 +808,7 @@ get_thumbnail (PopplerDocument *doc,
+       width  *= scale;
+       height *= scale;
+ 
+-      pixbuf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8,
+-                               width, height);
+-
+-      poppler_page_render_to_pixbuf (page,
+-                                     0, 0, width, height, scale, 0, pixbuf);
++      pixbuf = render_page_to_pixbuf (page, width, height, scale);
+     }
+ 
+   g_object_unref (page);
+--
+cgit v0.9.0.2
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb b/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
new file mode 100644
index 0000000..31e8925
--- /dev/null
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "The GIMP is the GNU Image Manipulation Program."
+HOMEPAGE = "http://www.gimp.org"
+SECTION = "x11/graphics"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=878e3965c7b52d85827c75f5a2f3b314"
+
+DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff webkit-gtk lcms gegl poppler"
+
+inherit gnome
+
+SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.6/gimp-${PV}.tar.bz2 \
+           file://gimp-2.6.11-poppler18.patch"
+SRC_URI[md5sum] = "bb2939fe13e54fc7255cef5d097bb5dd"
+SRC_URI[sha256sum] = "9b6d08d0803b3912ea596d1b77b9c21ee13778c23388a225c004b8c1587cb0a1"
+
+EXTRA_OECONF = "--disable-python \
+                --without-libwmf"
+
+do_configure_append() {
+	find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+	find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
+}
+
+FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
-- 
1.7.6.4




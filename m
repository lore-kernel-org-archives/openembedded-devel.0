Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5090360810
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 12:09:33 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id uo1so1630795pbc.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pz2etXAVamY3cEwwN1CJDbgeIlMKRag19vbxnN5qEWo=;
	b=spfg7/zM32tQdW3sl7a8dRW6JpLOf8VXLBrLcIibO5cpJD1sXvWWTVRiXqibH6TQv6
	Qchqzvuk0DdFxTkM3s09LDMHEPGTgseLth5iCHEPOxZLuwClOaGt5mhwi70/dJ+kzPKr
	zjNV9ji5fsYK51cenAgpnuUo4ESaEQJviju0ML/wTdIBeuBhSk3U282GNAncBgDXEfQW
	8t3GqFbZiDWmVCkV6PCUdMMKUzgLsUUsxVLaxH0Jkq0rhLMNjEg7DcfH080yydgFFi41
	M1lyMjCeYs0ggPrRre6jLcJCLiGGP0hCyFdZhcIXpNFATcIGJi3ke9NJGhmbfAupJajo
	siKg==
X-Received: by 10.68.108.196 with SMTP id hm4mr7522979pbb.88.1369224574503;
	Wed, 22 May 2013 05:09:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t1sm7850154pab.12.2013.05.22.05.09.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 05:09:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 14:09:03 +0200
Message-Id: <1369224543-4539-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1369224543-4539-1-git-send-email-Martin.Jansa@gmail.com>
References: <1369224543-4539-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] evas: Add patch to fix segfaults
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
X-List-Received-Date: Wed, 22 May 2013 12:09:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas/revert.r83789.patch | 146 ++++++++++++++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.7.bb            |   3 +-
 2 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/efl/evas/revert.r83789.patch

diff --git a/meta-efl/recipes-efl/efl/evas/revert.r83789.patch b/meta-efl/recipes-efl/efl/evas/revert.r83789.patch
new file mode 100644
index 0000000..a5b8ce6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas/revert.r83789.patch
@@ -0,0 +1,146 @@
+From 134e338a40af875d5f7b221a7a8dbeefa7a48f55 Mon Sep 17 00:00:00 2001
+From: Daniel Willmann <d.willmann@samsung.com>
+Date: Tue, 07 May 2013 09:49:53 +0000
+Subject: Revert "Backport rev 83789"
+
+This reverts commit 9a7a28b7582f516c67b23c4bb1a016cfc2ec5b31.
+Was reverted long ago in efl as it doesn't actually work.
+
+Signed-off-by: Daniel Willmann <d.willmann@samsung.com>
+---
+diff --git a/ChangeLog b/ChangeLog
+index 54da44a..93d3834 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1294,3 +1294,7 @@
+ 
+         * Evas text: Fixed line size calculation when using multiple
+         fonts.
++
++2013-05-16	Daniel Wilmann
++        * x11 backend: Revert "Fix memory usage spike when rotating with the
++				software_x11 engine". This doesn't actually work.
+diff --git a/NEWS b/NEWS
+index 6188963..c8002db 100644
+--- a/NEWS
++++ b/NEWS
+@@ -13,6 +13,7 @@ Fixes:
+    * Evas: If an object goes to be hidden without replacing the cur/prev state info, the object context can be corrupted at the next show time. Now it replaces the cur/prev in that rare case.
+    * Fix recursive proxy image rendering to just render black
+    * Evas text: Fixed line size calculation when using multiple fonts.
++   * Revert "Fix memory usage spike when rotating with the software_x11 engine."
+ 
+ Evas 1.7.6
+     * Fix SIGFPE in evas map update if image is 0.
+diff --git a/src/modules/engines/software_x11/evas_xlib_outbuf.c b/src/modules/engines/software_x11/evas_xlib_outbuf.c
+index 3cb1ea0..e337e99 100644
+--- a/src/modules/engines/software_x11/evas_xlib_outbuf.c
++++ b/src/modules/engines/software_x11/evas_xlib_outbuf.c
+@@ -362,7 +362,7 @@ evas_software_xlib_outbuf_setup_x(int w, int h, int rot, Outbuf_Depth depth,
+ RGBA_Image *
+ evas_software_xlib_outbuf_new_region_for_update(Outbuf *buf, int x, int y, int w, int h, int *cx, int *cy, int *cw, int *ch)
+ {
+-   RGBA_Image         *im = NULL;
++   RGBA_Image         *im;
+    Outbuf_Region      *obr;
+    int                 bpl = 0;
+    int                 use_shm = 1;
+@@ -455,11 +455,6 @@ evas_software_xlib_outbuf_new_region_for_update(Outbuf *buf, int x, int y, int w
+ 	  }
+ 	else
+ 	  {
+-            /* FIXME: For the onebuf case we probably need to do the same thing we did below
+-             * (try to get an existing image before we allocate a new one). This code path
+-             * is not really used at the moment so no way to test (and that's why the change
+-             * is not implemented here as well.
+-             */
+ #ifdef EVAS_CSERVE2
+              if (evas_cserve2_use_get())
+                im = (RGBA_Image *)evas_cache2_image_empty(evas_common_image_cache2_get());
+@@ -613,73 +608,26 @@ evas_software_xlib_outbuf_new_region_for_update(Outbuf *buf, int x, int y, int w
+      }
+    else
+      {
+-        obr->xob = _find_xob(buf->priv.x11.xlib.disp,
+-                             buf->priv.x11.xlib.vis,
+-                             buf->priv.x11.xlib.depth,
+-                             w, h,
+-                             use_shm,
+-                             NULL);
+ #ifdef EVAS_CSERVE2
+         if (evas_cserve2_use_get())
+-          {
+-             if (obr->xob)
+-               im = (RGBA_Image *)evas_cache2_image_data(evas_common_image_cache2_get(),
+-                                                        w, h,
+-                                                        (DATA32 *) evas_software_xlib_x_output_buffer_data(obr->xob, &bpl),
+-                                                        alpha, EVAS_COLORSPACE_ARGB8888);
+-
+-             if (!im)
+-               {
+-                  if (obr->xob) _unfind_xob(obr->xob, 0);
+-                  im = (RGBA_Image *)evas_cache2_image_empty(evas_common_image_cache2_get());
+-                  if (!im)
+-                    {
+-                      free(obr);
+-                      return NULL;
+-                    }
+-                  else
+-                    {
+-                       im->cache_entry.w = w;
+-                       im->cache_entry.h = h;
+-                       im->cache_entry.flags.alpha |= alpha ? 1 : 0;
+-                       evas_cache2_image_surface_alloc(&im->cache_entry, w, h);
+-                    }
+-               }
+-          }
++          im = (RGBA_Image *)evas_cache2_image_empty(evas_common_image_cache2_get());
+         else
+ #endif
++          im = (RGBA_Image *)evas_cache_image_empty(evas_common_image_cache_get());
++        if (!im)
+           {
+-             if (obr->xob)
+-               im = (RGBA_Image *)evas_cache_image_data(evas_common_image_cache_get(),
+-                                                        w, h,
+-                                                        (DATA32 *) evas_software_xlib_x_output_buffer_data(obr->xob, &bpl),
+-                                                        alpha, EVAS_COLORSPACE_ARGB8888);
+-
+-             if (!im)
+-               {
+-                  if (obr->xob) _unfind_xob(obr->xob, 0);
+-                  im = (RGBA_Image *)evas_cache_image_empty(evas_common_image_cache_get());
+-                  if (!im)
+-                    {
+-                      free(obr);
+-                      return NULL;
+-                    }
+-                  else
+-                    {
+-                       im->cache_entry.w = w;
+-                       im->cache_entry.h = h;
+-                       im->cache_entry.flags.alpha |= alpha ? 1 : 0;
+-                       evas_cache_image_surface_alloc(&im->cache_entry, w, h);
+-                    }
+-               }
++             free(obr);
++             return NULL;
+           }
+-
+-        /* Need to update cache_entry w/h here because the render path expects them to be updated
+-         * to the new geometry. */
+         im->cache_entry.w = w;
+         im->cache_entry.h = h;
+         im->cache_entry.flags.alpha |= alpha ? 1 : 0;
+-
++#ifdef EVAS_CSERVE2
++        if (evas_cserve2_use_get())
++          evas_cache2_image_surface_alloc(&im->cache_entry, w, h);
++        else
++#endif
++          evas_cache_image_surface_alloc(&im->cache_entry, w, h);
+ 	im->extended_info = obr;
+ 	if ((buf->rot == 0) || (buf->rot == 180))
+           {
+--
+cgit v0.9.1
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.7.bb b/meta-efl/recipes-efl/efl/evas_1.7.7.bb
index fb6394c..20355ec 100644
--- a/meta-efl/recipes-efl/efl/evas_1.7.7.bb
+++ b/meta-efl/recipes-efl/efl/evas_1.7.7.bb
@@ -1,9 +1,10 @@
 require ${BPN}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://revert.r83789.patch \
 "
 
 SRC_URI[md5sum] = "980abd6f645a38aa0a5d74f11a0e07f9"
-- 
1.8.2.1



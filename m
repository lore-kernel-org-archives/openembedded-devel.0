Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBloU-0007Fd-EH
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:36:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=p/M8qhNbyKqU+16EPgauAh1qOBr67QW3W+LFMjEF1Eo=;
	b=rLCHv4XWFE02Ywpl7Yc7B67KJjZhSlOwP8hI3z+pK3MsDkyQwbO18hFHUM8hotOMUA
	ZJ/XXZw6Bv4oZxfHusd+E8yT/vhMoQ23xwgaJNAqUYo8zHz08iOWM/ikRHL0I8Qb4e1G
	adszAHwtkn6CEv55cSAueAJhjEHfYPexKFwEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=tyRGWoqhBzzXe7prBANZxqSaV1QSaejg8I4OCxmSjZNQPXF5gFuEoaoP9haAyJJy0L
	FyWN2uGr/aZfthEi6uNiT14N/AhGEcWqWzyXsNwYI7QvGy96erQDrSwJa1hfcRW8AiK6
	+1Va8UHNFKpz0N/VN4blVnOHHZysjPfM5rve8=
Received: by 10.223.54.219 with SMTP id r27mr4794287fag.124.1303122834094;
	Mon, 18 Apr 2011 03:33:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n26sm1624041fam.13.2011.04.18.03.33.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:52 +0200
Message-Id: <bfb960a7fcf3471ade94001e813377ff19f50ae4.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/13] pixman: drop older version 0.20.0
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
X-List-Received-Date: Mon, 18 Apr 2011 10:36:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0000-Add-pixman_bits_override_accessors.patch  |   77 ---------
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 -------------
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 -----------
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 -----------
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 -----------
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 -------------
 ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 -----------------
 ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 ---------
 ...ation-for-scaled-src_0565_0565-operation-.patch |  172 --------------------
 meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb |   23 ---
 10 files changed, 0 insertions(+), 996 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
deleted file mode 100644
index 43cd442..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 38aabb3be87ea68e37f34256c778d07f62680ec6 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 1/9] add _pixman_bits_override_accessors
-
-* from patch ARM: HACK: added NEON optimizations for fetch/store r5g6b5 scanline
-* used in 
-  0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
-  0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
-  0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
-
-
----
- pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
- pixman/pixman-private.h      |    5 +++++
- 4 files changed, 87 insertions(+), 1 deletions(-)
-
-diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
-index f1ce0ba..b33da29 100644
---- a/pixman/pixman-access.c
-+++ b/pixman/pixman-access.c
-@@ -2836,7 +2836,7 @@ typedef struct
- 	    store_scanline_ ## format, store_scanline_generic_64	\
-     }
- 
--static const format_info_t accessors[] =
-+static format_info_t accessors[] =
- {
- /* 32 bpp formats */
-     FORMAT_INFO (a8r8g8b8),
-@@ -2978,6 +2978,27 @@ _pixman_bits_image_setup_accessors (bits_image_t *image)
- 	setup_accessors (image);
- }
- 
-+void
-+_pixman_bits_override_accessors (pixman_format_code_t format,
-+                                 fetch_scanline_t     fetch_func,
-+                                 store_scanline_t     store_func)
-+{
-+    format_info_t *info = accessors;
-+
-+    while (info->format != PIXMAN_null)
-+    {
-+	if (info->format == format)
-+	{
-+	    if (fetch_func)
-+		info->fetch_scanline_32 = fetch_func;
-+	    if (store_func)
-+		info->store_scanline_32 = store_func;
-+	    return;
-+	}
-+	info++;
-+    }
-+}
-+
- #else
- 
- void
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index d85868f..564f8f0 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -206,6 +206,11 @@ void
- _pixman_bits_image_setup_accessors (bits_image_t *image);
- 
- void
-+_pixman_bits_override_accessors (pixman_format_code_t format,
-+                                 fetch_scanline_t     fetch_func,
-+                                 store_scanline_t     store_func);
-+
-+void
- _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
-                                         int             x,
-                                         int             y,
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 795cce5..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 97b2bb933455f222b392b5c60a8bde82d7d6329f Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 1/8] Generic C implementation of pixman_blt with overlapping support
-
-Uses memcpy/memmove functions to copy pixels, can handle the
-case when both source and destination areas are in the same
-image (this is useful for scrolling).
-
-It is assumed that copying direction is only important when
-using the same image for both source and destination (and
-src_stride == dst_stride). Copying direction is undefined
-for the images with different source and destination stride
-which happen to be in the overlapped areas (but this is an
-unrealistic case anyway).
----
- pixman/pixman-general.c |   21 ++++++++++++++++++---
- pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index 4d234a0..c4d2c14 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -280,9 +280,24 @@ general_blt (pixman_implementation_t *imp,
-              int                      width,
-              int                      height)
- {
--    /* We can't blit unless we have sse2 or mmx */
--
--    return FALSE;
-+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
-+    uint8_t *src_bytes = (uint8_t *)src_bits;
-+    int bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
-+	return FALSE;
-+
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
-+                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
-+                       src_stride,
-+                       dst_stride,
-+                       width,
-+                       height);
-+    return TRUE;
- }
- 
- static pixman_bool_t
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index c43172b..f980454 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -10,6 +10,7 @@
- 
- #include "pixman.h"
- #include <time.h>
-+#include <string.h>
- #include <assert.h>
- #include <stdio.h>
- #include <string.h>
-@@ -873,4 +874,46 @@ void pixman_timer_register (pixman_timer_t *timer);
- 
- #endif /* PIXMAN_TIMERS */
- 
-+/* a helper function, can blit 8-bit images with src/dst overlapping support */
-+static inline void
-+pixman_blt_helper (uint8_t *src_bytes,
-+                   uint8_t *dst_bytes,
-+                   int      src_stride,
-+                   int      dst_stride,
-+                   int      width,
-+                   int      height)
-+{
-+    /*
-+     * The second part of this check is not strictly needed, but it prevents
-+     * unnecessary upside-down processing of areas which belong to different
-+     * images. Upside-down processing can be slower with fixed-distance-ahead
-+     * prefetch and perceived as having more tearing.
-+     */
-+    if (src_bytes < dst_bytes + width &&
-+	src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+	/* Horizontal scrolling to the left needs memmove */
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return;
-+	}
-+    }
-+    while (--height >= 0)
-+    {
-+	memcpy (dst_bytes, src_bytes, width);
-+	dst_bytes += dst_stride;
-+	src_bytes += src_stride;
-+    }
-+}
-+
- #endif /* PIXMAN_PRIVATE_H */
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
deleted file mode 100644
index 6e2d492..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 47b31f936641da07431093ede340465625bfcb3d Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:47 +0300
-Subject: [PATCH 2/8] Support of overlapping src/dst for pixman_blt_mmx
-
----
- pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
-index e936c4c..2413197 100644
---- a/pixman/pixman-mmx.c
-+++ b/pixman/pixman-mmx.c
-@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using MMX */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     while (height--)
-@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	while (w >= 2 && ((unsigned long)d & 3))
- 	{
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
deleted file mode 100644
index 910f62e..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 13be027637602fffda3b3cb6e171d8d6a67b3b4b Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:54 +0300
-Subject: [PATCH 3/8] Support of overlapping src/dst for pixman_blt_sse2
-
----
- pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
-index 5907de0..25015ae 100644
---- a/pixman/pixman-sse2.c
-+++ b/pixman/pixman-sse2.c
-@@ -5027,34 +5027,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using SSE2 */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     while (height--)
-@@ -5064,7 +5073,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	while (w >= 2 && ((unsigned long)d & 3))
- 	{
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
deleted file mode 100644
index f6aa979..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From a913cc05a1a1c5a813cf06d248334edede9caab7 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 18 Nov 2009 06:08:48 +0200
-Subject: [PATCH 4/8] Support of overlapping src/dst for pixman_blt_neon
-
----
- pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
- 1 files changed, 51 insertions(+), 11 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index be5d403..cbfd7cf 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -176,26 +176,66 @@ pixman_blt_neon (uint32_t *src_bits,
-                  int       width,
-                  int       height)
- {
--    if (src_bpp != dst_bpp)
-+    uint8_t *   src_bytes;
-+    uint8_t *   dst_bytes;
-+    int         bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-+    {
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-+    }
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using NEON */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-+    }
-+
-     switch (src_bpp)
-     {
-     case 16:
- 	pixman_composite_src_0565_0565_asm_neon (
--		width, height,
--		(uint16_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
--		(uint16_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
-+		width >> 1,
-+		height,
-+		(uint16_t *) dst_bytes,
-+		dst_stride >> 1,
-+		(uint16_t *) src_bytes,
-+		src_stride >> 1);
- 	return TRUE;
-     case 32:
- 	pixman_composite_src_8888_8888_asm_neon (
--		width, height,
--		(uint32_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
--		(uint32_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 4), src_stride);
-+		width >> 2,
-+		height,
-+		(uint32_t *) dst_bytes,
-+		dst_stride >> 2,
-+		(uint32_t *) src_bytes,
-+		src_stride >> 2);
- 	return TRUE;
-     default:
- 	return FALSE;
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
deleted file mode 100644
index dbe98b3..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From f75e9d1868e21dd75ff3a2ca3561546d23877ddb Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 5/8] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
-
----
- pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
- pixman/pixman-arm-neon.c     |   40 ++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 60 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index e4db5cd..c79ba81 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -459,6 +459,16 @@ generate_composite_function \
-     pixman_composite_src_8888_0565_process_pixblock_tail, \
-     pixman_composite_src_8888_0565_process_pixblock_tail_head
- 
-+generate_composite_function_single_scanline \
-+    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8888_0565_process_pixblock_head, \
-+    pixman_composite_src_8888_0565_process_pixblock_tail, \
-+    pixman_composite_src_8888_0565_process_pixblock_tail_head
-+
- /******************************************************************************/
- 
- .macro pixman_composite_src_0565_8888_process_pixblock_head
-@@ -494,6 +504,16 @@ generate_composite_function \
-     pixman_composite_src_0565_8888_process_pixblock_tail, \
-     pixman_composite_src_0565_8888_process_pixblock_tail_head
- 
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_0565_8888_process_pixblock_head, \
-+    pixman_composite_src_0565_8888_process_pixblock_tail, \
-+    pixman_composite_src_0565_8888_process_pixblock_tail_head
-+
- /******************************************************************************/
- 
- .macro pixman_composite_add_8_8_process_pixblock_head
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index cbfd7cf..f88c8f8 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -392,6 +392,42 @@ BIND_COMBINE_U (over)
- BIND_COMBINE_U (add)
- BIND_COMBINE_U (out_reverse)
- 
-+void
-+pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
-+                                       uint32_t       *buffer,
-+                                       const uint16_t *pixel);
-+void
-+pixman_store_scanline_r5g6b5_asm_neon (int             width,
-+                                       uint16_t       *pixel,
-+                                       const uint32_t *values);
-+
-+static void
-+neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
-+                            int             x,
-+                            int             y,
-+                            int             width,
-+                            uint32_t *      buffer,
-+                            const uint32_t *mask)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint16_t *pixel = (const uint16_t *)bits + x;
-+
-+    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
-+}
-+
-+static void
-+neon_store_scanline_r5g6b5 (bits_image_t *  image,
-+                            int             x,
-+                            int             y,
-+                            int             width,
-+                            const uint32_t *values)
-+{
-+    uint32_t *bits = image->bits + image->rowstride * y;
-+    uint16_t *pixel = ((uint16_t *) bits) + x;
-+
-+    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
-+}
-+
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
- {
-@@ -407,6 +443,10 @@ _pixman_implementation_create_arm_neon (void)
-     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
-     imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
- 
-+    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-+                                     neon_fetch_scanline_r5g6b5,
-+                                     neon_store_scanline_r5g6b5);
-+
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
- 
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
deleted file mode 100644
index d050646..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From a1cd695c5e22f0f4a2b7272fab675a3cc510bacb Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 23 Sep 2010 21:10:56 +0300
-Subject: [PATCH 6/8] ARM: added NEON optimizations for fetch/store a8 scanline
-
----
- pixman/pixman-arm-neon-asm.S |   64 ++++++++++++++++++++++++++++++++++++++++++
- pixman/pixman-arm-neon.c     |   42 +++++++++++++++++++++++++++
- 2 files changed, 106 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index c79ba81..ca0825c 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -418,6 +418,70 @@ generate_composite_function \
- 
- /******************************************************************************/
- 
-+.macro pixman_composite_src_8_8888_process_pixblock_head
-+    /* This is tricky part: we can't set these values just once in 'init' macro
-+     * because leading/trailing pixels handling part uses VZIP.8 instructions,
-+     * and they operate on values in-place and destroy original registers
-+     * content. Think about it like VST4.8 instruction corrupting NEON
-+     * registers after write in 'tail_head' macro. Except that 'tail_head'
-+     * macro itself actually does not need these extra VMOVs because it uses
-+     * real VST4.8 instruction.
-+     */
-+    vmov.u8     q0, #0
-+    vmov.u8     d2, #0
-+.endm
-+
-+.macro pixman_composite_src_8_8888_process_pixblock_tail
-+.endm
-+
-+.macro pixman_composite_src_8_8888_process_pixblock_tail_head
-+    vst4.8      {d0, d1, d2, d3}, [DST_W, :128]!
-+    vld1.8      {d3}, [SRC]!
-+.endm
-+
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_a8_asm_neon, 8, 0, 32, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8_8888_process_pixblock_head, \
-+    pixman_composite_src_8_8888_process_pixblock_tail, \
-+    pixman_composite_src_8_8888_process_pixblock_tail_head, \
-+    0,  /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    3,  /* src_basereg   */ \
-+    0   /* mask_basereg  */
-+
-+/******************************************************************************/
-+
-+.macro pixman_composite_src_8888_8_process_pixblock_head
-+.endm
-+
-+.macro pixman_composite_src_8888_8_process_pixblock_tail
-+.endm
-+
-+.macro pixman_composite_src_8888_8_process_pixblock_tail_head
-+    vst1.8      {d3}, [DST_W, :64]!
-+    vld4.8      {d0, d1, d2, d3}, [SRC]!
-+.endm
-+
-+generate_composite_function_single_scanline \
-+    pixman_store_scanline_a8_asm_neon, 32, 0, 8, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8888_8_process_pixblock_head, \
-+    pixman_composite_src_8888_8_process_pixblock_tail, \
-+    pixman_composite_src_8888_8_process_pixblock_tail_head, \
-+    3,  /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    0,  /* src_basereg   */ \
-+    0   /* mask_basereg  */
-+
-+/******************************************************************************/
-+
- .macro pixman_composite_src_8888_0565_process_pixblock_head
-     vshll.u8    q8, d1, #8
-     vshll.u8    q14, d2, #8
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index f88c8f8..43091d2 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -428,6 +428,45 @@ neon_store_scanline_r5g6b5 (bits_image_t *  image,
-     pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
- }
- 
-+void
-+pixman_fetch_scanline_a8_asm_neon (int             width,
-+                                   uint32_t       *buffer,
-+                                   const uint8_t  *pixel);
-+
-+
-+void
-+pixman_store_scanline_a8_asm_neon (int             width,
-+                                   uint8_t        *pixel,
-+                                   const uint32_t *values);
-+
-+static void
-+neon_fetch_scanline_a8 (pixman_image_t *image,
-+                        int             x,
-+                        int             y,
-+                        int             width,
-+                        uint32_t *      buffer,
-+                        const uint32_t *mask)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint8_t *pixel = (const uint8_t *) bits + x;
-+
-+    pixman_fetch_scanline_a8_asm_neon (width, buffer, pixel);
-+}
-+
-+static void
-+neon_store_scanline_a8 (bits_image_t *  image,
-+                        int             x,
-+                        int             y,
-+                        int             width,
-+                        const uint32_t *values)
-+{
-+    uint32_t *bits = image->bits + image->rowstride * y;
-+    uint8_t *pixel = (uint8_t *) bits + x;
-+
-+    pixman_store_scanline_a8_asm_neon (width, pixel, values);
-+}
-+
-+
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
- {
-@@ -446,6 +485,9 @@ _pixman_implementation_create_arm_neon (void)
-     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-                                      neon_fetch_scanline_r5g6b5,
-                                      neon_store_scanline_r5g6b5);
-+    _pixman_bits_override_accessors (PIXMAN_a8,
-+                                     neon_fetch_scanline_a8,
-+                                     neon_store_scanline_a8);
- 
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
deleted file mode 100644
index 7f28f47..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From d6ae7da60cc797900b5eff0786536c4a11ab0f50 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 24 Sep 2010 18:22:44 +0300
-Subject: [PATCH 7/8] ARM: added NEON optimizations for fetching x8r8g8b8 scanline
-
----
- pixman/pixman-arm-neon-asm.S |   14 ++++++++++++++
- pixman/pixman-arm-neon.c     |   21 +++++++++++++++++++++
- 2 files changed, 35 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index ca0825c..ffd0b83 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -1206,6 +1206,20 @@ generate_composite_function \
-     0, /* src_basereg   */ \
-     0  /* mask_basereg  */
- 
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_x888_asm_neon, 32, 0, 32, \
-+    FLAG_DST_WRITEONLY, \
-+    8, /* number of pixels, processed in a single block */ \
-+    pixman_composite_src_x888_8888_init, \
-+    default_cleanup, \
-+    pixman_composite_src_x888_8888_process_pixblock_head, \
-+    pixman_composite_src_x888_8888_process_pixblock_tail, \
-+    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
-+    0,  /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    0,  /* src_basereg   */ \
-+    0   /* mask_basereg  */
-+
- /******************************************************************************/
- 
- .macro pixman_composite_over_n_8_8888_process_pixblock_head
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 43091d2..f84b5e6 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -466,6 +466,24 @@ neon_store_scanline_a8 (bits_image_t *  image,
-     pixman_store_scanline_a8_asm_neon (width, pixel, values);
- }
- 
-+void
-+pixman_fetch_scanline_x888_asm_neon (int             width,
-+                                     uint32_t       *buffer,
-+                                     const uint32_t *pixel);
-+
-+static void
-+neon_fetch_scanline_x888 (pixman_image_t *image,
-+                          int             x,
-+                          int             y,
-+                          int             width,
-+                          uint32_t *      buffer,
-+                          const uint32_t *mask)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint32_t *pixel = (const uint32_t *) bits + x;
-+
-+    pixman_fetch_scanline_x888_asm_neon (width, buffer, pixel);
-+}
- 
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
-@@ -488,6 +506,9 @@ _pixman_implementation_create_arm_neon (void)
-     _pixman_bits_override_accessors (PIXMAN_a8,
-                                      neon_fetch_scanline_a8,
-                                      neon_store_scanline_a8);
-+    _pixman_bits_override_accessors (PIXMAN_x8r8g8b8,
-+                                     neon_fetch_scanline_x888,
-+                                     NULL);
- 
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
deleted file mode 100644
index 6efdb62..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From e1191ad6563a1fb02a45982b1c4d7fed3c655e97 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Mon, 4 Oct 2010 01:56:59 +0300
-Subject: [PATCH 8/8] ARM optimization for scaled src_0565_0565 operation with nearest filter
-
-The code actually uses only armv4t instructions.
-
-Benchmark from ARM11:
-
-    == before ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=34.86 MPix/s
-
-    == after ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=36.62 MPix/s
-
-Benchmark from ARM Cortex-A8:
-
-    == before ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=89.55 MPix/s
-
-    == after ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=94.91 MPix/s
----
- pixman/pixman-arm-simd-asm.S |   66 ++++++++++++++++++++++++++++++++++++++++++
- pixman/pixman-arm-simd.c     |   37 +++++++++++++++++++++++
- 2 files changed, 103 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-simd-asm.S b/pixman/pixman-arm-simd-asm.S
-index a3d2d40..b6f69db 100644
---- a/pixman/pixman-arm-simd-asm.S
-+++ b/pixman/pixman-arm-simd-asm.S
-@@ -1,5 +1,6 @@
- /*
-  * Copyright © 2008 Mozilla Corporation
-+ * Copyright © 2010 Nokia Corporation
-  *
-  * Permission to use, copy, modify, distribute, and sell this software and its
-  * documentation for any purpose is hereby granted without fee, provided that
-@@ -328,3 +329,68 @@ pixman_asm_function pixman_composite_over_n_8_8888_asm_armv6
- 	pop	{r4, r5, r6, r7, r8, r9, r10, r11}
- 	bx	lr
- .endfunc
-+
-+/*
-+ * Note: This function is actually primarily optimized for ARM Cortex-A8
-+ * pipeline. In order to get good performance on ARM9/ARM11 cores (which
-+ * don't have efficient write combining), it needs to be changed to use
-+ * 16-byte aligned writes using STM instruction.
-+ */
-+pixman_asm_function pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6
-+	DST	.req	r0
-+	SRC	.req	r1
-+	W	.req	r2
-+	VX	.req	r3
-+	UNIT_X	.req	r12
-+	TMP1	.req	r4
-+	TMP2	.req	r5
-+	MASK	.req	r6
-+	ldr	UNIT_X, [sp]
-+	push	{r4, r5, r6, r7}
-+	mvn	MASK, #1
-+
-+	/* define helper macro */
-+	.macro	scale_2_pixels
-+		ldrh	TMP1, [SRC, TMP1]
-+		and	TMP2, MASK, VX, lsr #15
-+		add	VX, VX, UNIT_X
-+		strh	TMP1, [DST], #2
-+
-+		ldrh	TMP2, [SRC, TMP2]
-+		and	TMP1, MASK, VX, lsr #15
-+		add	VX, VX, UNIT_X
-+		strh	TMP2, [DST], #2
-+	.endm
-+
-+	/* now do the scaling */
-+	and	TMP1, MASK, VX, lsr #15
-+	add	VX, VX, UNIT_X
-+	subs	W, #4
-+	blt	2f
-+1: /* main loop, process 4 pixels per iteration */
-+	scale_2_pixels
-+	scale_2_pixels
-+	subs	W, W, #4
-+	bge	1b
-+2:
-+	tst	W, #2
-+	beq	2f
-+	scale_2_pixels
-+2:
-+	tst	W, #1
-+	ldrneh	TMP1, [SRC, TMP1]
-+	strneh	TMP1, [DST], #2
-+	/* cleanup helper macro */
-+	.purgem	scale_2_pixels
-+	.unreq	DST
-+	.unreq	SRC
-+	.unreq	W
-+	.unreq	VX
-+	.unreq	UNIT_X
-+	.unreq	TMP1
-+	.unreq	TMP2
-+	.unreq	MASK
-+	/* return */
-+	pop	{r4, r5, r6, r7}
-+	bx	lr
-+.endfunc
-diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
-index d466a31..f6f464c 100644
---- a/pixman/pixman-arm-simd.c
-+++ b/pixman/pixman-arm-simd.c
-@@ -29,6 +29,7 @@
- 
- #include "pixman-private.h"
- #include "pixman-arm-common.h"
-+#include "pixman-fast-path.h"
- 
- #if 0 /* This code was moved to 'pixman-arm-simd-asm.S' */
- 
-@@ -375,6 +376,35 @@ pixman_composite_over_n_8_8888_asm_armv6 (int32_t   width,
- 
- #endif
- 
-+void
-+pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6 (uint16_t *      dst,
-+						      uint16_t *      src,
-+						      int32_t         w,
-+						      pixman_fixed_t  vx,
-+						      pixman_fixed_t  unit_x);
-+
-+static force_inline void
-+scaled_nearest_scanline_armv6_565_565_SRC (uint16_t *      dst,
-+					   uint16_t *      src,
-+					   int32_t         w,
-+					   pixman_fixed_t  vx,
-+					   pixman_fixed_t  unit_x,
-+					   pixman_fixed_t  max_vx)
-+{
-+    pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6 (dst, src, w,
-+							  vx, unit_x);
-+}
-+
-+FAST_NEAREST_MAINLOOP (armv6_565_565_cover_SRC,
-+		       scaled_nearest_scanline_armv6_565_565_SRC,
-+		       uint16_t, uint16_t, COVER);
-+FAST_NEAREST_MAINLOOP (armv6_565_565_none_SRC,
-+		       scaled_nearest_scanline_armv6_565_565_SRC,
-+		       uint16_t, uint16_t, NONE);
-+FAST_NEAREST_MAINLOOP (armv6_565_565_pad_SRC,
-+		       scaled_nearest_scanline_armv6_565_565_SRC,
-+		       uint16_t, uint16_t, PAD);
-+
- PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, add_8_8,
-                                    uint8_t, 1, uint8_t, 1)
- PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, over_8888_8888,
-@@ -404,6 +434,13 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, a8b8g8r8, armv6_composite_over_n_8_8888),
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8b8g8r8, armv6_composite_over_n_8_8888),
- 
-+    SIMPLE_NEAREST_FAST_PATH_COVER (SRC, r5g6b5, r5g6b5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_COVER (SRC, b5g6r5, b5g6r5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_NONE (SRC, r5g6b5, r5g6b5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_NONE (SRC, b5g6r5, b5g6r5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_PAD (SRC, r5g6b5, r5g6b5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_PAD (SRC, b5g6r5, b5g6r5, armv6_565_565),
-+
-     { PIXMAN_OP_NONE },
- };
- 
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb b/meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb
deleted file mode 100644
index b66bc2a..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require pixman.inc
-
-SRC_URI[md5sum] = "c1a31d5cedfa97c5af7148a2d1fd4356"
-SRC_URI[sha256sum] = "9c02c22c6cc3f28f3633d02ef6f0cac130518f621edb011ebbbf08cd1a81251a"
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "\
-           file://0000-Add-pixman_bits_override_accessors.patch \
-           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
-           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
-           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
-           file://0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch \
-           file://0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch \
-           file://0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch \
-"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
-- 
1.7.5.rc1




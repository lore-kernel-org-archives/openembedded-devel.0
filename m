Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhjDU-0000nx-UL for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 14:45:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhjCh-0003GP-Vc for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 14:45:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 14:45:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 14:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 14:40:33 +0100
Message-ID: <ihmjsh$vdq$1@dough.gmane.org>
References: <1295962132-4479-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295962132-4479-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] pixman: upgrade from 0.21.2 to 0.21.4
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
X-List-Received-Date: Tue, 25 Jan 2011 13:45:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-11 14:28, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  .../0002-Fix-argument-quoting-for-AC_INIT.patch    |   35 ----
>  ...003-Sun-s-copyrights-belong-to-Oracle-now.patch |   39 -----
>  .../0004-C-fast-path-for-a1-fill-operation.patch   |  159 ------------------
>  ...added-neon_composite_over_n_8_8-fast-path.patch |  113 -------------
>  ...ced-fetch_mask_pixblock-macro-to-simplify.patch |  157 ------------------
>  ...NEON-instructions-scheduling-for-over_n_8.patch |  170 --------------------
>  ...neon_composite_over_8888_n_0565-fast-path.patch |   74 ---------
>  ...ommon-NEON-code-for-over_-n_8-8888_n-8888.patch |  139 ----------------
>  ...neon_composite_over_0565_n_0565-fast-path.patch |   74 ---------
>  ...-neon_composite_add_8888_8_8888-fast-path.patch |   63 -------
>  ...NEON-instructions-scheduling-for-add_8888.patch |  105 ------------
>  ...ded-neon_composite_add_n_8_8888-fast-path.patch |   75 ---------
>  ...-neon_composite_add_8888_n_8888-fast-path.patch |   72 --------
>  ...lags-parameter-to-some-asm-fast-path-wrap.patch |  153 ------------------
>  ...ARM-added-neon_composite_in_n_8-fast-path.patch |   97 -----------
>  .../0017-add-_pixman_bits_override_accessors.patch |   75 ---------
>  ...mplementation-of-pixman_blt-with-overlapp.patch |  114 -------------
>  ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 -----------
>  ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 -----------
>  ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 -----------
>  ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 -------------
>  ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 -----------------
>  ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 ---------
>  .../0017-add-_pixman_bits_override_accessors.patch |   75 +++++++++
>  ...mplementation-of-pixman_blt-with-overlapp.patch |  114 +++++++++++++
>  ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 +++++++++++
>  ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 +++++++++++
>  ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 +++++++++++
>  ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 +++++++++++++
>  ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 +++++++++++++++++
>  ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 +++++++++
>  recipes/xorg-lib/pixman_0.21.2.bb                  |   37 -----
>  recipes/xorg-lib/pixman_0.21.4.bb                  |   22 +++
>  33 files changed, 821 insertions(+), 2361 deletions(-)
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0002-Fix-argument-quoting-for-AC_INIT.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0003-Sun-s-copyrights-belong-to-Oracle-now.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0004-C-fast-path-for-a1-fill-operation.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-neon_composite_over_n_8_8-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0006-ARM-introduced-fetch_mask_pixblock-macro-to-simplify.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0007-ARM-better-NEON-instructions-scheduling-for-over_n_8.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0008-ARM-added-neon_composite_over_8888_n_0565-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0009-ARM-reuse-common-NEON-code-for-over_-n_8-8888_n-8888.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0010-ARM-added-neon_composite_over_0565_n_0565-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0011-ARM-added-neon_composite_add_8888_8_8888-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0012-ARM-better-NEON-instructions-scheduling-for-add_8888.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0013-ARM-added-neon_composite_add_n_8_8888-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0014-ARM-added-neon_composite_add_8888_n_8888-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0015-ARM-added-flags-parameter-to-some-asm-fast-path-wrap.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0016-ARM-added-neon_composite_in_n_8-fast-path.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0017-add-_pixman_bits_override_accessors.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
>  delete mode 100644 recipes/xorg-lib/pixman-0.21.2/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0017-add-_pixman_bits_override_accessors.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
>  create mode 100644 recipes/xorg-lib/pixman-0.21.4/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
>  delete mode 100644 recipes/xorg-lib/pixman_0.21.2.bb
>  create mode 100644 recipes/xorg-lib/pixman_0.21.4.bb
> 
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0002-Fix-argument-quoting-for-AC_INIT.patch b/recipes/xorg-lib/pixman-0.21.2/0002-Fix-argument-quoting-for-AC_INIT.patch
> deleted file mode 100644
> index ebf6eaf..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0002-Fix-argument-quoting-for-AC_INIT.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From e7ee43c39d2370716a4d011afa8f5067eced9899 Mon Sep 17 00:00:00 2001
> -From: Cyril Brulebois <kibi@debian.org>
> -Date: Wed, 17 Nov 2010 16:16:56 +0100
> -Subject: [PATCH 02/24] Fix argument quoting for AC_INIT.
> -
> -One gets rid of this accordingly:
> -| autoreconf -vfi
> -| autoreconf: Entering directory `.'
> -| autoreconf: configure.ac: not using Gettext
> -| autoreconf: running: aclocal --force
> -| configure.ac:61: warning: AC_INIT: not a literal: "pixman@lists.freedesktop.org"
> -| autoreconf: configure.ac: tracing
> -| configure.ac:61: warning: AC_INIT: not a literal: "pixman@lists.freedesktop.org"
> -
> -Signed-off-by: Cyril Brulebois <kibi@debian.org>
> ----
> - configure.ac |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index db1da21..147e1bf 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -58,7 +58,7 @@ m4_define([pixman_micro], 3)
> - 
> - m4_define([pixman_version],[pixman_major.pixman_minor.pixman_micro])
> - 
> --AC_INIT(pixman, pixman_version, "pixman@lists.freedesktop.org", pixman)
> -+AC_INIT(pixman, pixman_version, [pixman@lists.freedesktop.org], pixman)
> - AM_INIT_AUTOMAKE([foreign dist-bzip2])
> - 
> - # Suppress verbose compile lines
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0003-Sun-s-copyrights-belong-to-Oracle-now.patch b/recipes/xorg-lib/pixman-0.21.2/0003-Sun-s-copyrights-belong-to-Oracle-now.patch
> deleted file mode 100644
> index e48a2b3..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0003-Sun-s-copyrights-belong-to-Oracle-now.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 654961efe405ad1a7e54a77548ca8af322ecc1f8 Mon Sep 17 00:00:00 2001
> -From: Alan Coopersmith <alan.coopersmith@oracle.com>
> -Date: Sun, 21 Nov 2010 11:42:22 -0800
> -Subject: [PATCH 03/24] Sun's copyrights belong to Oracle now
> -
> -Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> ----
> - COPYING                      |    2 +-
> - pixman/solaris-hwcap.mapfile |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/COPYING b/COPYING
> -index 3092a34..15f9517 100644
> ---- a/COPYING
> -+++ b/COPYING
> -@@ -18,7 +18,7 @@ possible. They may also add themselves to the list below.
> -  * Copyright 2008 André Tupinambá
> -  * Copyright 2008 Mozilla Corporation
> -  * Copyright 2008 Frederic Plourde
> -- * Copyright 2009 Sun Microsystems, Inc.
> -+ * Copyright 2009, Oracle and/or its affiliates. All rights reserved.
> -  *
> -  * Permission is hereby granted, free of charge, to any person obtaining a
> -  * copy of this software and associated documentation files (the "Software"),
> -diff --git a/pixman/solaris-hwcap.mapfile b/pixman/solaris-hwcap.mapfile
> -index 3605ca7..87efce1 100644
> ---- a/pixman/solaris-hwcap.mapfile
> -+++ b/pixman/solaris-hwcap.mapfile
> -@@ -1,6 +1,6 @@
> - ###############################################################################
> - #
> --# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
> -+# Copyright 2009, Oracle and/or its affiliates. All rights reserved.
> - #
> - # Permission is hereby granted, free of charge, to any person obtaining a
> - # copy of this software and associated documentation files (the "Software"),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0004-C-fast-path-for-a1-fill-operation.patch b/recipes/xorg-lib/pixman-0.21.2/0004-C-fast-path-for-a1-fill-operation.patch
> deleted file mode 100644
> index 75eaac7..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0004-C-fast-path-for-a1-fill-operation.patch
> +++ /dev/null
> @@ -1,159 +0,0 @@
> -From 4b5b5a2a832cd67f2a0ec231f75a2825b45571fa Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Mon, 15 Nov 2010 18:26:43 +0200
> -Subject: [PATCH 04/24] C fast path for a1 fill operation
> -
> -Can be used as one of the solutions to fix bug
> -https://bugs.freedesktop.org/show_bug.cgi?id=31604
> ----
> - pixman/pixman-fast-path.c |   87 ++++++++++++++++++++++++++++++++++++++++++++-
> - pixman/pixman.c           |    7 +++-
> - 2 files changed, 91 insertions(+), 3 deletions(-)
> -
> -diff --git a/pixman/pixman-fast-path.c b/pixman/pixman-fast-path.c
> -index 5d5fa95..37dfbae 100644
> ---- a/pixman/pixman-fast-path.c
> -+++ b/pixman/pixman-fast-path.c
> -@@ -1334,7 +1334,11 @@ fast_composite_solid_fill (pixman_implementation_t *imp,
> - 
> -     src = _pixman_image_get_solid (src_image, dst_image->bits.format);
> - 
> --    if (dst_image->bits.format == PIXMAN_a8)
> -+    if (dst_image->bits.format == PIXMAN_a1)
> -+    {
> -+	src = src >> 31;
> -+    }
> -+    else if (dst_image->bits.format == PIXMAN_a8)
> -     {
> - 	src = src >> 24;
> -     }
> -@@ -1655,6 +1659,7 @@ static const pixman_fast_path_t c_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (SRC, solid, null, x8r8g8b8, fast_composite_solid_fill),
> -     PIXMAN_STD_FAST_PATH (SRC, solid, null, a8b8g8r8, fast_composite_solid_fill),
> -     PIXMAN_STD_FAST_PATH (SRC, solid, null, x8b8g8r8, fast_composite_solid_fill),
> -+    PIXMAN_STD_FAST_PATH (SRC, solid, null, a1, fast_composite_solid_fill),
> -     PIXMAN_STD_FAST_PATH (SRC, solid, null, a8, fast_composite_solid_fill),
> -     PIXMAN_STD_FAST_PATH (SRC, solid, null, r5g6b5, fast_composite_solid_fill),
> -     PIXMAN_STD_FAST_PATH (SRC, x8r8g8b8, null, a8r8g8b8, fast_composite_src_x888_8888),
> -@@ -1733,6 +1738,82 @@ static const pixman_fast_path_t c_fast_paths[] =
> -     {   PIXMAN_OP_NONE	},
> - };
> - 
> -+#ifdef WORDS_BIGENDIAN
> -+#define A1_FILL_MASK(n, offs) (((1 << (n)) - 1) << (32 - (offs) - (n)))
> -+#else
> -+#define A1_FILL_MASK(n, offs) (((1 << (n)) - 1) << (offs))
> -+#endif
> -+
> -+static force_inline void
> -+pixman_fill1_line (uint32_t *dst, int offs, int width, int v)
> -+{
> -+    if (offs)
> -+    {
> -+	int leading_pixels = 32 - offs;
> -+	if (leading_pixels >= width)
> -+	{
> -+	    if (v)
> -+		*dst |= A1_FILL_MASK (width, offs);
> -+	    else
> -+		*dst &= ~A1_FILL_MASK (width, offs);
> -+	    return;
> -+	}
> -+	else
> -+	{
> -+	    if (v)
> -+		*dst++ |= A1_FILL_MASK (leading_pixels, offs);
> -+	    else
> -+		*dst++ &= ~A1_FILL_MASK (leading_pixels, offs);
> -+	    width -= leading_pixels;
> -+	}
> -+    }
> -+    while (width >= 32)
> -+    {
> -+	if (v)
> -+	    *dst++ = 0xFFFFFFFF;
> -+	else
> -+	    *dst++ = 0;
> -+	width -= 32;
> -+    }
> -+    if (width > 0)
> -+    {
> -+	if (v)
> -+	    *dst |= A1_FILL_MASK (width, 0);
> -+	else
> -+	    *dst &= ~A1_FILL_MASK (width, 0);
> -+    }
> -+}
> -+
> -+static void
> -+pixman_fill1 (uint32_t *bits,
> -+              int       stride,
> -+              int       x,
> -+              int       y,
> -+              int       width,
> -+              int       height,
> -+              uint32_t  xor)
> -+{
> -+    uint32_t *dst = bits + y * stride + (x >> 5);
> -+    int offs = x & 31;
> -+
> -+    if (xor & 1)
> -+    {
> -+	while (height--)
> -+	{
> -+	    pixman_fill1_line (dst, offs, width, 1);
> -+	    dst += stride;
> -+	}
> -+    }
> -+    else
> -+    {
> -+	while (height--)
> -+	{
> -+	    pixman_fill1_line (dst, offs, width, 0);
> -+	    dst += stride;
> -+	}
> -+    }
> -+}
> -+
> - static void
> - pixman_fill8 (uint32_t *bits,
> -               int       stride,
> -@@ -1819,6 +1900,10 @@ fast_path_fill (pixman_implementation_t *imp,
> - {
> -     switch (bpp)
> -     {
> -+    case 1:
> -+	pixman_fill1 (bits, stride, x, y, width, height, xor);
> -+	break;
> -+
> -     case 8:
> - 	pixman_fill8 (bits, stride, x, y, width, height, xor);
> - 	break;
> -diff --git a/pixman/pixman.c b/pixman/pixman.c
> -index 045c556..ec565f9 100644
> ---- a/pixman/pixman.c
> -+++ b/pixman/pixman.c
> -@@ -875,7 +875,8 @@ color_to_pixel (pixman_color_t *     color,
> -           format == PIXMAN_b8g8r8x8     ||
> -           format == PIXMAN_r5g6b5       ||
> -           format == PIXMAN_b5g6r5       ||
> --          format == PIXMAN_a8))
> -+          format == PIXMAN_a8           ||
> -+          format == PIXMAN_a1))
> -     {
> - 	return FALSE;
> -     }
> -@@ -895,7 +896,9 @@ color_to_pixel (pixman_color_t *     color,
> - 	    ((c & 0x000000ff) << 24);
> -     }
> - 
> --    if (format == PIXMAN_a8)
> -+    if (format == PIXMAN_a1)
> -+	c = c >> 31;
> -+    else if (format == PIXMAN_a8)
> - 	c = c >> 24;
> -     else if (format == PIXMAN_r5g6b5 ||
> -              format == PIXMAN_b5g6r5)
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-neon_composite_over_n_8_8-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-neon_composite_over_n_8_8-fast-path.patch
> deleted file mode 100644
> index a7a9b11..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-neon_composite_over_n_8_8-fast-path.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From 98d08b37f17a3379d0ceff8bb7de8f943873fbd8 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Fri, 26 Nov 2010 08:55:49 +0200
> -Subject: [PATCH 05/24] ARM: added 'neon_composite_over_n_8_8' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   68 ++++++++++++++++++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |    3 ++
> - 2 files changed, 71 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 91ec27d..a3875ee 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1203,6 +1203,74 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_over_n_8_8_process_pixblock_head
> -+    vmull.u8    q0,  d24, d8
> -+    vmull.u8    q1,  d25, d8
> -+    vmull.u8    q6,  d26, d8
> -+    vmull.u8    q7,  d27, d8
> -+    vrshr.u16   q10, q0,  #8
> -+    vrshr.u16   q11, q1,  #8
> -+    vrshr.u16   q12, q6,  #8
> -+    vrshr.u16   q13, q7,  #8
> -+    vraddhn.u16 d0,  q0,  q10
> -+    vraddhn.u16 d1,  q1,  q11
> -+    vraddhn.u16 d2,  q6,  q12
> -+    vraddhn.u16 d3,  q7,  q13
> -+    vmvn.8      q12, q0
> -+    vmvn.8      q13, q1
> -+    vmull.u8    q8,  d24, d4
> -+    vmull.u8    q9,  d25, d5
> -+    vmull.u8    q10, d26, d6
> -+    vmull.u8    q11, d27, d7
> -+.endm
> -+
> -+.macro pixman_composite_over_n_8_8_process_pixblock_tail
> -+    vrshr.u16   q14, q8,  #8
> -+    vrshr.u16   q15, q9,  #8
> -+    vrshr.u16   q12, q10, #8
> -+    vrshr.u16   q13, q11, #8
> -+    vraddhn.u16 d28, q14, q8
> -+    vraddhn.u16 d29, q15, q9
> -+    vraddhn.u16 d30, q12, q10
> -+    vraddhn.u16 d31, q13, q11
> -+    vqadd.u8    q14, q0,  q14
> -+    vqadd.u8    q15, q1,  q15
> -+.endm
> -+
> -+/* TODO: expand macros and do better instructions scheduling */
> -+.macro pixman_composite_over_n_8_8_process_pixblock_tail_head
> -+    vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
> -+    pixman_composite_over_n_8_8_process_pixblock_tail
> -+    vld1.8      {d24, d25, d26, d27}, [MASK]!
> -+    cache_preload 32, 32
> -+    vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -+    pixman_composite_over_n_8_8_process_pixblock_head
> -+.endm
> -+
> -+.macro pixman_composite_over_n_8_8_init
> -+    add         DUMMY, sp, #ARGS_STACK_OFFSET
> -+    vpush       {d8-d15}
> -+    vld1.32     {d8[0]}, [DUMMY]
> -+    vdup.8      d8, d8[3]
> -+.endm
> -+
> -+.macro pixman_composite_over_n_8_8_cleanup
> -+    vpop        {d8-d15}
> -+.endm
> -+
> -+generate_composite_function \
> -+    pixman_composite_over_n_8_8_asm_neon, 0, 8, 8, \
> -+    FLAG_DST_READWRITE, \
> -+    32, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    pixman_composite_over_n_8_8_init, \
> -+    pixman_composite_over_n_8_8_cleanup, \
> -+    pixman_composite_over_n_8_8_process_pixblock_head, \
> -+    pixman_composite_over_n_8_8_process_pixblock_tail, \
> -+    pixman_composite_over_n_8_8_process_pixblock_tail_head
> -+
> -+/******************************************************************************/
> -+
> - .macro pixman_composite_over_n_8888_8888_ca_process_pixblock_head
> -     /*
> -      * 'combine_mask_ca' replacement
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 2f82069..72ef75e 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -76,6 +76,8 @@ PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8_8888,
> -                                       uint8_t, 1, uint32_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8888_8888_ca,
> -                                       uint32_t, 1, uint32_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8_8,
> -+                                      uint8_t, 1, uint8_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, add_n_8_8,
> -                                       uint8_t, 1, uint8_t, 1)
> - 
> -@@ -235,6 +237,7 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (SRC,  b8g8r8,   null,     x8r8g8b8, neon_composite_src_0888_8888_rev),
> -     PIXMAN_STD_FAST_PATH (SRC,  b8g8r8,   null,     r5g6b5,   neon_composite_src_0888_0565_rev),
> -     PIXMAN_STD_FAST_PATH (SRC,  pixbuf,   pixbuf,   a8r8g8b8, neon_composite_src_pixbuf_8888),
> -+    PIXMAN_STD_FAST_PATH (OVER, solid,    a8,       a8,       neon_composite_over_n_8_8),
> -     PIXMAN_STD_FAST_PATH (OVER, solid,    a8,       r5g6b5,   neon_composite_over_n_8_0565),
> -     PIXMAN_STD_FAST_PATH (OVER, solid,    a8,       b5g6r5,   neon_composite_over_n_8_0565),
> -     PIXMAN_STD_FAST_PATH (OVER, solid,    a8,       a8r8g8b8, neon_composite_over_n_8_8888),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0006-ARM-introduced-fetch_mask_pixblock-macro-to-simplify.patch b/recipes/xorg-lib/pixman-0.21.2/0006-ARM-introduced-fetch_mask_pixblock-macro-to-simplify.patch
> deleted file mode 100644
> index 71a41a7..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0006-ARM-introduced-fetch_mask_pixblock-macro-to-simplify.patch
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -From 3be86a92ccab240859062a541cdb871d81c9501a Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Sun, 28 Nov 2010 21:45:06 +0200
> -Subject: [PATCH 06/24] ARM: introduced 'fetch_mask_pixblock' macro to simplify code
> -
> -This macro hides the implementation details of pixels fetching
> -for the mask image just like 'fetch_src_pixblock' does for the
> -source image. This provides more possibilities for reusing the
> -same code blocks in different compositing functions.
> -
> -This patch does not introduce any functional changes and the
> -resulting code in the compiled object file is exactly the same.
> ----
> - pixman/pixman-arm-neon-asm.S |   26 +++++++++++++-------------
> - pixman/pixman-arm-neon-asm.h |    5 +++++
> - 2 files changed, 18 insertions(+), 13 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index a3875ee..155a236 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -841,7 +841,7 @@ generate_composite_function \
> -     pixman_composite_over_n_8_0565_process_pixblock_tail
> -     vst1.16     {d28, d29}, [DST_W, :128]!
> -     vld1.16     {d4, d5}, [DST_R, :128]!
> --    vld1.8      {d24}, [MASK]!
> -+    fetch_mask_pixblock
> -     cache_preload 8, 8
> -     pixman_composite_over_n_8_0565_process_pixblock_head
> - .endm
> -@@ -889,7 +889,7 @@ generate_composite_function \
> -     pixman_composite_over_n_8_0565_process_pixblock_tail
> -     fetch_src_pixblock
> -     cache_preload 8, 8
> --    vld1.8      {d24}, [MASK]!
> -+    fetch_mask_pixblock
> -     pixman_composite_over_n_8_0565_process_pixblock_head
> -     vst1.16     {d28, d29}, [DST_W, :128]!
> - .endm
> -@@ -1171,7 +1171,7 @@ generate_composite_function \
> -     pixman_composite_over_n_8_8888_process_pixblock_tail
> -     vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
> --    vld1.8      {d24}, [MASK]!
> -+    fetch_mask_pixblock
> -     cache_preload 8, 8
> -     pixman_composite_over_n_8_8888_process_pixblock_head
> - .endm
> -@@ -1241,7 +1241,7 @@ generate_composite_function \
> - .macro pixman_composite_over_n_8_8_process_pixblock_tail_head
> -     vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
> -     pixman_composite_over_n_8_8_process_pixblock_tail
> --    vld1.8      {d24, d25, d26, d27}, [MASK]!
> -+    fetch_mask_pixblock
> -     cache_preload 32, 32
> -     vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -     pixman_composite_over_n_8_8_process_pixblock_head
> -@@ -1341,7 +1341,7 @@ generate_composite_function \
> -         vraddhn.u16 d29, q15, q9
> -         vraddhn.u16 d30, q6, q10
> -         vraddhn.u16 d31, q7, q11
> --    vld4.8      {d24, d25, d26, d27}, [MASK]!
> -+    fetch_mask_pixblock
> -         vqadd.u8    q14, q0, q14
> -         vqadd.u8    q15, q1, q15
> -     cache_preload 8, 8
> -@@ -1405,7 +1405,7 @@ generate_composite_function \
> -     pixman_composite_add_n_8_8_process_pixblock_tail
> -     vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -     vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
> --    vld1.8      {d24, d25, d26, d27}, [MASK]!
> -+    fetch_mask_pixblock
> -     cache_preload 32, 32
> -     pixman_composite_add_n_8_8_process_pixblock_head
> - .endm
> -@@ -1462,7 +1462,7 @@ generate_composite_function \
> -     pixman_composite_add_8_8_8_process_pixblock_tail
> -     vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -     vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
> --    vld1.8      {d24, d25, d26, d27}, [MASK]!
> -+    fetch_mask_pixblock
> -     fetch_src_pixblock
> -     cache_preload 32, 32
> -     pixman_composite_add_8_8_8_process_pixblock_head
> -@@ -1515,7 +1515,7 @@ generate_composite_function \
> -     pixman_composite_add_8888_8888_8888_process_pixblock_tail
> -     vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
> --    vld4.8      {d24, d25, d26, d27}, [MASK]!
> -+    fetch_mask_pixblock
> -     fetch_src_pixblock
> -     cache_preload 8, 8
> -     pixman_composite_add_8888_8888_8888_process_pixblock_head
> -@@ -1587,7 +1587,7 @@ generate_composite_function_single_scanline \
> -     pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
> -     fetch_src_pixblock
> -     cache_preload 8, 8
> --    vld4.8     {d12, d13, d14, d15}, [MASK]!
> -+    fetch_mask_pixblock
> -     pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
> -     vst4.8     {d28, d29, d30, d31}, [DST_W, :128]!
> - .endm
> -@@ -1658,7 +1658,7 @@ generate_composite_function \
> -     pixman_composite_over_8888_n_8888_process_pixblock_tail
> -     fetch_src_pixblock
> -     cache_preload 8, 8
> --    vld4.8     {d12, d13, d14, d15}, [MASK]!
> -+    fetch_mask_pixblock
> -     pixman_composite_over_8888_n_8888_process_pixblock_head
> -     vst4.8     {d28, d29, d30, d31}, [DST_W, :128]!
> - .endm
> -@@ -1700,7 +1700,7 @@ generate_composite_function_single_scanline \
> -     pixman_composite_over_8888_n_8888_process_pixblock_tail
> -     fetch_src_pixblock
> -     cache_preload 8, 8
> --    vld1.8     {d15}, [MASK]!
> -+    fetch_mask_pixblock
> -     pixman_composite_over_8888_n_8888_process_pixblock_head
> -     vst4.8     {d28, d29, d30, d31}, [DST_W, :128]!
> - .endm
> -@@ -1917,7 +1917,7 @@ generate_composite_function \
> - 
> - /* TODO: expand macros and do better instructions scheduling */
> - .macro pixman_composite_over_0565_8_0565_process_pixblock_tail_head
> --    vld1.8     {d15}, [MASK]!
> -+    fetch_mask_pixblock
> -     pixman_composite_over_0565_8_0565_process_pixblock_tail
> -     fetch_src_pixblock
> -     vld1.16    {d10, d11}, [DST_R, :128]!
> -@@ -1969,7 +1969,7 @@ generate_composite_function \
> - 
> - /* TODO: expand macros and do better instructions scheduling */
> - .macro pixman_composite_add_0565_8_0565_process_pixblock_tail_head
> --    vld1.8     {d15}, [MASK]!
> -+    fetch_mask_pixblock
> -     pixman_composite_add_0565_8_0565_process_pixblock_tail
> -     fetch_src_pixblock
> -     vld1.16    {d10, d11}, [DST_R, :128]!
> -diff --git a/pixman/pixman-arm-neon-asm.h b/pixman/pixman-arm-neon-asm.h
> -index c75bdc3..24fa361 100644
> ---- a/pixman/pixman-arm-neon-asm.h
> -+++ b/pixman/pixman-arm-neon-asm.h
> -@@ -431,6 +431,11 @@
> - .endif
> - .endm
> - 
> -+.macro fetch_mask_pixblock
> -+    pixld       pixblock_size, mask_bpp, \
> -+                (mask_basereg - pixblock_size * mask_bpp / 64), MASK
> -+.endm
> -+
> - /*
> -  * Macro which is used to process leading pixels until destination
> -  * pointer is properly aligned (at 16 bytes boundary). When destination
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0007-ARM-better-NEON-instructions-scheduling-for-over_n_8.patch b/recipes/xorg-lib/pixman-0.21.2/0007-ARM-better-NEON-instructions-scheduling-for-over_n_8.patch
> deleted file mode 100644
> index acdfdf8..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0007-ARM-better-NEON-instructions-scheduling-for-over_n_8.patch
> +++ /dev/null
> @@ -1,170 +0,0 @@
> -From e6814837a6ccd3e4db329e0131eaf2055d2c864b Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Fri, 26 Nov 2010 17:06:58 +0200
> -Subject: [PATCH 07/24] ARM: better NEON instructions scheduling for over_n_8_0565
> -
> -Code rearranged to get better instructions scheduling for ARM Cortex-A8/A9.
> -Now it is ~30% faster for the pixel data in L1 cache and makes better use
> -of memory bandwidth when running at lower clock frequencies (ex. 500MHz).
> -Also register d24 (pixels from the mask image) is now not clobbered by
> -supplementary macros, which allows to reuse them for the other variants
> -of compositing operations later.
> -
> -Benchmark from ARM Cortex-A8 @500MHz:
> -
> -== before ==
> -
> -    over_n_8_0565 =  L1:  63.90  L2:  63.15  M: 60.97 ( 73.53%)
> -                     HT:  28.89  VT:  24.14  R: 21.33  RT:  6.78 (  67Kops/s)
> -
> -== after ==
> -
> -    over_n_8_0565 =  L1:  82.64  L2:  75.19  M: 71.52 ( 84.14%)
> -                     HT:  30.49  VT:  25.56  R: 22.36  RT:  6.89 (  68Kops/s)
> ----
> - pixman/pixman-arm-neon-asm.S |  120 +++++++++++++++++++++++++++---------------
> - 1 files changed, 77 insertions(+), 43 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 155a236..ffffc1c 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -792,58 +792,92 @@ generate_composite_function \
> - /******************************************************************************/
> - 
> - .macro pixman_composite_over_n_8_0565_process_pixblock_head
> --    /* in */
> --    vmull.u8    q0, d24, d8
> --    vmull.u8    q1, d24, d9
> --    vmull.u8    q6, d24, d10
> --    vmull.u8    q7, d24, d11
> --    vrshr.u16   q10, q0, #8
> --    vrshr.u16   q11, q1, #8
> --    vrshr.u16   q12, q6, #8
> --    vrshr.u16   q13, q7, #8
> --    vraddhn.u16 d0, q0, q10
> --    vraddhn.u16 d1, q1, q11
> --    vraddhn.u16 d2, q6, q12
> --    vraddhn.u16 d3, q7, q13
> --
> --    vshrn.u16   d6, q2, #8
> --    vshrn.u16   d7, q2, #3
> --    vsli.u16    q2, q2, #5
> --    vsri.u8     d6, d6, #5
> --    vmvn.8      d3, d3
> --    vsri.u8     d7, d7, #6
> --    vshrn.u16   d30, q2, #2
> --    /* now do alpha blending */
> --    vmull.u8    q10, d3, d6
> --    vmull.u8    q11, d3, d7
> --    vmull.u8    q12, d3, d30
> --    vrshr.u16   q13, q10, #8
> --    vrshr.u16   q3, q11, #8
> --    vrshr.u16   q15, q12, #8
> --    vraddhn.u16 d20, q10, q13
> --    vraddhn.u16 d23, q11, q3
> --    vraddhn.u16 d22, q12, q15
> -+    vmull.u8    q0,  d24, d8    /* IN for SRC pixels (part1) */
> -+    vmull.u8    q1,  d24, d9
> -+    vmull.u8    q6,  d24, d10
> -+    vmull.u8    q7,  d24, d11
> -+        vshrn.u16   d6,  q2, #8 /* convert DST_R data to 32-bpp (part1) */
> -+        vshrn.u16   d7,  q2, #3
> -+        vsli.u16    q2,  q2, #5
> -+    vrshr.u16   q8,  q0,  #8    /* IN for SRC pixels (part2) */
> -+    vrshr.u16   q9,  q1,  #8
> -+    vrshr.u16   q10, q6,  #8
> -+    vrshr.u16   q11, q7,  #8
> -+    vraddhn.u16 d0,  q0,  q8
> -+    vraddhn.u16 d1,  q1,  q9
> -+    vraddhn.u16 d2,  q6,  q10
> -+    vraddhn.u16 d3,  q7,  q11
> -+        vsri.u8     d6,  d6, #5 /* convert DST_R data to 32-bpp (part2) */
> -+        vsri.u8     d7,  d7, #6
> -+    vmvn.8      d3,  d3
> -+        vshrn.u16   d30, q2, #2
> -+    vmull.u8    q8,  d3, d6     /* now do alpha blending */
> -+    vmull.u8    q9,  d3, d7
> -+    vmull.u8    q10, d3, d30
> - .endm
> - 
> - .macro pixman_composite_over_n_8_0565_process_pixblock_tail
> --    vqadd.u8    d16, d2, d20
> --    vqadd.u8    q9, q0, q11
> --    /* convert to r5g6b5 */
> --    vshll.u8    q14, d16, #8
> --    vshll.u8    q8, d19, #8
> --    vshll.u8    q9, d18, #8
> --    vsri.u16    q14, q8, #5
> --    vsri.u16    q14, q9, #11
> -+    /* 3 cycle bubble (after vmull.u8) */
> -+    vrshr.u16   q13, q8,  #8
> -+    vrshr.u16   q11, q9,  #8
> -+    vrshr.u16   q15, q10, #8
> -+    vraddhn.u16 d16, q8,  q13
> -+    vraddhn.u16 d27, q9,  q11
> -+    vraddhn.u16 d26, q10, q15
> -+    vqadd.u8    d16, d2,  d16
> -+    /* 1 cycle bubble */
> -+    vqadd.u8    q9,  q0,  q13
> -+    vshll.u8    q14, d16, #8    /* convert to 16bpp */
> -+    vshll.u8    q8,  d19, #8
> -+    vshll.u8    q9,  d18, #8
> -+    vsri.u16    q14, q8,  #5
> -+    /* 1 cycle bubble */
> -+    vsri.u16    q14, q9,  #11
> - .endm
> - 
> --/* TODO: expand macros and do better instructions scheduling */
> - .macro pixman_composite_over_n_8_0565_process_pixblock_tail_head
> --    pixman_composite_over_n_8_0565_process_pixblock_tail
> --    vst1.16     {d28, d29}, [DST_W, :128]!
> -     vld1.16     {d4, d5}, [DST_R, :128]!
> -+    vshrn.u16   d6,  q2,  #8
> -     fetch_mask_pixblock
> -+    vshrn.u16   d7,  q2,  #3
> -+    fetch_src_pixblock
> -+    vmull.u8    q6,  d24, d10
> -+        vrshr.u16   q13, q8,  #8
> -+        vrshr.u16   q11, q9,  #8
> -+        vrshr.u16   q15, q10, #8
> -+        vraddhn.u16 d16, q8,  q13
> -+        vraddhn.u16 d27, q9,  q11
> -+        vraddhn.u16 d26, q10, q15
> -+        vqadd.u8    d16, d2,  d16
> -+    vmull.u8    q1,  d24, d9
> -+        vqadd.u8    q9,  q0,  q13
> -+        vshll.u8    q14, d16, #8
> -+    vmull.u8    q0,  d24, d8
> -+        vshll.u8    q8,  d19, #8
> -+        vshll.u8    q9,  d18, #8
> -+        vsri.u16    q14, q8,  #5
> -+    vmull.u8    q7,  d24, d11
> -+        vsri.u16    q14, q9,  #11
> -+
> -     cache_preload 8, 8
> --    pixman_composite_over_n_8_0565_process_pixblock_head
> -+
> -+    vsli.u16    q2,  q2,  #5
> -+    vrshr.u16   q8,  q0,  #8
> -+    vrshr.u16   q9,  q1,  #8
> -+    vrshr.u16   q10, q6,  #8
> -+    vrshr.u16   q11, q7,  #8
> -+    vraddhn.u16 d0,  q0,  q8
> -+    vraddhn.u16 d1,  q1,  q9
> -+    vraddhn.u16 d2,  q6,  q10
> -+    vraddhn.u16 d3,  q7,  q11
> -+    vsri.u8     d6,  d6,  #5
> -+    vsri.u8     d7,  d7,  #6
> -+    vmvn.8      d3,  d3
> -+    vshrn.u16   d30, q2,  #2
> -+    vst1.16     {d28, d29}, [DST_W, :128]!
> -+    vmull.u8    q8,  d3,  d6
> -+    vmull.u8    q9,  d3,  d7
> -+    vmull.u8    q10, d3,  d30
> - .endm
> - 
> - /*
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0008-ARM-added-neon_composite_over_8888_n_0565-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0008-ARM-added-neon_composite_over_8888_n_0565-fast-path.patch
> deleted file mode 100644
> index 4c5bf8d..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0008-ARM-added-neon_composite_over_8888_n_0565-fast-path.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From a7c36681c0c1955ff9110b81f1789e56abb10a95 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Sat, 27 Nov 2010 03:53:12 +0200
> -Subject: [PATCH 08/24] ARM: added 'neon_composite_over_8888_n_0565' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   28 ++++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |    4 ++++
> - 2 files changed, 32 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index ffffc1c..3e52a49 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -917,6 +917,34 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_over_8888_n_0565_init
> -+    add         DUMMY, sp, #(ARGS_STACK_OFFSET + 8)
> -+    vpush       {d8-d15}
> -+    vld1.32     {d24[0]}, [DUMMY]
> -+    vdup.8      d24, d24[3]
> -+.endm
> -+
> -+.macro pixman_composite_over_8888_n_0565_cleanup
> -+    vpop        {d8-d15}
> -+.endm
> -+
> -+generate_composite_function \
> -+    pixman_composite_over_8888_n_0565_asm_neon, 32, 0, 16, \
> -+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    pixman_composite_over_8888_n_0565_init, \
> -+    pixman_composite_over_8888_n_0565_cleanup, \
> -+    pixman_composite_over_n_8_0565_process_pixblock_head, \
> -+    pixman_composite_over_n_8_0565_process_pixblock_tail, \
> -+    pixman_composite_over_n_8_0565_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    4,  /* dst_r_basereg */ \
> -+    8,  /* src_basereg   */ \
> -+    24  /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - /* TODO: expand macros and do better instructions scheduling */
> - .macro pixman_composite_over_8888_8_0565_process_pixblock_tail_head
> -     vld1.16     {d4, d5}, [DST_R, :128]!
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 72ef75e..8156bbb 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -83,6 +83,8 @@ PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, add_n_8_8,
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_8888,
> -                                      uint32_t, 1, uint32_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_0565,
> -+                                     uint32_t, 1, uint16_t, 1)
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8_8_8,
> -                                         uint8_t, 1, uint8_t, 1, uint8_t, 1)
> -@@ -253,6 +255,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8b8g8r8, x8b8g8r8, neon_composite_over_n_8888_8888_ca),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    a8r8g8b8, neon_composite_over_8888_n_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    x8r8g8b8, neon_composite_over_8888_n_8888),
> -+    PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    r5g6b5,   neon_composite_over_8888_n_0565),
> -+    PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, solid,    b5g6r5,   neon_composite_over_8888_n_0565),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, a8,       a8r8g8b8, neon_composite_over_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, a8,       x8r8g8b8, neon_composite_over_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, a8,       a8b8g8r8, neon_composite_over_8888_8_8888),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0009-ARM-reuse-common-NEON-code-for-over_-n_8-8888_n-8888.patch b/recipes/xorg-lib/pixman-0.21.2/0009-ARM-reuse-common-NEON-code-for-over_-n_8-8888_n-8888.patch
> deleted file mode 100644
> index b45671e..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0009-ARM-reuse-common-NEON-code-for-over_-n_8-8888_n-8888.patch
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -From 3990931bf6197eff1cec06cf24bce53ddf9a539a Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Sat, 27 Nov 2010 04:47:39 +0200
> -Subject: [PATCH 09/24] ARM: reuse common NEON code for over_{n_8|8888_n|8888_8}_0565
> -
> -Renamed suppementary macros from 'over_n_8_0565' to 'over_8888_8_0565',
> -because they can actually support all variants of this operation:
> -over_8888_8_0565/over_n_8_0565/over_8888_n_0565.
> -
> -Also 'over_8888_8_0565' now uses more optimized common code instead of its
> -own variant, improving performance a bit. Even though this operation is
> -still memory bandwidth limited, scaled variants of these fast paths may
> -put more stress on CPU later.
> -
> -Benchmarked on ARM Cortex-A8 @500MHz:
> -
> -== before ==
> -
> -    over_8888_8_0565 =  L1:  67.10  L2:  53.82  M: 44.70 (105.17%)
> -                        HT:  18.73  VT:  16.91  R: 14.25  RT:  4.80 (52Kops/s)
> -
> -== after ==
> -
> -    over_8888_8_0565 =  L1:  77.83  L2:  58.14  M: 44.82 (105.52%)
> -                        HT:  20.58  VT:  17.44  R: 15.05  RT:  4.88 (52Kops/s)
> ----
> - pixman/pixman-arm-neon-asm.S |   61 +++++++++++++++++------------------------
> - 1 files changed, 25 insertions(+), 36 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 3e52a49..4175144 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -791,7 +791,7 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> --.macro pixman_composite_over_n_8_0565_process_pixblock_head
> -+.macro pixman_composite_over_8888_8_0565_process_pixblock_head
> -     vmull.u8    q0,  d24, d8    /* IN for SRC pixels (part1) */
> -     vmull.u8    q1,  d24, d9
> -     vmull.u8    q6,  d24, d10
> -@@ -816,7 +816,7 @@ generate_composite_function \
> -     vmull.u8    q10, d3, d30
> - .endm
> - 
> --.macro pixman_composite_over_n_8_0565_process_pixblock_tail
> -+.macro pixman_composite_over_8888_8_0565_process_pixblock_tail
> -     /* 3 cycle bubble (after vmull.u8) */
> -     vrshr.u16   q13, q8,  #8
> -     vrshr.u16   q11, q9,  #8
> -@@ -835,7 +835,7 @@ generate_composite_function \
> -     vsri.u16    q14, q9,  #11
> - .endm
> - 
> --.macro pixman_composite_over_n_8_0565_process_pixblock_tail_head
> -+.macro pixman_composite_over_8888_8_0565_process_pixblock_tail_head
> -     vld1.16     {d4, d5}, [DST_R, :128]!
> -     vshrn.u16   d6,  q2,  #8
> -     fetch_mask_pixblock
> -@@ -880,6 +880,23 @@ generate_composite_function \
> -     vmull.u8    q10, d3,  d30
> - .endm
> - 
> -+generate_composite_function \
> -+    pixman_composite_over_8888_8_0565_asm_neon, 32, 8, 16, \
> -+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    default_init_need_all_regs, \
> -+    default_cleanup_need_all_regs, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_head, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_tail, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    4,  /* dst_r_basereg */ \
> -+    8,  /* src_basereg   */ \
> -+    24  /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - /*
> -  * This function needs a special initialization of solid mask.
> -  * Solid source pixel data is fetched from stack at ARGS_STACK_OFFSET
> -@@ -911,9 +928,9 @@ generate_composite_function \
> -     5, /* prefetch distance */ \
> -     pixman_composite_over_n_8_0565_init, \
> -     pixman_composite_over_n_8_0565_cleanup, \
> --    pixman_composite_over_n_8_0565_process_pixblock_head, \
> --    pixman_composite_over_n_8_0565_process_pixblock_tail, \
> --    pixman_composite_over_n_8_0565_process_pixblock_tail_head
> -+    pixman_composite_over_8888_8_0565_process_pixblock_head, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_tail, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_tail_head
> - 
> - /******************************************************************************/
> - 
> -@@ -935,36 +952,8 @@ generate_composite_function \
> -     5, /* prefetch distance */ \
> -     pixman_composite_over_8888_n_0565_init, \
> -     pixman_composite_over_8888_n_0565_cleanup, \
> --    pixman_composite_over_n_8_0565_process_pixblock_head, \
> --    pixman_composite_over_n_8_0565_process_pixblock_tail, \
> --    pixman_composite_over_n_8_0565_process_pixblock_tail_head, \
> --    28, /* dst_w_basereg */ \
> --    4,  /* dst_r_basereg */ \
> --    8,  /* src_basereg   */ \
> --    24  /* mask_basereg  */
> --
> --/******************************************************************************/
> --
> --/* TODO: expand macros and do better instructions scheduling */
> --.macro pixman_composite_over_8888_8_0565_process_pixblock_tail_head
> --    vld1.16     {d4, d5}, [DST_R, :128]!
> --    pixman_composite_over_n_8_0565_process_pixblock_tail
> --    fetch_src_pixblock
> --    cache_preload 8, 8
> --    fetch_mask_pixblock
> --    pixman_composite_over_n_8_0565_process_pixblock_head
> --    vst1.16     {d28, d29}, [DST_W, :128]!
> --.endm
> --
> --generate_composite_function \
> --    pixman_composite_over_8888_8_0565_asm_neon, 32, 8, 16, \
> --    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
> --    8, /* number of pixels, processed in a single block */ \
> --    5, /* prefetch distance */ \
> --    default_init_need_all_regs, \
> --    default_cleanup_need_all_regs, \
> --    pixman_composite_over_n_8_0565_process_pixblock_head, \
> --    pixman_composite_over_n_8_0565_process_pixblock_tail, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_head, \
> -+    pixman_composite_over_8888_8_0565_process_pixblock_tail, \
> -     pixman_composite_over_8888_8_0565_process_pixblock_tail_head, \
> -     28, /* dst_w_basereg */ \
> -     4,  /* dst_r_basereg */ \
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0010-ARM-added-neon_composite_over_0565_n_0565-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0010-ARM-added-neon_composite_over_0565_n_0565-fast-path.patch
> deleted file mode 100644
> index 376631a..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0010-ARM-added-neon_composite_over_0565_n_0565-fast-path.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 6d2f7f981b52b41f4321071c325babcf792bd666 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Sat, 27 Nov 2010 15:53:54 +0200
> -Subject: [PATCH 10/24] ARM: added 'neon_composite_over_0565_n_0565' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   28 ++++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |    4 ++++
> - 2 files changed, 32 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 4175144..81c0a34 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1994,6 +1994,34 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_over_0565_n_0565_init
> -+    add         DUMMY, sp, #(ARGS_STACK_OFFSET + 8)
> -+    vpush       {d8-d15}
> -+    vld1.32     {d15[0]}, [DUMMY]
> -+    vdup.8      d15, d15[3]
> -+.endm
> -+
> -+.macro pixman_composite_over_0565_n_0565_cleanup
> -+    vpop        {d8-d15}
> -+.endm
> -+
> -+generate_composite_function \
> -+    pixman_composite_over_0565_n_0565_asm_neon, 16, 0, 16, \
> -+    FLAG_DST_READWRITE, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    pixman_composite_over_0565_n_0565_init, \
> -+    pixman_composite_over_0565_n_0565_cleanup, \
> -+    pixman_composite_over_0565_8_0565_process_pixblock_head, \
> -+    pixman_composite_over_0565_8_0565_process_pixblock_tail, \
> -+    pixman_composite_over_0565_8_0565_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    10, /* dst_r_basereg */ \
> -+    8,  /* src_basereg   */ \
> -+    15  /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - .macro pixman_composite_add_0565_8_0565_process_pixblock_head
> -     /* mask is in d15 */
> -     convert_0565_to_x888 q4, d2, d1, d0
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 8156bbb..b01c3e0 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -85,6 +85,8 @@ PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_8888,
> -                                      uint32_t, 1, uint32_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_0565,
> -                                      uint32_t, 1, uint16_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_0565_n_0565,
> -+                                     uint16_t, 1, uint16_t, 1)
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8_8_8,
> -                                         uint8_t, 1, uint8_t, 1, uint8_t, 1)
> -@@ -257,6 +259,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    x8r8g8b8, neon_composite_over_8888_n_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    r5g6b5,   neon_composite_over_8888_n_0565),
> -     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, solid,    b5g6r5,   neon_composite_over_8888_n_0565),
> -+    PIXMAN_STD_FAST_PATH (OVER, r5g6b5,   solid,    r5g6b5,   neon_composite_over_0565_n_0565),
> -+    PIXMAN_STD_FAST_PATH (OVER, b5g6r5,   solid,    b5g6r5,   neon_composite_over_0565_n_0565),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, a8,       a8r8g8b8, neon_composite_over_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, a8,       x8r8g8b8, neon_composite_over_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, a8,       a8b8g8r8, neon_composite_over_8888_8_8888),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0011-ARM-added-neon_composite_add_8888_8_8888-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0011-ARM-added-neon_composite_add_8888_8_8888-fast-path.patch
> deleted file mode 100644
> index 19f429b..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0011-ARM-added-neon_composite_add_8888_8_8888-fast-path.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From c3f48b6aa2f9354af02ffc8c938ec6753fdcbde3 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Sun, 28 Nov 2010 22:05:53 +0200
> -Subject: [PATCH 11/24] ARM: added 'neon_composite_add_8888_8_8888' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   17 +++++++++++++++++
> - pixman/pixman-arm-neon.c     |    4 ++++
> - 2 files changed, 21 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 81c0a34..11ef166 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1595,6 +1595,23 @@ generate_composite_function_single_scanline \
> - 
> - /******************************************************************************/
> - 
> -+generate_composite_function \
> -+    pixman_composite_add_8888_8_8888_asm_neon, 32, 8, 32, \
> -+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    default_init, \
> -+    default_cleanup, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_head, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_tail, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    4,  /* dst_r_basereg */ \
> -+    0,  /* src_basereg   */ \
> -+    27  /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - .macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
> -     /* expecting source data in {d0, d1, d2, d3} */
> -     /* destination data in {d4, d5, d6, d7} */
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index b01c3e0..eaf9787 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -92,6 +92,8 @@ PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8_8_8,
> -                                         uint8_t, 1, uint8_t, 1, uint8_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_0565_8_0565,
> -                                         uint16_t, 1, uint8_t, 1, uint16_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8888_8_8888,
> -+                                        uint32_t, 1, uint8_t, 1, uint32_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8888_8888_8888,
> -                                         uint32_t, 1, uint32_t, 1, uint32_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, over_8888_8_8888,
> -@@ -282,6 +284,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (ADD,  a8,       a8,       a8,       neon_composite_add_8_8_8),
> -     PIXMAN_STD_FAST_PATH (ADD,  r5g6b5,   a8,       r5g6b5,   neon_composite_add_0565_8_0565),
> -     PIXMAN_STD_FAST_PATH (ADD,  b5g6r5,   a8,       b5g6r5,   neon_composite_add_0565_8_0565),
> -+    PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8,       a8r8g8b8, neon_composite_add_8888_8_8888),
> -+    PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, a8,       a8b8g8r8, neon_composite_add_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8r8g8b8, a8r8g8b8, neon_composite_add_8888_8888_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8,       null,     a8,       neon_composite_add_8_8),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, null,     a8r8g8b8, neon_composite_add_8888_8888),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0012-ARM-better-NEON-instructions-scheduling-for-add_8888.patch b/recipes/xorg-lib/pixman-0.21.2/0012-ARM-better-NEON-instructions-scheduling-for-add_8888.patch
> deleted file mode 100644
> index 28dd8b6..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0012-ARM-better-NEON-instructions-scheduling-for-add_8888.patch
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -From 1fba7790367d7b726d05a33bbbcebe10b9280a31 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Mon, 29 Nov 2010 02:10:22 +0200
> -Subject: [PATCH 12/24] ARM: better NEON instructions scheduling for add_8888_8888_8888
> -
> -Provides a minor performance improvement by using pipelining and hiding
> -instructions latencies. Also do not clobber d0-d3 registers (source
> -image pixels) while doing calculations in order to allow the use of
> -the same macro for add_n_8_8888 fast path later.
> -
> -Benchmark from ARM Cortex-A8 @500MHz:
> -
> -== before ==
> -
> -  add_8888_8888_8888 = L1:  95.94  L2:  42.27  M: 25.60 (121.09%)
> -                       HT:  14.54  VT:  13.13  R: 12.77  RT:  4.49 (48Kops/s)
> -     add_8888_8_8888 = L1: 104.51  L2:  57.81  M: 36.06 (106.62%)
> -                       HT:  19.24  VT:  16.45  R: 14.71  RT:  4.80 (51Kops/s)
> -
> -== after ==
> -
> -  add_8888_8888_8888 = L1: 106.66  L2:  47.82  M: 27.32 (129.30%)
> -                       HT:  15.44  VT:  13.96  R: 12.86  RT:  4.48 (48Kops/s)
> -     add_8888_8_8888 = L1: 107.72  L2:  61.02  M: 38.26 (113.16%)
> -                       HT:  19.48  VT:  16.72  R: 14.82  RT:  4.80 (51Kops/s)
> ----
> - pixman/pixman-arm-neon-asm.S |   52 +++++++++++++++++++++++++++--------------
> - 1 files changed, 34 insertions(+), 18 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 11ef166..829ef84 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1542,34 +1542,50 @@ generate_composite_function \
> -     /* expecting source data in {d0, d1, d2, d3} */
> -     /* destination data in {d4, d5, d6, d7} */
> -     /* mask in {d24, d25, d26, d27} */
> --    vmull.u8    q8, d27, d0
> --    vmull.u8    q9, d27, d1
> -+    vmull.u8    q8,  d27, d0
> -+    vmull.u8    q9,  d27, d1
> -     vmull.u8    q10, d27, d2
> -     vmull.u8    q11, d27, d3
> --    vrshr.u16   q0, q8, #8
> --    vrshr.u16   q1, q9, #8
> --    vrshr.u16   q12, q10, #8
> --    vrshr.u16   q13, q11, #8
> --    vraddhn.u16 d0, q0, q8
> --    vraddhn.u16 d1, q1, q9
> --    vraddhn.u16 d2, q12, q10
> --    vraddhn.u16 d3, q13, q11
> --    vqadd.u8    q14, q0, q2
> --    vqadd.u8    q15, q1, q3
> -+    /* 1 cycle bubble */
> -+    vrsra.u16   q8,  q8,  #8
> -+    vrsra.u16   q9,  q9,  #8
> -+    vrsra.u16   q10, q10, #8
> -+    vrsra.u16   q11, q11, #8
> - .endm
> - 
> - .macro pixman_composite_add_8888_8888_8888_process_pixblock_tail
> -+    /* 2 cycle bubble */
> -+    vrshrn.u16  d28, q8,  #8
> -+    vrshrn.u16  d29, q9,  #8
> -+    vrshrn.u16  d30, q10, #8
> -+    vrshrn.u16  d31, q11, #8
> -+    vqadd.u8    q14, q2,  q14
> -+    /* 1 cycle bubble */
> -+    vqadd.u8    q15, q3,  q15
> - .endm
> - 
> --/* TODO: expand macros and do better instructions scheduling */
> - .macro pixman_composite_add_8888_8888_8888_process_pixblock_tail_head
> --    pixman_composite_add_8888_8888_8888_process_pixblock_tail
> --    vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
> --    vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
> --    fetch_mask_pixblock
> -     fetch_src_pixblock
> -+        vrshrn.u16  d28, q8,  #8
> -+    fetch_mask_pixblock
> -+        vrshrn.u16  d29, q9,  #8
> -+    vmull.u8    q8,  d27, d0
> -+        vrshrn.u16  d30, q10, #8
> -+    vmull.u8    q9,  d27, d1
> -+        vrshrn.u16  d31, q11, #8
> -+    vmull.u8    q10, d27, d2
> -+        vqadd.u8    q14, q2,  q14
> -+    vmull.u8    q11, d27, d3
> -+        vqadd.u8    q15, q3,  q15
> -+    vrsra.u16   q8,  q8,  #8
> -+    vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
> -+    vrsra.u16   q9,  q9,  #8
> -+        vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -+    vrsra.u16   q10, q10, #8
> -+
> -     cache_preload 8, 8
> --    pixman_composite_add_8888_8888_8888_process_pixblock_head
> -+
> -+    vrsra.u16   q11, q11, #8
> - .endm
> - 
> - generate_composite_function \
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0013-ARM-added-neon_composite_add_n_8_8888-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0013-ARM-added-neon_composite_add_n_8_8888-fast-path.patch
> deleted file mode 100644
> index a1da09f..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0013-ARM-added-neon_composite_add_n_8_8888-fast-path.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From b066b520dfaf0a9f4d1bc9a73c789091e9ce7cc8 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Mon, 29 Nov 2010 02:38:52 +0200
> -Subject: [PATCH 13/24] ARM: added 'neon_composite_add_n_8_8888' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   29 +++++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |    4 ++++
> - 2 files changed, 33 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 829ef84..dd6f2c5 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1628,6 +1628,35 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_add_n_8_8888_init
> -+    add         DUMMY, sp, #ARGS_STACK_OFFSET
> -+    vld1.32     {d3[0]}, [DUMMY]
> -+    vdup.8      d0, d3[0]
> -+    vdup.8      d1, d3[1]
> -+    vdup.8      d2, d3[2]
> -+    vdup.8      d3, d3[3]
> -+.endm
> -+
> -+.macro pixman_composite_add_n_8_8888_cleanup
> -+.endm
> -+
> -+generate_composite_function \
> -+    pixman_composite_add_n_8_8888_asm_neon, 0, 8, 32, \
> -+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    pixman_composite_add_n_8_8888_init, \
> -+    pixman_composite_add_n_8_8888_cleanup, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_head, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_tail, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    4,  /* dst_r_basereg */ \
> -+    0,  /* src_basereg   */ \
> -+    27  /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - .macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
> -     /* expecting source data in {d0, d1, d2, d3} */
> -     /* destination data in {d4, d5, d6, d7} */
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index eaf9787..5ad58bd 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -80,6 +80,8 @@ PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8_8,
> -                                       uint8_t, 1, uint8_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, add_n_8_8,
> -                                       uint8_t, 1, uint8_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, add_n_8_8888,
> -+                                      uint8_t, 1, uint32_t, 1)
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_8888,
> -                                      uint32_t, 1, uint32_t, 1)
> -@@ -281,6 +283,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (OVER, x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
> -     PIXMAN_STD_FAST_PATH (OVER, x8b8g8r8, null,     a8b8g8r8, neon_composite_src_x888_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8,       neon_composite_add_n_8_8),
> -+    PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8r8g8b8, neon_composite_add_n_8_8888),
> -+    PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8b8g8r8, neon_composite_add_n_8_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8,       a8,       a8,       neon_composite_add_8_8_8),
> -     PIXMAN_STD_FAST_PATH (ADD,  r5g6b5,   a8,       r5g6b5,   neon_composite_add_0565_8_0565),
> -     PIXMAN_STD_FAST_PATH (ADD,  b5g6r5,   a8,       b5g6r5,   neon_composite_add_0565_8_0565),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0014-ARM-added-neon_composite_add_8888_n_8888-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0014-ARM-added-neon_composite_add_8888_n_8888-fast-path.patch
> deleted file mode 100644
> index 0caa29d..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0014-ARM-added-neon_composite_add_8888_n_8888-fast-path.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From f6843e3797eea7e4aed7614b1086f5cefc06c0f9 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Mon, 29 Nov 2010 03:31:32 +0200
> -Subject: [PATCH 14/24] ARM: added 'neon_composite_add_8888_n_8888' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   26 ++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |    4 ++++
> - 2 files changed, 30 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index dd6f2c5..2c0fd37 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1657,6 +1657,32 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_add_8888_n_8888_init
> -+    add         DUMMY, sp, #(ARGS_STACK_OFFSET + 8)
> -+    vld1.32     {d27[0]}, [DUMMY]
> -+    vdup.8      d27, d27[3]
> -+.endm
> -+
> -+.macro pixman_composite_add_8888_n_8888_cleanup
> -+.endm
> -+
> -+generate_composite_function \
> -+    pixman_composite_add_8888_n_8888_asm_neon, 32, 0, 32, \
> -+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    pixman_composite_add_8888_n_8888_init, \
> -+    pixman_composite_add_8888_n_8888_cleanup, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_head, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_tail, \
> -+    pixman_composite_add_8888_8888_8888_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    4,  /* dst_r_basereg */ \
> -+    0,  /* src_basereg   */ \
> -+    27  /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - .macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
> -     /* expecting source data in {d0, d1, d2, d3} */
> -     /* destination data in {d4, d5, d6, d7} */
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 5ad58bd..f0dc111 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -89,6 +89,8 @@ PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_0565,
> -                                      uint32_t, 1, uint16_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_0565_n_0565,
> -                                      uint16_t, 1, uint16_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, add_8888_n_8888,
> -+                                     uint32_t, 1, uint32_t, 1)
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8_8_8,
> -                                         uint8_t, 1, uint8_t, 1, uint8_t, 1)
> -@@ -291,6 +293,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8,       a8r8g8b8, neon_composite_add_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, a8,       a8b8g8r8, neon_composite_add_8888_8_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8r8g8b8, a8r8g8b8, neon_composite_add_8888_8888_8888),
> -+    PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, solid,    a8r8g8b8, neon_composite_add_8888_n_8888),
> -+    PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, solid,    a8b8g8r8, neon_composite_add_8888_n_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8,       null,     a8,       neon_composite_add_8_8),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, null,     a8r8g8b8, neon_composite_add_8888_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, null,     a8b8g8r8, neon_composite_add_8888_8888),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0015-ARM-added-flags-parameter-to-some-asm-fast-path-wrap.patch b/recipes/xorg-lib/pixman-0.21.2/0015-ARM-added-flags-parameter-to-some-asm-fast-path-wrap.patch
> deleted file mode 100644
> index 5f24481..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0015-ARM-added-flags-parameter-to-some-asm-fast-path-wrap.patch
> +++ /dev/null
> @@ -1,153 +0,0 @@
> -From af7a69d90ea2b43a4e850870727723d719f09a1c Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Mon, 29 Nov 2010 09:00:46 +0200
> -Subject: [PATCH 15/24] ARM: added flags parameter to some asm fast path wrapper macros
> -
> -Not all types of operations can be skipped when having transparent
> -solid source or transparent solid mask. Add an extra flags parameter
> -for providing this information to the wrappers.
> ----
> - pixman/pixman-arm-common.h |   15 +++++++++------
> - pixman/pixman-arm-neon.c   |   26 +++++++++++++-------------
> - pixman/pixman-arm-simd.c   |    4 ++--
> - 3 files changed, 24 insertions(+), 21 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-common.h b/pixman/pixman-arm-common.h
> -index 2cff6c8..66f448d 100644
> ---- a/pixman/pixman-arm-common.h
> -+++ b/pixman/pixman-arm-common.h
> -@@ -47,6 +47,9 @@
> -  * or mask), the corresponding stride argument is unused.
> -  */
> - 
> -+#define SKIP_ZERO_SRC  1
> -+#define SKIP_ZERO_MASK 2
> -+
> - #define PIXMAN_ARM_BIND_FAST_PATH_SRC_DST(cputype, name,                \
> -                                           src_type, src_cnt,            \
> -                                           dst_type, dst_cnt)            \
> -@@ -87,7 +90,7 @@ cputype##_composite_##name (pixman_implementation_t *imp,               \
> -                                              src_line, src_stride);     \
> - }
> - 
> --#define PIXMAN_ARM_BIND_FAST_PATH_N_DST(cputype, name,                  \
> -+#define PIXMAN_ARM_BIND_FAST_PATH_N_DST(flags, cputype, name,           \
> -                                         dst_type, dst_cnt)              \
> - void                                                                    \
> - pixman_composite_##name##_asm_##cputype (int32_t    w,                  \
> -@@ -117,7 +120,7 @@ cputype##_composite_##name (pixman_implementation_t *imp,               \
> -                                                                         \
> -     src = _pixman_image_get_solid (src_image, dst_image->bits.format);  \
> -                                                                         \
> --    if (src == 0)                                                       \
> -+    if ((flags & SKIP_ZERO_SRC) && src == 0)                            \
> - 	return;                                                         \
> -                                                                         \
> -     PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, dst_type,         \
> -@@ -128,7 +131,7 @@ cputype##_composite_##name (pixman_implementation_t *imp,               \
> -                                              src);                      \
> - }
> - 
> --#define PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST(cputype, name,             \
> -+#define PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST(flags, cputype, name,      \
> -                                              mask_type, mask_cnt,       \
> -                                              dst_type, dst_cnt)         \
> - void                                                                    \
> -@@ -163,7 +166,7 @@ cputype##_composite_##name (pixman_implementation_t *imp,               \
> -                                                                         \
> -     src = _pixman_image_get_solid (src_image, dst_image->bits.format);  \
> -                                                                         \
> --    if (src == 0)                                                       \
> -+    if ((flags & SKIP_ZERO_SRC) && src == 0)                            \
> - 	return;                                                         \
> -                                                                         \
> -     PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, dst_type,         \
> -@@ -177,7 +180,7 @@ cputype##_composite_##name (pixman_implementation_t *imp,               \
> -                                              mask_line, mask_stride);   \
> - }
> - 
> --#define PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST(cputype, name,              \
> -+#define PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST(flags, cputype, name,       \
> -                                             src_type, src_cnt,          \
> -                                             dst_type, dst_cnt)          \
> - void                                                                    \
> -@@ -211,7 +214,7 @@ cputype##_composite_##name (pixman_implementation_t *imp,               \
> -                                                                         \
> -     mask = _pixman_image_get_solid (mask_image, dst_image->bits.format);\
> -                                                                         \
> --    if (mask == 0)                                                      \
> -+    if ((flags & SKIP_ZERO_MASK) && mask == 0)                          \
> - 	return;                                                         \
> -                                                                         \
> -     PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, dst_type,         \
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index f0dc111..1a3741c 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -63,33 +63,33 @@ PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (neon, over_8888_8888,
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (neon, out_reverse_8_0565,
> -                                    uint8_t, 1, uint16_t, 1)
> - 
> --PIXMAN_ARM_BIND_FAST_PATH_N_DST (neon, over_n_0565,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_DST (SKIP_ZERO_SRC, neon, over_n_0565,
> -                                  uint16_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_DST (neon, over_n_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_DST (SKIP_ZERO_SRC, neon, over_n_8888,
> -                                  uint32_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_DST (neon, over_reverse_n_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_DST (SKIP_ZERO_SRC, neon, over_reverse_n_8888,
> -                                  uint32_t, 1)
> - 
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8_0565,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, over_n_8_0565,
> -                                       uint8_t, 1, uint16_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, over_n_8_8888,
> -                                       uint8_t, 1, uint32_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8888_8888_ca,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, over_n_8888_8888_ca,
> -                                       uint32_t, 1, uint32_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, over_n_8_8,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, over_n_8_8,
> -                                       uint8_t, 1, uint8_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, add_n_8_8,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, add_n_8_8,
> -                                       uint8_t, 1, uint8_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (neon, add_n_8_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, add_n_8_8888,
> -                                       uint8_t, 1, uint32_t, 1)
> - 
> --PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (SKIP_ZERO_MASK, neon, over_8888_n_8888,
> -                                      uint32_t, 1, uint32_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_8888_n_0565,
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (SKIP_ZERO_MASK, neon, over_8888_n_0565,
> -                                      uint32_t, 1, uint16_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, over_0565_n_0565,
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (SKIP_ZERO_MASK, neon, over_0565_n_0565,
> -                                      uint16_t, 1, uint16_t, 1)
> --PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (neon, add_8888_n_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (SKIP_ZERO_MASK, neon, add_8888_n_8888,
> -                                      uint32_t, 1, uint32_t, 1)
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_MASK_DST (neon, add_8_8_8,
> -diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
> -index 3b05007..dc2f471 100644
> ---- a/pixman/pixman-arm-simd.c
> -+++ b/pixman/pixman-arm-simd.c
> -@@ -381,10 +381,10 @@ PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, add_8_8,
> - PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, over_8888_8888,
> -                                    uint32_t, 1, uint32_t, 1)
> - 
> --PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (armv6, over_8888_n_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_SRC_N_DST (SKIP_ZERO_MASK, armv6, over_8888_n_8888,
> -                                      uint32_t, 1, uint32_t, 1)
> - 
> --PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (armv6, over_n_8_8888,
> -+PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, armv6, over_n_8_8888,
> -                                       uint8_t, 1, uint32_t, 1)
> - 
> - PIXMAN_ARM_BIND_SCALED_NEAREST_SRC_DST (armv6, 0565_0565, SRC,
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0016-ARM-added-neon_composite_in_n_8-fast-path.patch b/recipes/xorg-lib/pixman-0.21.2/0016-ARM-added-neon_composite_in_n_8-fast-path.patch
> deleted file mode 100644
> index 8a22f54..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0016-ARM-added-neon_composite_in_n_8-fast-path.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 733f68912f4a44c24ad3973049a7e1d98f4c6ea8 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Mon, 29 Nov 2010 09:11:29 +0200
> -Subject: [PATCH 16/24] ARM: added 'neon_composite_in_n_8' fast path
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   52 ++++++++++++++++++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |    3 ++
> - 2 files changed, 55 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 2c0fd37..cf014fa 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1427,6 +1427,58 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_in_n_8_process_pixblock_head
> -+    /* expecting source data in {d0, d1, d2, d3} */
> -+    /* and destination data in {d4, d5, d6, d7} */
> -+    vmull.u8    q8,  d4,  d3
> -+    vmull.u8    q9,  d5,  d3
> -+    vmull.u8    q10, d6,  d3
> -+    vmull.u8    q11, d7,  d3
> -+.endm
> -+
> -+.macro pixman_composite_in_n_8_process_pixblock_tail
> -+    vrshr.u16   q14, q8,  #8
> -+    vrshr.u16   q15, q9,  #8
> -+    vrshr.u16   q12, q10, #8
> -+    vrshr.u16   q13, q11, #8
> -+    vraddhn.u16 d28, q8,  q14
> -+    vraddhn.u16 d29, q9,  q15
> -+    vraddhn.u16 d30, q10, q12
> -+    vraddhn.u16 d31, q11, q13
> -+.endm
> -+
> -+.macro pixman_composite_in_n_8_process_pixblock_tail_head
> -+    pixman_composite_in_n_8_process_pixblock_tail
> -+    vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
> -+    cache_preload 32, 32
> -+    pixman_composite_in_n_8_process_pixblock_head
> -+    vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
> -+.endm
> -+
> -+.macro pixman_composite_in_n_8_init
> -+    add         DUMMY, sp, #ARGS_STACK_OFFSET
> -+    vld1.32     {d3[0]}, [DUMMY]
> -+    vdup.8      d3, d3[3]
> -+.endm
> -+
> -+.macro pixman_composite_in_n_8_cleanup
> -+.endm
> -+
> -+generate_composite_function \
> -+    pixman_composite_in_n_8_asm_neon, 0, 0, 8, \
> -+    FLAG_DST_READWRITE, \
> -+    32, /* number of pixels, processed in a single block */ \
> -+    5, /* prefetch distance */ \
> -+    pixman_composite_in_n_8_init, \
> -+    pixman_composite_in_n_8_cleanup, \
> -+    pixman_composite_in_n_8_process_pixblock_head, \
> -+    pixman_composite_in_n_8_process_pixblock_tail, \
> -+    pixman_composite_in_n_8_process_pixblock_tail_head, \
> -+    28, /* dst_w_basereg */ \
> -+    4,  /* dst_r_basereg */ \
> -+    0,  /* src_basereg   */ \
> -+    24  /* mask_basereg  */
> -+
> - .macro pixman_composite_add_n_8_8_process_pixblock_head
> -     /* expecting source data in {d8, d9, d10, d11} */
> -     /* d8 - blue, d9 - green, d10 - red, d11 - alpha */
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 1a3741c..e3eca2b 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -69,6 +69,8 @@ PIXMAN_ARM_BIND_FAST_PATH_N_DST (SKIP_ZERO_SRC, neon, over_n_8888,
> -                                  uint32_t, 1)
> - PIXMAN_ARM_BIND_FAST_PATH_N_DST (SKIP_ZERO_SRC, neon, over_reverse_n_8888,
> -                                  uint32_t, 1)
> -+PIXMAN_ARM_BIND_FAST_PATH_N_DST (0, neon, in_n_8,
> -+                                 uint8_t, 1)
> - 
> - PIXMAN_ARM_BIND_FAST_PATH_N_MASK_DST (SKIP_ZERO_SRC, neon, over_n_8_0565,
> -                                       uint8_t, 1, uint16_t, 1)
> -@@ -298,6 +300,7 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
> -     PIXMAN_STD_FAST_PATH (ADD,  a8,       null,     a8,       neon_composite_add_8_8),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, null,     a8r8g8b8, neon_composite_add_8888_8888),
> -     PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, null,     a8b8g8r8, neon_composite_add_8888_8888),
> -+    PIXMAN_STD_FAST_PATH (IN,   solid,    null,     a8,       neon_composite_in_n_8),
> -     PIXMAN_STD_FAST_PATH (OVER_REVERSE, solid, null, a8r8g8b8, neon_composite_over_reverse_n_8888),
> -     PIXMAN_STD_FAST_PATH (OVER_REVERSE, solid, null, a8b8g8r8, neon_composite_over_reverse_n_8888),
> -     PIXMAN_STD_FAST_PATH (OUT_REVERSE,  a8,    null, r5g6b5,   neon_composite_out_reverse_8_0565),
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0017-add-_pixman_bits_override_accessors.patch b/recipes/xorg-lib/pixman-0.21.2/0017-add-_pixman_bits_override_accessors.patch
> deleted file mode 100644
> index a8148d9..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0017-add-_pixman_bits_override_accessors.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 6593d86679fde724e49efa96b16ca22d9521b288 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Thu, 10 Dec 2009 00:51:50 +0200
> -Subject: [PATCH 17/24] add _pixman_bits_override_accessors
> -
> -* from patch ARM: HACK: added NEON optimizations for fetch/store r5g6b5 scanline
> -* used in
> -  0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
> -  0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
> -  0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
> ----
> - pixman/pixman-access.c  |   23 ++++++++++++++++++++++-
> - pixman/pixman-private.h |    5 +++++
> - 2 files changed, 27 insertions(+), 1 deletions(-)
> -
> -diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
> -index f1ce0ba..b33da29 100644
> ---- a/pixman/pixman-access.c
> -+++ b/pixman/pixman-access.c
> -@@ -2836,7 +2836,7 @@ typedef struct
> - 	    store_scanline_ ## format, store_scanline_generic_64	\
> -     }
> - 
> --static const format_info_t accessors[] =
> -+static format_info_t accessors[] =
> - {
> - /* 32 bpp formats */
> -     FORMAT_INFO (a8r8g8b8),
> -@@ -2978,6 +2978,27 @@ _pixman_bits_image_setup_accessors (bits_image_t *image)
> - 	setup_accessors (image);
> - }
> - 
> -+void
> -+_pixman_bits_override_accessors (pixman_format_code_t format,
> -+                                 fetch_scanline_t     fetch_func,
> -+                                 store_scanline_t     store_func)
> -+{
> -+    format_info_t *info = accessors;
> -+
> -+    while (info->format != PIXMAN_null)
> -+    {
> -+	if (info->format == format)
> -+	{
> -+	    if (fetch_func)
> -+		info->fetch_scanline_32 = fetch_func;
> -+	    if (store_func)
> -+		info->store_scanline_32 = store_func;
> -+	    return;
> -+	}
> -+	info++;
> -+    }
> -+}
> -+
> - #else
> - 
> - void
> -diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
> -index 383748a..969dfab 100644
> ---- a/pixman/pixman-private.h
> -+++ b/pixman/pixman-private.h
> -@@ -197,6 +197,11 @@ void
> - _pixman_bits_image_setup_accessors (bits_image_t *image);
> - 
> - void
> -+_pixman_bits_override_accessors (pixman_format_code_t format,
> -+                                 fetch_scanline_t     fetch_func,
> -+                                 store_scanline_t     store_func);
> -+
> -+void
> - _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
> -                                         int             x,
> -                                         int             y,
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.21.2/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
> deleted file mode 100644
> index 5b1c108..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 8e8b2809b505486001dc213becab0d50bfd96c1b Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Tue, 16 Mar 2010 16:55:28 +0100
> -Subject: [PATCH 18/24] Generic C implementation of pixman_blt with overlapping support
> -
> -Uses memcpy/memmove functions to copy pixels, can handle the
> -case when both source and destination areas are in the same
> -image (this is useful for scrolling).
> -
> -It is assumed that copying direction is only important when
> -using the same image for both source and destination (and
> -src_stride == dst_stride). Copying direction is undefined
> -for the images with different source and destination stride
> -which happen to be in the overlapped areas (but this is an
> -unrealistic case anyway).
> ----
> - pixman/pixman-general.c |   21 ++++++++++++++++++---
> - pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 61 insertions(+), 3 deletions(-)
> -
> -diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
> -index 4d234a0..c4d2c14 100644
> ---- a/pixman/pixman-general.c
> -+++ b/pixman/pixman-general.c
> -@@ -280,9 +280,24 @@ general_blt (pixman_implementation_t *imp,
> -              int                      width,
> -              int                      height)
> - {
> --    /* We can't blit unless we have sse2 or mmx */
> --
> --    return FALSE;
> -+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
> -+    uint8_t *src_bytes = (uint8_t *)src_bits;
> -+    int bpp;
> -+
> -+    if (src_bpp != dst_bpp || src_bpp & 7)
> -+	return FALSE;
> -+
> -+    bpp = src_bpp >> 3;
> -+    width *= bpp;
> -+    src_stride *= 4;
> -+    dst_stride *= 4;
> -+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
> -+                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
> -+                       src_stride,
> -+                       dst_stride,
> -+                       width,
> -+                       height);
> -+    return TRUE;
> - }
> - 
> - static pixman_bool_t
> -diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
> -index 969dfab..352bceb 100644
> ---- a/pixman/pixman-private.h
> -+++ b/pixman/pixman-private.h
> -@@ -10,6 +10,7 @@
> - 
> - #include "pixman.h"
> - #include <time.h>
> -+#include <string.h>
> - #include <assert.h>
> - #include <stdio.h>
> - #include <string.h>
> -@@ -869,4 +870,46 @@ void pixman_timer_register (pixman_timer_t *timer);
> - 
> - #endif /* PIXMAN_TIMERS */
> - 
> -+/* a helper function, can blit 8-bit images with src/dst overlapping support */
> -+static inline void
> -+pixman_blt_helper (uint8_t *src_bytes,
> -+                   uint8_t *dst_bytes,
> -+                   int      src_stride,
> -+                   int      dst_stride,
> -+                   int      width,
> -+                   int      height)
> -+{
> -+    /*
> -+     * The second part of this check is not strictly needed, but it prevents
> -+     * unnecessary upside-down processing of areas which belong to different
> -+     * images. Upside-down processing can be slower with fixed-distance-ahead
> -+     * prefetch and perceived as having more tearing.
> -+     */
> -+    if (src_bytes < dst_bytes + width &&
> -+	src_bytes + src_stride * height > dst_bytes)
> -+    {
> -+	src_bytes += src_stride * height - src_stride;
> -+	dst_bytes += dst_stride * height - dst_stride;
> -+	dst_stride = -dst_stride;
> -+	src_stride = -src_stride;
> -+	/* Horizontal scrolling to the left needs memmove */
> -+	if (src_bytes + width > dst_bytes)
> -+	{
> -+	    while (--height >= 0)
> -+	    {
> -+		memmove (dst_bytes, src_bytes, width);
> -+		dst_bytes += dst_stride;
> -+		src_bytes += src_stride;
> -+	    }
> -+	    return;
> -+	}
> -+    }
> -+    while (--height >= 0)
> -+    {
> -+	memcpy (dst_bytes, src_bytes, width);
> -+	dst_bytes += dst_stride;
> -+	src_bytes += src_stride;
> -+    }
> -+}
> -+
> - #endif /* PIXMAN_PRIVATE_H */
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.21.2/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
> deleted file mode 100644
> index 5193d38..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From f5a54f7d5eb1169bc79f0e445e2998e98080ef13 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Thu, 22 Oct 2009 05:45:47 +0300
> -Subject: [PATCH 19/24] Support of overlapping src/dst for pixman_blt_mmx
> -
> ----
> - pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
> - 1 files changed, 32 insertions(+), 23 deletions(-)
> -
> -diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
> -index 34637a4..f9dd473 100644
> ---- a/pixman/pixman-mmx.c
> -+++ b/pixman/pixman-mmx.c
> -@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
> - {
> -     uint8_t *   src_bytes;
> -     uint8_t *   dst_bytes;
> --    int byte_width;
> -+    int         bpp;
> - 
> --    if (src_bpp != dst_bpp)
> -+    if (src_bpp != dst_bpp || src_bpp & 7)
> - 	return FALSE;
> - 
> --    if (src_bpp == 16)
> --    {
> --	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
> --	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
> --	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
> --	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> --	byte_width = 2 * width;
> --	src_stride *= 2;
> --	dst_stride *= 2;
> --    }
> --    else if (src_bpp == 32)
> -+    bpp = src_bpp >> 3;
> -+    width *= bpp;
> -+    src_stride *= 4;
> -+    dst_stride *= 4;
> -+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
> -+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
> -+
> -+    if (src_bpp != 16 && src_bpp != 32)
> -     {
> --	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
> --	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
> --	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
> --	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> --	byte_width = 4 * width;
> --	src_stride *= 4;
> --	dst_stride *= 4;
> -+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
> -+	                   width, height);
> -+	return TRUE;
> -     }
> --    else
> -+
> -+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
> -     {
> --	return FALSE;
> -+	src_bytes += src_stride * height - src_stride;
> -+	dst_bytes += dst_stride * height - dst_stride;
> -+	dst_stride = -dst_stride;
> -+	src_stride = -src_stride;
> -+
> -+	if (src_bytes + width > dst_bytes)
> -+	{
> -+	    /* TODO: reverse scanline copy using MMX */
> -+	    while (--height >= 0)
> -+	    {
> -+		memmove (dst_bytes, src_bytes, width);
> -+		dst_bytes += dst_stride;
> -+		src_bytes += src_stride;
> -+	    }
> -+	    return TRUE;
> -+	}
> -     }
> - 
> -     while (height--)
> -@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
> - 	uint8_t *d = dst_bytes;
> - 	src_bytes += src_stride;
> - 	dst_bytes += dst_stride;
> --	w = byte_width;
> -+	w = width;
> - 
> - 	while (w >= 2 && ((unsigned long)d & 3))
> - 	{
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.21.2/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
> deleted file mode 100644
> index f5c0e12..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From c8755294fa9ea396f7113370230b17c424a93be1 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Thu, 22 Oct 2009 05:45:54 +0300
> -Subject: [PATCH 20/24] Support of overlapping src/dst for pixman_blt_sse2
> -
> ----
> - pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
> - 1 files changed, 32 insertions(+), 23 deletions(-)
> -
> -diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
> -index 5907de0..25015ae 100644
> ---- a/pixman/pixman-sse2.c
> -+++ b/pixman/pixman-sse2.c
> -@@ -5027,34 +5027,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
> - {
> -     uint8_t *   src_bytes;
> -     uint8_t *   dst_bytes;
> --    int byte_width;
> -+    int         bpp;
> - 
> --    if (src_bpp != dst_bpp)
> -+    if (src_bpp != dst_bpp || src_bpp & 7)
> - 	return FALSE;
> - 
> --    if (src_bpp == 16)
> --    {
> --	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
> --	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
> --	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
> --	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> --	byte_width = 2 * width;
> --	src_stride *= 2;
> --	dst_stride *= 2;
> --    }
> --    else if (src_bpp == 32)
> -+    bpp = src_bpp >> 3;
> -+    width *= bpp;
> -+    src_stride *= 4;
> -+    dst_stride *= 4;
> -+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
> -+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
> -+
> -+    if (src_bpp != 16 && src_bpp != 32)
> -     {
> --	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
> --	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
> --	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
> --	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> --	byte_width = 4 * width;
> --	src_stride *= 4;
> --	dst_stride *= 4;
> -+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
> -+	                   width, height);
> -+	return TRUE;
> -     }
> --    else
> -+
> -+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
> -     {
> --	return FALSE;
> -+	src_bytes += src_stride * height - src_stride;
> -+	dst_bytes += dst_stride * height - dst_stride;
> -+	dst_stride = -dst_stride;
> -+	src_stride = -src_stride;
> -+
> -+	if (src_bytes + width > dst_bytes)
> -+	{
> -+	    /* TODO: reverse scanline copy using SSE2 */
> -+	    while (--height >= 0)
> -+	    {
> -+		memmove (dst_bytes, src_bytes, width);
> -+		dst_bytes += dst_stride;
> -+		src_bytes += src_stride;
> -+	    }
> -+	    return TRUE;
> -+	}
> -     }
> - 
> -     while (height--)
> -@@ -5064,7 +5073,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
> - 	uint8_t *d = dst_bytes;
> - 	src_bytes += src_stride;
> - 	dst_bytes += dst_stride;
> --	w = byte_width;
> -+	w = width;
> - 
> - 	while (w >= 2 && ((unsigned long)d & 3))
> - 	{
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.21.2/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
> deleted file mode 100644
> index 0eb9d88..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From 86c8198598ef6d639e656c04644015795cc249aa Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Wed, 18 Nov 2009 06:08:48 +0200
> -Subject: [PATCH 21/24] Support of overlapping src/dst for pixman_blt_neon
> -
> ----
> - pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
> - 1 files changed, 51 insertions(+), 11 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index e3eca2b..74316a8 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -199,26 +199,66 @@ pixman_blt_neon (uint32_t *src_bits,
> -                  int       width,
> -                  int       height)
> - {
> --    if (src_bpp != dst_bpp)
> -+    uint8_t *   src_bytes;
> -+    uint8_t *   dst_bytes;
> -+    int         bpp;
> -+
> -+    if (src_bpp != dst_bpp || src_bpp & 7)
> - 	return FALSE;
> - 
> -+    bpp = src_bpp >> 3;
> -+    width *= bpp;
> -+    src_stride *= 4;
> -+    dst_stride *= 4;
> -+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
> -+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
> -+
> -+    if (src_bpp != 16 && src_bpp != 32)
> -+    {
> -+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
> -+	                   width, height);
> -+	return TRUE;
> -+    }
> -+
> -+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
> -+    {
> -+	src_bytes += src_stride * height - src_stride;
> -+	dst_bytes += dst_stride * height - dst_stride;
> -+	dst_stride = -dst_stride;
> -+	src_stride = -src_stride;
> -+
> -+	if (src_bytes + width > dst_bytes)
> -+	{
> -+	    /* TODO: reverse scanline copy using NEON */
> -+	    while (--height >= 0)
> -+	    {
> -+		memmove (dst_bytes, src_bytes, width);
> -+		dst_bytes += dst_stride;
> -+		src_bytes += src_stride;
> -+	    }
> -+	    return TRUE;
> -+	}
> -+    }
> -+
> -     switch (src_bpp)
> -     {
> -     case 16:
> - 	pixman_composite_src_0565_0565_asm_neon (
> --		width, height,
> --		(uint16_t *)(((char *) dst_bits) +
> --		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
> --		(uint16_t *)(((char *) src_bits) +
> --		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
> -+		width >> 1,
> -+		height,
> -+		(uint16_t *) dst_bytes,
> -+		dst_stride >> 1,
> -+		(uint16_t *) src_bytes,
> -+		src_stride >> 1);
> - 	return TRUE;
> -     case 32:
> - 	pixman_composite_src_8888_8888_asm_neon (
> --		width, height,
> --		(uint32_t *)(((char *) dst_bits) +
> --		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
> --		(uint32_t *)(((char *) src_bits) +
> --		src_y * src_stride * 4 + src_x * 4), src_stride);
> -+		width >> 2,
> -+		height,
> -+		(uint32_t *) dst_bytes,
> -+		dst_stride >> 2,
> -+		(uint32_t *) src_bytes,
> -+		src_stride >> 2);
> - 	return TRUE;
> -     default:
> - 	return FALSE;
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman-0.21.2/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
> deleted file mode 100644
> index 129c1f1..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -From 60d972afbae8613d700d3a6b3cb107429d7e11c6 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Thu, 10 Dec 2009 00:51:50 +0200
> -Subject: [PATCH 22/24] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |   40 ++++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 60 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index cf014fa..25f7bf0 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -459,6 +459,16 @@ generate_composite_function \
> -     pixman_composite_src_8888_0565_process_pixblock_tail, \
> -     pixman_composite_src_8888_0565_process_pixblock_tail_head
> - 
> -+generate_composite_function_single_scanline \
> -+    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
> -+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    default_init, \
> -+    default_cleanup, \
> -+    pixman_composite_src_8888_0565_process_pixblock_head, \
> -+    pixman_composite_src_8888_0565_process_pixblock_tail, \
> -+    pixman_composite_src_8888_0565_process_pixblock_tail_head
> -+
> - /******************************************************************************/
> - 
> - .macro pixman_composite_src_0565_8888_process_pixblock_head
> -@@ -494,6 +504,16 @@ generate_composite_function \
> -     pixman_composite_src_0565_8888_process_pixblock_tail, \
> -     pixman_composite_src_0565_8888_process_pixblock_tail_head
> - 
> -+generate_composite_function_single_scanline \
> -+    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
> -+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    default_init, \
> -+    default_cleanup, \
> -+    pixman_composite_src_0565_8888_process_pixblock_head, \
> -+    pixman_composite_src_0565_8888_process_pixblock_tail, \
> -+    pixman_composite_src_0565_8888_process_pixblock_tail_head
> -+
> - /******************************************************************************/
> - 
> - .macro pixman_composite_add_8_8_process_pixblock_head
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 74316a8..f773e92 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -448,6 +448,42 @@ BIND_COMBINE_U (over)
> - BIND_COMBINE_U (add)
> - BIND_COMBINE_U (out_reverse)
> - 
> -+void
> -+pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
> -+                                       uint32_t       *buffer,
> -+                                       const uint16_t *pixel);
> -+void
> -+pixman_store_scanline_r5g6b5_asm_neon (int             width,
> -+                                       uint16_t       *pixel,
> -+                                       const uint32_t *values);
> -+
> -+static void
> -+neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
> -+                            int             x,
> -+                            int             y,
> -+                            int             width,
> -+                            uint32_t *      buffer,
> -+                            const uint32_t *mask)
> -+{
> -+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
> -+    const uint16_t *pixel = (const uint16_t *)bits + x;
> -+
> -+    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
> -+}
> -+
> -+static void
> -+neon_store_scanline_r5g6b5 (bits_image_t *  image,
> -+                            int             x,
> -+                            int             y,
> -+                            int             width,
> -+                            const uint32_t *values)
> -+{
> -+    uint32_t *bits = image->bits + image->rowstride * y;
> -+    uint16_t *pixel = ((uint16_t *) bits) + x;
> -+
> -+    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
> -+}
> -+
> - pixman_implementation_t *
> - _pixman_implementation_create_arm_neon (void)
> - {
> -@@ -463,6 +499,10 @@ _pixman_implementation_create_arm_neon (void)
> -     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
> -     imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
> - 
> -+    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
> -+                                     neon_fetch_scanline_r5g6b5,
> -+                                     neon_store_scanline_r5g6b5);
> -+
> -     imp->blt = arm_neon_blt;
> -     imp->fill = arm_neon_fill;
> - 
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch b/recipes/xorg-lib/pixman-0.21.2/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
> deleted file mode 100644
> index 7724f54..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -From cc99d8d6fcbabd7f9f3ed99e65c78a2fb71792fa Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Thu, 23 Sep 2010 21:10:56 +0300
> -Subject: [PATCH 23/24] ARM: added NEON optimizations for fetch/store a8 scanline
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   64 ++++++++++++++++++++++++++++++++++++++++++
> - pixman/pixman-arm-neon.c     |   42 +++++++++++++++++++++++++++
> - 2 files changed, 106 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 25f7bf0..439b06b 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -418,6 +418,70 @@ generate_composite_function \
> - 
> - /******************************************************************************/
> - 
> -+.macro pixman_composite_src_8_8888_process_pixblock_head
> -+    /* This is tricky part: we can't set these values just once in 'init' macro
> -+     * because leading/trailing pixels handling part uses VZIP.8 instructions,
> -+     * and they operate on values in-place and destroy original registers
> -+     * content. Think about it like VST4.8 instruction corrupting NEON
> -+     * registers after write in 'tail_head' macro. Except that 'tail_head'
> -+     * macro itself actually does not need these extra VMOVs because it uses
> -+     * real VST4.8 instruction.
> -+     */
> -+    vmov.u8     q0, #0
> -+    vmov.u8     d2, #0
> -+.endm
> -+
> -+.macro pixman_composite_src_8_8888_process_pixblock_tail
> -+.endm
> -+
> -+.macro pixman_composite_src_8_8888_process_pixblock_tail_head
> -+    vst4.8      {d0, d1, d2, d3}, [DST_W, :128]!
> -+    vld1.8      {d3}, [SRC]!
> -+.endm
> -+
> -+generate_composite_function_single_scanline \
> -+    pixman_fetch_scanline_a8_asm_neon, 8, 0, 32, \
> -+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    default_init, \
> -+    default_cleanup, \
> -+    pixman_composite_src_8_8888_process_pixblock_head, \
> -+    pixman_composite_src_8_8888_process_pixblock_tail, \
> -+    pixman_composite_src_8_8888_process_pixblock_tail_head, \
> -+    0,  /* dst_w_basereg */ \
> -+    0,  /* dst_r_basereg */ \
> -+    3,  /* src_basereg   */ \
> -+    0   /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> -+.macro pixman_composite_src_8888_8_process_pixblock_head
> -+.endm
> -+
> -+.macro pixman_composite_src_8888_8_process_pixblock_tail
> -+.endm
> -+
> -+.macro pixman_composite_src_8888_8_process_pixblock_tail_head
> -+    vst1.8      {d3}, [DST_W, :64]!
> -+    vld4.8      {d0, d1, d2, d3}, [SRC]!
> -+.endm
> -+
> -+generate_composite_function_single_scanline \
> -+    pixman_store_scanline_a8_asm_neon, 32, 0, 8, \
> -+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    default_init, \
> -+    default_cleanup, \
> -+    pixman_composite_src_8888_8_process_pixblock_head, \
> -+    pixman_composite_src_8888_8_process_pixblock_tail, \
> -+    pixman_composite_src_8888_8_process_pixblock_tail_head, \
> -+    3,  /* dst_w_basereg */ \
> -+    0,  /* dst_r_basereg */ \
> -+    0,  /* src_basereg   */ \
> -+    0   /* mask_basereg  */
> -+
> -+/******************************************************************************/
> -+
> - .macro pixman_composite_src_8888_0565_process_pixblock_head
> -     vshll.u8    q8, d1, #8
> -     vshll.u8    q14, d2, #8
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index f773e92..55219b3 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -484,6 +484,45 @@ neon_store_scanline_r5g6b5 (bits_image_t *  image,
> -     pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
> - }
> - 
> -+void
> -+pixman_fetch_scanline_a8_asm_neon (int             width,
> -+                                   uint32_t       *buffer,
> -+                                   const uint8_t  *pixel);
> -+
> -+
> -+void
> -+pixman_store_scanline_a8_asm_neon (int             width,
> -+                                   uint8_t        *pixel,
> -+                                   const uint32_t *values);
> -+
> -+static void
> -+neon_fetch_scanline_a8 (pixman_image_t *image,
> -+                        int             x,
> -+                        int             y,
> -+                        int             width,
> -+                        uint32_t *      buffer,
> -+                        const uint32_t *mask)
> -+{
> -+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
> -+    const uint8_t *pixel = (const uint8_t *) bits + x;
> -+
> -+    pixman_fetch_scanline_a8_asm_neon (width, buffer, pixel);
> -+}
> -+
> -+static void
> -+neon_store_scanline_a8 (bits_image_t *  image,
> -+                        int             x,
> -+                        int             y,
> -+                        int             width,
> -+                        const uint32_t *values)
> -+{
> -+    uint32_t *bits = image->bits + image->rowstride * y;
> -+    uint8_t *pixel = (uint8_t *) bits + x;
> -+
> -+    pixman_store_scanline_a8_asm_neon (width, pixel, values);
> -+}
> -+
> -+
> - pixman_implementation_t *
> - _pixman_implementation_create_arm_neon (void)
> - {
> -@@ -502,6 +541,9 @@ _pixman_implementation_create_arm_neon (void)
> -     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
> -                                      neon_fetch_scanline_r5g6b5,
> -                                      neon_store_scanline_r5g6b5);
> -+    _pixman_bits_override_accessors (PIXMAN_a8,
> -+                                     neon_fetch_scanline_a8,
> -+                                     neon_store_scanline_a8);
> - 
> -     imp->blt = arm_neon_blt;
> -     imp->fill = arm_neon_fill;
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.2/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch b/recipes/xorg-lib/pixman-0.21.2/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
> deleted file mode 100644
> index 8253f41..0000000
> --- a/recipes/xorg-lib/pixman-0.21.2/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From cf3b8fdc53144ff62c4054996559d3a1a4d62b75 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Fri, 24 Sep 2010 18:22:44 +0300
> -Subject: [PATCH 24/24] ARM: added NEON optimizations for fetching x8r8g8b8 scanline
> -
> ----
> - pixman/pixman-arm-neon-asm.S |   14 ++++++++++++++
> - pixman/pixman-arm-neon.c     |   21 +++++++++++++++++++++
> - 2 files changed, 35 insertions(+), 0 deletions(-)
> -
> -diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> -index 439b06b..3e0dcfe 100644
> ---- a/pixman/pixman-arm-neon-asm.S
> -+++ b/pixman/pixman-arm-neon-asm.S
> -@@ -1257,6 +1257,20 @@ generate_composite_function \
> -     0, /* src_basereg   */ \
> -     0  /* mask_basereg  */
> - 
> -+generate_composite_function_single_scanline \
> -+    pixman_fetch_scanline_x888_asm_neon, 32, 0, 32, \
> -+    FLAG_DST_WRITEONLY, \
> -+    8, /* number of pixels, processed in a single block */ \
> -+    pixman_composite_src_x888_8888_init, \
> -+    default_cleanup, \
> -+    pixman_composite_src_x888_8888_process_pixblock_head, \
> -+    pixman_composite_src_x888_8888_process_pixblock_tail, \
> -+    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
> -+    0,  /* dst_w_basereg */ \
> -+    0,  /* dst_r_basereg */ \
> -+    0,  /* src_basereg   */ \
> -+    0   /* mask_basereg  */
> -+
> - /******************************************************************************/
> - 
> - .macro pixman_composite_over_n_8_8888_process_pixblock_head
> -diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> -index 55219b3..8cef414 100644
> ---- a/pixman/pixman-arm-neon.c
> -+++ b/pixman/pixman-arm-neon.c
> -@@ -522,6 +522,24 @@ neon_store_scanline_a8 (bits_image_t *  image,
> -     pixman_store_scanline_a8_asm_neon (width, pixel, values);
> - }
> - 
> -+void
> -+pixman_fetch_scanline_x888_asm_neon (int             width,
> -+                                     uint32_t       *buffer,
> -+                                     const uint32_t *pixel);
> -+
> -+static void
> -+neon_fetch_scanline_x888 (pixman_image_t *image,
> -+                          int             x,
> -+                          int             y,
> -+                          int             width,
> -+                          uint32_t *      buffer,
> -+                          const uint32_t *mask)
> -+{
> -+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
> -+    const uint32_t *pixel = (const uint32_t *) bits + x;
> -+
> -+    pixman_fetch_scanline_x888_asm_neon (width, buffer, pixel);
> -+}
> - 
> - pixman_implementation_t *
> - _pixman_implementation_create_arm_neon (void)
> -@@ -544,6 +562,9 @@ _pixman_implementation_create_arm_neon (void)
> -     _pixman_bits_override_accessors (PIXMAN_a8,
> -                                      neon_fetch_scanline_a8,
> -                                      neon_store_scanline_a8);
> -+    _pixman_bits_override_accessors (PIXMAN_x8r8g8b8,
> -+                                     neon_fetch_scanline_x888,
> -+                                     NULL);
> - 
> -     imp->blt = arm_neon_blt;
> -     imp->fill = arm_neon_fill;
> --- 
> -1.6.6.1
> -
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0017-add-_pixman_bits_override_accessors.patch b/recipes/xorg-lib/pixman-0.21.4/0017-add-_pixman_bits_override_accessors.patch
> new file mode 100644
> index 0000000..b7983b2
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0017-add-_pixman_bits_override_accessors.patch
> @@ -0,0 +1,75 @@
> +From 6593d86679fde724e49efa96b16ca22d9521b288 Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Thu, 10 Dec 2009 00:51:50 +0200
> +Subject: [PATCH 17/24] add _pixman_bits_override_accessors
> +
> +* from patch ARM: HACK: added NEON optimizations for fetch/store r5g6b5 scanline
> +* used in
> +  0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
> +  0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
> +  0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
> +---
> + pixman/pixman-access.c  |   23 ++++++++++++++++++++++-
> + pixman/pixman-private.h |    5 +++++
> + 2 files changed, 27 insertions(+), 1 deletions(-)
> +
> +diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
> +index f1ce0ba..b33da29 100644
> +--- a/pixman/pixman-access.c
> ++++ b/pixman/pixman-access.c
> +@@ -2836,7 +2836,7 @@ typedef struct
> + 	    store_scanline_ ## format, store_scanline_generic_64	\
> +     }
> + 
> +-static const format_info_t accessors[] =
> ++static format_info_t accessors[] =
> + {
> + /* 32 bpp formats */
> +     FORMAT_INFO (a8r8g8b8),
> +@@ -2978,6 +2978,27 @@ _pixman_bits_image_setup_accessors (bits_image_t *image)
> + 	setup_accessors (image);
> + }
> + 
> ++void
> ++_pixman_bits_override_accessors (pixman_format_code_t format,
> ++                                 fetch_scanline_t     fetch_func,
> ++                                 store_scanline_t     store_func)
> ++{
> ++    format_info_t *info = accessors;
> ++
> ++    while (info->format != PIXMAN_null)
> ++    {
> ++	if (info->format == format)
> ++	{
> ++	    if (fetch_func)
> ++		info->fetch_scanline_32 = fetch_func;
> ++	    if (store_func)
> ++		info->store_scanline_32 = store_func;
> ++	    return;
> ++	}
> ++	info++;
> ++    }
> ++}
> ++
> + #else
> + 
> + void
> +diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
> +index 1662d2c..c0f9af4 100644
> +--- a/pixman/pixman-private.h
> ++++ b/pixman/pixman-private.h
> +@@ -256,6 +256,11 @@ _pixman_conical_gradient_iter_init (pixman_image_t *image,
> + 				    int x, int y, int width, int height,
> + 				    uint8_t *buffer, iter_flags_t flags);
> + 
> ++void
> ++_pixman_bits_override_accessors (pixman_format_code_t format,
> ++				 fetch_scanline_t     fetch_func,
> ++				 store_scanline_t     store_func);
> ++
> + pixman_image_t *
> + _pixman_image_allocate (void);
> + 
> +-- 
> +1.7.4.rc2
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.21.4/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
> new file mode 100644
> index 0000000..5b1c108
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
> @@ -0,0 +1,114 @@
> +From 8e8b2809b505486001dc213becab0d50bfd96c1b Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Tue, 16 Mar 2010 16:55:28 +0100
> +Subject: [PATCH 18/24] Generic C implementation of pixman_blt with overlapping support
> +
> +Uses memcpy/memmove functions to copy pixels, can handle the
> +case when both source and destination areas are in the same
> +image (this is useful for scrolling).
> +
> +It is assumed that copying direction is only important when
> +using the same image for both source and destination (and
> +src_stride == dst_stride). Copying direction is undefined
> +for the images with different source and destination stride
> +which happen to be in the overlapped areas (but this is an
> +unrealistic case anyway).
> +---
> + pixman/pixman-general.c |   21 ++++++++++++++++++---
> + pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 61 insertions(+), 3 deletions(-)
> +
> +diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
> +index 4d234a0..c4d2c14 100644
> +--- a/pixman/pixman-general.c
> ++++ b/pixman/pixman-general.c
> +@@ -280,9 +280,24 @@ general_blt (pixman_implementation_t *imp,
> +              int                      width,
> +              int                      height)
> + {
> +-    /* We can't blit unless we have sse2 or mmx */
> +-
> +-    return FALSE;
> ++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
> ++    uint8_t *src_bytes = (uint8_t *)src_bits;
> ++    int bpp;
> ++
> ++    if (src_bpp != dst_bpp || src_bpp & 7)
> ++	return FALSE;
> ++
> ++    bpp = src_bpp >> 3;
> ++    width *= bpp;
> ++    src_stride *= 4;
> ++    dst_stride *= 4;
> ++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
> ++                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
> ++                       src_stride,
> ++                       dst_stride,
> ++                       width,
> ++                       height);
> ++    return TRUE;
> + }
> + 
> + static pixman_bool_t
> +diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
> +index 969dfab..352bceb 100644
> +--- a/pixman/pixman-private.h
> ++++ b/pixman/pixman-private.h
> +@@ -10,6 +10,7 @@
> + 
> + #include "pixman.h"
> + #include <time.h>
> ++#include <string.h>
> + #include <assert.h>
> + #include <stdio.h>
> + #include <string.h>
> +@@ -869,4 +870,46 @@ void pixman_timer_register (pixman_timer_t *timer);
> + 
> + #endif /* PIXMAN_TIMERS */
> + 
> ++/* a helper function, can blit 8-bit images with src/dst overlapping support */
> ++static inline void
> ++pixman_blt_helper (uint8_t *src_bytes,
> ++                   uint8_t *dst_bytes,
> ++                   int      src_stride,
> ++                   int      dst_stride,
> ++                   int      width,
> ++                   int      height)
> ++{
> ++    /*
> ++     * The second part of this check is not strictly needed, but it prevents
> ++     * unnecessary upside-down processing of areas which belong to different
> ++     * images. Upside-down processing can be slower with fixed-distance-ahead
> ++     * prefetch and perceived as having more tearing.
> ++     */
> ++    if (src_bytes < dst_bytes + width &&
> ++	src_bytes + src_stride * height > dst_bytes)
> ++    {
> ++	src_bytes += src_stride * height - src_stride;
> ++	dst_bytes += dst_stride * height - dst_stride;
> ++	dst_stride = -dst_stride;
> ++	src_stride = -src_stride;
> ++	/* Horizontal scrolling to the left needs memmove */
> ++	if (src_bytes + width > dst_bytes)
> ++	{
> ++	    while (--height >= 0)
> ++	    {
> ++		memmove (dst_bytes, src_bytes, width);
> ++		dst_bytes += dst_stride;
> ++		src_bytes += src_stride;
> ++	    }
> ++	    return;
> ++	}
> ++    }
> ++    while (--height >= 0)
> ++    {
> ++	memcpy (dst_bytes, src_bytes, width);
> ++	dst_bytes += dst_stride;
> ++	src_bytes += src_stride;
> ++    }
> ++}
> ++
> + #endif /* PIXMAN_PRIVATE_H */
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.21.4/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
> new file mode 100644
> index 0000000..5193d38
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
> @@ -0,0 +1,91 @@
> +From f5a54f7d5eb1169bc79f0e445e2998e98080ef13 Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Thu, 22 Oct 2009 05:45:47 +0300
> +Subject: [PATCH 19/24] Support of overlapping src/dst for pixman_blt_mmx
> +
> +---
> + pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
> + 1 files changed, 32 insertions(+), 23 deletions(-)
> +
> +diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
> +index 34637a4..f9dd473 100644
> +--- a/pixman/pixman-mmx.c
> ++++ b/pixman/pixman-mmx.c
> +@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
> + {
> +     uint8_t *   src_bytes;
> +     uint8_t *   dst_bytes;
> +-    int byte_width;
> ++    int         bpp;
> + 
> +-    if (src_bpp != dst_bpp)
> ++    if (src_bpp != dst_bpp || src_bpp & 7)
> + 	return FALSE;
> + 
> +-    if (src_bpp == 16)
> +-    {
> +-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
> +-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
> +-	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
> +-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> +-	byte_width = 2 * width;
> +-	src_stride *= 2;
> +-	dst_stride *= 2;
> +-    }
> +-    else if (src_bpp == 32)
> ++    bpp = src_bpp >> 3;
> ++    width *= bpp;
> ++    src_stride *= 4;
> ++    dst_stride *= 4;
> ++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
> ++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
> ++
> ++    if (src_bpp != 16 && src_bpp != 32)
> +     {
> +-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
> +-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
> +-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
> +-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> +-	byte_width = 4 * width;
> +-	src_stride *= 4;
> +-	dst_stride *= 4;
> ++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
> ++	                   width, height);
> ++	return TRUE;
> +     }
> +-    else
> ++
> ++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
> +     {
> +-	return FALSE;
> ++	src_bytes += src_stride * height - src_stride;
> ++	dst_bytes += dst_stride * height - dst_stride;
> ++	dst_stride = -dst_stride;
> ++	src_stride = -src_stride;
> ++
> ++	if (src_bytes + width > dst_bytes)
> ++	{
> ++	    /* TODO: reverse scanline copy using MMX */
> ++	    while (--height >= 0)
> ++	    {
> ++		memmove (dst_bytes, src_bytes, width);
> ++		dst_bytes += dst_stride;
> ++		src_bytes += src_stride;
> ++	    }
> ++	    return TRUE;
> ++	}
> +     }
> + 
> +     while (height--)
> +@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
> + 	uint8_t *d = dst_bytes;
> + 	src_bytes += src_stride;
> + 	dst_bytes += dst_stride;
> +-	w = byte_width;
> ++	w = width;
> + 
> + 	while (w >= 2 && ((unsigned long)d & 3))
> + 	{
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.21.4/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
> new file mode 100644
> index 0000000..f5c0e12
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
> @@ -0,0 +1,91 @@
> +From c8755294fa9ea396f7113370230b17c424a93be1 Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Thu, 22 Oct 2009 05:45:54 +0300
> +Subject: [PATCH 20/24] Support of overlapping src/dst for pixman_blt_sse2
> +
> +---
> + pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
> + 1 files changed, 32 insertions(+), 23 deletions(-)
> +
> +diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
> +index 5907de0..25015ae 100644
> +--- a/pixman/pixman-sse2.c
> ++++ b/pixman/pixman-sse2.c
> +@@ -5027,34 +5027,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
> + {
> +     uint8_t *   src_bytes;
> +     uint8_t *   dst_bytes;
> +-    int byte_width;
> ++    int         bpp;
> + 
> +-    if (src_bpp != dst_bpp)
> ++    if (src_bpp != dst_bpp || src_bpp & 7)
> + 	return FALSE;
> + 
> +-    if (src_bpp == 16)
> +-    {
> +-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
> +-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
> +-	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
> +-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> +-	byte_width = 2 * width;
> +-	src_stride *= 2;
> +-	dst_stride *= 2;
> +-    }
> +-    else if (src_bpp == 32)
> ++    bpp = src_bpp >> 3;
> ++    width *= bpp;
> ++    src_stride *= 4;
> ++    dst_stride *= 4;
> ++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
> ++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
> ++
> ++    if (src_bpp != 16 && src_bpp != 32)
> +     {
> +-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
> +-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
> +-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
> +-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
> +-	byte_width = 4 * width;
> +-	src_stride *= 4;
> +-	dst_stride *= 4;
> ++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
> ++	                   width, height);
> ++	return TRUE;
> +     }
> +-    else
> ++
> ++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
> +     {
> +-	return FALSE;
> ++	src_bytes += src_stride * height - src_stride;
> ++	dst_bytes += dst_stride * height - dst_stride;
> ++	dst_stride = -dst_stride;
> ++	src_stride = -src_stride;
> ++
> ++	if (src_bytes + width > dst_bytes)
> ++	{
> ++	    /* TODO: reverse scanline copy using SSE2 */
> ++	    while (--height >= 0)
> ++	    {
> ++		memmove (dst_bytes, src_bytes, width);
> ++		dst_bytes += dst_stride;
> ++		src_bytes += src_stride;
> ++	    }
> ++	    return TRUE;
> ++	}
> +     }
> + 
> +     while (height--)
> +@@ -5064,7 +5073,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
> + 	uint8_t *d = dst_bytes;
> + 	src_bytes += src_stride;
> + 	dst_bytes += dst_stride;
> +-	w = byte_width;
> ++	w = width;
> + 
> + 	while (w >= 2 && ((unsigned long)d & 3))
> + 	{
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.21.4/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
> new file mode 100644
> index 0000000..0eb9d88
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
> @@ -0,0 +1,94 @@
> +From 86c8198598ef6d639e656c04644015795cc249aa Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Wed, 18 Nov 2009 06:08:48 +0200
> +Subject: [PATCH 21/24] Support of overlapping src/dst for pixman_blt_neon
> +
> +---
> + pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
> + 1 files changed, 51 insertions(+), 11 deletions(-)
> +
> +diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> +index e3eca2b..74316a8 100644
> +--- a/pixman/pixman-arm-neon.c
> ++++ b/pixman/pixman-arm-neon.c
> +@@ -199,26 +199,66 @@ pixman_blt_neon (uint32_t *src_bits,
> +                  int       width,
> +                  int       height)
> + {
> +-    if (src_bpp != dst_bpp)
> ++    uint8_t *   src_bytes;
> ++    uint8_t *   dst_bytes;
> ++    int         bpp;
> ++
> ++    if (src_bpp != dst_bpp || src_bpp & 7)
> + 	return FALSE;
> + 
> ++    bpp = src_bpp >> 3;
> ++    width *= bpp;
> ++    src_stride *= 4;
> ++    dst_stride *= 4;
> ++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
> ++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
> ++
> ++    if (src_bpp != 16 && src_bpp != 32)
> ++    {
> ++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
> ++	                   width, height);
> ++	return TRUE;
> ++    }
> ++
> ++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
> ++    {
> ++	src_bytes += src_stride * height - src_stride;
> ++	dst_bytes += dst_stride * height - dst_stride;
> ++	dst_stride = -dst_stride;
> ++	src_stride = -src_stride;
> ++
> ++	if (src_bytes + width > dst_bytes)
> ++	{
> ++	    /* TODO: reverse scanline copy using NEON */
> ++	    while (--height >= 0)
> ++	    {
> ++		memmove (dst_bytes, src_bytes, width);
> ++		dst_bytes += dst_stride;
> ++		src_bytes += src_stride;
> ++	    }
> ++	    return TRUE;
> ++	}
> ++    }
> ++
> +     switch (src_bpp)
> +     {
> +     case 16:
> + 	pixman_composite_src_0565_0565_asm_neon (
> +-		width, height,
> +-		(uint16_t *)(((char *) dst_bits) +
> +-		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
> +-		(uint16_t *)(((char *) src_bits) +
> +-		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
> ++		width >> 1,
> ++		height,
> ++		(uint16_t *) dst_bytes,
> ++		dst_stride >> 1,
> ++		(uint16_t *) src_bytes,
> ++		src_stride >> 1);
> + 	return TRUE;
> +     case 32:
> + 	pixman_composite_src_8888_8888_asm_neon (
> +-		width, height,
> +-		(uint32_t *)(((char *) dst_bits) +
> +-		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
> +-		(uint32_t *)(((char *) src_bits) +
> +-		src_y * src_stride * 4 + src_x * 4), src_stride);
> ++		width >> 2,
> ++		height,
> ++		(uint32_t *) dst_bytes,
> ++		dst_stride >> 2,
> ++		(uint32_t *) src_bytes,
> ++		src_stride >> 2);
> + 	return TRUE;
> +     default:
> + 	return FALSE;
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman-0.21.4/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
> new file mode 100644
> index 0000000..129c1f1
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
> @@ -0,0 +1,109 @@
> +From 60d972afbae8613d700d3a6b3cb107429d7e11c6 Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Thu, 10 Dec 2009 00:51:50 +0200
> +Subject: [PATCH 22/24] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
> +
> +---
> + pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
> + pixman/pixman-arm-neon.c     |   40 ++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 60 insertions(+), 0 deletions(-)
> +
> +diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> +index cf014fa..25f7bf0 100644
> +--- a/pixman/pixman-arm-neon-asm.S
> ++++ b/pixman/pixman-arm-neon-asm.S
> +@@ -459,6 +459,16 @@ generate_composite_function \
> +     pixman_composite_src_8888_0565_process_pixblock_tail, \
> +     pixman_composite_src_8888_0565_process_pixblock_tail_head
> + 
> ++generate_composite_function_single_scanline \
> ++    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
> ++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> ++    8, /* number of pixels, processed in a single block */ \
> ++    default_init, \
> ++    default_cleanup, \
> ++    pixman_composite_src_8888_0565_process_pixblock_head, \
> ++    pixman_composite_src_8888_0565_process_pixblock_tail, \
> ++    pixman_composite_src_8888_0565_process_pixblock_tail_head
> ++
> + /******************************************************************************/
> + 
> + .macro pixman_composite_src_0565_8888_process_pixblock_head
> +@@ -494,6 +504,16 @@ generate_composite_function \
> +     pixman_composite_src_0565_8888_process_pixblock_tail, \
> +     pixman_composite_src_0565_8888_process_pixblock_tail_head
> + 
> ++generate_composite_function_single_scanline \
> ++    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
> ++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> ++    8, /* number of pixels, processed in a single block */ \
> ++    default_init, \
> ++    default_cleanup, \
> ++    pixman_composite_src_0565_8888_process_pixblock_head, \
> ++    pixman_composite_src_0565_8888_process_pixblock_tail, \
> ++    pixman_composite_src_0565_8888_process_pixblock_tail_head
> ++
> + /******************************************************************************/
> + 
> + .macro pixman_composite_add_8_8_process_pixblock_head
> +diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> +index 74316a8..f773e92 100644
> +--- a/pixman/pixman-arm-neon.c
> ++++ b/pixman/pixman-arm-neon.c
> +@@ -448,6 +448,42 @@ BIND_COMBINE_U (over)
> + BIND_COMBINE_U (add)
> + BIND_COMBINE_U (out_reverse)
> + 
> ++void
> ++pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
> ++                                       uint32_t       *buffer,
> ++                                       const uint16_t *pixel);
> ++void
> ++pixman_store_scanline_r5g6b5_asm_neon (int             width,
> ++                                       uint16_t       *pixel,
> ++                                       const uint32_t *values);
> ++
> ++static void
> ++neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
> ++                            int             x,
> ++                            int             y,
> ++                            int             width,
> ++                            uint32_t *      buffer,
> ++                            const uint32_t *mask)
> ++{
> ++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
> ++    const uint16_t *pixel = (const uint16_t *)bits + x;
> ++
> ++    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
> ++}
> ++
> ++static void
> ++neon_store_scanline_r5g6b5 (bits_image_t *  image,
> ++                            int             x,
> ++                            int             y,
> ++                            int             width,
> ++                            const uint32_t *values)
> ++{
> ++    uint32_t *bits = image->bits + image->rowstride * y;
> ++    uint16_t *pixel = ((uint16_t *) bits) + x;
> ++
> ++    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
> ++}
> ++
> + pixman_implementation_t *
> + _pixman_implementation_create_arm_neon (void)
> + {
> +@@ -463,6 +499,10 @@ _pixman_implementation_create_arm_neon (void)
> +     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
> +     imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
> + 
> ++    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
> ++                                     neon_fetch_scanline_r5g6b5,
> ++                                     neon_store_scanline_r5g6b5);
> ++
> +     imp->blt = arm_neon_blt;
> +     imp->fill = arm_neon_fill;
> + 
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch b/recipes/xorg-lib/pixman-0.21.4/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
> new file mode 100644
> index 0000000..7724f54
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
> @@ -0,0 +1,148 @@
> +From cc99d8d6fcbabd7f9f3ed99e65c78a2fb71792fa Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Thu, 23 Sep 2010 21:10:56 +0300
> +Subject: [PATCH 23/24] ARM: added NEON optimizations for fetch/store a8 scanline
> +
> +---
> + pixman/pixman-arm-neon-asm.S |   64 ++++++++++++++++++++++++++++++++++++++++++
> + pixman/pixman-arm-neon.c     |   42 +++++++++++++++++++++++++++
> + 2 files changed, 106 insertions(+), 0 deletions(-)
> +
> +diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> +index 25f7bf0..439b06b 100644
> +--- a/pixman/pixman-arm-neon-asm.S
> ++++ b/pixman/pixman-arm-neon-asm.S
> +@@ -418,6 +418,70 @@ generate_composite_function \
> + 
> + /******************************************************************************/
> + 
> ++.macro pixman_composite_src_8_8888_process_pixblock_head
> ++    /* This is tricky part: we can't set these values just once in 'init' macro
> ++     * because leading/trailing pixels handling part uses VZIP.8 instructions,
> ++     * and they operate on values in-place and destroy original registers
> ++     * content. Think about it like VST4.8 instruction corrupting NEON
> ++     * registers after write in 'tail_head' macro. Except that 'tail_head'
> ++     * macro itself actually does not need these extra VMOVs because it uses
> ++     * real VST4.8 instruction.
> ++     */
> ++    vmov.u8     q0, #0
> ++    vmov.u8     d2, #0
> ++.endm
> ++
> ++.macro pixman_composite_src_8_8888_process_pixblock_tail
> ++.endm
> ++
> ++.macro pixman_composite_src_8_8888_process_pixblock_tail_head
> ++    vst4.8      {d0, d1, d2, d3}, [DST_W, :128]!
> ++    vld1.8      {d3}, [SRC]!
> ++.endm
> ++
> ++generate_composite_function_single_scanline \
> ++    pixman_fetch_scanline_a8_asm_neon, 8, 0, 32, \
> ++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> ++    8, /* number of pixels, processed in a single block */ \
> ++    default_init, \
> ++    default_cleanup, \
> ++    pixman_composite_src_8_8888_process_pixblock_head, \
> ++    pixman_composite_src_8_8888_process_pixblock_tail, \
> ++    pixman_composite_src_8_8888_process_pixblock_tail_head, \
> ++    0,  /* dst_w_basereg */ \
> ++    0,  /* dst_r_basereg */ \
> ++    3,  /* src_basereg   */ \
> ++    0   /* mask_basereg  */
> ++
> ++/******************************************************************************/
> ++
> ++.macro pixman_composite_src_8888_8_process_pixblock_head
> ++.endm
> ++
> ++.macro pixman_composite_src_8888_8_process_pixblock_tail
> ++.endm
> ++
> ++.macro pixman_composite_src_8888_8_process_pixblock_tail_head
> ++    vst1.8      {d3}, [DST_W, :64]!
> ++    vld4.8      {d0, d1, d2, d3}, [SRC]!
> ++.endm
> ++
> ++generate_composite_function_single_scanline \
> ++    pixman_store_scanline_a8_asm_neon, 32, 0, 8, \
> ++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
> ++    8, /* number of pixels, processed in a single block */ \
> ++    default_init, \
> ++    default_cleanup, \
> ++    pixman_composite_src_8888_8_process_pixblock_head, \
> ++    pixman_composite_src_8888_8_process_pixblock_tail, \
> ++    pixman_composite_src_8888_8_process_pixblock_tail_head, \
> ++    3,  /* dst_w_basereg */ \
> ++    0,  /* dst_r_basereg */ \
> ++    0,  /* src_basereg   */ \
> ++    0   /* mask_basereg  */
> ++
> ++/******************************************************************************/
> ++
> + .macro pixman_composite_src_8888_0565_process_pixblock_head
> +     vshll.u8    q8, d1, #8
> +     vshll.u8    q14, d2, #8
> +diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> +index f773e92..55219b3 100644
> +--- a/pixman/pixman-arm-neon.c
> ++++ b/pixman/pixman-arm-neon.c
> +@@ -484,6 +484,45 @@ neon_store_scanline_r5g6b5 (bits_image_t *  image,
> +     pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
> + }
> + 
> ++void
> ++pixman_fetch_scanline_a8_asm_neon (int             width,
> ++                                   uint32_t       *buffer,
> ++                                   const uint8_t  *pixel);
> ++
> ++
> ++void
> ++pixman_store_scanline_a8_asm_neon (int             width,
> ++                                   uint8_t        *pixel,
> ++                                   const uint32_t *values);
> ++
> ++static void
> ++neon_fetch_scanline_a8 (pixman_image_t *image,
> ++                        int             x,
> ++                        int             y,
> ++                        int             width,
> ++                        uint32_t *      buffer,
> ++                        const uint32_t *mask)
> ++{
> ++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
> ++    const uint8_t *pixel = (const uint8_t *) bits + x;
> ++
> ++    pixman_fetch_scanline_a8_asm_neon (width, buffer, pixel);
> ++}
> ++
> ++static void
> ++neon_store_scanline_a8 (bits_image_t *  image,
> ++                        int             x,
> ++                        int             y,
> ++                        int             width,
> ++                        const uint32_t *values)
> ++{
> ++    uint32_t *bits = image->bits + image->rowstride * y;
> ++    uint8_t *pixel = (uint8_t *) bits + x;
> ++
> ++    pixman_store_scanline_a8_asm_neon (width, pixel, values);
> ++}
> ++
> ++
> + pixman_implementation_t *
> + _pixman_implementation_create_arm_neon (void)
> + {
> +@@ -502,6 +541,9 @@ _pixman_implementation_create_arm_neon (void)
> +     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
> +                                      neon_fetch_scanline_r5g6b5,
> +                                      neon_store_scanline_r5g6b5);
> ++    _pixman_bits_override_accessors (PIXMAN_a8,
> ++                                     neon_fetch_scanline_a8,
> ++                                     neon_store_scanline_a8);
> + 
> +     imp->blt = arm_neon_blt;
> +     imp->fill = arm_neon_fill;
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman-0.21.4/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch b/recipes/xorg-lib/pixman-0.21.4/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
> new file mode 100644
> index 0000000..8253f41
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman-0.21.4/0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
> @@ -0,0 +1,77 @@
> +From cf3b8fdc53144ff62c4054996559d3a1a4d62b75 Mon Sep 17 00:00:00 2001
> +From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> +Date: Fri, 24 Sep 2010 18:22:44 +0300
> +Subject: [PATCH 24/24] ARM: added NEON optimizations for fetching x8r8g8b8 scanline
> +
> +---
> + pixman/pixman-arm-neon-asm.S |   14 ++++++++++++++
> + pixman/pixman-arm-neon.c     |   21 +++++++++++++++++++++
> + 2 files changed, 35 insertions(+), 0 deletions(-)
> +
> +diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
> +index 439b06b..3e0dcfe 100644
> +--- a/pixman/pixman-arm-neon-asm.S
> ++++ b/pixman/pixman-arm-neon-asm.S
> +@@ -1257,6 +1257,20 @@ generate_composite_function \
> +     0, /* src_basereg   */ \
> +     0  /* mask_basereg  */
> + 
> ++generate_composite_function_single_scanline \
> ++    pixman_fetch_scanline_x888_asm_neon, 32, 0, 32, \
> ++    FLAG_DST_WRITEONLY, \
> ++    8, /* number of pixels, processed in a single block */ \
> ++    pixman_composite_src_x888_8888_init, \
> ++    default_cleanup, \
> ++    pixman_composite_src_x888_8888_process_pixblock_head, \
> ++    pixman_composite_src_x888_8888_process_pixblock_tail, \
> ++    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
> ++    0,  /* dst_w_basereg */ \
> ++    0,  /* dst_r_basereg */ \
> ++    0,  /* src_basereg   */ \
> ++    0   /* mask_basereg  */
> ++
> + /******************************************************************************/
> + 
> + .macro pixman_composite_over_n_8_8888_process_pixblock_head
> +diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
> +index 55219b3..8cef414 100644
> +--- a/pixman/pixman-arm-neon.c
> ++++ b/pixman/pixman-arm-neon.c
> +@@ -522,6 +522,24 @@ neon_store_scanline_a8 (bits_image_t *  image,
> +     pixman_store_scanline_a8_asm_neon (width, pixel, values);
> + }
> + 
> ++void
> ++pixman_fetch_scanline_x888_asm_neon (int             width,
> ++                                     uint32_t       *buffer,
> ++                                     const uint32_t *pixel);
> ++
> ++static void
> ++neon_fetch_scanline_x888 (pixman_image_t *image,
> ++                          int             x,
> ++                          int             y,
> ++                          int             width,
> ++                          uint32_t *      buffer,
> ++                          const uint32_t *mask)
> ++{
> ++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
> ++    const uint32_t *pixel = (const uint32_t *) bits + x;
> ++
> ++    pixman_fetch_scanline_x888_asm_neon (width, buffer, pixel);
> ++}
> + 
> + pixman_implementation_t *
> + _pixman_implementation_create_arm_neon (void)
> +@@ -544,6 +562,9 @@ _pixman_implementation_create_arm_neon (void)
> +     _pixman_bits_override_accessors (PIXMAN_a8,
> +                                      neon_fetch_scanline_a8,
> +                                      neon_store_scanline_a8);
> ++    _pixman_bits_override_accessors (PIXMAN_x8r8g8b8,
> ++                                     neon_fetch_scanline_x888,
> ++                                     NULL);
> + 
> +     imp->blt = arm_neon_blt;
> +     imp->fill = arm_neon_fill;
> +-- 
> +1.6.6.1
> +
> diff --git a/recipes/xorg-lib/pixman_0.21.2.bb b/recipes/xorg-lib/pixman_0.21.2.bb
> deleted file mode 100644
> index 19394d6..0000000
> --- a/recipes/xorg-lib/pixman_0.21.2.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -require pixman.inc
> -
> -SRC_URI[archive.md5sum] = "9e09fd6e58cbf9717140891e0b7d4a7a"
> -SRC_URI[archive.sha256sum] = "295f51416caf307ff7caf1153ee9b1d86b9f7f02a7876d12db6538d80451c5de"
> -
> -PR = "${INC_PR}.1"
> -
> -SRC_URI += "\
> -           file://0002-Fix-argument-quoting-for-AC_INIT.patch \
> -           file://0003-Sun-s-copyrights-belong-to-Oracle-now.patch \
> -           file://0004-C-fast-path-for-a1-fill-operation.patch \
> -           file://0005-ARM-added-neon_composite_over_n_8_8-fast-path.patch \
> -           file://0006-ARM-introduced-fetch_mask_pixblock-macro-to-simplify.patch \
> -           file://0007-ARM-better-NEON-instructions-scheduling-for-over_n_8.patch \
> -           file://0008-ARM-added-neon_composite_over_8888_n_0565-fast-path.patch \
> -           file://0009-ARM-reuse-common-NEON-code-for-over_-n_8-8888_n-8888.patch \
> -           file://0010-ARM-added-neon_composite_over_0565_n_0565-fast-path.patch \
> -           file://0011-ARM-added-neon_composite_add_8888_8_8888-fast-path.patch \
> -           file://0012-ARM-better-NEON-instructions-scheduling-for-add_8888.patch \
> -           file://0013-ARM-added-neon_composite_add_n_8_8888-fast-path.patch \
> -           file://0014-ARM-added-neon_composite_add_8888_n_8888-fast-path.patch \
> -           file://0015-ARM-added-flags-parameter-to-some-asm-fast-path-wrap.patch \
> -           file://0016-ARM-added-neon_composite_in_n_8-fast-path.patch \
> -           file://0017-add-_pixman_bits_override_accessors.patch \
> -           file://0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
> -           file://0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
> -           file://0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
> -           file://0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
> -           file://0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
> -           file://0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch \
> -           file://0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch \
> -"
> -
> -NEON = " --disable-arm-neon "
> -NEON_armv7a = " "
> -
> -EXTRA_OECONF = "${NEON} --disable-gtk"
> diff --git a/recipes/xorg-lib/pixman_0.21.4.bb b/recipes/xorg-lib/pixman_0.21.4.bb
> new file mode 100644
> index 0000000..92a4f9f
> --- /dev/null
> +++ b/recipes/xorg-lib/pixman_0.21.4.bb
> @@ -0,0 +1,22 @@
> +require pixman.inc
> +
> +SRC_URI[archive.md5sum] = "e50975ace979cd416a505827c15191b4"
> +SRC_URI[archive.sha256sum] = "57783330ee2f96121dc267b7f25b98356fd09fe9de185cd39e72e906b6444013"
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI += "\
> +           file://0017-add-_pixman_bits_override_accessors.patch \
> +           file://0018-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
> +           file://0019-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
> +           file://0020-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
> +           file://0021-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
> +           file://0022-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
> +           file://0023-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch \
> +           file://0024-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch \
> +"
> +
> +NEON = " --disable-arm-neon "
> +NEON_armv7a = " "
> +
> +EXTRA_OECONF = "${NEON} --disable-gtk"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPtLRMkyGM64RGpERAq3QAJ4zs+von2rryJu/fAETCDT+/Dv7oQCfd8xK
ckB9PSW0r6s1zNfXwc5PyAg=
=LeuD
-----END PGP SIGNATURE-----




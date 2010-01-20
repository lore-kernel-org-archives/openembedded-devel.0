Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZho-0002WN-13
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:43 +0100
Received: by fxm4 with SMTP id 4so2829771fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=g52AEOWJeXohOmmM4Hv+k8cdxRdJ2vLN4/gGtYYzhqw=;
	b=stQrW10VpgvLcVru2TYdly8TVVhXCkSgKZmNC2P7t4+mZ3Bh7YERAStBqGjzT1wFB2
	1NqlBU3yovqyXD1XUUVjhOz7v7+qKPris1nhzgLR5fkDqQRaftFCxVF4uOmHJn3CXx7O
	cgVhR3VI/lH/ES9L7ywRpjNt28OjwzFq/hlx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qRknD1NySAMLUx5e2vJl09p7ua3aDfMSc2JWnwfkMwnpkxWgQGQnnYvT7Kt0+m6ulS
	FpeXLC0SfjRrgbPcdM7twq6926YWuGcZJE4yAanez02vfjjM81muzzFAU098zCiJyx3Q
	IwTq04TeuXxvyuos4/+EN/KYaHIe0YigeZq+E=
Received: by 10.223.14.20 with SMTP id e20mr3146424faa.16.1263990504305;
	Wed, 20 Jan 2010 04:28:24 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm3151049fxm.4.2010.01.20.04.28.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:56 +0100
Message-Id: <1263990478-28107-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 4/6] pixman: add version 0.17.4 with neon patches
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Dropped-delegation-support-for-pixman_blt.patch |  356 ++++++++++++++++++++
 ...0002-Test-program-for-pixman_blt-function.patch |  178 ++++++++++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 +++++++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 +++++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 +++++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 +++++
 recipes/xorg-lib/pixman_0.17.4.bb                  |   29 ++
 7 files changed, 953 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-lib/pixman-0.17.4/0001-Dropped-delegation-support-for-pixman_blt.patch
 create mode 100644 recipes/xorg-lib/pixman-0.17.4/0002-Test-program-for-pixman_blt-function.patch
 create mode 100644 recipes/xorg-lib/pixman-0.17.4/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/xorg-lib/pixman-0.17.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/xorg-lib/pixman-0.17.4/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/xorg-lib/pixman-0.17.4/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/xorg-lib/pixman_0.17.4.bb

diff --git a/recipes/xorg-lib/pixman-0.17.4/0001-Dropped-delegation-support-for-pixman_blt.patch b/recipes/xorg-lib/pixman-0.17.4/0001-Dropped-delegation-support-for-pixman_blt.patch
new file mode 100644
index 0000000..d52ee35
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.17.4/0001-Dropped-delegation-support-for-pixman_blt.patch
@@ -0,0 +1,356 @@
+From c4ce33821e2340ff95e30fce5758013287172d52 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 21 Oct 2009 23:48:43 +0000
+Subject: Dropped delegation support for 'pixman_blt'
+
+Function 'pixman_blt' is too simple and hardly needs any
+delegation. This reduces call overhead somewhat. The saving
+is minor, but every little bit helps.
+---
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index efeabeb..c8c5579 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -470,35 +470,6 @@ arm_neon_composite (pixman_implementation_t *imp,
+ }
+ 
+ static pixman_bool_t
+-arm_neon_blt (pixman_implementation_t *imp,
+-              uint32_t *               src_bits,
+-              uint32_t *               dst_bits,
+-              int                      src_stride,
+-              int                      dst_stride,
+-              int                      src_bpp,
+-              int                      dst_bpp,
+-              int                      src_x,
+-              int                      src_y,
+-              int                      dst_x,
+-              int                      dst_y,
+-              int                      width,
+-              int                      height)
+-{
+-    if (!pixman_blt_neon (
+-            src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-            src_x, src_y, dst_x, dst_y, width, height))
+-
+-    {
+-	return _pixman_implementation_blt (
+-	    imp->delegate,
+-	    src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-	    src_x, src_y, dst_x, dst_y, width, height);
+-    }
+-
+-    return TRUE;
+-}
+-
+-static pixman_bool_t
+ arm_neon_fill (pixman_implementation_t *imp,
+                uint32_t *               bits,
+                int                      stride,
+@@ -556,7 +527,7 @@ _pixman_implementation_create_arm_neon (void)
+     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
+ 
+     imp->composite = arm_neon_composite;
+-    imp->blt = arm_neon_blt;
++    imp->blt = pixman_blt_neon;
+     imp->fill = arm_neon_fill;
+ 
+     return imp;
+diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
+index 4795246..11c5f1b 100644
+--- a/pixman/pixman-arm-simd.c
++++ b/pixman/pixman-arm-simd.c
+@@ -480,6 +480,7 @@ _pixman_implementation_create_arm_simd (void)
+     pixman_implementation_t *imp = _pixman_implementation_create (general);
+ 
+     imp->composite = arm_simd_composite;
++    imp->blt = general->blt;
+ 
+     return imp;
+ }
+diff --git a/pixman/pixman-fast-path.c b/pixman/pixman-fast-path.c
+index 75a0c1e..8da6b1f 100644
+--- a/pixman/pixman-fast-path.c
++++ b/pixman/pixman-fast-path.c
+@@ -1690,6 +1690,7 @@ _pixman_implementation_create_fast_path (void)
+     pixman_implementation_t *imp = _pixman_implementation_create (general);
+ 
+     imp->composite = fast_path_composite;
++    imp->blt = general->blt;
+     imp->fill = fast_path_fill;
+ 
+     return imp;
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index c96a3f9..c3f96f9 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -286,8 +286,7 @@ general_composite (pixman_implementation_t * imp,
+ }
+ 
+ static pixman_bool_t
+-general_blt (pixman_implementation_t *imp,
+-             uint32_t *               src_bits,
++general_blt (uint32_t *               src_bits,
+              uint32_t *               dst_bits,
+              int                      src_stride,
+              int                      dst_stride,
+diff --git a/pixman/pixman-implementation.c b/pixman/pixman-implementation.c
+index 6488332..0520e36 100644
+--- a/pixman/pixman-implementation.c
++++ b/pixman/pixman-implementation.c
+@@ -100,27 +100,6 @@ delegate_combine_64_ca (pixman_implementation_t * imp,
+ }
+ 
+ static pixman_bool_t
+-delegate_blt (pixman_implementation_t * imp,
+-              uint32_t *                src_bits,
+-              uint32_t *                dst_bits,
+-              int                       src_stride,
+-              int                       dst_stride,
+-              int                       src_bpp,
+-              int                       dst_bpp,
+-              int                       src_x,
+-              int                       src_y,
+-              int                       dst_x,
+-              int                       dst_y,
+-              int                       width,
+-              int                       height)
+-{
+-    return _pixman_implementation_blt (
+-	imp->delegate, src_bits, dst_bits, src_stride, dst_stride,
+-	src_bpp, dst_bpp, src_x, src_y, dst_x, dst_y,
+-	width, height);
+-}
+-
+-static pixman_bool_t
+ delegate_fill (pixman_implementation_t *imp,
+                uint32_t *               bits,
+                int                      stride,
+@@ -153,7 +132,7 @@ _pixman_implementation_create (pixman_implementation_t *delegate)
+     /* Fill out function pointers with ones that just delegate
+      */
+     imp->composite = delegate_composite;
+-    imp->blt = delegate_blt;
++    imp->blt = NULL;
+     imp->fill = delegate_fill;
+ 
+     for (i = 0; i < PIXMAN_N_OPERATORS; ++i)
+@@ -233,26 +212,6 @@ _pixman_implementation_composite (pixman_implementation_t * imp,
+ }
+ 
+ pixman_bool_t
+-_pixman_implementation_blt (pixman_implementation_t * imp,
+-                            uint32_t *                src_bits,
+-                            uint32_t *                dst_bits,
+-                            int                       src_stride,
+-                            int                       dst_stride,
+-                            int                       src_bpp,
+-                            int                       dst_bpp,
+-                            int                       src_x,
+-                            int                       src_y,
+-                            int                       dst_x,
+-                            int                       dst_y,
+-                            int                       width,
+-                            int                       height)
+-{
+-    return (*imp->blt) (imp, src_bits, dst_bits, src_stride, dst_stride,
+-			src_bpp, dst_bpp, src_x, src_y, dst_x, dst_y,
+-			width, height);
+-}
+-
+-pixman_bool_t
+ _pixman_implementation_fill (pixman_implementation_t *imp,
+                              uint32_t *               bits,
+                              int                      stride,
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index b1591d9..a3080b6 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -3318,35 +3318,6 @@ mmx_composite (pixman_implementation_t *imp,
+ }
+ 
+ static pixman_bool_t
+-mmx_blt (pixman_implementation_t *imp,
+-         uint32_t *               src_bits,
+-         uint32_t *               dst_bits,
+-         int                      src_stride,
+-         int                      dst_stride,
+-         int                      src_bpp,
+-         int                      dst_bpp,
+-         int                      src_x,
+-         int                      src_y,
+-         int                      dst_x,
+-         int                      dst_y,
+-         int                      width,
+-         int                      height)
+-{
+-    if (!pixman_blt_mmx (
+-            src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-            src_x, src_y, dst_x, dst_y, width, height))
+-
+-    {
+-	return _pixman_implementation_blt (
+-	    imp->delegate,
+-	    src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-	    src_x, src_y, dst_x, dst_y, width, height);
+-    }
+-
+-    return TRUE;
+-}
+-
+-static pixman_bool_t
+ mmx_fill (pixman_implementation_t *imp,
+           uint32_t *               bits,
+           int                      stride,
+@@ -3397,7 +3368,7 @@ _pixman_implementation_create_mmx (void)
+     imp->combine_32_ca[PIXMAN_OP_ADD] = mmx_combine_add_ca;
+ 
+     imp->composite = mmx_composite;
+-    imp->blt = mmx_blt;
++    imp->blt = pixman_blt_mmx;
+     imp->fill = mmx_fill;
+ 
+     return imp;
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index c99f2a2..209cba4 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -399,8 +399,7 @@ typedef void (*pixman_composite_func_t) (pixman_implementation_t *imp,
+ 					 int32_t                  dest_y,
+ 					 int32_t                  width,
+ 					 int32_t                  height);
+-typedef pixman_bool_t (*pixman_blt_func_t) (pixman_implementation_t *imp,
+-					    uint32_t *               src_bits,
++typedef pixman_bool_t (*pixman_blt_func_t) (uint32_t *               src_bits,
+ 					    uint32_t *               dst_bits,
+ 					    int                      src_stride,
+ 					    int                      dst_stride,
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 1f8aa6e..8c2e114 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5893,8 +5893,7 @@ sse2_composite (pixman_implementation_t *imp,
+ __attribute__((__force_align_arg_pointer__))
+ #endif
+ static pixman_bool_t
+-sse2_blt (pixman_implementation_t *imp,
+-          uint32_t *               src_bits,
++sse2_blt (uint32_t *               src_bits,
+           uint32_t *               dst_bits,
+           int                      src_stride,
+           int                      dst_stride,
+@@ -5907,18 +5906,9 @@ sse2_blt (pixman_implementation_t *imp,
+           int                      width,
+           int                      height)
+ {
+-    if (!pixman_blt_sse2 (
++    return pixman_blt_sse2 (
+             src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-            src_x, src_y, dst_x, dst_y, width, height))
+-
+-    {
+-	return _pixman_implementation_blt (
+-	    imp->delegate,
+-	    src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-	    src_x, src_y, dst_x, dst_y, width, height);
+-    }
+-
+-    return TRUE;
++            src_x, src_y, dst_x, dst_y, width, height);
+ }
+ 
+ #if defined(__GNUC__) && !defined(__x86_64__) && !defined(__amd64__)
+diff --git a/pixman/pixman-vmx.c b/pixman/pixman-vmx.c
+index 06325a7..e31bcb3 100644
+--- a/pixman/pixman-vmx.c
++++ b/pixman/pixman-vmx.c
+@@ -1615,6 +1615,8 @@ _pixman_implementation_create_vmx (void)
+ 
+     /* Set up function pointers */
+ 
++    imp->blt = fast->blt;
++
+     imp->combine_32[PIXMAN_OP_OVER] = vmx_combine_over_u;
+     imp->combine_32[PIXMAN_OP_OVER_REVERSE] = vmx_combine_over_reverse_u;
+     imp->combine_32[PIXMAN_OP_IN] = vmx_combine_in_u;
+diff --git a/pixman/pixman.c b/pixman/pixman.c
+index 0edd967..07ad767 100644
+--- a/pixman/pixman.c
++++ b/pixman/pixman.c
+@@ -57,6 +57,22 @@ static const optimized_operator_info_t optimized_operators[] =
+ 
+ static pixman_implementation_t *imp;
+ 
++static pixman_bool_t
++pixman_blt_stub (uint32_t *src_bits,
++                 uint32_t *dst_bits,
++                 int       src_stride,
++                 int       dst_stride,
++                 int       src_bpp,
++                 int       dst_bpp,
++                 int       src_x,
++                 int       src_y,
++                 int       dst_x,
++                 int       dst_y,
++                 int       width,
++                 int       height);
++
++static pixman_blt_func_t pixman_blt_imp = pixman_blt_stub;
++
+ /*
+  * Check if the current operator could be optimized
+  */
+@@ -216,6 +232,31 @@ pixman_image_composite (pixman_op_t      op,
+ 	unapply_workaround (dest, dest_bits, dest_dx, dest_dy);
+ }
+ 
++static pixman_bool_t
++pixman_blt_stub (uint32_t *src_bits,
++                 uint32_t *dst_bits,
++                 int       src_stride,
++                 int       dst_stride,
++                 int       src_bpp,
++                 int       dst_bpp,
++                 int       src_x,
++                 int       src_y,
++                 int       dst_x,
++                 int       dst_y,
++                 int       width,
++                 int       height)
++{
++    if (!imp)
++	imp = _pixman_choose_implementation ();
++
++    pixman_blt_imp = imp->blt;
++    return pixman_blt_imp (src_bits, dst_bits, src_stride, dst_stride,
++                           src_bpp, dst_bpp,
++                           src_x, src_y,
++                           dst_x, dst_y,
++                           width, height);
++}
++
+ PIXMAN_EXPORT pixman_bool_t
+ pixman_blt (uint32_t *src_bits,
+             uint32_t *dst_bits,
+@@ -230,14 +271,11 @@ pixman_blt (uint32_t *src_bits,
+             int       width,
+             int       height)
+ {
+-    if (!imp)
+-	imp = _pixman_choose_implementation ();
+-
+-    return _pixman_implementation_blt (imp, src_bits, dst_bits, src_stride, dst_stride,
+-                                       src_bpp, dst_bpp,
+-                                       src_x, src_y,
+-                                       dst_x, dst_y,
+-                                       width, height);
++    return pixman_blt_imp (src_bits, dst_bits, src_stride, dst_stride,
++                           src_bpp, dst_bpp,
++                           src_x, src_y,
++                           dst_x, dst_y,
++                           width, height);
+ }
+ 
+ PIXMAN_EXPORT pixman_bool_t
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.17.4/0002-Test-program-for-pixman_blt-function.patch b/recipes/xorg-lib/pixman-0.17.4/0002-Test-program-for-pixman_blt-function.patch
new file mode 100644
index 0000000..ba62b88
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.17.4/0002-Test-program-for-pixman_blt-function.patch
@@ -0,0 +1,178 @@
+From 364406e03f9651aacb1bc684de6c00a27f9df66d Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Mon, 19 Oct 2009 20:32:55 +0300
+Subject: [PATCH 2/6] Test program for pixman_blt function
+
+It can do some basic correctness tests and also check whether
+overlapping of source and destination images is supported.
+---
+ test/Makefile.am           |    2 +
+ test/overlapped-blt-test.c |  136 ++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 138 insertions(+), 0 deletions(-)
+ create mode 100644 test/overlapped-blt-test.c
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 89d32e9..40c305f 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -6,6 +6,7 @@
+ 	fetch-test		\
+ 	oob-test		\
+ 	window-test		\
++	overlapped-blt-test     \
+ 	trap-crasher		\
+ 	alphamap		\
+ 	blitters-test		\
+@@ -18,6 +19,7 @@
+ trap_crasher_LDADD = $(TEST_LDADD)
+ oob_test_LDADD = $(TEST_LDADD)
+ window_test_LDADD = $(TEST_LDADD)
++overlapped_blt_test_LDADD = $(TEST_LDADD)
+ 
+ blitters_test_LDADD = $(TEST_LDADD)
+ blitters_test_SOURCES = blitters-test.c utils.c utils.h
+diff --git a/test/overlapped-blt-test.c b/test/overlapped-blt-test.c
+new file mode 100644
+index 0000000..95fbc54
+--- /dev/null
++++ b/test/overlapped-blt-test.c
+@@ -0,0 +1,136 @@
++/*
++ * A small test program which can check whether pixman_blt function
++ * can support overlapping of source and destination images.
++ * Efficient blit with overlapping is useful for scrolling.
++ */
++
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include "pixman.h"
++
++/* reference implementation (slow) */
++static void
++trivial_copy8_2d (
++    uint8_t *dst, int dst_stride,
++    uint8_t *src, int src_stride,
++    int dx, int dy, int sx, int sy,
++    int w, int h)
++{
++    int x, y;
++    uint8_t *tmp = malloc (src_stride * (sy + h));
++    memcpy (tmp, src, src_stride * (sy + h));
++    for (y = 0; y < h; y++)
++    {
++	for (x = 0; x < w; x++)
++	{
++	    *(dst + (dy + y) * dst_stride + dx + x) =
++				*(tmp + (sy + y) * src_stride + sx + x);
++	}
++    }
++    free (tmp);
++}
++
++static void
++trivial_copy_2d (
++    uint8_t *dst, int dst_stride,
++    uint8_t *src, int src_stride,
++    int dx, int dy, int sx, int sy,
++    int w, int h, int bpp)
++{
++    trivial_copy8_2d (dst, dst_stride, src, src_stride,
++	dx * (bpp / 8), dy, sx * (bpp / 8), sy, w * (bpp / 8), h);
++}
++
++/* now the test itself */
++
++#define ST_UNSUPPORTED		1
++#define ST_NORMAL_BUG		2
++#define ST_OVERLAPPED_BUG	4
++
++#define MAX_SIZE_X		64
++#define MAX_SIZE_Y		64
++
++static void print_result(int bpp, int flags)
++{
++    printf("bpp=%d, supported=%d, normal_ok=%d, overlapped_ok=%d\n",
++	bpp,
++	!(flags & ST_UNSUPPORTED),
++	!(flags & ST_NORMAL_BUG),
++	!(flags & ST_OVERLAPPED_BUG));
++}
++
++int main()
++{
++    int c = 100000, r;
++    int bpp_st[33] = {0};
++    srand(0);
++    while (c-- > 0)
++    {
++	uint8_t *src1, *src2, *src3;
++	int i;
++	int sizex = rand() % MAX_SIZE_X + 1;
++	int sizey = rand() % MAX_SIZE_Y + 1;
++	int sx = rand() % sizex;
++	int sy = rand() % sizey;
++	int dx = rand() % sizex;
++	int dy = rand() % sizey;
++	int w = rand() % sizex;
++	int h = rand() % sizex;
++	int bpp = 8 * (1 << (rand() % 3));
++	int stride_delta = rand() % 8;
++	int bufsize;
++	if ((sizex + stride_delta) % 4)
++	    stride_delta += 4 - ((sizex + stride_delta) % 4);
++	bufsize = (sizex + stride_delta) * sizey * bpp / 8;
++	src1 = malloc (bufsize);
++	src2 = malloc (bufsize);
++	src3 = malloc (bufsize);
++	for (i = 0; i < bufsize; i++)
++	    src1[i] = rand();
++	memcpy (src2, src1, bufsize);
++	memcpy (src3, src1, bufsize);
++	if (sx + w > sizex)
++	    w = sizex - sx;
++	if (dx + w > sizex)
++	    w = sizex - dx;
++	if (sy + h > sizey)
++	    h = sizey - sy;
++	if (dy + h > sizey)
++	    h = sizey - dy;
++	/* get reference result */
++	trivial_copy_2d (src1, (sizex + stride_delta) * bpp / 8,
++	                 src1, (sizex + stride_delta) * bpp / 8,
++	                 dx, dy, sx, sy, w, h, bpp);
++	/* check nonoverlapped pixman result */
++	r = pixman_blt ((uint32_t *)src3, (uint32_t *)src2,
++	                (sizex + stride_delta) * bpp / 8 / 4,
++	                (sizex + stride_delta) * bpp / 8 / 4,
++	                bpp, bpp, sx, sy, dx, dy, w, h);
++	if (!r)
++	    bpp_st[bpp] |= ST_UNSUPPORTED;
++	if (memcmp (src1, src2, bufsize) != 0)
++	    bpp_st[bpp] |= ST_NORMAL_BUG;
++	/* check overlapped pixman result */
++	r = pixman_blt ((uint32_t *)src3, (uint32_t *)src3,
++	                (sizex + stride_delta) * bpp / 8 / 4,
++	                (sizex + stride_delta) * bpp / 8 / 4,
++	                bpp, bpp, sx, sy, dx, dy, w, h);
++	if (!r)
++	    bpp_st[bpp] |= ST_UNSUPPORTED;
++	if (memcmp (src1, src3, bufsize) != 0)
++	    bpp_st[bpp] |= ST_OVERLAPPED_BUG;
++	/* free buffers */
++	free (src1);
++	free (src2);
++	free (src3);
++    }
++
++    /* report results */
++    print_result (8, bpp_st[8]);
++    print_result (16, bpp_st[16]);
++    print_result (32, bpp_st[32]);
++
++    return 0;
++}
+-- 
+1.6.2.4
+
diff --git a/recipes/xorg-lib/pixman-0.17.4/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.17.4/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..25ce7ee
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.17.4/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From c29c9fa826b7112156fd6150b5f1564227935c05 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:27:33 +0300
+Subject: [PATCH 3/6] Generic C implementation of pixman_blt with overlapping support
+
+Uses memcpy/memmove functions to copy pixels, can handle the
+case when both source and destination areas are in the same
+image (this is useful for scrolling).
+
+It is assumed that copying direction is only important when
+using the same image for both source and destination (and
+src_stride == dst_stride). Copying direction is undefined
+for the images with different source and destination stride
+which happen to be in the overlapped areas (but this is an
+unrealistic case anyway).
+---
+ pixman/pixman-general.c |   21 ++++++++++++++++++---
+ pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index c96a3f9..d71a299 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -300,9 +300,24 @@ general_blt (pixman_implementation_t *imp,
+              int                      width,
+              int                      height)
+ {
+-    /* We can't blit unless we have sse2 or mmx */
+-
+-    return FALSE;
++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
++    uint8_t *src_bytes = (uint8_t *)src_bits;
++    int bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
++	return FALSE;
++
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
++                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index 5000f91..8c5d4fd 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -10,6 +10,7 @@
+ 
+ #include "pixman.h"
+ #include <time.h>
++#include <string.h>
+ #include <assert.h>
+ 
+ #include "pixman-compiler.h"
+@@ -794,4 +795,46 @@ void pixman_timer_register (pixman_timer_t *timer);
+ 
+ #endif /* PIXMAN_TIMERS */
+ 
++/* a helper function, can blit 8-bit images with src/dst overlapping support */
++static inline void
++pixman_blt_helper (uint8_t *src_bytes,
++                   uint8_t *dst_bytes,
++                   int      src_stride,
++                   int      dst_stride,
++                   int      width,
++                   int      height)
++{
++    /*
++     * The second part of this check is not strictly needed, but it prevents
++     * unnecessary upside-down processing of areas which belong to different
++     * images. Upside-down processing can be slower with fixed-distance-ahead
++     * prefetch and perceived as having more tearing.
++     */
++    if (src_bytes < dst_bytes + width &&
++	src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++	/* Horizontal scrolling to the left needs memmove */
++	if (src_bytes + width > dst_bytes)
++	{
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return;
++	}
++    }
++    while (--height >= 0)
++    {
++	memcpy (dst_bytes, src_bytes, width);
++	dst_bytes += dst_stride;
++	src_bytes += src_stride;
++    }
++}
++
+ #endif /* PIXMAN_PRIVATE_H */
+-- 
+1.6.2.4
+
diff --git a/recipes/xorg-lib/pixman-0.17.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.17.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..74c7b45
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.17.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From 7ca32542c957ff308a6ca7e3715e6552a65ae395 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 4/6] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index 819e3a0..dcccadb 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -3002,34 +3002,43 @@ pixman_blt_mmx (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using MMX */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     while (height--)
+@@ -3039,7 +3048,7 @@ pixman_blt_mmx (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	while (w >= 2 && ((unsigned long)d & 3))
+ 	{
+-- 
+1.6.2.4
+
diff --git a/recipes/xorg-lib/pixman-0.17.4/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.17.4/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..3704fbf
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.17.4/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From edc80b41c6480b7c80ec5f7c835c92b2debb3774 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 5/6] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 78b0ad1..b84636b 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5300,34 +5300,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using SSE2 */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     cache_prefetch ((__m128i*)src_bytes);
+@@ -5340,7 +5349,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	cache_prefetch_next ((__m128i*)s);
+ 	cache_prefetch_next ((__m128i*)d);
+-- 
+1.6.2.4
+
diff --git a/recipes/xorg-lib/pixman-0.17.4/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.17.4/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..7c22483
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.17.4/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From 86870ff530b5e435034bd80207e5758466d96cff Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 6/6] Support of overlapping src/dst for pixman_blt_neon
+
+---
+ pixman/pixman-arm-neon.c |   63 ++++++++++++++++++++++++++++++++++++++-------
+ 1 files changed, 53 insertions(+), 10 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 495fda4..c632ff5 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -357,26 +357,66 @@
+                  int       width,
+                  int       height)
+ {
+-    if (src_bpp != dst_bpp)
++    uint8_t *   src_bytes;
++    uint8_t *   dst_bytes;
++    int         bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
++    {
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
++    }
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using NEON */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
++    }
++
+     switch (src_bpp)
+     {
+     case 16:
+ 	pixman_composite_src_0565_0565_asm_neon (
+-		width, height,
+-		(uint16_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
+-		(uint16_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
++		width >> 1,
++		height,
++		(uint16_t *) dst_bytes,
++		dst_stride >> 1,
++		(uint16_t *) src_bytes,
++		src_stride >> 1);
+ 	return TRUE;
+     case 32:
+ 	pixman_composite_src_8888_8888_asm_neon (
+-		width, height,
+-		(uint32_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
+-		(uint32_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 4), src_stride);
++		width >> 2,
++		height,
++		(uint32_t *) dst_bytes,
++		dst_stride >> 2,
++		(uint32_t *) src_bytes,
++		src_stride >> 2);
+ 	return TRUE;
+     default:
+ 	return FALSE;
+-- 
+1.6.2.4
+
diff --git a/recipes/xorg-lib/pixman_0.17.4.bb b/recipes/xorg-lib/pixman_0.17.4.bb
new file mode 100644
index 0000000..b648219
--- /dev/null
+++ b/recipes/xorg-lib/pixman_0.17.4.bb
@@ -0,0 +1,29 @@
+SECTION = "libs"
+PRIORITY = "optional"
+DESCRIPTION = "Low-level pixel manipulation library."
+LICENSE = "X11"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_angstrom = "1"
+DEFAULT_PREFERENCE_shr = "1"
+
+BBCLASSEXTEND="native"
+
+SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz \
+           file://0001-Dropped-delegation-support-for-pixman_blt.patch;patch=1 \
+           file://0002-Test-program-for-pixman_blt-function.patch;patch=1 \
+           file://0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch;patch=1 \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch;patch=1 \
+           file://0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch;patch=1 \
+           file://0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch;patch=1 \
+          "
+
+inherit autotools_stage
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = ""
+
+EXTRA_OECONF = "${NEON}"
+
+AUTOTOOLS_STAGE_PKGCONFIG = "1"
+
-- 
1.6.6




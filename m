Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0CXp-0003Pd-36
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:43:14 +0100
Received: by fxm19 with SMTP id 19so2578858fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Wrp5FVh8DKx6DBYvLACk+7QKCnk26/2VjGQUO2dW5Ns=;
	b=uoE8pFuRtYvx3I+lkBhW5nHq1IL/5DLOsKy8SQehAnwAmHj5hajo6PHwEdzuhibvSl
	+FfA87jyKi+WpaK6XAeibptA/eYDn5Qqw952D3hhtJn/WpalwuhE0YdtAGVdXtR+K0X/
	gnqvYoQX2m775B92BCdE6W5BSBTe48Qn5ZSCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uITbD4b+BXponrK1mqCwJqyuCGuGAA13NCbEPqzD892Pmyviug/EoGXGYKKrMOFlLf
	Se+J7zn/49V0hxaNtg4BGwFRL8s0eMWJwzIX3Zy8fyWzPa9sc4b7M3bVWEQ/l4wdTr5k
	AZchoebYAjKeALKMBgXOaDs/Zkh3xCsJadfzQ=
Received: by 10.223.6.11 with SMTP id 11mr1423973fax.98.1300365687552;
	Thu, 17 Mar 2011 05:41:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o12sm705972fav.30.2011.03.17.05.41.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 05:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2011 13:41:18 +0100
Message-Id: <1300365679-20067-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] gstreamer: move old versions to obsolete
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
X-List-Received-Date: Thu, 17 Mar 2011 12:43:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gstreamer/gst-ffmpeg/armv5.patch           | 1509 -------------------
 recipes/gstreamer/gst-ffmpeg/autotools.patch       |   21 -
 recipes/gstreamer/gst-ffmpeg_0.10.2.bb             |   35 -
 recipes/gstreamer/gst-plugins-bad_0.10.20.bb       |   16 -
 .../gstreamer/gst-plugins-base/fix-playbin2.patch  |   26 -
 .../gst-plugins-base_rowstride.patch               | 1577 --------------------
 recipes/gstreamer/gst-plugins-base_0.10.25.bb      |   19 -
 recipes/gstreamer/gst-plugins-base_0.10.31.bb      |   26 -
 .../fix-unit-scale-asseration.patch                |   33 -
 recipes/gstreamer/gst-plugins-good_0.10.15.bb      |   16 -
 recipes/gstreamer/gst-rtsp_0.10.4.bb               |    4 -
 recipes/gstreamer/gst-rtsp_0.10.5.bb               |    4 -
 recipes/gstreamer/gstreamer/po-makefile-fix.patch  |   12 -
 .../registry-do-not-look-into-debug-dirs.patch     |   39 -
 recipes/gstreamer/gstreamer_0.10.17.bb             |   10 -
 recipes/gstreamer/gstreamer_0.10.25.bb             |    6 -
 recipes/gstreamer/gstreamer_0.10.31.bb             |   15 -
 recipes/obsolete/gstreamer/gst-ffmpeg/armv5.patch  | 1509 +++++++++++++++++++
 .../obsolete/gstreamer/gst-ffmpeg/autotools.patch  |   21 +
 recipes/obsolete/gstreamer/gst-ffmpeg_0.10.2.bb    |   35 +
 .../obsolete/gstreamer/gst-plugins-bad_0.10.20.bb  |   16 +
 .../gstreamer/gst-plugins-base/fix-playbin2.patch  |   26 +
 .../gst-plugins-base_rowstride.patch               | 1577 ++++++++++++++++++++
 .../obsolete/gstreamer/gst-plugins-base_0.10.25.bb |   19 +
 .../obsolete/gstreamer/gst-plugins-base_0.10.31.bb |   26 +
 .../fix-unit-scale-asseration.patch                |   33 +
 .../obsolete/gstreamer/gst-plugins-good_0.10.15.bb |   16 +
 recipes/obsolete/gstreamer/gst-rtsp_0.10.4.bb      |    4 +
 recipes/obsolete/gstreamer/gst-rtsp_0.10.5.bb      |    4 +
 .../gstreamer/gstreamer/po-makefile-fix.patch      |   12 +
 .../registry-do-not-look-into-debug-dirs.patch     |   39 +
 recipes/obsolete/gstreamer/gstreamer_0.10.17.bb    |   10 +
 recipes/obsolete/gstreamer/gstreamer_0.10.25.bb    |    6 +
 recipes/obsolete/gstreamer/gstreamer_0.10.31.bb    |   15 +
 34 files changed, 3368 insertions(+), 3368 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-ffmpeg/armv5.patch
 delete mode 100644 recipes/gstreamer/gst-ffmpeg/autotools.patch
 delete mode 100644 recipes/gstreamer/gst-ffmpeg_0.10.2.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-bad_0.10.20.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base/fix-playbin2.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.25.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.31.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.15.bb
 delete mode 100644 recipes/gstreamer/gst-rtsp_0.10.4.bb
 delete mode 100644 recipes/gstreamer/gst-rtsp_0.10.5.bb
 delete mode 100644 recipes/gstreamer/gstreamer/po-makefile-fix.patch
 delete mode 100644 recipes/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.17.bb
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.25.bb
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.31.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-ffmpeg/armv5.patch
 create mode 100644 recipes/obsolete/gstreamer/gst-ffmpeg/autotools.patch
 create mode 100644 recipes/obsolete/gstreamer/gst-ffmpeg_0.10.2.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-bad_0.10.20.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-base/fix-playbin2.patch
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-base_0.10.25.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-base_0.10.31.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-good_0.10.15.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-rtsp_0.10.4.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-rtsp_0.10.5.bb
 create mode 100644 recipes/obsolete/gstreamer/gstreamer/po-makefile-fix.patch
 create mode 100644 recipes/obsolete/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch
 create mode 100644 recipes/obsolete/gstreamer/gstreamer_0.10.17.bb
 create mode 100644 recipes/obsolete/gstreamer/gstreamer_0.10.25.bb
 create mode 100644 recipes/obsolete/gstreamer/gstreamer_0.10.31.bb

diff --git a/recipes/gstreamer/gst-ffmpeg/armv5.patch b/recipes/gstreamer/gst-ffmpeg/armv5.patch
deleted file mode 100644
index 794709c..0000000
--- a/recipes/gstreamer/gst-ffmpeg/armv5.patch
+++ /dev/null
@@ -1,1509 +0,0 @@
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/configure.ac
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac	2006-09-23 15:35:21.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/configure.ac	2007-05-01 12:23:39.000000000 +0200
-@@ -190,7 +190,7 @@
-     ARCH_X86=yes
-     ;;
-   # armv4l is a subset of armv5tel
--  armv4l|armv5tel)
-+  arm|armv4l|armv5tel|armv5te)
-     TARGET_ARCH="armv4l"
-     ARCH_ARMV4L=yes
-     ;;
-@@ -364,11 +364,8 @@
- AC_FF_ALLOW_DISABLE(HAVE_IWMMXT, iwmmxt, use ARM/IWMMXT optimizations,[
-   if test x$TARGET_ARCH = xarmv4l; then
-     AC_MSG_CHECKING(for support of IWMMXT optimizations)
--    AC_TRY_RUN([
--        int main () {
-+    AC_TRY_COMPILE(,[
-           __asm__ __volatile__ ("wunpckelub wr6, wr4");
--          return 0;
--        }
-       ],[ HAVE_IWMMXT=yes && AC_MSG_RESULT(yes) ],[
-         HAVE_IWMMXT=no && AC_MSG_RESULT(no) ])
-   else
-@@ -376,6 +373,19 @@
-   fi
- ])
- 
-+dnl ARMV5TE
-+AC_FF_ALLOW_DISABLE(HAVE_ARMV5TE, armv5te, use ARMV5TE optimizations,[
-+  if test x$TARGET_ARCH = xarmv4l; then
-+    AC_MSG_CHECKING(for support of ARMV5TE specific instructions)
-+    AC_TRY_COMPILE(, [
-+          __asm__ __volatile__ ("smulbb a4,ip,a3");
-+      ],[ HAVE_ARMV5TE=yes && AC_MSG_RESULT(yes) ],[
-+        HAVE_ARMV5TE=no && AC_MSG_RESULT(no) ])
-+  else
-+    HAVE_ARMV5TE=no
-+  fi
-+])
-+
- dnl GProf (-p)
- AC_FF_ALLOW_ENABLE(HAVE_GPROF, gprof, profiling with gprof,[
-   GPROF_FLAGS="-p"
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c	2006-09-20 20:55:37.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c	2007-05-01 12:23:40.000000000 +0200
-  * ARMv4L optimized DSP utils
-  * Copyright (c) 2001 Lionel Ulmer.
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
--#include "dsputil.h"
-+#include "../dsputil.h"
- #ifdef HAVE_IPP
- #include "ipp.h"
- #endif
-@@ -27,6 +29,12 @@
- extern void j_rev_dct_ARM(DCTELEM *data);
- extern void simple_idct_ARM(DCTELEM *data);
- 
-+extern void simple_idct_armv5te(DCTELEM *data);
-+extern void simple_idct_put_armv5te(uint8_t *dest, int line_size,
-+                                    DCTELEM *data);
-+extern void simple_idct_add_armv5te(uint8_t *dest, int line_size,
-+                                    DCTELEM *data);
-+
- /* XXX: local hack */
- static void (*ff_put_pixels_clamped)(const DCTELEM *block, uint8_t *pixels, int line_size);
- static void (*ff_add_pixels_clamped)(const DCTELEM *block, uint8_t *pixels, int line_size);
-@@ -196,8 +204,10 @@
-     ff_add_pixels_clamped = c->add_pixels_clamped;
- 
-     if(idct_algo == FF_IDCT_AUTO){
--#ifdef HAVE_IPP
-+#if defined(HAVE_IPP)
-         idct_algo = FF_IDCT_IPP;
-+#elif defined(HAVE_ARMV5TE)
-+        idct_algo = FF_IDCT_SIMPLEARMV5TE;
- #else
-         idct_algo = FF_IDCT_ARM;
- #endif
-@@ -213,6 +223,13 @@
-         c->idct_add= simple_idct_ARM_add;
-         c->idct    = simple_idct_ARM;
-         c->idct_permutation_type= FF_NO_IDCT_PERM;
-+#ifdef HAVE_ARMV5TE
-+    } else if (idct_algo==FF_IDCT_SIMPLEARMV5TE){
-+        c->idct_put= simple_idct_put_armv5te;
-+        c->idct_add= simple_idct_add_armv5te;
-+        c->idct    = simple_idct_armv5te;
-+        c->idct_permutation_type = FF_NO_IDCT_PERM;
-+#endif
- #ifdef HAVE_IPP
-     } else if (idct_algo==FF_IDCT_IPP){
-         c->idct_put= simple_idct_ipp_put;
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm_s.S	2006-02-19 00:04:59.000000000 +0100
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm_s.S	2007-05-01 12:23:40.000000000 +0200
-@@ -2,20 +2,29 @@
- @ ARMv4L optimized DSP utils
- @ Copyright (c) 2004 AGAWA Koji <i (AT) atty (DOT) jp>
- @
--@ This library is free software; you can redistribute it and/or
-+@ This file is part of FFmpeg.
-+@
-+@ FFmpeg is free software; you can redistribute it and/or
- @ modify it under the terms of the GNU Lesser General Public
- @ License as published by the Free Software Foundation; either
--@ version 2 of the License, or (at your option) any later version.
-+@ version 2.1 of the License, or (at your option) any later version.
- @
--@ This library is distributed in the hope that it will be useful,
-+@ FFmpeg is distributed in the hope that it will be useful,
- @ but WITHOUT ANY WARRANTY; without even the implied warranty of
- @ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- @ Lesser General Public License for more details.
- @
- @ You should have received a copy of the GNU Lesser General Public
--@ License along with this library; if not, write to the Free Software
-+@ License along with FFmpeg; if not, write to the Free Software
- @ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- @
-+#if defined(__ARM_ARCH_5__) || \
-+    defined(__ARM_ARCH_5T__) || \
-+    defined(__ARM_ARCH_5TE__)
-+#define PLD(code...)   code
-+#else
-+#define PLD(code...)
-+#endif
- 
- .macro  ADJ_ALIGN_QUADWORD_D shift, Rd0, Rd1, Rd2, Rd3, Rn0, Rn1, Rn2, Rn3, Rn4
-         mov \Rd0, \Rn0, lsr #(\shift * 8)
-@@ -74,7 +83,7 @@
- put_pixels16_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r11, lr} @ R14 is also called LR
-         adr r5, 5f
-         ands r4, r1, #3
-@@ -85,7 +94,7 @@
-         ldmia r1, {r4-r7}
-         add r1, r1, r2
-         stmia r0, {r4-r7}
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         add r0, r0, r2
-         bne 1b
-@@ -95,7 +104,7 @@
-         ldmia r1, {r4-r8}
-         add r1, r1, r2
-         ADJ_ALIGN_QUADWORD_D 1, r9, r10, r11, r12, r4, r5, r6, r7, r8
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         stmia r0, {r9-r12}
-         add r0, r0, r2
-@@ -106,7 +115,7 @@
-         ldmia r1, {r4-r8}
-         add r1, r1, r2
-         ADJ_ALIGN_QUADWORD_D 2, r9, r10, r11, r12, r4, r5, r6, r7, r8
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         stmia r0, {r9-r12}
-         add r0, r0, r2
-@@ -117,7 +126,7 @@
-         ldmia r1, {r4-r8}
-         add r1, r1, r2
-         ADJ_ALIGN_QUADWORD_D 3, r9, r10, r11, r12, r4, r5, r6, r7, r8
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         stmia r0, {r9-r12}
-         add r0, r0, r2
-@@ -136,7 +145,7 @@
- put_pixels8_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r5,lr} @ R14 is also called LR
-         adr r5, 5f
-         ands r4, r1, #3
-@@ -147,7 +156,7 @@
-         ldmia r1, {r4-r5}
-         add r1, r1, r2
-         subs r3, r3, #1
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmia r0, {r4-r5}
-         add r0, r0, r2
-         bne 1b
-@@ -157,7 +166,7 @@
-         ldmia r1, {r4-r5, r12}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r12
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-         add r0, r0, r2
-@@ -168,7 +177,7 @@
-         ldmia r1, {r4-r5, r12}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r12
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-         add r0, r0, r2
-@@ -179,7 +188,7 @@
-         ldmia r1, {r4-r5, r12}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r12
--        pld [r1]
-+        PLD ( pld [r1] )
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-         add r0, r0, r2
-@@ -198,7 +207,7 @@
- put_pixels8_x2_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r10,lr} @ R14 is also called LR
-         adr r5, 5f
-         ands r4, r1, #3
-@@ -210,7 +219,7 @@
-         ldmia r1, {r4-r5, r10}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         RND_AVG32 r8, r9, r4, r5, r6, r7, r12
-         subs r3, r3, #1
-         stmia r0, {r8-r9}
-@@ -223,7 +232,7 @@
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
-         ADJ_ALIGN_DOUBLEWORD_D 2, r8, r9, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         RND_AVG32 r4, r5, r6, r7, r8, r9, r12
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-@@ -236,7 +245,7 @@
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 2, r6, r7, r4, r5, r10
-         ADJ_ALIGN_DOUBLEWORD_D 3, r8, r9, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         RND_AVG32 r4, r5, r6, r7, r8, r9, r12
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-@@ -248,7 +257,7 @@
-         ldmia r1, {r4-r5, r10}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 3, r6, r7, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         RND_AVG32 r8, r9, r6, r7, r5, r10, r12
-         subs r3, r3, #1
-         stmia r0, {r8-r9}
-@@ -267,7 +276,7 @@
- put_no_rnd_pixels8_x2_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r10,lr} @ R14 is also called LR
-         adr r5, 5f
-         ands r4, r1, #3
-@@ -279,7 +288,7 @@
-         ldmia r1, {r4-r5, r10}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         NO_RND_AVG32 r8, r9, r4, r5, r6, r7, r12
-         subs r3, r3, #1
-         stmia r0, {r8-r9}
-@@ -292,7 +301,7 @@
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
-         ADJ_ALIGN_DOUBLEWORD_D 2, r8, r9, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         NO_RND_AVG32 r4, r5, r6, r7, r8, r9, r12
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-@@ -305,7 +314,7 @@
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 2, r6, r7, r4, r5, r10
-         ADJ_ALIGN_DOUBLEWORD_D 3, r8, r9, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         NO_RND_AVG32 r4, r5, r6, r7, r8, r9, r12
-         subs r3, r3, #1
-         stmia r0, {r4-r5}
-@@ -317,7 +326,7 @@
-         ldmia r1, {r4-r5, r10}
-         add r1, r1, r2
-         ADJ_ALIGN_DOUBLEWORD_D 3, r6, r7, r4, r5, r10
--        pld [r1]
-+        PLD ( pld [r1] )
-         NO_RND_AVG32 r8, r9, r6, r7, r5, r10, r12
-         subs r3, r3, #1
-         stmia r0, {r8-r9}
-@@ -338,7 +347,7 @@
- put_pixels8_y2_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
-         adr r5, 5f
-         ands r4, r1, #3
-@@ -352,13 +361,13 @@
-         add r1, r1, r2
- 6:      ldmia r1, {r6-r7}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         RND_AVG32 r8, r9, r4, r5, r6, r7, r12
-         ldmia r1, {r4-r5}
-         add r1, r1, r2
-         stmia r0, {r8-r9}
-         add r0, r0, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         RND_AVG32 r8, r9, r6, r7, r4, r5, r12
-         subs r3, r3, #1
-         stmia r0, {r8-r9}
-@@ -369,18 +378,18 @@
- 2:
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
- 6:      ldmia r1, {r7-r9}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 1, r7, r8, r9
-         RND_AVG32 r10, r11, r4, r5, r7, r8, r12
-         stmia r0, {r10-r11}
-         add r0, r0, r2
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
-         subs r3, r3, #1
-         RND_AVG32 r10, r11, r7, r8, r4, r5, r12
-@@ -392,18 +401,18 @@
- 3:
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
- 6:      ldmia r1, {r7-r9}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 2, r7, r8, r9
-         RND_AVG32 r10, r11, r4, r5, r7, r8, r12
-         stmia r0, {r10-r11}
-         add r0, r0, r2
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
-         subs r3, r3, #1
-         RND_AVG32 r10, r11, r7, r8, r4, r5, r12
-@@ -415,18 +424,18 @@
- 4:
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
- 6:      ldmia r1, {r7-r9}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 3, r7, r8, r9
-         RND_AVG32 r10, r11, r4, r5, r7, r8, r12
-         stmia r0, {r10-r11}
-         add r0, r0, r2
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
-         subs r3, r3, #1
-         RND_AVG32 r10, r11, r7, r8, r4, r5, r12
-@@ -447,7 +456,7 @@
- put_no_rnd_pixels8_y2_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
-         adr r5, 5f
-         ands r4, r1, #3
-@@ -461,13 +470,13 @@
-         add r1, r1, r2
- 6:      ldmia r1, {r6-r7}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         NO_RND_AVG32 r8, r9, r4, r5, r6, r7, r12
-         ldmia r1, {r4-r5}
-         add r1, r1, r2
-         stmia r0, {r8-r9}
-         add r0, r0, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         NO_RND_AVG32 r8, r9, r6, r7, r4, r5, r12
-         subs r3, r3, #1
-         stmia r0, {r8-r9}
-@@ -478,18 +487,18 @@
- 2:
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
- 6:      ldmia r1, {r7-r9}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 1, r7, r8, r9
-         NO_RND_AVG32 r10, r11, r4, r5, r7, r8, r12
-         stmia r0, {r10-r11}
-         add r0, r0, r2
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
-         subs r3, r3, #1
-         NO_RND_AVG32 r10, r11, r7, r8, r4, r5, r12
-@@ -501,18 +510,18 @@
- 3:
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
- 6:      ldmia r1, {r7-r9}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 2, r7, r8, r9
-         NO_RND_AVG32 r10, r11, r4, r5, r7, r8, r12
-         stmia r0, {r10-r11}
-         add r0, r0, r2
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
-         subs r3, r3, #1
-         NO_RND_AVG32 r10, r11, r7, r8, r4, r5, r12
-@@ -524,18 +533,18 @@
- 4:
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
- 6:      ldmia r1, {r7-r9}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 3, r7, r8, r9
-         NO_RND_AVG32 r10, r11, r4, r5, r7, r8, r12
-         stmia r0, {r10-r11}
-         add r0, r0, r2
-         ldmia r1, {r4-r6}
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
-         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
-         subs r3, r3, #1
-         NO_RND_AVG32 r10, r11, r7, r8, r4, r5, r12
-@@ -562,7 +571,7 @@
-         ldmia r1, {r8-r10}
- .endif
-         add r1, r1, r2
--        pld [r1]
-+        PLD ( pld [r1] )
- .if \align == 0
-         ADJ_ALIGN_DOUBLEWORD_D 1, r4, r5, r6, r7, r8
- .elseif \align == 1
-@@ -624,7 +633,7 @@
- put_pixels8_xy2_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
-         adrl r12, 5f
-         ands r4, r1, #3
-@@ -661,7 +670,7 @@
- put_no_rnd_pixels8_xy2_arm:
-         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
-         @ block = word aligned, pixles = unaligned
--        pld [r1]
-+        PLD ( pld [r1] )
-         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
-         adrl r12, 5f
-         ands r4, r1, #3
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c	2006-02-19 00:04:59.000000000 +0100
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c	2007-05-01 12:23:40.000000000 +0200
-@@ -2,18 +2,20 @@
-  * iWMMXt optimized DSP utils
-  * Copyright (c) 2004 AGAWA Koji
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h	2006-09-20 20:55:37.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h	2007-05-01 12:23:40.000000000 +0200
-@@ -2,18 +2,20 @@
-  * iWMMXt optimized DSP utils
-  * copyright (c) 2004 AGAWA Koji
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am	2006-09-22 06:07:23.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am	2007-05-01 12:23:40.000000000 +0200
-@@ -7,9 +7,14 @@
- iwmmxt_libs = libiwmmxt.la
- endif
- 
-+if HAVE_ARMV5TE
-+armv5te_libs = libarmv5te.la
-+endif
-+
- noinst_LTLIBRARIES = \
- 	libarmv4l.la \
--	$(iwmmxt_libs)
-+	$(iwmmxt_libs) \
-+	$(armv5te_libs)
- 
- libarmv4l_la_SOURCES = \
- 	jrevdct_arm.S \
-@@ -18,6 +23,9 @@
- 	dsputil_arm.c \
- 	mpegvideo_arm.c
- 
-+libarmv5te_la_SOURCES = \
-+	simple_idct_armv5te.S
-+
- libiwmmxt_la_SOURCES = \
- 	dsputil_iwmmxt.c \
- 	mpegvideo_iwmmxt.c
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h	2006-09-22 06:07:23.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h	2007-05-01 12:23:40.000000000 +0200
-@@ -2,18 +2,20 @@
-  * simple math operations
-  * Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at> et al
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-@@ -39,9 +41,9 @@
- #   define MAC16(rt, ra, rb) \
-         asm ("smlabb %0, %2, %3, %0" : "=r" (rt) : "0" (rt), "r" (ra), "r" (rb));
- /* signed 16x16 -> 32 multiply */
--#   define MUL16(ra, rb) \
--        ({ int __rt;\
--         asm ("smulbb %0, %1, %2" : "=r" (__rt) : "r" (ra), "r" (rb));
-+#   define MUL16(ra, rb)                                                \
-+        ({ int __rt;                                                    \
-+         asm ("smulbb %0, %1, %2" : "=r" (__rt) : "r" (ra), "r" (rb));  \
-          __rt; })
- 
- #endif
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c	2006-02-19 00:04:59.000000000 +0100
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c	2007-05-01 12:23:40.000000000 +0200
-@@ -1,25 +1,27 @@
- /*
-  * Copyright (c) 2002 Michael Niedermayer
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  *
-  */
- 
--#include "dsputil.h"
--#include "mpegvideo.h"
--#include "avcodec.h"
-+#include "../dsputil.h"
-+#include "../mpegvideo.h"
-+#include "../avcodec.h"
- 
- extern void MPV_common_init_iwmmxt(MpegEncContext *s);
- 
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c	2006-09-20 20:55:37.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c	2007-05-01 12:23:40.000000000 +0200
-@@ -1,18 +1,20 @@
- /*
-  * copyright (c) 2004 AGAWA Koji
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S	2006-09-20 20:55:37.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S	2007-05-01 12:23:40.000000000 +0200
-@@ -5,18 +5,20 @@
-  *
-  * Author: Frederic Boulay <dilb@handhelds.org>
-  *
-- * This library is free software; you can redistribute it and/or
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-  * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-+ * version 2.1 of the License, or (at your option) any later version.
-  *
-- * This library is distributed in the hope that it will be useful,
-+ * FFmpeg is distributed in the hope that it will be useful,
-  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-  * Lesser General Public License for more details.
-  *
-  * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-+ * License along with FFmpeg; if not, write to the Free Software
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  *
-  * The function defined in this file, is derived from the simple_idct function
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S	1970-01-01 01:00:00.000000000 +0100
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S	2007-05-01 12:23:40.000000000 +0200
-@@ -0,0 +1,718 @@
-+/*
-+ * Simple IDCT
-+ *
-+ * Copyright (c) 2001 Michael Niedermayer <michaelni@gmx.at>
-+ * Copyright (c) 2006 Mans Rullgard <mru@inprovide.com>
-+ *
-+ * This file is part of FFmpeg.
-+ *
-+ * FFmpeg is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2.1 of the License, or (at your option) any later version.
-+ *
-+ * FFmpeg is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with FFmpeg; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ */
-+
-+#define W1  22725   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define W2  21407   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define W3  19266   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define W4  16383   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define W5  12873   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define W6  8867    /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define W7  4520    /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
-+#define ROW_SHIFT 11
-+#define COL_SHIFT 20
-+
-+#define W13 (W1 | (W3 << 16))
-+#define W26 (W2 | (W6 << 16))
-+#define W57 (W5 | (W7 << 16))
-+
-+        .text
-+        .align
-+w13:    .long W13
-+w26:    .long W26
-+w57:    .long W57
-+
-+        .align
-+        .func idct_row_armv5te
-+idct_row_armv5te:
-+        str    lr, [sp, #-4]!
-+
-+        ldrd   v1, [a1, #8]
-+        ldrd   a3, [a1]              /* a3 = row[1:0], a4 = row[3:2] */
-+        orrs   v1, v1, v2
-+        cmpeq  v1, a4
-+        cmpeq  v1, a3, lsr #16
-+        beq    row_dc_only
-+
-+        mov    v1, #(1<<(ROW_SHIFT-1))
-+        mov    ip, #16384
-+        sub    ip, ip, #1            /* ip = W4 */
-+        smlabb v1, ip, a3, v1        /* v1 = W4*row[0]+(1<<(RS-1)) */
-+        ldr    ip, [pc, #(w26-.-8)]  /* ip = W2 | (W6 << 16) */
-+        smultb a2, ip, a4
-+        smulbb lr, ip, a4
-+        add    v2, v1, a2
-+        sub    v3, v1, a2
-+        sub    v4, v1, lr
-+        add    v1, v1, lr
-+
-+        ldr    ip, [pc, #(w13-.-8)]  /* ip = W1 | (W3 << 16) */
-+        ldr    lr, [pc, #(w57-.-8)]  /* lr = W5 | (W7 << 16) */
-+        smulbt v5, ip, a3
-+        smultt v6, lr, a4
-+        smlatt v5, ip, a4, v5
-+        smultt a2, ip, a3
-+        smulbt v7, lr, a3
-+        sub    v6, v6, a2
-+        smulbt a2, ip, a4
-+        smultt fp, lr, a3
-+        sub    v7, v7, a2
-+        smulbt a2, lr, a4
-+        ldrd   a3, [a1, #8]          /* a3=row[5:4] a4=row[7:6] */
-+        sub    fp, fp, a2
-+
-+        orrs   a2, a3, a4
-+        beq    1f
-+
-+        smlabt v5, lr, a3, v5
-+        smlabt v6, ip, a3, v6
-+        smlatt v5, lr, a4, v5
-+        smlabt v6, lr, a4, v6
-+        smlatt v7, lr, a3, v7
-+        smlatt fp, ip, a3, fp
-+        smulbt a2, ip, a4
-+        smlatt v7, ip, a4, v7
-+        sub    fp, fp, a2
-+
-+        ldr    ip, [pc, #(w26-.-8)]  /* ip = W2 | (W6 << 16) */
-+        mov    a2, #16384
-+        sub    a2, a2, #1            /* a2 =  W4 */
-+        smulbb a2, a2, a3            /* a2 =  W4*row[4] */
-+        smultb lr, ip, a4            /* lr =  W6*row[6] */
-+        add    v1, v1, a2            /* v1 += W4*row[4] */
-+        add    v1, v1, lr            /* v1 += W6*row[6] */
-+        add    v4, v4, a2            /* v4 += W4*row[4] */
-+        sub    v4, v4, lr            /* v4 -= W6*row[6] */
-+        smulbb lr, ip, a4            /* lr =  W2*row[6] */
-+        sub    v2, v2, a2            /* v2 -= W4*row[4] */
-+        sub    v2, v2, lr            /* v2 -= W2*row[6] */
-+        sub    v3, v3, a2            /* v3 -= W4*row[4] */
-+        add    v3, v3, lr            /* v3 += W2*row[6] */
-+
-+1:      add    a2, v1, v5
-+        mov    a3, a2, lsr #11
-+        bic    a3, a3, #0x1f0000
-+        sub    a2, v2, v6
-+        mov    a2, a2, lsr #11
-+        add    a3, a3, a2, lsl #16
-+        add    a2, v3, v7
-+        mov    a4, a2, lsr #11
-+        bic    a4, a4, #0x1f0000
-+        add    a2, v4, fp
-+        mov    a2, a2, lsr #11
-+        add    a4, a4, a2, lsl #16
-+        strd   a3, [a1]
-+
-+        sub    a2, v4, fp
-+        mov    a3, a2, lsr #11
-+        bic    a3, a3, #0x1f0000
-+        sub    a2, v3, v7
-+        mov    a2, a2, lsr #11
-+        add    a3, a3, a2, lsl #16
-+        add    a2, v2, v6
-+        mov    a4, a2, lsr #11
-+        bic    a4, a4, #0x1f0000
-+        sub    a2, v1, v5
-+        mov    a2, a2, lsr #11
-+        add    a4, a4, a2, lsl #16
-+        strd   a3, [a1, #8]
-+
-+        ldr    pc, [sp], #4
-+
-+row_dc_only:
-+        orr    a3, a3, a3, lsl #16
-+        bic    a3, a3, #0xe000
-+        mov    a3, a3, lsl #3
-+        mov    a4, a3
-+        strd   a3, [a1]
-+        strd   a3, [a1, #8]
-+
-+        ldr    pc, [sp], #4
-+        .endfunc
-+
-+        .macro idct_col
-+        ldr    a4, [a1]              /* a4 = col[1:0] */
-+        mov    ip, #16384
-+        sub    ip, ip, #1            /* ip = W4 */
-+#if 0
-+        mov    v1, #(1<<(COL_SHIFT-1))
-+        smlabt v2, ip, a4, v1        /* v2 = W4*col[1] + (1<<(COL_SHIFT-1)) */
-+        smlabb v1, ip, a4, v1        /* v1 = W4*col[0] + (1<<(COL_SHIFT-1)) */
-+        ldr    a4, [a1, #(16*4)]
-+#else
-+        mov    v1, #((1<<(COL_SHIFT-1))/W4) /* this matches the C version */
-+        add    v2, v1, a4, asr #16
-+        rsb    v2, v2, v2, lsl #14
-+        mov    a4, a4, lsl #16
-+        add    v1, v1, a4, asr #16
-+        ldr    a4, [a1, #(16*4)]
-+        rsb    v1, v1, v1, lsl #14
-+#endif
-+
-+        smulbb lr, ip, a4
-+        smulbt a3, ip, a4
-+        sub    v3, v1, lr
-+        sub    v5, v1, lr
-+        add    v7, v1, lr
-+        add    v1, v1, lr
-+        sub    v4, v2, a3
-+        sub    v6, v2, a3
-+        add    fp, v2, a3
-+        ldr    ip, [pc, #(w26-.-8)]
-+        ldr    a4, [a1, #(16*2)]
-+        add    v2, v2, a3
-+
-+        smulbb lr, ip, a4
-+        smultb a3, ip, a4
-+        add    v1, v1, lr
-+        sub    v7, v7, lr
-+        add    v3, v3, a3
-+        sub    v5, v5, a3
-+        smulbt lr, ip, a4
-+        smultt a3, ip, a4
-+        add    v2, v2, lr
-+        sub    fp, fp, lr
-+        add    v4, v4, a3
-+        ldr    a4, [a1, #(16*6)]
-+        sub    v6, v6, a3
-+
-+        smultb lr, ip, a4
-+        smulbb a3, ip, a4
-+        add    v1, v1, lr
-+        sub    v7, v7, lr
-+        sub    v3, v3, a3
-+        add    v5, v5, a3
-+        smultt lr, ip, a4
-+        smulbt a3, ip, a4
-+        add    v2, v2, lr
-+        sub    fp, fp, lr
-+        sub    v4, v4, a3
-+        add    v6, v6, a3
-+
-+        stmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp}
-+
-+        ldr    ip, [pc, #(w13-.-8)]
-+        ldr    a4, [a1, #(16*1)]
-+        ldr    lr, [pc, #(w57-.-8)]
-+        smulbb v1, ip, a4
-+        smultb v3, ip, a4
-+        smulbb v5, lr, a4
-+        smultb v7, lr, a4
-+        smulbt v2, ip, a4
-+        smultt v4, ip, a4
-+        smulbt v6, lr, a4
-+        smultt fp, lr, a4
-+        rsb    v4, v4, #0
-+        ldr    a4, [a1, #(16*3)]
-+        rsb    v3, v3, #0
-+
-+        smlatb v1, ip, a4, v1
-+        smlatb v3, lr, a4, v3
-+        smulbb a3, ip, a4
-+        smulbb a2, lr, a4
-+        sub    v5, v5, a3
-+        sub    v7, v7, a2
-+        smlatt v2, ip, a4, v2
-+        smlatt v4, lr, a4, v4
-+        smulbt a3, ip, a4
-+        smulbt a2, lr, a4
-+        sub    v6, v6, a3
-+        ldr    a4, [a1, #(16*5)]
-+        sub    fp, fp, a2
-+
-+        smlabb v1, lr, a4, v1
-+        smlabb v3, ip, a4, v3
-+        smlatb v5, lr, a4, v5
-+        smlatb v7, ip, a4, v7
-+        smlabt v2, lr, a4, v2
-+        smlabt v4, ip, a4, v4
-+        smlatt v6, lr, a4, v6
-+        ldr    a3, [a1, #(16*7)]
-+        smlatt fp, ip, a4, fp
-+
-+        smlatb v1, lr, a3, v1
-+        smlabb v3, lr, a3, v3
-+        smlatb v5, ip, a3, v5
-+        smulbb a4, ip, a3
-+        smlatt v2, lr, a3, v2
-+        sub    v7, v7, a4
-+        smlabt v4, lr, a3, v4
-+        smulbt a4, ip, a3
-+        smlatt v6, ip, a3, v6
-+        sub    fp, fp, a4
-+        .endm
-+
-+        .align
-+        .func idct_col_armv5te
-+idct_col_armv5te:
-+        str    lr, [sp, #-4]!
-+
-+        idct_col
-+
-+        ldmfd  sp!, {a3, a4}
-+        adds   a2, a3, v1
-+        mov    a2, a2, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        add    ip, a4, v2
-+        mov    ip, ip, asr #20
-+        orr    a2, a2, ip, lsl #16
-+        str    a2, [a1]
-+        subs   a3, a3, v1
-+        mov    a2, a3, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        sub    a4, a4, v2
-+        mov    a4, a4, asr #20
-+        orr    a2, a2, a4, lsl #16
-+        ldmfd  sp!, {a3, a4}
-+        str    a2, [a1, #(16*7)]
-+
-+        subs   a2, a3, v3
-+        mov    a2, a2, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        sub    ip, a4, v4
-+        mov    ip, ip, asr #20
-+        orr    a2, a2, ip, lsl #16
-+        str    a2, [a1, #(16*1)]
-+        adds   a3, a3, v3
-+        mov    a2, a3, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        add    a4, a4, v4
-+        mov    a4, a4, asr #20
-+        orr    a2, a2, a4, lsl #16
-+        ldmfd  sp!, {a3, a4}
-+        str    a2, [a1, #(16*6)]
-+
-+        adds   a2, a3, v5
-+        mov    a2, a2, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        add    ip, a4, v6
-+        mov    ip, ip, asr #20
-+        orr    a2, a2, ip, lsl #16
-+        str    a2, [a1, #(16*2)]
-+        subs   a3, a3, v5
-+        mov    a2, a3, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        sub    a4, a4, v6
-+        mov    a4, a4, asr #20
-+        orr    a2, a2, a4, lsl #16
-+        ldmfd  sp!, {a3, a4}
-+        str    a2, [a1, #(16*5)]
-+
-+        adds   a2, a3, v7
-+        mov    a2, a2, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        add    ip, a4, fp
-+        mov    ip, ip, asr #20
-+        orr    a2, a2, ip, lsl #16
-+        str    a2, [a1, #(16*3)]
-+        subs   a3, a3, v7
-+        mov    a2, a3, lsr #20
-+        orrmi  a2, a2, #0xf000
-+        sub    a4, a4, fp
-+        mov    a4, a4, asr #20
-+        orr    a2, a2, a4, lsl #16
-+        str    a2, [a1, #(16*4)]
-+
-+        ldr    pc, [sp], #4
-+        .endfunc
-+
-+        .align
-+        .func idct_col_put_armv5te
-+idct_col_put_armv5te:
-+        str    lr, [sp, #-4]!
-+
-+        idct_col
-+
-+        ldmfd  sp!, {a3, a4}
-+        ldr    lr, [sp, #32]
-+        add    a2, a3, v1
-+        movs   a2, a2, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    ip, a4, v2
-+        movs   ip, ip, asr #20
-+        movmi  ip, #0
-+        cmp    ip, #255
-+        movgt  ip, #255
-+        orr    a2, a2, ip, lsl #8
-+        sub    a3, a3, v1
-+        movs   a3, a3, asr #20
-+        movmi  a3, #0
-+        cmp    a3, #255
-+        movgt  a3, #255
-+        sub    a4, a4, v2
-+        movs   a4, a4, asr #20
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        ldr    v1, [sp, #28]
-+        movgt  a4, #255
-+        strh   a2, [v1]
-+        add    a2, v1, #2
-+        str    a2, [sp, #28]
-+        orr    a2, a3, a4, lsl #8
-+        rsb    v2, lr, lr, lsl #3
-+        ldmfd  sp!, {a3, a4}
-+        strh   a2, [v2, v1]!
-+
-+        sub    a2, a3, v3
-+        movs   a2, a2, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        sub    ip, a4, v4
-+        movs   ip, ip, asr #20
-+        movmi  ip, #0
-+        cmp    ip, #255
-+        movgt  ip, #255
-+        orr    a2, a2, ip, lsl #8
-+        strh   a2, [v1, lr]!
-+        add    a3, a3, v3
-+        movs   a2, a3, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    a4, a4, v4
-+        movs   a4, a4, asr #20
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        orr    a2, a2, a4, lsl #8
-+        ldmfd  sp!, {a3, a4}
-+        strh   a2, [v2, -lr]!
-+
-+        add    a2, a3, v5
-+        movs   a2, a2, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    ip, a4, v6
-+        movs   ip, ip, asr #20
-+        movmi  ip, #0
-+        cmp    ip, #255
-+        movgt  ip, #255
-+        orr    a2, a2, ip, lsl #8
-+        strh   a2, [v1, lr]!
-+        sub    a3, a3, v5
-+        movs   a2, a3, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        sub    a4, a4, v6
-+        movs   a4, a4, asr #20
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        orr    a2, a2, a4, lsl #8
-+        ldmfd  sp!, {a3, a4}
-+        strh   a2, [v2, -lr]!
-+
-+        add    a2, a3, v7
-+        movs   a2, a2, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    ip, a4, fp
-+        movs   ip, ip, asr #20
-+        movmi  ip, #0
-+        cmp    ip, #255
-+        movgt  ip, #255
-+        orr    a2, a2, ip, lsl #8
-+        strh   a2, [v1, lr]
-+        sub    a3, a3, v7
-+        movs   a2, a3, asr #20
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        sub    a4, a4, fp
-+        movs   a4, a4, asr #20
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        orr    a2, a2, a4, lsl #8
-+        strh   a2, [v2, -lr]
-+
-+        ldr    pc, [sp], #4
-+        .endfunc
-+
-+        .align
-+        .func idct_col_add_armv5te
-+idct_col_add_armv5te:
-+        str    lr, [sp, #-4]!
-+
-+        idct_col
-+
-+        ldr    lr, [sp, #36]
-+
-+        ldmfd  sp!, {a3, a4}
-+        ldrh   ip, [lr]
-+        add    a2, a3, v1
-+        mov    a2, a2, asr #20
-+        sub    a3, a3, v1
-+        and    v1, ip, #255
-+        adds   a2, a2, v1
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    v1, a4, v2
-+        mov    v1, v1, asr #20
-+        adds   v1, v1, ip, lsr #8
-+        movmi  v1, #0
-+        cmp    v1, #255
-+        movgt  v1, #255
-+        orr    a2, a2, v1, lsl #8
-+        ldr    v1, [sp, #32]
-+        sub    a4, a4, v2
-+        rsb    v2, v1, v1, lsl #3
-+        ldrh   ip, [v2, lr]!
-+        strh   a2, [lr]
-+        mov    a3, a3, asr #20
-+        and    a2, ip, #255
-+        adds   a3, a3, a2
-+        movmi  a3, #0
-+        cmp    a3, #255
-+        movgt  a3, #255
-+        mov    a4, a4, asr #20
-+        adds   a4, a4, ip, lsr #8
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        add    a2, lr, #2
-+        str    a2, [sp, #28]
-+        orr    a2, a3, a4, lsl #8
-+        strh   a2, [v2]
-+
-+        ldmfd  sp!, {a3, a4}
-+        ldrh   ip, [lr, v1]!
-+        sub    a2, a3, v3
-+        mov    a2, a2, asr #20
-+        add    a3, a3, v3
-+        and    v3, ip, #255
-+        adds   a2, a2, v3
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        sub    v3, a4, v4
-+        mov    v3, v3, asr #20
-+        adds   v3, v3, ip, lsr #8
-+        movmi  v3, #0
-+        cmp    v3, #255
-+        movgt  v3, #255
-+        orr    a2, a2, v3, lsl #8
-+        add    a4, a4, v4
-+        ldrh   ip, [v2, -v1]!
-+        strh   a2, [lr]
-+        mov    a3, a3, asr #20
-+        and    a2, ip, #255
-+        adds   a3, a3, a2
-+        movmi  a3, #0
-+        cmp    a3, #255
-+        movgt  a3, #255
-+        mov    a4, a4, asr #20
-+        adds   a4, a4, ip, lsr #8
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        orr    a2, a3, a4, lsl #8
-+        strh   a2, [v2]
-+
-+        ldmfd  sp!, {a3, a4}
-+        ldrh   ip, [lr, v1]!
-+        add    a2, a3, v5
-+        mov    a2, a2, asr #20
-+        sub    a3, a3, v5
-+        and    v3, ip, #255
-+        adds   a2, a2, v3
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    v3, a4, v6
-+        mov    v3, v3, asr #20
-+        adds   v3, v3, ip, lsr #8
-+        movmi  v3, #0
-+        cmp    v3, #255
-+        movgt  v3, #255
-+        orr    a2, a2, v3, lsl #8
-+        sub    a4, a4, v6
-+        ldrh   ip, [v2, -v1]!
-+        strh   a2, [lr]
-+        mov    a3, a3, asr #20
-+        and    a2, ip, #255
-+        adds   a3, a3, a2
-+        movmi  a3, #0
-+        cmp    a3, #255
-+        movgt  a3, #255
-+        mov    a4, a4, asr #20
-+        adds   a4, a4, ip, lsr #8
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        orr    a2, a3, a4, lsl #8
-+        strh   a2, [v2]
-+
-+        ldmfd  sp!, {a3, a4}
-+        ldrh   ip, [lr, v1]!
-+        add    a2, a3, v7
-+        mov    a2, a2, asr #20
-+        sub    a3, a3, v7
-+        and    v3, ip, #255
-+        adds   a2, a2, v3
-+        movmi  a2, #0
-+        cmp    a2, #255
-+        movgt  a2, #255
-+        add    v3, a4, fp
-+        mov    v3, v3, asr #20
-+        adds   v3, v3, ip, lsr #8
-+        movmi  v3, #0
-+        cmp    v3, #255
-+        movgt  v3, #255
-+        orr    a2, a2, v3, lsl #8
-+        sub    a4, a4, fp
-+        ldrh   ip, [v2, -v1]!
-+        strh   a2, [lr]
-+        mov    a3, a3, asr #20
-+        and    a2, ip, #255
-+        adds   a3, a3, a2
-+        movmi  a3, #0
-+        cmp    a3, #255
-+        movgt  a3, #255
-+        mov    a4, a4, asr #20
-+        adds   a4, a4, ip, lsr #8
-+        movmi  a4, #0
-+        cmp    a4, #255
-+        movgt  a4, #255
-+        orr    a2, a3, a4, lsl #8
-+        strh   a2, [v2]
-+
-+        ldr    pc, [sp], #4
-+        .endfunc
-+
-+        .align
-+        .global simple_idct_armv5te
-+        .func simple_idct_armv5te
-+simple_idct_armv5te:
-+        stmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, lr}
-+
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+
-+        sub    a1, a1, #(16*7)
-+
-+        bl     idct_col_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_armv5te
-+
-+        ldmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, pc}
-+        .endfunc
-+
-+        .align
-+        .global simple_idct_add_armv5te
-+        .func simple_idct_add_armv5te
-+simple_idct_add_armv5te:
-+        stmfd  sp!, {a1, a2, v1, v2, v3, v4, v5, v6, v7, fp, lr}
-+
-+        mov    a1, a3
-+
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+
-+        sub    a1, a1, #(16*7)
-+
-+        bl     idct_col_add_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_add_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_add_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_add_armv5te
-+
-+        add    sp, sp, #8
-+        ldmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, pc}
-+        .endfunc
-+
-+        .align
-+        .global simple_idct_put_armv5te
-+        .func simple_idct_put_armv5te
-+simple_idct_put_armv5te:
-+        stmfd  sp!, {a1, a2, v1, v2, v3, v4, v5, v6, v7, fp, lr}
-+
-+        mov    a1, a3
-+
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+        add    a1, a1, #16
-+        bl     idct_row_armv5te
-+
-+        sub    a1, a1, #(16*7)
-+
-+        bl     idct_col_put_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_put_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_put_armv5te
-+        add    a1, a1, #4
-+        bl     idct_col_put_armv5te
-+
-+        add    sp, sp, #8
-+        ldmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, pc}
-+        .endfunc
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/avcodec.h gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/avcodec.h
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/avcodec.h	2006-09-20 20:55:36.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/avcodec.h	2007-05-01 12:23:40.000000000 +0200
-@@ -1217,6 +1217,7 @@
- #define FF_IDCT_IPP          13
- #define FF_IDCT_XVIDMMX      14
- #define FF_IDCT_CAVS         15
-+#define FF_IDCT_SIMPLEARMV5TE 16
- 
-     /**
-      * slice count.
-diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/Makefile.am gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/Makefile.am
---- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/Makefile.am	2006-09-22 06:07:23.000000000 +0200
-+++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/Makefile.am	2007-05-01 12:23:40.000000000 +0200
-@@ -19,7 +19,10 @@
- if HAVE_IWMMXT
- iwmmxt_libs = armv4l/libiwmmxt.la
- endif
--armv4l_libs = armv4l/libarmv4l.la $(iwmmxt_libs)
-+if HAVE_ARMV5TE
-+armv5te_libs = armv4l/libarmv5te.la
-+endif
-+armv4l_libs = armv4l/libarmv4l.la $(iwmmxt_libs) $(armv5te_libs)
- armv4l_dirs = armv4l
- endif
- 
diff --git a/recipes/gstreamer/gst-ffmpeg/autotools.patch b/recipes/gstreamer/gst-ffmpeg/autotools.patch
deleted file mode 100644
index 76e7ac6..0000000
--- a/recipes/gstreamer/gst-ffmpeg/autotools.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac
-===================================================================
---- gst-ffmpeg-0.10.2.orig/gst-libs/ext/ffmpeg/configure.ac	2008-08-20 00:20:19.177850039 +0200
-+++ gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac	2008-08-20 00:26:24.567809464 +0200
-@@ -27,13 +27,15 @@
- 
- AM_MAINTAINER_MODE
- AC_GNU_SOURCE
-+
-+AC_PROG_LIBTOOL
- AM_PROG_AS
- AC_PROG_CC
-+AC_PROG_CXX
- AC_PROG_INSTALL
- AC_SYS_LARGEFILE
- AC_STDC_HEADERS
- AM_DISABLE_STATIC
--AC_PROG_LIBTOOL
- 
- dnl Warning for anyone using these custom macros.
- dnl before asking me questions on why it doesn't work and why you
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.2.bb b/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
deleted file mode 100644
index 5164bbd..0000000
--- a/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-PRIORITY = "optional"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer gst-plugins-base zlib"
-PR = "r2"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
-	   file://armv5.patch \
-	   file://autotools.patch \
-          "
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
-		--disable-vorbis --disable-vorbistest --disable-encoders \
-		--disable-v4l --disable-audio-oss --disable-dv1394 \
-		--disable-vhook --disable-ffmpeg --disable-ffserver \
-		--enable-pp --disable-decoder-vorbis"
-
-# We do this because the install program is called with -s which causes it to
-# call "strip" and it then mangles cross compiled stuff..
-PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
-
-
-SRC_URI[md5sum] = "3c7fb1cd1308b1972a76b86bb29fc890"
-SRC_URI[sha256sum] = "ffa7c89bccab5d1be53b6fcedcf7a5c071d585cf522fee5864add05d350f5842"
diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.20.bb b/recipes/gstreamer/gst-plugins-bad_0.10.20.bb
deleted file mode 100644
index 17f20eb..0000000
--- a/recipes/gstreamer/gst-plugins-bad_0.10.20.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI[archive.md5sum] = "7c84766f6d24f41ba90c3f6141012ab8"
-SRC_URI[archive.sha256sum] = "1031dff866df976a957f34039addbab4c0753406299a275f4cf1780e1dbe2a90"
-
-DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb libmodplug librsvg"
-
-PR = "${INC_PR}.2"
-
-# We don't have vdpau headers in OE and it creates crosscompile badness.
-# Also, mpeg2enc and mplex from mjpegtools don't build, because of AC_TRY_RUN.
-EXTRA_OECONF += " \
-        --disable-mpeg2enc \
-        --disable-mplex \
-        --disable-vdpau \
-"
diff --git a/recipes/gstreamer/gst-plugins-base/fix-playbin2.patch b/recipes/gstreamer/gst-plugins-base/fix-playbin2.patch
deleted file mode 100644
index 8aba3b6..0000000
--- a/recipes/gstreamer/gst-plugins-base/fix-playbin2.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0fe6b6e8abb131471d5bd04d7f7e27ca98a67659 Mon Sep 17 00:00:00 2001
-From: Brijesh Singh <brijesh.ksingh@gmail.com>
-Date: Wed, 13 Jan 2010 08:39:54 +0000
-Subject: playsink: Fix handling of the native audio/video flags
-
-Fixes bug #606687.
----
-
---- /tmp/gstplaysink.c	2010-01-23 12:23:20.000000000 +0100
-+++ gst-plugins-base-0.10.25/gst/playback/gstplaysink.c	2010-01-23 12:27:51.000000000 +0100
-@@ -1880,12 +1880,13 @@
-      * pick one and ignore the other then instead of erroring out?) */
-     if (need_text && need_subp)
-       goto subs_and_text;
--  } else if (flags & GST_PLAY_FLAG_VIDEO && playsink->video_pad) {
-+  } else if (((flags & GST_PLAY_FLAG_VIDEO)
-+          || (flags & GST_PLAY_FLAG_NATIVE_VIDEO)) && playsink->video_pad) {
-     /* we have video and we are requested to show it */
-     need_video = TRUE;
-   }
-   if (playsink->audio_pad) {
--    if (flags & GST_PLAY_FLAG_AUDIO) {
-+    if ((flags & GST_PLAY_FLAG_AUDIO) || (flags & GST_PLAY_FLAG_NATIVE_AUDIO)) {
-       need_audio = TRUE;
-     }
-     if (playsink->audio_pad_raw) {
diff --git a/recipes/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch b/recipes/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch
deleted file mode 100644
index 3c0cffa..0000000
--- a/recipes/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch
+++ /dev/null
@@ -1,1577 +0,0 @@
-From 32a7af0874fe13774c65919941c3be59b72c646a Mon Sep 17 00:00:00 2001
-From: Rob Clark <rob@ti.com>
-Date: Thu, 30 Jul 2009 14:50:05 -0500
-Subject: [PATCH] add rowstride support to video utility functions
-
-This is a combination of 7 commits:
-* add rowstride support to video utility functions
-* stridetransform: skeletal implementation of stridetransform element
-* stridetransform: implement caps negotiation and related parts
-* stridetransform: implement transform function
-* audioconvert: add NEON acceleration for some conversions
-* add gst_stride_transform_transform_size()
-* fix a small typo..  need to use the smaller of {new_width, orig_width} for the line-by-line copy to avoid overwriting past end of buffer
----
- configure.ac                        |    2 +
- gst-libs/gst/video/gstvideofilter.c |    8 +-
- gst-libs/gst/video/video.c          |  234 +++++++++++++++---
- gst-libs/gst/video/video.h          |   39 ++-
- gst/audioconvert/Makefile.am        |    1 +
- gst/audioconvert/armv7.c            |  209 ++++++++++++++++
- gst/audioconvert/audioconvert.c     |   20 +-
- gst/audioconvert/gstaudioquantize.c |    4 +-
- gst/audioconvert/gstchannelmix.c    |    4 +-
- gst/stride/Makefile.am              |   15 ++
- gst/stride/gststridetransform.c     |  471 +++++++++++++++++++++++++++++++++++
- gst/stride/gststridetransform.h     |   80 ++++++
- gst/stride/plugin.c                 |   45 ++++
- 13 files changed, 1064 insertions(+), 68 deletions(-)
- create mode 100644 gst/audioconvert/armv7.c
- create mode 100644 gst/stride/Makefile.am
- create mode 100644 gst/stride/gststridetransform.c
- create mode 100644 gst/stride/gststridetransform.h
- create mode 100644 gst/stride/plugin.c
-
-diff --git a/configure.ac b/configure.ac
-index 6a39c73..5da8ac2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -319,6 +319,7 @@ AG_GST_CHECK_PLUGIN(ffmpegcolorspace)
- AG_GST_CHECK_PLUGIN(gdp)
- AG_GST_CHECK_PLUGIN(playback)
- AG_GST_CHECK_PLUGIN(audioresample)
-+AG_GST_CHECK_PLUGIN(stride)
- AG_GST_CHECK_PLUGIN(subparse)
- AG_GST_CHECK_PLUGIN(tcp)
- AG_GST_CHECK_PLUGIN(typefind)
-@@ -739,6 +740,7 @@ gst/ffmpegcolorspace/Makefile
- gst/gdp/Makefile
- gst/playback/Makefile
- gst/audioresample/Makefile
-+gst/stride/Makefile
- gst/subparse/Makefile
- gst/tcp/Makefile
- gst/typefind/Makefile
-diff --git a/gst-libs/gst/video/gstvideofilter.c b/gst-libs/gst/video/gstvideofilter.c
-index 2d08a60..6b2d7b7 100644
---- a/gst-libs/gst/video/gstvideofilter.c
-+++ b/gst-libs/gst/video/gstvideofilter.c
-@@ -21,7 +21,7 @@
-  /**
-  * SECTION:gstvideofilter
-  * @short_description: Base class for video filters
-- * 
-+ *
-  * <refsect2>
-  * <para>
-  * Provides useful functions and a base class for video filters.
-@@ -78,14 +78,14 @@ gst_video_filter_get_unit_size (GstBaseTransform * btrans, GstCaps * caps,
-     guint * size)
- {
-   GstVideoFormat fmt;
--  gint width, height;
-+  gint width, height, rowstride;
- 
--  if (!gst_video_format_parse_caps (caps, &fmt, &width, &height)) {
-+  if (!gst_video_format_parse_caps_strided (caps, &fmt, &width, &height, &rowstride)) {
-     GST_WARNING_OBJECT (btrans, "Failed to parse caps %" GST_PTR_FORMAT, caps);
-     return FALSE;
-   }
- 
--  *size = gst_video_format_get_size (fmt, width, height);
-+  *size = gst_video_format_get_size_strided (fmt, width, height, rowstride);
- 
-   GST_DEBUG_OBJECT (btrans, "Returning size %u bytes for caps %"
-       GST_PTR_FORMAT, *size, caps);
-diff --git a/gst-libs/gst/video/video.c b/gst-libs/gst/video/video.c
-index ab1d8c0..1815bf1 100644
---- a/gst-libs/gst/video/video.c
-+++ b/gst-libs/gst/video/video.c
-@@ -31,7 +31,7 @@
-  *
-  * <refsect2>
-  * <para>
-- * This library contains some helper functions and includes the 
-+ * This library contains some helper functions and includes the
-  * videosink and videofilter base classes.
-  * </para>
-  * </refsect2>
-@@ -51,7 +51,7 @@ static GstVideoFormat gst_video_format_from_rgb24_masks (int red_mask,
-  *
-  * A convenience function to retrieve a GValue holding the framerate
-  * from the caps on a pad.
-- * 
-+ *
-  * The pad needs to have negotiated caps containing a framerate property.
-  *
-  * Returns: NULL if the pad has no configured caps or the configured caps
-@@ -104,7 +104,7 @@ gst_video_frame_rate (GstPad * pad)
-  *
-  * Inspect the caps of the provided pad and retrieve the width and height of
-  * the video frames it is configured for.
-- * 
-+ *
-  * The pad needs to have negotiated caps containing width and height properties.
-  *
-  * Returns: TRUE if the width and height could be retrieved.
-@@ -156,13 +156,13 @@ gst_video_get_size (GstPad * pad, gint * width, gint * height)
-  * @display_par_n: Numerator of the pixel aspect ratio of the display device
-  * @display_par_d: Denominator of the pixel aspect ratio of the display device
-  *
-- * Given the Pixel Aspect Ratio and size of an input video frame, and the 
-- * pixel aspect ratio of the intended display device, calculates the actual 
-+ * Given the Pixel Aspect Ratio and size of an input video frame, and the
-+ * pixel aspect ratio of the intended display device, calculates the actual
-  * display ratio the video will be rendered with.
-  *
-- * Returns: A boolean indicating success and a calculated Display Ratio in the 
-- * dar_n and dar_d parameters. 
-- * The return value is FALSE in the case of integer overflow or other error. 
-+ * Returns: A boolean indicating success and a calculated Display Ratio in the
-+ * dar_n and dar_d parameters.
-+ * The return value is FALSE in the case of integer overflow or other error.
-  *
-  * Since: 0.10.7
-  */
-@@ -250,28 +250,15 @@ gst_video_format_parse_caps_interlaced (GstCaps * caps, gboolean * interlaced)
- }
- 
- /**
-- * gst_video_format_parse_caps:
-- * @caps: the #GstCaps to parse
-- * @format: the #GstVideoFormat of the video represented by @caps (output)
-- * @width: the width of the video represented by @caps, may be NULL (output)
-- * @height: the height of the video represented by @caps, may be NULL (output)
-- *
-- * Determines the #GstVideoFormat of @caps and places it in the location
-- * pointed to by @format.  Extracts the size of the video and places it
-- * in the location pointed to by @width and @height.  If @caps does not
-- * represent one of the raw video formats listed in #GstVideoFormat, the
-- * function will fail and return FALSE.
-- *
-- * Since: 0.10.16
-- *
-- * Returns: TRUE if @caps was parsed correctly.
-+ * see gst_video_format_parse_caps_strided and gst_video_format_parse_caps
-  */
--gboolean
--gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
--    int *width, int *height)
-+static gboolean
-+parse_caps (GstCaps * caps, GstVideoFormat * format, gint *width, gint *height,
-+    gboolean stride_ok, gint *rowstride)
- {
-   GstStructure *structure;
-   gboolean ok = TRUE;
-+  gboolean strided = FALSE;
- 
-   if (!gst_caps_is_fixed (caps))
-     return FALSE;
-@@ -279,7 +266,10 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
-   structure = gst_caps_get_structure (caps, 0);
- 
-   if (format) {
--    if (gst_structure_has_name (structure, "video/x-raw-yuv")) {
-+    if (gst_structure_has_name (structure, "video/x-raw-yuv") ||
-+        (stride_ok &&
-+            gst_structure_has_name (structure, "video/x-raw-yuv-strided") &&
-+            (strided=TRUE) /* single '=' intentional */)) {
-       guint32 fourcc;
- 
-       ok &= gst_structure_get_fourcc (structure, "format", &fourcc);
-@@ -288,7 +278,10 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
-       if (*format == GST_VIDEO_FORMAT_UNKNOWN) {
-         ok = FALSE;
-       }
--    } else if (gst_structure_has_name (structure, "video/x-raw-rgb")) {
-+    } else if (gst_structure_has_name (structure, "video/x-raw-rgb") ||
-+        (stride_ok &&
-+            gst_structure_has_name (structure, "video/x-raw-rgb-strided") &&
-+            (strided=TRUE) /* single '=' intentional */)) {
-       int depth;
-       int bpp;
-       int endianness;
-@@ -333,6 +326,10 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
-     }
-   }
- 
-+  /* note: should we require that the caps have these fields, even if
-+   * the caller does not particularly request them??
-+   */
-+
-   if (width) {
-     ok &= gst_structure_get_int (structure, "width", width);
-   }
-@@ -341,11 +338,70 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
-     ok &= gst_structure_get_int (structure, "height", height);
-   }
- 
-+  if (rowstride) {
-+    if (strided) {
-+      ok &= gst_structure_get_int (structure, "rowstride", rowstride);
-+    } else {
-+      *rowstride = 0;  /* not a strided format */
-+    }
-+  }
-+
-   return ok;
- }
- 
- 
- /**
-+ * gst_video_format_parse_caps_strided:
-+ * @caps: the #GstCaps to parse
-+ * @format: the #GstVideoFormat of the video represented by @caps (output)
-+ * @width: the width of the video represented by @caps, may be NULL (output)
-+ * @height: the height of the video represented by @caps, may be NULL (output)
-+ * @rowstride: the rowstride (in bytes) represented by @caps, or 0 if there
-+ *    is no rowstride, may be NULL (output)
-+ *
-+ * Determines the #GstVideoFormat of @caps and places it in the location
-+ * pointed to by @format.  Extracts the size of the video and places it
-+ * in the location pointed to by @width and @height.  Extracts the row-
-+ * stride and places it in the location pointed to by @rowstride.  If
-+ * @caps does not represent one of the raw video formats listed in
-+ * #GstVideoFormat, the function will fail and return FALSE.
-+ *
-+ * Since: ???
-+ *
-+ * Returns: TRUE if @caps was parsed correctly.
-+ */
-+gboolean
-+gst_video_format_parse_caps_strided (GstCaps * caps, GstVideoFormat * format,
-+    int *width, int *height, int *rowstride)
-+{
-+  return parse_caps (caps, format, width, height, TRUE, rowstride);
-+}
-+
-+/**
-+ * gst_video_format_parse_caps:
-+ * @caps: the #GstCaps to parse
-+ * @format: the #GstVideoFormat of the video represented by @caps (output)
-+ * @width: the width of the video represented by @caps, may be NULL (output)
-+ * @height: the height of the video represented by @caps, may be NULL (output)
-+ *
-+ * Determines the #GstVideoFormat of @caps and places it in the location
-+ * pointed to by @format.  Extracts the size of the video and places it
-+ * in the location pointed to by @width and @height.  If @caps does not
-+ * represent one of the raw video formats listed in #GstVideoFormat, the
-+ * function will fail and return FALSE.
-+ *
-+ * Since: 0.10.16
-+ *
-+ * Returns: TRUE if @caps was parsed correctly.
-+ */
-+gboolean
-+gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
-+    int *width, int *height)
-+{
-+  return parse_caps (caps, format, width, height, FALSE, NULL);
-+}
-+
-+/**
-  * gst_video_parse_caps_framerate:
-  * @caps: pointer to a #GstCaps instance
-  * @fps_n: pointer to integer to hold numerator of frame rate (output)
-@@ -444,10 +500,11 @@ gst_video_format_new_caps_interlaced (GstVideoFormat format, int width,
- }
- 
- /**
-- * gst_video_format_new_caps:
-+ * gst_video_format_new_caps_strided:
-  * @format: the #GstVideoFormat describing the raw video format
-  * @width: width of video
-  * @height: height of video
-+ * @rowstride: the rowstride (in bytes), or 0 if no rowstride
-  * @framerate_n: numerator of frame rate
-  * @framerate_d: denominator of frame rate
-  * @par_n: numerator of pixel aspect ratio
-@@ -455,26 +512,29 @@ gst_video_format_new_caps_interlaced (GstVideoFormat format, int width,
-  *
-  * Creates a new #GstCaps object based on the parameters provided.
-  *
-- * Since: 0.10.16
-+ * Since: ???
-  *
-  * Returns: a new #GstCaps object, or NULL if there was an error
-  */
- GstCaps *
--gst_video_format_new_caps (GstVideoFormat format, int width, int height,
-+gst_video_format_new_caps_strided (GstVideoFormat format,
-+    int width, int height, int rowstride,
-     int framerate_n, int framerate_d, int par_n, int par_d)
- {
-+  GstCaps *caps = NULL;
-+
-   g_return_val_if_fail (format != GST_VIDEO_FORMAT_UNKNOWN, NULL);
-   g_return_val_if_fail (width > 0 && height > 0, NULL);
- 
-   if (gst_video_format_is_yuv (format)) {
--    return gst_caps_new_simple ("video/x-raw-yuv",
-+    caps = gst_caps_new_simple (
-+        rowstride ? "video/x-raw-yuv-strided" : "video/x-raw-yuv",
-         "format", GST_TYPE_FOURCC, gst_video_format_to_fourcc (format),
-         "width", G_TYPE_INT, width,
-         "height", G_TYPE_INT, height,
-         "framerate", GST_TYPE_FRACTION, framerate_n, framerate_d,
-         "pixel-aspect-ratio", GST_TYPE_FRACTION, par_n, par_d, NULL);
--  }
--  if (gst_video_format_is_rgb (format)) {
-+  } else if (gst_video_format_is_rgb (format)) {
-     GstCaps *caps;
-     int red_mask;
-     int blue_mask;
-@@ -526,7 +586,8 @@ gst_video_format_new_caps (GstVideoFormat format, int width, int height,
-         mask >> (8 * gst_video_format_get_component_offset (format, 2, width,
-             height));
- 
--    caps = gst_caps_new_simple ("video/x-raw-rgb",
-+    caps = gst_caps_new_simple (
-+        rowstride ? "video/x-raw-rgb-strided" : "video/x-raw-rgb",
-         "bpp", G_TYPE_INT, bpp,
-         "depth", G_TYPE_INT, depth,
-         "endianness", G_TYPE_INT, G_BIG_ENDIAN,
-@@ -543,9 +604,39 @@ gst_video_format_new_caps (GstVideoFormat format, int width, int height,
-               height));
-       gst_caps_set_simple (caps, "alpha_mask", G_TYPE_INT, alpha_mask, NULL);
-     }
--    return caps;
-+  } else {
-+    return NULL;
-+  }
-+
-+  if (rowstride) {
-+    gst_caps_set_simple (caps, "rowstride", G_TYPE_INT, rowstride, NULL);
-   }
--  return NULL;
-+
-+  return caps;
-+}
-+
-+/**
-+ * gst_video_format_new_caps:
-+ * @format: the #GstVideoFormat describing the raw video format
-+ * @width: width of video
-+ * @height: height of video
-+ * @framerate_n: numerator of frame rate
-+ * @framerate_d: denominator of frame rate
-+ * @par_n: numerator of pixel aspect ratio
-+ * @par_d: denominator of pixel aspect ratio
-+ *
-+ * Creates a new #GstCaps object based on the parameters provided.
-+ *
-+ * Since: 0.10.16
-+ *
-+ * Returns: a new #GstCaps object, or NULL if there was an error
-+ */
-+GstCaps *
-+gst_video_format_new_caps (GstVideoFormat format, int width, int height,
-+    int framerate_n, int framerate_d, int par_n, int par_d)
-+{
-+  return gst_video_format_new_caps_strided (format, width, height, 0,
-+      framerate_n, framerate_d, par_n, par_d);
- }
- 
- /**
-@@ -643,7 +734,7 @@ gst_video_format_to_fourcc (GstVideoFormat format)
-  * @blue_mask: blue bit mask
-  *
-  * Converts red, green, blue bit masks into the corresponding
-- * #GstVideoFormat.  
-+ * #GstVideoFormat.
-  *
-  * Since: 0.10.16
-  *
-@@ -796,7 +887,7 @@ gst_video_format_is_yuv (GstVideoFormat format)
- /**
-  * gst_video_format_has_alpha:
-  * @format: a #GstVideoFormat
-- * 
-+ *
-  * Returns TRUE or FALSE depending on if the video format provides an
-  * alpha channel.
-  *
-@@ -1328,6 +1419,71 @@ gst_video_format_get_size (GstVideoFormat format, int width, int height)
- }
- 
- /**
-+ * gst_video_format_get_size_strided:
-+ * @format: a #GstVideoFormat
-+ * @width: the width of video (in pixels)
-+ * @height: the height of video (in pixels)
-+ * @rowstride: the rowstride (in bytes), or 0 if no rowstride (in which
-+ *    case the returned value is same as #gst_video_format_get_size())
-+ *
-+ * Calculates the total number of bytes in the raw video format, for a buffer
-+ * which may have a rowstride in bytes
-+ *
-+ * Since: ???
-+ *
-+ * Returns: size (in bytes) of raw video format
-+ */
-+int
-+gst_video_format_get_size_strided (GstVideoFormat format,
-+    int width, int height, int rowstride)
-+{
-+  if(!rowstride)
-+    return gst_video_format_get_size (format, width, height);
-+
-+  g_return_val_if_fail (format != GST_VIDEO_FORMAT_UNKNOWN, 0);
-+  g_return_val_if_fail (width > 0 && height > 0, 0);
-+
-+  switch (format) {
-+    /* all packed formats have the same calculation, ie. rowstride * height
-+     */
-+    case GST_VIDEO_FORMAT_RGBx:
-+    case GST_VIDEO_FORMAT_BGRx:
-+    case GST_VIDEO_FORMAT_xRGB:
-+    case GST_VIDEO_FORMAT_xBGR:
-+    case GST_VIDEO_FORMAT_RGBA:
-+    case GST_VIDEO_FORMAT_BGRA:
-+    case GST_VIDEO_FORMAT_ARGB:
-+    case GST_VIDEO_FORMAT_ABGR:
-+    case GST_VIDEO_FORMAT_RGB:
-+    case GST_VIDEO_FORMAT_BGR:
-+    case GST_VIDEO_FORMAT_YUY2:
-+    case GST_VIDEO_FORMAT_YVYU:
-+    case GST_VIDEO_FORMAT_UYVY:
-+    case GST_VIDEO_FORMAT_AYUV:
-+    case GST_VIDEO_FORMAT_v210:
-+    case GST_VIDEO_FORMAT_v216:
-+      return GST_ROUND_UP_4 (rowstride * height);
-+
-+    /* these planar formats have 2x sub-sampling in the vertical direction,
-+     * so U/V have half as many rows as Y:
-+     */
-+    case GST_VIDEO_FORMAT_I420:
-+    case GST_VIDEO_FORMAT_YV12:
-+      return GST_ROUND_UP_4 (2 * rowstride * height);
-+
-+    /* these planar formats have no sub-sampling in the vertical direction,
-+     * so each plane has 'height' number of rows
-+     */
-+    case GST_VIDEO_FORMAT_Y41B:
-+    case GST_VIDEO_FORMAT_Y42B:
-+    case GST_VIDEO_FORMAT_Y444:
-+      return GST_ROUND_UP_4 (3 * rowstride * height);
-+    default:
-+      return 0;
-+  }
-+}
-+
-+/**
-  * gst_video_format_convert:
-  * @format: a #GstVideoFormat
-  * @width: the width of video
-diff --git a/gst-libs/gst/video/video.h b/gst-libs/gst/video/video.h
-index 162a766..ed20179 100644
---- a/gst-libs/gst/video/video.h
-+++ b/gst-libs/gst/video/video.h
-@@ -33,7 +33,7 @@ G_BEGIN_DECLS
-  * @GST_VIDEO_FORMAT_I420: planar 4:2:0 YUV
-  * @GST_VIDEO_FORMAT_YV12: planar 4:2:0 YVU (like I420 but UV planes swapped)
-  * @GST_VIDEO_FORMAT_YUY2: packed 4:2:2 YUV (Y0-U0-Y1-V0 Y2-U2-Y3-V2 Y4 ...)
-- * @GST_VIDEO_FORMAT_UYVY: packed 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...) 
-+ * @GST_VIDEO_FORMAT_UYVY: packed 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...)
-  * @GST_VIDEO_FORMAT_AYUV: packed 4:4:4 YUV with alpha channel (A0-Y0-U0-V0 ...)
-  * @GST_VIDEO_FORMAT_RGBx: sparse rgb packed into 32 bit, space last
-  * @GST_VIDEO_FORMAT_BGRx: sparse reverse rgb packed into 32 bit, space last
-@@ -167,13 +167,13 @@ typedef enum {
- 
- #define GST_VIDEO_CAPS_RGBx \
-     __GST_VIDEO_CAPS_MAKE_32 (1, 2, 3)
--  
-+
- #define GST_VIDEO_CAPS_xRGB \
-     __GST_VIDEO_CAPS_MAKE_32 (2, 3, 4)
--  
-+
- #define GST_VIDEO_CAPS_BGRx \
-     __GST_VIDEO_CAPS_MAKE_32 (3, 2, 1)
--  
-+
- #define GST_VIDEO_CAPS_xBGR \
-     __GST_VIDEO_CAPS_MAKE_32 (4, 3, 2)
- 
-@@ -181,13 +181,13 @@ typedef enum {
- 
- #define GST_VIDEO_CAPS_RGBA \
-     __GST_VIDEO_CAPS_MAKE_32A (1, 2, 3, 4)
--  
-+
- #define GST_VIDEO_CAPS_ARGB \
-     __GST_VIDEO_CAPS_MAKE_32A (2, 3, 4, 1)
--  
-+
- #define GST_VIDEO_CAPS_BGRA \
-     __GST_VIDEO_CAPS_MAKE_32A (3, 2, 1, 4)
--  
-+
- #define GST_VIDEO_CAPS_ABGR \
-     __GST_VIDEO_CAPS_MAKE_32A (4, 3, 2, 1)
- 
-@@ -203,9 +203,9 @@ typedef enum {
-   #define GST_VIDEO_CAPS_BGRx_HOST_ENDIAN \
-       GST_VIDEO_CAPS_xRGB
- #endif
--      
-+
- /* 15/16 bit */
--  
-+
- #define GST_VIDEO_CAPS_RGB_16                                           \
-             "video/x-raw-rgb, "                                         \
-             "bpp = (int) 16, "                                          \
-@@ -237,6 +237,16 @@ typedef enum {
-         "height = " GST_VIDEO_SIZE_RANGE ", "                           \
-         "framerate = " GST_VIDEO_FPS_RANGE
- 
-+
-+#define GST_VIDEO_CAPS_YUV_STRIDED(fourcc, rowstride)                   \
-+        GST_VIDEO_CAPS_YUV(fourcc) "; "                                 \
-+        "video/x-raw-yuv-strided, "                                     \
-+        "format = (fourcc) " fourcc ", "                                \
-+        "rowstride = (int) " rowstride ", "                             \
-+        "width = " GST_VIDEO_SIZE_RANGE ", "                            \
-+        "height = " GST_VIDEO_SIZE_RANGE ", "                           \
-+        "framerate = " GST_VIDEO_FPS_RANGE
-+
- /* buffer flags */
- 
- /**
-@@ -276,13 +286,15 @@ gboolean gst_video_get_size   (GstPad *pad,
-                                gint   *height);
- 
- gboolean gst_video_calculate_display_ratio (guint *dar_n, guint *dar_d,
--            guint video_width, guint video_height, 
--            guint video_par_n, guint video_par_d, 
-+            guint video_width, guint video_height,
-+            guint video_par_n, guint video_par_d,
-             guint display_par_n, guint display_par_d);
- 
- gboolean gst_video_format_parse_caps (GstCaps *caps, GstVideoFormat *format,
-     int *width, int *height);
- gboolean gst_video_format_parse_caps_interlaced (GstCaps *caps, gboolean *interlaced);
-+gboolean gst_video_format_parse_caps_strided (GstCaps * caps, GstVideoFormat * format,
-+    int *width, int *height, int *rowstride);
- gboolean gst_video_parse_caps_framerate (GstCaps *caps,
-     int *fps_n, int *fps_d);
- gboolean gst_video_parse_caps_pixel_aspect_ratio (GstCaps *caps,
-@@ -293,6 +305,9 @@ GstCaps * gst_video_format_new_caps (GstVideoFormat format,
- GstCaps * gst_video_format_new_caps_interlaced (GstVideoFormat format,
-     int width, int height, int framerate_n, int framerate_d,
- 						int par_n, int par_d, gboolean interlaced);
-+GstCaps * gst_video_format_new_caps_strided (GstVideoFormat format,
-+    int width, int height, int rowstride,
-+    int framerate_n, int framerate_d, int par_n, int par_d);
- GstVideoFormat gst_video_format_from_fourcc (guint32 fourcc);
- guint32 gst_video_format_to_fourcc (GstVideoFormat format);
- gboolean gst_video_format_is_rgb (GstVideoFormat format);
-@@ -308,6 +323,8 @@ int gst_video_format_get_component_height (GstVideoFormat format, int component,
- int gst_video_format_get_component_offset (GstVideoFormat format, int component,
-     int width, int height);
- int gst_video_format_get_size (GstVideoFormat format, int width, int height);
-+int gst_video_format_get_size_strided (GstVideoFormat format,
-+    int width, int height, int rowstride);
- gboolean gst_video_format_convert (GstVideoFormat format, int width, int height,
-     int fps_n, int fps_d,
-     GstFormat src_format, gint64 src_value,
-diff --git a/gst/audioconvert/Makefile.am b/gst/audioconvert/Makefile.am
-index 94978bb..2d273db 100644
---- a/gst/audioconvert/Makefile.am
-+++ b/gst/audioconvert/Makefile.am
-@@ -5,6 +5,7 @@ libgstaudioconvert_la_SOURCES = \
- 	audioconvert.c \
- 	gstchannelmix.c \
- 	gstaudioquantize.c \
-+	armv7.c \
- 	plugin.c
- 
- libgstaudioconvert_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS)
-diff --git a/gst/audioconvert/armv7.c b/gst/audioconvert/armv7.c
-new file mode 100644
-index 0000000..e39d29d
---- /dev/null
-+++ b/gst/audioconvert/armv7.c
-@@ -0,0 +1,209 @@
-+/* GStreamer
-+ *
-+ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
-+ *
-+ * Description: NEON/VFP accelerated functions for armv7 architecture
-+ *  Created on: Aug 8, 2009
-+ *      Author: Rob Clark <rob@ti.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library; if not, write to the
-+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
-+ * Boston, MA 02111-1307, USA.
-+ */
-+
-+#ifdef __ARM_NEON__
-+#include <arm_neon.h>
-+#include <string.h>
-+
-+#include "audioconvert.h"
-+
-+
-+void
-+gst_audio_quantize_quantize_signed_tpdf_none (AudioConvertCtx *ctx,
-+    gint32 *src, gint32 *dst, gint count)
-+{
-+  static guint32 state[4] = {
-+      0xdeadbeef,
-+      0x305b8cc9,
-+      0x6c46ec93,
-+      0xad13b0cd
-+  };
-+
-+  gint scale = ctx->out_scale;
-+  count *= ctx->out.channels;
-+
-+  if (scale > 0) {
-+    guint32 mask = 0xffffffff & (0xffffffff << scale);
-+    guint32 bias = (1U << (scale - 1)) >> 1;
-+    gint32 dither = (1<<(scale - 1));
-+
-+    int32x4_t  vrand;
-+    uint32x4_t vstate;
-+    uint32x4_t v12345;
-+    int32x4_t  vtmp;
-+    uint32x4_t vmask;
-+
-+    vstate = vld1q_u32 (state);
-+    v12345 = vmovq_n_u32 (12345);
-+    vmask  = vmovq_n_u32 (mask);
-+
-+    /* until we have less 4 words less to process, use vector instructions
-+     * to do everything 4x at a time:
-+     */
-+    for (;;count-=4) {
-+      int64x2_t  vtmp_lo;
-+      int64x2_t  vtmp_hi;
-+      uint32x4_t vstate2;
-+      int32x2_t  vrand_lo;
-+      int32x2_t  vrand_hi;
-+
-+      /* generate next eight random words: (see gst_fast_random_uint32())
-+       *
-+       *    state = state * 1103515245 + 12345
-+       */
-+      vstate2 = vmulq_n_u32 (vstate, 1103515245);
-+      vstate2 = vaddq_u32 (vstate2, v12345);
-+      vstate  = vmulq_n_u32 (vstate2, 1103515245);
-+      vstate  = vaddq_u32 (vstate2, v12345);
-+
-+      /* generate next four scaled random values:
-+       *
-+       *    gint32 start = bias - dither;
-+       *    gint32 end = bias + dither - 1;
-+       *    gint64 tmp1 = gst_fast_random_uint32 ();
-+       *    gint64 tmp2 = gst_fast_random_uint32 ();
-+       *    rand = (gint32)(((tmp1+tmp2) * (end - start)) / (1LLU<<32) + start);
-+       *
-+       * need to split vstate and vstate2 into 2*2 int64x2_t and add....
-+       */
-+      vstate2 = vaddq_u32 (vstate, vstate2);     /* tmp1+tmp2 */
-+      vtmp_lo = vreinterpretq_s64_u64 (          /* * (end-start) */
-+          vmull_n_u32 (vget_low_u32 (vstate2), (2*dither) - 1));
-+      vtmp_hi = vreinterpretq_s64_u64 (          /* * (end-start) */
-+          vmull_n_u32 (vget_high_u32 (vstate2), (2*dither) - 1));
-+
-+      vtmp_lo = vshrq_n_s64 (vtmp_lo, 32);       /* / (1LLU<<32) */
-+      vtmp_hi = vshrq_n_s64 (vtmp_hi, 32);       /* / (1LLU<<32) */
-+
-+
-+      /* now want to put vtmp_hi and vtmp_lo back together..
-+       * then add 'start' (bias-dither).. which is negative..
-+       */
-+      vrand_lo = vmovn_s64 (vtmp_lo);
-+      vrand_hi = vmovn_s64 (vtmp_hi);
-+      vrand    = vcombine_s32 (vrand_lo, vrand_hi);
-+      vrand    = vaddq_s32 (vrand, vmovq_n_s32 (bias-dither));
-+
-+      /* load next 4 words:
-+       */
-+      vtmp = vld1q_s32 (src);
-+      src += 4;
-+
-+      /* perform saturating add of random noise... we don't want the
-+       * value to wrap around:
-+       *
-+       * XXX I *think* vqaddq will handle saturation for underflow too..
-+       */
-+      vtmp = vqaddq_s32 (vtmp, vrand);
-+      vtmp = vreinterpretq_s32_u32 (
-+          vandq_u32 (vreinterpretq_u32_s32 (vtmp), vmask));
-+
-+      /* we check for less than four remaining words at the end, before
-+       * we store the result back.. the assumption is that it shouldn't
-+       * cause a segfault to read past the end of 'src', and there is no
-+       * harm in processing a few garbage words.  But we definitely don't
-+       * want to write past the end of 'dst'
-+       */
-+      if (count<4) break;
-+
-+      /* store 4 words to result:
-+       */
-+      vst1q_s32 (dst, vtmp);
-+      dst += 4;
-+    }
-+
-+    vst1q_u32 (state, vstate);
-+
-+    /* at this point, we could have 0-3 result bytes in vtmp to write
-+     * back out to 'dst':
-+     */
-+    if (count) {
-+      gint32 tmpdst[4];
-+      gint32 *tmpp = tmpdst;
-+
-+      vst1q_s32 (tmpdst, vtmp);
-+
-+      while (count--) {
-+        *dst++ = *tmpp++;
-+      }
-+    }
-+
-+  } else {
-+    memmove (dst, src, count);
-+  }
-+}
-+
-+void
-+gst_audio_convert_unpack_float_le (gfloat * src, gint32 * dst, gint s, gint count)
-+{
-+  float32x4_t vsrc;
-+  float32x4_t v05;
-+  int32x4_t   vdst;
-+
-+  v05 = vmovq_n_f32 (0.5);
-+
-+  for (;;count-=4) {
-+
-+    /* load next 4 words:
-+     */
-+    vsrc = vld1q_f32 ((float32_t *)src);
-+    src += 4;
-+
-+    /* convert to int:
-+     */
-+    vsrc = vmulq_n_f32 (vsrc, 2147483647.0);
-+    vsrc = vaddq_f32 (vsrc, v05);
-+    vdst = vcvtq_s32_f32 (vsrc);
-+
-+    /* we check for less than four remaining words at the end, before
-+     * we store the result back.. the assumption is that it shouldn't
-+     * cause a segfault to read past the end of 'src', and there is no
-+     * harm in processing a few garbage words.  But we definitely don't
-+     * want to write past the end of 'dst'
-+     */
-+    if (count<4) break;
-+
-+    /* store 4 words to result:
-+     */
-+    vst1q_s32 (dst, vdst);
-+    dst += 4;
-+  }
-+
-+  /* at this point, we could have 0-3 result bytes in vtmp to write
-+   * back out to 'dst':
-+   */
-+  if (count) {
-+    gint32 tmpdst[4];
-+    gint32 *tmpp = tmpdst;
-+
-+    vst1q_s32 (tmpdst, vdst);
-+
-+    while (count--) {
-+      *dst++ = *tmpp++;
-+    }
-+  }
-+}
-+
-+
-+#endif
-diff --git a/gst/audioconvert/audioconvert.c b/gst/audioconvert/audioconvert.c
-index 4780324..c18d217 100644
---- a/gst/audioconvert/audioconvert.c
-+++ b/gst/audioconvert/audioconvert.c
-@@ -38,11 +38,11 @@
-  * unpack code
-  */
- #define MAKE_UNPACK_FUNC_NAME(name)                                     \
--audio_convert_unpack_##name
-+gst_audio_convert_unpack_##name
- 
- /* unpack from integer to signed integer 32 */
- #define MAKE_UNPACK_FUNC_II(name, stride, sign, READ_FUNC)              \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_UNPACK_FUNC_NAME (name) (guint8 *src, gint32 *dst,                 \
-         gint scale, gint count)                                         \
- {                                                                       \
-@@ -54,7 +54,7 @@ MAKE_UNPACK_FUNC_NAME (name) (guint8 *src, gint32 *dst,                 \
- 
- /* unpack from float to signed integer 32 */
- #define MAKE_UNPACK_FUNC_FI(name, type, READ_FUNC)                            \
--static void                                                                   \
-+void __attribute__((weak))                                                    \
- MAKE_UNPACK_FUNC_NAME (name) (type * src, gint32 * dst, gint s, gint count)   \
- {                                                                             \
-   gdouble temp;                                                               \
-@@ -68,7 +68,7 @@ MAKE_UNPACK_FUNC_NAME (name) (type * src, gint32 * dst, gint s, gint count)   \
- 
- /* unpack from float to float 64 (double) */
- #define MAKE_UNPACK_FUNC_FF(name, type, FUNC)                                 \
--static void                                                                   \
-+void __attribute__((weak))                                                    \
- MAKE_UNPACK_FUNC_NAME (name) (type * src, gdouble * dst, gint s,              \
-     gint count)                                                               \
- {                                                                             \
-@@ -78,7 +78,7 @@ MAKE_UNPACK_FUNC_NAME (name) (type * src, gdouble * dst, gint s,              \
- 
- /* unpack from int to float 64 (double) */
- #define MAKE_UNPACK_FUNC_IF(name, stride, sign, READ_FUNC)                    \
--static void                                                                   \
-+void __attribute__((weak))                                                    \
- MAKE_UNPACK_FUNC_NAME (name) (guint8 * src, gdouble * dst, gint scale,        \
-     gint count)                                                               \
- {                                                                             \
-@@ -158,7 +158,7 @@ audio_convert_pack_##name
- 
- /* pack from signed integer 32 to integer */
- #define MAKE_PACK_FUNC_II(name, stride, sign, WRITE_FUNC)               \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_PACK_FUNC_NAME (name) (gint32 *src, guint8 * dst,                  \
-         gint scale, gint count)                                         \
- {                                                                       \
-@@ -172,7 +172,7 @@ MAKE_PACK_FUNC_NAME (name) (gint32 *src, guint8 * dst,                  \
- 
- /* pack from signed integer 32 to float */
- #define MAKE_PACK_FUNC_IF(name, type, FUNC)                             \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_PACK_FUNC_NAME (name) (gint32 * src, type * dst, gint scale,       \
-     gint count)                                                         \
- {                                                                       \
-@@ -182,7 +182,7 @@ MAKE_PACK_FUNC_NAME (name) (gint32 * src, type * dst, gint scale,       \
- 
- /* pack from float 64 (double) to float */
- #define MAKE_PACK_FUNC_FF(name, type, FUNC)                             \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_PACK_FUNC_NAME (name) (gdouble * src, type * dst, gint s,          \
-     gint count)                                                         \
- {                                                                       \
-@@ -194,7 +194,7 @@ MAKE_PACK_FUNC_NAME (name) (gdouble * src, type * dst, gint s,          \
-  * the floats are already in the correct range. Only a cast is needed.
-  */
- #define MAKE_PACK_FUNC_FI_S(name, stride, WRITE_FUNC)                   \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_PACK_FUNC_NAME (name) (gdouble * src, guint8 * dst, gint scale,    \
-     gint count)                                                         \
- {                                                                       \
-@@ -212,7 +212,7 @@ MAKE_PACK_FUNC_NAME (name) (gdouble * src, guint8 * dst, gint scale,    \
-  * and an addition of 2^(target_depth-1) to get in the correct unsigned
-  * range. */
- #define MAKE_PACK_FUNC_FI_U(name, stride, WRITE_FUNC)                   \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_PACK_FUNC_NAME (name) (gdouble * src, guint8 * dst, gint scale,    \
-     gint count)                                                         \
- {                                                                       \
-diff --git a/gst/audioconvert/gstaudioquantize.c b/gst/audioconvert/gstaudioquantize.c
-index 2155397..be959c4 100644
---- a/gst/audioconvert/gstaudioquantize.c
-+++ b/gst/audioconvert/gstaudioquantize.c
-@@ -46,7 +46,7 @@ gst_audio_quantize_quantize_##name
- 
- #define MAKE_QUANTIZE_FUNC_I(name, DITHER_INIT_FUNC, ADD_DITHER_FUNC,   \
-                              ROUND_FUNC)                                \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_QUANTIZE_FUNC_NAME (name) (AudioConvertCtx *ctx, gint32 *src,      \
-                                 gint32 *dst, gint count)                \
- {                                                                       \
-@@ -86,7 +86,7 @@ MAKE_QUANTIZE_FUNC_NAME (name) (AudioConvertCtx *ctx, gint32 *src,      \
- #define MAKE_QUANTIZE_FUNC_F(name, DITHER_INIT_FUNC, NS_INIT_FUNC,      \
-                              ADD_NS_FUNC, ADD_DITHER_FUNC,              \
-                              UPDATE_ERROR_FUNC)                         \
--static void                                                             \
-+void __attribute__((weak))                                              \
- MAKE_QUANTIZE_FUNC_NAME (name) (AudioConvertCtx *ctx, gdouble *src,     \
-                                 gdouble *dst, gint count)               \
- {                                                                       \
-diff --git a/gst/audioconvert/gstchannelmix.c b/gst/audioconvert/gstchannelmix.c
-index 1dbfcce..9ace1cb 100644
---- a/gst/audioconvert/gstchannelmix.c
-+++ b/gst/audioconvert/gstchannelmix.c
-@@ -663,7 +663,7 @@ gst_channel_mix_passthrough (AudioConvertCtx * this)
- 
- /* IMPORTANT: out_data == in_data is possible, make sure to not overwrite data
-  * you might need later on! */
--void
-+void __attribute__((weak))
- gst_channel_mix_mix_int (AudioConvertCtx * this,
-     gint32 * in_data, gint32 * out_data, gint samples)
- {
-@@ -702,7 +702,7 @@ gst_channel_mix_mix_int (AudioConvertCtx * this,
-   }
- }
- 
--void
-+void __attribute__((weak))
- gst_channel_mix_mix_float (AudioConvertCtx * this,
-     gdouble * in_data, gdouble * out_data, gint samples)
- {
-diff --git a/gst/stride/Makefile.am b/gst/stride/Makefile.am
-new file mode 100644
-index 0000000..1adc197
---- /dev/null
-+++ b/gst/stride/Makefile.am
-@@ -0,0 +1,15 @@
-+plugin_LTLIBRARIES = libgststridetransform.la
-+
-+libgststridetransform_la_SOURCES = \
-+	gststridetransform.c \
-+	plugin.c
-+
-+libgststridetransform_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS)
-+libgststridetransform_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
-+libgststridetransform_la_LIBADD = \
-+	$(top_builddir)/gst-libs/gst/video/libgstvideo-@GST_MAJORMINOR@.la \
-+	$(GST_BASE_LIBS) $(GST_LIBS) $(LIBM)
-+libgststridetransform_la_LIBTOOLFLAGS = --tag=disable-static
-+
-+noinst_HEADERS = \
-+	gststridetransform.h
-diff --git a/gst/stride/gststridetransform.c b/gst/stride/gststridetransform.c
-new file mode 100644
-index 0000000..ea52500
---- /dev/null
-+++ b/gst/stride/gststridetransform.c
-@@ -0,0 +1,471 @@
-+/* GStreamer
-+ *
-+ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
-+ *
-+ * Description: V4L2 sink element
-+ *  Created on: Jul 30, 2009
-+ *      Author: Rob Clark <rob@ti.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library; if not, write to the
-+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
-+ * Boston, MA 02111-1307, USA.
-+ */
-+
-+
-+/**
-+ * SECTION:element-stridetransform
-+ *
-+ * stridetransform can be used to convert between video buffers
-+ * with and without stride, or between buffers with differing
-+ * stride
-+ *
-+ * <refsect2>
-+ * <title>Example launch lines</title>
-+ * |[
-+ * gst-launch videotestsrc ! video/x-raw-yuv,format=(fourcc)YUY2,width=320,height=240,framerate=30/1 !
-+ * stridetransform ! video/x-raw-yuv-strided,format=(fourcc)YUY2,width=320,height=240,rowstride=700,framerate=30/1 !
-+ * stridetransform ! video/x-raw-yuv,format=(fourcc)YUY2,width=320,height=240,framerate=30/1 !
-+ * v4l2sink
-+ * ]| This pipeline ???? TODO
-+ * </refsect2>
-+ */
-+
-+
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
-+#include <string.h>
-+#include <gst/video/video.h>
-+
-+#include "gst/gst-i18n-plugin.h"
-+#include "gststridetransform.h"
-+
-+
-+static const GstElementDetails stridetransform_details =
-+GST_ELEMENT_DETAILS ("Stride transform",
-+    "Filter/Converter/Video",
-+    "Convert between video buffers with and without stride, or with differing stride",
-+    "Rob Clark <rob@ti.com>,");
-+
-+
-+/* TODO: add rgb formats too! */
-+#define SUPPORTED_CAPS                                                        \
-+  GST_VIDEO_CAPS_YUV_STRIDED ("{ I420, YV12, YUY2, UYVY }", "[ 0, max ]")
-+
-+
-+static GstStaticPadTemplate src_template =
-+GST_STATIC_PAD_TEMPLATE ("src",
-+    GST_PAD_SRC,
-+    GST_PAD_ALWAYS,
-+    GST_STATIC_CAPS (SUPPORTED_CAPS)
-+    );
-+
-+static GstStaticPadTemplate sink_template =
-+GST_STATIC_PAD_TEMPLATE ("sink",
-+    GST_PAD_SINK,
-+    GST_PAD_ALWAYS,
-+    GST_STATIC_CAPS (SUPPORTED_CAPS)
-+    );
-+
-+
-+GST_DEBUG_CATEGORY (stridetransform_debug);
-+#define GST_CAT_DEFAULT stridetransform_debug
-+
-+/* type functions */
-+static void gst_stride_transform_dispose (GObject *obj);
-+
-+/* GstBaseTransform functions */
-+static gboolean gst_stride_transform_get_unit_size (GstBaseTransform *base,
-+    GstCaps *caps, guint *size);
-+static gboolean gst_stride_transform_transform_size (GstBaseTransform *base,
-+    GstPadDirection direction,
-+    GstCaps *caps, guint size,
-+    GstCaps *othercaps, guint *othersize);
-+static GstCaps *gst_stride_transform_transform_caps (GstBaseTransform *base,
-+    GstPadDirection direction, GstCaps *caps);
-+static gboolean gst_stride_transform_set_caps (GstBaseTransform *base,
-+    GstCaps *incaps, GstCaps *outcaps);
-+static GstFlowReturn gst_stride_transform_transform (GstBaseTransform *base,
-+    GstBuffer *inbuf, GstBuffer *outbuf);
-+static GstFlowReturn gst_stride_transform_transform_ip (GstBaseTransform *base,
-+    GstBuffer *buf);
-+
-+GST_BOILERPLATE (GstStrideTransform, gst_stride_transform, GstVideoFilter, GST_TYPE_VIDEO_FILTER);
-+
-+
-+static void
-+gst_stride_transform_base_init (gpointer g_class)
-+{
-+  GstElementClass *gstelement_class = GST_ELEMENT_CLASS (g_class);
-+
-+  GST_DEBUG_CATEGORY_INIT (stridetransform_debug, "stride", 0, "stride transform element");
-+
-+  gst_element_class_set_details (gstelement_class, &stridetransform_details);
-+
-+  gst_element_class_add_pad_template (gstelement_class,
-+      gst_static_pad_template_get (&sink_template));
-+  gst_element_class_add_pad_template (gstelement_class,
-+      gst_static_pad_template_get (&src_template));
-+}
-+
-+static void
-+gst_stride_transform_class_init (GstStrideTransformClass *klass)
-+{
-+  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
-+  GstBaseTransformClass *basetransform_class = GST_BASE_TRANSFORM_CLASS (klass);
-+
-+  gobject_class->dispose = gst_stride_transform_dispose;
-+
-+  basetransform_class->get_unit_size =
-+      GST_DEBUG_FUNCPTR (gst_stride_transform_get_unit_size);
-+  basetransform_class->transform_size =
-+      GST_DEBUG_FUNCPTR (gst_stride_transform_transform_size);
-+  basetransform_class->transform_caps =
-+      GST_DEBUG_FUNCPTR (gst_stride_transform_transform_caps);
-+  basetransform_class->set_caps =
-+      GST_DEBUG_FUNCPTR (gst_stride_transform_set_caps);
-+  basetransform_class->transform_ip =
-+      GST_DEBUG_FUNCPTR (gst_stride_transform_transform_ip);
-+  basetransform_class->transform =
-+      GST_DEBUG_FUNCPTR (gst_stride_transform_transform);
-+
-+  basetransform_class->passthrough_on_same_caps = TRUE;
-+}
-+
-+static void
-+gst_stride_transform_init (GstStrideTransform *self, GstStrideTransformClass *klass)
-+{
-+  GST_DEBUG_OBJECT (self, "not implemented");
-+}
-+
-+
-+static void
-+gst_stride_transform_dispose (GObject *object)
-+{
-+  GstStrideTransform *self = GST_STRIDE_TRANSFORM (object);
-+  GST_DEBUG_OBJECT (self, "not implemented");
-+  G_OBJECT_CLASS (parent_class)->dispose (object);
-+}
-+
-+/**
-+ * figure out the required buffer size based on @caps
-+ */
-+static gboolean
-+gst_stride_transform_get_unit_size (GstBaseTransform *base,
-+    GstCaps *caps, guint *size)
-+{
-+  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
-+  GstVideoFormat format;
-+  gint width, height, rowstride;
-+
-+  g_return_val_if_fail (gst_video_format_parse_caps_strided (
-+      caps, &format, &width, &height, &rowstride), FALSE);
-+
-+  *size = gst_video_format_get_size_strided (format, width, height, rowstride);
-+
-+  GST_DEBUG_OBJECT (self,
-+      "format=%d, width=%d, height=%d, rowstride=%d -> size=%d",
-+      format, width, height, rowstride, *size);
-+
-+  return TRUE;
-+}
-+
-+/**
-+ * Default transform_size function is no good, as it assumes that the output
-+ * buffer size is a multiple of the unit size.. which doesn't hold true.
-+ */
-+static gboolean
-+gst_stride_transform_transform_size (GstBaseTransform *base,
-+    GstPadDirection direction,
-+    GstCaps *caps, guint size,
-+    GstCaps *othercaps, guint *othersize)
-+{
-+  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
-+  guint idx = (direction == GST_PAD_SINK) ? 0 : 1;
-+
-+  if (self->cached_caps[idx] != othercaps)
-+  {
-+    if (!gst_stride_transform_get_unit_size (base, othercaps,
-+        &(self->cached_size[idx])))
-+    {
-+      return FALSE;
-+    }
-+  }
-+
-+  *othersize = self->cached_size[idx];
-+
-+  return TRUE;
-+}
-+
-+
-+
-+/**
-+ * helper to add all fields, other than rowstride to @caps, copied from @s.
-+ */
-+static void
-+add_all_fields (GstCaps *caps, const gchar *name, GstStructure *s, gboolean rowstride)
-+{
-+  gint idx;
-+  GstStructure *new_s = gst_structure_new (name, NULL);
-+
-+  if (rowstride) {
-+    gst_structure_set (new_s, "rowstride", GST_TYPE_INT_RANGE, 1, G_MAXINT, NULL);
-+  }
-+
-+  idx = gst_structure_n_fields (s) - 1;
-+  while (idx >= 0) {
-+    const gchar *name = gst_structure_nth_field_name (s, idx);
-+    if (strcmp ("rowstride", name)) {
-+      const GValue *val = gst_structure_get_value (s, name);
-+      gst_structure_set_value (new_s, name, val);
-+    }
-+    idx--;
-+  }
-+
-+  gst_caps_merge_structure (caps, new_s);
-+}
-+
-+
-+/**
-+ * we can transform @caps to strided or non-strided caps with otherwise
-+ * identical parameters
-+ */
-+static GstCaps *
-+gst_stride_transform_transform_caps (GstBaseTransform *base,
-+    GstPadDirection direction, GstCaps *caps)
-+{
-+  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
-+  GstCaps *ret;
-+  GstStructure *s;
-+
-+  g_return_val_if_fail (GST_CAPS_IS_SIMPLE (caps), NULL);
-+
-+  GST_DEBUG_OBJECT (self, "direction=%d, caps=%p", direction, caps);
-+  LOG_CAPS (self, caps);
-+
-+  ret = gst_caps_new_empty ();
-+  s = gst_caps_get_structure (caps, 0);
-+
-+  if (gst_structure_has_name (s, "video/x-raw-yuv") ||
-+      gst_structure_has_name (s, "video/x-raw-yuv-strided")) {
-+
-+    add_all_fields (ret, "video/x-raw-yuv", s, FALSE);
-+    add_all_fields (ret, "video/x-raw-yuv-strided", s, TRUE);
-+
-+  } else if (gst_structure_has_name (s, "video/x-raw-rgb") ||
-+      gst_structure_has_name (s, "video/x-raw-rgb-strided")) {
-+
-+    add_all_fields (ret, "video/x-raw-rgb", s, FALSE);
-+    add_all_fields (ret, "video/x-raw-rgb-strided", s, TRUE);
-+
-+  }
-+
-+  LOG_CAPS (self, ret);
-+
-+  return ret;
-+}
-+
-+/**
-+ * at this point, we have identical fourcc, width, and height for @incaps
-+ * and @outcaps..  so we need to extract these to use for transforming,
-+ * plus the requested rowstride of the @incaps and @outcaps
-+ */
-+static gboolean
-+gst_stride_transform_set_caps (GstBaseTransform *base,
-+    GstCaps *incaps, GstCaps *outcaps)
-+{
-+  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
-+  GstVideoFormat format;
-+  gint width, height;
-+
-+  LOG_CAPS (self, incaps);
-+  LOG_CAPS (self, outcaps);
-+
-+  g_return_val_if_fail (gst_video_format_parse_caps_strided (incaps,
-+      &self->format, &self->width, &self->height, &self->in_rowstride), FALSE);
-+  g_return_val_if_fail (gst_video_format_parse_caps_strided (outcaps,
-+      &format, &width, &height, &self->out_rowstride), FALSE);
-+
-+  g_return_val_if_fail (self->format == format, FALSE);
-+  g_return_val_if_fail (self->width  == width,  FALSE);
-+  g_return_val_if_fail (self->height == height, FALSE);
-+
-+  return TRUE;
-+}
-+
-+/* ************************************************************************* */
-+
-+/**
-+ * Convert from one stride to another... like memmove, but can convert stride in
-+ * the process.  This function is not aware of pixels, only of bytes.  So widths
-+ * are given in bytes, not pixels.  The new_buf and orig_buf can point to the
-+ * same buffers to do an in-place conversion, but the buffer should be large
-+ * enough.
-+ */
-+static void
-+stridemove (guchar *new_buf, guchar *orig_buf, gint new_width, gint orig_width, gint height)
-+{
-+  int row;
-+
-+  GST_DEBUG ("new_buf=%p, orig_buf=%p, new_width=%d, orig_width=%d, height=%d",
-+      new_buf, orig_buf, new_width, orig_width, height);
-+  /* if increasing the stride, work from bottom-up to avoid overwriting data
-+   * that has not been moved yet.. otherwise, work in the opposite order,
-+   * for the same reason.
-+   */
-+  if (new_width > orig_width) {
-+    for (row=height-1; row>=0; row--) {
-+      memmove (new_buf+(new_width*row), orig_buf+(orig_width*row), orig_width);
-+    }
-+  } else {
-+    for (row=0; row<height; row++) {
-+      memmove (new_buf+(new_width*row), orig_buf+(orig_width*row), new_width);
-+    }
-+  }
-+}
-+
-+
-+/**
-+ * Convert from a non-strided buffer to strided.  The two buffer pointers could
-+ * be pointing to the same memory block for in-place transform.. assuming that
-+ * the buffer is large enough
-+ *
-+ * @strided:    the pointer to the resulting strided buffer
-+ * @unstrided:  the pointer to the initial unstrided buffer
-+ * @fourcc:     the color format
-+ * @stride:     the stride, in bytes
-+ * @width:      the width in pixels
-+ * @height:     the height in pixels
-+ */
-+static GstFlowReturn
-+stridify (GstStrideTransform *self, guchar *strided, guchar *unstrided)
-+{
-+  gint width  = self->width;
-+  gint height = self->height;
-+  gint stride = self->out_rowstride;
-+
-+  switch (self->format) {
-+#if 0 /* TODO */
-+    case GST_VIDEO_FORMAT_NV12:
-+      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
-+      stridemove (strided, unstrided, stride, width, height * 1.5);
-+      return GST_FLOW_OK;
-+#endif
-+    case GST_VIDEO_FORMAT_I420:
-+    case GST_VIDEO_FORMAT_YV12:
-+      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
-+      stridemove (
-+          strided + (int)(height*stride*1.5),
-+          unstrided + (int)(height*width*1.5),
-+          stride, width/2, height);                             /* move U/V */
-+      stridemove (
-+          strided + (height*stride),
-+          unstrided + (height*width),
-+          stride, width/2, height);                             /* move V/U */
-+      stridemove (strided, unstrided, stride, width, height);   /* move Y */
-+      return GST_FLOW_OK;
-+    case GST_VIDEO_FORMAT_YUY2:
-+    case GST_VIDEO_FORMAT_UYVY:
-+      g_return_val_if_fail (stride >= (width*2), GST_FLOW_ERROR);
-+      stridemove (strided, unstrided, stride, width*2, height);
-+      return GST_FLOW_OK;
-+    default:
-+      GST_WARNING ("unknown color format!\n");
-+      return GST_FLOW_ERROR;
-+  }
-+}
-+
-+
-+/**
-+ * Convert from a strided buffer to non-strided.  The two buffer pointers could
-+ * be pointing to the same memory block for in-place transform..
-+ *
-+ * @unstrided:  the pointer to the resulting unstrided buffer
-+ * @strided:    the pointer to the initial strided buffer
-+ */
-+static GstFlowReturn
-+unstridify (GstStrideTransform *self, guchar *unstrided, guchar *strided)
-+{
-+  gint width  = self->width;
-+  gint height = self->height;
-+  gint stride = self->in_rowstride;
-+
-+  switch (self->format) {
-+#if 0 /* TODO */
-+    case GST_VIDEO_FORMAT_NV12:
-+      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
-+      stridemove (unstrided, strided, width, stride, height * 1.5);
-+      return GST_FLOW_OK;
-+#endif
-+    case GST_VIDEO_FORMAT_I420:
-+    case GST_VIDEO_FORMAT_YV12:
-+      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
-+      stridemove (unstrided, strided, width, stride, height);   /* move Y */
-+      stridemove (
-+          unstrided + (height*width),
-+          strided + (height*stride),
-+          width/2, stride, height);                             /* move V/U */
-+      stridemove (
-+          unstrided + (int)(height*width*1.5),
-+          strided + (int)(height*stride*1.5),
-+          width/2, stride, height);                             /* move U/V */
-+      return GST_FLOW_OK;
-+    case GST_VIDEO_FORMAT_YUY2:
-+    case GST_VIDEO_FORMAT_UYVY:
-+      g_return_val_if_fail (stride >= (width*2), GST_FLOW_ERROR);
-+      stridemove (unstrided, strided, width*2, stride, height);
-+      return GST_FLOW_OK;
-+    default:
-+      GST_WARNING ("unknown color format!\n");
-+      return GST_FLOW_ERROR;
-+  }
-+}
-+
-+
-+static GstFlowReturn
-+gst_stride_transform_transform (GstBaseTransform *base,
-+    GstBuffer *inbuf, GstBuffer *outbuf)
-+{
-+  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
-+
-+  GST_DEBUG_OBJECT (self, "inbuf=%p (size=%d), outbuf=%p (size=%d)",
-+      inbuf, GST_BUFFER_SIZE (inbuf),
-+      outbuf, GST_BUFFER_SIZE (outbuf));
-+
-+  if (self->in_rowstride && self->out_rowstride) {
-+    GST_DEBUG_OBJECT (self, "not implemented");  // TODO
-+    return GST_FLOW_ERROR;
-+  } else if (self->in_rowstride) {
-+    return unstridify (self,
-+        GST_BUFFER_DATA (outbuf), GST_BUFFER_DATA (inbuf));
-+  } else if (self->out_rowstride) {
-+    return stridify (self,
-+        GST_BUFFER_DATA (outbuf), GST_BUFFER_DATA (inbuf));
-+  }
-+
-+  GST_DEBUG_OBJECT (self, "this shouldn't happen!  in_rowstride=%d, out_rowstride=%d",
-+      self->in_rowstride, self->out_rowstride);
-+
-+  return GST_FLOW_ERROR;
-+}
-+
-+static GstFlowReturn
-+gst_stride_transform_transform_ip (GstBaseTransform *base,
-+    GstBuffer *buf)
-+{
-+  /* transform function is safe to call with same buffer ptr:
-+   */
-+  return gst_stride_transform_transform (base, buf, buf);
-+}
-diff --git a/gst/stride/gststridetransform.h b/gst/stride/gststridetransform.h
-new file mode 100644
-index 0000000..481959e
---- /dev/null
-+++ b/gst/stride/gststridetransform.h
-@@ -0,0 +1,80 @@
-+/* GStreamer
-+ *
-+ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
-+ *
-+ * Description: V4L2 sink element
-+ *  Created on: Jul 2, 2009
-+ *      Author: Rob Clark <rob@ti.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library; if not, write to the
-+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
-+ * Boston, MA 02111-1307, USA.
-+ */
-+
-+#ifndef __GSTSTRIDETRANSFORM_H__
-+#define __GSTSTRIDETRANSFORM_H__
-+
-+
-+#include <gst/video/gstvideofilter.h>
-+#include <gst/video/video.h>
-+
-+
-+G_BEGIN_DECLS
-+
-+#define GST_TYPE_STRIDE_TRANSFORM \
-+  (gst_stride_transform_get_type())
-+#define GST_STRIDE_TRANSFORM(obj) \
-+  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_STRIDE_TRANSFORM,GstStrideTransform))
-+#define GST_STRIDE_TRANSFORM_CLASS(klass) \
-+  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_STRIDE_TRANSFORM,GstStrideTransformClass))
-+#define GST_IS_STRIDE_TRANSFORM(obj) \
-+  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_STRIDE_TRANSFORM))
-+#define GST_IS_STRIDE_TRANSFORM_CLASS(klass) \
-+  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_STRIDE_TRANSFORM))
-+
-+typedef struct _GstStrideTransform GstStrideTransform;
-+typedef struct _GstStrideTransformClass GstStrideTransformClass;
-+
-+/**
-+ * GstStrideTransform:
-+ *
-+ * Opaque datastructure.
-+ */
-+struct _GstStrideTransform {
-+  GstVideoFilter videofilter;
-+
-+  /*< private >*/
-+  GstVideoFormat format;
-+  gint width, height;
-+  gint in_rowstride;
-+  gint out_rowstride;
-+
-+  /* for caching the tranform_size() results.. */
-+  GstCaps *cached_caps[2];
-+  guint cached_size[2];
-+};
-+
-+struct _GstStrideTransformClass {
-+  GstVideoFilterClass parent_class;
-+};
-+
-+GType gst_stride_transform_get_type (void);
-+
-+G_END_DECLS
-+
-+
-+#define LOG_CAPS(obj, caps)  GST_DEBUG_OBJECT (obj, "%s: %"GST_PTR_FORMAT, #caps, caps)
-+
-+
-+#endif /* __GSTSTRIDETRANSFORM_H__ */
-diff --git a/gst/stride/plugin.c b/gst/stride/plugin.c
-new file mode 100644
-index 0000000..7672bdc
---- /dev/null
-+++ b/gst/stride/plugin.c
-@@ -0,0 +1,45 @@
-+/* GStreamer
-+ *
-+ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
-+ *
-+ * Description: V4L2 sink element
-+ *  Created on: Jul 30, 2009
-+ *      Author: Rob Clark <rob@ti.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library; if not, write to the
-+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
-+ * Boston, MA 02111-1307, USA.
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
-+#include "gststridetransform.h"
-+
-+static gboolean
-+plugin_init (GstPlugin * plugin)
-+{
-+  if (!gst_element_register (plugin, "stridetransform",
-+          GST_RANK_PRIMARY, gst_stride_transform_get_type ()))
-+    return FALSE;
-+
-+  return TRUE;
-+}
-+
-+GST_PLUGIN_DEFINE (GST_VERSION_MAJOR,
-+    GST_VERSION_MINOR,
-+    "stridetransform",
-+    "Convert video from strided to non-strided, or between different row-strides",
-+    plugin_init, VERSION, "LGPL", GST_PACKAGE_NAME, GST_PACKAGE_ORIGIN)
--- 
-1.6.3.1
-
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.25.bb b/recipes/gstreamer/gst-plugins-base_0.10.25.bb
deleted file mode 100644
index 9e82171..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.25.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI += "file://fix-playbin2.patch \
-            file://gst-plugins-base_rowstride.patch \
-"
-
-PR = "${INC_PR}.4"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype  libxv libxrandr"
-
-
-SRC_URI[archive.md5sum] = "d29669dd79276c5cd94e1613c03cd9ab"
-SRC_URI[archive.sha256sum] = "0ab2f7e1d818e7af1be99c4eae02ba69d4a1b8f7e3527929a6426f1daa0d4607"
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.31.bb b/recipes/gstreamer/gst-plugins-base_0.10.31.bb
deleted file mode 100644
index b68fffb..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.31.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI += " \
-            file://ivorbis-thumb.patch \
-"
-
-SRC_URI[archive.md5sum] = "9baa0d87e81c88b2477a3554ab629c46"
-SRC_URI[archive.sha256sum] = "abb006c78222cfb69d31e983268d1d5219e9d4e0da24c6c4cd687968af7a33bd"
-
-PR = "${INC_PR}.1"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just
-# a missing alsa plugin
-DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype  libxv libxrandr gtk+"
-
-# Needs a udev that enabled gudev, which isn't the default
-EXTRA_OECONF_append = " --with-gudev"
-
-do_configure_prepend() {
-	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
-}
-
diff --git a/recipes/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch b/recipes/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch
deleted file mode 100644
index 749c491..0000000
--- a/recipes/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-diff -uNr gst-plugins-good-0.10.15/sys/v4l2/gstv4l2src.c gst-plugins-good-0.10.15.new/sys/v4l2/gstv4l2src.c
---- gst-plugins-good-0.10.15/sys/v4l2/gstv4l2src.c	2009-05-11 19:00:07.000000000 -0500
-+++ gst-plugins-good-0.10.15.new/sys/v4l2/gstv4l2src.c	2009-06-22 09:51:50.000000000 -0500
-@@ -1377,14 +1377,22 @@
-       timestamp = gst_clock_get_time (clock) - timestamp;
-       gst_object_unref (clock);
- 
--      latency =
--          gst_util_uint64_scale_int (GST_SECOND, v4l2src->fps_d,
--          v4l2src->fps_n);
-+      /* we must have a framerate */
-+      if (v4l2src->fps_n <= 0 || v4l2src->fps_d <= 0) {
-+        GST_WARNING_OBJECT (src,
-+            "Can't give latency since framerate isn't fixated !");
-+        timestamp = GST_CLOCK_TIME_NONE;
-+      }
-+      else {
-+        latency =
-+            gst_util_uint64_scale_int (GST_SECOND, v4l2src->fps_d,
-+            v4l2src->fps_n);
- 
--      if (timestamp > latency)
--        timestamp -= latency;
--      else
--        timestamp = 0;
-+        if (timestamp > latency)
-+          timestamp -= latency;
-+        else
-+          timestamp = 0;
-+      }
-     }
- 
-     /* FIXME: use the timestamp from the buffer itself! */
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.15.bb b/recipes/gstreamer/gst-plugins-good_0.10.15.bb
deleted file mode 100644
index f2b0a5a..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.15.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require gst-plugins.inc
-
-PR = "r6"
-
-SRC_URI += "file://fix-unit-scale-asseration.patch"
-
-inherit gconf 
-
-DEPENDS += "libsoup-2.4 flac gst-plugins-base openssl popt esound"
-
-PACKAGES =+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements += "${sysconfdir}/gconf"
-
-
-SRC_URI[archive.md5sum] = "19bc6cc07951b3382d1ac8525b20e83f"
-SRC_URI[archive.sha256sum] = "831f450a0fa18c881b00ec50e8916ed66ca0fecb53cd1939f0abcc02930f9847"
diff --git a/recipes/gstreamer/gst-rtsp_0.10.4.bb b/recipes/gstreamer/gst-rtsp_0.10.4.bb
deleted file mode 100644
index 265f0f7..0000000
--- a/recipes/gstreamer/gst-rtsp_0.10.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require gst-rtsp.inc
-
-SRC_URI[md5sum] = "8daaca1299aeb42c6aac47b30291005b"
-SRC_URI[sha256sum] = "1ebf3571d16dbab401f2ebf0362e3d67457fb88711ad15a4ab51bd3730267fb7"
diff --git a/recipes/gstreamer/gst-rtsp_0.10.5.bb b/recipes/gstreamer/gst-rtsp_0.10.5.bb
deleted file mode 100644
index dbaddc3..0000000
--- a/recipes/gstreamer/gst-rtsp_0.10.5.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require gst-rtsp.inc
-
-SRC_URI[md5sum] = "caca55e2ff497c0a327df3bc65a4a662"
-SRC_URI[sha256sum] = "a6f0a0c6c466683ee688aa8475623850fdacb549b2339a502831fdd3d74f984e"
diff --git a/recipes/gstreamer/gstreamer/po-makefile-fix.patch b/recipes/gstreamer/gstreamer/po-makefile-fix.patch
deleted file mode 100644
index 1cf665e..0000000
--- a/recipes/gstreamer/gstreamer/po-makefile-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN gstreamer-0.10.17.orig/po/Makefile.in.in gstreamer-0.10.17/po/Makefile.in.in
---- gstreamer-0.10.17.orig/po/Makefile.in.in	2008-01-25 16:21:31.000000000 +0100
-+++ gstreamer-0.10.17/po/Makefile.in.in	2008-09-08 14:41:21.000000000 +0200
-@@ -30,7 +30,7 @@
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
- MKINSTALLDIRS = @MKINSTALLDIRS@
--mkinstalldirs = $(SHELL) `case "$(MKINSTALLDIRS)" in /*) echo "$(MKINSTALLDIRS)" ;; *) echo "$(top_builddir)/$(MKINSTALLDIRS)" ;; esac`
-+mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
- 
- GMSGFMT = @GMSGFMT@
- MSGFMT = @MSGFMT@
diff --git a/recipes/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch b/recipes/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch
deleted file mode 100644
index 6733e6b..0000000
--- a/recipes/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Work around a glibc 2.6.1 bug with dlopen. We try to dlopen a .so file that
-only contains debug symbols (e.g. no architecture is set in the elf header)
-
-
-#0  0x4000a88c in _dl_relocate_object () from /lib/ld-linux.so.3
-(gdb) bt
-#0  0x4000a88c in _dl_relocate_object () from /lib/ld-linux.so.3
-#1  0x40011f68 in dl_open_worker () from /lib/ld-linux.so.3
-#2  0x4000d7e4 in _dl_catch_error () from /lib/ld-linux.so.3
-#3  0x400117d8 in _dl_open () from /lib/ld-linux.so.3
-#4  0x402fba84 in dlopen_doit () from /lib/libdl.so.2
-#5  0x4000d7e4 in _dl_catch_error () from /lib/ld-linux.so.3
-#6  0x402fbf50 in _dlerror_run () from /lib/libdl.so.2
-#7  0x402fb9bc in dlopen@@GLIBC_2.4 () from /lib/libdl.so.2
-#8  0x402f2790 in g_module_open () from /usr/lib/libgmodule-2.0.so.0
-#9  0x40078784 in gst_plugin_load_file (
-    filename=0x10a6c8 "/usr/lib/gstreamer-0.10/.debug/libgstcoreindexers.so", 
-    error=0x0) at gstplugin.c:481
-#10 0x4007e3c4 in gst_registry_scan_path_level (registry=0x27828, 
-    path=0x10a6a0 "/usr/lib/gstreamer-0.10/.debug", level=1) at gstregistry.c:891
-#11 0x4007df04 in gst_registry_scan_path_level (registry=0x27828, 
-
-
-Index: gstreamer-0.10.17/gst/gstregistry.c
-===================================================================
---- gstreamer-0.10.17.orig/gst/gstregistry.c	2008-11-14 23:30:48.000000000 +0100
-+++ gstreamer-0.10.17/gst/gstregistry.c	2008-11-14 23:32:39.000000000 +0100
-@@ -813,7 +813,10 @@
-     GST_LOG_OBJECT (registry, "examining file: %s", filename);
- 
-     if (g_file_test (filename, G_FILE_TEST_IS_DIR)) {
--      if (level > 0) {
-+      if (g_str_has_suffix (filename, ".debug")) {
-+        GST_LOG_OBJECT (registry,
-+            "found directory, not descending into .debug directory");
-+      } else if (level > 0) {
-         GST_LOG_OBJECT (registry, "found directory, recursing");
-         changed |= gst_registry_scan_path_level (registry, filename, level - 1);
-       } else {
diff --git a/recipes/gstreamer/gstreamer_0.10.17.bb b/recipes/gstreamer/gstreamer_0.10.17.bb
deleted file mode 100644
index dd01e16..0000000
--- a/recipes/gstreamer/gstreamer_0.10.17.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gstreamer.inc
-
-PR = "r4"
-
-SRC_URI += "file://po-makefile-fix.patch \
-            file://registry-do-not-look-into-debug-dirs.patch "
-
-
-SRC_URI[archive.md5sum] = "3232416ea6fceab628236d67a7d0a44a"
-SRC_URI[archive.sha256sum] = "442862dc93e734aa58f13bcf3914dc7a40d3fa28f0ae2152c80457438dc3569c"
diff --git a/recipes/gstreamer/gstreamer_0.10.25.bb b/recipes/gstreamer/gstreamer_0.10.25.bb
deleted file mode 100644
index 6ba8a6d..0000000
--- a/recipes/gstreamer/gstreamer_0.10.25.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer.inc
-
-EXTRA_OECONF += "ac_cv_func_register_printf_function=no"
-
-SRC_URI[archive.md5sum] = "88544e034a051baf472983791d233076"
-SRC_URI[archive.sha256sum] = "39b2ba7b3bfa8df6d998a9461e7091c27757e36a53e93969d7d9982a56526578"
diff --git a/recipes/gstreamer/gstreamer_0.10.31.bb b/recipes/gstreamer/gstreamer_0.10.31.bb
deleted file mode 100644
index 8b8eb77..0000000
--- a/recipes/gstreamer/gstreamer_0.10.31.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gstreamer.inc
-
-PR = "r2"
-
-SRC_URI[archive.md5sum] = "a21fb08bdb578d972c7c14e77da8fbb6"
-SRC_URI[archive.sha256sum] = "7f737e6d047c1ebeb4e1e0725fc377c5d9f12ee89186de7960be3cbba709ab84"
-
-SRC_URI += " \
-             file://0001-add-GstQueryBuffers-query.patch \
-             file://0002-gstevent-add-crop-event.patch \
-             file://0003-basetransform-don-t-do-unnecessary-pad_alloc.patch \
-"
-
-EXTRA_OECONF += "ac_cv_func_register_printf_function=no"
-
diff --git a/recipes/obsolete/gstreamer/gst-ffmpeg/armv5.patch b/recipes/obsolete/gstreamer/gst-ffmpeg/armv5.patch
new file mode 100644
index 0000000..794709c
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-ffmpeg/armv5.patch
@@ -0,0 +1,1509 @@
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/configure.ac
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac	2006-09-23 15:35:21.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/configure.ac	2007-05-01 12:23:39.000000000 +0200
+@@ -190,7 +190,7 @@
+     ARCH_X86=yes
+     ;;
+   # armv4l is a subset of armv5tel
+-  armv4l|armv5tel)
++  arm|armv4l|armv5tel|armv5te)
+     TARGET_ARCH="armv4l"
+     ARCH_ARMV4L=yes
+     ;;
+@@ -364,11 +364,8 @@
+ AC_FF_ALLOW_DISABLE(HAVE_IWMMXT, iwmmxt, use ARM/IWMMXT optimizations,[
+   if test x$TARGET_ARCH = xarmv4l; then
+     AC_MSG_CHECKING(for support of IWMMXT optimizations)
+-    AC_TRY_RUN([
+-        int main () {
++    AC_TRY_COMPILE(,[
+           __asm__ __volatile__ ("wunpckelub wr6, wr4");
+-          return 0;
+-        }
+       ],[ HAVE_IWMMXT=yes && AC_MSG_RESULT(yes) ],[
+         HAVE_IWMMXT=no && AC_MSG_RESULT(no) ])
+   else
+@@ -376,6 +373,19 @@
+   fi
+ ])
+ 
++dnl ARMV5TE
++AC_FF_ALLOW_DISABLE(HAVE_ARMV5TE, armv5te, use ARMV5TE optimizations,[
++  if test x$TARGET_ARCH = xarmv4l; then
++    AC_MSG_CHECKING(for support of ARMV5TE specific instructions)
++    AC_TRY_COMPILE(, [
++          __asm__ __volatile__ ("smulbb a4,ip,a3");
++      ],[ HAVE_ARMV5TE=yes && AC_MSG_RESULT(yes) ],[
++        HAVE_ARMV5TE=no && AC_MSG_RESULT(no) ])
++  else
++    HAVE_ARMV5TE=no
++  fi
++])
++
+ dnl GProf (-p)
+ AC_FF_ALLOW_ENABLE(HAVE_GPROF, gprof, profiling with gprof,[
+   GPROF_FLAGS="-p"
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c	2006-09-20 20:55:37.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm.c	2007-05-01 12:23:40.000000000 +0200
+  * ARMv4L optimized DSP utils
+  * Copyright (c) 2001 Lionel Ulmer.
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+-#include "dsputil.h"
++#include "../dsputil.h"
+ #ifdef HAVE_IPP
+ #include "ipp.h"
+ #endif
+@@ -27,6 +29,12 @@
+ extern void j_rev_dct_ARM(DCTELEM *data);
+ extern void simple_idct_ARM(DCTELEM *data);
+ 
++extern void simple_idct_armv5te(DCTELEM *data);
++extern void simple_idct_put_armv5te(uint8_t *dest, int line_size,
++                                    DCTELEM *data);
++extern void simple_idct_add_armv5te(uint8_t *dest, int line_size,
++                                    DCTELEM *data);
++
+ /* XXX: local hack */
+ static void (*ff_put_pixels_clamped)(const DCTELEM *block, uint8_t *pixels, int line_size);
+ static void (*ff_add_pixels_clamped)(const DCTELEM *block, uint8_t *pixels, int line_size);
+@@ -196,8 +204,10 @@
+     ff_add_pixels_clamped = c->add_pixels_clamped;
+ 
+     if(idct_algo == FF_IDCT_AUTO){
+-#ifdef HAVE_IPP
++#if defined(HAVE_IPP)
+         idct_algo = FF_IDCT_IPP;
++#elif defined(HAVE_ARMV5TE)
++        idct_algo = FF_IDCT_SIMPLEARMV5TE;
+ #else
+         idct_algo = FF_IDCT_ARM;
+ #endif
+@@ -213,6 +223,13 @@
+         c->idct_add= simple_idct_ARM_add;
+         c->idct    = simple_idct_ARM;
+         c->idct_permutation_type= FF_NO_IDCT_PERM;
++#ifdef HAVE_ARMV5TE
++    } else if (idct_algo==FF_IDCT_SIMPLEARMV5TE){
++        c->idct_put= simple_idct_put_armv5te;
++        c->idct_add= simple_idct_add_armv5te;
++        c->idct    = simple_idct_armv5te;
++        c->idct_permutation_type = FF_NO_IDCT_PERM;
++#endif
+ #ifdef HAVE_IPP
+     } else if (idct_algo==FF_IDCT_IPP){
+         c->idct_put= simple_idct_ipp_put;
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm_s.S	2006-02-19 00:04:59.000000000 +0100
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_arm_s.S	2007-05-01 12:23:40.000000000 +0200
+@@ -2,20 +2,29 @@
+ @ ARMv4L optimized DSP utils
+ @ Copyright (c) 2004 AGAWA Koji <i (AT) atty (DOT) jp>
+ @
+-@ This library is free software; you can redistribute it and/or
++@ This file is part of FFmpeg.
++@
++@ FFmpeg is free software; you can redistribute it and/or
+ @ modify it under the terms of the GNU Lesser General Public
+ @ License as published by the Free Software Foundation; either
+-@ version 2 of the License, or (at your option) any later version.
++@ version 2.1 of the License, or (at your option) any later version.
+ @
+-@ This library is distributed in the hope that it will be useful,
++@ FFmpeg is distributed in the hope that it will be useful,
+ @ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ @ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ @ Lesser General Public License for more details.
+ @
+ @ You should have received a copy of the GNU Lesser General Public
+-@ License along with this library; if not, write to the Free Software
++@ License along with FFmpeg; if not, write to the Free Software
+ @ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ @
++#if defined(__ARM_ARCH_5__) || \
++    defined(__ARM_ARCH_5T__) || \
++    defined(__ARM_ARCH_5TE__)
++#define PLD(code...)   code
++#else
++#define PLD(code...)
++#endif
+ 
+ .macro  ADJ_ALIGN_QUADWORD_D shift, Rd0, Rd1, Rd2, Rd3, Rn0, Rn1, Rn2, Rn3, Rn4
+         mov \Rd0, \Rn0, lsr #(\shift * 8)
+@@ -74,7 +83,7 @@
+ put_pixels16_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r11, lr} @ R14 is also called LR
+         adr r5, 5f
+         ands r4, r1, #3
+@@ -85,7 +94,7 @@
+         ldmia r1, {r4-r7}
+         add r1, r1, r2
+         stmia r0, {r4-r7}
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         add r0, r0, r2
+         bne 1b
+@@ -95,7 +104,7 @@
+         ldmia r1, {r4-r8}
+         add r1, r1, r2
+         ADJ_ALIGN_QUADWORD_D 1, r9, r10, r11, r12, r4, r5, r6, r7, r8
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         stmia r0, {r9-r12}
+         add r0, r0, r2
+@@ -106,7 +115,7 @@
+         ldmia r1, {r4-r8}
+         add r1, r1, r2
+         ADJ_ALIGN_QUADWORD_D 2, r9, r10, r11, r12, r4, r5, r6, r7, r8
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         stmia r0, {r9-r12}
+         add r0, r0, r2
+@@ -117,7 +126,7 @@
+         ldmia r1, {r4-r8}
+         add r1, r1, r2
+         ADJ_ALIGN_QUADWORD_D 3, r9, r10, r11, r12, r4, r5, r6, r7, r8
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         stmia r0, {r9-r12}
+         add r0, r0, r2
+@@ -136,7 +145,7 @@
+ put_pixels8_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r5,lr} @ R14 is also called LR
+         adr r5, 5f
+         ands r4, r1, #3
+@@ -147,7 +156,7 @@
+         ldmia r1, {r4-r5}
+         add r1, r1, r2
+         subs r3, r3, #1
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmia r0, {r4-r5}
+         add r0, r0, r2
+         bne 1b
+@@ -157,7 +166,7 @@
+         ldmia r1, {r4-r5, r12}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r12
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+         add r0, r0, r2
+@@ -168,7 +177,7 @@
+         ldmia r1, {r4-r5, r12}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r12
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+         add r0, r0, r2
+@@ -179,7 +188,7 @@
+         ldmia r1, {r4-r5, r12}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r12
+-        pld [r1]
++        PLD ( pld [r1] )
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+         add r0, r0, r2
+@@ -198,7 +207,7 @@
+ put_pixels8_x2_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r10,lr} @ R14 is also called LR
+         adr r5, 5f
+         ands r4, r1, #3
+@@ -210,7 +219,7 @@
+         ldmia r1, {r4-r5, r10}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         RND_AVG32 r8, r9, r4, r5, r6, r7, r12
+         subs r3, r3, #1
+         stmia r0, {r8-r9}
+@@ -223,7 +232,7 @@
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
+         ADJ_ALIGN_DOUBLEWORD_D 2, r8, r9, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         RND_AVG32 r4, r5, r6, r7, r8, r9, r12
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+@@ -236,7 +245,7 @@
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 2, r6, r7, r4, r5, r10
+         ADJ_ALIGN_DOUBLEWORD_D 3, r8, r9, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         RND_AVG32 r4, r5, r6, r7, r8, r9, r12
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+@@ -248,7 +257,7 @@
+         ldmia r1, {r4-r5, r10}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 3, r6, r7, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         RND_AVG32 r8, r9, r6, r7, r5, r10, r12
+         subs r3, r3, #1
+         stmia r0, {r8-r9}
+@@ -267,7 +276,7 @@
+ put_no_rnd_pixels8_x2_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r10,lr} @ R14 is also called LR
+         adr r5, 5f
+         ands r4, r1, #3
+@@ -279,7 +288,7 @@
+         ldmia r1, {r4-r5, r10}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         NO_RND_AVG32 r8, r9, r4, r5, r6, r7, r12
+         subs r3, r3, #1
+         stmia r0, {r8-r9}
+@@ -292,7 +301,7 @@
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 1, r6, r7, r4, r5, r10
+         ADJ_ALIGN_DOUBLEWORD_D 2, r8, r9, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         NO_RND_AVG32 r4, r5, r6, r7, r8, r9, r12
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+@@ -305,7 +314,7 @@
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 2, r6, r7, r4, r5, r10
+         ADJ_ALIGN_DOUBLEWORD_D 3, r8, r9, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         NO_RND_AVG32 r4, r5, r6, r7, r8, r9, r12
+         subs r3, r3, #1
+         stmia r0, {r4-r5}
+@@ -317,7 +326,7 @@
+         ldmia r1, {r4-r5, r10}
+         add r1, r1, r2
+         ADJ_ALIGN_DOUBLEWORD_D 3, r6, r7, r4, r5, r10
+-        pld [r1]
++        PLD ( pld [r1] )
+         NO_RND_AVG32 r8, r9, r6, r7, r5, r10, r12
+         subs r3, r3, #1
+         stmia r0, {r8-r9}
+@@ -338,7 +347,7 @@
+ put_pixels8_y2_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
+         adr r5, 5f
+         ands r4, r1, #3
+@@ -352,13 +361,13 @@
+         add r1, r1, r2
+ 6:      ldmia r1, {r6-r7}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         RND_AVG32 r8, r9, r4, r5, r6, r7, r12
+         ldmia r1, {r4-r5}
+         add r1, r1, r2
+         stmia r0, {r8-r9}
+         add r0, r0, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         RND_AVG32 r8, r9, r6, r7, r4, r5, r12
+         subs r3, r3, #1
+         stmia r0, {r8-r9}
+@@ -369,18 +378,18 @@
+ 2:
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
+ 6:      ldmia r1, {r7-r9}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 1, r7, r8, r9
+         RND_AVG32 r10, r11, r4, r5, r7, r8, r12
+         stmia r0, {r10-r11}
+         add r0, r0, r2
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
+         subs r3, r3, #1
+         RND_AVG32 r10, r11, r7, r8, r4, r5, r12
+@@ -392,18 +401,18 @@
+ 3:
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
+ 6:      ldmia r1, {r7-r9}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 2, r7, r8, r9
+         RND_AVG32 r10, r11, r4, r5, r7, r8, r12
+         stmia r0, {r10-r11}
+         add r0, r0, r2
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
+         subs r3, r3, #1
+         RND_AVG32 r10, r11, r7, r8, r4, r5, r12
+@@ -415,18 +424,18 @@
+ 4:
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
+ 6:      ldmia r1, {r7-r9}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 3, r7, r8, r9
+         RND_AVG32 r10, r11, r4, r5, r7, r8, r12
+         stmia r0, {r10-r11}
+         add r0, r0, r2
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
+         subs r3, r3, #1
+         RND_AVG32 r10, r11, r7, r8, r4, r5, r12
+@@ -447,7 +456,7 @@
+ put_no_rnd_pixels8_y2_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
+         adr r5, 5f
+         ands r4, r1, #3
+@@ -461,13 +470,13 @@
+         add r1, r1, r2
+ 6:      ldmia r1, {r6-r7}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         NO_RND_AVG32 r8, r9, r4, r5, r6, r7, r12
+         ldmia r1, {r4-r5}
+         add r1, r1, r2
+         stmia r0, {r8-r9}
+         add r0, r0, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         NO_RND_AVG32 r8, r9, r6, r7, r4, r5, r12
+         subs r3, r3, #1
+         stmia r0, {r8-r9}
+@@ -478,18 +487,18 @@
+ 2:
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
+ 6:      ldmia r1, {r7-r9}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 1, r7, r8, r9
+         NO_RND_AVG32 r10, r11, r4, r5, r7, r8, r12
+         stmia r0, {r10-r11}
+         add r0, r0, r2
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 1, r4, r5, r6
+         subs r3, r3, #1
+         NO_RND_AVG32 r10, r11, r7, r8, r4, r5, r12
+@@ -501,18 +510,18 @@
+ 3:
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
+ 6:      ldmia r1, {r7-r9}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 2, r7, r8, r9
+         NO_RND_AVG32 r10, r11, r4, r5, r7, r8, r12
+         stmia r0, {r10-r11}
+         add r0, r0, r2
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 2, r4, r5, r6
+         subs r3, r3, #1
+         NO_RND_AVG32 r10, r11, r7, r8, r4, r5, r12
+@@ -524,18 +533,18 @@
+ 4:
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
+ 6:      ldmia r1, {r7-r9}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 3, r7, r8, r9
+         NO_RND_AVG32 r10, r11, r4, r5, r7, r8, r12
+         stmia r0, {r10-r11}
+         add r0, r0, r2
+         ldmia r1, {r4-r6}
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+         ADJ_ALIGN_DOUBLEWORD 3, r4, r5, r6
+         subs r3, r3, #1
+         NO_RND_AVG32 r10, r11, r7, r8, r4, r5, r12
+@@ -562,7 +571,7 @@
+         ldmia r1, {r8-r10}
+ .endif
+         add r1, r1, r2
+-        pld [r1]
++        PLD ( pld [r1] )
+ .if \align == 0
+         ADJ_ALIGN_DOUBLEWORD_D 1, r4, r5, r6, r7, r8
+ .elseif \align == 1
+@@ -624,7 +633,7 @@
+ put_pixels8_xy2_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
+         adrl r12, 5f
+         ands r4, r1, #3
+@@ -661,7 +670,7 @@
+ put_no_rnd_pixels8_xy2_arm:
+         @ void func(uint8_t *block, const uint8_t *pixels, int line_size, int h)
+         @ block = word aligned, pixles = unaligned
+-        pld [r1]
++        PLD ( pld [r1] )
+         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
+         adrl r12, 5f
+         ands r4, r1, #3
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c	2006-02-19 00:04:59.000000000 +0100
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt.c	2007-05-01 12:23:40.000000000 +0200
+@@ -2,18 +2,20 @@
+  * iWMMXt optimized DSP utils
+  * Copyright (c) 2004 AGAWA Koji
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h	2006-09-20 20:55:37.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/dsputil_iwmmxt_rnd.h	2007-05-01 12:23:40.000000000 +0200
+@@ -2,18 +2,20 @@
+  * iWMMXt optimized DSP utils
+  * copyright (c) 2004 AGAWA Koji
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am	2006-09-22 06:07:23.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/Makefile.am	2007-05-01 12:23:40.000000000 +0200
+@@ -7,9 +7,14 @@
+ iwmmxt_libs = libiwmmxt.la
+ endif
+ 
++if HAVE_ARMV5TE
++armv5te_libs = libarmv5te.la
++endif
++
+ noinst_LTLIBRARIES = \
+ 	libarmv4l.la \
+-	$(iwmmxt_libs)
++	$(iwmmxt_libs) \
++	$(armv5te_libs)
+ 
+ libarmv4l_la_SOURCES = \
+ 	jrevdct_arm.S \
+@@ -18,6 +23,9 @@
+ 	dsputil_arm.c \
+ 	mpegvideo_arm.c
+ 
++libarmv5te_la_SOURCES = \
++	simple_idct_armv5te.S
++
+ libiwmmxt_la_SOURCES = \
+ 	dsputil_iwmmxt.c \
+ 	mpegvideo_iwmmxt.c
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h	2006-09-22 06:07:23.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mathops.h	2007-05-01 12:23:40.000000000 +0200
+@@ -2,18 +2,20 @@
+  * simple math operations
+  * Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at> et al
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+@@ -39,9 +41,9 @@
+ #   define MAC16(rt, ra, rb) \
+         asm ("smlabb %0, %2, %3, %0" : "=r" (rt) : "0" (rt), "r" (ra), "r" (rb));
+ /* signed 16x16 -> 32 multiply */
+-#   define MUL16(ra, rb) \
+-        ({ int __rt;\
+-         asm ("smulbb %0, %1, %2" : "=r" (__rt) : "r" (ra), "r" (rb));
++#   define MUL16(ra, rb)                                                \
++        ({ int __rt;                                                    \
++         asm ("smulbb %0, %1, %2" : "=r" (__rt) : "r" (ra), "r" (rb));  \
+          __rt; })
+ 
+ #endif
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c	2006-02-19 00:04:59.000000000 +0100
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_arm.c	2007-05-01 12:23:40.000000000 +0200
+@@ -1,25 +1,27 @@
+ /*
+  * Copyright (c) 2002 Michael Niedermayer
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  *
+  */
+ 
+-#include "dsputil.h"
+-#include "mpegvideo.h"
+-#include "avcodec.h"
++#include "../dsputil.h"
++#include "../mpegvideo.h"
++#include "../avcodec.h"
+ 
+ extern void MPV_common_init_iwmmxt(MpegEncContext *s);
+ 
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c	2006-09-20 20:55:37.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/mpegvideo_iwmmxt.c	2007-05-01 12:23:40.000000000 +0200
+@@ -1,18 +1,20 @@
+ /*
+  * copyright (c) 2004 AGAWA Koji
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S	2006-09-20 20:55:37.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_arm.S	2007-05-01 12:23:40.000000000 +0200
+@@ -5,18 +5,20 @@
+  *
+  * Author: Frederic Boulay <dilb@handhelds.org>
+  *
+- * This library is free software; you can redistribute it and/or
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+  * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
++ * version 2.1 of the License, or (at your option) any later version.
+  *
+- * This library is distributed in the hope that it will be useful,
++ * FFmpeg is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Lesser General Public License for more details.
+  *
+  * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
++ * License along with FFmpeg; if not, write to the Free Software
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  *
+  * The function defined in this file, is derived from the simple_idct function
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S	1970-01-01 01:00:00.000000000 +0100
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/armv4l/simple_idct_armv5te.S	2007-05-01 12:23:40.000000000 +0200
+@@ -0,0 +1,718 @@
++/*
++ * Simple IDCT
++ *
++ * Copyright (c) 2001 Michael Niedermayer <michaelni@gmx.at>
++ * Copyright (c) 2006 Mans Rullgard <mru@inprovide.com>
++ *
++ * This file is part of FFmpeg.
++ *
++ * FFmpeg is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * FFmpeg is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with FFmpeg; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
++ */
++
++#define W1  22725   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define W2  21407   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define W3  19266   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define W4  16383   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define W5  12873   /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define W6  8867    /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define W7  4520    /* cos(i*M_PI/16)*sqrt(2)*(1<<14) + 0.5 */
++#define ROW_SHIFT 11
++#define COL_SHIFT 20
++
++#define W13 (W1 | (W3 << 16))
++#define W26 (W2 | (W6 << 16))
++#define W57 (W5 | (W7 << 16))
++
++        .text
++        .align
++w13:    .long W13
++w26:    .long W26
++w57:    .long W57
++
++        .align
++        .func idct_row_armv5te
++idct_row_armv5te:
++        str    lr, [sp, #-4]!
++
++        ldrd   v1, [a1, #8]
++        ldrd   a3, [a1]              /* a3 = row[1:0], a4 = row[3:2] */
++        orrs   v1, v1, v2
++        cmpeq  v1, a4
++        cmpeq  v1, a3, lsr #16
++        beq    row_dc_only
++
++        mov    v1, #(1<<(ROW_SHIFT-1))
++        mov    ip, #16384
++        sub    ip, ip, #1            /* ip = W4 */
++        smlabb v1, ip, a3, v1        /* v1 = W4*row[0]+(1<<(RS-1)) */
++        ldr    ip, [pc, #(w26-.-8)]  /* ip = W2 | (W6 << 16) */
++        smultb a2, ip, a4
++        smulbb lr, ip, a4
++        add    v2, v1, a2
++        sub    v3, v1, a2
++        sub    v4, v1, lr
++        add    v1, v1, lr
++
++        ldr    ip, [pc, #(w13-.-8)]  /* ip = W1 | (W3 << 16) */
++        ldr    lr, [pc, #(w57-.-8)]  /* lr = W5 | (W7 << 16) */
++        smulbt v5, ip, a3
++        smultt v6, lr, a4
++        smlatt v5, ip, a4, v5
++        smultt a2, ip, a3
++        smulbt v7, lr, a3
++        sub    v6, v6, a2
++        smulbt a2, ip, a4
++        smultt fp, lr, a3
++        sub    v7, v7, a2
++        smulbt a2, lr, a4
++        ldrd   a3, [a1, #8]          /* a3=row[5:4] a4=row[7:6] */
++        sub    fp, fp, a2
++
++        orrs   a2, a3, a4
++        beq    1f
++
++        smlabt v5, lr, a3, v5
++        smlabt v6, ip, a3, v6
++        smlatt v5, lr, a4, v5
++        smlabt v6, lr, a4, v6
++        smlatt v7, lr, a3, v7
++        smlatt fp, ip, a3, fp
++        smulbt a2, ip, a4
++        smlatt v7, ip, a4, v7
++        sub    fp, fp, a2
++
++        ldr    ip, [pc, #(w26-.-8)]  /* ip = W2 | (W6 << 16) */
++        mov    a2, #16384
++        sub    a2, a2, #1            /* a2 =  W4 */
++        smulbb a2, a2, a3            /* a2 =  W4*row[4] */
++        smultb lr, ip, a4            /* lr =  W6*row[6] */
++        add    v1, v1, a2            /* v1 += W4*row[4] */
++        add    v1, v1, lr            /* v1 += W6*row[6] */
++        add    v4, v4, a2            /* v4 += W4*row[4] */
++        sub    v4, v4, lr            /* v4 -= W6*row[6] */
++        smulbb lr, ip, a4            /* lr =  W2*row[6] */
++        sub    v2, v2, a2            /* v2 -= W4*row[4] */
++        sub    v2, v2, lr            /* v2 -= W2*row[6] */
++        sub    v3, v3, a2            /* v3 -= W4*row[4] */
++        add    v3, v3, lr            /* v3 += W2*row[6] */
++
++1:      add    a2, v1, v5
++        mov    a3, a2, lsr #11
++        bic    a3, a3, #0x1f0000
++        sub    a2, v2, v6
++        mov    a2, a2, lsr #11
++        add    a3, a3, a2, lsl #16
++        add    a2, v3, v7
++        mov    a4, a2, lsr #11
++        bic    a4, a4, #0x1f0000
++        add    a2, v4, fp
++        mov    a2, a2, lsr #11
++        add    a4, a4, a2, lsl #16
++        strd   a3, [a1]
++
++        sub    a2, v4, fp
++        mov    a3, a2, lsr #11
++        bic    a3, a3, #0x1f0000
++        sub    a2, v3, v7
++        mov    a2, a2, lsr #11
++        add    a3, a3, a2, lsl #16
++        add    a2, v2, v6
++        mov    a4, a2, lsr #11
++        bic    a4, a4, #0x1f0000
++        sub    a2, v1, v5
++        mov    a2, a2, lsr #11
++        add    a4, a4, a2, lsl #16
++        strd   a3, [a1, #8]
++
++        ldr    pc, [sp], #4
++
++row_dc_only:
++        orr    a3, a3, a3, lsl #16
++        bic    a3, a3, #0xe000
++        mov    a3, a3, lsl #3
++        mov    a4, a3
++        strd   a3, [a1]
++        strd   a3, [a1, #8]
++
++        ldr    pc, [sp], #4
++        .endfunc
++
++        .macro idct_col
++        ldr    a4, [a1]              /* a4 = col[1:0] */
++        mov    ip, #16384
++        sub    ip, ip, #1            /* ip = W4 */
++#if 0
++        mov    v1, #(1<<(COL_SHIFT-1))
++        smlabt v2, ip, a4, v1        /* v2 = W4*col[1] + (1<<(COL_SHIFT-1)) */
++        smlabb v1, ip, a4, v1        /* v1 = W4*col[0] + (1<<(COL_SHIFT-1)) */
++        ldr    a4, [a1, #(16*4)]
++#else
++        mov    v1, #((1<<(COL_SHIFT-1))/W4) /* this matches the C version */
++        add    v2, v1, a4, asr #16
++        rsb    v2, v2, v2, lsl #14
++        mov    a4, a4, lsl #16
++        add    v1, v1, a4, asr #16
++        ldr    a4, [a1, #(16*4)]
++        rsb    v1, v1, v1, lsl #14
++#endif
++
++        smulbb lr, ip, a4
++        smulbt a3, ip, a4
++        sub    v3, v1, lr
++        sub    v5, v1, lr
++        add    v7, v1, lr
++        add    v1, v1, lr
++        sub    v4, v2, a3
++        sub    v6, v2, a3
++        add    fp, v2, a3
++        ldr    ip, [pc, #(w26-.-8)]
++        ldr    a4, [a1, #(16*2)]
++        add    v2, v2, a3
++
++        smulbb lr, ip, a4
++        smultb a3, ip, a4
++        add    v1, v1, lr
++        sub    v7, v7, lr
++        add    v3, v3, a3
++        sub    v5, v5, a3
++        smulbt lr, ip, a4
++        smultt a3, ip, a4
++        add    v2, v2, lr
++        sub    fp, fp, lr
++        add    v4, v4, a3
++        ldr    a4, [a1, #(16*6)]
++        sub    v6, v6, a3
++
++        smultb lr, ip, a4
++        smulbb a3, ip, a4
++        add    v1, v1, lr
++        sub    v7, v7, lr
++        sub    v3, v3, a3
++        add    v5, v5, a3
++        smultt lr, ip, a4
++        smulbt a3, ip, a4
++        add    v2, v2, lr
++        sub    fp, fp, lr
++        sub    v4, v4, a3
++        add    v6, v6, a3
++
++        stmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp}
++
++        ldr    ip, [pc, #(w13-.-8)]
++        ldr    a4, [a1, #(16*1)]
++        ldr    lr, [pc, #(w57-.-8)]
++        smulbb v1, ip, a4
++        smultb v3, ip, a4
++        smulbb v5, lr, a4
++        smultb v7, lr, a4
++        smulbt v2, ip, a4
++        smultt v4, ip, a4
++        smulbt v6, lr, a4
++        smultt fp, lr, a4
++        rsb    v4, v4, #0
++        ldr    a4, [a1, #(16*3)]
++        rsb    v3, v3, #0
++
++        smlatb v1, ip, a4, v1
++        smlatb v3, lr, a4, v3
++        smulbb a3, ip, a4
++        smulbb a2, lr, a4
++        sub    v5, v5, a3
++        sub    v7, v7, a2
++        smlatt v2, ip, a4, v2
++        smlatt v4, lr, a4, v4
++        smulbt a3, ip, a4
++        smulbt a2, lr, a4
++        sub    v6, v6, a3
++        ldr    a4, [a1, #(16*5)]
++        sub    fp, fp, a2
++
++        smlabb v1, lr, a4, v1
++        smlabb v3, ip, a4, v3
++        smlatb v5, lr, a4, v5
++        smlatb v7, ip, a4, v7
++        smlabt v2, lr, a4, v2
++        smlabt v4, ip, a4, v4
++        smlatt v6, lr, a4, v6
++        ldr    a3, [a1, #(16*7)]
++        smlatt fp, ip, a4, fp
++
++        smlatb v1, lr, a3, v1
++        smlabb v3, lr, a3, v3
++        smlatb v5, ip, a3, v5
++        smulbb a4, ip, a3
++        smlatt v2, lr, a3, v2
++        sub    v7, v7, a4
++        smlabt v4, lr, a3, v4
++        smulbt a4, ip, a3
++        smlatt v6, ip, a3, v6
++        sub    fp, fp, a4
++        .endm
++
++        .align
++        .func idct_col_armv5te
++idct_col_armv5te:
++        str    lr, [sp, #-4]!
++
++        idct_col
++
++        ldmfd  sp!, {a3, a4}
++        adds   a2, a3, v1
++        mov    a2, a2, lsr #20
++        orrmi  a2, a2, #0xf000
++        add    ip, a4, v2
++        mov    ip, ip, asr #20
++        orr    a2, a2, ip, lsl #16
++        str    a2, [a1]
++        subs   a3, a3, v1
++        mov    a2, a3, lsr #20
++        orrmi  a2, a2, #0xf000
++        sub    a4, a4, v2
++        mov    a4, a4, asr #20
++        orr    a2, a2, a4, lsl #16
++        ldmfd  sp!, {a3, a4}
++        str    a2, [a1, #(16*7)]
++
++        subs   a2, a3, v3
++        mov    a2, a2, lsr #20
++        orrmi  a2, a2, #0xf000
++        sub    ip, a4, v4
++        mov    ip, ip, asr #20
++        orr    a2, a2, ip, lsl #16
++        str    a2, [a1, #(16*1)]
++        adds   a3, a3, v3
++        mov    a2, a3, lsr #20
++        orrmi  a2, a2, #0xf000
++        add    a4, a4, v4
++        mov    a4, a4, asr #20
++        orr    a2, a2, a4, lsl #16
++        ldmfd  sp!, {a3, a4}
++        str    a2, [a1, #(16*6)]
++
++        adds   a2, a3, v5
++        mov    a2, a2, lsr #20
++        orrmi  a2, a2, #0xf000
++        add    ip, a4, v6
++        mov    ip, ip, asr #20
++        orr    a2, a2, ip, lsl #16
++        str    a2, [a1, #(16*2)]
++        subs   a3, a3, v5
++        mov    a2, a3, lsr #20
++        orrmi  a2, a2, #0xf000
++        sub    a4, a4, v6
++        mov    a4, a4, asr #20
++        orr    a2, a2, a4, lsl #16
++        ldmfd  sp!, {a3, a4}
++        str    a2, [a1, #(16*5)]
++
++        adds   a2, a3, v7
++        mov    a2, a2, lsr #20
++        orrmi  a2, a2, #0xf000
++        add    ip, a4, fp
++        mov    ip, ip, asr #20
++        orr    a2, a2, ip, lsl #16
++        str    a2, [a1, #(16*3)]
++        subs   a3, a3, v7
++        mov    a2, a3, lsr #20
++        orrmi  a2, a2, #0xf000
++        sub    a4, a4, fp
++        mov    a4, a4, asr #20
++        orr    a2, a2, a4, lsl #16
++        str    a2, [a1, #(16*4)]
++
++        ldr    pc, [sp], #4
++        .endfunc
++
++        .align
++        .func idct_col_put_armv5te
++idct_col_put_armv5te:
++        str    lr, [sp, #-4]!
++
++        idct_col
++
++        ldmfd  sp!, {a3, a4}
++        ldr    lr, [sp, #32]
++        add    a2, a3, v1
++        movs   a2, a2, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    ip, a4, v2
++        movs   ip, ip, asr #20
++        movmi  ip, #0
++        cmp    ip, #255
++        movgt  ip, #255
++        orr    a2, a2, ip, lsl #8
++        sub    a3, a3, v1
++        movs   a3, a3, asr #20
++        movmi  a3, #0
++        cmp    a3, #255
++        movgt  a3, #255
++        sub    a4, a4, v2
++        movs   a4, a4, asr #20
++        movmi  a4, #0
++        cmp    a4, #255
++        ldr    v1, [sp, #28]
++        movgt  a4, #255
++        strh   a2, [v1]
++        add    a2, v1, #2
++        str    a2, [sp, #28]
++        orr    a2, a3, a4, lsl #8
++        rsb    v2, lr, lr, lsl #3
++        ldmfd  sp!, {a3, a4}
++        strh   a2, [v2, v1]!
++
++        sub    a2, a3, v3
++        movs   a2, a2, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        sub    ip, a4, v4
++        movs   ip, ip, asr #20
++        movmi  ip, #0
++        cmp    ip, #255
++        movgt  ip, #255
++        orr    a2, a2, ip, lsl #8
++        strh   a2, [v1, lr]!
++        add    a3, a3, v3
++        movs   a2, a3, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    a4, a4, v4
++        movs   a4, a4, asr #20
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        orr    a2, a2, a4, lsl #8
++        ldmfd  sp!, {a3, a4}
++        strh   a2, [v2, -lr]!
++
++        add    a2, a3, v5
++        movs   a2, a2, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    ip, a4, v6
++        movs   ip, ip, asr #20
++        movmi  ip, #0
++        cmp    ip, #255
++        movgt  ip, #255
++        orr    a2, a2, ip, lsl #8
++        strh   a2, [v1, lr]!
++        sub    a3, a3, v5
++        movs   a2, a3, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        sub    a4, a4, v6
++        movs   a4, a4, asr #20
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        orr    a2, a2, a4, lsl #8
++        ldmfd  sp!, {a3, a4}
++        strh   a2, [v2, -lr]!
++
++        add    a2, a3, v7
++        movs   a2, a2, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    ip, a4, fp
++        movs   ip, ip, asr #20
++        movmi  ip, #0
++        cmp    ip, #255
++        movgt  ip, #255
++        orr    a2, a2, ip, lsl #8
++        strh   a2, [v1, lr]
++        sub    a3, a3, v7
++        movs   a2, a3, asr #20
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        sub    a4, a4, fp
++        movs   a4, a4, asr #20
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        orr    a2, a2, a4, lsl #8
++        strh   a2, [v2, -lr]
++
++        ldr    pc, [sp], #4
++        .endfunc
++
++        .align
++        .func idct_col_add_armv5te
++idct_col_add_armv5te:
++        str    lr, [sp, #-4]!
++
++        idct_col
++
++        ldr    lr, [sp, #36]
++
++        ldmfd  sp!, {a3, a4}
++        ldrh   ip, [lr]
++        add    a2, a3, v1
++        mov    a2, a2, asr #20
++        sub    a3, a3, v1
++        and    v1, ip, #255
++        adds   a2, a2, v1
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    v1, a4, v2
++        mov    v1, v1, asr #20
++        adds   v1, v1, ip, lsr #8
++        movmi  v1, #0
++        cmp    v1, #255
++        movgt  v1, #255
++        orr    a2, a2, v1, lsl #8
++        ldr    v1, [sp, #32]
++        sub    a4, a4, v2
++        rsb    v2, v1, v1, lsl #3
++        ldrh   ip, [v2, lr]!
++        strh   a2, [lr]
++        mov    a3, a3, asr #20
++        and    a2, ip, #255
++        adds   a3, a3, a2
++        movmi  a3, #0
++        cmp    a3, #255
++        movgt  a3, #255
++        mov    a4, a4, asr #20
++        adds   a4, a4, ip, lsr #8
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        add    a2, lr, #2
++        str    a2, [sp, #28]
++        orr    a2, a3, a4, lsl #8
++        strh   a2, [v2]
++
++        ldmfd  sp!, {a3, a4}
++        ldrh   ip, [lr, v1]!
++        sub    a2, a3, v3
++        mov    a2, a2, asr #20
++        add    a3, a3, v3
++        and    v3, ip, #255
++        adds   a2, a2, v3
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        sub    v3, a4, v4
++        mov    v3, v3, asr #20
++        adds   v3, v3, ip, lsr #8
++        movmi  v3, #0
++        cmp    v3, #255
++        movgt  v3, #255
++        orr    a2, a2, v3, lsl #8
++        add    a4, a4, v4
++        ldrh   ip, [v2, -v1]!
++        strh   a2, [lr]
++        mov    a3, a3, asr #20
++        and    a2, ip, #255
++        adds   a3, a3, a2
++        movmi  a3, #0
++        cmp    a3, #255
++        movgt  a3, #255
++        mov    a4, a4, asr #20
++        adds   a4, a4, ip, lsr #8
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        orr    a2, a3, a4, lsl #8
++        strh   a2, [v2]
++
++        ldmfd  sp!, {a3, a4}
++        ldrh   ip, [lr, v1]!
++        add    a2, a3, v5
++        mov    a2, a2, asr #20
++        sub    a3, a3, v5
++        and    v3, ip, #255
++        adds   a2, a2, v3
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    v3, a4, v6
++        mov    v3, v3, asr #20
++        adds   v3, v3, ip, lsr #8
++        movmi  v3, #0
++        cmp    v3, #255
++        movgt  v3, #255
++        orr    a2, a2, v3, lsl #8
++        sub    a4, a4, v6
++        ldrh   ip, [v2, -v1]!
++        strh   a2, [lr]
++        mov    a3, a3, asr #20
++        and    a2, ip, #255
++        adds   a3, a3, a2
++        movmi  a3, #0
++        cmp    a3, #255
++        movgt  a3, #255
++        mov    a4, a4, asr #20
++        adds   a4, a4, ip, lsr #8
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        orr    a2, a3, a4, lsl #8
++        strh   a2, [v2]
++
++        ldmfd  sp!, {a3, a4}
++        ldrh   ip, [lr, v1]!
++        add    a2, a3, v7
++        mov    a2, a2, asr #20
++        sub    a3, a3, v7
++        and    v3, ip, #255
++        adds   a2, a2, v3
++        movmi  a2, #0
++        cmp    a2, #255
++        movgt  a2, #255
++        add    v3, a4, fp
++        mov    v3, v3, asr #20
++        adds   v3, v3, ip, lsr #8
++        movmi  v3, #0
++        cmp    v3, #255
++        movgt  v3, #255
++        orr    a2, a2, v3, lsl #8
++        sub    a4, a4, fp
++        ldrh   ip, [v2, -v1]!
++        strh   a2, [lr]
++        mov    a3, a3, asr #20
++        and    a2, ip, #255
++        adds   a3, a3, a2
++        movmi  a3, #0
++        cmp    a3, #255
++        movgt  a3, #255
++        mov    a4, a4, asr #20
++        adds   a4, a4, ip, lsr #8
++        movmi  a4, #0
++        cmp    a4, #255
++        movgt  a4, #255
++        orr    a2, a3, a4, lsl #8
++        strh   a2, [v2]
++
++        ldr    pc, [sp], #4
++        .endfunc
++
++        .align
++        .global simple_idct_armv5te
++        .func simple_idct_armv5te
++simple_idct_armv5te:
++        stmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, lr}
++
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++
++        sub    a1, a1, #(16*7)
++
++        bl     idct_col_armv5te
++        add    a1, a1, #4
++        bl     idct_col_armv5te
++        add    a1, a1, #4
++        bl     idct_col_armv5te
++        add    a1, a1, #4
++        bl     idct_col_armv5te
++
++        ldmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, pc}
++        .endfunc
++
++        .align
++        .global simple_idct_add_armv5te
++        .func simple_idct_add_armv5te
++simple_idct_add_armv5te:
++        stmfd  sp!, {a1, a2, v1, v2, v3, v4, v5, v6, v7, fp, lr}
++
++        mov    a1, a3
++
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++
++        sub    a1, a1, #(16*7)
++
++        bl     idct_col_add_armv5te
++        add    a1, a1, #4
++        bl     idct_col_add_armv5te
++        add    a1, a1, #4
++        bl     idct_col_add_armv5te
++        add    a1, a1, #4
++        bl     idct_col_add_armv5te
++
++        add    sp, sp, #8
++        ldmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, pc}
++        .endfunc
++
++        .align
++        .global simple_idct_put_armv5te
++        .func simple_idct_put_armv5te
++simple_idct_put_armv5te:
++        stmfd  sp!, {a1, a2, v1, v2, v3, v4, v5, v6, v7, fp, lr}
++
++        mov    a1, a3
++
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++        add    a1, a1, #16
++        bl     idct_row_armv5te
++
++        sub    a1, a1, #(16*7)
++
++        bl     idct_col_put_armv5te
++        add    a1, a1, #4
++        bl     idct_col_put_armv5te
++        add    a1, a1, #4
++        bl     idct_col_put_armv5te
++        add    a1, a1, #4
++        bl     idct_col_put_armv5te
++
++        add    sp, sp, #8
++        ldmfd  sp!, {v1, v2, v3, v4, v5, v6, v7, fp, pc}
++        .endfunc
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/avcodec.h gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/avcodec.h
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/avcodec.h	2006-09-20 20:55:36.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/avcodec.h	2007-05-01 12:23:40.000000000 +0200
+@@ -1217,6 +1217,7 @@
+ #define FF_IDCT_IPP          13
+ #define FF_IDCT_XVIDMMX      14
+ #define FF_IDCT_CAVS         15
++#define FF_IDCT_SIMPLEARMV5TE 16
+ 
+     /**
+      * slice count.
+diff  -Nur gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/Makefile.am gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/Makefile.am
+--- gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/libavcodec/Makefile.am	2006-09-22 06:07:23.000000000 +0200
++++ gst-ffmpeg-0.10.2.new/gst-libs/ext/ffmpeg/libavcodec/Makefile.am	2007-05-01 12:23:40.000000000 +0200
+@@ -19,7 +19,10 @@
+ if HAVE_IWMMXT
+ iwmmxt_libs = armv4l/libiwmmxt.la
+ endif
+-armv4l_libs = armv4l/libarmv4l.la $(iwmmxt_libs)
++if HAVE_ARMV5TE
++armv5te_libs = armv4l/libarmv5te.la
++endif
++armv4l_libs = armv4l/libarmv4l.la $(iwmmxt_libs) $(armv5te_libs)
+ armv4l_dirs = armv4l
+ endif
+ 
diff --git a/recipes/obsolete/gstreamer/gst-ffmpeg/autotools.patch b/recipes/obsolete/gstreamer/gst-ffmpeg/autotools.patch
new file mode 100644
index 0000000..76e7ac6
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-ffmpeg/autotools.patch
@@ -0,0 +1,21 @@
+Index: gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac
+===================================================================
+--- gst-ffmpeg-0.10.2.orig/gst-libs/ext/ffmpeg/configure.ac	2008-08-20 00:20:19.177850039 +0200
++++ gst-ffmpeg-0.10.2/gst-libs/ext/ffmpeg/configure.ac	2008-08-20 00:26:24.567809464 +0200
+@@ -27,13 +27,15 @@
+ 
+ AM_MAINTAINER_MODE
+ AC_GNU_SOURCE
++
++AC_PROG_LIBTOOL
+ AM_PROG_AS
+ AC_PROG_CC
++AC_PROG_CXX
+ AC_PROG_INSTALL
+ AC_SYS_LARGEFILE
+ AC_STDC_HEADERS
+ AM_DISABLE_STATIC
+-AC_PROG_LIBTOOL
+ 
+ dnl Warning for anyone using these custom macros.
+ dnl before asking me questions on why it doesn't work and why you
diff --git a/recipes/obsolete/gstreamer/gst-ffmpeg_0.10.2.bb b/recipes/obsolete/gstreamer/gst-ffmpeg_0.10.2.bb
new file mode 100644
index 0000000..5164bbd
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-ffmpeg_0.10.2.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "FFmpeg-based GStreamer plug-in"
+SECTION = "multimedia"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+HOMEPAGE = "http://www.gstreamer.net/"
+DEPENDS = "gstreamer gst-plugins-base zlib"
+PR = "r2"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
+	   file://armv5.patch \
+	   file://autotools.patch \
+          "
+
+FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
+
+EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
+		--disable-vorbis --disable-vorbistest --disable-encoders \
+		--disable-v4l --disable-audio-oss --disable-dv1394 \
+		--disable-vhook --disable-ffmpeg --disable-ffserver \
+		--enable-pp --disable-decoder-vorbis"
+
+# We do this because the install program is called with -s which causes it to
+# call "strip" and it then mangles cross compiled stuff..
+PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
+
+# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
+CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
+
+
+SRC_URI[md5sum] = "3c7fb1cd1308b1972a76b86bb29fc890"
+SRC_URI[sha256sum] = "ffa7c89bccab5d1be53b6fcedcf7a5c071d585cf522fee5864add05d350f5842"
diff --git a/recipes/obsolete/gstreamer/gst-plugins-bad_0.10.20.bb b/recipes/obsolete/gstreamer/gst-plugins-bad_0.10.20.bb
new file mode 100644
index 0000000..17f20eb
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-bad_0.10.20.bb
@@ -0,0 +1,16 @@
+require gst-plugins.inc
+
+SRC_URI[archive.md5sum] = "7c84766f6d24f41ba90c3f6141012ab8"
+SRC_URI[archive.sha256sum] = "1031dff866df976a957f34039addbab4c0753406299a275f4cf1780e1dbe2a90"
+
+DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb libmodplug librsvg"
+
+PR = "${INC_PR}.2"
+
+# We don't have vdpau headers in OE and it creates crosscompile badness.
+# Also, mpeg2enc and mplex from mjpegtools don't build, because of AC_TRY_RUN.
+EXTRA_OECONF += " \
+        --disable-mpeg2enc \
+        --disable-mplex \
+        --disable-vdpau \
+"
diff --git a/recipes/obsolete/gstreamer/gst-plugins-base/fix-playbin2.patch b/recipes/obsolete/gstreamer/gst-plugins-base/fix-playbin2.patch
new file mode 100644
index 0000000..8aba3b6
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-base/fix-playbin2.patch
@@ -0,0 +1,26 @@
+From 0fe6b6e8abb131471d5bd04d7f7e27ca98a67659 Mon Sep 17 00:00:00 2001
+From: Brijesh Singh <brijesh.ksingh@gmail.com>
+Date: Wed, 13 Jan 2010 08:39:54 +0000
+Subject: playsink: Fix handling of the native audio/video flags
+
+Fixes bug #606687.
+---
+
+--- /tmp/gstplaysink.c	2010-01-23 12:23:20.000000000 +0100
++++ gst-plugins-base-0.10.25/gst/playback/gstplaysink.c	2010-01-23 12:27:51.000000000 +0100
+@@ -1880,12 +1880,13 @@
+      * pick one and ignore the other then instead of erroring out?) */
+     if (need_text && need_subp)
+       goto subs_and_text;
+-  } else if (flags & GST_PLAY_FLAG_VIDEO && playsink->video_pad) {
++  } else if (((flags & GST_PLAY_FLAG_VIDEO)
++          || (flags & GST_PLAY_FLAG_NATIVE_VIDEO)) && playsink->video_pad) {
+     /* we have video and we are requested to show it */
+     need_video = TRUE;
+   }
+   if (playsink->audio_pad) {
+-    if (flags & GST_PLAY_FLAG_AUDIO) {
++    if ((flags & GST_PLAY_FLAG_AUDIO) || (flags & GST_PLAY_FLAG_NATIVE_AUDIO)) {
+       need_audio = TRUE;
+     }
+     if (playsink->audio_pad_raw) {
diff --git a/recipes/obsolete/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch b/recipes/obsolete/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch
new file mode 100644
index 0000000..3c0cffa
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-base/gst-plugins-base_rowstride.patch
@@ -0,0 +1,1577 @@
+From 32a7af0874fe13774c65919941c3be59b72c646a Mon Sep 17 00:00:00 2001
+From: Rob Clark <rob@ti.com>
+Date: Thu, 30 Jul 2009 14:50:05 -0500
+Subject: [PATCH] add rowstride support to video utility functions
+
+This is a combination of 7 commits:
+* add rowstride support to video utility functions
+* stridetransform: skeletal implementation of stridetransform element
+* stridetransform: implement caps negotiation and related parts
+* stridetransform: implement transform function
+* audioconvert: add NEON acceleration for some conversions
+* add gst_stride_transform_transform_size()
+* fix a small typo..  need to use the smaller of {new_width, orig_width} for the line-by-line copy to avoid overwriting past end of buffer
+---
+ configure.ac                        |    2 +
+ gst-libs/gst/video/gstvideofilter.c |    8 +-
+ gst-libs/gst/video/video.c          |  234 +++++++++++++++---
+ gst-libs/gst/video/video.h          |   39 ++-
+ gst/audioconvert/Makefile.am        |    1 +
+ gst/audioconvert/armv7.c            |  209 ++++++++++++++++
+ gst/audioconvert/audioconvert.c     |   20 +-
+ gst/audioconvert/gstaudioquantize.c |    4 +-
+ gst/audioconvert/gstchannelmix.c    |    4 +-
+ gst/stride/Makefile.am              |   15 ++
+ gst/stride/gststridetransform.c     |  471 +++++++++++++++++++++++++++++++++++
+ gst/stride/gststridetransform.h     |   80 ++++++
+ gst/stride/plugin.c                 |   45 ++++
+ 13 files changed, 1064 insertions(+), 68 deletions(-)
+ create mode 100644 gst/audioconvert/armv7.c
+ create mode 100644 gst/stride/Makefile.am
+ create mode 100644 gst/stride/gststridetransform.c
+ create mode 100644 gst/stride/gststridetransform.h
+ create mode 100644 gst/stride/plugin.c
+
+diff --git a/configure.ac b/configure.ac
+index 6a39c73..5da8ac2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -319,6 +319,7 @@ AG_GST_CHECK_PLUGIN(ffmpegcolorspace)
+ AG_GST_CHECK_PLUGIN(gdp)
+ AG_GST_CHECK_PLUGIN(playback)
+ AG_GST_CHECK_PLUGIN(audioresample)
++AG_GST_CHECK_PLUGIN(stride)
+ AG_GST_CHECK_PLUGIN(subparse)
+ AG_GST_CHECK_PLUGIN(tcp)
+ AG_GST_CHECK_PLUGIN(typefind)
+@@ -739,6 +740,7 @@ gst/ffmpegcolorspace/Makefile
+ gst/gdp/Makefile
+ gst/playback/Makefile
+ gst/audioresample/Makefile
++gst/stride/Makefile
+ gst/subparse/Makefile
+ gst/tcp/Makefile
+ gst/typefind/Makefile
+diff --git a/gst-libs/gst/video/gstvideofilter.c b/gst-libs/gst/video/gstvideofilter.c
+index 2d08a60..6b2d7b7 100644
+--- a/gst-libs/gst/video/gstvideofilter.c
++++ b/gst-libs/gst/video/gstvideofilter.c
+@@ -21,7 +21,7 @@
+  /**
+  * SECTION:gstvideofilter
+  * @short_description: Base class for video filters
+- * 
++ *
+  * <refsect2>
+  * <para>
+  * Provides useful functions and a base class for video filters.
+@@ -78,14 +78,14 @@ gst_video_filter_get_unit_size (GstBaseTransform * btrans, GstCaps * caps,
+     guint * size)
+ {
+   GstVideoFormat fmt;
+-  gint width, height;
++  gint width, height, rowstride;
+ 
+-  if (!gst_video_format_parse_caps (caps, &fmt, &width, &height)) {
++  if (!gst_video_format_parse_caps_strided (caps, &fmt, &width, &height, &rowstride)) {
+     GST_WARNING_OBJECT (btrans, "Failed to parse caps %" GST_PTR_FORMAT, caps);
+     return FALSE;
+   }
+ 
+-  *size = gst_video_format_get_size (fmt, width, height);
++  *size = gst_video_format_get_size_strided (fmt, width, height, rowstride);
+ 
+   GST_DEBUG_OBJECT (btrans, "Returning size %u bytes for caps %"
+       GST_PTR_FORMAT, *size, caps);
+diff --git a/gst-libs/gst/video/video.c b/gst-libs/gst/video/video.c
+index ab1d8c0..1815bf1 100644
+--- a/gst-libs/gst/video/video.c
++++ b/gst-libs/gst/video/video.c
+@@ -31,7 +31,7 @@
+  *
+  * <refsect2>
+  * <para>
+- * This library contains some helper functions and includes the 
++ * This library contains some helper functions and includes the
+  * videosink and videofilter base classes.
+  * </para>
+  * </refsect2>
+@@ -51,7 +51,7 @@ static GstVideoFormat gst_video_format_from_rgb24_masks (int red_mask,
+  *
+  * A convenience function to retrieve a GValue holding the framerate
+  * from the caps on a pad.
+- * 
++ *
+  * The pad needs to have negotiated caps containing a framerate property.
+  *
+  * Returns: NULL if the pad has no configured caps or the configured caps
+@@ -104,7 +104,7 @@ gst_video_frame_rate (GstPad * pad)
+  *
+  * Inspect the caps of the provided pad and retrieve the width and height of
+  * the video frames it is configured for.
+- * 
++ *
+  * The pad needs to have negotiated caps containing width and height properties.
+  *
+  * Returns: TRUE if the width and height could be retrieved.
+@@ -156,13 +156,13 @@ gst_video_get_size (GstPad * pad, gint * width, gint * height)
+  * @display_par_n: Numerator of the pixel aspect ratio of the display device
+  * @display_par_d: Denominator of the pixel aspect ratio of the display device
+  *
+- * Given the Pixel Aspect Ratio and size of an input video frame, and the 
+- * pixel aspect ratio of the intended display device, calculates the actual 
++ * Given the Pixel Aspect Ratio and size of an input video frame, and the
++ * pixel aspect ratio of the intended display device, calculates the actual
+  * display ratio the video will be rendered with.
+  *
+- * Returns: A boolean indicating success and a calculated Display Ratio in the 
+- * dar_n and dar_d parameters. 
+- * The return value is FALSE in the case of integer overflow or other error. 
++ * Returns: A boolean indicating success and a calculated Display Ratio in the
++ * dar_n and dar_d parameters.
++ * The return value is FALSE in the case of integer overflow or other error.
+  *
+  * Since: 0.10.7
+  */
+@@ -250,28 +250,15 @@ gst_video_format_parse_caps_interlaced (GstCaps * caps, gboolean * interlaced)
+ }
+ 
+ /**
+- * gst_video_format_parse_caps:
+- * @caps: the #GstCaps to parse
+- * @format: the #GstVideoFormat of the video represented by @caps (output)
+- * @width: the width of the video represented by @caps, may be NULL (output)
+- * @height: the height of the video represented by @caps, may be NULL (output)
+- *
+- * Determines the #GstVideoFormat of @caps and places it in the location
+- * pointed to by @format.  Extracts the size of the video and places it
+- * in the location pointed to by @width and @height.  If @caps does not
+- * represent one of the raw video formats listed in #GstVideoFormat, the
+- * function will fail and return FALSE.
+- *
+- * Since: 0.10.16
+- *
+- * Returns: TRUE if @caps was parsed correctly.
++ * see gst_video_format_parse_caps_strided and gst_video_format_parse_caps
+  */
+-gboolean
+-gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
+-    int *width, int *height)
++static gboolean
++parse_caps (GstCaps * caps, GstVideoFormat * format, gint *width, gint *height,
++    gboolean stride_ok, gint *rowstride)
+ {
+   GstStructure *structure;
+   gboolean ok = TRUE;
++  gboolean strided = FALSE;
+ 
+   if (!gst_caps_is_fixed (caps))
+     return FALSE;
+@@ -279,7 +266,10 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
+   structure = gst_caps_get_structure (caps, 0);
+ 
+   if (format) {
+-    if (gst_structure_has_name (structure, "video/x-raw-yuv")) {
++    if (gst_structure_has_name (structure, "video/x-raw-yuv") ||
++        (stride_ok &&
++            gst_structure_has_name (structure, "video/x-raw-yuv-strided") &&
++            (strided=TRUE) /* single '=' intentional */)) {
+       guint32 fourcc;
+ 
+       ok &= gst_structure_get_fourcc (structure, "format", &fourcc);
+@@ -288,7 +278,10 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
+       if (*format == GST_VIDEO_FORMAT_UNKNOWN) {
+         ok = FALSE;
+       }
+-    } else if (gst_structure_has_name (structure, "video/x-raw-rgb")) {
++    } else if (gst_structure_has_name (structure, "video/x-raw-rgb") ||
++        (stride_ok &&
++            gst_structure_has_name (structure, "video/x-raw-rgb-strided") &&
++            (strided=TRUE) /* single '=' intentional */)) {
+       int depth;
+       int bpp;
+       int endianness;
+@@ -333,6 +326,10 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
+     }
+   }
+ 
++  /* note: should we require that the caps have these fields, even if
++   * the caller does not particularly request them??
++   */
++
+   if (width) {
+     ok &= gst_structure_get_int (structure, "width", width);
+   }
+@@ -341,11 +338,70 @@ gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
+     ok &= gst_structure_get_int (structure, "height", height);
+   }
+ 
++  if (rowstride) {
++    if (strided) {
++      ok &= gst_structure_get_int (structure, "rowstride", rowstride);
++    } else {
++      *rowstride = 0;  /* not a strided format */
++    }
++  }
++
+   return ok;
+ }
+ 
+ 
+ /**
++ * gst_video_format_parse_caps_strided:
++ * @caps: the #GstCaps to parse
++ * @format: the #GstVideoFormat of the video represented by @caps (output)
++ * @width: the width of the video represented by @caps, may be NULL (output)
++ * @height: the height of the video represented by @caps, may be NULL (output)
++ * @rowstride: the rowstride (in bytes) represented by @caps, or 0 if there
++ *    is no rowstride, may be NULL (output)
++ *
++ * Determines the #GstVideoFormat of @caps and places it in the location
++ * pointed to by @format.  Extracts the size of the video and places it
++ * in the location pointed to by @width and @height.  Extracts the row-
++ * stride and places it in the location pointed to by @rowstride.  If
++ * @caps does not represent one of the raw video formats listed in
++ * #GstVideoFormat, the function will fail and return FALSE.
++ *
++ * Since: ???
++ *
++ * Returns: TRUE if @caps was parsed correctly.
++ */
++gboolean
++gst_video_format_parse_caps_strided (GstCaps * caps, GstVideoFormat * format,
++    int *width, int *height, int *rowstride)
++{
++  return parse_caps (caps, format, width, height, TRUE, rowstride);
++}
++
++/**
++ * gst_video_format_parse_caps:
++ * @caps: the #GstCaps to parse
++ * @format: the #GstVideoFormat of the video represented by @caps (output)
++ * @width: the width of the video represented by @caps, may be NULL (output)
++ * @height: the height of the video represented by @caps, may be NULL (output)
++ *
++ * Determines the #GstVideoFormat of @caps and places it in the location
++ * pointed to by @format.  Extracts the size of the video and places it
++ * in the location pointed to by @width and @height.  If @caps does not
++ * represent one of the raw video formats listed in #GstVideoFormat, the
++ * function will fail and return FALSE.
++ *
++ * Since: 0.10.16
++ *
++ * Returns: TRUE if @caps was parsed correctly.
++ */
++gboolean
++gst_video_format_parse_caps (GstCaps * caps, GstVideoFormat * format,
++    int *width, int *height)
++{
++  return parse_caps (caps, format, width, height, FALSE, NULL);
++}
++
++/**
+  * gst_video_parse_caps_framerate:
+  * @caps: pointer to a #GstCaps instance
+  * @fps_n: pointer to integer to hold numerator of frame rate (output)
+@@ -444,10 +500,11 @@ gst_video_format_new_caps_interlaced (GstVideoFormat format, int width,
+ }
+ 
+ /**
+- * gst_video_format_new_caps:
++ * gst_video_format_new_caps_strided:
+  * @format: the #GstVideoFormat describing the raw video format
+  * @width: width of video
+  * @height: height of video
++ * @rowstride: the rowstride (in bytes), or 0 if no rowstride
+  * @framerate_n: numerator of frame rate
+  * @framerate_d: denominator of frame rate
+  * @par_n: numerator of pixel aspect ratio
+@@ -455,26 +512,29 @@ gst_video_format_new_caps_interlaced (GstVideoFormat format, int width,
+  *
+  * Creates a new #GstCaps object based on the parameters provided.
+  *
+- * Since: 0.10.16
++ * Since: ???
+  *
+  * Returns: a new #GstCaps object, or NULL if there was an error
+  */
+ GstCaps *
+-gst_video_format_new_caps (GstVideoFormat format, int width, int height,
++gst_video_format_new_caps_strided (GstVideoFormat format,
++    int width, int height, int rowstride,
+     int framerate_n, int framerate_d, int par_n, int par_d)
+ {
++  GstCaps *caps = NULL;
++
+   g_return_val_if_fail (format != GST_VIDEO_FORMAT_UNKNOWN, NULL);
+   g_return_val_if_fail (width > 0 && height > 0, NULL);
+ 
+   if (gst_video_format_is_yuv (format)) {
+-    return gst_caps_new_simple ("video/x-raw-yuv",
++    caps = gst_caps_new_simple (
++        rowstride ? "video/x-raw-yuv-strided" : "video/x-raw-yuv",
+         "format", GST_TYPE_FOURCC, gst_video_format_to_fourcc (format),
+         "width", G_TYPE_INT, width,
+         "height", G_TYPE_INT, height,
+         "framerate", GST_TYPE_FRACTION, framerate_n, framerate_d,
+         "pixel-aspect-ratio", GST_TYPE_FRACTION, par_n, par_d, NULL);
+-  }
+-  if (gst_video_format_is_rgb (format)) {
++  } else if (gst_video_format_is_rgb (format)) {
+     GstCaps *caps;
+     int red_mask;
+     int blue_mask;
+@@ -526,7 +586,8 @@ gst_video_format_new_caps (GstVideoFormat format, int width, int height,
+         mask >> (8 * gst_video_format_get_component_offset (format, 2, width,
+             height));
+ 
+-    caps = gst_caps_new_simple ("video/x-raw-rgb",
++    caps = gst_caps_new_simple (
++        rowstride ? "video/x-raw-rgb-strided" : "video/x-raw-rgb",
+         "bpp", G_TYPE_INT, bpp,
+         "depth", G_TYPE_INT, depth,
+         "endianness", G_TYPE_INT, G_BIG_ENDIAN,
+@@ -543,9 +604,39 @@ gst_video_format_new_caps (GstVideoFormat format, int width, int height,
+               height));
+       gst_caps_set_simple (caps, "alpha_mask", G_TYPE_INT, alpha_mask, NULL);
+     }
+-    return caps;
++  } else {
++    return NULL;
++  }
++
++  if (rowstride) {
++    gst_caps_set_simple (caps, "rowstride", G_TYPE_INT, rowstride, NULL);
+   }
+-  return NULL;
++
++  return caps;
++}
++
++/**
++ * gst_video_format_new_caps:
++ * @format: the #GstVideoFormat describing the raw video format
++ * @width: width of video
++ * @height: height of video
++ * @framerate_n: numerator of frame rate
++ * @framerate_d: denominator of frame rate
++ * @par_n: numerator of pixel aspect ratio
++ * @par_d: denominator of pixel aspect ratio
++ *
++ * Creates a new #GstCaps object based on the parameters provided.
++ *
++ * Since: 0.10.16
++ *
++ * Returns: a new #GstCaps object, or NULL if there was an error
++ */
++GstCaps *
++gst_video_format_new_caps (GstVideoFormat format, int width, int height,
++    int framerate_n, int framerate_d, int par_n, int par_d)
++{
++  return gst_video_format_new_caps_strided (format, width, height, 0,
++      framerate_n, framerate_d, par_n, par_d);
+ }
+ 
+ /**
+@@ -643,7 +734,7 @@ gst_video_format_to_fourcc (GstVideoFormat format)
+  * @blue_mask: blue bit mask
+  *
+  * Converts red, green, blue bit masks into the corresponding
+- * #GstVideoFormat.  
++ * #GstVideoFormat.
+  *
+  * Since: 0.10.16
+  *
+@@ -796,7 +887,7 @@ gst_video_format_is_yuv (GstVideoFormat format)
+ /**
+  * gst_video_format_has_alpha:
+  * @format: a #GstVideoFormat
+- * 
++ *
+  * Returns TRUE or FALSE depending on if the video format provides an
+  * alpha channel.
+  *
+@@ -1328,6 +1419,71 @@ gst_video_format_get_size (GstVideoFormat format, int width, int height)
+ }
+ 
+ /**
++ * gst_video_format_get_size_strided:
++ * @format: a #GstVideoFormat
++ * @width: the width of video (in pixels)
++ * @height: the height of video (in pixels)
++ * @rowstride: the rowstride (in bytes), or 0 if no rowstride (in which
++ *    case the returned value is same as #gst_video_format_get_size())
++ *
++ * Calculates the total number of bytes in the raw video format, for a buffer
++ * which may have a rowstride in bytes
++ *
++ * Since: ???
++ *
++ * Returns: size (in bytes) of raw video format
++ */
++int
++gst_video_format_get_size_strided (GstVideoFormat format,
++    int width, int height, int rowstride)
++{
++  if(!rowstride)
++    return gst_video_format_get_size (format, width, height);
++
++  g_return_val_if_fail (format != GST_VIDEO_FORMAT_UNKNOWN, 0);
++  g_return_val_if_fail (width > 0 && height > 0, 0);
++
++  switch (format) {
++    /* all packed formats have the same calculation, ie. rowstride * height
++     */
++    case GST_VIDEO_FORMAT_RGBx:
++    case GST_VIDEO_FORMAT_BGRx:
++    case GST_VIDEO_FORMAT_xRGB:
++    case GST_VIDEO_FORMAT_xBGR:
++    case GST_VIDEO_FORMAT_RGBA:
++    case GST_VIDEO_FORMAT_BGRA:
++    case GST_VIDEO_FORMAT_ARGB:
++    case GST_VIDEO_FORMAT_ABGR:
++    case GST_VIDEO_FORMAT_RGB:
++    case GST_VIDEO_FORMAT_BGR:
++    case GST_VIDEO_FORMAT_YUY2:
++    case GST_VIDEO_FORMAT_YVYU:
++    case GST_VIDEO_FORMAT_UYVY:
++    case GST_VIDEO_FORMAT_AYUV:
++    case GST_VIDEO_FORMAT_v210:
++    case GST_VIDEO_FORMAT_v216:
++      return GST_ROUND_UP_4 (rowstride * height);
++
++    /* these planar formats have 2x sub-sampling in the vertical direction,
++     * so U/V have half as many rows as Y:
++     */
++    case GST_VIDEO_FORMAT_I420:
++    case GST_VIDEO_FORMAT_YV12:
++      return GST_ROUND_UP_4 (2 * rowstride * height);
++
++    /* these planar formats have no sub-sampling in the vertical direction,
++     * so each plane has 'height' number of rows
++     */
++    case GST_VIDEO_FORMAT_Y41B:
++    case GST_VIDEO_FORMAT_Y42B:
++    case GST_VIDEO_FORMAT_Y444:
++      return GST_ROUND_UP_4 (3 * rowstride * height);
++    default:
++      return 0;
++  }
++}
++
++/**
+  * gst_video_format_convert:
+  * @format: a #GstVideoFormat
+  * @width: the width of video
+diff --git a/gst-libs/gst/video/video.h b/gst-libs/gst/video/video.h
+index 162a766..ed20179 100644
+--- a/gst-libs/gst/video/video.h
++++ b/gst-libs/gst/video/video.h
+@@ -33,7 +33,7 @@ G_BEGIN_DECLS
+  * @GST_VIDEO_FORMAT_I420: planar 4:2:0 YUV
+  * @GST_VIDEO_FORMAT_YV12: planar 4:2:0 YVU (like I420 but UV planes swapped)
+  * @GST_VIDEO_FORMAT_YUY2: packed 4:2:2 YUV (Y0-U0-Y1-V0 Y2-U2-Y3-V2 Y4 ...)
+- * @GST_VIDEO_FORMAT_UYVY: packed 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...) 
++ * @GST_VIDEO_FORMAT_UYVY: packed 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...)
+  * @GST_VIDEO_FORMAT_AYUV: packed 4:4:4 YUV with alpha channel (A0-Y0-U0-V0 ...)
+  * @GST_VIDEO_FORMAT_RGBx: sparse rgb packed into 32 bit, space last
+  * @GST_VIDEO_FORMAT_BGRx: sparse reverse rgb packed into 32 bit, space last
+@@ -167,13 +167,13 @@ typedef enum {
+ 
+ #define GST_VIDEO_CAPS_RGBx \
+     __GST_VIDEO_CAPS_MAKE_32 (1, 2, 3)
+-  
++
+ #define GST_VIDEO_CAPS_xRGB \
+     __GST_VIDEO_CAPS_MAKE_32 (2, 3, 4)
+-  
++
+ #define GST_VIDEO_CAPS_BGRx \
+     __GST_VIDEO_CAPS_MAKE_32 (3, 2, 1)
+-  
++
+ #define GST_VIDEO_CAPS_xBGR \
+     __GST_VIDEO_CAPS_MAKE_32 (4, 3, 2)
+ 
+@@ -181,13 +181,13 @@ typedef enum {
+ 
+ #define GST_VIDEO_CAPS_RGBA \
+     __GST_VIDEO_CAPS_MAKE_32A (1, 2, 3, 4)
+-  
++
+ #define GST_VIDEO_CAPS_ARGB \
+     __GST_VIDEO_CAPS_MAKE_32A (2, 3, 4, 1)
+-  
++
+ #define GST_VIDEO_CAPS_BGRA \
+     __GST_VIDEO_CAPS_MAKE_32A (3, 2, 1, 4)
+-  
++
+ #define GST_VIDEO_CAPS_ABGR \
+     __GST_VIDEO_CAPS_MAKE_32A (4, 3, 2, 1)
+ 
+@@ -203,9 +203,9 @@ typedef enum {
+   #define GST_VIDEO_CAPS_BGRx_HOST_ENDIAN \
+       GST_VIDEO_CAPS_xRGB
+ #endif
+-      
++
+ /* 15/16 bit */
+-  
++
+ #define GST_VIDEO_CAPS_RGB_16                                           \
+             "video/x-raw-rgb, "                                         \
+             "bpp = (int) 16, "                                          \
+@@ -237,6 +237,16 @@ typedef enum {
+         "height = " GST_VIDEO_SIZE_RANGE ", "                           \
+         "framerate = " GST_VIDEO_FPS_RANGE
+ 
++
++#define GST_VIDEO_CAPS_YUV_STRIDED(fourcc, rowstride)                   \
++        GST_VIDEO_CAPS_YUV(fourcc) "; "                                 \
++        "video/x-raw-yuv-strided, "                                     \
++        "format = (fourcc) " fourcc ", "                                \
++        "rowstride = (int) " rowstride ", "                             \
++        "width = " GST_VIDEO_SIZE_RANGE ", "                            \
++        "height = " GST_VIDEO_SIZE_RANGE ", "                           \
++        "framerate = " GST_VIDEO_FPS_RANGE
++
+ /* buffer flags */
+ 
+ /**
+@@ -276,13 +286,15 @@ gboolean gst_video_get_size   (GstPad *pad,
+                                gint   *height);
+ 
+ gboolean gst_video_calculate_display_ratio (guint *dar_n, guint *dar_d,
+-            guint video_width, guint video_height, 
+-            guint video_par_n, guint video_par_d, 
++            guint video_width, guint video_height,
++            guint video_par_n, guint video_par_d,
+             guint display_par_n, guint display_par_d);
+ 
+ gboolean gst_video_format_parse_caps (GstCaps *caps, GstVideoFormat *format,
+     int *width, int *height);
+ gboolean gst_video_format_parse_caps_interlaced (GstCaps *caps, gboolean *interlaced);
++gboolean gst_video_format_parse_caps_strided (GstCaps * caps, GstVideoFormat * format,
++    int *width, int *height, int *rowstride);
+ gboolean gst_video_parse_caps_framerate (GstCaps *caps,
+     int *fps_n, int *fps_d);
+ gboolean gst_video_parse_caps_pixel_aspect_ratio (GstCaps *caps,
+@@ -293,6 +305,9 @@ GstCaps * gst_video_format_new_caps (GstVideoFormat format,
+ GstCaps * gst_video_format_new_caps_interlaced (GstVideoFormat format,
+     int width, int height, int framerate_n, int framerate_d,
+ 						int par_n, int par_d, gboolean interlaced);
++GstCaps * gst_video_format_new_caps_strided (GstVideoFormat format,
++    int width, int height, int rowstride,
++    int framerate_n, int framerate_d, int par_n, int par_d);
+ GstVideoFormat gst_video_format_from_fourcc (guint32 fourcc);
+ guint32 gst_video_format_to_fourcc (GstVideoFormat format);
+ gboolean gst_video_format_is_rgb (GstVideoFormat format);
+@@ -308,6 +323,8 @@ int gst_video_format_get_component_height (GstVideoFormat format, int component,
+ int gst_video_format_get_component_offset (GstVideoFormat format, int component,
+     int width, int height);
+ int gst_video_format_get_size (GstVideoFormat format, int width, int height);
++int gst_video_format_get_size_strided (GstVideoFormat format,
++    int width, int height, int rowstride);
+ gboolean gst_video_format_convert (GstVideoFormat format, int width, int height,
+     int fps_n, int fps_d,
+     GstFormat src_format, gint64 src_value,
+diff --git a/gst/audioconvert/Makefile.am b/gst/audioconvert/Makefile.am
+index 94978bb..2d273db 100644
+--- a/gst/audioconvert/Makefile.am
++++ b/gst/audioconvert/Makefile.am
+@@ -5,6 +5,7 @@ libgstaudioconvert_la_SOURCES = \
+ 	audioconvert.c \
+ 	gstchannelmix.c \
+ 	gstaudioquantize.c \
++	armv7.c \
+ 	plugin.c
+ 
+ libgstaudioconvert_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS)
+diff --git a/gst/audioconvert/armv7.c b/gst/audioconvert/armv7.c
+new file mode 100644
+index 0000000..e39d29d
+--- /dev/null
++++ b/gst/audioconvert/armv7.c
+@@ -0,0 +1,209 @@
++/* GStreamer
++ *
++ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
++ *
++ * Description: NEON/VFP accelerated functions for armv7 architecture
++ *  Created on: Aug 8, 2009
++ *      Author: Rob Clark <rob@ti.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ */
++
++#ifdef __ARM_NEON__
++#include <arm_neon.h>
++#include <string.h>
++
++#include "audioconvert.h"
++
++
++void
++gst_audio_quantize_quantize_signed_tpdf_none (AudioConvertCtx *ctx,
++    gint32 *src, gint32 *dst, gint count)
++{
++  static guint32 state[4] = {
++      0xdeadbeef,
++      0x305b8cc9,
++      0x6c46ec93,
++      0xad13b0cd
++  };
++
++  gint scale = ctx->out_scale;
++  count *= ctx->out.channels;
++
++  if (scale > 0) {
++    guint32 mask = 0xffffffff & (0xffffffff << scale);
++    guint32 bias = (1U << (scale - 1)) >> 1;
++    gint32 dither = (1<<(scale - 1));
++
++    int32x4_t  vrand;
++    uint32x4_t vstate;
++    uint32x4_t v12345;
++    int32x4_t  vtmp;
++    uint32x4_t vmask;
++
++    vstate = vld1q_u32 (state);
++    v12345 = vmovq_n_u32 (12345);
++    vmask  = vmovq_n_u32 (mask);
++
++    /* until we have less 4 words less to process, use vector instructions
++     * to do everything 4x at a time:
++     */
++    for (;;count-=4) {
++      int64x2_t  vtmp_lo;
++      int64x2_t  vtmp_hi;
++      uint32x4_t vstate2;
++      int32x2_t  vrand_lo;
++      int32x2_t  vrand_hi;
++
++      /* generate next eight random words: (see gst_fast_random_uint32())
++       *
++       *    state = state * 1103515245 + 12345
++       */
++      vstate2 = vmulq_n_u32 (vstate, 1103515245);
++      vstate2 = vaddq_u32 (vstate2, v12345);
++      vstate  = vmulq_n_u32 (vstate2, 1103515245);
++      vstate  = vaddq_u32 (vstate2, v12345);
++
++      /* generate next four scaled random values:
++       *
++       *    gint32 start = bias - dither;
++       *    gint32 end = bias + dither - 1;
++       *    gint64 tmp1 = gst_fast_random_uint32 ();
++       *    gint64 tmp2 = gst_fast_random_uint32 ();
++       *    rand = (gint32)(((tmp1+tmp2) * (end - start)) / (1LLU<<32) + start);
++       *
++       * need to split vstate and vstate2 into 2*2 int64x2_t and add....
++       */
++      vstate2 = vaddq_u32 (vstate, vstate2);     /* tmp1+tmp2 */
++      vtmp_lo = vreinterpretq_s64_u64 (          /* * (end-start) */
++          vmull_n_u32 (vget_low_u32 (vstate2), (2*dither) - 1));
++      vtmp_hi = vreinterpretq_s64_u64 (          /* * (end-start) */
++          vmull_n_u32 (vget_high_u32 (vstate2), (2*dither) - 1));
++
++      vtmp_lo = vshrq_n_s64 (vtmp_lo, 32);       /* / (1LLU<<32) */
++      vtmp_hi = vshrq_n_s64 (vtmp_hi, 32);       /* / (1LLU<<32) */
++
++
++      /* now want to put vtmp_hi and vtmp_lo back together..
++       * then add 'start' (bias-dither).. which is negative..
++       */
++      vrand_lo = vmovn_s64 (vtmp_lo);
++      vrand_hi = vmovn_s64 (vtmp_hi);
++      vrand    = vcombine_s32 (vrand_lo, vrand_hi);
++      vrand    = vaddq_s32 (vrand, vmovq_n_s32 (bias-dither));
++
++      /* load next 4 words:
++       */
++      vtmp = vld1q_s32 (src);
++      src += 4;
++
++      /* perform saturating add of random noise... we don't want the
++       * value to wrap around:
++       *
++       * XXX I *think* vqaddq will handle saturation for underflow too..
++       */
++      vtmp = vqaddq_s32 (vtmp, vrand);
++      vtmp = vreinterpretq_s32_u32 (
++          vandq_u32 (vreinterpretq_u32_s32 (vtmp), vmask));
++
++      /* we check for less than four remaining words at the end, before
++       * we store the result back.. the assumption is that it shouldn't
++       * cause a segfault to read past the end of 'src', and there is no
++       * harm in processing a few garbage words.  But we definitely don't
++       * want to write past the end of 'dst'
++       */
++      if (count<4) break;
++
++      /* store 4 words to result:
++       */
++      vst1q_s32 (dst, vtmp);
++      dst += 4;
++    }
++
++    vst1q_u32 (state, vstate);
++
++    /* at this point, we could have 0-3 result bytes in vtmp to write
++     * back out to 'dst':
++     */
++    if (count) {
++      gint32 tmpdst[4];
++      gint32 *tmpp = tmpdst;
++
++      vst1q_s32 (tmpdst, vtmp);
++
++      while (count--) {
++        *dst++ = *tmpp++;
++      }
++    }
++
++  } else {
++    memmove (dst, src, count);
++  }
++}
++
++void
++gst_audio_convert_unpack_float_le (gfloat * src, gint32 * dst, gint s, gint count)
++{
++  float32x4_t vsrc;
++  float32x4_t v05;
++  int32x4_t   vdst;
++
++  v05 = vmovq_n_f32 (0.5);
++
++  for (;;count-=4) {
++
++    /* load next 4 words:
++     */
++    vsrc = vld1q_f32 ((float32_t *)src);
++    src += 4;
++
++    /* convert to int:
++     */
++    vsrc = vmulq_n_f32 (vsrc, 2147483647.0);
++    vsrc = vaddq_f32 (vsrc, v05);
++    vdst = vcvtq_s32_f32 (vsrc);
++
++    /* we check for less than four remaining words at the end, before
++     * we store the result back.. the assumption is that it shouldn't
++     * cause a segfault to read past the end of 'src', and there is no
++     * harm in processing a few garbage words.  But we definitely don't
++     * want to write past the end of 'dst'
++     */
++    if (count<4) break;
++
++    /* store 4 words to result:
++     */
++    vst1q_s32 (dst, vdst);
++    dst += 4;
++  }
++
++  /* at this point, we could have 0-3 result bytes in vtmp to write
++   * back out to 'dst':
++   */
++  if (count) {
++    gint32 tmpdst[4];
++    gint32 *tmpp = tmpdst;
++
++    vst1q_s32 (tmpdst, vdst);
++
++    while (count--) {
++      *dst++ = *tmpp++;
++    }
++  }
++}
++
++
++#endif
+diff --git a/gst/audioconvert/audioconvert.c b/gst/audioconvert/audioconvert.c
+index 4780324..c18d217 100644
+--- a/gst/audioconvert/audioconvert.c
++++ b/gst/audioconvert/audioconvert.c
+@@ -38,11 +38,11 @@
+  * unpack code
+  */
+ #define MAKE_UNPACK_FUNC_NAME(name)                                     \
+-audio_convert_unpack_##name
++gst_audio_convert_unpack_##name
+ 
+ /* unpack from integer to signed integer 32 */
+ #define MAKE_UNPACK_FUNC_II(name, stride, sign, READ_FUNC)              \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_UNPACK_FUNC_NAME (name) (guint8 *src, gint32 *dst,                 \
+         gint scale, gint count)                                         \
+ {                                                                       \
+@@ -54,7 +54,7 @@ MAKE_UNPACK_FUNC_NAME (name) (guint8 *src, gint32 *dst,                 \
+ 
+ /* unpack from float to signed integer 32 */
+ #define MAKE_UNPACK_FUNC_FI(name, type, READ_FUNC)                            \
+-static void                                                                   \
++void __attribute__((weak))                                                    \
+ MAKE_UNPACK_FUNC_NAME (name) (type * src, gint32 * dst, gint s, gint count)   \
+ {                                                                             \
+   gdouble temp;                                                               \
+@@ -68,7 +68,7 @@ MAKE_UNPACK_FUNC_NAME (name) (type * src, gint32 * dst, gint s, gint count)   \
+ 
+ /* unpack from float to float 64 (double) */
+ #define MAKE_UNPACK_FUNC_FF(name, type, FUNC)                                 \
+-static void                                                                   \
++void __attribute__((weak))                                                    \
+ MAKE_UNPACK_FUNC_NAME (name) (type * src, gdouble * dst, gint s,              \
+     gint count)                                                               \
+ {                                                                             \
+@@ -78,7 +78,7 @@ MAKE_UNPACK_FUNC_NAME (name) (type * src, gdouble * dst, gint s,              \
+ 
+ /* unpack from int to float 64 (double) */
+ #define MAKE_UNPACK_FUNC_IF(name, stride, sign, READ_FUNC)                    \
+-static void                                                                   \
++void __attribute__((weak))                                                    \
+ MAKE_UNPACK_FUNC_NAME (name) (guint8 * src, gdouble * dst, gint scale,        \
+     gint count)                                                               \
+ {                                                                             \
+@@ -158,7 +158,7 @@ audio_convert_pack_##name
+ 
+ /* pack from signed integer 32 to integer */
+ #define MAKE_PACK_FUNC_II(name, stride, sign, WRITE_FUNC)               \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_PACK_FUNC_NAME (name) (gint32 *src, guint8 * dst,                  \
+         gint scale, gint count)                                         \
+ {                                                                       \
+@@ -172,7 +172,7 @@ MAKE_PACK_FUNC_NAME (name) (gint32 *src, guint8 * dst,                  \
+ 
+ /* pack from signed integer 32 to float */
+ #define MAKE_PACK_FUNC_IF(name, type, FUNC)                             \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_PACK_FUNC_NAME (name) (gint32 * src, type * dst, gint scale,       \
+     gint count)                                                         \
+ {                                                                       \
+@@ -182,7 +182,7 @@ MAKE_PACK_FUNC_NAME (name) (gint32 * src, type * dst, gint scale,       \
+ 
+ /* pack from float 64 (double) to float */
+ #define MAKE_PACK_FUNC_FF(name, type, FUNC)                             \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_PACK_FUNC_NAME (name) (gdouble * src, type * dst, gint s,          \
+     gint count)                                                         \
+ {                                                                       \
+@@ -194,7 +194,7 @@ MAKE_PACK_FUNC_NAME (name) (gdouble * src, type * dst, gint s,          \
+  * the floats are already in the correct range. Only a cast is needed.
+  */
+ #define MAKE_PACK_FUNC_FI_S(name, stride, WRITE_FUNC)                   \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_PACK_FUNC_NAME (name) (gdouble * src, guint8 * dst, gint scale,    \
+     gint count)                                                         \
+ {                                                                       \
+@@ -212,7 +212,7 @@ MAKE_PACK_FUNC_NAME (name) (gdouble * src, guint8 * dst, gint scale,    \
+  * and an addition of 2^(target_depth-1) to get in the correct unsigned
+  * range. */
+ #define MAKE_PACK_FUNC_FI_U(name, stride, WRITE_FUNC)                   \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_PACK_FUNC_NAME (name) (gdouble * src, guint8 * dst, gint scale,    \
+     gint count)                                                         \
+ {                                                                       \
+diff --git a/gst/audioconvert/gstaudioquantize.c b/gst/audioconvert/gstaudioquantize.c
+index 2155397..be959c4 100644
+--- a/gst/audioconvert/gstaudioquantize.c
++++ b/gst/audioconvert/gstaudioquantize.c
+@@ -46,7 +46,7 @@ gst_audio_quantize_quantize_##name
+ 
+ #define MAKE_QUANTIZE_FUNC_I(name, DITHER_INIT_FUNC, ADD_DITHER_FUNC,   \
+                              ROUND_FUNC)                                \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_QUANTIZE_FUNC_NAME (name) (AudioConvertCtx *ctx, gint32 *src,      \
+                                 gint32 *dst, gint count)                \
+ {                                                                       \
+@@ -86,7 +86,7 @@ MAKE_QUANTIZE_FUNC_NAME (name) (AudioConvertCtx *ctx, gint32 *src,      \
+ #define MAKE_QUANTIZE_FUNC_F(name, DITHER_INIT_FUNC, NS_INIT_FUNC,      \
+                              ADD_NS_FUNC, ADD_DITHER_FUNC,              \
+                              UPDATE_ERROR_FUNC)                         \
+-static void                                                             \
++void __attribute__((weak))                                              \
+ MAKE_QUANTIZE_FUNC_NAME (name) (AudioConvertCtx *ctx, gdouble *src,     \
+                                 gdouble *dst, gint count)               \
+ {                                                                       \
+diff --git a/gst/audioconvert/gstchannelmix.c b/gst/audioconvert/gstchannelmix.c
+index 1dbfcce..9ace1cb 100644
+--- a/gst/audioconvert/gstchannelmix.c
++++ b/gst/audioconvert/gstchannelmix.c
+@@ -663,7 +663,7 @@ gst_channel_mix_passthrough (AudioConvertCtx * this)
+ 
+ /* IMPORTANT: out_data == in_data is possible, make sure to not overwrite data
+  * you might need later on! */
+-void
++void __attribute__((weak))
+ gst_channel_mix_mix_int (AudioConvertCtx * this,
+     gint32 * in_data, gint32 * out_data, gint samples)
+ {
+@@ -702,7 +702,7 @@ gst_channel_mix_mix_int (AudioConvertCtx * this,
+   }
+ }
+ 
+-void
++void __attribute__((weak))
+ gst_channel_mix_mix_float (AudioConvertCtx * this,
+     gdouble * in_data, gdouble * out_data, gint samples)
+ {
+diff --git a/gst/stride/Makefile.am b/gst/stride/Makefile.am
+new file mode 100644
+index 0000000..1adc197
+--- /dev/null
++++ b/gst/stride/Makefile.am
+@@ -0,0 +1,15 @@
++plugin_LTLIBRARIES = libgststridetransform.la
++
++libgststridetransform_la_SOURCES = \
++	gststridetransform.c \
++	plugin.c
++
++libgststridetransform_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS)
++libgststridetransform_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
++libgststridetransform_la_LIBADD = \
++	$(top_builddir)/gst-libs/gst/video/libgstvideo-@GST_MAJORMINOR@.la \
++	$(GST_BASE_LIBS) $(GST_LIBS) $(LIBM)
++libgststridetransform_la_LIBTOOLFLAGS = --tag=disable-static
++
++noinst_HEADERS = \
++	gststridetransform.h
+diff --git a/gst/stride/gststridetransform.c b/gst/stride/gststridetransform.c
+new file mode 100644
+index 0000000..ea52500
+--- /dev/null
++++ b/gst/stride/gststridetransform.c
+@@ -0,0 +1,471 @@
++/* GStreamer
++ *
++ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
++ *
++ * Description: V4L2 sink element
++ *  Created on: Jul 30, 2009
++ *      Author: Rob Clark <rob@ti.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ */
++
++
++/**
++ * SECTION:element-stridetransform
++ *
++ * stridetransform can be used to convert between video buffers
++ * with and without stride, or between buffers with differing
++ * stride
++ *
++ * <refsect2>
++ * <title>Example launch lines</title>
++ * |[
++ * gst-launch videotestsrc ! video/x-raw-yuv,format=(fourcc)YUY2,width=320,height=240,framerate=30/1 !
++ * stridetransform ! video/x-raw-yuv-strided,format=(fourcc)YUY2,width=320,height=240,rowstride=700,framerate=30/1 !
++ * stridetransform ! video/x-raw-yuv,format=(fourcc)YUY2,width=320,height=240,framerate=30/1 !
++ * v4l2sink
++ * ]| This pipeline ???? TODO
++ * </refsect2>
++ */
++
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <string.h>
++#include <gst/video/video.h>
++
++#include "gst/gst-i18n-plugin.h"
++#include "gststridetransform.h"
++
++
++static const GstElementDetails stridetransform_details =
++GST_ELEMENT_DETAILS ("Stride transform",
++    "Filter/Converter/Video",
++    "Convert between video buffers with and without stride, or with differing stride",
++    "Rob Clark <rob@ti.com>,");
++
++
++/* TODO: add rgb formats too! */
++#define SUPPORTED_CAPS                                                        \
++  GST_VIDEO_CAPS_YUV_STRIDED ("{ I420, YV12, YUY2, UYVY }", "[ 0, max ]")
++
++
++static GstStaticPadTemplate src_template =
++GST_STATIC_PAD_TEMPLATE ("src",
++    GST_PAD_SRC,
++    GST_PAD_ALWAYS,
++    GST_STATIC_CAPS (SUPPORTED_CAPS)
++    );
++
++static GstStaticPadTemplate sink_template =
++GST_STATIC_PAD_TEMPLATE ("sink",
++    GST_PAD_SINK,
++    GST_PAD_ALWAYS,
++    GST_STATIC_CAPS (SUPPORTED_CAPS)
++    );
++
++
++GST_DEBUG_CATEGORY (stridetransform_debug);
++#define GST_CAT_DEFAULT stridetransform_debug
++
++/* type functions */
++static void gst_stride_transform_dispose (GObject *obj);
++
++/* GstBaseTransform functions */
++static gboolean gst_stride_transform_get_unit_size (GstBaseTransform *base,
++    GstCaps *caps, guint *size);
++static gboolean gst_stride_transform_transform_size (GstBaseTransform *base,
++    GstPadDirection direction,
++    GstCaps *caps, guint size,
++    GstCaps *othercaps, guint *othersize);
++static GstCaps *gst_stride_transform_transform_caps (GstBaseTransform *base,
++    GstPadDirection direction, GstCaps *caps);
++static gboolean gst_stride_transform_set_caps (GstBaseTransform *base,
++    GstCaps *incaps, GstCaps *outcaps);
++static GstFlowReturn gst_stride_transform_transform (GstBaseTransform *base,
++    GstBuffer *inbuf, GstBuffer *outbuf);
++static GstFlowReturn gst_stride_transform_transform_ip (GstBaseTransform *base,
++    GstBuffer *buf);
++
++GST_BOILERPLATE (GstStrideTransform, gst_stride_transform, GstVideoFilter, GST_TYPE_VIDEO_FILTER);
++
++
++static void
++gst_stride_transform_base_init (gpointer g_class)
++{
++  GstElementClass *gstelement_class = GST_ELEMENT_CLASS (g_class);
++
++  GST_DEBUG_CATEGORY_INIT (stridetransform_debug, "stride", 0, "stride transform element");
++
++  gst_element_class_set_details (gstelement_class, &stridetransform_details);
++
++  gst_element_class_add_pad_template (gstelement_class,
++      gst_static_pad_template_get (&sink_template));
++  gst_element_class_add_pad_template (gstelement_class,
++      gst_static_pad_template_get (&src_template));
++}
++
++static void
++gst_stride_transform_class_init (GstStrideTransformClass *klass)
++{
++  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
++  GstBaseTransformClass *basetransform_class = GST_BASE_TRANSFORM_CLASS (klass);
++
++  gobject_class->dispose = gst_stride_transform_dispose;
++
++  basetransform_class->get_unit_size =
++      GST_DEBUG_FUNCPTR (gst_stride_transform_get_unit_size);
++  basetransform_class->transform_size =
++      GST_DEBUG_FUNCPTR (gst_stride_transform_transform_size);
++  basetransform_class->transform_caps =
++      GST_DEBUG_FUNCPTR (gst_stride_transform_transform_caps);
++  basetransform_class->set_caps =
++      GST_DEBUG_FUNCPTR (gst_stride_transform_set_caps);
++  basetransform_class->transform_ip =
++      GST_DEBUG_FUNCPTR (gst_stride_transform_transform_ip);
++  basetransform_class->transform =
++      GST_DEBUG_FUNCPTR (gst_stride_transform_transform);
++
++  basetransform_class->passthrough_on_same_caps = TRUE;
++}
++
++static void
++gst_stride_transform_init (GstStrideTransform *self, GstStrideTransformClass *klass)
++{
++  GST_DEBUG_OBJECT (self, "not implemented");
++}
++
++
++static void
++gst_stride_transform_dispose (GObject *object)
++{
++  GstStrideTransform *self = GST_STRIDE_TRANSFORM (object);
++  GST_DEBUG_OBJECT (self, "not implemented");
++  G_OBJECT_CLASS (parent_class)->dispose (object);
++}
++
++/**
++ * figure out the required buffer size based on @caps
++ */
++static gboolean
++gst_stride_transform_get_unit_size (GstBaseTransform *base,
++    GstCaps *caps, guint *size)
++{
++  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
++  GstVideoFormat format;
++  gint width, height, rowstride;
++
++  g_return_val_if_fail (gst_video_format_parse_caps_strided (
++      caps, &format, &width, &height, &rowstride), FALSE);
++
++  *size = gst_video_format_get_size_strided (format, width, height, rowstride);
++
++  GST_DEBUG_OBJECT (self,
++      "format=%d, width=%d, height=%d, rowstride=%d -> size=%d",
++      format, width, height, rowstride, *size);
++
++  return TRUE;
++}
++
++/**
++ * Default transform_size function is no good, as it assumes that the output
++ * buffer size is a multiple of the unit size.. which doesn't hold true.
++ */
++static gboolean
++gst_stride_transform_transform_size (GstBaseTransform *base,
++    GstPadDirection direction,
++    GstCaps *caps, guint size,
++    GstCaps *othercaps, guint *othersize)
++{
++  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
++  guint idx = (direction == GST_PAD_SINK) ? 0 : 1;
++
++  if (self->cached_caps[idx] != othercaps)
++  {
++    if (!gst_stride_transform_get_unit_size (base, othercaps,
++        &(self->cached_size[idx])))
++    {
++      return FALSE;
++    }
++  }
++
++  *othersize = self->cached_size[idx];
++
++  return TRUE;
++}
++
++
++
++/**
++ * helper to add all fields, other than rowstride to @caps, copied from @s.
++ */
++static void
++add_all_fields (GstCaps *caps, const gchar *name, GstStructure *s, gboolean rowstride)
++{
++  gint idx;
++  GstStructure *new_s = gst_structure_new (name, NULL);
++
++  if (rowstride) {
++    gst_structure_set (new_s, "rowstride", GST_TYPE_INT_RANGE, 1, G_MAXINT, NULL);
++  }
++
++  idx = gst_structure_n_fields (s) - 1;
++  while (idx >= 0) {
++    const gchar *name = gst_structure_nth_field_name (s, idx);
++    if (strcmp ("rowstride", name)) {
++      const GValue *val = gst_structure_get_value (s, name);
++      gst_structure_set_value (new_s, name, val);
++    }
++    idx--;
++  }
++
++  gst_caps_merge_structure (caps, new_s);
++}
++
++
++/**
++ * we can transform @caps to strided or non-strided caps with otherwise
++ * identical parameters
++ */
++static GstCaps *
++gst_stride_transform_transform_caps (GstBaseTransform *base,
++    GstPadDirection direction, GstCaps *caps)
++{
++  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
++  GstCaps *ret;
++  GstStructure *s;
++
++  g_return_val_if_fail (GST_CAPS_IS_SIMPLE (caps), NULL);
++
++  GST_DEBUG_OBJECT (self, "direction=%d, caps=%p", direction, caps);
++  LOG_CAPS (self, caps);
++
++  ret = gst_caps_new_empty ();
++  s = gst_caps_get_structure (caps, 0);
++
++  if (gst_structure_has_name (s, "video/x-raw-yuv") ||
++      gst_structure_has_name (s, "video/x-raw-yuv-strided")) {
++
++    add_all_fields (ret, "video/x-raw-yuv", s, FALSE);
++    add_all_fields (ret, "video/x-raw-yuv-strided", s, TRUE);
++
++  } else if (gst_structure_has_name (s, "video/x-raw-rgb") ||
++      gst_structure_has_name (s, "video/x-raw-rgb-strided")) {
++
++    add_all_fields (ret, "video/x-raw-rgb", s, FALSE);
++    add_all_fields (ret, "video/x-raw-rgb-strided", s, TRUE);
++
++  }
++
++  LOG_CAPS (self, ret);
++
++  return ret;
++}
++
++/**
++ * at this point, we have identical fourcc, width, and height for @incaps
++ * and @outcaps..  so we need to extract these to use for transforming,
++ * plus the requested rowstride of the @incaps and @outcaps
++ */
++static gboolean
++gst_stride_transform_set_caps (GstBaseTransform *base,
++    GstCaps *incaps, GstCaps *outcaps)
++{
++  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
++  GstVideoFormat format;
++  gint width, height;
++
++  LOG_CAPS (self, incaps);
++  LOG_CAPS (self, outcaps);
++
++  g_return_val_if_fail (gst_video_format_parse_caps_strided (incaps,
++      &self->format, &self->width, &self->height, &self->in_rowstride), FALSE);
++  g_return_val_if_fail (gst_video_format_parse_caps_strided (outcaps,
++      &format, &width, &height, &self->out_rowstride), FALSE);
++
++  g_return_val_if_fail (self->format == format, FALSE);
++  g_return_val_if_fail (self->width  == width,  FALSE);
++  g_return_val_if_fail (self->height == height, FALSE);
++
++  return TRUE;
++}
++
++/* ************************************************************************* */
++
++/**
++ * Convert from one stride to another... like memmove, but can convert stride in
++ * the process.  This function is not aware of pixels, only of bytes.  So widths
++ * are given in bytes, not pixels.  The new_buf and orig_buf can point to the
++ * same buffers to do an in-place conversion, but the buffer should be large
++ * enough.
++ */
++static void
++stridemove (guchar *new_buf, guchar *orig_buf, gint new_width, gint orig_width, gint height)
++{
++  int row;
++
++  GST_DEBUG ("new_buf=%p, orig_buf=%p, new_width=%d, orig_width=%d, height=%d",
++      new_buf, orig_buf, new_width, orig_width, height);
++  /* if increasing the stride, work from bottom-up to avoid overwriting data
++   * that has not been moved yet.. otherwise, work in the opposite order,
++   * for the same reason.
++   */
++  if (new_width > orig_width) {
++    for (row=height-1; row>=0; row--) {
++      memmove (new_buf+(new_width*row), orig_buf+(orig_width*row), orig_width);
++    }
++  } else {
++    for (row=0; row<height; row++) {
++      memmove (new_buf+(new_width*row), orig_buf+(orig_width*row), new_width);
++    }
++  }
++}
++
++
++/**
++ * Convert from a non-strided buffer to strided.  The two buffer pointers could
++ * be pointing to the same memory block for in-place transform.. assuming that
++ * the buffer is large enough
++ *
++ * @strided:    the pointer to the resulting strided buffer
++ * @unstrided:  the pointer to the initial unstrided buffer
++ * @fourcc:     the color format
++ * @stride:     the stride, in bytes
++ * @width:      the width in pixels
++ * @height:     the height in pixels
++ */
++static GstFlowReturn
++stridify (GstStrideTransform *self, guchar *strided, guchar *unstrided)
++{
++  gint width  = self->width;
++  gint height = self->height;
++  gint stride = self->out_rowstride;
++
++  switch (self->format) {
++#if 0 /* TODO */
++    case GST_VIDEO_FORMAT_NV12:
++      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
++      stridemove (strided, unstrided, stride, width, height * 1.5);
++      return GST_FLOW_OK;
++#endif
++    case GST_VIDEO_FORMAT_I420:
++    case GST_VIDEO_FORMAT_YV12:
++      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
++      stridemove (
++          strided + (int)(height*stride*1.5),
++          unstrided + (int)(height*width*1.5),
++          stride, width/2, height);                             /* move U/V */
++      stridemove (
++          strided + (height*stride),
++          unstrided + (height*width),
++          stride, width/2, height);                             /* move V/U */
++      stridemove (strided, unstrided, stride, width, height);   /* move Y */
++      return GST_FLOW_OK;
++    case GST_VIDEO_FORMAT_YUY2:
++    case GST_VIDEO_FORMAT_UYVY:
++      g_return_val_if_fail (stride >= (width*2), GST_FLOW_ERROR);
++      stridemove (strided, unstrided, stride, width*2, height);
++      return GST_FLOW_OK;
++    default:
++      GST_WARNING ("unknown color format!\n");
++      return GST_FLOW_ERROR;
++  }
++}
++
++
++/**
++ * Convert from a strided buffer to non-strided.  The two buffer pointers could
++ * be pointing to the same memory block for in-place transform..
++ *
++ * @unstrided:  the pointer to the resulting unstrided buffer
++ * @strided:    the pointer to the initial strided buffer
++ */
++static GstFlowReturn
++unstridify (GstStrideTransform *self, guchar *unstrided, guchar *strided)
++{
++  gint width  = self->width;
++  gint height = self->height;
++  gint stride = self->in_rowstride;
++
++  switch (self->format) {
++#if 0 /* TODO */
++    case GST_VIDEO_FORMAT_NV12:
++      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
++      stridemove (unstrided, strided, width, stride, height * 1.5);
++      return GST_FLOW_OK;
++#endif
++    case GST_VIDEO_FORMAT_I420:
++    case GST_VIDEO_FORMAT_YV12:
++      g_return_val_if_fail (stride >= width, GST_FLOW_ERROR);
++      stridemove (unstrided, strided, width, stride, height);   /* move Y */
++      stridemove (
++          unstrided + (height*width),
++          strided + (height*stride),
++          width/2, stride, height);                             /* move V/U */
++      stridemove (
++          unstrided + (int)(height*width*1.5),
++          strided + (int)(height*stride*1.5),
++          width/2, stride, height);                             /* move U/V */
++      return GST_FLOW_OK;
++    case GST_VIDEO_FORMAT_YUY2:
++    case GST_VIDEO_FORMAT_UYVY:
++      g_return_val_if_fail (stride >= (width*2), GST_FLOW_ERROR);
++      stridemove (unstrided, strided, width*2, stride, height);
++      return GST_FLOW_OK;
++    default:
++      GST_WARNING ("unknown color format!\n");
++      return GST_FLOW_ERROR;
++  }
++}
++
++
++static GstFlowReturn
++gst_stride_transform_transform (GstBaseTransform *base,
++    GstBuffer *inbuf, GstBuffer *outbuf)
++{
++  GstStrideTransform *self = GST_STRIDE_TRANSFORM (base);
++
++  GST_DEBUG_OBJECT (self, "inbuf=%p (size=%d), outbuf=%p (size=%d)",
++      inbuf, GST_BUFFER_SIZE (inbuf),
++      outbuf, GST_BUFFER_SIZE (outbuf));
++
++  if (self->in_rowstride && self->out_rowstride) {
++    GST_DEBUG_OBJECT (self, "not implemented");  // TODO
++    return GST_FLOW_ERROR;
++  } else if (self->in_rowstride) {
++    return unstridify (self,
++        GST_BUFFER_DATA (outbuf), GST_BUFFER_DATA (inbuf));
++  } else if (self->out_rowstride) {
++    return stridify (self,
++        GST_BUFFER_DATA (outbuf), GST_BUFFER_DATA (inbuf));
++  }
++
++  GST_DEBUG_OBJECT (self, "this shouldn't happen!  in_rowstride=%d, out_rowstride=%d",
++      self->in_rowstride, self->out_rowstride);
++
++  return GST_FLOW_ERROR;
++}
++
++static GstFlowReturn
++gst_stride_transform_transform_ip (GstBaseTransform *base,
++    GstBuffer *buf)
++{
++  /* transform function is safe to call with same buffer ptr:
++   */
++  return gst_stride_transform_transform (base, buf, buf);
++}
+diff --git a/gst/stride/gststridetransform.h b/gst/stride/gststridetransform.h
+new file mode 100644
+index 0000000..481959e
+--- /dev/null
++++ b/gst/stride/gststridetransform.h
+@@ -0,0 +1,80 @@
++/* GStreamer
++ *
++ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
++ *
++ * Description: V4L2 sink element
++ *  Created on: Jul 2, 2009
++ *      Author: Rob Clark <rob@ti.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ */
++
++#ifndef __GSTSTRIDETRANSFORM_H__
++#define __GSTSTRIDETRANSFORM_H__
++
++
++#include <gst/video/gstvideofilter.h>
++#include <gst/video/video.h>
++
++
++G_BEGIN_DECLS
++
++#define GST_TYPE_STRIDE_TRANSFORM \
++  (gst_stride_transform_get_type())
++#define GST_STRIDE_TRANSFORM(obj) \
++  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_STRIDE_TRANSFORM,GstStrideTransform))
++#define GST_STRIDE_TRANSFORM_CLASS(klass) \
++  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_STRIDE_TRANSFORM,GstStrideTransformClass))
++#define GST_IS_STRIDE_TRANSFORM(obj) \
++  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_STRIDE_TRANSFORM))
++#define GST_IS_STRIDE_TRANSFORM_CLASS(klass) \
++  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_STRIDE_TRANSFORM))
++
++typedef struct _GstStrideTransform GstStrideTransform;
++typedef struct _GstStrideTransformClass GstStrideTransformClass;
++
++/**
++ * GstStrideTransform:
++ *
++ * Opaque datastructure.
++ */
++struct _GstStrideTransform {
++  GstVideoFilter videofilter;
++
++  /*< private >*/
++  GstVideoFormat format;
++  gint width, height;
++  gint in_rowstride;
++  gint out_rowstride;
++
++  /* for caching the tranform_size() results.. */
++  GstCaps *cached_caps[2];
++  guint cached_size[2];
++};
++
++struct _GstStrideTransformClass {
++  GstVideoFilterClass parent_class;
++};
++
++GType gst_stride_transform_get_type (void);
++
++G_END_DECLS
++
++
++#define LOG_CAPS(obj, caps)  GST_DEBUG_OBJECT (obj, "%s: %"GST_PTR_FORMAT, #caps, caps)
++
++
++#endif /* __GSTSTRIDETRANSFORM_H__ */
+diff --git a/gst/stride/plugin.c b/gst/stride/plugin.c
+new file mode 100644
+index 0000000..7672bdc
+--- /dev/null
++++ b/gst/stride/plugin.c
+@@ -0,0 +1,45 @@
++/* GStreamer
++ *
++ * Copyright (C) 2009 Texas Instruments, Inc - http://www.ti.com/
++ *
++ * Description: V4L2 sink element
++ *  Created on: Jul 30, 2009
++ *      Author: Rob Clark <rob@ti.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include "gststridetransform.h"
++
++static gboolean
++plugin_init (GstPlugin * plugin)
++{
++  if (!gst_element_register (plugin, "stridetransform",
++          GST_RANK_PRIMARY, gst_stride_transform_get_type ()))
++    return FALSE;
++
++  return TRUE;
++}
++
++GST_PLUGIN_DEFINE (GST_VERSION_MAJOR,
++    GST_VERSION_MINOR,
++    "stridetransform",
++    "Convert video from strided to non-strided, or between different row-strides",
++    plugin_init, VERSION, "LGPL", GST_PACKAGE_NAME, GST_PACKAGE_ORIGIN)
+-- 
+1.6.3.1
+
diff --git a/recipes/obsolete/gstreamer/gst-plugins-base_0.10.25.bb b/recipes/obsolete/gstreamer/gst-plugins-base_0.10.25.bb
new file mode 100644
index 0000000..9e82171
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-base_0.10.25.bb
@@ -0,0 +1,19 @@
+require gst-plugins.inc
+
+SRC_URI += "file://fix-playbin2.patch \
+            file://gst-plugins-base_rowstride.patch \
+"
+
+PR = "${INC_PR}.4"
+
+PROVIDES += "gst-plugins"
+
+# gst-plugins-base only builds the alsa plugin
+# if alsa has been built and is present.  You will
+# not get an error if this is not present, just 
+# a missing alsa plugin
+DEPENDS += "cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype  libxv libxrandr"
+
+
+SRC_URI[archive.md5sum] = "d29669dd79276c5cd94e1613c03cd9ab"
+SRC_URI[archive.sha256sum] = "0ab2f7e1d818e7af1be99c4eae02ba69d4a1b8f7e3527929a6426f1daa0d4607"
diff --git a/recipes/obsolete/gstreamer/gst-plugins-base_0.10.31.bb b/recipes/obsolete/gstreamer/gst-plugins-base_0.10.31.bb
new file mode 100644
index 0000000..b68fffb
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-base_0.10.31.bb
@@ -0,0 +1,26 @@
+require gst-plugins.inc
+
+SRC_URI += " \
+            file://ivorbis-thumb.patch \
+"
+
+SRC_URI[archive.md5sum] = "9baa0d87e81c88b2477a3554ab629c46"
+SRC_URI[archive.sha256sum] = "abb006c78222cfb69d31e983268d1d5219e9d4e0da24c6c4cd687968af7a33bd"
+
+PR = "${INC_PR}.1"
+
+PROVIDES += "gst-plugins"
+
+# gst-plugins-base only builds the alsa plugin
+# if alsa has been built and is present.  You will
+# not get an error if this is not present, just
+# a missing alsa plugin
+DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype  libxv libxrandr gtk+"
+
+# Needs a udev that enabled gudev, which isn't the default
+EXTRA_OECONF_append = " --with-gudev"
+
+do_configure_prepend() {
+	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
+}
+
diff --git a/recipes/obsolete/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch b/recipes/obsolete/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch
new file mode 100644
index 0000000..749c491
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-good/fix-unit-scale-asseration.patch
@@ -0,0 +1,33 @@
+diff -uNr gst-plugins-good-0.10.15/sys/v4l2/gstv4l2src.c gst-plugins-good-0.10.15.new/sys/v4l2/gstv4l2src.c
+--- gst-plugins-good-0.10.15/sys/v4l2/gstv4l2src.c	2009-05-11 19:00:07.000000000 -0500
++++ gst-plugins-good-0.10.15.new/sys/v4l2/gstv4l2src.c	2009-06-22 09:51:50.000000000 -0500
+@@ -1377,14 +1377,22 @@
+       timestamp = gst_clock_get_time (clock) - timestamp;
+       gst_object_unref (clock);
+ 
+-      latency =
+-          gst_util_uint64_scale_int (GST_SECOND, v4l2src->fps_d,
+-          v4l2src->fps_n);
++      /* we must have a framerate */
++      if (v4l2src->fps_n <= 0 || v4l2src->fps_d <= 0) {
++        GST_WARNING_OBJECT (src,
++            "Can't give latency since framerate isn't fixated !");
++        timestamp = GST_CLOCK_TIME_NONE;
++      }
++      else {
++        latency =
++            gst_util_uint64_scale_int (GST_SECOND, v4l2src->fps_d,
++            v4l2src->fps_n);
+ 
+-      if (timestamp > latency)
+-        timestamp -= latency;
+-      else
+-        timestamp = 0;
++        if (timestamp > latency)
++          timestamp -= latency;
++        else
++          timestamp = 0;
++      }
+     }
+ 
+     /* FIXME: use the timestamp from the buffer itself! */
diff --git a/recipes/obsolete/gstreamer/gst-plugins-good_0.10.15.bb b/recipes/obsolete/gstreamer/gst-plugins-good_0.10.15.bb
new file mode 100644
index 0000000..f2b0a5a
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-good_0.10.15.bb
@@ -0,0 +1,16 @@
+require gst-plugins.inc
+
+PR = "r6"
+
+SRC_URI += "file://fix-unit-scale-asseration.patch"
+
+inherit gconf 
+
+DEPENDS += "libsoup-2.4 flac gst-plugins-base openssl popt esound"
+
+PACKAGES =+ "gst-plugin-gconfelements"
+FILES_gst-plugin-gconfelements += "${sysconfdir}/gconf"
+
+
+SRC_URI[archive.md5sum] = "19bc6cc07951b3382d1ac8525b20e83f"
+SRC_URI[archive.sha256sum] = "831f450a0fa18c881b00ec50e8916ed66ca0fecb53cd1939f0abcc02930f9847"
diff --git a/recipes/obsolete/gstreamer/gst-rtsp_0.10.4.bb b/recipes/obsolete/gstreamer/gst-rtsp_0.10.4.bb
new file mode 100644
index 0000000..265f0f7
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-rtsp_0.10.4.bb
@@ -0,0 +1,4 @@
+require gst-rtsp.inc
+
+SRC_URI[md5sum] = "8daaca1299aeb42c6aac47b30291005b"
+SRC_URI[sha256sum] = "1ebf3571d16dbab401f2ebf0362e3d67457fb88711ad15a4ab51bd3730267fb7"
diff --git a/recipes/obsolete/gstreamer/gst-rtsp_0.10.5.bb b/recipes/obsolete/gstreamer/gst-rtsp_0.10.5.bb
new file mode 100644
index 0000000..dbaddc3
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-rtsp_0.10.5.bb
@@ -0,0 +1,4 @@
+require gst-rtsp.inc
+
+SRC_URI[md5sum] = "caca55e2ff497c0a327df3bc65a4a662"
+SRC_URI[sha256sum] = "a6f0a0c6c466683ee688aa8475623850fdacb549b2339a502831fdd3d74f984e"
diff --git a/recipes/obsolete/gstreamer/gstreamer/po-makefile-fix.patch b/recipes/obsolete/gstreamer/gstreamer/po-makefile-fix.patch
new file mode 100644
index 0000000..1cf665e
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gstreamer/po-makefile-fix.patch
@@ -0,0 +1,12 @@
+diff -urN gstreamer-0.10.17.orig/po/Makefile.in.in gstreamer-0.10.17/po/Makefile.in.in
+--- gstreamer-0.10.17.orig/po/Makefile.in.in	2008-01-25 16:21:31.000000000 +0100
++++ gstreamer-0.10.17/po/Makefile.in.in	2008-09-08 14:41:21.000000000 +0200
+@@ -30,7 +30,7 @@
+ INSTALL = @INSTALL@
+ INSTALL_DATA = @INSTALL_DATA@
+ MKINSTALLDIRS = @MKINSTALLDIRS@
+-mkinstalldirs = $(SHELL) `case "$(MKINSTALLDIRS)" in /*) echo "$(MKINSTALLDIRS)" ;; *) echo "$(top_builddir)/$(MKINSTALLDIRS)" ;; esac`
++mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
+ 
+ GMSGFMT = @GMSGFMT@
+ MSGFMT = @MSGFMT@
diff --git a/recipes/obsolete/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch b/recipes/obsolete/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch
new file mode 100644
index 0000000..6733e6b
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gstreamer/registry-do-not-look-into-debug-dirs.patch
@@ -0,0 +1,39 @@
+Work around a glibc 2.6.1 bug with dlopen. We try to dlopen a .so file that
+only contains debug symbols (e.g. no architecture is set in the elf header)
+
+
+#0  0x4000a88c in _dl_relocate_object () from /lib/ld-linux.so.3
+(gdb) bt
+#0  0x4000a88c in _dl_relocate_object () from /lib/ld-linux.so.3
+#1  0x40011f68 in dl_open_worker () from /lib/ld-linux.so.3
+#2  0x4000d7e4 in _dl_catch_error () from /lib/ld-linux.so.3
+#3  0x400117d8 in _dl_open () from /lib/ld-linux.so.3
+#4  0x402fba84 in dlopen_doit () from /lib/libdl.so.2
+#5  0x4000d7e4 in _dl_catch_error () from /lib/ld-linux.so.3
+#6  0x402fbf50 in _dlerror_run () from /lib/libdl.so.2
+#7  0x402fb9bc in dlopen@@GLIBC_2.4 () from /lib/libdl.so.2
+#8  0x402f2790 in g_module_open () from /usr/lib/libgmodule-2.0.so.0
+#9  0x40078784 in gst_plugin_load_file (
+    filename=0x10a6c8 "/usr/lib/gstreamer-0.10/.debug/libgstcoreindexers.so", 
+    error=0x0) at gstplugin.c:481
+#10 0x4007e3c4 in gst_registry_scan_path_level (registry=0x27828, 
+    path=0x10a6a0 "/usr/lib/gstreamer-0.10/.debug", level=1) at gstregistry.c:891
+#11 0x4007df04 in gst_registry_scan_path_level (registry=0x27828, 
+
+
+Index: gstreamer-0.10.17/gst/gstregistry.c
+===================================================================
+--- gstreamer-0.10.17.orig/gst/gstregistry.c	2008-11-14 23:30:48.000000000 +0100
++++ gstreamer-0.10.17/gst/gstregistry.c	2008-11-14 23:32:39.000000000 +0100
+@@ -813,7 +813,10 @@
+     GST_LOG_OBJECT (registry, "examining file: %s", filename);
+ 
+     if (g_file_test (filename, G_FILE_TEST_IS_DIR)) {
+-      if (level > 0) {
++      if (g_str_has_suffix (filename, ".debug")) {
++        GST_LOG_OBJECT (registry,
++            "found directory, not descending into .debug directory");
++      } else if (level > 0) {
+         GST_LOG_OBJECT (registry, "found directory, recursing");
+         changed |= gst_registry_scan_path_level (registry, filename, level - 1);
+       } else {
diff --git a/recipes/obsolete/gstreamer/gstreamer_0.10.17.bb b/recipes/obsolete/gstreamer/gstreamer_0.10.17.bb
new file mode 100644
index 0000000..dd01e16
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gstreamer_0.10.17.bb
@@ -0,0 +1,10 @@
+require gstreamer.inc
+
+PR = "r4"
+
+SRC_URI += "file://po-makefile-fix.patch \
+            file://registry-do-not-look-into-debug-dirs.patch "
+
+
+SRC_URI[archive.md5sum] = "3232416ea6fceab628236d67a7d0a44a"
+SRC_URI[archive.sha256sum] = "442862dc93e734aa58f13bcf3914dc7a40d3fa28f0ae2152c80457438dc3569c"
diff --git a/recipes/obsolete/gstreamer/gstreamer_0.10.25.bb b/recipes/obsolete/gstreamer/gstreamer_0.10.25.bb
new file mode 100644
index 0000000..6ba8a6d
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gstreamer_0.10.25.bb
@@ -0,0 +1,6 @@
+require gstreamer.inc
+
+EXTRA_OECONF += "ac_cv_func_register_printf_function=no"
+
+SRC_URI[archive.md5sum] = "88544e034a051baf472983791d233076"
+SRC_URI[archive.sha256sum] = "39b2ba7b3bfa8df6d998a9461e7091c27757e36a53e93969d7d9982a56526578"
diff --git a/recipes/obsolete/gstreamer/gstreamer_0.10.31.bb b/recipes/obsolete/gstreamer/gstreamer_0.10.31.bb
new file mode 100644
index 0000000..8b8eb77
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gstreamer_0.10.31.bb
@@ -0,0 +1,15 @@
+require gstreamer.inc
+
+PR = "r2"
+
+SRC_URI[archive.md5sum] = "a21fb08bdb578d972c7c14e77da8fbb6"
+SRC_URI[archive.sha256sum] = "7f737e6d047c1ebeb4e1e0725fc377c5d9f12ee89186de7960be3cbba709ab84"
+
+SRC_URI += " \
+             file://0001-add-GstQueryBuffers-query.patch \
+             file://0002-gstevent-add-crop-event.patch \
+             file://0003-basetransform-don-t-do-unnecessary-pad_alloc.patch \
+"
+
+EXTRA_OECONF += "ac_cv_func_register_printf_function=no"
+
-- 
1.7.4.1




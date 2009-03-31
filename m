Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LoaBk-00068A-B6
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 11:23:20 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E1F58DB15BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 11:21:08 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 69DC7DB0C0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 11:21:06 +0200 (CEST)
Received: from rhein.familie-heinold.de (e178116121.adsl.alicedsl.de
	[85.178.116.121]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 11:21:06 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id BD15D3C218; Tue, 31 Mar 2009 11:21:05 +0200 (CEST)
Date: Tue, 31 Mar 2009 11:21:05 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090331092101.GB10532@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: xine update
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
X-List-Received-Date: Tue, 31 Mar 2009 09:23:20 -0000
X-Groupsio-MsgNum: 8859
Content-Type: multipart/mixed; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi again,

I reworked hard the whole libxine stuff there would be now only
the latest version and only one package xine can handle x11 and fb
at the same time via plugins. This will break all packages which rely
on either libxine-fb and libxine-x11. Should I leave it to the other
package maintainer to fix this situation, should I fix myself with
a huge push which covers all packages or should I fix the recipes
step for step. Attached the patch for review.

This effects the following stuff in conf/

distro/include/angstrom-2007-for-openmoko.inc:PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxine ?= "1.1.0"
distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxine-fb ?= "1.0"
distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxine-x11 ?= "1.0"
distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_xineramaproto ?= "1.1.2"
distro/kaeilos.conf:PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
distro/angstrom-2008.1.conf:PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
distro/oplinux.conf:PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"

and in recipes:

xine/gxine_0.4.1.bb:DEPENDS = "gtk+ libxine-x11"
gxine/gxine_0.4.1enhanced.bb:DEPENDS = "gtk+ libxine-x11"
icewm/icewm_1.2.30.bb:DEPENDS = "virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender libxinerama libxpm xrandr xft mkfontdir-native"
mb-desktop-xine/mb-desktop-xine_0.4.bb:DEPENDS = "matchbox-desktop libxine-x11"
opie-mediaplayer2/opie-mediaplayer2.inc:DEPENDS = "libxine-fb libqtaux2 opie-mediaplayer2-skin-default"
totem/totem_0.99.15.bb:DEPENDS="gtk+ libglade gnome-vfs gconf libxine-x11 libgnomeui"
totem/totem_1.0.4.bb:DEPENDS="gtk+ libglade gnome-vfs gconf libxine-x11 libxml2"


Bye Henning 

--A6N2fC+uXW/VQSAv
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-libxine-remove-older-verison-and-add-the-actual-1.1.patch"

From 01782313f289ff9cef1f2976db9b10bacfe8e2a5 Mon Sep 17 00:00:00 2001
From: woglinde <heinold@inf.fu-berlin.de>
Date: Sat, 28 Mar 2009 16:15:51 +0100
Subject: [PATCH 1/7] libxine: remove older verison and add the actual 1.1.16
 * dont seperate x11 and fb anymore xine can handle it via plugins
 * therefore all recipes wich depends on libxine-fb or libxine-x11
   have to changed to libxine

---
 recipes/libxine/files/configure-1.0.patch          |  177 ----
 recipes/libxine/files/cpu-1.0.patch                |  112 ---
 recipes/libxine/files/libxine-cut-memusage.patch   |   71 --
 .../libxine/files/libxine-ffmpeg-enable-arm.patch  |   20 -
 recipes/libxine/files/libxine-gcc4.patch           |  138 ---
 recipes/libxine/files/libxine-libavcodec.patch     |  926 --------------------
 recipes/libxine/files/libxine-libvorbis.patch      |   39 -
 .../libxine/files/libxine-tremor-autoconf.patch    |   16 -
 .../libxine/files/mpegvideo-static-inlinine.patch  |   16 -
 recipes/libxine/libxine-1.1.0/configure.patch      |  244 -----
 recipes/libxine/libxine-1.1.0/cpuid.patch          |   16 -
 recipes/libxine/libxine-1.1.0/dont-have-xv.patch   |   16 -
 .../fix-syntax-xine-vorbis-decoder.patch           |   11 -
 recipes/libxine/libxine-1.1.0/gcc41.patch          |   13 -
 .../libxine-1.1.0/libxine-arm-configure.patch      |   18 -
 .../libxine-1.1.0/libxine-cut-memusage.patch       |   63 --
 .../libxine-1.1.0/libxine-ffmpeg-enable-arm.patch  |   20 -
 .../libxine-1.1.0/libxine-tremor-autoconf.patch    |   16 -
 .../libxine-1.1.0/mpegvideo-static-inlinine.patch  |   16 -
 recipes/libxine/libxine-1.1.0/no-caca.patch        |   19 -
 recipes/libxine/libxine-1.1.0/tremor.patch         |   63 --
 recipes/libxine/libxine-1.1.16/iconv.patch         |   12 +
 recipes/libxine/libxine-1.1.16/libavcodec.patch    |   26 +
 recipes/libxine/libxine-1.1.16/libpostproc.patch   |   34 +
 .../libxine-1.1.16/libxine-arm-configure.patch     |   18 +
 recipes/libxine/libxine-fb/configure-1.0.patch     |  187 ----
 recipes/libxine/libxine-fb/demuxogg.patch          |   26 -
 recipes/libxine/libxine-fb/fix-syntax.patch        |   16 -
 .../libxine/libxine-fb/libxine-arm-configure.patch |   18 -
 recipes/libxine/libxine-fb/no-caca.patch           |   16 -
 recipes/libxine/libxine-fb_1.0.bb                  |   98 --
 recipes/libxine/libxine-x11-1.0/dont-have-xv.patch |   16 -
 .../fix-syntax-xine-vorbis-decoder.patch           |   11 -
 .../libxine/libxine-x11-1.0/no-caca-no-aalib.patch |   24 -
 recipes/libxine/libxine-x11-1.0/restore-esd.patch  |   15 -
 recipes/libxine/libxine-x11_1.0.bb                 |  100 ---
 recipes/libxine/libxine.inc                        |   65 ++
 recipes/libxine/libxine_1.1.0.bb                   |  107 ---
 recipes/libxine/libxine_1.1.16.bb                  |   39 +
 39 files changed, 194 insertions(+), 2664 deletions(-)
 delete mode 100644 recipes/libxine/files/configure-1.0.patch
 delete mode 100644 recipes/libxine/files/cpu-1.0.patch
 delete mode 100644 recipes/libxine/files/libxine-cut-memusage.patch
 delete mode 100644 recipes/libxine/files/libxine-ffmpeg-enable-arm.patch
 delete mode 100644 recipes/libxine/files/libxine-gcc4.patch
 delete mode 100644 recipes/libxine/files/libxine-libavcodec.patch
 delete mode 100644 recipes/libxine/files/libxine-libvorbis.patch
 delete mode 100644 recipes/libxine/files/libxine-tremor-autoconf.patch
 delete mode 100644 recipes/libxine/files/mpegvideo-static-inlinine.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/configure.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/cpuid.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/dont-have-xv.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/fix-syntax-xine-vorbis-decoder.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/gcc41.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/libxine-arm-configure.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/libxine-cut-memusage.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/libxine-ffmpeg-enable-arm.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/libxine-tremor-autoconf.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/mpegvideo-static-inlinine.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/no-caca.patch
 delete mode 100644 recipes/libxine/libxine-1.1.0/tremor.patch
 create mode 100644 recipes/libxine/libxine-1.1.16/iconv.patch
 create mode 100644 recipes/libxine/libxine-1.1.16/libavcodec.patch
 create mode 100644 recipes/libxine/libxine-1.1.16/libpostproc.patch
 create mode 100644 recipes/libxine/libxine-1.1.16/libxine-arm-configure.patch
 delete mode 100644 recipes/libxine/libxine-fb/configure-1.0.patch
 delete mode 100644 recipes/libxine/libxine-fb/demuxogg.patch
 delete mode 100644 recipes/libxine/libxine-fb/fix-syntax.patch
 delete mode 100644 recipes/libxine/libxine-fb/libxine-arm-configure.patch
 delete mode 100644 recipes/libxine/libxine-fb/no-caca.patch
 delete mode 100644 recipes/libxine/libxine-fb_1.0.bb
 delete mode 100644 recipes/libxine/libxine-x11-1.0/dont-have-xv.patch
 delete mode 100644 recipes/libxine/libxine-x11-1.0/fix-syntax-xine-vorbis-decoder.patch
 delete mode 100644 recipes/libxine/libxine-x11-1.0/no-caca-no-aalib.patch
 delete mode 100644 recipes/libxine/libxine-x11-1.0/restore-esd.patch
 delete mode 100644 recipes/libxine/libxine-x11_1.0.bb
 create mode 100644 recipes/libxine/libxine.inc
 delete mode 100644 recipes/libxine/libxine_1.1.0.bb
 create mode 100644 recipes/libxine/libxine_1.1.16.bb

diff --git a/recipes/libxine/files/configure-1.0.patch b/recipes/libxine/files/configure-1.0.patch
deleted file mode 100644
index c25d419..0000000
--- a/recipes/libxine/files/configure-1.0.patch
+++ /dev/null
@@ -1,177 +0,0 @@
---- xine-lib-1-rc6a/configure.ac.orig	2004-09-16 22:28:33.762843408 -0400
-+++ xine-lib-1-rc6a/configure.ac	2004-09-16 22:29:00.969707336 -0400
-@@ -622,7 +622,7 @@
- dnl ---------------------------------------------
- 
- AM_PATH_AALIB(1.4,, AC_MSG_RESULT([*** All of AALIB dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_AA, test x$no_aalib != "xyes")
-+AM_CONDITIONAL(HAVE_AA,  [test x"$enable_aalib" = "xyes" && test x$no_aalib != "xyes"])
- 
- 
- dnl ---------------------------------------------
-@@ -735,10 +735,7 @@
- dnl check for SDL
- dnl ---------------------------------------------
- 
--AM_PATH_SDL(1.1.5, 
--	AC_DEFINE(HAVE_SDL,1,[Define this if you have SDL library installed]),
--	[])
--AM_CONDITIONAL(HAVE_SDL, [test x"$no_sdl" != x"yes"])
-+AM_CONDITIONAL(HAVE_SDL, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -868,61 +865,29 @@
- dnl Ogg/Theora libs.
- dnl ---------------------------------------------
- 
--AM_PATH_OGG(
--           [ AM_PATH_THEORA(AC_DEFINE(HAVE_THEORA,1,[Define this if you have theora]),
--                           AC_MSG_RESULT([*** All OGG/THEORA dependent parts will be disabled ***]))
--          ],
--           AC_MSG_RESULT([*** All of OGG/Theora dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_THEORA, [test x"$no_ogg" != "xyes" -a x"$no_theora" != "xyes"])
-+AM_CONDITIONAL(HAVE_THEORA, 0)
- 
- 
- dnl ---------------------------------------------
- dnl Ogg/Speex libs.
- dnl ---------------------------------------------
- 
--PKG_CHECK_MODULES(SPEEX, speex, no_speex="no", no_speex="yes")
--
--if test "x$no_speex" = "xyes" ; then
--  AM_PATH_OGG([ AM_PATH_SPEEX(no_speex="no")])
--fi
--
--if test "x$no_speex" = "xyes" ; then
--  AC_MSG_RESULT([*** All OGG/SPEEX dependent parts will be disabled ***])
--else
--  AC_DEFINE(HAVE_SPEEX,1,[Define this if you have speex])
--
--  dnl Test whether Speex headers are eg. <speex.h> or <speex/speex.h>
--  dnl Speex headers were moved in mid-2004; 1.0.x has backwards compatible headers, 1.1.x does not
--  AC_CHECK_HEADER([speex/speex.h],
--                  AC_DEFINE(HAVE_SPEEX_SUBDIR, [1], [Define to 1 if speex headers are eg. <speex/speex.h>])
--  )
--
--  AC_SUBST(SPEEX_CFLAGS)
--  AC_SUBST(SPEEX_LIBS)
--fi
--AM_CONDITIONAL(HAVE_SPEEX, [test x"$no_ogg" != "xyes" -a x"$no_speex" != "xyes"])
-+AM_CONDITIONAL(HAVE_SPEEX, 0)
- 
- 
- dnl ---------------------------------------------
- dnl check for libFLAC
- dnl ---------------------------------------------
- 
--AM_PATH_LIBFLAC([],
--	AC_MSG_RESULT([*** All FLAC dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_FLAC, [test x"$no_libFLAC" != "xyes"])
-+AM_CONDITIONAL(HAVE_FLAC, 0)
- 
- 
- dnl ---------------------------------------------
- dnl MNG libs.
- dnl ---------------------------------------------
- 
--AC_CHECK_LIB(mng, mng_initialize,
--	[ AC_CHECK_HEADER(libmng.h,
--		[ have_libmng=yes
--		  MNG_LIBS="-lmng" ], 
--		AC_MSG_RESULT([*** All libmng dependent parts will be disabled ***]))],
--	AC_MSG_RESULT([*** All libmng dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_LIBMNG, test x"$have_libmng" = "xyes")
-+MNG_LIBS=""
-+AM_CONDITIONAL(HAVE_LIBMNG, 0)
- AC_SUBST(MNG_LIBS)
- 
- 
-@@ -952,7 +917,7 @@
- dnl freetype2 lib.
- dnl ---------------------------------------------
- 
--AM_PATH_FREETYPE2()
-+AM_CONDITIONAL(HAVE_FT2, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -995,37 +960,21 @@
- dnl ESD support
- dnl ---------------------------------------------
- 
--AM_PATH_ESD(0.2.8,
--        AC_DEFINE(HAVE_ESD,1,[Define this if you have ESD (libesd) installed]),
--        AC_MSG_RESULT(*** All of ESD dependent parts will be disabled ***))
--AM_CONDITIONAL(HAVE_ESD, test x"$no_esd" != "xyes")
-+AM_CONDITIONAL(HAVE_ESD, 0)
- 
- 
- dnl ---------------------------------------------
- dnl ARTS support
- dnl ---------------------------------------------
- 
--AM_PATH_ARTS(0.9.5,
--        AC_DEFINE(HAVE_ARTS,1,[Define this if you have ARTS (libartsc) installed]),
--        AC_MSG_RESULT(*** All of ARTS dependent parts will be disabled ***))
--AM_CONDITIONAL(HAVE_ARTS, test x"$no_arts" != "xyes")
-+AM_CONDITIONAL(HAVE_ARTS, 0)
- 
- 
- dnl ---------------------------------------------
- dnl gnome-vfs support
- dnl ---------------------------------------------
- 
--PKG_CHECK_MODULES(GNOME_VFS, gnome-vfs-2.0,
--                no_gnome_vfs=no,
--		no_gnome_vfs=yes)
--AC_SUBST(GNOME_VFS_CFLAGS)
--AC_SUBST(GNOME_VFS_LIBS)
--if test x"$no_gnome_vfs" != "xyes"; then
--AC_DEFINE(HAVE_GNOME_VFS,1,[Define this if you have gnome-vfs installed])
--else
--AC_MSG_RESULT(*** All of the gnome-vfs dependent parts will be disabled ***)
--fi
--AM_CONDITIONAL(HAVE_GNOME_VFS, test x"$no_gnome_vfs" != "xyes")
-+AM_CONDITIONAL(HAVE_GNOME_VFS, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -1188,35 +1137,7 @@
-     ],ISOC99_PRAGMA=no)
-     AC_MSG_RESULT($ISOC99_PRAGMA)
- 
--    dnl bitfield order
--    AC_MSG_CHECKING(bitfield ordering in structs)
--    AC_TRY_RUN([
--int
-- main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
--  bf = { 1,1,1,1 };
--  if (sizeof (bf) != 1) return 1;
--  return *((unsigned char*) &bf) != 0x4b; }
--], bf_lsbf=1, AC_TRY_RUN([ 
--int
--main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
--  bf = { 1,1,1,1 };
--  if (sizeof (bf) != 1) return 1;
--  return *((unsigned char*) &bf) != 0xa5; }
--], bf_lsbf=0, AC_MSG_ERROR([unsupported bitfield ordering])))
--    if test "x$bf_lsbf" = "x1"; then
--     AC_MSG_RESULT(LSBF)
--     AC_DEFINE(BITFIELD_LSBF, [], [compiler does lsbf in struct bitfields])
--    else
--     AC_MSG_RESULT(MSBF)
--    fi
-+    AC_DEFINE(BITFIELD_LSBF, [], [compiler does lsbf in struct bitfields])
- 
-     AC_HAVE_HEADERS( errno.h fcntl.h \
- 		     stdbool.h  stdlib.h stdint.h stdio.h string.h \
diff --git a/recipes/libxine/files/cpu-1.0.patch b/recipes/libxine/files/cpu-1.0.patch
deleted file mode 100644
index a7ccdbb..0000000
--- a/recipes/libxine/files/cpu-1.0.patch
+++ /dev/null
@@ -1,112 +0,0 @@
---- xine-lib-1-rc6a/src/post/goom/xmmx.c.orig	2004-09-16 21:53:34.040049792 -0400
-+++ xine-lib-1-rc6a/src/post/goom/xmmx.c	2004-09-16 21:59:24.407785800 -0400
-@@ -112,23 +112,23 @@
- 		 * post : mm3 & mm4 : coefs for this position
- 		 *              mm1 : X vector [0|X]
- 		 *
--		 * modif : eax,ebx
-+		 * modif : eax,ecx
- 		 */
- 		__asm__ __volatile__ (
--			"movd %%mm0,%%ebx\n"
-+			"movd %%mm0,%%ecx\n"
- 			"movq %%mm0,%%mm1\n"
- 
--			"andl $15,%%ebx\n"
-+			"andl $15,%%ecx\n"
- 			"psrlq $32,%%mm1\n"
- 
--			"shll $6,%%ebx\n"
-+			"shll $6,%%ecx\n"
- 			"movd %%mm1,%%eax\n"
- 
--			"addl %0,%%ebx\n"
-+			"addl %0,%%ecx\n"
- 			"andl $15,%%eax\n"
- 
--			"movd (%%ebx,%%eax,4),%%mm3\n"
--			::"g"(precalCoef):"eax","ebx");
-+			"movd (%%ecx,%%eax,4),%%mm3\n"
-+			::"g"(precalCoef):"eax","ecx");
- 
- 		/*
- 		 * extraction des coefficients...
-@@ -158,7 +158,7 @@
- 		 * post : mm0 : expix1[position]
- 		 *        mm2 : expix1[position+largeur]
- 		 *
--		 * modif : eax,ebx
-+		 * modif : eax,ecx
- 		 */
- 		psrld_i2r (PERTEDEC,mm0);
- 		psrld_i2r (PERTEDEC,mm1);
-@@ -167,23 +167,23 @@
- 			/*^*/ "movq %%mm3,%%mm5\n"       /*^*/
- 
- 			"mull %1\n"
--			"movd %%mm0,%%ebx\n"
-+			"movd %%mm0,%%ecx\n"
- 			/*^*/ "punpcklbw %%mm5, %%mm3\n" /*^*/
- 
--			"addl %%ebx,%%eax\n"
-+			"addl %%ecx,%%eax\n"
- 			/*^*/ "movq %%mm3,%%mm4\n"       /*^*/
- 			/*^*/ "movq %%mm3,%%mm5\n"       /*^*/
- 
--			"movl %0,%%ebx\n"
-+			"movl %0,%%ecx\n"
- 			/*^*/ "punpcklbw %%mm5,%%mm3\n"  /*^*/
- 
--			"movq (%%ebx,%%eax,4),%%mm0\n"
-+			"movq (%%ecx,%%eax,4),%%mm0\n"
- 			/*^*/ "punpckhbw %%mm5,%%mm4\n"  /*^*/
- 
- 			"addl %1,%%eax\n"
--			"movq (%%ebx,%%eax,4),%%mm2\n"
-+			"movq (%%ecx,%%eax,4),%%mm2\n"
- 
--			: : "X"(expix1), "X"(prevX):"eax","ebx"
-+			: : "X"(expix1), "X"(prevX):"eax","ecx"
- 		);
- 
- 		/*
---- xine-lib-1-rc7/src/post/goom/mmx.h	2004-09-12 05:17:26.000000000 -0700
-+++ xine-lib-1-rc7.new/src/post/goom/mmx.h	2004-11-09 16:08:17.777667856 -0700
-@@ -71,13 +71,15 @@
- 	*/
- 	register int rval = 0;
- 
-+	/* Maybe if I yell it will help:  DON'T CLOBBER EBX! */
-+
- 	__asm__ __volatile__ (
- 		/* See if CPUID instruction is supported ... */
- 		/* ... Get copies of EFLAGS into eax and ecx */
- 		"pushf\n\t"
- 		"popl %%eax\n\t"
- 		"movl %%eax, %%ecx\n\t"
--
-+	
- 		/* ... Toggle the ID bit in one copy and store */
- 		/*     to the EFLAGS reg */
- 		"xorl $0x200000, %%eax\n\t"
-@@ -97,6 +99,8 @@
- 		/* Get standard CPUID information, and
- 		       go to a specific vendor section */
- 		"movl $0, %%eax\n\t"
-+
-+		"pushl %%ebx\n\t"
- 		"cpuid\n\t"
- 
- 		/* Check for Intel */
-@@ -214,9 +218,10 @@
- 		"movl $0, %0\n\n\t"
- 
- 		"Return:\n\t"
-+		"popl %%ebx\n\t"
- 		: "=X" (rval)
- 		: /* no input */
--		: "eax", "ebx", "ecx", "edx"
-+		: "eax", "ecx", "edx"
- 	);
- 
- 	/* Return */
diff --git a/recipes/libxine/files/libxine-cut-memusage.patch b/recipes/libxine/files/libxine-cut-memusage.patch
deleted file mode 100644
index 696b479..0000000
--- a/recipes/libxine/files/libxine-cut-memusage.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
-Index: xine-lib-1.0/src/xine-engine/audio_out.c
-===================================================================
---- xine-lib-1.0.orig/src/xine-engine/audio_out.c	2004-12-19 21:24:30.000000000 +0100
-+++ xine-lib-1.0/src/xine-engine/audio_out.c	2005-02-16 22:19:25.836765770 +0100
-@@ -95,10 +95,10 @@
- #include "metronom.h"
- 
- 
--#define NUM_AUDIO_BUFFERS       32
--#define AUDIO_BUF_SIZE       32768
-+#define NUM_AUDIO_BUFFERS       16
-+#define AUDIO_BUF_SIZE        8192
- 
--#define ZERO_BUF_SIZE         5000
-+#define ZERO_BUF_SIZE         2048
- 
- /* By adding gap errors (difference between reported and expected
-  * sound card clock) into metronom's vpts_offset we can use its 
-Index: xine-lib-1.0/src/xine-engine/video_decoder.c
-===================================================================
---- xine-lib-1.0.orig/src/xine-engine/video_decoder.c	2004-12-16 14:59:06.000000000 +0100
-+++ xine-lib-1.0/src/xine-engine/video_decoder.c	2005-02-16 22:20:47.104487350 +0100
-@@ -479,7 +479,7 @@
-   
-     num_buffers = stream->xine->config->register_num (stream->xine->config,
-                                                       "engine.buffers.video_num_buffers",
--                                                      500,
-+                                                      250,
-                                                       _("number of video buffers"),
- 						      _("The number of video buffers (each is 8k in size) "
- 						        "xine uses in its internal queue. Higher values "
-@@ -487,7 +487,7 @@
- 							"also increased latency and memory consumption."),
-                                                       20, NULL, NULL);
-   
--    stream->video_fifo = _x_fifo_buffer_new (num_buffers, 8192);
-+    stream->video_fifo = _x_fifo_buffer_new (num_buffers, 4096);
-     stream->spu_track_map_entries = 0;
-   
-     pthread_attr_init(&pth_attrs);
-Index: xine-lib-1.0/src/xine-engine/video_overlay.h
-===================================================================
---- xine-lib-1.0.orig/src/xine-engine/video_overlay.h	2004-12-08 19:18:24.000000000 +0100
-+++ xine-lib-1.0/src/xine-engine/video_overlay.h	2005-02-16 22:19:25.837765631 +0100
-@@ -36,7 +36,7 @@
- #define CLUT_Y_CR_CB_INIT(_y,_cr,_cb)	{ (_cb), (_cr), (_y) }
- #endif
- 
--#define MAX_OBJECTS   50
-+#define MAX_OBJECTS    5
- #define MAX_EVENTS    50
- #define MAX_SHOWING   16
- 
-Index: xine-lib-1.0/src/xine-engine/audio_decoder.c
-===================================================================
---- xine-lib-1.0.orig/src/xine-engine/audio_decoder.c	2004-12-16 14:59:06.000000000 +0100
-+++ xine-lib-1.0/src/xine-engine/audio_decoder.c	2005-02-16 22:21:42.846730591 +0100
-@@ -462,7 +462,7 @@
-     
-     num_buffers = stream->xine->config->register_num (stream->xine->config,
-                                                       "engine.buffers.audio_num_buffers",
--                                                      230,
-+                                                      100,
-                                                       _("number of audio buffers"),
- 						      _("The number of audio buffers (each is 8k in size) "
- 						        "xine uses in its internal queue. Higher values "
diff --git a/recipes/libxine/files/libxine-ffmpeg-enable-arm.patch b/recipes/libxine/files/libxine-ffmpeg-enable-arm.patch
deleted file mode 100644
index f89d2ba..0000000
--- a/recipes/libxine/files/libxine-ffmpeg-enable-arm.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/src/libffmpeg/libavcodec/armv4l/Makefile.am~libxine-ffmpeg-enable-arm
-+++ xine-lib-1-rc7/src/libffmpeg/libavcodec/armv4l/Makefile.am
-@@ -9,9 +9,8 @@
- libavcodec_armv4l_dummy =  libavcodec_armv4l_dummy.c
- EXTRA_DIST =  $(libavcodec_armv4l_src) $(libavcodec_armv4l_dummy)
- 
--#if HAVE_ARMV4L
--#armv4l_modules = $(libavcodec_armv4l_src)
--#endif
--armv4l_modules = 
-+if HAVE_ARMV4L
-+armv4l_modules = $(libavcodec_armv4l_src)
-+endif
- 
- libavcodec_armv4l_la_SOURCES = $(armv4l_modules) $(libavcodec_armv4l_dummy)
diff --git a/recipes/libxine/files/libxine-gcc4.patch b/recipes/libxine/files/libxine-gcc4.patch
deleted file mode 100644
index 0a370b9..0000000
--- a/recipes/libxine/files/libxine-gcc4.patch
+++ /dev/null
@@ -1,138 +0,0 @@
---- xine-lib-1.0.orig/src/xine-engine/post.c	2004-10-17 22:14:30.000000000 +0300
-+++ xine-lib-1.0/src/xine-engine/post.c	2006-02-09 22:15:08.000000000 +0200
-@@ -241,7 +241,7 @@
-     if (!*input) return port;
-     (*input)->xine_in.name = "video in";
-     (*input)->xine_in.type = XINE_POST_DATA_VIDEO;
--    (xine_video_port_t *)(*input)->xine_in.data = &port->new_port;
-+    (*input)->xine_in.data = &port->new_port;
-     (*input)->post = post;
-     xine_list_append_content(post->input, *input);
-   }
-@@ -251,7 +251,7 @@
-     if (!*output) return port;
-     (*output)->xine_out.name = "video out";
-     (*output)->xine_out.type = XINE_POST_DATA_VIDEO;
--    (xine_video_port_t **)(*output)->xine_out.data = &port->original_port;
-+    (*output)->xine_out.data = &port->original_port;
-     (*output)->xine_out.rewire = post_video_rewire;
-     (*output)->post = post;
-     (*output)->user_data = port;
-@@ -718,7 +718,7 @@
-     if (!*input) return port;
-     (*input)->xine_in.name = "audio in";
-     (*input)->xine_in.type = XINE_POST_DATA_AUDIO;
--    (xine_audio_port_t *)(*input)->xine_in.data = &port->new_port;
-+    (*input)->xine_in.data = &port->new_port;
-     (*input)->post = post;
-     xine_list_append_content(post->input, *input);
-   }
-@@ -728,7 +728,7 @@
-     if (!*output) return port;
-     (*output)->xine_out.name = "audio out";
-     (*output)->xine_out.type = XINE_POST_DATA_AUDIO;
--    (xine_audio_port_t **)(*output)->xine_out.data = &port->original_port;
-+    (*output)->xine_out.data = &port->original_port;
-     (*output)->xine_out.rewire = post_audio_rewire;
-     (*output)->post = post;
-     (*output)->user_data = port;
---- xine-lib-1.0.orig/src/xine-utils/color.c	2003-12-09 02:02:38.000000000 +0200
-+++ xine-lib-1.0/src/xine-utils/color.c	2006-02-09 22:13:36.000000000 +0200
-@@ -495,8 +495,10 @@
- 
-   /* process blocks of 4 pixels */
-   for (x=0; x < (width / 4); x++) {
--    n1  = *(((unsigned int *) src1)++);
--    n2  = *(((unsigned int *) src2)++);
-+    n1  = *((unsigned int *) src1);
-+    src1+=sizeof(unsigned int);
-+    n2  = *((unsigned int *) src2);
-+    src2+=sizeof(unsigned int);
-     n3  = (n1 & 0xFF00FF00) >> 8;
-     n4  = (n2 & 0xFF00FF00) >> 8;
-     n1 &= 0x00FF00FF;
---- xine-lib-1.0.orig/src/libffmpeg/libavcodec/avcodec.h	2004-05-30 22:24:19.000000000 +0300
-+++ xine-lib-1.0/src/libffmpeg/libavcodec/avcodec.h	2006-02-09 22:33:27.000000000 +0200
-@@ -1639,6 +1639,13 @@
- #define FF_OPT_MAX_DEPTH 10
- } AVOption;
-
-+#ifdef HAVE_MMX
-+extern const struct AVOption avoptions_common[3 + 5];
-+#else
-+extern const struct AVOption avoptions_common[3];
-+#endif
-+extern const struct AVOption avoptions_workaround_bug[11];
-+
- /**
-  * Parse option(s) and sets fields in passed structure
-  * @param strct  structure where the parsed results will be written
---- xine-lib-1.0.orig/src/libffmpeg/libavcodec/common.h	2004-05-30 22:24:19.000000000 +0300
-+++ xine-lib-1.0/src/libffmpeg/libavcodec/common.h	2006-02-09 22:32:56.000000000 +0200
-@@ -66,13 +66,13 @@
- #define AVOPTION_SUB(ptr) { .name = NULL, .help = (const char*)ptr }
- #define AVOPTION_END() AVOPTION_SUB(NULL)
- 
--struct AVOption;
-+/*struct AVOption;
- #ifdef HAVE_MMX
- extern const struct AVOption avoptions_common[3 + 5];
- #else
- extern const struct AVOption avoptions_common[3];
- #endif
--extern const struct AVOption avoptions_workaround_bug[11];
-+extern const struct AVOption avoptions_workaround_bug[11];*/
- 
- #endif /* HAVE_AV_CONFIG_H */
- 
---- xine-lib-1.0.orig/src/libffmpeg/libavcodec/mpegvideo.h	2004-05-30 22:24:22.000000000 +0300
-+++ xine-lib-1.0/src/libffmpeg/libavcodec/mpegvideo.h	2006-02-09 22:35:54.000000000 +0200
-@@ -904,7 +904,7 @@
- int ff_h263_resync(MpegEncContext *s);
- int ff_h263_get_gob_height(MpegEncContext *s);
- int ff_mpeg4_set_direct_mv(MpegEncContext *s, int mx, int my);
--int ff_h263_round_chroma(int x);
-+/*int ff_h263_round_chroma(int x);*/
- void ff_h263_encode_motion(MpegEncContext * s, int val, int f_code);
- int ff_mpeg4_find_frame_end(ParseContext *pc, const uint8_t *buf, int buf_size);
- 
---- xine-lib-1.0.orig/src/libxineadec/nosefart/nes_apu.c	2004-12-12 08:55:59.000000000 +0200
-+++ xine-lib-1.0/src/libxineadec/nosefart/nes_apu.c	2006-02-11 22:42:29.000000000 +0200
-@@ -1012,9 +1012,15 @@
- 
-       /* signed 16-bit output, unsigned 8-bit */
-       if (16 == apu->sample_bits)
--         *((int16 *) buffer)++ = (int16) accum;
-+      {
-+         *((int16 *) buffer) = (int16) accum;
-+         buffer=((int16 *)buffer)+1;
-+      }
-       else
--         *((uint8 *) buffer)++ = (accum >> 8) ^ 0x80;
-+      {
-+         *((uint8 *) buffer) = (accum >> 8) ^ 0x80;
-+         buffer=((int8 *)buffer)+1;
-+      }
-    }
- 
-    /* resync cycle counter */
---- xine-lib-1.0.orig/src/post/audio/stretch.c	2004-10-30 02:11:38.000000000 +0300
-+++ xine-lib-1.0/src/post/audio/stretch.c	2006-02-11 22:45:14.000000000 +0200
-@@ -476,7 +476,7 @@
-     memcpy( outbuf->mem, data_out, 
-             outbuf->num_frames * this->bytes_per_frame );
-     num_frames_out -= outbuf->num_frames;
--    (uint8_t *)data_out += outbuf->num_frames * this->bytes_per_frame;
-+    data_out = (uint8_t *)data_out + outbuf->num_frames * this->bytes_per_frame;
-                 
-     outbuf->vpts        = this->pts;
-     this->pts           = 0;
-@@ -587,7 +587,7 @@
-     memcpy( (uint8_t *)this->audiofrag + this->num_frames * this->bytes_per_frame,
-             data_in, frames_to_copy * this->bytes_per_frame );
-     
--    (uint8_t *)data_in += frames_to_copy * this->bytes_per_frame;
-+    data_in = (uint8_t *)data_in + frames_to_copy * this->bytes_per_frame;
-     this->num_frames += frames_to_copy;
-     buf->num_frames -= frames_to_copy;
- 
diff --git a/recipes/libxine/files/libxine-libavcodec.patch b/recipes/libxine/files/libxine-libavcodec.patch
deleted file mode 100644
index 6dde991..0000000
--- a/recipes/libxine/files/libxine-libavcodec.patch
+++ /dev/null
@@ -1,926 +0,0 @@
-TO be MERGED!!!
-
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/src/libffmpeg/libavcodec/Makefile.am~libxine-libavcodec
-+++ xine-lib-1-rc7/src/libffmpeg/libavcodec/Makefile.am
-@@ -9,9 +9,14 @@
- # we need to compile everything in debug mode, including the encoders,
- # otherwise we get unresolved symbols, because some unsatisfied function calls
- # are not optimized away with debug optimization
--AM_CFLAGS = $(LIBFFMPEG_CFLAGS) `test "$(CFLAGS)" = "$(DEBUG_CFLAGS)" && echo -DCONFIG_ENCODERS`
-+#AM_CFLAGS = $(LIBFFMPEG_CFLAGS) `test "$(CFLAGS)" = "$(DEBUG_CFLAGS)" && echo -DCONFIG_ENCODERS`
- ASFLAGS =
- 
-+if HAVE_ARMV4L
-+AM_CFLAGS = -DARCH_ARMV4L $(LIBFFMPEG_CFLAGS)
-+else
-+AM_CFLAGS = $(LIBFFMPEG_CFLAGS)
-+endif
- noinst_LTLIBRARIES = libavcodec.la
- 
- libavcodec_la_SOURCES = \
---- xine-lib-1-rc7/src/libffmpeg/libavcodec/dsputil.h~libxine-libavcodec
-+++ xine-lib-1-rc7/src/libffmpeg/libavcodec/dsputil.h
-@@ -45,6 +45,7 @@
- void ff_fdct248_islow (DCTELEM *data);
- 
- void j_rev_dct (DCTELEM *data);
-+void j_rev_dct_ARM ( DCTELEM *data );
- 
- void ff_fdct_mmx(DCTELEM *block);
- void ff_fdct_mmx2(DCTELEM *block);
---- xine-lib-1-rc7/src/libffmpeg/libavcodec/mpegvideo.c~libxine-libavcodec
-+++ xine-lib-1-rc7/src/libffmpeg/libavcodec/mpegvideo.c
-@@ -218,6 +218,25 @@
- }
- #endif //CONFIG_ENCODERS
- 
-+
-+#ifdef ARCH_ARMV4L
-+
-+static void ff_jref_idct_put_armv4l(UINT8 *dest, int line_size, DCTELEM *block)
-+{
-+//    fprintf(stderr, "src/libffmpeg/libavcodec/mpegvideo.c : ff_jref_idct_put_armv4l utilisant l'iDCT ARMv4l en ASM\n");
-+    j_rev_dct_ARM (block);
-+    ff_put_pixels_clamped(block, dest, line_size);
-+}
-+static void ff_jref_idct_add_armv4l(UINT8 *dest, int line_size, DCTELEM *block)
-+{
-+//    fprintf(stderr, "src/libffmpeg/libavcodec/mpegvideo.c : ff_jref_idct_add_armv4l utilisant l'iDCT ARMv4l en ASM\n");
-+    j_rev_dct_ARM (block);
-+    ff_add_pixels_clamped(block, dest, line_size);
-+}
-+
-+#endif
-+
-+
- /* init common dct for both encoder and decoder */
- int DCT_common_init(MpegEncContext *s)
- {
-@@ -246,7 +265,11 @@
-     MPV_common_init_mmi(s);
- #endif
- #ifdef ARCH_ARMV4L
--    MPV_common_init_armv4l(s);
-+/*    MPV_common_init_armv4l(s); */
-+/* Methode bourrine, mais bon, c'est pour pas trop se prendre la tete a tout changer ce soir, a ameliorer plus tard*/
-+    s->idct_put= ff_jref_idct_put_armv4l;
-+    s->idct_add= ff_jref_idct_add_armv4l;
-+    s->idct_permutation_type= FF_NO_IDCT_PERM;
- #endif
- #ifdef ARCH_POWERPC
-     MPV_common_init_ppc(s);
---- xine-lib-1-rc7/src/libffmpeg/libavcodec/armv4l/jrevdct_arm.S~libxine-libavcodec
-+++ xine-lib-1-rc7/src/libffmpeg/libavcodec/armv4l/jrevdct_arm.S
-@@ -1,386 +1,491 @@
- /* 
--   C-like prototype :
--	void j_rev_dct_ARM(DCTBLOCK data)
-+ * jrevdct_arm.S
-+ * Copyright (C) 2002 Frederic 'dilb' Boulay.
-+ * All Rights Reserved.
-+ *
-+ * Author: Frederic Boulay <dilb@handhelds.org>
-+ *
-+ * you can redistribute this file and/or modify
-+ * it under the terms of the GNU General Public License (version 2)
-+ * as published by the Free Software Foundation.
-+ *
-+ * This file is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-+ *
-+ *
-+ * The function defined in this file, is derived from the simple_idct function from
-+ * the libavcodec library part of the ffmpeg project. 
-+ */
- 
--   With DCTBLOCK being a pointer to an array of 64 'signed shorts'
- 
--   Copyright (c) 2001 Lionel Ulmer (lionel.ulmer@free.fr / bbrox@bbrox.org)
- 
--   Permission is hereby granted, free of charge, to any person obtaining a copy
--   of this software and associated documentation files (the "Software"), to deal
--   in the Software without restriction, including without limitation the rights
--   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--   copies of the Software, and to permit persons to whom the Software is
--   furnished to do so, subject to the following conditions:
- 
--   The above copyright notice and this permission notice shall be included in
--   all copies or substantial portions of the Software.
-+/* useful constants for the algorithm, they are save in __constant_ptr__ at the end of the source code.*/
-+#define W1  22725
-+#define W2  21407
-+#define W3  19266
-+#define W4  16383
-+#define W5  12873
-+#define W6  8867
-+#define W7  4520
-+#define MASK_MSHW 0xFFFF0000
-+
-+/* offsets of the constants in the vector*/
-+#define offW1  0
-+#define offW2  4
-+#define offW3  8
-+#define offW4  12
-+#define offW5  16
-+#define offW6  20
-+#define offW7  24
-+#define offMASK_MSHW 28
-+
-+#define ROW_SHIFT 11
-+#define ROW_SHIFT2MSHW (16-11)
-+#define COL_SHIFT 20
-+#define ROW_SHIFTED_1 1024 /* 1<< (ROW_SHIFT-1)*/
-+#define COL_SHIFTED_1 524288 /* 1<< (COL_SHIFT-1)*/
-+
- 
--   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
--   COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
--   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
--   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--	
--*/
--#define FIX_0_298631336 2446
--#define FIX_0_541196100 4433
--#define FIX_0_765366865 6270
--#define FIX_1_175875602 9633
--#define FIX_1_501321110 12299
--#define FIX_2_053119869 16819
--#define FIX_3_072711026 25172
--#define FIX_M_0_390180644 -3196
--#define FIX_M_0_899976223 -7373
--#define FIX_M_1_847759065 -15137
--#define FIX_M_1_961570560 -16069
--#define FIX_M_2_562915447 -20995
--#define FIX_0xFFFF 0xFFFF	
--		
--#define FIX_0_298631336_ID      0
--#define FIX_0_541196100_ID      4
--#define FIX_0_765366865_ID      8
--#define FIX_1_175875602_ID     12
--#define FIX_1_501321110_ID     16
--#define FIX_2_053119869_ID     20
--#define FIX_3_072711026_ID     24
--#define FIX_M_0_390180644_ID   28
--#define FIX_M_0_899976223_ID   32
--#define FIX_M_1_847759065_ID   36
--#define FIX_M_1_961570560_ID   40
--#define FIX_M_2_562915447_ID   44
--#define FIX_0xFFFF_ID          48
- 	.text
- 	.align
--	
- 	.global j_rev_dct_ARM
-+
- j_rev_dct_ARM:
--	stmdb   sp!, { r4 - r12, lr }   @ all callee saved regs
-+simple_idct3:
-+simple_idct_ARM:
-+        @@ void simple_idct_ARM(int16_t *block)
-+        @@ save stack for reg needed (take all of them),
-+        @@ R0-R3 are scratch regs, so no need to save them, but R0 contains the pointer to block
-+        @@ so it must not be overwritten, if it is not saved!!
-+        @@ R12 is another scratch register, so it should not be saved too
-+        @@ save all registers
-+        stmfd sp!, {r4-r11, r14} @ R14 is also called LR
-+        @@ at this point, R0=block, other registers are free.
-+        add r14, r0, #112        @ R14=&block[8*7], better start from the last row, and decrease the value until row=0, i.e. R12=block.
-+        add r12, pc, #(__constant_ptr__-.-8) @ R12=__constant_ptr__, the vector containing the constants, probably not necessary to reserve a register for it
-+        @@ add 2 temporary variables in the stack: R0 and R14
-+        sub sp, sp, #8          @ allow 2 local variables
-+        str r0, [sp, #0]        @ save block in sp[0]
-+        @@ stack status
-+        @@ sp+4   free
-+        @@ sp+0   R0  (block)
- 
--	sub sp, sp, #4                  @ reserve some space on the stack
--	str r0, [ sp ]                  @ save the DCT pointer to the stack
- 
--	mov lr, r0                      @ lr = pointer to the current row
--	mov r12, #8                     @ r12 = row-counter
--	add r11, pc, #(const_array-.-8) @ r11 = base pointer to the constants array	
--row_loop:
--	ldrsh r0, [lr, # 0]             @ r0 = 'd0'
--	ldrsh r1, [lr, # 8]             @ r1 = 'd1'
-+        @@ at this point, R0=block, R14=&block[56], R12=__const_ptr_, R1-R11 free
- 
--	@ Optimization for row that have all items except the first set to 0
--	@ (this works as the DCTELEMS are always 4-byte aligned)
--	ldr r5, [lr, # 0]
--	ldr r2, [lr, # 4]
--	ldr r3, [lr, # 8]
--	ldr r4, [lr, #12]
--	orr r3, r3, r4
--	orr r3, r3, r2
--	orrs r5, r3, r5
--	beq end_of_row_loop             @ nothing to be done as ALL of them are '0'
--	orrs r2, r3, r1
--	beq empty_row
--	
--	ldrsh r2, [lr, # 2]             @ r2 = 'd2'
--	ldrsh r4, [lr, # 4]             @ r4 = 'd4'
--	ldrsh r6, [lr, # 6]             @ r6 = 'd6'
--	
--	ldr r3, [r11, #FIX_0_541196100_ID]
--	add r7, r2, r6
--	ldr r5, [r11, #FIX_M_1_847759065_ID]
--	mul r7, r3, r7                      @ r7 = z1
--	ldr r3, [r11, #FIX_0_765366865_ID]
--	mla r6, r5, r6, r7                  @ r6 = tmp2
--	add r5, r0, r4                      @ r5 = tmp0
--	mla r2, r3, r2, r7                  @ r2 = tmp3
--	sub r3, r0, r4                      @ r3 = tmp1
- 
--	add r0, r2, r5, lsl #13             @ r0 = tmp10
--	rsb r2, r2, r5, lsl #13             @ r2 = tmp13
--	add r4, r6, r3, lsl #13             @ r4 = tmp11
--	rsb r3, r6, r3, lsl #13             @ r3 = tmp12
-+__row_loop:
-+        @@ read the row and check if it is null, almost null, or not, according to strongarm specs, it is not necessary to optimise ldr accesses (i.e. split 32bits in 2 16bits words), at least it gives more usable registers :)
-+        ldr r1, [r14, #0]        @ R1=(int32)(R12)[0]=ROWr32[0] (relative row cast to a 32b pointer)
-+        ldr r2, [r14, #4]        @ R2=(int32)(R12)[1]=ROWr32[1]
-+        ldr r3, [r14, #8]        @ R3=ROWr32[2]
-+        ldr r4, [r14, #12]       @ R4=ROWr32[3]
-+        @@ check if the words are null, if all of them are null, then proceed with next row (branch __end_row_loop),
-+        @@ if ROWr16[0] is the only one not null, then proceed with this special case (branch __almost_empty_row)
-+        @@ else follow the complete algorithm.
-+        @@ at this point, R0=block, R14=&block[n], R12=__const_ptr_, R1=ROWr32[0], R2=ROWr32[1],
-+        @@                R3=ROWr32[2], R4=ROWr32[3], R5-R11 free
-+        orr r5, r4, r3           @ R5=R4 | R3
-+        orr r5, r5, r2           @ R5=R4 | R3 | R2
-+        orrs r6, r5, r1          @ Test R5 | R1 (the aim is to check if everything is null)
-+        beq __end_row_loop
-+        mov r7, r1, asr #16      @ R7=R1>>16=ROWr16[1] (evaluate it now, as it could be useful later)
-+        ldrsh r6, [r14, #0]      @ R6=ROWr16[0]
-+        orrs r5, r5, r7          @ R5=R4 | R3 | R2 | R7
-+        beq __almost_empty_row
- 
--	stmdb   sp!, { r0, r2, r3, r4 } @ save on the stack tmp10, tmp13, tmp12, tmp11
--	
--	ldrsh r3, [lr, #10]             @ r3 = 'd3'
--	ldrsh r5, [lr, #12]             @ r5 = 'd5'
--	ldrsh r7, [lr, #14]             @ r7 = 'd7'
-+__b_evaluation:
-+        @@ at this point, R0=block (temp),  R1(free), R2=ROWr32[1], R3=ROWr32[2], R4=ROWr32[3],
-+        @@     R5=(temp), R6=ROWr16[0], R7=ROWr16[1], R8-R11 free,
-+        @@     R12=__const_ptr_, R14=&block[n]
-+        @@ to save some registers/calls, proceed with b0-b3 first, followed by a0-a3
- 
--	add r0, r3, r5	                @ r0 = 'z2'
--	add r2, r1, r7                  @ r2 = 'z1'
--	add r4, r3, r7                  @ r4 = 'z3'
--	add r6, r1, r5                  @ r6 = 'z4'
--	ldr r9, [r11, #FIX_1_175875602_ID]
--	add r8, r4, r6                  @ r8 = z3 + z4
--	ldr r10, [r11, #FIX_M_0_899976223_ID]
--	mul r8, r9, r8                  @ r8 = 'z5'
--	ldr r9, [r11, #FIX_M_2_562915447_ID]
--	mul r2, r10, r2                 @ r2 = 'z1'
--	ldr r10, [r11, #FIX_M_1_961570560_ID]
--	mul r0, r9, r0                  @ r0 = 'z2'
--	ldr r9, [r11, #FIX_M_0_390180644_ID]
--	mla r4, r10, r4, r8             @ r4 = 'z3'
--	ldr r10, [r11, #FIX_0_298631336_ID]
--	mla r6, r9, r6, r8              @ r6 = 'z4'
--	ldr r9, [r11, #FIX_2_053119869_ID]
--	mla r7, r10, r7, r2             @ r7 = tmp0 + z1
--	ldr r10, [r11, #FIX_3_072711026_ID]
--	mla r5, r9, r5, r0              @ r5 = tmp1 + z2
--	ldr r9, [r11, #FIX_1_501321110_ID]
--	mla r3, r10, r3, r0             @ r3 = tmp2 + z2
--	add r7, r7, r4                  @ r7 = tmp0
--	mla r1, r9, r1, r2              @ r1 = tmp3 + z1
--	add r5,	r5, r6                  @ r5 = tmp1
--	add r3, r3, r4                  @ r3 = tmp2
--	add r1, r1, r6                  @ r1 = tmp3
-+        @@ MUL16(b0, W1, row[1]);
-+        @@ MUL16(b1, W3, row[1]);
-+        @@ MUL16(b2, W5, row[1]);
-+        @@ MUL16(b3, W7, row[1]);
-+        @@ MAC16(b0, W3, row[3]);
-+        @@ MAC16(b1, -W7, row[3]);
-+        @@ MAC16(b2, -W1, row[3]);
-+        @@ MAC16(b3, -W5, row[3]);
-+        ldr r8, [r12, #offW1]    @ R8=W1
-+        mov r2, r2, asr #16      @ R2=ROWr16[3]
-+        mul r0, r8, r7           @ R0=W1*ROWr16[1]=b0 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+        ldr r9, [r12, #offW3]    @ R9=W3
-+        ldr r10, [r12, #offW5]   @ R10=W5
-+        mul r1, r9, r7           @ R1=W3*ROWr16[1]=b1 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+        ldr r11, [r12, #offW7]   @ R11=W7
-+        mul r5, r10, r7          @ R5=W5*ROWr16[1]=b2 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+        mul r7, r11, r7          @ R7=W7*ROWr16[1]=b3 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+		teq r2, #0               @ if null avoid muls
-+		mlane r0, r9, r2, r0     @ R0+=W3*ROWr16[3]=b0 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+        rsbne r2, r2, #0         @ R2=-ROWr16[3]
-+        mlane r1, r11, r2, r1    @ R1-=W7*ROWr16[3]=b1 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+        mlane r5, r8, r2, r5     @ R5-=W1*ROWr16[3]=b2 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+        mlane r7, r10, r2, r7    @ R7-=W5*ROWr16[3]=b3 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
- 
--	ldmia sp!, { r0, r2, r4, r6 } @ r0 = tmp10 / r2 = tmp13 / r4 = tmp12 / r6 = tmp11
--	                              @ r1 = tmp3  / r3 = tmp2  / r5 = tmp1  / r7 = tmp0
--	
--	@ Compute DESCALE(tmp10 + tmp3, CONST_BITS-PASS1_BITS)
--	add r8, r0, r1
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, # 0]
--	
--	@ Compute DESCALE(tmp10 - tmp3, CONST_BITS-PASS1_BITS)
--	sub r8, r0, r1
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, #14]
--	
--	@ Compute DESCALE(tmp11 + tmp2, CONST_BITS-PASS1_BITS)
--	add r8, r6, r3
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, # 2]
--	
--	@ Compute DESCALE(tmp11 - tmp2, CONST_BITS-PASS1_BITS)
--	sub r8, r6, r3
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, #12]
--	
--	@ Compute DESCALE(tmp12 + tmp1, CONST_BITS-PASS1_BITS)
--	add r8, r4, r5
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, # 4]
--	
--	@ Compute DESCALE(tmp12 - tmp1, CONST_BITS-PASS1_BITS)
--	sub r8, r4, r5
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, #10]
--	
--	@ Compute DESCALE(tmp13 + tmp0, CONST_BITS-PASS1_BITS)
--	add r8, r2, r7
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, # 6]
--	
--	@ Compute DESCALE(tmp13 - tmp0, CONST_BITS-PASS1_BITS)
--	sub r8, r2, r7
--	add r8, r8, #(1<<10)
--	mov r8, r8, asr #11
--	strh r8, [lr, # 8]
-+        @@ at this point, R0=b0,  R1=b1, R2 (free), R3=ROWr32[2], R4=ROWr32[3],
-+        @@     R5=b2, R6=ROWr16[0], R7=b3, R8=W1, R9=W3, R10=W5, R11=W7,
-+        @@     R12=__const_ptr_, R14=&block[n]
-+        @@ temp = ((uint32_t*)row)[2] | ((uint32_t*)row)[3];
-+        @@ if (temp != 0) {}
-+        orrs r2, r3, r4          @ R2=ROWr32[2] | ROWr32[3]
-+        beq __end_b_evaluation
- 
--	@ End of row loop
--	add lr, lr, #16
--	subs r12, r12, #1
--	bne row_loop
--	beq start_column_loop
--	
--empty_row:
--	ldr r1, [r11, #FIX_0xFFFF_ID]
--	mov r0, r0, lsl #2
--	and r0, r0, r1
--	add r0, r0, r0, lsl #16
--	str r0, [lr, # 0]
--	str r0, [lr, # 4]
--	str r0, [lr, # 8]
--	str r0, [lr, #12]
-+        @@ at this point, R0=b0,  R1=b1, R2 (free), R3=ROWr32[2], R4=ROWr32[3],
-+        @@     R5=b2, R6=ROWr16[0], R7=b3, R8=W1, R9=W3, R10=W5, R11=W7,
-+        @@     R12=__const_ptr_, R14=&block[n]
-+        @@ MAC16(b0, W5, row[5]);
-+        @@ MAC16(b2, W7, row[5]);
-+        @@ MAC16(b3, W3, row[5]);
-+        @@ MAC16(b1, -W1, row[5]);
-+        @@ MAC16(b0, W7, row[7]);
-+        @@ MAC16(b2, W3, row[7]);
-+        @@ MAC16(b3, -W1, row[7]);
-+        @@ MAC16(b1, -W5, row[7]);
-+        mov r3, r3, asr #16      @ R3=ROWr16[5]
-+		teq r3, #0               @ if null avoid muls
-+        mlane r0, r10, r3, r0    @ R0+=W5*ROWr16[5]=b0
-+        mov r4, r4, asr #16      @ R4=ROWr16[7]
-+        mlane r5, r11, r3, r5    @ R5+=W7*ROWr16[5]=b2
-+        mlane r7, r9, r3, r7     @ R7+=W3*ROWr16[5]=b3
-+        rsbne r3, r3, #0         @ R3=-ROWr16[5]
-+        mlane r1, r8, r3, r1     @ R7-=W1*ROWr16[5]=b1
-+        @@ R3 is free now
-+		teq r4, #0               @ if null avoid muls
-+        mlane r0, r11, r4, r0    @ R0+=W7*ROWr16[7]=b0
-+        mlane r5, r9, r4, r5     @ R5+=W3*ROWr16[7]=b2
-+        rsbne r4, r4, #0         @ R4=-ROWr16[7]
-+        mlane r7, r8, r4, r7     @ R7-=W1*ROWr16[7]=b3
-+        mlane r1, r10, r4, r1    @ R1-=W5*ROWr16[7]=b1
-+        @@ R4 is free now
-+__end_b_evaluation:
-+        @@ at this point, R0=b0,  R1=b1, R2=ROWr32[2] | ROWr32[3] (tmp), R3 (free), R4 (free),
-+        @@     R5=b2, R6=ROWr16[0], R7=b3, R8 (free), R9 (free), R10 (free), R11 (free),
-+        @@     R12=__const_ptr_, R14=&block[n]
- 
--end_of_row_loop:
--	@ End of loop
--	add lr, lr, #16
--	subs r12, r12, #1
--	bne row_loop
-+__a_evaluation:
-+        @@ a0 = (W4 * row[0]) + (1 << (ROW_SHIFT - 1));
-+        @@ a1 = a0 + W6 * row[2];
-+        @@ a2 = a0 - W6 * row[2];
-+        @@ a3 = a0 - W2 * row[2];
-+        @@ a0 = a0 + W2 * row[2];
-+        ldr r9, [r12, #offW4]    @ R9=W4
-+        mul r6, r9, r6           @ R6=W4*ROWr16[0]
-+        ldr r10, [r12, #offW6]   @ R10=W6
-+        ldrsh r4, [r14, #4]      @ R4=ROWr16[2] (a3 not defined yet)
-+        add r6, r6, #ROW_SHIFTED_1 @ R6=W4*ROWr16[0] + 1<<(ROW_SHIFT-1) (a0)
- 
--start_column_loop:
--	@ Start of column loop
--	ldr lr, [ sp ]
--	mov r12, #8
--column_loop:
--	ldrsh r0, [lr, #( 0*8)]             @ r0 = 'd0'
--	ldrsh r2, [lr, #( 4*8)]             @ r2 = 'd2'
--	ldrsh r4, [lr, #( 8*8)]             @ r4 = 'd4'
--	ldrsh r6, [lr, #(12*8)]             @ r6 = 'd6'
-+        mul r11, r10, r4         @ R11=W6*ROWr16[2]
-+        ldr r8, [r12, #offW2]    @ R8=W2
-+        sub r3, r6, r11          @ R3=a0-W6*ROWr16[2] (a2)
-+        @@ temp = ((uint32_t*)row)[2] | ((uint32_t*)row)[3];
-+        @@ if (temp != 0) {}
-+        teq r2, #0
-+        beq __end_bef_a_evaluation
- 
--	ldr r3, [r11, #FIX_0_541196100_ID]
--	add r1, r2, r6
--	ldr r5, [r11, #FIX_M_1_847759065_ID]
--	mul r1, r3, r1                      @ r1 = z1
--	ldr r3, [r11, #FIX_0_765366865_ID]
--	mla r6, r5, r6, r1                  @ r6 = tmp2
--	add r5, r0, r4                      @ r5 = tmp0
--	mla r2, r3, r2, r1                  @ r2 = tmp3
--	sub r3, r0, r4                      @ r3 = tmp1
-+	add r2, r6, r11          @ R2=a0+W6*ROWr16[2] (a1)
-+        mul r11, r8, r4          @ R11=W2*ROWr16[2]
-+        sub r4, r6, r11          @ R4=a0-W2*ROWr16[2] (a3)
-+        add r6, r6, r11          @ R6=a0+W2*ROWr16[2] (a0)
- 
--	add r0, r2, r5, lsl #13             @ r0 = tmp10
--	rsb r2, r2, r5, lsl #13             @ r2 = tmp13
--	add r4, r6, r3, lsl #13             @ r4 = tmp11
--	rsb r6, r6, r3, lsl #13             @ r6 = tmp12
- 
--	ldrsh r1, [lr, #( 2*8)]             @ r1 = 'd1'
--	ldrsh r3, [lr, #( 6*8)]             @ r3 = 'd3'
--	ldrsh r5, [lr, #(10*8)]             @ r5 = 'd5'
--	ldrsh r7, [lr, #(14*8)]             @ r7 = 'd7'
-+        @@ at this point, R0=b0,  R1=b1, R2=a1, R3=a2, R4=a3,
-+        @@     R5=b2, R6=a0, R7=b3, R8=W2, R9=W4, R10=W6, R11 (free),
-+        @@     R12=__const_ptr_, R14=&block[n]
- 
--	@ Check for empty odd column (happens about 20 to 25 % of the time according to my stats)
--	orr r9, r1, r3
--	orr r10, r5, r7
--	orrs r10, r9, r10
--	beq empty_odd_column
- 
--	stmdb   sp!, { r0, r2, r4, r6 } @ save on the stack tmp10, tmp13, tmp12, tmp11
--		
--	add r0, r3, r5	                @ r0 = 'z2'
--	add r2, r1, r7                  @ r2 = 'z1'
--	add r4, r3, r7                  @ r4 = 'z3'
--	add r6, r1, r5                  @ r6 = 'z4'
--	ldr r9, [r11, #FIX_1_175875602_ID]
--	add r8, r4, r6
--	ldr r10, [r11, #FIX_M_0_899976223_ID]
--	mul r8, r9, r8                  @ r8 = 'z5'
--	ldr r9, [r11, #FIX_M_2_562915447_ID]
--	mul r2, r10, r2                 @ r2 = 'z1'
--	ldr r10, [r11, #FIX_M_1_961570560_ID]
--	mul r0, r9, r0                  @ r0 = 'z2'
--	ldr r9, [r11, #FIX_M_0_390180644_ID]
--	mla r4, r10, r4, r8             @ r4 = 'z3'
--	ldr r10, [r11, #FIX_0_298631336_ID]
--	mla r6, r9, r6, r8              @ r6 = 'z4'
--	ldr r9, [r11, #FIX_2_053119869_ID]
--	mla r7, r10, r7, r2             @ r7 = tmp0 + z1
--	ldr r10, [r11, #FIX_3_072711026_ID]
--	mla r5, r9, r5, r0              @ r5 = tmp1 + z2
--	ldr r9, [r11, #FIX_1_501321110_ID]
--	mla r3, r10, r3, r0             @ r3 = tmp2 + z2
--	add r7, r7, r4                  @ r7 = tmp0
--	mla r1, r9, r1, r2              @ r1 = tmp3 + z1
--	add r5,	r5, r6                  @ r5 = tmp1
--	add r3, r3, r4                  @ r3 = tmp2
--	add r1, r1, r6                  @ r1 = tmp3	
--	
--	ldmia sp!, { r0, r2, r4, r6 } @ r0 = tmp10 / r2 = tmp13 / r4 = tmp11 / r6 = tmp12
--	                              @ r1 = tmp3  / r3 = tmp2  / r5 = tmp1  / r7 = tmp0	
-+        @@ a0 += W4*row[4]
-+        @@ a1 -= W4*row[4]
-+        @@ a2 -= W4*row[4]
-+        @@ a3 += W4*row[4]
-+        ldrsh r11, [r14, #8]     @ R11=ROWr16[4]
-+		teq r11, #0              @ if null avoid muls
-+        mulne r11, r9, r11       @ R11=W4*ROWr16[4]
-+        @@ R9 is free now
-+        ldrsh r9, [r14, #12]     @ R9=ROWr16[6]
-+        addne r6, r6, r11        @ R6+=W4*ROWr16[4] (a0)
-+        subne r2, r2, r11        @ R2-=W4*ROWr16[4] (a1)
-+        subne r3, r3, r11        @ R3-=W4*ROWr16[4] (a2)
-+        addne r4, r4, r11        @ R4+=W4*ROWr16[4] (a3)
-+        @@ W6 alone is no more useful, save W2*ROWr16[6] in it instead
-+		teq r9, #0               @ if null avoid muls
-+        mulne r11, r10, r9       @ R11=W6*ROWr16[6]
-+        addne r6, r6, r11        @ R6+=W6*ROWr16[6] (a0)
-+        mulne r10, r8, r9        @ R10=W2*ROWr16[6]
-+        @@ a0 += W6*row[6];
-+        @@ a3 -= W6*row[6];
-+        @@ a1 -= W2*row[6];
-+        @@ a2 += W2*row[6];
-+        subne r4, r4, r11        @ R4-=W6*ROWr16[6] (a3)
-+        subne r2, r2, r10        @ R2-=W2*ROWr16[6] (a1)
-+        addne r3, r3, r10        @ R3+=W2*ROWr16[6] (a2)
- 
--	@ Compute DESCALE(tmp10 + tmp3, CONST_BITS+PASS1_BITS+3)
--	add r8, r0, r1
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #( 0*8)]
--	
--	@ Compute DESCALE(tmp10 - tmp3, CONST_BITS+PASS1_BITS+3)
--	sub r8, r0, r1
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #(14*8)]
--	
--	@ Compute DESCALE(tmp11 + tmp2, CONST_BITS+PASS1_BITS+3)
--	add r8, r4, r3
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #( 2*8)]
--	
--	@ Compute DESCALE(tmp11 - tmp2, CONST_BITS+PASS1_BITS+3)
--	sub r8, r4, r3
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #(12*8)]
--	
--	@ Compute DESCALE(tmp12 + tmp1, CONST_BITS+PASS1_BITS+3)
--	add r8, r6, r5
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #( 4*8)]
--	
--	@ Compute DESCALE(tmp12 - tmp1, CONST_BITS+PASS1_BITS+3)
--	sub r8, r6, r5
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #(10*8)]
--	
--	@ Compute DESCALE(tmp13 + tmp0, CONST_BITS+PASS1_BITS+3)
--	add r8, r2, r7
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #( 6*8)]
--	
--	@ Compute DESCALE(tmp13 - tmp0, CONST_BITS+PASS1_BITS+3)
--	sub r8, r2, r7
--	add r8, r8, #(1<<17)
--	mov r8, r8, asr #18
--	strh r8, [lr, #( 8*8)]
-+__end_a_evaluation:
-+        @@ at this point, R0=b0,  R1=b1, R2=a1, R3=a2, R4=a3,
-+        @@     R5=b2, R6=a0, R7=b3, R8 (free), R9 (free), R10 (free), R11 (free),
-+        @@     R12=__const_ptr_, R14=&block[n]
-+        @@ row[0] = (a0 + b0) >> ROW_SHIFT;
-+        @@ row[1] = (a1 + b1) >> ROW_SHIFT;
-+        @@ row[2] = (a2 + b2) >> ROW_SHIFT;
-+        @@ row[3] = (a3 + b3) >> ROW_SHIFT;
-+        @@ row[4] = (a3 - b3) >> ROW_SHIFT;
-+        @@ row[5] = (a2 - b2) >> ROW_SHIFT;
-+        @@ row[6] = (a1 - b1) >> ROW_SHIFT;
-+        @@ row[7] = (a0 - b0) >> ROW_SHIFT;
-+        add r8, r6, r0           @ R8=a0+b0
-+        add r9, r2, r1           @ R9=a1+b1
-+        @@ put 2 16 bits half-words in a 32bits word
-+        @@ ROWr32[0]=ROWr16[0] | (ROWr16[1]<<16) (only Little Endian compliant then!!!)
-+        ldr r10, [r12, #offMASK_MSHW] @ R10=0xFFFF0000
-+        and r9, r10, r9, lsl #ROW_SHIFT2MSHW @ R9=0xFFFF0000 & ((a1+b1)<<5)
-+        mvn r11, r10             @ R11= NOT R10= 0x0000FFFF
-+        and r8, r11, r8, asr #ROW_SHIFT @ R8=0x0000FFFF & ((a0+b0)>>11)
-+        orr r8, r8, r9
-+        str r8, [r14, #0]
- 
--	@ End of row loop
--	add lr, lr, #2
--	subs r12, r12, #1
--	bne column_loop
--	beq the_end
--	
--empty_odd_column:
--	@ Compute DESCALE(tmp10 + tmp3, CONST_BITS+PASS1_BITS+3)
--	@ Compute DESCALE(tmp10 - tmp3, CONST_BITS+PASS1_BITS+3)
--	add r0, r0, #(1<<17)
--	mov r0, r0, asr #18
--	strh r0, [lr, #( 0*8)]
--	strh r0, [lr, #(14*8)]
--	
--	@ Compute DESCALE(tmp11 + tmp2, CONST_BITS+PASS1_BITS+3)
--	@ Compute DESCALE(tmp11 - tmp2, CONST_BITS+PASS1_BITS+3)
--	add r4, r4, #(1<<17)
--	mov r4, r4, asr #18
--	strh r4, [lr, #( 2*8)]
--	strh r4, [lr, #(12*8)]
--	
--	@ Compute DESCALE(tmp12 + tmp1, CONST_BITS+PASS1_BITS+3)
--	@ Compute DESCALE(tmp12 - tmp1, CONST_BITS+PASS1_BITS+3)
--	add r6, r6, #(1<<17)
--	mov r6, r6, asr #18
--	strh r6, [lr, #( 4*8)]
--	strh r6, [lr, #(10*8)]
--	
--	@ Compute DESCALE(tmp13 + tmp0, CONST_BITS+PASS1_BITS+3)
--	@ Compute DESCALE(tmp13 - tmp0, CONST_BITS+PASS1_BITS+3)
--	add r2, r2, #(1<<17)
--	mov r2, r2, asr #18
--	strh r2, [lr, #( 6*8)]
--	strh r2, [lr, #( 8*8)]
-+        add r8, r3, r5           @ R8=a2+b2
-+        add r9, r4, r7           @ R9=a3+b3
-+        and r9, r10, r9, lsl #ROW_SHIFT2MSHW @ R9=0xFFFF0000 & ((a3+b3)<<5)
-+        and r8, r11, r8, asr #ROW_SHIFT @ R8=0x0000FFFF & ((a2+b2)>>11)
-+        orr r8, r8, r9
-+        str r8, [r14, #4]
- 
--	@ End of row loop
--	add lr, lr, #2
--	subs r12, r12, #1
--	bne column_loop
--		
--the_end:	
--	@ The end....
--	add sp, sp, #4
--	ldmia   sp!, { r4 - r12, pc }   @ restore callee saved regs and return
-+        sub r8, r4, r7           @ R8=a3-b3
-+        sub r9, r3, r5           @ R9=a2-b2
-+        and r9, r10, r9, lsl #ROW_SHIFT2MSHW @ R9=0xFFFF0000 & ((a2-b2)<<5)
-+        and r8, r11, r8, asr #ROW_SHIFT @ R8=0x0000FFFF & ((a3-b3)>>11)
-+        orr r8, r8, r9
-+        str r8, [r14, #8]
- 
--const_array:
-+        sub r8, r2, r1           @ R8=a1-b1
-+        sub r9, r6, r0           @ R9=a0-b0
-+        and r9, r10, r9, lsl #ROW_SHIFT2MSHW @ R9=0xFFFF0000 & ((a0-b0)<<5)
-+        and r8, r11, r8, asr #ROW_SHIFT @ R8=0x0000FFFF & ((a1-b1)>>11)
-+        orr r8, r8, r9
-+        str r8, [r14, #12]
-+
-+        bal __end_row_loop
-+
-+__almost_empty_row:
-+        @@ the row was empty, except ROWr16[0], now, management of this special case
-+        @@ at this point, R0=block, R14=&block[n], R12=__const_ptr_, R1=ROWr32[0], R2=ROWr32[1],
-+        @@                R3=ROWr32[2], R4=ROWr32[3], R5=(temp), R6=ROWr16[0], R7=ROWr16[1],
-+        @@                R8=0xFFFF (temp), R9-R11 free
-+        mov r8, #0x10000         @ R8=0xFFFF (2 steps needed!) it saves a ldr call (because of delay run).
-+        sub r8, r8, #1           @ R8 is now ready.
-+        and r5, r8, r6, lsl #3   @ R5=R8 & (R6<<3)= (ROWr16[0]<<3) & 0xFFFF
-+        orr r5, r5, r5, lsl #16  @ R5=R5 | (R5<<16)
-+        str r5, [r14, #0]        @ R14[0]=ROWr32[0]=R5
-+        str r5, [r14, #4]        @ R14[4]=ROWr32[1]=R5
-+        str r5, [r14, #8]        @ R14[8]=ROWr32[2]=R5
-+        str r5, [r14, #12]       @ R14[12]=ROWr32[3]=R5
-+
-+__end_row_loop:
-+        @@ at this point, R0-R11 (free)
-+        @@     R12=__const_ptr_, R14=&block[n]
-+        ldr r0, [sp, #0]         @ R0=block
-+        teq r0, r14              @ compare current &block[8*n] to block, when block is reached, the loop is finished.
-+        sub r14, r14, #16
-+        bne __row_loop
-+
-+
-+
-+	@@ at this point, R0=block, R1-R11 (free)
-+	@@     R12=__const_ptr_, R14=&block[n]
-+	add r14, r0, #14        @ R14=&block[7], better start from the last col, and decrease the value until col=0, i.e. R14=block.
-+__col_loop:
-+
-+__b_evaluation2:
-+	@@ at this point, R0=block (temp),  R1-R11 (free)
-+	@@     R12=__const_ptr_, R14=&block[n]
-+	@@ proceed with b0-b3 first, followed by a0-a3
-+	@@ MUL16(b0, W1, col[8x1]);
-+	@@ MUL16(b1, W3, col[8x1]);
-+	@@ MUL16(b2, W5, col[8x1]);
-+	@@ MUL16(b3, W7, col[8x1]);
-+	@@ MAC16(b0, W3, col[8x3]);
-+	@@ MAC16(b1, -W7, col[8x3]);
-+	@@ MAC16(b2, -W1, col[8x3]);
-+	@@ MAC16(b3, -W5, col[8x3]);
-+	ldr r8, [r12, #offW1]    @ R8=W1
-+	ldrsh r7, [r14, #16]
-+	mul r0, r8, r7           @ R0=W1*ROWr16[1]=b0 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+	ldr r9, [r12, #offW3]    @ R9=W3
-+	ldr r10, [r12, #offW5]   @ R10=W5
-+	mul r1, r9, r7           @ R1=W3*ROWr16[1]=b1 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+	ldr r11, [r12, #offW7]   @ R11=W7
-+	mul r5, r10, r7          @ R5=W5*ROWr16[1]=b2 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+	ldrsh r2, [r14, #48]
-+	mul r7, r11, r7          @ R7=W7*ROWr16[1]=b3 (ROWr16[1] must be the second arg, to have the possibility to save 1 cycle)
-+	teq r2, #0               @ if 0, then avoid muls
-+	mlane r0, r9, r2, r0     @ R0+=W3*ROWr16[3]=b0 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+	rsbne r2, r2, #0         @ R2=-ROWr16[3]
-+	mlane r1, r11, r2, r1    @ R1-=W7*ROWr16[3]=b1 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+	mlane r5, r8, r2, r5     @ R5-=W1*ROWr16[3]=b2 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+	mlane r7, r10, r2, r7    @ R7-=W5*ROWr16[3]=b3 (ROWr16[3] must be the second arg, to have the possibility to save 1 cycle)
-+
-+	@@ at this point, R0=b0,  R1=b1, R2 (free), R3 (free), R4 (free),
-+	@@     R5=b2, R6 (free), R7=b3, R8=W1, R9=W3, R10=W5, R11=W7,
-+	@@     R12=__const_ptr_, R14=&block[n]
-+	@@ MAC16(b0, W5, col[5x8]);
-+	@@ MAC16(b2, W7, col[5x8]);
-+	@@ MAC16(b3, W3, col[5x8]);
-+	@@ MAC16(b1, -W1, col[5x8]);
-+	@@ MAC16(b0, W7, col[7x8]);
-+	@@ MAC16(b2, W3, col[7x8]);
-+	@@ MAC16(b3, -W1, col[7x8]);
-+	@@ MAC16(b1, -W5, col[7x8]);
-+	ldrsh r3, [r14, #80]     @ R3=COLr16[5x8]
-+	teq r3, #0               @ if 0 then avoid muls
-+	mlane r0, r10, r3, r0    @ R0+=W5*ROWr16[5x8]=b0
-+	mlane r5, r11, r3, r5    @ R5+=W7*ROWr16[5x8]=b2
-+	mlane r7, r9, r3, r7     @ R7+=W3*ROWr16[5x8]=b3
-+	rsbne r3, r3, #0         @ R3=-ROWr16[5x8]
-+	ldrsh r4, [r14, #112]    @ R4=COLr16[7x8]
-+	mlane r1, r8, r3, r1     @ R7-=W1*ROWr16[5x8]=b1
-+	@@ R3 is free now
-+	teq r4, #0               @ if 0 then avoid muls
-+	mlane r0, r11, r4, r0    @ R0+=W7*ROWr16[7x8]=b0
-+	mlane r5, r9, r4, r5     @ R5+=W3*ROWr16[7x8]=b2
-+	rsbne r4, r4, #0         @ R4=-ROWr16[7x8]
-+	mlane r7, r8, r4, r7     @ R7-=W1*ROWr16[7x8]=b3
-+	mlane r1, r10, r4, r1    @ R1-=W5*ROWr16[7x8]=b1
-+	@@ R4 is free now
-+__end_b_evaluation2:
-+	@@ at this point, R0=b0,  R1=b1, R2 (free), R3 (free), R4 (free),
-+	@@     R5=b2, R6 (free), R7=b3, R8 (free), R9 (free), R10 (free), R11 (free),
-+	@@     R12=__const_ptr_, R14=&block[n]
-+
-+__a_evaluation2:
-+	@@ a0 = (W4 * col[8x0]) + (1 << (COL_SHIFT - 1));
-+	@@ a1 = a0 + W6 * row[2];
-+	@@ a2 = a0 - W6 * row[2];
-+	@@ a3 = a0 - W2 * row[2];
-+	@@ a0 = a0 + W2 * row[2];
-+	ldrsh r6, [r14, #0]
-+	ldr r9, [r12, #offW4]    @ R9=W4
-+	mul r6, r9, r6           @ R6=W4*ROWr16[0]
-+	ldr r10, [r12, #offW6]   @ R10=W6
-+	ldrsh r4, [r14, #32]      @ R4=ROWr16[2] (a3 not defined yet)
-+	add r6, r6, #COL_SHIFTED_1 @ R6=W4*ROWr16[0] + 1<<(COL_SHIFT-1) (a0)
-+	mul r11, r10, r4         @ R11=W6*ROWr16[2]
-+	ldr r8, [r12, #offW2]    @ R8=W2
-+	add r2, r6, r11          @ R2=a0+W6*ROWr16[2] (a1)
-+	sub r3, r6, r11          @ R3=a0-W6*ROWr16[2] (a2)
-+	mul r11, r8, r4          @ R11=W2*ROWr16[2]
-+	sub r4, r6, r11          @ R4=a0-W2*ROWr16[2] (a3)
-+	add r6, r6, r11          @ R6=a0+W2*ROWr16[2] (a0)
-+
-+	@@ at this point, R0=b0,  R1=b1, R2=a1, R3=a2, R4=a3,
-+	@@     R5=b2, R6=a0, R7=b3, R8=W2, R9=W4, R10=W6, R11 (free),
-+	@@     R12=__const_ptr_, R14=&block[n]
-+	@@ a0 += W4*row[4]
-+	@@ a1 -= W4*row[4]
-+	@@ a2 -= W4*row[4]
-+	@@ a3 += W4*row[4]
-+	ldrsh r11, [r14, #64]     @ R11=ROWr16[4]
-+	teq r11, #0              @ if null avoid muls
-+	mulne r11, r9, r11       @ R11=W4*ROWr16[4]
-+	@@ R9 is free now
-+	addne r6, r6, r11        @ R6+=W4*ROWr16[4] (a0)
-+	subne r2, r2, r11        @ R2-=W4*ROWr16[4] (a1)
-+	subne r3, r3, r11        @ R3-=W4*ROWr16[4] (a2)
-+	ldrsh r9, [r14, #96]     @ R9=ROWr16[6]
-+	addne r4, r4, r11        @ R4+=W4*ROWr16[4] (a3)
-+	@@ W6 alone is no more useful, save W2*ROWr16[6] in it instead
-+	teq r9, #0               @ if null avoid muls
-+	mulne r11, r10, r9       @ R11=W6*ROWr16[6]
-+	addne r6, r6, r11        @ R6+=W6*ROWr16[6] (a0)
-+	mulne r10, r8, r9        @ R10=W2*ROWr16[6]
-+	@@ a0 += W6*row[6];
-+	@@ a3 -= W6*row[6];
-+	@@ a1 -= W2*row[6];
-+	@@ a2 += W2*row[6];
-+	subne r4, r4, r11        @ R4-=W6*ROWr16[6] (a3)
-+	subne r2, r2, r10        @ R2-=W2*ROWr16[6] (a1)
-+	addne r3, r3, r10        @ R3+=W2*ROWr16[6] (a2)
-+__end_a_evaluation2:
-+	@@ at this point, R0=b0,  R1=b1, R2=a1, R3=a2, R4=a3,
-+	@@     R5=b2, R6=a0, R7=b3, R8 (free), R9 (free), R10 (free), R11 (free),
-+	@@     R12=__const_ptr_, R14=&block[n]
-+	@@ col[0 ] = ((a0 + b0) >> COL_SHIFT);
-+	@@ col[8 ] = ((a1 + b1) >> COL_SHIFT);
-+	@@ col[16] = ((a2 + b2) >> COL_SHIFT);
-+	@@ col[24] = ((a3 + b3) >> COL_SHIFT);
-+	@@ col[32] = ((a3 - b3) >> COL_SHIFT);
-+	@@ col[40] = ((a2 - b2) >> COL_SHIFT);
-+	@@ col[48] = ((a1 - b1) >> COL_SHIFT);
-+	@@ col[56] = ((a0 - b0) >> COL_SHIFT);
-+	@@@@@ no optimisation here @@@@@
-+	add r8, r6, r0           @ R8=a0+b0
-+	add r9, r2, r1           @ R9=a1+b1
-+	mov r8, r8, asr #COL_SHIFT
-+	mov r9, r9, asr #COL_SHIFT
-+	strh r8, [r14, #0]
-+	strh r9, [r14, #16]
-+	add r8, r3, r5           @ R8=a2+b2
-+	add r9, r4, r7           @ R9=a3+b3
-+	mov r8, r8, asr #COL_SHIFT
-+	mov r9, r9, asr #COL_SHIFT
-+	strh r8, [r14, #32]
-+	strh r9, [r14, #48]
-+	sub r8, r4, r7           @ R8=a3-b3
-+	sub r9, r3, r5           @ R9=a2-b2
-+	mov r8, r8, asr #COL_SHIFT
-+	mov r9, r9, asr #COL_SHIFT
-+	strh r8, [r14, #64]
-+	strh r9, [r14, #80]
-+	sub r8, r2, r1           @ R8=a1-b1
-+	sub r9, r6, r0           @ R9=a0-b0
-+	mov r8, r8, asr #COL_SHIFT
-+	mov r9, r9, asr #COL_SHIFT
-+	strh r8, [r14, #96]
-+	strh r9, [r14, #112]
-+
-+__end_col_loop:
-+	@@ at this point, R0-R11 (free)
-+	@@     R12=__const_ptr_, R14=&block[n]
-+	ldr r0, [sp, #0]         @ R0=block
-+	teq r0, r14              @ compare current &block[n] to block, when block is reached, the loop is finished.
-+	sub r14, r14, #2
-+	bne __col_loop
-+
-+
-+
-+
-+__end_simple_idct_ARM:
-+        @@ restore registers to previous status!
-+        add sp, sp, #8 @@ the local variables!
-+        ldmfd sp!, {r4-r11, r15} @@ update PC with LR content.
-+
-+
-+
-+@@ kind of sub-function, here not to overload the common case.
-+__end_bef_a_evaluation:
-+	add r2, r6, r11          @ R2=a0+W6*ROWr16[2] (a1)
-+        mul r11, r8, r4          @ R11=W2*ROWr16[2]
-+        sub r4, r6, r11          @ R4=a0-W2*ROWr16[2] (a3)
-+        add r6, r6, r11          @ R6=a0+W2*ROWr16[2] (a0)
-+	bal __end_a_evaluation
-+
-+
-+__constant_ptr__:  @@ see #defines at the beginning of the source code for values.
- 	.align
--	.word FIX_0_298631336
--	.word FIX_0_541196100
--	.word FIX_0_765366865
--	.word FIX_1_175875602
--	.word FIX_1_501321110
--	.word FIX_2_053119869
--	.word FIX_3_072711026
--	.word FIX_M_0_390180644
--	.word FIX_M_0_899976223
--	.word FIX_M_1_847759065
--	.word FIX_M_1_961570560
--	.word FIX_M_2_562915447
--	.word FIX_0xFFFF
-+        .word   W1
-+        .word   W2
-+        .word   W3
-+        .word   W4
-+        .word   W5
-+        .word   W6
-+        .word   W7
-+        .word   MASK_MSHW
-+
-+
diff --git a/recipes/libxine/files/libxine-libvorbis.patch b/recipes/libxine/files/libxine-libvorbis.patch
deleted file mode 100644
index 81bcbd5..0000000
--- a/recipes/libxine/files/libxine-libvorbis.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
-Index: xine-lib-1.0/src/libvorbis/xine_decoder.c
-===================================================================
---- xine-lib-1.0.orig/src/libvorbis/xine_decoder.c	2005-02-20 18:21:57.924625900 +0100
-+++ xine-lib-1.0/src/libvorbis/xine_decoder.c	2005-02-20 18:52:02.016033646 +0100
-@@ -40,7 +40,7 @@
- #include "buffer.h"
- 
- #include <ogg/ogg.h>
--#include <vorbis/codec.h>
-+#include <tremor/ivorbiscodec.h>
- 
- #define MAX_NUM_SAMPLES 4096
- 
-@@ -216,7 +216,7 @@
-  
-   } else if (this->output_open) {
- 
--    float **pcm;
-+    int **pcm;
-     int samples;
- 
-     if(vorbis_synthesis(&this->vb,&this->op,1)==0) 
-@@ -245,9 +245,9 @@
- 	 interleave */
-       for(i=0;i<this->vi.channels;i++){
- 	ogg_int16_t *ptr=audio_buffer->mem+i;
--	float  *mono=pcm[i];
-+	int  *mono=pcm[i];
- 	for(j=0;j<bout;j++){
--	  int val=mono[j]*32767.f;
-+	  int val=mono[j]>>9;
- 	  /* might as well guard against clipping */
- 	  if(val>32767){
- 	    val=32767;
diff --git a/recipes/libxine/files/libxine-tremor-autoconf.patch b/recipes/libxine/files/libxine-tremor-autoconf.patch
deleted file mode 100644
index bbedc81..0000000
--- a/recipes/libxine/files/libxine-tremor-autoconf.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/m4/vorbis.m4~libxine-tremor-autoconf
-+++ xine-lib-1-rc7/m4/vorbis.m4
-@@ -18,7 +18,7 @@
-     VORBIS_LIBDIR="-L$vorbis_prefix/$XINE_LIBNAME"
-   fi
- 
--  VORBIS_LIBS="$VORBIS_LIBDIR -lvorbis -lm"
-+  VORBIS_LIBS="$VORBIS_LIBDIR -lvorbisidec -lm"
-   VORBISFILE_LIBS="-lvorbisfile"
-   VORBISENC_LIBS="-lvorbisenc"
- 
diff --git a/recipes/libxine/files/mpegvideo-static-inlinine.patch b/recipes/libxine/files/mpegvideo-static-inlinine.patch
deleted file mode 100644
index 81160b1..0000000
--- a/recipes/libxine/files/mpegvideo-static-inlinine.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/src/libffmpeg/libavcodec/mpegvideo.c~mpegvideo-static-inlininf.patch
-+++ xine-lib-1-rc7/src/libffmpeg/libavcodec/mpegvideo.c
-@@ -2757,7 +2757,7 @@
-     }
- }
- 
--inline int ff_h263_round_chroma(int x){
-+static inline int ff_h263_round_chroma(int x){
-     if (x >= 0)
-         return  (h263_chroma_roundtab[x & 0xf] + ((x >> 3) & ~1));
-     else {
diff --git a/recipes/libxine/libxine-1.1.0/configure.patch b/recipes/libxine/libxine-1.1.0/configure.patch
deleted file mode 100644
index a0078a7..0000000
--- a/recipes/libxine/libxine-1.1.0/configure.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
-Index: xine-lib-1.1.0/configure.ac
-===================================================================
---- xine-lib-1.1.0.orig/configure.ac	2005-07-21 21:10:10.000000000 +0000
-+++ xine-lib-1.1.0/configure.ac	2006-01-11 14:30:05.965735856 +0000
-@@ -715,6 +715,7 @@
- LIBS="$saved_libs"
- fi
- AM_CONDITIONAL(HAVE_XVMC, test x$ac_have_xvmc = "xyes")
-+AM_CONDITIONAL(HAVE_XV,   test x$ac_have_xvfoo = "xyes")
- AC_SUBST(XVMC_LIB)
- 
- 
-@@ -743,7 +744,7 @@
- AM_PATH_AALIB(1.4,, AC_MSG_RESULT([*** All of AALIB dependent parts will be disabled ***]))
- fi
- 
--AM_CONDITIONAL(HAVE_AA, test x$no_aalib != "xyes")
-+AM_CONDITIONAL(HAVE_AA,  [test x"$enable_aalib" = "xyes" && test x$no_aalib != "xyes"])
- 
- dnl ---------------------------------------------
- dnl Checks for Color AsCii Art library
-@@ -855,10 +856,7 @@
- dnl check for SDL
- dnl ---------------------------------------------
- 
--AM_PATH_SDL(1.1.5, 
--	AC_DEFINE(HAVE_SDL,1,[Define this if you have SDL library installed]),
--	[])
--AM_CONDITIONAL(HAVE_SDL, [test x"$no_sdl" != x"yes"])
-+AM_CONDITIONAL(HAVE_SDL, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -1013,48 +1011,22 @@
- dnl Ogg/Theora libs.
- dnl ---------------------------------------------
- 
--AM_PATH_OGG(
--           [ AM_PATH_THEORA(AC_DEFINE(HAVE_THEORA,1,[Define this if you have theora]),
--                           AC_MSG_RESULT([*** All OGG/THEORA dependent parts will be disabled ***]))
--          ],
--           AC_MSG_RESULT([*** All of OGG/Theora dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_THEORA, [test x"$no_ogg" != "xyes" -a x"$no_theora" != "xyes"])
-+AM_CONDITIONAL(HAVE_THEORA, 0)
- 
- 
- dnl ---------------------------------------------
- dnl Ogg/Speex libs.
- dnl ---------------------------------------------
- 
--PKG_CHECK_MODULES(SPEEX, speex, no_speex="no", no_speex="yes")
--
--if test "x$no_speex" = "xyes" ; then
--  AM_PATH_OGG([ AM_PATH_SPEEX(no_speex="no")])
--fi
--
--if test "x$no_speex" = "xyes" ; then
--  AC_MSG_RESULT([*** All OGG/SPEEX dependent parts will be disabled ***])
--else
--  AC_DEFINE(HAVE_SPEEX,1,[Define this if you have speex])
--
--  dnl Test whether Speex headers are eg. <speex.h> or <speex/speex.h>
--  dnl Speex headers were moved in mid-2004; 1.0.x has backwards compatible headers, 1.1.x does not
--  AC_CHECK_HEADER([speex/speex.h],
--                  AC_DEFINE(HAVE_SPEEX_SUBDIR, [1], [Define to 1 if speex headers are eg. <speex/speex.h>])
--  )
--
--  AC_SUBST(SPEEX_CFLAGS)
--  AC_SUBST(SPEEX_LIBS)
--fi
--AM_CONDITIONAL(HAVE_SPEEX, [test x"$no_ogg" != "xyes" -a x"$no_speex" != "xyes"])
-+AM_CONDITIONAL(HAVE_SPEEX, 0)
- 
- 
- dnl ---------------------------------------------
- dnl check for libFLAC
- dnl ---------------------------------------------
- 
--AM_PATH_LIBFLAC([],
--	AC_MSG_RESULT([*** All FLAC dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_FLAC, [test x"$no_libFLAC" != "xyes"])
-+AM_CONDITIONAL(HAVE_FLAC, 0)
-+
- 
- dnl ---------------------------------------------
- dnl External version of a52dec
-@@ -1120,13 +1092,8 @@
- dnl MNG libs.
- dnl ---------------------------------------------
- 
--AC_CHECK_LIB(mng, mng_initialize,
--	[ AC_CHECK_HEADER(libmng.h,
--		[ have_libmng=yes
--		  MNG_LIBS="-lmng" ], 
--		AC_MSG_RESULT([*** All libmng dependent parts will be disabled ***]))],
--	AC_MSG_RESULT([*** All libmng dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_LIBMNG, test x"$have_libmng" = "xyes")
-+MNG_LIBS=""
-+AM_CONDITIONAL(HAVE_LIBMNG, 0)
- AC_SUBST(MNG_LIBS)
- 
- dnl ---------------------------------------------
-@@ -1134,6 +1101,9 @@
- dnl ---------------------------------------------
- 
- AC_PATH_PROG(WAND_CONFIG, Wand-config, no)
-+if ( ! test -f "$WAND_CONFIG" ) && ( ! test -x "$WAND_CONFIG" ) ; then
-+  WAND_CONFIG="no"
-+fi
- if test "$WAND_CONFIG" = "no" ; then
-   AC_MSG_RESULT([*** All Imagemagick dependent parts will be disabled, Wand-config not found. ***])
- else
-@@ -1153,7 +1123,7 @@
- dnl freetype2 lib.
- dnl ---------------------------------------------
- 
--AM_PATH_FREETYPE2()
-+AM_CONDITIONAL(HAVE_FT2, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -1196,37 +1166,21 @@
- dnl ESD support
- dnl ---------------------------------------------
- 
--AM_PATH_ESD(0.2.8,
--        AC_DEFINE(HAVE_ESD,1,[Define this if you have ESD (libesd) installed]),
--        AC_MSG_RESULT(*** All of ESD dependent parts will be disabled ***))
--AM_CONDITIONAL(HAVE_ESD, test x"$no_esd" != "xyes")
-+AM_CONDITIONAL(HAVE_ESD, 0)
- 
- 
- dnl ---------------------------------------------
- dnl ARTS support
- dnl ---------------------------------------------
- 
--AM_PATH_ARTS(0.9.5,
--        AC_DEFINE(HAVE_ARTS,1,[Define this if you have ARTS (libartsc) installed]),
--        AC_MSG_RESULT(*** All of ARTS dependent parts will be disabled ***))
--AM_CONDITIONAL(HAVE_ARTS, test x"$no_arts" != "xyes")
-+AM_CONDITIONAL(HAVE_ARTS, 0)
- 
- 
- dnl ---------------------------------------------
- dnl gnome-vfs support
- dnl ---------------------------------------------
- 
--PKG_CHECK_MODULES(GNOME_VFS, gnome-vfs-2.0,
--                no_gnome_vfs=no,
--		no_gnome_vfs=yes)
--AC_SUBST(GNOME_VFS_CFLAGS)
--AC_SUBST(GNOME_VFS_LIBS)
--if test x"$no_gnome_vfs" != "xyes"; then
--AC_DEFINE(HAVE_GNOME_VFS,1,[Define this if you have gnome-vfs installed])
--else
--AC_MSG_RESULT(*** All of the gnome-vfs dependent parts will be disabled ***)
--fi
--AM_CONDITIONAL(HAVE_GNOME_VFS, test x"$no_gnome_vfs" != "xyes")
-+AM_CONDITIONAL(HAVE_GNOME_VFS, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -1403,75 +1357,7 @@
-     ],ISOC99_PRAGMA=no)
-     AC_MSG_RESULT($ISOC99_PRAGMA)
- 
--    dnl
--    dnl bitfield order
--    dnl
--    AC_MSG_CHECKING([bitfield ordering in structs])
--
--    dnl basic compile test for all platforms
--    AC_COMPILE_IFELSE([
--int main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
--  bf = { 1,1,1,1 };
--  switch (0) case 0: case sizeof(bf) == 1:;
--  return 0;
--}
--], [], AC_MSG_ERROR([compiler doesn't support bitfield structs]))
--
--
--    dnl run test
--    AC_RUN_IFELSE([
--int main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
--  bf = { 1,1,1,1 };
--  if (sizeof (bf) != 1) return 1;
--  return *((unsigned char*) &bf) != 0x4b; }
--], bf_lsbf=1, [
--  AC_RUN_IFELSE([
--int main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
-- bf = { 1,1,1,1 };
-- if (sizeof (bf) != 1) return 1;
-- return *((unsigned char*) &bf) != 0xa5; }
--], bf_lsbf=0, AC_MSG_ERROR([unsupported bitfield ordering]))
--  ],
--  [case "$host" in
--     *-*-mingw32* | *-*-cygwin*)
--       bf_lsbf=1
--     ;;
--     *)
--       AC_MSG_RESULT([unknown])
--       AC_MSG_ERROR([value of bitfield test isn't known for $host
--*********************************************************************
--Value of bitfield test can't be found out for cross-compiling and we
--don't know its value for host "$host".
--
--Because it's needed for VCD plugin, disable VCD by configure option
----disable-vcd or use external VCD library.
--*********************************************************************])
--  esac]
--)
--
--    if test "x$cross_compiling" = "xyes"; then
--      TEXT=" (guessed)"
--    else
--      TEXT=""
--    fi
--    if test "x$bf_lsbf" = "x1"; then
--     AC_MSG_RESULT(LSBF${TEXT})
--     AC_DEFINE(BITFIELD_LSBF, [], [compiler does lsbf in struct bitfields])
--    else
--     AC_MSG_RESULT(MSBF${TEXT})
--    fi
-+    AC_DEFINE(BITFIELD_LSBF, [], [compiler does lsbf in struct bitfields])
- 
-     AC_HAVE_HEADERS( errno.h fcntl.h \
- 		     stdbool.h  stdlib.h stdint.h stdio.h string.h \
diff --git a/recipes/libxine/libxine-1.1.0/cpuid.patch b/recipes/libxine/libxine-1.1.0/cpuid.patch
deleted file mode 100644
index deea915..0000000
--- a/recipes/libxine/libxine-1.1.0/cpuid.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/src/post/goom/mmx.h~cpu-1.0
-+++ xine-lib-1.1.0/src/post/goom/mmx.h
-@@ -98,6 +98,8 @@
- 		/* Get standard CPUID information, and
- 		       go to a specific vendor section */
- 		"movl $0, %%eax\n\t"
-+
-+		"pushl %%ebx\n\t"
- 		"cpuid\n\t"
- 
- 		/* Check for Intel */
diff --git a/recipes/libxine/libxine-1.1.0/dont-have-xv.patch b/recipes/libxine/libxine-1.1.0/dont-have-xv.patch
deleted file mode 100644
index 674e0e3..0000000
--- a/recipes/libxine/libxine-1.1.0/dont-have-xv.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff -urNd ../libxine-1.0-r1/xine-lib-1.0/configure.ac xine-lib-1.0/configure.ac
---- ../libxine-1.0-r1/xine-lib-1.0/configure.ac	2005-04-09 02:35:05 +01:00
-+++ xine-lib-1.0/configure.ac	2005-04-09 02:48:17 +01:00
-@@ -693,6 +693,12 @@
- AM_CONDITIONAL(HAVE_XVMC, test x$ac_have_xvmc = "xyes")
- AC_SUBST(XVMC_LIB)
- 
-+dnl --------------------------------------------
-+dnl Declare Xv as missing
-+dnl --------------------------------------------
-+
-+AM_CONDITIONAL(HAVE_XV, 0)
-+
- 
- dnl ---------------------------------------------
- dnl Checks for Xinerama extension
diff --git a/recipes/libxine/libxine-1.1.0/fix-syntax-xine-vorbis-decoder.patch b/recipes/libxine/libxine-1.1.0/fix-syntax-xine-vorbis-decoder.patch
deleted file mode 100644
index a191280..0000000
--- a/recipes/libxine/libxine-1.1.0/fix-syntax-xine-vorbis-decoder.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xine-lib-1.0/src/libvorbis/xine_decoder.c.old	2005-04-14 11:25:18 +01:00
-+++ xine-lib-1.0/src/libvorbis/xine_decoder.c	2005-04-14 11:26:14 +01:00
-@@ -219,7 +219,7 @@
-     int **pcm;
-     int samples;
- 
--    if(vorbis_synthesis(&this->vb,&this->op)==0) 
-+    if(vorbis_synthesis(&this->vb,&this->op,1)==0) 
-       vorbis_synthesis_blockin(&this->vd,&this->vb);
- 
-     if (buf->pts!=0)
diff --git a/recipes/libxine/libxine-1.1.0/gcc41.patch b/recipes/libxine/libxine-1.1.0/gcc41.patch
deleted file mode 100644
index f201a5e..0000000
--- a/recipes/libxine/libxine-1.1.0/gcc41.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xine-lib-1.1.0/src/libffmpeg/libavcodec/mpegvideo.h
-===================================================================
---- xine-lib-1.1.0.orig/src/libffmpeg/libavcodec/mpegvideo.h
-+++ xine-lib-1.1.0/src/libffmpeg/libavcodec/mpegvideo.h
-@@ -928,7 +928,7 @@ int ff_mpeg4_get_video_packet_prefix_len
- int ff_h263_resync(MpegEncContext *s);
- int ff_h263_get_gob_height(MpegEncContext *s);
- int ff_mpeg4_set_direct_mv(MpegEncContext *s, int mx, int my);
--int ff_h263_round_chroma(int x);
-+static int ff_h263_round_chroma(int x);
- void ff_h263_encode_motion(MpegEncContext * s, int val, int f_code);
- int ff_mpeg4_find_frame_end(ParseContext *pc, const uint8_t *buf, int buf_size);
- 
diff --git a/recipes/libxine/libxine-1.1.0/libxine-arm-configure.patch b/recipes/libxine/libxine-1.1.0/libxine-arm-configure.patch
deleted file mode 100644
index ab5efe9..0000000
--- a/recipes/libxine/libxine-1.1.0/libxine-arm-configure.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/configure.ac~libxine-arm-configure
-+++ xine-lib-1.1.0/configure.ac
-@@ -2052,8 +2052,8 @@
-     AC_DEFINE_UNQUOTED(FPM_DEFAULT,,[Define to select libmad fixed point arithmetic implementation])
-     ;;
- 
--  armv4l-*-linux*)
--    CFLAGS="-O2 -fsigned-char -ffast-math -mcpu=strongarm1100 -fomit-frame-pointer -fthread-jumps -fregmove $CFLAGS"
-+  arm-*-linux*)
-+    CFLAGS="-O2 -fsigned-char -ffast-math -march=armv4 -mtune=xscale -fomit-frame-pointer -fthread-jumps -fregmove $CFLAGS"
-     dnl    CFLAGS="-O1 -fforce-mem -fforce-addr -fthread-jumps -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations -fregmove -fschedule-insns2 $INLINE_FUNCTIONS -fsigned-char -fomit-frame-pointer -march=armv4 -mtune=strongarm $CFLAGS"
-     DEBUG_CFLAGS="-O2 $DEBUG_CFLAGS"
-     AC_DEFINE_UNQUOTED(FPM_ARM,,[Define to select libmad fixed point arithmetic implementation])
diff --git a/recipes/libxine/libxine-1.1.0/libxine-cut-memusage.patch b/recipes/libxine/libxine-1.1.0/libxine-cut-memusage.patch
deleted file mode 100644
index 3580a58..0000000
--- a/recipes/libxine/libxine-1.1.0/libxine-cut-memusage.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/src/xine-engine/audio_out.c~libxine-cut-memusage
-+++ xine-lib-1.1.0/src/xine-engine/audio_out.c
-@@ -95,10 +95,10 @@
- #include "metronom.h"
- 
- 
--#define NUM_AUDIO_BUFFERS       32
--#define AUDIO_BUF_SIZE       32768
-+#define NUM_AUDIO_BUFFERS       16
-+#define AUDIO_BUF_SIZE        8192
- 
--#define ZERO_BUF_SIZE         5000
-+#define ZERO_BUF_SIZE         2048
- 
- /* By adding gap errors (difference between reported and expected
-  * sound card clock) into metronom's vpts_offset we can use its 
---- xine-lib-1.1.0/src/xine-engine/video_decoder.c~libxine-cut-memusage
-+++ xine-lib-1.1.0/src/xine-engine/video_decoder.c
-@@ -484,7 +484,7 @@
-   
-     num_buffers = stream->xine->config->register_num (stream->xine->config,
-                                                       "engine.buffers.video_num_buffers",
--                                                      500,
-+                                                      250,
-                                                       _("number of video buffers"),
- 						      _("The number of video buffers (each is 8k in size) "
- 						        "xine uses in its internal queue. Higher values "
-@@ -492,7 +492,7 @@
- 							"also increased latency and memory consumption."),
-                                                       20, NULL, NULL);
-   
--    stream->video_fifo = _x_fifo_buffer_new (num_buffers, 8192);
-+    stream->video_fifo = _x_fifo_buffer_new (num_buffers, 4096);
-     stream->spu_track_map_entries = 0;
-   
-     pthread_attr_init(&pth_attrs);
---- xine-lib-1.1.0/src/xine-engine/video_overlay.h~libxine-cut-memusage
-+++ xine-lib-1.1.0/src/xine-engine/video_overlay.h
-@@ -36,7 +36,7 @@
- #define CLUT_Y_CR_CB_INIT(_y,_cr,_cb)	{ (_cb), (_cr), (_y) }
- #endif
- 
--#define MAX_OBJECTS   50
-+#define MAX_OBJECTS    5
- #define MAX_EVENTS    50
- #define MAX_SHOWING   16
- 
---- xine-lib-1.1.0/src/xine-engine/audio_decoder.c~libxine-cut-memusage
-+++ xine-lib-1.1.0/src/xine-engine/audio_decoder.c
-@@ -467,7 +467,7 @@
-     
-     num_buffers = stream->xine->config->register_num (stream->xine->config,
-                                                       "engine.buffers.audio_num_buffers",
--                                                      230,
-+                                                      100,
-                                                       _("number of audio buffers"),
- 						      _("The number of audio buffers (each is 8k in size) "
- 						        "xine uses in its internal queue. Higher values "
diff --git a/recipes/libxine/libxine-1.1.0/libxine-ffmpeg-enable-arm.patch b/recipes/libxine/libxine-1.1.0/libxine-ffmpeg-enable-arm.patch
deleted file mode 100644
index 0a13e2f..0000000
--- a/recipes/libxine/libxine-1.1.0/libxine-ffmpeg-enable-arm.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/src/libffmpeg/libavcodec/armv4l/Makefile.am~libxine-ffmpeg-enable-arm
-+++ xine-lib-1.1.0/src/libffmpeg/libavcodec/armv4l/Makefile.am
-@@ -9,9 +9,8 @@
- libavcodec_armv4l_dummy =  libavcodec_armv4l_dummy.c
- EXTRA_DIST =  $(libavcodec_armv4l_src) $(libavcodec_armv4l_dummy)
- 
--#if HAVE_ARMV4L
--#armv4l_modules = $(libavcodec_armv4l_src)
--#endif
--armv4l_modules = 
-+if HAVE_ARMV4L
-+armv4l_modules = $(libavcodec_armv4l_src)
-+endif
- 
- libavcodec_armv4l_la_SOURCES = $(armv4l_modules) $(libavcodec_armv4l_dummy)
diff --git a/recipes/libxine/libxine-1.1.0/libxine-tremor-autoconf.patch b/recipes/libxine/libxine-1.1.0/libxine-tremor-autoconf.patch
deleted file mode 100644
index 097f72c..0000000
--- a/recipes/libxine/libxine-1.1.0/libxine-tremor-autoconf.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/m4/vorbis.m4~libxine-tremor-autoconf
-+++ xine-lib-1.1.0/m4/vorbis.m4
-@@ -18,7 +18,7 @@
-     VORBIS_LIBDIR="-L$vorbis_prefix/$XINE_LIBNAME"
-   fi
- 
--  VORBIS_LIBS="$VORBIS_LIBDIR -lvorbis -lm"
-+  VORBIS_LIBS="$VORBIS_LIBDIR -lvorbisidec -lm"
-   VORBISFILE_LIBS="-lvorbisfile"
-   VORBISENC_LIBS="-lvorbisenc"
- 
diff --git a/recipes/libxine/libxine-1.1.0/mpegvideo-static-inlinine.patch b/recipes/libxine/libxine-1.1.0/mpegvideo-static-inlinine.patch
deleted file mode 100644
index 0f9b3c2..0000000
--- a/recipes/libxine/libxine-1.1.0/mpegvideo-static-inlinine.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/src/libffmpeg/libavcodec/mpegvideo.c~mpegvideo-static-inlinine
-+++ xine-lib-1.1.0/src/libffmpeg/libavcodec/mpegvideo.c
-@@ -3122,7 +3122,7 @@
-     }
- }
- 
--inline int ff_h263_round_chroma(int x){
-+static inline int ff_h263_round_chroma(int x){
-     if (x >= 0)
-         return  (h263_chroma_roundtab[x & 0xf] + ((x >> 3) & ~1));
-     else {
diff --git a/recipes/libxine/libxine-1.1.0/no-caca.patch b/recipes/libxine/libxine-1.1.0/no-caca.patch
deleted file mode 100644
index dc86169..0000000
--- a/recipes/libxine/libxine-1.1.0/no-caca.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/configure.ac~no-caca
-+++ xine-lib-1.1.0/configure.ac
-@@ -749,8 +749,9 @@
- dnl Checks for Color AsCii Art library
- dnl ---------------------------------------------
- 
--AM_PATH_CACA(0.3,, AC_MSG_RESULT([*** All CACA-dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_CACA, test x$no_caca != "xyes")
-+dnl AM_PATH_CACA(0.3,, AC_MSG_RESULT([*** All CACA-dependent parts will be disabled ***]))
-+AM_CONDITIONAL(HAVE_CACA, 0)
-+
- 
- 
- dnl ---------------------------------------------
diff --git a/recipes/libxine/libxine-1.1.0/tremor.patch b/recipes/libxine/libxine-1.1.0/tremor.patch
deleted file mode 100644
index 8ea785d..0000000
--- a/recipes/libxine/libxine-1.1.0/tremor.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/src/demuxers/demux_ogg.c~demuxogg
-+++ xine-lib-1.1.0/src/demuxers/demux_ogg.c
-@@ -40,7 +40,7 @@
- #include <inttypes.h>
- 
- #include <ogg/ogg.h>
--#include <vorbis/codec.h>
-+#include <tremor/ivorbiscodec.h>
- 
- #ifdef HAVE_SPEEX
- #ifdef HAVE_SPEEX_SUBDIR
---- xine-lib-1.1.0/src/demuxers/Makefile.am~demuxogg
-+++ xine-lib-1.1.0/src/demuxers/Makefile.am
-@@ -1,6 +1,6 @@
- include $(top_srcdir)/misc/Makefile.common
- 
--AM_CFLAGS = $(THEORA_CFLAGS) $(OGG_CFLAGS) $(SPEEX_CFLAGS) $(LIBMODPLUG_CFLAGS)
-+AM_CFLAGS = $(THEORA_CFLAGS) $(OGG_CFLAGS) $(VORBIS_CFLAGS) $(SPEEX_CFLAGS) $(LIBMODPLUG_CFLAGS)
- 
- libdir = $(XINE_PLUGINDIR)
- 
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1.1.0/src/libvorbis/xine_decoder.c~libxine-libvorbis
-+++ xine-lib-1.1.0/src/libvorbis/xine_decoder.c
-@@ -40,7 +40,7 @@
- #include "buffer.h"
- 
- #include <ogg/ogg.h>
--#include <vorbis/codec.h>
-+#include <tremor/ivorbiscodec.h>
- 
- #define MAX_NUM_SAMPLES 4096
- 
-@@ -217,7 +217,7 @@
-  
-   } else if (this->output_open) {
- 
--    float **pcm;
-+    int **pcm;
-     int samples;
- 
-     if(vorbis_synthesis(&this->vb,&this->op)==0) 
-@@ -246,9 +246,9 @@
- 	 interleave */
-       for(i=0;i<this->vi.channels;i++){
- 	ogg_int16_t *ptr=audio_buffer->mem+i;
--	float  *mono=pcm[i];
-+	int  *mono=pcm[i];
- 	for(j=0;j<bout;j++){
--	  int val=mono[j]*32767.f;
-+	  int val=mono[j]>>9;
- 	  /* might as well guard against clipping */
- 	  if(val>32767){
- 	    val=32767;
diff --git a/recipes/libxine/libxine-1.1.16/iconv.patch b/recipes/libxine/libxine-1.1.16/iconv.patch
new file mode 100644
index 0000000..d3c7cc8
--- /dev/null
+++ b/recipes/libxine/libxine-1.1.16/iconv.patch
@@ -0,0 +1,12 @@
+Index: xine-lib-1.1.15/misc/libxine.pc.in
+===================================================================
+--- xine-lib-1.1.15.orig/misc/libxine.pc.in	2008-09-19 00:50:07.144738536 +0200
++++ xine-lib-1.1.15/misc/libxine.pc.in	2008-09-19 00:50:17.962908808 +0200
+@@ -23,6 +23,6 @@
+ Version: @XINE_MAJOR@.@XINE_MINOR@.@XINE_SUB@@XINE_PATCH@
+ Requires:
+ Libs: -L${libdir} -lxine
+-Libs.private: @ZLIB_LIBS@ @NET_LIBS@ @PTHREAD_LIBS@ @LIBICONV@ @RT_LIBS@
++Libs.private: @ZLIB_LIBS@ @NET_LIBS@ @PTHREAD_LIBS@ @LTLIBICONV@ @RT_LIBS@
+ Cflags: -I${includedir}
+ Cflags.private: @PTHREAD_CFLAGS@
diff --git a/recipes/libxine/libxine-1.1.16/libavcodec.patch b/recipes/libxine/libxine-1.1.16/libavcodec.patch
new file mode 100644
index 0000000..c4ef887
--- /dev/null
+++ b/recipes/libxine/libxine-1.1.16/libavcodec.patch
@@ -0,0 +1,26 @@
+Index: xine-lib-1.1.16/src/combined/ffmpeg/ffmpeg_decoder.h
+===================================================================
+--- xine-lib-1.1.16.orig/src/combined/ffmpeg/ffmpeg_decoder.h	2009-03-25 00:27:52.177883234 +0100
++++ xine-lib-1.1.16/src/combined/ffmpeg/ffmpeg_decoder.h	2009-03-25 00:27:58.048708749 +0100
+@@ -26,8 +26,6 @@
+ #endif
+ 
+ #ifdef HAVE_FFMPEG_AVUTIL_H
+-#  include <avcodec.h>
+-#elif defined HAVE_FFMPEG
+ #  include <libavcodec/avcodec.h>
+ #else
+ #  include "../../libffmpeg/libavcodec/avcodec.h"
+Index: xine-lib-1.1.16/src/combined/ffmpeg/ff_dvaudio_decoder.c
+===================================================================
+--- xine-lib-1.1.16.orig/src/combined/ffmpeg/ff_dvaudio_decoder.c	2009-03-25 00:28:05.839130673 +0100
++++ xine-lib-1.1.16/src/combined/ffmpeg/ff_dvaudio_decoder.c	2009-03-25 00:28:28.411467638 +0100
+@@ -53,8 +53,6 @@
+ #endif
+ 
+ #ifdef HAVE_FFMPEG_AVUTIL_H
+-#  include <avcodec.h>
+-#elif defined HAVE_FFMPEG
+ #  include <libavcodec/avcodec.h>
+ #else
+ #  include "../../libffmpeg/libavcodec/avcodec.h"
diff --git a/recipes/libxine/libxine-1.1.16/libpostproc.patch b/recipes/libxine/libxine-1.1.16/libpostproc.patch
new file mode 100644
index 0000000..89f8a0c
--- /dev/null
+++ b/recipes/libxine/libxine-1.1.16/libpostproc.patch
@@ -0,0 +1,34 @@
+Index: xine-lib-1.1.16/src/post/planar/pp.c
+===================================================================
+--- xine-lib-1.1.16.orig/src/post/planar/pp.c	2009-03-25 00:11:21.375059193 +0100
++++ xine-lib-1.1.16/src/post/planar/pp.c	2009-03-25 00:11:51.259320837 +0100
+@@ -29,11 +29,7 @@
+ #include "xineutils.h"
+ #include <pthread.h>
+ 
+-#ifdef HAVE_FFMPEG_AVUTIL_H
+-#  include <postprocess.h>
+-#else
+-#  include <libpostproc/postprocess.h>
+-#endif
++#include <libpostproc/postprocess.h>
+ 
+ #define PP_STRING_SIZE 256 /* size of pp mode string (including all options) */
+ 
+Index: xine-lib-1.1.16/src/combined/ffmpeg/ff_video_decoder.c
+===================================================================
+--- xine-lib-1.1.16.orig/src/combined/ffmpeg/ff_video_decoder.c	2009-03-25 00:20:01.437924936 +0100
++++ xine-lib-1.1.16/src/combined/ffmpeg/ff_video_decoder.c	2009-03-25 00:20:16.771556770 +0100
+@@ -45,11 +45,7 @@
+ #include "ffmpeg_decoder.h"
+ #include "ff_mpeg_parser.h"
+ 
+-#ifdef HAVE_FFMPEG_AVUTIL_H
+-#  include <postprocess.h>
+-#else
+-#  include <libpostproc/postprocess.h>
+-#endif
++#include <libpostproc/postprocess.h>
+ 
+ #define VIDEOBUFSIZE        (128*1024)
+ #define SLICE_BUFFER_SIZE   (1194*1024)
diff --git a/recipes/libxine/libxine-1.1.16/libxine-arm-configure.patch b/recipes/libxine/libxine-1.1.16/libxine-arm-configure.patch
new file mode 100644
index 0000000..6fc3bc1
--- /dev/null
+++ b/recipes/libxine/libxine-1.1.16/libxine-arm-configure.patch
@@ -0,0 +1,18 @@
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+Index: xine-lib-1.1.12/configure.ac
+===================================================================
+--- xine-lib-1.1.12.orig/configure.ac	2008-04-11 16:17:50.000000000 +0200
++++ xine-lib-1.1.12/configure.ac	2008-05-08 00:01:27.000000000 +0200
+@@ -2304,7 +2304,7 @@
+   alphaev56-* | alpha* | ia64-* | hppa*-linux-*)
+     AC_DEFINE_UNQUOTED(FPM_64BIT,,[Define to select libmad fixed point arithmetic implementation])
+     ;;
+-  armv4l-*-linux*)
++  armv-*-linux*)
+     AC_DEFINE_UNQUOTED(FPM_ARM,,[Define to select libmad fixed point arithmetic implementation])
+     enable_armv4l="yes"
+     ;;
diff --git a/recipes/libxine/libxine-fb/configure-1.0.patch b/recipes/libxine/libxine-fb/configure-1.0.patch
deleted file mode 100644
index 015f2fc..0000000
--- a/recipes/libxine/libxine-fb/configure-1.0.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-Index: xine-lib-1.0/configure.ac
-===================================================================
---- xine-lib-1.0.orig/configure.ac	2004-12-25 18:40:24.000000000 +0100
-+++ xine-lib-1.0/configure.ac	2005-02-16 22:57:07.926566529 +0100
-@@ -691,6 +691,7 @@
- LIBS="$saved_libs"
- fi
- AM_CONDITIONAL(HAVE_XVMC, test x$ac_have_xvmc = "xyes")
-+AM_CONDITIONAL(HAVE_XV,   test x$ac_have_xvfoo = "xyes")
- AC_SUBST(XVMC_LIB)
- 
- 
-@@ -711,7 +712,7 @@
- dnl ---------------------------------------------
- 
- AM_PATH_AALIB(1.4,, AC_MSG_RESULT([*** All of AALIB dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_AA, test x$no_aalib != "xyes")
-+AM_CONDITIONAL(HAVE_AA,  [test x"$enable_aalib" = "xyes" && test x$no_aalib != "xyes"])
- 
- 
- dnl ---------------------------------------------
-@@ -824,10 +825,7 @@
- dnl check for SDL
- dnl ---------------------------------------------
- 
--AM_PATH_SDL(1.1.5, 
--	AC_DEFINE(HAVE_SDL,1,[Define this if you have SDL library installed]),
--	[])
--AM_CONDITIONAL(HAVE_SDL, [test x"$no_sdl" != x"yes"])
-+AM_CONDITIONAL(HAVE_SDL, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -982,61 +980,29 @@
- dnl Ogg/Theora libs.
- dnl ---------------------------------------------
- 
--AM_PATH_OGG(
--           [ AM_PATH_THEORA(AC_DEFINE(HAVE_THEORA,1,[Define this if you have theora]),
--                           AC_MSG_RESULT([*** All OGG/THEORA dependent parts will be disabled ***]))
--          ],
--           AC_MSG_RESULT([*** All of OGG/Theora dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_THEORA, [test x"$no_ogg" != "xyes" -a x"$no_theora" != "xyes"])
-+AM_CONDITIONAL(HAVE_THEORA, 0)
- 
- 
- dnl ---------------------------------------------
- dnl Ogg/Speex libs.
- dnl ---------------------------------------------
- 
--PKG_CHECK_MODULES(SPEEX, speex, no_speex="no", no_speex="yes")
--
--if test "x$no_speex" = "xyes" ; then
--  AM_PATH_OGG([ AM_PATH_SPEEX(no_speex="no")])
--fi
--
--if test "x$no_speex" = "xyes" ; then
--  AC_MSG_RESULT([*** All OGG/SPEEX dependent parts will be disabled ***])
--else
--  AC_DEFINE(HAVE_SPEEX,1,[Define this if you have speex])
--
--  dnl Test whether Speex headers are eg. <speex.h> or <speex/speex.h>
--  dnl Speex headers were moved in mid-2004; 1.0.x has backwards compatible headers, 1.1.x does not
--  AC_CHECK_HEADER([speex/speex.h],
--                  AC_DEFINE(HAVE_SPEEX_SUBDIR, [1], [Define to 1 if speex headers are eg. <speex/speex.h>])
--  )
--
--  AC_SUBST(SPEEX_CFLAGS)
--  AC_SUBST(SPEEX_LIBS)
--fi
--AM_CONDITIONAL(HAVE_SPEEX, [test x"$no_ogg" != "xyes" -a x"$no_speex" != "xyes"])
-+AM_CONDITIONAL(HAVE_SPEEX, 0)
- 
- 
- dnl ---------------------------------------------
- dnl check for libFLAC
- dnl ---------------------------------------------
- 
--AM_PATH_LIBFLAC([],
--	AC_MSG_RESULT([*** All FLAC dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_FLAC, [test x"$no_libFLAC" != "xyes"])
-+AM_CONDITIONAL(HAVE_FLAC, 0)
- 
- 
- dnl ---------------------------------------------
- dnl MNG libs.
- dnl ---------------------------------------------
- 
--AC_CHECK_LIB(mng, mng_initialize,
--	[ AC_CHECK_HEADER(libmng.h,
--		[ have_libmng=yes
--		  MNG_LIBS="-lmng" ], 
--		AC_MSG_RESULT([*** All libmng dependent parts will be disabled ***]))],
--	AC_MSG_RESULT([*** All libmng dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_LIBMNG, test x"$have_libmng" = "xyes")
-+MNG_LIBS=""
-+AM_CONDITIONAL(HAVE_LIBMNG, 0)
- AC_SUBST(MNG_LIBS)
- 
- 
-@@ -1066,7 +1032,7 @@
- dnl freetype2 lib.
- dnl ---------------------------------------------
- 
--AM_PATH_FREETYPE2()
-+AM_CONDITIONAL(HAVE_FT2, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -1109,37 +1075,21 @@
- dnl ESD support
- dnl ---------------------------------------------
- 
--AM_PATH_ESD(0.2.8,
--        AC_DEFINE(HAVE_ESD,1,[Define this if you have ESD (libesd) installed]),
--        AC_MSG_RESULT(*** All of ESD dependent parts will be disabled ***))
--AM_CONDITIONAL(HAVE_ESD, test x"$no_esd" != "xyes")
-+AM_CONDITIONAL(HAVE_ESD, 0)
- 
- 
- dnl ---------------------------------------------
- dnl ARTS support
- dnl ---------------------------------------------
- 
--AM_PATH_ARTS(0.9.5,
--        AC_DEFINE(HAVE_ARTS,1,[Define this if you have ARTS (libartsc) installed]),
--        AC_MSG_RESULT(*** All of ARTS dependent parts will be disabled ***))
--AM_CONDITIONAL(HAVE_ARTS, test x"$no_arts" != "xyes")
-+AM_CONDITIONAL(HAVE_ARTS, 0)
- 
- 
- dnl ---------------------------------------------
- dnl gnome-vfs support
- dnl ---------------------------------------------
- 
--PKG_CHECK_MODULES(GNOME_VFS, gnome-vfs-2.0,
--                no_gnome_vfs=no,
--		no_gnome_vfs=yes)
--AC_SUBST(GNOME_VFS_CFLAGS)
--AC_SUBST(GNOME_VFS_LIBS)
--if test x"$no_gnome_vfs" != "xyes"; then
--AC_DEFINE(HAVE_GNOME_VFS,1,[Define this if you have gnome-vfs installed])
--else
--AC_MSG_RESULT(*** All of the gnome-vfs dependent parts will be disabled ***)
--fi
--AM_CONDITIONAL(HAVE_GNOME_VFS, test x"$no_gnome_vfs" != "xyes")
-+AM_CONDITIONAL(HAVE_GNOME_VFS, 0)
- 
- 
- dnl ---------------------------------------------
-@@ -1316,35 +1266,7 @@
-     ],ISOC99_PRAGMA=no)
-     AC_MSG_RESULT($ISOC99_PRAGMA)
- 
--    dnl bitfield order
--    AC_MSG_CHECKING(bitfield ordering in structs)
--    AC_TRY_RUN([
--int
-- main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
--  bf = { 1,1,1,1 };
--  if (sizeof (bf) != 1) return 1;
--  return *((unsigned char*) &bf) != 0x4b; }
--], bf_lsbf=1, AC_TRY_RUN([ 
--int
--main() {
--  struct { char bit_0:1, bit_12:2, bit_345:3, bit_67:2; }
--#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
--  __attribute__((packed))
--#endif
--  bf = { 1,1,1,1 };
--  if (sizeof (bf) != 1) return 1;
--  return *((unsigned char*) &bf) != 0xa5; }
--], bf_lsbf=0, AC_MSG_ERROR([unsupported bitfield ordering])))
--    if test "x$bf_lsbf" = "x1"; then
--     AC_MSG_RESULT(LSBF)
--     AC_DEFINE(BITFIELD_LSBF, [], [compiler does lsbf in struct bitfields])
--    else
--     AC_MSG_RESULT(MSBF)
--    fi
-+    AC_DEFINE(BITFIELD_LSBF, [], [compiler does lsbf in struct bitfields])
- 
-     AC_HAVE_HEADERS( errno.h fcntl.h \
- 		     stdbool.h  stdlib.h stdint.h stdio.h string.h \
diff --git a/recipes/libxine/libxine-fb/demuxogg.patch b/recipes/libxine/libxine-fb/demuxogg.patch
deleted file mode 100644
index 55f239c..0000000
--- a/recipes/libxine/libxine-fb/demuxogg.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/src/demuxers/demux_ogg.c~demuxogg
-+++ xine-lib-1-rc7/src/demuxers/demux_ogg.c
-@@ -40,7 +40,7 @@
- #include <inttypes.h>
- 
- #include <ogg/ogg.h>
--#include <vorbis/codec.h>
-+#include <tremor/ivorbiscodec.h>
- 
- #ifdef HAVE_SPEEX
- #ifdef HAVE_SPEEX_SUBDIR
---- xine-lib-1-rc7/src/demuxers/Makefile.am~demuxogg
-+++ xine-lib-1-rc7/src/demuxers/Makefile.am
-@@ -1,6 +1,6 @@
- include $(top_srcdir)/misc/Makefile.common
- 
--AM_CFLAGS = $(THEORA_CFLAGS) $(OGG_CFLAGS) $(SPEEX_CFLAGS) $(LIBMODPLUG_CFLAGS)
-+AM_CFLAGS = $(THEORA_CFLAGS) $(OGG_CFLAGS) $(VORBIS_CFLAGS) $(SPEEX_CFLAGS) $(LIBMODPLUG_CFLAGS)
- 
- libdir = $(XINE_PLUGINDIR)
- 
diff --git a/recipes/libxine/libxine-fb/fix-syntax.patch b/recipes/libxine/libxine-fb/fix-syntax.patch
deleted file mode 100644
index b129dec..0000000
--- a/recipes/libxine/libxine-fb/fix-syntax.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/src/libvorbis/xine_decoder.c~fix-syntax
-+++ xine-lib-1-rc7/src/libvorbis/xine_decoder.c
-@@ -218,7 +218,7 @@
-     float **pcm;
-     int samples;
- 
--    if(vorbis_synthesis(&this->vb,&this->op)==0) 
-+    if(vorbis_synthesis(&this->vb,&this->op,1)==0) 
-       vorbis_synthesis_blockin(&this->vd,&this->vb);
- 
-     if (buf->pts!=0)
diff --git a/recipes/libxine/libxine-fb/libxine-arm-configure.patch b/recipes/libxine/libxine-fb/libxine-arm-configure.patch
deleted file mode 100644
index fa80ea6..0000000
--- a/recipes/libxine/libxine-fb/libxine-arm-configure.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- xine-lib-1-rc7/configure.ac~libxine-arm-configure.patch
-+++ xine-lib-1-rc7/configure.ac
-@@ -1810,8 +1810,8 @@
-     AC_DEFINE_UNQUOTED(FPM_DEFAULT,,[Define to select libmad fixed point arithmetic implementation])
-     ;;
- 
--  armv4l-*-linux*)
--    CFLAGS="-O2 -fsigned-char -ffast-math -mcpu=strongarm1100 -fomit-frame-pointer -fthread-jumps -fregmove $CFLAGS"
-+  arm-*-linux*)
-+    CFLAGS="-O2 -fsigned-char -ffast-math -march=armv4 -mtune=xscale -fomit-frame-pointer -fthread-jumps -fregmove $CFLAGS"
-     dnl    CFLAGS="-O1 -fforce-mem -fforce-addr -fthread-jumps -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations -fregmove -fschedule-insns2 -finline-functions -fsigned-char -fomit-frame-pointer -march=armv4 -mtune=strongarm $CFLAGS"
-     DEBUG_CFLAGS="-O2 $DEBUG_CFLAGS"
-     AC_DEFINE_UNQUOTED(FPM_ARM,,[Define to select libmad fixed point arithmetic implementation])
diff --git a/recipes/libxine/libxine-fb/no-caca.patch b/recipes/libxine/libxine-fb/no-caca.patch
deleted file mode 100644
index 978c4fc..0000000
--- a/recipes/libxine/libxine-fb/no-caca.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: xine-lib-1.0/configure.ac
-===================================================================
---- xine-lib-1.0.orig/configure.ac	2005-03-06 16:50:09.019575452 +0100
-+++ xine-lib-1.0/configure.ac	2005-03-06 17:07:55.605266498 +0100
-@@ -719,8 +719,9 @@
- dnl Checks for Color AsCii Art library
- dnl ---------------------------------------------
- 
--AM_PATH_CACA(0.3,, AC_MSG_RESULT([*** All CACA-dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_CACA, test x$no_caca != "xyes")
-+dnl AM_PATH_CACA(0.3,, AC_MSG_RESULT([*** All CACA-dependent parts will be disabled ***]))
-+AM_CONDITIONAL(HAVE_CACA, 0)
-+
- 
- 
- dnl ---------------------------------------------
diff --git a/recipes/libxine/libxine-fb_1.0.bb b/recipes/libxine/libxine-fb_1.0.bb
deleted file mode 100644
index 87818d5..0000000
--- a/recipes/libxine/libxine-fb_1.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-DESCRIPTION = "libxine is a multimedia library with support for many common audio and video formats \
-This version is configured for the usage with framebuffer based environments"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPL"
-DEPENDS = "zlib libogg tremor libmodplug libpng \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-PROVIDES = "virtual/libxine"
-PR = "r2"
-
-inherit autotools pkgconfig gettext
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/xine/xine-lib-${PV}.tar.gz \
-	file://cpu-${PV}.patch;patch=1 \
-	file://configure-${PV}.patch;patch=1 \
-	file://demuxogg.patch;patch=1 \
-	file://fix-syntax.patch;patch=1 \
-	file://libxine-cut-memusage.patch;patch=1 \
-	file://libxine-ffmpeg-enable-arm.patch;patch=1 \
-	file://libxine-libvorbis.patch;patch=1 \
-	file://libxine-tremor-autoconf.patch;patch=1 \
-	file://mpegvideo-static-inlinine.patch;patch=1 \
-	file://libxine-arm-configure.patch;patch=1 \
-	file://no-caca.patch;patch=1 \
-    file://libxine-gcc4.patch;patch=1"
-S = "${WORKDIR}/xine-lib-${PV}"
-
-SOV = "1.0.7"
-
-EXTRA_OECONF="-with-zlib-path=${STAGING_EXECPREFIXDIR} \
-	--with-vorbis-prefix=${STAGING_EXECPREFIXDIR} \
-	--disable-oggtest \
-	--with-ogg-prefix=${STAGING_EXECPREFIXDIR} \
-	--disable-altivec --disable-vis --disable-mlib \
-	--enable-shared --disable-static \
-	--disable-fb --disable-alsa --disable-vcd \
-	--disable-asf --disable-faad --disable-iconv \
-	--disable-aalib  --disable-aalibtest        \
-	--without-v4l --without-arts --without-sdl \
-	--disable-dxr3 --without-xv --without-xvmc \
-	--without-xxmc --without-Xshm --without-x "
-
-do_compile() {
-	oe_runmake LIBTOOL=${S}/${TARGET_SYS}-libtool
-}
-
-do_install() {
-	oe_runmake DESTDIR=${D} LIBTOOL=${S}/${TARGET_SYS}-libtool install
-}
-
-HEADERS="src/xine-engine/xineintl.h src/xine-utils/xineutils.h            \
-	src/xine-engine/xine_internal.h  src/xine-engine/xine_plugin.h    \
-	src/xine-utils/xine_buffer.h     src/xine-engine/video_out.h      \
-	src/xine-engine/buffer.h         src/xine-engine/vo_scale.h       \
-	src/xine-engine/configfile.h     src/xine-utils/attributes.h      \
-	src/xine-engine/info_helper.h    src/xine-engine/scratch.h        \
-	src/xine-engine/audio_decoder.h  src/input/input_plugin.h         \
-	src/xine-engine/spu_decoder.h    src/xine-engine/audio_out.h      \
-	src/xine-engine/io_helper.h      src/xine-engine/video_decoder.h  \
-	src/xine-engine/broadcaster.h    src/xine-engine/metronom.h       \
-	src/xine-utils/xmllexer.h        src/xine-engine/osd.h            \
-	src/xine-engine/video_overlay.h  src/xine-utils/xmlparser.h       \
-	src/xine-utils/compat.h          src/xine-engine/plugin_catalog.h \
-	src/xine-engine/post.h           src/demuxers/demux.h             \
-	src/xine-engine/resample.h	 lib/os_types.h                   \
-	src/xine-engine/refcounter.h"
-
-do_stage() {
-	install -d ${STAGING_INCDIR}/xine
-
-	install -m 0644 ${S}/include/xine.h ${STAGING_INCDIR}
-
-	for file in ${HEADERS}; do
-		cp ${S}/$file ${STAGING_INCDIR}/xine/`basename $file`
-	done
-
-	oe_libinstall -so -C src/xine-engine libxine ${STAGING_LIBDIR}
-}
-
-PACKAGES_DYNAMIC = "libxine-plugin-* libxine-font-*"
-
-python populate_packages_prepend () {
-	plugindir = bb.data.expand('${libdir}/xine/plugins/1.0.0', d)
-	do_split_packages(d, plugindir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
-
-	postdir = bb.data.expand('${libdir}/xine/plugins/1.0.0/post', d)
-	do_split_packages(d, postdir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
-
-	fontdir = bb.data.expand('${datadir}/xine/libxine1/fonts', d)
-	do_split_packages(d, fontdir, '^(.*).xinefont.gz$', 'libxine-font-%s', 'Xine font %s', extra_depends='' )
-}
-
-# Omit the annoying xine-config in ${bindir}
-FILES_${PN}="${libdir}/*.so*"
-
-# And include it in the dev package
-FILES_${PN}-dev += " ${bindir}"
-
diff --git a/recipes/libxine/libxine-x11-1.0/dont-have-xv.patch b/recipes/libxine/libxine-x11-1.0/dont-have-xv.patch
deleted file mode 100644
index 674e0e3..0000000
--- a/recipes/libxine/libxine-x11-1.0/dont-have-xv.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff -urNd ../libxine-1.0-r1/xine-lib-1.0/configure.ac xine-lib-1.0/configure.ac
---- ../libxine-1.0-r1/xine-lib-1.0/configure.ac	2005-04-09 02:35:05 +01:00
-+++ xine-lib-1.0/configure.ac	2005-04-09 02:48:17 +01:00
-@@ -693,6 +693,12 @@
- AM_CONDITIONAL(HAVE_XVMC, test x$ac_have_xvmc = "xyes")
- AC_SUBST(XVMC_LIB)
- 
-+dnl --------------------------------------------
-+dnl Declare Xv as missing
-+dnl --------------------------------------------
-+
-+AM_CONDITIONAL(HAVE_XV, 0)
-+
- 
- dnl ---------------------------------------------
- dnl Checks for Xinerama extension
diff --git a/recipes/libxine/libxine-x11-1.0/fix-syntax-xine-vorbis-decoder.patch b/recipes/libxine/libxine-x11-1.0/fix-syntax-xine-vorbis-decoder.patch
deleted file mode 100644
index a191280..0000000
--- a/recipes/libxine/libxine-x11-1.0/fix-syntax-xine-vorbis-decoder.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xine-lib-1.0/src/libvorbis/xine_decoder.c.old	2005-04-14 11:25:18 +01:00
-+++ xine-lib-1.0/src/libvorbis/xine_decoder.c	2005-04-14 11:26:14 +01:00
-@@ -219,7 +219,7 @@
-     int **pcm;
-     int samples;
- 
--    if(vorbis_synthesis(&this->vb,&this->op)==0) 
-+    if(vorbis_synthesis(&this->vb,&this->op,1)==0) 
-       vorbis_synthesis_blockin(&this->vd,&this->vb);
- 
-     if (buf->pts!=0)
diff --git a/recipes/libxine/libxine-x11-1.0/no-caca-no-aalib.patch b/recipes/libxine/libxine-x11-1.0/no-caca-no-aalib.patch
deleted file mode 100644
index ffdda0c..0000000
--- a/recipes/libxine/libxine-x11-1.0/no-caca-no-aalib.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -urNd ../libxine-1.0-r1/xine-lib-1.0/configure.ac xine-lib-1.0/configure.ac
---- ../libxine-1.0-r1/xine-lib-1.0/configure.ac	2005-04-09 02:22:48 +01:00
-+++ xine-lib-1.0/configure.ac	2005-04-09 02:24:00 +01:00
-@@ -710,16 +710,16 @@
- dnl Checks for Ascii-Art library
- dnl ---------------------------------------------
- 
--AM_PATH_AALIB(1.4,, AC_MSG_RESULT([*** All of AALIB dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_AA,  [test x"$enable_aalib" = "xyes" && test x$no_aalib != "xyes"])
-+dnl AM_PATH_AALIB(1.4,, AC_MSG_RESULT([*** All of AALIB dependent parts will be disabled ***]))
-+AM_CONDITIONAL(HAVE_AA, 0)
- 
- 
- dnl ---------------------------------------------
- dnl Checks for Color AsCii Art library
- dnl ---------------------------------------------
- 
--AM_PATH_CACA(0.3,, AC_MSG_RESULT([*** All CACA-dependent parts will be disabled ***]))
--AM_CONDITIONAL(HAVE_CACA, test x$no_caca != "xyes")
-+dnl AM_PATH_CACA(0.3,, AC_MSG_RESULT([*** All CACA-dependent parts will be disabled ***]))
-+AM_CONDITIONAL(HAVE_CACA, 0)
- 
- 
- dnl ---------------------------------------------
diff --git a/recipes/libxine/libxine-x11-1.0/restore-esd.patch b/recipes/libxine/libxine-x11-1.0/restore-esd.patch
deleted file mode 100644
index 26a74ad..0000000
--- a/recipes/libxine/libxine-x11-1.0/restore-esd.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -urNd ../libxine-1.0-r1/xine-lib-1.0/configure.ac xine-lib-1.0/configure.ac
---- ../libxine-1.0-r1/xine-lib-1.0/configure.ac	2005-04-09 04:38:41 +01:00
-+++ xine-lib-1.0/configure.ac	2005-04-09 04:39:54 +01:00
-@@ -1080,8 +1080,9 @@
- dnl ESD support
- dnl ---------------------------------------------
- 
--AM_CONDITIONAL(HAVE_ESD, 0)
--
-+AM_PATH_ESD(0.2.8,
-+        AC_DEFINE(HAVE_ESD,1,[Define this if you have ESD (libesd) installed]),-        AC_MSG_RESULT(*** All of ESD dependent parts will be disabled ***))
-+AM_CONDITIONAL(HAVE_ESD, test x"$no_esd" != "xyes")
- 
- dnl ---------------------------------------------
- dnl ARTS support
diff --git a/recipes/libxine/libxine-x11_1.0.bb b/recipes/libxine/libxine-x11_1.0.bb
deleted file mode 100644
index 6bc7e6e..0000000
--- a/recipes/libxine/libxine-x11_1.0.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-DESCRIPTION = "libxine is a versatile multimedia library decoding a lot of common audio and video formats. \
-This version is configued for the usage with X11"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPL"
-DEPENDS = "zlib libogg libvorbis tremor libmodplug esound virtual/libx11 libxext libpng \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-PROVIDES = "virtual/libxine"
-PR = "r2"
-
-inherit autotools pkgconfig gettext binconfig
-
-SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/xine/xine-lib-${PV}.tar.gz \
-	file://cpu-${PV}.patch;patch=1 \
-	file://configure-${PV}.patch;patch=1 \
-	file://libxine-tremor-autoconf.patch;patch=1 \
-	file://libxine-libvorbis.patch;patch=1 \
-	file://libxine-ffmpeg-enable-arm.patch;patch=1 \
-	file://no-caca-no-aalib.patch;patch=1 \
-	file://dont-have-xv.patch;patch=1 \
-#	file://restore-esd.patch;patch=1 \
-	file://fix-syntax-xine-vorbis-decoder.patch;patch=1 \
-	file://libxine-cut-memusage.patch;patch=1 \
-	file://mpegvideo-static-inlinine.patch;patch=1 \
-	file://libxine-libavcodec.patch;patch=1 \
-	file://libxine-gcc4.patch;patch=1"
-S = "${WORKDIR}/xine-lib-${PV}"
-
-SOV = "1.0.7"
-
-EXTRA_OECONF="-with-zlib-path=${STAGING_EXECPREFIXDIR} \
-	--with-vorbis-prefix=${STAGING_EXECPREFIXDIR} \
-	--disable-oggtest \
-	--with-ogg-prefix=${STAGING_EXECPREFIXDIR} \
-	--disable-altivec --disable-vis --disable-mlib \
-	--disable-fb --disable-alsa --disable-vcd \
-	--disable-asf --disable-faad --disable-iconv \
-	--without-v4l --without-arts --without-sdl \
-	--without-xv  --without-xxmc --without-xvmc \
-	--with-x --x-includes=${STAGING_INCDIR}/X11 --x-libraries=${STAGING_LIBDIR}"
-
-do_compile() {
-	oe_runmake LIBTOOL=${S}/${TARGET_SYS}-libtool
-}
-
-do_install() {
-	oe_runmake DESTDIR=${D} LIBTOOL=${S}/${TARGET_SYS}-libtool install
-}
-
-HEADERS="src/xine-engine/xineintl.h src/xine-utils/xineutils.h            \
-	src/xine-engine/xine_internal.h  src/xine-engine/xine_plugin.h    \
-	src/xine-utils/xine_buffer.h     src/xine-engine/video_out.h      \
-	src/xine-engine/buffer.h         src/xine-engine/vo_scale.h       \
-	src/xine-engine/configfile.h     src/xine-utils/attributes.h      \
-	src/xine-engine/info_helper.h    src/xine-engine/scratch.h        \
-	src/xine-engine/audio_decoder.h  src/input/input_plugin.h         \
-	src/xine-engine/spu_decoder.h    src/xine-engine/audio_out.h      \
-	src/xine-engine/io_helper.h      src/xine-engine/video_decoder.h  \
-	src/xine-engine/broadcaster.h    src/xine-engine/metronom.h       \
-	src/xine-utils/xmllexer.h        src/xine-engine/osd.h            \
-	src/xine-engine/video_overlay.h  src/xine-utils/xmlparser.h       \
-	src/xine-utils/compat.h          src/xine-engine/plugin_catalog.h \
-	src/xine-engine/post.h           src/demuxers/demux.h             \
-	src/xine-engine/resample.h	 lib/os_types.h                   \
-	src/xine-engine/refcounter.h"
-
-do_stage() {
-	install -d ${STAGING_INCDIR}/xine
-
-	install -m 0644 ${S}/include/xine.h ${STAGING_INCDIR}
-
-	for file in ${HEADERS}; do
-		cp ${S}/$file ${STAGING_INCDIR}/xine/`basename $file`
-	done
-
-	install -m 0644 ${S}/m4/xine.m4 ${STAGING_DATADIR}/aclocal/
-
-	oe_libinstall -so -C src/xine-engine libxine ${STAGING_LIBDIR}
-}
-
-PACKAGES_DYNAMIC = "libxine-plugin-* libxine-font-*"
-
-python populate_packages_prepend () {
-	bb.data.setVar('PKG_libxine', 'libxine', d)
-
-	plugindir = bb.data.expand('${libdir}/xine/plugins/1.0.0', d)
-	do_split_packages(d, plugindir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
-
-	postdir = bb.data.expand('${libdir}/xine/plugins/1.0.0/post', d)
-	do_split_packages(d, postdir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
-
-	fontdir = bb.data.expand('${datadir}/xine/libxine1/fonts', d)
-	do_split_packages(d, fontdir, '^(.*).xinefont.gz$', 'libxine-font-%s', 'Xine font %s', extra_depends='' )
-}
-
-# Omit the annoying xine-config in ${bindir}
-FILES_${PN}="${libdir}/*.so*"
-
-# And include it in the dev package
-FILES_${PN}-dev += " ${bindir}"
diff --git a/recipes/libxine/libxine.inc b/recipes/libxine/libxine.inc
new file mode 100644
index 0000000..91bb30f
--- /dev/null
+++ b/recipes/libxine/libxine.inc
@@ -0,0 +1,65 @@
+DESCRIPTION = "libxine is a versatile multimedia library decoding a lot of common audio and video formats." 
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "ffmpeg zlib libogg libvorbis tremor libmad libmodplug libpng alsa-lib virtual/libiconv virtual/libx11 \
+	   libxv libxext directfb pulseaudio"
+
+inherit autotools gettext binconfig pkgconfig
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/xine/xine-lib-${PV}.tar.bz2"
+
+S = "${WORKDIR}/xine-lib-${PV}"
+
+SOV = "1.0.7"
+
+EXTRA_OECONF = "--with-zlib-path=${STAGING_EXECPREFIXDIR} \
+	--with-vorbis-prefix=${STAGING_EXECPREFIXDIR} \
+	--disable-oggtest --with-ogg-prefix=${STAGING_EXECPREFIXDIR} \
+	--disable-iconvtest \
+        --disable-asf --disable-faad \
+        --disable-aalib  --disable-aalibtest \
+        --disable-esd    --disable-esdtest \
+        --disable-dvdnav --disable-dvdnavtest \
+        --disable-vcd \
+        --without-arts --without-sdl \
+	--disable-altivec --disable-vis --disable-mlib \
+	--without-sdl \
+	--without-v4l --disable-dxr3 --disable-libfametest\
+	--disable-rpath \
+	--enable-fb --enable-directfb \
+        --with-x --x-includes=${STAGING_INCDIR}/X11 \
+        --x-libraries=${STAGING_LIBDIR} \
+	"
+
+LIBTOOL = "${HOST_SYS}-libtool"
+EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
+
+do_stage() {
+        autotools_stage_all
+}
+
+PACKAGES_DYNAMIC = "libxine-plugin-* libxine-font-*"
+
+python populate_packages_prepend () {
+	bb.data.setVar('PKG_libxine', 'libxine', d)
+
+	plugindir = bb.data.expand('${libdir}/xine/plugins/${PPDIR}', d)
+	do_split_packages(d, plugindir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
+
+	postdir = bb.data.expand('${libdir}/xine/plugins/${PPDIR}/post', d)
+	do_split_packages(d, postdir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
+
+	fontdir = bb.data.expand('${datadir}/xine/libxine1/fonts', d)
+	do_split_packages(d, fontdir, '^(.*).xinefont.gz$', 'libxine-font-%s', 'Xine font %s', extra_depends='' )
+}
+
+#python populate_packages_append () {
+#	bb.data.setVar('PKG_libxine', 'libxine', d)
+#	
+#	plugindirdbg = bb.data.expand('${libdir}/xine/plugins/${PPDIR}/.debug', d)
+#       do_split_packages(d, plugindirdbg, '^xineplug_(.*)\.so$', 'libxine-plugin-%s-dbg', 'Xine plugin for %s debugversion', extra_depends='' )
+#
+#	postdirdbg = bb.data.expand('${libdir}/xine/plugins/${PPDIR}/post/.debug', d)
+#        do_split_packages(d, postdirdbg, '^xineplug_(.*)\.so$', 'libxine-plugin-%s-dbg', 'Xine plugin for %s debugversion', extra_depends='' )
+#}
diff --git a/recipes/libxine/libxine_1.1.0.bb b/recipes/libxine/libxine_1.1.0.bb
deleted file mode 100644
index 71e7663..0000000
--- a/recipes/libxine/libxine_1.1.0.bb
+++ /dev/null
@@ -1,107 +0,0 @@
-DESCRIPTION = "libxine is a versatile multimedia library decoding a lot of common audio and video formats. \
-This version is configued for the usage with X11"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPL"
-DEPENDS = "zlib libogg libvorbis tremor libmodplug esound virtual/libx11 libxext libpng \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-PROVIDES = "virtual/libxine"
-PR = "r2"
-
-inherit autotools pkgconfig gettext binconfig
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/xine/xine-lib-${PV}.tar.gz \
-    file://configure.patch;patch=1 \
-    file://cpuid.patch;patch=1 \
-    file://fix-syntax-xine-vorbis-decoder.patch;patch=1 \
-    file://libxine-arm-configure.patch;patch=1 \
-    file://libxine-cut-memusage.patch;patch=1 \
-    file://libxine-ffmpeg-enable-arm.patch;patch=1 \
-#    file://libxine-libavcodec.patch;patch=1 \
-    file://tremor.patch;patch=1 \
-    file://libxine-tremor-autoconf.patch;patch=1 \
-    file://mpegvideo-static-inlinine.patch;patch=1 \
-    file://no-caca.patch;patch=1 \
-    file://dont-have-xv.patch;patch=1 \
-    file://gcc41.patch;patch=1 \
-"
-
-DEFAULT_PREFERENCE = "-1"
-
-S = "${WORKDIR}/xine-lib-${PV}"
-
-SOV = "1.0.7"
-
-EXTRA_OECONF="-with-zlib-path=${STAGING_EXECPREFIXDIR} \
-	--with-vorbis-prefix=${STAGING_EXECPREFIXDIR} \
-	--disable-oggtest \
-	--with-ogg-prefix=${STAGING_EXECPREFIXDIR} \
-	--disable-altivec --disable-vis --disable-mlib \
-	--disable-fb --disable-alsa --disable-vcd \
-	--disable-asf --disable-faad --disable-iconv \
-	--without-v4l --without-arts --without-sdl \
-	--without-xv  --without-xxmc --without-xvmc \
-	--disable-aalibtest \
-	--with-x --x-includes=${STAGING_INCDIR}/X11 --x-libraries=${STAGING_LIBDIR}"
-
-export WAND_CONFIG="${STAGING_BINDIR_CROSS}/Wand-config"
-
-do_compile() {
-	oe_runmake LIBTOOL=${S}/${TARGET_SYS}-libtool
-}
-
-do_install() {
-	oe_runmake DESTDIR=${D} LIBTOOL=${S}/${TARGET_SYS}-libtool install
-}
-
-HEADERS="src/xine-engine/xineintl.h src/xine-utils/xineutils.h            \
-	src/xine-engine/xine_internal.h  src/xine-engine/xine_plugin.h    \
-	src/xine-utils/xine_buffer.h     src/xine-engine/video_out.h      \
-	src/xine-engine/buffer.h         src/xine-engine/vo_scale.h       \
-	src/xine-engine/configfile.h     src/xine-utils/attributes.h      \
-	src/xine-engine/info_helper.h    src/xine-engine/scratch.h        \
-	src/xine-engine/audio_decoder.h  src/input/input_plugin.h         \
-	src/xine-engine/spu_decoder.h    src/xine-engine/audio_out.h      \
-	src/xine-engine/io_helper.h      src/xine-engine/video_decoder.h  \
-	src/xine-engine/broadcaster.h    src/xine-engine/metronom.h       \
-	src/xine-utils/xmllexer.h        src/xine-engine/osd.h            \
-	src/xine-engine/video_overlay.h  src/xine-utils/xmlparser.h       \
-	src/xine-utils/compat.h          src/xine-engine/plugin_catalog.h \
-	src/xine-engine/post.h           src/demuxers/demux.h             \
-	src/xine-engine/resample.h	 lib/os_types.h                   \
-	src/xine-engine/refcounter.h"
-
-do_stage() {
-	install -d ${STAGING_INCDIR}/xine
-
-	install -m 0644 ${S}/include/xine.h ${STAGING_INCDIR}
-
-	for file in ${HEADERS}; do
-		cp ${S}/$file ${STAGING_INCDIR}/xine/`basename $file`
-	done
-
-	install -m 0644 ${S}/m4/xine.m4 ${STAGING_DATADIR}/aclocal/
-
-	oe_libinstall -so -C src/xine-engine libxine ${STAGING_LIBDIR}
-}
-
-PACKAGES_DYNAMIC = "libxine-plugin-* libxine-font-*"
-
-python populate_packages_prepend () {
-	bb.data.setVar('PKG_libxine', 'libxine', d)
-
-	plugindir = bb.data.expand('${libdir}/xine/plugins/1.1.0', d)
-	do_split_packages(d, plugindir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
-
-	postdir = bb.data.expand('${libdir}/xine/plugins/1.1.0/post', d)
-	do_split_packages(d, postdir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
-
-	fontdir = bb.data.expand('${datadir}/xine/libxine1/fonts', d)
-	do_split_packages(d, fontdir, '^(.*).xinefont.gz$', 'libxine-font-%s', 'Xine font %s', extra_depends='' )
-}
-
-# Omit the annoying xine-config in ${bindir}
-FILES_${PN}="${libdir}/*.so*"
-
-# And include it in the dev package
-FILES_${PN}-dev += " ${bindir}"
diff --git a/recipes/libxine/libxine_1.1.16.bb b/recipes/libxine/libxine_1.1.16.bb
new file mode 100644
index 0000000..c46b393
--- /dev/null
+++ b/recipes/libxine/libxine_1.1.16.bb
@@ -0,0 +1,39 @@
+require libxine.inc
+
+PPDIR = "1.25"
+PR = "r0"
+
+
+SRC_URI += " \
+    	file://libxine-arm-configure.patch;patch=1 \
+	file://iconv.patch;patch=1 \
+	file://libpostproc.patch;patch=1 \
+	file://libavcodec.patch;patch=1 \
+        "
+
+python populate_packages_prepend () {
+        bb.data.setVar('PKG_libxine', 'libxine', d)
+
+        plugindir = bb.data.expand('${libdir}/xine/plugins/${PPDIR}', d)
+        do_split_packages(d, plugindir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
+
+	vidixdir = bb.data.expand('${libdir}/xine/plugins/${PPDIR}/vidix', d)
+        do_split_packages(d, vidixdir, '^(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
+
+        postdir = bb.data.expand('${libdir}/xine/plugins/${PPDIR}/post', d)
+        do_split_packages(d, postdir, '^xineplug_(.*)\.so$', 'libxine-plugin-%s', 'Xine plugin for %s', extra_depends='' )
+
+        fontdir = bb.data.expand('${datadir}/xine/libxine1/fonts', d)
+        do_split_packages(d, fontdir, '^(.*).xinefont.gz$', 'libxine-font-%s', 'Xine font %s', extra_depends='' )
+
+}
+
+FILES_${PN}-dbg =+ "${libdir}/xine/plugins/${PPDIR}/.debug \
+		    ${libdir}/xine/plugins/${PPDIR}/post/.debug \
+		    ${libdir}/xine/plugins/${PPDIR}/vidix/.debug \
+	           "
+
+FILES_${PN}-dev =+ "${libdir}/xine/plugins/${PPDIR}/*.a \
+                    ${libdir}/xine/plugins/${PPDIR}/post/*.a \
+                    ${libdir}/xine/plugins/${PPDIR}/vidix/*.a \
+                   "
-- 
1.6.2.1


--A6N2fC+uXW/VQSAv
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0002-checksum.ini-add-xine-1.1.16-remove-older-versions.patch"

From 56b8436c3b3ed57df16d0e3d01d16a2193b89c42 Mon Sep 17 00:00:00 2001
From: woglinde <heinold@inf.fu-berlin.de>
Date: Sat, 28 Mar 2009 16:21:15 +0100
Subject: [PATCH 2/7] checksum.ini: add xine-1.1.16 remove older versions

---
 conf/checksums.ini |   22 +++-------------------
 1 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a88da9e..cad12a0 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -25670,25 +25670,9 @@ sha256=5e3db5f2387457f67798d664ed67c67337d2f84c45f15d986ee2f46f9b45d0d1
 md5=d12efb18c7e3025c5e6a6f63144c2145
 sha256=b968a10f52b0c5e807ec4c2c106f3aea301cf0ac00d04299b6961370c82c66d8
 
-[http://downloads.sourceforge.net/xine/xine-lib-1.0.tar.gz]
-md5=96e5195c366064e7778af44c3e71f43a
-sha256=6a283d383358200a9d6866d5d666a0227c8412d9c33d41f166f39c011482aed4
-
-[http://heanet.dl.sourceforge.net/sourceforge/xine/xine-lib-1.0.tar.gz]
-md5=96e5195c366064e7778af44c3e71f43a
-sha256=6a283d383358200a9d6866d5d666a0227c8412d9c33d41f166f39c011482aed4
-
-[http://heanet.dl.sourceforge.net/xine/xine-lib-1.0.tar.gz]
-md5=96e5195c366064e7778af44c3e71f43a
-sha256=6a283d383358200a9d6866d5d666a0227c8412d9c33d41f166f39c011482aed4
-
-[http://downloads.sourceforge.net/xine/xine-lib-1.1.0.tar.gz]
-md5=3537cfd58d253b4be20a4975e7086e38
-sha256=795085a067b3a11c1b3de48b4d07b01d8ffb6123bd188a73cb53b0605f875c64
-
-[http://heanet.dl.sourceforge.net/xine/xine-lib-1.1.0.tar.gz]
-md5=3537cfd58d253b4be20a4975e7086e38
-sha256=795085a067b3a11c1b3de48b4d07b01d8ffb6123bd188a73cb53b0605f875c64
+[http://downloads.sourceforge.net/xine/xine-lib-1.1.16.tar.bz2]
+md5=acd1a210c5a6444e8fd44696469352bb
+sha256=27df9c8f962797b235d69154705cfdf18d3e325f028f54e3e804f6dadb8237be
 
 [http://folks.o-hand.com/dodji/0xdeadbabe/xine.tgz]
 md5=8b78ce490cde6eb3c586656e9bc5ead8
-- 
1.6.2.1


--A6N2fC+uXW/VQSAv--

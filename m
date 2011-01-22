Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PgQw9-0006FP-9d
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 01:02:37 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id 3D7729544017
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 01:01:57 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fjCrKhr60etN; Sat, 22 Jan 2011 01:01:48 +0100 (CET)
Received: from localhost.localdomain (e181050127.adsl.alicedsl.de
	[85.181.50.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 4EE289544014;
	Sat, 22 Jan 2011 01:01:48 +0100 (CET)
From: Lars Michelsen <lm@larsmichelsen.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jan 2011 01:01:43 +0100
Message-Id: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
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
X-List-Received-Date: Sat, 22 Jan 2011 00:02:37 -0000

This commit updates the mplayer_svn.bb to mplayer rev. 31329.
To make this revision built the patches vofw-swscale.diff,
 omapfb.patch and mplayer-lavc-arm.patch needed to be altered.

It was also neccessary to add the following patches:
- fix-missing-avcore-include.diff: Adds a missing include "libavcore/avcore.h"
- fix-undefined-get-utf8.diff: Adds missing include "libavutil/common.h"
- configure-add-av-have-fast-unaligned-macro.diff: Adds missing configure
  code which adds the missing define AV_HAVE_FAST_UNALIGNED
- fix-arm-compilation.p: Fixes a wrong offset of H263_AIC when compiling for arm.
  The patch is a little special: It applies to the ffmpeg sources which
  are part of the mplayer repository (as subrepository). The problem with the
  sub repository seems to be that it always fetches the latest revision of that
  repository and not a matching revision between the mplayer and ffmpeg sources.
  So I had to change to the ffmpeg dir, change to that revision and apply the
  patch afterwards. This is a reason for the '.p' suffix - with diff/patch the
  patch was applied before automatically.

Also added some max-rev entries to several patches of the mplayer package where
I found the fixes in the mplayer subversion.

---

I was unable to build the package with tested_2010-12-30 code on ubuntu 10.04 x84_64
for my beagleboard rev. c4. This might be related to the ffmpeg subrepository and some
code reorganisations which have been made in the current ffmpeg code.

The ffmpeg sub repository thing does not seem very clean to me. Any other ideas on
how to fix this issue a cleaner way?

Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>
---
 ...configure-add-av-have-fast-unaligned-macro.diff |   49 +++++++++++++++++
 recipes/mplayer/files/fix-arm-compilation.p        |   11 ++++
 .../mplayer/files/fix-missing-avcore-include.diff  |   10 ++++
 recipes/mplayer/files/fix-undefined-get-utf8.diff  |   10 ++++
 recipes/mplayer/files/mplayer-lavc-arm.patch       |    2 +-
 recipes/mplayer/files/omapfb.patch                 |   28 +++++-----
 recipes/mplayer/files/vo_omapfb.c                  |    2 +-
 recipes/mplayer/mplayer/vofw-swscale.diff          |    6 +--
 recipes/mplayer/mplayer_svn.bb                     |   57 ++++++++++++-------
 9 files changed, 134 insertions(+), 41 deletions(-)
 create mode 100644 recipes/mplayer/files/configure-add-av-have-fast-unaligned-macro.diff
 create mode 100644 recipes/mplayer/files/fix-arm-compilation.p
 create mode 100644 recipes/mplayer/files/fix-missing-avcore-include.diff
 create mode 100644 recipes/mplayer/files/fix-undefined-get-utf8.diff

diff --git a/recipes/mplayer/files/configure-add-av-have-fast-unaligned-macro.diff b/recipes/mplayer/files/configure-add-av-have-fast-unaligned-macro.diff
new file mode 100644
index 0000000..816a77b
--- /dev/null
+++ b/recipes/mplayer/files/configure-add-av-have-fast-unaligned-macro.diff
@@ -0,0 +1,49 @@
+--- trunk/configure	(revision 31687)
++++ trunk/configure	(working copy)
+@@ -1812,6 +1812,7 @@
+ 
+ def_fast_64bit='#define HAVE_FAST_64BIT 0'
+ def_fast_unaligned='#define HAVE_FAST_UNALIGNED 0'
++def_av_fast_unaligned='#define AV_HAVE_FAST_UNALIGNED 0'
+ def_local_aligned_8='#define HAVE_LOCAL_ALIGNED_8 0'
+ def_local_aligned_16='#define HAVE_LOCAL_ALIGNED_16 0'
+ arch_all='X86 IA64 SPARC ARM AVR32 SH4 PPC ALPHA MIPS PA_RISC S390 S390X VAX BFIN XTENSA TOMI GENERIC'
+@@ -1821,6 +1822,7 @@
+   arch='x86'
+   subarch='x86_32'
+   def_fast_unaligned='#define HAVE_FAST_UNALIGNED 1'
++  def_av_fast_unaligned='#define AV_HAVE_FAST_UNALIGNED 1'
+   def_local_aligned_8='#define HAVE_LOCAL_ALIGNED_8 1'
+   def_local_aligned_16='#define HAVE_LOCAL_ALIGNED_16 1'
+   iproc=486
+@@ -2069,6 +2071,7 @@
+     arch='x86'
+     subarch='x86_64'
+     def_fast_unaligned='#define HAVE_FAST_UNALIGNED 1'
++    def_av_fast_unaligned='#define AV_HAVE_FAST_UNALIGNED 1'
+     def_fast_64bit='#define HAVE_FAST_64BIT 1'
+     iproc='x86_64'
+ 
+@@ -2196,6 +2199,7 @@
+   avr32)
+     arch='avr32'
+     def_fast_unaligned='#define HAVE_FAST_UNALIGNED 1'
++    def_av_fast_unaligned='#define AV_HAVE_FAST_UNALIGNED 1'
+     iproc='avr32'
+     test $_fast_clz = "auto" && _fast_clz=yes
+     ;;
+@@ -2209,6 +2213,7 @@
+     arch='ppc'
+     def_dcbzl='#define HAVE_DCBZL 0'
+     def_fast_unaligned='#define HAVE_FAST_UNALIGNED 1'
++    def_av_fast_unaligned='#define AV_HAVE_FAST_UNALIGNED 1'
+     def_local_aligned_8='#define HAVE_LOCAL_ALIGNED_8 1'
+     def_local_aligned_16='#define HAVE_LOCAL_ALIGNED_16 1'
+     iproc='ppc'
+@@ -9320,6 +9325,7 @@
+ #ifndef AVUTIL_AVCONFIG_H
+ #define AVUTIL_AVCONFIG_H
+ $def_av_bigendian
++$def_av_fast_unaligned
+ #endif /* AVUTIL_AVCONFIG_H */
+ EOF
diff --git a/recipes/mplayer/files/fix-arm-compilation.p b/recipes/mplayer/files/fix-arm-compilation.p
new file mode 100644
index 0000000..d1f7a10
--- /dev/null
+++ b/recipes/mplayer/files/fix-arm-compilation.p
@@ -0,0 +1,11 @@
+--- trunk/ffmpeg/libavcodec/arm/asm-offsets.h.orig	2011-01-14 10:36:35.000000000 +0100
++++ trunk/ffmpeg/libavcodec/arm/asm-offsets.h	2011-01-14 10:37:00.000000000 +0100
+@@ -35,7 +35,7 @@
+ #define AC_PRED                  0xa80
+ #define BLOCK_LAST_INDEX         0x2160
+ #define INTER_SCANTAB_RASTER_END 0x2360
+-#define H263_AIC                 0x2610
++#define H263_AIC                 0x2618
+ #elif defined(__APPLE__)
+ #define Y_DC_SCALE               0xa30
+ #define C_DC_SCALE               0xa34
diff --git a/recipes/mplayer/files/fix-missing-avcore-include.diff b/recipes/mplayer/files/fix-missing-avcore-include.diff
new file mode 100644
index 0000000..ada4ee7
--- /dev/null
+++ b/recipes/mplayer/files/fix-missing-avcore-include.diff
@@ -0,0 +1,10 @@
+--- trunk/libmpdemux/demux_lavf.c.orig	2011-01-14 01:22:25.000000000 +0100
++++ trunk/libmpdemux/demux_lavf.c	2011-01-14 01:22:43.000000000 +0100
+@@ -40,6 +40,7 @@
+ #include "libavutil/avutil.h"
+ #include "libavutil/avstring.h"
+ #include "libavcodec/opt.h"
++#include "libavcore/avcore.h"
+ 
+ #include "mp_taglists.h"
+ 
diff --git a/recipes/mplayer/files/fix-undefined-get-utf8.diff b/recipes/mplayer/files/fix-undefined-get-utf8.diff
new file mode 100644
index 0000000..52e26ea
--- /dev/null
+++ b/recipes/mplayer/files/fix-undefined-get-utf8.diff
@@ -0,0 +1,10 @@
+--- trunk/stream/stream.c.orig	2011-01-14 01:12:52.000000000 +0100
++++ trunk/stream/stream.c	2011-01-14 01:13:06.000000000 +0100
+@@ -40,6 +40,7 @@
+ #include "osdep/shmem.h"
+ #include "network.h"
+ #include "stream.h"
++#include "libavutil/common.h"
+ #include "libmpdemux/demuxer.h"
+ #include "libavutil/intreadwrite.h"
+ 
diff --git a/recipes/mplayer/files/mplayer-lavc-arm.patch b/recipes/mplayer/files/mplayer-lavc-arm.patch
index 8c2c832..4d2c594 100644
--- a/recipes/mplayer/files/mplayer-lavc-arm.patch
+++ b/recipes/mplayer/files/mplayer-lavc-arm.patch
@@ -1,7 +1,7 @@
 Index: trunk/libavcodec/arm/dsputil_arm.S
 ===================================================================
 --- trunk.orig/libavcodec/arm/dsputil_arm.S	2009-11-11 22:16:37.216062301 +0300
-+++ trunk/libavcodec/arm/dsputil_arm.S	2009-11-11 22:22:00.908058155 +0300
++++ trunk/ffmpeg/libavcodec/arm/dsputil_arm.S	2009-11-11 22:22:00.908058155 +0300
 @@ -29,6 +29,12 @@
  .endm
  #endif
diff --git a/recipes/mplayer/files/omapfb.patch b/recipes/mplayer/files/omapfb.patch
index 2356d80..5c3a8bd 100644
--- a/recipes/mplayer/files/omapfb.patch
+++ b/recipes/mplayer/files/omapfb.patch
@@ -1,14 +1,14 @@
---- /tmp/video_out.c	2009-01-14 16:39:38.000000000 +0100
-+++ trunk/libvo/video_out.c	2009-01-14 16:40:11.000000000 +0100
-@@ -86,6 +86,7 @@
- extern vo_functions_t video_out_bl;
- extern vo_functions_t video_out_fbdev;
- extern vo_functions_t video_out_fbdev2;
+--- trunk/libvo/video_out.c.orig	2011-01-14 09:45:20.000000000 +0100
++++ trunk/libvo/video_out.c	2011-01-14 09:45:48.000000000 +0100
+@@ -111,6 +111,7 @@
+ extern const vo_functions_t video_out_zr2;
+ extern const vo_functions_t video_out_bl;
+ extern const vo_functions_t video_out_fbdev2;
 +extern vo_functions_t video_out_omapfb;
- extern vo_functions_t video_out_svga;
- extern vo_functions_t video_out_png;
- extern vo_functions_t video_out_ggi;
-@@ -177,6 +178,7 @@
+ extern const vo_functions_t video_out_png;
+ extern const vo_functions_t video_out_ggi;
+ extern const vo_functions_t video_out_aa;
+@@ -216,6 +217,7 @@
  #ifdef CONFIG_FBDEV
          &video_out_fbdev,
          &video_out_fbdev2,
@@ -16,14 +16,14 @@
  #endif
  #ifdef CONFIG_SVGALIB
          &video_out_svga,
---- a/Makefile	2009-02-03 13:45:48.000000000 -0800
-+++ b/Makefile	2009-02-03 13:45:50.000000000 -0800
-@@ -551,7 +551,7 @@
+--- trunk/Makefile.orig	2011-01-14 09:45:57.000000000 +0100
++++ trunk/Makefile	2011-01-14 09:46:28.000000000 +0100
+@@ -545,7 +545,7 @@
  SRCS_MPLAYER-$(DXR2)         += libao2/ao_dxr2.c libvo/vo_dxr2.c
  SRCS_MPLAYER-$(DXR3)         += libvo/vo_dxr3.c
  SRCS_MPLAYER-$(ESD)          += libao2/ao_esd.c
 -SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c
 +SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S
+ SRCS_MPLAYER-$(FFMPEG)       += libvo/vo_png.c
  SRCS_MPLAYER-$(GGI)          += libvo/vo_ggi.c
  SRCS_MPLAYER-$(GIF)          += libvo/vo_gif89a.c
- SRCS_MPLAYER-$(GL)           += libvo/gl_common.c libvo/vo_gl.c libvo/vo_gl2.c
diff --git a/recipes/mplayer/files/vo_omapfb.c b/recipes/mplayer/files/vo_omapfb.c
index cb4daff..b037644 100644
--- a/recipes/mplayer/files/vo_omapfb.c
+++ b/recipes/mplayer/files/vo_omapfb.c
@@ -57,7 +57,7 @@ It's an interpolation bug in the color conversion that needs to be fixed
 #include "video_out.h"
 #include "video_out_internal.h"
 #include "fastmemcpy.h"
-#include "sub.h"
+#include "sub/sub.h"
 #include "mp_msg.h"
 #include "omapfb.h"
 #include "x11_common.h"
diff --git a/recipes/mplayer/mplayer/vofw-swscale.diff b/recipes/mplayer/mplayer/vofw-swscale.diff
index 6a6b82c..e1ae76d 100644
--- a/recipes/mplayer/mplayer/vofw-swscale.diff
+++ b/recipes/mplayer/mplayer/vofw-swscale.diff
@@ -1,7 +1,5 @@
-Needed for encoding large images with mencoder or grabbing large image from a v4l src
-
---- /tmp/swscale_internal.h	2010-10-05 09:15:42.000000000 +0200
-+++ trunk/libswscale/swscale_internal.h	2010-10-05 09:16:07.000000000 +0200
+--- trunk/libswscale/swscale_internal.h.orig	2011-01-13 23:57:13.000000000 +0100
++++ trunk/libswscale/swscale_internal.h	2011-01-13 23:57:23.000000000 +0100
 @@ -33,11 +33,7 @@
  
  #define MAX_FILTER_SIZE 256
diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
index bc299cb..36f4c95 100644
--- a/recipes/mplayer/mplayer_svn.bb
+++ b/recipes/mplayer/mplayer_svn.bb
@@ -8,25 +8,31 @@ DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib li
 RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "svn://svn.mplayerhq.hu/mplayer;module=trunk \
-	   file://makefile-nostrip-svn.patch \
-	   file://mplayer-arm-pld.patch \
-	   file://mplayer-lavc-arm.patch \
+       file://makefile-nostrip-svn.patch \
+       file://mplayer-arm-pld.patch \
+       file://mplayer-lavc-arm.patch \
        file://fix-exp.diff;maxrev=30291 \
-	   file://fix-addrinfo.patch;maxrev=30302 \
+       file://fix-addrinfo.patch;maxrev=30302 \
        file://fix-avconfig.diff;maxrev=30376 \
-	   file://fix-emu_qtx_api.diff;maxrev=30165 \
+       file://fix-emu_qtx_api.diff;maxrev=30165 \
        file://codecs_conf-VP8.diff;striplevel=0 \
-       file://demux_mkv-V_VP8__webm_doctype.diff;striplevel=0 \
-       file://configure-libvpx_test.diff \
+       file://demux_mkv-V_VP8__webm_doctype.diff;striplevel=0;maxrev=31328 \
+       file://configure-libvpx_test.diff;maxrev=31219 \
        file://vofw-swscale.diff \
+       file://configure-add-av-have-fast-unaligned-macro.diff;maxrev=31687 \
+       file://fix-undefined-get-utf8.diff;maxrev=31658 \
+       file://fix-missing-avcore-include.diff \
 "
 
-SRCREV = "30165"
+
+SRCREV = "32647"
+
 SRC_URI_append_armv7a = " \
-		file://omapfb.patch \
-	   file://vo_omapfb.c \
-	   file://yuv.S \
-	  "
+     file://omapfb.patch \
+     file://vo_omapfb.c \
+     file://yuv.S \
+     file://fix-arm-compilation.p \
+    "
 
 # This is required for the collie machine only as all stacks in that
 # machine seem to be set to executable by the toolchain. If someone
@@ -44,7 +50,7 @@ RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
 
 PV = "0.0+1.0rc3+svnr${SRCPV}"
-PR = "r27"
+PR = "r0"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
 DEFAULT_PREFERENCE_shr = "1"
@@ -71,7 +77,6 @@ EXTRA_OECONF = " \
 	--enable-mencoder \
 	--disable-gui \
 	--enable-largefiles \
-	--disable-linux-devfs \
 	--disable-lirc \
 	--disable-lircc \
 	--disable-joystick \
@@ -82,7 +87,6 @@ EXTRA_OECONF = " \
 	--enable-tv-v4l2 \
 	--disable-tv-bsdbt848 \
 	--enable-rtc \
-	--enable-network \
 	--disable-smb \
 	--enable-live \
 	--disable-dvdnav \
@@ -109,10 +113,7 @@ EXTRA_OECONF = " \
 	--disable-xvid \
 	--disable-x264 \
 	\
-	--disable-libavutil_so \
-	--disable-libavcodec_so \
-	--disable-libavformat_so \
-	--disable-libpostproc_so \
+	--disable-ffmpeg_so \
 	\
 	--enable-tremor-low \
 	\
@@ -141,7 +142,6 @@ EXTRA_OECONF = " \
 	--disable-dxr2 \
 	--disable-dxr3 \
 	--disable-dvb \
-	--enable-dvbhead \
 	--disable-mga \
 	--disable-xmga \
 	--enable-xv \
@@ -177,7 +177,7 @@ EXTRA_OECONF = " \
 	--disable-sunaudio \
 	--disable-win32waveout \
 	--enable-select \
-	--enable-libvpx-vp8-lavc \
+	--disable-libvpx-lavc \
 	\
 	--extra-libs=' -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++' \
     --enable-protocol='file_protocol pipe_protocol http_protocol rtmp_protocol tcp_protocol udp_protocol' \
@@ -226,6 +226,21 @@ do_configure() {
 	sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure
 	sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile
 
+	# Ensure matching ffmpeg revision in sub repositories of mplayer source
+	#
+	# It seems that the directories which are fetched from other repositories
+	# get always the newest revision. This is not good for this build since
+	# mplayer and ffmpeg code needs to fit.
+	# So we go to the subdirs and checkout the ffmpeg revision fitting our
+	# mplayer rev.
+	cd ffmpeg && \
+	svn up -r 25825 && \
+	cd ..
+
+	# This patch needs to be applied after updating the svn:external dir of
+	# ffmpeg to the correct revision to make it crosscompile for arm
+	patch -p1 < ${WORKDIR}/fix-arm-compilation.p
+
 	export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
 	./configure ${EXTRA_OECONF}
 	
-- 
1.7.1




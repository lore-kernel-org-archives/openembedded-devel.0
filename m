Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHMu-0007dH-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so496708eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=svGKqlbmp2Oua7UY7MrRUaWiRMIX60AhuJQc0qG9l68=;
	b=jzYb1LB8Gh2NUcZtO1JyQOnntT/iJbgjZBcu+TMcMZBRZS10n7o4dznG87MqCLnnYA
	bbQrKVFrqRTVkeRG6rJxYJWEa2sgus8P7/R8vVu71C98O124AWFON9OFrvGH82/oZQKK
	1VLrjNQQ0bElBia1903Ovf7OhEg+O2coCIc6E=
Received: by 10.14.49.133 with SMTP id x5mr1146170eeb.35.1326361640396;
	Thu, 12 Jan 2012 01:47:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 15sm17480535eeu.1.2012.01.12.01.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:47:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:21 +0100
Message-Id: <d792afdefcacc3ff660348d7be3b3f2a802ae163.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
References: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 7/7] libav, libvpx, mplayer2: drop work around for gcc-4.6 ICE, no need to pass -fno-tree-vectorize now
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
X-List-Received-Date: Thu, 12 Jan 2012 09:54:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libav/libav.inc         |    4 ++--
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++--
 meta-oe/recipes-multimedia/webm/libvpx.inc         |   15 ++-------------
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 89b14ca..2e3d1c9 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET = "arm"
 # faac faad2 lame schroedinger libgsm
 DEPENDS = "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools pkgconfig
 
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations  -fno-tree-vectorize -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 2a2d8af..7ed9055 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -21,7 +21,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 PARALLEL_MAKE = ""
 
@@ -130,7 +130,7 @@ EXTRA_OECONF = " \
 EXTRA_OECONF_append_armv6 = " --enable-armv6"
 EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math -fno-tree-vectorize"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 CFLAGS_append = " -I${S}/libdvdread4 "
diff --git a/meta-oe/recipes-multimedia/webm/libvpx.inc b/meta-oe/recipes-multimedia/webm/libvpx.inc
index 8434f38..31dafb8 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx.inc
+++ b/meta-oe/recipes-multimedia/webm/libvpx.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "BSD"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2"
 S = "${WORKDIR}/libvpx-v${PV}"
@@ -10,18 +10,7 @@ S = "${WORKDIR}/libvpx-v${PV}"
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
 ARM_INSTRUCTION_SET = "arm"
 
-#-ftree-vectorize was causing ICE with gcc-4.6 from meta-oe, see
-# http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/036001.html
-#|     [CC] vpx_scale/generic/gen_scalers.c.o
-#| vpx_scale/generic/gen_scalers.c: In function 'vp8cx_vertical_band_3_4_scale_c':
-#| vpx_scale/generic/gen_scalers.c:537:6: internal compiler error: in vect_get_vec_def_for_stmt_copy, at tree-vect-stmts.c:1390
-#| Please submit a full bug report,
-#| with preprocessed source if appropriate.
-#| See <http://gcc.gnu.org/bugs.html> for instructions.
-#| make[1]: *** [vpx_scale/generic/gen_scalers.c.o] Error 1
-#| make: *** [.DEFAULT] Error 2
-
-CFLAGS += "-fPIC -fno-tree-vectorize"
+CFLAGS += "-fPIC"
 
 export CC
 export LD = "${CC}"
-- 
1.7.8.3




Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 15709731D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:00:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 16 Jun 2016 04:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,480,1459839600"; d="scan'208";a="998855112"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 Jun 2016 04:00:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2016 14:00:05 +0300
Message-Id: <1466074806-14158-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] mpg123: remove the recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 11:00:52 -0000

The recipe has been added to oe-core, see https://bugzilla.yoctoproject.org/show_bug.cgi?id=6020

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-multimedia/mpg123/mpg123_1.22.4.bb     | 65 ----------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
deleted file mode 100644
index e6a912b..0000000
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY = "Audio decoder for MPEG-1 Layer 1/2/3"
-DESCRIPTION = "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding library, which can be used by other programs. \
-mpg123 also comes with a command-line tool which can playback using ALSA, PulseAudio, OSS, and several other APIs, \
-and also can write the decoded audio to WAV."
-HOMEPAGE = "http://mpg123.de/"
-BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
-SECTION = "multimedia"
-
-LICENSE = "LGPLv2.1"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
-
-DEPENDS = "audiofile"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "2dfafae3bbc532b4c8b04a77c6a6de89"
-SRC_URI[sha256sum] = "5069e02e50138600f10cc5f7674e44e9bf6f1930af81d0e1d2f869b3c0ee40d2"
-
-inherit autotools pkgconfig
-
-# The options should be mutually exclusive for configuration script.
-# If both alsa and pulseaudio are specified (as in the default distro features)
-# pulseaudio takes precedence.
-PACKAGECONFIG_ALSA = "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
-
-PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
-PACKAGECONFIG[esd] = ",,esound"
-PACKAGECONFIG[jack] = ",,jack"
-PACKAGECONFIG[openal] = ",,openal-soft"
-PACKAGECONFIG[portaudio] = ",,portaudio-v19"
-PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
-PACKAGECONFIG[sdl] = ",,libsdl"
-
-# Following are possible sound output modules:
-# alsa arts coreaudio dummy esd jack nas openal os2 oss portaudio pulse sdl sndio sun tinyalsa win32 win32_wasapi
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', 'alsa', '', d)}"
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'jack', 'jack', '', d)}"
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'portaudio', 'portaudio', '', d)}"
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
-AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
-
-EXTRA_OECONF = " \
-    --enable-shared \
-    --with-audio='${AUDIOMODS}' \
-    --with-module-suffix=.so \
-    ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
-    ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
-"
-
-# The x86 assembler optimisations contains text relocations and there are no
-# upstream plans to fix them: http://sourceforge.net/p/mpg123/bugs/168/
-INSANE_SKIP_${PN}_append_x86 = " textrel"
-
-# Fails to build with thumb-1 (qemuarm)
-#| {standard input}: Assembler messages:
-#| {standard input}:47: Error: selected processor does not support Thumb mode `smull r5,r6,r7,r4'
-#| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
-#...
-#| make[3]: *** [equalizer.lo] Error 1
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.8.1



Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcDIt-0008IO-9D
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Dec 2011 10:45:11 +0100
Received: by wibhq7 with SMTP id hq7so618978wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Dec 2011 01:38:10 -0800 (PST)
Received: by 10.180.14.69 with SMTP id n5mr21266043wic.13.1324201089469;
	Sun, 18 Dec 2011 01:38:09 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d17sm21332252wbh.19.2011.12.18.01.38.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 01:38:08 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Dec 2011 10:38:02 +0100
Message-Id: <1324201082-21542-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] libav, libsdl-image, mplayer2, xbmc: bump PR for libsdl packaging change in OE-core
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
X-List-Received-Date: Sun, 18 Dec 2011 09:45:11 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/libav/libav_git.bb      |    2 +-
 .../libsdl-image/libsdl-image_1.2.10.bb            |    2 ++
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 meta-oe/recipes-multimedia/xbmc/xbmc_git.bb        |    2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav_git.bb b/meta-oe/recipes-multimedia/libav/libav_git.bb
index be20b15..d5480f7 100644
--- a/meta-oe/recipes-multimedia/libav/libav_git.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRCREV = "c6c2dfcf15c1d93b2189adff6f71c5c4b6b05338"
 
 PV = "0.6.2+${PR}+gitr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "git://git.libav.org/libav.git;protocol=git"
 
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
index 8bc9322..25e2030 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
@@ -4,6 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
+PR = "r1"
+
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 72d5754..2a2d8af 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -21,7 +21,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
index af7bbab..e9415cc 100644
--- a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
+++ b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconf
 SRCREV = "379d13c8e9a0e64f1f36b3fb216e5caedb0df73e"
 
 PV = "11.0"
-PR = "r0"
+PR = "r1"
 PR_append = "+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
-- 
1.7.2.5




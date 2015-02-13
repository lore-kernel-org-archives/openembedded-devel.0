Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id AE5C4733C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:31:21 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id F3654F811DC; Thu, 12 Feb 2015 17:31:21 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 17017F811D8;
	Thu, 12 Feb 2015 17:31:17 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 17:31:31 -0700
Message-Id: <1423787491-16213-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH v2] mplayer2: Remove blacklist
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
X-List-Received-Date: Fri, 13 Feb 2015 00:31:24 -0000

mplayer2 no longer needs to be blacklisted as OE-core has moved
to libav_9.16.

[v2] Also update build dependencies to quash QA warnings.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 7c04ff1..d928243 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -3,7 +3,8 @@ SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
            libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
-           libxv virtual/libx11 libass speex faad2"
+           libxv virtual/libx11 libass speex faad2 libpostproc libvorbis \
+	   libxscrnsaver portaudio-v19"
 
 RDEPENDS_${PN} = "mplayer-common"
 PROVIDES = "mplayer"
@@ -13,8 +14,6 @@ RCONFLICTS_${PN} = "mplayer"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
-
 SRC_URI = "git://repo.or.cz/mplayer.git \
     file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
 "
@@ -112,6 +111,7 @@ EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
 PACKAGECONFIG[lame] = ",,lame"
+PACKAGECONFIG[mpg123] = ",,mpg123"
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-- 
1.9.1



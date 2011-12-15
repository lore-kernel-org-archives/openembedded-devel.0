Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbALH-0005b5-7p
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:23:19 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so1718019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v6O93Lx4H9ZXzA0tORYfQEA5Fq9bgB268Or+hqUZ2+A=;
	b=k0IZFgn9OxFftGxL4RvAqaETG4Kw+M1XjYCXk0Nf+63aZj92Gyf9+bD/5rExNzUr8u
	ot2cbb79OpWTNugtZM2K9JzR1mG6MlN+BgqIkutwZsWGfQ5+6Kte2UamdUxSvPkJw4jM
	Fyu/k8CT32rvhNcm14MiR3ION3ibXkxFsc488=
Received: by 10.14.123.73 with SMTP id u49mr1298552eeh.98.1323951383690;
	Thu, 15 Dec 2011 04:16:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm23571288eeh.0.2011.12.15.04.16.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:16:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:15:51 +0100
Message-Id: <4e766bdaa32a21cb016586d133d348e7f641327b.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
References: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323951062.git.Martin.Jansa@gmail.com>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 4/6] mplayer2: drop FULL_OPTIMIZATION_armv7a
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
X-List-Received-Date: Thu, 15 Dec 2011 12:23:19 -0000

* we had -ftree-vectorize instead of -frename-registers here, but that's
  causing ICE with latest gcc-4.6 from meta-oe
* similar to issue in libvpx
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/036001.html
  and lowering to -O3 is not enough in this case
  | libmpcodecs/ad_imaadpcm.c: In function 'qt_ima_adpcm_decode_block':
  | libmpcodecs/ad_imaadpcm.c:177:12: internal compiler error: Segmentation fault
  | Please submit a full bug report,
  | with preprocessed source if appropriate.
  | See <http://gcc.gnu.org/bugs.html> for instructions.
  | make: *** [libmpcodecs/ad_imaadpcm.o] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index ee64ca8..b892420 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -21,7 +21,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 PARALLEL_MAKE = ""
 
@@ -131,7 +131,6 @@ EXTRA_OECONF_append_armv6 = " --enable-armv6"
 EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 CFLAGS_append = " -I${S}/libdvdread4 "
-- 
1.7.8




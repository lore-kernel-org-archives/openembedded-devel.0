Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbBWG-0002w3-Kq
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 14:38:44 +0100
Received: by eekb15 with SMTP id b15so1785813eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=AVeLuXZEf6bpUKm4afzKJ5q1A/sTzxMiz2PNMWL1zcs=;
	b=DkHuS41X8vfzkLcBLY5WOIsFJ26UNmScCZPMDcMhOR0yLOEI3Tx6DmStV8FJwIWP72
	tHi0Xp5FJiM/JW2mRrCj4Zpyzm4PbCSi+WNso2hZMzwyNCL03su5dERtKdIyJ+H/rfA4
	eg8/w2tPz41NwYfxxHJzbt7qbjnMRWKRMHvq8=
Received: by 10.213.28.83 with SMTP id l19mr478682ebc.50.1323955906971;
	Thu, 15 Dec 2011 05:31:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm24305541eeb.4.2011.12.15.05.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 05:31:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 14:31:38 +0100
Message-Id: <1323955898-31477-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <20111215132901.GC4419@jama.jama.net>
References: <20111215132901.GC4419@jama.jama.net>
Subject: [PATCH][meta-oe][meta-efl 4/6] mplayer2: drop FULL_OPTIMIZATION_armv7a and add -fno-tree-vectorize
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
X-List-Received-Date: Thu, 15 Dec 2011 13:38:44 -0000

* we had -ftree-vectorize instead of -frename-registers here, but that's
  causing ICE with latest gcc-4.6 from meta-oe
* qemux86-64 was still failing without -fno-tree-vectorize
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
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index ee64ca8..72d5754 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -21,7 +21,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 PARALLEL_MAKE = ""
 
@@ -130,8 +130,7 @@ EXTRA_OECONF = " \
 EXTRA_OECONF_append_armv6 = " --enable-armv6"
 EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math -fno-tree-vectorize"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 CFLAGS_append = " -I${S}/libdvdread4 "
-- 
1.7.8




Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2K2v-0003YL-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 11:12:37 +0100
Received: by eaae1 with SMTP id e1so812454eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 02:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.45.75 as permitted sender) client-ip=10.14.45.75; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.45.75 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.45.75])
	by 10.14.45.75 with SMTP id o51mr10831290eeb.20.1330423450968 (num_hops
	= 1); Tue, 28 Feb 2012 02:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wAHORzcU7427KuY+6CSNfgSaqjzVJinvdVqhLNiHCZs=;
	b=DbHZ0G5Gir5/CIWZrwlLbbgwFZeVeDpyQY0aUwCAgTQcfBZuXDYWmikeK42t6ecDBB
	Z9YKTKtYb2T5wt5OJV7LZ8AYjxrZVgquNvVVbWLlumkCbplTZ2wDQ1Jz1LFzapuYMrPs
	cTRgcIr4jYGImMeeFK2Fa2Lc4XJZFiYpI0JZ8=
Received: by 10.14.45.75 with SMTP id o51mr8103961eeb.20.1330423450862;
	Tue, 28 Feb 2012 02:04:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r5sm56282909eef.6.2012.02.28.02.04.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 02:04:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 11:04:01 +0100
Message-Id: <1330423441-653-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <jii6me$ae8$2@dough.gmane.org>
References: <jii6me$ae8$2@dough.gmane.org>
Subject: [meta-oe][PATCHv2] mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Tue, 28 Feb 2012 10:12:38 -0000

* virtual/kernel was needed only to provide omapfb.h in staging
  but that's now moved to BSP layers, no need to make sstate hash
  machine specific here.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 3e4d369..0b73d57 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Open Source multimedia player."
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
-DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 virtual/kernel libass \
+DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 libass \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
 RDEPENDS_${PN} = "mplayer-common"
@@ -18,10 +18,10 @@ SRC_URI = "git://repo.or.cz/mplayer.git;protocol=git;branch=master \
 
 SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 
-ARM_INSTRUCTION_SET = "ARM"
+ARM_INSTRUCTION_SET = "arm"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.8.5




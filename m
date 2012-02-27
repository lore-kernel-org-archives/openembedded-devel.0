Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S25me-0001Tg-BC
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 19:58:52 +0100
Received: by eekc1 with SMTP id c1so540638eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.21.145 as permitted sender) client-ip=10.213.21.145; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.21.145 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.21.145])
	by 10.213.21.145 with SMTP id j17mr4352819ebb.139.1330368626001
	(num_hops = 1); Mon, 27 Feb 2012 10:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LH2vywWN4NuE03XEJ6yRl9zwpSB+W0T5/32hpxaAHYU=;
	b=E1JQQiteScOAlWgmO/lidmUaHEZFK2UhbB1Iy62vwCyZGweg1giItNPAexgsVRD2UV
	Pguh4tkuk7TOzo5ayYtVg5Si+rPuB61ohNJlMm6tlboSmKHWSK0p9rtEH8VsQF31U+fG
	Ef10b49+yrTAiNtomJLOWFFWqpPBajQi3n9h8=
Received: by 10.213.21.145 with SMTP id j17mr3285071ebb.139.1330368625848;
	Mon, 27 Feb 2012 10:50:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm60837624eei.3.2012.02.27.10.50.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 10:50:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Feb 2012 19:50:17 +0100
Message-Id: <1330368617-28664-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH] mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Mon, 27 Feb 2012 18:58:52 -0000

* virtual/kernel was needed only to provide omapfb.h in staging
  but that's now moved to BSP layers, no need to make sstate hash
  machine specific here.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 3e4d369..fd25ec0 100644
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
@@ -18,7 +18,7 @@ SRC_URI = "git://repo.or.cz/mplayer.git;protocol=git;branch=master \
 
 SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 
-ARM_INSTRUCTION_SET = "ARM"
+ARM_INSTRUCTION_SET = "arm"
 
 PV = "2.0+gitr${SRCPV}"
 PR = "r7"
-- 
1.7.8.4




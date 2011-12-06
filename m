Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXsUQ-0006nq-FF
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:43:10 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1404220eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WKtbyzCPwBnx1Ppo4/f0u+NuGe878pOaAEuSFqG7iD0=;
	b=tPuKsQYKx8BSpmAjNFDkb4pdKdUZdLKC/XeTmdaVXiW6QgHobpvdOPvVLuPORXPvic
	CZCDbJD/YmG/xieM8AueVdpPqqJAJP4BHV6CK4pb8SGG86BjN0uAoOHhzWKpHuDXDeui
	Hpj9mmCp9WLoaAiEURCPX1U6F8oO7hQsAlIMY=
Received: by 10.213.28.84 with SMTP id l20mr2129210ebc.15.1323167785581;
	Tue, 06 Dec 2011 02:36:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm58441626eej.3.2011.12.06.02.36.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:36:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 11:36:06 +0100
Message-Id: <fb9962ec22c635742587cffde6019bc09a27e785.1323167378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
References: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323167378.git.Martin.Jansa@gmail.com>
References: <cover.1323167378.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/5] mplayer2: enable mplayer-common
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
X-List-Received-Date: Tue, 06 Dec 2011 10:43:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index f3b254e..7d2d258 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 virtual/kernel libass \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
-#RDEPENDS_${PN} = "mplayer-common"
+RDEPENDS_${PN} = "mplayer-common"
 PROVIDES = "mplayer"
 RPROVIDES_${PN} = "mplayer"
 RCONFLICTS_${PN} = "mplayer"
@@ -22,7 +22,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.8




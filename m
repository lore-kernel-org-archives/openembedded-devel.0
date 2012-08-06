Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyNgA-0007Q1-0R
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 15:49:06 +0200
Received: by wibhm2 with SMTP id hm2so1395701wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=s1yPX2sYv/x5jUO5CkGU9DRtvnLJzAIvVc98CQ8lNdo=;
	b=TsIqVMc088lc2D/KlMk1NJ/2hqugSL0X9ebMErYaI3nVuhLG74IZQINxiRrcLJybiX
	HVfiXOyi2icFcqXTZFROjmB0WyBrZR+Rjd0I68Pd6n4w8iL811fI0DqYu0SsFmcQcOJJ
	Rvz2AokFCLFdBNXovukMW0hDi6CBRIJv3YNQxSu/qhmerzs1CmimTp1gYUsvTqANHlek
	mi2j4s+i2G5S+vbEzH2nedh/wt3EsgivQ4+LfWLyoEzkezQWDoOqoC5aTutgaqYhq1js
	/qAn1+wuLPNrMdtDH6cG3SjQZ/97bXRRGZ5hKJql3v7UwfEGq43hIc06abi1+gN/pH1x
	hmuA==
Received: by 10.180.74.33 with SMTP id q1mr18609786wiv.4.1344260241480;
	Mon, 06 Aug 2012 06:37:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm23030885wiz.9.2012.08.06.06.37.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 06:37:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2012 15:37:05 +0200
Message-Id: <ff254021618293951092f604ff1a7524b3bbc8a1.1344259248.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1344259248.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/12] mplayer2: enable speex
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
X-List-Received-Date: Mon, 06 Aug 2012 13:49:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 0b73d57..e2aadf5 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "Open Source multimedia player."
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
-DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 libass \
+DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
+           libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame \
+           libxv virtual/libx11 libass speex \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
 RDEPENDS_${PN} = "mplayer-common"
@@ -21,7 +23,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "arm"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 PARALLEL_MAKE = ""
 
@@ -74,7 +76,7 @@ EXTRA_OECONF = " \
 	--disable-real \
 	--disable-xvid \
 	\
-	--disable-speex \
+	--enable-speex \
 	--enable-theora \
 	--disable-ladspa \
 	--disable-libdv \
-- 
1.7.8.6




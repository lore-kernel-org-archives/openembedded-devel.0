Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nz0-0002GR-IL
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:50 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so769511eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.194.134 as permitted sender) client-ip=10.14.194.134; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.194.134 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.194.134])
	by 10.14.194.134 with SMTP id m6mr11482536een.4.1330438585523 (num_hops
	= 1); Tue, 28 Feb 2012 06:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2DGeuEyvjinEcwZEOn+aIchKgDSOPEgRvUKJVLGWPU0=;
	b=VskAeTRQfGVhY0Q9NMuMBK3F8runIdiA/7hiGGs6MG/hjtzauRi/eFIVHDMQ36kMB/
	TzWS25L89ItAgpbfEHqDLthQVBSFcWyyMQGI8V7QpXPO50B5bOBVaNdYz7r2LFXnvWm8
	kR3aB06igxFrrxILDJUJVZP3Iycowx7wLMD+w=
Received: by 10.14.194.134 with SMTP id m6mr8572186een.4.1330438585452;
	Tue, 28 Feb 2012 06:16:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm70803889eei.3.2012.02.28.06.16.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:16:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:45 +0100
Message-Id: <c88148dbd0f43df0b0af4643a024280b9c683356.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 14/14] mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:50 -0000

* virtual/kernel was needed only to provide omapfb.h in staging
  but that's now moved to BSP layers, no need to make sstate hash
  machine specific here.
* s/ARM/arm/ is just cosmetic change because classes are testing only
  '== "thumb"' so it works the same with ARM but mplayer2 was only
  recipe using it uppercase

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




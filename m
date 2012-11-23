Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLi-0007P4-Ac
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:26 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id F341E4A028;
	Fri, 23 Nov 2012 16:25:28 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:41 +0100
Message-Id: <1353684287-19180-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 3/9] mplayer2: move lame into ENTERPRISE_DISTRO check
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
X-List-Received-Date: Fri, 23 Nov 2012 15:39:27 -0000

Lame was in two places in build dependencies.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 4e3c18b..685a0bb 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Open Source multimedia player."
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
-           libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame \
+           libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
            libxv virtual/libx11 libass speex \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
-- 
1.8.0




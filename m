Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0uGp-0000OF-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 14:33:41 +0100
Received: by mail-pb0-f41.google.com with SMTP id ro12so1611876pbb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=S6Iz9km2NiaLdA2Tb2CgVAP+B+HKn8CnIcYm3+8XNaI=;
	b=odPnhIuyfrYeoqRzFa1nDSrutEAXUwJ5J30qz5YWL7RC2D8DDdsiwRWtf39L1YB2jH
	w9kv6yoz31qnY9fdT/rbB1KLI+t7eqz+3jPq31O2539hpzAvYvDu1AQB/dILydWhcOw1
	DysbxL6HFtlTqR6PqoHYrWAyEpLAiqiKw85mMctRJvwD/THOA61qTbiK/MDOJP2GDQv+
	mltFrfH+TXWdCkBVnvnmn+xbgGyoHFncHZXZl6c2hAwjw0Df+hiSXcU2H6XbNmwe/coX
	mcoeaUf16/xNS+dRFktRw0AoG5WdVOyWPmTSMiiEZ9aSW9WuA9K6JcvMeFje2ewqguUe
	MZOA==
X-Received: by 10.68.213.233 with SMTP id nv9mr21983160pbc.155.1359638275904; 
	Thu, 31 Jan 2013 05:17:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mz10sm5000043pbc.37.2013.01.31.05.17.53
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:17:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jan 2013 14:17:48 +0100
Message-Id: <1359638269-28437-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-oe][meta-gnome 1/2] mplayer2: add faad2 to DEPENDS
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
X-List-Received-Date: Thu, 31 Jan 2013 13:33:41 -0000

* it's autodetected from sysroot after faad2 is built

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 685a0bb..e980f55 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -3,7 +3,7 @@ SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
            libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
-           libxv virtual/libx11 libass speex \
+           libxv virtual/libx11 libass speex faad22 \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
 RDEPENDS_${PN} = "mplayer-common"
-- 
1.8.1.2




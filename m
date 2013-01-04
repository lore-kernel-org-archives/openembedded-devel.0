Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6V8-0008RV-3X
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ea0-f169.google.com with SMTP id a12so6874140eaa.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=pGtBWPXACxj3WKNokMs3rEqOEJQbPWbSBtTp/KvWSls=;
	b=yxkHS1OuGp8VWpOMJYi7iEfGxU5wAH2Q9Fg+q+sWJpeHRk21dsx+7JusLwtd7/PIe/
	AGDT4RuT+1B9cQITLWw2Lpblh6Hv4mX5iqVF2+ZmqaYbTKKh93CZ+DxY8Xh5ZpR9RHUV
	n4jz6EiS8RD5We5E6hQXo1sMYWhqOKeiqkzzP3dDENtExlxdG/6huGF7oU50esvsg7iK
	T93RkyUePNetyeHdBt0v829BEW+ZrPxFDARkKMaNwdv9AUYUv6qjlyS9P+wnK43+AJAy
	gTyi+aHMK70MRmTutpYGZxawvaHUldJT5qIcRAvz9BfPvU4cYNjOxEWpRS0MvML1YDPB
	ViDg==
X-Received: by 10.14.176.66 with SMTP id a42mr142793531eem.34.1357302049337;
	Fri, 04 Jan 2013 04:20:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm110283730eek.0.2013.01.04.04.20.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:34 +0100
Message-Id: <5339afed0de9cbc7b6c2ebd78449e722c00f8c74.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 4/6] mplayer2: move lame into ENTERPRISE_DISTRO check
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
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

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
1.8.0.2




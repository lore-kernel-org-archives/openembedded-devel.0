Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTj-0004Ay-Pj
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:51 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so267559yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SVwQfh5NrKQKw5t5G/gH8qMDLBtcdLcbZfJ7Vwdhpkc=;
	b=YjfbiIt05uA1289bceBTfxpV5OdusvlV6PwpssxuJKCjcc16wTpEqr4p4G10dKDaxh
	GbjHPlyh7eEW9ccRsBW++0UNUaLK4zAxcNXY3z+YW+qX5ain1NpBBanJDXcBMbcresM1
	2raJu9eMW+F58ImlGHNjS0zYSUYZ2qUd+AcwI=
Received: by 10.236.175.65 with SMTP id y41mr7957869yhl.26.1323825057447;
	Tue, 13 Dec 2011 17:10:57 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:10:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:32 +0000
Message-Id: <7584f3ae6fa8bf87f3b52dffb65851868c0e127f.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/8] mplayer2_git.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 81d3376..ee64ca8 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Open Source multimedia player."
 SECTION = "multimedia"
-PRIORITY = "optional"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 virtual/kernel libass \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
-- 
1.7.2.5




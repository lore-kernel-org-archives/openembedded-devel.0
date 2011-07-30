Received: from [209.85.161.47] (helo=mail-fx0-f47.google.com)
	by linuxtogo.org with esmtp (Exim 4.72) id 1QnCFg-0006AY-VN
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 18:19:01 +0200
Received: by fxg11 with SMTP id 11so3613087fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=kt5XqejqlZoMAz6oIfvebtG0DCYwnn84sjzSEjQWwK0=;
	b=uPvqPlT71OUUFx+ZX1AN9VlzW0PxqnntD5vlwud3jttn+dOVtZtPwvNJl8JhX+vv61
	yS2QSLV2676X5buTn6xwO5wZO5/NcOiQ8vJGy8qWrQnAh9CqB3CvxtqGhRlkDNbGU3U/
	d/5aqoG4rZAcFbxansqbJc93j35wJK+Nfo+8U=
Received: by 10.223.17.151 with SMTP id s23mr3651264faa.13.1312042483170;
	Sat, 30 Jul 2011 09:14:43 -0700 (PDT)
Received: from localhost.localdomain (pD957DCCB.dip.t-dialin.net
	[217.87.220.203])
	by mx.google.com with ESMTPS id q5sm1766576fah.30.2011.07.30.09.14.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Jul 2011 09:14:41 -0700 (PDT)
From: Josua Mayer <josua.mayer97@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jul 2011 18:14:21 +0200
Message-Id: <1312042461-5212-1-git-send-email-user@server.WORKGROUP>
X-Mailer: git-send-email 1.7.5.3
MIME-Version: 1.0
Subject: =?UTF-8?B?W++/vVBBVENIXSBtcGxheWVyOiBmaXggbGlua2VyIGVycm9y?=
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
X-List-Received-Date: Sat, 30 Jul 2011 16:19:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: = <=>

* use already existing patch fix-emu_qtx_api.diff
---
 recipes/mplayer/mplayer_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
index 259ce99..5f15618 100644
--- a/recipes/mplayer/mplayer_git.bb
+++ b/recipes/mplayer/mplayer_git.bb
@@ -8,6 +8,7 @@ DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib li
 RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "git://repo.or.cz/mplayer/glamo.git;protocol=git;branch=mplayer2 \
+	file://fix-emu_qtx_api.diff \
    "
 
 SRC_URI_append_armv7a = " \
-- 
1.7.5.3




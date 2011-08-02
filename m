Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1QoKM7-0004Vt-RU
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 21:10:20 +0200
Received: by fxg11 with SMTP id 11so138068fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0p+ILIw9hAaJXP0F4fFTwyTAcsq2ToSjWiRan97DMqM=;
	b=BvCO4SXQed/n/HratchdU9weF3+2RFKDifUOqCWXc+fsidKAt/uzeyhmKW1BVV4qKC
	KUGOJN5sadkOJBSH9ICFHmeAFxQHUK6Zsid+rLBLuwQA64sUXJgiCBJOVGgu13h//gcw
	cw6E3wi3tCCe32dMAjcQINIqw0xH7Jlkw1804=
Received: by 10.223.76.202 with SMTP id d10mr8678596fak.106.1312311958623;
	Tue, 02 Aug 2011 12:05:58 -0700 (PDT)
Received: from localhost.localdomain (pD957CD12.dip.t-dialin.net
	[217.87.205.18])
	by mx.google.com with ESMTPS id x13sm38617fah.5.2011.08.02.12.05.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 12:05:56 -0700 (PDT)
From: Josua Mayer <josua.mayer97@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2011 21:05:49 +0200
Message-Id: <1312311949-3788-1-git-send-email-josua.mayer97@googlemail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH v2] mplayer_git: fix linker error
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
X-List-Received-Date: Tue, 02 Aug 2011 19:10:20 -0000

* fix undefined references  in loader/module.o:
  module.c:(.text+0xd60): undefined reference to `report_entry'
  module.c:(.text+0xd6a): undefined reference to `report_ret'
  module.c:(.text+0xd74): undefined reference to `wrapper_target'
  module.c:(.text+0xd7a): undefined reference to `wrapper'
  and more of these
* Apply already existing patch fix-emu_qtx_api.diff
  This patch was already used in mplayer_svn but is needed
  for the git version too.

Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
---
 recipes/mplayer/mplayer_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
index 259ce99..995884b 100644
--- a/recipes/mplayer/mplayer_git.bb
+++ b/recipes/mplayer/mplayer_git.bb
@@ -8,7 +8,8 @@ DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib li
 RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "git://repo.or.cz/mplayer/glamo.git;protocol=git;branch=mplayer2 \
-   "
+           file://fix-emu_qtx_api.diff \
+          "
 
 SRC_URI_append_armv7a = " \
 	   file://0001-video-out-for-omapfb-support.patch \
-- 
1.7.5.3




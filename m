Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U52Rh-0000JN-6d
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 00:05:57 +0100
Received: by mail-ee0-f52.google.com with SMTP id b15so3300956eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=0jdH5LkHP7D/Uf1xMd61KbgfM9NpLnmvFS1Ir4Zj38k=;
	b=JvOESxrixQJqWi1JCfoTf2idZ4PWEJAVg0EznbsIuPsjD0m/TZBC1kMpNfLuVh+Q1O
	OaRJhSHYX/BltbZOgaVqxtVo+lIIqF0K/6DwP6KGon/4YujMhit1s5qDHuPI02Q1Hud7
	KAJFCgWCklT9eCcQZ9bJ2ghwCnny8oYVZbm4t+/RK6GMrjDtNWg7DomwY0T12LBwB60C
	6nCQKwjyzLvj/BOo0zHrywntu04gnC9TGUToiDozMMwoVafHnje7y+OVB7Yqa/vaXbpG
	ZwuqnvEZkQOwCZ9trxZEEWUoU80U4SyeqTsIEU+eMmm+BCunV0PyjlV/JNTn0+b/eZZL
	UNaQ==
X-Received: by 10.14.220.1 with SMTP id n1mr54758901eep.16.1360622998883;
	Mon, 11 Feb 2013 14:49:58 -0800 (PST)
Received: from localhost.localdomain (p4FDF102E.dip.t-dialin.net.
	[79.223.16.46])
	by mx.google.com with ESMTPS id l8sm30910395een.10.2013.02.11.14.49.57
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:49:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 23:49:36 +0100
Message-Id: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe, V2 0/3] replace meta-oe's update-fonts.bbclass by oe-core's fontcache.bbclass
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
X-List-Received-Date: Mon, 11 Feb 2013 23:05:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 61911b23099c2658186179504ded318c987b5276:

  ttf: introduce update-fonts bbclass and change all ttf recipes to use it (2013-02-06 15:16:01 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git font-cache

Andreas Müller (3):
      ttf-fonts: inherit oe-core's fontcache.bbclass instead of update-fonts
      update-fonts.bbclass: remove - we now use oe-core's fontcache.bbclass
      font-update-common: remove

 meta-oe/classes/update-fonts.bbclass               |   40 --------------------
 .../font-update-common/update-fonts                |    4 --
 .../font-update-common/font-update-common_0.1.bb   |   18 ---------
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    4 +-
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    4 +-
 .../ttf-fonts/ttf-liberation_0.2.bb                |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    7 +--
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    4 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |    4 +-
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    4 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    2 +-
 14 files changed, 21 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/classes/update-fonts.bbclass
 delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-update-common/update-fonts
 delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb

-- 
1.7.4.4




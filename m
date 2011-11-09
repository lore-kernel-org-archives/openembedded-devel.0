Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCLh-0008HM-Dl
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 18:54:09 +0100
Received: by faat2 with SMTP id t2so2009238faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/Fjy1SY3x5CFx5J7i6z5JN2t82SF9ALKHMqnnx/2pno=;
	b=tHQVtN/lyKdpTF5n71juUu56Gq23i3WcU+Y6RSzS4lvsVK/Q5/dDFvPZwkfteeAqvE
	NF4Ncxma0l+WrzDEICESh+CY18WRp1tA4hBhJ/EpNOQjsYTTgEWKnBVtpJ/ePTW5yIYs
	pM+TYfJfPMm6JUOGwa/vogJidMxsWha4dspiI=
Received: by 10.223.76.197 with SMTP id d5mr6299558fak.13.1320860873836;
	Wed, 09 Nov 2011 09:47:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm7431857faf.14.2011.11.09.09.47.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:47:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:47:49 +0100
Message-Id: <cover.1320860740.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [meta-oe 0/4] Small fixes, move kbd and libsdl to oe-core
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
X-List-Received-Date: Wed, 09 Nov 2011 17:54:09 -0000

Patches 3 and 4 depend on oe-core patchset
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012397.html

The following changes since commit dd54be4a2fc0f0597a82525fcb97c69539a547c4:

  rsyslog: change postrm to prerm (2011-11-09 14:16:14 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (4):
  mplayer-common: import from OE-classic
  openssl: bump PR to fix license
  libsdl-x11: drop from meta-oe
  kbd: move to oe-core

 .../recipes-connectivity/openssl/openssl_0.9.8m.bb |    2 +-
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |    2 +-
 meta-oe/recipes-core/kbd/kbd_1.15.2.bb             |   19 --------------
 meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc  |   27 --------------------
 .../recipes-graphics/libsdl/libsdl-x11_1.2.14.bb   |   18 -------------
 .../recipes-multimedia/mplayer/mplayer-common.bb   |   22 ++++++++++++++++
 .../mplayer/mplayer-common/mplayer.conf            |   15 +++++++++++
 7 files changed, 39 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/recipes-core/kbd/kbd_1.15.2.bb
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-x11_1.2.14.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf

-- 
1.7.8.rc1




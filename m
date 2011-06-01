Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRsnO-0000n1-RP
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 23:17:43 +0200
Received: by fxm19 with SMTP id 19so400155fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=iOwJxWXimRdMczDNMV/4Yuv2Z4FsyC+gQJj5A77FG/Q=;
	b=LZCWPPFWcxjzudrarsVKL2NmftOXePzGKhPpR0cJ+Qa01rzMIpNnkNH5ihisFtqV1n
	+4Nrs0L33yF0S+UrRjV9X/RJpNN43iawokzsmswbqiKjY+OcYGeB+aYtZEO295y9g94M
	JvOWNDxVjtLJr1OR7yeLAY+cGeLMmzlYN5Fgg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RPI0Qz9B7vhSTP3PnBAIbI9eSM5YBv3JJusDoD0HFFAsXyN0qhuKw/Q7lZIJBDLh/m
	iSCug9HX1z998hLCnXn+qSIAOFY1uG2EmvcJZ27xPceM6k99268cmQGZkv30eLP4lzgN
	NkONvYeXXqeC9codpmmp8hh3Rnzir17ya5fJ4=
Received: by 10.223.57.86 with SMTP id b22mr1237643fah.95.1306962871790;
	Wed, 01 Jun 2011 14:14:31 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r10sm537261fah.26.2011.06.01.14.14.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 14:14:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 23:14:26 +0200
Message-Id: <cover.1306962838.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [meta-oe][PATCH 0/2] Pull request #15
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
X-List-Received-Date: Wed, 01 Jun 2011 21:17:43 -0000

Initial bits are already in oe-core so it's time to push this too.

The following changes since commit 7da05acc4665dcfcd008e6ce698169b8e9503b33:

  udev-extra-rules: remove modprobe rule, it has moved back to udev (2011-05-31 20:37:45 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/allarch
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/allarch

Martin Jansa (2):
  siteinfo: add allarch-linux target
  recipes: use allarch.bbclass instead just PACKAGE_ARCH = all

 .../recipes-efl/e17/illume-keyboards-shr_git.bb    |    4 ++--
 meta-oe/classes/siteinfo.bbclass                   |    1 +
 meta-oe/recipes-extended/tzdata/tzdata.inc         |    4 ++--
 .../font-update-common/font-update-common_0.1.bb   |    4 +++-
 .../recipes-graphics/tasks/task-fonts-truetype.bb  |    4 ++--
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    2 +-
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    2 +-
 .../ttf-fonts/ttf-liberation_0.2.bb                |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    2 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.69.bb       |    2 +-
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    1 +
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    2 +-
 .../xserver-common/xserver-common_1.34.bb          |    4 ++--
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    4 ++--
 .../ca-certificates_20090814+nmu2.bb               |    2 +-
 meta-oe/recipes-support/fbset/fbset-modes.bb       |    4 ++--
 .../mime-support/mime-support_3.44.bb              |    4 ++--
 .../recipes-support/poppler/poppler-data_0.4.0.bb  |    5 ++---
 22 files changed, 32 insertions(+), 29 deletions(-)

-- 
1.7.5.3




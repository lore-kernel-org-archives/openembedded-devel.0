Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhTK-0005jX-Ca
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:32:54 +0200
Received: by weyr6 with SMTP id r6so5030562wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=noBL71YdfolF/OVisjyZrxcxhogXhz/fUzCqLjEBghU=;
	b=b4bflctWETLBiF+68MQBdf2z8e2M90YtsyoXMrebzepdcZJkcEaiQFwnmnMLh9NQqX
	hfynYNJKIqMdLs2SQlhk3wWG0I9Gcf1vz2rmqUhorAbvMZnnwRODcm+lyM4fPo/dbRIf
	YQKlDer2v4tuoUz7f/Igbuxx+YoWzCKQTeikFrzH/xEnzO04xCSWSjY2hyp4/p6NNTx3
	2MONp8KHx0Oy2yvJUtUafXrRXMB4t4zl8MfRpyARW1ijXneegxIKawnuomm2E3LZVWyc
	x6mL5N/2ElYAPUWSEqjtuQfhzipKAJ/2hVDqJ6gT5DpQwOjYtknwf6yl9Sk1RcTHPnIj
	49xA==
Received: by 10.217.1.206 with SMTP id n56mr5380777wes.151.1343859675794;
	Wed, 01 Aug 2012 15:21:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm37075036wid.0.2012.08.01.15.21.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:20:57 +0200
Message-Id: <cover.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 0/8] Merge some recipes from oe-classic and smaller fixes
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
X-List-Received-Date: Wed, 01 Aug 2012 22:32:54 -0000

The following changes since commit 5a5198ff6eccb097b785c22a256a072a41c7f2cd:

  gedit: unbreak build by adding pythonnative to inherit (2012-07-31 13:22:31 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (8):
  fbreader: drop machine overrides
  emacs: rename TUTORIAL.ko to TUTORIAL.KO so it's not picked by
    package.bbclass for striping
  emacs: copy only needed stuff to qemu-treedir, not whole sysroot
  phonet-utils: simplify with inherit autotools
  sip: import from oe-classic and upgrade to latest
  python-sip: import from oe-classic and upgrade to latest
  python-pyqt: import from oe-classic
  anki: import from oe-classic and upgrade to latest

 .../phonet-utils/phonet-utils_git.bb               |   10 +-
 .../python-pyqt-4.8.4/assistantclient-fix.patch    |   13 +
 .../python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff |   15 ++
 .../python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff |   29 +++
 .../python/python-pyqt-4.8.4/pyqt-generated.patch  |   24 ++
 .../python-pyqt-4.8.4/qreal_float_support.diff     |  248 ++++++++++++++++++++
 .../recipes-devtools/python/python-pyqt_4.8.4.bb   |  115 +++++++++
 meta-oe/recipes-devtools/python/python-sip.inc     |   42 ++++
 .../recipes-devtools/python/python-sip_4.13.3.bb   |    1 +
 .../no-need-for-pyqt-at-buildtime.patch            |   23 ++
 meta-oe/recipes-extended/anki/anki.inc             |   16 ++
 meta-oe/recipes-extended/anki/anki_1.2.11.bb       |    4 +
 .../no-need-for-pyqt-at-buildtime.patch            |   14 ++
 meta-oe/recipes-extended/anki/libanki_1.2.11.bb    |    6 +
 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb  |   33 +++
 meta-oe/recipes-support/emacs/emacs.inc            |   80 ++++++-
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |    2 +
 .../recipes-support/fbreader/fbreader_0.12.10.bb   |    5 -
 meta-oe/recipes-support/fbreader/fbreader_git.bb   |    4 -
 19 files changed, 657 insertions(+), 27 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/assistantclient-fix.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/pyqt-generated.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/qreal_float_support.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.8.4.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-sip.inc
 create mode 100644 meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
 create mode 100644 meta-oe/recipes-extended/anki/anki-1.2.11/no-need-for-pyqt-at-buildtime.patch
 create mode 100644 meta-oe/recipes-extended/anki/anki.inc
 create mode 100644 meta-oe/recipes-extended/anki/anki_1.2.11.bb
 create mode 100644 meta-oe/recipes-extended/anki/libanki-1.2.11/no-need-for-pyqt-at-buildtime.patch
 create mode 100644 meta-oe/recipes-extended/anki/libanki_1.2.11.bb
 create mode 100644 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb

-- 
1.7.8.6




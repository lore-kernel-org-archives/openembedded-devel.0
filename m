Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6Ff-0006fd-GN
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:34:59 +0200
Received: by faas16 with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PfMI06YJWOhdlSa4z1vbsu32fkBdVKZQYMIstfLccWE=;
	b=HqjjyxZeRgKBbJR5ENo8GNTnz3R5tInkhrmLMStRK+nQwLnEUf76vbbX9s03AUiAHa
	0JuZb2Pcm9haUPNp6N9QSLoZmpIF1dmiMDiV0Wp8Yz7hDqUV5NRAbxPTy2BBFj/jsQkC
	fjiiONfhJG7/LSLHr2Oq6uBFvq7gB7I0TARc8=
Received: by 10.223.17.23 with SMTP id q23mr12984424faa.11.1319884137147;
	Sat, 29 Oct 2011 03:28:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm23340504faf.14.2011.10.29.03.28.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:28:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:28:50 +0200
Message-Id: <cover.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [meta-efl][meta-oe 00/12] EFL upgrade and few small fixes and additions
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
X-List-Received-Date: Sat, 29 Oct 2011 10:34:59 -0000

The following changes since commit c60bf558fa16034f7b010dc3e5862a1d3eb6c6d4:

  xfce4-datetime-plugin: Initial add git (0.6.1) (2011-10-25 07:02:07 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (2):
  id3lib: Import from openembedded classic
  liblinebreak: import from openembedded classic

Klaus Kurzmann (1):
  xserver-common_1.34: patch Xserver to add support for gta04

Martin Jansa (9):
  midori: fix build with dirty vala
  navit: upgrade to latest SRCREV and remove navit-icons
  xserver-nodm-init: set USER and HOME
  e-base: bump EFL_SRCREV and refresh patches and elementary version
  elsa: add new login manager for Enlightenment
  task-x11-server: import from Angstrom
  task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be
    able to select different -common and init providers
  systemd-serialgetty: use better default SERIAL_CONSOLE
  elfe: add another patch to fix API changes

 meta-efl/classes/e-base.bbclass                    |    2 +-
 ...update-again-to-even-newer-elementary-API.patch |  105 ++++++
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +
 meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch   |   12 -
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   44 ++-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    1 -
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    3 +-
 meta-efl/recipes-efl/efl/elsa_svn.bb               |   16 +
 .../recipes-connectivity/midori/midori-0.4.1/waf   |  Bin 0 -> 92569 bytes
 .../recipes-connectivity/midori/midori_0.4.1.bb    |    8 +
 .../recipes-core/systemd/systemd-serialgetty.bb    |    2 +-
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb  |   24 ++
 .../tasks/{task-x11.bb => task-x11_1.0.bb}         |   27 +--
 .../xserver-common-1.34/Xserver.gta04.patch        |   32 ++
 .../xserver-common/xserver-common_1.34.bb          |    1 +
 .../xserver-nodm-init-2.0/xserver-nodm             |    7 +
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    2 +-
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |   18 +
 meta-oe/recipes-navigation/navit/navit-icons/GPL-2 |  339 --------------------
 .../navit/navit-icons/configure.in                 |   70 ----
 .../recipes-navigation/navit/navit-icons_svn.bb    |   32 --
 meta-oe/recipes-navigation/navit/navit.inc         |    7 +-
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    6 +-
 .../liblinebreak/liblinebreak_1.2.bb               |   13 +
 24 files changed, 272 insertions(+), 501 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newer-elementary-API.patch
 delete mode 100644 meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch
 create mode 100644 meta-efl/recipes-efl/efl/elsa_svn.bb
 create mode 100755 meta-oe/recipes-connectivity/midori/midori-0.4.1/waf
 create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
 rename meta-oe/recipes-core/tasks/{task-x11.bb => task-x11_1.0.bb} (46%)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
 create mode 100644 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-icons/GPL-2
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-icons/configure.in
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-icons_svn.bb
 create mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb

-- 
1.7.7.1




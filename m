Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9ms-0008GO-34
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:33:39 +0100
Received: by faas16 with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LOaJl80K+BX1DTbxJ5nodUey6NI410mzn6vE2/xmZzg=;
	b=Mrh9Bda82oHKmJYhw5fc52V9MJjT0PyfYHyy6Sx+o8Seh5uFga3LEz2+jAM9Aw+3A0
	3ojrNx1RrS6xKEQ5yj5i3oGQk+0/jW6hxhHRPd/vODSsiRqvSG+yCk6RRIfAj1Sq8mDo
	yMI4G29wtEv+OgVNZyDobpck+H5o35GPdkdrI=
Received: by 10.223.15.10 with SMTP id i10mr35414932faa.17.1320136051975;
	Tue, 01 Nov 2011 01:27:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm43309151fag.21.2011.11.01.01.27.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:27:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:24 +0100
Message-Id: <cover.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [meta-efl][meta-oe 00/15] EFL upgrade and few small fixes and additions, version 2
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
X-List-Received-Date: Tue, 01 Nov 2011 08:33:40 -0000

Version 2 has integrated all review points from ML and 3 patches were added
    pull-15505/0013-meta-efl-e-wm-renice-to-2.patch
    pull-15505/0014-recipes-bump-PR-after-python-upgrade.patch
    pull-15505/0015-gpsd-fix-build-with-python2.7-in-sysroot-and-python2.patch
elfe patch was applied upstream, so I've just bumped SRCREV instead of applying it in oe    
    pull-15505/0010-elfe-bump-SRCREV-to-fix-more-deprecated-API-calls.patch

The following changes since commit 5dc3cb849e4d9f84a2788de9dd096f9c1a5386ea:

  wget: drop from meta-oe, it's in oe-core now (2011-10-31 23:14:41 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (3):
  id3lib: import from openembedded classic, version 3.8.3
  liblinebreak: import from openembedded classic, version 1.2
  meta-efl: e-wm: renice to -2

Klaus Kurzmann (1):
  xserver-common_1.34: patch Xserver to add support for gta04

Martin Jansa (11):
  midori: fix build with dirty vala
  navit: upgrade to latest SRCREV and remove navit-icons
  xserver-nodm-init: set USER and HOME
  e-base: bump EFL_SRCREV and refresh patches and elementary version
  task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be
    able to select different -common and init providers
  systemd-serialgetty: use better default SERIAL_CONSOLE
  elfe: bump SRCREV to fix more deprecated API calls
  elsa: add new login manager for Enlightenment
  task-x11-server: import from Angstrom
  recipes: bump PR after python upgrade
  gpsd: fix build with python2.7 in sysroot and python2.6 on host

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../recipes-devtools/python/python-ecore_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edbus_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 .../python/python-elementary_svn.bb                |    2 +-
 .../recipes-devtools/python/python-emotion_svn.bb  |    2 +-
 .../recipes-devtools/python/python-evas_svn.bb     |    2 +-
 .../recipes-efl/e17/e-wm/enlightenment_start.oe    |    2 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    3 +
 meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch   |   12 -
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   44 ++-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    1 -
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    3 +-
 meta-efl/recipes-efl/efl/elsa_svn.bb               |   16 +
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb      |    2 +
 .../recipes-connectivity/midori/midori-0.4.1/waf   |  Bin 0 -> 92569 bytes
 .../recipes-connectivity/midori/midori_0.4.1.bb    |    8 +
 .../recipes-core/systemd/systemd-serialgetty.bb    |    4 +-
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb  |   23 ++
 .../tasks/{task-x11.bb => task-x11_1.0.bb}         |   27 +--
 .../python/python-cheetah_2.4.4.bb                 |    2 +-
 .../python/python-cython_0.15.1.bb                 |    2 +-
 .../python/python-dateutil_1.4.1.bb                |    2 +-
 .../recipes-devtools/python/python-docutils_0.5.bb |    1 +
 .../recipes-devtools/python/python-lxml_2.2.8.bb   |    1 +
 .../recipes-devtools/python/python-numeric_24.2.bb |    2 +-
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    1 +
 .../recipes-devtools/python/python-pexpect_2.3.bb  |    2 +-
 .../python/python-phoneutils_git.bb                |    2 +-
 .../python/python-pyalsaaudio_0.4.bb               |    2 +-
 .../recipes-devtools/python/python-pyserial_2.4.bb |    2 +-
 .../recipes-devtools/python/python-pyudev_0.11.bb  |    2 +-
 .../recipes-devtools/python/python-pyyaml_svn.bb   |    2 +-
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 .../python/python-sqlalchemy_0.7.1.bb              |    2 +-
 .../recipes-devtools/python/python-tornado_git.bb  |    1 +
 .../python/python-vobject_0.8.1c.bb                |    2 +-
 meta-oe/recipes-graphics/pango/pango.inc           |    2 +-
 .../xserver-common-1.34/Xserver.gta04.patch        |   32 ++
 .../xserver-common/xserver-common_1.34.bb          |    1 +
 .../xserver-nodm-init-2.0/xserver-nodm             |    7 +
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    2 +-
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |   16 +
 .../gpsd/gpsd-2.95/fix-build-with-python2.7.patch  |   15 +
 meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb       |    3 +
 meta-oe/recipes-navigation/navit/navit-icons/GPL-2 |  339 --------------------
 .../navit/navit-icons/configure.in                 |   70 ----
 .../recipes-navigation/navit/navit-icons_svn.bb    |   32 --
 meta-oe/recipes-navigation/navit/navit.inc         |    7 +-
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    6 +-
 .../liblinebreak/liblinebreak_1.2.bb               |   12 +
 meta-oe/recipes-support/pidgin/pidgin.inc          |    2 +-
 53 files changed, 213 insertions(+), 524 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch
 create mode 100644 meta-efl/recipes-efl/efl/elsa_svn.bb
 create mode 100755 meta-oe/recipes-connectivity/midori/midori-0.4.1/waf
 create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
 rename meta-oe/recipes-core/tasks/{task-x11.bb => task-x11_1.0.bb} (46%)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
 create mode 100644 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-icons/GPL-2
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-icons/configure.in
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-icons_svn.bb
 create mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb

-- 
1.7.7.1




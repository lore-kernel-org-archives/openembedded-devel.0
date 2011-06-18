Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0m9-0006tJ-8x
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 21:01:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2011 11:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="17843544"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2011 11:57:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:57:51 +0100
Message-Id: <cover.1308417391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe] [PATCH 0/3] Qt4 tidy up
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
X-List-Received-Date: Sat, 18 Jun 2011 19:01:45 -0000

A few patches to tidy up Qt4 in meta-oe.

The following changes since commit c85efd2281af4556854107768d7583a8208b6647:

  rsyslog: add 5.8.0 (2011-06-17 19:45:58 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib paule/qt4-bbappend
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/qt4-bbappend

Paul Eggleton (3):
  qt4: replace recipes with bbappends
  qmake2: remove qmake2 recipe
  qt4: remove qt4-tools-sdk

 .../recipes-qt/qt4/files/0001-cross-compile.patch  |   36 ---
 .../recipes-qt/qt4/files/0001-fix-mkspecs.patch    |  102 -------
 .../qt4/files/0002-fix-resinit-declaration.patch   |   22 --
 meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch   |   26 --
 .../qt4/files/0006-freetype-host-includes.patch    |   24 --
 .../recipes-qt/qt4/files/0008-qt-lib-infix.patch   |   36 ---
 .../recipes-qt/qt4/files/0009-support-2bpp.patch   |  299 -------------------
 .../files/0010-no-simpledecoration-example.patch   |   14 -
 meta-oe/recipes-qt/qt4/files/common.pro            |  108 -------
 .../recipes-qt/qt4/files/compile.test-lflags.patch |   13 -
 .../recipes-qt/qt4/files/configure-lflags.patch    |   13 -
 meta-oe/recipes-qt/qt4/files/configure-paths.patch |   21 --
 .../recipes-qt/qt4/files/fix-config-tests.patch    |   36 ---
 meta-oe/recipes-qt/qt4/files/g++.conf              |   53 ----
 .../recipes-qt/qt4/files/hack-out-pg_config.patch  |   30 --
 meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf   |   82 -----
 meta-oe/recipes-qt/qt4/files/linux.conf            |   54 ----
 meta-oe/recipes-qt/qt4/files/mips-relocate.patch   |   28 --
 .../recipes-qt/qt4/files/qmake-exists-check.patch  |   18 --
 meta-oe/recipes-qt/qt4/files/qmake-hack.diff       |   15 -
 meta-oe/recipes-qt/qt4/files/qt-config.patch       |   24 --
 meta-oe/recipes-qt/qt4/files/qte.sh                |    7 -
 .../qt4/files/qthelp-lib-qtclucene.patch           |   86 ------
 meta-oe/recipes-qt/qt4/files/use-lflags-last.patch |   22 --
 .../recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2.inc                  |   69 -----
 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb             |   60 ----
 meta-oe/recipes-qt/qt4/qt-4.7.2.inc                |   58 ----
 .../0001-Added-Openembedded-crossarch-option.patch |   44 ---
 meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf           |   60 ----
 .../qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch          |   19 --
 meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf         |   66 ----
 meta-oe/recipes-qt/qt4/qt4-embedded.inc            |   34 ---
 .../qt4-embedded/0006-freetype-host-includes.patch |   20 --
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb       |   10 -
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend |    5 +
 meta-oe/recipes-qt/qt4/qt4-tools-native.inc        |   77 -----
 meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb   |   13 -
 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc     |  111 -------
 .../recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb    |    6 -
 meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc           |   88 ------
 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb      |    8 -
 meta-oe/recipes-qt/qt4/qt4-x11-free.inc            |   20 --
 .../qt4/qt4-x11-free/0003-no-tools.patch           |   18 --
 .../qt4-x11-free/0006-freetype-host-includes.patch |   20 --
 .../qt4-x11-free/0007-openssl-host-includes.patch  |   20 --
 .../qt4/qt4-x11-free/0008-qt-lib-infix.patch       |   34 ---
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb       |   12 -
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend |    5 +
 meta-oe/recipes-qt/qt4/qt4.inc                     |  314 --------------------
 meta-oe/recipes-qt/qt4/qt4_arch.inc                |   25 --
 52 files changed, 10 insertions(+), 2377 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0001-cross-compile.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0001-fix-mkspecs.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0008-qt-lib-infix.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0009-support-2bpp.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/common.pro
 delete mode 100644 meta-oe/recipes-qt/qt4/files/compile.test-lflags.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/configure-lflags.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/configure-paths.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/fix-config-tests.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/g++.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/files/hack-out-pg_config.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/files/linux.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/files/mips-relocate.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qmake-exists-check.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qmake-hack.diff
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qt-config.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qte.sh
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/use-lflags-last.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-native.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0003-no-tools.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0007-openssl-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0008-qt-lib-infix.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4_arch.inc

-- 
1.7.4.1




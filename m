Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S1mY3-0004OK-Eg
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 23:26:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Feb 2012 14:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="70494798"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2012 14:18:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:17:57 +0000
Message-Id: <cover.1330294151.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Qt4 qmake & other fixes
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
X-List-Received-Date: Sun, 26 Feb 2012 22:26:31 -0000

This patchset enables building qmake for the target with other target
utilities. I also fixed a couple of build failures in the process.

In addition I've used the same method to build qmake in the
qt4-tools-nativesdk recipe. This wasn't strictly necessary, however I
think it would be good to be consistent and incidentally the resulting
qmake executable is slightly smaller.

Since the RFC version, a few issues were fixed:
* Ensure the qmake changes work when the platform is different e.g.
  linux-gnueabi-oe-g++ instead of linux-oe-g++
* Install an appropriate environment setup script adapted from the
  former separate qmake2 recipe
* Fix the gcc 4.6 error by fixing the root cause (inability to correctly
  detect the C++ compiler as g++) rather than hacking around it.
* Format some of the patches so they can be used with git am

Thanks to Philip Balister for helping me test the qmake improvements.


The following changes since commit 30253358f5e76fb7b25be27198b4c125e0dbdf2c:

  Quoting fixes (2012-02-26 12:50:36 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qmake-target
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qmake-target

Paul Eggleton (4):
  qt4: fix compile error in Qt 4.8.0 with gcc 4.6
  qt4: build qmake for the target
  qt4-tools-nativesdk: fix build of 4.7.4
  qt4-tools-nativesdk: improve and tidy up qmake build

 meta/recipes-qt/qt4/files/qmake-exists-check.patch |   19 -------
 meta/recipes-qt/qt4/files/target_qmake.patch       |   16 ++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   11 +----
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |   13 +----
 .../qt4/qt-4.8.0/configure_oe_compiler.patch       |   31 ++++++++++++
 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch |   51 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   29 +++++++----
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |    2 +
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   47 ++++++++++++++++--
 12 files changed, 168 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/files/qmake-exists-check.patch
 create mode 100644 meta/recipes-qt/qt4/files/target_qmake.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch

-- 
1.7.5.4




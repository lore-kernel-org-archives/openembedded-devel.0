Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9vyz-00014z-S4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 11:08:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2012 02:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119471941"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 02:59:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 09:59:03 +0000
Message-Id: <cover.1332237450.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe] [PATCH 0/2] Couple of tidy-ups
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
X-List-Received-Date: Tue, 20 Mar 2012 10:08:02 -0000

Remove python-imaging and qmake2 recipes since their functionality is
now in OE-Core.

The following changes since commit b0a7f2e761f79e8967b1d3f7c67177283805bf75:

  systemd: update to v44 + CVE fix (2012-03-18 13:04:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib paule/tidy2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/tidy

Paul Eggleton (2):
  python-imaging: remove
  qmake2: remove

 ...ing-setup.py-force-paths-for-zlib-freetyp.patch |   55 -------
 .../python/python-imaging_1.1.7.bb                 |   41 ------
 .../recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2.inc                  |   72 ---------
 .../recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch   |  152 --------------------
 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff      |   15 --
 meta-oe/recipes-qt/qt4/qmake2/qt-config.patch      |   21 ---
 .../recipes-qt/qt4/qmake2/use-lflags-last.patch    |   22 ---
 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb             |   60 --------
 10 files changed, 0 insertions(+), 440 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 delete mode 100644 meta-oe/recipes-devtools/python/python-imaging_1.1.7.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/qt-config.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/use-lflags-last.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb

-- 
1.7.5.4




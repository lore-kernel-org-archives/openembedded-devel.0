Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhNqm-0007WT-AG
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:29:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2011 08:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,529,1304319600"; d="scan'208";a="25856531"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.207])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2011 08:25:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 16:25:10 +0100
Message-Id: <5678fccae09ea44a2c8ee65ca604882dae3049ea.1310656986.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 3/3] classes: remove qt4e.bbclass
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
X-List-Received-Date: Thu, 14 Jul 2011 15:29:16 -0000

The same version of this class is now in openembedded-core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/classes/qt4e.bbclass |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/classes/qt4e.bbclass

diff --git a/meta-oe/classes/qt4e.bbclass b/meta-oe/classes/qt4e.bbclass
deleted file mode 100644
index 303b79b..0000000
--- a/meta-oe/classes/qt4e.bbclass
+++ /dev/null
@@ -1,17 +0,0 @@
-DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1)[:12] == 'qt4-embedded')]}"
-inherit qmake2
-
-QT_DIR_NAME = "qtopia"
-QT_LIBINFIX = "E"
-# override variables set by qmake-base to compile Qt/Embedded apps
-#
-export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
-export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_NAME}"
-export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
-export OE_QMAKE_LIBS_QT = "qt"
-export OE_QMAKE_LIBS_X11 = ""
-export OE_QMAKE_EXTRA_MODULES = "network"
-EXTRA_QMAKEVARS_PRE += " QT_LIBINFIX=${QT_LIBINFIX} "
-
-# Qt4 uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-- 
1.7.4.1




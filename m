Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOGRP-0001CI-SU
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:53:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2013 16:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,418,1363158000"; d="scan'208";a="313153743"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.194])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2013 16:35:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:35:43 +0100
Message-Id: <9e4a915b5a1e871ee28c3b723475d143162a8286.1365204818.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 4/4] qt4: remove bbappends
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
X-List-Received-Date: Fri, 05 Apr 2013 23:53:10 -0000

These changes to Qt's configuration need to be applied in distro layers,
not in meta-oe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend |    6 ------
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend |    6 ------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
-- 
1.7.10.4




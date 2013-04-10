Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxgH-0008DA-05
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:15:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Apr 2013 08:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="320376227"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2013 08:58:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:57:59 +0100
Message-Id: <a2eefe761b129b700bbf0a1053a05999ecb69e12.1365609345.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365609345.git.paul.eggleton@linux.intel.com>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365609345.git.paul.eggleton@linux.intel.com>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 2/2] qt4: remove bbappend content
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
X-List-Received-Date: Wed, 10 Apr 2013 16:15:29 -0000

These changes to Qt's configuration need to be applied in distro layers,
not in meta-oe.

(We have to preserve the PRINC value to avoid PR going backwards.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend |    5 -----
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend |    5 -----
 2 files changed, 10 deletions(-)

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
index 27cac11..d9f1c29 100644
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
@@ -1,6 +1 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
 PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
index 27cac11..d9f1c29 100644
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
@@ -1,6 +1 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
 PRINC := "${@int(PRINC) + 1}"
-- 
1.7.10.4




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKtXL-0005Vi-57
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 18:17:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Oct 2012 09:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="201559630"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by azsmga001.ch.intel.com with ESMTP; 07 Oct 2012 09:03:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 17:03:47 +0100
Message-Id: <e2af6e6970b64fef2dc611d5f3bbe0b141f3923e.1349625647.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349625647.git.paul.eggleton@linux.intel.com>
References: <cover.1349625647.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349625647.git.paul.eggleton@linux.intel.com>
References: <cover.1349625647.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/2] mysql: fix include path reported by mysql_config
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
X-List-Received-Date: Sun, 07 Oct 2012 16:17:03 -0000

mysql_config should point to the directory where the MySQL include files
can be found and not its parent.

This fixes building modphp with mysql enabled, and allows cherokee to
actually enable mysql support.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 9699dec..40b6b01 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
 
 DEPENDS = "ncurses"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
@@ -42,7 +42,7 @@ SYSROOT_PREPROCESS_FUNCS += "mysql5_sysroot_preprocess"
 
 # We need to append this so it runs *after* binconfig's preprocess function
 mysql5_sysroot_preprocess () {
-	sed -i -es,^pkgincludedir=\'/usr/include/mysql\',pkgincludedir=\'${STAGING_INCDIR}\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
+	sed -i -es,^pkgincludedir=\'/usr/include/mysql\',pkgincludedir=\'${STAGING_INCDIR}/mysql\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
 	sed -i -es,^pkglibdir=\'/usr/lib/mysql\',pkglibdir=\'${STAGING_LIBDIR}\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
 }
 
-- 
1.7.9.5




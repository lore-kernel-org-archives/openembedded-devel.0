Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D0046725DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381134"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:51 +0000
Message-Id: <a050b987768b6f8cd40b44aae13716e39b942c96.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/10] mariadb: update to 5.5.41
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 11:01:08 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...b-native_5.5.40.bb => mariadb-native_5.5.41.bb} |  0
 meta-oe/recipes-support/mysql/mariadb.inc          |  5 +--
 .../mysql/mariadb/revert-fix-for-MDEV-5120.patch   | 46 ----------------------
 .../mysql/{mariadb_5.5.40.bb => mariadb_5.5.41.bb} |  0
 4 files changed, 2 insertions(+), 49 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.40.bb => mariadb-native_5.5.41.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.40.bb => mariadb_5.5.41.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.41.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.41.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index a04288d..cacb0d5 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -11,11 +11,10 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://my.cnf \
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
-           file://revert-fix-for-MDEV-5120.patch \
           "
 
-SRC_URI[md5sum] = "561bede89a8bd19c374dad2d8f24fdfe"
-SRC_URI[sha256sum] = "cbde17f4a31483143490def6fcce33310ebae49eafe92dc4ada0e7227202415a"
+SRC_URI[md5sum] = "d2415efc6a6d73d7a58f3c79bb42f2e8"
+SRC_URI[sha256sum] = "a16dc62e4bcabecd5c483f2f8b657483a8c51934e7be5ad4ab21b8baea1f5332"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch b/meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
deleted file mode 100644
index 41493a1..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Revert mariadb commit revno 4300 in branch 5.5 which fixes
-https://mariadb.atlassian.net/browse/MDEV-5120.
-
-------------------------------------------------------------
-revno: 4300
-fixes bug: https://mariadb.atlassian.net/browse/MDEV-5120
-committer: Sergei Golubchik <sergii@pisem.net>
-branch nick: 5.5
-timestamp: Thu 2014-10-02 11:57:40 +0200
-message:
-  MDEV-5120 Test suite test maria-no-logging fails
-  
-  stat structure (from <sys/stat.h>) is conditionally defined
-  to have different layout and size depending on the defined macros.
-  The correct macro is defined in my_config.h, which means it MUST be
-  included first (or, at least before <features.h> - so, practically,
-  before including any system headers).
-------------------------------------------------------------
-
-It causes modphp fails to build. Bug MDEV-5120 is an test suite test
-maria-no-logging fails. There is no side effect to revert it.
-
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
---- mariadb-5.5.40/config.h.cmake.orig	2014-11-13 14:23:50.868147145 +0800
-+++ mariadb-5.5.40/config.h.cmake	2014-11-13 14:24:23.372148031 +0800
-@@ -641,17 +641,4 @@
- #cmakedefine SIZEOF_TIME_T @SIZEOF_TIME_T@
- #cmakedefine TIME_T_UNSIGNED @TIME_T_UNSIGNED@
- 
--/*
--  stat structure (from <sys/stat.h>) is conditionally defined
--  to have different layout and size depending on the defined macros.
--  The correct macro is defined in my_config.h, which means it MUST be
--  included first (or at least before <features.h> - so, practically,
--  before including any system headers).
--
--  __GLIBC__ is defined in <features.h>
--*/
--#ifdef __GLIBC__
--#error <my_config.h> MUST be included first!
--#endif
--
- #endif
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.41.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.41.bb
-- 
1.9.3



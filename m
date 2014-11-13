Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9381B6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 05:37:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAD5bblS021303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 21:37:37 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 21:37:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Nov 2014 00:37:35 -0500
Message-ID: <1415857055-30954-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Check valgrind headers only if WITH_VALGRIND is set
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
X-List-Received-Date: Thu, 13 Nov 2014 05:37:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- Add patch to check valgrind headers only if WITH_VALGRIND is set
- Add PACKAGECONFIG for valgrind and disable it by default

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../mariadb/configure.cmake-fix-valgrind.patch     | 41 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |  2 ++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/configure.cmake-fix-valgrind.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb/configure.cmake-fix-valgrind.patch b/meta-oe/recipes-support/mysql/mariadb/configure.cmake-fix-valgrind.patch
new file mode 100644
index 0000000..ae624b8
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/configure.cmake-fix-valgrind.patch
@@ -0,0 +1,41 @@
+From 5effba0d7d47071a3f1bca56823190d5a95bb1a6 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 12 Nov 2014 03:09:10 -0500
+Subject: [PATCH] configure.cmake: fix valgrind
+
+Check valgrind headers only if WITH_VALGRIND is set.
+
+mariadb uses two macros for valgrind compilations:
+HAVE_valgrind - valgrind is installed and can be set by configure option -DWITH_VALGRIND
+HAVE_VALGRIND - valgrind debug libraries is installed, set by auto check
+
+We would like to set them both by the configure option so that we can use
+PACKAGECONFIG to decide if valgrind is needed or not.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.cmake b/configure.cmake
+index 0bd7bbe..51a098f 100644
+--- a/configure.cmake
++++ b/configure.cmake
+@@ -1047,10 +1047,10 @@ MARK_AS_ADVANCED(WITH_ATOMIC_LOCKS MY_ATOMIC_MODE_RWLOCK MY_ATOMIC_MODE_DUMMY)
+ 
+ IF(WITH_VALGRIND)
+   SET(HAVE_valgrind 1)
++  CHECK_INCLUDE_FILES("valgrind/memcheck.h;valgrind/valgrind.h"
++  HAVE_VALGRIND)
+ ENDIF()
+ 
+-CHECK_INCLUDE_FILES("valgrind/memcheck.h;valgrind/valgrind.h" 
+-  HAVE_VALGRIND)
+ 
+ #--------------------------------------------------------------------
+ # Check for IPv6 support
+-- 
+2.0.0
+
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
index 459c7ec..f9909eb 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
@@ -10,6 +10,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://fix-mysqlclient-r-version.patch \
            file://my.cnf \
            file://mysqld.service \
+           file://configure.cmake-fix-valgrind.patch \
           "
 
 SRC_URI[md5sum] = "917a807d8cf2c8ef9deedd2a89b6decd"
@@ -38,6 +39,7 @@ EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
+PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITHOUT_VALGRIND=TRUE,valgrind"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
-- 
2.0.0



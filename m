Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02D376AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 03:05:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4635g9T003169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 May 2015 20:05:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 20:05:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 May 2015 11:05:40 +0800
Message-ID: <1430881540-27483-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 1/1] mariadb: upgrade to 5.5.43
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
X-List-Received-Date: Wed, 06 May 2015 03:05:42 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...b-native_5.5.41.bb => mariadb-native_5.5.43.bb} |  0
 meta-oe/recipes-support/mysql/mariadb.inc          |  5 ++--
 .../mysql/mariadb/fix-a-building-failure.patch     | 31 ++++++++++++++++++++++
 .../mysql/{mariadb_5.5.41.bb => mariadb_5.5.43.bb} |  0
 4 files changed, 34 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.41.bb => mariadb-native_5.5.43.bb} (100%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-a-building-failure.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.41.bb => mariadb_5.5.43.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.41.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.43.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.41.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.43.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index f385bfc..00fa965 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -11,10 +11,11 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://my.cnf \
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
+           file://fix-a-building-failure.patch \
           "
 
-SRC_URI[md5sum] = "d2415efc6a6d73d7a58f3c79bb42f2e8"
-SRC_URI[sha256sum] = "a16dc62e4bcabecd5c483f2f8b657483a8c51934e7be5ad4ab21b8baea1f5332"
+SRC_URI[md5sum] = "c8760d6b5890fc1de76c07af48092c88"
+SRC_URI[sha256sum] = "a0709997140549154edb87c9dfab564cd4755b238251acbf42369118f9bb4d01"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-support/mysql/mariadb/fix-a-building-failure.patch
new file mode 100644
index 0000000..0c4e102
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/fix-a-building-failure.patch
@@ -0,0 +1,31 @@
+[PATCH] fix a building failure
+
+Upstream-Status: Inappropriate [configuration]
+
+building failed since native does not generate import_executables.cmake
+In fact, our building system will export the needed commands
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ CMakeLists.txt | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c1ce1c5..83b3a7e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -350,11 +350,6 @@ MYSQL_CHECK_READLINE()
+ 
+ CHECK_JEMALLOC()
+ 
+-IF(CMAKE_CROSSCOMPILING)
+-  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
+-  INCLUDE(${IMPORT_EXECUTABLES})
+-ENDIF()
+-
+ #
+ # Setup maintainer mode options by the end. Platform checks are
+ # not run with the warning options as to not perturb fragile checks
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.41.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.43.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.41.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.43.bb
-- 
2.1.0



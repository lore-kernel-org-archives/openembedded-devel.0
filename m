Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E30D71FC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 09:54:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI9sraK015902
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Nov 2014 01:54:54 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 18 Nov 2014 01:54:53 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Tue, 18 Nov 2014 17:54:36 +0800
Message-ID: <1416304478-31307-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
References: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] Update mariadb from version 5.5.39 to 5.5.40
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
X-List-Received-Date: Tue, 18 Nov 2014 09:54:55 -0000
Content-Type: text/plain

* rename mariadb_5.5.39.inc -> mariadb.inc
* add dependency bision-native for mariadb-native
* add revert-fix-for-MDEV-5120.patch to revert an commit for mariadb test suite
  which causes packages mysql-python and modphp fail to build
* add PACKAGECONFIG 'libedit'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...b-native_5.5.39.bb => mariadb-native_5.5.40.bb} |  4 +-
 .../mysql/{mariadb_5.5.39.inc => mariadb.inc}      |  6 ++-
 .../mysql/mariadb/revert-fix-for-MDEV-5120.patch   | 46 ++++++++++++++++++++++
 .../mysql/{mariadb_5.5.39.bb => mariadb_5.5.40.bb} |  3 +-
 4 files changed, 53 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.39.bb => mariadb-native_5.5.40.bb} (82%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.inc => mariadb.inc} (97%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.bb => mariadb_5.5.40.bb} (96%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
similarity index 82%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
index 9148dee..4ce960d 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
@@ -1,8 +1,8 @@
-require mariadb_${PV}.inc
+require mariadb.inc
 inherit native
 
 PROVIDES += "mysql5-native"
-DEPENDS = "ncurses-native zlib-native"
+DEPENDS = "ncurses-native zlib-native bison-native"
 
 RDEPENDS_${PN} = ""
 PACKAGES = ""
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb.inc
similarity index 97%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
rename to meta-oe/recipes-support/mysql/mariadb.inc
index f9909eb..3d0f593 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -11,10 +11,11 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://my.cnf \
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
+           file://revert-fix-for-MDEV-5120.patch \
           "
 
-SRC_URI[md5sum] = "917a807d8cf2c8ef9deedd2a89b6decd"
-SRC_URI[sha256sum] = "cb850865ab55ce5f01c99a612cc75b76ead5d75adfa75a606f453d32f9089d14"
+SRC_URI[md5sum] = "561bede89a8bd19c374dad2d8f24fdfe"
+SRC_URI[sha256sum] = "cbde17f4a31483143490def6fcce33310ebae49eafe92dc4ada0e7227202415a"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
@@ -40,6 +41,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITHOUT_VALGRIND=TRUE,valgrind"
+PACKAGECONFIG[libedit] = "-DLIBEDIT_INTERFACE=TRUE,-DLIBEDIT_INTERFACE=FALSE,libedit"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
diff --git a/meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch b/meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
new file mode 100644
index 0000000..41493a1
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
@@ -0,0 +1,46 @@
+Revert mariadb commit revno 4300 in branch 5.5 which fixes
+https://mariadb.atlassian.net/browse/MDEV-5120.
+
+------------------------------------------------------------
+revno: 4300
+fixes bug: https://mariadb.atlassian.net/browse/MDEV-5120
+committer: Sergei Golubchik <sergii@pisem.net>
+branch nick: 5.5
+timestamp: Thu 2014-10-02 11:57:40 +0200
+message:
+  MDEV-5120 Test suite test maria-no-logging fails
+  
+  stat structure (from <sys/stat.h>) is conditionally defined
+  to have different layout and size depending on the defined macros.
+  The correct macro is defined in my_config.h, which means it MUST be
+  included first (or, at least before <features.h> - so, practically,
+  before including any system headers).
+------------------------------------------------------------
+
+It causes modphp fails to build. Bug MDEV-5120 is an test suite test
+maria-no-logging fails. There is no side effect to revert it.
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+--- mariadb-5.5.40/config.h.cmake.orig	2014-11-13 14:23:50.868147145 +0800
++++ mariadb-5.5.40/config.h.cmake	2014-11-13 14:24:23.372148031 +0800
+@@ -641,17 +641,4 @@
+ #cmakedefine SIZEOF_TIME_T @SIZEOF_TIME_T@
+ #cmakedefine TIME_T_UNSIGNED @TIME_T_UNSIGNED@
+ 
+-/*
+-  stat structure (from <sys/stat.h>) is conditionally defined
+-  to have different layout and size depending on the defined macros.
+-  The correct macro is defined in my_config.h, which means it MUST be
+-  included first (or at least before <features.h> - so, practically,
+-  before including any system headers).
+-
+-  __GLIBC__ is defined in <features.h>
+-*/
+-#ifdef __GLIBC__
+-#error <my_config.h> MUST be included first!
+-#endif
+-
+ #endif
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
similarity index 96%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
index fee5b62..f24cb43 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
@@ -1,4 +1,4 @@
-require ${PN}_${PV}.inc
+require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
@@ -25,4 +25,3 @@ RCONFLICTS_${PN}-client += "mysql5-client"
 RPROVIDES_${PN}-server += "mysql5-server"
 RREPLACES_${PN}-server += "mysql5-server"
 RCONFLICTS_${PN}-server += "mysql5-server"
-
-- 
1.9.1



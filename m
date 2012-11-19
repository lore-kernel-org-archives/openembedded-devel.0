Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TaOnR-0005tY-Uz
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 11:41:48 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E5408D22B6;
	Mon, 19 Nov 2012 11:27:51 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Nov 2012 11:27:37 +0100
Message-Id: <1353320857-14067-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] mysql: make it work after $libexec change - LP: #1068759
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
X-List-Received-Date: Mon, 19 Nov 2012 10:41:48 -0000

Mysql start scripts assumed that mysqld is in /usr/libexec/ directory.
It was true until 406bd38b4232f9f399ef5ffe0b4fac72ed605a23 landed in
OE-Core.

This changeset fixes mysqld start and initial databases population
scripts.

More: https://bugs.launchpad.net/linaro-oe/+bug/1068759

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../mysql/mysql5/no-libexec-anymore.patch          | 56 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |  5 +-
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/mysql/mysql5/no-libexec-anymore.patch

diff --git a/meta-oe/recipes-support/mysql/mysql5/no-libexec-anymore.patch b/meta-oe/recipes-support/mysql/mysql5/no-libexec-anymore.patch
new file mode 100644
index 0000000..6801308
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql5/no-libexec-anymore.patch
@@ -0,0 +1,56 @@
+---
+ scripts/mysql_install_db.sh |    4 ++--
+ scripts/mysqld_safe.sh      |    8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+--- mysql-5.1.40.orig/scripts/mysql_install_db.sh
++++ mysql-5.1.40/scripts/mysql_install_db.sh
+@@ -256,14 +256,14 @@ then
+   scriptdir="$srcdir/scripts"
+ elif test -n "$basedir"
+ then
+   bindir="$basedir/bin"
+   extra_bindir="$bindir"
+-  mysqld=`find_in_basedir mysqld libexec sbin bin`
++  mysqld=`find_in_basedir mysqld lib/mysql5 sbin bin`
+   if test -z "$mysqld"
+   then
+-    cannot_find_file mysqld $basedir/libexec $basedir/sbin $basedir/bin
++    cannot_find_file mysqld $basedir/lib/mysql5 $basedir/sbin $basedir/bin
+     exit 1
+   fi
+   langdir=`find_in_basedir --dir errmsg.sys share/english share/mysql/english`
+   if test -z "$langdir"
+   then
+--- mysql-5.1.40.orig/scripts/mysqld_safe.sh
++++ mysql-5.1.40/scripts/mysqld_safe.sh
+@@ -219,25 +219,25 @@ MY_PWD=`pwd`
+ if test -n "$MY_BASEDIR_VERSION" -a -d "$MY_BASEDIR_VERSION"
+ then
+   # BASEDIR is already overridden on command line.  Do not re-set.
+ 
+   # Use BASEDIR to discover le.
+-  if test -x "$MY_BASEDIR_VERSION/libexec/mysqld"
++  if test -x "$MY_BASEDIR_VERSION/lib/mysql5/mysqld"
+   then
+-    ledir="$MY_BASEDIR_VERSION/libexec"
++    ledir="$MY_BASEDIR_VERSION/lib/mysql5"
+   else
+     ledir="$MY_BASEDIR_VERSION/bin"
+   fi
+ elif test -f "$relpkgdata"/english/errmsg.sys -a -x "$MY_PWD/bin/mysqld"
+ then
+   MY_BASEDIR_VERSION="$MY_PWD"		# Where bin, share and data are
+   ledir="$MY_PWD/bin"			# Where mysqld is
+ # Check for the directories we would expect from a source install
+-elif test -f "$relpkgdata"/english/errmsg.sys -a -x "$MY_PWD/libexec/mysqld"
++elif test -f "$relpkgdata"/english/errmsg.sys -a -x "$MY_PWD/lib/mysql5/mysqld"
+ then
+   MY_BASEDIR_VERSION="$MY_PWD"		# Where libexec, share and var are
+-  ledir="$MY_PWD/libexec"		# Where mysqld is
++  ledir="$MY_PWD/lib/mysql5"		# Where mysqld is
+ # Since we didn't find anything, used the compiled-in defaults
+ else
+   MY_BASEDIR_VERSION='@prefix@'
+   ledir='@libexecdir@'
+ fi
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 3867a12..703aebc 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
 
 DEPENDS = "ncurses"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
@@ -13,8 +13,9 @@ SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://misc.m4.patch \
            file://Makefile.am.patch \
            file://fix_host_path.patch \
-	   file://configure-ps-cache-check.patch \
+           file://configure-ps-cache-check.patch \
            file://fix-abi-check-gcc45.patch \
+           file://no-libexec-anymore.patch \
            file://my.cnf \
            file://mysqld.sh"
 
-- 
1.8.0




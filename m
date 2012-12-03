Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaID-00028f-T3
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528130"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:16 +0000
Message-Id: <16feec23d0ab0a6e2ce79d86528054bd7b92befd.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 10/11] pure-ftpd: add new recipe for 1.0.36
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:58 -0000

Based on a patch by Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...coded-usr-local-includes-from-configure.a.patch |   38 ++++++++++++++++++++
 .../pure-ftpd/pure-ftpd/nostrip.patch              |   30 ++++++++++++++++
 .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb  |   19 ++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
 create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
 create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
new file mode 100644
index 0000000..54088b0
--- /dev/null
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -0,0 +1,38 @@
+From cffca7cb7c055f82ced316ddee90bb701b85b92d Mon Sep 17 00:00:00 2001
+From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+Date: Tue, 10 Jan 2012 19:15:25 +0300
+Subject: [PATCH] Remove hardcoded /usr/local includes from configure.ac
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+---
+ configure.ac |   12 ------------
+ 1 files changed, 0 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ae00c08..9ba6d8d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,18 +67,6 @@ AC_ARG_VAR(PYTHON,local path to the python interpreter)
+ python_possible_path="/usr/bin:/usr/local/bin:/bin:/opt/python/bin:/opt/python/usr/bin:/opt/python/usr/local/bin"
+ AC_PATH_PROG(PYTHON,python,/usr/bin/env python,$python_possible_path)
+ 
+-if test -d /usr/local/include; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-fi
+-
+-if test -d /usr/kerberos/include; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/kerberos/include"
+-fi
+-
+-if test -d /usr/local/lib; then
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+-
+ if uname | fgrep SunOS > /dev/null 2> /dev/null ; then
+   CPPFLAGS="$CPPFLAGS -D_XPG4_2=1"
+ fi
+-- 
+1.7.7.3
+
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
new file mode 100644
index 0000000..5cbbc5f
--- /dev/null
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
@@ -0,0 +1,30 @@
+From 45eb89d1a6fde65caaf2d6e1a5d527f1ae7beb9c Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Mon, 3 Dec 2012 17:12:11 +0000
+Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is specified
+
+We especially don't want stripping enabled.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ configure.ac |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3d59409..6836c0e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -413,8 +413,6 @@ AC_ARG_WITH(minimal,
+     AC_DEFINE(NO_FTP_USERS)
+     AC_DEFINE(WITHOUT_ASCII)    
+     AC_DEFINE(BORING_MODE)
+-    CFLAGS="$CFLAGS -Os -fomit-frame-pointer -fgcse -falign-functions=2 -falign-jumps=2 -fno-unroll-loops "
+-    LDFLAGS="$LDFLAGS -s "
+   fi ])
+ 
+ AC_ARG_WITH(paranoidmsg,
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
new file mode 100644
index 0000000..871ab6e
--- /dev/null
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server"
+HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae9e161311a5a0768c333b537a40e332"
+
+DEPENDS = "libcap"
+
+PR = "r0"
+
+SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.tar.gz \
+           file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
+	   file://nostrip.patch \
+           "
+SRC_URI[md5sum] = "bbcb48e8aa6ec1abff9775b89f84af91"
+SRC_URI[sha256sum] = "90fb63b1a9d448076aa9f3e3c74b298965f98e03c824e9a4d241fffe8eb3a130"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-minimal"
-- 
1.7.10.4




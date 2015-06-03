Return-Path: <Matthieu.CRAPET@ingenico.com>
X-Greylist: delayed 595 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jun 2015 09:21:43 UTC
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAD775812
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:21:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,546,1427752800"; d="scan'208";a="77840551"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 03 Jun 2015 11:11:47 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.210.2; Wed, 3 Jun 2015 11:11:47 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.210.2; Wed, 3 Jun 2015 11:11:47 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Jun 2015 11:12:36 +0200
Message-ID: <1433322756-28286-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cgdb: update to 0.6.8
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
X-List-Received-Date: Wed, 03 Jun 2015 09:21:46 -0000
Content-Type: text/plain

From: mcrapet <Matthieu.Crapet@ingenico.com>

Changes:
- add missing build dependency to flex-native
- GDB is a runtime dependency, set it so
- use CACHED_CONFIGUREVARS to drop patch
- use ${BP}
- add missing DESCRIPTION
- no help2man build dependency (cgdb.1 man page is not generated)

Cc: Ben Shelton <ben.shelton@ni.com>
Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch | 40 ------------------
 .../cgdb/cgdb/remove-help2man.patch                | 47 ++++++++++++++++++++++
 meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb        | 16 --------
 meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb        | 21 ++++++++++
 4 files changed, 68 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch
 create mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
 delete mode 100644 meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb
 create mode 100644 meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch b/meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch
deleted file mode 100644
index 25b1386..0000000
--- a/meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-diff -rupN cgdb-0.6.7-OLD/configure.in cgdb-0.6.7/configure.in
---- cgdb-0.6.7-OLD/configure.in	2013-01-14 05:31:53.000000000 -0600
-+++ cgdb-0.6.7/configure.in	2014-05-08 13:18:13.864632180 -0500
-@@ -65,8 +65,9 @@ AC_CHECK_HEADERS([getopt.h],
- 		 [AC_DEFINE(HAVE_GETOPT_H, 1, have getopt_long)])
- 
- dnl determine if /dev/ptmx is available for pseudo terminals
--AC_CHECK_FILE([/dev/ptmx],
--	      [AC_DEFINE(HAVE_DEV_PTMX, 1, have /dev/ptmx)])
-+dnl AC_CHECK_FILE([/dev/ptmx],
-+dnl	      [AC_DEFINE(HAVE_DEV_PTMX, 1, have /dev/ptmx)])
-+AC_DEFINE(HAVE_DEV_PTMX, 1, have /dev/ptmx)
- 
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
-@@ -167,15 +168,15 @@ fi
- 
- dnl Make sure there is a version of readline that CGDB supports.
- dnl Simply putting 5.1* -> 5.9* just to take into accout future versions.
--RL_LIB_READLINE_VERSION
--case "$ac_cv_rl_version" in
--5.1*|5.2*|5.3*|5.4*|5.5*|5.6*|5.7*|5.8*|5.9*|6*|7*|8*|9*) ;;
--*)      AC_MSG_ERROR([CGDB requires GNU readline 5.1 or greater to link.
--  If you used --with-readline instead of using the system readline library, 
--  make sure to set the correct readline library on the linker search path 
--  via LD_LIBRARY_PATH or some other facility.])
--	;;
--esac
-+dnl RL_LIB_READLINE_VERSION
-+dnl case "$ac_cv_rl_version" in
-+dnl 5.1*|5.2*|5.3*|5.4*|5.5*|5.6*|5.7*|5.8*|5.9*|6*|7*|8*|9*) ;;
-+dnl *)      AC_MSG_ERROR([CGDB requires GNU readline 5.1 or greater to link.
-+dnl  If you used --with-readline instead of using the system readline library, 
-+dnl  make sure to set the correct readline library on the linker search path 
-+dnl  via LD_LIBRARY_PATH or some other facility.])
-+dnl	;;
-+dnl esac
- 
- dnl This will DEFINE the readline headers.
- RL_LIB_READLINE_INCLUDES
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch b/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
new file mode 100644
index 0000000..4358629
--- /dev/null
+++ b/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
@@ -0,0 +1,47 @@
+Disable building manpages so that make install doesn't fail due to lack of help2man
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+---
+ configure.ac    | 3 ---
+ doc/Makefile.am | 5 -----
+ 2 files changed, 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ee7eca0..1f0d924 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -134,9 +134,6 @@ dnl check that the required tools are available to generate documentation
+ if test "$HAS_MAKEINFO" != "yes" ; then
+ 	AC_MSG_ERROR([Please install makeinfo before installing])
+ fi
+-if test "$HAS_HELP2MAN" != "yes" ; then
+-	AC_MSG_ERROR([Please install help2man])
+-fi
+ 
+ dnl Checking for log10 function in math - I would like to remove this
+ AC_CHECK_LIB(m, log10)
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 60662f6..0ae0013 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -1,15 +1,10 @@
+ info_TEXINFOS = cgdb.texi
+ cgdb_TEXINFOS = gpl.texi
+ 
+-dist_man_MANS = cgdb.1
+ EXTRA_DIST = cgdb.txt
+ 
+ dist_pkgdata_DATA = cgdb.txt
+ 
+-# generate the man page using help2man.
+-cgdb.1:
+-	help2man --output=$(top_srcdir)/doc/cgdb.1 $(top_builddir)/cgdb/cgdb$(EXEEXT)
+-
+ cgdb.txt: cgdb.texi $(srcdir)/version.texi $(cgdb_TEXINFOS)
+ TEXTS = cgdb.txt
+ text-am: $(TEXTS)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb
deleted file mode 100644
index 26b2782..0000000
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "curses-based interface to gdb"
-HOMEPAGE = "http://cgdb.github.io/"
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "readline ncurses gdb"
-
-SRC_URI = "http://cgdb.me/files/cgdb-${PV}.tar.gz \
-	   file://configfix.patch"
-SRC_URI[md5sum] = "e2d9a973d2683faf8130a82703bf6a31"
-SRC_URI[sha256sum] = "074ed31d1e827a04574add8c27d391447d75313e85ff938005d8ec939499fda9"
-
-EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} --with-ncurses=${STAGING_LIBDIR}"
-
-inherit autotools
-
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
new file mode 100644
index 0000000..74019fb
--- /dev/null
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
@@ -0,0 +1,21 @@
+SUMMARY = "curses-based interface to GDB"
+DESCRIPTION = "cgdb is a lightweight curses (terminal-based) interface to the GNU Debugger (GDB)."
+HOMEPAGE = "http://cgdb.github.io/"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "flex-native readline ncurses"
+
+inherit autotools
+
+SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
+    file://remove-help2man.patch"
+SRC_URI[md5sum] = "7bd38c79bf4d794d239928fef401fca3"
+SRC_URI[sha256sum] = "be203e29be295097439ab67efe3dc8261f742c55ff3647718d67d52891f4cf41"
+
+CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2"
+EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} \
+    --with-ncurses=${STAGING_LIBDIR}"
+
+RDEPENDS_${PN} = "gdb"
-- 
1.9.1



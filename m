Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AA17D65CB2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 15:00:41 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7FF0g4M010858 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:00:42 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014081510004211-1151688 ;
	Fri, 15 Aug 2014 10:00:42 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Aug 2014 10:00:31 -0500
Message-Id: <1408114831-19960-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/15/2014 10:00:42 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/15/2014 10:00:42 AM,
	Serialize complete at 08/15/2014 10:00:42 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-15_04:2014-08-15, 2014-08-15,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] cgdb: add recipe
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
X-List-Received-Date: Fri, 15 Aug 2014 15:00:53 -0000

cgdb is a lightweight ncurses-based interface to gdb that provides
syntax highlighting, visual breakpoints, and other features.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
NOTE: I'm posting this because I had this recipe hanging around locally, and I
saw some traffic on the oe-core list about it but never saw a recipe submitted.
I'd like to get some feedback on whether the patch is an OK way to get around
the cross-target build issues, or whether there's a better way to do it.

 meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch | 40 ++++++++++++++++++++++
 meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb        | 16 +++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch
 create mode 100644 meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch b/meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch
new file mode 100644
index 0000000..25b1386
--- /dev/null
+++ b/meta-oe/recipes-devtools/cgdb/cgdb/configfix.patch
@@ -0,0 +1,40 @@
+diff -rupN cgdb-0.6.7-OLD/configure.in cgdb-0.6.7/configure.in
+--- cgdb-0.6.7-OLD/configure.in	2013-01-14 05:31:53.000000000 -0600
++++ cgdb-0.6.7/configure.in	2014-05-08 13:18:13.864632180 -0500
+@@ -65,8 +65,9 @@ AC_CHECK_HEADERS([getopt.h],
+ 		 [AC_DEFINE(HAVE_GETOPT_H, 1, have getopt_long)])
+ 
+ dnl determine if /dev/ptmx is available for pseudo terminals
+-AC_CHECK_FILE([/dev/ptmx],
+-	      [AC_DEFINE(HAVE_DEV_PTMX, 1, have /dev/ptmx)])
++dnl AC_CHECK_FILE([/dev/ptmx],
++dnl	      [AC_DEFINE(HAVE_DEV_PTMX, 1, have /dev/ptmx)])
++AC_DEFINE(HAVE_DEV_PTMX, 1, have /dev/ptmx)
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+@@ -167,15 +168,15 @@ fi
+ 
+ dnl Make sure there is a version of readline that CGDB supports.
+ dnl Simply putting 5.1* -> 5.9* just to take into accout future versions.
+-RL_LIB_READLINE_VERSION
+-case "$ac_cv_rl_version" in
+-5.1*|5.2*|5.3*|5.4*|5.5*|5.6*|5.7*|5.8*|5.9*|6*|7*|8*|9*) ;;
+-*)      AC_MSG_ERROR([CGDB requires GNU readline 5.1 or greater to link.
+-  If you used --with-readline instead of using the system readline library, 
+-  make sure to set the correct readline library on the linker search path 
+-  via LD_LIBRARY_PATH or some other facility.])
+-	;;
+-esac
++dnl RL_LIB_READLINE_VERSION
++dnl case "$ac_cv_rl_version" in
++dnl 5.1*|5.2*|5.3*|5.4*|5.5*|5.6*|5.7*|5.8*|5.9*|6*|7*|8*|9*) ;;
++dnl *)      AC_MSG_ERROR([CGDB requires GNU readline 5.1 or greater to link.
++dnl  If you used --with-readline instead of using the system readline library, 
++dnl  make sure to set the correct readline library on the linker search path 
++dnl  via LD_LIBRARY_PATH or some other facility.])
++dnl	;;
++dnl esac
+ 
+ dnl This will DEFINE the readline headers.
+ RL_LIB_READLINE_INCLUDES
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb
new file mode 100644
index 0000000..26b2782
--- /dev/null
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.6.7.bb
@@ -0,0 +1,16 @@
+SUMMARY = "curses-based interface to gdb"
+HOMEPAGE = "http://cgdb.github.io/"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "readline ncurses gdb"
+
+SRC_URI = "http://cgdb.me/files/cgdb-${PV}.tar.gz \
+	   file://configfix.patch"
+SRC_URI[md5sum] = "e2d9a973d2683faf8130a82703bf6a31"
+SRC_URI[sha256sum] = "074ed31d1e827a04574add8c27d391447d75313e85ff938005d8ec939499fda9"
+
+EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} --with-ncurses=${STAGING_LIBDIR}"
+
+inherit autotools
+
-- 
2.0.4



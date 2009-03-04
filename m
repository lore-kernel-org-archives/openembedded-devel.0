Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTd-0005OG-Fe
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:52 +0100
Received: (qmail 26052 invoked by uid 813007); 4 Mar 2009 15:53:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:32 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPR-0001Cd-HF; Wed, 04 Mar 2009 16:53:25 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:16 +0100
Message-Id: <1236182004-4523-2-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 01/70] rpm: drop 4.4
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 packages/rpm/files/cross_libpaths.patch |   24 -----------------
 packages/rpm/files/fix_mypath.patch     |   13 ---------
 packages/rpm/rpm_4.4.bb                 |   44 -------------------------------
 3 files changed, 0 insertions(+), 81 deletions(-)
 delete mode 100644 packages/rpm/files/cross_libpaths.patch
 delete mode 100644 packages/rpm/files/fix_mypath.patch
 delete mode 100644 packages/rpm/rpm_4.4.bb

diff --git a/packages/rpm/files/cross_libpaths.patch b/packages/rpm/files/cross_libpaths.patch
deleted file mode 100644
index d6139db..0000000
--- a/packages/rpm/files/cross_libpaths.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: rpm-4.4/configure.ac
-===================================================================
---- rpm-4.4.orig/configure.ac	2005-01-29 10:54:37.698359056 -0500
-+++ rpm-4.4/configure.ac	2005-01-29 10:55:16.492461456 -0500
-@@ -321,10 +321,8 @@
- 
- localdone=
- 
--dirs=$prefix
- if test "$cross_compiling" != "yes"; then
--  dirs="$dirs /usr/local"
--fi
-+dirs="$prefix /usr/local"
- for dir in $dirs
- do
- 	case $dir in
-@@ -366,6 +364,7 @@
- else
- 	AC_MSG_RESULT(no)
- fi
-+fi
- 
- dnl
- dnl Check for features
diff --git a/packages/rpm/files/fix_mypath.patch b/packages/rpm/files/fix_mypath.patch
deleted file mode 100644
index 09512be..0000000
--- a/packages/rpm/files/fix_mypath.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: rpm-4.4/configure.ac
-===================================================================
---- rpm-4.4.orig/configure.ac	2005-01-29 10:54:13.599022712 -0500
-+++ rpm-4.4/configure.ac	2005-01-29 10:54:37.698359056 -0500
-@@ -230,7 +230,7 @@
- dnl use defaults if cross-compiling, otherwise use the default path.
- dnl
- if test "$cross_compiling" = "yes"; then
--    MYPATH=""
-+    MYPATH=":"
- else
- #    MYPATH="/bin:/usr/bin:/usr/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin:/opt/gnu/bin"
-     MYPATH=$PATH
diff --git a/packages/rpm/rpm_4.4.bb b/packages/rpm/rpm_4.4.bb
deleted file mode 100644
index ff69ddc..0000000
--- a/packages/rpm/rpm_4.4.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "The RPM Package Manager."
-HOMEPAGE = "http://rpm.org/"
-LICENSE = "LGPL GPL"
-# NOTE: currently rpm doesn't support using an external popt,
-# file, or virtual/db.  FIXME: patch it to support that.
-# DEPENDS = "virtual/db popt file zlib"
-DEPENDS = "zlib"
-PR = "r1"
-
-SRC_URI = "ftp://ftp.jbj.org/pub/rpm-4.4.x/rpm-4.4-1.src.rpm \
-	   file://fix_mypath.patch;patch=1 \
-	   file://cross_libpaths.patch;patch=1"
-TARBALL = "${WORKDIR}/rpm-4.4.tar.gz"
-
-inherit autotools gettext
-
-acpaths = ""
-# NOTE: currently BROKEN because its internal build of 'file' tries
-# to run the binary it builds.  Either switch to an external build,
-# or depend on our file-native and make it call that.
-BROKEN = "1"
-EXTRA_OECONF = "--without-python \
-		--without-apidocs \
-		--without-selinux \
-		--without-lua \
-		--without-dmalloc \
-		--without-efence"
-
-python unpack_again () {
-	import bb, os
-	os.chdir(bb.data.getVar('WORKDIR', d, 1) or '')
-	if not oe_unpack_file(bb.data.expand('${TARBALL}', d), d):
-		raise bb.build.FuncFailed(bb.data.expand("Unable to unpack ${TARBALL}", d))
-}
-
-python do_unpack () {
-	bb.build.exec_func('base_do_unpack', d)
-	bb.build.exec_func('unpack_again', d)
-}
-
-do_configure () {
-	touch db3/configure.ac
-	autotools_do_configure
-}
-- 
1.6.1.3






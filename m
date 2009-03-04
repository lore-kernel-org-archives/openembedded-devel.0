Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTf-0005OL-6U
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:52 +0100
Received: (qmail 26156 invoked by uid 813007); 4 Mar 2009 15:53:34 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:34 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPT-0001Ci-5L; Wed, 04 Mar 2009 16:53:27 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:18 +0100
Message-Id: <1236182004-4523-4-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 03/70] rpm: Patch out some Makefile strangeness causing build failures (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5085 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/files/cross_libpaths.patch |   33 +++++++++++++++++++-----------
 packages/rpm/rpm_4.4.2.3.bb             |    2 +-
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/packages/rpm/files/cross_libpaths.patch b/packages/rpm/files/cross_libpaths.patch
index 8cc34f2..4fed9b7 100644
--- a/packages/rpm/files/cross_libpaths.patch
+++ b/packages/rpm/files/cross_libpaths.patch
@@ -1,7 +1,7 @@
 Index: rpm-4.4.2.3/configure.ac
 ===================================================================
---- rpm-4.4.2.3.orig/configure.ac	2008-08-17 11:40:29.000000000 +0100
-+++ rpm-4.4.2.3/configure.ac	2008-08-17 11:40:29.000000000 +0100
+--- rpm-4.4.2.3.orig/configure.ac	2008-08-18 10:25:14.000000000 +0100
++++ rpm-4.4.2.3/configure.ac	2008-08-18 10:25:14.000000000 +0100
 @@ -326,10 +326,8 @@
  
  localdone=
@@ -43,7 +43,7 @@ Index: rpm-4.4.2.3/configure.ac
 Index: rpm-4.4.2.3/rpmio/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/rpmio/Makefile.am	2008-04-01 08:28:22.000000000 +0100
-+++ rpm-4.4.2.3/rpmio/Makefile.am	2008-08-17 11:40:29.000000000 +0100
++++ rpm-4.4.2.3/rpmio/Makefile.am	2008-08-18 10:25:14.000000000 +0100
 @@ -26,8 +26,6 @@
  
  BEECRYPTLOBJS = $(shell test X"@WITH_BEECRYPT_SUBDIR@" != X && cat $(top_builddir)/@WITH_BEECTYPT_SUBDIR@/listobjs)
@@ -56,7 +56,7 @@ Index: rpm-4.4.2.3/rpmio/Makefile.am
 Index: rpm-4.4.2.3/rpmio/rpmio_internal.h
 ===================================================================
 --- rpm-4.4.2.3.orig/rpmio/rpmio_internal.h	2008-04-01 08:28:22.000000000 +0100
-+++ rpm-4.4.2.3/rpmio/rpmio_internal.h	2008-08-17 11:40:29.000000000 +0100
++++ rpm-4.4.2.3/rpmio/rpmio_internal.h	2008-08-18 10:25:14.000000000 +0100
 @@ -12,22 +12,22 @@
  #if HAVE_BEECRYPT_API_H
  #include <api.h>
@@ -92,8 +92,8 @@ Index: rpm-4.4.2.3/rpmio/rpmio_internal.h
  #include <sha384.h>
 Index: rpm-4.4.2.3/Makefile.am
 ===================================================================
---- rpm-4.4.2.3.orig/Makefile.am	2008-08-17 11:42:36.000000000 +0100
-+++ rpm-4.4.2.3/Makefile.am	2008-08-17 11:42:50.000000000 +0100
+--- rpm-4.4.2.3.orig/Makefile.am	2008-04-01 08:28:21.000000000 +0100
++++ rpm-4.4.2.3/Makefile.am	2008-08-20 08:26:44.000000000 +0100
 @@ -10,7 +10,7 @@
  	po/*.in po/*.po po/rpm.pot \
  	rpm.magic rpmpopt-$(VERSION) rpmqv.c 
@@ -103,10 +103,19 @@ Index: rpm-4.4.2.3/Makefile.am
  
  INCLUDES = \
  	-I$(top_srcdir)/build \
+@@ -93,7 +93,7 @@
+ rpm2cpio_LDFLAGS =	$(myLDFLAGS)
+ rpm2cpio_LDADD =	$(myLDADD) @LIBMISC@
+ 
+-$(PROGRAMS): 		$(myLDADD) @WITH_APIDOCS_TARGET@
++$(PROGRAMS): 		@WITH_APIDOCS_TARGET@
+ 
+ .PHONY:	splint
+ splint:
 Index: rpm-4.4.2.3/rpmdb/Makefile.am
 ===================================================================
---- rpm-4.4.2.3.orig/rpmdb/Makefile.am	2008-08-17 11:43:36.000000000 +0100
-+++ rpm-4.4.2.3/rpmdb/Makefile.am	2008-08-17 11:43:57.000000000 +0100
+--- rpm-4.4.2.3.orig/rpmdb/Makefile.am	2008-04-01 08:28:22.000000000 +0100
++++ rpm-4.4.2.3/rpmdb/Makefile.am	2008-08-18 10:25:14.000000000 +0100
 @@ -41,9 +41,6 @@
  # XXX watchout, ../db3/libdb.la created by this Makefile may surprise
  libdb_la = $(top_builddir)/$(WITH_DB_SUBDIR)/libdb.la
@@ -119,8 +128,8 @@ Index: rpm-4.4.2.3/rpmdb/Makefile.am
  librpmdb_la_SOURCES = \
 Index: rpm-4.4.2.3/lib/Makefile.am
 ===================================================================
---- rpm-4.4.2.3.orig/lib/Makefile.am	2008-08-17 11:46:43.000000000 +0100
-+++ rpm-4.4.2.3/lib/Makefile.am	2008-08-17 11:46:51.000000000 +0100
+--- rpm-4.4.2.3.orig/lib/Makefile.am	2008-04-01 08:28:22.000000000 +0100
++++ rpm-4.4.2.3/lib/Makefile.am	2008-08-18 10:25:14.000000000 +0100
 @@ -29,8 +29,6 @@
  mylibs = librpm.la
  LIBS =
@@ -132,8 +141,8 @@ Index: rpm-4.4.2.3/lib/Makefile.am
  librpm_la_SOURCES = \
 Index: rpm-4.4.2.3/build/Makefile.am
 ===================================================================
---- rpm-4.4.2.3.orig/build/Makefile.am	2008-08-17 11:47:37.000000000 +0100
-+++ rpm-4.4.2.3/build/Makefile.am	2008-08-17 11:47:43.000000000 +0100
+--- rpm-4.4.2.3.orig/build/Makefile.am	2008-04-01 08:28:21.000000000 +0100
++++ rpm-4.4.2.3/build/Makefile.am	2008-08-18 10:25:14.000000000 +0100
 @@ -22,8 +22,6 @@
  pkginc_HEADERS = rpmbuild.h rpmfc.h rpmfile.h rpmspec.h
  noinst_HEADERS = buildio.h
diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index b04b500..a568ea8 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
 DEPENDS = "zlib beecrypt file popt"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
-- 
1.6.1.3






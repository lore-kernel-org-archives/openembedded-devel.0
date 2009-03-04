Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTg-0005ON-SW
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:52 +0100
Received: (qmail 26299 invoked by uid 813007); 4 Mar 2009 15:53:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:36 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPU-0001Cn-QA; Wed, 04 Mar 2009 16:53:28 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:20 +0100
Message-Id: <1236182004-4523-6-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 05/70] rpm: Tweak patches to remove popt problem (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:58:54 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:58:54 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:58:54 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:58:54 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:58:54 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5103 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/files/cross_libpaths.patch |   11 ++++++++++-
 packages/rpm/rpm-native_4.4.2.3.bb      |    2 --
 packages/rpm/rpm_4.4.2.3.bb             |    2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/packages/rpm/files/cross_libpaths.patch b/packages/rpm/files/cross_libpaths.patch
index 798db15..9e8f7dc 100644
--- a/packages/rpm/files/cross_libpaths.patch
+++ b/packages/rpm/files/cross_libpaths.patch
@@ -117,7 +117,7 @@ Index: rpm-4.4.2.3/rpmio/rpmio_internal.h
 Index: rpm-4.4.2.3/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/Makefile.am	2008-04-01 08:28:21.000000000 +0100
-+++ rpm-4.4.2.3/Makefile.am	2008-08-23 12:07:29.000000000 +0100
++++ rpm-4.4.2.3/Makefile.am	2008-08-25 23:09:40.000000000 +0100
 @@ -10,7 +10,7 @@
  	po/*.in po/*.po po/rpm.pot \
  	rpm.magic rpmpopt-$(VERSION) rpmqv.c 
@@ -127,6 +127,15 @@ Index: rpm-4.4.2.3/Makefile.am
  
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
 --- rpm-4.4.2.3.orig/rpmdb/Makefile.am	2008-04-01 08:28:22.000000000 +0100
diff --git a/packages/rpm/rpm-native_4.4.2.3.bb b/packages/rpm/rpm-native_4.4.2.3.bb
index 517b571..2e949dc 100644
--- a/packages/rpm/rpm-native_4.4.2.3.bb
+++ b/packages/rpm/rpm-native_4.4.2.3.bb
@@ -3,7 +3,5 @@ inherit native
 
 DEPENDS = "beecrypt-native zlib-native file-native popt-native python-native"
 
-PR = "r2"
-
 export sharedstatedir = "${layout_sharedstatedir}"
 export localstatedir = "${layout_localstatedir}"
diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index 7edecbc..4e868e3 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
 DEPENDS = "zlib beecrypt file popt python"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
-- 
1.6.1.3






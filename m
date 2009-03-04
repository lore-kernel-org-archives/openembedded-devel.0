Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaG-0005Yi-Vh
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:38 +0100
Received: (qmail 26669 invoked by uid 813007); 4 Mar 2009 15:53:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:43 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPc-0001DG-6n; Wed, 04 Mar 2009 16:53:36 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:29 +0100
Message-Id: <1236182004-4523-15-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 14/70] Add yum-native and createrepo (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:04:42 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5098 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/createrepo-native/pathfix.patch |   81 ++++++++++++++++++++++++++
 packages/yum/createrepo-native_0.9.bb        |   13 ++++
 packages/yum/yum-native_3.2.18.bb            |   14 +++++
 3 files changed, 108 insertions(+), 0 deletions(-)
 create mode 100644 packages/yum/createrepo-native/pathfix.patch
 create mode 100644 packages/yum/createrepo-native_0.9.bb
 create mode 100644 packages/yum/yum-native_3.2.18.bb

diff --git a/packages/yum/createrepo-native/pathfix.patch b/packages/yum/createrepo-native/pathfix.patch
new file mode 100644
index 0000000..a09a51c
--- /dev/null
+++ b/packages/yum/createrepo-native/pathfix.patch
@@ -0,0 +1,81 @@
+Index: createrepo-0.9/Makefile
+===================================================================
+--- createrepo-0.9.orig/Makefile	2008-08-23 17:49:24.000000000 +0100
++++ createrepo-0.9/Makefile	2008-08-23 17:52:01.000000000 +0100
+@@ -10,22 +10,6 @@
+ SHELL = /bin/sh
+ top_srcdir = .
+ srcdir = .
+-prefix = /usr
+-exec_prefix = ${prefix}
+-
+-bindir = ${exec_prefix}/bin
+-sbindir = ${exec_prefix}/sbin
+-libexecdir = ${exec_prefix}/libexec
+-datadir = ${prefix}/share
+-sysconfdir = ${prefix}/etc
+-sharedstatedir = ${prefix}/com
+-localstatedir = ${prefix}/var
+-libdir = ${exec_prefix}/lib
+-infodir = ${prefix}/info
+-docdir = 
+-includedir = ${prefix}/include
+-oldincludedir = /usr/include
+-mandir = ${prefix}/share/man
+ 
+ pkgdatadir = $(datadir)/$(PKGNAME)
+ pkglibdir = $(libdir)/$(PKGNAME)
+Index: createrepo-0.9/bin/Makefile
+===================================================================
+--- createrepo-0.9.orig/bin/Makefile	2008-08-23 17:50:13.000000000 +0100
++++ createrepo-0.9/bin/Makefile	2008-08-23 17:50:23.000000000 +0100
+@@ -1,22 +1,6 @@
+ SHELL = /bin/sh
+ top_srcdir = ..
+ srcdir = ../bin
+-prefix = /usr
+-exec_prefix = ${prefix}
+-
+-bindir = ${exec_prefix}/bin
+-sbindir = ${exec_prefix}/sbin
+-libexecdir = ${exec_prefix}/libexec
+-datadir = ${prefix}/share
+-sysconfdir = ${prefix}/etc
+-sharedstatedir = ${prefix}/com
+-localstatedir = ${prefix}/var
+-libdir = ${exec_prefix}/lib
+-infodir = ${prefix}/info
+-docdir = 
+-includedir = ${prefix}/include
+-oldincludedir = /usr/include
+-mandir = ${prefix}/man
+ 
+ pkgdatadir = $(datadir)/$(PKGNAME)
+ pkglibdir = $(libdir)/$(PKGNAME)
+Index: createrepo-0.9/docs/Makefile
+===================================================================
+--- createrepo-0.9.orig/docs/Makefile	2008-08-23 17:52:42.000000000 +0100
++++ createrepo-0.9/docs/Makefile	2008-08-23 17:52:50.000000000 +0100
+@@ -1,22 +1,6 @@
+ SHELL = /bin/sh
+ top_srcdir = ..
+ srcdir = ../docs
+-prefix = /usr
+-exec_prefix = ${prefix}
+-
+-bindir = ${exec_prefix}/bin
+-sbindir = ${exec_prefix}/sbin
+-libexecdir = ${exec_prefix}/libexec
+-datadir = ${prefix}/share
+-sysconfdir = ${prefix}/etc
+-sharedstatedir = ${prefix}/com
+-localstatedir = ${prefix}/var
+-libdir = ${exec_prefix}/lib
+-infodir = ${prefix}/info
+-docdir = 
+-includedir = ${prefix}/include
+-oldincludedir = /usr/include
+-mandir = ${datadir}/man
+ 
+ pkgdatadir = $(datadir)/$(PKGNAME)
+ pkglibdir = $(libdir)/$(PKGNAME)
diff --git a/packages/yum/createrepo-native_0.9.bb b/packages/yum/createrepo-native_0.9.bb
new file mode 100644
index 0000000..e682667
--- /dev/null
+++ b/packages/yum/createrepo-native_0.9.bb
@@ -0,0 +1,13 @@
+SRC_URI = "http://linux.duke.edu/projects/metadata/generate/createrepo-${PV}.tar.gz \
+           file://pathfix.patch;patch=1 "
+
+inherit autotools native
+
+S = "${WORKDIR}/createrepo-${PV}"
+
+do_compile_append () {
+	sed -e 's#exec /usr/share#exec ${datadir}#' -i ${S}/bin/createrepo
+	sed -e 's#exec /usr/share#exec ${datadir}#' -i ${S}/bin/modifyrepo
+	sed -e 's#!/usr/bin/python#!${bindir}/python#' -i ${S}/genpkgmetadata.py
+	sed -e 's#!/usr/bin/python#!${bindir}/python#' -i ${S}/modifyrepo.py
+}
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
new file mode 100644
index 0000000..6657c52
--- /dev/null
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -0,0 +1,14 @@
+HOMEPAGE = "http://linux.duke.edu/projects/yum/"
+
+SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz"
+
+DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native"
+
+S = "${WORKDIR}/yum-${PV}"
+
+inherit autotools native
+
+do_compile_append () {
+	sed -e 's#!/usr/bin/python#!${bindir}/python#' -e 's#/usr/share#${datadir}#' -i ${S}/bin/yum.py
+	sed -e 's#!/usr/bin/python#!${bindir}/python#' -e 's#/usr/share#${datadir}#' -i ${S}/bin/yum-updatesd.py
+}
-- 
1.6.1.3






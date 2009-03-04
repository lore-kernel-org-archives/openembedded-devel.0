Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaT-0005Zd-TO
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:59 +0100
Received: (qmail 27237 invoked by uid 813007); 4 Mar 2009 15:53:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:56 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPo-0001E4-Jm; Wed, 04 Mar 2009 16:53:48 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:44 +0100
Message-Id: <1236182004-4523-30-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 29/70] yum: fixed packaging (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:02 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5426 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/files/fix          |   18 +++++++++++++++++
 packages/yum/files/paths.patch  |   40 +++++++++++++++++++++++---------------
 packages/yum/files/paths2.patch |   33 ++++++++++++++++++++++++++++++++
 packages/yum/yum_3.2.18.bb      |    8 +++++-
 4 files changed, 81 insertions(+), 18 deletions(-)
 create mode 100644 packages/yum/files/fix
 create mode 100644 packages/yum/files/paths2.patch

diff --git a/packages/yum/files/fix b/packages/yum/files/fix
new file mode 100644
index 0000000..bcb3301
--- /dev/null
+++ b/packages/yum/files/fix
@@ -0,0 +1,18 @@
+---
+ rpmUtils/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- yum-3.2.18.orig/rpmUtils/Makefile
++++ yum-3.2.18/rpmUtils/Makefile
+@@ -1,10 +1,10 @@
+ PYTHON=python
+ PACKAGE = $(shell basename `pwd`)
+ PYFILES = $(wildcard *.py)
+ PYVER := $(shell $(PYTHON) -c 'import sys; print "%.3s" %(sys.version)')
+-PYSYSDIR := $(shell $(PYTHON) -c 'import sys; print sys.prefix')
++PYSYSDIR := /usr
+ PYLIBDIR = $(PYSYSDIR)/lib/python$(PYVER)
+ PKGDIR = $(PYLIBDIR)/site-packages/$(PACKAGE)
+ 
+ all: 
+ 	echo "Nothing to do"
diff --git a/packages/yum/files/paths.patch b/packages/yum/files/paths.patch
index ee5c999..55e6a0a 100644
--- a/packages/yum/files/paths.patch
+++ b/packages/yum/files/paths.patch
@@ -1,8 +1,14 @@
-Index: yum-3.2.18/Makefile
-===================================================================
---- yum-3.2.18.orig/Makefile	2008-08-23 09:13:56.000000000 +0100
-+++ yum-3.2.18/Makefile	2008-08-23 09:18:09.000000000 +0100
-@@ -18,19 +18,19 @@
+---
+ Makefile      |   18 +++++++++---------
+ docs/Makefile |   12 ++++++------
+ etc/Makefile  |   20 ++++++++++----------
+ 3 files changed, 25 insertions(+), 25 deletions(-)
+
+--- yum-3.2.18.orig/Makefile
++++ yum-3.2.18/Makefile
+@@ -16,23 +16,23 @@ clean:
+ 
+ subdirs:
  	for d in $(SUBDIRS); do make PYTHON=$(PYTHON) -C $$d; [ $$? = 0 ] || exit 1 ; done
  
  install:
@@ -27,15 +33,17 @@ Index: yum-3.2.18/Makefile
 -	mkdir -p $(DESTDIR)/var/cache/yum
 -	mkdir -p $(DESTDIR)/var/lib/yum	
 +	mkdir -p $(DESTDIR)$(localstatedir)/cache/yum
-+	mkdir -p $(DESTDIR)$(localstatedir)/lib/yum	
++	mkdir -p $(DESTDIR)$(localstatedir)/lib/yum
  
  	for d in $(SUBDIRS); do make PYTHON=$(PYTHON) DESTDIR=`cd $(DESTDIR); pwd` -C $$d install; [ $$? = 0 ] || exit 1; done
  
-Index: yum-3.2.18/docs/Makefile
-===================================================================
---- yum-3.2.18.orig/docs/Makefile	2008-08-23 09:19:07.000000000 +0100
-+++ yum-3.2.18/docs/Makefile	2008-08-23 09:19:37.000000000 +0100
-@@ -6,9 +6,9 @@
+ .PHONY: docs test
+ 
+--- yum-3.2.18.orig/docs/Makefile
++++ yum-3.2.18/docs/Makefile
+@@ -4,11 +4,11 @@ all:
+ clean:
+ 	rm -f *.pyc *.pyo *~
  	rm -fr epydoc
  
  install:
@@ -51,11 +59,11 @@ Index: yum-3.2.18/docs/Makefile
 +	install -m 644 yum.conf.5 $(DESTDIR)$(mandir)/man5/yum.conf.5
 +	install -m 644 yum-updatesd.8 $(DESTDIR)$(mandir)/man8/yum-updatesd.8
 +	install -m 644 yum-updatesd.conf.5 $(DESTDIR)$(mandir)/man5/yum-updatesd.conf.5
-Index: yum-3.2.18/etc/Makefile
-===================================================================
---- yum-3.2.18.orig/etc/Makefile	2008-08-23 09:19:51.000000000 +0100
-+++ yum-3.2.18/etc/Makefile	2008-08-23 09:20:28.000000000 +0100
-@@ -5,20 +5,20 @@
+--- yum-3.2.18.orig/etc/Makefile
++++ yum-3.2.18/etc/Makefile
+@@ -3,22 +3,22 @@ all:
+ 
+ clean:
  	rm -f *.pyc *.pyo *~
  
  install:
diff --git a/packages/yum/files/paths2.patch b/packages/yum/files/paths2.patch
new file mode 100644
index 0000000..08c9c83
--- /dev/null
+++ b/packages/yum/files/paths2.patch
@@ -0,0 +1,33 @@
+---
+ rpmUtils/Makefile |    2 +-
+ yum/Makefile      |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+--- yum-3.2.18.orig/rpmUtils/Makefile
++++ yum-3.2.18/rpmUtils/Makefile
+@@ -1,10 +1,10 @@
+ PYTHON=python
+ PACKAGE = $(shell basename `pwd`)
+ PYFILES = $(wildcard *.py)
+ PYVER := $(shell $(PYTHON) -c 'import sys; print "%.3s" %(sys.version)')
+-PYSYSDIR := $(shell $(PYTHON) -c 'import sys; print sys.prefix')
++PYSYSDIR = /usr
+ PYLIBDIR = $(PYSYSDIR)/lib/python$(PYVER)
+ PKGDIR = $(PYLIBDIR)/site-packages/$(PACKAGE)
+ 
+ all: 
+ 	echo "Nothing to do"
+--- yum-3.2.18.orig/yum/Makefile
++++ yum-3.2.18/yum/Makefile
+@@ -1,10 +1,10 @@
+ PYTHON=python
+ PACKAGE = $(shell basename `pwd`)
+ PYFILES = $(wildcard *.py)
+ PYVER := $(shell $(PYTHON) -c 'import sys; print "%.3s" %(sys.version)')
+-PYSYSDIR := $(shell $(PYTHON) -c 'import sys; print sys.prefix')
++PYSYSDIR = /usr
+ PYLIBDIR = $(PYSYSDIR)/lib/python$(PYVER)
+ PKGDIR = $(PYLIBDIR)/site-packages/$(PACKAGE)
+ 
+ all: 
+ 	echo "Nothing to do"
diff --git a/packages/yum/yum_3.2.18.bb b/packages/yum/yum_3.2.18.bb
index 9770a4e..4c68803 100644
--- a/packages/yum/yum_3.2.18.bb
+++ b/packages/yum/yum_3.2.18.bb
@@ -1,12 +1,14 @@
 HOMEPAGE = "http://linux.duke.edu/projects/yum/"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://paths.patch;patch=1 \
+           file://paths2.patch;patch=1 \
 	   file://yum-install-recommends.py \
 	   file://extract-postinst.awk"
 
-DEPENDS = "rpm python python-iniparse python-urlgrabber yum-metadata-parser libxml2"
+DEPENDS = "python"
+RDEPENDS = "rpm python-core python-iniparse python-urlgrabber yum-metadata-parser"
 
 S = "${WORKDIR}/yum-${PV}"
 
@@ -22,3 +24,5 @@ do_install_append () {
 	install ${WORKDIR}/extract-postinst.awk ${D}${bindir}/
 	install ${WORKDIR}/yum-install-recommends.py ${D}${bindir}/
 }
+
+FILES_${PN} += "${libdir}/python* ${datadir}/yum-cli"
-- 
1.6.1.3






Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTq-0005Oe-Q1
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:23 +0100
Received: (qmail 26789 invoked by uid 813007); 4 Mar 2009 15:53:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:46 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPe-0001DP-LB; Wed, 04 Mar 2009 16:53:38 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:32 +0100
Message-Id: <1236182004-4523-18-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 17/70] yum-native: Add patch to fix install paths (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:00:15 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5109 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum-native/paths.patch |   88 +++++++++++++++++++++++++++++++++++
 packages/yum/yum-native_3.2.18.bb   |    4 +-
 2 files changed, 91 insertions(+), 1 deletions(-)
 create mode 100644 packages/yum/yum-native/paths.patch

diff --git a/packages/yum/yum-native/paths.patch b/packages/yum/yum-native/paths.patch
new file mode 100644
index 0000000..ee5c999
--- /dev/null
+++ b/packages/yum/yum-native/paths.patch
@@ -0,0 +1,88 @@
+Index: yum-3.2.18/Makefile
+===================================================================
+--- yum-3.2.18.orig/Makefile	2008-08-23 09:13:56.000000000 +0100
++++ yum-3.2.18/Makefile	2008-08-23 09:18:09.000000000 +0100
+@@ -18,19 +18,19 @@
+ 	for d in $(SUBDIRS); do make PYTHON=$(PYTHON) -C $$d; [ $$? = 0 ] || exit 1 ; done
+ 
+ install:
+-	mkdir -p $(DESTDIR)/usr/share/yum-cli
++	mkdir -p $(DESTDIR)$(datadir)/yum-cli
+ 	for p in $(PYFILES) ; do \
+-		install -m 644 $$p $(DESTDIR)/usr/share/yum-cli/$$p; \
++		install -m 644 $$p $(DESTDIR)$(datadir)/yum-cli/$$p; \
+ 	done
+-	mv $(DESTDIR)/usr/share/yum-cli/yum-updatesd.py $(DESTDIR)/usr/share/yum-cli/yumupd.py
+-	$(PYTHON) -c "import compileall; compileall.compile_dir('$(DESTDIR)/usr/share/yum-cli', 1, '$(PYDIR)', 1)"
++	mv $(DESTDIR)$(datadir)/yum-cli/yum-updatesd.py $(DESTDIR)$(datadir)/yum-cli/yumupd.py
++	$(PYTHON) -c "import compileall; compileall.compile_dir('$(DESTDIR)$(datadir)/yum-cli', 1, '$(PYDIR)', 1)"
+ 
+-	mkdir -p $(DESTDIR)/usr/bin $(DESTDIR)/usr/sbin
+-	install -m 755 bin/yum.py $(DESTDIR)/usr/bin/yum
+-	install -m 755 bin/yum-updatesd.py $(DESTDIR)/usr/sbin/yum-updatesd
++	mkdir -p $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir)
++	install -m 755 bin/yum.py $(DESTDIR)$(bindir)/yum
++	install -m 755 bin/yum-updatesd.py $(DESTDIR)$(sbindir)/yum-updatesd
+ 
+-	mkdir -p $(DESTDIR)/var/cache/yum
+-	mkdir -p $(DESTDIR)/var/lib/yum	
++	mkdir -p $(DESTDIR)$(localstatedir)/cache/yum
++	mkdir -p $(DESTDIR)$(localstatedir)/lib/yum	
+ 
+ 	for d in $(SUBDIRS); do make PYTHON=$(PYTHON) DESTDIR=`cd $(DESTDIR); pwd` -C $$d install; [ $$? = 0 ] || exit 1; done
+ 
+Index: yum-3.2.18/docs/Makefile
+===================================================================
+--- yum-3.2.18.orig/docs/Makefile	2008-08-23 09:19:07.000000000 +0100
++++ yum-3.2.18/docs/Makefile	2008-08-23 09:19:37.000000000 +0100
+@@ -6,9 +6,9 @@
+ 	rm -fr epydoc
+ 
+ install:
+-	mkdir -p $(DESTDIR)/usr/share/man/man{5,8}
+-	install -m 644 yum.8 $(DESTDIR)/usr/share/man/man8/yum.8
+-	install -m 644 yum-shell.8 $(DESTDIR)/usr/share/man/man8/yum-shell.8
+-	install -m 644 yum.conf.5 $(DESTDIR)/usr/share/man/man5/yum.conf.5
+-	install -m 644 yum-updatesd.8 $(DESTDIR)/usr/share/man/man8/yum-updatesd.8
+-	install -m 644 yum-updatesd.conf.5 $(DESTDIR)/usr/share/man/man5/yum-updatesd.conf.5
++	mkdir -p $(DESTDIR)$(mandir)/man{5,8}
++	install -m 644 yum.8 $(DESTDIR)$(mandir)/man8/yum.8
++	install -m 644 yum-shell.8 $(DESTDIR)$(mandir)/man8/yum-shell.8
++	install -m 644 yum.conf.5 $(DESTDIR)$(mandir)/man5/yum.conf.5
++	install -m 644 yum-updatesd.8 $(DESTDIR)$(mandir)/man8/yum-updatesd.8
++	install -m 644 yum-updatesd.conf.5 $(DESTDIR)$(mandir)/man5/yum-updatesd.conf.5
+Index: yum-3.2.18/etc/Makefile
+===================================================================
+--- yum-3.2.18.orig/etc/Makefile	2008-08-23 09:19:51.000000000 +0100
++++ yum-3.2.18/etc/Makefile	2008-08-23 09:20:28.000000000 +0100
+@@ -5,20 +5,20 @@
+ 	rm -f *.pyc *.pyo *~
+ 
+ install:
+-	mkdir -p $(DESTDIR)/etc/yum/
+-	mkdir -p $(DESTDIR)/etc/yum/repos.d
++	mkdir -p $(DESTDIR)$(sysconfdir)/yum/
++	mkdir -p $(DESTDIR)$(sysconfdir)/yum/repos.d
+ 
+-	install -m 644 yum.conf $(DESTDIR)/etc/yum/yum.conf
++	install -m 644 yum.conf $(DESTDIR)$(sysconfdir)/yum/yum.conf
+ 
+-	mkdir -p $(DESTDIR)/etc/logrotate.d
+-	install -m 644 yum.logrotate $(DESTDIR)/etc/logrotate.d/yum
++	mkdir -p $(DESTDIR)$(sysconfdir)/logrotate.d
++	install -m 644 yum.logrotate $(DESTDIR)$(sysconfdir)/logrotate.d/yum
+ 
+-	mkdir -p $(DESTDIR)/etc/rc.d/init.d
+-	install -m 755 yum-updatesd.init $(DESTDIR)/etc/rc.d/init.d/yum-updatesd
++	mkdir -p $(DESTDIR)$(sysconfdir)/rc.d/init.d
++	install -m 755 yum-updatesd.init $(DESTDIR)$(sysconfdir)/rc.d/init.d/yum-updatesd
+ 
+-	mkdir -p $(DESTDIR)/etc/dbus-1/system.d/
+-	install -m 755 yum-updatesd-dbus.conf $(DESTDIR)/etc/dbus-1/system.d/yum-updatesd.conf
++	mkdir -p $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
++	install -m 755 yum-updatesd-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/yum-updatesd.conf
+ 
+-	install -m 755 yum-updatesd.conf $(DESTDIR)/etc/yum/yum-updatesd.conf
++	install -m 755 yum-updatesd.conf $(DESTDIR)$(sysconfdir)/yum/yum-updatesd.conf
+ 
+ 
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index 6657c52..d3098cc 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -1,6 +1,8 @@
 HOMEPAGE = "http://linux.duke.edu/projects/yum/"
 
-SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz"
+SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
+           file://paths.patch;patch=1"
+PR = "r1"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native"
 
-- 
1.6.1.3






Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6163B7E09B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 09:30:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2019 02:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,388,1557212400"; d="scan'208";a="242935098"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 18 Jun 2019 02:30:25 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 17:30:23 +0800
Message-Id: <1560850223-83235-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pm-graph: fix multilib build failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2019 09:30:25 -0000

Added the generic library path used by multilib code

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../0001-Makefile-fix-multilib-build-failure.patch | 89 ++++++++++++++++++++++
 meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb    |  5 +-
 2 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
new file mode 100644
index 0000000..56981d9
--- /dev/null
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-Makefile-fix-multilib-build-failure.patch
@@ -0,0 +1,89 @@
+From 50cea8fd3c07ab27da6edce865a49339f16f3b57 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Tue, 18 Jun 2019 17:10:15 +0800
+Subject: [PATCH] Makefile: fix multilib build failure
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ Makefile | 50 +++++++++++++++++++++++++++-----------------------
+ 1 file changed, 27 insertions(+), 23 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8455415..4aa0786 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,30 +1,34 @@
+ # SPDX-License-Identifier: GPL-2.0
+ PREFIX		?= /usr
+ DESTDIR		?=
++BASELIB		?=
+ 
+ all:
+ 	@echo "Nothing to build"
+ 
++clean:
++	@echo "Nothing to clean"
++
+ install : uninstall
+-	install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph
+-	install sleepgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
+-	install bootgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
+-	install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/cgskip.txt $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/freeze-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/freeze.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/freeze-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/standby-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/standby.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/standby-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/suspend-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/suspend.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/suspend-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
+-	install -m 644 config/suspend-x2-proc.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
++	install -d  $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
++	install sleepgraph.py $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
++	install bootgraph.py $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph
++	install -d  $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/cgskip.txt $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/freeze-callgraph.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/freeze.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/freeze-dev.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/standby-callgraph.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/standby.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/standby-dev.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/suspend-callgraph.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/suspend.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/suspend-dev.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
++	install -m 644 config/suspend-x2-proc.cfg $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config
+ 
+ 	install -d  $(DESTDIR)$(PREFIX)/bin
+-	ln -s ../lib/pm-graph/bootgraph.py $(DESTDIR)$(PREFIX)/bin/bootgraph
+-	ln -s ../lib/pm-graph/sleepgraph.py $(DESTDIR)$(PREFIX)/bin/sleepgraph
++	ln -s ../$(BASELIB)/pm-graph/bootgraph.py $(DESTDIR)$(PREFIX)/bin/bootgraph
++	ln -s ../$(BASELIB)/pm-graph/sleepgraph.py $(DESTDIR)$(PREFIX)/bin/sleepgraph
+ 
+ 	install -d  $(DESTDIR)$(PREFIX)/share/man/man8
+ 	install bootgraph.8 $(DESTDIR)$(PREFIX)/share/man/man8
+@@ -37,11 +41,11 @@ uninstall :
+ 	rm -f $(DESTDIR)$(PREFIX)/bin/bootgraph
+ 	rm -f $(DESTDIR)$(PREFIX)/bin/sleepgraph
+ 
+-	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/config/*
+-	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph/config ] ; then \
+-		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph/config; \
++	rm -f $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config/*
++	if [ -d $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config ] ; then \
++		rmdir $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/config; \
+ 	fi;
+-	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/*
+-	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph ] ; then \
+-		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph; \
++	rm -f $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph/*
++	if [ -d $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph ] ; then \
++		rmdir $(DESTDIR)$(PREFIX)/$(BASELIB)/pm-graph; \
+ 	fi;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
index de2d46d..ea12e05 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
@@ -6,11 +6,12 @@ LICENSE  = "GPL-2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
-SRC_URI = "git://github.com/intel/pm-graph.git"
+SRC_URI = "git://github.com/intel/pm-graph.git \
+           file://0001-Makefile-fix-multilib-build-failure.patch"
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST='(i.86|x86_64).*'
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} BASELIB=${baselib}"
 
 do_install() {
         oe_runmake install
-- 
2.7.4



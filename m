Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ludovic.desroches@atmel.com>) id 1QR4X2-00029C-Ef
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 17:37:28 +0200
Received: from meyreuil.atmel.fr ([10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id p4UFV7f8024271
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 08:31:08 -0700 (PDT)
Received: from bendor.rfo.atmel.com ([10.159.245.201])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id p4UFY6a21945; 
	Mon, 30 May 2011 17:34:06 +0200 (MEST)
From: Ludovic Desroches <ludovic.desroches@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 18:43:14 +0200
Message-Id: <09fa504b75a241d161f6263aa74393d19993b075.1306760475.git.ludovic.desroches@atmel.com>
X-Mailer: git-send-email 1.7.5
Subject: [PATCH v2] tiobench: add new recipe for 0.3.3 version
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
X-List-Received-Date: Mon, 30 May 2011 15:37:28 -0000

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 recipes/tiobench/files/tiobench-makefile.patch |   47 ++++++++++++++++++++++++
 recipes/tiobench/tiobench_0.3.3.bb             |   28 ++++++++++++++
 2 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tiobench/files/tiobench-makefile.patch
 create mode 100644 recipes/tiobench/tiobench_0.3.3.bb

diff --git a/recipes/tiobench/files/tiobench-makefile.patch b/recipes/tiobench/files/tiobench-makefile.patch
new file mode 100644
index 0000000..f924c1b
--- /dev/null
+++ b/recipes/tiobench/files/tiobench-makefile.patch
@@ -0,0 +1,47 @@
+Author: Ludovic Desroches <ludovic.desroches@atmel.com>
+
+Adapt tiobench to OE
+Index: Makefile
+===================================================================
+--- a/Makefile	2011-05-26 07:48:46.341400974 +0200
++++ b/Makefile	2011-05-30 06:32:38.091401358 +0200
+@@ -1,8 +1,9 @@
+ # Makefile for tiotest
+ 
+-CC=gcc
++CC?=gcc
+ #CFLAGS=-O3 -fomit-frame-pointer -Wall
+ CFLAGS=-O2 -Wall
++LDFLAGS?=
+ 
+ #DEFINES=-DUSE_MMAP 
+ #-DUSE_MADVISE
+@@ -14,16 +15,16 @@
+ 
+ #DEFINES=
+ 
+-LINK=gcc
++LINK?=$(CC)
+ EXE=tiotest
+ PROJECT=tiobench
+ # do it once instead of each time referenced
+ VERSION=$(shell egrep "tiotest v[0-9]+.[0-9]+" tiotest.c | cut -d " " -f 7 | sed "s/v//g")
+ DISTNAME=$(PROJECT)-$(VERSION)
+ INSTALL=install
+-PREFIX=/usr/local
++PREFIX?=/usr/local
+ BINDIR=$(PREFIX)/bin
+-DOCDIR=/usr/local/doc/$(DISTNAME)
++DOCDIR=$(PREFIX)/doc/$(DISTNAME)
+ 
+ all: $(EXE)
+ 
+@@ -34,7 +35,7 @@
+ 	$(CC) -c $(CFLAGS) $(DEFINES) tiotest.c -o tiotest.o
+ 
+ $(EXE): tiotest.o crc32.o
+-	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread
++	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread $(LDFLAGS)
+ 	@echo
+ 	@echo "./tiobench.pl --help for usage options"
+ 	@echo
diff --git a/recipes/tiobench/tiobench_0.3.3.bb b/recipes/tiobench/tiobench_0.3.3.bb
new file mode 100644
index 0000000..c469ea9
--- /dev/null
+++ b/recipes/tiobench/tiobench_0.3.3.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Threaded I/O tester"
+HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
+LICENSE = "GPL"
+RDEPENDS = "\
+    perl \
+    perl-module-strict \
+    perl-module-getopt-long \
+    perl-module-overload \
+    perl-module-exporter-heavy \
+    "
+PR = "r0"
+
+SRC_URI = "\
+    http://sourceforge.net/projects/tiobench/files/tiobench/0.3.3/tiobench-0.3.3.tar.gz \
+    file://tiobench-makefile.patch \
+    "
+SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
+SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
+
+EXTRA_OEMAKE = "PREFIX=${D}"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install
+}
-- 
1.7.0.4




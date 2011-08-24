Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QwDD3-0008Pj-8t
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 15:09:33 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QwD8S-0000ke-7I from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 06:04:48 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 24 Aug 2011 15:04:46 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2011 18:04:35 +0500
Message-Id: <1314191075-8229-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 24 Aug 2011 13:04:47.0111 (UTC)
	FILETIME=[6662F170:01CC625E]
Subject: [meta-oe][PATCH] tiobench: Add version 0.3.3 (initial recipe)
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
X-List-Received-Date: Wed, 24 Aug 2011 13:09:33 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id 821f47e170dddabaef3925fd62c5423210dcb363.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../tiobench-0.3.3/tiobench-makefile.patch         |   47 ++++++++++++++++++++
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |   25 ++++++++++
 2 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
new file mode 100644
index 0000000..66f5a7d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
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
++DOCDIR=$(PREFIX)/share/doc/$(DISTNAME)
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
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
new file mode 100644
index 0000000..636e2d1
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Threaded I/O tester"
+HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+RDEPENDS = "\
+    perl \
+    perl-module-exporter-heavy \
+    perl-module-getopt-long \
+    perl-module-overload \
+    perl-module-strict \
+    "
+PR = "r0"
+
+SRC_URI = "\
+    http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${P}.tar.gz \
+    file://tiobench-makefile.patch \
+    "
+SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
+SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
+
+EXTRA_OEMAKE = "PREFIX=${D}/usr"
+
+do_install() {
+    oe_runmake install
+}
-- 
1.7.0.4




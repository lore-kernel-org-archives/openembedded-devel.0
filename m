Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E84672B9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 03:21:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56382503"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jan 2015 11:18:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0L3L3oK030700
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:21:04 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 21 Jan 2015 11:21:46 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 11:21:03 +0800
Message-ID: <1421810463-4921-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20141121140300.GF2163@jama>
References: <20141121140300.GF2163@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH v2] sgpio: add new recipe
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
X-List-Received-Date: Wed, 21 Jan 2015 03:21:52 -0000
Content-Type: text/plain

Intel SGPIO enclosure management utility.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../sgpio/sgpio/0001-Makefile-error-fix.patch      | 129 +++++++++++++++++++++
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |  26 +++++
 2 files changed, 155 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix.patch
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb

diff --git a/meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix.patch b/meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix.patch
new file mode 100644
index 0000000..c6b888e
--- /dev/null
+++ b/meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix.patch
@@ -0,0 +1,129 @@
+From 9ad360c663bbd2886fda7b18283694ff53d77a42 Mon Sep 17 00:00:00 2001
+From: Li Xin <lix.fnst@cn.fujitsu.com>
+Date: Wed, 21 Jan 2015 09:50:11 +0800
+Subject: [PATCH] Makefile: error fix
+
+the error is: install: cannot remove '/sbin/sgpio': Permission denied
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile | 107 ++++++++++++++++++++++++++++++++-------------------------------
+ 1 file changed, 55 insertions(+), 52 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 278d966..c2b0bc7 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,52 +1,55 @@
+-########################################################################
+-# Copyright (C) 2007-2008, Intel Corp. All rights reserved.
+-#
+-#
+-# This program is free software; you can redistribute it and/or modify it under
+-# the terms of the GNU General Public License as published by the Free Software
+-# Foundation; either version 2 of the License, or (at your option) any later version.
+-#
+-# This program is distributed in the hope that it will be useful, but
+-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
+-# for more details.
+-#
+-# You should have received a copy of the GNU General Public License along
+-# with this program; if not, write to the Free Software Foundation, Inc.,
+-# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+-########################################################################
+-
+-
+-# Intel SGPIO enclosure management utility
+-#
+-# Author: Eric R Hall <Eric.R.Hall@intel.com>
+-
+-
+-MANDIR ?= /usr/local/man
+-ALL = sgpio
+-
+-all: $(ALL)
+-
+-sgpio.o: sgpio.c
+-	gcc -g -Wall -c sgpio.c
+-
+-sgpio: sgpio.o
+-	gcc -g sgpio.o -o sgpio
+-
+-clean:
+-	rm -f sgpio.o sgpio
+-
+-install: $(ALL)
+-	for i in $(ALL); do \
+-		install $$i /sbin/$$i; \
+-	done
+-	install -d $(MANDIR)/man1
+-	install -m 0644 *.1 $(MANDIR)/man1
+-
+-uninstall:
+-	for i in $(ALL); do \
+-		rm -f /sbin/$$i; \
+-	done
+-	for i in $(ALL:=.1); do \
+-		rm -f $(MANDIR)/man1/$$i; \
+-	done
++########################################################################
++# Copyright (C) 2007-2008, Intel Corp. All rights reserved.
++#
++#
++# This program is free software; you can redistribute it and/or modify it under
++# the terms of the GNU General Public License as published by the Free Software
++# Foundation; either version 2 of the License, or (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful, but
++# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
++# for more details.
++#
++# You should have received a copy of the GNU General Public License along
++# with this program; if not, write to the Free Software Foundation, Inc.,
++# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
++########################################################################
++
++
++# Intel SGPIO enclosure management utility
++#
++# Author: Eric R Hall <Eric.R.Hall@intel.com>
++
++
++MANDIR ?= /usr/local/man
++SBIN_DIR = /sbin
++INSTALL =/usr/bin/install -c
++ALL = sgpio
++CFLAGS = -g -Wall
++
++all: $(ALL)
++
++sgpio.o: sgpio.c
++	${CC} $(CFLAGS) -c sgpio.c
++
++sgpio: sgpio.o
++	${CC} -g sgpio.o -o sgpio
++
++clean:
++	rm -f sgpio.o sgpio
++
++install: $(ALL)
++	for i in $(ALL); do \
++		$(INSTALL) -D $$i $(SBIN_DIR)/$$i; \
++	done
++	$(INSTALL) -d $(MANDIR)/man1
++	$(INSTALL) -m 0644 *.1 $(MANDIR)/man1
++
++uninstall:
++	for i in $(ALL); do \
++		rm -f /sbin/$$i; \
++	done
++	for i in $(ALL:=.1); do \
++		rm -f $(MANDIR)/man1/$$i; \
++	done
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
new file mode 100644
index 0000000..722ba33
--- /dev/null
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -0,0 +1,26 @@
+SUMMARY = "SGPIO captive backplane tool"
+DESCRIPTION = "Intel SGPIO enclosure management utility"
+
+SRC_URI = " \
+    http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.tar.gz/a417bf68da4e9bd79a4664c11d7debd1/${BPN}-1.2-0.10-src.tar.gz \
+    file://0001-Makefile-error-fix.patch \
+"
+SRC_URI[md5sum] = "a417bf68da4e9bd79a4664c11d7debd1"
+SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
+
+S = "${WORKDIR}/${PN}"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE_GPL;md5=393a5ca445f6965873eca0259a17f833"
+
+do_compile_prepend() {
+    oe_runmake clean
+}
+
+do_install() {
+    oe_runmake install \
+        INSTALL="/usr/bin/install -p" \
+        DESTDIR=${D} \
+        SBIN_DIR=${D}/${sbindir} \
+        MANDIR=${D}/${mandir}
+}
-- 
1.8.4.2



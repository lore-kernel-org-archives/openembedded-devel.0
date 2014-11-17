Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 36E0972167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 11:01:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43496693"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 18:58:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAHB1Rmn018964
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 19:01:27 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 19:01:45 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 19:00:08 +0800
Message-ID: <1416222008-9218-6-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH 5/5] sgpio : add new recipe
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
X-List-Received-Date: Mon, 17 Nov 2014 11:01:42 -0000
Content-Type: text/plain

Intel SGPIO enclosure management utility

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../0001-Makefile-modify-some-parameters.patch     | 51 ++++++++++++++++++++++
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   | 28 ++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-modify-some-parameters.patch
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb

diff --git a/meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-modify-some-parameters.patch b/meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-modify-some-parameters.patch
new file mode 100644
index 0000000..8b23a19
--- /dev/null
+++ b/meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-modify-some-parameters.patch
@@ -0,0 +1,51 @@
+From ecb100a252c691075720ff0604e2ebdb83deb994 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Mon, 17 Nov 2014 12:26:21 +0900
+Subject: [PATCH] Makefile : modify some parameters
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 278d966..431d993 100755
+--- a/Makefile
++++ b/Makefile
+@@ -23,25 +23,28 @@
+ 
+ 
+ MANDIR ?= /usr/local/man
++SBIN_DIR = /sbin
++INSTALL =/usr/bin/install -c
+ ALL = sgpio
++CFLAGS = -g -Wall
+ 
+ all: $(ALL)
+ 
+ sgpio.o: sgpio.c
+-	gcc -g -Wall -c sgpio.c
++	${CC} $(CFLAGS) -c sgpio.c
+ 
+ sgpio: sgpio.o
+-	gcc -g sgpio.o -o sgpio
++	${CC} -g sgpio.o -o sgpio
+ 
+ clean:
+ 	rm -f sgpio.o sgpio
+ 
+ install: $(ALL)
+ 	for i in $(ALL); do \
+-		install $$i /sbin/$$i; \
++	    $(INSTALL) -D $$i $(SBIN_DIR)/$$i; \
+ 	done
+-	install -d $(MANDIR)/man1
+-	install -m 0644 *.1 $(MANDIR)/man1
++	$(INSTALL) -d $(MANDIR)/man1
++	$(INSTALL) -m 0644 *.1 $(MANDIR)/man1
+ 
+ uninstall:
+ 	for i in $(ALL); do \
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
new file mode 100644
index 0000000..7867d9d
--- /dev/null
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -0,0 +1,28 @@
+SUMMARY = "SGPIO captive backplane tool"
+DESCRIPTION = "Intel SGPIO enclosure management utility"
+HOMEPAGE = "http://sources.redhat.com/lvm2/wiki/DMRAID_Eventing"
+SECTION = "System Environment/Base"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-1.2-0.10-src.tar.gz/a417bf68da4e9bd79a4664c11d7debd1/${PN}-1.2-0.10-src.tar.gz"
+
+SRC_URI += "file://0001-Makefile-modify-some-parameters.patch"
+
+SRC_URI[md5sum] = "a417bf68da4e9bd79a4664c11d7debd1"
+SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
+
+S = "${WORKDIR}/${PN}"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE_GPL;md5=393a5ca445f6965873eca0259a17f833"
+
+do_compile_prepend() {
+	oe_runmake clean
+}
+
+do_install() {
+	oe_runmake install \
+                INSTALL="/usr/bin/install -p" \
+                DESTDIR=${D} \
+	        SBIN_DIR=${D}/${sbindir} \
+	        MANDIR=${D}/${mandir}
+}
-- 
1.8.4.2



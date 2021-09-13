Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.977.1631568115462155244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 14:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18DLLsSn028067
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 14:21:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18DLLrPM010458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 14:21:54 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 14:21:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 13 Sep 2021 14:21:52 -0700
Received: from localhost.localdomain (128.224.72.66) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 14:21:52 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH 2/2] lmdb: use libprefix in Makefile to install libraries
Date: Mon, 13 Sep 2021 17:21:41 -0400
Message-ID: <20210913212141.353383-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913212141.353383-1-sakib.sajal@windriver.com>
References: <20210913212141.353383-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Makefile used libdir which had hardcoded "$(exec_prefix)/lib"
directory to install libraries. This is a problem for MULTILIB
builds as libraries are installed in "lib64" directory.
Hence use libprefix which contains the correct path for installing
libraries.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 15ee78730ae2793c5211562fdac7619279794870)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...file-use-libprefix-instead-of-libdir.patch | 33 +++++++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       |  5 +--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch

diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch b/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
new file mode 100644
index 000000000..2cc98e6d6
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
@@ -0,0 +1,33 @@
+From 4a11d4d03ef66729d302cc122fa0c693299a7776 Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Wed, 18 Aug 2021 10:49:38 -0400
+Subject: [PATCH] Makefile: use libprefix instead of libdir
+
+libdir expands to "$(exec_prefix)/lib" where "lib" is hardcoded.
+This is a problem for builds that enable MULTILIB since libraries
+are to be installed in "lib64" directory. Hence allow the directory
+to be configurable.
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ libraries/liblmdb/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f254511..1ec74e6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -46,11 +46,11 @@ all:	$(ILIBS) $(PROGS)
+ 
+ install: $(ILIBS) $(IPROGS) $(IHDRS)
+ 	mkdir -p $(DESTDIR)$(bindir)
+-	mkdir -p $(DESTDIR)$(libdir)
++	mkdir -p $(DESTDIR)$(libprefix)
+ 	mkdir -p $(DESTDIR)$(includedir)
+ 	mkdir -p $(DESTDIR)$(mandir)/man1
+ 	for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir); done
+-	for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); done
++	for f in $(ILIBS); do cp $$f $(DESTDIR)$(libprefix); done
+ 	for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedir); done
+ 	for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/man1; done
+ 
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index 0746da141..3c6ffe04e 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
 
 SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
            file://run-ptest \
-"
+           file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
+           "
 
 SRCREV = "LMDB_${PV}"
 
@@ -26,7 +27,7 @@ do_compile() {
 
 do_install() {
     oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
-    cd ${D}/${libdir}
+    cd ${D}${libdir}
     ln -s liblmdb.so.${PV} liblmdb.so
     rm liblmdb.a
 }
-- 
2.25.1


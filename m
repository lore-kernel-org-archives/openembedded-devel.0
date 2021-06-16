Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.593.1623867688682702344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 11:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15GILRpq026901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 11:21:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 16 Jun 2021 11:21:27 -0700
Received: from localhost.localdomain (128.224.73.109) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 16 Jun 2021 11:21:26 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lmdb: add recipe
Date: Wed, 16 Jun 2021 14:21:23 -0400
Message-ID: <20210616182123.45393-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

lmdb provides a high-performance embedded transactional
database in the form of a key-value store.

Recipe is ported from meta-qt5-extra layer.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../files/0001-Patch-the-main-Makefile.patch  | 90 +++++++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_git.bb          | 22 +++++
 2 files changed, 112 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
 create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_git.bb

diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
new file mode 100644
index 000000000..9ba626101
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
@@ -0,0 +1,90 @@
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 1 Sep 2015 22:54:31 +0200
+Subject: [PATCH] Patch the main Makefile to allow for a build that complies to packaging guidelines.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Taken from [1]
+
+[1] https://src.fedoraproject.org/rpms/lmdb/raw/master/f/lmdb-make.patch
+
+Upstream-Status: Pending
+
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -26,6 +26,7 @@ OPT = -O2 -g
+ CFLAGS	= $(THREADS) $(OPT) $(W) $(XCFLAGS)
+ LDLIBS	=
+ SOLIBS	=
++SOVERSION	= 0.0.0
+ SOEXT	= .so
+ prefix	= /usr/local
+ exec_prefix = $(prefix)
+@@ -38,7 +39,7 @@ mandir = $(datarootdir)/man
+ ########################################################################
+ 
+ IHDRS	= lmdb.h
+-ILIBS	= liblmdb.a liblmdb$(SOEXT)
++ILIBS	= liblmdb$(SOEXT) liblmdb$(SOEXT).$(SOVERSION)
+ IPROGS	= mdb_stat mdb_copy mdb_dump mdb_load
+ IDOCS	= mdb_stat.1 mdb_copy.1 mdb_dump.1 mdb_load.1
+ PROGS	= $(IPROGS) mtest mtest2 mtest3 mtest4 mtest5
+@@ -49,13 +50,13 @@ install: $(ILIBS) $(IPROGS) $(IHDRS)
+ 	mkdir -p $(DESTDIR)$(libdir)
+ 	mkdir -p $(DESTDIR)$(includedir)
+ 	mkdir -p $(DESTDIR)$(mandir)/man1
+-	for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir); done
+-	for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); done
+-	for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedir); done
+-	for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/man1; done
++	for f in $(IPROGS); do cp -a $$f $(DESTDIR)$(bindir); done
++	for f in $(ILIBS); do cp -a $$f $(DESTDIR)$(libdir); done
++	for f in $(IHDRS); do cp -a $$f $(DESTDIR)$(includedir); done
++	for f in $(IDOCS); do cp -a $$f $(DESTDIR)$(mandir)/man1; done
+ 
+ clean:
+-	rm -rf $(PROGS) *.[ao] *.[ls]o *~ testdb
++	rm -rf $(PROGS) *.[ao] *.[ls]o* *~ testdb
+ 
+ test:	all
+ 	rm -rf testdb && mkdir testdb
+@@ -64,20 +65,24 @@ test:	all
+ liblmdb.a:	mdb.o midl.o
+ 	$(AR) rs $@ mdb.o midl.o
+ 
+-liblmdb$(SOEXT):	mdb.lo midl.lo
++liblmdb$(SOEXT):	liblmdb$(SOEXT).$(SOVERSION)
++	rm -f $@
++	ln -s $< $@
++
++liblmdb$(SOEXT).$(SOVERSION):	mdb.lo midl.lo
+ #	$(CC) $(LDFLAGS) -pthread -shared -Wl,-Bsymbolic -o $@ mdb.o midl.o $(SOLIBS)
+-	$(CC) $(LDFLAGS) -pthread -shared -o $@ mdb.lo midl.lo $(SOLIBS)
++	$(CC) $(LDFLAGS) -pthread -shared -Wl,-soname,$@ -o $@ mdb.lo midl.lo $(SOLIBS)
+ 
+-mdb_stat: mdb_stat.o liblmdb.a
+-mdb_copy: mdb_copy.o liblmdb.a
+-mdb_dump: mdb_dump.o liblmdb.a
+-mdb_load: mdb_load.o liblmdb.a
+-mtest:    mtest.o    liblmdb.a
+-mtest2:	mtest2.o liblmdb.a
+-mtest3:	mtest3.o liblmdb.a
+-mtest4:	mtest4.o liblmdb.a
+-mtest5:	mtest5.o liblmdb.a
+-mtest6:	mtest6.o liblmdb.a
++mdb_stat: mdb_stat.o liblmdb.so
++mdb_copy: mdb_copy.o liblmdb.so
++mdb_dump: mdb_dump.o liblmdb.so
++mdb_load: mdb_load.o liblmdb.so
++mtest:    mtest.o    liblmdb.so
++mtest2:	mtest2.o liblmdb.so
++mtest3:	mtest3.o liblmdb.so
++mtest4:	mtest4.o liblmdb.so
++mtest5:	mtest5.o liblmdb.so
++mtest6:	mtest6.o liblmdb.so
+ 
+ mdb.o: mdb.c lmdb.h midl.h
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) -c mdb.c
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_git.bb b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
new file mode 100644
index 000000000..22db6d44b
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Symas Lightning Memory-Mapped Database (LMDB)"
+HOMEPAGE = "http://symas.com/mdb/"
+LICENSE = "OLDAP-2.8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
+
+SRC_URI = " \
+    git://github.com/LMDB/lmdb.git;nobranch=1 \
+    file://0001-Patch-the-main-Makefile.patch \
+"
+SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
+S = "${WORKDIR}/git/libraries/liblmdb"
+PV = "0.9.29"
+
+do_compile() {
+    oe_runmake "CC=${CC}"
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} prefix=${prefix} libdir=${libdir} mandir=${mandir} install
+    chown -R root:root ${D}${bindir}
+    chown -R root:root ${D}${libdir}
+}
-- 
2.25.1


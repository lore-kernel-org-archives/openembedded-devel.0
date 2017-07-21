Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 751907837D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:35:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L7Z2lw009776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 00:35:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:35:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:44 -0400
Message-ID: <dd538c3fa7c3e4924d02d1145f83b6e1458f8bcf.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/10] isomd5sum: add recipe 1.2.1
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
X-List-Received-Date: Fri, 21 Jul 2017 07:35:02 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-tweak-install-prefix.patch          | 60 ++++++++++++++++++++++
 .../isomd5sum/files/0002-fix-parallel-error.patch  | 33 ++++++++++++
 .../recipes-extended/isomd5sum/isomd5sum_1.2.1.bb  | 35 +++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
 create mode 100644 meta-oe/recipes-extended/isomd5sum/files/0002-fix-parallel-error.patch
 create mode 100644 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb

diff --git a/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch b/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
new file mode 100644
index 0000000..bcfc117
--- /dev/null
+++ b/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
@@ -0,0 +1,60 @@
+From cffe4767f89ea0b54b57e8bf9065a08a9c38d46e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Jul 2017 21:53:00 -0400
+Subject: [PATCH] tweak install prefix
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index df16a3b..fbdfcb4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -39,26 +39,26 @@ pyisomd5sum.so: $(PYOBJS)
+ install: all install-bin install-python install-devel
+ 
+ install-bin:
+-	install -d -m 0755 $(DESTDIR)/usr/bin
+-	install -d -m 0755 $(DESTDIR)/usr/share/man/man1
+-	install -m 0755 implantisomd5 $(DESTDIR)/usr/bin
+-	install -m 0755 checkisomd5 $(DESTDIR)/usr/bin
+-	install -m 0644 implantisomd5.1 $(DESTDIR)/usr/share/man/man1
+-	install -m 0644 checkisomd5.1 $(DESTDIR)/usr/share/man/man1
++	install -d -m 0755 $(DESTDIR)$(bindir)
++	install -d -m 0755 $(DESTDIR)$(mandir)/man1
++	install -m 0755 implantisomd5 $(DESTDIR)$(bindir)
++	install -m 0755 checkisomd5 $(DESTDIR)$(bindir)
++	install -m 0644 implantisomd5.1 $(DESTDIR)$(mandir)/man1
++	install -m 0644 checkisomd5.1 $(DESTDIR)$(mandir)/man1
+ 
+ install-python:
+ 	install -d -m 0755 $(DESTDIR)$(PYTHONSITEPACKAGES)
+ 	install -m 0755 pyisomd5sum.so $(DESTDIR)$(PYTHONSITEPACKAGES)
+ 
+ install-devel:
+-	install -d -m 0755 $(DESTDIR)/usr/include
+-	install -d -m 0755 $(DESTDIR)/usr/$(LIBDIR)
+-	install -d -m 0755 $(DESTDIR)/usr/share/pkgconfig
+-	install -m 0644 libimplantisomd5.h $(DESTDIR)/usr/include/
+-	install -m 0644 libcheckisomd5.h $(DESTDIR)/usr/include/
+-	install -m 0644 libimplantisomd5.a $(DESTDIR)/usr/$(LIBDIR)
+-	install -m 0644 libcheckisomd5.a $(DESTDIR)/usr/$(LIBDIR)
+-	sed "s#@VERSION@#${VERSION}#g; s#@includedir@#${DESTDIR}/usr/include#g; s#@libdir@#${DESTDIR}/usr/${LIBDIR}#g" isomd5sum.pc.in > ${DESTDIR}/usr/share/pkgconfig/isomd5sum.pc
++	install -d -m 0755 $(DESTDIR)$(includedir)
++	install -d -m 0755 $(DESTDIR)$(libdir)
++	install -d -m 0755 $(DESTDIR)${datadir}/pkgconfig
++	install -m 0644 libimplantisomd5.h $(DESTDIR)$(includedir)
++	install -m 0644 libcheckisomd5.h $(DESTDIR)$(includedir)
++	install -m 0644 libimplantisomd5.a $(DESTDIR)$(libdir)
++	install -m 0644 libcheckisomd5.a $(DESTDIR)$(libdir)
++	sed "s#@VERSION@#${VERSION}#g; s#@includedir@#${DESTDIR}/usr/include#g; s#@libdir@#${DESTDIR}/usr/${LIBDIR}#g" isomd5sum.pc.in > ${DESTDIR}${datadir}/pkgconfig/isomd5sum.pc
+ 
+ clean:
+ 	rm -f *.o *.so *.pyc *.a .depend *~
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/isomd5sum/files/0002-fix-parallel-error.patch b/meta-oe/recipes-extended/isomd5sum/files/0002-fix-parallel-error.patch
new file mode 100644
index 0000000..7a33e42
--- /dev/null
+++ b/meta-oe/recipes-extended/isomd5sum/files/0002-fix-parallel-error.patch
@@ -0,0 +1,33 @@
+From 2acce7bc8ab7711e76c7765c84a198fe38f247f3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Jul 2017 23:06:41 -0400
+Subject: [PATCH] fix parallel error
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fbdfcb4..2ad3238 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,9 +29,11 @@ implantisomd5: implantisomd5.o libimplantisomd5.a
+ checkisomd5: checkisomd5.o libcheckisomd5.a
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) checkisomd5.o libcheckisomd5.a -lpopt $(LDFLAGS) -o checkisomd5
+ 
+-libimplantisomd5.a: libimplantisomd5.a(libimplantisomd5.o md5.o utilities.o)
++libimplantisomd5.a: libimplantisomd5.o md5.o utilities.o
++	$(AR) rv $@ $^
+ 
+-libcheckisomd5.a: libcheckisomd5.a(libcheckisomd5.o md5.o utilities.o)
++libcheckisomd5.a: libcheckisomd5.o md5.o utilities.o
++	$(AR) rv $@ $^
+ 
+ pyisomd5sum.so: $(PYOBJS)
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) -shared -g -fpic $(PYOBJS) $(LDFLAGS) -o pyisomd5sum.so
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
new file mode 100644
index 0000000..815113e
--- /dev/null
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Tools for taking the MD5 sum of ISO images"
+DESCRIPTION = "Tools for taking the MD5 sum of ISO images"
+
+DEPENDS = "popt python3 openssl curl popt-native"
+RDEPENDS_${PN} = "openssl curl"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+SRC_URI = "git://github.com/rhinstaller/isomd5sum.git;branch=master \
+           file://0001-tweak-install-prefix.patch \
+           file://0002-fix-parallel-error.patch \
+"
+
+S = "${WORKDIR}/git"
+inherit python3native
+
+EXTRA_OEMAKE += " \
+    DESTDIR='${D}' \
+    PYTHONINCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+    PYTHONSITEPACKAGES='${PYTHON_SITEPACKAGES_DIR}' \
+"
+
+do_install () {
+    oe_runmake install
+}
+
+PACKAGES += "${PYTHON_PN}-${PN} ${PYTHON_PN}-${PN}-dbg"
+
+FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
+FILES_${PYTHON_PN}-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug/pyisomd5sum.so"
+
+SRCREV = "69dc036d20761715b734ca9cc59ecc6dc8145026"
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



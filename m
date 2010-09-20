Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OxlYy-000264-LH
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 20:58:05 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id A8FB62439E; Mon, 20 Sep 2010 22:58:01 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Sep 2010 22:57:55 +0400
Message-Id: <1285009075-19687-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1285009075-19687-1-git-send-email-khimov@altell.ru>
References: <1285009075-19687-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] bzip2: remove 1.0.2
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
X-List-Received-Date: Mon, 20 Sep 2010 18:58:05 -0000

Very old, not pinned, has known bugs and security issues.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/bzip2/bzip2-1.0.2/installpaths.patch |  103 --------------------------
 recipes/bzip2/bzip2-1.0.2/ldflags.patch      |   14 ----
 recipes/bzip2/bzip2_1.0.2.bb                 |   45 -----------
 3 files changed, 0 insertions(+), 162 deletions(-)
 delete mode 100644 recipes/bzip2/bzip2-1.0.2/installpaths.patch
 delete mode 100644 recipes/bzip2/bzip2-1.0.2/ldflags.patch
 delete mode 100644 recipes/bzip2/bzip2_1.0.2.bb

diff --git a/recipes/bzip2/bzip2-1.0.2/installpaths.patch b/recipes/bzip2/bzip2-1.0.2/installpaths.patch
deleted file mode 100644
index e7d09a7..0000000
--- a/recipes/bzip2/bzip2-1.0.2/installpaths.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- bzip2-1.0.2/Makefile~installpaths
-+++ bzip2-1.0.2/Makefile
-@@ -12,8 +12,12 @@
- CFLAGS=-Wall -Winline -O2 -fomit-frame-pointer -fno-strength-reduce $(BIGFILES)
- 
- # Where you want it installed when you do 'make install'
--PREFIX=/usr
--
-+DESTDIR=
-+prefix=/usr
-+bindir=$(prefix)/bin
-+mandir=$(prefix)/man
-+includedir=$(prefix)/include
-+libdir=$(prefix)/lib
- 
- OBJS= blocksort.o  \
-       huffman.o    \
-@@ -58,43 +62,43 @@
- 	@cat words3
- 
- install: bzip2 bzip2recover
--	if ( test ! -d $(PREFIX)/bin ) ; then mkdir -p $(PREFIX)/bin ; fi
--	if ( test ! -d $(PREFIX)/lib ) ; then mkdir -p $(PREFIX)/lib ; fi
--	if ( test ! -d $(PREFIX)/man ) ; then mkdir -p $(PREFIX)/man ; fi
--	if ( test ! -d $(PREFIX)/man/man1 ) ; then mkdir -p $(PREFIX)/man/man1 ; fi
--	if ( test ! -d $(PREFIX)/include ) ; then mkdir -p $(PREFIX)/include ; fi
--	cp -f bzip2 $(PREFIX)/bin/bzip2
--	cp -f bzip2 $(PREFIX)/bin/bunzip2
--	cp -f bzip2 $(PREFIX)/bin/bzcat
--	cp -f bzip2recover $(PREFIX)/bin/bzip2recover
--	chmod a+x $(PREFIX)/bin/bzip2
--	chmod a+x $(PREFIX)/bin/bunzip2
--	chmod a+x $(PREFIX)/bin/bzcat
--	chmod a+x $(PREFIX)/bin/bzip2recover
--	cp -f bzip2.1 $(PREFIX)/man/man1
--	chmod a+r $(PREFIX)/man/man1/bzip2.1
--	cp -f bzlib.h $(PREFIX)/include
--	chmod a+r $(PREFIX)/include/bzlib.h
--	cp -f libbz2.a $(PREFIX)/lib
--	chmod a+r $(PREFIX)/lib/libbz2.a
--	cp -f bzgrep $(PREFIX)/bin/bzgrep
--	ln $(PREFIX)/bin/bzgrep $(PREFIX)/bin/bzegrep
--	ln $(PREFIX)/bin/bzgrep $(PREFIX)/bin/bzfgrep
--	chmod a+x $(PREFIX)/bin/bzgrep
--	cp -f bzmore $(PREFIX)/bin/bzmore
--	ln $(PREFIX)/bin/bzmore $(PREFIX)/bin/bzless
--	chmod a+x $(PREFIX)/bin/bzmore
--	cp -f bzdiff $(PREFIX)/bin/bzdiff
--	ln $(PREFIX)/bin/bzdiff $(PREFIX)/bin/bzcmp
--	chmod a+x $(PREFIX)/bin/bzdiff
--	cp -f bzgrep.1 bzmore.1 bzdiff.1 $(PREFIX)/man/man1
--	chmod a+r $(PREFIX)/man/man1/bzgrep.1
--	chmod a+r $(PREFIX)/man/man1/bzmore.1
--	chmod a+r $(PREFIX)/man/man1/bzdiff.1
--	echo ".so man1/bzgrep.1" > $(PREFIX)/man/man1/bzegrep.1
--	echo ".so man1/bzgrep.1" > $(PREFIX)/man/man1/bzfgrep.1
--	echo ".so man1/bzmore.1" > $(PREFIX)/man/man1/bzless.1
--	echo ".so man1/bzdiff.1" > $(PREFIX)/man/man1/bzcmp.1
-+	if ( test ! -d $(DESTDIR)$(bindir) ) ; then mkdir -p $(DESTDIR)$(bindir) ; fi
-+	if ( test ! -d $(DESTDIR)$(libdir) ) ; then mkdir -p $(DESTDIR)$(libdir) ; fi
-+	if ( test ! -d $(DESTDIR)$(mandir) ) ; then mkdir -p $(DESTDIR)$(mandir) ; fi
-+	if ( test ! -d $(DESTDIR)$(mandir)/man1 ) ; then mkdir -p $(DESTDIR)$(mandir)/man1 ; fi
-+	if ( test ! -d $(DESTDIR)$(includedir) ) ; then mkdir -p $(DESTDIR)$(includedir) ; fi
-+	cp -f bzip2 $(DESTDIR)$(bindir)/bzip2
-+	cp -f bzip2 $(DESTDIR)$(bindir)/bunzip2
-+	cp -f bzip2 $(DESTDIR)$(bindir)/bzcat
-+	cp -f bzip2recover $(DESTDIR)$(bindir)/bzip2recover
-+	chmod a+x $(DESTDIR)$(bindir)/bzip2
-+	chmod a+x $(DESTDIR)$(bindir)/bunzip2
-+	chmod a+x $(DESTDIR)$(bindir)/bzcat
-+	chmod a+x $(DESTDIR)$(bindir)/bzip2recover
-+	cp -f bzip2.1 $(DESTDIR)$(mandir)/man1
-+	chmod a+r $(DESTDIR)$(mandir)/man1/bzip2.1
-+	cp -f bzlib.h $(DESTDIR)$(includedir)
-+	chmod a+r $(DESTDIR)$(includedir)/bzlib.h
-+	cp -f libbz2.a $(DESTDIR)$(libdir)
-+	chmod a+r $(DESTDIR)$(libdir)/libbz2.a
-+	cp -f bzgrep $(DESTDIR)$(bindir)/bzgrep
-+	ln $(DESTDIR)$(bindir)/bzgrep $(DESTDIR)$(bindir)/bzegrep
-+	ln $(DESTDIR)$(bindir)/bzgrep $(DESTDIR)$(bindir)/bzfgrep
-+	chmod a+x $(DESTDIR)$(bindir)/bzgrep
-+	cp -f bzmore $(DESTDIR)$(bindir)/bzmore
-+	ln $(DESTDIR)$(bindir)/bzmore $(DESTDIR)$(bindir)/bzless
-+	chmod a+x $(DESTDIR)$(bindir)/bzmore
-+	cp -f bzdiff $(DESTDIR)$(bindir)/bzdiff
-+	ln $(DESTDIR)$(bindir)/bzdiff $(DESTDIR)$(bindir)/bzcmp
-+	chmod a+x $(DESTDIR)$(bindir)/bzdiff
-+	cp -f bzgrep.1 bzmore.1 bzdiff.1 $(DESTDIR)$(mandir)/man1
-+	chmod a+r $(DESTDIR)$(mandir)/man1/bzgrep.1
-+	chmod a+r $(DESTDIR)$(mandir)/man1/bzmore.1
-+	chmod a+r $(DESTDIR)$(mandir)/man1/bzdiff.1
-+	echo ".so man1/bzgrep.1" > $(DESTDIR)$(mandir)/man1/bzegrep.1
-+	echo ".so man1/bzgrep.1" > $(DESTDIR)$(mandir)/man1/bzfgrep.1
-+	echo ".so man1/bzmore.1" > $(DESTDIR)$(mandir)/man1/bzless.1
-+	echo ".so man1/bzdiff.1" > $(DESTDIR)$(mandir)/man1/bzcmp.1
- 
- distclean: clean
- clean: 
diff --git a/recipes/bzip2/bzip2-1.0.2/ldflags.patch b/recipes/bzip2/bzip2-1.0.2/ldflags.patch
deleted file mode 100644
index c7da5bc..0000000
--- a/recipes/bzip2/bzip2-1.0.2/ldflags.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff -urN bzip2-1.0.2.orig/Makefile-libbz2_so bzip2-1.0.2/Makefile-libbz2_so
---- bzip2-1.0.2.orig/Makefile-libbz2_so	2001-12-30 02:15:59.000000000 +0000
-+++ bzip2-1.0.2/Makefile-libbz2_so	2009-04-02 12:42:43.000000000 +0000
-@@ -20,8 +20,8 @@
-       bzlib.o
- 
- all: $(OBJS)
--	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.2 $(OBJS)
--	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.2
-+	$(CC) $(LDFLAGS) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.2 $(OBJS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.2
- 	rm -f libbz2.so.1.0
- 	ln -s libbz2.so.1.0.2 libbz2.so.1.0
- 
diff --git a/recipes/bzip2/bzip2_1.0.2.bb b/recipes/bzip2/bzip2_1.0.2.bb
deleted file mode 100644
index c454ef9..0000000
--- a/recipes/bzip2/bzip2_1.0.2.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "Very high-quality data compression program."
-SECTION = "console/utils"
-PR = "r2"
-
-LICENSE = "bzip2"
-SRC_URI = "ftp://sources.redhat.com/pub/bzip2/v102/bzip2-${PV}.tar.gz \
-	   file://installpaths.patch \
-	   file://ldflags.patch"
-
-CFLAGS_append = " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
-
-do_compile () {
-	oe_runmake -f Makefile-libbz2_so
-	ln -sf libbz2.so.1.0.2 libbz2.so.1.0
-	ln -sf libbz2.so.1.0.2 libbz2.so.1
-	ln -sf libbz2.so.1.0.2 libbz2.so
-	oe_runmake libbz2.a bzip2 bzip2recover
-}
-
-do_stage () {
-	install -m 0644 bzlib.h ${STAGING_INCDIR}/
-	oe_libinstall -a -so libbz2 ${STAGING_LIBDIR}
-}
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	oe_libinstall -a -so libbz2 ${D}${libdir}
-	mv ${D}${bindir}/bunzip2 ${D}${bindir}/bunzip2.${PN}
-	mv ${D}${bindir}/bzcat ${D}${bindir}/bzcat.${PN}
-}
-
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/bunzip2 bunzip2 bunzip2.${PN} 100
-	update-alternatives --install ${bindir}/bzcat bzcat bzcat.${PN} 100
-}
-
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove bunzip2 bunzip2.${PN}
-	update-alternatives --remove bzcat bzcat.${PN}
-}
-
-SRC_URI[md5sum] = "ee76864958d568677f03db8afad92beb"
-SRC_URI[sha256sum] = "4b526afa73ca1ccd6f5f1f5fd23813f159f715c3d0e00688f1df54b51f443cdd"
-- 
1.6.4.2




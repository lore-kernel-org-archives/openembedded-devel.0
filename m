Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UCkex-00070A-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Mar 2013 06:43:57 +0100
Received: by mail-ie0-f172.google.com with SMTP id c10so7346681ieb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2013 21:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=kL+8joUHOEhjunX1lyznqXvZ8bSDvhDBK9IC+j/tfNE=;
	b=erYZJ0zLQa9zewbYmZhqdbG4S9PnKyPWr5ZsD3icAu0cgmJsivE3mfInTcfKDTC7HY
	ss8vpRztrmrZe9Ec/9D+3/ULEB5risGZmkAxFVrnYS+eoFd/XSkDNmWGdIHy68y2cLVm
	X9DGF9yL4mRBrirEAosyfPA5bEwFqwqTFS93jAILb3XSBQadepHJJXNTR/f+aVCKc14B
	uzbHQKurwX00p6Mi5ey83l+xO6/wYBWLdJKu4F8Fp3EItwk9ojXX2hZ9pvKIEIDucrNr
	Ze0/PdqH5mBpiTC1MegMEpH2wVJHOiSKR8llPnW0gNMroTFKD7eDincdbVDCwqxWSKLJ
	r5Bw==
X-Received: by 10.50.192.138 with SMTP id hg10mr4814499igc.95.1362461221703;
	Mon, 04 Mar 2013 21:27:01 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ur12sm15319176igb.8.2013.03.04.21.27.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 21:27:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Mar 2013 21:26:37 -0800
Message-Id: <1362461198-11403-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/2] tcsh: Upgrade tcsh_6.17.02.bb -> tcsh_6.18.01.bb
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
X-List-Received-Date: Tue, 05 Mar 2013 05:44:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/tcsh/files/07_nls.patch   |   14 ------
 .../tcsh/files/cross-compile.patch                 |   12 -----
 .../tcsh/files/fix-make-catalogs.patch             |   27 ----------
 .../tcsh/files/tcsh-6.17.02-multibyte.patch        |   18 ++++---
 meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb      |   53 --------------------
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb      |   49 ++++++++++++++++++
 6 files changed, 59 insertions(+), 114 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/07_nls.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/cross-compile.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
 create mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb

diff --git a/meta-oe/recipes-extended/tcsh/files/07_nls.patch b/meta-oe/recipes-extended/tcsh/files/07_nls.patch
deleted file mode 100644
index fe7845f..0000000
--- a/meta-oe/recipes-extended/tcsh/files/07_nls.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Author: Franz Pletz <fpletz@franz-pletz.org>
-Description: Fixes NLS build bug
-
---- a/nls/Makefile.in
-+++ b/nls/Makefile.in
-@@ -2,7 +2,7 @@
- 
- LOCALES=	C et finnish french german greek italian ja pl russian \
- 		spanish ukrainian
--GENCAT=		gencat
-+GENCAT=		gencat --new
- INSTALL=	ginstall
- 
- datarootdir=@datarootdir@
diff --git a/meta-oe/recipes-extended/tcsh/files/cross-compile.patch b/meta-oe/recipes-extended/tcsh/files/cross-compile.patch
deleted file mode 100644
index 06dcfda..0000000
--- a/meta-oe/recipes-extended/tcsh/files/cross-compile.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -446,7 +446,7 @@
- 
- gethost:  gethost.c sh.err.h tc.const.h sh.h
- 	rm -f gethost
--	${CC} -o gethost ${LDFLAGS} ${CFLAGS} ${CPPFLAGS} ${DFLAGS} $(srcdir)/gethost.c ${LIBES} ${EXTRALIBS}
-+	${BUILD_CC} -o gethost ${BUILD_LDFLAGS} ${BUILD_CFLAGS} ${BUILD_CPPFLAGS} ${DFLAGS} $(srcdir)/gethost.c ${LIBES} ${EXTRALIBS}
- 
- tc.defs.c:	gethost host.defs
- 	@rm -f $@.tmp
diff --git a/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch b/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
deleted file mode 100644
index 43001f1..0000000
--- a/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Author: christos <christos>
-Date:   Thu May 13 18:39:02 2010 +0000
-
-    add a rule to make catalogs and propagate ${MAKE} instead of hard-coding make.
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -687,7 +687,7 @@ shar:
- 	rm -rf tcsh-${VERSION}
- 
- catalogs:
--	@(cd nls; make catalogs)
-+	@(cd nls; ${MAKE})
- 
- tcsh-${VERSION}.tar.Z:
- 	rm -rf tcsh-${VERSION} 
---- a/nls/Makefile.in
-+++ b/nls/Makefile.in
-@@ -18,7 +18,7 @@ install:	$(INSTALLED)
- 	$(INSTALL) $< $@
- 
- %.cat:
--	$(GENCAT) $@ $(@:%.cat=%)/*set*
-+	cat $(@:%.cat=%)/charset $(@:%.cat=%)/set* | $(GENCAT) $@ 
- 
- clean:
- 	$(RM) $(CATALOGS)
diff --git a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
index 7f3e926..3dd420a 100644
--- a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
+++ b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
@@ -1,16 +1,18 @@
 Author:  Jean-Luc Leger <reiga@dspnet.fr.eu.org>
 Description: fix broken globbing expansion
 Debian-Bug: #603545
---- a/tc.str.c
-+++ b/tc.str.c
-@@ -104,8 +104,9 @@ rt_mbtowc(Char *pwc, const char *s, size_t n)
- 
-     memset (&mb, 0, sizeof mb);
-     ret = mbrtowc(&tmp, s, n, &mb);
+Index: tcsh-6.18.01/tc.str.c
+===================================================================
+--- tcsh-6.18.01.orig/tc.str.c	2012-01-10 13:34:31.000000000 -0800
++++ tcsh-6.18.01/tc.str.c	2013-02-26 13:12:13.429153489 -0800
+@@ -122,8 +122,9 @@
+ #else
+     ret = mbtowc(&tmp, s, n);
+ #endif
 -    if (ret > 0) {
 +    if (ret >= 0)
  	*pwc = tmp;
-+    if (ret > 0) {
- #ifdef UTF16_STRINGS
++    if (ret >= 0) {
+ #if defined(UTF16_STRINGS) && defined(HAVE_MBRTOWC)
  	if (tmp >= 0xd800 && tmp <= 0xdbff) {
  	    /* UTF-16 surrogate pair.  Fetch second half and compute
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
deleted file mode 100644
index c4c78f4..0000000
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-DESCRIPTION = "TENEX C Shell, an enhanced version of Berkeley csh \
- The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
- It includes all features of 4.4BSD C shell, plus a command-line editor, \
- programmable word completion, spelling correction and more."
-
-HOMEPAGE = "http://www.tcsh.org/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780"
-SECTION = "base"
-
-SRC_URI = " \
-	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_6.17.02.orig.tar.gz;name=tarball \
-	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_6.17.02-4.diff.gz;name=diffs \
-	file://01_build.1.patch \
-	file://01_build.2.patch \
-	file://01_build.3.patch \
-	file://07_nls.patch \
-	file://15_no-strip.patch \
-	file://disable-test-notty.patch \
-	file://disable-test-nice.patch \
-	file://fix-make-catalogs.patch \
-	file://disable-lexical.at-31.patch \
-	file://12_unknown_lscolors.patch \
-	file://tcsh-6.17.02-multibyte.patch \
-	file://disable-broken-test.patch \
-	file://cross-compile.patch \
-"
-
-inherit autotools
-
-do_install_append () {
-	oe_runmake install.man DESTDIR=${D}
-
-	install -d ${D}${base_bindir}
-	ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
-
-	install -d ${D}${sysconfdir}/csh/login.d
-	install -m 0644 ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
-	install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
-}
-
-FILES_${PN} += "${datadir}/emacs/site-lisp/csh-mode.el"
-
-
-pkg_postinst_${PN} () {
-#!/bin/sh -e
-echo /usr/bin/tcsh >> $D/etc/shells
-}
-
-SRC_URI[tarball.md5sum] = "ad6e89ddb654972b4c2a8bad06778625"
-SRC_URI[tarball.sha256sum] = "8c675729810eb49102b68e09be4f3f592dfa0be2c238f0d0a58e5c1147da7dd8"
-SRC_URI[diffs.md5sum] = "735286c36a83a043015b30871c7ab6b6"
-SRC_URI[diffs.sha256sum] = "61c0b0f7ebbc07544551f56b66c6e78def702c2197307e960898182b340ffe67"
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
new file mode 100644
index 0000000..d85fba8
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "TENEX C Shell, an enhanced version of Berkeley csh \
+ The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
+ It includes all features of 4.4BSD C shell, plus a command-line editor, \
+ programmable word completion, spelling correction and more."
+
+HOMEPAGE = "http://www.tcsh.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780"
+SECTION = "base"
+
+SRC_URI = " \
+	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \
+	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs \
+	file://01_build.1.patch \
+	file://01_build.2.patch \
+	file://01_build.3.patch \
+	file://15_no-strip.patch \
+	file://disable-test-notty.patch \
+	file://disable-test-nice.patch \
+	file://disable-lexical.at-31.patch \
+	file://12_unknown_lscolors.patch \
+	file://tcsh-6.17.02-multibyte.patch \
+	file://disable-broken-test.patch \
+"
+SRC_URI[tarball.md5sum] = "6eed09dbd4223ab5b6955378450d228a"
+SRC_URI[tarball.sha256sum] = "d81ca27851f3e8545666399b4bcf25433e602a195113b3f7c73886fef84c9fa8"
+SRC_URI[diffs.md5sum] = "ea39b818b624aca49ebf2cd2708d6ff9"
+SRC_URI[diffs.sha256sum] = "95b0c1a339b745c47c5d2f9d02c22a71597462e2e882b51614a9d1f75bd3d16c"
+
+inherit autotools
+
+do_install_append () {
+	oe_runmake install.man DESTDIR=${D}
+
+	install -d ${D}${base_bindir}
+	ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
+
+	install -d ${D}${sysconfdir}/csh/login.d
+	install -m 0644 ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
+	install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
+}
+
+FILES_${PN} += "${datadir}/emacs/site-lisp/csh-mode.el"
+
+
+pkg_postinst_${PN} () {
+#!/bin/sh -e
+echo /usr/bin/tcsh >> $D/etc/shells
+}
-- 
1.7.9.5




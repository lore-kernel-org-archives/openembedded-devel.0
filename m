Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wU-00087O-3R
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:14 +0200
Received: by weyr6 with SMTP id r6so3664117wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=ygd9pM8GRfokn8oWdkvLrXTz7jhar7hbhs3k6HrjkC4=;
	b=pE4mqF8alEe7C0+8R8nXiwI7fM3CJWd1mUwPZOYFj7yCKVtSVkt/x6Q0YBSw9WOC1A
	jwnN6/t2z0Xw+beGNkHr+VgiaO+JUU7IXT1M095dB/DIgmV0D+VZCjUy3Wdt+Dg8ZMz3
	JQB5q+5jAH+KWh7KMxicL/PqcAgXE43vt8+tAYKn7864oky5Le/luzo58J3SSgpARj8q
	nNZ06mE3Uge2gQgVSkD5gdarwqit1oFLCEK8xUFcEw2PWaFSc2msxD6070GXCe2xkUW6
	aSQvuXM4E9n4PmXV3IoRAawDdhM8vmiJJfphrh0iI5b4peQkvX25trVi6ex52+M9Qqen
	5Bgw==
Received: by 10.216.255.146 with SMTP id j18mr6459810wes.163.1343700037814;
	Mon, 30 Jul 2012 19:00:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z11sm28812510wiv.10.2012.07.30.19.00.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:44 +0200
Message-Id: <4339668ff27c839af1a1e4cfa5a2d034afe204f2.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 19/24] fbreader, fltk, gpm, iksemel, joe, links, ode, openldap, opensync, xchat: import from meta-smartphone
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fbreader/fbreader-0.12.10/Makefile.patch       |   22 ++
 .../fbreader/fbreader-0.12.10/gcc45.patch          |   20 ++
 .../recipes-support/fbreader/fbreader_0.12.10.bb   |   45 ++++
 meta-oe/recipes-support/fbreader/fbreader_git.bb   |   45 ++++
 ...ation-of-the-icons-when-RESOLUTION-is-set.patch |   40 +++
 .../fltk/fltk-1.1.10/disable_test.patch            |   13 +
 .../recipes-support/fltk/fltk-1.1.10/dso-fix.patch |   13 +
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |   37 +++
 meta-oe/recipes-support/gpm/gpm-1.99.7/init        |   32 +++
 .../recipes-support/gpm/gpm-1.99.7/no-docs.patch   |   18 ++
 .../gpm/gpm-1.99.7/processcreds.patch              |   12 +
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |   43 +++
 .../recipes-support/iksemel/iksemel-1.4/r25.diff   |   32 +++
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |   16 ++
 meta-oe/recipes-support/joe/joe_3.1.bb             |   13 +
 .../recipes-support/links/files/ac-prog-cxx.patch  |   11 +
 .../links/files/cookies-save-0.96.patch            |  106 ++++++++
 ...-2.1pre17-fix-segfault-on-loading-cookies.patch |   20 ++
 meta-oe/recipes-support/links/files/links2.desktop |   14 +
 .../links/links-x11_2.0+2.1pre30.bb                |   26 ++
 meta-oe/recipes-support/links/links.inc            |   19 ++
 .../recipes-support/links/links_2.0+2.1pre30.bb    |   13 +
 meta-oe/recipes-support/ode/ode/install.patch      |   23 ++
 meta-oe/recipes-support/ode/ode_0.9.bb             |   24 ++
 .../openldap/openldap-2.4.23/initscript            |   29 ++
 .../openldap/openldap-2.4.23/install-strip.patch   |   14 +
 .../openldap-2.4.23/openldap-m4-pthread.patch      |   20 ++
 .../recipes-support/openldap/openldap_2.4.23.bb    |  270 ++++++++++++++++++++
 .../recipes-support/opensync/libsyncml_0.5.4.bb    |   29 ++
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb  |   29 ++
 .../xchat/xchat-2.8.8/glib-2.32.patch              |   44 ++++
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |   30 +++
 32 files changed, 1122 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader_git.bb
 create mode 100644 meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk_1.1.10.bb
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/init
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm_1.99.7.bb
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel_1.4.bb
 create mode 100644 meta-oe/recipes-support/joe/joe_3.1.bb
 create mode 100644 meta-oe/recipes-support/links/files/ac-prog-cxx.patch
 create mode 100644 meta-oe/recipes-support/links/files/cookies-save-0.96.patch
 create mode 100644 meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
 create mode 100644 meta-oe/recipes-support/links/files/links2.desktop
 create mode 100644 meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
 create mode 100644 meta-oe/recipes-support/links/links.inc
 create mode 100644 meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
 create mode 100644 meta-oe/recipes-support/ode/ode/install.patch
 create mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap_2.4.23.bb
 create mode 100644 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
 create mode 100644 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
 create mode 100644 meta-oe/recipes-support/xchat/xchat-2.8.8/glib-2.32.patch
 create mode 100644 meta-oe/recipes-support/xchat/xchat_2.8.8.bb

diff --git a/meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch b/meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
new file mode 100644
index 0000000..0e498c7
--- /dev/null
+++ b/meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
@@ -0,0 +1,22 @@
+diff -uri fbreader-0.12.1.orig/fbreader/Makefile fbreader-0.12.1/fbreader/Makefile
+--- fbreader-0.12.1.orig/fbreader/Makefile	2009-12-13 09:03:11.000000000 +0100
++++ fbreader-0.12.1/fbreader/Makefile	2009-12-14 17:18:47.548638783 +0100
+@@ -37,7 +37,6 @@
+ 	@install $(TARGET) $(DESTDIR)$(BINDIR)/FBReader
+ 	@install -d $(FBSHAREDIR)
+ 	@install -d $(FBSHAREDIR)/help
+-	@./scripts/install_help.sh $(VARIANT) $(FBSHAREDIR)/help
+ 	@install -d $(FBSHAREDIR)/network
+ 	@install -m 0644 $(wildcard data/network/*.xml) $(FBSHAREDIR)/network
+ 	@install -d $(FBSHAREDIR)/network/certificates
+@@ -58,8 +57,8 @@
+ 	@install -d $(FBSHAREDIR)/resources
+ 	@install -m 0644 $(wildcard data/resources/*.xml) $(FBSHAREDIR)/resources
+ 	@install -d $(DESTDIR)$(APPIMAGEDIR_REAL)
+-	@install -m 0644 $(wildcard data/icons/toolbar/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
+-	@install -m 0644 $(wildcard data/icons/filetree/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
++	@install -m 0644 $(wildcard data/icons/toolbar/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
++	@install -m 0644 $(wildcard data/icons/filetree/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
+ 	@install -m 0644 $(wildcard data/icons/booktree/new/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
+ 	@make -C $(TARGET_ARCH) RESOLUTION=$(RESOLUTION) install
+ 
diff --git a/meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch b/meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
new file mode 100644
index 0000000..00cba10
--- /dev/null
+++ b/meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
@@ -0,0 +1,20 @@
+  Fix compilation with gcc 4.5
+
+  [FBreader Ticket #340] -- http://old.fbreader.org/mantis/view.php?id=340
+
+  Without that patch we have:
+    Compiling Library.o ...Library.cpp:42:1: error: 'Library::Library' names the constructor, not the type
+
+  Upstream-Status: Accepted [Fixed in Version 0.14.0]
+
+--- fbreader-0.12.10-orig/fbreader/src/library/Library.cpp	2010-04-01 15:14:24.000000000 +0200
++++ fbreader-0.12.10/fbreader/src/library/Library.cpp	2010-04-13 13:34:06.000000000 +0200
+@@ -39,7 +39,7 @@
+ shared_ptr<Library> Library::ourInstance;
+ const size_t Library::MaxRecentListSize = 10;
+ 
+-Library::Library &Library::Instance() {
++Library &Library::Instance() {
+ 	if (ourInstance.isNull()) {
+ 		ourInstance = new Library();
+ 	}
diff --git a/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
new file mode 100644
index 0000000..40fc631
--- /dev/null
+++ b/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "FBreader is an ebook reader"
+HOMEPAGE = "http://www.fbreader.org"
+SECTION = "x11/utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl"
+
+SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
+file://Makefile.patch \
+file://gcc45.patch"
+
+# Set the defaults
+READER_RESOLUTION ?= "1024x600"
+READER_ARCH       ?= "desktop"
+READER_UI         ?= "gtk"
+READER_STATUS     ?= "release"
+
+FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
+FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
+
+CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=${prefix}"
+EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' LDFLAGS='${LDFLAGS}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
+
+inherit pkgconfig
+
+do_configure() {
+    cd ${WORKDIR}/${PN}-${PV}
+    mv makefiles/target.mk makefiles/target.mk.orig
+
+    echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk
+    echo "UI_TYPE = ${READER_UI}" >> makefiles/target.mk
+    echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} RESOLUTION=${READER_RESOLUTION}
+}
+
+SRC_URI[md5sum] = "da9ec4721efdb0ec0aaa182bff16ad82"
+SRC_URI[sha256sum] = "328aec454db80e225aa0b5c31adef74bf62a14357482947e87e9731686b3c624"
diff --git a/meta-oe/recipes-support/fbreader/fbreader_git.bb b/meta-oe/recipes-support/fbreader/fbreader_git.bb
new file mode 100644
index 0000000..8baec79
--- /dev/null
+++ b/meta-oe/recipes-support/fbreader/fbreader_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "FBreader is an ebook reader"
+HOMEPAGE = "http://www.fbreader.org"
+SECTION = "x11/utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl"
+SRCREV = "2cf1ec0e306e1122dbed850bfa005cd59a6168ee"
+PV = "0.99.5+gitr${SRCPV}"
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://github.com/geometer/FBReader.git;protocol=http;branch=master \
+           file://0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch"
+
+# Set the defaults
+READER_RESOLUTION ?= "1024x600"
+READER_ARCH       ?= "desktop"
+READER_UI         ?= "gtk"
+READER_STATUS     ?= "release"
+
+FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
+FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
+
+CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=${prefix}"
+EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
+inherit pkgconfig
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+    cd "${S}"
+
+    echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk
+    echo "UI_TYPE = ${READER_UI}" >> makefiles/target.mk
+    echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} RESOLUTION=${READER_RESOLUTION}
+}
diff --git a/meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch b/meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
new file mode 100644
index 0000000..f6e1202
--- /dev/null
+++ b/meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
@@ -0,0 +1,40 @@
+From da4170b61bb41eff0af170d1d77bfd90f9ebe5dd Mon Sep 17 00:00:00 2001
+From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Date: Fri, 20 Jan 2012 11:34:42 +0100
+Subject: [PATCH] Fix installation of the icons when RESOLUTION is set
+
+When resolution is set, the following code(in fbreader/Makefile) is executed:
+  VARIANT = $(TARGET_ARCH)
+  ifneq "$(RESOLUTION)" ""
+    VARIANT = $(TARGET_ARCH)_$(RESOLUTION)
+  endif
+
+This fix is based on a patch from the openembedded project,
+  which can be found here:
+    http://cgit.openembedded.org/openembedded/tree/recipes/fbreader/fbreader-0.12.1/Makefile.patch
+
+Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+---
+ Submitted trough github to git://github.com/geometer/FBReader.git as a pull request
+
+ fbreader/Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/fbreader/Makefile b/fbreader/Makefile
+index bfa9242..03e6cc3 100644
+--- a/fbreader/Makefile
++++ b/fbreader/Makefile
+@@ -60,8 +60,8 @@ do_install:
+ 	@install -d $(FBSHAREDIR)/resources
+ 	@install -m 0644 $(wildcard data/resources/*.xml) $(FBSHAREDIR)/resources
+ 	@install -d $(DESTDIR)$(APPIMAGEDIR_REAL)
+-	@install -m 0644 $(wildcard data/icons/toolbar/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
+-	@install -m 0644 $(wildcard data/icons/filetree/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
++	@install -m 0644 $(wildcard data/icons/toolbar/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
++	@install -m 0644 $(wildcard data/icons/filetree/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
+ 	@install -m 0644 $(wildcard data/icons/booktree/new/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
+ 	@make -C $(TARGET_ARCH) RESOLUTION=$(RESOLUTION) install
+ 
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
new file mode 100644
index 0000000..8c01a1f
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
@@ -0,0 +1,13 @@
+Index: fltk-1.1.9/Makefile
+===================================================================
+--- fltk-1.1.9.orig/Makefile	2008-06-06 16:14:11.936736201 +0200
++++ fltk-1.1.9/Makefile	2008-06-06 16:14:22.526357637 +0200
+@@ -27,7 +27,7 @@
+ 
+ include makeinclude
+ 
+-DIRS	=	$(IMAGEDIRS) src fluid test documentation
++DIRS	=	$(IMAGEDIRS) src fluid documentation
+ 
+ all: makeinclude fltk-config
+ 	for dir in $(DIRS); do\
diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
new file mode 100644
index 0000000..867e9ef
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
@@ -0,0 +1,13 @@
+src/fl_set_fonts_xft.cxx is using fontconfig symbols
+
+--- a/makeinclude.in	2012-01-26 18:09:58.628799060 +0100
++++ b/makeinclude.in	2012-01-26 18:08:58.115801758 +0100
+@@ -81,7 +81,7 @@
+ AUDIOLIBS	= @AUDIOLIBS@
+ DSOFLAGS	= -L. @DSOFLAGS@
+ LDFLAGS		= $(OPTIM) @LDFLAGS@
+-LDLIBS		= @LIBS@
++LDLIBS		= @LIBS@ -lfontconfig
+ GLDLIBS		= @GLLIB@ @LIBS@
+ LINKFLTK	= @LINKFLTK@
+ LINKFLTKGL	= @LINKFLTKGL@
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
new file mode 100644
index 0000000..2611b20
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "FLTK is a cross-platform C++ GUI toolkit"
+HOMEPAGE = "http://www.fltk.org"
+SECTION = "libs"
+LICENSE = "LGPLv2 & FLTK"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c0b73db66884b6a925e727400315130"
+
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
+
+SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2 \
+           file://disable_test.patch \
+           file://dso-fix.patch \
+          "
+
+S = "${WORKDIR}/fltk-${PV}"
+
+inherit lib_package autotools binconfig
+
+TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
+
+EXTRA_OECONF = "--enable-shared \
+                --enable-threads \
+                --enable-xdbe --enable-xft --enable-gl \
+                --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"
+
+do_configure() {
+    oe_runconf
+}
+
+python populate_packages_prepend () {
+    if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
+        bb.data.setVar('PKG_${PN}', 'libfltk${PV}', d)
+}
+
+LEAD_SONAME = "libfltk.so"
+
+SRC_URI[md5sum] = "a1765594bc427ff892e36089fe1fa672"
+SRC_URI[sha256sum] = "37ada22bf2586b8dd30d84209b8b58bdcb864627e5d02ae3f2c323a29261b19a"
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/init b/meta-oe/recipes-support/gpm/gpm-1.99.7/init
new file mode 100644
index 0000000..2dcf9ab
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm-1.99.7/init
@@ -0,0 +1,32 @@
+#! /bin/sh  
+
+# Grab the common functions
+#. /etc/init.d/functions
+
+# FIXME: 
+# Add a configuration file for GPM here
+
+test -x /usr/sbin/gpm || exit 0
+
+case "$1" in
+  start)
+    if [ ! -p /dev/gpmdata ]; then
+        mkfifo /dev/gpmdata
+    fi
+
+    echo "Starting GPM:" 
+    start-stop-daemon -S -x /usr/sbin/gpm -- -R -m /dev/psaux -t ps2
+    ;;
+  stop)
+    echo "Stopping GPM:" 
+    start-stop-daemon -K -x /usr/sbin/gpm
+    ;;
+  restart|force-reload) 
+    $0 stop
+    $0 start
+    ;;
+  *)
+    usage /etc/init.d/gpm
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch b/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
new file mode 100644
index 0000000..f10217a
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
@@ -0,0 +1,18 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+Index: gpm-1.99.7/Makefile.in
+===================================================================
+--- gpm-1.99.7.orig/Makefile.in	2008-07-24 03:36:35.000000000 -0700
++++ gpm-1.99.7/Makefile.in	2010-06-22 18:28:45.269507001 -0700
+@@ -19,7 +19,7 @@
+ # user-overridable flags, but it's also all the implicit rule looks at.
+ # missing ?
+ 
+-SUBDIRS = src doc contrib gpm2
++SUBDIRS = src
+ 
+ 
+ ### simple, but effective rules
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch b/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
new file mode 100644
index 0000000..d647eca
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
@@ -0,0 +1,12 @@
+Index: gpm-1.99.7/src/daemon/processconn.c
+===================================================================
+--- gpm-1.99.7.orig/src/daemon/processconn.c	2010-09-29 17:36:18.571782951 +0400
++++ gpm-1.99.7/src/daemon/processconn.c	2010-09-29 17:42:44.659991758 +0400
+@@ -20,6 +20,7 @@
+  *
+  ********/
+ 
++#define _GNU_SOURCE
+ #include <sys/socket.h>         /* accept */
+ #include <stdlib.h>             /* malloc */
+ #include <unistd.h>             /* close */
diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
new file mode 100644
index 0000000..bd42de3
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "GPM (General Purpose Mouse) is a mouse server \
+for the console and xterm, with sample clients included \
+(emacs, etc)."
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://gpm2/core/main.c;endline=19;md5=66d3c205c4e7ee5704b2ee351dfed72f"
+
+DEPENDS = "ncurses"
+
+SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
+           file://no-docs.patch \
+           file://processcreds.patch \
+           file://init"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "gpm"
+INITSCRIPT_PARAMS = "defaults"
+
+#export LIBS = "-lm"
+
+# all fields are /* FIXME: gpm 1.99.13 */
+# gpm-1.99.7/src/lib/libhigh.c:171:43: error: parameter 'clientdata' set but not used [-Werror=unused-but-set-parameter]
+# gpm-1.99.7/src/lib/report-lib.c:28:21: error: parameter 'line' set but not used [-Werror=unused-but-set-parameter]
+# gpm-1.99.7/src/lib/report-lib.c:28:33: error: parameter 'file' set but not used [-Werror=unused-but-set-parameter]
+# gpm-1.99.7/src/drivers/empty/i.c:26:23: error: parameter 'fd' set but not used [-Werror=unused-but-set-parameter]
+# gpm-1.99.7/src/drivers/empty/i.c:26:42: error: parameter 'flags' set but not used [-Werror=unused-but-set-parameter]
+# gpm-1.99.7/src/drivers/etouch/i.c:34:43: error: parameter 'flags' set but not used [-Werror=unused-but-set-parameter]
+# gpm-1.99.7/src/drivers/msc/r.c:32:12: error: variable 'dy' set but not used [-Werror=unused-but-set-variable]
+# gpm-1.99.7/src/drivers/msc/r.c:32:8: error: variable 'dx' set but not used [-Werror=unused-but-set-variable]
+# cc1: all warnings being treated as errors
+CFLAGS += "-Wno-extra -Wno-error=unused-but-set-parameter -Wno-error=unused-but-set-variable"
+
+do_install () {
+    oe_runmake 'ROOT=${D}' install
+    install -m 0644 src/headers/gpm.h ${D}${includedir}
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
+    cd ${D}${libdir} && ln -sf libgpm.so.1.19.0 libgpm.so.1
+}
+SRC_URI[md5sum] = "9fdddf5f53cb11d40bb2bb671d3ac544"
+SRC_URI[sha256sum] = "6071378b24494e36ca3ef6377606e7e565040413c86704753a162d2180af32ee"
+
diff --git a/meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff b/meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff
new file mode 100644
index 0000000..e666ce0
--- /dev/null
+++ b/meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff
@@ -0,0 +1,32 @@
+Taken from upstream subversion repository:
+
+http://code.google.com/p/iksemel/source/detail?r=25
+
+===================================================================
+---
+ configure.ac |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+--- iksemel-1.4.orig/configure.ac
++++ iksemel-1.4/configure.ac
+@@ -43,11 +43,19 @@ AM_CONDITIONAL(DO_POSIX, test "x$defio"
+ dnl Checks for library functions
+ AC_SEARCH_LIBS(recv,socket)
+ AC_CHECK_FUNCS(getopt_long)
+ AC_CHECK_FUNCS(getaddrinfo)
+ 
+-AM_PATH_LIBGNUTLS(,AC_DEFINE(HAVE_GNUTLS,,"Use libgnutls"))
++dnl Check GNU TLS
++PKG_CHECK_MODULES(GNUTLS, gnutls >= 2.0.0, have_gnutls=yes, have_gnutls=no)
++if test "x$have_gnutls" = "xyes"; then
++  LIBGNUTLS_CFLAGS="$GNUTLS_CFLAGS"
++  LIBGNUTLS_LIBS="$GNUTLS_LIBS"
++  AC_SUBST(LIBGNUTLS_CFLAGS)
++  AC_SUBST(LIBGNUTLS_LIBS)
++  AC_DEFINE(HAVE_GNUTLS, 1, [whether to use GnuTSL support.])
++fi
+ 
+ dnl Check -Wall flag of GCC
+ if test "x$GCC" = "xyes"; then
+   if test -z "`echo "$CFLAGS" | grep "\-Wall" 2> /dev/null`" ; then
+     CFLAGS="$CFLAGS -Wall"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
new file mode 100644
index 0000000..9869149
--- /dev/null
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Fast and portable XML parser and Jabber protocol library"
+AUTHOR = "Gurer Ozen <meduketto at gmail.com>"
+HOMEPAGE = "http://iksemel.googlecode.com"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+DEPENDS = "gnutls"
+
+PR = "r1"
+
+SRC_URI = "http://iksemel.googlecode.com/files/${P}.tar.gz;name=archive \
+           file://r25.diff"
+SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
+SRC_URI[archive.sha256sum] = "458c1b8fb3349076a6cecf26c29db1d561315d84e16bfcfba419f327f502e244"
+
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/joe/joe_3.1.bb b/meta-oe/recipes-support/joe/joe_3.1.bb
new file mode 100644
index 0000000..6c9190f
--- /dev/null
+++ b/meta-oe/recipes-support/joe/joe_3.1.bb
@@ -0,0 +1,13 @@
+SECTION = "console/utils"
+DESCRIPTION = "Console text editor with good functionality, good choice for vi-haters."
+HOMEPAGE = "http://joe-editor.sourceforge.net/"
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da10ed7cf8038981c580e11c1d3e8fb6"
+RDEPENDS_${PN} = "ncurses-terminfo"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
+
+inherit autotools
+
+SRC_URI[md5sum] = "2a6ef018870fca9b7df85401994fb0e0"
+SRC_URI[sha256sum] = "252390e4bc687957f09f334095904c8cc53b39c7b663ed47861ae1d11aef5946"
diff --git a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch b/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
new file mode 100644
index 0000000..41c3826
--- /dev/null
+++ b/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
@@ -0,0 +1,11 @@
+--- links-2.1pre20/configure.in.orig	2005-12-21 15:23:49.000000000 +0000
++++ links-2.1pre20/configure.in	2005-12-21 15:23:59.000000000 +0000
+@@ -18,7 +18,7 @@
+ dnl Checks for programs.
+ AC_PROG_CC
+ 
+-#AC_PROG_CXX
++AC_PROG_CXX
+ #AC_PROG_AWK
+ #AM_PROG_LEX
+ #AC_PROG_YACC
diff --git a/meta-oe/recipes-support/links/files/cookies-save-0.96.patch b/meta-oe/recipes-support/links/files/cookies-save-0.96.patch
new file mode 100644
index 0000000..a1e35c0
--- /dev/null
+++ b/meta-oe/recipes-support/links/files/cookies-save-0.96.patch
@@ -0,0 +1,106 @@
+diff -ru links-0.96/cookies.c links-0.96+cookies-save/cookies.c
+--- links-0.96/cookies.c	Mon Sep  3 07:19:37 2001
++++ links-0.96+cookies-save/cookies.c	Mon Sep  3 07:18:42 2001
+@@ -276,15 +276,99 @@
+ 
+ void init_cookies(void)
+ {
+-	/* !!! FIXME: read cookies */
++	unsigned char in_buffer[MAX_STR_LEN];
++	unsigned char *cookfile, *p, *q;
++	FILE *fp;
++
++	/* must be called after init_home */
++	if (! links_home) return;
++	
++	cookfile = stracpy(links_home);
++	if (! cookfile) return;
++	add_to_strn(&cookfile, "cookies");
++
++	fp = fopen(cookfile, "r");
++	mem_free(cookfile);
++	if (fp == NULL) return;
++	
++	while (fgets(in_buffer, MAX_STR_LEN, fp)) {
++		struct cookie *cookie;
++		
++		if (!(cookie = mem_alloc(sizeof(struct cookie)))) return;
++		memset(cookie, 0, sizeof(struct cookie));
++		
++		q = in_buffer; p = strchr(in_buffer, ' ');
++		if (p == NULL) goto inv;
++		*p++ = '\0';
++		cookie->name = stracpy(q);
++		
++		q = p; p = strchr(p, ' ');
++		if (p == NULL) goto inv;
++		*p++ = '\0';
++		cookie->value = stracpy(q);
++		
++		q = p; p = strchr(p, ' ');
++		if (p == NULL) goto inv;
++		*p++ = '\0';
++		cookie->server = stracpy(q);
++		
++		q = p; p = strchr(p, ' ');
++		if (p == NULL) goto inv;
++		*p++ = '\0';
++		cookie->path = stracpy(q);
++		
++		q = p; p = strchr(p, ' ');
++		if (p == NULL) goto inv;
++		*p++ = '\0';
++		cookie->domain = stracpy(q);
++		
++		q = p; p = strchr(p, ' ');
++		if (p == NULL) goto inv;
++		*p++ = '\0';
++		cookie->expires = atoi(q);
++		
++		cookie->secure = atoi(p);
++		
++		cookie->id = cookie_id++;
++
++		accept_cookie(cookie);
++
++		continue;
++
++inv:
++		free_cookie(cookie);
++		free(cookie);
++	}
++	fclose(fp);
+ }
+ 
+ void cleanup_cookies(void)
+ {
+ 	struct cookie *c;
++	unsigned char *cookfile;
++	FILE *fp;
++	
+ 	free_list(c_domains);
+-	/* !!! FIXME: save cookies */
+-	foreach (c, cookies) free_cookie(c);
++
++	cookfile = stracpy(links_home);
++	if (! cookfile) return;
++	add_to_strn(&cookfile, "cookies");
++
++	fp = fopen(cookfile, "w");
++	mem_free(cookfile);
++	if (fp == NULL) return;
++	
++	foreach (c, cookies) {
++		if (c->expires && ! cookie_expired(c))
++			fprintf(fp, "%s %s %s %s %s %d %d\n", c->name, c->value,
++			    c->server?c->server:(unsigned char *)"", c->path?c->path:(unsigned char *)"",
++			    c->domain?c->domain:(unsigned char *)"", c->expires, c->secure);
++
++		free_cookie(c);
++	}
++
++	fclose(fp);
++	
+ 	free_list(cookies);
+ }
+ 
diff --git a/meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch b/meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
new file mode 100644
index 0000000..0d3b407
--- /dev/null
+++ b/meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
@@ -0,0 +1,20 @@
+--- links-2.1pre17/cookies.c.pix	2005-05-15 23:05:10.000000000 +0800
++++ links-2.1pre17/cookies.c	2005-05-15 23:17:21.000000000 +0800
+@@ -41,7 +41,7 @@
+ 
+ void free_cookie(struct cookie *c)
+ {
+-	mem_free(c->name);
++	if (c->value) mem_free(c->name);
+ 	if (c->value) mem_free(c->value);
+ 	if (c->server) mem_free(c->server);
+ 	if (c->path) mem_free(c->path);
+@@ -355,7 +355,7 @@
+ 
+ inv:
+ 		free_cookie(cookie);
+-		free(cookie);
++		mem_free(cookie);
+ 	}
+ 	fclose(fp);
+ }
diff --git a/meta-oe/recipes-support/links/files/links2.desktop b/meta-oe/recipes-support/links/files/links2.desktop
new file mode 100644
index 0000000..a05bce1
--- /dev/null
+++ b/meta-oe/recipes-support/links/files/links2.desktop
@@ -0,0 +1,14 @@
+[Desktop Entry]
+Encoding=UTF-8
+Name=Links
+Comment=Links is a browser very similar to lynx
+Comment[es]=El links es un browser para modo texto, similar a lynx
+Comment[pl]=Links jest przeglądarką podobną do lynksa
+Comment[pt]=O links é um browser para modo texto, similar ao lynx
+Comment[pt_BR]=O links é um browser para modo texto, similar ao lynx
+Exec=links -g
+Terminal=true
+Icon=links2
+Type=Application
+Categories=Application;ConsoleOnly;Network;WebBrowser;
+# vi: encoding=utf-8
diff --git a/meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb b/meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
new file mode 100644
index 0000000..b71da9f
--- /dev/null
+++ b/meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
@@ -0,0 +1,26 @@
+require links.inc
+
+DEPENDS += "virtual/libx11"
+RCONFLICTS_${PN} = "links"
+
+SRC_URI += " file://links2.desktop \
+             http://www.xora.org.uk/oe/links2.png;name=icon"
+
+EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
+                --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
+                --without-libtiff --without-svgalib --without-fb \
+                --without-directfb --without-pmshell --without-atheos \
+                --with-x --without-gpm --without-sdl"
+
+do_install_append() {
+    install -d ${D}/${datadir}/applications
+    install -m 0644 ${WORKDIR}/links2.desktop ${D}/${datadir}/applications
+    install -d ${D}/${datadir}/pixmaps
+    install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
+}
+
+
+SRC_URI[md5sum] = "f0f107cc824b71e43f0c6ab620209daf"
+SRC_URI[sha256sum] = "f32314d851e86ec463967ddce78d051e3953b529878cbaeecf882c625ad29c75"
+SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
+SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
new file mode 100644
index 0000000..9001d2a
--- /dev/null
+++ b/meta-oe/recipes-support/links/links.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Links is graphics and text mode WWW \
+browser, similar to Lynx."
+HOMEPAGE = "http://links.twibright.com/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b0c80473f97008e42e29a9f80fcc55ff"
+DEPENDS = "jpeg libpng flex openssl zlib"
+
+LPV = "${@bb.data.getVar("PV",d,1).split("+")[1]}"
+
+SRC_URI = "http://links.twibright.com/download/links-${LPV}.tar.bz2 \
+           file://ac-prog-cxx.patch \
+           file://cookies-save-0.96.patch \
+           file://links-2.1pre17-fix-segfault-on-loading-cookies.patch"
+
+inherit autotools
+
+S = "${WORKDIR}/links-${LPV}"
+
diff --git a/meta-oe/recipes-support/links/links_2.0+2.1pre30.bb b/meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
new file mode 100644
index 0000000..2496173
--- /dev/null
+++ b/meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
@@ -0,0 +1,13 @@
+require links.inc
+
+DEPENDS += "gpm"
+RCONFLICTS_${PN} = "links-x11"
+
+EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
+                --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
+                --without-libtiff --without-svgalib --with-fb \
+                --without-directfb --without-pmshell --without-atheos \
+                --without-x --without-sdl"
+
+SRC_URI[md5sum] = "f0f107cc824b71e43f0c6ab620209daf"
+SRC_URI[sha256sum] = "f32314d851e86ec463967ddce78d051e3953b529878cbaeecf882c625ad29c75"
diff --git a/meta-oe/recipes-support/ode/ode/install.patch b/meta-oe/recipes-support/ode/ode/install.patch
new file mode 100644
index 0000000..2f6cdb0
--- /dev/null
+++ b/meta-oe/recipes-support/ode/ode/install.patch
@@ -0,0 +1,23 @@
+--- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
++++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
+@@ -25,13 +25,13 @@
+ 
+ if USE_SONAME
+ install-exec-hook:
+-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
+-	$(libdir)/libode.so
+-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
+-	$(libdir)/@ODE_SONAME@
+-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
+-	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
+-	/sbin/ldconfig
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/libode.so
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/@ODE_SONAME@
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
++	echo /sbin/ldconfig
+ else
+ install-exec-hook:
+ endif
diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-support/ode/ode_0.9.bb
new file mode 100644
index 0000000..d076abb
--- /dev/null
+++ b/meta-oe/recipes-support/ode/ode_0.9.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "ODE is an Open Source Physics Engine."
+SECTION = "libs"
+HOMEPAGE = "http://www.ode.org"
+LICENSE = "LGPLv2.1 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928 \
+                    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff"
+
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
+           file://install.patch"
+
+SRC_URI[md5sum] = "4c03759b76a0649a6d5108c8e172e1e4"
+SRC_URI[sha256sum] = "460d0851b743b1f144ef2a8259004d6774504c95d08e9357a96a296111496feb"
+
+inherit autotools binconfig
+
+EXTRA_OECONF = "--disable-demos --enable-soname"
+
+do_configure_append() {
+    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
+}
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript b/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
new file mode 100644
index 0000000..40881cd
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
@@ -0,0 +1,29 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/openldap and type
+# > update-rc.d openldap defaults 60
+#
+
+
+slapd=/usr/libexec/slapd
+test -x "$slapd" || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting OpenLDAP: "
+    start-stop-daemon --start --quiet --exec $slapd
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping OpenLDAP: "
+    start-stop-daemon --stop --quiet --pidfile /var/run/slapd.pid
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/openldap {start|stop}"
+    exit 1
+esac
+
+exit 0
\ No newline at end of file
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
new file mode 100644
index 0000000..9d7640c
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
@@ -0,0 +1,14 @@
+# This patch ensures that the install operations which strip
+# programs and libraries (LTINSTALL) work in a cross build
+# environment.
+--- openldap-2.2.24/.pc/install-strip.patch/build/top.mk	2005-01-20 09:00:55.000000000 -0800
++++ openldap-2.2.24/build/top.mk	2005-04-16 13:48:20.536710376 -0700
+@@ -116,7 +116,7 @@
+ LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
+ 	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
+ 
+-LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL) 
++LTINSTALL = STRIPPROG="@STRIP@" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
+ LTFINISH = $(LIBTOOL) --mode=finish
+ 
+ # Misc UNIX commands used in build environment
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch
new file mode 100644
index 0000000..b669b72
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch
@@ -0,0 +1,20 @@
+--- openldap-2.3.11/build/openldap.m4.orig	2005-11-11 00:11:18.604322590 -0800
++++ openldap-2.3.11/build/openldap.m4	2005-11-11 00:26:21.621145856 -0800
+@@ -788,7 +788,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
+ ]])
+ 
+ AC_DEFUN([OL_PTHREAD_TEST_PROGRAM],
+-AC_LANG_SOURCE([OL_PTHREAD_TEST_INCLUDES
++[AC_LANG_SOURCE([[OL_PTHREAD_TEST_INCLUDES
+ 
+ int main(argc, argv)
+ 	int argc;
+@@ -796,7 +796,7 @@ int main(argc, argv)
+ {
+ OL_PTHREAD_TEST_FUNCTION
+ }
+-]))
++]])])
+ dnl --------------------------------------------------------------------
+ AC_DEFUN([OL_PTHREAD_TRY], [# Pthread try link: $1 ($2)
+ if test "$ol_link_threads" = no ; then
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
new file mode 100644
index 0000000..3ef12d3
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -0,0 +1,270 @@
+# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
+#
+DESCRIPTION = "OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol."
+HOMEPAGE = "http://www.OpenLDAP.org/license.html"
+# The OpenLDAP Public License - see the HOMEPAGE - defines
+# the license.  www.openldap.org claims this is Open Source
+# (see http://www.openldap.org), the license appears to be
+# basically BSD.  opensource.org does not record this license
+# at present (so it is apparently not OSI certified).
+LICENSE = "OpenLDAP"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3d82d3085f228af211a6502c7ea7c3c7"
+SECTION = "libs"
+
+LDAP_VER = "${@'.'.join(bb.data.getVar('PV',d,1).split('.')[0:2])}"
+
+SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz"
+SRC_URI += "file://openldap-m4-pthread.patch"
+SRC_URI += "file://initscript"
+SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
+SRC_URI[sha256sum] = "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8eef2d2c789fc055e3"
+
+# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
+# installing .so and executables, this fails in cross compilation
+# environments
+SRC_URI += "file://install-strip.patch"
+
+inherit autotools
+
+# OPTIONS
+# The following two variables can be set in a distro or local.conf
+# to switch features on.  Each feature foo defines OPENLDAP_OPTION_foo
+# and OPENLDAP_DEPENDS_foo in this file - to include feature foo add
+# the two variables into the setting of the options below (please use
+# += because that means this can be done in *both* distro.conf and
+# local.conf!
+OPENLDAP_OPTIONS ?= ""
+OPENLDAP_DEPENDS ?= ""
+
+# CV SETTINGS
+# Required to work round AC_FUNC_MEMCMP which gets the wrong answer
+# when cross compiling (should be in site?)
+EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
+
+# CONFIG DEFINITIONS
+# The following is necessary because it cannot be determined for a
+# cross compile automagically.  Select should yield fine on all OE
+# systems...
+EXTRA_OECONF += "--with-yielding-select=yes"
+# Shared libraries are nice...
+EXTRA_OECONF += "--enable-dynamic"
+#
+# Disable TLS to remove the need for openssl/libcrypto
+OPENLDAP_OPTION_tls  ?= "--with-tls"
+# set the following to "openssl" to build tls support
+OPENLDAP_DEPENDS_tls ?= "gnutls"
+EXTRA_OECONF += "${OPENLDAP_OPTION_tls}"
+DEPENDS += "${OPENLDAP_DEPENDS_tls}"
+#
+# Disable Cyrus SASL, which may or may not be working at present...
+OPENLDAP_OPTION_sasl  ?= "--without-cyrus-sasl"
+# set the following to "cyrus-sasl" to build SASL support
+OPENLDAP_DEPENDS_sasl ?= ""
+EXTRA_OECONF += "${OPENLDAP_OPTION_sasl}"
+DEPENDS += "${OPENLDAP_DEPENDS_sasl}"
+
+# SLAPD options
+#
+# UNIX crypt(3) passwd support:
+EXTRA_OECONF += "--enable-crypt"
+#
+# Enable dynamic module loading.  If this is *disabled* the
+# dependency on libtool is removed (to disable set the following
+# to variables to "" in a .conf file).
+OPENLDAP_OPTION_modules += "lt_cv_dlopen_self=yes --enable-modules"
+OPENLDAP_DEPENDS_modules += "libtool"
+EXTRA_OECONF += " ${OPENLDAP_OPTION_modules}"
+DEPENDS += "${OPENLDAP_DEPENDS_modules}"
+
+# SLAPD BACKEND
+#
+# The backend must be set by the configuration.  This controls the
+# required database, the default database, bdb, is turned off but
+# can be turned back on again and it *is* below!  The monitor backend
+# is also disabled.  If you try to change the backends but fail to
+# enable a single one the build will fail in an obvious way.
+#
+EXTRA_OECONF += "--disable-bdb --disable-hdb --disable-monitor"
+#
+# Backends="bdb dnssrv hdb ldap ldbm meta monitor null passwd perl shell sql"
+#
+# Note that multiple backends can be built.  The ldbm backend requires a
+# build-time choice of database API.  The bdb backend forces this to be
+# DB4.  To use the gdbm (or other) API the Berkely database module must
+# be removed from the build.
+md = "${libexecdir}/openldap"
+#
+#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
+# The Berkely DB is the standard choice.  This version of OpenLDAP requires
+# the version 4 implementation or better.
+# To disable this set all three of the following variables to <empty> in
+# a .conf file (this will allow ldbm to be build with gdbm).
+#OPENLDAP_OPTION_bdb   ?= "--enable-bdb=mod"
+OPENLDAP_DEPENDS_bdb  ?= "db"
+EXTRA_OECONF += "${OPENLDAP_OPTION_bdb}"
+DEPENDS += "${OPENLDAP_DEPENDS_bdb}"
+#
+#--enable-dnssrv       enable dnssrv backend no|yes|mod no
+# This has no dependencies.
+EXTRA_OECONF += "--enable-dnssrv=mod"
+#
+#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
+# This forces ldbm to use Berkeley too, remove to use gdbm
+#OPENLDAP_OPTION_hdb   ?= "--enable-hdb=mod"
+OPENLDAP_DEPENDS_hdb  ?= "db"
+OPENLDAP_PACKAGE_hdb  ?= "${PN}-backend-hdb"
+EXTRA_OECONF += "${OPENLDAP_OPTION_hdb}"
+DEPENDS += "${OPENLDAP_DEPENDS_hdb}"
+#
+#--enable-ldap         enable ldap backend no|yes|mod no
+# This has no dependencies
+EXTRA_OECONF += "--enable-ldap=mod"
+#
+#--enable-ldbm         enable ldbm backend no|yes|mod no
+# ldbm requires further specification of the underlying database API, because
+# bdb is enabled above this must be set to berkeley, however the config
+# defaults this correctly so --with-ldbm-api is *not* set.  The build will
+# fail if bdb is removed (above) but not database is built to provide the
+# support for ldbm (because the 'DEPENDS_ldbm' is empty below.)
+#
+# So to use gdbm set:
+OPENLDAP_OPTION_ldbm = "--enable-ldbm=mod --with-ldbm-api=gdbm"
+OPENLDAP_DEPENDS_ldbm = "gdbm"
+# And clear the bdb and hdb settings.
+OPENLDAP_OPTION_ldbm ?= "--enable-ldbm=mod"
+OPENLDAP_DEPENDS_ldbm ?= ""
+EXTRA_OECONF += "${OPENLDAP_OPTION_ldbm}"
+DEPENDS += "${OPENLDAP_DEPENDS_ldbm}"
+#
+#--enable-meta         enable metadirectory backend no|yes|mod no
+# No dependencies
+EXTRA_OECONF += "--enable-meta=mod"
+#
+#--enable-monitor      enable monitor backend no|yes|mod yes
+EXTRA_OECONF += "--enable-monitor=mod"
+#
+#--enable-null         enable null backend no|yes|mod no
+EXTRA_OECONF += "--enable-null=mod"
+#
+#--enable-passwd       enable passwd backend no|yes|mod no
+EXTRA_OECONF += " --enable-passwd=mod"
+#
+#--enable-perl         enable perl backend no|yes|mod no
+#  This requires a loadable perl dynamic library, if enabled without
+#  doing something appropriate (building perl?) the build will pick
+#  up the build machine perl - not good.
+OPENLDAP_OPTION_perl ?= "--enable-perl=mod"
+OPENLDAP_DEPENDS_perl ?= "perl"
+#EXTRA_OECONF += "${OPENLDAP_OPTION_perl}"
+#DEPENDS += "${OPENLDAP_DEPENDS_perl}"
+#
+#--enable-shell        enable shell backend no|yes|mod no
+EXTRA_OECONF += "--enable-shell=mod"
+#
+#--enable-sql          enable sql backend no|yes|mod no
+# sql requires some sql backend which provides sql.h, sqlite* provides
+# sqlite.h (which may be compatible but hasn't been tried.)
+OPENLDAP_OPTION_sql ?= "--enable-sql=mod"
+OPENLDAP_DEPENDS_sql ?= "sql"
+#EXTRA_OECONF += "${OPENLDAP_OPTION_sql}"
+#DEPENDS += "${OPENLDAP_DEPENDS_sql}"
+#
+#--enable-dyngroup     Dynamic Group overlay no|yes|mod no
+#  This is a demo, Proxy Cache defines init_module which conflicts with the
+#  same symbol in dyngroup
+#EXTRA_OECONF += "--enable-dyngroup=mod"
+#
+#--enable-proxycache   Proxy Cache overlay no|yes|mod no
+EXTRA_OECONF += "--enable-proxycache=mod"
+FILES_${PN}-overlay-proxycache = "${md}/pcache-*.so.*"
+PACKAGES += "${PN}-overlay-proxycache"
+#
+# LOCAL OPTION OVERRIDES
+# The distro/lcoal options must be added in *last*
+EXTRA_OECONF += "${OPENLDAP_OPTIONS}"
+DEPENDS      += "${OPENLDAP_DEPENDS}"
+
+CPPFLAGS_append = " -D_GNU_SOURCE"
+
+do_configure() {
+    cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
+    rm -f ${S}/libtool
+    aclocal
+    libtoolize --force --copy
+    gnu-configize
+    autoconf
+    oe_runconf
+}
+
+#FIXME: this is a hack, at present an openldap build will pick up the header
+# files from staging rather than the local ones (bad -I order), so remove
+# the headers (from openldap-old.x) before compiling...
+do_compile_prepend() {
+    (
+        cd ${STAGING_INCDIR}
+        rm -f ldap.h ldap_*.h
+    )
+    (
+        cd ${STAGING_LIBDIR}
+        rm -f libldap* liblber*
+    )
+}
+
+LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
+
+# The executables go in a separate package.  This allows the
+# installation of the libraries with no daemon support.
+# Each module also has its own package - see above.
+PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
+
+# Package contents - shift most standard contents to -bin
+FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
+FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run \
+    ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
+    ${sysconfdir}/openldap/DB_CONFIG.example"
+FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run"
+FILES_${PN}-bin = "${bindir}"
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
+FILES_${PN}-dbg += "${libexecdir}/openldap/.debug"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/init.d
+    cat ${WORKDIR}/initscript > ${D}${sysconfdir}/init.d/openldap
+    chmod 755 ${D}${sysconfdir}/init.d/openldap
+    # This is duplicated in /etc/openldap and is for slapd
+    rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
+}
+
+pkg_postinst_${PN}-slapd () {
+    if test -n "${D}"; then
+        D="-r $D"
+    fi
+    update-rc.d $D openldap defaults
+}
+
+pkg_prerm_${PN}-slapd () {
+    if test -n "${D}"; then
+        D="-r $D"
+    fi
+    update-rc.d $D openldap remove
+}
+
+PACKAGES_DYNAMIC = "openldap-backends openldap-backend-*"
+
+python populate_packages_prepend () {
+    backend_dir    = bb.data.expand('${libexecdir}/openldap', d)
+    do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
+
+    metapkg = "openldap-backends"
+    bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+    bb.data.setVar('FILES_' + metapkg, "", d)
+    metapkg_rdepends = []
+    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    for pkg in packages[1:]:
+        if pkg.count("openldap-backend-") and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale"):
+            metapkg_rdepends.append(pkg)
+    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    bb.data.setVar('DESCRIPTION_' + metapkg, 'OpenLDAP backends meta package', d)
+    packages.append(metapkg)
+    bb.data.setVar('PACKAGES', ' '.join(packages), d)
+}
diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
new file mode 100644
index 0000000..0575058
--- /dev/null
+++ b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Libsyncml is an implementation of the SyncML protocol."
+HOMEPAGE = "https://libsyncml.opensync.org/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
+
+DEPENDS = "libxml2 glib-2.0"
+RRECOMMENDS_${PN} = "wbxml2 openobex libsoup-2.4"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libsyncml/libsyncml-${PV}.tar.gz"
+SRC_URI[md5sum] = "84879ed7cb94618530fbcb801a1a4f95"
+SRC_URI[sha256sum] = "05d6513637adb1300a3a58b6e29d53ab6373c8f370807d0d925bae72b2920e53"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += " . -B${WORKDIR}/build "
+
+PACKAGES += "${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}"
+FILES_${PN} = "${libdir}/*.so.*"
+
+do_build_prepend() {
+    cd ${WORKDIR}/build
+}
+
+do_install_prepend() {
+    cd ${WORKDIR}/build
+}
diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
new file mode 100644
index 0000000..c87e477
--- /dev/null
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "WBXML parsing and encoding library."
+HOMEPAGE = "http://libwbxml.opensync.org/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c1128ee5341ccd5927d8bafe4b6266e1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f5031e9f730ffd9dc6a2d1ded585e1d1"
+SRC_URI[sha256sum] = "a057daa098f12838eb4e635bb28413027f1b73819872c3fbf64e3207790a3f7d"
+
+S = "${WORKDIR}/libwbxml-${PV}"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += " . -B${WORKDIR}/build "
+
+PACKAGES += "${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}"
+FILES_${PN} = "${libdir}/*.so.*"
+
+do_build_prepend() {
+    cd ${WORKDIR}/build
+}
+
+do_install_prepend() {
+    cd ${WORKDIR}/build
+}
diff --git a/meta-oe/recipes-support/xchat/xchat-2.8.8/glib-2.32.patch b/meta-oe/recipes-support/xchat/xchat-2.8.8/glib-2.32.patch
new file mode 100644
index 0000000..c9bce6a
--- /dev/null
+++ b/meta-oe/recipes-support/xchat/xchat-2.8.8/glib-2.32.patch
@@ -0,0 +1,44 @@
+--- xchat-2.8.8.orig/src/common/xchat.h	2009-08-16 11:40:16.000000000 +0200
++++ xchat-2.8.8/src/common/xchat.h	2012-05-06 08:30:16.125755497 +0200
+@@ -1,10 +1,6 @@
+ #include "../../config.h"
+ 
+-#include <glib/gslist.h>
+-#include <glib/glist.h>
+-#include <glib/gutils.h>
+-#include <glib/giochannel.h>
+-#include <glib/gstrfuncs.h>
++#include <glib.h>
+ #include <time.h>			/* need time_t */
+ 
+ #ifndef XCHAT_H
+--- xchat-2.8.8.orig/src/common/servlist.c	2010-05-16 09:24:26.000000000 +0200
++++ xchat-2.8.8/src/common/servlist.c	2012-05-06 08:30:45.681758019 +0200
+@@ -24,7 +24,6 @@
+ #include <unistd.h>
+ 
+ #include "xchat.h"
+-#include <glib/ghash.h>
+ 
+ #include "cfgfiles.h"
+ #include "fe.h"
+--- xchat-2.8.8.orig/src/common/util.c	2009-08-16 11:40:16.000000000 +0200
++++ xchat-2.8.8/src/common/util.c	2012-05-06 08:31:10.389760122 +0200
+@@ -39,7 +39,6 @@
+ #include <errno.h>
+ #include "xchat.h"
+ #include "xchatc.h"
+-#include <glib/gmarkup.h>
+ #include <ctype.h>
+ #include "util.h"
+ #include "../../config.h"
+--- xchat-2.8.8.orig/src/common/text.c	2010-05-30 04:14:41.000000000 +0200
++++ xchat-2.8.8/src/common/text.c	2012-05-06 08:31:22.300761137 +0200
+@@ -28,7 +28,6 @@
+ #include <sys/mman.h>
+ 
+ #include "xchat.h"
+-#include <glib/ghash.h>
+ #include "cfgfiles.h"
+ #include "chanopt.h"
+ #include "plugin.h"
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
new file mode 100644
index 0000000..3346e18
--- /dev/null
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Full-featured IRC chat client with scripting support"
+LICENSE = "GPLv2+"
+HOMEPAGE = "http://www.xchat.org"
+SECTION = "x11/network"
+DEPENDS = "libgcrypt zlib gtk+"
+DEPENDS += "gdk-pixbuf-native"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+
+PR = "r1"
+
+SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \
+  file://glib-2.32.patch \
+"
+
+inherit autotools gettext
+
+EXTRA_OECONF = "\
+  --disable-perl \
+  --disable-python \
+  --disable-tcl \
+"
+do_configure_prepend(){
+    rm -f ${S}/po/Makefile.in.in
+}
+
+FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN}-dbg += "${libdir}/xchat/plugins/.debug"
+
+SRC_URI[md5sum] = "6775c44f38e84d06c06c336b32c4a452"
+SRC_URI[sha256sum] = "0d6d69437b5e1e45f3e66270fe369344943de8a1190e498fafa5296315a27db0"
-- 
1.7.8.6




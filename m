Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Om6xF-00005N-JM
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 17:22:59 +0200
Received: by qwd7 with SMTP id 7so189172qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 08:22:36 -0700 (PDT)
Received: by 10.224.112.73 with SMTP id v9mr6562103qap.327.1282231355004;
	Thu, 19 Aug 2010 08:22:35 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l8sm1822943qck.30.2010.08.19.08.22.33
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Aug 2010 08:22:33 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 10:22:31 -0500
Message-Id: <1282231351-23933-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tofrodos-native: created
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
X-List-Received-Date: Thu, 19 Aug 2010 15:22:59 -0000

Created from the same version used for non-native.

Had to replace S, since PN doesn't reflect the tar directory (tofrodos).

Updated patch to include creation of new directories.  This needed to be
done in the Makefile to cover both do_install and do_populate_sysroot.

Added patch to use environment variables, rather than passed in paths.

This could probably be done by enabling native builds in the main
recipe, but I couldn't figure out how to do that with some of the extra
stuff in it.  I'd suggest accepting this patch until there is one to
replace it.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 .../tofrodos-native/0001-Make-OE-friendly.patch    |   71 +++++++++++++++++
 ...e-enviroment-rather-than-hard-coded-paths.patch |   83 ++++++++++++++++++++
 recipes/tofrodos/tofrodos-native_1.7.8.bb          |   14 ++++
 3 files changed, 168 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tofrodos/tofrodos-native/0001-Make-OE-friendly.patch
 create mode 100644 recipes/tofrodos/tofrodos-native/0001-Use-enviroment-rather-than-hard-coded-paths.patch
 create mode 100644 recipes/tofrodos/tofrodos-native_1.7.8.bb

diff --git a/recipes/tofrodos/tofrodos-native/0001-Make-OE-friendly.patch b/recipes/tofrodos/tofrodos-native/0001-Make-OE-friendly.patch
new file mode 100644
index 0000000..1dd8281
--- /dev/null
+++ b/recipes/tofrodos/tofrodos-native/0001-Make-OE-friendly.patch
@@ -0,0 +1,71 @@
+From 7ae01e1346c9645e27d49427679b2fd521534588 Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Thu, 19 Aug 2010 08:17:17 -0500
+Subject: [PATCH] Make OE friendly
+
+Pulled changes from OE's cross.patch, but added portions to create
+directories on install.
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ src/Makefile |   16 ++++++++--------
+ 1 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index db9c2a4..f82afcf 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -23,13 +23,11 @@ VERSTR = 0.0
+ endif
+ 
+ # programs
+-CC = gcc
+ CD = cd
+ CP = cp
+ GZIP = gzip
+ INSTALL = install
+ LN = ln
+-LD = gcc
+ MAKE = make
+ MKDIR = mkdir
+ MV = mv
+@@ -38,7 +36,7 @@ TAR = tar
+ ZIP = zip
+ 
+ # flags
+-CFLAGS = $(DEFINES) $(TFLAG) $(CDEBUG) -c -Wall
++CCFLAGS = $(DEFINES) $(TFLAG) $(CDEBUG) -c -Wall
+ GZIPFLAGS = -9
+ INSTALLBINFLAGS = -m 755
+ INSTALLDATAFLAGS = -m 644
+@@ -96,7 +94,7 @@ OBJS =	emsg.o \
+ 
+ # implicit rules
+ .c.o:
+-	$(CC) $(CFLAGS) $<
++	$(CC) $(CCFLAGS) $(CFLAGS) $<
+ 
+ # user visible rules
+ all: $(FROMDOS) $(TODOS)
+@@ -119,12 +117,14 @@ distclean: clobber
+ 	$(RM) $(RMRECURFLAGS) $(DISTDIR)
+ 
+ install: installman
+-	$(INSTALL) $(INSTALLBINFLAGS) $(FROMDOS) $(BINDIR)
+-	($(CD) $(BINDIR) ; $(LN) $(LNFLAGS) fromdos todos)
++	$(INSTALL) -d $(DESTDIR)$(BINDIR)
++	$(INSTALL) $(INSTALLBINFLAGS) $(FROMDOS) $(DESTDIR)$(BINDIR)
++	($(CD) $(DESTDIR)$(BINDIR) ; $(LN) $(LNFLAGS) fromdos todos)
+ 
+ installman: $(FROMDOSMAN)
+-	$(INSTALL) $(INSTALLDATAFLAGS) $(FROMDOSMAN) $(MANDIR)
+-	($(CD) $(MANDIR) ; $(LN) $(LNFLAGS) fromdos.1 todos.1)
++	$(INSTALL) -d $(DESTDIR)$(MANDIR)
++	$(INSTALL) $(INSTALLDATAFLAGS) $(FROMDOSMAN) $(DESTDIR)$(MANDIR)
++	($(CD) $(DESTDIR)$(MANDIR) ; $(LN) $(LNFLAGS) fromdos.1 todos.1)
+ 
+ save:
+ 	$(ZIP) $(ZIPSRCFLAGS) $(ZIPSRCNAME) *
+-- 
+1.5.6.4
+
diff --git a/recipes/tofrodos/tofrodos-native/0001-Use-enviroment-rather-than-hard-coded-paths.patch b/recipes/tofrodos/tofrodos-native/0001-Use-enviroment-rather-than-hard-coded-paths.patch
new file mode 100644
index 0000000..cc70e6b
--- /dev/null
+++ b/recipes/tofrodos/tofrodos-native/0001-Use-enviroment-rather-than-hard-coded-paths.patch
@@ -0,0 +1,83 @@
+From e170432a8c2b9d86f4bcd90399c9e4649ac57b7e Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Thu, 19 Aug 2010 09:45:00 -0500
+Subject: [PATCH] Use enviroment, rather than hard coded paths
+
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ src/Makefile |   28 +++++++++++++++-------------
+ 1 files changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index f82afcf..c87ab30 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -23,11 +23,13 @@ VERSTR = 0.0
+ endif
+ 
+ # programs
++CC := gcc
+ CD = cd
+ CP = cp
+ GZIP = gzip
+ INSTALL = install
+ LN = ln
++LD := ld
+ MAKE = make
+ MKDIR = mkdir
+ MV = mv
+@@ -47,11 +49,11 @@ TARFLAGS = cvf
+ ZIPSRCFLAGS = -r -9
+ 
+ # directories
+-BINDIR = /usr/bin
++bindir := /usr/bin
+ DISTDIR = tofrodos-$(VERSTR)
+-LIBDIR = lib
++libdir := lib
+ LIBDISTDIR = $(DISTDIR)/lib
+-MANDIR = /usr/man/man1
++mandir := /usr/man/man1
+ 
+ # filenames
+ FROMDOS = fromdos
+@@ -83,10 +85,10 @@ DISTFILES = config.h \
+ 	utility.h \
+ 	version.h \
+ 	$(FROMDOSMAN)
+-LIBDISTFILES = $(LIBDIR)/getopt.c \
+-	$(LIBDIR)/getopt.h \
+-	$(LIBDIR)/mktemp.c \
+-	$(LIBDIR)/mktemp.h
++LIBDISTFILES = $(libdir)/getopt.c \
++	$(libdir)/getopt.h \
++	$(libdir)/mktemp.c \
++	$(libdir)/mktemp.h
+ OBJS =	emsg.o \
+ 	init.o \
+ 	tofrodos.o \
+@@ -117,14 +119,14 @@ distclean: clobber
+ 	$(RM) $(RMRECURFLAGS) $(DISTDIR)
+ 
+ install: installman
+-	$(INSTALL) -d $(DESTDIR)$(BINDIR)
+-	$(INSTALL) $(INSTALLBINFLAGS) $(FROMDOS) $(DESTDIR)$(BINDIR)
+-	($(CD) $(DESTDIR)$(BINDIR) ; $(LN) $(LNFLAGS) fromdos todos)
++	$(INSTALL) -d $(bindir)
++	$(INSTALL) $(INSTALLBINFLAGS) $(FROMDOS) $(bindir)
++	($(CD) $(bindir) ; $(LN) $(LNFLAGS) fromdos todos)
+ 
+ installman: $(FROMDOSMAN)
+-	$(INSTALL) -d $(DESTDIR)$(MANDIR)
+-	$(INSTALL) $(INSTALLDATAFLAGS) $(FROMDOSMAN) $(DESTDIR)$(MANDIR)
+-	($(CD) $(DESTDIR)$(MANDIR) ; $(LN) $(LNFLAGS) fromdos.1 todos.1)
++	$(INSTALL) -d $(mandir)
++	$(INSTALL) $(INSTALLDATAFLAGS) $(FROMDOSMAN) $(mandir)
++	($(CD) $(mandir) ; $(LN) $(LNFLAGS) fromdos.1 todos.1)
+ 
+ save:
+ 	$(ZIP) $(ZIPSRCFLAGS) $(ZIPSRCNAME) *
+-- 
+1.5.6.4
+
diff --git a/recipes/tofrodos/tofrodos-native_1.7.8.bb b/recipes/tofrodos/tofrodos-native_1.7.8.bb
new file mode 100644
index 0000000..e54709b
--- /dev/null
+++ b/recipes/tofrodos/tofrodos-native_1.7.8.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Tofrodos is a text file conversion utility that converts ASCII files between the MSDOS and unix format"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://tofrodos.sourceforge.net/download/tofrodos-${PV}.tar.gz \
+           file://0001-Make-OE-friendly.patch;striplevel=2 \
+	   file://0001-Use-enviroment-rather-than-hard-coded-paths.patch;striplevel=2 \
+          "
+SRC_URI[md5sum] = "aaa044f9817a048e126d9eb7a7535e96"
+SRC_URI[sha256sum] = "e1d78226c5b54c0ce8e1c7de8bdd025aec6bf684960d5cee28310cf8dce48bb9"
+
+S = "${WORKDIR}/tofrodos/src"
+
+inherit native
+
-- 
1.5.6.4




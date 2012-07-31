Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wZ-0007iA-M9
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:19 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so2102689wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4fhfBuKiz+f2ZCKGKDEytZp168gyqkKGBSms2a4A3PQ=;
	b=ESQZ5cKUAl0kF6CIv8cvwXDnc6qIDzA/deNb6UC7A3uV/vln1bIR0Bub34lxFgxDgg
	zrpfwDXAGO7Era2RQA71+wlkL2DbtZTC/DEA056mCKcOuuo84SmXdrOWSlCgVB1uG4mH
	isAN+SRokGaGl9Btr/4ZyKYuSDTZGLBLiUI5eRa4lo+jR8DYdLGMMlLbKnSnOgSmL2wQ
	ARZk4HMn3dCyky9du6z8rrUJO2bO3cGLEDjRAcSaZxbqRgxjrEntg0H5+IGUsursSqT/
	vtBp165h4r43Bcs4GmSw63gdkB7TrYVDWyFnZRaBYk7IHdxa3eZOkYKXIReorw0kaYq6
	mCcA==
Received: by 10.216.242.204 with SMTP id i54mr7011633wer.114.1343700045438;
	Mon, 30 Jul 2012 19:00:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm28808556wib.8.2012.07.30.19.00.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:45 +0200
Message-Id: <ac717c387aa4bc236ff263ee6086eca0b728d09f.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/24] liblockfile, libungif: import from oe-classic
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../liblockfile/liblockfile-1.06/configure.patch   |   25 +++++++
 .../liblockfile/liblockfile-1.06/glibc-2.4.patch   |   70 ++++++++++++++++++++
 .../liblockfile/liblockfile-1.06/install.patch     |   48 +++++++++++++
 .../liblockfile/liblockfile-1.06/ldflags.patch     |   21 ++++++
 .../liblockfile/liblockfile_1.06.bb                |   21 ++++++
 .../recipes-extended/libungif/libungif_4.1.3.bb    |   14 ++++
 6 files changed, 199 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
 create mode 100644 meta-oe/recipes-extended/libungif/libungif_4.1.3.bb

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch
new file mode 100644
index 0000000..ea13e11
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch
@@ -0,0 +1,25 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- liblockfile-1.05/./configure.in~configure
++++ liblockfile-1.05/./configure.in
+@@ -1,4 +1,5 @@
+-AC_INIT(lockfile.c)
++AC_INIT
++AC_CONFIG_SRCDIR([lockfile.c])
+ AC_CONFIG_HEADER(autoconf.h)
+ AC_REVISION($Revision: 1.0 $)dnl
+ 
+@@ -111,7 +112,8 @@
+ AC_SUBST(INSTALL_TARGETS)
+ AC_SUBST(nfslockdir)
+ 
+-AC_OUTPUT(\
++AC_CONFIG_FILES([\
+ 	./Makefile \
+ 	./maillock.h \
+-)
++])
++AC_OUTPUT
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch
new file mode 100644
index 0000000..e3c4aaa
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch
@@ -0,0 +1,70 @@
+The local function eaccess conflicts with a glibc function of the same name.
+Rename the function so that this can be build under glibc 2.4, and older
+revisions, without any problems.
+
+--- liblockfile-1.06/dotlockfile.c	2006/07/10 03:17:40	1.1
++++ liblockfile-1.06/dotlockfile.c	2006/07/10 03:18:26
+@@ -42,7 +42,7 @@
+ extern int optind;
+ #endif
+ 
+-extern int eaccess(char *, gid_t, struct stat *);
++extern int xeaccess(char *, gid_t, struct stat *);
+ 
+ /*
+  *	Sleep for an amout of time while regulary checking if
+@@ -252,14 +252,14 @@
+ 		return L_ERROR;
+ 	}
+ 	gid = getgid();
+-	if (eaccess(dir, gid, &st) < 0) {
++	if (xeaccess(dir, gid, &st) < 0) {
+ 		if (errno == ENOENT) {
+ enoent:
+ 			if (!quiet) fprintf(stderr,
+ 				"dotlockfile: %s: no such directory\n", dir);
+ 			return L_TMPLOCK;
+ 		}
+-		if ((r = eaccess(dir, getegid(), &st) < 0) && errno == ENOENT)
++		if ((r = xeaccess(dir, getegid(), &st) < 0) && errno == ENOENT)
+ 			goto enoent;
+ 		if (r < 0 || !ismaillock(lockfile, pwd->pw_name)) {
+ 			if (!quiet) fprintf(stderr,
+@@ -272,7 +272,7 @@
+ 	/*
+ 	 *	Now we should be able to chdir() to the lock directory.
+ 	 *	When we stat("."), it should be the same as at the
+-	 *	eaccess() check or someone played symlink() games on us.
++	 *	xeaccess() check or someone played symlink() games on us.
+ 	 */
+ 	if (chdir(dir) < 0 || stat(".", &st2) < 0) {
+ 		if (!quiet) fprintf(stderr,
+--- liblockfile-1.06/lockfile.c	2006/07/10 03:17:40	1.1
++++ liblockfile-1.06/lockfile.c	2006/07/10 03:18:26
+@@ -54,7 +54,7 @@
+ #ifdef LIB
+ static
+ #endif
+-int eaccess(char *fn, gid_t gid, struct stat *st)
++int xeaccess(char *fn, gid_t gid, struct stat *st)
+ {
+ 	struct stat	tmp;
+ 	uid_t		uid = geteuid();
+@@ -96,7 +96,7 @@
+ 		*p = 0;
+ 	else
+ 		strcpy(dir, ".");
+-	if (eaccess(dir, egid, NULL) >= 0) {
++	if (xeaccess(dir, egid, NULL) >= 0) {
+ 		free(dir);
+ 		return 0;
+ 	}
+@@ -111,7 +111,7 @@
+ 			return 0;
+ 		mailgid = st.st_gid;
+ 	}
+-	ret = eaccess(dir, mailgid, NULL) >= 0;
++	ret = xeaccess(dir, mailgid, NULL) >= 0;
+ 	free (dir);
+ 	return ret;
+ }
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch
new file mode 100644
index 0000000..a9319ff
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch
@@ -0,0 +1,48 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- liblockfile-1.05/Makefile.in~install
++++ liblockfile-1.05/Makefile.in
+@@ -20,6 +20,7 @@
+ includedir	= @includedir@
+ 
+ MAILGROUP	= @MAILGROUP@
++INSTGRP		= $(if $(MAILGROUP),-g $(MAILGROUP))
+ 
+ all:		@TARGETS@
+ install:	@INSTALL_TARGETS@
+@@ -50,25 +51,27 @@
+ 		$(CC) $(CFLAGS) -c lockfile.c -o xlockfile.o
+ 
+ install_static:	static install_common
++		install -d $(ROOT)$(libdir)
+ 		install -m 644 liblockfile.a $(ROOT)$(libdir)
+ 
+ install_shared:	shared install_common
++		install -d $(ROOT)$(libdir)
+ 		install -m 755 liblockfile.so \
+ 			$(ROOT)$(libdir)/liblockfile.so.$(VER)
+ 		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so
+ 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
+ 
+ install_common:
++		install -d $(ROOT)$(includedir)
+ 		install -m 644 lockfile.h maillock.h $(ROOT)$(includedir)
+-		if [ "$(MAILGROUP)" != "" ]; then\
+-		  install -g $(MAILGROUP) -m 2755 dotlockfile $(ROOT)$(bindir);\
+-		else \
+-		  install -g root -m 755 dotlockfile $(ROOT)$(bindir); \
+-		fi
++		install -d $(ROOT)$(bindir)
++		install -m 755 $(INSTGRP) dotlockfile $(ROOT)$(bindir)
++		install -d $(ROOT)$(mandir)/man1 $(ROOT)$(mandir)/man3
+ 		install -m 644 *.1 $(ROOT)$(mandir)/man1
+ 		install -m 644 *.3 $(ROOT)$(mandir)/man3
+ 
+ install_nfslib:	nfslib
++		install -d $(ROOT)$(nfslockdir)
+ 		install -m 755 nfslock.so.$(VER) $(ROOT)$(nfslockdir)
+ 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
+ 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch
new file mode 100644
index 0000000..eb1d147
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch
@@ -0,0 +1,21 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- liblockfile-1.05/Makefile.in~ldflags
++++ liblockfile-1.05/Makefile.in
+@@ -34,11 +34,11 @@
+ 
+ liblockfile.so: liblockfile.a
+ 		$(CC) -fPIC -shared -Wl,-soname,liblockfile.so.1 \
+-			-o liblockfile.so lockfile.o -lc
++			-o liblockfile.so lockfile.o $(LDFLAGS) -lc
+ 
+ nfslock.so.$(VER):	nfslock.o
+ 		$(CC) -fPIC -shared -Wl,-soname,nfslock.so.0 \
+-			-o nfslock.so.$(NVER) nfslock.o
++			-o nfslock.so.$(NVER) nfslock.o $(LDFLAGS)
+ 
+ dotlockfile:	dotlockfile.o xlockfile.o
+ 		$(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o xlockfile.o
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
new file mode 100644
index 0000000..971eff1
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "File locking library."
+SECTION = "libs"
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35127b30003a121544b5d13a2ac868b6"
+
+SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
+	   file://install.patch \
+	   file://configure.patch \
+	   file://ldflags.patch \
+	   file://glibc-2.4.patch"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-shared --enable-static"
+
+do_install () {
+	oe_runmake 'ROOT=${D}' INSTGRP='' install
+}
+
+SRC_URI[md5sum] = "2de88389da013488bfd31356523070c0"
+SRC_URI[sha256sum] = "14f9690328318d11f9ba13a9356a2c008bdd169b7a817f38cb7f9eb32cf7240e"
diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
new file mode 100644
index 0000000..0e9bf9b
--- /dev/null
+++ b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "shared library for GIF images"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
+SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
+SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
+
+inherit autotools lib_package
+
+PACKAGES =+ "${PN}-utils"
+
+FILES_${PN}-utils = "${bindir}/*"
-- 
1.7.8.6




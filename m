Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B8CA771F59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373608"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:15 +0000
Message-Id: <28853535c3d7a4691ba5131cc423b4e92d847700.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 02/12] libc-client: rename to uw-imap, upgrade to 2007f
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:38 -0000

* Upgrade to 2007f
* Rename to uw-imap; this is the name used by Fedora and is much more
  sensible than libc-client
* Fix errors when linking the library against code compiled with -fPIC
  such as mod-php (patch from Fedora).
* Add a security patch from Fedora
* Rename files directory to uw-imap

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../uw-imap/uw-imap/imap-2007e-shared.patch        | 82 ++++++++++++++++++++++
 .../uw-imap/imap-2007f-format-security.patch       | 20 ++++++
 .../files => uw-imap/uw-imap}/quote_cctype.patch   |  0
 .../uw-imap_2007f.bb}                              | 16 +++--
 4 files changed, 113 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e-shared.patch
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f-format-security.patch
 rename meta-oe/recipes-devtools/{libc-client/files => uw-imap/uw-imap}/quote_cctype.patch (100%)
 rename meta-oe/recipes-devtools/{libc-client/libc-client_2007e.bb => uw-imap/uw-imap_2007f.bb} (66%)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e-shared.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e-shared.patch
new file mode 100644
index 0000000..4434e83
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e-shared.patch
@@ -0,0 +1,82 @@
+Fix linking libraries built with -fPIC with this library
+
+Patch borrowed from Fedora
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Pending
+
+diff -up imap-2007e/src/osdep/unix/Makefile.shared imap-2007e/src/osdep/unix/Makefile
+--- imap-2007e/src/osdep/unix/Makefile.shared	2009-07-07 19:28:02.909755512 -0500
++++ imap-2007e/src/osdep/unix/Makefile	2009-07-07 19:29:35.870006799 -0500
+@@ -170,6 +170,10 @@ BUILD=$(MAKE) build EXTRACFLAGS='$(EXTRA
+  EXTRADRIVERS='$(EXTRADRIVERS)' EXTRAAUTHENTICATORS='$(EXTRAAUTHENTICATORS)'\
+  PASSWDTYPE=$(PASSWDTYPE) SSLTYPE=$(SSLTYPE) IP=$(IP)
+ 
++# Need this for the shared library rule to work correctly
++.SUFFIXES: .o .so
++SOFILES=${BINARIES:.o=.so}
++
+ 
+ # Here if no make argument established
+ 
+@@ -845,18 +849,24 @@ vu2:	# VAX Ultrix 2.3, etc.
+ 
+ # Build it!
+ 
+-build:	clean once $(ARCHIVE)
++build:	clean once $(ARCHIVE) $(SHLIBNAME)
+ 
+-all:	$(ARCHIVE)
++all:	$(ARCHIVE) $(SHLIBNAME)
+ 
+ $(ARCHIVE): $(BINARIES)
+ 	sh -c '$(RM) $(ARCHIVE) || true'
+ 	@$(CAT) ARCHIVE
+ 	@$(SH) ARCHIVE
+ 
+-.c.o:
+-	`$(CAT) CCTYPE` -c `$(CAT) CFLAGS` $*.c
++$(SHLIBNAME):	$(SOFILES)
++	gcc -shared -Wl,-soname,$(SHLIBNAME) -o $(SHLIBNAME) $(SOFILES) `cat LDFLAGS`
++	ln -s $(SHLIBNAME) lib$(SHLIBBASE).so
+ 
++.c.so:	osdep.h
++	$(CC) -fPIC -DPIC -D_REENTRANT -c `$(CAT) CFLAGS` ${@:.so=.c} -o $@
++
++.c.o:
++	$(CC) -fPIC -DPIC -D_REENTRANT -c `$(CAT) CFLAGS` $*.c
+ 
+ # Cleanup
+ 
+@@ -895,8 +905,7 @@ utf8aux.o: mail.h misc.h osdep.h utf8.h
+ 
+ 
+ # OS-dependent
+-
+-osdep.o:mail.h misc.h env.h fs.h ftl.h nl.h tcp.h \
++OSDEPS= mail.h misc.h env.h fs.h ftl.h nl.h tcp.h \
+ 	osdep.h env_unix.h tcp_unix.h \
+ 	osdep.c env_unix.c fs_unix.c ftl_unix.c nl_unix.c tcp_unix.c ip_unix.c\
+ 	auths.c crexcl.c flockcyg.c flocklnx.c flocksim.c fsync.c \
+@@ -910,12 +919,19 @@ osdep.o:mail.h misc.h env.h fs.h ftl.h n
+ 	write.c sslstdio.c \
+ 	strerror.c strpbrk.c strstr.c strtok.c strtoul.c \
+ 	OSCFLAGS
++
++osdep.o:	$(OSDEPS)
++	$(CC) -fPIC -DPIC -D_REENTRANT `$(CAT) CFLAGS` `$(CAT) OSCFLAGS` -c osdep.c
++	@echo ========================================================================
+ 	@echo Building OS-dependent module
+ 	@echo If you get No such file error messages for files x509.h, ssl.h,
+ 	@echo pem.h, buffer.h, bio.h, and crypto.h, that means that OpenSSL
+ 	@echo is not installed on your system.  Either install OpenSSL first
+ 	@echo or build with command: make `$(CAT) OSTYPE` SSLTYPE=none
+-	`$(CAT) CCTYPE` -c `$(CAT) CFLAGS` `$(CAT) OSCFLAGS` -c osdep.c
++	@echo ========================================================================
++
++osdep.so:	$(OSDEPS)
++	$(CC) -fPIC -DPIC -D_REENTRANT `$(CAT) CFLAGS` `cat OSCFLAGS` -c osdep.c -o $@
+ 
+ osdep.c: osdepbas.c osdepckp.c osdeplog.c osdepssl.c
+ 	$(CAT) osdepbas.c osdepckp.c osdeplog.c osdepssl.c > osdep.c
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f-format-security.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f-format-security.patch
new file mode 100644
index 0000000..6ec0476
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f-format-security.patch
@@ -0,0 +1,20 @@
+Fix error found with "-Werror=format-security" flag
+
+Patch borrowed from Fedora
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Pending
+
+diff -Naur imap-2007f.orig/src/osdep/unix/flocklnx.c imap-2007f/src/osdep/unix/flocklnx.c
+--- imap-2007f.orig/src/osdep/unix/flocklnx.c	2011-07-23 02:20:11.000000000 +0200
++++ imap-2007f/src/osdep/unix/flocklnx.c	2014-04-14 19:17:46.429000000 +0200
+@@ -57,7 +57,7 @@
+     case ENOLCK:		/* lock table is full */
+       sprintf (tmp,"File locking failure: %s",strerror (errno));
+       mm_log (tmp,WARN);	/* give the user a warning of what happened */
+-      if (!logged++) syslog (LOG_ERR,tmp);
++      if (!logged++) syslog (LOG_ERR, "%s", tmp);
+ 				/* return failure if non-blocking lock */
+       if (op & LOCK_NB) return -1;
+       sleep (5);		/* slow down in case it loops */
diff --git a/meta-oe/recipes-devtools/libc-client/files/quote_cctype.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch
similarity index 100%
rename from meta-oe/recipes-devtools/libc-client/files/quote_cctype.patch
rename to meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch
diff --git a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
similarity index 66%
rename from meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
rename to meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 150ff90..e1a9877 100644
--- a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
 DEPENDS = "openssl libpam"
 
-PR = "r1"
-
 SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
-           file://quote_cctype.patch"
+           file://quote_cctype.patch \
+           file://imap-2007e-shared.patch \
+           file://imap-2007f-format-security.patch \
+           "
 
-SRC_URI[md5sum] = "7903800dc2604000016de070e0c55840"
-SRC_URI[sha256sum] = "4b1137b87249782496ec3eeacaf83bbf09312a7d2ae3aead262179041b55565f"
+SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
+SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520004a28"
 
 S = "${WORKDIR}/imap-${PV}"
 
@@ -32,4 +33,9 @@ do_install() {
     install c-client/c-client.a ${D}${libdir}/libc-client.a
 }
 
+RPROVIDES_${PN} = "libc-client"
+RREPLACES_${PN} = "libc-client"
+RCONFLICTS_${PN} = "libc-client"
+
 ALLOW_EMPTY_${PN} = "1"
+
-- 
1.9.3



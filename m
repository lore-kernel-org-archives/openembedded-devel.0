Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D1F4072F39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:29 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i5so130036pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AZXmCYH8g/8W/bYF42iaNPNasjrg78CUU3QVjqmzrIc=;
	b=LRk82QEPP4/Y12Y/+GPTRYkpK42OkUBaEbYh8ac0nasFK1D11LP4w3Tb1NU+9EnY3e
	mL4BFj6v1gsNiMVEGB2rkiCvwTOEHlA+YkQBD/uULaBycDGSL1UIdKdJbZs8NOU+ta9H
	/pQzebIkzE79pzjKSFIyBDAOFMogyqciH9i70cPmKs7b2Xgs/SOu7DErfyovbIYVzXvm
	VPnSLECIojEIL45dupSnzPqWDvxqhcHgfsIOBRbr6TtKGXrDV6NpYsXascawoy7LOI/U
	OvaA4AXUnT5yDEZHXFm7hAK9vBCyQV2RC+P+rd/Hz7sV8aLrLB/PpPkyQ847b0vVRuby
	f/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AZXmCYH8g/8W/bYF42iaNPNasjrg78CUU3QVjqmzrIc=;
	b=PngFN65EBgEJ+GFjV3ArCzcz6Z38m+L1KOftki4SntSihWBfxJBjnjcXsgYgIJMQ8u
	+qLmTfxiscgq4Ktccs6k8tDlUZ3XIQXjE7wHeAakPPKbq7wEC0XQsvfuaT/SzbXWSgi9
	+BGhAR2RCgpCnjzW8WT9Emkj4ge5wnN6QV2QVcVYfdorBBqgUKnK6gztDLqZ/Xqa1Bxu
	RNQkH4gkotRyi7lSw0iNTU9cr96XOViqzJ9BSAOjVigXFbJfFpVTYH2CRri/rIKNAf+Y
	9uZQAFa/yvei3673KUdN6+/x1ubC78q5o7rqSZd0pbFaLH9mR3C3fLw/fOwoQ/A/QBKn
	YCEA==
X-Gm-Message-State: AN3rC/7bK4C/zvEL0Fs9UBqc7VKc4GA2Erf0otyK4Wj1NeS+Crxk/iQC
	MxZYvKQjGGoM2w==
X-Received: by 10.98.55.197 with SMTP id e188mr19475806pfa.116.1492539750914; 
	Tue, 18 Apr 2017 11:22:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:34 -0700
Message-Id: <20170418182142.27253-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 24/32] pngcheck: Fix cross build and format string errors
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-make-Respect-variables-from-environement.patch | 60 ++++++++++++++++++++++
 ...T-windowsize-Fix-format-string-errors-in-.patch | 36 +++++++++++++
 .../pngcheck/10-pngsplit-format-strings.patch      | 40 +++++++++++++++
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb | 12 +++--
 4 files changed, 145 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
 create mode 100644 meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
 create mode 100644 meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch b/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
new file mode 100644
index 000000000..2d0ea0252
--- /dev/null
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
@@ -0,0 +1,60 @@
+From 6245f18091cad11520c159248c1cf7a84f12857c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Apr 2017 13:15:43 -0700
+Subject: [PATCH] make: Respect variables from environement
+
+link with shared zlib
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.unx | 18 ++++++++----------
+ 1 file changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile.unx b/Makefile.unx
+index 772da46..4ae7061 100644
+--- a/Makefile.unx
++++ b/Makefile.unx
+@@ -24,18 +24,16 @@ ZINC = -I$(ZPATH)
+ ZLIB = $(ZPATH)/libz.a
+ 
+ INCS = $(ZINC)
+-LIBS = $(ZLIB)
++LIBS = -lz
+ 
+-CC = gcc
+-LD = gcc
+-RM = rm
+-CFLAGS = -O -Wall $(INCS) -DUSE_ZLIB
++CC ?= gcc
++LD ?= gcc
++RM ?= rm
++CFLAGS += -O -Wall $(INCS) -DUSE_ZLIB
+ # [note that -Wall is a gcc-specific compilation flag ("all warnings on")]
+ O = .o
+ E =
+ 
+-LDFLAGS =
+-
+ PROG = pngcheck
+ PROG2 = pngsplit
+ PROG3 = png-fix-IDAT-windowsize
+@@ -57,13 +55,13 @@ EXES = $(PROG)$(E) $(PROG2)$(E) $(PROG3)$(E)
+ all:  $(EXES)
+ 
+ $(PROG)$(E): $(PROG).c
+-	$(CC) $(CFLAGS) -o $@ $(PROG).c $(LIBS)
++	$(CC) $(CFLAGS) -o $@ $(PROG).c $(LDFLAGS) $(LIBS)
+ 
+ $(PROG2)$(E): gpl/$(PROG2).c
+-	$(CC) $(CFLAGS) -o $@ gpl/$(PROG2).c $(LIBS)
++	$(CC) $(CFLAGS) -o $@ gpl/$(PROG2).c $(LDFLAGS) $(LIBS)
+ 
+ $(PROG3)$(E): gpl/$(PROG3).c
+-	$(CC) $(CFLAGS) -o $@ gpl/$(PROG3).c $(LIBS)
++	$(CC) $(CFLAGS) -o $@ gpl/$(PROG3).c $(LDFLAGS) $(LIBS)
+ 
+ 
+ # maintenance ---------------------------------------------------------------
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch b/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
new file mode 100644
index 000000000..6d4465fbe
--- /dev/null
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
@@ -0,0 +1,36 @@
+From d4d8257953bd1e7be167aed24c0578362cc5f675 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Apr 2017 13:12:30 -0700
+Subject: [PATCH 1/2] png-fix-IDAT-windowsize: Fix format string errors in
+ fprintf
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gpl/png-fix-IDAT-windowsize.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gpl/png-fix-IDAT-windowsize.c b/gpl/png-fix-IDAT-windowsize.c
+index 6d4ef9c..d212017 100644
+--- a/gpl/png-fix-IDAT-windowsize.c
++++ b/gpl/png-fix-IDAT-windowsize.c
+@@ -127,7 +127,7 @@ int main(int argc, char *argv[])
+             fprintf(stderr, "  Compiled with zlib %s; using zlib %s.\n",
+               ZLIB_VERSION, zlib_version);
+             fprintf(stderr, "\n");
+-            fprintf(stderr, png_fix_IDAT_windowsize_usage);
++            fprintf(stderr, "%s", png_fix_IDAT_windowsize_usage);
+             fflush(stderr);
+             return 1;
+         }
+@@ -143,7 +143,7 @@ int main(int argc, char *argv[])
+     fflush(stdout);
+ 
+     if ( argn == argc ) {
+-        fprintf(stderr, png_fix_IDAT_windowsize_usage);
++        fprintf(stderr, "%s", png_fix_IDAT_windowsize_usage);
+         fflush(stderr);
+         return 5;
+     } else {
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch b/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
new file mode 100644
index 000000000..f2c86689e
--- /dev/null
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
@@ -0,0 +1,40 @@
+From: Jari Aalto <jari.aalto@cante.net>
+Subject: Correct fomat strings fro hardened build flags
+
+---
+ gpl/pngsplit.c |   10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+--- a/gpl/pngsplit.c
++++ b/gpl/pngsplit.c
+@@ -141,8 +141,8 @@
+                   0 == strncmp( argv[argn], "-quiet", 2 ) )
+             verbose = 0;
+         else {
+-            fprintf(stderr, pngsplit_hdr);
+-            fprintf(stderr, pngsplit_usage);
++            fprintf(stderr, "%s", pngsplit_hdr);
++            fprintf(stderr, "%s", pngsplit_usage);
+             fflush(stderr);
+             return 1;
+         }
+@@ -150,8 +150,8 @@
+     }
+ 
+     if ( argn == argc ) {
+-        fprintf(stderr, pngsplit_hdr);
+-        fprintf(stderr, pngsplit_usage);
++        fprintf(stderr, "%s", pngsplit_hdr);
++        fprintf(stderr, "%s", pngsplit_usage);
+         fflush(stderr);
+         return 5;
+     } else {
+@@ -162,7 +162,7 @@
+ 
+     /*=============================  MAIN LOOP  =============================*/
+ 
+-    fprintf(stdout, pngsplit_hdr);
++    fprintf(stdout, "%s", pngsplit_hdr);
+     fflush(stdout);
+ 
+     while (argn <= argc) {
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
index 6d0dfff93..9f617ecda 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -4,15 +4,21 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "zlib libpng"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+           file://10-pngsplit-format-strings.patch \
+           file://0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch \
+           file://0001-make-Respect-variables-from-environement.patch \
+           "
 
 SRC_URI[md5sum] = "980bd6d9a3830fdce746d7fe3c9166ee"
 SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+CFLAGS += "-DUSE_ZLIB"
+
+EXTRA_OEMAKE = "-f ${S}/Makefile.unx"
 
 do_compile() {
-    oe_runmake -f Makefile.unx INCS=-I${STAGING_DIR_HOST}${incdir} LIBS='${STAGING_DIR_HOST}${libdir}/libz.a ${LDFLAGS}'
+    oe_runmake
 }
 
 do_install() {
-- 
2.12.2



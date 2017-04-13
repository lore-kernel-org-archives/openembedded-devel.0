Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72B5477D5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o123so13477680pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AZXmCYH8g/8W/bYF42iaNPNasjrg78CUU3QVjqmzrIc=;
	b=fF6mNzrKW7ulyVLRaD2vFpztNbXGuuzU4aiGPUcih8Hl87GX6H/H2+TRXwWF4595fw
	OgJuwAuxLKyuCIA43LfB2uKMTUNIHVmPxlBgpYtnCJQrzYbP1SUxqRvU+Kn4aOXVT+/+
	dnD1i0KOj8xvloRKyKOTPY72MHneA8lS2cm0oo9wDzdBrcYxLlQ0v8t2mJGMmy4NaFsR
	kNxp4lSagRcgzSm5qZe01Pu9yltDubjWQetKTuDjDXYH6kxV9u1Ta6cHSRJQjTnZrKzA
	q7EwQQT8RhUuNWVHTsvnlxF45t0j69LF82nMm9z4Xf7AslACFIwd895SYuyJ4NbDtxiX
	N3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AZXmCYH8g/8W/bYF42iaNPNasjrg78CUU3QVjqmzrIc=;
	b=YLhQjBlc30QLvevAhuMiSJ8yZDqP/NepssFmEqYekP8aG1pNKgr6UbjAG250hAAVpD
	KK+ban5milAXV0CGJ++/m5I4BN8ptWQJWoTl/8a/lUWkTj5y1iexRw6mtoL5EedKZX+b
	8ZdfYonCcsBWUfTKDbIu3ZyM/wAostRNTvjoy7aZhBF24OcZEUdlsppMqPubW4t46SIJ
	D/tP4dlfmsScjZwvO5eWsN06Th3A9xzC9cHzIPa0KURJ2XAXnlpNoAKzN7QSLla6Gdh6
	7RIXdSnaxq0L/1i320+Vjk1tr/1H8viDovtDCMeF2gHIhimDWN3Xu5VnS+C1/Cyku8HI
	2M2Q==
X-Gm-Message-State: AN3rC/5O8FbA/wnUKkCaY6tKUbncHeG3eJmXW7qw9aJlxxWWgO/j37er
	FWwyrwvjHgp4LA==
X-Received: by 10.84.135.3 with SMTP id 3mr5304761pli.65.1492116113094;
	Thu, 13 Apr 2017 13:41:53 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:41:00 -0700
Message-Id: <20170413204106.30679-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 23/29] pngcheck: Fix cross build and format string errors
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:51 -0000

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



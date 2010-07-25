Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od7fE-0002ya-P1
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 22:19:15 +0200
Received: by mail-ew0-f47.google.com with SMTP id 7so692320ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3mQPGBe8m7AQ1tJJXrQ8Ssax4erRuEdHzZnS4yFwx2Y=;
	b=qit5KlC55Bl0PiBBwsNC9ZJvVSELnvqFRaZbUbyL3gwBts3crb4FyOo52u+WBwC1hg
	KTU0O2ScbljE76S/DUF0++1v95NbRcJmpWoj2MOMcImx+yRP+LOJxHVyeIhEtu79/jAK
	mu8nWVence30rF+3sV7RgQ3iQcMQR9AkgNp0w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NtNQDu5eGM8m5MeI8uZUuyIZOGrYpXRMBf+fhyTK6SX4GfZqr6vRGHumvt5vR6E/mj
	hCZKCp6yTukmB0Tjia09SzXODNFCK2JJUtm/rS+3E584aV3R/HPq6PHBRxLZ50Qxyve0
	OWGGrJzqEztp/kY6tVhhn7Ve1gwr3VJB32xSE=
Received: by 10.213.33.197 with SMTP id i5mr2943672ebd.44.1280089137955;
	Sun, 25 Jul 2010 13:18:57 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm4400476eei.18.2010.07.25.13.18.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jul 2010 13:18:57 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jul 2010 22:18:44 +0200
Message-Id: <1280089125-30217-3-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1280089125-30217-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1280089125-30217-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1280089125-30217-2-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] gcc4.4.x: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Sun, 25 Jul 2010 20:19:15 -0000

When compiling gcc target code make passes -I(GMPINC)
but this one points to the host dir (it is set to HOST_GMPINC
which in oe points to tmp/sysroots/i686-linux/usr/include).
This patch breaks the env var $(INCLUDES) in two and
only uses the TARGET specific part for compiling libgcc
and the crt stuff.

The patch has been verified by baking all affected recipes with
bitbake -c configure -b recipe

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gcc/gcc-4.4.1.inc               |    3 ++-
 recipes/gcc/gcc-4.4.1/Makefile.in.patch |   30 ++++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.4.2.inc               |    3 ++-
 recipes/gcc/gcc-4.4.2/Makefile.in.patch |   30 ++++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.4.4.inc               |    3 ++-
 recipes/gcc/gcc-4.4.4/Makefile.in.patch |   30 ++++++++++++++++++++++++++++++
 6 files changed, 96 insertions(+), 3 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.4.1/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.4.2/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.4.4/Makefile.in.patch

diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index c4138b8..1364cf6 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 FILESPATHPKG .= ":gcc-$PV"
 
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-pr41175.patch \
 	file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
 	file://gcc-4.3.3-fix-EXTRA_BUILD.patch \
+	file://Makefile.in.patch \
 	"
 # Language Overrides
 FORTRAN = ""
diff --git a/recipes/gcc/gcc-4.4.1/Makefile.in.patch b/recipes/gcc/gcc-4.4.1/Makefile.in.patch
new file mode 100644
index 0000000..13ae6c5
--- /dev/null
+++ b/recipes/gcc/gcc-4.4.1/Makefile.in.patch
@@ -0,0 +1,30 @@
+Index: gcc-4.4.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.4.4.orig/gcc/Makefile.in
++++ gcc-4.4.4/gcc/Makefile.in
+@@ -596,7 +596,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -940,10 +940,14 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC) \
++	   $(CPPINC) $(DECNUMINC) \
+ 	   $(PPLINC) $(CLOOGINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 0ad3fe5..dd0ca67 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 FILESPATHPKG .= ":gcc-$PV"
 
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-pr41175.patch \
 	file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
 	file://gcc-4.3.3-fix-EXTRA_BUILD.patch \
+	file://Makefile.in.patch \
 	"
 # Language Overrides
 FORTRAN = ""
diff --git a/recipes/gcc/gcc-4.4.2/Makefile.in.patch b/recipes/gcc/gcc-4.4.2/Makefile.in.patch
new file mode 100644
index 0000000..13ae6c5
--- /dev/null
+++ b/recipes/gcc/gcc-4.4.2/Makefile.in.patch
@@ -0,0 +1,30 @@
+Index: gcc-4.4.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.4.4.orig/gcc/Makefile.in
++++ gcc-4.4.4/gcc/Makefile.in
+@@ -596,7 +596,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -940,10 +940,14 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC) \
++	   $(CPPINC) $(DECNUMINC) \
+ 	   $(PPLINC) $(CLOOGINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
diff --git a/recipes/gcc/gcc-4.4.4.inc b/recipes/gcc/gcc-4.4.4.inc
index 37c8cd0..ba3ec1b 100644
--- a/recipes/gcc/gcc-4.4.4.inc
+++ b/recipes/gcc/gcc-4.4.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 FILESPATHPKG .= ":gcc-$PV"
 
@@ -27,6 +27,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=gcc444tarbz2 \
 	file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
 	file://gcc-add-t-slibgcc-libgcc.patch \
 	file://gcc-4.3.3-fix-EXTRA_BUILD.patch \
+	file://Makefile.in.patch \
 	"
 SRC_URI[gcc444tarbz2.md5sum] = "7ff5ce9e5f0b088ab48720bbd7203530"
 SRC_URI[gcc444tarbz2.sha256sum] = "e1c13696b45752ad3f652304fab5120a43a8a5c0f438d3bda78cf16b620c0c58"
diff --git a/recipes/gcc/gcc-4.4.4/Makefile.in.patch b/recipes/gcc/gcc-4.4.4/Makefile.in.patch
new file mode 100644
index 0000000..13ae6c5
--- /dev/null
+++ b/recipes/gcc/gcc-4.4.4/Makefile.in.patch
@@ -0,0 +1,30 @@
+Index: gcc-4.4.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.4.4.orig/gcc/Makefile.in
++++ gcc-4.4.4/gcc/Makefile.in
+@@ -596,7 +596,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -940,10 +940,14 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC) \
++	   $(CPPINC) $(DECNUMINC) \
+ 	   $(PPLINC) $(CLOOGINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
-- 
1.6.4.2




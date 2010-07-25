Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od7fA-0002ya-TQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 22:19:10 +0200
Received: by ewy7 with SMTP id 7so692320ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 13:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6X3hQg5/zTVbWU4FyrGi79SD36pxemvKhh/KLAsqdvU=;
	b=kUmZtUTXdbhtZfhLKYgmsMkBnwPNBKOUSGhw7oQF1/TfiIf8RNDsbD89Be2zqfKaSo
	rTI0bzxz+0EZv0PKguZqR4EwV7SQXHw0HSbD3H73xpS6ykKp3Mq/YwynPiA5bx4GCHbH
	tUOR1WKdfCAMkyU9I/ZgDPCiqbAYMg04WZdw4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ADodoYj/vhY8WLK4yRBs8Usexh3zfnWtyw8QGfmF95cPUK43LZDNmLfxEeg0Y61P26
	cWPvIi28teCQ7CFi7sDN3x1VugWpE62RwPkgcdlnEconsLkH/NqWjwuNlPopR91XYjC1
	FtAtBa1dT3KbQWOC791/NPEziuuwaRqdmBbXU=
Received: by 10.213.33.73 with SMTP id g9mr2861818ebd.41.1280089135732;
	Sun, 25 Jul 2010 13:18:55 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm4400476eei.18.2010.07.25.13.18.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jul 2010 13:18:55 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jul 2010 22:18:43 +0200
Message-Id: <1280089125-30217-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1280089125-30217-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1280089125-30217-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] gcc4.3.x: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Sun, 25 Jul 2010 20:19:10 -0000

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
 recipes/gcc/gcc-4.3.1.inc               |    3 ++-
 recipes/gcc/gcc-4.3.1/Makefile.in.patch |   29 +++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.3.2.inc               |    3 ++-
 recipes/gcc/gcc-4.3.2/Makefile.in.patch |   29 +++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.3.3.inc               |    3 ++-
 recipes/gcc/gcc-4.3.3/Makefile.in.patch |   29 +++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.3.4.inc               |    3 ++-
 recipes/gcc/gcc-4.3.4/Makefile.in.patch |   29 +++++++++++++++++++++++++++++
 8 files changed, 124 insertions(+), 4 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.3.1/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.3.2/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.3.4/Makefile.in.patch

diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index 0f93d37..275ab9a 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
@@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://zecke-xgcc-cpp.patch \
 	file://gcc-4.3.x-fix-EXTRA_BUILD.patch \
 	file://gcc-flags-for-build.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.1/Makefile.in.patch b/recipes/gcc/gcc-4.3.1/Makefile.in.patch
new file mode 100644
index 0000000..4c11a64
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.1/Makefile.in.patch
@@ -0,0 +1,29 @@
+Index: gcc-4.3.1/gcc/Makefile.in
+===================================================================
+--- gcc-4.3.1.orig/gcc/Makefile.in
++++ gcc-4.3.1/gcc/Makefile.in
+@@ -575,7 +575,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -901,9 +901,13 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC)
++	   $(CPPINC) $(DECNUMINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index 5eebf0b..fa4e22e 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
@@ -61,6 +61,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://zecke-xgcc-cpp.patch \
 	file://gcc-4.3.x-fix-EXTRA_BUILD.patch \
 	file://gcc-flags-for-build.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.2/Makefile.in.patch b/recipes/gcc/gcc-4.3.2/Makefile.in.patch
new file mode 100644
index 0000000..4c11a64
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.2/Makefile.in.patch
@@ -0,0 +1,29 @@
+Index: gcc-4.3.1/gcc/Makefile.in
+===================================================================
+--- gcc-4.3.1.orig/gcc/Makefile.in
++++ gcc-4.3.1/gcc/Makefile.in
+@@ -575,7 +575,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -901,9 +901,13 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC)
++	   $(CPPINC) $(DECNUMINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index aa16643..a2e93e7 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
@@ -63,6 +63,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
 	file://gcc-4.3.3-fix-EXTRA_BUILD.patch \
         file://arm-gcc-objective.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.3/Makefile.in.patch b/recipes/gcc/gcc-4.3.3/Makefile.in.patch
new file mode 100644
index 0000000..4c11a64
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/Makefile.in.patch
@@ -0,0 +1,29 @@
+Index: gcc-4.3.1/gcc/Makefile.in
+===================================================================
+--- gcc-4.3.1.orig/gcc/Makefile.in
++++ gcc-4.3.1/gcc/Makefile.in
+@@ -575,7 +575,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -901,9 +901,13 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC)
++	   $(CPPINC) $(DECNUMINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
index 8fd607a..37e5ec0 100644
--- a/recipes/gcc/gcc-4.3.4.inc
+++ b/recipes/gcc/gcc-4.3.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
@@ -61,6 +61,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://zecke-xgcc-cpp.patch \
 	file://gcc-4.3.x-fix-EXTRA_BUILD.patch \
 	file://gcc-flags-for-build.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.4/Makefile.in.patch b/recipes/gcc/gcc-4.3.4/Makefile.in.patch
new file mode 100644
index 0000000..4c11a64
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.4/Makefile.in.patch
@@ -0,0 +1,29 @@
+Index: gcc-4.3.1/gcc/Makefile.in
+===================================================================
+--- gcc-4.3.1.orig/gcc/Makefile.in
++++ gcc-4.3.1/gcc/Makefile.in
+@@ -575,7 +575,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -901,9 +901,13 @@ BUILD_ERRORS = build/errors.o
+ # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
+ # currently being compiled, in both source trees, to be examined as well.
+ # libintl.h will be found in ../intl if we are using the included libintl.
+-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
++#
++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
++# include dir) is used for compiling libgcc.a
++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+ 	   -I$(srcdir)/../include @INCINTL@ \
+-	   $(CPPINC) $(GMPINC) $(DECNUMINC)
++	   $(CPPINC) $(DECNUMINC)
++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
+ 
+ .c.o:
+ 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
-- 
1.6.4.2




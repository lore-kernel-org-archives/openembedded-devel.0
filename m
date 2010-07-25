Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od7f8-0002wb-Jd
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 22:19:13 +0200
Received: by eyf5 with SMTP id 5so377591eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=OiypBIwROnnYS9cz1AYniYqbs1a7wwTqEas6YvPN3Ck=;
	b=T6pJsrXTUZQvQ4YAtoUcS9Vhf/NXWx9b9Rl5gJxEGuwgkm33HZg0sfdOV+ymIAX6CU
	uK9Ztd5IcBM3o6PA/YUxfV2KjbvRFxPO24zNMZqPMMnuJBq91oai3rwpQTSNW7jigCs9
	Pu/+0I+FMiZQc+mdCQb2R3UscnBjz8iAlGKDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nCurjltMeI49yEspkD/TvcWDo/t8auUIV5xkehAOQTflkIsWe5I7v2mqPH+CkJzIll
	/os6lNqkmwKJT5PiVx5xMEcTQzr2lypUMef5NzOuh+VciRox76OQbgaGMN7Wa3Eu05SS
	+OFYcRQIb16EGpFt/pdleU8NVtPjNJ72U5LFk=
Received: by 10.213.113.12 with SMTP id y12mr5544015ebp.53.1280089132138;
	Sun, 25 Jul 2010 13:18:52 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm4400476eei.18.2010.07.25.13.18.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jul 2010 13:18:51 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jul 2010 22:18:42 +0200
Message-Id: <1280089125-30217-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] gcc4.2.x: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Sun, 25 Jul 2010 20:19:13 -0000

When compiling gcc target code make passes -I(GMPINC)
but this one points to the host dir (it is set to HOST_GMPINC
which in oe points to tmp/sysroots/i686-linux/usr/include).
This patch breaks the env var $(INCLUDES) in two and
only uses the TARGET specific part for compiling libgcc
and the crt stuff.

The patch has been verified by baking all affected recipes with
bitbake -c configure -b recipe

Also introduced INC_PR

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gcc/gcc-4.2.1.inc               |    3 ++
 recipes/gcc/gcc-4.2.1/Makefile.in.patch |   38 +++++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.2.2.inc               |    3 +-
 recipes/gcc/gcc-4.2.2/Makefile.in.patch |   38 +++++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.2.3.inc               |    3 +-
 recipes/gcc/gcc-4.2.3/Makefile.in.patch |   38 +++++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.2.4.inc               |    3 +-
 recipes/gcc/gcc-4.2.4/Makefile.in.patch |   38 +++++++++++++++++++++++++++++++
 recipes/gcc/gcc-cross_4.2.1.bb          |    2 +-
 recipes/gcc/gcc_4.2.1.bb                |    2 +-
 10 files changed, 163 insertions(+), 5 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.2.1/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.2.2/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.2.3/Makefile.in.patch
 create mode 100644 recipes/gcc/gcc-4.2.4/Makefile.in.patch

diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
index 63876f7..fbee758 100644
--- a/recipes/gcc/gcc-4.2.1.inc
+++ b/recipes/gcc/gcc-4.2.1.inc
@@ -3,6 +3,8 @@ require gcc-common.inc
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
+INC_PR = "r22"
+
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
 	file://103-uclibc-conf-noupstream.patch \
@@ -33,6 +35,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://cache-amnesia.patch \
 	file://gfortran.patch \
 	file://pr34130.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_avr32 = " http://ewi546.ewi.utwente.nl/tmp/avr32-gcc-4.2.1-atmel.1.0.3.tar.gz;name=atmel \
diff --git a/recipes/gcc/gcc-4.2.1/Makefile.in.patch b/recipes/gcc/gcc-4.2.1/Makefile.in.patch
new file mode 100644
index 0000000..6013f71
--- /dev/null
+++ b/recipes/gcc/gcc-4.2.1/Makefile.in.patch
@@ -0,0 +1,38 @@
+Index: gcc-4.2.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.2.4.orig/gcc/Makefile.in
++++ gcc-4.2.4/gcc/Makefile.in
+@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
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
+@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
+ 	$(MAKE) \
+ 	  CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
+ 	  CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
+-	  INCLUDES="$(INCLUDES)" \
++	  INCLUDES="$(TARGET_INCLUDES)" \
+ 	  MAKEOVERRIDES= \
+ 	  -f libgcc.mk all
+ 
diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
index 2a5334a..5e11b3f 100644
--- a/recipes/gcc/gcc-4.2.2.inc
+++ b/recipes/gcc/gcc-4.2.2.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
@@ -40,6 +40,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://pr34130.patch \
 	file://fortran-static-linking.patch \
 	file://intermask-bigendian.patch \
+	file://Makefile.in.patch \
 "
 
 
diff --git a/recipes/gcc/gcc-4.2.2/Makefile.in.patch b/recipes/gcc/gcc-4.2.2/Makefile.in.patch
new file mode 100644
index 0000000..6013f71
--- /dev/null
+++ b/recipes/gcc/gcc-4.2.2/Makefile.in.patch
@@ -0,0 +1,38 @@
+Index: gcc-4.2.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.2.4.orig/gcc/Makefile.in
++++ gcc-4.2.4/gcc/Makefile.in
+@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
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
+@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
+ 	$(MAKE) \
+ 	  CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
+ 	  CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
+-	  INCLUDES="$(INCLUDES)" \
++	  INCLUDES="$(TARGET_INCLUDES)" \
+ 	  MAKEOVERRIDES= \
+ 	  -f libgcc.mk all
+ 
diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
index e947cba..dd4a739 100644
--- a/recipes/gcc/gcc-4.2.3.inc
+++ b/recipes/gcc/gcc-4.2.3.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r17"
+INC_PR = "r18"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
@@ -39,6 +39,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-4.0.2-e300c2c3.patch \
 	file://fortran-static-linking.patch \
 	file://intermask-bigendian.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_append_ep93xx = " \
diff --git a/recipes/gcc/gcc-4.2.3/Makefile.in.patch b/recipes/gcc/gcc-4.2.3/Makefile.in.patch
new file mode 100644
index 0000000..6013f71
--- /dev/null
+++ b/recipes/gcc/gcc-4.2.3/Makefile.in.patch
@@ -0,0 +1,38 @@
+Index: gcc-4.2.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.2.4.orig/gcc/Makefile.in
++++ gcc-4.2.4/gcc/Makefile.in
+@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
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
+@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
+ 	$(MAKE) \
+ 	  CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
+ 	  CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
+-	  INCLUDES="$(INCLUDES)" \
++	  INCLUDES="$(TARGET_INCLUDES)" \
+ 	  MAKEOVERRIDES= \
+ 	  -f libgcc.mk all
+ 
diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
index e072731..513a63e 100644
--- a/recipes/gcc/gcc-4.2.4.inc
+++ b/recipes/gcc/gcc-4.2.4.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://100-uclibc-conf.patch \
@@ -40,6 +40,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fortran-static-linking.patch \
 	file://intermask-bigendian.patch \
 	file://libstdc++-hack-libtool-remove-lstdc++.patch \
+	file://Makefile.in.patch \
 "
 
 SRC_URI_append_ep93xx = " \
diff --git a/recipes/gcc/gcc-4.2.4/Makefile.in.patch b/recipes/gcc/gcc-4.2.4/Makefile.in.patch
new file mode 100644
index 0000000..6013f71
--- /dev/null
+++ b/recipes/gcc/gcc-4.2.4/Makefile.in.patch
@@ -0,0 +1,38 @@
+Index: gcc-4.2.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.2.4.orig/gcc/Makefile.in
++++ gcc-4.2.4/gcc/Makefile.in
+@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
+ TARGET_LIBGCC2_CFLAGS =
+ 
+ # Options to use when compiling crtbegin/end.
+-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
+   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
+   $(INHIBIT_LIBC_CFLAGS)
+@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
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
+@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
+ 	$(MAKE) \
+ 	  CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
+ 	  CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
+-	  INCLUDES="$(INCLUDES)" \
++	  INCLUDES="$(TARGET_INCLUDES)" \
+ 	  MAKEOVERRIDES= \
+ 	  -f libgcc.mk all
+ 
diff --git a/recipes/gcc/gcc-cross_4.2.1.bb b/recipes/gcc/gcc-cross_4.2.1.bb
index ae7f2b7..359a817 100644
--- a/recipes/gcc/gcc-cross_4.2.1.bb
+++ b/recipes/gcc/gcc-cross_4.2.1.bb
@@ -1,4 +1,4 @@
-PR = "r21"
+PR = "${INC_PR}.0"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
diff --git a/recipes/gcc/gcc_4.2.1.bb b/recipes/gcc/gcc_4.2.1.bb
index 9951efd..94faba1 100644
--- a/recipes/gcc/gcc_4.2.1.bb
+++ b/recipes/gcc/gcc_4.2.1.bb
@@ -1,4 +1,4 @@
-PR = "r15"
+PR = "${INC_PR}.0"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
-- 
1.6.4.2




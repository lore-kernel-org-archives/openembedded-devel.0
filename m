Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRix-0007cb-VH
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:21:20 +0200
Received: by ewy5 with SMTP id 5so128854ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=MgsFNYQK1EFIT05f1qLderXvuJar9gtGoBrFd+OQMkA=;
	b=gKPM8UBcxJ6nFYreXpYpVZIWRG8F78oJIeeT2LyBp7qxUQePckYTesiRJB2dI9se9X
	j8naKyP1JNiVVhfpJkOk26HOEL4sF1U1ZKvwk9pxoglisB4/ib6qY048ketAlS7PIpZn
	0ONSsH0fIlZ7IdplkDgb0rIKEI83c1Z1yD2sY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O5rKeCNOsEIbaCDvBbR3r7mLZwdThXwLTbSKiYVTrw836dnDbvkzai0ODvCMSqPSxm
	KeSmCD/brevaWjvPuK4tkexE483SCosQ7NccCRggpJ+zMDquRb5dzC4cFOBnNJV9FLBO
	xb3hiMs4H0GUvbyWd8H3nIJWoknvzk/IZEtZs=
Received: by 10.14.18.66 with SMTP id k42mr2524494eek.242.1303283930050;
	Wed, 20 Apr 2011 00:18:50 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id q53sm446245eeh.18.2011.04.20.00.18.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:18:49 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:18:47 +0200
Message-Id: <de998cc2048c90c3fd3829e2045c18c3f8f6f6bd.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Subject: [meta-oe 4/6] libnet: Re-import 1.1.2.1 from org.oe.dev
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
X-List-Received-Date: Wed, 20 Apr 2011 07:21:20 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../libnet/libnet-1.1.2.1/fix-endianess-test.patch |   36 +++++++++++++++++
 .../libnet/libnet-1.1.2.1/new-autotools.patch      |   20 ++++++++++
 .../libnet/libnet-1.1.2.1/support-uclibc.patch     |   13 ++++++
 .../recipes-connectivity/libnet/libnet_1.1.2.1.bb  |   41 ++++++++++++++++++++
 4 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb

diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch
new file mode 100644
index 0000000..6d93e04
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch
@@ -0,0 +1,36 @@
+Use autoconf's endian check instead of the locally defined check
+so that we can determine the endianess without having to compile
+a program.
+
+Idea from http://www.security-lists.org/lists/libnet/2003/03/00001.html
+
+Also remove the old test from aclocal.m4.
+
+--- libnet/configure.in	2005/11/15 03:49:30	1.1
++++ libnet/configure.in	2005/11/15 03:50:29
+@@ -7,6 +7,7 @@
+ dnl Process this file with autoconf to produce a configure script.
+ 
+ 
++AC_PREREQ(2.52)
+ AC_INIT(src/libnet_build_ip.c)
+ LIBNET_VERSION=`cat VERSION`
+ AC_MSG_RESULT(beginning autoconfiguration process for libnet-$LIBNET_VERSION...)
+@@ -29,7 +30,16 @@
+ dnl And some custom things
+ dnl
+ 
+-AC_LIBNET_ENDIAN_CHECK
++AC_C_BIGENDIAN([
++ AC_DEFINE(LIBNET_BIG_ENDIAN)
++ ENDIANESS="LIBNET_BIG_ENDIAN"
++ LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_BIG_ENDIAN"
++],[
++ AC_DEFINE(LIBNET_LIL_ENDIAN)
++ ENDIANESS="LIBNET_LIL_ENDIAN"
++ LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_LIL_ENDIAN"
++], AC_MSG_WARN(cannot detect endianess. try setting ac_cv_c_bigendian to yes or no)) 
++
+ AC_LBL_UNALIGNED_ACCESS
+ dnl AC_LBL_LIBRARY_NET
+ 
diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch
new file mode 100644
index 0000000..064413e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch
@@ -0,0 +1,20 @@
+Index: libnet/src/Makefile.am
+===================================================================
+--- libnet.orig/src/Makefile.am	2004-03-12 05:50:20.000000000 +1100
++++ libnet/src/Makefile.am	2007-08-11 16:41:09.000000000 +1000
+@@ -57,15 +57,5 @@
+ 			libnet_version.c \
+ 			libnet_write.c
+ 
+-EXTRA_libnet_a_SOURCES = libnet_link_bpf.c \
+-			libnet_link_dlpi.c \
+-			libnet_link_linux.c \
+-			libnet_link_nit.c \
+- 			libnet_link_none.c \
+-			libnet_link_pf.c \
+-			libnet_link_snit.c \
+-			libnet_link_snoop.c \
+-			libnet_link_win32.c
+-
+ libnet_a_LIBADD = @LIBOBJS@
+ 
diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch
new file mode 100644
index 0000000..84d117c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch
@@ -0,0 +1,13 @@
+Add support for building with uclibc.
+
+--- libnet/config.sub	2005/11/16 12:34:11	1.1
++++ libnet/config.sub	2005/11/16 12:35:56
+@@ -117,7 +117,7 @@
+ # Here we must recognize all the valid KERNEL-OS combinations.
+ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+ case $maybe_os in
+-  nto-qnx* | linux-gnu* | storm-chaos* | os2-emx* | windows32-*)
++  nto-qnx* | linux-gnu* | linux-uclibc* | storm-chaos* | os2-emx* | windows32-*)
+     os=-$maybe_os
+     basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
+     ;;
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
new file mode 100644
index 0000000..b09f56e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "A packet dissection and creation library"
+HOMEPAGE = "http://www.packetfactory.net/libnet/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "BSD"
+DEPENDS = "libpcap"
+# There are major API changes beween libnet v1.0 and libnet v1.1
+PROVIDES = "libnet-1.1"
+PR = "r4"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/libn/libnet/libnet_${PV}.orig.tar.gz \
+           file://support-uclibc.patch \
+           file://fix-endianess-test.patch \
+           file://new-autotools.patch"
+
+S = "${WORKDIR}/libnet"
+
+inherit autotools binconfig
+
+do_configure_prepend() {
+        rm -f aclocal.m4 Makefile.am ltmain.sh
+}
+
+do_install_append () {
+        oe_runmake -C src 'DESTDIR=${D}${libdir}/' 'libdir=' install-libLIBRARIES
+        oe_runmake -C include 'DESTDIR=${D}${includedir}/' 'includedir=' install-includeHEADERS
+        oe_runmake -C include/libnet 'DESTDIR=${D}${includedir}/' 'includedir=' install-libnetincludeHEADERS
+        install -d ${D}${datadir}/man/man3/
+        install -d ${D}${bindir}
+        install -m 0644 ${S}/doc/man/man3/*.3 ${D}${datadir}/man/man3/
+        install -m 0755 ${S}/libnet-config ${D}${bindir}
+}
+
+#static build
+FILES_${PN} = ""
+FILES_${PN}-dev += "${bindir}/libnet-config"
+
+CPPFLAGS_prepend = "-I${S}/libnet/include "
+
+SRC_URI[md5sum] = "be845c41170d72c7db524f3411b50256"
+SRC_URI[sha256sum] = "ab01882a3d0556176018c09342cd0731f7cbc8e687795009894c3326942c76ff"
-- 
1.7.3.4




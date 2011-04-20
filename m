Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRj1-0007cb-Kp
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:21:23 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so128854ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zBlztvyekmzSPaACs8lfCVmHrbnrHFnZUX7Jll5w4WI=;
	b=qyjvbSDuV1elz74LbtlPJTf/gKRM1ArIDl0tOPgmmTWu8NffoMXC7qiaHIuzdJ6emy
	H7LJd6ESmnUQGGdAX7rWgTbzjcIDfNOAkMgLWGViF0xggSgAQQLTlDvzO5lLJX39Y8qW
	64agWys0CzX6KpMymnn0ipE3LK5Us1C5VcRGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ph44uDt2TBwVFbj/uHNkuCFwP4FSBK/EZ47ldVGyR+eAPuxwbO4phR5EojW7OANr3e
	fAgb2f2/5T5lYgxNahE6NpEpTShcYUbJHWmkBSShMnEzDLSASdd71Trsw5J0cKIhDY8E
	+oyQyYhtMxYbWtmiH+h44KJ3SkTsM0e6g2CSU=
Received: by 10.14.126.211 with SMTP id b59mr2466998eei.246.1303283938288;
	Wed, 20 Apr 2011 00:18:58 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id k51sm448226eei.17.2011.04.20.00.18.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:18:57 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:18:54 +0200
Message-Id: <ee745668556da407eaed75a4c0f49d2e930dc7c2.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Subject: [meta-oe 5/6] libnet: Clean and upgrade (see below)
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
X-List-Received-Date: Wed, 20 Apr 2011 07:21:23 -0000

* libnet upstream on packetfactor is dead
  using https://github.com/sam-github/libnet instead
* Move to version 1.1.5
* Dropped patches (not needed): support-uclibc, new-autotools
* Added LIC_FILES_CHKSUM
* Removed useless do_install_append, works automatically
* Not building statically anymore

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../libnet/libnet-1.1.2.1/new-autotools.patch      |   20 ----------
 .../libnet/libnet-1.1.2.1/support-uclibc.patch     |   13 ------
 .../fix-endianess-test.patch                       |   20 +++++----
 .../recipes-connectivity/libnet/libnet_1.1.2.1.bb  |   41 --------------------
 .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   24 +++++++++++
 5 files changed, 35 insertions(+), 83 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch
 rename meta-oe/recipes-connectivity/libnet/{libnet-1.1.2.1 => libnet-1.1.5}/fix-endianess-test.patch (70%)
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb

diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch
deleted file mode 100644
index 064413e..0000000
--- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: libnet/src/Makefile.am
-===================================================================
---- libnet.orig/src/Makefile.am	2004-03-12 05:50:20.000000000 +1100
-+++ libnet/src/Makefile.am	2007-08-11 16:41:09.000000000 +1000
-@@ -57,15 +57,5 @@
- 			libnet_version.c \
- 			libnet_write.c
- 
--EXTRA_libnet_a_SOURCES = libnet_link_bpf.c \
--			libnet_link_dlpi.c \
--			libnet_link_linux.c \
--			libnet_link_nit.c \
-- 			libnet_link_none.c \
--			libnet_link_pf.c \
--			libnet_link_snit.c \
--			libnet_link_snoop.c \
--			libnet_link_win32.c
--
- libnet_a_LIBADD = @LIBOBJS@
- 
diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch
deleted file mode 100644
index 84d117c..0000000
--- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Add support for building with uclibc.
-
---- libnet/config.sub	2005/11/16 12:34:11	1.1
-+++ libnet/config.sub	2005/11/16 12:35:56
-@@ -117,7 +117,7 @@
- # Here we must recognize all the valid KERNEL-OS combinations.
- maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
- case $maybe_os in
--  nto-qnx* | linux-gnu* | storm-chaos* | os2-emx* | windows32-*)
-+  nto-qnx* | linux-gnu* | linux-uclibc* | storm-chaos* | os2-emx* | windows32-*)
-     os=-$maybe_os
-     basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
-     ;;
diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
similarity index 70%
rename from meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch
rename to meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
index 6d93e04..4d8697d 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-test.patch
+++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
@@ -6,17 +6,19 @@ Idea from http://www.security-lists.org/lists/libnet/2003/03/00001.html
 
 Also remove the old test from aclocal.m4.
 
---- libnet/configure.in	2005/11/15 03:49:30	1.1
-+++ libnet/configure.in	2005/11/15 03:50:29
-@@ -7,6 +7,7 @@
+Rebased for libnet-1.1.5 on 2011/04/19.
+
+--- a/configure.in	2010-11-03 00:59:21.000000000 +0100
++++ b/configure.in	2011-04-19 17:08:47.087712604 +0200
+@@ -6,6 +6,7 @@
+ dnl
  dnl Process this file with autoconf to produce a configure script.
  
- 
 +AC_PREREQ(2.52)
- AC_INIT(src/libnet_build_ip.c)
- LIBNET_VERSION=`cat VERSION`
- AC_MSG_RESULT(beginning autoconfiguration process for libnet-$LIBNET_VERSION...)
-@@ -29,7 +30,16 @@
+ AC_INIT(libnet, 1.1.5)
+ AC_MSG_RESULT(beginning autoconfiguration process for libnet-${PACKAGE_VERSION} ...)
+ AC_CANONICAL_SYSTEM
+@@ -39,7 +40,16 @@
  dnl And some custom things
  dnl
  
@@ -31,6 +33,6 @@ Also remove the old test from aclocal.m4.
 + LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_LIL_ENDIAN"
 +], AC_MSG_WARN(cannot detect endianess. try setting ac_cv_c_bigendian to yes or no)) 
 +
- AC_LBL_UNALIGNED_ACCESS
  dnl AC_LBL_LIBRARY_NET
  
+ AC_SUBST(ENDIANESS)
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
deleted file mode 100644
index b09f56e..0000000
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "A packet dissection and creation library"
-HOMEPAGE = "http://www.packetfactory.net/libnet/"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "BSD"
-DEPENDS = "libpcap"
-# There are major API changes beween libnet v1.0 and libnet v1.1
-PROVIDES = "libnet-1.1"
-PR = "r4"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/libn/libnet/libnet_${PV}.orig.tar.gz \
-           file://support-uclibc.patch \
-           file://fix-endianess-test.patch \
-           file://new-autotools.patch"
-
-S = "${WORKDIR}/libnet"
-
-inherit autotools binconfig
-
-do_configure_prepend() {
-        rm -f aclocal.m4 Makefile.am ltmain.sh
-}
-
-do_install_append () {
-        oe_runmake -C src 'DESTDIR=${D}${libdir}/' 'libdir=' install-libLIBRARIES
-        oe_runmake -C include 'DESTDIR=${D}${includedir}/' 'includedir=' install-includeHEADERS
-        oe_runmake -C include/libnet 'DESTDIR=${D}${includedir}/' 'includedir=' install-libnetincludeHEADERS
-        install -d ${D}${datadir}/man/man3/
-        install -d ${D}${bindir}
-        install -m 0644 ${S}/doc/man/man3/*.3 ${D}${datadir}/man/man3/
-        install -m 0755 ${S}/libnet-config ${D}${bindir}
-}
-
-#static build
-FILES_${PN} = ""
-FILES_${PN}-dev += "${bindir}/libnet-config"
-
-CPPFLAGS_prepend = "-I${S}/libnet/include "
-
-SRC_URI[md5sum] = "be845c41170d72c7db524f3411b50256"
-SRC_URI[sha256sum] = "ab01882a3d0556176018c09342cd0731f7cbc8e687795009894c3326942c76ff"
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
new file mode 100644
index 0000000..236f1a0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A packet dissection and creation library"
+# libnet at packetfactory.net is dead
+HOMEPAGE = "https://github.com/sam-github/libnet"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README;md5=533bea47338d490e86744c6a0c5692e7"
+DEPENDS = "libpcap"
+# There are major API changes beween libnet v1.0 and libnet v1.1
+PROVIDES = "libnet-1.1"
+PR = "r6"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
+           file://fix-endianess-test.patch"
+
+SRC_URI[md5sum] = "a9bc1d75a610efcfee200d3e28d8eb8f"
+SRC_URI[sha256sum] = "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80d8275db994496a20d"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools binconfig
+
+do_configure_prepend() {
+        rm -f aclocal.m4 Makefile.am ltmain.sh
+}
-- 
1.7.3.4




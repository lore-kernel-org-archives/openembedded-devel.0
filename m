Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1K7TcG-0005lN-I5
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jun 2008 13:08:16 +0200
Received: by fg-out-1718.google.com with SMTP id l26so2858448fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2008 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:cc
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=NEOkB6UtbDZMAGf7CHUhcXUXHQ1IWnH3nw+3GisPyLY=;
	b=GgtFBO3I00A7XBB2uyJzZjzrqpPS4Du3kQx4+igC36I7g7aWy5ouGPnHCXwMEBJNMq
	4RA4qkOJgVM1td9Nn4PZX89mEdnnsRA6XPcQ2ZwYrYNZ8o4z1RKwQ6L9fMaKAS3hoEsr
	K2ygE07fgmlf/ww6tSIGmFwkKX8/7OPdB5Cf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:cc:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	b=jJ98WifDNn4BBF9qj+dWIQXj8lyMbjbj+0vrNYRWw6owswArPElZcD+CkbwTFt8iMs
	Vpuj9JPLDXVdJH2sYWhsa8ogZF51hET03AIDGHjr6JxnBeGn3WE7bKdKvWPXcnENsN+Q
	Ea/eVQdCvUEKUCk+LF6nVkCuNkJRKBEbi1dbI=
Received: by 10.86.58.3 with SMTP id g3mr5457009fga.21.1213441676823;
	Sat, 14 Jun 2008 04:07:56 -0700 (PDT)
Received: from ?192.168.178.21? ( [85.178.198.238])
	by mx.google.com with ESMTPS id 4sm7098621fge.5.2008.06.14.04.07.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 14 Jun 2008 04:07:56 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sat, 14 Jun 2008 13:07:54 +0200
Message-Id: <1213441674.30583.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH, RFC] gettext 0.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 14 Jun 2008 11:08:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I have updated gettext to 0.17 locally with the following patch, and so
far I've seen no problems with it. But as Openmoko seems to be the only
distribution that has gettext fixed at 0.14.1, would anybody care to
test before I push this?

thanks
Philipp


#
# old_revision [cef6f2278de38ee8bff7d241d31ad6e08cc72ac2]
#
# rename "packages/gettext/gettext-native_0.14.1.bb"
#     to "packages/gettext/gettext-native.inc"
# 
# rename "packages/gettext/gettext_0.14.1.bb"
#     to "packages/gettext/gettext.inc"
# 
# add_dir "packages/gettext/gettext-0.17"
# 
# add_file "packages/gettext/gettext-0.17/disable_java.patch"
#  content [2a1353eddf56f18cd6094e918639f058ea830473]
# 
# add_file "packages/gettext/gettext-0.17/gettext-error_print_progname.patch"
#  content [a9549cd124898ccf32e3b9a64f38d4a44468a6eb]
# 
# add_file "packages/gettext/gettext-0.17/gettext-vpath.patch"
#  content [1fd3e5ba072410b744ae1604d822e2e2e686e29e]
# 
# add_file "packages/gettext/gettext-0.17/remove-ac-type-long-long.patch"
#  content [b4fe85e3f1d636f72036a29e3dacf8c38546069c]
# 
# add_file "packages/gettext/gettext-native_0.14.1.bb"
#  content [ab34f7581364c41b1a14550311222f17a893cd9e]
# 
# add_file "packages/gettext/gettext-native_0.17.bb"
#  content [5d4c3db07e4b86964f1a0daf0f2f55ec6d4e95b8]
# 
# add_file "packages/gettext/gettext_0.14.1.bb"
#  content [047e52eaaca0f3f623bd55d796971080d24c5521]
# 
# add_file "packages/gettext/gettext_0.17.bb"
#  content [78169f226c66ce85d5b900cc5aa7df44b32e9adc]
# 
# patch "packages/gettext/gettext-native.inc"
#  from [2e903067b552793b23bc96c5ec738ada09f03316]
#    to [274a5fef08d3b1b8af231284a6102f689b991d22]
# 
# patch "packages/gettext/gettext.inc"
#  from [3a0fa051089a75ecb61149ba3b56405116c60bb2]
#    to [8fd36e10eb372a83770bb2cd9c2148569541f87b]
#
============================================================
--- packages/gettext/gettext-0.17/disable_java.patch	2a1353eddf56f18cd6094e918639f058ea830473
+++ packages/gettext/gettext-0.17/disable_java.patch	2a1353eddf56f18cd6094e918639f058ea830473
@@ -0,0 +1,32 @@
+Index: gettext-0.17/gettext-tools/configure.ac
+===================================================================
+--- gettext-0.17.orig/gettext-tools/configure.ac	2007-10-28 16:22:11.000000000 +0100
++++ gettext-0.17/gettext-tools/configure.ac	2008-06-11 16:36:17.000000000 +0200
+@@ -35,27 +35,15 @@
+ gt_JAVA_CHOICE
+ 
+ gt_GCJ
+-if test -n "$HAVE_GCJ" && test "$JAVA_CHOICE" = yes; then
+-  BUILDJAVAEXE=yes
+-else
+   BUILDJAVAEXE=no
+-fi
+ AC_SUBST(BUILDJAVAEXE)
+ 
+ gt_JAVAEXEC
+ gt_JAVACOMP([1.3])
+ AC_CHECK_PROG(JAR, jar, jar)
+-if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
+-  BUILDJAVA=yes
+-else
+   BUILDJAVA=no
+-fi
+ AC_SUBST(BUILDJAVA)
+-if test -n "$HAVE_JAVAEXEC" && test $BUILDJAVA = yes; then
+-  TESTJAVA=yes
+-else
+   TESTJAVA=no
+-fi
+ AC_SUBST(TESTJAVA)
+ 
+ gt_CSHARPCOMP
============================================================
--- packages/gettext/gettext-0.17/gettext-error_print_progname.patch	a9549cd124898ccf32e3b9a64f38d4a44468a6eb
+++ packages/gettext/gettext-0.17/gettext-error_print_progname.patch	a9549cd124898ccf32e3b9a64f38d4a44468a6eb
@@ -0,0 +1,12 @@
+diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
+--- gettext-0.14.6/gettext-tools/gnulib-lib/error.h	2005-05-20 16:03:42.000000000 -0500
++++ gettext-0.14.6-patched/gettext-tools/gnulib-lib/error.h	2007-01-13 20:57:24.422168053 -0600
+@@ -50,7 +50,7 @@
+ /* If NULL, error will flush stdout, then print on stderr the program
+    name, a colon and a space.  Otherwise, error will call this
+    function without parameters instead.  */
+-extern DLL_VARIABLE void (*error_print_progname) (void);
++void (*error_print_progname) (void);
+ 
+ /* This variable is incremented each time `error' is called.  */
+ extern DLL_VARIABLE unsigned int error_message_count;
============================================================
--- packages/gettext/gettext-0.17/gettext-vpath.patch	1fd3e5ba072410b744ae1604d822e2e2e686e29e
+++ packages/gettext/gettext-0.17/gettext-vpath.patch	1fd3e5ba072410b744ae1604d822e2e2e686e29e
@@ -0,0 +1,13 @@
+Index: gettext-0.17/gettext-runtime/intl/Makefile.in
+===================================================================
+--- gettext-0.17.orig/gettext-runtime/intl/Makefile.in	2007-11-04 22:21:12.000000000 +0100
++++ gettext-0.17/gettext-runtime/intl/Makefile.in	2008-06-11 16:33:50.000000000 +0200
+@@ -35,7 +35,7 @@
+ #    'make' does the wrong thing if GNU gettext was configured with
+ #    "./configure --srcdir=`pwd`", namely it gets confused by the .lo and .la
+ #    files it finds in srcdir = ../../gettext-runtime/intl.
+-VPATH = $(srcdir)
++#VPATH = $(srcdir)
+ 
+ prefix = @prefix@
+ exec_prefix = @exec_prefix@
============================================================
--- packages/gettext/gettext-0.17/remove-ac-type-long-long.patch	b4fe85e3f1d636f72036a29e3dacf8c38546069c
+++ packages/gettext/gettext-0.17/remove-ac-type-long-long.patch	b4fe85e3f1d636f72036a29e3dacf8c38546069c
@@ -0,0 +1,12 @@
+Index: gettext-0.17/gettext-runtime/libasprintf/configure.ac
+===================================================================
+--- gettext-0.17.orig/gettext-runtime/libasprintf/configure.ac	2008-06-11 17:00:05.000000000 +0200
++++ gettext-0.17/gettext-runtime/libasprintf/configure.ac	2008-06-11 17:00:12.000000000 +0200
+@@ -54,7 +54,6 @@
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_INLINE
+ AC_TYPE_SIZE_T
+-gl_AC_TYPE_LONG_LONG
+ gt_TYPE_LONGDOUBLE
+ gt_TYPE_WCHAR_T
+ gt_TYPE_WINT_T
============================================================
--- packages/gettext/gettext-native_0.14.1.bb	ab34f7581364c41b1a14550311222f17a893cd9e
+++ packages/gettext/gettext-native_0.14.1.bb	ab34f7581364c41b1a14550311222f17a893cd9e
@@ -0,0 +1,9 @@
+require gettext_${PV}.bb
+require gettext-native.inc
+
+M4 += "\
+inttypes.m4 \
+isc-posix.m4 \
+longdouble.m4 \
+signed.m4 \
+"
============================================================
--- packages/gettext/gettext-native_0.17.bb	5d4c3db07e4b86964f1a0daf0f2f55ec6d4e95b8
+++ packages/gettext/gettext-native_0.17.bb	5d4c3db07e4b86964f1a0daf0f2f55ec6d4e95b8
@@ -0,0 +1,13 @@
+require gettext_${PV}.bb
+require gettext-native.inc
+
+# not sure if any of these is needed, help?
+#M4 += "\
+#ansi-c++.m4
+#glibc2.m4
+#intldir.m4
+#intl.m4
+#intlmacosx.m4
+#lock.m4
+#visibility.m4
+#"
============================================================
--- packages/gettext/gettext_0.14.1.bb	047e52eaaca0f3f623bd55d796971080d24c5521
+++ packages/gettext/gettext_0.14.1.bb	047e52eaaca0f3f623bd55d796971080d24c5521
@@ -0,0 +1,12 @@
+require gettext.inc
+
+PR = "r9"
+
+SRC_URI += "file://fixchicken.patch;patch=1;pnum=1 \
+            file://linklib_from_0.17.patch;patch=1 \
+            file://getline.m4.patch;patch=1"
+
+do_configure_prepend() {
+	rm -f ${S}/config/m4/libtool.m4
+	install -m 0644 ${STAGING_DATADIR}/aclocal/libtool.m4 ${S}/config/m4/
+}
============================================================
--- packages/gettext/gettext_0.17.bb	78169f226c66ce85d5b900cc5aa7df44b32e9adc
+++ packages/gettext/gettext_0.17.bb	78169f226c66ce85d5b900cc5aa7df44b32e9adc
@@ -0,0 +1,8 @@
+require gettext.inc
+
+SRC_URI += "file://remove-ac-type-long-long.patch;patch=1"
+
+do_configure_prepend() {
+	rm -f ${S}/m4/libtool.m4
+	install -m 0644 ${STAGING_DATADIR}/aclocal/libtool.m4 ${S}/m4/
+}
============================================================
--- packages/gettext/gettext-native_0.14.1.bb	2e903067b552793b23bc96c5ec738ada09f03316
+++ packages/gettext/gettext-native.inc	274a5fef08d3b1b8af231284a6102f689b991d22
@@ -1,4 +1,3 @@
-require gettext_${PV}.bb
 S = "${WORKDIR}/gettext-${PV}"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gettext-${PV}"
 inherit native
@@ -15,18 +14,14 @@ intmax.m4 \
 iconv.m4 \
 intdiv0.m4 \
 intmax.m4 \
-inttypes.m4 \
 inttypes_h.m4 \
 inttypes-pri.m4 \
-isc-posix.m4 \
 lcmessage.m4 \
-longdouble.m4 \
 longlong.m4 \
 nls.m4 \
 po.m4 \
 printf-posix.m4 \
 progtest.m4 \
-signed.m4 \
 size_max.m4 \
 stdint_h.m4 \
 uintmax_t.m4 \
@@ -43,6 +38,11 @@ do_stage_append() {
 			src="gettext-tools/m4/$i"
 		fi
 		if [ ! -f $src ]; then
+			# only for ulonglong.m4,
+			# should go away with autoconf 2.62
+			src="gettext-tools/libgettextpo/gnulib-m4/$i"
+		fi
+		if [ ! -f $src ]; then
 			src="autoconf-lib-link/m4/$i"
 		fi
 		if [ ! -f $src ]; then
============================================================
--- packages/gettext/gettext_0.14.1.bb	3a0fa051089a75ecb61149ba3b56405116c60bb2
+++ packages/gettext/gettext.inc	8fd36e10eb372a83770bb2cd9c2148569541f87b
@@ -2,15 +2,11 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPL"
-PR = "r9"
 DEPENDS = "virtual/libiconv"
 PROVIDES = "virtual/libintl"
 
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://gettext-vpath.patch;patch=1;pnum=1 \
-	   file://fixchicken.patch;patch=1;pnum=1 \
-	   file://linklib_from_0.17.patch;patch=1 \
-           file://getline.m4.patch;patch=1 \
            file://disable_java.patch;patch=1"
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
@@ -25,11 +21,6 @@ acpaths = '-I ${S}/autoconf-lib-link/m4/
 	   -I ${S}/gettext-runtime/m4 \
 	   -I ${S}/gettext-tools/m4'
 
-do_configure_prepend() {
-	rm -f ${S}/config/m4/libtool.m4
-	install -m 0644 ${STAGING_DATADIR}/aclocal/libtool.m4 ${S}/config/m4/
-}
-
 # these lack the .x behind the .so, but shouldn't be in the -dev package
 # Otherwise you get the following results:
 # 7.4M    glibc/images/ep93xx/Angstrom-console-image-glibc-ipk-2008.1-test-20080104-ep93xx.rootfs.tar.gz




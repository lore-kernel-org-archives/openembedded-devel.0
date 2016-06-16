Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 44FE9731E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:00:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 16 Jun 2016 04:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,480,1459839600"; d="scan'208";a="998855129"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 Jun 2016 04:00:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2016 14:00:06 +0300
Message-Id: <1466074806-14158-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466074806-14158-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466074806-14158-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] libmad: add the recipe
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
X-List-Received-Date: Thu, 16 Jun 2016 11:00:52 -0000

The recipe has been removed from oe-core, see https://bugzilla.yoctoproject.org/show_bug.cgi?id=6020

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libmad/libmad/add-pkgconfig.patch              | 70 ++++++++++++++++++++++
 .../libmad/libmad/automake-foreign.patch           | 12 ++++
 .../libmad/fix_for_mips_with_gcc-4.5.0.patch       | 33 ++++++++++
 .../libmad/libmad/no-force-mem.patch               | 18 ++++++
 .../libmad/libmad/obsolete_automake_macros.patch   | 14 +++++
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    | 36 +++++++++++
 6 files changed, 183 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/add-pkgconfig.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/automake-foreign.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/no-force-mem.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/obsolete_automake_macros.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb

diff --git a/meta-oe/recipes-multimedia/libmad/libmad/add-pkgconfig.patch b/meta-oe/recipes-multimedia/libmad/libmad/add-pkgconfig.patch
new file mode 100644
index 0000000..b49dc8c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/add-pkgconfig.patch
@@ -0,0 +1,70 @@
+Here is a patch for adding pkg-config support to libmad.
+It would make life a bit easier for distro maintainers if this was applied.
+In case you didn't know, pkg-config is a tool for providing LDFLAGS and
+CFLAGS for packages using shared libraries. It's on freedesktop.org.
+Debian has already been distributing the pkg-config file mad.pc with
+libmad for some time, and people developing on debian (notably xmms2 
+developers) have started relying on this support being present, causing
+some confusion for people installing from source and on some BSDs which
+do not provide mad.pc (google: pkgconfig libmad).
+
+EMH
+
+Upstream-Status: Inappropriate [configuration]
+
+--h31gzZEtNLTqOjlF
+Content-Type: text/plain; charset=us-ascii
+Content-Disposition: attachment; filename=&quot;libmad-0.15.1b-pkgconfig.patch&quot;
+
+diff -Naur libmad-0.15.1b.old/configure.ac libmad-0.15.1b/configure.ac
+--- libmad-0.15.1b.old/configure.ac	2004-01-23 10:41:32.000000000 +0100
++++ libmad-0.15.1b/configure.ac	2004-08-07 02:25:24.633462168 +0200
+@@ -429,5 +429,5 @@
+ dnl AC_SUBST(LTLIBOBJS)
+ 
+ AC_CONFIG_FILES([Makefile msvc++/Makefile  \
+-	libmad.list])
++	libmad.list mad.pc])
+ AC_OUTPUT
+diff -Naur libmad-0.15.1b.old/mad.pc.in libmad-0.15.1b/mad.pc.in
+--- libmad-0.15.1b.old/mad.pc.in	1970-01-01 01:00:00.000000000 +0100
++++ libmad-0.15.1b/mad.pc.in	2004-08-07 02:04:59.617692872 +0200
+@@ -0,0 +1,14 @@
++# libmad pkg-config source file
++
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: mad
++Description: MPEG Audio Decoder
++Version: @VERSION@
++Requires:
++Conflicts:
++Libs: -L${libdir} -lmad -lm
++Cflags: -I${includedir}
+diff -Naur libmad-0.15.1b.old/Makefile.am libmad-0.15.1b/Makefile.am
+--- libmad-0.15.1b.old/Makefile.am	2004-02-17 03:02:03.000000000 +0100
++++ libmad-0.15.1b/Makefile.am	2004-08-07 02:03:19.859858368 +0200
+@@ -24,6 +24,9 @@
+ SUBDIRS =		
+ DIST_SUBDIRS =		msvc++
+ 
++pkgconfigdir =		$(libdir)/pkgconfig
++pkgconfig_DATA =	mad.pc
++
+ lib_LTLIBRARIES =	libmad.la
+ include_HEADERS =	mad.h
+ 
+@@ -34,7 +37,8 @@
+ minimad_LDADD =		libmad.la
+ 
+ EXTRA_DIST =		mad.h.sed  \
+-			CHANGES COPYRIGHT CREDITS README TODO VERSION
++			CHANGES COPYRIGHT CREDITS README TODO VERSION \
++			mad.pc.in
+ 
+ exported_headers =	version.h fixed.h bit.h timer.h stream.h frame.h  \
+ 			synth.h decoder.h
+
diff --git a/meta-oe/recipes-multimedia/libmad/libmad/automake-foreign.patch b/meta-oe/recipes-multimedia/libmad/libmad/automake-foreign.patch
new file mode 100644
index 0000000..3e54424
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/automake-foreign.patch
@@ -0,0 +1,12 @@
+Pass foreign to AM_INIT_AUTOMAKE so it doesn't enforce GNU strictness.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index e602fd3..e075b86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29 +29 @@ AC_CONFIG_SRCDIR([decoder.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
diff --git a/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch b/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
new file mode 100644
index 0000000..01c7aa3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
@@ -0,0 +1,33 @@
+gcc 4.4 did this: The MIPS port no longer recognizes the h  asm constraint. It was necessary to remove this constraint in order to avoid generating unpredictable code sequences. 
+
+so the libmad build with gcc-4.5.0 was failing.
+
+Found a solution here:
+
+http://us.generation-nt.com/answer/bug-568418-libmad0-dev-mpg321-compilation-errors-mips-mipsel-architectures-help-169033451.html
+
+Upstream-Status: Pending
+
+2010/07/29
+Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: libmad-0.15.1b/fixed.h
+===================================================================
+--- libmad-0.15.1b.orig/fixed.h
++++ libmad-0.15.1b/fixed.h
+@@ -297,6 +297,15 @@ mad_fixed_t mad_f_mul_inline(mad_fixed_t
+ 
+ /* --- MIPS ---------------------------------------------------------------- */
+ 
++# elif defined(FPM_MIPS) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4))
++    typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
++#   define MAD_F_MLX(hi, lo, x, y) \
++    do { \
++        u64_di_t __ll = (u64_di_t) (x) * (y); \
++        hi = __ll >> 32; \
++        lo = __ll; \
++     } while (0)
++
+ # elif defined(FPM_MIPS)
+ 
+ /*
diff --git a/meta-oe/recipes-multimedia/libmad/libmad/no-force-mem.patch b/meta-oe/recipes-multimedia/libmad/libmad/no-force-mem.patch
new file mode 100644
index 0000000..d5e6d20
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/no-force-mem.patch
@@ -0,0 +1,18 @@
+This option no longer exists in gcc 3.4.1
+
+RP - 18/07/2008
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: libmad-0.15.1b/configure.ac
+===================================================================
+--- libmad-0.15.1b.orig/configure.ac	2008-07-18 15:45:30.000000000 +0100
++++ libmad-0.15.1b/configure.ac	2008-07-18 15:45:37.000000000 +0100
+@@ -140,7 +140,6 @@
+     case "$optimize" in
+ 	-O|"-O "*)
+ 	    optimize="-O"
+-	    optimize="$optimize -fforce-mem"
+ 	    optimize="$optimize -fforce-addr"
+ 	    : #x optimize="$optimize -finline-functions"
+ 	    : #- optimize="$optimize -fstrength-reduce"
diff --git a/meta-oe/recipes-multimedia/libmad/libmad/obsolete_automake_macros.patch b/meta-oe/recipes-multimedia/libmad/libmad/obsolete_automake_macros.patch
new file mode 100644
index 0000000..cc87d29
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted [https://sourceforge.net/tracker/?group_id=12349&atid=112349]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libmad-0.15.1b/configure.ac libmad-0.15.1b/configure.ac
+--- libmad-0.15.1b/configure.ac	2004-01-23 11:41:32.000000000 +0200
++++ libmad-0.15.1b/configure.ac	2013-01-03 08:28:23.718693697 +0200
+@@ -28,7 +28,7 @@
+
+ AM_INIT_AUTOMAKE
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ dnl System type.
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
new file mode 100644
index 0000000..d431abd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -0,0 +1,36 @@
+SUMMARY = "MPEG Audio Decoder library"
+HOMEPAGE = "http://sourceforge.net/projects/mad/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
+LICENSE = "GPLv2+"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+			file://COPYRIGHT;md5=8e55eb14894e782b84488d5a239bc23d \
+			file://version.h;beginline=1;endline=8;md5=aa07311dd39288d4349f28e1de516454"
+SECTION = "libs"
+DEPENDS = "libid3tag"
+PR = "r3"
+
+SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
+           file://no-force-mem.patch \
+           file://add-pkgconfig.patch \
+           file://fix_for_mips_with_gcc-4.5.0.patch \
+           file://obsolete_automake_macros.patch \
+           file://automake-foreign.patch \
+"
+
+SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
+SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690" 
+
+S = "${WORKDIR}/libmad-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "-enable-speed --enable-shared"
+EXTRA_OECONF_append_arm = " --enable-fpm=arm"
+
+do_configure_prepend () {
+#	damn picky automake...
+	touch NEWS AUTHORS ChangeLog
+}
+
+ARM_INSTRUCTION_SET = "arm"
-- 
2.8.1



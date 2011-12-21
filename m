Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RdPmU-0007bZ-26
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 18:16:42 +0100
Received: by ggnh1 with SMTP id h1so5873766ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=s+uRsG5BvMdmhkvnAGBPBolEZ4F4RkYHUHZi65unnoU=;
	b=bQ2Wo+vVUQvbalFl4gBIIvffc+NY3rYttodgjSLVMuP7rK9cx0NzdwIS69iVRBPgbP
	EB+YEu1WqjrtlrEIPhp5KWw/I9+nUbaXdaN7xOmWWTHv+k1rSuJXARkih2iR+pG/2scw
	WTiW9mJSjQE0Di2fn58UWzqqFS3kEaPMGoWTE=
Received: by 10.50.47.228 with SMTP id g4mr4505986ign.14.1324487375957;
	Wed, 21 Dec 2011 09:09:35 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18987789ibi.2.2011.12.21.09.09.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 09:09:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2011 09:09:19 -0800
Message-Id: <1324487359-3748-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.5: Update gxx headers patch
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
X-List-Received-Date: Wed, 21 Dec 2011 17:16:42 -0000

This patch now expects gxx-include-dir
to be specified under sysroot which we
already do through gcc-cross4.inc from
oe-core

Please test

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |    4 +-
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |  177 ++++++++++++++++++--
 2 files changed, 163 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index a0c2a7b..c2c451b 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r44"
+PR = "r45"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -226,13 +226,13 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://fedora/gcc45-no-add-needed.patch;striplevel=0 \
        file://optional_libstdc.patch \
        file://64bithack.patch \
-       file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
        file://COLLECT_GCC_OPTIONS.patch \
        file://gcc-poison-dir-extend.patch \
        file://gcc-poison-parameters.patch \
        file://gcc-ppc-config-fix.patch \
        file://use-defaults.h-and-t-oe-in-B.patch \
        file://gcc-with-linker-hash-style.patch \
+       file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
        "
 
 # Language Overrides
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
index 9ae01c3..5c7b346 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
@@ -1,33 +1,178 @@
-# by default c++ include directories are not relative to "--sysroot"
-# which brings one trouble when using the toolchain in an environment
-# where the build directory generating that toolchain doesn't exist,
-# e.g. in sstate, machine specific sysroot and relocatable SDK
-# toolchain. This patch now enables c++ include paths under sysroot.
-# This way it's enough as long as "--sysroot" is correctly enabled
-# in the new environment.
-#
-# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-12-30
-
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index 5024f48..9b47d1c 100644
+source: http://patchwork.ozlabs.org/patch/129800/
+Upstream-Status: Submitted
+
+ChangeLog
+        * Makefile.in (gcc_gxx_include_dir_add_sysroot): New.
+          (PREPROCESSOR_DEFINES): Define GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT.
+
+        * cppdefault.c (cpp_include_defaults): replace hard coded "1" with
+          GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT for "add_sysroot" field.
+
+        * configure.ac (AC_SUBST): Add gcc_gxx_include_dir_add_sysroot to
+          control whether sysroot should be prepended to gxx include dir.
+
+        * configure: Regenerate.
+
+Hi, this is a follow up for issue "http://codereview.appspot.com/4641076".
+
+The rationale for the patch copied from previous thread:
+=======================================
+The setup:
+
+Configuring a toolchain targeting x86-64 GNU Linux (Ubuntu Lucid), as a
+cross-compiler.  Using a sysroot to provide the Lucid headers+libraries,
+with the sysroot path being within the GCC install tree.  Want to use the
+Lucid system libstdc++ and headers, which means that I'm not
+building/installing libstdc++-v3.
+
+So, configuring with:
+  --with-sysroot="$SYSROOT"
+  --disable-libstdc++-v3 \
+  --with-gxx-include-dir="$SYSROOT/usr/include/c++/4.4" \
+(among other options).
+
+Hoping to support two usage models with this configuration, w.r.t. use of
+the sysroot:
+
+(1) somebody installs the sysroot in the normal location relative to the
+GCC install, and relocates the whole bundle (sysroot+GCC).  This works
+great AFAICT, GCC finds its includes (including the C++ includes) thanks
+to the add_standard_paths iprefix handling.
+
+(2) somebody installs the sysroot in a non-standard location, and uses
+--sysroot to try to access it.  This works fine for the C headers, but
+doesn't work.
+
+For the C headers, add_standard_paths prepends the sysroot location to
+the /usr/include path (since that's what's specified in cppdefault.c for
+that path).  It doesn't do the same for the C++ include path, though
+(again, as specified in cppdefault.c).
+
+add_standard_paths doesn't attempt to relocate built-in include paths that
+start with the compiled-in sysroot location (e.g., the g++ include dir, in
+this case).  This isn't surprising really: normally you either prepend the
+sysroot location or you don't (as specified by cppdefault.c); none of the
+built-in paths normally *start* with the sysroot location and need to be
+relocated.  However, in this odd-ball case of trying to use the C++ headers
+from the sysroot, one of the paths *does* need to be relocated in this way.
+===========================
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -585,6 +585,7 @@ slibdir = @slibdir@
+ build_tooldir = $(exec_prefix)/$(target_noncanonical)
+ # Directory in which the compiler finds target-independent g++ includes.
+ gcc_gxx_include_dir = @gcc_gxx_include_dir@
++gcc_gxx_include_dir_add_sysroot = @gcc_gxx_include_dir_add_sysroot@
+ # Directory to search for site-specific includes.
+ local_includedir = $(local_prefix)/include
+ includedir = $(prefix)/include
+@@ -3788,6 +3789,7 @@ PREPROCESSOR_DEFINES = \
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
++  -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+   -DGPLUSPLUS_TOOL_INCLUDE_DIR=\"$(gcc_gxx_include_dir)/$(target_noncanonical)\" \
+   -DGPLUSPLUS_BACKWARD_INCLUDE_DIR=\"$(gcc_gxx_include_dir)/backward\" \
+   -DLOCAL_INCLUDE_DIR=\"$(local_includedir)\" \
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -144,6 +144,15 @@ if test x${gcc_gxx_include_dir} = x; the
+   fi
+ fi
+ 
++gcc_gxx_include_dir_add_sysroot=0
++if test "${with_sysroot+set}" = set; then :
++  gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
++  if test "${gcc_gxx_without_sysroot}"; then :
++    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    gcc_gxx_include_dir_add_sysroot=1
++  fi
++fi
++
+ AC_ARG_WITH(cpp_install_dir,
+ [  --with-cpp-install-dir=DIR
+                           install the user visible C preprocessor in DIR
+@@ -4492,6 +4501,7 @@ AC_SUBST(extra_programs)
+ AC_SUBST(float_h_file)
+ AC_SUBST(gcc_config_arguments)
+ AC_SUBST(gcc_gxx_include_dir)
++AC_SUBST(gcc_gxx_include_dir_add_sysroot)
+ AC_SUBST(host_exeext)
+ AC_SUBST(host_xm_file_list)
+ AC_SUBST(host_xm_include_list)
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
-@@ -48,15 +48,15 @@ const struct default_include cpp_include_defaults[]
+@@ -48,15 +48,18 @@ const struct default_include cpp_include
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
 -    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
-+    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
++    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
  #endif
  #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
      /* Pick up GNU C++ target-dependent include files.  */
 -    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 0, 1 },
-+    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 1, 1 },
++    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
  #endif
  #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
      /* Pick up GNU C++ backward and deprecated include files.  */
 -    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
  #endif
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -639,6 +639,7 @@ host_xm_defines
+ host_xm_include_list
+ host_xm_file_list
+ host_exeext
++gcc_gxx_include_dir_add_sysroot
+ gcc_gxx_include_dir
+ gcc_config_arguments
+ float_h_file
+@@ -3282,6 +3283,15 @@ if test x${gcc_gxx_include_dir} = x; the
+   fi
+ fi
+ 
++gcc_gxx_include_dir_add_sysroot=0
++if test "${with_sysroot+set}" = set; then :
++  gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
++  if test "${gcc_gxx_without_sysroot}"; then :
++    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    gcc_gxx_include_dir_add_sysroot=1
++  fi
++fi
++
+ 
+ # Check whether --with-cpp_install_dir was given.
+ if test "${with_cpp_install_dir+set}" = set; then :
+@@ -17118,7 +17128,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17121 "configure"
++#line 17131 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -17224,7 +17234,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17227 "configure"
++#line 17237 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -25381,6 +25391,7 @@ fi
+ 
+ 
+ 
++
+ 
+ 
+ 
-- 
1.7.5.4




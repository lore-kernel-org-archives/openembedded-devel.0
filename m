Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7862F72EA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:21:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6H1Lc6x015069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 18:21:38 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 16 Jul 2018 18:21:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 17 Jul 2018 09:31:44 +0800
Message-ID: <1531791104-25445-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <fbe96a9d-0daa-4fb7-76fb-e400a9e49122@gmail.com>
References: <fbe96a9d-0daa-4fb7-76fb-e400a9e49122@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V3] mozjs: 17.0.0 -> 52.8.1
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
X-List-Received-Date: Tue, 17 Jul 2018 01:21:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Refactor recipe 52.8.1
  0001 ~ 0006

- Rebase patches to 52.8.1;
  0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
  0010-fix-cross-compilation-on-i586-targets.patch'

- Drop 0001-regenerate-configure.patch and everything works well

- Drop Manually_mmap_heap_memory_esr17.patch which is backported

- Drop obsolete patches
  0001-compare-the-first-character-of-string-to-be-null-or-.patch
  0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
  0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
  0004-mozbug746112-no-decommit-on-large-pages.patch
  0005-aarch64-64k-page.patch
  fix_milestone_compile_issue.patch
  fix-the-compile-error-of-powerpc64.patch
  Update-Double-Conversion.patch and Update-the-double-conversion-update-script.patch

- Set DISABLE_STATIC = "" to build without option `--disable-static'

- Set musl patch (0006-support-musl.patch) with musl override.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-first-character-of-string-to-be-null-or-.patch |   32 -
 .../0001-do-not-create-python-environment.patch    |   91 +
 ...-not-include-RequiredDefines.h-for-depend.patch |   30 +-
 ...ozjs17.0.0-fix-the-compile-bug-of-powerpc.patch |   36 -
 .../mozjs/mozjs/0001-regenerate-configure.patch    | 3238 --------------------
 ...02-Move-JS_BYTES_PER_WORD-out-of-config.h.patch |   75 -
 .../mozjs/mozjs/0002-fix-cannot-find-link.patch    |   34 +
 ...workaround-autoconf-2.13-detection-failed.patch |   28 +
 ...se-autoconf-2.13-to-refresh-old.configure.patch |   42 +
 ...4-mozbug746112-no-decommit-on-large-pages.patch |  103 -
 .../mozjs/mozjs/0005-aarch64-64k-page.patch        |   44 -
 .../mozjs/0005-fix-do_compile-failed-on-mips.patch |   38 +
 .../mozjs/mozjs/0006-support-musl.patch            |  158 +
 ...010-fix-cross-compilation-on-i586-targets.patch |   39 +-
 .../mozjs/Manually_mmap_heap_memory_esr17.patch    |  112 -
 .../mozjs/mozjs/Update-Double-Conversion.patch     | 1732 -----------
 ...pdate-the-double-conversion-update-script.patch |  175 --
 .../mozjs/fix-the-compile-error-of-powerpc64.patch |   18 -
 .../mozjs/mozjs/fix_milestone_compile_issue.patch  |   20 -
 .../mozjs/{mozjs_17.0.0.bb => mozjs_52.8.1.bb}     |  102 +-
 20 files changed, 476 insertions(+), 5671 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0002-fix-cannot-find-link.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0003-workaround-autoconf-2.13-detection-failed.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs_17.0.0.bb => mozjs_52.8.1.bb} (36%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
deleted file mode 100644
index 40d646c..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f36c9476d2816e0d3e61c9e13c22ed73883cb54a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 Apr 2017 12:13:43 -0700
-Subject: [PATCH] compare the first character of string to be null or not
-
-Fixes
-
-error: ISO C++ forbids comparison between pointer and integer [-fpermissive]
-|          if (value[0] == '\0')
-|                          ^~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- js/src/shell/jsoptparse.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/src/shell/jsoptparse.cpp b/js/src/shell/jsoptparse.cpp
-index b49d0a5..612aa00 100644
---- a/js/src/shell/jsoptparse.cpp
-+++ b/js/src/shell/jsoptparse.cpp
-@@ -243,7 +243,7 @@ OptionParser::extractValue(size_t argc, char **argv, size_t *i, char **value)
-     char *eq = strchr(argv[*i], '=');
-     if (eq) {
-         *value = eq + 1;
--        if (value[0] == '\0')
-+        if (value[0][0] == '\0')
-             return error("A value is required for option %.*s", eq - argv[*i], argv[*i]);
-         return Okay;
-     }
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
new file mode 100644
index 0000000..ba317bc
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
@@ -0,0 +1,91 @@
+From 5028d1cd669c179ed49061316d04c8e8862a5bd8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Jul 2018 15:04:47 +0800
+Subject: [PATCH 1/5] do not create python environment
+
+Use oe's python environment rather than create one of host
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/moz.configure/init.configure | 18 ------------------
+ configure.py                       | 10 +++++++++-
+ js/src/old-configure               |  4 ++--
+ 3 files changed, 11 insertions(+), 21 deletions(-)
+
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
+index 2123beb..6fe6591 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -179,24 +179,6 @@ def virtualenv_python(env_python, build_env, mozconfig, help):
+     else:
+         python = sys.executable
+ 
+-    if not manager.up_to_date(python):
+-        log.info('Creating Python environment')
+-        manager.build(python)
+-
+-    python = normsep(manager.python_path)
+-
+-    if python != normsep(sys.executable):
+-        log.info('Reexecuting in the virtualenv')
+-        if env_python:
+-            del os.environ['PYTHON']
+-        # One would prefer to use os.execl, but that's completely borked on
+-        # Windows.
+-        sys.exit(subprocess.call([python] + sys.argv))
+-
+-    # We are now in the virtualenv
+-    if not distutils.sysconfig.get_python_lib():
+-        die('Could not determine python site packages directory')
+-
+     return python
+ 
+ set_config('PYTHON', virtualenv_python)
+diff --git a/configure.py b/configure.py
+index f7392d0..45323a5 100644
+--- a/configure.py
++++ b/configure.py
+@@ -12,7 +12,15 @@ import textwrap
+ 
+ 
+ base_dir = os.path.abspath(os.path.dirname(__file__))
+-sys.path.insert(0, os.path.join(base_dir, 'python', 'mozbuild'))
++sys.path.insert(0, os.path.join(base_dir, 'config'))
++def get_immediate_subdirectories(a_dir):
++    return [name for name in os.listdir(a_dir)
++            if os.path.isdir(os.path.join(a_dir, name))]
++for s in ["python", "testing/mozbase"]:
++    sub_dir = os.path.join(base_dir, s)
++    for module_dir in get_immediate_subdirectories(sub_dir):
++        sys.path.insert(0, os.path.join(sub_dir, module_dir))
++
+ from mozbuild.configure import ConfigureSandbox
+ from mozbuild.util import (
+     indented_repr,
+diff --git a/js/src/old-configure b/js/src/old-configure
+index ee4527b..75b00e1 100644
+--- a/js/src/old-configure
++++ b/js/src/old-configure
+@@ -10512,7 +10512,7 @@ if test "$MOZ_BUILD_APP" != js -o -n "$JS_STANDALONE"; then
+     ;;
+   esac
+ 
+-  eval $dumpenv $PYTHON $_topsrcdir/build/subconfigure.py --prepare "$srcdir" "$moz_config_dir" "$_CONFIG_SHELL" $ac_configure_args 
++  eval $dumpenv PYTHONPATH=$_topsrcdir/python/mozbuild/ $PYTHON $_topsrcdir/build/subconfigure.py --prepare "$srcdir" "$moz_config_dir" "$_CONFIG_SHELL" $ac_configure_args
+ 
+   done
+ 
+@@ -10931,7 +10931,7 @@ if test "$JS_STANDALONE"; then
+   
+ if test "$no_recursion" != yes; then
+   trap '' EXIT
+-  if ! $PYTHON $_topsrcdir/build/subconfigure.py --list subconfigures --skip skip_subconfigures; then
++  if ! PYTHONPATH=$_topsrcdir/python/mozbuild/ $PYTHON $_topsrcdir/build/subconfigure.py --list subconfigures --skip skip_subconfigures; then
+       exit 1
+   fi
+ fi
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
index bc141d9..c111ea5 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
@@ -3,33 +3,31 @@ From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 6 Jun 2013 18:36:01 +0200
 Subject: [PATCH] js.pc.in: do not include RequiredDefines.h for depending
  packages
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 in our cross environment the would fail with:
 
 | cc1: fatal error: /usr/include/js-17.0/js/RequiredDefines.h: No such file or directory
 
 and currently it only defines __STDC_LIMIT_MACROS
-
 Upstream-Status: Inappropriate [embedded specific]
-
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+Rebase to 52.8.1
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- js.pc.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ js/src/js.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/js.pc.in b/js.pc.in
-index 13d761d..a95a7bd 100644
---- a/js.pc.in
-+++ b/js.pc.in
+diff --git a/js/src/js.pc.in b/js/src/js.pc.in
+index 2eae393..c2dea62 100644
+--- a/js/src/js.pc.in
++++ b/js/src/js.pc.in
 @@ -8,4 +8,4 @@ Description: The Mozilla library for JavaScript
  Version: @MOZILLA_VERSION@
- Requires.private: @NSPR_PKGCONF_CHECK@
- Libs: -L${libdir} -l@LIBRARY_NAME@
--Cflags: -include ${includedir}/@MODULE@/js/RequiredDefines.h -I${includedir}/@MODULE@
-+Cflags: -I${includedir}/@MODULE@
+ @PKGCONF_REQUIRES_PRIVATE@
+ Libs: -L${libdir} -l@JS_LIBRARY_NAME@
+-Cflags: -include ${includedir}/@JS_LIBRARY_NAME@/js/RequiredDefines.h -I${includedir}/@JS_LIBRARY_NAME@
++Cflags: -I${includedir}/@JS_LIBRARY_NAME@
 -- 
-1.7.6.5
+2.7.4
 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
deleted file mode 100644
index de72d4f..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From da3929a96d9c74e11bf37d128890e18fcb745365 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Mon, 26 Jan 2015 08:53:19 +0900
-Subject: [PATCH] mozjs17.0.0: fix the compile bug of powerpc
-
-To fix the bug as following
-
-error: cannot convert '__va_list_tag**' to '__va_list_tag (*)[1]' for
-argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const char**,
-JSBool, jsval**, __va_list_tag (*)[1])'
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- jscpucfg.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/jscpucfg.h b/jscpucfg.h
-index dfb1c14..8683491 100644
---- a/jscpucfg.h
-+++ b/jscpucfg.h
-@@ -47,6 +47,12 @@
- #elif defined(JS_HAVE_ENDIAN_H)
- # include <endian.h>
- 
-+#if defined(_POWER) || defined(__powerpc__) || \
-+    defined(__ppc__)
-+# define HAVE_VA_LIST_AS_ARRAY 1
-+# endif
-+
-+
- # if defined(__BYTE_ORDER)
- #  if __BYTE_ORDER == __LITTLE_ENDIAN
- #   define IS_LITTLE_ENDIAN 1
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch
deleted file mode 100644
index fa413ea..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch
+++ /dev/null
@@ -1,3238 +0,0 @@
-From 6440b4901c6f4bcc69686ff10806e311cc5a927b Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Tue, 3 Mar 2015 19:12:17 +0800
-Subject: [PATCH] regenerate configure with autoconf-2.13
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-status: Inappropriate [generated file]
-
----
- js/src/configure | 838 ++++++++++++++++++++++++++-----------------------------
- 1 file changed, 389 insertions(+), 449 deletions(-)
-
-diff --git a/js/src/configure b/js/src/configure
-index cb6b41b..b05298f 100755
---- a/js/src/configure
-+++ b/js/src/configure
-@@ -5757,6 +5757,10 @@ arm*)
-     CPU_ARCH=arm
-     ;;
- 
-+aarch64*)
-+    CPU_ARCH=aarch64
-+    ;;
-+
- mips|mipsel)
-     CPU_ARCH="mips"
-     ;;
-@@ -5893,14 +5897,14 @@ no)
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$arch_flag"
-     cat > conftest.$ac_ext <<EOF
--#line 5897 "configure"
-+#line 5901 "configure"
- #include "confdefs.h"
- 
- int main() {
- return sizeof(__thumb2__);
- ; return 0; }
- EOF
--if { (eval echo configure:5904: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:5908: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   MOZ_THUMB2=1
- else
-@@ -5972,16 +5976,16 @@ if test -n "$all_flags"; then
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$all_flags"
-     echo $ac_n "checking whether the chosen combination of compiler flags ($all_flags) works""... $ac_c" 1>&6
--echo "configure:5976: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
-+echo "configure:5980: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
-     cat > conftest.$ac_ext <<EOF
--#line 5978 "configure"
-+#line 5982 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:5985: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:5989: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   echo "$ac_t""yes" 1>&6
- else
-@@ -6004,18 +6008,18 @@ fi
- 
- if test "$CPU_ARCH" = "arm"; then
-   echo $ac_n "checking for ARM SIMD support in compiler""... $ac_c" 1>&6
--echo "configure:6008: checking for ARM SIMD support in compiler" >&5
-+echo "configure:6012: checking for ARM SIMD support in compiler" >&5
-   # We try to link so that this also fails when
-   # building with LTO.
-   cat > conftest.$ac_ext <<EOF
--#line 6012 "configure"
-+#line 6016 "configure"
- #include "confdefs.h"
- 
- int main() {
- asm("uqadd8 r1, r1, r2");
- ; return 0; }
- EOF
--if { (eval echo configure:6019: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:6023: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   result="yes"
- else
-@@ -6038,18 +6042,18 @@ EOF
-   fi
- 
-   echo $ac_n "checking for ARM NEON support in compiler""... $ac_c" 1>&6
--echo "configure:6042: checking for ARM NEON support in compiler" >&5
-+echo "configure:6046: checking for ARM NEON support in compiler" >&5
-   # We try to link so that this also fails when
-   # building with LTO.
-   cat > conftest.$ac_ext <<EOF
--#line 6046 "configure"
-+#line 6050 "configure"
- #include "confdefs.h"
- 
- int main() {
- asm(".fpu neon\n vadd.i8 d0, d0, d0");
- ; return 0; }
- EOF
--if { (eval echo configure:6053: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:6057: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   result="yes"
- else
-@@ -6094,7 +6098,7 @@ configure_static_assert_macros='
- '
- 
- echo $ac_n "checking that static assertion macros used in autoconf tests work""... $ac_c" 1>&6
--echo "configure:6098: checking that static assertion macros used in autoconf tests work" >&5
-+echo "configure:6102: checking that static assertion macros used in autoconf tests work" >&5
- if eval "test \"`echo '$''{'ac_cv_static_assertion_macros_work'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6108,14 +6112,14 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
-   ac_cv_static_assertion_macros_work="yes"
-   cat > conftest.$ac_ext <<EOF
--#line 6112 "configure"
-+#line 6116 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(1)
- ; return 0; }
- EOF
--if { (eval echo configure:6119: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6123: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -6125,14 +6129,14 @@ else
- fi
- rm -f conftest*
-   cat > conftest.$ac_ext <<EOF
--#line 6129 "configure"
-+#line 6133 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(0)
- ; return 0; }
- EOF
--if { (eval echo configure:6136: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6140: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_static_assertion_macros_work="no"
- else
-@@ -6148,14 +6152,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-   cat > conftest.$ac_ext <<EOF
--#line 6152 "configure"
-+#line 6156 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(1)
- ; return 0; }
- EOF
--if { (eval echo configure:6159: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6163: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -6165,14 +6169,14 @@ else
- fi
- rm -f conftest*
-   cat > conftest.$ac_ext <<EOF
--#line 6169 "configure"
-+#line 6173 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(0)
- ; return 0; }
- EOF
--if { (eval echo configure:6176: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6180: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_static_assertion_macros_work="no"
- else
-@@ -6317,7 +6321,7 @@ if test "$GNU_CC"; then
-     _WARNINGS_CFLAGS="${_WARNINGS_CFLAGS} -Wall -Wpointer-arith -Wdeclaration-after-statement"
-     
-     echo $ac_n "checking whether the C compiler supports -Werror=return-type""... $ac_c" 1>&6
--echo "configure:6321: checking whether the C compiler supports -Werror=return-type" >&5
-+echo "configure:6325: checking whether the C compiler supports -Werror=return-type" >&5
- if eval "test \"`echo '$''{'ac_c_has_werror_return_type'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6333,14 +6337,14 @@ cross_compiling=$ac_cv_prog_cc_cross
-             _SAVE_CFLAGS="$CFLAGS"
-             CFLAGS="$CFLAGS -Werror -Werror=return-type"
-             cat > conftest.$ac_ext <<EOF
--#line 6337 "configure"
-+#line 6341 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6344: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6348: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_c_has_werror_return_type="yes"
- else
-@@ -6368,7 +6372,7 @@ echo "$ac_t""$ac_c_has_werror_return_type" 1>&6
- 
-     
-     echo $ac_n "checking whether the C compiler supports -Wtype-limits""... $ac_c" 1>&6
--echo "configure:6372: checking whether the C compiler supports -Wtype-limits" >&5
-+echo "configure:6376: checking whether the C compiler supports -Wtype-limits" >&5
- if eval "test \"`echo '$''{'ac_c_has_wtype_limits'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6384,14 +6388,14 @@ cross_compiling=$ac_cv_prog_cc_cross
-             _SAVE_CFLAGS="$CFLAGS"
-             CFLAGS="$CFLAGS -Werror -Wtype-limits"
-             cat > conftest.$ac_ext <<EOF
--#line 6388 "configure"
-+#line 6392 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6395: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6399: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_c_has_wtype_limits="yes"
- else
-@@ -6419,7 +6423,7 @@ echo "$ac_t""$ac_c_has_wtype_limits" 1>&6
- 
-     
-     echo $ac_n "checking whether the C compiler supports -Wempty-body""... $ac_c" 1>&6
--echo "configure:6423: checking whether the C compiler supports -Wempty-body" >&5
-+echo "configure:6427: checking whether the C compiler supports -Wempty-body" >&5
- if eval "test \"`echo '$''{'ac_c_has_wempty_body'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6435,14 +6439,14 @@ cross_compiling=$ac_cv_prog_cc_cross
-             _SAVE_CFLAGS="$CFLAGS"
-             CFLAGS="$CFLAGS -Werror -Wempty-body"
-             cat > conftest.$ac_ext <<EOF
--#line 6439 "configure"
-+#line 6443 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6446: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6450: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_c_has_wempty_body="yes"
- else
-@@ -6476,7 +6480,7 @@ echo "$ac_t""$ac_c_has_wempty_body" 1>&6
-     _WARNINGS_CFLAGS="${_WARNINGS_CFLAGS} -Wno-unused"
-     
-     echo $ac_n "checking whether the C compiler supports -Wno-overlength-strings""... $ac_c" 1>&6
--echo "configure:6480: checking whether the C compiler supports -Wno-overlength-strings" >&5
-+echo "configure:6484: checking whether the C compiler supports -Wno-overlength-strings" >&5
- if eval "test \"`echo '$''{'ac_c_has_wno_overlength_strings'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6492,14 +6496,14 @@ cross_compiling=$ac_cv_prog_cc_cross
-             _SAVE_CFLAGS="$CFLAGS"
-             CFLAGS="$CFLAGS -Werror -Woverlength-strings"
-             cat > conftest.$ac_ext <<EOF
--#line 6496 "configure"
-+#line 6500 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6503: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6507: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_c_has_wno_overlength_strings="yes"
- else
-@@ -6580,7 +6584,7 @@ if test "$GNU_CXX"; then
-     _WARNINGS_CXXFLAGS="${_WARNINGS_CXXFLAGS} -Wall -Wpointer-arith -Woverloaded-virtual"
-     
-     echo $ac_n "checking whether the C++ compiler supports -Werror=return-type""... $ac_c" 1>&6
--echo "configure:6584: checking whether the C++ compiler supports -Werror=return-type" >&5
-+echo "configure:6588: checking whether the C++ compiler supports -Werror=return-type" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_werror_return_type'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6596,14 +6600,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Werror=return-type"
-             cat > conftest.$ac_ext <<EOF
--#line 6600 "configure"
-+#line 6604 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6607: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6611: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_werror_return_type="yes"
- else
-@@ -6631,7 +6635,7 @@ echo "$ac_t""$ac_cxx_has_werror_return_type" 1>&6
- 
-     
-     echo $ac_n "checking whether the C++ compiler supports -Wtype-limits""... $ac_c" 1>&6
--echo "configure:6635: checking whether the C++ compiler supports -Wtype-limits" >&5
-+echo "configure:6639: checking whether the C++ compiler supports -Wtype-limits" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_wtype_limits'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6647,14 +6651,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Wtype-limits"
-             cat > conftest.$ac_ext <<EOF
--#line 6651 "configure"
-+#line 6655 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6658: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6662: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_wtype_limits="yes"
- else
-@@ -6682,7 +6686,7 @@ echo "$ac_t""$ac_cxx_has_wtype_limits" 1>&6
- 
-     
-     echo $ac_n "checking whether the C++ compiler supports -Wempty-body""... $ac_c" 1>&6
--echo "configure:6686: checking whether the C++ compiler supports -Wempty-body" >&5
-+echo "configure:6690: checking whether the C++ compiler supports -Wempty-body" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_wempty_body'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6698,14 +6702,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Wempty-body"
-             cat > conftest.$ac_ext <<EOF
--#line 6702 "configure"
-+#line 6706 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6709: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6713: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_wempty_body="yes"
- else
-@@ -6741,7 +6745,7 @@ echo "$ac_t""$ac_cxx_has_wempty_body" 1>&6
-     _WARNINGS_CXXFLAGS="${_WARNINGS_CXXFLAGS} -Wno-ctor-dtor-privacy"
-     
-     echo $ac_n "checking whether the C++ compiler supports -Wno-overlength-strings""... $ac_c" 1>&6
--echo "configure:6745: checking whether the C++ compiler supports -Wno-overlength-strings" >&5
-+echo "configure:6749: checking whether the C++ compiler supports -Wno-overlength-strings" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_wno_overlength_strings'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6757,14 +6761,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Woverlength-strings"
-             cat > conftest.$ac_ext <<EOF
--#line 6761 "configure"
-+#line 6765 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6768: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6772: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_wno_overlength_strings="yes"
- else
-@@ -6792,7 +6796,7 @@ echo "$ac_t""$ac_cxx_has_wno_overlength_strings" 1>&6
- 
-     
-     echo $ac_n "checking whether the C++ compiler supports -Wno-invalid-offsetof""... $ac_c" 1>&6
--echo "configure:6796: checking whether the C++ compiler supports -Wno-invalid-offsetof" >&5
-+echo "configure:6800: checking whether the C++ compiler supports -Wno-invalid-offsetof" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_wno_invalid_offsetof'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6808,14 +6812,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Winvalid-offsetof"
-             cat > conftest.$ac_ext <<EOF
--#line 6812 "configure"
-+#line 6816 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6819: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6823: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_wno_invalid_offsetof="yes"
- else
-@@ -6843,7 +6847,7 @@ echo "$ac_t""$ac_cxx_has_wno_invalid_offsetof" 1>&6
- 
-     
-     echo $ac_n "checking whether the C++ compiler supports -Wno-variadic-macros""... $ac_c" 1>&6
--echo "configure:6847: checking whether the C++ compiler supports -Wno-variadic-macros" >&5
-+echo "configure:6851: checking whether the C++ compiler supports -Wno-variadic-macros" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_wno_variadic_macros'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6859,14 +6863,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Wvariadic-macros"
-             cat > conftest.$ac_ext <<EOF
--#line 6863 "configure"
-+#line 6867 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6870: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6874: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_wno_variadic_macros="yes"
- else
-@@ -6918,7 +6922,7 @@ echo "$ac_t""$ac_cxx_has_wno_variadic_macros" 1>&6
-         _WARNINGS_CXXFLAGS="${_WARNINGS_CXXFLAGS} -Wno-c++0x-extensions"
-         
-     echo $ac_n "checking whether the C++ compiler supports -Wno-extended-offsetof""... $ac_c" 1>&6
--echo "configure:6922: checking whether the C++ compiler supports -Wno-extended-offsetof" >&5
-+echo "configure:6926: checking whether the C++ compiler supports -Wno-extended-offsetof" >&5
- if eval "test \"`echo '$''{'ac_cxx_has_wno_extended_offsetof'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6934,14 +6938,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror -Wextended-offsetof"
-             cat > conftest.$ac_ext <<EOF
--#line 6938 "configure"
-+#line 6942 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6945: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6949: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cxx_has_wno_extended_offsetof="yes"
- else
-@@ -6979,7 +6983,7 @@ MKSHLIB_UNFORCE_ALL=
- if test "$COMPILE_ENVIRONMENT"; then
- if test "$GNU_CC"; then
-   echo $ac_n "checking whether ld has archive extraction flags""... $ac_c" 1>&6
--echo "configure:6983: checking whether ld has archive extraction flags" >&5
-+echo "configure:6987: checking whether ld has archive extraction flags" >&5
-   if eval "test \"`echo '$''{'ac_cv_mkshlib_force_and_unforce'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6996,14 +7000,14 @@ LOOP_INPUT
-       LDFLAGS=$force
-       LIBS=$unforce
-       cat > conftest.$ac_ext <<EOF
--#line 7000 "configure"
-+#line 7004 "configure"
- #include "confdefs.h"
- 
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:7007: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:7011: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_mkshlib_force_and_unforce=$line; break
- else
-@@ -7038,16 +7042,16 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
- cross_compiling=$ac_cv_prog_cc_cross
- 
- echo $ac_n "checking for 64-bit OS""... $ac_c" 1>&6
--echo "configure:7042: checking for 64-bit OS" >&5
-+echo "configure:7046: checking for 64-bit OS" >&5
- cat > conftest.$ac_ext <<EOF
--#line 7044 "configure"
-+#line 7048 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(sizeof(void*) == 8)
- ; return 0; }
- EOF
--if { (eval echo configure:7051: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7055: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   result="yes"
- else
-@@ -7170,7 +7174,7 @@ case "$host" in
- esac
- 
- echo $ac_n "checking for Python version >= $PYTHON_VERSION but not 3.x""... $ac_c" 1>&6
--echo "configure:7174: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
-+echo "configure:7178: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
- 
- $PYTHON -c "import sys; sys.exit(sys.version[:3] < sys.argv[1] or sys.version[:2] != '2.')" $PYTHON_VERSION
- _python_res=$?
-@@ -7181,7 +7185,7 @@ fi
- echo "$ac_t""yes" 1>&6
- 
- echo $ac_n "checking for custom <stdint.h> implementation""... $ac_c" 1>&6
--echo "configure:7185: checking for custom <stdint.h> implementation" >&5
-+echo "configure:7189: checking for custom <stdint.h> implementation" >&5
- if test "$MOZ_CUSTOM_STDINT_H"; then
-   cat >> confdefs.pytmp <<EOF
-         (''' MOZ_CUSTOM_STDINT_H ''', r''' "$MOZ_CUSTOM_STDINT_H" ''')
-@@ -7249,9 +7253,9 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-             echo $ac_n "checking for IBM XLC/C++ compiler version >= 9.0.0.7""... $ac_c" 1>&6
--echo "configure:7253: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
-+echo "configure:7257: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
-             cat > conftest.$ac_ext <<EOF
--#line 7255 "configure"
-+#line 7259 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -7260,7 +7264,7 @@ int main() {
-                  #endif
- ; return 0; }
- EOF
--if { (eval echo configure:7264: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7268: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _BAD_COMPILER=
- else
-@@ -7298,12 +7302,12 @@ cross_compiling=$ac_cv_prog_cc_cross
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:7302: checking for $ac_hdr" >&5
-+echo "configure:7306: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 7307 "configure"
-+#line 7311 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -7311,7 +7315,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:7315: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7319: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -7394,17 +7398,17 @@ EOF
-     # builds.
-     _SAVE_LDFLAGS=$LDFLAGS
-      echo $ac_n "checking for -framework ExceptionHandling""... $ac_c" 1>&6
--echo "configure:7398: checking for -framework ExceptionHandling" >&5
-+echo "configure:7402: checking for -framework ExceptionHandling" >&5
-     LDFLAGS="$LDFLAGS -framework ExceptionHandling"
-     cat > conftest.$ac_ext <<EOF
--#line 7401 "configure"
-+#line 7405 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:7408: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:7412: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_framework_exceptionhandling="yes"
- else
-@@ -7426,18 +7430,18 @@ rm -f conftest*
-         echo "Skipping -dead_strip because DTrace is enabled. See bug 403132."
-     else
-                 echo $ac_n "checking for -dead_strip option to ld""... $ac_c" 1>&6
--echo "configure:7430: checking for -dead_strip option to ld" >&5
-+echo "configure:7434: checking for -dead_strip option to ld" >&5
-         _SAVE_LDFLAGS=$LDFLAGS
-         LDFLAGS="$LDFLAGS -Wl,-dead_strip"
-         cat > conftest.$ac_ext <<EOF
--#line 7434 "configure"
-+#line 7438 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:7441: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:7445: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   _HAVE_DEAD_STRIP=1
- else
-@@ -7783,12 +7787,12 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:7787: checking for $ac_hdr" >&5
-+echo "configure:7791: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 7792 "configure"
-+#line 7796 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -7796,7 +7800,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:7800: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7804: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -7989,19 +7993,19 @@ EOF
-     _DEFINES_CXXFLAGS="$_DEFINES_CXXFLAGS -Uunix -U__unix -U__unix__"
- 
-     echo $ac_n "checking for __declspec(dllexport)""... $ac_c" 1>&6
--echo "configure:7993: checking for __declspec(dllexport)" >&5
-+echo "configure:7997: checking for __declspec(dllexport)" >&5
- if eval "test \"`echo '$''{'ac_os2_declspec'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 7998 "configure"
-+#line 8002 "configure"
- #include "confdefs.h"
- __declspec(dllexport) void ac_os2_declspec(void) {}
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8005: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8009: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_os2_declspec="yes"
- else
-@@ -8054,14 +8058,14 @@ EOF
-            _SAVE_LDFLAGS=$LDFLAGS
-            LDFLAGS="-M /usr/lib/ld/map.noexstk $LDFLAGS"
-            cat > conftest.$ac_ext <<EOF
--#line 8058 "configure"
-+#line 8062 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:8065: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:8069: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -8089,7 +8093,7 @@ rm -f conftest*
-        CC_VERSION=`$CC -V 2>&1 | grep '^cc:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
-        CXX_VERSION=`$CXX -V 2>&1 | grep '^CC:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
-        echo $ac_n "checking for Sun C++ compiler version >= 5.9""... $ac_c" 1>&6
--echo "configure:8093: checking for Sun C++ compiler version >= 5.9" >&5
-+echo "configure:8097: checking for Sun C++ compiler version >= 5.9" >&5
-        
-        ac_ext=C
- # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -8099,7 +8103,7 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-        cat > conftest.$ac_ext <<EOF
--#line 8103 "configure"
-+#line 8107 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -8108,7 +8112,7 @@ int main() {
-            #endif
- ; return 0; }
- EOF
--if { (eval echo configure:8112: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8116: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _BAD_COMPILER=
- else
-@@ -8125,7 +8129,7 @@ rm -f conftest*
-            _res="yes"
-        fi
-        cat > conftest.$ac_ext <<EOF
--#line 8129 "configure"
-+#line 8133 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -8134,7 +8138,7 @@ int main() {
-            #endif
- ; return 0; }
- EOF
--if { (eval echo configure:8138: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8142: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _ABOVE_SS12U1=
- else
-@@ -8535,7 +8539,7 @@ fi
- 
- if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -z "$MOZ_DISABLE_ICF"; then
-     echo $ac_n "checking whether the linker supports Identical Code Folding""... $ac_c" 1>&6
--echo "configure:8539: checking whether the linker supports Identical Code Folding" >&5
-+echo "configure:8543: checking whether the linker supports Identical Code Folding" >&5
- if eval "test \"`echo '$''{'LD_SUPPORTS_ICF'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -8544,7 +8548,7 @@ else
-               'int main() {return foo() - bar();}' > conftest.${ac_ext}
-         # If the linker supports ICF, foo and bar symbols will have
-         # the same address
--        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:8548: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:8552: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-            test -s conftest${ac_exeext} &&
-            objdump -t conftest${ac_exeext} | awk '{a[$6] = $1} END {if (a["foo"] && (a["foo"] != a["bar"])) { exit 1 }}'; then
-             LD_SUPPORTS_ICF=yes
-@@ -8559,14 +8563,14 @@ echo "$ac_t""$LD_SUPPORTS_ICF" 1>&6
-         _SAVE_LDFLAGS="$LDFLAGS -Wl,--icf=safe"
-         LDFLAGS="$LDFLAGS -Wl,--icf=safe -Wl,--print-icf-sections"
-         cat > conftest.$ac_ext <<EOF
--#line 8563 "configure"
-+#line 8567 "configure"
- #include "confdefs.h"
- 
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:8570: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:8574: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   LD_PRINT_ICF_SECTIONS=-Wl,--print-icf-sections
- else
-@@ -8584,15 +8588,15 @@ fi
- 
- if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -n "$MOZ_DEBUG_FLAGS"; then
-       echo $ac_n "checking whether removing dead symbols breaks debugging""... $ac_c" 1>&6
--echo "configure:8588: checking whether removing dead symbols breaks debugging" >&5
-+echo "configure:8592: checking whether removing dead symbols breaks debugging" >&5
- if eval "test \"`echo '$''{'GC_SECTIONS_BREAKS_DEBUG_RANGES'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   echo 'int foo() {return 42;}' \
-              'int bar() {return 1;}' \
-              'int main() {return foo();}' > conftest.${ac_ext}
--        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -c conftest.${ac_ext} 1>&2'; { (eval echo configure:8595: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
--           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:8596: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -c conftest.${ac_ext} 1>&2'; { (eval echo configure:8599: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:8600: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-            test -s conftest${ac_exeext} -a -s conftest.${ac_objext}; then
-             if test "`$PYTHON "$_topsrcdir"/build/autoconf/check_debug_ranges.py conftest.${ac_objext} conftest.${ac_ext}`" = \
-                     "`$PYTHON "$_topsrcdir"/build/autoconf/check_debug_ranges.py conftest${ac_exeext} conftest.${ac_ext}`"; then
-@@ -8615,12 +8619,12 @@ fi
- 
- if test -z "$SKIP_COMPILER_CHECKS"; then
- echo $ac_n "checking for ANSI C header files""... $ac_c" 1>&6
--echo "configure:8619: checking for ANSI C header files" >&5
-+echo "configure:8623: checking for ANSI C header files" >&5
- if eval "test \"`echo '$''{'ac_cv_header_stdc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8624 "configure"
-+#line 8628 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- #include <stdarg.h>
-@@ -8628,7 +8632,7 @@ else
- #include <float.h>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:8632: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:8636: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -8645,7 +8649,7 @@ rm -f conftest*
- if test $ac_cv_header_stdc = yes; then
-   # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
- cat > conftest.$ac_ext <<EOF
--#line 8649 "configure"
-+#line 8653 "configure"
- #include "confdefs.h"
- #include <string.h>
- EOF
-@@ -8663,7 +8667,7 @@ fi
- if test $ac_cv_header_stdc = yes; then
-   # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
- cat > conftest.$ac_ext <<EOF
--#line 8667 "configure"
-+#line 8671 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- EOF
-@@ -8684,7 +8688,7 @@ if test "$cross_compiling" = yes; then
-   :
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8688 "configure"
-+#line 8692 "configure"
- #include "confdefs.h"
- #include <ctype.h>
- #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
-@@ -8695,7 +8699,7 @@ if (XOR (islower (i), ISLOWER (i)) || toupper (i) != TOUPPER (i)) exit(2);
- exit (0); }
- 
- EOF
--if { (eval echo configure:8699: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:8703: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   :
- else
-@@ -8722,12 +8726,12 @@ EOF
- fi
- 
- echo $ac_n "checking for working const""... $ac_c" 1>&6
--echo "configure:8726: checking for working const" >&5
-+echo "configure:8730: checking for working const" >&5
- if eval "test \"`echo '$''{'ac_cv_c_const'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8731 "configure"
-+#line 8735 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -8776,7 +8780,7 @@ ccp = (char const *const *) p;
- 
- ; return 0; }
- EOF
--if { (eval echo configure:8780: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8784: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_c_const=yes
- else
-@@ -8800,12 +8804,12 @@ EOF
- fi
- 
- echo $ac_n "checking for mode_t""... $ac_c" 1>&6
--echo "configure:8804: checking for mode_t" >&5
-+echo "configure:8808: checking for mode_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_mode_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8809 "configure"
-+#line 8813 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8836,12 +8840,12 @@ EOF
- fi
- 
- echo $ac_n "checking for off_t""... $ac_c" 1>&6
--echo "configure:8840: checking for off_t" >&5
-+echo "configure:8844: checking for off_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_off_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8845 "configure"
-+#line 8849 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8872,12 +8876,12 @@ EOF
- fi
- 
- echo $ac_n "checking for pid_t""... $ac_c" 1>&6
--echo "configure:8876: checking for pid_t" >&5
-+echo "configure:8880: checking for pid_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_pid_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8881 "configure"
-+#line 8885 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8908,12 +8912,12 @@ EOF
- fi
- 
- echo $ac_n "checking for size_t""... $ac_c" 1>&6
--echo "configure:8912: checking for size_t" >&5
-+echo "configure:8916: checking for size_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_size_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8917 "configure"
-+#line 8921 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8951,12 +8955,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking for __stdcall""... $ac_c" 1>&6
--echo "configure:8955: checking for __stdcall" >&5
-+echo "configure:8959: checking for __stdcall" >&5
- if eval "test \"`echo '$''{'ac_cv___stdcall'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8960 "configure"
-+#line 8964 "configure"
- #include "confdefs.h"
- template <typename Method> struct foo;
-                   template <> struct foo<void (*)()> {};
-@@ -8965,7 +8969,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:8969: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8973: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv___stdcall=true
- else
-@@ -8997,12 +9001,12 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
- cross_compiling=$ac_cv_prog_cc_cross
- 
- echo $ac_n "checking for ssize_t""... $ac_c" 1>&6
--echo "configure:9001: checking for ssize_t" >&5
-+echo "configure:9005: checking for ssize_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_ssize_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9006 "configure"
-+#line 9010 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -9010,7 +9014,7 @@ int main() {
- ssize_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:9014: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9018: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_type_ssize_t=true
- else
-@@ -9035,12 +9039,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for st_blksize in struct stat""... $ac_c" 1>&6
--echo "configure:9039: checking for st_blksize in struct stat" >&5
-+echo "configure:9043: checking for st_blksize in struct stat" >&5
- if eval "test \"`echo '$''{'ac_cv_struct_st_blksize'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9044 "configure"
-+#line 9048 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -9048,7 +9052,7 @@ int main() {
- struct stat s; s.st_blksize;
- ; return 0; }
- EOF
--if { (eval echo configure:9052: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9056: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_struct_st_blksize=yes
- else
-@@ -9072,12 +9076,12 @@ EOF
- fi
- 
- echo $ac_n "checking for siginfo_t""... $ac_c" 1>&6
--echo "configure:9076: checking for siginfo_t" >&5
-+echo "configure:9080: checking for siginfo_t" >&5
- if eval "test \"`echo '$''{'ac_cv_siginfo_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9081 "configure"
-+#line 9085 "configure"
- #include "confdefs.h"
- #define _POSIX_C_SOURCE 199506L
-                   #include <signal.h>
-@@ -9085,7 +9089,7 @@ int main() {
- siginfo_t* info;
- ; return 0; }
- EOF
--if { (eval echo configure:9089: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9093: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_siginfo_t=true
- else
-@@ -9111,72 +9115,8 @@ else
- fi
- 
- 
--echo $ac_n "checking for the size of void*""... $ac_c" 1>&6
--echo "configure:9116: checking for the size of void*" >&5
--if eval "test \"`echo '$''{'moz_cv_size_of_JS_BYTES_PER_WORD'+set}'`\" = set"; then
--  echo $ac_n "(cached) $ac_c" 1>&6
--else
--  
--  moz_cv_size_of_JS_BYTES_PER_WORD=
--  for size in 4 8; do
--    cat > conftest.$ac_ext <<EOF
--#line 9124 "configure"
--#include "confdefs.h"
--
--int main() {
--
--                     int a[sizeof (void*) == $size ? 1 : -1];
--                     return 0;
--                   
--; return 0; }
--EOF
--if { (eval echo configure:9134: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
--  rm -rf conftest*
--  moz_cv_size_of_JS_BYTES_PER_WORD=$size; break
--else
--  echo "configure: failed program was:" >&5
--  cat conftest.$ac_ext >&5
--fi
--rm -f conftest*
--  done
--  if test ! "$moz_cv_size_of_JS_BYTES_PER_WORD"; then
--    { echo "configure: error: No size found for void*" 1>&2; exit 1; }
--  fi
--
--fi
--
--echo "$ac_t""$moz_cv_size_of_JS_BYTES_PER_WORD" 1>&6
--cat >> confdefs.pytmp <<EOF
--        (''' JS_BYTES_PER_WORD ''', r''' $moz_cv_size_of_JS_BYTES_PER_WORD ''')
--EOF
--cat >> confdefs.h <<EOF
--#define JS_BYTES_PER_WORD $moz_cv_size_of_JS_BYTES_PER_WORD
--EOF
--
--
--if test "$moz_cv_size_of_JS_BYTES_PER_WORD" -eq "4"; then
--  cat >> confdefs.pytmp <<\EOF
--        (''' JS_BITS_PER_WORD_LOG2 ''', r''' 5 ''')
--EOF
--cat >> confdefs.h <<\EOF
--#define JS_BITS_PER_WORD_LOG2 5
--EOF
--
--elif test "$moz_cv_size_of_JS_BYTES_PER_WORD" -eq "8"; then
--  cat >> confdefs.pytmp <<\EOF
--        (''' JS_BITS_PER_WORD_LOG2 ''', r''' 6 ''')
--EOF
--cat >> confdefs.h <<\EOF
--#define JS_BITS_PER_WORD_LOG2 6
--EOF
--
--else
--  { echo "configure: error: Unexpected JS_BYTES_PER_WORD" 1>&2; exit 1; }
--fi
--
--
- echo $ac_n "checking for the alignment of void*""... $ac_c" 1>&6
--echo "configure:9180: checking for the alignment of void*" >&5
-+echo "configure:9120: checking for the alignment of void*" >&5
- if eval "test \"`echo '$''{'moz_cv_align_of_JS_ALIGN_OF_POINTER'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9184,7 +9124,7 @@ else
-   moz_cv_align_of_JS_ALIGN_OF_POINTER=
-   for align in 2 4 8 16; do
-     cat > conftest.$ac_ext <<EOF
--#line 9188 "configure"
-+#line 9128 "configure"
- #include "confdefs.h"
- 
-                      #include <stddef.h>
-@@ -9197,7 +9137,7 @@ int main() {
-                    
- ; return 0; }
- EOF
--if { (eval echo configure:9201: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9141: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   moz_cv_align_of_JS_ALIGN_OF_POINTER=$align; break
- else
-@@ -9223,7 +9163,7 @@ EOF
- 
- 
- echo $ac_n "checking for the size of double""... $ac_c" 1>&6
--echo "configure:9227: checking for the size of double" >&5
-+echo "configure:9167: checking for the size of double" >&5
- if eval "test \"`echo '$''{'moz_cv_size_of_JS_BYTES_PER_DOUBLE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9231,7 +9171,7 @@ else
-   moz_cv_size_of_JS_BYTES_PER_DOUBLE=
-   for size in 6 8 10 12 14; do
-     cat > conftest.$ac_ext <<EOF
--#line 9235 "configure"
-+#line 9175 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -9241,7 +9181,7 @@ int main() {
-                    
- ; return 0; }
- EOF
--if { (eval echo configure:9245: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9185: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   moz_cv_size_of_JS_BYTES_PER_DOUBLE=$size; break
- else
-@@ -9270,12 +9210,12 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9274: checking for $ac_hdr" >&5
-+echo "configure:9214: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9279 "configure"
-+#line 9219 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -9283,7 +9223,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9287: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9227: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9326,12 +9266,12 @@ fi
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9330: checking for $ac_hdr" >&5
-+echo "configure:9270: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9335 "configure"
-+#line 9275 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #include <$ac_hdr>
-@@ -9339,7 +9279,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9343: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9283: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9382,12 +9322,12 @@ fi
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9386: checking for $ac_hdr" >&5
-+echo "configure:9326: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9391 "configure"
-+#line 9331 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -9395,7 +9335,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9399: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9339: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9435,12 +9375,12 @@ EOF
- fi
- 
- echo $ac_n "checking for uint""... $ac_c" 1>&6
--echo "configure:9439: checking for uint" >&5
-+echo "configure:9379: checking for uint" >&5
- if eval "test \"`echo '$''{'ac_cv_uint'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9444 "configure"
-+#line 9384 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -9448,7 +9388,7 @@ int main() {
- uint foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:9452: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9392: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_uint=true
- else
-@@ -9473,12 +9413,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for uint_t""... $ac_c" 1>&6
--echo "configure:9477: checking for uint_t" >&5
-+echo "configure:9417: checking for uint_t" >&5
- if eval "test \"`echo '$''{'ac_cv_uint_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9482 "configure"
-+#line 9422 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -9486,7 +9426,7 @@ int main() {
- uint_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:9490: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9430: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_uint_t=true
- else
-@@ -9520,12 +9460,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
- 
- 
- echo $ac_n "checking for uname.domainname""... $ac_c" 1>&6
--echo "configure:9524: checking for uname.domainname" >&5
-+echo "configure:9464: checking for uname.domainname" >&5
- if eval "test \"`echo '$''{'ac_cv_have_uname_domainname_field'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9529 "configure"
-+#line 9469 "configure"
- #include "confdefs.h"
- #include <sys/utsname.h>
- int main() {
-@@ -9533,7 +9473,7 @@ int main() {
-             (void)uname(res);  if (res != 0) { domain = res->domainname; } 
- ; return 0; }
- EOF
--if { (eval echo configure:9537: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9477: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_uname_domainname_field=true
- else
-@@ -9560,12 +9500,12 @@ else
- fi
- 
- echo $ac_n "checking for uname.__domainname""... $ac_c" 1>&6
--echo "configure:9564: checking for uname.__domainname" >&5
-+echo "configure:9504: checking for uname.__domainname" >&5
- if eval "test \"`echo '$''{'ac_cv_have_uname_us_domainname_field'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9569 "configure"
-+#line 9509 "configure"
- #include "confdefs.h"
- #include <sys/utsname.h>
- int main() {
-@@ -9573,7 +9513,7 @@ int main() {
-             (void)uname(res);  if (res != 0) { domain = res->__domainname; } 
- ; return 0; }
- EOF
--if { (eval echo configure:9577: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9517: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_uname_us_domainname_field=true
- else
-@@ -9609,7 +9549,7 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- if test "$GNU_CC"; then
-   echo $ac_n "checking for visibility(hidden) attribute""... $ac_c" 1>&6
--echo "configure:9613: checking for visibility(hidden) attribute" >&5
-+echo "configure:9553: checking for visibility(hidden) attribute" >&5
- if eval "test \"`echo '$''{'ac_cv_visibility_hidden'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9637,7 +9577,7 @@ EOF
- 
- 
-     echo $ac_n "checking for visibility(default) attribute""... $ac_c" 1>&6
--echo "configure:9641: checking for visibility(default) attribute" >&5
-+echo "configure:9581: checking for visibility(default) attribute" >&5
- if eval "test \"`echo '$''{'ac_cv_visibility_default'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9665,7 +9605,7 @@ EOF
- 
- 
-       echo $ac_n "checking for visibility pragma support""... $ac_c" 1>&6
--echo "configure:9669: checking for visibility pragma support" >&5
-+echo "configure:9609: checking for visibility pragma support" >&5
- if eval "test \"`echo '$''{'ac_cv_visibility_pragma'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9690,7 +9630,7 @@ fi
- echo "$ac_t""$ac_cv_visibility_pragma" 1>&6
-       if test "$ac_cv_visibility_pragma" = "yes"; then
-         echo $ac_n "checking For gcc visibility bug with class-level attributes (GCC bug 26905)""... $ac_c" 1>&6
--echo "configure:9694: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
-+echo "configure:9634: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
- if eval "test \"`echo '$''{'ac_cv_have_visibility_class_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9718,7 +9658,7 @@ fi
- echo "$ac_t""$ac_cv_have_visibility_class_bug" 1>&6
- 
-         echo $ac_n "checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)""... $ac_c" 1>&6
--echo "configure:9722: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
-+echo "configure:9662: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
- if eval "test \"`echo '$''{'ac_cv_have_visibility_builtin_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9770,7 +9710,7 @@ fi         # Sun Studio on Solaris
- if test "$GNU_CC"; then
- 
- echo $ac_n "checking for gcc PR49911""... $ac_c" 1>&6
--echo "configure:9774: checking for gcc PR49911" >&5
-+echo "configure:9714: checking for gcc PR49911" >&5
- ac_have_gcc_pr49911="no"
- 
- ac_ext=C
-@@ -9787,7 +9727,7 @@ if test "$cross_compiling" = yes; then
-   true
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9791 "configure"
-+#line 9731 "configure"
- #include "confdefs.h"
- 
- extern "C" void abort(void);
-@@ -9828,7 +9768,7 @@ int main(void) {
- }
- 
- EOF
--if { (eval echo configure:9832: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:9772: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   true
- else
-@@ -9865,12 +9805,12 @@ for ac_hdr in dirent.h sys/ndir.h sys/dir.h ndir.h
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr that defines DIR""... $ac_c" 1>&6
--echo "configure:9869: checking for $ac_hdr that defines DIR" >&5
-+echo "configure:9809: checking for $ac_hdr that defines DIR" >&5
- if eval "test \"`echo '$''{'ac_cv_header_dirent_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9874 "configure"
-+#line 9814 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #include <$ac_hdr>
-@@ -9878,7 +9818,7 @@ int main() {
- DIR *dirp = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:9882: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9822: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_dirent_$ac_safe=yes"
- else
-@@ -9906,7 +9846,7 @@ done
- # Two versions of opendir et al. are in -ldir and -lx on SCO Xenix.
- if test $ac_header_dirent = dirent.h; then
- echo $ac_n "checking for opendir in -ldir""... $ac_c" 1>&6
--echo "configure:9910: checking for opendir in -ldir" >&5
-+echo "configure:9850: checking for opendir in -ldir" >&5
- ac_lib_var=`echo dir'_'opendir | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -9914,7 +9854,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-ldir  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 9918 "configure"
-+#line 9858 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -9925,7 +9865,7 @@ int main() {
- opendir()
- ; return 0; }
- EOF
--if { (eval echo configure:9929: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:9869: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -9947,7 +9887,7 @@ fi
- 
- else
- echo $ac_n "checking for opendir in -lx""... $ac_c" 1>&6
--echo "configure:9951: checking for opendir in -lx" >&5
-+echo "configure:9891: checking for opendir in -lx" >&5
- ac_lib_var=`echo x'_'opendir | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -9955,7 +9895,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lx  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 9959 "configure"
-+#line 9899 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -9966,7 +9906,7 @@ int main() {
- opendir()
- ; return 0; }
- EOF
--if { (eval echo configure:9970: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:9910: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10000,12 +9940,12 @@ esac
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10004: checking for $ac_hdr" >&5
-+echo "configure:9944: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10009 "configure"
-+#line 9949 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -10013,7 +9953,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10017: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9957: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10048,12 +9988,12 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10052: checking for $ac_hdr" >&5
-+echo "configure:9992: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10057 "configure"
-+#line 9997 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -10061,7 +10001,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10065: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10005: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10095,12 +10035,12 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10099: checking for $ac_hdr" >&5
-+echo "configure:10039: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10104 "configure"
-+#line 10044 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -10108,7 +10048,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10112: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10052: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10141,12 +10081,12 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10145: checking for $ac_hdr" >&5
-+echo "configure:10085: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10150 "configure"
-+#line 10090 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -10154,7 +10094,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10158: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10098: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10188,12 +10128,12 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10192: checking for $ac_hdr" >&5
-+echo "configure:10132: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10197 "configure"
-+#line 10137 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -10201,7 +10141,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10205: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10145: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10241,12 +10181,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
- NEW_H=new.h
-    ac_safe=`echo "new" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for new""... $ac_c" 1>&6
--echo "configure:10245: checking for new" >&5
-+echo "configure:10185: checking for new" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10250 "configure"
-+#line 10190 "configure"
- #include "confdefs.h"
- 
- #include <new>
-@@ -10254,7 +10194,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10258: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10198: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10298,12 +10238,12 @@ fi
- if test "x$enable_dtrace" = "xyes"; then
-      ac_safe=`echo "sys/sdt.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for sys/sdt.h""... $ac_c" 1>&6
--echo "configure:10302: checking for sys/sdt.h" >&5
-+echo "configure:10242: checking for sys/sdt.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10307 "configure"
-+#line 10247 "configure"
- #include "confdefs.h"
- 
- #include <sys/sdt.h>
-@@ -10311,7 +10251,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10315: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10255: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10353,12 +10293,12 @@ case $target in
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10357: checking for $ac_hdr" >&5
-+echo "configure:10297: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10362 "configure"
-+#line 10302 "configure"
- #include "confdefs.h"
- 
- #include <$ac_hdr>
-@@ -10366,7 +10306,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10370: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10310: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10418,12 +10358,12 @@ CFLAGS="$CFLAGS $LINUX_HEADERS_INCLUDES"
- 
-    ac_safe=`echo "linux/perf_event.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for linux/perf_event.h""... $ac_c" 1>&6
--echo "configure:10422: checking for linux/perf_event.h" >&5
-+echo "configure:10362: checking for linux/perf_event.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10427 "configure"
-+#line 10367 "configure"
- #include "confdefs.h"
- 
- #include <linux/perf_event.h>
-@@ -10431,7 +10371,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10435: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10375: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10446,19 +10386,19 @@ fi
-   if eval "test \"`echo '$ac_cv_header_'$ac_safe`\" = yes"; then
-     echo "$ac_t""yes" 1>&6
-     echo $ac_n "checking for perf_event_open system call""... $ac_c" 1>&6
--echo "configure:10450: checking for perf_event_open system call" >&5
-+echo "configure:10390: checking for perf_event_open system call" >&5
- if eval "test \"`echo '$''{'ac_cv_perf_event_open'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 10455 "configure"
-+#line 10395 "configure"
- #include "confdefs.h"
- #include <asm/unistd.h>
- int main() {
- return sizeof(__NR_perf_event_open);
- ; return 0; }
- EOF
--if { (eval echo configure:10462: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10402: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_perf_event_open=yes
- else
-@@ -10494,7 +10434,7 @@ case $target in
- 	;;
- *)
- 	echo $ac_n "checking for gethostbyname_r in -lc_r""... $ac_c" 1>&6
--echo "configure:10498: checking for gethostbyname_r in -lc_r" >&5
-+echo "configure:10438: checking for gethostbyname_r in -lc_r" >&5
- ac_lib_var=`echo c_r'_'gethostbyname_r | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10502,7 +10442,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lc_r  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10506 "configure"
-+#line 10446 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10513,7 +10453,7 @@ int main() {
- gethostbyname_r()
- ; return 0; }
- EOF
--if { (eval echo configure:10517: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10457: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10554,14 +10494,14 @@ case $target in
- *)
-     
- echo $ac_n "checking for library containing dlopen""... $ac_c" 1>&6
--echo "configure:10558: checking for library containing dlopen" >&5
-+echo "configure:10498: checking for library containing dlopen" >&5
- if eval "test \"`echo '$''{'ac_cv_search_dlopen'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   ac_func_search_save_LIBS="$LIBS"
- ac_cv_search_dlopen="no"
- cat > conftest.$ac_ext <<EOF
--#line 10565 "configure"
-+#line 10505 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10572,7 +10512,7 @@ int main() {
- dlopen()
- ; return 0; }
- EOF
--if { (eval echo configure:10576: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10516: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_search_dlopen="none required"
- else
-@@ -10583,7 +10523,7 @@ rm -f conftest*
- test "$ac_cv_search_dlopen" = "no" && for i in dl; do
- LIBS="-l$i  $ac_func_search_save_LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10587 "configure"
-+#line 10527 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10594,7 +10534,7 @@ int main() {
- dlopen()
- ; return 0; }
- EOF
--if { (eval echo configure:10598: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10538: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_search_dlopen="-l$i"
- break
-@@ -10612,12 +10552,12 @@ if test "$ac_cv_search_dlopen" != "no"; then
-   test "$ac_cv_search_dlopen" = "none required" || LIBS="$ac_cv_search_dlopen $LIBS"
-      ac_safe=`echo "dlfcn.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for dlfcn.h""... $ac_c" 1>&6
--echo "configure:10616: checking for dlfcn.h" >&5
-+echo "configure:10556: checking for dlfcn.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10621 "configure"
-+#line 10561 "configure"
- #include "confdefs.h"
- 
- #include <dlfcn.h>
-@@ -10625,7 +10565,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10629: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10569: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10662,12 +10602,12 @@ CFLAGS="$CFLAGS -D_GNU_SOURCE"
- for ac_func in dladdr
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:10666: checking for $ac_func" >&5
-+echo "configure:10606: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 10671 "configure"
-+#line 10611 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -10690,7 +10630,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10694: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10634: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -10724,7 +10664,7 @@ if test ! "$GNU_CXX"; then
-     case $target in
-     *-aix*)
- 	echo $ac_n "checking for demangle in -lC_r""... $ac_c" 1>&6
--echo "configure:10728: checking for demangle in -lC_r" >&5
-+echo "configure:10668: checking for demangle in -lC_r" >&5
- ac_lib_var=`echo C_r'_'demangle | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10732,7 +10672,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lC_r  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10736 "configure"
-+#line 10676 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10743,7 +10683,7 @@ int main() {
- demangle()
- ; return 0; }
- EOF
--if { (eval echo configure:10747: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10687: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10776,7 +10716,7 @@ fi
- 	;;
-      *)
- 	echo $ac_n "checking for demangle in -lC""... $ac_c" 1>&6
--echo "configure:10780: checking for demangle in -lC" >&5
-+echo "configure:10720: checking for demangle in -lC" >&5
- ac_lib_var=`echo C'_'demangle | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10784,7 +10724,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lC  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10788 "configure"
-+#line 10728 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10795,7 +10735,7 @@ int main() {
- demangle()
- ; return 0; }
- EOF
--if { (eval echo configure:10799: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10739: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10834,7 +10774,7 @@ case $target in
-     ;;
- *)
-     echo $ac_n "checking for socket in -lsocket""... $ac_c" 1>&6
--echo "configure:10838: checking for socket in -lsocket" >&5
-+echo "configure:10778: checking for socket in -lsocket" >&5
- ac_lib_var=`echo socket'_'socket | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10842,7 +10782,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lsocket  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10846 "configure"
-+#line 10786 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10853,7 +10793,7 @@ int main() {
- socket()
- ; return 0; }
- EOF
--if { (eval echo configure:10857: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10797: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10892,7 +10832,7 @@ darwin*)
- *)
-     
- echo $ac_n "checking for pthread_create in -lpthreads""... $ac_c" 1>&6
--echo "configure:10896: checking for pthread_create in -lpthreads" >&5
-+echo "configure:10836: checking for pthread_create in -lpthreads" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -10915,7 +10855,7 @@ echo "
-         echo "$ac_t""no" 1>&6
-         
- echo $ac_n "checking for pthread_create in -lpthread""... $ac_c" 1>&6
--echo "configure:10919: checking for pthread_create in -lpthread" >&5
-+echo "configure:10859: checking for pthread_create in -lpthread" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -10938,7 +10878,7 @@ echo "
-         echo "$ac_t""no" 1>&6
-         
- echo $ac_n "checking for pthread_create in -lc_r""... $ac_c" 1>&6
--echo "configure:10942: checking for pthread_create in -lc_r" >&5
-+echo "configure:10882: checking for pthread_create in -lc_r" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -10961,7 +10901,7 @@ echo "
-         echo "$ac_t""no" 1>&6
-         
- echo $ac_n "checking for pthread_create in -lc""... $ac_c" 1>&6
--echo "configure:10965: checking for pthread_create in -lc" >&5
-+echo "configure:10905: checking for pthread_create in -lc" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -11020,7 +10960,7 @@ then
- 				rm -f conftest*
- 	ac_cv_have_dash_pthread=no
- 	echo $ac_n "checking whether ${CC-cc} accepts -pthread""... $ac_c" 1>&6
--echo "configure:11024: checking whether ${CC-cc} accepts -pthread" >&5
-+echo "configure:10964: checking whether ${CC-cc} accepts -pthread" >&5
- 	echo 'int main() { return 0; }' | cat > conftest.c
- 	${CC-cc} -pthread -o conftest conftest.c > conftest.out 2>&1
- 	if test $? -eq 0; then
-@@ -11043,7 +10983,7 @@ echo "configure:11024: checking whether ${CC-cc} accepts -pthread" >&5
- 			    ac_cv_have_dash_pthreads=no
-     if test "$ac_cv_have_dash_pthread" = "no"; then
- 	    echo $ac_n "checking whether ${CC-cc} accepts -pthreads""... $ac_c" 1>&6
--echo "configure:11047: checking whether ${CC-cc} accepts -pthreads" >&5
-+echo "configure:10987: checking whether ${CC-cc} accepts -pthreads" >&5
-     	echo 'int main() { return 0; }' | cat > conftest.c
- 	    ${CC-cc} -pthreads -o conftest conftest.c > conftest.out 2>&1
-     	if test $? -eq 0; then
-@@ -11148,13 +11088,13 @@ fi
- 
- if test $ac_cv_prog_gcc = yes; then
-     echo $ac_n "checking whether ${CC-cc} needs -traditional""... $ac_c" 1>&6
--echo "configure:11152: checking whether ${CC-cc} needs -traditional" >&5
-+echo "configure:11092: checking whether ${CC-cc} needs -traditional" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_gcc_traditional'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-     ac_pattern="Autoconf.*'x'"
-   cat > conftest.$ac_ext <<EOF
--#line 11158 "configure"
-+#line 11098 "configure"
- #include "confdefs.h"
- #include <sgtty.h>
- Autoconf TIOCGETP
-@@ -11172,7 +11112,7 @@ rm -f conftest*
- 
-   if test $ac_cv_prog_gcc_traditional = no; then
-     cat > conftest.$ac_ext <<EOF
--#line 11176 "configure"
-+#line 11116 "configure"
- #include "confdefs.h"
- #include <termio.h>
- Autoconf TCGETA
-@@ -11194,7 +11134,7 @@ echo "$ac_t""$ac_cv_prog_gcc_traditional" 1>&6
- fi
- 
- echo $ac_n "checking for 8-bit clean memcmp""... $ac_c" 1>&6
--echo "configure:11198: checking for 8-bit clean memcmp" >&5
-+echo "configure:11138: checking for 8-bit clean memcmp" >&5
- if eval "test \"`echo '$''{'ac_cv_func_memcmp_clean'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11202,7 +11142,7 @@ else
-   ac_cv_func_memcmp_clean=no
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11206 "configure"
-+#line 11146 "configure"
- #include "confdefs.h"
- 
- main()
-@@ -11212,7 +11152,7 @@ main()
- }
- 
- EOF
--if { (eval echo configure:11216: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11156: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_func_memcmp_clean=yes
- else
-@@ -11234,12 +11174,12 @@ for ac_func in fchmod flockfile getc_unlocked _getc_nolock getpagesize \
-                 stat64 statvfs statvfs64 strerror strtok_r truncate64
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:11238: checking for $ac_func" >&5
-+echo "configure:11178: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11243 "configure"
-+#line 11183 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -11262,7 +11202,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:11266: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11206: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -11291,14 +11231,14 @@ done
- 
- 
- cat > conftest.$ac_ext <<EOF
--#line 11295 "configure"
-+#line 11235 "configure"
- #include "confdefs.h"
- #include <windows.h>
- int main() {
- SYSTEMTIME st;FILETIME ft;SystemTimeToFileTime(&st,&ft);
- ; return 0; }
- EOF
--if { (eval echo configure:11302: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11242: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_systemtimetofiletime="yes"
- else
-@@ -11318,14 +11258,14 @@ EOF
- 
- fi
- cat > conftest.$ac_ext <<EOF
--#line 11322 "configure"
-+#line 11262 "configure"
- #include "confdefs.h"
- #include <windows.h>
- int main() {
- FILETIME ft;GetSystemTimeAsFileTime(&ft);
- ; return 0; }
- EOF
--if { (eval echo configure:11329: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11269: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_getsystemtimeasfiletime="yes"
- else
-@@ -11355,19 +11295,19 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking for wcrtomb""... $ac_c" 1>&6
--echo "configure:11359: checking for wcrtomb" >&5
-+echo "configure:11299: checking for wcrtomb" >&5
- if eval "test \"`echo '$''{'ac_cv_have_wcrtomb'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11364 "configure"
-+#line 11304 "configure"
- #include "confdefs.h"
- #include <wchar.h>
- int main() {
- mbstate_t ps={0};wcrtomb(0,'f',&ps);
- ; return 0; }
- EOF
--if { (eval echo configure:11371: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11311: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_wcrtomb="yes"
- else
-@@ -11390,19 +11330,19 @@ EOF
- 
- fi
- echo $ac_n "checking for mbrtowc""... $ac_c" 1>&6
--echo "configure:11394: checking for mbrtowc" >&5
-+echo "configure:11334: checking for mbrtowc" >&5
- if eval "test \"`echo '$''{'ac_cv_have_mbrtowc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11399 "configure"
-+#line 11339 "configure"
- #include "confdefs.h"
- #include <wchar.h>
- int main() {
- mbstate_t ps={0};mbrtowc(0,0,0,&ps);
- ; return 0; }
- EOF
--if { (eval echo configure:11406: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11346: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_mbrtowc="yes"
- else
-@@ -11434,12 +11374,12 @@ cross_compiling=$ac_cv_prog_cc_cross
- fi
- 
- echo $ac_n "checking for res_ninit()""... $ac_c" 1>&6
--echo "configure:11438: checking for res_ninit()" >&5
-+echo "configure:11378: checking for res_ninit()" >&5
- if eval "test \"`echo '$''{'ac_cv_func_res_ninit'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11443 "configure"
-+#line 11383 "configure"
- #include "confdefs.h"
- 
-         #ifdef linux
-@@ -11451,7 +11391,7 @@ int main() {
- int foo = res_ninit(&_res);
- ; return 0; }
- EOF
--if { (eval echo configure:11455: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11395: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_func_res_ninit=yes
- else
-@@ -11484,12 +11424,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking for gnu_get_libc_version()""... $ac_c" 1>&6
--echo "configure:11488: checking for gnu_get_libc_version()" >&5
-+echo "configure:11428: checking for gnu_get_libc_version()" >&5
- if eval "test \"`echo '$''{'ac_cv_func_gnu_get_libc_version'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11493 "configure"
-+#line 11433 "configure"
- #include "confdefs.h"
- 
-         #ifdef HAVE_GNU_LIBC_VERSION_H
-@@ -11500,7 +11440,7 @@ int main() {
- const char *glibc_version = gnu_get_libc_version();
- ; return 0; }
- EOF
--if { (eval echo configure:11504: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11444: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_func_gnu_get_libc_version=yes
- else
-@@ -11534,7 +11474,7 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- 
- echo $ac_n "checking for an implementation of va_copy()""... $ac_c" 1>&6
--echo "configure:11538: checking for an implementation of va_copy()" >&5
-+echo "configure:11478: checking for an implementation of va_copy()" >&5
- if eval "test \"`echo '$''{'ac_cv_va_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11544,7 +11484,7 @@ else
-     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11548 "configure"
-+#line 11488 "configure"
- #include "confdefs.h"
- 
-         #include <stdarg.h>
-@@ -11558,7 +11498,7 @@ else
-         }
-         int main() { f (0, 42); return 0; }
- EOF
--if { (eval echo configure:11562: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11502: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_va_copy=yes
- else
-@@ -11575,7 +11515,7 @@ fi
- 
- echo "$ac_t""$ac_cv_va_copy" 1>&6
- echo $ac_n "checking for an implementation of __va_copy()""... $ac_c" 1>&6
--echo "configure:11579: checking for an implementation of __va_copy()" >&5
-+echo "configure:11519: checking for an implementation of __va_copy()" >&5
- if eval "test \"`echo '$''{'ac_cv___va_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11585,7 +11525,7 @@ else
-     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11589 "configure"
-+#line 11529 "configure"
- #include "confdefs.h"
- 
-         #include <stdarg.h>
-@@ -11599,7 +11539,7 @@ else
-         }
-         int main() { f (0, 42); return 0; }
- EOF
--if { (eval echo configure:11603: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11543: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv___va_copy=yes
- else
-@@ -11616,7 +11556,7 @@ fi
- 
- echo "$ac_t""$ac_cv___va_copy" 1>&6
- echo $ac_n "checking whether va_lists can be copied by value""... $ac_c" 1>&6
--echo "configure:11620: checking whether va_lists can be copied by value" >&5
-+echo "configure:11560: checking whether va_lists can be copied by value" >&5
- if eval "test \"`echo '$''{'ac_cv_va_val_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11626,7 +11566,7 @@ else
-     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11630 "configure"
-+#line 11570 "configure"
- #include "confdefs.h"
- 
-         #include <stdarg.h>
-@@ -11640,7 +11580,7 @@ else
-         }
-         int main() { f (0, 42); return 0; }
- EOF
--if { (eval echo configure:11644: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11584: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_va_val_copy=yes
- else
-@@ -11710,12 +11650,12 @@ ARM_ABI_PREFIX=
- if test "$GNU_CC"; then
-   if test "$CPU_ARCH" = "arm" ; then
-     echo $ac_n "checking for ARM EABI""... $ac_c" 1>&6
--echo "configure:11714: checking for ARM EABI" >&5
-+echo "configure:11654: checking for ARM EABI" >&5
- if eval "test \"`echo '$''{'ac_cv_gcc_arm_eabi'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11719 "configure"
-+#line 11659 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -11728,7 +11668,7 @@ int main() {
-                         
- ; return 0; }
- EOF
--if { (eval echo configure:11732: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:11672: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_gcc_arm_eabi="yes"
- else
-@@ -11753,12 +11693,12 @@ echo "$ac_t""$ac_cv_gcc_arm_eabi" 1>&6
- fi
- 
- echo $ac_n "checking for modern C++ template specialization syntax support""... $ac_c" 1>&6
--echo "configure:11757: checking for modern C++ template specialization syntax support" >&5
-+echo "configure:11697: checking for modern C++ template specialization syntax support" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_modern_specialize_template_syntax'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11762 "configure"
-+#line 11702 "configure"
- #include "confdefs.h"
- template <class T> struct X { int a; };
-                                class Y {};
-@@ -11768,7 +11708,7 @@ X<int> int_x;
-                                X<Y> y_x;
- ; return 0; }
- EOF
--if { (eval echo configure:11772: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:11712: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cpp_modern_specialize_template_syntax=yes
- else
-@@ -11786,12 +11726,12 @@ if test "$ac_cv_cpp_modern_specialize_template_syntax" = no ; then
- fi
- 
- echo $ac_n "checking whether partial template specialization works""... $ac_c" 1>&6
--echo "configure:11790: checking whether partial template specialization works" >&5
-+echo "configure:11730: checking whether partial template specialization works" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_partial_specialization'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11795 "configure"
-+#line 11735 "configure"
- #include "confdefs.h"
- template <class T> class Foo {};
-                                template <class T> class Foo<T*> {};
-@@ -11799,7 +11739,7 @@ int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:11803: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:11743: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cpp_partial_specialization=yes
- else
-@@ -11823,12 +11763,12 @@ EOF
- fi
- 
- echo $ac_n "checking whether the C++ \"using\" keyword resolves ambiguity""... $ac_c" 1>&6
--echo "configure:11827: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
-+echo "configure:11767: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_ambiguity_resolving_using'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11832 "configure"
-+#line 11772 "configure"
- #include "confdefs.h"
- class X {
-                                  public: int go(const X&) {return 3;}
-@@ -11844,7 +11784,7 @@ int main() {
- X x; Y y; y.jo(x);
- ; return 0; }
- EOF
--if { (eval echo configure:11848: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:11788: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cpp_ambiguity_resolving_using=yes
- else
-@@ -11868,7 +11808,7 @@ EOF
- fi
- 
- echo $ac_n "checking for C++ dynamic_cast to void*""... $ac_c" 1>&6
--echo "configure:11872: checking for C++ dynamic_cast to void*" >&5
-+echo "configure:11812: checking for C++ dynamic_cast to void*" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_dynamic_cast_void_ptr'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11876,7 +11816,7 @@ else
-   ac_cv_cpp_dynamic_cast_void_ptr=no
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11880 "configure"
-+#line 11820 "configure"
- #include "confdefs.h"
- class X { int i; public: virtual ~X() { } };
-                             class Y { int j; public: virtual ~Y() { } };
-@@ -11892,7 +11832,7 @@ class X { int i; public: virtual ~X() { } };
-                                            ((void*)&mdo == dynamic_cast<void*>(suby))));
-                             }
- EOF
--if { (eval echo configure:11896: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11836: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_cpp_dynamic_cast_void_ptr=yes
- else
-@@ -11919,19 +11859,19 @@ fi
- 
- 
- echo $ac_n "checking whether C++ requires implementation of unused virtual methods""... $ac_c" 1>&6
--echo "configure:11923: checking whether C++ requires implementation of unused virtual methods" >&5
-+echo "configure:11863: checking whether C++ requires implementation of unused virtual methods" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_unused_required'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11928 "configure"
-+#line 11868 "configure"
- #include "confdefs.h"
- class X {private: virtual void never_called();};
- int main() {
- X x;
- ; return 0; }
- EOF
--if { (eval echo configure:11935: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11875: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_cpp_unused_required=no
- else
-@@ -11957,12 +11897,12 @@ fi
- 
- 
- echo $ac_n "checking for trouble comparing to zero near std::operator!=()""... $ac_c" 1>&6
--echo "configure:11961: checking for trouble comparing to zero near std::operator!=()" >&5
-+echo "configure:11901: checking for trouble comparing to zero near std::operator!=()" >&5
- if eval "test \"`echo '$''{'ac_cv_trouble_comparing_to_zero'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11966 "configure"
-+#line 11906 "configure"
- #include "confdefs.h"
- #include <algorithm>
-                                 template <class T> class Foo {};
-@@ -11973,7 +11913,7 @@ int main() {
- Foo<int> f; return (0 != f);
- ; return 0; }
- EOF
--if { (eval echo configure:11977: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:11917: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_trouble_comparing_to_zero=no
- else
-@@ -12003,19 +11943,19 @@ fi
- _SAVE_LDFLAGS=$LDFLAGS
- LDFLAGS="$LDFLAGS $DSO_PIC_CFLAGS $DSO_LDOPTS $MOZ_OPTIMIZE_LDFLAGS"
- echo $ac_n "checking for __thread keyword for TLS variables""... $ac_c" 1>&6
--echo "configure:12007: checking for __thread keyword for TLS variables" >&5
-+echo "configure:11947: checking for __thread keyword for TLS variables" >&5
- if eval "test \"`echo '$''{'ac_cv_thread_keyword'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12012 "configure"
-+#line 11952 "configure"
- #include "confdefs.h"
- __thread bool tlsIsMainThread = false;
- int main() {
- return tlsIsMainThread;
- ; return 0; }
- EOF
--if { (eval echo configure:12019: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11959: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_thread_keyword=yes
- else
-@@ -12055,12 +11995,12 @@ fi
- MALLOC_H=
-    ac_safe=`echo "malloc.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for malloc.h""... $ac_c" 1>&6
--echo "configure:12059: checking for malloc.h" >&5
-+echo "configure:11999: checking for malloc.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 12064 "configure"
-+#line 12004 "configure"
- #include "confdefs.h"
- 
- #include <malloc.h>
-@@ -12068,7 +12008,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12072: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12012: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -12091,12 +12031,12 @@ fi
- if test "$MALLOC_H" = ""; then
-      ac_safe=`echo "malloc/malloc.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for malloc/malloc.h""... $ac_c" 1>&6
--echo "configure:12095: checking for malloc/malloc.h" >&5
-+echo "configure:12035: checking for malloc/malloc.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 12100 "configure"
-+#line 12040 "configure"
- #include "confdefs.h"
- 
- #include <malloc/malloc.h>
-@@ -12104,7 +12044,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12108: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12048: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -12127,12 +12067,12 @@ fi
-   if test "$MALLOC_H" = ""; then
-        ac_safe=`echo "sys/malloc.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for sys/malloc.h""... $ac_c" 1>&6
--echo "configure:12131: checking for sys/malloc.h" >&5
-+echo "configure:12071: checking for sys/malloc.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 12136 "configure"
-+#line 12076 "configure"
- #include "confdefs.h"
- 
- #include <sys/malloc.h>
-@@ -12140,7 +12080,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12144: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12084: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -12176,12 +12116,12 @@ MOZ_ALLOCATING_FUNCS="strndup posix_memalign memalign valloc"
- for ac_func in strndup posix_memalign memalign valloc
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:12180: checking for $ac_func" >&5
-+echo "configure:12120: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12185 "configure"
-+#line 12125 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -12207,7 +12147,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12211: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12151: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -12237,19 +12177,19 @@ done
- 
- 
- echo $ac_n "checking for __attribute__((always_inline))""... $ac_c" 1>&6
--echo "configure:12241: checking for __attribute__((always_inline))" >&5
-+echo "configure:12181: checking for __attribute__((always_inline))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_always_inline'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12246 "configure"
-+#line 12186 "configure"
- #include "confdefs.h"
- inline void f(void) __attribute__((always_inline));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12253: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12193: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_always_inline=yes
- else
-@@ -12264,19 +12204,19 @@ fi
- echo "$ac_t""$ac_cv_attribute_always_inline" 1>&6
- 
- echo $ac_n "checking for __attribute__((malloc))""... $ac_c" 1>&6
--echo "configure:12268: checking for __attribute__((malloc))" >&5
-+echo "configure:12208: checking for __attribute__((malloc))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_malloc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12273 "configure"
-+#line 12213 "configure"
- #include "confdefs.h"
- void* f(int) __attribute__((malloc));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12280: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12220: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_malloc=yes
- else
-@@ -12291,19 +12231,19 @@ fi
- echo "$ac_t""$ac_cv_attribute_malloc" 1>&6
- 
- echo $ac_n "checking for __attribute__((warn_unused_result))""... $ac_c" 1>&6
--echo "configure:12295: checking for __attribute__((warn_unused_result))" >&5
-+echo "configure:12235: checking for __attribute__((warn_unused_result))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_warn_unused'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12300 "configure"
-+#line 12240 "configure"
- #include "confdefs.h"
- int f(void) __attribute__((warn_unused_result));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12307: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12247: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_warn_unused=yes
- else
-@@ -12327,19 +12267,19 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- 
- echo $ac_n "checking for LC_MESSAGES""... $ac_c" 1>&6
--echo "configure:12331: checking for LC_MESSAGES" >&5
-+echo "configure:12271: checking for LC_MESSAGES" >&5
- if eval "test \"`echo '$''{'ac_cv_i18n_lc_messages'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12336 "configure"
-+#line 12276 "configure"
- #include "confdefs.h"
- #include <locale.h>
- int main() {
- int category = LC_MESSAGES;
- ; return 0; }
- EOF
--if { (eval echo configure:12343: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12283: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_i18n_lc_messages=yes
- else
-@@ -12365,12 +12305,12 @@ fi
- for ac_func in localeconv
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:12369: checking for $ac_func" >&5
-+echo "configure:12309: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12374 "configure"
-+#line 12314 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -12393,7 +12333,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12397: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12337: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -12580,7 +12520,7 @@ fi
- 	# Extract the first word of "nspr-config", so it can be a program name with args.
- set dummy nspr-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:12584: checking for $ac_word" >&5
-+echo "configure:12524: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_NSPR_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12615,7 +12555,7 @@ fi
- 
- 	min_nspr_version=$NSPR_MINVER
- 	echo $ac_n "checking for NSPR - version >= $min_nspr_version""... $ac_c" 1>&6
--echo "configure:12619: checking for NSPR - version >= $min_nspr_version" >&5
-+echo "configure:12559: checking for NSPR - version >= $min_nspr_version" >&5
- 
- 	no_nspr=""
- 	if test "$NSPR_CONFIG" != "no"; then
-@@ -12678,7 +12618,7 @@ if test -n "$MOZ_NATIVE_NSPR"; then
-     _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $NSPR_CFLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 12682 "configure"
-+#line 12622 "configure"
- #include "confdefs.h"
- #include "prlog.h"
- int main() {
-@@ -12687,7 +12627,7 @@ int main() {
-                  #endif
- ; return 0; }
- EOF
--if { (eval echo configure:12691: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12631: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   MOZ_NATIVE_NSPR=1
- else
-@@ -12729,7 +12669,7 @@ if test -z "$MOZ_ZLIB_LIBS$MOZ_ZLIB_CFLAGS$SKIP_LIBRARY_CHECKS"; then
-         MOZ_NATIVE_ZLIB=
-     else
-         echo $ac_n "checking for gzread in -lz""... $ac_c" 1>&6
--echo "configure:12733: checking for gzread in -lz" >&5
-+echo "configure:12673: checking for gzread in -lz" >&5
- ac_lib_var=`echo z'_'gzread | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -12737,7 +12677,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lz  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 12741 "configure"
-+#line 12681 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -12748,7 +12688,7 @@ int main() {
- gzread()
- ; return 0; }
- EOF
--if { (eval echo configure:12752: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12692: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -12772,7 +12712,7 @@ fi
-         if test "$MOZ_NATIVE_ZLIB" = 1; then
-             MOZZLIBNUM=`echo $MOZZLIB | awk -F. '{printf "0x%x\n", ((($1 * 16 + $2) * 16) + $3) * 16 + $4}'`
-             cat > conftest.$ac_ext <<EOF
--#line 12776 "configure"
-+#line 12716 "configure"
- #include "confdefs.h"
-  #include <stdio.h>
-                              #include <string.h>
-@@ -12783,7 +12723,7 @@ int main() {
-                              #endif 
- ; return 0; }
- EOF
--if { (eval echo configure:12787: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12727: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   MOZ_NATIVE_ZLIB=1
- else
-@@ -12829,7 +12769,7 @@ if test -n "$MOZ_NATIVE_FFI"; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:12833: checking for $ac_word" >&5
-+echo "configure:12773: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12873,19 +12813,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libffi > 3.0.9""... $ac_c" 1>&6
--echo "configure:12877: checking for libffi > 3.0.9" >&5
-+echo "configure:12817: checking for libffi > 3.0.9" >&5
- 
-         if $PKG_CONFIG --exists "libffi > 3.0.9" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_FFI_CFLAGS""... $ac_c" 1>&6
--echo "configure:12884: checking MOZ_FFI_CFLAGS" >&5
-+echo "configure:12824: checking MOZ_FFI_CFLAGS" >&5
-             MOZ_FFI_CFLAGS=`$PKG_CONFIG --cflags "libffi > 3.0.9"`
-             echo "$ac_t""$MOZ_FFI_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_FFI_LIBS""... $ac_c" 1>&6
--echo "configure:12889: checking MOZ_FFI_LIBS" >&5
-+echo "configure:12829: checking MOZ_FFI_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_FFI_LIBS="`$PKG_CONFIG --libs \"libffi > 3.0.9\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_FFI_LIBS" 1>&6
-@@ -12921,7 +12861,7 @@ echo "configure:12889: checking MOZ_FFI_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:12925: checking for $ac_word" >&5
-+echo "configure:12865: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12965,19 +12905,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libffi >= 3.0.9""... $ac_c" 1>&6
--echo "configure:12969: checking for libffi >= 3.0.9" >&5
-+echo "configure:12909: checking for libffi >= 3.0.9" >&5
- 
-         if $PKG_CONFIG --exists "libffi >= 3.0.9" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_FFI_CFLAGS""... $ac_c" 1>&6
--echo "configure:12976: checking MOZ_FFI_CFLAGS" >&5
-+echo "configure:12916: checking MOZ_FFI_CFLAGS" >&5
-             MOZ_FFI_CFLAGS=`$PKG_CONFIG --cflags "libffi >= 3.0.9"`
-             echo "$ac_t""$MOZ_FFI_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_FFI_LIBS""... $ac_c" 1>&6
--echo "configure:12981: checking MOZ_FFI_LIBS" >&5
-+echo "configure:12921: checking MOZ_FFI_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_FFI_LIBS="`$PKG_CONFIG --libs \"libffi >= 3.0.9\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_FFI_LIBS" 1>&6
-@@ -13112,18 +13052,18 @@ MOZ_DEBUG_DISABLE_DEFS="-DNDEBUG -DTRIMMED"
- 
- if test -n "$MOZ_DEBUG"; then
-     echo $ac_n "checking for valid debug flags""... $ac_c" 1>&6
--echo "configure:13116: checking for valid debug flags" >&5
-+echo "configure:13056: checking for valid debug flags" >&5
-     _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $MOZ_DEBUG_FLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 13120 "configure"
-+#line 13060 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:13127: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13067: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _results=yes
- else
-@@ -13201,18 +13141,18 @@ fi
- if test "$COMPILE_ENVIRONMENT"; then
- if test -n "$MOZ_OPTIMIZE"; then
-     echo $ac_n "checking for valid optimization flags""... $ac_c" 1>&6
--echo "configure:13205: checking for valid optimization flags" >&5
-+echo "configure:13145: checking for valid optimization flags" >&5
-     _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $MOZ_OPTIMIZE_FLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 13209 "configure"
-+#line 13149 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:13216: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13156: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _results=yes
- else
-@@ -13364,7 +13304,7 @@ EOF
-     fi
-   else
-     echo $ac_n "checking size of int *""... $ac_c" 1>&6
--echo "configure:13368: checking size of int *" >&5
-+echo "configure:13308: checking size of int *" >&5
- if eval "test \"`echo '$''{'ac_cv_sizeof_int_p'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -13372,7 +13312,7 @@ else
-   ac_cv_sizeof_int_p=4
- else
-   cat > conftest.$ac_ext <<EOF
--#line 13376 "configure"
-+#line 13316 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main()
-@@ -13383,7 +13323,7 @@ int main()
-   return(0);
- }
- EOF
--if { (eval echo configure:13387: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:13327: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_sizeof_int_p=`cat conftestval`
- else
-@@ -13687,12 +13627,12 @@ fi
- if test -n "$MOZ_VALGRIND"; then
-        ac_safe=`echo "valgrind/valgrind.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for valgrind/valgrind.h""... $ac_c" 1>&6
--echo "configure:13691: checking for valgrind/valgrind.h" >&5
-+echo "configure:13631: checking for valgrind/valgrind.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 13696 "configure"
-+#line 13636 "configure"
- #include "confdefs.h"
- 
- #include <valgrind/valgrind.h>
-@@ -13700,7 +13640,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:13704: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13644: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -13973,7 +13913,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:13977: checking for $ac_word" >&5
-+echo "configure:13917: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_CCACHE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14099,12 +14039,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
-     for ac_func in __cxa_demangle
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:14103: checking for $ac_func" >&5
-+echo "configure:14043: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 14108 "configure"
-+#line 14048 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -14130,7 +14070,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:14134: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14074: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -14184,12 +14124,12 @@ fi
- if test -z "$SKIP_LIBRARY_CHECKS"; then
-        ac_safe=`echo "unwind.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for unwind.h""... $ac_c" 1>&6
--echo "configure:14188: checking for unwind.h" >&5
-+echo "configure:14128: checking for unwind.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 14193 "configure"
-+#line 14133 "configure"
- #include "confdefs.h"
- 
- #include <unwind.h>
-@@ -14197,7 +14137,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:14201: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14141: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -14214,12 +14154,12 @@ fi
-     for ac_func in _Unwind_Backtrace
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:14218: checking for $ac_func" >&5
-+echo "configure:14158: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 14223 "configure"
-+#line 14163 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -14242,7 +14182,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:14246: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14186: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -14334,7 +14274,7 @@ if test -z "$SKIP_COMPILER_CHECKS"; then
- # Compiler Options
- 
- echo $ac_n "checking for -pipe support""... $ac_c" 1>&6
--echo "configure:14338: checking for -pipe support" >&5
-+echo "configure:14278: checking for -pipe support" >&5
- if test -n "$GNU_CC" -a -n "$GNU_CXX"; then
-         CFLAGS="$CFLAGS -pipe"
-     CXXFLAGS="$CXXFLAGS -pipe"
-@@ -14348,16 +14288,16 @@ _SAVE_CFLAGS="$CFLAGS"
- CFLAGS="$CFLAGS -fprofile-generate -fprofile-correction"
- 
- echo $ac_n "checking whether C compiler supports -fprofile-generate""... $ac_c" 1>&6
--echo "configure:14352: checking whether C compiler supports -fprofile-generate" >&5
-+echo "configure:14292: checking whether C compiler supports -fprofile-generate" >&5
- cat > conftest.$ac_ext <<EOF
--#line 14354 "configure"
-+#line 14294 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:14361: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14301: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-    PROFILE_GEN_CFLAGS="-fprofile-generate"
-                  result="yes" 
-@@ -14421,16 +14361,16 @@ if test "$_PEDANTIC"; then
-     _SAVE_CXXFLAGS=$CXXFLAGS
-     CXXFLAGS="$CXXFLAGS -pedantic ${_WARNINGS_CXXFLAGS} -Wno-long-long"
-     echo $ac_n "checking whether C++ compiler has -pedantic long long bug""... $ac_c" 1>&6
--echo "configure:14425: checking whether C++ compiler has -pedantic long long bug" >&5
-+echo "configure:14365: checking whether C++ compiler has -pedantic long long bug" >&5
-     cat > conftest.$ac_ext <<EOF
--#line 14427 "configure"
-+#line 14367 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(sizeof(long long) == 8)
- ; return 0; }
- EOF
--if { (eval echo configure:14434: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14374: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   result="no"
- else
-@@ -14457,12 +14397,12 @@ fi
- _SAVE_CXXFLAGS=$CXXFLAGS
- CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS}"
- echo $ac_n "checking for correct overload resolution with const and templates""... $ac_c" 1>&6
--echo "configure:14461: checking for correct overload resolution with const and templates" >&5
-+echo "configure:14401: checking for correct overload resolution with const and templates" >&5
- if eval "test \"`echo '$''{'ac_nscap_nonconst_opeq_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 14466 "configure"
-+#line 14406 "configure"
- #include "confdefs.h"
- 
-                       template <class T>
-@@ -14492,7 +14432,7 @@ int main() {
-                     
- ; return 0; }
- EOF
--if { (eval echo configure:14496: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14436: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_nscap_nonconst_opeq_bug="no"
- else
-@@ -14518,19 +14458,19 @@ EOF
- fi
- 
- echo $ac_n "checking for tm_zone tm_gmtoff in struct tm""... $ac_c" 1>&6
--echo "configure:14522: checking for tm_zone tm_gmtoff in struct tm" >&5
-+echo "configure:14462: checking for tm_zone tm_gmtoff in struct tm" >&5
- if eval "test \"`echo '$''{'ac_cv_struct_tm_zone_tm_gmtoff'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 14527 "configure"
-+#line 14467 "configure"
- #include "confdefs.h"
- #include <time.h>
- int main() {
- struct tm tm; tm.tm_zone = 0; tm.tm_gmtoff = 1;
- ; return 0; }
- EOF
--if { (eval echo configure:14534: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14474: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_struct_tm_zone_tm_gmtoff="yes"
- else
-@@ -14572,18 +14512,18 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- 
- echo $ac_n "checking what kind of list files are supported by the linker""... $ac_c" 1>&6
--echo "configure:14576: checking what kind of list files are supported by the linker" >&5
-+echo "configure:14516: checking what kind of list files are supported by the linker" >&5
- if eval "test \"`echo '$''{'EXPAND_LIBS_LIST_STYLE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   echo "int main() {return 0;}" > conftest.${ac_ext}
--     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&5'; { (eval echo configure:14581: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
-+     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&5'; { (eval echo configure:14521: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
-          echo "INPUT(conftest.${OBJ_SUFFIX})" > conftest.list
--         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&5'; { (eval echo configure:14583: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-+         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&5'; { (eval echo configure:14523: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-              EXPAND_LIBS_LIST_STYLE=linkerscript
-          else
-              echo "conftest.${OBJ_SUFFIX}" > conftest.list
--             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&5'; { (eval echo configure:14587: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-+             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&5'; { (eval echo configure:14527: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-                  EXPAND_LIBS_LIST_STYLE=list
-              else
-                  EXPAND_LIBS_LIST_STYLE=none
-@@ -14603,7 +14543,7 @@ LIBS_DESC_SUFFIX=desc
- 
- if test "$GCC_USE_GNU_LD"; then
-     echo $ac_n "checking what kind of ordering can be done with the linker""... $ac_c" 1>&6
--echo "configure:14607: checking what kind of ordering can be done with the linker" >&5
-+echo "configure:14547: checking what kind of ordering can be done with the linker" >&5
- if eval "test \"`echo '$''{'EXPAND_LIBS_ORDER_STYLE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14611,14 +14551,14 @@ else
-          _SAVE_LDFLAGS="$LDFLAGS"
-          LDFLAGS="${LDFLAGS} -Wl,--section-ordering-file,conftest.order"
-          cat > conftest.$ac_ext <<EOF
--#line 14615 "configure"
-+#line 14555 "configure"
- #include "confdefs.h"
- 
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:14622: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14562: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   EXPAND_LIBS_ORDER_STYLE=section-ordering-file
- else
-@@ -14630,7 +14570,7 @@ fi
- rm -f conftest*
-          LDFLAGS="$_SAVE_LDFLAGS"
-          if test -z "$EXPAND_LIBS_ORDER_STYLE"; then
--             if { ac_try='${CC-cc} ${DSO_LDOPTS} ${LDFLAGS} -o ${DLL_PREFIX}conftest${DLL_SUFFIX} -Wl'; { (eval echo configure:14634: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; }; then
-+             if { ac_try='${CC-cc} ${DSO_LDOPTS} ${LDFLAGS} -o ${DLL_PREFIX}conftest${DLL_SUFFIX} -Wl'; { (eval echo configure:14574: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; }; then
-                  EXPAND_LIBS_ORDER_STYLE=linkerscript
-              else
-                  EXPAND_LIBS_ORDER_STYLE=none
-@@ -14741,7 +14681,7 @@ esac
- if test -z "$SKIP_LIBRARY_CHECKS" -a -z "$NO_EDITLINE"; then
-   if test -n "$JS_WANT_READLINE"; then
-     echo $ac_n "checking for readline in -lreadline""... $ac_c" 1>&6
--echo "configure:14745: checking for readline in -lreadline" >&5
-+echo "configure:14685: checking for readline in -lreadline" >&5
- ac_lib_var=`echo readline'_'readline | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -14749,7 +14689,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lreadline  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 14753 "configure"
-+#line 14693 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -14760,7 +14700,7 @@ int main() {
- readline()
- ; return 0; }
- EOF
--if { (eval echo configure:14764: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14704: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -14990,9 +14930,9 @@ EOF
- 
- 
- echo $ac_n "checking for posix_fallocate""... $ac_c" 1>&6
--echo "configure:14994: checking for posix_fallocate" >&5
-+echo "configure:14934: checking for posix_fallocate" >&5
- cat > conftest.$ac_ext <<EOF
--#line 14996 "configure"
-+#line 14936 "configure"
- #include "confdefs.h"
- #define _XOPEN_SOURCE 600
-   #include <fcntl.h>
-@@ -15000,7 +14940,7 @@ int main() {
- posix_fallocate(0, 0, 0);
- ; return 0; }
- EOF
--if { (eval echo configure:15004: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14944: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv___posix_fallocate=true
- else
-@@ -15029,7 +14969,7 @@ if test "$MOZ_X11"; then
-                 _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $XCFLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 15033 "configure"
-+#line 14973 "configure"
- #include "confdefs.h"
- 
-         #include <stdio.h>
-@@ -15047,7 +14987,7 @@ int main() {
-     
- ; return 0; }
- EOF
--if { (eval echo configure:15051: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14991: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -15162,12 +15102,12 @@ fi
- for ac_func in setlocale
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:15166: checking for $ac_func" >&5
-+echo "configure:15106: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 15171 "configure"
-+#line 15111 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -15190,7 +15130,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:15194: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:15134: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -15220,12 +15160,12 @@ done
- for ac_func in localeconv
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:15224: checking for $ac_func" >&5
-+echo "configure:15164: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 15229 "configure"
-+#line 15169 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -15248,7 +15188,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:15252: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:15192: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch b/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
deleted file mode 100644
index 6aeb2f6..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From d4a15ad82292ff6d772dcc631df98754d20be31b Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Tue, 18 Mar 2014 11:46:05 -0400
-Subject: [PATCH 2/5] Move JS_BYTES_PER_WORD out of config.h
-
-Instead define it in terms of the already extant GNU C extension
-__SIZEOF_POINTER__.  This avoids multiarch conflicts when 32 and 64
-bit packages of js are co-installed.
----
-
-Upstream-status: Pending
-
- js/src/configure.in   |  9 ---------
- js/src/js-config.h.in |  1 -
- js/src/jstypes.h      | 12 ++++++++++++
- 3 files changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/js/src/configure.in b/js/src/configure.in
-index 15605b2..64c7606 100644
---- a/js/src/configure.in
-+++ b/js/src/configure.in
-@@ -2345,15 +2345,6 @@ else
-   AC_MSG_RESULT(no)
- fi
- 
--MOZ_SIZE_OF_TYPE(JS_BYTES_PER_WORD, void*, 4 8)
--if test "$moz_cv_size_of_JS_BYTES_PER_WORD" -eq "4"; then
--  AC_DEFINE(JS_BITS_PER_WORD_LOG2, 5)
--elif test "$moz_cv_size_of_JS_BYTES_PER_WORD" -eq "8"; then
--  AC_DEFINE(JS_BITS_PER_WORD_LOG2, 6)
--else
--  AC_MSG_ERROR([Unexpected JS_BYTES_PER_WORD])
--fi
--
- MOZ_ALIGN_OF_TYPE(JS_ALIGN_OF_POINTER, void*, 2 4 8 16)
- MOZ_SIZE_OF_TYPE(JS_BYTES_PER_DOUBLE, double, 6 8 10 12 14)
- 
-diff --git a/js/src/js-config.h.in b/js/src/js-config.h.in
-index 6889e00..4775420 100644
---- a/js/src/js-config.h.in
-+++ b/js/src/js-config.h.in
-@@ -56,7 +56,6 @@
- #undef JS_INT32_TYPE
- #undef JS_INT64_TYPE
- #undef JS_INTPTR_TYPE
--#undef JS_BYTES_PER_WORD
- 
- /* Some mozilla code uses JS-friend APIs that depend on JS_METHODJIT being
-    correct. */
-diff --git a/js/src/jstypes.h b/js/src/jstypes.h
-index d0cf183..3e7928f 100644
---- a/js/src/jstypes.h
-+++ b/js/src/jstypes.h
-@@ -24,6 +24,18 @@
- #include "mozilla/Util.h"
- 
- #include "js-config.h"
-+#ifndef JS_BYTES_PER_WORD
-+#define JS_BYTES_PER_WORD __SIZEOF_POINTER__
-+#endif
-+#ifndef JS_BITS_PER_WORD_LOG2
-+#if JS_BYTES_PER_WORD == 8
-+#define JS_BITS_PER_WORD_LOG2 6
-+#elif JS_BYTES_PER_WORD == 4
-+#define JS_BITS_PER_WORD_LOG2 5
-+#else
-+#error Unhandled JS_BYTES_PER_WORD
-+#endif 
-+#endif
- 
- /***********************************************************************
- ** MACROS:      JS_EXTERN_API
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0002-fix-cannot-find-link.patch b/meta-oe/recipes-extended/mozjs/mozjs/0002-fix-cannot-find-link.patch
new file mode 100644
index 0000000..4f7ebc6
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0002-fix-cannot-find-link.patch
@@ -0,0 +1,34 @@
+From e6dcee5f8a0f80ce99946b81fa1233611a149fe6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Jul 2018 18:00:52 +0800
+Subject: [PATCH 2/5] fix cannot find link
+
+..
+|DEBUG: link: Trying 'mips64-wrs-linux-ld --sysroot=tmp-glibc/work/
+mips64-wrs-linux/mozjs/52.8.1-r0/recipe-sysroot '
+|ERROR: Cannot find link
+...
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/moz.configure/checks.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/moz.configure/checks.configure b/build/moz.configure/checks.configure
+index 8c2dbc0..83bffc3 100644
+--- a/build/moz.configure/checks.configure
++++ b/build/moz.configure/checks.configure
+@@ -128,7 +128,7 @@ def check_prog(var, progs, what=None, input=None, allow_missing=False,
+ 
+         for prog in value or progs:
+             log.debug('%s: Trying %s', var.lower(), quote(prog))
+-            result = find_program(prog, paths)
++            result = find_program(prog.split()[0], paths)
+             if result:
+                 return result
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0003-workaround-autoconf-2.13-detection-failed.patch b/meta-oe/recipes-extended/mozjs/mozjs/0003-workaround-autoconf-2.13-detection-failed.patch
new file mode 100644
index 0000000..a754ff1
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0003-workaround-autoconf-2.13-detection-failed.patch
@@ -0,0 +1,28 @@
+From 646a78262b18e19721cd41ee515215221dd241b6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Jul 2018 18:12:42 +0800
+Subject: [PATCH 3/5] workaround  autoconf 2.13 detection failed
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/moz.configure/old.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/moz.configure/old.configure b/build/moz.configure/old.configure
+index b32c3f7..ece47f4 100644
+--- a/build/moz.configure/old.configure
++++ b/build/moz.configure/old.configure
+@@ -31,7 +31,7 @@ def autoconf(mozconfig, autoconf):
+     autoconf = autoconf[0] if autoconf else None
+ 
+     for ac in (mozconfig_autoconf, autoconf, 'autoconf-2.13', 'autoconf2.13',
+-               'autoconf213'):
++               'autoconf213', 'autoconf'):
+         if ac:
+             autoconf = find_program(ac)
+             if autoconf:
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch b/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch
new file mode 100644
index 0000000..4cba79c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch
@@ -0,0 +1,42 @@
+From a46adb74b5ba5e17d676d31d70faca76c1381d15 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Jul 2018 21:25:46 +0800
+Subject: [PATCH 4/5] do not use autoconf 2.13 to refresh old.configure
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/moz.configure/old.configure | 2 +-
+ js/src/old-configure              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build/moz.configure/old.configure b/build/moz.configure/old.configure
+index ece47f4..a73900f 100644
+--- a/build/moz.configure/old.configure
++++ b/build/moz.configure/old.configure
+@@ -83,7 +83,7 @@ def prepare_configure(old_configure, mozconfig, autoconf, build_env, shell,
+             old_configure = os.path.join(old_configure_dir, 'js', 'src',
+                                          os.path.basename(old_configure))
+ 
+-    refresh = True
++    refresh = False
+     if exists(old_configure):
+         mtime = getmtime(old_configure)
+         aclocal = os.path.join(build_env.topsrcdir, 'build', 'autoconf',
+diff --git a/js/src/old-configure b/js/src/old-configure
+index 75b00e1..8a8ef52 100644
+--- a/js/src/old-configure
++++ b/js/src/old-configure
+@@ -619,7 +619,7 @@ if test -z "$srcdir"; then
+   ac_prog=$0
+   ac_confdir=`echo $ac_prog|sed 's%/[^/][^/]*$%%'`
+   test "x$ac_confdir" = "x$ac_prog" && ac_confdir=.
+-  srcdir=$ac_confdir
++  srcdir="$ac_confdir/../../"
+   if test ! -r $srcdir/$ac_unique_file; then
+     srcdir=..
+   fi
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch b/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch
deleted file mode 100644
index 8bd35d4..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 0128c5a9eeee0d3fc0deb9129dd20eb79338c8f4 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Mon, 2 Mar 2015 19:08:59 +0800
-Subject: [PATCH 4/5] mozbug746112-no-decommit-on-large-pages
-
----
-Upstream-status: Pending
-
- js/src/gc/Heap.h | 15 ++++++++++-----
- js/src/jsgc.cpp  | 15 ++++++++++++---
- 2 files changed, 22 insertions(+), 8 deletions(-)
-
-diff --git a/js/src/gc/Heap.h b/js/src/gc/Heap.h
-index b8f8c78..1cfd269 100644
---- a/js/src/gc/Heap.h
-+++ b/js/src/gc/Heap.h
-@@ -103,26 +103,31 @@ struct Cell
- };
- 
- /*
-- * Page size is 4096 by default, except for SPARC, where it is 8192.
-+ * Page size must be static to support our arena pointer optimizations, so we
-+ * are forced to support each platform with non-4096 pages as a special case.
-+ * Note: The freelist supports a maximum arena shift of 15.
-  * Note: Do not use JS_CPU_SPARC here, this header is used outside JS.
-  * Bug 692267: Move page size definition to gc/Memory.h and include it
-  *             directly once jsgc.h is no longer an installed header.
-  */
- #if defined(SOLARIS) && (defined(__sparc) || defined(__sparcv9))
- const size_t PageShift = 13;
-+const size_t ArenaShift = PageShift;
-+#elif defined(__powerpc__)
-+const size_t PageShift = 16;
-+const size_t ArenaShift = 12;
- #else
- const size_t PageShift = 12;
-+const size_t ArenaShift = PageShift;
- #endif
- const size_t PageSize = size_t(1) << PageShift;
-+const size_t ArenaSize = size_t(1) << ArenaShift;
-+const size_t ArenaMask = ArenaSize - 1;
- 
- const size_t ChunkShift = 20;
- const size_t ChunkSize = size_t(1) << ChunkShift;
- const size_t ChunkMask = ChunkSize - 1;
- 
--const size_t ArenaShift = PageShift;
--const size_t ArenaSize = PageSize;
--const size_t ArenaMask = ArenaSize - 1;
--
- /*
-  * This is the maximum number of arenas we allow in the FreeCommitted state
-  * before we trigger a GC_SHRINK to release free arenas to the OS.
-diff --git a/js/src/jsgc.cpp b/js/src/jsgc.cpp
-index b3caf05..a258d2d 100644
---- a/js/src/jsgc.cpp
-+++ b/js/src/jsgc.cpp
-@@ -251,6 +251,13 @@ static const int BackgroundPhaseLength[] = {
-     sizeof(BackgroundPhaseStrings) / sizeof(AllocKind)
- };
- 
-+/* Unused memory decommiting requires the arena size match the page size. */
-+static bool
-+DecommitEnabled()
-+{
-+    return PageSize == ArenaSize;
-+}
-+
- #ifdef DEBUG
- void
- ArenaHeader::checkSynchronizedWithFreeList() const
-@@ -742,7 +749,8 @@ Chunk::fetchNextDecommittedArena()
-     decommittedArenas.unset(offset);
- 
-     Arena *arena = &arenas[offset];
--    MarkPagesInUse(arena, ArenaSize);
-+    if (DecommitEnabled())
-+        MarkPagesInUse(arena, ArenaSize);
-     arena->aheader.setAsNotAllocated();
- 
-     return &arena->aheader;
-@@ -2731,7 +2739,7 @@ DecommitArenasFromAvailableList(JSRuntime *rt, Chunk **availableListHeadp)
-                 chunk->removeFromAvailableList();
- 
-             size_t arenaIndex = Chunk::arenaIndex(aheader->arenaAddress());
--            bool ok;
-+            bool ok = true;
-             {
-                 /*
-                  * If the main thread waits for the decommit to finish, skip
-@@ -2741,7 +2749,8 @@ DecommitArenasFromAvailableList(JSRuntime *rt, Chunk **availableListHeadp)
-                 Maybe<AutoUnlockGC> maybeUnlock;
-                 if (!rt->isHeapBusy())
-                     maybeUnlock.construct(rt);
--                ok = MarkPagesUnused(aheader->getArena(), ArenaSize);
-+                if (DecommitEnabled())
-+                    ok = MarkPagesUnused(aheader->getArena(), ArenaSize);
-             }
- 
-             if (ok) {
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch b/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
deleted file mode 100644
index bc99ecc..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9c42920c2b635a399bd1f93833efdeb1696f17ee Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Mon, 2 Mar 2015 19:09:57 +0800
-Subject: [PATCH 5/5] aarch64-64k-page
-
----
-Upstream-status: Pending
-
- js/src/gc/Heap.h     | 2 +-
- js/src/gc/Memory.cpp | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/js/src/gc/Heap.h b/js/src/gc/Heap.h
-index 1cfd269..f4dbcda 100644
---- a/js/src/gc/Heap.h
-+++ b/js/src/gc/Heap.h
-@@ -113,7 +113,7 @@ struct Cell
- #if defined(SOLARIS) && (defined(__sparc) || defined(__sparcv9))
- const size_t PageShift = 13;
- const size_t ArenaShift = PageShift;
--#elif defined(__powerpc__)
-+#elif defined(__powerpc__) || defined(__aarch64__)
- const size_t PageShift = 16;
- const size_t ArenaShift = 12;
- #else
-diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
-index 5b386a2..e5ad018 100644
---- a/js/src/gc/Memory.cpp
-+++ b/js/src/gc/Memory.cpp
-@@ -302,8 +302,11 @@ GetPageFaultCount()
- void
- InitMemorySubsystem()
- {
-+    /* aarch64 may have 64KB or 4KB pages */
-+#ifndef __aarch64__
-     if (size_t(sysconf(_SC_PAGESIZE)) != PageSize)
-         MOZ_CRASH();
-+#endif
- }
- 
- void *
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch b/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch
new file mode 100644
index 0000000..38e4698
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch
@@ -0,0 +1,38 @@
+From 55d833dc3c194f1eb7841f308ad3b9ec3800d3b3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 13 Jul 2018 15:48:32 +0800
+Subject: [PATCH 5/5] fix do_compile failed on mips
+
+Link with var-OS_LDFLAGS to fix the issue.
+Such as on mips:
+...
+|mips-wrsmllib32-linux-g++ -meb -mabi=32 -mhard-float ... -o libmozjs-52.so
+|/usr/include/c++/8.1.0/bits/atomic_base.h:514: error: undefined
+reference to '__atomic_fetch_add_8'
+...
+
+In recipe, set OS_LDFLAGS="-Wl,-latomic" could fix the issue.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ config/config.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/config.mk b/config/config.mk
+index 4e3fd1a..d847ffa 100644
+--- a/config/config.mk
++++ b/config/config.mk
+@@ -523,7 +523,7 @@ EXPAND_MKSHLIB_ARGS = --uselist
+ ifdef SYMBOL_ORDER
+ EXPAND_MKSHLIB_ARGS += --symbol-order $(SYMBOL_ORDER)
+ endif
+-EXPAND_MKSHLIB = $(EXPAND_LIBS_EXEC) $(EXPAND_MKSHLIB_ARGS) -- $(MKSHLIB)
++EXPAND_MKSHLIB = $(EXPAND_LIBS_EXEC) $(EXPAND_MKSHLIB_ARGS) -- $(MKSHLIB) $(OS_LDFLAGS)
+ 
+ # $(call CHECK_SYMBOLS,lib,PREFIX,dep_name,test)
+ # Checks that the given `lib` doesn't contain dependency on symbols with a
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch
new file mode 100644
index 0000000..32a977c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch
@@ -0,0 +1,158 @@
+From 04e8a611e958f0da1ccac61acae3a6f1a5168b20 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 13 Jul 2018 18:08:14 +0800
+Subject: [PATCH] support musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ memory/jemalloc/src/src/pages.c              | 1 -
+ memory/mozjemalloc/jemalloc.c                | 7 +++----
+ mozglue/misc/TimeStamp_darwin.cpp            | 1 -
+ mozglue/misc/TimeStamp_posix.cpp             | 1 -
+ nsprpub/pr/src/misc/prsystem.c               | 1 -
+ python/psutil/psutil/_psutil_bsd.c           | 1 -
+ python/psutil/psutil/_psutil_osx.c           | 1 -
+ python/psutil/psutil/arch/bsd/process_info.c | 1 -
+ python/psutil/psutil/arch/osx/process_info.c | 1 -
+ 9 files changed, 3 insertions(+), 12 deletions(-)
+
+diff --git a/memory/jemalloc/src/src/pages.c b/memory/jemalloc/src/src/pages.c
+index 647952a..7b964c8 100644
+--- a/memory/jemalloc/src/src/pages.c
++++ b/memory/jemalloc/src/src/pages.c
+@@ -2,7 +2,6 @@
+ #include "jemalloc/internal/jemalloc_internal.h"
+ 
+ #ifdef JEMALLOC_SYSCTL_VM_OVERCOMMIT
+-#include <sys/sysctl.h>
+ #endif
+ 
+ /******************************************************************************/
+diff --git a/memory/mozjemalloc/jemalloc.c b/memory/mozjemalloc/jemalloc.c
+index 5d4d83a..c618de9 100644
+--- a/memory/mozjemalloc/jemalloc.c
++++ b/memory/mozjemalloc/jemalloc.c
+@@ -332,7 +332,6 @@ __FBSDID("$FreeBSD: head/lib/libc/stdlib/malloc.c 180599 2008-07-18 19:35:44Z ja
+ #include <sys/time.h>
+ #include <sys/types.h>
+ #if !defined(MOZ_MEMORY_SOLARIS) && !defined(MOZ_MEMORY_ANDROID)
+-#include <sys/sysctl.h>
+ #endif
+ #include <sys/uio.h>
+ #ifndef MOZ_MEMORY
+@@ -674,7 +673,7 @@ static bool malloc_initialized = false;
+ #elif defined(MOZ_MEMORY_DARWIN)
+ static malloc_mutex_t init_lock = {OS_SPINLOCK_INIT};
+ #elif defined(MOZ_MEMORY_LINUX) && !defined(MOZ_MEMORY_ANDROID)
+-static malloc_mutex_t init_lock = PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP;
++static malloc_mutex_t init_lock = PTHREAD_MUTEX_INITIALIZER;
+ #elif defined(MOZ_MEMORY)
+ static malloc_mutex_t init_lock = PTHREAD_MUTEX_INITIALIZER;
+ #else
+@@ -1644,7 +1643,7 @@ malloc_mutex_init(malloc_mutex_t *mutex)
+ 	pthread_mutexattr_t attr;
+ 	if (pthread_mutexattr_init(&attr) != 0)
+ 		return (true);
+-	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
++	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_STALLED);
+ 	if (pthread_mutex_init(mutex, &attr) != 0) {
+ 		pthread_mutexattr_destroy(&attr);
+ 		return (true);
+@@ -1709,7 +1708,7 @@ malloc_spin_init(malloc_spinlock_t *lock)
+ 	pthread_mutexattr_t attr;
+ 	if (pthread_mutexattr_init(&attr) != 0)
+ 		return (true);
+-	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
++	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_STALLED);
+ 	if (pthread_mutex_init(lock, &attr) != 0) {
+ 		pthread_mutexattr_destroy(&attr);
+ 		return (true);
+diff --git a/mozglue/misc/TimeStamp_darwin.cpp b/mozglue/misc/TimeStamp_darwin.cpp
+index f30bc98..3998c9c 100644
+--- a/mozglue/misc/TimeStamp_darwin.cpp
++++ b/mozglue/misc/TimeStamp_darwin.cpp
+@@ -18,7 +18,6 @@
+ 
+ #include <mach/mach_time.h>
+ #include <sys/time.h>
+-#include <sys/sysctl.h>
+ #include <time.h>
+ #include <unistd.h>
+ 
+diff --git a/mozglue/misc/TimeStamp_posix.cpp b/mozglue/misc/TimeStamp_posix.cpp
+index 05dedde..d9e30f2 100644
+--- a/mozglue/misc/TimeStamp_posix.cpp
++++ b/mozglue/misc/TimeStamp_posix.cpp
+@@ -21,7 +21,6 @@
+ #if defined(__DragonFly__) || defined(__FreeBSD__) \
+     || defined(__NetBSD__) || defined(__OpenBSD__)
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #endif
+ 
+ #if defined(__DragonFly__) || defined(__FreeBSD__)
+diff --git a/nsprpub/pr/src/misc/prsystem.c b/nsprpub/pr/src/misc/prsystem.c
+index eba85fb..54b57bb 100644
+--- a/nsprpub/pr/src/misc/prsystem.c
++++ b/nsprpub/pr/src/misc/prsystem.c
+@@ -27,7 +27,6 @@
+     || defined(OPENBSD) || defined(DRAGONFLY) || defined(DARWIN)
+ #define _PR_HAVE_SYSCTL
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #endif
+ 
+ #if defined(DARWIN)
+diff --git a/python/psutil/psutil/_psutil_bsd.c b/python/psutil/psutil/_psutil_bsd.c
+index 7b6e561..0a91262 100644
+--- a/python/psutil/psutil/_psutil_bsd.c
++++ b/python/psutil/psutil/_psutil_bsd.c
+@@ -16,7 +16,6 @@
+ #include <fcntl.h>
+ #include <paths.h>
+ #include <sys/types.h>
+-#include <sys/sysctl.h>
+ #include <sys/param.h>
+ #include <sys/user.h>
+ #include <sys/proc.h>
+diff --git a/python/psutil/psutil/_psutil_osx.c b/python/psutil/psutil/_psutil_osx.c
+index 3ebf8ff..b3910ba 100644
+--- a/python/psutil/psutil/_psutil_osx.c
++++ b/python/psutil/psutil/_psutil_osx.c
+@@ -13,7 +13,6 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <utmpx.h>
+-#include <sys/sysctl.h>
+ #include <sys/vmmeter.h>
+ #include <libproc.h>
+ #include <sys/proc_info.h>
+diff --git a/python/psutil/psutil/arch/bsd/process_info.c b/python/psutil/psutil/arch/bsd/process_info.c
+index 4d73924..46f288d 100644
+--- a/python/psutil/psutil/arch/bsd/process_info.c
++++ b/python/psutil/psutil/arch/bsd/process_info.c
+@@ -15,7 +15,6 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/types.h>
+-#include <sys/sysctl.h>
+ #include <sys/param.h>
+ #include <sys/user.h>
+ #include <sys/proc.h>
+diff --git a/python/psutil/psutil/arch/osx/process_info.c b/python/psutil/psutil/arch/osx/process_info.c
+index b6dd5bb..62a838f 100644
+--- a/python/psutil/psutil/arch/osx/process_info.c
++++ b/python/psutil/psutil/arch/osx/process_info.c
+@@ -16,7 +16,6 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <signal.h>
+-#include <sys/sysctl.h>
+ #include <libproc.h>
+ 
+ #include "process_info.h"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
index 6432e1f..9194e34 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
@@ -1,4 +1,4 @@
-From a452138a1dd274bfad381a701729783360dc86fb Mon Sep 17 00:00:00 2001
+From a452138a1dd274bfad381a701729783360dc86fb Mon Sep 17  00:00:00 2001
 From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
 Date: Tue, 5 Jan 2016 22:04:17 +0100
 Subject: [PATCH] fix cross compilation on i586 targets
@@ -10,37 +10,26 @@ regenerate configure, similar fix is applied there.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
+
+Rebase to 52.8.1
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- js/src/configure    | 2 +-
- js/src/configure.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ js/src/old-configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/js/src/configure b/js/src/configure
-index d019b0fdba44233596541de94307010d85a8e32e..5aa40f757a3dbb7d6887175046f44212c15c2eac 100755
---- a/js/src/configure
-+++ b/js/src/configure
-@@ -5555,7 +5555,7 @@ TARGET_MD_ARCH=unix
+diff --git a/js/src/old-configure b/js/src/old-configure
+index 8a8ef52..d7afcff 100644
+--- a/js/src/old-configure
++++ b/js/src/old-configure
+@@ -3964,7 +3964,7 @@ IMPORT_LIB_SUFFIX=
  DIRENT_INO=d_ino
  MOZ_USER_DIR=".mozilla"
  
--MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin -Wl,-rpath-link,$(prefix)/lib'
-+MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin'
- 
- MOZ_COMPONENT_NSPR_LIBS='-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
- 
-diff --git a/js/src/configure.in b/js/src/configure.in
-index 0673aca12f6d83035549ade2a4a83906bf91f0f0..39b22724f9535ac1a6dba04658c91e4ef667fc47 100644
---- a/js/src/configure.in
-+++ b/js/src/configure.in
-@@ -919,7 +919,7 @@ TARGET_MD_ARCH=unix
- DIRENT_INO=d_ino
- MOZ_USER_DIR=".mozilla"
+-MOZ_FIX_LINK_PATHS="-Wl,-rpath-link,${DIST}/bin -Wl,-rpath-link,${prefix}/lib"
++MOZ_FIX_LINK_PATHS="-Wl,-rpath-link,${DIST}/bin"
  
--MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin -Wl,-rpath-link,$(prefix)/lib'
-+MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin'
  
- MOZ_COMPONENT_NSPR_LIBS='-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
  
 -- 
-2.5.0
+2.7.4
 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
deleted file mode 100644
index 83f4543..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 1d1fa95c8ff7697e46343385a79a8f7e5c514a87 Mon Sep 17 00:00:00 2001
-From: Zheng Xu <zheng.xu@linaro.org>
-Date: Fri, 2 Sep 2016 17:40:05 +0800
-Subject: [PATCH] Bug 1143022 - Manually mmap on arm64 to ensure high 17 bits
- are clear. r=ehoogeveen
-
-There might be 48-bit VA on arm64 depending on kernel configuration.
-Manually mmap heap memory to align with the assumption made by JS engine.
-
-Change-Id: Ic5d2b2fe4b758b3c87cc0688348af7e71a991146
-
-Upstream-status: Backport
-
----
- js/src/gc/Memory.cpp | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 71 insertions(+), 2 deletions(-)
-
-diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
-index e5ad018..4149adf 100644
---- a/js/src/gc/Memory.cpp
-+++ b/js/src/gc/Memory.cpp
-@@ -309,6 +309,75 @@ InitMemorySubsystem()
- #endif
- }
- 
-+static inline void *
-+MapMemory(size_t length, int prot, int flags, int fd, off_t offset)
-+{
-+#if defined(__ia64__)
-+    /*
-+     * The JS engine assumes that all allocated pointers have their high 17 bits clear,
-+     * which ia64's mmap doesn't support directly. However, we can emulate it by passing
-+     * mmap an "addr" parameter with those bits clear. The mmap will return that address,
-+     * or the nearest available memory above that address, providing a near-guarantee
-+     * that those bits are clear. If they are not, we return NULL below to indicate
-+     * out-of-memory.
-+     *
-+     * The addr is chosen as 0x0000070000000000, which still allows about 120TB of virtual
-+     * address space.
-+     *
-+     * See Bug 589735 for more information.
-+     */
-+    void *region = mmap((void*)0x0000070000000000, length, prot, flags, fd, offset);
-+    if (region == MAP_FAILED)
-+        return MAP_FAILED;
-+    /*
-+     * If the allocated memory doesn't have its upper 17 bits clear, consider it
-+     * as out of memory.
-+     */
-+    if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
-+        JS_ALWAYS_TRUE(0 == munmap(region, length));
-+        return MAP_FAILED;
-+    }
-+    return region;
-+#elif defined(__aarch64__)
-+   /*
-+    * There might be similar virtual address issue on arm64 which depends on
-+    * hardware and kernel configurations. But the work around is slightly
-+    * different due to the different mmap behavior.
-+    *
-+    * TODO: Merge with the above code block if this implementation works for
-+    * ia64 and sparc64.
-+    */
-+    const uintptr_t start = UINT64_C(0x0000070000000000);
-+    const uintptr_t end   = UINT64_C(0x0000800000000000);
-+    const uintptr_t step  = ChunkSize;
-+   /*
-+    * Optimization options if there are too many retries in practice:
-+    * 1. Examine /proc/self/maps to find an available address. This file is
-+    *    not always available, however. In addition, even if we examine
-+    *    /proc/self/maps, we may still need to retry several times due to
-+    *    racing with other threads.
-+    * 2. Use a global/static variable with lock to track the addresses we have
-+    *    allocated or tried.
-+    */
-+    uintptr_t hint;
-+    void* region = MAP_FAILED;
-+    for (hint = start; region == MAP_FAILED && hint + length <= end; hint += step) {
-+        region = mmap((void*)hint, length, prot, flags, fd, offset);
-+        if (region != MAP_FAILED) {
-+            if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
-+                if (munmap(region, length)) {
-+                    MOZ_ASSERT(errno == ENOMEM);
-+                }
-+                region = MAP_FAILED;
-+            }
-+        }
-+    }
-+    return region == MAP_FAILED ? NULL : region;
-+#else
-+    return mmap(NULL, length, prot, flags, fd, offset);
-+#endif
-+}
-+
- void *
- MapAlignedPages(size_t size, size_t alignment)
- {
-@@ -322,12 +391,12 @@ MapAlignedPages(size_t size, size_t alignment)
- 
-     /* Special case: If we want page alignment, no further work is needed. */
-     if (alignment == PageSize) {
--        return mmap(NULL, size, prot, flags, -1, 0);
-+        return MapMemory(size, prot, flags, -1, 0);
-     }
- 
-     /* Overallocate and unmap the region's edges. */
-     size_t reqSize = Min(size + 2 * alignment, 2 * size);
--    void *region = mmap(NULL, reqSize, prot, flags, -1, 0);
-+    void *region = MapMemory(reqSize, prot, flags, -1, 0);
-     if (region == MAP_FAILED)
-         return NULL;
- 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch b/meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch
deleted file mode 100644
index c5979c9..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch
+++ /dev/null
@@ -1,1732 +0,0 @@
-From b4961d6e1d273dd9643fc3c055163d5cd3362fb7 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 1 Jun 2018 14:47:31 -0700
-Subject: [PATCH] Update double conversion
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- mfbt/double-conversion/COPYING              |  26 ++
- mfbt/double-conversion/bignum-dtoa.cc       |  19 +-
- mfbt/double-conversion/bignum-dtoa.h        |   2 +-
- mfbt/double-conversion/bignum.cc            |  39 +--
- mfbt/double-conversion/bignum.h             |   5 +-
- mfbt/double-conversion/cached-powers.cc     |  14 +-
- mfbt/double-conversion/cached-powers.h      |   2 +-
- mfbt/double-conversion/diy-fp.cc            |   4 +-
- mfbt/double-conversion/diy-fp.h             |  24 +-
- mfbt/double-conversion/double-conversion.cc | 293 ++++++++++++++------
- mfbt/double-conversion/double-conversion.h  |  78 +++---
- mfbt/double-conversion/fast-dtoa.cc         |  29 +-
- mfbt/double-conversion/fast-dtoa.h          |   2 +-
- mfbt/double-conversion/fixed-dtoa.cc        |  23 +-
- mfbt/double-conversion/fixed-dtoa.h         |   2 +-
- mfbt/double-conversion/ieee.h               |   8 +-
- mfbt/double-conversion/strtod.cc            |  59 ++--
- mfbt/double-conversion/strtod.h             |   2 +-
- mfbt/double-conversion/utils.h              |  62 +++--
- 19 files changed, 465 insertions(+), 228 deletions(-)
- create mode 100644 mfbt/double-conversion/COPYING
-
-diff --git a/mfbt/double-conversion/COPYING b/mfbt/double-conversion/COPYING
-new file mode 100644
-index 0000000..933718a
---- /dev/null
-+++ b/mfbt/double-conversion/COPYING
-@@ -0,0 +1,26 @@
-+Copyright 2006-2011, the V8 project authors. All rights reserved.
-+Redistribution and use in source and binary forms, with or without
-+modification, are permitted provided that the following conditions are
-+met:
-+
-+    * Redistributions of source code must retain the above copyright
-+      notice, this list of conditions and the following disclaimer.
-+    * Redistributions in binary form must reproduce the above
-+      copyright notice, this list of conditions and the following
-+      disclaimer in the documentation and/or other materials provided
-+      with the distribution.
-+    * Neither the name of Google Inc. nor the names of its
-+      contributors may be used to endorse or promote products derived
-+      from this software without specific prior written permission.
-+
-+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-diff --git a/mfbt/double-conversion/bignum-dtoa.cc b/mfbt/double-conversion/bignum-dtoa.cc
-index b6c2e85..06bdf55 100644
---- a/mfbt/double-conversion/bignum-dtoa.cc
-+++ b/mfbt/double-conversion/bignum-dtoa.cc
-@@ -25,12 +25,12 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include <math.h>
-+#include <cmath>
- 
--#include "bignum-dtoa.h"
-+#include <bignum-dtoa.h>
- 
--#include "bignum.h"
--#include "ieee.h"
-+#include <bignum.h>
-+#include <ieee.h>
- 
- namespace double_conversion {
- 
-@@ -192,13 +192,13 @@ static void GenerateShortestDigits(Bignum* numerator, Bignum* denominator,
-     delta_plus = delta_minus;
-   }
-   *length = 0;
--  while (true) {
-+  for (;;) {
-     uint16_t digit;
-     digit = numerator->DivideModuloIntBignum(*denominator);
-     ASSERT(digit <= 9);  // digit is a uint16_t and therefore always positive.
-     // digit = numerator / denominator (integer division).
-     // numerator = numerator % denominator.
--    buffer[(*length)++] = digit + '0';
-+    buffer[(*length)++] = static_cast<char>(digit + '0');
- 
-     // Can we stop already?
-     // If the remainder of the division is less than the distance to the lower
-@@ -282,7 +282,7 @@ static void GenerateShortestDigits(Bignum* numerator, Bignum* denominator,
- // exponent (decimal_point), when rounding upwards.
- static void GenerateCountedDigits(int count, int* decimal_point,
-                                   Bignum* numerator, Bignum* denominator,
--                                  Vector<char>(buffer), int* length) {
-+                                  Vector<char> buffer, int* length) {
-   ASSERT(count >= 0);
-   for (int i = 0; i < count - 1; ++i) {
-     uint16_t digit;
-@@ -290,7 +290,7 @@ static void GenerateCountedDigits(int count, int* decimal_point,
-     ASSERT(digit <= 9);  // digit is a uint16_t and therefore always positive.
-     // digit = numerator / denominator (integer division).
-     // numerator = numerator % denominator.
--    buffer[i] = digit + '0';
-+    buffer[i] = static_cast<char>(digit + '0');
-     // Prepare for next iteration.
-     numerator->Times10();
-   }
-@@ -300,7 +300,8 @@ static void GenerateCountedDigits(int count, int* decimal_point,
-   if (Bignum::PlusCompare(*numerator, *numerator, *denominator) >= 0) {
-     digit++;
-   }
--  buffer[count - 1] = digit + '0';
-+  ASSERT(digit <= 10);
-+  buffer[count - 1] = static_cast<char>(digit + '0');
-   // Correct bad digits (in case we had a sequence of '9's). Propagate the
-   // carry until we hat a non-'9' or til we reach the first digit.
-   for (int i = count - 1; i > 0; --i) {
-diff --git a/mfbt/double-conversion/bignum-dtoa.h b/mfbt/double-conversion/bignum-dtoa.h
-index 34b9619..88d936a 100644
---- a/mfbt/double-conversion/bignum-dtoa.h
-+++ b/mfbt/double-conversion/bignum-dtoa.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_BIGNUM_DTOA_H_
- #define DOUBLE_CONVERSION_BIGNUM_DTOA_H_
- 
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-diff --git a/mfbt/double-conversion/bignum.cc b/mfbt/double-conversion/bignum.cc
-index 747491a..4786c2e 100644
---- a/mfbt/double-conversion/bignum.cc
-+++ b/mfbt/double-conversion/bignum.cc
-@@ -25,13 +25,13 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include "bignum.h"
--#include "utils.h"
-+#include <bignum.h>
-+#include <utils.h>
- 
- namespace double_conversion {
- 
- Bignum::Bignum()
--    : bigits_(bigits_buffer_, kBigitCapacity), used_digits_(0), exponent_(0) {
-+    : bigits_buffer_(), bigits_(bigits_buffer_, kBigitCapacity), used_digits_(0), exponent_(0) {
-   for (int i = 0; i < kBigitCapacity; ++i) {
-     bigits_[i] = 0;
-   }
-@@ -40,6 +40,7 @@ Bignum::Bignum()
- 
- template<typename S>
- static int BitSize(S value) {
-+  (void) value;  // Mark variable as used.
-   return 8 * sizeof(value);
- }
- 
-@@ -103,7 +104,7 @@ void Bignum::AssignDecimalString(Vector<const char> value) {
-   const int kMaxUint64DecimalDigits = 19;
-   Zero();
-   int length = value.length();
--  int pos = 0;
-+  unsigned int pos = 0;
-   // Let's just say that each digit needs 4 bits.
-   while (length >= kMaxUint64DecimalDigits) {
-     uint64_t digits = ReadUInt64(value, pos, kMaxUint64DecimalDigits);
-@@ -122,9 +123,8 @@ void Bignum::AssignDecimalString(Vector<const char> value) {
- static int HexCharValue(char c) {
-   if ('0' <= c && c <= '9') return c - '0';
-   if ('a' <= c && c <= 'f') return 10 + c - 'a';
--  if ('A' <= c && c <= 'F') return 10 + c - 'A';
--  UNREACHABLE();
--  return 0;  // To make compiler happy.
-+  ASSERT('A' <= c && c <= 'F');
-+  return 10 + c - 'A';
- }
- 
- 
-@@ -445,26 +445,27 @@ void Bignum::AssignPowerUInt16(uint16_t base, int power_exponent) {
-   mask >>= 2;
-   uint64_t this_value = base;
- 
--  bool delayed_multipliciation = false;
-+  bool delayed_multiplication = false;
-   const uint64_t max_32bits = 0xFFFFFFFF;
-   while (mask != 0 && this_value <= max_32bits) {
-     this_value = this_value * this_value;
-     // Verify that there is enough space in this_value to perform the
-     // multiplication.  The first bit_size bits must be 0.
-     if ((power_exponent & mask) != 0) {
-+      ASSERT(bit_size > 0);
-       uint64_t base_bits_mask =
-           ~((static_cast<uint64_t>(1) << (64 - bit_size)) - 1);
-       bool high_bits_zero = (this_value & base_bits_mask) == 0;
-       if (high_bits_zero) {
-         this_value *= base;
-       } else {
--        delayed_multipliciation = true;
-+        delayed_multiplication = true;
-       }
-     }
-     mask >>= 1;
-   }
-   AssignUInt64(this_value);
--  if (delayed_multipliciation) {
-+  if (delayed_multiplication) {
-     MultiplyByUInt32(base);
-   }
- 
-@@ -501,13 +502,14 @@ uint16_t Bignum::DivideModuloIntBignum(const Bignum& other) {
-   // Start by removing multiples of 'other' until both numbers have the same
-   // number of digits.
-   while (BigitLength() > other.BigitLength()) {
--    // This naive approach is extremely inefficient if the this divided other
--    // might be big. This function is implemented for doubleToString where
-+    // This naive approach is extremely inefficient if `this` divided by other
-+    // is big. This function is implemented for doubleToString where
-     // the result should be small (less than 10).
-     ASSERT(other.bigits_[other.used_digits_ - 1] >= ((1 << kBigitSize) / 16));
-+    ASSERT(bigits_[used_digits_ - 1] < 0x10000);
-     // Remove the multiples of the first digit.
-     // Example this = 23 and other equals 9. -> Remove 2 multiples.
--    result += bigits_[used_digits_ - 1];
-+    result += static_cast<uint16_t>(bigits_[used_digits_ - 1]);
-     SubtractTimes(other, bigits_[used_digits_ - 1]);
-   }
- 
-@@ -523,13 +525,15 @@ uint16_t Bignum::DivideModuloIntBignum(const Bignum& other) {
-     // Shortcut for easy (and common) case.
-     int quotient = this_bigit / other_bigit;
-     bigits_[used_digits_ - 1] = this_bigit - other_bigit * quotient;
--    result += quotient;
-+    ASSERT(quotient < 0x10000);
-+    result += static_cast<uint16_t>(quotient);
-     Clamp();
-     return result;
-   }
- 
-   int division_estimate = this_bigit / (other_bigit + 1);
--  result += division_estimate;
-+  ASSERT(division_estimate < 0x10000);
-+  result += static_cast<uint16_t>(division_estimate);
-   SubtractTimes(other, division_estimate);
- 
-   if (other_bigit * (division_estimate + 1) > this_bigit) {
-@@ -560,8 +564,8 @@ static int SizeInHexChars(S number) {
- 
- static char HexCharOfValue(int value) {
-   ASSERT(0 <= value && value <= 16);
--  if (value < 10) return value + '0';
--  return value - 10 + 'A';
-+  if (value < 10) return static_cast<char>(value + '0');
-+  return static_cast<char>(value - 10 + 'A');
- }
- 
- 
-@@ -755,7 +759,6 @@ void Bignum::SubtractTimes(const Bignum& other, int factor) {
-     Chunk difference = bigits_[i] - borrow;
-     bigits_[i] = difference & kBigitMask;
-     borrow = difference >> (kChunkSize - 1);
--    ++i;
-   }
-   Clamp();
- }
-diff --git a/mfbt/double-conversion/bignum.h b/mfbt/double-conversion/bignum.h
-index 5ec3544..4fdad0c 100644
---- a/mfbt/double-conversion/bignum.h
-+++ b/mfbt/double-conversion/bignum.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_BIGNUM_H_
- #define DOUBLE_CONVERSION_BIGNUM_H_
- 
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-@@ -49,7 +49,6 @@ class Bignum {
- 
-   void AssignPowerUInt16(uint16_t base, int exponent);
- 
--  void AddUInt16(uint16_t operand);
-   void AddUInt64(uint64_t operand);
-   void AddBignum(const Bignum& other);
-   // Precondition: this >= other.
-@@ -137,7 +136,7 @@ class Bignum {
-   // The Bignum's value equals value(bigits_) * 2^(exponent_ * kBigitSize).
-   int exponent_;
- 
--  DISALLOW_COPY_AND_ASSIGN(Bignum);
-+  DC_DISALLOW_COPY_AND_ASSIGN(Bignum);
- };
- 
- }  // namespace double_conversion
-diff --git a/mfbt/double-conversion/cached-powers.cc b/mfbt/double-conversion/cached-powers.cc
-index c676429..06e819d 100644
---- a/mfbt/double-conversion/cached-powers.cc
-+++ b/mfbt/double-conversion/cached-powers.cc
-@@ -25,13 +25,13 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include <stdarg.h>
--#include <limits.h>
--#include <math.h>
-+#include <climits>
-+#include <cmath>
-+#include <cstdarg>
- 
--#include "utils.h"
-+#include <utils.h>
- 
--#include "cached-powers.h"
-+#include <cached-powers.h>
- 
- namespace double_conversion {
- 
-@@ -131,7 +131,6 @@ static const CachedPower kCachedPowers[] = {
-   {UINT64_2PART_C(0xaf87023b, 9bf0ee6b), 1066, 340},
- };
- 
--static const int kCachedPowersLength = ARRAY_SIZE(kCachedPowers);
- static const int kCachedPowersOffset = 348;  // -1 * the first decimal_exponent.
- static const double kD_1_LOG2_10 = 0.30102999566398114;  //  1 / lg(10)
- // Difference between the decimal exponents in the table above.
-@@ -149,9 +148,10 @@ void PowersOfTenCache::GetCachedPowerForBinaryExponentRange(
-   int foo = kCachedPowersOffset;
-   int index =
-       (foo + static_cast<int>(k) - 1) / kDecimalExponentDistance + 1;
--  ASSERT(0 <= index && index < kCachedPowersLength);
-+  ASSERT(0 <= index && index < static_cast<int>(ARRAY_SIZE(kCachedPowers)));
-   CachedPower cached_power = kCachedPowers[index];
-   ASSERT(min_exponent <= cached_power.binary_exponent);
-+  (void) max_exponent;  // Mark variable as used.
-   ASSERT(cached_power.binary_exponent <= max_exponent);
-   *decimal_exponent = cached_power.decimal_exponent;
-   *power = DiyFp(cached_power.significand, cached_power.binary_exponent);
-diff --git a/mfbt/double-conversion/cached-powers.h b/mfbt/double-conversion/cached-powers.h
-index 61a5061..a425d7c 100644
---- a/mfbt/double-conversion/cached-powers.h
-+++ b/mfbt/double-conversion/cached-powers.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_CACHED_POWERS_H_
- #define DOUBLE_CONVERSION_CACHED_POWERS_H_
- 
--#include "diy-fp.h"
-+#include <diy-fp.h>
- 
- namespace double_conversion {
- 
-diff --git a/mfbt/double-conversion/diy-fp.cc b/mfbt/double-conversion/diy-fp.cc
-index ddd1891..f31cf60 100644
---- a/mfbt/double-conversion/diy-fp.cc
-+++ b/mfbt/double-conversion/diy-fp.cc
-@@ -26,8 +26,8 @@
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
- 
--#include "diy-fp.h"
--#include "utils.h"
-+#include <diy-fp.h>
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-diff --git a/mfbt/double-conversion/diy-fp.h b/mfbt/double-conversion/diy-fp.h
-index 9dcf8fb..80a8c4c 100644
---- a/mfbt/double-conversion/diy-fp.h
-+++ b/mfbt/double-conversion/diy-fp.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_DIY_FP_H_
- #define DOUBLE_CONVERSION_DIY_FP_H_
- 
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-@@ -42,7 +42,7 @@ class DiyFp {
-   static const int kSignificandSize = 64;
- 
-   DiyFp() : f_(0), e_(0) {}
--  DiyFp(uint64_t f, int e) : f_(f), e_(e) {}
-+  DiyFp(uint64_t significand, int exponent) : f_(significand), e_(exponent) {}
- 
-   // this = this - other.
-   // The exponents of both numbers must be the same and the significand of this
-@@ -76,22 +76,22 @@ class DiyFp {
- 
-   void Normalize() {
-     ASSERT(f_ != 0);
--    uint64_t f = f_;
--    int e = e_;
-+    uint64_t significand = f_;
-+    int exponent = e_;
- 
-     // This method is mainly called for normalizing boundaries. In general
-     // boundaries need to be shifted by 10 bits. We thus optimize for this case.
-     const uint64_t k10MSBits = UINT64_2PART_C(0xFFC00000, 00000000);
--    while ((f & k10MSBits) == 0) {
--      f <<= 10;
--      e -= 10;
-+    while ((significand & k10MSBits) == 0) {
-+      significand <<= 10;
-+      exponent -= 10;
-     }
--    while ((f & kUint64MSB) == 0) {
--      f <<= 1;
--      e--;
-+    while ((significand & kUint64MSB) == 0) {
-+      significand <<= 1;
-+      exponent--;
-     }
--    f_ = f;
--    e_ = e;
-+    f_ = significand;
-+    e_ = exponent;
-   }
- 
-   static DiyFp Normalize(const DiyFp& a) {
-diff --git a/mfbt/double-conversion/double-conversion.cc b/mfbt/double-conversion/double-conversion.cc
-index 650137b..7819267 100644
---- a/mfbt/double-conversion/double-conversion.cc
-+++ b/mfbt/double-conversion/double-conversion.cc
-@@ -25,17 +25,18 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include <limits.h>
--#include <math.h>
-+#include <climits>
-+#include <locale>
-+#include <cmath>
- 
--#include "double-conversion.h"
-+#include <double-conversion.h>
- 
--#include "bignum-dtoa.h"
--#include "fast-dtoa.h"
--#include "fixed-dtoa.h"
--#include "ieee.h"
--#include "strtod.h"
--#include "utils.h"
-+#include <bignum-dtoa.h>
-+#include <fast-dtoa.h>
-+#include <fixed-dtoa.h>
-+#include <ieee.h>
-+#include <strtod.h>
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-@@ -118,7 +119,7 @@ void DoubleToStringConverter::CreateDecimalRepresentation(
-     StringBuilder* result_builder) const {
-   // Create a representation that is padded with zeros if needed.
-   if (decimal_point <= 0) {
--      // "0.00000decimal_rep".
-+      // "0.00000decimal_rep" or "0.000decimal_rep00".
-     result_builder->AddCharacter('0');
-     if (digits_after_point > 0) {
-       result_builder->AddCharacter('.');
-@@ -129,7 +130,7 @@ void DoubleToStringConverter::CreateDecimalRepresentation(
-       result_builder->AddPadding('0', remaining_digits);
-     }
-   } else if (decimal_point >= length) {
--    // "decimal_rep0000.00000" or "decimal_rep.0000"
-+    // "decimal_rep0000.00000" or "decimal_rep.0000".
-     result_builder->AddSubstring(decimal_digits, length);
-     result_builder->AddPadding('0', decimal_point - length);
-     if (digits_after_point > 0) {
-@@ -137,7 +138,7 @@ void DoubleToStringConverter::CreateDecimalRepresentation(
-       result_builder->AddPadding('0', digits_after_point);
-     }
-   } else {
--    // "decima.l_rep000"
-+    // "decima.l_rep000".
-     ASSERT(digits_after_point > 0);
-     result_builder->AddSubstring(decimal_digits, decimal_point);
-     result_builder->AddCharacter('.');
-@@ -162,7 +163,7 @@ bool DoubleToStringConverter::ToShortestIeeeNumber(
-     double value,
-     StringBuilder* result_builder,
-     DoubleToStringConverter::DtoaMode mode) const {
--  assert(mode == SHORTEST || mode == SHORTEST_SINGLE);
-+  ASSERT(mode == SHORTEST || mode == SHORTEST_SINGLE);
-   if (Double(value).IsSpecial()) {
-     return HandleSpecialValues(value, result_builder);
-   }
-@@ -348,7 +349,6 @@ static BignumDtoaMode DtoaToBignumDtoaMode(
-     case DoubleToStringConverter::PRECISION: return BIGNUM_DTOA_PRECISION;
-     default:
-       UNREACHABLE();
--      return BIGNUM_DTOA_SHORTEST;  // To silence compiler.
-   }
- }
- 
-@@ -403,8 +403,8 @@ void DoubleToStringConverter::DoubleToAscii(double v,
-                              vector, length, point);
-       break;
-     default:
--      UNREACHABLE();
-       fast_worked = false;
-+      UNREACHABLE();
-   }
-   if (fast_worked) return;
- 
-@@ -415,20 +415,55 @@ void DoubleToStringConverter::DoubleToAscii(double v,
- }
- 
- 
--// Consumes the given substring from the iterator.
--// Returns false, if the substring does not match.
--static bool ConsumeSubString(const char** current,
--                             const char* end,
--                             const char* substring) {
--  ASSERT(**current == *substring);
-+namespace {
-+
-+inline char ToLower(char ch) {
-+  static const std::ctype<char>& cType =
-+      std::use_facet<std::ctype<char> >(std::locale::classic());
-+  return cType.tolower(ch);
-+}
-+
-+inline char Pass(char ch) {
-+  return ch;
-+}
-+
-+template <class Iterator, class Converter>
-+static inline bool ConsumeSubStringImpl(Iterator* current,
-+                                        Iterator end,
-+                                        const char* substring,
-+                                        Converter converter) {
-+  ASSERT(converter(**current) == *substring);
-   for (substring++; *substring != '\0'; substring++) {
-     ++*current;
--    if (*current == end || **current != *substring) return false;
-+    if (*current == end || converter(**current) != *substring) {
-+      return false;
-+    }
-   }
-   ++*current;
-   return true;
- }
- 
-+// Consumes the given substring from the iterator.
-+// Returns false, if the substring does not match.
-+template <class Iterator>
-+static bool ConsumeSubString(Iterator* current,
-+                             Iterator end,
-+                             const char* substring,
-+                             bool allow_case_insensibility) {
-+  if (allow_case_insensibility) {
-+    return ConsumeSubStringImpl(current, end, substring, ToLower);
-+  } else {
-+    return ConsumeSubStringImpl(current, end, substring, Pass);
-+  }
-+}
-+
-+// Consumes first character of the str is equal to ch
-+inline bool ConsumeFirstCharacter(char ch,
-+                                         const char* str,
-+                                         bool case_insensibility) {
-+  return case_insensibility ? ToLower(ch) == str[0] : ch == str[0];
-+}
-+}  // namespace
- 
- // Maximum number of significant digits in decimal representation.
- // The longest possible double in decimal representation is
-@@ -440,10 +475,36 @@ static bool ConsumeSubString(const char** current,
- const int kMaxSignificantDigits = 772;
- 
- 
-+static const char kWhitespaceTable7[] = { 32, 13, 10, 9, 11, 12 };
-+static const int kWhitespaceTable7Length = ARRAY_SIZE(kWhitespaceTable7);
-+
-+
-+static const uc16 kWhitespaceTable16[] = {
-+  160, 8232, 8233, 5760, 6158, 8192, 8193, 8194, 8195,
-+  8196, 8197, 8198, 8199, 8200, 8201, 8202, 8239, 8287, 12288, 65279
-+};
-+static const int kWhitespaceTable16Length = ARRAY_SIZE(kWhitespaceTable16);
-+
-+
-+static bool isWhitespace(int x) {
-+  if (x < 128) {
-+    for (int i = 0; i < kWhitespaceTable7Length; i++) {
-+      if (kWhitespaceTable7[i] == x) return true;
-+    }
-+  } else {
-+    for (int i = 0; i < kWhitespaceTable16Length; i++) {
-+      if (kWhitespaceTable16[i] == x) return true;
-+    }
-+  }
-+  return false;
-+}
-+
-+
- // Returns true if a nonspace found and false if the end has reached.
--static inline bool AdvanceToNonspace(const char** current, const char* end) {
-+template <class Iterator>
-+static inline bool AdvanceToNonspace(Iterator* current, Iterator end) {
-   while (*current != end) {
--    if (**current != ' ') return true;
-+    if (!isWhitespace(**current)) return true;
-     ++*current;
-   }
-   return false;
-@@ -462,26 +523,57 @@ static double SignedZero(bool sign) {
- }
- 
- 
-+// Returns true if 'c' is a decimal digit that is valid for the given radix.
-+//
-+// The function is small and could be inlined, but VS2012 emitted a warning
-+// because it constant-propagated the radix and concluded that the last
-+// condition was always true. By moving it into a separate function the
-+// compiler wouldn't warn anymore.
-+#if _MSC_VER
-+#pragma optimize("",off)
-+static bool IsDecimalDigitForRadix(int c, int radix) {
-+  return '0' <= c && c <= '9' && (c - '0') < radix;
-+}
-+#pragma optimize("",on)
-+#else
-+static bool inline IsDecimalDigitForRadix(int c, int radix) {
-+ return '0' <= c && c <= '9' && (c - '0') < radix;
-+}
-+#endif
-+// Returns true if 'c' is a character digit that is valid for the given radix.
-+// The 'a_character' should be 'a' or 'A'.
-+//
-+// The function is small and could be inlined, but VS2012 emitted a warning
-+// because it constant-propagated the radix and concluded that the first
-+// condition was always false. By moving it into a separate function the
-+// compiler wouldn't warn anymore.
-+static bool IsCharacterDigitForRadix(int c, int radix, char a_character) {
-+  return radix > 10 && c >= a_character && c < a_character + radix - 10;
-+}
-+
-+
- // Parsing integers with radix 2, 4, 8, 16, 32. Assumes current != end.
--template <int radix_log_2>
--static double RadixStringToIeee(const char* current,
--                                const char* end,
-+template <int radix_log_2, class Iterator>
-+static double RadixStringToIeee(Iterator* current,
-+                                Iterator end,
-                                 bool sign,
-                                 bool allow_trailing_junk,
-                                 double junk_string_value,
-                                 bool read_as_double,
--                                const char** trailing_pointer) {
--  ASSERT(current != end);
-+                                bool* result_is_junk) {
-+  ASSERT(*current != end);
- 
-   const int kDoubleSize = Double::kSignificandSize;
-   const int kSingleSize = Single::kSignificandSize;
-   const int kSignificandSize = read_as_double? kDoubleSize: kSingleSize;
- 
-+  *result_is_junk = true;
-+
-   // Skip leading 0s.
--  while (*current == '0') {
--    ++current;
--    if (current == end) {
--      *trailing_pointer = end;
-+  while (**current == '0') {
-+    ++(*current);
-+    if (*current == end) {
-+      *result_is_junk = false;
-       return SignedZero(sign);
-     }
-   }
-@@ -492,14 +584,14 @@ static double RadixStringToIeee(const char* current,
- 
-   do {
-     int digit;
--    if (*current >= '0' && *current <= '9' && *current < '0' + radix) {
--      digit = static_cast<char>(*current) - '0';
--    } else if (radix > 10 && *current >= 'a' && *current < 'a' + radix - 10) {
--      digit = static_cast<char>(*current) - 'a' + 10;
--    } else if (radix > 10 && *current >= 'A' && *current < 'A' + radix - 10) {
--      digit = static_cast<char>(*current) - 'A' + 10;
-+    if (IsDecimalDigitForRadix(**current, radix)) {
-+      digit = static_cast<char>(**current) - '0';
-+    } else if (IsCharacterDigitForRadix(**current, radix, 'a')) {
-+      digit = static_cast<char>(**current) - 'a' + 10;
-+    } else if (IsCharacterDigitForRadix(**current, radix, 'A')) {
-+      digit = static_cast<char>(**current) - 'A' + 10;
-     } else {
--      if (allow_trailing_junk || !AdvanceToNonspace(&current, end)) {
-+      if (allow_trailing_junk || !AdvanceToNonspace(current, end)) {
-         break;
-       } else {
-         return junk_string_value;
-@@ -523,14 +615,14 @@ static double RadixStringToIeee(const char* current,
-       exponent = overflow_bits_count;
- 
-       bool zero_tail = true;
--      while (true) {
--        ++current;
--        if (current == end || !isDigit(*current, radix)) break;
--        zero_tail = zero_tail && *current == '0';
-+      for (;;) {
-+        ++(*current);
-+        if (*current == end || !isDigit(**current, radix)) break;
-+        zero_tail = zero_tail && **current == '0';
-         exponent += radix_log_2;
-       }
- 
--      if (!allow_trailing_junk && AdvanceToNonspace(&current, end)) {
-+      if (!allow_trailing_junk && AdvanceToNonspace(current, end)) {
-         return junk_string_value;
-       }
- 
-@@ -552,13 +644,13 @@ static double RadixStringToIeee(const char* current,
-       }
-       break;
-     }
--    ++current;
--  } while (current != end);
-+    ++(*current);
-+  } while (*current != end);
- 
-   ASSERT(number < ((int64_t)1 << kSignificandSize));
-   ASSERT(static_cast<int64_t>(static_cast<double>(number)) == number);
- 
--  *trailing_pointer = current;
-+  *result_is_junk = false;
- 
-   if (exponent == 0) {
-     if (sign) {
-@@ -572,14 +664,14 @@ static double RadixStringToIeee(const char* current,
-   return Double(DiyFp(number, exponent)).value();
- }
- 
--
-+template <class Iterator>
- double StringToDoubleConverter::StringToIeee(
--    const char* input,
-+    Iterator input,
-     int length,
--    int* processed_characters_count,
--    bool read_as_double) {
--  const char* current = input;
--  const char* end = input + length;
-+    bool read_as_double,
-+    int* processed_characters_count) const {
-+  Iterator current = input;
-+  Iterator end = input + length;
- 
-   *processed_characters_count = 0;
- 
-@@ -587,6 +679,8 @@ double StringToDoubleConverter::StringToIeee(
-   const bool allow_leading_spaces = (flags_ & ALLOW_LEADING_SPACES) != 0;
-   const bool allow_trailing_spaces = (flags_ & ALLOW_TRAILING_SPACES) != 0;
-   const bool allow_spaces_after_sign = (flags_ & ALLOW_SPACES_AFTER_SIGN) != 0;
-+  const bool allow_case_insensibility = (flags_ & ALLOW_CASE_INSENSIBILITY) != 0;
-+
- 
-   // To make sure that iterator dereferencing is valid the following
-   // convention is used:
-@@ -600,7 +694,7 @@ double StringToDoubleConverter::StringToIeee(
- 
-   if (allow_leading_spaces || allow_trailing_spaces) {
-     if (!AdvanceToNonspace(&current, end)) {
--      *processed_characters_count = current - input;
-+      *processed_characters_count = static_cast<int>(current - input);
-       return empty_string_value_;
-     }
-     if (!allow_leading_spaces && (input != current)) {
-@@ -626,7 +720,7 @@ double StringToDoubleConverter::StringToIeee(
-   if (*current == '+' || *current == '-') {
-     sign = (*current == '-');
-     ++current;
--    const char* next_non_space = current;
-+    Iterator next_non_space = current;
-     // Skip following spaces (if allowed).
-     if (!AdvanceToNonspace(&next_non_space, end)) return junk_string_value_;
-     if (!allow_spaces_after_sign && (current != next_non_space)) {
-@@ -636,8 +730,8 @@ double StringToDoubleConverter::StringToIeee(
-   }
- 
-   if (infinity_symbol_ != NULL) {
--    if (*current == infinity_symbol_[0]) {
--      if (!ConsumeSubString(&current, end, infinity_symbol_)) {
-+    if (ConsumeFirstCharacter(*current, infinity_symbol_, allow_case_insensibility)) {
-+      if (!ConsumeSubString(&current, end, infinity_symbol_, allow_case_insensibility)) {
-         return junk_string_value_;
-       }
- 
-@@ -649,14 +743,14 @@ double StringToDoubleConverter::StringToIeee(
-       }
- 
-       ASSERT(buffer_pos == 0);
--      *processed_characters_count = current - input;
-+      *processed_characters_count = static_cast<int>(current - input);
-       return sign ? -Double::Infinity() : Double::Infinity();
-     }
-   }
- 
-   if (nan_symbol_ != NULL) {
--    if (*current == nan_symbol_[0]) {
--      if (!ConsumeSubString(&current, end, nan_symbol_)) {
-+    if (ConsumeFirstCharacter(*current, nan_symbol_, allow_case_insensibility)) {
-+      if (!ConsumeSubString(&current, end, nan_symbol_, allow_case_insensibility)) {
-         return junk_string_value_;
-       }
- 
-@@ -668,7 +762,7 @@ double StringToDoubleConverter::StringToIeee(
-       }
- 
-       ASSERT(buffer_pos == 0);
--      *processed_characters_count = current - input;
-+      *processed_characters_count = static_cast<int>(current - input);
-       return sign ? -Double::NaN() : Double::NaN();
-     }
-   }
-@@ -677,7 +771,7 @@ double StringToDoubleConverter::StringToIeee(
-   if (*current == '0') {
-     ++current;
-     if (current == end) {
--      *processed_characters_count = current - input;
-+      *processed_characters_count = static_cast<int>(current - input);
-       return SignedZero(sign);
-     }
- 
-@@ -690,17 +784,17 @@ double StringToDoubleConverter::StringToIeee(
-         return junk_string_value_;  // "0x".
-       }
- 
--      const char* tail_pointer = NULL;
--      double result = RadixStringToIeee<4>(current,
-+      bool result_is_junk;
-+      double result = RadixStringToIeee<4>(&current,
-                                            end,
-                                            sign,
-                                            allow_trailing_junk,
-                                            junk_string_value_,
-                                            read_as_double,
--                                           &tail_pointer);
--      if (tail_pointer != NULL) {
--        if (allow_trailing_spaces) AdvanceToNonspace(&tail_pointer, end);
--        *processed_characters_count = tail_pointer - input;
-+                                           &result_is_junk);
-+      if (!result_is_junk) {
-+        if (allow_trailing_spaces) AdvanceToNonspace(&current, end);
-+        *processed_characters_count = static_cast<int>(current - input);
-       }
-       return result;
-     }
-@@ -709,7 +803,7 @@ double StringToDoubleConverter::StringToIeee(
-     while (*current == '0') {
-       ++current;
-       if (current == end) {
--        *processed_characters_count = current - input;
-+        *processed_characters_count = static_cast<int>(current - input);
-         return SignedZero(sign);
-       }
-     }
-@@ -757,7 +851,7 @@ double StringToDoubleConverter::StringToIeee(
-       while (*current == '0') {
-         ++current;
-         if (current == end) {
--          *processed_characters_count = current - input;
-+          *processed_characters_count = static_cast<int>(current - input);
-           return SignedZero(sign);
-         }
-         exponent--;  // Move this 0 into the exponent.
-@@ -793,20 +887,23 @@ double StringToDoubleConverter::StringToIeee(
-   if (*current == 'e' || *current == 'E') {
-     if (octal && !allow_trailing_junk) return junk_string_value_;
-     if (octal) goto parsing_done;
-+    Iterator junk_begin = current;
-     ++current;
-     if (current == end) {
-       if (allow_trailing_junk) {
-+        current = junk_begin;
-         goto parsing_done;
-       } else {
-         return junk_string_value_;
-       }
-     }
--    char sign = '+';
-+    char exponen_sign = '+';
-     if (*current == '+' || *current == '-') {
--      sign = static_cast<char>(*current);
-+      exponen_sign = static_cast<char>(*current);
-       ++current;
-       if (current == end) {
-         if (allow_trailing_junk) {
-+          current = junk_begin;
-           goto parsing_done;
-         } else {
-           return junk_string_value_;
-@@ -816,6 +913,7 @@ double StringToDoubleConverter::StringToIeee(
- 
-     if (current == end || *current < '0' || *current > '9') {
-       if (allow_trailing_junk) {
-+        current = junk_begin;
-         goto parsing_done;
-       } else {
-         return junk_string_value_;
-@@ -837,7 +935,7 @@ double StringToDoubleConverter::StringToIeee(
-       ++current;
-     } while (current != end && *current >= '0' && *current <= '9');
- 
--    exponent += (sign == '-' ? -num : num);
-+    exponent += (exponen_sign == '-' ? -num : num);
-   }
- 
-   if (!(allow_trailing_spaces || allow_trailing_junk) && (current != end)) {
-@@ -855,16 +953,17 @@ double StringToDoubleConverter::StringToIeee(
- 
-   if (octal) {
-     double result;
--    const char* tail_pointer = NULL;
--    result = RadixStringToIeee<3>(buffer,
-+    bool result_is_junk;
-+    char* start = buffer;
-+    result = RadixStringToIeee<3>(&start,
-                                   buffer + buffer_pos,
-                                   sign,
-                                   allow_trailing_junk,
-                                   junk_string_value_,
-                                   read_as_double,
--                                  &tail_pointer);
--    ASSERT(tail_pointer != NULL);
--    *processed_characters_count = current - input;
-+                                  &result_is_junk);
-+    ASSERT(!result_is_junk);
-+    *processed_characters_count = static_cast<int>(current - input);
-     return result;
-   }
- 
-@@ -882,8 +981,42 @@ double StringToDoubleConverter::StringToIeee(
-   } else {
-     converted = Strtof(Vector<const char>(buffer, buffer_pos), exponent);
-   }
--  *processed_characters_count = current - input;
-+  *processed_characters_count = static_cast<int>(current - input);
-   return sign? -converted: converted;
- }
- 
-+
-+double StringToDoubleConverter::StringToDouble(
-+    const char* buffer,
-+    int length,
-+    int* processed_characters_count) const {
-+  return StringToIeee(buffer, length, true, processed_characters_count);
-+}
-+
-+
-+double StringToDoubleConverter::StringToDouble(
-+    const uc16* buffer,
-+    int length,
-+    int* processed_characters_count) const {
-+  return StringToIeee(buffer, length, true, processed_characters_count);
-+}
-+
-+
-+float StringToDoubleConverter::StringToFloat(
-+    const char* buffer,
-+    int length,
-+    int* processed_characters_count) const {
-+  return static_cast<float>(StringToIeee(buffer, length, false,
-+                                         processed_characters_count));
-+}
-+
-+
-+float StringToDoubleConverter::StringToFloat(
-+    const uc16* buffer,
-+    int length,
-+    int* processed_characters_count) const {
-+  return static_cast<float>(StringToIeee(buffer, length, false,
-+                                         processed_characters_count));
-+}
-+
- }  // namespace double_conversion
-diff --git a/mfbt/double-conversion/double-conversion.h b/mfbt/double-conversion/double-conversion.h
-index 0e7226d..e66a566 100644
---- a/mfbt/double-conversion/double-conversion.h
-+++ b/mfbt/double-conversion/double-conversion.h
-@@ -28,8 +28,7 @@
- #ifndef DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
- #define DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
- 
--#include "mozilla/Types.h"
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-@@ -130,7 +129,7 @@ class DoubleToStringConverter {
-   }
- 
-   // Returns a converter following the EcmaScript specification.
--  static MFBT_API(const DoubleToStringConverter&) EcmaScriptConverter();
-+  static const DoubleToStringConverter& EcmaScriptConverter();
- 
-   // Computes the shortest string of digits that correctly represent the input
-   // number. Depending on decimal_in_shortest_low and decimal_in_shortest_high
-@@ -198,7 +197,7 @@ class DoubleToStringConverter {
-   // The last two conditions imply that the result will never contain more than
-   // 1 + kMaxFixedDigitsBeforePoint + 1 + kMaxFixedDigitsAfterPoint characters
-   // (one additional character for the sign, and one for the decimal point).
--  MFBT_API(bool) ToFixed(double value,
-+  bool ToFixed(double value,
-                int requested_digits,
-                StringBuilder* result_builder) const;
- 
-@@ -230,7 +229,7 @@ class DoubleToStringConverter {
-   // kMaxExponentialDigits + 8 characters (the sign, the digit before the
-   // decimal point, the decimal point, the exponent character, the
-   // exponent's sign, and at most 3 exponent digits).
--  MFBT_API(bool) ToExponential(double value,
-+  bool ToExponential(double value,
-                      int requested_digits,
-                      StringBuilder* result_builder) const;
- 
-@@ -268,7 +267,7 @@ class DoubleToStringConverter {
-   // The last condition implies that the result will never contain more than
-   // kMaxPrecisionDigits + 7 characters (the sign, the decimal point, the
-   // exponent character, the exponent's sign, and at most 3 exponent digits).
--  MFBT_API(bool) ToPrecision(double value,
-+  bool ToPrecision(double value,
-                    int precision,
-                    StringBuilder* result_builder) const;
- 
-@@ -293,15 +292,20 @@ class DoubleToStringConverter {
-   // kBase10MaximalLength.
-   // Note that DoubleToAscii null-terminates its input. So the given buffer
-   // should be at least kBase10MaximalLength + 1 characters long.
--  static const MFBT_DATA(int) kBase10MaximalLength = 17;
-+  static const int kBase10MaximalLength = 17;
- 
--  // Converts the given double 'v' to ascii. 'v' must not be NaN, +Infinity, or
--  // -Infinity. In SHORTEST_SINGLE-mode this restriction also applies to 'v'
--  // after it has been casted to a single-precision float. That is, in this
--  // mode static_cast<float>(v) must not be NaN, +Infinity or -Infinity.
-+  // Converts the given double 'v' to digit characters. 'v' must not be NaN,
-+  // +Infinity, or -Infinity. In SHORTEST_SINGLE-mode this restriction also
-+  // applies to 'v' after it has been casted to a single-precision float. That
-+  // is, in this mode static_cast<float>(v) must not be NaN, +Infinity or
-+  // -Infinity.
-   //
-   // The result should be interpreted as buffer * 10^(point-length).
-   //
-+  // The digits are written to the buffer in the platform's charset, which is
-+  // often UTF-8 (with ASCII-range digits) but may be another charset, such
-+  // as EBCDIC.
-+  //
-   // The output depends on the given mode:
-   //  - SHORTEST: produce the least amount of digits for which the internal
-   //   identity requirement is still satisfied. If the digits are printed
-@@ -333,7 +337,7 @@ class DoubleToStringConverter {
-   // terminating null-character when computing the maximal output size.
-   // The given length is only used in debug mode to ensure the buffer is big
-   // enough.
--  static MFBT_API(void) DoubleToAscii(double v,
-+  static void DoubleToAscii(double v,
-                             DtoaMode mode,
-                             int requested_digits,
-                             char* buffer,
-@@ -344,7 +348,7 @@ class DoubleToStringConverter {
- 
-  private:
-   // Implementation for ToShortest and ToShortestSingle.
--  MFBT_API(bool) ToShortestIeeeNumber(double value,
-+  bool ToShortestIeeeNumber(double value,
-                             StringBuilder* result_builder,
-                             DtoaMode mode) const;
- 
-@@ -352,15 +356,15 @@ class DoubleToStringConverter {
-   // corresponding string using the configured infinity/nan-symbol.
-   // If either of them is NULL or the value is not special then the
-   // function returns false.
--  MFBT_API(bool) HandleSpecialValues(double value, StringBuilder* result_builder) const;
-+  bool HandleSpecialValues(double value, StringBuilder* result_builder) const;
-   // Constructs an exponential representation (i.e. 1.234e56).
-   // The given exponent assumes a decimal point after the first decimal digit.
--  MFBT_API(void) CreateExponentialRepresentation(const char* decimal_digits,
-+  void CreateExponentialRepresentation(const char* decimal_digits,
-                                        int length,
-                                        int exponent,
-                                        StringBuilder* result_builder) const;
-   // Creates a decimal representation (i.e 1234.5678).
--  MFBT_API(void) CreateDecimalRepresentation(const char* decimal_digits,
-+  void CreateDecimalRepresentation(const char* decimal_digits,
-                                    int length,
-                                    int decimal_point,
-                                    int digits_after_point,
-@@ -375,7 +379,7 @@ class DoubleToStringConverter {
-   const int max_leading_padding_zeroes_in_precision_mode_;
-   const int max_trailing_padding_zeroes_in_precision_mode_;
- 
--  DISALLOW_IMPLICIT_CONSTRUCTORS(DoubleToStringConverter);
-+  DC_DISALLOW_IMPLICIT_CONSTRUCTORS(DoubleToStringConverter);
- };
- 
- 
-@@ -390,7 +394,8 @@ class StringToDoubleConverter {
-     ALLOW_TRAILING_JUNK = 4,
-     ALLOW_LEADING_SPACES = 8,
-     ALLOW_TRAILING_SPACES = 16,
--    ALLOW_SPACES_AFTER_SIGN = 32
-+    ALLOW_SPACES_AFTER_SIGN = 32,
-+    ALLOW_CASE_INSENSIBILITY = 64,
-   };
- 
-   // Flags should be a bit-or combination of the possible Flags-enum.
-@@ -416,11 +421,14 @@ class StringToDoubleConverter {
-   //          junk, too.
-   //  - ALLOW_TRAILING_JUNK: ignore trailing characters that are not part of
-   //      a double literal.
--  //  - ALLOW_LEADING_SPACES: skip over leading spaces.
--  //  - ALLOW_TRAILING_SPACES: ignore trailing spaces.
--  //  - ALLOW_SPACES_AFTER_SIGN: ignore spaces after the sign.
-+  //  - ALLOW_LEADING_SPACES: skip over leading whitespace, including spaces,
-+  //                          new-lines, and tabs.
-+  //  - ALLOW_TRAILING_SPACES: ignore trailing whitespace.
-+  //  - ALLOW_SPACES_AFTER_SIGN: ignore whitespace after the sign.
-   //       Ex: StringToDouble("-   123.2") -> -123.2.
-   //           StringToDouble("+   123.2") -> 123.2
-+  //  - ALLOW_CASE_INSENSIBILITY: ignore case of characters for special values:
-+  //      infinity and nan.
-   //
-   // empty_string_value is returned when an empty string is given as input.
-   // If ALLOW_LEADING_SPACES or ALLOW_TRAILING_SPACES are set, then a string
-@@ -503,19 +511,24 @@ class StringToDoubleConverter {
-   // in the 'processed_characters_count'. Trailing junk is never included.
-   double StringToDouble(const char* buffer,
-                         int length,
--                        int* processed_characters_count) {
--    return StringToIeee(buffer, length, processed_characters_count, true);
--  }
-+                        int* processed_characters_count) const;
-+
-+  // Same as StringToDouble above but for 16 bit characters.
-+  double StringToDouble(const uc16* buffer,
-+                        int length,
-+                        int* processed_characters_count) const;
- 
-   // Same as StringToDouble but reads a float.
-   // Note that this is not equivalent to static_cast<float>(StringToDouble(...))
-   // due to potential double-rounding.
-   float StringToFloat(const char* buffer,
-                       int length,
--                      int* processed_characters_count) {
--    return static_cast<float>(StringToIeee(buffer, length,
--                                           processed_characters_count, false));
--  }
-+                      int* processed_characters_count) const;
-+
-+  // Same as StringToFloat above but for 16 bit characters.
-+  float StringToFloat(const uc16* buffer,
-+                      int length,
-+                      int* processed_characters_count) const;
- 
-  private:
-   const int flags_;
-@@ -524,12 +537,13 @@ class StringToDoubleConverter {
-   const char* const infinity_symbol_;
-   const char* const nan_symbol_;
- 
--  double StringToIeee(const char* buffer,
-+  template <class Iterator>
-+  double StringToIeee(Iterator start_pointer,
-                       int length,
--                      int* processed_characters_count,
--                      bool read_as_double);
-+                      bool read_as_double,
-+                      int* processed_characters_count) const;
- 
--  DISALLOW_IMPLICIT_CONSTRUCTORS(StringToDoubleConverter);
-+  DC_DISALLOW_IMPLICIT_CONSTRUCTORS(StringToDoubleConverter);
- };
- 
- }  // namespace double_conversion
-diff --git a/mfbt/double-conversion/fast-dtoa.cc b/mfbt/double-conversion/fast-dtoa.cc
-index 0609422..d338216 100644
---- a/mfbt/double-conversion/fast-dtoa.cc
-+++ b/mfbt/double-conversion/fast-dtoa.cc
-@@ -25,11 +25,11 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include "fast-dtoa.h"
-+#include <fast-dtoa.h>
- 
--#include "cached-powers.h"
--#include "diy-fp.h"
--#include "ieee.h"
-+#include <cached-powers.h>
-+#include <diy-fp.h>
-+#include <ieee.h>
- 
- namespace double_conversion {
- 
-@@ -248,10 +248,7 @@ static void BiggestPowerTen(uint32_t number,
-   // Note: kPowersOf10[i] == 10^(i-1).
-   exponent_plus_one_guess++;
-   // We don't have any guarantees that 2^number_bits <= number.
--  // TODO(floitsch): can we change the 'while' into an 'if'? We definitely see
--  // number < (2^number_bits - 1), but I haven't encountered
--  // number < (2^number_bits - 2) yet.
--  while (number < kSmallPowersOfTen[exponent_plus_one_guess]) {
-+  if (number < kSmallPowersOfTen[exponent_plus_one_guess]) {
-     exponent_plus_one_guess--;
-   }
-   *power = kSmallPowersOfTen[exponent_plus_one_guess];
-@@ -350,7 +347,8 @@ static bool DigitGen(DiyFp low,
-   // that is smaller than integrals.
-   while (*kappa > 0) {
-     int digit = integrals / divisor;
--    buffer[*length] = '0' + digit;
-+    ASSERT(digit <= 9);
-+    buffer[*length] = static_cast<char>('0' + digit);
-     (*length)++;
-     integrals %= divisor;
-     (*kappa)--;
-@@ -379,13 +377,14 @@ static bool DigitGen(DiyFp low,
-   ASSERT(one.e() >= -60);
-   ASSERT(fractionals < one.f());
-   ASSERT(UINT64_2PART_C(0xFFFFFFFF, FFFFFFFF) / 10 >= one.f());
--  while (true) {
-+  for (;;) {
-     fractionals *= 10;
-     unit *= 10;
-     unsafe_interval.set_f(unsafe_interval.f() * 10);
-     // Integer division by one.
-     int digit = static_cast<int>(fractionals >> -one.e());
--    buffer[*length] = '0' + digit;
-+    ASSERT(digit <= 9);
-+    buffer[*length] = static_cast<char>('0' + digit);
-     (*length)++;
-     fractionals &= one.f() - 1;  // Modulo by one.
-     (*kappa)--;
-@@ -459,7 +458,8 @@ static bool DigitGenCounted(DiyFp w,
-   // that is smaller than 'integrals'.
-   while (*kappa > 0) {
-     int digit = integrals / divisor;
--    buffer[*length] = '0' + digit;
-+    ASSERT(digit <= 9);
-+    buffer[*length] = static_cast<char>('0' + digit);
-     (*length)++;
-     requested_digits--;
-     integrals %= divisor;
-@@ -492,7 +492,8 @@ static bool DigitGenCounted(DiyFp w,
-     w_error *= 10;
-     // Integer division by one.
-     int digit = static_cast<int>(fractionals >> -one.e());
--    buffer[*length] = '0' + digit;
-+    ASSERT(digit <= 9);
-+    buffer[*length] = static_cast<char>('0' + digit);
-     (*length)++;
-     requested_digits--;
-     fractionals &= one.f() - 1;  // Modulo by one.
-@@ -529,7 +530,7 @@ static bool Grisu3(double v,
-   if (mode == FAST_DTOA_SHORTEST) {
-     Double(v).NormalizedBoundaries(&boundary_minus, &boundary_plus);
-   } else {
--    assert(mode == FAST_DTOA_SHORTEST_SINGLE);
-+    ASSERT(mode == FAST_DTOA_SHORTEST_SINGLE);
-     float single_v = static_cast<float>(v);
-     Single(single_v).NormalizedBoundaries(&boundary_minus, &boundary_plus);
-   }
-diff --git a/mfbt/double-conversion/fast-dtoa.h b/mfbt/double-conversion/fast-dtoa.h
-index 5f1e8ee..9c4da92 100644
---- a/mfbt/double-conversion/fast-dtoa.h
-+++ b/mfbt/double-conversion/fast-dtoa.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_FAST_DTOA_H_
- #define DOUBLE_CONVERSION_FAST_DTOA_H_
- 
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-diff --git a/mfbt/double-conversion/fixed-dtoa.cc b/mfbt/double-conversion/fixed-dtoa.cc
-index d56b144..fa23529 100644
---- a/mfbt/double-conversion/fixed-dtoa.cc
-+++ b/mfbt/double-conversion/fixed-dtoa.cc
-@@ -25,10 +25,10 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include <math.h>
-+#include <cmath>
- 
--#include "fixed-dtoa.h"
--#include "ieee.h"
-+#include <fixed-dtoa.h>
-+#include <ieee.h>
- 
- namespace double_conversion {
- 
-@@ -98,7 +98,7 @@ class UInt128 {
-     return high_bits_ == 0 && low_bits_ == 0;
-   }
- 
--  int BitAt(int position) {
-+  int BitAt(int position) const {
-     if (position >= 64) {
-       return static_cast<int>(high_bits_ >> (position - 64)) & 1;
-     } else {
-@@ -133,7 +133,7 @@ static void FillDigits32(uint32_t number, Vector<char> buffer, int* length) {
-   while (number != 0) {
-     int digit = number % 10;
-     number /= 10;
--    buffer[(*length) + number_length] = '0' + digit;
-+    buffer[(*length) + number_length] = static_cast<char>('0' + digit);
-     number_length++;
-   }
-   // Exchange the digits.
-@@ -150,7 +150,7 @@ static void FillDigits32(uint32_t number, Vector<char> buffer, int* length) {
- }
- 
- 
--static void FillDigits64FixedLength(uint64_t number, int requested_length,
-+static void FillDigits64FixedLength(uint64_t number,
-                                     Vector<char> buffer, int* length) {
-   const uint32_t kTen7 = 10000000;
-   // For efficiency cut the number into 3 uint32_t parts, and print those.
-@@ -253,12 +253,14 @@ static void FillFractionals(uint64_t fractionals, int exponent,
-       fractionals *= 5;
-       point--;
-       int digit = static_cast<int>(fractionals >> point);
--      buffer[*length] = '0' + digit;
-+      ASSERT(digit <= 9);
-+      buffer[*length] = static_cast<char>('0' + digit);
-       (*length)++;
-       fractionals -= static_cast<uint64_t>(digit) << point;
-     }
-     // If the first bit after the point is set we have to round up.
--    if (((fractionals >> (point - 1)) & 1) == 1) {
-+    ASSERT(fractionals == 0 || point - 1 >= 0);
-+    if ((fractionals != 0) && ((fractionals >> (point - 1)) & 1) == 1) {
-       RoundUp(buffer, length, decimal_point);
-     }
-   } else {  // We need 128 bits.
-@@ -274,7 +276,8 @@ static void FillFractionals(uint64_t fractionals, int exponent,
-       fractionals128.Multiply(5);
-       point--;
-       int digit = fractionals128.DivModPowerOf2(point);
--      buffer[*length] = '0' + digit;
-+      ASSERT(digit <= 9);
-+      buffer[*length] = static_cast<char>('0' + digit);
-       (*length)++;
-     }
-     if (fractionals128.BitAt(point - 1) == 1) {
-@@ -358,7 +361,7 @@ bool FastFixedDtoa(double v,
-       remainder = (dividend % divisor) << exponent;
-     }
-     FillDigits32(quotient, buffer, length);
--    FillDigits64FixedLength(remainder, divisor_power, buffer, length);
-+    FillDigits64FixedLength(remainder, buffer, length);
-     *decimal_point = *length;
-   } else if (exponent >= 0) {
-     // 0 <= exponent <= 11
-diff --git a/mfbt/double-conversion/fixed-dtoa.h b/mfbt/double-conversion/fixed-dtoa.h
-index 3bdd08e..19fd2e7 100644
---- a/mfbt/double-conversion/fixed-dtoa.h
-+++ b/mfbt/double-conversion/fixed-dtoa.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_FIXED_DTOA_H_
- #define DOUBLE_CONVERSION_FIXED_DTOA_H_
- 
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-diff --git a/mfbt/double-conversion/ieee.h b/mfbt/double-conversion/ieee.h
-index 839dc47..8949b02 100644
---- a/mfbt/double-conversion/ieee.h
-+++ b/mfbt/double-conversion/ieee.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_DOUBLE_H_
- #define DOUBLE_CONVERSION_DOUBLE_H_
- 
--#include "diy-fp.h"
-+#include <diy-fp.h>
- 
- namespace double_conversion {
- 
-@@ -99,7 +99,7 @@ class Double {
-   }
- 
-   double PreviousDouble() const {
--    if (d64_ == (kInfinity | kSignMask)) return -Double::Infinity();
-+    if (d64_ == (kInfinity | kSignMask)) return -Infinity();
-     if (Sign() < 0) {
-       return Double(d64_ + 1).value();
-     } else {
-@@ -256,6 +256,8 @@ class Double {
-     return (significand & kSignificandMask) |
-         (biased_exponent << kPhysicalSignificandSize);
-   }
-+
-+  DC_DISALLOW_COPY_AND_ASSIGN(Double);
- };
- 
- class Single {
-@@ -391,6 +393,8 @@ class Single {
-   static const uint32_t kNaN = 0x7FC00000;
- 
-   const uint32_t d32_;
-+
-+  DC_DISALLOW_COPY_AND_ASSIGN(Single);
- };
- 
- }  // namespace double_conversion
-diff --git a/mfbt/double-conversion/strtod.cc b/mfbt/double-conversion/strtod.cc
-index d773f44..a9e85c1 100644
---- a/mfbt/double-conversion/strtod.cc
-+++ b/mfbt/double-conversion/strtod.cc
-@@ -25,13 +25,13 @@
- // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--#include <stdarg.h>
--#include <limits.h>
-+#include <climits>
-+#include <cstdarg>
- 
--#include "strtod.h"
--#include "bignum.h"
--#include "cached-powers.h"
--#include "ieee.h"
-+#include <bignum.h>
-+#include <cached-powers.h>
-+#include <ieee.h>
-+#include <strtod.h>
- 
- namespace double_conversion {
- 
-@@ -137,6 +137,7 @@ static void TrimAndCut(Vector<const char> buffer, int exponent,
-   Vector<const char> right_trimmed = TrimTrailingZeros(left_trimmed);
-   exponent += left_trimmed.length() - right_trimmed.length();
-   if (right_trimmed.length() > kMaxSignificantDecimalDigits) {
-+    (void) space_size;  // Mark variable as used.
-     ASSERT(space_size >= kMaxSignificantDecimalDigits);
-     CutToMaxSignificantDigits(right_trimmed, exponent,
-                               buffer_copy_space, updated_exponent);
-@@ -204,7 +205,7 @@ static bool DoubleStrtod(Vector<const char> trimmed,
-   // Note that the ARM simulator is compiled for 32bits. It therefore exhibits
-   // the same problem.
-   return false;
--#endif
-+#else
-   if (trimmed.length() <= kMaxExactDoubleIntegerDecimalDigits) {
-     int read_digits;
-     // The trimmed input fits into a double.
-@@ -242,6 +243,7 @@ static bool DoubleStrtod(Vector<const char> trimmed,
-     }
-   }
-   return false;
-+#endif
- }
- 
- 
-@@ -263,7 +265,6 @@ static DiyFp AdjustmentPowerOfTen(int exponent) {
-     case 7: return DiyFp(UINT64_2PART_C(0x98968000, 00000000), -40);
-     default:
-       UNREACHABLE();
--      return DiyFp(0, 0);
-   }
- }
- 
-@@ -286,7 +287,7 @@ static bool DiyFpStrtod(Vector<const char> buffer,
-   const int kDenominator = 1 << kDenominatorLog;
-   // Move the remaining decimals into the exponent.
-   exponent += remaining_decimals;
--  int error = (remaining_decimals == 0 ? 0 : kDenominator / 2);
-+  uint64_t error = (remaining_decimals == 0 ? 0 : kDenominator / 2);
- 
-   int old_e = input.e();
-   input.Normalize();
-@@ -471,6 +472,30 @@ double Strtod(Vector<const char> buffer, int exponent) {
-   }
- }
- 
-+static float SanitizedDoubletof(double d) {
-+  ASSERT(d >= 0.0);
-+  // ASAN has a sanitize check that disallows casting doubles to floats if
-+  // they are too big.
-+  // https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#available-checks
-+  // The behavior should be covered by IEEE 754, but some projects use this
-+  // flag, so work around it.
-+  float max_finite = 3.4028234663852885981170418348451692544e+38;
-+  // The half-way point between the max-finite and infinity value.
-+  // Since infinity has an even significand everything equal or greater than
-+  // this value should become infinity.
-+  double half_max_finite_infinity =
-+      3.40282356779733661637539395458142568448e+38;
-+  if (d >= max_finite) {
-+    if (d >= half_max_finite_infinity) {
-+      return Single::Infinity();
-+    } else {
-+      return max_finite;
-+    }
-+  } else {
-+    return static_cast<float>(d);
-+  }
-+}
-+
- float Strtof(Vector<const char> buffer, int exponent) {
-   char copy_buffer[kMaxSignificantDecimalDigits];
-   Vector<const char> trimmed;
-@@ -482,7 +507,7 @@ float Strtof(Vector<const char> buffer, int exponent) {
-   double double_guess;
-   bool is_correct = ComputeGuess(trimmed, exponent, &double_guess);
- 
--  float float_guess = static_cast<float>(double_guess);
-+  float float_guess = SanitizedDoubletof(double_guess);
-   if (float_guess == double_guess) {
-     // This shortcut triggers for integer values.
-     return float_guess;
-@@ -505,18 +530,18 @@ float Strtof(Vector<const char> buffer, int exponent) {
-   double double_next = Double(double_guess).NextDouble();
-   double double_previous = Double(double_guess).PreviousDouble();
- 
--  float f1 = static_cast<float>(double_previous);
-+  float f1 = SanitizedDoubletof(double_previous);
-   float f2 = float_guess;
--  float f3 = static_cast<float>(double_next);
-+  float f3 = SanitizedDoubletof(double_next);
-   float f4;
-   if (is_correct) {
-     f4 = f3;
-   } else {
-     double double_next2 = Double(double_next).NextDouble();
--    f4 = static_cast<float>(double_next2);
-+    f4 = SanitizedDoubletof(double_next2);
-   }
--  (void)f2;
--  assert(f1 <= f2 && f2 <= f3 && f3 <= f4);
-+  (void) f2;  // Mark variable as used.
-+  ASSERT(f1 <= f2 && f2 <= f3 && f3 <= f4);
- 
-   // If the guess doesn't lie near a single-precision boundary we can simply
-   // return its float-value.
-@@ -524,11 +549,11 @@ float Strtof(Vector<const char> buffer, int exponent) {
-     return float_guess;
-   }
- 
--  assert((f1 != f2 && f2 == f3 && f3 == f4) ||
-+  ASSERT((f1 != f2 && f2 == f3 && f3 == f4) ||
-          (f1 == f2 && f2 != f3 && f3 == f4) ||
-          (f1 == f2 && f2 == f3 && f3 != f4));
- 
--  // guess and next are the two possible canditates (in the same way that
-+  // guess and next are the two possible candidates (in the same way that
-   // double_guess was the lower candidate for a double-precision guess).
-   float guess = f1;
-   float next = f4;
-diff --git a/mfbt/double-conversion/strtod.h b/mfbt/double-conversion/strtod.h
-index ed0293b..58c4926 100644
---- a/mfbt/double-conversion/strtod.h
-+++ b/mfbt/double-conversion/strtod.h
-@@ -28,7 +28,7 @@
- #ifndef DOUBLE_CONVERSION_STRTOD_H_
- #define DOUBLE_CONVERSION_STRTOD_H_
- 
--#include "utils.h"
-+#include <utils.h>
- 
- namespace double_conversion {
- 
-diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
-index 0eec2d9..a748654 100644
---- a/mfbt/double-conversion/utils.h
-+++ b/mfbt/double-conversion/utils.h
-@@ -28,19 +28,34 @@
- #ifndef DOUBLE_CONVERSION_UTILS_H_
- #define DOUBLE_CONVERSION_UTILS_H_
- 
--#include <stdlib.h>
--#include <string.h>
-+#include <cstdlib>
-+#include <cstring>
- 
--#include <assert.h>
-+#include <cassert>
- #ifndef ASSERT
--#define ASSERT(condition)      (assert(condition))
-+#define ASSERT(condition)         \
-+    assert(condition);
- #endif
- #ifndef UNIMPLEMENTED
- #define UNIMPLEMENTED() (abort())
- #endif
-+#ifndef DOUBLE_CONVERSION_NO_RETURN
-+#ifdef _MSC_VER
-+#define DOUBLE_CONVERSION_NO_RETURN __declspec(noreturn)
-+#else
-+#define DOUBLE_CONVERSION_NO_RETURN __attribute__((noreturn))
-+#endif
-+#endif
- #ifndef UNREACHABLE
-+#ifdef _MSC_VER
-+void DOUBLE_CONVERSION_NO_RETURN abort_noreturn();
-+inline void abort_noreturn() { abort(); }
-+#define UNREACHABLE()   (abort_noreturn())
-+#else
- #define UNREACHABLE()   (abort())
- #endif
-+#endif
-+
- 
- // Double operations detection based on target architecture.
- // Linux uses a 80bit wide floating point stack on x86. This induces double
-@@ -55,11 +70,18 @@
- #if defined(_M_X64) || defined(__x86_64__) || \
-     defined(__ARMEL__) || defined(__avr32__) || \
-     defined(__hppa__) || defined(__ia64__) || \
--    defined(__mips__) || defined(__powerpc__) || \
-+    defined(__mips__) || \
-+    defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
-+    defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
--    defined(_MIPS_ARCH_MIPS32R2)
-+    defined(_MIPS_ARCH_MIPS32R2) || \
-+    defined(__AARCH64EL__) || defined(__aarch64__) || \
-+    defined(__riscv)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
-+#elif defined(__mc68000__) || \
-+    defined(__pnacl__) || defined(__native_client__)
-+#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
- // Windows uses a 64bit wide floating point stack.
-@@ -71,9 +93,10 @@
- #error Target architecture was not detected as supported by Double-Conversion.
- #endif
- 
--
- #include "mozilla/StandardInteger.h"
- 
-+typedef uint16_t uc16;
-+
- // The following macro works on both 32 and 64-bit platforms.
- // Usage: instead of writing 0x1234567890123456
- //      write UINT64_2PART_C(0x12345678,90123456);
-@@ -92,8 +115,8 @@
- 
- // A macro to disallow the evil copy constructor and operator= functions
- // This should be used in the private: declarations for a class
--#ifndef DISALLOW_COPY_AND_ASSIGN
--#define DISALLOW_COPY_AND_ASSIGN(TypeName)      \
-+#ifndef DC_DISALLOW_COPY_AND_ASSIGN
-+#define DC_DISALLOW_COPY_AND_ASSIGN(TypeName)      \
-   TypeName(const TypeName&);                    \
-   void operator=(const TypeName&)
- #endif
-@@ -104,10 +127,10 @@
- // This should be used in the private: declarations for a class
- // that wants to prevent anyone from instantiating it. This is
- // especially useful for classes containing only static methods.
--#ifndef DISALLOW_IMPLICIT_CONSTRUCTORS
--#define DISALLOW_IMPLICIT_CONSTRUCTORS(TypeName) \
-+#ifndef DC_DISALLOW_IMPLICIT_CONSTRUCTORS
-+#define DC_DISALLOW_IMPLICIT_CONSTRUCTORS(TypeName) \
-   TypeName();                                    \
--  DISALLOW_COPY_AND_ASSIGN(TypeName)
-+  DC_DISALLOW_COPY_AND_ASSIGN(TypeName)
- #endif
- 
- namespace double_conversion {
-@@ -139,8 +162,8 @@ template <typename T>
- class Vector {
-  public:
-   Vector() : start_(NULL), length_(0) {}
--  Vector(T* data, int length) : start_(data), length_(length) {
--    ASSERT(length == 0 || (length > 0 && data != NULL));
-+  Vector(T* data, int len) : start_(data), length_(len) {
-+    ASSERT(len == 0 || (len > 0 && data != NULL));
-   }
- 
-   // Returns a vector using the same backing storage as this one,
-@@ -182,8 +205,8 @@ class Vector {
- // buffer bounds on all operations in debug mode.
- class StringBuilder {
-  public:
--  StringBuilder(char* buffer, int size)
--      : buffer_(buffer, size), position_(0) { }
-+  StringBuilder(char* buffer, int buffer_size)
-+      : buffer_(buffer, buffer_size), position_(0) { }
- 
-   ~StringBuilder() { if (!is_finalized()) Finalize(); }
- 
-@@ -249,7 +272,7 @@ class StringBuilder {
- 
-   bool is_finalized() const { return position_ < 0; }
- 
--  DISALLOW_IMPLICIT_CONSTRUCTORS(StringBuilder);
-+  DC_DISALLOW_IMPLICIT_CONSTRUCTORS(StringBuilder);
- };
- 
- // The type-based aliasing rule allows the compiler to assume that pointers of
-@@ -280,7 +303,12 @@ template <class Dest, class Source>
- inline Dest BitCast(const Source& source) {
-   // Compile time assertion: sizeof(Dest) == sizeof(Source)
-   // A compile error here means your Dest and Source have different sizes.
-+#if __cplusplus >= 201103L
-+  static_assert(sizeof(Dest) == sizeof(Source),
-+                "source and destination size mismatch");
-+#else
-   typedef char VerifySizesAreEqual[sizeof(Dest) == sizeof(Source) ? 1 : -1];
-+#endif
- 
-   Dest dest;
-   memmove(&dest, &source, sizeof(dest));
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch b/meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch
deleted file mode 100644
index ffeac49..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From 1c3f6dd9bb478fea0622e8a9ba2efbf19d73e302 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 1 Jun 2018 14:46:47 -0700
-Subject: [PATCH] Update the double conversion update script
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- .../add-mfbt-api-markers.patch                | 94 -------------------
- .../more-architectures.patch                  | 30 ------
- mfbt/double-conversion/update.sh              |  8 +-
- 3 files changed, 3 insertions(+), 129 deletions(-)
- delete mode 100644 mfbt/double-conversion/add-mfbt-api-markers.patch
- delete mode 100644 mfbt/double-conversion/more-architectures.patch
-
-diff --git a/mfbt/double-conversion/add-mfbt-api-markers.patch b/mfbt/double-conversion/add-mfbt-api-markers.patch
-deleted file mode 100644
-index b98ec74..0000000
---- a/mfbt/double-conversion/add-mfbt-api-markers.patch
-+++ /dev/null
-@@ -1,94 +0,0 @@
--diff --git a/mfbt/double-conversion/double-conversion.h b/mfbt/double-conversion/double-conversion.h
--index f98edae..e536a01 100644
----- a/mfbt/double-conversion/double-conversion.h
--+++ b/mfbt/double-conversion/double-conversion.h
--@@ -28,6 +28,7 @@
-- #ifndef DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
-- #define DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
-- 
--+#include "mozilla/Types.h"
-- #include "utils.h"
-- 
-- namespace double_conversion {
--@@ -129,7 +130,7 @@ class DoubleToStringConverter {
--   }
-- 
--   // Returns a converter following the EcmaScript specification.
---  static const DoubleToStringConverter& EcmaScriptConverter();
--+  static MFBT_API(const DoubleToStringConverter&) EcmaScriptConverter();
-- 
--   // Computes the shortest string of digits that correctly represent the input
--   // number. Depending on decimal_in_shortest_low and decimal_in_shortest_high
--@@ -197,7 +198,7 @@ class DoubleToStringConverter {
--   // The last two conditions imply that the result will never contain more than
--   // 1 + kMaxFixedDigitsBeforePoint + 1 + kMaxFixedDigitsAfterPoint characters
--   // (one additional character for the sign, and one for the decimal point).
---  bool ToFixed(double value,
--+  MFBT_API(bool) ToFixed(double value,
--                int requested_digits,
--                StringBuilder* result_builder) const;
-- 
--@@ -229,7 +230,7 @@ class DoubleToStringConverter {
--   // kMaxExponentialDigits + 8 characters (the sign, the digit before the
--   // decimal point, the decimal point, the exponent character, the
--   // exponent's sign, and at most 3 exponent digits).
---  bool ToExponential(double value,
--+  MFBT_API(bool) ToExponential(double value,
--                      int requested_digits,
--                      StringBuilder* result_builder) const;
-- 
--@@ -267,7 +268,7 @@ class DoubleToStringConverter {
--   // The last condition implies that the result will never contain more than
--   // kMaxPrecisionDigits + 7 characters (the sign, the decimal point, the
--   // exponent character, the exponent's sign, and at most 3 exponent digits).
---  bool ToPrecision(double value,
--+  MFBT_API(bool) ToPrecision(double value,
--                    int precision,
--                    StringBuilder* result_builder) const;
-- 
--@@ -292,7 +293,7 @@ class DoubleToStringConverter {
--   // kBase10MaximalLength.
--   // Note that DoubleToAscii null-terminates its input. So the given buffer
--   // should be at least kBase10MaximalLength + 1 characters long.
---  static const int kBase10MaximalLength = 17;
--+  static const MFBT_DATA(int) kBase10MaximalLength = 17;
-- 
--   // Converts the given double 'v' to ascii. 'v' must not be NaN, +Infinity, or
--   // -Infinity. In SHORTEST_SINGLE-mode this restriction also applies to 'v'
--@@ -332,7 +333,7 @@ class DoubleToStringConverter {
--   // terminating null-character when computing the maximal output size.
--   // The given length is only used in debug mode to ensure the buffer is big
--   // enough.
---  static void DoubleToAscii(double v,
--+  static MFBT_API(void) DoubleToAscii(double v,
--                             DtoaMode mode,
--                             int requested_digits,
--                             char* buffer,
--@@ -343,7 +344,7 @@ class DoubleToStringConverter {
-- 
--  private:
--   // Implementation for ToShortest and ToShortestSingle.
---  bool ToShortestIeeeNumber(double value,
--+  MFBT_API(bool) ToShortestIeeeNumber(double value,
--                             StringBuilder* result_builder,
--                             DtoaMode mode) const;
-- 
--@@ -351,15 +352,15 @@ class DoubleToStringConverter {
--   // corresponding string using the configured infinity/nan-symbol.
--   // If either of them is NULL or the value is not special then the
--   // function returns false.
---  bool HandleSpecialValues(double value, StringBuilder* result_builder) const;
--+  MFBT_API(bool) HandleSpecialValues(double value, StringBuilder* result_builder) const;
--   // Constructs an exponential representation (i.e. 1.234e56).
--   // The given exponent assumes a decimal point after the first decimal digit.
---  void CreateExponentialRepresentation(const char* decimal_digits,
--+  MFBT_API(void) CreateExponentialRepresentation(const char* decimal_digits,
--                                        int length,
--                                        int exponent,
--                                        StringBuilder* result_builder) const;
--   // Creates a decimal representation (i.e 1234.5678).
---  void CreateDecimalRepresentation(const char* decimal_digits,
--+  MFBT_API(void) CreateDecimalRepresentation(const char* decimal_digits,
--                                    int length,
--                                    int decimal_point,
--                                    int digits_after_point,
-diff --git a/mfbt/double-conversion/more-architectures.patch b/mfbt/double-conversion/more-architectures.patch
-deleted file mode 100644
-index b8d3804..0000000
---- a/mfbt/double-conversion/more-architectures.patch
-+++ /dev/null
-@@ -1,30 +0,0 @@
--diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
----- a/mfbt/double-conversion/utils.h
--+++ b/mfbt/double-conversion/utils.h
--@@ -48,20 +48,24 @@
-- // An easy way to test if the floating-point operations are correct is to
-- // evaluate: 89255.0/1e22. If the floating-point stack is 64 bits wide then
-- // the result is equal to 89255e-22.
-- // The best way to test this, is to create a division-function and to compare
-- // the output of the division with the expected result. (Inlining must be
-- // disabled.)
-- // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
-- #if defined(_M_X64) || defined(__x86_64__) || \
---    defined(__ARMEL__) || \
--+    defined(__ARMEL__) || defined(__avr32__) || \
--+    defined(__hppa__) || defined(__ia64__) || \
--+    defined(__mips__) || defined(__powerpc__) || \
--+    defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
--+    defined(__SH4__) || defined(__alpha__) || \
--     defined(_MIPS_ARCH_MIPS32R2)
-- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
---#elif defined(_M_IX86) || defined(__i386__)
--+#elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
-- #if defined(_WIN32)
-- // Windows uses a 64bit wide floating point stack.
-- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
-- #else
-- #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
-- #endif  // _WIN32
-- #else
-- #error Target architecture was not detected as supported by Double-Conversion.
-diff --git a/mfbt/double-conversion/update.sh b/mfbt/double-conversion/update.sh
-index 81add8e..9ef2e91 100755
---- a/mfbt/double-conversion/update.sh
-+++ b/mfbt/double-conversion/update.sh
-@@ -4,14 +4,12 @@
- # double-conversion source that we need.
- 
- cp $1/LICENSE ./
--cp $1/README ./
-+cp $1/COPYING ./
- 
- # Includes
--cp $1/src/*.h ./
-+cp $1/double-conversion/*.h ./
- 
- # Source
--cp $1/src/*.cc ./
-+cp $1/double-conversion/*.cc ./
- 
--patch -p3 < add-mfbt-api-markers.patch
- patch -p3 < use-StandardInteger.patch
--patch -p3 < more-architectures.patch
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
deleted file mode 100644
index 43c4590..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-fix the compile error of powerpc64
- 
-Upstream-status: Accepted
-
- fix the following error
- |error: 'jsuword' does not name a type
-
-
---- a/js/src/jsval.hold	2015-04-24 01:15:06.692970731 -0500
-+++ b/js/src/jsval.h	2015-04-24 01:15:41.792969478 -0500
-@@ -304,7 +304,6 @@
-             int32_t        i32;
-             uint32_t       u32;
-             JSWhyMagic     why;
--            jsuword        word;
-         } payload;
-     } s;
-     double asDouble;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
deleted file mode 100644
index abde01b..0000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-fix the compile error do to perl update
-
-Upstream-status: Inappropriate
-
-
-Signed-of-by: Armin Kuster <akuster808@gmail.com>
-
-Index: src/config/milestone.pl
-===================================================================
---- src.orig/config/milestone.pl
-+++ src/config/milestone.pl
-@@ -55,7 +55,7 @@ $MILESTONE_FILE  = "$TOPSRCDIR/config/mi
- #
- my $milestone = Moz::Milestone::getOfficialMilestone($MILESTONE_FILE);
- 
--if (defined(@TEMPLATE_FILE)) {
-+if (@TEMPLATE_FILE) {
-   my $TFILE;
- 
-   foreach $TFILE (@TEMPLATE_FILE) {
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
similarity index 36%
rename from meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index c5fbab2..7909602 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -1,77 +1,86 @@
 SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
-HOMEPAGE = "http://www.mozilla.org/js/"
+HOMEPAGE = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
-           file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.orig.tar.bz2 \
            file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
-           file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patchdir=../../ \
-           file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
-           file://0005-aarch64-64k-page.patch;patchdir=../../ \
-           file://0001-regenerate-configure.patch;patchdir=../../ \
-           file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
-           file://fix_milestone_compile_issue.patch \
-           file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
-           file://Manually_mmap_heap_memory_esr17.patch;patchdir=../../ \
-           file://0001-compare-the-first-character-of-string-to-be-null-or-.patch;patchdir=../../ \
-           file://Update-the-double-conversion-update-script.patch;patchdir=../../ \
-           file://Update-Double-Conversion.patch;patchdir=../../ \
+           file://0010-fix-cross-compilation-on-i586-targets.patch \
+           file://0001-do-not-create-python-environment.patch \
+           file://0002-fix-cannot-find-link.patch \
+           file://0003-workaround-autoconf-2.13-detection-failed.patch \
+           file://0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch \
+           file://0005-fix-do_compile-failed-on-mips.patch \
+           "
+SRC_URI_append_libc-musl = " \
+           file://0006-support-musl.patch \
            "
 
-SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-SRC_URI[sha256sum] = "321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c172fba"
-
-S = "${WORKDIR}/${BPN}${PV}/js/src"
+SRC_URI[md5sum] = "3a44c2fd3d7b5a370ed9184163c74bc4"
+SRC_URI[sha256sum] = "fb5e11b7f31a33be820d5c947c5fa114751b0d5033778c1cd8e0cf2dad91e8fa"
 
 inherit autotools pkgconfig perlnative pythonnative
 
 DEPENDS += "nspr zlib"
 
-# Host specific flags need to be defined, otherwise target flags will be passed to the host
-export HOST_CFLAGS = "${BUILD_CFLAGS}"
-export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
-export HOST_LDFLAGS = "${BUILD_LDFLAGS}"
-
 # nspr's package-config is ignored so set libs manually
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
     --host=${BUILD_SYS} \
-    --build=${BUILD_SYS} \
     --prefix=${prefix} \
     --libdir=${libdir} \
+    --disable-tests \
     --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
-    --enable-threadsafe \
-    --disable-static \
-"
-EXTRA_OECONF_append_armv4 = " \
-    --disable-methodjit \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
+PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},,virtual/libx11"
+
+EXTRA_OEMAKE_task-compile += "OS_LDFLAGS='-Wl,-latomic ${LDFLAGS}'"
+EXTRA_OEMAKE_task-install += "STATIC_LIBRARY_NAME=js_static"
 
-# mozjs requires autoreconf 2.13
 do_configure() {
-    export HOST_CFLAGS="${BUILD_CFLAGS}"
-    export HOST_CXXFLAGS="${BUILD_CPPFLAGS}"
-    export HOST_LDFLAGS="${BUILD_LDFLAGS}"
-    ( cd ${S}
-      gnu-configize --force
-      mv config.guess config.sub build/autoconf )
-    ${S}/configure ${EXTRA_OECONF}
+    export SHELL="/bin/sh"
+    ${S}/js/src/configure ${EXTRA_OECONF}
 }
 
-# patch.bbclass will try to apply the patches already present and fail, so clean them out
-do_unpack() {
-    tar -xvf ${DL_DIR}/mozjs17.0.0.tar.gz -C ${WORKDIR}/
-    rm -rf ${WORKDIR}/${BPN}${PV}/patches
+do_compile_prepend() {
+    export SHELL="/bin/sh"
+    export S
+    export PYTHONPATH
+    cd ${S}
+    for sub_dir in python testing/mozbase; do
+        for module_dir in `ls $sub_dir -1`;do
+            [ $module_dir = "virtualenv" ] && continue
+            if [ -d "${S}/$sub_dir/$module_dir" ];then
+                PYTHONPATH="$PYTHONPATH:${S}/$sub_dir/$module_dir"
+            fi
+        done
+    done
+    PYTHONPATH="$PYTHONPATH:${S}/config:${S}/build"
+    cd -
 }
 
+do_install_prepend() {
+    export SHELL="/bin/sh"
+    export S
+    export PYTHONPATH
+    cd ${S}
+    for sub_dir in python testing/mozbase; do
+        for module_dir in `ls $sub_dir -1`;do
+            [ $module_dir = "virtualenv" ] && continue
+            if [ -d "${S}/$sub_dir/$module_dir" ];then
+                PYTHONPATH="$PYTHONPATH:${S}/$sub_dir/$module_dir"
+            fi
+        done
+    done
+    PYTHONPATH="$PYTHONPATH:${S}/config:${S}/build"
+    cd -
+}
 
 PACKAGES =+ "lib${BPN}"
 FILES_lib${BPN} += "${libdir}/lib*.so"
-FILES_${PN}-dev += "${bindir}/js17-config"
+FILES_${PN}-dev += "${bindir}/js52-config"
 
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
@@ -80,4 +89,7 @@ FILES_${PN}-dev += "${bindir}/js17-config"
 #| {standard input}:2174: Error: unshifted register required -- `orr r1,r1,#(1<<20)'
 #| {standard input}:2176: Error: instruction not supported in Thumb16 mode -- `subs r2,r2,#0x300'
 #| {standard input}:2178: Error: instruction not supported in Thumb16 mode -- `subs r5,r2,#52'
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+
+DISABLE_STATIC = ""
-- 
2.7.4



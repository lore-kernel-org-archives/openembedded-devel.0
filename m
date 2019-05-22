Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id BCC1A7E402
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:45:03 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p1so1818950plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tTSu44sOyhObONvektYE7MI1OCnHeyBb+3NuuYfXMWs=;
	b=rYkCSgbyjcwJDmvO/wqPsZKhHnnEFoqRkQR6m89fNfuwKqV//M3FGrD25lWRvtQkPg
	7xL8CYqQMxpen0SqZdbsM3VXbMYc4iy0uhNQ7NqrLiG8Q2hTRrIpm5bmeHZJvjvpbmPw
	jmMvKomYmMvQpU3n5mlrD2HbGugLQqe5DveNb+HTHxyA/A5gqCI3b808XORhXY/yaSEA
	HwhaswNOdt9u8acXijypeI1TF+951D0rDccnhiOlLO9WBz8q2zX06ehA8LoNVpjzRCdW
	yt35kpvp34oszHNc7xjm+SzglV/SG0LwoKDWKwOAZIwj1tZuck34W7Vn4Ys73siWhRgY
	/6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tTSu44sOyhObONvektYE7MI1OCnHeyBb+3NuuYfXMWs=;
	b=qTBabFReBdIWLmflXHnB+TGky3ki2piGVASlMenNK/yqB4QmNv3Cspu9XTX6IQmFKh
	5t5pUTjuqiSiLCtDtIbQ4qp/uJa4m6fSqi2aSzYQM3UtXeBU2kqiwYiJDzeerF/jChFZ
	ZUR3ACw3MpU9wkGrtoMD8zFAWuSKOwnFyqYxipVYBW5acIUG8UQYrFVNUTp5ES2NP9jY
	psPsVXame4UE8jAokoil4fVrKf+tnT6YAweo/ldhjOAtxzZU/s/sD0LsAloIhGMdfUy5
	QMzggBHPu1LL+cgX4m9lA1MdCeXNxJ338rTdNNyX9BWfJqfq7bccw3UhUKU3w1lNA/Hs
	gwxA==
X-Gm-Message-State: APjAAAX9dM8gIYYXBqPbL6cuWhHveTRh8Au1zRRcaGCPy8PQomU8zhUs
	n5PU4Z98BAD4WHWpT5hc3Q0wUw06ufg=
X-Google-Smtp-Source: APXvYqxJ9qymDByp/8vx4kFA0CuFO9nRGQx5NNNle8Bw7ANw+quKgllYE2OefQKN/36t6tSOIz7oJw==
X-Received: by 2002:a17:902:8a8f:: with SMTP id
	p15mr452551plo.157.1558568704434; 
	Wed, 22 May 2019 16:45:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	k27sm18567808pfh.147.2019.05.22.16.45.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 16:45:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 16:44:54 -0700
Message-Id: <20190522234455.13121-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522234455.13121-1-raj.khem@gmail.com>
References: <20190522234455.13121-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 23:45:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-To-fix-build-error-on-arm32BE.patch  |   8 +-
 ...001-do-not-create-python-environment.patch |  28 +---
 ...-compiling-failure-on-mips64-n32-bsp.patch |  19 +--
 ...include-RequiredDefines.h-for-depend.patch |   8 +-
 .../0005-fix-do_compile-failed-on-mips.patch  |  11 +-
 .../mozjs/mozjs/0006-support-musl.patch       | 124 +++++-------------
 ...ix-cross-compilation-on-i586-targets.patch |   9 +-
 .../mozjs/mozjs/JS_PUBLIC_API.patch           |  48 ++++---
 .../mozjs/mozjs/add-riscv-support.patch       |  38 ++----
 ...isable-mozglue-in-stand-alone-builds.patch |  74 -----------
 .../mozjs/mozjs/format-overflow.patch         |  12 +-
 .../{mozjs_52.9.1.bb => mozjs_60.5.2.bb}      |  19 +--
 12 files changed, 113 insertions(+), 285 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs_52.9.1.bb => mozjs_60.5.2.bb} (89%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch
index 3bbd10a173..056f74a529 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch
@@ -7,13 +7,13 @@ error: #error Target architecture was not detected as supported by Double-Conver
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
- mfbt/double-conversion/utils.h | 2 +-
+ mfbt/double-conversion/double-conversion/utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
+diff --git a/mfbt/double-conversion/double-conversion/utils.h b/mfbt/double-conversion/double-conversion/utils.h
 index 4f37218..93575cb 100644
---- a/mfbt/double-conversion/utils.h
-+++ b/mfbt/double-conversion/utils.h
+--- a/mfbt/double-conversion/double-conversion/utils.h
++++ b/mfbt/double-conversion/double-conversion/utils.h
 @@ -53,7 +53,7 @@
  // disabled.)
  // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
index ba317bc0c5..a3c1b69e29 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
@@ -14,11 +14,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  js/src/old-configure               |  4 ++--
  3 files changed, 11 insertions(+), 21 deletions(-)
 
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
-index 2123beb..6fe6591 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -179,24 +179,6 @@ def virtualenv_python(env_python, build_env, mozconfig, help):
+@@ -250,24 +250,6 @@ def virtualenv_python(env_python, build_
      else:
          python = sys.executable
  
@@ -42,9 +40,7 @@ index 2123beb..6fe6591 100644
 -
      return python
  
- set_config('PYTHON', virtualenv_python)
-diff --git a/configure.py b/configure.py
-index f7392d0..45323a5 100644
+ 
 --- a/configure.py
 +++ b/configure.py
 @@ -12,7 +12,15 @@ import textwrap
@@ -62,22 +58,11 @@ index f7392d0..45323a5 100644
 +        sys.path.insert(0, os.path.join(sub_dir, module_dir))
 +
  from mozbuild.configure import ConfigureSandbox
- from mozbuild.util import (
-     indented_repr,
-diff --git a/js/src/old-configure b/js/src/old-configure
-index ee4527b..75b00e1 100644
+ from mozbuild.makeutil import Makefile
+ from mozbuild.pythonutil import iter_modules_in_path
 --- a/js/src/old-configure
 +++ b/js/src/old-configure
-@@ -10512,7 +10512,7 @@ if test "$MOZ_BUILD_APP" != js -o -n "$JS_STANDALONE"; then
-     ;;
-   esac
- 
--  eval $dumpenv $PYTHON $_topsrcdir/build/subconfigure.py --prepare "$srcdir" "$moz_config_dir" "$_CONFIG_SHELL" $ac_configure_args 
-+  eval $dumpenv PYTHONPATH=$_topsrcdir/python/mozbuild/ $PYTHON $_topsrcdir/build/subconfigure.py --prepare "$srcdir" "$moz_config_dir" "$_CONFIG_SHELL" $ac_configure_args
- 
-   done
- 
-@@ -10931,7 +10931,7 @@ if test "$JS_STANDALONE"; then
+@@ -9974,7 +9974,7 @@ if test "$JS_STANDALONE"; then
    
  if test "$no_recursion" != yes; then
    trap '' EXIT
@@ -86,6 +71,3 @@ index ee4527b..75b00e1 100644
        exit 1
    fi
  fi
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
index bc1af3c702..a36478bfba 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
@@ -22,11 +22,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  python/mozbuild/mozbuild/configure/constants.py   | 2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
-index 6fe6591..a77b46c 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -357,7 +357,10 @@ def split_triplet(triplet):
+@@ -650,7 +650,10 @@ def split_triplet(triplet, allow_unknown
          canonical_cpu = 'mips32'
          endianness = 'little' if 'el' in cpu else 'big'
      elif cpu in ('mips64', 'mips64el'):
@@ -38,11 +36,9 @@ index 6fe6591..a77b46c 100644
          endianness = 'little' if 'el' in cpu else 'big'
      elif cpu.startswith('aarch64'):
          canonical_cpu = 'aarch64'
-diff --git a/js/src/jit/mips-shared/Architecture-mips-shared.h b/js/src/jit/mips-shared/Architecture-mips-shared.h
-index 7afe305..c6e29dc 100644
 --- a/js/src/jit/mips-shared/Architecture-mips-shared.h
 +++ b/js/src/jit/mips-shared/Architecture-mips-shared.h
-@@ -24,6 +24,8 @@
+@@ -26,6 +26,8 @@
  #define USES_O32_ABI
  #elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABI64)) || defined(JS_SIMULATOR_MIPS64)
  #define USES_N64_ABI
@@ -51,7 +47,7 @@ index 7afe305..c6e29dc 100644
  #else
  #error "Unsupported ABI"
  #endif
-@@ -91,7 +93,7 @@ class Registers
+@@ -93,7 +95,7 @@ class Registers
          ta1 = t5,
          ta2 = t6,
          ta3 = t7,
@@ -60,20 +56,15 @@ index 7afe305..c6e29dc 100644
          a4 = r8,
          a5 = r9,
          a6 = r10,
-diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
-index dfc7cf8..27f83ab 100644
 --- a/python/mozbuild/mozbuild/configure/constants.py
 +++ b/python/mozbuild/mozbuild/configure/constants.py
-@@ -83,8 +83,8 @@ CPU_preprocessor_checks = OrderedDict((
+@@ -90,8 +90,8 @@ CPU_preprocessor_checks = OrderedDict((
      ('hppa', '__hppa__'),
      ('sparc64', '__sparc__ && __arch64__'),
      ('sparc', '__sparc__'),
 -    ('mips64', '__mips64'),
      ('mips32', '__mips__'),
 +    ('mips64', '__mips64'),
+     ('sh4', '__sh__'),
  ))
  
- assert sorted(CPU_preprocessor_checks.keys()) == sorted(CPU.POSSIBLE_VALUES)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
index c111ea5eae..e3f1883a99 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
@@ -15,13 +15,13 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 Rebase to 52.8.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- js/src/js.pc.in | 2 +-
+ js/src/build/js.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/js/src/js.pc.in b/js/src/js.pc.in
+diff --git a/js/src/build/js.pc.in b/js/src/build/js.pc.in
 index 2eae393..c2dea62 100644
---- a/js/src/js.pc.in
-+++ b/js/src/js.pc.in
+--- a/js/src/build/js.pc.in
++++ b/js/src/build/js.pc.in
 @@ -8,4 +8,4 @@ Description: The Mozilla library for JavaScript
  Version: @MOZILLA_VERSION@
  @PKGCONF_REQUIRES_PRIVATE@
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch b/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch
index 38e4698f29..d1da109720 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-do_compile-failed-on-mips.patch
@@ -20,19 +20,14 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  config/config.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/config/config.mk b/config/config.mk
-index 4e3fd1a..d847ffa 100644
 --- a/config/config.mk
 +++ b/config/config.mk
-@@ -523,7 +523,7 @@ EXPAND_MKSHLIB_ARGS = --uselist
+@@ -423,7 +423,7 @@ EXPAND_MKSHLIB_ARGS = --uselist
  ifdef SYMBOL_ORDER
  EXPAND_MKSHLIB_ARGS += --symbol-order $(SYMBOL_ORDER)
  endif
 -EXPAND_MKSHLIB = $(EXPAND_LIBS_EXEC) $(EXPAND_MKSHLIB_ARGS) -- $(MKSHLIB)
 +EXPAND_MKSHLIB = $(EXPAND_LIBS_EXEC) $(EXPAND_MKSHLIB_ARGS) -- $(MKSHLIB) $(OS_LDFLAGS)
  
- # $(call CHECK_SYMBOLS,lib,PREFIX,dep_name,test)
- # Checks that the given `lib` doesn't contain dependency on symbols with a
--- 
-2.7.4
-
+ # autoconf.mk sets OBJ_SUFFIX to an error to avoid use before including
+ # this file
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch
index 32a977ce2b..770d5e0aaa 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0006-support-musl.patch
@@ -7,8 +7,6 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- memory/jemalloc/src/src/pages.c              | 1 -
- memory/mozjemalloc/jemalloc.c                | 7 +++----
  mozglue/misc/TimeStamp_darwin.cpp            | 1 -
  mozglue/misc/TimeStamp_posix.cpp             | 1 -
  nsprpub/pr/src/misc/prsystem.c               | 1 -
@@ -18,62 +16,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  python/psutil/psutil/arch/osx/process_info.c | 1 -
  9 files changed, 3 insertions(+), 12 deletions(-)
 
-diff --git a/memory/jemalloc/src/src/pages.c b/memory/jemalloc/src/src/pages.c
-index 647952a..7b964c8 100644
---- a/memory/jemalloc/src/src/pages.c
-+++ b/memory/jemalloc/src/src/pages.c
-@@ -2,7 +2,6 @@
- #include "jemalloc/internal/jemalloc_internal.h"
- 
- #ifdef JEMALLOC_SYSCTL_VM_OVERCOMMIT
--#include <sys/sysctl.h>
- #endif
- 
- /******************************************************************************/
-diff --git a/memory/mozjemalloc/jemalloc.c b/memory/mozjemalloc/jemalloc.c
-index 5d4d83a..c618de9 100644
---- a/memory/mozjemalloc/jemalloc.c
-+++ b/memory/mozjemalloc/jemalloc.c
-@@ -332,7 +332,6 @@ __FBSDID("$FreeBSD: head/lib/libc/stdlib/malloc.c 180599 2008-07-18 19:35:44Z ja
- #include <sys/time.h>
- #include <sys/types.h>
- #if !defined(MOZ_MEMORY_SOLARIS) && !defined(MOZ_MEMORY_ANDROID)
--#include <sys/sysctl.h>
- #endif
- #include <sys/uio.h>
- #ifndef MOZ_MEMORY
-@@ -674,7 +673,7 @@ static bool malloc_initialized = false;
- #elif defined(MOZ_MEMORY_DARWIN)
- static malloc_mutex_t init_lock = {OS_SPINLOCK_INIT};
- #elif defined(MOZ_MEMORY_LINUX) && !defined(MOZ_MEMORY_ANDROID)
--static malloc_mutex_t init_lock = PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP;
-+static malloc_mutex_t init_lock = PTHREAD_MUTEX_INITIALIZER;
- #elif defined(MOZ_MEMORY)
- static malloc_mutex_t init_lock = PTHREAD_MUTEX_INITIALIZER;
- #else
-@@ -1644,7 +1643,7 @@ malloc_mutex_init(malloc_mutex_t *mutex)
- 	pthread_mutexattr_t attr;
- 	if (pthread_mutexattr_init(&attr) != 0)
- 		return (true);
--	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
-+	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_STALLED);
- 	if (pthread_mutex_init(mutex, &attr) != 0) {
- 		pthread_mutexattr_destroy(&attr);
- 		return (true);
-@@ -1709,7 +1708,7 @@ malloc_spin_init(malloc_spinlock_t *lock)
- 	pthread_mutexattr_t attr;
- 	if (pthread_mutexattr_init(&attr) != 0)
- 		return (true);
--	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
-+	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_STALLED);
- 	if (pthread_mutex_init(lock, &attr) != 0) {
- 		pthread_mutexattr_destroy(&attr);
- 		return (true);
-diff --git a/mozglue/misc/TimeStamp_darwin.cpp b/mozglue/misc/TimeStamp_darwin.cpp
-index f30bc98..3998c9c 100644
 --- a/mozglue/misc/TimeStamp_darwin.cpp
 +++ b/mozglue/misc/TimeStamp_darwin.cpp
-@@ -18,7 +18,6 @@
+@@ -19,7 +19,6 @@
  
  #include <mach/mach_time.h>
  #include <sys/time.h>
@@ -81,20 +26,16 @@ index f30bc98..3998c9c 100644
  #include <time.h>
  #include <unistd.h>
  
-diff --git a/mozglue/misc/TimeStamp_posix.cpp b/mozglue/misc/TimeStamp_posix.cpp
-index 05dedde..d9e30f2 100644
 --- a/mozglue/misc/TimeStamp_posix.cpp
 +++ b/mozglue/misc/TimeStamp_posix.cpp
 @@ -21,7 +21,6 @@
- #if defined(__DragonFly__) || defined(__FreeBSD__) \
-     || defined(__NetBSD__) || defined(__OpenBSD__)
+ #if defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || \
+     defined(__OpenBSD__)
  #include <sys/param.h>
 -#include <sys/sysctl.h>
  #endif
  
  #if defined(__DragonFly__) || defined(__FreeBSD__)
-diff --git a/nsprpub/pr/src/misc/prsystem.c b/nsprpub/pr/src/misc/prsystem.c
-index eba85fb..54b57bb 100644
 --- a/nsprpub/pr/src/misc/prsystem.c
 +++ b/nsprpub/pr/src/misc/prsystem.c
 @@ -27,7 +27,6 @@
@@ -105,22 +46,18 @@ index eba85fb..54b57bb 100644
  #endif
  
  #if defined(DARWIN)
-diff --git a/python/psutil/psutil/_psutil_bsd.c b/python/psutil/psutil/_psutil_bsd.c
-index 7b6e561..0a91262 100644
---- a/python/psutil/psutil/_psutil_bsd.c
-+++ b/python/psutil/psutil/_psutil_bsd.c
-@@ -16,7 +16,6 @@
- #include <fcntl.h>
+--- a/third_party/python/psutil/psutil/_psutil_bsd.c
++++ b/third_party/python/psutil/psutil/_psutil_bsd.c
+@@ -29,7 +29,6 @@
  #include <paths.h>
  #include <sys/types.h>
--#include <sys/sysctl.h>
  #include <sys/param.h>
+-#include <sys/sysctl.h>
  #include <sys/user.h>
  #include <sys/proc.h>
-diff --git a/python/psutil/psutil/_psutil_osx.c b/python/psutil/psutil/_psutil_osx.c
-index 3ebf8ff..b3910ba 100644
---- a/python/psutil/psutil/_psutil_osx.c
-+++ b/python/psutil/psutil/_psutil_osx.c
+ #include <sys/file.h>
+--- a/third_party/python/psutil/psutil/_psutil_osx.c
++++ b/third_party/python/psutil/psutil/_psutil_osx.c
 @@ -13,7 +13,6 @@
  #include <stdlib.h>
  #include <stdio.h>
@@ -129,22 +66,8 @@ index 3ebf8ff..b3910ba 100644
  #include <sys/vmmeter.h>
  #include <libproc.h>
  #include <sys/proc_info.h>
-diff --git a/python/psutil/psutil/arch/bsd/process_info.c b/python/psutil/psutil/arch/bsd/process_info.c
-index 4d73924..46f288d 100644
---- a/python/psutil/psutil/arch/bsd/process_info.c
-+++ b/python/psutil/psutil/arch/bsd/process_info.c
-@@ -15,7 +15,6 @@
- #include <stdio.h>
- #include <string.h>
- #include <sys/types.h>
--#include <sys/sysctl.h>
- #include <sys/param.h>
- #include <sys/user.h>
- #include <sys/proc.h>
-diff --git a/python/psutil/psutil/arch/osx/process_info.c b/python/psutil/psutil/arch/osx/process_info.c
-index b6dd5bb..62a838f 100644
---- a/python/psutil/psutil/arch/osx/process_info.c
-+++ b/python/psutil/psutil/arch/osx/process_info.c
+--- a/third_party/python/psutil/psutil/arch/osx/process_info.c
++++ b/third_party/python/psutil/psutil/arch/osx/process_info.c
 @@ -16,7 +16,6 @@
  #include <stdlib.h>
  #include <stdio.h>
@@ -153,6 +76,23 @@ index b6dd5bb..62a838f 100644
  #include <libproc.h>
  
  #include "process_info.h"
--- 
-2.7.4
-
+--- a/memory/build/Mutex.h
++++ b/memory/build/Mutex.h
+@@ -42,7 +42,7 @@ struct Mutex {
+     if (pthread_mutexattr_init(&attr) != 0) {
+       return false;
+     }
+-    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
++    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_STALLED);
+     if (pthread_mutex_init(&mMutex, &attr) != 0) {
+       pthread_mutexattr_destroy(&attr);
+       return false;
+@@ -102,7 +102,7 @@ typedef Mutex StaticMutex;
+ 
+ #if defined(XP_DARWIN)
+ #define STATIC_MUTEX_INIT OS_SPINLOCK_INIT
+-#elif defined(XP_LINUX) && !defined(ANDROID)
++#elif defined(XP_LINUX) && !defined(ANDROID) && defined(__GLIBC__)
+ #define STATIC_MUTEX_INIT PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP
+ #else
+ #define STATIC_MUTEX_INIT PTHREAD_MUTEX_INITIALIZER
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
index 9194e346a3..3ac25f6aed 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
@@ -17,12 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  js/src/old-configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/js/src/old-configure b/js/src/old-configure
-index 8a8ef52..d7afcff 100644
 --- a/js/src/old-configure
 +++ b/js/src/old-configure
-@@ -3964,7 +3964,7 @@ IMPORT_LIB_SUFFIX=
- DIRENT_INO=d_ino
+@@ -3833,7 +3833,7 @@ AS='$(CC)'
+ AS_DASH_C_FLAG='-c'
  MOZ_USER_DIR=".mozilla"
  
 -MOZ_FIX_LINK_PATHS="-Wl,-rpath-link,${DIST}/bin -Wl,-rpath-link,${prefix}/lib"
@@ -30,6 +28,3 @@ index 8a8ef52..d7afcff 100644
  
  
  
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch b/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch
index 6c87ff2a4c..56b18ba8c6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch
@@ -1,28 +1,40 @@
-Patch from https://bugzilla.mozilla.org/show_bug.cgi?id=1426865
+patch from https://bugzilla.mozilla.org/show_bug.cgi?id=1426865
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1426865]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/js/public/TypeDecls.h
 +++ b/js/public/TypeDecls.h
-@@ -21,22 +21,23 @@
+@@ -21,31 +21,32 @@
  #include <stdint.h>
  
  #include "js-config.h"
 +#include "jstypes.h"
  
- struct JSContext;
+ typedef uint8_t jsbytecode;
+ 
+-class JSAtom;
+-struct JSCompartment;
+-struct JSContext;
 -class JSFunction;
-+class JS_PUBLIC_API(JSFunction);
- class JSObject;
+-class JSObject;
+-struct JSRuntime;
 -class JSScript;
 -class JSString;
 -class JSAddonId;
-+class JS_PUBLIC_API(JSScript);
-+class JS_PUBLIC_API(JSString);
-+class JS_PUBLIC_API(JSAddonId);
+-struct JSFreeOp;
++class JS_PUBLIC_API JSAtom;
++struct JS_PUBLIC_API JSCompartment;
++struct JS_PUBLIC_API JSContext;
++class JS_PUBLIC_API JSFunction;
++class JS_PUBLIC_API JSObject;
++struct JS_PUBLIC_API JSRuntime;
++class JS_PUBLIC_API JSScript;
++class JS_PUBLIC_API JSString;
++class JS_PUBLIC_API JSAddonId;
++struct JS_PUBLIC_API JSFreeOp;
  
 -struct jsid;
-+struct JS_PUBLIC_API(jsid);
++struct JS_PUBLIC_API jsid;
  
  namespace JS {
  
@@ -30,8 +42,14 @@ Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1426865
  
 -class Symbol;
 -class Value;
-+class JS_PUBLIC_API(Symbol);
-+class JS_PUBLIC_API(Value);
- template <typename T> class Handle;
- template <typename T> class MutableHandle;
- template <typename T> class Rooted;
+-class Realm;
+-struct Runtime;
+-struct Zone;
++class JS_PUBLIC_API Symbol;
++class JS_PUBLIC_API Value;
++class JS_PUBLIC_API Realm;
++struct JS_PUBLIC_API Runtime;
++struct JS_PUBLIC_API Zone;
+ 
+ template <typename T>
+ class Handle;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch b/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch
index 4354a9dee6..0a41485610 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch
@@ -4,8 +4,6 @@ Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1318905
 
 Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
 
-diff --git a/build/autoconf/config.guess b/build/autoconf/config.guess
-index d5d667d..1277a86 100755
 --- a/build/autoconf/config.guess
 +++ b/build/autoconf/config.guess
 @@ -1029,6 +1029,9 @@ EOF
@@ -18,39 +16,21 @@ index d5d667d..1277a86 100755
      s390:Linux:*:* | s390x:Linux:*:*)
  	echo ${UNAME_MACHINE}-ibm-linux-${LIBC}
  	exit ;;
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
-index 6fe6591..56e6730 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -362,6 +362,9 @@ def split_triplet(triplet):
-     elif cpu.startswith('aarch64'):
-         canonical_cpu = 'aarch64'
+@@ -658,6 +658,9 @@ def split_triplet(triplet, allow_unknown
+     elif cpu == 'sh4':
+         canonical_cpu = 'sh4'
          endianness = 'little'
 +    elif cpu in ('riscv32', 'riscv64'):
 +        canonical_cpu = cpu
 +        endianness = 'little'
-     else:
-         die('Unknown CPU type: %s' % cpu)
- 
-diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
-index 15dd4bf..4f37218 100644
---- a/mfbt/double-conversion/utils.h
-+++ b/mfbt/double-conversion/utils.h
-@@ -60,7 +60,8 @@
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__) || defined(__aarch64__)
-+    defined(__AARCH64EL__) || defined(__aarch64__) || \
-+    defined(__riscv)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
-diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
-index dfc7cf8..4f8d666 100644
+     elif allow_unknown:
+         canonical_cpu = cpu
+         endianness = 'unknown'
 --- a/python/mozbuild/mozbuild/configure/constants.py
 +++ b/python/mozbuild/mozbuild/configure/constants.py
-@@ -48,6 +48,8 @@ CPU_bitness = {
+@@ -50,6 +50,8 @@ CPU_bitness = {
      'mips64': 64,
      'ppc': 32,
      'ppc64': 64,
@@ -58,8 +38,8 @@ index dfc7cf8..4f8d666 100644
 +    'riscv64': 64,
      's390': 32,
      's390x': 64,
-     'sparc': 32,
-@@ -79,6 +81,8 @@ CPU_preprocessor_checks = OrderedDict((
+     'sh4': 32,
+@@ -82,6 +84,8 @@ CPU_preprocessor_checks = OrderedDict((
      ('s390', '__s390__'),
      ('ppc64', '__powerpc64__'),
      ('ppc', '__powerpc__'),
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch b/meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch
deleted file mode 100644
index 5487cdbe64..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 2fb531ac753500314336ccd508cb2d53f5e768e5 Mon Sep 17 00:00:00 2001
-From: Till Schneidereit <till@tillschneidereit.net>
-Date: Thu, 1 Oct 2015 12:59:09 +0200
-Subject: Disable MOZ_GLUE_IN_PROGRAM in stand-alone builds on all platforms
-
-Otherwise, build fails not being able to find HashBytes.
-
-Patch ported forward to mozjs52 by Philip Chimento
-<philip.chimento@gmail.com>.
-
-https://bugzilla.mozilla.org/show_bug.cgi?id=1176787
-
-Upstream-Status: Backport
-
-Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
----
- js/src/old-configure    | 20 ++++++++++++--------
- mozglue/build/moz.build |  2 +-
- 2 files changed, 13 insertions(+), 9 deletions(-)
-
-diff --git a/js/src/old-configure b/js/src/old-configure
-index d7afcff..8a6f142 100644
---- a/js/src/old-configure
-+++ b/js/src/old-configure
-@@ -8546,21 +8546,25 @@ if test -z "$MOZ_ENABLE_WARNINGS_AS_ERRORS"; then
- fi
- 
- 
--case "${OS_TARGET}" in
--Android|WINNT|Darwin)
-+if test "$JS_STANDALONE"; then
-   MOZ_GLUE_IN_PROGRAM=
--  ;;
--*)
--    MOZ_GLUE_IN_PROGRAM=1
--  cat >> confdefs.pytmp <<\EOF
-+else
-+  case "${OS_TARGET}" in
-+  Android|WINNT|Darwin)
-+    MOZ_GLUE_IN_PROGRAM=
-+    ;;
-+  *)
-+        MOZ_GLUE_IN_PROGRAM=1
-+    cat >> confdefs.pytmp <<\EOF
-     (''' MOZ_GLUE_IN_PROGRAM ''', ' 1 ')
- EOF
- cat >> confdefs.h <<\EOF
- #define MOZ_GLUE_IN_PROGRAM 1
- EOF
- 
--  ;;
--esac
-+    ;;
-+  esac
-+fi
- 
- if test "$MOZ_MEMORY"; then
-   if test "x$MOZ_DEBUG" = "x1"; then
-diff --git a/mozglue/build/moz.build b/mozglue/build/moz.build
-index d289747..e3be5a2 100644
---- a/mozglue/build/moz.build
-+++ b/mozglue/build/moz.build
-@@ -6,7 +6,7 @@
- 
- # Build mozglue as a shared lib on Windows, OSX and Android.
- # If this is ever changed, update MOZ_SHARED_MOZGLUE in browser/installer/Makefile.in
--if CONFIG['OS_TARGET'] in ('WINNT', 'Darwin', 'Android'):
-+if CONFIG['OS_TARGET'] in ('WINNT', 'Darwin', 'Android') and not CONFIG['JS_STANDALONE']:
-     SharedLibrary('mozglue')
- else:
-     Library('mozglue')
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch b/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch
index 29c6a7b69c..e257fc6f62 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch
@@ -11,11 +11,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/js/src/moz.build
 +++ b/js/src/moz.build
 @@ -785,7 +785,7 @@ if CONFIG['JS_HAS_CTYPES']:
-         DEFINES['FFI_BUILDING'] = True
- 
- if CONFIG['GNU_CXX']:
--    CXXFLAGS += ['-Wno-shadow', '-Werror=format']
-+    CXXFLAGS += ['-Wno-shadow']
+ if CONFIG['CC_TYPE'] in ('clang', 'gcc'):
+     # Also disable strict-aliasing for GCC compiler, that is enabled by default
+     # starting with version 7.1, see Bug 1363009
+-    CXXFLAGS += ['-Wno-shadow', '-Werror=format', '-fno-strict-aliasing']
++    CXXFLAGS += ['-Wno-shadow', '-fno-strict-aliasing']
  
  # Suppress warnings in third-party code.
- if CONFIG['CLANG_CXX']:
+ if CONFIG['CC_TYPE'] in ('clang', 'gcc'):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
similarity index 89%
rename from meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
rename to meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
index 5e67eeea71..3cccf40ddf 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
 HOMEPAGE = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc9b6ecd19a14a54a628edaaf23733bf"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.orig.tar.xz \
+SRC_URI = "https://dev.gentoo.org/~axs/distfiles/mozjs-60.5.2.tar.bz2 \
            file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
            file://0010-fix-cross-compilation-on-i586-targets.patch \
            file://0001-do-not-create-python-environment.patch \
@@ -11,12 +11,11 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.o
            file://0003-workaround-autoconf-2.13-detection-failed.patch \
            file://0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch \
            file://0005-fix-do_compile-failed-on-mips.patch \
-           file://disable-mozglue-in-stand-alone-builds.patch \
            file://add-riscv-support.patch \
            file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
            file://format-overflow.patch \
-           file://JS_PUBLIC_API.patch \
            file://0001-To-fix-build-error-on-arm32BE.patch \
+           file://JS_PUBLIC_API.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
@@ -24,16 +23,17 @@ SRC_URI_append_libc-musl = " \
 SRC_URI_append_mipsarchn32 = " \
            file://0001-fix-compiling-failure-on-mips64-n32-bsp.patch \
            "
-
-SRC_URI[md5sum] = "c9473c625ee0a9edaaac8b742ff24c5f"
-SRC_URI[sha256sum] = "f9324a6724233ab15f10381fe13e635e89d725ef1e78025a0a7d36c58a84a0f9"
+SRC_URI[md5sum] = "023ed014e9e93d01620d121bc06a3589"
+SRC_URI[sha256sum] = "f51039c997415fd0f13f8e01966b4a8ff80cbf90deb8b14c18827104a369cc0d"
 
 inherit autotools pkgconfig perlnative pythonnative
 
 inherit distro_features_check
 CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
 
-DEPENDS += "nspr zlib"
+DEPENDS += "nspr zlib python-six-native python-pytoml-native \
+            python-jsmin-native python-futures-native \
+            python-which-native"
 
 # Disable null pointer optimization in gcc >= 6
 # https://bugzilla.redhat.com/show_bug.cgi?id=1328045
@@ -47,6 +47,7 @@ EXTRA_OECONF = " \
     --prefix=${prefix} \
     --libdir=${libdir} \
     --disable-tests --disable-strip --disable-optimize \
+    --disable-jemalloc \
     --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
 "
@@ -105,7 +106,7 @@ do_install_prepend() {
 
 PACKAGES =+ "lib${BPN}"
 FILES_lib${BPN} += "${libdir}/lib*.so"
-FILES_${PN}-dev += "${bindir}/js52-config"
+FILES_${PN}-dev += "${bindir}/js60-config"
 
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
-- 
2.21.0



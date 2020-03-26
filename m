Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.32831.1585212005170757062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02Q8dRxS027820
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 26 Mar 2020 01:39:37 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Mar 2020 01:39:04 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-grpcio: fix native build failure on ubuntu 16.04 and centos 8
Date: Thu, 26 Mar 2020 16:39:01 +0800
Message-ID: <1585211941-9451-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

1. Keep '-std=c++11' and '-std=gnu99' to fix native build error
with old gcc (such as gcc 5.4.0 on ubuntu 16.04); for clang, remove
them through setting GRPC_PYTHON_CFLAGS at do_compile in bb recipe

2. While export CC="gcc ", cc_args is empty, it will
cause subprocess.Popen always return 1. On centos 8, if you don't
install package libatomic, there will be a native build error
`cannot find /usr/lib64/libatomic.so.1.2.0'.

Add no harm '-g' to cc_args if cc_args is empty.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...up.py-Do-not-mix-C-and-C-compiler-options.patch | 56 +++++++++++++---------
 .../python/python3-grpcio_1.27.1.bb                |  4 ++
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index f39a82a..bff50a0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -1,4 +1,4 @@
-1From b02be74a2eff8abc612ef84f30e0fbce6a7f65f5 Mon Sep 17 00:00:00 2001
+From 2ef8a85933f3ac36b289979ff9edd49dd12d0d16 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 4 Aug 2017 09:04:07 -0700
 Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
@@ -14,17 +14,38 @@ gcc7 ( defaults are -std=gnu11 and -std=gnu++14 )
 anyway
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+1. Keep '-std=c++11' and '-std=gnu99' to fix native build error
+with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
+we will remove them through GRPC_PYTHON_CFLAGS at do_compile
+in bb recipe.
+
+2. While export CC="gcc ", cc_args is None, it will
+cause subprocess.Popen always return 1. On centos 8, if you don't
+install package libatomic, there will be a native build error
+`cannot find /usr/lib64/libatomic.so.1.2.0'.
+
+Add no harm '-g' to cc_args if cc_args is empty.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ setup.py                      | 6 +++++-
+ src/python/grpcio/commands.py | 5 ++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
 
+diff --git a/setup.py b/setup.py
+index e950057..1b68221 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -144,9 +144,10 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.
+@@ -144,9 +144,13 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.get(
  
  def check_linker_need_libatomic():
    """Test if linker on system needs libatomic."""
 +  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
++  if not cc_args:
++      cc_args = "-g"
++
    code_test = (b'#include <atomic>\n' +
                 b'int main() { return std::atomic<int64_t>{}; }')
 -  cc_test = subprocess.Popen(['cc', '-x', 'c++', '-std=c++11', '-'],
@@ -32,33 +53,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                               stdin=PIPE,
                               stdout=PIPE,
                               stderr=PIPE)
-@@ -163,7 +164,7 @@ def check_linker_need_libatomic():
- EXTRA_ENV_COMPILE_ARGS = os.environ.get('GRPC_PYTHON_CFLAGS', None)
- EXTRA_ENV_LINK_ARGS = os.environ.get('GRPC_PYTHON_LDFLAGS', None)
- if EXTRA_ENV_COMPILE_ARGS is None:
--  EXTRA_ENV_COMPILE_ARGS = ' -std=c++11'
-+  EXTRA_ENV_COMPILE_ARGS = ' '
-   if 'win32' in sys.platform:
-     if sys.version_info < (3, 5):
-       EXTRA_ENV_COMPILE_ARGS += ' -D_hypot=hypot'
-@@ -180,7 +181,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
-       # available dynamically
-       EXTRA_ENV_COMPILE_ARGS += ' /MT'
-   elif "linux" in sys.platform:
--    EXTRA_ENV_COMPILE_ARGS += ' -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
-+    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
-   elif "darwin" in sys.platform:
-     EXTRA_ENV_COMPILE_ARGS += ' -stdlib=libc++ -fvisibility=hidden -fno-wrapv -fno-exceptions'
- 
+diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
+index 064dda9..a75d8b9 100644
 --- a/src/python/grpcio/commands.py
 +++ b/src/python/grpcio/commands.py
-@@ -216,7 +216,8 @@ class BuildExt(build_ext.build_ext):
+@@ -216,7 +216,10 @@ class BuildExt(build_ext.build_ext):
              when invoked in C mode. GCC is okay with this, while clang is not.
              """
              # TODO(lidiz) Remove the generated a.out for success tests.
 -            cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
 +            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
++            if not cc_args:
++                cc_args = "-g"
 +            cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c', '-std=c++11', '-'],
                                         stdin=subprocess.PIPE,
                                         stdout=subprocess.PIPE,
                                         stderr=subprocess.PIPE)
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
index 42260cb..358b237 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
@@ -23,6 +23,10 @@ inherit pypi
 
 export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
 
+do_compile_prepend_toolchain-clang() {
+    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions'
+}
+
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


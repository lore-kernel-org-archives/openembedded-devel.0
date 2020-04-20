Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2718.1587376738195612764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 02:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03K9wRXP016354
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 02:58:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Apr 2020 02:58:31 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: Add 7.4.4
Date: Mon, 20 Apr 2020 17:58:29 +0800
Message-ID: <1587376709-244063-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* Add php 7.4, and also keep 7.3 existed. 
refer:
https://www.php.net/migration74
https://www.php.net/supported-versions.php

* note: for 7.4, pear is disabled by default,
and it will be deprecated in future.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...nfigure.ac-don-t-include-build-libtool.m4.patch |  30 +++
 .../0001-php.m4-don-t-unset-cache-variables.patch  |  39 +++
 ...7.4-0001-opcache-config.m4-enable-opcache.patch | 230 +++++++++++++++++
 ...01-php-don-t-use-broken-wrapper-for-mkdir.patch |  29 +++
 .../recipes-devtools/php/php/php7.4-iconv.patch    |  41 ++++
 .../php/php/php7.4-imap-fix-autofoo.patch          |  41 ++++
 .../php/php/php7.4-phar-makefile.patch             |  46 ++++
 .../php/php/php7.4-php_exec_native.patch           |  26 ++
 meta-oe/recipes-devtools/php/php_7.4.4.bb          | 272 +++++++++++++++++++++
 9 files changed, 754 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
 create mode 100644 meta-oe/recipes-devtools/php/php_7.4.4.bb

diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
new file mode 100644
index 0000000..2861366
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
@@ -0,0 +1,30 @@
+From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 17 Apr 2020 15:01:57 +0800
+Subject: [PATCH] configure.ac: don't include build/libtool.m4
+
+we delete build/libtool.m4 before do_configure,
+we will use libtool.m4 under ACLOCALDIR
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 06c6a27..f85144e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
+ m4_include([build/ax_check_compile_flag.m4])
+ m4_include([build/ax_func_which_gethostbyname_r.m4])
+ m4_include([build/ax_gcc_func_attribute.m4])
+-m4_include([build/libtool.m4])
+ m4_include([build/php_cxx_compile_stdcxx.m4])
+ m4_include([build/php.m4])
+ m4_include([build/pkg.m4])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
new file mode 100644
index 0000000..0d721ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
@@ -0,0 +1,39 @@
+php.m4: don't unset cache variables
+
+Unsetting prevents cache variable from being passed to configure.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+update this patch to 7.4.4, acinclude.m4 move to build/php.m4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/php.m4 | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/build/php.m4 b/build/php.m4
+index 5c45d13..218ec47 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
+ dnl
+ AC_DEFUN([PHP_CHECK_FUNC_LIB],[
+   ifelse($2,,:,[
+-  unset ac_cv_lib_$2[]_$1
+-  unset ac_cv_lib_$2[]___$1
+   unset found
+   AC_CHECK_LIB($2, $1, [found=yes], [
+     AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
+@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+ dnl HAVE_library if found and adds the library to LIBS.
+ dnl
+ AC_DEFUN([PHP_CHECK_FUNC],[
+-  unset ac_cv_func_$1
+-  unset ac_cv_func___$1
+   unset found
+ 
+   AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
new file mode 100644
index 0000000..ee0d5ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
@@ -0,0 +1,230 @@
+opcache/config.m4: enable opcache
+
+We can't use AC_TRY_RUN to run programs in a cross compile environment.
+Set
+the variables directly instead since we know that we'd be running on
+latest
+enough linux kernel.
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ext/opcache/config.m4 | 194 +-------------------------------------------------
+ 1 file changed, 3 insertions(+), 191 deletions(-)
+
+diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
+index 6c40caf..84ddf1e 100644
+--- a/ext/opcache/config.m4
++++ b/ext/opcache/config.m4
+@@ -23,201 +23,13 @@ if test "$PHP_OPCACHE" != "no"; then
+   AC_CHECK_FUNCS([mprotect])
+ 
+   AC_MSG_CHECKING(for sysvipc shared memory support)
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/ipc.h>
+-#include <sys/shm.h>
+-#include <unistd.h>
+-#include <string.h>
+-
+-int main() {
+-  pid_t pid;
+-  int status;
+-  int ipc_id;
+-  char *shm;
+-  struct shmid_ds shmbuf;
+-
+-  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
+-  if (ipc_id == -1) {
+-    return 1;
+-  }
+-
+-  shm = shmat(ipc_id, NULL, 0);
+-  if (shm == (void *)-1) {
+-    shmctl(ipc_id, IPC_RMID, NULL);
+-    return 2;
+-  }
+-
+-  if (shmctl(ipc_id, IPC_STAT, &shmbuf) != 0) {
+-    shmdt(shm);
+-    shmctl(ipc_id, IPC_RMID, NULL);
+-    return 3;
+-  }
+-
+-  shmbuf.shm_perm.uid = getuid();
+-  shmbuf.shm_perm.gid = getgid();
+-  shmbuf.shm_perm.mode = 0600;
+-
+-  if (shmctl(ipc_id, IPC_SET, &shmbuf) != 0) {
+-    shmdt(shm);
+-    shmctl(ipc_id, IPC_RMID, NULL);
+-    return 4;
+-  }
+-
+-  shmctl(ipc_id, IPC_RMID, NULL);
+-
+-  strcpy(shm, "hello");
+-
+-  pid = fork();
+-  if (pid < 0) {
+-    return 5;
+-  } else if (pid == 0) {
+-    strcpy(shm, "bye");
+-    return 6;
+-  }
+-  if (wait(&status) != pid) {
+-    return 7;
+-  }
+-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
+-    return 8;
+-  }
+-  if (strcmp(shm, "bye") != 0) {
+-    return 9;
+-  }
+-  return 0;
+-}
+-]])],[dnl
+-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+-    msg=yes],[msg=no],[msg=no])
+-  AC_MSG_RESULT([$msg])
++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+ 
+   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/mman.h>
+-#include <unistd.h>
+-#include <string.h>
+-
+-#ifndef MAP_ANON
+-# ifdef MAP_ANONYMOUS
+-#  define MAP_ANON MAP_ANONYMOUS
+-# endif
+-#endif
+-#ifndef MAP_FAILED
+-# define MAP_FAILED ((void*)-1)
+-#endif
++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+ 
+-int main() {
+-  pid_t pid;
+-  int status;
+-  char *shm;
+-
+-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+-  if (shm == MAP_FAILED) {
+-    return 1;
+-  }
+-
+-  strcpy(shm, "hello");
+-
+-  pid = fork();
+-  if (pid < 0) {
+-    return 5;
+-  } else if (pid == 0) {
+-    strcpy(shm, "bye");
+-    return 6;
+-  }
+-  if (wait(&status) != pid) {
+-    return 7;
+-  }
+-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
+-    return 8;
+-  }
+-  if (strcmp(shm, "bye") != 0) {
+-    return 9;
+-  }
+-  return 0;
+-}
+-]])],[dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+-    msg=yes],[msg=no],[msg=no])
+-  AC_MSG_RESULT([$msg])
+-
+-  PHP_CHECK_FUNC_LIB(shm_open, rt)
+   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/mman.h>
+-#include <sys/stat.h>
+-#include <fcntl.h>
+-#include <unistd.h>
+-#include <string.h>
+-#include <stdlib.h>
+-#include <stdio.h>
+-
+-#ifndef MAP_FAILED
+-# define MAP_FAILED ((void*)-1)
+-#endif
+-
+-int main() {
+-  pid_t pid;
+-  int status;
+-  int fd;
+-  char *shm;
+-  char tmpname[4096];
+-
+-  sprintf(tmpname,"/opcache.test.shm.%dXXXXXX", getpid());
+-  if (mktemp(tmpname) == NULL) {
+-    return 1;
+-  }
+-  fd = shm_open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
+-  if (fd == -1) {
+-    return 2;
+-  }
+-  if (ftruncate(fd, 4096) < 0) {
+-    close(fd);
+-    shm_unlink(tmpname);
+-    return 3;
+-  }
+-
+-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+-  if (shm == MAP_FAILED) {
+-    return 4;
+-  }
+-  shm_unlink(tmpname);
+-  close(fd);
+-
+-  strcpy(shm, "hello");
+-
+-  pid = fork();
+-  if (pid < 0) {
+-    return 5;
+-  } else if (pid == 0) {
+-    strcpy(shm, "bye");
+-    return 6;
+-  }
+-  if (wait(&status) != pid) {
+-    return 7;
+-  }
+-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
+-    return 8;
+-  }
+-  if (strcmp(shm, "bye") != 0) {
+-    return 9;
+-  }
+-  return 0;
+-}
+-]])],[dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
+-    AC_MSG_RESULT([yes])
+-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ])
++  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
+ 
+   PHP_NEW_EXTENSION(opcache,
+ 	ZendAccelerator.c \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
new file mode 100644
index 0000000..d687373
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -0,0 +1,29 @@
+From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 3 Nov 2011 14:27:15 +0100
+Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+
+Upstream-Status: Inappropriate
+
+ build/Makefile.global | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/Makefile.global b/build/Makefile.global
+index ff858c2..ae554b4 100644
+--- a/build/Makefile.global
++++ b/build/Makefile.global
+@@ -1,4 +1,4 @@
+-mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
++mkinstalldirs = mkdir -p
+ INSTALL = $(top_srcdir)/build/shtool install -c
+ INSTALL_DATA = $(INSTALL) -m 644
+ 
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
new file mode 100644
index 0000000..9ec8a89
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/php.m4        | 3 ++-
+ ext/iconv/config.m4 | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/build/php.m4 b/build/php.m4
+index 7392876..5c45d13 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+   echo > ext/iconv/php_iconv_supports_errno.h
+ 
+   dnl Check libc first if no path is provided in --with-iconv.
+-  if test "$PHP_ICONV" = "yes"; then
++  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
++  if test "$PHP_ICONV" != "no"; then
+     dnl Reset LIBS temporarily as it may have already been included -liconv in.
+     LIBS_save="$LIBS"
+     LIBS=
+diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
+index fe9b47a..b6b632f 100644
+--- a/ext/iconv/config.m4
++++ b/ext/iconv/config.m4
+@@ -14,7 +14,7 @@ if test "$PHP_ICONV" != "no"; then
+ 
+   if test "$iconv_avail" != "no"; then
+     if test -z "$ICONV_DIR"; then
+-      for i in /usr/local /usr; do
++      for i in $PHP_ICONV /usr/local /usr; do
+         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
+           PHP_ICONV_PREFIX="$i"
+           break
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
new file mode 100644
index 0000000..ebe5f6a
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ext/imap/config.m4 | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
+index 5086a31..0e938bd 100644
+--- a/ext/imap/config.m4
++++ b/ext/imap/config.m4
+@@ -110,7 +110,7 @@ if test "$PHP_IMAP" != "no"; then
+     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
+     AC_DEFINE(HAVE_IMAP,1,[ ])
+ 
+-    for i in $PHP_IMAP /usr/local /usr; do
++    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
+       IMAP_INC_CHK()
+       el[]IMAP_INC_CHK(/include/c-client)
+       el[]IMAP_INC_CHK(/include/imap)
+@@ -199,13 +199,7 @@ if test "$PHP_IMAP" != "no"; then
+       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
+     fi
+ 
+-    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r "$IMAP_DIR/c-client/c-client.a" ; then
+-      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-client.a" >/dev/null 2>&1
+-    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
+-      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" >/dev/null 2>&1
+-    fi
+-
+-    for lib in c-client4 c-client imap; do
++    for lib in /usr/lib c-client4 c-client imap; do
+       IMAP_LIB=$lib
+       IMAP_LIB_CHK($PHP_LIBDIR)
+       IMAP_LIB_CHK(c-client)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
new file mode 100644
index 0000000..eb73bc4
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
@@ -0,0 +1,46 @@
+Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Fix phar packaging
+
+Inherited from OE-Classic, with some additions to fix host paths leaking
+into the target package.
+
+Upstream-Status: Inappropriate [config]
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ext/phar/Makefile.frag | 17 +++--------------
+ 1 file changed, 3 insertions(+), 14 deletions(-)
+
+diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
+index 6442f33..6145412 100644
+--- a/ext/phar/Makefile.frag
++++ b/ext/phar/Makefile.frag
+@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
+ 
+ PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
+ PHP_PHARCMD_EXECUTABLE = ` \
+-	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
+-		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
+-		if test "x$(PHP_MODULES)" != "x"; then \
+-		$(top_srcdir)/build/shtool echo -n -- " -d extension_dir=$(top_builddir)/modules"; \
+-		for i in bz2 zlib phar; do \
+-			if test -f "$(top_builddir)/modules/$$i.la"; then \
+-				. $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
+-			fi; \
+-		done; \
+-		fi; \
+-	else \
+-		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
+-	fi;`
+-PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
++               $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
++
++PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
+ 
+ $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
+ 	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
new file mode 100644
index 0000000..4aec481
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
@@ -0,0 +1,26 @@
+Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Inappriate
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ sapi/cli/config.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
+index 917d45f..aaf1e27 100644
+--- a/sapi/cli/config.m4
++++ b/sapi/cli/config.m4
+@@ -47,7 +47,7 @@ if test "$PHP_CLI" != "no"; then
+   esac
+ 
+   dnl Set executable for tests.
+-  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
++  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
+   PHP_SUBST(PHP_EXECUTABLE)
+ 
+   dnl Expose to Makefile.
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
new file mode 100644
index 0000000..1f64172
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -0,0 +1,272 @@
+SUMMARY = "A server-side, HTML-embedded scripting language"
+HOMEPAGE = "http://www.php.net"
+SECTION = "console/network"
+
+LICENSE = "PHP-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30"
+
+BBCLASSEXTEND = "native"
+DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
+DEPENDS_class-native = "zlib-native libxml2-native"
+
+PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
+
+SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
+           file://debian-php-fixheader.patch \
+           file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
+           file://php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
+           file://0001-php.m4-don-t-unset-cache-variables.patch \
+          "
+
+SRC_URI_append_class-target = " \
+            file://php7.4-imap-fix-autofoo.patch \
+            file://php7.4-php_exec_native.patch \
+            file://php-fpm.conf \
+            file://php-fpm-apache.conf \
+            file://70_mod_php${PHP_MAJOR_VERSION}.conf \
+            file://php-fpm.service \
+            file://pear-makefile.patch \
+            file://php7.4-phar-makefile.patch \
+            file://php7.4-0001-opcache-config.m4-enable-opcache.patch \
+            file://xfail_two_bug_tests.patch \
+            file://php7.4-iconv.patch \
+          "
+S = "${WORKDIR}/php-${PV}"
+SRC_URI[md5sum] = "262c258a3b8b5699fcca89a64e58758c"
+SRC_URI[sha256sum] = "308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4a37475e082fa9829f"
+
+inherit autotools pkgconfig python3native gettext
+
+# phpize is not scanned for absolute paths by default (but php-config is).
+#
+SSTATE_SCAN_FILES += "phpize"
+SSTATE_SCAN_FILES += "build-defs.h"
+
+PHP_LIBDIR = "${libdir}/php${PHP_MAJOR_VERSION}"
+
+
+# Common EXTRA_OECONF
+COMMON_EXTRA_OECONF = "--enable-sockets \
+                       --enable-pcntl \
+                       --enable-shared \
+                       --disable-rpath \
+                       --with-pic \
+                       --libdir=${PHP_LIBDIR} \
+"
+EXTRA_OECONF = "--enable-mbstring \
+                --enable-fpm \
+                --with-libdir=${baselib} \
+                --with-gettext=${STAGING_LIBDIR}/.. \
+                --with-zlib=${STAGING_LIBDIR}/.. \
+                --with-iconv=${STAGING_LIBDIR}/.. \
+                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
+                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
+                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
+                ${COMMON_EXTRA_OECONF} \
+"
+
+EXTRA_OECONF_append_riscv64 = " --with-pcre-jit=no"
+EXTRA_OECONF_append_riscv32 = " --with-pcre-jit=no"
+
+CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
+
+EXTRA_OECONF_class-native = " \
+                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
+                --without-iconv \
+                ${COMMON_EXTRA_OECONF} \
+"
+
+PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
+"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
+
+PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
+                        --with-pdo-mysql=mysqlnd \
+                        ,--without-mysqli --without-pdo-mysql \
+                        ,mysql5"
+
+PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
+                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
+                          ,--without-sqlite3 --without-pdo-sqlite \
+                          ,sqlite3"
+PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
+PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
+PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
+PACKAGECONFIG[pam] = ",,libpam"
+PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
+                       --with-imap-ssl=${STAGING_DIR_HOST} \
+                       ,--without-imap --without-imap-ssl \
+                       ,uw-imap"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
+PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
+
+export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
+export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
+CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
+
+EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
+
+acpaths = ""
+
+do_configure_prepend () {
+    #rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
+    rm -f ${S}/ltmain.sh ${S}/aclocal.m4
+    sed -i -e 's;build/libtool.m4;${ACLOCALDIR}/libtool.m4;g' ${S}/configure.ac
+    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
+}
+
+do_configure_append() {
+    # No, libtool, we really don't want rpath set...
+    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
+    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
+}
+
+do_install_append_class-native() {
+    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
+    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
+    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
+}
+
+do_install_prepend() {
+    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALDIR}/ltoptions.m4 \
+        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 > ${S}/build/libtool.m4
+}
+
+do_install_prepend_class-target() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
+        # Install dummy config file so apxs doesn't fail
+        install -d ${D}${sysconfdir}/apache2
+        printf "\nLoadModule dummy_module modules/mod_dummy.so\n" > ${D}${sysconfdir}/apache2/httpd.conf
+    fi
+}
+
+# fixme
+do_install_append_class-target() {
+    install -d ${D}${sysconfdir}/
+    rm -rf ${D}/${TMPDIR}
+    rm -rf ${D}/.registry
+    rm -rf ${D}/.channels
+    rm -rf ${D}/.[a-z]*
+    rm -rf ${D}/var
+    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
+    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
+    install -d ${D}/${sysconfdir}/apache2/conf.d
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+    install -d ${D}${sysconfdir}/init.d
+    sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+            ${D}${systemd_unitdir}/system/php-fpm.service
+    fi
+
+    TMP=`dirname ${D}/${TMPDIR}`
+    while test ${TMP} != ${D}; do
+        if [ -d ${TMP} ]; then
+            rmdir ${TMP}
+        fi
+        TMP=`dirname ${TMP}`;
+    done
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/apache2/modules.d
+        install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
+        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
+        sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
+        cat ${S}/php.ini-production | \
+            sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
+            > ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/php.ini
+        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
+    fi
+}
+
+SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
+
+php_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+
+    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
+    sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
+}
+
+MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
+
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
+
+RDEPENDS_${PN} += "libgcc"
+RDEPENDS_${PN}-pear = "${PN}"
+RDEPENDS_${PN}-phar = "${PN}-cli"
+RDEPENDS_${PN}-cli = "${PN}"
+RDEPENDS_${PN}-modphp = "${PN} apache2"
+RDEPENDS_${PN}-opcache = "${PN}"
+
+INITSCRIPT_PACKAGES = "${PN}-fpm"
+inherit update-rc.d
+
+FILES_${PN}-dbg =+ "${bindir}/.debug \
+                    ${libexecdir}/apache2/modules/.debug"
+FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
+FILES_${PN}-cli = "${bindir}/php"
+FILES_${PN}-phar = "${bindir}/phar*"
+FILES_${PN}-cgi = "${bindir}/php-cgi"
+FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service ${sysconfdir}/php-fpm.d/www.conf.default"
+FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
+CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
+CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
+INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
+INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
+FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/PEAR \
+                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php \
+                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.php \
+                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.alias \
+                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar.php \
+                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS/Guess.php \
+                ${PHP_LIBDIR}/php/data/PEAR \
+                ${sysconfdir}/pear.conf"
+FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
+                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
+                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
+                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
+FILES_${PN}-staticdev += "${PHP_LIBDIR}/extensions/*/*.a"
+FILES_${PN}-opcache = "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}"
+FILES_${PN} = "${PHP_LIBDIR}/php"
+FILES_${PN} += "${bindir} ${libexecdir}/apache2"
+
+SUMMARY_${PN}-modphp = "PHP module for the Apache HTTP server"
+FILES_${PN}-modphp = "${libdir}/apache2 ${sysconfdir}"
+
+MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp', '', d)}"
+RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+
+do_install_append_class-native() {
+    create_wrapper ${D}${bindir}/php \
+        PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
+}
+
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
+# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
+# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
+# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
+# | make: *** [ext/standard/math.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
-- 
2.7.4


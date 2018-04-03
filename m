Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C0CDA7487F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 09:50:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 02:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,400,1517904000"; d="scan'208";a="44486615"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.235])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2018 02:50:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 17:50:15 +0800
Message-Id: <1522749016-17637-5-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
References: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
Subject: [meta-oe][PATCH 4/5] php: add opcache extension to PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Apr 2018 09:50:40 -0000

OPcache improves PHP performance by storing precompiled script bytecode
in shared memory, thereby removing the need for PHP to load and parse
scripts on each request [1].

Add an option to enable opcache in php. AC_CHECK_FUNC isn't suitable for a
cross-compile environment, so pass the configure options instead to force
dlopen detection that is necessary to have extension support enabled.

On a standard phpbench test, I see a performance improvement of > 40%.

[1] http://php.net/manual/en/book.opcache.php

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc               |  14 +-
 ...-acinclude.m4-don-t-unset-cache-variables.patch |  39 +++
 .../0001-opcache-config.m4-enable-opcache.patch    | 385 ++++++++++++++++++++
 meta-oe/recipes-devtools/php/php/configure.patch   |  21 --
 ...hp5-0001-opcache-config.m4-enable-opcache.patch | 387 +++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.6.35.bb         |   1 +
 meta-oe/recipes-devtools/php/php_7.2.4.bb          |   1 +
 7 files changed, 822 insertions(+), 26 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/configure.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php5-0001-opcache-config.m4-enable-opcache.patch

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index fbc750d..8ba218c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -21,7 +21,7 @@ SRC_URI_append_class-target = " \
             file://php_exec_native.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
-            file://configure.patch \
+            file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
             file://php-fpm.service \
           "
@@ -40,7 +40,6 @@ PHP_LIBDIR = "${libdir}/php${PHP_MAJOR_VERSION}"
 COMMON_EXTRA_OECONF = "--enable-sockets \
                        --enable-pcntl \
                        --enable-shared \
-                       --disable-opcache \
                        --disable-rpath \
                        --with-pic \
                        --libdir=${PHP_LIBDIR} \
@@ -59,6 +58,9 @@ EXTRA_OECONF = "--enable-mbstring \
                 ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
                 ${COMMON_EXTRA_OECONF} \
 "
+
+CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes"
+
 EXTRA_OECONF_class-native = " \
                 --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
                 --without-iconv \
@@ -89,7 +91,7 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
                        ,--without-imap --without-imap-ssl \
                        ,uw-imap"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-
+PACKAGECONFIG[opcache] = ",--disable-opcache"
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
@@ -196,14 +198,14 @@ php_sysroot_preprocess () {
 
 MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
 
 RDEPENDS_${PN} += "libgcc"
 RDEPENDS_${PN}-pear = "${PN}"
 RDEPENDS_${PN}-phar = "${PN}-cli"
 RDEPENDS_${PN}-cli = "${PN}"
 RDEPENDS_${PN}-modphp = "${PN} apache2"
-RDEPENDS_${PN}-dev = "${PN}"
+RDEPENDS_${PN}-opcache = "${PN}"
 
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
@@ -232,6 +234,8 @@ FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
                 ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
                 ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
                 ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
+FILES_${PN}-staticdev += "${PHP_LIBDIR}/extensions/*/*.a"
+FILES_${PN}-opcache = "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}"
 FILES_${PN} = "${PHP_LIBDIR}/php"
 FILES_${PN} += "${bindir}"
 
diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
new file mode 100644
index 0000000..a250cac
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
@@ -0,0 +1,39 @@
+From dfebe81f946a83fe2499fc84d4f3dbdc5612276c Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Tue, 3 Apr 2018 11:35:03 +0800
+Subject: [PATCH] acinclude.m4: don't unset cache variables
+
+Unsetting prevents cache variable from being passed to configure.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ acinclude.m4 | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index f6a55ec..d3346df 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1890,8 +1890,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
+ dnl
+ AC_DEFUN([PHP_CHECK_FUNC_LIB],[
+   ifelse($2,,:,[
+-  unset ac_cv_lib_$2[]_$1
+-  unset ac_cv_lib_$2[]___$1
+   unset found
+   AC_CHECK_LIB($2, $1, [found=yes], [
+     AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
+@@ -1923,8 +1921,6 @@ dnl in the default libraries and as a fall back in the specified library.
+ dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
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
diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
new file mode 100644
index 0000000..0d24d34
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
@@ -0,0 +1,385 @@
+From b2fb725dc404d471371731b663234e87cb0fca84 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Mon, 2 Apr 2018 17:54:52 +0800
+Subject: [PATCH] opcache/config.m4: enable opcache
+
+We can't use AC_TRY_RUN to run programs in a cross compile environment. Set
+the variables directly instead since we know that we'd be running on latest
+enough linux kernel.
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ ext/opcache/config.m4 | 349 ++------------------------------------------------
+ 1 file changed, 8 insertions(+), 341 deletions(-)
+
+diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
+index 7b500f0..10bb99a 100644
+--- a/ext/opcache/config.m4
++++ b/ext/opcache/config.m4
+@@ -28,353 +28,20 @@ if test "$PHP_OPCACHE" != "no"; then
+ 
+   AC_CHECK_HEADERS([unistd.h sys/uio.h])
+ 
+-  AC_MSG_CHECKING(for sysvipc shared memory support)
+-  AC_TRY_RUN([
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/ipc.h>
+-#include <sys/shm.h>
+-#include <unistd.h>
+-#include <string.h>
++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+ 
+-int main() {
+-  pid_t pid;
+-  int status;
+-  int ipc_id;
+-  char *shm;
+-  struct shmid_ds shmbuf;
++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+ 
+-  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
+-  if (ipc_id == -1) {
+-    return 1;
+-  }
++  AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
+ 
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-  AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
+-  AC_TRY_RUN([
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
+-
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-  AC_MSG_CHECKING(for mmap() using /dev/zero shared memory support)
+-  AC_TRY_RUN([
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/mman.h>
+-#include <sys/stat.h>
+-#include <fcntl.h>
+-#include <unistd.h>
+-#include <string.h>
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
+-
+-  fd = open("/dev/zero", O_RDWR, S_IRUSR | S_IWUSR);
+-  if (fd == -1) {
+-    return 1;
+-  }
+-
+-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+-  if (shm == MAP_FAILED) {
+-    return 2;
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-  AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
+-  AC_TRY_RUN([
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
+-  sprintf(tmpname,"test.shm.%dXXXXXX", getpid());
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
++  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
+ 
+   AC_MSG_CHECKING(for mmap() using regular file shared memory support)
+-  AC_TRY_RUN([
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
+-  sprintf(tmpname,"test.shm.%dXXXXXX", getpid());
+-  if (mktemp(tmpname) == NULL) {
+-    return 1;
+-  }
+-  fd = open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
+-  if (fd == -1) {
+-    return 2;
+-  }
+-  if (ftruncate(fd, 4096) < 0) {
+-    close(fd);
+-    unlink(tmpname);
+-    return 3;
+-  }
+-
+-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+-  if (shm == MAP_FAILED) {
+-    return 4;
+-  }
+-  unlink(tmpname);
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-flock_type=unknown
+-AC_MSG_CHECKING("whether flock struct is linux ordered")
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5 };
+-  int main() { 
+-    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
+-		return 0;
+-    }
+-    return 1;
+-  } 
+-], [
+-	flock_type=linux
+-    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
+-    AC_MSG_RESULT("yes")
+-], AC_MSG_RESULT("no") )
++  
++  AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
+ 
+-AC_MSG_CHECKING("whether flock struct is BSD ordered")
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5 };
+-  int main() { 
+-    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
+-		return 0;
+-    }
+-    return 1;
+-  } 
+-], [
+-	flock_type=bsd
+-    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type]) 
+-    AC_MSG_RESULT("yes")
+-], AC_MSG_RESULT("no") )
++  flock_type=linux
++  AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
+ 
+ if test "$flock_type" = "unknown"; then
+ 	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/configure.patch b/meta-oe/recipes-devtools/php/php/configure.patch
deleted file mode 100644
index d9d913f..0000000
--- a/meta-oe/recipes-devtools/php/php/configure.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 617d01ef2ac2f436cd8e06555b608db56079b851 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Tue, 17 Jul 2012 11:31:54 +0100
-
----
- configure | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure b/configure
-index 1f1ef32..392fb76 100755
---- a/configure
-+++ b/configure
-@@ -11642,8 +11642,6 @@ $as_echo "#define HAVE_LIBNSL 1" >>confdefs.h
- 
- 
- 
--  unset ac_cv_func_dlopen
--  unset ac_cv_func___dlopen
-   unset found
- 
-   ac_fn_c_check_func "$LINENO" "dlopen" "ac_cv_func_dlopen"
diff --git a/meta-oe/recipes-devtools/php/php/php5-0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/php5-0001-opcache-config.m4-enable-opcache.patch
new file mode 100644
index 0000000..7be67ea
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php5-0001-opcache-config.m4-enable-opcache.patch
@@ -0,0 +1,387 @@
+From fafcfac0933c17e1bf551600080eb0541186caf5 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Mon, 2 Apr 2018 17:54:52 +0800
+Subject: [PATCH] opcache/config.m4: enable opcache
+
+We can't use AC_TRY_RUN to run programs in a cross compile environment. Set
+the variables directly instead since we know that we'd be running on latest
+enough linux kernel.
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+%% original patch: php5-0001-opcache-config.m4-enable-opcache.patch
+---
+ ext/opcache/config.m4 | 349 ++------------------------------------------------
+ 1 file changed, 8 insertions(+), 341 deletions(-)
+
+diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
+index 5a8b86c..6e87fa5 100644
+--- a/ext/opcache/config.m4
++++ b/ext/opcache/config.m4
+@@ -11,353 +11,20 @@ if test "$PHP_OPCACHE" != "no"; then
+     AC_DEFINE(HAVE_MPROTECT, 1, [Define if you have mprotect() function])
+   ])
+ 
+-  AC_MSG_CHECKING(for sysvipc shared memory support)
+-  AC_TRY_RUN([
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/ipc.h>
+-#include <sys/shm.h>
+-#include <unistd.h>
+-#include <string.h>
++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+ 
+-int main() {
+-  pid_t pid;
+-  int status;
+-  int ipc_id;
+-  char *shm;
+-  struct shmid_ds shmbuf;
++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+ 
+-  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
+-  if (ipc_id == -1) {
+-    return 1;
+-  }
++  AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
+ 
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-  AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
+-  AC_TRY_RUN([
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
+-
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-  AC_MSG_CHECKING(for mmap() using /dev/zero shared memory support)
+-  AC_TRY_RUN([
+-#include <sys/types.h>
+-#include <sys/wait.h>
+-#include <sys/mman.h>
+-#include <sys/stat.h>
+-#include <fcntl.h>
+-#include <unistd.h>
+-#include <string.h>
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
+-
+-  fd = open("/dev/zero", O_RDWR, S_IRUSR | S_IWUSR);
+-  if (fd == -1) {
+-    return 1;
+-  }
+-
+-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+-  if (shm == MAP_FAILED) {
+-    return 2;
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-  AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
+-  AC_TRY_RUN([
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
+-  sprintf(tmpname,"test.shm.%dXXXXXX", getpid());
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
++  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
+ 
+   AC_MSG_CHECKING(for mmap() using regular file shared memory support)
+-  AC_TRY_RUN([
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
+-  sprintf(tmpname,"test.shm.%dXXXXXX", getpid());
+-  if (mktemp(tmpname) == NULL) {
+-    return 1;
+-  }
+-  fd = open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
+-  if (fd == -1) {
+-    return 2;
+-  }
+-  if (ftruncate(fd, 4096) < 0) {
+-    close(fd);
+-    unlink(tmpname);
+-    return 3;
+-  }
+-
+-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+-  if (shm == MAP_FAILED) {
+-    return 4;
+-  }
+-  unlink(tmpname);
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
+-],dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
+-    msg=yes,msg=no,msg=no)
+-  AC_MSG_RESULT([$msg])
+-
+-flock_type=unknown
+-AC_MSG_CHECKING("whether flock struct is linux ordered")
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5 };
+-  int main() { 
+-    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
+-		return 0;
+-    }
+-    return 1;
+-  } 
+-], [
+-	flock_type=linux
+-    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
+-    AC_MSG_RESULT("yes")
+-], AC_MSG_RESULT("no") )
++  
++  AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
+ 
+-AC_MSG_CHECKING("whether flock struct is BSD ordered")
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5 };
+-  int main() { 
+-    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
+-		return 0;
+-    }
+-    return 1;
+-  } 
+-], [
+-	flock_type=bsd
+-    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type]) 
+-    AC_MSG_RESULT("yes")
+-], AC_MSG_RESULT("no") )
++  flock_type=linux
++  AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
+ 
+ if test "$flock_type" = "unknown"; then
+ 	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php_5.6.35.bb b/meta-oe/recipes-devtools/php/php_5.6.35.bb
index 5ccbfa1..c17c0d6 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.35.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.35.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
 SRC_URI_append_class-target = " \
                                 file://php5-pear-makefile.patch \
                                 file://php5-phar-makefile.patch \
+                                file://php5-0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
 SRC_URI[md5sum] = "905ae5f586351f3ca29d044c9484d475"
diff --git a/meta-oe/recipes-devtools/php/php_7.2.4.bb b/meta-oe/recipes-devtools/php/php_7.2.4.bb
index 1a9c8ff..04d9b16 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.4.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
                                 file://phar-makefile.patch \
+                                file://0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
 SRC_URI[md5sum] = "864c64ffd2f1686b035ef8ce6a6d8478"
-- 
2.7.4



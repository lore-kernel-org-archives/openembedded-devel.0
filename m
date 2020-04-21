Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.2845.1587442545144120203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 21:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nZJHPEA/;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 20so13215136qkl.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 21:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5JTqWyWvoB2OrbgQuCoSbGrhPoJGBSzlJm3vNn0Tgs=;
        b=nZJHPEA/jmbmHoUfRUWwEP5nxWRTny3d+261A/Y3wpGV+yAt8JG7Qp4zK/qvrFoK+T
         3T22gpafJVO3PiDxXfJnw/h1DeFymXcNCL7VSuEtg97L76yXOu7dv58ctUvxrghTqhGb
         5EPMFIIF/xZ8YTw1XFBDDXCHj/arw8cgTAtNw196fLXrCgIIx8um1PZJb3izmT7j9zIX
         0hwdFlTs7Jno5Wj2o454VcqmDajw/NGYZxRJov0IjC2a04VG7c3XWjFM6xbw/33vnyp2
         9KnzNQjPPYtFvBgwMvM+eKKaWkmcLDFDta6uPSIsQKXpWO/DHSbbX/CkuhSsBrqr3XDK
         02Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5JTqWyWvoB2OrbgQuCoSbGrhPoJGBSzlJm3vNn0Tgs=;
        b=W8Gd3+w8wsg14cQXiUnNv2leYOSKldBwXd4IKyNQ+vloLRV9Dc70j1In/xLrIROmAd
         UHHJq8Gbv+2xgTLy5XNbDw+UbFHXzUQ/xWIWAUgmxMUQkMXuy8GAR9azyKsaCbSVPwK0
         Xlvvh0rw7/hmoBRXR22iFrVKhZKqRtyaXbTZjQcOAVjJIxGGI42PRwLNsP1hW2deianv
         P7Uo97YzYSWYAcUjJ7+eBmN+ZCOMYSCAe98YWWio1mJtU7FJNvdR6uroPkc5POvMdJ+T
         eE5SFhiQfbzvC6vikPG8NYF6KGmIn4eLe7qyv+lOcF3TDgH0Tj5faz2Irnvq/rI6fEg3
         q9hQ==
X-Gm-Message-State: AGi0PubN4uFCZb3gf+L3kPKTogge0ZOIS//aThdDM7nKcp0asscIBtV5
	OvXwJiTnUwZ1WtZ5G2YGf9M2vjajRZGZD8YEAk8=
X-Google-Smtp-Source: APiQypJRq18B1JNdfFZdSahRL1UIHStyI59thDdFdw9ZIkHhV7LlBs3Ssb6excaHM/uO5I7AG+RUUFYTYsENFed43DU=
X-Received: by 2002:ae9:dc46:: with SMTP id q67mr16989778qkf.431.1587442543892;
 Mon, 20 Apr 2020 21:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <1587376709-244063-1-git-send-email-changqing.li@windriver.com>
 <CAMKF1sphN=C75MML3KT8be+=9sDTMCCZE+RsaJaaktDLZzHr+w@mail.gmail.com> <f92a733f-e8cf-d0aa-5635-ebaba8b82317@windriver.com>
In-Reply-To: <f92a733f-e8cf-d0aa-5635-ebaba8b82317@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 21:15:33 -0700
Message-ID: <CAMKF1sqtfYU3_3g3SMFeJgqa3=8Vm6G=K6tF5hxsVfyLhHAxUg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: Add 7.4.4
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ee1c7505a3c5440b"

--000000000000ee1c7505a3c5440b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That is fine however I Am afraid that no one will send security patches etc
and we might have a recipe not well maintained that=E2=80=99s what concern=
s me

On Mon, Apr 20, 2020 at 6:28 PM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 4/21/20 12:56 AM, Khem Raj wrote:
>
> On Mon, Apr 20, 2020 at 2:59 AM Changqing Li <changqing.li@windriver.com=
> <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.=
com>
>
> * Add php 7.4, and also keep 7.3 existed.
>
> why do we need to keep 7.3 ?
>
> I keep it since 7.3 and 7.4 have some incompatibility,  so maybe keep 7.=
3
> to EOF is better ?
>
> refer:https://www.php.net/migration74https://www.php.net/supported-versi=
ons.php
>
> * note: for 7.4, pear is disabled by default,
> and it will be deprecated in future.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@w=
indriver.com>
> ---
>  ...nfigure.ac-don-t-include-build-libtool.m4.patch |  30 +++
>  .../0001-php.m4-don-t-unset-cache-variables.patch  |  39 +++
>  ...7.4-0001-opcache-config.m4-enable-opcache.patch | 230 ++++++++++++++=
+++
>  ...01-php-don-t-use-broken-wrapper-for-mkdir.patch |  29 +++
>  .../recipes-devtools/php/php/php7.4-iconv.patch    |  41 ++++
>  .../php/php/php7.4-imap-fix-autofoo.patch          |  41 ++++
>  .../php/php/php7.4-phar-makefile.patch             |  46 ++++
>  .../php/php/php7.4-php_exec_native.patch           |  26 ++
>  meta-oe/recipes-devtools/php/php_7.4.4.bb          | 272 ++++++++++++++=
+++++++
>  9 files changed, 754 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/php/php/0001-configure.ac-d=
on-t-include-build-libtool.m4.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-u=
nset-cache-variables.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-opcache=
-config.m4-enable-opcache.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-php-don=
-t-use-broken-wrapper-for-mkdir.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-imap-fix-aut=
ofoo.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-phar-makefil=
e.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-php_exec_nat=
ive.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php_7.4.4.bb
>
> diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-in=
clude-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-config=
ure.ac-don-t-include-build-libtool.m4.patch
> new file mode 100644
> index 0000000..2861366
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-b=
uild-libtool.m4.patch
> @@ -0,0 +1,30 @@
> +From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver=
.com>
> +Date: Fri, 17 Apr 2020 15:01:57 +0800
> +Subject: [PATCH] configure.ac: don't include build/libtool.m4
> +
> +we delete build/libtool.m4 before do_configure,
> +we will use libtool.m4 under ACLOCALDIR
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + configure.ac | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 06c6a27..f85144e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -6,7 +6,6 @@ dnl ---------------------------------------------------=
-------------------------
> + m4_include([build/ax_check_compile_flag.m4])
> + m4_include([build/ax_func_which_gethostbyname_r.m4])
> + m4_include([build/ax_gcc_func_attribute.m4])
> +-m4_include([build/libtool.m4])
> + m4_include([build/php_cxx_compile_stdcxx.m4])
> + m4_include([build/php.m4])
> + m4_include([build/pkg.m4])
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-ca=
che-variables.patch b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-un=
set-cache-variables.patch
> new file mode 100644
> index 0000000..0d721ec
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-var=
iables.patch
> @@ -0,0 +1,39 @@
> +php.m4: don't unset cache variables
> +
> +Unsetting prevents cache variable from being passed to configure.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> <anuj.mittal@intel.c=
om>
> +
> +update this patch to 7.4.4, acinclude.m4 move to build/php.m4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + build/php.m4 | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/build/php.m4 b/build/php.m4
> +index 5c45d13..218ec47 100644
> +--- a/build/php.m4
> ++++ b/build/php.m4
> +@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
> + dnl
> + AC_DEFUN([PHP_CHECK_FUNC_LIB],[
> +   ifelse($2,,:,[
> +-  unset ac_cv_lib_$2[]_$1
> +-  unset ac_cv_lib_$2[]___$1
> +   unset found
> +   AC_CHECK_LIB($2, $1, [found=3Dyes], [
> +     AC_CHECK_LIB($2, __$1, [found=3Dyes], [found=3Dno])
> +@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. =
Defines HAVE_func and
> + dnl HAVE_library if found and adds the library to LIBS.
> + dnl
> + AC_DEFUN([PHP_CHECK_FUNC],[
> +-  unset ac_cv_func_$1
> +-  unset ac_cv_func___$1
> +   unset found
> +
> +   AC_CHECK_FUNC($1, [found=3Dyes],[ AC_CHECK_FUNC(__$1,[found=3Dyes],[=
found=3Dno]) ])
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config=
.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-opc=
ache-config.m4-enable-opcache.patch
> new file mode 100644
> index 0000000..ee0d5ed
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-ena=
ble-opcache.patch
> @@ -0,0 +1,230 @@
> +opcache/config.m4: enable opcache
> +
> +We can't use AC_TRY_RUN to run programs in a cross compile environment.
> +Set
> +the variables directly instead since we know that we'd be running on
> +latest
> +enough linux kernel.
> +
> +Upstream-Status: Inappropriate [Configuration]
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> <anuj.mittal@intel.c=
om>
> +
> +update patch to version 7.4.4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + ext/opcache/config.m4 | 194 +-----------------------------------------=
--------
> + 1 file changed, 3 insertions(+), 191 deletions(-)
> +
> +diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
> +index 6c40caf..84ddf1e 100644
> +--- a/ext/opcache/config.m4
> ++++ b/ext/opcache/config.m4
> +@@ -23,201 +23,13 @@ if test "$PHP_OPCACHE" !=3D "no"; then
> +   AC_CHECK_FUNCS([mprotect])
> +
> +   AC_MSG_CHECKING(for sysvipc shared memory support)
> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> +-#include <sys/types.h>
> +-#include <sys/wait.h>
> +-#include <sys/ipc.h>
> +-#include <sys/shm.h>
> +-#include <unistd.h>
> +-#include <string.h>
> +-
> +-int main() {
> +-  pid_t pid;
> +-  int status;
> +-  int ipc_id;
> +-  char *shm;
> +-  struct shmid_ds shmbuf;
> +-
> +-  ipc_id =3D shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
> +-  if (ipc_id =3D=3D -1) {
> +-    return 1;
> +-  }
> +-
> +-  shm =3D shmat(ipc_id, NULL, 0);
> +-  if (shm =3D=3D (void *)-1) {
> +-    shmctl(ipc_id, IPC_RMID, NULL);
> +-    return 2;
> +-  }
> +-
> +-  if (shmctl(ipc_id, IPC_STAT, &shmbuf) !=3D 0) {
> +-    shmdt(shm);
> +-    shmctl(ipc_id, IPC_RMID, NULL);
> +-    return 3;
> +-  }
> +-
> +-  shmbuf.shm_perm.uid =3D getuid();
> +-  shmbuf.shm_perm.gid =3D getgid();
> +-  shmbuf.shm_perm.mode =3D 0600;
> +-
> +-  if (shmctl(ipc_id, IPC_SET, &shmbuf) !=3D 0) {
> +-    shmdt(shm);
> +-    shmctl(ipc_id, IPC_RMID, NULL);
> +-    return 4;
> +-  }
> +-
> +-  shmctl(ipc_id, IPC_RMID, NULL);
> +-
> +-  strcpy(shm, "hello");
> +-
> +-  pid =3D fork();
> +-  if (pid < 0) {
> +-    return 5;
> +-  } else if (pid =3D=3D 0) {
> +-    strcpy(shm, "bye");
> +-    return 6;
> +-  }
> +-  if (wait(&status) !=3D pid) {
> +-    return 7;
> +-  }
> +-  if (!WIFEXITED(status) || WEXITSTATUS(status) !=3D 6) {
> +-    return 8;
> +-  }
> +-  if (strcmp(shm, "bye") !=3D 0) {
> +-    return 9;
> +-  }
> +-  return 0;
> +-}
> +-]])],[dnl
> +-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM suppor=
t])
> +-    msg=3Dyes],[msg=3Dno],[msg=3Dno])
> +-  AC_MSG_RESULT([$msg])
> ++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support]=
)
> +
> +   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> +-#include <sys/types.h>
> +-#include <sys/wait.h>
> +-#include <sys/mman.h>
> +-#include <unistd.h>
> +-#include <string.h>
> +-
> +-#ifndef MAP_ANON
> +-# ifdef MAP_ANONYMOUS
> +-#  define MAP_ANON MAP_ANONYMOUS
> +-# endif
> +-#endif
> +-#ifndef MAP_FAILED
> +-# define MAP_FAILED ((void*)-1)
> +-#endif
> ++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) =
SHM support])
> +
> +-int main() {
> +-  pid_t pid;
> +-  int status;
> +-  char *shm;
> +-
> +-  shm =3D mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_AN=
ON, -1, 0);
> +-  if (shm =3D=3D MAP_FAILED) {
> +-    return 1;
> +-  }
> +-
> +-  strcpy(shm, "hello");
> +-
> +-  pid =3D fork();
> +-  if (pid < 0) {
> +-    return 5;
> +-  } else if (pid =3D=3D 0) {
> +-    strcpy(shm, "bye");
> +-    return 6;
> +-  }
> +-  if (wait(&status) !=3D pid) {
> +-    return 7;
> +-  }
> +-  if (!WIFEXITED(status) || WEXITSTATUS(status) !=3D 6) {
> +-    return 8;
> +-  }
> +-  if (strcmp(shm, "bye") !=3D 0) {
> +-    return 9;
> +-  }
> +-  return 0;
> +-}
> +-]])],[dnl
> +-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON=
) SHM support])
> +-    msg=3Dyes],[msg=3Dno],[msg=3Dno])
> +-  AC_MSG_RESULT([$msg])
> +-
> +-  PHP_CHECK_FUNC_LIB(shm_open, rt)
> +   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> +-#include <sys/types.h>
> +-#include <sys/wait.h>
> +-#include <sys/mman.h>
> +-#include <sys/stat.h>
> +-#include <fcntl.h>
> +-#include <unistd.h>
> +-#include <string.h>
> +-#include <stdlib.h>
> +-#include <stdio.h>
> +-
> +-#ifndef MAP_FAILED
> +-# define MAP_FAILED ((void*)-1)
> +-#endif
> +-
> +-int main() {
> +-  pid_t pid;
> +-  int status;
> +-  int fd;
> +-  char *shm;
> +-  char tmpname[4096];
> +-
> +-  sprintf(tmpname,"/opcache.test.shm.%dXXXXXX", getpid());
> +-  if (mktemp(tmpname) =3D=3D NULL) {
> +-    return 1;
> +-  }
> +-  fd =3D shm_open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
> +-  if (fd =3D=3D -1) {
> +-    return 2;
> +-  }
> +-  if (ftruncate(fd, 4096) < 0) {
> +-    close(fd);
> +-    shm_unlink(tmpname);
> +-    return 3;
> +-  }
> +-
> +-  shm =3D mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +-  if (shm =3D=3D MAP_FAILED) {
> +-    return 4;
> +-  }
> +-  shm_unlink(tmpname);
> +-  close(fd);
> +-
> +-  strcpy(shm, "hello");
> +-
> +-  pid =3D fork();
> +-  if (pid < 0) {
> +-    return 5;
> +-  } else if (pid =3D=3D 0) {
> +-    strcpy(shm, "bye");
> +-    return 6;
> +-  }
> +-  if (wait(&status) !=3D pid) {
> +-    return 7;
> +-  }
> +-  if (!WIFEXITED(status) || WEXITSTATUS(status) !=3D 6) {
> +-    return 8;
> +-  }
> +-  if (strcmp(shm, "bye") !=3D 0) {
> +-    return 9;
> +-  }
> +-  return 0;
> +-}
> +-]])],[dnl
> +-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap()=
 SHM support])
> +-    AC_MSG_RESULT([yes])
> +-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SH=
ARED_LIBADD)])
> +-  ],[
> +-    AC_MSG_RESULT([no])
> +-  ],[
> +-    AC_MSG_RESULT([no])
> +-  ])
> ++  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() S=
HM support])
> +
> +   PHP_NEW_EXTENSION(opcache,
> +       ZendAccelerator.c \
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-=
broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/php7.4-00=
01-php-don-t-use-broken-wrapper-for-mkdir.patch
> new file mode 100644
> index 0000000..d687373
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-=
wrapper-for-mkdir.patch
> @@ -0,0 +1,29 @@
> +From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net> <koen@dominion.thruhere.ne=
t>
> +Date: Thu, 3 Nov 2011 14:27:15 +0100
> +Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> <koen@dominion.th=
ruhere.net>
> +
> +update patch to version 7.4.4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> +
> +Upstream-Status: Inappropriate
> +
> + build/Makefile.global | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/build/Makefile.global b/build/Makefile.global
> +index ff858c2..ae554b4 100644
> +--- a/build/Makefile.global
> ++++ b/build/Makefile.global
> +@@ -1,4 +1,4 @@
> +-mkinstalldirs =3D $(top_srcdir)/build/shtool mkdir -p
> ++mkinstalldirs =3D mkdir -p
> + INSTALL =3D $(top_srcdir)/build/shtool install -c
> + INSTALL_DATA =3D $(INSTALL) -m 644
> +
> +--
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch b/meta-=
oe/recipes-devtools/php/php/php7.4-iconv.patch
> new file mode 100644
> index 0000000..9ec8a89
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
> @@ -0,0 +1,41 @@
> +Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep =
17
> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> <koen@domin=
ion.thruhere.net> Date: Wed, 2 Nov
> + 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
> +
> +update patch to version 7.4.4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + build/php.m4        | 3 ++-
> + ext/iconv/config.m4 | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/build/php.m4 b/build/php.m4
> +index 7392876..5c45d13 100644
> +--- a/build/php.m4
> ++++ b/build/php.m4
> +@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> +   echo > ext/iconv/php_iconv_supports_errno.h
> +
> +   dnl Check libc first if no path is provided in --with-iconv.
> +-  if test "$PHP_ICONV" =3D "yes"; then
> ++  dnl must check against no, not against yes as PHP_ICONV can also inc=
lude a path, which implies yes
> ++  if test "$PHP_ICONV" !=3D "no"; then
> +     dnl Reset LIBS temporarily as it may have already been included -l=
iconv in.
> +     LIBS_save=3D"$LIBS"
> +     LIBS=3D
> +diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
> +index fe9b47a..b6b632f 100644
> +--- a/ext/iconv/config.m4
> ++++ b/ext/iconv/config.m4
> +@@ -14,7 +14,7 @@ if test "$PHP_ICONV" !=3D "no"; then
> +
> +   if test "$iconv_avail" !=3D "no"; then
> +     if test -z "$ICONV_DIR"; then
> +-      for i in /usr/local /usr; do
> ++      for i in $PHP_ICONV /usr/local /usr; do
> +         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.=
h"; then
> +           PHP_ICONV_PREFIX=3D"$i"
> +           break
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.pa=
tch b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
> new file mode 100644
> index 0000000..ebe5f6a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
> @@ -0,0 +1,41 @@
> +Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep =
17
> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> <koen@domin=
ion.thruhere.net> Date: Wed, 2 Nov
> + 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
> +
> +update patch to version 7.4.4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + ext/imap/config.m4 | 10 ++--------
> + 1 file changed, 2 insertions(+), 8 deletions(-)
> +
> +diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
> +index 5086a31..0e938bd 100644
> +--- a/ext/imap/config.m4
> ++++ b/ext/imap/config.m4
> +@@ -110,7 +110,7 @@ if test "$PHP_IMAP" !=3D "no"; then
> +     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_ST=
ATIC_TSRMLS_CACHE=3D1)
> +     AC_DEFINE(HAVE_IMAP,1,[ ])
> +
> +-    for i in $PHP_IMAP /usr/local /usr; do
> ++    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
> +       IMAP_INC_CHK()
> +       el[]IMAP_INC_CHK(/include/c-client)
> +       el[]IMAP_INC_CHK(/include/imap)
> +@@ -199,13 +199,7 @@ if test "$PHP_IMAP" !=3D "no"; then
> +       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client in=
stallation.)
> +     fi
> +
> +-    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r "$IMAP_=
DIR/c-client/c-client.a" ; then
> +-      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-c=
lient.a" >/dev/null 2>&1
> +-    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r "$=
IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
> +-      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/=
libc-client.a" >/dev/null 2>&1
> +-    fi
> +-
> +-    for lib in c-client4 c-client imap; do
> ++    for lib in /usr/lib c-client4 c-client imap; do
> +       IMAP_LIB=3D$lib
> +       IMAP_LIB_CHK($PHP_LIBDIR)
> +       IMAP_LIB_CHK(c-client)
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch=
 b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
> new file mode 100644
> index 0000000..eb73bc4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
> @@ -0,0 +1,46 @@
> +Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep =
17
> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> <koen@domin=
ion.thruhere.net> Date: Wed, 2 Nov
> + 2011 16:54:57 +0100 Subject: [PATCH] Fix phar packaging
> +
> +Inherited from OE-Classic, with some additions to fix host paths leakin=
g
> +into the target package.
> +
> +Upstream-Status: Inappropriate [config]
> +
> +update patch to version 7.4.4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + ext/phar/Makefile.frag | 17 +++--------------
> + 1 file changed, 3 insertions(+), 14 deletions(-)
> +
> +diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
> +index 6442f33..6145412 100644
> +--- a/ext/phar/Makefile.frag
> ++++ b/ext/phar/Makefile.frag
> +@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
> +
> + PHP_PHARCMD_SETTINGS =3D -n -d 'open_basedir=3D' -d 'output_buffering=
=3D0' -d 'memory_limit=3D-1' -d phar.readonly=3D0
> + PHP_PHARCMD_EXECUTABLE =3D ` \
> +-      if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
> +-              $(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$=
(SAPI_CLI_PATH) -n"; \
> +-              if test "x$(PHP_MODULES)" !=3D "x"; then \
> +-              $(top_srcdir)/build/shtool echo -n -- " -d extension_dir=
=
=3D$(top_builddir)/modules"; \
> +-              for i in bz2 zlib phar; do \
> +-                      if test -f "$(top_builddir)/modules/$$i.la"; the=
n \
> +-                              . $(top_builddir)/modules/$$i.la; $(top_=
srcdir)/build/shtool echo -n -- " -d extension=3D$$dlname"; \
> +-                      fi; \
> +-              done; \
> +-              fi; \
> +-      else \
> +-              $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)=
"; \
> +-      fi;`
> +-PHP_PHARCMD_BANG =3D `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL=
_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
> ++               $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE=
)"; `
> ++
> ++PHP_PHARCMD_BANG =3D `$(top_srcdir)/build/shtool echo -n -- "$(bindir)=
/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
> +
> + $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
> +       -@test -d $(builddir)/phar || mkdir $(builddir)/phar
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.pat=
ch b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
> new file mode 100644
> index 0000000..4aec481
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
> @@ -0,0 +1,26 @@
> +Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 1=
7
> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> <koen@domin=
ion.thruhere.net> Date: Wed, 2 Nov
> + 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Inappriate
> +
> +update patch to version 7.4.4
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@=
windriver.com>
> +---
> + sapi/cli/config.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
> +index 917d45f..aaf1e27 100644
> +--- a/sapi/cli/config.m4
> ++++ b/sapi/cli/config.m4
> +@@ -47,7 +47,7 @@ if test "$PHP_CLI" !=3D "no"; then
> +   esac
> +
> +   dnl Set executable for tests.
> +-  PHP_EXECUTABLE=3D"\$(top_builddir)/\$(SAPI_CLI_PATH)"
> ++  PHP_EXECUTABLE=3D"${PHP_NATIVE_DIR}/php"
> +   PHP_SUBST(PHP_EXECUTABLE)
> +
> +   dnl Expose to Makefile.
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes=
-devtools/php/php_7.4.4.bb
> new file mode 100644
> index 0000000..1f64172
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
> @@ -0,0 +1,272 @@
> +SUMMARY =3D "A server-side, HTML-embedded scripting language"
> +HOMEPAGE =3D "http://www.php.net" <http://www.php.net>
> +SECTION =3D "console/network"
> +
> +LICENSE =3D "PHP-3.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7e571b888d585b31f9ef5edcc647=
fa30"
> +
> +BBCLASSEXTEND =3D "native"
> +DEPENDS =3D "zlib bzip2 libxml2 virtual/libiconv php-native lemon-nativ=
e"
> +DEPENDS_class-native =3D "zlib-native libxml2-native"
> +
> +PHP_MAJOR_VERSION =3D "${@d.getVar('PV').split('.')[0]}" <$%7B@d.getVar=
('PV').split('.')[0]%7D>
> +
> +SRC_URI =3D "http://php.net/distributions/php-${PV}.tar.bz2 \
> +           file://debian-php-fixheader.patch \
> +           file://0001-configure.ac-don-t-include-build-libtool.m4.patc=
h \
> +           file://php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.pa=
tch \
> +           file://0001-php.m4-don-t-unset-cache-variables.patch \
> +          " <http://php.net/distributions/php-$%7BPV%7D.tar.bz2%5C+file=
://debian-php-fixheader.patch%5C+file://0001-configure.ac-don-t-include-bui=
ld-libtool.m4.patch%5C+file://php7.4-0001-php-don-t-use-broken-wrapper-for-=
mkdir.patch%5C+file://0001-php.m4-don-t-unset-cache-variables.patch%5C+>
> +
> +SRC_URI_append_class-target =3D " \
> +            file://php7.4-imap-fix-autofoo.patch \
> +            file://php7.4-php_exec_native.patch \
> +            file://php-fpm.conf \
> +            file://php-fpm-apache.conf \
> +            file://70_mod_php${PHP_MAJOR_VERSION}.conf \
> +            file://php-fpm.service \
> +            file://pear-makefile.patch \
> +            file://php7.4-phar-makefile.patch \
> +            file://php7.4-0001-opcache-config.m4-enable-opcache.patch \
> +            file://xfail_two_bug_tests.patch \
> +            file://php7.4-iconv.patch \
> +          "
> +S =3D "${WORKDIR}/php-${PV}"
> +SRC_URI[md5sum] =3D "262c258a3b8b5699fcca89a64e58758c"
> +SRC_URI[sha256sum] =3D "308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4=
a37475e082fa9829f"
> +
> +inherit autotools pkgconfig python3native gettext
> +
> +# phpize is not scanned for absolute paths by default (but php-config i=
s).
> +#
> +SSTATE_SCAN_FILES +=3D "phpize"
> +SSTATE_SCAN_FILES +=3D "build-defs.h"
> +
> +PHP_LIBDIR =3D "${libdir}/php${PHP_MAJOR_VERSION}"
> +
> +
> +# Common EXTRA_OECONF
> +COMMON_EXTRA_OECONF =3D "--enable-sockets \
> +                       --enable-pcntl \
> +                       --enable-shared \
> +                       --disable-rpath \
> +                       --with-pic \
> +                       --libdir=3D${PHP_LIBDIR} \
> +"
> +EXTRA_OECONF =3D "--enable-mbstring \
> +                --enable-fpm \
> +                --with-libdir=3D${baselib} \
> +                --with-gettext=3D${STAGING_LIBDIR}/.. \
> +                --with-zlib=3D${STAGING_LIBDIR}/.. \
> +                --with-iconv=3D${STAGING_LIBDIR}/.. \
> +                --with-bz2=3D${STAGING_DIR_TARGET}${exec_prefix} \
> +                --with-config-file-path=3D${sysconfdir}/php/apache2-php=
${PHP_MAJOR_VERSION} \
> +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'a=
c_cv_c_bigendian_php=3Dno', 'ac_cv_c_bigendian_php=3Dyes', d)} \
> +                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv=
_lib_pam_pam_start=3Dno', d)} \
> +                ${COMMON_EXTRA_OECONF} \
> +"
> +
> +EXTRA_OECONF_append_riscv64 =3D " --with-pcre-jit=3Dno"
> +EXTRA_OECONF_append_riscv32 =3D " --with-pcre-jit=3Dno"
> +
> +CACHED_CONFIGUREVARS +=3D "ac_cv_func_dlopen=3Dno ac_cv_lib_dl_dlopen=
=3Dyes"
> +
> +EXTRA_OECONF_class-native =3D " \
> +                --with-zlib=3D${STAGING_LIBDIR_NATIVE}/.. \
> +                --without-iconv \
> +                ${COMMON_EXTRA_OECONF} \
> +"
> +
> +PACKAGECONFIG ??=3D "mysql sqlite3 imap opcache openssl \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)=
} \
> +"
> +PACKAGECONFIG_class-native =3D ""
> +
> +PACKAGECONFIG[zip] =3D "--enable-zip --with-libzip=3D${STAGING_EXECPREF=
IXDIR},,libzip"
> +
> +PACKAGECONFIG[mysql] =3D "--with-mysqli=3Dmysqlnd \
> +                        --with-pdo-mysql=3Dmysqlnd \
> +                        ,--without-mysqli --without-pdo-mysql \
> +                        ,mysql5"
> +
> +PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAGING_LIBDIR}/.. \
> +                          --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. \
> +                          ,--without-sqlite3 --without-pdo-sqlite \
> +                          ,sqlite3"
> +PACKAGECONFIG[pgsql] =3D "--with-pgsql=3D${STAGING_DIR_TARGET}${exec_pr=
efix},--without-pgsql,postgresql"
> +PACKAGECONFIG[soap] =3D "--enable-libxml --enable-soap, --disable-soap,=
 libxml2"
> +PACKAGECONFIG[apache2] =3D "--with-apxs2=3D${STAGING_BINDIR_CROSS}/apxs=
,,apache2-native apache2"
> +PACKAGECONFIG[pam] =3D ",,libpam"
> +PACKAGECONFIG[imap] =3D "--with-imap=3D${STAGING_DIR_HOST} \
> +                       --with-imap-ssl=3D${STAGING_DIR_HOST} \
> +                       ,--without-imap --without-imap-ssl \
> +                       ,uw-imap"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> +PACKAGECONFIG[opcache] =3D "--enable-opcache,--disable-opcache"
> +PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
> +PACKAGECONFIG[valgrind] =3D "--with-valgrind=3D${STAGING_DIR_TARGET}/us=
r,--with-valgrind=3Dno,valgrind"
> +PACKAGECONFIG[mbregex] =3D "--enable-mbregex, --disable-mbregex, onigur=
uma"
> +
> +export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
> +export PHP_PEAR_PHP_BIN =3D "${STAGING_BINDIR_NATIVE}/php"
> +CFLAGS +=3D " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I$=
{STAGING_INCDIR}/apache2"
> +
> +EXTRA_OEMAKE =3D "INSTALL_ROOT=3D${D}"
> +
> +acpaths =3D ""
> +
> +do_configure_prepend () {
> +    #rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
> +    rm -f ${S}/ltmain.sh ${S}/aclocal.m4
> +    sed -i -e 's;build/libtool.m4;${ACLOCALDIR}/libtool.m4;g' ${S}/conf=
igure.ac
> +    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=3D.*!APX=
S_HTTPD=3D${STAGING_SBINDIR_NATIVE}/httpd!'
> +}
> +
> +do_configure_append() {
> +    # No, libtool, we really don't want rpath set...
> +    sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=
=
=3D""|g' ${HOST_SYS}-libtool
> +    sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g'=
 ${HOST_SYS}-libtool
> +}
> +
> +do_install_append_class-native() {
> +    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
> +    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
> +    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
> +}
> +
> +do_install_prepend() {
> +    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCAL=
DIR}/ltoptions.m4 \
> +        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 > ${S}/buil=
d/libtool.m4
> +}
> +
> +do_install_prepend_class-target() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false'=
, d)}; then
> +        # Install dummy config file so apxs doesn't fail
> +        install -d ${D}${sysconfdir}/apache2
> +        printf "\nLoadModule dummy_module modules/mod_dummy.so\n" > ${D=
}${sysconfdir}/apache2/httpd.conf
> +    fi
> +}
> +
> +# fixme
> +do_install_append_class-target() {
> +    install -d ${D}${sysconfdir}/
> +    rm -rf ${D}/${TMPDIR}
> +    rm -rf ${D}/.registry
> +    rm -rf ${D}/.channels
> +    rm -rf ${D}/.[a-z]*
> +    rm -rf ${D}/var
> +    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
> +    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.=
conf
> +    install -d ${D}/${sysconfdir}/apache2/conf.d
> +    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/a=
pache2/conf.d/php-fpm.conf
> +    install -d ${D}${sysconfdir}/init.d
> +    sed -i 's:=3D/usr/sbin:=3D${sbindir}:g' ${B}/sapi/fpm/init.d.php-fp=
m
> +    sed -i 's:=3D/etc:=3D${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
> +    sed -i 's:=3D/var:=3D${localstatedir}:g' ${B}/sapi/fpm/init.d.php-f=
pm
> +    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init=
.d/php-fpm
> +    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/a=
pache2/conf.d/php-fpm.conf
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',=
d)};then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdi=
r}/system/
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> +            ${D}${systemd_unitdir}/system/php-fpm.service
> +    fi
> +
> +    TMP=3D`dirname ${D}/${TMPDIR}`
> +    while test ${TMP} !=3D ${D}; do
> +        if [ -d ${TMP} ]; then
> +            rmdir ${TMP}
> +        fi
> +        TMP=3D`dirname ${TMP}`;
> +    done
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false'=
, d)}; then
> +        install -d ${D}${sysconfdir}/apache2/modules.d
> +        install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION=
}
> +        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf =
${D}${sysconfdir}/apache2/modules.d
> +        sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules=
.d/70_mod_php${PHP_MAJOR_VERSION}.conf
> +        cat ${S}/php.ini-production | \
> +            sed -e 's,extension_dir =3D \"\./\",extension_dir =3D \"/us=
r/lib/extensions\",' \
> +            > ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/php=
.ini
> +        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
> +    fi
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS +=3D "php_sysroot_preprocess"
> +
> +php_sysroot_preprocess () {
> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_cros=
sscripts}/
> +    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_=
crossscripts}/
> +
> +    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DE=
STDIR}${bindir_crossscripts}/phpize
> +    sed -i 's!^include_dir=3D.*!include_dir=3D${STAGING_INCDIR}/php!' $=
{SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
> +}
> +
> +MODPHP_PACKAGE =3D "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '$=
{PN}-modphp', '', d)}" <$%7B@bb.utils.contains('PACKAGECONFIG','apache2','$=
%7BPN%7D-modphp','',d)%7D>
> +
> +PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2=
 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-do=
c ${PN}-opcache ${PN}"
> +
> +RDEPENDS_${PN} +=3D "libgcc"
> +RDEPENDS_${PN}-pear =3D "${PN}"
> +RDEPENDS_${PN}-phar =3D "${PN}-cli"
> +RDEPENDS_${PN}-cli =3D "${PN}"
> +RDEPENDS_${PN}-modphp =3D "${PN} apache2"
> +RDEPENDS_${PN}-opcache =3D "${PN}"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}-fpm"
> +inherit update-rc.d
> +
> +FILES_${PN}-dbg =3D+ "${bindir}/.debug \
> +                    ${libexecdir}/apache2/modules/.debug"
> +FILES_${PN}-doc +=3D "${PHP_LIBDIR}/php/doc"
> +FILES_${PN}-cli =3D "${bindir}/php"
> +FILES_${PN}-phar =3D "${bindir}/phar*"
> +FILES_${PN}-cgi =3D "${bindir}/php-cgi"
> +FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${da=
tadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.s=
ervice ${sysconfdir}/php-fpm.d/www.conf.default"
> +FILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
> +CONFFILES_${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
> +CONFFILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.c=
onf"
> +INITSCRIPT_NAME_${PN}-fpm =3D "php-fpm"
> +INITSCRIPT_PARAMS_${PN}-fpm =3D "defaults 60"
> +FILES_${PN}-pear =3D "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/=
PEAR \
> +                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.ph=
p \
> +                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd=
.php \
> +                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels=
/.alias \
> +                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/T=
ar.php \
> +                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/=
OS/Guess.php \
> +                ${PHP_LIBDIR}/php/data/PEAR \
> +                ${sysconfdir}/pear.conf"
> +FILES_${PN}-dev =3D "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/ph=
pize \
> +                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
> +                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap=
 \
> +                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
> +FILES_${PN}-staticdev +=3D "${PHP_LIBDIR}/extensions/*/*.a"
> +FILES_${PN}-opcache =3D "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}=
"
> +FILES_${PN} =3D "${PHP_LIBDIR}/php"
> +FILES_${PN} +=3D "${bindir} ${libexecdir}/apache2"
> +
> +SUMMARY_${PN}-modphp =3D "PHP module for the Apache HTTP server"
> +FILES_${PN}-modphp =3D "${libdir}/apache2 ${sysconfdir}"
> +
> +MODPHP_OLDPACKAGE =3D "${@bb.utils.contains('PACKAGECONFIG', 'apache2',=
 'modphp', '', d)}" <$%7B@bb.utils.contains('PACKAGECONFIG','apache2','modp=
hp','',d)%7D>
> +RPROVIDES_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +RREPLACES_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +RCONFLICTS_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +
> +do_install_append_class-native() {
> +    create_wrapper ${D}${bindir}/php \
> +        PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
> +}
> +
> +
> +# Fails to build with thumb-1 (qemuarm)
> +# | {standard input}: Assembler messages:
> +# | {standard input}:3719: Error: selected processor does not support T=
humb mode `smull r0,r2,r9,r3'
> +# | {standard input}:3720: Error: unshifted register required -- `sub r=
2,r2,r0,asr#31'
> +# | {standard input}:3796: Error: selected processor does not support T=
humb mode `smull r0,r2,r3,r3'
> +# | {standard input}:3797: Error: unshifted register required -- `sub r=
2,r2,r0,asr#31'
> +# | make: *** [ext/standard/math.lo] Error 1
> +ARM_INSTRUCTION_SET =3D "arm"
>
> do we still need this ?, if needed for thumb1 perhaps we should mark
> it so with _armv5t and _armv4
> overrides so it can be built with thumb2 on newer arches
>
>
> --
> 2.7.4
>
>
>
>
>=20
>
>

--000000000000ee1c7505a3c5440b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">That is fine however I Am afraid that no one will se=
nd security patches etc and we might have a recipe not well maintained that=
=
=E2=80=99s what concerns me</div></div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 20, 2020 at 6:28 PM Chan=
gqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com">changqing.li@win=
driver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

  
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div>On 4/21/20 12:56 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Mon, Apr 20, 2020 at 2:59 AM Changqing Li <a href=3D"mailto:=
changqing.li@windriver.com" target=3D"_blank">&lt;changqing.li@windriver.co=
m&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

* Add php 7.4, and also keep 7.3 existed.
</pre>
      </blockquote>
      <pre>why do we need to keep 7.3 ?</pre>
    </blockquote>
    <p>I keep it since 7.3 and 7.4 have some incompatibility,=C2=A0 so may=
be
      keep 7.3 to EOF is better ?<br>
    </p>
    <blockquote type=3D"cite"></blockquote></div><div text=3D"#000000" bgc=
olor=3D"#FFFFFF"><blockquote type=3D"cite">
      <pre></pre>
      <blockquote type=3D"cite">
        <pre>refer:
<a href=3D"https://www.php.net/migration74" target=3D"_blank">https://www.=
php.net/migration74</a>
<a href=3D"https://www.php.net/supported-versions.php" target=3D"_blank">h=
ttps://www.php.net/supported-versions.php</a>

* note: for 7.4, pear is disabled by default,
and it will be deprecated in future.

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
 ...nfigure.ac-don-t-include-build-libtool.m4.patch |  30 +++
 .../0001-php.m4-don-t-unset-cache-variables.patch  |  39 +++
 ...7.4-0001-opcache-config.m4-enable-opcache.patch | 230 ++++++++++++++++=
+
 ...01-php-don-t-use-broken-wrapper-for-mkdir.patch |  29 +++
 .../recipes-devtools/php/php/php7.4-iconv.patch    |  41 ++++
 .../php/php/php7.4-imap-fix-autofoo.patch          |  41 ++++
 .../php/php/php7.4-phar-makefile.patch             |  46 ++++
 .../php/php/php7.4-php_exec_native.patch           |  26 ++
 meta-oe/recipes-devtools/php/<a href=3D"http://php_7.4.4.bb" target=3D"_b=
lank">php_7.4.4.bb</a>          | 272 +++++++++++++++++++++
 9 files changed, 754 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-configure.ac-don=
-t-include-build-libtool.m4.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-uns=
et-cache-variables.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-c=
onfig.m4-enable-opcache.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t=
-use-broken-wrapper-for-mkdir.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autof=
oo.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.=
patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-php_exec_nativ=
e.patch
 create mode 100644 meta-oe/recipes-devtools/php/<a href=3D"http://php_7.4=
.4.bb" target=3D"_blank">php_7.4.4.bb</a>

diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-incl=
ude-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configur=
e.ac-don-t-include-build-libtool.m4.patch
new file mode 100644
index 0000000..2861366
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-bui=
ld-libtool.m4.patch
@@ -0,0 +1,30 @@
+From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" target=
=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+Date: Fri, 17 Apr 2020 15:01:57 +0800
+Subject: [PATCH] <a href=3D"http://configure.ac" target=3D"_blank">config=
ure.ac</a>: don&#39;t include build/libtool.m4
+
+we delete build/libtool.m4 before do_configure,
+we will use libtool.m4 under ACLOCALDIR
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+---
+ <a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a> | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">configure.=
ac</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a>
+index 06c6a27..f85144e 100644
+--- a/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a>
++++ b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a>
+@@ -6,7 +6,6 @@ dnl -----------------------------------------------------=
-----------------------
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
diff --git a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cach=
e-variables.patch b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unse=
t-cache-variables.patch
new file mode 100644
index 0000000..0d721ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-varia=
bles.patch
@@ -0,0 +1,39 @@
+php.m4: don&#39;t unset cache variables
+
+Unsetting prevents cache variable from being passed to configure.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Anuj Mittal <a href=3D"mailto:anuj.mittal@intel.com" targe=
t=3D"_blank">&lt;anuj.mittal@intel.com&gt;</a>
+
+update this patch to 7.4.4, acinclude.m4 move to build/php.m4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
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
+   AC_CHECK_LIB($2, $1, [found=3Dyes], [
+     AC_CHECK_LIB($2, __$1, [found=3Dyes], [found=3Dno])
+@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. De=
fines HAVE_func and
+ dnl HAVE_library if found and adds the library to LIBS.
+ dnl
+ AC_DEFUN([PHP_CHECK_FUNC],[
+-  unset ac_cv_func_$1
+-  unset ac_cv_func___$1
+   unset found
+
+   AC_CHECK_FUNC($1, [found=3Dyes],[ AC_CHECK_FUNC(__$1,[found=3Dyes],[fo=
und=3Dno]) ])
+--
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m=
4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcac=
he-config.m4-enable-opcache.patch
new file mode 100644
index 0000000..ee0d5ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enabl=
e-opcache.patch
@@ -0,0 +1,230 @@
+opcache/config.m4: enable opcache
+
+We can&#39;t use AC_TRY_RUN to run programs in a cross compile environmen=
t.
+Set
+the variables directly instead since we know that we&#39;d be running on
+latest
+enough linux kernel.
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Anuj Mittal <a href=3D"mailto:anuj.mittal@intel.com" targe=
t=3D"_blank">&lt;anuj.mittal@intel.com&gt;</a>
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+---
+ ext/opcache/config.m4 | 194 +-------------------------------------------=
------
+ 1 file changed, 3 insertions(+), 191 deletions(-)
+
+diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
+index 6c40caf..84ddf1e 100644
+--- a/ext/opcache/config.m4
++++ b/ext/opcache/config.m4
+@@ -23,201 +23,13 @@ if test &quot;$PHP_OPCACHE&quot; !=3D &quot;no&quot;=
; then
+   AC_CHECK_FUNCS([mprotect])
+
+   AC_MSG_CHECKING(for sysvipc shared memory support)
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include &lt;sys/types.h&gt;
+-#include &lt;sys/wait.h&gt;
+-#include &lt;sys/ipc.h&gt;
+-#include &lt;sys/shm.h&gt;
+-#include &lt;unistd.h&gt;
+-#include &lt;string.h&gt;
+-
+-int main() {
+-  pid_t pid;
+-  int status;
+-  int ipc_id;
+-  char *shm;
+-  struct shmid_ds shmbuf;
+-
+-  ipc_id =3D shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
+-  if (ipc_id =3D=3D -1) {
+-    return 1;
+-  }
+-
+-  shm =3D shmat(ipc_id, NULL, 0);
+-  if (shm =3D=3D (void *)-1) {
+-    shmctl(ipc_id, IPC_RMID, NULL);
+-    return 2;
+-  }
+-
+-  if (shmctl(ipc_id, IPC_STAT, &amp;shmbuf) !=3D 0) {
+-    shmdt(shm);
+-    shmctl(ipc_id, IPC_RMID, NULL);
+-    return 3;
+-  }
+-
+-  shmbuf.shm_perm.uid =3D getuid();
+-  shmbuf.shm_perm.gid =3D getgid();
+-  shmbuf.shm_perm.mode =3D 0600;
+-
+-  if (shmctl(ipc_id, IPC_SET, &amp;shmbuf) !=3D 0) {
+-    shmdt(shm);
+-    shmctl(ipc_id, IPC_RMID, NULL);
+-    return 4;
+-  }
+-
+-  shmctl(ipc_id, IPC_RMID, NULL);
+-
+-  strcpy(shm, &quot;hello&quot;);
+-
+-  pid =3D fork();
+-  if (pid &lt; 0) {
+-    return 5;
+-  } else if (pid =3D=3D 0) {
+-    strcpy(shm, &quot;bye&quot;);
+-    return 6;
+-  }
+-  if (wait(&amp;status) !=3D pid) {
+-    return 7;
+-  }
+-  if (!WIFEXITED(status) || WEXITSTATUS(status) !=3D 6) {
+-    return 8;
+-  }
+-  if (strcmp(shm, &quot;bye&quot;) !=3D 0) {
+-    return 9;
+-  }
+-  return 0;
+-}
+-]])],[dnl
+-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support]=
)
+-    msg=3Dyes],[msg=3Dno],[msg=3Dno])
+-  AC_MSG_RESULT([$msg])
++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
+
+   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include &lt;sys/types.h&gt;
+-#include &lt;sys/wait.h&gt;
+-#include &lt;sys/mman.h&gt;
+-#include &lt;unistd.h&gt;
+-#include &lt;string.h&gt;
+-
+-#ifndef MAP_ANON
+-# ifdef MAP_ANONYMOUS
+-#  define MAP_ANON MAP_ANONYMOUS
+-# endif
+-#endif
+-#ifndef MAP_FAILED
+-# define MAP_FAILED ((void*)-1)
+-#endif
++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SH=
M support])
+
+-int main() {
+-  pid_t pid;
+-  int status;
+-  char *shm;
+-
+-  shm =3D mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON=
, -1, 0);
+-  if (shm =3D=3D MAP_FAILED) {
+-    return 1;
+-  }
+-
+-  strcpy(shm, &quot;hello&quot;);
+-
+-  pid =3D fork();
+-  if (pid &lt; 0) {
+-    return 5;
+-  } else if (pid =3D=3D 0) {
+-    strcpy(shm, &quot;bye&quot;);
+-    return 6;
+-  }
+-  if (wait(&amp;status) !=3D pid) {
+-    return 7;
+-  }
+-  if (!WIFEXITED(status) || WEXITSTATUS(status) !=3D 6) {
+-    return 8;
+-  }
+-  if (strcmp(shm, &quot;bye&quot;) !=3D 0) {
+-    return 9;
+-  }
+-  return 0;
+-}
+-]])],[dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) =
SHM support])
+-    msg=3Dyes],[msg=3Dno],[msg=3Dno])
+-  AC_MSG_RESULT([$msg])
+-
+-  PHP_CHECK_FUNC_LIB(shm_open, rt)
+   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include &lt;sys/types.h&gt;
+-#include &lt;sys/wait.h&gt;
+-#include &lt;sys/mman.h&gt;
+-#include &lt;sys/stat.h&gt;
+-#include &lt;fcntl.h&gt;
+-#include &lt;unistd.h&gt;
+-#include &lt;string.h&gt;
+-#include &lt;stdlib.h&gt;
+-#include &lt;stdio.h&gt;
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
+-  sprintf(tmpname,&quot;/opcache.test.shm.%dXXXXXX&quot;, getpid());
+-  if (mktemp(tmpname) =3D=3D NULL) {
+-    return 1;
+-  }
+-  fd =3D shm_open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
+-  if (fd =3D=3D -1) {
+-    return 2;
+-  }
+-  if (ftruncate(fd, 4096) &lt; 0) {
+-    close(fd);
+-    shm_unlink(tmpname);
+-    return 3;
+-  }
+-
+-  shm =3D mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+-  if (shm =3D=3D MAP_FAILED) {
+-    return 4;
+-  }
+-  shm_unlink(tmpname);
+-  close(fd);
+-
+-  strcpy(shm, &quot;hello&quot;);
+-
+-  pid =3D fork();
+-  if (pid &lt; 0) {
+-    return 5;
+-  } else if (pid =3D=3D 0) {
+-    strcpy(shm, &quot;bye&quot;);
+-    return 6;
+-  }
+-  if (wait(&amp;status) !=3D pid) {
+-    return 7;
+-  }
+-  if (!WIFEXITED(status) || WEXITSTATUS(status) !=3D 6) {
+-    return 8;
+-  }
+-  if (strcmp(shm, &quot;bye&quot;) !=3D 0) {
+-    return 9;
+-  }
+-  return 0;
+-}
+-]])],[dnl
+-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() S=
HM support])
+-    AC_MSG_RESULT([yes])
+-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHAR=
ED_LIBADD)])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ])
++  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM=
 support])
+
+   PHP_NEW_EXTENSION(opcache,
+       ZendAccelerator.c \
+--
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-br=
oken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001=
-php-don-t-use-broken-wrapper-for-mkdir.patch
new file mode 100644
index 0000000..d687373
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wr=
apper-for-mkdir.patch
@@ -0,0 +1,29 @@
+From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_=
blank">&lt;koen@dominion.thruhere.net&gt;</a>
+Date: Thu, 3 Nov 2011 14:27:15 +0100
+Subject: [PATCH 2/8] php: don&#39;t use broken wrapper for mkdir
+
+Signed-off-by: Koen Kooi <a href=3D"mailto:koen@dominion.thruhere.net" ta=
rget=3D"_blank">&lt;koen@dominion.thruhere.net&gt;</a>
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
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
+-mkinstalldirs =3D $(top_srcdir)/build/shtool mkdir -p
++mkinstalldirs =3D mkdir -p
+ INSTALL =3D $(top_srcdir)/build/shtool install -c
+ INSTALL_DATA =3D $(INSTALL) -m 644
+
+--
+1.9.3
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch b/meta-oe=
/recipes-devtools/php/php/php7.4-iconv.patch
new file mode 100644
index 0000000..9ec8a89
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <a href=3D"mailto:koen@dominion.thruhere.n=
et" target=3D"_blank">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 N=
ov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
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
+   echo &gt; ext/iconv/php_iconv_supports_errno.h
+
+   dnl Check libc first if no path is provided in --with-iconv.
+-  if test &quot;$PHP_ICONV&quot; =3D &quot;yes&quot;; then
++  dnl must check against no, not against yes as PHP_ICONV can also inclu=
de a path, which implies yes
++  if test &quot;$PHP_ICONV&quot; !=3D &quot;no&quot;; then
+     dnl Reset LIBS temporarily as it may have already been included -lic=
onv in.
+     LIBS_save=3D&quot;$LIBS&quot;
+     LIBS=3D
+diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
+index fe9b47a..b6b632f 100644
+--- a/ext/iconv/config.m4
++++ b/ext/iconv/config.m4
+@@ -14,7 +14,7 @@ if test &quot;$PHP_ICONV&quot; !=3D &quot;no&quot;; the=
n
+
+   if test &quot;$iconv_avail&quot; !=3D &quot;no&quot;; then
+     if test -z &quot;$ICONV_DIR&quot;; then
+-      for i in /usr/local /usr; do
++      for i in $PHP_ICONV /usr/local /usr; do
+         if test -f &quot;$i/include/iconv.h&quot; || test -f &quot;$i/in=
clude/giconv.h&quot;; then
+           PHP_ICONV_PREFIX=3D&quot;$i&quot;
+           break
+--
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patc=
h b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
new file mode 100644
index 0000000..ebe5f6a
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <a href=3D"mailto:koen@dominion.thruhere.n=
et" target=3D"_blank">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 N=
ov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+---
+ ext/imap/config.m4 | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
+index 5086a31..0e938bd 100644
+--- a/ext/imap/config.m4
++++ b/ext/imap/config.m4
+@@ -110,7 +110,7 @@ if test &quot;$PHP_IMAP&quot; !=3D &quot;no&quot;; th=
en
+     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STAT=
IC_TSRMLS_CACHE=3D1)
+     AC_DEFINE(HAVE_IMAP,1,[ ])
+
+-    for i in $PHP_IMAP /usr/local /usr; do
++    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
+       IMAP_INC_CHK()
+       el[]IMAP_INC_CHK(/include/c-client)
+       el[]IMAP_INC_CHK(/include/imap)
+@@ -199,13 +199,7 @@ if test &quot;$PHP_IMAP&quot; !=3D &quot;no&quot;; t=
hen
+       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client inst=
allation.)
+     fi
+
+-    if test ! -r &quot;$IMAP_DIR/c-client/libc-client.a&quot; &amp;&amp;=
 test -r &quot;$IMAP_DIR/c-client/c-client.a&quot; ; then
+-      ln -s &quot;$IMAP_DIR/c-client/c-client.a&quot; &quot;$IMAP_DIR/c-=
client/libc-client.a&quot; &gt;/dev/null 2&gt;&amp;1
+-    elif test ! -r &quot;$IMAP_DIR/$PHP_LIBDIR/libc-client.a&quot; &amp;=
&amp; test -r &quot;$IMAP_DIR/$PHP_LIBDIR/c-client.a&quot;; then
+-      ln -s &quot;$IMAP_DIR/$PHP_LIBDIR/c-client.a&quot; &quot;$IMAP_DIR=
/$PHP_LIBDIR/libc-client.a&quot; &gt;/dev/null 2&gt;&amp;1
+-    fi
+-
+-    for lib in c-client4 c-client imap; do
++    for lib in /usr/lib c-client4 c-client imap; do
+       IMAP_LIB=3D$lib
+       IMAP_LIB_CHK($PHP_LIBDIR)
+       IMAP_LIB_CHK(c-client)
+--
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch b=
/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
new file mode 100644
index 0000000..eb73bc4
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
@@ -0,0 +1,46 @@
+Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <a href=3D"mailto:koen@dominion.thruhere.n=
et" target=3D"_blank">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 N=
ov
+ 2011 16:54:57 +0100 Subject: [PATCH] Fix phar packaging
+
+Inherited from OE-Classic, with some additions to fix host paths leaking
+into the target package.
+
+Upstream-Status: Inappropriate [config]
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
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
+ PHP_PHARCMD_SETTINGS =3D -n -d &#39;open_basedir=3D&#39; -d &#39;output_=
buffering=3D0&#39; -d &#39;memory_limit=3D-1&#39; -d phar.readonly=3D0
+ PHP_PHARCMD_EXECUTABLE =3D ` \
+-      if test -x &quot;$(top_builddir)/$(SAPI_CLI_PATH)&quot;; then \
+-              $(top_srcdir)/build/shtool echo -n -- &quot;$(top_builddir=
)/$(SAPI_CLI_PATH) -n&quot;; \
+-              if test &quot;x$(PHP_MODULES)&quot; !=3D &quot;x&quot;; th=
en \
+-              $(top_srcdir)/build/shtool echo -n -- &quot; -d extension_=
dir=3D$(top_builddir)/modules&quot;; \
+-              for i in bz2 zlib phar; do \
+-                      if test -f &quot;$(top_builddir)/modules/$$<a href=
=
=3D"http://i.la" target=3D"_blank">i.la</a>&quot;; then \
+-                              . $(top_builddir)/modules/$$<a href=3D"htt=
p://i.la" target=3D"_blank">i.la</a>; $(top_srcdir)/build/shtool echo -n --=
 &quot; -d extension=3D$$dlname&quot;; \
+-                      fi; \
+-              done; \
+-              fi; \
+-      else \
+-              $(top_srcdir)/build/shtool echo -n -- &quot;$(PHP_EXECUTAB=
LE)&quot;; \
+-      fi;`
+-PHP_PHARCMD_BANG =3D `$(top_srcdir)/build/shtool echo -n -- &quot;$(INST=
ALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)&quot;;`
++               $(top_srcdir)/build/shtool echo -n -- &quot;$(PHP_EXECUTA=
BLE)&quot;; `
++
++PHP_PHARCMD_BANG =3D `$(top_srcdir)/build/shtool echo -n -- &quot;$(bind=
ir)/$(program_prefix)php$(program_suffix)$(EXEEXT)&quot;;`
+
+ $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
+       -@test -d $(builddir)/phar || mkdir $(builddir)/phar
+--
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch=
 b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
new file mode 100644
index 0000000..4aec481
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
@@ -0,0 +1,26 @@
+Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <a href=3D"mailto:koen@dominion.thruhere.n=
et" target=3D"_blank">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 N=
ov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Inappriate
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+---
+ sapi/cli/config.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
+index 917d45f..aaf1e27 100644
+--- a/sapi/cli/config.m4
++++ b/sapi/cli/config.m4
+@@ -47,7 +47,7 @@ if test &quot;$PHP_CLI&quot; !=3D &quot;no&quot;; then
+   esac
+
+   dnl Set executable for tests.
+-  PHP_EXECUTABLE=3D&quot;\$(top_builddir)/\$(SAPI_CLI_PATH)&quot;
++  PHP_EXECUTABLE=3D&quot;${PHP_NATIVE_DIR}/php&quot;
+   PHP_SUBST(PHP_EXECUTABLE)
+
+   dnl Expose to Makefile.
+--
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_7.4.4.bb" =
target=3D"_blank">php_7.4.4.bb</a> b/meta-oe/recipes-devtools/php/<a href=
=3D"http://php_7.4.4.bb" target=3D"_blank">php_7.4.4.bb</a>
new file mode 100644
index 0000000..1f64172
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_7.4.4.bb" target=
=3D"_blank">php_7.4.4.bb</a>
@@ -0,0 +1,272 @@
+SUMMARY =3D &quot;A server-side, HTML-embedded scripting language&quot;
+HOMEPAGE =3D <a href=3D"http://www.php.net" target=3D"_blank">&quot;http:=
//www.php.net&quot;</a>
+SECTION =3D &quot;console/network&quot;
+
+LICENSE =3D &quot;PHP-3.0&quot;
+LIC_FILES_CHKSUM =3D <a>&quot;file://LICENSE;md5=3D7e571b888d585b31f9ef5e=
dcc647fa30&quot;</a>
+
+BBCLASSEXTEND =3D &quot;native&quot;
+DEPENDS =3D &quot;zlib bzip2 libxml2 virtual/libiconv php-native lemon-na=
tive&quot;
+DEPENDS_class-native =3D &quot;zlib-native libxml2-native&quot;
+
+PHP_MAJOR_VERSION =3D <a href=3D"mailto:$%7B@d.getVar(&#39;PV&#39;).split=
(&#39;.&#39;)[0]%7D" target=3D"_blank">&quot;${@d.getVar(&#39;PV&#39;).spli=
t(&#39;.&#39;)[0]}&quot;</a>
+
+SRC_URI =3D <a href=3D"http://php.net/distributions/php-$%7BPV%7D.tar.bz2=
%5C+file://debian-php-fixheader.patch%5C+file://0001-configure.ac-don-t-inc=
lude-build-libtool.m4.patch%5C+file://php7.4-0001-php-don-t-use-broken-wrap=
per-for-mkdir.patch%5C+file://0001-php.m4-don-t-unset-cache-variables.patch=
%5C+" target=3D"_blank">&quot;http://php.net/distributions/php-${PV}.tar.bz=
2 \
+           file://debian-php-fixheader.patch \
+           file://0001-configure.ac-don-t-include-build-libtool.m4.patch =
\
+           file://php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patc=
h \
+           file://0001-php.m4-don-t-unset-cache-variables.patch \
+          &quot;</a>
+
+SRC_URI_append_class-target =3D &quot; \
+            <a>file://php7.4-imap-fix-autofoo.patch</a> \
+            <a>file://php7.4-php_exec_native.patch</a> \
+            <a>file://php-fpm.conf</a> \
+            <a>file://php-fpm-apache.conf</a> \
+            <a>file://70_mod_php$</a>{PHP_MAJOR_VERSION}.conf \
+            <a>file://php-fpm.service</a> \
+            <a>file://pear-makefile.patch</a> \
+            <a>file://php7.4-phar-makefile.patch</a> \
+            <a>file://php7.4-0001-opcache-config.m4-enable-opcache.patch<=
/a> \
+            <a>file://xfail_two_bug_tests.patch</a> \
+            <a>file://php7.4-iconv.patch</a> \
+          &quot;
+S =3D &quot;${WORKDIR}/php-${PV}&quot;
+SRC_URI[md5sum] =3D &quot;262c258a3b8b5699fcca89a64e58758c&quot;
+SRC_URI[sha256sum] =3D &quot;308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98=
ee4a37475e082fa9829f&quot;
+
+inherit autotools pkgconfig python3native gettext
+
+# phpize is not scanned for absolute paths by default (but php-config is)=
.
+#
+SSTATE_SCAN_FILES +=3D &quot;phpize&quot;
+SSTATE_SCAN_FILES +=3D &quot;build-defs.h&quot;
+
+PHP_LIBDIR =3D &quot;${libdir}/php${PHP_MAJOR_VERSION}&quot;
+
+
+# Common EXTRA_OECONF
+COMMON_EXTRA_OECONF =3D &quot;--enable-sockets \
+                       --enable-pcntl \
+                       --enable-shared \
+                       --disable-rpath \
+                       --with-pic \
+                       --libdir=3D${PHP_LIBDIR} \
+&quot;
+EXTRA_OECONF =3D &quot;--enable-mbstring \
+                --enable-fpm \
+                --with-libdir=3D${baselib} \
+                --with-gettext=3D${STAGING_LIBDIR}/.. \
+                --with-zlib=3D${STAGING_LIBDIR}/.. \
+                --with-iconv=3D${STAGING_LIBDIR}/.. \
+                --with-bz2=3D${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-config-file-path=3D${sysconfdir}/php/apache2-php${=
PHP_MAJOR_VERSION} \
+                ${@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#=
39;le&#39;, &#39;ac_cv_c_bigendian_php=3Dno&#39;, &#39;ac_cv_c_bigendian_ph=
p=3Dyes&#39;, d)} \
+                ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;pam&#3=
9;, &#39;&#39;, &#39;ac_cv_lib_pam_pam_start=3Dno&#39;, d)} \
+                ${COMMON_EXTRA_OECONF} \
+&quot;
+
+EXTRA_OECONF_append_riscv64 =3D &quot; --with-pcre-jit=3Dno&quot;
+EXTRA_OECONF_append_riscv32 =3D &quot; --with-pcre-jit=3Dno&quot;
+
+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_func_dlopen=3Dno ac_cv_lib_dl_dlope=
n=3Dyes&quot;
+
+EXTRA_OECONF_class-native =3D &quot; \
+                --with-zlib=3D${STAGING_LIBDIR_NATIVE}/.. \
+                --without-iconv \
+                ${COMMON_EXTRA_OECONF} \
+&quot;
+
+PACKAGECONFIG ??=3D &quot;mysql sqlite3 imap opcache openssl \
+                   ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;ipv=
6 pam&#39;, d)} \
+&quot;
+PACKAGECONFIG_class-native =3D &quot;&quot;
+
+PACKAGECONFIG[zip] =3D &quot;--enable-zip --with-libzip=3D${STAGING_EXECP=
REFIXDIR},,libzip&quot;
+
+PACKAGECONFIG[mysql] =3D &quot;--with-mysqli=3Dmysqlnd \
+                        --with-pdo-mysql=3Dmysqlnd \
+                        ,--without-mysqli --without-pdo-mysql \
+                        ,mysql5&quot;
+
+PACKAGECONFIG[sqlite3] =3D &quot;--with-sqlite3=3D${STAGING_LIBDIR}/.. \
+                          --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. \
+                          ,--without-sqlite3 --without-pdo-sqlite \
+                          ,sqlite3&quot;
+PACKAGECONFIG[pgsql] =3D &quot;--with-pgsql=3D${STAGING_DIR_TARGET}${exec=
_prefix},--without-pgsql,postgresql&quot;
+PACKAGECONFIG[soap] =3D &quot;--enable-libxml --enable-soap, --disable-so=
ap, libxml2&quot;
+PACKAGECONFIG[apache2] =3D &quot;--with-apxs2=3D${STAGING_BINDIR_CROSS}/a=
pxs,,apache2-native apache2&quot;
+PACKAGECONFIG[pam] =3D &quot;,,libpam&quot;
+PACKAGECONFIG[imap] =3D &quot;--with-imap=3D${STAGING_DIR_HOST} \
+                       --with-imap-ssl=3D${STAGING_DIR_HOST} \
+                       ,--without-imap --without-imap-ssl \
+                       ,uw-imap&quot;
+PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&quot;
+PACKAGECONFIG[opcache] =3D &quot;--enable-opcache,--disable-opcache&quot;
+PACKAGECONFIG[openssl] =3D &quot;--with-openssl,--without-openssl,openssl=
&quot;
+PACKAGECONFIG[valgrind] =3D &quot;--with-valgrind=3D${STAGING_DIR_TARGET}=
/usr,--with-valgrind=3Dno,valgrind&quot;
+PACKAGECONFIG[mbregex] =3D &quot;--enable-mbregex, --disable-mbregex, oni=
guruma&quot;
+
+export PHP_NATIVE_DIR =3D &quot;${STAGING_BINDIR_NATIVE}&quot;
+export PHP_PEAR_PHP_BIN =3D &quot;${STAGING_BINDIR_NATIVE}/php&quot;
+CFLAGS +=3D &quot; -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED =
-I${STAGING_INCDIR}/apache2&quot;
+
+EXTRA_OEMAKE =3D &quot;INSTALL_ROOT=3D${D}&quot;
+
+acpaths =3D &quot;&quot;
+
+do_configure_prepend () {
+    #rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
+    rm -f ${S}/ltmain.sh ${S}/aclocal.m4
+    sed -i -e &#39;s;build/libtool.m4;${ACLOCALDIR}/libtool.m4;g&#39; ${S=
}/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a>
+    find ${S} -name config.m4 | xargs -n1 sed -i &#39;s!APXS_HTTPD=3D.*!A=
PXS_HTTPD=3D${STAGING_SBINDIR_NATIVE}/httpd!&#39;
+}
+
+do_configure_append() {
+    # No, libtool, we really don&#39;t want rpath set...
+    sed -i &#39;s|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_sp=
ec=3D&quot;&quot;|g&#39; ${HOST_SYS}-libtool
+    sed -i &#39;s|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|=
g&#39; ${HOST_SYS}-libtool
+}
+
+do_install_append_class-native() {
+    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
+    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
+    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
+}
+
+do_install_prepend() {
+    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALDI=
R}/ltoptions.m4 \
+        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 &gt; ${S}/bui=
ld/libtool.m4
+}
+
+do_install_prepend_class-target() {
+    if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;apache2&#39;, &=
#39;true&#39;, &#39;false&#39;, d)}; then
+        # Install dummy config file so apxs doesn&#39;t fail
+        install -d ${D}${sysconfdir}/apache2
+        printf &quot;\nLoadModule dummy_module modules/mod_dummy.so\n&quo=
t; &gt; ${D}${sysconfdir}/apache2/httpd.conf
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
+    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.co=
nf
+    install -d ${D}/${sysconfdir}/apache2/conf.d
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apa=
che2/conf.d/php-fpm.conf
+    install -d ${D}${sysconfdir}/init.d
+    sed -i &#39;s:=3D/usr/sbin:=3D${sbindir}:g&#39; ${B}/sapi/fpm/init.d.=
php-fpm
+    sed -i &#39;s:=3D/etc:=3D${sysconfdir}:g&#39; ${B}/sapi/fpm/init.d.ph=
p-fpm
+    sed -i &#39;s:=3D/var:=3D${localstatedir}:g&#39; ${B}/sapi/fpm/init.d=
.php-fpm
+    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d=
/php-fpm
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apa=
che2/conf.d/php-fpm.conf
+
+    if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&=
#39;true&#39;,&#39;false&#39;,d)};then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}=
/system/
+        sed -i -e &#39;s,@SYSCONFDIR@,${sysconfdir},g&#39; \
+            -e &#39;s,@LOCALSTATEDIR@,${localstatedir},g&#39; \
+            ${D}${systemd_unitdir}/system/php-fpm.service
+    fi
+
+    TMP=3D`dirname ${D}/${TMPDIR}`
+    while test ${TMP} !=3D ${D}; do
+        if [ -d ${TMP} ]; then
+            rmdir ${TMP}
+        fi
+        TMP=3D`dirname ${TMP}`;
+    done
+
+    if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;apache2&#39;, &=
#39;true&#39;, &#39;false&#39;, d)}; then
+        install -d ${D}${sysconfdir}/apache2/modules.d
+        install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
+        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${=
D}${sysconfdir}/apache2/modules.d
+        sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules.d=
/70_mod_php${PHP_MAJOR_VERSION}.conf
+        cat ${S}/php.ini-production | \
+            sed -e &#39;s,extension_dir =3D \&quot;\./\&quot;,extension_d=
ir =3D \&quot;/usr/lib/extensions\&quot;,&#39; \
+            &gt; ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/ph=
p.ini
+        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
+    fi
+}
+
+SYSROOT_PREPROCESS_FUNCS +=3D &quot;php_sysroot_preprocess&quot;
+
+php_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crosss=
cripts}/
+    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_cr=
ossscripts}/
+
+    sed -i &#39;s!eval echo /!eval echo ${STAGING_DIR_HOST}/!&#39; ${SYSR=
OOT_DESTDIR}${bindir_crossscripts}/phpize
+    sed -i &#39;s!^include_dir=3D.*!include_dir=3D${STAGING_INCDIR}/php!&=
#39; ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
+}
+
+MODPHP_PACKAGE =3D <a href=3D"mailto:$%7B@bb.utils.contains(&#39;PACKAGEC=
ONFIG&#39;,&#39;apache2&#39;,&#39;$%7BPN%7D-modphp&#39;,&#39;&#39;,d)%7D" t=
arget=3D"_blank">&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;a=
pache2&#39;, &#39;${PN}-modphp&#39;, &#39;&#39;, d)}&quot;</a>
+
+PACKAGES =3D &quot;${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apac=
he2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}=
-doc ${PN}-opcache ${PN}&quot;
+
+RDEPENDS_${PN} +=3D &quot;libgcc&quot;
+RDEPENDS_${PN}-pear =3D &quot;${PN}&quot;
+RDEPENDS_${PN}-phar =3D &quot;${PN}-cli&quot;
+RDEPENDS_${PN}-cli =3D &quot;${PN}&quot;
+RDEPENDS_${PN}-modphp =3D &quot;${PN} apache2&quot;
+RDEPENDS_${PN}-opcache =3D &quot;${PN}&quot;
+
+INITSCRIPT_PACKAGES =3D &quot;${PN}-fpm&quot;
+inherit update-rc.d
+
+FILES_${PN}-dbg =3D+ &quot;${bindir}/.debug \
+                    ${libexecdir}/apache2/modules/.debug&quot;
+FILES_${PN}-doc +=3D &quot;${PHP_LIBDIR}/php/doc&quot;
+FILES_${PN}-cli =3D &quot;${bindir}/php&quot;
+FILES_${PN}-phar =3D &quot;${bindir}/phar*&quot;
+FILES_${PN}-cgi =3D &quot;${bindir}/php-cgi&quot;
+FILES_${PN}-fpm =3D &quot;${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf $=
{datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fp=
m.service ${sysconfdir}/php-fpm.d/www.conf.default&quot;
+FILES_${PN}-fpm-apache2 =3D &quot;${sysconfdir}/apache2/conf.d/php-fpm.co=
nf&quot;
+CONFFILES_${PN}-fpm =3D &quot;${sysconfdir}/php-fpm.conf&quot;
+CONFFILES_${PN}-fpm-apache2 =3D &quot;${sysconfdir}/apache2/conf.d/php-fp=
m.conf&quot;
+INITSCRIPT_NAME_${PN}-fpm =3D &quot;php-fpm&quot;
+INITSCRIPT_PARAMS_${PN}-fpm =3D &quot;defaults 60&quot;
+FILES_${PN}-pear =3D &quot;${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/p=
hp/PEAR \
+                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php =
\
+                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.p=
hp \
+                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.=
alias \
+                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar=
.php \
+                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS=
/Guess.php \
+                ${PHP_LIBDIR}/php/data/PEAR \
+                ${sysconfdir}/pear.conf&quot;
+FILES_${PN}-dev =3D &quot;${includedir}/php ${PHP_LIBDIR}/build ${bindir}=
/phpize \
+                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
+                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
+                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test&quot;
+FILES_${PN}-staticdev +=3D &quot;${PHP_LIBDIR}/extensions/*/*.a&quot;
+FILES_${PN}-opcache =3D &quot;${PHP_LIBDIR}/extensions/*/opcache${SOLIBSD=
EV}&quot;
+FILES_${PN} =3D &quot;${PHP_LIBDIR}/php&quot;
+FILES_${PN} +=3D &quot;${bindir} ${libexecdir}/apache2&quot;
+
+SUMMARY_${PN}-modphp =3D &quot;PHP module for the Apache HTTP server&quot=
;
+FILES_${PN}-modphp =3D &quot;${libdir}/apache2 ${sysconfdir}&quot;
+
+MODPHP_OLDPACKAGE =3D <a href=3D"mailto:$%7B@bb.utils.contains(&#39;PACKA=
GECONFIG&#39;,&#39;apache2&#39;,&#39;modphp&#39;,&#39;&#39;,d)%7D" target=
=3D"_blank">&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;apach=
e2&#39;, &#39;modphp&#39;, &#39;&#39;, d)}&quot;</a>
+RPROVIDES_${PN}-modphp =3D &quot;${MODPHP_OLDPACKAGE}&quot;
+RREPLACES_${PN}-modphp =3D &quot;${MODPHP_OLDPACKAGE}&quot;
+RCONFLICTS_${PN}-modphp =3D &quot;${MODPHP_OLDPACKAGE}&quot;
+
+do_install_append_class-native() {
+    create_wrapper ${D}${bindir}/php \
+        PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
+}
+
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:3719: Error: selected processor does not support Thu=
mb mode `smull r0,r2,r9,r3&#39;
+# | {standard input}:3720: Error: unshifted register required -- `sub r2,=
r2,r0,asr#31&#39;
+# | {standard input}:3796: Error: selected processor does not support Thu=
mb mode `smull r0,r2,r3,r3&#39;
+# | {standard input}:3797: Error: unshifted register required -- `sub r2,=
r2,r0,asr#31&#39;
+# | make: *** [ext/standard/math.lo] Error 1
+ARM_INSTRUCTION_SET =3D &quot;arm&quot;
</pre>
      </blockquote>
      <pre>do we still need this ?, if needed for thumb1 perhaps we should=
 mark
it so with _armv5t and _armv4
overrides so it can be built with thumb2 on newer arches

</pre>
      </blockquote></div><div text=3D"#000000" bgcolor=3D"#FFFFFF"><blockq=
uote type=3D"cite"><blockquote type=3D"cite">
        <pre>--
2.7.4


</pre>
        <br>
        <fieldset></fieldset>
        <pre>
</pre>
      </blockquote>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000ee1c7505a3c5440b--

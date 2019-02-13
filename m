Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2DD6006E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 21:17:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p15so2313559qkl.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 13:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vxpGB8fCiL1dAk81oWz/+ie7nNXczgCCH5Eozzirop4=;
	b=iDzZgSvREi60znVa+awjBLq7DuGh0TKj6xS1EWF81yumG5ImEacU4CoMnpJ4p18735
	fOX88vpRg1/qBIt8MSRZR6c7MKKPi6++kFsRHFz6MIHR7K3b0ENtieP4ISsySdOC829Q
	3SFK25g7vnXA/a1yQmNXRG7rTFtRZ5VVNw0yltaIX0T2bFyeKWCakenR4mCS2m6BmFzu
	/8HK3j/Cjc5tYzjCr8yfRbbK9ezFHK/y0n0oyWz5SA3mHpZnzhssYTd5/AFdOu1k7suV
	RKxSlB5ITwToxWs3JzDNS+2+fFRTmceDB8qEGiSo31Nnj1yqUwNnCSITtvm3yZwpJRv+
	W/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vxpGB8fCiL1dAk81oWz/+ie7nNXczgCCH5Eozzirop4=;
	b=Erce1gAYrQPi9Fi5cFor9LcQJTFa/7wp0ny/ESDalyRwhD3mff8mJ1/W7xxB1suGnY
	c/jy7fRSDdeNQc/GjvI3r/dpIsP1n26JsNxo8gT79ltFCLGJrbiJm7MgmpODg7Nk5Z+Z
	3/wGjG0Ly/MGXvCXzcyzYzay9lo+Rr4bm3kqPAiL80CeHKTbSH3DeGxjreFluUNhGKVU
	kIrCmz4z04zrQDUaB4AVbtKDi3h9pq/rQmiTI3m/qLZSbk2deNEIyJSOJuz9ZKnSmx9M
	pAZgCAOYNxB2FX//wWev8rFhD3DsdYyscnYAftQ6GJCB+sGimL5W2PojckgNLbu0OFle
	rUoQ==
X-Gm-Message-State: AHQUAuaRg7Dd12y1M44/itBIIx6hjPPDauoqDOp15ckhLPjl89qVGpG5
	Kq9U0ikygKoeTC/kkMh4iezCMhWo4e0MUU0mVWjASjnu
X-Google-Smtp-Source: AHgI3IaUtyvLNzPKdnK+OZ/xGb8DgFqUg1KTPT+z39UFh9y+uc1TdCZl0/I1rf1iNUmTHIfqdyNcq7I/MRwXXwZtZZc=
X-Received: by 2002:a37:9e15:: with SMTP id h21mr200035qke.2.1550092649656;
	Wed, 13 Feb 2019 13:17:29 -0800 (PST)
MIME-Version: 1.0
References: <1550026742-114689-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1srFfzv2fAdW=70CULt=Yg7wbyYoDYAijFBnQPwTTnH6ZQ@mail.gmail.com>
In-Reply-To: <CAMKF1srFfzv2fAdW=70CULt=Yg7wbyYoDYAijFBnQPwTTnH6ZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Feb 2019 13:17:03 -0800
Message-ID: <CAMKF1sqzxJRz76b16_tT6YQY6KG8ey+Tv6-45N_am_NJ64E70g@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] php: upgrade 7.2.10 -> 7.3.2 / 5.3.39 -> 5.6.40
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
X-List-Received-Date: Wed, 13 Feb 2019 21:17:29 -0000
Content-Type: text/plain; charset="UTF-8"

and this seems related too
https://errors.yoctoproject.org/Errors/Details/227774/
https://errors.yoctoproject.org/Errors/Details/227798/

On Wed, Feb 13, 2019 at 8:58 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> it seems its missing sqlite3 deps or is a mismatch see
> https://errors.yoctoproject.org/Errors/Details/227750/
>
> On Tue, Feb 12, 2019 at 6:59 PM <changqing.li@windriver.com> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > License-Update: 7.x version trim trailing whitespace
> >
> > 7.x:
> > * drop CVE-2017-9120.patch since it cannot resolve the CVE
> > * use recommand option --with-libzip, bundled libzip is deprecated
> > * update patches
> >
> > 5.x:
> > * use recommand option --with-libzip, bundled libzip is deprecated
> > * update patches
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta-oe/recipes-devtools/php/php.inc               |   4 +-
> >  ...-acinclude.m4-don-t-unset-cache-variables.patch |  17 +--
> >  ...aused-by-a-new-variable-is-declared-after.patch |  45 -------
> >  .../0001-opcache-config.m4-enable-opcache.patch    | 140 ++++++++++++---------
> >  .../recipes-devtools/php/php/CVE-2017-9120.patch   |  21 ----
> >  .../php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch |  61 ---------
> >  ...acinclude.m4-don-t-unset-cache-variables.patch} |  15 ++-
> >  .../php/{php_5.6.39.bb => php_5.6.40.bb}           |   5 +-
> >  .../php/{php_7.2.10.bb => php_7.3.2.bb}            |  11 +-
> >  9 files changed, 108 insertions(+), 211 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch
> >  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch
> >  delete mode 100644 meta-oe/recipes-devtools/php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> >  copy meta-oe/recipes-devtools/php/php/{0001-acinclude.m4-don-t-unset-cache-variables.patch => php5-0001-acinclude.m4-don-t-unset-cache-variables.patch} (70%)
> >  rename meta-oe/recipes-devtools/php/{php_5.6.39.bb => php_5.6.40.bb} (79%)
> >  rename meta-oe/recipes-devtools/php/{php_7.2.10.bb => php_7.3.2.bb} (60%)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> > index ca7bd91..6f893ad 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -20,7 +20,6 @@ SRC_URI_append_class-target = " \
> >              file://php_exec_native.patch \
> >              file://php-fpm.conf \
> >              file://php-fpm-apache.conf \
> > -            file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
> >              file://70_mod_php${PHP_MAJOR_VERSION}.conf \
> >              file://php-fpm.service \
> >            "
> > @@ -46,10 +45,9 @@ COMMON_EXTRA_OECONF = "--enable-sockets \
> >  EXTRA_OECONF = "--enable-mbstring \
> >                  --enable-wddx \
> >                  --enable-fpm \
> > -                --enable-zip \
> >                  --with-libdir=${baselib} \
> >                  --with-gettext=${STAGING_LIBDIR}/.. \
> > -                --with-zlib=${STAGING_LIBDIR}/.. \
> > +                --with-libzip=${STAGING_LIBDIR}/.. \
> >                  --with-iconv=${STAGING_LIBDIR}/.. \
> >                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
> >                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
> > diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
> > index a250cac..51dbe26 100644
> > --- a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
> > +++ b/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
> > @@ -1,6 +1,6 @@
> > -From dfebe81f946a83fe2499fc84d4f3dbdc5612276c Mon Sep 17 00:00:00 2001
> > -From: Anuj Mittal <anuj.mittal@intel.com>
> > -Date: Tue, 3 Apr 2018 11:35:03 +0800
> > +From d2679c89c0b15b90e5360b4863258a7955e5f4e5 Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Tue, 12 Feb 2019 15:59:19 +0800
> >  Subject: [PATCH] acinclude.m4: don't unset cache variables
> >
> >  Unsetting prevents cache variable from being passed to configure.
> > @@ -8,15 +8,18 @@ Unsetting prevents cache variable from being passed to configure.
> >  Upstream-Status: Inappropriate [OE-specific]
> >
> >  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > +
> > +update patch to version 7.3.2
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >  ---
> >   acinclude.m4 | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> >  diff --git a/acinclude.m4 b/acinclude.m4
> > -index f6a55ec..d3346df 100644
> > +index 25f900d..2641969 100644
> >  --- a/acinclude.m4
> >  +++ b/acinclude.m4
> > -@@ -1890,8 +1890,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
> > +@@ -1921,8 +1921,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
> >   dnl
> >   AC_DEFUN([PHP_CHECK_FUNC_LIB],[
> >     ifelse($2,,:,[
> > @@ -25,14 +28,14 @@ index f6a55ec..d3346df 100644
> >     unset found
> >     AC_CHECK_LIB($2, $1, [found=yes], [
> >       AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
> > -@@ -1923,8 +1921,6 @@ dnl in the default libraries and as a fall back in the specified library.
> > +@@ -1954,8 +1952,6 @@ dnl in the default libraries and as a fall back in the specified library.
> >   dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
> >   dnl
> >   AC_DEFUN([PHP_CHECK_FUNC],[
> >  -  unset ac_cv_func_$1
> >  -  unset ac_cv_func___$1
> >     unset found
> > -
> > +
> >     AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
> >  --
> >  2.7.4
> > diff --git a/meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch b/meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch
> > deleted file mode 100644
> > index 6ab101b..0000000
> > --- a/meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -From 0d88d735887c6f2fa00a743c27124c7a52006a41 Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sun, 15 Apr 2018 19:17:27 -0700
> > -Subject: [PATCH] fix error caused by a new variable is declared after the
> > - label
> > -
> > -There is a build failure on mips:
> > -...
> > -|sljitNativeMIPS_common.c: In function 'sljit_has_cpu_feature':
> > -|sljitNativeMIPS_common.c:506:3: error: a label can only be part
> > -of a statement and a declaration is not a statement
> > -|   sljit_sw fir;
> > -|   ^~~~~~~~
> > -...
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ----
> > - ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c | 4 +++-
> > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c b/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c
> > -index ee207fe..adfd342 100644
> > ---- a/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c
> > -+++ b/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c
> > -@@ -498,12 +498,14 @@ SLJIT_API_FUNC_ATTRIBUTE void* sljit_generate_code(struct sljit_compiler *compil
> > -
> > - SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_has_cpu_feature(sljit_s32 feature_type)
> > - {
> > -+#if defined(__GNUC__)
> > -+      sljit_sw fir;
> > -+#endif
> > -       switch (feature_type) {
> > -       case SLJIT_HAS_FPU:
> > - #ifdef SLJIT_IS_FPU_AVAILABLE
> > -               return SLJIT_IS_FPU_AVAILABLE;
> > - #elif defined(__GNUC__)
> > --              sljit_sw fir;
> > -               asm ("cfc1 %0, $0" : "=r"(fir));
> > -               return (fir >> 22) & 0x1;
> > - #else
> > ---
> > -2.10.2
> > -
> > diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
> > index 0d24d34..9ffd0e4 100644
> > --- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
> > +++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
> > @@ -1,6 +1,6 @@
> > -From b2fb725dc404d471371731b663234e87cb0fca84 Mon Sep 17 00:00:00 2001
> > -From: Anuj Mittal <anuj.mittal@intel.com>
> > -Date: Mon, 2 Apr 2018 17:54:52 +0800
> > +From fb139d9707dabe1684b472a08a6eb5761ede4a3a Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Tue, 12 Feb 2019 14:56:16 +0800
> >  Subject: [PATCH] opcache/config.m4: enable opcache
> >
> >  We can't use AC_TRY_RUN to run programs in a cross compile environment. Set
> > @@ -10,42 +10,41 @@ enough linux kernel.
> >  Upstream-Status: Inappropriate [Configuration]
> >
> >  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > +
> > +update patch to version 7.3.2
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >  ---
> > - ext/opcache/config.m4 | 349 ++------------------------------------------------
> > - 1 file changed, 8 insertions(+), 341 deletions(-)
> > + ext/opcache/config.m4 | 357 +-------------------------------------------------
> > + 1 file changed, 6 insertions(+), 351 deletions(-)
> >
> >  diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
> > -index 7b500f0..10bb99a 100644
> > +index 392f4c6..6617693 100644
> >  --- a/ext/opcache/config.m4
> >  +++ b/ext/opcache/config.m4
> > -@@ -28,353 +28,20 @@ if test "$PHP_OPCACHE" != "no"; then
> > -
> > +@@ -27,374 +27,29 @@ if test "$PHP_OPCACHE" != "no"; then
> >     AC_CHECK_HEADERS([unistd.h sys/uio.h])
> >
> > --  AC_MSG_CHECKING(for sysvipc shared memory support)
> > --  AC_TRY_RUN([
> > +   AC_MSG_CHECKING(for sysvipc shared memory support)
> > +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -#include <sys/types.h>
> >  -#include <sys/wait.h>
> >  -#include <sys/ipc.h>
> >  -#include <sys/shm.h>
> >  -#include <unistd.h>
> >  -#include <string.h>
> > -+  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
> > -
> > +-
> >  -int main() {
> >  -  pid_t pid;
> >  -  int status;
> >  -  int ipc_id;
> >  -  char *shm;
> >  -  struct shmid_ds shmbuf;
> > -+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
> > -
> > +-
> >  -  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
> >  -  if (ipc_id == -1) {
> >  -    return 1;
> >  -  }
> > -+  AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
> > -
> > +-
> >  -  shm = shmat(ipc_id, NULL, 0);
> >  -  if (shm == (void *)-1) {
> >  -    shmctl(ipc_id, IPC_RMID, NULL);
> > @@ -90,13 +89,14 @@ index 7b500f0..10bb99a 100644
> >  -  }
> >  -  return 0;
> >  -}
> > --],dnl
> > +-]])],[dnl
> >  -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
> > --    msg=yes,msg=no,msg=no)
> > +-    msg=yes],[msg=no],[msg=no])
> >  -  AC_MSG_RESULT([$msg])
> > --
> > --  AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
> > --  AC_TRY_RUN([
> > ++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
> > +
> > +   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
> > +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -#include <sys/types.h>
> >  -#include <sys/wait.h>
> >  -#include <sys/mman.h>
> > @@ -142,13 +142,14 @@ index 7b500f0..10bb99a 100644
> >  -  }
> >  -  return 0;
> >  -}
> > --],dnl
> > +-]])],[dnl
> >  -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
> > --    msg=yes,msg=no,msg=no)
> > +-    msg=yes],[msg=no],[msg=no])
> >  -  AC_MSG_RESULT([$msg])
> > --
> > --  AC_MSG_CHECKING(for mmap() using /dev/zero shared memory support)
> > --  AC_TRY_RUN([
> > ++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
> > +
> > +   AC_MSG_CHECKING(for mmap() using /dev/zero shared memory support)
> > +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -#include <sys/types.h>
> >  -#include <sys/wait.h>
> >  -#include <sys/mman.h>
> > @@ -197,13 +198,14 @@ index 7b500f0..10bb99a 100644
> >  -  }
> >  -  return 0;
> >  -}
> > --],dnl
> > +-]])],[dnl
> >  -    AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
> > --    msg=yes,msg=no,msg=no)
> > +-    msg=yes],[msg=no],[msg=no])
> >  -  AC_MSG_RESULT([$msg])
> > --
> > --  AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
> > --  AC_TRY_RUN([
> > ++  AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
> > +
> > +   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
> > +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -#include <sys/types.h>
> >  -#include <sys/wait.h>
> >  -#include <sys/mman.h>
> > @@ -266,14 +268,14 @@ index 7b500f0..10bb99a 100644
> >  -  }
> >  -  return 0;
> >  -}
> > --],dnl
> > +-]])],[dnl
> >  -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> > --    msg=yes,msg=no,msg=no)
> > +-    msg=yes],[msg=no],[msg=no])
> >  -  AC_MSG_RESULT([$msg])
> >  +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> >
> >     AC_MSG_CHECKING(for mmap() using regular file shared memory support)
> > --  AC_TRY_RUN([
> > +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -#include <sys/types.h>
> >  -#include <sys/wait.h>
> >  -#include <sys/mman.h>
> > @@ -336,50 +338,70 @@ index 7b500f0..10bb99a 100644
> >  -  }
> >  -  return 0;
> >  -}
> > --],dnl
> > +-]])],[dnl
> >  -    AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
> > --    msg=yes,msg=no,msg=no)
> > +-    msg=yes],[msg=no],[msg=no])
> >  -  AC_MSG_RESULT([$msg])
> > ++  AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
> > +
> > + flock_type=unknown
> > + AC_MSG_CHECKING(for struct flock layout)
> > +
> > + if test "$flock_type" = "unknown"; then
> > +-AC_RUN_IFELSE([AC_LANG_SOURCE([[
> > +-  #include <fcntl.h>
> > +-  struct flock lock = { 1, 2, 3, 4, 5, 6, 7 };
> > +-  int main() {
> > +-    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 6 && lock.l_len== 7) {
> > +-              return 0;
> > +-    }
> > +-    return 1;
> > +-  }
> > +-]])], [
> > +-    flock_type=aix64
> > +-    AC_DEFINE([HAVE_FLOCK_AIX64], [], [Struct flock is 64-bit AIX-type])
> > +-], [])
> > +-fi
> >  -
> > --flock_type=unknown
> > --AC_MSG_CHECKING("whether flock struct is linux ordered")
> > --AC_TRY_RUN([
> > +-if test "$flock_type" = "unknown"; then
> > +-AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -  #include <fcntl.h>
> >  -  struct flock lock = { 1, 2, 3, 4, 5 };
> > --  int main() {
> > +-  int main() {
> >  -    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
> >  -              return 0;
> >  -    }
> >  -    return 1;
> > --  }
> > --], [
> > +-  }
> > +-]])], [
> >  -      flock_type=linux
> > --    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
> > --    AC_MSG_RESULT("yes")
> > --], AC_MSG_RESULT("no") )
> > -+
> > -+  AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
> > ++    flock_type=linux
> > +     AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
> > +-], [])
> > + fi
> >
> > --AC_MSG_CHECKING("whether flock struct is BSD ordered")
> > --AC_TRY_RUN([
> > + if test "$flock_type" = "unknown"; then
> > +-AC_RUN_IFELSE([AC_LANG_SOURCE([[
> >  -  #include <fcntl.h>
> >  -  struct flock lock = { 1, 2, 3, 4, 5 };
> > --  int main() {
> > +-  int main() {
> >  -    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
> >  -              return 0;
> >  -    }
> >  -    return 1;
> > --  }
> > --], [
> > +-  }
> > +-]])], [
> >  -      flock_type=bsd
> > --    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
> > --    AC_MSG_RESULT("yes")
> > --], AC_MSG_RESULT("no") )
> > -+  flock_type=linux
> > -+  AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
> > -
> > - if test "$flock_type" = "unknown"; then
> > +-    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
> > +-], [])
> > +-fi
> > +-
> > +-AC_MSG_RESULT([$flock_type])
> > +-
> > +-if test "$flock_type" = "unknown"; then
> >         AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
> > + fi
> > +
> >  --
> >  2.7.4
> >
> > diff --git a/meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch b/meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch
> > deleted file mode 100644
> > index 728f25b..0000000
> > --- a/meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -php: patch for CVE-2017-9120
> > -
> > -Upstream-Status: Backport [https://bugs.php.net/bug.php?id=74544]
> > -
> > -CVE: CVE-2017-9120
> > -
> > -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > -
> > -diff --git a/ext/mysqli/mysqli_api.c b/ext/mysqli/mysqli_api.c
> > -index 03a39d7..7b88731 100644
> > ---- a/ext/mysqli/mysqli_api.c
> > -+++ b/ext/mysqli/mysqli_api.c
> > -@@ -1965,7 +1965,7 @@ PHP_FUNCTION(mysqli_real_escape_string) {
> > -       }
> > -       MYSQLI_FETCH_RESOURCE_CONN(mysql, mysql_link, MYSQLI_STATUS_VALID);
> > -
> > --      newstr = zend_string_alloc(2 * escapestr_len, 0);
> > -+      newstr = zend_string_safe_alloc(2, escapestr_len, 0, 0);
> > -       ZSTR_LEN(newstr) = mysql_real_escape_string(mysql->mysql, ZSTR_VAL(newstr), escapestr, escapestr_len);
> > -       newstr = zend_string_truncate(newstr, ZSTR_LEN(newstr), 0);
> > -
> > diff --git a/meta-oe/recipes-devtools/php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> > deleted file mode 100644
> > index 3e90184..0000000
> > --- a/meta-oe/recipes-devtools/php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> > +++ /dev/null
> > @@ -1,61 +0,0 @@
> > -From 3bfcc7fdd22261eaed10949714de0a90d31e10ab Mon Sep 17 00:00:00 2001
> > -From: Roy Li <rongqing.li@windriver.com>
> > -Date: Thu, 20 Aug 2015 16:29:35 +0800
> > -Subject: [PATCH] [PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
> > -
> > -Upstream-Status: Pending
> > -
> > -AC_TRY_RUN is not suitable for cross-compile
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > -
> > -%% original patch: change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> > ----
> > - ext/fileinfo/config.m4 | 31 ++++++-------------------------
> > - 1 file changed, 6 insertions(+), 25 deletions(-)
> > -
> > -diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
> > -index 523b4fd..0aaa4c8 100644
> > ---- a/ext/fileinfo/config.m4
> > -+++ b/ext/fileinfo/config.m4
> > -@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" != "no"; then
> > -     libmagic/readcdf.c libmagic/softmagic.c libmagic/der.c"
> > -
> > -   AC_MSG_CHECKING([for strcasestr])
> > --  AC_TRY_RUN([
> > --#include <string.h>
> > --#include <strings.h>
> > --#include <stdlib.h>
> > --
> > --int main(void)
> > --{
> > --        char *s0, *s1, *ret;
> > --
> > --        s0 = (char *) malloc(42);
> > --        s1 = (char *) malloc(8);
> > --
> > --        memset(s0, 'X', 42);
> > --        s0[24] = 'Y';
> > --        s0[26] = 'Z';
> > --        s0[41] = '\0';
> > --        memset(s1, 'x', 8);
> > --        s1[0] = 'y';
> > --        s1[2] = 'Z';
> > --        s1[7] = '\0';
> > --
> > --        ret = strcasestr(s0, s1);
> > --
> > --        return !(NULL != ret);
> > --}
> > -+  AC_TRY_COMPILE([
> > -+     #include <string.h>
> > -+     #include <strings.h>
> > -+     #include <stdlib.h>
> > -+  ],[
> > -+     strcasestr(NULL, NULL);
> > -   ],[
> > -     dnl using the platform implementation
> > -     AC_MSG_RESULT(yes)
> > ---
> > -2.7.4
> > -
> > diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/php5-0001-acinclude.m4-don-t-unset-cache-variables.patch
> > similarity index 70%
> > copy from meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
> > copy to meta-oe/recipes-devtools/php/php/php5-0001-acinclude.m4-don-t-unset-cache-variables.patch
> > index a250cac..72ad554 100644
> > --- a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
> > +++ b/meta-oe/recipes-devtools/php/php/php5-0001-acinclude.m4-don-t-unset-cache-variables.patch
> > @@ -1,6 +1,6 @@
> > -From dfebe81f946a83fe2499fc84d4f3dbdc5612276c Mon Sep 17 00:00:00 2001
> > -From: Anuj Mittal <anuj.mittal@intel.com>
> > -Date: Tue, 3 Apr 2018 11:35:03 +0800
> > +From 1fb5a3b3e6c9cf0002ff76988de72f011b642005 Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Tue, 12 Feb 2019 16:25:37 +0800
> >  Subject: [PATCH] acinclude.m4: don't unset cache variables
> >
> >  Unsetting prevents cache variable from being passed to configure.
> > @@ -8,15 +8,18 @@ Unsetting prevents cache variable from being passed to configure.
> >  Upstream-Status: Inappropriate [OE-specific]
> >
> >  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > +
> > +update patch to version 5.6.40
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >  ---
> >   acinclude.m4 | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> >  diff --git a/acinclude.m4 b/acinclude.m4
> > -index f6a55ec..d3346df 100644
> > +index b188eee..ed32fc5 100644
> >  --- a/acinclude.m4
> >  +++ b/acinclude.m4
> > -@@ -1890,8 +1890,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
> > +@@ -1897,8 +1897,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
> >   dnl
> >   AC_DEFUN([PHP_CHECK_FUNC_LIB],[
> >     ifelse($2,,:,[
> > @@ -25,7 +28,7 @@ index f6a55ec..d3346df 100644
> >     unset found
> >     AC_CHECK_LIB($2, $1, [found=yes], [
> >       AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
> > -@@ -1923,8 +1921,6 @@ dnl in the default libraries and as a fall back in the specified library.
> > +@@ -1930,8 +1928,6 @@ dnl in the default libraries and as a fall back in the specified library.
> >   dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
> >   dnl
> >   AC_DEFUN([PHP_CHECK_FUNC],[
> > diff --git a/meta-oe/recipes-devtools/php/php_5.6.39.bb b/meta-oe/recipes-devtools/php/php_5.6.40.bb
> > similarity index 79%
> > rename from meta-oe/recipes-devtools/php/php_5.6.39.bb
> > rename to meta-oe/recipes-devtools/php/php_5.6.40.bb
> > index a1e7dcd..9f5bac7 100644
> > --- a/meta-oe/recipes-devtools/php/php_5.6.39.bb
> > +++ b/meta-oe/recipes-devtools/php/php_5.6.40.bb
> > @@ -8,6 +8,7 @@ SRC_URI += "file://php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
> >              file://acinclude-xml2-config.patch \
> >              file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
> >              file://0001-PHP-5.6-LibSSL-1.1-compatibility.patch \
> > +            file://php5-0001-acinclude.m4-don-t-unset-cache-variables.patch \
> >              "
> >
> >  SRC_URI_append_class-target = " \
> > @@ -16,8 +17,8 @@ SRC_URI_append_class-target = " \
> >                                  file://php5-0001-opcache-config.m4-enable-opcache.patch \
> >                                  "
> >
> > -SRC_URI[md5sum] = "6951d66bf07ce35beda3be0a66bd8e7c"
> > -SRC_URI[sha256sum] = "b3db2345f50c010b01fe041b4e0f66c5aa28eb325135136f153e18da01583ad5"
> > +SRC_URI[md5sum] = "44633604d2fece1f53f508bc16751b74"
> > +SRC_URI[sha256sum] = "ffd025d34623553ab2f7fd8fb21d0c9e6f9fa30dc565ca03a1d7b763023fba00"
> >
> >  DEPENDS += "libmcrypt"
> >  EXTRA_OECONF += "--with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
> > diff --git a/meta-oe/recipes-devtools/php/php_7.2.10.bb b/meta-oe/recipes-devtools/php/php_7.3.2.bb
> > similarity index 60%
> > rename from meta-oe/recipes-devtools/php/php_7.2.10.bb
> > rename to meta-oe/recipes-devtools/php/php_7.3.2.bb
> > index 8dc64bb..fdd08eb 100644
> > --- a/meta-oe/recipes-devtools/php/php_7.2.10.bb
> > +++ b/meta-oe/recipes-devtools/php/php_7.3.2.bb
> > @@ -1,11 +1,8 @@
> >  require php.inc
> >
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=67e369bc8d1f2e641236b8002039a6a2"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=fb07bfc51f6d5e0c30b65d9701233b2e"
> >
> > -SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
> > -            file://0001-acinclude.m4-skip-binconfig-check-for-libxml.patch \
> > -            file://0001-fix-error-caused-by-a-new-variable-is-declared-after.patch \
> > -            file://CVE-2017-9120.patch \
> > +SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
> >             "
> >  SRC_URI_append_class-target = " \
> >                                  file://pear-makefile.patch \
> > @@ -13,8 +10,8 @@ SRC_URI_append_class-target = " \
> >                                  file://0001-opcache-config.m4-enable-opcache.patch \
> >                                  "
> >
> > -SRC_URI[md5sum] = "0ce8ff615bfb9de7a89bab8d742c11c0"
> > -SRC_URI[sha256sum] = "01b6129a0921a1636b07da9bc598a876669e45a462cef4b5844fc26862dbda9d"
> > +SRC_URI[md5sum] = "c893ff828945c274d90e026528142439"
> > +SRC_URI[sha256sum] = "946f50dacbd2f61e643bb737021cbe8b1816e780ee7ad3e0cd999a1892ab0add"
> >
> >  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
> >                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


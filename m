Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4AFC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 03:22:49 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.4884.1634613769103340791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 20:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8hRhlEP;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id y11so17093147qtn.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 20:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APws9Kn1cpkXjA70ISRXrEGeNP81cE4hCGIcyVhEgrE=;
        b=B8hRhlEPTLuxxd09l4WknVqWjBbtiazhP/XyXv6kBEOnE9fUVirKuOgQBiel21ruBA
         +4eKWyR8FA+rd8hxuRGYxRwnsBO87oXgXL3YAPJBtGjcqPqUF5YytH9slKbFdL+8ESQZ
         xMv32qecwgyf/VWL06FzdjO4TrT3/598P3PJe/ZDcR9jsPInkJkwOGiZnINdqqqIfhpb
         perR0CPR452iQAnVYOOOMdvgeYzBLb7CynZ80zvbuDMoSaPDwojQYsfRWFFO9RuF4OW0
         4NTdD8fK3T+L1foEaSDqr/NdcMNKENncvFTHrY+9TkTffbAodvm076+obRkiyhYhlrd0
         +Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APws9Kn1cpkXjA70ISRXrEGeNP81cE4hCGIcyVhEgrE=;
        b=44kP+7ZAEaRiXzpQk3+VuG3+OnL2BUvWcA1ozOVxPgOTwXRHXtBDJCDQ11SrP6Hdc3
         /cPgzp/vYmMTh8ZxXC4etgXAQ5lVlkaVnH6lBc/bk93TZbmhncsSPuIxP46FTL2vsSnh
         o385enm3Q4wGiw/OEjOoYdGNiAOAxU8tGJVoXoj8cNQN6S3cfJsaSMIjNpfu6uJ4fzyg
         fVouw9nCVeICC/WJc2A0q5HfDlGFxhpiN4bKp0fnYTt3IzclDCapAq9O7KbO5BFslM0u
         DfUtTkkeRhUPtBtwkQ81HU/gMi7W1gl6Mza7XSrOXtaoqzVu9AZR2AT0t/vHvlY271uu
         ZXOQ==
X-Gm-Message-State: AOAM531TjlcbFlQ6PB0P6XLJzrOa0pFVdGjGRHkTy+ELCBNOtlJzx6U+
	fFhGjXv//5NwCe9MI8Tqo39pFOyjMIGB8N2u93I=
X-Google-Smtp-Source: 
 ABdhPJyw6/3EakGxQCddJQ1anMyOANSbfcOzGj+KOb/dSNEAm96g8EO3UjiHvgojGlYuMu/L6aqXoMtkUBRXZhdk8N4=
X-Received: by 2002:ac8:6893:: with SMTP id
 m19mr34094698qtq.116.1634613767926;
 Mon, 18 Oct 2021 20:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <1634547703-128525-1-git-send-email-wangmy@fujitsu.com>
 <bddff772-119e-fbec-5fe8-648a683c062e@gmail.com>
 <OSBPR01MB184529CE2C98049F1D1179ECDCBD9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB184529CE2C98049F1D1179ECDCBD9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2021 20:22:37 -0700
Message-ID: 
 <CAMKF1sp1FoEcS-vNdYnX86oM5TMoRWgE4apqXaY3rzguksySJg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fb78ec05ceac2c8c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 03:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93449

--000000000000fb78ec05ceac2c8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 7:34 PM wangmy@fujitsu.com <wangmy@fujitsu.com>
wrote:

> > > COMMON_EXTRA_OECONF =3D "--enable-sockets \
> > >                          --disable-rpath \
> > >                          --with-pic \
> > >                          --libdir=3D${PHP_LIBDIR} \
> > > +                       --disable-opcache-jit \
> >
> > why do we need to disable jit ? and what are its effects in terms of
> > performance ?
>
> If enable opcache-jit, php will build a binary minilua and then execute i=
t
> immediately. I think it is unsuited to a cross compile environment.


Maybe we can build minilua as part of php-native and use it during
compiling php from native sysroot and other option is to execute it under
qemu usermode


>
> $ cat
> tmp/work/i686-ubinux-linux/php/8.0.10-r0/php-8.0.10/ext/opcache/jit/Makef=
ile.frag
> $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
>         $(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
>
> $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc
> $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
>         $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS=
)
> -o $@ $(srcdir)/jit/zend_jit_x86.dasc ...
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Monday, October 18, 2021 9:58 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
> >
> >
> >
> > On 10/18/21 02:01, wangmy wrote:
> > > 23 Sep 2021, PHP 8.0.11
> > > - Core:
> > >    . Fixed bug #81302 (Stream position after stream filter removed).
> (cmb)
> > >    . Fixed bug #81346 (Non-seekable streams don't update position aft=
er
> > write).
> > >      (cmb)
> > >    . Fixed bug #73122 (Integer Overflow when concatenating strings).
> > > (cmb)
> > > -GD:
> > >    . Fixed bug #53580 (During resize gdImageCopyResampled cause color=
s
> > change).
> > >      (cmb)
> > > - Opcache:
> > >    . Fixed bug #81353 (segfault with preloading and statically bound
> closure).
> > >      (Nikita)
> > > - Shmop:
> > >    . Fixed bug #81407 (shmop_open won't attach and causes php to
> > > crash). (cmb)
> > > - Standard:
> > >    . Fixed bug #71542 (disk_total_space does not work with relative
> paths).
> > (cmb)
> > >    . Fixed bug #81400 (Unterminated string in dns_get_record()
> > > results). (cmb)
> > > - SysVMsg:
> > >    . Fixed bug #78819 (Heap Overflow in msg_send). (cmb)
> > > - XML:
> > >    . Fixed bug #81351 (xml_parse may fail, but has no error code).
> > > (cmb, Nikita)
> > > - Zip:
> > >    . Fixed bug #80833 (ZipArchive::getStream doesn't use setPassword)=
.
> > (Remi)
> > >    . Fixed bug #81420 (ZipArchive::extractTo extracts outside of
> destination).
> > >      (cmb)
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >   ...001-opcache-config.m4-enable-opcache.patch | 113
> > +++++++++++++++---
> > >   .../{70_mod_php7.conf =3D> 70_mod_php8.conf}    |   0
> > >   .../php/php/debian-php-fixheader.patch        |   6 +-
> > >   meta-oe/recipes-devtools/php/php/iconv.patch  |  26 +---
> > >   .../php/php/xfail_two_bug_tests.patch         |  32 +++--
> > >   .../php/{php_7.4.21.bb =3D> php_8.0.11.bb}      |   3 +-
> > >   6 files changed, 129 insertions(+), 51 deletions(-)
> > >   rename meta-oe/recipes-devtools/php/php/{70_mod_php7.conf =3D>
> > 70_mod_php8.conf} (100%)
> > >   rename meta-oe/recipes-devtools/php/{php_7.4.21.bb =3D> php_8.0.11.=
bb}
> > > (98%)
> > >
> > > diff --git
> > > a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opca=
c
> > > he.patch
> > > b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opca=
c
> > > he.patch
> > > index 1f3e683a0f..4278b1c61f 100644
> > > ---
> > > a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opca=
c
> > > he.patch
> > > +++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-=
o
> > > +++ pcache.patch
> > > @@ -1,6 +1,6 @@
> > > -From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Claude Bing <cbing@cybernetics.com>
> > > -Date: Fri, 8 May 2020 10:15:32 -0400
> > > +From c42c7a1498aa9aeebc39d2c84e059d35cf51797a Mon Sep 17 00:00:00
> > > +2001
> > > +From: Lei Maohui <leimaohui@fujitsu.com>
> > > +Date: Tue, 12 Oct 2021 06:17:29 +0000
> > >   Subject: [PATCH] opcache/config.m4: enable opcache
> > >
> > >   We can't use AC_TRY_RUN to run programs in a cross compile
> > environment.
> > > @@ -13,20 +13,85 @@ Upstream-Status: Inappropriate [Configuration]
> > >
> > >   Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > >
> > > -update patch to version 7.4.4
> > > -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > -
> > >   fix issue linking with librt
> > >   Signed-off-by: Claude Bing <cbing@cybernetics.com>
> > > +
> > > +update patch to version 8.0.10
> > > +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > +---
> > >   ---
> > > - ext/opcache/config.m4 | 195
> > > +-----------------------------------------
> > > - 1 file changed, 4 insertions(+), 191 deletions(-)
> > > + ext/opcache/config.m4 | 257
> > > + ++----------------------------------------
> > > + 1 file changed, 10 insertions(+), 247 deletions(-)
> > >
> > >   diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4 -index
> > > 6c40cafc1c..6569aa9e1c 100644
> > > +index 5492fd92..ba55e9c4 100644
> > >   --- a/ext/opcache/config.m4
> > >   +++ b/ext/opcache/config.m4
> > > -@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" !=3D "no"; then
> > > +@@ -43,260 +43,27 @@ if test "$PHP_OPCACHE" !=3D "no"; then
> > > +     ZEND_JIT_SRC=3D"jit/zend_jit.c jit/zend_jit_vm_helpers.c"
> > > +
> > > +     dnl Find out which ABI we are using.
> > > +-    AC_RUN_IFELSE([AC_LANG_SOURCE([[
> > > +-      int main(void) {
> > > +-        return sizeof(void*) =3D=3D 4;
> > > +-      }
> > > +-    ]])],[
> > > +-      ac_cv_32bit_build=3Dno
> > > +-    ],[
> > > +-      ac_cv_32bit_build=3Dyes
> > > +-    ],[
> > > +-      ac_cv_32bit_build=3Dno
> > > ++    PHP_CHECK_LIBRARY(opagent, op_write_native_code,
> > > ++    [
> > > ++      AC_DEFINE(HAVE_OPROFILE,1,[ ])
> > > ++      PHP_ADD_INCLUDE($OPAGENT_DIR/include)
> > > ++      PHP_ADD_LIBRARY_WITH_PATH(opagent,
> > $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
> > > ++      PHP_SUBST(OPCACHE_SHARED_LIBADD)
> > > +     ])
> > > +-
> > > +-    if test "$ac_cv_32bit_build" =3D "no"; then
> > > +-      case $host_alias in
> > > +-        *x86_64-*-darwin*)
> > > +-          DASM_FLAGS=3D"-D X64APPLE=3D1 -D X64=3D1"
> > > +-        ;;
> > > +-        *x86_64*)
> > > +-          DASM_FLAGS=3D"-D X64=3D1"
> > > +-        ;;
> > > +-      esac
> > > +-    fi
> > > +-
> > > +-    if test "$PHP_THREAD_SAFETY" =3D "yes"; then
> > > +-      DASM_FLAGS=3D"$DASM_FLAGS -D ZTS=3D1"
> > > +-    fi
> > > +-
> > > +-    PHP_SUBST(DASM_FLAGS)
> > > +-
> > > +-    AC_MSG_CHECKING(for opagent in default path)
> > > +-    for i in /usr/local /usr; do
> > > +-      if test -r $i/include/opagent.h; then
> > > +-        OPAGENT_DIR=3D$i
> > > +-        AC_MSG_RESULT(found in $i)
> > > +-        break
> > > +-      fi
> > > +-    done
> > > +-    if test -z "$OPAGENT_DIR"; then
> > > +-      AC_MSG_RESULT(not found)
> > > +-    else
> > > +-      PHP_CHECK_LIBRARY(opagent, op_write_native_code,
> > > +-      [
> > > +-        AC_DEFINE(HAVE_OPROFILE,1,[ ])
> > > +-        PHP_ADD_INCLUDE($OPAGENT_DIR/include)
> > > +-        PHP_ADD_LIBRARY_WITH_PATH(opagent,
> > $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
> > > +-        PHP_SUBST(OPCACHE_SHARED_LIBADD)
> > > +-      ],[
> > > +-        AC_MSG_RESULT(not found)
> > > +-      ],[
> > > +-        -L$OPAGENT_DIR/$PHP_LIBDIR/oprofile
> > > +-      ])
> > > +-    fi
> > > +-
> > > +   fi
> > > +
> > >      AC_CHECK_FUNCS([mprotect])
> > >
> > >      AC_MSG_CHECKING(for sysvipc shared memory support) @@ -96,8
> > > +161,8 @@ index 6c40cafc1c..6569aa9e1c 100644
> > >   -}
> > >   -]])],[dnl
> > >   -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM
> > support])
> > > --    msg=3Dyes],[msg=3Dno],[msg=3Dno])
> > > --  AC_MSG_RESULT([$msg])
> > > +-    have_shm_ipc=3Dyes],[have_shm_ipc=3Dno],[have_shm_ipc=3Dno])
> > > +-  AC_MSG_RESULT([$have_shm_ipc])
> > >   +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM
> > > support])
> > >
> > >      AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory
> > support)
> > > @@ -116,8 +181,7 @@ index 6c40cafc1c..6569aa9e1c 100644
> > >   -#ifndef MAP_FAILED
> > >   -# define MAP_FAILED ((void*)-1)
> > >   -#endif
> > > -+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
> > > -+ mmap(MAP_ANON) SHM support])
> > > -
> > > +-
> > >   -int main() {
> > >   -  pid_t pid;
> > >   -  int status;
> > > @@ -150,10 +214,11 @@ index 6c40cafc1c..6569aa9e1c 100644
> > >   -}
> > >   -]])],[dnl
> > >   -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
> > mmap(MAP_ANON) SHM support])
> > > --    msg=3Dyes],[msg=3Dno],[msg=3Dno])
> > > --  AC_MSG_RESULT([$msg])
> > > --
> > > --  PHP_CHECK_FUNC_LIB(shm_open, rt)
> > > +-
> > have_shm_mmap_anon=3Dyes],[have_shm_mmap_anon=3Dno],[have_shm_mmap_a
> > non=3Dno])
> > > +-  AC_MSG_RESULT([$have_shm_mmap_anon])
> > > ++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
> > > ++ mmap(MAP_ANON) SHM support])
> > > +
> > > +   PHP_CHECK_FUNC_LIB(shm_open, rt, root)
> > >      AC_MSG_CHECKING(for mmap() using shm_open() shared memory
> > support)
> > >   -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> > >   -#include <sys/types.h>
> > > @@ -221,6 +286,7 @@ index 6c40cafc1c..6569aa9e1c 100644
> > >   -]])],[dnl
> > >   -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX
> > mmap() SHM support])
> > >   -    AC_MSG_RESULT([yes])
> > > +-    have_shm_mmap_posix=3Dyes
> > >   -    PHP_CHECK_LIBRARY(rt, shm_unlink,
> > [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
> > >   -  ],[
> > >   -    AC_MSG_RESULT([no])
> > > @@ -232,6 +298,17 @@ index 6c40cafc1c..6569aa9e1c 100644
> > >
> > >      PHP_NEW_EXTENSION(opcache,
> > >     ZendAccelerator.c \
> > > +@@ -339,10 +106,6 @@ int main() {
> > > +   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
> > > +   PHP_ADD_EXTENSION_DEP(opcache, pcre)
> > > +
> > > +-  if test "$have_shm_ipc" !=3D "yes" && test "$have_shm_mmap_posix"=
 !=3D
> > "yes" && test "$have_shm_mmap_anon" !=3D "yes"; then
> > > +-    AC_MSG_ERROR([No supported shared memory caching support was
> > found when configuring opcache. Check config.log for any errors or
> missing
> > dependencies.])
> > > +-  fi
> > > +-
> > > +   if test "$PHP_OPCACHE_JIT" =3D "yes"; then
> > > +     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
> > > +     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
> > >   --
> > >   2.17.1
> > >
> > > diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf
> > > b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
> > > similarity index 100%
> > > rename from meta-oe/recipes-devtools/php/php/70_mod_php7.conf
> > > rename to meta-oe/recipes-devtools/php/php/70_mod_php8.conf
> > > diff --git
> > > a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
> > > b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
> > > index a4804d1849..ed578d5e99 100644
> > > --- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
> > > +++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
> > > @@ -18,9 +18,9 @@ diff --git a/configure.ac b/configure.ac
> > >   index 2a474ba36d..6d22a21630 100644
> > >   --- a/configure.ac
> > >   +++ b/configure.ac
> > > -@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`
> > > - fi
> > > - AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build
> > > date])
> > > +@@ -1288,7 +1288,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`
> > > +EXTRA_LDFLAGS=3D"$EXTRA_LDFLAGS $PHP_LDFLAGS"
> > > + EXTRA_LDFLAGS_PROGRAM=3D"$EXTRA_LDFLAGS_PROGRAM
> > $PHP_LDFLAGS"
> > >
> > >   -UNAME=3D`uname -a | xargs`
> > >   +UNAME=3D`uname | xargs`
> > > diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch
> > > b/meta-oe/recipes-devtools/php/php/iconv.patch
> > > index 9ec8a89b57..9b2d85951c 100644
> > > --- a/meta-oe/recipes-devtools/php/php/iconv.patch
> > > +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
> > > @@ -5,16 +5,15 @@ Subject: [PATCH] From
> > 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
> > >   update patch to version 7.4.4
> > >   Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > >   ---
> > > - build/php.m4        | 3 ++-
> > > - ext/iconv/config.m4 | 2 +-
> > > - 2 files changed, 3 insertions(+), 2 deletions(-)
> > > + build/php.m4 | 3 ++-
> > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > >   diff --git a/build/php.m4 b/build/php.m4 -index 7392876..5c45d13
> > > 100644
> > > +index 93551d9c..dba50825 100644
> > >   --- a/build/php.m4
> > >   +++ b/build/php.m4
> > > -@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> > > -   echo > ext/iconv/php_iconv_supports_errno.h
> > > +@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> > > +   unset ICONV_DIR
> > >
> > >      dnl Check libc first if no path is provided in --with-iconv.
> > >   -  if test "$PHP_ICONV" =3D "yes"; then @@ -23,19 +22,6 @@ index
> > > 7392876..5c45d13 100644
> > >        dnl Reset LIBS temporarily as it may have already been include=
d
> > -liconv in.
> > >        LIBS_save=3D"$LIBS"
> > >        LIBS=3D
> > > -diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4 -index
> > > fe9b47a..b6b632f 100644
> > > ---- a/ext/iconv/config.m4
> > > -+++ b/ext/iconv/config.m4
> > > -@@ -14,7 +14,7 @@ if test "$PHP_ICONV" !=3D "no"; then
> > > -
> > > -   if test "$iconv_avail" !=3D "no"; then
> > > -     if test -z "$ICONV_DIR"; then
> > > --      for i in /usr/local /usr; do
> > > -+      for i in $PHP_ICONV /usr/local /usr; do
> > > -         if test -f "$i/include/iconv.h" || test -f
> "$i/include/giconv.h"; then
> > > -           PHP_ICONV_PREFIX=3D"$i"
> > > -           break
> > >   --
> > > -2.7.4
> > > +2.25.1
> > >
> > > diff --git
> > > a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
> > > b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
> > > index 21057439c9..5c4fab3e55 100644
> > > --- a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
> > > +++ b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
> > > @@ -1,4 +1,7 @@
> > > -php-ptest: xfail two tests
> > > +From 2b860634886d353fe34a5236642074a6f3106d3d Mon Sep 17 00:00:00
> > > +2001
> > > +From: Lei Maohui <leimaohui@fujitsu.com>
> > > +Date: Tue, 12 Oct 2021 02:11:10 +0000
> > > +Subject: [PATCH] php-ptest: xfail two tests
> > >
> > >   If and when these tests are modified to expect the correct output,
> they will
> > >   succeed and generate warnings in the test summary.  This patch can
> then
> > be removed.
> > > @@ -9,26 +12,37 @@ Upstream-Status: Pending
> > >
> > >   Signed-off-By: Joe Slater <joe.slater@windriver.com>
> > >
> > > +update patch to version 8.0.10
> > > +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > +---
> > > + tests/basic/bug71273.phpt      | 2 ++
> > > + tests/run-test/bug75042-3.phpt | 2 ++
> > > + 2 files changed, 4 insertions(+)
> > >
> > > +diff --git a/tests/basic/bug71273.phpt b/tests/basic/bug71273.phpt
> > > +index 7634d432..50451d7b 100644
> > >   --- a/tests/basic/bug71273.phpt
> > >   +++ b/tests/basic/bug71273.phpt
> > > -@@ -16,6 +16,8 @@ Bug #71273 A wrong ext directory setup i
> > > -   var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,s"=
,
> $out));
> > > +@@ -9,5 +9,7 @@ Bug #71273 A wrong ext directory setup in php.ini
> > > +leads to crash
> > > +
> > > +
> > > + var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,s",
> > > + $out));
> > >    ?>
> > > - =3D=3DDONE=3D=3D
> > >   +--XFAIL--
> > >   +Output is int(0), not int(1)
> > >    --EXPECT--
> > >    int(1)
> > > - =3D=3DDONE=3D=3D
> > > +diff --git a/tests/run-test/bug75042-3.phpt
> > > +b/tests/run-test/bug75042-3.phpt index 5a30143b..1ca1055a 100644
> > >   --- a/tests/run-test/bug75042-3.phpt
> > >   +++ b/tests/run-test/bug75042-3.phpt -@@ -8,5 +8,8 @@
> > > display_errors=3D1
> > > - nonexistentsharedmodule
> > > +@@ -9,5 +9,7 @@ nonexistentsharedmodule
> > >    --FILE--
> > >    <?php
> > > -+?>
> > > + ?>
> > >   +--XFAIL--
> > >   +No warning message printed.
> > >    --EXPECTF--
> > > - PHP Warning:  PHP Startup: Unable to load dynamic library
> > > '%snonexistentsharedmodule.%s' %A
> > > + Warning: PHP Startup: Unable to load dynamic library
> > > +'%snonexistentsharedmodule.%s' %A
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb
> > > b/meta-oe/recipes-devtools/php/php_8.0.11.bb
> > > similarity index 98%
> > > rename from meta-oe/recipes-devtools/php/php_7.4.21.bb
> > > rename to meta-oe/recipes-devtools/php/php_8.0.11.bb
> > > index 916010a6ff..a8a2699cdb 100644
> > > --- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
> > > +++ b/meta-oe/recipes-devtools/php/php_8.0.11.bb
> > > @@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D " \
> > >             "
> > >
> > >   S =3D "${WORKDIR}/php-${PV}"
> > > -SRC_URI[sha256sum] =3D
> > "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
> > > +SRC_URI[sha256sum] =3D
> > "70ed874285e4010c1e2e8937bfb56b13b9ed1b3789dcaf274b793b00c1f4403a"
> > >
> > >
> > >   inherit autotools pkgconfig python3native gettext @@ -52,6 +52,7 @@
> > > COMMON_EXTRA_OECONF =3D "--enable-sockets \
> > >                          --disable-rpath \
> > >                          --with-pic \
> > >                          --libdir=3D${PHP_LIBDIR} \
> > > +                       --disable-opcache-jit \
> >
> > why do we need to disable jit ? and what are its effects in terms of
> > performance ?
> >
> > >   "
> > >   EXTRA_OECONF =3D "--enable-mbstring \
> > >                   --enable-fpm \
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#93419):
> > > https://lists.openembedded.org/g/openembedded-devel/message/93419
> > > Mute This Topic: https://lists.openembedded.org/mt/86409155/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--000000000000fb78ec05ceac2c8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 18, 2021 at 7:34 PM <a href=3D"mailto:wangmy@fu=
jitsu.com">wangmy@fujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com"=
>wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">&gt; &gt; COMM=
ON_EXTRA_OECONF =3D &quot;--enable-sockets \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --disable-rpath \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --with-pic \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D${PHP_LIBDIR} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0--disable-opcache-jit \<br>
&gt; <br>
&gt; why do we need to disable jit ? and what are its effects in terms of<b=
r>
&gt; performance ?<br>
<br>
If enable opcache-jit, php will build a binary minilua and then execute it =
immediately. I think it is unsuited to a cross compile environment.</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">Maybe we can build minil=
ua as part of php-native and use it during compiling php from native sysroo=
t and other option is to execute it under qemu usermode=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
$ cat tmp/work/i686-ubinux-linux/php/8.0.10-r0/php-8.0.10/ext/opcache/jit/M=
akefile.frag<br>
$(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@<=
br>
<br>
$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/j=
it/dynasm/*.lua $(builddir)/minilua<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm=
.lua=C2=A0 $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc ...<br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
Development Dept.I<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, Nan=
jing, 210012, China<br>
TEL: +86+25-86630566-8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<a href=3D"http://www.fujitsu.com/cn/fnst/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.fujitsu.com/cn/fnst/</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Monday, October 18, 2021 9:58 PM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -&gt; 8.0.11<b=
r>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 10/18/21 02:01, wangmy wrote:<br>
&gt; &gt; 23 Sep 2021, PHP 8.0.11<br>
&gt; &gt; - Core:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81302 (Stream position after stream fil=
ter removed). (cmb)<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81346 (Non-seekable streams don&#39;t u=
pdate position after<br>
&gt; write).<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (cmb)<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #73122 (Integer Overflow when concatenat=
ing strings).<br>
&gt; &gt; (cmb)<br>
&gt; &gt; -GD:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #53580 (During resize gdImageCopyResampl=
ed cause colors<br>
&gt; change).<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (cmb)<br>
&gt; &gt; - Opcache:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81353 (segfault with preloading and sta=
tically bound closure).<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (Nikita)<br>
&gt; &gt; - Shmop:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81407 (shmop_open won&#39;t attach and =
causes php to<br>
&gt; &gt; crash). (cmb)<br>
&gt; &gt; - Standard:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #71542 (disk_total_space does not work w=
ith relative paths).<br>
&gt; (cmb)<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81400 (Unterminated string in dns_get_r=
ecord()<br>
&gt; &gt; results). (cmb)<br>
&gt; &gt; - SysVMsg:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #78819 (Heap Overflow in msg_send). (cmb=
)<br>
&gt; &gt; - XML:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81351 (xml_parse may fail, but has no e=
rror code).<br>
&gt; &gt; (cmb, Nikita)<br>
&gt; &gt; - Zip:<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #80833 (ZipArchive::getStream doesn&#39;=
t use setPassword).<br>
&gt; (Remi)<br>
&gt; &gt;=C2=A0 =C2=A0 . Fixed bug #81420 (ZipArchive::extractTo extracts o=
utside of destination).<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (cmb)<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0...001-opcache-config.m4-enable-opcache.patch | 113<b=
r>
&gt; +++++++++++++++---<br>
&gt; &gt;=C2=A0 =C2=A0.../{70_mod_php7.conf =3D&gt; 70_mod_php8.conf}=C2=A0=
 =C2=A0 |=C2=A0 =C2=A00<br>
&gt; &gt;=C2=A0 =C2=A0.../php/php/debian-php-fixheader.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/php/php/iconv.patch=C2=A0 |=
=C2=A0 26 +---<br>
&gt; &gt;=C2=A0 =C2=A0.../php/php/xfail_two_bug_tests.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 32 +++--<br>
&gt; &gt;=C2=A0 =C2=A0.../php/{<a href=3D"http://php_7.4.21.bb" rel=3D"nore=
ferrer" target=3D"_blank">php_7.4.21.bb</a> =3D&gt; <a href=3D"http://php_8=
.0.11.bb" rel=3D"noreferrer" target=3D"_blank">php_8.0.11.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt; &gt;=C2=A0 =C2=A06 files changed, 129 insertions(+), 51 deletions(-)<b=
r>
&gt; &gt;=C2=A0 =C2=A0rename meta-oe/recipes-devtools/php/php/{70_mod_php7.=
conf =3D&gt;<br>
&gt; 70_mod_php8.conf} (100%)<br>
&gt; &gt;=C2=A0 =C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http:=
//php_7.4.21.bb" rel=3D"noreferrer" target=3D"_blank">php_7.4.21.bb</a> =3D=
&gt; <a href=3D"http://php_8.0.11.bb" rel=3D"noreferrer" target=3D"_blank">=
php_8.0.11.bb</a>}<br>
&gt; &gt; (98%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-=
opcac<br>
&gt; &gt; he.patch<br>
&gt; &gt; b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-=
opcac<br>
&gt; &gt; he.patch<br>
&gt; &gt; index 1f3e683a0f..4278b1c61f 100644<br>
&gt; &gt; ---<br>
&gt; &gt; a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-=
opcac<br>
&gt; &gt; he.patch<br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-ena=
ble-o<br>
&gt; &gt; +++ pcache.patch<br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt; -From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Claude Bing &lt;<a href=3D"mailto:cbing@cybernetics.com" t=
arget=3D"_blank">cbing@cybernetics.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 8 May 2020 10:15:32 -0400<br>
&gt; &gt; +From c42c7a1498aa9aeebc39d2c84e059d35cf51797a Mon Sep 17 00:00:0=
0<br>
&gt; &gt; +2001<br>
&gt; &gt; +From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" ta=
rget=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 12 Oct 2021 06:17:29 +0000<br>
&gt; &gt;=C2=A0 =C2=A0Subject: [PATCH] opcache/config.m4: enable opcache<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0We can&#39;t use AC_TRY_RUN to run programs in a cros=
s compile<br>
&gt; environment.<br>
&gt; &gt; @@ -13,20 +13,85 @@ Upstream-Status: Inappropriate [Configuration=
]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj=
.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; -update patch to version 7.4.4<br>
&gt; &gt; -Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0fix issue linking with librt<br>
&gt; &gt;=C2=A0 =C2=A0Signed-off-by: Claude Bing &lt;<a href=3D"mailto:cbin=
g@cybernetics.com" target=3D"_blank">cbing@cybernetics.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +update patch to version 8.0.10<br>
&gt; &gt; +Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujits=
u.com" target=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt;=C2=A0 =C2=A0---<br>
&gt; &gt; - ext/opcache/config.m4 | 195<br>
&gt; &gt; +-----------------------------------------<br>
&gt; &gt; - 1 file changed, 4 insertions(+), 191 deletions(-)<br>
&gt; &gt; + ext/opcache/config.m4 | 257<br>
&gt; &gt; + ++----------------------------------------<br>
&gt; &gt; + 1 file changed, 10 insertions(+), 247 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0diff --git a/ext/opcache/config.m4 b/ext/opcache/conf=
ig.m4 -index<br>
&gt; &gt; 6c40cafc1c..6569aa9e1c 100644<br>
&gt; &gt; +index 5492fd92..ba55e9c4 100644<br>
&gt; &gt;=C2=A0 =C2=A0--- a/ext/opcache/config.m4<br>
&gt; &gt;=C2=A0 =C2=A0+++ b/ext/opcache/config.m4<br>
&gt; &gt; -@@ -23,201 +23,14 @@ if test &quot;$PHP_OPCACHE&quot; !=3D &quot=
;no&quot;; then<br>
&gt; &gt; +@@ -43,260 +43,27 @@ if test &quot;$PHP_OPCACHE&quot; !=3D &quot=
;no&quot;; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ZEND_JIT_SRC=3D&quot;jit/zend_jit.c jit/zend=
_jit_vm_helpers.c&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0dnl Find out which ABI we are using.<br>
&gt; &gt; +-=C2=A0 =C2=A0 AC_RUN_IFELSE([AC_LANG_SOURCE([[<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 int main(void) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(void*) =3D=3D 4;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 ]])],[<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ac_cv_32bit_build=3Dno<br>
&gt; &gt; +-=C2=A0 =C2=A0 ],[<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ac_cv_32bit_build=3Dyes<br>
&gt; &gt; +-=C2=A0 =C2=A0 ],[<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ac_cv_32bit_build=3Dno<br>
&gt; &gt; ++=C2=A0 =C2=A0 PHP_CHECK_LIBRARY(opagent, op_write_native_code,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 [<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_OPROFILE,1,[ ])<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 PHP_ADD_INCLUDE($OPAGENT_DIR/include)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 PHP_ADD_LIBRARY_WITH_PATH(opagent,<br>
&gt; $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 PHP_SUBST(OPCACHE_SHARED_LIBADD)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0])<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 if test &quot;$ac_cv_32bit_build&quot; =3D &quot;=
no&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 case $host_alias in<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *x86_64-*-darwin*)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DASM_FLAGS=3D&quot;-D X64APP=
LE=3D1 -D X64=3D1&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *x86_64*)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DASM_FLAGS=3D&quot;-D X64=3D=
1&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; &gt; +-=C2=A0 =C2=A0 fi<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 if test &quot;$PHP_THREAD_SAFETY&quot; =3D &quot;=
yes&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 DASM_FLAGS=3D&quot;$DASM_FLAGS -D ZTS=3D1&=
quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 fi<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 PHP_SUBST(DASM_FLAGS)<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 AC_MSG_CHECKING(for opagent in default path)<br>
&gt; &gt; +-=C2=A0 =C2=A0 for i in /usr/local /usr; do<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 if test -r $i/include/opagent.h; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPAGENT_DIR=3D$i<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(found in $i)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; +-=C2=A0 =C2=A0 done<br>
&gt; &gt; +-=C2=A0 =C2=A0 if test -z &quot;$OPAGENT_DIR&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(not found)<br>
&gt; &gt; +-=C2=A0 =C2=A0 else<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 PHP_CHECK_LIBRARY(opagent, op_write_native=
_code,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 [<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_OPROFILE,1,[ ])<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_ADD_INCLUDE($OPAGENT_DIR/includ=
e)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_ADD_LIBRARY_WITH_PATH(opagent,<=
br>
&gt; $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_SUBST(OPCACHE_SHARED_LIBADD)<br=
>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ],[<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(not found)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ],[<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -L$OPAGENT_DIR/$PHP_LIBDIR/oprofile=
<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; &gt; +-=C2=A0 =C2=A0 fi<br>
&gt; &gt; +-<br>
&gt; &gt; +=C2=A0 =C2=A0fi<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AC_CHECK_FUNCS([mprotect])<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for sysvipc shared memory sup=
port) @@ -96,8<br>
&gt; &gt; +161,8 @@ index 6c40cafc1c..6569aa9e1c 100644<br>
&gt; &gt;=C2=A0 =C2=A0-}<br>
&gt; &gt;=C2=A0 =C2=A0-]])],[dnl<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_DEFINE(HAVE_SHM_IPC, 1, [Define if =
you have SysV IPC SHM<br>
&gt; support])<br>
&gt; &gt; --=C2=A0 =C2=A0 msg=3Dyes],[msg=3Dno],[msg=3Dno])<br>
&gt; &gt; --=C2=A0 AC_MSG_RESULT([$msg])<br>
&gt; &gt; +-=C2=A0 =C2=A0 have_shm_ipc=3Dyes],[have_shm_ipc=3Dno],[have_shm=
_ipc=3Dno])<br>
&gt; &gt; +-=C2=A0 AC_MSG_RESULT([$have_shm_ipc])<br>
&gt; &gt;=C2=A0 =C2=A0+=C2=A0 AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you hav=
e SysV IPC SHM<br>
&gt; &gt; support])<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for mmap() using MAP_ANON sha=
red memory<br>
&gt; support)<br>
&gt; &gt; @@ -116,8 +181,7 @@ index 6c40cafc1c..6569aa9e1c 100644<br>
&gt; &gt;=C2=A0 =C2=A0-#ifndef MAP_FAILED<br>
&gt; &gt;=C2=A0 =C2=A0-# define MAP_FAILED ((void*)-1)<br>
&gt; &gt;=C2=A0 =C2=A0-#endif<br>
&gt; &gt; -+=C2=A0 AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have<br>
&gt; &gt; -+ mmap(MAP_ANON) SHM support])<br>
&gt; &gt; -<br>
&gt; &gt; +-<br>
&gt; &gt;=C2=A0 =C2=A0-int main() {<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 pid_t pid;<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 int status;<br>
&gt; &gt; @@ -150,10 +214,11 @@ index 6c40cafc1c..6569aa9e1c 100644<br>
&gt; &gt;=C2=A0 =C2=A0-}<br>
&gt; &gt;=C2=A0 =C2=A0-]])],[dnl<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Defi=
ne if you have<br>
&gt; mmap(MAP_ANON) SHM support])<br>
&gt; &gt; --=C2=A0 =C2=A0 msg=3Dyes],[msg=3Dno],[msg=3Dno])<br>
&gt; &gt; --=C2=A0 AC_MSG_RESULT([$msg])<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 PHP_CHECK_FUNC_LIB(shm_open, rt)<br>
&gt; &gt; +-<br>
&gt; have_shm_mmap_anon=3Dyes],[have_shm_mmap_anon=3Dno],[have_shm_mmap_a<b=
r>
&gt; non=3Dno])<br>
&gt; &gt; +-=C2=A0 AC_MSG_RESULT([$have_shm_mmap_anon])<br>
&gt; &gt; ++=C2=A0 AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have<br>
&gt; &gt; ++ mmap(MAP_ANON) SHM support])<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0PHP_CHECK_FUNC_LIB(shm_open, rt, root)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for mmap() using shm_open() s=
hared memory<br>
&gt; support)<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 AC_RUN_IFELSE([AC_LANG_SOURCE([[<br>
&gt; &gt;=C2=A0 =C2=A0-#include &lt;sys/types.h&gt;<br>
&gt; &gt; @@ -221,6 +286,7 @@ index 6c40cafc1c..6569aa9e1c 100644<br>
&gt; &gt;=C2=A0 =C2=A0-]])],[dnl<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Def=
ine if you have POSIX<br>
&gt; mmap() SHM support])<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_MSG_RESULT([yes])<br>
&gt; &gt; +-=C2=A0 =C2=A0 have_shm_mmap_posix=3Dyes<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 PHP_CHECK_LIBRARY(rt, shm_unlink,<br>
&gt; [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 ],[<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_MSG_RESULT([no])<br>
&gt; &gt; @@ -232,6 +298,17 @@ index 6c40cafc1c..6569aa9e1c 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 PHP_NEW_EXTENSION(opcache,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ZendAccelerator.c \<br>
&gt; &gt; +@@ -339,10 +106,6 @@ int main() {<br>
&gt; &gt; +=C2=A0 =C2=A0PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)<br>
&gt; &gt; +=C2=A0 =C2=A0PHP_ADD_EXTENSION_DEP(opcache, pcre)<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if test &quot;$have_shm_ipc&quot; !=3D &quot;yes&quot; &=
amp;&amp; test &quot;$have_shm_mmap_posix&quot; !=3D<br>
&gt; &quot;yes&quot; &amp;&amp; test &quot;$have_shm_mmap_anon&quot; !=3D &=
quot;yes&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 AC_MSG_ERROR([No supported shared memory caching =
support was<br>
&gt; found when configuring opcache. Check config.log for any errors or mis=
sing<br>
&gt; dependencies.])<br>
&gt; &gt; +-=C2=A0 fi<br>
&gt; &gt; +-<br>
&gt; &gt; +=C2=A0 =C2=A0if test &quot;$PHP_OPCACHE_JIT&quot; =3D &quot;yes&=
quot;; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Ma=
kefile.frag)<br>
&gt; &gt;=C2=A0 =C2=A0--<br>
&gt; &gt;=C2=A0 =C2=A02.17.1<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf<br=
>
&gt; &gt; b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta-oe/recipes-devtools/php/php/70_mod_php7.conf<br>
&gt; &gt; rename to meta-oe/recipes-devtools/php/php/70_mod_php8.conf<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch<br>
&gt; &gt; b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch<br>
&gt; &gt; index a4804d1849..ed578d5e99 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch=
<br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch=
<br>
&gt; &gt; @@ -18,9 +18,9 @@ diff --git a/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://con=
figure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; &gt;=C2=A0 =C2=A0index 2a474ba36d..6d22a21630 100644<br>
&gt; &gt;=C2=A0 =C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; &gt;=C2=A0 =C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; &gt; -@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`<br>
&gt; &gt; - fi<br>
&gt; &gt; - AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,&quot;$PHP_BUILD_DATE&quot;,[=
PHP build<br>
&gt; &gt; date])<br>
&gt; &gt; +@@ -1288,7 +1288,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`<br>
&gt; &gt; +EXTRA_LDFLAGS=3D&quot;$EXTRA_LDFLAGS $PHP_LDFLAGS&quot;<br>
&gt; &gt; + EXTRA_LDFLAGS_PROGRAM=3D&quot;$EXTRA_LDFLAGS_PROGRAM<br>
&gt; $PHP_LDFLAGS&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0-UNAME=3D`uname -a | xargs`<br>
&gt; &gt;=C2=A0 =C2=A0+UNAME=3D`uname | xargs`<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch<br>
&gt; &gt; b/meta-oe/recipes-devtools/php/php/iconv.patch<br>
&gt; &gt; index 9ec8a89b57..9b2d85951c 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/php/iconv.patch<br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/php/iconv.patch<br>
&gt; &gt; @@ -5,16 +5,15 @@ Subject: [PATCH] From<br>
&gt; 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0update patch to version 7.4.4<br>
&gt; &gt;=C2=A0 =C2=A0Signed-off-by: Changqing Li &lt;<a href=3D"mailto:cha=
ngqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&g=
t;<br>
&gt; &gt;=C2=A0 =C2=A0---<br>
&gt; &gt; - build/php.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<br>
&gt; &gt; - ext/iconv/config.m4 | 2 +-<br>
&gt; &gt; - 2 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt; &gt; + build/php.m4 | 3 ++-<br>
&gt; &gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0diff --git a/build/php.m4 b/build/php.m4 -index 73928=
76..5c45d13<br>
&gt; &gt; 100644<br>
&gt; &gt; +index 93551d9c..dba50825 100644<br>
&gt; &gt;=C2=A0 =C2=A0--- a/build/php.m4<br>
&gt; &gt;=C2=A0 =C2=A0+++ b/build/php.m4<br>
&gt; &gt; -@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [<br>
&gt; &gt; -=C2=A0 =C2=A0echo &gt; ext/iconv/php_iconv_supports_errno.h<br>
&gt; &gt; +@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [<br>
&gt; &gt; +=C2=A0 =C2=A0unset ICONV_DIR<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 dnl Check libc first if no path is provided i=
n --with-iconv.<br>
&gt; &gt;=C2=A0 =C2=A0-=C2=A0 if test &quot;$PHP_ICONV&quot; =3D &quot;yes&=
quot;; then @@ -23,19 +22,6 @@ index<br>
&gt; &gt; 7392876..5c45d13 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Reset LIBS temporarily as it may h=
ave already been included<br>
&gt; -liconv in.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS_save=3D&quot;$LIBS&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D<br>
&gt; &gt; -diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4 -index<br=
>
&gt; &gt; fe9b47a..b6b632f 100644<br>
&gt; &gt; ---- a/ext/iconv/config.m4<br>
&gt; &gt; -+++ b/ext/iconv/config.m4<br>
&gt; &gt; -@@ -14,7 +14,7 @@ if test &quot;$PHP_ICONV&quot; !=3D &quot;no&q=
uot;; then<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0if test &quot;$iconv_avail&quot; !=3D &quot;no&quot=
;; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if test -z &quot;$ICONV_DIR&quot;; then<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 for i in /usr/local /usr; do<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 for i in $PHP_ICONV /usr/local /usr; do<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f &quot;$i/include/ic=
onv.h&quot; || test -f &quot;$i/include/giconv.h&quot;; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PHP_ICONV_PREFIX=3D&quo=
t;$i&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
&gt; &gt;=C2=A0 =C2=A0--<br>
&gt; &gt; -2.7.4<br>
&gt; &gt; +2.25.1<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch<br>
&gt; &gt; b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch<br>
&gt; &gt; index 21057439c9..5c4fab3e55 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch<=
br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch<=
br>
&gt; &gt; @@ -1,4 +1,7 @@<br>
&gt; &gt; -php-ptest: xfail two tests<br>
&gt; &gt; +From 2b860634886d353fe34a5236642074a6f3106d3d Mon Sep 17 00:00:0=
0<br>
&gt; &gt; +2001<br>
&gt; &gt; +From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" ta=
rget=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 12 Oct 2021 02:11:10 +0000<br>
&gt; &gt; +Subject: [PATCH] php-ptest: xfail two tests<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0If and when these tests are modified to expect the co=
rrect output, they will<br>
&gt; &gt;=C2=A0 =C2=A0succeed and generate warnings in the test summary.=C2=
=A0 This patch can then<br>
&gt; be removed.<br>
&gt; &gt; @@ -9,26 +12,37 @@ Upstream-Status: Pending<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Signed-off-By: Joe Slater &lt;<a href=3D"mailto:joe.s=
later@windriver.com" target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; +update patch to version 8.0.10<br>
&gt; &gt; +Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujits=
u.com" target=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + tests/basic/bug71273.phpt=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; &gt; + tests/run-test/bug75042-3.phpt | 2 ++<br>
&gt; &gt; + 2 files changed, 4 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/tests/basic/bug71273.phpt b/tests/basic/bug71273.ph=
pt<br>
&gt; &gt; +index 7634d432..50451d7b 100644<br>
&gt; &gt;=C2=A0 =C2=A0--- a/tests/basic/bug71273.phpt<br>
&gt; &gt;=C2=A0 =C2=A0+++ b/tests/basic/bug71273.phpt<br>
&gt; &gt; -@@ -16,6 +16,8 @@ Bug #71273 A wrong ext directory setup i<br>
&gt; &gt; -=C2=A0 =C2=A0var_dump(preg_match(&quot;,.+a[\\/].+[\\/]w.php_kar=
toffelbrei.dll.+,s&quot;, $out));<br>
&gt; &gt; +@@ -9,5 +9,7 @@ Bug #71273 A wrong ext directory setup in php.in=
i<br>
&gt; &gt; +leads to crash<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; + var_dump(preg_match(&quot;,.+a[\\/].+[\\/]w.php_kartoffelbrei.d=
ll.+,s&quot;,<br>
&gt; &gt; + $out));<br>
&gt; &gt;=C2=A0 =C2=A0 ?&gt;<br>
&gt; &gt; - =3D=3DDONE=3D=3D<br>
&gt; &gt;=C2=A0 =C2=A0+--XFAIL--<br>
&gt; &gt;=C2=A0 =C2=A0+Output is int(0), not int(1)<br>
&gt; &gt;=C2=A0 =C2=A0 --EXPECT--<br>
&gt; &gt;=C2=A0 =C2=A0 int(1)<br>
&gt; &gt; - =3D=3DDONE=3D=3D<br>
&gt; &gt; +diff --git a/tests/run-test/bug75042-3.phpt<br>
&gt; &gt; +b/tests/run-test/bug75042-3.phpt index 5a30143b..1ca1055a 100644=
<br>
&gt; &gt;=C2=A0 =C2=A0--- a/tests/run-test/bug75042-3.phpt<br>
&gt; &gt;=C2=A0 =C2=A0+++ b/tests/run-test/bug75042-3.phpt -@@ -8,5 +8,8 @@=
<br>
&gt; &gt; display_errors=3D1<br>
&gt; &gt; - nonexistentsharedmodule<br>
&gt; &gt; +@@ -9,5 +9,7 @@ nonexistentsharedmodule<br>
&gt; &gt;=C2=A0 =C2=A0 --FILE--<br>
&gt; &gt;=C2=A0 =C2=A0 &lt;?php<br>
&gt; &gt; -+?&gt;<br>
&gt; &gt; + ?&gt;<br>
&gt; &gt;=C2=A0 =C2=A0+--XFAIL--<br>
&gt; &gt;=C2=A0 =C2=A0+No warning message printed.<br>
&gt; &gt;=C2=A0 =C2=A0 --EXPECTF--<br>
&gt; &gt; - PHP Warning:=C2=A0 PHP Startup: Unable to load dynamic library<=
br>
&gt; &gt; &#39;%snonexistentsharedmodule.%s&#39; %A<br>
&gt; &gt; + Warning: PHP Startup: Unable to load dynamic library<br>
&gt; &gt; +&#39;%snonexistentsharedmodule.%s&#39; %A<br>
&gt; &gt; +--<br>
&gt; &gt; +2.17.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_7=
.4.21.bb" rel=3D"noreferrer" target=3D"_blank">php_7.4.21.bb</a><br>
&gt; &gt; b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.0.11.bb" r=
el=3D"noreferrer" target=3D"_blank">php_8.0.11.bb</a><br>
&gt; &gt; similarity index 98%<br>
&gt; &gt; rename from meta-oe/recipes-devtools/php/<a href=3D"http://php_7.=
4.21.bb" rel=3D"noreferrer" target=3D"_blank">php_7.4.21.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-devtools/php/<a href=3D"http://php_8.0.=
11.bb" rel=3D"noreferrer" target=3D"_blank">php_8.0.11.bb</a><br>
&gt; &gt; index 916010a6ff..a8a2699cdb 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/<a href=3D"http://php_7.4.21.b=
b" rel=3D"noreferrer" target=3D"_blank">php_7.4.21.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.0.11.b=
b" rel=3D"noreferrer" target=3D"_blank">php_8.0.11.bb</a><br>
&gt; &gt; @@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/php-${PV}&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a=
&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;70ed874285e4010c1e2e8937bfb56b13b9ed1b3789dcaf274b793b00c1f4403a=
&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0inherit autotools pkgconfig python3native gettext @@ =
-52,6 +52,7 @@<br>
&gt; &gt; COMMON_EXTRA_OECONF =3D &quot;--enable-sockets \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --disable-rpath \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --with-pic \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D${PHP_LIBDIR} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0--disable-opcache-jit \<br>
&gt; <br>
&gt; why do we need to disable jit ? and what are its effects in terms of<b=
r>
&gt; performance ?<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 =C2=A0EXTRA_OECONF =3D &quot;--enable-mbstring \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0--enable-fpm \<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#93419):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/93419" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/message/93419</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/864=
09155/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/86409155/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000fb78ec05ceac2c8c--


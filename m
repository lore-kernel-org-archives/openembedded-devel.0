Return-Path: <cbing@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C02C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 12:59:06 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.9456.1634648344659612170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com
 header.s=mail header.b=GuAIwYSG;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66,
 mailfrom: btv1==9262691cece==cbing@cybernetics.com)
X-ASG-Debug-ID: 1634648342-0fb3b00bc4260830001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with
 ESMTP id XDlUFz5d7PjdYEFA for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:59:02 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cybernetics.com; s=mail;
	bh=k14L+BtQeOhHD+gqM4QOJBEXJjc1nD1V8uUNpBF/igQ=;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject; b=GuAIwYSGT7epe/cv3B
	wy0zPxai6Ip4roI4ijACwPp4UgaxauPFO5v7zVB9U2G4VocolBYC9Ngd+KlgZhh7kKUM7z2WgJrhg
	/KXfzVfmcI2so6HAlqD+xY6eJC7QLbQv5/m205PcOHqHdDKrMUwdmhZABt6NJEo8KkBrlImm980E=
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11290204 for openembedded-devel@lists.openembedded.org;
 Tue, 19 Oct 2021 08:59:02 -0400
Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
X-Barracuda-RBL-Trusted-Forwarder: 10.157.1.18
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
References: <1634547703-128525-1-git-send-email-wangmy@fujitsu.com>
 <bddff772-119e-fbec-5fe8-648a683c062e@gmail.com>
 <OSBPR01MB184529CE2C98049F1D1179ECDCBD9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CAMKF1sp1FoEcS-vNdYnX86oM5TMoRWgE4apqXaY3rzguksySJg@mail.gmail.com>
 <CAMKF1spyJKUZnhC4OGwQtpJzB+q3RN0rBX2f55EJtz=1v5hVeA@mail.gmail.com>
From: Claude Bing <cbing@cybernetics.com>
Message-ID: <f1a739bd-1ddc-293a-6dd2-e0204b260297@cybernetics.com>
Date: Tue, 19 Oct 2021 08:59:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1spyJKUZnhC4OGwQtpJzB+q3RN0rBX2f55EJtz=1v5hVeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1634648342
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 19546
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 12:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93463

XDebug should just be upgraded to the latest version (we are on 3.0.4)
to reslove those errors.

On 10/19/21 12:33 AM, Khem Raj wrote:
> btw. xdebug will need some patches to work with php 8 see
> https://errors.yoctoproject.org/Errors/Details/613233/
>=20
> On Mon, Oct 18, 2021 at 8:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Mon, Oct 18, 2021 at 7:34 PM wangmy@fujitsu.com <wangmy@fujitsu.com=
> wrote:
>>>
>>>>> COMMON_EXTRA_OECONF =3D "--enable-sockets \
>>>>>                          --disable-rpath \
>>>>>                          --with-pic \
>>>>>                          --libdir=3D${PHP_LIBDIR} \
>>>>> +                       --disable-opcache-jit \
>>>>
>>>> why do we need to disable jit ? and what are its effects in terms of
>>>> performance ?
>>>
>>> If enable opcache-jit, php will build a binary minilua and then execu=
te it immediately. I think it is unsuited to a cross compile environment.
>>
>>
>> Maybe we can build minilua as part of php-native and use it during com=
piling php from native sysroot and other option is to execute it under qe=
mu usermode
>>
>>>
>>>
>>> $ cat tmp/work/i686-ubinux-linux/php/8.0.10-r0/php-8.0.10/ext/opcache=
/jit/Makefile.frag
>>> $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
>>>         $(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
>>>
>>> $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(src=
dir)/jit/dynasm/*.lua $(builddir)/minilua
>>>         $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_F=
LAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc ...
>>>
>>>   --
>>> Best Regards
>>> ---------------------------------------------------
>>> Wang Mingyu
>>> Development Dept.I
>>> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Roa=
d, Nanjing, 210012, China
>>> TEL: +86+25-86630566-8568
>>> COINS: 79988548
>>> FAX: +86+25-83317685
>>> MAIL: wangmy@fujitsu.com
>>> http://www.fujitsu.com/cn/fnst/
>>>
>>>> -----Original Message-----
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>> Sent: Monday, October 18, 2021 9:58 PM
>>>> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
>>>> openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
>>>>
>>>>
>>>>
>>>> On 10/18/21 02:01, wangmy wrote:
>>>>> 23 Sep 2021, PHP 8.0.11
>>>>> - Core:
>>>>>    . Fixed bug #81302 (Stream position after stream filter removed)=
. (cmb)
>>>>>    . Fixed bug #81346 (Non-seekable streams don't update position a=
fter
>>>> write).
>>>>>      (cmb)
>>>>>    . Fixed bug #73122 (Integer Overflow when concatenating strings)=
.
>>>>> (cmb)
>>>>> -GD:
>>>>>    . Fixed bug #53580 (During resize gdImageCopyResampled cause col=
ors
>>>> change).
>>>>>      (cmb)
>>>>> - Opcache:
>>>>>    . Fixed bug #81353 (segfault with preloading and statically boun=
d closure).
>>>>>      (Nikita)
>>>>> - Shmop:
>>>>>    . Fixed bug #81407 (shmop_open won't attach and causes php to
>>>>> crash). (cmb)
>>>>> - Standard:
>>>>>    . Fixed bug #71542 (disk_total_space does not work with relative=
 paths).
>>>> (cmb)
>>>>>    . Fixed bug #81400 (Unterminated string in dns_get_record()
>>>>> results). (cmb)
>>>>> - SysVMsg:
>>>>>    . Fixed bug #78819 (Heap Overflow in msg_send). (cmb)
>>>>> - XML:
>>>>>    . Fixed bug #81351 (xml_parse may fail, but has no error code).
>>>>> (cmb, Nikita)
>>>>> - Zip:
>>>>>    . Fixed bug #80833 (ZipArchive::getStream doesn't use setPasswor=
d).
>>>> (Remi)
>>>>>    . Fixed bug #81420 (ZipArchive::extractTo extracts outside of de=
stination).
>>>>>      (cmb)
>>>>>
>>>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>>>> ---
>>>>>   ...001-opcache-config.m4-enable-opcache.patch | 113
>>>> +++++++++++++++---
>>>>>   .../{70_mod_php7.conf =3D> 70_mod_php8.conf}    |   0
>>>>>   .../php/php/debian-php-fixheader.patch        |   6 +-
>>>>>   meta-oe/recipes-devtools/php/php/iconv.patch  |  26 +---
>>>>>   .../php/php/xfail_two_bug_tests.patch         |  32 +++--
>>>>>   .../php/{php_7.4.21.bb =3D> php_8.0.11.bb}      |   3 +-
>>>>>   6 files changed, 129 insertions(+), 51 deletions(-)
>>>>>   rename meta-oe/recipes-devtools/php/php/{70_mod_php7.conf =3D>
>>>> 70_mod_php8.conf} (100%)
>>>>>   rename meta-oe/recipes-devtools/php/{php_7.4.21.bb =3D> php_8.0.1=
1.bb}
>>>>> (98%)
>>>>>
>>>>> diff --git
>>>>> a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-op=
cac
>>>>> he.patch
>>>>> b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-op=
cac
>>>>> he.patch
>>>>> index 1f3e683a0f..4278b1c61f 100644
>>>>> ---
>>>>> a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-op=
cac
>>>>> he.patch
>>>>> +++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enabl=
e-o
>>>>> +++ pcache.patch
>>>>> @@ -1,6 +1,6 @@
>>>>> -From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:00
>>>>> 2001
>>>>> -From: Claude Bing <cbing@cybernetics.com>
>>>>> -Date: Fri, 8 May 2020 10:15:32 -0400
>>>>> +From c42c7a1498aa9aeebc39d2c84e059d35cf51797a Mon Sep 17 00:00:00
>>>>> +2001
>>>>> +From: Lei Maohui <leimaohui@fujitsu.com>
>>>>> +Date: Tue, 12 Oct 2021 06:17:29 +0000
>>>>>   Subject: [PATCH] opcache/config.m4: enable opcache
>>>>>
>>>>>   We can't use AC_TRY_RUN to run programs in a cross compile
>>>> environment.
>>>>> @@ -13,20 +13,85 @@ Upstream-Status: Inappropriate [Configuration]
>>>>>
>>>>>   Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>>>>
>>>>> -update patch to version 7.4.4
>>>>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>> -
>>>>>   fix issue linking with librt
>>>>>   Signed-off-by: Claude Bing <cbing@cybernetics.com>
>>>>> +
>>>>> +update patch to version 8.0.10
>>>>> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>>>>> +---
>>>>>   ---
>>>>> - ext/opcache/config.m4 | 195
>>>>> +-----------------------------------------
>>>>> - 1 file changed, 4 insertions(+), 191 deletions(-)
>>>>> + ext/opcache/config.m4 | 257
>>>>> + ++----------------------------------------
>>>>> + 1 file changed, 10 insertions(+), 247 deletions(-)
>>>>>
>>>>>   diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4 -index
>>>>> 6c40cafc1c..6569aa9e1c 100644
>>>>> +index 5492fd92..ba55e9c4 100644
>>>>>   --- a/ext/opcache/config.m4
>>>>>   +++ b/ext/opcache/config.m4
>>>>> -@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" !=3D "no"; then
>>>>> +@@ -43,260 +43,27 @@ if test "$PHP_OPCACHE" !=3D "no"; then
>>>>> +     ZEND_JIT_SRC=3D"jit/zend_jit.c jit/zend_jit_vm_helpers.c"
>>>>> +
>>>>> +     dnl Find out which ABI we are using.
>>>>> +-    AC_RUN_IFELSE([AC_LANG_SOURCE([[
>>>>> +-      int main(void) {
>>>>> +-        return sizeof(void*) =3D=3D 4;
>>>>> +-      }
>>>>> +-    ]])],[
>>>>> +-      ac_cv_32bit_build=3Dno
>>>>> +-    ],[
>>>>> +-      ac_cv_32bit_build=3Dyes
>>>>> +-    ],[
>>>>> +-      ac_cv_32bit_build=3Dno
>>>>> ++    PHP_CHECK_LIBRARY(opagent, op_write_native_code,
>>>>> ++    [
>>>>> ++      AC_DEFINE(HAVE_OPROFILE,1,[ ])
>>>>> ++      PHP_ADD_INCLUDE($OPAGENT_DIR/include)
>>>>> ++      PHP_ADD_LIBRARY_WITH_PATH(opagent,
>>>> $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
>>>>> ++      PHP_SUBST(OPCACHE_SHARED_LIBADD)
>>>>> +     ])
>>>>> +-
>>>>> +-    if test "$ac_cv_32bit_build" =3D "no"; then
>>>>> +-      case $host_alias in
>>>>> +-        *x86_64-*-darwin*)
>>>>> +-          DASM_FLAGS=3D"-D X64APPLE=3D1 -D X64=3D1"
>>>>> +-        ;;
>>>>> +-        *x86_64*)
>>>>> +-          DASM_FLAGS=3D"-D X64=3D1"
>>>>> +-        ;;
>>>>> +-      esac
>>>>> +-    fi
>>>>> +-
>>>>> +-    if test "$PHP_THREAD_SAFETY" =3D "yes"; then
>>>>> +-      DASM_FLAGS=3D"$DASM_FLAGS -D ZTS=3D1"
>>>>> +-    fi
>>>>> +-
>>>>> +-    PHP_SUBST(DASM_FLAGS)
>>>>> +-
>>>>> +-    AC_MSG_CHECKING(for opagent in default path)
>>>>> +-    for i in /usr/local /usr; do
>>>>> +-      if test -r $i/include/opagent.h; then
>>>>> +-        OPAGENT_DIR=3D$i
>>>>> +-        AC_MSG_RESULT(found in $i)
>>>>> +-        break
>>>>> +-      fi
>>>>> +-    done
>>>>> +-    if test -z "$OPAGENT_DIR"; then
>>>>> +-      AC_MSG_RESULT(not found)
>>>>> +-    else
>>>>> +-      PHP_CHECK_LIBRARY(opagent, op_write_native_code,
>>>>> +-      [
>>>>> +-        AC_DEFINE(HAVE_OPROFILE,1,[ ])
>>>>> +-        PHP_ADD_INCLUDE($OPAGENT_DIR/include)
>>>>> +-        PHP_ADD_LIBRARY_WITH_PATH(opagent,
>>>> $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
>>>>> +-        PHP_SUBST(OPCACHE_SHARED_LIBADD)
>>>>> +-      ],[
>>>>> +-        AC_MSG_RESULT(not found)
>>>>> +-      ],[
>>>>> +-        -L$OPAGENT_DIR/$PHP_LIBDIR/oprofile
>>>>> +-      ])
>>>>> +-    fi
>>>>> +-
>>>>> +   fi
>>>>> +
>>>>>      AC_CHECK_FUNCS([mprotect])
>>>>>
>>>>>      AC_MSG_CHECKING(for sysvipc shared memory support) @@ -96,8
>>>>> +161,8 @@ index 6c40cafc1c..6569aa9e1c 100644
>>>>>   -}
>>>>>   -]])],[dnl
>>>>>   -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM
>>>> support])
>>>>> --    msg=3Dyes],[msg=3Dno],[msg=3Dno])
>>>>> --  AC_MSG_RESULT([$msg])
>>>>> +-    have_shm_ipc=3Dyes],[have_shm_ipc=3Dno],[have_shm_ipc=3Dno])
>>>>> +-  AC_MSG_RESULT([$have_shm_ipc])
>>>>>   +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM
>>>>> support])
>>>>>
>>>>>      AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory
>>>> support)
>>>>> @@ -116,8 +181,7 @@ index 6c40cafc1c..6569aa9e1c 100644
>>>>>   -#ifndef MAP_FAILED
>>>>>   -# define MAP_FAILED ((void*)-1)
>>>>>   -#endif
>>>>> -+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
>>>>> -+ mmap(MAP_ANON) SHM support])
>>>>> -
>>>>> +-
>>>>>   -int main() {
>>>>>   -  pid_t pid;
>>>>>   -  int status;
>>>>> @@ -150,10 +214,11 @@ index 6c40cafc1c..6569aa9e1c 100644
>>>>>   -}
>>>>>   -]])],[dnl
>>>>>   -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
>>>> mmap(MAP_ANON) SHM support])
>>>>> --    msg=3Dyes],[msg=3Dno],[msg=3Dno])
>>>>> --  AC_MSG_RESULT([$msg])
>>>>> --
>>>>> --  PHP_CHECK_FUNC_LIB(shm_open, rt)
>>>>> +-
>>>> have_shm_mmap_anon=3Dyes],[have_shm_mmap_anon=3Dno],[have_shm_mmap_a
>>>> non=3Dno])
>>>>> +-  AC_MSG_RESULT([$have_shm_mmap_anon])
>>>>> ++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
>>>>> ++ mmap(MAP_ANON) SHM support])
>>>>> +
>>>>> +   PHP_CHECK_FUNC_LIB(shm_open, rt, root)
>>>>>      AC_MSG_CHECKING(for mmap() using shm_open() shared memory
>>>> support)
>>>>>   -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
>>>>>   -#include <sys/types.h>
>>>>> @@ -221,6 +286,7 @@ index 6c40cafc1c..6569aa9e1c 100644
>>>>>   -]])],[dnl
>>>>>   -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX
>>>> mmap() SHM support])
>>>>>   -    AC_MSG_RESULT([yes])
>>>>> +-    have_shm_mmap_posix=3Dyes
>>>>>   -    PHP_CHECK_LIBRARY(rt, shm_unlink,
>>>> [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>>>>>   -  ],[
>>>>>   -    AC_MSG_RESULT([no])
>>>>> @@ -232,6 +298,17 @@ index 6c40cafc1c..6569aa9e1c 100644
>>>>>
>>>>>      PHP_NEW_EXTENSION(opcache,
>>>>>     ZendAccelerator.c \
>>>>> +@@ -339,10 +106,6 @@ int main() {
>>>>> +   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
>>>>> +   PHP_ADD_EXTENSION_DEP(opcache, pcre)
>>>>> +
>>>>> +-  if test "$have_shm_ipc" !=3D "yes" && test "$have_shm_mmap_posi=
x" !=3D
>>>> "yes" && test "$have_shm_mmap_anon" !=3D "yes"; then
>>>>> +-    AC_MSG_ERROR([No supported shared memory caching support was
>>>> found when configuring opcache. Check config.log for any errors or m=
issing
>>>> dependencies.])
>>>>> +-  fi
>>>>> +-
>>>>> +   if test "$PHP_OPCACHE_JIT" =3D "yes"; then
>>>>> +     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
>>>>> +     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
>>>>>   --
>>>>>   2.17.1
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf
>>>>> b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-devtools/php/php/70_mod_php7.conf
>>>>> rename to meta-oe/recipes-devtools/php/php/70_mod_php8.conf
>>>>> diff --git
>>>>> a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>>>>> b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>>>>> index a4804d1849..ed578d5e99 100644
>>>>> --- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>>>>> +++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>>>>> @@ -18,9 +18,9 @@ diff --git a/configure.ac b/configure.ac
>>>>>   index 2a474ba36d..6d22a21630 100644
>>>>>   --- a/configure.ac
>>>>>   +++ b/configure.ac
>>>>> -@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`
>>>>> - fi
>>>>> - AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build
>>>>> date])
>>>>> +@@ -1288,7 +1288,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`
>>>>> +EXTRA_LDFLAGS=3D"$EXTRA_LDFLAGS $PHP_LDFLAGS"
>>>>> + EXTRA_LDFLAGS_PROGRAM=3D"$EXTRA_LDFLAGS_PROGRAM
>>>> $PHP_LDFLAGS"
>>>>>
>>>>>   -UNAME=3D`uname -a | xargs`
>>>>>   +UNAME=3D`uname | xargs`
>>>>> diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch
>>>>> b/meta-oe/recipes-devtools/php/php/iconv.patch
>>>>> index 9ec8a89b57..9b2d85951c 100644
>>>>> --- a/meta-oe/recipes-devtools/php/php/iconv.patch
>>>>> +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
>>>>> @@ -5,16 +5,15 @@ Subject: [PATCH] From
>>>> 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
>>>>>   update patch to version 7.4.4
>>>>>   Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>>   ---
>>>>> - build/php.m4        | 3 ++-
>>>>> - ext/iconv/config.m4 | 2 +-
>>>>> - 2 files changed, 3 insertions(+), 2 deletions(-)
>>>>> + build/php.m4 | 3 ++-
>>>>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>>   diff --git a/build/php.m4 b/build/php.m4 -index 7392876..5c45d13
>>>>> 100644
>>>>> +index 93551d9c..dba50825 100644
>>>>>   --- a/build/php.m4
>>>>>   +++ b/build/php.m4
>>>>> -@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>>>>> -   echo > ext/iconv/php_iconv_supports_errno.h
>>>>> +@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>>>>> +   unset ICONV_DIR
>>>>>
>>>>>      dnl Check libc first if no path is provided in --with-iconv.
>>>>>   -  if test "$PHP_ICONV" =3D "yes"; then @@ -23,19 +22,6 @@ index
>>>>> 7392876..5c45d13 100644
>>>>>        dnl Reset LIBS temporarily as it may have already been inclu=
ded
>>>> -liconv in.
>>>>>        LIBS_save=3D"$LIBS"
>>>>>        LIBS=3D
>>>>> -diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4 -index
>>>>> fe9b47a..b6b632f 100644
>>>>> ---- a/ext/iconv/config.m4
>>>>> -+++ b/ext/iconv/config.m4
>>>>> -@@ -14,7 +14,7 @@ if test "$PHP_ICONV" !=3D "no"; then
>>>>> -
>>>>> -   if test "$iconv_avail" !=3D "no"; then
>>>>> -     if test -z "$ICONV_DIR"; then
>>>>> --      for i in /usr/local /usr; do
>>>>> -+      for i in $PHP_ICONV /usr/local /usr; do
>>>>> -         if test -f "$i/include/iconv.h" || test -f "$i/include/gi=
conv.h"; then
>>>>> -           PHP_ICONV_PREFIX=3D"$i"
>>>>> -           break
>>>>>   --
>>>>> -2.7.4
>>>>> +2.25.1
>>>>>
>>>>> diff --git
>>>>> a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>>>>> b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>>>>> index 21057439c9..5c4fab3e55 100644
>>>>> --- a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>>>>> +++ b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>>>>> @@ -1,4 +1,7 @@
>>>>> -php-ptest: xfail two tests
>>>>> +From 2b860634886d353fe34a5236642074a6f3106d3d Mon Sep 17 00:00:00
>>>>> +2001
>>>>> +From: Lei Maohui <leimaohui@fujitsu.com>
>>>>> +Date: Tue, 12 Oct 2021 02:11:10 +0000
>>>>> +Subject: [PATCH] php-ptest: xfail two tests
>>>>>
>>>>>   If and when these tests are modified to expect the correct output=
, they will
>>>>>   succeed and generate warnings in the test summary.  This patch ca=
n then
>>>> be removed.
>>>>> @@ -9,26 +12,37 @@ Upstream-Status: Pending
>>>>>
>>>>>   Signed-off-By: Joe Slater <joe.slater@windriver.com>
>>>>>
>>>>> +update patch to version 8.0.10
>>>>> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>>>>> +---
>>>>> + tests/basic/bug71273.phpt      | 2 ++
>>>>> + tests/run-test/bug75042-3.phpt | 2 ++
>>>>> + 2 files changed, 4 insertions(+)
>>>>>
>>>>> +diff --git a/tests/basic/bug71273.phpt b/tests/basic/bug71273.phpt
>>>>> +index 7634d432..50451d7b 100644
>>>>>   --- a/tests/basic/bug71273.phpt
>>>>>   +++ b/tests/basic/bug71273.phpt
>>>>> -@@ -16,6 +16,8 @@ Bug #71273 A wrong ext directory setup i
>>>>> -   var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,=
s", $out));
>>>>> +@@ -9,5 +9,7 @@ Bug #71273 A wrong ext directory setup in php.ini
>>>>> +leads to crash
>>>>> +
>>>>> +
>>>>> + var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,s"=
,
>>>>> + $out));
>>>>>    ?>
>>>>> - =3D=3DDONE=3D=3D
>>>>>   +--XFAIL--
>>>>>   +Output is int(0), not int(1)
>>>>>    --EXPECT--
>>>>>    int(1)
>>>>> - =3D=3DDONE=3D=3D
>>>>> +diff --git a/tests/run-test/bug75042-3.phpt
>>>>> +b/tests/run-test/bug75042-3.phpt index 5a30143b..1ca1055a 100644
>>>>>   --- a/tests/run-test/bug75042-3.phpt
>>>>>   +++ b/tests/run-test/bug75042-3.phpt -@@ -8,5 +8,8 @@
>>>>> display_errors=3D1
>>>>> - nonexistentsharedmodule
>>>>> +@@ -9,5 +9,7 @@ nonexistentsharedmodule
>>>>>    --FILE--
>>>>>    <?php
>>>>> -+?>
>>>>> + ?>
>>>>>   +--XFAIL--
>>>>>   +No warning message printed.
>>>>>    --EXPECTF--
>>>>> - PHP Warning:  PHP Startup: Unable to load dynamic library
>>>>> '%snonexistentsharedmodule.%s' %A
>>>>> + Warning: PHP Startup: Unable to load dynamic library
>>>>> +'%snonexistentsharedmodule.%s' %A
>>>>> +--
>>>>> +2.17.1
>>>>> +
>>>>> diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb
>>>>> b/meta-oe/recipes-devtools/php/php_8.0.11.bb
>>>>> similarity index 98%
>>>>> rename from meta-oe/recipes-devtools/php/php_7.4.21.bb
>>>>> rename to meta-oe/recipes-devtools/php/php_8.0.11.bb
>>>>> index 916010a6ff..a8a2699cdb 100644
>>>>> --- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
>>>>> +++ b/meta-oe/recipes-devtools/php/php_8.0.11.bb
>>>>> @@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D " \
>>>>>             "
>>>>>
>>>>>   S =3D "${WORKDIR}/php-${PV}"
>>>>> -SRC_URI[sha256sum] =3D
>>>> "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
>>>>> +SRC_URI[sha256sum] =3D
>>>> "70ed874285e4010c1e2e8937bfb56b13b9ed1b3789dcaf274b793b00c1f4403a"
>>>>>
>>>>>
>>>>>   inherit autotools pkgconfig python3native gettext @@ -52,6 +52,7 =
@@
>>>>> COMMON_EXTRA_OECONF =3D "--enable-sockets \
>>>>>                          --disable-rpath \
>>>>>                          --with-pic \
>>>>>                          --libdir=3D${PHP_LIBDIR} \
>>>>> +                       --disable-opcache-jit \
>>>>
>>>> why do we need to disable jit ? and what are its effects in terms of
>>>> performance ?
>>>>
>>>>>   "
>>>>>   EXTRA_OECONF =3D "--enable-mbstring \
>>>>>                   --enable-fpm \
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#93452): https://lists.openembedded.org/g/openem=
bedded-devel/message/93452
>>>>> Mute This Topic: https://lists.openembedded.org/mt/86409155/4618432
>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [cbing@cybernetics.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>


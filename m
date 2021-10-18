Return-Path: <cbing@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51853C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:26:01 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web09.37069.1634567160272268634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=hTaUZUEh;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66,
 mailfrom: btv1==925a6d318f6==cbing@cybernetics.com)
X-ASG-Debug-ID: 1634567157-0fb3b00bc4256cf0001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with
 ESMTP id UrQzvqwMfX8jNepC for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:25:57 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cybernetics.com; s=mail;
	bh=L4X2xBTo0tbgKHc2y7Rj7owgCUOZKrx1RGVD1DnHrG4=;
	h=Content-Language:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From
	:References:To:Subject; b=hTaUZUEhRMatVkL2gxIHhUbSvlODvcvoijJieGkQ+G9hP4jGLY7
	vrBHToc7xsGvGvJ1uj3AOl1eA151/0+N29zBQPTM26s19l9Mr7e6sXs/0YKJGuf637h8HCosfTN2X
	SOhViezjE0wDvMzo7QLse6WZ9A+fJqzyIBrCRPaDU5s=
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11288187 for openembedded-devel@lists.openembedded.org;
 Mon, 18 Oct 2021 10:25:57 -0400
Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
X-Barracuda-RBL-Trusted-Forwarder: 10.157.1.18
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
References: <1634547703-128525-1-git-send-email-wangmy@fujitsu.com>
 <bddff772-119e-fbec-5fe8-648a683c062e@gmail.com>
From: Claude Bing <cbing@cybernetics.com>
Message-ID: <56309ef9-987c-0091-b653-e265b7c04bcc@cybernetics.com>
Date: Mon, 18 Oct 2021 10:25:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bddff772-119e-fbec-5fe8-648a683c062e@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------D759199C5B13015B64DC8ABC"
Content-Language: en-US
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1634567157
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 16165
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93423

This is a multi-part message in MIME format.
--------------D759199C5B13015B64DC8ABC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We have PHP 8 + JIT working locally, but I do not have time to put
together a patch set right now. Other than cleaning up the existing
patches to work with PHP 8, something like the attached is needed for JIT.

I may be able to put something together later in the week.

On 10/18/21 9:58 AM, Khem Raj wrote:
> 
> 
> On 10/18/21 02:01, wangmy wrote:
>> 23 Sep 2021, PHP 8.0.11
>> - Core:
>>    . Fixed bug #81302 (Stream position after stream filter removed). (cmb)
>>    . Fixed bug #81346 (Non-seekable streams don't update position after write).
>>      (cmb)
>>    . Fixed bug #73122 (Integer Overflow when concatenating strings). (cmb)
>> -GD:
>>    . Fixed bug #53580 (During resize gdImageCopyResampled cause colors change).
>>      (cmb)
>> - Opcache:
>>    . Fixed bug #81353 (segfault with preloading and statically bound closure).
>>      (Nikita)
>> - Shmop:
>>    . Fixed bug #81407 (shmop_open won't attach and causes php to crash). (cmb)
>> - Standard:
>>    . Fixed bug #71542 (disk_total_space does not work with relative paths). (cmb)
>>    . Fixed bug #81400 (Unterminated string in dns_get_record() results). (cmb)
>> - SysVMsg:
>>    . Fixed bug #78819 (Heap Overflow in msg_send). (cmb)
>> - XML:
>>    . Fixed bug #81351 (xml_parse may fail, but has no error code). (cmb, Nikita)
>> - Zip:
>>    . Fixed bug #80833 (ZipArchive::getStream doesn't use setPassword). (Remi)
>>    . Fixed bug #81420 (ZipArchive::extractTo extracts outside of destination).
>>      (cmb)
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>   ...001-opcache-config.m4-enable-opcache.patch | 113 +++++++++++++++---
>>   .../{70_mod_php7.conf => 70_mod_php8.conf}    |   0
>>   .../php/php/debian-php-fixheader.patch        |   6 +-
>>   meta-oe/recipes-devtools/php/php/iconv.patch  |  26 +---
>>   .../php/php/xfail_two_bug_tests.patch         |  32 +++--
>>   .../php/{php_7.4.21.bb => php_8.0.11.bb}      |   3 +-
>>   6 files changed, 129 insertions(+), 51 deletions(-)
>>   rename meta-oe/recipes-devtools/php/php/{70_mod_php7.conf => 70_mod_php8.conf} (100%)
>>   rename meta-oe/recipes-devtools/php/{php_7.4.21.bb => php_8.0.11.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
>> index 1f3e683a0f..4278b1c61f 100644
>> --- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
>> +++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
>> @@ -1,6 +1,6 @@
>> -From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:00 2001
>> -From: Claude Bing <cbing@cybernetics.com>
>> -Date: Fri, 8 May 2020 10:15:32 -0400
>> +From c42c7a1498aa9aeebc39d2c84e059d35cf51797a Mon Sep 17 00:00:00 2001
>> +From: Lei Maohui <leimaohui@fujitsu.com>
>> +Date: Tue, 12 Oct 2021 06:17:29 +0000
>>   Subject: [PATCH] opcache/config.m4: enable opcache
>>   
>>   We can't use AC_TRY_RUN to run programs in a cross compile environment.
>> @@ -13,20 +13,85 @@ Upstream-Status: Inappropriate [Configuration]
>>   
>>   Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>   
>> -update patch to version 7.4.4
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> -
>>   fix issue linking with librt
>>   Signed-off-by: Claude Bing <cbing@cybernetics.com>
>> +
>> +update patch to version 8.0.10
>> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>> +---
>>   ---
>> - ext/opcache/config.m4 | 195 +-----------------------------------------
>> - 1 file changed, 4 insertions(+), 191 deletions(-)
>> + ext/opcache/config.m4 | 257 ++----------------------------------------
>> + 1 file changed, 10 insertions(+), 247 deletions(-)
>>   
>>   diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
>> -index 6c40cafc1c..6569aa9e1c 100644
>> +index 5492fd92..ba55e9c4 100644
>>   --- a/ext/opcache/config.m4
>>   +++ b/ext/opcache/config.m4
>> -@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" != "no"; then
>> +@@ -43,260 +43,27 @@ if test "$PHP_OPCACHE" != "no"; then
>> +     ZEND_JIT_SRC="jit/zend_jit.c jit/zend_jit_vm_helpers.c"
>> +
>> +     dnl Find out which ABI we are using.
>> +-    AC_RUN_IFELSE([AC_LANG_SOURCE([[
>> +-      int main(void) {
>> +-        return sizeof(void*) == 4;
>> +-      }
>> +-    ]])],[
>> +-      ac_cv_32bit_build=no
>> +-    ],[
>> +-      ac_cv_32bit_build=yes
>> +-    ],[
>> +-      ac_cv_32bit_build=no
>> ++    PHP_CHECK_LIBRARY(opagent, op_write_native_code,
>> ++    [
>> ++      AC_DEFINE(HAVE_OPROFILE,1,[ ])
>> ++      PHP_ADD_INCLUDE($OPAGENT_DIR/include)
>> ++      PHP_ADD_LIBRARY_WITH_PATH(opagent, $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
>> ++      PHP_SUBST(OPCACHE_SHARED_LIBADD)
>> +     ])
>> +-
>> +-    if test "$ac_cv_32bit_build" = "no"; then
>> +-      case $host_alias in
>> +-        *x86_64-*-darwin*)
>> +-          DASM_FLAGS="-D X64APPLE=1 -D X64=1"
>> +-        ;;
>> +-        *x86_64*)
>> +-          DASM_FLAGS="-D X64=1"
>> +-        ;;
>> +-      esac
>> +-    fi
>> +-
>> +-    if test "$PHP_THREAD_SAFETY" = "yes"; then
>> +-      DASM_FLAGS="$DASM_FLAGS -D ZTS=1"
>> +-    fi
>> +-
>> +-    PHP_SUBST(DASM_FLAGS)
>> +-
>> +-    AC_MSG_CHECKING(for opagent in default path)
>> +-    for i in /usr/local /usr; do
>> +-      if test -r $i/include/opagent.h; then
>> +-        OPAGENT_DIR=$i
>> +-        AC_MSG_RESULT(found in $i)
>> +-        break
>> +-      fi
>> +-    done
>> +-    if test -z "$OPAGENT_DIR"; then
>> +-      AC_MSG_RESULT(not found)
>> +-    else
>> +-      PHP_CHECK_LIBRARY(opagent, op_write_native_code,
>> +-      [
>> +-        AC_DEFINE(HAVE_OPROFILE,1,[ ])
>> +-        PHP_ADD_INCLUDE($OPAGENT_DIR/include)
>> +-        PHP_ADD_LIBRARY_WITH_PATH(opagent, $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
>> +-        PHP_SUBST(OPCACHE_SHARED_LIBADD)
>> +-      ],[
>> +-        AC_MSG_RESULT(not found)
>> +-      ],[
>> +-        -L$OPAGENT_DIR/$PHP_LIBDIR/oprofile
>> +-      ])
>> +-    fi
>> +-
>> +   fi
>> +
>>      AC_CHECK_FUNCS([mprotect])
>>    
>>      AC_MSG_CHECKING(for sysvipc shared memory support)
>> @@ -96,8 +161,8 @@ index 6c40cafc1c..6569aa9e1c 100644
>>   -}
>>   -]])],[dnl
>>   -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>> --    msg=yes],[msg=no],[msg=no])
>> --  AC_MSG_RESULT([$msg])
>> +-    have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
>> +-  AC_MSG_RESULT([$have_shm_ipc])
>>   +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>>    
>>      AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
>> @@ -116,8 +181,7 @@ index 6c40cafc1c..6569aa9e1c 100644
>>   -#ifndef MAP_FAILED
>>   -# define MAP_FAILED ((void*)-1)
>>   -#endif
>> -+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>> -
>> +-
>>   -int main() {
>>   -  pid_t pid;
>>   -  int status;
>> @@ -150,10 +214,11 @@ index 6c40cafc1c..6569aa9e1c 100644
>>   -}
>>   -]])],[dnl
>>   -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>> --    msg=yes],[msg=no],[msg=no])
>> --  AC_MSG_RESULT([$msg])
>> --
>> --  PHP_CHECK_FUNC_LIB(shm_open, rt)
>> +-    have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[have_shm_mmap_anon=no])
>> +-  AC_MSG_RESULT([$have_shm_mmap_anon])
>> ++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>> +
>> +   PHP_CHECK_FUNC_LIB(shm_open, rt, root)
>>      AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
>>   -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
>>   -#include <sys/types.h>
>> @@ -221,6 +286,7 @@ index 6c40cafc1c..6569aa9e1c 100644
>>   -]])],[dnl
>>   -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>>   -    AC_MSG_RESULT([yes])
>> +-    have_shm_mmap_posix=yes
>>   -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>>   -  ],[
>>   -    AC_MSG_RESULT([no])
>> @@ -232,6 +298,17 @@ index 6c40cafc1c..6569aa9e1c 100644
>>    
>>      PHP_NEW_EXTENSION(opcache,
>>    	ZendAccelerator.c \
>> +@@ -339,10 +106,6 @@ int main() {
>> +   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
>> +   PHP_ADD_EXTENSION_DEP(opcache, pcre)
>> +
>> +-  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then
>> +-    AC_MSG_ERROR([No supported shared memory caching support was found when configuring opcache. Check config.log for any errors or missing dependencies.])
>> +-  fi
>> +-
>> +   if test "$PHP_OPCACHE_JIT" = "yes"; then
>> +     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
>> +     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
>>   --
>>   2.17.1
>>   
>> diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
>> similarity index 100%
>> rename from meta-oe/recipes-devtools/php/php/70_mod_php7.conf
>> rename to meta-oe/recipes-devtools/php/php/70_mod_php8.conf
>> diff --git a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>> index a4804d1849..ed578d5e99 100644
>> --- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>> +++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>> @@ -18,9 +18,9 @@ diff --git a/configure.ac b/configure.ac
>>   index 2a474ba36d..6d22a21630 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>> -@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
>> - fi
>> - AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build date])
>> +@@ -1288,7 +1288,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
>> + EXTRA_LDFLAGS="$EXTRA_LDFLAGS $PHP_LDFLAGS"
>> + EXTRA_LDFLAGS_PROGRAM="$EXTRA_LDFLAGS_PROGRAM $PHP_LDFLAGS"
>>    
>>   -UNAME=`uname -a | xargs`
>>   +UNAME=`uname | xargs`
>> diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recipes-devtools/php/php/iconv.patch
>> index 9ec8a89b57..9b2d85951c 100644
>> --- a/meta-oe/recipes-devtools/php/php/iconv.patch
>> +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
>> @@ -5,16 +5,15 @@ Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
>>   update patch to version 7.4.4
>>   Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>   ---
>> - build/php.m4        | 3 ++-
>> - ext/iconv/config.m4 | 2 +-
>> - 2 files changed, 3 insertions(+), 2 deletions(-)
>> + build/php.m4 | 3 ++-
>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>   
>>   diff --git a/build/php.m4 b/build/php.m4
>> -index 7392876..5c45d13 100644
>> +index 93551d9c..dba50825 100644
>>   --- a/build/php.m4
>>   +++ b/build/php.m4
>> -@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>> -   echo > ext/iconv/php_iconv_supports_errno.h
>> +@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>> +   unset ICONV_DIR
>>    
>>      dnl Check libc first if no path is provided in --with-iconv.
>>   -  if test "$PHP_ICONV" = "yes"; then
>> @@ -23,19 +22,6 @@ index 7392876..5c45d13 100644
>>        dnl Reset LIBS temporarily as it may have already been included -liconv in.
>>        LIBS_save="$LIBS"
>>        LIBS=
>> -diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
>> -index fe9b47a..b6b632f 100644
>> ---- a/ext/iconv/config.m4
>> -+++ b/ext/iconv/config.m4
>> -@@ -14,7 +14,7 @@ if test "$PHP_ICONV" != "no"; then
>> -
>> -   if test "$iconv_avail" != "no"; then
>> -     if test -z "$ICONV_DIR"; then
>> --      for i in /usr/local /usr; do
>> -+      for i in $PHP_ICONV /usr/local /usr; do
>> -         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
>> -           PHP_ICONV_PREFIX="$i"
>> -           break
>>   --
>> -2.7.4
>> +2.25.1
>>   
>> diff --git a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>> index 21057439c9..5c4fab3e55 100644
>> --- a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>> +++ b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>> @@ -1,4 +1,7 @@
>> -php-ptest: xfail two tests
>> +From 2b860634886d353fe34a5236642074a6f3106d3d Mon Sep 17 00:00:00 2001
>> +From: Lei Maohui <leimaohui@fujitsu.com>
>> +Date: Tue, 12 Oct 2021 02:11:10 +0000
>> +Subject: [PATCH] php-ptest: xfail two tests
>>   
>>   If and when these tests are modified to expect the correct output, they will
>>   succeed and generate warnings in the test summary.  This patch can then be removed.
>> @@ -9,26 +12,37 @@ Upstream-Status: Pending
>>   
>>   Signed-off-By: Joe Slater <joe.slater@windriver.com>
>>   
>> +update patch to version 8.0.10
>> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>> +---
>> + tests/basic/bug71273.phpt      | 2 ++
>> + tests/run-test/bug75042-3.phpt | 2 ++
>> + 2 files changed, 4 insertions(+)
>>   
>> +diff --git a/tests/basic/bug71273.phpt b/tests/basic/bug71273.phpt
>> +index 7634d432..50451d7b 100644
>>   --- a/tests/basic/bug71273.phpt
>>   +++ b/tests/basic/bug71273.phpt
>> -@@ -16,6 +16,8 @@ Bug #71273 A wrong ext directory setup i
>> - 	var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,s", $out));
>> +@@ -9,5 +9,7 @@ Bug #71273 A wrong ext directory setup in php.ini leads to crash
>> +
>> +     var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,s", $out));
>>    ?>
>> - ==DONE==
>>   +--XFAIL--
>>   +Output is int(0), not int(1)
>>    --EXPECT--
>>    int(1)
>> - ==DONE==
>> +diff --git a/tests/run-test/bug75042-3.phpt b/tests/run-test/bug75042-3.phpt
>> +index 5a30143b..1ca1055a 100644
>>   --- a/tests/run-test/bug75042-3.phpt
>>   +++ b/tests/run-test/bug75042-3.phpt
>> -@@ -8,5 +8,8 @@ display_errors=1
>> - nonexistentsharedmodule
>> +@@ -9,5 +9,7 @@ nonexistentsharedmodule
>>    --FILE--
>>    <?php
>> -+?>
>> + ?>
>>   +--XFAIL--
>>   +No warning message printed.
>>    --EXPECTF--
>> - PHP Warning:  PHP Startup: Unable to load dynamic library '%snonexistentsharedmodule.%s' %A
>> + Warning: PHP Startup: Unable to load dynamic library '%snonexistentsharedmodule.%s' %A
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb b/meta-oe/recipes-devtools/php/php_8.0.11.bb
>> similarity index 98%
>> rename from meta-oe/recipes-devtools/php/php_7.4.21.bb
>> rename to meta-oe/recipes-devtools/php/php_8.0.11.bb
>> index 916010a6ff..a8a2699cdb 100644
>> --- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
>> +++ b/meta-oe/recipes-devtools/php/php_8.0.11.bb
>> @@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
>>             "
>>   
>>   S = "${WORKDIR}/php-${PV}"
>> -SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
>> +SRC_URI[sha256sum] = "70ed874285e4010c1e2e8937bfb56b13b9ed1b3789dcaf274b793b00c1f4403a"
>>   
>>   
>>   inherit autotools pkgconfig python3native gettext
>> @@ -52,6 +52,7 @@ COMMON_EXTRA_OECONF = "--enable-sockets \
>>                          --disable-rpath \
>>                          --with-pic \
>>                          --libdir=${PHP_LIBDIR} \
>> +                       --disable-opcache-jit \
> 
> why do we need to disable jit ? and what are its effects in terms of 
> performance ?
> 
>>   "
>>   EXTRA_OECONF = "--enable-mbstring \
>>                   --enable-fpm \
>>
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93421): https://lists.openembedded.org/g/openembedded-devel/message/93421
>> Mute This Topic: https://lists.openembedded.org/mt/86409155/4618432
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [cbing@cybernetics.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

--------------D759199C5B13015B64DC8ABC
Content-Type: text/x-patch; charset=UTF-8;
 name="0012-use-minilua-in-sysroot.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0012-use-minilua-in-sysroot.patch"

--- a/ext/opcache/jit/Makefile.frag	2021-07-29 08:53:58.000000000 -0400
+++ b/ext/opcache/jit/Makefile.frag	2021-08-11 17:09:17.361046236 -0400
@@ -1,9 +1,6 @@
 
-$(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
-	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
-
-$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
-	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
+$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua
+	@minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
 
 $(builddir)/jit/zend_jit.lo: \
 	$(builddir)/jit/zend_jit_x86.c \

--------------D759199C5B13015B64DC8ABC--


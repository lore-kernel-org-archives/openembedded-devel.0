Return-Path: <cbing@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B8AC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:59:00 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web08.9908.1637168339563609996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com
 header.s=mail header.b=k1vAhI4R;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66,
 mailfrom: btv1==955c9ece60a==cbing@cybernetics.com)
X-ASG-Debug-ID: 1637168337-0fb3b00bc439dbe0001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with
 ESMTP id G4Tq0o30z7bqguMs for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:58:57 -0500 (EST)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cybernetics.com; s=mail;
	bh=5rndm3KsHAi2Wmt5EI7TJuq9MFHY2PKnZj6fcrcUN0I=;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject; b=k1vAhI4RbTsvFp67Fr
	7DyY/VKNW8iyy01pc/8nlHXEcpNdGRLxY5quNd+XliT7Fzhxf25oYJrL+QRw3lvy/HDJc2oQ/fTKs
	OGLEUaAnw40bWChi/bDEwJLKfLakxtdPf13WkqL4ahWz+0dEGO8PNjPgXp5xyHkgnGCLKvntYjpA=
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11343091 for openembedded-devel@lists.openembedded.org;
 Wed, 17 Nov 2021 11:58:57 -0500
Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
X-Barracuda-RBL-Trusted-Forwarder: 10.157.1.18
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
References: <1634547703-128525-1-git-send-email-wangmy@fujitsu.com>
 <bddff772-119e-fbec-5fe8-648a683c062e@gmail.com>
 <OSBPR01MB184529CE2C98049F1D1179ECDCBD9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CAMKF1sp1FoEcS-vNdYnX86oM5TMoRWgE4apqXaY3rzguksySJg@mail.gmail.com>
 <16AFB09440413719.6466@lists.openembedded.org>
 <OSBPR01MB1845404E434026BE8C00E75DDC879@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Claude Bing <cbing@cybernetics.com>
Message-ID: <cb80f9a3-e70c-381b-99d6-a0dadda3e3dc@cybernetics.com>
Date: Wed, 17 Nov 2021 11:58:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <OSBPR01MB1845404E434026BE8C00E75DDC879@OSBPR01MB1845.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1637168337
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 26008
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 16:59:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94005

Wang,

The master branch has a new commit which may resolve this issue for you.
Can you see if you have any problems compiling PHP with opcache + JIT?


https://github.com/openembedded/meta-openembedded/commit/265bab83c9acbfa9=
7117103dd5c35bbd8a9814d6

On 10/28/21 10:15 PM, wangmy wrote:
> Because we need to use a new version of php, so I want to ask
>=20
> if there are any other comments?
>=20
> If not, can this patch be accepted?
>=20
> =C2=A0
>=20
> =C2=A0 --
>=20
> Best Regards
>=20
> ---------------------------------------------------
>=20
> Wang Mingyu
>=20
> Development Dept.I
>=20
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
>=20
> TEL: +86+25-86630566-8568
>=20
> COINS: 79988548
>=20
> FAX: +86+25-83317685
>=20
> MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>=20
> http://www.fujitsu.com/cn/fnst/ <http://www.fujitsu.com/cn/fnst/>
>=20
> =C2=A0
>=20
> *From:*openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org> *On Behalf Of *wangmy
> *Sent:* Wednesday, October 20, 2021 4:42 PM
> *To:* Khem Raj <raj.khem@gmail.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
>=20
> =C2=A0
>=20
> We try to enable opcache from native sysroot, php can be compiled.
>=20
> But the following problems occured in the x86_64 environment:
>=20
> opcache/jit/zend_jit_x86.dasc:2136:43: error:'znode_op' {aka'union
> _znode_op'} has no member named'zv'
>=20
> =C2=A0
>=20
> After investigation, we know that 32bit support is not perfect enough b=
y
> opcache, please see the following source for details:
>=20
> Zend/zend_compile.h:
>=20
> =C2=A0 52 /* On 64-bit systems less optimal, but more compact VM code l=
eads
> to better
>=20
> =C2=A0 53 * performance. So on 32-bit systems we use absolute addresses=
 for jump
>=20
> =C2=A0 54 * targets and constants, but on 64-bit systems relative 32-bi=
t
> offsets */
>=20
> =C2=A0 55 #if SIZEOF_SIZE_T =3D=3D 4
>=20
> =C2=A0 56 # define ZEND_USE_ABS_JMP_ADDR 1
>=20
> =C2=A0 57 # define ZEND_USE_ABS_CONST_ADDR 1
>=20
> =C2=A0 58 #else
>=20
> =C2=A0 59 # define ZEND_USE_ABS_JMP_ADDR 0
>=20
> =C2=A0 60 # define ZEND_USE_ABS_CONST_ADDR 0
>=20
> =C2=A0 61 #endif
>=20
> =C2=A0 62
>=20
> =C2=A0 63 typedef union _znode_op {
>=20
> .......
>=20
> =C2=A0 72 #endif
>=20
> =C2=A0 73 #if ZEND_USE_ABS_CONST_ADDR
>=20
> =C2=A0 74 zval *zv;
>=20
> =C2=A0 75 #endif
>=20
> =C2=A0 76} znode_op;
>=20
> =C2=A0
>=20
> =C2=A0
>=20
> We suggest to disable opcache temporarily, and then enable it after the
> upstream has better support for 64bit.
>=20
> =C2=A0
>=20
> =C2=A0 --
>=20
> Best Regards
>=20
> ---------------------------------------------------
>=20
> Wang Mingyu
>=20
> Development Dept.I
>=20
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
>=20
> TEL: +86+25-86630566-8568
>=20
> COINS: 79988548
>=20
> FAX: +86+25-83317685
>=20
> MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>=20
> http://www.fujitsu.com/cn/fnst/ <http://www.fujitsu.com/cn/fnst/>
>=20
> =C2=A0
>=20
> *From:*Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> *Sent:* Tuesday, October 19, 2021 11:23 AM
> *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com <mail=
to:wangmy@fujitsu.com>>
> *Cc:* openembedded-devel@lists.openembedded.org
> <mailto:openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
>=20
> =C2=A0
>=20
> =C2=A0
>=20
> =C2=A0
>=20
> On Mon, Oct 18, 2021 at 7:34 PM wangmy@fujitsu.com
> <mailto:wangmy@fujitsu.com> <wangmy@fujitsu.com
> <mailto:wangmy@fujitsu.com>> wrote:
>=20
>     > > COMMON_EXTRA_OECONF =3D "--enable-sockets \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --disable-rpath \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --with-pic \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D${PHP_LIBDIR} \
>     > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0--disable-opcache-jit \
>     >=20
>     > why do we need to disable jit ? and what are its effects in terms=
 of
>     > performance ?
>=20
>     If enable opcache-jit, php will build a binary minilua and then
>     execute it immediately. I think it is unsuited to a cross compile
>     environment.
>=20
> =C2=A0
>=20
> Maybe we can build minilua as part of php-native and use it during
> compiling php from native sysroot and other option is to execute it
> under qemu usermode=C2=A0
>=20
> =C2=A0
>=20
>=20
>=20
>     $ cat
>     tmp/work/i686-ubinux-linux/php/8.0.10-r0/php-8.0.10/ext/opcache/jit=
/Makefile.frag
>     $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(srcdir)/jit/dynasm/minilua.c -l=
m -o $@
>=20
>     $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc
>     $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(builddir)/minilua $(srcdir)/jit/dynas=
m/dynasm.lua=C2=A0
>     $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc ...
>=20
>     =C2=A0 --
>     Best Regards
>     ---------------------------------------------------
>     Wang Mingyu
>     Development Dept.I
>     Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu
>     Road, Nanjing, 210012, China
>     TEL: +86+25-86630566-8568
>     COINS: 79988548
>     FAX: +86+25-83317685
>     MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>     http://www.fujitsu.com/cn/fnst/ <http://www.fujitsu.com/cn/fnst/>
>=20
>     > -----Original Message-----
>     > From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     > Sent: Monday, October 18, 2021 9:58 PM
>     > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C<wangmy@fujitsu.com =
<mailto:wangmy@fujitsu.com>>;
>     > openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     > Subject: Re: [oe] [meta-oe] [PATCH] php: upgrade 7.4.21 -> 8.0.11
>     >=20
>     >=20
>     >=20
>     > On 10/18/21 02:01, wangmy wrote:
>     > > 23 Sep 2021, PHP 8.0.11
>     > > - Core:
>     > >=C2=A0 =C2=A0 . Fixed bug #81302 (Stream position after stream f=
ilter removed). (cmb)
>     > >=C2=A0 =C2=A0 . Fixed bug #81346 (Non-seekable streams don't upd=
ate position after
>     > write).
>     > >=C2=A0 =C2=A0 =C2=A0 (cmb)
>     > >=C2=A0 =C2=A0 . Fixed bug #73122 (Integer Overflow when concaten=
ating strings).
>     > > (cmb)
>     > > -GD:
>     > >=C2=A0 =C2=A0 . Fixed bug #53580 (During resize gdImageCopyResam=
pled cause colors
>     > change).
>     > >=C2=A0 =C2=A0 =C2=A0 (cmb)
>     > > - Opcache:
>     > >=C2=A0 =C2=A0 . Fixed bug #81353 (segfault with preloading and s=
tatically bound closure).
>     > >=C2=A0 =C2=A0 =C2=A0 (Nikita)
>     > > - Shmop:
>     > >=C2=A0 =C2=A0 . Fixed bug #81407 (shmop_open won't attach and ca=
uses php to
>     > > crash). (cmb)
>     > > - Standard:
>     > >=C2=A0 =C2=A0 . Fixed bug #71542 (disk_total_space does not work=
 with relative paths).
>     > (cmb)
>     > >=C2=A0 =C2=A0 . Fixed bug #81400 (Unterminated string in dns_get=
_record()
>     > > results). (cmb)
>     > > - SysVMsg:
>     > >=C2=A0 =C2=A0 . Fixed bug #78819 (Heap Overflow in msg_send). (c=
mb)
>     > > - XML:
>     > >=C2=A0 =C2=A0 . Fixed bug #81351 (xml_parse may fail, but has no=
 error code).
>     > > (cmb, Nikita)
>     > > - Zip:
>     > >=C2=A0 =C2=A0 . Fixed bug #80833 (ZipArchive::getStream doesn't =
use setPassword).
>     > (Remi)
>     > >=C2=A0 =C2=A0 . Fixed bug #81420 (ZipArchive::extractTo extracts=
 outside of destination).
>     > >=C2=A0 =C2=A0 =C2=A0 (cmb)
>     > >
>     > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com <mailto:wangmy@f=
ujitsu.com>>
>     > > ---
>     > >=C2=A0 =C2=A0...001-opcache-config.m4-enable-opcache.patch | 113
>     > +++++++++++++++---
>     > >=C2=A0 =C2=A0.../{70_mod_php7.conf =3D> 70_mod_php8.conf}=C2=A0 =
=C2=A0 |=C2=A0 =C2=A00
>     > >=C2=A0 =C2=A0.../php/php/debian-php-fixheader.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-
>     > >=C2=A0 =C2=A0meta-oe/recipes-devtools/php/php/iconv.patch=C2=A0 =
|=C2=A0 26 +---
>     > >=C2=A0 =C2=A0.../php/php/xfail_two_bug_tests.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 32 +++--
>     > >=C2=A0 =C2=A0.../php/{php_7.4.21.bb <http://php_7.4.21.bb> =3D> =
php_8.0.11.bb
>     <http://php_8.0.11.bb>}=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-
>     > >=C2=A0 =C2=A06 files changed, 129 insertions(+), 51 deletions(-)
>     > >=C2=A0 =C2=A0rename meta-oe/recipes-devtools/php/php/{70_mod_php=
7.conf =3D>
>     > 70_mod_php8.conf} (100%)
>     > >=C2=A0 =C2=A0rename meta-oe/recipes-devtools/php/{php_7.4.21.bb =
<http://php_7.4.21.bb> =3D> php_8.0.11.bb
>     <http://php_8.0.11.bb>}
>     > > (98%)
>     > >
>     > > diff --git
>     > > a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enabl=
e-opcac
>     > > he.patch
>     > > b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enabl=
e-opcac
>     > > he.patch
>     > > index 1f3e683a0f..4278b1c61f 100644
>     > > ---
>     > > a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enabl=
e-opcac
>     > > he.patch
>     > > +++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-e=
nable-o
>     > > +++ pcache.patch
>     > > @@ -1,6 +1,6 @@
>     > > -From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00=
:00
>     > > 2001
>     > > -From: Claude Bing <cbing@cybernetics.com <mailto:cbing@cyberne=
tics.com>>
>     > > -Date: Fri, 8 May 2020 10:15:32 -0400
>     > > +From c42c7a1498aa9aeebc39d2c84e059d35cf51797a Mon Sep 17 00:00=
:00
>     > > +2001
>     > > +From: Lei Maohui <leimaohui@fujitsu.com <mailto:leimaohui@fuji=
tsu.com>>
>     > > +Date: Tue, 12 Oct 2021 06:17:29 +0000
>     > >=C2=A0 =C2=A0Subject: [PATCH] opcache/config.m4: enable opcache
>     > >
>     > >=C2=A0 =C2=A0We can't use AC_TRY_RUN to run programs in a cross =
compile
>     > environment.
>     > > @@ -13,20 +13,85 @@ Upstream-Status: Inappropriate [Configurati=
on]
>     > >
>     > >=C2=A0 =C2=A0Signed-off-by: Anuj Mittal <anuj.mittal@intel.com <=
mailto:anuj.mittal@intel.com>>
>     > >
>     > > -update patch to version 7.4.4
>     > > -Signed-off-by: Changqing Li <changqing.li@windriver.com <mailt=
o:changqing.li@windriver.com>>
>     > > -
>     > >=C2=A0 =C2=A0fix issue linking with librt
>     > >=C2=A0 =C2=A0Signed-off-by: Claude Bing <cbing@cybernetics.com <=
mailto:cbing@cybernetics.com>>
>     > > +
>     > > +update patch to version 8.0.10
>     > > +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com <mailto:leima=
ohui@fujitsu.com>>
>     > > +---
>     > >=C2=A0 =C2=A0---
>     > > - ext/opcache/config.m4 | 195
>     > > +-----------------------------------------
>     > > - 1 file changed, 4 insertions(+), 191 deletions(-)
>     > > + ext/opcache/config.m4 | 257
>     > > + ++----------------------------------------
>     > > + 1 file changed, 10 insertions(+), 247 deletions(-)
>     > >
>     > >=C2=A0 =C2=A0diff --git a/ext/opcache/config.m4 b/ext/opcache/co=
nfig.m4 -index
>     > > 6c40cafc1c..6569aa9e1c 100644
>     > > +index 5492fd92..ba55e9c4 100644
>     > >=C2=A0 =C2=A0--- a/ext/opcache/config.m4
>     > >=C2=A0 =C2=A0+++ b/ext/opcache/config.m4
>     > > -@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" !=3D "no"; then
>     > > +@@ -43,260 +43,27 @@ if test "$PHP_OPCACHE" !=3D "no"; then
>     > > +=C2=A0 =C2=A0 =C2=A0ZEND_JIT_SRC=3D"jit/zend_jit.c jit/zend_ji=
t_vm_helpers.c"
>     > > +
>     > > +=C2=A0 =C2=A0 =C2=A0dnl Find out which ABI we are using.
>     > > +-=C2=A0 =C2=A0 AC_RUN_IFELSE([AC_LANG_SOURCE([[
>     > > +-=C2=A0 =C2=A0 =C2=A0 int main(void) {
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(void*) =3D=3D 4;
>     > > +-=C2=A0 =C2=A0 =C2=A0 }
>     > > +-=C2=A0 =C2=A0 ]])],[
>     > > +-=C2=A0 =C2=A0 =C2=A0 ac_cv_32bit_build=3Dno
>     > > +-=C2=A0 =C2=A0 ],[
>     > > +-=C2=A0 =C2=A0 =C2=A0 ac_cv_32bit_build=3Dyes
>     > > +-=C2=A0 =C2=A0 ],[
>     > > +-=C2=A0 =C2=A0 =C2=A0 ac_cv_32bit_build=3Dno
>     > > ++=C2=A0 =C2=A0 PHP_CHECK_LIBRARY(opagent, op_write_native_code=
,
>     > > ++=C2=A0 =C2=A0 [
>     > > ++=C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_OPROFILE,1,[ ])
>     > > ++=C2=A0 =C2=A0 =C2=A0 PHP_ADD_INCLUDE($OPAGENT_DIR/include)
>     > > ++=C2=A0 =C2=A0 =C2=A0 PHP_ADD_LIBRARY_WITH_PATH(opagent,
>     > $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
>     > > ++=C2=A0 =C2=A0 =C2=A0 PHP_SUBST(OPCACHE_SHARED_LIBADD)
>     > > +=C2=A0 =C2=A0 =C2=A0])
>     > > +-
>     > > +-=C2=A0 =C2=A0 if test "$ac_cv_32bit_build" =3D "no"; then
>     > > +-=C2=A0 =C2=A0 =C2=A0 case $host_alias in
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *x86_64-*-darwin*)
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DASM_FLAGS=3D"-D X64APPLE=3D=
1 -D X64=3D1"
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *x86_64*)
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DASM_FLAGS=3D"-D X64=3D1"
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > > +-=C2=A0 =C2=A0 =C2=A0 esac
>     > > +-=C2=A0 =C2=A0 fi
>     > > +-
>     > > +-=C2=A0 =C2=A0 if test "$PHP_THREAD_SAFETY" =3D "yes"; then
>     > > +-=C2=A0 =C2=A0 =C2=A0 DASM_FLAGS=3D"$DASM_FLAGS -D ZTS=3D1"
>     > > +-=C2=A0 =C2=A0 fi
>     > > +-
>     > > +-=C2=A0 =C2=A0 PHP_SUBST(DASM_FLAGS)
>     > > +-
>     > > +-=C2=A0 =C2=A0 AC_MSG_CHECKING(for opagent in default path)
>     > > +-=C2=A0 =C2=A0 for i in /usr/local /usr; do
>     > > +-=C2=A0 =C2=A0 =C2=A0 if test -r $i/include/opagent.h; then
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPAGENT_DIR=3D$i
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(found in $i)
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break
>     > > +-=C2=A0 =C2=A0 =C2=A0 fi
>     > > +-=C2=A0 =C2=A0 done
>     > > +-=C2=A0 =C2=A0 if test -z "$OPAGENT_DIR"; then
>     > > +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(not found)
>     > > +-=C2=A0 =C2=A0 else
>     > > +-=C2=A0 =C2=A0 =C2=A0 PHP_CHECK_LIBRARY(opagent, op_write_nati=
ve_code,
>     > > +-=C2=A0 =C2=A0 =C2=A0 [
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_OPROFILE,1,[ ])
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_ADD_INCLUDE($OPAGENT_DIR/incl=
ude)
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_ADD_LIBRARY_WITH_PATH(opagent=
,
>     > $OPAGENT_DIR/$PHP_LIBDIR/oprofile, OPCACHE_SHARED_LIBADD)
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_SUBST(OPCACHE_SHARED_LIBADD)
>     > > +-=C2=A0 =C2=A0 =C2=A0 ],[
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(not found)
>     > > +-=C2=A0 =C2=A0 =C2=A0 ],[
>     > > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -L$OPAGENT_DIR/$PHP_LIBDIR/oprofi=
le
>     > > +-=C2=A0 =C2=A0 =C2=A0 ])
>     > > +-=C2=A0 =C2=A0 fi
>     > > +-
>     > > +=C2=A0 =C2=A0fi
>     > > +
>     > >=C2=A0 =C2=A0 =C2=A0 AC_CHECK_FUNCS([mprotect])
>     > >
>     > >=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for sysvipc shared memory s=
upport) @@ -96,8
>     > > +161,8 @@ index 6c40cafc1c..6569aa9e1c 100644
>     > >=C2=A0 =C2=A0-}
>     > >=C2=A0 =C2=A0-]])],[dnl
>     > >=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_DEFINE(HAVE_SHM_IPC, 1, [Define i=
f you have SysV IPC SHM
>     > support])
>     > > --=C2=A0 =C2=A0 msg=3Dyes],[msg=3Dno],[msg=3Dno])
>     > > --=C2=A0 AC_MSG_RESULT([$msg])
>     > > +-=C2=A0 =C2=A0 have_shm_ipc=3Dyes],[have_shm_ipc=3Dno],[have_s=
hm_ipc=3Dno])
>     > > +-=C2=A0 AC_MSG_RESULT([$have_shm_ipc])
>     > >=C2=A0 =C2=A0+=C2=A0 AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you h=
ave SysV IPC SHM
>     > > support])
>     > >
>     > >=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for mmap() using MAP_ANON s=
hared memory
>     > support)
>     > > @@ -116,8 +181,7 @@ index 6c40cafc1c..6569aa9e1c 100644
>     > >=C2=A0 =C2=A0-#ifndef MAP_FAILED
>     > >=C2=A0 =C2=A0-# define MAP_FAILED ((void*)-1)
>     > >=C2=A0 =C2=A0-#endif
>     > > -+=C2=A0 AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
>     > > -+ mmap(MAP_ANON) SHM support])
>     > > -
>     > > +-
>     > >=C2=A0 =C2=A0-int main() {
>     > >=C2=A0 =C2=A0-=C2=A0 pid_t pid;
>     > >=C2=A0 =C2=A0-=C2=A0 int status;
>     > > @@ -150,10 +214,11 @@ index 6c40cafc1c..6569aa9e1c 100644
>     > >=C2=A0 =C2=A0-}
>     > >=C2=A0 =C2=A0-]])],[dnl
>     > >=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [De=
fine if you have
>     > mmap(MAP_ANON) SHM support])
>     > > --=C2=A0 =C2=A0 msg=3Dyes],[msg=3Dno],[msg=3Dno])
>     > > --=C2=A0 AC_MSG_RESULT([$msg])
>     > > --
>     > > --=C2=A0 PHP_CHECK_FUNC_LIB(shm_open, rt)
>     > > +-
>     > have_shm_mmap_anon=3Dyes],[have_shm_mmap_anon=3Dno],[have_shm_mma=
p_a
>     > non=3Dno])
>     > > +-=C2=A0 AC_MSG_RESULT([$have_shm_mmap_anon])
>     > > ++=C2=A0 AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have
>     > > ++ mmap(MAP_ANON) SHM support])
>     > > +
>     > > +=C2=A0 =C2=A0PHP_CHECK_FUNC_LIB(shm_open, rt, root)
>     > >=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for mmap() using shm_open()=
 shared memory
>     > support)
>     > >=C2=A0 =C2=A0-=C2=A0 AC_RUN_IFELSE([AC_LANG_SOURCE([[
>     > >=C2=A0 =C2=A0-#include <sys/types.h>
>     > > @@ -221,6 +286,7 @@ index 6c40cafc1c..6569aa9e1c 100644
>     > >=C2=A0 =C2=A0-]])],[dnl
>     > >=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [D=
efine if you have POSIX
>     > mmap() SHM support])
>     > >=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_MSG_RESULT([yes])
>     > > +-=C2=A0 =C2=A0 have_shm_mmap_posix=3Dyes
>     > >=C2=A0 =C2=A0-=C2=A0 =C2=A0 PHP_CHECK_LIBRARY(rt, shm_unlink,
>     > [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>     > >=C2=A0 =C2=A0-=C2=A0 ],[
>     > >=C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_MSG_RESULT([no])
>     > > @@ -232,6 +298,17 @@ index 6c40cafc1c..6569aa9e1c 100644
>     > >
>     > >=C2=A0 =C2=A0 =C2=A0 PHP_NEW_EXTENSION(opcache,
>     > >=C2=A0 =C2=A0 =C2=A0ZendAccelerator.c \
>     > > +@@ -339,10 +106,6 @@ int main() {
>     > > +=C2=A0 =C2=A0PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
>     > > +=C2=A0 =C2=A0PHP_ADD_EXTENSION_DEP(opcache, pcre)
>     > > +
>     > > +-=C2=A0 if test "$have_shm_ipc" !=3D "yes" && test "$have_shm_=
mmap_posix" !=3D
>     > "yes" && test "$have_shm_mmap_anon" !=3D "yes"; then
>     > > +-=C2=A0 =C2=A0 AC_MSG_ERROR([No supported shared memory cachin=
g support was
>     > found when configuring opcache. Check config.log for any errors o=
r missing
>     > dependencies.])
>     > > +-=C2=A0 fi
>     > > +-
>     > > +=C2=A0 =C2=A0if test "$PHP_OPCACHE_JIT" =3D "yes"; then
>     > > +=C2=A0 =C2=A0 =C2=A0PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
>     > > +=C2=A0 =C2=A0 =C2=A0PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/=
Makefile.frag)
>     > >=C2=A0 =C2=A0--
>     > >=C2=A0 =C2=A02.17.1
>     > >
>     > > diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf
>     > > b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
>     > > similarity index 100%
>     > > rename from meta-oe/recipes-devtools/php/php/70_mod_php7.conf
>     > > rename to meta-oe/recipes-devtools/php/php/70_mod_php8.conf
>     > > diff --git
>     > > a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>     > > b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>     > > index a4804d1849..ed578d5e99 100644
>     > > --- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.pat=
ch
>     > > +++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.pat=
ch
>     > > @@ -18,9 +18,9 @@ diff --git a/configure.ac <http://configure.a=
c> b/configure.ac <http://configure.ac>
>     > >=C2=A0 =C2=A0index 2a474ba36d..6d22a21630 100644
>     > >=C2=A0 =C2=A0--- a/configure.ac <http://configure.ac>
>     > >=C2=A0 =C2=A0+++ b/configure.ac <http://configure.ac>
>     > > -@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`
>     > > - fi
>     > > - AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP buil=
d
>     > > date])
>     > > +@@ -1288,7 +1288,7 @@ PHP_BUILD_DATE=3D`date -u +%Y-%m-%d`
>     > > +EXTRA_LDFLAGS=3D"$EXTRA_LDFLAGS $PHP_LDFLAGS"
>     > > + EXTRA_LDFLAGS_PROGRAM=3D"$EXTRA_LDFLAGS_PROGRAM
>     > $PHP_LDFLAGS"
>     > >
>     > >=C2=A0 =C2=A0-UNAME=3D`uname -a | xargs`
>     > >=C2=A0 =C2=A0+UNAME=3D`uname | xargs`
>     > > diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch
>     > > b/meta-oe/recipes-devtools/php/php/iconv.patch
>     > > index 9ec8a89b57..9b2d85951c 100644
>     > > --- a/meta-oe/recipes-devtools/php/php/iconv.patch
>     > > +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
>     > > @@ -5,16 +5,15 @@ Subject: [PATCH] From
>     > 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
>     > >=C2=A0 =C2=A0update patch to version 7.4.4
>     > >=C2=A0 =C2=A0Signed-off-by: Changqing Li <changqing.li@windriver=
.com <mailto:changqing.li@windriver.com>>
>     > >=C2=A0 =C2=A0---
>     > > - build/php.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-
>     > > - ext/iconv/config.m4 | 2 +-
>     > > - 2 files changed, 3 insertions(+), 2 deletions(-)
>     > > + build/php.m4 | 3 ++-
>     > > + 1 file changed, 2 insertions(+), 1 deletion(-)
>     > >
>     > >=C2=A0 =C2=A0diff --git a/build/php.m4 b/build/php.m4 -index 739=
2876..5c45d13
>     > > 100644
>     > > +index 93551d9c..dba50825 100644
>     > >=C2=A0 =C2=A0--- a/build/php.m4
>     > >=C2=A0 =C2=A0+++ b/build/php.m4
>     > > -@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>     > > -=C2=A0 =C2=A0echo > ext/iconv/php_iconv_supports_errno.h
>     > > +@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>     > > +=C2=A0 =C2=A0unset ICONV_DIR
>     > >
>     > >=C2=A0 =C2=A0 =C2=A0 dnl Check libc first if no path is provided=
 in --with-iconv.
>     > >=C2=A0 =C2=A0-=C2=A0 if test "$PHP_ICONV" =3D "yes"; then @@ -23=
,19 +22,6 @@ index
>     > > 7392876..5c45d13 100644
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Reset LIBS temporarily as it may=
 have already been included
>     > -liconv in.
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS_save=3D"$LIBS"
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D
>     > > -diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4 -index
>     > > fe9b47a..b6b632f 100644
>     > > ---- a/ext/iconv/config.m4
>     > > -+++ b/ext/iconv/config.m4
>     > > -@@ -14,7 +14,7 @@ if test "$PHP_ICONV" !=3D "no"; then
>     > > -
>     > > -=C2=A0 =C2=A0if test "$iconv_avail" !=3D "no"; then
>     > > -=C2=A0 =C2=A0 =C2=A0if test -z "$ICONV_DIR"; then
>     > > --=C2=A0 =C2=A0 =C2=A0 for i in /usr/local /usr; do
>     > > -+=C2=A0 =C2=A0 =C2=A0 for i in $PHP_ICONV /usr/local /usr; do
>     > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f "$i/include/iconv=
.h" || test -f "$i/include/giconv.h"; then
>     > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PHP_ICONV_PREFIX=3D"$=
i"
>     > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break
>     > >=C2=A0 =C2=A0--
>     > > -2.7.4
>     > > +2.25.1
>     > >
>     > > diff --git
>     > > a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>     > > b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
>     > > index 21057439c9..5c4fab3e55 100644
>     > > --- a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patc=
h
>     > > +++ b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patc=
h
>     > > @@ -1,4 +1,7 @@
>     > > -php-ptest: xfail two tests
>     > > +From 2b860634886d353fe34a5236642074a6f3106d3d Mon Sep 17 00:00=
:00
>     > > +2001
>     > > +From: Lei Maohui <leimaohui@fujitsu.com <mailto:leimaohui@fuji=
tsu.com>>
>     > > +Date: Tue, 12 Oct 2021 02:11:10 +0000
>     > > +Subject: [PATCH] php-ptest: xfail two tests
>     > >
>     > >=C2=A0 =C2=A0If and when these tests are modified to expect the =
correct output, they will
>     > >=C2=A0 =C2=A0succeed and generate warnings in the test summary.=C2=
=A0 This patch can then
>     > be removed.
>     > > @@ -9,26 +12,37 @@ Upstream-Status: Pending
>     > >
>     > >=C2=A0 =C2=A0Signed-off-By: Joe Slater <joe.slater@windriver.com=
 <mailto:joe.slater@windriver.com>>
>     > >
>     > > +update patch to version 8.0.10
>     > > +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com <mailto:leima=
ohui@fujitsu.com>>
>     > > +---
>     > > + tests/basic/bug71273.phpt=C2=A0 =C2=A0 =C2=A0 | 2 ++
>     > > + tests/run-test/bug75042-3.phpt | 2 ++
>     > > + 2 files changed, 4 insertions(+)
>     > >
>     > > +diff --git a/tests/basic/bug71273.phpt b/tests/basic/bug71273.=
phpt
>     > > +index 7634d432..50451d7b 100644
>     > >=C2=A0 =C2=A0--- a/tests/basic/bug71273.phpt
>     > >=C2=A0 =C2=A0+++ b/tests/basic/bug71273.phpt
>     > > -@@ -16,6 +16,8 @@ Bug #71273 A wrong ext directory setup i
>     > > -=C2=A0 =C2=A0var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartof=
felbrei.dll.+,s", $out));
>     > > +@@ -9,5 +9,7 @@ Bug #71273 A wrong ext directory setup in php.=
ini
>     > > +leads to crash
>     > > +
>     > > +
>     > > + var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.=
+,s",
>     > > + $out));
>     > >=C2=A0 =C2=A0 ?>
>     > > - =3D=3DDONE=3D=3D
>     > >=C2=A0 =C2=A0+--XFAIL--
>     > >=C2=A0 =C2=A0+Output is int(0), not int(1)
>     > >=C2=A0 =C2=A0 --EXPECT--
>     > >=C2=A0 =C2=A0 int(1)
>     > > - =3D=3DDONE=3D=3D
>     > > +diff --git a/tests/run-test/bug75042-3.phpt
>     > > +b/tests/run-test/bug75042-3.phpt index 5a30143b..1ca1055a 1006=
44
>     > >=C2=A0 =C2=A0--- a/tests/run-test/bug75042-3.phpt
>     > >=C2=A0 =C2=A0+++ b/tests/run-test/bug75042-3.phpt -@@ -8,5 +8,8 =
@@
>     > > display_errors=3D1
>     > > - nonexistentsharedmodule
>     > > +@@ -9,5 +9,7 @@ nonexistentsharedmodule
>     > >=C2=A0 =C2=A0 --FILE--
>     > >=C2=A0 =C2=A0 <?php
>     > > -+?>
>     > > + ?>
>     > >=C2=A0 =C2=A0+--XFAIL--
>     > >=C2=A0 =C2=A0+No warning message printed.
>     > >=C2=A0 =C2=A0 --EXPECTF--
>     > > - PHP Warning:=C2=A0 PHP Startup: Unable to load dynamic librar=
y
>     > > '%snonexistentsharedmodule.%s' %A
>     > > + Warning: PHP Startup: Unable to load dynamic library
>     > > +'%snonexistentsharedmodule.%s' %A
>     > > +--
>     > > +2.17.1
>     > > +
>     > > diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb <http:/=
/php_7.4.21.bb>
>     > > b/meta-oe/recipes-devtools/php/php_8.0.11.bb <http://php_8.0.11=
.bb>
>     > > similarity index 98%
>     > > rename from meta-oe/recipes-devtools/php/php_7.4.21.bb <http://=
php_7.4.21.bb>
>     > > rename to meta-oe/recipes-devtools/php/php_8.0.11.bb <http://ph=
p_8.0.11.bb>
>     > > index 916010a6ff..a8a2699cdb 100644
>     > > --- a/meta-oe/recipes-devtools/php/php_7.4.21.bb <http://php_7.=
4.21.bb>
>     > > +++ b/meta-oe/recipes-devtools/php/php_8.0.11.bb <http://php_8.=
0.11.bb>
>     > > @@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D " \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     > >
>     > >=C2=A0 =C2=A0S =3D "${WORKDIR}/php-${PV}"
>     > > -SRC_URI[sha256sum] =3D
>     > "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a=
"
>     > > +SRC_URI[sha256sum] =3D
>     > "70ed874285e4010c1e2e8937bfb56b13b9ed1b3789dcaf274b793b00c1f4403a=
"
>     > >
>     > >
>     > >=C2=A0 =C2=A0inherit autotools pkgconfig python3native gettext @=
@ -52,6 +52,7 @@
>     > > COMMON_EXTRA_OECONF =3D "--enable-sockets \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --disable-rpath \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --with-pic \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D${PHP_LIBDIR} \
>     > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0--disable-opcache-jit \
>     >=20
>     > why do we need to disable jit ? and what are its effects in terms=
 of
>     > performance ?
>     >=20
>     > >=C2=A0 =C2=A0"
>     > >=C2=A0 =C2=A0EXTRA_OECONF =3D "--enable-mbstring \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0--enable-fpm \
>     > >
>     > >
>     > >
>     > >=20
>     > >
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93642): https://lists.openembedded.org/g/openembedd=
ed-devel/message/93642
> Mute This Topic: https://lists.openembedded.org/mt/86409155/4618432
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[cbing@cybernetics.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


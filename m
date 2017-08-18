Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77AC477DB6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 19:27:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IJQn9t007952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 12:26:50 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Fri, 18 Aug 2017 12:26:49 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, idealsim
	<idealsim@laposte.net>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [php5.6.26]error during build
Thread-Index: AQHTF0Q6MQ16KfmC5U+zHqvVAHTweaKK4qEA//+ebio=
Date: Fri, 18 Aug 2017 19:26:48 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF3E5925@ALA-MBD.corp.ad.wrs.com>
References: <c2b6cee4-59c7-c8f3-ebcb-5946172af1cc@laposte.net>,
	<40e2291e-7b4a-17a2-853a-9b7c257f2a6a@windriver.com>
In-Reply-To: <40e2291e-7b4a-17a2-853a-9b7c257f2a6a@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.118.97]
MIME-Version: 1.0
Subject: Re: [php5.6.26]error during build
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
X-List-Received-Date: Fri, 18 Aug 2017 19:27:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There is a patch on master, 6cd2492, that you can cherry-pick.  It addresse=
s more than just this issue, though.=0A=
=0A=
Joe=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Randy MacLeod [randy.macleod@=
windriver.com]=0A=
Sent: Friday, August 18, 2017 11:15 AM=0A=
To: idealsim; openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [php5.6.26]error during build=0A=
=0A=
On 2017-08-17 06:32 AM, idealsim wrote:=0A=
> Hi try to build an image with php5.6.26 in pyro branch. I have this=0A=
> error during the build :=0A=
>=0A=
> /| ERROR: oe_runmake failed//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):=0A=
> In function `ssl_onceonlyinit'://=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:=0A=
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../=
../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld:=0A=
> TSRM/.libs/TSRM.o: undefined reference to symbol=0A=
> 'pthread_getspecific@@GLIBC_2.4'//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0:=0A=
> error adding symbols: DSO missing from command line//=0A=
> //| collect2: error: ld returned 1 exit status//=0A=
> //| Makefile:270: recipe for target 'sapi/cli/php' failed//=0A=
> //| make: *** [sapi/cli/php] Error 1//=0A=
> //| make: *** Waiting for unfinished jobs....//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):=0A=
> In function `ssl_onceonlyinit'://=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:=0A=
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../=
../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld:=0A=
> TSRM/.libs/TSRM.o: undefined reference to symbol=0A=
> 'pthread_getspecific@@GLIBC_2.4'//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0:=0A=
> error adding symbols: DSO missing from command line//=0A=
> //| collect2: error: ld returned 1 exit status//=0A=
> //| Makefile:306: recipe for target 'sapi/cgi/php-cgi' failed//=0A=
> //| make: *** [sapi/cgi/php-cgi] Error 1//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):=0A=
> In function `ssl_onceonlyinit'://=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:=0A=
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../=
../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld:=0A=
> TSRM/.libs/TSRM.o: undefined reference to symbol=0A=
> 'pthread_getspecific@@GLIBC_2.4'//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0:=0A=
> error adding symbols: DSO missing from command line//=0A=
> //| collect2: error: ld returned 1 exit status//=0A=
> //| Makefile:283: recipe for target 'sapi/fpm/php-fpm' failed//=0A=
> //| make: *** [sapi/fpm/php-fpm] Error 1//=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):=0A=
> In function `ssl_onceonlyinit'://=0A=
> //|=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:=0A=
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//=0A=
> //| WARNING: exit code 1 from a shell command.//=0A=
> //| ERROR: Function failed: do_compile (log file is located at=0A=
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnu=
eabi/php/5.6.26-r0/temp/log.do_compile.15528)//=0A=
>=0A=
> //ERROR: Task=0A=
> (/media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipe=
s-devtools/php/php_5.6.26.bb:do_compile)=0A=
> failed with exit code '1'//=0A=
> //NOTE: Tasks Summary: Attempted 6275 tasks of which 6269 didn't need to=
=0A=
> be rerun and 1 failed.//=0A=
> //=0A=
> //Summary: 1 task failed://=0A=
> ///media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recip=
es-devtools/php/php_5.6.26.bb:do_compile//=0A=
>=0A=
> //Summary: There was 1 WARNING message shown.//=0A=
> //Summary: There were 2 ERROR messages shown, returning a non-zero exit=
=0A=
> code./=0A=
>=0A=
> Do you have an idea to resolve this ?=0A=
=0A=
Hmm, the recipe might just be missing a -lpthread?=0A=
=0A=
For example, see this fix for oe-core's apr recipe:=0A=
=0A=
$ git log -1 --stat ef9dfc361e5e97157d05dfeaf67a3e872648d372=0A=
commit ef9dfc361e5e97157d05dfeaf67a3e872648d372=0A=
Author: Andreas M=FCller <schnitzeltony@googlemail.com>=0A=
Date:   Sat Mar 4 11:24:09 2017 +0100=0A=
=0A=
     apr: fix rss+perf+gold failure on do_compile_ptest_base=0A=
=0A=
     Was detected in Martin's world build=0A=
=0A=
     Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>=0A=
     Signed-off-by: Ross Burton <ross.burton@intel.com>=0A=
=0A=
=0A=
meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to=
-make-gold-.patch=0A=
| 50 ++++++++++++++++++++++++++++++++++++++++++++++++++=0A=
  meta/recipes-support/apr/apr_1.5.2.bb=0A=
                       |  1 +=0A=
  2 files changed, 51 insertions(+)=0A=
=0A=
=0A=
but the bigger question is why bother with php5 rather than=0A=
php7? Clearly few, if any, meta-oe users are using php5 and=0A=
some people have suggested just removing it.=0A=
=0A=
Good luck,=0A=
../Randy=0A=
=0A=
=0A=
>=0A=
> Mickael=0A=
>=0A=
=0A=
=0A=
--=0A=
# Randy MacLeod. SMTS, Linux, Wind River=0A=
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,=0A=
Canada, K2K 2W5=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=


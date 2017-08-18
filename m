Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 638B27833C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:15:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7IIF7UW026043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Aug 2017 11:15:07 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 11:15:06 -0700
To: idealsim <idealsim@laposte.net>,
	<openembedded-devel@lists.openembedded.org>
References: <c2b6cee4-59c7-c8f3-ebcb-5946172af1cc@laposte.net>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <40e2291e-7b4a-17a2-853a-9b7c257f2a6a@windriver.com>
Date: Fri, 18 Aug 2017 14:15:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c2b6cee4-59c7-c8f3-ebcb-5946172af1cc@laposte.net>
X-Originating-IP: [172.25.44.7]
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
X-List-Received-Date: Fri, 18 Aug 2017 18:15:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-08-17 06:32 AM, idealsim wrote:
> Hi try to build an image with php5.6.26 in pyro branch. I have this 
> error during the build :
> 
> /| ERROR: oe_runmake failed//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
> In function `ssl_onceonlyinit'://
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: 
> TSRM/.libs/TSRM.o: undefined reference to symbol 
> 'pthread_getspecific@@GLIBC_2.4'//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0: 
> error adding symbols: DSO missing from command line//
> //| collect2: error: ld returned 1 exit status//
> //| Makefile:270: recipe for target 'sapi/cli/php' failed//
> //| make: *** [sapi/cli/php] Error 1//
> //| make: *** Waiting for unfinished jobs....//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
> In function `ssl_onceonlyinit'://
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: 
> TSRM/.libs/TSRM.o: undefined reference to symbol 
> 'pthread_getspecific@@GLIBC_2.4'//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0: 
> error adding symbols: DSO missing from command line//
> //| collect2: error: ld returned 1 exit status//
> //| Makefile:306: recipe for target 'sapi/cgi/php-cgi' failed//
> //| make: *** [sapi/cgi/php-cgi] Error 1//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
> In function `ssl_onceonlyinit'://
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: 
> TSRM/.libs/TSRM.o: undefined reference to symbol 
> 'pthread_getspecific@@GLIBC_2.4'//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0: 
> error adding symbols: DSO missing from command line//
> //| collect2: error: ld returned 1 exit status//
> //| Makefile:283: recipe for target 'sapi/fpm/php-fpm' failed//
> //| make: *** [sapi/fpm/php-fpm] Error 1//
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
> In function `ssl_onceonlyinit'://
> //| 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
> //| WARNING: exit code 1 from a shell command.//
> //| ERROR: Function failed: do_compile (log file is located at 
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/temp/log.do_compile.15528)// 
> 
> //ERROR: Task 
> (/media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_compile) 
> failed with exit code '1'//
> //NOTE: Tasks Summary: Attempted 6275 tasks of which 6269 didn't need to 
> be rerun and 1 failed.//
> //
> //Summary: 1 task failed://
> ///media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_compile// 
> 
> //Summary: There was 1 WARNING message shown.//
> //Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code./
> 
> Do you have an idea to resolve this ?

Hmm, the recipe might just be missing a -lpthread?

For example, see this fix for oe-core's apr recipe:

$ git log -1 --stat ef9dfc361e5e97157d05dfeaf67a3e872648d372
commit ef9dfc361e5e97157d05dfeaf67a3e872648d372
Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Sat Mar 4 11:24:09 2017 +0100

     apr: fix rss+perf+gold failure on do_compile_ptest_base

     Was detected in Martin's world build

     Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>

 
meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch 
| 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
  meta/recipes-support/apr/apr_1.5.2.bb 
                       |  1 +
  2 files changed, 51 insertions(+)


but the bigger question is why bother with php5 rather than
php7? Clearly few, if any, meta-oe users are using php5 and
some people have suggested just removing it.

Good luck,
../Randy


> 
> Mickael
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


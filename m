Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1Mf4nD-0000fP-2s
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 06:34:59 +0200
Received: by ewy21 with SMTP id 21so1761741ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 21:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=f47yRH90SvJevDDI8rvfJtJwplcNlY0Zfe82Qjw5mcE=;
	b=bcQ/7cr7VKZQE7NYP0QjOHjrGDKexy7jbdWybIJIdIej0m0yVbmVR8IiPsNUSWhTpK
	GNh5vRR1n7ADQQbKXdatjpu97Ilhoyh94y4WWtzS4pbL58u0trcZANl4Ec94rPROlyq9
	ZEMRUDbLQZOTO4PlPO109S5sAWsuEfDSn2dDM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=d1qfMKauHKchePlJ7LSrnvT/bpJlbWnmCXkxRZxuCccOPjLrP0PbTt4Z9HSRcLfiPG
	DuYjFM3HurWA0Qw6xsVMZGFO4geC6i1FUvynb5i7XJYNHj/vi2EhMgLQmJM5rwQr2eBv
	508JJVtEKO0yqlR5nfyplFYOcbAXtyh1Vs6Lc=
Received: by 10.210.41.1 with SMTP id o1mr3224094ebo.10.1251001042320;
	Sat, 22 Aug 2009 21:17:22 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.143.155])
	by mx.google.com with ESMTPS id 5sm7636073eyf.58.2009.08.22.21.17.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 Aug 2009 21:17:21 -0700 (PDT)
Message-ID: <4A90C2F4.1010300@gmail.com>
Date: Sun, 23 Aug 2009 10:17:56 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D4947.5030108@gmail.com>	<200908201526.46349.holger+oe@freyther.de>	<4A8D98FB.5000400@gmail.com>	<200908210343.48652.holger+oe@freyther.de>	<4A8F9BE3.1020606@gmail.com>
	<4A8FA20F.5050401@gmail.com> <20090822231735.GA12848@gmail.com>
In-Reply-To: <20090822231735.GA12848@gmail.com>
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Aug 2009 04:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (22/08/09 13:45), Dmitry Vinokurov wrote:
>   
>> Dmitry Vinokurov wrote:
>>     
>>> Holger Hans Peter Freyther wrote:
>>>       
>>>> On Thursday 20 August 2009 20:42:03 Dmitry Vinokurov wrote:
>>>>
>>>> I will update the documentation with these bits:
>>>>
>>>>
>>>> ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
>>>> ASSUME_PROVIDED += " virtual/libc "
>>>> ASSUME_PROVIDED += "linux-libc-headers "
>>>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc "
>>>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-initial "
>>>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-intermediate "
>>>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}binutils "
>>>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}libc-for-gcc "
>>>> ASSUME_PROVIDED += "virtual/libintl "
>>>> ASSUME_PROVIDED += "virtual/libiconv "
>>>>
>>>> TARGET_PREFIX = "arm-linux-gnueabi-"
>>>> ASSUME_SHLIBS = "libc.so.6:libc"
>>>>
>>>>
>>>> The main difference are. Assume provided more
>>>> binaries/libraries, use the TARGET_PREFIX instead of CC, CXX,
>>>> NM....
>>>>
>>>>
>>>> does this work any better?
>>>>    z.
>>>>
>>>>         
>>> I changed my config according to your advises, final version
>>> attached. Tried to build helloworld application: 'bitbake -v -DDD
>>> helloworld', it compiles and runs on target board fine. Tried to
>>> build linux kernel: 'bitbake -v -DDD linux-2.6.27', it fails with
>>> --------
>>> checking build system type... i686-pc-linux-gnu
>>> checking host system type... i686-pc-linux-gnu
>>> checking target system type... arm-oe-linux-gnueabi
>>> checking for a BSD-compatible install... /home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/install
>>> -c
>>> checking whether build environment is sane... yes
>>> checking for a thread-safe mkdir -p... /home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/mkdir
>>> -p
>>> checking for gawk... gawk
>>> checking whether make sets $(MAKE)... yes
>>> checking for i686-linux-gcc... /opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
>>>
>>> checking for C compiler default output file name... a.out
>>> checking whether the C compiler works... configure: error: cannot
>>> run C compiled programs.
>>> If you meant to cross compile, use `--host'.
>>> See `config.log' for more details.
>>> + oefatal 'oe_runconf failed'
>>> + echo FATAL: 'oe_runconf failed'
>>> FATAL: oe_runconf failed
>>> + exit 1
>>> ERROR: function do_configure failed
>>> ERROR: see log in /home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320
>>>
>>> NOTE: Task failed: /home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320
>>>
>>> ERROR: TaskFailed event exception, aborting
>>> ERROR: Build of /home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb
>>> do_configure failed
>>> ERROR: Task 107 (/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb,
>>> do_configure) failed
>>> NOTE: Tasks Summary: Attempted 86 tasks of which 21 didn't need to
>>> be rerun and 1 failed.
>>> ERROR: '/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb'
>>> failed
>>> --------
>>>
>>> I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE
>>> with git pull, removed tmp/ and made rebuild -- same result.
>>>       
>> Looks like error is in wrong ./configure parameter:
>> --host=i686-linux instead of --host=arm-oe-linux-gnueabi .
>> Now I'm trying to find, why --host was set to i686 and where it can
>> be changed.
>>     
>
> its a cross package so host being i686-linux (I suppose you are building
> on i686 box) is ok. Look into the config.log error message should be in
> there
>
> -Khem
>   
Hm, "configure --help" says "--host=HOST cross-compile to build programs 
to run on HOST [BUILD]" and as I understand, I will run programs on ARM, 
so it should be 'arm-oe-linux-gnueabi'.

Anyway, even if host should be x86, instead of i686-linux-gcc it finds 
arm-vfp-linux-gcc and fails.
Here is config.log:
-----------------------------------------------------------------------------------------------------------
configure:1739: checking build system type
configure:1757: result: i686-pc-linux-gnu
configure:1779: checking host system type
configure:1794: result: i686-pc-linux-gnu
configure:1816: checking target system type
configure:1831: result: arm-oe-linux-gnueabi
configure:1876: checking for a BSD-compatible install
configure:1932: result: 
/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/install -c
configure:1943: checking whether build environment is sane
configure:1986: result: yes
configure:2014: checking for a thread-safe mkdir -p
configure:2053: result: 
/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/mkdir -p
configure:2066: checking for gawk
configure:2082: found /usr/bin/gawk
configure:2093: result: gawk
configure:2104: checking whether make sets $(MAKE)
configure:2125: result: yes
configure:2336: checking for i686-linux-gcc
configure:2363: result: 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
configure:2641: checking for C compiler version
configure:2648: 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc 
--version >&5
arm-vfp-linux-gnu-gcc (crosstool-NG-1.3.1) 4.3.2
Copyright (C) 2008 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:2651: $? = 0
configure:2658: 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc 
-v >&5
Using built-in specs.
Target: arm-vfp-linux-gnu
Configured with: /home/usb10132/ct1/bin/targets/src/gcc-4.3.2/configure 
--build=i386-build_redhat-linux-gnu --host=i386-build_redhat-linux-gnu 
--target=arm-vfp-linux-gnu 
--prefix=/home/usb10132/x-tools/arm-vfp-linux-gnu 
--with-sysroot=/home/usb10132/x-tools/arm-vfp-linux-gnu/arm-vfp-linux-gnu/sys-root 
--enable-languages=c,c++ --disable-multilib --with-arch=armv5te 
--with-abi=atpcs --with-cpu=arm926ej-s --with-fpu=vfp --with-float=soft 
--with-gmp=/home/usb10132/x-tools/arm-vfp-linux-gnu 
--with-mpfr=/home/usb10132/x-tools/arm-vfp-linux-gnu 
--with-pkgversion=crosstool-NG-1.3.1 --enable-__cxa_atexit 
--with-local-prefix=/home/usb10132/x-tools/arm-vfp-linux-gnu/arm-vfp-linux-gnu/sys-root 
--disable-nls --enable-threads=posix --enable-symvers=gnu --enable-c99 
--enable-long-long --enable-target-optspace
Thread model: posix
gcc version 4.3.2 (crosstool-NG-1.3.1)
configure:2661: $? = 0
configure:2668: 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc 
-V >&5
arm-vfp-linux-gnu-gcc: '-V' option must have argument
configure:2671: $? = 1
configure:2694: checking for C compiler default output file name
configure:2721: 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc 
-isystem/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/include 
-O2 -g 
-isystem/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/include 
-L/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/lib 
-Wl,-rpath-link,/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/lib 
-Wl,-rpath,/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/lib 
-Wl,-O1 conftest.c  >&5
configure:2724: $? = 0
configure:2762: result: a.out
configure:2779: checking whether the C compiler works
configure:2789: ./a.out
/home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/module-init-tools-3.2.2/configure: 
line 2790: ./a.out: cannot execute binary file
configure:2792: $? = 126
configure:2801: error: cannot run C compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details.
-----------------------------------------------------------------------------------------------------------

--
Best Regards,
Dmitry Vinokurov



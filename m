Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1Mel8n-0004Sk-CP
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 09:35:57 +0200
Received: by ewy21 with SMTP id 21so1327999ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 00:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type; bh=PpkohyBSV93trzWHUJBOi0+x4JSFXUntQtteZp1YXsE=;
	b=O+5jQHtDbNXaygccxUYpo7mJalwzKAvz20mrT8eoQZ0UEyCUwlfZ/R98afBFF54Y+d
	334Pqw4UwIzOfV0V3DBGC/MDlxmiZBOmkw6MMEQY1/CinqO9YmcIa13btVKCoZAZqfVH
	oOroDW/o1I0WCy5yxtjhtTQ/hTZR6pLWCn+zI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=le+BaA1+QnM0NQf1i+jYuPB81Z8vkR1mYiMqHuzQ+2ldiMZdXTHjfuDaqNCpS8DNjW
	wwZ4WWw+/neGhsaoSCBh2H6PO8HYJmqkxMDzLRHctu2su1er7EugAfBtQj68ouZ8Cmzw
	JviKNIhBsDDq0eHWt6c8pDn58tiL4dYbt8EKQ=
Received: by 10.210.136.17 with SMTP id j17mr2164451ebd.61.1250925506695;
	Sat, 22 Aug 2009 00:18:26 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.141.100])
	by mx.google.com with ESMTPS id 7sm4157607eyg.35.2009.08.22.00.18.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 Aug 2009 00:18:26 -0700 (PDT)
Message-ID: <4A8F9BE3.1020606@gmail.com>
Date: Sat, 22 Aug 2009 13:18:59 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D4947.5030108@gmail.com>	<200908201526.46349.holger+oe@freyther.de>	<4A8D98FB.5000400@gmail.com>
	<200908210343.48652.holger+oe@freyther.de>
In-Reply-To: <200908210343.48652.holger+oe@freyther.de>
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
X-List-Received-Date: Sat, 22 Aug 2009 07:35:57 -0000
Content-Type: multipart/mixed; boundary="------------020109040206090704040402"

--------------020109040206090704040402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 20 August 2009 20:42:03 Dmitry Vinokurov wrote:
>
> I will update the documentation with these bits:
>
>
> ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
> ASSUME_PROVIDED += " virtual/libc "
> ASSUME_PROVIDED += "linux-libc-headers "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-initial "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-intermediate "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}binutils "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}libc-for-gcc "
> ASSUME_PROVIDED += "virtual/libintl "
> ASSUME_PROVIDED += "virtual/libiconv "
>
> TARGET_PREFIX = "arm-linux-gnueabi-"
> ASSUME_SHLIBS = "libc.so.6:libc"
>
>
> The main difference are. Assume provided more binaries/libraries, use the 
> TARGET_PREFIX instead of CC, CXX, NM....
>
>
> does this work any better?
> 	z.
>
>   
I changed my config according to your advises, final version attached. 
Tried to build helloworld application: 'bitbake -v -DDD helloworld', it 
compiles and runs on target board fine. Tried to build linux kernel: 
'bitbake -v -DDD linux-2.6.27', it fails with
--------
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... arm-oe-linux-gnueabi
checking for a BSD-compatible install... 
/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... 
/home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for i686-linux-gcc... 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... configure: error: cannot run C 
compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details.
+ oefatal 'oe_runconf failed'
+ echo FATAL: 'oe_runconf failed'
FATAL: oe_runconf failed
+ exit 1
ERROR: function do_configure failed
ERROR: see log in 
/home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320
NOTE: Task failed: 
/home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb 
do_configure failed
ERROR: Task 107 
(/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, 
do_configure) failed
NOTE: Tasks Summary: Attempted 86 tasks of which 21 didn't need to be 
rerun and 1 failed.
ERROR: 
'/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb' 
failed
--------

I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE with 
git pull, removed tmp/ and made rebuild -- same result.

--
Best Regards,
Dmitry Vinokurov
#
# local.conf
#
# Author: Dmitry Vinokurov <raydan@permlug.org>
#


DL_DIR = "${HOME}/sources"
BBFILES := "${HOME}/work/oe/openembedded/recipes/*/*.bb"
BBMASK = ""
PREFERRED_VERSION_virtual/kernel = "2.6.27"

TARGET_PREFIX = "arm-linux-gnueabi-"
ASSUME_SHLIBS = "libc.so.6:libc"

ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-initial "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-intermediate "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}binutils "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}libc-for-gcc "
ASSUME_PROVIDED += " virtual/libc "
ASSUME_PROVIDED += " linux-libc-headers "
ASSUME_PROVIDED += " virtual/libintl "
ASSUME_PROVIDED += " virtual/libiconv "

MACHINE = "lpc3250"

DISTRO = "minimal"

#CCACHE = "ccache "
CCACHE = " "

TOOLCHAIN_PATH = "/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu"

export CC="${CCACHE}${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-gcc "
export CXX="${CCACHE}${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-g++ "
export CPP="${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-gcc -E "
export LD="${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-ld "
export AR="${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-ar "
export AS="${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-as "
export RANLIB="${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-ranlib "
export STRIP="${TOOLCHAIN_PATH}/../bin/arm-vfp-linux-gnu-strip "

TARGET_CPPFLAGS_append = " -I${TOOLCHAIN_PATH}/include "
TARGET_LDFLAGS_prepend = " -L${TOOLCHAIN_PATH}/lib -Wl,-rpath-link,${TOOLCHAIN_PATH}/lib "


--------------020109040206090704040402--

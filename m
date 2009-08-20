Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1Me7XR-0000D6-MU
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 15:18:45 +0200
Received: by ewy21 with SMTP id 21so5023631ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 06:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type;
	bh=ESILcOwp27CFIje6zwMO7y9yEitZvF/puoxo/Sm4dQI=;
	b=C0VYFqpn9IT0JxjzpXrhjk99bJXIyuCUw5kQN+ItyRjfzEyVJQQ4/j+jLUgr7xIDTS
	gKtLhn9NU9o+bcRFkk72UDprWUsbgnEAAuODtKxu2Lfs7/AxrqanIiQ/hOtTq/h5Aj8f
	7F1xgOVoQrRXf3QrBKFbETPzbZyFmUYUioR2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type;
	b=Xx5UUhjgemPZK/3wIfpzAelh5mGT311lHL08kwl/vXRH5OkEJN1ltd6HyZ9SbvHqQ5
	TpFZw2MxZGeNtEsuyangj+bj9UL2/zNeYpnqDN2S0s44g5TXlgLF9oRKQecPCy26LE7p
	w+oBtvVwhMazEn85B92f7w4oGzxFXX+ZpjeO0=
Received: by 10.210.51.10 with SMTP id y10mr9251237eby.97.1250773286628;
	Thu, 20 Aug 2009 06:01:26 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.146.220])
	by mx.google.com with ESMTPS id 28sm2637801eyg.52.2009.08.20.06.01.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Aug 2009 06:01:26 -0700 (PDT)
Message-ID: <4A8D4947.5030108@gmail.com>
Date: Thu, 20 Aug 2009 19:01:59 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Thu, 20 Aug 2009 13:18:45 -0000
Content-Type: multipart/mixed; boundary="------------090800010806090502010609"

--------------090800010806090502010609
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to build helloworld-image for LPC3250 board and created 
local.conf and lpc3250.conf (files attached) using prebuilt toolchain 
and 'bitbake -v helloworld-image' give following error:
--------
NOTE: Running task 193 of 643 (ID: 636, 
/home/raydan/work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.2.4.bb, 
do_compile)
ERROR: function do_compile failed
ERROR: see log in 
/home/raydan/work/oe/build/tmp/work/arm-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r7.1/temp/log.do_compile.15707
NOTE: Task failed: 
/home/raydan/work/oe/build/tmp/work/arm-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r7.1/temp/log.do_compile.15707
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/raydan/work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.2.4.bb 
do_compile failed
ERROR: Task 636 
(/home/raydan/work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.2.4.bb, 
do_compile) failed
NOTE: Tasks Summary: Attempted 192 tasks of which 186 didn't need to be 
rerun and 1 failed.
ERROR: 
'/home/raydan/work/oe/openembedded/recipes/gcc/gcc-cross-initial_4.2.4.bb' 
failed
--------

Executing 'tail 
tmp/work/arm-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r7.1/temp/log.do_compile.15707' 
give following:
--------
checking target system type... arm-oe-linux-gnueabi
checking for i686-linux-gcc... 
/opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... configure: error: cannot run C 
compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details.
make[1]: *** [configure-fixincludes] Error 1
make[1]: Leaving directory 
`/home/raydan/work/oe/build/tmp/work/arm-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r7.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed
--------

Looks like bitbake use ARM toolchain instead of X86 and of course it 
cannot run ARM targets on my laptop. Could somebody explain, please, how 
this mess with toolchains can be fixed?

By the way, I don't understand why bitbake build gcc-cross-initial when 
I use external toolchain. Maybe I've configured something wrong and OE 
tries to build it's own toolchain, but seems like config is correct 
according to manual.

Thanks in advance.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>

DL_DIR = "${HOME}/sources"
BBFILES := "${HOME}/work/oe/openembedded/recipes/*/*.bb"
BBMASK = ""
PREFERRED_VERSION_virtual/kernel = "2.6.27"

ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
ASSUME_PROVIDED += " virtual/libc "

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

TARGET_ARCH = "arm"
PACKAGE_EXTRA_ARCHS = "armv5te"
TARGET_CC_ARCH = "-fsigned-char -mfpu=vfp -mfloat-abi=softfp"


--------------090800010806090502010609--

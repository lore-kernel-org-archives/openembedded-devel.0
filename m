Received: from mazama.dcclabs.tv ([91.121.153.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pawelo@dcclabs.tv>) id 1RTXu9-0007lh-2c
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:55:49 +0100
Received: from [192.168.4.23] (ip-93.159.54.194.static.crowley.pl
	[93.159.54.194])
	by mazama.dcclabs.tv (Postfix) with ESMTPSA id 9F1E845A32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 12:49:17 +0100 (CET)
Message-ID: <4ECE2EE0.8050708@dcclabs.tv>
Date: Thu, 24 Nov 2011 12:47:44 +0100
From: Pawel Osmialowski <pawelo@dcclabs.tv>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20111101 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ECA1EA0.9080309@dcclabs.tv>
	<CAMKF1sqtTsT-W5SuegBrJS9q9JLEze2rU1R8axSrSkwsq-0_Tw@mail.gmail.com>
In-Reply-To: <CAMKF1sqtTsT-W5SuegBrJS9q9JLEze2rU1R8axSrSkwsq-0_Tw@mail.gmail.com>
Subject: Re: Cannot compile glibc-initial for ARM
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
X-List-Received-Date: Thu, 24 Nov 2011 11:55:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

Thanks for your answer.

Unfortunately, removing TARGET_OS and changing glibc to eglibc did not help:

| running configure fragment for ports/sysdeps/arm/elf
| checking for ARM TLS support... yes
| running configure fragment for nptl/sysdeps/pthread
| configure: error: working compiler support for visibility attribute is 
required
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/pawelo/h3660/openembedded/h3660/../recipes/eglibc/eglibc-initial_2.12.bb 
do_configure failed

What else could be wrong?

Best regards,
Paul


W dniu 24.11.2011 04:03, Khem Raj pisze:
> On Mon, Nov 21, 2011 at 1:49 AM, Pawel Osmialowski<pawelo@dcclabs.tv>  wrote:
>> I'm trying to build Angstrom-derived distro for my handheld with
>> customized set of software. It will be held in few-GB CF card, so I can
>> use full-blown glibc for it.
>>
>> I've prepared following distro configuration file:
>>
>> # file-native version compatible with rpm tools:
>> PREFERRED_VERSION_file-native = "4.18"
>> DISTRO_NAME = "customized"
>> DISTRO_TYPE = "release"
>> DISTRO_VERSION = "0.1"
>> TOOLCHAIN_TYPE = "internal"
>> TOOLCHAIN_BRAND = ""
>> IMAGE_LINGUAS = "en-us"
>> IMAGE_FSTYPE = "tar.gz"
>> IMAGE_FSTYPES = "tar.gz"
>> IMAGE_PKGTYPE = "rpm"
>> IMAGE_PKGTYPES = "rpm"
>> PREFERRED_PKG_FORMAT = "rpm"
>> ANGSTROM_PKG_FORMAT = "rpm"
>> TARGET_OS = "linux"
>                 ^^^^^^
>
> The above setting will make it use OABI which is long outdated in OE
> remove the above line and rebuild
>
>
>> ANGSTROM_FEED_CONFIGS = "angstrom-feed-configs"
>> DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"
>> LIBC = "glibc"
>> FEED_BASEPATH = "feeds/next/${ANGSTROM_PKG_FORMAT}/${LIBC}/"
>> GLIBC_GENERATE_LOCALES = "en_US.UTF-8"
>> ANGSTROMLIBC = "glibc"
> While that might work you better use eglibc since
> thats maintained
>
>> KERNEL = "kernel26"
>> MACHINE_KERNEL_VERSION = "2.6"
>> PCMCIA_MANAGER = "pcmciautils"
>> LINUX_LIBC_HEADERS_VERSION = "2.6.37"
>> PREFERRED_VERSION_linux-libc-headers = "${LINUX_LIBC_HEADERS_VERSION}"
>> PREFERRED_VERSION_linux-libc-headers-native =
>> "${LINUX_LIBC_HEADERS_VERSION}"
>> require conf/distro/include/glibc-internal.inc
>> require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
>> require conf/distro/include/arm-thumb.inc
>> require conf/distro/include/angstrom.inc
>> require conf/distro/include/sane-toolchain.inc
>> DISTRO_CHECK := "${@bb.data.getVar('DISTRO_VERSION',d,1) or
>> bb.fatal('Remove this line or set a dummy DISTRO_VERSION")
>> XSERVER = "xserver-xorg xf86-input-evdev xf86-input-keyboard
>> xf86-input-mouse xf86-video-fbdev"
>> INHERIT += "sanity"
>> INHERIT += "devshell"
>> USE_NLS = "yes"
>> USE_LDCONFIG = "0"
>> FULL_OPTIMIZATION = "-Os"
>> BUILD_OPTIMIZATION = "-Os"
> beaware compiling glibc with Os may not work but eglibc can be compiled
> using -Os
>
>> DISTRO_EXTRA_RDEPENDS += "\
>>     angstrom-version \
>>     ${ANGSTROM_FEED_CONFIGS} \
>>     util-linux-ng-mount util-linux-ng-umount \
>>     angstrom-libc-fixup-hack \
>> "
>>
>> DISTRO_EXTRA_RRECOMMENDS += " \
>>     kernel-module-vfat \
>>     kernel-module-ext2 \
>>     kernel-module-ext3 \
>>     kernel-module-af-packet \
>>     avahi-daemon \
>>     avahi-autoipd \
>>     openssh-sftp-server \
>> "
>>
>> As I see in work directory, following versions of critical packages were
>> picked:
>>
>> binutils-cross-2.21.1a-r14.3
>> busybox-1.18.5-r43.0
>> gcc-cross-4.5-r38.1+svnr170880
>> gcc-cross-initial-4.5-r38.1+svnr170880
>> gcc-cross-intermediate-4.5-r38.1+svnr170880
>> glibc-2.10.1-r37.1
>> glibc-initial-2.10.1-r37.1
>> linux-libc-headers-2.6.37-r0
>>
>> Unfortunately, it stopped at glibc-initial confgure script:
>>
>> | running configure fragment for ports/sysdeps/arm/elf
>> | checking for ARM TLS support... yes
>> | running configure fragment for nptl/sysdeps/pthread
>> | configure: error: working compiler support for visibility attribute is
>> required
>> NOTE: package glibc-initial-2.10.1-r37.1: task do_configure: Failed
>>
>> Looking at config.log file produced by this configure script, I've found
>> that it contains a lot of errors like this (although I doubt this is the
>> reason for the whole problem):
>>
>> conftest.c:9:19: fatal error: stdio.h: No such file or directory
>> compilation terminated.
>>
>> I've checked that stdio.h is not present anywhere in tmp/sysroots (no
>> glibc yet...)
>>
>> the final one:
>>
>> configure:8362: arm-oe-linux-gcc -march=armv4 -mtune=strongarm
>> -mthumb-interwork -mno-thumb
>> --sysroot=/home/pawelo/h3660/openembedded/h3660/tmp/sysroots/arm-oabi-oe-linux
>> -c -g -O2 -I
>> /home/pawelo/h3660/openembedded/h3660/tmp/sysroots/arm-oabi-oe-linux/usr/include
>> conftest.c>&5
>> conftest.c:1:0: warning: target CPU does not support interworking
>> conftest.c:21:19: fatal error: stdio.h: No such file or directory
>> compilation terminated.
>> configure:8369: $? = 1
>> configure: failed program was:
>> | /* confdefs.h.  */
>> ...
>> | }
>> configure:8586: result: 0
>> configure:8618: result: running configure fragment for ports/sysdeps/arm/elf
>> configure:7: checking for ARM TLS support
>> configure:24: arm-oe-linux-gcc -march=armv4 -mtune=strongarm
>> -mthumb-interwork -mno-thumb
>> --sysroot=/home/pawelo/h3660/openembedded/h3660/tmp/sysroots/arm-oabi-oe-linux
>> -c -g -O2 conf
>> test.s 1>&5
>> configure:27: $? = 0
>> configure:35: result: yes
>> configure:8618: result: running configure fragment for nptl/sysdeps/pthread
>> configure:11: error: working compiler support for visibility attribute
>> is required
>>
>> I've tried with eglibc too, unfortunately, with the same result. Can you
>> point me, what am I doing wrong?
>>
>> Best regards,
>> Paul
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




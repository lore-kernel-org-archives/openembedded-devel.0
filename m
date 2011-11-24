Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTPhV-0004kT-KO
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 04:10:14 +0100
Received: by faat2 with SMTP id t2so2498913faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=hM+TVjB2UkuTFRV+68HTQyYrRegJIh6GtE4bwjq5wqw=;
	b=xNdkt5j3jw9OSJcWpc8iESeaIn9uEqgqhXD+/yceVp/UNsAidYDZfEWOMNMTlcl6xf
	lwmulNfj+OEUcK8VprQJO9OgeGWMerQS6GnTOxMWMn9RbCDUxoXZja4Riw6QPe8U/I1q
	/pYD2E+FvhZ0irrXbiaNIZ0bZeP1dLrgDXoxU=
Received: by 10.152.104.236 with SMTP id gh12mr16430516lab.49.1322103821126;
	Wed, 23 Nov 2011 19:03:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 19:03:10 -0800 (PST)
In-Reply-To: <4ECA1EA0.9080309@dcclabs.tv>
References: <4ECA1EA0.9080309@dcclabs.tv>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 19:03:10 -0800
Message-ID: <CAMKF1sqtTsT-W5SuegBrJS9q9JLEze2rU1R8axSrSkwsq-0_Tw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 24 Nov 2011 03:10:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 1:49 AM, Pawel Osmialowski <pawelo@dcclabs.tv> wrot=
e:
> I'm trying to build Angstrom-derived distro for my handheld with
> customized set of software. It will be held in few-GB CF card, so I can
> use full-blown glibc for it.
>
> I've prepared following distro configuration file:
>
> # file-native version compatible with rpm tools:
> PREFERRED_VERSION_file-native =3D "4.18"
> DISTRO_NAME =3D "customized"
> DISTRO_TYPE =3D "release"
> DISTRO_VERSION =3D "0.1"
> TOOLCHAIN_TYPE =3D "internal"
> TOOLCHAIN_BRAND =3D ""
> IMAGE_LINGUAS =3D "en-us"
> IMAGE_FSTYPE =3D "tar.gz"
> IMAGE_FSTYPES =3D "tar.gz"
> IMAGE_PKGTYPE =3D "rpm"
> IMAGE_PKGTYPES =3D "rpm"
> PREFERRED_PKG_FORMAT =3D "rpm"
> ANGSTROM_PKG_FORMAT =3D "rpm"
> TARGET_OS =3D "linux"
               ^^^^^^

The above setting will make it use OABI which is long outdated in OE
remove the above line and rebuild


> ANGSTROM_FEED_CONFIGS =3D "angstrom-feed-configs"
> DISTRO_FEED_CONFIGS =3D "${ANGSTROM_FEED_CONFIGS}"
> LIBC =3D "glibc"
> FEED_BASEPATH =3D "feeds/next/${ANGSTROM_PKG_FORMAT}/${LIBC}/"
> GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8"
> ANGSTROMLIBC =3D "glibc"

While that might work you better use eglibc since
thats maintained

> KERNEL =3D "kernel26"
> MACHINE_KERNEL_VERSION =3D "2.6"
> PCMCIA_MANAGER =3D "pcmciautils"
> LINUX_LIBC_HEADERS_VERSION =3D "2.6.37"
> PREFERRED_VERSION_linux-libc-headers =3D "${LINUX_LIBC_HEADERS_VERSION}"
> PREFERRED_VERSION_linux-libc-headers-native =3D
> "${LINUX_LIBC_HEADERS_VERSION}"
> require conf/distro/include/glibc-internal.inc
> require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> require conf/distro/include/arm-thumb.inc
> require conf/distro/include/angstrom.inc
> require conf/distro/include/sane-toolchain.inc
> DISTRO_CHECK :=3D "${@bb.data.getVar('DISTRO_VERSION',d,1) or
> bb.fatal('Remove this line or set a dummy DISTRO_VERSION")
> XSERVER =3D "xserver-xorg xf86-input-evdev xf86-input-keyboard
> xf86-input-mouse xf86-video-fbdev"
> INHERIT +=3D "sanity"
> INHERIT +=3D "devshell"
> USE_NLS =3D "yes"
> USE_LDCONFIG =3D "0"
> FULL_OPTIMIZATION =3D "-Os"
> BUILD_OPTIMIZATION =3D "-Os"

beaware compiling glibc with Os may not work but eglibc can be compiled
using -Os

>
> DISTRO_EXTRA_RDEPENDS +=3D "\
> =C2=A0 =C2=A0angstrom-version \
> =C2=A0 =C2=A0${ANGSTROM_FEED_CONFIGS} \
> =C2=A0 =C2=A0util-linux-ng-mount util-linux-ng-umount \
> =C2=A0 =C2=A0angstrom-libc-fixup-hack \
> "
>
> DISTRO_EXTRA_RRECOMMENDS +=3D " \
> =C2=A0 =C2=A0kernel-module-vfat \
> =C2=A0 =C2=A0kernel-module-ext2 \
> =C2=A0 =C2=A0kernel-module-ext3 \
> =C2=A0 =C2=A0kernel-module-af-packet \
> =C2=A0 =C2=A0avahi-daemon \
> =C2=A0 =C2=A0avahi-autoipd \
> =C2=A0 =C2=A0openssh-sftp-server \
> "
>
> As I see in work directory, following versions of critical packages were
> picked:
>
> binutils-cross-2.21.1a-r14.3
> busybox-1.18.5-r43.0
> gcc-cross-4.5-r38.1+svnr170880
> gcc-cross-initial-4.5-r38.1+svnr170880
> gcc-cross-intermediate-4.5-r38.1+svnr170880
> glibc-2.10.1-r37.1
> glibc-initial-2.10.1-r37.1
> linux-libc-headers-2.6.37-r0
>
> Unfortunately, it stopped at glibc-initial confgure script:
>
> | running configure fragment for ports/sysdeps/arm/elf
> | checking for ARM TLS support... yes
> | running configure fragment for nptl/sysdeps/pthread
> | configure: error: working compiler support for visibility attribute is
> required
> NOTE: package glibc-initial-2.10.1-r37.1: task do_configure: Failed
>
> Looking at config.log file produced by this configure script, I've found
> that it contains a lot of errors like this (although I doubt this is the
> reason for the whole problem):
>
> conftest.c:9:19: fatal error: stdio.h: No such file or directory
> compilation terminated.
>
> I've checked that stdio.h is not present anywhere in tmp/sysroots (no
> glibc yet...)
>
> the final one:
>
> configure:8362: arm-oe-linux-gcc -march=3Darmv4 -mtune=3Dstrongarm
> -mthumb-interwork -mno-thumb
> --sysroot=3D/home/pawelo/h3660/openembedded/h3660/tmp/sysroots/arm-oabi-o=
e-linux
> -c -g -O2 -I
> /home/pawelo/h3660/openembedded/h3660/tmp/sysroots/arm-oabi-oe-linux/usr/=
include
> conftest.c >&5
> conftest.c:1:0: warning: target CPU does not support interworking
> conftest.c:21:19: fatal error: stdio.h: No such file or directory
> compilation terminated.
> configure:8369: $? =3D 1
> configure: failed program was:
> | /* confdefs.h. =C2=A0*/
> ...
> | }
> configure:8586: result: 0
> configure:8618: result: running configure fragment for ports/sysdeps/arm/=
elf
> configure:7: checking for ARM TLS support
> configure:24: arm-oe-linux-gcc -march=3Darmv4 -mtune=3Dstrongarm
> -mthumb-interwork -mno-thumb
> --sysroot=3D/home/pawelo/h3660/openembedded/h3660/tmp/sysroots/arm-oabi-o=
e-linux
> -c -g -O2 conf
> test.s 1>&5
> configure:27: $? =3D 0
> configure:35: result: yes
> configure:8618: result: running configure fragment for nptl/sysdeps/pthre=
ad
> configure:11: error: working compiler support for visibility attribute
> is required
>
> I've tried with eglibc too, unfortunately, with the same result. Can you
> point me, what am I doing wrong?
>
> Best regards,
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



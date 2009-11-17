Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mturquette@gmail.com>) id 1NAEW1-0002oi-I0
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 04:14:04 +0100
Received: by fxm1 with SMTP id 1so6065063fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 19:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A8VdVDJhjM21jXNjbl87xN7FFusagWcB+py8tPfOP1k=;
	b=tuNKIcoWCkttwyeXoue2SPWtVvwc1BX7e0fRPhcnCuj5wxbLy7zWksOtIo+8n3MNGS
	BtL0PzailS4tQflSRITQWx+6rJ4vfhCX3z0A/JsD3kycQZe8qnlqx6u2Vu19Ka9u6TNX
	sqA6Hl32I8qQM3tnc42V4v8ZYq+WLSxyGZKE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rtmjnpBVQ38zVhG0SPNpN3+1No0HO5yWp2kxa9WuzIfhaZbrynKJHFX06ehHrLAks4
	eV2ci+Lv5QT6NHbwo2LckNZ0tc87EK+8mlZq3Db/IIeVk/yci0h+i9hTrrVEFY7MF5DT
	3Gsk1z/70vsnKnQ2uwO4/0sj19KHvRvVhiiWM=
MIME-Version: 1.0
Received: by 10.216.85.210 with SMTP id u60mr500384wee.226.1258427558194; Mon, 
	16 Nov 2009 19:12:38 -0800 (PST)
In-Reply-To: <4B01D4EA.4050507@mlbassoc.com>
References: <4AFAEDC3.80404@mlbassoc.com>
	<1257971990.4924.37.camel@conroy-linux>
	<4AFB27AD.1010602@mlbassoc.com>
	<1257974982.4924.56.camel@conroy-linux>
	<4AFD67D9.7080608@mlbassoc.com>
	<1258127837.4913.25.camel@conroy-linux>
	<4AFD968E.3050205@mlbassoc.com>
	<1258137696.4913.55.camel@conroy-linux>
	<4AFDE513.3080205@mlbassoc.com> <4B01D4EA.4050507@mlbassoc.com>
Date: Mon, 16 Nov 2009 21:12:38 -0600
Message-ID: <59e7e6f90911161912w5dbd5cd9pf7ac420557c28ba7@mail.gmail.com>
From: Mike Turquette <mturquette@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: mturquette@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Prebuilt toolchains
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
X-List-Received-Date: Tue, 17 Nov 2009 03:14:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2009 at 4:40 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 11/13/2009 04:00 PM, Gary Thomas wrote:
>>
>> On 11/13/2009 11:41 AM, Chris Conroy wrote:
>>>
>>> On Fri, 2009-11-13 at 10:25 -0700, Gary Thomas wrote:
>>>>
>>>> This helped me find the problem - libgcc was required by busybox and
>>>> the default provider for libgcc included gcc-cross.
>>>>
>>>> I ended up with only these [few] changes to get my own toolchain to
>>>> do the job:
>>>>
>>>> #
>>>> # Use prebuilt compiler components
>>>> #
>>>> TOOLCHAIN =3D "external"
>>>> HOST_SYS =3D "${TARGET_ARCH}-${TARGET_OS}"
>>>> TARGET_SYS =3D "${TARGET_ARCH}-${TARGET_OS}"
>>>> ASSUME_PROVIDED +=3D " linux-libc-headers "
>>>> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc "
>>>> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc-cross "
>>>> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc-initial "
>>>> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc-intermediate "
>>>> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}binutils "
>>>> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}libc-for-gcc "
>>>> ASSUME_PROVIDED +=3D " libgcc "
>>>> ASSUME_PROVIDED +=3D " virtual/libc "
>>>> ASSUME_PROVIDED +=3D " virtual/libintl "
>>>> ASSUME_PROVIDED +=3D " virtual/libiconv "
>>>> export TARGET_LDFLAGS =3D "-L${STAGING_DIR_TARGET}${layout_libdir} \
>>>> -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
>>>> -Wl,-O1"
>>>>
>>>> The HOST_SYS and TARGET_SYS changes were necessary because my toolchai=
n
>>>> is called 'powerpc-linux-XXX', not 'powerpc-oe-linux-XXX'.
>>>>
>>>> I chose these changes (instead of just your advice) because I was
>>>> already
>>>> down this path. Sadly, this incantation *did* complete the build, but
>>>> the
>>>> resulting file system did not import any of the "provided" libraries
>>>> from
>>>> my external toolchain. Did I miss something that would let the build
>>>> import these libraries?
>>>
>>> Yeah, this is the problem with ASSUME_PROVIDED as I see it. It removes
>>> the build system knowledge of these things and basically gives the
>>> responsibility for managing them back to you. Not good.
>>>
>>>>
>>>> Finally, in an effort to explore and understand more, I tried your
>>>> method:
>>>> #
>>>> # Use prebuilt compiler components
>>>> #
>>>> TOOLCHAIN =3D "external"
>>>> HOST_SYS =3D "${TARGET_ARCH}-${TARGET_OS}"
>>>> TARGET_SYS =3D "${TARGET_ARCH}-${TARGET_OS}"
>>>> export TARGET_LDFLAGS =3D "-L${STAGING_DIR_TARGET}${layout_libdir} \
>>>> -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
>>>> -Wl,-O1"
>>>> PREFERRED_PROVIDER_linux-libc-headers =3D "external-toolchain"
>>>> PREFERRED_PROVIDER_glibc-thread-db =3D "external-toolchain"
>>>> PREFERRED_PROVIDER_libstdc++-dev =3D "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "external-toolchain=
"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "external-toolchain=
"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D
>>>> "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D
>>>> "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D
>>>> "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/binutils =3D "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D
>>>> "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/libc =3D "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/libintl =3D "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/libiconv =3D "external-toolchain"
>>>>
>>>> Which led to these errors right away:
>>>> ERROR: Conflicting PREFERRED_PROVIDER entries were found which
>>>> resulted in an attempt to select multiple providers
>>>> (['/local/Angstrom_BeagleBoard
>>>> /openembedded/recipes/glibc/glibc_2.6.1.bb',
>>>>
>>>> '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolch=
ain.bb'])
>>>> for runtime dependecy libsegfault
>>>> The entries resulting in this conflict were:
>>>> ['PREFERRED_PROVIDER_virtual/libc =3D glibc',
>>>> 'PREFERRED_PROVIDER_virtual/libintl =3D external-toolchain']
>>>> ERROR: Conflicting PREFERRED_PROVIDER entries were found which
>>>> resulted in an attempt to select multiple providers
>>>>
>>>> (['/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross_4.4.=
2.bb',
>>>>
>>>>
>>>> '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolch=
ain.bb'])
>>>> for runtime dependecy libgcc
>>>> The entries resulting in this conflict were:
>>>> ['PREFERRED_PROVIDER_virtual/powerpc-linux-gcc =3D gcc-cross',
>>>> 'PREFERRED_PROVIDER_virtual/libintl =3D external-toolchain']
>>>>
>>>
>>> You may need to edit the RPROVIDES of your toolchain. Here's what mine
>>> looks like:
>>>
>>> RPROVIDES =3D " glibc-dbg glibc catchsegv sln nscd ldd localedef
>>> glibc-utils glibc-dev glibc-locale libsegfault glibc-extra-nss
>>> glibc-thread-db glibc-pcprofile \
>>> libgcc libgcc-dev libstdc++-dev libstdc++"
>>> PACKAGES_DYNAMIC =3D "glibc-gconv-*"
>>> INHIBIT_DEFAULT_DEPS =3D "1"
>>
>> Still no joy, I'm afraid. I now get a *huge* series of messages like
>> these:
>>
>> NOTE: preferred version 2.11.4.1 of xf86-video-geode not available (for
>> item libsegfault)
>> NOTE: preferred version 1.0.1 of font-screen-cyrillic not available (for
>> item libsegfault)
>> NOTE: preferred version 1.2.4 of opie-securityplugin-dummy not available
>> (for item libsegfault)
>> NOTE: preferred version 6.9.0 of xf86-video-ati not available (for item
>> libsegfault)
>> NOTE: preferred version 12.5.1 of xf86-input-vmmouse not available (for
>> item libsegfault)
>> ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted
>> in an attempt to select multiple providers
>>
>> (['/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross_4.4.2.=
bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxpm_3.5.7.=
bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libice_1.0.4.=
bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxrandr_1.2=
.3.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxfixes_4.0=
.3.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxinerama_1=
.0.3.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/libqpe/libqpe-opie_1.2=
.4.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libx11_1.1.5.=
bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-proto/xproto_7.0.=
13.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxt_1.0.5.b=
b',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxv_1.0.4.b=
b',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxcursor_1.=
1.9.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxrender_0.=
9.4.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-xserver/xserver-x=
org_1.5.3.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross-intermed=
iate_4.4.2.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxext_1.0.4=
.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxi_1.2.0.b=
b',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxmu_1.0.4.=
bb',
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/glibc/glibc_2.6.1.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/binutils/binutils-cros=
s_2.20.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/glibc/glibc-initial_2.=
6.1.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxcomposite=
_0.4.0.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libsm_1.1.0.b=
b',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxft_2.1.13=
.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross-initial_=
4.4.2.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-app/xrandr_1.2.3.=
bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxaw_1.0.4.=
bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxxf86vm_1.=
0.2.bb',
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/qte/qte-mt_2.3.10.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxdamage_1.=
1.1.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/linux-libc-headers/lin=
ux-libc-headers_2.6.23.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/gnome/gconf-dbus_svn.b=
b',
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/avahi/avahi_0.6.24.bb'=
,
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/libgpewidget/libgpewid=
get_0.117.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/libsdl/libsdl-x11_1.2.=
11.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchai=
n.bb',
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/linux/linux_2.6.31.bb'=
,
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/gtk+/gtk+_2.14.2.bb',
>>
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/libusb/libusb_0.1.12.b=
b',
>> '/local/Angstrom_BeagleBoard/openembedded/recipes/db/db3_3.2.9.bb']) for
>> runtime dependecy libsegfault
>> The entries resulting in this conflict were:
>> ['PREFERRED_PROVIDER_virtual/powerpc-linux-gcc =3D gcc-cross',
>> 'PREFERRED_PROVIDER_libxpm =3D libxpm', 'PREFERRED_PROVIDER_libice =3D
>> libice', 'PREFERRED_PROVIDER_libxrandr =3D libxrandr',
>> 'PREFERRED_PROVIDER_libxfixes =3D libxfixes',
>> 'PREFERRED_PROVIDER_libxinerama =3D libxinerama',
>> 'PREFERRED_PROVIDER_virtual/libqpe1 =3D libqpe-opie',
>> 'PREFERRED_PROVIDER_virtual/libx11 =3D libx11', 'PREFERRED_PROVIDER_xpro=
to
>> =3D xproto', 'PREFERRED_PROVIDER_libxt =3D libxt', 'PREFERRED_PROVIDER_l=
ibxv
>> =3D libxv', 'PREFERRED_PROVIDER_libxcursor =3D libxcursor',
>> 'PREFERRED_PROVIDER_libxrender =3D libxrender',
>> 'PREFERRED_PROVIDER_virtual/xserver =3D xserver-xorg',
>> 'PREFERRED_PROVIDER_virtual/powerpc-linux-gcc-intermediate =3D
>> gcc-cross-intermediate', 'PREFERRED_PROVIDER_libxext =3D libxext',
>> 'PREFERRED_PROVIDER_libxi =3D libxi', 'PREFERRED_PROVIDER_libxmu =3D
>> libxmu', 'PREFERRED_PROVIDER_virtual/libc =3D glibc',
>> 'PREFERRED_PROVIDER_virtual/powerpc-linux-binutils =3D binutils-cross',
>> 'PREFERRED_PROVIDER_virtual/powerpc-linux-libc-initial =3D glibc-initial=
',
>> 'PREFERRED_PROVIDER_libxcomposite =3D libxcomposite',
>> 'PREFERRED_PROVIDER_libsm =3D libsm', 'PREFERRED_PROVIDER_libxft =3D
>> libxft', 'PREFERRED_PROVIDER_virtual/powerpc-linux-gcc-initial =3D
>> gcc-cross-initial', 'PREFERRED_PROVIDER_xrandr =3D xrandr',
>> 'PREFERRED_PROVIDER_libxaw =3D libxaw', 'PREFERRED_PROVIDER_libxxf86vm =
=3D
>> libxxf86vm', 'PREFERRED_PROVIDER_virtual/libqte2 =3D qte-mt',
>> 'PREFERRED_PROVIDER_libxdamage =3D libxdamage',
>> 'PREFERRED_PROVIDER_linux-libc-headers =3D linux-libc-headers',
>> 'PREFERRED_PROVIDER_gconf =3D gconf-dbus', 'PREFERRED_PROVIDER_avahi =3D
>> avahi', 'PREFERRED_PROVIDER_libgpewidget =3D libgpewidget',
>> 'PREFERRED_PROVIDER_virtual/libsdl =3D libsdl-x11',
>> 'PREFERRED_PROVIDER_virtual/libintl =3D external-toolchain',
>> 'PREFERRED_PROVIDER_virtual/kernel =3D linux', 'PREFERRED_PROVIDER_gtk+ =
=3D
>> gtk+', 'PREFERRED_PROVIDER_virtual/libusb0 =3D libusb',
>> 'PREFERRED_PROVIDER_virtual/db =3D db3']
>>
>> Why is this so hard?? I just want to use the tools I already
>> have (and my customers are comfortable with)!
>>
>
> Any ideas how I can move forward with this?

Gary,

I haven't (yet) dug into org.oe.dev much myself, but I did extend and
enhance some recipes for building Code Sourcery toolchains in Poky
originally written by the Opened Hand crew.  You won't be able to use
the "POKYMODE" system out of the box, but most of the ideas are there
(relevant PROVIDES, RPROVIDES, etc).  You might draw some inspiration
from,
http://git.pokylinux.org/cgit.cgi/poky/tree/meta/packages/meta/external-csl=
-toolchain_2008q3-72.bb
and
http://git.pokylinux.org/cgit.cgi/poky/tree/meta/conf/distro/include/poky-e=
xternal-csl2008q3.inc

Hope you find it helpful,
Mike


> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



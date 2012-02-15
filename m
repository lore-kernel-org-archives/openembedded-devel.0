Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anton.komarov@gmail.com>) id 1RxXmR-0004VP-Qw
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 06:51:51 +0100
Received: by wibhq7 with SMTP id hq7so296476wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 21:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YSXaQkzlR3MBOtu9DmiZj/ERDV6zk/ATmMCoAnC8+UQ=;
	b=adYWR04H9m47NvbRqWyeuNId5XfFlEUd44usJRFb0dF4fw/KVVo1se17R0uYC3ibSG
	vu6kHQyxGh8WP+uuhvUkB7164JrNUdaLNCYXYa1A/wONa/Zs0XbNt5VhNuCEKhzFg4Rg
	REgM+clEUpJrvVPGQ2Zg394u/OaMw58/8V734=
Received: by 10.180.24.202 with SMTP id w10mr33250767wif.9.1329284620253; Tue,
	14 Feb 2012 21:43:40 -0800 (PST)
MIME-Version: 1.0
Sender: anton.komarov@gmail.com
Received: by 10.216.18.205 with HTTP; Tue, 14 Feb 2012 21:43:20 -0800 (PST)
In-Reply-To: <20120214223703.GA3914@jama.jama.net>
References: <CAHKdsmR9A4UMA4Q2cwvnvg6WxnQjO13mydJ-u2D=qxPxFYACQw@mail.gmail.com>
	<20120214205955.GA6732@jama.jama.net>
	<CAHKdsmTjaSAqt7a0+K7J5xkV-toHrJ4yi2YMCF3yQjs3XRw32g@mail.gmail.com>
	<20120214223703.GA3914@jama.jama.net>
From: Anton Komarov <akomarov@nvisiongroup.ru>
Date: Wed, 15 Feb 2012 09:43:20 +0400
X-Google-Sender-Auth: k1Ss0h3j4GXBJnwYwdxLN2oKZbA
Message-ID: <CAHKdsmRDPBgaqVjEVkP4vmFOV=3JpGdxELMXD0ebqDYQeYX_Aw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Recipe for libmp3splt failed to make packages
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
X-List-Received-Date: Wed, 15 Feb 2012 05:51:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Martin great thanks again, ok all warnings about packages has gone.

Also i have removed pkgconfig and in do_compile has only 2 lines about
unsafe cross-compilation

/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-li=
nux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueab=
i/4.5.4/ld:
warning: library search path "/lib" is unsafe for cross-compilation
/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-li=
nux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueab=
i/4.5.4/ld:
warning: library search path "/lib" is unsafe for cross-compilation

Actually i have not much experience with autotools so cannot
understand from what configuration does it take /lb search path? If
you have smth to say i would definetly appreciate it. Thanks again!

On Wed, Feb 15, 2012 at 2:37 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Feb 15, 2012 at 01:54:55AM +0400, Anton Komarov wrote:
>> Martin, thanks for fast responce.
>>
>> So i got the idea about namings and packages.
>>
>> Well i have tweaked recipe now it looks like
>>
>> DESCRIPTION =3D "Mp3splt-project is a utility to split mp3 and ogg files
>> selecting a begin and an end time position, without decoding."
>> HOMEPAGE =3D "http://mp3splt.sourceforge.net/mp3splt_page/about.php"
>> BUGTRACKER =3D "http://sourceforge.net/tracker/?atid=3D476061&group_id=
=3D55130&func=3Dbrowse"
>> SECTION =3D "libs"
>> LICENSE =3D "GPLv2"
>>
>> DEPENDS=3D"libmad"
>>
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D678a5e287e539ce6c24384c512373=
a53"
>>
>> PR =3D "r43"
>>
>> SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"
>>
>> SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
>> SRC_URI[sha256sum] =3D
>> "7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"
>>
>> inherit autotools pkgconfig gettext
>>
>> EXTRA_OECONF =3D "--libdir=3D${STAGING_LIBDIR} \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --includedir=3D${STAGING_INCDIR} \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --oldincludedir=3D${STAGING_INCDIR} \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --datadir=3D${STAGING_DATADIR}"
>
> Why did you add those 4 lines? this is all wrong..
>
>> PACKAGES =3D+ "libsplt-mp3 libsplt-ogg libsplt-mp3-dev libsplt-ogg-dev
>> libsplt-mp3-staticdev libsplt-ogg-staticdev"
>> FILES_${PN}=3D"${libdir}/libmp3splt.so.*"
>> FILES_${PN}-dev =3D+ "${includedir}/libmp3splt/mp3splt.h
>> ${libdir}/libmp3splt.so ${libdir}/libmp3splt.la"
>> FILES_${PN}-staticdev =3D+ "${libdir}/libmp3splt.a"
>> FILES_libsplt-mp3=3D"${libdir}/libmp3splt/libsplt_mp3.so.*"
>> FILES_libsplt-ogg=3D"${libdir}/libmp3splt/libsplt_ogg.so.*"
>> FILES_libsplt-mp3-dev=3D"${libdir}/libmp3splt/libsplt_mp3.so
>> ${libdir}/libmp3splt/libsplt_mp3.la"
>> FILES_libsplt-ogg-dev=3D"${libdir}/libmp3splt/libsplt_ogg.so
>> ${libdir}/libmp3splt/libsplt_ogg.la"
>> FILES_libsplt-mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
>> FILES_libsplt-ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"
>>
>> but i got tons of warnings and still have warning about host libs and in=
cludes
>>
>> WARNING: For recipe libmp3splt, the following files/directories were
>> installed but not shipped in any package:
>> WARNING: =A0 /stuff
>> WARNING: =A0 /stuff/work
>> WARNING: =A0 /stuff/work/setup-scripts
>> WARNING: =A0 /stuff/work/setup-scripts/build
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/share
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/share/aclocal
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/share/aclocal/mp3splt.m4
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt.a
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt.so
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt.so.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt.so.0.0.5
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt.la
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/.debug
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/.debug/libmp3splt.so
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/.debug/libmp3splt.so.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/.debug/libmp3splt.so.0.0.5
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so.0.0.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so.0.0.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.a
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.a
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.la
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.la
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so.0.0.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so.0.0.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so.0
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so
>> WARNING: =A0 /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
sysroots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so.0
>> WARNING: libmp3splt: The compile log indicates that host include
>> and/or library paths were used. =A0Please check the log
>> '/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-=
angstrom-linux-gnueabi/libmp3splt-0.5.6-r43/temp/log.do_compile'
>> for more information.
>>
>> do_compile log looks like - http://pastebin.com/jWntsdj5
>
> If you grep for "unsafe" you'll find parts like:
> arm-angstrom-linux-gnueabi-libtool: compile: =A0ccache
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -fno-tree-vectorize
> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
> --sysroot=3D/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/beagleboard
> -DHAVE_CONFIG_H -I. -I.. -I/usr/include -I/usr/include -I/usr/include
> -I/usr/include -Wall -O2 -pipe -g -feliminate-unused-debug-types
> -I../include/libmp3splt -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -c
> ogg.c =A0-fPIC -DPIC -o .libs/ogg.o
> cc1: warning: include location "/usr/include" is unsafe for
> cross-compilation
>
> -I/usr/include is bad, -I/usr/include 4 times is super bad (even with
> the same results) check autotools from where it was added, pkgconfig
> usually works but ie calling some -config scripts could be more tricky
> (especially if it's not build yet in your sysroot).
>
> Regards,
>
>> On Wed, Feb 15, 2012 at 12:59 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Wed, Feb 15, 2012 at 12:44:47AM +0400, Anton Komarov wrote:
>> >> I tried to build libmp3splt library with this recipe, but gets
>> >> following error. I just cannot understand - what am i doing wron?
>> >>
>> >>
>> >> recipe:
>> >>
>> >> DESCRIPTION =3D "Mp3splt-project is a utility to split mp3 and ogg fi=
les
>> >> selecting a begin and an end time position, without decoding."
>> >> HOMEPAGE =3D "http://mp3splt.sourceforge.net/mp3splt_page/about.php"
>> >> BUGTRACKER =3D "http://sourceforge.net/tracker/?atid=3D476061&group_i=
d=3D55130&func=3Dbrowse"
>> >> SECTION =3D "libs"
>> >> LICENSE =3D "GPLv2"
>> >>
>> >> DEPENDS=3D"libmad"
>> >>
>> >> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D678a5e287e539ce6c24384c512=
373a53"
>> >>
>> >> PR =3D "r26"
>> >>
>> >> S =3D "${WORKDIR}/libmp3splt-${PV}"
>> >>
>> >> SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"
>> >>
>> >> SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
>> >> SRC_URI[sha256sum] =3D
>> >> "7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"
>> >>
>> >> inherit autotools pkgconfig gettext
>> >>
>> >> PACKAGES =3D+ "libsplt_mp3 libsplt_ogg"
>> >> FILES_${PN}-dev =3D "${libdir}/libmp3splt.so ${libdir}/libmp3splt.la
>> >> ${libdir}/libmp3splt.a ${libdir}/libmp3splt/*.so*"
>> >> FILES_libsplt_mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
>> >> FILES_libsplt_ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"
>> >
>> > there is no libsplt_mp3-staticdev/libsplt_ogg-staticdev in PACKAGES, s=
o
>> > this is ignored.
>> >
>> > and there is no FILES_libsplt_mp3/FILES_libsplt_ogg
>> >
>> > and don't use _ in subpackage names (and use ${PN} as prefix where
>> > possible, better ${PN}-mp3).
>> >
>> >>
>> >> errors:
>> >>
>> >> WARNING: For recipe libmp3splt, the following files/directories were
>> >> installed but not shipped in any package:
>> >> WARNING: =A0 /usr/share
>> >> WARNING: =A0 /usr/include
>> >> WARNING: =A0 /usr/share/aclocal
>> >> WARNING: =A0 /usr/share/aclocal/mp3splt.m4
>> >> WARNING: =A0 /usr/include/libmp3splt
>> >> WARNING: =A0 /usr/include/libmp3splt/mp3splt.h
>> >
>> > This is because you're overwritting FILES_${PN}-dev not appending to i=
t
>> >
>> >> WARNING: libmp3splt: The compile log indicates that host include
>> >> and/or library paths were used. =A0Please check the log
>> >> '/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv=
7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/temp/log.do_compile'
>> >
>> > And you need to read this ^ log to find where it was using host includ=
e
>> > and/or library paths.
>> >
>> > Sometimes it's just mising library in DEPENDS, sometimes it's wrong
>> > autotools usage and host's library is always found and you have to fix
>> > it to look in sysroot instead.
>> >
>> >> for more information.
>> >> WARNING: QA Issue: non -staticdev package contains static .a library:
>> >> libmp3splt path
>> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-sp=
lit/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.a'
>> >> WARNING: QA Issue: non -staticdev package contains static .a library:
>> >> libmp3splt path
>> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-sp=
lit/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.a'
>> >> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
>> >> .so: libmp3splt path
>> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-sp=
lit/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.so'
>> >> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
>> >> .so: libmp3splt path
>> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-sp=
lit/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.so'
>> >> WARNING: QA Issue: non -staticdev package contains static .a library:
>> >> libmp3splt-dev path
>> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-sp=
lit/libmp3splt-dev/usr/lib/libmp3splt.a'
>> >
>> > This is because of those wrong FILES_ entries
>> > --
>> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anton.komarov@gmail.com>) id 1RxQT8-0003TM-8n
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 23:03:26 +0100
Received: by werc1 with SMTP id c1so267600wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 13:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KmcI48Iw1YtCuhm6kPnHXCvSr2aL7JcHe6ITWzC3Lig=;
	b=e28iLygEMZp4fWVXhkLwyuT5qEvFyeQ74Dkcd/gH5lXyK6xABd5Xgs/aT8yhuKANeV
	LVUVK9W5UlsY3sX3j2dkM10W4QFY3/L8eyIIIEB1LtLTcFYq+FFWxojVHv2H9AmmmxOj
	ov0CF/Q8v3vVpPEZRC2sOF0FiR/E1E7qPxFPk=
Received: by 10.216.131.210 with SMTP id m60mr8744056wei.47.1329256515352;
	Tue, 14 Feb 2012 13:55:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.18.205 with HTTP; Tue, 14 Feb 2012 13:54:55 -0800 (PST)
In-Reply-To: <20120214205955.GA6732@jama.jama.net>
References: <CAHKdsmR9A4UMA4Q2cwvnvg6WxnQjO13mydJ-u2D=qxPxFYACQw@mail.gmail.com>
	<20120214205955.GA6732@jama.jama.net>
From: Anton Komarov <anton.komarov@gmail.com>
Date: Wed, 15 Feb 2012 01:54:55 +0400
Message-ID: <CAHKdsmTjaSAqt7a0+K7J5xkV-toHrJ4yi2YMCF3yQjs3XRw32g@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Feb 2012 22:03:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Martin, thanks for fast responce.

So i got the idea about namings and packages.

Well i have tweaked recipe now it looks like

DESCRIPTION =3D "Mp3splt-project is a utility to split mp3 and ogg files
selecting a begin and an end time position, without decoding."
HOMEPAGE =3D "http://mp3splt.sourceforge.net/mp3splt_page/about.php"
BUGTRACKER =3D "http://sourceforge.net/tracker/?atid=3D476061&group_id=3D55=
130&func=3Dbrowse"
SECTION =3D "libs"
LICENSE =3D "GPLv2"

DEPENDS=3D"libmad"

LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D678a5e287e539ce6c24384c512373a53=
"

PR =3D "r43"

SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"

SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
SRC_URI[sha256sum] =3D
"7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"

inherit autotools pkgconfig gettext

EXTRA_OECONF =3D "--libdir=3D${STAGING_LIBDIR} \
                --includedir=3D${STAGING_INCDIR} \
                --oldincludedir=3D${STAGING_INCDIR} \
                --datadir=3D${STAGING_DATADIR}"

PACKAGES =3D+ "libsplt-mp3 libsplt-ogg libsplt-mp3-dev libsplt-ogg-dev
libsplt-mp3-staticdev libsplt-ogg-staticdev"
FILES_${PN}=3D"${libdir}/libmp3splt.so.*"
FILES_${PN}-dev =3D+ "${includedir}/libmp3splt/mp3splt.h
${libdir}/libmp3splt.so ${libdir}/libmp3splt.la"
FILES_${PN}-staticdev =3D+ "${libdir}/libmp3splt.a"
FILES_libsplt-mp3=3D"${libdir}/libmp3splt/libsplt_mp3.so.*"
FILES_libsplt-ogg=3D"${libdir}/libmp3splt/libsplt_ogg.so.*"
FILES_libsplt-mp3-dev=3D"${libdir}/libmp3splt/libsplt_mp3.so
${libdir}/libmp3splt/libsplt_mp3.la"
FILES_libsplt-ogg-dev=3D"${libdir}/libmp3splt/libsplt_ogg.so
${libdir}/libmp3splt/libsplt_ogg.la"
FILES_libsplt-mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
FILES_libsplt-ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"

but i got tons of warnings and still have warning about host libs and inclu=
des

WARNING: For recipe libmp3splt, the following files/directories were
installed but not shipped in any package:
WARNING:   /stuff
WARNING:   /stuff/work
WARNING:   /stuff/work/setup-scripts
WARNING:   /stuff/work/setup-scripts/build
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/share
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/share/aclocal
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/share/aclocal/mp3splt.m4
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt.a
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt.so
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt.so.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt.so.0.0.5
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt.la
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/.debug
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/.debug/libmp3splt.so
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/.debug/libmp3splt.so.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/.debug/libmp3splt.so.0.0.5
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so.0.0.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so.0.0.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.a
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.a
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.la
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.la
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so.0.0.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so.0.0.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so.0
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so
WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so.0
WARNING: libmp3splt: The compile log indicates that host include
and/or library paths were used.  Please check the log
'/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-ang=
strom-linux-gnueabi/libmp3splt-0.5.6-r43/temp/log.do_compile'
for more information.

do_compile log looks like - http://pastebin.com/jWntsdj5

On Wed, Feb 15, 2012 at 12:59 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Wed, Feb 15, 2012 at 12:44:47AM +0400, Anton Komarov wrote:
>> I tried to build libmp3splt library with this recipe, but gets
>> following error. I just cannot understand - what am i doing wron?
>>
>>
>> recipe:
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
>> PR =3D "r26"
>>
>> S =3D "${WORKDIR}/libmp3splt-${PV}"
>>
>> SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"
>>
>> SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
>> SRC_URI[sha256sum] =3D
>> "7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"
>>
>> inherit autotools pkgconfig gettext
>>
>> PACKAGES =3D+ "libsplt_mp3 libsplt_ogg"
>> FILES_${PN}-dev =3D "${libdir}/libmp3splt.so ${libdir}/libmp3splt.la
>> ${libdir}/libmp3splt.a ${libdir}/libmp3splt/*.so*"
>> FILES_libsplt_mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
>> FILES_libsplt_ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"
>
> there is no libsplt_mp3-staticdev/libsplt_ogg-staticdev in PACKAGES, so
> this is ignored.
>
> and there is no FILES_libsplt_mp3/FILES_libsplt_ogg
>
> and don't use _ in subpackage names (and use ${PN} as prefix where
> possible, better ${PN}-mp3).
>
>>
>> errors:
>>
>> WARNING: For recipe libmp3splt, the following files/directories were
>> installed but not shipped in any package:
>> WARNING: =A0 /usr/share
>> WARNING: =A0 /usr/include
>> WARNING: =A0 /usr/share/aclocal
>> WARNING: =A0 /usr/share/aclocal/mp3splt.m4
>> WARNING: =A0 /usr/include/libmp3splt
>> WARNING: =A0 /usr/include/libmp3splt/mp3splt.h
>
> This is because you're overwritting FILES_${PN}-dev not appending to it
>
>> WARNING: libmp3splt: The compile log indicates that host include
>> and/or library paths were used. =A0Please check the log
>> '/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-=
angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/temp/log.do_compile'
>
> And you need to read this ^ log to find where it was using host include
> and/or library paths.
>
> Sometimes it's just mising library in DEPENDS, sometimes it's wrong
> autotools usage and host's library is always found and you have to fix
> it to look in sysroot instead.
>
>> for more information.
>> WARNING: QA Issue: non -staticdev package contains static .a library:
>> libmp3splt path
>> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split=
/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.a'
>> WARNING: QA Issue: non -staticdev package contains static .a library:
>> libmp3splt path
>> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split=
/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.a'
>> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
>> .so: libmp3splt path
>> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split=
/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.so'
>> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
>> .so: libmp3splt path
>> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split=
/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.so'
>> WARNING: QA Issue: non -staticdev package contains static .a library:
>> libmp3splt-dev path
>> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split=
/libmp3splt-dev/usr/lib/libmp3splt.a'
>
> This is because of those wrong FILES_ entries
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



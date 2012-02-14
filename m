Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxR7e-0004Vr-KP
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 23:45:19 +0100
Received: by eekd41 with SMTP id d41so148275eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+eQrXVu2qP8+RAX5OVGnO4XXW4b0BhGXVh1sI5blHJI=;
	b=uAJNNpa7YiUTetM0uy68/ZaJpeQpQ+8v5XLNsAsNYNKZutfmYcUgsP31m3iEHiljdT
	o+gmk4zn8CmKvZWKRIDj6jGFSeQJj0TMhB8i+LxAvBh8YnNVsibodJE+zVIeVeeoabuL
	lGLJYq0rVBqrCxfRKDPNohI5qv3ireJW/GJxU=
Received: by 10.213.106.13 with SMTP id v13mr4010608ebo.116.1329259026897;
	Tue, 14 Feb 2012 14:37:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c16sm3766674eei.1.2012.02.14.14.37.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 14:37:05 -0800 (PST)
Date: Tue, 14 Feb 2012 23:37:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120214223703.GA3914@jama.jama.net>
References: <CAHKdsmR9A4UMA4Q2cwvnvg6WxnQjO13mydJ-u2D=qxPxFYACQw@mail.gmail.com>
	<20120214205955.GA6732@jama.jama.net>
	<CAHKdsmTjaSAqt7a0+K7J5xkV-toHrJ4yi2YMCF3yQjs3XRw32g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHKdsmTjaSAqt7a0+K7J5xkV-toHrJ4yi2YMCF3yQjs3XRw32g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 14 Feb 2012 22:45:19 -0000
X-Groupsio-MsgNum: 37122
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 01:54:55AM +0400, Anton Komarov wrote:
> Martin, thanks for fast responce.
>=20
> So i got the idea about namings and packages.
>=20
> Well i have tweaked recipe now it looks like
>=20
> DESCRIPTION =3D "Mp3splt-project is a utility to split mp3 and ogg files
> selecting a begin and an end time position, without decoding."
> HOMEPAGE =3D "http://mp3splt.sourceforge.net/mp3splt_page/about.php"
> BUGTRACKER =3D "http://sourceforge.net/tracker/?atid=3D476061&group_id=3D=
55130&func=3Dbrowse"
> SECTION =3D "libs"
> LICENSE =3D "GPLv2"
>=20
> DEPENDS=3D"libmad"
>=20
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D678a5e287e539ce6c24384c512373a=
53"
>=20
> PR =3D "r43"
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"
>=20
> SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
> SRC_URI[sha256sum] =3D
> "7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"
>=20
> inherit autotools pkgconfig gettext
>=20
> EXTRA_OECONF =3D "--libdir=3D${STAGING_LIBDIR} \
>                 --includedir=3D${STAGING_INCDIR} \
>                 --oldincludedir=3D${STAGING_INCDIR} \
>                 --datadir=3D${STAGING_DATADIR}"

Why did you add those 4 lines? this is all wrong..

> PACKAGES =3D+ "libsplt-mp3 libsplt-ogg libsplt-mp3-dev libsplt-ogg-dev
> libsplt-mp3-staticdev libsplt-ogg-staticdev"
> FILES_${PN}=3D"${libdir}/libmp3splt.so.*"
> FILES_${PN}-dev =3D+ "${includedir}/libmp3splt/mp3splt.h
> ${libdir}/libmp3splt.so ${libdir}/libmp3splt.la"
> FILES_${PN}-staticdev =3D+ "${libdir}/libmp3splt.a"
> FILES_libsplt-mp3=3D"${libdir}/libmp3splt/libsplt_mp3.so.*"
> FILES_libsplt-ogg=3D"${libdir}/libmp3splt/libsplt_ogg.so.*"
> FILES_libsplt-mp3-dev=3D"${libdir}/libmp3splt/libsplt_mp3.so
> ${libdir}/libmp3splt/libsplt_mp3.la"
> FILES_libsplt-ogg-dev=3D"${libdir}/libmp3splt/libsplt_ogg.so
> ${libdir}/libmp3splt/libsplt_ogg.la"
> FILES_libsplt-mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
> FILES_libsplt-ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"
>=20
> but i got tons of warnings and still have warning about host libs and inc=
ludes
>=20
> WARNING: For recipe libmp3splt, the following files/directories were
> installed but not shipped in any package:
> WARNING:   /stuff
> WARNING:   /stuff/work
> WARNING:   /stuff/work/setup-scripts
> WARNING:   /stuff/work/setup-scripts/build
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/share
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/share/aclocal
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/share/aclocal/mp3splt.m4
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt.a
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt.so
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt.so.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt.so.0.0.5
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt.la
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/.debug
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/.debug/libmp3splt.so
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/.debug/libmp3splt.so.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/.debug/libmp3splt.so.0.0.5
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so.0.0.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so.0.0.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.so
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.so.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.a
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.a
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_mp3.la
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/libsplt_ogg.la
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so.0.0.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so.0.0.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so.0
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_mp3.so
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so
> WARNING:   /stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/lib/libmp3splt/.debug/libsplt_ogg.so.0
> WARNING: libmp3splt: The compile log indicates that host include
> and/or library paths were used.  Please check the log
> '/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-a=
ngstrom-linux-gnueabi/libmp3splt-0.5.6-r43/temp/log.do_compile'
> for more information.
>=20
> do_compile log looks like - http://pastebin.com/jWntsdj5

If you grep for "unsafe" you'll find parts like:
arm-angstrom-linux-gnueabi-libtool: compile:  ccache
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -fno-tree-vectorize
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysr=
oots/beagleboard
-DHAVE_CONFIG_H -I. -I.. -I/usr/include -I/usr/include -I/usr/include
-I/usr/include -Wall -O2 -pipe -g -feliminate-unused-debug-types
-I../include/libmp3splt -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -c
ogg.c  -fPIC -DPIC -o .libs/ogg.o
cc1: warning: include location "/usr/include" is unsafe for
cross-compilation

-I/usr/include is bad, -I/usr/include 4 times is super bad (even with
the same results) check autotools from where it was added, pkgconfig
usually works but ie calling some -config scripts could be more tricky
(especially if it's not build yet in your sysroot).

Regards,

> On Wed, Feb 15, 2012 at 12:59 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Wed, Feb 15, 2012 at 12:44:47AM +0400, Anton Komarov wrote:
> >> I tried to build libmp3splt library with this recipe, but gets
> >> following error. I just cannot understand - what am i doing wron?
> >>
> >>
> >> recipe:
> >>
> >> DESCRIPTION =3D "Mp3splt-project is a utility to split mp3 and ogg fil=
es
> >> selecting a begin and an end time position, without decoding."
> >> HOMEPAGE =3D "http://mp3splt.sourceforge.net/mp3splt_page/about.php"
> >> BUGTRACKER =3D "http://sourceforge.net/tracker/?atid=3D476061&group_id=
=3D55130&func=3Dbrowse"
> >> SECTION =3D "libs"
> >> LICENSE =3D "GPLv2"
> >>
> >> DEPENDS=3D"libmad"
> >>
> >> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D678a5e287e539ce6c24384c5123=
73a53"
> >>
> >> PR =3D "r26"
> >>
> >> S =3D "${WORKDIR}/libmp3splt-${PV}"
> >>
> >> SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"
> >>
> >> SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
> >> SRC_URI[sha256sum] =3D
> >> "7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"
> >>
> >> inherit autotools pkgconfig gettext
> >>
> >> PACKAGES =3D+ "libsplt_mp3 libsplt_ogg"
> >> FILES_${PN}-dev =3D "${libdir}/libmp3splt.so ${libdir}/libmp3splt.la
> >> ${libdir}/libmp3splt.a ${libdir}/libmp3splt/*.so*"
> >> FILES_libsplt_mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
> >> FILES_libsplt_ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"
> >
> > there is no libsplt_mp3-staticdev/libsplt_ogg-staticdev in PACKAGES, so
> > this is ignored.
> >
> > and there is no FILES_libsplt_mp3/FILES_libsplt_ogg
> >
> > and don't use _ in subpackage names (and use ${PN} as prefix where
> > possible, better ${PN}-mp3).
> >
> >>
> >> errors:
> >>
> >> WARNING: For recipe libmp3splt, the following files/directories were
> >> installed but not shipped in any package:
> >> WARNING: =A0 /usr/share
> >> WARNING: =A0 /usr/include
> >> WARNING: =A0 /usr/share/aclocal
> >> WARNING: =A0 /usr/share/aclocal/mp3splt.m4
> >> WARNING: =A0 /usr/include/libmp3splt
> >> WARNING: =A0 /usr/include/libmp3splt/mp3splt.h
> >
> > This is because you're overwritting FILES_${PN}-dev not appending to it
> >
> >> WARNING: libmp3splt: The compile log indicates that host include
> >> and/or library paths were used. =A0Please check the log
> >> '/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7=
a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/temp/log.do_compile'
> >
> > And you need to read this ^ log to find where it was using host include
> > and/or library paths.
> >
> > Sometimes it's just mising library in DEPENDS, sometimes it's wrong
> > autotools usage and host's library is always found and you have to fix
> > it to look in sysroot instead.
> >
> >> for more information.
> >> WARNING: QA Issue: non -staticdev package contains static .a library:
> >> libmp3splt path
> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-spl=
it/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.a'
> >> WARNING: QA Issue: non -staticdev package contains static .a library:
> >> libmp3splt path
> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-spl=
it/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.a'
> >> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
> >> .so: libmp3splt path
> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-spl=
it/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.so'
> >> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
> >> .so: libmp3splt path
> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-spl=
it/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.so'
> >> WARNING: QA Issue: non -staticdev package contains static .a library:
> >> libmp3splt-dev path
> >> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-spl=
it/libmp3splt-dev/usr/lib/libmp3splt.a'
> >
> > This is because of those wrong FILES_ entries
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk864g8ACgkQN1Ujt2V2gBzZtgCfc7cR5EP7Izw4d1MIRT5npvzw
k6kAnRy5eeauVoy05H+ZMTJ2UaVBVpC8
=ySWd
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

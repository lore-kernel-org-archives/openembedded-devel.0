Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxPbd-0001uV-GO
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 22:08:09 +0100
Received: by eekd41 with SMTP id d41so128528eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 12:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OLhdyDkOGWDIeBw7ONA+M8kejCbu9WYJrKRz3fJwM7g=;
	b=mCyWvsXdFs71+PDLHJ/90ha9460WZK4iAIx/wOE8nTVYlI1XR9llHuE+gJhWrUR7ry
	HPYipIo+dL61vYj7HVj3w7e5Cv06YjQjvT/9t1+d4oJtrJVXINFUNHODNfCcXtSKK0Op
	kuDne4sbQ3GDegYWJ0o5r85lnwFunAGoqGmrY=
Received: by 10.14.53.74 with SMTP id f50mr7546514eec.5.1329253198475;
	Tue, 14 Feb 2012 12:59:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm2709344eeb.11.2012.02.14.12.59.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 12:59:57 -0800 (PST)
Date: Tue, 14 Feb 2012 21:59:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120214205955.GA6732@jama.jama.net>
References: <CAHKdsmR9A4UMA4Q2cwvnvg6WxnQjO13mydJ-u2D=qxPxFYACQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHKdsmR9A4UMA4Q2cwvnvg6WxnQjO13mydJ-u2D=qxPxFYACQw@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Feb 2012 21:08:09 -0000
X-Groupsio-MsgNum: 37120
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 12:44:47AM +0400, Anton Komarov wrote:
> I tried to build libmp3splt library with this recipe, but gets
> following error. I just cannot understand - what am i doing wron?
>=20
>=20
> recipe:
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
> PR =3D "r26"
>=20
> S =3D "${WORKDIR}/libmp3splt-${PV}"
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"
>=20
> SRC_URI[md5sum] =3D "1c982db15bba4efb42a5a227ce87a575"
> SRC_URI[sha256sum] =3D
> "7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"
>=20
> inherit autotools pkgconfig gettext
>=20
> PACKAGES =3D+ "libsplt_mp3 libsplt_ogg"
> FILES_${PN}-dev =3D "${libdir}/libmp3splt.so ${libdir}/libmp3splt.la
> ${libdir}/libmp3splt.a ${libdir}/libmp3splt/*.so*"
> FILES_libsplt_mp3-staticdev=3D"${libdir}/libmp3splt/libsplt_mp3.a"
> FILES_libsplt_ogg-staticdev=3D"${libdir}/libmp3splt/libsplt_ogg.a"

there is no libsplt_mp3-staticdev/libsplt_ogg-staticdev in PACKAGES, so
this is ignored.

and there is no FILES_libsplt_mp3/FILES_libsplt_ogg

and don't use _ in subpackage names (and use ${PN} as prefix where
possible, better ${PN}-mp3).

>=20
> errors:
>=20
> WARNING: For recipe libmp3splt, the following files/directories were
> installed but not shipped in any package:
> WARNING:   /usr/share
> WARNING:   /usr/include
> WARNING:   /usr/share/aclocal
> WARNING:   /usr/share/aclocal/mp3splt.m4
> WARNING:   /usr/include/libmp3splt
> WARNING:   /usr/include/libmp3splt/mp3splt.h

This is because you're overwritting FILES_${PN}-dev not appending to it

> WARNING: libmp3splt: The compile log indicates that host include
> and/or library paths were used.  Please check the log
> '/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-a=
ngstrom-linux-gnueabi/libmp3splt-0.5.6-r27/temp/log.do_compile'

And you need to read this ^ log to find where it was using host include
and/or library paths.

Sometimes it's just mising library in DEPENDS, sometimes it's wrong
autotools usage and host's library is always found and you have to fix
it to look in sysroot instead.

> for more information.
> WARNING: QA Issue: non -staticdev package contains static .a library:
> libmp3splt path
> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/=
libmp3splt/usr/lib/libmp3splt/libsplt_mp3.a'
> WARNING: QA Issue: non -staticdev package contains static .a library:
> libmp3splt path
> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/=
libmp3splt/usr/lib/libmp3splt/libsplt_ogg.a'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
> .so: libmp3splt path
> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/=
libmp3splt/usr/lib/libmp3splt/libsplt_mp3.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
> .so: libmp3splt path
> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/=
libmp3splt/usr/lib/libmp3splt/libsplt_ogg.so'
> WARNING: QA Issue: non -staticdev package contains static .a library:
> libmp3splt-dev path
> '/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/=
libmp3splt-dev/usr/lib/libmp3splt.a'

This is because of those wrong FILES_ entries
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk86y0sACgkQN1Ujt2V2gBxquQCgsaRq5QKCXWRswL76jYWOCfeR
qWsAoJR9rbp6KcWqUkHyaspsAZtI9mOK
=YC/F
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SV1qp-0003dr-DZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 16:38:47 +0200
Received: by werg55 with SMTP id g55so1300814wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PZud244QtgA0IIy4zgu3qAypXk9JnWl/R7iR+LrrlXA=;
	b=qjMcXM8dgzXjcXFoJodwkGnbtSN6VqUelXr+XPzf4E+kP+D30kEgE3Osz/OpCv70No
	MMvswXDTsTUMBsaf2jdGTFCXUPnPWHISCQorbNjqUdK4i2Up8VT9D0IIrET7JQ2ZC0tH
	a+hXJ/22pma0IptRkPprU6V3B7/VSJA4g2cGIRho1BRH4n3r8PSXFpIXs8Euxdwdjjo+
	QuCZu9JXaJO16kxwgJPGxgawMgUTCZuri/NVyh263VzG4r8LfTVks5tTOYgywMKkc1Db
	Lxe0xe8Qo0Uo0BMQ1uIpc0SX3XO3I8b1LvrbWDVIVsisVPPqaTt2I0gxvYFJ1qaITzuN
	rhEg==
Received: by 10.180.24.39 with SMTP id r7mr51371146wif.9.1337264923452;
	Thu, 17 May 2012 07:28:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm21535799wib.0.2012.05.17.07.28.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 07:28:42 -0700 (PDT)
Date: Thu, 17 May 2012 16:28:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120517142841.GH3164@jama.jama.net>
References: <4FB50951.4000503@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <4FB50951.4000503@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Building Valgrind
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
X-List-Received-Date: Thu, 17 May 2012 14:38:47 -0000
X-Groupsio-MsgNum: 38855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wj9ZLJVQDRFjGSdK"
Content-Disposition: inline

--wj9ZLJVQDRFjGSdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 03:21:05PM +0100, Jack Mitchell wrote:
> I am attempting to build Valgrind with mu very minimal package compiling=
=20
> experience, and unsurprisingly for such a complex program I am stuck! I=
=20
> will be happy to submit it to meta-oe once it is building and believe it=
=20
> would be very useful now that it supports ARM (and MIPS to some extent=20
> apparently). So, my progress so far:
>=20
>=20
>  From what I can gather the autoconf class is passing --warning=3Dcross=
=20
> which it doesn't understand... I'm really not very experienced at this! :=
-)
>=20
> bb file:

what's wrong with
openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
?=20

just update it to include arm/mips in COMPATIBLE_HOST


Cheers,

>=20
> DESCRIPTION =3D "Valgrind"
> HOMEPAGE =3D "http://www.valgrind.org"
>=20
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46082167a314d785d012a244748d8=
03"
>=20
> inherit autotools gettext pkgconfig
>=20
> SRC_URI =3D "http://valgrind.org/downloads/valgrind-${PV}.tar.bz2"
> SRC_URI[md5sum] =3D "a855fda56edf05614f099dca316d1775"
>=20
> error:
>=20
> DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',=20
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common=
']
> ERROR: Function failed: do_configure (see=20
> /home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angs=
trom-linux-gnueabi/valgrind-3.7.0-r0/temp/log.do_configure.14418=20
> for further information)
> automake (GNU automake) 1.11.2
> Copyright (C) 2011 Free Software Foundation, Inc.
> License GPLv2+: GNU GPL version 2 or later=20
> <http://gnu.org/licenses/gpl-2.0.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>=20
> Written by Tom Tromey <tromey@redhat.com>
>         and Alexandre Duret-Lutz <adl@gnu.org>.
> AUTOV is 1.11
> NOTE: Executing autoreconf --verbose --install --force=20
> --exclude=3Dautopoint=20
> -I/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_6=
4-linux/usr/share/aclocal-1.11=20
> -I=20
> /home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angs=
trom-linux-gnueabi/valgrind-3.7.0-r0/valgrind-3.7.0/aclocal-copy/
> autoreconf: Entering directory `.'
> autoreconf: configure.in: not using Gettext
> autoreconf: running: aclocal -I=20
> /home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-=
linux/usr/share/aclocal-1.11=20
> -I=20
> /home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angs=
trom-linux-gnueabi/valgrind-3.7.0-r0/valgrind-3.7.0/aclocal-copy/=20
> -I=20
> /home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-=
linux/usr/share/aclocal-1.11=20
> -I=20
> /home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angs=
trom-linux-gnueabi/valgrind-3.7.0-r0/valgrind-3.7.0/aclocal-copy/=20
> --force --warnings=3Dcross
> aclocal: unknown warning category `cross'
> aclocal: aclocal: file=20
> `/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64=
-linux/usr/share/aclocal/gsettings.m4'=20
> does not exist
> autoreconf: aclocal failed with exit status: 1
> ERROR: autoreconf execution failed.
> ~
>=20
> Thanks in advance!
>=20
> Regards,
> Jack.
>=20
> --=20
>=20
>    Jack Mitchell (jack@embed.me.uk)
>    Embedded Systems Engineer
>    http://www.embed.me.uk
>=20
> --
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wj9ZLJVQDRFjGSdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+1CxkACgkQN1Ujt2V2gBxw3QCfTjZo63s4n9JD0iKIJ6xsDB7D
43YAnRHYZURXPg+tVJTHYarDIWHe/jRr
=ptdX
-----END PGP SIGNATURE-----

--wj9ZLJVQDRFjGSdK--

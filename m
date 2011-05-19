Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1QMxwr-0004VH-Tg
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 09:47:09 +0200
Received: (qmail invoked by alias); 19 May 2011 07:44:13 -0000
Received: from 230.118.101.84.rev.sfr.net (EHLO [192.168.42.71])
	[84.101.118.230]
	by mail.gmx.net (mp010) with SMTP; 19 May 2011 09:44:13 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+gPrJcULygOqD19l4qBjLiueTouT+PKg9u50XJJA
	k0wk0ATplch8K/
Message-ID: <4DD4CA47.7040100@gmx.net>
Date: Thu, 19 May 2011 09:44:07 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: FYI: project using Bionic C library for Gentoo
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
X-List-Received-Date: Thu, 19 May 2011 07:47:10 -0000
X-Groupsio-MsgNum: 32199
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDAF2846032410E3A45EF8BB5"

--------------enigDAF2846032410E3A45EF8BB5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi fellow OE people,
this might be of interest for you. Some guy started a project where he
uses Android's bionic C library as the system's libc implementation
(this is at least what it sounds to me).

Since there is an inherent similarity between Gentoo ebuilds and
OpenEmbedded build recipes I thought some people might be interested in
that - of course, for a possible introduction of Bionic into OE. :)

Regards,
Robert

-------- Original-Nachricht --------
Betreff: [Jamvm-general] JamVM / Bionic
Datum: Wed, 18 May 2011 13:49:30 -0400
Von: Christopher Friedt <chrisfriedt@gmail.com>
An: jamvm-general@lists.sourceforge.net

Hi folks,

Sorry if you're receiving this on #gentoo-embedded or another
mailing list as well, but I just wanted to announce a small
project that might be of interest for some people on this list.

I'm introducing Android's Bionic C library into Gentoo's Portage as
new ELIBC and put together a proof of concept overlay that contains
the libc, icu4c, libxml2, libxslt, zlib, gnu-classpath and jamvm
ebuilds.

It's alpha right now, but runs on amd64 / x86 hardware. I haven't
built it yet for arm, but that arch will be my next victim.

If anyone is interested, it would be great if someone could try
building it from scratch and let me know if there are any speed-bumps.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=


I've made tarball snapshots of the portage overlay (i.e. all source),
sysroot, and toolchain available here[1].

A gitorious project has been set up here[2], but I'm not going to
check-in the overlay until a bit more testing is done.

I've also set up a blog to make announcements here[3], and will be
making the first post after checking the overlay into gitorious and
after one or two people can reproduce the build.

Incidentally, if anyone here has an amd64 or x86 arch running Linux
and would like to do take it for a test drive, download the sysroot
from [1], unpack to /usr/i686-pc-linux-bionic and then run the
following:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#!/bin/sh

for i in proc sys dev tmp; do
 mount -o bind /${i} /usr/i686-pc-linux-bionic/${i}
done

chroot /usr/i686-pc-linux-bionic /bin/sh
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Incidentally, if you try to recreate the toolchain, please use the
following:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
#!/bin/sh

export PORTDIR_OVERLAY=3D"/usr/local/portage/crossdev-overlay"
export PORTDIR_OVERLAY=3D"${PORTDIR_OVERLAY}
/usr/local/portage/gentoo-bionic-overlay"

emerge =3Dsys-devel/crossdev-20110310 =3Dsys-devel/gnuconfig-20100924

crossdev \
       -S \
       --g 4.6.0 \
       --target i686-pc-linux-bionic

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

Cheers,

C

[1] http://code.google.com/p/gentoo-bionic
[2] https://gitorious.org/gentoo-bionic
[3] http://gentoo-bionic.blogspot.com

-------------------------------------------------------------------------=
-----
What Every C/C++ and Fortran developer Should Know!
Read this article and learn how Intel has extended the reach of its
next-generation tools to help Windows* and Linux* C/C++ and Fortran
developers boost performance applications - including clusters.
http://p.sf.net/sfu/intel-dev2devmay
_______________________________________________
Jamvm-general mailing list
Jamvm-general@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/jamvm-general


--------------enigDAF2846032410E3A45EF8BB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3UykwACgkQG9cfwmwwEtrepwCeKDLURbMwAp7VK23K3U/q4nzh
UhgAn3BwqEKuRaKk5hl2wVzKcE4iheGl
=Avgw
-----END PGP SIGNATURE-----

--------------enigDAF2846032410E3A45EF8BB5--

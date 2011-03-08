Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1PwrmT-0004wd-IL
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 08:56:33 +0100
Received: (qmail invoked by alias); 08 Mar 2011 07:54:59 -0000
Received: from 168.163.71-86.rev.gaoland.net (EHLO [192.168.42.71])
	[86.71.163.168]
	by mail.gmx.net (mp071) with SMTP; 08 Mar 2011 08:54:59 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19+6zc+DhF+Q9lKuC8zkJQAzcw+1OqZCinkjohAHc
	2lcGRmLpOOJvqe
Message-ID: <4D75E0CF.1040209@gmx.net>
Date: Tue, 08 Mar 2011 08:54:55 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D75D1A7.9040103@gmx.net>
In-Reply-To: <4D75D1A7.9040103@gmx.net>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: Re: libffi-native 3.0.9 fails to build on at least x86_64 [solved, problem on my side]
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
X-List-Received-Date: Tue, 08 Mar 2011 07:56:33 -0000
X-Groupsio-MsgNum: 29979
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig843D39B4B40E8C195A34AC11"

--------------enig843D39B4B40E8C195A34AC11
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I moved the whole OE directory (bitbake, oe, configdir) to a new
location and made it available through the same path using a symlink. As
it looks OE does not like that at all.

Regards,
Robert

Am 08.03.2011 07:50, schrieb Robert Schuster:
> Hi,
> I tried building libffi-native on an Ubuntu 10.04 amd64 box (during
> angstrom build for pandaboard) and it fails. Investigation found out
> that during libffi's configure it will symlink 'src/x86/ffitarget.h' to=

> 'include/ffitarget.h'. Unfortunately this will create a broken softlink=

> because 'src' and 'include' are on the same directory level. I manually=

> corrected the softlink to '../src/x86/ffitarget.h' and then I could
> continue the build.
>=20
> Clearly this is not what should happen. Anyone an idea why ffi does tha=
t?
>=20
> (For testing purposes I tried brand new libffi 3.0.10rc8 and it shows
> exactly the same error).
>=20
> Regards,
> Robert
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig843D39B4B40E8C195A34AC11
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk114NIACgkQG9cfwmwwEtoh3ACgl13ftXaTSWsFR6LJQZUEHIsF
7VUAniiu8javEaPOP9SJ1pRFKPSCD6JA
=gLsk
-----END PGP SIGNATURE-----

--------------enig843D39B4B40E8C195A34AC11--

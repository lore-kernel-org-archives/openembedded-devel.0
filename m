Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2SOd-00052C-SM for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 19:03:04 +0100
Received: from f053045005.adsl.alicedsl.de ([78.53.45.5] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2SMs-0005ao-CU for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 18:01:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=kT3DNMuC_+6LQGE6usL=ryExHiWm_hKQdu32x@mail.gmail.com>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
	<1300834528.3825.3.camel@mattotaupa>
	<AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
	<1300881388.4101.23.camel@mattotaupa>
	<AANLkTikhnHdQGGh-bkAs3si4PNg5NqGCJ1c2iQOkuwL-@mail.gmail.com>
	<AANLkTi=kT3DNMuC_+6LQGE6usL=ryExHiWm_hKQdu32x@mail.gmail.com>
Date: Wed, 23 Mar 2011 19:01:13 +0100
Message-ID: <1300903273.4101.36.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Wed, 23 Mar 2011 18:03:04 -0000
X-Groupsio-MsgNum: 30562
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eXkHl7GpO/dZp2TaMdT3"

--=-eXkHl7GpO/dZp2TaMdT3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 23.03.2011, 15:20 +0100 schrieb Frans Meulenbroeks:
> 2011/3/23 Sylvain Par=C3=A9 <sylvain.pare@gmail.com>:
> > Hello
> > I was going to fill a bugrepport on OE's bugzilla but as you are alread=
y
> > speaking of vlc building issue..
> > It does not build for me neither : http://pastebin.com/raw.php?i=3DwK4S=
xbv9

It build for me fine *again* with 2b952471. So please, Otavio and
Sylvain, report you build configuration. I am using `angstrom-2010.x`
for `MACHINE =3D "beagleboard"`.

> We did discuss this on irc, and the issue seems to be that
> libliveMedia.a is probably a host lib.
>=20
> Another issue that was noted was that OE_CONF says --enable-live555
> (or something like that) but live555 is not in the DEPENDS.
> A quick glance over the recipe showed that there seem to be more
> things missing in DEPENDS (freetype, apache, png, ...)

That could be and it should be fixed to not implicitly depend on
something. But we should also figure out why it works for me and lua.h
gets staged for me.


Thanks,

Paul

--=-eXkHl7GpO/dZp2TaMdT3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2KNWkACgkQPX1aK2wOHVhaKgCcD6xicpAiBWhCipsqJe9aA57Z
XbMAn0S8msKXJyDlIcdl+0E43KLADvP6
=qjEy
-----END PGP SIGNATURE-----

--=-eXkHl7GpO/dZp2TaMdT3--

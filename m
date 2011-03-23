Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2CKG-00032T-4S for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 01:53:28 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2CIV-0006KQ-Dz for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 00:51:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103230133.06164.schnitzeltony@gmx.de>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300449625.3830.47.camel@mattotaupa> <im4tuv$so3$1@dough.gmane.org>
	<201103230133.06164.schnitzeltony@gmx.de>
Date: Wed, 23 Mar 2011 01:51:38 +0100
Message-ID: <1300841498.3825.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Wed, 23 Mar 2011 00:53:28 -0000
X-Groupsio-MsgNum: 30535
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WGWjQrgH+NBsZBANT6XO"

--=-WGWjQrgH+NBsZBANT6XO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 23.03.2011, 01:33 +0100 schrieb Andreas Mueller:
> On Sunday 20 March 2011 14:03:27 Koen Kooi wrote:
> > On 18-03-11 13:00, Paul Menzel wrote:
> > > Date: Fri, 18 Mar 2011 12:03:43 +0100
> > >=20
> > > Xfce Session build depends on the executable `iceauth`, which fails w=
hen
> > > cross compiling for a different architecture.
> >=20
> > [..]
> >=20
> > > --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
> >=20
> > [..]
> >=20
> > > +EXTRA_OECONF +=3D "ac_cv_path_ICEAUTH=3D/usr/bin/iceauth"
> >=20
> > Minor nit: ${bindir}/iceauth
> >=20
> > If that's fixed:
> >=20
> > Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> >=20
> > regards,
> >=20
> > Koen
>=20
> During preparing xfce 4.8  recipes I stumbled over 'iceauth' too:=20
>=20
> It is missing on the target image although 'xfce4-session' has it in DEPE=
NDS &=20
> RDEPENDS_${PN} (this patch does not change missing 'iceauth' in image - s=
o I=20
> would NAK if I could)

I did not check that. But why does not `RDEPENDS` pull that in? And you
can always NAK. ;-) Hopefully not too often on my patches.

> Anyway: In 'xfce4-session' / config.log I found:
>=20
> | configure:15972: checking for iceauth
> | configure:15990: found */usr/bin/iceauth*
> | configure:16002: result: /usr/bin/iceauth
>=20
> So - as Khem suggested - and with xfce4-session: RDEPENDS_${PN}=3D"iceaut=
h" I:
>   - changed iceauth to extent to iceauth-native.
>   - changed xfce4-session: DEPENDS =3D "iceauth-native ..."
>   - build an image
>=20
> Results:
> - config.log says: configure:15990: found /home/Superandi/tmp/sysroots/i6=
86-
> linux/usr/bin/iceauth
> - In installed-packages.txt now 'iceauth_1:1.0.4-r5.1.9_armv7a.ipk' is fo=
und!

Have you run tested that? As far as I understood that path is put into
the resulting binary and, if I am not mistaken, the path will be
`/usr/bin/iceauth` on the target system.

> Since xfce4.6 means huge rebuild for me (and I did only pick up what Khem=
=20
> suggested): Can anybody test this for xfce_session_4.6.{1, 2} and create =
the=20
> patches?

Could you send me the patch to get the native recipe for Xfce 4.8? I can
adapt it then. I am sure it will work, but please explain to me the
issue raised above.


Thanks,

Paul

--=-WGWjQrgH+NBsZBANT6XO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2JRBoACgkQPX1aK2wOHVhyUQCeMwFGltbHP2V5jUOtv1C78DEn
qTkAn2F7cLQPVjZlKP1uzdi/VPkN6+GI
=+NX9
-----END PGP SIGNATURE-----

--=-WGWjQrgH+NBsZBANT6XO--

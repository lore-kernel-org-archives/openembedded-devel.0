Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ08t-0004Vn-1Q for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 11:19:11 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ07S-0001oa-Nv for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 09:17:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304845356.3355.4.camel@lenovo.internal.reciva.com>
References: <1304524618-4864-1-git-send-email-robert@erafx.com>
	<20110508005952.GC20352@sakrah.homelinux.org>
	<1304837776.4124.15.camel@mattotaupa>
	<1304845356.3355.4.camel@lenovo.internal.reciva.com>
Date: Sun, 08 May 2011 11:16:29 +0200
Message-ID: <1304846189.4124.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] x264_r2245: fix DEPENDS for x86
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
X-List-Received-Date: Sun, 08 May 2011 09:19:11 -0000
X-Groupsio-MsgNum: 31731
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-o6Ni7YATRRs/MiJ6+n9x"

--=-o6Ni7YATRRs/MiJ6+n9x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 08.05.2011, 10:02 +0100 schrieb Phil Blundell:
> On Sun, 2011-05-08 at 08:56 +0200, Paul Menzel wrote:
> > Am Samstag, den 07.05.2011, 17:59 -0700 schrieb Khem Raj:
> > > On (04/05/11 11:56), Bob Foerster wrote:
> >=20
> > You can be more specific in the commit summary.
> >=20
> > 	do not override `DEPENDS` for x86
> >=20
> > > > The recipe intended to add "yasm-native" to the dependencies on x86=
,
> >=20
> > Use present tense. s/intended/intends/
>=20
> If this is talking about the former, erroneous behaviour (which is
> corrected by this patch) then the past tense is correct.

I thought in minutes or proceeding always the present tense is used. The
recipe behaves incorrectly until the patch is applied. But it is not
very important.

> > > > -DEPENDS_x86 =3D "yasm-native"
> > > > +DEPENDS_append_x86 =3D "yasm-native"
> > >                          ^
> > > you need a space=20
> >=20
> > You should also be able to use +=3D, should not you?
>=20
> No, +=3D doesn't work with overrides.  "DEPENDS_x86 +=3D" would do the sa=
me
> wrong thing as the original "DEPENDS_x86".

Thank you for the clarification. Is for example `RDEPENDS_${PN}` also an
override? If yes, then looking at

	$ git grep 'DEPENDS_'

returns a lot of incorrect usages.


Thanks,

Paul

--=-o6Ni7YATRRs/MiJ6+n9x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GX20ACgkQPX1aK2wOHVjtEwCfawkaS2CSHPcDjhW79Kf1LsIx
/uIAnRN2ZL1CmE5ysB/NNMAWONsRXPu/
=s+Hc
-----END PGP SIGNATURE-----

--=-o6Ni7YATRRs/MiJ6+n9x--

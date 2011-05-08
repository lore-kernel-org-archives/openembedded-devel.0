Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxxC-0003l5-SQ for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 08:58:58 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxvm-0005NJ-BM for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 06:57:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110508005952.GC20352@sakrah.homelinux.org>
References: <1304524618-4864-1-git-send-email-robert@erafx.com>
	<20110508005952.GC20352@sakrah.homelinux.org>
Date: Sun, 08 May 2011 08:56:16 +0200
Message-ID: <1304837776.4124.15.camel@mattotaupa>
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
X-List-Received-Date: Sun, 08 May 2011 06:58:58 -0000
X-Groupsio-MsgNum: 31724
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GnbZjZJ1SB5hKIOlMl0J"

--=-GnbZjZJ1SB5hKIOlMl0J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 07.05.2011, 17:59 -0700 schrieb Khem Raj:
> On (04/05/11 11:56), Bob Foerster wrote:

You can be more specific in the commit summary.

	do not override `DEPENDS` for x86

> > The recipe intended to add "yasm-native" to the dependencies on x86,

Use present tense. s/intended/intends/

> > but it set DEPENDS_x86 =3D "yasm-native" which obliterated the base

s/set/sets/

> > dependencies. On a fresh build, this package was failing since it
> > was trying to build before the compiler was ready.
> >=20
> > Depends is now set with DEPENDS_append_x86, which leaves the base
> > dependencies intact.
> >=20
> > Signed-off-by: Bob Foerster <robert@erafx.com>
> > ---
> >  recipes/vlc/x264_r2245.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
> > index 0cffea3..8c2b5b4 100644
> > --- a/recipes/vlc/x264_r2245.bb
> > +++ b/recipes/vlc/x264_r2245.bb
> > @@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel =3D "-fPIC"
> >  X264_DISABLE_ASM =3D "--disable-asm"
> >  # use assembler written functions for those archs supporting this
> >  X264_DISABLE_ASM_x86 =3D ""
> > -DEPENDS_x86 =3D "yasm-native"
> > +DEPENDS_append_x86 =3D "yasm-native"
>                          ^
> you need a space=20

You should also be able to use +=3D, should not you?

> Otherwise looks ok
> > =20
> >  EXTRA_OECONF =3D '--enable-shared ${X264_DISABLE_ASM} --extra-cflags=
=3D"${X264_ECFLAGS}"'


Thanks,

Paul

--=-GnbZjZJ1SB5hKIOlMl0J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GPpAACgkQPX1aK2wOHViu+QCfeADOVbxSrCCYu1c0WEHDsiIY
LccAniAaESCgspZw65ALwTYdnXOL8FJy
=fBnq
-----END PGP SIGNATURE-----

--=-GnbZjZJ1SB5hKIOlMl0J--

Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ646-0007ST-GA for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 17:38:38 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ62f-00009i-Vc for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 15:37:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTimLb=i4eLMD2NWLRcC5QxADWQa4Mg@mail.gmail.com>
References: <1304852453-9294-1-git-send-email-robert@erafx.com>
	<1304852952.4124.52.camel@mattotaupa>
	<BANLkTimLb=i4eLMD2NWLRcC5QxADWQa4Mg@mail.gmail.com>
Date: Sun, 08 May 2011 17:35:55 +0200
Message-ID: <1304868955.4124.67.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] x264_r2245: do not override `DEPENDS` for x86
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
X-List-Received-Date: Sun, 08 May 2011 15:38:38 -0000
X-Groupsio-MsgNum: 31743
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Ixq2psSn3IwHlyqMNasK"

--=-Ixq2psSn3IwHlyqMNasK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 08.05.2011, 07:33 -0400 schrieb Robert Foerster:
> On Sun, May 8, 2011 at 7:09 AM, Paul Menzel wrote:

> > Am Sonntag, den 08.05.2011, 07:00 -0400 schrieb Bob Foerster:
> > > The recipe intended to add "yasm-native" to the dependencies on x86,
> > > but it set DEPENDS_x86 =3D "yasm-native" which obliterated the base
> > > dependencies. On a fresh build, this package was failing since it
> > > was trying to build before the compiler was ready.
> > >
> > > Depends is now set with DEPENDS_append_x86, which leaves the base
> > > dependencies intact.
> >
> > Btw. What `MACHINE` and `DISTRIBUTION` do you use?
>=20
> machine=3Dx86, distro=3Dcustom
>=20
> > > Signed-off-by: Bob Foerster <robert@erafx.com>
> > > ---
> > >  recipes/vlc/x264_r2245.bb |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > >
> > > diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
> > > index 0cffea3..21e5a0e 100644
> > > --- a/recipes/vlc/x264_r2245.bb
> > > +++ b/recipes/vlc/x264_r2245.bb
> > > @@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel =3D "-fPIC"
> > >  X264_DISABLE_ASM =3D "--disable-asm"
> > >  # use assembler written functions for those archs supporting this
> > >  X264_DISABLE_ASM_x86 =3D ""
> > > -DEPENDS_x86 =3D "yasm-native"
> > > +DEPENDS_append_x86 =3D " yasm-native"
> > >
> > >  EXTRA_OECONF =3D '--enable-shared ${X264_DISABLE_ASM}
> > --extra-cflags=3D"${X264_ECFLAGS}"'
> >
> > Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I pushed your patch upstream in 0409d1d9 [1].

Please update the patch queue [2] with for example the following
command.

	$ pwclient update -s Accepted -c 0409d1d98a400c56d348de1f49c8a09f38b52fba =
3385

I do not have the rights to change the state of patches I did not
submit.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D0409d1d=
98a400c56d348de1f49c8a09f38b52fba
[2] http://openembedded.org/index.php/Patchwork

--=-Ixq2psSn3IwHlyqMNasK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GuFsACgkQPX1aK2wOHVh62gCfXDV90cxDxpJ6ltA1R8t0yVvt
To8An1nUTJVYyj6fulVoZTHZF6MR49lq
=Nv6V
-----END PGP SIGNATURE-----

--=-Ixq2psSn3IwHlyqMNasK--

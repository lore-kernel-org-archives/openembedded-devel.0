Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxmkj-0000P1-9K for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 21:42:02 +0200
Received: from f053032126.adsl.alicedsl.de ([78.53.32.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NxmhZ-0006sp-R3 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 19:38:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <l2y19c1b8a91004021119nf652910el438d98197a40c1db@mail.gmail.com>
References: <1270222876.3873.17.camel@mattotaupa>
	<l2y19c1b8a91004021119nf652910el438d98197a40c1db@mail.gmail.com>
Date: Fri, 02 Apr 2010 21:38:43 +0200
Message-ID: <1270237123.3714.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libplayer: Add `virtual/libx11` and `libxcb` to `DEPENDS`.
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
X-List-Received-Date: Fri, 02 Apr 2010 19:42:02 -0000
X-Groupsio-MsgNum: 18400
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yUozQ1wv6Y0M/CE2+5Sf"

--=-yUozQ1wv6Y0M/CE2+5Sf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 02.04.2010, 11:19 -0700 schrieb Khem Raj:
> On Fri, Apr 2, 2010 at 8:41 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > Without those dependencies libplayer would not work with MPlayer and co=
mplain.
> >
> >    =C2=BBlibplayer is not compiled with X11 support=C2=AB [1]
> >
> > [1] http://hg.geexbox.org/libplayer/file/4fb30e64db79/src/wrapper_mplay=
er.c#l2669
> >
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> >  recipes/libplayer/libplayer.inc |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes/libplayer/libplayer.inc b/recipes/libplayer/libpla=
yer.inc
> > index a986a21..823e4b5 100644
> > --- a/recipes/libplayer/libplayer.inc
> > +++ b/recipes/libplayer/libplayer.inc
> > @@ -2,9 +2,9 @@ DESCRIPTION =3D "libplayer is a multimedia A/V abstract=
ion layer API. Its goal is
> >  HOMEPAGE =3D "http://libplayer.geexbox.org/"
> >  SECTION =3D "libs/multimedia"
> >  LICENSE =3D "LGPLv2.1+"
> > -DEPENDS =3D "mplayer gstreamer"
> > +DEPENDS =3D "virtual/libx11 libxcb mplayer gstreamer"
>=20
> how about libxine

Well, I did not need it yet and I do not know if there are any
disadvantages (like performance issues) if more wrappers are enabled.
Since I own the BeagleBoard I want to use MPlayer and GStreamer since
there are patches for them to use all of the features of the hardware of
the BeagleBoard.

But anyway, that patch is definately about adding more wrappers but to
get MPlayer working whose dependency is there already.

I guess `libxine` can be added later if someone needs it or more tests
are done.

[=E2=80=A6]


Thanks,

Paul

--=-yUozQ1wv6Y0M/CE2+5Sf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku2R70ACgkQPX1aK2wOHVgEfACdHs23x6U3XD66dWc/c4INA5kc
NX4An0m0ypS0YIu6qwun0xaUBiI4wjpw
=Q4CE
-----END PGP SIGNATURE-----

--=-yUozQ1wv6Y0M/CE2+5Sf--

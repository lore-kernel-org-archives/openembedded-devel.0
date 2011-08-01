Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qo1cr-0004Hj-NB for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 01:10:21 +0200
Received: from f053038050.adsl.alicedsl.de ([78.53.38.50]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qo1Yi-0002eG-BH for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:06:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201108012226.03700.schnitzeltony@gmx.de>
References: <1311960660-7876-1-git-send-email-schnitzeltony@gmx.de>
	<1311963724.3882.85.camel@mattotaupa>
	<201108012226.03700.schnitzeltony@gmx.de>
Date: Tue, 02 Aug 2011 01:06:01 +0200
Message-ID: <1312239961.3640.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe] iceauth: Import from oe-dev and minor cleanup
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
X-List-Received-Date: Mon, 01 Aug 2011 23:10:21 -0000
X-Groupsio-MsgNum: 33466
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XDJMIqC+B3Ipg2mQ2VIt"

--=-XDJMIqC+B3Ipg2mQ2VIt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 01.08.2011, 22:26 +0200 schrieb Andreas Mueller:
> On Friday, July 29, 2011 08:22:04 PM Paul Menzel wrote:

> > Am Freitag, den 29.07.2011, 19:31 +0200 schrieb Andreas Mueller:
> >=20
> > When importing from somewhere please always reference the used commit i=
d
> > as requested in the guidelines [1]. Also mentioning the version in the
> > summary would be nice.
> >=20
> > 	iceauth: Import 1.0.4 from oe.dev
> >=20
> > > Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> > > ---
> > >=20
> > >  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |   10 ++++++++++
> > >  1 files changed, 10 insertions(+), 0 deletions(-)
> > >  create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.b=
b
> > >=20
> > > diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> > > b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb new file mode
> > > 100644
> > > index 0000000..e98c0cb
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> > > @@ -0,0 +1,10 @@
> > > +DESCRIPTION =3D "Tool for manipulating ICE protocol authorization re=
cords"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D13f70acf3c27f5f834bbc954d=
f775f8e"
> >=20
> > What license is it?
> As you said: MIT-X is included by xorg-app-common.inc
> >=20
> > > +PR =3D "${INC_PR}.0"
> > > +
> > > +DEPENDS +=3D " libice"
> >=20
> > This should go in front of PR according to the style guide [2].
> Do you want V2 with different sequence?

Well please send a patch iteration (v2) with the commit message changes
(commit summary and reference of oe.dev revision) but without the change
in the sequence. I left it that way since all other recipes in
`recipes/xorg-apps/` do it this way and that should be changed in one
run.

> > > +
> > > +require xorg-app-common.inc
> > > +
> > > +SRC_URI[md5sum] =3D "bb2e4d2611047f7c5a1a82ec956a9de4"
> > > +SRC_URI[sha256sum] =3D
> > > "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
> >=20
> > I will try to make the updates in oe.dev and maybe you can resync
> > afterward.
>
> Sorry for the impatience, but I am about to send out a patch series for x=
fce48=20
> and xfce4-session RDEPENDs on iceauth to work properly.

Unfortunately nobody of the =E2=80=9Ccore=E2=80=9D developers answered. (Li=
cense issues
are boring after all. ;-)) I pushed a tiny cleanup to oe.dev in 033af22d
[1].

I am sorry for the inconvenience.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D033af22=
d565adabc05303f88e76e31e7d239756c

--=-XDJMIqC+B3Ipg2mQ2VIt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk43MU4ACgkQPX1aK2wOHVhqiACfWnbWHazPwyuJnbRd+97KR3/t
Sm0An0Ae1YTUitw/CrZpg94NM3nYJsZs
=f6Sj
-----END PGP SIGNATURE-----

--=-XDJMIqC+B3Ipg2mQ2VIt--

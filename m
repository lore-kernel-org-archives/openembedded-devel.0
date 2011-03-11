Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Py3ld-0004cx-Kh for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 15:56:37 +0100
Received: from f053042227.adsl.alicedsl.de ([78.53.42.227]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Py3k3-0000ZB-Cg; Fri, 11 Mar 2011 14:54:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299837657.4137.23.camel@mattotaupa>
References: <1299805412.5437.31.camel@computer>
	<1299837657.4137.23.camel@mattotaupa>
Date: Fri, 11 Mar 2011 15:54:58 +0100
Message-ID: <1299855298.4137.51.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] transmission: add recipe for 2.22 version
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
X-List-Received-Date: Fri, 11 Mar 2011 14:56:37 -0000
X-Groupsio-MsgNum: 30077
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RgIisjH6nB2rSEGpKdZv"

--=-RgIisjH6nB2rSEGpKdZv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Graeme,


Am Freitag, den 11.03.2011, 11:00 +0100 schrieb Paul Menzel:

> Am Freitag, den 11.03.2011, 02:03 +0100 schrieb Lukas-David Gorris:
> > Depends on the the previously sent libevent bump.
>=20
> Using `git format-patch -2 -s` you can create patches where the
> dependencies are shown in the subject, e. g. [PATCH 1/2] and [PATCH
> 2/2].
>=20
> > From: Lukas-David Gorris <lukas.gorris@gmail.com>
> > Date: Fri, 11 Mar 2011 02:00:56 +0100
> > Subject: [oe] [PATCH] transmission: add recipe for 2.22 version
>=20
> As already written in another thread, your MUA mangled the patches.
> Please turn off automatic line wrapping (normal to preformatted) or
> using `git send-email`.
>=20
> Your Signed-off-by line is also missing as demanded by the commit policy
> [1].
>=20
> Secondly, I would appreciate if you could add to the commit message,
> what build configuration you tested your new recipe/patch with and if
> all operations worked when running it.
>=20
> > ---
> >  recipes/transmission/transmission_2.22.bb |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/transmission/transmission_2.22.bb
> >=20
> > diff --git a/recipes/transmission/transmission_2.22.bb
> > b/recipes/transmission/transmission_2.22.bb
> > new file mode 100644
> > index 0000000..e9a7891
> > --- /dev/null
> > +++ b/recipes/transmission/transmission_2.22.bb
> > @@ -0,0 +1,9 @@
> > +require transmission.inc
> > +
> > +DEPENDS +=3D "libevent"
> > +
> > +PR =3D ${INC_PR}.1
>=20
> You should start at 0.
>=20
> > +SRC_URI[archive.md5sum] =3D "6499986bf769276310b00bda1090090d"
> > +SRC_URI[archive.sha256sum] =3D "5a4079194f45260c143f21ea6f33ce2660d89f=
ca02ad8f1e65169968d365e4d4"

why did you commit in e124c44f [1] without my remarks being addressed?
Also the things you put into the commit message could have been left
out.


Thanks,

Paul


> [1] http://openembedded.org/index.php/Commit_Policy
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De124c44=
f14b887aec64c71d33120508cb033af6e

--=-RgIisjH6nB2rSEGpKdZv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk16N8IACgkQPX1aK2wOHVhf4gCfartifnoNCnqlaNNPgPMCSA94
qt0An2D0BT2EQQEP4Eq43gcLwF1/5j4H
=EANA
-----END PGP SIGNATURE-----

--=-RgIisjH6nB2rSEGpKdZv--

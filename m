Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5S5k-0003PU-Gr for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 01:47:41 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5S5M-0004X9-Pw for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 23:47:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikxb7jqcQMg3c+Qwff5RTCPCOvsMWOO3zPQcvyR@mail.gmail.com>
References: <1286827318-30576-1-git-send-email-schnitzeltony@gmx.de>
	<AANLkTikxb7jqcQMg3c+Qwff5RTCPCOvsMWOO3zPQcvyR@mail.gmail.com>
Date: Tue, 12 Oct 2010 01:47:15 +0200
Message-ID: <1286840835.3900.84.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gedit: add dependencies enchant & gnome-doc-utils-native
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
X-List-Received-Date: Mon, 11 Oct 2010 23:47:41 -0000
X-Groupsio-MsgNum: 24711
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zLxY55CXlXweGymWye1H"

--=-zLxY55CXlXweGymWye1H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 11.10.2010, 22:52 +0200 schrieb Frans Meulenbroeks:
> 2010/10/11 Andreas Mueller <schnitzeltony@gmx.de>:
> > * 'bitbake gedit' on clean system failed during
> > * configure: missing enchant
> > * compile: gedit.xml unknown "element article"
> >
> > Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> > ---
> >  recipes/gnome/gedit_2.30.0.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0=
.bb
> > index 83dffcf..4ab204c 100644
> > --- a/recipes/gnome/gedit_2.30.0.bb
> > +++ b/recipes/gnome/gedit_2.30.0.bb
> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "GNOME editor"
> >  SECTION =3D "x11/gnome"
> >  LICENSE =3D "GPL"
> >
> > -DEPENDS =3D "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2=
"
> > +DEPENDS =3D "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2=
 enchant gnome-doc-utils-native"
> >  RDEPENDS_${PN} +=3D " gtksourceview2"
> >  PR =3D "r2"
> >
> >
> I can understand from your commit message why you add enchant to
> DEPENDS, however it is not really clear why gnome-doc-utils-native is
> added. Is this because of the gedit.xml unknown?
> Can you clarify this in the commit message?

I resent this series [1=E2=80=934]. I tried to keep the meta data intact, b=
ut
Andreas it would be nice if you could check again.


Thanks,

Paul


[1] http://patchwork.openembedded.org/patch/3217/
[2] http://patchwork.openembedded.org/patch/3218/
[3] http://patchwork.openembedded.org/patch/3219/
[4] http://patchwork.openembedded.org/patch/3220/

--=-zLxY55CXlXweGymWye1H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyzogMACgkQPX1aK2wOHVjRTQCdG+1sHjkzyYTXaFnFP0wrkJp0
QtoAn0alnpH1OG7TnnGU9w4UFsJ4ad2K
=W5EG
-----END PGP SIGNATURE-----

--=-zLxY55CXlXweGymWye1H--

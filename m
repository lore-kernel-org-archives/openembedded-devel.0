Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nr6Oe-0000vD-4T
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:15:40 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 15 Mar 2010 10:12:34 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 15 Mar 2010 10:11:34 +0100
Received: from badebec ([82.60.124.194]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 15 Mar 2010 10:11:33 +0100
Date: Mon, 15 Mar 2010 10:11:26 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Khem Raj <raj.khem@gmail.com>
Message-Id: <20100315101126.1bb65e82.ospite@studenti.unina.it>
In-Reply-To: <19c1b8a91003121216q7e6c0e7bwad4c6ef98e5578fa@mail.gmail.com>
References: <20100305092145.6037080d.ospite@studenti.unina.it>
	<1268396830-12108-1-git-send-email-ospite@studenti.unina.it>
	<19c1b8a91003121216q7e6c0e7bwad4c6ef98e5578fa@mail.gmail.com>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 15 Mar 2010 09:11:33.0453 (UTC)
	FILETIME=[81D1EFD0:01CAC41F]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] distros: remove leading dots in DISTRO_VERSIONs
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
X-List-Received-Date: Mon, 15 Mar 2010 09:15:40 -0000
X-Groupsio-MsgNum: 17626
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__15_Mar_2010_10_11_26_+0100_HKdzlSh0ty0Q0wTl"

--Signature=_Mon__15_Mar_2010_10_11_26_+0100_HKdzlSh0ty0Q0wTl
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Mar 2010 12:16:48 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Mar 12, 2010 at 4:27 AM, Antonio Ospite
> <ospite@studenti.unina.it> wrote:
> > Having a leading dot in DISTRO_VERSION will result in a '-.' string when
> > building archive names; this may lead to mistakenly think that somethin=
g is
> > missing in the archive name.
> >
> > Example:
> > minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-toolcha=
in.tar.bz2
> > =A0 =A0 =A0 ^^
> >
> > Remove the leading dot in DISTRO_VERSIONs to avoid such possible
> > confusion.
> >
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>=20
> looks ok to me
> Acked-by: Khem Raj <raj.khem@gmail.com>
>

Thanks Khem, is anyone going to apply this one?

Regards,
   Antonio

>=20
> > ---
> > Changes since RFC/v1:
> > Just strip the leading dot as suggested by Khem Raj.
> >
> > Thanks,
> > =A0 Antonio
> >
> > =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A0conf/distro/oplinux-uclibc.conf | =A0 =A02 +-
> > =A0conf/distro/oplinux.conf =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A03 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> > index 8e0ae2e..7aa6c58 100644
> > --- a/conf/distro/minimal.conf
> > +++ b/conf/distro/minimal.conf
> > @@ -11,7 +11,7 @@
> > =A0# NAME and VERSION
> > =A0####################################################################=
#########
> > =A0DISTRO_NAME ?=3D "minimal"
> > -DISTRO_VERSION =3D ".dev-snapshot-${SRCDATE}"
> > +DISTRO_VERSION =3D "dev-snapshot-${SRCDATE}"
> > =A0#DISTRO_TYPE =3D "release"
> > =A0DISTRO_TYPE ?=3D "debug"
> >
> > diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-ucli=
bc.conf
> > index b8617cc..480602b 100644
> > --- a/conf/distro/oplinux-uclibc.conf
> > +++ b/conf/distro/oplinux-uclibc.conf
> > @@ -21,7 +21,7 @@ require conf/distro/include/sane-srcdates.inc
> > =A0# Header
> > =A0#
> > =A0DISTRO_NAME =3D "OPLinux-uClibC"
> > -DISTRO_VERSION =3D ".dev-snapshot-${SRCDATE}"
> > +DISTRO_VERSION =3D "dev-snapshot-${SRCDATE}"
> > =A0#DISTRO_TYPE =3D "release"
> > =A0DISTRO_TYPE =3D "debug"
> >
> > diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
> > index 43e8fad..b64477c 100644
> > --- a/conf/distro/oplinux.conf
> > +++ b/conf/distro/oplinux.conf
> > @@ -25,7 +25,7 @@ require conf/distro/include/sane-srcdates.inc
> > =A0# Header
> > =A0#
> > =A0DISTRO_NAME =3D "OPLinux"
> > -DISTRO_VERSION ?=3D ".dev-snapshot-${SRCDATE}"
> > +DISTRO_VERSION ?=3D "dev-snapshot-${SRCDATE}"
> > =A0#DISTRO_TYPE =3D "release"
> > =A0DISTRO_TYPE =3D "debug"
> >
> > --
> > 1.7.0
> >
> >
>=20


--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Mon__15_Mar_2010_10_11_26_+0100_HKdzlSh0ty0Q0wTl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkud+b4ACgkQ5xr2akVTsAGqZgCfbMk0q9SWcfBOSzdgBjBDo908
2EcAn1KH0P7NbTs1rMenpH/0F15N/EYG
=8akB
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Mar_2010_10_11_26_+0100_HKdzlSh0ty0Q0wTl--

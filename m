Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NxZUV-000544-FW
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 07:32:24 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NxZRI-0001gp-8N
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 09:29:08 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Apr 2010 09:25:59 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1270152215-17642-1-git-send-email-khimov@altell.ru>
	<1270152215-17642-2-git-send-email-khimov@altell.ru>
	<20100401211818.GA5580@gmail.com>
In-Reply-To: <20100401211818.GA5580@gmail.com>
MIME-Version: 1.0
Message-Id: <201004020926.03749.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] sarg: new recipe
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
X-List-Received-Date: Fri, 02 Apr 2010 05:32:24 -0000
X-Groupsio-MsgNum: 18384
Content-Type: multipart/signed; boundary="nextPart2357442.Mc7feHKXIe";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2357442.Mc7feHKXIe
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 02 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 01:18:18 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > diff --git a/recipes/sarg/sarg_2.2.7.1.bb b/recipes/sarg/sarg_2.2.7.1.bb
> > new file mode 100644
> > index 0000000..77d6a72
> > --- /dev/null
> > +++ b/recipes/sarg/sarg_2.2.7.1.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "Squid Analysis Report Generator"
> > +SECTION =3D "network"
>=20
> may be it should be in 'web' section ?

I can't find it here:
http://docs.openembedded.org/usermanual/html/section_variable.html

and there is only one recipe currently that use 'web' SECTION.

Although, thinking a little bit more, it might fit well into 'utils' sectio=
n,=20
since it's not a network application by itself, it just analyzes squid logs.

> > +DEPENDS =3D "gd-ft"
> > +RDEPENDS =3D "squid"
>=20
> may be squid should be a RSUGGESTS ?

ACK, fixed.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2357442.Mc7feHKXIe
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAku1f+sACgkQXJ70z+XgVcN0uQCggIJfN3k7BxQxgkt8/dfdlIgf
f0gAn2NcGsHmPmrC/mACPOIua88r9xmL
=OAJo
-----END PGP SIGNATURE-----

--nextPart2357442.Mc7feHKXIe--

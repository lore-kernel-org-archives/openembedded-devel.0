Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Ozr1A-0007nQ-No
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 15:11:49 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Ozr0x-0000oh-EY
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 17:11:39 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Sep 2010 17:11:30 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <20100926124317.GR28423@ibawizard.net>
In-Reply-To: <20100926124317.GR28423@ibawizard.net>
MIME-Version: 1.0
Message-Id: <201009261711.33733.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Strange bluez dependency for ppp
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
X-List-Received-Date: Sun, 26 Sep 2010 13:11:49 -0000
X-Groupsio-MsgNum: 24023
Content-Type: multipart/signed; boundary="nextPart4336880.86BQTBfGAm";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4336880.86BQTBfGAm
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 26 =D1=
=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2010 16:43:17 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Petr =C5=A0tetiar=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> I've added ppp to my image based on minimal-image. To my surprise it
>  dragged in over 2000 more packages. It's caused by libpcap which depends
>  on bluez-libs. My minimal-image with ppp =3D 3541 tasks/packages and same
>  minimal-image with ppp, but with removed bluez-utils dependency from
>  libcap =3D 1300 tasks/packages. I wonder how to fix it correctly in OE,
>  since I've found this patch[1]. Thanks for the suggestions.
>=20
> 1. http://patchwork.openembedded.org/patch/329/

$ egrep "(DISTRO|COMBINED)_FEATURES" recipes/*/* | wc -l
107

[shurgs]

Though you can also use=20

PREFERRED_PROVIDER_bluez-libs =3D "bluez-libs"

for your distro.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart4336880.86BQTBfGAm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkyfRoUACgkQXJ70z+XgVcOiewCbBse64x0KxUiPVLWA+heTAVXs
448An0r9GqJ1TSv0xkCzn2GdbamJubFI
=KjoH
-----END PGP SIGNATURE-----

--nextPart4336880.86BQTBfGAm--

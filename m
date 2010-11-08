Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1PFYL5-00046u-EX
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 21:29:16 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PFYKB-0007pY-MM
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 23:28:20 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Nov 2010 23:28:13 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1288774920.3980.29.camel@mattotaupa>
	<201011080000.52045.roman@khimov.ru>
	<1289229466.5165.56.camel@mattotaupa>
In-Reply-To: <1289229466.5165.56.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201011082328.17989.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: perl_5.8.8: fails with `ld: cannot find -lnsl`
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
X-List-Received-Date: Mon, 08 Nov 2010 20:29:16 -0000
X-Groupsio-MsgNum: 26020
Content-Type: multipart/signed; boundary="nextPart1696001.nNARL94uuZ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1696001.nNARL94uuZ
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =CF=EE=ED=E5=E4=E5=EB=FC=ED=E8=EA 08=
 =ED=EE=FF=E1=F0=FF 2010 18:17:46 =E0=E2=F2=EE=F0 Paul Menzel =ED=E0=EF=E8=
=F1=E0=EB:
> I forgot to mention that I have the following in my `local.conf`.
>=20
>         PREFERRED_UCLIBC_VERSION        =3D "git"

Yeah, thanks. So it really all boils down to perl.h test failing in libprel=
ude=20
with "field '_crypt_struct' has incomplete type".

And guess what, it builds just fine with perl 5.10.1, so no, I'm not diggin=
g=20
into 5.8.8 problems.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1696001.nNARL94uuZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkzYXWEACgkQXJ70z+XgVcNpvQCfUCqLueNLlUwuDTbE29m6jzvH
fhsAn0LaKMU6rRNJRfCxnSwyHD1aoe/U
=CR3a
-----END PGP SIGNATURE-----

--nextPart1696001.nNARL94uuZ--

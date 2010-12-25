Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PWYUn-00080i-Ki
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 19:05:33 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PWYUc-0006cV-FO
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:05:24 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 21:05:16 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<1293274109-15695-3-git-send-email-khimov@altell.ru>
	<4D162AF0.3050608@gmail.com>
In-Reply-To: <4D162AF0.3050608@gmail.com>
MIME-Version: 1.0
Message-Id: <201012252105.20486.roman@khimov.ru>
Subject: Re: [PATCH 3/5] perl-native: fix ExtUtils::Liblist::Kid library check for cross-build
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
X-List-Received-Date: Sat, 25 Dec 2010 18:05:33 -0000
X-Groupsio-MsgNum: 27506
Content-Type: multipart/signed; boundary="nextPart1533329.qQQLXRhOQg";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1533329.qQQLXRhOQg
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 25 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 20:33:36 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> > MakeMaker uses it to check for libraries presence and if the library is
> > not found in host dirs (/lib, /usr/lib, etc) it fails with messages lik=
e:
> >
> > Note (probably harmless): No library found for -lpcap
> >
> > Unfortunately it's not harmless, since MakeMaker removes such libs from
> > flags passed to link target modules which obviously breaks them.
> >
> > As I don't know exact semantic and all use-cases of libpth config
> > variable I've workarounded this issue by prepending ldflags (and this
> > does contain the right path) to lib flags.
> >
> > Signed-off-by: Roman I Khimov<khimov@altell.ru>
>=20
> is this a problem for perl-native or target perl ?

=46or target perl libraries. Seen that on Net::PCAP, the package built fine=
, but=20
the actual library wasn't linked to pcap, thus not working. But in order fo=
r=20
target perl libraries to build properly native perl needs to be patched.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1533329.qQQLXRhOQg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0WMmAACgkQXJ70z+XgVcNMUwCfa7BHLA875pUdOmMTBBRzEt5F
PJEAoOIImhHJ8MP7Y3Bv1qp9RFwuQI8Z
=jJBZ
-----END PGP SIGNATURE-----

--nextPart1533329.qQQLXRhOQg--

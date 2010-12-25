Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PWYoD-0008Eq-6F
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 19:25:37 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PWYo2-0006dz-Tm
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:25:27 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 21:25:18 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<1293274109-15695-2-git-send-email-khimov@altell.ru>
	<4D162A49.8060009@gmail.com>
In-Reply-To: <4D162A49.8060009@gmail.com>
MIME-Version: 1.0
Message-Id: <201012252125.25836.roman@khimov.ru>
Subject: Re: [PATCH 2/5] perl 5.10.1: fix Time::HiRes cross-compilation
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
X-List-Received-Date: Sat, 25 Dec 2010 18:25:37 -0000
X-Groupsio-MsgNum: 27507
Content-Type: multipart/signed; boundary="nextPart1467793.1h7oI2UhUK";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1467793.1h7oI2UhUK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 25 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 20:30:49 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> > We can't do 'run' check, so let's hope compile check is enough.
> > Fixes
> >
> > Time::HiRes::nanosleep(): unimplemented in this platform
> >
> > error.
> >
> > Signed-off-by: Roman I Khimov<khimov@altell.ru>
>=20
> is it possible to cache the vars instead? that will be better to keep
> list of variables that are not runchecked

Well, glancing at code another time, it probably could be solved via=20
d_nanosleep in Config.sh. I think it's safe to assume that all of our targe=
ts=20
implement nanosleep().

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1467793.1h7oI2UhUK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0WNxUACgkQXJ70z+XgVcO7AACeN0VJqrYlsIxdyF60SdtChleO
OZ0AoNIPdo8Ctci0N7oGJhQG8bhfsib4
=UxAC
-----END PGP SIGNATURE-----

--nextPart1467793.1h7oI2UhUK--

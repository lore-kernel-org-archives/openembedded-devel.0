Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PWk3f-0003eM-SY
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Dec 2010 07:26:20 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PWk3R-0007Yi-2M
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Dec 2010 09:26:07 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Dec 2010 09:26:00 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<201012252125.25836.roman@khimov.ru> <4D164CB7.8010509@gmail.com>
In-Reply-To: <4D164CB7.8010509@gmail.com>
MIME-Version: 1.0
Message-Id: <201012260926.04192.roman@khimov.ru>
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
X-List-Received-Date: Sun, 26 Dec 2010 06:26:20 -0000
X-Groupsio-MsgNum: 27519
Content-Type: multipart/signed; boundary="nextPart1905847.G9RgQDTsKX";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1905847.G9RgQDTsKX
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 25 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 22:57:43 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 12/25/2010 10:25 AM, Roman I Khimov wrote:
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 25 =D0=B4=D0=B5=D0=BA=D0=B0=
=D0=B1=D1=80=D1=8F 2010 20:30:49 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> >>> We can't do 'run' check, so let's hope compile check is enough.
> >>> Fixes
> >>>
> >>> Time::HiRes::nanosleep(): unimplemented in this platform
> >>>
> >>> error.
> >>>
> >>> Signed-off-by: Roman I Khimov<khimov@altell.ru>
> >>
> >> is it possible to cache the vars instead? that will be better to keep
> >> list of variables that are not runchecked
> >
> > Well, glancing at code another time, it probably could be solved via
> > d_nanosleep in Config.sh. I think it's safe to assume that all of our
> > targets implement nanosleep().
>=20
> hmmm, I would be skeptical on the assumption=20

If you're skeptical about it, then I think it's better to leave the automat=
ic=20
test as it is now (patched). Because the run part of it comes from very rar=
e=20
corner-cases, there is a comment in test program:

    ret =3D nanosleep(&ts1, &ts2); /* E.g. in AIX nanosleep() fails and set=
s=20
errno to ENOSYS. */

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1905847.G9RgQDTsKX
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0W3/wACgkQXJ70z+XgVcNmxwCginHq1PUQeTnATvTVb3Itk8Qb
w+cAn0+c+EPgP9NBbNWSQnhfD5d1degX
=NG2D
-----END PGP SIGNATURE-----

--nextPart1905847.G9RgQDTsKX--

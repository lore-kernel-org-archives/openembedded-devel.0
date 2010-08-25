Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OoJq5-0001wg-0h
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 19:32:45 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OoJpW-0006Jz-At
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 21:32:11 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Aug 2010 21:31:28 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTimd9f1LPJ8f7Bi1+8V7T8dJ-C+3m5NxgWGQ8Tuw@mail.gmail.com>
In-Reply-To: <AANLkTimd9f1LPJ8f7Bi1+8V7T8dJ-C+3m5NxgWGQ8Tuw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008252132.03713.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: squid: remove 2.x versions
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
X-List-Received-Date: Wed, 25 Aug 2010 17:32:45 -0000
X-Groupsio-MsgNum: 22650
Content-Type: multipart/signed; boundary="nextPart1316274.UA1j6CRBnR";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1316274.UA1j6CRBnR
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 25 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=
=B0 2010 21:12:02 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Frans Meulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Triggered by the recent commit from Roman:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db0f0b3ab8=
7cf8
> 5c76498b57f8300539d133efa6f There are various DoS issues resolved in 3 th=
at
>  are not resolved in 2.x (http://www.squid-cache.org/Advisories/)
>=20
> 2.6 is not a recommended version any more. 2.7 is lagging a version
> (latest is stable9).
> I propose to remove the 2.x versions and keep only 3.1.7

I'd remove 2.6 and leave 2.7 since AFAIK it is officially maintained (STABL=
E9=20
has almost no changes compared to STABLE8, I've seen that and not bothered =
to=20
update even when we've been on 2.7):
http://www.squid-cache.org/Versions/v2/2.7/changesets/SQUID_2_7_STABLE9.html

3.x and 2.x branches are very different so there are situations where 3.x h=
as=20
a bug and 2.x doesn't (3.1.6 bug is in this category)

2.x also has some features 3.x doesn't:
http://www.squid-cache.org/Versions/v3/3.1/RELEASENOTES.html#s6

2.6, especially since it's STABLE14 and no one cares to update it to latest=
=20
STABLE, yes, good candidate for removal.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1316274.UA1j6CRBnR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkx1U5MACgkQXJ70z+XgVcOIwACfTh1eZ+l812l/zEkDB0EZ94pS
m5wAn3g0hzj9CqslWnFYn24n3w2e1jhv
=j/Pb
-----END PGP SIGNATURE-----

--nextPart1316274.UA1j6CRBnR--

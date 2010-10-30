Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1PC5V1-0006ha-KY
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 09:05:33 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PC5U5-0007sK-R1
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 11:04:15 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Oct 2010 11:04:01 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <20101029191718.GA27520@gmail.com>
In-Reply-To: <20101029191718.GA27520@gmail.com>
MIME-Version: 1.0
Message-Id: <201010301104.08894.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Sat, 30 Oct 2010 07:05:34 -0000
X-Groupsio-MsgNum: 25629
Content-Type: multipart/signed; boundary="nextPart39043700.bNEyxjqnv0";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart39043700.bNEyxjqnv0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 29 =D0=BE=D0=BA=D1=82=D1=8F=D0=
=B1=D1=80=D1=8F 2010 23:17:18 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> binutils =3D 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91.=
0.6,
> 2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.1=
8,
> 2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
> 2.20.1, cvs

On 2.20.1 here, probably leaving 2.18+ should be fine, although quick grep =
at=20
conf/ shows almost all versions pinned in some way.

> gcc =3D 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4.=
1.2,
> 4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
> 4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3

Using 4.4.4, so technically not care about anything other than 4.4.x and=20
4.5.x. But I think it's definitely time to kill 3.x. I'd opt for leaving 4.=
2+=20
and one patchlevel version per minor. Is there any real point in having 4=20
4.2.x or 4.3.x versions?

> glibc =3D 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.1,
> cvs

Not using that, but I'd say that killing it completely maybe is a bit too=20
much. 2.9+ or just one latest?

> uclibc =3D 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31, =
git

Using git. Leaving just 0.9.31 and git looks good to me.

> eglibc =3D 2.9, 2.10, 2.11, 2.12, svn

Not using that, no opinion.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart39043700.bNEyxjqnv0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkzLw2gACgkQXJ70z+XgVcNJJgCgiS0TzLJWE2Xl72mPFlfrugOw
q28AoMs2SLhDfrzS4+LuhHlwI2Tr7bEs
=cnst
-----END PGP SIGNATURE-----

--nextPart39043700.bNEyxjqnv0--

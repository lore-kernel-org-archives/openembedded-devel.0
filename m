Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OUZ5B-0002eG-Dr
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 07:46:38 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OUZ0a-0001jS-No
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 09:41:53 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Jul 2010 09:41:49 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>
	<1278021694.30247.438.camel@rex>
In-Reply-To: <1278021694.30247.438.camel@rex>
MIME-Version: 1.0
Message-Id: <201007020941.51886.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} Disable multilib in gcc recipes
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
X-List-Received-Date: Fri, 02 Jul 2010 05:46:38 -0000
X-Groupsio-MsgNum: 20665
Content-Type: multipart/signed; boundary="nextPart2486336.u002dHpUVx";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2486336.u002dHpUVx
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 02 =D0=B8=D1=8E=D0=BB=D1=8F 2010=
 02:01:34 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Richard Purdie =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> On Thu, 2010-07-01 at 00:14 -0700, Khem Raj wrote:
> > I would like to propose to remove building multilib with gcc recipes.
> > It creates problems
> > and we do not package correct bits on some platforms. As we tend to
> > build toolchains keeping in mind the machine it is targetting I think
> > multilib is not that significant
> >
> > Concerns ? comments?
>=20
> I'm backing this. Currently multilib is broken and for a good
> implementation we really needs a ground up proposal for how to handle it
> well. I'm starting to look into the problem FWIW so I'd appreciate being
> in the loop in any discussions.

Please take a look at "rik/amd64" branch. It is outdated, but shows the=20
general approach. We're using it for quite some time.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2486336.u002dHpUVx
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkwtfB8ACgkQXJ70z+XgVcPg/ACbBVagam7JYg2kuiPY6mr8rFZ6
+jkAnj8YQJggf2tDbpCa4m3ZUNFHhu5U
=L7jC
-----END PGP SIGNATURE-----

--nextPart2486336.u002dHpUVx--

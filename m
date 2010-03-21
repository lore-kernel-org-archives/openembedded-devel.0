Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NtJzz-0007Jc-ER
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 13:11:29 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NtJwz-0007Ie-BR
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 15:08:14 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Mar 2010 15:05:35 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003182212.31873.roman@khimov.ru> <ho2nad$5g4$1@dough.gmane.org>
In-Reply-To: <ho2nad$5g4$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201003211505.39554.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Sun, 21 Mar 2010 12:11:29 -0000
X-Groupsio-MsgNum: 17904
Content-Type: multipart/signed; boundary="nextPart2215530.uPDWIxyPPg";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2215530.uPDWIxyPPg
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 20 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 17:49:49 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Koen Kooi =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
> As a generic remark, can we have a master include file for INC_PR so
> perl modules get rebuilt automagically when something in perl changes?

Not sure how to do it best. Perl-only modules should survive most of versio=
n=20
bumps (BTW, we could handle those better with 'PACKAGE_ARCH =3D "all"'), mo=
dules=20
with binary components should work within patchlevel range (like 5.8.7 ->=20
5.8.8). Of course it's only if we're not changing Perl build itself in some=
=20
strange way, but I doubt that.

So, we could probably add Perl version to the PV, thus allowing perl PR bum=
ps=20
and rebuilding on version change. That could be made dependent on=20
PACKAGE_ARCH, so that Perl-only modules wouldn't be touched at all.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2215530.uPDWIxyPPg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkumC5MACgkQXJ70z+XgVcN34ACePmQGMzjSujAuh7yEwnTLHwEb
q94AoJ/1ceaI37lX+3M9VnHYjTqV0rTq
=q/Fc
-----END PGP SIGNATURE-----

--nextPart2215530.uPDWIxyPPg--

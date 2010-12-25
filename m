Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PWZ6Q-00006h-8u
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 19:44:26 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PWZ6C-0006fY-Un
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:44:17 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 21:44:08 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<4D162876.1000401@gmail.com>
In-Reply-To: <4D162876.1000401@gmail.com>
MIME-Version: 1.0
Message-Id: <201012252144.11796.roman@khimov.ru>
Subject: Re: [PATCH 1/5] perl: fix PERLCONFIGTARGET for multimach builds, move cpan vars
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
X-List-Received-Date: Sat, 25 Dec 2010 18:44:26 -0000
X-Groupsio-MsgNum: 27510
Content-Type: multipart/signed; boundary="nextPart1692613.M0SBZphsN9";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1692613.M0SBZphsN9
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 25 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 20:23:02 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> > Multimachine builds race staging Config_heavy-target.pl to native
> > directory. Solve that by changing PERLCONFIGTARGET variable semantics,
> > now it will contain $TARGET_SYS. Change perl patch and stage functions
> > accordingly.
> >
> > Also, move PERLCONFIGTARGET and other target-specific variable settings
> > from cpan to cpan-base as I think they're also useful for cpan_build and
> > anywhere else cpan-base is needed.
> >
> > Signed-off-by: Roman I Khimov<khimov@altell.ru>
> > ---
> >   classes/cpan-base.bbclass                          |   14
> > ++++++++++++-- classes/cpan.bbclass                               |   10
> > ---------- classes/cpan_build.bbclass                         |    4 ++=
=2D-
> > .../perl/perl-5.10.1/perl-configpm-switch.patch    |    6 +++---
> > recipes/perl/perl-5.8.8/perl-configpm-switch.patch |    6 +++---
> > recipes/perl/perl-native_5.10.1.bb                 |    2 +-
> >   recipes/perl/perl-native_5.8.8.bb                  |    2 +-
> >   recipes/perl/perl_5.10.1.bb                        |    4 ++--
> >   recipes/perl/perl_5.8.8.bb                         |    2 +-
> >   9 files changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
> > index a04f61c..53621ed 100644
> > --- a/classes/cpan-base.bbclass
> > +++ b/classes/cpan-base.bbclass
> > @@ -32,11 +32,21 @@ def perl_get_libdirs(d):
> >
> >   def is_target(d):
> >       if not bb.data.inherits_class('native', d):
> > -        return "yes"
> > -    return "no"
> > +        return bb.data.expand('${TARGET_SYS}', d)
> > +    return ""
>=20
> not that its wrong but I think you could also use MULTIMACH_ARCH instead
> of TARGET_SYS here

MULTIMACH_ARCH =3D "${PACKAGE_ARCH}"

So if there is a perl lib that is "PACKAGE_ARCH =3D all" it will use=20
Config_heavy-all.sh which won't exist if we don't symlink something there a=
nd=20
that raises a question of what to symlink. Also, I don't know whether it's=
=20
possible now, but in theory we can have builds with different target C=20
libraries reusing same native perl, so complete TARGET_SYS specification is=
=20
more appropriate IMO.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1692613.M0SBZphsN9
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0WO3sACgkQXJ70z+XgVcMcgQCgzg3ZWUFGQA7F+sW/mBi0g+eO
PJ8AoKYFM0GlYpdL1oTARlcEUhxeCttZ
=3bgi
-----END PGP SIGNATURE-----

--nextPart1692613.M0SBZphsN9--

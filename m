Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OUZOM-0005Gc-RP
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:06:28 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OUZJl-0001ku-II
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 10:01:43 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Jul 2010 10:01:38 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<1278023626.12473.22.camel@saphir> <4C2D193A.9060202@mentor.com>
In-Reply-To: <4C2D193A.9060202@mentor.com>
MIME-Version: 1.0
Message-Id: <201007021001.40829.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Fri, 02 Jul 2010 06:06:28 -0000
X-Groupsio-MsgNum: 20667
Content-Type: multipart/signed; boundary="nextPart15224383.aKbtQughqc";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart15224383.aKbtQughqc
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 02 =D0=B8=D1=8E=D0=BB=D1=8F 2010=
 02:39:54 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> Michael 'Mickey' Lauer wrote:
> > Am Donnerstag, den 01.07.2010, 23:29 +0100 schrieb Phil Blundell:
> >> On Thu, 2010-07-01 at 15:16 -0700, Tom Rini wrote:
> >>> One of the issues with some form of USE flags, and I believe this is
> >>> one of the big ones for Angstrom as well as any other public feed
> >>> publishing distribution is that having a single recipe that does
> >>> different things based on variables makes maintaining their feed (and
> >>> allowing users to publish their own compatible feeds) a nightmare.
> >>
> >> It's only a nightmare if the flags in question are user-frobbable.  If
> >> they are all nailed down in the DISTRO configuration (which
> >> DISTRO_FEATURES certainly ought to be), and those folks who want to
> >> build compatible binaries just leave them alone, then there oughtn't to
> >> be any real problem.  To that extent it doesn't really seem any
> >> different to the choice of compiler or tuning flags or glibc version or
> >> any of the other ways in which you can already produce incompatible
> >> binaries by flipping the wrong switches.
> >
> > Agreed. I think we should be more open to this concept. At least for
> > packages with optional (but "infecting") X11 support -- such as EFL -- I
> > plan to use such a mechanism soon.
>=20
> Putting on my devil's advocate hat again, unless something is really and
> truly locked down, it's going to get modified.  While most end users
> won't want to frob gcc versions, frobbing bluetooth or alsa or x11 or
> ... is more common.  For example, Gentoo.=20

IMO this is not that much of a problem for a thing like OE. I view OE as a=
=20
powerful tool that is used by developers to make products for end-users. As=
 a=20
developer I love an idea of USE-flags as that's what you generally do on=20
embedded device - tune it for specific use-cases, leaving only things you=20
really need.

And as for an end users, there are already tons of ways to make incompatibl=
e=20
package feeds for them: toolchain components versions, gcc flags, etc. Or t=
ake=20
a look at shadow recipe, for example, it has dynamic PAM dependency. And kn=
ow=20
what? I'd really love to see the same dynamic PAM dep for busybox, for=20
example, as we're building it with PAM support and with current state of=20
things there is no sane way I could bring such a change in oe.dev.

Real end users mostly follow one feed, I think. If they don't - they can be=
 in=20
trouble already. So there is not that much USE flags change here, IMO. And=
=20
with a mechanism to encode used USE flags in package name with proper=20
RPROVIDES and such I don't see any real problem at all.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart15224383.aKbtQughqc
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkwtgMQACgkQXJ70z+XgVcOnagCeIz+V9MHfAdFtykDnohqivTt9
D+4AoJz5hkICsEFYcCGQm5R/DjYdSANq
=MiPK
-----END PGP SIGNATURE-----

--nextPart15224383.aKbtQughqc--

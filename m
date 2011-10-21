Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHM3m-0008RB-Lm for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 22:51:22 +0200
Received: from f053040166.adsl.alicedsl.de ([78.53.40.166]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHLyH-0001oi-RO for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 20:45:42 +0000
Message-ID: <1319229929.3448.7.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 22:45:29 +0200
In-Reply-To: <4EA18A1F.9040409@telia.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
	<1319192173.3766.16.camel@mattotaupa> <4EA18A1F.9040409@telia.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] 2011.03-maintenance: Bad checksums in binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 20:51:22 -0000
X-Groupsio-MsgNum: 34977
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-0S0R8hJ8GH1GFD6lJOI7"

--=-0S0R8hJ8GH1GFD6lJOI7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ulf,


Am Freitag, den 21.10.2011, 17:05 +0200 schrieb Ulf Samuelsson:
> 2011-10-21 12:16, Paul Menzel skrev:

> > Am Freitag, den 21.10.2011, 06:42 +0000 schrieb Mats K=C3=A4rrman:
> >
> >> My first patch, please be gentle if i did something wrong ;)
> > our commit policy describes how patches should be formatted [1][2]. Mos=
t
> > importantly you forgot your Signed-off-by line.
> >
> >> The following patch is from a local branch tracking
> >> 2011.03-maintenance, should it be done different?
> I did a similar fix for binutils-2.20.1, and that is apparently not the w=
ay
> so this was rejected. (See other discussions on binutils this week).
>=20
> I sent a new version of binutils-2.20.1 patch today,
> which is taken from openembedded-core, and that
> combines the new checksums, with downloading a new tarball.
>=20
> If it follows the same scheme, then:
> binutils-2.18.tar.bz2 is only a link to binutils-2.18a.tar.bz2
> Your SRC_URI should be pointing at binutils-${PV}a.tar.bz2

you describe indeed the correct fix. Unfortunately the =E2=80=9Cwrong=E2=80=
=9D fix was
already committed so I just continued on this track. I also noted that
in my commit message.

Ulf thank you for the correct fix for 2.20.1 and Mats, if you have some
time it would be great if you could send a patch for what Ulf proposed.

[=E2=80=A6]


Thanks,

Paul


> > [1] http://www.openembedded.org/wiki/Commit_Policy
> > [2] http://www.openembedded.org/wiki/Category:Policy
> > [3] http://www.openembedded.org/wiki/2011.03-maintenance
> > [4] http://git.openembedded.org/openembedded/commit/?id=3Df2d53aa074d76=
509384e7bb8a9c39e2e27210f4a

--=-0S0R8hJ8GH1GFD6lJOI7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6h2ekACgkQPX1aK2wOHVhOEwCfU1Kse8ZFOFtTo9XnuIQgjmyh
wGAAnAu5D450/iI5qN1+PvMp80GhAej7
=X1Kb
-----END PGP SIGNATURE-----

--=-0S0R8hJ8GH1GFD6lJOI7--

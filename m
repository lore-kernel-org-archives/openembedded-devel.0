Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oa2rg-0002JM-P9 for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 10:35:21 +0200
Received: from g229060051.adsl.alicedsl.de ([92.229.60.51]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oa2rS-0002sx-AG for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 08:35:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i1qogv$i28$2@dough.gmane.org>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa>
	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com>
	<i1qogv$i28$2@dough.gmane.org>
Date: Sat, 17 Jul 2010 10:35:02 +0200
Message-ID: <1279355702.14848.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB big, since some executables are 100 MB each
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
X-List-Received-Date: Sat, 17 Jul 2010 08:35:21 -0000
X-Groupsio-MsgNum: 21083
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-114mPdjvqZj3d6AquYMb"

--=-114mPdjvqZj3d6AquYMb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 17.07.2010, 01:03 +0200 schrieb Koen Kooi:
> On 16-07-10 17:23, Khem Raj wrote:
> > On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
> > <paulepanter@users.sourceforge.net> wrote:

> >> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
> >>
> >>> I ran out of space and noticed
> >>>
> >>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
> >>>
> >>> is 8,1G big.
> >>>
> >>> Some of the executable files in
> >>>
> >>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-destd=
ir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
> >>>
> >>> are 101 MB big.
> >=20
> > its most probably the -g3/-ggdb3 bloat.
>=20
> No, it's git not creating (hard)links but copies of the same app. Run an
> md5sum on the binaries, they will all match. I suggest you stop
> spreading FUD about -ggdb3, it is not being appriciated.

I do not know anything about the technical background. I can only report
that removing `-ggdb3` fixed it for me.


Thanks,

Paul

--=-114mPdjvqZj3d6AquYMb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxBazYACgkQPX1aK2wOHVhxDQCdH0ScUspfoGi5BVhROxPwfj3L
jrYAoIxAI/r4RA9+z/rAFa3L4TnSBcQA
=scVA
-----END PGP SIGNATURE-----

--=-114mPdjvqZj3d6AquYMb--

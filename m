Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PsjgQ-0000HF-3x for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 23:29:14 +0100
Received: from f053042033.adsl.alicedsl.de ([78.53.42.33]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Psjf9-0004HC-9d for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 22:27:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110212205448.GA5098@gmail.com>
References: <AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
	<1295798887.12751.6.camel@mattotaupa>
	<1295812624.3570.13.camel@mattotaupa>
	<AANLkTi=0vr9MZ28ZtvzvpSGK0k39BjoXC-sH-fJZs4j_@mail.gmail.com>
	<1295832268.7645.54.camel@mattotaupa>
	<1296232598.21132.21.camel@mattotaupa>
	<1296495309.3819.0.camel@mattotaupa>
	<1297381611.3877.37.camel@mattotaupa>
	<AANLkTi=Ta_fk1kzBtKSqyXykNJdM1=Hqsv4QyGsW1ZyL@mail.gmail.com>
	<1297497230.6433.3.camel@mattotaupa> <20110212205448.GA5098@gmail.com>
Date: Thu, 24 Feb 2011 23:27:54 +0100
Message-ID: <1298586474.26090.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Thu, 24 Feb 2011 22:29:14 -0000
X-Groupsio-MsgNum: 29663
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-R1kfRsR/YWRRSG1FzAS/"

--=-R1kfRsR/YWRRSG1FzAS/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 12.02.2011, 12:54 -0800 schrieb Khem Raj:
> On (12/02/11 08:53), Paul Menzel wrote:
> > Am Freitag, den 11.02.2011, 09:37 -0800 schrieb Khem Raj:

[=E2=80=A6]

> > > vdr built fine on minimal-uclibc/qemuarm on latest oe/master
> >=20
> > I did too with a clean build directory and `minimal-uclibc`.
> >=20
> > 	MACHINE =3D "qemuarm" bitbake -k vdr
> >=20
> > It failed for me again.
> >=20
> > > unless its reproducible what you are seeing
> > > It will be hard to fix it.
> >=20
> > I can reproduce this every time when I build from a clean build
> > directory (`rm -rf minimal-uclibc-dev`).
>=20
> I see I think its due to catch 22 of gettext and libintl probably. Let me
> see if it can be reproduced here. As it builds fine into familiar images
> its not that critical

I could not reproduce that issue with commit faa2c615, i. e. current
master [11]. I do not know what changed.

[=E2=80=A6]


Thanks,

Paul


[11] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dfaa2c6=
15c811964d8d1b612851b6b80914a37e82

--=-R1kfRsR/YWRRSG1FzAS/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1m22oACgkQPX1aK2wOHVgPUwCgge5mfq8BtFTwoAOT7OOEjK7I
msIAniLyl7wOY/sHRhtioCtC6mZjBN++
=hEe3
-----END PGP SIGNATURE-----

--=-R1kfRsR/YWRRSG1FzAS/--

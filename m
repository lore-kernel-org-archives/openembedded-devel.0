Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Op7uz-0005uE-TW for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 01:01:18 +0200
Received: from e178250151.adsl.alicedsl.de ([85.178.250.151]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Op7uY-0008NK-HD for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 23:00:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100827222253.GA14561@denix.org>
References: <4C77D8E7.3030109@mlbassoc.com> <20100827222253.GA14561@denix.org>
Date: Sat, 28 Aug 2010 01:00:35 +0200
Message-ID: <1282950035.3844.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Fri, 27 Aug 2010 23:01:19 -0000
X-Groupsio-MsgNum: 22772
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5n5a6ZcULJ/cA+WKwasW"

--=-5n5a6ZcULJ/cA+WKwasW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 27.08.2010, 18:22 -0400 schrieb Denys Dmytriyenko:
> On Fri, Aug 27, 2010 at 09:25:27AM -0600, Gary Thomas wrote:
> > This patch addresses the problem where the TI tools that need
> > the EULA unpack into the wrong place if the user has write
> > permission in /opt.  The current behaviour of relying on the
> > unpacker to fall back to the $HOME environment variable should
> > not be relied on.  The patch changes the unpack step to use
> > the --prefix=3D option which will always work.
> >
> > Note: only tested with these [recent] packages:
> >   ti-cgt6x-1_6_1_9-r4
> >   ti-cgt6x-1_6_1_14-r4
> >   ti-codecs-omap3530-1_1_01_00-r2
> >   ti-dspbios-5_41_04_18-r1
> >   ti-edma3lld-01_11_00_03-r0
> >   ti-xdctools-3_16_01_27-r2
> >
> > --=20
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
>=20
> > From cab9a3f415527559aa33f708c59c1e2b7023eac3 Mon Sep 17 00:00:00 2001
> > From: Gary Thomas <gary@mlbassoc.com>
> > Date: Fri, 27 Aug 2010 09:01:20 -0600
> > Subject: [PATCH] Make EULA unpacking work when /opt is writeable
> >=20
> > Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> > ---
> >  meta-ti/packages/ti/ti-codecs-omap3530_1.00.01.bb |    1 +
> >  meta-ti/packages/ti/ti-codecs-omap3530_1.01.00.bb |    1 +
> >  meta-ti/packages/ti/ti-dspbios.inc                |    1 +
> >  meta-ti/packages/ti/ti-edma3lld.inc               |    1 +
> >  meta-ti/packages/ti/ti-eula-unpack.inc            |    5 ++++-
> >  meta-ti/packages/ti/ti-xdctools.inc               |    1 +
> >  6 files changed, 9 insertions(+), 1 deletions(-)
>=20
>=20
> Gary,
>=20
> Can you please redo the patch against the mainline OE development branch,=
=20
> because paths like meta-ti/packages/ti/* are not correct. Thanks.

And if you are sending another iteration, please add your text from your
message as a commit message. That would be great.

[=E2=80=A6]


Thanks,

Paul

--=-5n5a6ZcULJ/cA+WKwasW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx4Q5MACgkQPX1aK2wOHVg+OgCfS2Y3N3zXJAXJ6UonXPHUjeSA
8x4AnRRjWXoDMrSMtNVwFa8woT79uOn2
=XqYk
-----END PGP SIGNATURE-----

--=-5n5a6ZcULJ/cA+WKwasW--

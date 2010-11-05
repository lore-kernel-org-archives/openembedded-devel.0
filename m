Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEMoa-0001Ik-DU for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:58:49 +0100
Received: from f053040076.adsl.alicedsl.de ([78.53.40.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEMnl-0005Sz-0Y for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 13:57:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101105133847.GP3440@jama>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1288961484.3826.7.camel@mattotaupa>
	<AANLkTimzdQuJQ1Y5VpNJvF0Y1=1aFDzXL5g1u6LArpS3@mail.gmail.com>
	<1288963608.3826.15.camel@mattotaupa>  <20101105133847.GP3440@jama>
Date: Fri, 05 Nov 2010 14:57:55 +0100
Message-ID: <1288965475.3826.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Fri, 05 Nov 2010 13:58:49 -0000
X-Groupsio-MsgNum: 25909
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-k9e9OuNJg+NWlxTwTECq"

--=-k9e9OuNJg+NWlxTwTECq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 05.11.2010, 14:38 +0100 schrieb Martin Jansa:
> On Fri, Nov 05, 2010 at 02:26:48PM +0100, Paul Menzel wrote:
> > I agree.
> >=20
> > > Then if it is in the inc file, it needs to be taken out again when th=
e
> > > next version comes.
> >=20
> > Sorry, I did not make myself clear. My point was if you could put
> > `configure.ac-nios2.patch` into `libX11/` or `files`.
>=20
> better not to use files at all
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/0256=
73.html

Correct. I forgot.

> diet-x11_1.1.5.bb libx11-trim_1.1.5.bb will find it ok in libx11* dir,
> because of FILESPATHPKG .=3D ":libx11-${PV}:libx11" in libx11.inc
>=20
> but even when it's the same file I would keep it in separate dirs,
> because newer versions won't need it (hopefully) and then it will be
> removed with older versions.

That is a valid argument. Although then patches should never be share
between versions unless there is no upstream development anymore?

It is fine either way by me. So do as you prefer.

> > > Hence it was put in the individual files.
> > >=20
> > > BTW it looks like upstream might go for a slightly different patch.
> > > I'll leave it to Martin to decide whether to go for that one or for
> > > this one (he is on cc of the upstream correspondence).
> >=20
> > Again, could you provide a link to that discussion.
>=20
> http://lists.freedesktop.org/archives/xorg/2010-November/051731.html


Thanks,

Paul

--=-k9e9OuNJg+NWlxTwTECq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzUDWMACgkQPX1aK2wOHVh1wACdENArQy1m1a9KeOJpAxc+4+3O
C74AniugPkOtrxbACRxvqD3xV33feGTK
=Pnx8
-----END PGP SIGNATURE-----

--=-k9e9OuNJg+NWlxTwTECq--

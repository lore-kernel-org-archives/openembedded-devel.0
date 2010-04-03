Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ny1Rz-0006oy-Jf for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 13:24:44 +0200
Received: from f053033237.adsl.alicedsl.de ([78.53.33.237]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ny1Op-0000vr-LJ for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 11:20:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270237489.3714.11.camel@mattotaupa>
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
	<1270237489.3714.11.camel@mattotaupa>
Date: Sat, 03 Apr 2010 13:20:20 +0200
Message-ID: <1270293620.3692.33.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: autopoint || touch config.rpath (was: [PATCH v3] enna: Move to own recipe folder and update to new Enna hg repository.)
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
X-List-Received-Date: Sat, 03 Apr 2010 11:25:17 -0000
X-Groupsio-MsgNum: 18413
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0LBYlRMHnWwh6vDys/iz"

--=-0LBYlRMHnWwh6vDys/iz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 02.04.2010, 21:44 +0200 schrieb Paul Menzel:
> Am Freitag, den 02.04.2010, 11:28 -0700 schrieb Khem Raj:
> > On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel
> > <paulepanter@users.sourceforge.net> wrote:
>=20
> [=E2=80=A6]
>=20
> > > +do_configure_prepend() {
> > > +       autopoint || touch config.rpath
> > > +}
> >=20
> > empty config.rpath would build it wrongly isnt it. Probably this
> > should be removed
>=20
> That is the work around Koen suggested [1]. Koen, can you comment
> please.

I do not know, if I should have answered in the thread of [1], but
anyway.

Is

        do_configure_prepend() {
                autopoint || automake --add-missing
        }

a viable solution [2]? Or is this just the same as removing
`EXTRA_AUTORECONF =3D "--exclude=3Dautopoint"` from `autotools.bbclass`?

The configure went fine for me.


Thanks,

Paul


> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/01=
8800.html
[2] http://www.mail-archive.com/automake-patches@gnu.org/msg00479.html

--=-0LBYlRMHnWwh6vDys/iz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku3JHQACgkQPX1aK2wOHVgw8ACfbZ7C+imoW0CmDB8Zfm4t7R7f
3f8AniGvZzos+lNzxVbnkRUpJuJXrra7
=VP2m
-----END PGP SIGNATURE-----

--=-0LBYlRMHnWwh6vDys/iz--

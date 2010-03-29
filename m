Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwL20-0007uu-1b for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 21:53:53 +0200
Received: from f053040123.adsl.alicedsl.de ([78.53.40.123]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwKyu-00047b-0Z for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 19:50:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <e2e2e5501003290204v44f677f0s401d0e729cb05dd6@mail.gmail.com>
References: <e2e2e5501003290204v44f677f0s401d0e729cb05dd6@mail.gmail.com>
Date: Mon, 29 Mar 2010 21:50:38 +0200
Message-ID: <1269892238.5924.3.camel@mattotaupa>
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
Subject: Re: Downgrading the kernel
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
X-List-Received-Date: Mon, 29 Mar 2010 19:53:55 -0000
X-Groupsio-MsgNum: 18233
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-w9K7OfOosqudf+0SDDeT"

--=-w9K7OfOosqudf+0SDDeT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Izak,


Am Montag, den 29.03.2010, 11:04 +0200 schrieb Izak Burger:
> First post for me on this list, so I appologise if this is documented els=
ewhere.

Welcome!

[=E2=80=A6]

> Without getting into the specifics and the ethics of clones, or the
> specifics of how I downgraded to bootloader and unbricked it, my goals
> are to work around enough of this so I can get on with the task at
> hand, and for this I need to downgrade the kernel from 2.6.18 to
> 2.6.12, in order for the older binary-only kernel modules to work with
> it (the older modules don't check the bootloader).
>=20
> So far I haven't been able to figure out exactly what needs changing
> to select the kernel version, and I'm also unsure what other packages
> might be affected. Alternatively, I could also just stick with 1.5,
> which seems to have the 2.6.12 kernel from a cursory glance. Any
> advice will be much appreciated.

You can use `PREFERRED_VERSION_RecipeName` in your local.conf as far as
I know. So look for =C2=BBPREFERRED_VERSION=C2=AB and also =C2=BBDEFAULT_PR=
EFERENCE=C2=AB.


Thanks,

Paul

--=-w9K7OfOosqudf+0SDDeT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuxBIcACgkQPX1aK2wOHVhwrgCfQn5HzjpwBVXen5NJER2vl/5D
4x4An0ksLkEPpZDNbtaSJ+BMG51LviDV
=bbpd
-----END PGP SIGNATURE-----

--=-w9K7OfOosqudf+0SDDeT--

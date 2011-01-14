Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PdmJH-0007dE-Pn for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 17:15:31 +0100
Received: from f053042123.adsl.alicedsl.de ([78.53.42.123]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PdmIj-0007k1-0v for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 16:14:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D307445.4090901@dresearch.de>
References: <AANLkTim9j=t8uDyabZbN4epTC-JwfmktyERydQsxxjyx@mail.gmail.com>
	<4D307445.4090901@dresearch.de>
Date: Fri, 14 Jan 2011 17:14:55 +0100
Message-ID: <1295021695.3578.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: testing branch 2011-01-13 - do_configure python failed
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
X-List-Received-Date: Fri, 14 Jan 2011 16:15:31 -0000
X-Groupsio-MsgNum: 28049
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yI7VCwtAkA2KPwhP/zbj"

--=-yI7VCwtAkA2KPwhP/zbj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 14.01.2011, 17:05 +0100 schrieb Steffen Sledz:
> do_configure python - 2.6.5 - ml12.2 failed with:
>=20
> checking getaddrinfo bug... buggy
> Fatal: You must get working getaddrinfo() function.
>        or you can specify "--disable-ipv6".
> ERROR: Function do_configure failed
>=20
> see <http://tinderbox.openembedded.net/packages/1709663/>

I already reported that to the list this morning [1][2].

Probably the patch is not correct, INCPR should be iterated, but it
fixes local builds for people not needing IPv6.

Please discuss this further in the other thread.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/02=
8755.html
[2] http://patches.openembedded.org/patch/281/

--=-yI7VCwtAkA2KPwhP/zbj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0wdn8ACgkQPX1aK2wOHViiywCgi0teNgfaNMcxcY2HY3krbxbJ
WZAAn3OdhfQzEM8E/kDlvd0TIf+Y8Lfp
=TsYt
-----END PGP SIGNATURE-----

--=-yI7VCwtAkA2KPwhP/zbj--

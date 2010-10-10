Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4zRt-0003Bi-G4 for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:12:37 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4zRX-0002BO-5q for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 17:12:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286728355.3808.55.camel@mattotaupa>
References: <1286728355.3808.55.camel@mattotaupa>
Date: Sun, 10 Oct 2010 19:12:13 +0200
Message-ID: <1286730733.3808.92.camel@mattotaupa>
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
Subject: Re: environment variable `PKG_CONFIG` not set
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
X-List-Received-Date: Sun, 10 Oct 2010 17:12:37 -0000
X-Groupsio-MsgNum: 24615
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ngzG/gaLx54ZNvEEB5TG"

--=-ngzG/gaLx54ZNvEEB5TG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 18:32 +0200 schrieb Paul Menzel:
> Dear OE folks,
>=20
>=20
> looking at `run.do_compile.xxxxx` I noticed that `PKG_CONFIG` is not
> set. Several other pkg-config related environment variable get set, so I
> am quite surprised.
>=20
> Does this have to be added to `classes/{native,nativesdk,sdk}.bbclass`?

This would also be the =E2=80=9Ccorrect=E2=80=9D fix for [1] and [2] if I a=
m not wrong.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/023=
029.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/=
024217.html

--=-ngzG/gaLx54ZNvEEB5TG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyx8+0ACgkQPX1aK2wOHVjAYgCeMIlPcpL6qMUt3E3rogjqOlI1
aC4Ani/v7awbem1m2o1MComGp7KI1b/X
=BqpP
-----END PGP SIGNATURE-----

--=-ngzG/gaLx54ZNvEEB5TG--

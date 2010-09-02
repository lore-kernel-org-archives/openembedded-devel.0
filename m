Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Or5xU-0001Su-1b for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:19:49 +0200
Received: from f053037242.adsl.alicedsl.de ([78.53.37.242]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Or5wx-0006Jr-40 for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 09:19:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283417769-26234-1-git-send-email-noor_ahsan@mentor.com>
References: <1283417769-26234-1-git-send-email-noor_ahsan@mentor.com>
Date: Thu, 02 Sep 2010 11:19:12 +0200
Message-ID: <1283419152.3990.9.camel@mattotaupa>
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
Subject: Re: [PATCH] sqlite3: Merged target and native recipe using BBCLASSEXTEND
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
X-List-Received-Date: Thu, 02 Sep 2010 09:19:49 -0000
X-Groupsio-MsgNum: 23063
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uGd/ENb3VpVXNfFwGj3J"

--=-uGd/ENb3VpVXNfFwGj3J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Noor,


your commit summary is a bit misleading, since there does not seem to
have ever been a native recipe for 3.6.23.1. So I think =C2=BBextend=C2=AB =
instead
of =C2=BBmerge=C2=AB would have been better.

Am Donnerstag, den 02.09.2010, 14:56 +0600 schrieb Noor Ahsan:
> * Set BBCLASSEXTEND to "native" to use target recipe as native recipe
> * In include file tcl-native was present in DEPENDS list, remove it from =
DEPENDS list by setting DEPENDS_virtclass-native =3D "readline-native ncurs=
es-native"
> * Bump PR "${INC_PR}.1"
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

[=E2=80=A6]

Do you know if the other SQlite recipes can be converted too or are you
already on it?


Thanks,

Paul

--=-uGd/ENb3VpVXNfFwGj3J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx/bBAACgkQPX1aK2wOHVgnqwCeO3LRc/Ek+wY+TGJcZtjQqKfu
qHMAnjy2dMpiV4O4N8bHsudDtJjdU/7U
=C70n
-----END PGP SIGNATURE-----

--=-uGd/ENb3VpVXNfFwGj3J--

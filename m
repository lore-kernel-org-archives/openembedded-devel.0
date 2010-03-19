Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsYZW-0007uG-Gs for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 10:32:54 +0100
Received: from f053035070.adsl.alicedsl.de ([78.53.35.70]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsYWZ-0008Ag-Eu for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 09:29:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
References: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
Date: Fri, 19 Mar 2010 10:29:46 +0100
Message-ID: <1268990986.3893.5.camel@mattotaupa>
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
Subject: Re: [PATCH] libunwind: new recipe
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
X-List-Received-Date: Fri, 19 Mar 2010 09:32:54 -0000
X-Groupsio-MsgNum: 17850
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-St21LtzSQE3Mu3RfwZl9"

--=-St21LtzSQE3Mu3RfwZl9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 17.03.2010, 21:22 +0100 schrieb Steffen Sledz:

[=E2=80=A6]

> diff --git a/recipes/libunwind/libunwind.inc b/recipes/libunwind/libunwin=
d.inc
> new file mode 100644
> index 0000000..8513dc2
> --- /dev/null
> +++ b/recipes/libunwind/libunwind.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
> +DEPENDS =3D ""

Remove this empty variable?

[=E2=80=A6]

> +SRC_URI =3D "http://download.savannah.nongnu.org/releases/libunwind/${PN=
}-${PV}.tar.gz;name=3Darchive"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"

You can make this shorter. ${P} =3D ${PN}-${PV}

[=E2=80=A6]


Thanks,

Paul

--=-St21LtzSQE3Mu3RfwZl9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkujRAkACgkQPX1aK2wOHVi8ywCfVf5ei9yJ+UyF39IQ9fVdiFg0
y2EAn2f0GrWQu3xu2a6ck5ofDn3U8Uyw
=/Gz2
-----END PGP SIGNATURE-----

--=-St21LtzSQE3Mu3RfwZl9--

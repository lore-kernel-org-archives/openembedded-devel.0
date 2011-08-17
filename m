Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtbFC-0008Lx-L8 for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 10:12:58 +0200
Received: from f053037177.adsl.alicedsl.de ([78.53.37.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtbAp-0003YT-Jm for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:08:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <41c00fa60312c83a2a9d8a296430b98f37c1991e.1313561874.git.anders@chargestorm.se>
References: <cover.1313561874.git.anders@chargestorm.se>
	<41c00fa60312c83a2a9d8a296430b98f37c1991e.1313561874.git.anders@chargestorm.se>
Date: Wed, 17 Aug 2011 10:08:20 +0200
Message-ID: <1313568501.4294.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH v3 2/2] ckermit: update to version 9.0
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
X-List-Received-Date: Wed, 17 Aug 2011 08:12:58 -0000
X-Groupsio-MsgNum: 33661
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/dyQoNJRMBnZLPl9KFCY"

--=-/dyQoNJRMBnZLPl9KFCY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Anders,


Am Mittwoch, den 17.08.2011, 08:25 +0200 schrieb Anders Darander:
> The update changes the license from kermit to BSD.
> Remove the NOAPCS compile flag to make the new version compile cleanly.
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>

thank you very much for incorporating the review comments. You can add
my Acked-by line next time to your patch iterations if you want to.

> ---
>  .../ckermit/{ckermit_211.bb =3D> ckermit_301.bb}     |   54 +++---------=
--------
>  1 files changed, 7 insertions(+), 47 deletions(-)
>  rename meta-oe/recipes-support/ckermit/{ckermit_211.bb =3D> ckermit_301.=
bb} (49%)
>=20
> diff --git a/meta-oe/recipes-support/ckermit/ckermit_211.bb b/meta-oe/rec=
ipes-support/ckermit/ckermit_301.bb
> similarity index 49%
> rename from meta-oe/recipes-support/ckermit/ckermit_211.bb
> rename to meta-oe/recipes-support/ckermit/ckermit_301.bb
> index 3715dcc..c789ea5 100644
> --- a/meta-oe/recipes-support/ckermit/ckermit_211.bb
> +++ b/meta-oe/recipes-support/ckermit/ckermit_301.bb
> @@ -5,51 +5,11 @@ sessions, file transfer, character-set translation, and=
 automation \
>  of communication tasks."
>  HOMEPAGE =3D "http://www.columbia.edu/kermit/"
>  SECTION =3D "console/network"
> -LICENSE =3D "Kermit"
> -LIC_FILES_CHKSUM =3D "file://COPYING.TXT;md5=3D17dabbd2543933464b6d32083=
c3a3596"
> -SRC_URI =3D "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;s=
ubdir=3D${BPN}-${PV}"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING.TXT;md5=3D932ca542d6c6cb8a59a0bcd76=
ab67cc3"
> +SRC_URI =3D "ftp://www.columbia.edu/kermit/archives/cku${PV}.tar.gz;subd=
ir=3D${BPN}-${PV}"

Koen already applied your patches, so this is just a note to please also
add such changes to the commit message next time. Especially since the
former URL seems to be the one used on the download page [1].

[=E2=80=A6]


Thank you again for your patches,

Paul


[1] http://www.columbia.edu/kermit/ck90.html#source

--=-/dyQoNJRMBnZLPl9KFCY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5Ldu8ACgkQPX1aK2wOHVinpACfUhK7U7hq1q0YXYyzN5iZdq59
8gYAn0J1bXTzjY7vmPya/kbAzouzI6RU
=H+Zg
-----END PGP SIGNATURE-----

--=-/dyQoNJRMBnZLPl9KFCY--

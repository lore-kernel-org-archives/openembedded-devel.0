Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK7iQ-0001iD-Sy for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:08:46 +0200
Received: from g225082113.adsl.alicedsl.de ([92.225.82.113]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK7cn-0001xc-3w for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:02:58 +0000
Message-ID: <1319889763.3756.12.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 14:02:43 +0200
In-Reply-To: <80e083564f1c33169626c79f52b15fe54f64c01d.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<80e083564f1c33169626c79f52b15fe54f64c01d.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl][meta-oe 12/12] elfe: add another patch to fix API changes
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
X-List-Received-Date: Sat, 29 Oct 2011 12:08:47 -0000
X-Groupsio-MsgNum: 35064
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-QJx462M3HTSjRMVSMBRx"

--=-QJx462M3HTSjRMVSMBRx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...update-again-to-even-newer-elementary-API.patch |  105 ++++++++++++++=
++++++
>  meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +
>  2 files changed, 107 insertions(+), 0 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-=
to-even-newer-elementary-API.patch
>=20
> diff --git a/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even=
-newer-elementary-API.patch b/meta-efl/recipes-efl/e17/elfe/0001-elfe-updat=
e-again-to-even-newer-elementary-API.patch
> new file mode 100644
> index 0000000..ad1c259
> --- /dev/null
> +++ b/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newer-=
elementary-API.patch

[=E2=80=A6]

> diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/=
e17/elfe_svn.bb
> index 151ef7e..5b703dc 100644
> --- a/meta-efl/recipes-efl/e17/elfe_svn.bb
> +++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
> @@ -5,4 +5,6 @@ PR =3D "${INC_PR}.1"
> =20
>  require e-module.inc
> =20
> +SRC_URI +=3D "file://0001-elfe-update-again-to-even-newer-elementary-API=
.patch"
> +
>  DEPENDS +=3D "elementary"

is `PR =3D "${INC_PR}.2"` needed? Or does the package content not change?


Thanks,

Paul

--=-QJx462M3HTSjRMVSMBRx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6r62MACgkQPX1aK2wOHVgyPACfeUbXCIdrZCPU6J06kSF4111j
ceMAnAluZRPFNyJR5qUfFE6jGEXYSLM0
=lr4V
-----END PGP SIGNATURE-----

--=-QJx462M3HTSjRMVSMBRx--

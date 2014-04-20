Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 01F5965D10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:17:03 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2976169eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4Xl/yBWEmhIcO3jqRB9qO/+dOuiedb1A3xJvc1xX+hE=;
	b=a3U1lZ9gY/LL4nw+zx2wQ9HCjV1CqXoH4dx1KB8T12m6ha1Qq9emDza8N73FWKcjE5
	n1jgMf6R0uKE7rRY+mmnj9YQDswKXL6CXzy2d3hPWn2I2roMNafEVZ1O/SMxV6JyD44X
	FYb6VmhFGi1By2EkJ4jgEJbIJ0cwu75Q4VWG5Xe7EGSLzK0FU97aYKhUpaKdG9bJXW91
	qG1KFXF5yg4SmEhllKpTdEHSyAAUiAszOmFubashNdjKaGKKqZHbQFFy1vAD+3gz0AeB
	rDtaQys4l2BnWJGu3t/RbyQW3Q46endSQCKyosvDY66jhv3xEYDGOheDniyTz0rwMK2+
	3Spw==
X-Received: by 10.14.126.73 with SMTP id a49mr37998799eei.46.1397992624754;
	Sun, 20 Apr 2014 04:17:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm93745057eeu.23.2014.04.20.04.17.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:17:03 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:17:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420111709.GO2486@jama>
References: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
	<1397023113-29936-3-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397023113-29936-3-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/3] sg3-utils: update to 1.38
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Apr 2014 11:17:04 -0000
X-Groupsio-MsgNum: 49322
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h/VGaWN5ITqlMCVM"
Content-Disposition: inline

--h/VGaWN5ITqlMCVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 01:58:32PM +0800, Kai Kang wrote:
> Update sg3-utils to version 1.38.

Merged, thanks!

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../sg3-utils/{sg3-utils_1.31.bb =3D> sg3-utils_1.38.bb}        | 11 +++=
+++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.31.bb =3D> sg3-uti=
ls_1.38.bb} (46%)
>=20
> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb b/meta-o=
e/recipes-support/sg3-utils/sg3-utils_1.38.bb
> similarity index 46%
> rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
> rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
> index 29fe132..beee36c 100644
> --- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
> @@ -1,15 +1,16 @@
>  SUMMARY =3D "Utilities for working with generic SCSI devices"
> +
> +DESCRIPTION =3D "This package contains low level utilities for devices t=
hat use the SCSI command set"
> +
>  HOMEPAGE =3D "http://sg.danny.cz/sg/sg3_utils.html"
>  SECTION =3D "console/admin"
> =20
>  LICENSE =3D "GPLv2+ & BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1cc481c050dc92e12db9c8145043d=
5dc"
> -
> -PR =3D "r1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df90da7fc52172599dbf082d7620f1=
8ca"
> =20
>  SRC_URI =3D "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
> -SRC_URI[md5sum] =3D "9431e1944cde829a24dedf027e1364b5"
> -SRC_URI[sha256sum] =3D "d84b38b61f0ca3941eb1c48a5858f93d1d1b70a623e579f5=
ecce2440e18410a4"
> +SRC_URI[md5sum] =3D "e532a3d6648c422347f6d84cac469263"
> +SRC_URI[sha256sum] =3D "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5=
d7c12ce652ba38f1"
> =20
>  inherit autotools
> =20
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h/VGaWN5ITqlMCVM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrLUACgkQN1Ujt2V2gBzA+QCfUBRVJlL8VsHu2/0sa88CK3DB
+wwAoK1gAMFFz1truVkiS5Vm6kyFlCKS
=gX28
-----END PGP SIGNATURE-----

--h/VGaWN5ITqlMCVM--

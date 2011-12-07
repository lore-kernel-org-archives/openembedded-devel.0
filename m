Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYIrL-00056R-K0
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 15:52:35 +0100
Received: by eaao14 with SMTP id o14so498943eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wvgxnufiKmzaagx2z5Z5azv1zCToE/ONh9fTj/ZZ6dA=;
	b=pN6OR66ziKuQewSNrwVU53UOOJQobxZnlQ4Le8aCkejlMJ7Dq55wwqQHtP1V6027Dp
	OhuQEfaPNFVBhEW6G86+ol0g/FDDrAa10BWc8OyWA/eNSJr0EIxRyqeggZ/YLELg11uS
	JqyEA6PJnxtctlVwlE4DudvnEIJT6OzBlyWW8=
Received: by 10.213.32.15 with SMTP id a15mr3581177ebd.27.1323269147051;
	Wed, 07 Dec 2011 06:45:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm6322386eea.6.2011.12.07.06.45.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 06:45:46 -0800 (PST)
Date: Wed, 7 Dec 2011 15:45:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111207144534.GE3897@jama.jama.net>
References: <1323267554-2806-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
In-Reply-To: <1323267554-2806-1-git-send-email-ulf@emagii.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [meta-oe] xf86-input-tslib: Use correct name for checksum calculation
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
X-List-Received-Date: Wed, 07 Dec 2011 14:52:35 -0000
X-Groupsio-MsgNum: 35963
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline

--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 03:19:14PM +0100, ulf@emagii.com wrote:
> From: Ulf Samuelsson <ulf@emagii.com>
>=20
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.=
bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> index de0eb6f..768453a 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> @@ -17,12 +17,14 @@ SRC_URI =3D "http://www.pengutronix.de/software/xf86-=
input-tslib/download/xf86-inp
>             file://99-xf86-input-tslib.rules \
>             file://xf86-input-tslib-port-ABI-12-r48.patch \
>  "
> -SRC_URI[md5sum] =3D "b7a4d2f11637ee3fcf432e044b1d017f"
> -SRC_URI[sha256sum] =3D "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d00661=
1236d8332e85b105"
> +
> +SRC_URI[archive.md5sum] =3D "b7a4d2f11637ee3fcf432e044b1d017f"
> +SRC_URI[archive.sha256sum] =3D "5f46fdef095a6e44a69e0f0b57c7d665224b26d9=
90d006611236d8332e85b105"

This is not correct after
http://git.openembedded.org/meta-openembedded/commit/?id=3D2162f0140d72a597=
6278d63e7eb2d4eb032ded4f

Cheers,

> =20
>  do_configure_prepend() {
>          rm -rf ${S}/m4/ || true
>  }
> +
>  do_install_append() {
>          install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
>          install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir=
}/hal/fdi/policy/20thirdparty
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7ffA4ACgkQN1Ujt2V2gByRVQCdFAghbWxGkZbsxsbt7POLOKer
oeEAn3/o+6zC1H9XIISvd44cHGMfE4Ea
=S6yo
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--

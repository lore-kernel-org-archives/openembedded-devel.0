Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQIZQ-0002Ld-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 16:34:42 +0200
Received: by mail-pb0-f49.google.com with SMTP id um15so869108pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YqaQxex2xsIm/P+mxgnL/YDJ4bkMSWCuEVai/Ap07wk=;
	b=XUJTfg0Y60SjsuKWqefYe+gzw3L5Nga32/mw9hMGZyID0vbm/GSizlfAjGqQstMNwk
	nwgsnUkvdWlP1OnYiDawCUVG2PYIgsM/g4MxuHibgwhwKBTS/TudMky3TknhSHvMCRoo
	reWu/mtY69TKTekmjtV6Deso+edUeDUYRcFhI/16YOeIIFn3NjGi683mqUsYKiv21B51
	CGL336Y6ZF03DbvqsL1qsEP/0jhUvNE2uxaf/CoS2rdHwaLPX+31LhpCFJD9/KVGdaNn
	ku5Wa7RxmZrQn/Zciv0+ZATp4szNl3K1q38F4JIZSo1yNBF/SDGSLWZXFQqtQa8tyDlu
	LYtw==
X-Received: by 10.68.243.99 with SMTP id wx3mr9123113pbc.103.1365689784688;
	Thu, 11 Apr 2013 07:16:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hp1sm5190066pac.3.2013.04.11.07.16.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 07:16:23 -0700 (PDT)
Date: Thu, 11 Apr 2013 16:16:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130411141617.GI2477@jama>
References: <1364997019-23273-1-git-send-email-stefan@herbrechtsmeier.net>
	<1365541861-10672-1-git-send-email-stefan@herbrechtsmeier.net>
MIME-Version: 1.0
In-Reply-To: <1365541861-10672-1-git-send-email-stefan@herbrechtsmeier.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net
Subject: Re: [meta-oe][PATCH V2] cryptsetup: Update to latest version and use openssl as crypto backend
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
X-List-Received-Date: Thu, 11 Apr 2013 14:34:43 -0000
X-Groupsio-MsgNum: 44076
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fckbADODYWZD5TdN"
Content-Disposition: inline

--fckbADODYWZD5TdN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2013 at 11:11:01PM +0200, Stefan Herbrechtsmeier wrote:
> Cryptsetup with the command luksOpen failed with the error message:
> device-mapper: status ioctl failed: Permission denied
>=20
> The error comes from libgcrypt with drops root privileges if it is
> linked with libcap support [1]. Update cryptsetup to latest version,
> add PACKAGECONFIG for crypto backend selection (openssl / gcrypt)
> and change the default crypto backend to openssl as libgcrypt states
> the drop root privileges behaviour as a feature [2].
>=20
> The license was updated to GPLv2 with OpenSSL exception.
>=20
> Update the RRECOMMENDS to be conistent with the package names.

Looks good to me, will apply it in later this week if nobody objects.
=20
> [1] http://code.google.com/p/cryptsetup/issues/detail?id=3D47
> [2] https://bugs.g10code.com/gnupg/issue1181
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
> ---
>  .../{cryptsetup_1.1.3.bb =3D> cryptsetup_1.6.1.bb}   |   37 ++++++++++++=
+-------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>  rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.1.3.bb =3D> cryp=
tsetup_1.6.1.bb} (21%)
>=20
> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb b/met=
a-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> similarity index 21%
> rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
> rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> index 254f563..438d394 100644
> --- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
> +++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> @@ -1,18 +1,31 @@
> -DESCRIPTION =3D "Setup virtual encryption devices under dm-crypt Linux"
> +SUMMARY =3D "Manage plain dm-crypt and LUKS encrypted volumes"
> +DESCRIPTION =3D "Cryptsetup is used to conveniently setup dm-crypt manag=
ed \
> +device-mapper mappings. These include plain dm-crypt volumes and \
> +LUKS volumes. The difference is that LUKS uses a metadata header \
> +and can hence offer more features than plain dm-crypt. On the other \
> +hand, the header is visible and vulnerable to damage."
>  HOMEPAGE =3D "http://code.google.com/p/cryptsetup/"
>  SECTION =3D "console"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312=
326"
> +
> +DEPENDS =3D "util-linux lvm2 popt"
> =20
> -DEPENDS =3D "util-linux lvm2 libgcrypt popt"
> -RRECOMMENDS_${PN} =3D "kernel-module-aes \
> -                     kernel-module-dm-crypt \
> -                     kernel-module-md5 \
> -                     kernel-module-cbc \
> -                     kernel-module-sha256 \
> -                    "
>  SRC_URI =3D "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar=
=2Ebz2"
> -SRC_URI[md5sum] =3D "318a64470861ea5b92a52f2014f1e7c1"
> -SRC_URI[sha256sum] =3D "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e060=
2bf40208b5e69c0a"
> +SRC_URI[md5sum] =3D "f374d11e3b0e7ca0f805756fd02e34ff"
> +SRC_URI[sha256sum] =3D "baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c=
18ca09082755149c"
> =20
>  inherit autotools gettext
> +
> +# Use openssl because libgcrypt drops root privileges
> +# if libgcrypt is linked with libcap support
> +PACKAGECONFIG ??=3D "openssl"
> +PACKAGECONFIG[openssl] =3D "--with-crypto_backend=3Dopenssl,,openssl"
> +PACKAGECONFIG[gcrypt] =3D "--with-crypto_backend=3Dgcrypt,,libgcrypt"
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> +                     kernel-module-dm-crypt \
> +                     kernel-module-md5 \
> +                     kernel-module-cbc \
> +                     kernel-module-sha256-generic \
> +                     "
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fckbADODYWZD5TdN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmxbEACgkQN1Ujt2V2gBycLwCcCI2kqn372s6Y2cCDxNO/ohb0
rJAAoKMnp+EidP+2eW6xLav/dy1OHl6C
=F7Lm
-----END PGP SIGNATURE-----

--fckbADODYWZD5TdN--

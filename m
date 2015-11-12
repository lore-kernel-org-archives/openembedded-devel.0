Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE147717F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:49:26 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so148566338wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bOU8erdtar1HCK8owZiCbE0pBRnStejJzPR9irMXO1Q=;
	b=RLBqKEGxD3crhpFlBtFBgLlE9of31lic3eBMfBdZTXsvpmjmkbtdUM2xMKmBm37MfB
	I0cQ4uMcSx6amTbmJ/DjbDM9VcmR8G7y3mWtcm+yuBkEuyM13OAM2xSl53uIJN6GrWrN
	8rwT1TvRVTzX3Djx0+b7JDXbL72CmhCZEblGsM5zDan5UToWJ8A2nn9YeAOqhmuma1O+
	9aUnP4gw851BHpoQBtL+O0Y17EiytAiB4gv5im8QboQ34rKFhltup3Tfz63AojaIFDoH
	luQllI5rJ3L73EMv5rVU2CKjoJ9O2A4yUOc9tCB2mcjUFq3fEpYB21pCdMoS1LFbbs1i
	Emyg==
X-Received: by 10.28.189.5 with SMTP id n5mr12742897wmf.76.1447325366599;
	Thu, 12 Nov 2015 02:49:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bk2sm13803593wjc.3.2015.11.12.02.49.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 02:49:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 11:49:42 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151112104942.GC2574@jama>
References: <cover.1447324249.git.jackie.huang@windriver.com>
	<003a6952d90ed5b8c4cb45964b5dae59dd7034ff.1447324249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <003a6952d90ed5b8c4cb45964b5dae59dd7034ff.1447324249.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 2/6] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Thu, 12 Nov 2015 10:49:31 -0000
X-Groupsio-MsgNum: 58545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline

--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 06:44:21PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
>  - use PV instead of hardcoded version number
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}              | 12 ++++=
++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-support/talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3=
=2Ebb} (80%)
>=20
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/rec=
ipes-support/talloc/talloc_2.1.3.bb
> similarity index 80%
> rename from meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> rename to meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> index 89c390f..7784794 100644
> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> @@ -7,8 +7,8 @@ SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar=
=2Egz"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
>                      file://${COREBASE}/meta/files/common-licenses/GPL-3.=
0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> =20
> -SRC_URI[md5sum] =3D "5dffb86414218a91864ed4453ba9be07"
> -SRC_URI[sha256sum] =3D "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb=
6a459025488b6174"
> +SRC_URI[md5sum] =3D "3e285de2228ae67ff0a0f5cec658f627"
> +SRC_URI[sha256sum] =3D "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e5=
8dd9e311f41f2cb0"
> =20
>  inherit waf-samba
> =20
> @@ -28,18 +28,18 @@ FILES_${PN}-dev =3D ""
>  FILES_${PN}-dbg =3D ""
> =20
>  FILES_libtalloc =3D "${libdir}/libtalloc.so.2 \
> -                   ${libdir}/libtalloc.so.2.1.1"
> +                   ${libdir}/libtalloc.so.${PV}"
>  FILES_libtalloc-dbg =3D "/usr/src/debug/ \
> -                   ${libdir}/.debug/libtalloc.so.2.1.1"
> +                   ${libdir}/.debug/libtalloc.so.${PV}"

Why not use ${SOLIBS} and ${SOLIBSDEV} variables?

>  FILES_libtalloc-dev =3D "${includedir}/ \
>                     ${libdir}/libtalloc.so \
>                     ${libdir}/pkgconfig/"
> =20
>  FILES_pytalloc =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packages/=
* \
>                    ${libdir}/libpytalloc-util.so.2 \
> -                  ${libdir}/libpytalloc-util.so.2.1.1 \
> +                  ${libdir}/libpytalloc-util.so.${PV} \
>                   "
>  FILES_pytalloc-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packa=
ges/.debug \
> -                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
> +                      ${libdir}/.debug/libpytalloc-util.so.${PV}"
>  FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
>  RDEPENDS_pytalloc =3D "python"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEbsUACgkQN1Ujt2V2gBxwTQCghl64iqkozj9SoSCe2oKe46od
D8AAnRnwi++s3RxBG65THFnor0sjnqc5
=F3Jk
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

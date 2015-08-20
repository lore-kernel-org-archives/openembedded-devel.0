Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 490F365CCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:03:46 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so38732265wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0ZcvGWEqlPsth4C2CJhZ7WOMuACmXZX8fNrxHVoIceI=;
	b=eE/NIIK6lAn704na9Y5bqxmFqQPp9h4v5y9AQt8yLp7vaokIQeNlajn7bR0yHaBw6d
	1Kl+R8L9xLY3djh/GREsIis8Vx7p++mtj4k8itJ7hnEFAqE0GcEuLMw722y4R40hi2pB
	1cLoYlVQjSC3lk8sLQ4Fh6rLIzMUvph2NfxYWB/qykmuChclI3Mnu2oEGQBVX2V1v/3I
	Xt2GcuWqPbBX9wnAcQ2JHiDIEV2kPfX4Q8zXOWfMojyso2Ak34Gv8S3KlgtCyFEWPRTN
	SI6xLgRzgmvjKqRaPvkVhCd5q8Ex2w5DYeRkWDXBj7D4201u00uKC56Y3iQIh9aiWAEj
	NAwQ==
X-Received: by 10.180.87.230 with SMTP id bb6mr13701998wib.36.1440083026722;
	Thu, 20 Aug 2015 08:03:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gw7sm30960994wib.15.2015.08.20.08.03.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:03:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:04:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150413.GI2446@jama>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1432588449-31413-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 01/12] fontforge: add 20141126
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
X-List-Received-Date: Thu, 20 Aug 2015 15:03:47 -0000
X-Groupsio-MsgNum: 56837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Content-Disposition: inline

--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2015 at 11:13:58PM +0200, Andreas M=FCller wrote:
> Have this recipe in my meta-qt5-extra but would be happy to get it under =
the
> hood of Martin's world.
>=20
> It started with the native part to build kde's oxygen-fonts but maybe som=
ebody
> likes to have it on target.
>=20
> Tested native part by gazillions of builds / target part in xfce environm=
ent.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../fontforge/fontforge_20141126.bb                | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge_20141126=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb b/m=
eta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
> new file mode 100644
> index 0000000..72020db
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "A font editor"
> +HOMEPAGE =3D "http://fontforge.github.io/en-US/"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING.gplv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE;md5=3D71d636ba7678baa1573e1b531041386e \
> +"
> +
> +inherit autotools pkgconfig pythonnative
> +
> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
> +DEPENDS_append_class-target =3D " libxi"
> +
> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"

Don't use github archives, they are regenerated from time to time with=20
different checksums and they have stupid filenames (prone to collision=20
with other recipes).

can you send follow-up patch?

> +SRC_URI[md5sum] =3D "0d6f5112c4e5689087339a94aceadf77"
> +SRC_URI[sha256sum] =3D "9c90c640023463c0b2b97b87575a014fcf44f688c3763f4c=
d136d3c267092106"
> +
> +EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-exte=
nsion --disable-python-scripting"
> +
> +do_configure_prepend() {
> +    currdir=3D`pwd`
> +    cd ${S}
> +    ./bootstrap --force
> +    cd $currdir
> +}
> +
> +EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -I${B}/uthash/src'"
> +
> +PACKAGES =3D+ "${PN}-python-dbg ${PN}-python"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/mime \
> +    ${datadir}/icons \
> +"
> +
> +FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${PN}/pyth=
on"
> +FILES_${PN}-python-dbg =3D "${PYTHON_SITEPACKAGES_DIR}/.debug"
> +RDEPENDS_${PN}-python =3D "python"
> +
> +# for e.g kde's oxygen-fonts
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV7G0ACgkQN1Ujt2V2gBzpOQCfTc65tWamM8pQEr+NdXKkBA0Z
UPwAoKrIS4csECOltINJwaL7LEJ11JDG
=5tbL
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--

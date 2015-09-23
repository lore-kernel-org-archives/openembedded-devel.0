Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE2976FE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:09:07 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so240337586wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9zY4ZTICvetK7eGbwN9xw8FdgrIUFz3ud5IxuuS5dzE=;
	b=Q3lYcU9fpfZD+HcWdLsvSOFm6w6v7KNR8HbU/lfLz5EMJnEYU6zw+vyfTVaB9eraJ6
	Vd6aijVNPaH8T/qmFnMEu50WjTWiZJMkFU5Fd6HLgZY7fis3CRgoCHV82RKPvl8k7ZcI
	rwLuVQ9ne04uicmGOcR2as6v1cbqUwkze/7ZGScZUlQQgrzvejtI7MUYuK7IpbEL8CdC
	nCKsDqZNyxJIUV9n2frELrEqwbMYCCwrWoJxfmkoj9f+Yi7Qbcmq1i5iYKEdUiJbrzRs
	ADAl9ZhYlazqKFdxBZk4WLlvk8C2WCXN+VUH/gI/hCc9clWAc47wDg1pMOJYU10m8VU+
	hz8A==
X-Received: by 10.194.111.198 with SMTP id ik6mr39626143wjb.96.1443017347798; 
	Wed, 23 Sep 2015 07:09:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fn4sm8768847wib.11.2015.09.23.07.09.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 07:09:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2015 16:09:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150923140916.GF2384@jama>
References: <1441972204-15911-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1441972204-15911-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] gerbil: Visualization and analysis tool for hyperspectral images
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
X-List-Received-Date: Wed, 23 Sep 2015 14:09:08 -0000
X-Groupsio-MsgNum: 57518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline

--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 01:50:04PM +0200, Ricardo Ribalda Delgado wrote:
> New recipe
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-graphics/gerbil/gerbil_git.bb | 30 +++++++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/gerbil/gerbil_git.bb
>=20
> diff --git a/meta-oe/recipes-graphics/gerbil/gerbil_git.bb b/meta-oe/reci=
pes-graphics/gerbil/gerbil_git.bb
> new file mode 100644
> index 000000000000..c1d84a095433
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "Generic framework for visualization and analysis of mul=
tispectral and hyperspectral data that strives to both bring new innovation=
s in analysis capabilities and be of use in a wide range of hyperspectral d=
ata applications"
> +HOMEPAGE =3D "http://gerbilvis.org/"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +DEPENDS =3D "boost qt4-x11-free tbb opencv"

Set PV variable.

> +SRCREV =3D "670e06da516ed51dbae75e41e043900256bdabba"
> +
> +SRC_URI =3D "git://github.com/gerbilvis/gerbil.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit distutils-base cmake qt4x11

Fails to build in world:

http://errors.yoctoproject.org/Errors/Details/18423/

> +
> +export EXTRA_OECMAKE =3D "\
> +                        -DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
> +                        -DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
> +                        -DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
> +                        "
> +
> +do_configure() {
> +        # Ensure we get the cmake configure and not qmake
> +        cmake_do_configure
> +}
> +do_install() {
> +        install -d ${D}${bindir}
> +        install -m 755 bin/gerbil ${D}${bindir}/
> +        install -m 755 bin/qgerbil ${D}${bindir}/
> +}
> +
> +RDEPENDS_${PN} +=3D "qt4-x11-free"
> --=20
> 2.5.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYCsowACgkQN1Ujt2V2gBz1nQCfRjtVu8cHQtrE5rWSauzMRw2W
VuwAniCnwewyc59NcwUOLDRxQoEPQLqe
=B/fK
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--

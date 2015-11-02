Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD8275852
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:03:08 +0000 (UTC)
Received: by wmff134 with SMTP id f134so61398437wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 06:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=66fwdP5Vr5fsCu13AHXA7j240GLoei+dvwK6P164nLQ=;
	b=On64dxOpwAjmkyKStYdfgp2jZuTwcyB8FY4SYTh40++ezW7uDpN//IRV547IsMis37
	ANnhswON8e8WGMVGXJ/DAjMWOS8TuvDFary60apgdnyo+x7vXSJ7mXPWJZf9UDosOfOb
	vnb/2rv1FLk5AVh5wHuG6RtMQ7utMxkc2nlYBHUb/fd+FkWy4YgXa5l6+nkkdnrWgdiF
	yzQ1RkKHI4sUhA6XCNrr7EJubR5n0J1MF0/Z06QHUYH7MJiP3NxLzytipTgXNwucvQ0x
	gWFoyB3i08/PtDDaJCscZVo5Ff+PCVmLkgNwGR2yKWTE8w0Bfs0x58j1hpfPZfGCvwA8
	nN6g==
X-Received: by 10.28.20.139 with SMTP id 133mr14632534wmu.36.1446472988664;
	Mon, 02 Nov 2015 06:03:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wz7sm22533316wjc.26.2015.11.02.06.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Nov 2015 06:03:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Nov 2015 15:03:13 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20151102140313.GA15877@jama>
References: <1445523733-20612-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1445523733-20612-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] gerbil: Visualization and analysis tool for hyperspectral images
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
X-List-Received-Date: Mon, 02 Nov 2015 14:03:12 -0000
X-Groupsio-MsgNum: 58245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 04:22:13PM +0200, Ricardo Ribalda Delgado wrote:
> New recipe

Still fails for qemuarm:
http://errors.yoctoproject.org/Errors/Details/21264/

>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v2:
>=20
> v1 failed to link, it was missing the glu library.
>=20
> I have not been able to replicate the build error :S
>=20
> But after some static analysis it seems that:
>=20
> glu should have been automatically added with the cmake
> variable OPENGL_LIBRARIES, set in FindOpeGL.cmake
>=20
> But if glu is not present, then it is not added....
>=20
> Sorry for the inconvenience!
>=20
>=20
>=20
>  meta-oe/recipes-graphics/gerbil/gerbil_git.bb | 30 +++++++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/gerbil/gerbil_git.bb
>=20
> diff --git a/meta-oe/recipes-graphics/gerbil/gerbil_git.bb b/meta-oe/reci=
pes-graphics/gerbil/gerbil_git.bb
> new file mode 100644
> index 000000000000..bfcd7c7ce803
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
> +DEPENDS =3D "boost qt4-x11-free tbb opencv libglu virtual/libgl"
> +SRCREV =3D "670e06da516ed51dbae75e41e043900256bdabba"
> +
> +SRC_URI =3D "git://github.com/gerbilvis/gerbil.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit distutils-base cmake qt4x11
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
> 2.6.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY3bR0ACgkQN1Ujt2V2gBw0NgCeNhvHlwFP3j+swPqzoXhoytGZ
suUAnjcCLYxkjMRJxlx0fyFG3oPjgjsP
=jys9
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1663C6A4D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:50:06 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q55so5288430wes.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=12dQ42/TvPLXWiJ3UJMgiBmquCluBBPZkIz1GC9Qthk=;
	b=ehpHEGZqow4LVSmmWkweAvYeIiYM7T/hH2XYWjXbohz3Ojezek/j/fOrpPXDAEhs2T
	Itg9iCUye5YkzmCBq1m/1KqavLDdb+VXCi9RjgwefwDo/W0wt59O9yccT0vvDXz+fc4q
	goTrK4WcKVuUIdVPnBMWFGUkTi6Pug76JfpKUV41wwEG8rshYZUzx9k3u0iLIpFsEVHL
	Qg+Qhs7c2c7v/jwmUyqWy61Flpm9yc7TUXrnvlrJtSUj8DBhQKqHVh/QHDAk/6qKHM9G
	15I4lT5i66Kt1Bx5mCyg68Ks92Vwq6JUPg/2R9XXSvHJ1Lk/qR+Q8iizkFnlbmef4uyV
	NV0Q==
X-Received: by 10.180.37.208 with SMTP id a16mr11247406wik.24.1369731007727;
	Tue, 28 May 2013 01:50:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ca19sm22785865wib.3.2013.05.28.01.50.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 01:50:07 -0700 (PDT)
Date: Tue, 28 May 2013 10:50:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528085017.GC3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-7-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1369698233-4500-7-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH 7/8] qtbase: install and split package fonts
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
X-List-Received-Date: Tue, 28 May 2013 08:50:07 -0000
X-Groupsio-MsgNum: 44888
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline

--E13BgyNx05feLLmH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 01:43:52AM +0200, Eric B=E9nard wrote:
> - fonts were not installed (at least in qt 5.0.2) so install
> them manually.
> - split the font package in smaller package as done in qt4 to
> save space on the target.
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/qt5/qtbase.inc |   30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 81cc2e1..4b4fb10 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -161,7 +161,33 @@ do_install_append() {
>      # qemu built on host breaks do_package, remove it here (will be repl=
aces with right qemu when do_compile is fixed
>      # ERROR: objcopy failed with exit code 1 (cmd was 'arm-oe-linux-gnue=
abi-objcopy' --only-keep-debug '/OE/oe-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/qmake' '/OE/oe-core/tmp-eglibc/=
work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/.debug/qmak=
e')
>      rm -f ${D}/${bindir}/${QT_DIR_NAME}/qmake
> +    # install fonts manually if they are missing
> +    if [ ! -d ${D}/${libdir}/fonts ]; then
> +        cp -a ${S}/lib/fonts ${D}/${libdir}
> +    fi
>  }
> =20
> -PACKAGES =3D. "${PN}-fonts "
> -FILES_${PN}-fonts =3D "${libdir}/${QT_DIR_NAME}/fonts ${libdir}/fonts"
> +PACKAGES =3D. "${PN}-fonts \
> +             ${PN}-fonts-ttf-vera \
> +             ${PN}-fonts-ttf-dejavu \
> +             ${PN}-fonts-pfa \
> +             ${PN}-fonts-pfb \
> +             ${PN}-fonts-qpf "
> +
> +RRECOMMENDS_${PN}-fonts =3D " \
> +             ${PN}-fonts-ttf-vera \
> +             ${PN}-fonts-ttf-dejavu \
> +             ${PN}-fonts-pfa \
> +             ${PN}-fonts-pfb \
> +             ${PN}-fonts-qpf "
> +
> +ALLOW_EMPTY_${PN}-fonts =3D "1"
> +PACKAGES_DYNAMIC +=3D "^${PN}-fonts-.*"
> +
> +FILES_${PN}-fonts-ttf-vera       =3D "${libdir}/${QT_DIR_NAME}/fonts/Ver=
a*.ttf ${libdir}/fonts/Vera*.ttf"
> +FILES_${PN}-fonts-ttf-dejavu     =3D "${libdir}/${QT_DIR_NAME}/fonts/Dej=
aVu*.ttf ${libdir}/fonts/DejaVu*.ttf"
> +FILES_${PN}-fonts-pfa            =3D "${libdir}/${QT_DIR_NAME}/fonts/*.p=
fa ${libdir}/fonts/*.pfa"
> +FILES_${PN}-fonts-pfb            =3D "${libdir}/${QT_DIR_NAME}/fonts/*.p=
fb ${libdir}/fonts/*.pfb"
> +FILES_${PN}-fonts-qpf            =3D "${libdir}/${QT_DIR_NAME}/fonts/*.q=
pf* ${libdir}/fonts/*.qpf*"
> +FILES_${PN}-fonts                =3D "${libdir}/${QT_DIR_NAME}/fonts/REA=
DME ${libdir}/fonts/README \
> +                                    ${libdir}/${QT_DIR_NAME}/fonts/fontd=
ir ${libdir}/fonts/fontdir"

maybe we could improve this by using OE_QMAKE_PATH_ARCHDATA (to cover
version with and without QT_DIR_NAME), but please
check if fonts are really installed into ArchData directory

OE_QMAKE_PATH_QT_ARCHDATA =3D "${libdir}/${QT_DIR_NAME}"

I'm going to merge other qt5 changes, so only this one will need an
update.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkb8kACgkQN1Ujt2V2gBwuDwCfabYBrM1sccJdwctszVBqCvbM
fckAn13gZnQOpuzOze+9WrwbO+PoCusw
=FwEJ
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--

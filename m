Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 95EA665F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 02:56:28 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id mc6so1402140lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5sDVYDVq1nwqr8RDos6s5ulHVQnH906beB/UPYkccBM=;
	b=c70q1uTVJh3s0XSiD21d6kALIggOe2YYbKP9fvYyTWZIJ+hEn3oV396Og28yr0mjod
	sUtzkZg/oTFIbxU/6a9Qr7vvblS7j/cBh+nyKqswI+eh2MNH++Ecryi2dBwpOkjkydQX
	VRWlBZ1M0ajZ4xH9qPwlaS3kTjQ56usqNsp2HG7yA4/2XvuLn53MVZ8hefx2SKdjGFyS
	U92bmBPfzfrFO+RmkK/9+NTbMm7Yr9uSv8Khu7DyQvobwpGAn9BiVYMWECV6npZCPu2m
	JPYuu0l/gjZmKeMdt5fT14O2rHpmR7W4V9Ld3Zmmz++594v8s3/CzF20Vqj3QT295Isl
	WGEg==
X-Received: by 10.152.246.43 with SMTP id xt11mr4672918lac.34.1399344988753;
	Mon, 05 May 2014 19:56:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jh4sm11595351lbb.26.2014.05.05.19.56.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 19:56:27 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 May 2014 04:56:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140506025648.GO2486@jama>
References: <1399344605-8547-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1399344605-8547-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] v4l-utils: Update to 1.0.1
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
X-List-Received-Date: Tue, 06 May 2014 02:56:30 -0000
X-Groupsio-MsgNum: 49707
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lliW49EncgcMKc3l"
Content-Disposition: inline

--lliW49EncgcMKc3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2014 at 11:50:05PM -0300, Otavio Salvador wrote:
> This updates to last stable release and, as a plus, fix an out of tree
> build failure.

file://openat.patch was removed but not the patch itself

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb | 39 ----------------=
------
>  .../recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb | 26 +++++++++++++++
>  2 files changed, 26 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/met=
a-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> deleted file mode 100644
> index 485a416..0000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY =3D "v4l2 and IR applications"
> -LICENSE =3D "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da9957849056017dc568bbc43d8=
975 \
> -                    file://COPYING.LIB;md5=3Dd749e86a105281d7a44c2328ace=
bc4b0"
> -
> -PR =3D "r2"
> -
> -DEPENDS =3D "jpeg virtual/libx11"
> -
> -inherit autotools gettext
> -
> -# libv4l was absorbed into this, let OE know that
> -PROVIDES =3D "libv4l"
> -
> -SRC_URI =3D "git://linuxtv.org/v4l-utils.git \
> -           file://openat.patch \
> -"
> -# 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
> -SRCREV =3D "0298efdcd1153b8f719b9164548a3f0546f0cb7c"
> -
> -S =3D "${WORKDIR}/git"
> -
> -EXTRA_OECONF =3D "--disable-qv4l2 --enable-shared --with-udevdir=3D${bas=
e_libdir}/udev"=20
> -
> -do_configure() {
> -    # autotools_do_configure fails with:
> -    # | configure.ac:139: error: required file 'build-aux/config.rpath' =
not found
> -    autoreconf -vfi=20
> -    oe_runconf
> -}
> -
> -PACKAGES =3D+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
> -
> -FILES_rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> -FILES_${PN} =3D "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-inf=
rared.rules"
> -FILES_libv4l +=3D "${libdir}/libv4l/* ${libdir}/*.so.*"
> -FILES_libv4l-dbg +=3D "${libdir}/libv4l/.debug"
> -FILES_libv4l-dev +=3D "${libdir}/*.so ${includedir}/lib* ${libdir}/pkgco=
nfig/lib*"
> -
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb b/met=
a-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
> new file mode 100644
> index 0000000..6c25c90
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "v4l2 and IR applications"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da9957849056017dc568bbc43d8=
975 \
> +                    file://COPYING.libv4l;md5=3Dd749e86a105281d7a44c2328=
acebc4b0"
> +
> +DEPENDS =3D "jpeg virtual/libx11"
> +
> +inherit autotools gettext
> +
> +# libv4l was absorbed into this, let OE know that
> +PROVIDES =3D "libv4l"
> +
> +SRC_URI =3D "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.=
bz2"
> +SRC_URI[md5sum] =3D "b06ea8b15e27cff352b4536e835448bc"
> +SRC_URI[sha256sum] =3D "fc0132e82a18dfad9619be3abf50c206e2f449b1c14440cd=
e36f25874fdce7df"
> +
> +EXTRA_OECONF =3D "--disable-qv4l2 --enable-shared --with-udevdir=3D${bas=
e_libdir}/udev"
> +
> +PACKAGES =3D+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
> +
> +FILES_rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> +FILES_${PN} =3D "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-inf=
rared.rules"
> +FILES_libv4l +=3D "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${li=
bdir}/libv4l/plugins/*.so \
> +                 ${libdir}/libv4l/*-decomp"
> +FILES_libv4l-dbg +=3D "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/=
=2Edebug"
> +FILES_libv4l-dev +=3D "${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la =
${libdir}/libv4l/plugins/*.la"
> --=20
> 2.0.0.rc0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lliW49EncgcMKc3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNoT3AACgkQN1Ujt2V2gBx2AwCffKDCjIH1tmp0xCOrEU8mGk13
wXkAnipX/7LZ6rHot3ML9Nl0s5MQ0z1S
=zrY7
-----END PGP SIGNATURE-----

--lliW49EncgcMKc3l--

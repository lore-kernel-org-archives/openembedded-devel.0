Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 70EB165E09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:39:17 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so3754666eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 15:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SOkBtVcy7YcxgcMnN5RvkOdgA78mM+LpnGPEO2SGUOk=;
	b=YBkhtzUcrphLvdo7UsP/VubzNEGQevcuuA0nh43H/MAGRJmR6PUn1xDXDXIxaYcJLT
	ia3GfUH4iau+Hgm73vY11ke5ZH7mElyhgzeEL4bY2Fulea/JasAYeuXaFBdID8Q3oFuU
	NP4iuPaHSM2w9eTj3H8Wd3v2IK4QxkEQNRDlgtoL5zlzUwrKjhdXPlvUVbKNBhEnQJVL
	PP5ZhWwPU0FJSP7I0YChrOqizQkrknTJH0TDA1xjkLp4x/jHHAorJ91mfYHbzZGadI9Y
	fqQpfpqVPB3rPVNo6LPkc4PnV2JMKE9HXCrYuCHt5lP+Geac1urZUc/cKiXxTHj9ol1j
	MXiA==
X-Received: by 10.14.100.69 with SMTP id y45mr44795eef.108.1398551958028;
	Sat, 26 Apr 2014 15:39:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm36720542eee.2.2014.04.26.15.39.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 15:39:16 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 27 Apr 2014 00:39:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140426223928.GE2486@jama>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
	<1398544484-27299-17-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1398544484-27299-17-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 17/21] t1lib: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 22:39:17 -0000
X-Groupsio-MsgNum: 49544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uuwlSTc/3kiP/jew"
Content-Disposition: inline

--uuwlSTc/3kiP/jew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2014 at 01:34:40PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/reci=
pes-extended/t1lib/t1lib_5.1.2.bb
> index d687ddb..61927ec 100644
> --- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
> +++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.=
orig.tar.gz \
>  SRC_URI[md5sum] =3D "a5629b56b93134377718009df1435f3c"
>  SRC_URI[sha256sum] =3D "821328b5054f7890a0d0cd2f52825270705df3641dbd476d=
58d17e56ed957b59"
> =20
> -inherit autotools
> +inherit autotools-brokensep
> =20
>  # Fix GNU_HASH problem
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> @@ -21,10 +21,10 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>  EXTRA_OECONF =3D "--with-x --without-athena"
>  EXTRA_OEMAKE =3D "without_doc"
> =20
> -do_configure() {
> -    rm -f ${S}/ac-tools/aclocal.m4
> -    autotools_do_configure
> -}
> +#do_configure() {
> +#    rm -f ${S}/ac-tools/aclocal.m4
> +#    autotools_do_configure
> +#}

can we delete this instead please?

> =20
>  FILES_${PN} +=3D " ${datadir}/t1lib/t1lib.config"
>  FILES_${PN}-doc =3D "${datadir}/t1lib/doc/t1lib_doc.pdf"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uuwlSTc/3kiP/jew
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNcNaAACgkQN1Ujt2V2gBxacQCglgwUEfAEqNot7JDFzMNhnDNr
JrwAnj90XhtbsnQptofMPUHytPAdzdqv
=AFx3
-----END PGP SIGNATURE-----

--uuwlSTc/3kiP/jew--

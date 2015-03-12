Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EE14E6AC3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 11:31:07 +0000 (UTC)
Received: by wghl18 with SMTP id l18so15622717wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yI0tWqXtgfWgXtIDDJdowpTeFN700+EM1Rlbb3+lHSU=;
	b=JyqKSva/DEbcU+i5LsgCKjPYi0CBMh0d8830TGGCsRN/JWJMdP/Mk6rDl0uy2kKKOS
	CJpSdyVJElzMQCaRX4lSaYY4Yc5g3ibAMnWDhuEwbOVs6bNl4HQOU4LBrkp9JUHut1Pm
	X1uMvD6wHiISB10xbKATLO3vB8xYmnwU6k0NCwi2QsvRQNbM7fI43Q/PeopFkcrhqW/z
	8T3aFVwQiXmfj5H0T8orgts20QGFTg8y2EroXxc8oJIdxlt8jY2EH7pkIOv09cMgR9GV
	qIVIKhqpy7ZugJ2GEL3V1q5lo51o7UinZCrvXjnL5Ns1ReE5zumnlZm9VpobEXpLEWI8
	tjIA==
X-Received: by 10.194.193.99 with SMTP id hn3mr87218718wjc.148.1426159867727; 
	Thu, 12 Mar 2015 04:31:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cj9sm9568145wjc.42.2015.03.12.04.31.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 04:31:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Mar 2015 12:31:47 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150312113147.GA2338@jama>
References: <1426157761-31744-1-git-send-email-ronan.lemartret@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1426157761-31744-1-git-send-email-ronan.lemartret@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] add libgcrypt-native to avoid host corruption
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
X-List-Received-Date: Thu, 12 Mar 2015 11:31:10 -0000
X-Groupsio-MsgNum: 54751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2015 at 11:56:01AM +0100, Ronan wrote:
> Signed-off-by: Ronan <ronan.lemartret@gmail.com>
> ---
>  meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.b=
b b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> index e3c833b..5c4c6b1 100644
> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> @@ -3,7 +3,10 @@ HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
>  LICENSE =3D "LGPL-2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9331186f4f80db7da0e724bdd6554=
ee5"
>  SECTION =3D "net"
> -DEPENDS =3D "libgcrypt gnutls file"
> +DEPENDS =3D "gnutls file"
> +
> +#libmicrohttpd uses the tool libgcrypt-config, so we need libgcrypt-nati=
ve
> +DEPENDS_append =3D " libgcrypt libgcrypt-native"

Why do you use append instead of adding it directly in DEPENDS?

We should fix configure to use pkgconfig for libgcrypt, not to add
libgcrypt-config from native recipe (when we want target sysroot paths).

>  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
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

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUBeSMACgkQN1Ujt2V2gByeiQCgoCL0WRBtFTfLvMBBRKqcnyTd
eboAoLQdpq5E8JWhDztSkzKhS3+jqFi+
=imsr
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

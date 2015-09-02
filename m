Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 519F877026
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 13:23:11 +0000 (UTC)
Received: by wiclp12 with SMTP id lp12so19107944wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+oVQIkNJVF2+EVAFSUv/allGF6lmd2LR7oGoSYGnyhw=;
	b=mmXZcwqzpsmveNMDrZojt/lUgFpUWCrpRrki/INaUD02ucFGSGQqw50T05AeQP3g5U
	VC8j4ANKRhehhagf4fcpt84dYGwnQEV7PCJmoPfDg/BUOnoDxhjYh18X/P+MzcUQYrlm
	QPQPKXRb0DBgKtYnoTqKB90kuC0lq+KWQydoO7LptA0W8kE/UK2dPe4ccPXQ+E8F1KTu
	YWPTJE/BxPLyRkwt7s3LiMREYp5lK2w06iVRROlgHsjwh4qnBOpl+zU4/xXwSutqDY20
	KFkcS7wb7D8YnlPjiJhoCRAe++ZzxRucI1TT1VvINvKA0wZbX1+4lYbE3LLjjQstrbNo
	U4lg==
X-Received: by 10.180.105.66 with SMTP id gk2mr4205852wib.73.1441200190091;
	Wed, 02 Sep 2015 06:23:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pe1sm3613584wic.20.2015.09.02.06.23.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 06:23:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 15:23:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150902132330.GC2470@jama>
References: <1441192259-20483-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1441192259-20483-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [PATCH] libjpeg-turbo: fix libturbojpeg packaging
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
X-List-Received-Date: Wed, 02 Sep 2015 13:23:14 -0000
X-Groupsio-MsgNum: 57177
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline

--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 12:10:59PM +0100, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>=20
> put libjpegturbo library files and headers into correct packages rather
> than them being in the main libjpeg-turbo package.
>=20
> remove INSANE_SKIP[dev-so]
> move .so, .a into -dev package
> move .la into -staticdev
> move .so.* into main library package
>=20
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb b/meta-o=
e/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
> index 8e214c9..16f62c5 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
> @@ -25,13 +25,14 @@ inherit autotools pkgconfig
> =20
>  EXTRA_OECONF =3D "--with-jpeg8 "
> =20
> -PACKAGES =3D+ "jpeg-tools libturbojpeg"
> +PACKAGES =3D+ "jpeg-tools libturbojpeg libturbojpeg-staticdev libturbojp=
eg-dev"
> =20
>  DESCRIPTION_jpeg-tools =3D "The jpeg-tools package includes client progr=
ams to access libjpeg functionality.  These tools allow for the compression=
, decompression, transformation and display of JPEG files and benchmarking =
of the libjpeg library."
>  FILES_jpeg-tools =3D "${bindir}/*"
> =20
> -FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"
> -INSANE_SKIP_libturbojpeg =3D "dev-so"
> +FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so.*"

You can use libturbojpeg*${SOLIBS}

> +FILES_libturbojpeg-staticdev =3D "${libdir}/libturbojpeg.a"
> +FILES_libturbojpeg-dev =3D "${libdir}/libturbojpeg.la ${incdir}/turbojpe=
g.h ${libdir}/libturbojpeg.so"

libturbojpeg.so -> lib*${SOLIBSDEV} and we should use only one
-dev/-staticdev package for recipe (people who need to install
-dev/-staticdef package to rootfs usually don't mind getting few more
files installed as well).

But more importantly I don't understand how dev-so and other files got
into libturbojpeg package when it's using:

FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"

So I think the problem is somewhere else.
> =20
>  BBCLASSEXTEND =3D "native"
>  DEPENDS =3D "nasm-native"
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

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXm+FEACgkQN1Ujt2V2gBx2wACfar//YGm7EowD7PGJTpS3nPj4
BmUAn0wDo1/eEnIU5AzkjlRcvSYCKgek
=s3R1
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 754B060048
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 22:28:24 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id l4so186909lbv.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ru6iGAZGZYaQlSj/oG7QXQQZALiVZWiI3L3RceBvqRc=;
	b=MWR2ignWv3PR5wEP2yWJQ7e01/d4tTDROVWtQJVDSlJ75hJ9qdvLR01ZiC9Qxyd5NJ
	4wEYJEZZ/yu24fKdR5cXl0W0GsB0YTXjPbA9apgoBKlMhgkdpL7cqyURT2in72uOGX7k
	cZePZgQiVaKn0Ejq5f1KSB/vIN7EsXi5zZ6tuqvrc35WWUgchh2sO9GEUYQfn6utoprg
	alUAV08C6O4lezZ4Ai8m4+hMPYsFbMk06h/xXVEdAzw513bkJ1lKz4VYsZsiZPbyz/nL
	hN+LJ7Wyeds5T3aSXQ2iGt2U8XuHHR87Kfpyp9YLty8o22pd1v9SZhIq1OpS1iBu0+Cf
	F1UA==
X-Received: by 10.112.137.39 with SMTP id qf7mr34547926lbb.18.1399415304920;
	Tue, 06 May 2014 15:28:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bm3sm15099056lbb.12.2014.05.06.15.28.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 15:28:23 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 00:28:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140506222845.GE30955@jama>
References: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
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
X-List-Received-Date: Tue, 06 May 2014 22:28:29 -0000
X-Groupsio-MsgNum: 49736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline

--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 08:20:36AM +1000, Nick D'Ademo wrote:
> Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>

Does it fix this issue reported in test-dependencies report?

opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394

> ---
>  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recip=
es-support/opencv/opencv_2.4.bb
> index df512f6..43e6a2b 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0"
> =20
> -SRCREV =3D "a4b34e7ae10351fc4d30dc55995679340efc488e"
> +SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
>  SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
>             file://opencv-fix-pkgconfig-generation.patch \
>  "
> =20
> -PV =3D "2.4.8+git${SRCPV}"
> +PV =3D "2.4.9+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNpYh0ACgkQN1Ujt2V2gByK0ACgt71ICbzUTp5aEJ4StT4kVXy3
Gl0AmwfgUl3JDLyTLu2GhHtBcHCQjg2V
=Tman
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--

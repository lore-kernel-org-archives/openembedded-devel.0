Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A13A477684
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 16:50:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so37227862wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IypA3P/8cnZhtmhdwJ5dCz46KvUhqlaGdCRMCeEVlmY=;
	b=tx2OoXj/mJ8vfDO5w2oDAv4JWphOIOu0T52bhGuDrC9HgeSZ8w7aB1PFhjSMOtaTSU
	WkPA2DGESfFyQE+434xnfJRGW60pmn1AFeqgfLpL73hc0hG4+2YKQH3h7EAzWOJEXPb4
	jLrtty/5FW+vkOyCq2sAZsEvmvF1OIa5IbDdnIRJnOgWXZYrjpR9PC4pUXLLD+TxfyS7
	wHnf+x7QhyDVjZR0KYKnxdnKmL142yMeWZ6G+9ryz+X5jWqx6KzbiRTjFnnF5vpGMxm8
	zaZ+q2TolcHYbiQ9wJZwiKszOemjoe/QGvCjIpkkkaHKhvrEk9pbw0ELagq+MjwjL2bg
	nfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IypA3P/8cnZhtmhdwJ5dCz46KvUhqlaGdCRMCeEVlmY=;
	b=e0NitirfKBuGvdzc3qOHfCb3FYOEr+R8uDUUWeCSQG6MGVCrm97UoDMdRBBt+F3LKZ
	OQs0Wm3XASC0wygfzFRZvaOU+OtfGS7Jl0FqKMuWxzrxncub2kt/HC60aI2p5pbXrya6
	v5WVl+9guRJ8ydHOsrZE7Oy9sEX7yg5VgG22hpTnsH5LbMf94qrJCE7buH9u72/++Kjm
	c9WRH+ms+wk39MknHVGY7lR5xgor2JlJVABsicKutZmDwoKlYyZ/huQo5Xe5oeQcrf7e
	B1migvh2BgdPn67RnAy/aMNyyW/FWGBR/bQDgkwqICqfCcZAy8LTifKJhTODoPTvfIkR
	hNLQ==
X-Gm-Message-State: AIkVDXL/3zLXXbKr6FAQmioC35VKjAzYD2z1WW9ry9HVh6mare6IEn+IH4dWQ6EpGTNImw==
X-Received: by 10.28.153.10 with SMTP id b10mr11962696wme.103.1482425429939;
	Thu, 22 Dec 2016 08:50:29 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i15sm36373185wjs.16.2016.12.22.08.50.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Dec 2016 08:50:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Dec 2016 17:50:29 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20161222165029.GE3544@jama>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
	<20161213234618.31312-3-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161213234618.31312-3-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 3/8] opencv: Add missing depends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2016 16:50:30 -0000
X-Groupsio-MsgNum: 64484
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline

--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 12:46:13AM +0100, Ricardo Ribalda Delgado wrote:
> contrib/modules/sfm depends on glog, gflags and libeigen. The CmakeList
> does not seem to provide a way to disable/enable its build.

There is also floating dependency on tesseract as shown in last test
dependencies build:

opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-text rdepends on tesseract,
but it isn't a build dependency, missing tesseract in DEPENDS or
PACKAGECONFIG? [build-deps]

>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index cf41d894cf7f..a5d681e79ca2 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -53,7 +53,7 @@ PACKAGECONFIG ??=3D "eigen jpeg png tiff v4l libv4l gst=
reamer samples tbb  gphoto2
> =20
>  PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBL=
AS=3DOFF,libclamdblas,"
>  PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=
=3DOFF,libclamdfft,"
> -PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,"
> +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen =
gflags glog,"
>  PACKAGECONFIG[gphoto2] =3D "-DWITH_GPHOTO2=3DON,-DWITH_GPHOTO2=3DOFF,lib=
gphoto2,"
>  PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DO=
FF,gstreamer1.0 gstreamer1.0-plugins-base,"
>  PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"
> --=20
> 2.10.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFwEVAAKCRA3VSO3ZXaA
HGtUAJsHPmNamCRiyIGm1/La6nYiKmZTPQCdFGuF4II0K4kh4efQLn72HGTZ2bA=
=WJNq
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--

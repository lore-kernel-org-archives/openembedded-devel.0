Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2049D65FD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 15:21:36 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id p9so2610176lbv.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fofAPs4JNYFj/sMNBz8KJPHn9pBtzODuUgmpzndn3Ow=;
	b=fsbzzrUU6SyB2lpH7Zc2oKwbKvmSYm5tlo7tle7LqFEfCdz6HYckAxCj2ZlnuoFeIP
	gs0q4XmJxsbtf7qpIXZu9BxTCwkcymc1MTM6TWW1CerLxiDVQD3Qrno9ZUBDrrclAPln
	MhKPOe9ZpXKys6qH8LzAkPQX2yQKDF2b3GbV/Gc6RpE4W4YR9jaqPxhZSD6PX+UaqJUU
	dOcjMvR0aG48D8rwcoYw8jcH1JfihKKmNMJrCdqE/92tNvtmVAfBs96fJKZVyziDG8Hc
	BDTxcLBptn3QfuY1tQ3bsy+bP7OS29yAsUDeHzO2Kk0/tTlyK4PSJYZtoTV9vh+OAnK/
	4gIg==
X-Received: by 10.112.147.136 with SMTP id tk8mr1003877lbb.95.1399389696969;
	Tue, 06 May 2014 08:21:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k2sm13846682lbm.23.2014.05.06.08.21.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 08:21:35 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 May 2014 17:21:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140506152156.GA30955@jama>
References: <1399376593-8768-1-git-send-email-nickdademo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1399376593-8768-1-git-send-email-nickdademo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git. Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
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
X-List-Received-Date: Tue, 06 May 2014 15:21:42 -0000
X-Groupsio-MsgNum: 49718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 09:43:13PM +1000, Nick D'Ademo wrote:
> ---

You need blank line between subject and SOB line otherwise it's all
considered to be subject.

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

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNo/hQACgkQN1Ujt2V2gBwpNgCfWBIb/9txFk7DwO3Bbkv6Hfir
BksAn3oWaXXbqzLL22o2xEkGuelwTTT+
=OnGh
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

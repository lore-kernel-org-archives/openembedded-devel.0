Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2D4745A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:53:39 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s14-v6so8570573wrw.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1gpwDK4qUpyAmyV96BDFkBoAV5VWapD95RcwcFPcUG0=;
	b=sNvV5jUWrB1KbZH0Nw9tTlRsed2OGS1RzkTaLRMfJF790UkehHtAyLWys7jTcNkJVE
	uSBO9u84U8cqXVrFW/waBF3bFbheDzz8+LSyqRkB3iArI27qx47R1qe52i4URIOqbOjA
	DkmrIiCM1jnWrkPqSttiZyvAXBex4eWuPYGjh2D4K66h8iWlvQ6tKiXgksHe24Gr0WpI
	0AsTK+oeYZvAPI175M+l0t4vUK/JzVxgOWuChMAnovhjT/UYVknHUo8z48P3uaH8tSdX
	qB07XQFm1bVZDO0uPNm74BcxqjP+AHo4cfwKDb94WBsw6Vw71Fob7HDXLn1DbFvv52Lh
	NHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1gpwDK4qUpyAmyV96BDFkBoAV5VWapD95RcwcFPcUG0=;
	b=CMyul4e1Y4yCOZuN+mYG48LUaYJxSbBwGpfW/8z9tACVJgowJO4NWzSL/4vzatbIBo
	u4Q+uoGTdFbVREktII/U07qhxBMexxy2wDo8mGBSjZvFwYadAPkMhhykQi5akurf3MNl
	0vJPRu+aV6D/HAMTXCDcJDSGeDyQWDUY70C+TqdEh1XT9tGDrNAy0EUA/5OsVH3aWuRO
	y6i2rXErFn5gCXlR0QIhrvCjgMR2V54Acxh+9DyIatpZCocwwrYW8wtzXvFGWR/W3mYI
	XIe4AfLMf0gFtysCgRjPheIyU0gsuYdPEjjcPk4raXH7JJVJP2es0s3tPoUpX9vKmKUg
	hhVw==
X-Gm-Message-State: ABuFfohkjQ++qgF2jGXesKhiKLZrwFMbGcIkS7JbABw7/CHdufOH2WpT
	27aYftZY0k0dXz+YG/C8T2kqiwIY
X-Google-Smtp-Source: ACcGV62MvrGahhK8dF7RcV7S8/hsrIRcTqd7YI49ObYJyNUp9w0jXqeYnJweKyLIKfzlkzP5DyE7zQ==
X-Received: by 2002:adf:f7c1:: with SMTP id
	a1-v6mr1200193wrq.152.1538207619731; 
	Sat, 29 Sep 2018 00:53:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b13-v6sm5692633wru.51.2018.09.29.00.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 29 Sep 2018 00:53:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 29 Sep 2018 09:53:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180929075340.GA1449@jama>
References: <20180910184016.6156-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180910184016.6156-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [meta-oe][sumo][PATCH] xmlstarlet: Disable PARALLEL_MAKE (again)
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
X-List-Received-Date: Sat, 29 Sep 2018 07:53:39 -0000
X-Groupsio-MsgNum: 74781
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2018 at 06:40:16PM +0000, Martin Jansa wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> * MJ: this was applied for 1.5.0 version in:
>   https://patchwork.openembedded.org/patch/116023/
>   then removed with the upgrade to 1.6.1 in:
>   https://patchwork.openembedded.org/patch/141059/
>   but as reported before this issue is still reproducible
>   with 1.6.1
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

ping for sumo

> ---
>  meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/met=
a-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
> index e3d52e616a..e28fd61a03 100644
> --- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
> +++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
> @@ -24,3 +24,8 @@ inherit autotools
>  EXTRA_OECONF=3D"--disable-build-docs \
>    --with-libxml-prefix=3D${STAGING_LIBDIR}/.. \
>    --with-libxslt-prefix=3D${STAGING_LIBDIR}/.."
> +
> +# http://errors.yoctoproject.org/Errors/Details/157121/
> +# /bin/bash: src/usage.c: No such file or directory
> +# Makefile:2121: recipe for target 'src/usage.c' failed
> +PARALLEL_MAKE =3D ""
> --=20
> 2.17.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW68vCQAKCRA3VSO3ZXaA
HL6MAJwIQiUkWy+zpmS/YMw37Y1+6rPF6wCfaVsyx2s3vK+7BjTt4mIrbL8+iMU=
=VKxQ
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

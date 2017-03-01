Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A811072FA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:56:13 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u48so6705381wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 10:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iN5zDbWa/al92SKoW6eyrGz+miWanIkABbOxi4SgURw=;
	b=Gi3dY/mCRW1K59tXJ6yRKfRJwzrnXBY4Re3n1OTtBSusnQOEXb2qXqVdXqZBRoz5Oz
	KCB3fF/v8+BfZ4Hh6DF+C1bgvO20Gk+Xq0+ue5x/uXbbqJSRhlNyfqLjqo6YPHOdSSfr
	9cA86JLeE/xGf1QGsjsACXi8mVHJVkZd+orLIpYd4A5cWgk3cThSvTNwYL8z6x39JkUT
	gvGfO2X3yKIYA4lbAMMf57PwhtJmBHo8CXkurvYpa6hNQf9w0kpN/0hv+jzf4Zr7U1FE
	18XfKn+qgD5LES60h/NfWiz15VHnmfQ2K261+y+vY8pbPfhHtiHeSTTS+sC4dA6kPnNS
	FKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iN5zDbWa/al92SKoW6eyrGz+miWanIkABbOxi4SgURw=;
	b=CJ5eXG/YE8a243qnrFkGeQC0bpXlEWJoG77dz0iBxwWxq2B+qPQCIu9CbKkVmy2aoo
	pwn3TBnREGGnJrXIb7rieskrkB3N/tPwwCf9jx6Ekd9hpAKdb3G5IT5mLDd6EKHZlVWa
	d64p63+ZbhrZiD6tKGIIKcb/JqLj3NmNt/89lB5ImXKUcMfbHoPlnOuyf6XA3GScsQv9
	DLuHNNg54w0Lr9VX8Fn1+H6ostgD9q6swiVd/OxyCgOJYc+Of7eXjUs/JEsluxNsBcOH
	RU93Zx4DQRu6CsXbW7Q7s3gXlOCOCf9oLozUHg8aS24iYfc2L58Ea3a7pulgKUx/w9Go
	QoIg==
X-Gm-Message-State: AMke39mOfjGdRLNtQMuBDlCf77q+AFI78pyQcFptB4/9eqOVjyW8aB9qkpKBrBzErkcGXg==
X-Received: by 10.223.129.230 with SMTP id 93mr8458860wra.41.1488394575141;
	Wed, 01 Mar 2017 10:56:15 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s18sm23967265wmb.18.2017.03.01.10.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 10:56:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Mar 2017 19:56:14 +0100
To: Derek Straka <derek@asterius.io>
Message-ID: <20170301185614.GD3290@jama>
References: <1488317150-20810-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1488317150-20810-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-ruby][PATCHv2] bundler: resolve build issues with RSS
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
X-List-Received-Date: Wed, 01 Mar 2017 18:56:15 -0000
X-Groupsio-MsgNum: 65638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline

--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:25:50PM -0500, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>

Fails the same as v1:
http://errors.yoctoproject.org/Errors/Details/134457/

> ---
>  meta-ruby/recipes-devtools/ruby/bundler_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/r=
ecipes-devtools/ruby/bundler_git.bb
> index f2d8f3c..8388cc3 100644
> --- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> +++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> @@ -26,8 +26,8 @@ SRC_URI =3D " \
> =20
>  inherit ruby
> =20
> +DEPENDS +=3D "zlib"
> +
>  RDEPENDS_${PN} =3D "git"
> =20
>  BBCLASSEXTEND =3D "native"
> -
> -PNBLACKLIST[bundler] ?=3D "Fails to build with RSS http://errors.yoctopr=
oject.org/Errors/Details/130640/"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLcZTQAKCRA3VSO3ZXaA
HNgSAKCq1Dzutj6ZadRK9nY8y8h4ENOK5QCgkofQWPrEt5HeSwg9bF/AF0JkJoM=
=fhJl
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--

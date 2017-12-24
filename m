Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 63C9878678;
	Sun, 24 Dec 2017 07:34:42 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id w68so18692024wrc.10;
	Sat, 23 Dec 2017 23:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+rTXY25kEks5lyJ9WxqT5TAsMgl6H7lh1udB/ekjsjc=;
	b=fe1+LsNnmNNyNiQplEyceaZxIzGcTkYlTH7oeuEAOM8iG6QO0Ik3nAcV0mWkV10c+O
	ZRGySsUkQLf8E/8bzSxCGiYvjaC5aNiAkJQ6HduEXeKZNbbRl3u9eJLnqDdvMX0zIJmX
	yRVOJULjczIuq/hpD2S8TcX0fjcuc0+aPNwXVSGf7goWeKpa6FKCZ4ued80YXYzSSh6k
	Cj0M9CihArH4chZTGAMjg0k1hKZs6X/j7G14rgmFWFuIVP9f+0mvF90DwkGR7Ur6uiBJ
	MmCVgDDRSnq7miwYyPrMVbw0XKMPBAinJuPh165BJsh5SmwU8Mjdvno96tOPHUcdIqEl
	vjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+rTXY25kEks5lyJ9WxqT5TAsMgl6H7lh1udB/ekjsjc=;
	b=SgNSAMe95pONVFu8IWjJkfUMu8+A2rHtwVB9dE+kT3uLJ2pOSMl4iiOIWfciunvN4+
	KRez5uC4vBBAcBkgx9qAVtutwO3Xc9rlme3XWB6FsceesYLHMe2Scwl8LAuk4QE+KTaE
	OkPfQn4+W7JmJtVkkM1bG+s1YJquSpxZ8PXQFmrmeqL0bBcG4yQOZfYyTLZHkAjW4oAD
	b4EDYF33yraTr1Wsud/cF7km2+xjj9bjYOApqqKWYDqkPPAl9mTr8uzUG3GkBXPB/BRI
	NDWY189eX+8SOuf+GzOs0g7quhPNCqA629vXjclbc1bXJQDH2dFCVcoIlYlx7OyXzOPR
	wsug==
X-Gm-Message-State: AKGB3mIz8HEg62whJ+Ygti0e6fs4fQ7fMt3ahsrO+3uCBM3f23ALwKBb
	TODKXuOJ1qzFzxkoq9unv+ZvGw==
X-Google-Smtp-Source: ACJfBotn32l7P8hV+/9xY/Vza+pb+ZhFpawSX19jPgLeWrTS3ROH6XBpUFrFBqjF0mkephbjQ1g6nw==
X-Received: by 10.223.148.194 with SMTP id 60mr16891405wrr.39.1514100883479;
	Sat, 23 Dec 2017 23:34:43 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s86sm9499583wma.29.2017.12.23.23.34.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Dec 2017 23:34:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Dec 2017 08:34:43 +0100
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>, Bill Randle <bill.randle@gmail.com>
Message-ID: <20171224073443.GA4127@jama>
References: <151400211887.5101.9516674106915358280@git.openembedded.org>
	<20171223040839.6971C2355DB@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20171223040839.6971C2355DB@git.openembedded.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 14/30: python[3]-flask-nav: new recipes
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
X-List-Received-Date: Sun, 24 Dec 2017 07:34:43 -0000
X-Groupsio-MsgNum: 70098
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2017 at 04:08:52AM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> armin_kuster pushed a commit to branch master
> in repository meta-openembedded.

Hi,

This depends on 2 python-blinker reviews which weren't merged with this
batch, causing:

ERROR: Nothing RPROVIDES 'python3-blinker' (but meta-python/recipes-devtool=
s/python/python3-flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-blinker' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-blinker']
NOTE: Runtime target 'python3-flask-nav' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-nav', 'python3=
-blinker']
NOTE: Runtime target 'python3-flask-nav-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-nav-dev', 'pyt=
hon3-blinker']

Regards,

> commit 55d77b7e3f81dff333cbaa3361d02249943a8fec
> Author: Bill Randle <bill.randle@gmail.com>
> AuthorDate: Thu Dec 7 21:49:02 2017 -0800
>=20
>     python[3]-flask-nav: new recipes
>    =20
>     Signed-off-by: Bill Randle <bill.randle@gmail.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-flask-nav.inc    | 13 +++++++=
++++++
>  meta-python/recipes-devtools/python/python-flask-nav_0.6.bb |  2 ++
>  .../recipes-devtools/python/python3-flask-nav_0.6.bb        |  2 ++
>  3 files changed, 17 insertions(+)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/m=
eta-python/recipes-devtools/python/python-flask-nav.inc
> new file mode 100644
> index 0000000..932ccdf
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-flask-nav.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Easily create navigation for Flask applications."
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D2729ee82259d601d90d28b0574d1=
2416"
> +
> +SRC_URI[md5sum] =3D "4d51cfd06d58f8d0fe85775a6696c0e5"
> +SRC_URI[sha256sum] =3D "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf3=
6b3aca2e110a33f4"
> +
> +PYPI_PACKAGE =3D "flask-nav"
> +
> +RDEPENDS_${PN} +=3D "\
> +    ${PYTHON_PN}-blinker \
> +    ${PYTHON_PN}-flask \
> +    "
> diff --git a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb =
b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
> new file mode 100644
> index 0000000..30b5b3b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools
> +require python-flask-nav.inc
> diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb=
 b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
> new file mode 100644
> index 0000000..d251152
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-flask-nav.inc
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWj9YkgAKCRA3VSO3ZXaA
HAhAAJ97BQoC9buOE1z5epbb0aEwIFp0RACbB49xkwdzbCNZw6S3Ro2IXkNGTDE=
=0Y7n
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

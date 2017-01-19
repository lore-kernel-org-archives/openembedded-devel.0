Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 30E6371A62
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 08:41:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so10280805wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ra6jmrH7Zdjq4UH3PirmJw3mfPk3ysuo6A2mV1KGReE=;
	b=niLpsP0Ho2ZttAECTA/9KL0g0HjRRBlSIzdrIAxyRDsFOeiQUdBjF6dKgTbTHz0BTO
	Ll2W1E92TzLo3BrXwpA/LZNzkEuMPz9wm+qyJB66Zro0nBYyjglXKn2HPJTFzLsCc1pP
	sbGQDuUGt0XHWzgLTpwwnr5bFUKYPf5guecr6bux1HosMw7AGxpYspL9yG7NnBGPjW34
	Nn9ZsDidopsPsdspOC08bqrAUhSjwjT2/mz9m4F+9jn4vckU/k7ZqhGHDzdppe4x6Cvg
	NIMItj64nfw/odnQC89MLNR1tGnbAeKGp/hYkxCndhVGvrhas/a0SBBPO/tnTICEpKbM
	AGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ra6jmrH7Zdjq4UH3PirmJw3mfPk3ysuo6A2mV1KGReE=;
	b=lGKtdgzAC979f1gXvT+8NNUZMWyMUAj8cf4/1uolarDef4pVo7LPMx2kXbT2zKgBUP
	ECLNYU781rBvoUnN7kqSg1oKkYJAQhiHW58EeTvJN27qr8d1T3PYvhW5RqNTUwejgiWj
	n95DSQVGvFPYxu4To+WGyZ/WHpI+Wd+C2pRChWwdO8wXc2Lk7gC5rjLRGHECFnojho/c
	hlxv+Nry1ievYeaSQt7sSWnhY9SxgTsU/U7a8WcoBAlKoan9n0SPZ/nWABVLiNz3oxF+
	sk1bc2JTfiBwjmJ0Ymc/1D4WWlwnLGMVHgzoxGcsM8Gn7SB1fO/5vqDdxrsnmH8JBLp1
	Fssw==
X-Gm-Message-State: AIkVDXJCLbDYDbpMZv+5IUmwRTio39BNIffo8V2TkRljLoQ6yLu/HonbWZQLPbgpxavEEQ==
X-Received: by 10.28.229.193 with SMTP id c184mr6660044wmh.83.1484815285822;
	Thu, 19 Jan 2017 00:41:25 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v143sm37498462wmv.4.2017.01.19.00.41.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 00:41:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 09:41:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170119084127.GA3265@jama>
References: <1484778080-10983-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1484778080-10983-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 1/1] cppzmq: derive PV from SRCPV
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
X-List-Received-Date: Thu, 19 Jan 2017 08:41:26 -0000
X-Groupsio-MsgNum: 64786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 02:21:20PM -0800, Joe Slater wrote:
> Currently, PV is "git" and contains no version information.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/=
recipes-connectivity/zeromq/cppzmq_git.bb
> index f41cd0a..ac28a3d 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -3,7 +3,9 @@ HOMEPAGE =3D "http://www.zeromq.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f66=
e94"
>  DEPENDS =3D "zeromq"
> +
>  SRCREV =3D "68a7b09cfce01c4c279fba2cf91686fcfc566848"
> +PV =3D "git+${SRCPV}"

This format is also uncommon, I've changed it to:
PV =3D "4.1.5+git${SRCPV}"
when cherry-picking to master-next, 4.1.5 comes from zeromq as:
https://github.com/zeromq/cppzmq/blob/master/CMakeLists.txt#L6
uses ${ZeroMQ_VERSION}
> =20
>  SRC_URI =3D "git://github.com/zeromq/cppzmq.git"
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

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIB7XwAKCRA3VSO3ZXaA
HBimAJ9wjgIsw+xhMF5pnSqSuKb9HU/OzACgmazbbw314Up23HdxyzgexCie+sE=
=2QEq
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

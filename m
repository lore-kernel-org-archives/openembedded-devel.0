Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03C8C79A13
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 09:43:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y16so12864716wrw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2018 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WpdpaZ4FNdA3HABddGNBT2FgeQ6jMErDTEa0yjdmYlY=;
	b=WibjoIDGs9ykHMDhy6JqRa/uWCbdHUQlGoGTbLORq1BwYPvQ6nFC9O8JukrTXXpvD7
	RgvvLPy3+yrPtUWqgcgwi5NsyZbTaP476xIsCXKpK913l3u5yTEyIG3XuooKW1MgLacD
	c9F9ZY1R8QuxFRAA9UpT7FF2cpwiQ0PF+/ybZ1Y5Fglio7HdCXmG4quz2P9ZFIQxhuRJ
	Dkop4MAEvag4ShuzjsS34gejoxtqCS+NrxIzh2xwC1IR6y5SgXn4zVf9MSZe3IvFN7rC
	B1MkNbX+fhmiW9uOiojZ5h+6FjvgZwmWkDl4kn9SkUM9kd/zrPl5gmh8Ig6Rd3KSNwuZ
	5VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WpdpaZ4FNdA3HABddGNBT2FgeQ6jMErDTEa0yjdmYlY=;
	b=iohvULT43C1/uwEMhpBKcHlWFos+dTY2BbpZx3CUyXEgTVwFW0sfwbZU1d5iNUQmw/
	0xUXEJCzMOAgrPM/gU/NMNPJYGznazkXORjCciL1GXcJQSqZf7vFGD4vd0pp7RlF5p0C
	+PxG8UKKoymX6VGnGzHRLBoRkktVhr6BZREoCrWef3S1DjhTeGrN0CFMpCK/Nfw9DA6F
	Jg3KJX/QFZ7nuEGmrWp/4ONQQ6aDvqgt6I4X97NSwECicZVy7G56FmI0oDjJWPxbCS2Q
	ecE4B9KCQgG12B+w/dmCFSJXBngnnbgTby5FoLR7TCA3A/krNeSLg82bjCTk9fQbNq8c
	EG0g==
X-Gm-Message-State: ABuFfoiWTsMh/LGwB7Ayqp9HIHaEC3GGZG8hLfouDPW+HmtbjiuUZFhN
	8hBVfFF2iHeelDTGRH6gu9E=
X-Google-Smtp-Source: ACcGV6131TWgG4GoD61LHQZgokLa2DhxnMOK3ZFFL2fczcff0/3DPOLSN3YL1h8jPSod3qbymIossg==
X-Received: by 2002:adf:e681:: with SMTP id
	r1-v6mr7768382wrm.294.1538732638474; 
	Fri, 05 Oct 2018 02:43:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	90-v6sm5835091wrg.86.2018.10.05.02.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Oct 2018 02:43:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Oct 2018 11:44:01 +0200
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Message-ID: <20181005094401.GA1334@jama>
References: <20181005091722.105122-1-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181005091722.105122-1-uvv.mail@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ceres-solver: Removed empty package
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
X-List-Received-Date: Fri, 05 Oct 2018 09:43:58 -0000
X-Groupsio-MsgNum: 74866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2018 at 11:17:22AM +0200, Vyacheslav Yurkov wrote:
> By default ceres-solver provides a static library and headers.
> This change removes an empty package and sets an implicit dependency
> on dev and dbg packages.
>=20
> It also addresses missing cmake configuration files in dev package.
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/=
meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> index ad7c8f2a3..13ca8efab 100644
> --- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> @@ -13,5 +13,8 @@ S =3D "${WORKDIR}/git"
> =20
>  inherit cmake
> =20
> +FILES_${PN}-dev +=3D "${libdir}/cmake/"

Why is this needed? cmake files are packaged automatically since oe-core
commit:

commit 543e39ad5e2baa0f1ece013a89483783e6b15dd9
Author: Andre McCurdy <armccurdy@gmail.com>
Date:   Tue Jun 26 12:48:11 2018 -0700

    bitbake.conf: handle cmake -dev files packaging with default rules

> +
>  # Only a static library and headers are created
> -ALLOW_EMPTY_${PN} =3D "1"
> +RDEPENDS_${PN}-dev =3D ""
> +RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> --=20
> 2.19.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW7cyYAAKCRA3VSO3ZXaA
HLwkAJ4mpdRuEOEyeM+f4Mj20MhNRBtYgACfQT+2sSJfEAf7EQo5nGvVCFrvsZU=
=ti2r
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

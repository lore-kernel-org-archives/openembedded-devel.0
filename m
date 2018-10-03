Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id DC1997454B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 06:35:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z204-v6so3544217wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 23:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=brO/uJz5IcsfRlPyvXqUDbZDJJc9ZYFhAiwTWYNRRaA=;
	b=C9j6IoiZkCk0Z98Lbd/ZYjCzUCmzBTBG5RskZAw7DLehebeNmujLjLfzaaS5rwBEGm
	jS14M5GjX8cV7a1m5x863Qdv5tZoyGO4ygit0pxXUl55cY9n0wcqTfHEK6uWb0n4Skrx
	v8wXoK1hfW3X/txM8JNxooGAQ6HmytZkQ5LuCdOXhIK1xxYHjmkdOABYwFhMiQ+SPcXC
	3eWox+iq6UOPrq7847on4dEoXOyaRk2p2gyUBa1ui9VfLaK5zh4OnGhMeIuH232RaCqx
	FXKBU9YE2A5uQPyYwmO1YCYVz3kCE1opTXCuWStHRoScoNjNT13joHm+gnYU5Y6CBZZ0
	5eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=brO/uJz5IcsfRlPyvXqUDbZDJJc9ZYFhAiwTWYNRRaA=;
	b=Q8O7ZyUdxh1mtMlV3lnNyZtB+/TkyG01ew9JMv3dzN6V5/D5LrPZhkwJo6IvXhFybC
	DJwkReNKCrnNMRu2HherRlpy4lqisXYX2IZP8qRpa9CPRc1tYFvsuWORy1wLTKzm7QnK
	kH2H7MvqfRd8wS0K/c9r8rCtNtYV8DtAAT+FdqBANDJG/A1BR6oNIeYU4hubMfKrdqAe
	sGrne2Owx8FpAjZCBhmeDcx3hAGMZk/Tv0pqJL8MPWLVUNB0daRcSoR5WvWPnl38Jzip
	Z/wHihAMqy5GPQSVziDEk370v/rpPmNBCTt9gmYtCCTokfgfU+xlD1ylcMB1dKY/saZL
	tjhg==
X-Gm-Message-State: ABuFfojH6ItOmG+0ItaTz2nvj8ccimq5kpwL3ecsnrR2IJkK7tPVj0DI
	+JFUkIXk1vheDMCCu4N6Wdo=
X-Google-Smtp-Source: ACcGV60E/IR9kIEVk8kL0rzuQfBWE/Nez1tiRUDgzg+7949GEssDldJAmu1AIeCb+cqULm8qIjkgew==
X-Received: by 2002:a1c:5fc2:: with SMTP id
	t185-v6mr351369wmb.12.1538548501282; 
	Tue, 02 Oct 2018 23:35:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y12-v6sm273429wrq.33.2018.10.02.23.35.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 23:35:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Oct 2018 08:35:00 +0200
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Message-ID: <20181003063500.GA1336@jama>
References: <20181003062422.35229-1-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181003062422.35229-1-uvv.mail@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libeigen: allow empty packages
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
X-List-Received-Date: Wed, 03 Oct 2018 06:35:01 -0000
X-Groupsio-MsgNum: 74834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2018 at 08:24:22AM +0200, Vyacheslav Yurkov wrote:
> libeigen is header-only library.
> All headers go into dev package, therefore the main package is empty.
> Dependency on the dev package doesn't work, so you have to allow
> empty package for build to succeed for recipes that depend on libeigen
> (e.g. ceres-solver). Otherwise an error occurs that empty packages
> are not allowed.

I still don't understand what the issue is, there is already
RDEPENDS_${PN}-dev =3D "" and similar for ${PN}-dbg.

Creating empty libeigen package to satisfy dependency from ceres-solver
doesn't really fix anything (just installs useless empty package on
target).

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.3.4.bb
> index 31a42a9d6..a59320655 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> @@ -18,3 +18,4 @@ FILES_${PN}-dev =3D "${includedir} ${datadir}/eigen3/cm=
ake ${datadir}/cmake/Module
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>  RDEPENDS_${PN}-dev =3D ""
>  RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> +ALLOW_EMPTY_${PN} =3D "1"
> --=20
> 2.17.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW7Ri4gAKCRA3VSO3ZXaA
HEwTAKChQ6urZM6phVANgBM4WOdZn5HNAACdGcNN0WUCrAuxg+uB3uqK4l3wZy8=
=Z9Sz
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

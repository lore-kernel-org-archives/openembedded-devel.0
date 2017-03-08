Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 36B277787D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 10:18:19 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v186so110845243wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 02:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GJxZiXo1TeQsK3pBYvOyONa27j19Z9aRK2ph6t6tDa0=;
	b=IrXWQAgG8CIGzJnGPTtlhcQvYoBM+yIWe9MoDnt8Q4Z4t9BaOQ7EWJocTvemefBvEW
	afuMeYsnZqHZi13a4awrCNTz1IRP2lI2IeajMjLwvjDNQBce29HMmcMZvYL6bb+nvfEL
	u5nDSqLS0I6Zlq8rwk0yN/PS/6eayHtOFIzPNE28xAmY0whXccNQpavK5aDqv/SID+ro
	fnyb7YiUFPBo7PkOf6eLPSgaL8hnYhzwIqfysG2Thj98TsQ5WDBaeSvOpyJ7NduCYATe
	ydkWKp+ZA1YolXwYZgeIFURDfFypYlE/XFPF4G8uA6PfbaM7NYmzWSjTX3TfB3TmYtVh
	vr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GJxZiXo1TeQsK3pBYvOyONa27j19Z9aRK2ph6t6tDa0=;
	b=O0EmxJEHQ2iEfM6kfHsvH3yaxkykwdvR17DASrJ4Sb0+lx7QOxHmme9Nu++Vzhi6P1
	gU2zKdHcTny5lLooan5Wa1Ud+NN8fnIm9V6QO8CgF5gGEcLFNiLE6auPBqljSELNtSHg
	cEOJcMuF1RWNLenmhvhOxkgiU70lnCid1QttubKf96wCYpEdrCWewQA4UoThJVwL2LLc
	KC8Mc2UTqd7E6+vlIj5I41LOp0ecMkL2yCo/RxECxVrzm37DkVzC2+QVRMFhlDQkUWQQ
	hDA43P/nmlcW6+AZnj42N2D5E0ac6N93rSQugVtQMGsx9C3pl+WQgKtFNz53X0L+orsO
	bQmg==
X-Gm-Message-State: AMke39mQ3mzIm+fNLzvsF8inG29iBn+LDJxTfJnjdTDKPKkAapQ9rLRe0DHcWZyW1xWmyw==
X-Received: by 10.28.9.213 with SMTP id 204mr23134292wmj.89.1488968300814;
	Wed, 08 Mar 2017 02:18:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q75sm4070677wmd.27.2017.03.08.02.18.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Mar 2017 02:18:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Mar 2017 11:18:21 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170308101821.GC3279@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-4-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170307071349.16444-4-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 04/14] gpm: Update to use git src uri
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
X-List-Received-Date: Wed, 08 Mar 2017 10:18:20 -0000
X-Groupsio-MsgNum: 65722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline

--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 11:13:39PM -0800, Khem Raj wrote:
> Additional patches are upstream to fix build with gcc6 and clang
> Add systemd unit file

And one more error later in do_install:

http://errors.yoctoproject.org/Errors/Details/134813/
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gpm/gpm-1.99.7/eglibc-2.17.patch               |  12 -
>  .../gpm/gpm-1.99.7/remove_nested_functions.patch   | 326 ---------------=
------
>  meta-oe/recipes-support/gpm/gpm/gpm.service.in     |   9 +
>  .../recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/init   |   0
>  .../gpm/{gpm-1.99.7 =3D> gpm}/no-docs.patch          |   2 +-
>  .../gpm/{gpm-1.99.7 =3D> gpm}/processcreds.patch     |   0
>  meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |  52 ++--
>  7 files changed, 31 insertions(+), 370 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.pa=
tch
>  delete mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_=
functions.patch
>  create mode 100644 meta-oe/recipes-support/gpm/gpm/gpm.service.in
>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/init (100%)
>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/no-docs.patch (=
93%)
>  rename meta-oe/recipes-support/gpm/{gpm-1.99.7 =3D> gpm}/processcreds.pa=
tch (100%)

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWL/abQAKCRA3VSO3ZXaA
HGa3AJoDLFMIUEqMa1YwWWHN1eWa7M7hrACeOYZCJfBeoVsR2FfNEw3dUekIv5k=
=24PU
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--

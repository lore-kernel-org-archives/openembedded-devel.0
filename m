Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86BB377F90
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 21:27:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p18-v6so6591769wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=i3oFZL84vwN7+YRLnjYRSH8jPjYrUg6uhgfzSLgmiWs=;
	b=CKEK7bq4C1NQDdYl4S2V3/PTiretRqJJunuJRFA9CosEpraV3fNsYFKJZSL5Cyl6tv
	rsgR/Yx1Jlo8mt0gl9XrDcbvCQx1RaOhs3bJquzqyP32ns1X6uIdMmu+FvhUS4YrcezP
	7Ii/rFAwwGA9Tajf2RKK2N2wbgYRoReSFB94//qSgHpsvPhfdQBR6EiIAvClOr1k5uTF
	2fhFDSipPMiQkXjvwzYDOzpbrptY6OTzhafJS7/9cDGqUcP0fcsT9Hwa9AJ2AMvNWwcO
	odbjZS2LWQcEmFxVoUbbbsBK6rwNMevy9GLV1neNtpB7mbQH7FAkjryhOwFk0fSuWLsG
	MrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=i3oFZL84vwN7+YRLnjYRSH8jPjYrUg6uhgfzSLgmiWs=;
	b=gGnJN4mQ4zVIcgL0uMRt65P/h2Us79HKJ1iygHyIotcY4FQRSjELXKUxPn8HUFQtam
	ha6u31WfhyCihGnX7e0waJk3aOvx9TZv6tL75IURUh0hPCM9N80KsU8pzxhtG5LyzmQp
	DwMcmOuWnCsLhhK6QKwzJ6RpNl6pG420V7L98Af9IO6c/QqpD/+02Szo1uEr/dONRXIZ
	ECwJ3Jg0huEZcl98pwRKJgsxXUkHvxFQx7An5VjCJYH6kLSged26zTgaT1TbqWRgdVp/
	7Ci+2EAnKxlGfHyLFX1BVhhoa9+sc7f2PnTRHDuyDuXcjKak4hywOtvOx2VNgFSNbRmG
	nyaw==
X-Gm-Message-State: ALKqPwe3wydW1uhCmYWhmYKBMZWrykqGAaeWQmzNXY2+Pk2bg/lmXMRg
	+ovOhtMgZTJvFagiMWkq52clNA==
X-Google-Smtp-Source: AB8JxZovI7U5WvrwjWJA8EK1DjBz5+Fg+sjOjtQfnDu2FyS0bzKdgKgjd0VPMhBnUc2JVVQjp88oqA==
X-Received: by 2002:adf:8703:: with SMTP id a3-v6mr460564wra.178.1526074037813;
	Fri, 11 May 2018 14:27:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x16-v6sm2173392wmc.2.2018.05.11.14.27.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 14:27:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 May 2018 23:27:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180511212720.GB2141@jama>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
	<20180511192145.7811-8-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180511192145.7811-8-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Subject: Re: [meta-networking][PATCH 8/9] spice: fix nativesdk build with security-flags included
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
X-List-Received-Date: Fri, 11 May 2018 21:27:17 -0000
X-Groupsio-MsgNum: 72141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 07:21:44PM +0000, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

this isn't working (and isn't needed) with latest glibc changes from:
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150436.h=
tml

please drop this one from the series


Instead of this I had to add:
# git/server/event-loop.c:146:42: error: cast between incompatible function=
 types from 'gboolean (*)(GIOChannel *, GIOCondition,  void *)' {aka 'int (=
*)(struct _GIOChannel *, enum <anonymous>,  void *)'} to 'gboolean (*)(void=
 *)' {aka 'int (*)(void *)'} [-Werror=3Dcast-function-type]
EXTRA_OECONF_append_class-nativesdk =3D " --disable-werror"

as temporary work around to test nativesdk-spice with gcc-8.1.

> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
> index 1b65d6fd72..257159f374 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -35,6 +35,10 @@ inherit autotools gettext pythonnative python-dir pkgc=
onfig
>  DEPENDS +=3D "spice-protocol jpeg pixman alsa-lib glib-2.0 python-pypars=
ing-native python-six-native glib-2.0-native"
>  DEPENDS_append_class-nativesdk =3D "nativesdk-openssl"
> =20
> +# Otherwise nativesdk-spice fails like this:
> +# http://errors.yoctoproject.org/Errors/Details/164866/
> +LDFLAGS_append_class-nativesdk =3D " -lssp"
> +
>  export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python"
>  export PYTHONPATH=3D"${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-p=
ackages"
> =20
> --=20
> 2.17.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvYKtwAKCRA3VSO3ZXaA
HJr5AKCpfXmoHilD/oiNr7MqUl8x2exyqQCfVgj6IV8cA6JzzLogdZQuGquFOGw=
=Q3uQ
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

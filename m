Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyK0G-0000zA-Iv
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 11:53:36 +0200
Received: by weyr6 with SMTP id r6so1708591wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D4k7v1dVRvxSIP8h+jeIFcPbWRSiDKBFuTZv6NO+8k4=;
	b=dKM6XMXkJcsHvwz4/+aCxMOeo0a9OYC48kSe8yk1wRNZ6tNaNqOYhAumwh7fU0ygff
	sMvBO/LMSr1lPXi5FS49dI+negVMWTe20RN8WyOgI0eRjW9o+4OdqgAA3oz+prOjY+v2
	mq4RT5QDiFm5ZnOzL0L5jN4V0Ch3zR6FpM3ooz4OY9WnUJm0Cf17IPXdEuxH6m119r2B
	96tnNBmfiqSUaEyTZtPk0M7wtJyY9sF190TwmASlXO3ke/r6FFKQpwu3EoMKLn2kuYUa
	1hcMqz0XUlMQ+trRE9IIhwf7fxGqbzNJ8+jL/jkLGotWkRH6AXiNmjo02gGKV+iEAekH
	N4dA==
Received: by 10.180.107.103 with SMTP id hb7mr16917133wib.3.1344246112302;
	Mon, 06 Aug 2012 02:41:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm21698873wiz.11.2012.08.06.02.41.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 02:41:50 -0700 (PDT)
Date: Mon, 6 Aug 2012 11:41:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120806094146.GI3267@jama.jama.net>
References: <1343649833-23316-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1343649833-23316-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] Revert "chromium: use COMPATIBLE_HOST instead of COMPATIBLE_MACHINE"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 09:53:36 -0000
X-Groupsio-MsgNum: 40074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline

--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2012 at 02:03:53PM +0200, Martin Jansa wrote:
> * COMPATIBLE_HOST is not good enough for some configurations:
>   ERROR: chromium was skipped: incompatible with host arm-oe-linux-gnueab=
i (not in COMPATIBLE_HOST)
>=20

ping

> This reverts commit 7fb308d4f8d68d19a91daab8d33418cea8dea57b.
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium_19.0.1049.3.bb |    6 ++++--
>  recipes-browser/chromium/chromium_20.0.1086.0.bb |    4 +++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-b=
rowser/chromium/chromium_19.0.1049.3.bb
> index 97843a3..e657c48 100644
> --- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
> +++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
> @@ -10,8 +10,10 @@ SRC_URI =3D "http://commondatastorage.googleapis.com/c=
hromium-browser-official/${P
>  	file://softfloat-fix.patch \
>  "
> =20
> -# include.gypi exists only for armv6 and armv7a
> -COMPATIBLE_HOST =3D "(armv6|armv7).*-linux"
> +# include.gypi exists only for armv6 and armv7a and there isn't somethin=
g like COMPATIBLE_ARCH afaik
> +COMPATIBLE_MACHINE =3D "(-)"
> +COMPATIBLE_MACHINE_armv6 =3D "(.*)"
> +COMPATIBLE_MACHINE_armv7a =3D "(.*)"
> =20
>  PR =3D "r1"
> =20
> diff --git a/recipes-browser/chromium/chromium_20.0.1086.0.bb b/recipes-b=
rowser/chromium/chromium_20.0.1086.0.bb
> index d1ae7e5..527f317 100644
> --- a/recipes-browser/chromium/chromium_20.0.1086.0.bb
> +++ b/recipes-browser/chromium/chromium_20.0.1086.0.bb
> @@ -8,7 +8,9 @@ SRC_URI =3D "http://commondatastorage.googleapis.com/chro=
mium-browser-official/${P
>  "
> =20
>  # include.gypi exists only for armv6 and armv7a and there isn't somethin=
g like COMPATIBLE_ARCH afaik
> -COMPATIBLE_HOST =3D "(armv6|armv7).*-linux"
> +COMPATIBLE_MACHINE =3D "(-)"
> +COMPATIBLE_MACHINE_armv6 =3D "(.*)"
> +COMPATIBLE_MACHINE_armv7a =3D "(.*)"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAfkVoACgkQN1Ujt2V2gBznWQCfRhAh7hkpw4RGLOXvh4UL3gQ3
hWsAoJkXsexGa0qjTSIo6WQiVENJ8Joz
=nstq
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--

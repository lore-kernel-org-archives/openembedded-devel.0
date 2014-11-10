Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 030F265CED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 06:49:46 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hi2so9667916wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2014 22:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KOHMYT82u+UJx36Hfcjy8eqMmFIBupzn3T74NjS3mUk=;
	b=NQErHTlVB5wR2H1SzfvImJ9ueIRzOwKCkGSlyUmVOh5BmT4+tXqwfr/Pk3mbD3N+n0
	D/3QU7mYhS64jH7ZRlSHwGKZtUf+4W96wWDIcZvB+tHrBLuhHzb2OeyV1mFxEkYUiCL5
	V7SYasogmH6UEq/iFcWX0UL1Pbiv3pzOmCGvdwYT4g5yZi7ocXPyRGj7+QZERkw5q3Xr
	mtRzoKDtGCmZPyTu8IMtFRYe9AgGpmB0ddNnD8WT5RHEsOAm6HWzb2b15go4/P+DRXpP
	uhGgiBLkwh0uyaS0Ar0S1lmc3xsQWwfnKp6tCt9ebWecvLARlHN6favJhAouqYChYVqC
	917Q==
X-Received: by 10.195.12.76 with SMTP id eo12mr40175349wjd.22.1415602186700;
	Sun, 09 Nov 2014 22:49:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wa10sm17271925wjc.8.2014.11.09.22.49.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Nov 2014 22:49:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 10 Nov 2014 07:49:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141110064955.GC2440@jama>
References: <1415353921-20973-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415353921-20973-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] xgamma: Add new recipes
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
X-List-Received-Date: Mon, 10 Nov 2014 06:49:57 -0000
X-Groupsio-MsgNum: 52785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 05:52:01PM +0800, Qian Lei wrote:
> xgamma allows X users to query and alter the gamma correction of a
> monitor via the X video mode extension (XFree86-VidModeExtension).
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb b/meta-oe/=
recipes-graphics/xorg-app/xgamma_1.0.3.bb
> new file mode 100644
> index 0000000..48240c0
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb
> @@ -0,0 +1,17 @@
> +require xorg-app-common.inc

How was this recipe tested?

ERROR: ParseError at
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xorg-app/xgamma_1.0.3.bb:1:
Could not include required file xorg-app-common.inc

> +
> +SUMMARY =3D "X.Org X11 X client utilities"
> +
> +DESCRIPTION =3D "xgamma allows X users to query and alter the gamma \
> +correction of a monitor via the X video mode extension."
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dac9801b8423fd7a7699ccbd45cf13=
4d8"
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEPENDS +=3D "libxxf86vm"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI[md5sum] =3D "e8a88bf1a18f35b724619849dca97f4f"
> +SRC_URI[sha256sum] =3D "e5eb2588fbbdc5c2db5571b304204487a9c22eed15ac6cb8=
16f605ec403e6e1a"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRgYBMACgkQN1Ujt2V2gBzGSACgkZVoEF7cE2kBFd6M3EuUwD4j
8OwAoJvkf6+gvDRiXD3qg8k2qsIHxy4q
=rN0l
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--

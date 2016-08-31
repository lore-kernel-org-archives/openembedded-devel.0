Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B860260107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:47:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w207so4223068wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XrCmBUA2t1VTSSK9ldIaaVmSmomKeehHJXNtmQvE5dA=;
	b=e0Y/ESYuoNzmhSEFSwUafZSYbBGXfz101e/bu48TVl45rn7iLRUL8n8rk8KHZkWG+M
	sV4p38pZCaBrJ8imyVKfF+mdtPurRt3KxRFutBUdLcaHNWSbWhngtJcDTRI9WdjV30yy
	ojmxSOnFFKrBJ7yTqTdkAw3Vboa0xZPFuwd6QhoMguUSCfEDg2PXVlhgPIaaE9eXcYXe
	DAhVPfzvjVygXzUwHS661V/kV3XHJXzTM3Unmbr8ebGMmT5SbYiTR90WHdby7s3Q705N
	Aq2yMr16jCOjpJQo4WW8itZGo8cOGudu93xeBX0jD2zkExwQDDcD5t76TgErj+/1U6kh
	3t2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XrCmBUA2t1VTSSK9ldIaaVmSmomKeehHJXNtmQvE5dA=;
	b=KZzZonGHr5x+Ut3VCYEI1m0DHJapgBAFILkXE95B0RtsPdvcdgLnhC5hwnE3Hi8Njd
	Fjkf2KkAzXxe1RQ67+KPNo1Ls29B9xMNz8n80Anl617xgx3gaPGS3DlRupfHJG3WUUW0
	DKsqbURDCNaoDru8RyBDPayTV4n9lJkEAEbyD/HXzfZPMYK93UipcLrVgb0wLLBHQJgR
	kU4GN87kwYupbOOJexjRs4/xgGmfXcXA0G+PGcCXRYrJzx/l8G+PqOJ3dfec5XHoRWaQ
	qV/nSmnSIHwLisKsG94tMevuTfaLcMJ7gMcxqZVm8c5ErFS1UMEUWvwnbNYJPX25Ek1a
	znig==
X-Gm-Message-State: AE9vXwM6/5HRbk8Mxwzxqj+aiCE9we1n3rg6vBymUvEAQOV3u9q218L0Dptxz07VrrRQ9Q==
X-Received: by 10.194.240.39 with SMTP id vx7mr10175268wjc.38.1472662053456;
	Wed, 31 Aug 2016 09:47:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id r4sm722384wjs.13.2016.08.31.09.47.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 09:47:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 18:47:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831164732.6xeuege7e4rjc5hd@jama>
References: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
	<e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
	<CAMKF1spmR94=-VGMJD0LGTLASWeOyq-wt-KM4p0Ut-vowzYcDA@mail.gmail.com>
	<22beaaca-b392-3971-3125-1f579b79e186@windriver.com>
	<53c6d742-152e-53a9-87cc-7fda239b8cb9@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53c6d742-152e-53a9-87cc-7fda239b8cb9@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade 7.0.2 release to patch level 10 from github
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
X-List-Received-Date: Wed, 31 Aug 2016 16:47:34 -0000
X-Groupsio-MsgNum: 62907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2ukobnxcr362u3h7"
Content-Disposition: inline

--2ukobnxcr362u3h7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2016 at 10:13:28AM -0400, Randy MacLeod wrote:
>  From 6341ee0be48ee0fea13745e12e6b237947cc82b6 Mon Sep 17 00:00:00 2001
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
> Date: Mon, 29 Aug 2016 20:00:28 -0400
> Subject: [PATCH] imagemagick: use patchlevel 10 from github
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb=20
> b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> index 472e42d..185f492 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> @@ -8,11 +8,11 @@ DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib=
=20
> virtual/fftw freetype"
>   # Important note: tarballs for all patchsets within a version are=20
> deleted when
>   # a new pachset is created. To avoid multiple patches for each=20
> patchset, try to
>   # update to the last pachset of a version
> -PATCHSET =3D "7"
> -SRC_URI =3D=20
> "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSE=
T}.tar.xz=20
> \
> +PATCHSET =3D "10"
> +SRC_URI =3D=20
> "https://www.github.com/ImageMagick/ImageMagick/archive/${PV}-${PATCHSET}=
=2Etar.gz\
>   "

Please fix your sender to stop adding line feeds, so that I don't need to a=
pply
your patches manually.

> -SRC_URI[md5sum] =3D "bd66b19bd6fc3d320bd8d51869c874f9"
> -SRC_URI[sha256sum] =3D=20
> "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
> +SRC_URI[md5sum] =3D "bd8886ed5fa8553b09a4565e10bea162"
> +SRC_URI[sha256sum] =3D=20
> "0fef845d3516a2c41047aff8bf19bd812dd94cf74d1f4c9a423e8fc422981b0e"
>=20
>   S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>=20
> --=20
> 2.7.4
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2ukobnxcr362u3h7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHCiIACgkQN1Ujt2V2gBwh7wCeJvTSUQk3bGHmcH99jmMJjdgO
NScAni7lGg+9yilM8WYpe7G1euQJbnel
=sRbc
-----END PGP SIGNATURE-----

--2ukobnxcr362u3h7--

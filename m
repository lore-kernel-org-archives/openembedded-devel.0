Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id BF2D770515
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:27:19 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so939190wes.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RsxPJK32qqmSMQ3nuH/hSINA3WuQBeoj01ylTj4KcOk=;
	b=gzkt/qP9zop1UEYIQplYuLY5FqLM36mc99oZ+fBKP87wjHgxss1AIehSn/ZZXlx5T2
	+LjtgZqHJ0dEneB4yf0hnzapE9+Y3qMSAbx1sF5jXZdxgjhk1adst8V8xPv4nwNoIzYb
	/ibJSMEtOxEmXQNPgM87E07h8Pdoj8ckeuQLXz1zWhQhwdjafCaFn7Ji5UcN9WM1vkBa
	tbKKHYIbM9aXqJ1bMfGe4yeOhdDE3oYXiMvf2rDQeI/Gl3IpC9AMIFfD+ajPQbmoxwqy
	tIzmi+iXfL6EQMYWxZ7DtqMNzYXHFnJQEZBkblF5kuDSxRUGX5KK7/5p2X1S1vwknm7P
	HWhw==
X-Received: by 10.180.205.212 with SMTP id li20mr13566875wic.2.1405517237985; 
	Wed, 16 Jul 2014 06:27:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mv3sm56500283wic.21.2014.07.16.06.27.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 06:27:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 15:27:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716132725.GX2433@jama>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-2-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1405491841-24744-2-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@mindchasers.com
Subject: Re: [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
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
X-List-Received-Date: Wed, 16 Jul 2014 13:27:21 -0000
X-Groupsio-MsgNum: 51000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qwWC3uIwaXcGNtT+"
Content-Disposition: inline

--qwWC3uIwaXcGNtT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 02:23:59PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> In recent libhugetlbfs source, powerpc/powerpc64 is changed back to
> ppc/ppc64 (to match with the output of `uname -a`).
>=20
> Update the recipe to avoid build issue for now.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index e8e0787..e554b26 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -25,7 +25,10 @@ S =3D "${WORKDIR}/git"
>  COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> =20
>  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> -EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC}'=
 ${LIBARGS} V=3D1"
> +LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
> +LIBHUGETLBFS_ARCH_powerpc =3D "ppc"
> +LIBHUGETLBFS_ARCH_powerpc64 =3D "ppc64"
> +EXTRA_OEMAKE =3D "'ARCH=3D${LIBHUGETLBFS_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D=
${CC}' ${LIBARGS} V=3D2"
>  PARALLEL_MAKE =3D ""
>  CFLAGS +=3D "-fexpensive-optimizations -frename-registers -fomit-frame-p=
ointer -g0"

libhugetlbfs is currently failing with
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140714_13=
0534.log/3_min/failed/libhugetlbfs.log

and it also fails to build for qemux86-64 (log in last world status
e-mail).

Can we please fix it first?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qwWC3uIwaXcGNtT+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGfb0ACgkQN1Ujt2V2gBzZvwCeIxGALOd8QX8l+LduRn17xMIV
5AcAnRj1lNcyqmipELKzEeKoV/sZ9B6G
=K5gS
-----END PGP SIGNATURE-----

--qwWC3uIwaXcGNtT+--

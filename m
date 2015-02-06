Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1E76F72DE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:15:25 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so2309197wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 05:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/zNX4kdzPU6ipOfMEp5j9VblHEhsukMMwNJoyMFgLEU=;
	b=l2FOguKkDLc7Qe1vfq2c1/4v2KJKCSfDZdyw/GXMWmXFpf25tb9v25wXC5aw5IMnBP
	ni+VgKnUE/OTdzS+5kn6zKIBm0kSOdZKdVgBRR+JtTJiyMT5DXUiYVS+fBMnxBgvuOmH
	ptRBvttC+yaufbSmWD30VNJ2Co5n95ooDU1bBe6bJDcfdxEyG6W8nn03TU77UnHVorTU
	hx+i5W2OzVhNQP1YH6J1N4tBVvv0xFUdzYK/+92ZB9ksvOiW056iI8aU1qFPlnq3kdG3
	z1YG1aDW6XltQKLe11dIfASVJ7Gf+gUf3TZzuMzmHfppaPPD90ZYrXRQYR1JgG0ndpa8
	U15A==
X-Received: by 10.194.179.194 with SMTP id di2mr7548836wjc.4.1423228526189;
	Fri, 06 Feb 2015 05:15:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r3sm1450205wic.10.2015.02.06.05.15.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Feb 2015 05:15:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Feb 2015 14:15:43 +0100
To: ting.liu@freescale.com
Message-ID: <20150206131543.GB2287@jama>
References: <1422606045-7713-1-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1422606045-7713-1-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] python-pip: correct license to GPLv2+
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
X-List-Received-Date: Fri, 06 Feb 2015 13:15:30 -0000
X-Groupsio-MsgNum: 54131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2015 at 04:20:44PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>
>=20
> WARNING: python-pip: No generic license file exists for: GPL in any provi=
der

It looks like LGPL-2.0 as http://patchwork.openembedded.org/patch/88013/
does, so I'll drop this patch.

>=20
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>  meta-python/recipes-devtools/python/python-pip_1.3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb b/me=
ta-python/recipes-devtools/python/python-pip_1.3.1.bb
> index d1a7c8b..87493f5 100644
> --- a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "PIP is a tool for installing and managing Python packages"
> -LICENSE =3D "MIT & GPL"
> +LICENSE =3D "MIT & GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcd00425a3465a0e4c81929b94=
241d3de"
> =20
>  SRC_URI =3D "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar=
=2Egz"
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTUvn8ACgkQN1Ujt2V2gBzABACfWmgm6wwHDgCzgxUMtxp9G/Om
CrAAoJgtRtn20TNCwM/fl888TiRJWZad
=6y4t
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--

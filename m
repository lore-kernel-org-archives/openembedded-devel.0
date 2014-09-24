Return-Path: <joe@deserted.net>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3A48360167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:07:40 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id a13so6373321igq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ywDDA6p1GkKr0OdcnpyHf5wWwPhL1l3zA7zHQMF/R5g=;
	b=WitXxyy+S/aUTs5I2xcgb0DHTC7jvt307yyGZJvTylUuYfBF2G/+TH0k7MbfPiel5u
	o9uHbWWpeDWzn+W17HMw8y5fFIqmrUqFb2ezEdAByYMIa9KmhXozuushv8tFwVCSuRA9
	bI+Xlbbu8g+Q1/wpI247gEbU13Y82tJqg1rXx9RVu8Kwqy1dyimRWwEbbe/HO78QBfwt
	nTiCLUnKFanX3u0c55VOdD6b9hKB1d6zm/kSN9mnFV8bbKxFOZisKnCsjldqEmUrT7XH
	qglfLnTa8BXp4Qz0x1JDfSRQ/kXk2PXuB+ACvRIwocXTEy5LL7x3fmbRDth3ftB0uGxH
	RsoQ==
X-Gm-Message-State: ALoCoQnoF++J28WQMgE5qU3g5LvcFoU8vdevyg4NYsGoACtk/B7uiqM4jVao5qUNiEmjtg93okpj
X-Received: by 10.51.17.2 with SMTP id ga2mr27259693igd.12.1411524462329;
	Tue, 23 Sep 2014 19:07:42 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id v2sm3180127igs.11.2014.09.23.19.07.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 19:07:41 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 8012F1685E4; Tue, 23 Sep 2014 22:07:40 -0400 (EDT)
Date: Tue, 23 Sep 2014 22:07:40 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924020739.GE16953@deserted.net>
References: <1411105660-19048-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1411105660-19048-1-git-send-email-b40869@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-networking][PATCH v4] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Wed, 24 Sep 2014 02:07:44 -0000
X-Groupsio-MsgNum: 52206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline

--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v4] pimd: add recipe for pimd-2.1.8] On 14.09=
=2E19 (Fri 13:47) YangHaibo wrote:

> Signed-off-by: YangHaibo <b40869@freescale.com>
> ---
>  meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb
>=20
> diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-ne=
tworking/recipes-support/pimd/pimd_2.1.8.bb
> new file mode 100644
> index 0000000..e73d4f5
> --- /dev/null
> +++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> @@ -0,0 +1,10 @@
> +SUMMARY =3D "pimd is a lightweight stand-alone PIM-SM v2 multicast routi=
ng daemon."
> +HOMEPAGE =3D "http://troglobit.com/pimd.html"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94f108f91fab720d62425770b70dd=
790"
> +
> +SRC_URI =3D "ftp://troglobit.com/pimd/${BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "a12448bc7c9bfcebf51a13ebf1ffa962"
> +SRC_URI[sha256sum] =3D "3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834=
490b8fb080126009"

I merged this, but the sha256sum was wrong when I did my build.  I don't
know what happened here, I pushed the change with an amended sha256sum
that matches what got downloaded on my machine.  The md5sum was fine,
FWIW.

-J.

> +
> +CFLAGS +=3D "-I ${S}/include "
> --=20
> 1.9.2
>=20
--=20
-Joe MacDonald.
:wq

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlQiJ2sACgkQwFvcllog0XzKDACghHhTBtNaUhC/e5JlDTWOy1e6
cMsAn3ewlfuIwB+zR3GcHargabT7el2I
=CeSD
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--

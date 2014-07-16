Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 87F987050E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 07:13:51 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5573494wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P7axJmbS+x/sTSOlmC0BCqPljlvoLLyFBwsqlkPgsPM=;
	b=uAU5nb/slgHG09nmfS52D5UGNXTGLwbZu/7xnBZ9BExEf9nSqztyt6qYW6QRyXNhIU
	BHhBzNULrNc0zYA+xoq/2aRT0GtIEKF97GaqwzmU35KoDrbFfSw/hgyziJszeai9GyAv
	zTsoKYldedtu+RBQ+eOiz5bZ0PLZ+2oP8DBpICV/XSmbVLC1ay8ugLln5W86YvashPr3
	LgZQbwvHQhG6bvA0rVqoZJeDY3jQW7x86XRrL+0gWpE52j/i+yB/DiafNZdsXbyc1tND
	maGv0eHXEy1g2tun+yCKnsPwVtqGz4JK54WR9SwfHsdU2B41yZLibQ2G9nsEZnJeOBC1
	2JFw==
X-Received: by 10.180.211.237 with SMTP id nf13mr11310134wic.47.1405494832003; 
	Wed, 16 Jul 2014 00:13:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w5sm53080950wif.3.2014.07.16.00.13.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 00:13:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 09:14:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716071400.GR2433@jama>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-4-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1405491841-24744-4-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@mindchasers.com
Subject: Re: [meta-oe][PATCH 3/3] luajit: replace MACHINEOVERRIDES fslmachine with qoriq-ppc
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
X-List-Received-Date: Wed, 16 Jul 2014 07:13:59 -0000
X-Groupsio-MsgNum: 50990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/KohU7xR/z4Rz7fl"
Content-Disposition: inline

--/KohU7xR/z4Rz7fl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 02:24:01PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> fslmachine is too generic, use qoriq-ppc instead.
> The change had been applided in meta-fsl-ppc layer.

Should it be moved there completely as .bbappend?

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_2.0.3.bb
> index de3a40b..75885d6 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.=
gz \
>  SRC_URI[md5sum] =3D "f14e9104be513913810cd59c8c658dc0"
>  SRC_URI[sha256sum] =3D "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203=
194c585d27bebd79"
> =20
> -SRC_URI_append_fslmachine =3D " file://ppc-fixplt.patch "
> +SRC_URI_append_qoriq-ppc =3D " file://ppc-fixplt.patch "
> =20
>  S =3D "${WORKDIR}/LuaJIT-${PV}"
> =20
> --=20
> 1.7.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/KohU7xR/z4Rz7fl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGJjgACgkQN1Ujt2V2gBwj6gCeKwCp7CiZDeUsPCUQYbo7gDpQ
8AwAn3duI++tawIc5hBw1QuH6ceKOgyl
=qYHs
-----END PGP SIGNATURE-----

--/KohU7xR/z4Rz7fl--

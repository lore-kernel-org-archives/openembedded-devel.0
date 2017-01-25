Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 534A871A60
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:29:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so43155750wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 07:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QetJP/kAbCJY1gSGUrFYz9/9uElawGZuFM1DOTZyA+M=;
	b=GPvMDOn0bmfNyeJT1MmLgq6HXKvDznOVaVufI2cyfWuSnF1Y4C/Vl5184TJf0U+z1M
	D4OwCIQVaLOzUidY+kouGMAxMBoSL6o3JXyNCsNSs669aE5Sg5iF5WCdUO13PHMQgM8Z
	JquULAFJXkodV0sxmrhL5W/Mkl/qxBMBsAs2CUGd2XKL3haG8IYg3W+AYE2qza9gO9z4
	9M/y+nmRz9k1z94OftI7ACYpBApYWfErNu5Zw9pUrwKe/tSJ5UQcB0SQYa+dX/fh0fx0
	4THOwWJh5Z6jn9DELDKIFIAgiUd6ZOfwZ1YgSRoIQtRsBvJWQGD1VM06bNiQnaj7MGnQ
	Lp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QetJP/kAbCJY1gSGUrFYz9/9uElawGZuFM1DOTZyA+M=;
	b=rBU8LJIs/LOXUyQoa68tdJtfnPl0ds3VVnHBE0n3OENOiZGLSgGyVyQhl0TOmBEmra
	pngbTCk50ldq+Xj8TWcCloY130cgpJylTa9pNpS9aDPgmKuzpkdN1ZoX8kesHOqX8Y9t
	foMLaxZV5yghWU8lE31qN9t8277VWPqavTsCvjsW0Mj0KUYCS19w9XAXSFVxse1xrutA
	654pLAt86qpRyV0PXNcwyNaYJij4s3+IjdbPufu+ZHlGUalE4b6ih6vhxWKXOFLBC0vD
	z43G3HWyGbqgieqzXczuhSrozdge6+5K2pZ46l+ZnXKiMYVRQAc4bbRIBRlIyGy+ei3D
	9nQw==
X-Gm-Message-State: AIkVDXLA3q8KKhhCncLyPlIJodLxgqL42dxl4UPs290LXwFgT3pw3JBR7AuUHr3lx7czsA==
X-Received: by 10.28.24.5 with SMTP id 5mr22393516wmy.1.1485358192896;
	Wed, 25 Jan 2017 07:29:52 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z67sm25545533wrb.49.2017.01.25.07.29.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 07:29:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 16:29:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170125152954.GE3260@jama>
References: <1484955682-24495-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1484955682-24495-1-git-send-email-tom.hochstein@nxp.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Wed, 25 Jan 2017 15:29:53 -0000
X-Groupsio-MsgNum: 64852
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline

--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 05:41:22PM -0600, Tom Hochstein wrote:
> Fix build error:
>=20
> fatal error: assimp/Importer.hpp: No such file or directory

unfortunately this would be the first dependency on meta-oe from
meta-qt5 and layer.conf currently lists core as the only dependency.

Is it possible to make this dependency optional with PACKAGECONFIG?
Otherwise you would need to add meta-oe to layer.conf and README
dependencies.

>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  recipes-qt/qt5/qt3d_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index 9708ec9..d8f943f 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> -DEPENDS_class-target +=3D "qtdeclarative qt3d-native"
> +DEPENDS_class-target +=3D "qtdeclarative qt3d-native assimp"
> =20
>  SRC_URI +=3D " \
>      file://0001-Allow-a-tools-only-build.patch \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIjEcgAKCRA3VSO3ZXaA
HJRSAJ9AfzJlR7sP4lJdEyQFX0XC2m8MfQCcC/oI39P22mFDkHSjaihRpAWuLGk=
=qJpP
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69BAA65D68
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 08:55:35 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2850793eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wrXm5qKblQ0/MjHAZzHARIh04XOQMQ+vQUSGzVQELe4=;
	b=L0n2hsMUAvct5/bh2bcOqZOalFiuwYV3Wb10DT3nGTDBw+nET1rKua69IZMCBWpIwv
	PoOCnxiNMa4jZ+6tlIJcukUJEMjbbP4FJCKZL5IvCt8zvKyFot2g514Oxpb43QdBOIya
	4tYvvN0VcpuAcbgbOsLUv5UQ3ssMsqlJcBLjviGKFq4jWJTVr3UQtlWR3iXR5htA2NTZ
	a3Mbjd7nH+as72xMksVjnGGgrbZhTxqeI4HJjakeaHXhn7XDDSCto6w7SR/ZhGMevFWR
	dSbOb16f0pBmnLqkaCuMGgxsvPPDTi4B/4P9vvrt4YOYd2nhA5h7HpdJeH8z5kJuPI6B
	6Pyg==
X-Received: by 10.14.206.137 with SMTP id l9mr37414920eeo.40.1397984136441;
	Sun, 20 Apr 2014 01:55:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm92789026eev.32.2014.04.20.01.55.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 01:55:35 -0700 (PDT)
Date: Sun, 20 Apr 2014 10:55:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420085540.GO2486@jama>
References: <1396291648-10453-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1396291648-10453-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] libinih: Update to 25078f7
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
X-List-Received-Date: Sun, 20 Apr 2014 08:55:36 -0000
X-Groupsio-MsgNum: 49296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8WA4ILJSyYAmUzbY"
Content-Disposition: inline

--8WA4ILJSyYAmUzbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 03:47:28PM -0300, Otavio Salvador wrote:
> This updates the fork to a version based in SVN r29 and include a
> CMake fix for out of tree build support.

merged, thanks!

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/inih/libinih_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipe=
s-support/inih/libinih_git.bb
> index 2a13d0a..5030c78 100644
> --- a/meta-oe/recipes-support/inih/libinih_git.bb
> +++ b/meta-oe/recipes-support/inih/libinih_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddae28cbf282074=
25e0d0b3eb835f4bde"
>  PR =3D "r3"
> =20
>  # The github repository provides a cmake and pkg-config integration
> -SRCREV =3D "7a43a3655ceffa9f0f7fd68262d8d478c6d0d0af"
> +SRCREV =3D "25078f7156eb8647b3b35dd25f9ae6f8c4ee0589"
>  SRC_URI =3D "git://github.com/OSSystems/inih.git"
> =20
>  S =3D "${WORKDIR}/git"
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

--8WA4ILJSyYAmUzbY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTi4wACgkQN1Ujt2V2gBxdnACgppW0DY5hLYc/a6ZoPJb0CLwn
8SEAoJBi9h11w/zQ722bBBEeze+JAHX6
=4TGP
-----END PGP SIGNATURE-----

--8WA4ILJSyYAmUzbY--

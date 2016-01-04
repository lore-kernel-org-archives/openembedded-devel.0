Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 380D56FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 17:52:01 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f206so149383992wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 09:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hgC5uqFIOileshZt4dl3tB+0t2W+VVMYs1Kt8wHRrgw=;
	b=01Vkm3PuFvosodfMdfuYLZ4Bm0IdMHDjHfaaxXPDI9M1yypcirkVuONkXeSEjA8y46
	vPtVwuPiEhhlXHkOffqgaPIAEkvJBTuOJoliXix5tmhgTZ6K6qtOhRIIGeIuij9P4VY+
	ufYwm4eQRak46NN4hKPCgRzzDd4h7d6CvikC//rHHxYPTSaBwu3pipe+dXkx1z6qQipx
	udX7e5UvtWhc563p2q0KVGa7Z5mO9lqKY/9E2RE5zlcFLYz/LfM//cZNtMUcEvYLm44p
	QlByH4nAYkpYM/ryWxXVGZYKhrn980VflSUqh8qiPTAZ0t1VgboVHcik80LpXIDAlgCP
	jUZg==
X-Received: by 10.28.54.65 with SMTP id d62mr62899073wma.35.1451929922155;
	Mon, 04 Jan 2016 09:52:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q4sm87388396wja.6.2016.01.04.09.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 09:52:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 18:52:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104175200.GA5744@jama>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Mon, 04 Jan 2016 17:52:02 -0000
X-Groupsio-MsgNum: 59319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
> When the host distro uses gold mariadb-native fails to build.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-=
support/mysql/mariadb.inc
> index a6826c3..6a55476 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] =3D ", ,,${PN}-setupdb"
>  # https://mariadb.atlassian.net/browse/MDEV-5982
>  TARGET_CFLAGS +=3D "-fuse-ld=3Dbfd"
> =20
> +BUILD_CFLAGS +=3D "-fuse-ld=3Dbfd"
> +BUILD_CXXFLAGS +=3D "-fuse-ld=3Dbfd"

Unfortunately this breaks builds on older hosts with older gcc

|   cc1: error: unrecognized command line option '-fuse-ld=3Dbfd'
http://errors.yoctoproject.org/Errors/Details/25859/

Should we consider Ubuntu-12.04 insanely old?

> +
>  EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>                   -DWITH_JEMALLOC=3Dno \
>                   -DWITHOUT_TOKUDB=3DTRUE \
> --=20
> 2.0.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKsT8ACgkQN1Ujt2V2gBya7ACgpD0/Dlzbf/r2AXw18G4Msl1W
2D4AoIqMjH8wo/+EnkhBNt7OobNa4I3/
=gsUs
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

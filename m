Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 60F1D703E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 13:54:30 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so6432657wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KjY9Qv44rYgXiOZQK8bsZxwwVRhSr978wQdH44bDfNY=;
	b=YMJ5ocs1V+EJseF/ovuzstrMx/EuEsZO+fV7F9oW+XSVEI7rlXveI1EXKTzhpdIiS3
	mpZj8mH4sL+UViflNokuhPeBipZRyWA+x8TVsLhFsT+Qrb996I3N0uVWhrZ/tM8ab5+/
	wEcdBlwoT2gekxmQDZATTJ73/LlEkQeDaoehX96f0nxBK9WBj6y0JZh3YlHGYmq5dDAH
	OICbYeYSazlKROH6dP6pJVxr6Kgw9TeJ0lx9oY4hrd4e62zQdaLU2DgTvKNmL0fMtbWj
	eoG7A+wzTqXoOqinpNfIrVNoQNnfKBtfE6aIQvI+Z+H2HWbtV3Iv1ZD6e6L0zFaf60tS
	P6CQ==
X-Received: by 10.194.83.39 with SMTP id n7mr13707996wjy.58.1405864471813;
	Sun, 20 Jul 2014 06:54:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	sa4sm29854403wjb.45.2014.07.20.06.54.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 06:54:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 15:54:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140720135445.GY2433@jama>
References: <1405864382-16942-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405864382-16942-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][WIP][PATCH] ser2net: change file used in LIC_FILES_CHKSUM
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
X-List-Received-Date: Sun, 20 Jul 2014 13:54:32 -0000
X-Groupsio-MsgNum: 51114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BzSjWsyRXn5FzoOl"
Content-Disposition: inline

--BzSjWsyRXn5FzoOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 03:53:02PM +0200, Martin Jansa wrote:
> * INSTALL file is automatically created by automake (now when it doesn't =
have
>   implicit foreign) and it changed the md5 to d0697e131465c2bdd0af3b07a84=
d2878
>   causing do_configure task to fail with:
>=20
>   ERROR: ser2net: md5 data is not matching for file://INSTALL;md5=3D0659e=
b117294c490ae3853facd7a6ddd
>   ERROR: ser2net: The new md5 checksum is d0697e131465c2bdd0af3b07a84d2878
>=20
>   Use COPYING file which should be more stable.
>=20
> * adding foreing automake flag is maybe more correct solution, I wonder
>   how many projects were changed like this, but silently (this failed
>   only thanks to INSTALL file being used in LIC_FILES_CHKSUM)

Ross: ^ this is the kind of changes which I was concerned about on
Friday, in this case it caused do_configure to fail, but who knows in
how many cases it will silently change INSTALL/.. files

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta=
-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
> index 9877190..8fe6a6f 100644
> --- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
> +++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
> @@ -3,7 +3,7 @@ SECTION =3D "console/network"
>  HOMEPAGE =3D "http://sourceforge.net/projects/ser2net/"
> =20
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://INSTALL;md5=3D0659eb117294c490ae3853facd7a6=
ddd"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbae3019b4c6dc4138c217864bd043=
31f"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}=
=2Etar.gz"
> =20
> --=20
> 2.0.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BzSjWsyRXn5FzoOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPLyiUACgkQN1Ujt2V2gBzaXwCgoUGeo7Yzzv7uMQjXL/T1zTxP
vBIAoJ4/iKhE8cNIEKvxV5RKgJSOEVpg
=hYGZ
-----END PGP SIGNATURE-----

--BzSjWsyRXn5FzoOl--

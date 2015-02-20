Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD8C0716CE;
	Fri, 20 Feb 2015 12:39:58 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2667100wib.4;
	Fri, 20 Feb 2015 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uDASGHpSuLadB+HAZ12W+gYXIJw0GE/WZEqGh3etgUQ=;
	b=RN1yGm5PkJkTy1v0LNkTdqkxY6xwj9ZQQWU7aQ8e8ZkCyWemYYg94Sf8rG4ENPFmgE
	GFPUPbrUgkMYMCYjYTx59OPEPDRM8xYV7eX5KmZTTNrrvxodhkyTDE6iyXdNpIFm03I9
	6oihzxZsn39uGAA2td0R+kj8ZtsOOMdNAUEqRBtzG7ohmKheh+grt6s2lBiAKuFtowjo
	Slq/qMggHRoalZoqIO/pArfvxTmWBDO8s+eg65oWZEB8YHJIh/+EZWoc0sohiwYTHUga
	VVZD6EYq26xLagOhY8chaTKomkMU832/rTiYEOmHUy6QLg6g6Ya0fL3OYbxIPprt5XWT
	HOEg==
X-Received: by 10.194.48.12 with SMTP id h12mr19187389wjn.74.1424435999502;
	Fri, 20 Feb 2015 04:39:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l6sm41907265wjx.33.2015.02.20.04.39.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 04:39:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Feb 2015 13:40:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150220124003.GA2322@jama>
References: <20150107233627.8FC5B50418@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150107233627.8FC5B50418@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Saul Wold : json-c: Upgrade to 0.12
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
X-List-Received-Date: Fri, 20 Feb 2015 12:40:04 -0000
X-Groupsio-MsgNum: 54427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 11:36:27PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f229327783021c20f93a38d35c8f9d31e432503e
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df229327783021c20f93a38d35c8f9d31e432503e
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Tue Dec 23 15:52:11 2014 -0800
>=20
> json-c: Upgrade to 0.12
>=20
> Added CFLAGS to prevent compiler error of unused size variable

This also breaks upgrade path, because the package was renamed when
there isn't 2nd library in it.

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-devtools/json-c/{json-c_0.11.bb =3D> json-c_0.12.bb} | 6 ++=
++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-d=
evtools/json-c/json-c_0.12.bb
> similarity index 75%
> rename from meta/recipes-devtools/json-c/json-c_0.11.bb
> rename to meta/recipes-devtools/json-c/json-c_0.12.bb
> index 389e0f9..79cf6dc 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.11.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc351=
23ba193fea8ee216f2"
> =20
>  SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar=
=2Egz"
> =20
> -SRC_URI[md5sum] =3D "aa02367d2f7a830bf1e3376f77881e98"
> -SRC_URI[sha256sum] =3D "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983e=
dbfac9149494448c"
> +SRC_URI[md5sum] =3D "3ca4bbb881dfc4017e8021b5e0a8c491"
> +SRC_URI[sha256sum] =3D "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06=
074d3c17078b9f3f"
> =20
>  RPROVIDES_${PN} =3D "libjson"
> =20
> @@ -19,3 +19,5 @@ do_configure_prepend() {
>      # Clean up autoconf cruft that should not be in the tarball
>      rm -f ${S}/config.status
>  }
> +
> +CFLAGS +=3D "-Wno-error=3Dunused-but-set-variable"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTnKyMACgkQN1Ujt2V2gBxL3wCfW1kex6QFGaiqvVBxVNQq4dId
Z7oAn1cc6c6P0Nz5y9p0FvFPMHGj4mZC
=DQ1X
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

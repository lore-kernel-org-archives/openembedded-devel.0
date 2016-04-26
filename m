Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBF7460745
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:26:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so4879281wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NNjlkUCiiYvGgLTGNvTsNdk5ByA/OeJ1pxKSrzg1188=;
	b=ukuRh882yk64YsS9NipTFW2wwBzYyus3zzFBYRygq8a7fSyrs0x5K8MxXBgur0JUGL
	wpryRq0NNF1AFKIdzqNB4j0+LxblFHEK3puTUWVgOaDQItDg1yIWW1YQsODx3FS6IRrd
	2DXXxbrNyBPqBh8EKy6L4UwUDT7yGP+eqmErApSyEt2JZcb6Rl36JSoA/7WTEr7xHPHu
	hpytKcRA/CT/3oIwyoxnDBlMNTxV7tpNEtNy4isjJuxK996JgPEqn+aIb7WkZ5LICcwL
	jH/SVb+qcU/yN58IlFyRIuULZVV5MvChI82GmHC3FovhQe7fx0zGZM14WyavYyb6pqEE
	Al4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NNjlkUCiiYvGgLTGNvTsNdk5ByA/OeJ1pxKSrzg1188=;
	b=RZoqrfD7sfwv8o7WZOB7w7aYgg1gG7dRd5NVBUK2D+8fzv1RbGREv30fPs9U/K5wIE
	YtuzztsKywcBMrLlan+uEsWhQ/RBhWGh1dYCrdC1PGZ7+dpFSFJnLwW5QvxkWcTGU3fa
	l/5hE1s5NazjLeIak8d/jQE4tTN0gmmzT6ODFQzxgGmR6VwU7sqh5yWRwCqZ9gMyuVBz
	2L62hIWiFIu/K1Yupv1PW0RLE8gN5QFrBrzUwDgJCJpckDyJ+PK5YFprtWA1EzcXaErA
	yRCMqaP4vTTKSDPTSd7aMTtO7odcqZUH/YVawbwsEL1A5HIUG4qEOu09NX3QqXkuTXla
	BP6Q==
X-Gm-Message-State: AOPr4FU0gvXVt73t2h/ZBYP2eqHskyuha4KYb/w38pVrSnHzYLpKekkF3sDIL96O499OTw==
X-Received: by 10.28.103.2 with SMTP id b2mr19249350wmc.66.1461680786984;
	Tue, 26 Apr 2016 07:26:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ki9sm29276964wjb.37.2016.04.26.07.26.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 07:26:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Apr 2016 16:26:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160426142643.GC2559@jama>
References: <1461600749-19432-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1461600749-19432-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-networking][PATCH] samba: fix QA warnings.
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
X-List-Received-Date: Tue, 26 Apr 2016 14:26:27 -0000
X-Groupsio-MsgNum: 61178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline

--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 09:12:29AM -0700, Armin Kuster wrote:
> WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on libaio=
, but it isn't a build dependency, missing libaio in DEPENDS or PACKAGECONF=
IG? [build-deps]
> WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on lttng-=
ust, but it isn't a build dependency, missing lttng-ust in DEPENDS or PACKA=
GECONFIG? [build-deps]
>=20

We used to have PACKAGECONFIG for aio, maybe it's worth trying to fix it
instead of adding libaio directly to DEPENDS?

Also there is still:
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?

and also new:
WARN: samba: samba rdepends on libarchive, but it isn't a build dependency?


> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> index 9358ca5..8ba2aeb 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> @@ -27,7 +27,7 @@ inherit systemd waf-samba cpan-base perlnative
>  # remove default added RDEPENDS on perl
>  RDEPENDS_${PN}_remove =3D "perl"
> =20
> -DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libte=
vent libldb krb5 ctdb libbsd"
> +DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libte=
vent libldb krb5 ctdb libbsd libaio"
> =20
>  SYSVINITTYPE_linuxstdbase =3D "lsb"
>  SYSVINITTYPE =3D "sysv"
> @@ -54,6 +54,7 @@ PACKAGECONFIG[systemd] =3D "--with-systemd,--without-sy=
stemd,systemd"
>  PACKAGECONFIG[dmapi] =3D "--with-dmapi,--without-dmapi,dmapi"
>  PACKAGECONFIG[zeroconf] =3D "--enable-avahi,--disable-avahi,avahi"
>  PACKAGECONFIG[valgrind] =3D ",--without-valgrind,valgrind,"
> +PACKAGECONFIG[lttng] =3D "--with-lttng, --without-lttng,lttng-ust"
> =20
>  SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_t=
db2"
>  SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', '=
ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcfee4ACgkQN1Ujt2V2gBwTgwCfd72u0USCF8oNlSO3DCTHy05L
HbAAn325veL7gT5U5j+i/CYtn3TxQgza
=/uzf
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

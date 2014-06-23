Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id D1A0F65F09
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 17:40:29 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so7480844wes.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o/8sWAYUrg9G8tzzovrmwshC5DZ81BXmaYKTh9f0794=;
	b=RoiU1mwOJr2ukFFCnSXHvoJqf9c2TA124fRA9NnI05iy1A1ahU4cE53F5y/HCbxQOJ
	0NZ+e8eGtgYwQlxKx8KGV0EY0wXq3Lm2fjNt7AddgLgb1y2b/FXsYGTcKqYoQfYSh9pv
	LZJwAQ4ybaXFiThjgb9roXUS8ZLOdJmn9If3eGTXRHKt1HmbFn9mYwsSuLkbPMDUkdYg
	vAOkqxxHYAgvXncdB1tdWHK18eXrLh+G6RWWqNBMrtbou5F9Q+VzU85SXuGqoNUni4a2
	ChJ4FLyNMPmMN5/NBrVAvVryTHr6wChks5U8Ds6K6OBbURXrFBEAmpsioIiM1yDWTmN6
	u1cw==
X-Received: by 10.194.200.67 with SMTP id jq3mr5911437wjc.114.1403545229302;
	Mon, 23 Jun 2014 10:40:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k7sm37691322wjw.6.2014.06.23.10.40.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 10:40:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 19:40:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623174029.GJ2437@jama>
References: <cover.1402664272.git.anders@chargestorm.se>
	<362107ac6702cb380c86a7ac249b52f558d2b923.1402664272.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <362107ac6702cb380c86a7ac249b52f558d2b923.1402664272.git.anders@chargestorm.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-webserver][PATCH 2/2] webmin: split out webmin themes
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
X-List-Received-Date: Mon, 23 Jun 2014 17:40:33 -0000
X-Groupsio-MsgNum: 50532
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Content-Disposition: inline

--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 03:01:21PM +0200, Anders Darander wrote:
> The default set of themes taks up ~13MB, with a couple of them weighting =
in
> at ~5MB each.
>=20
> Let's split the themes to separate packages, to allow a considerable size
> reduction of the core webmin package (from +15MB to 2.1MB on my build hos=
t).

It isn't caused by your patch, but current webmin recipe
is inheritting allarch and then adding runtime dependency
on TUNE_PKGARCH perl, so it's causing webmin rebuilds every
time MACHINE is changed (to MACHINE with different TUNE_PKGARCH)

ERROR: webmin different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemuarm                                               =
       =20
Hash for dependent task webmin_1.620.bb.do_package changed from 1a4ee0753ef=
f9a8e392e851b6bbe252d to 36578d90d5866248da6afaa50fd586a1                  =
       =20
Hash for dependent task perl_5.14.3.bb.do_packagedata changed from c7f95281=
2f189c608e14e0862807ae27 to 24b9ff1de4f046333d292aa97673a8d2               =
       =20
Hash for dependent task webmin_1.620.bb.do_packagedata changed from bd1b17c=
957d4091a0f6d3ff6a9acb0fe to b584e5a6a90eeb320046c457b03a607f              =
       =20

Please fix it if you care about webmin.

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/met=
a-webserver/recipes-webadmin/webmin/webmin_1.620.bb
> index a561de2..7eb1d63 100644
> --- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
> +++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
> @@ -113,7 +113,7 @@ RDEPENDS_${PN} +=3D "perl-module-warnings perl-module=
-xsloader perl-module-posix p
>  RDEPENDS_${PN} +=3D "perl-module-fcntl perl-module-tie-hash perl-module-=
vars perl-module-time-local perl-module-config perl-module-constant"
>  RDEPENDS_${PN} +=3D "perl-module-file-glob perl-module-file-copy perl-mo=
dule-sdbm perl-module-sdbm-file perl-module-timelocal perl-module-feature"
> =20
> -PACKAGES_DYNAMIC +=3D "webmin-module-*"
> +PACKAGES_DYNAMIC +=3D "webmin-module-* webmin-theme-*"
>  RRECOMMENDS_${PN} +=3D "webmin-module-system-status"
> =20
>  RDEPENDS_webmin-module-proc =3D "procps"
> @@ -128,12 +128,17 @@ python populate_packages_prepend() {
>      wadir =3D bb.data.expand('${libexecdir}/webmin', d)
>      wadir_image =3D bb.data.expand('${D}', d) + wadir
>      modules =3D []
> +    themes =3D []
>      for mod in os.listdir(wadir_image):
>          modinfo =3D os.path.join(wadir_image, mod, "module.info")
> +        themeinfo =3D os.path.join(wadir_image, mod, "theme.info")
>          if os.path.exists(modinfo):
>              modules.append(mod)
> +        elif os.path.exists(themeinfo):
> +            themes.append(mod)
> =20
>      do_split_packages(d, wadir, '^(%s)$' % "|".join(modules), 'webmin-mo=
dule-%s', 'Webmin module for %s', allow_dirs=3DTrue, prepend=3DTrue)
> +    do_split_packages(d, wadir, '^(%s)$' % "|".join(themes), 'webmin-the=
me-%s', 'Webmin theme for %s', allow_dirs=3DTrue, prepend=3DTrue)
>  }
> =20
>  # Time-savers
> --=20
> 2.0.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoZo0ACgkQN1Ujt2V2gByhPACePFlUlKi04ZA3Jq1BGruQhQIQ
UOsAmwYNZDcjVZINJ8LbM/3t49gWxLce
=4KcJ
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--

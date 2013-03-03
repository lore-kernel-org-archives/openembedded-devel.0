Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBxcX-0001c5-IN
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Mar 2013 02:21:52 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so3235586eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2013 17:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FCTj7QSNOC6NtiHk5UptkXr8e6Bi1HOGfGQRs1Fdb5M=;
	b=SIUTvWVi6h7oveJ+XlPWNkta1LrO0keaET69EI1ovDbdgFFQR9Vx799Kt6vrN/9eyE
	G8IQJ9EJJxLPqXctdKYy4eVDN/otYWNcACVCyqgz0LjNY3VDOV5t/GYOEqqYY5A6rMfT
	fhyr816RyiBv4pkDLPqST0U9bbcZt1ARybJqKlt2CQZ6bm679sZbvHoMA/deacwiIeNa
	/pD7e9QAu4JrXXL6FYexzfphKVshuABF9c628eW6xbUTFITzOKmVCZ/sw94G60jWn8w7
	+wXjglhaDXl5UdzSts/PgKeqVbJ0McG/8iOK4KvMEakJhvmDCN78N4LjV1Pmbg8lhHxK
	qmmw==
X-Received: by 10.14.214.66 with SMTP id b42mr43160812eep.34.1362272720224;
	Sat, 02 Mar 2013 17:05:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 3sm24682899eej.6.2013.03.02.17.05.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 17:05:19 -0800 (PST)
Date: Sun, 3 Mar 2013 02:05:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130303010515.GB3285@jama>
References: <1362169049-1689-1-git-send-email-randy.macleod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362169049-1689-1-git-send-email-randy.macleod@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Mar 2013 01:21:55 -0000
X-Groupsio-MsgNum: 43372
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 03:17:29PM -0500, randy.macleod@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The hardcoded paths in libtool will cause apache2 compile fail at
> link stage when the package apr is installed from sstate cache, so
> add libtool to SSTATE_SCAN_FILES.

This belongs to oe-core ML.

> [ CQID: WIND00405372 ]

Remove this before sending it there.

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-support/apr/apr_1.4.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support=
/apr/apr_1.4.6.bb
> index b7220e0..77dffee 100644
> --- a/meta/recipes-support/apr/apr_1.4.6.bb
> +++ b/meta/recipes-support/apr/apr_1.4.6.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0c35ff3c4c83b8=
9d2f076e315caac28b \
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>             file://configure_fixes.patch \
> @@ -43,7 +43,7 @@ do_install_append() {
>  	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
>  }
> =20
> -SSTATE_SCAN_FILES +=3D "apr_rules.mk"
> +SSTATE_SCAN_FILES +=3D "apr_rules.mk libtool"
> =20
>  SYSROOT_PREPROCESS_FUNCS +=3D "apr_sysroot_preprocess"
> =20
> --=20
> 1.8.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEyocsACgkQN1Ujt2V2gBy8NgCeOhGHqXXY5z0gY+VyUOlMxg/F
46oAn0d/RLA5TBW6HNoosU1gdisGYtC6
=W/tr
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--

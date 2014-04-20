Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id E514065D49
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 08:55:06 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2830472eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GuXtAQHdb0uhQZgIBlVQI2T98QwkMRbzigxo3pftneY=;
	b=zXBVEMTjAb4d/1fM+4NGedoP0ifScLHshtXpMkse27nAeFa0uDHFy1GNU/lwbN7oMV
	9rqiZ9yW7LUQETemouL3abh+siPfaLfJnYlwIggJN6WC0RhtqozpdmaSqpuAXN6eBR8B
	sk3dvnE7AJvPGUKwVucSj1U+H+bCvcL1OENjjHLHEizb9EyJrV14nqLD6QYmk2eHPc4g
	KyOENjMRtD+3b85vZYY8A+/pEgq6hkKzAxe+9iO6kPaS4qjx1rZNvfoaE8s7vR2ginS3
	y6hQ1xSfudKy17cJstAZ/vwpAE31fOYnbDOP0pba9kZD3WKE2rlDp3UoOXP3EyYJczQK
	Fi6Q==
X-Received: by 10.15.48.129 with SMTP id h1mr37403335eew.57.1397984107114;
	Sun, 20 Apr 2014 01:55:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h47sm92780325eey.13.2014.04.20.01.55.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 01:55:06 -0700 (PDT)
Date: Sun, 20 Apr 2014 10:55:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420085511.GN2486@jama>
References: <1396307129-13329-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1396307129-13329-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] swig : Update to version 2.0.12 and fix cmake find swig issue.
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
X-List-Received-Date: Sun, 20 Apr 2014 08:55:07 -0000
X-Groupsio-MsgNum: 49295
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UExESr5xZTMxdOWv"
Content-Disposition: inline

--UExESr5xZTMxdOWv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 04:05:29PM -0700, Philip Balister wrote:
>  * Dropped PR and PR_INC due to PV change.
>  * The cmake rule looks for swig2.0. For the sdk case, the host distro
> may have a swig2.0 installed. If so the sdk would find the host swig. This
> updates the sdk so it also has a swig2.0 soft linked to the swig binary in
> the sdk.

merged, thanks!

>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-devtools/swig/swig.inc       | 5 ++++-
>  meta-oe/recipes-devtools/swig/swig_2.0.10.bb | 9 ---------
>  meta-oe/recipes-devtools/swig/swig_2.0.12.bb | 7 +++++++
>  3 files changed, 11 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.10.bb
>  create mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.12.bb
>=20
> diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-dev=
tools/swig/swig.inc
> index 8e83526..52ef9a6 100644
> --- a/meta-oe/recipes-devtools/swig/swig.inc
> +++ b/meta-oe/recipes-devtools/swig/swig.inc
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De7807a6282784a=
7dde4c846626b08fc6 \
>                      file://LICENSE-UNIVERSITIES;md5=3D8ce9dcc8f7c994de4a=
408b205c72ba08"
> =20
>  SECTION =3D "devel"
> -INC_PR =3D "r3"
> =20
>  DEPENDS =3D "libpcre python"
> =20
> @@ -50,3 +49,7 @@ do_configure() {
>      oe_runconf
>  }
> =20
> +do_install_append_class-nativesdk() {
> +    cd ${D}${bindir}
> +    ln -s swig swig2.0
> +}
> diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.10.bb b/meta-oe/recip=
es-devtools/swig/swig_2.0.10.bb
> deleted file mode 100644
> index 312ce11..0000000
> --- a/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require ${BPN}.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win3=
2-plat.patch"
> -
> -SRC_URI[md5sum] =3D "6d5e7ad05b4a404e5e85db9befb70c9a"
> -SRC_URI[sha256sum] =3D "d1eef329e867124ce60838b5ad07c763146b6c8f250dd22a=
861ead7406f78e63"
> -
> diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.12.bb b/meta-oe/recip=
es-devtools/swig/swig_2.0.12.bb
> new file mode 100644
> index 0000000..0fbcfa1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
> @@ -0,0 +1,7 @@
> +require ${BPN}.inc
> +
> +SRC_URI +=3D "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win3=
2-plat.patch"
> +
> +SRC_URI[md5sum] =3D "c3fb0b2d710cc82ed0154b91e43085a4"
> +SRC_URI[sha256sum] =3D "65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c6028=
21a541817a4317f7"
> +
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UExESr5xZTMxdOWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTi28ACgkQN1Ujt2V2gBye3gCdGJ3bKAKrYZp0Jlre2UF/2RfC
C3UAoLPmjRt10WLOFKZBbmwUgxpUcgN/
=y9p9
-----END PGP SIGNATURE-----

--UExESr5xZTMxdOWv--

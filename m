Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8A87A65D8F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:18:34 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2906690eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=waanEo0lWyIfUS9lHlGEsPswMaWajsa7LV1v+fEmps4=;
	b=gXQ5HnBI6jCKCT88ZE9feG5obnLENfUw+HGnoC9hi8zMWxwxPi1yZnbLeyHdH7cK8K
	s4Dj94Dt9+WWOdAMDotWLLjk2RDs0qy9s/LTYXVMSbnf7+Io+Np/RfM2DGUCktrDncVW
	bXB681yK2rzLnhcFy0QXd/f7nbfm3sd3qjN/7mIB4EKhB6cTCwIWvDzs4M2zTZPEtgX3
	wg8YRe8zXjqdDOaQGEbmEcyV+IexAuXFov4YgrgTZCgovKSCABETebKZ+TT7PhuqOXYY
	3HrMDEPXGAOHoVijvkBJ4zZ/KeBEfPw8279t1PYfuZwMMAwgOLPeV8dd7xvjhfj4jVL+
	sgvQ==
X-Received: by 10.15.54.137 with SMTP id t9mr38017557eew.39.1397992715119;
	Sun, 20 Apr 2014 04:18:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g3sm93760457eet.35.2014.04.20.04.18.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:18:33 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:18:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420111838.GP2486@jama>
References: <1396885622-28017-1-git-send-email-jatedev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396885622-28017-1-git-send-email-jatedev@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>
Subject: Re: [meta-oe][PATCH] Fix samba's DEPENDS which was triggering rebuild
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
X-List-Received-Date: Sun, 20 Apr 2014 11:18:35 -0000
X-Groupsio-MsgNum: 49323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="suroagWEfFHnktSq"
Content-Disposition: inline

--suroagWEfFHnktSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 11:47:02AM -0400, Jate Sujjavanich wrote:
> From: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>
>=20
> Use PACKAGECONFIG to properly provide the option for libtalloc

Merged, thanks!

>=20
> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recip=
es-connectivity/samba/samba.inc
> index 7391bbf..b527a66 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -1,6 +1,6 @@
>  SECTION =3D "console/network"
>  LICENSE =3D "GPL-3.0"
> -DEPENDS =3D "readline virtual/libiconv talloc zlib popt"
> +DEPENDS =3D "readline virtual/libiconv zlib popt"
> =20
>  SRC_URI =3D "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
>             file://volatiles.03_samba \
> @@ -35,7 +35,6 @@ EXTRA_OECONF=3D'--disable-cups \
>                --with-aio-support \
>                --with-winbind \
>                --with-wbclient \
> -              --without-libtalloc \
>                --without-acl-support \
>                --disable-avahi \
>                samba_cv_struct_timespec=3Dyes \
> @@ -44,6 +43,7 @@ EXTRA_OECONF=3D'--disable-cups \
>  PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '',=
 d)}"
>  PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
>  PACKAGECONFIG[fam] =3D "--enable-fam,--disable-fam,gamin"
> +PACKAGECONFIG[talloc] =3D "--with-libtalloc,--without-libtalloc,talloc"
> =20
>  INITSCRIPT_PACKAGES =3D "samba winbind"
>  INITSCRIPT_NAME_samba =3D "samba"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--suroagWEfFHnktSq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrQ4ACgkQN1Ujt2V2gBww4gCfbhtBgzgYrwreCEOg17jMWmkT
nW4AnjRsXnx8KW6/Hv2UmrL0+G3lnXK7
=79Md
-----END PGP SIGNATURE-----

--suroagWEfFHnktSq--

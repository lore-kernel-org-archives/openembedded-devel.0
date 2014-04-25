Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id D5B0465D04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:40:13 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2815486eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VMwNDx2mWXCMpl9Q0/gQFYYhc4AVW3UvVU/6Zkz43ss=;
	b=xZcW383yfS/QbnPBdgGkvWGEQzR4Lqyrl4wdYt4Ws8N8UZkG6yMYVOrfOe6BcOe1Th
	D8oYWDEfxwgZwgWgzJkH9+Y4dEjdpNgWmbMrQ/bLGCbwfhf0b1BSlyJV9KzB9H8WiK6i
	qkgmne8epN75ADWaG8qi84Nmri8xKgI4SXdS1QBZZj2JIB/ujkOsqoo8JRp4WXEUJrtb
	8ECEau2z7N9XK0WuLjRNo9dsD7+MYWZKBCVfQkDMrL9EsHZlXqnSse0ikbxDRBVwbA+1
	CK0Z0LhadLY+La65yXtfyUtvWG/4113ey+pQDHLrk/ksk2im/yuO5/fdgNxrMCjYlGxD
	010g==
X-Received: by 10.15.83.68 with SMTP id b44mr10439500eez.11.1398429613912;
	Fri, 25 Apr 2014 05:40:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm24556349eex.21.2014.04.25.05.40.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 05:40:12 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 14:40:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425124023.GW2486@jama>
References: <1398409067-31641-1-git-send-email-changhyeok.bae@lge.com>
	<1398409067-31641-2-git-send-email-changhyeok.bae@lge.com>
	<013501cf6054$17016340$450429c0$@lge.com>
MIME-Version: 1.0
In-Reply-To: <013501cf6054$17016340$450429c0$@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/2] lzip: Upgrade to 1.15
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
X-List-Received-Date: Fri, 25 Apr 2014 12:40:14 -0000
X-Groupsio-MsgNum: 49495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mNqB7BSMRyhUYAix"
Content-Disposition: inline

--mNqB7BSMRyhUYAix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 04:00:49PM +0900, Changhyeok Bae wrote:
> Those 2 patches should merge after=20
> "[PATCH v3] mirrors.bbclass: Add mirror site for savannah" in oe-core

OK, so it will be applied only after branching meta-oe/daisy.

> -----Original Message-----
> From: Changhyeok Bae [mailto:changhyeok.bae@lge.com]=20
> Sent: Friday, April 25, 2014 3:58 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Changhyeok Bae
> Subject: [PATCH 2/2] lzip: Upgrade to 1.15
>=20
> lzip v1.14 is not available in SRC_URI.
>=20
> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  .../lzip/{lzip_1.14.bb =3D> lzip_1.15.bb}            |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)  rename
> meta-oe/recipes-support/lzip/{lzip_1.14.bb =3D> lzip_1.15.bb} (81%)
>=20
> diff --git a/meta-oe/recipes-support/lzip/lzip_1.14.bb
> b/meta-oe/recipes-support/lzip/lzip_1.15.bb
> similarity index 81%
> rename from meta-oe/recipes-support/lzip/lzip_1.14.bb
> rename to meta-oe/recipes-support/lzip/lzip_1.15.bb
> index 5a7f3fc..3d64695 100644
> --- a/meta-oe/recipes-support/lzip/lzip_1.14.bb
> +++ b/meta-oe/recipes-support/lzip/lzip_1.15.bb
> @@ -8,10 +8,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.=
gz"
> =20
>  # Only the latest version is available in .tar.gz format from
> savannah.gnu.org,  # FreeBSD distfiles is known to have version 1.13.
> -MIRRORS +=3D "http://download.savannah.gnu.org/releases/lzip/
> ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/"
> =20
> -SRC_URI[md5sum] =3D "39a4b06952ee45274525dc0582cdd651"
> -SRC_URI[sha256sum] =3D
> "7ff5cc521560edb2a0a6cdf258cf3afdaeb1dbcc354d96d011d0dd7ec584cbe7"
> +SRC_URI[md5sum] =3D "e83a364c8544fc66cccb552369d93220"
> +SRC_URI[sha256sum] =3D
> "7cd3fcda68fc9900efcf7784313e3bdd1303fef1a0546db9723f5e5564dd05b6"
> =20
>  CONFIGUREOPTS =3D "\
>      '--srcdir=3D${S}' \
> --
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mNqB7BSMRyhUYAix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaV7cACgkQN1Ujt2V2gBxA4ACfTI+q0OLpdcU+uoRXraq0jdao
TSAAnA/1tm9bWKSWfGCm+gqn+zRhky4H
=vFhm
-----END PGP SIGNATURE-----

--mNqB7BSMRyhUYAix--

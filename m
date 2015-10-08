Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id DC18960125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:12:01 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so20927880wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dt6HesSh31iyc0dkX3SxiEVpoIAd+kRNI0odDjjcjtE=;
	b=Mle7UnWStwsnbnZmWpQj1Hvyv3p8cdLOMk3c10qe5ypQirff1UV2R0FewfBcvvsG4k
	ypqJiXLXJ5bgk7oCI+YwzcHrFnoIbtLxOq0C4n7WvBq0tIiEsAdpciXDEb2YGXhKUHbq
	Ejmc0riEdep3on8Q5hW5SWbsxwzm4l9mqGiX9ANxhGivL4fwcr9EkSmr494B1lSCXn4T
	UWtI3RSjNTQatCPfRBaT4zgF85M6h/NQzyB6a/zZ+i0ySIZkzvJhrLsWkzE7DyWOOTJ0
	JI8xYkZU6xLiro2rBsWFI9H7q+WhcCFftNhlT4DuU6IXkd4G4XBCIStp7nVTxJJ9cww+
	VwmQ==
X-Received: by 10.194.9.97 with SMTP id y1mr7944745wja.84.1444299121401;
	Thu, 08 Oct 2015 03:12:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bu19sm45122478wjb.45.2015.10.08.03.12.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:12:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:12:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008101212.GG2385@jama>
References: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
MIME-Version: 1.0
In-Reply-To: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] mongodb: receipe fixed, removed from blacklist and now cross compiles to arm.
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
X-List-Received-Date: Thu, 08 Oct 2015 10:12:03 -0000
X-Groupsio-MsgNum: 57733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Content-Disposition: inline

--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 10:50:35PM +0200, Johnny Vestergaard wrote:
> Removed the dependencies on system boost.

Still fails in world builds.

http://errors.yoctoproject.org/Errors/Details/20235/
>=20
> Signed-off-by: Johnny Vestergaard <jkv@unixcluster.dk>
> ---
>  meta-oe/recipes-support/mongodb/mongodb_git.bb | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/rec=
ipes-support/mongodb/mongodb_git.bb
> index 879fc7c..7348978 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "AGPL-3.0 & Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://GNU-AGPL-3.0.txt;md5=3D73f1eb20517c55bf9493=
b7dd6e480788 \
>                      file://APACHE-2.0.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57"
> =20
> -DEPENDS =3D "openssl libpcre boost libpcap"
> +DEPENDS =3D "glibc openssl libpcre boost libpcap"
>  # Mongo uses tcmalloc on x86_64, which is provided by gperftools
>  DEPENDS_append_x86-64 =3D " gperftools"
> =20
> @@ -14,7 +14,7 @@ inherit scons
>  # | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g=
++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod] E=
rror 1
>  # | scons: building terminated because of errors.
>  # | ERROR: scons build execution failed.
> -PNBLACKLIST[mongodb] ?=3D "Fails to build with system boost"
> +#PNBLACKLIST[mongodb] ?=3D "Fails to build with system boost"
> =20
>  PV =3D "2.6.0+git${SRCPV}"
>  SRCREV =3D "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
> @@ -30,15 +30,12 @@ S =3D "${WORKDIR}/git"
> =20
>  export OE_TARGET_ARCH=3D"${TARGET_ARCH}"
> =20
> -EXTRA_OESCONS =3D "--prefix=3D${D}${prefix} \
> +EXTRA_OESCONS =3D "sysroot=3D${STAGING_DIR_TARGET} \
> +                 --prefix=3D${D}${prefix} \
>                   --propagate-shell-environment \
>                   --cc-use-shell-environment \
>                   --cxx-use-shell-environment \
> -                 --ld=3D'${TARGET_PREFIX}g++' \
>                   --ssl \
> -                 --use-system-pcre \=20
> -                 --use-system-boost \
> -                 --use-system-tcmalloc \
>                   --disable-scripting \
>                   --nostrip \
>                   mongod mongos"
> --=20
> 2.6.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWQXsACgkQN1Ujt2V2gBw84gCcDC8+0RbyyP7KJnG9VHp3LkHO
220AnA3ZOpOUOcy+mQdsSmSSnX8/Jd/Z
=LVdV
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--

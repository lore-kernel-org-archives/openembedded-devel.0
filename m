Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id DD94F703A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:54:00 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so3343292wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wZbxioqIHMp3AW+85EA3rXziuSSAcp99AbAA3qkDTc4=;
	b=akVUyMwR13wfJdhBPQgVYdLHW+1EphmI83whXwOxTkSJNElYijB0FMeQ1oJZ0s3axW
	R87D8enkN9lBMt2biRjDLoqvHbKKBJWbEedO6efH+MnqXrS9cf08xSmOEkkhM2MWRAis
	AWdHYqxFoplLKPAZwVyhaSstLWcC9G1tqcYZPgchSQlpt9+LNEl6pt0KHB5VfoL3BhX6
	6fCCix/2wUWSpXcorvyI+545/kHQEWg1idOAEAoyf+5EzuQkB2Qpl9+luCeB7BiwzofO
	+7S/onQ9mOj85OBK5ROcFgrL7PTvvQDUJBXQ0VprYnO1AEb9psXbHOQ13Z1mFUjAv9a4
	6DWA==
X-Received: by 10.194.62.110 with SMTP id x14mr19953847wjr.15.1405349641381;
	Mon, 14 Jul 2014 07:54:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x13sm31953478wib.23.2014.07.14.07.54.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 07:54:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Jul 2014 16:54:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140714145409.GH2433@jama>
References: <1405327294-4030-1-git-send-email-koen.kooi@linaro.org>
	<1405327294-4030-2-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1405327294-4030-2-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH 2/2] libhugetlbfs: fix packaging
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
X-List-Received-Date: Mon, 14 Jul 2014 14:54:12 -0000
X-Groupsio-MsgNum: 50914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aFi3jz1oiPowsTUB"
Content-Disposition: inline

--aFi3jz1oiPowsTUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 10:41:34AM +0200, Koen Kooi wrote:
> Libhugetlbs doesn't generate proper .so.X libs, only two .so files. Packa=
ge those in ${PN} and silence the resulting QA warning. This fixes:
>=20
>  ERROR: QA Issue: libhugetlbfs-tests rdepends on libhugetlbfs-dev
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index af7ed3e..d3b64bf 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -25,6 +25,7 @@ COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64)=
=2E*-linux*"
> =20
>  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
>  EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC}'=
 ${LIBARGS} V=3D1"
> +PARALLEL_MAKE_pn-${PN} =3D ""

Is _pn override really needed?

>  CFLAGS +=3D "-fexpensive-optimizations -frename-registers -fomit-frame-p=
ointer -g0"
> =20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> @@ -46,12 +47,15 @@ do_install() {
>            install-tests
>  }
> =20
> -PARALLEL_MAKE_pn-${PN} =3D ""
> =20
>  PACKAGES =3D+ "${PN}-perl ${PN}-tests "
> +FILES_${PN} +=3D "${libdir}/*.so"
> +FILES_${PN}-dev =3D "${includedir}"
>  FILES_${PN}-dbg +=3D "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir=
}/libhugetlbfs/tests/obj64/.debug"
>  FILES_${PN}-perl =3D "${libdir}/perl"
>  FILES_${PN}-tests +=3D "${libdir}/libhugetlbfs/tests"
> =20
> +INSANE_SKIP_${PN} =3D "dev-so"
> +
>  INHIBIT_PACKAGE_STRIP =3D "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aFi3jz1oiPowsTUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPD7xEACgkQN1Ujt2V2gBxk/QCcDAcR6uuE+Z6zxnbMuLVzsKG5
NrwAmQHBrDVhmBmWJAcNK+CdyAF+5NbR
=kLWx
-----END PGP SIGNATURE-----

--aFi3jz1oiPowsTUB--

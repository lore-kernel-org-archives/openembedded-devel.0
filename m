Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E66F76080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:53:53 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l126so144897886wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vIboLTO5G3Vt5FDwbiBO6k0cnCVJ+SV0AVlYCgJnYXY=;
	b=koB8yx62chOHRLgK+kERmtmnDFeY28RTtlLp6BUHvwGl88oqDTSwYGCdoDI0yevIgY
	C7rly9I8XiA0WUJQM4ys5ef2FnErsuP8gtc+q0uHAt24JR9DtZpYJYdce+vm5WLPmfhv
	BZLkTTWAB6j5a9327cEIEn7xpV98+XCduNpeaDwHRT0PjbjZGhbtiUakMsNHCoghU59K
	5t1jYjUMOApWSyGhUME1ln4+alkTLj3qsTn1hA29tOgUTcaV/AhTgMlN+S4jxP8B3SqB
	xBaVRE6cIIeO6kaff1hBmIc3w3gYccanD+6KaoGAFbHu+l6nKnxW8vEk1FMUq1lrY0ga
	dmHA==
X-Received: by 10.28.138.3 with SMTP id m3mr31561907wmd.39.1450868033578;
	Wed, 23 Dec 2015 02:53:53 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z1sm36853198wje.35.2015.12.23.02.53.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 02:53:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2015 11:57:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151223105704.GF2569@jama>
References: <1450322326-1715-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1450322326-1715-1-git-send-email-jian.liu@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] php: uninitialized pointer in phar_make_dirstream()
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
X-List-Received-Date: Wed, 23 Dec 2015 10:53:54 -0000
X-Groupsio-MsgNum: 59159
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline

--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 11:18:46AM +0800, Jian Liu wrote:
> CVE-2015-7804:
> Off-by-one error in the phar_parse_zipfile function in ext/phar/zip.c
> in PHP before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers
> to cause a denial of service (uninitialized pointer dereference and
> application crash) by including the / filename in a .zip PHAR archive.

Upgrade to 5.6.16 was already merged in master, I've dropped this change
=66rom master-next now.

Maybe you wanted to get it merged in jethro branch?

>=20
> This patch is from
> http://git.php.net/?p=3Dphp-src.git;a=3Dcommitdiff;\
> h=3D1ddf72180a52d247db88ea42a3e35f824a8fbda1;hp=3Df98ab19dc0c978e3caaa261=
4579e4a61f2c317f5
>=20
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  .../php/php-5.6.12/php-CVE-2015-7804.patch         | 35 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/php/php.inc               |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-=
7804.patch
>=20
> diff --git a/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.pa=
tch b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.patch
> new file mode 100644
> index 0000000..248d1d1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.patch
> @@ -0,0 +1,35 @@
> +FIx bug #70433 - Uninitialized pointer in phar_make_dirstream when zip e=
ntry filename is "/"
> +
> +Off-by-one error in the phar_parse_zipfile function in ext/phar/zip.c=20
> +in PHP before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers=20
> +to cause a denial of service (uninitialized pointer dereference and=20
> +application crash) by including the / filename in a .zip PHAR archive.
> +
> +Written-by: Stanislav Malyshev <stas@php.net>
> +
> +diff -Nur php-5.6.12.orig/ext/phar/util.c php-5.6.12/ext/phar/util.c
> +--- php-5.6.12.orig/ext/phar/util.c	2015-12-16 18:51:51.603455462 +0800
> ++++ php-5.6.12/ext/phar/util.c	2015-12-16 18:53:43.483456242 +0800
> +@@ -1969,7 +1969,7 @@
> +=20
> + 	while ((s =3D zend_memrchr(filename, '/', filename_len))) {
> + 		filename_len =3D s - filename;
> +-		if (FAILURE =3D=3D zend_hash_add_empty_element(&phar->virtual_dirs, f=
ilename, filename_len)) {
> ++		if (!filename_len || FAILURE =3D=3D zend_hash_add_empty_element(&phar=
->virtual_dirs, filename, filename_len)) {
> + 			break;
> + 		}
> + 	}
> +diff -Nur php-5.6.12.orig/ext/phar/zip.c php-5.6.12/ext/phar/zip.c
> +--- php-5.6.12.orig/ext/phar/zip.c	2015-12-16 18:51:51.603455462 +0800
> ++++ php-5.6.12/ext/phar/zip.c	2015-12-16 18:54:39.667456634 +0800
> +@@ -396,7 +396,9 @@
> +=20
> + 		if (entry.filename[entry.filename_len - 1] =3D=3D '/') {
> + 			entry.is_dir =3D 1;
> +-			entry.filename_len--;
> ++			if(entry.filename_len > 1) {
> ++				entry.filename_len--;
> ++			}
> + 			entry.flags |=3D PHAR_ENT_PERM_DEF_DIR;
> + 		} else {
> + 			entry.is_dir =3D 0;
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 4aa9c3f..d0c596c 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -15,6 +15,7 @@ SRC_URI =3D "http://php.net/distributions/php-${PV}.tar=
=2Ebz2 \
>             file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
>             file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
>             file://php-CVE-2015-7803.patch \
> +           file://php-CVE-2015-7804.patch \
>            "
> =20
>  SRC_URI_append_class-target +=3D " \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ6fgAACgkQN1Ujt2V2gBzuMgCaAx4Hs5wHtWSDFucrBquz1GOq
PyIAnAhFDThJrCTFzWNupZ2RMMU/uC2W
=ua0N
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 412596080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:53:42 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p187so140135698wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B9anhrn6QYUUKDeu5kUmYZlS7jwNDRB9DHFQa1UOF3Q=;
	b=gvKPcGSWm5zN7FnKwXql/q8eXOuC9TGgSkxufpcmNEWz6kniBw/VhYXMt5XVDZyRtN
	EBwQ5y53ICvKthyxkKQwABW9PbYPIYQCdPtG792jaJDd7p3YVNuaOMBPKTpC/JaCFftU
	NEaTlbPO+WPY3ccQVrDSy9DA9crclB0RosnQBQbfr+2VODzq1Hhq/9IkUUdLV5SEzZ2P
	p3h23HY1eEa6hRDi76HtRgr9wS+dWw1uNMHiavduUhz2h3PBI4sZ3+rkIdV76dqxh4Rn
	3jiZM/aSLRYIxoW33BaEKHsyJfpJ2MxiJmu6clOjhtaAmkNuNU1gft5qSJ6COLmny0mQ
	2Rxw==
X-Received: by 10.194.120.226 with SMTP id lf2mr32859654wjb.108.1450868022982; 
	Wed, 23 Dec 2015 02:53:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gy2sm17493394wjc.12.2015.12.23.02.53.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 02:53:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2015 11:56:53 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151223105653.GE2569@jama>
References: <1450322300-1671-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1450322300-1671-1-git-send-email-jian.liu@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] php: NULL pointer dereference in phar_get_fp_offset()
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
X-List-Received-Date: Wed, 23 Dec 2015 10:53:44 -0000
X-Groupsio-MsgNum: 59158
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline

--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 11:18:20AM +0800, Jian Liu wrote:
> CVE-2015-7803:
> The phar_get_entry_data function in ext/phar/util.c in PHP
> before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers
> to cause a denial of service (NULL pointer dereference and
> application crash) via a .phar file with a crafted TAR archive
> entry in which the Link indicator references a file that does
> not exist.

Upgrade to 5.6.16 was already merged in master, I've dropped this change
=66rom master-next now.

Maybe you wanted to get it merged in jethro branch?

>=20
> This patch is from
> http://git.php.net/?p=3Dphp-src.git;a=3Dcommitdiff;\
> h=3Dd698f0ae51f67c9cce870b09c59df3d6ba959244;hp=3Dbb98ed600ab6787d9d36792=
7d49439be9a83441e
>=20
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  .../php/php-5.6.12/php-CVE-2015-7803.patch         | 72 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/php/php.inc               |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-=
7803.patch
>=20
> diff --git a/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.pa=
tch b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.patch
> new file mode 100644
> index 0000000..77ff44f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.patch
> @@ -0,0 +1,72 @@
> +Fix bug #69720: Null pointer dereference in phar_get_fp_offset()
> +
> +The phar_get_entry_data function in ext/phar/util.c in PHP=20
> +before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers=20
> +to cause a denial of service (NULL pointer dereference and=20
> +application crash) via a .phar file with a crafted TAR archive=20
> +entry in which the Link indicator references a file that does=20
> +not exist.
> +
> +Written-by: Stanislav Malyshev <stas@php.net>
> +
> +Binary files php-5.6.12.orig/ext/phar/tests/bug69720.phar and php-5.6.12=
/ext/phar/tests/bug69720.phar differ
> +diff -Nur php-5.6.12.orig/ext/phar/tests/bug69720.phpt php-5.6.12/ext/ph=
ar/tests/bug69720.phpt
> +--- php-5.6.12.orig/ext/phar/tests/bug69720.phpt	1970-01-01 08:00:00.000=
000000 +0800
> ++++ php-5.6.12/ext/phar/tests/bug69720.phpt	2015-12-16 17:15:56.70341533=
9 +0800
> +@@ -0,0 +1,40 @@
> ++--TEST--
> ++Phar - bug #69720 - Null pointer dereference in phar_get_fp_offset()
> ++--SKIPIF--
> ++<?php if (!extension_loaded("phar")) die("skip"); ?>
> ++--FILE--
> ++<?php
> ++try {
> ++    // open an existing phar
> ++    $p =3D new Phar(__DIR__."/bug69720.phar",0);
> ++    // Phar extends SPL's DirectoryIterator class
> ++	echo $p->getMetadata();
> ++    foreach (new RecursiveIteratorIterator($p) as $file) {
> ++        // $file is a PharFileInfo class, and inherits from SplFileInfo
> ++	$temp=3D"";
> ++        $temp=3D $file->getFileName() . "\n";
> ++        $temp.=3Dfile_get_contents($file->getPathName()) . "\n"; // dis=
play contents
> ++	var_dump($file->getMetadata());
> ++    }
> ++}
> ++ catch (Exception $e) {
> ++    echo 'Could not open Phar: ', $e;
> ++}
> ++?>
> ++--EXPECTF--
> ++
> ++MY_METADATA_NULL
> ++
> ++Warning: file_get_contents(phar:///%s): failed to open stream: phar err=
or: "test.php" is not a file in phar "%s.phar" in %s.php on line %d
> ++array(1) {
> ++  ["whatever"]=3D>
> ++  int(123)
> ++}
> ++object(DateTime)#2 (3) {
> ++  ["date"]=3D>
> ++  string(26) "2000-01-01 00:00:00.000000"
> ++  ["timezone_type"]=3D>
> ++  int(3)
> ++  ["timezone"]=3D>
> ++  string(3) "UTC"
> ++}
> +diff -Nur php-5.6.12.orig/ext/phar/util.c php-5.6.12/ext/phar/util.c
> +--- php-5.6.12.orig/ext/phar/util.c	2015-12-16 17:06:04.011411206 +0800
> ++++ php-5.6.12/ext/phar/util.c	2015-12-16 17:18:08.683416259 +0800
> +@@ -494,7 +494,11 @@
> + 	(*ret)->is_tar =3D entry->is_tar;
> + 	(*ret)->fp =3D phar_get_efp(entry, 1 TSRMLS_CC);
> + 	if (entry->link) {
> +-		(*ret)->zero =3D phar_get_fp_offset(phar_get_link_source(entry TSRMLS=
_CC) TSRMLS_CC);
> ++		phar_entry_info *link =3D phar_get_link_source(entry TSRMLS_CC);
> ++		if(!link) {
> ++			return FAILURE;
> ++		}
> ++		(*ret)->zero =3D phar_get_fp_offset(link TSRMLS_CC);
> + 	} else {
> + 		(*ret)->zero =3D phar_get_fp_offset(entry TSRMLS_CC);
> + 	}
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 67d2362..4aa9c3f 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -14,6 +14,7 @@ SRC_URI =3D "http://php.net/distributions/php-${PV}.tar=
=2Ebz2 \
>             file://acinclude-xml2-config.patch \
>             file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
>             file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
> +           file://php-CVE-2015-7803.patch \
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

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ6ffQACgkQN1Ujt2V2gBz+UwCdEcdMaWfdd3WYyIVhoEBsa5UR
FhQAnjzAosAgcGkTUGiVmaJeR3nTOAKj
=CG/a
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--

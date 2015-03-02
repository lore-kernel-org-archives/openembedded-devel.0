Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E99C17212A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 07:59:07 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so12678842wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 23:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZMAcAFL6QBb0teGOxb1ZEQn3YOwjRZOTv6LFA4n+47w=;
	b=ZJRZ8QAPJwQu/Egw6sEsBgqZwqS9g682qLBK4hLVY/tT2XMqCGjH/gi61h/r5ZCND1
	c/+FVyTG2Y3wAAEx2EFMzgCPtbjwMIqdWXLiAxTiLrKj9KkoE19I65QgPLrnwkiEIRa7
	r75WtGQ55p/n4kYucsErX19ui7lAcW99X97H8XgBrTUpb/bR19KxBwKWzxIy4uWFHwis
	diq2Md+MA0RLWAvTYhVIETPI70lsfHgPb4E6kKUHWKxu6OpZm7wWOeFbgc0UZIdFfk6L
	7aqrf9M/nIEfiLkEFyAcnaEruRU9gpS3JRWxzvRH9gxF5zyhOmp1kVKqL/dZ3x7K9aZ6
	Ponw==
X-Received: by 10.180.72.98 with SMTP id c2mr33393090wiv.87.1425283148475;
	Sun, 01 Mar 2015 23:59:08 -0800 (PST)
Received: from localhost ([89.176.104.3]) by mx.google.com with ESMTPSA id
	dt7sm14850488wib.19.2015.03.01.23.59.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 23:59:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 08:59:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302075928.GV2309@jama>
References: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/4] soci: Add recipe
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
X-List-Received-Date: Mon, 02 Mar 2015 07:59:09 -0000
X-Groupsio-MsgNum: 54571
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jn/MQTzma+jNUHFC"
Content-Disposition: inline

--jn/MQTzma+jNUHFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 10:25:05PM +0000, Khem Raj wrote:
> Define PACKAGECONFIG to enable a given backend of choice
> by default its 'empty'
>=20
> Change-Id: Ie1123af658ca94d2fe22a3ca1a32dfb47d58979e
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/soci/soci_3.2.2.bb | 46 ++++++++++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-support/soci/soci_3.2.2.bb

Is this v2 to fix following QA?

soci-3.2.2: soci: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/libsoci_core.so.3.2.2
  /usr/lib64/libsoci_empty.so.3.2.2
  /usr/lib64/libsoci_core.so.3.2
  /usr/lib64/libsoci_core.so
  /usr/lib64/libsoci_core.a
  /usr/lib64/libsoci_empty.so.3.2
  /usr/lib64/libsoci_empty.so
  /usr/lib64/libsoci_empty.a
  /usr/lib64/.debug
  /usr/lib64/.debug/libsoci_core.so.3.2.2
  /usr/lib64/.debug/libsoci_empty.so.3.2.2 [installed-vs-shipped]

>=20
> diff --git a/meta-oe/recipes-support/soci/soci_3.2.2.bb b/meta-oe/recipes=
-support/soci/soci_3.2.2.bb
> new file mode 100644
> index 0000000..1c333cb
> --- /dev/null
> +++ b/meta-oe/recipes-support/soci/soci_3.2.2.bb
> @@ -0,0 +1,46 @@
> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "The C++ Database Access Library"
> +HOMEPAGE =3D "http://soci.sourceforge.net"
> +LICENSE =3D "BSL-1.0"
> +SECTION =3D "libs"
> +DEPENDS =3D "boost"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d=
31bef20d78c"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${P}/${P}.tar.g=
z"
> +SRC_URI[md5sum] =3D "bc3c35f6cd3f80a1be19fe30b3c111bf"
> +SRC_URI[sha256sum] =3D "30ea2f4d26639ef5b5cdc24fb300b3896746243dbb77b743=
582de2ff443ccb1c"
> +
> +TESTCONFIG =3D '-DSOCI_TEST_EMPTY_CONNSTR=3D"dummy" -DSOCI_TEST_SQLITE3_=
CONNSTR=3D"test.db" \
> +              -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING=3D"dbname=3Dsoci_tes=
t" \
> +              -DSOCI_TEST_MYSQL_CONNSTR:STRING=3D"db=3Dsoci_test user=3D=
oe password=3Doe"'
> +
> +OBASEDIR ?=3D "/opt/oracle"
> +OINCDIR =3D "rdbms/public"
> +OLIBDIR =3D "lib"
> +
> +PACKAGECONFIG[sqlite3] =3D "-DSOCI_SQLITE3=3DON,-DSOCI_SQLITE3=3DOFF,sql=
ite3,"
> +PACKAGECONFIG[mysql] =3D "-DSOCI_MYSQL=3DON,-DSOCI_MYSQL=3DOFF,mariadb,"
> +PACKAGECONFIG[postgresql] =3D "-DSOCI_POSTGRESQL=3DON,-DSOCI_POSTGRESQL=
=3DOFF,postgresql,"
> +PACKAGECONFIG[odbc] =3D "-DSOCI_ODBC=3DON,-DSOCI_ODBC=3DOFF,,"
> +PACKAGECONFIG[empty] =3D "-DSOCI_EMPTY=3DON,-DSOCI_EMPTY=3DOFF,,"
> +PACKAGECONFIG[oracle] =3D "-DWITH_ORACLE=3DON --with-oracle-include=3D${=
OINCDIR} --with-oracle-lib=3D${OLIBDIR},-DWITH_ORACLE=3DOFF,,"
> +PACKAGECONFIG[ptest] =3D "${TESTCONFIG},,,"
> +
> +# enable your backend by default we enable 'empty'
> +PACKAGECONFIG ??=3D "empty"
> +
> +# Take the flags added by PACKAGECONFIG and pass them to cmake.
> +EXTRA_OECMAKE =3D "${EXTRA_OECONF}"
> +
> +inherit cmake
> +
> +PACKAGES +=3D "${PN}-sqlite3 ${PN}-mysql ${PN}-postgresql ${PN}-odbc ${P=
N}-oracle"
> +
> +FILES_${PN}-sqlite3 =3D "${libdir}/lib${BPN}_sqlite3.so.*"
> +FILES_${PN}-mysql =3D "${libdir}/lib${BPN}_mysql.so.*"
> +FILES_${PN}-postgresql =3D "${libdir}/lib${BPN}_postgresql.so.*"
> +FILES_${PN}-odbc =3D "${libdir}/lib${BPN}_odbc.so.*"
> +FILES_${PN}-oracle =3D "${libdir}/lib${BPN}_oracle.so.*"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jn/MQTzma+jNUHFC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0GGAACgkQN1Ujt2V2gBw2aACePtKQ9BciVXqrWVHNgBQ/u7T3
NrgAn1yQSWL7pvy9EnMzuI67tJkznKBg
=ezbs
-----END PGP SIGNATURE-----

--jn/MQTzma+jNUHFC--

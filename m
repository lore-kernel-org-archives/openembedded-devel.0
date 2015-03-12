Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id CDF4773B3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 11:32:17 +0000 (UTC)
Received: by wggy19 with SMTP id y19so15667430wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+Iz3Ujozr4AYIsZrC0Sr/u9c4CFUUCz5DiI3l2nTQBE=;
	b=0W1ET6QCKTwESHOSOzKcqEaDQoz78PCx7TBHdMkjw+kezjflOTut6CGXIrNnIce9o5
	A/WIg6ldi/PboSCHyBhrxZLj3JrCfWFw4YlqX9wXX7iRGcrk0nzRq6Pd5Rxr2ky1j5qm
	XvyvRx4FydFHFoK+D0edPbHAti6eQubwDIoMZc98AZcydT+zwwdMjWRPUuSZ40P5Fkyc
	3DwKgQeTLBKohHO/T4UDUl6RnRP51hDbsLflIAUzIfCclOOnZjoRlX8Xe62TTmvbFBoY
	PGlZMZzuB6aGEuWsYQTs5SIg0kAs+c1FRYVpl3jT6/jeUNUvvFifGZ6OUh82aDepCOTO
	M+pQ==
X-Received: by 10.194.192.104 with SMTP id hf8mr86747683wjc.44.1426159938187; 
	Thu, 12 Mar 2015 04:32:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei3sm15544781wib.4.2015.03.12.04.32.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 04:32:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Mar 2015 12:32:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150312113258.GB2338@jama>
References: <1425812371-1564-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1425812371-1564-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCHv3 1/2] soci: Add recipe
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
X-List-Received-Date: Thu, 12 Mar 2015 11:32:20 -0000
X-Groupsio-MsgNum: 54752
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2015 at 10:59:30AM +0000, Khem Raj wrote:
> Define PACKAGECONFIG to enable a given backend of choice
> by default its 'empty'
>=20
> Change-Id: Ie1123af658ca94d2fe22a3ca1a32dfb47d58979e
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-support/soci/soci/soci_libdir.patch    | 28 +++++++++++++
>  meta-oe/recipes-support/soci/soci_3.2.2.bb         | 48 ++++++++++++++++=
++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta-oe/recipes-support/soci/soci/soci_libdir.patch
>  create mode 100644 meta-oe/recipes-support/soci/soci_3.2.2.bb

The patch fails to apply:
ERROR: Command Error: exit status: 1  Output:
Applying patch soci_libdir.patch
patching file CMakeLists.txt
Hunk #1 FAILED at 69.
1 out of 1 hunk FAILED -- rejects in file CMakeLists.txt
Patch soci_libdir.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5e-oe-linux-gnueabi/soci/3.2.2-r0/temp/log.do_patch.26404
NOTE: recipe soci-3.2.2-r0: task do_patch: Failed
ERROR: Task 21069 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-support/soci/soci_3.2.2.bb, do_patch) failed with exit code '1'

Can you push it to contrib repo to exclude possible patchwork breakage of i=
t?

> diff --git a/meta-oe/recipes-support/soci/soci/soci_libdir.patch b/meta-o=
e/recipes-support/soci/soci/soci_libdir.patch
> new file mode 100644
> index 0000000..8da57ce
> --- /dev/null
> +++ b/meta-oe/recipes-support/soci/soci/soci_libdir.patch
> @@ -0,0 +1,28 @@
> +Define SOCI_LIBDIR only if its not passed via environemnt. In OE we
> +want to set it per our choice since we use 'lib' for 64bit unless we
> +are using multilib
> +
> +-Khem
> +
> +Index: soci-3.2.2/CMakeLists.txt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- soci-3.2.2.orig/CMakeLists.txt
> ++++ soci-3.2.2/CMakeLists.txt
> +@@ -69,11 +69,12 @@ include(SociDependencies)
> + #######################################################################=
########
> + # Installation
> + #######################################################################=
########
> +-
> +-if(APPLE OR CMAKE_SIZEOF_VOID_P EQUAL 4)
> +-  set(SOCI_LIBDIR "lib")
> +-else()
> +-  set(SOCI_LIBDIR "lib")
> ++if(NOT DEFINED SOCI_LIBDIR)
> ++  if(APPLE OR CMAKE_SIZEOF_VOID_P EQUAL 4)
> ++    set(SOCI_LIBDIR "lib")
> ++  else()
> ++    set(SOCI_LIBDIR "lib")
> ++  endif()
> + endif()
> +=20
> + set(BINDIR "bin" CACHE PATH "The directory to install binaries into.")
> diff --git a/meta-oe/recipes-support/soci/soci_3.2.2.bb b/meta-oe/recipes=
-support/soci/soci_3.2.2.bb
> new file mode 100644
> index 0000000..887f5a2
> --- /dev/null
> +++ b/meta-oe/recipes-support/soci/soci_3.2.2.bb
> @@ -0,0 +1,48 @@
> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "The C++ Database Access Library"
> +HOMEPAGE =3D "http://soci.sourceforge.net"
> +LICENSE =3D "BSL-1.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d=
31bef20d78c"
> +SECTION =3D "libs"
> +DEPENDS =3D "boost"
> +
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${P}/${P}.tar.g=
z \
> +           file://soci_libdir.patch \
> +          "
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
> +EXTRA_OECMAKE =3D "${EXTRA_OECONF} -DSOCI_LIBDIR=3D${libdir}"
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

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUBeWoACgkQN1Ujt2V2gBwfZQCfWz/cNJ2esQ1hhFBAmzSdf4zK
jDMAn3LCzrBmL8mo2jTbd0YXJaTBvaww
=Q9fY
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--

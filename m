Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B470078C48
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 00:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0F6101858D;
	Fri, 27 Jul 2018 02:19:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9-yTsZIqGg4Z; Fri, 27 Jul 2018 02:19:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B6307184A9;
	Fri, 27 Jul 2018 02:19:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D4D81E083;
	Fri, 27 Jul 2018 02:19:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 903881E07D;
	Fri, 27 Jul 2018 02:19:48 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 27 Jul 2018 02:19:48 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 816DE1AF4;
	Fri, 27 Jul 2018 02:19:48 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 27 Jul 2018 02:19:48 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 27 Jul 2018 02:19:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Yi Zhao <yi.zhao@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.33 -> 2.3.34
Thread-Index: AQHUIj/hteibDRxmG0iK563dpaxTqKSiOZkg
Date: Fri, 27 Jul 2018 00:19:48 +0000
Message-ID: <96a1138705244f699e91ee1ea540c46a@XBOX02.axis.com>
References: <1532321061-20994-1-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1532321061-20994-1-git-send-email-yi.zhao@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-webserver][PATCH] apache2: upgrade 2.4.33 -> 2.3.34
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
X-List-Received-Date: Fri, 27 Jul 2018 00:19:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Yi Zhao
> Sent: den 23 juli 2018 06:44
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.33 -> 2.3.34

That should be 2.4.34, not 2.3.34.

>=20
> Security fixes:
>=20
> CVE-2018-8011
> mod_md: DoS via Coredumps on specially crafted requests
>=20
> CVE-2018-1333
> mod_http2: DoS for HTTP/2 connections by specially crafted requests
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../apache2/{apache2-native_2.4.33.bb =3D> apache2-native_2.4.34.bb} | 4=
 ++--
>  .../recipes-httpd/apache2/{apache2_2.4.33.bb =3D> apache2_2.4.34.bb} | 4=
 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.33.bb =
=3D> apache2-native_2.4.34.bb} (91%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.33.bb =3D> apac=
he2_2.4.34.bb} (98%)
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.b=
b b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
> similarity index 91%
> rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
> index a471036..a3a6804 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
> @@ -15,8 +15,8 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2=
 \
>  S =3D "${WORKDIR}/httpd-${PV}"
>=20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd52d0fd0bc788f068e647116c01dd=
fcd"
> -SRC_URI[md5sum] =3D "6ef469d3f16fffeb688bc6e0346823e5"
> -SRC_URI[sha256sum] =3D "de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da=
5bf2ad4b70846f05"
> +SRC_URI[md5sum] =3D "818adca52f3be187fe45d6822755be95"
> +SRC_URI[sha256sum] =3D "fa53c95631febb08a9de41fd2864cfff815cf62d9306723a=
b0d4b8d7aa1638f0"
>=20
>  EXTRA_OECONF =3D "--with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \
>                  --with-apr-util=3D${STAGING_BINDIR_CROSS}/apu-1-config \
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
> similarity index 98%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
> index 696378e..6642f2b 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
> @@ -23,8 +23,8 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2=
 \
>            "
>=20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd52d0fd0bc788f068e647116c01dd=
fcd"
> -SRC_URI[md5sum] =3D "6ef469d3f16fffeb688bc6e0346823e5"
> -SRC_URI[sha256sum] =3D "de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da=
5bf2ad4b70846f05"
> +SRC_URI[md5sum] =3D "818adca52f3be187fe45d6822755be95"
> +SRC_URI[sha256sum] =3D "fa53c95631febb08a9de41fd2864cfff815cf62d9306723a=
b0d4b8d7aa1638f0"
>=20
>  S =3D "${WORKDIR}/httpd-${PV}"
>=20
> --
> 2.7.4

//Peter



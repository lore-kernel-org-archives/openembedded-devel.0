Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B65A173173
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 16:24:55 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n186so54026039wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T2qFyIFjb0vjFDD8XH4qj9Ko9Cx4q9FFFWXghksHi60=;
	b=E2LRx9Mggk9Du5BtVjBFxfflx8d1W9HohRgiYR80r9VH6A3LpcoYvEiRGhoZQJde69
	+vLxCbXEiZe+rvWJY8G7cPwbtBPbI28NF6rt7Il63irhKjyQTLwfcVH+bl1hfhvDCz8T
	SiD/HdRxq8V//bPvGYp3BCy3fXiaI+GutTxVtqQs+tsFisFp+AdvRrHOKKOp7+0G4IfD
	Ysc7o7p6EHINPDYBumHD5hmdttmxVGWh7mE1OR21fcAgQ/oJL0pYtj+Amj9kWdY20PNB
	DImtgllroiILfueTxp8hGJiVQ55fE70krPq26H6k/g5/RU4PArNSTJ9CKPa2CId5qGD3
	0I5g==
X-Received: by 10.28.189.11 with SMTP id n11mr27291033wmf.27.1450110295305;
	Mon, 14 Dec 2015 08:24:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g3sm10851037wjw.31.2015.12.14.08.24.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 08:24:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Dec 2015 17:26:56 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151214162656.GA2212@jama>
References: <cover.1450027640.git.akuster808@gmail.com>
	<c2c72c32cd47ebaaaac9cdbc769e0f4a8e5eac80.1450027640.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c2c72c32cd47ebaaaac9cdbc769e0f4a8e5eac80.1450027640.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 04/14] net-snmp: fix cross compilation
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
X-List-Received-Date: Mon, 14 Dec 2015 16:25:00 -0000
X-Groupsio-MsgNum: 59005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 07:33:57AM -0800, Armin Kuster wrote:
> From: Rafa=EBl Carr=E9 <funman@videolan.org>
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../0002-config_os_headers-Error-Fix.patch         | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
002-config_os_headers-Error-Fix.patch

There is another patch for net-snmp in master next, which actually adds
this .patch file to SRC_URI, this change alone doesn't do anything and
shouldn't be backported imho.

>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-con=
fig_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp=
/net-snmp/0002-config_os_headers-Error-Fix.patch
> new file mode 100644
> index 0000000..a90ce1f
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_=
headers-Error-Fix.patch
> @@ -0,0 +1,31 @@
> +From e24fcd140f3f6dd18fd836b197c6d4bb773e50e7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Rafa=3DC3=3DABl=3D20Carr=3DC3=3DA9?=3D <funman@videola=
n.org>
> +Date: Wed, 4 Nov 2015 16:49:30 +0100
> +Subject: [PATCH] config_os_headers: Error Fix
> +
> +ERROR: This autoconf log indicates errors, it looked at host include
> +and/or library paths while determining system capabilities.
> +---
> + configure.d/config_os_libs2 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
> +index 47491e2..e3647f9 100644
> +--- a/configure.d/config_os_libs2
> ++++ b/configure.d/config_os_libs2
> +@@ -226,10 +226,10 @@ if test "x$with_nl" !=3D "xno"; then
> +     case $target_os in
> +     linux*) # Check for libnl (linux)
> +         netsnmp_save_CPPFLAGS=3D"$CPPFLAGS"
> +-        CPPFLAGS=3D"-I/usr/include/libnl3 $CPPFLAGS"
> ++        CPPFLAGS=3D"$CPPFLAGS"
> +         NETSNMP_SEARCH_LIBS(nl_connect, nl-3,
> +             [AC_CHECK_HEADERS(netlink/netlink.h)
> +-            EXTERNAL_MIBGROUP_INCLUDES=3D"$EXTERNAL_MIBGROUP_INCLUDES -=
I/usr/include/libnl3"],
> ++            EXTERNAL_MIBGROUP_INCLUDES=3D"$EXTERNAL_MIBGROUP_INCLUDES"],
> +             [CPPFLAGS=3D"$netsnmp_save_CPPFLAGS"], [], [], [LMIBLIBS])
> +         if test "x$ac_cv_header_netlink_netlink_h" !=3D xyes; then
> +             NETSNMP_SEARCH_LIBS(nl_connect, nl, [
> +--=20
> +2.5.0
> +
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

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZu7dAACgkQN1Ujt2V2gByQ4gCeLBdsPOuAw4gaSZ8IbSppVLGi
9a8An0JN98FMWq8w+eAfsp9GbtBGWJH9
=AC/X
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--

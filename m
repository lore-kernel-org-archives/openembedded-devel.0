Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 40D3171F61
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 21:29:41 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Xllfa-0001yA-6o from Joe_MacDonald@mentor.com ;
	Tue, 04 Nov 2014 13:29:42 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6; Tue, 4 Nov 2014
	13:29:41 -0800
Received: by burninator (Postfix, from userid 1000)	id D8C52581737; Tue,  4
	Nov 2014 16:29:40 -0500 (EST)
Date: Tue, 4 Nov 2014 16:29:40 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20141104212940.GB11534@mentor.com>
References: <1414636000-17823-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1414636000-17823-1-git-send-email-Chong.Lu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] squid: change ksh reference in krb ldap helper to sh
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
X-List-Received-Date: Tue, 04 Nov 2014 21:29:42 -0000
X-Groupsio-MsgNum: 52733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] squid: change ksh reference in krb ldap help=
er to sh] On 14.10.30 (Thu 10:26) Chong Lu wrote:

> This solves the following warning:
>=20
> squid-3.4.7: squid requires /bin/bash, /usr/bin/perl, but no providers in=
 its
> RDEPENDS [file-rdeps]
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  ...-ksh-reference-in-krb-ldap-helper-to-bash.patch | 29 ----------------
>  ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 ++++++++++++++++=
++++++
>  recipes-daemons/squid/squid_3.4.7.bb               |  3 +-
>  3 files changed, 41 insertions(+), 30 deletions(-)
>  delete mode 100644 recipes-daemons/squid/files/Change-ksh-reference-in-k=
rb-ldap-helper-to-bash.patch
>  create mode 100644 recipes-daemons/squid/files/squid-change-ksh-referenc=
e-in-krb-ldap-helper-to-sh.patch
>=20
> diff --git a/meta-networking/recipes-daemons/squid/files/Change-ksh-refer=
ence-in-krb-ldap-helper-to-bash.patch b/meta-networking/recipes-daemons/squ=
id/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
> deleted file mode 100644
> index 6591d5c..0000000
> --- a/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in=
-krb-ldap-helper-to-bash.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 37da4010f41d936c2c727fc32adab832bdde9bec Mon Sep 17 00:00:00 2001
> -Message-Id: <37da4010f41d936c2c727fc32adab832bdde9bec.1382481765.git.Jim=
=2ESomerville@windriver.com>
> -From: Jim Somerville <Jim.Somerville@windriver.com>
> -Date: Tue, 22 Oct 2013 18:39:39 -0400
> -Subject: [PATCH 1/1] Change ksh reference in krb ldap helper to bash
> -
> -Very simple cert_tool script with no ksh specifics.
> -Change it to use bash so a package dependency doesn't
> -get created to ksh.
> -
> -Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> ----
> - helpers/external_acl/kerberos_ldap_group/cert_tool |    3 ++-
> - 1 files changed, 2 insertions(+), 1 deletions(-)
> -
> -diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helper=
s/external_acl/kerberos_ldap_group/cert_tool
> -index 9f14959..b61be5d 100644
> ---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
> -+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
> -@@ -1,4 +1,5 @@
> --#!/bin/ksh
> -+#!/bin/bash
> -+# The above was originally ksh
> - #
> - #  --------------------------------------------------------------------=
---------
> - #=20
> ---=20
> -1.7.4.1
> -
> diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-ksh=
-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daemons=
/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
> new file mode 100644
> index 0000000..8e03860
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/squid-change-ksh-refere=
nce-in-krb-ldap-helper-to-sh.patch
> @@ -0,0 +1,39 @@
> +squid: change ksh reference in krb ldap helper to sh
> +
> +Very simple cert_tool script with no ksh specifics.
> +Change it to use sh so a package dependency doesn't
> +get created to ksh.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + helpers/external_acl/kerberos_ldap_group/cert_tool | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helper=
s/external_acl/kerberos_ldap_group/cert_tool
> +index 9f14959..8c4ea11 100644
> +--- a/helpers/external_acl/kerberos_ldap_group/cert_tool
> ++++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
> +@@ -1,4 +1,4 @@
> +-#!/bin/ksh
> ++#!/bin/sh
> + #
> + #  --------------------------------------------------------------------=
---------
> + #=20
> +@@ -64,9 +64,9 @@ QUIT
> + # Create database for Sun ldap and pem file for Openldap=20
> + #
> + rm ${server}_[0-9]*.pem 2>/dev/null
> +-let i=3D0
> ++i=3D0
> +  ls ${server}_[0-9]*.cert | while read file; do
> +- let i=3Di+1
> ++ i=3D`expr $i + 1`
> +  cat  $file  >> ${server}_$i.pem
> +  CA=3D`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA:.*=
true"`
> +  if [ -n "$CA" ]; then
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-=
networking/recipes-daemons/squid/squid_3.4.7.bb
> index cd10bd0..c5f616d 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v${MAJ=
_VER}/${MIN_VER}/${BPN}-${P
>             file://Set-up-for-cross-compilation.patch \
>             file://Skip-AC_RUN_IFELSE-tests.patch \
>             file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
> -           file://Change-ksh-reference-in-krb-ldap-helper-to-bash.patch \
> +           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh.pa=
tch \
>             file://squid-use-serial-tests-config-needed-by-ptest.patch \
>             file://run-ptest \
>             file://volatiles.03_squid \
> @@ -63,4 +63,5 @@ FILES_${PN} +=3D "${libdir} ${datadir}/errors ${datadir=
}/icons"
>  FILES_${PN}-dbg +=3D "/usr/src/debug"
>  FILES_${PN}-doc +=3D "${datadir}/*.txt"
> =20
> +RDEPENDS_${PN} +=3D "perl"
>  RDEPENDS_${PN}-ptest +=3D "make"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUWUVEAAoJEEn8ffcsOfaWPsAH/15S5x/KPWVAkyZwOsX0VJ3T
SQrIOW8pHauen5yD60j38iBBg5E20uhjtWpBtsJbxiO/rxv6d9y3rbxojyrw/7pu
6Vr6kG6xHcA6F4rywLniD0WngYY/djUcQQOBdA0wvz4ojODLsjAhsnwsIVLQcrIp
vPwsjyvL8w8yD/8kE943HVRdqP7sZUO0Ojynb40VkObJ1yoJFCb5uwqsyZI7Tkvu
nCR5iGN6S368rHGTxyeXNcviNltN3hqFJR4Cj5zPi7nLrLp6mhzLd620Gz8Od5Ym
iC36a6B/ql872l5L4nfTaTM40XwTGBKrLm8JDk/5WZLWeBYorjkv2r7cyHlNx3Y=
=OIV8
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

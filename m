Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4757D734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 14:56:39 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZNMb1-0003UF-NV from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Aug 2015 07:56:39 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 07:56:39 -0700
Received: by burninator (Postfix, from userid 1000)	id 74E08582BA5; Thu,  6
	Aug 2015 10:56:03 -0400 (EDT)
Date: Thu, 6 Aug 2015 10:56:03 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150806145603.GA12457@mentor.com>
References: <1436234146-4895-1-git-send-email-rongqing.li@windriver.com>
	<55BACC5A.1050808@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55BACC5A.1050808@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking][v3] squid: upgrade to 3.5.5
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
X-List-Received-Date: Thu, 06 Aug 2015 14:56:40 -0000
X-Groupsio-MsgNum: 56574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking][v3] squid: upgrade to 3.5.5] On 15.07.31=
 (Fri 09:16) Rongqing Li wrote:

> Ping

Just getting to look at the queue again and this stood out for me:

>=20
> -Roy
>=20
> On 2015=E5=B9=B407=E6=9C=8807=E6=97=A5 09:55, rongqing.li@windriver.com w=
rote:
> >From: Roy Li <rongqing.li@windriver.com>
> >
> >1. Remove the squid-change-ksh-referen*.patch which is not needed, since
> >    3.5.5 did not use ksh by default.
> >2. Update the checksum of COPYING,since the date in it has been changed.
> >3. Define BUILDCXXFLAGS, otherwise the target gcc options -std=3Dc++11 w=
ill
> >    add into it, and lead to building failure since host gcc maybe not
> >    support "-std=3Dc++11"
> >4. Assume to support GNU atomic operations by default, the running check
> >    on cross-compile setup does not work
> >5. Add the dependency on libpam

Is PAM actually a Squid dependency now?  None of the documentation seems
to indicate it is mandatory.  I know the last time around it was flagged
as a dependency in Martin's build logs, but that's because PAM was
detected during the build and used, not because Squid demands it, I
think.  We just need explicit behaviour because the auto-detected
behaviour is indeterminate.

-J.

> >
> >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >---
> >  ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 --------------=
--------
> >  .../squid/{squid_3.4.7.bb =3D> squid_3.5.5.bb}       | 11 +++---
> >  2 files changed, 6 insertions(+), 44 deletions(-)
> >  delete mode 100644 meta-networking/recipes-daemons/squid/files/squid-c=
hange-ksh-reference-in-krb-ldap-helper-to-sh.patch
> >  rename meta-networking/recipes-daemons/squid/{squid_3.4.7.bb =3D> squi=
d_3.5.5.bb} (86%)
> >
> >diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-ks=
h-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daemon=
s/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
> >deleted file mode 100644
> >index 8e03860..0000000
> >--- a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-refer=
ence-in-krb-ldap-helper-to-sh.patch
> >+++ /dev/null
> >@@ -1,39 +0,0 @@
> >-squid: change ksh reference in krb ldap helper to sh
> >-
> >-Very simple cert_tool script with no ksh specifics.
> >-Change it to use sh so a package dependency doesn't
> >-get created to ksh.
> >-
> >-Upstream-Status: Pending
> >-
> >-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> >-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >----
> >- helpers/external_acl/kerberos_ldap_group/cert_tool | 6 +++---
> >- 1 file changed, 3 insertions(+), 3 deletions(-)
> >-
> >-diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helpe=
rs/external_acl/kerberos_ldap_group/cert_tool
> >-index 9f14959..8c4ea11 100644
> >---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
> >-+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
> >-@@ -1,4 +1,4 @@
> >--#!/bin/ksh
> >-+#!/bin/sh
> >- #
> >- #  -------------------------------------------------------------------=
----------
> >- #
> >-@@ -64,9 +64,9 @@ QUIT
> >- # Create database for Sun ldap and pem file for Openldap
> >- #
> >- rm ${server}_[0-9]*.pem 2>/dev/null
> >--let i=3D0
> >-+i=3D0
> >-  ls ${server}_[0-9]*.cert | while read file; do
> >-- let i=3Di+1
> >-+ i=3D`expr $i + 1`
> >-  cat  $file  >> ${server}_$i.pem
> >-  CA=3D`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA:.=
*true"`
> >-  if [ -n "$CA" ]; then
> >---
> >-1.9.1
> >-
> >diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta=
-networking/recipes-daemons/squid/squid_3.5.5.bb
> >similarity index 86%
> >rename from meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> >rename to meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> >index 7b00dfc..198319d 100644
> >--- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> >+++ b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> >@@ -16,19 +16,18 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v${=
MAJ_VER}/${MIN_VER}/${BPN}-${P
> >             file://Set-up-for-cross-compilation.patch \
> >             file://Skip-AC_RUN_IFELSE-tests.patch \
> >             file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
> >-           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh.p=
atch \
> >             file://squid-use-serial-tests-config-needed-by-ptest.patch \
> >             file://run-ptest \
> >             file://volatiles.03_squid \
> >  "
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc492e2d6d32ec5c1aad0e0609a1=
41ce9 \
> >-                    file://COPYRIGHT;md5=3D2900f50789c498be8e9f1eb23b55=
cbe9 \
> >+                    file://errors/COPYRIGHT;md5=3D0fed8f1462f6fdbc62bb4=
31bcb618f46 \
> >                     "
> >-SRC_URI[md5sum] =3D "9951034b10f7ee0f45a95cfae61c57c2"
> >-SRC_URI[sha256sum] =3D "7b423f3d3495a317503ca559ea535f80445fd7c4e3c3e26=
8cb7a8c97c61af2b6"
> >+SRC_URI[md5sum] =3D "6aac5c2e9cbbeabcbf2e9e49a178a931"
> >+SRC_URI[sha256sum] =3D "741c24a307c50f0d845d53cabb66b36d91ce9a73c8a165e=
ae5def5e4d11e6a0d"
> >
> >-DEPENDS =3D "libtool krb5 openldap db cyrus-sasl"
> >+DEPENDS =3D "libtool krb5 openldap db cyrus-sasl libpam"
> >
> >  inherit autotools useradd ptest
> >
> >@@ -38,6 +37,8 @@ USERADD_PARAM_${PN} =3D "--system --no-create-home --h=
ome-dir /var/run/squid --she
> >  PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG[libnetfilter-conntrack] =3D "--with-netfilter-conntrack=
=3D${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
> >  EXTRA_OECONF +=3D "--with-default-user=3Dsquid"
> >+export BUILDCXXFLAGS=3D"${BUILD_CXXFLAGS}"
> >+CACHED_CONFIGUREVARS +=3D "squid_cv_gnu_atomics=3Dyes"
> >
> >  TESTDIR =3D "test-suite"
> >  do_compile_ptest() {
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
--=20
-Joe MacDonald.
:wq

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVw3WDAAoJEEn8ffcsOfaWtbYH/RoR/mw/jxxf2/dM3d6AYJvc
RZFFPcUd3yUH6CauXAkgkfkqh/9NkZH3rlR5IJf+wTyzbJLChF7WBq+/QVv8Z/aP
qO9is3p7SGJwzyoKk5mgvVJXJEYVpfK18gua+pz8DTJ2Zhb/GpGrdUeWjlIPVYqF
3My8tJKGNsT3YV16qQkosejEC57GpCMV+vHnTezU1zH31BpIhHmjCPmecJH4Y4sm
2VJ8MyCvjXa72ZWspdUziZG1+YCV2aipJrPfFFoKVEWVaCqdX33GViaGb8suiuE1
62NeI8Al54VsvT3mqZ9Bxu1aC1YAGZ1+GKJOgsZw3DZBwKdoqO9Gpqzkamu8nPk=
=gObb
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

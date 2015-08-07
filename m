Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E952276798
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 13:53:46 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZNi5i-0003oZ-4f from Joe_MacDonald@mentor.com ;
	Fri, 07 Aug 2015 06:53:46 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 7 Aug 2015 06:53:45 -0700
Received: by burninator (Postfix, from userid 1000)	id 58BA658051A; Fri,  7
	Aug 2015 09:53:06 -0400 (EDT)
Date: Fri, 7 Aug 2015 09:53:06 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20150807135305.GA4021@mentor.com>
References: <1436234146-4895-1-git-send-email-rongqing.li@windriver.com>
	<55BACC5A.1050808@windriver.com>
	<20150806145603.GA12457@mentor.com>
	<55C41B67.6030906@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55C41B67.6030906@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 07 Aug 2015 13:53:51 -0000
X-Groupsio-MsgNum: 56597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking][v3] squid: upgrade to 3.5.5] On 15.08.07=
 (Fri 10:43) Rongqing Li wrote:

>=20
>=20
> On 2015=E5=B9=B408=E6=9C=8806=E6=97=A5 22:56, Joe MacDonald wrote:
> >[Re: [oe] [PATCH][meta-networking][v3] squid: upgrade to 3.5.5] On 15.07=
=2E31 (Fri 09:16) Rongqing Li wrote:
> >
> >>Ping
> >
> >Just getting to look at the queue again and this stood out for me:
> >
> Hi Joe:
>=20
> I see several patches stayed in master-next for a long time,
> Could you consider to merge them to master?
>=20
> meta-oe$ git log --oneline master-next ^master ./meta-networking/
> 4842138 opensaf: upgrade 4.5.0 -> 4.6.0
> fec751e vsftpd: upgrade 3.0.2->3.0.3
> 6c8ab71 ypbind-mt: add dependency but keep as broken
> dbb4501 stunnel: upgrade 5.17 -> 5.21
> 0531aae quagga: upgrade 0.99.23 -> 0.99.24.1
> e357ad6 netperf: fix the broken download url
> 27f7240 net-snmp: fix mib representation of timeout values
> 40c187b ypbind-mt: get parameters from dhcp
> 8f45f1b tcpslice: fix do_install
> 105f950 openvpn: upgrade 2.3.6 -> 2.3.7
> 9193170 radvd: upgrade 1.14 -> 2.11
> 085a82d netcf: upgrade 0.2.3 -> 0.2.8
> 65f4eed strongswan: upgrade to 5.3.2
> 463ab47 dovecot: upgrade 2.2.10 -> 2.2.18
> 73f0f92 crda: upgrade 3.13 -> 3.18
> b9ea02a cim-schema-exper: add new recipe for openlmi
> cdd2db1 ntp: upgrade 4.2.8p2 -> 4.2.8p3
> 1019565 squid: upgrade to 3.5.5
> dd56f0d inetutils: Fix deadlock in telnetd when cleanup
> 23b4e6c ypbind-yocto.init: add status command

Thirteen got merged yesterday, your tree may be out of date.

-J.

>=20
>=20
>=20
> >>
> >>-Roy
> >>
> >>On 2015=E5=B9=B407=E6=9C=8807=E6=97=A5 09:55, rongqing.li@windriver.com=
 wrote:
> >>>From: Roy Li <rongqing.li@windriver.com>
> >>>
> >>>1. Remove the squid-change-ksh-referen*.patch which is not needed, sin=
ce
> >>>    3.5.5 did not use ksh by default.
> >>>2. Update the checksum of COPYING,since the date in it has been change=
d.
> >>>3. Define BUILDCXXFLAGS, otherwise the target gcc options -std=3Dc++11=
 will
> >>>    add into it, and lead to building failure since host gcc maybe not
> >>>    support "-std=3Dc++11"
> >>>4. Assume to support GNU atomic operations by default, the running che=
ck
> >>>    on cross-compile setup does not work
> >>>5. Add the dependency on libpam
> >
> >Is PAM actually a Squid dependency now?  None of the documentation seems
> >to indicate it is mandatory.  I know the last time around it was flagged
> >as a dependency in Martin's build logs, but that's because PAM was
> >detected during the build and used, not because Squid demands it, I
> >think.  We just need explicit behaviour because the auto-detected
> >behaviour is indeterminate.
> >
> >-J.
>=20
> I check the source code, did not find the configuration option,
> seems pam is a must.
>=20
> like:
> http://www.rpmfind.net/linux/rpm2html/search.php?query=3Dsquid&submit=3DS=
earch+...&system=3D&arch=3D
> http://www.rpmfind.net//linux/RPM/mageia/cauldron/i586/media/core/release=
/squid-3.5.7-1.mga6.i586.html
>=20
> -Roy
>=20
> >
> >>>
> >>>Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >>>---
> >>>  ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 ------------=
----------
> >>>  .../squid/{squid_3.4.7.bb =3D> squid_3.5.5.bb}       | 11 +++---
> >>>  2 files changed, 6 insertions(+), 44 deletions(-)
> >>>  delete mode 100644 meta-networking/recipes-daemons/squid/files/squid=
-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
> >>>  rename meta-networking/recipes-daemons/squid/{squid_3.4.7.bb =3D> sq=
uid_3.5.5.bb} (86%)
> >>>
> >>>diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-=
ksh-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daem=
ons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
> >>>deleted file mode 100644
> >>>index 8e03860..0000000
> >>>--- a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-ref=
erence-in-krb-ldap-helper-to-sh.patch
> >>>+++ /dev/null
> >>>@@ -1,39 +0,0 @@
> >>>-squid: change ksh reference in krb ldap helper to sh
> >>>-
> >>>-Very simple cert_tool script with no ksh specifics.
> >>>-Change it to use sh so a package dependency doesn't
> >>>-get created to ksh.
> >>>-
> >>>-Upstream-Status: Pending
> >>>-
> >>>-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> >>>-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >>>----
> >>>- helpers/external_acl/kerberos_ldap_group/cert_tool | 6 +++---
> >>>- 1 file changed, 3 insertions(+), 3 deletions(-)
> >>>-
> >>>-diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/hel=
pers/external_acl/kerberos_ldap_group/cert_tool
> >>>-index 9f14959..8c4ea11 100644
> >>>---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
> >>>-+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
> >>>-@@ -1,4 +1,4 @@
> >>>--#!/bin/ksh
> >>>-+#!/bin/sh
> >>>- #
> >>>- #  -----------------------------------------------------------------=
------------
> >>>- #
> >>>-@@ -64,9 +64,9 @@ QUIT
> >>>- # Create database for Sun ldap and pem file for Openldap
> >>>- #
> >>>- rm ${server}_[0-9]*.pem 2>/dev/null
> >>>--let i=3D0
> >>>-+i=3D0
> >>>-  ls ${server}_[0-9]*.cert | while read file; do
> >>>-- let i=3Di+1
> >>>-+ i=3D`expr $i + 1`
> >>>-  cat  $file  >> ${server}_$i.pem
> >>>-  CA=3D`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA=
:.*true"`
> >>>-  if [ -n "$CA" ]; then
> >>>---
> >>>-1.9.1
> >>>-
> >>>diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/me=
ta-networking/recipes-daemons/squid/squid_3.5.5.bb
> >>>similarity index 86%
> >>>rename from meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> >>>rename to meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> >>>index 7b00dfc..198319d 100644
> >>>--- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> >>>+++ b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> >>>@@ -16,19 +16,18 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v=
${MAJ_VER}/${MIN_VER}/${BPN}-${P
> >>>             file://Set-up-for-cross-compilation.patch \
> >>>             file://Skip-AC_RUN_IFELSE-tests.patch \
> >>>             file://Fix-flawed-dynamic-ldb-link-test-in-configure.patc=
h \
> >>>-           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh=
=2Epatch \
> >>>             file://squid-use-serial-tests-config-needed-by-ptest.patc=
h \
> >>>             file://run-ptest \
> >>>             file://volatiles.03_squid \
> >>>  "
> >>>
> >>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc492e2d6d32ec5c1aad0e0609=
a141ce9 \
> >>>-                    file://COPYRIGHT;md5=3D2900f50789c498be8e9f1eb23b=
55cbe9 \
> >>>+                    file://errors/COPYRIGHT;md5=3D0fed8f1462f6fdbc62b=
b431bcb618f46 \
> >>>                     "
> >>>-SRC_URI[md5sum] =3D "9951034b10f7ee0f45a95cfae61c57c2"
> >>>-SRC_URI[sha256sum] =3D "7b423f3d3495a317503ca559ea535f80445fd7c4e3c3e=
268cb7a8c97c61af2b6"
> >>>+SRC_URI[md5sum] =3D "6aac5c2e9cbbeabcbf2e9e49a178a931"
> >>>+SRC_URI[sha256sum] =3D "741c24a307c50f0d845d53cabb66b36d91ce9a73c8a16=
5eae5def5e4d11e6a0d"
> >>>
> >>>-DEPENDS =3D "libtool krb5 openldap db cyrus-sasl"
> >>>+DEPENDS =3D "libtool krb5 openldap db cyrus-sasl libpam"
> >>>
> >>>  inherit autotools useradd ptest
> >>>
> >>>@@ -38,6 +37,8 @@ USERADD_PARAM_${PN} =3D "--system --no-create-home -=
-home-dir /var/run/squid --she
> >>>  PACKAGECONFIG ??=3D ""
> >>>  PACKAGECONFIG[libnetfilter-conntrack] =3D "--with-netfilter-conntrac=
k=3D${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
> >>>  EXTRA_OECONF +=3D "--with-default-user=3Dsquid"
> >>>+export BUILDCXXFLAGS=3D"${BUILD_CXXFLAGS}"
> >>>+CACHED_CONFIGUREVARS +=3D "squid_cv_gnu_atomics=3Dyes"
> >>>
> >>>  TESTDIR =3D "test-suite"
> >>>  do_compile_ptest() {
> >>>
> >>
> >>--
> >>Best Reagrds,
> >>Roy | RongQing Li
> >>
> >>
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
--=20
-Joe MacDonald.
:wq

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVxLg6AAoJEEn8ffcsOfaWGJMH+wcgl0DdFk1owiPoiNfLebI1
/4sNeQs6+aqf2Er8EjwabKXFCWdL/UyeaY7btYvYkvN1hVNoDf7YMLPs4WLAYIqH
TGrNVUxm+j3CrwYHMD8UEIGyhtSWSpLmjEnb1q7aEE4BRvHpJyQwb2Qf9oe4fcQ0
vWdkjO9cnO5xaq/j+X0W+SWAHDxe1gMuZdAA/U6TscC2eyt78+K3TAjsiJgX9Wzs
5yLebmtQv9JkrA3jm8FdN2Mj/gtGPJVBbo2EOVeP3q6HrshC3tshOHDvj55b7pTT
pAk8DBSZjq18U23Rejl5CQrX6WE259n1SMjul9JrLqVHXk3eIbpaezHu4lMnI5g=
=IfET
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

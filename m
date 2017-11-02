Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C146271A8E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 07:19:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA27J5Js011855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Nov 2017 00:19:05 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Thu, 2 Nov 2017 00:19:04 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 2/2] samba: fix for AD DC service
Thread-Index: AQHTTKGRRV81zg6PxE6lI8AXHR5xFaMAsrog
Date: Thu, 2 Nov 2017 07:19:03 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B8FE444@ALA-MBC.corp.ad.wrs.com>
References: <cover.1508833120.git.jackie.huang@windriver.com>
	<7f688c0976cd2b29a52adf42ab60729caf3648ab.1508833120.git.jackie.huang@windriver.com>
In-Reply-To: <7f688c0976cd2b29a52adf42ab60729caf3648ab.1508833120.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.177.126]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH 2/2] samba: fix for AD DC service
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
X-List-Received-Date: Thu, 02 Nov 2017 07:19:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Please ignore this since we found an issue after disabling mitkrb5:

Samba can be built with either:
- system_mitkrb5        (--with-system-mitkrb5)
- embedded_heimdal =20
- system_heimdal

If we don't set --with-system-mitkrb5, it will find if there is system_heim=
dal , if not,
It will built with embedded_heimdal which seems only builds for x86 and x86=
-64,
and it needs libbsd on the host, it will fail when build for x86 and there =
is no 32bit libbsd
on the host:

tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-samba/4.6.7-r0/samba-4.6.7/b=
in/asn1_compile: error while loading shared libraries: libbsd.so.0: cannot =
open shared object file: No such file or directory

So I will re-work the patch to turn back to mitkrb5, but ad-dc will need to=
 be disabled by default since another know issue I mentioned in the comment=
s.
And someone from WR might work on the above issue.

Thanks,
Jackie


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Tuesday, October 24, 2017 16:23
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH 2/2] samba: fix for AD DC service
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The AD DC service is installed by default since the commit:
> """
> commit 28b8edc760d5e0664ad4861464f5de06f5fc305a
> samba: install all systemd unit files
> This includes samba.service, which other major distributions install, too=
.
> """
>=20
> But lack of required executable since ad-dc feature is disabled by defaul=
t.
>=20
> To fix the issue:
> - Add PACKAGECONFIG for ad-dc and enable by default.
> - Add PACKAGECONFIG for gnutls which is required by ad-dc and
>   enable by default.
> - Add PACKAGECONFIG for mitkrb5 but disable by default because
>   of an known issue:
>   http://samba.2283325.n4.nabble.com/samba-4-6-6-Unknown-dependency-
> kdc-in-service-kdc-objlist-td4722096.html
> - Don't install samba.service if ad-dc is disabled.
> - Re-package ad-dc service and executable into a new package samba-ad-dc
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-connectivity/samba/samba_4.6.7.bb      | 35 ++++++++++++++++=
+----
> -
>  1 file changed, 27 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> index 2b227c95d..9372ea34a 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> @@ -34,7 +34,7 @@ inherit systemd waf-samba cpan-base perlnative update-
> rc.d
>  # remove default added RDEPENDS on perl
>  RDEPENDS_${PN}_remove =3D "perl"
>=20
> -DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libte=
vent libldb
> krb5 libbsd libaio libpam"
> +DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libte=
vent libldb
> libbsd libaio libpam"
>  DEPENDS_append_libc-musl =3D " libtirpc"
>  CFLAGS_append_libc-musl =3D " -I${STAGING_INCDIR}/tirpc"
>  LDFLAGS_append_libc-musl =3D " -ltirpc"
> @@ -45,12 +45,18 @@ LSB_linuxstdbase =3D "lsb"
>  INITSCRIPT_NAME =3D "samba"
>  INITSCRIPT_PARAMS =3D "start 20 3 5 . stop 20 0 1 6 ."
>=20
> -SYSTEMD_PACKAGES =3D "${PN}-base winbind"
> +SYSTEMD_PACKAGES =3D "${PN}-base ${PN}-ad-dc winbind"
>  SYSTEMD_SERVICE_${PN}-base =3D "nmb.service smb.service"
> +SYSTEMD_SERVICE_${PN}-ad-dc =3D "samba.service"
>  SYSTEMD_SERVICE_winbind =3D "winbind.service"
>=20
> +# There are prerequisite settings to enable ad-dc, so disable the servic=
e by
> default.
> +# Reference:
> +#
> https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_
> Domain_Controller
> +SYSTEMD_AUTO_ENABLE_${PN}-ad-dc =3D "disable"
> +
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd
> zeroconf', d)} \
> -                   acl cups ldap \
> +                   acl ad-dc cups gnutls ldap \
>  "
>=20
>  RDEPENDS_${PN}-base +=3D "${LSB}"
> @@ -68,6 +74,15 @@ PACKAGECONFIG[valgrind] =3D ",--without-
> valgrind,valgrind,"
>  PACKAGECONFIG[lttng] =3D "--with-lttng, --without-lttng,lttng-ust"
>  PACKAGECONFIG[archive] =3D "--with-libarchive, --without-libarchive, lib=
archive"
>=20
> +# Building the AD (Active Directory) DC (Domain Controller) requires Gnu=
TLS,
> +# And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 accord=
ing to:
> +# http://samba.2283325.n4.nabble.com/samba-4-6-6-Unknown-dependency-
> kdc-in-service-kdc-objlist-td4722096.html
> +# So the working combination is:
> +# 1) ad-dc: enable, gnutls: enable, mitkrb5: disable
> +# 2) ad-dc: disable, gnutls: enable/disable, mitkrb5: enable
> +PACKAGECONFIG[ad-dc] =3D ",--without-ad-dc,,"
> +PACKAGECONFIG[gnutls] =3D "--enable-gnutls,--disable-gnutls,gnutls,"
> +PACKAGECONFIG[mitkrb5] =3D "--with-system-mitkrb5,,krb5,"
>=20
>=20
> SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,id
> map_tdb2"
>=20
> SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG',
> 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
> @@ -82,12 +97,9 @@ EXTRA_OECONF +=3D "--enable-fhs \
>                   --with-modulesdir=3D${libdir}/samba \
>                   --with-lockdir=3D${localstatedir}/lib/samba \
>                   --with-cachedir=3D${localstatedir}/lib/samba \
> -                 --disable-gnutls \
>                   --disable-rpath-install \
>                   --with-shared-modules=3D${SAMBA4_MODULES} \
>                   --bundled-libraries=3D${SAMBA4_LIBS} \
> -                 --with-system-mitkrb5 \
> -                 --without-ad-dc \
>                   ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--dis=
able-glusterfs',
> d)} \
>                   --with-cluster-support \
>                   --with-profiling-data \
> @@ -113,6 +125,10 @@ do_install_append() {
>          -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
>          -i ${D}${systemd_system_unitdir}/*.service
>=20
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'yes', 'no', d)=
}" =3D "no" ];
> then
> +        rm -f ${D}${systemd_system_unitdir}/samba.service
> +    fi
> +
>      install -d ${D}${sysconfdir}/tmpfiles.d
>      install -m644 packaging/systemd/samba.conf.tmp
> ${D}${sysconfdir}/tmpfiles.d/samba.conf
>      echo "d ${localstatedir}/log/samba 0755 root root -" \
> @@ -161,7 +177,7 @@ do_install_append() {
>  PACKAGES =3D+ "${PN}-python ${PN}-pidl \
>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
>               winbind \
> -             ${PN}-common ${PN}-base ${PN}-ctdb-tests \
> +             ${PN}-common ${PN}-base ${PN}-ad-dc ${PN}-ctdb-tests \
>               smbclient"
>=20
>  python samba_populate_packages() {
> @@ -196,9 +212,12 @@ FILES_${PN}-base =3D "${sbindir}/nmbd \
>                      ${localstatedir}/nmbd \
>                      ${localstatedir}/spool/samba \
>                      ${systemd_system_unitdir}/nmb.service \
> -                    ${systemd_system_unitdir}/samba.service \
>                      ${systemd_system_unitdir}/smb.service"
>=20
> +FILES_${PN}-ad-dc =3D "${sbindir}/samba \
> +                     ${systemd_system_unitdir}/samba.service \
> +                    "
> +
>  FILES_${PN}-ctdb-tests =3D "${bindir}/ctdb_run_tests \
>                            ${bindir}/ctdb_run_cluster_tests \
>                            ${sysconfdir}/ctdb/nodes \
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8357873BB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 18:52:45 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZFoGz-0004ex-HN from Joe_MacDonald@mentor.com ;
	Thu, 16 Jul 2015 11:52:45 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Jul 2015 11:52:44 -0700
Received: by burninator (Postfix, from userid 1000)	id EBA675835B3; Thu, 16
	Jul 2015 14:52:19 -0400 (EDT)
Date: Thu, 16 Jul 2015 14:52:19 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20150716185219.GD4432@mentor.com>
References: <1435202618-1610-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1435202618-1610-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] opensaf: Fix warning and add systemd service files.
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
X-List-Received-Date: Thu, 16 Jul 2015 18:52:48 -0000
X-Groupsio-MsgNum: 56267
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

All but the openhpi dependency seems to be good on this, so I merged a
modified version of the patch that dropped the AIS/HPI dependency.  I'm
putting together a quick patch now that would bring that back in as an
option and disabled by default, as Martin suggested.

-J.

[[oe] [meta-networking][PATCH] opensaf: Fix warning and add systemd service=
 files.] On 15.06.25 (Thu 11:23) Li xin wrote:

> 1) WARNING: The recipe opensaf is trying to install files into a
> shared area when those files already exist,so set
> --libdir=3D${libdir}/opensaf
>=20
> 2) Add systemd service file plmcboot.service and plmcd.service.
>=20
> 3) opensaf depends on openhpi,so add it.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../opensaf/opensaf/0001-plmcd-error-fix.patch     | 43 ++++++++++++++++=
++++++
>  .../opensaf/opensaf/plmcboot.service               | 13 +++++++
>  .../recipes-daemons/opensaf/opensaf/plmcd.service  | 15 ++++++++
>  .../recipes-daemons/opensaf/opensaf_4.5.0.bb       | 29 +++++++++++++--
>  4 files changed, 97 insertions(+), 3 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-=
plmcd-error-fix.patch
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcb=
oot.service
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcd=
=2Eservice
>=20
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-e=
rror-fix.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd=
-error-fix.patch
> new file mode 100644
> index 0000000..624cd2d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fi=
x.patch
> @@ -0,0 +1,43 @@
> +From f1813af4c154fb1d3950abbdf678c3a5a67222fc Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Thu, 25 Jun 2015 11:44:27 +0900
> +Subject: [PATCH] plmcd: error fix
> +
> +ld: cannot find -lsystemd-daemon
> +collect2: error: ld returned 1 exit status
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + contrib/plmc/plmcd/Makefile.am | 2 +-
> + contrib/plmc/plmcd/Makefile.in | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/contrib/plmc/plmcd/Makefile.am b/contrib/plmc/plmcd/Makefil=
e.am
> +index 8d847f2..dd7913a 100644
> +--- a/contrib/plmc/plmcd/Makefile.am
> ++++ b/contrib/plmc/plmcd/Makefile.am
> +@@ -32,7 +32,7 @@ plmcd_SOURCES =3D \
> + plmcd_LDFLAGS =3D -lpthread
> +=20
> + if ENABLE_SYSTEMD
> +-plmcd_LDFLAGS +=3D -lsystemd-daemon
> ++plmcd_LDFLAGS +=3D -lsystemd
> + endif
> +=20
> + plmcd_LDADD =3D \
> +diff --git a/contrib/plmc/plmcd/Makefile.in b/contrib/plmc/plmcd/Makefil=
e.in
> +index 0185dc4..e40513a 100644
> +--- a/contrib/plmc/plmcd/Makefile.in
> ++++ b/contrib/plmc/plmcd/Makefile.in
> +@@ -106,7 +106,7 @@ build_triplet =3D @build@
> + host_triplet =3D @host@
> + target_triplet =3D @target@
> + sbin_PROGRAMS =3D plmcd$(EXEEXT)
> +-@ENABLE_SYSTEMD_TRUE@am__append_1 =3D -lsystemd-daemon
> ++@ENABLE_SYSTEMD_TRUE@am__append_1 =3D -lsystemd
> + subdir =3D plmcd
> + ACLOCAL_M4 =3D $(top_srcdir)/aclocal.m4
> + am__aclocal_m4_deps =3D $(top_srcdir)/configure.ac
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.ser=
vice b/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
> new file mode 100644
> index 0000000..76ec73a
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DPLMCBOOT Program
> +After=3Dnetwork.target
> +ConditionPathExists=3D@SYSCONFDIR@/plmcd.conf
> +
> +[Service]
> +Type=3Doneshot
> +ExecStart=3D@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -s
> +ExecStop=3D@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -x
> +RemainAfterExit=3Dyes
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.servic=
e b/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
> new file mode 100644
> index 0000000..1d48e77
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=3DPlmcd Daemon
> +Requires=3Dplmcboot.service
> +After=3Dnetwork.target plmcboot.service
> +ConditionPathExists=3D@SYSCONFDIR@/plmcd.conf
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf
> +ExecStartPost=3D/bin/touch /var/lock/subsys/plmcd
> +ExecStopPost=3D/bin/rm -rf /var/lock/subsys/plmcd
> +PIDFile=3D/var/run/plmcd.pid
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/m=
eta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> index 5895b46..0c236f0 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> @@ -14,7 +14,11 @@ HOMEPAGE =3D "http://www.opensaf.org"
>  inherit autotools useradd systemd pkgconfig
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
> -           file://install-samples-from-srcdir.patch"
> +           file://install-samples-from-srcdir.patch \
> +           file://plmcd.service \
> +           file://plmcboot.service \
> +           file://0001-plmcd-error-fix.patch \
> +           "
> =20
>  SRC_URI[md5sum] =3D "534c0a99438a62c4c8dda56cfa67300c"
>  SRC_URI[sha256sum] =3D "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035b=
a354c97b5471b590"
> @@ -23,17 +27,32 @@ SECTION =3D "admin"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Da916467b91076e631dd8edb74=
24769c7"
> =20
> -DEPENDS =3D "libxml2 python"
> +DEPENDS =3D "libxml2 python openhpi"
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "-f -r opensaf"
>  USERADD_PARAM_${PN} =3D  "-r -g opensaf -d ${datadir}/opensaf/ -s ${sbin=
dir}/nologin -c \"OpenSAF\" opensaf"
> =20
> -SYSTEMD_SERVICE_${PN} +=3D "opensafd.service"
> +SYSTEMD_SERVICE_${PN} +=3D "opensafd.service plmcboot.service plmcd.serv=
ice"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
> +PACKAGECONFIG[systemd] =3D "--enable-systemd-daemon"
> +
> +do_configure_prepend () {
> +        ( cd ${S}; autoreconf -f -i -s )
> +}
> +
> +EXTRA_OECONF +=3D ' --with-hpi-interface=3DB03 \
> +                  --libdir=3D${libdir}/opensaf \
> +                  --enable-ais-plm '
> +EXTRA_OEMAKE +=3D " -Wl,-rpath,${libdir}/opensaf "
> +
> +PKGLIBDIR=3D"${libdir}/opensaf/opensaf"
> +
>  FILES_${PN} +=3D "${localstatedir}/run"
> =20
> +FILES_${PN}-staticdev +=3D "${PKGLIBDIR}/*.a"
> +
>  RDEPENDS_${PN} +=3D "bash python"
> =20
>  INSANE_SKIP_${PN} =3D "dev-so"
> @@ -45,4 +64,8 @@ do_install_append() {
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensaf=
d.service \
>          ${D}${systemd_unitdir}/system
> +    install -m 644 ${WORKDIR}/plmc*.service ${D}/${systemd_unitdir}/syst=
em
> +    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/sy=
stem/plmc*.service
> +    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/p=
lmc*.service
> +
>  }
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVp/1jAAoJEEn8ffcsOfaWy9gIAMABOdVv7KHPZlgOsnQ4Awrh
ZjiGbb7ZLvCLDgPJcTXHzVI8a62KhcqdCFW5/PgTHgAnSczlN5RNKB6J1toi+q7O
7CFzcJHkKFRvDak9PfJN7C+BClc6io5i9A44RK+j+ICJc1yzlUwq7N0IC8rjX4UE
Uu0zt601FoCWYRJ73zoBGIx6R1SJgkMXPSrcVQlLfwC1d4grj/czoW0bsdiIpH7L
s8hVyuGcTs2HzXyFsbOlVJgc9oGjKNhLFZ6jSZihKD1hFRvTYUjXuiSmq11Js5bC
MmSmJGpf9kRWkb34CZsqSIW0ZboerdDBpZTTyzQ93w5/QO/hTEfTcfqRCBTmrp8=
=3BiZ
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

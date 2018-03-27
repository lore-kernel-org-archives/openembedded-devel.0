Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEDFC600E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 02:59:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2R2xCiZ001598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 19:59:13 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.201]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 26 Mar 2018 19:59:11 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] haveged: update to 1.9.2
Thread-Index: AQHTwmoUxSU5u/aqs0eZJIlSCeQr6KPjaf1g
Date: Tue, 27 Mar 2018 02:59:10 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0158699EA4@ALA-MBD.corp.ad.wrs.com>
References: <20180323054110.748-1-jackie.huang@windriver.com>
In-Reply-To: <20180323054110.748-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.162]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] haveged: update to 1.9.2
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
X-List-Received-Date: Tue, 27 Mar 2018 02:59:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I found an issue when build in parallel, so please ignore this, I will fix =
the issue and re-send soon.

Thanks,
jackie

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org]
> On Behalf Of jackie.huang@windriver.com
> Sent: Friday, March 23, 2018 13:41
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] haveged: update to 1.9.2
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> * Drop the patch remove-systemd-unit-503.patch and init script
>   haveged.sysvinit, and use PACKAGECONFIG to set the correct
>   sevice file or init script for systemd or sysvinit.
>=20
> * Add SuccessExitStatus to fix the failure when the service
>   is stopped.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../haveged/haveged/haveged.sysvinit               | 35 ----------------=
------
>  .../haveged/haveged/remove-systemd-unit-503.patch  | 20 -------------
>  .../haveged/{haveged_1.9.1.bb =3D> haveged_1.9.2.bb} | 21 +++++++------
>  3 files changed, 10 insertions(+), 66 deletions(-)
>  delete mode 100755 meta-oe/recipes-extended/haveged/haveged/haveged.sysv=
init
>  delete mode 100644 meta-oe/recipes-extended/haveged/haveged/remove-syste=
md-unit-503.patch
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.1.bb =3D> haveged_1=
.9.2.bb} (61%)
>=20
> diff --git a/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit b/=
meta-oe/recipes-
> extended/haveged/haveged/haveged.sysvinit
> deleted file mode 100755
> index 98b8857e7..000000000
> --- a/meta-oe/recipes-extended/haveged/haveged/haveged.sysvinit
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -#!/bin/sh
> -
> -PATH=3D/bin:/usr/bin:/sbin:/usr/sbin
> -
> -pidfile=3D/var/run/haveged.pid
> -
> -# source function library
> -. /etc/init.d/functions
> -
> -case "$1" in
> -    start)
> -    echo -n "Starting havege entropy daemon... "
> -    start-stop-daemon --start --quiet --pidfile $pidfile --name haveged =
--startas haveged --  -w 1024 -v 0 && success || failure
> -    echo
> -    ;;
> -    stop)
> -    echo -n "Stopping havege entropy daemon... "
> -    start-stop-daemon --stop --quiet --pidfile $pidfile --name haveged
> -    success
> -    echo
> -    ;;
> -    restart)
> -    $0 stop
> -    sleep 1
> -    $0 start
> -    ;;
> -    status)
> -    status haveged
> -    ;;
> -    *)
> -    echo "Usage: /etc/init.d/haveged {start|stop|restart|status}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/meta-oe/recipes-extended/haveged/haveged/remove-systemd-unit=
-503.patch b/meta-oe/recipes-
> extended/haveged/haveged/remove-systemd-unit-503.patch
> deleted file mode 100644
> index df27bcb09..000000000
> --- a/meta-oe/recipes-extended/haveged/haveged/remove-systemd-unit-503.pa=
tch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> ---- a/init.d/Makefile.am	2014-01-02 18:55:53.000000000 +0100
> -+++ b/init.d/Makefile.am	2014-08-11 10:59:40.000000000 +0200
> -@@ -34,11 +34,11 @@
> - 	$(do_subst) < $(srcdir)/$(src_tmpl) > haveged.service;
> -
> - install-data-hook:
> --if ENABLE_SYSTEMD_LOOKUP
> --	install -p -m644 haveged.service `pkg-config --variable=3Dsystemdsyste=
munitdir systemd`/haveged.service;
> --else
> --	install -p -m644 haveged.service ($unit_dir)/haveged.service;
> --endif
> --	systemctl enable haveged.service;
> -+#if ENABLE_SYSTEMD_LOOKUP
> -+#	install -p -m644 haveged.service `pkg-config --variable=3Dsystemdsyst=
emunitdir systemd`/haveged.service;
> -+#else
> -+#	install -p -m644 haveged.service ($unit_dir)/haveged.service;
> -+#endif
> -+#	systemctl enable haveged.service;
> -
> - endif
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb b/meta-oe/=
recipes-extended/haveged/haveged_1.9.2.bb
> similarity index 61%
> rename from meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
> rename to meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
> index 419c85f51..d0e9fdaa7 100644
> --- a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
> +++ b/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
> @@ -5,23 +5,22 @@ HOMEPAGE =3D "http://www.issihosts.com/haveged/index.ht=
ml"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM=3D"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
>=20
> -SRC_URI =3D "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
> -    file://remove-systemd-unit-503.patch \
> -    file://haveged.sysvinit \
> -"
> +SRC_URI =3D "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz"
>=20
> -SRC_URI[md5sum] =3D "015ff58cd10607db0e0de60aeca2f5f8"
> -SRC_URI[sha256sum] =3D "9c2363ed9542a6784ff08e247182137e71f2ddb79e8e6c1a=
c4ad50d21ced3715"
> +SRC_URI[md5sum] =3D "fb1d8b3dcbb9d06b30eccd8aa500fd31"
> +SRC_URI[sha256sum] =3D "f77d9adbdf421b61601fa29faa9ce3b479d910f73c66b9e3=
64ba8642ccbfbe70"
>=20
>  inherit autotools update-rc.d systemd
>=20
>  EXTRA_OECONF =3D "\
> -    --enable-init=3Dservice.redhat \
>      --enable-nistest=3Dyes \
>      --enable-olt=3Dyes \
>      --enable-threads=3Dno \
>  "
>=20
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +PACKAGECONFIG[systemd] =3D "--enable-init=3Dservice.redhat --enable-init=
dir=3D${systemd_system_unitdir}, --enable-init=3Dsysv.redhat,
> systemd"
> +
>  INITSCRIPT_PACKAGES =3D "${PN}"
>  INITSCRIPT_NAME =3D "haveged"
>  INITSCRIPT_PARAMS_${PN} =3D "defaults 9"
> @@ -30,10 +29,10 @@ SYSTEMD_PACKAGES =3D "${PN}"
>  SYSTEMD_SERVICE_${PN} =3D "haveged.service"
>=20
>  do_install_append() {
> -    install -D -m 755 ${WORKDIR}/haveged.sysvinit ${D}${sysconfdir}/init=
.d/haveged
> -
> -    mkdir -p ${D}${systemd_unitdir}/system
> -    install -p -m644 ${B}/init.d/haveged.service ${D}${systemd_unitdir}/=
system
> +    # The exit status is 143 when the service is stopped
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        sed -i '/ExecStart/a SuccessExitStatus=3D143' ${D}${systemd_syst=
em_unitdir}/haveged.service
> +    fi
>  }
>=20
>  MIPS_INSTRUCTION_SET =3D "mips"
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


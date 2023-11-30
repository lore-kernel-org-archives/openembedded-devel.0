Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397B0C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 13:15:43 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.71780.1701350138149988456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 05:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.37] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3AUDFaPG026660
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 07:15:37 -0600
Message-ID: <66cce56c-7660-aeb0-c517-36a8375d2021@kernel.crashing.org>
Date: Thu, 30 Nov 2023 07:15:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [oe] [meta-multimedia][PATCH 09/10] gstd: Upgrade to 0.15.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
 <20231113-gnomebaseclass-switch-to-meson-v1-9-111dd5d0fe68@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-9-111dd5d0fe68@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 3AUDFaPG026660
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 13:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107176

After this change I'm getting a systemd error when including gstd in my i=
mage.

2023-11-30T12:51:42+0000 SUBDEBUG Installed:=20
gstd-1.0+really0.15.00+a011affa67-r0.0.cortexa72_cortexa53
2023-11-30T12:51:42+0000 INFO=20
%post(gstd-1.0+really0.15.00+a011affa67-r0.0.cortexa72_cortexa53): script=
let start
%post(gstd-1.0+really0.15.00+a011affa67-r0.0.cortexa72_cortexa53):=20
execv(/bin/sh) pid 3485514
+ set -e
+ systemctl
+ OPTS=3D
+ [ -n=20
/scratch/mhatle/git/internal/master/build-11-30/tmp/work/zynqmp_generic-x=
ilinx-linux/petalinux-image-minimal/1.0/rootfs=20
]
+=20
OPTS=3D--root=3D/scratch/mhatle/git/internal/master/build-11-30/tmp/work/=
zynqmp_generic-xilinx-linux/petalinux-image-minimal/1.0/rootfs
+ [ enable =3D enable ]
+ systemctl=20
--root=3D/scratch/mhatle/git/internal/master/build-11-30/tmp/work/zynqmp_=
generic-xilinx-linux/petalinux-image-minimal/1.0/rootfs=20
enable gstd.service
Error: Systemctl main enable issue in gstd.service (gstd.service)
%post(gstd-1.0+really0.15.00+a011affa67-r0.0.cortexa72_cortexa53):=20
waitpid(3485514) rc 3485514 status 100
warning: %post(gstd-1.0+really0.15.00+a011affa67-r0.0.cortexa72_cortexa53=
)=20
scriptlet failed, exit status 1

2023-11-30T12:51:42+0000 ERROR Error in POSTIN scriptlet in rpm package g=
std
2023-11-30T12:51:42+0000 SUBDEBUG Installed: meson-1.2.2-r0.0.cortexa72_c=
ortexa53
2023-11-30T12:51:42+0000 SUBDEBUG Installed:=20
can-utils-2023.03-r0.0.cortexa72_cortexa53
2023-11-30T12:51:42+0000 INFO %post(can-utils-2023.03-r0.0.cortexa72_cort=
exa53):=20
scriptlet start
%post(can-utils-2023.03-r0.0.cortexa72_cortexa53): execv(/bin/sh) pid 348=
5517

--Mark

On 11/13/23 9:08=E2=80=AFPM, Khem Raj wrote:
> License-Update: Switch to LGPL-2.1 [1]
>=20
> Drop rpath patch its not needed anymore with meson build system
> Switch to using meson build system
> Fix packaging for python pieces and systemd
>=20
> [1] https://github.com/RidgeRun/gstd-1.x/commit/76d9fb61a05973b30220fca=
e5ff87de9d618ea49
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../gstd/0001-gstd-yocto-compatibility.patch       | 22 -------------=
---
>   .../recipes-multimedia/gstreamer-1.0/gstd_git.bb   | 29 +++++++++++++=
+--------
>   2 files changed, 18 insertions(+), 33 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001=
-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstr=
eamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
> deleted file mode 100644
> index 64fd578a96..0000000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-y=
octo-compatibility.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
> -From: Carlos <carlos.rodriguez@ridgerun.com>
> -Date: Fri, 15 Dec 2017 10:14:05 -0600
> -Subject: [PATCH] gstd:yocto compatibility
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gstd/Makefile.am                | 2 +-
> - 3 files changed, 9 insertions(+), 3 deletions(-)
> -
> ---- a/gstd/Makefile.am
> -+++ b/gstd/Makefile.am
> -@@ -74,7 +74,7 @@ gstd_CFLAGS =3D $(GST_CFLAGS)					\
> - 	      -DGSTD_LOG_STATE_DIR=3D\"$(gstdlogstatedir)\"	\
> - 	      -DGSTD_RUN_STATE_DIR=3D\"$(gstdrunstatedir)\"
> -
> --gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GJSON_LIB=
S) $(LIBD_LIBS) -Wl,-rpath -Wl,$(libdir)
> -+gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GJSON_LIB=
S) $(LIBD_LIBS)
> - gstd_LDADD =3D libgstd-core.la
> -
> - gstdincludedir =3D $(includedir)/gstd
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.=
bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> index 38fafe82e4..88acdb190e 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> @@ -2,26 +2,27 @@ DESCRIPTION =3D "Gstreamer Daemon"
>   SUMMARY =3D "GStreamer framework for controlling audio and video stre=
aming using TCP connection messages"
>   HOMEPAGE =3D "https://developer.ridgerun.com/wiki/index.php?title=3DG=
std-1.0"
>   SECTION =3D "multimedia"
> -LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc71b653a0f608a58cdc5693ae57=
126bc"
>  =20
> -DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugi=
ns-bad gstreamer1.0-rtsp-server json-glib libdaemon jansson"
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugi=
ns-bad gstreamer1.0-rtsp-server json-glib libdaemon libsoup-2.4 jansson"
>  =20
>   SRCBRANCH ?=3D "master"
> -SRCREV =3D "a6621a5778b234651aa2adbbe304d906a3fa64d1"
> -SRC_URI =3D "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=3Dhtt=
ps;branch=3D${SRCBRANCH} \
> -           file://0001-gstd-yocto-compatibility.patch \
> -           "
> +SRCREV =3D "a011affa67f240cbc7aaff5b00fdfd6124bdaece"
> +SRC_URI =3D "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=3Dhtt=
ps;branch=3D${SRCBRANCH}"
>   S =3D "${WORKDIR}/git"
>  =20
>   # Remove the +really when upstream version is > 1.0
> -PV =3D "1.0+really0.8.0"
> +PV =3D "1.0+really0.15.0"
>  =20
> -inherit autotools pkgconfig gettext gtk-doc
> +GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
> +
> +inherit meson pkgconfig gettext gtk-doc systemd python3native python3-=
dir python3targetconfig
>  =20
>   do_install:append() {
> -        rmdir ${D}${localstatedir}/run/${BPN} ${D}${localstatedir}/run=
 \
> -              ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
> +        rmdir ${D}${root_prefix}${localstatedir}/run/${BPN} ${D}${root=
_prefix}${localstatedir}/run \
> +              ${D}${root_prefix}${localstatedir}/log/${BPN} ${D}${root=
_prefix}${localstatedir}/log \
> +              ${D}${root_prefix}${localstatedir}
>           rm -f ${D}${bindir}/gst-client ${D}${bindir}/gstd-client
>           if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',=
 'false', d)}; then
>                   install -d ${D}${sysconfdir}/tmpfiles.d
> @@ -33,3 +34,9 @@ do_install:append() {
>           ln -sf gst-client-1.0 ${D}${bindir}/gst-client
>           ln -sf gst-client-1.0 ${D}${bindir}/gstd-client
>   }
> +PACKAGES =3D+ "${PN}-python"
> +
> +FILES:${PN} +=3D "${systemd_user_unitdir}"
> +FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +
> +SYSTEMD_SERVICE:${PN} =3D "gstd.service"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106696): https://lists.openembedded.org/g/openembed=
ded-devel/message/106696
> Mute This Topic: https://lists.openembedded.org/mt/102577253/3616948
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D612601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:20:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAI9Kw1H009404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:20:58 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Wed, 18 Nov 2015 01:20:57 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH][meta-oe] devicekit-power: add missing dependency
	on	libgudev
Thread-Index: AQHRHTV9EAzxderhM06An+83VHxr2J6hhMIQ
Date: Wed, 18 Nov 2015 09:20:56 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C72D821@ALA-MBA.corp.ad.wrs.com>
References: <1447324352-27951-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1447324352-27951-1-git-send-email-Martin.Jansa@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.132]
MIME-Version: 1.0
Subject: Re: [PATCH][meta-oe] devicekit-power: add missing dependency on	libgudev
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
X-List-Received-Date: Wed, 18 Nov 2015 09:21:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, November 12, 2015 6:33 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH][meta-oe] devicekit-power: add missing dependency on=
 libgudev
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 2 +-
>  meta-oe/recipes-support/devicekit/devicekit-power_014.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-
> networking/recipes-kernel/netmap/netmap-modules_git.bb
> index c1c319d..6365fee 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -15,7 +15,7 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILD=
DIR} \
>                  --driver-suffix=3D"-netmap" \
>                  "
>=20
> -EXTRA_OECONF +=3D "--no-drivers=3Dixgbe"
> +EXTRA_OECONF +=3D "--no-drivers=3Dixgbe --no-drivers=3Dvirtio_net.c"

The netmap's configure doesn't handle this well, it ends up with only virti=
o_net.c
is disabled, ixgbe comes back to build. It needs something like:

--no-drivers=3Dixgbe, virtio_net.c

Thanks,
Jackie

>=20
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/m=
eta-oe/recipes-
> support/devicekit/devicekit-power_014.bb
> index 0c1245f..c2b7e66 100644
> --- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
> +++ b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Devicekit power"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D756cf97871f77233638937da21b02=
5d3"
>=20
> -DEPENDS =3D "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intlto=
ol-native"
> +DEPENDS =3D "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intlto=
ol-native libgudev"
>=20
>  SRC_URI =3D "http://upower.freedesktop.org/releases/DeviceKit-power-${PV=
}.tar.gz;name=3Darchive"
>  SRC_URI[archive.md5sum] =3D "935d37f1e14b3c8a1d6dabcd9a38d3ca"
> --
> 2.6.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


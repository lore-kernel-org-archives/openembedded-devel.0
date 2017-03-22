Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8935E6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 09:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 499EE1845E;
	Wed, 22 Mar 2017 10:00:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NhHE1B4JddES; Wed, 22 Mar 2017 10:00:54 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0FB1F1843F;
	Wed, 22 Mar 2017 10:00:53 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B47131A084;
	Wed, 22 Mar 2017 10:00:53 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93DB1A080;
	Wed, 22 Mar 2017 10:00:53 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 22 Mar 2017 10:00:53 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 9D3E91A33;
	Wed, 22 Mar 2017 10:00:53 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 22 Mar 2017 10:00:53 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 22 Mar 2017 10:00:53 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 22 Mar 2017 10:00:53 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2 1/2] lvm2: libdevicemapper package needs udev
	rules and dmsetup
Thread-Index: AQHSoYzKZ/+62XYo4E+kHWDAIzX7vqGgkCCA
Date: Wed, 22 Mar 2017 09:00:53 +0000
Message-ID: <f56e3caed10c45d0b0d23785506cee7c@XBOX02.axis.com>
References: <32e1d3fa5c6441cd9f67837dd324cb6b76f5cd53.1490016683.git-series.patrick.ohly@intel.com>
	<8a2dc0af5e5c51e71d154de8180e0b74388a9fa9.1490022750.git-series.patrick.ohly@intel.com>
In-Reply-To: <8a2dc0af5e5c51e71d154de8180e0b74388a9fa9.1490022750.git-series.patrick.ohly@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH v2 1/2] lvm2: libdevicemapper package needs udev rules and dmsetup
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
X-List-Received-Date: Wed, 22 Mar 2017 09:00:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Patrick Ohly [mailto:patrick.ohly@intel.com]
> Sent: den 20 mars 2017 16:14
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Kjellerstedt; Patrick Ohly
> Subject: [meta-oe][PATCH v2 1/2] lvm2: libdevicemapper package needs
> udev rules and dmsetup
>=20
> Applications like kpartx and cryptsetup were broken by moving only
> libdevicemapper itself into a separate package: as a result of that
> change, lvm2 was not getting pulled into images anymore although
> libdevicemapper depends on dmsetup and udev rules to be fully
> functional.
>=20
> For example, "kpartx -as" started to hang while waiting for the udev
> rules to trigger, which is what creates the /dev/mapper/ entries for
> the new partitions (see also
> https://github.com/docker/docker/issues/22025#issuecomment-243943728).
>=20
> Putting udev rules and dmsetup also into libdevicemapper is perhaps
> counter-intuitive, but necessary to keep the package functioning. A
> full lvm2 installation is guaranteed to pull them in, too, both
> because of implicit library dependencies and (just to be sure) an
> explicit RDEPENDS.
>=20
> lvm2-native doesn't have packages, so this RDEPENDS must be limited to
> the target case.
>=20
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-
> support/lvm2/lvm2.inc
> index 3e79552..cfa74d4 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -83,14 +83,17 @@ SYSTEMD_AUTO_ENABLE =3D "disable"
>=20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>=20
> -FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${nonarch_base_libdir}/ud=
ev"
> +FILES_${PN} +=3D "${libdir}/device-mapper/*.so"
>  FILES_${PN}-scripts =3D " \
>      ${sbindir}/blkdeactivate \
>      ${sbindir}/fsadm \
>      ${sbindir}/lvmconf \
>      ${sbindir}/lvmdump \
>  "
> -FILES_libdevmapper =3D "${libdir}/libdevmapper.so.*"
> +# Specified explicitly for the udev rules, just in case that it does not=
 get picked
> +# up automatically:
> +RDEPENDS_${PN}_append_class-target =3D " libdevmapper"
> +FILES_libdevmapper =3D "${sbindir}/dmsetup ${libdir}/libdevmapper.so.* $=
{nonarch_base_libdir}/udev/rules.d"
>  FILES_libdevmapper-dev =3D " \
>      ${libdir}/libdevmapper.so \
>      ${libdir}/pkgconfig/devmapper.pc \
>=20
> base-commit: 6c584374a599f6f8d3607f20ecfc13a67ccf1da1
> --
> git-series 0.9.1

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

//Peter



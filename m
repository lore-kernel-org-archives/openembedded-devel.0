Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 527E4780A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 07:24:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7S7O9IC006666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 00:24:09 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 28 Aug 2017 00:24:08 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] multipath-tools: add rdepends on bash
Thread-Index: AQHTH8mrjKxMIK5nMUuHUwZEQuNppKKZXULQ
Date: Mon, 28 Aug 2017 07:24:08 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B8887E7@ALA-MBC.corp.ad.wrs.com>
References: <20170828064724.17260-1-jackie.huang@windriver.com>
In-Reply-To: <20170828064724.17260-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.93]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] multipath-tools: add rdepends on bash
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
X-List-Received-Date: Mon, 28 Aug 2017 07:24:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry I didn't notice a previous patch was sent to fix the same issue, so p=
lease ignore this.

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Monday, August 28, 2017 14:47
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] multipath-tools: add rdepends on bash
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> * Add rdepends on bash to fix QA Issue:
> | ERROR: multipath-tools-0.7.1-r0 do_package_qa: QA Issue: /sbin/mpathcon=
f
>   contained in package multipath-tools requires /bin/bash, but no
>   providers found in RDEPENDS_multipath-tools? [file-rdeps]
>=20
> * Combine multiple assignments for PACKAGES and RDPENDS into one,
>   re-order and re-group for related variables.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../multipath-tools/multipath-tools_0.7.1.bb       | 23 ++++++++++------=
------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.=
1.bb
> b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
> index 610ba7a94..ccd08575e 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
> @@ -92,22 +92,19 @@ do_install() {
>      ${D}${sysconfdir}/multipath.conf.example
>  }
>=20
> -FILES_${PN}-dbg +=3D "${base_libdir}/multipath/.debug"
> -
> -PACKAGES =3D+ "${PN}-libs"
> -FILES_${PN}-libs =3D "${base_libdir}/lib*.so.* \
> -                    ${base_libdir}/multipath/lib*.so*"
> -RDEPENDS_${PN} +=3D "${PN}-libs"
> -
> -PROVIDES +=3D "device-mapper-multipath"
> -RPROVIDES_${PN} +=3D "device-mapper-multipath"
> -RPROVIDES_${PN}-libs +=3D "device-mapper-multipath-libs"
> +PACKAGES =3D+ "${PN}-libs kpartx"
>=20
>  FILES_${PN}-dev +=3D "${base_libdir}/pkgconfig"
> -
> -PACKAGES =3D+ "kpartx"
> +FILES_${PN}-dbg +=3D "${base_libdir}/multipath/.debug"
> +FILES_${PN}-libs =3D "${base_libdir}/lib*.so.* \
> +                    ${base_libdir}/multipath/lib*.so* \
> +                   "
>  FILES_kpartx =3D "${base_sbindir}/kpartx \
>                  ${nonarch_libdir}/udev/kpartx_id \
>                 "
>=20
> -RDEPENDS_${PN} +=3D "kpartx"
> +RDEPENDS_${PN} +=3D "${PN}-libs kpartx bash"
> +
> +PROVIDES +=3D "device-mapper-multipath"
> +RPROVIDES_${PN} +=3D "device-mapper-multipath"
> +RPROVIDES_${PN}-libs +=3D "device-mapper-multipath-libs"
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


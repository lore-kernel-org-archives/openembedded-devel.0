Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC897C195
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 06:06:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G66nAU013269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:06:49 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.249]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0415.000;
	Tue, 15 Jan 2019 22:06:48 -0800
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH V3] pmdk: fix install error
Thread-Index: AQHUrJAiofeELfMgM0+LI3qhhtNujqWxaQrQ
Date: Wed, 16 Jan 2019 06:06:48 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D129F06C3@ALA-MBD.corp.ad.wrs.com>
References: <20190115050233.38899-1-yongxin.liu@windriver.com>
In-Reply-To: <20190115050233.38899-1-yongxin.liu@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH V3] pmdk: fix install error
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
X-List-Received-Date: Wed, 16 Jan 2019 06:06:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.=20
It doesn't locate the root cause for pmdk installation.

pmdk libraries can be installed in lib or lib64, depending on different hos=
t build system.=20


Thanks,
Yongxin


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Yongxin Liu
> Sent: Tuesday, January 15, 2019 13:03
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH V3] pmdk: fix install error
>=20
> Install files to /usr instead of /usr/local.
> Install bash_completion file to /etc/.
> Remove unnecessary files which are only for debugging.
> Set FILES to package /etc/bash_completion.d/pmempool.
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-
> oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> index 3da22a970..cbd9174c0 100644
> --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> @@ -35,24 +35,10 @@ EXTRA_OEMAKE =3D "HOST_SYS=3D'${HOST_SYS}'
> EXTRA_CFLAGS=3D'${SELECTED_OPTIMIZATION}'"
>  EXTRA_OEMAKE_append_libc-musl =3D " EXTRA_LIBS=3D'-lfts'"
>=20
>  do_install() {
> -	oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> -
> -	# Copy these into the standard directories
> -	install -d ${D}${bindir}/
> -	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> -	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> -
> -	install -d ${D}${libdir}
> -	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> -
> -	install -d ${D}${libdir}/pkgconfig
> -	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> -
> -	install -d ${D}${includedir}
> -	mv ${D}/usr/local/include/* ${D}${includedir}/
> +	oe_runmake prefix=3D${prefix} DESTDIR=3D${D} sysconfdir=3D/etc install
>=20
>  	# Remove uneeded files
> -	rm -rf ${D}/usr/local/
> +	rm -rf ${D}/usr/lib64/pmdk_debug
>  }
>=20
>  # Include these by default otherwise the SDK is not very useful
> @@ -60,5 +46,6 @@ FILES_${PN} +=3D "${bindir}/pmempool ${bindir}/daxio"
>  FILES_${PN} +=3D "${libdir}/*so*"
>  FILES_${PN} +=3D "${libdir}/pkgconfig/*.pc"
>  FILES_${PN} +=3D "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/=
*"
> +FILES_${PN} +=3D "${sysconfdir}"
>=20
>  COMPATIBLE_HOST=3D'(x86_64).*'
> --
> 2.14.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


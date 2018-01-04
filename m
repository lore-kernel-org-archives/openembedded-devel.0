Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 1099 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Jan 2018 23:01:45 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0044.outbound.protection.outlook.com [104.47.33.44])
	by mail.openembedded.org (Postfix) with ESMTP id E3B357017B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 23:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lXPii17isplheqxmcJxCnsou9Gr/vtL0FXkl/PkvleU=;
	b=LwcrW/RDeiipFOl12S6n5nA9XsajGVC6uBjtIO8OaP3NuVzowj60PVhiqLS1smVZppYnEnVJwH2lqKwaOg/66gKPYDWWFVW0vxFb60FXrnMXAlN/r35JYo8a9n31GB1VDTx3ZlE/zFxjRH1t8jr5PuUdcMCKXCfzAztITiqbARs=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.366.8; Thu, 4 Jan 2018 22:28:24 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0366.009; Thu, 4 Jan 2018 22:28:24 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Armin Kuster <akuster808@gmail.com>, "akuster@mvista.com"
	<akuster@mvista.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-initramfs][PATCH] kexec-tools-klibc: update to fix
	build	issues after core changes.
Thread-Index: AQHThYH2WjGGG5hL4EStoPcbFeKhYKNkSyWg
Date: Thu, 4 Jan 2018 22:28:23 +0000
Message-ID: <BY2PR02MB347D87A57F9309E4A17F533B91F0@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1515087122-23570-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1515087122-23570-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB347;
	7:U1fKte4a3TAOcFIAxksBRB3Cb6jxxMCTeIgJJ//AiEp17pWj8aqkNaGDddqsVq3iw5KMU4WM89rS1e6f4DtRrgNVWJqTUvbEqkYQ+afYiNwECacWKBSspN8mzvDYyVrRJoseBJ3iS9qpA3CaqQsvMUtUyJ7gf78qAq+x/kAVauVX8WOrZpwNEjzUz/UBCLl2hXVccKuJHT9cbDluZiymZFYXYkX9QlUiSsamrNfx1KiG+MGMxOdBFIlazD+re6gp
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c16f0dd0-c796-404e-daeb-08d553c277c6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060);
	SRVR:BY2PR02MB347; 
x-ms-traffictypediagnostic: BY2PR02MB347:
x-microsoft-antispam-prvs: <BY2PR02MB3474FE6A7F757B3A86C1B5FB91F0@BY2PR02MB347.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231023)(944501075)(6055026)(6041268)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB347; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB347; 
x-forefront-prvs: 054231DC40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(366004)(39860400002)(396003)(199004)(189003)(13464003)(72206003)(2950100002)(91966014)(229853002)(2900100001)(33656002)(55016002)(15650500001)(6306002)(1720100001)(7110500001)(10710500007)(966005)(25786009)(230783001)(316002)(8936002)(39060400002)(2420400007)(6116002)(3846002)(9686003)(53936002)(53376002)(68736007)(6246003)(5660300001)(110136005)(478600001)(3280700002)(575784001)(2906002)(3660700001)(86362001)(105586002)(66066001)(81166006)(14454004)(74316002)(77096006)(102836004)(2201001)(59450400001)(106356001)(2501003)(6436002)(7736002)(305945005)(53546011)(81156014)(97736004)(76176011)(7696005)(99286004)(6506007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB347;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Bpws5oTlbnBYn8rlNKhdhA/vMfKrpA4Dxm8zTdL6J4GgXxh2nqUpfvWqAW7kTc+ng7ZW+UQnN3fB/QWvK6QotQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16f0dd0-c796-404e-daeb-08d553c277c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2018 22:28:23.8887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB347
Subject: Re: [meta-initramfs][PATCH] kexec-tools-klibc: update to fix build	issues after core changes.
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
X-List-Received-Date: Thu, 04 Jan 2018 23:01:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Armin Kuster
> Sent: Thursday, January 04, 2018 9:32 AM
> To: akuster@mvista.com; openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-initramfs][PATCH] kexec-tools-klibc: update to fix bu=
ild issues
> after core changes.
>=20
> Parsing recipes...ERROR: ParseError at ../meta-initramfs/recipes-
> kernel/kexec/kexec-tools-klibc_2.0.2.bb:2: Could not include required fil=
e recipes-
> kernel/kexec/kexec-tools.inc
>=20
> This was introduced by:
> http://cgit.openembedded.org/openembedded-
> core/commit/?id=3D491f6d523b72b91dc7b186a6f273756435804581
>=20
> removed the kexec-tools.inc so place those changes into the recipe.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

Tested-by: Jaewon Lee <jaewon.lee@xilinx.com>
Acked-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

Thanks,
Manju


> ---
>  .../kexec/kexec-tools-klibc_2.0.2.bb               | 33 ++++++++++++++++=
+++---
>  1 file changed, 29 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.=
bb b/meta-
> initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> index 49c53a3..1c37531 100644
> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> @@ -1,10 +1,16 @@
>  # the binaries are statically linked against klibc -require recipes-kern=
el/kexec/kexec-
> tools.inc
>  SUMMARY =3D "Kexec tools, statically compiled against klibc"
> -SRC_URI[md5sum] =3D "92eff93b097475b7767f8c98df84408a"
> -SRC_URI[sha256sum] =3D
> "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
> +AUTHOR =3D "Eric Biederman"
> +HOMEPAGE =3D "http://kernel.org/pub/linux/utils/kernel/kexec/"
> +SECTION =3D "kernel/userland"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dea5bed2f60d357618ca161ad539f7c0a \
> +
> file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=3Daf10f6ae4a8715965e6=
48aa687a
> d3e09"
> +DEPENDS =3D "zlib xz"
>=20
> -inherit klibc
> +PR =3D "r1"
> +
> +inherit klibc autotools
>=20
>  FILESPATH =3D. "${FILE_DIRNAME}/kexec-tools-${PV}:"
>=20
> @@ -35,7 +41,26 @@ EXTRA_OECONF +=3D "--without-zlib --without-lzma --
> without-xen"
>  CFLAGS +=3D "-I${STAGING_DIR_HOST}${libdir}/klibc/include -
> I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
>  CFLAGS_x86-64 +=3D "-I${STAGING_DIR_HOST}${libdir}/klibc/include -
> I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
>=20
> +do_compile_prepend() {
> +    # Remove the prepackaged config.h from the source tree as it overrid=
es
> +    # the same file generated by configure and placed in the build tree
> +    rm -f ${S}/include/config.h
> +
> +    # Remove the '*.d' file to make sure the recompile is OK
> +    for dep in `find ${B} -type f -name '*.d'`; do
> +        dep_no_d=3D"`echo $dep | sed 's#.d$##'`"
> +        # Remove file.d when there is a file.o
> +        if [ -f "$dep_no_d.o" ]; then
> +            rm -f $dep
> +        fi
> +    done
> +}
> +
>  PACKAGES =3D+ "kexec-klibc kdump-klibc"
>=20
>  FILES_kexec-klibc =3D "${sbindir}/kexec"
>  FILES_kdump-klibc =3D "${sbindir}/kdump"
> +
> +INSANE_SKIP_${PN} =3D "arch"
> +
> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-
> (linux|freebsd.*)'
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


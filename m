Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.144])
	by mail.openembedded.org (Postfix) with ESMTP id E410460173
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 04:28:25 +0000 (UTC)
Received: from DM2PR03MB399.namprd03.prod.outlook.com (10.141.84.148) by
	DM2PR03MB400.namprd03.prod.outlook.com (10.141.84.153) with Microsoft
	SMTP Server (TLS) id 15.0.939.12; Tue, 13 May 2014 04:28:24 +0000
Received: from DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) by
	DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) with mapi id
	15.00.0939.000; Tue, 13 May 2014 04:28:25 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java][PAYCH] openjdk-6: Fix cross compilation for e6500
	machines
Thread-Index: AQHPafmMrhxbPUEckEa7333+pmVz3ps981mQ
Date: Tue, 13 May 2014 04:28:24 +0000
Message-ID: <e558a2e86c1f41969cb2c39dbcc412f2@DM2PR03MB399.namprd03.prod.outlook.com>
References: <1399469981-23875-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1399469981-23875-1-git-send-email-zhenhua.luo@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-forefront-prvs: 0210479ED8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(13464003)(377454003)(189002)(199002)(51704005)(85852003)(77096999)(79102001)(20776003)(54356999)(101416001)(76576001)(575784001)(86362001)(76176999)(80022001)(2656002)(87936001)(50986999)(31966008)(74316001)(66066001)(81542001)(83072002)(46102001)(92566001)(21056001)(74502001)(77982001)(64706001)(76482001)(4396001)(33646001)(99286001)(19580395003)(74662001)(83322001)(81342001)(19580405001)(99396002)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB400;
	H:DM2PR03MB399.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@freescale.com; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-java][PAYCH] openjdk-6: Fix cross compilation for e6500 machines
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
X-List-Received-Date: Tue, 13 May 2014 04:28:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.=20

> -----Original Message-----
> From: Zhenhua Luo [mailto:zhenhua.luo@freescale.com]
> Sent: Wednesday, May 07, 2014 9:40 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: henning@itconsulting-heinold.de; Luo Zhenhua-B19537
> Subject: [meta-java][PAYCH] openjdk-6: Fix cross compilation for e6500
> machines
>=20
>     This is only way for compile for now since qemu can not
>     run the sizers binary for e6500 machines. It segfaults
>     so we disable generating sizes and also xawt and jawt
>     which depends on sizers, this lets jre to cross compile
>     for ppc/e6500
>=20
> The fix is ported according to da0b3a20a67496dc8d4282d19a60672001b7f825
>=20
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  recipes-core/openjdk/openjdk-6-release-6b24.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/recipes-core/openjdk/openjdk-6-release-6b24.inc b/recipes-
> core/openjdk/openjdk-6-release-6b24.inc
> index d0da379..da5299f 100644
> --- a/recipes-core/openjdk/openjdk-6-release-6b24.inc
> +++ b/recipes-core/openjdk/openjdk-6-release-6b24.inc
> @@ -90,6 +90,13 @@ ICEDTEAPATCHES_append_e5500-64b =3D " \
>  ICEDTEAPATCHES_append_e5500 =3D " \
>          file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
>  	"
> +ICEDTEAPATCHES_append_e6500-64b =3D " \
> +        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
> +        "
> +ICEDTEAPATCHES_append_e6500 =3D " \
> +        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
> +        "
> +
>  ICEDTEAPATCHES_append_libc-uclibc =3D " \
>          file://icedtea-hotspot-isfinte.patch;apply=3Dno \
>          file://icedtea-hotspot-glibc-version.patch;apply=3Dno \ @@ -132,=
4
> +139,11 @@ DISTRIBUTION_PATCHES_append_e5500-64b =3D " \
>  DISTRIBUTION_PATCHES_append_e5500 =3D " \
>         patches/icedtea-jdk-sizers-crosscompile-hack.patch \
>         "
> +DISTRIBUTION_PATCHES_append_e6500-64b =3D " \
> +       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
> +       "
> +
> +DISTRIBUTION_PATCHES_append_e6500 =3D " \
> +       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
> +       "
>  export DISTRIBUTION_PATCHES
> --
> 1.9.1



Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED3BCCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:13:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.66])
 by mx.groups.io with SMTP id smtpd.web11.26.1760627615548031761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 08:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=gtZKHs++;
 spf=pass (domain: axis.com, ip: 52.101.83.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0ZMgrL900KJhepjXHajCGKwjd89PkwM7p+S9pa8PWARKPVBjFv3Vkuv7atuRLZlg/rsnehP4VidW8G3jk9wlphBwsQ5G+aHLEzSDHmJ3e/5JDHn4tsWWjzFjzNvpLprYvdWWrstkKwsfpJ4kFq0HFxV/CJrj8PUxK4qb5EGwm972FbZaMZiX1Ytm2A2D/Dlz4BwMOsAJqxjzqf1b38TnV/P1qvgddx5mSAR0ItOekOkz/rhmQkFy5hrn5RSpzihPbUFFrgZnfE7olOf1KQFZs1g5QBR6Cs8ig6XPyfPEXiJc6lk7/OFPORfSpwotEoheyhlap/G9MmzCSBcFVmuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFpz3z6a/kyLPRBH01VCCjH6iSsMNCONpkpLueZWAL0=;
 b=KKxXP9UnHKzdCHGFwqFLA2PcLr9A6G/ZJydWqV0RVc3/mOFjvAKolzVFkJUZrcyPLINlOYIp6c1xoLyuQuqarrdaB1QXgtfSZOtAewbpSz919Z6ovwY0XPkOv7I9OkM3p1x7xH0aZk1DT20/DqHek9qkjVBXVZV2ajIK8arV4iWEzD9Y4mzMybcS6+U/lxW7VUIZL5n8sdX1XkIsm0ywdCh0BYZeoVbBNxL6oD4ANrD380dW9zmeUOXj62w0j/lqrxpLM9ouFfg+QmGrWrM+Ns3NEd6C4MNYUTlsQiJLDdpoConcqgOLXUd6za41QtUpwaFhI7mgVdHnXH2FaHuQRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFpz3z6a/kyLPRBH01VCCjH6iSsMNCONpkpLueZWAL0=;
 b=gtZKHs++4epXXl6u+M9++kAYMNwVswpXYNkVK5YgP5CWF6ydPEyvrQnZOQcpFD36gnSNjvNcP4GT6WtXQUvhQSqVQSkwb70tbD6adMNea7EOQJIW/l5S7rs1O5z6aBqpQ5heG/6uxxEExsH0Irg94WUswSukpaDc+ni420GAgvE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU5PR02MB10486.eurprd02.prod.outlook.com (2603:10a6:10:51e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 15:13:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 15:13:32 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "corentin.guillevic@smile.fr" <corentin.guillevic@smile.fr>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] opencv: limit features in native
Thread-Topic: [oe] [meta-oe][PATCH] opencv: limit features in native
Thread-Index: AQHcPqiZI57oeKItzEihL9+szH1wl7TE3jsQ
Date: Thu, 16 Oct 2025 15:13:32 +0000
Message-ID: 
 <DB5PR02MB1021392557984F69ADD3276C8EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251016142349.1055072-1-corentin.guillevic@smile.fr>
In-Reply-To: <20251016142349.1055072-1-corentin.guillevic@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU5PR02MB10486:EE_
x-ms-office365-filtering-correlation-id: c3c5483d-a5fd-4942-1a37-08de0cc691d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WzeDPU3EnlKCpiyhWGkC7tRd4Rwk9isiUnIVkU0hrqVoTa+5w0zoCXftA23m?=
 =?us-ascii?Q?qGYwIfk5dao+Atb3aHQ6AgHv5H33IjuxCV52qHs7cyFsIrcKTtiBzu8ReTzQ?=
 =?us-ascii?Q?FoVDoQU5oReb0g7AQkBJfov25OVO6ZlLkCboaXCUuHdWvbqPUAH7Bu2w938J?=
 =?us-ascii?Q?dDDIBzgljRxVDf49Jxycv5NxRZFZkj8DsOYv/yshxuXG06zPV8si3nL5Kz0D?=
 =?us-ascii?Q?lgbk0rzZK2DBFvttwiBAKOZowdvPjFSa+5gPhDZtG8RWFVlt+msUrYiGDlhb?=
 =?us-ascii?Q?BbCVHQ14rTkvfivjJwebkJ+ZMG/ePpYJAchOSbnDm+v3n4AIedUejGsHXVTh?=
 =?us-ascii?Q?oIrqCp5QJYfD3hIJ+TOItIG0DI1Cu2n+H7w/dxe69ROqVlQ6gGhsluufN0Gx?=
 =?us-ascii?Q?sazuCQIlM+8eYGqLyuj8214+RoxF3LqbdXzjx6mDrmmb5SNYk1TCcPQbKj0U?=
 =?us-ascii?Q?sB5l/IN+wOfwPmGTTiLp0Dhp2z9KaJ3QtI2llXmp2nQwBwyPqHAXWOLQtUCU?=
 =?us-ascii?Q?vFvxBexKTPycsPhi4YuHNTbid36nmViHpS1DqGvIbUwtK7u5QOZx7uHKjVFJ?=
 =?us-ascii?Q?1sKcB4IJcs+GaqN9fc17ZHsMfDz8owA9LU3ObCJgfhXfLVFH19BNzWG1MQ50?=
 =?us-ascii?Q?S7Y5+YrMkjljlyJrQWEsgXCtoT9SBVp962g2pscKO5ycmx8z+Ta4jkFbo+Es?=
 =?us-ascii?Q?dWgELJ3V/Sc+SPDeU89hrphWwxht3AZrKY/kXKpo5Qn+vX5+1SyTcp4EIwnr?=
 =?us-ascii?Q?6VssiA0ZDvQP3yw/3UQp69xiBtDLx8uZ2Z1XUN0shJuw4YN0E3+5DPi9Glwt?=
 =?us-ascii?Q?//E7cDRJg94imKfS85nQCRM5iuP24KGt9nG0pglQdloQhTYToyKYEH7PDw3G?=
 =?us-ascii?Q?7GPi9fJp0L0zS/5MejIE5BIRo7DyBDWqPnwzof6KmDExMSYOkV1h/Corn7a+?=
 =?us-ascii?Q?ULzo/c8vb/tBly2ud/0iF8QA5KFQb5DgFyr93s0pliznKB+bX8ZDSCySDEgR?=
 =?us-ascii?Q?HO9jPzrwd3VM0oXCwzou33SwvOIWLnDCRotSO9rqSOuTNe97WqtNm1tIsMm0?=
 =?us-ascii?Q?/DExnp3yrc+LOrRIq24bsOUrF/N4ybvu4c91sKsO2ZXpyYPNvjvCQCDw9g0N?=
 =?us-ascii?Q?ts6FWPULQkfr/4iXa2x5OItH829gG/dFDMm/B575jpq+sOMyeNWNP/FmGt2/?=
 =?us-ascii?Q?M+VDo6zA5jRYqgkpTA8bAe8jcHbCUJUByki0Ee2vKeFtnOlYYam14/Z/DDru?=
 =?us-ascii?Q?4+dKcH/9Kh06YbHiJ+bEfPZPEvJcQzJ449ekFsEtwVNRkYVZA2Z4oe1jnQQ7?=
 =?us-ascii?Q?DZjnAMG3x90A0swXzkf4vTCF5ySiJ1vsYUuIsQUPRC5Cf07RV6p/VI47HOjP?=
 =?us-ascii?Q?jHvKCT4tXwS8eVkTflyCnJHHDkdnnpH81RnnDEUkJoEA+AVTlPg2yBsltTCc?=
 =?us-ascii?Q?8O62sOByuJXf7kjsz1CdQfCWTS8Df21knXW8ZKUl6xSoJrHDYXTREQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KwK1cq59imr4aTxedKlX2joRQywGUrKSqoTTNJPsOehVT6w+4HMoABe4Yf86?=
 =?us-ascii?Q?/y1ci9SGNfCfzPMcazUSsl86VI2UFF2rXFMdv5CRDrO3Nmju2ZO0JWL0/E0o?=
 =?us-ascii?Q?R1g9DpXJRy5MjOK07K8zzHzwPvQG55ahGX7Tu1k/A18f1LpycfqwHSRyR6Yf?=
 =?us-ascii?Q?LwoYq/j5d+fOnNu02qOkGvcKN/1eFLwd06zi8VERRFzRiU93WHzLJFeqbfeH?=
 =?us-ascii?Q?FHOFGzod2OOT2fUTwN8Spz9yNwQt8uMO7Um6vUE+qP4cKHoYJ+CBLdTh9Tyv?=
 =?us-ascii?Q?OivNpKvTFnzzz4jwl0Kyp0b5rh3DehgPEfE2YalPC/dbaYfDmkh/qJF1TciZ?=
 =?us-ascii?Q?r3aqljH/TLqDzLMInpZxQ1f1em6u+HpHMW9e4ZdvWvcIxbgF+5pi0H9G/1UV?=
 =?us-ascii?Q?7mc1sdOuxaWh1dJJBBQHTCk29ytGbmF5O17060hbtDxJ78EWJS0p+/NZ3d1K?=
 =?us-ascii?Q?K6fCRy61xnWnvgPFtx965toP+CzhWV41au23LE0FGC0+cBB44tVSMhRM2+65?=
 =?us-ascii?Q?0PhfeSQi2sb4X6st9QqutM58lzItHUALvCXQP1V3rSTuWWz14a5526mGMrqd?=
 =?us-ascii?Q?MWIDMNbjJtksOR7LdJW76YoP4LULgSVCWP15Ge77q8ycCkYxlzfOog0APXFl?=
 =?us-ascii?Q?3BGqP4IDTHl08vE4JP3r8o8j+7bRxiGCQDU/AeWgDzz0cp2Il1lsYf9Z16if?=
 =?us-ascii?Q?Bj/48KgaGtg0LnpUGUJutOXb4BhUQX+6FZyogAsh0T4zCv/xaK2DusV3ujeH?=
 =?us-ascii?Q?Aymr53hUnM2i83+Vla+F+OlF8RSdOpOr7VfjEdlZR+ehqv857rB5rzdl6d+1?=
 =?us-ascii?Q?iG+WfUMHe5sd/j1kckZeNmETaLAk5leuqE1FNUq4mOL6GdBHumIW8ZO0eU21?=
 =?us-ascii?Q?sxzjq7q5mKhtb9nj/qjruBHSZxc7J+3Q9n6olLxjiUb0dVTyreMjiTghF79s?=
 =?us-ascii?Q?NYyGMExWwEwycWxKAk+X6g5qXYm/nYLM8ceTSnKcxtdOOPZRHp+shd3Iqoj4?=
 =?us-ascii?Q?KSA+Ewe6iOo+1C3EyGK18QW0u+ecofjYfslGeID9uAgaz/pvzcUPKxJUMnSm?=
 =?us-ascii?Q?PlzmGdZUMJzKrRyad9/A/dshtr4zHnru3xUwomjW0OecaIeFj0gJ67inCPgI?=
 =?us-ascii?Q?J/E20x6ZXaxYz1ljzFeANG3NjkAyeb0f5rlfao+HVeS+boGisGcot6tP4gl/?=
 =?us-ascii?Q?js990yeDaP1qR2dFuFXvihtBmgyF4jks938MAmawL8IE+4bKPW9G4B5eXvB7?=
 =?us-ascii?Q?jHHcDYhzhL9cHQIZFWxBoEdyx5dWQyMnsWW2uBSjPOhT6S5Q9P+fGvofYk9Z?=
 =?us-ascii?Q?NlNISGKTjMDDgj0M6TIO8mhN5/niHC+zsTPojNvAzz/aXmXMGfIGti4ucrs4?=
 =?us-ascii?Q?7zkfpw35HEjwNRdtEedqDIzdCQ0cChQKmmACxu2j9KRZSE6aPwZyXRnrTgno?=
 =?us-ascii?Q?tVz3/7IGMqxGq0PY8tuxBB/Uo0mcs0tjk8RE3j/HTaGwHAqxaPjOME0+XBzH?=
 =?us-ascii?Q?5vxsBJmW7wSU7QrD7wCawBh3E5rXv7kxkgUEnGt3FG0kGu3wYSf4NXyqkQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c5483d-a5fd-4942-1a37-08de0cc691d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 15:13:32.3034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ls1hgxJoMK5YTKZ48X6wH+fKchIOV6FAI+Ecx8WjWK8sT4Z5Fx9H7EZ6cTHBZvpf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10486
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 15:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120740

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Corentin Guillevic via lists.openembedded.o=
rg
> Sent: den 16 oktober 2025 16:24
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Corentin Guillevic =
<corentin.guillevic@smile.fr>
> Subject: [oe] [meta-oe][PATCH] opencv: limit features in native
>=20
> Since commit 91e428d4cd5a ("opencv: Support building for native"),
> opencv can be built on a native target. However, not all of their
> PACKAGECONFIG dependencies (ade, libgphoto2, ffmpeg, gstreamer1.0 and
> gstreamer1.0-plugins-base) can be built in this context due to the
> missing native BBCLASSEXTEND.

Sorry about that. We turn off many of opencv's features in our=20
configuration, which is why I missed this.

>=20
> These recipes would need to be extended for native build, but specific
> work is required to ensure they work properly. To make opencv-native work
> for now, remove the above features by splitting PACKAGECONFIG in 3:
> common, native and target.
>=20
> Effectively, PACKAGECONFIG for native is target minus gapi, gstreamer,
> gphoto2 and libav.
>=20
> Fixes this warning from AB[0]:
> WARNING: Nothing PROVIDES 'gstreamer1.0-plugins-base-native' (but virtual=
:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.=
0.bb DEPENDS on or otherwise requires it). Close matches:
> WARNING: Nothing PROVIDES 'ffmpeg-native' (but virtual:native:[...]/meta-=
openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or =
otherwise requires it). Close matches:
> WARNING: Nothing PROVIDES 'libgphoto2-native' (but virtual:native:[...]/m=
eta-openembedded/meta-oe/recipes- support/opencv/opencv_4.12.0.bb DEPENDS o=
n or otherwise requires it). Close matches:
> WARNING: Nothing PROVIDES 'gstreamer1.0-native' (but virtual:native:[...]=
/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS =
on or otherwise requires it). Close matches:
> WARNING: Nothing PROVIDES 'ade-native' (but virtual:native:[...]/meta-ope=
nembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or oth=
erwise requires it). Close matches:
> WARNING: Nothing RPROVIDES 'opencv-dev-native' (but virtual:native:[...]/=
meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS =
on or otherwise requires it)
> WARNING: Nothing RPROVIDES 'opencv-native' (but virtual:native:[...]/meta=
-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on o=
r otherwise requires it)
> [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/4=
69/steps/13/logs/warnings
>=20
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---
>  meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.12.0.bb
> index 27499caa92..54b19edcff 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> @@ -86,9 +86,12 @@ LDFLAGS:append:riscv32 =3D " -Wl,--no-as-needed -latom=
ic -Wl,--as-needed"
>=20
>  EXTRA_OECMAKE:append:x86 =3D " -DX86=3DON"
>=20
> -PACKAGECONFIG ??=3D "gapi python3 eigen jpeg png tiff v4l libv4l gstream=
er samples tbb gphoto2 \
> -    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',=
 'gtk', '', d)} \
> +PACKAGECONFIG_COMMON =3D "python3 eigen jpeg png tiff v4l libv4l samples=
 tbb \
> +    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',=
 'gtk', '', d)}"
> +
> +PACKAGECONFIG:class-target ??=3D "${PACKAGECONFIG_COMMON} gapi gstreamer=
 gphoto2 \
>      ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpe=
g commercial", "libav", "", d)}"
> +PACKAGECONFIG:class-native ??=3D "${PACKAGECONFIG_COMMON}"

Which is more commonly written as:

PACKAGECONFIG ??=3D "python3 eigen jpeg png tiff v4l libv4l samples tbb \
    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'g=
tk', '', d)}"
PACKAGECONFIG:append:class-target =3D " gapi gstreamer gphoto2 \
     ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg =
commercial", "libav", "", d)}"

>=20
>  # TBB does not build for powerpc so disable that package config
>  PACKAGECONFIG:remove:powerpc =3D "tbb"
> --
> 2.49.0

//Peter



Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2243ECCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:36:10 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.web10.13087.1760700962860271408
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=h5P9FYwR;
 spf=pass (domain: axis.com, ip: 52.101.72.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nax55mAUPU8ZYuXFw2cIXyUNE1YEv4zeTb24grwqwqbErmOYYzHmuAlgzhd080Y0mBO8sJP/oTv+lQ/Um27WHj1JwWVOUGM70bP7c+wtuJoCUJZCirfd/XA+cVFtlcX4Y47X6f8fyaAk8AoZOz/fXioovq5IgP/JYmna3gnCXelOiDfip1GCia27HGmcZimzHKv6f1AEhQ01y/XQZVpwAL0HBFhHvMyhC+Q1YHxedf0ieJUfGyIcn8vwp84FlRCH5K82lN/5Dw8Pd0U57MFs8SZshK0wn76fr5G6S45+uKY1lCPJCA2vhwqWK725AGqXOu35vdSMm2GsUwfb9lMECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hA/jrFg2JJi4cbC+QnIPzpYuOpYbYMLEA17JaRCA/0=;
 b=iy52SNNp75uvkjEYqm8Q961GV56IV5QOpG8kCRC3JhFlONNkFjtu5Y8Ic/9M6p4wXS2cJ1GWHyy4qnBccAT+KMEv/Am4EOQGrPDVNRzSnmJ0SMCJhpeOygBBB4HqNzAjPcV7QQds/oIMxmeVj7VmV90FmrW7bQ/nyeqxHh928rl7SjstvJwdLOTejZBf9Q/7OtpWp+QIUtLEVrKcdgvmlt87Rq89FCTan8t98jQxxn7Fb9aCNHsu/ntKbVGp057yy3dgwcaqc8yL9JtMZ8zblhH0cYJYmZI38iUERiXIhoDjFNNjG4M+GW3oqdkFDeaql9lk3udwngOeRxSq58uwaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hA/jrFg2JJi4cbC+QnIPzpYuOpYbYMLEA17JaRCA/0=;
 b=h5P9FYwR6e2a3sXg3Cp+Vy4+64ebk5Uov0CtPEgWgVC2LlWJx+t50lg5TPhE0dkEyE3Q5A9bvrmHu4bxdZ40sjZmF1l/XEiHnFCW4Ge0D7lut5LY96FIKse6FWaxwvlBLzaMRlZqW4TWgokeN4M6gwlKnQ3WzVzM/xuHZoZLFEA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9564.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 11:35:58 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 11:35:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Corentin Guillevic <corentin.guillevic@smile.fr>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [PATCH v2] opencv: limit features in native
Thread-Topic: [PATCH v2] opencv: limit features in native
Thread-Index: AQHcP0d71G841DEAG0yZCihR/rq6hLTGNNYg
Date: Fri, 17 Oct 2025 11:35:58 +0000
Message-ID: 
 <DB5PR02MB102130CEEC367735E29C3C9DAEFF6A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251017091933.1094941-2-corentin.guillevic@smile.fr>
In-Reply-To: <20251017091933.1094941-2-corentin.guillevic@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9564:EE_
x-ms-office365-filtering-correlation-id: fa5d3237-d7ad-4086-54cf-08de0d7157ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?u1E+2qDealNOHFTBpcGwf0CwP37s5+2D9/V7zcY/UnoiDYqI15ck1xnGK3zU?=
 =?us-ascii?Q?uJ8DkyNnhYgoUnGaBL2hBfJDwbTN0d9Z/5nYE/fHs3TrJuK9ZMWAt2eKkBUl?=
 =?us-ascii?Q?zrB6Rti4OdaX4WaHx3LkdrvF9meuHBGdGElT6Yhc8TzcNYFtezv6986JiHy+?=
 =?us-ascii?Q?KPgSLoeOFUw5kkDPqATRaI/rfx5t8UzyAnTDC2UIZNrhS7YkYKR0knWP0ohU?=
 =?us-ascii?Q?xgCB4Y7oUuz11cDN6yVtXEexeNYrbRG2VKXT4/azeUTFkhb1Iu0FR+DKzhv4?=
 =?us-ascii?Q?cS1j955LFrk7Oj44zgkwGtDGc0LEOy67RDsKHYDHXoFwXibSzfxdTHHdXGMB?=
 =?us-ascii?Q?oO8SqZZ6S9jwaujzMePXvAwRcAAqzU/onhx4bba91RX+IncfwrU54GOnlM1j?=
 =?us-ascii?Q?JKAm+q4BB32wvbMO28sxbWOVzPQizC+z6IPFJoWPFYBaKJgLC5Bu5gudSzAi?=
 =?us-ascii?Q?DWnsPcqquMgOsd8K+Eigwl9Er8AD45nmiIBQpfEg10i2SO2eujA4gFwQyi41?=
 =?us-ascii?Q?Bs2TM9oy0fBJA0d0FScgeTUe27q7rDiAyB0xE0j3ijPF9DohBpavtZU+ZZMQ?=
 =?us-ascii?Q?nqV6B8WwwP9Vlx6i4i7fXxnYOfxpMwQNQDrwTndO4kvoq40kLuVFxTUsRcv7?=
 =?us-ascii?Q?wAD/pJWj/9QYnzHAJw7YND0ltni7KAQ3MtTV0rg/BPbUjJ8GdEMLjF2Faan9?=
 =?us-ascii?Q?d2rx5IbQQ0OzV+8x9BRMMbV84mWuY3MM3RwV+v83O+zzEvd4i63ewESh2yqQ?=
 =?us-ascii?Q?/bcCNgmcouaBtWatrKiyNf2apFfBPKcF71PD82sG5UJuSFQPyT8j5awehe1g?=
 =?us-ascii?Q?7rI7ON1YiLMOBuFgpBvtZEqaePIIGEDC62fMorZDisFgxclYTUzaE2OVaRzh?=
 =?us-ascii?Q?tB4AmTcwe2XCWaGJtabdh/wDDsis/vJuChuzCwqgi7Mo014GHWXvBuBOamxA?=
 =?us-ascii?Q?KDh+iQ555w6gyPc6yoIArlW3NTsQYC2byMzdqsflhToGEH9HjXagl6XDn5cZ?=
 =?us-ascii?Q?1737vlX8YWisQzQ2oJCIPaL0AALuYR3+wZlX36iHY4kjEuKX/LSGbNmuy8Ve?=
 =?us-ascii?Q?SwZUo084djbU5L1uyUfBcHiGVsb2VEktEQWGIi49zMqk/MJjHsoHyctki/6s?=
 =?us-ascii?Q?PrmgLMHDMGOHamuJk/u7VeIU5dbwIDcbWK0QvgUuwn52bTPuziI5EnTApc+4?=
 =?us-ascii?Q?ADP7w2rl32hcl7dmdPVVayvWGVcm0EBpWfQhVxRllHQUNWrxrLKS2vkh7Bgt?=
 =?us-ascii?Q?lsHuN8zSHxgxqRNjlbwH8vCkjMrXCfe22x20kAokGigzJ63BsTnis7IkXeI0?=
 =?us-ascii?Q?/Y66wxr/Ja6tMxZQDua/wi5fX1GOp0ONh6CgUEo32IdPU5qrm4Os5TvrImeg?=
 =?us-ascii?Q?8rIj4GQ50q2rdjnyC+wmBXxM08LQkqtK+JJ+PQaW5IdP6jsrZNkCKUyRUTAm?=
 =?us-ascii?Q?SLNm2AoHQ0JPDQtJCo2yIvWBfAe5psh8aibHGrH1mRoLuxnzRbS07w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SVN4w/y4XSOn3Dp0m99jMzKAJvNZ0ZASJ2DC3z6LgEMDkBuStJtm5iOX38oN?=
 =?us-ascii?Q?Oo3XJwWbAOrIyG5lah4zOiNKnQG/v8vOFq3FGu3FB757ZDSQhuHmvmXb2YTQ?=
 =?us-ascii?Q?iexxFnFrlZom5tPLnMhHNXzCRw1heJxDChXPmIV7hxEUuyo85GhQyXoSvclt?=
 =?us-ascii?Q?O7qvkTuAaLJMr19hfu+TmW00nfIx3gNdhghMghCdAf5ZNonNeHvxdb9ukw+h?=
 =?us-ascii?Q?uEHE1cIlDew0SB5+f0fXxxSPempZf9s+5O+3C42HZzHyYmcuQCVbKL9wSy/O?=
 =?us-ascii?Q?ppApri9GDb1rY8hm5MPAOnYLyFKCN0WdhK4sLmmQgvlSLLH/wP+yF1oJPVUK?=
 =?us-ascii?Q?y3eA1tYfWLvxsfg4eb066QRCV3uBIBsy9ufync9OvWxAS2pMGBhnC7WDmKE3?=
 =?us-ascii?Q?k2PUvzcgz8ro1ZGltfMETG0kXihqE4AofHo7eKzyd6qQ0phRmYfNWNOH+bWE?=
 =?us-ascii?Q?+3ymwfBoGKJ0L/5rq2OZDHge74ns542lx799amvid9Y0FlWpPPxgL0AvKCxB?=
 =?us-ascii?Q?7PMTJUxJSUwpnkmLcCTVtK67uSgqzeiYXzBwZld7N+XsFV44rEYCYfPtuPnw?=
 =?us-ascii?Q?oXzuo96/dZpr6zdD7ckhXOw4O0Gab0JV7Bf94aEJkU4dQgqvZIbhSVl7xe9U?=
 =?us-ascii?Q?NC7iRppsONSwgKgFBZnh8ajH5o/8JA8NqWJq2jPn9w/XrnZmUTEhDQiEJk1J?=
 =?us-ascii?Q?QNL19j9VZ+YNIT2cALhQYsgZBL9izRgYYoGIfYVDx0C6Q26d6toyx6ref2gR?=
 =?us-ascii?Q?ErctoucOSkKVCO4FS/2bY4l6Z1lAPG16Fa84GzKqyboHhbrTHE/woBV+bLxk?=
 =?us-ascii?Q?UPrc0Stwp+e2CHxws4DFrHY9fv58nm+a2kP8d1nW+JIZt2r8QIugJ93/YBBk?=
 =?us-ascii?Q?OVnPYDhcrPzSBKj/246R2IH5EqOAUVp4USOvorFb7KqGbc6nEojKelBZ3v4v?=
 =?us-ascii?Q?nSV/2qghI60tjYx5g+HviqO+0qD/+S/OicRyeb4ebYt65JrJVxUGM/dVR2ic?=
 =?us-ascii?Q?bzRWn/p5Q7qDzB9zPMxCI32ccSrAHTOj+YJcgKYI6MMHO2XFimUIE0OIZvbx?=
 =?us-ascii?Q?CiAN73045nJeiHDFkjKmjR/L2bPw1x00CmsLNnmjrxYc6u3bCY+z+oTPIn4u?=
 =?us-ascii?Q?mItcEC52ojxAk4Gz8vTvwMup04SCe17MEpLZH+2t25GeW8TNcvsW2+sbll7K?=
 =?us-ascii?Q?emOyFDoDA762nUI26pHBmG79Br3h87stv/igcS9WaukzmpyP6c6rb0o/TQDe?=
 =?us-ascii?Q?KUV2vdcSed3A4vevhyptqsuFWy831Q74LjS41pKfJCGroIISA08OngVvf4jx?=
 =?us-ascii?Q?Un+F4PTBJKNYZa7AX4Oy1iTrQdNeoTccEO0CJs/pC81Qf4OEAbR82M2sdF7z?=
 =?us-ascii?Q?B4KQqfX7dvxCYlbq2U5J7BTdgl5fsVklizuKmWPsacKzb3v9DycBtZ3M8qWK?=
 =?us-ascii?Q?tYEAfiCDTSi6WvkmC437CNJeaIBbyWcryG1PlVRgaXV6Afs5KR5w/WgfdMLM?=
 =?us-ascii?Q?/BNYGDzTeUmnC2W7+oaztwSPKYI8A343nHAa1qvxQW4VGR5O6phSBm3/tQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5d3237-d7ad-4086-54cf-08de0d7157ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 11:35:58.7917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1kV37zFD5z3IFfnUFIYZrYkZRKYPiIFFj3QMhiZKFPCgBvSedXGGobAPGsrgCTCm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9564
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 11:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120758

> -----Original Message-----
> From: Corentin Guillevic <corentin.guillevic@smile.fr>
> Sent: den 17 oktober 2025 11:20
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Corentin Guillevic =
<corentin.guillevic@smile.fr>
> Subject: [PATCH v2] opencv: limit features in native
>=20
> Since commit 91e428d4cd5a ("opencv: Support building for native"),
> opencv can be built on a native target. However, not all of their
> PACKAGECONFIG dependencies (ade, libgphoto2, ffmpeg, gstreamer1.0 and
> gstreamer1.0-plugins-base) can be built in this context due to the
> missing native BBCLASSEXTEND.
>=20
> These recipes would need to be extended for native build, but specific
> work is required to ensure they work properly. To make opencv-native work
> for now, remove the above features by splitting PACKAGECONFIG in 3: commo=
n,
> native and target.

The text above was not rewritten after the implementation was changed.

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
eta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on=
 or otherwise requires it). Close matches:
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
>  meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.12.0.bb
> index 27499caa92..aa11d3da43 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> @@ -86,8 +86,9 @@ LDFLAGS:append:riscv32 =3D " -Wl,--no-as-needed -latomi=
c -Wl,--as-needed"
>=20
>  EXTRA_OECMAKE:append:x86 =3D " -DX86=3DON"
>=20
> -PACKAGECONFIG ??=3D "gapi python3 eigen jpeg png tiff v4l libv4l gstream=
er samples tbb gphoto2 \
> -    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',=
 'gtk', '', d)} \
> +PACKAGECONFIG ??=3D "python3 eigen jpeg png tiff v4l libv4l samples tbb =
\
> +    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',=
 'gtk', '', d)}"
> +PACKAGECONFIG:append:class-target =3D " gapi gstreamer gphoto2 \
>      ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpe=
g commercial", "libav", "", d)}"
>=20
>  # TBB does not build for powerpc so disable that package config
> --
> 2.49.0

//Peter



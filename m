Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED17CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:29:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.25])
 by mx.groups.io with SMTP id smtpd.web11.643.1760725749580353651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=n4vCmlKl;
 spf=pass (domain: axis.com, ip: 52.101.72.25, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1nSyvBj/YRWtyzJqDIeXX/KhrXPN1f7dldDfykJWUMb5LyOp3rrhqKUthtxReb6RYdBK6mqfi6Sy5ngbS5HQAeyYrsSZbhpnhBnmN0OnwQ0r8RhGk1mbcI6qUqE/A/yd/hVG3lrNr0d0zRMNTWxGnx63jWk0/6er5lHXtGDyROZtuB9m6qubsRIlmB3iKk6pKM4kI49gBWXXndDbpyuLU1XmYP0RzlNbYisMramFTKjTibnLZIY9SgZnxaMQVawMjvRH5KZQxHXSqBufIc7SN5alSAsHvJNv5Xiaq5CljlTQFIu2goKVM4P0ZyrGuGGY2g7tje6wd0ZHVnxMdWi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VriKCixxGL8acTpoBiUyvwUYlcKEswJNBgaRSnnK9hk=;
 b=fqE/r2aIQMMK48n5mly+d4pAKvhGW6AtAk3aVqgPYNF7afp21ELWuo28CO8KVo5rcJ3ZJD9rk94R4P7LOkVmmANXce3cXhFTe2YeFLZX6rc79GrG+HKwsQPUeh70U5ITpLaHMRiKggayeMoAVCgDb/mBBx3ZKv7EvVG1sQ9NNSLSUX88haaFroHOtB0SWx8zzhsCRnQzHU9K5b/NPDkKQpU+zGEBUNY5qwIpONTkTSW+rtAGQO+myHlrmVj1m78RzKLQlfnamYMguQhnCduChtZWt77tp6pLZ5K6yg7WEZSefdE7bbx2ip7ArVfA5bed5rd1GBasQ27Oku3hiWe9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VriKCixxGL8acTpoBiUyvwUYlcKEswJNBgaRSnnK9hk=;
 b=n4vCmlKlsnt+KLmFf52xGuzZxnWuNX7+GRJ+DzdeB2RDdQlJgcSwH1VJR6lM02eMM6Xh5Nlkl0le9psJ+Ub0PqcxJcgD5G9unfFwlwkwrkv8PwPSYn68A6WPxovSKvD+56klvm/QZKR4cv3DmQ1aeL+GJrkBdfJGVCJ1TUjeSxo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA1PR02MB11103.eurprd02.prod.outlook.com (2603:10a6:102:480::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 18:29:06 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 18:29:06 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Corentin Guillevic <corentin.guillevic@smile.fr>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Gyorgy Sarvari <skandigraun@gmail.com>
Subject: RE: [PATCH v3] opencv: limit features in native
Thread-Topic: [PATCH v3] opencv: limit features in native
Thread-Index: AQHcP33n/6iTxsylX0etkISvPg5q/LTGp67g
Date: Fri, 17 Oct 2025 18:29:06 +0000
Message-ID: 
 <DB5PR02MB10213155AFF0DDFE39BCF784DEFF6A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251017155047.1122714-2-corentin.guillevic@smile.fr>
In-Reply-To: <20251017155047.1122714-2-corentin.guillevic@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA1PR02MB11103:EE_
x-ms-office365-filtering-correlation-id: 922bda82-9b06-4be2-db51-08de0dab0e5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?N3/eBw7TSlNwQig29LsuDnSJ/YSVmEguIoC85tbvqpyXtzYBeUWC6uU94eb0?=
 =?us-ascii?Q?g4D1aY3G4pcIniWEUrcetIcM1DlWYWD58kUcVNIN4/ItHsGsEJVFPUXQvgQp?=
 =?us-ascii?Q?3gJNfS2al5CGcHcZkVGfN85lM6MFZw1XpognDHP1n0tDJ9yiGWU+/fAPa5YS?=
 =?us-ascii?Q?3mdVNND1dX1V9/7y8sHsISbxEvcMk7LUdA4tN2eh06ozneKYv4STRWWpJicD?=
 =?us-ascii?Q?Kad2JAGCtyPu9oWXS/U1AxSvhxBPeamXoyGgZitWxQQxSlFFOnE/YzumBU4j?=
 =?us-ascii?Q?5EEtKhL/4UjYViqAvf57idYB/Yq4aAmByLNA84QSvL+IM28yt9CXQ/pJQRfC?=
 =?us-ascii?Q?qES696SgM4GtjEakdYV5OAdOxKmbFeXbeuu0Dr8+Ftb1/1NEpdHWVFXp5EqS?=
 =?us-ascii?Q?h5irwCtGj6NFEytZ1WmquI+lLTJ699zVSAbEF/L4oZ1ImpEMBNDDmnRF8R8s?=
 =?us-ascii?Q?7DLVVqirI5l29Y8qK7jtLX9xT/9poP07dqfoIg/xFjj2L9aN6TrIq/eoGOBM?=
 =?us-ascii?Q?orRghjxA4yxy0OjxPHqY5kSMzAhOnMShecm5XzVAX5QL8bi/L7ebvDTdiRY1?=
 =?us-ascii?Q?sF6J8MZq68pc+GsG6K+xmmJet2pmLyuHpt6VI7QjDrKcvFVnhT1PmnBw0iCQ?=
 =?us-ascii?Q?309wAHvci1sj9Ggt7lt6Pt7L/nCntxoaoaIBY1BUZ0R5YwvPYI6G6g53P+Ib?=
 =?us-ascii?Q?T3skupPNeQ3nr1EgR7uh6TDQ8+8fSVaEuq+xRBETXO4CBPiAH3GQY4ZwZjA7?=
 =?us-ascii?Q?jZplBxdzm8m1KEnfr7J/3DjE7rMyLM9aPZSCdquavI2Ckwcra4RWozZLQf7p?=
 =?us-ascii?Q?VBO7266497BKXPHIyLoKmYsnRj+TZScJ7LEQeFG6GUHALuFLqAjh3VZgfkyT?=
 =?us-ascii?Q?lnJ1GX3TfjK18ShZdEsB9y/PuF8R7ZdXz0WGE4WvopnvMLbaHBPnXSoezw94?=
 =?us-ascii?Q?DBPencmc15mbJ7+E67b5C4DSQsNO+huhQ2JYQNqkEDqJuUWwt4PS082iOK2B?=
 =?us-ascii?Q?ofXY9rynoifBmP0PCWh09nF5CMDlXqlPZL/EtJlh9PXKHhyqGv85f840SNIO?=
 =?us-ascii?Q?LAJpkdkVZPTBj7DrGz554h1TbB8y+LROZnZrszih37cu0TBnHfuX+NssZsGI?=
 =?us-ascii?Q?wAuOgnR+AcZUoI7HX0vPhmon2ygpBgodTKevwVaki4LRk25TYmx3eqOsbT6D?=
 =?us-ascii?Q?7hl/F2SbGStiFxzlXnfLZL3rTq2T8cvRVEEufp66R4uHsyfCUsae5RhYpXYi?=
 =?us-ascii?Q?Vcejf+nAxkt31q+BuX8DhSJrQeFyIAyUndk+2BrI1Y68NVRA0Ta1ctPfOtzi?=
 =?us-ascii?Q?pRK0TLXIjVTKNgQDX1ZOYbN1e7bVa+sic0qZq1e8eFVtHQEnvnkFjG0+ELj3?=
 =?us-ascii?Q?OuLyx4bJIsYRdPe/XVhE9styGLeeCp3AU0c30kjhiFR0BICnVhaA21PboAaB?=
 =?us-ascii?Q?qPL+lgjzdGe7b/neiqHHxUVAfh9lRE5V0pH2Viixsdu0vj0mPc2tGw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AsWKY1F6OadlgVQZMuKZhsDvl7KcvQ/5p7eUMh/5O34RojOocF6qjJqXmb7W?=
 =?us-ascii?Q?uWB9MgSi9YaRuCHxOb3OoYF4pOIkBjLu0TeU52YL8sNQ4dTgsyyu6tS+28fB?=
 =?us-ascii?Q?fMAt97GFfAMjrj8Jyrp4BOsjatupIeKXMFdcqUmEwKReiYr7/egLsoOzr8jI?=
 =?us-ascii?Q?+jajCeBG9MXErmOO3BQWDkGEvS8tQdwKMgjv5xWpOWV4EM+VFjrLxLf+Xb9L?=
 =?us-ascii?Q?w8fvrmLw6yY2ArGVA9kbGs8/vEK663CdsGXmDNiwGDUTkMH5HoZxeKBmiW4+?=
 =?us-ascii?Q?WvwjPb/E0d6/iK5tfXMj7IimeJYX0yAUbQ4dAiIgBbp9EtkAAimriK46k7pZ?=
 =?us-ascii?Q?d6gPLsO9t+n1fPp8K1Ch1hd9QZ4yRmm+BYs9/NMUzVRnPwBVhXHQ4n/5Jl42?=
 =?us-ascii?Q?TNchYSriCzNzVjwTYikoHSyd9ahYRV8Pb7fkJttePk0U4ghyjfRUTK8v+fOK?=
 =?us-ascii?Q?dtGiGXRpjgwTVM0X1TlDGUwOydLLHs3iyacDt8rzqR9ZmTToiXot31dWpdcy?=
 =?us-ascii?Q?Vv+WEfun8HYXLBLLvnnk7d3uu0NSPL2NCL3UueelkDjSCH7sF9hVWA19VD+/?=
 =?us-ascii?Q?ntqBOSZBgzHCJtBaFUWkFdNg81OcM7D4FfseZnVCcAJXjTUVpFrCUj8HaENb?=
 =?us-ascii?Q?9uVOjVpDZG/fotokmlvWElxrmEDxKuQMTP0kZ9uD2AuDGO2yKHWRLfvg+fdg?=
 =?us-ascii?Q?lexadVNM2K1yzFjX0bP/eMCRgv4sBlA3VXHvlzhTDNxfYF4nROyRjh1aK1TD?=
 =?us-ascii?Q?pgdmsxVevHLqWprqT+ihn+inUXcEmU0QPf3repEeYpcoTRqkZslITEh4r1uz?=
 =?us-ascii?Q?92/ezEEDcKTrpxy4B9EJxMulSP56VDfEEZnqJ3H4VTspiI1MraZu9tbyMZP0?=
 =?us-ascii?Q?31wQjyr2vulqqTPtwZV/Ywrjk80AqDI1ZIhy3GH2tH4VAwp4kbheVeSaT0YO?=
 =?us-ascii?Q?0UXph1JQyby7C1HEfAn834ziNsTr9jU+k6Rgxy1TzXVVOiYtWHWLa9S9e1um?=
 =?us-ascii?Q?ebrXs39JGM6FSU7HQy4BCVZcSwEQ8nksS0QhDoT0WnnWYzy4zY1Gc6Dt6yaE?=
 =?us-ascii?Q?FyxjLww2rAf+zk9LWjngxcC0tvutQgT0HN3g2p/ltc45ydpAjhRTgUd+QQhO?=
 =?us-ascii?Q?K5bu9K8UTKNSkmy7mXOJYQMaxSM14j7j7C9PLTJ5ywG+UGZb2r7RAI+Gfzyo?=
 =?us-ascii?Q?iEVy/IINbV1JaZWqVBB9zrl7Vd1ynXFX3ddDwsEUnWQwFs0eT79jVLqJgU1e?=
 =?us-ascii?Q?jCj2hjGR7ZwER3NHnzvdS0O9fi6yFcrRqbjADNQIzEAZxy7a/p1pcYGH0bfl?=
 =?us-ascii?Q?tUfAum9NMmCWFoJTf2/TSXIf6NOZZrjSDCPrmJoGrQGxof3VTpeXzZ4FmTPt?=
 =?us-ascii?Q?Jh4ZTwkKp1IbQUEG+qx6tN3WHJeye5nj+JMRKxZMmsKL9CNTBJ/W50HIJtqr?=
 =?us-ascii?Q?8L4l2mFs92XrZxkoOKKHc/lcIlwaZ5u/aV8qgljORXlmGUgTPH+Okdg3mXfh?=
 =?us-ascii?Q?MDxFhOrosGrcDz+nYwtYMrthg63pLv+jdCzrYF8qJMqXcqP7z6qDHLXQ8w?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922bda82-9b06-4be2-db51-08de0dab0e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 18:29:06.4510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: la26TlZvdEETlu3X3k6Ti47VnpVWq8FIeN5JGUKPFz0OFIEvZboc60c35trqdlu+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 18:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120772

> -----Original Message-----
> From: Corentin Guillevic <corentin.guillevic@smile.fr>
> Sent: den 17 oktober 2025 17:51
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Corentin Guillevic =
<corentin.guillevic@smile.fr>
> Subject: [PATCH v3] opencv: limit features in native
>=20
> Since commit 91e428d4cd5a ("opencv: Support building for native"),
> opencv can be built on a native target. However, not all of their
> PACKAGECONFIG dependencies (ade, libgphoto2, ffmpeg, gstreamer1.0 and
> gstreamer1.0-plugins-base) can be built in this context due to the
> missing native BBCLASSEXTEND.
>=20
> These recipes would need to be extended for native build, but specific
> work is required to ensure they work properly. To make opencv-native work
> for now, remove the above features for the native build.
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
> changes in v3:
> - update commit text according to the v2 implementation
>=20
> changes in v2:
> - change implementation to a more commonly written one
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

Since the change for opencv to allow it to build for native just made it=20
into the walnascar branch, this will need to be backported there too.

//Peter


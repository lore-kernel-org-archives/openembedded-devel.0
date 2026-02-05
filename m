Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B33FECD99A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 19:49:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29664.1770320975437436837
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 11:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=GEmrCddU;
 spf=pass (domain: axis.com, ip: 52.101.69.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxrwOHHdgC/a50AXv6PDHFqWCN2hGrw4dfXEzFZrIgOb9ebIOzDHVBnL/8ojetNw5bonafQG/2fWx5VfbST43wQSm0FXMjbj+yFLhstyIrXcAwpcL5/PME84dvpo2EPx/FwjF1LtxN+iaHEABjxgLMDkoQb8fTSYkK2zxJlQQ9teSCt5COeVWUdmZNQmJEMOM9WqWsawijZYJ46/xCBFty5nD1tQjy+e46II9uUBaZzm1TzFaLmzdoodmroshaT/HL+HArz+1dOHZKPubkIgoTaNF1cdA7teJfCVHrB4yUzumg+YjXwFK10Ft6/llxKsQWrY5HCt81AvV/0mslUdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWb8MH6ic5wyoKPsG9C2LlK7tY0ABQ8orVkSdWbQASk=;
 b=iDyggjlgL5l6sGWtUbEZwvj0zzWtzJrN9jkyawacm90wqqf9xyMxj6ATRINOgOqFza1H61aSIK3pFehp/sW9nUSZGJLvRaioUwqwngMbeQk8vdZMeU6qfAqtRQFz179aEfXA5D4x3U0C5gkD1wfsBHJdi1vX6xVNKn7Go9foQ80PqdFtWcbZmPKbWYnFmCYrXhD1nUbqvWb14UwHNb74MdcqINTeiXvywr3qPqi/TbIi5Ck0jWpDm8v0mdg4CiPCCFSVa8pydSqPkFYziZCet9VNP+RwOsKfe5kdRjb1auMRSMIQizSSldfkLDpelDsXVmQwRYbD2WymlhckL9z7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWb8MH6ic5wyoKPsG9C2LlK7tY0ABQ8orVkSdWbQASk=;
 b=GEmrCddUQT9pC6x3fiU9CQRLdoLEYSvYnCBROHQI/uwQ8+/W/ZFnR8iNKr38b3i3vbHTUlJRfAotsZfDjVfAUnGS24gQNSUb8PoyB7MQlD2gVE8Ji8Qpyo+bdAH34xrAvj+mEvLUCcQvrBjTrnoUfHwxgUCIMI+nkQMAdNzPpu4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB10249.eurprd02.prod.outlook.com (2603:10a6:800:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 5 Feb
 2026 19:49:29 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 19:49:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "frederikbraendstrup@gmail.com" <frederikbraendstrup@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH v1] glaze: use default install for cmake
 files
Thread-Topic: [oe] [meta-oe][PATCH v1] glaze: use default install for cmake
 files
Thread-Index: AQHclhA+dGUp0U9430KVNxgDebMIGrV0d27A
Date: Thu, 5 Feb 2026 19:49:29 +0000
Message-ID: 
 <DB5PR02MB10213DB563D39B743A315F251EF99A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260204195202.1101258-3-frederikbraendstrup@gmail.com>
In-Reply-To: <20260204195202.1101258-3-frederikbraendstrup@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB10249:EE_
x-ms-office365-filtering-correlation-id: d404af1a-aa92-4b27-33a8-08de64eface1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|19132099003|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?9jtphYmn/HyiTuLmXYvx9/5MftPG6w1QwrPv8YXuqVke8Og6CKL5y+JSWt?=
 =?iso-8859-1?Q?GAAAefSE2z7HA7QUiRJukPr+AAMbEaIJB/hUt/wpfIdjWavj9YtV7bEo8c?=
 =?iso-8859-1?Q?GXzVb483UCZn6XmD4e+vwA9dX7OG4Id56QYqdL4X1lOLEg71dk8PdsHMOd?=
 =?iso-8859-1?Q?MPFj5f5USKOPfw8yOmfFWAUx5fz0I1jQYp3S2ImIQVWqR80YWE0qTdR3gg?=
 =?iso-8859-1?Q?xHQEYGgie1IP2w6awZK/ykl/Rj2hVDKK9YTxZBGFZXyDh06KQQzZe6kN54?=
 =?iso-8859-1?Q?LV8QzlZ2m1d39uRjnLEJHOv8tjG4OveZZvTacHNicTnoInwlEyVgJO18V4?=
 =?iso-8859-1?Q?0QAswxXaBIzuYILp1jSTtmRYNP0LW96MCkKstSc3KcF2CgCRIDNAyoATFq?=
 =?iso-8859-1?Q?hKO67srdsROLkFDW6DlT4IM26E62qxCaIFK+vlrkU5BmpKsevJthnKWcwX?=
 =?iso-8859-1?Q?6GwYVHLRj96RcqxqeUtTiOTE5mCgNjPLM/V7kVrm9uFGW3A00WmmOw7ovz?=
 =?iso-8859-1?Q?L4AhCn9b3KWosLp8my+f0DBNhdHIMrj0a+XoChcMNAIL/Ep5g/cD1UYsP0?=
 =?iso-8859-1?Q?3kPsIah+VVeca+Rn5r1CLqPKSLEyGOC3HZBTzMYoHCebzWT15KHWRDA5NA?=
 =?iso-8859-1?Q?PftTax9xkkOdmxsVasdDBhXDcDrvzSsSguzEqM47pc0W2ouYyANeoFhaQI?=
 =?iso-8859-1?Q?pQ+u38loN3Lr6Ktr/fA8lBYzP67PfF4QXJGRCSUq3u/SnNMIPPX61Fjz7J?=
 =?iso-8859-1?Q?Bp5uC78gigyf8DDp/xSbfjDQrzDbnLivafDLyK2iiymxQlYu/cC3anqPaT?=
 =?iso-8859-1?Q?MAuwvHjKq0FCODoDVDRRfeKLMzCau4IzvKrHmLq+HwZIz4VsYLoovxSELb?=
 =?iso-8859-1?Q?50wpDOcUY03S7RwD5JH1ZvaKWFpbGtl2asAeZ8/0MRxzbczSIkHE1Tet0m?=
 =?iso-8859-1?Q?duaIWqEsjtrya/MzqR5QTAtx8b5gnXp0kwUO1UxMTnzJU9+/gIWix6i4jp?=
 =?iso-8859-1?Q?weTNuP2vDBRYZ5n8vqBSBj0346hEymCkkHdeOWdbTTBjeWvYXlQNIDUUtb?=
 =?iso-8859-1?Q?zD6di4k11Vxzw6Wh8UQE3rpHcepAFT/bDRoM6ss6EiFiP3+K4E8/wNTbmS?=
 =?iso-8859-1?Q?9aPNuZ605TeRH+xSV/4NEPsDlxKY3Gjm+vm95D4jw7V1ZYjXLEP2r0o0c5?=
 =?iso-8859-1?Q?B2DoiFDPjK1hbeH1KInAHmPZniEV4V5QqO0GiG2AIalHMfJuo7Zy9l8W7k?=
 =?iso-8859-1?Q?lnUJXO0eG5SXA/8rMOPZJUdT7GgGKDdcAr7uvQURkjbbQMzliOF1naoFPC?=
 =?iso-8859-1?Q?AK9OdKJ/z9yzrG2EApTQJVncUwMZi/xiT2BAHd4pNEsCjRc4ML9T7zAAQi?=
 =?iso-8859-1?Q?hnpufOq6G+CZByVBay1pdk26MhjuHLX9xPYC60XjoJ7fppyX/fsSTYz/XV?=
 =?iso-8859-1?Q?N7AFWGEsgyQQ8wF/tYjotdZIFG3RScHIKrd/QbhfiDpbgsQqHQmKjouN2O?=
 =?iso-8859-1?Q?2afgEDvtGmJWVvQbQKDm616J12YQikOx7emczx4Kj3DIUmSAmBcTb8gcLc?=
 =?iso-8859-1?Q?JjSGlC/BMn55OWS2LOgxWia95AC+tUi8ezdp2FETneL38w3dMmH18O7QAu?=
 =?iso-8859-1?Q?JtFkHV1YK3kQRqDaOGks2DAW6vt2yiZ2GAo6ynixaU1XJkFy3BlnvfqGr3?=
 =?iso-8859-1?Q?keHSUY8ErkBQPn8e8V0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19132099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0Om9ofjLD2W85qaa6SCOPJl8F1Qr0sOBCEGVcclP/Z4+AS2t3AfSqL1QHz?=
 =?iso-8859-1?Q?B/zWmC0Ub5MmbXTDiW70E9lmNUybHmGcA4iVLKTc0/Jntl1c3BaygRNO+2?=
 =?iso-8859-1?Q?BL2bWc/jUlwUEvWoPkG2pCQEnOYrorGWY+nOjIqjGPT4M4FlOGWPJuMwCN?=
 =?iso-8859-1?Q?wFqKpwa5ILm+5RInw+MmslqNvQ+kwUKfUrQlDqEW/lUg2wf9vWhColsVDC?=
 =?iso-8859-1?Q?1vgfk/QLuAkktlkIKLOKIjwrmYm4fvPtz5FN0LNgHtlZMKqB4c3+dNNr/i?=
 =?iso-8859-1?Q?n2KiGBOqU0N1/GXcq6UylWeuprI+nI9OLMNZRpXZlfa4EKBBsYRpbKv95k?=
 =?iso-8859-1?Q?lJVIURrdGZFYDbtHXpT5ZKoixyzPfzMPprxar6OwlDpZ+RN5ihKr4OvgHR?=
 =?iso-8859-1?Q?Z/RBWERSQKLSN8o8UxlLS6VNMDHRaWHfRvLTRA9w3tlacHNe7Jsrqe4DKH?=
 =?iso-8859-1?Q?qyY0NBKlqi0d4n+rwDFKp+KzPdUaZHWpZd1LVHcJgbthcviscIs1PsKPW3?=
 =?iso-8859-1?Q?1twATBpTN2ughQ+g/eFmRiPnkZddjrcdBRgK2eQETS1nzCMFeosRZi68IC?=
 =?iso-8859-1?Q?WLOkhVwmkKFmw9oS4IfwsFZKcmpjt6IDKYHXC0MKMci/GSGZEfNWef92BI?=
 =?iso-8859-1?Q?ZBmz/+thqIti788DumQI9WdNG1TZrS4wY8zoknxM1eWHxd4Wfi0J+ZUZ3h?=
 =?iso-8859-1?Q?Tgu8mRxoJAa3jtMWDj/9rngeh5iDsFThxZYjUmd2o/7rq+N8SbpxqyvCSy?=
 =?iso-8859-1?Q?Jggxfz1FqG+yfBBHHsvYqCX2LlV8QTLgBGK0SQp17YUXdyGD5KkW5+g77k?=
 =?iso-8859-1?Q?bwxnvxGIlGGAONQ86nh5+vhNDysWDua5VOSoFpnscDyS9xAJf2kHhGAyL1?=
 =?iso-8859-1?Q?wLWGyzsZlOuiCLWQGAJjbx74RWyHrUxD+i46i6xjRjgvCJsgS8tyHPSLms?=
 =?iso-8859-1?Q?P+sOAej4fLbLDhKTA6tmqmy7ChZvDtHypP/svTzkJBwdB3B25jPiHUgunx?=
 =?iso-8859-1?Q?Ik2H3ixSq0mwmfHj8nqsF0KRSw+sZ8Q8Nd8CxuscEFa9+UkP2hVjm7eNJB?=
 =?iso-8859-1?Q?oj1ktcXspoHb/mbAWICrxZsxfnGjEtFSzAUlbrYfgI97Vs2lS7wKaQG6cp?=
 =?iso-8859-1?Q?U5PoA/brMI1BHhlG9DRDJqxi64VIsT7f5AkhjVFLBEb5Uv1Sa3qdHCHRsa?=
 =?iso-8859-1?Q?sb8oed8O6fM1WC91OaYf7pgHBwIS0Z5HfVB9Dxw5lLhfFWs1R44duibfiL?=
 =?iso-8859-1?Q?28PfORUnuUfXDJDlPcJodXqbzRwTx1Ll/W9FU+452k6bX8W5vh5tCi6J95?=
 =?iso-8859-1?Q?vHQCjzf1t/BbjnAy33RWhamD+HBu5Uh68JZFGFAx31FgFZk+2XG3/euSGC?=
 =?iso-8859-1?Q?nIstcG/e81bCzGdDG9H6gesGwgLEiJ0PsX4P6iZCVnNbY4+TszI03ctDrI?=
 =?iso-8859-1?Q?BmJ0SNFrMkwGvj8XJli0MiDXskkh791yveJ3fVtan73HqgOc8jfX+hmLCG?=
 =?iso-8859-1?Q?ET/8cmtaJ8g+BScTsyZD9ucIBszKlYCSnRmx39O3cLQngy+3UF/PKer3Tm?=
 =?iso-8859-1?Q?+R8SRn36+S02Sl79tnZSZU2m8932NrQa8HsMH8gSoFeud0RN7UqR25egCA?=
 =?iso-8859-1?Q?DGBPmw7UROZ9cp8cJqk1uwegYRT7jgx/eUiiQMtBnlf9c/pgFpHFtkMiBx?=
 =?iso-8859-1?Q?2zZ0MZHHzY63xUEy+/6xlNjiAxMwWKdKr+divjNamMhqn6bqSgH7OhpqO9?=
 =?iso-8859-1?Q?Ft4v7Eu+C7NyY0YtRF5Ys3QWo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d404af1a-aa92-4b27-33a8-08de64eface1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 19:49:29.3320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnHg3B4lsMO59AulF5CmmxPOjKdKH4J3ZDkyweQ/fxHh3blGba0vU18P4LByXeNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10249
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 19:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124220

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Frederik Br=E6ndstrup via lists.openembedde=
d.org
> Sent: den 4 februari 2026 20:52
> To: openembedded-devel@lists.openembedded.org
> Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> Subject: [oe] [meta-oe][PATCH v1] glaze: use default install for cmake fi=
les
>=20
> CMake correctly installs glaze in a location that cmake can find via
> find_package. Without this patch, an application using the following
>=20
>     find_package(glaze)
>     target_link_libraries(myprogram PUBLIC glaze::glaze)
>=20
> Would fail with the following error (with tmpdir redacted)
>=20
>     CMake Error in deps/vesl/src/Platform/CMakeLists.txt:
>       Imported target "glaze::glaze" includes non-existent path
>=20
>         "$TMPDIR/recipe-sysroot/usr/share/include"
>=20
>       in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
>=20
>       * The path was deleted, renamed, or moved to another location.
>=20
>       * An install or uninstall procedure did not complete successfully.
>=20
>       * The installation package was faulty and references files it does =
not
>       provide.
>=20
> Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> ---
>  meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recip=
es-support/glaze/glaze_7.0.1.bb
> index e481290b9c..db87d636e6 100644
> --- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> +++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> @@ -11,13 +11,6 @@ inherit cmake
>=20
>  EXTRA_OECMAKE =3D "-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF -D=
glaze_ENABLE_FUZZING=3DOFF -Dglaze_DEVELOPER_MODE=3DOFF"
>=20
> -do_install:append() {
> -    install -d ${D}${datadir}/cmake/${BPN}
> -    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
> -    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
> -}
> -

To make the cmake files continue to go in the ${PN}-dev package where=20
they belong, you need to add:

FILES:${PN}-dev +=3D "${datadir}/${BPN}/*.cmake"

> -# Glaze is a header-only C++ library, so the main package will be empty.

This comment is still valid (once FILES:${PN}-dev has been added above).

>  ALLOW_EMPTY:${PN} =3D "1"
>=20
>  BBCLASSEXTEND =3D "native"
> --

//Peter



Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C9CC10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 13:13:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web11.34928.1715519609730533873
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 06:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=qLCFeJTu;
 spf=pass (domain: axis.com, ip: 40.107.22.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTyoeQNcLy8Xh+rCHrnYoFsabeZk5uAqibZziKhqfT763W/wHinoOsaDeEaKKnzk0fgWCZix7hdzE+kt735vlq81IC3prdkh1AYTLKxq8MQUqUp8CXWYPI/YuR4v5RVzdnYMYWtH27Rm10fxTVCjRTw1G9QyORyr5mn+BtOL0+c00WKBjuk2Qj4k7ONkV/Bjnj2QjJdttMvtC7K+5SKy2G9nK0+D0XNaGeCC7oBNHL1A9q+vxpWCaV84FdRQaH93ppoVfBCFr/loDVvloK01nzv1dDwBpA8LeTdIole3ops1ubxvD9HOunobNSSNI1kA4eI48AWf6l4NGB2lULwSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMuchnZgFkysBPtQ3cHHes9W+7z356NLOFgxlWNh7zk=;
 b=GqvbX5bJD5lbsVbXhXvBMW3nKKKhcPvJJdKdoYIh7XKRnjbaigve53zYZJ0w0J7ySbclxQVhcEaAaq0QFEvYQmibSF7zmQh9f4vYGVerqKNM3HnqH9/3k3fx+/PBkQVFsR0tp7tBBazDA20ycuft8VMuXpF0w8jdTeiqhAZlmEHAticz6sFiZN71O+yDEPf1bqOy2M3U/QtKov23bJaAYvyWIgdvMxAQiddbk04VskdQROVxIo1cCuo4FEAY3KzCuJqPQ56dQSa0LKuyJeXGc17jhOrvUrf9s8xIvTkN4jjsvUQyMgJ0siskqqKPU35UkyuqDeYoYE6EduHVeRYz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMuchnZgFkysBPtQ3cHHes9W+7z356NLOFgxlWNh7zk=;
 b=qLCFeJTuWw6ZBxNeskLzKrGhMoyOqdzm8D4sRpVwFsb94Khgmk+SECFYfxZyUPcqLxr6KT/8qrTIbubWp5t+/TwX49yu6WYYo6NvZ5Blsc5oYCHhX1DWfobnaG0HCHPwr3jvxQgAagj0E1m1JDIFt9neBsMEUOc0D2gl2a8/tVQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV2PR02MB8673.eurprd02.prod.outlook.com (2603:10a6:150:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Sun, 12 May
 2024 13:13:25 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7544.052; Sun, 12 May 2024
 13:13:25 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
Thread-Topic: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
Thread-Index: AQHaoTlFvMYJuVLsh0KP7za6tb3J/7GTmEVg
Date: Sun, 12 May 2024 13:13:25 +0000
Message-ID: 
 <DB5PR02MB102130DD69A5E5A8236BE2033EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240508111609.4157976-1-peter.marko@siemens.com>
In-Reply-To: <20240508111609.4157976-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB8673:EE_
x-ms-office365-filtering-correlation-id: abdd32e4-7a70-4e2b-ab70-08dc72854eaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?uaKCiQhMZrJSCnC7uQ8a8476ObKGH5sLy0Di88w9aC9fdpLvLGeiiUEi2JvE?=
 =?us-ascii?Q?ZNUrUMNH2eRrH+PbApM0yV1A5BEGbHODNuWShkdKkXaioozjE8K3DrbUMW5z?=
 =?us-ascii?Q?2YCi6RVjwzJYfqjw3Tn0vv9ZIiqU6y/Mx67TkIH6yOstEJ4KZdLfVnifuz7+?=
 =?us-ascii?Q?np35I0XY/xTH96wRvJsPmbwYEX74gHMScVu4/qLVqNLP8h0xhuj9HHc05FMt?=
 =?us-ascii?Q?SwET30HEyINIsF5NVzlQWtwnm2aM9dH20Z7BIu+Zgnl4ARMyqBi8amavGvLu?=
 =?us-ascii?Q?Qw5ESzw00VXox1MJLBwTNhK11wf8qyje0RpwBl1gV1YKvw2oe4ABvpWAfGLr?=
 =?us-ascii?Q?ZSKpq+0umX3tXwYXatzbbxEcjs+iMiUJkBWaWGi5dAEhKBKVwBLxkEdF2IZf?=
 =?us-ascii?Q?UsANByvLn2ErSmGC8p2kMvlXOULiTMxvFdEoY/dlryT5bH904l9ZKUnqf+qj?=
 =?us-ascii?Q?yEerY18UG6GmYZyAR8xG5qQ8I3ifK4i/w9TDGI9VLywC0FooTWBZ006qE6Jz?=
 =?us-ascii?Q?HiA/6QEJL8opWBeEp3DkSiht/WXA0ChbQlmVIv5ywILkC56V02hCYDQ9Jq+u?=
 =?us-ascii?Q?/aRCjLIT1mOqu9pC3ZRTDZ+oM0uX2lF0+ZlOgBcN5YjWgdwSoKQA9hffaGfm?=
 =?us-ascii?Q?JsJbyiyTDFubeqteoIsaA5WF/ROIFoIZgT5IKvUaF1JtwKQgq+86hbW06mts?=
 =?us-ascii?Q?UeDhbsvPTkf8gufAlEAcTn2V9pVAhHCQ3tGh528mhpNh6wNuQPHTHvsQxJWr?=
 =?us-ascii?Q?BOVnxWjbzxM06Lb/267njcnMUhhlhqqsYkVf3Oh+xRff4mEV93gwJsEEySZV?=
 =?us-ascii?Q?TvL8wiQFny9To0I8g/9pEDcLjSDyl+9nj7lh7uqdq0PwrVV+v8Z0OCbzl2+f?=
 =?us-ascii?Q?Ujqe+jI18nIFfTyg2InOmaFJLv144lnmHR3JVS7367Bv/yNsQa9lSZtSqLLA?=
 =?us-ascii?Q?oxmw/DhjGq04tXtFScPzPOaM8fMAosd7htqRlZBqRXGQ9rvoCciOBxBHw1wg?=
 =?us-ascii?Q?z5427XgPxhjPsiC2ve+x1rvxpgP9Ok7y6sFpKZUAWM6Z1T4aykxRv9Xbaja/?=
 =?us-ascii?Q?6h8xmk6hbmx1IrMIZ7LLKiF+N9jc3fJH5Z3gUl/8Eue1Ev7W3jUSAPhfAiiE?=
 =?us-ascii?Q?PKTgnmLekD4h9Jbo+d3zPbCcK9/AyLz7udgwLCHYkrCK3NqhKJN0JmObzJrp?=
 =?us-ascii?Q?/IjKcG6U42kOCaj4vxQuhVLUQe/KQxM+S27xRHjL7gWTsxd9ks09QKnThDsR?=
 =?us-ascii?Q?+r22tl4yRHAl6urBE163CU1SExVachhgTeSe9Sa8rRCXzyK3rl8t3Fc8KkhO?=
 =?us-ascii?Q?HGColgnd16TTNxxgE1z5RQrZ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+ijprOS9OjHdJm1WaOF6lXVhqXNvfqrvP0rOQvo4aYbyEVT8VZBCXQKAPhzH?=
 =?us-ascii?Q?AXR+vGsdkP4eno7Fw8/49bICJOieW8laannlwREmt4iIfxMltrXFBMkld8KL?=
 =?us-ascii?Q?PIpUraWXzq5FF8OH3TfvQTi2Sjov/2WwdRrk4yDX0fLNvTxOZmLltviEN8sh?=
 =?us-ascii?Q?c4j5HcBsLlMvXHgv3tdf9d1ddDa0nVuWB5YddAtm+s/qDJb1NiHM+2EV01jY?=
 =?us-ascii?Q?rDlGjjBAhd9rTf7POT95klDSt4WPAzCUIA5r0ZNq7c0+IMSOvyU7SbXCHXK4?=
 =?us-ascii?Q?P15ZF1jSMnETFAI5RHBsyq30nA3Rgg4afTUXmGzlkmSfr8fO18nIe3cqTfvr?=
 =?us-ascii?Q?nWlH4vlTxyY6z3kbIph/sE5muRwsNX/gdrxfOsd3Ua0N1ZkDjQoO4oWcJoQo?=
 =?us-ascii?Q?zfDeYYqW0TrHutG7WWhWJtijW/LaZoM/iy6/D0TRI36aKiL0eR6HPAaCsXMZ?=
 =?us-ascii?Q?RShNiQBihI1CchxDM/Wa24HGnkwpVkY5Vsl/lRkMEDAyZJE9z1OPDi2A3veD?=
 =?us-ascii?Q?MF99W83Bg3qLqjOBCEkQZVtf+XFed1X9u8Q/BEfxHR71+OI3lCZwdlZrT3MD?=
 =?us-ascii?Q?faYTiRJCwqLrwaI5pnwduPManViT5EGeaXgfW4ckPSDACpreKdNdM9ogXgW8?=
 =?us-ascii?Q?2o6otueVCx+qJR0/j8Q8UR1DuQYlWo6rhQpBqKXHl65XaG0HISGMgQEvNydT?=
 =?us-ascii?Q?vSkd4stpglJ9vqQC8IYCxB7XwpVBMUuWWw2eh+3m9S9qffTN6/c+agy1Qsco?=
 =?us-ascii?Q?6wLGTQUVWbgHjSjRq6HVIsYPI92YDs/5LRqqDAZ1ILVOE20P+Qe7mWyisRmb?=
 =?us-ascii?Q?gpmwKizys/+wdbFdBf6G0QrYCbnJNgHm56PPW0lYS9Sfnob7aBLOlMcDHirW?=
 =?us-ascii?Q?rlcPeZVlBy+k2fyPs/RjsrwOs2SzmE4erMZCbudVoFZ3NFyvkFNLoCf9Q0fc?=
 =?us-ascii?Q?n2Yd+zaAgXFpWdSRL3GwgvE+FHaUJw6ronvLxg5jeCA5uWcW19vxcBOVb27/?=
 =?us-ascii?Q?GDtmhoGE1jS++yipVHhYP6wzSa+hVrPEgPoI9ENXa3LAUoRrbFHWO7Dy+YLm?=
 =?us-ascii?Q?wz8Gt0IZ7jqpOsp2oYLL87p4q65jrB4ZGvpQDTgUwUoHbR6DbvjG/BkDrAyi?=
 =?us-ascii?Q?GHK4qeJF3u7gfdFIdkdlRVsZ1C7eKvbLf2sChfHwSeIVm3xgXhaNvj4SsHtX?=
 =?us-ascii?Q?vKkZlfw6AejQ4/WtDbGRiHDeWZcNxFRYN6zjhQlHAUtMjc1cQt0XhYvvlBI2?=
 =?us-ascii?Q?OYeLQ6w/CNaKtvoucCLPMNsIwoF0IqyHZ2TY55GeirARt2lAU8Jl7eleUP8f?=
 =?us-ascii?Q?YH8ZMTvzVqCT4DSkyAAT9IgONbSbWohroIxBSYeDP9mM5AJyAHxsH4I8yUV8?=
 =?us-ascii?Q?/18TsGiuzryQ8ux4Ccf63uwfsDD877Vjx7Uv4CrJH140y7w//YspuZkF04NN?=
 =?us-ascii?Q?Sqf1raFIGjfFJERkN+80QqN2h8WHvVAttvAXJxoo5owrTKleettjZjmRvK4Q?=
 =?us-ascii?Q?52z852/tvU2dUWCZmf5rsOz6qtkMk3hv//QJBnAGGYfLn+4FR94Zi/AcB1r7?=
 =?us-ascii?Q?H6+J0YJDSNBAgh6/F7M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdd32e4-7a70-4e2b-ab70-08dc72854eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2024 13:13:25.5683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQSc/rVPjXG5D5lCqkXjyhoJkBL0rnNa/HPH1oE/bvPguPoH2epzkbd0CdbxTJKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8673
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 13:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110323

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: den 8 maj 2024 13:16
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Marko <peter.marko@siemens.com>
> Subject: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
> dependencies from main package
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> It's a bad idea to add dev dependencies to main package.
> It's pulling build dependencies including toolchain items.
>=20
> The dependencies "were needed" because main package contains
> packageconfig file.
> This can be fixed by correct packaging.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-support/re2/re2_2024.03.01.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-
> oe/recipes-support/re2/re2_2024.03.01.bb
> index 192fe265f..6e5b32a94 100644
> --- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> +++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> @@ -16,9 +16,6 @@ DEPENDS =3D "abseil-cpp
> ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebe
>=20
>  inherit cmake ptest
>  RDEPENDS:${PN}-ptest +=3D "cmake sed"
> -RDEPENDS:${PN} +=3D "abseil-cpp-dev"
> -
> -INSANE_SKIP:${PN} +=3D "dev-deps"
>=20
>  EXTRA_OECMAKE +=3D " \
>  	-DBUILD_SHARED_LIBS=3DON \
> @@ -39,6 +36,6 @@ FILES:${PN} =3D "${libdir}"
>  INSANE_SKIP:${PN} +=3D "dev-so"
>=20
>  # Don't include so files in dev package
> -FILES:${PN}-dev =3D "${includedir} ${libdir}/cmake"
> +FILES:${PN}-dev =3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"

This wouldn't be needed if FILES:${PN} wasn't set using=20
FILES:${PN} =3D "${libdir}" earlier.

A better way to achieve that *.so files are packaged in the base package=20
is to do:

SOLIBS =3D ".so*"
FILES_SOLIBSDEV =3D ""
INSANE_SKIP:${PN} +=3D "dev-so"

>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.30.2

//Peter



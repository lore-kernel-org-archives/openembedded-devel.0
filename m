Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AAEC4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:53:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web11.15782.1699455216942591145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RW85WTHn;
 spf=pass (domain: siemens.com, ip: 40.107.21.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAtDWHUJAtvbxrZc4mKaNA5mb3g9igFTGHZQsbPKKpqUbE/ESr2SIow8JeYE4hmvFjzY0P4+8BO3rhFa/xIGAXFlfURIX4mLMcY+xjwaMYXyK1T7dGJjChwf6EsUTKdDHRR8SKfjl+gAQKy5uOmJJPAGHWkFaVDVFgPBabvzlElb1vV3E4FFiV1AFi68VrBRZLP9w4M26Rg34nMyHq7+vedH6yhBlHy0OrRBsJCmVTrdlIeY5VCpiCDEYg3muCp97jfS460aOooboWatNaAQLozR2Tvyss0pyE+5MJNP132yePl32ulFc4vUBYRuOY8ss0iDoSC8ejJHIzFnAIYilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xi6i8sDp55Y4vLEKQHkMEovnXz3Edm0wW+YDtKiWl8=;
 b=KgRPUlmZoouIqZFOaXNhylSVZdAVq9uNBr5hrZakORee/jcMup2pDPe7DOVIMFflttnsa/Xvyow1n7saRa6dJjTEeGDLo/OU0nzgeCX+R9JbISIoN+qymrF9ImFcX+K/x/P5CsK5TgDPOWzCswQEXDOg5/NtkQ4n23cwJhoY6AAN/yHwbOFpB6N65vsz8G2is8kF3PnbnBYcSBC25I81sgVHFNU55mYgCiE11sL/1YeNeys48kiYqi3x7JANvWefHYFlDnG712X5vEFgpslvJGr6EdvORrZoma8zz8az6ML5XaLdWiipZiFFhHuZnW8/W3E7gZT6bI9hNZ+Nhp+xEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xi6i8sDp55Y4vLEKQHkMEovnXz3Edm0wW+YDtKiWl8=;
 b=RW85WTHn7L9kRsdJNDXcDRvQgm1dVoF+3P9QP6bdnKQoQckCd53SFMC/FL0BOeg74XbJN/cPpmsrm7i2/iRlrjrDS7rg86zbrFKNglak8N7QQMhBaoBEe4uiLj5Q4l3V9SLfxT4+GCo3OP+Cw4VQMG1W0iBaHWvVN6HqtuEFSd6sJKn1uP9VgoUAoiaGKfzjRUG5w4RQtmvze8EQFU0Fc9jDbeBnIPUSNgEZXDSGuY/QAjWZMWpmurtj5ylZL1fOc8C1nWyFqopJiQqafxXAjx6fzFZdwr25fyEUWdMpNWnlsRuzTEjo45ZqmucL3UOqZsRX8XoZQ2MW9ljdUcpL/g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3328.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 14:53:33 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7f7b:12bd:48e4:8bb0]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7f7b:12bd:48e4:8bb0%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 14:53:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "samuli.piippo@gmail.com" <samuli.piippo@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "jpewhacker@gmail.com" <jpewhacker@gmail.com>
Subject: RE: [oe] [meta-oe][PATCH] abseil-cpp: fix mingw build
Thread-Topic: [oe] [meta-oe][PATCH] abseil-cpp: fix mingw build
Thread-Index: AQHaEk8uXTOdSvEUe0iG0geSOhX8F7Bwf4fQ
Date: Wed, 8 Nov 2023 14:53:33 +0000
Message-ID: 
 <AS1PR10MB569712676AD597C3A1EFC2FEFDA8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231108142307.1528148-1-samuli.piippo@qt.io>
In-Reply-To: <20231108142307.1528148-1-samuli.piippo@qt.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=812f6eef-6e77-4bdc-b119-9c666e1763e6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-11-08T14:44:27Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3328:EE_
x-ms-office365-filtering-correlation-id: 474d20ec-254f-4da2-6c40-08dbe06a7aaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mwrRTxfBPr3y8Y6S8igxVuBRpPUPAqTVxr6xgYjb4kbo8ure+TPdbooQUXYii7Nk2QAFlIczsy3iKcCupcrIeTDpWdgYrAyQVnd2j194y6CeEuayuVOrq7IhG3P+kZsGqloFOu1leU1juoD8FZW/GUQHhsZy/btDFv+hjKVzajrGGfxAuMUz5l3zwp2dCLh1d0goC18k+D0/hVyC8VjefdJKTb/ODQNYq62efBeGZyxQTmGQNwKT+YFTh/8VC+xXUIhmHEcPWIE+VXbEiXtiUrxlr8qLTGg/fxEH9pmgkUl5gLum+gKiKS+B3sKbWKN7OldPn1o2RmJ93AkaaGadAU3Y3gMHvpaMKFiHYizt7FhDV2VUza15QmM2Ax9eCKS8Fzzok9Cw74oYwlXKM7ITMf09pitAHrSIRr2Wb4Zzkv4hr5rPhSE5AB5A5HbmtcCdq8GhJ4PVBIJeO8qyKVMOvM6vJCCjSSccc9PDLKmm+U3nvO8OxAsZbueExzBNFqfr69e3d6VY4cyE2aPC7f+vQagpJ1xeTDvn74yxdqa+zg1+pk5B8JS2cnOKjetbrfoRE57QAxefCQuRei3gprQuXzPT0tFQBoPa1y6aisA/fTg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(55016003)(71200400001)(7696005)(53546011)(55236004)(6506007)(83380400001)(38100700002)(82960400001)(122000001)(26005)(9686003)(41300700001)(86362001)(2906002)(33656002)(8936002)(8676002)(4326008)(5660300002)(52536014)(66446008)(66946007)(64756008)(66556008)(66476007)(76116006)(110136005)(316002)(478600001)(19627235002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ldgmMiMJN9MeiB5be9Cvvcnz56ZKZJjH+2YQyykCjI01EEVkX+oogaucejWO?=
 =?us-ascii?Q?OCVqVr+n66GmLJDVtCqg/unU25sGc/Iq6Mfm7k4DJwoL3u690FYBj+/6/QZw?=
 =?us-ascii?Q?5eki3tk7HvTKbjGBuP8aQblk5tXk7eB8F1nORRy/1aBxXhimlGyHZcIh0See?=
 =?us-ascii?Q?I0S6+eQJFUNz28fpGDzaNCJ5Jw1ySZZUsFKxmC7BlRmdTK/qg/+BOEvpyz+S?=
 =?us-ascii?Q?Td/pAVoq2yWG2Dgl2apMROZAkXzvJAY/nr6qFMNWHxogZtS0yeXvrcXNEecD?=
 =?us-ascii?Q?pzD980tHMf9tQ4YtvnDsdJQVVfKMjAodvVgfvIc1JUTZ9yu7etf2Q+LQiybR?=
 =?us-ascii?Q?zEy3HI1BF7u6Z8GXbIF+JN+PDF/XeRGCKqj+jyeKktonZOU50tQvaL6KVPAi?=
 =?us-ascii?Q?h3/+mAyt0VfeW0Y4KgDivVDlZ+ilk0BaptaobttgoHz7KrrOlA5BegzMiG2j?=
 =?us-ascii?Q?t5QtoX2gOp1wmX7fCS8Fcpw4whcrLFkhxvg1hFJxLeHwFQAJ0uNXUjNcOxnz?=
 =?us-ascii?Q?Jv6wqGiGtqwP+XCctzcUKMIOU/3ub5DKneVTatxmDsGGNZyXSg1e3GtOYrGL?=
 =?us-ascii?Q?UwBcpEhFKAkLa4xmrKbygMxxg+3V0WcmliqfPuAsTlMxzkgVOXuKUhLb0sej?=
 =?us-ascii?Q?0PifCR5hjxvkBPmhsk9R5GAr7HEET9k2qlV0fA2mtdsLxxClmPKlWFMm1Aj+?=
 =?us-ascii?Q?liCYaM6XURTThIPxuAZLZRXRFvQUkMbJKzIwtG3tF9Ed3x8Mogb03VVqvJ1+?=
 =?us-ascii?Q?3IgdTtMNlnUtHRAUhGaMM0FKX3G4bL1ECBN2IqsibEyzhWDVuARB6qpd9PBB?=
 =?us-ascii?Q?JagJR3GZr8hZi+QKvDra73z7/0t+uaw35A6JnS0DIrg7vy1QeFoYXyG/5HSb?=
 =?us-ascii?Q?qq0w9547Eg9YvVawB2yJhl19GMTAszYLV6DO/8OMq31pZoi9w/dgYOb8WXiE?=
 =?us-ascii?Q?sIpxzZ9QZR4C1upai6utIYglsh8ODsVyf7s4nndxKnR28dChxEBKX9epyJQy?=
 =?us-ascii?Q?qnGr4wJR4n6lXEp5VORKEFtQDb7JssPBudfUQNkSTOdLq8641soQTHGcmX5f?=
 =?us-ascii?Q?/HQXDKR93H31RNtpOBFCxtwvZEq5sNPp2cETpjlTiE1w63e6acGWFdj+Al7S?=
 =?us-ascii?Q?zJnUbMlH/4P5r3W/G3hpqW6z3C6eAm2F83/GXPoVEv1JCMDm0ziMxGDRVbKM?=
 =?us-ascii?Q?wtzAxMMackdld2SKOg2CMOr7rxBiifxGRR+KzoVV0sygoSFm9QWmFihllDIk?=
 =?us-ascii?Q?qCQG2eaDrr/WTo5kkWQkhbDIjfRmhwfsqnE54uDxjFgMB+1f8UWF2nXEFhbE?=
 =?us-ascii?Q?sKGa/rRwAkznYyrfKV4R7zIQh15eeRKLURnvXd1X1lcv58sWG4o9zt44j7/T?=
 =?us-ascii?Q?kICTquv3VGybcjiJtdiNk/SJaWTHGhx9UIZTo2JPgrd3j7rp+WXK4Nih5fZ7?=
 =?us-ascii?Q?upB/zj2cqgmEJQsRUy/YhJ8GzrfHEUIGo2WqaVfsWNFmd0UsPvrFGQoE5ZR/?=
 =?us-ascii?Q?vUNyaK4YCruVzN2tcTJDFlWHSSDuUzntHnU/bJiBrGe4LWIqzGqLYNtBMjYs?=
 =?us-ascii?Q?b2vtwdekM00ytr77a5OjG9vXWlBzRrl8dWJVhGkM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 474d20ec-254f-4da2-6c40-08dbe06a7aaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 14:53:33.2421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J6ZX6hCa0k3gn/Bh8jWCXLVeuua4uORtYGMDOx4sCGg2JduDQEcl5O8TKU77H+2LviKrhfQ7Xtd1uLDyy3CTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3328
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106479

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Samuli Piippo via lists.openembedded.org
Sent: Wednesday, November 8, 2023 15:23
To: openembedded-devel@lists.openembedded.org
Cc: jpewhacker@gmail.com
Subject: [oe] [meta-oe][PATCH] abseil-cpp: fix mingw build

> Add patch to fix mingw build of abseil-cpp
>
>   undefined reference to `absl::lts_20230802::synchronization_internal::W=
in32Waiter::Poke()'
>   undefined reference to `absl::lts_20230802::synchronization_internal::W=
in32Waiter::Win32Waiter()'
>   undefined reference to `absl::lts_20230802::synchronization_internal::W=
in32Waiter::Post()'
>   undefined reference to `absl::lts_20230802::synchronization_internal::W=
in32Waiter::Poke()'
>
> and include bindir to recipe sysroot to fix protobuf build.
>
> |   The imported target "absl::log_severity" references the file
> |
> |      "../nativesdk-protobuf/4.23.4/recipe-sysroot/usr/local/oe-sdk-hard=
coded-buildpath/sysroots/x86_64-w64-mingw32/usr/bin/libabsl_log_severity.dl=
l"
> |
> |   but this file does not exist.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  ...workaround-for-MinGW64-build-failure.patch | 28 +++++++++++++++++++
>  .../abseil-cpp/abseil-cpp_git.bb              |  3 ++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-A=
dd-workaround-for-MinGW64-build-failure.patch
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-work=
around-for-MinGW64-build-failure.patch b/meta-oe/recipes-devtools/abseil-cp=
p/abseil-cpp/0004-Add-workaround-for-MinGW64-build-failure.patch
> new file mode 100644
> index 000000000..79c2ba7d7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-workaround-=
for-MinGW64-build-failure.patch
> @@ -0,0 +1,28 @@
> +From 2f198d4fd8e0e66a2cd7ef53f62c8c9acf356803 Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Wed, 8 Nov 2023 07:18:37 +0000
> +Subject: [PATCH] Add workaround for MinGW64 build failure
> +
> +Add extra include so that _WIN32_WINNT is defined to correct
> +version when building with MinGW.
> +
> +Fixes #1510
> +
> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> +Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/15=
64]
> +---
> + absl/synchronization/internal/win32_waiter.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/absl/synchronization/internal/win32_waiter.h b/absl/synchro=
nization/internal/win32_waiter.h
> +index 87eb617c..517829e6 100644
> +--- a/absl/synchronization/internal/win32_waiter.h
> ++++ b/absl/synchronization/internal/win32_waiter.h
> +@@ -17,6 +17,7 @@
> + #define ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
> +=20
> + #ifdef _WIN32
> ++#include <windows.h>
> + #include <sdkddkver.h>
> + #endif
> +=20
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta=
-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index 5003187d0..3e4820642 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=
=3D${BRANCH};protocol=3Dhttps \
>             file://0002-Remove-maes-option-from-cross-compilation.patch \
>             file://abseil-ppc-fixes.patch \
>             file://0003-Remove-neon-option-from-cross-compilation.patch \
> +           file://0004-Add-workaround-for-MinGW64-build-failure.patch \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> @@ -32,4 +33,6 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
> +SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D "${bindir}"

You need to use leading space if you append.

Additionally, what's the reason for mingw32 override?
I'd expect the binaries to be required (or not required) independently on d=
istro.

And finally, is this correct thing to do?
You should not execute nativesdk binaries as native, you should rather add =
dependency on abseil-cpp-native to recipe where you have failure without it=
.

> +
>  FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
> --=20
> 2.25.1



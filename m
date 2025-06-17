Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225EDC71155
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 06:50:59 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.37])
 by mx.groups.io with SMTP id smtpd.web10.12319.1750143057637674187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jun 2025 23:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesas.com header.s=selector1 header.b=LBt6cOHV;
 spf=pass (domain: renesas.com, ip: 40.107.74.37, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeIwPEQIl5j+xR4Nu9ep14DmzvxowdmxoqH/68DZIdY+y9jps9eNIs6kquQ8U3gL2H2vQgQOaL1sqs4LvUEEBmBFeHwhBlEt707ALRvKquP/KW/Ka7a5qsnpIsJmHcgj0ceAGu+XUrBFRpzO3yBEjwIW69WSENUsme7Le5rrGkEuHsWDYnVOB0sMS7pU9k/fhr+b4T/zHb3z8Oxc2LVk4Aqp+l+IDtLOmVcZcQs4I+uUcJQUs1jkCGK4PoRkoMBwauDB9rvb0sf+ASHCfWGWYRgwqvJGiUF/4PNYH0SJQJ4IzioQYst24eyPWYA0m5wRvYSR+OAgl26bDEhApfPEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y00yalnTXGu0xdjHAXir1NfJ//0c2IV705vbe6HsO/o=;
 b=oaIGOeJfsTJjoUFa9Jy24E8SdUjoXjZus+fDCuGgAYqZZzyVWQ8GNK5DVJhDWgdgXF6EoMX/nKy8EKGwsQ2P0aD/xRn/OEUCXVicTanGstb26R4Jj7+A2GgXOXv4kEk6fZAo7zkkGgY0ykzByfy2FkhDu7cj41QTsUXO4/hXP30wyBj6KQqljVVnHkNsv383pG58WJSzPajMk8i/g3gi2ouCXOg9ExK24efzB+sja8BghCL02IXf+ADTvflrfK5HXD8qn2rz7PreuS/+1Nwy+TDBU7gQXcw86Um8pI79spHW16tA/GOu7fM9CvIJu2My0PxbTyM8/1npasfQgKTvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y00yalnTXGu0xdjHAXir1NfJ//0c2IV705vbe6HsO/o=;
 b=LBt6cOHVqht9zl5efZm878MkBL3S+BEdsIpgtBCaF/bTy8nga4jlMpI3rwGah/2gBKL4+WNtLkb58+1ZP9NOHkhEsydDpKXAMuhMT5q5dkUiAx+oGdaQiH1yfYJHv/5nRaK7JEc9IxPZqm59okzdub+7IvjAl+aiTh3ZvU0FXWg=
Received: from OS7PR01MB15130.jpnprd01.prod.outlook.com
 (2603:1096:604:370::13) by TYYPR01MB6713.jpnprd01.prod.outlook.com
 (2603:1096:400:ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 17 Jun
 2025 06:50:53 +0000
Received: from OS7PR01MB15130.jpnprd01.prod.outlook.com
 ([fe80::2c4:bb3f:57b4:5812]) by OS7PR01MB15130.jpnprd01.prod.outlook.com
 ([fe80::2c4:bb3f:57b4:5812%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:50:53 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] smarty: Drop allarch
Thread-Topic: [oe] [meta-oe][PATCH] smarty: Drop allarch
Thread-Index: AQHbydGJlvpwV08t0EWj9RpD1xBwBLQHFBCw
Date: Tue, 17 Jun 2025 06:50:52 +0000
Message-ID: 
 <OS7PR01MB151309CB28F4D907420E19720B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
References: <18415ACCB9C1FC11.11990@lists.openembedded.org>
In-Reply-To: <18415ACCB9C1FC11.11990@lists.openembedded.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB15130:EE_|TYYPR01MB6713:EE_
x-ms-office365-filtering-correlation-id: f75211a3-3f4a-4290-63a9-08ddad6b4d83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?8vquBByqp6ETDKnqCG38fKCfdER7qZyVgCo01NDbEIAq2RHUST1qIhLM?=
 =?Windows-1252?Q?R0EY2ba3gaDj/eeggceb+3rLMViVMKpbICV0/rpi60rXI9wYzGbavLsm?=
 =?Windows-1252?Q?ryiL2Rbdh2RiXwDgZTUQZwmpPkx0UZc1Fp+TEMfbgNOfjsHgkhLRy5xt?=
 =?Windows-1252?Q?pdhR/ZrR8Nrv9oEnx5me+ySHOrUOa35Vwha2S9NeMIuz3wW6NgyFQ6Zd?=
 =?Windows-1252?Q?eoWSZQHbmt+b/UzsuZGdSdHc2Obq96FyhHfpYXzXkiOUu14JD+qVAa9j?=
 =?Windows-1252?Q?rhPqZUhcZlygKS/9qPq9vuX0tQLx8vP03avmFUOV2NAtuwxhFM3ro2ay?=
 =?Windows-1252?Q?Z6SqB+/Y+AHB7DbQ8il64IMP9gRB5GvULWjAwf2uSObb0Jm1RzKr8Jov?=
 =?Windows-1252?Q?awesA74EINVP8/hdEsXnkBtPNipPrz+fwmYFSvT0FR9ovsQG67xYMIMd?=
 =?Windows-1252?Q?JILRhbz9yWJSQTKO+gicdHM888vdvtomYkk8/oxTYx/wImz7rr2LdQg5?=
 =?Windows-1252?Q?P0pozWE82Jdzjl+OmrdxlPUFLlxgM6GnRObYjNBCeDfDG43YD54LsGKr?=
 =?Windows-1252?Q?c8tuXWvmqIRs35v9201INt8vKg6mQqLr2RkTYdnQGqFlvgg5+qKcH1/N?=
 =?Windows-1252?Q?9OWTx0bc+6rcGhNvRuwg5ijNeE9Kvg/oST1sfs0nS6EAiJihXzh1Yiwy?=
 =?Windows-1252?Q?74kcczm5I30aPgIYWtE0cbsgwAeeNy7ayPKhdOc1AYnthnJGsIhHtaOa?=
 =?Windows-1252?Q?OWhNgc4q8yN3kiUh+JaM+AsnmWZdnOFgj8p3ve3Lyip4xmSXsSEmWf1r?=
 =?Windows-1252?Q?zMrLKl+LpBGbGBoGnVpIg56QmZngPDSjGXEg/cZWx6PCP/PBU9vXilYV?=
 =?Windows-1252?Q?I2TY661egGLaevHZCqLfBDT1HGZNrhFS6I6Jdm31BDG52G7D3ZTbuhXw?=
 =?Windows-1252?Q?KENoaf33QqX15Pb/tA93SRcoX5BDveJ6D4YdQXTm728H+HwD+wEqKp+l?=
 =?Windows-1252?Q?CC75Xn6L8qiQ8qXNRsifcoiz5WfOKHZoPQb/7xLR0tixlmbhbdIN40bK?=
 =?Windows-1252?Q?ETOYctxhsS3xgTAbNDg/6QiTbzgiuh6KXbdTvu3TnEWoz20+stUv0FTQ?=
 =?Windows-1252?Q?VaytKOjep1uI15It1Ta9cncvgWEpJk9WVxXtVIchXtZMdStKaNYDQ920?=
 =?Windows-1252?Q?imC25d83I02UL8cjZUfXfDNxG51bEH8+HvJXBwAdoHJywTedrPinFG+a?=
 =?Windows-1252?Q?onFNVQtVJlkYrLyh9aM3EmCVYdvwnzdP56k+rI95xyHQWoX64DbFRL10?=
 =?Windows-1252?Q?NND3UfBrGNNVuD3bjBXCt4elpY9sRMGb2vxI20wB4su6p7zL0laZiFsl?=
 =?Windows-1252?Q?iTR3TzSny/vTmQID/K5nfk8Sw7YARshgfx52fYHE350sYfu78LhRiKeA?=
 =?Windows-1252?Q?Emj1Y6z7AeFUDqbKAv4dgxIApNO1GopWBCyc7WLkDYKvui+Jhjt1AqPc?=
 =?Windows-1252?Q?Hr000CwtQhgHW+xA2llMfFkYRAvxlThi1UB1Ovol7D6RLYw/3ceTTfDL?=
 =?Windows-1252?Q?x+rNDWOKkXv+LA6ZR5bv/+1xHXcJNuE4Jafo2Q2ORi76uanTT9/z8SVj?=
 =?Windows-1252?Q?HyQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB15130.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?wcp5kvfwosnlP0iff4EcEWNS2wtNWAbpXpdIQL0htyK/+LX7en/CkHK+?=
 =?Windows-1252?Q?udGeBxEuAygbYwmD9EpLbr161/sKA1pOiChj21Pz8Y9V6n6B7tlJR2as?=
 =?Windows-1252?Q?Z5hrTcbUKGZthtOhBfmwJ39rFKWvaH39Mc7Po0JbLHgZ640o3O0+vGUo?=
 =?Windows-1252?Q?Bh4bvoi36CUtnTheJAHkP8obix+MHHUxwTgl6hXSahOgCIGatf4oZK0A?=
 =?Windows-1252?Q?SDZ0JCCfZ76EcQHS11QtzxsJbRYEG0PPgkO2Do0xImIO0PvhMUoAjrKH?=
 =?Windows-1252?Q?YNU0/FoOpIxoB+YX2AGAPJv+ZHYCy/2jSKLzArPl44Z3krTKv1iM2P1o?=
 =?Windows-1252?Q?iyycaz4bmVcn5JwebwgimvFVhGoyUNZu6eV+AV6z0+cURqOKsTs970ZH?=
 =?Windows-1252?Q?ssWcfPbORToosHXdW+n/FThZosxkGvZAvIKsL3heN1DbD/AszvjWn3rk?=
 =?Windows-1252?Q?Rzvm6BND4WQqipY9lZ9o7xEi0WFSzY8YOz/34+M9WesfwK/c6Qujjz2j?=
 =?Windows-1252?Q?nCIYRKLIPxBwVK9jdPt1zTEfDmQYF+5/I8FhQnYAO80eqy/wRl9EunCV?=
 =?Windows-1252?Q?NC0cm1nKxKem/RsFv9gmJ9nUN1/+yLie3G1fdfYja8GzQeRyKicClCq3?=
 =?Windows-1252?Q?7hm2ZXRddc22tBLXxjJziz7h99AebIMwINQ8jSWVz+YJckeDfcl73XYP?=
 =?Windows-1252?Q?8bge13C1BwwDwUL/AeSjNWO74Y9IcXdfhvXA70je4wLT+SUNCHmomjz8?=
 =?Windows-1252?Q?Bgr/1FqDrawop5IGGn0Bk4eYaDGUOTMdv/mGqVrPcaUuZhHRdsPNgVK1?=
 =?Windows-1252?Q?0m/WhEDr7wNsTZzR1RIFkQU+xUgZeqroE2kuxCG+UsXYRF8QtfjxKEMF?=
 =?Windows-1252?Q?W8hbZ28Yu9gkAX98cbVcaX35S4HJyUZFi4wIzrdBi9Y7ALgrMlAA4al6?=
 =?Windows-1252?Q?2HeTB5Y4JDQl5fpIs2TB+QMCzPYTAaJvof5pwta018+pZVrHv+XgFQjw?=
 =?Windows-1252?Q?HfzNWReTeM0c+mM9g9yus900Mle4NOq/79IPDifShWJ8FLHiJiGoJpnM?=
 =?Windows-1252?Q?YeIscmDpwiC+e7gVu8C8HQ94NFCFp41DRwnhna30Bt8bEDcp1CeZjeu8?=
 =?Windows-1252?Q?bWZ61zACiVgSTH90DFHalJEqsFAHh9k29ENFofomdRwxcnqHzAVT61Vb?=
 =?Windows-1252?Q?Dvm/CikPN1RZ/lnPww8CnY44OF/ZM1wVA5A6D1vu4MpQK6ZACqStazXG?=
 =?Windows-1252?Q?62A8g6omKzMKtxPAeBeoJmTz2x7xGUWMDd9gQMyjfQ8toj82bC/pRbwO?=
 =?Windows-1252?Q?UqBmPhaE2qgvKP/hrHUahF4OnTbKZz0QcDq36ywLgy/nlmDAQSmJPnuf?=
 =?Windows-1252?Q?V+RKOrdeMBNM2HxPtT10TBRzQgXSX9pf2es5QI+RVBSUMFAgTAy8SmH+?=
 =?Windows-1252?Q?+uk0RA5VVkySMWzTaUaJcYim1Tuk9OToUUI8PlorQ+cBU3fMw4EmMS2R?=
 =?Windows-1252?Q?w4AxmTJRvmTpG2saFvIRhX4uj90su+8Te140yfozvUPqo8aZd6cNAxe0?=
 =?Windows-1252?Q?113fow/ktND4rvoy7gmozyV56dMRGPAxMwgllRDyKxko6qhkr4f0kJCS?=
 =?Windows-1252?Q?q2Kv4kqFgqnDvSjkUf5i5pSBeDhILzQl19fB3QniUjfO3BBiivuUjHKU?=
 =?Windows-1252?Q?jnKsjrQQXbXUWeIotfmHETnlk1pfgB8UuQvnha35/Y2p4UKz8moToA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB15130.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75211a3-3f4a-4290-63a9-08ddad6b4d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 06:50:52.9355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTShfSL7iTB5uwS0ZV2SjeHqmCKlywcfbhh+AVh+TWypE674ZMFAPoML5od5NBGySF5wWeftSYFUWL4uGdtzNm32l19ocBT/YG67h+X2hww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6713
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 06:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117919

Hello all,

> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Chris Paterson via
> lists.openembedded.org
> Sent: 20 May 2025 22:53
>=20
> allarch is causing issues when running yocto-layer-check for
> test_machine_signatures on a BSP layer that depends on meta-oe:
>=20
> bitbake-diffsigs -t smarty do_package_qa -s
> 416787047ca76d43b094860cf617234f957d11895e7b7be20cbe9203289f27e1
> 1e482ffc1ead26bcd1f89d4dcf92e497dd6223933941b3ec6e483cb0072c9f5d
> Hash for task dependency php:do_packagedata changed from
> 6bfffcbbcd4507bd0be6cf3138583b92d82e75099c13dcf58363aaa938ed6f9a to
> 24c5373ca06af905e35fa48b7ca3477283add52fc54348fee9dd5a28efd1bc05
> Hash for task dependency php:do_package changed from
> cc9a8c60aeb862dd19eda30bd6ed137beb2ddd8b5b730a8b996fc58681a2ccdd to
> e8d7465054669b47fcf933f060e1fb69a3871d1d1e3d5b9a9610644edd17d2a8
> Hash for task dependency bzip2:do_packagedata changed from
> c00269772615a22d528f4205b4a1ce88a2325c9acd08de20445d20e22e255b1c to
> c3629ef771a2b92ed5eb9c36cffd96557537542e2bae0568e191225af0c5f4fc
> Hash for task dependency bzip2:do_package changed from
> bf71dc096cc85a6f6cdddebb908709f47b55ed8401a7f56fc7810484f8d0a226 to
> 3326e837bd452b74e32ab6b4f96fca7ed69e4d5cbbdd57acc6c9325201638cc4
> Hash for task dependency bzip2:do_install changed from
> 9e253b0c997975295046712d52a305e50d73148a00b6970aa39d5e548d66dc91 to
> a78a2933308498a16e713a934c1cc59480d5fd4c8bedf6b055c2ef6608836f78
> Hash for task dependency bzip2:do_compile changed from
> b515ce5b36cc71307ce02f27a4b5187482acfeeddc74e6679c60ebef46ab6e1d to
> fe7f086dbf72dc1924bf9b4f7ddd54e519627fd7782434b50f67b245ce72073f
> Hash for task dependency bzip2:do_configure changed from
> 52680e9abaad7c7ec1ba6098f965bfd991924a5ce1a57db73725eb8917cfda31 to
> 3395d5acb3b7d42a4ff2cfd010d4d05c0595f91d36f8d9cd9888a367987ddb4f
> Hash for task dependency bzip2:do_deploy_source_date_epoch changed from
> b3cb06d6eb2fcd84f94c4f66c8e68dcb4f277622e1e3e5809fe2ea02ab589b31 to
> a6eade80d249c35f50b8b4d7ba5d72ccaed07068dde6529a5f219b918a7c5294
>   basehash changed from
> f275277525924e477f47fb1b0bd4eb782ef2818fa2bd930159cd5ae5960f1e91 to
> 7aaec6b4c1f6b5ce5726d99f3a040678c1e49a5aa6f2f22d28503563b8e6fb32
>   Variable TUNE_CCARGS value changed:
>   " [--mcpu=3Dcortex-a57.cortex-a53+crc-] {+-mcpu=3Dcortex-a57+crc+} -mbr=
anch-
> protection=3Dstandard"
>=20
> allarch was introduced to smarty in
> 0f33416ad038 ("smarty: update 4.5.5 -> 5.4.2") which was first introduced
> for Walnascar hence the issue wasn't caught until now.
>=20
> Removing the allarch inheritance fixes the issue.
>=20
> Also remove extra whitespace after comment.
>=20
> Link: https://lists.openembedded.org/g/openembedded-
> devel/topic/issue_meta_oe_walnascar/113168928
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  meta-oe/recipes-support/smarty/smarty_5.4.5.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-
> oe/recipes-support/smarty/smarty_5.4.5.bb
> index 7072641d4585..37336ff5d70e 100644
> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> @@ -18,9 +18,7 @@ S =3D "${UNPACKDIR}/git"
>=20
>  INHIBIT_DEFAULT_DEPS =3D "1"
>=20
> -inherit allarch
> -
> -# `make clean` removes files, they can't be rebuild with `make all`
> +# `make clean` removes files, they can't be rebuild with `make all`
>  CLEANBROKEN =3D "1"


Does anyone have any opinions on this patch?
Have I missed a step in the bug reporting/fixing process for meta-oe?

I also sent some related patches on the 22/05 but I won't spam the ML by pi=
ning them all right now.

Thanks, Chris

>=20
>  do_configure[noexec] =3D "1"
> --
> 2.43.0



Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B183ED116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 15:05:50 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23541.1764601546183119855
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 07:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xuJf+AF8;
 spf=pass (domain: siemens.com, ip: 52.101.83.63, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJoLpRS5T5ROw/Se+3Rbl8gwW2wilgQr3JC5X/CSX9I5SnYwU/7tpVdZhWRlmtg5sx9MxenwPDWgH2Zr9p/pmFBz0yyESNeHHqImCBcDw6tabZOogXAXF6xo0BAysx+0njIhR4YH+0QyHcAC3atyUiGu04af6bvkjKPQNrJa/vb9byU5ZG2m/DEt0qAgS6txbcV8P9Sm/OS46YM9GUvptc33kuUPJaAFTjgeXM8eY92IJJbFstNDV932+KJPWjdakw5PaZPtXbsGP84nq9TiA7N5MlNyQT6GzEAGKsiorY4Uuv2qmulH5kChV1p96t0GPTjSwvkuLTSdG0sRw+YwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjKWOX2z1BXYzZsFfnnaude0KakTr02YY/8iLxq77iI=;
 b=FoIxqn5kGl52o4nXc8HmTCT0nRdb/xXwFzocRRzeBk6wxcX7mG14RIf8Q4yz3S2bXSyyvFvz1DVNLksU7b820P22NilgYv4HE7fqY/M1ll5uVhqhLuDiTodLoZYVOKU0HfqYlKd88P3w+QFvgAgx6nq2VFNvAlMvNHT3w6XMaPQ6M+Mh+x2pQe9NGd3uWT6jsn8DLc0agK6D2/rx8vTBfZVWJuBuZGfE1uHLd4AlEgRNSEJXV1YidVlKHk8I36jqfrPpz/861ezR71f7X9hGPC0r8+6guBj/BqceokL0HfRv0Br3S4DMu7pX0NPD3v0UQdQK5NUCZHDfHcw82n3DBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjKWOX2z1BXYzZsFfnnaude0KakTr02YY/8iLxq77iI=;
 b=xuJf+AF8mHIskXAQO3Iuu26IWrHZJd4cyginlYkRhpVy/mdZREQ65YX2c5hj7n3yEW7YILCsbQyO6OJG1X9FlXrRjgPcsV1Kt01vSbKBm0ap7lL9ut4PWlMsTCne+U/tbV73xCcfoisDLjG8f+wSVCJc0UrQjxmREetZC0vSoHHOrZx2oPgirZUAY5WRJlVcANCUSc/vtHIlFaxE0wMIQpNPuKdRBfRbl1rYEHu6qIreMJpRFFDqnq/4+LbB10hjktEzxIM1KLSixr00htCvJ5M3A/HCI73MS9hE0oOtAZKraeDs1IxGXCOHoZL3taFB8cIxmXXPEQwuXMxY2fOSLw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AMBPR10MB9526.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:736::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:05:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Mon, 1 Dec 2025
 15:05:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] CVE report - master - 2025-12-01
Thread-Topic: [oe] CVE report - master - 2025-12-01
Thread-Index: AQHcYtGSl9Dpv33ag0uwUnokrWzkXrUM4fPA
Date: Mon, 1 Dec 2025 15:05:42 +0000
Message-ID: 
 <AS1PR10MB5697229B54C0A0BFE4F906D0FDDBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251201144820.2687367-1-skandigraun@gmail.com>
In-Reply-To: <20251201144820.2687367-1-skandigraun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=164e29f5-8a4e-424c-9ce2-70339b152982;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-01T15:04:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AMBPR10MB9526:EE_
x-ms-office365-filtering-correlation-id: 04fe2959-be4b-4921-519a-08de30eb18f3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?mRXqzwD1OLFouLdhCxBdnD2xjIXO1KYCbwfVvH/F6/mTykJYGbBjsKVopPgq?=
 =?us-ascii?Q?ITfTUg02tlCODCr5VRp8+DCBvsXqNc+IVFDxnxRpV6p70gPdwoW4AZV3rAZc?=
 =?us-ascii?Q?YmOdu0c0vx6t3B3q11qbd6iXkw8RCbuoiDygDlglggmmKFYmIKtg58ljmoh8?=
 =?us-ascii?Q?5CrlJw9+vpFm9Vt7VnfL7Lmjj16UEOMJg9rJvlK4GBB6tEGxDI6isPweUzrg?=
 =?us-ascii?Q?4RPytL5KcgTSzvSKOyOnVVneXcCJoZqAglzoBcxo83kVOjJ6NEFOd6qtulql?=
 =?us-ascii?Q?kkNSaMJbZoD5VAPKLhwFUfkaGe3uxIqtK4BtCsZ8c1UWw/scioq134in0xyZ?=
 =?us-ascii?Q?uN9gjarYTTCmGqqS/aU2IymPyWPqQeMUwOtRX5fvAW/ER01ycRETSUGvbLzn?=
 =?us-ascii?Q?iolI+lzrB4uoPQyTDWDtDNvsn7V4lvVl7Mp+CJqAjQUqrGLujMFmDsdby93r?=
 =?us-ascii?Q?WV2KtNiZaZJ7cWwyDR+cPdclzFqufRSY8h8aWlLhkqdgZqbiGVn9G4frLRMD?=
 =?us-ascii?Q?pUQCVeqC9R6YfyGavNObpf6o28GS9O5la62P7usw1xBo7AljfsdPYGMvD36H?=
 =?us-ascii?Q?b63C+9Rp1kTLxp3SfyNYUJdr5ByxdEtjgrhA2UcxfrByEIPz1GbgvZBeT4eY?=
 =?us-ascii?Q?9SCE2WsvxR+PaNHgQRcR5TZo/X5eM/glBp5lq8yWF3kghB1nACvVpEz54bwQ?=
 =?us-ascii?Q?TsGakKFZ16CNSZ7z8juaXow4+mYDNLdBmkNDkt2vqH6xM5xms4hvTHdTbqs2?=
 =?us-ascii?Q?IFgnAK2NWmMshDk2K3BXAbUR2oPb0+z09CgJEvdnd8A7y9Z2KcZhvxjfJxXy?=
 =?us-ascii?Q?YYPcghFb5uE/ImrXdjmZbWn9k1qPU7KS7kp2aabqhqEwJJzkAzQHpN2KpWLS?=
 =?us-ascii?Q?HpqcfVZYi3XoOL/z+p9M93Th/g7SDK8Yl/eX3/z8VO+jk/oSOSdMHaUOaQgU?=
 =?us-ascii?Q?Js6LAMNvxR4sRM6dRmFtT8tYy9u2GxLsAjHeplf3Riao6WEAzVCl3tnU4IIx?=
 =?us-ascii?Q?ZxSw+kfsrgBgV6zE9MUia0wifexMxobRnK+qjH6McYIYQjWq36PpWIxDMI0K?=
 =?us-ascii?Q?VB/p41tkY5kBfjjNW9TrBJ+x6stu5tTGlIxYE+Xejl+5N/SxYwcqsghmx2q0?=
 =?us-ascii?Q?glqA2R3oK284Ei6NHPJxQg76oLIrssfj7+rhDrn7zcz/cW086oG/BUDJ3/V7?=
 =?us-ascii?Q?N/d3Xf97qHTq7GRAlB0rX6Ovmt6bRKwcjRpGYul5k3KCRASWgv7H4aHJo3uZ?=
 =?us-ascii?Q?hmfSaeak6rhlWm0MHCSD4agzXeyew7nBXq7xTsWk3u8+unTuomo4kjbN/KBn?=
 =?us-ascii?Q?YY5qJWnIv4cT1fopTVpjd/gqMe4a9JLGNe7fUdaOz6xOwgixbLcxZ5s0o4Kh?=
 =?us-ascii?Q?AFuTKLiEgcYZVptmLd1W6kemHgMsSUKFAKY66sbRUzskl2GTUcMWr15cBAuj?=
 =?us-ascii?Q?w4wLC16XYgIxjeiX95+pmlOFr6F54CbF0c0ery+P7A5G1R8jjNxZvfucKKFW?=
 =?us-ascii?Q?dKKO3gEiCtHWjqDBb5vSdzfU8EDNcZnU+GgX?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0WtBBk28SJZ31Q6o7XJYVNLY53CZy6mdJfqQRHYI01GtpNk+wZx2j+lqzwko?=
 =?us-ascii?Q?DZaCvn1bpKZplPhTHfWOirdftH3+YVXSGV3Z6TfCH3eAM1XLFp5+fK56gVYY?=
 =?us-ascii?Q?CsdW37AXPchNKDkWI5tNoR15tn2vNit9Xm0hs+4iElwJIDMxxji9VPKf8jJx?=
 =?us-ascii?Q?cbeTcHDib0hKhRjKDdUGKiRFS7vO+DlCh/ocjQQ0qsmbFsGWnpDujbGn0ycw?=
 =?us-ascii?Q?F93JjANklf1WT4UfreWSFSsNK7vsbxCxRAqGP9PFSeUU+E2eKo59HwVlbNND?=
 =?us-ascii?Q?qB9XVNPLM7r5+HRfe8RHmL0ymJCqOgJsDa+AP6ULZ0alkjKbKzHs/UFKD4Tg?=
 =?us-ascii?Q?LxkDANU5JMHOXO3u1YpAbcojUCoLFwFZv7Fd71uJHkICdRYlIk3AkqviRUPr?=
 =?us-ascii?Q?qi6PVdHo2jKFBKNiKJzpyw+F/ywzcSJ34jnTVgyndLDb/WmYE3CrtUiOX7wu?=
 =?us-ascii?Q?KlDToCHmEzTqFu6ntRzCY0vt3ND+kxlH6Voh3AEyobQsC4jtKObz3fXbFR8t?=
 =?us-ascii?Q?ZsWft5CrjjatInD9FFS9bVuX48uesc7uOOe+7PqZbe0AktF44bh0mlryAgMD?=
 =?us-ascii?Q?AxoF7EUOOzK40dHsVBuCnCcJUj3NOd5vKSksheRntVswUpim1RnuNnnV6+gK?=
 =?us-ascii?Q?isfLdOUg5x3THoyZYDyOg6mQUXprytPiginavzEdyzf+UUpvviwLzYTOYAWE?=
 =?us-ascii?Q?sSdzr6fXRngiyvgQG5xt0upEIWdC2WHmQZ6OC5dMyPTR6q9iNtEjTZUvYVPK?=
 =?us-ascii?Q?FyRPy0GH1dUQGC1lmRCxWfMBJX3Hf+p73UnAbPHGpkCLM9jFsDI3DOzo2UsA?=
 =?us-ascii?Q?/2HnK3hy/Mb1FGBC8564FKaR1yGgzi4XwbnOTEuCYaEsaBh+GWyOoqVfBo01?=
 =?us-ascii?Q?dLrUuU3Tosyy4jFqYe6o5nMcrzVW441OXqg+NNkreTh/mbr+oBzTGLzJSkJU?=
 =?us-ascii?Q?ckhUH5eH36F2NgntFbH36CzjDam30F6b4jFSwmj3RzQAyspO+0po1THVL3b/?=
 =?us-ascii?Q?Xoq41ifAcz+n7+NTJLPnh1CjRgfYQdQiv13AQcY5LC5bhfiCROUr4XfD188y?=
 =?us-ascii?Q?Vt9dBnLO+2Ea8Si3/vcAlTCWgBtzs5+caViR7AiUWPkjDFnlNmT3kgWi/WGn?=
 =?us-ascii?Q?3YBHd9z3kkAECkHrkveMZpPteAh5Rbd7kFsDjg38OQERKYw2gKNKgi/Q6JL4?=
 =?us-ascii?Q?iERAqUenIvch4tVfxamkbQ8QUlfgwmDa9X3Dxt5qz7zJF18W4NVGFh6ofD8v?=
 =?us-ascii?Q?LwYXaOv7nwvmgbLaRg2Qa1pTdAzWmsFNlBlQj2jY/ByAu+wP3BryOzBSSCDb?=
 =?us-ascii?Q?WUv+3hIpO4hgXEoysR8SVCGwxKHyjAsmiHmnhtWQZW07fdo9IzfpRVj0DrK6?=
 =?us-ascii?Q?llcOQWYId5m6NhdIyzLeKS+aUIWGrFjD4c22WFSFTeZNN4/qD1UxtzKvEZ4a?=
 =?us-ascii?Q?q2jMFAzda6e9Yr3RXXQQOT+ZSu3aPixzgWNHIRGKgTTTFPGolCtvcDqz3wQY?=
 =?us-ascii?Q?uk8e7M1xATvVKM7APZ52ugtQfgP7aSLMaTpdpGJH/58Pg4njES/cCFDs4drs?=
 =?us-ascii?Q?AJR50kKkVP79vQsIUmvsvhZU1otDl4DBo7LfNEpK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fe2959-be4b-4921-519a-08de30eb18f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 15:05:42.7030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQnsDMt3K2K4omVbwL8ycEAzHicwm9B88Yi83HKrGRZ2xlZveMnm1slkvVCvs6BgVCgunJK1H0HtzeHObQAOHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9526
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 15:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122215

Any idea why this report does not list libde265 (CVE-2024-38949, CVE-2024-3=
8950) which are present at
https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/ ?

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Gyorgy Sarvari via
> lists.openembedded.org
> Sent: Monday, December 1, 2025 15:48
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] CVE report - master - 2025-12-01
>=20
> List of all open CVEs (56, out of which new this week: 0):
>=20
>  - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-2=
3026
>  - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-=
0887
>  - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
>  - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
>  - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
>  - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
>  - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
>  - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
>  - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
>  - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
>  - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
>  - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-4599=
3
>  - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
>  - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-100=
0538
>  - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
>  - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
>  - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
>  - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
>  - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
>  - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
>  - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
>  - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
>  - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
>  - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-=
1000155
>  - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
327
>  - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
328
>  - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
329
>  - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-268=
43
>  - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-637=
7
>  - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-647=
8
>  - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
594
>  - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
595
>  - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
596
>  - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
597
>  - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
598
>  - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
599
>  - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
600
>  - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26=
601
>  - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-=
43343
>  - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
>  - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
>  - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
>  - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
>  - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
>  - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
>  - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
>  - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
>  - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
>  - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
>  - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
>  - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
>  - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
>  - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
>  - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
>  - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
>  - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Removed this week (20):
>=20
>  - cockpit: CVE-2018-15538: https://nvd.nist.gov/vuln/detail/CVE-2018-155=
38
>  - cockpit: CVE-2018-15539: https://nvd.nist.gov/vuln/detail/CVE-2018-155=
39
>  - cockpit: CVE-2018-15540: https://nvd.nist.gov/vuln/detail/CVE-2018-155=
40
>  - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
>  - python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2=
025-
> 64458
>  - python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2=
025-
> 64459
>  - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-824=
1
>  - xrdp: CVE-2022-23468: https://nvd.nist.gov/vuln/detail/CVE-2022-23468
>  - xrdp: CVE-2022-23477: https://nvd.nist.gov/vuln/detail/CVE-2022-23477
>  - xrdp: CVE-2022-23478: https://nvd.nist.gov/vuln/detail/CVE-2022-23478
>  - xrdp: CVE-2022-23479: https://nvd.nist.gov/vuln/detail/CVE-2022-23479
>  - xrdp: CVE-2022-23480: https://nvd.nist.gov/vuln/detail/CVE-2022-23480
>  - xrdp: CVE-2022-23481: https://nvd.nist.gov/vuln/detail/CVE-2022-23481
>  - xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
>  - xrdp: CVE-2022-23483: https://nvd.nist.gov/vuln/detail/CVE-2022-23483
>  - xrdp: CVE-2022-23484: https://nvd.nist.gov/vuln/detail/CVE-2022-23484
>  - xrdp: CVE-2022-23493: https://nvd.nist.gov/vuln/detail/CVE-2022-23493
>  - xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
>  - xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822
>  - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917


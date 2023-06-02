Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23440C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 20:30:29 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.5961.1685737826199523032
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 13:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=niA3M+Yg;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1685737826;
  x=1717273826;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RtscfgPH4ohahSuwb4nWdjs0T0tjucIg5yok4f5ccog=;
  b=niA3M+YgTxMxdSzLhMKag6jfwkfduqEPuY4F32QfwvhWE5PuLP64p8i9
   Pph7E84nIPUz/447cDDTG8X8F3NPALLkUMhp0NKV+MD2JegZbXIyZzzGM
   uK/9CShM5WhBwzO6FauRptKIe1gvoHxcS8dvBAEuQEI6/yNGCkni9XRlj
   7oYyFCgyxU2cPtx6rnbJdpVb2axj07/SQAhX78Q3kSGazf7lPBk0BDRxd
   QzIrs+NMWX68uLIJ9L/Saj+p6gQNsOtJ89Vf5NQvRTFWvDGza0iKxzr9S
   TQ2lZJZlPAP6zCih8oBEpOrlA+uouUfJbxTC0e7FyVtBptCxCvQnRRvTh
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIhHZGkKKhfJftYjvAYC4z/5312aQD3IcOBiBvsHHEXemd/YRrL79Qur2QYXFcYsNbBCCHxXeCBRZOQnljix+8h8KjSyKVg01FP3GCaECBuL16WV/b7IWUTSHCzb0yNLFBRwfjsLDy6mjnPqGzVWhjP1C03jWtvRiZxwPLUxAJYZkt5KGDMD+MoeT96J1grNSldMhdFMc7Y307EtKS8OPP3o1H0HfFQN3Z8pyVrhQL1D7NQw49koq07OXDWfaTae6hK8TAYSDKtByIP7id9+MW+SCwoYMEogdCmQ8kTEVljkSuVLhhUiKmCz/9v90CkRNrrHDB6i57AmmB34EJdQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtscfgPH4ohahSuwb4nWdjs0T0tjucIg5yok4f5ccog=;
 b=RtAm8HZ2UDb7fcNpJ8kSk2oYRE+miHlpDqOo6Sj73J4kopRkGJqoATPrHMX5/vZM5rqZfxgB7lTONw0iQg6LNVok9thqejTx+Iy98dZSwIXGuVUE/ge1iQv8ZCZCeZ4saXQdhARCUKfC8wDkpwr1cxJd/sjU2aOuqYBj7J0wmfflAL+bR4QXX35SLNI6rkb8Ehjf6ZdB5OoIhU/XVYSuLz4e84mpk10Q8LBurnqd66KQiB9ahUEpiy89UUC8wLMoCTmtuYtvJpJn17qpip6OZrq2FDupdpb4gxBb2teE0tRMKjqeIscTHgKjS8r8Ve+7DrKd1eGpZ6lPxgnQM2cbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtscfgPH4ohahSuwb4nWdjs0T0tjucIg5yok4f5ccog=;
 b=mN4MlGhux2xZhLKTzaRo8DOupZidGfB+d6AtJE7KgVNn909wl9G1BGbqRUeUE6qiB2ttXFg+4inNWD9VWKuVVNRAcoWzxa3ue5tgXVT3B1PE53dkIbe0mofvylquYNWVaPOJhfWhxEnxvZgQhodleuG2XilZwGjXbHCmDhZcWuw=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: wangmy <wangmy@fujitsu.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: modify suffix of spdx
 file.
Thread-Topic: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: modify suffix of spdx
 file.
Thread-Index: AQHZlP5JAVwf7ZvRVEWlmSor7HHpsK9395mQ
Date: Fri, 2 Jun 2023 20:30:19 +0000
Message-ID: <DB5PR02MB10213B2EDEC4C4C1719932A07EF4EA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1685674746-2991-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1685674746-2991-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9583:EE_
x-ms-office365-filtering-correlation-id: 088c03c6-695c-4c28-6e30-08db63a82eed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9FVzhuRi/GfbJOB+BkzCbqzd+u+5MFSKHsPmU4XSYIoVVI+bGyyMU6upEXvi7jUgulyQ8Vz7R8Sj/NuZqqqSQrnYv7auHge8OdkRM9VGabldOrd/5/tpVAFKV7Tnm5qIy2wOqR6SAF5m9R9uwb8ZnFdEq2m1mT1jVgZkVZ2F8kXXAS26mIrMQitmDcg9YeR3CuIk58C9acIqmU5nZbCkK+SbKb2ckPxikLAagCWpFmGsdiE0aqOlkIIwgE6h5pQGZ5wo6ALnTQxfSfufavPxrVgbhdqvYW58KvhHKDcC29iACx1+W/Sas1mLxzQtMXPrRtaS95hM4YoVsxaDuvqarbCKUPJFadF1aMgfBtC+DuiKsrN5llX9XYNrBPdxu8MfIt+2/Ybvb7cvOiXSibV5SyzMiMWlEZ5lKnHMX3S6ZNees3w93+Vj3UcM0HDuYKTXlqVyMLLwAWww5J8QlCnx/Ch8t7Egs92YnjQUT8yuKEMWn6liamGCgqM2/sqt0u4tcSYDijxzi98+rqfK+Yzc4jbeVaAOUAizLS7i0w7W1P2X+aYw09Qor4iVaevqpCOrPD6W8NzgTY9XPb2mGxhI1HR7Utz8H5fetLuR8m1p9oAbSAYLlVCIpeVb6RripfnV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(66476007)(122000001)(38100700002)(86362001)(38070700005)(33656002)(8676002)(41300700001)(26005)(6506007)(5660300002)(52536014)(44832011)(9686003)(53546011)(55016003)(66556008)(2906002)(186003)(83380400001)(7696005)(66446008)(76116006)(66946007)(316002)(71200400001)(478600001)(8936002)(110136005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w61W7DrjL82JlgkjdabVhfd6v2RYGUvKrvF1SEKNtAH7UxuyUL0Lu6dXjI3Y?=
 =?us-ascii?Q?hvA9sJYU6IS7NCYBeM+PHUSGVP/C6n1lEYR3UEcnXwE4wusQG15EL6k87lwc?=
 =?us-ascii?Q?D0QN50b5086Uaz5WNTeaaNMINA1/0uly/1PbSqBLDKMcRKxPpIXaJ0pbRgWL?=
 =?us-ascii?Q?BmVEVd42WqsaAblkFFO4WnHK8FOzXWcZa+r1CEsABh0kaiadymltMZtjiAi6?=
 =?us-ascii?Q?nYYmGEIyH7IM6OxI/podRBkfF94JTMX0OeqLBCdeu1p3r0TSYhA/FBe2BWfe?=
 =?us-ascii?Q?hlRcTqNjM3sHuJ6h15nGVsSKNOaKmCiapgn70rWLiGG9y4G+8OSJZaNgxrnV?=
 =?us-ascii?Q?j9DZ7QxvUTHLm0h1Iln36GQ038ivFXDYFNg5jkgZr9jac0WQlQZy5nmSzVXG?=
 =?us-ascii?Q?Ah4p2XcR93Bxc2UBjkBAiICleXEu/LZbIbmXmKmZ+GZI6GejvSN5aBIFVpzu?=
 =?us-ascii?Q?J3rLT/UMrnw/5g58yE7MU7TDl7tJHDhYnrkHvwSMP14vhea0YsGBs8kcMr0K?=
 =?us-ascii?Q?tmqykqp9kjoAgYlK8K46EbPbE4HqtwB/Pyoyf8KW3GE6JyVX1Qk72tOBNLWU?=
 =?us-ascii?Q?UThWGP+3+6d7iTyjkeMP/gOi79pruqYpFbrYrZ43JG7HiXFw5xVfPHHrsA/s?=
 =?us-ascii?Q?ICXhtMoIurzATQt553U+JSHTrAWIVn1wmIVRrWki2lGhOTAZdEWiPZBgg02S?=
 =?us-ascii?Q?6waqXFeKnsgUB6AcY20L76cPg8jupoFeZI1hzB2V4S1mkF6hpzezTo3Y5Xxz?=
 =?us-ascii?Q?6FRRrmmIoC9d6Ig31+EBfj2V0u3su48AnBOJsCmTzsR+mMA7RofPEMt2voYj?=
 =?us-ascii?Q?RZmnW9mBgKK27HOZWXdI2brV+m2SfKNOWE2bw8merIxTGQB3Lyzyw2ZyswvL?=
 =?us-ascii?Q?3N98h3u0MPCXnuW9vLEIpH/H0Flh6nevejlLSGA3734ixfKDfAKWNkLzJm2+?=
 =?us-ascii?Q?96uHmQjS3seaE93IHsOnQhCdCSmWk0GNW7RDPST45YJ7gTLlcUUMz0AYUe+3?=
 =?us-ascii?Q?n+9/CXkdFI8deyxr3idDich0I4CEzx6V8KevARzlsLGgkmL3R5GvffZgfDBM?=
 =?us-ascii?Q?9dTqbZi8BNHvG7KyqJVDelAxrsil6+qdN7rzD32an3qCaR05iChjUAffImrH?=
 =?us-ascii?Q?tQlf/bziobwh0aR1vfI0VI8HSTOJCqvzPA0W9/vVUQSdxWu4/wBa7zQfPyTd?=
 =?us-ascii?Q?jflLYmEtKr29vLJXDyP/Q0R2mQT7xiuHiyyxFPg0Cg63Xl/Vlrv7Q122vigi?=
 =?us-ascii?Q?gg0k+PLSe1uU1zb7Ymq87TgRVmbA77344/2hzM14E9risHZUpUvtjYjZ27si?=
 =?us-ascii?Q?bDkSp/fDdmmba4g3r0nvDRGSSm25VUuDfuOMsMy0ppydfXtU9QZG3xOfysbv?=
 =?us-ascii?Q?qNszx3K5l/LTZseJN+MIXUGpCEB4c1vJvrNWtAlC/bgn3WNeClSMOWrteKYF?=
 =?us-ascii?Q?l2fim1nMv3OVjwuPFR2UGKBqkAUHd2YxRsNVLQKYMCbwGXmU0sT6lWE0GQVJ?=
 =?us-ascii?Q?l7yqe4Hknn9cWBhikyufx2RJ/q9+/n8e4zZJqLy1aZI0+L2h+R9G4R1zjr5X?=
 =?us-ascii?Q?Ci74RfZmIzRsbPaj9qo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088c03c6-695c-4c28-6e30-08db63a82eed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 20:30:19.5598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/zWEgnJIiHwlqldIZkVar2GuwIoGSNJ/EvvhJqT9lhXiHGjW6TkDsFszfevaVO6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9583
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 20:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103103

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of wangmy
> Sent: den 2 juni 2023 04:59
> To: openembedded-devel@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: modify suffix of spdx =
file.
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.b=
b b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> index ca2b20108a..94023922a2 100644
> --- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>=20
>  SRC_URI =3D "git://github.com/ubinux/dnf-plugin-tui.git;branch=3Dmaster;=
protocol=3Dhttps"
> -SRCREV =3D "8d21f52577aa03958732a5a346a678c699e98cb6"
> +SRCREV =3D "83917a3935ac7ce1d8d96e914d96a6679319a336"
>  PV =3D "1.3"

Since SRCREV doesn't match PV, PV should be changed to indicate this:

PV =3D "1.3+git${SRCPV}"

>=20
>  SRC_URI:append:class-target =3D " file://oe-remote.repo.sample"
> --
> 2.34.1

//Peter


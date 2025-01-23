Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA80C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:17:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.93])
 by mx.groups.io with SMTP id smtpd.web10.21164.1737663471508887670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 12:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=QL7OWqYZ;
 spf=pass (domain: welotec.com, ip: 52.101.65.93, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctCBwb47bRrwfdjr3bsDyve2M9r5O51GSUE0vRVCwjxJirjRa94kR3LNwZUYDNChYvlkfs00BraD4s7376AMi7Y/Y8prFfmkKy/sXaE2tnaVMWE08h5aungOEiLjhxPQ9YNIporelhftGu05D7ordDHfyb91JIgO2xobM54trNF3RG0M+JQOSTfawshqd+rolzwIYLMeVJj2ezvIXdxYoQUHgf24oulaKS4sCLgLYMznyUfbvjPOzFETJN00XfGzkpLaF/bI4YYc4xXI0iMWIp9Gl+DWo3wSEfCtcVaDxb08pCt3Qxj0muy6zFp0JW51Ovd9O0Shc/6C6kY1fgyVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHc4SgEVRxol9ifb43kxvyApbOB/k9A3uexaz+JQ0m8=;
 b=gWETRN2IQkMswRRpAmG+7+lbq1UIkaSfs5s+qEn4kpOPKzrOExWYGSrK+jeOOw0P+AMqkZIaFfGnx5cALjnq4hiR1+6fkOM/yn6ZfrkAiAdV6wvYbIt92YPHt6/sZuDwpPyWkqT/l4NSsqqvSB5C2WHq880E5BJdYa3re4sU/yw3D12WYuImJPBo8hBSE97RORMLDyKlKynJu9bB+9akrUDnIkC7PTBFMACnjIsEXngAqsY5CmwHv1C74Dnld7cDm3dxlglyBPWRG8Cg5WSZQQFnWpzZ7X7rZCfXKeTCL+cP7qcXPL/v0sOyriuAjwQ5oBratCeUfSenaSVluc8duA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHc4SgEVRxol9ifb43kxvyApbOB/k9A3uexaz+JQ0m8=;
 b=QL7OWqYZnfLAGp8J1oObtAvg+/7z6qv32gPl+bfU0bPRZ5GpeBDNxfYVJ/udqFoKBatFYSF+uam5SA+3H7TQCssqFcTcr1nwN6/E4qL8R6MXrcn4F+IhqVRD/gQI7LT4BmwQ1QOM4xfOYyLC80MWraADFSFOcRODaJP5YNF2VgBziZ1eGIWTFIQIJJCBl6jXXGtCKTX5v/WGarPeyTYu0+YaKg1FGaf2/aScI2IV7s3eq0HAjHuxtiz9aZA2WH86td9OZGhEoGJSIU+r+uXQHpyHIqlqiPe4iWLfHEJjdzfz5QswuLC3pi89BN2nx+3EGaaSgJ41L2OmqjeYYQYK5Q==
Received: from PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 by PAXPR04MB8718.eurprd04.prod.outlook.com (2603:10a6:102:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 20:17:47 +0000
Received: from PA4PR04MB9343.eurprd04.prod.outlook.com
 ([fe80::6933:6be3:3262:b839]) by PA4PR04MB9343.eurprd04.prod.outlook.com
 ([fe80::6933:6be3:3262:b839%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 20:17:47 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, =?iso-8859-2?Q?Piotr_=A3obacz?=
	<p.lobacz@welotec.com>
Subject: ODP: [oe] plymouth_24.004.60 causes to not pop up login prompt
Thread-Topic: [oe] plymouth_24.004.60 causes to not pop up login prompt
Thread-Index: AQHbbcOdOnfvQu+uL0aRkutSO0ju0LMkzBPW
Date: Thu, 23 Jan 2025 20:17:47 +0000
Message-ID: 
 <PA4PR04MB934350501DE0FB5B0D0DD0DD91E02@PA4PR04MB9343.eurprd04.prod.outlook.com>
References: <tCev.1737499523488315680.yQwU@lists.openembedded.org>
In-Reply-To: <tCev.1737499523488315680.yQwU@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9343:EE_|PAXPR04MB8718:EE_
x-ms-office365-filtering-correlation-id: 42a5f13c-0ea8-4743-dd47-08dd3beb0101
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-2?Q?t4jbTjMnbbMDBoomWp1W5rGwQzDlWHkqN4F3vNIm53zfYco7eQbdoUImf7?=
 =?iso-8859-2?Q?j3Qfs4zoHrw+i8tbITUj5N5y9aThUW8BB3m7X4nf6rXnMiL8Qvlw6tksTD?=
 =?iso-8859-2?Q?7klqLlrw0+6uT5XjLmY2MOesCRL+vpMxnd2lL5RmrTHBCakxALtC6EeiuI?=
 =?iso-8859-2?Q?ydjj1SO16mvIFEtrPXNcJNnL5sXCS3zUb/FgOqZ1h0R6NxII97SNY06+Hk?=
 =?iso-8859-2?Q?9KFLVHYjVzHLZyJwsnrGnuL9alRtpdA9EQdo7w4NK9YCcG36F7rjHB2wV1?=
 =?iso-8859-2?Q?gDo2L6xIrf/5o293QC8uYlTqTyblZ+A4p4K4lCvkmlJ20/0PDkSw+rLhYf?=
 =?iso-8859-2?Q?N9haq3MHNDumQ4IGaGhjSUUtZc6eKl3obRl32rWqwVODqLAWmF3rE6pPi7?=
 =?iso-8859-2?Q?ZsajHr7NE5oEBIMF6K1yauMTHAy0vcQtmW44nKhbpAG/sv01x3dQcWsaP1?=
 =?iso-8859-2?Q?qwAqKeqft5Hsc8sRAG/thl3xZ2O69XsHFcc2QI4/AOlMo1+loVhAXt7ITz?=
 =?iso-8859-2?Q?eSjNsMs9AAPcrQk6ePeLKxzOsktOomgfxJP7+Cr42fCQiXTOpDKA96XwmX?=
 =?iso-8859-2?Q?C6m275WHwThYRRRn4FOITRQHJw52kvp1IbNKuxEhjb5JGcnolBfoy3gphF?=
 =?iso-8859-2?Q?Crxv4GaP6XQGIclN00wLszYyT8m6snlQMESnYw6RJlM70eJKw1CrvcfqE0?=
 =?iso-8859-2?Q?M6AJt4+blleAXLkcGqsFC0vp3TX2l2yjcVPLzKhKo4ItpIsbHTEZU0eZYb?=
 =?iso-8859-2?Q?IAJdHu3z+Jw+WCD/Vyu9R/1LVmmrEEliK2+qH2qz4vIwNkRNkCH6NwaAM5?=
 =?iso-8859-2?Q?ppR3uNKf6Iqa4Qo2X7TwltxmLoP7Pl7gJSZN94TztqYaBEvahu93SkP7fb?=
 =?iso-8859-2?Q?C9Si0X0sBxL/z81cGBnhqXDE135/XkJ7/ZzoqCUfOsH/mQlKS8KpZ/MZxt?=
 =?iso-8859-2?Q?tCIK+mqvRYm3B2EjNtJaVp+0ipLX3H07/ssfYN6o8HaAJO5ToTYFieNsTv?=
 =?iso-8859-2?Q?ro0T6BARrqOPQiBqIIalUBwwTAbB7GkCK6oXes+A5OPgaFhqyOc45Qoh9Y?=
 =?iso-8859-2?Q?U8p0ID6vGJKUvOAgvZ1AbI0W54JORVu2tMumFll6Md1fKDdIqWO1wqRh8d?=
 =?iso-8859-2?Q?FqZjHEie74rj4jv5zJV+ltFyxKl9r9OSlc5C0jr1D1nDwHaHFOdIwbcyXj?=
 =?iso-8859-2?Q?Hkra/tpl91ET3eq/3V3gKwM5eaiUVRO1H3VpE+jrcTHZPqu8ePTZj2EBJN?=
 =?iso-8859-2?Q?pHzjEF19hFmNcfIIGBYBqC1tgX1SmLrQUs4alv9A9XmI85kDB6VOBac/sw?=
 =?iso-8859-2?Q?qYQFdglWHpYQnInnn1SK196So3fyN4+v9yXFpOo+xLJrBct+oCDFd2dPrq?=
 =?iso-8859-2?Q?R4ZpOEY7NLvp3VDWOwZeaJyBG4ZjvTwglsPASFgPdgVyEB4nvPdLKIH+jK?=
 =?iso-8859-2?Q?5hK3f1GpZc9iaynifxtYv7w17syfnaIF59RjNA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9343.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?pI34g7INbPZWOxdw75aHSwnaDrx9d5mKHG7gS/ajY1GWEpD0rOn1vOwr4N?=
 =?iso-8859-2?Q?Qbo7i9CGRnUVKVuYcaP2D+Z2QWM0h4376SIivH8H9YF/0+yocMM/jmDhOJ?=
 =?iso-8859-2?Q?NRDiL3godk+Sqy1zCCIBsgI8M8K7Lf5JyDFO3dcvSPHGuv/z1veZL2vz3I?=
 =?iso-8859-2?Q?jCgKUrNEQvvUnu8NP4aneK9IQvV3Nr9ZBESUp1E5MCh439+Ra4Q1aZWQQA?=
 =?iso-8859-2?Q?o2tkBtxeITwADBwuV+/2BMgxGQfpiCNsH8xXKoJHDxaUA18Xz7vxTor+y+?=
 =?iso-8859-2?Q?Cgy/t5JRQB6Gek90vzg15dkFdx89qMiD6R5bzuSRE0/+wkbn0CAGRx9PAT?=
 =?iso-8859-2?Q?5Wd0RrCWsKm+6z2H865zq4A+To1CxdcdHkr7zPR8SqH7dUbJ2FsgugGSDd?=
 =?iso-8859-2?Q?Aov4BkwZUDzAAXYkY7s/iY70VqC3XUzqwpJ0otrQXHc5SXjPwLVoTLWm6c?=
 =?iso-8859-2?Q?gFa82tDrlzWp/rvH4rfODuI1ex+H6J5IuFPXed97WbvqvclXMoYRfaubFr?=
 =?iso-8859-2?Q?8J++KxY4U/F3DLfYNiL2MVyn+nXlKIJ2iC3pe6XoztN6t0i/7V6vX9hhNq?=
 =?iso-8859-2?Q?Bh8PtOVnLxWbXy+fNnIqKHfR0pWZMhfZHWx4I3lfelNy+AEFFJXvVSdEbV?=
 =?iso-8859-2?Q?rfNlLE6QRNspyv/LPjhfHWUyr+H+IlNVNnkNVwHxRjseSkLIKSgjkbxdBo?=
 =?iso-8859-2?Q?LCxIvvOLx4svzrkUHt+/aRxhu0FfBLoorWx9ed6KdUzYX/yGDIWLyAGHFe?=
 =?iso-8859-2?Q?H2LV3bugisFFYpP/lzBBgbCJTlNLwV4A1VYkmEWxXVlbgpasYOtneLZLNX?=
 =?iso-8859-2?Q?6YO0bOh4Sa8PIb2jvLC2NXrwZQ54ZPefRkpvT+TTuj+mtcaimv9/w2doXr?=
 =?iso-8859-2?Q?YGHmbdlyJ0iRmqz0X46/es3Geeb4aJbgfN3Uiby+Z86StTjLwFfOBpAOvI?=
 =?iso-8859-2?Q?APY0Rhw9m4pSKuKmBRM1mL6z2nklKNAJrJxdGA/050sjDpTL26L52qw1kN?=
 =?iso-8859-2?Q?v2d8GPjVSoNACl5IBxvicXWiLlcVH2Vd8c6ZiUv8kXsI6E6vyw6WoBUlOB?=
 =?iso-8859-2?Q?lxbuEj2THFXzS9RoUNkV7XWZQY9NJ2/wlCPy7DjDs36onLxiwGb/EKI/Xf?=
 =?iso-8859-2?Q?u8hXVax2Iy4+YNmwkr046ztg9/w4+XEaALMyDF/BTbZbIswl3Xgi6KZ+fl?=
 =?iso-8859-2?Q?1eSi2pXTqGqnswWm7RlGCwiWceK7A0cpw4cNokgvBzE/pr/hq9dkH/GAXp?=
 =?iso-8859-2?Q?gVak1D+Cdlu4bipywteVhUERIeUy40DBMsr7/3skg3UWNH7Y947tbwRC2I?=
 =?iso-8859-2?Q?oX6IIF5VOVKRM5/eOeucMVdglvScVIRqh2l9lZL/0mAzR1ZsUC3mmOp5tW?=
 =?iso-8859-2?Q?G2ZyHF4Sf59hD9JhT67VqwIXSgw9vWnnWlEuzIUXx2DdO20U4EcGKzHV3W?=
 =?iso-8859-2?Q?i1n3ivx1gPkv4lkDkeqGLLsrGUyKYrELiCI+7aqPUVgR/46Um1NL8gX35X?=
 =?iso-8859-2?Q?b3I2Mk4DuPUWXNFkzptJhvSP/Kw8b4PLojzHPHRqm4BMwzwYi8FYRIYfFm?=
 =?iso-8859-2?Q?TXfgDz1s1jBiit5FdrlAkcXSURISyo8H01/EOa+3VkuHudXVnEoeTLyhh7?=
 =?iso-8859-2?Q?lWAznoB+BFvvvm91dJW7oEWzdOYRY38z0S?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR04MB934350501DE0FB5B0D0DD0DD91E02PA4PR04MB9343eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9343.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a5f13c-0ea8-4743-dd47-08dd3beb0101
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 20:17:47.6418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JTp6HYy+Axl46Qipta2EsCzRbzp8tmUkc1aC17Vqnj5odvqWQRfuw8bMsoCQQd3gT+peuqA90pHpQ+yEThlmXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8718
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 20:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115036

--_000_PA4PR04MB934350501DE0FB5B0D0DD0DD91E02PA4PR04MB9343eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

OK I have discovered the issue. The problem is that there is the patch http=
s://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/plymou=
th/plymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.patch=
?h=3Dscarthgap and according to this merge request in upstream https://gitl=
ab.freedesktop.org/plymouth/plymouth/-/merge_requests/157 it is wrong. Also=
 Ray Strode in his comment has explaind it clearly that with that option it=
 would login prompt would never be run, which exactly happens in my case. D=
eleting this parameter fixes the issue.

IMHO this patch 0001-plymouth-Add-the-retain-splash-option.patch should be =
removed. In addition this one 0001-plymouth-start-service-in-add-related-ke=
rnel-paramet.patch should be deleted as well as it forces to be the default=
 behaviour of plymouth. Developers should decide this on their own...

BR
Piotr

________________________________
Od: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedde=
d.org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: wtorek, 21 stycznia 2025 23:45
Do: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Temat: [oe] plymouth_24.004.60 causes to not pop up login prompt

Hi all,
I'm working on scarthgap branch, as i have recentlly updated from kirkstone=
 and encountered a strange issue.

As in subject I'm not getting login prompt when using plymouth as splash ut=
ility, but only a message like 'Starting systemd-udevd version 255.13`. Whe=
n I hit alt+f2 I will switch to tty2 and than again alt+f1 i'm getting tty1=
 so that is fine but for some reason plymouth is casuing this screen hangup=
 and I do not know what is causing it. Maybe some of you encountered it?

BR
Piotr

--_000_PA4PR04MB934350501DE0FB5B0D0DD0DD91E02PA4PR04MB9343eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
OK I have discovered the issue. The problem is that there is the patch http=
s://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/plymou=
th/plymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.patch=
?h=3Dscarthgap and according to this
 merge request in upstream https://gitlab.freedesktop.org/plymouth/plymouth=
/-/merge_requests/157 it is wrong. Also Ray Strode in his comment has expla=
ind it clearly that with that option it would login prompt would never be r=
un, which exactly happens in my
 case. Deleting this parameter fixes the issue.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
IMHO this patch 0001-plymouth-Add-the-retain-splash-option.patch should be =
removed. In addition this one 0001-plymouth-start-service-in-add-related-ke=
rnel-paramet.patch should be deleted as well as it forces to be the default=
 behaviour of plymouth. Developers
 should decide this on their own...</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
BR</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Piotr</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-devel@list=
s.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; w imie=
niu u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> wtorek, 21 stycznia 2025 23:45<br>
<b>Do:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Temat:</b> [oe] plymouth_24.004.60 causes to not pop up login prompt</fo=
nt>
<div>&nbsp;</div>
</div>
<div>
<div>Hi all,</div>
<div>I'm working on scarthgap branch, as i have recentlly updated from kirk=
stone and encountered a strange issue.</div>
<div>&nbsp;</div>
<div>As in subject I'm not getting login prompt when using plymouth as spla=
sh utility, but only a message like 'Starting systemd-udevd version 255.13`=
. When I hit alt+f2 I will switch to tty2 and than again alt+f1 i'm getting=
 tty1 so that is fine but for some
 reason plymouth is casuing this screen hangup and I do not know what is ca=
using it. Maybe some of you encountered it?</div>
<div>&nbsp;</div>
<div>BR</div>
<div>Piotr</div>
</div>
</body>
</html>

--_000_PA4PR04MB934350501DE0FB5B0D0DD0DD91E02PA4PR04MB9343eurp_--


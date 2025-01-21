Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4487BC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 16:40:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web10.20402.1737477639307582303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 08:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Qdp3YMA/;
 spf=pass (domain: siemens.com, ip: 40.107.22.87, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhgFJjvkfkefFRHzRYh21fZL/AU5tWvdsM/sF3taYJZhS+bzc9+pbkdVF7oBA/+FIfQSdE3pBqhpnsAKZCxBA/Y92aS5Ja9bXBTS6VtJkpVqrS464gfn12R4UUrAnTdXdRNNwHH5aNd0GHeSMTlRX8zYwx1WUrEm6bDwBzI10WaIEfkCcyLnrztxFy1iX9Nu5WHiVu3H393K1xQKbV98mJr5dtmpf/GGVfKn2gEE/Eg/hG+Pj/F6kzssr9iyG9qcEbqLp5iWk+fYDrL4RMTURNqyGph8mXong0s5FEV8fV52O/o8HaWwokzuEscdmyKZX+m1Q242VQmdWSnf9bbQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghb7jrKrAreefADeh7D9/5F9OmuHABxHwhP35FbAskY=;
 b=j6VlFLiierpfDSRlTMC5k9L8m9T8t0Kr0W0igmktpAUC27hdGWWvp0gE0ucT8DfYBcwIVCuAzWEX4pbCV6Sr5p4eAFUUnOEWgJ53jYJ2TDFM+y4FbuJH+fOe4VU/mFvKpjghUiNhSTdxwj15vYCsOmKXRRvwp531T8D8GB2EY61wNrkfMxMSP4cvhxi5GSffaYT7ZxDWYOfK3X8dHaMDeFI+BUfPATZNfUWPYWemYS60Tg33OCtd/eCnZVZ3acFde3BeDSZU7h/w4eSBpaDtD00IuF1WVV2nWJ3OyOWRyOJXzZEZSLwXAaNwfsFFh7HGc1UpCdpWC1nHpCvQTfc8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghb7jrKrAreefADeh7D9/5F9OmuHABxHwhP35FbAskY=;
 b=Qdp3YMA/Fldco9eWy3K8eJzTx9MewC5/WiLCdRNiRRO2rptDuuju1nl+yMnJnS7L9Mim2UjpcIhVx9psEOUG9R/C/yFqq3osQgR/5YWxlTM6b/N9ff/03wZVdaDQVgW9czLpq6CheAKD6gCG/RQsfRekNZStMdY6pHACW9qumBIeXg1IXplzSbEG8WlUIONPJBZb7hoHTh67uOhA+4RYUyH2SmKN7xiGcPS6UoRur3tp2MRf5hCbYEArIOM/DB65couoqwHb96NZQP8agc45bz/auMBtZVqWNkc96XL+aZxp2Nv+uKFH9f2UMHAnE5hRyKTd7aXSOeoKlO+E2pif9Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3537.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.12; Tue, 21 Jan
 2025 16:40:36 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 16:40:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH] hostapd: Add CVE id to
 CVE-2024-3596_00.patch
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] hostapd: Add CVE id to
 CVE-2024-3596_00.patch
Thread-Index: AQHbawDomLaCLlPY6USTCGtAssnsS7Mhb7TQ
Date: Tue, 21 Jan 2025 16:40:36 +0000
Message-ID: 
 <AS1PR10MB5697787EAF1C45B1A500B1C4FDE62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250120060231.570029-1-liezhi.yang@windriver.com>
In-Reply-To: <20250120060231.570029-1-liezhi.yang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f4ac3af0-bb0c-4607-879a-e9ed9369595a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-21T16:38:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3537:EE_
x-ms-office365-filtering-correlation-id: dd1ccde1-8c91-4d5c-a25f-08dd3a3a54e9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?tf80GaUqbx1TKLOiSaieNPBCSBWvxs/7ZwHbVc020wPkWUNMAeBR2h+DA2aZ?=
 =?us-ascii?Q?37nNfg1ExE+I4bDJwnbzQBsKyRJdtdsbVsLtaQrdEn0M2skYl0gxkz96eBIf?=
 =?us-ascii?Q?ZX+R7qofA9SGHZIdHlfdHlqp64Z8TICgEQk1Bx2/p/spsLyBaf/1ebTudOdG?=
 =?us-ascii?Q?TQQtFXV/P5/NlFL9WWCOtYrKNhN3h1a0KqwuzsvZI0kU0ebwnhJdd18YziBR?=
 =?us-ascii?Q?9WchexmWwP/63eWYQ3akiKoGsISyqTkkDQYPE2cpjpl3GL6zLUHJCHxdpB4V?=
 =?us-ascii?Q?j1hCsgQNVRugvtfsAQgPVj7iH7mRnGajKc6gyuB45TknYoTcVOQqJyMyw6/T?=
 =?us-ascii?Q?exquKI1/ZedkLVl8/3wHjNFQvIMNFivtU5rv8rtpju03+yeIxXsS31BqF7z/?=
 =?us-ascii?Q?Kp0UbBgf9e/qLZIDnURK11uQcO6n5yEPslG+PtRZnS98nAYdT6fUcCHgCBgE?=
 =?us-ascii?Q?J4ny2pEdqJ4FUISNf1tW/RsNgT5StMwNeQUvvl7uTMBWNCsUpyG+P3K5TMYm?=
 =?us-ascii?Q?Gejn0ddPeVjQpGA3t78s7mXA9PM14KMGTqne277569EDnf93J1kxcPDYGh5d?=
 =?us-ascii?Q?VPQr8IuEHDOeZ1jWn9xESS50pTl8qdNVHYDLKGcwWoPc215G2j56E1iLlzaA?=
 =?us-ascii?Q?pt49wIp2g/AgZrrmQ2cRDTgCbI8Z9K3VNX4KcgD9C28nr2hYiu0AlTP8WsNZ?=
 =?us-ascii?Q?qM46r581+r1bWA4OhVjP/Q/IMYhtuoRhuaVW1/qRx9yasiQtWORYqhwwoHmf?=
 =?us-ascii?Q?dbu56QQrOsEOOQYVP4UEhv85z9DryBZbToeBWZ5LQGOqNleJpWs+ifxusS1D?=
 =?us-ascii?Q?HkpLIj8buj7jZwcrILbuH4rzk1MYLgr23gZiqhbbTffy186xc915Ahke2bBI?=
 =?us-ascii?Q?cX3UorA9SxQAwrrjyrM9DHd0FMCj3+yScFeCCRofECC5jLyOPNuYVmhqW6r/?=
 =?us-ascii?Q?KMPJJ5cB/Tn0w19+Bg1t57I2iQZK+U+I+/LYCaTprhp3fXZPOZ+bTZagK6YU?=
 =?us-ascii?Q?OEBr4L2TR+TvMELIAdcjr+0exsA9+SPneWFlc+/HIqL8jTmYbzw3ZpVxUyi1?=
 =?us-ascii?Q?sfq+DwFSCjWpr5vmfMNo2bN2MyrpuECFo0EV4moZu5TJ9fEHcfrXL21mO5tL?=
 =?us-ascii?Q?UU8b4Z+9sKu9RR9QuN4aSEDqJK+BztoZfgeP8iXnfa6wMA7EgMJDttW4maV1?=
 =?us-ascii?Q?JJJqmKijFUz9t5wNsr2/qqOHCHdCB/GyItHvduEyP7Oy0p+DRUMhlITObzXn?=
 =?us-ascii?Q?fHxXGJKmSxphibiJmLblwBGlRT+dVpMpHGEzPORE+2lqcr2LjVpJwdxW4lul?=
 =?us-ascii?Q?Kf0j7nbUtwgNamvnpP15fX1ZWCgFVOvjTK1Er1kxEgrYtFP613jeBuAq9a/k?=
 =?us-ascii?Q?l22GC2dBwaXSDl6pGaNPX6yBbVTp?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VHIWPWBSo1VbdGiQO5PFPoZqJTbv/vrODXBYiFmILkQtc+2VyosGHvh9KWGh?=
 =?us-ascii?Q?aafy4XWxwe+bZSw6ss5ZXiCxayNkQyiSxCHrzyDWCS+xC85k8L6JJ01JqEPP?=
 =?us-ascii?Q?NNydXjtKyEyZ64CsJySTfXSDxcVh7DxGFEUvgUn2uKCRbAx+6w2AePLwMQ8L?=
 =?us-ascii?Q?WAmjxzBzkaqs57Gj+zFeMVx+7X0Wf8LeqUAfSHZ/ReKmsOg8/wKUGpqFURB0?=
 =?us-ascii?Q?UHQWcMT9TSXvgDooEDs+KstRviEK2kG00rbKW+vPj2/g1cS4Wh1adtPELwee?=
 =?us-ascii?Q?7JEaMyaiVa0jl5P257oPtR4s73w1HnULvVrrbDFViQ+wa70Cr4ynfHqHLIPj?=
 =?us-ascii?Q?/Ly9vOPLr7hDvqovZnCuOsO5fYclYXzyYz41dSv8bn+NabKVEiMB3il386tk?=
 =?us-ascii?Q?9k9FdFfN2USZEv/jLgPnDAf0rRRd3zenN1e87GoaWmY1TwmcTxrwwYvhI6EU?=
 =?us-ascii?Q?+55F0weqp6RpZbuiHPO8LY3Mooy5+GwUl76UReLXLwqKekaCYekK+uoSXqSe?=
 =?us-ascii?Q?EEwIqMSFfzGTvi6yQ7nRHyTIz/dOheE9LYrf4Bmg1NV5qNXLLqucs59aZ6hd?=
 =?us-ascii?Q?nVwq1uGYBmv8wrs2N/AA+bRx2O/acEKSr+FIxVafOmIeM62yZfp8f4u8TbSq?=
 =?us-ascii?Q?FHKRkhV4PNgiOzoU/bbz4J2Ccj3gTf6KMMOO5gte2iSmfFR5mAjq/byac0b+?=
 =?us-ascii?Q?NXfzTimn1RqWQZpkxuJuxczByS/zRjhsVNgPnym0GMwhjKPXxT0LyFuTjuIF?=
 =?us-ascii?Q?US1G6MHoZCHNS5NLRmKrW1zZTypCbc9AVQgnZ8bJC/acWPUx5e4i46ma5XNt?=
 =?us-ascii?Q?7mEb9En44h7Gos5PwDGbd7buv9KpQcPloZZQkHaE52pWDliQQZxb58e0idPt?=
 =?us-ascii?Q?YBZD17n3B1GQtF9to4620qQvAGKBRotj47rP48aJUGzjPRX8YQ7JN3K4c9C2?=
 =?us-ascii?Q?ynXOvV8zLoQwO20etOyc8SSAkMsgK9OvqpUBLtgwBa1mzNvtM5GS8qhwYtmV?=
 =?us-ascii?Q?zTVISh5/aDriTtdDz21yEa6I8Y4lWeX5Buyr6nJWpWWo225cEzetK5OZXVIk?=
 =?us-ascii?Q?3fwHwn5gVeAAZ2zJhlALrxhC/230IvEz8TeGIUx0gR5FWID1+lXy98UwPNIA?=
 =?us-ascii?Q?9/x8rzO38yEt1czIvT70rVDtNWnTpPZHz6H3XnNTkO7pLDwrZLKNVktv9sKH?=
 =?us-ascii?Q?Jf4pjYpALLXvmjkO8FhcaCBbHT9n8M9tgMWK5RZ3fXyIUWzIEsSZOu2K6+pA?=
 =?us-ascii?Q?ry/XYmfpc5sddJlcmB5w8U7DJIT1tnO9ku4XOKlm294TNErCAKBI/tVdjK4P?=
 =?us-ascii?Q?p7FbH6+xQBn1LhoEKBppuGST+EtFqBzS8lNOkp652ZMUjh7zORXZCnoE9j9J?=
 =?us-ascii?Q?a5g7fxbkoG4dfVPERtBxXWc1VO5YzbgReAPiQnhEeiS+PczDf29xHcQIq0w6?=
 =?us-ascii?Q?vVTB3DnOMyjN1hc56CNadc/rjkt0n0JFqkWWBBx6IiBhJydaoj0fV1LJRO2D?=
 =?us-ascii?Q?18F0cQyJhdtl17MgYIX6C4ABzSoBAPByppMjelhrcstIUNM8h/u3XzniLWra?=
 =?us-ascii?Q?9Dk0YZy44iIZDbXKQgeasOmPEWs05LlJIAaUNKG3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1ccde1-8c91-4d5c-a25f-08dd3a3a54e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 16:40:36.3066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RezqEqbcxLKO0dMdWWyrXILB+jM0huxfkie3PcqZjhxpwmo8JZvviez0ecJQEmiAMzwC3lbWUQdYXgor7R3EIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3537
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 16:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115005

This is not correct.

The patch CVE-2024-3596_00 does not fix any part of that CVE.
As the commit message says, it's a style commit so that real CVE patches ap=
ply cleanly.
If it bothers you that it has CVE in filename but no CVE, maybe rename it i=
nstead adding incorrect tag?

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Robert Yang via
> lists.openembedded.org
> Sent: Monday, January 20, 2025 7:03
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][scarthgap][PATCH] hostapd: Add CVE id to CVE-2024=
-
> 3596_00.patch
>=20
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_00.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_00.patch
> index 7a8197d2b4..58e1327f2b 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
> @@ -6,6 +6,7 @@ Subject: [PATCH 1/9] ieee802_11_auth: Coding style cleanu=
p -
> no string
>=20
>  Signed-off-by: Jouni Malinen <j@w1.fi>
>=20
> +CVE: CVE-2024-3596
>  Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D945acf3ef06a6c312927da4fa055693db=
ac
> 432d1]
>  Signed-off-by: Peter Marko <peter.marko@siemens.com>
>  ---
> --
> 2.25.1



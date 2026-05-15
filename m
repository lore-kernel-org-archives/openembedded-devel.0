Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C463CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 08:19:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30376.1778833156813164822
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 01:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DgMklih0;
 spf=pass (domain: siemens.com, ip: 52.101.70.43, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yu9UXviKtAbblcl4y6/XP/W/m72ah7+clNBsuPiYo55jtmjTk9So9GQeXbjAkjiSu5QMcInLH3pwWZbmF5/65rvKZ7325XP6dONcO7ogscdIIRZ8GXC6DEy+vkN4mkEbNq9lfFr/jF8oh+tSpbInh9Ry4PSLPeFhMKIXlCIRV/qMVMw5sPIwmsfJZoLqwVaEiqDpy0NqUqelkxE7vrOj/ugZRvgSvuyCGR2mfbXgkiNGk/nqSrQNAHNoKqy944+GDVqcBqFargaqGj2cx8BBBXu5RaR3gDyqKW49wxODHwcN5n19iuDUpakwr0Hi0nfckHTFzWciBeQ+dCjbAMejQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ypcCf+x4gCrxAQDq6RFAZZSY4UTfu2euMHRhR7RwcE=;
 b=lFSrUIIIoWqcxaO7j3GPfK8MDKBL6k5kwHaTTumSGfZDIECqgXXCJGewsYDprhSTJN/EbhwBPmCqaEdKFUXM+aToX8F2yqj6qZIpai3aNFvpfOmpSI224+faD8QNilHd5TCvZeGOi0X32CigL+7hZQtfBsRfyC9ocvhgpEOK1jO8PK1ekqtFmuT/6n16nZ0A4sDfAzJ6sb4Pj6DCTvyXImhYwsoPGYGPxyYvXkw6ZVs8TtgavVXkavZZ/77X5ey2jrYKRfJXDvhvo2nctWgj+ppSj6OVBfBgSKKKdqtN1GOs4r/8LoPG4Frz9y1JXSkG2vml/vGid0jpRlzPKm/T6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ypcCf+x4gCrxAQDq6RFAZZSY4UTfu2euMHRhR7RwcE=;
 b=DgMklih02cvJ6lU8uExhJzvNbR5jb1aelq09wzUF7R5czAou3uVoqEDwcwpM4aJXDUVLT8XAP4uGhdPeiGlNlYHCYYoOR69Pg5gkEPhlom6PoFQ3HYvcn7w7q8EHwxtD5u5MObWyph3qAfXOeFZBXUD/738ARV/XRlKPpEiW3Cgk7ZGiy5sPwNvL77S2yrdHS9v1gRnAvUNBOpARe9y+lXosCbMoVr5mUTjBWvYaNO/dCf7KUXnMu/ivwdCKLS194qqV/rl0BzjFmQqa7WiC/JuWqbqoSwz4PVsDZk3l8wWzYg2A8SLu+d93+N91JzHaCRFvRjZBW7/m4Xd5EeVELQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS8PR10MB7425.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 08:19:12 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%5]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 08:19:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH v2] 7zip: update CVE_STATUS for
 fixed-version
Thread-Topic: [oe] [meta-oe][PATCH v2] 7zip: update CVE_STATUS for
 fixed-version
Thread-Index: AQHc5C8vT5bjVKO6TkuWnXMle+SQf7YOvhmw
Date: Fri, 15 May 2026 08:19:12 +0000
Message-ID: 
 <AS8PR10MB50732B434D0036674E59D126FD042@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <meta-oe/recipes-extended/7zip/7zip_26.01.bb>
 <20260515055334.466550-1-hongxu.jia@windriver.com>
In-Reply-To: <20260515055334.466550-1-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9be5957d-064b-48e6-ad86-dea14cf4eb64;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-15T08:17:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS8PR10MB7425:EE_
x-ms-office365-filtering-correlation-id: 376029bf-705c-49a2-dc68-08deb25aa523
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|38070700021|4143699003|11063799003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 SeSN9ys8Kcy5dMldCfHOM6GU7RqaRVnuLKW0z+HwI2LqMqDoJrylWU/4XkxR9AxodSrN0w/exebDMkZUPY5M7FLPR/8N/gqcVhwbEVk5yqoDZS0BOaUf7QGHGqAj4V6YPaCnynd5ZflUz2muADY+wisL5gNxLV0kTiQ4FCHEJsMbWUvVXAjlT/v2rGIIdcBj0wTMQ3uXx1gyIXKVh11gvaf6Oirf16nCocKY9wDD8+k2AbDG2HLQM0z9rG/UUbYlKGpSliiKqm+8Vmrlk8VeBx6iZIazNEwzCBeH6/JJC7R4DNJJSo/YoyHJknYIM9oeoJRmcQyXYzlFWGKo3CgkaOw6SH6a/2qAfgtoMled0NmWCZuc/rB8cRHuuJvoEq3YhtSxNVNx67+zmK/NS0r3rVF6Lxci3N2LZoOp1YzJ1EnvqwJPJucDiK1EFjmqi9S/0ueN4rbCtR7H8Uzr6vrZ9KsGP9w8QYrRrdOcyIpydJP2aiOArx+J2p34qj36vXz16cOfLpfoOXAYDmRXakG5ARoxl0NWBhkZOgtKmYPKfWydYmBrk6xTdNgFoPszOo7P/MUzFvP2WfegK0ZC7wd/366BdwzRPBRpqZ6Uf7yEPpof9q0SVJrc92kUQVr56vZ9zsfBXsbRana+Z7mrDnN5xgg1IfuR58Xglw3KjMdh1RthvYKuoLXTRf/3yB6kysWouLUHGOzJ0fmIkhsQ8GQYnw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(38070700021)(4143699003)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QZYUHm6VootB9alCMM9GJuSa+1fKBgpRk6HwQSADsoNuF/QMVUVE7iMY4ieb?=
 =?us-ascii?Q?pcIbY+SOsdzD8rHDYz/bBadEB2A3xyv8QF7EcHxBbdTMuS/ZSCT7E3PzOxjp?=
 =?us-ascii?Q?rNpsDUwmbTACTD9ISHMtFkLbPF+VRMruZtsdTULLABeX3xYSDywcPYgFdD6+?=
 =?us-ascii?Q?nPrl0JfukEBcWa0C+d6YsZUpYHa/l7rRfY6w2wobJkviVrQGoek4IHTDfCl4?=
 =?us-ascii?Q?U3f2ntbjgBD9nPtgnmGZwU9plMWtPlr5fNDnEjU2mX1klGo48Rzremm2Vfnq?=
 =?us-ascii?Q?dlSvs8kuEhJ/hGkX92TDOxEP37Rv8N89n45HMsNWUSu+kBQ7epkDzYDGRuVb?=
 =?us-ascii?Q?bDt62nxOGya+P4zHlX09+tRcgrUS5J4dpBcTxZJosk0p7VM8e11IRSiQCK9a?=
 =?us-ascii?Q?tT1FdSyKVknHJblSQmXEPvHlU2RwhEenkRIzOveNYXok8wOy2uY8MPiU/trb?=
 =?us-ascii?Q?bG0Q9xNDFhetFlJm5i/TwvU+CaYdMOTvFtRqix6qZDw2QDnX4IEOo+ysQteM?=
 =?us-ascii?Q?JuB4G6avLPmbt/JwVws05I8/moUicOU7VzoqB5xlqXZ6q0Xr13axaXzGpCy9?=
 =?us-ascii?Q?f77OesJgccJrExL7eqVeys3eWkDYeKWWpNTwxu3yV8ZKbdaFGH/UnMtaBdKB?=
 =?us-ascii?Q?UXH6icGLiTSfATSGm7+Y2e9/M71k1duS15DniBvF9DxoLEd2+LJVWL8fCkcO?=
 =?us-ascii?Q?RP/zHI30ZTOnUeQG3UecpmDgPkF2tgosZPDL0IQPwtoDiB3NxfjfA+yp3sPT?=
 =?us-ascii?Q?iRE8+0PDAblHuO/S5OZM4d2mqfPVCaGao4KMgWvug6d/g9uMbYzd8fhnbgzw?=
 =?us-ascii?Q?Zx91RRbSDhQbgyHWrCBz0efqz0YW9JcxILYG52juFzO3os3DPgCkdl9sAGQO?=
 =?us-ascii?Q?ad9DuCogy26VgOizytSzVgVhkh7bi2I0TYcy58grj9tO/MvKtAFQ+qWXJczw?=
 =?us-ascii?Q?q41Nhv07LiDqQIoSFOhNYDIEVcgjH2n1H8zfsajw4m8CAj1HwzrKiaznNnTb?=
 =?us-ascii?Q?6nEV4vHHRASUj42aAbYvIMik6M9Zl0C0C92j31Ikzh2AUjtbJG7qpcaxBwlS?=
 =?us-ascii?Q?8jHWvj5VNJkLgGvoCs3mcQ2QF6FF7mEj9TXT1SOrZ6iUWFSCiDpGKLlq0wEe?=
 =?us-ascii?Q?2OwjM/DQcDVkpFQuub7oUPg2xCwDLOwpWVsEwloUGCTsixxaBn/GhfVxVfwH?=
 =?us-ascii?Q?eGVZHbtRl0Iw+ovdy6eHwz6f9INbifoWjbXOcd7AreQTEtFGj/iWM9ygff9P?=
 =?us-ascii?Q?EkTCEGyeGN0q2xJG1rQXxvXdiaV7XOQTLHp8PyfdM3TE6mlHE1SvY/HHM9Oj?=
 =?us-ascii?Q?tovpevNtBxmsgJdirpr/KNZsBK/03jc3tA6c7IGeuhlAKmZMvx1VI5Vh+4or?=
 =?us-ascii?Q?AJOTzMlFMTzdoiGFnKjGxCFqkSKeGQ0DUls6qkOFrL5YTVtTiPPxMeBXlmL7?=
 =?us-ascii?Q?sDvPATJdraBGOHw2yzxNLTrJ4q2Rs7zf91EUg4XmQjbAbLhz4DgAM0rV6U5g?=
 =?us-ascii?Q?Pe1at9lpG6TBZ6n8WpDm53UU80jQCAfyMdjjNRWu6yyu5f33+5KPBo/5BLQZ?=
 =?us-ascii?Q?CT9nhhij8FJxgQZj0QutGYXklzPceHxZCpAWuqQpX62yF0H5Kp5fUasH2K13?=
 =?us-ascii?Q?09IPQGLxRWZF6ZwEqnO18sZIvWXrbC2BJf453IgFH97v7Pd2ldul06L3MfON?=
 =?us-ascii?Q?u1Ed0BwwqOapUyAle4+tQXTQACg2uAjgh3JHAOqVRQEez1bBgaKKuZ4pMtgw?=
 =?us-ascii?Q?0UhZYCk1sQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 376029bf-705c-49a2-dc68-08deb25aa523
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:19:12.0426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBI+GGvO/LN1HzljlKVjvL4nOKq1504TB2YYtROkNBKd3R4H9yZvxekrYJXknKt+xvDOVoKbPskhPwTlB2c42Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7425
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 08:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127003

Hello,

what is the purpose of this patch?
All these CVEs are already marked as fixed in sbom cve reports.

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of hongxu via lists.openembedded.=
org
> Sent: Friday, May 15, 2026 7:54 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v2] 7zip: update CVE_STATUS for fixed-versi=
on
>=20
> These CVEs was fixed in current 7zip version
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-extended/7zip/7zip_26.01.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipe=
s-
> extended/7zip/7zip_26.01.bb
> index 61be89c7ba..6da5b08347 100644
> --- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> +++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> @@ -68,3 +68,15 @@ RPROVIDES:${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
>  RPROVIDES:${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-47111
> +CVE_STATUS[CVE-2022-47111] =3D "fixed-version: The issue was found in 7-=
Zip
> 22.01. Some later versions are unaffected."
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-47112
> +CVE_STATUS[CVE-2022-47112] =3D "fixed-version: The issue was found in 7-=
Zip
> 22.01. Some later versions are unaffected."
> +# https://sourceforge.net/p/sevenzip/patches/417/
> +# https://www.appsecure.security/vulnerability-database/cve-2023-40481
> +CVE_STATUS[CVE-2023-40481] =3D "fixed-version: That bug was fixed in v23=
.00."
> +# https://www.appsecure.security/vulnerability-database/CVE-2023-52168
> +CVE_STATUS[CVE-2023-52168] =3D "fixed-version: A high-severity vulnerabi=
lity
> identified in the NtfsHandler.cpp NTFS handler of 7-Zip prior to version =
24.01."
> +# https://www.appsecure.security/vulnerability-database/CVE-2023-52169
> +CVE_STATUS[CVE-2023-52169] =3D "fixed-version: Relates to the NtfsHandle=
r.cpp
> NTFS handler in 7-Zip, affecting versions prior to 24.01."
> --
> 2.34.1



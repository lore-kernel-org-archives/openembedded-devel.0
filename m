Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDBFCAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 12:11:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.47])
 by mx.groups.io with SMTP id smtpd.web10.4459.1759488167350734699
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 03:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hbkworld.com header.s=selector1 header.b=HR5cStaL;
 spf=pass (domain: hbkworld.com, ip: 52.101.69.47, mailfrom: joao.lima@hbkworld.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qedYxENakO7SIpmtL5jQ9VAm4CW3QNXdfUBpOFnarIgLDDQh69A23UIY2XiZ/Ax0D4BDNYcgIClMn1nSE5SIJEqXbNDDay04lKNSGupgtRoItLOc+40NkJj/T+Hu6aVbir9t22Bjz3D5YednMHQBQ225mP1pFDXuypVpNEX9o3i8uEPlfco68wXIRnX3WNrUqhjadcFFy/ZqtcZ1pxhGNIdTw+vqVWqXvwfGv+aX5B3vQDVEDedtCM3Zsw0tYTOi6vRSk7P68bSL0SA9IN4Cr00MaSY0lBvtDN3qFyoXTUSGaUJ5viFsyYe+pJHKsJlWj2rRrtWYIU+aajRNvmhq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Qk5Y+7XU7vB9BPZbjKMuLp+7IR3Di30OqErRStgQec=;
 b=noC3CE2WfGSv4OGyM2HRRfr0dDJMxgnms58j/BI2XvhTdrdzu4L5i0sDrB4vJH7SHJOHOIj8qicLup4OuEHQNWANzhO70wg2Xye/ayl+0psQ2QPMwpKQ7Txyj/P5YylSuQry+Amk39Bi1jCQgSIXgaJ4S647bipF0o6siP4LehchrbfFXkfPSumF1OS7vBb/86sQZKrQV3DpKcYfGicecKOiygLUmpVlNUa8q3owEajTgDQaJ7dqoCrINfgjwM6Apg4Tv/kGe95GMkc5dCat3AVB5pJtpnrZIxBnwrkHB7R9MSKEuNndRbqTwd+j2M3Fg28MGXzzaoFzW6/XwHWjPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hbkworld.com; dmarc=pass action=none header.from=hbkworld.com;
 dkim=pass header.d=hbkworld.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hbkworld.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Qk5Y+7XU7vB9BPZbjKMuLp+7IR3Di30OqErRStgQec=;
 b=HR5cStaLHojC7Pd6AuvZyWuaTnzKuJWVcQJVfVVAtwymWeQR2J907dg6SKfjK/SCXxiEMTX7B9sGOpYPbaiUCIkvVB53eJaa/EMNWutt3P7I5EE0jLebnxW1ZuREl9a/k6rGIQOq7Og82T1XxMGtrsN8T1EkBdG6/xTalmBavgn1c4nGXgCN65WTS4ql4NsSKhYXNiy8osaptcdwddBqtsaUDe7ilGYwDxbLUyx/4x1iX//TbMNXeRhIBAcQxDTk29sgdtfoS7mJUdOZwunZab7TaSyjySVUmj2clMooEkCF2la+52sjLzwfbWblYMw4MSHjTBR47NHwF4+UdWDctg==
Received: from PAVPR09MB6206.eurprd09.prod.outlook.com (2603:10a6:102:329::20)
 by VI2PR09MB7631.eurprd09.prod.outlook.com (2603:10a6:800:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Fri, 3 Oct
 2025 10:42:34 +0000
Received: from PAVPR09MB6206.eurprd09.prod.outlook.com
 ([fe80::55e6:b0b1:b520:329e]) by PAVPR09MB6206.eurprd09.prod.outlook.com
 ([fe80::55e6:b0b1:b520:329e%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 10:42:34 +0000
From: =?iso-8859-1?Q?Jo=E3o_Lima?= <joao.lima@hbkworld.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, =?iso-8859-1?Q?Lima=2C_Jo=E3o?=
	<joao.raul.434@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
Thread-Topic: [oe] [meta-oe][PATCH 0/3] openocd: Add dmem support and update
 dependencies
Thread-Index: AQHcM6Wm4U+T7HfKiUKG9oGUemuylbSwO78F
Date: Fri, 3 Oct 2025 10:42:34 +0000
Message-ID: 
 <PAVPR09MB6206FB9E373943857F298FC29AE4A@PAVPR09MB6206.eurprd09.prod.outlook.com>
References: <20251001130452.542-1-joao.lima@hbkworld.com>
 <a799cdbe-54b5-484e-84e2-4a847236aa3d@gmail.com>
 <DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CANPvuR=Hu-4KYs7CjHTab4_sFVC_vah1J+b=K+aw57b3Bs6P7w@mail.gmail.com>
In-Reply-To: 
 <CANPvuR=Hu-4KYs7CjHTab4_sFVC_vah1J+b=K+aw57b3Bs6P7w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_Enabled=True;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_SiteId=6cce74a3-3975-45e0-9893-b072988b30b6;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_SetDate=2025-10-03T10:42:34.011Z;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_Name=Unrestricted;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_ContentBits=1;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_Method=Privileged;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hbkworld.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR09MB6206:EE_|VI2PR09MB7631:EE_
x-ms-office365-filtering-correlation-id: fe1de37b-e12f-4ce2-f25f-08de0269900a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|31052699007|39142699007|4022899009|8096899003|7053199007|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?PRQecYD075t3TetD0pqb6r/qQ5f51oArs+bPuc5sxXk7rc618WSiYHj3/6?=
 =?iso-8859-1?Q?CQg99z0+3ewgtWtlIgLx+eVhWTY970W0YZNKY2soggeNVAmU+rtH/GtyEU?=
 =?iso-8859-1?Q?w/mXSnu8ZyEpmNbyFL6Xhr1qfN/P8lcoi+KdIopV58IyyBBI+uTxpXFs1m?=
 =?iso-8859-1?Q?dSa+5CbmdaHIktCbC6c0Au8vlVRVuTEy/48khld/b1+ukwRSU97a6xISZG?=
 =?iso-8859-1?Q?SYAL42iy/kVE+l9PucAQHAKgbMMSjP8S+2i0CVZiGIsZ3/C2wX6AXLSpzc?=
 =?iso-8859-1?Q?oAttLadhusiGeunFaN0z2sid9KuqR4Rocs3k/W6ki1rseehcd3t8ULmB39?=
 =?iso-8859-1?Q?6nPDx05SLRz9d/VThlbsdSSw+Xr2hvcsJero4JhWqCsLaI+FT7gyktPpLq?=
 =?iso-8859-1?Q?hPramfReTasER+5W7wovmqqbqijCIx71w28D6LA4VYC0d2DY9RsBd4CLHe?=
 =?iso-8859-1?Q?7wi6xsS2zxsnvA6UmKcYjfbe+CBYXWlL7eCCOV6YlvOjit9ithD8oVB7Is?=
 =?iso-8859-1?Q?YP5GIFFvVNR/RKsTN5byx8Ud/HAEC6Y7CKkb+0iP0bJPilH+OptXyrPc4S?=
 =?iso-8859-1?Q?VKINjsXxFXYQHlUG9jGxas21L9MmSb+Se1AT7CNVnaLaR8Lax7AzkOJLCS?=
 =?iso-8859-1?Q?RKA4a6N18u3DuOAdkfGDcONpu+F36ANrYlxKKjzsO0NxFBIHhE9SHANC5E?=
 =?iso-8859-1?Q?I/TVY4DfAR4RMteRLtXU/YOYcGtU8ITPFur3d95u6p+Z3MgSG5OBiyyZPD?=
 =?iso-8859-1?Q?p0Epn3J8j1fT2i+YFDN03HkoCGhR/Dc8gPpCtijFQnn2l/a9xOXxQqkvdw?=
 =?iso-8859-1?Q?y6a0OquiuDuYFoNnEdP7rMUwTl7Gcq54LaPqB6CH14/N4E7M/nLmiUSv+t?=
 =?iso-8859-1?Q?CxAfHW+D8ZgbuFtkxQ+8oOYQiaTLoX8KT9UZE+eEIVyW4Y2I/XDuN9oEjE?=
 =?iso-8859-1?Q?O4tbnt7TpAIDM5Cl+rhwfJBfvvVckE44qu6crubfC4gr3dTLhbyPVWqSCK?=
 =?iso-8859-1?Q?PSmjkRbEqTyaWboaYYWE1M2xEq2hN2B22YSQjb620e5yyL/TXaD5nFn2nK?=
 =?iso-8859-1?Q?qWjinjBYCY2iFrQFn9SbwtKqUFlc+7mDhNPMuWqR0Mw49nN+V9oxMNnGmy?=
 =?iso-8859-1?Q?uovzySAyfRLyRhrlx0opoOlvbRebAzAFg2l+7HheaQkBt8QCiZBBqVCNPb?=
 =?iso-8859-1?Q?iQxxhzoTy4pH+5pMaTju6KvgAPDbAuG3556RghbMUZ/j/lTi+k+ti++PV1?=
 =?iso-8859-1?Q?Eeiq3Jr06mUPHUtO+Qkh3+PgBn9YpYFmUr4f2np3ygwG3BbkHb7EjYKwLO?=
 =?iso-8859-1?Q?79+O5lbkMqQYMQ6CloXHuGile9HBaNEbUlRKaMv1BNYEHLBa8oPFfbDVWH?=
 =?iso-8859-1?Q?ZNxe1si4M2g9nifXdG5uEiJbAwm5vg6VLWKBkKZnVZLCjSEapg7aQ7Oq/R?=
 =?iso-8859-1?Q?ZQ7+lyeeguTnbbGOhh4Jftj/pg9EOv4w4pafDYAxr8iOX508+wi9HIVXVc?=
 =?iso-8859-1?Q?BS++ZSdeoRKSIKOkfgL50Z?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR09MB6206.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(31052699007)(39142699007)(4022899009)(8096899003)(7053199007)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xjuvsxrEujMlSOblh11ylzdBE5c+E/VzqKRitvsRRINheNloPe/lKChIvk?=
 =?iso-8859-1?Q?qpNb/Wr1YDaFaBLXHLEmunsh0eotfWCgD/S0x26Q0V+UAV1darlgmlwSwt?=
 =?iso-8859-1?Q?JHA1rpztdqLyfOuPlsiuhoMxFAPWerFrq7dTkPPZskPyx+zhdn5mmAZyng?=
 =?iso-8859-1?Q?oA8APQtxeb19vgwptDI2hKleXI1WmhxKenAtJvlvweIO6C+BoWK8rqi/lP?=
 =?iso-8859-1?Q?VlTGsq/ygJBS8E0oqt9nL1uP4pbNwqFMyDUQjBcZZk3xeMaCXOvImCr6qZ?=
 =?iso-8859-1?Q?ODElu+eEUGEox6gAMhCk/KaFFSsMm3Qx/m3n/uNxHX9DxudbUHeqL6n9Al?=
 =?iso-8859-1?Q?j1He8QuuPgtMlt0a5OlukTPV3wBIi/BmBa+Tfv7aeW85YpQ1WEjroTNDIh?=
 =?iso-8859-1?Q?eF3i9nz8Bz7qKrtk4PB1zWxK6s4rvzmAAUdKpqCVmSOC2VxM69VWq8HP6/?=
 =?iso-8859-1?Q?rPYS9tjwV4PANjz+89zu33NfvHkWPEmKVA7aZjtOXxs4wOsoT92+OFIH19?=
 =?iso-8859-1?Q?9EgNoluIIC8+0SqEwxCEOweTlPiDHbNOrwNyP0mFPaIN/+6q8KnnckXBls?=
 =?iso-8859-1?Q?yOcXKaVUiK69RGEq9kovmL/K1C8tn1nnlJ51K3iGVOuF4IqBj6Dvoc2Onf?=
 =?iso-8859-1?Q?sKydxpScUs7QmsaaYeMwkqrggmorkaMYQFATzCbjCL4saJG2sWGFYoYbyW?=
 =?iso-8859-1?Q?iatE3ye4FzQ+bIZ3KaI+LxZ5kXX2Oc3Yi9p4aJj60wzLLUb8KYzqe0aGgL?=
 =?iso-8859-1?Q?z6qQpO5xfE2SbmvB/KneVt/L3UtHCGHRat+kaYqnLVwKEvCXjVM93FwcXx?=
 =?iso-8859-1?Q?XGB0AXZoXOCKYbMP1UW2D8Yz/3pNoByYXd28B4NTKZHemtpsTzcxl6Rw6v?=
 =?iso-8859-1?Q?ZTQizA9H8FrY3LdJ0xKnpaYf7lB/3chA9v1upKYNu1xoXvMrD4D5ejwp5o?=
 =?iso-8859-1?Q?JZwwyZeI/X39qF4uBoXoj5NGGlRVh3AXu2/gI48ZhvCpq52KNnMuwmNFNc?=
 =?iso-8859-1?Q?DIpSEaLZ5kbBXxwAbsm70G/KmrG71Whg5DGIGTHnYnajLgwZf9g4eWKZu7?=
 =?iso-8859-1?Q?CcIpfMeEfzPnzDHKim0xcqQ/xZayTXt4zfRwOjebz7XIzXDNlgOMHKAYCN?=
 =?iso-8859-1?Q?9FD7CGtcVAgFe85OMoeEm30UryrZHn9AgUcPja18z2tgQmFRgFWHtVPK3Z?=
 =?iso-8859-1?Q?TtUOAXbZ6WrocceYK9Av8bIPysUEEMZ16OWZbYdUd52mPCNrXZcylbK95X?=
 =?iso-8859-1?Q?4m7zseBhU4r7DV/wsvqjAl1HJajciCw1YxYRrxUHi+Y0Wv8hxxhPScTeZo?=
 =?iso-8859-1?Q?ZCVaEYeRTHFBKILwUF+5zqW20Go9PkQjyuacat8/ntBAqp/tD4Gy9AG74U?=
 =?iso-8859-1?Q?5Wmm595BQjgyIfS0Smpc3hd10tGC5uL/p7wenp/tN+z2S/S/mxqVhyNT/b?=
 =?iso-8859-1?Q?rA9XisDD/J9mm1JMzGVWUUxNB6z2XCmbYcfZHk2UyE3ZAJKkt+hJTmCd04?=
 =?iso-8859-1?Q?2bxzd5cbQYdvp7vCFiCwF+d6ltdPNm0/hA5xm0sC0ysGl5NiahqxGF9jyw?=
 =?iso-8859-1?Q?cuH2fOYjuF4tuF3xQi9wbSSxAdLOmRJ4eE+gHI/lNAYR1b10Lt8f4A66uc?=
 =?iso-8859-1?Q?ecF0/L61u3PwK0Lt4ymaRXERTYvexA+g3z?=
MIME-Version: 1.0
X-OriginatorOrg: hbkworld.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR09MB6206.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1de37b-e12f-4ce2-f25f-08de0269900a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 10:42:34.4054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6cce74a3-3975-45e0-9893-b072988b30b6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUYdSOcKk++TxGOMTqDkMMwBGCxHIFADw0OLbnvmDI1R2WkypDN1EQS/C4JafGJ2OTgS1hMTIf9Pe7HZeXQBSnTeyYfVbQAq2Rk+oSTKiEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR09MB7631
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PAVPR09MB6206FB9E373943857F298FC29AE4APAVPR09MB6206eurp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 12:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120217

--_000_PAVPR09MB6206FB9E373943857F298FC29AE4APAVPR09MB6206eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Khem and Jose,

Thanks for the reply.

I have already rebased my patch series on top of the latest master and comm=
itted the latest changes.
---
Khem, I submitted the series as intended.
However, I submitted it twice, because the first time, for some reason, it =
took longer than expected to appear in the meta openembedded layers patch l=
ist (https://patchwork.yoctoproject.org/project/oe/list/?submitter=3D1534).
Only the last series should be considered.

Thanks for your help.


Cumprimentos /Kind regards



Jo=E3o Lima

Embedded Software Developer, Genesis High Speed

UNRESTRICTED
________________________________
From: Jose Quaresma <quaresma.jose@gmail.com>
Sent: Thursday, October 2, 2025 3:05 PM
To: Jo=E3o Lima <joao.lima@hbkworld.com>
Cc: Khem Raj <raj.khem@gmail.com>; Lima, Jo=E3o <joao.raul.434@gmail.com>; =
openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openemb=
edded.org>
Subject: Re: [oe] [meta-oe][PATCH 0/3] openocd: Add dmem support and update=
 dependencies

Hi Jo=E3o

Jo=E3o Lima via lists.openembedded.org<http://lists.openembedded.org/> <joa=
o.lima=3Dhbkworld.com@lists.openembedded.org<mailto:hbkworld.com@lists.open=
embedded.org>> escreveu (quinta, 2/10/2025 =E0(s) 12:50):
Thanks for the feedback.

I'm currently working on top of:
URI:    https://git.openembedded.org/meta-openembedded
Branch: scarthgap
Commit: e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943

Should I rebase my patch series on top of the latest master (or master-next=
) branch, even though I'm targeting the scarthgap branch?
As this is my first submission to the project, I want to ensure I'm followi=
ng the correct process.

Yes you are right and should send on top of master or even master-next.

If the patchset does not include breaking changes they can be backported to=
 the stable branch,
this last criterion will be the responsibility of the maintainer.
For example, major bumps in the version are generally not accepted to be ba=
ckported.

Jose


Thanks for the submission tip.


Cumprimentos /Kind regards



Jo=E3o Lima

Embedded Software Developer, Genesis High Speed

UNRESTRICTED
________________________________
From: Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gmail.com>>
Sent: Wednesday, October 1, 2025 5:22 PM
To: Lima, Jo=E3o <joao.raul.434@gmail.com<mailto:joao.raul.434@gmail.com>>;=
 openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lists.=
openembedded.org> <openembedded-devel@lists.openembedded.org<mailto:openemb=
edded-devel@lists.openembedded.org>>; Jo=E3o Lima <joao.lima@hbkworld.com<m=
ailto:joao.lima@hbkworld.com>>
Subject: EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support and u=
pdate dependencies

CAUTION! External Email. Do not click links or open attachments unless you =
recognize the sender and are sure the content is safe.
If you think this is a phishing email, please report it by using the "Phish=
 Alert Report" button in Outlook.

On 10/1/25 6:04 AM, Lima, Jo=E3o wrote:
> From: Joao Lima <joao.lima@hbkworld.com<mailto:joao.lima@hbkworld.com>>
>
> This patch series updates OpenOCD to support direct memory access (dmem)
> via SWD emulation for Texas Instruments AM64x and J784s4 platforms.
>
> Changes include:
> 1. Version bumps:
>     - openocd: 91bd431 -> 66ea461
>     - jimtcl: fcbb449 -> f160866
>     - libjaylink: 9aa7a59 -> 0d23921
>
> 2. Platform support patches:
>     - Add SWD native configuration files for AM64x and J784s4 boards
>     - Configure DMEM access parameters in ti_k3.cfg for direct memory ope=
rations
>     - Set up DAPBUS debugger and emulated AP descriptions
>
> 3. Build configuration:
>     - Enable dmem adapter driver (--enable-dmem)
>     - Enable internal jimtcl (--enable-internal-jimtcl)
>     - Add both features to default PACKAGECONFIG
>
> This enables self-hosted debug configurations where OpenOCD runs on one o=
f
> the CPUs inside the SoC.
>
> Upstream-Status: Submitted
> - https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopen=
ocd.zylin.com%2F%23%2Fc%2F9020%2F&data=3D05%7C02%7Cjoao.lima%40hbkworld.com=
%7C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%=
7C0%7C638949326829662188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%=
7C%7C%7C&sdata=3Dmr0knEMNTixqKo20WB6sAP3w0Os3PC%2FHaEMGG%2F3SDjw%3D&reserve=
d=3D0<http://openocd.zylin.com/#/c/9020/>
> - https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopen=
ocd.zylin.com%2F%23%2Fc%2F9021%2F&data=3D05%7C02%7Cjoao.lima%40hbkworld.com=
%7C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%=
7C0%7C638949326829712748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%=
7C%7C%7C&sdata=3D%2F%2Fc%2BmSu3HrA%2F2IWn9jqFAo4x2bNR54ABpO0mSZEZ%2FCM%3D&r=
eserved=3D0<http://openocd.zylin.com/#/c/9021/>
>
> Joao Lima (3):
>    openocd: bump the openocd, jimtcl versions
>    openocd: add dmem support to am64xx and j784s4 platforms
>    openocd: enable dmem and jimtcl
>
>   ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
>   ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
>   .../recipes-devtools/openocd/openocd_git.bb<http://openocd_git.bb/>   |=
 13 +++-
>   3 files changed, 151 insertions(+), 4 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-bo=
ard-ti_-_swd_native.cfg-Add-support-for-direct.patch
>   create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-ta=
rget-ti_k3.cfg-Add-support-for-direct-memory-a.patch
>


Thanks for the patchset, Please rebase it on latest master branch or
master-next branch and resend. While resending send the whole series
together with git send-email *.patch or something so tools like
patchwork and lore can record this as a series.

HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=E9 R=E9gio,=
 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais anex=
os s=E3o confidenciais e destinados exclusivamente ao(s) destinat=E1rio(s) =
indicado(s). Se recebeu esta mensagem por engano, por favor notifique o rem=
etente e elimine-a de imediato. =C9 proibida a divulga=E7=E3o, c=F3pia ou u=
tiliza=E7=E3o n=E3o autorizada do seu conte=FAdo. This message and any atta=
chments are confidential and intended solely for the designated recipient(s=
). If you have received this message in error, please notify the sender and=
 delete it immediately. Unauthorized disclosure, copying, or use of its con=
tents is prohibited.





--
Best regards,

Jos=E9 Quaresma

HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=E9 R=E9gio,=
 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais anex=
os s=E3o confidenciais e destinados exclusivamente ao(s) destinat=E1rio(s) =
indicado(s). Se recebeu esta mensagem por engano, por favor notifique o rem=
etente e elimine-a de imediato. =C9 proibida a divulga=E7=E3o, c=F3pia ou u=
tiliza=E7=E3o n=E3o autorizada do seu conte=FAdo. This message and any atta=
chments are confidential and intended solely for the designated recipient(s=
). If you have received this message in error, please notify the sender and=
 delete it immediately. Unauthorized disclosure, copying, or use of its con=
tents is prohibited.

--_000_PAVPR09MB6206FB9E373943857F298FC29AE4APAVPR09MB6206eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hello Khem and Jose,<br>
<br>
Thanks for the reply.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I have already rebased my patch series on top of the latest master and comm=
itted the latest changes.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
---<br>
Khem, I submitted the series as intended.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
However, I submitted it twice, because the first time, for some reason, it =
took longer than expected to appear in the meta openembedded layers patch l=
ist (<a id=3D"LPlnk977980" href=3D"https://patchwork.yoctoproject.org/proje=
ct/oe/list/?submitter=3D1534">https://patchwork.yoctoproject.org/project/oe=
/list/?submitter=3D1534</a>).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Only the last series should be considered.<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for your help.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof" id=3D"Signature">
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;">Cumprimentos
<i>/</i>Kind regards&nbsp;</span></p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;"><b>&nbsp;</b></span></p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;"><b>Jo=E3o Lima</b>&nbsp;</span></p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;">Embedded Software Developer, Genesis High Speed&nbsp;</span></p>
<div class=3D"elementToProof"><br>
</div>
<div style=3D"text-align: center; margin-left: 5pt; font-family: Calibri; f=
ont-size: 7pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
UNRESTRICTED</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jose Quaresma &lt;qua=
resma.jose@gmail.com&gt;<br>
<b>Sent:</b> Thursday, October 2, 2025 3:05 PM<br>
<b>To:</b> Jo=E3o Lima &lt;joao.lima@hbkworld.com&gt;<br>
<b>Cc:</b> Khem Raj &lt;raj.khem@gmail.com&gt;; Lima, Jo=E3o &lt;joao.raul.=
434@gmail.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembedd=
ed-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH 0/3] openocd: Add dmem support and=
 update dependencies</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>Hi Jo=E3o</div>
<br>
<div class=3D"x_gmail_quote x_gmail_quote_container">
<div dir=3D"ltr" class=3D"x_gmail_attr">Jo=E3o Lima via <a href=3D"http://l=
ists.openembedded.org/" originalsrc=3D"http://lists.openembedded.org/">
lists.openembedded.org</a> &lt;joao.lima=3D<a href=3D"mailto:hbkworld.com@l=
ists.openembedded.org">hbkworld.com@lists.openembedded.org</a>&gt; escreveu=
 (quinta, 2/10/2025 =E0(s) 12:50):<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div class=3D"x_msg6719625025468944186">
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Thanks for the feedback.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
I'm currently working on top of:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
URI: &nbsp; &nbsp;<a href=3D"https://git.openembedded.org/meta-openembedded=
" originalsrc=3D"https://git.openembedded.org/meta-openembedded" target=3D"=
_blank">https://git.openembedded.org/meta-openembedded</a> &nbsp;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Branch: scarthgap &nbsp;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Commit: e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Should I rebase my patch series on top of the latest master (or master-next=
) branch, even though I'm targeting the scarthgap branch?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
As this is my first submission to the project, I want to ensure I'm followi=
ng the correct process.<br>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Yes you are right&nbsp;and should send on top of master or even master=
-next.</div>
<div><br>
If the patchset does not include breaking changes they can be backported to=
 the stable branch,</div>
<div>this last criterion will be the responsibility of the maintainer.</div=
>
<div>For example, major bumps in the version are generally not accepted to&=
nbsp;be backported.</div>
<div><br>
</div>
<div>Jose</div>
<div>&nbsp;</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div class=3D"x_msg6719625025468944186">
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Thanks for the submission tip.</div>
<div id=3D"x_m_-1372481023642229588Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<p style=3D"margin:0cm; font-family:Calibri,sans-serif; font-size:11pt"><sp=
an style=3D"font-family:Arial,sans-serif; font-size:9pt; color:black">Cumpr=
imentos
<i>/</i>Kind regards&nbsp;</span></p>
<p style=3D"margin:0cm; font-family:Calibri,sans-serif; font-size:11pt"><sp=
an style=3D"font-family:Arial,sans-serif; font-size:9pt; color:black"><b>&n=
bsp;</b></span></p>
<p style=3D"margin:0cm; font-family:Calibri,sans-serif; font-size:11pt"><sp=
an style=3D"font-family:Arial,sans-serif; font-size:9pt; color:black"><b>Jo=
=E3o Lima</b>&nbsp;</span></p>
<p style=3D"margin:0cm; font-family:Calibri,sans-serif; font-size:11pt"><sp=
an style=3D"font-family:Arial,sans-serif; font-size:9pt; color:black">Embed=
ded Software Developer, Genesis High Speed&nbsp;</span></p>
<div><br>
</div>
<div style=3D"text-align:center; margin-left:5pt; font-family:Calibri; font=
-size:7pt; color:rgb(0,0,0)">
UNRESTRICTED</div>
</div>
<div id=3D"x_m_-1372481023642229588appendonsend"></div>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_m_-1372481023642229588divRplyFwdMsg" dir=3D"ltr"><font face=3D=
"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>From:</=
b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, October 1, 2025 5:22 PM<br>
<b>To:</b> Lima, Jo=E3o &lt;<a href=3D"mailto:joao.raul.434@gmail.com" targ=
et=3D"_blank">joao.raul.434@gmail.com</a>&gt;;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bla=
nk">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:ope=
nembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-deve=
l@lists.openembedded.org</a>&gt;; Jo=E3o Lima &lt;<a href=3D"mailto:joao.li=
ma@hbkworld.com" target=3D"_blank">joao.lima@hbkworld.com</a>&gt;<br>
<b>Subject:</b> EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem suppor=
t and update dependencies</font>
<div>&nbsp;</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION! External Email. Do not click links or open attachments unless=
 you recognize the sender and are sure the content is safe.<br>
If you think this is a phishing email, please report it by using the &quot;=
Phish Alert Report&quot; button in Outlook.<br>
<br>
On 10/1/25 6:04 AM, Lima, Jo=E3o wrote:<br>
&gt; From: Joao Lima &lt;<a href=3D"mailto:joao.lima@hbkworld.com" target=
=3D"_blank">joao.lima@hbkworld.com</a>&gt;<br>
&gt;<br>
&gt; This patch series updates OpenOCD to support direct memory access (dme=
m)<br>
&gt; via SWD emulation for Texas Instruments AM64x and J784s4 platforms.<br=
>
&gt;<br>
&gt; Changes include:<br>
&gt; 1. Version bumps:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - openocd: 91bd431 -&gt; 66ea461<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - jimtcl: fcbb449 -&gt; f160866<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - libjaylink: 9aa7a59 -&gt; 0d23921<br>
&gt;<br>
&gt; 2. Platform support patches:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Add SWD native configuration files for AM64x=
 and J784s4 boards<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Configure DMEM access parameters in ti_k3.cf=
g for direct memory operations<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Set up DAPBUS debugger and emulated AP descr=
iptions<br>
&gt;<br>
&gt; 3. Build configuration:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Enable dmem adapter driver (--enable-dmem)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Enable internal jimtcl (--enable-internal-ji=
mtcl)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Add both features to default PACKAGECONFIG<b=
r>
&gt;<br>
&gt; This enables self-hosted debug configurations where OpenOCD runs on on=
e of<br>
&gt; the CPUs inside the SoC.<br>
&gt;<br>
&gt; Upstream-Status: Submitted<br>
&gt; - <a href=3D"http://openocd.zylin.com/#/c/9020/" originalsrc=3D"http:/=
/openocd.zylin.com/#/c/9020/" target=3D"_blank">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenocd.=
zylin.com%2F%23%2Fc%2F9020%2F&amp;data=3D05%7C02%7Cjoao.lima%40hbkworld.com=
%7C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%=
7C0%7C638949326829662188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%=
7C%7C%7C&amp;sdata=3Dmr0knEMNTixqKo20WB6sAP3w0Os3PC%2FHaEMGG%2F3SDjw%3D&amp=
;reserved=3D0</a><br>
&gt; - <a href=3D"http://openocd.zylin.com/#/c/9021/" originalsrc=3D"http:/=
/openocd.zylin.com/#/c/9021/" target=3D"_blank">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenocd.=
zylin.com%2F%23%2Fc%2F9021%2F&amp;data=3D05%7C02%7Cjoao.lima%40hbkworld.com=
%7C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%=
7C0%7C638949326829712748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%=
7C%7C%7C&amp;sdata=3D%2F%2Fc%2BmSu3HrA%2F2IWn9jqFAo4x2bNR54ABpO0mSZEZ%2FCM%=
3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Joao Lima (3):<br>
&gt;&nbsp;&nbsp;&nbsp; openocd: bump the openocd, jimtcl versions<br>
&gt;&nbsp;&nbsp;&nbsp; openocd: add dmem support to am64xx and j784s4 platf=
orms<br>
&gt;&nbsp;&nbsp;&nbsp; openocd: enable dmem and jimtcl<br>
&gt;<br>
&gt;&nbsp;&nbsp; ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; ....cfg-Add-support-for-direct-memory-a.patch | 65 +++++++=
+++++++++<br>
&gt;&nbsp;&nbsp; .../recipes-devtools/openocd/<a href=3D"http://openocd_git=
.bb/" originalsrc=3D"http://openocd_git.bb/" target=3D"_blank">openocd_git.=
bb</a>&nbsp;&nbsp; | 13 +++-<br>
&gt;&nbsp;&nbsp; 3 files changed, 151 insertions(+), 4 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-devtools/openocd/openoc=
d/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-devtools/openocd/openoc=
d/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch<br>
&gt;<br>
<br>
<br>
Thanks for the patchset, Please rebase it on latest master branch or<br>
master-next branch and resend. While resending send the whole series<br>
together with git send-email *.patch or something so tools like<br>
patchwork and lore can record this as a series.<br>
</div>
</span></font></div>
<br>
HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=E9 R=E9gio,=
 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais anex=
os s=E3o confidenciais e destinados exclusivamente ao(s) destinat=E1rio(s) =
indicado(s). Se recebeu esta mensagem por
 engano, por favor notifique o remetente e elimine-a de imediato. =C9 proib=
ida a divulga=E7=E3o, c=F3pia ou utiliza=E7=E3o n=E3o autorizada do seu con=
te=FAdo. This message and any attachments are confidential and intended sol=
ely for the designated recipient(s). If you have
 received this message in error, please notify the sender and delete it imm=
ediately. Unauthorized disclosure, copying, or use of its contents is prohi=
bited.
</div>
<br>
<br>
<br>
</div>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<div><br>
</div>
<span class=3D"x_gmail_signature_prefix">-- </span><br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr">Best regards,
<div><br>
Jos=E9 Quaresma</div>
</div>
</div>
</div>
</div>
<br>
HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=E9 R=E9gio,=
 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais anex=
os s=E3o confidenciais e destinados exclusivamente ao(s) destinat=E1rio(s) =
indicado(s). Se recebeu esta mensagem por
 engano, por favor notifique o remetente e elimine-a de imediato. =C9 proib=
ida a divulga=E7=E3o, c=F3pia ou utiliza=E7=E3o n=E3o autorizada do seu con=
te=FAdo. This message and any attachments are confidential and intended sol=
ely for the designated recipient(s). If you have
 received this message in error, please notify the sender and delete it imm=
ediately. Unauthorized disclosure, copying, or use of its contents is prohi=
bited.
</body>
</html>

--_000_PAVPR09MB6206FB9E373943857F298FC29AE4APAVPR09MB6206eurp_--


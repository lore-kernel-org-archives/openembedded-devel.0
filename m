Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC79C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:52:59 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.45])
 by mx.groups.io with SMTP id smtpd.web10.885.1714513972122931368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tS0tsVQE;
 spf=pass (domain: siemens.com, ip: 40.107.13.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j62Yi0PDuFGitzU4dbzqLMJKq7GS2gGh/9YZza35s9DDBpWY42pWhv1/cfsUNrrt3hpFSDbKMsbJqjcC7nqHIGvhTV7U6gl3hs2YhHEAgcECDfJqzRi0U3ogoP6fFg8UD4TDH4IZyTPbSSCHwtJvskCYgjcDwpmLGj+Hj6/igq2FpUaxNgi/bwJU13oDqC0Q9qqqW6mgyR8nVIyZr5/4QK1Aa2G08nCBYfEK45h8Sb26weCsKJdFiNRNPEMTAeUTs0oqsjUGRuQ+gLyY+l5+DqzZkqPsixj1A1C+Xi8blSv2fQMoycN4gQd8ObxSCHP5UsKA+J1vQj9w6lyNqSGR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4kIOARR9jirczKeFxzQ4L12tZ+7zz23MnJP6ALyjSo=;
 b=YnDvJuFeWmU8A9nbFBMJHV+mZ1fsvmVr2EkD+THpbnS1FUGTdxsZnPN12vDekjyIS/MkcYA9jDPEcYVqaHZFauFSCkYWQdHb6qv+yXh/UnZqSm7ASM4XFBO+BbzZ03ajvHDnjTrR7sQdrTCaE/b501qZDfHgAhsMiFfRucfJXVk9T8TJma6GhdmCxQxY7ALXQ3+K1VNDhUc1h87aN98vIaADirPcGcKOjS1zxbSHiuf7CgoF2zdtXCu9YDMgxsk6e+vp+DkOzuSWUsd0p1emRbHe7Wc8TJBpR8yOFxSUcnHfxO+8DrZUmPZ8+uZW3lAhDw6pTrgDKcRjK/EOWvb/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4kIOARR9jirczKeFxzQ4L12tZ+7zz23MnJP6ALyjSo=;
 b=tS0tsVQEOQ9bqRDZAQonX+GOf9pZkEFjgF/Ba5CO0hCNDnSpE5D31pibGlURnBhDyhfEUN3bHgk1dl2lI3NYNodS3gFI64XKjzJv2KAb9iuKNy0KPsq1NBv4X8t6LJbMW2D4/gN6johng2WhGSHNouJgN7QpUepOIR7K14MMN0MT32vZfO7LObiXvAcMe7kOZ3J3oSBfW5pPPLftD59pMb4NGEFqkdc7OdMx3W6Cgtpb3eDmkTZXEZa9IFscsQDPCs0u+V6N7fTXIjbU4V929/Y3zYqfaifGz6YarRCWXilOWkQ/WEx3Uc+vJJ9Ohvg6Ju7ulSbqJWJLoAZmN6M7FQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 21:52:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 21:52:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][PATCH] nginx: Upgrade stable 1.24.0 -> 1.26.0
Thread-Topic: [meta-oe][PATCH] nginx: Upgrade stable 1.24.0 -> 1.26.0
Thread-Index: AQHam0hfqlfJxwUnL0STfXAvEHFzB7GBWnpg
Date: Tue, 30 Apr 2024 21:52:47 +0000
Message-ID: 
 <AS1PR10MB5697545E5F326721B30C40BEFD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240430214921.2190109-1-peter.marko@siemens.com>
In-Reply-To: <20240430214921.2190109-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=95fd27f6-c8ee-491d-8829-aa01b7565908;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-30T21:51:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6020:EE_
x-ms-office365-filtering-correlation-id: 9801d234-2495-48e7-4470-08dc695fdfc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?conXHgZ6udS65tFWfm5BgkdzoLg1/dU43rbHGiJcbw0nlu4SQzuI2Co5ou0I?=
 =?us-ascii?Q?fRgjs/lYoewPhFNO78dRQHZDBB7o4HXoirKybmzhrZdOUhGzpqUjzfdl/g9z?=
 =?us-ascii?Q?4fCnPuAFr3aR8o0Xpuy+/27w/RSrDJJ2abHLAlYMzqojE8vVVtY7fDuFFzdb?=
 =?us-ascii?Q?LB6cjb90GItHAkfghvsdJ9LAQhxgu4iT5yJlWtSRHs3PNqnY70YHGhHd+f63?=
 =?us-ascii?Q?YOxk9dI99wDHwCg1RxabR6YtUbWiFyZgDv3KtK0ulH0iDN4+I9cMi7BCj1x7?=
 =?us-ascii?Q?FjfItW3i0PVifsTvIatuP7x1rCnMJ4Hn+ZgNlmdfnWD3BsqaRSFTNt7KMRIR?=
 =?us-ascii?Q?UuCNsXtIXjigfSzlbUz7/92scZaLMXhrn8WbAITyXLdna+9j+maawz9n+hfh?=
 =?us-ascii?Q?rC4EBu7mdAlTU2CH/rG6TLCEJbxWO/cLQUH5tFvo7VJ02Fhua5/LcpfYVxFS?=
 =?us-ascii?Q?gysJpGmcVkfLU5d51rB0onKXRFUijpiVXUtM6ZnMH5E/nub2l1Z889IBjgHE?=
 =?us-ascii?Q?3WQPe+QvsUC/wtl1PorfqFzARACRaUTFPJo9cKZxv39tmpulQbKx7i9RW/IG?=
 =?us-ascii?Q?nzG7Sl4wxj/8uyyPYQ/wq9mkUxRBPzmNkCU9y8f5vcEaqDmZUQkhduRi8O64?=
 =?us-ascii?Q?TPLIOLqSruXZ3x3Vs7RTKYQ66WuOWfGWoDaiqCEVc2AvzjduyktFTj/YKtR4?=
 =?us-ascii?Q?xkEvuwMHS0AdoB0Rn1hOygf1bhY6OsQvany+/oRkSWmVNjZZgY7bagI/VZwQ?=
 =?us-ascii?Q?/GJLGfly9KE+appiBsLgBfDmtC0TmxlSSTlRg91weJM+PKe4E26xnnPxdkJy?=
 =?us-ascii?Q?liwDtG9GcmDGLGODP/xFHwvm8ArqAUHEPkZx32PHSCNdOZ7mz5y2Xn/LF6P6?=
 =?us-ascii?Q?0tW0UOMtcy9HHWN1DqyeaHlkUC641s6mkd9x0gwcoQWxPD7cobdw91NZaQqT?=
 =?us-ascii?Q?sZ7GNUNfSAtMb2qfYWHzDJRRjlgyNZvlra0OSZjZo36Eyky3mrPNxPHO8qIZ?=
 =?us-ascii?Q?bwy3elNBmAa+owsHvQDrvdwZk4WzF22Vij+42cjFeN4OwjJuTxz/FQRc87Mj?=
 =?us-ascii?Q?nI9j5ZUXpFlG74YtBoxTdYhn/Op74OJxqfuiZIFeE+Lhu1kiwg73cGVYZu9o?=
 =?us-ascii?Q?+GPQeNmA7EcIOEZ4RZ9s+wbhIgXZDWaIgCWW+cbINpvQZdj7v4VoHaAUGdLI?=
 =?us-ascii?Q?XZJcel/FS7qk6F5JEjAT1NQIJSqIsLvWMwiDdgiZbsQWPQEEWes0BcP3oRoy?=
 =?us-ascii?Q?jFM1vnb2C7xDlZ8Kv1N15hKW9ZTZsG6/0vy4cGqILNpuWVTfWem3FGNgZfLC?=
 =?us-ascii?Q?B9aNQ3nM98pHG0sSB4t2kuMLlB9YBviUVN7pEigjXez97w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Yoxo5lB/RntbECzp60uFyTgUG0vPo4Flk0bLcoMijAcE5R5eRuvlh174MmD2?=
 =?us-ascii?Q?CPDKdLhtx9WYGlV+WJ3LlzncwzcsUVNenyDmxrDMUBi/G7q56m1v2dkWmYU/?=
 =?us-ascii?Q?bAy5pPvu9+GTaXvy7sR/c8qNLf5RujXQaIDNvEu+uhzLGT7wLwGOfydcK9LV?=
 =?us-ascii?Q?FUbPQeFWRv13HhZqQI1lX8kw1fY1mSbaqhg6YB6PzAxvNH8/eQuF5Cyel++P?=
 =?us-ascii?Q?TPzcJ/UnMaH8vkOT8rTZokODKnpKkaqeSWyuGYP9knHC76Skf6kCnxWOi7w3?=
 =?us-ascii?Q?NxLyV/dHhF/CDufEI9dc5a0uP+YaPYdWC0dKQllNDeBVRCYek+7VLyEn1uNT?=
 =?us-ascii?Q?+s4/Prs7CStRbXr7q7bc26Rh67yDmPZy5Phcc8+yObnpIwrpNHKtv7n8F5gc?=
 =?us-ascii?Q?yR3LOb6n+cW8yqbL9bHnrfD/AUTf5B0IwTr1orZ4/pxmyVJV0a5eSgzuHC4J?=
 =?us-ascii?Q?034sJGCJ3JWgMFe6JIC0YoR9mjOr2Nizw+C7Z9VJD2tpkm2F1B9UYztSaTKP?=
 =?us-ascii?Q?zAAZ9fn8D/p5Z6Uc7uWHS68pZlPiZXq6p75lZm5lZNQzqtyAhWLrww42eGSJ?=
 =?us-ascii?Q?gleqPO2NswmmHXL5y9YwwsAqFSekb1wKxmk1iaOlLDfrds5T5IfF09C/ecgN?=
 =?us-ascii?Q?oFnhg2YjQ9dptsxHugVO314pEzkXYnf73HMpkgxo/1cSNBfsnpVof1CE2YfY?=
 =?us-ascii?Q?rvqg1T+Es6sre0d95let3VLVzyCK2B6n7I9IudYA12jkAFo3mf6Y3nj8w4SO?=
 =?us-ascii?Q?2/X9GmjgkefeYB0LchY5dsDyZwXeQBNA7IbexOOsAZF8B5pUsmngp3ngWtCF?=
 =?us-ascii?Q?iSyQ1MOqQ3WgNkLVuwKL5BAc7tpUjvEdvs/IDbazS/S7NnWEwOmFlv9C7I/6?=
 =?us-ascii?Q?CGrTnOE/ViiEg5KYnZHB+SNBnao6/grvuaBRLX/AKHj9PNBqSpve1OYTGvs8?=
 =?us-ascii?Q?bP1cKFZUfsoAczb7GFhz5mtXhJtJb1MrWy3sm7ISwZN5LR2K5M7/M9n07K6v?=
 =?us-ascii?Q?0tQ+fvlExSy4QMAkONd4jz3pJYFaV+pRhjZwl2uH+T4RvR/x/QfOIDzq79wV?=
 =?us-ascii?Q?s/BLObPFT25s73IeD3TMY/i9H+acTXlfxjGdreDqV6lpBGCUSCZXEZ+0HibK?=
 =?us-ascii?Q?GEZ9RPBcufXGFIf8KnycfjBdPFjKMD3MgEVc/D7u84QzH5z1AR+rwlrYqb0q?=
 =?us-ascii?Q?M61h4t3Ut7cSw0Irh/iFralmVgOx73l6RMxW1gBkaovPtS74VA++XM+uzJNc?=
 =?us-ascii?Q?fW2awEGxxD4QHviV1o36hdVI6KHI6xlmr2jmhKTle8qjlP3zg6MXT1EDTjk9?=
 =?us-ascii?Q?LBIJb6DRGDRRBg51JlN9NV2aDbx4BakoscUM2X3r/1PTxixYgYb+dE0FBpDB?=
 =?us-ascii?Q?pkRSAqs9+o+3Hu3rXKPz0JinKVuTduMuT+wp+UpqMSWY0HSQxuVnoYaqIQ20?=
 =?us-ascii?Q?hIZrR2IdTqtyFUwXS5oI8xgylUNz7p4ltHjZkdfzypjq/9XfwTcWXHPHZ7AW?=
 =?us-ascii?Q?imO3YXjDdHmEKO1ND6+VAGq67/zJ4iuaxeIwqAvIP23y6BBV42RcmhdTO9oO?=
 =?us-ascii?Q?axUUf7mxKvbPEA1KSWK9uF0EN6LUIm4qETloH3oG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9801d234-2495-48e7-4470-08dc695fdfc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 21:52:47.6419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1VcSXrhPwdYd4I2ga6PTudPSb6OCGuZE+j7V1fsV+GzGr/e0beQswBy1cG8GUqh1Ju8Qx6rrbWd/MmrPGlAkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 21:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110199

Could this be taken to scarthgap, too?
I know it's a major upgrade, but starting with EOL version is not the best =
start for 4-year LTS release.

Peter



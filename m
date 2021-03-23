Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web12.10464.1616512194311396677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 08:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=HFyb1ffF;
 spf=pass (domain: topicproducts.com, ip: 40.107.8.71, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHqj6Me/4kX1isVUcFpP+WqX87FMW3A3sntexaKKjWA=;
 b=HFyb1ffFhUQjRcZXsMi7Z9xsS4LyStV/08woa8SG1ZH8SwkzRb1DUZuLKt/zjSiwvw53FLyoe3hMwYfEaOyIOSgA+sCrA/NXHXZ1xoYaDzFOTRS22t6h3/UwyVWg98X5ArmLFZkp8mQjl3KK3nG3nHCcu66cfsOm3x+xhzA0Vuo=
Received: from DB6PR0301CA0061.eurprd03.prod.outlook.com (2603:10a6:4:54::29)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 15:09:50 +0000
Received: from DB5EUR01FT045.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::89) by DB6PR0301CA0061.outlook.office365.com
 (2603:10a6:4:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 15:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT045.mail.protection.outlook.com (10.152.4.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 23 Mar 2021 15:09:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.112) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 23 Mar 2021 15:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rsw7pdDZ0grhbqw8e4aUOoJeZqpoGunnHbg8X/lHesqDyM9kE7ispwpXgYigRG4bTp394Pvbe798EM2IrYxbxbBgXDH99XsJcwLYbR2tYIGk5nCfOOgMdjL9nbtHlB97yFuITLB/A3L7dkvjJQq95Quw15kJqJ/9+dQVG6kffL/aWWjg1OVuM8wqUA2ksY/iaO/EtU58N/DoPuDRa4MV7qNIjlBxaNs32KVsDCsIdOOFuZ+N1qPtExlRBtLhhZzDoh5/H4b7845N2gSBX3EputWK9rsNXTUVCPxkxCV4wGZaOjfdbbgEtqqj9H8y+PxfIPmA8OBlXIpx/h1PHY1Srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7NanzaDYJkvxosj7o/ycGUT9g0hatXmGChQv5uDGl4=;
 b=dXvSihqo5djVYJE05DK3ZlhNrhqasDIybORX6IibcIo04wnSz6HmeEuiGpOs4iawvbWWe05l5d1mfgsJdf8XMlvL8DfjjFLdYar1fR15tPsTF/ZC2DJBfh+M+FztdVjrnOy4tLF4cOyWVvGqgYOxnXcmS+m7nVnL0BmAafqrxR0g+sJd93xhJWmMpnhf6idRT2ghczd+qgM1BpJfq0YI3PuNmSEAt0J4iM3uPOScZfppwKKv6GnCszSA2XIeTtD2OSkyvpsiYMVWxPaXpLNqj66enFVbq9CPLPGReUC1M8B9/9d9QlBti+/PqGE2dzKAPgnRaXNoQhCw+guySINtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 15:09:46 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 15:09:46 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <166EA0EA5639ABCD.32074@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <1b00afe3-24a5-a9dd-b815-dfcf85accb58@topic.nl>
Date: Tue, 23 Mar 2021 16:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166EA0EA5639ABCD.32074@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM4PR0302CA0008.eurprd03.prod.outlook.com
 (2603:10a6:205:2::21) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM4PR0302CA0008.eurprd03.prod.outlook.com (2603:10a6:205:2::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 15:09:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1870414-51ff-41c5-f445-08d8ee0db482
X-MS-TrafficTypeDiagnostic: DB8PR04MB7036:|PA4PR04MB7920:
X-Microsoft-Antispam-PRVS: 
	<PA4PR04MB7920C456F68D6EA76D91B53296649@PA4PR04MB7920.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GpjbVPGzIwgUG5t8QaxUJ8LydNNQdBGRkLlGC7AuTUF4LCD/c50+/75qqwFRlu/hePBwnLvFBt70NPxOoDrTVmMnMxDv0XpKPKIV+PHWAEPRMovLKIAKySciiEFpqNNdc8+hD3qGxWhXM3r2mK3qJhWb9mYoEJ7lDDyAK0QJ0O120+bU6qCteRVY3sYiI+kPlO1xYXH4ljQCrq2HRBy5sOuT16bGpnXVpMat5n5LqSWY2de/AUxmLRA3HXCEkyeOHuisELOfFUsBOuvutqht2vsclGT0i0aiPU+VRBkFOx9uCx3mx7hpf82dFJEfmtlzoB44wwtxEk25SkB8vSoOmZBXFYl1yC5R0DE2GyhhxnAWYOQCjDA3fWcXiCWDHVds+sjmj+pG1kqFCCQrDQxgeAlGVvSugfJOuTdSHJMdBtt7JOn8Sk5Ifkc6XJEIxQWRWl/ePY3CVbKfZlj0WoskD8VypOJCrI2CSGuCO9x4+3SESOQQj2zCgQED1tES3Ag7EYg/rQGqnv5i6kvIdBQNG0+mX8XwSJBjIvnjI4OamgApcd5g65lR/qDIo4Zmk2oUhnzKA+Kt92nTHCKoCaM0gVEW//blSGF3yb7W56CyyZeS3LQovguGvYIrbbZRYWsdcBeYdHf7GsFfa/UgMec/NK7yVyVp8bfl7xZTfEbPSfRn7Z3qv24qc9kopdI4DYSNciD+UhPCbQgTZJq8+MTOx1R7oNnEvSBcpFTbDRtnAAhUdWbzydMeMdUkiKJiq7bJMQOUtTkejo3psRaTQfoowI1Lc72GkiW3tBJzWVrUDsChaYpG6aZI+lLCGOdFjkDG
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(39830400003)(136003)(376002)(42882007)(6916009)(36756003)(66476007)(44832011)(31696002)(83170400001)(16526019)(66556008)(956004)(8676002)(186003)(2616005)(66946007)(31686004)(26005)(8936002)(83380400001)(316002)(6486002)(30864003)(5660300002)(478600001)(16576012)(52116002)(38100700001)(2906002)(36916002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gJZqHwukWHDs3lTMEN12mbKuetcwA2E8O2VKx4RCXBnzrZVe48yxzqAkHUIc?=
 =?us-ascii?Q?Xlhkw/prdg2e6km5ZcAdn2FKJkxl2R0H1vDSoS+XiQd++NWHyMDhdbef7SPQ?=
 =?us-ascii?Q?pibTvlxu0WO9Kb7XuGwQCkBO7P2aUxwqm9osCESicg8SaSeDLgw4wJodI0CI?=
 =?us-ascii?Q?l+JK/E6dKOHskGPzxb0mDjYcHCgwTWEsDUCivP7yE2gH/UWBTh/FRX9tZJZk?=
 =?us-ascii?Q?53pv/E49vAJKQAtja8Q+M1HK7HqN+yrQZR1JBI9/GM9SZ9inD3nlgi7umqzH?=
 =?us-ascii?Q?1tcg4G0taESDo/8ILDFVWmTbHxKxKiHhXH4BdKuEURCT8ffwaMojcXuyp/r5?=
 =?us-ascii?Q?3UBKIWBfxAxaD11NHX52/ucfLi81+/tn3tecMpb0gGAsnUc/w09d5jp67P+t?=
 =?us-ascii?Q?/Tpgd47NUZe/wxMyQGX/2Y3EfiAtF3x7/V1ZXlxqMiW+jMbAUZAdw038js5y?=
 =?us-ascii?Q?2zqO7O3LyE/dX+cNBrZJxgKsAm7Y9l94ONplfnUTKqxhZDNPja2vtTnt55Rt?=
 =?us-ascii?Q?ye532v6oVtv6soRqf3qo0+ITshxPFxPre9938uG2iOpW6CkuismHgIp14pJq?=
 =?us-ascii?Q?ehMoPQreaqV1e87mSaZoXXrAStySiyxlpGxnA0tudN8ByKKOM1xz26Aips0U?=
 =?us-ascii?Q?SnIlYf41GuwdKJKXvcrJpVm44MaTZDn5M+mYiOIJGqJT1zd8MQpQkFE8YK8H?=
 =?us-ascii?Q?pO9mJJYPMwALk/Jna4I4nohiV8IXdza0xmx1F9f0yYqWJzxi4wru2PeB0UDo?=
 =?us-ascii?Q?gwuyqwH2BiP596R4QX/r7CaXDml0p4+hJZhkYNIcQKTR83MjQxNe4dESYD0h?=
 =?us-ascii?Q?92BWdrdOu7LfM3toBX2B0N3AWvHvxlDIP3kAaF9foV+gELIK1GgY7MQYVosD?=
 =?us-ascii?Q?eJPG/1QoUCWfkWLy3niAvluKuoJaKuPhyRBmkcgA9n5O8uXcr7SDFYFGyHUn?=
 =?us-ascii?Q?wTmrlblYMH5zRGLnUe0MxRgRI+8rp4kbPlFwWRLCCpdPfxUzxf/6w8Ef9o76?=
 =?us-ascii?Q?HgeC+PI1UAMXFASmbU9T0ByUXZXZ6Ow1Tjh7FhBRWHMX2LKZk3FmKV8WHUE9?=
 =?us-ascii?Q?NTMLFTFUyp/G1UttCzVUO9sExhVlFf003TlUpo+N3dBh5CEy1b1TPPDDP7cG?=
 =?us-ascii?Q?EB4OuhXLr2RbQWs5qfV9pDmyqfA0uwehxuB5Q4yg43gP1cXj6kT4gIVlgVsq?=
 =?us-ascii?Q?cydZRE9smfwDAlTmXV5YM0CMJMLbdJ/rTyeh3N3PEMf0jahxw2oy/pXQyBPP?=
 =?us-ascii?Q?oJaLaVlKeQLD6HhFetbxfzcV1Wx/QhROetApUq2IKxkIKIeUMMSPr8O5oqXt?=
 =?us-ascii?Q?g8/JELz5OuTqO8//lh84+66f?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036
X-CodeTwo-MessageID: 57bca8e5-a947-4e06-8d81-35941b5d7023.20210323150949@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT045.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cfb941f7-8897-4de1-4f93-08d8ee0db1b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cC5C8IeuD/AdVxWxp4GQX7Y5sTTDge4xBEoZudHX+5DFYXpYm48vkpJkhDC3nY9/cKpSqPPmLTtWThy/8mlpKDvt9JSz/Bh5TYxIw7lnH+5malkOvrXZRaobQkXXNT1+hFbtlrtvsmIEewuYLGko0NSPRwxNAXdWhuKcx/X8ClSEZY8utItOpCaiPv+0HH7BLdfrFx5i6bIi3Y/Du04I93IUzbi5DLRiSq7kCy0JOZeQITeASEuuKknl6SkkPpT4HF9Anq2j3TW2aPgSbzgsxwMrl2V8QJ/xysrnCatrQjctBQdBIzfq4ddP6H09TUsJAs0/g8RmvwoqJnPiCdb5zXVvbVDuOrx4gnVIsl/2h/b5ZxX+LmoF5vzEelez0TGhO38bdTj5vrgeJ/GLroH4erfxmOaI+VK1b5efDA5EvzmvraxxZSGeeILL41Wr1ZXeBM2tbVWIOR6ylE9AO1ZB/tdo1oYc2bmyCzNI5EKdlG/J9gMdEu3DHrD0OHgjUNO7lrc20q1ZNb/MYwcYMCbM81YVW2E4FlNne8UNk4gAtni1eaYMBCvUM/MT5q8EApp4YhJhgpO6pz6P4GK+0yKxoAgJyTUFr6Kso+DTsjvZrX9bHE+5Bhe2jvHopZpS2HJey0yt1Im45cMMSnw6FLukxGyndyCCihdsUb5h5U6tPRXUVB0o24AmCMvdGp8yinUrMb8QW9IPh3M9iFfvj9mRsxH85EfnhCXMXh1P+hXpr3+AW1Jr9aV6HmkGpf29WYiR9m4GHGed5mTK97/jBVh6s5U+kzHTW9uG0Lztcaljbs0=
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39830400003)(346002)(396003)(376002)(136003)(36840700001)(46966006)(5660300002)(15974865002)(6916009)(2906002)(30864003)(6486002)(478600001)(82310400003)(36756003)(26005)(336012)(42882007)(186003)(31686004)(16526019)(36916002)(316002)(36860700001)(8676002)(956004)(31696002)(70586007)(2616005)(8936002)(70206006)(47076005)(83380400001)(83170400001)(16576012)(44832011)(7596003)(356005)(7636003)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 15:09:50.2727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1870414-51ff-41c5-f445-08d8ee0db482
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT045.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

In a desperate attempt to get openjre-8 to build, I just went to the=20
current master, and that failed to build with lots of warnings about=20
"inherit native". I noticed that those were fixed in master-next, so I=20
switched to that instead. Still fails to build after a looooong time. (I=20
replaced some private path details with '...')

These are the GIT hashes are reported by OE.

meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:69f8f3e21324223c8e68a34db156e4472acfb=
a6d"
meta-oe
meta-python
meta-multimedia
meta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:589aa162cead42acdd7=
e8dbd7c0243b95e341f19"
meta-java=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D "HEAD:db9a58bb71fffdb74eb9850978a643a98ff13323"
meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "HEAD:324843cb1a2feb5f5c7b0064ca33edaa605cb749"
meta-raspberrypi=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:a3cda589508a9b56ea803cdd=
31e870481fc27132"
meta-swupdate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:065aafa41=
cff44985170b9ff6170ff9f87007b7f"


Log data follows:
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',=20
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are=20
['virtual:native:/home/.../oe-core/meta/recipes-support/libxslt/libxslt_1.1=
.34.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-connectivity/openssl/openssl=
_1.1.1j.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-core/glib-2.0/glib-2.0_2.66.=
7.bb:do_populate_sysroot',=20
'/home/.../oe-core/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do=
_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-devtools/pkgconfig/pkgconfig=
_git.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-graphics/fontconfig/fontconf=
ig_2.13.1.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-graphics/jpeg/libjpeg-turbo_=
2.0.6.bb:do_populate_sysroot',=20
'virtual:native:/home/.../meta-oe/meta-oe/recipes-devtools/giflib/giflib_5.=
1.4.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-support/ca-certificates/ca-c=
ertificates_20210119.bb:do_populate_sysroot',=20
'/home/.../meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_popul=
ate_sysroot',=20
'/home/.../meta-java/recipes-core/ant/ant-native_1.8.1.bb:do_populate_sysro=
ot',=20
'/home/.../oe-core/meta/recipes-core/gettext/gettext-minimal-native_0.21.bb=
:do_populate_sysroot',=20
'/home/.../oe-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_popu=
late_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-multimedia/libpng/libpng_1.6=
.37.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-devtools/make/make_4.3.bb:do=
_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-core/zlib/zlib_1.2.11.bb:do_=
populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-devtools/automake/automake_1=
.16.2.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-devtools/autoconf/autoconf_2=
.71.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-graphics/freetype/freetype_2=
.10.4.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-extended/unzip/unzip_6.0.bb:=
do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-extended/zip/zip_3.0.bb:do_p=
opulate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-core/coreutils/coreutils_8.3=
2.bb:do_populate_sysroot',=20
'virtual:native:/home/.../oe-core/meta/recipes-support/attr/attr_2.4.48.bb:=
do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libxslt-native',=20
'openssl-native', 'glib-2.0-native', 'libtool-native',=20
'pkgconfig-native', 'fontconfig-native', 'libjpeg-turbo-native',=20
'giflib-native', 'ca-certificates-native', 'icedtea7-native',=20
'ant-native', 'gettext-minimal-native', 'quilt-native', 'libpng-native',=20
'make-native', 'zlib-native', 'automake-native', 'autoconf-native',=20
'freetype-native', 'unzip-native', 'zip-native', 'coreutils-native',=20
'attr-native', 'libxml2-native', 'ninja-native', 'xz-native',=20
'gettext-native', 'util-linux-native', 'gtk-doc-native',=20
'libpcre-native', 'libffi-native', 'meson-native', 'python3-native',=20
'texinfo-dummy-native', 'expat-native', 'gperf-native', 'cmake-native',=20
'rhino-native', 'xorgproto-native', 'classpath-native',=20
'ecj-bootstrap-native', 'jamvm-native', 'libxt-native',=20
'libxrender-native', 'libxext-native', 'libx11-native', 'bcel-native',=20
'xerces-j-native', 'gnujaf-native', 'commons-logging-native',=20
'log4j1.2-native', 'oro-native', 'bsf-native', 'fastjar-native',=20
'jdepend-native', 'regexp-native', 'xml-commons-resolver1.1-native',=20
'gnumail-native', 'xalan-j-native', 'commons-net-native',=20
'junit-native', 'antlr-native', 'jsch-native', 'm4-native',=20
'gnu-config-native', 're2c-native', 'libcap-ng-native',=20
'ncurses-native', 'libpcre2-native', 'python3-setuptools-native',=20
'readline-native', 'sqlite3-native', 'gdbm-native', 'libtirpc-native',=20
'libnsl2-native', 'bzip2-native', 'curl-native',=20
'libecj-bootstrap-native', 'util-macros-native', 'libxdmcp-native',=20
'libxcb-native', 'libsm-native', 'xtrans-native', 'jaxp1.3-native',=20
'logkit-native', 'servlet2.3-native', 'jacl-native', 'inetlib-native',=20
'cup-native', 'jlex-native', 'jzlib-native', 'xcb-proto-native',=20
'libpthread-stubs-native', 'libxau-native', 'libice-native',=20
'avalon-framework-api-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.2
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later=20
<https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and Alexandre Duret-Lutz <adl@g=
nu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL=3D"aclocal=20
--system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nati=
ve/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
--automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-na=
tive/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16"=20
autoreconf -Wcross --verbose --install --force --exclude=3Dautopoint=20
--exclude=3Dgtkdocize -I=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8u-j=
dk8u272-ga/common/autoconf/=20
-I=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8u-j=
dk8u272-ga/common/autoconf/build-aux/
| autoreconf: export WARNINGS=3Dcross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal=20
--system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nati=
ve/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
--automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-na=
tive/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16=20
-I=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8u-j=
dk8u272-ga/common/autoconf/=20
-I=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8u-j=
dk8u272-ga/common/autoconf/build-aux/=20
--force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: creating directory=20
$TOPDIR/common/autoconf/build-aux
| autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux: No=20
such file or directory
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running:=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/recipe-=
sysroot-native/usr/bin/autoconf=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
--force
| autoreconf: running:=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/recipe-=
sysroot-native/usr/bin/autoheader=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
--force
| autoreconf: configure.ac: not using Automake
| Error in tempfile() using template=20
$TOPDIR/common/autoconf/build-aux/XXXXXXXXXX: Parent directory=20
($TOPDIR/common/autoconf/build-aux/) does not exist at=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/recipe-=
sysroot-native/usr/bin/autoreconf=20
line 411.
| ERROR: autoreconf execution failed.
| WARNING:=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646:284=20
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 284
| =C2=A0=C2=A0=C2=A0 #2: die,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 274
| =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 236
| =C2=A0=C2=A0=C2=A0 #4: do_configure,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 160
| =C2=A0=C2=A0=C2=A0 #5: main,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 298
| ERROR: Execution of=20
'/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/r=
un.do_configure.16646'=20
failed with exit code 1:
| automake (GNU automake) 1.16.2
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later=20
<https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and Alexandre Duret-Lutz <adl@g=
nu.org>.
| AUTOV is 1.16
| autoreconf: export WARNINGS=3Dcross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal=20
--system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nati=
ve/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
--automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-na=
tive/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16=20
-I=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8u-j=
dk8u272-ga/common/autoconf/=20
-I=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8u-j=
dk8u272-ga/common/autoconf/build-aux/=20
--force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: creating directory=20
$TOPDIR/common/autoconf/build-aux
| autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux: No=20
such file or directory
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running:=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/recipe-=
sysroot-native/usr/bin/autoconf=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
--force
| autoreconf: running:=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/recipe-=
sysroot-native/usr/bin/autoheader=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
--include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/27=
2-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
--force
| autoreconf: configure.ac: not using Automake
| Error in tempfile() using template=20
$TOPDIR/common/autoconf/build-aux/XXXXXXXXXX: Parent directory=20
($TOPDIR/common/autoconf/build-aux/) does not exist at=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/recipe-=
sysroot-native/usr/bin/autoreconf=20
line 411.
| WARNING:=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646:284=20
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 284
| =C2=A0=C2=A0=C2=A0 #2: die,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 274
| =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 236
| =C2=A0=C2=A0=C2=A0 #4: do_configure,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 160
| =C2=A0=C2=A0=C2=A0 #5: main,=20
/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp/ru=
n.do_configure.16646,=20
line 298
|
| Backtrace (metadata-relative locations):
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /home/.../oe-core/meta/classes/loggin=
g.bbclass,=20
line 72
| =C2=A0=C2=A0=C2=A0 #2: die, /home/.../oe-core/meta/classes/base.bbclass, =
line 56
| =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
/home/.../oe-core/meta/classes/autotools.bbclass, line 224
| =C2=A0=C2=A0=C2=A0 #4: do_configure, autogenerated, line 6
ERROR: Task=20
(/home/.../meta-java/recipes-core/openjdk/openjdk-8-native_272.bb:do_config=
ure)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 4517 tasks of which 4312 didn't need to=20
be rerun and 1 failed.

Summary: 1 task failed:
/home/.../meta-java/recipes-core/openjdk/openjdk-8-native_272.bb:do_configu=
re





Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14298.1794290518094185261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=H/UB4JTJ;
 spf=pass (domain: topic.nl, ip: 40.107.159.88, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzprJyqlnHH68WqPltJomn4U8k9RZiWjyz4Hdeolfk02qS5GoI9EebSILxPS132g4E99mFntpBfaytTwO5jAs1gNuB66BzHZRkYggmzBeaKMmAxGwJMh1BXIbPtbEGN0DvXJf6iISKbxFi1f6F/99OsCfsHWwfCys8nezrzhEnurDE09xGG+UeG5oMWcdfaET2fCIiN+quLGeYdqIr8uS8/INAhWvTljfkQOTAvF+Qy/iNZkmzuUqyctsEAdxaM6IsjvzR0Ysk4Nmu8wtfDTgTgI2GMDJtCqO4EUwfixAgZir2e7R6fxvs15Wzh9z2y3jrt+ZxqGZlKkuR8d4j4opQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oCBi6g4Ro/5dpROcNYHpo9LJYm6EcW2hnVKqz2Td6w=;
 b=zTFVnSt7RvKpB6GyVQdDzTwucxSEHvZQPQ8NyExvzQ0INwe7KbyYGo3RL6n6aMQE7SiRCCTARG1Qela2kKHfMhGc691YluvJ0gdr+EApj58dmVx316cl9ucbd8008/SaIoT3U+EVLvdwUB5hGmIbyCRN0VGSBDLZy8lLcYPRVQyw8J85lRsVBvlmLFxL+OKDnNd7wfUdQScd9UayoyquwUoozsrxa5cdgg4KJuS2ZJjdDlWjiL5Vc0rtQ29dlaQOh3HPtg3i3Lfb+OOxiFlaH7gktg8pZgr0IlPgA9yeSMs2FKjEM27nANDEgESikaycyzeSJ0AZccqlOsjthhf7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oCBi6g4Ro/5dpROcNYHpo9LJYm6EcW2hnVKqz2Td6w=;
 b=H/UB4JTJL+qdU7afjKk7epioarhSndpgiIe1XQtC2BEXdzITuuH6lxFSF/O/nuoQ+KlBiRghgY+iCbgx81i/cBaOkBGmeH2jgOHtoQicAH4fxRh2M2H/IFzSeSBXTOFJtcTnMr/BOtzEC66IJ4Zf1bnJfrOiRuN6ecX9M60k7ZcvU4v/DoBvgFGwofVUdtpuUDMc1vpf+HDJUXg8V4ity9a3rAGN1JlsPyYH5JUtw3ZXY1EXEnELQyKwj8Bm3T00KloFOsrc3jBqWR982GvH+CzYj4HoaIAtpEf5VhFE9kNfSgkcPzgvkLZj+2EGYO4b5owCdBJufUJgedxU5HkAXA==
Received: from VI1PR09CA0129.eurprd09.prod.outlook.com (2603:10a6:803:12c::13)
 by PAXPR04MB8142.eurprd04.prod.outlook.com (2603:10a6:102:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 06:01:52 +0000
Received: from MI3PEPF0000847D.eurprd02.prod.outlook.com
 (2603:10a6:803:12c:cafe::88) by VI1PR09CA0129.outlook.office365.com
 (2603:10a6:803:12c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 06:01:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MI3PEPF0000847D.mail.protection.outlook.com (10.167.240.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 06:01:51 +0000
Received: from DB3PR08CU002.outbound.protection.outlook.com (40.93.64.80) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 10 Nov 2026 06:01:50 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DB9PR04MB8495.eurprd04.prod.outlook.com
 (2603:10a6:10:2c7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:01:49 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 06:01:48 +0000
Message-ID: <eedf7b3e-36c7-49b0-bea2-2abbe74026a7@topic.nl>
Date: Tue, 10 Nov 2026 07:01:47 +0100
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [oe] [PATCH 0/4] Apply the mongodb patches from the scarthgap
 branch, which is ahead
To: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
 <20261109081800.69803-1-mike.looijmans@topic.nl>
 <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0103.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::14) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DB9PR04MB8495:EE_|MI3PEPF0000847D:EE_|PAXPR04MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: d96417b5-166e-4d66-4cb7-08df3ef01d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|4143699003|56012099006|22082099003|18002099003|10067099003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info-Original: XkXladoAxUdXO/18rZGRhJBfu5TcSDtlrd8Am0s5dsttSaK/nzrU1Vt5eT541TzoWfXT4ICn46zKm93MBrhQkroI7kNOXcOnOVCrrhtuPY6XjR94neATry0gEBAhl1toLfLTkUE8uIpwCM3gNdAA+uQ+8FOCLIW1eenQPLfMGDkiGz+F7INy4Lt6c9IEEJXnHXXC+sMM7JJdmdDNwulej9tOAus2H29Sxh8JpTKzl3sGYW2gQA7UpyHru/3/E4W8eJ91z7cLBUgFRoZFsdQXUot/CTD8ZI2I02qgz5+KJF8GCSO1MLmbfX0xe3NWnh566hslcXc/enoC5uO36RYiXJ4MsJjCxwLjynwmINTTEBaZhPn8pqtQUfWOnCZ+u7e1Q/b7xGTt0E6OUlrW5d7UE5/524bTteQf7LkfYxpdpsKEtaY4V015XMrpYBy2qs4EuyT4fur3cm6lhrKFVsk1YG7pC8/fPorpwfEy/MV5s2wVM8r9oKXs025bhvdvNtapGpyHHghtQ7w5jXAbbae7jXAQ4SZSiVtJPNCFjIoqMkk9BrAqWqfXfwNG0XUQuVnXV6PNh/v6qK4UOKa45cMQFtcKrEcGyff1Pk6CTKzd3+ggygveng0NzWwMYiz9QwrRBWpbz6IHBKNti2iDdRjctG3TDg+3khM7tIetpuoz66U=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(4143699003)(56012099006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: B4Ey2FlVRMPa4AdI7RhAoTFioVufaX/tfEzMtJszK6lY3iTgTDyZiNyAkFBzylnkaFeL/w2Qj2vWWcRa/H2v5naCwxD7tai/SsKCIbI0TWKvcnDWA7cX4PN5KsWcWtLxbB+i3bKUS0pWQYYeiWvBcfStQTrhz6gPI4Xss2IcxIbDcSO+2vqDvjAF8+XnMACzli2vMrtOLYBsOZ0GnPbDKwgdpSIfiq1khoFwLjlmas5nVaU07b6g07DDCFpEcl8Oz4Rjc2CUJqxOl+qb2j1VOEWwtqNM26nBlOylRJo0gUExX6J/1aZjA02dGVGbP2U5Hs3dibnfddOkYuGBEVDOyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8495
X-CodeTwo-MessageID: 23a6374d-5b0d-4e4d-b4ab-26ae460234bc.20261110060150@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF0000847D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 548add20-e518-452b-2218-08df3ef01bac
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|14060799003|1800799024|376014|35042699022|18002099003|22082099003|13003099007|4143699003|56012099006|261102123227099003|10067099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 1vtX/6MXavhWlzSqJxN/JCsWXeh3B5ku7FRBYUKr7JcU40d7kHqjCdWTNJxwQNBj8tsb/x/fSDP6FblIix2CQHhBhjShR6+Ffy0gHxHb67SVhUwqcCtPoshy4KsnBNb4JufohLx0P1G9sVarVco2BFyRJFNKiG6A+exEDMUTZpfOhSrEEppPWejuJfodglpDF8a8fgYCe8cPUZINxj5gLli/LSJJD4qO6GOafrWo1uAwBSs8rXuTUgKs/dzSJ41wfqGv34wxBCmaBdp/ZUvJUe8FU7ZO16PpbrqypanarzFUwj15mGo70/MfOJCJ9sZw36iYo255eD+HrwRLBpTeyRNR+myC+tOq0fbhdwE7JAdxdgFsGwOt/UMC9HgPF/gnKOy2HourcY4nhVH1KdnMjQcOpg/MkD2R8QJJHlImtJrUW7ksrxUPGDPw2Uu2q8CifIIvtiw3n+noPpVR6iaVx7Rhifkd2seq2AC/O7e5hPXZbyHeBi90j4N7y2kgf1Ab6gcVzK1Cy8IFOs5sCPbigUkWGOv12rilqv3sGmIHJ5CdYuR8+1AwrU35iyNDzNwMB9n+98KyOJQmAPtWpuGqYXNHbfaNhEWFU9YV1ZWlEdONadqxBPPg+SlP5bvJafaJNoaYZqavigDryRrP3T8RSQ==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(14060799003)(1800799024)(376014)(35042699022)(18002099003)(22082099003)(13003099007)(4143699003)(56012099006)(261102123227099003)(10067099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RAkRtY34oiW/BkRhA3I7rDVpdiGdVHjyWH9Tb8KLlE4dUhmEptLAje9SGy6OcsVXKLLCTeNmcpXDx2RgnxPcHu0mER8avjDZAxDqO21vL/hWZf+SuvQqPRJPh26LRBVUzilRq9/2d8mmGSDfgqABcSxKThfBOe7bcF4Eo3IgJyCO/9541eNH53YQWJHX06LIX0Vm9k6KtjGWeD6gczhpzYi15p90gRQtSO1yHruXW5LBu/jENit+ivuYPhlPk9h11UlsgVr0TWxVlgPBq+qj1LakEdbBVx4KcOg8qJHBaLrwx3tzK4sJF5pXlES82bwg2wN/uNnMZhl6bsaKL9/WTzPrI6IE9dKqOC+2dpXtGNEcXx99vnC3WG3Qf4w0g7Q1mJxur4x+jp3vsR7zdBWbJ4/vYGPqDyteRdGLiBn47VchvdQgI0xBEsWR8ja8Ykju
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:01:51.8840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d96417b5-166e-4d66-4cb7-08df3ef01d96
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000847D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 06:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132066

I know, I also wrote in the description (second line) that it wouldn't=20
build.

But at least this brings it up to the "scarthgap" level. It's weird to=20
have to start several commits behind the previous LTS.

I have a workaround for=C2=A0 the pkg_resources error, but that's still not=
=20
enough...

Mike.

On 09-11-2026 16:41, Khem Raj via openembedded-devel wrote:
> fails to build=C2=A0-=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1947/s=
teps/18/logs/stdio=20
>
>
> | scons: Reading SConscript files ...
> | ModuleNotFoundError: No module named 'pkg_resources':
>
> On Mon, Nov 9, 2026 at 12:18=E2=80=AFAM Mike Looijmans via openembedded-d=
evel=20
> <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>
>     of the current state and was apparently lost in master.
>
>     As wrynose introduces new build issues, this still won't build yet.
>
>
>     Awais Belal (2):
>     =C2=A0 mongodb: fix build with python 3.12
>     =C2=A0 mongodb: update to 4.4.29
>
>     Gyorgy Sarvari (2):
>     =C2=A0 mongodb: upgrade 4.4.29 -> 4.4.30
>     =C2=A0 mongodb: ignore CVE-2025-14911
>
>     =C2=A0...001-free_mon-Include-missing-cstdint.patch | 28 ---------
>     =C2=A0...econfig.py-python-3.12-compatibility.patch | 57
>     +++++++++++++++++++
>     =C2=A0.../recipes-dbs/mongodb/mongodb_git.bb <http://mongodb_git.bb> =
=C2=A0
>     =C2=A0 =C2=A0 | 11 ++--
>     =C2=A03 files changed, 62 insertions(+), 34 deletions(-)
>     =C2=A0delete mode 100644
>     meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-f=
ree_mon-Include-missing-cstdint.patch
>     =C2=A0create mode 100644
>     meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-m=
oduleconfig.py-python-3.12-compatibility.patch
>
>     ---
>     base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e
>     branch: wrynose-mongodb
>
>     --=20
>     2.43.0
>
>
>     Met vriendelijke groet / kind regards,
>
>     Mike Looijmans
>

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




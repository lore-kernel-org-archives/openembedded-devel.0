Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4172.1794379134628465682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=D4GjZklc;
 spf=pass (domain: topic.nl, ip: 52.101.66.93, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqphBsKEl3dVuzuUu4q/XHkTf1USdRJu5OqvSjA0ydDqUs+Ij2lN+58ML/620+fgpfj/7QvmTnTijE7JOrndVeAAPvQ7d5TdFbibgp2cCG63jS7ZO0cMKamV9yfHMzBaowraWegeYZBZDg11sPWqITVgY2GUudLzAI2N62MDpQZKm1nlsY11MN0/sK6zI2j/H3wkwgkuexEjeOxTm0ucGVFk7PSiKbLCtSW8nESiNgeOsacrm1EN0QefLZL/SHJurep1yR6LDnEQc/5Dsb8ZM9Bb/bDTJz5z11Gl0+tg1CEe4BKOpaDF0iKuEHZY6LgvwoDN9dFvPanC6x6UkAZ01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEO47OKRaHkOq/ghkS/wOXJiRhRoW27ileHzvaKEuVg=;
 b=DRIl7StbvFr0Z8+6pmSUT7PMTjBjiSvuVznM+eju3ZaI3dy46XWL/IOIcSt75xp7+4YcN5DeSIE+sevfGjOgU9o8v4+zXhvlWPJ+R9klDtgCKscXyjH/yMW4EXj4ar7Cu/SASQk/gq2sNwx+0IwwgwzoCirWD9Bct9p/x6f6vbQ6/ksyG+s4rAmBd1oQ5qU3CRRFjSZnS2wd5DoJqGwq6g0ct7lEFqYaskqSYxPIwLwr8GZzW44AFOpKVAIdo7r1LU6GBPOAR+2nFF/ept+sYRd4f+oFqQu4KhgE/5Jgb4bPCdfV4IellO1jXVL4okGx+Me/M+ALUkM50ijc1L39Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEO47OKRaHkOq/ghkS/wOXJiRhRoW27ileHzvaKEuVg=;
 b=D4GjZklccMKJOo4cK+0WeID80+99I4t3IAnCfDViqb+odE1zslkgwUqbGK9Ui6OQ4Q8rnG7J1RlqPAePCSSMXWtYgpACQWQHKIXYPH6kNwxaiuYu/N4Nd0FllA5tXt+X625/ytmsZTFmC9xYZk5gqGrbkzSXjG3ISmkIDt4EEzLq4qr5j+KlteNSJ/SXPbm+rqTZxWJ3aOJ8w3oIwPYZHbrLm7tRrBkGCMcTipezan6Vvt7IPvW/j39FUSQJzp+8xwoMb7xTwMZrz5pTfc64/cCH0bAfI7YQ4poYyArlX1nzDhu5nRrwT7Hwl7gISSyxuQRAWlsc2n0FI9hXEb1hhg==
Received: from PAZP264CA0137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::15)
 by CPH1PF99222C660.eurprd04.prod.outlook.com (2603:10a6:388::3cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:38:49 +0000
Received: from MI3PEPF00008558.eurprd05.prod.outlook.com
 (2603:10a6:102:1f8:cafe::60) by PAZP264CA0137.outlook.office365.com
 (2603:10a6:102:1f8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 06:38:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MI3PEPF00008558.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 06:38:49 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.89) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 11 Nov 2026 06:38:48 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by PA1PR04MB10284.eurprd04.prod.outlook.com
 (2603:10a6:102:460::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:38:45 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%3]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:38:45 +0000
Message-ID: <c8443741-eb78-4aef-bc31-50ee8b7eec25@topic.nl>
Date: Wed, 11 Nov 2026 07:38:45 +0100
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [oe] [PATCH 0/4] Apply the mongodb patches from the scarthgap
 branch, which is ahead
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
 <20261109081800.69803-1-mike.looijmans@topic.nl>
 <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
 <eedf7b3e-36c7-49b0-bea2-2abbe74026a7@topic.nl>
 <CAMKF1spaQc--uVEevw2S4vrKJd5wSMSSOYxzv5aOEsb+SqLqKQ@mail.gmail.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <CAMKF1spaQc--uVEevw2S4vrKJd5wSMSSOYxzv5aOEsb+SqLqKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::18) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|PA1PR04MB10284:EE_|MI3PEPF00008558:EE_|CPH1PF99222C660:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e5c81b-b236-414d-5e3f-08df3fbe71d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|13003099007|4143699003|10067099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261021123027099003|56012099006|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info-Original: 4iUhRxIVZ1Eb0q/qhdgzrswiJh8/2/6QsLDxVw35gERQLcix84TmFwY7RQzgDXLSNFMimfD4zLTv8aTnSeasAy1kxr/ggoR/VHxI0q/RNIGHncIrk+IkgQwKEk0eirGnCcg1Eb5KRzyiFxph+tsWOPIociWdxyGEdrNJk3z/sB0B2DJaUSy+2NoJMhvboyMLQD5GRqIwYMdwNQt5XQ9McBCdpASOYi81GmoH5VZyj1BXZUYsCN3IyKbHZoYnZPaAiqimeOTxkGMg7vYoDz4bjSMH+UFRjDr9vRBcdbUou//pkdcEDdogtOfy2dMzF4OESh3DmjnDbliZP4fHPHD65Ei+4f9dGhfwkYRmUDz+mTWgxB2stLGR95WMZdpU2IHzPwpyjTfhezeqh8C/9A6LISNczGoqbWwpCcg6BEYiKK24Rg1rGwSdeAdj55dWdr+ozryn4nkVHhi2S4vlBTzGNnSvo25bLs0j+2QJPpxTY/a7Bq7rW6GYOugvPg9ZmUTHUjRcb5IwdtuWEDzFgbPG4+hzBFkNyqBkJ5yJN7WElZ9zQmT/9PyB0b6vg6enawWDy/9qr9D/I/wH3sPwetAY4GLiVF1rxDyGJB1LV0Sig9M=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(13003099007)(4143699003)(10067099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(56012099006)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: SIAeyN/CDFKsLz3UedvY2X6n7Nt6qgsmn271FY1NVr/N75FzGn8Oa17HXhNI/CqHu57MZpxEcu0Y/Rv8bpHGRaPTk19NJv2noWtUNp8yvQyeY7l6b7r3jKFEw9cgSV5aGO421qrX61DWXqcRNeZw4pp5gzrd4s3/Rl5+vWpJLnZreDhqhiFReJjDoJyWDp/DqP8tUK8wsi7mSQjLiEXsWiJPeIaKFOLbBc1PIDbL5FM0yyRBLzcq7E18thHbXfiGUzPlZlYxa3EnrDgeiw8Bxg3/C6qMSDsv6OX2xaB0IaGlGNu5jtU5d6SrBvEQxNYVRwTmy+qNPD8kUc1NtwDFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10284
X-CodeTwo-MessageID: ff5f22cd-f543-4f65-8641-f88b612bb5f1.20261111063848@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008558.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 527dca4b-5f90-4e42-07a5-08df3fbe6f79
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|35042699022|23010399003|1800799024|376014|36860700016|18002099003|22082099003|13003099007|56012099006|4143699003|261026140227099003|261028144727099003|261022105027099003|261102123227099003|261021121427099003|261022075727099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: pGul62RAkXQsxTUlQVKn3qVwj1fJteP+rLkIwmzS+3AReLsLNxabAiOo1yIi4rigKoQmOHzehI4eDETkwRXk1rTZtPSKKyDRHmBwoyG9g+WvAV9CPCLaB4Pa6RgzCT4OjliIIaD4SXjX6BbyNmBDJqqoAKvJT/qtBsCyTrg+6lho0qTOUK8jNR/iv5cGpz/Kza2KREQoqVfpVZRY2zg0Ql/YV+PFYKkC2JTV3cpb1juuJoGnpyZfoWKraGMItnMPfxtIaYIoITmqlrBTGKmsvvxCmgpY2SZuGxOw1xdSWRuVFbWm6sOHzNDWKW0d9/bNBd6YdqiMaVzQEKV2X8aI15ZYh+GfG2mTga2rOtKe/w4NcjYJJgzFIKYAO2fpD7d/pl/rklyBIEZEmsvDvKEimwEkV0JysmPUmV/UVyrUpOQMy31zOqhSh8racn8ysae5GFeEViCYD2ztxoEvMnMfw7KOme6/tBYupNW+7Y2cMZgpssKyMzhUjcRKLn4ne3S9N6RQw2pJWdsxAeCCXbKQEGCW9d+oUv3800l2XhaWGndYezZkX8tdrLLAfOxqdgnq9nnoN7xBalIjhFbSQmmThaoSFrXtKNq27ovoBoCLfehBsGakOdPZpxnUI38oo+wq6YIb/1/H7exrikraRNRpOA==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(23010399003)(1800799024)(376014)(36860700016)(18002099003)(22082099003)(13003099007)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261102123227099003)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6Nn2RBixyxXg4uJogW9TO7JHzcDDUL8QrnS+3NgEv4YCC/wSTwKsUj9d6C2Te5JdYzGJ+zssHw8pvFkF02NxTsQRua7p63BSwmVjP948QBR8S2mhZ7el+lvheyzO+jZOCSXlz34dQDfUBAcGJto/P5+4itNaQybfheA2+WO41Bd2Kl32c80GWrimG5gonOb6xi6ebJ5SxQ9GF8tq1Qqh7iKcz+kjcyX9gpcRPshBbBXEubVWpo1TjMWX0tj0y2sqCIUfPegGatugfhp8KiWP5AVk92YAjXjPgIYS1pBqIFHbCq09/Gu/KcwAzoJrDu7XuYXhr9rW4hsntkLVs7+ujcnLwxR3f9o0Y2fHdZQJyBZR2Ub1dEUDAs0j7iZLwF16oyG16fRaGZ6Gmv/g1IePl/dTtVU6dZBcKzhctEnJnGvOdzIeRU5SurKYFUTq/gQw
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:38:49.5154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e5c81b-b236-414d-5e3f-08df3fbe71d1
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008558.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPH1PF99222C660
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 06:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132128

On 11/10/26 08:47, Khem Raj wrote:
>
>
> On Mon, Nov 9, 2026 at 10:02=E2=80=AFPM Mike Looijmans via openembedded-d=
evel=20
> <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>
>     I know, I also wrote in the description (second line) that it wouldn'=
t
>     build.
>
>     But at least this brings it up to the "scarthgap" level. It's weird t=
o
>     have to start several commits behind the previous LTS.
>
>     I have a workaround for=C2=A0 the pkg_resources error, but that's sti=
ll not
>     enough...
>
>
> I have sent a patch which addresses=C2=A0bunch of these issues.I wonder i=
f we should
> upgrade mongo to latest release as well.

It would at least be reasonable to have a version (and CVE updates) that is=
=20
equal to or newer than the one in scarthgap.

M.


>
>     Mike.
>
>     On 09-11-2026 16:41, Khem Raj via openembedded-devel wrote:
>     > fails to build=C2=A0-
>     >
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/19=
47/steps/18/logs/stdio
>
>     >
>     >
>     > | scons: Reading SConscript files ...
>     > | ModuleNotFoundError: No module named 'pkg_resources':
>     >
>     > On Mon, Nov 9, 2026 at 12:18=E2=80=AFAM Mike Looijmans via openembe=
dded-devel
>     > <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>     >
>     >=C2=A0 =C2=A0 =C2=A0of the current state and was apparently lost in =
master.
>     >
>     >=C2=A0 =C2=A0 =C2=A0As wrynose introduces new build issues, this sti=
ll won't build yet.
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A0Awais Belal (2):
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: fix build with python 3.12
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: update to 4.4.29
>     >
>     >=C2=A0 =C2=A0 =C2=A0Gyorgy Sarvari (2):
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: upgrade 4.4.29 -> 4.4.30
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: ignore CVE-2025-14911
>     >
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0...001-free_mon-Include-missing-cstdint.pa=
tch | 28 ---------
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0...econfig.py-python-3.12-compatibility.pa=
tch | 57
>     >=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-dbs/mongodb/mongodb_git.bb <ht=
tp://mongodb_git.bb>
>     <http://mongodb_git.bb>
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 | 11 ++--
>     >=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 62 insertions(+), 34 dele=
tions(-)
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644
>     >
>     =C2=A0meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/=
0001-free_mon-Include-missing-cstdint.patch
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644
>     >
>     =C2=A0meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/=
0001-moduleconfig.py-python-3.12-compatibility.patch
>     >
>     >=C2=A0 =C2=A0 =C2=A0---
>     >=C2=A0 =C2=A0 =C2=A0base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3a=
e589e
>     >=C2=A0 =C2=A0 =C2=A0branch: wrynose-mongodb
>     >
>     >=C2=A0 =C2=A0 =C2=A0--
>     >=C2=A0 =C2=A0 =C2=A02.43.0
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A0Met vriendelijke groet / kind regards,
>     >
>     >=C2=A0 =C2=A0 =C2=A0Mike Looijmans
>     >
>
--

Mike Looijmans




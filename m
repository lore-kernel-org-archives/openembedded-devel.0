Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7B6C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 05:55:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.128])
 by mx.groups.io with SMTP id smtpd.web11.8336.1756274104676253965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 22:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=HdbWBatB;
 spf=pass (domain: topic.nl, ip: 52.101.84.128, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeyRRqCf6RsZBFosgqT5pGkm/aSQkMFu65KStnP22QsejGhaKpoOHCu7EHZhlBiIsaRMvfIYDrNZqid0KkJbGKU0vNQTc1ceAg+G00lXJulpRqI6Sdxasou0fuUTl5+kMU7c22Ld0h/1ZWNS524/G6Uykw8UQtw/kjkSVOXV4i8Rbht0tX21yZDXvdmz/9Jl6FROPe4qKRxSL146zlV/22SvydKbjztOPcp01zCJMsUUhERWf+1GO3Xrv8vPJhZlhsxbGBNG1bK0f0nEqAfAgclrDRE6em55Y3T917PMCQ/1VDp0B/rWAwWczwApVW3UBawgtZ70fzYPoibDn1UtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLvxMy3+om5j4qcBHvnIr+USLnt24Up1kwdNWbYfrV8=;
 b=j0FzzdEKhDJAYcmT1kaijl4n5AH+LvMc4gPJCYHC5HNZFsknW+Zg0Xqf89MZovGSpqxet/KwolMvlv1T1cTLTXMQc9L+G/g/E3PgUNSLEPnlfBybXumOGfwA7vupb5oKInDAJSZuL2ocwjfn1ODAEONQ1pJnV0F6LqttNzrYws9TwQvAQCsjL4y6BLIF/xplwDAP6jVCS8QlFnd02ghNDmJaHvGwKa3rVWZRYpYwZHsV/kvUXJaWiCJPF+hX3h6l0+09uNYE7siKfZgiGxRFMnFO2U3icY0o2i0wIwh6lztDQOyXMNNEHiv5VVoSs0Q9IMIsoxR1E3vkLARtdmRMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLvxMy3+om5j4qcBHvnIr+USLnt24Up1kwdNWbYfrV8=;
 b=HdbWBatBiCBdYnWTLlG3AjKP+55tNv409XomOwmkZ9ahG1J/2big79wMgLR3qlirwnuWo6skNpufeKZd1bEcvW+TKToc79LzW3qk5z+WnM7ZZV/sWYEcxp5fRH3lRQkjo9hPsY4Rbw5mKsaCogOKGJ/bzXftpA+GFhiBxmq4isT4sEVPsXn/e9Q26623hHLQTaAi0V7nWmZA5QUPWWXXM1C08yF98hvjkdZ7Je8wx5YpM9+7QdTo8CMVCHg2YR7CeGUOntQGhmvKnADAPYRHYO9vpZOT5+0he9CTGuxfbu7N2xCZCMwTLk2GvTQEcH54ARculatCL48ycQwdXftWEQ==
Received: from DB9PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::15) by VI0PR04MB10829.eurprd04.prod.outlook.com
 (2603:10a6:800:26b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Wed, 27 Aug
 2025 05:54:57 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::9f) by DB9PR01CA0010.outlook.office365.com
 (2603:10a6:10:1d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.15 via Frontend Transport; Wed,
 27 Aug 2025 05:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 05:54:56 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com (40.93.76.75) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 27 Aug 2025 05:54:56 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Wed, 27 Aug
 2025 05:54:54 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 05:54:54 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: packagegroup-gnome-desktop is not a desktop
Thread-Topic: packagegroup-gnome-desktop is not a desktop
Thread-Index: AQHcFxZCdcPHcD0KekeVPIW9dDikFQ==
Date: Wed, 27 Aug 2025 05:54:54 +0000
Message-ID: <AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
x-ms-traffictypediagnostic: 
	AM8PR04MB7779:EE_|DU0PR04MB9561:EE_|DU6PEPF0000A7DE:EE_|VI0PR04MB10829:EE_
X-MS-Office365-Filtering-Correlation-Id: 9117fa8b-481d-4dd0-5807-08dde52e406e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?9pvTHRWN2TK9IlMLKL5myjrrP64cPKLjeGXyINpoeRBOSwwKbzwlAxeDpI?=
 =?iso-8859-1?Q?DsZviRUFOCvP+DyW+M92DZLhH/Grdf6PG28nlaHyAeeiJKsYUG800/9Cv/?=
 =?iso-8859-1?Q?j/ZsFwp8vf53K67bO36B/RScWr4hJgI20tpKWwc+5g9/TyzOuP2Cyx8wnE?=
 =?iso-8859-1?Q?D4MBoW3Dc6Uy0brp7vF4gyeXVpkropvO03LC1V9qz0dFmrMdIi3X3vXIZF?=
 =?iso-8859-1?Q?rzY/Vg5l3J9v2U4K3hBH25WGbrLNgDG7ttRJW7inq0ZYhBK/xxPvkqQLNn?=
 =?iso-8859-1?Q?XZMWyI5O1u/k2+gpPxijtFsLqseUMK2qnsW6MjeyX4CG4077e7ua5h47Il?=
 =?iso-8859-1?Q?UANKQt6IjvMfI/LK79jkLNWuv12tTjeq3sfRE8gPeR/+GRpdPh5aeMKBC+?=
 =?iso-8859-1?Q?nTnvjqCQOcHgib7VFZOOrBLCFRpAGSqNNOsmfdCH78GT5mHpAWwrgt4+CS?=
 =?iso-8859-1?Q?J737PN6W/Mk3Ri6YTbKKAx49M1dZuJ8FclL6WBs+56MAutYVptoCc+IqWu?=
 =?iso-8859-1?Q?B2WQB/fa68OdU+22TWDx57Zuw5aYTMZ2O9rTTvxTzu+IHuULTNPWZsT2Ex?=
 =?iso-8859-1?Q?WTYCKCLLrWP7OfA+X/I7t/phLn0e+25uxD+azgPrM9d3eYGKYYH8XWzSIs?=
 =?iso-8859-1?Q?+VWzuos0jfqoP2UhflQYKU0B+Ph1bgIZyT/o7gmy+E16YRltboZ2bzpTQp?=
 =?iso-8859-1?Q?iECfmt2HaCN7jSWD2S5RHo0E+4s7Syvy4HEFEXOZ5CszoMkL17AeN5r3eZ?=
 =?iso-8859-1?Q?EnW+rjZ+ZBjn+kFIxr1c+hgH9zl7+RMO66M5HkmW0GnmiTbnqI1iVE4PZN?=
 =?iso-8859-1?Q?j86+Qja5jP1UUpgWPBTbcj2ALtojyXsvk3clo2dxMQSFb7bdG17YzEfCrl?=
 =?iso-8859-1?Q?gt/CSA6OKqDuriSBHBlW9NLhFD5FtzZeZPdYAcDf6NfYnJ7RXuUjti7dXQ?=
 =?iso-8859-1?Q?efWX66NuCLnsgf6clxngaQuhrAB6zV3jSMu91uOygoC1GdpZpPGJ8huR6G?=
 =?iso-8859-1?Q?fEtPm04DOPlNmhnOr+Yr9Vmkm5Lq/3D//9+SFRZ/r1vIRgM03mAotLv3qv?=
 =?iso-8859-1?Q?MXsPIbUFNmnUu4aWYjgIm9X21KikmwQvS3wXzwh3rCGP2KWotGklvjaKqP?=
 =?iso-8859-1?Q?VKNmW5YB9Wu7660lBZ100IXCllNDSkaIrnbf07e2B7Cb3srLT+uu3xaVuZ?=
 =?iso-8859-1?Q?Cae9BFGg71OhXSPYGvAmE9x+xm7JkbkZCq0NhhZzmMvS/RQf3t1YQ/NPPT?=
 =?iso-8859-1?Q?WVw34HAliJG4FzJ27pfKDX3dXl+TahR/o1UNOVJmn9RaUYXc91X2e05oCz?=
 =?iso-8859-1?Q?IWOtlZ+i72gIm0hLA4JxZXozvF83BN+HJX66aAGFGStkY9bg8aS3HqlBAh?=
 =?iso-8859-1?Q?D9xkMyLmBzSQp1UuCwG+TWRoVTuDnD7KrQ4CG8SO642sNXwsIJDFHFNkuN?=
 =?iso-8859-1?Q?KBxAn6jSh3O0jB9veuPW49pTUtQGyViaN4rQS6GEPCHO102vr6F/NncIVe?=
 =?iso-8859-1?Q?nL6oBlrAvyfMCvuDVVyXMxQHlW6k9SEgfQPwWbYpifCA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9561
X-CodeTwo-MessageID: 9d4dd940-07c2-4ea1-b207-ca662a614742.20250827055456@westeu11-emailsignatures-cloud.codetwo.com
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c1e8f1c-4b90-4c23-6370-08dde52e3ef5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|1800799024|35042699022|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?YZ5WmOOm6P72keOMcP3L/jVGQGoT2lqiEewy5Q5hXhHkjKVa3yOX63pxr5?=
 =?iso-8859-1?Q?wJTEa0KzQ+BY5I8H+Bh1T2Cv63b6akfoVKPXq2s3TDNDdgThz6iYFO59fD?=
 =?iso-8859-1?Q?tQzPUy7wxpoJhnU5O0DkPAmdBIhQgPXkEuSZjVHM0icKY6LnsiukGjtGao?=
 =?iso-8859-1?Q?GaeaRr00rETUSLyAEyzh0o+nZsyR6JFZbhck+uRfSDVEhMEhaf76etizyZ?=
 =?iso-8859-1?Q?w6CwoDsPuIBxA5CINW0gBIAulGX9Ajd1l33ii/ACQ8jhuzViywSbwgXlhd?=
 =?iso-8859-1?Q?PXVG7C8AqXJwxEOZPvWS/qxNIWdXfnRRkNQhKw41XtMHZY7pcWfbaMyRxV?=
 =?iso-8859-1?Q?7lRODwqtQj5NpM9M2O3HYdaUxDmTfjegw5pYL3/dzDfI3PrRV/ijYIJTHk?=
 =?iso-8859-1?Q?xd20z1WVIiSxWiS5uwn6Oa9pN15lry9bFSQ3sPwygyK4lgdgcgUnUDuPr6?=
 =?iso-8859-1?Q?Wt5Q3fSzBAZXNnIXWHLqIDAiETfArHUUyG2KP+QL6IY3n6ei47+bmjNj4t?=
 =?iso-8859-1?Q?+TCxWyTgKTyvrBDAI0HI4A4g0ereiGYdHRp6usUYBfVGTBalznreM0M3v7?=
 =?iso-8859-1?Q?cAPHqlYpdD3t5ZqJnwHx6aywN0C5gMOZUsIZSdFYSBX0khWr8ZkDD0CcFs?=
 =?iso-8859-1?Q?uuVt9lQhuH6372lR7B+F5yOii5obINvP2JrjOXOSIEHpmi4+jpt11h1Mwp?=
 =?iso-8859-1?Q?rOu0kmNFn0Y8v0dD1JaTQS6kulPl1URucDq2jKXjlCkGyvyx62sY0VLlAt?=
 =?iso-8859-1?Q?xeyrZcxP+mV0X3fEsGa6Czopz4+P4oEg9EbncRURSlKqjhXU8UzUree87C?=
 =?iso-8859-1?Q?iOOztyLQw3kj3oIPREcK3I+k7m+Gbibi6qcMqD7hIvk0JXbu1vNX4bRxPM?=
 =?iso-8859-1?Q?kA+8uivUOKjoghjMl8GYZ37tbF6yJCkpYKJOETHF/WbY99mHueX4+mmJY9?=
 =?iso-8859-1?Q?zBRGK2FGv6MH7mH2KnNWSNpHjJmf+YBAmpt5UAtjetaWDDWw+WRgM9q3Bh?=
 =?iso-8859-1?Q?hHS6MtJpJC7AIhG8rt7izQDrHZt58XWVRMuTcKBRYwA4FLDyPixC/9Si8w?=
 =?iso-8859-1?Q?0pRDtP+8oCDVapgROXkW0naPylQs0iGHiwu594YlLSas6A11Q5RSOrpzDb?=
 =?iso-8859-1?Q?uWeiQWWSCS8YVsz7tpzFUNbXJLoDcLpj6RScbob1fpV3uD1AKA/05P4YNZ?=
 =?iso-8859-1?Q?OPtA7IFZG/KsL5hLFQ2MpLXQFs/RZXLV7JifcBHfh1q5M6y7YK3eAw8DUm?=
 =?iso-8859-1?Q?3PpVekuiUcC4N5IvtNHJHxSk1zlicXG8inthB2oJJwPUJ4Z/ojGNSPVLAT?=
 =?iso-8859-1?Q?AKQ7eYgLvqFIAy3+wyzgaUJGFuOw1RXUgHwFXTuwswA/OAJJ6TaZIRhg7W?=
 =?iso-8859-1?Q?P/begenTJ92GYKDuMeuUNHFlZKaUpItSoMH+OTkbkRxY8EgJVhIosjV+to?=
 =?iso-8859-1?Q?VQFbu/QKhsCjbog9E8MSGGv51eoA4ZSvXSFbKTx+nsgWXlThXYxzhVy/7/?=
 =?iso-8859-1?Q?d3PAiOWVbU1YW1oBovdtw0+fa02WjqpNZ4E0StkPOkOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(1800799024)(35042699022)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 05:54:56.8276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9117fa8b-481d-4dd0-5807-08dde52e406e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10829
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 05:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119123

As an alternative to XFCE, I wanted to try and create a Gnome desktop envir=
onment. I ignorantly assumed that "packagegroup-gnome-desktop" (what's in a=
 name) would create some basic desktop, much like packagegroup-xfce-extende=
d does.=0A=
=0A=
However, adding that to my image results in all screens remaining black, ev=
en though it creates a 700MB image, it doesn't appear to have a display man=
ager.=0A=
=0A=
What am I missing?
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
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=


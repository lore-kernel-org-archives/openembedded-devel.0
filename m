Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45477CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 11:58:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.95])
 by mx.groups.io with SMTP id smtpd.web11.11577.1756468693228206956
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Aug 2025 04:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=rXbCx6aY;
 spf=pass (domain: topic.nl, ip: 52.101.65.95, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq9QdfYAhzFQNMmGNjCqJ1XiQCbzOPj+2YVAIo+ThhliAS6vyQplskOD5upwIc3+xykTJlvlDD/Hz50MU9dJqcXUmSxhmhbQLY1qXEK0PcnojsdE8wpcEW6nNj66BXV+CElWrtW1mjhBS0fyaiDvQ10IPL6Qqu9x1OZbd/XaPzb2gqGz9Jrri7UrfQ9xPx75o9LeIUdmew5RMu7uubGnUKQ9+HWy//F4o9C7lZ1Lda8HHfUkhcPSbE4pfL7NfPeb94o/G055JNuyACdmfRNV0YpueFnDbDwOy69waDiZnAGHZFP4EoGSbyt2kERk9Ij6zCzJhFQpowFKE0ZqP+dU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvQYUQZ7ddB/rcEwAEy1qgkhQAXJgos6dD+TmyKMqdk=;
 b=v+HjlmWWVlA+ug4WSXlLdjmUqjWXgUDLQwDSxbxc3DDOUu7TMnlJsVynltQ4NUwKG8jHcg+zJfkbeDVl9An4RfFMY9Q8Vm/PMK9a82khPf0Y1TFte0pPBfe9zbAEmphxcSAomy+6Ch/Yb0fAsOeipdvQK1DySh69vl+JV8E55hJI6Rc5caYAGumkOEKMNHEmB59Fu96QKdgoE506hWcEHSkXGBLZ+RQ9uGezS5Ro4By4HnIrBtyHDRGxvgTlZ9J+5cWgUc2DmwzmzfGVylOoMxePRb0eiOIbDYExj20seoqRfno04Dzt6KdE0qdUP0O/XOhvvtXvqPscU5lprlj2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=t-online.de smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvQYUQZ7ddB/rcEwAEy1qgkhQAXJgos6dD+TmyKMqdk=;
 b=rXbCx6aYCwupdSYzOV5szjpLVd360kt7p7wW4IloHc3Hi0TYi6ZP+ovgEL7FAROMljKRGtzF8qJU0Yr+f7DI5IljP/0tCv2psqXM8Bi2FEIHKz/lSXqd1EviiiRxp1vgqbQ80f9vhHNcc3AzrIkwzKBwdHuX3qs4GvISGx92oJ7XzwBReQy1o2vr1uVixHfoG6C37QAKxIonfZ3YduRV+Nn5ytVb1ixJTulNAG5rld0fJugxYu6+MS1gtNjotmhh786ks65MQweQwRD8tD1WhjFIZPYxX6vjI1MLbxucKItZ4lHaTA/26C4VeJHCMJqX5hW4sWdc4fqxnkewJ3tfnw==
Received: from CWLP265CA0389.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::11)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Fri, 29 Aug
 2025 11:58:09 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::c) by CWLP265CA0389.outlook.office365.com
 (2603:10a6:400:1d6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.20 via Frontend Transport; Fri,
 29 Aug 2025 11:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Fri, 29 Aug 2025 11:58:08 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com (40.93.64.14) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 29 Aug 2025 11:58:07 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB7992.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Fri, 29 Aug
 2025 11:58:06 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 11:58:05 +0000
Message-ID: <26d6cace-bdfa-47eb-8b3d-e219eb95c4ce@topic.nl>
Date: Fri, 29 Aug 2025 13:58:05 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [oe] packagegroup-gnome-desktop is not a desktop
To: Markus Volk <f_l_k@t-online.de>
CC: openembedded-devel@lists.openembedded.org,
 "Mike Looijmans via lists.openembedded.org"
 <mike.looijmans=topic.nl@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
 <AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
 <DCEO1T.WIMW7AB6YK7K3@t-online.de>
 <76eb2d12-a879-412c-8790-8f1993686e95@topic.nl>
 <CPGP1T.6G37LRX8WW3G3@t-online.de>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <CPGP1T.6G37LRX8WW3G3@t-online.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AM8PR04MB7779:EE_|AS8PR04MB7992:EE_|AMS0EPF00000197:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4087ec-bb3e-44e8-dd85-08dde6f35207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YW1nNGxOTVhqUnNyODZmWGJrcWN5dXc4UG5MeFZiVHRrTHlZRnE4eDlpdHRL?=
 =?utf-8?B?UU9GODUxNm9mbHg4RjUzUlVkcHh0S2lHZ25QS2gxakJLcGdaWFpuaHBuNjZS?=
 =?utf-8?B?ZlVGVlNnZWxSVkM1NUh6SERmM0dEWEZkS2d2VlRBcWh6NW91QWs0amlQYUgw?=
 =?utf-8?B?RXVHeXhpeHlBbGp0V0FUT05NbGhtTTNvU2Z2RURlTVhPcjhZWGk0WGlJaFNy?=
 =?utf-8?B?ZDdXNHlYaElKRnpjRzBvZkU0eVRyUndic1FQMXFpSTB6cU5XWUt6dGdNWnRF?=
 =?utf-8?B?MlRSUWpyUk8xblEyR0VVN3p4cUtxa054Sm9NMFVFUzFacnhZcXAvQmhadnd4?=
 =?utf-8?B?c2krSC80Ri9jMkNXVFo0dkZEZ3Y5WERWRkoxcERrVFo3YjNQSXFBMDhLMEJh?=
 =?utf-8?B?SXlUUjFWbmtMTjdZSm11M0JmQTEweEg2dUlGODB2cmdJRjVSUzJxay9qWUdu?=
 =?utf-8?B?U1k2clpYNjB5UENFN3ArWXFNcWdDM05vTlRrK1FnWmRQbXF4c0QvRmU3YnRq?=
 =?utf-8?B?RldTd2NkSkNEdCthbU9pMnRtaDFxUURJOEVGK0pDRytvaElzc3YxcFNOSEZv?=
 =?utf-8?B?cnNCZUlCNDl3dm9XdS9aWEJndDlOUXJuR2FzZ2V4S0RQbWJhQ1ZyU2NKVjRz?=
 =?utf-8?B?eEdDZW1MMzRZRlcrbXVrTnZTMlh5OGR2WjlqdW9nMGRlYjRXN1ZOc2ptNDdL?=
 =?utf-8?B?U3g0U290VzN1cUtUamxRQlVkZk5OR1VteWQ1eW5vQnJSaCtNT0JabkIvUW56?=
 =?utf-8?B?RGluazZldU9WS2FUWTFDcDRTUDN6TUZjM3dEejJrVG1MR2hWeFhsaThsQmxj?=
 =?utf-8?B?enJ4ZkRqOTdZcmxTeDNmVlhLT1cwNzRxTFVYNVZtTjdyNjNWUlN3TkNQenI3?=
 =?utf-8?B?R2VJZXlDbEs4YktlOU1TM0dtTTZnQTZoT2owUFUyaDZnOWJJYTc0OGIxa05T?=
 =?utf-8?B?Q3doQkp0YTQ1aDBtT0RMcnJkNG1oa0ZvUEx0RDVESTZWNzE1U1JxUnFSWTFE?=
 =?utf-8?B?V2s3c0F3UnZSNXc1NkVhbzNKYjVzM2lhalJORmdnZWxwS2h4eXVuV3dEWHJs?=
 =?utf-8?B?dGQ2Zkd5SlV3d2syYjdSTlc2TVhGQTFvRDFMbWJOdnlWYnlLQnkxZm9TaHFD?=
 =?utf-8?B?bnp2dUQ0ZnczTTlJbHArMTgxajJuMlF3ZW5HeWFhL2V2WUtUbFMvaFpZck10?=
 =?utf-8?B?bkZlSGw4bGxISENPckNVdndsTWVzNTUzdkJBQXQ3cjJmZjFCcTN2RGJlOXhw?=
 =?utf-8?B?SHFEUHNmMEQ2aUQvdlBQQUp6TjRPUlFldmNRQ0xmVklVelhmWUlDVzdqcm96?=
 =?utf-8?B?NTZrOHNZZWplRmtBUXpUVktEbVVQbTdhQ0hxZkFDVHJiNkl0dzIxdTBvT1FB?=
 =?utf-8?B?bFJnMkxXUmJqU3EvQWhCS2RMUkVyN1IvU0RYMEM5L3krOU8wZ2NRb2xpWE4v?=
 =?utf-8?B?eGJ0YnFIcnhHUysvVWM3WmtGbEQ3b0ptMFZiTjRiT3pLR0orZHdvSEt6RlhG?=
 =?utf-8?B?U0F4M1VJb21QckJWd3NTSDVxZGZEaGQ3OEl4bjBPR3hGbW5Fd1k3R3VCSlFj?=
 =?utf-8?B?aXFtL3R0eW1EVTl5cWVtR3ZRL3dMMFdYMStwNHVQcnZoaWZKSVgyOG1DZ290?=
 =?utf-8?B?Y2g5dG5jKy9sSElSeHV4NTBZbzJTdXdmRktaZUx6NmNHVlhRTE1tMHR6aWJt?=
 =?utf-8?B?bTFuN3FWQkVDcjZlREUvU2Y5cURiQmdqZ0dyQ0p4MkdIWmlBbHhMRjNwVGhO?=
 =?utf-8?B?ZlVmaFh1RFpnS1pUV28yL01Gc0FISFpGQk1WMjdKeGs2SklLRmtCTmhINlZY?=
 =?utf-8?Q?NjsigBWz+McjBuMm6tJToWdsYTrcvLjgXdyJg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7992
X-CodeTwo-MessageID: 38119e45-c7e8-4baf-a90c-cb799e4c695b.20250829115807@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fbd3bf3b-4596-4bfc-91c6-08dde6f3505d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|36860700013|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V2FGTFBDNGxqQ2t5cDVGU0xZZkdpSWFjZGF0N3B3eDIrbFhORmNhaEpiNDZn?=
 =?utf-8?B?aVNHWGUvZ2xuUXhta3A1MkJzbzR5RlhQMDJyRzViZ01zbUM3UitjTjJBQUF0?=
 =?utf-8?B?Vk9YcmUyMnhhcUxqOXUyQ0haNmZsOWJWRGsvRm43YVZybzNwc2Ntb0srM2FM?=
 =?utf-8?B?Mk5pRVhzVkNjMjI5aWhROVMzNUhuVnZFWjU0alBRekljUWxhRDZLdXNWM3c3?=
 =?utf-8?B?YnRhdEt4Y2hHQko1WGh4cW9QNTVVdXlxWTh0TW1zOWY0SHBxQitwR3d2dzFN?=
 =?utf-8?B?MnJicXpVc3poSXZUTnRSbnNmenp2UmRpb0dvV3RtanBCM1NIbUsxTWlmcFoy?=
 =?utf-8?B?V1EvSU9KaDZ0d0QrKzFwNFY4dTJBdjZRdm5MeGd3Z21iM1pRd2JscXZPZmpO?=
 =?utf-8?B?VGREalZteUwwTzVhSzFUYUlRTDBwREJ6SlA1c1B1SkV4aVg1QzB6cjI3RnZ1?=
 =?utf-8?B?a3RDcktrdGt6OXc3MjNkQksvSC84eVBRUVRpTFdqeW96eUlYbXF3Z2VaSjFY?=
 =?utf-8?B?Q0dEeU95SXEwU3FpMUFoVWUyc3cvL092am56clljL0N6emdrTjRLN0s5NE9O?=
 =?utf-8?B?K3FLY2RyWkpuMis1NzA5SGtlekJOamhzNmpLNzhSekEyeVdhV2R5YzNDb01x?=
 =?utf-8?B?c3ViRGtkTXhHaTJVMmwyOGNpUys3WExmYUh5ZUhwNDdWazYwK3ZUaTVVcktt?=
 =?utf-8?B?bVFlVmh4QlVlcUVqaE15YmIxUkUyMjYwbXg3SERRU2ljdmk1Q2JuUjZ2NGlK?=
 =?utf-8?B?K3lVK2NybHFsZStYcFFJNFZ4WXo2ZkdUMXBVZnMvTU5qNlBQVmpnZnYyTnow?=
 =?utf-8?B?aTA1aTFKWXlJbWtoRmdMWkJydDd0dG04WXpyd0R6QUJ5K2R1NUFjQXprWkNk?=
 =?utf-8?B?Vlc4MDhZK1N6eWhnUk14UDJTT3F6b0wveTl2VHkwRUl5UVN2VjM5My9zeDFn?=
 =?utf-8?B?bStxNVpxK3d4Y0s2WmR0WnJxaHBiY0JLQ0ZBZ09PdWNZb3RRZzJpVVFnTXFu?=
 =?utf-8?B?VnRXQ0huMi9zZ2FGOGNTN0xPclFkVCs2ZUpkWHVVdUdCZ0t3eE9NUVg2MmVC?=
 =?utf-8?B?d0pJOG9DRGY3d0dJTjlGYVRLcjN2L1lML0VCNGdDSG9YZFdRV3RrbFpUQks2?=
 =?utf-8?B?SGpWZGc3K1FUZnUvUlBDcCs5MlBNc1dORWlxY21xY0JwWFlGdHZ6bUhwcTAw?=
 =?utf-8?B?TXplRktQenZWaXcrNjVNdXJjMHlHeS81WjdHZUxpOFFkdUVlZFNRYy9YVlBp?=
 =?utf-8?B?cDhBVnZZUVB5eERvNWN0U1BMMnJXRmdaNnV4SFQvQkZNc1NSKzRxZjFub3Ft?=
 =?utf-8?B?ZkxucElBNHBTQW1jZVo4TlY0L0dPTGtzS0dLcTAzVTFPeG9TbmwwWWF3SHZZ?=
 =?utf-8?B?V0lVbEEyZkpJb2FWZ2tYWHQrM1VYMUpkVjBoNWdxVFlqVDQ2V3NDd1NDNWZY?=
 =?utf-8?B?QkVBWDVRYUhkSzZQaDhrVnpxUk9ESWFiM0lZQzZNOWJuZ2h5K1Axa1dSNmU3?=
 =?utf-8?B?VGpaMm9Ucm9peC9nL1BTbG0wWmNyMjcrbGhUc2VkTFVqZHhvSlZ4cXZHYnVp?=
 =?utf-8?B?dllnZ1JmT1NEbkR0b05rQVlQcXgwLzdUOHgxd0RpYTluVWdNOWwyWjFJU1Ix?=
 =?utf-8?B?OThRZnh6cHZva0hMZDB0UHM0RU5DNnZlZkt2QkZhUloxeXE1T2dROFg5MXph?=
 =?utf-8?B?Z0k0NEpWczBGcVBZWWdIWURxVmVJMVkrY3ZCaThFQUQ3aGVRb1lyNEJOc0hG?=
 =?utf-8?B?UG43bUJKYjNzZ3ByWjcxS0NJQ2F1ZVBSaDBaT2gxUFlYcG9vL1JIaytkbm4v?=
 =?utf-8?B?KzZ0SStuT29WM0JLL2dFaDNzaXB2bUhPMzVwR2pKVTNTN093M0ZEUTlaazJP?=
 =?utf-8?B?L29KYU9Qd0JxNmxMaVduYnMwQ2VwV1ZiR2R3Q25oV3lscFdkS294cFpEMWQ2?=
 =?utf-8?B?bUYyckx2NkRZK0lPQ2VnUWVBbWh3RHhWTnlTdHlRektOQ3N3YS9Lb1hJSmZx?=
 =?utf-8?B?UHpPTzhzb1BRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 11:58:08.3917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4087ec-bb3e-44e8-dd85-08dde6f35207
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 11:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119137

On 28-08-2025 15:12, Markus Volk wrote:
> On Thu, Aug 28 2025 at 14:39:44 +02:00:00, mike.looijmans@topic.nl wrote:
>> I now just end up with an image that has tons of "gnome" things installe=
d,=20
>> but nothing really gets started and there's no clue as to what should be=
=20
>> running...
>
> gdm should be started automatically using systemd service:
> flk@intel-corei7-64:~$ sudo systemctl status gdm
> Password:
> * gdm.service - GNOME Display Manager
> =C2=A0 =C2=A0 =C2=A0Loaded: loaded (/usr/lib/systemd/system/gdm.service; =
enabled; preset:=20
> enabled)
> =C2=A0 =C2=A0 =C2=A0Active: active (running) since Thu 2025-08-28 15:01:0=
8 CEST; 51s ago
> =C2=A0Invocation: fb3be9d01865490aa251ee2393f6d5b4
> =C2=A0 =C2=A0Main PID: 1111 (gdm)
> =C2=A0 =C2=A0 =C2=A0 Tasks: 4 (limit: 154363)
> =C2=A0 =C2=A0 =C2=A0Memory: 5.5M (peak: 9.8M)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU: 40ms
> =C2=A0 =C2=A0 =C2=A0CGroup: /system.slice/gdm.service
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-1111 /usr/sbin/gdm
>
>
> Which OpenEmbedded branch are you on? I remember sending corrections for=
=20
> starting gdm some time ago:
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Dd4ac4dcb70faeed3e3a933c378bfbcbe25a1f260=20
> <https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&i=
d=3Dd4ac4dcb70faeed3e3a933c378bfbcbe25a1f260>

I'm on scarthgap (because Xilinx/AMD is there as well).

This patch at least puts a login screen on the display. I can move the mous=
e=20
pointer on it, but I doesn't respond to any click or keyboard button.

>
> I also build for gnome but that is far from being a tiny image:
> https://codeberg.org/flk/meta-image/src/commit/8ab5f7a156e44e30dd637361e0=
b9c1474537af4a/recipes-core/images/image.inc
> https://codeberg.org/flk/meta-gnome-image/src/branch/master/recipes-core/=
images/gnome-image.bb
>
That'll be useful. In this case I'm not particularly looking at "small".=20
Experimenting with what we could demo on an MPSoC board outputting to 4 HDM=
I=20
ports (just bit-banging FPGA pins really really fast). XFCE looks nice, but=
 a=20
gnome desktop will appeal to a bigger audience... I'd also want to get wayl=
and=20
running (weston works but a desktop that only has a terminal window won't=20
really appeal to people), which your image appears to be doing as well. I=20
particularly like wayland's VSync handling.

M.






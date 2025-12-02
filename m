Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A212BD116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:33:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5655.1764675216791231914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 03:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nlqh2oqi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nlqh2oqi;
 spf=pass (domain: arm.com, ip: 40.107.162.29, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N0DcQt8lpoohlOzwtFEbPr4KNfAuSUKumx/zpt1qX+O7GsZhLmWQxhqzli/6/mVOKMFSiLfdDkgAyH0P5ph3B8iX+P6FXhwjzp8HX9uHUYi9Wi82tNBYYQbhSuI+WIudboBohknvBzZ9WyDzhBCnmMPzvE13K6UmbwH9luC1EGH/JyDZ7ERkrlQe2TW7qFoV1YPQDFqyt44p110DXB+uF+nO51sA2ux9sICzQNkjkD0FGgOOF74aubCUWXOZXs+u65cV45lNMz2560mV0FCCq/Tqyxlgngu0gZxs24tNuE5kGCVN+1kQl6FZY+6MEGCvwDtnehRIJn0fmZG/n53VbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef3r7PGarNCwSkVSQLJZEDVyCH6BQVKUrjKBIBzHZXQ=;
 b=RJJ8ojZJpaBeSYjufk9z1HnSUiSwcRjl2T13riFciK0DoJhy0SjVPkimB15IaBRFQSJxcNhEIUzPaTnJTZO6fpc14WAEBWE03AKEj0wPR3imepYZfOJyFW7Wl2yb63/K7VSI0PYzynIr8SIpgD70W19CTOJAag5QA8qzwFkkINKbo5jIsqq3pJK2oguEEMymoTZsoHDdDoEqtg0cTbEfbhV26FjM21fg/thI+kEc+geMoGCiXXsCvlOAIi/R2ZWLr9QA69ZviTsbvmzL6EVoEziN//xst0+KA/1nmGzKskayK3DU06NqgU7xVfPeR8opTvQfUbO32fkCjgd+vETRqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef3r7PGarNCwSkVSQLJZEDVyCH6BQVKUrjKBIBzHZXQ=;
 b=Nlqh2oqiiuRVGhqkgsddmA0g0AH76MLv6vgS9Ty9s0ReCUGTG8wdXIBpJ6c0fYY8iNgIIgmIy8ssLxgBUbehLYvYZzg970xseOFTU5rRhMD0UXstgGXa8idpt62YhbW2rjdINF2h+BKi7FZ9EQ7V7K5s1L61Z2tnN5lIAb0tcg4=
Received: from AS9PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::16) by VI0PR08MB10460.eurprd08.prod.outlook.com
 (2603:10a6:800:203::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:33:31 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:540:cafe::65) by AS9PR01CA0016.outlook.office365.com
 (2603:10a6:20b:540::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:33:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 2 Dec 2025 11:33:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAT29+xwoJf8alkmcU+4JRcBxASu37b6IsggCMQ9ac+orjFQ7yUImcpiVN9X15Aga6lr6Zqot03/OXR/Kh43XTO4exFResPlfcGyq17JgYqcF2QTFsReTt/z6ELtC3rpYiWnYs2knhlqQzJKzk3/qQ412EzzCzFRqr/xrTSxP6bFQGfaSzppalnbHWjm63uyYn2AOofDTdU7Gd+ks7nDcXYWV6ckes85wFPSFUlwcluhYHl+Uws1/b9xO5tFDRvH5tefZ2prXejWat+vcGhJPIgheYVORKsRf86hq4T2RpV0lfQ8ldBKAAJb3olahQN8sGPduRmmDnOQ/XdksZbQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef3r7PGarNCwSkVSQLJZEDVyCH6BQVKUrjKBIBzHZXQ=;
 b=glOnSoHhZoHIKIYChX/AJLmczaJJn8eDyTXIJ4ZBu1XhPit2qnQg7yzix/do1DtLpp7F/T0RGzymIiusV9d1tr7cwsPJizB1njogxXU227uZ29cIfOMX+xuosri+S6dDAp/GPDnL+fisvFqPeEMObf9Z3n8k0IwGJqhVaXDGux2wyhdovqhlGearVUCx4q1fYCYqrKTnH+x47BR6YcIyUspFvdTLaPgHrOx/2Ds9jpojNABgDGeGPd/QIpH9ae+oqBcxDGQ0bxlUVrsr4/5/Wl9TgDDBLjcRh4YyqEBWni+9nU2v2HcbfFbPyD6JameglmszrULJ0rGaqk2x509cvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef3r7PGarNCwSkVSQLJZEDVyCH6BQVKUrjKBIBzHZXQ=;
 b=Nlqh2oqiiuRVGhqkgsddmA0g0AH76MLv6vgS9Ty9s0ReCUGTG8wdXIBpJ6c0fYY8iNgIIgmIy8ssLxgBUbehLYvYZzg970xseOFTU5rRhMD0UXstgGXa8idpt62YhbW2rjdINF2h+BKi7FZ9EQ7V7K5s1L61Z2tnN5lIAb0tcg4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 11:32:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:32:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>, Khem Raj
	<raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] bpftool-native: Empty
 DEBUG_PREFIX_MAP_EXTRA
Thread-Topic: [oe] [meta-oe][PATCH] bpftool-native: Empty
 DEBUG_PREFIX_MAP_EXTRA
Thread-Index: AQHcY0p98N54jvciH0SHabOzYTV5R7UOOAiA
Date: Tue, 2 Dec 2025 11:32:25 +0000
Message-ID: <372B3D50-C6EA-49D7-B365-40AA7E410AA7@arm.com>
References: <20251202051354.3815601-1-mingli.yu@windriver.com>
In-Reply-To: <20251202051354.3815601-1-mingli.yu@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8695:EE_|AM1PEPF000252DD:EE_|VI0PR08MB10460:EE_
X-MS-Office365-Filtering-Correlation-Id: fd48772f-5236-4760-1874-08de31969e5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MDEvdC9raGNFTUNXOEprUjNKUXoxWVJEdHB1bWlxRDZZWnFVK0VsZHpsaGZq?=
 =?utf-8?B?bWpyYWFKRGc1Wlk1d2dBQjl1cERjL1BHU1VIbU1oOWo3UGhIdFR2Vkh4MUNk?=
 =?utf-8?B?dytodlhwckExTTV5RFE2Wnl5cExZbWtHbTlQeWFjRGNIeDJ0SXNBSjZITzB1?=
 =?utf-8?B?SkxvUjJkbngzaXRPT0E4ZkR5ZU03N0txQ3k2VFE4aytQejd1enFHWHFucWtG?=
 =?utf-8?B?aVpsNUJJbnNqeU1DK0xET3JGOWV3aXBjNDFpS2ZRMmVCNGl2dnlweFJkdGlP?=
 =?utf-8?B?MVlMZ09MTTFjLzZlcGJ3bGNVM0pjWDNaY1lZbStodXQwR2U3N3VyWkxVSjho?=
 =?utf-8?B?K0dhYS9nSWF3d3hmR1N3VU4vdU9aaVRyTG8yMitpSUN1aHg2ak91cWxBckxw?=
 =?utf-8?B?WmRKRDFRbFBwVWhzWHl4ZlltcnRJTTcxbFpmQ0dVVW1wd0FBQlZuY3Bxa0VW?=
 =?utf-8?B?dDJidGFhUkZUZ3M2Vis0ZmtOQzdhMEFwL29hQVVLcTlBY21CNXpwUE5NZUY0?=
 =?utf-8?B?WUNHRm54ZnVGVHhEc01vVEIxU2lucGt0blkrQXZkQUdzRGppK0JmSzkyemlD?=
 =?utf-8?B?UmxvYnZjcUJoaE4wMG5XY0c0U1FESmlsNmZGa2FqWlE0RkxSM2FRWlFrVHJm?=
 =?utf-8?B?OEd5ZFRBbDVaYjl0OUVvalk5R25XQ2ZnaEw1Tm9reVdLQ2lqVVpMdmpLUEdK?=
 =?utf-8?B?dmZjcDVIVzkzMzlMME9tT0J3Y3cwa1QrWlJOa0dpYUpQWWcwaitaWDZuVFha?=
 =?utf-8?B?UW54aU00T21HQWZKcDFnTFZIbThVMVpLY3lEQ0lmdlhTOG5XaGpZc2RQVitj?=
 =?utf-8?B?WFg4RFFpbnlNN1JZWXowdjhTTEYwTVZodXd6a3BRejZwamplSTF3WGwrSnc1?=
 =?utf-8?B?aDVFY3FpTlF6ZmF4ejFGRy96dXlPNkZFWldmQTdKbjBKUkxWaWtKV0ZDdzZj?=
 =?utf-8?B?eEZkWTNuclozWjczT1FQM3hWazNKTVh1NWhzUWVNMzNSaC9ORVVLdzA5a3dH?=
 =?utf-8?B?bnZRQmc1S1kzYWpjUnRyS01KV1l6VCtaZjRwM3F0QUpKamNBeDd6TSsza09J?=
 =?utf-8?B?WElwY2RBYS9wY3hGZ0F5WlYrQm5PUWJxZ2pSbkNXeGF0TDBUSENhVkNmZ0FC?=
 =?utf-8?B?ZlYzRmgrdFNEbXZNb1FyRHVnMCt5dXVnQ1F1aEc5RWw0UUpWUG9QYTM4bmY1?=
 =?utf-8?B?NDFrTkY4aFZLNHlMTWxYVHJweW9lc3p5Mjg3SlpUQlJwUzJSczBCa0JNNUlW?=
 =?utf-8?B?SlNtbCtEd25kaE5yODVqdm93azNsZVBlWkJoVmNjcFBDSXpIbkFBbHE4OCtQ?=
 =?utf-8?B?Y1BNNE9QZmp5a24vZGo4cW10THpPUEFDaS9oUVltR3Z0dUN3SXZyandXR3B6?=
 =?utf-8?B?WjVKZmJndTJZR3hoR0xsVG14aGgyVjQyd3FpUXNWYmsvRGZiY2IyQVE2cFJN?=
 =?utf-8?B?ODdUTnI0d242TmRtbWw4dUlldGxaMlFGUmJzYTkxYnRqcnJ6U3hGS3k0aU5P?=
 =?utf-8?B?elkxenhGT2s0cmZmZC9MTVlVSVMvSHJ5S1hlY2Z3QjVmMHh3czBpekhoc1Jt?=
 =?utf-8?B?OFVpQkxZUDBRM3ZhMmU2STB4STAvVllHUXA5OGZXWUtoZmM4Ylg3KytJUVNF?=
 =?utf-8?B?QlNXZ0ZmQVp5SHFZU2lkY2QyQXkxbUhzOGRMellkMGhUMTBYTTFiOTJrYlph?=
 =?utf-8?B?UVl3NTQ1KzRUS1doalUwMlpObkxlQWtYeEs5aDlnZjR2ZmVRLzBuRUlZUFFa?=
 =?utf-8?B?NGZJbnFndmpvYTZlV2N1bHZLL1ZDU09CQmtzQUgvazlZdDU2dlRYYW1iT2Qw?=
 =?utf-8?B?RDYwNXJnWFlmZnJqaXd1UWl2OUV5N1k0dVNtRUFSbnhQOXBIc3BFVnBsRFdH?=
 =?utf-8?B?Z2tVMnpaWFNtSWpSR3lSbFRXMFA4QjlzTTFBUkRaTis0ZXZjdjFTNDhrVXJQ?=
 =?utf-8?B?ZTlaTUtXbS9kd21KbTZDc0JZWTFvOXZPL204M1k1WmVicFRlTi96blhUWVZV?=
 =?utf-8?B?NFJ5cUlMVE93QU4vUWJtblc0QVJhUFVMM0FNV3BqaTd5WkFjSXBXY205b3My?=
 =?utf-8?Q?dFNaBw?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A19CB6F3476799448435247AAC48F28F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b26a2ab2-787f-4d8a-dbb6-08de3196778b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGFnNFlWOWJxOTN3UXRmVUJmeFpsUzFOMTR3QlhTWTFaTVN6OWVjaEIrcEpQ?=
 =?utf-8?B?T1dhei94RlluZXNERG5TQXRVQmFnTHFGRFFVQVpXZkViWDlTQ3lsdEdaaEFx?=
 =?utf-8?B?QnNSOXBJMU96T1NocWFDa3VDZFVJanlBTFo0dG5ER0k3RWxkUkpYbHNnU0t5?=
 =?utf-8?B?VENOTTFET0orRFRjTDJpQVlTTzdlL1p6RUFYRDRqZFZiY1JlbVoxTnc1clVZ?=
 =?utf-8?B?RjNLZHYwSDNKVGxXQ1pndnBkeW1KczlFUFc1Y1JQTitSd2pLbnVodXh3UWlw?=
 =?utf-8?B?eHZEa3loa0NSVFUzNitTK24vdlQzbkJFMHQ1ckZPMTZ5ZDByNTBEMWZZL2Q3?=
 =?utf-8?B?QmpjOGNwSU04L2o4M3ZnK0NuRHFFcnU5d1hVU0hZWmZQRFhiajBMbENhYVpX?=
 =?utf-8?B?c3RmcVovTi9yOXh1Z2hZUGRxcFk1N2Y5eldHV3NqZVI1Wk5VWmc2MW5ObGRC?=
 =?utf-8?B?eC9EYUpBZng5bmdCRktoNEMxWS9tZXc5UHBMVjJURXFmWFRlQW1WTXB4RVNh?=
 =?utf-8?B?ekJqYmJNaWFoNzFnL05wU3F1R0FjQm9uYUZBSFBiNWI4MmFXa3FjSEF6UzJq?=
 =?utf-8?B?MytTYWZPNGdsendMZTUvYVVyeDNxTWxFaytqQ2c0WGh1eDg1eEtYRFF2RGti?=
 =?utf-8?B?S2V3ZHdGaHNwbVkyYUVHOTQ5NlVraWNKMFBtdm1HMmFlVE9HUjdET3FzWHhs?=
 =?utf-8?B?d3FmSFhJMFVicFBUZTBRTWZsTmxrNjcwT09paTFmd2hiS0dZV2s0ZDk3cFdV?=
 =?utf-8?B?b0VvckdNRFE0QTJMOVo0UjdaejVsRU9ldkdmU1g4aFQvSWNCQVpjbXFiOUF0?=
 =?utf-8?B?eThTejdiUUwyR05lVWlJamRWQ2FsUkdLK01xdjFWRVcrUGN2L2EzZEZKaDJM?=
 =?utf-8?B?cHVnV1pwcVZLTTdsa3gwc2FLVDdDWThOZ2l3N1JSR0NpZlpwNFJuVnFjNUIv?=
 =?utf-8?B?aG1EWDYzemtxU0ZTMXo0WGFvOUdRcGExWDJSa3h6anQ1RHZUdXkxTG1McWxP?=
 =?utf-8?B?UVFsazlnRWNNZGZBWS9GUWFrQTJDSjZrQ1pMSWxUSWtSY1hOTlRrMTM5ZjFT?=
 =?utf-8?B?QXRyR0djWUsza0VhUnR4S2JZa0xhUHpHQUxyeXJkZHVSbHlBWktaUEROZXFQ?=
 =?utf-8?B?WEhibktjZU9Dd2tuMmR0K09CNG5EV3lMeGRremJwZFkxQnBNVk8vVTd1VlFn?=
 =?utf-8?B?VStwLysxb2N1ZHdnaUxEcUIyU0lpWE9UUFo5SSs0UUFoRExTZWNCU0FrQno2?=
 =?utf-8?B?anpZb3llbXg2NXhid1E2ZE5mUzJSdm1jd0xBd1lKSzJTUHpEWkZNNGtGYzBK?=
 =?utf-8?B?cG1ZbFJ0K3U0bHRKZjhWMXg3MzgzT3JFbnQ3cjFwRnc5Nm8yZ3hjdEduSDlN?=
 =?utf-8?B?L2szamZSZkZiNzRmMm1NdVlZb1RBM2JsQ1EzL0kxSTNOeWZpT2Nlemh5d3JZ?=
 =?utf-8?B?ODAyMG4zam5IUHlTSDVJZDROQksxK0dXMFlKMG5xVjBzMnBoMkJpUGdIL2tR?=
 =?utf-8?B?U1NPMWM0UGVBenRSUTl2YWlJOVVORHV5cjhsK1hxOFpNTW1keUQzd1ZRTU05?=
 =?utf-8?B?SHV1aHc2aWU4WmJZTXdoa0ZTVW5Wa0lFelZzTEovbW91N3RpR21GS3I5VFYv?=
 =?utf-8?B?RzRMckdqWlBQUVJuMSs3S2o2dkdwb0JhWU9sUkRPSmhOZUFtVUQybnp5RW1i?=
 =?utf-8?B?dmVPeFhTUDJjWXJVaWM0dVp4NlJjWmV2cnFqMjJjQ3hUbjkvVlJrMzBVN3VD?=
 =?utf-8?B?RUJmNmlJRU8zQTc0dTFaa3VKZENWUDY4VlVZSnhDTGhzTkJNUHNuaWU2QTVi?=
 =?utf-8?B?M1BMN25hQmxvWmQ2SzRKU053enhBelVKWEs2ZXpvaVBCQ1FwTm5OUnBNTm1h?=
 =?utf-8?B?WHJkMTZsejZLZEFqYllnU0RNWUFmRlppUXRybEJ5dWE1SWQ1STU0NGMxZnV1?=
 =?utf-8?B?TWVIdkN2SWJLS1pKMG4zOENSbS9HUTJ2cDZCaGovc1ZhQWdrMFA5VzVrMjhr?=
 =?utf-8?B?S1d0ZTZTanVVRXpIckRYVWVPSWJOeDVuWHFBUnhBcDBXanNRWk1vWHlOWWFI?=
 =?utf-8?B?U1Q4aUUycE1aemJ1MkQ2WStBVVlJeHV0ekluWWV0V254bGZlcVdjY1BxUUlU?=
 =?utf-8?Q?e7AE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:33:30.4223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd48772f-5236-4760-1874-08de31969e5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10460
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 11:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122260

T24gMiBEZWMgMjAyNSwgYXQgMDU6MTMsIFl1LCBNaW5nbGkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG1pbmdsaS55dT1lbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+
DQo+IA0KPiBNb3N0IGhvc3QgZ2NjIGRvZXNuJ3Qgc3VwcG9ydCAtZmNhbm9uLXByZWZpeC1tYXAg
cmlnaHQgbm93LCBzbw0KPiBlbXB0eSBERUJVR19QUkVGSVhfTUFQX0VYVFJBIHRvIGZpeCB0aGUg
YmVsb3cgYnVpbGQgZXJyb3IuDQo+IHwgZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQt
bGluZSBvcHRpb24g4oCYLWZjYW5vbi1wcmVmaXgtbWFw4oCZOyBkaWQgeW91IG1lYW4g4oCYLWZt
YWNyby1wcmVmaXgtbWFwPeKAmT8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWlu
Z2xpLnl1QHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiBtZXRhLW9lL3JlY2lwZXMta2VybmVsL2Jw
ZnRvb2wvYnBmdG9vbC1uYXRpdmVfNi4xNi5iYiB8IDIgKysNCj4gMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1rZXJuZWwv
YnBmdG9vbC9icGZ0b29sLW5hdGl2ZV82LjE2LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9i
cGZ0b29sL2JwZnRvb2wtbmF0aXZlXzYuMTYuYmINCj4gaW5kZXggYmM3NzEyY2U0ZC4uZmUzYWQ2
MTM4ZSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9icGZ0b29sL2JwZnRv
b2wtbmF0aXZlXzYuMTYuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9icGZ0b29s
L2JwZnRvb2wtbmF0aXZlXzYuMTYuYmINCj4gQEAgLTE0LDYgKzE0LDggQEAgU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjFhNGJlMmZlNmI1MjQ2YWE0YWM4OTg3YThhNGFmMzRjNDJhOGRkN2QwOGI0NmFi
NDg1MTZiY2MxYmUNCj4gDQo+IFMgPSAiJHtVTlBBQ0tESVJ9L2xpbnV4LSR7UFZ9Ig0KPiANCj4g
K0RFQlVHX1BSRUZJWF9NQVBfRVhUUkE6dG9vbGNoYWluLWdjYyA9IOKAnCINCg0KVGhpcyBpcyBl
eHBvc2luZyBhIGJ1ZyBpbiBlaXRoZXIgdGhlIHJlY2lwZSwgb3IgbW9yZSBsaWtlbHkgdGhlIG9l
LWNvcmUgY2hhbmdlLiAgVGhlIHZhcmlhYmxlIHNob3VsZCBvbmx5IGJlIHVzZWQgaW4gdGFyZ2V0
IHJlY2lwZSBidWlsZHMuICBDb3B5aW5nIEtoZW0uDQoNClJvc3M=


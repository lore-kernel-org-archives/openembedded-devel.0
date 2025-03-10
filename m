Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EFCC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:12:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.web11.35729.1741608762051371880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T5BmPTHZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T5BmPTHZ;
 spf=pass (domain: arm.com, ip: 52.101.65.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HDkypmnAoLVPDt6DbhUM4k1oO3PDj8H9Cn40E6u5uah5oShec2z2PS395QsO/iGCF9Jl2SZgf4Kssprm80lcmGq7wzQFtNcQmbYaLXVgNGDHutRshx6rNKU9lMr720Wjg1sAT4vmdCAl4dvtKCyrWskP5Cf8dNLUvLDGoD1Tm6C5YEPtis3SrLN5QDsSYHqYMB0MUZjZnR/7bTLxhGJGY9bJwWyNmaDU35btZnAAmvFAUoGjYz8Kbg3RG+gW6pXsNJu746ebCY9BzshKJqB3KJR7E5XGWws9Sa7D7hnAS06gg/tKvPfKdgKTy90aZDhTzq/DkOTk505P4Nz78YejNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlUn4kEVN2giaJR9D6tOwToUXMDkFB19vxEl12VJMAk=;
 b=kQDoCxCNfFFk/kMU3qiNDrANVgRnsT6SZakAIwOgU9TtGNXYcb5+ipNFZ38CYG6FhB2u8hmxuLhNukinAsy8HWaxW8iycJExPU0UxNybcsrXgEXHFqXflU+iMh5UEJwBM/zXxX5UoOl5Lo6nhfJozPoevKnvzse7WbnKA4UFj7e/2MHHlCQYJ9yIU8ZlpLOQzqbr2mk1cg+qrfSor7lE7RUEsyJJjzQW3P/vgxYmEJZnR3QSiOPQZwYt1aJFpRPZGKR2/2AIxBQNh9IdItLbH1nXDy55y8YtDAKedXtjakfknLdEHGK2T9PKL1hhRlpKBP81ppy8z9r4B22s1KUELg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlUn4kEVN2giaJR9D6tOwToUXMDkFB19vxEl12VJMAk=;
 b=T5BmPTHZcBb2bxqmRrN+XkzsCVpvtB4xT3goAW0HwT79iZF/XWkwM676v36k/bgtfGSbHcYR0QhO+OHyqLBH9dF53fePJeLAAlb/0BPPvnbVtAcOPJnCyCqjxqPgD/5qbcpKBcAM4F2Lg6DCxUxxAVTPCcQS+mJdStWaKMcQVG0=
Received: from DB7PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:10:52::44)
 by PA4PR08MB6125.eurprd08.prod.outlook.com (2603:10a6:102:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 12:12:34 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::f7) by DB7PR02CA0031.outlook.office365.com
 (2603:10a6:10:52::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 12:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 12:12:33 +0000
Received: ("Tessian outbound bc832f6acacf:v585"); Mon, 10 Mar 2025 12:12:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26d711c24ecbc228
X-TessianGatewayMetadata: /Ouovk/SE29pTu9Q2mnXs4FBV4D15n0xyca65HBUXkpLkihOcNmWzQpQW0Xyi9+7cOrbq5BAEB58nVLR/Oth0Bal4A1uXLjMomfF6u7QGQGaRg+P/dPOBQJvz800dq/S9q+uFoM/JJr2liNkJWMFqRJI3BhyCMGEVSlRhpCHdzM=
X-CR-MTA-TID: 64aa7808
Received: from Lc0cdbdc0d582.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2ABD26E1-0A13-4CF6-BA3C-844B54F2AB59.1;
	Mon, 10 Mar 2025 12:12:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc0cdbdc0d582.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Mar 2025 12:12:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdqObqXjExjBXIDXn8XW+T3S8iHmdzYJ3pz1EUqXs9vE/mNx3HL9mKiRg9mjcsdvp6CyqDRi95O5ii435d+okEz7mBKKAyGT3YEE+U42MDrqka5LjzWvVET9VxWl0WHRfY1IgzlDnKU2jVVNJXN9XVGFNxzI4jInqprFu/9y8Q18BISwqhOLnLDCxW+iBnGxzn1m/1AWypEbZ1Ki+Ig7n+HxB/mH8rsRROCrzOUL9IV4weax8v8D2qeYohXzli8XzgLdSs1grQJRCRgBZ3SYdtpznEgLo9vXb4tA8aEbYl0cjbELzqTYZf8alEmum+vE6GP9HCwW/R/UPy0bSoju3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlUn4kEVN2giaJR9D6tOwToUXMDkFB19vxEl12VJMAk=;
 b=zAl4O+gJsBDtCgBPKHr5C5JJzCg4s5F5ZyI8XPuFXNwf3dqHdLQepTbNuNTp9Ld9Sso5MLA8KDz4R2nwm6gvWcxUn7aGJK1zgQcqmNmIEH67+Cr3L5Q6Pjo+Pt6oM3GKLFEG2JOjjSY+M2dsD+IuT1YHLFon1XMORNCKjY7tAYcuXpd/W38K3pd7MkMTzRQZFhFOaBCVSTQU8SvL122f773MnW+lrqJyBxLdK/d+ISukpi8TOxfQ9ScG3mYfDXYIAdNiF/zLwvdGbcFNsEKTAuPOn8CIXSycBuHjB/gDY5VP7TRawtdZew3vnYtarXzG/y/UPFIUc5Nm9nB+hFzs8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlUn4kEVN2giaJR9D6tOwToUXMDkFB19vxEl12VJMAk=;
 b=T5BmPTHZcBb2bxqmRrN+XkzsCVpvtB4xT3goAW0HwT79iZF/XWkwM676v36k/bgtfGSbHcYR0QhO+OHyqLBH9dF53fePJeLAAlb/0BPPvnbVtAcOPJnCyCqjxqPgD/5qbcpKBcAM4F2Lg6DCxUxxAVTPCcQS+mJdStWaKMcQVG0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6736.eurprd08.prod.outlook.com (2603:10a6:102:13e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:12:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:12:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-pandas: compile against target
 version of numpy
Thread-Topic: [oe] [meta-python][PATCH] python3-pandas: compile against target
 version of numpy
Thread-Index: AQHbkSuBdlue5Qrwek2/H8zvdb54gLNsSPiA
Date: Mon, 10 Mar 2025 12:12:24 +0000
Message-ID: <36BB69C6-0A98-48D2-86F1-F22959444693@arm.com>
References: <20250309194302.451216-1-skandigraun@gmail.com>
In-Reply-To: <20250309194302.451216-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6736:EE_|DB1PEPF000509EE:EE_|PA4PR08MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: cc79e10f-0314-438f-b11f-08dd5fccd655
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bmpzbG5XcWtIamtHVWVPU3M3akFsWjE0WlpiVDZ1OTYrSFU5a1FrdERZMjNH?=
 =?utf-8?B?aDl3REl4TTFiMllJNXFERGZ4bVlLMkllZU5JQ3FZMlRpZ1JwbnZxalUyTDNs?=
 =?utf-8?B?UHY4aVJrVllKbVRRNzdncjZBZlBnV2xzS3NqYS9RRUdGVmtKR3dpcHMrcmRP?=
 =?utf-8?B?bTd1bWJJU1NGaGpZYmxMbSs2L3dzbHN4cGlDaHhLUE04eHNtUDZHRktWdkNi?=
 =?utf-8?B?eWx4MmFiYzNGejdQeGxCcnArNk5MWWZ4ajBmbTZWYndYeE1JM21WYVgrSTdv?=
 =?utf-8?B?S244RVZ6TEdFSGhYVXVOUTlMLzdDWEtFNXJKM09POXk4aFpGL3pSazE4d3ZI?=
 =?utf-8?B?Q3FtWitJemZucE9uOFlkVHdnSmVmcTRNQUVqc0owWmdiWFhKVUJjTEJObXY3?=
 =?utf-8?B?L3piR2JFRnFlcmgwMHdoL25obkNUc09RcXQwcTVuTUJtOUxzUStFRnE5aDUz?=
 =?utf-8?B?bHNhYXFuYUJ3YTQrOG9KeWdIdk9pdnRaUllIRGloWTdxM2JXTFhQc0xHaWRr?=
 =?utf-8?B?RFk3WVFHdHZSSkRBYjdJdDFHMHU2MW5xNVMyNS9kMG4zemcvMEFPVmFYUE9s?=
 =?utf-8?B?anM0OWg3c0ZkVEIzYVJxK3N5ZW0rSlZUbzJSRHJkekRKMTl3NG9rVHNyWXBq?=
 =?utf-8?B?ZHViVVFvbWtGZTdkMXJJQWM1M3JQQnJPVHVVbkpwbzU1TGhzWkZDS1l2QTdx?=
 =?utf-8?B?RFg5d1VpeCsvVHhZSU5BaXhwMk1EbW5EMUJab2JhQlRuWE1VYzk2MTh2dmRr?=
 =?utf-8?B?cHdRRzJhMmZTOUhoQzVKYzlHWnJlQmRNTkpZT1lXUmNQU21HdVVwY1dvUVZD?=
 =?utf-8?B?dmpLYVQyTzNMRDJZM2N5Rm50dW9xOEZGc3FHd1hRL0x4ZTVNdWJiZnEzcGFy?=
 =?utf-8?B?cVcrVzFKcHduallzYWFmNS9hQnBCSGp0bEVyWHREcGZhVGprd2RiemhkMDJs?=
 =?utf-8?B?NnJXZkF6eU1nWTEwODczaHA0aFJ1NDhsZXUwdW5RSGNPeHFKa2dSR0ROUlBr?=
 =?utf-8?B?RDZRU2JNVVlES0JzWlFUT21MblpKWFc5bEQ3dGtHVGdIMTM5VUx5bE9TSDE4?=
 =?utf-8?B?WEU0MTZsWkY2ejdvWHdNbHZ5c3hCS3hjc2pPZjZyQmo5ZWphVGlnS0tsYU43?=
 =?utf-8?B?aS92aVlTN1JsRFRyMW9mbkp2R2w3MlRoV0tXSVloWVNOSzI5cUpYbG1GT2Zs?=
 =?utf-8?B?N1VUclRFcHY2SHdZMTJMaThhNDlsemdUS1JNVFgvZTQ0V2JNSnhmMXJYMXdX?=
 =?utf-8?B?UEszbStnbDZXb2FxeDRXdjlnM1VpRGcwdmVhY0crVjdQU2V2d2VvL0wzdGpr?=
 =?utf-8?B?YzUyVzh6TDhVSXFUdE9PaDc1RDhURGRWK3RrdjQxbW9qdkNMNENPbFFtVytp?=
 =?utf-8?B?V1o0LzhqOGpOMXUrNG9Jay9Oa1pVM3R4cm9naFVDeTcyRldEMkxBVzZ4ZjFs?=
 =?utf-8?B?bjVOdlE0SENJOEFaaVRKYytJWEs4OUdkRlRFWUN3Kyt3akVQbEZvZ1l2MlNK?=
 =?utf-8?B?bnBHOGJqT0IwQ2E2d2Z4MUtqUG9LNDVLMWZ3bEJVL1U4enRYMXRpb0F0Qm9P?=
 =?utf-8?B?UGhHZkdvVS9TNXhHc2NIdTZiNlBwRURVWms5UVdTUHo4Y1RMeVZ0L2RIYWZr?=
 =?utf-8?B?YmZtM1lQZiszMUQ1RERMTnRjTitOYWhLWkx0QkVZenB2U2tTclJic0dKUGcr?=
 =?utf-8?B?VEU4VzlyaHZVQ2MyWGJVYWlTNjgxN0J6RVZnRDA2cjFBUTFaR0RoZStick1i?=
 =?utf-8?B?VExDbm9SK2hnb0c2cjlscW1veUgyR2pSZURZT3ZZaVVOQ1Mva2tnYW9UWTFJ?=
 =?utf-8?B?VWdidEpEZjYwUTNJNkp5ZlFINjdYeUpFd3Bub3JCbVZIdk1HRzZZY3lsYVFL?=
 =?utf-8?B?ZEcrNDhJcFhUTzVRR0YzbHlhR0UvazZ6OURDak53bGgycG53YmdSZVpHYWs2?=
 =?utf-8?Q?RYdtgpk8c2U6OIj0jbZzufkMBoA8N2ZQ?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ADFD72C22AAC34C9281A532318BA84E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6736
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3ec226d3-5232-4e91-724b-08dd5fccd111
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3BsVEcweFFlcnVZeE00ZlRNRk5pWllpeld5KzlkTzM0RUl5WFFkYUVnT2Ra?=
 =?utf-8?B?dDIxSmJUNUJlcnhJMmtXUHpUelJwL2RMcmc3dGtsdnB3QmcwNW5DcjhMM3FP?=
 =?utf-8?B?WTBMQ0tKMlppQWloQVRhVHRVOUtidjNIenQxbHBya2xWWkJyY20zWjdQd1Qw?=
 =?utf-8?B?UzZkZjlic09la0l0RVQxWGU4RDFNN0pPUThjQUlUOHF5SWFkTExWTElFaG1o?=
 =?utf-8?B?Q0VxYVkvZnRGMUVLMGhDUjBwWEw2aUJ1MStkd0xXanVsTXBvM1lPVEFoc3pz?=
 =?utf-8?B?bnV0UVZDNU56QUU4SlhCRituMDhCa2xCZjY5RnlBUnJDOG5BR0ZyOG1rVWRL?=
 =?utf-8?B?K1ovS2JxRTRZa2wwdXZTSW5tZFBLQng1bkpQbW05TFFFdzdyQTUzREpXbWtr?=
 =?utf-8?B?NEhPZ0pLNlpLUG9rY2pOSHE2eE42MFpUWURYcDdPTXVzSWpqK3lpRkZHWU1x?=
 =?utf-8?B?WWlqOWRrUXpnNnFja3lMVnpaM0p4Y05sQkMvR0hPTkQxb2IweHd4cXVmM2Zz?=
 =?utf-8?B?eUtpNksrZmZFbWpaNy9rZFhpN3hhbis2TGQ3TnBpTUxLc2xUMyt1OVhxRk41?=
 =?utf-8?B?T0RYRWpFMDk4UEk0aTRaNnZDbFh3QnVLdUtPNlZHTlB3NGNiWTNwNklFSHR6?=
 =?utf-8?B?TDhuT0NwWGxaOVBPSEovVjllaFFwV21jUm5iMDlwVVg5L3hYWFIwT2RJbVMx?=
 =?utf-8?B?NlhwMXVaejNNd3BVZG5lL2lGVWszbm1yWDBES3U1N2FoU1liQitzSUZTeGV6?=
 =?utf-8?B?b293M1hRTTdjcis3L1BmUEZRaUhOTmZpNFVXdUVKLytUUkVPc0JKSm91MlpV?=
 =?utf-8?B?Yi9wL0wrYzNUQXZ6dXM5ejJ3QlRwOWtVQnRMUHJEcC9qVHBkMHBzWnBnb1U1?=
 =?utf-8?B?YmxoNm12bGJVNUM3ZTlxb2UxWnV3TEpjZHNZemU0SEozY2VtVDlJSy9JKzBr?=
 =?utf-8?B?NThUK1VqeG1kTW1XNVBrM1N5NHhsM2duSXI1RlB3emxoRm90NVRNenA4Vks4?=
 =?utf-8?B?Y2hWTmRnaUFCWDg1eUR5bzl1dXB6RzJyYWRvQzlMallPa0FxNU03K2dvTWpr?=
 =?utf-8?B?ZVVFV1JJS3lOT281cGZFVjZ5alBvTjV5RzZFL292Ym1iQ3RwbWo1YnN2WSt3?=
 =?utf-8?B?OUZ0VnRpTEE3VEJEeXNHUnQ1RzdPdmNTQnFGK056eDFjSW1YNG91KzhhRjh5?=
 =?utf-8?B?MUw0TXFSbUNud3BwMVQyRWYrUDlxempHdDh2R3A1NG4zZ2tENHk2cytBTzNz?=
 =?utf-8?B?cEhMZWE3Sk1OZStDRHkvU0JWK3cxenRNRGo1QTdxZUhlNzgxWUNyRWNxT2Zp?=
 =?utf-8?B?RWhFbE55TnBiNXRGalE1OG5tbzNXZHYzTjlyK3JGRTVFancydEJwN2hFUG5B?=
 =?utf-8?B?UGUrZXlzdTM1bmtxZm5Sc0sxZFF5T09Jamx3QUVoMVFEemRTc0hIS0NDbU5G?=
 =?utf-8?B?MzVsK3lzclA3Y3d2b2RYL2tHVEdESlIrK0xpQ0hZSkl6NUdLMGF2WWxCc3Bu?=
 =?utf-8?B?cUM1NzJJWC80WEhVdkdiRmhZbnFkbEJaVW96NlpldVBHdDVRMEhRRStiWi8y?=
 =?utf-8?B?ay9lT3JSNFN0N0l6TTA0SEJhcGtmRU9RTG9vMzZpSVVVaERhRVh0U1dTWTlw?=
 =?utf-8?B?TUN0blU5YVBMU1BQbllzZmY5dzBneWpYdVN1WHVUWFJ3K1gyVkRRemFZM3c4?=
 =?utf-8?B?VkFyZGpLRU9RRkUwbkg5V29qSUdrckoxUkJFRno1Y2lkZVowMnFrRHNNN2NH?=
 =?utf-8?B?VHJSa0EyTzRTYUdOU0NES3hqb25qZW1BamVmTGFoRjFsZkZ1elQ0N0xlOGZ5?=
 =?utf-8?B?Qk1XRWZab2M3bVYxZTRZUExHMkh6MUk1dmtvR2tUR0phbUJzTllIR3N1Vmcz?=
 =?utf-8?B?NzJZUFdselMxY2tGaGFUWVVlNG1YSVh1bXpBVEpQdG9BL0ZnYmR4VTJlRFV6?=
 =?utf-8?B?bWUvdUVRV21lWmRSVHEvMmVqSmlLMytKRURvd0orT3NtOEgwUFlQcUVzaFUz?=
 =?utf-8?Q?PWRQCyUnHsRDcvwTK4QEJ1X5xgs+e8=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:12:33.0229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc79e10f-0314-438f-b11f-08dd5fccd655
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 12:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115830

T24gOSBNYXIgMjAyNSwgYXQgMTk6NDMsIEd5b3JneSBTYXJ2YXJpIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxza2FuZGlncmF1bj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQ0K
DQpJ4oCZbGwgcXVpYmJsZSB3aXRoIEluYXBwcm9wcmlhdGUuICBUaGlzIGlzIGEg4oCccGFuZGFz
IGNhbm5vdCBjcm9zcy1jb21waWxl4oCdIHByb2JsZW0gYW5kIHRoZXkgaGF2ZSBhbiB1cHN0cmVh
bSBidWcsIHNvIHRoaXMgc2hvdWxkIF9hdCBsZWFzdF8gYmUgZm9yd2FyZGVkIHRvIHRoZW0gYXMg
YW4gZXhhbXBsZSBvZiBob3cgd2XigJlyZSBmaXhpbmcgdGhlIHByb2JsZW0uIFRoZXkgbWlnaHQg
ZGVjaWRlIHRvIHRha2UgaXQsIHRoZXkgbWlnaHQgaGF2ZSBhIGJldHRlciBzb2x1dGlvbiBpbiBt
aW5kLCBidXQgZWl0aGVyIHdheSB0aGlzIGlzbuKAmXQgT0Utc3BlY2lmaWMuDQoNClJvc3MNCg0K


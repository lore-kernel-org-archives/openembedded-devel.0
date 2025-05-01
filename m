Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0860FC3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 08:23:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.54])
 by mx.groups.io with SMTP id smtpd.web11.7158.1746087778127457811
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 01:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GnRZ8zoe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GnRZ8zoe;
 spf=pass (domain: arm.com, ip: 40.107.159.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NWnY+25CasVDHA19+KJ5aQXiwkph+TlIp1XPBXLgzOSvRy3nLUvLYo/7nxzdr0/G8qXlOFWj+4faMQC7+H8wQNZ6VcBV1zno17/F//1gv6w2HRntvMePVJOuc8dwHAGFd7CVxnVt4xwvS3NYLvGg+3C5t5jdYhgU+/Pw+m4LYEPbqb+qDClxtkGVR4WkadW+Qp5hznGzGYR9Pd93mE+z+z/t+Xb4XXwrYkrjmNsxORCvFAzkHmnF+bLPj9AqzrSbgH/EQWRdIFTcTY/7Yhy52axr6ov/in5Jb6jVuujRyx3YEv6L6E8gJYdLfaRVVSZnJDwrKMmzfzu4pRz3OZCwVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNj9Wf0z+heYWH5FOWvSEPAN412N6cgsp4XZq02v0F8=;
 b=YPFVeM08v0msCEyLlvhAu1uw8VYzRQsYB6+q04U4MtL5hxUZrIvBGIzv8LqqKLgvUxvuluxh3lumabPdWNN4EqXA3pmBP3sB8hpq3aGdK9X+WUTv3uR+jC2JaPJxDrR5BxZNU9KYuSksBpfvK74la6PS+QAf4KUEvQB0+2Y2JaErR0czxhQihx9X0xIAc4i1U29rZK284dy9mdkvpHAsMqiQrX6MMZyP4Ag8jrx6iK8JBtH1T7djAZUK8DV/eYWr8cX6Yhk1gJJQDHpq7AtAPVSxm3HDvN9L3hkfBunzjXzv7n5+4Ucz5DbTkxvgbvVQ+Y/zaUkbG0eUeCjLbl+GVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNj9Wf0z+heYWH5FOWvSEPAN412N6cgsp4XZq02v0F8=;
 b=GnRZ8zoeSrQkYcUyLAGtA0dYynRJcfZmojLOBbwS7X1d3Kxg6UlULiRaARVb4YZTlF4rdOx4/8Z9+ttiUh4AAs6V6LL1C/Umh+Y7aqikROBhHKClynNUGn8T0Znb3HV5abjdeVoyI5l4LQKe586JD/4Xss+xNTgMW40eMCWTDp4=
Received: from DB7PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:10:36::20)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 1 May
 2025 08:22:53 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::49) by DB7PR05CA0007.outlook.office365.com
 (2603:10a6:10:36::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 1 May 2025 08:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Thu, 1 May 2025 08:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fwv0w83G49JyjyUVqMjPuexqFcQ8Fei2st9JUoYQBenb6hufCWH4TzYpp8se8UPIAKJq8L6elPGhUqX69rU8LsEBvHLrUBW7dOIBuhG6GHr84bTEstjHDZaUhn87YAJlFhaU1CQ+Duv2anBYeEzEGjqPeemUEDeyYlb1MP8UEYvdBXoFy6Mwfkh+7u199UmE3U4jjILeISPQ7PlRv9LZVZFvH+0hXHGMx512Py7lwDgIbyiLmCbr/89vZhmAtnZ2/h+4nbqqnZ7ynT4Ao1HdLi605949/XXmaUR8vJgfPsWn426SP1kceBdqZYo3VogZJoddqyNu1MVyixnMQchwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNj9Wf0z+heYWH5FOWvSEPAN412N6cgsp4XZq02v0F8=;
 b=bM1vh+NGNxpKuEnUbC27ZH1JBmTTu7/UeSfshv1VXunq3EDhp1ZpPctk0R0V3SX4eu8pKavis3G0n824Z5CwN+1vNhaoM5PIsyye7IaUCVdEN/TdbI+g/HBpmhhYvoxH8qUtWSVKIiJ7W0mBadAR1kUdOQUBtDIRbobLkIYpKFSLcXgKYDR6QunE7xhrxR/TBjpTaqj4lvf1XGpOmWHmaRrwAyetjekEmgaSdxxuEGOJBj901e3+lAZ298eZU55ON93vnPYc3RBj9u4K4JAoSmdwaXTMpspSFxqJEQX4Mvz8Ev5tgT05Sn9pyIfXMgcrCI3KFpyq/lKnT6DAcB3obA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNj9Wf0z+heYWH5FOWvSEPAN412N6cgsp4XZq02v0F8=;
 b=GnRZ8zoeSrQkYcUyLAGtA0dYynRJcfZmojLOBbwS7X1d3Kxg6UlULiRaARVb4YZTlF4rdOx4/8Z9+ttiUh4AAs6V6LL1C/Umh+Y7aqikROBhHKClynNUGn8T0Znb3HV5abjdeVoyI5l4LQKe586JD/4Xss+xNTgMW40eMCWTDp4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6313.eurprd08.prod.outlook.com (2603:10a6:10:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 08:22:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 08:22:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/1] ne10: Avoid requesting an executable
 stack
Thread-Topic: [oe] [meta-oe][PATCH 1/1] ne10: Avoid requesting an executable
 stack
Thread-Index: AQHbpN65ue530j8kYUOhv81FXXJKw7O9moOA
Date: Thu, 1 May 2025 08:22:18 +0000
Message-ID: <2547531C-CADD-4B40-B9F1-E06FF8F15318@arm.com>
References: <20250403212342.3580553-1-pkj@axis.com>
In-Reply-To: <20250403212342.3580553-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6313:EE_|DB5PEPF00014B95:EE_|PAXPR08MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: bad8eee2-dd1d-4134-bdd6-08dd88895d43
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y0I4NjFMR0tYb0p0M1FJeUYwNmllVmp1UDNvRzZjbVNTMk1MUWZHREtoVHVw?=
 =?utf-8?B?aW9BQ2FrNTlMN3lPdkJDL1BSRGFlZllaMjFCZmJTTUVvSWhwUWhvelloazJF?=
 =?utf-8?B?VXJGWmRyaTZNSjFVczN6a0FleE9QMm0xNjZyKyttUVV3V3JoNkxPV3VHa0ZI?=
 =?utf-8?B?dVNOeGNpZDBYeHppYnFNdWYzZTdRMytJRE5PMmtMbjI0ZEEwdVlVQ0hCbXdZ?=
 =?utf-8?B?TnBPTG50QjFXaVAvTk5zck0vYm0zYkVqRnNjZEo5VFJPajlwL2NOL3dlYTRC?=
 =?utf-8?B?eElYQWJNNEJrVmJvbFhkZURqSFp6MlpZTzNWdWpOL1EzQlVmQzFkaHZueXhR?=
 =?utf-8?B?ajFyRmxNVUx3SGhSaTJ3SHNpaGp1TDgwR1NDQlBzc3BweU9FQmVOSnpFL2VZ?=
 =?utf-8?B?ZWZ3OCtDcGJwTXB2VVF2ZVBRQWtPc1crRWlBMGJMbE4vYW1zWFo1WUYvUXZC?=
 =?utf-8?B?Z0FNVmtEWndWQnV1OGg0blpNeUJHWmo1VjBlODZXRmRQRVhnSUgxeTN2TXR3?=
 =?utf-8?B?NWpWUmRGR0dmcFZldk9DNTVEODB1amVLa2RsYkdSdzEvYUc3ODhPV1NIWTlK?=
 =?utf-8?B?SksvWTZyQjh5WGJLNjJiUlZJMW5MVFBUV0hxLy9qaVpBNGFyYkJ5eUZSVmsr?=
 =?utf-8?B?OGJ4QlovVzlCQmEwWUpKblEvQTZWWkZjWjhDeWJZTndNY2Q1U2d2dy9hZU5V?=
 =?utf-8?B?UThEQlpGU1dzK3FyWkJENHJha3QzZEtaZmR3ZVNFWjROVEVNVVJGczdKZWRS?=
 =?utf-8?B?T2EzUDRsK0hjdGt1ZVVjbjFxdSt2WncwdktHQTNrTm16SXZYUVZmc0NkS1hy?=
 =?utf-8?B?VVVKMUxHYnR2SXBGL1NWVWx1RUoyTEdPVDVPeVUzOWRydHJJK3AwNk5nZjBp?=
 =?utf-8?B?c3M3TzM2cDdUTUhOeVBNMVZub1VJWnEyZlBXTzVCaDFSNGhKVjh4TktEY0Ix?=
 =?utf-8?B?eVowZTFPT21pYS93RzhxWVlna1ZZSGJuRkxsVUQzVll0emhRMjVDRFJWVkhF?=
 =?utf-8?B?empzZUFNSjRLVFVjY084WEZUWFRMcWtmZ1dkUit5SGNiVFdvSVpocEFxWXRz?=
 =?utf-8?B?dkVaVXVWa1hIVUtVa2FtYkd0Z2hmS0Q0aEJXODR3VEErMVVzN3BnTjZjQy96?=
 =?utf-8?B?MzJmV09FS3Yrb1dzaCtwTmtLUVl4Y0M0dFFJTHRrdysrRndKYjZQQ2VCQ0ZO?=
 =?utf-8?B?UmdwZC9Ic1JCQ0VLdjJzQmMwSi9CeWFzcFltdHhxaVJleG9DZlJENWQ4RkNY?=
 =?utf-8?B?bUN4c1ZzaFY1SlpMUjVzL04rVWoweXlYUHlvYUg0dXpod05JR1dZTXlZazVW?=
 =?utf-8?B?WnRxTzVwUWJudGpEZ093QTRLdTBDZDFaR2d0aXJxMmRYRVo3NjJ6aEpoRDhV?=
 =?utf-8?B?OGpycDk5bXEwajIvNDFpT2xwemlkVzlBNHA0amg2Q05KQUttekFuV2IrOVQ1?=
 =?utf-8?B?aWJ3RXBXSTNacVpQTVo2TnA2VVQ3R1hkbE1aSDZXdm5XWE9sdXNIU0ZyWDF5?=
 =?utf-8?B?VHhHYUlGaC9KRXdQVzJKQVBQSUhQQ05Cci91V1d4VWJFcGVLdXM2bzhmdEx5?=
 =?utf-8?B?TWJqTEUwK3Rhb1d4K05pNitXQ0hIQjVSS05scVVPRGFROFFwOVVFR1VFM0ZS?=
 =?utf-8?B?Szd3RjJ2dCtZcTVNbzduUWp2enl1TDQrUjlWUmN5R0xiK1QvWG42TUkzSEtG?=
 =?utf-8?B?b2FhT0szU1RUUFpjWVUyR052c2JQeTRGREpWd0xJY0RFNUZyQUtKTkFJaUZF?=
 =?utf-8?B?UXhsaVlNWjd3bXJJUkdZUXlpS1JZNUVhK1MyeHUxV1VLZWl4a2lPUnAwQVlz?=
 =?utf-8?B?OUx3dEhyaG1UWWozbk5VcWFDUi9MRjcvMjlpUnV5SzdKSlUzTDRQK1BFM25H?=
 =?utf-8?B?NW9BMHJWbUdodjYrcVc1VkYyREt4dktJMkJlbGJyb1RIRjNwWkVZaUhoWlpi?=
 =?utf-8?B?YjdxSHFWRjVIVUxiZUc4YjVFcXZyM2xDRFNjOFlUT3o3bE8xRVl6cHptYlpG?=
 =?utf-8?B?Y1AxVERjN1RRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFDB8488CA1BF9439D561430E05C6C20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee6232b2-6eab-45b9-f234-08dd888949bf
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1VRdFZnUXRDWWNZMWcvaWg4TmlCa0RtbkR4Tm0zSno3bjg5ZkpiRko5Tm1Y?=
 =?utf-8?B?N0l5c0NVT2QzMTdaR0F2TW5EWEx6WEYvSGZ6MEtUaHl5dE15MjR6a1NZejNU?=
 =?utf-8?B?MFQ2RXpXQUovamlNcnZjMEY0YWYrWi9UQjU4R2Mxck9sWEZwam1pbVJ5QlVS?=
 =?utf-8?B?NndPU2RNdGIyQ1pPSDgxU3JadzkyZW4wQ2k3WTdUYjRXN1oveStUK3JvU0Vl?=
 =?utf-8?B?ejJWVU5zTUp1VWNUM1JJYmdRT1dSVFZVTHE5cDRGOEhkSEZOQUNoeFoyanZE?=
 =?utf-8?B?Nmg3S0czNjJmR1h2REpNbHpJQ0huNXNoQ2tSblR0SW5jZ01GSEFhK1Q0ZTVO?=
 =?utf-8?B?NU9tdHdGellvcUR5dWxQeFBDZjd5elBaU3JRSW9xZjF0MVR4eXN6ZkE4NVJl?=
 =?utf-8?B?R2Z0L2g3TGtwcDRSR3ZGcGZ0YldnN3krTXd3MzNOL0N5QklUdDkzZnhXUHpy?=
 =?utf-8?B?L1ZKbFkwY2wxdlhjN29kaVVzM1psZmxGMzZDL3ZDanNaYkhXRmcyWi9yalBs?=
 =?utf-8?B?UTR2UDRnbVhzRjgwZU9GRlFJWCtWN25FQ2RZY0ZkNWpMRjk1R0Z1MzZrVHYy?=
 =?utf-8?B?QlZCSGk3U1V0dnpuYXJvRWVUdE93RzVENjZWTXBxQkJsVnE3cHhDVURYd1Yy?=
 =?utf-8?B?M2FMNElkTmVYVW5jSFdsT29HcEJIM3YzZExMQnhlWVQydEtHOUVtQ0VNaHY1?=
 =?utf-8?B?amtCTEM3NzM1QTBrRWJWMDdMMml5R253alViQ2QwVXFHWTk3YnZkWkZSYjB1?=
 =?utf-8?B?QXptdkV0Ykh3SVphWUljeEd4cm01NjJDL1IyUTFZTmI4aHgvNWFYVkFiVjhz?=
 =?utf-8?B?T25CaXMvM2lFQXlyenhXMG84c3dvR0RaVUFUQ3M1ekJaWEpHbmg4SjMvcGg3?=
 =?utf-8?B?RDNITGJ1ZzA0MG5PNXF6cTRoUVBUS0xKbkdPWWd4T3lDTE14N1VhL0l0VmtO?=
 =?utf-8?B?K3d3OVlnbHVQQXNYbkRFZk51dC9KN0VUcDNDeUNaWW5ZVzl3a3IwM1BpS1dG?=
 =?utf-8?B?bjFzRjh2NnVLVndBY011eEtsTmYrcmg1M01CSDkwTk92dll3Q1UzWHNzYWtz?=
 =?utf-8?B?alYrMFl6K295UVVaKy9qTnROdHVMUmc2Y2pObGxNdXBwSFZFZEVnb29sck1a?=
 =?utf-8?B?dG9aMGNqZU5WZkMydEdiR3ZIK29MOGEvTExTUVFTYXpnVE5DZHo1Z3U4OUlY?=
 =?utf-8?B?M0t0LytUWmlvbFE3NU5IeFhZUG5UUm0rekU5aVJLNjZ4azBhQk82TlRUbjkz?=
 =?utf-8?B?TEEwTXU5ajRLNmpGVTZNcHUwbmtlR1lBMVBUQVYxT3VKWGJUNUlVTzN6UUxo?=
 =?utf-8?B?eGR4Vmt0MWVyUmw0c1NnSHY5OUpHY003RVUzYzR2b0ZtMHNMRitZbDlvblV5?=
 =?utf-8?B?KzBHckxWRStlVGt1YURHOXZ4NXZEZFEzKzdMVi9PTVY3czNaR0ltdjNjSGtP?=
 =?utf-8?B?SGsxWTlVc0M4MUkybWVBVUJXN2lWV0xrSy90Zi9TbTFDM2Q5b1dVV3VUVzV4?=
 =?utf-8?B?L2gwUE5kbTVPYzc2c1E1S2s1cVlES3hKQ1k1VDViK1psUWdFMmxnNlgyNkNv?=
 =?utf-8?B?Mmk3bWpmTmszZnZCT0R2L0dKeElyOWJUcHppT0NKVlBzSHhPdU14MXVGYTRp?=
 =?utf-8?B?U28wM2RJd0VPRUdudmlLR2FpQmdtcUxQeUdQQXVYM1QxRVRma0VwOE51R2N0?=
 =?utf-8?B?a2krYXRDL1liRnlxQU9KMGw5dGJEcTN5ZG01YXpGLzlFbmVJeC91Z1VtdElL?=
 =?utf-8?B?RUpLQzhBZEpaZERyU0pkUnB0eUozRi92VXhRdDNXRXdtTFZQTGdVYVkxVnBZ?=
 =?utf-8?B?RGxJM005bDZnVmt2YUNPVEJmWDlPTkpjaFRWU2RDZSt2NEErbWlCYkxNL1Mz?=
 =?utf-8?B?VmNSbERiU25nbFJEbk1ZU1RKa0g0Wk1lWHMrV0RVaFpvS1QyblNYMnBMMmlw?=
 =?utf-8?B?UzBRVWRnZ1poQ25yMVdRSE9WTXVoeXQ5M290NnNvYnlwZDJXOFZpSFJiajRF?=
 =?utf-8?B?WCt2Z05TcmJyUHd0OFhWNTRzTmxNYW1wT2toQ1Zod0ZweUdvYTI1OWpJTlhN?=
 =?utf-8?Q?sajLjL?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 08:22:51.2633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad8eee2-dd1d-4134-bdd6-08dd88895d43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 08:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117268

T24gMyBBcHIgMjAyNSwgYXQgMjI6MjMsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gVGhpcyBhdm9pZHMgd2FybmluZ3MgbGlrZToNCj4gDQo+
ICBsZDogd2FybmluZzogTkUxMF9waHlzaWNzLm5lb24ucy5vOiBtaXNzaW5nIC5ub3RlLkdOVS1z
dGFjayBzZWN0aW9uDQo+ICBpbXBsaWVzIGV4ZWN1dGFibGUgc3RhY2sNCj4gIGxkOiBOT1RFOiBU
aGlzIGJlaGF2aW91ciBpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIHJlbW92ZWQgaW4gYSBmdXR1
cmUNCj4gIHZlcnNpb24gb2YgdGhlIGxpbmtlcg0KDQpDb25zaWRlcmluZyBuZTEwIGhhc27igJl0
IGhhZCBhIGNvbW1pdCBpbiBzZXZlbiB5ZWFycyBhbmQgdGhlIG9ubHkgdXNlciBpbiBtZXRhLW9l
IChsaWJvcHVzKSBhbHNvIGhhcyBpbnRyaW5zaWMgY29kZXBhdGhzIHdoaWNoIHRoZSBjb21waWxl
ciBwcm9iYWJseSBkb2VzIGEgYmV0dGVyIGpvYiBhdCBvcHRpbWlzaW5nLCBJ4oCZbSB3b25kZXJp
bmcgaWYgd2Ugc2hvdWxkIGp1c3QgZHJvcCBuZTEwIGVudGlyZWx5Lg0KDQpEaWQgeW91IGNvbWUg
YWNyb3NzIHRoaXMgZnJvbSBhbnkgc3BlY2lmaWMgcmVjaXBlIHRoYXQgaXNu4oCZdCBsaWJvcHVz
Pw0KDQpDaGVlcnMsDQpSb3Nz


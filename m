Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3C5C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 21:15:47 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.21])
 by mx.groups.io with SMTP id smtpd.web10.6399.1752786938451304081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 14:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IyYtiSG9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IyYtiSG9;
 spf=pass (domain: arm.com, ip: 52.101.70.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=T/fCLYQrR3mBN+CBXZp28nA60HvZu9+Xm16G4EkesREGRS2GIeQI5JJ0ffNT3Gwru7XHIOCkHHKGbPfOxxxgpmeyNjFy+RdkhDf7LMk2ohXWKylGE1N4WCBB8VpbQUx9nasZQUTXkBg4hsnh6qutfvtXwuyCWLYQH69TqBdK4ddN2C8baFLSDkxzKnblXNucV92Qq3ISc4IyQGrErRp7PcOr59YieWjiPle8VyWXbKiea9N/AR0SVl2qQoHOQDY2rLVSKV4MLwe00u0/sJZXOO7If8tW60cFBd4++5OxJiCpx0vAvw+9EV5ljLmy26HePGovQ6mwVVxiInHSyl6X9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POv5p6+0flIEZoasynXZOaMSMVkXsV1bvCwBq81Bpmw=;
 b=hqAQR3oqSvuYtgwK7WXCLy9Q99njtDTsC4spwoJ/534krH1ujuh8bjrxAv6lJ15NbCqq0kkWSDSlVtwYKrXpwfw0Ky41r4L0lpLjgm3A+veOmOxAIYFEdBqLrSP1C0TKxOzNRcpKoLl+xnyXMhFMEnIPsh0SpDz536WINdLMdWr06KEDvccoLD14E8KoStZogrp4qr44SK1XEhaxribOsAb8bffF9bZR5ezlSgee5PE7ZYvTJmzE50kH3k2zL6tB59RoMuQ2M365LWwkCudppibn8vqRRKcVaMvEkoUOV6ZouE/zdlG3Ldud1vev/Xwe5hfLoNoyNGRh/rERw6HDHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ti.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POv5p6+0flIEZoasynXZOaMSMVkXsV1bvCwBq81Bpmw=;
 b=IyYtiSG9TPonKLi5Bogddk+lscbDGMYPpKCWDlsW/hXfCd+/DK0NnWQCVD1BqL1XQJGxLFLVgVhW1VbrjxwJsHqEA8qx9zhVdVBvnaRKdqHwJD1albW/pnSz0nx/VNr0LYZjnU/GZhMA+h3YqZv28Nt1obc2+XnS+ozOWEI/dn8=
Received: from PAZP264CA0254.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::20)
 by PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 21:15:31 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:102:239:cafe::60) by PAZP264CA0254.outlook.office365.com
 (2603:10a6:102:239::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 21:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 21:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPxbfjppvM4gx4dLr33omXXBfPw9U2GvU+b1Hu1mfu5t6Cd6u8U7bMMTPzh55nSjvXr5iKyB7zMEdUJ+z8t+lGR50EmpOix5eRModAkBuVFZPGIXz55FvPz1w/oZM11Bi18igvmm8++rYsVs0x673uxbEXQcs/BX9oyjgGMkJRfhCdno8srbCr53fn2Z0leEeQLL4bo8bWRnnqqY3S5ye9FeYQQp4EIfzmvurK1jbdeb6+8dQoO1TKZRfXSWq9SYNkd7K8W/7ISixMAgFHWNKugxk3153pH0/s95Ww6hBi6ulCxPzGjITSJ0c0AbT+jnHQNuhGREyUABUjilBtzftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POv5p6+0flIEZoasynXZOaMSMVkXsV1bvCwBq81Bpmw=;
 b=WeEUX7EY48NUvhREPKnVhK09kW/SVS4iQz0Rdyt71XeMlM0Vq3Dkg2Iv/xnRL+KT6+1QaTOVsQb0MvKSnw8xGb+K5sX6mulzhFLH6PPSodCXlFTW8toa+vRt2i5fn69CNwxfDIgNiXxL2+TEvtRmjMpYtbMsscfhrya8WEqcY7Uc2Q2iShpLjgKoFzYpWVj+PY1qMdbmiodYmR6vj2J9ywfwWhF20yK0fkRBICcRv9CsTMXcsaGpMUut110BDgzoppSHqf3B4BRIVVXT6GeIyPwjCgG8V592kmwZuQa5Y/xeVfPuQij0UeHp4CqpS2QnOFqDY+f3BT20KBtbY4o+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POv5p6+0flIEZoasynXZOaMSMVkXsV1bvCwBq81Bpmw=;
 b=IyYtiSG9TPonKLi5Bogddk+lscbDGMYPpKCWDlsW/hXfCd+/DK0NnWQCVD1BqL1XQJGxLFLVgVhW1VbrjxwJsHqEA8qx9zhVdVBvnaRKdqHwJD1albW/pnSz0nx/VNr0LYZjnU/GZhMA+h3YqZv28Nt1obc2+XnS+ozOWEI/dn8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7402.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 21:14:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 21:14:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "a-christidis@ti.com" <a-christidis@ti.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] ktx-software: Add recipe v4.4.0
Thread-Topic: [oe] [meta-oe][master][PATCH 1/2] ktx-software: Add recipe
 v4.4.0
Thread-Index: AQHb91UGK4HVMRfvCk6khr/kyTTzLLQ20PgA
Date: Thu, 17 Jul 2025 21:14:55 +0000
Message-ID: <954162A2-F72C-4EB2-B340-D4B709F2D8EF@arm.com>
References: <20250717195712.2538506-1-a-christidis@ti.com>
 <20250717195712.2538506-2-a-christidis@ti.com>
In-Reply-To: <20250717195712.2538506-2-a-christidis@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7402:EE_|AMS1EPF00000045:EE_|PAVPR08MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 15003548-d7f7-4341-a25a-08ddc5770eac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VjRpN0ZXZjIyaWR5Z1JNQU9sczNRY0FxbFJ5MUd3WW9MbVZ4aTdVelA3elZl?=
 =?utf-8?B?VENsekxMSzdISHlpNDhlRXNFK0tiOXZmRjhTZUM5Q0diL3d1RmZEcmdzUVpD?=
 =?utf-8?B?Nzh0b3V3dHI0NHdJTTV2azJnaWNNZ1BxWkI5SXFoSm5ENkF3MDkyb29ETUZa?=
 =?utf-8?B?dndTWWpxMjMvOVNQcXE2LzIwTmthRGYrMEJ6Nkh6YTdFOHErTEJsTGJmQ1Bm?=
 =?utf-8?B?RjdGdXlqazRnQ1pyQVJLaHNnTytweVlIZUk3NDV6NlJmVGRXSHRXVWRYWTBY?=
 =?utf-8?B?NFU5QVhMMzFramppT1VnUGM3VGIvTVg2OUtRS1NYaGtVMzJudHJDUWMxTDJC?=
 =?utf-8?B?eFZ0RWtwUERCc2JrU1RZeG5lSkEvTmJEamJlSjg2aStkV2dlZ3dMWkRMTzR4?=
 =?utf-8?B?Und3SW9rT3JlbUhzNzN3OEdGMDhTZkNPc1dxY05OcGQ5WXMvelo0ekZCR0Fn?=
 =?utf-8?B?WUV6SHFxODFtWWlGbDI4R2JiSDFwcGlaeGs3eTRjS1BoSzJrY0hxa1ovMWRi?=
 =?utf-8?B?YkcxRTRxRXdHdGhScXVNVzNaNlhqa1ZZVm9JRnd1d3A5TFk0UnQ1WlJ6Qlha?=
 =?utf-8?B?bUM2bWNZRmNnaGFaTEUxR1dQZjZlUk9kTURCeURST3Q5eHhJUGw4RCsyb1o5?=
 =?utf-8?B?ZXczVzB2c1FJYmFaZldCODY3dVJ6OERySGlCbDI1aFlvOUhIRHVLYkNreDhw?=
 =?utf-8?B?TWlYVjlaQkNkbDhkNk9tdzJrWS9RdE1idVFrRHpoUjMxMm16MjRIZmFjYmE5?=
 =?utf-8?B?MlRySWNLeTlsUmhKMjRFZS9YOEZ3OEM0SWhhUzJ5SXgxR1V0Y3ZhNmxIc2pi?=
 =?utf-8?B?U0V6ZTl0d081c2Fjdm5TUlpsYlA1TGQzUUQ3YzJzWHBrdGd3MnY0eW9SRjQw?=
 =?utf-8?B?RUVmS29VbFNHd2x6V00ra2tvY2Z6YVVSbWpBNzBISzBCOWx6aVIrV21DR0t5?=
 =?utf-8?B?UUREOCs1UE52ZHNJNDRCcFZoa0FISndpUU85VEUreFk5VjZwelFQUW9aUkNr?=
 =?utf-8?B?TzdhS0g2TGhaKzNmQ0x1QUpBK256U2pVVTZmTVhrZnZoa0pGSjdYNnRxeitv?=
 =?utf-8?B?Z1I0WldSdk8veXVWSGdKUmFoalc4U2ZhclFsL1BUelFwMzhuYjFoVCtYdnox?=
 =?utf-8?B?cVpLbmF3MjhJcDZvQXZEckdMcVdFcGZPUWFNMHlwVVFkRk9FdmhuUGJ2TTdo?=
 =?utf-8?B?UzR1d2ZVK2FBVUcrMzYzekx6Z09VYmN4YjM5WnNUaVlITjRSUTQ1U2NZWXk5?=
 =?utf-8?B?YnRaSHJKbGlkQ3lpWmVYQU5Ta21Cd3JNVjAvNFdNaG9wQU1VMGFtRVgyQU0y?=
 =?utf-8?B?MDZ6bWE2UGZpalIwT1lNUit6YXJ0RUkzT0R3S1lGc0dYd1pZZi9ISjZBV2JS?=
 =?utf-8?B?ejYrT1BadXRPbG9UK3V3RVdndE1PdklBQjZMaXlVMDJFd05mMXpvNkhUVUdk?=
 =?utf-8?B?bU4vZDZ4TjNvNEwwRlprQzZqVWF6ZnRibVpkWXg5aisvMjNDeTkwMmF1ZnZM?=
 =?utf-8?B?bm1xK0VQUW1DY0NKdWwrTGRNQnczU1BUNUhCM2RlNFpXMERtOGhGdTQ4UmpY?=
 =?utf-8?B?czFaZnJCT0x2bGtqaEFkZ2lkei83VlBiU1pFY01jOFVjYnoveTRPY3ZveVV3?=
 =?utf-8?B?N0VMcWp5Qnp1Tit1bHdUQ3JnaFMxRGl6NnVVOExYcFR2WkdoaUhRMGJmS1Fj?=
 =?utf-8?B?emIxZ1BweFNHMDgrL2doVi91Y1M5OWRUMzljelRaR2xRZzREQllQRGQrcDVl?=
 =?utf-8?B?WmNzK09hVWRvNHAvakV5QmhYallCQmJiaElOWVlWSExFTFROVlZUbis2MTcz?=
 =?utf-8?B?L285V0YrcXMzV0JUYTMyQ0VuZitxeWovczBEaG1sR1IxQ1NDMXFHR2N3UTdS?=
 =?utf-8?B?MVRqUkxvMExsY295NVFNclFXK2p1dE84RWgwSlRwWGdYWFBjTFNEK2NhMGhr?=
 =?utf-8?B?RkM4d2FzRklGYWdJM0RNdVJJKzRVdFNxS3hzSlFSdDJ1ZUhWQnhqUm8vMVFO?=
 =?utf-8?B?WlN0WWlMYktnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <66D37C51511DC74488DBFA513476C144@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c076ce3c-28d8-4d51-cee3-08ddc576fa42
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHJXK3RYT0VvVm9vaVhZWVRzNkxmWXdqM0dIaTY3S1N4ekVFZWRsRmpIM0VF?=
 =?utf-8?B?R2JvTlNodGV4QnBLUW5NbnlBUmdMMWNEdHU4T25ZVEMxajlnKzBqZmxvcjdO?=
 =?utf-8?B?SytDZjB2Umk1aDJIYzd0YWQxdFNWRC9tcGZxWFFmdUd2SGdkTE9KMEdSa3Js?=
 =?utf-8?B?NnczMFVwaHFJam9IMUJoR0dVL01HTWZ5TUtCam51WmFncnFhUmQ0cFNzR3A0?=
 =?utf-8?B?dzMvcDdlUG9WUUNSajI3MVlOb0pDWGlyOTN6OHBvbnVUNW5SbkE3YXBTY1Jt?=
 =?utf-8?B?S1NxNGpEZVJJZW9qeVZRc1JLb2E1dnEyVTQ3ZDhwVFloWmJBMFltT2NCS2Fj?=
 =?utf-8?B?Z0tsY1lHY1pXTFI3a09jamRESnhEQkRoK2VPbk5heEMzQlBNRkJ0K1I3ZzNL?=
 =?utf-8?B?c0NReW5WVko4alNST1p4MTN3c3VneU85OHZ1MlhOVHVscTdoSjVyZXZ6R2Z2?=
 =?utf-8?B?ZnpQaXlxcS9MUW1jMGQyb1pXeXlIaVoyM21BcnRvaW5XbU1SaGdRZWxWV3hK?=
 =?utf-8?B?UDRiRkVvNFlJM2pqT3JNVFNEWTVnYnBDVTlncmNvY1BaclVGWDFvWFFLUzZY?=
 =?utf-8?B?c01hNTNaUUpEOVVKOENBeHRtVUR4VEI4TWNzZFJGK2p2UWovNGF2S0YyMmNO?=
 =?utf-8?B?cUxSMFZIaUFSYU80MEhOYWJtOE1KTGo1YzhPdmRHZmRocW1sVjI2bWd2bi9Y?=
 =?utf-8?B?bmZHNHo0Nm82SzdMSFJSTGFzMFgzR2pKd0ovOWxaSGpZc0VyODZoOFBEakJ0?=
 =?utf-8?B?UEdrS2pkZHB2NDdkM05CRTN3TTYrWGk5Q2taSXFOb2ZKTTNGT01FMkFTNW1o?=
 =?utf-8?B?ZnVTSXBrRU4rSU5uckRYWFNBQzczeFQ3ZE40TFE0V1lMUDZOMnU4L21uVXlP?=
 =?utf-8?B?UXg3c2Z3N2ZSWGErcXJnZjNsK1VIYXZWSjA2R3ZwVUVJUGdacXRKSGozNjFT?=
 =?utf-8?B?VmF0SnJieDFoeHNhdGxvMW1kVkZ1WHlhNlNOaE5xR2ViNE5xUnFGalFMSzVn?=
 =?utf-8?B?czVTV2RHQjBJVWphRkhRMUQ1ZDRHckVWSnRUL2ljZ3FSWk1VZE5hSUg2M3Vu?=
 =?utf-8?B?S1JZanNtSjJqTlptamtvM0hDeWpjNmxVc1RHdEorb0p6ZUNEeDlzZUVBVmFt?=
 =?utf-8?B?azY5VWFwbWdNUm9COTdMSS9GZkhzQ1ZWcG8vL1phcHNJalFvMVBvamVOVDMy?=
 =?utf-8?B?VUVlTk81ZFI2UGQ0RzhENDV2Um9wT1ZqNXZvYVZCdHpOYUVJQ0VUTU1qQkpV?=
 =?utf-8?B?VWY3SEtNeFJ1YWpPTWdhbFRmdEx3NC9ldEdGaENaQXJQekhIdXZrSnlVeTZ4?=
 =?utf-8?B?VklkZ2lmYzdINGl3QnArV3lhQ09HanJKNzFESVFKazZNWEhNc0JKOWVJa1Zy?=
 =?utf-8?B?R0FCV01aUTR3M2NJV3JTaVhzVjVlcUkyVk95WTV2cHVXY1g4ek50TzRaZ0p0?=
 =?utf-8?B?NHN3YkZzRmplUjNFWkhjcWRQREtsVE9seHZ1SDM1YUhGdjFacVI0VWlJWStK?=
 =?utf-8?B?VEh2Mk53L1hCazVYVUw1eE5DNFpuQ0VvMzBTYTUwc0c2eHNZZ3VWcnhxTGE3?=
 =?utf-8?B?Wnp1UDN0SDhidmlhaGx5QVErcFBTZnJRYzB6Y3M0UDhMMVdrbXdSOWpwcGFW?=
 =?utf-8?B?U3RJNldFeHdycEFCQjJ0K3FNdGQzTWxYMVlrck90cXBjWlc5RkxtbGZJQ2FB?=
 =?utf-8?B?cWJXMHF5NmQ3bHBuNEduTVNGQ2YwRysyc3NqUCt1WEFkWExnc21uQm00VVpX?=
 =?utf-8?B?NTZ1VHIzSWlZK3VFMm9KbjJiRTNUN0h5VS9KSnpHZnRQbk5oU1JFRUwrMk1C?=
 =?utf-8?B?amtXNUE0Z1BDN3RLSnBWcm56aHNrZjJobmJRNHN1RzJJTm16QytrMEUzNllS?=
 =?utf-8?B?WjQ3bGwvd20wZEMzSGlqcTI5UUFKYmRnc3JJaWpMS3VLUU04OU42bWN1VzlV?=
 =?utf-8?B?SnJ3aHpOZ0IwM2ZFWHFLL0FFNzEzcUVUdW1ZdlZrbllIb05xdUlNMWwvNlky?=
 =?utf-8?B?TFdwUE5oNXljNFlIVDhWQXAwVkg0c1dlcHE1b2Z0eEMxVmJpdUdNZEpETzBI?=
 =?utf-8?Q?rcsYmg?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 21:15:29.3492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15003548-d7f7-4341-a25a-08ddc5770eac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 21:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118619

T24gMTcgSnVsIDIwMjUsIGF0IDIwOjU3LCBBbnRvbmlvcyBDaHJpc3RpZGlzIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxhLWNocmlzdGlkaXM9dGkuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTL0Fw
YWNoZS0yLjAudHh0O21kNT0wZjljZGEwMGY1MDFiNDk5NWZiMDRiNWE1ZDg5NjA2MCINCj4gK0xJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTL0JTRC0xLUNsYXVzZS50eHQ7bWQ1PTJk
MDI5NzEyNGNmODk3YzNkZDRiYWI3YmQ3OTEyYWRmIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRVMvQlNELTItQ2xhdXNlLnR4dDttZDU9MTY4MmE0Yzk5MTI0Y2JmMWRkYjQw
MTIyNGFjZTNjOWEiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy9CU0Qt
My1DbGF1c2UudHh0O21kNT01ZmVmOTAwNmZjZDBhNjA1OTMyYjcyOTE4ZTdhMmE4ZiINCj4gK0xJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTL0JTTC0xLjAudHh0O21kNT1lNDIyNGNj
YWVjYjE0ZDk0MmM3MWQzMWJlZjIwZDc4YyINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0VTL0NDLUJZLTMuMC50eHQ7bWQ1PThhMmFiNzFlMjkxNGM1NTk4NmMyMjhmMDcxM2Zh
N2MxIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRVMvQ0MtQlktNC4wLnR4
dDttZDU9YmVmOTMyNzAxZjRhYTVmNjI5NWVlN2FiMGYxNzhmYTEiDQo+ICtMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFUy9DQzAtMS4wLnR4dDttZDU9NjNhMjcwNzNhZDBiMjY3M2Nm
OGQ1NWI5ZTZlOTM5NzEiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy9N
SVQudHh0O21kNT0zOGFhNzVjZjRjNGM4N2YwMTgyMjdkNWVjOTYzOGQ3NSINCj4gK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTL1psaWIudHh0O21kNT0yOWNkYjg5NjJmN2M1MGE1
MzcyM2JhMTMyZGQwZjQ4NyINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VT
L0xpY2Vuc2VSZWYtQ2VzaXVtLVRyYWRlbWFyay1UZXJtcy50eHQ7bWQ1PWU3MjZiMDk4ZmE5MWE1
ZDg3MzI5MGRmMjU2Y2VlOWQzIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RVMvTGljZW5zZVJlZi1FVENTTEEudHh0O21kNT0wYzEwYmMyMTQ4YjVjYzM0OWQ5MzFlNzhiMWQ1
ZDJhNyINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTL0xpY2Vuc2VSZWYt
SEktVHJhZGVtYXJrLnR4dDttZDU9ZDk0MTIxOWQwMDAzOTY3ODBmOWM4NTFmMDYyYTliZTciDQo+
ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy9MaWNlbnNlUmVmLUtvZGFrLnR4
dDttZDU9ZDU2MzU2YTQ0ODE3ODliOWEwMzYxYjY4Yjg3ZGY5N2QiDQo+ICtMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFUy9MaWNlbnNlUmVmLVBOR1N1aXRlLnR4dDttZDU9OGQzMWJj
YWFiNGUwY2U4YTFiZTMzNWY0OTMxZWE5NDIiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFUy9MaWNlbnNlUmVmLWZtdC50eHQ7bWQ1PWI5MjU3Nzg1ZmM0ZjM4MDNhNGI3MWI3
NmMxNDEyNzI54oCdDQoNCllvdSBkb27igJl0IG5lZWQgdG8gY2hlY2tzdW0gZXZlcnkgbGljZW5j
ZSB0ZXh0IChlc3BlY2lhbGx5IHN0YW5kYXJkIHRleHRzIGxpa2UgdGhlIEFwYWNoZS0yLjApLCBi
dXQgaW5zdGVhZCB0aGUgZmlsZSB0aGF0IGFjdHVhbGx5IGRlY2xhcmVzIHdoYXQgZmlsZXMgYXJl
IGxpY2Vuc2VkIHdoYXQuIFRoaXMgY291bGQgYmUgYSB0b3AtbGV2ZWwgTElDRU5TRS50eHQsIG9y
IGEgY29tbWVudCBpbiBhIHJlcHJlc2VudGF0aXZlIHNvdXJjZSBmaWxlLg0KDQpJbiB0aGlzIGNh
c2UsIGl0J3MgcHJvYmFibHkgdGhlIHJldXNlLnRvbWwuDQoNClJvc3M=


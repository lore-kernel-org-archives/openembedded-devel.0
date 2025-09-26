Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E97CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:51:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.33])
 by mx.groups.io with SMTP id smtpd.web10.445.1758916266353543925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 12:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dR2UryhL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dR2UryhL;
 spf=pass (domain: arm.com, ip: 52.101.84.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o7p9hWsOgZjHAMMHrSH01sUK1kPauKKLZ2ijkdssi5fBiXrjFasAUYJ7enVxwswIm6OeVIfpAFUXrVuKAKO+lnwtF+KGi9gkMkBODnUG/EnWd9lTXjVgjh2xHWD4D+r7aBLKrZ5TQaMmI5XONdZ2HDfurfvWt4cdd6cu4ZG3UczIEhi/e2EatJDWYZ5Akh0k16znZLQdbonsA8wmUuVfeehtOtZFMZzT7jLMMXmd+kaSgaqjBhy6Gd4DM+wU77U3xZjnmvohej1BfR170v7EL/wZ8BwT/bCV5FXCOUT4rK3+6VxBxWk4VEG6AJlQhIZCPsPXacy7dQfdf2Or+pOfUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuKXOLtHu0KGui+dTycLl5IN8xlJlb7AMmdBiDExj6I=;
 b=iwr9Iw7SNkGbzWh8ohcbZFN7A5r3VIgmi06T1PhONLNuml0e6ozXiH/ToSSU4uQNSRE5nRAwcaQNalHKNFNeB9MBiofglKiIP9hrjmCdw8Wwp1DgtgS9cx3itmc4sT9hMGUGN+OGlziiNY/pbaZgqxFiDilTazCTMIaeoc14VbSBon1JGKc3g5otn+8L9rLba0NDejK0baihWqDTtYlPXrUSdV4VQ3myytniMFtCeXxffDtEgArkDPzBDvx3+mvIUewygqCih9cKDOUZUyLoPPgmL8BuEN0K1PzBhOkR5QJIQKZnW9+mC15wyM17qu7s89yE0q+NT5d5fG9HCAOQHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuKXOLtHu0KGui+dTycLl5IN8xlJlb7AMmdBiDExj6I=;
 b=dR2UryhLbWYR5Mv+YOuWQn1sVOvqAsQTvK6tS/RW8XMbd4g6O59W/AlN9C2tQWCUYCRl1xqqzJ/yjfEkmM6lpebELf8GuAC3c6tDVeSQMP3aSBgMoyNNafsbQdAjVv3lp46Hx3xYgM4pYk6uVDyaGXfB5qmHvVa8OPML2fYvxcE=
Received: from AM4PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:205::30) by
 AS8PR08MB9646.eurprd08.prod.outlook.com (2603:10a6:20b:619::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 19:51:01 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:205:0:cafe::43) by AM4PR05CA0017.outlook.office365.com
 (2603:10a6:205::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.11 via Frontend Transport; Fri,
 26 Sep 2025 19:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Fri, 26 Sep 2025 19:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ety8Q4HapFui3oMvCDKQJkloKLAWjhBYkuSXeFVAhi1Ji7db+awlMmYq57FlA9hGW/EHsvxGG5JJFCj4Qvv9+36No7V9Hy0IAODOBrtnph2ckMCOIZrGLDMVp32nZUK+EEP1ADZAC24b0l7ncJOy/g9rQjUu7KpYcsEpQC1FC0OFLvNYuYHp2fyjIT4FtaujNKHxWe5zUirjaY/SbQVn6EdpV+Wh9fnkaUcCbBNnSvmozNpWBeCwBQzO3WlhJaguiDSLJb14xgEqGoTSkeBHtgpOrl6emLsfL5QwUytH2a/OEpo/+3y7MTqnZpb3CBcHm/Q0STt28G9r6AqZyVnWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuKXOLtHu0KGui+dTycLl5IN8xlJlb7AMmdBiDExj6I=;
 b=lLReWGUzwJeMyI52xXx7D+t0lNftycEYQ6qpv0oBD1cGvNCJ8RugHvl5gdamtwy/jOlsx/2eXuYtXHYMxdYEdRg4QhI7bL/uNtlX5XoxSpGAGdKqBuAgCpnEVPu+IqoxJ5L4FGB3asZvhckfmTN0tbxsLidAqP20U6aUOro3kBCyEClUoLY5W4dmjj/Sy5u9LGviXwUjZe+OabnonrTKgXA/nlS6hDFtb9LKt6WrLAl+waCfoeEauSA6F3EXo7sIo8Olrp/Ze1RPWCwXmEMzS2r5HkMNWrJ5ytNmvMCito+S3PjQ1uTDaYVATUcJumGL1/yVhWGvHtOBkDQa1h4RGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuKXOLtHu0KGui+dTycLl5IN8xlJlb7AMmdBiDExj6I=;
 b=dR2UryhLbWYR5Mv+YOuWQn1sVOvqAsQTvK6tS/RW8XMbd4g6O59W/AlN9C2tQWCUYCRl1xqqzJ/yjfEkmM6lpebELf8GuAC3c6tDVeSQMP3aSBgMoyNNafsbQdAjVv3lp46Hx3xYgM4pYk6uVDyaGXfB5qmHvVa8OPML2fYvxcE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10987.eurprd08.prod.outlook.com (2603:10a6:150:1fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 19:50:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 19:50:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "hongxu.jia@eng.windriver.com"
	<hongxu.jia@eng.windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v4 1/6] python3-frozenlist: support
 reproducibility
Thread-Topic: [oe] [meta-python][PATCH v4 1/6] python3-frozenlist: support
 reproducibility
Thread-Index: AQHcLr5cvKlI4N7J3UW3NkguI9r7pbSls4kAgAAshoA=
Date: Fri, 26 Sep 2025 19:50:23 +0000
Message-ID: <9F7AF82D-E0DC-43C7-9FB1-E81BAB3E24A5@arm.com>
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
 <aa332d23-cdd4-4b05-a0da-6163941bc83f@gmail.com>
In-Reply-To: <aa332d23-cdd4-4b05-a0da-6163941bc83f@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10987:EE_|AM2PEPF0001C70A:EE_|AS8PR08MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: cc88aada-a4f0-4b4d-e24e-08ddfd36043a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M0kxaVdmaDU0TFFkMTV5ajNmNC80STR0MXNSZ3M0NnhSMkNDT1pvdGtjWWxU?=
 =?utf-8?B?bmhtM1FyL0orQi9JdVJtakR2V1laenRKMVlpVjFWVFFGNjdSZWJxYzdBU0NF?=
 =?utf-8?B?VWlYbkVHcGlDaFk2YmptTkd0NzVHN3Yxd3hWb3puQ0hjRGlIN3RyeVdhQitv?=
 =?utf-8?B?Z0RKaksxMllzTkNuRFJNeHFzQVZxeXdHREkwWG9oSTQwQXQzZVA0WHFBK0wy?=
 =?utf-8?B?blFZWXJaNHJCR3k0ZlN6dTRQRktLWlV4RFZhRVBzUGpocVc3a3JzTjBNSDdS?=
 =?utf-8?B?OXVoNm8zNDFCRnNtSGtaNlI2YXhiYWRGajJEb3NXZ1h1MHgvYnIxaG93aTFR?=
 =?utf-8?B?a2w2Snp5dGlxK2szdUJFblA1eEIxYWlYTGx4ZHNIenJ1WUVzNWx3WHo1ZndK?=
 =?utf-8?B?eTVaamMydm0rcHNrazZnUDEzQzEzZEJoTkFqZjUvemt0SW1ncjg3RCtGeWx6?=
 =?utf-8?B?eW51NTFuTzlXZGpzWnI2L3FDZ2ZxcFBWVkpKMnhSdXo4UXk3MzR6OFljVkoy?=
 =?utf-8?B?cWQ3MDMvNG04d3E1RHJNOGFkbmxGV25pVzNqS3pERDg3VnRDdVVtL2VWVklS?=
 =?utf-8?B?QVMrNkI1RHZEMGJqZVRtSEFjQTh1N0FOMUFvTEpwUzhpQzBJbEFtTGhJcFh2?=
 =?utf-8?B?ODFyMFkxYnZXWHdwZzA2K3pWMFhjUjVCN1lxMWFZMU16bCtzdHV0by83TnU4?=
 =?utf-8?B?WFczM0x5WWJlZUY3dkQ1Zm0yRG16UXNPSFZDOWUxM2VicXFTU2xsdmZwd2RC?=
 =?utf-8?B?Nk85NHlWSnYvV0gxWmFZcmdYc3B1YjJ2RThFOUtoU3lIdXgyUG1BT3oxdzNt?=
 =?utf-8?B?NThrVTNBNnpIazY5Sk5ISTB2Ui9YWkZ2dUppSlBDUHkwSW00ZW9hc3FsQTZZ?=
 =?utf-8?B?ZE1jUDN0TTFwQ1NjdVhVaE1wQ3NVR0NMS21pNG5aTlRDZkhPbURmRWhhNDJy?=
 =?utf-8?B?TFJ0RHdkOGlYeGJDZE9qZFdkTEhidTl6TU5jcjZCR0NVenM5WW84ZTVVMVdX?=
 =?utf-8?B?dkl5YlhYVnBMendtL3JuZTcxM2FibjgvVFg2cnJ0a2RQdUFETmg5U29DZG1E?=
 =?utf-8?B?VE0vWUtEY0hHVjVDMURFVWJiaUZDR3Q3SkJUWmRNR2xZTVd5czVsL0w3S29C?=
 =?utf-8?B?TmFjWXdTK2hWT2tRdXRRRWZqaWlUOThoQ1d0WVB2d3pFQVBBdjBQWmlINDRX?=
 =?utf-8?B?UTBkbHBBa1BURU9aekozb2hkb2xGdHZOOHF0Y3JVMk9BK1lFZnUvaFRRRzlT?=
 =?utf-8?B?SWhidXkrQVlGWlFUbmF0L3VDZG1mQlFHOGM0d1dqdTEwNXBjN0Y5Q3l2RHYx?=
 =?utf-8?B?aTF4Z0hUWkVVZnhXRUVvM0g2elltUWp1RzAydkZqajBVZ29KTnRvVWk1ZEYv?=
 =?utf-8?B?R3M3dDlOeWVJdm9Eeit2YWNqWmZqZEpSeHBxWk5ISHpsZHBOckxrbWh3dmU0?=
 =?utf-8?B?SWpPKzNWQW5DQmdxM1Y0b0NmbkhJaUoxSlQzc2JrczY1bmRFdkp6YUp0QTdS?=
 =?utf-8?B?WHAwYnBDbThQZHE2ejhjRFBWaXZ4My85OEF0M0tyS3hTbzEweWw4ZDlqYThX?=
 =?utf-8?B?aEpDNzVYeUxGQ1FrWTUwdmx2U0tiblUreFhWT2lUUVIvM1BzejluZGdmWE5E?=
 =?utf-8?B?Wmg4dUhFTDFhejR3emJaQWptMEx6SG5BWTFkd2l3TG56MU90Sy9EWU9WOXRP?=
 =?utf-8?B?cWdnV0Q2MGYyaHQ5YTVTU0xqY3NnVHVHRnhOOHlTSUt0RS9sbms2NkhxS2J5?=
 =?utf-8?B?TFRGMlpXUjJSMlZMV0s2aENWRVJjN3VkUjk2aHBZNmxxSUhLc0hKdldZejhL?=
 =?utf-8?B?QUtxK1pkTkxRUTJRMUNqN1o4TW5UejJwQk5KUWRWUUdXZ0l5NzBhNEJhT0R0?=
 =?utf-8?B?Y2szMlJkZ2ZsblJ1bC9kdnN6V1JQVXdvMTBlN1BXZFhEVGtETCtDMS9nb3FR?=
 =?utf-8?B?YS9RemFCdXRpR0V0TzRkVDFrdHFsalJpQXo0c0tBUTZ1elhpcm5haTZNam4x?=
 =?utf-8?B?N285Mlk3TTFRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B60F6DCBF1E6DA4E82BA93C8739BA78E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10987
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	722b64a2-b5aa-4030-964b-08ddfd35eebb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|4022899009|14060799003|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YkQ3ZWRUU0RtWEh3Vkx1NmJOVDFlT2NGbG1jb05NUkJmY0RTK2dOVG9oalBk?=
 =?utf-8?B?endFR1VNZXdXM2Fpb2xiVnUvRmMwZ1VNSnY5R0IvVkcxd3BJWEIyYXNCYTdG?=
 =?utf-8?B?YjBObFcwbjFJZHVLTGN5NWtMUWVMZXdIZFNlT0JpcE5EclZIRHZBSDNVQ0E3?=
 =?utf-8?B?VDlVTklBOU5SQU91aXlBS2dCcmF3OEdWM2FGUGhLd0FaTUJKek9sM1piTVc2?=
 =?utf-8?B?Um5XWkVZVXhmUzFJbU1JL2EzR09tVGQyaGxIaFc2RjgvNUJkdjJhcGk1aDF2?=
 =?utf-8?B?aWthRE9uQlFkZ3VLNFNvUndIVXFQOEF1L3N0cm15ZGUzVXR2UWVkZFU5UFdR?=
 =?utf-8?B?eXVrblBHQlgzaUk0cTNjQnB4WWtGOFl6UGtjdXdNMFVRNFprTUtyd05RUVIx?=
 =?utf-8?B?NmI0cE5OajU4TXpCMFdoSy9neW4xUWpHY2poTWdXR0J1YzltV0cwOU5YZUo2?=
 =?utf-8?B?VnVmcDJaTDdVTEpQSk1kTVFFblVyODByZjdiU3JUVGdVODhOUTBDWkhURlNa?=
 =?utf-8?B?ODc2elJ0RStxUHMyN0RFc1VjdHl2eWErNDdWQnV2RXRURDFERWczazcrVmMx?=
 =?utf-8?B?QXVkdEZEZmJtUlFWR1Awa1lHY3Nma3dMU280SGpkeTRxYjM3Y2I3V3l0QjRy?=
 =?utf-8?B?ZVE3SzVPVmJqQ0hrTXNNOGNlOHg5UC9YL29BRHhHWXZuNkhnaDc1Tlg2K1pY?=
 =?utf-8?B?VDd5Q3llWDJCa2tGTGN6TXBtNVMwVGRxSUcxKzlhdzVSbDJBekYrODJ2Rm5n?=
 =?utf-8?B?OXJEK0I2THp1MCtuRkVCMWRTN2dOaTFNdi9hZW9oUGQzck5kU1JLTjdESFhM?=
 =?utf-8?B?SDB1L0xac2ZXNWo4bkd3UlJJVC9BRklKY3pmOW1aVTdkclZlM2dOK0pyKzEw?=
 =?utf-8?B?eFlXWFdxcWlWRVpMMTgrc1NlbC9UM0Fha2wrZTdQTFNMcEQ3ckg5STZBQ2Yy?=
 =?utf-8?B?NXVOUkIzZG5yamsvQWZGMnFCTzY3eGZkWEU2bVNkSFQrZlp5M1FmYVFJMlBH?=
 =?utf-8?B?bGlEcG9OeWtwS3VGYkFORzQ3UTYxUDg3U1lObXR0SmxmbzkyNkFnQXRqaEQ2?=
 =?utf-8?B?d2dCb0t4U25odHpYZUtqNHVSR3JJdm9ScGNjTzRWSk5HUE56a3BmK1NZRVgw?=
 =?utf-8?B?aDRMRXNkb1BvYkR5WFJvd3J2L0JhOWkyUWJCUmw4aHFzU0VRRzBCazNXblcx?=
 =?utf-8?B?R3NERTdBeXdiL3hZejd0UFJ6bDFDSGdoQW9VQ1VPand3U3hyUG1sVWFXK2tM?=
 =?utf-8?B?dFRVbTFIWXBWcjNSc0ZadEJDRFgzOFVWVDFNUkg4Y1lPbWFMTzR2TGtYRTYv?=
 =?utf-8?B?VEpaZE1YM2tPbmdPWUxUcHVOVm1MNFlZTnRGdms3U0Z3UmFxdGl4TDJ4L2Jk?=
 =?utf-8?B?WWVpVWlZb3NpUUVjMXNPREtLck1Lc3RXUXJZZGgzVDc4bGNxVlhtb3hXQkNR?=
 =?utf-8?B?bjkzYk5UYXZsdHdNUjZtRkFpZzJCNiswOFIzYlUxZm1IRHpiVGo4by8xejY5?=
 =?utf-8?B?LzF4OXF6S0Nmc3p0cnphbzgrQTlWMnVrNzNoOXdmbWcySkUrNFNld2lVbnRr?=
 =?utf-8?B?Ky9vSUpjWTV0MXBjbWU1SFdZaXBIbWhsSkNXNkgwemtjYlE3aGZNaGFNR3I0?=
 =?utf-8?B?dHlaQTVFeDZZbnZoZ0NiOVpUV3cwcm84eXhOYm9iMjdmUS9oMWtGMTgyQlRk?=
 =?utf-8?B?SStKVDI4U3hUZ1g3N2srQXVod05vRmdodUlUcnlyOEtIZldNd1FZTTVBb0JT?=
 =?utf-8?B?ZTdGZTZ1bnlGYWdmcmFGbnZaNXZqbXZoSGJMa21vMGs1TTNXeWVMdEN6eXJt?=
 =?utf-8?B?bE10NitFQUp4RmNZZXkweDZmM1Mxd2FyN2ptSzBHaFVHT0tnZk03WnZ0S2NZ?=
 =?utf-8?B?UW5iUGV3YTQxcXVIYktoMFUyektsTmFDVHNwMGdLWmpLbHJCT3V6ejZRbllQ?=
 =?utf-8?B?Y3RsOU5QcCt1Snl5dERVZWxYSEZrczVQazZQMUlYWmpPblAvVjF6S2l6N2V3?=
 =?utf-8?B?Uk0rMG94TFdpYm1lMkxXU2MwODJkRUNSclg3OFZ0eFl3YTdSYlFVWHc4VHJs?=
 =?utf-8?Q?0b4vJl?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(4022899009)(14060799003)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:50:59.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc88aada-a4f0-4b4d-e24e-08ddfd36043a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9646
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 19:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119938

T29oIEkga25ldyBJIHJlbWVtYmVyZWQgdGhlIGZyb3plbmxpc3QgbmFtZSBmcm9tIHNvbWV3aGVy
ZS4NCg0KRldJVywgdGhlcmXigJlzIGFuIHVwc3RyZWFtIHRpY2tldCBmb3IgdGhpcyBpc3N1ZTog
aHR0cHM6Ly9naXRodWIuY29tL2Fpby1saWJzL2Zyb3plbmxpc3QvaXNzdWVzLzU3Ny4gIEFuZCBJ
IGZpbGVkIGh0dHBzOi8vZ2l0aHViLmNvbS9haW8tbGlicy95YXJsL2lzc3Vlcy8xNTUxIHdoaWNo
IGlzIHJlbGF0ZWQuDQoNClJvc3MNCg0KPiBPbiAyNiBTZXAgMjAyNSwgYXQgMTg6MTAsIEtoZW0g
UmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDkvMjYvMjUgMToxOSBB
TSwgaG9uZ3h1IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4gSW4gb3JkZXIg
dG8gbWFrZSB0aGUgZ2VuZXJhdGVkIGxpYnJhcnkgYmUgcmVwcm9kdWNpYmxlLCBidWlsZCB3aGVl
bA0KPj4gaW4gc291cmNlIGRpciBvdGhlciB0aGFuIHRtcCBkaXIgKC90bXAveHh4eHh4KSwgdGhl
biB5b2N0byB0b29sY2hhaW4ncw0KPj4gb3B0aW9uIC1mZGVidWctcHJlZml4LW1hcCBjb3VsZCB3
b3JrIGFzIGV4cGVjdGVkDQo+PiBOb3RlOiBUbyBzdXBwb3J0IHJlcHJvZHVjaWJpbGl0eSwgaXQg
YWxzbyByZXF1aXJlcyBvZS1jb3JlIGNvbW1pdCBbMV0gdG8gYmUgbWVyZ2VkDQo+PiBbMV0gaHR0
cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQvP2lkPTYx
ZDk4ZDEyZWNhMWM3YmRmM2I3Mzg3YTgyMGM4M2QzYjhmYWQ5NjUNCj4+IFNpZ25lZC1vZmYtYnk6
IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4NCj4+IC0tLQ0KPj4gIC4uLi8w
MDAxLWJ1aWxkLXdoZWVsLWluLXBsYWNlLnBhdGNoICAgICAgICAgICB8IDMxICsrKysrKysrKysr
KysrKysrKysNCj4+ICAuLi4vcHl0aG9uL3B5dGhvbjMtZnJvemVubGlzdF8xLjcuMC5iYiAgICAg
ICAgfCAgMyArKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQ0KPj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWZyb3plbmxpc3QvMDAwMS1idWlsZC13aGVlbC1pbi1wbGFjZS5wYXRjaA0KPj4gZGlmZiAt
LWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZnJvemVu
bGlzdC8wMDAxLWJ1aWxkLXdoZWVsLWluLXBsYWNlLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mcm96ZW5saXN0LzAwMDEtYnVpbGQtd2hlZWwtaW4t
cGxhY2UucGF0Y2gNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAw
Li44NGY4MWRhNzc1DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZyb3plbmxpc3QvMDAwMS1idWlsZC13aGVlbC1p
bi1wbGFjZS5wYXRjaA0KPj4gQEAgLTAsMCArMSwzMSBAQA0KPj4gK0Zyb20gNjA2ODQzYWQwNzlk
OWQwZGFjMTE3MjUzM2Q0MmI1YTIzMjdiOTllZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+
ICtGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+DQo+PiArRGF0ZTog
V2VkLCAxNyBTZXAgMjAyNSAxNTo0MTowOSArMDgwMA0KPj4gK1N1YmplY3Q6IFtQQVRDSF0gYnVp
bGQgd2hlZWwgaW4gcGxhY2UNCj4+ICsNCj4+ICtJbiBvcmRlciB0byBtYWtlIHRoZSBnZW5lcmF0
ZWQgbGlicmFyeSBiZSByZXByb2R1Y2libGUsIGJ1aWxkIHdoZWVsDQo+PiAraW4gc291cmNlIGRp
ciBvdGhlciB0aGFuIHRtcCBkaXIgKC90bXAveHh4eHh4KSwgdGhlbiB5b2N0byB0b29sY2hhaW4n
cw0KPj4gK29wdGlvbiAtZmRlYnVnLXByZWZpeC1tYXAgY291bGQgd29yayBhcyBleHBlY3RlZA0K
Pj4gKw0KPj4gK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KPiANCj4gVGhpcyBpcyB3b3J0aCBz
dWJtaXR0aW5nIHVwc3RyZWFtLg0KPiANCj4+ICtTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxo
b25neHUuamlhQHdpbmRyaXZlci5jb20+DQo+PiArLS0tDQo+PiArIHBhY2thZ2luZy9wZXA1MTdf
YmFja2VuZC9fYmFja2VuZC5weSB8IDIgKy0NCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+PiArDQo+PiArZGlmZiAtLWdpdCBhL3BhY2thZ2luZy9w
ZXA1MTdfYmFja2VuZC9fYmFja2VuZC5weSBiL3BhY2thZ2luZy9wZXA1MTdfYmFja2VuZC9fYmFj
a2VuZC5weQ0KPj4gK2luZGV4IDYxY2FkMzQuLmQ1ZDgzOWUgMTAwNjQ0DQo+PiArLS0tIGEvcGFj
a2FnaW5nL3BlcDUxN19iYWNrZW5kL19iYWNrZW5kLnB5DQo+PiArKysrIGIvcGFja2FnaW5nL3Bl
cDUxN19iYWNrZW5kL19iYWNrZW5kLnB5DQo+PiArQEAgLTMxNiw3ICszMTYsNyBAQCBkZWYgYnVp
bGRfd2hlZWwoDQo+PiArICAgICAiIiINCj4+ICsgICAgIHdpdGggbWF5YmVfcHJlYnVpbGRfY19l
eHRlbnNpb25zKA0KPj4gKyAgICAgICAgICAgICBsaW5lX3RyYWNlX2N5dGhvbl93aGVuX3Vuc2V0
PUZhbHNlLA0KPj4gKy0gICAgICAgICAgICBidWlsZF9pbnBsYWNlPUZhbHNlLA0KPj4gKysgICAg
ICAgICAgICBidWlsZF9pbnBsYWNlPVRydWUsDQo+PiArICAgICAgICAgICAgIGNvbmZpZ19zZXR0
aW5ncz1jb25maWdfc2V0dGluZ3MsDQo+PiArICAgICApOg0KPj4gKyAgICAgICAgIHJldHVybiBf
c2V0dXB0b29sc19idWlsZF93aGVlbCgNCj4+ICstLQ0KPj4gKzIuMzQuMQ0KPj4gKw0KPj4gZGlm
ZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZnJv
emVubGlzdF8xLjcuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZnJvemVubGlzdF8xLjcuMC5iYg0KPj4gaW5kZXggN2Q4MTNhMDI2Yy4uZDgzMjQ5NGM4
MiAxMDA2NDQNCj4+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZnJvemVubGlzdF8xLjcuMC5iYg0KPj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1mcm96ZW5saXN0XzEuNy4wLmJiDQo+PiBAQCAtNyw2ICs3
LDkgQEAgU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJlMzEwZDgxOTIzYzI0MzdlYTg2NzA0NjcxMjFj
YzNlOWIwZjc2ZDMwNDNjYzFkMjMzMWQ1NmM3ZmINCj4+ICAgIGluaGVyaXQgcHlwaSBweXRob25f
c2V0dXB0b29sc19idWlsZF9tZXRhIGN5dGhvbg0KPj4gICtTUkNfVVJJICs9ICIgXA0KPj4gKyAg
ICBmaWxlOi8vMDAwMS1idWlsZC13aGVlbC1pbi1wbGFjZS5wYXRjaCBcDQo+PiArIg0KPj4gIERF
UEVORFMgKz0gIiBcDQo+PiAgICAgIHB5dGhvbjMtZXhwYW5kdmFycy1uYXRpdmUgXA0KPj4gICIN
Cj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUg
YWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMx
MTk5MzUpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2
ZWwvbWVzc2FnZS8xMTk5MzUNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbXQvMTE1NDQ1MjYwLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJl
ZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIg
W3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=


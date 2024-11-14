Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52273D6A247
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:01:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.63])
 by mx.groups.io with SMTP id smtpd.web10.6552.1731621674325243219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TIWEGnaG;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TIWEGnaG;
 spf=pass (domain: arm.com, ip: 52.101.70.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=K/AmjT60DdUQTiepgGYRPNjNC6twImlzXlWL4y3eOvv9FaCXP+PdK3E9YK/4izuc0rIhm4slOMtzjjTiHWJkf+mDloBKRqELNa6neJeviBLJjBJz/HIr5hVW+p7Qludnzl0TId4A6QdGU2Nv86wdrhiuIukuGuLFbIGVsd8WD77aZ/KZ+5xoCq3xV0A5V899jnwJFqtHLirLyyjhherFa5zdBvn4YAaM0p8YBzjMCKkyQdIJjbcdl38rCv3Hb3HEzzp+ArVzqaf8jxvM83FPChpeMqfJEcVK/mOZbUtBa5gWEUFaSfB7UWmtUqf3Y4w9306sY7TSRiTvNW6N97fQWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDi3Bk7kZCMSknnpzD8tzb+ga1V4N8vzOp7CvedNdX4=;
 b=NJhFisv+dUDTWQNKuq3C+7tFyLV4FPsWy+TLszwPefUsbpY6yiwzGZEMnOwNezc9sgw8Az1+oBA9vAovV7cBTRl2mZ0oO278Kahi+92LE+jyB1XnIXUNzIrfsG6GCzdiuryYsn6jqAnkiKKayDeHgmV8lsle2hm7F9KBtyqs8blyxGelCW+l//EJgqdhpS3TX1ufq22E1Z475LzfunC6z18MjaYmvo4NXofGfFQUBjjA8Nk0dMiF8CspTlR6KHVoyEkBlcSO3pEAYy8j1kh5rQugSSKCPHc5FIBMiWU3EoxMI8ump0g/lcrdHeic6kKplp+vZjS1vNjD6B2/1KlNoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDi3Bk7kZCMSknnpzD8tzb+ga1V4N8vzOp7CvedNdX4=;
 b=TIWEGnaGbaZV6eM49/H5UZjQtJYUPRYw+op481Hv5PZYB4TQG6wkq1NbgTLXU29zHZE6SX4Gd0p3Dwbj8iBwJ1FXuk62P/9ALcM9dpvJfiOt9X3AZK4Wb4ZjkkhCWZMNkd6jvcGkDfqhOCXwIiBH3tDUE6ioyyyeY4jdxwrASaw=
Received: from AM6P192CA0050.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::27)
 by AS1PR08MB7404.eurprd08.prod.outlook.com (2603:10a6:20b:4c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 22:01:10 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:209:82:cafe::7e) by AM6P192CA0050.outlook.office365.com
 (2603:10a6:209:82::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Thu, 14 Nov 2024 22:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Thu, 14 Nov 2024 22:01:10 +0000
Received: ("Tessian outbound d013e61db77e:v490"); Thu, 14 Nov 2024 22:01:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fde762e00f13477
X-TessianGatewayMetadata: e1KxJv+KNs9VR2yUmg5jk5dRgRuBOmM4VTRvboJX78nlQSiT3u3S14hAXSxcJdWEsqZzOUXooY/EKOdSPMn4buUFjBeCnd1176fslbkMEAwyyMyiR6v0eIIQmKZMp4qo21sxjJ4bA3KJMTkl1ukT/9fPkv4q7H15PWSetCLzJsY=
X-CR-MTA-TID: 64aa7808
Received: from L74831461ef2d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A08884C7-5FAA-452C-9438-4361BAA3DCAD.1;
	Thu, 14 Nov 2024 22:01:03 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L74831461ef2d.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 14 Nov 2024 22:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeLsl36G7jwZK+UND5ueaA3eQH+0x0MVi2QPVrBxxypx2stqo2AfNJWzFXWbfxTWNsPRcFN2ki+XzUs9Te9TXckH0e9f2OysgUtJpW7EcvR/wil5gI0+g++Va6GQXgU8ygod+x+N8X0ZoSwzwYiE+tYgBChR2SuQ35kQ+Yne/4a5w1TH/Awar0Nb5co6lcd7Vl7ChlEBP3xokkYJYd34PZ2cYYJzzSbLbA3rD4QNUPjpVXySWFZzaFS4eJ308y6ubEDrp+8knsDPGLuAh2bl/laPnos2GgR/EtJe/+lFm5NO+8fK8RvSfsVMd/DupMC9ITgpft09uEfky77fIJllwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDi3Bk7kZCMSknnpzD8tzb+ga1V4N8vzOp7CvedNdX4=;
 b=tEMvYP8w5FKDxZRHj6mJjf9g2OiEZ/NRCycWipbsyIE1NFTlOoTO5WP3tZWfT44B/W5yPcJH5E9QDBSxYIX5PLRBf5+/lWK+Cz6bq2gfJMcMgPH1kQTTlNneE9/OGEdcuKIQes1AhjcmfDwFev6JqCsuVceJdF/pFeidXHpMuMUG/Qgo9LdlKm9sq8IFlYS92ZftfpcV+Mfp9kmVVyy45WtIZuRmpGhDvlkqFD1OWrStEAZt6a6WvUfE8vLWJi83n9VUEkvxV8Ylw9YKWisMDEcSZbnhT3n7IdfyEAYDtmG9NnyZO43DkD8XGQft0IpUIe+MrNFmKmh2LfTfgRWJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDi3Bk7kZCMSknnpzD8tzb+ga1V4N8vzOp7CvedNdX4=;
 b=TIWEGnaGbaZV6eM49/H5UZjQtJYUPRYw+op481Hv5PZYB4TQG6wkq1NbgTLXU29zHZE6SX4Gd0p3Dwbj8iBwJ1FXuk62P/9ALcM9dpvJfiOt9X3AZK4Wb4ZjkkhCWZMNkd6jvcGkDfqhOCXwIiBH3tDUE6ioyyyeY4jdxwrASaw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9022.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 22:01:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 22:00:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 01/21] blueman: inherit cython class
Thread-Topic: [oe] [PATCH 01/21] blueman: inherit cython class
Thread-Index: AQHbNuCbjgrpo23/UkW9xQPr+r7BiLK3U5KA
Date: Thu, 14 Nov 2024 22:00:59 +0000
Message-ID: <D577C311-BEB3-4A05-AC53-C15DDF63929F@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9022:EE_|AMS0EPF0000019D:EE_|AS1PR08MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e729c59-de38-42ec-63d9-08dd04f7d90f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eXVxZndJVVlid29RR3p2b1I0U29QV3VWZ0RkM080ZnhwSzJMQk9oUjNvWWNj?=
 =?utf-8?B?UjNGVGhDNytQUlpoYXN6Z093eXNlREl2YjZjUU1GWS9zV3VoZm41N2FwazB1?=
 =?utf-8?B?YUFFbU9iTWhJa0cvUUFGYm1uRVVvU0l5Z0w1em5Tc1ZnQW1jT1hxM0ptS3BK?=
 =?utf-8?B?VXdNZWloQkhRQWZjSTc3eVZGWlYyYXI3Z3hOTlFxSjdTVHdxM3hDQzJBV0V4?=
 =?utf-8?B?MnRCK1U2M1hFMTFVNitROWxWeWtGVWtyOTZ2QTAxaGNWb2pGY2hPeDQ5OFRn?=
 =?utf-8?B?OWw4MkZiQm5WRW01Vmc4Tm9oN1hEa29rRHRYbHVZUzB4eEFWZ1RHalJMN1FQ?=
 =?utf-8?B?WDllRjBVeXZ5eE51dk95N3BhL1J4L3h4aDkxREZ3R1hMSnhjZHlnaDZrU0tx?=
 =?utf-8?B?STBpbWZWaUFNdlpyTmpwaWdrTWdZTVVvVEYzWHJ4WThrMHJBY1g3V05ISEo2?=
 =?utf-8?B?YU9yWkZ1Uy9RaUR4TDBsTGdrV1lLb1YrbXlTdkVqYk92NG5xWUVGZmRkZk0z?=
 =?utf-8?B?Mm42NTFxdWxwZHhlNHc1K3FuVG5IZDNoQml0bzR1a1ZHbUM1R3B5Z3VidlRW?=
 =?utf-8?B?MEhDSVd0UHVaNUU3cGw1ZGpvcFphOUtsWWRGNVdqVjRDa096dldUYzl0Rkh6?=
 =?utf-8?B?UElZcGNvOUlia21NYzh1eWNpQXZybER2aE1vS0JpRTFadU1wR3EzTkQyQWZt?=
 =?utf-8?B?dGlCKzdmU21DQ3hqVDhtUG9iZ0hKM0NDSmNkWHBGeFhLWjRNcVhjWktPTGdE?=
 =?utf-8?B?b3NtakkzRjJrSjJvcWNvZHM0NDE5alYvZ3NTWjhLZitKWHFsZGJoUUpPeGVL?=
 =?utf-8?B?R09rMGVyN0RCMjMrTWZ5WitVUElpRGM0UHpPNDd0bDRXTXArVXExbFM4NjBL?=
 =?utf-8?B?RlZnKzBzRHJmdlUxVHRqTHBNVkF2MmdMM2UzTE00K3FrY3dRMUl3dzRXTHBM?=
 =?utf-8?B?Mklmcm1RbExMNzhmQS8xOUFoMStwL3BrL2ZEN05EYkREK2FjK1lnSmlNckw3?=
 =?utf-8?B?YTQyVk1BVXNLNnc0SjNTbEI4YUZCakc1c2R1RDFpYXh3a1VMcmkyQ2gvNW1D?=
 =?utf-8?B?NER6dWxDelA3NmI2MisyaEFsM01tZSsybzk2Ym5MVEFOb0ZvY0cxbkNHaVI3?=
 =?utf-8?B?Tnk4NDVsbk41cW9iSlBkVVlLaHpRR1BINEV4cVk0TU0rQzdreWZBdEkzakRG?=
 =?utf-8?B?MjJCR1c1Nmw0TnpEZjBYeUJnQ1U0NG9tVzNZTjFDYkc1SmwrTk9hTEhJaU1a?=
 =?utf-8?B?dXFjWlU5YXVXNGNoY1A3SXBPanpnWWN2N1JRZEo1ZTJseVRVMW9oenZqR2Vp?=
 =?utf-8?B?alVQQW44aitDdnMxUDVRL24za3YwRzBRS0x3WEx1OFEydnpWbnhGNmc1T3B1?=
 =?utf-8?B?emFoV2dGdmQ5M0toekVXdDNBblNHcmJISkROSUQ2VW9YbllESzBTY1k4RGlZ?=
 =?utf-8?B?aW1TQ1h0Y01tQ0ZTNGhYY09sUkd4OHBOcnQ5UkFXWVFZQ08vSVJidkovb2lp?=
 =?utf-8?B?cmZ5b2h5eWFjeFNpcnUyQTZUSEFFR2YwbkJFV2RpZHJGWlYxSnJoQjh2ZVU2?=
 =?utf-8?B?NVl6SmZ1cDd2cWR6LzNnNjRSSy9aU3N6ZlYvVFd1b1NyYWgrcDJoelUrcGRH?=
 =?utf-8?B?NzdiVEhXVXJlN1FZSEhldnp3YitHeXQ3bmp5bHZUa0dhcnVJdTZZSXA3b2pr?=
 =?utf-8?B?a25iRmRNRk9qQXpCSzJNdmUwNVY0b1JiM2VaQUJVYU9Ua0x1UFdCMEpxMDZo?=
 =?utf-8?B?ZTRidHFKTmovZFlkTXcyOGpTYUxhNkVkYW1CV2h6RHV4RS96Q2U3N2lrc1Fs?=
 =?utf-8?B?RyttdG1mZGNwN041bnJYYU9FTmpraWJFNlBHb2JJendEODRTZVVtUkdhZmY3?=
 =?utf-8?Q?NRmjRaN/Zg/Yk?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D6CBA0C249C044B62B7F9265239CD7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9022
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f78edffc-f068-46a5-37fb-08dd04f7d2ec
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|36860700013|4022899009|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QU1JSXpCb2Iweis4RmVjZEd6WGp1Q2pZUzV2TXdBRjhyRlFRclF6RllzN1By?=
 =?utf-8?B?YVIxejA4eElXQk1NeFlQRDF5NUFVWGdNWVdPdFRYNE9KUnJpL2JnRlFJRXBQ?=
 =?utf-8?B?dURkaU9wRzlpZHZRTS9UaUhJbll6eGpyY04vaVdmbkdNK1NVdDVSaWRPRVpk?=
 =?utf-8?B?bDBSUTdnWjl0dXQzc3k5MERqaWdCVzJZSDVoZkRpWkdPUlpyZHFta25ZT3ZQ?=
 =?utf-8?B?VlkxMU1UY3J2bHUybVE0cDV3clA5a1ZaVkNnNDJyVUhUK05wREpRSjZObklz?=
 =?utf-8?B?VGZSbUhvTnlXYXlwbHZGbnc1NlVIdG9LYnhYOHRFYUo2WjMyUnkrNHlrVVlr?=
 =?utf-8?B?ZytEL1pYdytSdUhSeE0wY3RCSzlBQ3NaZWFXS2pCYzY3T2lFREtOSmRPb2tm?=
 =?utf-8?B?Q0dvak91a1VmR0RKRXJjNWpHZjdlU0cwVjVkM3loQ1M2NEl3VnZKNkFnRGN5?=
 =?utf-8?B?N1dodmpUWExIUm9MVENoR3pKb3RvVmtZMW9La3ZyNFlWbUh1N3NZSmNtTFoz?=
 =?utf-8?B?dit0U3Blbjl2dHhqMWFUYUpFODRCVGRwRDNxcDBUL1EzOUdmTDk0cFpYYmV4?=
 =?utf-8?B?RUlOY1p2ak9ERFkwWXpPWCtIbEQ2OWtoUDJmU3BMZGMzUFpTVFI4VENaZ0Ro?=
 =?utf-8?B?SWVJcnRHTGRZTHJDRVcyR0hOMEJkRTRkazFkU3B0eDlZU3QweERscW03MEVr?=
 =?utf-8?B?Q1p0SmR6dy9WTjJpZnFIUGh1Tys0QkFiSTJ6RTgyYW9sa3J4VkJKSHp2YlRD?=
 =?utf-8?B?TDF4dVM2ZDNFYjhMZmVmRXI0V041VFlhekdVV3RoVXUzcHo1dExPamNSbDA0?=
 =?utf-8?B?ODBKRkx2OFNmcUIxUWl5SnJBUkZWakZ6MDdqcVlpVjRKeDRIWGI2UkdXM3Rl?=
 =?utf-8?B?YkRkbmNIWHpPR2pkRXFBOTBQVVVIcjdpU0t3WGhIcWMyY3ZJVllkbzgwTXI5?=
 =?utf-8?B?UHlHb1NXbWkzQ0JPTFpkVVhJODBmd1R5eHZ6cWZuWUdRNTB1YnVUb0hZKzVO?=
 =?utf-8?B?clhwUmJJa0tiaCtZVmNzcVRpK0JHQXE4NnJVcyttb3JSbWlEMHkrbXNrdTh0?=
 =?utf-8?B?dnlTcUFmQ3lITTRzNlE3aW1YeE9jelowZlVHTk9VUW1yRDd1UFJ3bVNwdEJG?=
 =?utf-8?B?UjVPUThyL1ArbnBLQjF2ajBJWjc4d0RvbXk1VXZERVNqMEZWTUJEZnNZQmZ5?=
 =?utf-8?B?UXpCdnAxVlVNKzF6dmxYcllvTmJ6UDIrNytGWWlLKzl0S2gzS1dVRUdVMUh2?=
 =?utf-8?B?aytodHA3M1hqdTV2enBpVjlwRzVZZTR3ZzNJQXVNWlljN0FPSys0aW94YUxE?=
 =?utf-8?B?NEIzbVQrcHFNbUYvUHBQdGlOa1NDQkVkUzNyNmZrN2VNaTAxaEpveGdRb3Jv?=
 =?utf-8?B?RXYxNVpqWGkzUWdDckJRR2ZLZ3dBUVBkWkszK1Rzb3g1UkFSQ0JtVlhqRWtG?=
 =?utf-8?B?eW1Rc01hYkN1U0kwaCtVbktrbXBRNW9HODZuUHU3UnpwNzNLd2IyNG9xQldP?=
 =?utf-8?B?VzFVYzdBRGd5bUdsTXRUanppVFk1OG5LTEZmZUViZXNTRE9qRkEvclBYSGho?=
 =?utf-8?B?dkFHVHU1M2N0RVVhSE1iYnErNUZmSDVPN2RnWVg3RGI5ckRDcE84RGNmQ1lZ?=
 =?utf-8?B?L3BkWHlYNVFrR0xhSUw4aTRBUHB2MjB5Tml4dDI4NlZPaWgxUktMU251T3Bk?=
 =?utf-8?B?NnlSRXNudWhNVDRYUVJaWVo3ckZqNXpMU1pyaThCS3o1U3BxNlNlTWF2a1Rn?=
 =?utf-8?B?TDZ4SStSOHkyeFdDV2pNcUh3V2laTEVrU3AwVGFMdlRqaSs2emZzUjhlY09r?=
 =?utf-8?B?d1VkZzU0bXUvb0NDOElTdllEaHRhTUh5ZDBPRjJoWWV3Zm5TM0lPTFp3Ymky?=
 =?utf-8?B?ck9TUmc0dVYzaTFFMFkrREpuajM5OHNvbzl0bkduSGEvT2pIa3BBbTQ4alBK?=
 =?utf-8?Q?1mtmHQNUe5U=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(36860700013)(4022899009)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:01:10.0638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e729c59-de38-42ec-63d9-08dd04f7d90f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7404
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113845

Tm90ZSB0aGF0IHRoaXMgcGF0Y2hib21iIGRlcGVuZHMgb24gIltPRS1jb3JlXSBbUEFUQ0hdIGNs
YXNzZXMtcmVjaXBlL2N5dGhvbjogaGFuZGxlIGJ1aWxkcyB3aXRoIG5vIC5jIHNvdXJjZXPigJ0u
DQoNClJvc3MNCg0KPiBPbiAxNCBOb3YgMjAyNCwgYXQgMjE6NTksIFJvc3MgQnVydG9uIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gVXNlIHRoZSBuZXcgY3l0aG9uIGNsYXNzIHRvIGF2b2lk
IGR1cGxpY2F0ZWQgZml4dXAgY29kZSB0byByZW1vdmUgYnVpbGQNCj4gcGF0aHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gLS0tDQo+
IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlbWFuL2JsdWVtYW5fMi40
LjMuYmIgfCA0ICsrLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmx1ZW1hbi9ibHVlbWFuXzIuNC4zLmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JsdWVtYW4vYmx1ZW1hbl8yLjQuMy5iYg0KPiBpbmRleCBlN2YwOTg3
ZTBmLi45NzRjNTYzMjk5IDEwMDY0NA0KPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmx1ZW1hbi9ibHVlbWFuXzIuNC4zLmJiDQo+ICsrKyBiL21ldGEtbmV0d29y
a2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlbWFuL2JsdWVtYW5fMi40LjMuYmINCj4gQEAg
LTIsOSArMiw5IEBAIERFU0NSSVBUSU9OID0gIkJsdWVtYW4gaXMgYSBHVEsrIEJsdWV0b290aCBN
YW5hZ2VyIg0KPiBMSUNFTlNFID0gIkdQTC0zLjAtb25seSINCj4gTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiDQo+
IA0KPiAtREVQRU5EUyA9ICJndGsrMyBnbGliLTIuMCBibHVlejUgcHl0aG9uMy1weWdvYmplY3Qg
cHl0aG9uMy1jeXRob24tbmF0aXZlIg0KPiArREVQRU5EUyA9ICJndGsrMyBnbGliLTIuMCBibHVl
ejUgcHl0aG9uMy1weWdvYmplY3QiDQo+IA0KPiAtaW5oZXJpdCBtZXNvbiBnZXR0ZXh0IHN5c3Rl
bWQgZ3NldHRpbmdzIHBrZ2NvbmZpZyBweXRob24zbmF0aXZlIGd0ay1pY29uLWNhY2hlIGZlYXR1
cmVzX2NoZWNrIHB5dGhvbjN0YXJnZXRjb25maWcNCj4gK2luaGVyaXQgbWVzb24gZ2V0dGV4dCBz
eXN0ZW1kIGdzZXR0aW5ncyBwa2djb25maWcgcHl0aG9uM25hdGl2ZSBndGstaWNvbi1jYWNoZSBm
ZWF0dXJlc19jaGVjayBweXRob24zdGFyZ2V0Y29uZmlnIGN5dGhvbg0KPiANCj4gUkVRVUlSRURf
RElTVFJPX0ZFQVRVUkVTID0gImdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhIg0KPiANCj4gLS0g
DQo+IDIuMzQuMQ0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzExMzgyNCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExMzgyNA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDk1ODI4NjkvNjg3NTg4OA0KPiBHcm91cCBPd25l
cjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5z
dWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1k
ZXZlbC91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gDQoNCg==


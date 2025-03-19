Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71752C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:23:22 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.22])
 by mx.groups.io with SMTP id smtpd.web11.12215.1742401398743050477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=g6a7/Bw5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=g6a7/Bw5;
 spf=pass (domain: arm.com, ip: 52.101.71.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ejkDSeVa7RuqJ9bew0XcZlNRToYLUq+j31zbXuzmB3/eHgbl6BTESGeH9bp4MGGMRvS/Ry799It9ZuFcmDVyPF3Y6OZkHm+9JFt16mKtvWdNdYpexflGf/NGIZQIHFu9/1Z0GUbFehIv4K3eAbf7aG+DpJyzpj2JGG2SOCnWzf12eXHpxUhOiYv7DrrmBjDjrRVYOJ9VraTNeVR9ZshE9GBtnmqDcoswjLKclhbKHqwdpjPXrkpR4yXgqucghWjwmS+mKd7GsHGyeULzv0EWmftdUejXELqkYz+bWtqBJzjrPi6MwX2TtgtP4BPPbWFOChlyDpRtfm01RYFq7Y7X4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe6bFUmfbyxF40GfjZvSsBwER8RQ51HqyYJED2NGcq0=;
 b=Py6pVVO9zVltuML1sLsd6WsVnStKk2pR8PKfBgmHBVq4dnIXF1h7s0O7sfickohmCr+4+MwtDA3muAc1A2s+HJ9ZTBfjRXIN+wPRGlJUAFNthu4ycVOunSwG4IW0BtfYyt8wEKtU1Qg/sg3S1SzgPV78YYJ1mBIkZmgj00iUIOphavBtxCtBkI0Unl1u/KbcbpMbxu3nyhCqNEStHQgTALMtEvrk35t8iCzTvNbpeuh2dalIP9oOer7EZdM8F8kw3tQ8fWeUkbzcUSPwxiDdHV1WUOh9tkemgE89sGWwMdH4tSMIfZU7qN538/LaI87F+RHtCZiSzn7bhPPMfEx/tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe6bFUmfbyxF40GfjZvSsBwER8RQ51HqyYJED2NGcq0=;
 b=g6a7/Bw5R7skKstqoqLiwRLYyf5CsIYHEU9AbcIuqVk/e3cDkLRGOxiTKv6ZGV7Za/OV8K4zSFfjYuf38i3B06SmTBaK14MCBNDFSL34t1rjG2po7h1kERTGaPx4nZaMofPeYFnlR2PuPJSdevcwrcHl6Lho+2Ccm3y2iyMBOnQ=
Received: from DB8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::39)
 by GV2PR08MB8122.eurprd08.prod.outlook.com (2603:10a6:150:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 16:23:13 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::20) by DB8P191CA0029.outlook.office365.com
 (2603:10a6:10:130::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 19 Mar 2025 16:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via
 Frontend Transport; Wed, 19 Mar 2025 16:23:12 +0000
Received: ("Tessian outbound bd61b317aaf8:v597"); Wed, 19 Mar 2025 16:23:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60c4150c3b1f1981
X-TessianGatewayMetadata: rQXYpjXbEwucp/XYeiWoEgsjGlq4yZLTTyRI8JFOc+3fJE7hzNQBa3uASnL6L43JHAljNTsQP6nkE5vr3wx0kle8JeDVS0lSxbI43yC4uS16YERjWVBoeD8Xmvpuix9HUcUt8P0K/RsiKHdUqcyMJ4rB2EK0X1btiGru4MP/9MM=
X-CR-MTA-TID: 64aa7808
Received: from Ld88e533cc2dc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 61F8EA58-6A82-4867-8B97-66F00C8219C3.1;
	Wed, 19 Mar 2025 16:23:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld88e533cc2dc.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 19 Mar 2025 16:23:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ki1MDphGdVZf7pcOZ4mRyLxpvm7aWJPWNS5t/CF1mDLnTOG3mh31bVI7cxSz+cBMkshnA2h373klKQ7azM3XZErLPq1R1yClT2kVecpUzI5RwYxNGzwgwiAoO+iZOPDUdBsShb+WEOIsxM512AO1gADAStU+zb896BHqgtndNuoNFfxtIim14oXXnVDGixNp+K0oNBZTbXB40kCZNwy8I9t8JWRMyD70o96rWlDEa/ffAQ+TX+Ms4QosxBWE/3SgYSCv6Ur8pKq9s5fiBwtykaB4twlcFVybDXS27+Tkpb38SJSiG7TkhU0FW+nK3LCcxsRId6GjyHIrEKvZKGt+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe6bFUmfbyxF40GfjZvSsBwER8RQ51HqyYJED2NGcq0=;
 b=FCtNEKwLBPxd1wC4tHNV3b13sgsnIS5oRU0itWjaA/Q2VARdtstMS+rzEESiuyyQabd1u0T/kbLRYpIZzJDXuKvv+lluZ/ful92ywn5w1ggvN5RX29H2f7a6n8b8uqwIuPq37/IAQUFtbc1CoAwZoX6DOvf9AxA//OOznm4B4l2KlXVFXxJKU96Zxy3YfstG15mEY71sjA+Llt65Arn8gin3LMwAxxszu83qsOn8BxnNZOaXfwB5JFc8BDz54CBdW/xilqwS87JOjMSwXY/Uif1RQ+4BIV8U4ndAbmkLGqZ8KzPfuJR3oaBUS8c2Wp+qGk/tXpJDVLqH9UtKSBqukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe6bFUmfbyxF40GfjZvSsBwER8RQ51HqyYJED2NGcq0=;
 b=g6a7/Bw5R7skKstqoqLiwRLYyf5CsIYHEU9AbcIuqVk/e3cDkLRGOxiTKv6ZGV7Za/OV8K4zSFfjYuf38i3B06SmTBaK14MCBNDFSL34t1rjG2po7h1kERTGaPx4nZaMofPeYFnlR2PuPJSdevcwrcHl6Lho+2Ccm3y2iyMBOnQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB8800.eurprd08.prod.outlook.com (2603:10a6:102:2fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 16:23:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 16:23:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 5/9] miniupnpd: don't inherit autotools
Thread-Topic: [oe] [PATCH 5/9] miniupnpd: don't inherit autotools
Thread-Index: AQHbmMfIFox8aWsbuEmUQIKF1PDxD7N6pMEA
Date: Wed, 19 Mar 2025 16:23:00 +0000
Message-ID: <E3F126EB-D3D8-476C-9C8A-B06B7FCF13EF@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
 <20250319120836.982987-5-ross.burton@arm.com>
In-Reply-To: <20250319120836.982987-5-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB8800:EE_|DU6PEPF0000A7E4:EE_|GV2PR08MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: c1be37fd-33f3-472b-c88b-08dd67025876
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MHEzWGxPTUdWTVp3MzVSaXJHRFRodHJPVXVqU29VWnNMa2ZqNjdiMnpDeC9q?=
 =?utf-8?B?S3RjZUExd2JHL1hObXc1ckZvVEtSQXROWGNObUVBMXgwejI2Q3phaXZDbU9J?=
 =?utf-8?B?TDlFelRXaGVESmRXRjZPcVg1c1ZiTzFBMkZqWDh4Zkl3b3JZd3dVdHRJcU56?=
 =?utf-8?B?cjJNZCtSMEpjZHcyTDZuWWZwMTdaVkZLYW1pblZIQnQ3Y3dETDhZZWIxZUhH?=
 =?utf-8?B?WDVPMjhKUmhjYnpScWdsQ0IxaHAzYzlPZHhmdUc2REpwUVZDWUwwNzl6NDgx?=
 =?utf-8?B?UXNMQy9VU1Z4SWU4Wng2S0xXSEo3NlpzM3FscHdZeWNZTCtTMzVLZExROGpj?=
 =?utf-8?B?SnBkZVMwY3pJUXkwbE8xZzZEWERmQnNHckd5TEZkbkphWGM0YmNkMFdYSmh0?=
 =?utf-8?B?eXd4V1hoVFE3MzRQWGg3dXRnWDdxOUsxN2xnYitPUUI0K0paYWZtRWF2TGZr?=
 =?utf-8?B?a3cxbVJWcXJZd3A0akhNaWwxZjZva0Y4M0JGRlNlRzB5cGxMZXlFcG9QYXpq?=
 =?utf-8?B?ejlHd3I4THBPYnljd1lDbHczNUh4aFk2SzJJM0lBSkhueXRtbXUyNzJTSk90?=
 =?utf-8?B?RFJvQzJyVTcrcjJvSzFoNG0yejQ2eWVBQzl4c1UyTFRqd1ovYktlWmc0Y2Vh?=
 =?utf-8?B?SGFoNHVPaWlNMlJPa0kvY0VvbGtxUElzeUw1dm1pZysrY3JvS2owanR2UE9z?=
 =?utf-8?B?Zm1SeG53REpBeGsvSktCNGRyOU9ZYUdIWGZPSGI3ZHdIMGh5bXg0TXp4Q3hT?=
 =?utf-8?B?ZlBXb0R1bEg3MFBaUFE0ZElhNHM2amtqUlFGZzVid3dQNXYwOVBhWnJJSEor?=
 =?utf-8?B?dnFWbExrenBqcWk2VTduTVlNZklRSnlKWWxzbTVFcTNPU0E2a1VBYmg1SmFV?=
 =?utf-8?B?VmV2U1BqZkgvdVdwL29vSUZkT0hTNityQlY2MGplbUFZNmhkZkZrU2Z3d053?=
 =?utf-8?B?ZEpnSWtEbDBlVmhYeWovaU1mSjFQYzlhc095YzR1aEpGWnhGWUxHTVdQbCtF?=
 =?utf-8?B?Ym9Vc2tTTCtCeER5Q2d5eWhKdjZnYUgzTkNjQUsxNU94ZCtxN28rZVRrZHJD?=
 =?utf-8?B?YVA3bTF5T2Nock80TWp0WWFuL1UxdkpuVXRkaXB5VlpqYXNkYU5LamlGN1BS?=
 =?utf-8?B?cnRENlFmYVcvUmc0NURnaU5ycVFOR0VEMW5VbzFKUWZnbXFqM2JMTjFTN0ZM?=
 =?utf-8?B?b3BuNDRRM1kySUc4ZUhtTmtyL1J3NStXbUl0bzAvQWVEd1JHUWdocXc0akdG?=
 =?utf-8?B?Q0tOZ3VpSE9pS3dDcW42cWVzVzgyVXcvTkZ1L0dCTDhqYVBqZ2FtbGY4ejMr?=
 =?utf-8?B?M281N3FpNWZ1VWk4bFNIck9FT2VpWVpRS2Q0b1NFenMwbG9vYzNBUkkwVGl5?=
 =?utf-8?B?TlJRSVlodmlZK25WYTl1NVFCUGkvazV6NTJBYnJYU1FiVGsxZTZrbGxOTlA0?=
 =?utf-8?B?Vm5uTXFMY3R6L3dvOHVEMzlEaGtwUDI0OEtlbzlCTVQ2RUJXUzRaTk1TQzB4?=
 =?utf-8?B?N2g4ZU15RkUxTjArZllqVG9NZVZSaDlvZDc2WVlIZGdtai9ta1dncnBDcHE4?=
 =?utf-8?B?YlRONUltQVd5QldRd2FwMFphbmZJK2pnVWtrbE9qMG9HMnBmR1JvYnBWT1ND?=
 =?utf-8?B?WXNCcm0yKzVjelFIN2pTTFhqRm9EVW1mRE83ckpTbjRLQzlNakVIZ1BYUHZn?=
 =?utf-8?B?MjVXa25UZmlOdFN2dDRsMW0xZWpMTW1LbjJja3RVRHhpekZZMUp2ZzFHdG51?=
 =?utf-8?B?eTRnQjVOVEIzdzBpV3gxWlYzUVdiYnFBY0xhZU9NWUhEMklJcFkxZzhHb1Zk?=
 =?utf-8?B?dnBJWDhPUnAxOEpXTzYzQWRzN2xicWZWNW9xNXJKK1ZvbU1KalBCeHlrbE9m?=
 =?utf-8?B?anBzS2ZYWkpnWFkwUktPOUNuTFluTnlCN2JHMGZzT3Roenc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6083866F77818148AB589872F1797DDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8800
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	91fbfa78-c526-4377-7a0d-08dd67025172
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|4022899009|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnpIU1QwZWFmM1lJMWM3K2RQbXFnRUJRZndsckNnWCtDNjNVVlRlSVJkVVB6?=
 =?utf-8?B?cFJSR0NCS2hyclpDTXNoaksrVFk0SlhkK1oxNnFIMU81Ym1MT2huZHpqemhO?=
 =?utf-8?B?M0YwRTVRQnFoZzlXUFZqbzUwbldhMFNvYzJjMHRVakNoV3VieDdCamNqbE5O?=
 =?utf-8?B?eTRSV0lJb1hnODAxZHQxM1U2TXVlcU9TVGVQdTRrY2ZrbVVaREdra0JzdEV3?=
 =?utf-8?B?WTdYeUNtWHAzcmU4Qmxqc0VsejBpQ0tzallLLzNiTnZad0JQWUY0emMxVWFY?=
 =?utf-8?B?WDZ3V0k4TEJjRHYvODR2U29pRGZaYjlRV09uVmpuaUlSMmtCNzdpNmZzYXdF?=
 =?utf-8?B?ZjZPamdKUTk1Mk1nTm8zUUErcVBMOUZxdEVOZ2dnS3AvT2tETkp3blhjdlFo?=
 =?utf-8?B?aE1MaFYvOVFSN0FGSnVrZkM5cnY4Wk5OdjJGT3I2VVhkZ2RaOFVhTE9nSzNj?=
 =?utf-8?B?bTcwZ3dLZi9lemgwU0I5OWxLZW5hQ3ZGU3BxMVkybWpZYk5UcXRZSjlzQytZ?=
 =?utf-8?B?Q3QrdUtFTDBhd0QwWEwwbEpWQnZkY0k4TDhEQmcyOWRGd3JjUXBQeUtGYzYz?=
 =?utf-8?B?Rlp3TnJlaitDT1ZkTExKc296MTdZUVVyRmZkZnFSLzJmdC92SStNblhXU0pK?=
 =?utf-8?B?ZXNjL3VGc0JtOE5CRXhSYzBZNHVBNExvdkhHOGpWSzIxd1JrbHkvcndBaWZl?=
 =?utf-8?B?SXUxSSsveU1NNlVlY1R2NmNaL1laQnI2aEc0ZHZNQmRTYUgrd3ZZa21JeTRu?=
 =?utf-8?B?NnIweTM2QXZ4bU94di9TdW9jQ0lEYmQ5ZU9jQ2xicDhWcGFLZ2IxMjhGMVlR?=
 =?utf-8?B?NE5JaTZ6WlE4OCswUDhtV2VzNWp3MTRvdzRva3lxSXRWRllUKzRkV25sYUU4?=
 =?utf-8?B?VmZkWFFpSEhCTFAyck1WZDJ2am5kMzZGOVFtckFOaGFlRUpvZ1lZYlh5cFB0?=
 =?utf-8?B?YTVqY3liaXZMV2hYRy9URGlveHE1OEREVTl3N2lKRVVvS1BNMlVZSHhHVHVF?=
 =?utf-8?B?eUd5SGZmblE5TVJTcnIvZU9zZkhJVWg3YnU1MUF5bmxMWGZmWVVhUHhuQjN4?=
 =?utf-8?B?MUg4VWFNSlBqazBnMHhQdzZtb3g1VTNoUnJOMDJYS3lZaTBEazBUSE1MTWRN?=
 =?utf-8?B?U3hQd2Fpb0xueTIrUjlWaGxZMGNhd3hOM3JJeVljTWlscVZXQkl6ejJCbFAy?=
 =?utf-8?B?RjVadUZHWlJKTURFRGo0eUFrbVlIcjNZd3lOZkpRN296ZE9aV2pKZWI0RWw0?=
 =?utf-8?B?blYyOUtVNWxGMEUyaGZQOWpvNzNrWGk4blluNkNFaHZicjV5RWNHRldDZEZ5?=
 =?utf-8?B?eEt5NVVaNlZSL1JYSDBnMmVCMXJ5SU1CcVN3SHNXREF1RjF0L3FweVkzRXl4?=
 =?utf-8?B?R1FLc0haM253WStOWVo1aDhlSzRHSFlxTWdmRm8weDJRaFhiNEpibCtZTzV0?=
 =?utf-8?B?VXpiWVgwcTFaNmN1MXFmVTVubTFWSnVscllvbHpCbTRhT3Vna094RlVtL01Y?=
 =?utf-8?B?bWtoU243UEVScG9iTDBmY0h2dEQ0N1F2dlI0RXZnNDF6QXVRVGlvOXJwd0d3?=
 =?utf-8?B?cHJzeTJzdXdvRnQ1Um5iZEVLblhsem9zWjZXeEM0YkpQc2x6MlN3blhMcXJF?=
 =?utf-8?B?eFJaWTFCWDZlTWRXT1MxSnhEY3lPVW91WFlYak1Cd2o0TEtYd0wyeWN5NWRs?=
 =?utf-8?B?N3E4cE5uOEFpeThRcllOd1pVOEJzOTlidnVTTGt4Z1NmWll4NHZYU3M5a0Ra?=
 =?utf-8?B?dHdkWk5rWVdOS3IyM1JwREdaOVRIWjFuK1AyckxIbVNJY2lQbFNzVjJsY1VM?=
 =?utf-8?B?ZWZndWYwam8yQ2kzVk9vSDZKTDFRR1dldExJRXdqYyt5LzJ3a3hqRXJqTGNX?=
 =?utf-8?B?YnNTUjdHdjRNNzBoMmVBaTJWWVp5TStlYVRpSDdUQitKQVhQcWM4ZXhjNUJy?=
 =?utf-8?Q?31dbvx4bl0hR8l/gfTUnqnYOJagavpQh?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(4022899009)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 16:23:12.8253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1be37fd-33f3-472b-c88b-08dd67025876
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 16:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116079

UmV0cmFjdGluZyB0aGlzIG9uZSwgSSBicm9rZSBpdC4gIEnigJlsbCByZXNlbmQgaXQgc2hvcnRs
eS4NCg0KUm9zcw0KDQo+IE9uIDE5IE1hciAyMDI1LCBhdCAxMjowOCwgUm9zcyBCdXJ0b24gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBUaGlzIHVwc3RyZWFtIGRvZXMgbm90IGluIGZhY3Qg
dXNlIGF1dG90b29scw0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGFybS5jb20+DQo+IC0tLQ0KPiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkvbWluaXVwbnBk
L21pbml1cG5wZF8yLjEuMjAxOTEwMDYuYmIgfCA1ICsrLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L21pbml1cG5wZC9taW5pdXBucGRfMi4xLjIw
MTkxMDA2LmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L21pbml1cG5w
ZC9taW5pdXBucGRfMi4xLjIwMTkxMDA2LmJiDQo+IGluZGV4IDFjMmYwMzBmODMuLjVjMDA4NmY4
ZjQgMTAwNjQ0DQo+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9t
aW5pdXBucGQvbWluaXVwbnBkXzIuMS4yMDE5MTAwNi5iYg0KPiArKysgYi9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbWluaXVwbnBkL21pbml1cG5wZF8yLjEuMjAxOTEwMDYu
YmINCj4gQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04gPSAibmV0d29ya2luZyINCj4gTElDRU5TRSA9
ICJCU0QtMy1DbGF1c2UiDQo+IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PWExZWQxNTg0M2NlNjY2MzliY2Y5ZjEwOWNmMjQ3ODcwIg0KPiANCj4gLWluaGVyaXQgYXV0b3Rv
b2xzIGdldHRleHQgcGtnY29uZmlnIHN5c3RlbWQNCj4gK2luaGVyaXQgZ2V0dGV4dCBwa2djb25m
aWcgc3lzdGVtZA0KPiANCj4gREVQRU5EUyArPSAiaXB0YWJsZXMgbmV0LXRvb2xzIHV0aWwtbGlu
dXggbGlibW5sIGxpYm5ldGZpbHRlci1jb25udHJhY2siDQo+IA0KPiBAQCAtMjAsMTIgKzIwLDEx
IEBAIFNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMThmYWQ3YWYzMWYzYzIyZmI0YzlkYjI4YTU1YTJh
OGI1MDY3ZDQxZjViMzhmNTIwMDhhMDU3YTAwDQo+IA0KPiBJUFY2ID0gIiR7QGJiLnV0aWxzLmNv
bnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsICctLWlwdjYnLCAnJywgZCl9Ig0KPiAN
Cj4gLWRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgew0KPiArZG9fY29uZmlndXJlKCkgew0KPiAgICBl
Y2hvICIke0BkLmdldFZhcignRElTVFJPX1ZFUlNJT04nKX0iID4gJHtTfS9vcy5vcGVuZW1iZWRk
ZWQNCj4gfQ0KPiANCj4gZG9fY29tcGlsZSgpIHsNCj4gLSAgICBjZCAke1N9DQo+ICAgICBDT05G
SUdfT1BUSU9OUz0iJHtJUFY2fSAtLWxlYXNlZmlsZSAtLXZlbmRvcmNmZyIgb2VfcnVubWFrZSAt
ZiBNYWtlZmlsZS5saW51eCBjb25maWcuaA0KPiAgICAgQ09ORklHX09QVElPTlM9IiR7SVBWNn0g
LS1sZWFzZWZpbGUgLS12ZW5kb3JjZmciIG9lX3J1bm1ha2UgLWYgTWFrZWZpbGUubGludXgNCj4g
fQ0KPiAtLSANCj4gMi40My4wDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZp
ZXcvUmVwbHkgT25saW5lICgjMTE2MDcyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE2MDcyDQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMTc4NzQ2NS82ODc1ODg4DQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWRldmVsL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiANCg0K


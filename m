Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3CAC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:21:08 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web11.10601.1722871257581424271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=feGRNtMa;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=feGRNtMa;
 spf=pass (domain: arm.com, ip: 40.107.21.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kdB0zwcpTxl3LJDwwgmmLWyWPStImbIXauUuGHLgr5h9yJJLhAYo08yiEiRBOw+siCEEyb3LkemL8yGUszgP53cBQ8wGt2YLTdQxIutlMdba+FJkw/eXaAzON3dJ/Q014wHo/BiC73Oh2IWu7hb1apyD9F7wggY6fPCVt0OzoYTBPmEigLPl5injBFchZe+U/pRahjGB6hKVVL9JC/zfTJWVLSiKJ859K9ZAH7FYFUlTeWjVpB/kW/SsJHiKDU2NnBXBPM5GivA8g+kHuCceUVJFzT1x5S0yHLCQOXr8UfXuSzWVNGX/T65Rul6Ez4Er11c0rfHuKURycBo6xHW1iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDDMohd9pfgTRX7wTZgYhLre/etbYAIVq/5lU+X6HKk=;
 b=FIXj+v88DEwY8d2dp2Bd+ULkx92EbkfJ+aZfv8RQzZoN+NTxL/vOApbf2h0/UC9LTGeJmGiR0vsxsoGXQY3E/pXemdXF2w1aK3ooQXYsFlNaUlgwIlVJNzCqslwatmCbCTFJ0NgxTqt3rDxmFs6Nyl6wStxip/fWr+aNLo6zGDs4fPKTZOZ78OrORAsd7jplYatkTTiEs4qW/3Q+0X+cI7I1UwOJvgb7oSggDCnkdqNouxCZx0p8hyKWPZwnLyWyIyly4me8cNSO/vSi7Xb56aaAROnRRFMccabYbmlxK5bC5BGCo7hGlc8si75r/V25D/ZBtj7Nyypm9ACgdBffkg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDDMohd9pfgTRX7wTZgYhLre/etbYAIVq/5lU+X6HKk=;
 b=feGRNtMa02MSFXxapUqeozPWTKyFG1RBR5UYc2ok5hASHNDh1np5yF8iufXuCGidi+gNHxgBmbwnMRAGAkOQqXeo/s6XtmhbDdk7A/uGxbkXNGcg57InJUWxJsCpDzqWoJClx6885QVuElPrDA+G4gA2pl+wItD3PLHEdSfXHZo=
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by DB9PR08MB7793.eurprd08.prod.outlook.com (2603:10a6:10:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 15:20:53 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::17) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Mon, 5 Aug 2024 15:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Mon, 5 Aug 2024 15:20:52 +0000
Received: ("Tessian outbound 6ceac6be275b:v365"); Mon, 05 Aug 2024 15:20:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb088790e99a45cb
X-CR-MTA-TID: 64aa7808
Received: from Lc35164217639.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6B03F472-0A07-4962-A28A-F4098436222D.1;
	Mon, 05 Aug 2024 15:20:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc35164217639.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Aug 2024 15:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kj9U1Nr4S2Kp2bWx+/I+i/wqay4sPIp0nc31ItI7qaCvJK4cCE9P9UcWLam0MFGB1yvGnURwmtPiQKXDcrARUcCqoeynTLqPPSk5KiBllxZdPXV4xGTbTHO1FuTav7rx5Bih78xKo0dwBqPdC7u8yhVecnVcq2R1FPyPOUUHh+70SCsCorbEIKZS81Wm3Sz0x9hfoFxr71dPBlFW5Q5RwJJ0lWP3vR8b8X5WmeI5PAoy2gYEgIM4uqgeMjx0Y5S6x6OnZBjfbQzNYMxr752gRxhmM15/upJnmIUsVjTCyxuYsoNndFMrTV9ZBGKbr89JTZrFeoiaBuPAzxbu8f1ScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDDMohd9pfgTRX7wTZgYhLre/etbYAIVq/5lU+X6HKk=;
 b=SMbB4dmIYbx0eRCl+QeDKz0I2zCsXtM4L5DJTBO2cmJaLlGSSv9C9MwYYNSU2g7d/1uS5mXeEeR+eYn9lTXMgDLu+9/Ms0G8ooqwLxeUNCzRhD0leduljt6kmie9p7LsTFE+hYgp4FY92/1fN5US9m8u2rxQ1PWWMHL/DMo5CrYlY8ESvrBCQD2Uj2WjzEXH+E5bLXUBcslpB5arp8YuSvZx5FQmJOMTWeSp0gCk7lBNxtLVuWM+5tMg6HEPq4CXY3zIPLdFH+v5h42AYUGU8Y+l0nXRtTvdcdXc1vujnBuFd/yJ0v3qGbcvRF367bqPecgHCDEFrUuvbY+Ix4KfrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDDMohd9pfgTRX7wTZgYhLre/etbYAIVq/5lU+X6HKk=;
 b=feGRNtMa02MSFXxapUqeozPWTKyFG1RBR5UYc2ok5hASHNDh1np5yF8iufXuCGidi+gNHxgBmbwnMRAGAkOQqXeo/s6XtmhbDdk7A/uGxbkXNGcg57InJUWxJsCpDzqWoJClx6885QVuElPrDA+G4gA2pl+wItD3PLHEdSfXHZo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8364.eurprd08.prod.outlook.com (2603:10a6:20b:547::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 15:20:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 15:20:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mr.scada@gmail.com" <mr.scada@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] postgresql: Break perl RDEPENDS
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] postgresql: Break perl RDEPENDS
Thread-Index: AQHa4sDygcLoaD703EWYnyKuAWch7bIY0IYA
Date: Mon, 5 Aug 2024 15:20:44 +0000
Message-ID: <3A5FE38C-91A9-44E0-9D27-3F6D229B26C0@arm.com>
References: <20240730203342.5123-1-mr.scada@gmail.com>
In-Reply-To: <20240730203342.5123-1-mr.scada@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8364:EE_|DB3PEPF00008859:EE_|DB9PR08MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 564ca1b2-f131-4316-1941-08dcb56231ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bkZrQ3NTZjRteTlsdVZLVjh1RnVOSFJ4ZlUra0YyNEFXNGY1SE9Sd1VBbHRq?=
 =?utf-8?B?d1dreGVQaWNINklMVUI5VWV2cnVHaUg4R1ZrU0ZMNkIwZndGOHVhdFBTQU44?=
 =?utf-8?B?ajdMb3ZiaEE5dWJwdUt1enVUdDRIbHZ6UCtscEQ2enVSTnJyaW9TcVltZllk?=
 =?utf-8?B?Vzc4Vk0zM1hmRWJCQXpDYWpXaWdjOUlVZ0QzbURaTEpsTFRvc21penl0K2lM?=
 =?utf-8?B?WUoxSGJTZ2FqQWVQSE1EdXZ4bnhZNFdybW1BS0RyNUVOcm9Qc1NOMTRvalBj?=
 =?utf-8?B?SS9aRmZ6OGh6TGlWUHJ4a1R4MC9YTU1zRzZnZ253NjRBYVdWRjdHY0kvN3Ja?=
 =?utf-8?B?Y1ErT0ZSQjRJMUZlMTNXWVRlYnFaQXVSS3RzTS9NOFA3NDhBZVRoc3ZZbkNH?=
 =?utf-8?B?M3RwemRqeDAweVp4b2czLzIveUdEMnF5TU9hVmtJQ2VDdXV1ZGVnYnUrZzhu?=
 =?utf-8?B?WlRBK3lZS0haQXkvNG9ZcFRvbDBUMEZwSjVjUWNFd2ZVWmJsMUJhKzZEZ0hH?=
 =?utf-8?B?WDR1WUN4clZlOFg0V1h0YjlHZzNNUjRLUzJaYjIwZVFVRUxlM0N3ajJMN2Ns?=
 =?utf-8?B?K1RYU2wxdmhjWExXYWJHazVjN3R1UEg4SWRMaTZFUWxKSlFSOGxPcG1pdDNl?=
 =?utf-8?B?UEdtdllVM3ZoSGo3MHRTeE5xUU4yY0lsajZadzJLMFlQR0R4aFBXUFE0NlV2?=
 =?utf-8?B?UkJYMDV5eUt1NHBPS3lXS1dXdHBxZHEyYS91aDFlcGZ1QmdvS3BtcWRuZEhO?=
 =?utf-8?B?ZlVQZnV2ZkpTdGtLUmQzcWN3Wit0SXFNZ2ZnUHZkaXNFTEhmRy9wcGgrZHZL?=
 =?utf-8?B?eFdJeFhiV2cvOWoxMFk2VHZISFBML1IvbjlPc1RLVDVoV1h6dGs4dkVoV25W?=
 =?utf-8?B?SnEyamNLcU1IRERHbDViTERDVkdVbmlWQ0F6aVkvQitiMnBGbDlhN0Z4cmUw?=
 =?utf-8?B?cHRmbEpOQk9TMDJGSEdtTnZBWitkVld5RXZUdzNIalRpSnFqaGkxWDQyL2ZI?=
 =?utf-8?B?RmZMbmh4QUFOOHhQcWJJeFMzSjBlUEJWVCs1ZHVKTm9udDZzdThPQ05pWnAx?=
 =?utf-8?B?WFdQTUFBR05pdDQxTndvVFFUZDlUUUZDZkdGMStlTy9QUENuZGRXQ2pmeW50?=
 =?utf-8?B?Z3JxTEZsLzVEc3dlUzJGRkJJVFBzQU5UN1lJZkFuMlJzSXBPcDA5NTN2UjNQ?=
 =?utf-8?B?RUxFbktNeHVIR0wyQ1JrWlE1SnJmcTVHQjFUd2VEdFR1eGttYW15WC9CRjF5?=
 =?utf-8?B?a0Q4MTd5bkI1d1RScExPNk9DVEh0cmVqOVc5ck10MGpSN2NpWWlVRWZGMURH?=
 =?utf-8?B?eDJRZzA0TDdKcGxyVjIrbXJQZjNKREF2STAwWE1WYU4xdTNWN1pseHJoclB4?=
 =?utf-8?B?bk1oUVMxdXQxMDNmb1R6U00zQXhvT2t1YWFGS1NwQkhqczRRZGFRK1crVTRS?=
 =?utf-8?B?MFo3NU1VTjJIUlJyWUtoU0g5TjFvcUlPR2tCK1JHczhwelgyYXVjTFQzb2JU?=
 =?utf-8?B?MFpRNmVCcDVnR3Z2NHNHdnU2WW1McUhQaHdQTkZDRFJBTUdHeVlId2tjdkty?=
 =?utf-8?B?QzFpd2wwTDNlQ3VvSVRZL0drUWhnbUorZ2NKaHVDaUhKUDVQdjN0Qyt4STlP?=
 =?utf-8?B?c0N6eVhBR3JNK1VxUDFDT3BQTFhSZHp1dmlmWXRpanhMenE3VmNoa3BCK0o5?=
 =?utf-8?B?L3dWdDJxZGxUeWZ4WTNoNllpL3U3VVgzTTdDUFRGRXZ0ZFRQQVdtUnpvUlBO?=
 =?utf-8?B?dlQvSUVuaG9KY0VjazBzNjdkNzF6anZ3bm9PNTRQL2N6T29TTnYzWU5jOTVE?=
 =?utf-8?B?SmxXNTMyT0F5WTJxc2kvZVQ4Wkgrbnprb3VSYWNmRW9SY3NoVW1sbUYyNGNv?=
 =?utf-8?B?Qlk3N1QzTDlJMlZxS245TkRqSXpsNVprcTNGMHpGVE1JSkE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BA63D1CE0D9B643B7F5ADCCB68E8733@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8364
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4d08d0bd-d907-458e-5425-08dcb5622d2c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmJzN3FzejZIamZUcXV2bVVrcHFiRHZZKzA2bUphbnBBZUZMbThLU0hlMVp1?=
 =?utf-8?B?eGVWVHlTUm96SWR2S1Uzb0ZtaDFjdktHdDVLYnA2a1dnUytiMTZsZHluS2xn?=
 =?utf-8?B?ODkzTDdkTzBhVlhxZGI4bmFHT3FsSlhHUytJK2NRcjdRWEZrVG9ybmN4ZGRy?=
 =?utf-8?B?WXV1SGlCK2Nxc0RjVk50enlSL2hCZ3drb2JQVkc0ajQ0L3FzUGZzZ0EzRk9T?=
 =?utf-8?B?TUFVd0lmU1lzQU9JTjNYMk4ySmdxSFo1c0Z3WE1sd3NFcFJ4KzViVEZvT2ZV?=
 =?utf-8?B?ZHJRZHYwMVZCcXJqaXZUL1YzZUdiTjlweGpwRU5yZG80WHZKOHFVOFNmOHd6?=
 =?utf-8?B?Q2s4V2RhL09sb2NXTHRGcnFPa2ZJdTBwaHVJbE9sRXBVQ3g4WXQ3Wld0UmJj?=
 =?utf-8?B?Y0VoRUhlWFh2MDZOZmc3am4wUlk0KzJRWTVNcTVZUTl6Vm5oZDRVMHgxZ0ZP?=
 =?utf-8?B?bFJER2ZxeHVhQmNXb0phbjNzVDZoSXlpK0hacnZOLzBGTVhua3ZFRzFvakdR?=
 =?utf-8?B?QW9JZWNRV1JnbjVjZG1OWjVacEJBcGhEb1U5NVozK0NVY2JYOUhZNlpIOGNy?=
 =?utf-8?B?RlhXbUg2aHFXckl1bzZCMmpJNXRrZG9RRUxQditvWVN0SnVHUXJ3SXdkSTVP?=
 =?utf-8?B?eCtoYSthaWVxa3NuMUxQUlVSN1dCSUVITUU3R1dDTzg2cVlzRVkrNzkwdmdX?=
 =?utf-8?B?NVpiY05vRVNpMXc2a0huVG12bDh6Z0FRdjhyOVlEVDdDKzdnSk9LeldPc2Jm?=
 =?utf-8?B?L2xUSkVSQkphUytNR29PWm9iVkpYTDhGbW04U3k4VEpHRkpMQ01RVlo1NWFn?=
 =?utf-8?B?N3E3dWhhejFWRGZxRWdiL1lvMDVZbDVVVGpmMk9ncDJjc2wxTDk3OHMyVjMv?=
 =?utf-8?B?QjUvSGF6c2dsVURaRVVIRXBmZngrVnFPSVZtZDVMMmpEZkpGQ2hDc2hkNStU?=
 =?utf-8?B?VFRPR0tPNXNBb2t1cUlOWHp4dWZ3QTAybzJiSC9DSTJpUk5HYUVwWXNlU2lE?=
 =?utf-8?B?aUQ2R295R3A4akpYbGRTc2FHcm9lL25nS2h6RHFxTGNnMjlKWWE1ZHZpcGtR?=
 =?utf-8?B?WEIwRGFvYXcxSFBRdVR4RU9DMU9DZGtmdG5SMDEySE40Ky9ta2R3QWF4bGt1?=
 =?utf-8?B?dWlTUTVSOUFDT2QxcVB1UEo3VXE5UThtdndSY3o5WWJMcFZVN0x3QkNJQlU5?=
 =?utf-8?B?MHZnTUpJZ0JEVlpWVllwa0lVZFNKUEhRTHVhTmNYdzgxY0FRT1R1T3E1UTgw?=
 =?utf-8?B?a3VzQndhbzdwa0Q4Vi9OM3VYblJMcFJ4cXRDcERVTnZOTkN6THRtWkZQcS9q?=
 =?utf-8?B?Um8zaU5xQ3IzdXBYYlRpMWhHaDZEcml4QXVXTnBJUnBvMTlEcGJ6T2NZenI2?=
 =?utf-8?B?aGgwOFM0anYyOHNFZVduMmNlMUJLaktKS2I2Slp4Q2RNQ1gwY0k2VXR5VExn?=
 =?utf-8?B?d3pVMUxrMnVGM1IxT2dTYjFseThnb1RQUXBoejZVbloyTG5EcDc1K1MzMkMv?=
 =?utf-8?B?cTFBTXQwemlzYzFrYk83MlUvbWEzTzMxdDl4WlRyL09nQ2FOL1dzQUlVbkY1?=
 =?utf-8?B?SzZTaWl5eXZvVEkrbEwydkRoRi9yODBSTTNqckFjMFlJSGh5MDBOR0svQ05O?=
 =?utf-8?B?QkJWM1JjcVMrcjdBVVkvd2dyZkJHblMyNmpnR0c2a3ZzOGlRQ1hxRnJDbHVs?=
 =?utf-8?B?UE1yU25GN1ZBY2x2RG5SRTZBWTlmcTVVK1BDa0djUWtJa3hFMlA0aDh0RWNB?=
 =?utf-8?B?clh0d1lYTXBMaWhaQjlzTVBzQlhLTGhPSUZQbm9kYXROalgvWEREcWsxVkNP?=
 =?utf-8?B?aU9XYXhTU1JtNWpBczltK3FkVW9vaVlCL2QwVXk4YlBVMnVwakZTUXJkS3o4?=
 =?utf-8?B?ZElGK1UwR0xCRjh3S1pMOHpONE9hSml5ZTFOc2l4L1A2Z25la29VMXlDTFhv?=
 =?utf-8?Q?2+N31800Rf8WHLgmSFhrwkc5eCfrCNBp?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 15:20:52.9992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 564ca1b2-f131-4316-1941-08dcb56231ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7793
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 15:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111513

DQoNCj4gT24gMzAgSnVsIDIwMjQsIGF0IDIxOjMzLCBCYXJyeSBHcnVzc2xpbmcgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG1yLnNjYWRhPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gLURFUEVORFMgPSAibGlibnNsMiByZWFkbGluZSB0emNvZGUtbmF0aXZl
Ig0KPiArREVQRU5EUyA9ICJsaWJuc2wyIHJlYWRsaW5lIHR6Y29kZS1uYXRpdmUgcGVybOKAnQ0K
DQpUaGlzIGlzIGEgbWFuZGF0b3J5IGRlcGVuZGVuY3kgb24gdGFyZ2V0IHBlcmwsIGV2ZW4gaWYg
cGVybCBpc27igJl0IGVuYWJsZWQuICBJcyB0aGlzIGFjdHVhbGx5IG5lZWRlZCwgYXMgdGhlcmXi
gJlzIGEgZGVwZW5kZW5jeSBvbiB0YXJnZXQgcGVybCBpbiB0aGUgcGVybCBQQUNLQUdFQ09ORklH
IGFscmVhZHkuDQoNClJvc3M=


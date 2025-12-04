Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139AFD1F9BC
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:06:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41008.1764846356622942891
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gDegx50k;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gDegx50k;
 spf=pass (domain: arm.com, ip: 52.101.65.24, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IUe0e1tIsXigqY9v5ddWb22aqSJeIM5PNvbDiwQzjpwh2WZPeeJsYT2HM2D0wCoxQF7rZBbnTW537UG9mK1kd7b4eRBYohCzNgwiph7T8PsQqtxgJjGEzHqu62eDos8JGQjCPCeSju/t+0HjQRvYeGMc8hxo5KJiQuYZrPa0mR9mvltENMGZjd+EUCJH/yPtR5PSywzd2eVg74gJewpAmwpe01N8Pi4fmVvC8R8Vn/yO1xnaPAioQMLmg9MjcFV2IuZrnGEqVfxPtkeCuXc/EnEVyaj+Ua8dT0stycudlWDxCUy0eu1QJl/1hMQ6dLsNRdBQngO9BPXL/DQWGxLsOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytq/ThvO97kwfc0tRMAWLjvO+NRx25UD030zA+WHh6Q=;
 b=n/v3a4NshVX6Gnh3vWsbRw5LS54xodJe/mqpcMGg+B1lRFPNeocsIWrFViXn4GYQcX7YfUbNFlcfqlIxaGz+dUmGIBpvnR01nsH56qy+39loIpVb6mnZSvBQy1V3595JhirAQ66ZEWPg/eo7bBbWET83je/569w2lMvF27WyoiWsWBzYBLWyG24UJZtPvLRboNMQMKU2EG4QIbekeAsFhrKbre4ferP3dTV3CozA6vrRALZLvf1PnGl38CZChohfX0cAiLvokSbhxGse+/1Syavvwcw0fAy1cjIuZ0EYHYFFIPJ7hIV0rIvvpe2UXPxTirgmk2mkeHnuRGMXDEMVkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytq/ThvO97kwfc0tRMAWLjvO+NRx25UD030zA+WHh6Q=;
 b=gDegx50kuKS6IDqHdsi8UKRyWTsfcxuSqvpAPRZewGchMsMS7Mp/UfcFIHPPy23+SXPLYudmyPT1DdrtuhzqqfJ0auotyORs1DgQ/j6Zz7YBJ0ZForIQVaTpZRsSMQ9SNru1D/BconcQs8vYnsrDN+uR0eykbgOkEuyWlsFMP8o=
Received: from DB3PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:8:1::33) by
 AM8PR08MB6323.eurprd08.prod.outlook.com (2603:10a6:20b:354::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 11:05:51 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::2c) by DB3PR06CA0020.outlook.office365.com
 (2603:10a6:8:1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 11:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 11:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqu63TuDDDAGwaVa2rE6UevR7RJriZzCcsHofJBeqZ49JY/pghOoojkr+7F23RpFi+XgyDAOT3A+ue61gNFrqyw1kpjAm1gu9nA0prZkW7xq5/NSgWlFwOQJp4Ee7plCh91tucEvBkHJR1UX0Tbsf0UrS4eGSioBD6cATI5CVZyzGkeDJhIuEzQEiTXtYi8Ak7knJCi2DV1AoDR7sD2zhiw/t2HaJMMZmDIM+m7h3sc2JEB6R7mXZmHwwGj4v8Zy0qs6LMR4GmEBkmiptMvUqjCm4Xq+CIxV0ejN1VE/BKThU80gkl424+KswPayxra4bjyDj3u2Z5t9GnFW723S6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytq/ThvO97kwfc0tRMAWLjvO+NRx25UD030zA+WHh6Q=;
 b=gZdhwjWFAC7hdlCbQW7gTIAj7aJViYBk/Op5nR42VxsqdKHXKmBZJcdxP2/6zPC/0gjIQJIA/RPGa5jwdTnNWAc7DQLZRqVvLYxIRhZ1NjoboikWpuDzZHS6D5i6DE/o21A3R1DGAPbWY1xTRMNamBp4eu9zW4locuK49FD6/BcheaQrfX9aptSXjYopubjenUCweRIg3YQetzR/Egrm3vL+AVDfbO6BZOXpX0b0JnVC3yrEIMBGElKohXTYRxMnobuB16MRr7j3BflGeUKHSSjRaUQQ535sY06TlazNnp3cceKrfjvBcVMMMSqC41vGLc74qBCinHs8tL6g2ci+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytq/ThvO97kwfc0tRMAWLjvO+NRx25UD030zA+WHh6Q=;
 b=gDegx50kuKS6IDqHdsi8UKRyWTsfcxuSqvpAPRZewGchMsMS7Mp/UfcFIHPPy23+SXPLYudmyPT1DdrtuhzqqfJ0auotyORs1DgQ/j6Zz7YBJ0ZForIQVaTpZRsSMQ9SNru1D/BconcQs8vYnsrDN+uR0eykbgOkEuyWlsFMP8o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6011.eurprd08.prod.outlook.com (2603:10a6:10:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 11:04:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 11:04:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Changqing Li <changqing.li@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libmng: correct version of libmng
Thread-Topic: [oe] [meta-oe][PATCH] libmng: correct version of libmng
Thread-Index: AQHcZDPCfxU1fIRu4E6G7zvQUfZljbUPwduAgAEC8oCAAI5YgA==
Date: Thu, 4 Dec 2025 11:04:45 +0000
Message-ID: <35688177-1593-4499-AEFE-3EE8775009DF@arm.com>
References: <20251203090342.2024473-1-changqing.li@windriver.com>
 <FA59CAA8-D404-4977-A8A2-FF02AA4E9BD5@arm.com>
 <fe857264-7b6f-4f2e-9bb5-582a57a5018f@windriver.com>
In-Reply-To: <fe857264-7b6f-4f2e-9bb5-582a57a5018f@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6011:EE_|DB1PEPF000509F9:EE_|AM8PR08MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 4931d049-fc8f-4100-83cc-08de33251532
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dUlUeDNkMUZoVy8ycHlDK3JqZHVySDJvNWlDQUIwbHBKTGZJSXovb2xtQzhJ?=
 =?utf-8?B?Q3RvMkJHcG03OVViVFJCQU9lZDFLQS95MjZhSHdZbjNKMEhUSno1SVI2R1F2?=
 =?utf-8?B?UVJjUm9OeCtvSU00TEhjS09uS2kxeC92SXkrSmtKeGtHdHRmeVpZQjdtNW1j?=
 =?utf-8?B?dUdxTTBhRG1rTVI1SzB5S09pUFpGYU4zcDdoaTEzWTZJNlhtR2piOWUvSXB6?=
 =?utf-8?B?MG5nKzR5NnZ1VlRrWFhIRkcrQzVMRzh0ZklFSFB3NjlaZFBRd0Rjai9Wb004?=
 =?utf-8?B?VDg0eEhwWSsyYXZlUEFYNXM4MTU3bUEwbFhQRHFnVkR2RlJnRTZISnRKajlK?=
 =?utf-8?B?YS9Kam13RjVFcHI2anlVSCtsSnRIeDBJeU1FdFIwcmxVK1JUNXFPK0VlSmFY?=
 =?utf-8?B?T2NocVVpZkRnNFhvR01ST0h5UjBpbDdQTEZ5M2RkdEh0OUgwNG9KWC9BQjdP?=
 =?utf-8?B?ZTVlRTE0bDdyMDZVeWhXbWwyQ1FFb2NYV3lPT0RwMWM2cUtPRXo1T3BxbExR?=
 =?utf-8?B?WlRFNjY5TEVQd1gvMHlkVDRPNU5XckVFV0kvSkxIQUN1UE9mdEhFanBYWSt6?=
 =?utf-8?B?N3QxWi9kNHJtL3N0Z3hpeDRUNHZHeXd1ZkJEZktEYlNzbkM0czdiQlhKVGtr?=
 =?utf-8?B?T2F1TDhidDR1YnRrK1JoL2ROU2NQeVlYek1xYU9EREFaQWloOTN3TnIvYXR6?=
 =?utf-8?B?R0F4cTFpVlg4L3FBL2FCbGdkOXBJVHdqcjJ1b3BJMlc0dzF5ckZ4MXlva1RX?=
 =?utf-8?B?ZHU2Zk5JNmt4WnpHRkM2d1pKRGN2MzdjeEViTGVRNFNoTy91Nk92VXZOcWwr?=
 =?utf-8?B?M2NMZkh6VStCbldBNU1SZXRxRitPT1RQcFc5cnhrQkoyRUFZRHp0ekJsc0Va?=
 =?utf-8?B?TXFjMjNrTnhhcGM3cGFPb0hLYUZIOG5IanhRNldSUG5YMkVkc2pCMEZpREFt?=
 =?utf-8?B?MFRuTGJkblZYY05mcnhhMWxZbWo1eXRLMTZvcnRjeElYVlV4WDdSKzY3WWZE?=
 =?utf-8?B?OWFMazNDby8vQXRZQzZYR0Z3SHJQbFJycGYrZGVoTUFrMXJSUHRIeGg1QzVE?=
 =?utf-8?B?SkphVkxFQkpzRmUxazFVL3VhUHcxQUtrelFTelVsUUw2eVg5YTFndDlwL1Zn?=
 =?utf-8?B?NG1Tc29KMm9JSlFHbmFOaEl4MlhST2xQV0pRYmxXam9WZkc5Yy94RkRpSUc1?=
 =?utf-8?B?L1lKSzROV3BrQS9YT0NBNVIwd2FHRzFkOU1WQ3AwY1k3Z3dtWStVNUNBMFla?=
 =?utf-8?B?TXFVWUZHTi9GNGo4RU5VTjZ2L2tGd3grMWFSYi9PYVFsd1l0bDFJanVIYVls?=
 =?utf-8?B?aFpVallFWE0rTGhocStUZElBRXVKRUp4MXdvWTZzNDJ3K3N4Qk1ieUhnVzcv?=
 =?utf-8?B?aGpSYk1MMTB4RDEyUjdTeFR2QTJqMjRpdHZqSlcweE5raENETENQWUtxdXp1?=
 =?utf-8?B?WFM2UVRONHlDOHJyZ2JuaVlUczBmUjZXMGhSQll6b1ptS1QvUmVtN1M0WThk?=
 =?utf-8?B?UzFYSms1T0t3dTVobUVHZjFqWmJZVHcvR0pTL01ncGtjd1RnUXpKZ0dnSkRE?=
 =?utf-8?B?aFBZNUk0OE14U3JrSnpCQW9yTHF1WnhYTlA0UTVPMkQ5U1p4Zm5hWlJKQzZK?=
 =?utf-8?B?L3gvM0VyVGw5VjkzN3Z2d2ZpbDBUakY1bUFvS1h4ZDVsZVdoWlZvWUNGM1VU?=
 =?utf-8?B?ZDBPaWNNbDdVRUhUUk5Rd0dVelNmak0rcDYrdmEzVlpmNDNiVUlCVEJKS3Zn?=
 =?utf-8?B?Z28wcERvTTZlK1VoU05qMEdBblh1clByMmgvUXMvN0wvOFVxWVROOWJEMUd3?=
 =?utf-8?B?T2lRRXhITVg3WThROWFic2V2R3lXM2NhcG5ySGlMSXZSTi9UajZuYXNMSC9o?=
 =?utf-8?B?ZjRpT3RTdWZUbmJkZnRnT0oyWDZDTW93VHlGZEQ0OEYxTVRzNFN2RnVpSXBE?=
 =?utf-8?B?TlVSdi9uNmtGN2J0WlQ2REdKbjBtRlpkZGhnL0Y1YitjdzlLS0RhUm9KZ3ph?=
 =?utf-8?B?Q201Z3JGZy9BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <584602063D0F964DB180C0F7CF7AB5A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6011
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8764dd5f-81c5-40b5-179d-08de3324ef4b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWhESERqNWx1bTkxT00reGxzTTBWZUJNQlkyVEZLSGxPR1BvQW9wTzFUR2h5?=
 =?utf-8?B?RVNuNHREdjJsaXJGL1BUSHpJMUFCekNSSXFKOHFpNVNJaW5QN0FteDEyQ3hQ?=
 =?utf-8?B?M041VVBwa25TTmpZa2RwVFZQdTR2Tjh2S0kyUXNOTHZNNjRxb1JyeDRxRmRZ?=
 =?utf-8?B?Y1pGbEE3WHVhQkpEV3R4VnpwNjExVlpSSkhUdTd2TFJQblR1emlDWS9mRlFW?=
 =?utf-8?B?emRZS2lJVXk4MDFPU0loOWw3M3c3VUN4NzBnazQvZm9IdkRoYm1TRWlIN1RC?=
 =?utf-8?B?TVNmaHJGdmlHTE1HWjlWaHNSSFJOemZCaXlZaEN3aFhGNU1WTHZ1akJxR3FX?=
 =?utf-8?B?d1NNb3Z0N1k1OEFVTDluNGI5VUdxdndXeHF1RVhGWHkybXUxdnB1a3QzTU9x?=
 =?utf-8?B?YzdOaW1jYmVUZkV1SmhldGdkKzJjRmFDODFmSlV3T3lsZ2ZFL1JnYXIxTjAr?=
 =?utf-8?B?NlVtc2d5MklWbmJKcHNBNnl3clZNcUhKaW9kbExUZ01IVkRSRHNTR0Nveksr?=
 =?utf-8?B?NUdvd09KZlcwOUxZWnJUeUI4NHcwNCs3NlZORHJndW81dlpDaWtncHpucjl4?=
 =?utf-8?B?cFNTa1NnRVJkY1U5VXhGcHp3MW8rUWVWVGFXeVU2K3RDeU10VFZNVUh3bm5P?=
 =?utf-8?B?dVMvYWR4eUlyclVZeXlkOVllSUJNSllqWFA2T1pCOFRRQ2NQK1RyOVVhV2ov?=
 =?utf-8?B?Wkgycm9KRG4zQ1BaREZSNDNzanV6ZGc0RVA5cGw3T1BGNU8vYVFqVFp5NWhV?=
 =?utf-8?B?eHhxc0UzaGR3bERnSDBPdnVhMWYvbXZzbDdwc0lMZFZwdEkxZmZOeUx5VklT?=
 =?utf-8?B?eUNPam5tNWZib1VnZitlaFRlSzNpSytKdmdhWjJLUDJwUm9BSjZnVlRGM1FF?=
 =?utf-8?B?WFU3V1kvMUszNDJqUHM1c2J2MHJvK1pIRlhpTGp0cWRFb0NnWm5CV2JaVith?=
 =?utf-8?B?NDlyaTJLcHVNL2wwazBHUTFPYWtHWW5aeGorU1BTM2xGL2Zud2JGVjE4STdW?=
 =?utf-8?B?VERNL2o0T2VUVTZNRTJveGQ5UFFPZ2VScFZPRGhMUEMxb25vU0gyMCt5MWt2?=
 =?utf-8?B?SmlsNEtzcVQwTE1jMjFvbWFvbEM1eVFCb1g1d1hOUDF1bC9JcWI0RzBJMW9H?=
 =?utf-8?B?N2NwWE1WcjVsMWJYRGl0ZTMvNG1sQTQ3VFg2T1pYTHp1TTA5U29ZYkhyZ1dS?=
 =?utf-8?B?R0FOcFFGZExRTFJIZFZPMGtLTkc3RXZ4V3lHQjZKalV6TStMTFB2ZjRrMnpN?=
 =?utf-8?B?c3JGVHVZNURLTzAyQlJnbDh1WE5vTnAvSXdocHM5VTMrdWkvSHBsY29iRXRG?=
 =?utf-8?B?cExoZnVybDVlQWs4bDZlNXRqaG1CVGdsdHllTGNrQk9nWEpNVTRCaXQrcVlP?=
 =?utf-8?B?cGk1empyeXphVUFBNldoNXZ1VjgreTZYeDNabG9vRU4vL29ZTTBtWUtaamY1?=
 =?utf-8?B?MHR5bXQvMWwrUGVpejhYaFFWdTc5Y05NdnJybURzZDlRRHFWdUN5ZlNiUy9H?=
 =?utf-8?B?RUExdVR4TkkzcEN6NFZ0OXY5N3lmODRGUFd3ZGo3YnBvZUJRT005cUhMOTha?=
 =?utf-8?B?U2phci9UeEJVQzQzZk8yS0d4bTV3aDE5aThyZkVhTmxJQmRaTnFtUTFPUzl0?=
 =?utf-8?B?OHkzZVhVZDdjUUdsVHpHdy9ZU0k2RWVjb05PNnlBVlRqTm13R3lFVlFYc0tS?=
 =?utf-8?B?b1hiUDVQSERydmJ3My91ZVdlWW1YSVVpd2pQUnN4UUpiZjY0cmNqWnozck5w?=
 =?utf-8?B?MzdxSnYzdGs3a0VLT09RcXM4TklRY1owTUFxVzJCMFVoZkJScWhEMU9YL3Bj?=
 =?utf-8?B?R0E4U3FTNVNKV3RnSVNscFg1dE5rbDBGMExnQ043MHhmSTFDQ0VlTUNGRmRy?=
 =?utf-8?B?ZlZmaVo4RWVNd1QrZ0hnMnJIcndyejJBUmlIUHQ0d0tZZWdDaEt0QVZzSmpP?=
 =?utf-8?B?amFXQVdaTGs3M2Zhdm16ZlJUbGdhVER3eUl6bStYTXFtV1pHRlBKWlJsSzFO?=
 =?utf-8?Q?GBXWbsqn7R+NhEUeSBiA6+PUpX2J8I=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:05:49.5049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4931d049-fc8f-4100-83cc-08de33251532
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6323
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 11:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122318

DQoNCj4gT24gNCBEZWMgMjAyNSwgYXQgMDI6MzUsIENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxp
QHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDEyLzMvMjUgMTk6MDgsIFJvc3Mg
QnVydG9uIHdyb3RlOg0KPj4gQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdp
bmQgUml2ZXIgZW1haWwgYWNjb3VudCENCj4+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCj4+IA0KPj4gT24gMyBEZWMgMjAyNSwgYXQgMDk6MDMsIENoYW5ncWlu
ZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8Y2hhbmdxaW5nLmxpPXdpbmRyaXZlci5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+PiANCj4+PiBGcm9tOiBDaGFuZ3Fp
bmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPj4+IA0KPj4+IEN1cnJlbnQgdmVy
c2lvbiBpcyAyLjAuMywgdGhlIGxhc3RyZWxlYXNlIG9mIGxpYm1uZyBpcyBpbiAyMDE1LA0KPj4+
IGFkZCBhIHBhdGNoIHRvIGZpeCBpdA0KPj4+IA0KPj4gTGFzdCByZWxlYXNlIGEgZGVjYWRlIGFn
bywgZm9yIGEgaW1hZ2UgZm9ybWF0IHRoYXQgd2FzIGRlc2lnbmVkIHRvIHJlcGxhY2UgR0lGLCBi
dXQgbm8gYnJvd3NlcnMgYWN0dWFsbHkgc3VwcG9ydCwgYW5kIGhhcyBiZWVuIHN1cGVyc2VkZWQg
YnkgQVBORyB3aGljaCBpcyBzdXBwb3J0ZWQgYnkgYWxsIGJyb3dzZXJzIGFuZCBhIFczQyBSZWNv
bW1lbmRhdGlvbj8NCj4+IA0KPj4gU291bmRzIGxpa2UgdGhlIGZvbGxvdy11cCBwYXRjaCB0byB0
aGlzIGNsZWFudXAgc2hvdWxkIGJlIHRvIGRlbGV0ZSB0aGUgcmVjaXBl4oCmDQo+IFRoYW5rcyBm
b3Igc2hhcmluZyB0aGUgYmFja2dyb3VuZC4NCj4gSSBzZWFyY2hlZCB1bmRlciBtZXRhLW9wZW5l
bWJlZGVkLCB0aGVyZSBpcyBvbmUgcmVjaXBlIG1pZ2h0IGRlcGVuZCBvbiB0aGlzLg0KPiBodHRw
czovL2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkL3RyZWUvbWV0YS1nbm9t
ZS9yZWNpcGVzLWdpbXAvZ2ltcC9naW1wXzMuMC42LmJiP2lkPTFkM2MzYWQ5M2M5NjJlZTFjMjdk
ODgwNzZiNjNkMDhlNTNjOGIzMTgjbjgwDQo+IEFub3RoZXIgcmVjaXBlIHRoYXQgZGVwZW5kIG9u
IHRoaXM6DQo+IGh0dHBzOi8vY29kZS5xdC5pby9jZ2l0L3lvY3RvL21ldGEtcXQ2LmdpdC90cmVl
L3JlY2lwZXMtcXQvcXQ2L3F0aW1hZ2Vmb3JtYXRzX2dpdC5iYj9oPTYuMTAjbjE5DQo+IFNlZW1z
IHdlIGNhbm5vdCBkZWxldGUgdGhlIHJlY2lwZSB1bmxlc3Mgd2UgZG9uJ3Qgc3VwcG9ydCB0aG9z
ZSBQQUNLQUdFQ09ORklHIG1uZy4NCj4gLy9DaGFuZ3FpbmcNCg0KVGhlIGdpbXAgb3B0aW9uIGlz
IGVhc2lseSByZW1vdmVkIChvciBhdCBsZWFzdCwgZGlzYWJsZWQgYnkgZGVmYXVsdCkgaW4gdGhl
IHNhbWUgcGF0Y2ggc2V0LCBhbmQgbWV0YS1xdCB3aWxsIGp1c3QgaGF2ZSB0byB1cGRhdGUuIE1O
RyBfaXNfIGRlYWQsIHNvIHRoZXJl4oCZcyBubyByZWFzb24gdG8ga2VlcCB0aGUgY29kZSBhcm91
bmQgaW4gb3VyIGxheWVycy4NCg0KUm9zcw==


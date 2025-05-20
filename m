Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BADC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:57:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web10.23011.1747753027552758420
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 07:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ng6sgX2C;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ng6sgX2C;
 spf=pass (domain: arm.com, ip: 40.107.20.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tLNkf749sHDL5o8tISWHEYM+Ainr73Tvl6TjBh0aYRaRRhjks21vE3H5Evn+6GeBeR9VpmWwy9RRMpRrFtT3dY6otQNMqJ8oM0AnAEWN2IajgbjzE4Q0OYoQgf0nnHL8l8O+h4Oh9syINbCXJiT/qqJFOsiK/j4WfjuexIVWoC8WVccLt75x0BUwKp9KrPb7KPnT1CJ4IQDJYijnu+UahQw/EfaIkE7NhRzWCzxxxErlE+3WmtDn5ZbdUAh1IpwUWqKScV2PMtHqoCbaXRl/gTmfpLoeHZGAgETSSxnoCaqPnkhj8IGOcrh5Kl8hgWVv146t0YmlyD8peva3EvZjWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHuBImwy+Tl5wdaFIrWCTN7oDJf3KOluXZycR3COdVg=;
 b=gc7VaDLE1veb9F55X57Zuga/JjzlSj6ku2hkxjXqm7aKrkki9hSSrbBWOpx7bDyvbKBP5XAzWiCEvhhVMWF+V5McqZzsikJKeFRDgBRR1kaFXQgTSwGSQBFhH1P3oKHUsreNRRNdgQ4t9A4Zat/hIGIukiCgM5SmtqeCOmmeU7L8BWg6BXPLZ4BGX8ibNWUzxRCRMqIVJDRT3ZGXh3SF0prZ0RdxQo6c8AA/B52iY8BTHYL/H/inb/Zzerss0j0yZORpbqwpyr32g6uncBZcunyj+u9Z7UjK3tF69KAz5b6qjlEnjHB3K6sEEXuUDe3EwzFMiIphKUm25B545AmEBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=renesas.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHuBImwy+Tl5wdaFIrWCTN7oDJf3KOluXZycR3COdVg=;
 b=ng6sgX2CVrVpNnSWxkvvnQyseUVo3YZqp6vmsCXJoalVCXqt9WkgLBQmj9ISVUuvVwgseuFReGdPB2lC2P5k1zV6QvuaI4pJ34twB6gNcR6E/sfGm5kxsZOlU9duH3EeYT9qDV22l2RRXxhSWkRpqYJLrmGAj3WbirTFxA5vrDY=
Received: from DB3PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:8:1::15) by
 GV1PR08MB11178.eurprd08.prod.outlook.com (2603:10a6:150:1ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 14:57:00 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::23) by DB3PR06CA0002.outlook.office365.com
 (2603:10a6:8:1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.21 via Frontend Transport; Tue,
 20 May 2025 14:57:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 20 May 2025 14:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqC9zUEBDcl5AO6FhDcfeMwCkIPGCuFTmBhHzbrhK3RwQovpScQ7fY1rNO3qNklf+BXWSxonGyIAypWorO16VLX/CKoywiL3JUqwr5atTspOHgblfw+oasxYjOVMXMgJFQkLhqBE65C9qnBhDfxUO5hkIE3NOVf9+uRTKHXYKetNOhHTtA93/5C5GLG3hTdwZFCu62SB+LMmkO5gjKvDkA4zGCkHQ0TQKimPFUEK+gBslOwmEUvympzCo492+Yt932m3pAh6CJ9NcnHlY74RrvT6xuS4GO7R+q/OAT4aaBnxJNrJnt+mw2zVOvByxWel4K4L1Z3hX+dogT/BzhpHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHuBImwy+Tl5wdaFIrWCTN7oDJf3KOluXZycR3COdVg=;
 b=BkBrFdxRntlEWEcqPMtRduk2lwxBPdu1iEA0vtOyA/ISCzgGmSoCO2nY7p6wWCfsq87tnUIjNxQ9alTjpq3bqbxDBsCIE0ZyZeeu8rsCr5GQKzx0XPpe9u58FLbMIU75lHu1gQ5b1pRNkaPdk2RJA5UR9IFc8oZDg7VGGG9FAo8NvBCk19amf4IGy99a9LLMsYxdWiDvU1RYLed/OPROViy74t+fCIS5nF3beaDg7YiKJHCmQ9vg5Vs2WGBRSo1xPkq9brhRL/Ee0UQnFn3ib2gH6++NspR+Z/aW0u2ltGgd0xmBF7WOpGz7xEdeZWq3207P/DHhxGYLk8G5CEn+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHuBImwy+Tl5wdaFIrWCTN7oDJf3KOluXZycR3COdVg=;
 b=ng6sgX2CVrVpNnSWxkvvnQyseUVo3YZqp6vmsCXJoalVCXqt9WkgLBQmj9ISVUuvVwgseuFReGdPB2lC2P5k1zV6QvuaI4pJ34twB6gNcR6E/sfGm5kxsZOlU9duH3EeYT9qDV22l2RRXxhSWkRpqYJLrmGAj3WbirTFxA5vrDY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5426.eurprd08.prod.outlook.com (2603:10a6:208:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 14:56:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 14:56:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "chris.paterson2@renesas.com" <chris.paterson2@renesas.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
Thread-Topic: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
Thread-Index: AdvHdSEI4cqzGwtvRK2R3/3yqcMGlQBMUnMAADbIrAAABG6AgAABA6cA
Date: Tue, 20 May 2025 14:56:27 +0000
Message-ID: <303372DB-A2BB-4027-9D7F-6DAF93087C31@arm.com>
References: 
 <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
 <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
 <CANNYZj9O7D5Eq2eeXxuD+VfO65i6VUHis2vOQ+ZYsfxJhk2aog@mail.gmail.com>
 <OS3PR01MB58965D1C9EA34FFD60523FF5B79FA@OS3PR01MB5896.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS3PR01MB58965D1C9EA34FFD60523FF5B79FA@OS3PR01MB5896.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5426:EE_|DB5PEPF00014B89:EE_|GV1PR08MB11178:EE_
X-MS-Office365-Filtering-Correlation-Id: 21220ed6-3bb2-4188-4d5e-08dd97ae928b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZndLZzNDV0ozb3FrR3RsS3pDcDF2dS85YlRoa3Z6NEx5S3gxblNNZk1CVS8z?=
 =?utf-8?B?dlA2S0VETzVpSVJyRHhYcWdOdjgxWFUwbGRWRjBrM0M4UVpRL1FUZDhHTXJy?=
 =?utf-8?B?RXlDTHFhMFJyU3Eva2twY25IMWxaUnJkcHc0NHVZcjR4RmlnWFhFdGVtZ1hz?=
 =?utf-8?B?OXlsUUhjZ3EvSVdqTU11eUJHVEVQOHVWRWVPZWQrQXpTTDdNSGRyMWFVS3RN?=
 =?utf-8?B?MC8zNitPVmNtbkl1QitiNTJRWG9qN3RzOVFJZWVvZGRCYUJUaHp6SzltbHdR?=
 =?utf-8?B?b1NNYmlyWi9OY2k1eGlsZjREL1dFOEtZMWFsZFY0bjlyenJjN3EwM0lncE9k?=
 =?utf-8?B?RXpMQ3BraTVoYUVVUDJKYStURU5pRWpOSzhNcUwvS3FCSUFKRldFVWQ2SzhC?=
 =?utf-8?B?SVBTYlVqaytrMEdkZkFpc2JnVEE2N3dYbG1HMUJRcjFzNzU5a2JXQU0xeG5n?=
 =?utf-8?B?ZzJhT0gvTFJycW15K01jT3ZmM0cvZkVYcVJ3THRJWjYrTTNhWnV1cHdJaEhG?=
 =?utf-8?B?Wi83dFhENk5WV21kcFpzN056RkQ2dnNtUEdJMEhScVFoU2I3MFIwQ0tuOFVO?=
 =?utf-8?B?MXlIK1pQU1FpUDc3dHNtVjVCWEtjUzhzYm5MWFdRTXNmbTQxNWtDRkwrZFc3?=
 =?utf-8?B?TGR5MC8vNmpaUXBzUSt5VTl5emdTeG41VEtLWTBIME5DTjY0RVFiY2JCUVY3?=
 =?utf-8?B?eEhrZXdabDY3TVIxcjNndGt0cHRtb2JrTURuaUJsb0dvQ21Wa0hXa1JFOFVE?=
 =?utf-8?B?M0tRUlJ3Tm9TQlV5UElpT3plQklOK2s1cU1QYWU3VEdORjZqcnFFcStHTngw?=
 =?utf-8?B?R0lETkczQ1htV2dyYWxmMEVEZStFdEp4VFBxTlBtYVVTcDF5MU12em9wNGJ3?=
 =?utf-8?B?djJXZXpPZElhbDBnbzM1SmdzUXR5dnFhV2JTRlVPYVdMTUR0MlVzbjM2OWVi?=
 =?utf-8?B?TzF6WDBURTV0NjNqcGw1aStRNnFrL0hCWFYzS0hQWERpOTRRdVZYcDdWRENB?=
 =?utf-8?B?WWNTYzdlZVc2YlUvNFQyMTd4TEkydXkya21jM1dILzJCZ3RsOWZSeklaNUc0?=
 =?utf-8?B?Ym9nM0pEVkh4OEtxY0w3aTFzNWE2S1FhR2JwaVgzYVVSUDNVMFlGemIwVkpr?=
 =?utf-8?B?VUlmSlA4TTd1MStxNmtPWUVoKzg0eEs5ZUZJZWwzeDBtK3FrUE5ITWdGc3lp?=
 =?utf-8?B?WjMzdFgwZVoxZVVBSFlDVWI4UkdLWTFLSmJ2b0VGQk5senlrbmQyeVNEc1l6?=
 =?utf-8?B?UXNzWmNOTnRNM1hibjk4cEdjeFdYVTlBSnNIcWtTdGV1ZlBhcktuY1djUytu?=
 =?utf-8?B?V3M1bVhZQ3g1QzloNEZvZVdjQmZmK0NyYjIzeVRNaEhaTjgrTGtGWjk1c0pQ?=
 =?utf-8?B?RG9jTGI5WFNNSnNwZjdMQXFhZ3p2TFBac3VBUzNkdlZBNHEvN282VXJ6enph?=
 =?utf-8?B?T2dXcGlpTVNmWlJ1WUdZVkZIS3VMbThZeFl5YW9sR2lmSzNVWHVoM2thdktV?=
 =?utf-8?B?YkZCNjdCa1Bnakd0VG5GZHhkUGQvajdvUDhhd0MreVVjcjRUUzBpVDQ5WGxP?=
 =?utf-8?B?ZldaTW5YSDlMZnMxdi91SzFPOFluV2J6eDBMMG9QMTkxekhWbndtWVNxREx3?=
 =?utf-8?B?YlpjVXhUKzRtZkIvK3FydHdZb1RzdmRkbm96YTR2Vzg1amR2akN1ZlZOUDgy?=
 =?utf-8?B?QUhOUzRqVmFyTTlBc3NOUEhWZnhOamJvaGtpVjZhTWNkWlZVVTZjeEpSd0Zr?=
 =?utf-8?B?T0N0bXl0dEFjWUxOUGgvOTRWVjlTa3ZsdnZOWU53WVdpSXhpZU9XTWtISUZp?=
 =?utf-8?B?WVhDOWhoNDBqYjBNdWd1aytyenFSdWV0UXd3SnVLaTBKRFFiaGg1MXRTTTM5?=
 =?utf-8?B?OFY5M3gyenVtbjVCbDB4VnlZTXhLNDBQYnViUDdxK1ZhL1pTS2hnb1VFVWhN?=
 =?utf-8?B?clF5QWdrckRmOCsxNkgxRE1WU3RCQkg1OGd3ME1ReHh0aCt0M2oyZm1GcVhl?=
 =?utf-8?B?T0NZMnRNM0x3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EFFB646AF20A94B9A7FF3E986D04E4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5426
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7941b0d2-e98d-4cd0-9441-08dd97ae7f3c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVQ0b1lJQ3BaVUpTbzFXNWNaeDkxQ1ZsaUFvQmxxRmZoVTVhOE9Wa1V2RWt1?=
 =?utf-8?B?VkI3dWh3NklqS2xhUWRSbkFhNlFWbXFtYVVlSDR2L1dKYVRtT3ljOUs0c2Mw?=
 =?utf-8?B?enlvQ1ZrVlJOMUdUclRLeFBScnNFMWdiVGtaS2cxMnBra0U4b05kcDhGMjFX?=
 =?utf-8?B?cUVZc1N3YnlXNzdoemJ5KzFydWIwYVExcjVUSm1raHNmT0t6a0pPNHJCc0lU?=
 =?utf-8?B?VnlVMmpoRzVwRjZpVUVJMVhPMTkrUFVIYnNpTHRhL1Y5WExXMHJ5VkZnVkxn?=
 =?utf-8?B?eTRMbGRELzVoQ3htdFkxNE94MC9MWk9kRVZmclNORmtGSE5RY0ViNVR6Rlpz?=
 =?utf-8?B?dHAzc3l0NlFteXhPWkpNYzlZVm04R0N2ZmxMb0xocVBKSW1yTFhSNVlwMmxD?=
 =?utf-8?B?cGE0dU5CaEJhdW5NSCsvOEFHOUU1alFvMEQ2Q3ZsM0dnMm1xejJrSDMvTjht?=
 =?utf-8?B?dEFZck13YnJkckJOMWhUWENRVzQ5NWlxTDdkK3BCVmJGL1FhMEplVUtGRXkw?=
 =?utf-8?B?U0ZQRmN1dWt2enorNEVyMEF1NU5TNFNDak5MeWpQemZocmdPODNFd0ZrQkJk?=
 =?utf-8?B?SHRJSkY2ajNuZ1M3WUZtQXJ4a0NIWjdkSi9Fd0pSRUpRWWQycHI2N0tWTnha?=
 =?utf-8?B?cnZuS0RBbDFBYm5Ebk5tMDJJSFluUmJadGVPT3V0L0I5cER6eHJFdkRjSXFP?=
 =?utf-8?B?aWJrck04T0Q0L1RMUkhHeFFGSjJGak9VV1hadmZpbzhvNWRMR3d5WW9IUXVt?=
 =?utf-8?B?QXVZcDBNKzdZSDI3MXkyNXVUMDI2K1M2NDZtRlBXQU9LYmMvWlJlWWMyVFo1?=
 =?utf-8?B?MkoyblZYL0ZCc1RqcUcwMDQ4L3BBMnIvb09GNmxkN0J2T1BqQ20vSXMrU3hu?=
 =?utf-8?B?d1BWeDAwd250UkRXc3NTajZDTGhqSTJ1WUltZEtsdndFUWplVm1aajB2bCtQ?=
 =?utf-8?B?ZzYxbFdlNldTMFFnbytBelVhbXp4NGZMNmhvR1ovZzdicW5NMWdZS3BGTWl6?=
 =?utf-8?B?bjdYMG5qRmQwaERyVVR6ZHNTY3NQUFI4V2J4RVR5R2pqOEgxZWUwSnhsSFQ3?=
 =?utf-8?B?VHR3a0hSNHhFUnNhVXREMW45dzZBc2Vnb21oYU1TUjREZVpyZENvZ0RRMFIy?=
 =?utf-8?B?YzVzWHZ5ekVlcjFxektLTGc1dW9lZ1pzOG5kalRDNU4yWnBpMWswYWlaL0Zk?=
 =?utf-8?B?UFdKV0ROcHhLVjQxYnI2dGU2blp1bE5UaEdzNWczNE5KaG1rRWtYdDRYT0dP?=
 =?utf-8?B?MDFQTnNJMWQ1ak9UYTVCbjBmMENDcm5qQ0FNelV1ZlJ3dnN5ak5HMlN4N1B0?=
 =?utf-8?B?SkRzdTA0RU5rY1dYbTVvUDMwZUp3cUhxSFdLd05Zc29xNWNJam5CbkFIOFVo?=
 =?utf-8?B?Sk9MRUhoeGdRWGFKOGdrak8yb3Bmek5FV3RMdFlUcmdNV2Y0YSttREM3elJi?=
 =?utf-8?B?L2s5VjRRdjVDamVpRzJzN3podWtqY1NqTUtrMlRGeW1qUW94TGhIb0JaaHdl?=
 =?utf-8?B?U2N0ZDFvNnlVTHNPd2xqQzd6aitwQWtlamY2ZTdCaC9mNTVVVDFTRU15MEVC?=
 =?utf-8?B?azZxeG5iQUJtS2kyQzRNdlF4UW1ycWl0Z1JOdDQxVWI0c1UxNWlMNnF2VlZj?=
 =?utf-8?B?NlRqKzFNVkxrVE9Bc0R5WnlCL2JFRjVOeG9KR0YxYlRmUWFPWkdrTVpaZy9s?=
 =?utf-8?B?U1JjUWo1aVRLanJ3Y2tBcnV0Y0NXb0tPZ1V6L0JKSXAvRE9HZTltUmdraWVP?=
 =?utf-8?B?S1hMbkdpMlI0UmN6SlZzR3FDaCt2SXYzWXRZV1JOR0JtbVQ4K3NOTDZFcnZV?=
 =?utf-8?B?MEtCWVBQZTRTOTgzQUJYK1lDejk1U0JpQTdNMmRFT3ZjSUxyN3Q0d04rMjZD?=
 =?utf-8?B?OWhkTmswK25Vck9oNk5aeENmRXRzNHc2QVAwQmVZWUVkS0UrdnJRdEs5Wklj?=
 =?utf-8?B?N0VTRGZRSlQ1WjlxMWQ4SHc1ZGtqSTliNDUxMGdLcTlCcmd2amI1UEpGamsz?=
 =?utf-8?B?Rnc2cVlkMjBPSlA1TXI1RTBIMlpKTjRqNVZTR3pHNWYzeEFVR0RyRURkVkk1?=
 =?utf-8?Q?NFpNSK?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:56:59.4176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21220ed6-3bb2-4188-4d5e-08dd97ae928b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11178
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 14:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117514

T24gMjAgTWF5IDIwMjUsIGF0IDE1OjM3LCBDaHJpcyBQYXRlcnNvbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8Y2hyaXMucGF0ZXJzb24yPXJlbmVzYXMuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiBJZiBJIHJlbW92ZSBhbGxhcmNoIGZyb20gc21hcnRfNS40LjMuYmIg
dGhlbiB0aGlzIHJlY2lwZSBubyBsb25nZXIgZmFpbHMgOikNCg0KVGhpcyBpcyB3aHkgYWxsYXJj
aCBpcyBxdWl0ZSBzZWxlY3RpdmVseSB1c2VkLCBzbyBwbGVhc2UgZG8gc2VuZCBhIHBhdGNoIHRv
IHJlbW92ZSBpdC4gIFlvdeKAmWxsIHNlZSB0aGF0IGFsbCBvZiB0aGUgcHl0aG9uIHBhY2thZ2Vz
IGFyZSBub3QgYWxsYXJjaCBkZXNwaXRlIG9idmlvdXNseSBhY3R1YWxseSBiZWluZyBhbGxhcmNo
LCBmb3IgZXhhbXBsZS4NCg0KSSBkbyB0aGluayB0aGF0IG1heWJlIHRoZSBzeXN0ZW0gc2hvdWxk
IGJlIG1vcmUgZm9yZ2l2aW5nIHdpdGggYWxsYXJjaCBkZXBlbmRpbmcgb24gdHVuZS1hcmNoIHBh
Y2thZ2VzLCBidXQgdGhhdOKAmXMgYSB0b3BpYyBmb3IgYW5vdGhlciB0aW1lIEkgdGhpbmsuDQoN
ClJvc3MNCg0K


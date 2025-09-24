Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DFACAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 18:55:00 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.web11.22397.1758740092315289956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 11:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jUARnzt6;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jUARnzt6;
 spf=pass (domain: arm.com, ip: 40.107.159.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=buODzyd5IS857wOKZitjTmSYAbGSWLB0NDhKMpjC5iv51OSeVIROaTc/PsfLw/mv8vlVUKsxhuOErkHAX+EoNQY4lteEZt+gz7q9krm8Z0Q9zjEcuvnY6uhlBa5NgZmCnHyc78HPfHubDhgB1/0wYAUYRN+21O5hUHN2NOSRq6bDn1aanmz2EI31KVW2urT8urVHE04pkAK/O/v4JBC43j2gL5YkZ5n2kPBrSK8ChvXj9cZIt6YQ5/00VVp4FNLgXo7PYE6QqiXYxceDrIvCzopAA8t859GjGGz77BH/ZRaMvTIwQ//2wsqGC1XhzKO1DlIH5vHLmfugoRIPq4ne5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB8i8xrmXEeDehc2IQMPXP9LDO/u1V2lzZamuNyzAvk=;
 b=fesFyIDyep4dUL/cYxmsC40/hS907sX8vX6FoxXJAqsKoT+fKuj/2TL/ja+404AdTjAevuoTL3mAxds1F4cNMO5bfZshZLSdmv5tDrZ0iDMOmRARWvj6XSMUEadbK3kmRoT5NZORsDIQ0Qw8NUOWINlUa9Qb3XzrO9Pe6iIAUGFU8/BmDM7CDcoOcId5HSNn/40MCfsHoyTTwzJB1N4yBC7hwSUwibCbbe4TKjmi0ZpAEO6hPfMl6zmbKhSleytdheHSsycdWkJt7i6NI8VUiaazTyIty30pkxvLdZhNF/TyQGnXsyaksd9v7laPlCUm0d9fUWsf579+bFLtHh0TZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB8i8xrmXEeDehc2IQMPXP9LDO/u1V2lzZamuNyzAvk=;
 b=jUARnzt6JNFptsFG9hgOOC4rtZAcxBpY4/TCDXK2rk6VRpRHSTOsY3p/sAr0ylViuCEVl6dJwAX4U8iD6FEef+Y1MJNPkFUFPRCsw5Pp5dbfcgbXrLOVHzxI89ZHBLKtcNbbRBIAxsEVViOz4oqNmolBy8XNyBRj2aZ9OPkrOtU=
Received: from AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19)
 by DB9PR08MB9705.eurprd08.prod.outlook.com (2603:10a6:10:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 18:54:46 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::fc) by AM0PR07CA0006.outlook.office365.com
 (2603:10a6:208:ac::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Wed,
 24 Sep 2025 18:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Wed, 24 Sep 2025 18:54:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTFy3D1NRBGcYVlkdh7bFFKNe5VyLARYjnBddiuprGQlJtmSA+MZFwrRMNHb//1zLvpFWxP6mQkasvhazUVPAux5YWoYAdniOSYAPeaibKaWNYG18kAsEwX6q/KFCtTh60eL1ruB9aWVKROcgtLZIPBwTwz2Y/axstfl7MjPZoMSBfWT/dGKcG4Nby5HndF40Do7SK15tqd82DBdiAHuOFle/ZJ/XUE2qmg0ntw62piHA30pjBj3nCdxmNWuPsi1wYRmrMOpV5qN3Smcnz4I50P6B+2yqsmjpXkDOmZSOr77+EhnJQdTh404Y2VNNG1tGmwSKgLAB116ZEDSXbuZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB8i8xrmXEeDehc2IQMPXP9LDO/u1V2lzZamuNyzAvk=;
 b=Oshh72qVq3F+F7SFhRfE6M3vr/uda6aCuUm4rvuRufk94HY3Xrxy1uCLALsyhGgwRXMiwPJPHTOKYPYQZ/8x5YxIE3Svtqd0B+8U5xAdozNhaEcfMUiAXVVsoFQK2pQgBKudsXVR8QHNGQDLXHl2GCmVtOpLQWtiYcCPgkwqqTQ/uy0zjC2zpPwz0hfZCW91MnbpUHuf9FKMUWw+QpGiBT8t0DTmRr0dgdCBGiMdD75oqk7kvEWWTekTMD382WSjCdlsO9v0H8uMU1mKrM+pUge8zMZLzwkJjui54314lunzE2Supu+WMh9fzj1ElGXnoPTtJExI4VZxohJJJC07EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB8i8xrmXEeDehc2IQMPXP9LDO/u1V2lzZamuNyzAvk=;
 b=jUARnzt6JNFptsFG9hgOOC4rtZAcxBpY4/TCDXK2rk6VRpRHSTOsY3p/sAr0ylViuCEVl6dJwAX4U8iD6FEef+Y1MJNPkFUFPRCsw5Pp5dbfcgbXrLOVHzxI89ZHBLKtcNbbRBIAxsEVViOz4oqNmolBy8XNyBRj2aZ9OPkrOtU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8667.eurprd08.prod.outlook.com (2603:10a6:150:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 18:53:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 18:53:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jan.vermaete@gmail.com" <jan.vermaete@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-pyproj: added native +
 nativesdk
Thread-Topic: [oe] [meta-python][PATCH] python3-pyproj: added native +
 nativesdk
Thread-Index: AQHcLYRAz4NC/MHdBE21+s5SMg4yf7SirhYA
Date: Wed, 24 Sep 2025 18:53:58 +0000
Message-ID: <45A18B2C-FA43-4EA4-8E79-102E11E5C092@arm.com>
References: <20250924185113.40093-1-jan.vermaete@gmail.com>
In-Reply-To: <20250924185113.40093-1-jan.vermaete@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8667:EE_|AM2PEPF0001C70F:EE_|DB9PR08MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: 231d8177-dc06-483c-d484-08ddfb9bd4b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?akc3Y2FLRXY5MFJQbXVXYTd1cFVIT293d25LMnFDVmhuTmJYdC8yK0xvNmNP?=
 =?utf-8?B?RDlKSTlvRzFTNmQ4VnBiSk50cU96SVR4OFJRVEc3Ym0xUUxpdTN0Slh1bkxK?=
 =?utf-8?B?cFdnam1HVmVEdkxFeHVHTnd6WWwzQ0xiVHBaaXF0dy9WdHAwZlplcDgrVExm?=
 =?utf-8?B?QnJibFhtQlhNb3RtL01DWGJITmZ2TTJ6UU5POTJnektnN25vTFl0aVMxL1pi?=
 =?utf-8?B?WmpMODVPOTlFMjZrM0hKa2VuUXJJUjNXUnRqMG1HVTJHRWFDR0NnUlRKVUo1?=
 =?utf-8?B?Q2JkR0dWNjUzcDJSSWhDcjJPaWN1cmJ4MmxSM3ZPNiswU0NyL1lHcWlkTlBw?=
 =?utf-8?B?Nnk3N1VZbGhRcTdRK1lrQkNSMUsrb0YxaGJJa0N1WVdvQWFlek9tRWVRNm9r?=
 =?utf-8?B?bTFUVnhXalAwdGhVN0dYc01LSTQ5a3NLL2UvbHl1YzFMck5OWkVvT0pCcnVn?=
 =?utf-8?B?b002UVRoYzRKc3dmcGxKK3E3a0tsL0VLN1RST3lrRjJoRmVTRnpFVmFvTU9j?=
 =?utf-8?B?bzR1UWs4THd5aFdiMkc1VTd4WlMrWDNYc3pOUmVMakVZeEM5RUtqQU05YzFj?=
 =?utf-8?B?MHVaU0wwS1ZtMDBwd09PanJYNjM4Yi96WEV0ck95TkhWTVUwbjZZMHJ2MXAx?=
 =?utf-8?B?QTZxZllZQ3Z5OSt2eFRuMkN0TWw2N2o4TmxzTVBYQk1jSmJSek9JQXJjVG50?=
 =?utf-8?B?QnR4bkJEekFDWjcyUjdiWnF6L2gzc2k2eTU1enFCNDBVc2tyelNIWXlxSDUx?=
 =?utf-8?B?ZUhKcWJiSURPb0NWa3hnWjhGcXFDVVVIVDR4NU5ZekVrWFFzVGkvYXFEOXNS?=
 =?utf-8?B?VHV1V2RmOUxYbFlSZ094dHV2aGN6cklLNnhqOW5aMGxlZHhLOTEyL1VxL0pk?=
 =?utf-8?B?bHFmS25qdkZhVEVpUFhUNzVwejVtWWtBZ1cvb3R5Q2RxNjBOY3dZZWpWOHZC?=
 =?utf-8?B?ZndLRlNiZHdzd0RpZnVtd2pZUitmaEF6UHVzei9VcHhLS3MrMjlUczYrUDRM?=
 =?utf-8?B?bmgrN08rVEJYYVpXVmRyTm9BN0ZCNnJtSjR5V0VUQVlPdWdHeXcvOFJuMllX?=
 =?utf-8?B?TVBZeWluS3BRRkNFa3hKd0JzUDhvNnN1dVJpNHJzMEpmYURjZENrYUtVWHdH?=
 =?utf-8?B?cDlUcDlSV25PU1hodERPbDJWcTA5bXdLNkhBMm1zQWFUY2hDcTNuRVV2TEtD?=
 =?utf-8?B?ZWFIRnhxTnFGVVdNOGl0VzhpdWtJWmovY0Z5TVRoc0hieWRkem05Vi9wR1N6?=
 =?utf-8?B?OHM3blFsTVhkQ0prSGZqYy8yZUI0YzhFQjQveXZzUFc0d1VTRndDWFJyb21p?=
 =?utf-8?B?Nzk0Wkc2WFhOM08xMVB5L0ltYWJzN2x6cWN4alRMWXFOMFpRWHNiR3J2dU9G?=
 =?utf-8?B?dmtEek5CTjFVZWE2ZGZUWmE0UlNPWDJoTjRYS0ZzdjM3U05uUjczZjhOK3RW?=
 =?utf-8?B?aWltZXVRZDdGWUNTcnhRWU5pSGxXNk11NlJ3Z09IeEZRZ3NZV3phYjhTTkNy?=
 =?utf-8?B?ZEhBbXU5NVAydjNzM2VjSE42Qkd6ZDJsV2d5N3RtLzRSTGxBREU0aFgxMFpi?=
 =?utf-8?B?ZTZEMTJEbnpRdUVrWUg2OXhWTVk0RXJieGtEaWN5NlN3cWJrTkpWMjNuRUFT?=
 =?utf-8?B?M2dKdGlNSHZvZWpWZW1pU3pxeWtXcmxOVTVieXVrOWZoN2pmZXFRRndNdXR1?=
 =?utf-8?B?b1QzSFphckxwdCtVR0lDV3BkWDNLZ1FOV2ozWWlFbWtkWTF6dStCclFjTmxD?=
 =?utf-8?B?OFF3TEZzMUNJZDl3WnhQekZWVEE4RTNpUVJ4Ulp2SnBwNHZPVFNSYVZtQWFj?=
 =?utf-8?B?MndQcGNaWVdYVlJhZGl6Zz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <701E5B4F229C37488E9A8C9A30EF2919@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8667
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef6e9c2b-359c-4236-bab0-08ddfb9bb852
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VklBeWgrQ3JmNkN6NXFXalBBSlhmOFVUaTlNREM3NGYraFlMckNRVHNmOEhN?=
 =?utf-8?B?cU8vZHF1Vm5URmZTUmdhTGZqelJmaGZpZXhjRW1lOU02QU9iQlZLSm9pY1lD?=
 =?utf-8?B?UDJyRzVtd0NUWDVoRTNSNFVQNnRIQ0NPNHgxaktXTHRicUpnTTNnWHZSQkpN?=
 =?utf-8?B?UW96SnJpY2RWMWtCOTV6Zm9LSXp1b3cwa2pjQjNMZEZ0MGhKVEMrQ2NndGNq?=
 =?utf-8?B?ZG53TXJUaFdON3dHeElnTm13MnI0Q01hVUNGUTR6eDNKR0NVSjNGSFhLVWRi?=
 =?utf-8?B?dlFsZjhYTzdUaFNXeTErelpLa0ZZa0J1eU13RWh6dU9pS2FYUzNwTXl5QlRB?=
 =?utf-8?B?cUF1aVFxc0ZnL3UrMGpXTUt1czRCQU82c1lQdGV4cExSV2s4a0ZGdTZ5TzZD?=
 =?utf-8?B?V285bFNPSTRTVU5LZ0hCemtaTlVpbWF1YjNQSmI5UEVqNjlpcEs1WEF6ZFln?=
 =?utf-8?B?NXg3OG80ejJvUEVJNk5NNEtrQmhJc01BQi9Say8xMEYvdURFUXBNSmxtWGpW?=
 =?utf-8?B?ZFd2dVdWdmhHS1FLSGg4aDhsTHpEbkdMU0NWNlg4MFB0UzQ5UWdsd1RDTlpZ?=
 =?utf-8?B?U1F6ZkFyMkFPb1VMVXVpMlpMMzlVVkgvR0ZpcFFPNEdCQzlWejJpZDdTdFpk?=
 =?utf-8?B?NGtjVkszVW5TNUkxa3ErY0ttOEtCMFlEUjQzcG5NRjhNU0Y1Mmcxb1c4OHVW?=
 =?utf-8?B?OG9pZU9Nc3E5NlA2cmtsMExibkU3Zkw5V3g1cTVhNm9jWDBUWUp5QnpqK0oz?=
 =?utf-8?B?aDZhR2h2QVgxQjJYTmFvZUYyRmdwS2ExamkxWHF3VGdrQ2d2R0pXUGxua0FR?=
 =?utf-8?B?eWFyNHBiK0lreFBQSnE4MndOcHRJbUJ6b0lwL1BOaXNXU21VVTN6WnVpTWh1?=
 =?utf-8?B?R0Y2dTFJdEkrNnRZbWNyYmFMZHVmcEp5SSsrSjJWbE5uSDBBV0VsOVpzVnVt?=
 =?utf-8?B?ZU9KMkgxdDFRL0tIUVp4SWhYc2tkaXNrejR6TVNLL3dZZEpwRUREWEVVcnJT?=
 =?utf-8?B?UmljMXJQNjNZKzN6TUgyNzhmM21MWElUcUpzMkN6OGR3ZTNFS0tTdlVDYW1S?=
 =?utf-8?B?bTJXNWxwdjFsYktsdWVqa3VQY3ArckZUTzVjbEdYY1B1em8vM3lOWWx4MTlC?=
 =?utf-8?B?a1NQaWVpMUVOWEltNG5sU0RLVUsxZVY1aGNxQ2VCTVpLRGhuV29MWXZMd1ZO?=
 =?utf-8?B?WXFnYThNRk1GWGRvWU94OTBFQlBXNjFMSlVVNE5WcDlDNzE2dXBhOVNtc2ZP?=
 =?utf-8?B?MFpmbDhReEgxRm43MmxNZFpUS1VLNStOTEIxWnZUQmNUOHBFTm5GQ2hYU1dD?=
 =?utf-8?B?RG9mTVo5NEFaR2ZPQURQMnY3dkdLN1JpUlRVSkZwTjhqYlhJRmVxd1Y0UmRt?=
 =?utf-8?B?dDF4dnV1dHN5dFc0SmZJcnp4dXZkbnZRY3lEc0VROEpLclpKU3JHdHlFVmlU?=
 =?utf-8?B?azVkeEtWL3VQS2ZoNE82c0pnZVFGZU1QbDVnRkJQZExuK0RCeEE5VmpOZmt2?=
 =?utf-8?B?b1RhT0Z3NFJyV01WWHRBUURZdGdydGdFUlBqZmNNTnB0WXY3QTcvalZiMXhQ?=
 =?utf-8?B?RFpMTkNuVGZDaUg1TGh2Y25BOEJrbFZ3RzcwQ1RCenplYmJ0NG9iaE1kYmdZ?=
 =?utf-8?B?WDBzWnFSQUIwcnltRWtUTnd1V0Z5bEpyR20wM1Q2b2ZHR2dZRzJrQkQyaFJh?=
 =?utf-8?B?eTVhbk1ZbENyZmJFaGRvdytvV2dtNGZVT1dpYkZXQ0lpZWplMjlEQ0JhZTJV?=
 =?utf-8?B?cjBCVStvZkxBSlhhWHRTL0pVOU9JZUlGWjNjOTI5V3pOVXhGNUxiMmtzK3pv?=
 =?utf-8?B?bjdMNWljQ0Y2MkpZYzhaZWlkZWgwM1ROWGQ2ekkzU0xLcFI1RmhRQUFEMnk5?=
 =?utf-8?B?Q3dSbXhWY1ZjZlJ4b0h6Z2IzNGc1Qm9jcHJmTHRzRnFETkdxeUFXYU1ZczV5?=
 =?utf-8?B?MjErcDdoSXljd1BPMldsQXhiTDZLRmxkcTZWSkdpb1B6UzdHNVBNRW1tekJV?=
 =?utf-8?B?S3hDR1FBR2RveTd4a1RyRDlaNzRoMFJiOWQxMXozRmhiZ04wanp2b1NxdGZF?=
 =?utf-8?Q?I8PsYE?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 18:54:46.3464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231d8177-dc06-483c-d484-08ddfb9bd4b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9705
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 18:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119830

T24gMjQgU2VwIDIwMjUsIGF0IDE5OjUxLCBKYW4gVmVybWFldGUgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGphbi52ZXJtYWV0ZT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtCQkNMQVNTRVhURU5EID0rICJuYXRpdmUgbmF0aXZlc2Rr4oCdDQoNClRoZSBp
ZGlvbSBpcyBqdXN0ID0sIGJ1dCBkaWQgeW91IHZlcmlmeSB0aGF0IGJvdGggYWN0dWFsbHkgYnVp
bGQ/DQoNClJvc3MNCg0K


Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51B2CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:09:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4847.1755767370615919390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K2jCX+hd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328e38336=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L5Fu3n1890735
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=YQ8HuP+AXeP+Ce0igwXRMkrMPjAQCce+6Yjh4ysNy54=; b=K2jCX+hd+5Cy
	8Gq+3LsFmXnAtg6Rjd8SAtgIWhYOscLAdYcZVNe4V4n1Pbv1KM5iwgJnhk6a8jP1
	itwixhUhA5zIIXs2w8UwQHSeSH7Fg/YMGKm63Fafh9pgDxDEDSScNcnX73dYAePT
	d1HmvaLln1ENbzp+fTBpITyopO7IUHvtOoqDpfh8Izgj/GEgFo3tHFH4p+HPFTru
	I1Dt0sIAtqwqzidcDcTxfQRIIxel2Jf9RKc+IGIjg6LZSzwotVPRQp3qzH2kLKtH
	BZ1aYGgOyW6u9X/b9P6TihiG2mwK0Fe0mcCqv9882MCja28Wh1pQgQOWw3mpY7xf
	shFkF2kF1w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjs51k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:09:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEjO4jzGVYLG1m3S+vXEtwHs4qCVl2u9y5qSz462W1MOCM25uHapn1Go9gaMBTYBnVLeJtL7LjjwSMjhQHznnbCxOmX99s910SB2U+8ZvTiTEIC2bWagaxnsviTcbYJbHBuOUAFxtCzWBnrKajxIjR4nUpH1VFuNfKUTnmvdHcbBbXyOB02p9zbu3ccYJeInZr6pUU4VOMOClqV+XCM7y7K3YfWkE8av3XpGq36v7mUXmyn2sSrtmvckrRJqKOzP9wXxsPDMQpJ+qKwkDWydOF3P4e2UBfW6hVnOx1f9H3sD7kN+fqMRGZwv67w9hu+ve94/HotKFM9AeLhcn/RGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ8HuP+AXeP+Ce0igwXRMkrMPjAQCce+6Yjh4ysNy54=;
 b=ajQEOEm5PEDZnKMRh0j2oahrjsf8oj84YU4Ny/F7AoRhpFKefcyRNe6JNucFmkznVSDWU5NTTTJcruUDbiyKOwLANR9YLyYOpLIO+obYxpTieN2qvpOd30YQdG6fJGwr+eF9C21IRKZhygWiVgtkuI8noxXfWTwI/rF19Yd9TFMD2Ep0bBRqKZ9BKiEGF0taIRUwFMlvVmgXe7LkzCGddZfZ08DdxZbjOvJk0HvimVQmlejczXc5eXhP8QiwFoKd4KM5HmCCH7zDJShMggRIenwHGNa8VbXMa6eO4Z2gbWB010V2A3qDdD8ZhN7xW5tB0JGhMuJRXSEXJZxgG6q9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 09:09:24 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 09:09:23 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] openvpn: change ptest output format
Thread-Topic: [oe] [PATCH] openvpn: change ptest output format
Thread-Index: AQHcEnn5lKg9WQByI0qzHXwj0G2VWbRs0VkA
Date: Thu, 21 Aug 2025 09:09:23 +0000
Message-ID: 
 <IA4PR11MB9420D4657F4F0DCEBDBB1E8BB832A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20250821072502.4137334-1-jiaying.song.cn@windriver.com>
 <8d0b06df-0452-4007-a8e6-618f5e1decd6@gmail.com>
In-Reply-To: <8d0b06df-0452-4007-a8e6-618f5e1decd6@gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=e2d75a9f-f5b9-4110-b3b7-1d61426beae8;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-08-21T09:08:25Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|SJ2PR11MB8421:EE_
x-ms-office365-filtering-correlation-id: afc74a23-a9c4-427a-7bf1-08dde0926c09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bXBZTEZscjFSK3VQM1ZNeExmdS9CNExRWW5ZbG10Z2x6a3VzenMrUXdYUTY3?=
 =?utf-8?B?a0VzdTBHYVZXMmtBZWJJaUpGWUcvTmQvMTVWSWJxUjdpTE1NS0JaQ1BqaXhJ?=
 =?utf-8?B?SjdFWENselZSMDJuOXErZ3N5a29tMmJTZThhc28vZzJUWk9KNkh4ZnBVNVlS?=
 =?utf-8?B?bHI5OVZvaXdMRFpKUnFJUTk3YWw2MFJBYi9LamovUFBSZmVmYnByQXo0NUV1?=
 =?utf-8?B?Z1FtK3FvVjU0WDlXTnFlWjNFV3dWSlBOUTgxWE9ObjJkclFhekJRd3piUDM2?=
 =?utf-8?B?UTVKODk3Rm5hcGVKZTA5ZkVxWG5PYWoyNk5WbEJ2d1VFWkRGVHhPUVE2cjNS?=
 =?utf-8?B?SzV3bVd1THVITDJaeDFmVENua08zYkdaY0ExQmF5UEswbzVORHJlcWdLTWhm?=
 =?utf-8?B?Y2JSWjVvZkVXeTl5a3VkenRiY0czL1J1K1VzSUZ6MFVKbkJjam5rSTlTUHlp?=
 =?utf-8?B?cXIzZWlNREdBL0oxOFBQU2dTY3NJeUxPTzhFV0hFSG9NTTJ0MXQ5N0xVNklE?=
 =?utf-8?B?Rnd2ckRXbllzalRCbERTVnJyY2cwaDI3UDJQYXl0OG85QnE4Y3E5NnRTMWxS?=
 =?utf-8?B?THR1NkQvSCtVSUNMUnZ1TVVUYVY0NGRLS1l0bUJmQlNzVklKcWRRM2hXZXBT?=
 =?utf-8?B?RzVzOFErYXo5aDhrWnZFU0NTQUYxNzkyRERteDNacWl5M3dCZTgzQ0JPTUZo?=
 =?utf-8?B?dGlGTkJuVW93YVBYYmIwU3RTbGlodGxERDBudFpEWm1jWVVNcmlyUEdmOXhx?=
 =?utf-8?B?Q1lXZFRUNElFdjE5RnhBdENmdXM4VVRCSGlDWW5UdFR0djhpSzJVZys1SUtP?=
 =?utf-8?B?dENYQmQyS216L0lGdGQyRWs3VXRtZUtMUUNuZWxkZWxRMUlSeUJUMWR3QXFZ?=
 =?utf-8?B?dFpLWTJDbStyVVlVWkxzTERmcVYwUFdGd2Q5K093TEVQRXRKcUgzMWhMOWcw?=
 =?utf-8?B?SlVuK1Fhb0lHdFR2WlJ5Z1p2SXFGQ0lTZnQ0dDBLaDROQlVKZkRzdWF5anFy?=
 =?utf-8?B?aTRhSEJsajFBSFA2aGVzS1VHbGNqRCsra0RMcVFPYm9tWFRaTWVoS2JOUlZk?=
 =?utf-8?B?MnYyMnpnak0xS0J5ekJFaDlyTnhwR29wL1ZsWkJOTVZHY2NQa1pscFpyU2ZL?=
 =?utf-8?B?eUFJT3FGRy8wYkZ5V1RoVjgrM1FveXZ5S0wrazcxK0c0S09tQ25EenAzUmQ3?=
 =?utf-8?B?MVh1RXRCbk1HWDBjTU1RSmdnVzJ1ekk1a0VRNyttM1hoTlNpZTBvYXVnTjVv?=
 =?utf-8?B?OVpRcm5YK3doVTVNT1ByVVc1eHROTlpNN0R4eXVwV21nWWxVZHdlUHlCMjVx?=
 =?utf-8?B?TXpOTllEbVY1WllsbVhKMC85S0xhRmlMdmRaSS9HN2hHU012UkppTXFvWVBK?=
 =?utf-8?B?OW0xQ1hhQlpGRFlTR0VMZ3YxOXlVTFUvNTlnbmQzZnVGSnRIclIzYzVyUzhr?=
 =?utf-8?B?S1ViMU52UGpKZlRXcmkyY0MxamNoeExsQklUeDc3TVNRU3k4UG1UcTRyZHpp?=
 =?utf-8?B?TDJMSWxGdEp3SFBnT2R3V0EvUU9jQ09ueEJOaGd3djhzWjBCZ0hZaWJyL3R3?=
 =?utf-8?B?V3dnYTFPUlNYeDI2ZWJDZ1FTRms2U1N4ei9yZUFJVUZWTXEvQTNwbzlGZWxS?=
 =?utf-8?B?VW1ERGJXUjFpa2JXbmhkS0liR0E2T3NOTXNjYnVIcGVnQVZhMDNPdEtqd252?=
 =?utf-8?B?LzVWb21MR1B3SWVLczB0QW5JZXVIQ0tXamRUVC9oaGFVbEpRZVg3ZDRoVTZK?=
 =?utf-8?B?dXNZUzVsNlk0cUNiTjEwNWtqVDMvZ0NKcmJ5ckZ1NUtWZGlCcnNMcC9Ub1RN?=
 =?utf-8?B?clVyU3hkdTA4QWxYYXF5L1d6UmU3dHp0YmpXMDgrRFYzU0V5SjE1anc0M1d6?=
 =?utf-8?B?TzhiRDA5QmpTRy9nQ1NoTXJWYWRhT0NVS2dETUdxWll3MEVBR3ZoUjVCVjZy?=
 =?utf-8?Q?ADpZd2liN9Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1FPWUVPaHZpMldxMUdMeGUwQmhnTVpUeHlPZ3lpRXBRNFlMWHFxV1BVOUtR?=
 =?utf-8?B?cVJxTVZKZ0lqLzdRMWhUQVpoazlBd1JKaFBBRHM3Z2dKT1NTYURpRy9uVGE2?=
 =?utf-8?B?L1NLcVpFazEwUDhHVmQ5Yi83YjBDZUhNZWExaGJHR05kNnBhRVpyMDBoeE1O?=
 =?utf-8?B?clF0MllQcU1QY3BtM281aE8rRU9UVlpMalFVdWhqRHkxRjJZVlFjWUlWRVha?=
 =?utf-8?B?QnRQVWxxTkV4M0RhcXVKZit5Ui9Fclh3TFYwNFRZMkxqNUQ2dXJzdGplWVY4?=
 =?utf-8?B?VGkyTjZCdHhVRFJHc01IU2JQZUJ2YTc1TlRIdTRyUTdHWUlJWHhBV2NkOTAy?=
 =?utf-8?B?Y1p3Q3Ard0E1Q2xpRHVLOVJmdjZnUDRHOGJCNzBvMDBhdWxyQTBOSzNPMDhR?=
 =?utf-8?B?aUdlSXgvcDJnTmw0bDN1RWx2Z2hQdDU0WkJUaEIrT2U5aVFWbkNJRk9NYVpq?=
 =?utf-8?B?azZlRklrWXlOVitmZlB3Mk9XeEo2NzAxdmtib3cwL0JCeHFoREtYMGdsVEdM?=
 =?utf-8?B?OHdiaWNpVmRnTUFvR0Z3ZnpGcmk4V3FaVmZlMmtOTEtiK1hwVHY5UldxY3Zu?=
 =?utf-8?B?K3JPK1BpNVo5Y3dFOEpSd3BuYXA2SitoUWtOTzl2MjN2SkhxYmlIWjdCcEVr?=
 =?utf-8?B?b0VqT01XWjd0RCtyeFhia05qbE93Z2s2ZkZSdk11UW5PR0VBM1FWMkpJTlNv?=
 =?utf-8?B?Q0ZRVWlzTitkS0xJNi91bkNtRDBYd1hncWhEeFEwOHZBMkNVbG1wdlZkWTZM?=
 =?utf-8?B?UjJNWktValBwLzcvekw1VTE2WWN0N0dzWXFYalpQWU5obkdQSHlZTUJzcS93?=
 =?utf-8?B?WWp5N1M5cFUxdVVMbmdZaS92WExKWHZFaUludlh3cmR2WVZsTlBIRkJTYzlK?=
 =?utf-8?B?Z1IvTDZmaUtFZmlFZy84V3BLbThzb2h3MmtpSlRTR00xSEt1WHVGaHhYdzUr?=
 =?utf-8?B?SVJwa0Y2TjNtV1NoeGVvWGhUVklqZFBTK05nVWVtWHVza2NiMXNvMC9PaFFQ?=
 =?utf-8?B?NkM0ajlUU1ZSTW9Eem0zT2JCNE1XM3J4RHhJSGlsanFDYXRsSk5vZ1JGbUtk?=
 =?utf-8?B?Y0FsWWh4UUg3TDA3eXRTT1ZBTHdNVHpmN01uOWNRM25WRThPOXp6V2luZzJX?=
 =?utf-8?B?REF1bS9WdHRiR291dk1nc05Id2xrcE5oTnpzbmsraVZ3V3ZocWpsUnl6cmZH?=
 =?utf-8?B?cDd3QlUwVmhSdi9nOTJkWENCNXcvV3R2M1hGZ3ZMTjNTNStCZWVJWXJ0YXd4?=
 =?utf-8?B?ckpkUjg4T05HbXNBOXg0aWRxdmZMUWZ5RlJvSlVIV2lDVWlGT1BXYUM0YjFN?=
 =?utf-8?B?d1laWmVTeVVnam02NXRhckJqRSt3YTVveXRLdk5WM01mRFdYKzN1SlIvLzRa?=
 =?utf-8?B?T1VGMDZFL1VPMW1zSzVNZWFhWjNGTk5Xb29mbXBzQTA3ZHpkNHdhQWUydHRP?=
 =?utf-8?B?Qm45NTN2MmpYdWdvUnl5UTUwcTQrMjVodlNEendZeTNVbXo0RFdtbGhjMEYx?=
 =?utf-8?B?ZUhGVEYzcHJoRnBPbnZRcGluakNKK2RlRlNWYlRqbzVyeXZFTnRPN2pDS21L?=
 =?utf-8?B?RTlFQTV2V0I2TEZYZDk0K0pmM2FuQ0o5SzFrd2FId0ttMWNIVGY4NnFQMzRk?=
 =?utf-8?B?Q2IxeHNmSzFZaC9YcGJHNjBhc0RmNDB2emc2Z0YwbjFRWEc2S0JwZ0ZOc2Jw?=
 =?utf-8?B?UlhOcXVRMVpPUS95dERaSDRmYUlWUUVoWkJkNGl3N0xhMk5vMTVZekljVXhj?=
 =?utf-8?B?MTFyVmQ3anI0anVQZ3dQWlNsRlJtbzdMREgwKzBoSkw3NWhXa0Rya2hzWUp6?=
 =?utf-8?B?S216UDRDcmFiQkhreHpGMkFzcFYzZGRNNTRTVHNqQmJOUGI2NjYvd0syWlRw?=
 =?utf-8?B?b2V3dExjalVNbE9FSGpYbmlFaEdoRFRoaURGdzJlMDJ4RVI3VENiTmhBZDMv?=
 =?utf-8?B?UnpVc1V2NEZiK2FxcnBYNkVjNE1ub3h1YTdtcGs0V0dSSFFaTGpER3lteFh0?=
 =?utf-8?B?S1J0cU5OQnVHMlNtcFYzRmQzcDZOdko0M2ZzeFR1RWtLL0FmTWtaRWtybEFv?=
 =?utf-8?B?KzhXbWhGWGVZazVqQjVzZERnZHBNTWlUbHdhTU5neTNkRHlPcWdRQkFNUjVx?=
 =?utf-8?B?cHZwL0taVWNUWGhZaFUzM1ZBVkljT0Q5Tnc4RmpGNC80OVpqRW5iK0szbzhv?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc74a23-a9c4-427a-7bf1-08dde0926c09
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:09:23.8314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0snYqPxg+uNHpF8R1wHXM+KKExMP4j8Xycm9fzlrq9U9lN0BnP4udoxgmaoGOd/WxhyKFu5dDZBZht4jwdxulUo1qqH2clkCrVip1VvJQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA3MSBTYWx0ZWRfXw9Cu4zVbmbXi
 fyfFtFF2ZNyx/mDOwaUABWBWTWdTy/+Q8eA7xOB2vDvF2dW4sNNSDZvteqHeEGYtfzYb5a0vczP
 2gqKJyZVNUCzLZm7kMR3V5kw4NOWaWD1t/H37RfEkR5KoJ4aFFCy0ZfpBxgKoAc6UVrY7RlRpR2
 if3BmyWrLeVjcronOJXMBdTYU6I8+7E0PEF86LNP8O3xNJMBYFUUYTomHiagHpaa+4RK0+OP3yV
 nkrnDU9bhMNqNl3PGGynyP1hNrICXtTeShUwRg8MlUQTpapF/IN4fB9uG9D4BY+TvyiqlyA1OAz
 jatTvqeMoDZVSgk5b0QPej3UhBmTBWOkJrGguhpfd/RsqYjDu81QBqSs+Raa2Mwg9SOgeYBGURj
 EbWuXJnIHPZZ/FD1W82W6D8Q8mFFvg==
X-Proofpoint-ORIG-GUID: g6peIpppN8kwrCUsENLadpAxIfxyqHLf
X-Proofpoint-GUID: KAUiWVRKlkPADLfjRBynoDQl_mq0qz7A
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a6e249 cx=c_pps
 a=wXKYqXrYrdG3p53l3ks0vA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119073

SGkgR3lvcmd5LA0KDQpUaGFuayB5b3UgZm9yIHRoZSBub3RlLCBhbmQgSSBhcG9sb2dpemUgZm9y
IHRoZSBtaXN0YWtlLiBJIGhhdmUgdXBkYXRlZCB0aGUgcGF0Y2ggYW5kIHNlbnQgdjIgd2l0aCB0
aGUgY29ycmVjdCBwcmVmaXhlcyAiRkFJTDoiIGFuZCAiU0tJUDoiLg0KDQpCZXN0IHJlZ2FyZHMs
DQpKaWF5aW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHeW9yZ3kgU2Fy
dmFyaSA8c2thbmRpZ3JhdW5AZ21haWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjEs
IDIwMjUgNTowMCBQTQ0KVG86IFNvbmcsIEppYXlpbmcgKENOKSA8SmlheWluZy5Tb25nLkNOQHdp
bmRyaXZlci5jb20+OyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
U3ViamVjdDogUmU6IFtvZV0gW1BBVENIXSBvcGVudnBuOiBjaGFuZ2UgcHRlc3Qgb3V0cHV0IGZv
cm1hdA0KDQpDQVVUSU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBl
bWFpbCBhY2NvdW50IQ0KRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KDQpPbiA4LzIxLzI1IDA5OjI1LCBTb25nLCBKaWF5aW5nIChDTikgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNu
QHdpbmRyaXZlci5jb20+DQo+DQo+IFRoZSBmb3JtYXQgc2VsZWN0ZWQgaXMgdGhlIGF1dG9tYWtl
ICJzaW1wbGUgdGVzdCIgZm9ybWF0OiAicmVzdWx0OiB0ZXN0bmFtZSIuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5jb20+DQo+IC0t
LQ0KPiAgLi4uL3JlY2lwZXMtc3VwcG9ydC9vcGVudnBuL29wZW52cG4vcnVuLXB0ZXN0ICAgICAg
ICAgICAgfCA5ICsrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVz
LXN1cHBvcnQvb3BlbnZwbi9vcGVudnBuL3J1bi1wdGVzdCBiL21ldGEtbmV0d29ya2luZy9yZWNp
cGVzLXN1cHBvcnQvb3BlbnZwbi9vcGVudnBuL3J1bi1wdGVzdA0KPiBpbmRleCA1YjE4N2Q5MDg2
Li41NzJlOTY5YWRlIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBw
b3J0L29wZW52cG4vb3BlbnZwbi9ydW4tcHRlc3QNCj4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtc3VwcG9ydC9vcGVudnBuL29wZW52cG4vcnVuLXB0ZXN0DQo+IEBAIC0xLDUgKzEsOCBA
QA0KPiAgIyEvYmluL3NoDQo+IC1mb3IgeCBpbiBgZmluZCAuLyAtbmFtZSBNYWtlZmlsZWA7DQo+
IC1kbw0KPiAtICAgICBtYWtlIC1DIGBkaXJuYW1lICR7eH1gIC1rIHJ1bnRlc3QtVEVTVFMNCj4g
Kw0KPiArZmluZCAuLyAtbmFtZSBNYWtlZmlsZSB8IHdoaWxlIHJlYWQgLXIgeDsgZG8NCj4gKyAg
ICBtYWtlIC1DICIkKGRpcm5hbWUgIiR7eH0iKSIgLWsgcnVudGVzdC1URVNUUyB8IHNlZCBcDQo+
ICsgICAgICAgIC1lICdzL15cKFxbICAgICAgIE9LIFxdLipcKSQvUEFTUzogXDEvJyBcDQo+ICsg
ICAgICAgIC1lICdzL15cKFxbICBGQUlMRUQgIFxdLipcKSQvRkFJTEVEOiBcMS8nIFwNCj4gKyAg
ICAgICAgLWUgJ3MvXlwoXFsgIFNLSVBQRUQgXF0uKlwpJC9TS0lQUEVEOiBcMS8nDQo+ICBkb25l
DQo+DQoNCkp1c3QgYSBzbWFsbCBub3RlOiB0aGUgcHRlc3QgbG9ncGFyc2VyIGV4cGVjdHMgIkZB
SUw6IiBhbmQgIlNLSVA6Ig0KcHJlZml4ZXNbMV0gKGluc3RlYWQgb2YgIkZBSUxFRCIgYW5kICJT
S0lQUEVEIg0KDQpbMV06DQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvdHJlZS9t
ZXRhL2xpYi9vZXFhL3V0aWxzL2xvZ3BhcnNlci5weSNuMjANCg==


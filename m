Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CB1C36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 03:01:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.311.1744167704777369645
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 20:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6194433897=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5391IAQ8009934
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 20:01:44 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m4fd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 20:01:42 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53931gFa030628;
	Tue, 8 Apr 2025 20:01:42 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m4fcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 20:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvQfc158X7sCkmebFn2Ablcq+v6qKT7Zc+SZW0P7xE+3ZpkndNYa6hBkOWc8/DiG/fujcSs+loWwUjRq5eGssYPHfxMUN0UEMrbUOxa2herEwMXHgPVEAkJ/5dtBrseglwTBjDfbNF/0Pbvqia3Q3kzIXzvf8e2lUahov6hQUD5PTsQyv2KwsJYJmnhFOQVNNU9JWCNorddCWEUR92Htal1Jy+ngSJcrEyewSzjCH2mhnPGygjzO5IXMugj14LpjfJt8W7y55dc4LFnMuFf4ir9RhGbk2RhWhmzFA/IIDPpQH+zKnpZVYcprb0o2hL72nmP8M1ZkqHzRrvmDhYtjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQi0tZW7XxxP9UnAzIHIb1BDOAyN1qBeHf5nJlaQH9o=;
 b=gE8kHqnxqPWmujl0G+DKEccUlLM2zqHNOlThFMoD7FUaGPgqMhHV2o3+CkSlKSe/2LAVqWn8oCIx7/G38gxbvo+cD07NUDn1/BmUKVPCP5lQecblaZKJjsz94Xu+zZUXONSQFIaDIHvTDlWHJ6o4cOvSX8WPv3uTLYJe7zMrCdwm7OO+cq9wzV4vDwyyvT+HJesuzze4PVvWq9JiqY7gfPXVMXF6dJBt0T4goNfc98D+tXNexPn8A9HLcsdF+OrTW3HsI8WsBYEkO80VDj4+jIRyeYdx/pd9aR1KdVfg4D2vXi1uUiaQOwBl0D2nMjIyfwiHLYU2ASIObPu+8bSRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9)
 by SA1PR11MB7088.namprd11.prod.outlook.com (2603:10b6:806:2b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 03:01:38 +0000
Received: from SA1PR11MB6917.namprd11.prod.outlook.com
 ([fe80::c4d2:6231:8e7:de2f]) by SA1PR11MB6917.namprd11.prod.outlook.com
 ([fe80::c4d2:6231:8e7:de2f%7]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 03:01:38 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Li, Changqing"
	<Changqing.Li@windriver.com>
Subject: RE: [oe] [PATCH] gcc: Undef _TIME_BITS along with _FILE_OFFSET_BITS
 on Linux
Thread-Topic: [oe] [PATCH] gcc: Undef _TIME_BITS along with _FILE_OFFSET_BITS
 on Linux
Thread-Index: AQHbpIAI04PCK7jfSkmUSwJDFMkqcrOaq7DQ
Date: Wed, 9 Apr 2025 03:01:38 +0000
Message-ID: 
 <SA1PR11MB691738462AB82747D6388427B8B42@SA1PR11MB6917.namprd11.prod.outlook.com>
References: <20250403094223.2339348-1-jiaying.song.cn@windriver.com>
 <CANNYZj95sE8Ajv1zaAMyvgKhTqmz4P0e7riG0_0ubRRzJqKs+A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj95sE8Ajv1zaAMyvgKhTqmz4P0e7riG0_0ubRRzJqKs+A@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6917:EE_|SA1PR11MB7088:EE_
x-ms-office365-filtering-correlation-id: 9adc4381-833f-43c4-63b6-08dd7712d8a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QXRsaUJ5S0QwRXR4Rjk1Q3FUclNzZWRnYW9qZUhlcmZTeWtCVXBnd1hrL1pG?=
 =?utf-8?B?a3hzOWI3aGNEVXE4TnBUdEh5cUREaDhpZHRidStmYTd0L1lVNzdHZm5PVHZa?=
 =?utf-8?B?cVRKREdHcjl3RFpsZDZTQ2piY2VXVFBrNEV3Uzlhb2RnTURMM05XbGpvYXh1?=
 =?utf-8?B?TVdMTVdlMXVrWi9GblVYRzA1MVZCQ3V1cjlNanRBQjFpVE1qT3VlK0tORnhB?=
 =?utf-8?B?MXVFTW9YUnB0V3BKWll4aXlGT0Z5ZVAvWnpiM0V4WnlPM2dWSWZOdDhwUkN3?=
 =?utf-8?B?bDRxUUd6RTZLN2xkTDdad082T2p3UERTVVRjWCtrb3ZBUlE0cWx3NEFwczVH?=
 =?utf-8?B?ZU1zZENOaFprcXhvOHdIeVNkWms5T2JmQWMzUExKeHBIZjBEdHBrN0Z4RHRj?=
 =?utf-8?B?WFdhWnB1SG80c1FrcHdrZ2ZxVk50YjlBb0FrZzdRQ25XVXVpdG52TUNlS3Y2?=
 =?utf-8?B?cnRoS2ZUY3VUbXZTSU1PMkhPbkF0L2RXVGxSVW9tSjBBTzNkaHNpLzV3R3I4?=
 =?utf-8?B?cWRteUxvVXMrYWJBcUtBdUVRVStiUzd2ek16Vys2RCtpekpUaS9vS3lwaFRx?=
 =?utf-8?B?QnlFUHRBVmxoajRjdVdPRnVDNDNZUC9vaGNLTCtXRThvTStoSHE0dUtheTll?=
 =?utf-8?B?eHJBMmlOc2E1VXRiLzJZd2pWUjBSS24rK28wZWl2R2xlN3Uwa21Wa2dUaE9G?=
 =?utf-8?B?SUFYdGVLNi9qbTVETXUwYS9xd21KRHBQSXlVbEI2amdJZXVIN2dDSUJ3M3k4?=
 =?utf-8?B?ZGYyYmdCWkpjc2dvY0VFaXV6RGFiR1k5R28xdllqSG5wWXNkOGVQc3Y3TFZJ?=
 =?utf-8?B?a29JRUJJU1B4aGtGTmJVNXl0RG9sdklDYnBySXl6SjFHUTRJaEdiSlQxMkhO?=
 =?utf-8?B?S0ZxOEtsQmxQSEQ1ODhMcllTZDVaM3RaelhMelhQekVNd3gvdkdBbTZDOUor?=
 =?utf-8?B?QUhxZjhUV2JiVFlpZFQzSkRNTzBKUWt6YlI5ZHhGN3BQMnNpdklROXM5R29z?=
 =?utf-8?B?S2FXRmhjMWZ6c1dDZ1NVL0M5MkVvM0h3VHpXQ2VncjFIUSsrNkp3QVFyeHZC?=
 =?utf-8?B?TlF4YW5ZYWx0d1E1UytONnlIOERCTVlWM0RXSjlOR3hVYW1heE1QdGNrSExT?=
 =?utf-8?B?ODlnanBRU2lDSGVRL3NUUktlZk5tV0F1YmJHelA0eXcvYWNvUjNiOElkSDJ2?=
 =?utf-8?B?dGZJZFJrR1FrckloVlVRUVhMckc3d1hZUDEzaTZFSjU1REhtdzdXV3VhZ2U0?=
 =?utf-8?B?S0tnNEMxTVB6YTFVTU00K1VDVFJBNUpaNGVQYzY3eGNsU2JlNWFuNWR0S09U?=
 =?utf-8?B?OFMxK3crWEt5NnAxUmx1cmxqb25KYzlwSU5EZVdja0c2aDRwMnNUcHdwc2R2?=
 =?utf-8?B?LzUyVXdneVBrNzkvL1FDTGpLZVpuckExQ3plMFY3TExMTFQwVlozazU0ekt0?=
 =?utf-8?B?b3JNVnZzbW1DaXVJMURjaXdTUGh2SDBBRVNHQ3JOM1Jvd2VZWmlNM0dVTTFp?=
 =?utf-8?B?QjRYTlRQWjIvRGltTGxBRjVGejNSZm9PaExEb0o0Njkzb0tzeFE0cy9PSktL?=
 =?utf-8?B?NHZsaDRlSnh5Qnphbkd4eHlpRzE4NnZXN0U0d1EyU2YwNDJ0dk5weFlnd2Ra?=
 =?utf-8?B?UnVsdG80Y0JrelVLYmU3bkRTT2U3QWVXYTFiRGhXam5hSm03YTdXZWJaUUZO?=
 =?utf-8?B?K25iZzBlU0VZTnJ4TDY3UldwZHJ3OWF2aXdYWFI3M05aenJVb2x0L2RQMmIr?=
 =?utf-8?B?aytET0NZRWgrS2QybnZ1eUQ3NDdCNDdIcFhCMldINXNsUHROSUJJZnpPRCtS?=
 =?utf-8?B?dy8xZjBxUzBtY2xKTi84aXl4SVFpM0xZT0F1TFlNWEF3Um5XRTIyNlpQa3lk?=
 =?utf-8?B?bG5DWHdtR1NNUlRZQy9oTU9JMVlVMkxkd1k1R0V2cWI3NitqZVNuUnRPUnF4?=
 =?utf-8?Q?gttsCFMJ3GbIB4cRnFFmNAGo/Om66HA2?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6917.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZTBWb0RycTBrTEZrTGVrQnIrK1ZpMUh0WWFWYzRsN1ZNNUN6bldFd1BQUlVi?=
 =?utf-8?B?WjRydlkwVHJ5RTFwd3ZkeTE0aldKRVlrZ055alV4WSt0a29CRnd5K3B5bVFk?=
 =?utf-8?B?WnViRmxqdTladWk3TGJCV1BMZDVpQldQOTZoRWNLMFRXekdKNmhzMUtEOUFY?=
 =?utf-8?B?OHZyZVVoRVFkTFkxUUtZZ1BBcHUxNEdtclBYZWlRRlppSFkwOXNZWjFXWHFs?=
 =?utf-8?B?dHZtYVFTR2NOOU9oaWNQQktrdTZFRVRoemRjTnpyakgzNERpU1lpM2NmbHdH?=
 =?utf-8?B?N1U1MkN2UGZVWEZqalozdVkrUFErSDVROElsQytmQ3E1dGs4UFhTMnVZOHA5?=
 =?utf-8?B?bFB2RElWWDEydnYzVzhHS0ZpNXV0aTlYRmkwNHQ5RGZNN1VhTllLTSttdzN3?=
 =?utf-8?B?SlpCVHJwc0I3d3NYMFVvTXpTeFFjbTN5NEYyK0ZWVVMvMTJKeFhaMVg2THFs?=
 =?utf-8?B?RFFBcFluMU0wek5Eb3VTY3VDa04rVmJ4ZTZVRWlBa21Fc01xVFBtazYvRUZ2?=
 =?utf-8?B?Q053cHFoTzhNWEZyR0NhYWdVcm4xdEF3M0E2LzN1YWljUFRHREE5RXR2MDNH?=
 =?utf-8?B?L2tEdExnK0lFK1JCd0V5aStQUWFQTUJyejB6MmxYSVgrNEloYnNnQklWdHlO?=
 =?utf-8?B?bHRFTWl2LzRNSTN1TWYvdVR2elZ5dDZMRFpTNjNnbk9VWUNKbFVjeTgvR2pI?=
 =?utf-8?B?RUZTSFRuUTZQVTM0Ri9aVE1tRWtUL3RMWmdGYVhkc2RJK2ZVbFJtRSt3cHpC?=
 =?utf-8?B?bFVmUlBlV3F3NVdSK2xBdjdJZG05WEFlMlZEWTBOSXB5Q3ZoUmxGMzhMVVVp?=
 =?utf-8?B?dWJkcnhHQnlLdWtXMHhhZGtTVDh1VnhXcHVtRVNmSE9Zb2pya0E1WGRiM3lO?=
 =?utf-8?B?Y2NNWUJBUkxmcUpVVWxNLzlPNWVJdUtQcHNLdDQrSmNlZWluRzhLc1I2bCt4?=
 =?utf-8?B?ZzVUQnR5UmRsRi9oQ2JVV0Vrd2FsSEl4cWpMRW45MXRaZmJwU01ZNGVQWVlz?=
 =?utf-8?B?R3J0Z1pHeGJoeUJJZDZtV2tNeXdGRzF2T3hlQ05WSTBvcXhtWUV5WVJkbEYz?=
 =?utf-8?B?aXNiMFprQXk3eUNSNXVNK3V1bmZyKzQxNVJiQ2VIZjVyR1F6b3l4TlBPczBj?=
 =?utf-8?B?azJtaGlEcHhsL29wLzE5UzNSLzk1NmQrR0xOV29YOUdWY1ZDTFJxQTZQeGJ5?=
 =?utf-8?B?ZmZtajJndnNHYWdYMzVpK0FsNk1tYWQwNUp0MUt1TXRWYUh2czJvMW9oSkRR?=
 =?utf-8?B?ekVkMTUxYVRzcXhCT3p2dEp5WHNOclNXbmVmRHFzb1k2TGdXRFN3dWhVOGdn?=
 =?utf-8?B?RmdxckY2MzUxeUtRb01yeHpkQVV6SlorZHBUQTJENnQxVGhVZ2V2blU0bURz?=
 =?utf-8?B?N0d6WGQ2VlAyNXppS2lZYllqRWhqMVJYWkY0QmRuM284SkUycXlOZmJYMi9m?=
 =?utf-8?B?UzlTajF5bktsS25BdFAxL0dNc21BaFIxVkJSVXRqQ3RacmNIZE9xaVFhRUtV?=
 =?utf-8?B?cWlONmJ6OUw3Lzgvd1VKSVg5UXhTYk5VV3libDZLOW1UWlNIZ1Zselg4bFRz?=
 =?utf-8?B?Z0gvaFlEKzNqcVNqMUJxZW5ZVHZ6SDNadEt5eVpNNm9YZmhtVGpBdUg0ZDly?=
 =?utf-8?B?RHF6V24vNTQ2ODk5aSs5T21IQUwwWUhDY1RvaGN0NE9BdTVUTTc4M28vMWV4?=
 =?utf-8?B?U1krYjJMbEVOZGhtZVdrNWs1bVlralFqSlBmZTJZSllrM2YzUU9ZczFMTVJw?=
 =?utf-8?B?VzZkYS9MQnpoMUFEK2dNNXdSd3RlYTMyZDFqd3hzR05YblZSbk9QVHFGVHlJ?=
 =?utf-8?B?MGVBS095b3QxdFI2QlRtRGlYVlNjbG1PRDg2VlM1SmVQQ05mWEV0K0Y3U0dh?=
 =?utf-8?B?K01kVU5BNHVUVGUzR3YxdWJoM2dPWmkxazlyVUNzZzVzd090RGVkN2FqOEJ1?=
 =?utf-8?B?Mm9xMDIvZzc3VHgrYUhFd01sV0JjaVhKdzZDa3hUcmVrdGJjTGNMR3Q1QWls?=
 =?utf-8?B?Rlhhc1VJZUg2MkJCYnA4N3VjRzBqT3FZendaN29IY29LVVN0cWtlZTVyalpP?=
 =?utf-8?B?Yi94bWhvVXY5VG9xS2VtZzViam5uSWJvcmJic0NNWmo4dDRKcjIzMmw5OWh1?=
 =?utf-8?B?cElrN3FacnBSUEgvdVBxa3NrN2w1NE96U1NRWURLUkIvTXFJd052YlNMVFRR?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6917.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adc4381-833f-43c4-63b6-08dd7712d8a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 03:01:38.3517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaJvbXaDpMv5aCyunmncDNboAP1v1jGmqqQwL2S23T9q/eVBjb6vR5C58TErh3zbJ89NI4TXk6bxNcUJGx6AT6cwKMNwl/TNI3cYplcPKfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7088
X-Proofpoint-GUID: _43GCyieNuiZ2iioyHlOWjLB49VUmfW6
X-Proofpoint-ORIG-GUID: dI35r9KRWT_dj1mQxm4P5VQbHplsDe6_
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f5e316 cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=52mdeZd8sWgJSgSe30wA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 03:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116721

SGVsbG8gQWxleCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiBJIGhhdmUgYWxyZWFk
eSBzZW50IHRoZSBtb3JlIGNvbXByZWhlbnNpdmUgY29tbWl0IG1lc3NhZ2UgdG8gdGhlIGNvcnJl
Y3QgbWFpbGluZyBsaXN0LiANCg0KVGhlIHBhdGNoIG1vZGlmaWVzIHNhbml0aXplcl9wcm9jbWFw
c19zb2xhcmlzLmNwcCBiZWNhdXNlIHRoaXMgZmlsZSBpcyBjb21waWxlZCBvbiBMaW51eCBhcyB3
ZWxsLCBkZXNwaXRlIGl0cyBuYW1lIHN1Z2dlc3RpbmcgaXQgaXMgc3BlY2lmaWMgdG8gU29sYXJp
cy4gICBUaGUgaXNzdWUgYXJpc2VzIHdoZW4gYm90aCBfVElNRV9CSVRTPTY0IGFuZCBfRklMRV9P
RkZTRVRfQklUUz02NCBhcmUgZGVmaW5lZCBvbiAzMi1iaXQgTGludXggcGxhdGZvcm1zLCBjYXVz
aW5nIGEgYnVpbGQgZmFpbHVyZSBkdWUgdG8gdGhlIGNvbmZsaWN0aW5nIHJlcXVpcmVtZW50cyBp
biBnbGliYy4NCg0KVG8gcmVzb2x2ZSB0aGlzLCB0aGUgcGF0Y2ggZW5zdXJlcyB0aGF0IF9USU1F
X0JJVFMgaXMgYWxzbyB1bmRlZmluZWQgaW4gc2FuaXRpemVyX3Byb2NtYXBzX3NvbGFyaXMuY3Bw
Lg0KDQpUaGlzIGNoYW5nZSBpcyBuZWNlc3NhcnkgdG8gYXZvaWQgYnVpbGQgZXJyb3JzIGluIExp
bnV4IGVudmlyb25tZW50cyB3aGVuIGRlYWxpbmcgd2l0aCA2NC1iaXQgdGltZSBzdXBwb3J0LCBl
dmVuIHRob3VnaCB0aGUgZmlsZSBpcyBuYW1lZCBmb3IgU29sYXJpcy4NCg0KVGhhbmtzLA0KSmlh
eWluZy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAzLCAy
MDI1IDY6MDYgUE0NClRvOiBTb25nLCBKaWF5aW5nIChDTikgPEppYXlpbmcuU29uZy5DTkB3aW5k
cml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
OyBMaSwgQ2hhbmdxaW5nIDxDaGFuZ3FpbmcuTGlAd2luZHJpdmVyLmNvbT4NClN1YmplY3Q6IFJl
OiBbb2VdIFtQQVRDSF0gZ2NjOiBVbmRlZiBfVElNRV9CSVRTIGFsb25nIHdpdGggX0ZJTEVfT0ZG
U0VUX0JJVFMgb24gTGludXgNCg0KQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9u
IFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guIFRoZSBjb3JyZWN0IG1haWxp
bmcgbGlzdCBpcyBvcGVuZW1iZWRkZWQtY29yZS4NCg0KSnVzdCBhIHF1aWNrIG5vdGU6IGlmIHRo
ZSBhaW0gaXMgdG8gYWRkcmVzcyBpc3N1ZXMgb24gTGludXgsIHdoeSBpcyB0aGUgcGF0Y2ggY2hh
bmdpbmcgdGhpbmdzIGluIHNvbGFyaXMgY29kZT8NCg0KQWxleA0KDQpPbiBUaHUsIDMgQXByIDIw
MjUgYXQgMTE6NDIsIFNvbmcsIEppYXlpbmcgKENOKSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8SmlheWluZy5Tb25nLkNOPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+DQo+IEZyb206IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZl
ci5jb20+DQo+DQo+IE9uIDMyLWJpdCBnbGliYz49Mi4zNCBzeXN0ZW1zIHVzaW5nIDY0Yml0IHRp
bWVfdCBidWlsZCBmYWlscyBiZWNhdXNlIA0KPiBfRklMRV9PRkZTRVRfQklUUyBpcyB1bmRlZmlu
ZWQgaGVyZSBidXQgX1RJTUVfQklUUyBpcyBzdGlsbCBzZXQgdG8gNjQNCj4NCj4gRml4ZXMNCj4N
Cj4gYGBgDQo+IC91c3IvaW5jbHVkZS9mZWF0dXJlcy10aW1lNjQuaDoyNjo1OiBlcnJvcjogIl9U
SU1FX0JJVFM9NjQgaXMgYWxsb3dlZCAgDQo+IG9ubHkgd2l0aCBfRklMRV9PRkZTRVRfQklUUz02
NCINCj4gfCAjICAgZXJyb3IgIl9USU1FX0JJVFM9NjQgaXMgYWxsb3dlZCBvbmx5IHdpdGggX0ZJ
TEVfT0ZGU0VUX0JJVFM9NjQiDQo+IHwgICAgIF4NCj4gfCAxIGVycm9yIGdlbmVyYXRlZC4NCj4g
YGBgDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdp
bmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTQu
Mi5pbmMgICAgICAgIHwgIDEgKw0KPiAgLi4uLWFsb25nLXdpdGgtX0ZJTEVfT0ZGU0VUX0JJVFMt
b24tTGluLnBhdGNoIHwgNDQgDQo+ICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL2djYy8wMDI4LVVuZGVmLV9USU1FX0JJVFMtYWxvbmctd2l0aC1f
RklMRV9PDQo+IEZGU0VUX0JJVFMtb24tTGluLnBhdGNoDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xNC4yLmluYyANCj4gYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy0xNC4yLmluYw0KPiBpbmRleCAzZDY1YmVkOTJhLi4wZWQ2ZjE4NzViIDEw
MDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xNC4yLmluYw0KPiAr
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xNC4yLmluYw0KPiBAQCAtNzEsNiAr
NzEsNyBAQCBTUkNfVVJJID0gIiR7QkFTRVVSSX0gXA0KPiAgICAgICAgICAgIGZpbGU6Ly8wMDI2
LWdjYy1GaXgtYy10d2Vhay1mb3ItV3JhbmdlLWxvb3AtY29uc3RydWN0LnBhdGNoIFwNCj4gICAg
ICAgICAgICAgZmlsZTovLzAwMjctZ2NjLWJhY2twb3J0LXBhdGNoLXRvLWZpeC1kYXRhLXJlbG9j
YXRpb24tdG8tRU5EQlItcy5wYXRjaCBcDQo+ICAgICAgICAgICAgIA0KPiBmaWxlOi8vZ2NjLmdp
dC1hYjg4NGZmZmUzZmM4MmE3MTBiZWE2NmFkNjUxNzIwZDcxYzkzOGI4LnBhdGNoIFwNCj4gKyAg
ICAgICAgICAgDQo+ICsgZmlsZTovLzAwMjgtVW5kZWYtX1RJTUVfQklUUy1hbG9uZy13aXRoLV9G
SUxFX09GRlNFVF9CSVRTLW9uLUxpbi5wYXQNCj4gKyBjaCBcDQo+ICAiDQo+DQo+ICBTID0gIiR7
VE1QRElSfS93b3JrLXNoYXJlZC9nY2MtJHtQVn0tJHtQUn0vJHtTT1VSQ0VESVJ9Ig0KPiBkaWZm
IC0tZ2l0IA0KPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLzAwMjgtVW5kZWYtX1RJ
TUVfQklUUy1hbG9uZy13aXRoLV9GSUxFDQo+IF9PRkZTRVRfQklUUy1vbi1MaW4ucGF0Y2ggDQo+
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MvMDAyOC1VbmRlZi1fVElNRV9CSVRTLWFs
b25nLXdpdGgtX0ZJTEUNCj4gX09GRlNFVF9CSVRTLW9uLUxpbi5wYXRjaA0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4wNmMyNGNkZmY1DQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MvMDAyOC1VbmRlZi1fVElN
RV9CSVRTLWFsb25nLXdpdGgtXw0KPiArKysgRklMRV9PRkZTRVRfQklUUy1vbi1MaW4ucGF0Y2gN
Cj4gQEAgLTAsMCArMSw0NCBAQA0KPiArRnJvbSA4ODNkNTU0OWRjOTU5YjczNmUzY2I2MWI5ODky
NzJhOWU2YTQyNTY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgDQo+ICsyMDAxDQo+ICtGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiArRGF0ZTogVGh1LCAzIEFwciAyMDI1IDE3OjA5
OjIyICswODAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIFVuZGVmIF9USU1FX0JJVFMgYWxvbmcgd2l0
aCBfRklMRV9PRkZTRVRfQklUUyBvbiANCj4gK0xpbnV4DQo+ICsNCj4gK09uIDMyLWJpdCBnbGli
Yz49Mi4zNCBzeXN0ZW1zIHVzaW5nIDY0Yml0IHRpbWVfdCBidWlsZCBmYWlscyBiZWNhdXNlIA0K
PiArX0ZJTEVfT0ZGU0VUX0JJVFMgaXMgdW5kZWZpbmVkIGhlcmUgYnV0IF9USU1FX0JJVFMgaXMg
c3RpbGwgc2V0IHRvIDY0DQo+ICsNCj4gK0ZpeGVzDQo+ICsNCj4gK2BgYA0KPiArL3Vzci9pbmNs
dWRlL2ZlYXR1cmVzLXRpbWU2NC5oOjI2OjU6IGVycm9yOiAiX1RJTUVfQklUUz02NCBpcyBhbGxv
d2VkICANCj4gK29ubHkgd2l0aCBfRklMRV9PRkZTRVRfQklUUz02NCINCj4gK3wgIyAgIGVycm9y
ICJfVElNRV9CSVRTPTY0IGlzIGFsbG93ZWQgb25seSB3aXRoIF9GSUxFX09GRlNFVF9CSVRTPTY0
Ig0KPiArfCAgICAgXg0KPiArfCAxIGVycm9yIGdlbmVyYXRlZC4NCj4gK2BgYA0KPiArVXBzdHJl
YW0tU3RhdHVzOiBCYWNrcG9ydCANCj4gK1todHRwczovL2dpdGh1Yi5jb20vZ2NjLW1pcnJvci9n
Y2MvY29tbWl0L2ZhMzIxMDA0ZjNmNjI4OGQzZWUyZWVmYTZiMA0KPiArMjE3NzEzMTg4MmRjYV0N
Cj4gKw0KPiArU2lnbmVkLW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2lu
ZHJpdmVyLmNvbT4NCj4gKy0tLQ0KPiArIGxpYnNhbml0aXplci9zYW5pdGl6ZXJfY29tbW9uL3Nh
bml0aXplcl9wcm9jbWFwc19zb2xhcmlzLmNwcCB8IDUgDQo+ICsrKysrKw0KPiArIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gKw0KPiArZGlmZiAtLWdpdCANCj4gK2EvbGlic2Fu
aXRpemVyL3Nhbml0aXplcl9jb21tb24vc2FuaXRpemVyX3Byb2NtYXBzX3NvbGFyaXMuY3BwIA0K
PiArYi9saWJzYW5pdGl6ZXIvc2FuaXRpemVyX2NvbW1vbi9zYW5pdGl6ZXJfcHJvY21hcHNfc29s
YXJpcy5jcHANCj4gK2luZGV4IGVlYjQ5ZTJhZi4uZjc4NTU4YmVkIDEwMDY0NA0KPiArLS0tIGEv
bGlic2FuaXRpemVyL3Nhbml0aXplcl9jb21tb24vc2FuaXRpemVyX3Byb2NtYXBzX3NvbGFyaXMu
Y3BwDQo+ICsrKysgYi9saWJzYW5pdGl6ZXIvc2FuaXRpemVyX2NvbW1vbi9zYW5pdGl6ZXJfcHJv
Y21hcHNfc29sYXJpcy5jcHANCj4gK0BAIC0xMCw3ICsxMCwxMiBAQA0KPiArIA0KPiArLy89PT0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICstLS0tLS09PT0vLw0KPiArDQo+ICsgLy8gQmVmb3JlIFNvbGFyaXMgMTEuNCwg
PHByb2Nmcy5oPiBkb2Vzbid0IHdvcmsgaW4gYSBsYXJnZWZpbGUgZW52aXJvbm1lbnQuDQo+ICsr
DQo+ICsgI3VuZGVmIF9GSUxFX09GRlNFVF9CSVRTDQo+ICsrDQo+ICsrLy8gQXZvaWQgY29uZmxp
Y3QgYmV0d2VlbiBgX1RJTUVfQklUU2AgZGVmaW5lZCB2cy4gDQo+ICsrYF9GSUxFX09GRlNFVF9C
SVRTYCAvLyB1bmRlZmluZWQgaW4gc29tZSBMaW51eCBjb25maWd1cmF0aW9ucy4NCj4gKysjdW5k
ZWYgX1RJTUVfQklUUw0KPiArICNpbmNsdWRlICJzYW5pdGl6ZXJfcGxhdGZvcm0uaCINCj4gKyAj
aWYgU0FOSVRJWkVSX1NPTEFSSVMNCj4gKyAjICBpbmNsdWRlIDxmY250bC5oPg0KPiArLS0NCj4g
KzIuMzQuMQ0KPiArDQo+IC0tDQo+IDIuMzQuMQ0KPg0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91
cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMTY1MzgpOiANCj4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE2NTM4DQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjA2MjYwMS8x
Njg2NDg5DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIA0KPiBbYWxleC5rYW5hdmluQGdtYWlsLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg==


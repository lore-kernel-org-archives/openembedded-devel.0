Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7106BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:36:19 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.web10.8073.1755250576999699305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CDWWfpy3;
 spf=pass (domain: siemens.com, ip: 52.101.72.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSYubE8OrZQ/AlWJl0xA8OJufgRpN+uX5ILUQHNNie8L8LADXYvUUsK1nW+yhIr5VxxJ1m9wKGWZwjpaiTxS34iRDp+2E7KC9kSDcYSleXWE+urcukgbifEwsvf3/oYrHQczkt+S8weWKgLl4Be5KbP9BYYm8GeCWuC7F2X2oKhcYcZGcQG0je+mjY6zduagrYne0ttzfuA4nba6b+IkVUIsYPojxsMhfVyR6tWQ5o4YqXoVaQDXwf1ilz0YH964pmH1iKHCxRvgIZ/Px4Y7RTP4JBafH49uD+LNKsYI4PYKHU7EaI7/V1HxSHme0jXISwsx+LWga+jb88Yg1/C/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZAfNoOfTbDgaSbUkHWq5JqirKVP008pfiOME6O7WYc=;
 b=VkNp1KWHxAR26ztqcfO5LJ0cGczb1/St3c+/5ECU/0cb+3jH6Nlc11VMGKPuiaZybF3DkDcTaeI5EihJsJr/LsZAK8K1y/e0BvjZfFJcncQl3NYyZelVg5SpWS+tIA3rxUdev/Gdl7dvZONXnO88f/FYjkiwuGY8c2YxlHBmuaQubozB5m7z/s0LJZtcvwf2SvNGiZgwLd6W1B7unCwg25Rn/N7Uz6PWyZYLG72Wp2tRtc1u7xoRGgHl2lfvFFhidIA7lBhV6UYCJMFDKo3SYotpT5jATwTbl3bVzObdopxAiC43G0sVhQKkb2WZa193fsVvyU8iBVH17m5ov4l++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZAfNoOfTbDgaSbUkHWq5JqirKVP008pfiOME6O7WYc=;
 b=CDWWfpy3kbrqyXtOBB/e4rQR3KzaLs5yYJaGYe58g2n0KsTip4TiGbwG5XX8BuA6tgsyRG/XWeO9c8oemtkoq7P/S6dbA69YFfhQULNRcAntWxWu9m+rZmhZFG+4XFa2RBaY3b7io1JbDpb+D+BidDQhpNPIBC91Vn5j9M0hAfjtvDTg184eDijrau8/z3Pznf7oLQCutWt1Yte6Ac3BG0mLAMBOFnuhh+G95em/2xw/iP99IlkKlAKPrLFBFx6LdpwIDIAmO28NocP0016FYeZxhK/NPiccIhjIaUUw60tnxZE1ggrNSf+zwrvdk/CfMoB+NfXyIOt+W4cFPO1GfA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB8088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 09:36:12 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 09:36:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Lau, Karn Jye"
	<karn.jye.lau@intel.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: 
 AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGAgAAEpGCAAACpEIAAIPQggAAQygCAAADToIAABUCAgAAA57A=
Date: Fri, 15 Aug 2025 09:36:12 +0000
Message-ID: 
 <AS1PR10MB56978F72114B25000930724BFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
 <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
 <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=07d72f29-cbe3-42e8-96a5-02b0c840cbbf;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-15T09:32:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB8088:EE_
x-ms-office365-filtering-correlation-id: 5b844ed8-7966-43bf-de66-08dddbdf2c8d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TnZXVUxPU1ZMb1dCbnM2RDF2K09uNXdPWFdkZDFQQVZqTHdndGJNNHZaNXJZ?=
 =?utf-8?B?c0NrTVFtVVVYL0tZODRybzA3NmhJYmgrdUlXVFN6VDZpY3Exa0gvcUg1aUl0?=
 =?utf-8?B?dlgrUVB1NnZqKzgwZUdkdkgrOUpzS2JtdXVsREU1YUxRWFBXVmZhNUxSVE9m?=
 =?utf-8?B?ejltS2dLU3VMTFo1QmlkNkVvdkc5d1BYWkxWWmgweVVEc0FMRTZrczBCWUNF?=
 =?utf-8?B?YTZ4UlFyTGdRcWI5dStlNkhBWEdtcHZ3WTEwYmVUazF3NmFabTZMQWlJSWN0?=
 =?utf-8?B?WXZTMjlpNUJXQklYVTk4WWRKOFZ3Uzc3Y0VBMlM4WUNpWHcwbTlJbW9CMzhT?=
 =?utf-8?B?RGxIdDdYdG9LVVlzQTcxZzlINTJsVnlLRjJoc29CekRxNnAzYnpHbGpJUklm?=
 =?utf-8?B?YjQyaEo0Y04rNHFIdmt6SmVkcXA1QUNiNHNmUFpXVkRCb3JHenRwU2VQR21l?=
 =?utf-8?B?U3RyRmhhM21La0dERWpKUjFKcnRETDREVVdFSkwvWU13WHU5WnE1VVlNOVAx?=
 =?utf-8?B?VTV1TGlZUHV2UzBRbCtvUGpXNnRlQ3lENXV3d1J6TytkaUh0WXNudDYzZ0lq?=
 =?utf-8?B?TU9SNDllb3JjQllRMS9jdzZKM2QvSVBnVU9VdU1GVVZYV2xBbkVNL0tTNHVx?=
 =?utf-8?B?YXk0SE5xTkxCb0xDeENuT1pqVXFrMkdlaVd6MjNud2gxb1VtNmdyMXB4eVNz?=
 =?utf-8?B?ZmZYallwT1poUDVCeWJYQTdhd0Q2REQ2Vkc2Z3Z2dllSK1kxQ2pKYmVSUHFj?=
 =?utf-8?B?cklwZVM4Rnlqa0N4bk5KT0c5RkxrdXAvcFRFUyt3NzFPbGZGdHpQU3JUL3JP?=
 =?utf-8?B?ZjEvL0tsdFZJcHJDNlp5QmcrSzJxcHZrWGYvdzNGTHc0aHd0Zmx2bDduUnJj?=
 =?utf-8?B?WUcyekt6V3c2NnFBZXl3NjlhSU4zUG1IdmtINWtnK3o0Y013N0N1d2w0SEYz?=
 =?utf-8?B?blRCcVdmSkhaSHFLOFB4QUZsWUtBc2t4Z1hoRi9pUXRYVHFudDhzdWsxZXAw?=
 =?utf-8?B?Vk91K2xPVnByMFJCTE91K25sL1V3S1U0UEwrb2Q0NThXdzFHOXRHaVJmZS9v?=
 =?utf-8?B?elZBV0dyeG05Nk9PNUhlMXVrTnZHdHJpS0p5eTR4aFhWdHUwOFh4T3Q3czBO?=
 =?utf-8?B?cXY2a0NNaWtMQkdmUTQwNkZSYlRicUxROGNwTkx3OFpudG0zVUliUGV1RDdk?=
 =?utf-8?B?UTl0OE9TbExRWG5XZDg5SVVTdmswak5iUW84K1ZXQkdLM2U5ZStTSFhqZGhO?=
 =?utf-8?B?ZnBFK1B2ZmtWTTd4bW1NMVlwdVdITXMvT1J2N3c0b09qdUtFalArd2VsRWxD?=
 =?utf-8?B?MGRRbnB6bzNheE5XRUdHbXI1WTVzdHY2dlVZWGlQRnFOSzNMR2MyWmxqbUZQ?=
 =?utf-8?B?Tm5hRGVaSDk2VnlUb0c2QXZNN0dWZ3NhWUJMMFVKNlpCckZBZVE1Z0dMeVhl?=
 =?utf-8?B?OTE5UWdNTkRJdjkwTUdUN3VKaVNSZXJCL0FLNDQrV3dpOHdTcE56dGpWOUxm?=
 =?utf-8?B?byt2c3YwbXFDVTJLTzRkQ3FZWjl5KzhOM0c3Y0hJbFNQaG9wVU1GVTFKVUx6?=
 =?utf-8?B?KzRra3Fma2ExTWlIV256MnFtbEdURXFINm5RM0t4aUg1US9LY3lpbXFwcjBP?=
 =?utf-8?B?dkpSeHA5R2IyR05TUnUrNm5kZy9jcmJ0c1U1WEFEaHRzeEU1UFhPenRwdmRm?=
 =?utf-8?B?S0NXM3BicmJNM1B6Z09aRi9HZGtZMVJCekhZTHJIQlZ3d2dYOGd2UEE0Y1c0?=
 =?utf-8?B?SDVxSCtONDVmV1JRV3Q1cUJ6cjdGY0ZndmNTNk1vYjU3K2dKa0FyOWMxb1ZX?=
 =?utf-8?B?Z2JNTXl6dS9uaENBYk1rU3crclJycWpyUWpPS2dtWHJWcHVrTGQxRHFCelNm?=
 =?utf-8?B?RGtzYnd3eCtremhaajlhSklGeWdLamxucXR4cEpWdzJDWG9XSjhtbnoxWkZP?=
 =?utf-8?Q?YFrH+37keQ8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkZVZWczanVjT0NxWjBPbk83cnFORkdDaUxWY29EcGFhZDZETm5Ka0NsTVhJ?=
 =?utf-8?B?WEtkSzQrKzZJRXZHcTdGQkxWS203dFJQYlFqeS9PTEMrSnFPSWFUVVFMQXRI?=
 =?utf-8?B?Tlp5aXlIZnFJS2ZRaDNQQ1IwdlhaaWZFTk10WVQ0RmtpT1J2ZUlPTjlWZkoy?=
 =?utf-8?B?QzRmV0kzSU5vWlZMaUVGcXdVbmg5STMvdE9ES2p6SHVhVERxQjdOaThkREdU?=
 =?utf-8?B?VHFqcEUrVHlDZ2FUbUVoUzFFaFpqRGZCVGZXQm41TjJlQXRsbGYxSWk4ODBP?=
 =?utf-8?B?S3RtMWVERlk5enFUYWpoQWpvS1p1Wndzb3E1V3hmSldrTlprOHU4ekMzQVQr?=
 =?utf-8?B?VUxpcHFleGdWeHB2TWtJNklpckNsYmFaREZ1K0lWWnRneFZJNGU4QUpHMTh5?=
 =?utf-8?B?KzRsQk1KOHNXSy9qTnd4L0xNcktZUWNrUk8vbm1ZK1VpeGFxMkltbWE0aUNq?=
 =?utf-8?B?T3dscHBWZUN6NVFNV0ExUEdUMFUveVJaSnJybzdiemtnaWs2ZXNXRGR0M2di?=
 =?utf-8?B?VzdhN3kyZ3V3bWZLZFlGTmJRdEdrNU5kdnVWemxqVnNJUmJVZC9yQXpUaDln?=
 =?utf-8?B?elF1ZEVyVU85YjljbVhEVWplWVoyVFBweTJDYUtLcVFmVHd5RnJ2ZHptVWhT?=
 =?utf-8?B?T292S3pLTWt5YlRzeVVrYS9BbVY4K3ZlYmZNbDBBWG1vdnJjb3NOdkJNejhD?=
 =?utf-8?B?NjNmUWxIdXc3Y21GOG45M3JsT0VkM2NIZFZNcXRLK0MzbHdCa1o3OFZMcWln?=
 =?utf-8?B?QVhRT09TU3FyRDZIelBlVDZWTWRxVnBpcWZWa2tUWTFWb2IvMDdmekk5bml3?=
 =?utf-8?B?MFVqbFk5RENkMm1FRUhnMDBOVld5aFdzYlBvaEpMek92TXlVV3lSY3RLcVZo?=
 =?utf-8?B?Y01BSFJTaWNWYWxEWFJDc291WUtNUmliSVdEcU1id2E1UHk5cklZWHkzQTRX?=
 =?utf-8?B?N1hDeGUzMjJEYTUvZVEveVJUMDg0VTZSdWk1Qjlxd1FNQTYzeXhleFdMWDVB?=
 =?utf-8?B?bDZXNXlxUTA5YURmSXlBQU1Bc0pjbHBtK1FDdTN2T1FFTVJKeko1SmsxY0NH?=
 =?utf-8?B?WDU5K1lPK21weVdvWENreHNld0xXUFVlK1prMVZxOGVlN0VkQjhwamVuajZB?=
 =?utf-8?B?VStEWksvV0ljdWJWUUg2YUZLWE5jZkhyRnV2ZWk2WkdBL2VyOWFqM0xNZkxR?=
 =?utf-8?B?YUtReC9WZ1ExajB1b2pxamMxNTRtSFFxSUl5aEVpZzJMbmRJSHdXNlRCTUR6?=
 =?utf-8?B?NmRMSGdXbTBpWjdzVzFDckMrdGNuSlJOazBQMklvUVZuTUM5bkpOTXdMazQx?=
 =?utf-8?B?L3hIWjRLOXJpb1p5cXhBZ1JxdTRUSTZSNGtQb1VINGRqRk1yV29IaGRLdWow?=
 =?utf-8?B?YTR2dlZFSlNGNGlrZG92eGFWR0ZscWlsbTdJREFsdDJKYkN3MjhJK0Q3R2Uv?=
 =?utf-8?B?cXd1WTJLamtjdm05Q0gzQ3NIUkRrRVd2Q3QzQVhxcG9UYnlITVIzRGZObFRK?=
 =?utf-8?B?OUlaNW1kWmw2bzg1VnVSekUrRElLaGZIL3hGSE1pQ013dG95enBvV3VCb0N1?=
 =?utf-8?B?NTAzdjlpc0E4M0h6R0I4aDNLU0xwRlhPNXdMZ2hRN1ErTUZGNmlhdmk0dTYv?=
 =?utf-8?B?VmVDcy81SzRVdmd2SzMxb3JnT3E1Vmw1TEtja3E1Z2tLWmhHaGllU3d3MmN6?=
 =?utf-8?B?UExPNWNJSi9LMGRyRVRUQmRRRFgyK2NpZDNKZlRha2FNaEtwQWMzaHFjamYw?=
 =?utf-8?B?aElPL2ZDelp4VkFXak5lblhaa2hYbllUcGRla3g2WldScy9hM1NRTzBJWTh6?=
 =?utf-8?B?MkhybTdpVEVEbFRIRGJ1Q0ZkMVYxbkl2cm1Ccm11Z09ML3g3NjhKU3BzVmNG?=
 =?utf-8?B?ZW5odkl0TmRuNm8rd1VyV1llZVNBNEc4TFVCZ0YrbGVLRkhtMzZLNUhiVCts?=
 =?utf-8?B?M0FWSmFjcllVdm9pVnBHSnhzaThtdWVZS3hxMVlYWkQ5aFdidEdDZC9hZEVh?=
 =?utf-8?B?WUFBSHhtN3RMUjVPMlNyZ3ZMc0Y3R2VrdVVyMHdNMzJNYU9FTTZCaGNKZWtY?=
 =?utf-8?B?aGZsc0l0Vk5GWmxQakMzMnNjblNyZGhiZ1FFQkhIc2g3N3BzZnAyb0ozR0c5?=
 =?utf-8?Q?Z76zmvl7cW2S3GLrn3EfAMoWP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b844ed8-7966-43bf-de66-08dddbdf2c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 09:36:12.8039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FR7F5rf2oY2Pu3fTKw22xujo1mDO7gNRe5Jeo+oI4+f7LjbQ6fDRwy3UevOAoiHT/gwGR091B1p/Gyz9p9I68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118968

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE1LCAy
MDI1IDExOjMwDQo+IFRvOiBMYXUsIEthcm4gSnllIDxrYXJuLmp5ZS5sYXVAaW50ZWwuY29tPg0K
PiBDYzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5z
LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW3NjYXJ0aGdhcF1bUEFUQ0hdIG1iZWR0
bHM6IGZpeCBnaXQgZmV0Y2hlcg0KPiBjb25mbGljdCBieSB1c2luZyBTUkNfVVJJLg0KPiANCj4g
T24gRnJpLCAxNSBBdWcgMjAyNSBhdCAxMToyMSwgTGF1LCBLYXJuIEp5ZSA8a2Fybi5qeWUubGF1
QGludGVsLmNvbT4gd3JvdGU6DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9t
ZXRhLQ0KPiBvcGVuZW1iZWRkZWQvY29tbWl0LzZkZWRlYTQyNjIwMzMyOTg3ZDkyMDQ0YTdlOGM4
ZTg1ZmEwN2MxMDcNCj4gPiB3aGVuIHRoaXMgY2hhbmdlcyB3YXMgbWFrZSwgc2NhcnRoZ2FwICBh
bHJlYWR5IHVuYnVpbGRhYmxlDQo+ID4gdW5mb3J0dW5hdGVseSBpdCBnZXQgYnVtcCBmdXJ0aGVy
IHRvIHZlcnNpb24gMy42LjQgcmVnYXJkbGVzcy4NCj4gPiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmVtYmVkZGVkL21ldGEtDQo+IG9wZW5lbWJlZGRlZC9jb21taXQvMmM5MTI2YmQwZGQwZjYyMDIx
ZjVkYjM0ZDY5ODQ4OWJiODE0ZWJkYQ0KPiANCj4gQnV0IGhvdyBkaWQgZWl0aGVyIGNoYW5nZSBt
YW5hZ2UgdG8gbGFuZCBpbiBzY2FydGhnYXAgd2l0aG91dCBmYWlsaW5nDQo+IGluIHRlc3Rpbmcg
YXQgYW55IHBvaW50PyBTb21ldGhpbmcgZG9lc24ndCBjb21wdXRlIGhlcmUsIGVzcGVjaWFsbHkN
Cj4gYmVjYXVzZSBwZW9wbGUgc3RhcnRlZCByZXBvcnRpbmcgdGhlIGZhaWx1cmUgb25seSB0b2Rh
eS4NCg0KVGhpcyB3YXMgbW92ZWQgZnJvbSBzY2F0aGdhcC1uZXh0IHRvIHNjYXJ0aGdhcCB5ZXN0
ZXJkYXksIHNvIHRpbWluZyBpcyBjbGVhcg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE4OTQyDQoNClRoZSBzdWNjZXNzZnVsIGF1
dG9idWlsZGVyIHJ1bnMgYXJlIGEgbXlzdGVyeS4NCk1heWJlIHRoZSBjb2RlIHRocm93cyBvbmx5
IGlmIHRoZSBzb3VyY2VzIGFyZSBub3QgaW4gZG93bmxvYWRzIChlLmcuIGF1dG9idWlsZGVyIGhh
cyB0aGVzZSBmcm9tIG1hc3RlcikuDQoNClBldGVyDQoNCj4gDQo+IEFsZXgNCg==


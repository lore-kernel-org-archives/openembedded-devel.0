Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C69DCA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:43:49 +0000 (UTC)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web11.6047.1756262624566028916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KhD49+f8;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1756262624; x=1787798624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2OvfLamKASgHZyurYvP5gvWzU++MC2nHFErazIIiIl4=;
  b=KhD49+f8DbVHsfaaG7u2lOkajLfYzTK1onI7lLWH/Zwe4t3Gl25y8W3P
   Lco+HG/9tmJIVOnZ/PeXDJudnVvBtMRHtYoIkNFMpls+6wwzn/DpKOMTe
   pUr1CC/CeVLFN1TmBUcVn3KtlYacslSrP8yJXQTvlJa4BYEdMXwiCQTEd
   BCBOA/b7zVAbp9dycWocork9kIWr8KfRq0Bie34mRMPSplQCaegLP+EwV
   6i9Ni0TCYDyBqz/t8gAOHvgJl2DoTp/kLtzeoXgiKSHl3Lw1uObK50T4v
   tBxyHiU72NK7heiC6u9tjSo7I5tFCVUlTpp+YUn0O0fDNCQ2/mWieg2Ar
   g==;
X-CSE-ConnectionGUID: Nz/3tdjTTlmPi1B3X7zuWg==
X-CSE-MsgGUID: pyEdPa6KS4yESb59iBdNYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="165848815"
X-IronPort-AV: E=Sophos;i="6.18,214,1751209200"; 
   d="scan'208";a="165848815"
Received: from mail-japanwestazon11010033.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.33])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 11:43:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cauq+2Eo3hqvRpph+5gYKnvbUB/wI/G6XyOB6o1/E54/r1Br4HyHlsO3jJcKGkqNrM3QU696k6/rjkL313dlIHVtaoSW1YAP4jzaMva/JRkTEKVGQsNacs4whRVSAAdpp2T+b85FrWQDEzi0LNw0fK/uXwUPsPVQp4Efv3ltPWIMcOlhvg/qIeOdztcePTMpsZFh0MLs/9rvrg2Qobl/EbQLh6lBVk9YPlDp1w1teLjw3hGSNtqWectKBgbhYlef4y7/N3Q0HF9nwIxrH26V/TOQ59KsqskNe3Iz4gv/Xg+OeffL3CrfZ6vkgblgF6uLpNm0kimVEHFKi7q+JvDkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OvfLamKASgHZyurYvP5gvWzU++MC2nHFErazIIiIl4=;
 b=sIhEHzRPd9pVjsKcvTpBpQYSrEIPgw0A+nQCNNcCo8OLs9uHGZPtXx9u+bQ2V3fIssAEYHs6DCxEkVb96r1PfPwqsXHB5LCn1JKEYxdYd5j5l1ZIsXQ+NgVXMz2QTSV2bGc8Reb/s9EzNtVmjPnKJXAdfEyAoMfkbjnbJur8dkRzQVTM++iIPnSUcC/1bRazc9H8O2z+4Ne8/Eu09vRMp93Mh7I2rMgcGtY/5+CeMIjHe7aErH92XMY8mY/9ZgDyEnesCKiPShP4p80eccnGTwU6iLQDZeo6b8gSDqEWtX+6WiAnMHy6BS0In4HMg68uQtJRw4YHwXqnXyI58aNQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TY3PR01MB9983.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 02:43:37 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 02:43:37 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>, Khem Raj <raj.khem@gmail.com>, Yi
 Zhao <yi.zhao@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] smbclient hangs in interactive mode after readline: 8.2.13
 -> 8.3
Thread-Topic: [oe] smbclient hangs in interactive mode after readline: 8.2.13
 -> 8.3
Thread-Index: AdwWbYA14NbON2qRT9KFHwT4be7EmwAB5NiAACHHV/A=
Date: Wed, 27 Aug 2025 02:43:37 +0000
Message-ID: 
 <OSRPR01MB1159743B1A940568E0A0D3D649B38A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: 
 <OSRPR01MB11597E2995D5DD5B55A24F5769B39A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
 <8631735b-3dbd-4e0d-8315-e265eb064672@gmail.com>
In-Reply-To: <8631735b-3dbd-4e0d-8315-e265eb064672@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NzAyNTU2ZjAtODY5MC00YWFiLTkwZmUtNWJhNmQ1MGVm?=
 =?utf-8?B?M2U0O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA4LTI3VDAyOjQyOjIwWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TY3PR01MB9983:EE_
x-ms-office365-filtering-correlation-id: 7c132baf-ceaa-4759-6ec0-08dde5138667
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eFFKODJyb042a2VKYlNCL21CdVlWaVR5bHVsZkR6ZEZLUWhKc2xPYlJVdGx5?=
 =?utf-8?B?aktLUzE3dGVoZWNCWFBOQWFPNGMxd20wVjYwQ2lTZStVSGpaN3FtcXNYWVZD?=
 =?utf-8?B?MThpSlpEdU52aVd5N0xDRkE1WWhpeFZ4M0dyUDFGUXI3NWl6MkZJYmpnemZM?=
 =?utf-8?B?c1ppdHAyM2g0Y29XL1FrY0JOMzVmbk1NTjh6VFZla09DRE5lUnp1cXN5SmNt?=
 =?utf-8?B?R1N0UWhvc0gxSFYzRjZFVlAyVE4rTFZzblFRTVRwbTJYajRWQUk2M2kyd0Ra?=
 =?utf-8?B?Z01uWWkxV0x5eldlZlIvRmhuSDhURDNjMFIwS2Y1OGJTamd5NUVJcmhnRnZj?=
 =?utf-8?B?OU9zRUpmWHNkSUtwZkw4VEN3NmUvTGtDekRINVRqODMxSnB4RGFTbHNyUlhH?=
 =?utf-8?B?UDJ0dkpxVHVjNWpuV1llVHdxeEhZQ21aS0Z0SFBCK2ZxSGZJTEFydzVxc0xX?=
 =?utf-8?B?Uk42NU1nNFJkOGV2Y0s4NTdiRldLMWZXRE9nWjQ3YTR0ekFLaHJkL25XWE9E?=
 =?utf-8?B?M1BsV09wamJFTFFJaWtlK3NtQVNpNFBjTnJGWWk1RCtidGExbEJJVEUzTERv?=
 =?utf-8?B?NUltL1FBR3gwZUIxMFNqK2RFZ1FyMzEwazFuTktGenhpcEQwS0ZtODE0akNQ?=
 =?utf-8?B?cUtPWE8zVEVoZHpxRzdUWjdUZVlDRUQ4UG56UDBlcjMvUDRkc2ZVNjhnRGV1?=
 =?utf-8?B?ZW53SWxqUEhXUFF0cWZ2MEtBMmJrbi9kUFN4b2VYM05QMEJIWFQ5S1AvVWVD?=
 =?utf-8?B?V3hmQUJTQi80SFJFalFjVUhSNkdVbkEwN09hbmI0N2hIZk96SlJCa2RzNGdz?=
 =?utf-8?B?OHpnTWlKK1Vuc2lXaEJxN1VvMkM2ZTI5TGQvNi9rNS8vSjlpVTVJK2c2U0hk?=
 =?utf-8?B?cElaQ3A4S2w4eGtaZVRzRWJBdzNNM0ZXQWF3Wkg1cXdVa3kzK2Y2MGdVeFNs?=
 =?utf-8?B?M1Z5NWhnNGtBLzF6UGxKWGM1dmtMd3UvWVVkNHh6MFh3bkg4eGVYTGdrVFVN?=
 =?utf-8?B?Slp5VHA0K1Jscm1YMzlGT0YxT1lKU0JCcGNOektjY1JVWUJ5VWQ5Z2h0bSt5?=
 =?utf-8?B?bHVlcFdwM1ArWWJwR0MrbCtPK1hwUG5jbHd1YThYTHpRSnVqL20yS3pjTk84?=
 =?utf-8?B?Y2JpWFg1WThXam42VDJrUXBHRVJJcVoxYm93QWlhTzE0dktEVHh0bG5rcVc0?=
 =?utf-8?B?ZFN2TmdrRVFxbUpKcFBkUUUwby9FYmlBK25hQk96cFB1S29RY29kd1MzRVBE?=
 =?utf-8?B?MzRRZG1kd25ZditQaHQ1dmg1MDd3eS9qdUJ1a2xnMGlHU1RSYmV1dWh1UUdR?=
 =?utf-8?B?UTdBYWFpYmZYOFM4TXg0ZmZBWDhyVUdYUkZibFE1WVRyaGdNQ29sR1JwWmlo?=
 =?utf-8?B?d2xCWTNVOE90a0VOQUhWV0xlcXVSKzh0NnRBcENXVUQ5VHd2K3o0TGdDWXli?=
 =?utf-8?B?bmszZjJ2a3YydlI2V2ZJNDluaDhtN0VMUkV3dEVZRHJvNVRpMm5LL08zK1lr?=
 =?utf-8?B?SnVzaXJlOGppYXQzTlF5KzEzek12cXUvUXdRdy9qaFFNN01xQ21PcEZVZXAz?=
 =?utf-8?B?VVFYeG0vSEJnd3dGazliTnJrRlVvd25CZS9sMTFFeEpHZTJPNEtZNURrTFo0?=
 =?utf-8?B?WkFtQlA2cFRuN0JmaXNzNnBBK0t4UzdxMEZoTXp0V0hnTmNvTTVETUVqTTFn?=
 =?utf-8?B?MDN1VXE5ZDRmVFFZNk0xR2h1K05hd0FZbzFna3gxUmVuem1xU3Q5TFVkS2lx?=
 =?utf-8?B?ZW90Ym0zdnM5NUdpdzJEK255ZVJOQjFoRDgyaEpibkhCZFlFSDc3M2g1ZjZa?=
 =?utf-8?B?aVd1K0dpaVFIc3lhTkc5NGFDaDdNZ0xUZ0p2VHA4U2ZnRklMZkg1VWIwNEF6?=
 =?utf-8?B?VzFiNzI3azZaWitiQkxRVjVLdFZ5OEZqMG1OMWJ5bld4U1AxMDRIRkc0Zmkx?=
 =?utf-8?B?anFKaW5xVmN1ZmFQaEJEeFdCR2pkUGkrY0N3aEVDelhwalJxS1FyWEdVd0xC?=
 =?utf-8?B?SDlzVDY1ODdRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bjFxOWE4QnUva0FPYUtablhYdVVaMHJuL3ZoWE9MR2ptbTFQUW9XQ2tRK0Fl?=
 =?utf-8?B?amlBQkRyTXhBamFRVGUvNXBzcWlkb215MEJZWTRzYUoyQnZYbmRCUmE3SnpJ?=
 =?utf-8?B?ZmhRalYvUG44WHNkWlQ0WlRLdzgzU2hhNU03UHdSZy9KM21sVUZabFpGWTBO?=
 =?utf-8?B?aS9HME1zckdsTDBHeTlTcTl6aXdQM0R4ZTc4Z1l6WE1STndmNXJ2STQyUnlk?=
 =?utf-8?B?SzFQUVg0VEMrZmM0c2xGRzdZWEIwWEtXdnFXM1dpY084Yy9Pbm9nU1dsYjk5?=
 =?utf-8?B?MExZbkZJVDdGK1NKWmZvRE9jK1lqcTdnMmxTdzZGNE5pUDlscVJiZGx3UW5F?=
 =?utf-8?B?dm9UbWVyMkJDZnpZNFRnU2wramt1MlJEOFNualByM1dqcDE1aTNNdmVDaVk5?=
 =?utf-8?B?cjFyQm1LM0NkZHFGdWkzc3ZjaWJXN1dkSVY0V1lHc2t2NktqUExZbjVWL2VE?=
 =?utf-8?B?U3U4RzRaNFpHQk50VE93S2c0RWxBRWtkL1AzTC9JaHRhazA4Kzluc21GWTBH?=
 =?utf-8?B?MHUxSXpnaVNWaEIxVjluUU1UUk4wWGlmSnB1TksxYVozL1FpbkgwWkVKWFd2?=
 =?utf-8?B?MFVoMU9yV2RtWGNzMFdLUDVNakpnbWlTRXVOaDZZc1dKUHh0KzBza1cxTnZk?=
 =?utf-8?B?TzNXN3hJY1F0MlJ0THMvVmdaTng0WXhsL096N3VYc2NUNUhBOVFKV0xWd1BD?=
 =?utf-8?B?amlXREZwMHRYOU52dkVsRUJvWG9UMHpIYUFBNXF0Z3VhcVhUWGZxS0dwUENQ?=
 =?utf-8?B?L1ZTOUgrSHZWbTFPWDUvRkk4NUtQU24yOURlTzdYbnkybTFyUytsYW5YWjFw?=
 =?utf-8?B?Vjc2OEx2cC9vMER3eFJOZVh3ZmdvOFk4eXZSbVU4aC9yUlRsVG5oT1ZXbWJF?=
 =?utf-8?B?VUJ5d2lTWXdYUUU1Y01oZnluRE9oVUdzSEFlNm5GbnlKS3hKRHdOcWx2ZXA3?=
 =?utf-8?B?MFhlVzlBaGVQMkw4VHhYNHNhTVdrZm5QVHRGOXV5b2hCMkh3UkpTRmpkbDN3?=
 =?utf-8?B?TG44SHd2dG0xVHRmT2EzY0lQTlVIcGNNRk9KemxjMXY5NjNMc0hyUm1melN2?=
 =?utf-8?B?SW01Q2VJZkVXY2tvTTBTY0pIQnJpRWRHVWpSTDB0ZXV2MCt0TDBuOStsS0I2?=
 =?utf-8?B?dlVPSHFDQXZIMkdwRWVYK0J1T0cxMExwUjcrRnRac1h1UlVHVGpjcndTTUhm?=
 =?utf-8?B?MEJTdzA2azFnMUhiU2RyZWkyZkhqcGU1UVdGSjkzYjFuNmhYWldsT2xSWm1s?=
 =?utf-8?B?T1dMNTRFd0xtSitmMmIrbVgrYVArZVFObzNYb1ZNczZVc0NJelVhSWxHMEQ1?=
 =?utf-8?B?NTVLckExRS9qMVJiR3NScmE5MHZXbVdYUWs2T09kWU5tM0hRTCsyMHVyUkY3?=
 =?utf-8?B?SlF4QS9ENi8vQS9zeWlsYVlwL0xmeUZaa3U4U0ZHcnkwazZZb000S3J1VVRa?=
 =?utf-8?B?KzgrOVFPOWJrTVBzVUtMbUJ3c2YrUlVnUnBvTEdiVXlXUFhUeGtrcG9aZU5J?=
 =?utf-8?B?WXEvb3prUjZ6Y3V2R0tLOHVIVzhjZlcvcldka3NYcHozSElnb1hRV2E4Wnla?=
 =?utf-8?B?WWhad21Ybm9EN3pjYlgrcVZvWGY4SVlabkRhUUxrSDV4SVhrMUFWT0NIeWxl?=
 =?utf-8?B?NERMMzlUUWoxMGt5VmZzSHovUWVCdFVHU09DTE00RG84MzVjaktBZmZBQWxa?=
 =?utf-8?B?aDNSWkZTM3J3NzFsTzRWU2pnMkpEYk1BVndVTGd1MDNpRU9sd0pkSjlrMFNl?=
 =?utf-8?B?V1hDRHpwdlhKbmFzOFV6WU43bDZsbkpuemg5YU12Znp4R2FpTGtEaEtkc3FD?=
 =?utf-8?B?bDdUL3krNEhwRUcrc2J6RE5VVkRCaGp4SWt0VXpJN21sZUM3anZ5Z1VEbDI3?=
 =?utf-8?B?dEs3QUlCZjN0WXBFVi9NZUJaTDNOSmZFWlpFdmN0ZnVnNnV4cFhlNW9xZ250?=
 =?utf-8?B?Z3lXcWhpLzdhR3NhNlpnUk40cjlZUlZBR2RQNkVDVEhSMjhvT3BWbkFVZGds?=
 =?utf-8?B?TlQvemoyblh1TitIOG9IYzZrbjJ0cmFaNzhqaDQzV1EyK0dXZzB4NUlCcWtK?=
 =?utf-8?B?cnhDTmdsQlJrNE1SZC9RVTFyTE81dHFaUUt2MmRvZUk0QkRRV0ViTWtuR2ky?=
 =?utf-8?Q?Hj52/oN2tWmmsxcfqvi0+xW//?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5DoI/hztg1Q/ldJbr//76xeF3ik2nXoBq3NkzHS7pePzGNOTy3QlHgLEMnG5H2VdbHhXy20hmoLsI8fvZVA1wJDZAe8vsckNHobgWHmRrXX3dwxhSE8b6Wyi8gJdt6hkNHcc406CDyb7eff9grSPI/S3KcW22mou4eEXL3YCPGYr1Wz0hCGJuaAZXRrwIKq6bJyOYv0L3pBxsxuIDMDN1BkkycwxGPhCSVo40Y679PoNsBPpnVnayuV8ZKDku6AZ34DPH+MKTPYqCMwb1D+5ygYBPER6IlHSf7boSRsdZRaXaKZLoB3H1wvJ/OKZOuTKhqd3AqXvBFs6ZuH+GjLOPhxzBLfzF/3Whv2ulLWP+VFJwNNdirPn3ecOiVWkaXV8XHb3xWtN39F0vZ9Y66tfhbNUzE4ZFqp3f5ixAYscYf9pLxkHfg5USIRQ3pvrQ9lzwSuyc93kSJXlnVNbqXSim41yisSicBfoV7FJOvLhArL63TEJ+Oi1mMIF8pMd0g9/zStZQYYeq/weL1C8dGlmqmK0ukKDMswpffJBhJUFwGZk8Gu6/qhpRgHSYolQ/bWb8IhuUqLIc/72Gz6G2NgFbnueb62kuvQmJt4fJ4GcJMxCwWtWZSfGk4LfGtK6CFsL
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c132baf-ceaa-4759-6ec0-08dde5138667
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 02:43:37.8119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0K0olnQ0Ye+/hqAheflW+cBuuO+hb3Pqa9B7WevYJDq8ExcPltt3YMovNrViyp94mgBuWsj8J5f7QkFdnzNTEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9983
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 02:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119119

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3lvcmd5IFNhcnZhcmkg
PHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI2LCAyMDI1
IDY6MzUgUE0NCj4gVG86IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RAZnVqaXRz
dS5jb20+OyBLaGVtIFJhag0KPiA8cmFqLmtoZW1AZ21haWwuY29tPjsgWWkgWmhhbyA8eWkuemhh
b0B3aW5kcml2ZXIuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gc21iY2xpZW50IGhhbmdzIGluIGludGVyYWN0
aXZlIG1vZGUgYWZ0ZXIgcmVhZGxpbmU6IDguMi4xMyAtPg0KPiA4LjMNCj4gDQo+IEJ5IGFueSBj
aGFuY2UsIGhhdmUgeW91IHRyaWVkIHRoaXMgcGF0Y2hbMV0gd2l0aCByZWFkbGluZT8NCj4gU29t
ZW9uZSByZXBvcnRlZFsyXSBhIHZlcnkgc2ltaWxhciBpc3N1ZSB3aXRoIHRoZSBsYXRlc3QgcmVs
ZWFzZSBvZiByZWFkbGluZSwNCj4gYW5kIHRoaXMgcGF0Y2ggd2FzIHRoZSByZXN1bHQuDQo+IA0K
PiBbMV06DQo+IGh0dHBzOi8vY2dpdC5naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L3JlYWRsaW5l
LmdpdC9jb21taXQvP2lkPTE1OTcwYzQzMTUxDQo+IDdhMDQ2MDk5ZDgyOTRjOTFkNzc4YjFkYTli
MjlkDQo+IFsyXTogaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9idWctcmVhZGxp
bmUvMjAyNS0wNy9tc2cwMDAxMS5odG1sDQo+IA0KSXQgd29ya3MhISBUaGFuayB5b3Ugc28gbXVj
aC4NCkkgaGF2ZSBzZW50IGEgYmFja3BvcnQgcGF0Y2ggdG8gcG9reQ0KDQpMaXUgWWlkaW5nDQoN
Cj4gT24gOC8yNi8yNSAxMTo1MywgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4NCj4gPiBIaSBBbGwsDQo+ID4NCj4gPg0KPiA+DQo+ID4g
T3VyIHRlYW0gZm91bmQgc21iY2xpZW50IGhhbmdzIGluIGludGVyYWN0aXZlIG1vZGUgYWZ0ZXIg
cmVhZGxpbmU6DQo+ID4gOC4yLjEzIC0+IDguMw0KPiA+DQo+ID4NCj4gPg0KPiA+IFdoZW4gZG93
bmdyYWRlIHJlYWRsaW5lIHRvIG9sZGVyIDogOC4yLjEzLCBldmVyeXRoaW5nIHdvcmtzIGZpbmUu
DQo+ID4NCj4gPg0KPiA+DQo+ID4gSGVyZSDigJxoYW5n4oCdIG1lYW5zIOKAnHRlcm1pbmFsIGFj
Y2VwdHMgbm8gaW5wdXQgYWZ0ZXIgbG9naW7igJ0NCj4gPg0KPiA+DQo+ID4NCj4gPiBSZXByb2R1
Y2Ugc3RlcHM6DQo+ID4NCj4gPiAgMS4gQWRkIHNhbWJhIHRvIGNvcmUtaW1hZ2UtbWluaW1hbA0K
PiA+DQo+ID4NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMv
Y29yZS1pbWFnZS1taW5pbWFsLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29y
ZS1pbWFnZS1taW5pbWFsLmJiDQo+ID4NCj4gPiBpbmRleCA4NDM0M2FkY2Q4Li42NjFkNmNhOTA0
IDEwMDY0NA0KPiA+DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1h
Z2UtbWluaW1hbC5iYg0KPiA+DQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2Nv
cmUtaW1hZ2UtbWluaW1hbC5iYg0KPiA+DQo+ID4gQEAgLTEsNiArMSw3IEBADQo+ID4NCj4gPiBT
VU1NQVJZID0gIkEgc21hbGwgaW1hZ2UganVzdCBjYXBhYmxlIG9mIGFsbG93aW5nIGEgZGV2aWNl
IHRvIGJvb3QuIg0KPiA+DQo+ID4NCj4gPg0KPiA+IC1JTUFHRV9JTlNUQUxMID0gInBhY2thZ2Vn
cm91cC1jb3JlLWJvb3QNCj4gJHtDT1JFX0lNQUdFX0VYVFJBX0lOU1RBTEx9Ig0KPiA+DQo+ID4g
K0lNQUdFX0lOU1RBTEwgPSAicGFja2FnZWdyb3VwLWNvcmUtYm9vdA0KPiAke0NPUkVfSU1BR0Vf
RVhUUkFfSU5TVEFMTH0NCj4gPiBzYW1iYeKAnA0KPiA+DQo+ID4NCj4gPg0KPiA+ICAyLiAkIHJ1
bnFlbXUgY29yZS1pbWFnZS1taW5pbWFsIHNuYXBzaG90IG5vZ3JhcGhpYyAgMy4gJCBjYXQNCj4g
PiAvZXRjL3NhbWJhL3NtYi5jb25mDQo+ID4NCj4gPiBbZ2xvYmFsXQ0KPiA+DQo+ID4gwqDCoCB3
b3JrZ3JvdXAgPSBNWUdST1VQDQo+ID4NCj4gPiDCoMKgIHNlcnZlciBzdHJpbmcgPSBTYW1iYSBT
ZXJ2ZXINCj4gPg0KPiA+IMKgwqAgc2VjdXJpdHkgPSB1c2VyDQo+ID4NCj4gPiDCoMKgIGhvc3Rz
IGFsbG93ID0gMTkyLjE2OC4yLjE2DQo+ID4NCj4gPiDCoMKgIGxvYWQgcHJpbnRlcnMgPSB5ZXMN
Cj4gPg0KPiA+IMKgwqAgbG9nIGZpbGUgPSAvdmFyL2xvZy9zYW1iYS9sb2cuJW0NCj4gPg0KPiA+
IMKgwqAgbWF4IGxvZyBzaXplID0gNTANCj4gPg0KPiA+IMKgwqAgaW50ZXJmYWNlcyA9IGxvY2Fs
aG9zdA0KPiA+DQo+ID4gwqDCoCBkbnMgcHJveHkgPSBubw0KPiA+DQo+ID4NCj4gPg0KPiA+IFt0
ZXN0XQ0KPiA+DQo+ID4gwqDCoCBjb21tZW50ID0gc2FtYmEgc2VydmVyDQo+ID4NCj4gPiDCoMKg
IHBhdGggPSAvaG9tZS90ZXN0L3NhbWJhDQo+ID4NCj4gPiDCoMKgIHdyaXRhYmxlID0geWVzDQo+
ID4NCj4gPiDCoMKgIGJyb3dzZWFibGUgPSB5ZXMNCj4gPg0KPiA+IMKgwqAgZ3Vlc3Qgb2sgPSB5
ZXMNCj4gPg0KPiA+IMKgwqAgcHVibGljID0geWVzDQo+ID4NCj4gPiAgNC4gc3lzdGVtY3RsIHJl
c3RhcnQgc21iDQo+ID4gIDUuIHJvb3QgIyBzbWJjbGllbnQgLy8xOTIuMTY4LjIuMTYvdGVzdCAt
Tg0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgIFRyeSAiaGVscCIgdG8gZ2V0IGEgbGlzdCBvZiBwb3Nz
aWJsZSBjb21tYW5kcy4NCj4gPg0KPiA+IMKgwqDCoMKgwqAgc21iOiBcPg0KPiA+DQo+ID4NCj4g
Pg0KPiA+IFRoZSBjdXJyZW50IFNhbWJhIHZlcnNpb24gYXBwZWFycyB0byBoYXZlIGNvbXBhdGli
aWxpdHkgaXNzdWVzIHdpdGgNCj4gPiB0aGUgbmV3ZXIgcmVhZGxpbmUgbGlicmFyeS4NCj4gPg0K
PiA+IEhvd2V2ZXIsIHVwZ3JhZGluZyB0byB0aGUgbGF0ZXN0IHN0YWJsZSByZWxlYXNlICg0LjIy
LjQpIGludHJvZHVjZWQNCj4gPiBtdWx0aXBsZSBidWlsZCBlcnJvcnMgdGhhdCBhcmUgYmV5b25k
IG15IGN1cnJlbnQgdHJvdWJsZXNob290aW5nIHNjb3BlLg0KPiA+DQo+ID4NCj4gPg0KPiA+IEkn
bSByZWFjaGluZyBvdXQgdG8gdGhlIGNvbW11bml0eSBmb3IgYXNzaXN0YW5jZS4gRG9lcyBhbnlv
bmUgaGF2ZQ0KPiA+IHByb3ZlbiBzb2x1dGlvbnMgb3Igd29ya2Fyb3VuZHMgZm9yIHRoaXMgaXNz
dWU/DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+IExpdSBZaWRpbmcNCj4gPg0KPiA+DQo+
ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxMTkxMTQpOg0KPiA+IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExOTEx
NA0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210
LzExNDg5NzEzNS82MDg0NDQ1DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtv
d25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0NCj4gZGV2ZWwvdW5zdWINCj4gPiBb
c2thbmRpZ3JhdW5AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4N
Cg0K


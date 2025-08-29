Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BFDCA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 03:30:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5234.1756438224876227178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 20:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=N0OVe2Xq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1336e0395e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57T3UOWQ200591;
	Fri, 29 Aug 2025 03:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=OKjHgSd3KuvSGOPlH/zFuc
	pJYTWeS78weN9Mgi4TGwI=; b=N0OVe2XqASQO4NqPnmtTaVATjPozCfNl2P9A7G
	bVgT2D7CKAzGo096xjENShUXkNyM5x/yrzsdNghBNOyu1XMJgCfA/mKyCM0Jf2SX
	Cmn+xTRkZFgdnuqga1mIN9dmDphaxIaCfwN6d6lw2ychIosBSypEBIHHOOtOazeC
	aFBNWN0SIWdzke71gAbZLyX4UkdOz0siinUkaTp4jvz00mQYw3jsSYfbH65ygyDx
	MHGjrSd9uj38IZ2iBuRyWiGURNnZRJPFGhNCT3jv6I2u3RfyRZspXP1hspnE7pXS
	giQu+Q/ZgOI/gJWsRr5syDTf0vdV+wt+QVb0ExCfc/OaHJVw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1envk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 03:30:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Be0hl/uPM4pyPTbhm05/P+AMdct91XmY17bgNXmDao1iPgxN9AEO/L/TvyB0xttw+ckaZ3RLNfH61ckU6Yjvm8FChHW1PEGw1l9geVTCUiat0SDDXry7nfzfGMqYUM4rt6qUbQZOLi189sY2qRVGY31/yXRjXKSnozPipIuzvkfINXUrb6ieUJmwoqH+4q6xmF2Gejhhs05HA/gMLRMyH2IF7LE1KKI/r+ONFJrbFxUzw16GEXVS3w2B7XP7IDR0n88ZpGrLRQQI21TOL0wlQEUJegi7Aau3g1w++bxcM2/k9aKa40aLazle0FSrjCs1fo/Gq0tcTKUI/jYrzLzTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKjHgSd3KuvSGOPlH/zFucpJYTWeS78weN9Mgi4TGwI=;
 b=xBq3s5LRHqhtGHfGfM/6zLAG9/0pVWryvncAMncK3upD7UNcXEuMi5dhRzKLit7SofYoPpS25oja8OdbZkO1mrgrXghDLB/uzqrqKSeQUfXpIEXsDlcCPOe/hTRQo6gMAr/or6oYYI6pNKn7XBSy3fRzOxPpLtXa9/BVDNCCoQyy36H37MPOywxdcS4f3I2OAeFJo4z+kkPZBzT7gSiMNHs/ja7rd1mctPG1BCQxLSzHsdmga2VPE4JmtuLYht9zKOTMi2Bawm/oxn4h2F1AW66onXww5rspOdhQoFQtRHuMyzfpIMcw6C+k94HAfks9ILDJl44xU3Vt+zQgvFut2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Fri, 29 Aug
 2025 03:30:16 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 03:30:15 +0000
Content-Type: multipart/alternative;
 boundary="------------JrFJFPgjj4cQi0KzYMhieH74"
Message-ID: <782082d0-9cc5-4478-bbe0-38f5be967d95@windriver.com>
Date: Fri, 29 Aug 2025 11:30:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-frozenlist: disable the support
 of ccache
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250828064523.114335-1-changqing.li@windriver.com>
 <CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=P3f3PM1__ygrUnj7tdfg@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=P3f3PM1__ygrUnj7tdfg@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BL1PR11MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2f2dfc-f356-4c9f-7827-08dde6ac5ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REFyb3hKMkRWbGEyYm4zVmJtdGwzR2xJckY2ODAxbVY1TkRuZFFzUUFHYnJ2?=
 =?utf-8?B?bEs3eUlHcTdnWEtOdnRoZ2VYVVZTcE9tdWhCRVNTTU1hbndOYnJGS0hSN0NI?=
 =?utf-8?B?UFdXRnlpcEFia0s4K0d2eUQ3TEFSckRkZWlNVkhHZzZiN0N3TjNZYnpvYmhD?=
 =?utf-8?B?bm9NRXlEczNweDNBZDZQZlpuQ1BWK0Q0RlZqVXUzUE9SZ1RQMXgrWFNlek4v?=
 =?utf-8?B?MlYrMjZKVWhQbU9MNEU2MlBPMDBOSnlCVEVtU010enFoSlFuMkJCWkVpdVVL?=
 =?utf-8?B?ODlBaDh4a2RrNHF4VSt2VVFlcHJGSExVTWhJQzhWRXdrKzFvWE1nQjVmblB5?=
 =?utf-8?B?RWhOR1RIQjRzRVc1bjVKOS9uck9CMGlmK09nTER4L3lYcTd2TUNmY3VrdlNq?=
 =?utf-8?B?VG9CRUttZzlzM090QmI4UXRtSXF6bXhISkJ5WWxEUnp0RlhQYzV4K2dib0pr?=
 =?utf-8?B?RW80WmFOSUU4aEtTSnpSc3NDLzlsTnl1VXRjU0JhdUY0ZW9ESHVYUWpCWW5w?=
 =?utf-8?B?Q1hsQVE4V3ozS1Z1akljRytTNmJSRUVHSnRKVXRob0JiSlhUMjJvU1F2VThF?=
 =?utf-8?B?c2l5Mlhxb2J1WWN1N1BsUmRJaGtXQk56SXZubFBEdE42Qng1dUdzNWRVV1ZN?=
 =?utf-8?B?NEhzOTdDTEFjK2pjN3gvOEVrY1gxTFo3UUdFdCt3YjVjdEJOeVY4YVd1Slk0?=
 =?utf-8?B?SHdGR1JpeGdKdjdpYmdrbEJQaTZTa0Q2TCtYS0wwUlFmSGE0UTJwQ3l5QUxB?=
 =?utf-8?B?d3h0bXhPcEV1eko1T2dHUmRya0puQmx3WEJ2VllRTjNra1R6L28rUWNzNU5E?=
 =?utf-8?B?TjJKVHk4d21md2h3K2JqMEdqZ0lPTWtqb21lYWxRekhmVFdEenRDSjZpYytY?=
 =?utf-8?B?aFh4Q2pUc0N4ZmFSVWhtZnJMcUR0amI4TlExQ2Z1eVF2eCsyUGhlbnZaRnpE?=
 =?utf-8?B?MXVjQnB6dFVwZmFXKzMwWFFBelc1Uy9GbUZaL3RIeWxieXh2UFdxQjZJUElk?=
 =?utf-8?B?MytFeVBtdUhQSjMwZTVPcUwrMDRIRWlocGZDTDlJdHpSK0FGUzFuYVN1NVNI?=
 =?utf-8?B?WU50MmVPWnlrd2lrN0tLcmJhVnlCSTFHL1FVQzFiQm1QOWRHMHVxMGpaRXBX?=
 =?utf-8?B?M3pUbkFKMHVNdE44TXVwbFJSU3AxTFZyK1JNZEtvZlViNjIrc1hPODNsY1N4?=
 =?utf-8?B?bVNIcHpKREFpZkZhM2VvQzhIVTZjZ2dlQTllM2lrRzZsVkZOMWZ5WkRudTl2?=
 =?utf-8?B?VmRpTzcvRnNkWURCazlqYnlwZ1dWTGZVYkwxUmlNenhOZ3VLb3ZRNGx2eVRZ?=
 =?utf-8?B?c1RRRTU0aDdyT2pSdGJ5dVE4VEdsaGR4VkJ2K3M4SXdncHBFM24rOXpydVJM?=
 =?utf-8?B?ZkZucHI2RFhkN1FlTk1GbXZwUGxVNGdKdXpzaEVkNmRjOHlnYXl4WTBZR0R1?=
 =?utf-8?B?Wkt5Z0NTNkVHTzVkU0Z4Q2VFSlNzN3JJRU1zNzljbldOeHlUcHVGN2p2M0hB?=
 =?utf-8?B?UzJoN2s4ampNOFR4ZlBzVXZlTk9UTnFzOXM1SUZFclFDdHhSRWQzVWV5T2Zk?=
 =?utf-8?B?R0p3ODllaGRhNEVOVFdQeEtsYWdTKzA5L3ZyUlVNZ054aVZFeGpJLzR0aExj?=
 =?utf-8?B?WmE4Z2JObG10clVBUWVnVDRQZ25teHRjNzNSOWkwNDdHUzN2cThnNmhpMVhT?=
 =?utf-8?B?VFgwSmNDbUlIajNpcm51Wno3TlhvMTB2VFB3L2RYM1dpb240QUFyWjNqRGRy?=
 =?utf-8?B?TEJwRno0dXdKMnFOd2lpMG5Tc0lOazlseVdob0pZbElIenV4MFJQekRaUFlG?=
 =?utf-8?Q?1WdJnjRckbTvfWyPOMilCwHEmW2dzdrMLoh/A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MnluVlM1WmdyVS9ra3JCRVhuc1RCVEJEODltamtvN0p4KzlSSTJBM3A5WUlh?=
 =?utf-8?B?NlpReFNUY1M0dkJzRzJFcG9ReHJzRkUvSVFtSHMvTVhZWGh5TkpxcWYvajJJ?=
 =?utf-8?B?RzBTc2wrL0pYQnFEaTFEM1VqQm9Ob25BRElsM1Q0SlJ0Q3hXcld1WUZoS3hL?=
 =?utf-8?B?RHI2Y1hoanhFZHRWeWc3MkZvL2xRRUt5QmpzQnN1VGgvZHBWYUYwRFgzSFVH?=
 =?utf-8?B?bGZrYk5XV1RBNTJRMDFKTlk3N3RTSi9YRDlUTXpJRWpvdGMwRlVQamxEYnRq?=
 =?utf-8?B?bW9vWUF0RjJqcTY5REJaMS9HZTVSandsREhrblBQRXpzYTBOMVJSUVkyMDcw?=
 =?utf-8?B?aUNxcFFjTWM1RmRqQ1BWSldnL0dJdHpITy85dTdJbkV3MkxjWlJQU3JLY1Ba?=
 =?utf-8?B?VDE5dXVDc2RobDMzVGlQcmE5Y3ZMaUdtcUZGck5LL1FWT041QkZCWE1lNTZM?=
 =?utf-8?B?MU1xYWIvVHgvSUtweENuQ3IrMElJZk94VmxLbDN3ZWZBdWxUZDVXaEV6WmdM?=
 =?utf-8?B?VFJFWmdXc0xZekJESktHS2NJdERmWCt6UUhPaWpDOFRRU3JrMTRkVFQyaEJE?=
 =?utf-8?B?MG43aWd4bmp3MTJyM25VeTJSeUI3Q011WGdqb085dEdQM05oUVF3cExSWEsy?=
 =?utf-8?B?cG94UDlZU1VaZ1kvQWNyYTl0ZnZSMENmR3F5MmlxLzl6bVA0cmp1ODBoR3lp?=
 =?utf-8?B?Rkd0YXdUZGcrRmZJbzZ1WUt0YTU2M1hDVWhEdGY1a0VnK3R3Z294Q0JpU1FE?=
 =?utf-8?B?Z1puS2k5TVYyMDhwRm9zSzRjTEgyRm9sVFR6b1k3WFhENmVudG85SzVSOVdT?=
 =?utf-8?B?RnQxSGo0OUF2SjljUkFJRU44ek8reHRsUG0wYW1xUWQ2Y3h5dUdKQnJsMVJ4?=
 =?utf-8?B?eFlCeldqRVJQSzJpdkZqOGNCYVRuTGlRMVZ5TVRJQ1NqY1p3Tk9vanU1VnVz?=
 =?utf-8?B?QVIxVXB3UVlXQmpHdVEzck82YU9TeTlSa0dNVHRoM1VxV0tpdUcxNGt2bHZO?=
 =?utf-8?B?dlBaZC9CSmlpaW9GUndlUXpMOElrYmhvbjV0VURKbVI3SW5WMFUwVkRmNjdC?=
 =?utf-8?B?dWkyd2h1ZERFVUZYNThSbU82ZVFQazRiclRHMmxldkczSm1IZGZGT2lpRW14?=
 =?utf-8?B?angrK1dnb1BnOU4xSEF6UDA0OEJRQ1Y3Si9qem9vR29NajlGTW9WbnpFNHo3?=
 =?utf-8?B?QjRRQkpLRDZqRG1rejd4bG52NWdzN0U5US8xYUUrdS85bTg2TnkrcitINDZm?=
 =?utf-8?B?M1lXLzZCNlBWanFDSllwK1ZpamhIcnMxa0MxNTMzOUl3SDdkeXc0bUJyMVBI?=
 =?utf-8?B?VEdlaUhwUlFvWlY1ZUV6dDhLNzFrOXhXdFJUcWV4dGFqK2U2eUdRbnM3NVor?=
 =?utf-8?B?ajNtTE9JMEkxd2prNWNjUzIwSFNodkZVQ01OTVJkS0hHcDJmcW8yUWJDK0Zj?=
 =?utf-8?B?UVJOVk9FU1FFOFVmOHVhMGh0S1Z1WmxPdjdBU0QrcjNXc0hLdGU0Qi92MWo1?=
 =?utf-8?B?U0hvUTF4Q1EvNWJhbGNPcUxLVVp6eHg3TDErSHpMMERaS29YeWNaYm5CNDZj?=
 =?utf-8?B?VWRMSXRTL3dIb0IyTFBzVENocnV4aElqUk5GdlRTdVA0NnpQTll0MUlBcXdx?=
 =?utf-8?B?Q3NCVGZuUmF6by8wRURyTDBIMDcrNTErYTBoTEVna1JzUXQyQ2ZWc2N6YkVx?=
 =?utf-8?B?M1o0MmpPb1BxSWxFS0drTzBmNlRxVnFQVjlKc0dNOW5YZzVuTHJSemFxQkQv?=
 =?utf-8?B?cktQOFpaMkNVTlNab1N0RERsOGd3Zlh4bmJSNU8xaDN1MjhGYzhTeUVmTjB0?=
 =?utf-8?B?QllPeEhXNzQ5OUlZbjNiUC96Ry90U08yVGhBVklTMTUraGZ0OVNDSVRtVW5N?=
 =?utf-8?B?WmxadjRIQ1d4NHcrNWdYYndWS2NDZWt6WGU5czNBV1BwdERKVTd4ZVluRlBF?=
 =?utf-8?B?Zko2QmoxenQ5UTE0cUJFWk9zb0MzcW56NStYS3JVY2ZSZ2tzUHBWU2VFNVp5?=
 =?utf-8?B?OUlnZmllamZtbmc0bm1CL2lEQVRLTmMycTl6R2hrMTMxanRwTm5qM1p4czd5?=
 =?utf-8?B?ZXJYOWh1cDgvY3QybmFLN3ppVlMyU0o0ZWFvY3dtS1E5Sk9iRTdKSFBrcVI5?=
 =?utf-8?B?amllK1lQSTFIb2l3cktQS0RpQ1ZqMWRhM3dvWEVNRVNDRzdVT3dJQmdUT214?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2f2dfc-f356-4c9f-7827-08dde6ac5ea7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 03:30:15.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhYBKKXTsF1iypPZ4B6pV8kO9eeSQNH6VkHlHnUD5WaLmxSKre0FmDSTZiJ3x4ZodUFr+1MaNg5hvtD7VVLtTMBQbEvWJ9sm00J0pkkmjW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: i0PDhRc_YgFxqYoEW82vA3fWANpqhjr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDAyOCBTYWx0ZWRfX2AvT7qQ4RFxD
 nHTTEbPUKXY4UjJLtZW6iWVFU3bCvIhrdtUMYFp6eaTLrX40evuH20dsrq7s+F6tp91MUmzX0cv
 YctFML/clWjxE49jYVwvDiDxDG8XajSSO3WMSZMtr9rYyBlvFPYfdrc7gw4BmGPMg18fIpOjvaR
 K6woXm4RPtbTC2LhYvPU8VujBz6pS/VH9PX+0HP4k5YA+LvW4oImVyB3VywFOnlLrVghCT26oL6
 cDUJB2HoOePYJQgLMd9vXlUNsDsKMuARFldypa0IbLGBB/+gATWmrUQojRCJBt0+sTS84/kLhqm
 9AKThXzFhLc9oSednY5q6QPGosJVVvN/fFGxveNVTBPDeq5StBy/5um95oQ/SQ=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68b11ecf cx=c_pps
 a=t7FPbsrzSg/TVobB0oTxVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=-XV7v8Cev07SsU1M9dAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yj-aMKAYKbz0kkd27lYA:9 a=n6abuh-CIoXcb3xJ:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MOmjnJQQsIHWwSJffFJLq_j_kBYnY4SQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 03:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119134

--------------JrFJFPgjj4cQi0KzYMhieH74
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57T3UOWQ200591


On 8/28/25 22:24, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Aug 27, 2025 at 11:45=E2=80=AFPM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> With ccache enable, python3-fronzenlist do_package_qa failed:
>> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/=
lib64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-=
x86_64-linux-gnu.so in package python3-frozenlist-dbg contains reference =
to TMPDIR [buildpaths]
>> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/=
lib64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-=
linux-gnu.so in package python3-frozenlist contains reference to TMPDIR [=
buildpaths]
>>
>> Although we have set -ffile-prefix-map, the buildpaths is not replaced.
>>
> Its not clear why this is happening. Can. you try doing a rebuild
> after cleaning sstate and ccache for this package alone ?

Hi, Khem

Thanks.=C2=A0 I did some tests according to your suggestion,=C2=A0 it tur=
ns out that:

1.=C2=A0 For clean project with ccache enabled,=C2=A0 bitbake python3-fro=
nzenlist=20
build successfully

2. For clean project, disable ccache, bitbake python3-fronzenlist, it=20
will build successfully,

then, with the same project, I enabled ccache in local.conf with=20
following config, then

bitbake python3-fronzenlist will failed with do_packge_qa error.

INHERIT +=3D "ccache"

CCACHE_DIR =3D "${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}

Can you give some suggestion about this issue?

Regards

Changqing

>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 =
++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.=
7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> index 7d813a026c..363dab969e 100644
>> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> @@ -11,4 +11,6 @@ DEPENDS +=3D " \
>>       python3-expandvars-native \
>>   "
>>
>> +CCACHE_DISABLE =3D "1"
>> +
>>   BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119127):https://lists.openembedded.org/g/openembed=
ded-devel/message/119127
>> Mute This Topic:https://lists.openembedded.org/mt/114930913/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------JrFJFPgjj4cQi0KzYMhieH74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57T3UOWQ200591

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/28/25 22:24, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=3D=
P3f3PM1__ygrUnj7tdfg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Aug 27, 2025 at 11:45=E2=80=AFPM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

With ccache enable, python3-fronzenlist do_package_qa failed:
ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-x86=
_64-linux-gnu.so in package python3-frozenlist-dbg contains reference to =
TMPDIR [buildpaths]
ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-lin=
ux-gnu.so in package python3-frozenlist contains reference to TMPDIR [bui=
ldpaths]

Although we have set -ffile-prefix-map, the buildpaths is not replaced.

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Its not clear why this is happening. Can. you try doing a rebuild
after cleaning sstate and ccache for this package alone ?</pre>
    </blockquote>
    <p>Hi, Khem</p>
    <p>Thanks.&nbsp; I did some tests according to your suggestion,&nbsp;=
 it turns
      out that:</p>
    <p>1.&nbsp; For clean project with ccache enabled,&nbsp; bitbake <spa=
n style=3D"white-space: pre-wrap"> python3-fronzenlist build successfully=
</span></p>
    <p><span style=3D"white-space: pre-wrap">2.  For clean project,  disa=
ble ccache,  bitbake </span><span style=3D"white-space: pre-wrap"> python=
3-fronzenlist,  it will build successfully,</span></p>
    <p><span style=3D"white-space: pre-wrap">     then, with the same pro=
ject,  I enabled ccache in local.conf with following config, then</span><=
/p>
    <p><span style=3D"white-space: pre-wrap">     bitbake p</span>ython3-=
fronzenlist
      will failed with do_packge_qa error.<br>
    </p>
    <p>INHERIT +=3D &quot;ccache&quot;&nbsp;</p>
    <p>CCACHE_DIR =3D &quot;${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN=
}</p>
    <p>Can you give some suggestion about this issue? <br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=3D=
P3f3PM1__ygrUnj7tdfg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Signed-off-by: Changqing L=
i <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windrive=
r.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
index 7d813a026c..363dab969e 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
@@ -11,4 +11,6 @@ DEPENDS +=3D &quot; \
     python3-expandvars-native \
 &quot;

+CCACHE_DISABLE =3D &quot;1&quot;
+
 BBCLASSEXTEND =3D &quot;native nativesdk&quot;
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#119127): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/119127">https:=
//lists.openembedded.org/g/openembedded-devel/message/119127</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/114930913/1997914">https://lists.openembedded.org/mt=
/114930913/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------JrFJFPgjj4cQi0KzYMhieH74--


Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7D8FB519A
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 05:47:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71815.1775532729178170571
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 20:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P3PT8buN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8557271aef=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6372MU3q736505
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Apr 2026 03:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pBq+w1LsG8QST8iTJe5JSIcnROsQjtvXBbujKIVgSpA=; b=P3PT8buNiE5O
	DFEaV/0IXa7c7rYDPgL2AORX5oN2f7CAxyTO2XwRqKPPj04Ag8GxSqS95BC4VpZ1
	2bp16nuMt7MMQT5xZysGfU5eGLN5bF3VEZWXCvkd7fRC2W2QrMrZxcgfvJ6CGw6Y
	jxFVROo/5PrwGxJqL5wRcQV0QgTrC8obMBTLIbII6ZtysRQsWR0VCWl6eaZ7ss5f
	LW7ukaxN3ZU5MMJIgZld83akym8jX+iFVwrnYLTx22DXgQxYmRL1JHCarGGXrSOF
	NKA7no0lBIAzZQh1/2FvdSFvt0tXrSwhB3w9pkQM2pamUG+V9E4Of8BhgnhJ7PqO
	N6jCbSv+zw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmry874d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 03:32:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET5sDzjwv6RpFO33KGLmWMamQk7FfEOvUlaIPt4SvRKThkerJU4kXiDm5zf5KTMsF6ENaW8MdAsLmFHjNsEnqKFTHwmwkgD55J7zgi5GOehh2dtd6eqfQXRUold5JKPfHHNPHY4dg0BnreKO0APzh+nQ/qPLXj62fbKLMdkxUIJ+0BPDK3qj5kWwPWo9CtXtdd/8XWQiWRMgweO1LbB3CcAUTNjCWQ2RnMiUUJjsB1A2nfsOw5OU8P9Q9DnUAPhk92TtVYSJFW3ad4+oOdfVjigbu8cqj7TVKkIuUWn4XRup73KqyK0zSbCeep39VIkAoUsdaLSoeodX9QDO07NLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBq+w1LsG8QST8iTJe5JSIcnROsQjtvXBbujKIVgSpA=;
 b=OOKyZQUfxUdxigUkJUX8NeOaUqOa/kqif2rZeGUXctZF/4cOm82rtTflCZFFTxjQRZ2uND0/751RjiszxKlTMrrHuBpyFWLEI5E8faWVv1i0XvvhI1lgqdIfKrZXxeVIuXy1RXDwNiIeiael4Hlvin76LmX0fEJ1In9zt0hjenbZQRPiePv3ZQ0tEmK0qkVLXc+NeUoo5G8yLWZjFe0C2Rvm7bfNahIEXtpOgdTjce63ZQOY/nuO8bQr1TAZzlL6JlikHUbr0HxhgtpBHErNxhbJvNoCfIBKvyhVShPmatHbqrZVw4R0AUlcLF9dCJ6fnntQxJDRZO7Vo2Pkua2sKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF6E320AF71.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::833) by MW6PR11MB8391.namprd11.prod.outlook.com
 (2603:10b6:303:243::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Tue, 7 Apr
 2026 03:32:04 +0000
Received: from SJ5PPF6E320AF71.namprd11.prod.outlook.com
 ([fe80::bca:5703:b92:3e43]) by SJ5PPF6E320AF71.namprd11.prod.outlook.com
 ([fe80::bca:5703:b92:3e43%7]) with mapi id 15.20.9745.019; Tue, 7 Apr 2026
 03:32:04 +0000
From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-stopit: Fixed the deprecated pkg_resources issue
Thread-Topic: [oe] [meta-python][PATCH] python3-stopit: Fixed the deprecated
 pkg_resources issue
Thread-Index: AQHcw0b2Lupm8/T/vky+l1j1fF0wsLXS92tA
Date: Tue, 7 Apr 2026 03:32:04 +0000
Message-ID: 
 <SJ5PPF6E320AF7145C6D46861BFCE2D15DAEE5AA@SJ5PPF6E320AF71.namprd11.prod.outlook.com>
References: <20260403033841.2186031-1-haiqing.bai@windriver.com>
 <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
In-Reply-To: <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=9ad8fa2f-3f7a-4f8a-b403-ea0bd603187a;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-07T03:31:14Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF6E320AF71:EE_|MW6PR11MB8391:EE_
x-ms-office365-filtering-correlation-id: 226aed94-974b-4d52-a6f8-08de94563ce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 KfyaXfNa2KnUsgPoyM0wSLSBS8JpnHLUIhLOK07Ethh8JolFmd3U9mLGgBN081/Mkt/BqO29ACj8xqkLgP3g+lPQ52LExRzE+F/G642ulLq1vhmWbRLmDtOs4QO0oRiRhIXttsXwzi59szKdhC1PDS6TGyWUQdxVqQHME/NZRTf73GLcmprFVGM6yF6kb+aZw46bPfMqcLzIv8nmrD2Cqbv3KQzAXjIP9jinkXqRClci3XfMBVtLuRBzs5UMpUUB/nWNEpW4gqvjW4FpJo1ecrtmQ31+tyZAuDeARdxekiv8/n3rI0mT1H7l1IS9hQr24oBbQEeOQRGN0hCYkVCccdNjfCcPXuCrwAj0lG/BeV1/4pxZB3uX+KNdu+9nnIpDH2qg/vutxPEy9LvK54MqJeUwNeH1OTHy56EkNaODjhTB0qUyWyTOqLP+kNEqaeAUoE3c3H4Y8NRFqNpsCOjJN48J0yHh8icSDZgv2ZXWWFQilvteaB0s5uE+Gz+jgctCrDaQbw9HxiwKYpsjg0yuL6KfGA59gI35O64fnEUz25g+6xKMWrP0+yciVgLZn25/NIeWA2QsOfmKFDJz1rOGBFhphiu4ZWDLBU4IdM+hjyUMyf2YBDiD1lAl0HLNyPwbCE4pdfp1FyUb3oSNX9uczUGsOu6BxWlgqB6hqewe4F5m45j1L8xNzaEahlptUxRhyOPd4xeoLj7dqsJ4KjVYPu7zcObxuqGNPqousE4fLqk28QHtQmpSeMDA8AS9Ge7VyD/E8cOmOjJ9BrwGNzFL9NCUoCBlNS0CRk9tcrlIuiM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF6E320AF71.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWhDdDQzT3RrekgvTHRMTmhVMWU4V053ZHJCQS9xT2srVzJvTXUyL1NiQWhy?=
 =?utf-8?B?VWpoYlhydlNkaGt4dTQ4OERRV0VRUThqUUxadUVsMDlYRm1HVWcwU0QyYXhq?=
 =?utf-8?B?UHdWRlU4b3Z6UGF2SHhKNk9KM3d3MWRzSC85ckhPMW9pWURnS2NpdWZTa1Vi?=
 =?utf-8?B?RE0yckcvMC9iS1h5VTF3YVgybnI0bDd5dE5tS3o0QWJDRWt5UWJXZ1lwakJP?=
 =?utf-8?B?eStKa0w4S3NDNk53SHc4d3FWVjJTMVl2QXNJSVlJNnpoaHFlNE9ETmU2M2dt?=
 =?utf-8?B?bUJHUEYwV1JDTCtmNWxqZ0hkZDhkc09WSm1CQ0pqZTl5ci9pcmo1UiswYkR3?=
 =?utf-8?B?c0xQVStXOG9rSGI5RUhPRGJoL080M0pvbUhxSFo0VW9WOXA0bWxYQW92aStV?=
 =?utf-8?B?aFA0cDNrTzB0enJ1MGJ4MnV6ZXRKVmphZm11U3hrM1dGQ2kzcy9oOEdJcjVp?=
 =?utf-8?B?T1J1d2RBb2NJMGs2aldCSDRBdzJ0WnJLUVdWS0k5WFg1SzBxQ1diSmRQak5s?=
 =?utf-8?B?bVFHZjI2NWl3RWE4aFBhUzI0Rm43cm80amx1R0YzSFNIZXpsMEJheVV4eUdo?=
 =?utf-8?B?R0kzOTJadGJsN1V5OW1lMGFhNnVPZkVWcGlYQnFPckhENWN6ZXl1NkMrcUs3?=
 =?utf-8?B?dXB6MmExdnZmdmVaTGJHL3BpZkplTDJ4ZHdaWEh4Q2dDejZTbXNRWGVoUThD?=
 =?utf-8?B?bi94YW9KSEkzU0o1bUlIdFlFRU5uUWh1bXk3clVGa1BUS25RaVZXdE5YYXJo?=
 =?utf-8?B?NVRnLzllYS9EWkVDelFIN1ZDS0VZeG5tNVp4QUxlQmRmQ1dxT1B5Tk1WWVAr?=
 =?utf-8?B?UU1mZHRYNnAwM1ZibFhGckNTWEw4TUVJNHVTZmJ4SHloWG5MOTZTaHd2eVV1?=
 =?utf-8?B?czlzV2NnZU5WYVNVSVJ5YlVyRTYzUUlCdFkrb1F6UUE4RTNsclptbUx3U3E4?=
 =?utf-8?B?RVFLVVluZTRIM1FqZEZBWlkybjIwd0d6dWEwVnk3OEJSRm0vTFFNb1JzK0hr?=
 =?utf-8?B?OCtNT3RWUnQzaC9TYlZKRXpBM2Y1NDJXbHpwWU9iOGFGdmpQeFIrd0RLdHFY?=
 =?utf-8?B?SUxkVDNTSk5PY0cyemRMYWd3MTNVZkwxQ0FCS016RzBHSzVTeG5Hdmh3RnhN?=
 =?utf-8?B?RlBCdXZEdEJOWnlrc3ZERVltazc2cUFEMHRJYm5DaU5xWnkvaEd3MGZMQ01F?=
 =?utf-8?B?UGw0UjhiT01WeVFhdHRDVTBQQ040QURCY1c5Q2ZlQmZxV3VOMnFXQnlHaXlh?=
 =?utf-8?B?c1VDb0ZaRWtVMTRyRUViZThyNG1udGppSjZDSDJ2cTd1Tms4U1ZrTUczT0FT?=
 =?utf-8?B?YWorNnBPdUtiNWdZZ05GM2NIRSttUlJhNnphNVFWUHFQbkxDaHFmVGFLR0hU?=
 =?utf-8?B?Mk4wdVQyZU1WeWdKMGw0eHpoK1ZDL3BMM3phNWk4WXpZdENUWFlXTXB6REtt?=
 =?utf-8?B?bW0rZWpzR2hpTHBVWnNpdEpHaVEvbU9sMitLblNDZGxuT2RJeVoyZ3lXT1hQ?=
 =?utf-8?B?OTlrejIxQjVFWXpydkxRbVZxMFRaWFkrY3VtSUN1Vno3bkpJNTBRQVFiZ24z?=
 =?utf-8?B?cVF0T0ZscXJzMVk4UzBSdjBGNVJFbmZCWDdXVHV3bjBhQ0g3bVMraVRiY3h3?=
 =?utf-8?B?Y05mbi96SkJ5eWlRMzJoVnZoMVBaalY4NTNTUEg2MTdPVWJtNjdhaSt2U2hU?=
 =?utf-8?B?ajIzUTRuaEFZbGNjbFE2RzZHS0tnSWx1MGViUmZNZHFidi9TR2pZSXRZNXdK?=
 =?utf-8?B?aFhVVUZRNlorRmwvRWhiZ3Z2d0Uybkdaa2gwdFRTM2V3U0NZYUFoWTUrWWpj?=
 =?utf-8?B?Y2lVWGdkZHJUL1BQckozOXpSUnRuVU5UZXpNUE1DNGQwVGJZQXBnN0VwMGwy?=
 =?utf-8?B?aFFsVW9leVdYSWdWN2xxc05GOE1LY1NHQ2pIM0tkVmJOYlJWMnoxaEVpYmNj?=
 =?utf-8?B?Ym1JRUFUYkVhdXB3b3ZFZEVFRkpnTS9UdGl4R1lHR3VlMEZxWm8rRTNFQjNw?=
 =?utf-8?B?cGV3bWV3VlpGUnBpaWI2QmI4bzBOMnB6K0wvdW5lN0wya245Ni8xaG5KNGxu?=
 =?utf-8?B?ZjRocGZQYURPMEhaRUtwUDMzb1VzempDYXowZTF0WUFIamZ1bGxaQTVFVUNW?=
 =?utf-8?B?NG9laDhuNklKcDRJRTArZHhYWlltREs2TWZXYWxEd0tOM0NLeVFMK3VESkYr?=
 =?utf-8?B?RVUzYzNaeFZ0dExwOVAzTHhrM2dCOUM0eW5BM3AzL1U1YXFadS9abS9pdkdl?=
 =?utf-8?B?WEtIR2xjRGVWbEhxbjR6QWc5WlRzNExOQlBiMDdTVXRmRGpNTlVIbi91c3lU?=
 =?utf-8?B?V3VxMy92djVRaCtvOVdKQ2M3aGo4QWN4VDhVVGpwUE1uak9vL0lNdz09?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	edit3Gz5Jm7UO/QIohhWWeqGFUoP2GdanAI30eUz9wdely/tBcxL5sMkznaoEValt8t5nV+ruJYLOwMz3ot7g46G/70ZgYXQHoOR1hjZyIypftiFwSwh3fG8zgpjsTTBI9T7uE1ojJLyyFJF/Wysa9ncuneAn9FLO9EAvMxuXd+S8m14w8qbxRro173pGoaCua4hItfkiKSS8+b2KG8RtTvaa709kacM96MiOR8reFiOFCOqXR2oLrmqhKutKzIs89LBzG2RWld/3lcwqg4bYlwc3p+tirVK28LVA5S9D6X/5HDm5XA9WrkUWaT6L9K5HRZKDZWrTDtohs+uEfPFHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF6E320AF71.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226aed94-974b-4d52-a6f8-08de94563ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 03:32:04.2361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdmCLoLQ1uRMEFUnHo5jcMC3XcynKP1Qro33SNxn2sIR50tp/mj7V9lvdDFCf/EQ+pwsZ16vTs3bN2X+8ENQl5JpeFAdbwU0SiH6g0T9s1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d47ab7 cx=c_pps
 a=TuoCv7SfN2yFw/uhdbj5/Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=CckQENj0AAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: SykqAxeHH6S2liHSK5OimOWZKvZUi8T4
X-Proofpoint-ORIG-GUID: ZdxdY_TKIq8bz1BYEB7Rai9OHcDMjdpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzMCBTYWx0ZWRfX0mgxunh7DPSg
 PWcm0N524DnV0sUSopi/QE9/DFJunuRVlChmVF2jCqdlSe4ZWKP+CbWGN8Aqp08Rtv5jcDzw3ax
 f8l785LMHYxN9ZQKB6YWEWIGyjvMjMeSrLyneUGdrYHyxv7jw/E2SUf5UAHVjzQGCgFzCS6OXNq
 H3wwjDZ7pB52ek5KFH+ID6ODU9V7LUN0hIR0u7vMmP2rQxQH75/8hK+GrSQjIX6WiJ+ZuLp/ihF
 Q5CLCU94NqIKCUqSdkGi3/tazbT8NOt5MwGYdHnvqlWPKTAK1R8Ic0tRrcjyjRTQeTygQr+d+8i
 dNnqwopnysUzSkLfFp0mlLBFi7VdhmLJA2wxXbCUdE85B4VSpcMXTOhy2MawtkOVuqQo9hpPSol
 G5CoLcATmg/sGPDeiha9Zh5DcpyFEPgyhbailO9OpmjpAwqKOtpmJUDD1zHJFzSDVP/CKvBL/zc
 2vqafYj0Y/LckKEX3Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070030
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 05:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126074

R29vZCBjYXRjaCwgdGhhbmtzLiBJJ3ZlIHNlbnQgYSByZXZlcnQgcGF0Y2ggZm9yIHRoaXMuDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRp
Z3JhdW5AZ21haWwuY29tPiANClNlbnQ6IDIwMjblubQ05pyIM+aXpSAxNjo1MQ0KVG86IEJhaSwg
SGFpcWluZyA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1weXRob25dW1BB
VENIXSBweXRob24zLXN0b3BpdDogRml4ZWQgdGhlIGRlcHJlY2F0ZWQgcGtnX3Jlc291cmNlcyBp
c3N1ZQ0KDQpDQVVUSU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBl
bWFpbCBhY2NvdW50IQ0KRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KDQpPbiA0LzMvMjYgMDU6MzgsIGhhaXFpbmcuYmFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPiBGcm9tOiAiQmFpLCBIYWlxaW5nIiA8SGFpcWluZy5CYWlAd2luZHJpdmVy
LmNvbT4NCj4NCj4gcGtnX3Jlc291cmNlcyBpcyBkZXByZWNhdGVkIGFzIGFuIEFQSS4gVGhlIHBr
Z19yZXNvdXJjZXMgcGFja2FnZSBoYXMgDQo+IGJlZW4gcmVtb3ZlZCBmcm9tIHNldHVwdG9vbHMs
IHNvIHRoZSB3YXkgb2Ygb2J0YWluaW5nIHRoZSB2ZXJzaW9uIA0KPiBuZWVkcyB0byBiZSByZXBs
YWNlZCB3aXRoIGltcG9ydGxpYi5tZXRhZGF0YSBtb2R1bGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEJhaSwgSGFpcWluZyA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICAuLi4w
MS1Ecm9wLXRoZS1kZXByZWNhdGVkLXBrZ19yZXNvdXJjZXMucGF0Y2ggfCAzOCArKysrKysrKysr
KysrKysrKysrDQo+ICAuLi4vcHl0aG9uL3B5dGhvbjMtc3RvcGl0XzEuMS4yLmJiICAgICAgICAg
ICAgfCAgNiArKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXN0b3BpdC8wMDAxLURyb3AtdGhlLWRlcHJlDQo+IGNhdGVkLXBr
Z19yZXNvdXJjZXMucGF0Y2gNCj4NCj4gZGlmZiAtLWdpdCANCj4gYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0b3BpdC8wMDAxLURyb3AtdGhlLWRlcA0KPiBy
ZWNhdGVkLXBrZ19yZXNvdXJjZXMucGF0Y2ggDQo+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zdG9waXQvMDAwMS1Ecm9wLXRoZS1kZXANCj4gcmVjYXRlZC1w
a2dfcmVzb3VyY2VzLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAuLjQyNTIzODYzODQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0b3BpdC8wMDAxLURyb3AtdGhlDQo+ICsr
KyAtZGVwcmVjYXRlZC1wa2dfcmVzb3VyY2VzLnBhdGNoDQo+IEBAIC0wLDAgKzEsMzggQEANCj4g
K0Zyb20gYjcyODI1Yzg5NzI0YzJjM2I0YzljNjBkOTBjOWQ0YWQ1OTdlZWFkMCBNb24gU2VwIDE3
IDAwOjAwOjAwIA0KPiArMjAwMQ0KPiArRnJvbTogIkJhaSwgSGFpcWluZyIgPEhhaXFpbmcuQmFp
QHdpbmRyaXZlci5jb20+DQo+ICtEYXRlOiBUaHUsIDIgQXByIDIwMjYgMDg6NDA6MjYgKzAwMDAN
Cj4gK1N1YmplY3Q6IFtQQVRDSF0gRHJvcCB0aGUgZGVwcmVjYXRlZCBwa2dfcmVzb3VyY2VzDQo+
ICsNCj4gK3BrZ19yZXNvdXJjZXMgaXMgZGVwcmVjYXRlZCBhcyBhbiBBUEkuIFRoZSBwa2dfcmVz
b3VyY2VzIHBhY2thZ2UgaXMgDQo+ICtzbGF0ZWQgZm9yIHJlbW92YWwsIHNvIHRoZSB3YXkgb2Yg
b2J0YWluaW5nIHRoZSB2ZXJzaW9uIG5lZWRzIHRvIGJlIA0KPiArdXBkYXRlZC4NCj4gKw0KPiAr
VXBzdHJlYW0tU3RhdHVzOiBJbmFjdGl2ZS1VcHN0cmVhbSBbbGFzdGNvbW1pdDogSmFuLzIwMjQg
bGFzdHJlbGVhc2U6IA0KPiArRmViLzIwMThdDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEJhaSwg
SGFpcWluZyA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNvbT4NCj4gKy0tLQ0KPiArIHNyYy9zdG9w
aXQvX19pbml0X18ucHkgfCA0ICsrLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvc3JjL3N0b3BpdC9fX2lu
aXRfXy5weSBiL3NyYy9zdG9waXQvX19pbml0X18ucHkgaW5kZXggDQo+ICs2Y2EwMTgwLi41ZGRm
YTRhIDEwMDY0NA0KPiArLS0tIGEvc3JjL3N0b3BpdC9fX2luaXRfXy5weQ0KPiArKysrIGIvc3Jj
L3N0b3BpdC9fX2luaXRfXy5weQ0KPiArQEAgLTcsNyArNyw3IEBAIHN0b3BpdA0KPiArIFB1Ymxp
YyByZXNvdXJjZXMgZnJvbSBgYHN0b3BpdGBgDQo+ICsgIiIiDQo+ICsNCj4gKy1pbXBvcnQgcGtn
X3Jlc291cmNlcw0KPiArK2Zyb20gaW1wb3J0bGliLm1ldGFkYXRhIGltcG9ydCB2ZXJzaW9uDQo+
ICsNCj4gKyBmcm9tIC51dGlscyBpbXBvcnQgTE9HLCBUaW1lb3V0RXhjZXB0aW9uICBmcm9tIC50
aHJlYWRzdG9wIGltcG9ydCANCj4gK1RocmVhZGluZ1RpbWVvdXQsIGFzeW5jX3JhaXNlLCB0aHJl
YWRpbmdfdGltZW91dGFibGUgQEAgLTE1LDcgKzE1LDcgDQo+ICtAQCBmcm9tIC5zaWduYWxzdG9w
IGltcG9ydCBTaWduYWxUaW1lb3V0LCBzaWduYWxfdGltZW91dGFibGUNCj4gKw0KPiArICMgUEVQ
IDM5NiBzdHlsZSB2ZXJzaW9uIG1hcmtlcg0KPiArIHRyeToNCj4gKy0gICAgX192ZXJzaW9uX18g
PSBwa2dfcmVzb3VyY2VzLmdldF9kaXN0cmlidXRpb24oX19uYW1lX18pLnZlcnNpb24NCj4gKysg
ICAgX192ZXJzaW9uX18gPSB2ZXJzaW9uKF9fbmFtZV9fKQ0KPiArIGV4Y2VwdDoNCj4gKyAgICAg
TE9HLndhcm5pbmcoIkNvdWxkIG5vdCBnZXQgdGhlIHBhY2thZ2UgdmVyc2lvbiBmcm9tIHBrZ19y
ZXNvdXJjZXMiKQ0KPiArICAgICBfX3ZlcnNpb25fXyA9ICd1bmtub3duJw0KPiBkaWZmIC0tZ2l0
IA0KPiBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3RvcGl0
XzEuMS4yLmJiIA0KPiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3RvcGl0XzEuMS4yLmJiDQo+IGluZGV4IGE5NTI3MjI2MTkuLmE4M2FkZmZjZDIgMTAwNjQ0
DQo+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Rv
cGl0XzEuMS4yLmJiDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc3RvcGl0XzEuMS4yLmJiDQo+IEBAIC0yLDcgKzIsNiBAQCBTVU1NQVJZID0gIlJh
aXNlIGFzeW5jaHJvbm91cyBleGNlcHRpb25zIGluIG90aGVyIA0KPiB0aHJlYWRzLCBjb250cm9s
IHRoZSB0aW1lb3V0IG8gIEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9zdG9w
aXQvIg0KPiAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iDQo+DQo+IC1TUkNfVVJJICs9ICIgZmls
ZTovL0xJQ0VOU0UgIg0KPiAgTElDRU5TRSA9ICJNSVQiDQo+ICBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly8ke1VOUEFDS0RJUn0vTElDRU5TRTttZDU9NDk3YzU1NmY0MmIxMzU1YjY0MTkwZGEy
ZjNkODhmOTMiDQo+DQo+IEBAIC0xMCw2ICs5LDExIEBAIFNSQ19VUklbc2hhMjU2c3VtXSA9IA0K
PiAiZjdmMzljNTgzZmQ5MjAyN2JkOWQwNjEyN2IyNTlhZWU3YTViNzk0NWMxZjFmYTU2MjYzODEx
ZTFlNw0KPg0KPiAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzDQo+DQo+ICtTUkNfVVJJICs9ICJc
DQo+ICsgICAgZmlsZTovL0xJQ0VOU0UgXA0KPiArICAgIGZpbGU6Ly8wMDAxLURyb3AtdGhlLWRl
cHJlY2F0ZWQtcGtnX3Jlc291cmNlcy5wYXRjaCBcICINCj4gKw0KPiAgUkRFUEVORFM6JHtQTn0g
Kz0gIlwNCj4gICAgICBweXRob24zLXNldHVwdG9vbHMgXA0KPiAgICAgICINCg0KDQpBZnRlciB0
aGlzIHBhdGNoLCBkb2VzIGl0IHN0aWxsIGhhdmUgYSBydW50aW1lIGRlcGVuZGVuY3kgb24gc2V0
dXB0b29scz8NCkkgdGhpbmsgbWF5YmUgdGhhdCB3YXMgdGhlIG9ubHkgcmVhc29uIGZvciBwdWxs
aW5nIHRoaXMgaW4NCg==


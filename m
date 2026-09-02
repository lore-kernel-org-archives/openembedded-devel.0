Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F27C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 20:55:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5772.1788382505802268258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 13:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qKqbGFP2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3705c4c712=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KIEtg663928
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 20:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=swB8sU750HrDtPbaD9L8x+
	G6yjBYdoAGJ7rbVPRT6ek=; b=qKqbGFP2kPRzjdM3rMmgebJGSvIzOCwomBIlFZ
	gyc1dUgCsULzUj9WbXFypOhg3qR5y8n2Y4eyd+x1xSEQCwlDZJX3D+nigDvSrnAZ
	OuuxDvYNfWCLVoe/FZC40W6ONwf0F6nP9tprZqJgDa38iHkDilkyq0L9U/RXt9k+
	m387sBT/bqNBOPb7PTmpCRHX8b7vwkHoGcjg44tMNOEYqfhzP9zD7+B2ovIKJD42
	6691XjeBhghXoL5aGCWodTX+eanpXmZ73IU5jzqvpH4dB3HAH44YbI4q8TXuwg9V
	MMKCDrfrZe5W6MhqEUfIPF8sXEhDVDWD9aU1jeSqqiRWtwUg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023130.outbound.protection.outlook.com [40.107.201.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7y3xt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 20:55:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXfXTMY0YVM2vqtBB7u/vJAHfIx/FHJt4ohXJYzyRl14ieEO6fxoWB35k7yM0gJjX9WrVHLT4RvbGqm1sS659RRRKRvCNFpI5JcvA6oH27d1hket5XN0RhNN4x408+5U6V1u2vtjoGrSAJm15acvSS7Jl+PR97Zcd0FkUnT9veoURa0va4QJ4aGDay1HH3cygmvjt7z2g8VQKk9IAFzm8fKjQ3cv94wRp/Hs9bD81WCDtIX39w21fLCChfY2c5N21KahUc4r6vbTPV5ruWLmyoKp4G6cJU5DRsIAV0oJlupX/WjNamSEUav4fND1Eon/B/S11x4VrN78Q55ItbpeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swB8sU750HrDtPbaD9L8x+G6yjBYdoAGJ7rbVPRT6ek=;
 b=KPmLwFQZU1cu9+WntfqbhgXjCwgSVgAmn1t7xHNIthtFwW0uxQNOjvXxsQ6y6h5RzBX3XwAIks1HaHCzSpkV/f2ai27Zz8Lkxm8OEFLLdbQrfSq0lgAlbQuNFuahguSiwH350/mAisvkw/saGbtPV9MIIybGvIf7HgtSPy3230T3UAmWKZGBTV1zA7hJAVRreidhEmvgxAdZW98SrvAXYzkP5fgf6OdLZCD6WcAxm1bJfjdVv0tnG90PAVmGQu0r9uzUaD/Kjdu96NtD/S3uA3he/bS4N0RYnuUKu2zBX8oRpuxv4zeFxnFmNup14HSeeM7Vf2S/dxG8UkMfn2HIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LVTPR11MB9911.namprd11.prod.outlook.com (2603:10b6:408:3c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 20:54:40 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:54:40 +0000
Content-Type: multipart/alternative;
 boundary="------------1X0hh96DzGdNwxut61i0PhXT"
Message-ID: <9da89134-bce4-4777-9bc2-36c0930c90d4@windriver.com>
Date: Wed, 2 Sep 2026 16:54:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][wrynose][PATCH] thrift: fix CVE-2026-58662
To: anuj.mittal@oss.qualcomm.com
References: <20260901090727.1384945-1-Abhishek.Bachiphale@windriver.com>
Content-Language: en-CA
Cc: openembedded-devel@lists.openembedded.org,
        abhishek.bachiphale@windriver.com
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260901090727.1384945-1-Abhishek.Bachiphale@windriver.com>
X-ClientProxiedBy: JN3P275CA0103.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cf::14)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LVTPR11MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ac401e-6868-408e-5640-08df09346857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|23010399003|12006099003|18002099003|22082099003|3023799007|8096899003|56012099006|13003099007|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	vyYKkrkAbKl2ZDui7f5/0eDfnAiOUf9abVqMUN4Xj/WwjyfOv/8LDN/ZoaYoWSl7Y1JZiw6uACnOWpJpVQa2t/2v2JlTGh+56cOTVdgcrfCg6mWBUHJHdKpHBZezBfIwctrxgugyDdU+9/52LwDZVJ+koZ/pUOeowtWjl71/WSENlEyUVqf4vtMOlu9a9PePCQsym+7NticCPVAdAdONHNhx8wMfFqmCIADJ/MKlWTAC5UG/uCOUoUgD6YlCwII3rYIED2Rs1TMtJ33XfJKwYEzzn4Krb1Z9Fwoi6fGnSLf9fSWr+3peaU1bIuhaebA2WBe+kor+l2x7Qin4wuEEUQLPuEMONo5OrYuMUbxdXP9MPvwo4AkjQjAf2ZfyTSa4N4MR5s3GyvPrTjfi6WavDFvNlnQak+rUN5qkXATcV7NHVgO/GV7l1eGj81jBzsUKQ7MFSsSLixC4W4wMlPWXqvsj2Py7c86YkHagLf657ra0tTvL5rVPC4EK8B7qVdfTLo0rBEZSnDW2EI//Di8lzWYPrvpBu0YECwTr4qqV7zJhtG5sAgpNnar6w0F2O+8R4OMF+03OcMMY6lkPu+SSN4lmb9O2gyZfd7Pp+Qt94oU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(23010399003)(12006099003)(18002099003)(22082099003)(3023799007)(8096899003)(56012099006)(13003099007)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDhyeHFwSTZkeHNuc1lCN1IvY0lOdmQ5WU9WTVRTanYvSTNMVVpEMldCQzM2?=
 =?utf-8?B?VEtmbm4rZUhQN2FSZmhpZnUrWm5hQVQ1L2RRbEhZRVY5N2JqR2FmNFdiM0lS?=
 =?utf-8?B?QWx5d28zODJDWWptaXFseDZjaUEydEZYL1dITkFwV3JaOWhMTHg3bE9DZUhF?=
 =?utf-8?B?UmNjbEtjcU1IZmE0WjFOVklkQnRsVE1jV0J0UTVVa3BqZWswVTZlbUhPTWRL?=
 =?utf-8?B?K2RsdW5NajY3NjJsVXVCSE9QRXNQYW5CbTJqcEpFTndxTjJ1ZGlwZElRdHd4?=
 =?utf-8?B?eFNqbktESmtWb2RnY1JTMy9TQURlNSt3SDdwODR1THpDY3dLT0lrb1ZqVjdl?=
 =?utf-8?B?ZEJOTmpoellDdWZjU3ZKZ1hlNFU0U3E0QWhGTStMQTdrNyszMjlaSzRhZTdD?=
 =?utf-8?B?TzRaQVpTL0w5b1drZkc3RzhBVEdROVpxMDA2MUVvZEdhMlJEZHduWEtiY3Iv?=
 =?utf-8?B?U2VyOFJvdVBsTzlBRUk4OTFrbzV3bGlzOEJNRzBKU1VSeHJiUTMzS1IxSHpR?=
 =?utf-8?B?K1BlWHA3b0d0VXNScXFmWTNXZTFOa0FJMzhUbUl3MTZEc0N0M1NiWEExOGNk?=
 =?utf-8?B?VWRaMWpBKzNpTk1MT0ZPTHdWME1RMHRUUXZmenZpNjk0Qk54ZkJnRWIzeWR1?=
 =?utf-8?B?UjBjdm1zbWdPaEx1TXVwTnZ1MWE4bmMrNHVqZlVERlJqN0dyd2tZWG41bUxN?=
 =?utf-8?B?YldQbEFsdEdSODB1RG43VUVCRzhXU3p1MGIwM0VFLzdldW1aZklVK3p5bmxr?=
 =?utf-8?B?S3laYnh1YnA3QzdJYTJzUU1SdlNzUTNXR2hJN3JhUWZrRms1U01kdU4wQW1M?=
 =?utf-8?B?MzNUVWkzMDQ1Wm81NE9uelFyZFJRZ2JQMmR1VmtwcDhuL0FsbWNGWTVTRncw?=
 =?utf-8?B?TGNtQjNvakVqTFA4bndDc1dnbTN0R25rSjl4bE5ROWwxemVCcVJoR1Nndncr?=
 =?utf-8?B?cDBrdEw3Qk5zZ1hWUHBxVzIvNHJhb0MyblhkeUdnd1RCWENML2VQaElwUUZJ?=
 =?utf-8?B?OHVVQ1lRNDRpcnBXdFcyNk5mNmdjY0NhUTNJYVJieElyaDhXakp5VGp2TWVI?=
 =?utf-8?B?cDVwd29GOE5XQlJydTJndm93ZXc3UmJTWFZPRDZwQm1rTzhmS1lKUjN5QzJr?=
 =?utf-8?B?ZGpJRVlhWVMvTnpMSURWSXFTVEowRVppVTJwT1FmbGdEa0Jkcng3TGFYb08w?=
 =?utf-8?B?WnVNUW03RC9mby9xdGF6N1ZaenhZblM4ZWxvZjhxdEdVZlVMdjAzTXVZWWJJ?=
 =?utf-8?B?WTNIbFV4eTBOR2pYV01kMUcvT3R4aUtHTGloY1NzZzMrUGJaR3hWYk5Yd3gr?=
 =?utf-8?B?STh3c0dZU3gyVStXWmVQdW81blVadXBDM0gzR2tzbGZMWEczZ0hhQmpLRlV1?=
 =?utf-8?B?ckhZbmRDejJCeERJcFVHYmNkSWdxRW83Z25XRUhDTFJNcnRtMzArcmp2eW1u?=
 =?utf-8?B?dmxUWi8wN01MRVBhMHB2QmdFbklnZDRhSmxKNWxGNEdJTGpCNTdMMTRXNy9p?=
 =?utf-8?B?ektmbEJiTGd5b2trNWJPUkJGMTIrcFdUczRZVW92bCtxUkdWMExqekhoc0Ux?=
 =?utf-8?B?SUk0NFlTekhsZW1uYmlrLzR0QzlEWDIxam93OFNRNlJSdC83NnJ2dHltSjhE?=
 =?utf-8?B?YnFWbko4MHQ5ZGY1NllqU2JEZ1pBZDRaOGpqMFJYZk9JT0pqZlR0eXdtSGJl?=
 =?utf-8?B?UlNXTmpMRmZMd1ZsNGc3ejh2RzFGQTZxU3VjUXcxR2V5NTQxMnIxN010dnk3?=
 =?utf-8?B?cjNqV1BUUzMxOUI3MVZHQWk0UmVlRGdkZ0RtcHZGeVVIa1VwVDQ5ekhMZ2tl?=
 =?utf-8?B?dk1Va1lkZE5UKzJnNWZlMmNLUC9qU1ZVTFpMd3FFOWJRQjdBZTVJMjFxWUNN?=
 =?utf-8?B?aWd6akFDV1NkYzMrQzNBd1k2WjZmMDZQV3FRcUZ2cHdkVHBIWTN4WmtwcTlD?=
 =?utf-8?B?RkFHdkNUdFRYdTNFUHdTQVFPTFk5U21sNHR0YnJRN3J2SEZwLzhIL05pZFp0?=
 =?utf-8?B?bkk5bXhVQjYwYkJERzg4MVA5Z2NNODVwUVptOXVuZVVkVU1jMmltVUhpVWpV?=
 =?utf-8?B?c0s1R082YXdEb3BuRGRTQU96c2dhakIzWUllM1BWTjErMTVNc25MenoyVkV1?=
 =?utf-8?B?RFlwN2tIa1FWcno3WnNyQ2h6eHhnZnArY0RtR3VJSjZEeUFsenFGRThiUTA3?=
 =?utf-8?B?Z3JQRWxqVUQycHVyczNnZkVycjJyd2VhdG9jN2hzWU5WR0xBSE8vOEw5a3ly?=
 =?utf-8?B?WWJoWGFrY0NTdTdHcEI3ejh1Vllqb0tiMDFnWm93V1ovdHd4Um9ISXVhRENv?=
 =?utf-8?B?TldNM1JMWDMyUTcraFdYWkxWMUE2eFYyc2Ixeld4eWJ2d3p4MnRXQnlUQkto?=
 =?utf-8?Q?YjxXluXgHUi1/tu8=3D?=
X-Exchange-RoutingPolicyChecked: 
	p2XdGX5H79uuP92DVukFmGCOgptzsYfKXfQusV0jMmD9d4ql24FCTjHCOMO0oLqrE3Q/tx5Eb4fgCjs6M8FQuj2lvYzB2Fp0SJDrBq70qpH0yObXwsWSF72mweXauIiUAQpeSEPTqky/s4gY52ig3cOi7euSeZOqVg0DukNfipuHxDOWsjOtUWyjBIQh5KQTanVdrqmuMftF0th8xA+Rp13ieWTzA4XSrPTHcmIqz62mhnbHbMLum1m1gTp4z2jqImyFVg0PElgCBKXs0w5jYX1JWo71vLCgcwVf7XjpUYIiTHBYS1lFRwjZuSehTdyDFNym5glsgTVOL9gplWM9cw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ac401e-6868-408e-5640-08df09346857
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:54:40.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtNLXM3ln4cJLzeNddFYJMYYfImY+RxKo2g+0WKt4o4maReVGJUMZONezHlcVzSx+zB6dxkXmcQuL7l+7hqQthxUlI9ibGGBAV6E+rmFP0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9911
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a988d28 cx=c_pps
 a=nEDKMBs7eiJgagyIvhaA9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=X_X7u_Wdfzdiv8q18nYA:9 a=QEXdDO2ut3YA:10
 a=4W4P1tTYNDWaK4J9zSsA:9 a=caLOBaYJMhJGPtYx:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NSBTYWx0ZWRfXxUubbfnpUf9J
 jL1xKtEvxLbtHlCyaADcLKx6fa0Jh6gvxq7X7ga/XuONTSJYFwAJPD83eC34ZyI3yD1OEJVad+S
 3jH+50EGDiAuvJTVNVONPR8DXBN2Z2riWpqgRdcoeNB/LhSVgJH4iy3VGglDvRMCw9Bd3550t29
 ZGhGBG+8a0LK0ire0o6qprM/5nOMyCrVgXoYPkjJxstqKSbf/cRA+MBV+bAmNTUYceeo0ZM7ZeO
 k/WyNrahx5mCnD49O8ZnCK47D6iXxSxybiO0kQlZGeDd8cUrvLRnWF1TQkinOPztQAtFrsRTmVW
 lpNa7mMlELSKDIMX64CXDTbIM6zhbCgHcIq2Pp5eZY2ie26WUixkwnquhr47V1CGtDZtwFywJe3
 Y1yAr84g+vxMgskfy8yvvlU2eecNxd6bCFgu7jYTXGj4A4tK8eciAJIory3FYzWs0ga88CspIS4
 H6FFuFLKBVaiw6ZMRSQ==
X-Proofpoint-ORIG-GUID: Dma2zITX7fKswn1YRqgXx8ew_lXaejuH
X-Proofpoint-GUID: lT20TpXnLRxYOvY3V5u-7_idsUyECfVx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NSBTYWx0ZWRfXxf26CX1dSnND
 r1PEfDG2KKA8v9xBiRngLPopO+/TA8y6lSjZDGoOiYtUZI1RdEHRN/PCjjb5mJDYquBlFoNZqKH
 1zvmFl1ZYNwnbSpjHzmo5IetxcDWk3ug3pJnQFhdmi++nrCoyNo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020185
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 20:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129701

--------------1X0hh96DzGdNwxut61i0PhXT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Anuj,

It seems like you missed this one.
It still applies to wrynose HEAD for me and seems like a good backport.

../Randy


On 2026-09-01 05:07, Abhishek Bachiphale via lists.openembedded.org wrote:
> Improper Validation of Specified Quantity in Input, Out-of-bounds Read
> vulnerability in Apache Thrift C++ bindings. This issue affects Apache
> Thrift: before 0.24.0.
>
> Backport patch to fix CVE-2026-58662.
>
> Reference:
> [https://nvd.nist.gov/vuln/detail/cve-2026-58662]
>
> Upstream Patch:
> [https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0]
>
> Signed-off-by: Abhishek Bachiphale<Abhishek.Bachiphale@windriver.com>
> ---
>   .../thrift/thrift/CVE-2026-58662.patch        | 120 ++++++++++++++++++
>   .../thrift/thrift_0.22.0.bb                   |   1 +
>   2 files changed, 121 insertions(+)
>   create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
>
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
> new file mode 100644
> index 0000000000..03eaccb17a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
> @@ -0,0 +1,120 @@
> +From b9fe622d3e3dd2e376fbb5ccf2acfbfaf498ddb1 Mon Sep 17 00:00:00 2001
> +From: Javid Khan<dxbjavid@gmail.com>
> +Date: Tue, 30 Jun 2026 16:34:47 +0200
> +Subject: [PATCH] fix info-header string bound check in
> +
> + THeaderTransport::readString Client: cpp Patch: Javid Khan
> +<dxbjavid@gmail.com>
> +
> +when reading the key/value info headers of a THeader frame, readString reads
> +the length varint and then bounds it against the bytes left in the header
> +section. the comparison uses ptr before it is moved past the varint, so the
> +remaining count is overstated by the width of the length field, and a negative
> +length (a varint with the high bit set) is not rejected at all. with a header
> +section sized to fill the receive buffer, either case lets a wire-supplied
> +length exceed the header bytes that are actually present.
> +
> +bound the length against the position that follows the varint, reject a
> +negative length, and only advance ptr once those checks pass so the documented
> +advance-on-success behaviour still holds. regression tests covering both the
> +oversized and the negative length are added to ThrifttReadCheckTests.
> +
> +This closes #3610
> +
> +CVE: CVE-2026-58662
> +Upstream-Status: Backport [https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0]
> +Signed-off-by: Abhishek Bachiphale<Abhishek.Bachiphale@windriver.com>
> +---
> + .../src/thrift/transport/THeaderTransport.cpp | 12 +++--
> + lib/cpp/test/ThrifttReadCheckTests.cpp        | 52 +++++++++++++++++++
> + 2 files changed, 60 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/cpp/src/thrift/transport/THeaderTransport.cpp b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
> +index 117c8ed..ba2fd5d 100644
> +--- a/lib/cpp/src/thrift/transport/THeaderTransport.cpp
> ++++ b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
> +@@ -183,13 +183,17 @@ void THeaderTransport::readString(uint8_t*& ptr,
> +   int32_t strLen;
> +
> +   uint32_t bytes = readVarint32(ptr, &strLen, headerBoundary);
> +-  if (strLen > headerBoundary - ptr) {
> ++  // Bound the string against the header bytes that remain once the length varint
> ++  // itself is accounted for, and reject a negative length so the size_t
> ++  // conversion in assign() below stays within the buffer. ptr is only advanced
> ++  // once these checks pass, keeping the "advances on success" contract above.
> ++  uint8_t* strStart = ptr + bytes;
> ++  if (strLen < 0 || strLen > headerBoundary - strStart) {
> +     throw TTransportException(TTransportException::CORRUPTED_DATA,
> +                               "Info header length exceeds header size");
> +   }
> +-  ptr += bytes;
> +-  str.assign(reinterpret_cast<const char*>(ptr), strLen);
> +-  ptr += strLen;
> ++  str.assign(reinterpret_cast<const char*>(strStart), strLen);
> ++  ptr = strStart + strLen;
> + }
> +
> + void THeaderTransport::readHeaderFormat(uint16_t headerSize, uint32_t sz) {
> +diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/ThrifttReadCheckTests.cpp
> +index 9632861..2a92160 100644
> +--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
> ++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
> +@@ -270,6 +270,58 @@ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
> +   protocol->readMapEnd();
> + }
> +
> ++BOOST_AUTO_TEST_CASE(test_theadertransport_info_header_string_overrun) {
> ++  using apache::thrift::transport::THeaderTransport;
> ++  // Header-format frame whose info-header key length (4) does not fit within the
> ++  // header bytes that remain once the length varint itself is accounted for. The
> ++  // header section (8 bytes) exactly fills the frame, so the boundary sits at the
> ++  // buffer end; the key length has to be bounded against the remaining bytes and
> ++  // rejected.
> ++  uint8_t frame[] = {
> ++      0x00, 0x00, 0x00, 0x12, // frame length = 18
> ++      0x0F, 0xFF, 0x00, 0x00, // header magic
> ++      0x00, 0x00, 0x00, 0x00, // seqId
> ++      0x00, 0x02,             // header size field (2 -> 8 bytes)
> ++      0x02,                   // protocol id varint
> ++      0x00,                   // num transforms = 0
> ++      0x01,                   // info id = key/value
> ++      0x01,                   // one key/value pair
> ++      0x04,                   // key length = 4 (only 3 bytes remain)
> ++      0xAA, 0xBB, 0xCC        // key bytes
> ++  };
> ++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer(frame, sizeof(frame)));
> ++  std::shared_ptr<THeaderTransport> trans(new THeaderTransport(buffer));
> ++
> ++  uint8_t out[1];
> ++  BOOST_CHECK_THROW(trans->read(out, sizeof(out)), TTransportException);
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE(test_theadertransport_info_header_string_negative_length) {
> ++  using apache::thrift::transport::THeaderTransport;
> ++  // Header-format frame whose info-header key length varint decodes to a
> ++  // negative int32 (top bit set). The length has to be treated as out of range
> ++  // rather than converted to a size_t, so the read is rejected instead of
> ++  // reaching the string assignment. The three trailing bytes only pad the
> ++  // header section out to its declared size and are never reached.
> ++  uint8_t frame[] = {
> ++      0x00, 0x00, 0x00, 0x16,       // frame length = 22
> ++      0x0F, 0xFF, 0x00, 0x00,       // header magic
> ++      0x00, 0x00, 0x00, 0x00,       // seqId
> ++      0x00, 0x03,                   // header size field (3 -> 12 bytes)
> ++      0x02,                         // protocol id varint
> ++      0x00,                         // num transforms = 0
> ++      0x01,                         // info id = key/value
> ++      0x01,                         // one key/value pair
> ++      0x80, 0x80, 0x80, 0x80, 0x08, // key length varint = INT32_MIN
> ++      0x00, 0x00, 0x00              // padding to fill the header section
> ++  };
> ++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer(frame, sizeof(frame)));
> ++  std::shared_ptr<THeaderTransport> trans(new THeaderTransport(buffer));
> ++
> ++  uint8_t out[1];
> ++  BOOST_CHECK_THROW(trans->read(out, sizeof(out)), TTransportException);
> ++}
> ++
> + BOOST_AUTO_TEST_CASE(test_theadertransport_zlib_roundtrip) {
> +   using apache::thrift::transport::THeaderTransport;
> +   // A run of identical bytes compresses to far fewer bytes than it occupies
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
> index 0128de8519..949ffc3e70 100644
> --- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
> @@ -17,6 +17,7 @@ SRC_URI ="https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \ 
> file://CVE-2026-58023.patch \ file://CVE-2026-48144.patch \ 
> file://CVE-2026-58389.patch \ + file://CVE-2026-58662.patch \ "
>   SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129627):https://lists.openembedded.org/g/openembedded-devel/message/129627
> Mute This Topic:https://lists.openembedded.org/mt/121028875/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------1X0hh96DzGdNwxut61i0PhXT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Anuj,&nbsp;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">It seems like you missed this one.&nbsp;<br>
      It still applies to wrynose HEAD for me and seems like a good
      backport.<br>
      <br>
      ../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-09-01 05:07, Abhishek
      Bachiphale via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260901090727.1384945-1-Abhishek.Bachiphale@windriver.com">
      <pre wrap="" class="moz-quote-pre">Improper Validation of Specified Quantity in Input, Out-of-bounds Read
vulnerability in Apache Thrift C++ bindings. This issue affects Apache
Thrift: before 0.24.0.

Backport patch to fix CVE-2026-58662.

Reference:
[<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/cve-2026-58662">https://nvd.nist.gov/vuln/detail/cve-2026-58662</a>]

Upstream Patch:
[<a class="moz-txt-link-freetext" href="https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0">https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0</a>]

Signed-off-by: Abhishek Bachiphale <a class="moz-txt-link-rfc2396E" href="mailto:Abhishek.Bachiphale@windriver.com">&lt;Abhishek.Bachiphale@windriver.com&gt;</a>
---
 .../thrift/thrift/CVE-2026-58662.patch        | 120 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
new file mode 100644
index 0000000000..03eaccb17a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
@@ -0,0 +1,120 @@
+From b9fe622d3e3dd2e376fbb5ccf2acfbfaf498ddb1 Mon Sep 17 00:00:00 2001
+From: Javid Khan <a class="moz-txt-link-rfc2396E" href="mailto:dxbjavid@gmail.com">&lt;dxbjavid@gmail.com&gt;</a>
+Date: Tue, 30 Jun 2026 16:34:47 +0200
+Subject: [PATCH] fix info-header string bound check in
+
+ THeaderTransport::readString Client: cpp Patch: Javid Khan
+ <a class="moz-txt-link-rfc2396E" href="mailto:dxbjavid@gmail.com">&lt;dxbjavid@gmail.com&gt;</a>
+
+when reading the key/value info headers of a THeader frame, readString reads
+the length varint and then bounds it against the bytes left in the header
+section. the comparison uses ptr before it is moved past the varint, so the
+remaining count is overstated by the width of the length field, and a negative
+length (a varint with the high bit set) is not rejected at all. with a header
+section sized to fill the receive buffer, either case lets a wire-supplied
+length exceed the header bytes that are actually present.
+
+bound the length against the position that follows the varint, reject a
+negative length, and only advance ptr once those checks pass so the documented
+advance-on-success behaviour still holds. regression tests covering both the
+oversized and the negative length are added to ThrifttReadCheckTests.
+
+This closes #3610
+
+CVE: CVE-2026-58662
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0">https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0</a>]
+Signed-off-by: Abhishek Bachiphale <a class="moz-txt-link-rfc2396E" href="mailto:Abhishek.Bachiphale@windriver.com">&lt;Abhishek.Bachiphale@windriver.com&gt;</a>
+---
+ .../src/thrift/transport/THeaderTransport.cpp | 12 +++--
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 52 +++++++++++++++++++
+ 2 files changed, 60 insertions(+), 4 deletions(-)
+
+diff --git a/lib/cpp/src/thrift/transport/THeaderTransport.cpp b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+index 117c8ed..ba2fd5d 100644
+--- a/lib/cpp/src/thrift/transport/THeaderTransport.cpp
++++ b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+@@ -183,13 +183,17 @@ void THeaderTransport::readString(uint8_t*&amp; ptr,
+   int32_t strLen;
+ 
+   uint32_t bytes = readVarint32(ptr, &amp;strLen, headerBoundary);
+-  if (strLen &gt; headerBoundary - ptr) {
++  // Bound the string against the header bytes that remain once the length varint
++  // itself is accounted for, and reject a negative length so the size_t
++  // conversion in assign() below stays within the buffer. ptr is only advanced
++  // once these checks pass, keeping the &quot;advances on success&quot; contract above.
++  uint8_t* strStart = ptr + bytes;
++  if (strLen &lt; 0 || strLen &gt; headerBoundary - strStart) {
+     throw TTransportException(TTransportException::CORRUPTED_DATA,
+                               &quot;Info header length exceeds header size&quot;);
+   }
+-  ptr += bytes;
+-  str.assign(reinterpret_cast&lt;const char*&gt;(ptr), strLen);
+-  ptr += strLen;
++  str.assign(reinterpret_cast&lt;const char*&gt;(strStart), strLen);
++  ptr = strStart + strLen;
+ }
+ 
+ void THeaderTransport::readHeaderFormat(uint16_t headerSize, uint32_t sz) {
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/ThrifttReadCheckTests.cpp
+index 9632861..2a92160 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -270,6 +270,58 @@ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
+   protocol-&gt;readMapEnd();
+ }
+ 
++BOOST_AUTO_TEST_CASE(test_theadertransport_info_header_string_overrun) {
++  using apache::thrift::transport::THeaderTransport;
++  // Header-format frame whose info-header key length (4) does not fit within the
++  // header bytes that remain once the length varint itself is accounted for. The
++  // header section (8 bytes) exactly fills the frame, so the boundary sits at the
++  // buffer end; the key length has to be bounded against the remaining bytes and
++  // rejected.
++  uint8_t frame[] = {
++      0x00, 0x00, 0x00, 0x12, // frame length = 18
++      0x0F, 0xFF, 0x00, 0x00, // header magic
++      0x00, 0x00, 0x00, 0x00, // seqId
++      0x00, 0x02,             // header size field (2 -&gt; 8 bytes)
++      0x02,                   // protocol id varint
++      0x00,                   // num transforms = 0
++      0x01,                   // info id = key/value
++      0x01,                   // one key/value pair
++      0x04,                   // key length = 4 (only 3 bytes remain)
++      0xAA, 0xBB, 0xCC        // key bytes
++  };
++  std::shared_ptr&lt;TMemoryBuffer&gt; buffer(new TMemoryBuffer(frame, sizeof(frame)));
++  std::shared_ptr&lt;THeaderTransport&gt; trans(new THeaderTransport(buffer));
++
++  uint8_t out[1];
++  BOOST_CHECK_THROW(trans-&gt;read(out, sizeof(out)), TTransportException);
++}
++
++BOOST_AUTO_TEST_CASE(test_theadertransport_info_header_string_negative_length) {
++  using apache::thrift::transport::THeaderTransport;
++  // Header-format frame whose info-header key length varint decodes to a
++  // negative int32 (top bit set). The length has to be treated as out of range
++  // rather than converted to a size_t, so the read is rejected instead of
++  // reaching the string assignment. The three trailing bytes only pad the
++  // header section out to its declared size and are never reached.
++  uint8_t frame[] = {
++      0x00, 0x00, 0x00, 0x16,       // frame length = 22
++      0x0F, 0xFF, 0x00, 0x00,       // header magic
++      0x00, 0x00, 0x00, 0x00,       // seqId
++      0x00, 0x03,                   // header size field (3 -&gt; 12 bytes)
++      0x02,                         // protocol id varint
++      0x00,                         // num transforms = 0
++      0x01,                         // info id = key/value
++      0x01,                         // one key/value pair
++      0x80, 0x80, 0x80, 0x80, 0x08, // key length varint = INT32_MIN
++      0x00, 0x00, 0x00              // padding to fill the header section
++  };
++  std::shared_ptr&lt;TMemoryBuffer&gt; buffer(new TMemoryBuffer(frame, sizeof(frame)));
++  std::shared_ptr&lt;THeaderTransport&gt; trans(new THeaderTransport(buffer));
++
++  uint8_t out[1];
++  BOOST_CHECK_THROW(trans-&gt;read(out, sizeof(out)), TTransportException);
++}
++
+ BOOST_AUTO_TEST_CASE(test_theadertransport_zlib_roundtrip) {
+   using apache::thrift::transport::THeaderTransport;
+   // A run of identical bytes compresses to far fewer bytes than it occupies
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 0128de8519..949ffc3e70 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -17,6 +17,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz\file://CVE-2026-58023.patch\file://CVE-2026-48144.patch\file://CVE-2026-58389.patch\+file://CVE-2026-58662.patch\">&quot;https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://CVE-2026-58023.patch \
            file://CVE-2026-48144.patch \
            file://CVE-2026-58389.patch \
+           file://CVE-2026-58662.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#129627): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/129627">https://lists.openembedded.org/g/openembedded-devel/message/129627</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/121028875/3616765">https://lists.openembedded.org/mt/121028875/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------1X0hh96DzGdNwxut61i0PhXT--


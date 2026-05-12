Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9437CD37BE
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 01:00:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65461.1778547622463099251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 18:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=j+lG0Ynb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9592267a27=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C0j0AM2999107
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 01:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=BXBtJRf3vKPVVsrXDKUWITLbnUfr31ymqccr+UTw/PY=; b=j+lG0YnbODnO
	zIZbWujii+g9xuVst8Z2dMHAJNFirbF9RnB9sMCssvml5tdCAdlMSGMxSsGYfni7
	3HN7SHF2hBan1uh7okXgZMVKXhvIO9I8IBfUfWvRGktV50aT5/qGGhOdLnSKgJUm
	6Xo+ADQwgGRpfywz9IAOWYRaW5Wd4FvgGgEIE7ctgq14M+uABUTTQbRqhuwS2sDK
	7GrirNJ608JNEbbvExlD65jU4+cvC79gYRIjFzH/HG1UQrEsmAHw4ddzC3mUszd2
	jPPrQEHo6izyH281AIy6lLxnHYYz+6GXwVwPsFRIuugBiUcJ+XrcueZyYmgu2BhF
	iLJ3h3v7Nw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhr8px-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 01:00:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgFa6rkNxDvTgPhsf92VPS6dpDeBk9tiSABsk1P7O1x+ugM7MIQKlUYbpMJz0VuIlTGMBWElGAz69B1kEfFscZ7ziveW8y+LmjfLJsWpXvhPJhzscWWn4/Jy7nzTWcc2Win/oIt/dVQxR0KgLPannuKEG4YiNRbyPRLyIggnuojkKch5Fo2ze7iyH0kzJ292sf3Yh4F0jdHBFGSqDhWwzJ4q7+diJ2MqnYtbCJovU9F+ccx2ULaW3hd8fJbGbYOC0gzDC3L3BYGyrUBBtQc/LxsjeksDeImpYdHScjjAzFfOTAakdA8alzZcGE8tGy6wB0FKD9RHoRBT0FivTlYFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXBtJRf3vKPVVsrXDKUWITLbnUfr31ymqccr+UTw/PY=;
 b=X7fl7qsYbQWFbZS82EfXEcdzlE80EUCwMoxDNMIllrxwuoX1URkBquXNvTTTSgt94GDfFgW9ZyLilkRxfRbVTjdFKLQptpzr2LmMs5R26XfYbkUHyCUvaGQHNPi6sKLLcwpVRAFeNoqY3Yvj40D53KyGv7fzx2B3BHaQTPJh0gg+eEP/C2+45qFhXS4GIKzIc9XzIo71BYU8szrJZEb9P1Inp3sbqA9GWpKc1ai47y/RXW/7OlABdhDtViCxnXQtsMYzGDzCMO1g9BpTNWtbqbwU5CTsx3O042yfULDUo+ILSD/+6eDqObtRJPqZZgj23BADGSqj1MbvOZil7zSdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8497.namprd11.prod.outlook.com (2603:10b6:a03:57b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 12 May
 2026 01:00:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 01:00:16 +0000
Message-ID: <836eae13-2219-4e9a-82a0-660cd230e687@windriver.com>
Date: Tue, 12 May 2026 09:00:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] nftables: improve reproducibility
To: yoann.congal@smile.fr, yi.zhao@eng.windriver.com,
        openembedded-devel@lists.openembedded.org
References: <20260511142142.3620917-1-yi.zhao@windriver.com>
 <DIFXDYIPL4EY.3BAEX7B7MNLX0@smile.fr>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <DIFXDYIPL4EY.3BAEX7B7MNLX0@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0132.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: e02fb741-2882-4e28-6883-08deafc1d438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|12006099003|11063799003|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	f0/jZy3dO6ZBOFWUJLOv1YDj2sK9OpMg+ScgP0lDmqA3kFr6VSToUX7cfqcyPDkrZkHySGY38bYlH64hsGutKxhyUG3GIDquddilmfh+z+ctqFJPBHQcVM9Npea01zYMOFW7XUrW4xS6yQaD7PjGyHeMdFuo9NOMi63oseUGouM8fWd+68Vf/Un/2oe7nK1HPkLikYC7IHPhfq4r6Zk+RfaLRjIffDNpJIcHwb9v4LOwftCS076nL9wTdOkoO2iqT+EwLQnbKK4e8HQF3KI8AdeFKBYSD4sRZZkZgcgLb6pojuMEAyGhLvQLZpF9Q44fs38Z8Wb6QU+CqANuCq1THGcRZjh9zfK4WjKs99zISQZpBoRyeBBzfNoTiNLjjjxsDII5cA2W8h2PEJoTwRSLP6Dfu6ungZdkkf+0l3zNZ+RMaS9CmC6khuf2306FtJ70/kKNNegT8aQ0A2awNmi5ehA4NNMsEuw4xDLizziHHOZOH6EcMR1Q7eXBj4yDb1F9BvEAtiftM1feFlSjpUzLDX27FI8HgR6CoPKWIr6r+AZYJJ8vtwVjuLPbQFSjrc/nMi28O8lnHI7IYJrmr3VSXl4H7+kxvyFiWeyjBwL2llu9/dWVqPFfoTs8T2Q0NnrljnTAZqkNRZVhEOSNFmdFag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(12006099003)(11063799003)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1hTdHZBd0lIVHFKOW93MEpuVXZMVFFCSVhWc05xL0dPdmY5SjBrTEVXeS9x?=
 =?utf-8?B?ZjEzaVJkbC9BWTJBSE1vRzlZb2xXSTM0Nlo3WmdxL2pZV213eTZ6TE5SdHBs?=
 =?utf-8?B?L3Y3eWtFcmg3ZzEyOEl2ODlhVk1yb2YzWGIyZHVDdEQwMWt1Wm80UHhqZkxI?=
 =?utf-8?B?UW5BMUtkYnVoUTdsWW9ncnZnclhZMFhpUTFlVmtubXRBekpwTng0TmRjSDZM?=
 =?utf-8?B?Um5DUmp1Rkp3TjJnTUpVOERzMXQzakhVVzJBVDJDNTJZMi8zY2U0OGdUN2pu?=
 =?utf-8?B?WEJJdVZ6enlYZEhsTWNjdUhpY2g0MWJIYmhDWGVjcDQvSnZGR3k1cUlkTUVr?=
 =?utf-8?B?c1RWUXFiMklnM1dCK1V3emdVYzZjc0Fld1dONk9zS2Uvd21TZjREaVEvZ3VR?=
 =?utf-8?B?em41Q0tPUTVWTFMrWFQ0THh2bWpXUWpRQ2FWRnFPQzhMU0V5dUtDU09RdlNv?=
 =?utf-8?B?NWZhNncxeDNVeUxTWUZsN0JTV3pLSWJMaEdCVEI3TWs3VEc1V3ZUSnk5OTY0?=
 =?utf-8?B?UUt4cm5nNHpKNFFCdDltVm9YYWpTVGNDaEFPemFHT1hxdFNqRVZRTU5qSjFv?=
 =?utf-8?B?SjhtZnRNMTZmT0ZGRXQrcmVxK3FRNDk2aWxldXFlMHVZTkt4R1doY1hxK2JM?=
 =?utf-8?B?RUJsVHVtR0xhNDl2QUNld0psaStCdUFvbFd2ek9tN1VZWGZjVllEaXBuLzR6?=
 =?utf-8?B?elM4VmUwZFQvZTFMaEJlOUE1bmhhQjJyWXNqTW5aKzZKM0lJWWlHdmJYUHpj?=
 =?utf-8?B?eGJSMEZWQnZNaEtudHo2RDhkcXQ3MklmcHVvWGVHMTRaVThjTG9ZcXJ1UVlC?=
 =?utf-8?B?K21XdXZmOW80WEVOZzY1TjJ0VytXbEVmUmtxWTd3Mnh0S0JPWEx2OWRaQW9D?=
 =?utf-8?B?akxLcEViaXZUYXdSd0VRczlML1FESVg1L3lkRUhVY2NXN0Y3bXJCV2ZZa0Rk?=
 =?utf-8?B?ems1N3c3YUV4YzEyYk9ZU3RjRW10VVlodTRUaC9ZOWp3TkhOUmJ1R3lBdVJH?=
 =?utf-8?B?cndEeGJwbS9acWIwdzFmYUtFb1pQWTVFYXNVcldLSHRuVThmUHhPakszSUI4?=
 =?utf-8?B?QVdrenMyc2NWVFRJcis3ZEk3SzNuSXUvQjdYaE9lR2poWjJEd2hFNU5zT3JC?=
 =?utf-8?B?cTJOajIvMjV2R3g1MVYyYUlRZVkyR3J2S1MrY05MbXZaUG9ZcEhGamtvVXVV?=
 =?utf-8?B?VVBkSkVlZDY0eEJnY1Zxc2ZhazErelBSR0VuQTBleXYwYjJUbk0zdTFFT2g3?=
 =?utf-8?B?RjExbkxJNHdNM1NhL21xNlpzYm1wRVJhREJ0Ync3blhKME42VHFVcHZmM2VJ?=
 =?utf-8?B?SEt0bnJiT3NtN2JXVjhWTFFFMXY4bVZzcnZVVGdaeUtSM3ZKSDI0aGxjdFNL?=
 =?utf-8?B?dlpUMjBISTZYbHJxWTRpZFZ1UWxXWHFPcFVBOGwvclFkY2Vvakdjd2czRnI4?=
 =?utf-8?B?d21kUjRiZGhnRStua3VRQ0lTZ09LUHZxTXVzaGZnbDN5MksvYktxUC9Wd3g3?=
 =?utf-8?B?WnNVVTJsOG9ZNHhyL3JFbDZTeDlabGZYSnlWMVY4dkhtUlI3dkUyRTlUUm5q?=
 =?utf-8?B?M0hocGxJYXNjeFZhQ3ZhYnA0UzM3MEYzUGJoVlBzRDRub3ArZHpueHQ3QXdX?=
 =?utf-8?B?NTl2enBnVnpNWHg3Tjc1WVJhMzRBTlN6em8wUXJ0N0RyNkwwcmFFc1lkME9U?=
 =?utf-8?B?Zldob0pMZ0l2QXRmZ2VqL3c5bG42US9FRU9nTExpQzBkdEFMQTR2WDk2SzZl?=
 =?utf-8?B?eWJLZm1YYTBkaVVoS2dvSGxkT0JZemR3RmYzcmliWTllR0lGTEhlTVd2VWNE?=
 =?utf-8?B?KytpZHV4WUxNOE1IZy9RVWRDY0k4R2g4UmJ2N05BRW9XeHdBRlJHQWJmRXpX?=
 =?utf-8?B?TFhKQmwwd0FJREppUGdKVU50WmhhbmRxTG00SGRWWHZtcWVYSHBMUlUxaGRQ?=
 =?utf-8?B?STBGdExPZnM3VnFXVkVaSFMyZVM0VHJ2TFQ2ZjZJRVFQOGFuUWQ0MDI2MzNW?=
 =?utf-8?B?TmlXTllEemc3RUIrWGtRc2JsVWxtWUplZkFSMGZBRUp1TVBMMExUYTJVeHJi?=
 =?utf-8?B?K2kyVlBRSm1YNjFwZW81OTVOTzgxRWNSVmFLZHJGQUYyYkg5aGUvVytzT2Ir?=
 =?utf-8?B?cDl2Q2ZGRjNXUVBnc3poWHlqQUNtbHY0RHoxeGNXa0tWcElLTEp1R2wxZDA1?=
 =?utf-8?B?WmVWY01SYVlpdGkycTRFSzBOQVdSWm5ROFZ2a3h4VFlhUDFFbmlDWmRxaW1M?=
 =?utf-8?B?UTFzV3Z4WVF5TStSbDBjelJ1WVhxZ0p6Nk1NejVyRkZzU0pSUkxoNjhEZFAx?=
 =?utf-8?B?cldWVG5DeXY4S3ptSGFhbTFXVjlLWXZYQmNzN29NMVdXSlZtdDhTUT09?=
X-Exchange-RoutingPolicyChecked: 
	wFPCs997xWVDycdOHhRZv7PamRIrp64ofPcXRsuieHiM5VrozFEcWcNjZkM7M0f5vsQqhm50LnFAGqfTJPC1uKRDSa/z9cfg2tb1e0SapAoE3hSzNYwbyHi3Vmb/rMSI0vQ2cUT3go+SIvUAdXvq6BrMQErbfpOcVKzvQ3BG18LisADMpmhhO1C7hjYo+fzJwQJUM+wJuFEBtr5cyPYYbABTrL6WM9SIvYwTU08aOrp5cOh2pNgc6qWoR76NyqZ2z3/eWVeKtVhU0nApLEazb7+PbczNCux7y4n0KPxdYAWNSKic1w2CaMNBVyViSDn/yMbafWXxMuwDiM/ha6Wb5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02fb741-2882-4e28-6883-08deafc1d438
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 01:00:16.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEds95Ufo6qrcA2mt+UywEzrKcwbaigIsFkRCAqgNSvAwe8Kje0ZkIpa1aoF0ythSytV3OMAsRGmXhcA3jUX2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8497
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: qqm291CA8U2AEESmUUIEnFuxU8lfVRvK
X-Proofpoint-ORIG-GUID: gIB-_9lbgjDK7c-WyWRAj31WvJVrM-Tn
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a027ba4 cx=c_pps
 a=VYnc1ZjkwFV8r4Zgssgzxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=SsMK-6ewAAAA:8 a=3HDBlxybAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=aT7ecJGypZI4vDtHWbYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=49hUO6naoDravHwzbBTq:22 a=laEoCiVfU_Unz3mSdgXN:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAwNiBTYWx0ZWRfX8i/uAw/eBDl3
 eO/LDTQBiZwGPI+snSGPquW8pG3MKHrWvtaD+BQT0rXUAicL0iTiTzN+7A8J4SdWKduBXunr/v8
 h2+5miuEsxLXNPzlM2xv1ynt4ynvbfV/EEl4keZ1Koxkemwk2oop2ebbke/sxLaYj6xWyPVNpwS
 TP0YCXYpdv+jIjJrFinuXe02YPe9tAGWPJZ4E7dvANoVRIijYhnUBgHKWjsUM8PA/RP6Qq+xdP5
 lMTOVhdaedvrIlc6VNqGpCcWK9crY0sftCqD7gD4nDKFZOGZ41qYTwzMz1C8IXRmOVUE5YhtAz3
 LkTj70JdBvUGQclqW4zZ6CLKSirfEBeXKUZUfBLvSA730l8+txvdj3zIxATboAKN53ubTpfJPqg
 Ldr/ZnLYtI8JyyJY/5K0/12wDgjil+s30NXZr/FXbxUsA3Cl/01NsXcQrsDfzMUzSqOTvMIqia5
 HKlAGmXLQ/vPMVTVpQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64C0j0AM2999107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 01:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126853


On 5/11/26 22:43, Yoann Congal via lists.openembedded.org wrote:
> On Mon May 11, 2026 at 4:21 PM CEST, Yi Zhao via lists.openembedded.org=
 wrote:
>> Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
>> time, thereby improving reproducibility.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch | 34 +++++++++++++++++=
++
>>   .../recipes-filter/nftables/nftables_1.1.6.bb |  1 +
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 meta-networking/recipes-filter/nftables/nftables/=
0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>
>> diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-con=
figure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch b/meta-networking/rec=
ipes-filter/nftables/nftables/0001-configure.ac-set-MAKE_STAMP-to-SOURCE_=
DATE_EPOCH.patch
>> new file mode 100644
>> index 0000000000..7d2f9c0dfe
>> --- /dev/null
>> +++ b/meta-networking/recipes-filter/nftables/nftables/0001-configure.=
ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>> @@ -0,0 +1,34 @@
>> +From 77de073b1cc7413b1d230995851338345d56a8f8 Mon Sep 17 00:00:00 200=
1
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Mon, 11 May 2026 15:52:29 +0800
>> +Subject: [PATCH] configure.ac: set MAKE_STAMP to SOURCE_DATE_EPOCH
>> +
>> +If SOURCE_DATE_EPOCH is set, use it to set MAKE_STAMP instead of the
>> +current time.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
> I think that this patch should at least be sent upstream.
> Reproducibility is not "embedded specific".
> See https://reproducible-builds.org/

Thanks.=C2=A0 I will send it upstream.


//Yi


>
> Regards,
>
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + configure.ac | 5 ++++-
>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 6825474..2b147af 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -165,7 +165,10 @@ AC_CONFIG_COMMANDS([nftversion.h], [
>> + ])
>> + # Current date should be fetched exactly once per build,
>> + # so have 'make' call date and pass the value to every 'gcc' call
>> +-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
>> ++AS_IF([test -n "$SOURCE_DATE_EPOCH"],
>> ++	[MAKE_STAMP=3D"$SOURCE_DATE_EPOCH"],
>> ++	[MAKE_STAMP=3D'$(shell date +%s)'])
>> ++AC_SUBST([MAKE_STAMP])
>> +
>> + AC_ARG_ENABLE([distcheck],
>> + 	      AS_HELP_STRING([--enable-distcheck], [Build for distcheck]),
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb=
 b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>> index d27e60a18d..5ab31f9b0c 100644
>> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>> @@ -12,6 +12,7 @@ DEPENDS =3D "libmnl libnftnl bison-native \
>>              ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gm=
p', d)}"
>>  =20
>>   SRC_URI =3D "http://www.netfilter.org/projects/nftables/files/${BP}.=
tar.xz \
>> +           file://0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPO=
CH.patch \
>>              file://run-ptest \
>>             "
>>   SRC_URI[sha256sum] =3D "372931bda8556b310636a2f9020adc710f9bab66f47e=
fe0ce90bff800ac2530c"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126851): https://lists.openembedded.org/g/openembed=
ded-devel/message/126851
> Mute This Topic: https://lists.openembedded.org/mt/119256992/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[yi.zhao@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


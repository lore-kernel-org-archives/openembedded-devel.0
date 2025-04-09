Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74245C36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 03:18:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.148.1744168677977093643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 20:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6194c6f013=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5391VfCo020515
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 03:17:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8mwga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 03:17:56 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5393HudO015922;
	Wed, 9 Apr 2025 03:17:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8mwg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 03:17:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6HWOkvfdCfPKIHsaO77hK3lx9IsOhHgUH2m8uL90FBPRCkLZlCvDIzAhmsxnbQI9NB1dUofu/ZYF3wyVsUuRmPYJyllMGIWjnnwGRL65ZxAUbc+t63AeJelPlR9pdwOAHN280ETSN95G7ZC+oMm+AQ+5eYmNAD5+lXCSnsMqi+TzjIu7o/VpnZLuhqPd/iv+USBXda0tQTethCBf3TD4uR2P5mRYmtkaGMxlMqyZiEVWQctjYT7NLh8bTM2CzDBPWux/xf21eral97VLNQY79/onf/gat2mMHMBe1Xm+xqAfOSDZ83WKQQFGycZu8JKgBqBBWkVJbCufry5XeNh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pS1DvoX2JKIxivSGwlfNP7Qini5Cj/IUGOl0R0DO0pg=;
 b=orCXKtrLJsEwYUGRf0JML/iF5rMsYnJ7vHTOwxfSrDqwvijpKzsFKyF8sGSXaQMcJ4SVa6jKrAfer+PjHD6D1ng/6wm501/1eEwB9QQ7AfYzNCLpZc4O0f+0hQIaMFcabwuGCw+f/xzCVEP2pA+HOasSGJFl21L8NaYQPx6XlwwFIdL5BpR7VIdlYP82KylZKlX4gBL1+djs1mDATx4w7WI6Spkebqba694okhTUQ+N2XLErZmLP5bLUnREKtW1WgcpGPj0FipLaiLOm872ifW+Z6f+G+FqVxE06dT/kiWnRieL0OgMGATCSVQM9HyJUAWQsX4fsdpjZvse8UAnG+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Wed, 9 Apr
 2025 03:17:53 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 03:17:53 +0000
Content-Type: multipart/alternative;
 boundary="------------7QvZz0pndr4dIdQxvkipHulq"
Message-ID: <884df51c-ec5e-4113-9613-6737be1bbbc9@windriver.com>
Date: Wed, 9 Apr 2025 11:17:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-networking][PATCH] net-snmp: fix memory
 leak
To: tim.dylla.ext@rohde-schwarz.com, openembedded-devel@lists.openembedded.org
References: <15989.1742827718915937909@lists.openembedded.org>
 <Groupsio.1.15989.1742827718915937909@lists.openembedded.org>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <Groupsio.1.15989.1742827718915937909@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3a6d05-3984-40bc-1e0c-08dd77151d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TmlDMmpYZHRreGU1dEZ6VVAwQ3JBVjRiaVJOOUlLL3AyRDJDeUo2MmJvVWlI?=
 =?utf-8?B?RjZENnpqYitic29FbExNSC9FYkpZOXpGU0hMU2l0T2l6SFlZMW04TjNjOG5R?=
 =?utf-8?B?aVRKRTdxS01OVXk1Z2lnZm90OG5rM1JnL3AwWWoyQnpPdm5xMUtpdGU0bEJm?=
 =?utf-8?B?V2Vxa3QzVkZTQytXV2Mza0FHdHJZa3BqTDFRaDJvR0Z4VWFrMFdGaEhweHIr?=
 =?utf-8?B?RW5GaVdEQ2d6dVc2VzlyeHFHS2FMZkg4L09QOEY0c0dSN05wOTRlTmNqdWxo?=
 =?utf-8?B?OGp6VGZzWHc2MUcrSVQ0aHhvS2pFUnphTTluVTNBQ2JaQnVCcHpFUGpwWU56?=
 =?utf-8?B?TkNhVmU1WUdwT3pGRzJDNW5HdzAxSXNTUnU5QTVNN01SYXBtUkV4R2JOekJx?=
 =?utf-8?B?aGNWdjdFKzNaTDVDSmlIVkFBYjE3MUkzcjJKQTltTFVucy8vVUtYR0RrMFBv?=
 =?utf-8?B?R2ZCYjhZVThNQnhDQXI4RkRSWVMyZVlIb2o0NVUyOUU3UmlEcmdNRGhBTmFp?=
 =?utf-8?B?azFLOVdDMFRmK09GRVRWZzJjU1QzaHh0N3NxVVNsN0k2OWlmYjNTaUw5SVl4?=
 =?utf-8?B?MDhhVmF2M05PbGRxUnFXNWJIQkF1WkYrUkp2K3c5a2FlSFYyNTYzOW1mS3M1?=
 =?utf-8?B?MkZ5TG5CSFdBL0hrWnJvV2lva01oZGdYbWhpaElmOEtOWWdWNWcvNkh2V0hW?=
 =?utf-8?B?WmR0QjJRQlBFSmdJempBRkJYUFpvaDAyVVBWUjY5Y0xmUFd2dGUrdW5FdEZk?=
 =?utf-8?B?alRraUpEZVU0ZDVNcXhwL2hTWVE2QmdLNmVTclY4cy9vQytZUWNEdXB5U000?=
 =?utf-8?B?WmZ6bml2VGg2NTJnRklBWE1qcjE3aFY2UkYwTHdvcFpaUDFxeXZ2eW1RSnY1?=
 =?utf-8?B?VmFpWS9oUGZNS2VUbmFzb3pYWGNnMEZDanRlN1pGTXZ5R2tOc2pIVDlmdEdV?=
 =?utf-8?B?c0U5Tm5pd0N1VGNkY3hYbHlScFljaE02TXpEazJOWWlvMTcxRTNUWE5hbnRW?=
 =?utf-8?B?TTBCKzFJak8rYWVKenovVmtaOWZGUEVVQ3Y1bnpnZHRsMlphaENFN3dUZjR5?=
 =?utf-8?B?L0VOQUFKRll2Rm9hL056QU9UU2pUZnhKZ2Zpb2w1a1hUTXc5eFBPVkhZNXVo?=
 =?utf-8?B?OEpvWW5PbFRzZllmeWlhOC81Umhzb2dlVURDWnJBc2JXaTBLZkQ0czZMNmJ0?=
 =?utf-8?B?UndJVHViUXl2YmVIa0RzcXhweFNMejdLYkpTSU5hSTBkQndnMDNPVUllWnpP?=
 =?utf-8?B?TmFLeUpRWFNyaDhtMTZETzZoM1BvYXBzMERpa1pjbC8zR3BRNjZpbndXNTZK?=
 =?utf-8?B?R3BUcUY2WnN3bUJ1aUpsWE82dkpUWTV3UFBtb3BOSUR4V0F3amc2ZHRoOHRP?=
 =?utf-8?B?MENLd3F2SlNSdlZVR0RwUEV0YXN1K3Bra0RTMWJMTmg3L29ZL3lRc3BEako5?=
 =?utf-8?B?V3Q2TE1mYW5lMDNDMnA2bi9ON0U1TmIzREtDNHVHQjI1U2lwTTN4WXlqQS91?=
 =?utf-8?B?V3ZzSVZoWUl6aEt3dEllMG9ZRnBOMTgzQS9ZTmEwOGJkMCtRU1lGZnRpazQ3?=
 =?utf-8?B?YWxIUWM5YXk5RmNYMTd6NStFYVJTa0svOUNaT2xIWUE0YUpNbTliOWVoQzJT?=
 =?utf-8?B?UDVqQlpsejdHNi9QVXdDc2FDZlpjM3JZZWNWbXArTVFXdVYwanM1eTNYa0JI?=
 =?utf-8?B?cTJ2UmtnMDJsMUdsN3hxVkZGUjQxNkErMkZFeTZaWVlyTTF3eENVUHNQRTgw?=
 =?utf-8?B?NTc3ZnB1alA5RGtuYjVXZ1FnSkxtSDRoUXIvVUFJWHd2SG9seXNIVnVWRSt3?=
 =?utf-8?Q?Azfg1Geaz7aYcUwRK7pAf/26EkQfd8cRXcpUg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGNyUlFMUFBORDJ6UTF0ZmlRTW5SUEJlcGViL3ZsYW5YMStYS2ZXakI1TEFR?=
 =?utf-8?B?aFpDNXdiTnRJaVg1L1YzRXRlWWNQK2tPTUlXVlh2eUZBbFFJOE1uc1NESU1r?=
 =?utf-8?B?c1UxNzhYcXBReGQ4bko3dlBhSC9rcExMTnd0SVpseEJNV0hJL0pvOW53MzVQ?=
 =?utf-8?B?NlU0MmtzdEUvc0pId1hYOWh6Y0dUVHBkZGR5dEdocjdWZEhlUXBXRUZHVits?=
 =?utf-8?B?SUpWU2tkdUxLek55UnAvN1o3bGQxSDBsRUh1OUZjaFBybmtlajlCQkE4SVlG?=
 =?utf-8?B?UTVNL0xBUUJOZDZISE96Mlgzb0tJWXlTZ0xtdS9FcHRLTFAvOFBEODc0RURH?=
 =?utf-8?B?WUF5RkVsdjB5ZmRoSUg1ODQvYko3UERNNWhpanZXbDdPZk52SzMzWUtMclhX?=
 =?utf-8?B?ayt4SE1mTzhyOFUycFRRc0tuY1VlNE8zRnlqRGJoTTBvSEEwRVNhamRPUFJH?=
 =?utf-8?B?TnFoWHp0K3ROR25tZDRWWDZOUjhUekNTOVVXQXpnVEJEZkplT0I1SVdtMEpJ?=
 =?utf-8?B?Z0VwYzdqK2REYTlCKzluRjlhVHBqMEtMQnRFa0dpeDRaaS9lZ3U4MkNPNzJk?=
 =?utf-8?B?TEc4TFozcENSc1c4bFFhdGZWVEdTQVhYNERTT3VIZTNhYkpMWFpkMkh0NnhR?=
 =?utf-8?B?L21MYUN0Z0U5NWNBNTNRek4rb3UxSXhwYnVCN3pUbENFMGY2YmZGYWJtTi9r?=
 =?utf-8?B?d1VCU1dBeURadzZ0Wi9ETWhhTGVHZWpRMUsySFc2am9OdnF1TUxMcmRCMExa?=
 =?utf-8?B?M2R1S1JFR3BFSE5UQ0FtVkVaaHJTRUxwdVZja0xJdEpOR2RFc3NncEsyU3Vl?=
 =?utf-8?B?RGFzZ3gzaUxGVk9GSTRUTUJmeGlEdEJqUTJTTnZKdnFhZTZSZ1BNQ0Nzam5z?=
 =?utf-8?B?RGJ4VE9uQUFqVm5Jd1JicWtuTHBINkh2RVlyNXVnKzVDbGhqcnJ0R21ZdkVD?=
 =?utf-8?B?dURxbFU2QzRQOUxmOE94NkhIVkZQMUNybE0zMEsyY0Nkc1dWRnhzcXhxTFJ1?=
 =?utf-8?B?clY4YzhKNVd0U0tMTlE2MHhsRmRJNG1qSGZqWmlNeWZEd1hYY0NNeUtyakk5?=
 =?utf-8?B?amVYdUNQbUhURUxJdmVpVmhsenE4cHY4NVJLcVMzdDc5MzJhRzA4TmwyczlG?=
 =?utf-8?B?TnEvUTZtMktFWjJZdkJRNjR2UmhoWHZ0V0hydVZBNlZWTWFmQmNIL05rMHFV?=
 =?utf-8?B?YS9tM2F2V050RHRQMVcwQmxPb1ZPYlBqLzZLQXRMbmpza1pWd3FxaFJOcEht?=
 =?utf-8?B?ektUUG03UFc2N09pSDl0azJXd09lbDgvYWI3TmxjM1c0SGtoSm1YejVKdW9Z?=
 =?utf-8?B?TzF3cXJaRm12ZjNodmdzVjQ5bTd4Z2o4aEZhRXlZaE1RUEV1S3F5QjNmOGFv?=
 =?utf-8?B?aWYzSjB6RkVkSTl2Z0F4cE5TV0oyYldUekFLRGYwZjRDeXVVS3lvS0szYkhL?=
 =?utf-8?B?cTE4c21QVkIzbi9Od25IaGVSVWdETndxVWV1aXRJSytKcEZ4UnQvRU43VDVM?=
 =?utf-8?B?YkJCUmViRDBvbEx1T2VNK0ZPeHFaY0xVNTNmekJHcmdSSXNKMzZoMHo1S3N4?=
 =?utf-8?B?bSs1UFZRRy9xRGZuaU8vTVdyZkhOcGJ0cnI5QVhiTjd6bGt3Vk1UNFF6cDhq?=
 =?utf-8?B?UjFmaVpTRU8wcXQxZXF4STFLa3ROOWtyVEZ4OWRZanEraWdHWlpKajg2V3pD?=
 =?utf-8?B?MUhZYWlndHVKb2dHQnJEREVFZzVxK1U2ZForVjIyQTRwRTdvUExPQ25KUm9z?=
 =?utf-8?B?VmxYUXo4Ukl5Z0tGa1FBSWRBK25ScVN0U2FxNXJpZGlvRTdkamJQdXZZdFR6?=
 =?utf-8?B?NUNkUUpPVjVPOHdLTFc0SkJRWXRnN3JvSUV0U0RJb21ka2JIZXZGUVNhOUNE?=
 =?utf-8?B?RGlNL2ptUXNtc2dIMFo3VDhOaERZdkZDQmtLemZXRm9Xa0ZJcWdUSkNkKzJn?=
 =?utf-8?B?aGRMeWtLOWhVbzhmc2NTemdxZmpDb3o4dFdXL2lHWkUrWDJ1ZmFxYm16bFcy?=
 =?utf-8?B?NjBlR05yWXo0dXkxMytva1ZMKzUydkZPSzZnZml6cTRUUmlPQTh2YmVtS2Jl?=
 =?utf-8?B?SUdKWlgrb1hKZ1hORnRFUXZwNVRPenhrbDYrdW1DSTNLOEtZMGVVNFZlTFFU?=
 =?utf-8?B?RkJETXlZc3NkSjhzYzg5K2s3YkNsbEhkTFFwbmNkUjFHeFFLMjFGOWxzbVIx?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3a6d05-3984-40bc-1e0c-08dd77151d9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 03:17:53.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ7Qubwr8d3dwiC+BaqHwsQuVxZEoR6cewy2O35/alGqCim9jjy9YaxsY8GHZdBpt6B27MzSSYfe3joAe6j96YKim6T/HT9I2RqxL3G1FfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-Proofpoint-GUID: S_IWng4YkiQ7CVvqwi3ENURmY1XYs3f_
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f5e6e4 cx=c_pps a=uuboLt+qr3MZZMeqEnD08g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=LN_l4lcLAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=IxeB1KrSkuXfGjNSsLgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=fgDO_F4ed-PKE53UTrAA:9 a=8LdKkTIHPZrOluqu:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=V6Cww4xsrPVQPwKtnwcs:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NPKq6gxpCRYWu7iLzjXnkNnk8XSyM70W
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 03:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116723

--------------7QvZz0pndr4dIdQxvkipHulq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5391VfCo020515

I'm sorry for the incorrect patch.


I send v2.

In v2, I remove the special character and update the line number.


Best regards,

Jinfeng

On 3/24/2025 10:51 PM, tim.dylla.ext via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> [Edited Message Follows]
>
> Confirmed (if that's of interest),
> =C2=A0=C2=A0 I second Piotr Lewicki in all aspects, the patch in its cu=
rrent=20
> form breaks building of net-snmp recipe.
>
> ...Patching patches, patching patches.... :)
>
> All the best,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tim Dylla
>
>     The patch is not applying not only because of the special
>     characters, but also due to wrong lines where the
>     unload_all_mibs(void) is pointing to.
>     I suggest to:
>     1. Revert the "net-snmp: fix memory leak" patch, because all
>     images that use net-snmp are not building at the moment (at least
>     in my setup).
>     2. Fix the patch- all the info is in this email. Removing lines
>     with special character is one thing, another is updating the line
>     numbers in the second hunk so that it applies without any problems.
>
>     Best,
>     Piotr Lewicki
>     Common Linux Team
>     E-mail: piotr.l.lewicki@...
>     http://www.hitachienergy.com/
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116210):https://lists.openembedded.org/g/openembedd=
ed-devel/message/116210
> Mute This Topic:https://lists.openembedded.org/mt/111282761/8617462
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
Jinfeng.Wang.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------7QvZz0pndr4dIdQxvkipHulq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>I'm sorry for the incorrect patch.</p>
    <p><br>
    </p>
    <p>I send v2.</p>
    <p>In v2, I remove the special character and update the line number.</p>
    <p><br>
    </p>
    <p>Best regards,</p>
    <p>Jinfeng<br>
    </p>
    <div class="moz-cite-prefix">On 3/24/2025 10:51 PM, tim.dylla.ext
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Groupsio.1.15989.1742827718915937909@lists.openembedded.org">
      
      <strong>
      </strong>
      <div style="border:solid #9c6500 1pt;padding:2pt;background:#fcfc03"><strong><class="msonormal" style="line-height:11pt"><span style="font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class="msonormal"></strong><br>
        <class="msonormal" style="line-height:10pt3"><span style="font-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class="msonormal"></div>
      <div>
        <p>[Edited Message Follows]</p>
        <div>Confirmed (if that's of interest),&nbsp;</div>
        <div>&nbsp;</div>
        <div>&nbsp;&nbsp; I second Piotr Lewicki in all aspects, the patch in its
          current form breaks building of net-snmp recipe.
          <br>
          <br>
          ...Patching patches, patching patches.... :)<br>
          <br>
          All the best,</div>
        <div>&nbsp;</div>
        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tim Dylla</div>
        <div>&nbsp;</div>
        <blockquote>
          <div>The patch is not applying not only because of the special
            characters, but also due to wrong lines where the
            unload_all_mibs(void) is pointing to.<br>
            I suggest to:<br>
            1. Revert the &quot;net-snmp: fix memory leak&quot; patch, because all
            images that use net-snmp are not building at the moment (at
            least in my setup).<br>
            2. Fix the patch- all the info is in this email. Removing
            lines with special character is one thing, another is
            updating the line numbers in the second hunk so that it
            applies without any problems.<br>
            <br>
            Best,<br>
            Piotr Lewicki<br>
            Common Linux Team<br>
            E-mail: piotr.l.lewicki@...<br>
            <a href="http://www.hitachienergy.com/" target="_blank" rel="noopener" moz-do-not-send="true" class="moz-txt-link-freetext">http://www.hitachienergy.com/</a></div>
        </blockquote>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#116210): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/116210">https://lists.openembedded.org/g/openembedded-devel/message/116210</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111282761/8617462">https://lists.openembedded.org/mt/111282761/8617462</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Jinfeng.Wang.CN@windriver.com">Jinfeng.Wang.CN@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------7QvZz0pndr4dIdQxvkipHulq--


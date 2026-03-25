Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFAFFEA819
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:13:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17074.1774422799467477097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Bn/RuFoM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544c14b90=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4SxSI324512
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 00:13:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=nMvziK4munz1v5HUeeiNux
	LuqIIC7TnXNmS7/KQz8uw=; b=Bn/RuFoMNJJFkpcuC9DS6/1INF+GLAMg8pQgYs
	09eNboKyK/mO2L9bZywOX/pj2FjaOMW96qpjDzQwe3R4THH4fi7uxM6PzkNMMGj9
	Q1Vb0FN9D49Z/NDJLNgSo7kaV4RUfOzlZsoDTDyJUkuMwSVA0eR5g788UqbzFhcj
	f/qz4ItWtCA6SjwGjg+YT6J3hHx48IbgL4ikJlX8apIkKM7ckLGeJNKqOcAH+EIb
	QodSd95nKiX0ApxRUg779azfJXS0CIdDm2FvfhaJwjN00dp2ucVGhSVGzwV5w1dP
	IdjjZgI3PG11Zp0QE5Bb2TlxZ8JDHXJtu19isNF7AKWmOAsg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucv9j7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 00:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdOCNGy+sIJwpYE9HQDgttdQKNHdtxw+2RKB/Ec3ko77kCb7uX/dVFuWyGok96IRIeboY31+k+hbTOGjkkLlVLa0cYdkNot+AFolFCQMAgLjNrupI4iPeqDSEGMeaDxH6UnaQHMcBfXXbLs3Hhiv5+Dcf1SwNtHXqFE5o7iVOaC4z04tmt7/xXOOnKjjT7zYGWMW80yEpnhlTk2Tae9juKA2Na30cWsK2vzkiDRD/sSp8VQ2lXPlCeIyn6SRInspmRRO6yVUYMQ7ogDEB2oDWE+QHWNpgdgLWv7MBSOYZCsUWqkytVWZilvMGpAcxRZJryYZEByG79KrZ/qlVpdrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMvziK4munz1v5HUeeiNuxLuqIIC7TnXNmS7/KQz8uw=;
 b=fH/Bivlj6b98kJL/UlhNm45JcFMuUxslTu3zwV+u4879S66c4H9ETpOtoQ2ItbXaRXVpD6Ai05dWuinrKYt5XnKzWnkVNAW2RnsMYo2KjCXVc8N0kbkPDlqax8B7pPsds0IdJsLBRqQk6UK9RVIS1Ma7nE/lBtfLMsaGn+2WVizf64r0us3e7+3rqp9A0SfhvaJNoLnod+4mqs6Nc9xSDmUUlTd8iPRxpzHALDJ8KbT7MxQePw1QZCL5xxgxEIVayNqdfxGD9GQrc8XFVZxN6mkGlsyQzpEYgz+2eLfhBygfcAdAkugFVeLVb4Dr7dEc4Pc/Uaabj5iklT/AwI6Yrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 07:13:14 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 07:13:14 +0000
Content-Type: multipart/alternative;
 boundary="------------SG5VNjRuBEpjuTmLxEdGAgEE"
Message-ID: <925ab698-2f42-4d35-a157-74ca3ce1e383@windriver.com>
Date: Wed, 25 Mar 2026 15:13:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] Luajit: Update to latest on v2.1 branch
To: Khem Raj <raj.khem@gmail.com>
References: <189D459852A339A7.2629287@lists.openembedded.org>
Content-Language: en-US
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <189D459852A339A7.2629287@lists.openembedded.org>
X-ClientProxiedBy: TP0P295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 473063ac-b6c6-4b39-1d38-08de8a3dfad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|8096899003|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	vG6jng7hl+U4heNUFjI2+8eP80DPV3TzjwDPIlU957irXAPvEyH2OsnYOyCLB3BHk4Vcpnmwo5qoCCCBavHr+dPl8K9Z9kMyDaoXLLhmDdFsYRE5YsRWGbUgBBihaZaYH4iRG+iqqyGJkzuvCA2lPEfyxoANJDU3ZA5heOLi23KPa7VdWkwP+hmtpg7IfM66RmmpEwmPgxw8OqGf6wqRXMxXYpZxfzM4PYrBe3o6ex6SIWXGJ1xnbVRCVo/TFpjy+X5hpxU+x2hkHwAMWvR5MQ4VjNWw0RgdlzXL7kkSwut/sdm7lerp8Ss60btoSuH/gwDOjlbiSkEQuAr8wfT6BwLlu8k2jy1enDRdKABxVU3gW7PvXEPOFgndZR8bQ0v0THK1X7WTsibo8YEBgsRA2fLl9+6IUBHOb/cOuoYRGRM/HPAhAOymm9X+444MbLMAcsKKf9C35AQ7Cic5TyAnpSBD1llA0RWfw2CfbBzNkaiFAj9E6Dr/hWb/5wqYHnFgudoeIiw5oOiG4PnQdTl0CrX9eNlI3gaLOQj8KUEj0q2cX0T666iiv2Csz0y/J7Z6HJM62eNy23e3wO2dEtGR1DC8CYkV3fJawaPw6Clh/bBi/krL4NGF43sScha0N3OLLFEa28eG4UGbj0+9fMzct+iiHe9XSBndhEMMn1sQXDno6kNNz8kPlM5G8vRn2Bo+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(8096899003)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGZPeDJCcjBFNlM0VGhjcTZNaGNnYUJTa2ZHMlJTSEl1NG5zVEZMM2V2elFs?=
 =?utf-8?B?Mkx2ODRiQUE0WURBZVlqSVA2Rnd1Q1BJcldiaFNONW50ekM0UURMUWE2REFH?=
 =?utf-8?B?RnZhb3ptazViMm9xQ04rOWI1VklOMUdyT0tCamxpdC9DdjloQk42cEFPUThZ?=
 =?utf-8?B?bWlqT3VHODdTWG1WNWlybEZNbjhkQkd3Tkg5TGhvZi94S3Y0QnpIelZVMVQ3?=
 =?utf-8?B?d0tWZ29Nc3loakdDUFo0OWtwWHBEZkk3ZVJMc2VlbWV2NWJVS20yN3VRU294?=
 =?utf-8?B?VEVHaTNpUUNSWEZ5ZU5DdWxQQk1OWWZyU2pTQUVRRERZZWlLRXZuQmprdS9p?=
 =?utf-8?B?UjBUcUlXWWo5aHd2SCtiTkVvcW1FWUEvanZPdFk5TUszNndKbE5IRTJVQjg5?=
 =?utf-8?B?cUgwMXhjRTdOa2FzY1poZkF6dEw1bHpmRVdLUThQS1czVDF5VUZ1RWZUUnVL?=
 =?utf-8?B?WmtnaHlPcllabDZ0R2NGKzJHOTFNUXJTWDMzTzVCSDNaMDV6N0g1UmNvZmZF?=
 =?utf-8?B?UzBPTmo5ZXlmOU83UTJEcWFJbk9NYzBiOXlsT2E0VEMxdWVlb0tDb2ZxT0Zy?=
 =?utf-8?B?dS9oQWg4eUJTbzlpbTNTUnVtdFgzRTN0dlJ2WWM3TkRhQmlLZWhESGhtOFhw?=
 =?utf-8?B?ZGRham9MeE5FTTg1b3ViS0ovNmJBSG5oQkRwYitaTXRySlAwSWdneDZkNmZY?=
 =?utf-8?B?M3p0dXp4QjdWYS9HTmZDdHZCMUh4Z3h0UHU3NjZlbk5zYmYwbE05MlVLT2ty?=
 =?utf-8?B?cE8zMWZuSXE4NldZUjZtZHYyL1RFSHg3WDZOUllnVDdqNEFVWGxyYktTWkpa?=
 =?utf-8?B?d3R1WXVmbHFUTkhnQlRhRkdtRkFpVHFoQVNMdmc2OExEREgzOTdEbTVMVWpN?=
 =?utf-8?B?YnNmZVJxWHlvVHFza2F6cXRDU3hSK01vLzlLZ2lHb2N2TTd3MTBpSHZURzdy?=
 =?utf-8?B?VVpGMjIyMWJXaWFLNXBlb2FzUEZCZnF4NzN5UlJ2dmM2RkRLUzdRTTUremVs?=
 =?utf-8?B?aHpPNDcxUFl3cUNtUDdicmoyY1lWTGY4QkxieUpRV2dvNEs0Yy9jUnJOY3dW?=
 =?utf-8?B?R2ZtWFZ5UmlBU1htL0FETzF5V3Rya0NZYkM1Sk5rTXRxUWwvS0Z4WUxnUndT?=
 =?utf-8?B?WjVaQ09nT2RmWDlxQmVINGhRY3grSDR4M1kxMWgvWmtJN1VuZnprcFdUNUxs?=
 =?utf-8?B?c1ZkMGRCQ0xuSEdZOC9Ud1hhRkgzNFNMa0FXQnBicVBQbGQxSlExSUEvU1Fp?=
 =?utf-8?B?UE91RlNjeUU2TGpkTHBuSmhOUlJBUU1yK3hocnExK2QyS2dIWmVmSFYrNXQ5?=
 =?utf-8?B?eTZQZk5KN1JYVEZKWTRyZEE5QzlRN2YrNW1EaVRYdlBrclBSYU0wbjFnTWVU?=
 =?utf-8?B?MEUxQituV25Fc2hTQi9kdm9hL2oyemNaY3pLN01FN2MrajhMNktJS2c2d0Q4?=
 =?utf-8?B?MHRScjQvQjRQanpIUTNuNklnYVpaaWttK0FMclBRNjRJeWNtSGg5UDY4akdm?=
 =?utf-8?B?aXpFQUs3S3JvRjFHNkYzMTVvWHB0aFNIS3lhWTNKNUNDdk9EV1RvS2tYOU5q?=
 =?utf-8?B?cVBhVG95bldLb2RZV1orU1NYVHl5ZWpEQ3A2VitUU01PZWhEek9xemRXTitJ?=
 =?utf-8?B?ZWRRWkpuREg1cHArTDVMSE9MSE8wUlNpUXFBcUtDT042dk1LRlJJMEMvT0FB?=
 =?utf-8?B?eWhWR3VpZUZla2pGYWdRQWNIbVl2azRPSzV4cXlRdHVaaEdLZUlZdHJYUy9V?=
 =?utf-8?B?YUZHd0t2L0J2QjhBajhxNlQ4UFF3RWQ0bjAxemZISjgreUhpdTNtek9kbGRZ?=
 =?utf-8?B?UGQ0bmY3ZFBDRS9aZFFxYWF6bzF0eWdSd0lBb0h5WUU0dmhsd1pVWHFNVEZy?=
 =?utf-8?B?UWd0ZnFCeXloSHJvZkpoMTdHOGFUVzl5eUt1U0dweVZsV3N0c29uWnMvaVpZ?=
 =?utf-8?B?aEliZmdDcmtsYlBkQU1NOWJGdkkzeS8wVFdXbVNWeitVeFoyaE05TG1POWJG?=
 =?utf-8?B?YkhLa1JQNlRxdnBENnJESWNLMHRNczBycCtFcnlnWXJQWGxoRnpJbTJwR09E?=
 =?utf-8?B?TUtzQk5XTzFNZE04MDlReTg3NEZIRWZub3NIQ2ZRRVpFOU5vM2RvU1k3S3VF?=
 =?utf-8?B?NUJDbXBIbnVtMk5PSlpCVUE1d0I2Z0daU3o0d2RQK2ZnZ1UxMXlXeTJQQ0Ra?=
 =?utf-8?B?UGt2YVErS2l5VnY2S3ZrcG9pT2czOUxKSG5TZjdjMWVjbElGbkVsaFpiOTB0?=
 =?utf-8?B?K3pBQlVxSkxZSmc0aE03SWVRZE5Ldzh4cUlEdm5VMEt2K1V5MkZaenZ1N0RH?=
 =?utf-8?B?MzNZUGNJNXRzVUk1YjJKbGNCUUZlZE9mVm9wS3hjRGJZTlJFRThkVHphT2lP?=
 =?utf-8?Q?eAZY/NEi9g6U+61c=3D?=
X-Exchange-RoutingPolicyChecked: 
	NZuA+Y3QUvMhwlT9d6jIugMOUBA7B34uGzec4lgvIeKuPuWjBIxV/7kkHs9DJoqsKYx+InmwmLVMCbIgFDCyk2h+h594AUbyS93eEyrqIRvrM85wDDU0BzHqubQclRrcoG+vUbicqSA3t16+jfndq4wms8GRtR171mHAiTdDu31lHG3kQqDXjS6RU8V3u9StdkG4aLrAF3gQj6d6pP1aOwD7JBXZ3vwwCOCHcxKXhQpqZNaQDo6RdaX0Gqt62UCbQwyBD7PAWQQ6mL+kShw0LZ39rn3U0lCBJSsLFma9K+Sc/ul4daO5NG6OcYCM8PR/BpgzGYe1M2ti7tD7DLNZ9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473063ac-b6c6-4b39-1d38-08de8a3dfad0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 07:13:14.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zh+92+JhZvVL1D/76deFf6X0olq4ka4JUM75k4noq4Dmi7Ren82pQ8FjUsZNl0v0YdpZ1mZMP1HnrYalGw282mJ1nsPrmAsOZl6bNBCzA34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UVdRqMP3TKCKLWFAnJn73lghV4RrnMDP
X-Proofpoint-ORIG-GUID: 2tckzpZsx170zewali6ue5qAztIfWzaS
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c38b0e cx=c_pps
 a=2EogD3SZGC0twO92opjmhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=nm2HxRzrAAAA:8 a=t7CeM3EgAAAA:8 a=vRO-QFqjEuSCEinNzPIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d8tkO0nEpDZptwP4WmYA:9 a=dfmK2A2wF6qEDcoF:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=xTkba3CB784Yst2QIEaM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OSBTYWx0ZWRfX8G+bI3yz8hF4
 GOoGp/8k+3rHZszHeVZAP4zC4xtCPCCze5uQun6/L+TkoHd3/v1BzSsojkHPVeSQBb6kv/3JTLi
 kLWSXlYQg/op9a6mDHsA0XYvGzpk+iuFxGVZrMZa1xVaSB2uIvTZ9x9BKCK3YGFHQuwuiqxVuGD
 TNaT8RRS0WDI2YfTPR3VGN7CE0qyDRxDnhfIPhf+qCQmOrmAY31tyv/D93oqSN+JBR9BCklIkGy
 tla4Z2EdWIzRBJNLIFOqaafE5wL4erW4pKyTGGn+vjMv2K9JSjBXkb7pQrgttUsFYtMm/AMgIqX
 mkZXa7qcD1X3Qh73U31InB0SdxExRZ71jNPJAgPtQzx48AeWPl+Zh5jtARCj8CHuliIRk1AbYsb
 a5dTvu+jePSm5QGgs+LIbE31gIbAKKBHNJsJTXV7oq8hqo54nRWaJMX0iAm32xhsV/oqkTriXaa
 uGD46Or13DHRTUZf8+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 07:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125603

--------------SG5VNjRuBEpjuTmLxEdGAgEE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62P4SxSI324512

Hi, Khem

It's strange that this patch turned out like this=EF=BC=9A=20
https://git.openembedded.org/meta-openembedded/commit/?id=3D510ea4db57808=
82d9f1ad17b234d89bb691ed3fb

Could you help to check it? Thanks. I cherry picked this patch based on=20
the latest master, it can be cherry picked successfully.

Regards

Changqing

On 3/16/26 16:38, Changqing Li via lists.openembedded.org wrote:
> License-Update: copyright year updated
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_git.bb
> index 9df5fca0e6..0bb78e18ad 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -1,6 +1,6 @@
>   SUMMARY =3D "Just-In-Time Compiler for Lua"
>   LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D"file://COPYRIGHT;md5=3Dd421a5e2a24207f5e260537399=
a9a38b"
> +LIC_FILES_CHKSUM =3D"file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0a=
e59ff3"
>   HOMEPAGE =3D"http://luajit.org"
>  =20
>   SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;bran=
ch=3Dv2.1 \
> @@ -9,7 +9,7 @@ SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protoc=
ol=3Dhttp;branch=3Dv2.1 \
>              "
>  =20
>   PV =3D "2.1"
> -SRCREV =3D "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
> +SRCREV =3D "659a61693aa3b87661864ad0f12eee14c865cd7f"
>  =20
>  =20
>   inherit pkgconfig binconfig siteinfo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125258):https://lists.openembedded.org/g/openembedd=
ed-devel/message/125258
> Mute This Topic:https://lists.openembedded.org/mt/118341592/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------SG5VNjRuBEpjuTmLxEdGAgEE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62P4SxSI324512

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p>Hi, Khem</p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">It's strange that this patch turned out like
            this=EF=BC=9A
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D510ea4db5780882d9f1ad17b234d89bb691ed3fb">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3D510ea4db578088=
2d9f1ad17b234d89bb691ed3fb</a></span></span></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">Could you help to check it? Thanks. I cherry
            picked this patch based on the latest master, it can be
            cherry picked successfully.</span></span></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">Regards</span></span></span></p>
    <p>Changqing</p>
    <div class=3D"moz-cite-prefix">On 3/16/26 16:38, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:189D459852A339A7.2629287@lists.=
openembedded.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">License-Update: copyright ye=
ar updated

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index 9df5fca0e6..0bb78e18ad 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D &quot;Just-In-Time Compiler for Lua&quot;
 LICENSE =3D &quot;MIT&quot;
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://C=
OPYRIGHT;md5=3Dd421a5e2a24207f5e260537399a9a38b">&quot;file://COPYRIGHT;m=
d5=3Dd421a5e2a24207f5e260537399a9a38b&quot;</a>
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://C=
OPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0ae59ff3">&quot;file://COPYRIGHT;m=
d5=3Da2c43bf4a9ea63755af2131b0ae59ff3&quot;</a>
 HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://luajit.or=
g">&quot;http://luajit.org&quot;</a>
=20
 SRC_URI =3D &quot;git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;br=
anch=3Dv2.1 \
@@ -9,7 +9,7 @@ SRC_URI =3D &quot;git://luajit.org/git/luajit-2.0.git;pro=
tocol=3Dhttp;branch=3Dv2.1 \
            &quot;
=20
 PV =3D &quot;2.1&quot;
-SRCREV =3D &quot;538a82133ad6fddfd0ca64de167c4aca3bc1a2da&quot;
+SRCREV =3D &quot;659a61693aa3b87661864ad0f12eee14c865cd7f&quot;
=20
=20
 inherit pkgconfig binconfig siteinfo
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#125258): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/125258">https:=
//lists.openembedded.org/g/openembedded-devel/message/125258</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/118341592/3616873">https://lists.openembedded.org/mt=
/118341592/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------SG5VNjRuBEpjuTmLxEdGAgEE--


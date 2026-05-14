Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ECBCD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 09:39:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6959.1778751553575156176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 02:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X3vzVlYa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9594220287=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8hB183664471
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 02:39:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=IgjbmSVBu3HiMM1K4xweBZuNEyWo0vTfDW3dw7/BLZw=; b=X3vzVlYa/tcr
	aInZNKxrBtdA/79trIiv7c3XFW0OuiO1uCUuWKn19DGoVbURmcyrUHvP/YvsYJb7
	1VNsq80xrYnXgipKClUNzYknlZ3eE6URv9uZt9dcxAjcP4CVZ69/BlvHgms+ifFN
	Yy8ov/SWZYqe/cxN4CKSnifkyISTGq5StbZx96IgaGvyxw96jwHxOMeukPRIy6yi
	W3vg/4DsECSWXx2lIq4JqX/1h0ZrV3T7HxwEN4tDOMTKeoZhjEn5vqIIg/eRLZoq
	qylJzNMcFJ4wDiVCktcxkBuU4aw+eChgIqqcGo3SvLyoQXH2aUS9Wf4E7mLsy7Ni
	1KdaBZlTyw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftba2u1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 02:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIhN1MfPeaJvXv3EAjf6TNLOPfiTmttNSNTsN8DvkuQkXwZzPWiEQywNR//DFY7a8DQNBxSIOf6I9Xg2qK3e8VaYLVZhzpy/xjyYfD24VA1CBbBQCLA6j5hRSgNEh2tlKXpwZ7iiuQhSe3Wg7/TWsNLSyXkMQSmDdWrJ13GwQgYep2aICnwu40wjuAGGrFiRPR6uWESs2tDtUIe0t+AzrTVIHKNHzPPPllGLFSIQrP5iBJm3GSSio8m1inVAFs4qnGGXXNLA5Zq+1UpbXpmq+pGJcyvBOpxFXtzYMSQo8XxDXmGno6tUk3VviwlIEW+y51zjqIVmubG64qC0QkXUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgjbmSVBu3HiMM1K4xweBZuNEyWo0vTfDW3dw7/BLZw=;
 b=an+FXhsevk+UYzHVevucbGgMWRiD4IK+NgQUWzDu8NNL1LZkSyMZCDge9nUdTYHv3PZTxcrDcyfDkSuL/qoThw65WVsTCp7ArrcG5i62CMkVfW0SjWufLdynj6USpIx5WMIuhN5lSCMVdgj4KHvU5ez3xHswP9jtOF756mTs3+10PoJnmi8j/Gzv9hOgbhTsP+XumkmbFZMmE8Bhp5r3xJX0Boi/NVkxBSBtrrf4B/luNSFVTo/zDd/ZHq1HIyOtbenmiK0pRl42kJF0kNhOCS94PfFf7635bGuPUW8f+VYJkHFjtMnYlI0vaFYjrJNhXA/5QNCRl53sxkrb7QQvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Thu, 14 May
 2026 09:39:10 +0000
Received: from SN7PR11MB7601.namprd11.prod.outlook.com
 ([fe80::b3c9:47a7:4653:5a6]) by SN7PR11MB7601.namprd11.prod.outlook.com
 ([fe80::b3c9:47a7:4653:5a6%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 09:39:10 +0000
Message-ID: <6bb34361-1955-4c68-982c-59371fae301e@windriver.com>
Date: Thu, 14 May 2026 17:39:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] 7zip: update CVE_STATUS for CVE-2022-47111
 and CVE-2022-47112
To: openembedded-devel@lists.openembedded.org
References: <18AF64CE7ED5E4D6.3285117@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18AF64CE7ED5E4D6.3285117@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::7) To SN7PR11MB7601.namprd11.prod.outlook.com
 (2603:10b6:806:34a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7601:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7a0b08-6e3f-4613-08c5-08deb19ca6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|22082099003|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ik7F1K3ejHQ0M0rZNl0HAq989uIIJMo5C0ruI5HayXJ6gmUDe+HrEbzNFXiWKWZ37g8f+p93r8B9C9cutOZhOrjPy5JjEVJsL/0N1Ibq+tikXSUkYwqxLbUHnb6nW2B2m2vtHN2RPpkMdK0muy0PewAYEEnRZhjYAg8FyprGylY4q3QSkvym9GiZDC8cHZSwJ3zr5L/gXA3lJajlFUrjGS7xpu1AQl3bgYMtmA/+P4kXwkejxJgLkgTyOXIka5uEbmiGAkbJThXnbWQsnyJLyhw1Us10x4hZ85r3HIr3acdChy7YjjrCzbM5F4kDD6P++MSSkb9/NK8hTvo7nQyMpp65LMFy6xjKUN2Qhzqri1btQFca5Uz9u53yZ2sF65XlFDgk9m17y+5QhyNHJxvcpTE2s/X94C340cszevuUYPRZmlwpWr2C958GGyVrFe2z0CsITFkuqZfZM2dmNL1pbnC3jV+YGJmJqltC/xkqh3Uvhh7ONBW5BVtc3tQDJvpNpdauXSzf+VRr5zLIjudLj3CNi7NtKiSPfy4wMnPwawuppqcPwTJKx7x/CykZxie7k4ul3VjcSfjYf7yVGremhuU9YB8wd2IqCoKQjCPSt9m6tpF30hMSMORvhZg6ySvAipvhWaDngjOOwiu4Mh9JNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7601.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(22082099003)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGxWRmQ0b3kyMHRzNGhwMS9MbExRYWYwS084RnFGVU9yL0VxSDZDakVzSkVi?=
 =?utf-8?B?cWZBNWlqU3EzVGI2Z2RJQnlLN0tZQ0luSm1LclVUSHU4SGJkNXJGd0pzUEdI?=
 =?utf-8?B?Y2UybzFkb2U1T3g0eGZrZ1E1V3BVT1FRb2U0WjBVeXl5SmRicE9FUllJTzM2?=
 =?utf-8?B?VGVjL0JCNXZHeUxYeUx4ZEFGeUNVeE9NNXQrclpkdmZSTVdKRVZaK0hqSXd5?=
 =?utf-8?B?NEl4RGd5Tm56R2J2Y3E4RGhpV1Z6THlnS3ZpR0ZjcHNKZUlCNVFKdXhtZitl?=
 =?utf-8?B?WU5XakVSUmxPSnVXNS90dnFZNk1ORG9zWWcwakxxUUxaNGxxdEh2NGRoRERk?=
 =?utf-8?B?bk8rZ1RpTzN4VnFTbDRhNjZ6RUtJaVpza2ZQSHpQS2pEM3UwT2hVSnpGd29i?=
 =?utf-8?B?T0tWbFQ5VG5LWVd5TGlCK2FsN2lrM21ldTBHM2JaMVNOcUx5VkpXVU9nK2lu?=
 =?utf-8?B?UmN3T1NrMzY0NWhhUkpzbGVMS2xnOTNsbVQrWVUvTG5Vb0xUYWlmMzNYdFhi?=
 =?utf-8?B?UEo5WU5ieHY2NXR5MzdXUzJDNkZGb2Q0d2dIQmVjOGZVZHdiR3hYMTRmaE9m?=
 =?utf-8?B?eS9PdTUyT3kyZlJDN0tMVWM0dUdOUFlhYmRqbmY2TUZSMDFGWVpNRGNUVTVr?=
 =?utf-8?B?QTYzcW5PMHE5Mjl6NVVrUkFvbG9GZmNGMVlCN3l2am9PODd1bzYrU3FPVVp3?=
 =?utf-8?B?akZ3b2lpendGeVNSVHhjUGROaVIraDZVUGtYTHRNbXIrZGlYNlRtQXVIWmwx?=
 =?utf-8?B?d3NxVTdRRVBJSjVqUzNpc2h1RktNbENpUjFac09tMWNlcExBRlBlNmJHeDVX?=
 =?utf-8?B?VjZKVTJPcFdpbW9ub3hZSEhYZTlFNUZjcERveWtLcGlvaGNOWEFSRnR1NURT?=
 =?utf-8?B?SklFTktmWTRNbks4ZktycDI3dGdkUXovREdESDlsTXJtblJPSzZLa1lFdDd1?=
 =?utf-8?B?WkExS1J1RElqL2ZzT2o0V0Q5VGZ0MzNSSEFjY2cvQzJ4RXJ4NWNnSlBWaGE5?=
 =?utf-8?B?MjJOelQ1ZHd5eStRbTBIYjFXTjd4d0Joa3hISG1lMnNUL3VuaHR6VG03ZDRR?=
 =?utf-8?B?c0xrSXl6Tm1WMEhyeVNoTThQUUQxc0hwUk10N05wZVo5UVFqeWlpNE9UMk0r?=
 =?utf-8?B?M25oZUNYeXhHY2ExcDgwaDI1dG1jY0czU3oyK0ZOUWpoOEl6aW1GNC9XUGRt?=
 =?utf-8?B?cXNocXFGaTZMcTdiRGRULzg5MFVkZi9wV2JrbTFNYWJ3VVBnTnZ1ZjhubGNU?=
 =?utf-8?B?RDdKcnBsVWg3S3FzOWdvQTI5VXBFaVFzdFVPRyt1aGZVR0lwL3ZYS3lHd1Vz?=
 =?utf-8?B?RHI4RzNPTm1yTE14R2hSWTFuUmEwM0NlS1NoQkFHeFRxaFcxTHp2WDdjVklp?=
 =?utf-8?B?UHpkcUhHSWJwSkEyLzRIcU83Wi92VFFkTGt6WXpmVUtZUHRya0JZY0JwZGpD?=
 =?utf-8?B?cTJ1Z3pTemFBVGpWemQ5NkhxUVJyUHBRWkd5Rjd3WHZYd1VuN2FjVVJsTzVR?=
 =?utf-8?B?UzI1NHJSMXY4REUrdlpuZ0xDRHZpZWN4cUh1alJnaU8zNlV6Nm1kWS9vanV6?=
 =?utf-8?B?MHdQa09pZ1k2RUNseURHS2FIZ2RJd1pYeXlnTTU0ejl6aHY0Si9jOS9XR2NM?=
 =?utf-8?B?bmxDV1pQZXNZbTNRWmJzMGtXUGVvYmpDQVFqakd1alJsMmNCQnNFZElTU2Zy?=
 =?utf-8?B?VWZtVU9WTE9tZUlmaStkc0t5emhIV29qdW0ybWZRVndoUUFITDEySytoRHJ3?=
 =?utf-8?B?aFEvQzBoZ2hmK090VnVYVzJScFJVdTUySzdPdC90aTgzRjR6TTh1bjlnRWJI?=
 =?utf-8?B?S0FNN1U4ZUJvYU9FZXZJK3paZ0dIR3ZqN1ZSaHVKSHV2Rm1NSXpIUHk2UGs0?=
 =?utf-8?B?bmV2WGcyNGUvbFd2bjA2QlJXYXpjUTdINmU1dUdYL2NCdE0rcUVFK3M3MDFY?=
 =?utf-8?B?ZE1sUElSc21SNGgvNG9EM2xPNFliRC9oQzVPdEo4b0x3cGdGNGJ5VzNHZVhs?=
 =?utf-8?B?Mm9WSm9sSkM3Y3BLWlNUeW9jSGFSZ3o3dWl0TEZyWlVjMXBBV1h4WFd3Y0pI?=
 =?utf-8?B?OWVVSVhtdW9qaFh2WkdGeHowTUZkOHJ1M1d4MTY0VER0UUhHa1VqR25hMmFi?=
 =?utf-8?B?eEhmWWJoeHNSNXZuRlljV21zT0QrRXdpdkt0dVdRVk9KUzlER1pBT0VtZWts?=
 =?utf-8?B?MWNlVHl4NnBvMk5FUzU3MFE0L1ZLQ1J1a2pha3F4Z1ZFRVd5V3lwWmkyN213?=
 =?utf-8?B?c3k4Q3MxYUxERXRVNzVGWmVWQ09sN000TVRSdStVMXBrdnVDU3lUVVJPNUN1?=
 =?utf-8?B?Tzh2SEU3UWJMZ1BzME9TM3FsSU5XUHB1ZEFuMnhybFN1Wm4rNnYzUT09?=
X-Exchange-RoutingPolicyChecked: 
	EnE6XPhdB2MxmeFYQnFbbspWOeqWt0/Zykn2+oJJBl7scA6tEiPQZbfH4uuzAGdCOoo71USm1t9vEiQCrZghteMWCX3av3e1IZDswaldrgIjDX3AQE9K/MpTQEEVDSd2gFljx5P6IqfQEN2E/5QaPPrFfjuNiZoChmZRxTiW/jE+OduLtvmOPKWv2+v3QQBrgccSdpu0r9Kn0C3W3MriEhNwA4jlbi863kg0Y68F4xOhnsQrSVj/LFbUJKDxZZ/eYC+R9uKGpkGFVHAPMcyq9Fm/Ds6AKqFZKtC0pAr7NySmPTFXwP+sQ/jtIgJ2eSNWCSCBg+XegwusfrQf5tjoCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7a0b08-6e3f-4613-08c5-08deb19ca6d3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7601.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 09:39:10.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVdy6Uvlu7LSHPDsmR8VEzOIpQi1+r6L1L6aS8vi17jammZbRWa7q3esfmWG3rDwOSBF3AU0kly2qATyAI7Qsop+soXKNzETKVEivUZEWN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5NSBTYWx0ZWRfX8lps38UYkDn+
 pB/4dOwHeh3TxJODl2y2vWpFJPTl2uTlqqMzLJteu+IUoaa4AOFWCkTdAJFO0tc4MtGzTyA/FPX
 Au4PzFKFa54y5bryqnk0PLSROLkJsJV8u9gQecbfGlxlxf6YuHPVctKPlo2GoNAWerJvGm2ujZh
 P0U/akEXvNDCrEU34bMh37sq+vqKUkQaqZPIiZeRjl0DCo6gcCAi040g8kStWMFQYo/Ri3pn0jW
 dq+h896PUUmS7mPcrfH/wZinwLv43uq2lK0bHsX29epcug8Wh/ztSdWgGwCTz2EtxbrcMsH4Nc6
 EWmYSWXFN0lfaX18zzDsbbm+uAAjW7EBJAs4t1Sog3vFPq54M8sHHFm2r5pmL9tVeujEtDUHM//
 jI3p9/I0UTqEEjYQUkcUFTAOfLMY7jIi3YLEq93nf6xCpA3rErESYLTrdzLkXFCp179m9McNJBY
 X0LmfUGJmPOEFSKrcTg==
X-Proofpoint-GUID: -3cWlM2bbb6Ecv5-Zr_MH3nf5tzOVc-r
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a059841 cx=c_pps
 a=IyT5loBvHZYA5YPQi3EYsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=H6ntmcR9A7N4BZBXHW4A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -3cWlM2bbb6Ecv5-Zr_MH3nf5tzOVc-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 09:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126987

Please drop this patch, the CVE_STATUS for 7zip is not completed, v2 
incoming

//Hongxu

On 5/14/26 17:33, hongxu via lists.openembedded.org wrote:
> The issues was found in 7-Zip 22.01. Some later versions are unaffected.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-oe/recipes-extended/7zip/7zip_26.01.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> index a3e124518a..2729edb55d 100644
> --- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> +++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
> @@ -69,3 +69,6 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so p7zip"
>   RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +CVE_STATUS[CVE-2022-47111] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
> +CVE_STATUS[CVE-2022-47112] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126986): https://lists.openembedded.org/g/openembedded-devel/message/126986
> Mute This Topic: https://lists.openembedded.org/mt/119310435/3617049
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



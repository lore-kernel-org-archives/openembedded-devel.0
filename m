Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D0D12D7C
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 07:05:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53785.1731308719515936910
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 23:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045eb20c4=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5oGgV013213
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 23:05:19 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84ps7sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 23:05:18 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AB75I9r024233
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 23:05:18 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84ps7sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 23:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj9ov++nqXdvnforNvcIafLVGJFG0O5vqiHa8A4DMj5Rhe/MCTnPckz++nqobzPCNxTkNHFap+EewwcEWyhMocrvchSrFGA/gO3UakhZVOfMS1f1lwJLxmTzP+sLofAwGsvMoixxDVUpjZ4NERTRjy4XtZTqC1Wz3ctdgkazh8NtEuE50xL/yyUIuwXLLr0s1qoOi3GgJt14OWy5B5TkOI028cIE6y3dhoBGAneKhnPCt+pNFN538kg4RCeL1XSTlJ5IvaUWzqbARCgRrmwzG3ylqYQ4XzkcNGs6C84n2YpqfH132XWnoxVcdMycJWCBDPSbQy8qeLYx0wipZ3vGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLJT1+CFVp1hBSyVVpE4XR9A5tU4EQSsswHivvGkRqo=;
 b=XmIYYJNjnkm9R9u8gjUnZNawix7KC4hxCxTYrR2QuNHCrL/bLAllYssDZTgKGKWV1vnqbSZ1Tz49j68lUNvq0SaNkdpc0x5YG/GlFIs49abVlpnqRhTbSXsZixLFUY/4M4mNRP5V0XByc03WQAw+BL6QsiqhdQb+wouLFDOYyN2M2xTbhXjXWhCTNwp6/aWC5oq7lUqDCrHrruSC7eECF3zSPu35+GgNcBcIk0XTWmco5DP1w8acSAhmvR08MuOs6DLZ6oegEabiEewXM5bNFSPgURnNnZ2DQmTFwBVggqW5YmX8ZG5JU+WvdFmrv/Ob6zVn7Wr+sofqjmytom1yDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 07:05:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 07:05:13 +0000
Message-ID: <24f6b998-88bd-489a-9d49-6efbb879d757@windriver.com>
Date: Mon, 11 Nov 2024 15:05:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][kirkstone][PATCH 1/1] wireguard-tools:
 clean the do_fecth warning
To: openembedded-devel@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>
References: <17FE8FE171B7EAA9.32376@lists.openembedded.org>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <17FE8FE171B7EAA9.32376@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f6ff47-e580-420c-e58f-08dd021f306c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWdKQ1p6czF2S1NObVJJUldoc09WeVJjRUFNSVY3TTRtZ3J4R20vWHZENTlp?=
 =?utf-8?B?SnhLc0xrclRzTVBSUTNWSmlPd1hSVlAxYnB6OFBoeWxmeWJKRmhmNjdSYkt3?=
 =?utf-8?B?di9xdExxMzh1SXRzL1RXSjRkRnpPWXZGZmVlb0o4L3R2RVBxYzRCenhUT2VC?=
 =?utf-8?B?WTk0eEhFRlFNWUdSVExnU1VqVXBvRFVLeW9mdk1CaXpEYllpT1F0NWlWZXRB?=
 =?utf-8?B?SWRsdEdaZkk5MGVyYVpXZ0tOVDZvYkJmQWJocTVqU05BUGZtUm1zdXBJd2V6?=
 =?utf-8?B?WG5ERnIwOXIrRnhXWmJKeFdBMmdGYlduRkFsOHNsb21qc1FtbWFCZGxlemxa?=
 =?utf-8?B?NnMyc0lkTmJkS3l5WCtGYkY0WTdkN0dIY2lUaWg5b0VLS2FYSXhrdDFvTzZr?=
 =?utf-8?B?ZENnTUpLRHB1Tm5TMGxaVVMwL1NEdHllQVU5T0RBZmEwRXVJTzEyZ2wyVG40?=
 =?utf-8?B?anE0T2hBNmZyNmxLQVhkdWlmWHE4MGFrcWdPamVxa2QyRVpJL1dBR1dFKzdO?=
 =?utf-8?B?STBUdi9XVjdONUd0aE83N08rSHFuaXBXbVRzYk9CK3V0UUZKbmlLR0hGZ01X?=
 =?utf-8?B?V3U3akIrMmdERFdCV01EdklaTGEvYmVqK2F1WGs1U212RTJKSzhUdnJQcUEx?=
 =?utf-8?B?MGtSUzY3Rjg4VFYyTUlkRFVUOFZ3RFdGb2tYM3daTWdFK0J1Mk1WNTJUd281?=
 =?utf-8?B?N1BWM2ZRK010dEJHS2FaYWp1OXM3QjdyQktlQWJqbWhYNUYyQ2EvVFdjMjBI?=
 =?utf-8?B?OERQNm40SnhETW5XczN4ZHgwcXVyNGxybng3NjZFVnFQUzNoWWtML0F3SkZG?=
 =?utf-8?B?R1JPYTZ0TjIwNVZWSXkzeGE1am1sWHNWRTZDejd0ZktNUTBNQklxMmtPbU01?=
 =?utf-8?B?Ky9maHlvSVAwQ1lGdVkrdmVUVXo1b1ByWFhlVmk2cmpQcGo0dG0vRFF2czAy?=
 =?utf-8?B?ZXFkTzQ0NVlUUDJsTVJST05zOUNVNitlV3ZNN3pSVDFoelRZTG85dXA2UVM3?=
 =?utf-8?B?UmlxMUhldHo2dTRSR1FtNVZzNFpVbkZ6d0ptZXRvRlpDRUtrSDJxMHZvR1Yv?=
 =?utf-8?B?WGp2L04rUm83Q2cwakg5TytHZ3BBUDBYbTV6Sng2bDdmQkgvSllrOWE4RVFC?=
 =?utf-8?B?dUVmRFJNZ1hEeTRuQUFsVFlGQ1V3L2Z2WERBN013dVRsT1BIYnZGVnh3d2JO?=
 =?utf-8?B?QjVML2FNZGgxcVU0NGl3TGhUc2wzNitxaFpxZjRKRldUUlpoMkhiY1d3Q1Vn?=
 =?utf-8?B?dDNhYTZRSDliK29GTXVlR2ZMQSs1dWFiNmZ6NzcvSXZmZytOZVpTT1ZEdEc3?=
 =?utf-8?B?VHlYUkJFcFVVWGRISWprWkp2UWQyUjFEdWZTazZFZTZMWnU5ZmxUcmxJS1dn?=
 =?utf-8?B?V2xveW9JTSsrOGlNZmtidGNuM2dUQThVeFE3TGlzYTIyeElBaE45RTVSZnUx?=
 =?utf-8?B?QkN0U3Uzd1BRUG9ET0pXM0lqOHJVTnVWR3pneFpNZmVmT1lXZy9zVEZVV0Mw?=
 =?utf-8?B?L1crdFdtME9FK2ZPS2lxQmtQVEFDMW5rNGJGc3N3cU9xMFdDWlhIL3NHckFP?=
 =?utf-8?B?cnd4MU12M082U1FpRlQ4OVgxMTVYMkpGMVZ5a0UvT2FmQjZLMlRlZlJyUHp4?=
 =?utf-8?B?NUZ0ekQ4VitwMVA4WEdkR1JtWVFvd2thZU8xTzJmazVCaFYvK0dRT0JOOUdv?=
 =?utf-8?B?cXB2WFRGeDdkVkk0eGxpQS91d2xMeUZsVDdkN0ltMzQzd0RubWdNcTRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWdrQlFiSjlsTmlVaHN3R3hLN202M0NVdFJyZGtlcTlWTmtSUEd1YXdoOXZ6?=
 =?utf-8?B?dEF5WTQvQlF6TXlWeSt0TFpxL1VQWXhQWm5hRG9Za2RQTGZVTWdBT2YyVk9Q?=
 =?utf-8?B?dVNyK3Vwb1B5Rll0czRyeklJQjVhSUM5Y1drdGNlMllORmJSbTVwWGtpZjZS?=
 =?utf-8?B?TkhDejNiTy9pM0dIUHAxd2h6Y1ROTVNoSmRWMHJwU2FPMllvMkxCTXJhcjFT?=
 =?utf-8?B?RHlicFp1WnBrS0hnZlVnU1JuZFMxbXhnTnhxNDhGQmVaRzVacVZJV0VMOEgx?=
 =?utf-8?B?eHp0UTBJbHlGdER6Q2VCNzRpRXU2OUFza0hScHVtRDdJUHhiMjRMYm5kc3Fy?=
 =?utf-8?B?SUwxY0NvcFVSNWdLaGdwR0Q0dys0eDR1L1JtaVZua2dITTJmZkVNMjFZcDY1?=
 =?utf-8?B?STQvNTloTTZNaEp0bk5uS2ZFbXpocGF4UDljUU14d3N3eFBMNmh6dG1XWXFG?=
 =?utf-8?B?YTY1V3d0eEY1U3RaSkRvOU9FQ295YWFDY29MMElCYzdIeWpDcXZaNDZFKzNt?=
 =?utf-8?B?TnVHdFFpaEVWL0dlSzc5VlN5MXdlMW0vMlZqWTFreFpuOTU5Nzhwa25jaktN?=
 =?utf-8?B?L1FnRzB2bmlaRHJnTEdmbmxvVHAxMnRvUjY4SGhMRXpjMmtsM3pXd1IwbFlz?=
 =?utf-8?B?dHdmR1N1VkRNMjVmWVJhWU9PUzhZekhsOHY5UWlpMmFxRnZXNGVGRGdscTRt?=
 =?utf-8?B?alZ0aXRoSDdMYm9wd2pXWDVRVHdURzhacFlwNXl2cTVjWTFUekNKZStpb0pk?=
 =?utf-8?B?Z2Y2Q0gvM2hjdWkzN0RJMzBmTGltMUZaMUUzTzZmcU5GS0N2RTdwSFM3MUwr?=
 =?utf-8?B?Y2NSL3RPZWJTUUc5OXpTN01pczFxVXRZQTJwRVQ3ZVFyRGtPSXcyeTVDblJj?=
 =?utf-8?B?NklTMW5Ya2d2a2N6YzZtcUtkY0Y4eDljNFVHNGNrMUlRdTVIRnBqeE5LNUxw?=
 =?utf-8?B?SG9TTW5adVhtNEc2dzN3OEoyN290akd0RGJCQnZXT25ReXlxUGgrQis4dGxl?=
 =?utf-8?B?VTQ0NXVjTXNLR2p3QkorTUpFaCtOci9XNG5ORFZHREFjSnV2SkZjQjBDcmpu?=
 =?utf-8?B?dWlNTXEwZERUOXptSFpGSXhaRVpIRnhESGtObkRsZ0JvRFZCYklWQUV3T0o3?=
 =?utf-8?B?Y2pVdm13ZTZpOENDZFZRNkxBMTdBV0pWbjE3ZjRCdDQ2Zlo4WXk2aHlRcnE0?=
 =?utf-8?B?Y3A3UVczalhqV1R0aVJ2VC9JdEpKVDNEeEljRXVnQmxiNmlwK1Zjc2tTWXhT?=
 =?utf-8?B?UmVxUkpkTWVCNkcxVmFaVGV4RWxWdkhCMUJRcFBQVWxFNE00ajlTcVZKdjhN?=
 =?utf-8?B?L0cwYTdCMFZ4a3FIblg3aFhSNVgxSEZYa1NmalR1c1U3eVlrb1JYeWc3ekNj?=
 =?utf-8?B?Ulk4azlSZjJORTR1a0RDQlNZd3BGMXhtN2UrME9lNVZ5a0I2WHF5RnVsNXhm?=
 =?utf-8?B?OGN0endwNEdxaGhJWlVBck9DSXhBWDFtVXJLSS9JQVNtTXBWUk96cTRFZ3Zh?=
 =?utf-8?B?MEVNZ09OajczTGNJR0J1VTZlNHZ1TyswRGN5NjMvOVFmc3A2enNDajhrbEtJ?=
 =?utf-8?B?RW5ENCtIUVc0UjZPY0RGVWNycXFVbm1lRE9aSlgwTElKK2x1NEk0b2tlR01J?=
 =?utf-8?B?QXgwejBNcDlaQUZ2ZjQzajJDcG9NRUtUMlFnNkpsS09OQ004bW10cE5GNTZx?=
 =?utf-8?B?K3NIQjc2ck1oSUI0dUV6SDc3SGdha2ZHZW9PRkVaYzFuNGFCY2VYT09kMGFo?=
 =?utf-8?B?L2xuSmxUeDJpVUNsUDdvVllzRC9XcWZvUEFyaGJieFFGODVNZ25OMjB4eHFN?=
 =?utf-8?B?QXlPU3dsZ28xNjlhMW10NHV0b2IzNDRZOTV5TFZIeXR4WWJXaEpnY0xOWUVU?=
 =?utf-8?B?dDdzZTAyMjN0Y3pTRW5BQjZMK0IraEJsbmFldU5FU21DdEFOT1pJbFhMeTFN?=
 =?utf-8?B?aXRxMXI5aEFidXJ0dm9YVkVOb1lVSk9nbFhDUHBoaUl0ZFpiZWUrdk11SG53?=
 =?utf-8?B?aExhU1NqQlJ4eitmZCtEbnprZnNkVktoYTZzeWJwL0xxYldzM2podDhrOWdG?=
 =?utf-8?B?NGhTQ1I5WHFTcDVnbWtOSGxUMmNoUWhFN3VEZy9aeS9QbUJFOHNCMURHSlVn?=
 =?utf-8?B?dldzNXpWSkhmaWVGbUppRFZZNXdjTVF3Y2t2RWFMd2x4QWNOcGs2eXBKQ052?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f6ff47-e580-420c-e58f-08dd021f306c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 07:05:13.7501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkeKL1o25SyLZ6lPIb1smW0qjBSfOSEx3+t6k5Wmzh2OISwaO0QyqDIRHw/Iw8RYMJzqp7i2YHJ8Whn559WO9yk55jdBa/r4f3K1EAjQOPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6731acae cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=UGG5zPGqAAAA:8 a=U-mHPkjSaKXMGg6fSOQA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=17ibUXfGiVyGqR_YBevW:22
X-Proofpoint-ORIG-GUID: YH7wvx_elK3whH9ibTW1srlP_cvS9IEN
X-Proofpoint-GUID: wYbK7VDXwHDP617qWfRMXyZEQSR6UPKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=705 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411110058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 07:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113784

ping

On 2024/10/15 15:31, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Update SRC_URI, change the protocol to https.
> do_fetch warning:
> WARNING: wireguard-tools-1.0.20210914-r0 do_fetch: Failed to fetch URL
> git://git.zx2c4.com/wireguard-tools;branch=master, attempting MIRRORS if
> available
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>   .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
> index 20435338c375..efac808b758f 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
> @@ -1,7 +1,7 @@
>   require wireguard.inc
>   
>   SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
> -SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master"
> +SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master;protocol=https"
>   
>   inherit bash-completion systemd pkgconfig
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112925): https://lists.openembedded.org/g/openembedded-devel/message/112925
> Mute This Topic: https://lists.openembedded.org/mt/109018428/8599992
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Haixiao.Yan.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


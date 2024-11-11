Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8178D12D67
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 03:11:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50647.1731294691334655715
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 19:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045eb20c4=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB1si07030290
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 19:11:30 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84ps3s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 19:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnS6nKPx5XCDj/J9t9ToGmhwxSjZd7YBEdxR1l2YnaDvN5pYBoLG36p8Cfy9CugGfTzOz7sLLgbzQdeNv4q2BsaY0PNGy8g34DFxoDRJMPj+ZXs/RGdXVTYupfbTwPGqe8z7dp1dR2dAJljEQh/Qb8QfTIbx0RcV4n1ai1z9l0tE7PH0MCphSFQx+wArWmyNBDg5YWi5oAnDAn436m1s68qxk/7PSKJNQmQHoGhhyZLAZwXulbW6T22oCHACONlfWcTeOgwE8AGxXYG1dzxd3I+xx/c6thPKe8zWH6Qj+g8PdDyv6CbXgpQ92pdxmhU451DTgmv7qTAKyVUNnfayCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd9QB5lzWMBZ1VgTQ5+q2PJBBmv5y7AsXuUzLMlP1kw=;
 b=Mq7/hqsMGTm0/AaKCNDvhgIL7mOWRReeYN4cYm0RhHwjGvdOkR3EwksgrZrktNnmTPSdC8nyh26/pgiYqwdYkEo4OgV4bFbQjfKJg2Cv2wpUyoU9y/HOvkpR00htdbTg5a/OjTCf7rYX6ceWhkrjGyOuQd7FRQCFBOK7eZgqy8PjKKB53UxhXnmOHEbBRb0lbgOGuwIL+FYai5zjgjQF3vjaeJoqdW1yQOG3GwG4+Wk9yBfSHMcmbFStIvbZOOZgKWFqg8nSi3Vpen2j3dC/evQJpwBxVN86FdLjA291bCwQVv8YDIk8KC29WEiT0e3/BoUy78sC+FaoALQrqg4k2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 03:11:25 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 03:11:25 +0000
Message-ID: <a0845635-63dc-4d22-b6eb-c2b7e27fb472@windriver.com>
Date: Mon, 11 Nov 2024 11:12:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH 1/1] openvpn: fix
 CVE-2024-28882
To: openembedded-devel@lists.openembedded.org
References: <180558B19453C728.14586@lists.openembedded.org>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <180558B19453C728.14586@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:3:18::18) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d3e343-d1a3-489e-4b86-08dd01fe8693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkxobllBMDR4bDdCQ1JTelBrOUI4ekFXTGNwOS9RVUpSdUIySnRrWjQ3TkJX?=
 =?utf-8?B?L2FFTFhVWW1mQkpyQSs4cFVQbHlkWmFDV3dtMFhXVnlaeitvdlZ2KzNMR2Jq?=
 =?utf-8?B?NTJjcHF4Y1ZHU3h3TFpUZW9wdXl1THVQR05Oc2dUSFF4NHVsQkY3T0QzcXhY?=
 =?utf-8?B?VkNzeEUydnZCNWQ4NlgzOEptdkVYYXg5Zi9CWk1LRUorVmJDdmdnUEVTLy82?=
 =?utf-8?B?NGt4UUJpQlFsUUxOd3ZKZXFhM2hkajNxNThyWXEzR1FBVjN5cW5scmhncnBx?=
 =?utf-8?B?d1hBa0ZNeE83Wmk0eVZoSUZleExldGc3b09TYithRU5QNFRLQURKYWwwU3U4?=
 =?utf-8?B?SkNVWjNpYTJhRlEwUVlTT2xFMUttN2laWE1va3Q2b2V4ZGp0aTJVYUhlekI1?=
 =?utf-8?B?TWVjVEVHN29rOW9RQUJYUkJvRzh5eHZEYTAzb00wcm8rYjdxa0d0a0FDYmVL?=
 =?utf-8?B?eGtPSVp6Vk83dW1uV3FOdXN5NXlKRUR3dncrS2pYeDFXWk5HZEhJNXlQbS9w?=
 =?utf-8?B?citZU0RjSmNPbjZpOWNEYXdHR1JpS0xiZFExWnAzSFpwanNISU5EOEwzSUVB?=
 =?utf-8?B?STVKdlhxZFZ3WDFGTG5IY0o3ZzBFZHpHZXNzT0FySmd0MVBUdUYwS2xhT2lp?=
 =?utf-8?B?MUhNTkpQVHRKb0o5VWRFWHhBSi8vZUlYWlZuV1pLWVBzVHNqblpCanMxdTZr?=
 =?utf-8?B?S1Q2MTJ0M2VWN3NidWxQclJwaGhoMVhIMHlSSzhXbFNJSzduYlJvMzE3RzVH?=
 =?utf-8?B?SXBuUE1tYVpBQm8ra2dndStJWFFwTjRoMXRQT0hiQ21tdTBGdzNGY2RPVkdP?=
 =?utf-8?B?UXlVbmp4UlBIaDNhZHlndUhLL1RXWTVURCtWTFVwVWFCbisxS0U2MzVQS1BF?=
 =?utf-8?B?eGJHQzdxcjdJdk9VSDg3eGRnMDJsRWxhbm1OM2dsUUZaWi9zQUtMZ2VGdlhu?=
 =?utf-8?B?T0k0Tks4Z3U1ZjRkTG5Xa1JRbEtHTlJLZklLejhIYWpialpjOG10VVJDNUll?=
 =?utf-8?B?cFFtVjZndFNsam5iRTBUcTZKdXRZTmxUWEI1VzVhUVY4M2YxMFFJYlVmQ1Bi?=
 =?utf-8?B?MzJJTisxVUFMREEyTFFLQlhjY0FuT0xZNHJoYlcxTERSOTBvTTNvRlh3VjV5?=
 =?utf-8?B?Z2ZLdXQ5cFdPeUFuMjhxOGc2L295TmF5bzFKWlVpaGZ4N1NCS3Q0K2hUZ0t3?=
 =?utf-8?B?UitmSnN1d3VqdzFYVkk0TGZYeEhDT3doL0RrdDFNYnU2N0h1WnQ5RnVPTWdK?=
 =?utf-8?B?dFZJUm5WTWNSdURHRGdOSmlKR01EZWZWeXR4M0lYUENlaXp5VHZTVmpVcStt?=
 =?utf-8?B?M0tzSGVRWlRBa2pOWGxYYkRvNnM3ei8xd2VkUkNmZzBNZ3VHYXNaQjFQV2xs?=
 =?utf-8?B?djdUOWJ4bEk5M3dyU0I4ZmFsNU1TbW43aEFYeVlhaEh5NVJmc0w3N1hKY014?=
 =?utf-8?B?dzlZSHVMQUlCZTBISGRnOU5hT1pvcmkxWVgyR1ZuMWI0YjJwbUFoSFcrVm1X?=
 =?utf-8?B?bFFZdWsrdUxIVHZyVlhLQ2ZxdFM5UGRSRjRCMjk3Qk1tZjBneDc1UVk1MEhy?=
 =?utf-8?B?Z2hZL0JEdCthUTdkS2lLS3ZwZzdFaFpGS1VHQnFHNXhZNThwY0wySlpDdDl2?=
 =?utf-8?B?aTVCb0dkN0lzbjE1MHMwOEx1UWpvVVI2c0MvOW5KZFM0M2VLbXRzMjVCc1Rl?=
 =?utf-8?B?SFkrblNZN0ZBYmc3YWZQcG5CWm5mL0pvVi9ZZU9hVjFISUtIbkk4RWxRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEowSSt3WjI2RWZva2ZqWmNsMXNoQUJHaVVrUmZpVHhrOGdvREtpNkxleVR1?=
 =?utf-8?B?bXhLQWJSU3NJSDFvU1hWNFdBRnNuSXRIZXhLSnVQd0s3R1ROd2IxemlRNkZ2?=
 =?utf-8?B?V3VrRGRtK2h3VHJ5a0YyVjlWNDNFV3FWUFlRY1A3UVhML1JmUk5xK3krcGNN?=
 =?utf-8?B?RFI5a05rWDYrYUpYeWpVOWJLdDkrQVl3R2QwYk11OHpLRFE2dmlBRUlZMWdr?=
 =?utf-8?B?elJ5MnBIbEVSVFRKMTVCZnpubXVqVnVkaGYyMTU2ZWdXZ1RLNkNWUjN5NHRV?=
 =?utf-8?B?aXUwYWIxVFNBc1JHdmxEMWF3QTNzM3RvZkNGdnlaM0RPNDNUTktmVTE2QW9I?=
 =?utf-8?B?OVdxZW1MbjhEaFhtYll1dXNHQ2w3TXE3TVdqSlZjYTk0RDlRR3YrN21GbE9G?=
 =?utf-8?B?TTNDZjdBdHl5djJQc052YjRoZzlRdmV0TDlTM3RhMlZkOXBtSUNqRHA3ZjhP?=
 =?utf-8?B?QlJob0hNNTY0U1VuU2cwdHhYSWxqeTZabHZQdWlOaW1VNVdRQTl6aGFqMkIz?=
 =?utf-8?B?KzVudWdEbHhudUV2UWhCdlZNQUVJRnp3cmJ1QWdMQmFZZFFPOEVIL0d5ZWFm?=
 =?utf-8?B?OGtiN1VJdjlyYnArWW1pM2FoT2RtK2pKbm8rcFBTMkh0T1IrNVNFR1pLQ0E4?=
 =?utf-8?B?TWs3aCtiVFgxVEFKSUcwL2xUdmNlZktjWSs0Z2lPckJXZDhZTjEzQmFJRXJz?=
 =?utf-8?B?dDN4cDlEdGg4TG1aK3M3b2daZXJ4eFRvRDFaNmJrd3BtV1hMWGJ6aFB0WmJT?=
 =?utf-8?B?N3JDMnR1WUN0RlppNjdiMnVuNWxSWUYzS2RGUmozSnVrbzdOK0FiMy9tOUJF?=
 =?utf-8?B?UEdaSmRSRU9Qd29kRStxUUQ4M2xTWVQ2NGc3K3diS2laVFNwRFl3SlkxYUox?=
 =?utf-8?B?NkJFSmZva09BUk9aRi8ySlpWK0hwU1R1WWpoa1M3cmhuWk5FQ1hvOGV4ME1o?=
 =?utf-8?B?TGVTRlhpb1VIeE04R0syZEd1ZHI4MktLbXlpdnoxMU9ncUZlcUFkSmNiMEg3?=
 =?utf-8?B?UWwxalZWdEhDYm9JUk5ZVnQ3dDFyN2ZxTHVjclpFWGlXdkR2UE0wQUFyY05n?=
 =?utf-8?B?eTM2Zy9pdC9TZFpvRW5iRmlOb3BFRnVySDZxZDFnTW5tanBhRjVWYnQyVkpM?=
 =?utf-8?B?Rkthajg1Q2gvdk9NM3Ftb2Z2S2pSZnRGQk9rTGtSRGplNFcxWGNIYXFNOWZ2?=
 =?utf-8?B?RE5lSGlVeCtTR3lrYWdGZEVSSHdpL1NvamIvN0ppTjgyWXNqeWpxTnhKVTFU?=
 =?utf-8?B?NittQldhZTlaR1c0dXAwR3lMZUp6Zkd4TTI5b3o1TFVuMG05b0hwa3U3YkFv?=
 =?utf-8?B?USt2UWJ5U2h4K2tycjdGUVh6cFdJbCtSQXZ0NzhhVEFwMldzM0FqeVBsbHNm?=
 =?utf-8?B?aG83T1pZZmF0SU8rN1hrYVE2QnB2M0tQTE9rcWxWemJEM3Nqby9jdENQTzM4?=
 =?utf-8?B?Y1c3V0VCQ2NaOEY5OUNaS1prS0hCMElSL2NNNWhnWUV0RFFHMG5PRTJiWkF2?=
 =?utf-8?B?b1VCZFBLL3BLRElEeDZMdXNVT3dJdFNNMURMWUR2azU3bkZlSzFIQ25EMEdw?=
 =?utf-8?B?bVFhaEo4aVNQdCtIbmdkWTE1Tzc4QUYyNHltSi9rc3RTVEEvWGRzOFE2dWZE?=
 =?utf-8?B?NDZmWklrRDd2ODZRM3RPL3NLSXgwRDg3ZTM5OVUyak8yNVZTMWdEcTFQOEpD?=
 =?utf-8?B?bGVWZzBnR3p6alBzR2Y1QncyOEZFMVpLS0dRSEpkMGZHNURBMFlyR3lOZ3FM?=
 =?utf-8?B?VUFTNlBEeWtDQ0N1dkRaSkhhZktiZmROUlRjUUN1OXdhNTZCRnZWbmZPWDJN?=
 =?utf-8?B?ZUxUVmRmTHFpTnJ4dEc3UkRoNVFqOE5YdllaSFVSaTNUSVlIRDZjbWFJdjF4?=
 =?utf-8?B?SFpWczhBTWVPN21vZ2F1dzFUZDFCUGwxNGtXdFEzdHhnNFhoZUgwT2p4ZzVo?=
 =?utf-8?B?eHVpbXYvOTdyZWZrWnJGZnpZNjl3MGM1bFAvVXVZMlozamx6MkZjK1JLWU9G?=
 =?utf-8?B?Zm4wNUZGWUhxU2tqenZZaUMxY2VlR0VGREY0d1VvTFhqNkl5cmc2bDJuV1pu?=
 =?utf-8?B?UmhRMkQwNDlpbE9KOHIzVU1oWkNrbXEyN0lRUTlwcmNNRXQwQmxFZXBjL0tu?=
 =?utf-8?B?K0RNekdTV0h1SGVHbHQxS0tuMHBRR0ZvcENPSHlFaTB0Tmd2eDZQeWdvWk96?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d3e343-d1a3-489e-4b86-08dd01fe8693
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 03:11:24.8672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: at3g+YLwPmKsPDyJ102w5bEXjv3jz5v+R3PojQUz7iD1Kz0EHKCXtlQi+U5ZJGVrGkbV56E3DXM5s/wffBscrpC0VnVasekhXll6EJTwWSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=673175e2 cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=uDo-SIiEAAAA:8 a=xeC3QtFAAAAA:8 a=Vt2AcnKqAAAA:8 a=FP58Ms26AAAA:8 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=lERSdLz2SXkv3DiaHMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Rkhf4GTZPwEC63LfVcCP:22 a=9XEOD9pWidfRTSXZEhnp:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=gPpeecpFUKP6j8iU7U-x:22
X-Proofpoint-ORIG-GUID: jxDS1rYHirLOVxlk0RVjlWIvlPNqoVlL
X-Proofpoint-GUID: jxDS1rYHirLOVxlk0RVjlWIvlPNqoVlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_02,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411110025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AB1si07030290
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 03:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113781

Please ignore this patch, the CVE will be fixed by upgrading openvpn to=20
2.6.12.

Thanks,

Haixiao

On 2024/11/6 17:58, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> CVE-2024-28882: OpenVPN in a server role accepts multiple exit
> notifications from authenticated clients which will extend the
> validity of a closing session
>
> References:
> https://community.openvpn.net/openvpn/wiki/CVE-2024-28882
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>   .../openvpn/openvpn/CVE-2024-28882.patch      | 144 +++++++++++++++++=
+
>   .../recipes-support/openvpn/openvpn_2.6.10.bb |   1 +
>   2 files changed, 145 insertions(+)
>   create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2024-28882.patch
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-2=
8882.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-288=
82.patch
> new file mode 100644
> index 000000000000..0b016c89e2f7
> --- /dev/null
> +++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-28882.pa=
tch
> @@ -0,0 +1,144 @@
> +From 6b0859f669729f4fd328d80bc5c7b4dbbdbf0280 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Reynir=3D20Bj=3DC3=3DB6rnsson?=3D <reynir@reynir.dk>
> +Date: Thu, 16 May 2024 13:58:08 +0200
> +Subject: [PATCH] Only schedule_exit() once
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +If an exit has already been scheduled we should not schedule it again.
> +Otherwise, the exit signal is never emitted if the peer reschedules th=
e
> +exit before the timeout occurs.
> +
> +schedule_exit() now only takes the context as argument. The signal is
> +hard coded to SIGTERM, and the interval is read directly from the
> +context options.
> +
> +Furthermore, schedule_exit() now returns a bool signifying whether an
> +exit was scheduled; false if exit is already scheduled. The call sites
> +are updated accordingly. A notable difference is that management is on=
ly
> +notified *once* when an exit is scheduled - we no longer notify
> +management on redundant exit.
> +
> +This patch was assigned a CVE number after already reviewed and ACKed,
> +because it was discovered that a misbehaving client can use the (now
> +fixed) server behaviour to avoid being disconnected by means of a
> +managment interface "client-kill" command - the security issue here is
> +"client can circumvent security policy set by management interface".
> +
> +This only affects previously authenticated clients, and only managemen=
t
> +client-kill, so normal renegotion / AUTH_FAIL ("your session ends") is=
 not
> +affected.
> +
> +CVE: 2024-28882
> +
> +Change-Id: I9457f005f4ba970502e6b667d9dc4299a588d661
> +Signed-off-by: Reynir Bj=C3=B6rnsson <reynir@reynir.dk>
> +Acked-by: Arne Schwabe <arne-openvpn@rfc2549.org>
> +Message-Id: <20240516120434.23499-1-gert@greenie.muc.de>
> +URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/=
msg28679.html
> +Signed-off-by: Gert Doering <gert@greenie.muc.de>
> +
> +CVE: CVE-2024-28882
> +Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/5=
5bb3260c12bae33b6a8eac73cbb6972f8517411]
> +
> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +---
> + src/openvpn/forward.c | 15 +++++++++++----
> + src/openvpn/forward.h |  2 +-
> + src/openvpn/push.c    | 12 +++++++-----
> + 3 files changed, 19 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/openvpn/forward.c b/src/openvpn/forward.c
> +index e9811b9c81de..29e812ffd17d 100644
> +--- a/src/openvpn/forward.c
> ++++ b/src/openvpn/forward.c
> +@@ -514,17 +514,24 @@ check_server_poll_timeout(struct context *c)
> + }
> +
> + /*
> +- * Schedule a signal n_seconds from now.
> ++ * Schedule a SIGTERM signal c->options.scheduled_exit_interval secon=
ds from now.
> +  */
> +-void
> +-schedule_exit(struct context *c, const int n_seconds, const int signa=
l)
> ++bool
> ++schedule_exit(struct context *c)
> + {
> ++    const int n_seconds =3D c->options.scheduled_exit_interval;
> ++    /* don't reschedule if already scheduled. */
> ++    if (event_timeout_defined(&c->c2.scheduled_exit))
> ++    {
> ++        return false;
> ++    }
> +     tls_set_single_session(c->c2.tls_multi);
> +     update_time();
> +     reset_coarse_timers(c);
> +     event_timeout_init(&c->c2.scheduled_exit, n_seconds, now);
> +-    c->c2.scheduled_exit_signal =3D signal;
> ++    c->c2.scheduled_exit_signal =3D SIGTERM;
> +     msg(D_SCHED_EXIT, "Delayed exit in %d seconds", n_seconds);
> ++    return true;
> + }
> +
> + /*
> +diff --git a/src/openvpn/forward.h b/src/openvpn/forward.h
> +index 060fc374ca60..245a80292112 100644
> +--- a/src/openvpn/forward.h
> ++++ b/src/openvpn/forward.h
> +@@ -302,7 +302,7 @@ void reschedule_multi_process(struct context *c);
> +
> + void process_ip_header(struct context *c, unsigned int flags, struct =
buffer *buf);
> +
> +-void schedule_exit(struct context *c, const int n_seconds, const int =
signal);
> ++bool schedule_exit(struct context *c);
> +
> + static inline struct link_socket_info *
> + get_link_socket_info(struct context *c)
> +diff --git a/src/openvpn/push.c b/src/openvpn/push.c
> +index 1b406b9c5311..d220eeb97442 100644
> +--- a/src/openvpn/push.c
> ++++ b/src/openvpn/push.c
> +@@ -204,7 +204,11 @@ receive_exit_message(struct context *c)
> +      * */
> +     if (c->options.mode =3D=3D MODE_SERVER)
> +     {
> +-        schedule_exit(c, c->options.scheduled_exit_interval, SIGTERM)=
;
> ++        if (!schedule_exit(c))
> ++        {
> ++            /* Return early when we don't need to notify management *=
/
> ++            return;
> ++        }
> +     }
> +     else
> +     {
> +@@ -391,7 +395,7 @@ __attribute__ ((format(__printf__, 4, 5)))
> + void
> + send_auth_failed(struct context *c, const char *client_reason)
> + {
> +-    if (event_timeout_defined(&c->c2.scheduled_exit))
> ++    if (!schedule_exit(c))
> +     {
> +         msg(D_TLS_DEBUG, "exit already scheduled for context");
> +         return;
> +@@ -401,8 +405,6 @@ send_auth_failed(struct context *c, const char *cl=
ient_reason)
> +     static const char auth_failed[] =3D "AUTH_FAILED";
> +     size_t len;
> +
> +-    schedule_exit(c, c->options.scheduled_exit_interval, SIGTERM);
> +-
> +     len =3D (client_reason ? strlen(client_reason)+1 : 0) + sizeof(au=
th_failed);
> +     if (len > PUSH_BUNDLE_SIZE)
> +     {
> +@@ -492,7 +494,7 @@ send_auth_pending_messages(struct tls_multi *tls_m=
ulti,
> + void
> + send_restart(struct context *c, const char *kill_msg)
> + {
> +-    schedule_exit(c, c->options.scheduled_exit_interval, SIGTERM);
> ++    schedule_exit(c);
> +     send_control_channel_string(c, kill_msg ? kill_msg : "RESTART", D=
_PUSH);
> + }
> +
> +--
> +2.34.1
> +
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb =
b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
> index f8de78ff74fd..9b551d3ca27e 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
> @@ -10,6 +10,7 @@ inherit autotools systemd update-rc.d pkgconfig
>   SRC_URI =3D "http://swupdate.openvpn.org/community/releases/${BP}.tar=
.gz \
>              file://0001-configure.ac-eliminate-build-path-from-openvpn=
-versi.patch \
>              file://openvpn \
> +           file://CVE-2024-28882.patch \
>             "
>  =20
>   UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113734): https://lists.openembedded.org/g/openembed=
ded-devel/message/113734
> Mute This Topic: https://lists.openembedded.org/mt/109422236/8599992
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Haixiao.Yan.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


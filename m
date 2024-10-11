Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD49ACFC60F
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:38:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6276.1728632279554903394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B5U13r007960
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:37:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sffg8vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:37:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRBRuR0i3/RYggf90GTT1uMUzpIhgN0QE6ba4vsLYVPFpRJF/fEbYeQtwyGnyBrVnYWEkfd7B46+X5e66naTawhdXp6L4KVCze19ZnnePasWgiABWT0OoQpFJ9kHsnSZemZT8pRn2y5rXUPXpJia0N6F7vA9HmVjwLA1mSiRjQ/KNceoGKSan4ts3z9tUF5WY7GQtqKaBjPAEIrMYoBc5kANcY/70YJRNWWf6ZQFPgGke5mXFCCRqv+PpmylK1rJ3u8Ti/jJsbUOaD/QWRIp0dvWHV+BtIlfWTqRyH4suhHS0BUEY4QoWX3RtUddjjBeDh3h6oeIBypup89nUQLxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzjP3IHIPQbH8C/9O0QTorACHu2OcdRF6LASW/SHU+w=;
 b=Mr1uvocv1iQVqmwdHxT8cQvVEhhik4L2PZfaEDQ9C2anDJ8fa6yXalfmgvmB3Gv9JW/QgB2Xm/iKY2Vy6Zg7urcuMVy2hGZWg53dnVIlfEuGA6Eyg0kubc6XtpfYXo+3CJtRp9k1spzgDOyJ0WsSbwXDRcGuJJ6lKRO2+UGo8anEP9q7XBGEk+msmb2DtwreXTl6fWXi5qFspG+DVtplDyOD4c59eZ86yb+yq162LBxZxx/faluRri/gGSZL6GE2vNvskv2z5fOqnim005GkeHtYQpnPBRBt56JKKpUGLpXmFm0g21rA7pZ5KCrdGAPaJSYKW5KP3KVNxxjMjrlSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 07:37:56 +0000
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83]) by SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 07:37:56 +0000
Message-ID: <91f9915c-72b9-4ee4-ab6a-49437eca811b@windriver.com>
Date: Fri, 11 Oct 2024 15:37:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] sound-theme-freedesktop: Update SRC_URI
To: openembedded-devel@lists.openembedded.org
References: <17FD540B250CEEB1.2207@lists.openembedded.org>
Content-Language: en-US
From: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>
In-Reply-To: <17FD540B250CEEB1.2207@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:404:f6::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8421:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: bf113491-2b36-4b57-5065-08dce9c798b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WkM1UmFWYkxDNnMrTHM0Uit0YUx1eUIzSXR0SmF6RU1iYXFTREowTktSUVls?=
 =?utf-8?B?YS9MVlpJQVhCdzBkYVBjblFseTR5OVRlRkpUNE02QkRHZDQ1T3M0SXVaNE82?=
 =?utf-8?B?dDBTcHV0Wi83dVgwRXZCMEhGc0puU25rSituLzduWGxPSG4xa3ptSzdnbXBG?=
 =?utf-8?B?TG51bDMrZEZSWlFHVFkvOGpBRGJucklxa010VFArYmRQczN3WmRsMTBldVZ1?=
 =?utf-8?B?T2QrWUFHWURwRTBMbDhhLzRhcHVYeDU2UTMwTkh6VlBpdmFRb09uTlBRaW9Z?=
 =?utf-8?B?bk5jVjY4NTRJYmJCWjZySEtKeURHaEZDM05DOWpVTGlwYmVaQnFaMVBvM1p2?=
 =?utf-8?B?K3RTRWxiL1ZBYkVzUXJab0g3SnhtRTlPa1hqRVFLWEdPOHRCdTY3Q2RQTEkz?=
 =?utf-8?B?N0ZPSmtZZXlhTEVVYTF6NFkvS2FJYS9XTVkxU0wxR1dJZkZtUDcwMW5wODly?=
 =?utf-8?B?RzRZRy9ZNktxV1FodWNEYVBwcGtwb3BnczB2UFZDelkyaWFvWU8wTFBaZFc2?=
 =?utf-8?B?eHJpV3BGbFpLcytXcURRUGFsNzdTQTloK0YraFBBd29ML2EwT3A5U05mK1dn?=
 =?utf-8?B?U05IODROcjhBSnhUbW9ZdURTMHMvUHZPUmpCb3c0dDE4Vkt2WUs0Z2V2Mnox?=
 =?utf-8?B?VkRZUkZLQm9GM0ZobGJXazV3MVp4S3pwZWtzYzBuM2Y3SFNpZ0N0NjFJYVNy?=
 =?utf-8?B?ZzRkS2F6bFcyYjlkaDFmcTl0UFVkVUlKSGpuMnM4NjFxaDBKWWRzRGIyOTdM?=
 =?utf-8?B?QWxFeXNTZ1NRMnNoM2h1UElSaDZraGhDMy9FUnFVQi81aEtrV3Jpd1hPMmlQ?=
 =?utf-8?B?WFdLbFduYkw1T09aSitVYU1YWkJpbDlxQy91RGlUY1VsM3BGNWpRc0JERmQ0?=
 =?utf-8?B?Q3dMZHVKdkZHMmlNWjFuOHhPY3RBdmh1VGZpVEk3Y2pQdTMxb0c1WEtMWkNK?=
 =?utf-8?B?TW5GTjBmYmVUaUxGTXlhaHpPbTFJdXFOZEExUTIvUTVmaFF2OUxsQ1ZKRm0v?=
 =?utf-8?B?S2M4TjdXd2pZVHZPVFR6K2RLbllDdjVPTWIxUnc0dXZVejBBUW0vVEpwNTg2?=
 =?utf-8?B?dXB0aStIRmd6NTcvckFSTXdaOXZnVDZmTjkxVGR0a015S2RVNDE1V2ZuNUQw?=
 =?utf-8?B?STB5YTBEYWNCb21qUERPbHVmOXJPdEpsNVZRUkNNODZXZTNuSHVqSnFnTmtt?=
 =?utf-8?B?dWpROWNPUHdiTkd0MThhaUFWcDFNWi9nWTdnelB2T29jSmFCWHVQR2svV2J5?=
 =?utf-8?B?VXFwUWdFdHhydkp4em92dTdiM3ZhdW5BdThkTkxkRC9sSzVHWHM1SWY1dXRH?=
 =?utf-8?B?eHErZk5UY2RwdzBKSFY1eDVpc2o4cCttd09LNkZpalFvNkhPMHZDS1BRaEtS?=
 =?utf-8?B?RnhOd2ZURVhGbUg2anEyY2lxMUZEeWpwcktxNHgwN2dXQVJTcTdSbFdUUzA2?=
 =?utf-8?B?c2FDbTNSOGJNMWpUWWMxaCs2N1YwYU1zUHVJYnExQ09NY0UxM09FT3BIQ3NT?=
 =?utf-8?B?Y3RBVXAwV3dpUzZWTTdxOTRQenU3c2FVWjZPS1J1VmYxUXROcVEyV2lVTG5O?=
 =?utf-8?B?UVlCR3BPdDA2THhNUW5heFRRVktJTmZSUVBlaGlyanJCdkQrTDVZd0pnMmx5?=
 =?utf-8?B?ZU8zakZkQlV0Um1LUnN2NmhJUlpwa2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8421.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFdvd2lRTHl5bjIvbkVic2tjd2tEcUtEVkY4RTRsODFRQmlzT2lmRW1vaDM0?=
 =?utf-8?B?S2Z6RjE2SS9qczFiQUZhbndhYkI3ZW9nQ2JwQ1VNblFKSEFzYVdLUThMcVBJ?=
 =?utf-8?B?dGlOcSszdUhpZEprQU5INlYvanlhaUs0SVIxVDFVdTRUblRqTThQRkpia1pr?=
 =?utf-8?B?TFhMMmJjWVJzV0l1eDNCTlcwTTN2QWJETWl0czBzdWlzTHY0NE0wOUszaGxY?=
 =?utf-8?B?NW5KZjY0K21aMHU5RWdFYUp1Sk9VOWNXQ0t4bGJCSG9oQ1p6OFY0R0JpY2xh?=
 =?utf-8?B?VUlocVVBb1cvSGRiTTBLSlNaeElqd2MwR2NyYkppSk5SdHFhenJlMWhDb2dq?=
 =?utf-8?B?bTRFZnhlOGRtVUJWVWtZQWgvSkdtaTRDdUIvazZwRk50WUdIZ1FTUDdLV01B?=
 =?utf-8?B?MnFaSCtIdTE0T29mMitjclBCL2ltK1N4TDNQZ0NCbmNLaVAyZTlTeWVjeTNw?=
 =?utf-8?B?czhVWnk0cHdBTmFYNjJIM3ExZnNmdkh5V1ZaL3c1SjFUeFZZS283ajNwaFR3?=
 =?utf-8?B?cFFOb1ZpdTcyaVk1Y3VqSVdOQ2xjRFNWa3FmWGR0NjdNVzdGd0pKQXVZV1FD?=
 =?utf-8?B?UGVxYWV3MStXeVVKb3NOM0xPZ2NEVml6L3FoVXI2SXMxcGpQdFpHT3FkV0J1?=
 =?utf-8?B?SnpqNVl2WTNvNG9PWDNZeWdza0F0M2RVVDBPUnVkRmFuSlNMdGx5RXBnVTdY?=
 =?utf-8?B?UHBCbWgyUlA0K0ZSQUc3bFZDNzFXdjNZTlErcWNGdzFMeFlVSnAvOVhqUTJo?=
 =?utf-8?B?Yzg5N1BZT3pIMER0bkJINUpMRUhJUWRIa3plQnFxenNKMXcycVNuOXRTNWF6?=
 =?utf-8?B?NHBXWmdVaXlsTHVTbDRqaGNSZ080ZUhuQkpCbVJsb0hIcGc4NUhZekFEWlRD?=
 =?utf-8?B?T3FCTWFFK0pWSVhvRTNuYU1UclFvZWFmZzVxNnpnNjBUL3J1OVQvcnRnNE1V?=
 =?utf-8?B?aGV0SWpPSXhzSDNZbERyKzY4TmNvRTJrN0s4K2V6amNyWXlaR1BzeWV4MU1D?=
 =?utf-8?B?Z3NZbFgwYkc4Tk45djN3bGEwUUtPTThGUjZuUVhncUt6TUEyUllsWmpGeTVH?=
 =?utf-8?B?RjVUaDN1cUN1N092UCthQU5TUk1RRENDUGQwZzN4ZkJsb2ZaaGpIaFFLcTVz?=
 =?utf-8?B?dFF0Z2ZqNVdBckZBeWQxaEFPbFFhK3FoL0dTNzRsVGxCbVJTWTdGcUFkWmIw?=
 =?utf-8?B?K09PRWl4UitPMHBDNXNadDBSakhTa3J3SDNWSmR0dFk3Y1luNUFxZnJaSmhF?=
 =?utf-8?B?WmkvTzh4ZXYyVjc4dlpKNXJJRFNKMkl3c2xHZmx1eHVmeXB1V1pFQ01GYnFk?=
 =?utf-8?B?clhmQllGTkpXZ1F5MXVNVUE0c1lFZGNmN2VZR2dSOUpUK1plbUp6S0cyUlEv?=
 =?utf-8?B?b2xNeEQ1eHZTL0R1cy9GcHRKRTVVV0E3WHM2MnhSTUNGVzhkY3lFVlZSdnZt?=
 =?utf-8?B?SHZGUXlMYU13RGZ6WStValB0N011dVNkaW1BanBxT1l4dUNtZklFWTZMc2FB?=
 =?utf-8?B?UDB6OTNkWG53VUM5UW84bkoxb2dnZXdKSVpyTE11amJkaEJKU1dlalh4aGdR?=
 =?utf-8?B?M3NpaVkydEJ1ak5rOTRXMnFqbGNTekdmeHZ6bWgxWHNmQWhVTzloeCs2c2VK?=
 =?utf-8?B?eHpSbjFvK2pEd1FIMStOa0hURHVRZ09nUkdXRkF0WUx1OXpYVm9qdE1lUkRJ?=
 =?utf-8?B?dzBpcjRhRjhIdENFNng0T1V2b2ZTajM4TVMzejBjbE04bWQzdDRCb0I5a3dF?=
 =?utf-8?B?VVM0R2JRKzhoOHlzb2pTSE5YaVowUSs3YXBLMGpuTXM4NEpmL3Rrd1BKaWFY?=
 =?utf-8?B?UUllMWVGclFSMEpJdEZwMERRLzcxeVNXY2pDQUhTTmcycUFxTllZa0h0TjZV?=
 =?utf-8?B?bGlIYytaUXlYVzdFd1pnRG42Q2lIVzVUa2o5ay9FWDdNZ3dhQmpqUktnOGRI?=
 =?utf-8?B?bG5Dd3pMMWdGRmZzd0pmVjZ3NTFBRlhoYjMxTUxmMkFGT1hSZXJSWTR0Skcv?=
 =?utf-8?B?eXdiQ1hDVFUwblhrTk1PS2ovWXNmMG9WM2Z4dTllNkVPR21MNEVTMzdML09z?=
 =?utf-8?B?bWxjL0VkeENKaEdyMzg2V0NtUWh4OGY4aGxuU3JGa2Z6RCt0V2k1ZmFDWmR0?=
 =?utf-8?B?WkxaT2c5OGRpdFdCRC9LbnNDbyt1eW5EVUltcDRPUUU4YkFKYVdSS05USmVY?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf113491-2b36-4b57-5065-08dce9c798b5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 07:37:56.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5gOkxNXvmahOynKqZXDBGNPmc0+eJaFd9eNU8rIQeIAxmQ7teZcCUNdxBH8OHjJ7f5CnYM8vFhT9wQ2qJdFeCIdp6FAQ75pB9Eb5YX47Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Proofpoint-GUID: 1YXn10VC_wO9bzEZcPnYSGYdXm8itLnH
X-Authority-Analysis: v=2.4 cv=IrZMc6/g c=1 sm=1 tr=0 ts=6708d5d6 cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=e5mUnYsNAAAA:8 a=jCgEMyhgnf_8X-jZFn4A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1YXn10VC_wO9bzEZcPnYSGYdXm8itLnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_05,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=770
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410110050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112787

Sorry. Please ignore this mail. I'll send it again with correct patch 
subject format.

On 10/11/2024 3:01 PM, Zhang, Liyin (CN) via lists.openembedded.org wrote:
> From: Liyin Zhang <liyin.zhang.cn@windriver.com>
>
> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
> ---
>   .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
> index 87320a98e..508519e4f 100644
> --- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
> +++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
> @@ -11,6 +11,6 @@ inherit autotools gettext
>   
>   DEPENDS += "glib-2.0-native"
>   
> -SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
> +SRC_URI = "https://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
>   SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
>   SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112783): https://lists.openembedded.org/g/openembedded-devel/message/112783
> Mute This Topic: https://lists.openembedded.org/mt/108944571/8826801
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Liyin.Zhang.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


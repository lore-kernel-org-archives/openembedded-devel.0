Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCFBC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 03:37:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4734.1715830641812071979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 20:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=58661a8ff2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G21Y5u012772
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 20:37:21 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y286fuvxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 20:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY3FHFkklL/bZvQVTT1eySq8eer7+JLh9sOqZiL3jmjgJ+5EH/IFB/RYrAkKvd51TqkYzJBeFp6B5Z/n6fKH9XvS81dXSx0VUgnP/YYluC0we8HD0xogNHX8rtx3vyaB+gWqajFJCdEduOXNNnE+5Yk69E0q9071mBL6w/nfubLql6KFuCyE4sYP0F35ADYagJrLJ6YFGEVg1WqQBtVb5UmGONhyQigfDzFqScwLBmE5SO8xcFxU2dwC8mggwSxks37Pl27Aol7iswTE4dFfTvoJGXxinf6KCpPlUfObRbWa0pRhRBcmfcja5hf7TRTMVuYKAeNMhgl1Vkp19oS4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ensZTWSzCdrOn386T+8NA53FV6nu56YUZ4rgQZSBCSA=;
 b=MbmTEsUovRvwhVIZiuQTrrgzE/gQ2rsFUBq4iOMsaxNwyZzbPJx+Fyl/GryHug8uFORr8aXfSvZeeoFxZzQBBanEuBRIm2IgStyOBUKY43tKWkVvR1HOS4eIXZ9Ef+7WW80CPHzis5VGDAanZTdG1V7EV52heepLjfaoFN5DNdrIHwFCQS/+7LnjOpb7a0IgOQwpgt4QrTQIKMh1SDz6VO5DK1dtF36+wg071oALRL5MFhQTsyEcgcUw7RvC1chFIDgplC86sqYE0DNm5oGnWFhwpxAdTRIxHeUW21pknvZ8o2hMKQKJBpiQSKp1yNhoLkzhCBrXOSo0O9Mh9kK7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 03:37:18 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 03:37:17 +0000
Message-ID: <87e0969d-bc01-40dd-99d0-4bdfb91a5f07@windriver.com>
Date: Thu, 16 May 2024 11:37:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH] python3-pyyaml-include: Drop
 pytest --automake
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <CA+chaQe=-D2t+T9j9=cppJLJZufhKuTiUuqDH0eC6+aCsbdt-w@mail.gmail.com>
 <17CB02D3AC5ADA82.26557@lists.openembedded.org>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17CB02D3AC5ADA82.26557@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: f10b859a-c0f6-4e53-a870-08dc75597b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0lkdVh5cThGdGVhems2bXVxOWlCMXpTbVg0a24vblpWamFITmtOTllWVVZH?=
 =?utf-8?B?ZG15ek9IaW0xZ2xTckpBUVhzODZGSmxKLzB1SWZ3c1VQQTE2dlQ4NUpoKzZj?=
 =?utf-8?B?bmJGY0JTZURKK3pCbW5Qbmo0S2FxYzBKUlluc21pclgxazdEek1GaEVjYjVw?=
 =?utf-8?B?U2l4SWVNS1FBcmg4MHBkNFF1cTRydFo4VlJYR3l2SmJsemx2TDZjdE85TFZD?=
 =?utf-8?B?YWNycnBxZlpDbER4YUxuUm83VXduNUx5QzRDSkRDWW1wM2s1YzNrZlJ3Vzkv?=
 =?utf-8?B?bVVKMDloNDZ0akVoQjNtQkF3MDBCV1RuZ3ZuYnRxSkpNSnVUT0ZORUJDUER4?=
 =?utf-8?B?NDBFenB4VUMrUWlBMSs1L054ZXEvLzFKczcwVm96bmVQeHh1WWx1QkZsQlBY?=
 =?utf-8?B?MHZzZWY3ZXh5bkFrZlgrRmNMMWRVdW9seWhoVVQrbWNtS1VmckEzOHJrSGtO?=
 =?utf-8?B?Q2RIYnJHS21kdWlaakkwakpkdnFxWlg1K21PbzhzKzJIU0FtUFRhUHdGS29n?=
 =?utf-8?B?SUVRenRwR0wwZ05BRGJyR3Z4WXI1RFgzVGJqSVV4UWdTUUgybmg3RnM5UTMy?=
 =?utf-8?B?VjFINWFTL3R3TmQ2QU9NTnJRUGd5OXlCNy93Z3UvcEI3TXpKWHptWmV5RVAy?=
 =?utf-8?B?UFB6WE5ZQnhTTFpSTWZ4Tk5zL2pFY29zb29oUWFHR2xlL09YK2g5dFA5VDRs?=
 =?utf-8?B?cFFOemxsUHBqR3ZoYU45OXQxTUUwNW5SZXFSV2RxNVpoUmFmTXhYYmtEKyti?=
 =?utf-8?B?OGtWRDg1dE1LZUJTS28vV1dRTEVDT1ZnQkh4d1NhZkFwam9PWUxxaHFhM0tR?=
 =?utf-8?B?WGhkVmpIVzhFdEd5QzdqVjJOT0ZHSmdNUm51ekZhNmtnN2NmaW9tSnpjMDJG?=
 =?utf-8?B?ZFFrSEJ3bzRvNHBTWUl1dG5qNVlZSnQ4c3VBMmhqS3BDU2lEV1VIbHlUaWJU?=
 =?utf-8?B?YUZJWlBPZTc0MDB3ZVdNRVBxQ2RVajZsUW5aSFZXT1BuOEZ3dzU2anZFK25O?=
 =?utf-8?B?TnFxb1JiazYxUEs4WFVSaFNmdVhXcVF4Mm1oNHIyTG9sQUZwSFZjLzJLc0p3?=
 =?utf-8?B?azl5c203Wi9xN0M1OCt0dC93dzJQM0gzZ2diWGphaDMvK2djTUxHYTlGaVFw?=
 =?utf-8?B?WVJ6djk3cDE3U2dUTWVhRjJEaTN6Zk5ERDJVM0VpcVFjcTV0UzBFYW43dmdm?=
 =?utf-8?B?N0s0K3NVdTdJdlBkZ3luY3ByYVN3dmhhYWQvTkdNUW9EK0I1YkhpOTZ0bmtV?=
 =?utf-8?B?ZG1hbTJhR2dYTXJiL3dQZDc2NE4vQTI3clJ0YUZwNEg0cmlQeTZ4NC92RFo2?=
 =?utf-8?B?V0NQYXppcHBDaEVvNDJyNUVuM1ZkODRVZUJHaHY1TnAzQ3Zud05lWU5DUlRQ?=
 =?utf-8?B?bFZNb2s4dG9WUmRFc0FHTTJsV0RONEdXZC91V2IveklldE5pYmFEWG9mNjY4?=
 =?utf-8?B?ZC9aeTRqTGxGWjM4d2VPUlVKSE5qVlpQTFlkcmVRUVN3KzZ1dm9IU0xzTDVY?=
 =?utf-8?B?Um4wQ3QrM1puZEVSMGNqS2hiUHhiOFRIR3loZng0eXI1LzgxWHVmcnlJWDc3?=
 =?utf-8?B?SE5SMEYvaTV1b1JmSHdYRnpvcWppVm9ING5HaTkzTjl4YTg3WXpPOVEwZGNO?=
 =?utf-8?Q?cyIQh8MjqSSI6nfu/ukyx2D4shXT19TlOLVvCftg8cMM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjNLNmRWdFYwenFrNTRocDU0WFQ0OXhsVWVoWTNvQkQ2dThYR2NtMnNRUWR1?=
 =?utf-8?B?NnVYb09zcjNUakREcVhNZ3pNenpmcDJ0Rmk5MkU4TGNxQXBZdHBWUXB0ZHpk?=
 =?utf-8?B?WWpBcnp2R2tSdHU2RTB3cVZ3ZTNXa2YzU3NFeFgvcjVCU1dpSFhlZC96R1NN?=
 =?utf-8?B?NFduanJXcWVPeit1ZXJyeDJrUWZabnNXcHlZdEF1dE1SdVlxb0FWWGEwTzF0?=
 =?utf-8?B?Tjl3akJhbDJUUEI1dlVjc0RGdlkxMnNZaUdYc1hHeHUrZHlQSTlEc3hjZHY2?=
 =?utf-8?B?V3dWVGFaZXpGNVJkR01qajhKb3BjbU94ejh6S1pVOGNuZlhiM05oem42SmFl?=
 =?utf-8?B?elp1UnhmcFYvSlBvQnlDbzdwb1dJd0ErWGR0YkZoTkg2WTAwdVpEdWZIelUz?=
 =?utf-8?B?cEUwM2lxKzN0eS9NOU1HT0pDaW1KaHpXZ05IVDRmL3BleUlZY0poaTZQelZ3?=
 =?utf-8?B?b2ZGMkRuRkRHa2NDVDZSY3IwcWVtamlna3J6R0c0aVhvUy9seEZHNHN1SXFw?=
 =?utf-8?B?dnhEZEd1S1d5VGNDT3Y4bE1BMkw2eVhkMEcxN09oTmN0Nlk4ck9GYTBvM2l3?=
 =?utf-8?B?UW8vSlQrbC8xVG1kT2dlcnN4UDU1VkFOMFVYTEk4VE1pVmFVa0ZxbllKZkhI?=
 =?utf-8?B?cVRVc0ZwdzFPM2VBNzJlcGFyNmZRdGNKa20veFRsMjA3QXFOOE9VWXkxeWhK?=
 =?utf-8?B?YlE0Zm5aOVA1S1A1VWg4VEV6Z21lOXhxOGdtMzhxWWpBeGNpK08wQ1Z6M3dy?=
 =?utf-8?B?cGxpWmY5clRtUEMzbVkzc21wQzlXQ0ZJeXpDU1VMVVFmVkxnVStUQ0F5QjVt?=
 =?utf-8?B?TlpySUxuR09ZbXFyeXEybVNwUmVxbitPRWpFU0hQZnBPQ1g3TVdvUEgrNDNY?=
 =?utf-8?B?ZGlnZWM2TDVCeFlpVEM1MG9SalFYOEtKdG5uMHB0Q05jOTJwa3V4dERCQUpj?=
 =?utf-8?B?UjA1ZkM0YUEwL0lvS0VuWmRydzgwT2IvU1Uzd1dRdERCSjFPRGEvMUVTWDll?=
 =?utf-8?B?K0Fucnk0VDB6OEdlWkxJTWhUcU5vYnJYWFk3OXJtTFVaYm93cWJiYmlneUZ3?=
 =?utf-8?B?aEp5Zm9lb1lqVjlHWDlzOStyMk14aGsvb0tsZEN0aUp6OEFHOHlnQzNKb2lS?=
 =?utf-8?B?UEFqTEU1K0t0enJsZk80RTAxdW1FQ0FHU1JFOGlVQ2lIWUlpS3llZU15b0tW?=
 =?utf-8?B?M1JLTUtqR2RSWjFlUXVJVXJuZHdqNjRuLzA0ZUNiUnlCZzIrOVNtMDhSMncw?=
 =?utf-8?B?dk9xWWpUOUs1cUFjRnNIODBrN0pRcWErVXZXWDlzNGplbXZXL01oM1cwNGt1?=
 =?utf-8?B?UERPcG5iWjdVVWRBT2laVXowWWRVOWZxRUtwZ3ltUnI4Ym85Yk1ZRENPbGRY?=
 =?utf-8?B?Mk1oa0ZRYlV0bW9jOVhibmpoOFB1R2hhN0Ura1VESnowUFprcklla2s4dlMx?=
 =?utf-8?B?OHE1bTJlNU5MdVZpRmVYekw5TkI0VGJ6eU5kVCs1c2FyNE9QU1Y4ZVBEUzlU?=
 =?utf-8?B?SWtVTkgrSWM4akJ3c05YWVQ5RTdOOEppd2l3dVd1TG83OXBFZXkveG1UaERJ?=
 =?utf-8?B?SFdydDI5cFBqbDVlNmhwM29VSmhyYjlxQ0JqeGJDZ0pIYkFKZ081NmlDN01v?=
 =?utf-8?B?MVdpeUNZRnBCL3gwL25VeGZvUFVHSHd3L1F6SC80TDJsZ3QxUDUzMk1CaW4y?=
 =?utf-8?B?VDVFclJnL3ladVRtREJJTmMvN2lvN3ZmR0c1Z0pVYzQzRG4xa1hMaGxNQXk5?=
 =?utf-8?B?RTFHUTQxQ3o0ZUZTSXkyeVlvWHFtM2hGZVlNanpxOE4vM3hWTDFDMzJYSlpi?=
 =?utf-8?B?dEw1VU1vVFRlcEpqR1hwMDVUcXZVQWZGUkp6eUY4WE9TdnZlV2ZhUGhNSmNx?=
 =?utf-8?B?eTllNm5SSGlFWDVnMk8vVXF1K2MzOVo0Q1dMeUNkbTVsWndabEN3cXRsQ2ZY?=
 =?utf-8?B?aUczeENMZUpJNDMycjhTN3ZvTmFQKzdaeU5MZ1Y5M1pBbWhLSnhRVDJHRnNt?=
 =?utf-8?B?bzdQSkNqbUdUVS9vbjMxWEUvYXRpdHF1MUJvY0srWkZDRXZvVGtuVUh3dDE0?=
 =?utf-8?B?L1p3dm00YS9NZVV2QlhnRjlOY0VVOGhmemRnSlluZ1BmbUoyRzVSaUhldUpK?=
 =?utf-8?Q?kwVyU45gIkVp06PSdNS4aMbzU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10b859a-c0f6-4e53-a870-08dc75597b18
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 03:37:17.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IFuK6nyh9JvrvZ5i0nbMJt8lh2Aquv46FZ9Cb65J8aVITpDRgCugoJASTGDS85wwnAS/S+qfk3sr6azGepQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
X-Proofpoint-ORIG-GUID: QaGRovKqOBcoA-pZ3y64Ku2rmj-xHN_E
X-Proofpoint-GUID: QaGRovKqOBcoA-pZ3y64Ku2rmj-xHN_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405160023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 03:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110409

Ping.

Thanks,

On 4/30/24 16:53, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The python3-unittest-automake-output is not supported [1], so drop
> "pytest --automake".
> 
> [1] https://lore.kernel.org/all/20240327072236.2221619-1-mingli.yu@windriver.com/T/#mda91919809cf156aba24f099bef65142067cd318
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../recipes-devtools/python/python3-pyyaml-include/run-ptest    | 2 +-
>   .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb     | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
> index 8d2017d39..3385d6893 100755
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
> @@ -1,3 +1,3 @@
>   #!/bin/sh
>   
> -pytest --automake
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
> index 6768e959f..b60a0f9c8 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
> @@ -24,6 +24,5 @@ RDEPENDS:${PN} += " \
>   "
>   RDEPENDS:${PN}-ptest += " \
>       python3-pytest \
> -    python3-unittest-automake-output \
>   "
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110196): https://lists.openembedded.org/g/openembedded-devel/message/110196
> Mute This Topic: https://lists.openembedded.org/mt/105817400/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


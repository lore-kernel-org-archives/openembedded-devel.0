Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECE9C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 03:41:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52228.1716176483350738229
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 May 2024 20:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58704e0ec2=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K3dLgM013122
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 03:41:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y75rb8q8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 03:41:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT4k+JbEZR9XBcAh2l63ByVdz9f0ZIU7urY5xQgVVZqUysHKXia6ZqHxQJXqtB7ZWviZt2nNHov2uafXemIUJO02avCIHyx2wglXRB3BQw9ywRuO31woPrkT90H3C+qMBxHsQR7UP+2pQuDWrCAK1rLTAyAk7SN0kTp2FGDd4gznSY8EBhqdEqyzaZCd5JK75QeheK1okhfj2twUu9qULOFiv5lLDmiCpVkXvuiu5PzGPwiHBTZDpZDae05QHt/hjPMipWxcn3n5fQj10QHKcmo19dm5/EWiQvCDtnR3+ooe99eE3JBJNOQGUQ/3EP3z5xyRDYjlui96hvf30pVL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qBU/fbfgwXMmAbR3JMuE5DgvQQT2xDLK71weYk5qeM=;
 b=j9T7NtSg43ifpA5ruUQEoLGgTUU639wEKhvjcpIyUjooivJ9xXbTzX4k1PvwmRQRO7+9e7lhkDsqzXm3L54zJX6/44n/tT2/6lumbVDzVcgCu0y2lGbHLEldwLG8VQLyREcSHHKMRIYvvizsjiAaPBLcoqQnDcjkcUYKGf0YPe7Dwuq1gow40KSN51xWGoCZPRKUH/ZHLVmNGNL7dCRs+PqZGK8auO2hcet2wAbjSo9+McsCHbN/ePA6bSorrOr7o3GgrI+xWlbvbPyNVJ+kSj+ND18GaIpqntPIm5iR5yt+R3URWlkQJRQIHBeJk7WiefoZbAMlmRUAI14az4D2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 03:41:18 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%4]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 03:41:17 +0000
Message-ID: <db3964f3-db86-450e-b3bd-9cd6345568ba@windriver.com>
Date: Mon, 20 May 2024 09:08:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/2] mbedtls: upgrade 3.5.2->3.6.0
To: openembedded-devel@lists.openembedded.org
References: <17C9D6408A7D5EC2.16940@lists.openembedded.org>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <17C9D6408A7D5EC2.16940@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:5:335::16) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: d36cd1b5-f1a0-43e3-698c-08dc787eb4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHJkeVRXM1VUQUsyaWdMVk9zblJpQittajdVci9ORmliR29CcWxnMGxQRzg5?=
 =?utf-8?B?clpJMllxL1hKd3hyU2YxdURoanR4dkdialJMOWpzckNOcW5BWllZbUNVMGlD?=
 =?utf-8?B?VnptS0kvUGlSRGZxZ3FUZlV3R2Z2elkvRGlTVjEvbUhCNGdnakJvdjI2MUxj?=
 =?utf-8?B?SzBnOGpJUjF2QU5oQ2JmY0UvL0R2aXFhblZvS3RoK3ljTDN5MGhQWG9nenJp?=
 =?utf-8?B?cnhFNElBaVYxc21TbmlBRzF5azFTc3Y4ZTRjRWh3Mk1VMUYwOVZEV3J4ejB3?=
 =?utf-8?B?Q2U0NnhQRFlHVEJnNzRpMnRzeW9TWUVmWWVaRXpuaTFNcTltdmV4bFVGUGZP?=
 =?utf-8?B?UVM4M01pZkhUcHhMTUlhY0F2UlhrcG92ZlRTWVNERFNhK2tEQm5XQWcwS0N6?=
 =?utf-8?B?ZUt6cFZzNHFyMGN1MDdwNzhCMEIyenFJWmxlUCtpTWNHOE1tTFlmVTg1Z09z?=
 =?utf-8?B?U1Bqa0Vwd3hCbW1iYmtIQXF0M1ovaXZyRHZJcmxVVmVRaUdsL0dIUmx4ZC9X?=
 =?utf-8?B?U3lNcFgxaitZZHQ4b2RXYWM4T051Tkw3Z0hnSUV0c3RCTDI1akR4T3FCMytE?=
 =?utf-8?B?czZRdnM1QnV1bE1pRFNHNE1tVFZjT1ZSV1dGZFpLQ2JobjNhb21pNzVjWnVV?=
 =?utf-8?B?dzhGMkF2ampCZ05DMlAxY1duYjdBYVg1OEQ0V1VEVjBXK2M3SldXLzdRb2ZZ?=
 =?utf-8?B?d0hNcXVza1dxcDN1TTRlMWluZXJHVmEzMGVSRHY5SzZ6SnVsUjhrMmRGcFN5?=
 =?utf-8?B?NVRwanVPMVVJb1h1a2V0amdlemFkWHdiZTFDVjhwbkNDQ1IxVG5XOHVQaWt5?=
 =?utf-8?B?eGVTTnNJdkpoU25BYXFLcmdGTkNodVBqMkxTTFdkYkxXVzJKL2ZNdWRqU0N5?=
 =?utf-8?B?Tmd4akVsQW1ubmVoeUtQT2VoR2k3MmM5MmNzbEkzSW5jakhoK2xFbmhLMVhY?=
 =?utf-8?B?UjhkdTExUjZwSCtQN1BoSXVYcWRtd0R4aDQ0WmZNNFV3Vkp6U2dFUVIyUFZL?=
 =?utf-8?B?R3FCeUxXT3laUitlaDBGbmJFeHpEOW00WEhJVGN5YVZzL3lFd2JOb2RZUm91?=
 =?utf-8?B?OVdjZHYzanMyazhNL1d2R0U0eE8zbXJyOTFhSWFjOU1vZkVPZ2hLUXl1VU52?=
 =?utf-8?B?bW9YYXhXNlBzeWQ1K3ZUZHJWZnRXazhpb1FhcVRVUVdGY01mcDl2WFN3VTk5?=
 =?utf-8?B?ZE9KYzBNSkZQVGpESE5uMlhLNmpiZGFHdFdZMkVWT1hSSlN5SGpwOFNnN3hR?=
 =?utf-8?B?Z2REM2NEMC9jbDVQOEhSSzR6M0dLOGthUlBKMFRqRmZycDd1MlUrTFJwamN6?=
 =?utf-8?B?VE00aElzMFBBZU1YRmtVald3SkhPeU5MVzZLOFFhY2JBbU1wdUQrcUpOTS9B?=
 =?utf-8?B?RHY5WElYOFQvUE9ZYW5mYjAycHNMdVNqVHcvZEduZlk2NnRXNWkvY3lPZFRz?=
 =?utf-8?B?V2xDdXlMWFFTaE10aGI4NWd2MCsrWXZwL3J4bHE4UlhUUll0V2tUNlcrMUdk?=
 =?utf-8?B?bzJ4TGhpaU8vdjB2Ukk5Q1lnOEUzMEdyaGk1T1UwM2VPQU1vREhFMmV3MkJZ?=
 =?utf-8?B?TEJ4dkNvMGhvZktMSlI5M1gwNno5QlBIWVcwNjlSZVNEMGZ3NU4wRGs3b0Nk?=
 =?utf-8?Q?lg4EZZ8l4lcfdEz0DJ9XfsLTD43ufWbTL4aN+fMWBWlY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVJod0xzWFBqOXdFa2ZXUlRiRVhLWlIrVmhPVDZqTEFaSFVwcGdXTnQvWjVz?=
 =?utf-8?B?QUtvLzFpdmhtbzI3R1JVMFd3MDBrTnErcFdQWVNZbW56S1RJWUQ4ZURBbElJ?=
 =?utf-8?B?YVM1bFZQZ28yeXk3WkVsZkhjTHU5TUx6eXNMenFOK2Iyc0c3UmhoYmxoS01m?=
 =?utf-8?B?c0lINjlaYU9wN1Z4akN6NGpaRmRMNmVwVUk4VlFzRnVTdldXd3NQWG16WStx?=
 =?utf-8?B?RjZMWGZOaCtNNXhyZzVrazJqMVF4VTAzbzkzUzdKVzd5RGQ5WjZpREx4ajZy?=
 =?utf-8?B?aWVzY3hEZStGbm9jZjhuVDQ4MFBVSlU2SDhWT09hT2w1VVFYSVphUFlacy8z?=
 =?utf-8?B?dHNBNWpoRVVQdFh6ZFV6V1Z4aEZYWldhU0tsSzQrVW1jN2J3cVJnQmpFYml1?=
 =?utf-8?B?RlpLODRtL0JWa3orMHFRUmowN1R3M3FNRWwvc2x6N29hMHY4T05PbUR2L1FE?=
 =?utf-8?B?dDI3cVBISHY2endLRE9pSE9La1dZTDErYmNUTU55U0V5YmozL1NTNkNqSldD?=
 =?utf-8?B?ZlFrWDJTSk5WK00zRThFclFpY3hTSDI4OTducEtjNmx1WXNHVWFsMmxCRGlT?=
 =?utf-8?B?aXJKSHBpTTdkZHB5VzVwODFKeUpsdlZoS1V2MDllMjZPQ0ZHc0M0Q2dQL0xi?=
 =?utf-8?B?aENiNE9oUVZBaDhpWWdkRXFxcEV6SFVCRGVRbkRRQzdYUVlIMU0rNENUaU14?=
 =?utf-8?B?amZmNnd1WFFkbHV6K1VxM3VWcTBBKy9aSWttSmtFcy9kWDEvM1pBSlZuNWNu?=
 =?utf-8?B?RXNZSDFmTWxmT3B2YmhCdlBPU0ljODBPYk8rV0RWTXNJSkFleHcrdTN3cE8y?=
 =?utf-8?B?YklBTms5MytlU3RraTFWQWlVMkVidjNWbW1LTGFWKzV6VzNxOHBoSks0M01s?=
 =?utf-8?B?bEs2VTBZc1pPN25VeGlBbFlBMkFhcnROQmhqOThLdlE0ZnN3VWdnV1ZIUjN0?=
 =?utf-8?B?b0t4YlJ0WVpGMnZpNUFhY21vRStNS3NCM3YxU0lPaG52SFJrTXB5RHU0bnJ0?=
 =?utf-8?B?dDV3WUtjYUFnTFpLS1lmNjZnbkFzeGYzZU5INm9FbUVVTzA4eHVVUllUeFdn?=
 =?utf-8?B?am0rTUNmY0dobC9UV1Zia1ZmV1VjczM5M1hKMmgwbVg0dnNEeU5heDR6cWlC?=
 =?utf-8?B?TXpsc3B2dDMrOU91RGFoUU9JdXVxb2F2azRMbzJoSFJMemFZREl5VFBBendI?=
 =?utf-8?B?WXRsQ2ZQQ28vUjBPNFh2dmkyOGpYK1ZHTW9wSEIwVmpMdHVYTk9IK2lVNUE5?=
 =?utf-8?B?NG9weXVrc0ZNeGh6K0ZFajFDdmV5eEJCOUkvUGF6NjFYVTdGNXU2dkVtdmlV?=
 =?utf-8?B?ZnJoaWRUL1J2RlEzRWJvUHpJMzF4elFQZkczMjRyNHN6SVdodWJxUlVvY3NV?=
 =?utf-8?B?M0dBWWJCaEVJZzhzekorQkpPUDB5Rk1FYi80WlFad0FNY0R6NUhscml2Z3Vz?=
 =?utf-8?B?NjVuazNMd0EwUVJZdkxqcXVuaWdRNUI0d0JDeTFuNDBJcTlkTVMvaEtwNGlS?=
 =?utf-8?B?Z004V2p3RXRPMlYrcGVUeVRGeDNXV1RTSGdIWkh5MkE5NTlHN2RFbk9FZGNQ?=
 =?utf-8?B?alZrQnJMeE5XRW9RelhMVFR0RnZXcElhVU03TDh5WVV0RUN6alhJWTJsZDBE?=
 =?utf-8?B?SVZQZml0eWNOUmROWkZJZ3owYkI5K0lNSGJvNm1wUjJXc09ZU3pmMEQ4Z211?=
 =?utf-8?B?WHcyS1BXMG1Va1FkSklKOXcwQkl2NEE1SGlONDJsT1IrRmkvZVFwZXh4R2U3?=
 =?utf-8?B?WnhqeG9reUlZR0VtK3JJUW5FbmdrSGxFdjdZbkp5cXg0NlR3WkFkVmlHWGVz?=
 =?utf-8?B?a1RnUDYzczhpcENTWUswakVReUFJUlFLVVJWMHRXRDBhTGtwQS9PQzlWWkJ3?=
 =?utf-8?B?enh4UHhFUjMxMzJhaXVaNFExVGxXUHVrV0JhMm1vYmZMUXZyWEluZThFS1oy?=
 =?utf-8?B?Q0VNNWprRTBMcWoxSEJnak9VVUtKbkhVUzd3SVNWMEpPRHNrRWJtakVsWUxM?=
 =?utf-8?B?K1VoQ3U0VzdhN3cyTEd2WlZLNERpczY5SU9PMzFMemJsU3R0YUx2ZUY0UnBh?=
 =?utf-8?B?eS9XbGxhNDJQUCtTTkQ0aENhU2ZUd0lmcEdPMmdia0F0QXRQUC9yWDZacDRl?=
 =?utf-8?B?MGR4ZUZRcTljVzFNeDlFOHFOTXBqK1FsL2F6a29HTFBBY2hGYWNpUDRLTnJl?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36cd1b5-f1a0-43e3-698c-08dc787eb4fa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 03:41:17.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QSC1LGhZwKU06tN8miodS10jMcP4F6+XcWwJLiuairHHvTFIk+V4+wMKfEssLHXAlTunv4G+Vf4IJU7+YxLyj07KS/52iPWVKsnK7w1cTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-Proofpoint-ORIG-GUID: _dIBjYPkXJKGRSbLFzC-q958o62T5340
X-Proofpoint-GUID: _dIBjYPkXJKGRSbLFzC-q958o62T5340
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_02,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405200029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 03:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110437

Gentle Reminder!!!

On 26-04-2024 18:34, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> Includes security fixes:
> CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs
>
> Release notes:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.0
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   ...t-attributes-for-x86-32-bit-intrinsi.patch | 87 -------------------
>   .../{mbedtls_3.5.2.bb => mbedtls_3.6.0.bb}    | 10 ++-
>   2 files changed, 7 insertions(+), 90 deletions(-)
>   delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.2.bb => mbedtls_3.6.0.bb} (91%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
> deleted file mode 100644
> index 5030fb99f9..0000000000
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From 80d3e73ad0648f558a067a9dbfe3bc80e6b614f8 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Mon, 30 Oct 2023 19:15:56 +0000
> -Subject: [PATCH] AES-NI: use target attributes for x86 32-bit intrinsics
> -
> -This way we build with 32-bit gcc/clang out of the box.
> -We also fallback to assembly for 64-bit clang-cl if needed cpu
> -flags are not provided, instead of throwing an error.
> -
> -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/800f2b7c020678a84abfa9688962b91c36e6693d]
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - library/aesni.c | 20 ++++++++++++++++++++
> - library/aesni.h |  8 +++++---
> - 2 files changed, 25 insertions(+), 3 deletions(-)
> -
> -diff --git a/library/aesni.c b/library/aesni.c
> -index 5f25a8249..481fa3822 100644
> ---- a/library/aesni.c
> -+++ b/library/aesni.c
> -@@ -41,6 +41,17 @@
> - #include <immintrin.h>
> - #endif
> -
> -+#if defined(MBEDTLS_ARCH_IS_X86)
> -+#if defined(MBEDTLS_COMPILER_IS_GCC)
> -+#pragma GCC push_options
> -+#pragma GCC target ("pclmul,sse2,aes")
> -+#define MBEDTLS_POP_TARGET_PRAGMA
> -+#elif defined(__clang__)
> -+#pragma clang attribute push (__attribute__((target("pclmul,sse2,aes"))), apply_to=function)
> -+#define MBEDTLS_POP_TARGET_PRAGMA
> -+#endif
> -+#endif
> -+
> - #if !defined(MBEDTLS_AES_USE_HARDWARE_ONLY)
> - /*
> -  * AES-NI support detection routine
> -@@ -396,6 +407,15 @@ static void aesni_setkey_enc_256(unsigned char *rk_bytes,
> - }
> - #endif /* !MBEDTLS_AES_ONLY_128_BIT_KEY_LENGTH */
> -
> -+#if defined(MBEDTLS_POP_TARGET_PRAGMA)
> -+#if defined(__clang__)
> -+#pragma clang attribute pop
> -+#elif defined(__GNUC__)
> -+#pragma GCC pop_options
> -+#endif
> -+#undef MBEDTLS_POP_TARGET_PRAGMA
> -+#endif
> -+
> - #else /* MBEDTLS_AESNI_HAVE_CODE == 1 */
> -
> - #if defined(__has_feature)
> -diff --git a/library/aesni.h b/library/aesni.h
> -index ba1429029..37ae02c82 100644
> ---- a/library/aesni.h
> -+++ b/library/aesni.h
> -@@ -50,6 +50,10 @@
> - #if defined(__GNUC__) && defined(__AES__) && defined(__PCLMUL__)
> - #define MBEDTLS_AESNI_HAVE_INTRINSICS
> - #endif
> -+/* For 32-bit, we only support intrinsics */
> -+#if defined(MBEDTLS_ARCH_IS_X86) && (defined(__GNUC__) || defined(__clang__))
> -+#define MBEDTLS_AESNI_HAVE_INTRINSICS
> -+#endif
> -
> - /* Choose the implementation of AESNI, if one is available.
> -  *
> -@@ -60,13 +64,11 @@
> - #if defined(MBEDTLS_AESNI_HAVE_INTRINSICS)
> - #define MBEDTLS_AESNI_HAVE_CODE 2 // via intrinsics
> - #elif defined(MBEDTLS_HAVE_ASM) && \
> --    defined(__GNUC__) && defined(MBEDTLS_ARCH_IS_X64)
> -+    (defined(__GNUC__) || defined(__clang__)) && defined(MBEDTLS_ARCH_IS_X64)
> - /* Can we do AESNI with inline assembly?
> -  * (Only implemented with gas syntax, only for 64-bit.)
> -  */
> - #define MBEDTLS_AESNI_HAVE_CODE 1 // via assembly
> --#elif defined(__GNUC__)
> --#   error "Must use `-mpclmul -msse2 -maes` for MBEDTLS_AESNI_C"
> - #else
> - #error "MBEDTLS_AESNI_C defined, but neither intrinsics nor assembly available"
> - #endif
> ---
> -2.34.1
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
> similarity index 91%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
> index 2fedac48cf..6375c7dc2c 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
> @@ -23,10 +23,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>   SECTION = "libs"
>   
>   S = "${WORKDIR}/git"
> -SRCREV = "daca7a3979c22da155ec9dce49ab1abf3b65d3a9"
>   SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
> -	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
> -	file://run-ptest"
> +           git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
> +           file://run-ptest"
> +
> +SRCREV = "2ca6c285a0dd3f33982dd57299012dacab1ff206"
> +SRCREV_framework = "750634d3a51eb9d61b59fd5d801546927c946588"
> +SRCREV_FORMAT .= "_framework"
> +
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>   
>   inherit cmake update-alternatives ptest
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110155): https://lists.openembedded.org/g/openembedded-devel/message/110155
> Mute This Topic: https://lists.openembedded.org/mt/105749660/7312273
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


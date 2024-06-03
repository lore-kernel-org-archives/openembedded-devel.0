Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF520C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 05:51:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.76619.1717393874526162296
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 22:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=688488c23c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4535P2kJ023350
	for <openembedded-devel@lists.openembedded.org>; Sun, 2 Jun 2024 22:51:14 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f169d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 22:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b21VvOh6Alr9upU2iqhUJtbDusVNO4kbRpY+PsCiLeYwxyaH2xqR4HW4w/oL297mbQSfv7DyU93CBfPBHbOIZikodGnX3R2roL3YzyPROgxwYsvWN1b574Mf2icdx0Tj2S5uHV2Uo/epwzQxHPAc+lrSXK6cpmQPUnJMUlY7qlfhDJ7kcHrgwRg7GupVbvOpP/l8MOclkzk+EKlg3zILacCFsDNsn6JXBGVLYhhWoiCRH+yoq09umD+CnodOazS/nQKZJCKBnZemgBxGUcPFlHwOZVVHDk+JTzPM13PE0QC4HyWoPPN7tczq0a9ej/3rF1BL9wmidcvm2nxr40hevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqwnSQb8dip94sEfXVbP+yJGkDsmEchl10pYzt75JcY=;
 b=K32+8UMVA/hv1t8JOfM2acHLvsCFoGdAMJrBKZ2mijFfFIT6fipxgql0KKY9N9MeTQw08yEbJjolEtUcrPZw/5bJLTkiOe8lIUt1ZlvmowPLFd4tehm5blIQT0RCH8Il/03sXdWmIv9EyQKTvLquzjOROvRGElqnA/FXXgZhyUZAQfFCQ647uZWzuiWk1fPpDQ8N2XgIAOKIgdqL8t1AOsADmUOVzj97chwukPo6q9Hid+CJVbiKOPTbHQVqkfjA+zkPgctxvS6MIui9IzYgssuqmnowZ/QaMfj3083DlzNe4WVeOXABEGzOjfKeVVlbS7wG2gRimLBAc8NRvhNcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 05:51:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 05:51:09 +0000
Content-Type: multipart/alternative;
 boundary="------------dyV0xPJ8hcKz31I2QV1I4VVa"
Message-ID: <d286ece9-0108-48b1-89d7-6629fca512a4@windriver.com>
Date: Mon, 3 Jun 2024 13:51:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-python][PATCH] python3-grpcio: fix
 do_compile failure for qemuppc64/qemuppc
To: openembedded-devel@lists.openembedded.org
References: <17CFEBD1D2B9E2AC.16299@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17CFEBD1D2B9E2AC.16299@lists.openembedded.org>
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f3f387-7515-4a3e-87f7-08dc83912b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFRRd2pHZlpmeGVJMitiV0JZdFRaeVpnb2xPZnpwSVd4MFVhck85T2NTZXJu?=
 =?utf-8?B?eXBVYlhmU29QaXFZQ2x1c0ZpL285dUJOS08randQWndBeDk0ajZ0emtaVEdG?=
 =?utf-8?B?QmcwaVErYlFrMlJWTDZlZEFtVlhQOVBTbExFQkhOWms5bWNST1hQYlZDTVN5?=
 =?utf-8?B?aFl5b1NLZ3U1bG8yMkJ4RVV2dFlsNGRZd2xqRTdESTJHRllXbml3ZkxlWFdw?=
 =?utf-8?B?QjQyZ2didXB5TU5qUlJNemI3dVl1ZXlYV0pud2NOMnZSdVpIcVpqSTg0cmlz?=
 =?utf-8?B?TUtqbjZobGpYaGM0bzRzTERJYmF0T0tQaUNDZHhMLzY2WnJ0ZnNPdVFTeVQx?=
 =?utf-8?B?cSs5TDNFSUN6VFNFSUYrd1hIc2lEY2dRUGZGazdVbkU2c1VOY2RUTk5yaVNE?=
 =?utf-8?B?R0JsdE1BWTFTYjdTUDREcDdveUQ1eGFqSXcxSUhreTJPb0NTVEhiTDRQemQw?=
 =?utf-8?B?N3QzU0h3cDlpSWVPNEFPN2hyVDdqZ2tBZVNDTzgrS0hoRUV6TlhqSnVuL215?=
 =?utf-8?B?WTJRZVBwTVFoZnhZakRXKzNRZ09IQlF2bTJZQ3BGanYvY3lqWFVUMm9rK1hT?=
 =?utf-8?B?T1ZkUzZRamlvbnk2eCtVRmxWNG00RTZMYkZUVERXZnJCeFk5NVNSb0JydWU1?=
 =?utf-8?B?WUsyMStNMVV5ZzE5VzJRZWw2dVpSWlpNWmlqNDZlTVJHUVlMaXRyNVVxSjd2?=
 =?utf-8?B?NUZubkhMbEY5UDIrTHp6cktQemp6SlErZ0w4SC8rOGNld3R5Mm15NnNXbUla?=
 =?utf-8?B?UDhrTWtodUE2YWZKL2tReld4RWM4OFNQM2h6NERCK0hoTE53dThERGd4NnpT?=
 =?utf-8?B?bFl2VVNCbjcxN3pOWEYvbzZPQ096Smt1Uk50MjY2RUxpbWNtTVhkTmpBSlRI?=
 =?utf-8?B?alV1SmVWTHJacjNwenJhUVlSdGxCajRrKzAvbXJoYUFJSUp1RjNxYXNmY0dV?=
 =?utf-8?B?YVF4bzhoOXl4WTNPWmhmMXJrTzhKVXYwcXRHMmw3WVJxQWw2dURrT3d2bUtk?=
 =?utf-8?B?ZmdKK0hOUWgvNEtGalBiZU42NlJuTE42eUdpR1M4ZzJHOWhoNzRWNjk3c0gv?=
 =?utf-8?B?VjFqcDZFYlRIY0xMTFRVdG1oVzVYUUQvZC9rczhWZ1JKamwxOFNDZ0krWkZI?=
 =?utf-8?B?VFFTeUF0SUNIU2JvTW9kZUhjak5pT0V3UVcxbERGcHcrSWNvWSt4TVk5bXA2?=
 =?utf-8?B?MFU0U0VIci9vajNRUi9zZnZCMHhCKzJoWTlJWmcxWlN0N3pEZG50bWVnbEtr?=
 =?utf-8?B?VUc3Qzd5N2V2c3ordXNvdkpXZy96NHhwSEIxa2NSOGdtLzdGSDRSenNNUEpS?=
 =?utf-8?B?L3FQZlJ1cTczREFFQWF4RUdLL1FmdWgwMTFmUmtyb3pkLythWGllNjQ5V0JL?=
 =?utf-8?B?T1JYbDczY1o4a1VGSE8yS0RVOGxnS3NGbVhHNGI5THVPOWM2dTRZTFNuTGwx?=
 =?utf-8?B?RjltMnprN0tVT1ZCcVFCK3VwcmszbnhaellDK0sxSmNla3lGZmpUM2dVU0dr?=
 =?utf-8?B?NjRtcVlxRnlxd1piWDRZcGdkRldUOUM1RVY3NkVQdnVMbFU1TERCQVViUEty?=
 =?utf-8?B?WXhLUzIzMHU3VEVKVzIzUCtUdmRkUWwvMTBNbjJCTlBwZGpjYjZZZE9KVVNB?=
 =?utf-8?Q?LSTnVWXpK7qh9doomsaaRk7pE7UqIxkhMGohlmoKTjZA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzZNSFAwUWFlRlNNeURHQU1VQUtpSTFURlBuN1lEblVST1NZWC9qSjVDQ1U3?=
 =?utf-8?B?c1ZPK3RJb0xWSVBoOHRIUkJLN1ZvWjVjYVhwSW1wNm8vK1dmWWVBcWFZRmsz?=
 =?utf-8?B?REgvcmtJeFhwN0Y5aVNMbzZDaFBROGhnOFNNL1lUcFgvYTQra2xHWExxUU1r?=
 =?utf-8?B?VjNGYkJadFhiR2JFSFl1cHVqRmE3cmJIdW9LSHB1M2J4Z3RPNGFmSUozaGdW?=
 =?utf-8?B?NUtPaUlSaCtxdUxxNVRZTGJ3bGd1NXNiMUorYVpSQjhPUys0NVFnNy9BM1BG?=
 =?utf-8?B?ZlI4RDdXRWF3eG9mdnBZV0g0WkhxUFY4VytDSXNsSnVleWFWWUFvcExUcGJj?=
 =?utf-8?B?eUhZWmdpUjdscVVWZ1pqa1NMcWRJaWFhRjZ1WlhtZ3FRZE9VbWdMTlZRS2px?=
 =?utf-8?B?Ly9lWThoSEkzcXlhbzExUURiNm5HUXFqLzRDRWRXcjA4VU43eENGUXUyRXVn?=
 =?utf-8?B?c3pqTTJCclhxZVQ1bkpUT0QzTzByMVUxKzkxOStrS2NqcDkvMFVTVUNzbXBP?=
 =?utf-8?B?dklDQTQ4MHNWVFV3ZEJKM2VhMktUWUdxUXd3VkFzRkV4VUp3NmgwM1ptbEJI?=
 =?utf-8?B?Q0w5Q3NQeVdmNmVialBjNFZJSGVWdE5LbmR3SEt1RHVRSkMzMVJsUlJwVXps?=
 =?utf-8?B?a3BuL01tUmtXZTJpK1pqbmFIQ2kxU085VStGb2dFaWI3am5ncG1WNUlWUE9l?=
 =?utf-8?B?U3VEbjQ1Qi81c3hiQXZLc05aNnZMeDdBTVJyZm9LOWFDVDMzMWVHUElVdU1B?=
 =?utf-8?B?VUdHWEw1aWw5OW9MYlN2WE4yMzYvMEE3dmIvU0VNRDBMNzJ4enl0bWk3TjNt?=
 =?utf-8?B?ZVVWRkU4K3llcldLb2ptR2tONko2SWhMbUErSG5TZm9tVGRoQ21CdTdHWDBH?=
 =?utf-8?B?WGxpVjkwamtjTDlvZEYxclBVd2I1R0lheVhiWGY0cW1WZlZCTHAvL2p4aExk?=
 =?utf-8?B?SkZUKy9nSlBjUThSMW8rK1dHenVjNHpXVTdJTkticDFIYkVoR3VWdmk0SXdi?=
 =?utf-8?B?T2FWYWZxSno3Y0lqcWw3STM3WHI2Nk5Gdm5DRGtEWGtJc2sydXJRWDZ0bS8x?=
 =?utf-8?B?M0xKejg2K3o5d2dxbS9PQW1HV1ZwV1YvR1pER1N2enJyMVJjTm0xT1VNeVBI?=
 =?utf-8?B?YUR3dytIbXBZb3ZuQlIxTE5GRFl0V2dLZkFkQnRRT2dLY2J1U1VBUUlmRW1a?=
 =?utf-8?B?NGVueGNhOE9jeXNyOUdYYjFrUElFeUlUK2FFZnRtdjNjWmZ3VVRrZG1EbjUr?=
 =?utf-8?B?eVZpR1Y1L082N3ZralJFZmxTZ0lSNDFYUGg1UXlXdGFUUTNiT25JREJxdDBv?=
 =?utf-8?B?VDZWdVR0bTZ6N3pyUGRVc0Q2UWY5OTBpQkZYZFdwcW8zdlJrTVNtV2xnOUs1?=
 =?utf-8?B?UTZUSkgydGRxdjdZNzZ3c1FTWUVSdHhLc0tvUzE3QmR2VG9ySUZORyt1eHgr?=
 =?utf-8?B?MGlpZzhSRE55eXE4LzE1OVJMNVRxVnh1bnVEbGMyMDlhMUFiZG1SVEd4RnQ1?=
 =?utf-8?B?T2RRS3dhMlh2ZUw0UDhteHI5RmNTQTJFNlpRUmEyMG5tL2NydkYrT0ZhOG9M?=
 =?utf-8?B?elZYSitIemhKSEd5ZkRiV1NMak81aG80Q2x1Yjl4dmNmNFV0eCtsVDVkZ1FH?=
 =?utf-8?B?ZTdvZUkxT0o3QXFDdkNHaGI4QlljZ3hYMHFMYy93T1RkZDlnSzBSc3NNekcw?=
 =?utf-8?B?dmE2cU8rNnpvL2RicGg4NG1tSDY5aW0raFcvaklieGM3OVBTTGpFZGxNc2t4?=
 =?utf-8?B?MitDNHVLTDFyRDJOUGo0azNBL0NZRU1pZWJsNTdYTGRuWlN0YmNRTnI2M1lF?=
 =?utf-8?B?Ull5bXp2bEJQTDFzbXc3M2wzMk1HN1cvaTV6aGdJRGtITE1vT2Z0bEpSSFFj?=
 =?utf-8?B?Q1RvWFc1ODJ4VVBxeWdqbWRVc2I4dDFQV0I5TDEwM0FHRDFMUzlKeEtqZHc4?=
 =?utf-8?B?dXNDK0JkS09mUis1RmNsbk5UUEtYNzE0TU1UK0J5ZldRUmNZK1VKSkVmWFVk?=
 =?utf-8?B?TW51c2JHK25SSVA2VDNzQXBVWllKU3dZMjVNTEZtUFZPL3gzbkplWlJIRjNo?=
 =?utf-8?B?RXBpSTMrS25OVWdZaWpLSEEzN3dhZGxpUFRLWFBRNFF2NkVnakg4dFMwZS9W?=
 =?utf-8?B?dWJ6ZERkT01ublRyK0NaKzFXTVNiYmVLdnBSYnl5dXV6eVMrMXhMenRteUcv?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f3f387-7515-4a3e-87f7-08dc83912b05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 05:51:09.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hge50f5FrItpXzMqt5zb+ydGLX4tuzaNjbUhoHOWwM0mYanDfZB4uJQJlEHEdfHIVBZDBisE1HfgNxLsWkcmgB7qKMeowem+805v9XrP9I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-GUID: W7-Z_xXgPyH4Xyy1cNjDuLeYecyKOtUg
X-Proofpoint-ORIG-GUID: W7-Z_xXgPyH4Xyy1cNjDuLeYecyKOtUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 05:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110669

--------------dyV0xPJ8hcKz31I2QV1I4VVa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping for branch scarthgap

Regards

Changqing

On 5/16/24 16:47, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> define proper macro for ppc/ppc64 to fix compile error
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   ....h-define-proper-macro-for-ppc-ppc64.patch | 37 +++++++++++++++++++
>   .../python/python3-grpcio_1.62.2.bb           |  1 +
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
> new file mode 100644
> index 000000000..0b512b1d0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
> @@ -0,0 +1,37 @@
> +From b3bca013007a4a66703573d243e433f22e1e6684 Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Wed, 15 May 2024 16:55:09 +0800
> +Subject: [PATCH] target.h: define proper macro for ppc/ppc64
> +
> +Fix error:
> +third_party/boringssl-with-bazel/src/include/openssl/target.h:74:2: error: #error "Unknown target CPU"
> +third_party/boringssl-with-bazel/src/include/openssl/bn.h:172:2: error: #error "Must define either OPENSSL_32_BIT or OPENSSL_64_BIT"
> +third_party/boringssl-with-bazel/src/include/openssl/bn.h:230:44: error: 'BN_ULONG' has not been declared
> +
> +BN_ULONG will be defined after set proper OPENSSL_32_BIT or OPENSSL_64_BIT
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + third_party/boringssl-with-bazel/src/include/openssl/target.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/third_party/boringssl-with-bazel/src/include/openssl/target.h b/third_party/boringssl-with-bazel/src/include/openssl/target.h
> +index 29b1dc6..d779813 100644
> +--- a/third_party/boringssl-with-bazel/src/include/openssl/target.h
> ++++ b/third_party/boringssl-with-bazel/src/include/openssl/target.h
> +@@ -54,6 +54,10 @@
> + #define OPENSSL_32_BIT
> + #elif defined(__myriad2__)
> + #define OPENSSL_32_BIT
> ++#elif defined(__PPC64__)
> ++#define OPENSSL_64_BIT
> ++#elif defined(__PPC__)
> ++#define OPENSSL_32_BIT
> + #else
> + // The list above enumerates the platforms that BoringSSL supports. For these
> + // platforms we keep a reasonable bar of not breaking them: automated test
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
> index 3148f6376..80a4d04e6 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
> @@ -9,6 +9,7 @@ DEPENDS += "python3-protobuf"
>   SRC_URI +="file://0001-Include-missing-cstdint-header.patch \ 
> file://abseil-ppc-fixes.patch \ 
> file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \ + 
> file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \ "
>   SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110413):https://lists.openembedded.org/g/openembedded-devel/message/110413
> Mute This Topic:https://lists.openembedded.org/mt/106130958/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------dyV0xPJ8hcKz31I2QV1I4VVa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Ping for branch scarthgap</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/16/24 16:47, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17CFEBD1D2B9E2AC.16299@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

define proper macro for ppc/ppc64 to fix compile error

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ....h-define-proper-macro-for-ppc-ppc64.patch | 37 +++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
new file mode 100644
index 000000000..0b512b1d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
@@ -0,0 +1,37 @@
+From b3bca013007a4a66703573d243e433f22e1e6684 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Wed, 15 May 2024 16:55:09 +0800
+Subject: [PATCH] target.h: define proper macro for ppc/ppc64
+
+Fix error:
+third_party/boringssl-with-bazel/src/include/openssl/target.h:74:2: error: #error &quot;Unknown target CPU&quot;
+third_party/boringssl-with-bazel/src/include/openssl/bn.h:172:2: error: #error &quot;Must define either OPENSSL_32_BIT or OPENSSL_64_BIT&quot;
+third_party/boringssl-with-bazel/src/include/openssl/bn.h:230:44: error: 'BN_ULONG' has not been declared
+
+BN_ULONG will be defined after set proper OPENSSL_32_BIT or OPENSSL_64_BIT
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ third_party/boringssl-with-bazel/src/include/openssl/target.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/third_party/boringssl-with-bazel/src/include/openssl/target.h b/third_party/boringssl-with-bazel/src/include/openssl/target.h
+index 29b1dc6..d779813 100644
+--- a/third_party/boringssl-with-bazel/src/include/openssl/target.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/target.h
+@@ -54,6 +54,10 @@
+ #define OPENSSL_32_BIT
+ #elif defined(__myriad2__)
+ #define OPENSSL_32_BIT
++#elif defined(__PPC64__)
++#define OPENSSL_64_BIT
++#elif defined(__PPC__)
++#define OPENSSL_32_BIT
+ #else
+ // The list above enumerates the platforms that BoringSSL supports. For these
+ // platforms we keep a reasonable bar of not breaking them: automated test
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 3148f6376..80a4d04e6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -9,6 +9,7 @@ DEPENDS += &quot;python3-protobuf&quot;
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-Include-missing-cstdint-header.patch\file://abseil-ppc-fixes.patch\file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch\+file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch\">&quot;file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
+           file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110413): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/110413">https://lists.openembedded.org/g/openembedded-devel/message/110413</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106130958/3616873">https://lists.openembedded.org/mt/106130958/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------dyV0xPJ8hcKz31I2QV1I4VVa--


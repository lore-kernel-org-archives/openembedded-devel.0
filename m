Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEC6C25B78
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 02:05:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5150.1717553105038548169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 19:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68867ad8c0=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45518rpR006051
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Jun 2024 02:05:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxbmgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 02:05:04 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 455253hJ020462;
	Wed, 5 Jun 2024 02:05:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxbmge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 02:05:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PklnFCJVvjaJ2GFPv3AGwoYayXrNSuHAPIA9NiYiIamcb1pne0PFsMOADjWfg0TOHrk1M2KwERD6dPkZnbOM6SK5EQBjxRiwXZlRxZdk9ojXnjHFLUdIM3Ns7Z1YE0nW5HYY2933B2QEcuDdFJFO9fz3JDDCbDur6y4N+cYFJEx0280LPJ2yaHp/9XwHEkPg9luc23bFqPwMnfotGPDcWuQwSqxJM8l2NpkDLqw09H7ZIczD5T2yDx7yiVDfkQfgcr18elGR2tgKJs3EOdvFiwuY8T/hFici8y6o5rSBVWwt7rkmFfOdloYI77EWEY3v6bntBTgiHQgsRse1sx3PRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvJDZW0VptEGf3EKY1VZPnoGEGMvnHzgwXLAakjIpdM=;
 b=drCj46pw3RRQRTCPG8h/pxRYXw0Jbsdun9IzYiM/yPMAQyY/KzsWGmskMfJZ0SlGmc2OG4PtwqnrXUWfqD5y2vFXHjYLkfuNx92iIfCTKLUN2KCm9E5yWInYN0ucmUZOBQSdNqwS5Ew9bLvqYzJUvzXbMezxpuGjqlhyeCpjEJ1btgdrRJjs6kxg3fHkHTb5KbnHTIj7LGKT4pHosfg1MK2dXPYDVEomHX1KT00jDu7t21kFn0upqngD+ber/xEzO7deUn5j/Y4O2lEseIn1AX/4Lfm82zjM37ySO66lP391ItMtk7gGxemZM8fMl5noImxVNaxgLY2nfHJQ27El4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by PH7PR11MB8525.namprd11.prod.outlook.com (2603:10b6:510:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 5 Jun
 2024 02:04:59 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 02:04:59 +0000
Message-ID: <0b799735-6940-4ced-8d86-0c063bbc2353@windriver.com>
Date: Wed, 5 Jun 2024 10:04:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] lvm2: rename to add version back
To: Khem Raj <raj.khem@gmail.com>, kai.kang@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240603084336.3732231-1-kai.kang@windriver.com>
 <CAMKF1sogCTmV=Z9zt5qYYo=0Pu1XxaW075gjuKO7jELxLqB8Hg@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sogCTmV=Z9zt5qYYo=0Pu1XxaW075gjuKO7jELxLqB8Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|PH7PR11MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb9f653-db14-4f14-cec8-08dc8503e72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0hJUEJ0NTdzTFVyaWUzR01pbjBDQURHTFVYZE1FdTdvaFJUV0ZJb21XZUpI?=
 =?utf-8?B?QXdCLzU1Mm02QjRiWDVMbDNsSkRRY0lmaVluMVpxVWYxVVZ5NXFocjFlT3Bi?=
 =?utf-8?B?aWlPc3ZkbVpieUNRZEZGTEpreStqVytMOHhxMlV3Q1FKWmtHMVYwTlptZUlB?=
 =?utf-8?B?a0dkL2R4RzA1K1ZYMWJWbTgwV0lPM2RVTHRKY2h1ZWZraS9ybE41RHVJejR3?=
 =?utf-8?B?MkoyN1FvMVo4Nm9oRm9NdnJTb2piMTNIZWxVSGVXNk9pbzNMTjhlOFZWcVBp?=
 =?utf-8?B?ZlZocStSNi9KREJpYnNOV2g3YVhyOTZraE5MYXVFUWRBN3h0R3FkRzNYdzlS?=
 =?utf-8?B?SllnU1FpbjRQaFNoR3J6cU5GZ0hkSTJhYUl1TjJGcnRuWHNwTmp1WXlEc0c5?=
 =?utf-8?B?ZWFQb3RpODNiZXB6NzdRdnZGRHNET3ZMcVhzSUphaWtQaVozUFo1a0htcFBo?=
 =?utf-8?B?cnNmNGNUazRyYmZrV1dNTzUrR3FNRERmaGdzclpFNjhkS2pQQnBxVFU5OG5T?=
 =?utf-8?B?MVJDdXdwSWQ1MWE2QnN4YnZUTmJOZFhWRGRBNkhLZXRYNHpUOTFuS1JlRjhD?=
 =?utf-8?B?Qlh3TDcwTnM4a3R2MjJOOFpDNmFpZFMzOS9DSkdxV1BQZm5hMUovOTlsaGFu?=
 =?utf-8?B?RmxrZjBLOTJ5cnZ3eTVGOU9qa2gyTVJJbXdqUkdqU2FUVkdTSEZydWlmdUkz?=
 =?utf-8?B?MG1uK05XWEYyNGNDbWJ0cnBhQ0pmdDJMMERpWnBHbUU3YmRUSm15eHJ4S1BQ?=
 =?utf-8?B?b25EeWYxT0ErS3YwZDlPanB0Wjh5TmhIMk11TDdxK0c1S2pKU0hZVnNFeFFG?=
 =?utf-8?B?YUw4ZC9reUtjTEc4MUY3U0FoS1hrK0JQSzlrVVdKZWNZSzN3eTMvUzl1TU5u?=
 =?utf-8?B?am5FTU91Z2NCSmE0dFZzS2lKenFxQmh2Y1Nncm1HR3d6c2k1anRRZnJlVFE2?=
 =?utf-8?B?Uy96VzFJUndmR1lHQWxsTzVxOTYrcWw0dm5DY1NLeVVvVllQaWVySU40UHcv?=
 =?utf-8?B?ZDBzc0lWTkp2N0FDYWVLWWxpaGtueGhDMG1qb2RKQ0MwcTErTnRDMFBDZ0pu?=
 =?utf-8?B?Z3g0TmpSbWMvVGpBdmRxT3NxOEpIOGFINGgzaWxqaTl3RjRLZFdrd3ZUTTRy?=
 =?utf-8?B?UGcvTEVtaCsrcHJsUldIbDBDSmUzTHBSdy9QTGhnNTN4dnRrZjdualBsWGkv?=
 =?utf-8?B?RlQ5aXNvSWhQRDNIV0ovc1RPczhBSHNia05vcnVSVFBUOGljbEE4eHY2alB6?=
 =?utf-8?B?eVd2c0h3YzdiZGpWZUFkS0FGUFFzUTlnUGtuMHYvbnhDVFB5TW95VHBjcUZQ?=
 =?utf-8?B?cVF0cEQ2SjF2OXNCcnRucmNEN3ExRXYxbTRVbWxWa0lPakZSZWQzV015VUpN?=
 =?utf-8?B?SkNUMUFncFgralM1dENJTWJGdkRVeUIwZDgxbTVsc1VQUnF2ekJFblE4NjJo?=
 =?utf-8?B?RVF4NVlmMGszQzZ4SmVTN3RubDZtU0cvWnU4YWtwaXBUYzZhVWF1UVd5Mmpu?=
 =?utf-8?B?WGFuNUVBOEZBcjg5MVdpa2lCV2xubml5T2dMeVBRUjJpa1ZCemNkNjlKZS9R?=
 =?utf-8?B?K1ZHVzFKSmRRcGltWWxnY0lvNm82eGhzVytURS9CRjA1a3J0WTFXQ2cwYU1K?=
 =?utf-8?B?WHhod1B2Y2NLaWhKUHlhMWpVN0tTV1N0dU1WZ3RCWXR2M2JYcGVTMVZROGJ0?=
 =?utf-8?B?SlZTTWVCZ3lxQjZHRWxnT2t4NUgrNHBmRHNHWHM1UjRpeDQ4c1dZV3dnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzV1WVVpY3REa2ZsYUVobTFHdUJzaTVacWJpamRTenRGUmIrcGpxMzRWVVEv?=
 =?utf-8?B?ZDFpcFUyV3RHNnB5b29ZZmNra2J2bStUbFJZdzBXZ00wVWk3VFgxajV0V2dl?=
 =?utf-8?B?NlovY0o3bUxBc21OeDM2SzMxZ0NNUmVUa1ptK0phVkpBcVgrNVZsd3hPd1RX?=
 =?utf-8?B?RWIrcUo5MnVJaHlOVGdkV09oTXJVVHg5N1hOcE1iblBHMG80cVhsTUtxcWt0?=
 =?utf-8?B?UjBPbkFLS3NubmpySGN6SnJmNDRYRHR0aG14RnQ3WmJWY1ZpeWc2d2RrRjM2?=
 =?utf-8?B?Mmk5Z3VkUjl0dmdtbm5COUtadCsyNkx1RG43TnN2T2lBVkRCRVBla05aY0l1?=
 =?utf-8?B?dW5tVVpFejRaVjJGOXBSNGJTcE4yQWE3SkI5aWZqUllJL2o3bXhIa2dIU2hy?=
 =?utf-8?B?bWpvOGU3NUQ1ZHk3Wk55WXlUdHZXY09NdW9OZlBOaFdrVit6ZHJ6bFFBRHZN?=
 =?utf-8?B?TU9ES1NOUzZOd3V0bkxXZ2xhRWJnRGxHSWhzR3U5Y0VrOVd4YlltTlFpMTNN?=
 =?utf-8?B?UG90bmRyaU5kalZ5VmI4OGxiYVM1clJOamJzMzFyWGNFTEptOE55OHk2bGJl?=
 =?utf-8?B?MVc2TS9ZZHRUVzVSVkEzWlVKWVdYeUREeXdzMmU5dnlod3ZxSW5CS21XT2Zh?=
 =?utf-8?B?TTFzMUJDZGViM1NCTWVvMkFESmltOFlYQnBtTDlERXphcDZGQ2ZvSTJuM2Ju?=
 =?utf-8?B?ZExkUzFnTG81ajQ0UG1BZkhUSktjNFoybjAxNkdjYS96UFoxT2pVTVI5alEw?=
 =?utf-8?B?YmJYQ2VEMGNlcWRCZ3R6VDN1OUczMFI0bkZVWGozVGNZdFNtOTNNZGVFenJO?=
 =?utf-8?B?VGhJOWxUMldhYllIQjl5dHIyakZRSXhhdGhJVkdyZVo4R0lmMVNXd1FGWmxY?=
 =?utf-8?B?aS91ajI5U1k4ZmlhSjZOTDM2ejZzQTc2RW53VTAxd0RPUjhXMDVVMm1KU1VW?=
 =?utf-8?B?TWVHWGdNODVCWTFRQWk2amJjR21mZWRpQ25VRlZVeHpwRE8waklFa205UVFK?=
 =?utf-8?B?d2kwQk5aWFJPRW5kTEVMb01BSC9rVFYySTUwRkJGeUJCcFVEaC9QSzN0ZU8v?=
 =?utf-8?B?ZndSUTY1c0tsbi9FRXlTNnoxUVRZUWxzREMwUWZjdzVyWmlVMEZJVWlWUTA0?=
 =?utf-8?B?SGVOOWRoQWw5UThNVWR6eC9xVDNDN0Fod1FoSkJNWWxLYkI0TDFIbGhuWW5Z?=
 =?utf-8?B?aGVjMWtsaVd5Tis2VHpIeERUREM5eFg2R1VVWGlCS3FTaVpIUmdiRHE3M3lG?=
 =?utf-8?B?dW15K1hya1BDYy9FQ3lxUU9abDZENWtGaE4vVzFDbUE1bStuL0w3UUs2Y3F0?=
 =?utf-8?B?NVZXMjd2M0ZQb2hsUnNzazIxdW85amJ4WU8vQjJFc3NFS3VPWmZpcSszWmJi?=
 =?utf-8?B?OGpEWUROS3kvMVk3QlZBTnhSbExkOHpDOEcxQWVQMzM4eExSWWpPaE5sVFQ4?=
 =?utf-8?B?NGFXTFEydHpYQmR4ZnJGd2Rpby9vVEpiRE93dWFydlZ3ZENqR2JGdzlQVTN6?=
 =?utf-8?B?YWxvb3VLWGJZeU9MS0ZKOVdFTG91NzdCUzF0Mk0xWmJWemJuaVRCdDhPMTQy?=
 =?utf-8?B?RmFKUGN4RmIxNDhtOURoK2JCU0NJMlczSkkrcTl6a2IxaDRJNGpsdUp4ZVRO?=
 =?utf-8?B?OTJhdWxMdHRsdWZrREx1QzBGYXU0ME82QXRCQzVZazFMMUt0Y3lXNlRDaXhX?=
 =?utf-8?B?aUJidVJJZysxcG1XUFhYQVlyRVJ3UVhhRGM5eGNXWUJQTHAzRWxLTTdQMndP?=
 =?utf-8?B?TjNMUHI4SnVndTZpNEdjeXZ2OVVwKzhqUkJHR1lEeFVvN1lnTHZSR2hjM3hX?=
 =?utf-8?B?Y1hjRC9CUDZoOFNxTTJPOHdYTUF2L0JLbzJaZkFKZ1E4SDBrTmhuQmFVVGNC?=
 =?utf-8?B?ZWcvK3pCbmprRXBFNjV1Ly91eDBkWWhNNFk1WnN5eGlaelg2bFE4QUR4cTN6?=
 =?utf-8?B?ZXZpSjFEejhGQ3YwTzNRVWt4NlJUSFc3TGpDakY5TmljRTJqS0lGWm90Zy9h?=
 =?utf-8?B?NVR2bG1BUkpuampOK2swNWtRVWtMS2R3VHZQOWdWZFIraGRCZFN0NjRpYWRn?=
 =?utf-8?B?S0lWS0swd1Z2aHQyR1M4V2tYR09BeWNTUS8weUQ0amk5MUtoUzlKOG9NUDR6?=
 =?utf-8?Q?mepcbRwCup6VmcTVbICE8uRdO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb9f653-db14-4f14-cec8-08dc8503e72a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 02:04:59.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVNlOnsZdiGFyIL9kecVeUMQu7eqpAKmbXr/CsAnw7Dz1TPEFoP0ydZvc1fZjQSm1ajlcULhvk0wh4REKYxYUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8525
X-Proofpoint-ORIG-GUID: YEDXoFw1ekbQRgX3Y330c3ullIhRR7NC
X-Proofpoint-GUID: FzGR0q_RcZmqhxuNnAao1DkcHa7-ssSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=954 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406050015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45518rpR006051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 02:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110692

On 6/4/24 00:31, Khem Raj wrote:
> its now in lvm2.inc which is shared between libdevmapper.bb and lvm2.bb

Thank you all.

It triggers bbappend file can not find corresponding bb file. I'll=20
figure it out.

Regards,
Kai


>
> On Mon, Jun 3, 2024 at 1:43=E2=80=AFAM Kai Kang via lists.openembedded.=
org
> <kai.kang=3Deng.windriver.com@lists.openembedded.org> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The version has been removed from recipe name by commit
>>
>> * cc4e9fbd82 lvm2: remove subitted patch
>>
>> it is not proper and rename to add the version back in recipe name.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-support/lvm2/{lvm2.bb =3D> lvm2_2.03.22.bb} | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-oe/recipes-support/lvm2/{lvm2.bb =3D> lvm2_2.03.22.bb} (=
100%)
>>
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-su=
pport/lvm2/lvm2_2.03.22.bb
>> similarity index 100%
>> rename from meta-oe/recipes-support/lvm2/lvm2.bb
>> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110670): https://lists.openembedded.org/g/openembe=
dded-devel/message/110670
>> Mute This Topic: https://lists.openembedded.org/mt/106458240/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux



Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E74DC3DA61
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 02:43:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10535.1721357013846793314
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 19:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=793023b01e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0NF8F017264
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 02:43:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc95j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 02:43:32 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46J2cqvx008875
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 02:43:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc95j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 02:43:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PT4YJziBrNUcSbckm5PjvGXjz4cyfv5gGhIz1Qjmk9QBnc8eV4FbalCnWgeUduClyWjm3odTJ+YeQwA0iZEU2UBIhEUVo3f9jsaKj/JZGBxPA3I9dU45jwwlq8JcufMbTlUkj4UyRAl65c274AfdSJSz6ZAC67kZRnjwm0uku0bRhRfG5oVki1inTOHdHOtz9Ikp7ISTPYgy2sGB4t7Qm/2zwuPpCGPVDBJ23cZfi4xp1VAmKn829TXPhztNxsyNJTl9LdCqJUNJKz4MJ+0rGboXKM6U7Du9pRFbLzCENFxLgBX8O5/VWXnbWwpvfQq5xeMV5Np9oAOHi2N6q/Uu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JILyMFrGUYF7fzKSs9smn4mtnlmUNEDKmxm4t3d0kvI=;
 b=Z/ra9ywTDADngs/Gt1ODCywOoqTzrNT6ec5jobtXF9w7LnZjB6VSbamlSG58GzbY5Uu8BCKhi7EgyPKR8VqoJ83E/tYHqlpQZWu09ZDPCEmfaJx0TxWAoe2fZQgRWz2abuNYIKYzHjKBB6lZTUY8bWHbX+mfJ04aK0z1Eo6R3eZihrXoZtFk4KXpq7AHCV6lHXJV/LFZbJihVXanyG+opn/KcnshEeyFa1fAZy5x7FPRyhlLH2t9F6VwlgDpKbFR7/fWqwZSZvUwt6V4Cibk04kwSaWIpJHsre/p9y0SmMaxvv+HaXKByA9BNiCctLKcH1Wrf8bfcjTJ0oFBQfazsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Fri, 19 Jul
 2024 02:43:28 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 02:43:28 +0000
Content-Type: multipart/alternative;
 boundary="------------H678q0bvTSeIHF8T1DlN2sCA"
Message-ID: <f9558c95-ba98-46fe-b052-d870b3f514ff@windriver.com>
Date: Fri, 19 Jul 2024 10:43:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-python][PATCH] python3-h5py: fix compile
 error with gcc 14
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240718031733.2868099-1-changqing.li@windriver.com>
 <CA+chaQdxdvV57g-E2RcvmhktjYDhTdLHfzK2AOrqBGi72NQw6w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CA+chaQdxdvV57g-E2RcvmhktjYDhTdLHfzK2AOrqBGi72NQw6w@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a658fbc-7d1e-4183-9317-08dca79c91ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K3JzQSthNEtIVlVlclRTeTJad3gyVmtGRUYzamx3ODdJUFFzQk9RWThVU2ow?=
 =?utf-8?B?blVEY0tFSEczYmVtQmFZSnhMbENtNnNXemtvKzA0QnZDbHYwVzBrWG00cTB4?=
 =?utf-8?B?WTBsaUVVZldCVDZOMDlnYk9XYTBZUFlVcHZvTHpzYVliNDNRUGZ6L0N4a2dC?=
 =?utf-8?B?c29WWEo2bVUxUlpLdDNsOElqTDRNZXVwVHdWeENSQVNOSVRMeVZIMjQ1V05M?=
 =?utf-8?B?Y3RRdEtzTHhmR1NBTUJPVXJJcGtNTmZOTUpDcm4xWER0Q0tURHV2WDNucjNX?=
 =?utf-8?B?Qmszbmd1cTc5VWlYM2liNTFlRkhtbkxHbHdGN0t4MjNQS1dXd3IrenRKbHE5?=
 =?utf-8?B?ZXpubGxBSCtQaCtENEZDa2tJZVhSK0c3MEdtRWN5VnBlOHFPMHg5bWxqTkIr?=
 =?utf-8?B?dTJSajJ0TjVtVnR2UUhGT0NSUFozSDMyeXBkUU5tcmRkTzE2TnhZUittN21G?=
 =?utf-8?B?RzE5akVvdkZSS2NteE5HenFnY3NFZlMvTTA0MEtxUWgyUFFkZWh5OU93SFJI?=
 =?utf-8?B?Y2dJSThiTnFhNmVnTi8yMVZTY2phaDNlcE04VTlGMktJVmJ0ZXZYWnRmbDJT?=
 =?utf-8?B?djVFM3BJQkJHQlltVnVqQUhBZkRIcEZ3U0JTOWphUlZJN2s1dkQxaTRBY2hi?=
 =?utf-8?B?bjREdnhxL3MrZG96R0d1dVRtRXBpVE9ocjlyUlk4WkhaNGlaby9NYTJPNDFP?=
 =?utf-8?B?MXYyR21YNDlQTnl2djBRVXEvTWNTV1JRa3BsNnN3Ty9wdEZObTJ4MVdzUXJ1?=
 =?utf-8?B?Z01aaEhDajRDZytqOGU1V3JaN1dsdEtWMnZpOFc3UWp1bWNwSGFZNG9MV0Zk?=
 =?utf-8?B?TFlzOXpENXZER21hZlJXMnRNbk1CVTRPMHcvSDRWR1Z1bjVEcS92RzlzSVVS?=
 =?utf-8?B?VDJTMHg0dlFDeUxLcEh5czJFVUhsUDJ4TnU3ZmgydXRVZVkvUE92dnBOMDlB?=
 =?utf-8?B?dkwwS1VQTE1JcjZnVjYrclBmcTQrNE9TYnMwVGJFSzJ3SWtOcWYwendQVUgr?=
 =?utf-8?B?NEU3eWR6SDUwVDdyY3BUOE5yZFFNc2JlS08rMUhZRU5IRmVoK1I3T0cvdlo5?=
 =?utf-8?B?eW9GSWV2ZnMxeGRtcjRMb081YkNKUGQ3Qk1Pb2V3Q0tVa05ORk9QNWlkbnNt?=
 =?utf-8?B?UkE1a2hJNmo3L1lpNmc1akk0OTV2bmZaNmVpeVVRRTR4QTNiZjFzMUJxZEdr?=
 =?utf-8?B?bkpwaG1xd2xPblE2MFpHTDdvOGpoeFpINmE0RDhYVEdBaG85MWtoNTBiOHN1?=
 =?utf-8?B?ck54aUxUVzR4TURmYlk2MXNCMXd0M2NMVDhIbzVQWTFoRmw0L2pQM0M5c2VO?=
 =?utf-8?B?Njl1TndTWmQwSXhXVC9pVFIxRVVvZStJaGZ1Y3l4ZHAyNlNqWUh5RU5qRnhw?=
 =?utf-8?B?a3NCUlBjaVVQQ1hIQlNHMFVGVUQydmlFbWVaczA5eThqRnZDM3FYNUNJTy9Y?=
 =?utf-8?B?OFhiUm02RWJzbXVBaFcxUnJQUzMxOFp3cm9LUEp5RnVBdEV6ZGY2azhxckt3?=
 =?utf-8?B?cjFJMHlIRnZKV1lvNDFSTHl6amg5Ymh6ZWJGdW5mMEJRL0psdjMrOExHL1RS?=
 =?utf-8?B?VlVQeTVxU0l6SDFPYzZKODdNYzA2TVNwVkRZUWtxSVVId294YkUxWFA5TFRq?=
 =?utf-8?B?V3EvWGRCMExKMEFjemgyaGEzbVp5Zk1mMkZhK0UxRXRBRkw0T1ZpVzNxSnFK?=
 =?utf-8?B?RE94LzJGY3ZVM3J0UmE5cE1Eb0VuM3ZXa1haQW1lZkgwdk4wMUJBWFNkT0M1?=
 =?utf-8?Q?IRwXaLwvk5QXzH/Whc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZW85aERuZFFHLzYyTkI3THl0K29oZTRSSHlCc1BLOWR1TGFFSllzQmtDK0h5?=
 =?utf-8?B?TE9yOU5zQlZDL3VJc3J1akRaaDlrV1haU0psRVVhQWJYVjZ6QWcycWI5UVZ4?=
 =?utf-8?B?Q2VsL2gxQ3BrMGVRazQ3bFpkbU5kTEpBcDhQY0tIcG1xcUlnTUc5aTFsbXVr?=
 =?utf-8?B?V1pzb05LYUpPdmVHN1dGTEJ3cGNUUCtkMGR5QmlSMFVtNng3ZVkwWlVkeWpH?=
 =?utf-8?B?TU5ETk0wM2tBVmJTVFRFcDJDdVZ0U0kyRnB5dWlZUUJaOG02Ynl1U0F1ODdI?=
 =?utf-8?B?NzNIR2tzQkVMVGZZdXZxVHIwaldRM3BaNlRwelBVejdCRVpJait1RjJkR3Mw?=
 =?utf-8?B?T21vVGdaZXZtVk9qbURRL3ZlSThRNXorS1V6SDRycGZiREh6MUtIeHhnY3Iv?=
 =?utf-8?B?VktOQlZXZGJuRHV5eWtER2tmV1Q3cFZFYzlUeE9WNUlzZWpwNnBjVzlFNXhW?=
 =?utf-8?B?SFdBRC9mOHBsajIzTmFmWXNJcTQ1RXNuMTBqeGt6QWxnTVJJQms1Z0FSSUJn?=
 =?utf-8?B?UThGcFNSdkovbmpHSWlOaFN1TW5TVGVLVGMwV1N4Zjd5eE5tVFNsd3N0V1Zk?=
 =?utf-8?B?MzA2Ulg3dzN6UTJWdTRWMHE1alpncnl0UTRKaGdsQVlvZ2NOZXEzNi9adWxq?=
 =?utf-8?B?YjFwTkpQNjdMeVpxUEJCTnc2b3dwL3JJbDc5YkZlSUxDZkNqaDIzQlhwWTBN?=
 =?utf-8?B?SUEyREp1TGRIL1hrSWxKV0lZeWF4MXNOR25hKzVFZ3l1U3hqYmJ6cnFyRlFV?=
 =?utf-8?B?bG0yM2tiUWtmWjlERjVnV2pVTTd4a2YxeTZ4VjE3bnk4OW5SYUF6bUVGbE4z?=
 =?utf-8?B?SWE1YnFUK3ZoSWZEaEFmYVNOUGNoQXlwaUFxREhWNkZheTVDQnY2bVlOVmFX?=
 =?utf-8?B?SjEwWmZLSDBHSkVxd0Z6VE1TV1ErRmcxTjhUYURnd05FWElvTWZlMllhQVpZ?=
 =?utf-8?B?cTFpdFd3bFBYOTZCb0lnMjdWa09MTE1vVlpDamtMb3g4Rk1vS28zNXpQMEV3?=
 =?utf-8?B?djNTQmlyb2FuUmVaR0pIQS9VTDFNSUFzbDlSVmxqNDc5UWx3d2hmUlZ3SVBB?=
 =?utf-8?B?QTcrN1ZjQng4V3Y3ZC9Lem9MS2ZONk5EVUpNbm5SMDBwZXJmanRMaFdHalZq?=
 =?utf-8?B?T1FWcHhRTyt1MHo4ZFBYNkVJeHl4bmtKNlhZcTFaTlRjMm41SnpNSS93L0Z0?=
 =?utf-8?B?c21NOGJvclRibUEzbUVjdTJvazlMeXI0dkM5U1VBN2hud1p1clBZbUQ2SGdv?=
 =?utf-8?B?cmcyQlFMTlhvRld2c1JvYklnakhsNFBPblo5d2M0RlFydGFtajNHUkFNZG1a?=
 =?utf-8?B?clU2RWd4WFVpSU1aWEpSclMzZFgyZXluaWUyZWllVEJ4MVBpSUUrMnpHZVZr?=
 =?utf-8?B?VkZMdWw5dm5walBMQzhQR210RE9KZkc1cHZVTlVvS1djdVB1U2JkWS9DV2lz?=
 =?utf-8?B?eENYWG9XMmVhd3A5T2kxcmpWaFRzT1RoaTJ4ekJjbFVITTh3ampyV2t6Tncw?=
 =?utf-8?B?S25yUjI3ZVJHK3hFNktJSU1XR0sya0FUcTFBSm9FVUo5TDdXUVkrdHhZVXhk?=
 =?utf-8?B?WFlHdjhTQVZlYWFQSEFxZkwyOVpqdkFmN0RYYUxkd3pmSElRT2huUEFzYUJy?=
 =?utf-8?B?OUlFZ3g3RlVaY0hUNjdVYnZSZVUvNXBJN1FjVVRNMVliVmxQeCtadzNLNG1y?=
 =?utf-8?B?NHRrVW03VXFnRldpR1lPSW1BdlNSTi9jWHZ3bGFHeGt5WE8yb05YUmZ0Y0JM?=
 =?utf-8?B?K0pFaHhDb21walBKRW03c01TOE5neUdlclpCbTFVQ1ZRdldoM3piS2NVampz?=
 =?utf-8?B?NXBYamxOYzNyVDZ1UEFDODdPSnpMWVBSWDh5QzZ3K3FRQVRkYmlXSjBhZzdu?=
 =?utf-8?B?NE1rMGJkeTJoYzl3YkRiMm5iWW0wSS9hNGcybGc4NnE5elpEN0huaFVTUzlu?=
 =?utf-8?B?UGppU2R2N3ZOTlBJSWJITlJMaGt6bDJod3hHRW5nT0VhUTRsVmUyc0RvV0ZL?=
 =?utf-8?B?OTVBb1FGdWF4SU85MkdqSVVKVHlIZjFoNm8zMXVHYitraVhJUHdRZllndlZq?=
 =?utf-8?B?dWlyamN3RXZ4YTEzYlFid3NhN0ZBNjdBZm9sUGRoRDVVZ08vVHpSc2FXYTVs?=
 =?utf-8?B?VDVKdlhuVUcwaWNqSmc1TzM3VmVMVkxZR0cwaVhYNHl0ZW0yVjJhb24rdzlC?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a658fbc-7d1e-4183-9317-08dca79c91ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 02:43:28.2683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmsf8yRYxonAPBKmmTHtiAK/qL80c1NIieqPbdlwAJr2azg5aLd53Q6/eAVqvYBTaQUqqrbkhDYicno3/nY+kO1ktDO4yYAPF21r4hgFNWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-Proofpoint-GUID: B-fqWj7ZMtrtzRQtKH7bpQhjB1P3Vubn
X-Proofpoint-ORIG-GUID: 50hD_HX36QOF2-z6SaCKcOYmmj-zlTn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407190020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 02:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111409

--------------H678q0bvTSeIHF8T1DlN2sCA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46J0NF8F017264


On 7/18/24 16:29, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> You should remove the -Wno-error flags from:
> https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes=
-devtools/python/python3-h5py_3.11.0.bb?id=3Df0c767407d033e3f39ceeccc2f7e=
03a1ca7a6443
> if your change fixes it.

You are right,=C2=A0 this can be removed.=C2=A0 I will send another patch=
 for=20
master to remove this.

3.11.0 already contains the fix. This patch is for scarthgap which still=20
3.10.0.

Thanks

Changqing

>
> On Thu, Jul 18, 2024 at 5:17=E2=80=AFAM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Backport two patches to fix following compile error:
>>
>> h5py/h5l.c: In function =E2=80=98__pyx_pf_4h5py_3h5l_9LinkProxy_12get_=
val=E2=80=99:
>> h5py/h5l.c:8152:107: error: passing argument 4 of =E2=80=98__pyx_f_4h5=
py_4defs_H5Lunpack_elink_val=E2=80=99 from incompatible pointer type [-Wi=
ncompatible-pointer-types]
>>   8152 |       __pyx_t_2 =3D __pyx_f_4h5py_4defs_H5Lunpack_elink_val(_=
_pyx_v_buf, __pyx_v_buf_size, (&__pyx_v_wtf), (&__pyx_v_ext_file_name), (=
&__pyx_v_ext_obj_name)); if (unlikely(__pyx_t_2 =3D=3D ((herr_t)((herr_t)=
-1L)))) __PYX_ERR(1, 187, __pyx_L5_error)
>>        |                                                              =
                                            ~^~~~~~~~~~~~~~~~~~~~~~~
>>        |                                                              =
                                             |
>>        |
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   ...001-Use-libc.stdint-instead-of-numpy.patch | 27 +++++++++++++++++=
++
>>   ...ast-arguments-to-H5Lunpack_elink_val.patch | 27 +++++++++++++++++=
++
>>   .../python/python3-h5py_3.10.0.bb             |  5 +++-
>>   3 files changed, 58 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/=
0001-Use-libc.stdint-instead-of-numpy.patch
>>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/=
0002-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Use=
-libc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python=
/python3-h5py/0001-Use-libc.stdint-instead-of-numpy.patch
>> new file mode 100644
>> index 000000000..3c55fa697
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Use-libc.s=
tdint-instead-of-numpy.patch
>> @@ -0,0 +1,27 @@
>> +From 434e1bf4ab9fa53ec1293cde86f4dbec6784e50f Mon Sep 17 00:00:00 200=
1
>> +From: Orion Poplawski<orion@nwra.com>
>> +Date: Thu, 22 Feb 2024 08:41:17 -0700
>> +Subject: [PATCH 1/2] Use libc.stdint instead of numpy
>> +
>> +Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2382/com=
mits/387a22b8c1513800c0401f496b4ed512c1639798]
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + h5py/api_types_ext.pxd                   | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
>> +index 91acb128..55a239f5 100644
>> +--- a/h5py/api_types_ext.pxd
>> ++++ b/h5py/api_types_ext.pxd
>> +@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, st=
rncpy, strcmp,\
>> + ctypedef long size_t
>> + from libc.time cimport time_t
>> +
>> +-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint=
32_t, int64_t, uint64_t
>> ++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t=
, uint32_t, int64_t, uint64_t
>> +
>> + IF UNAME_SYSNAME !=3D "Windows":
>> +     cdef extern from "unistd.h":
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Pro=
perly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-d=
evtools/python/python3-h5py/0002-Properly-cast-arguments-to-H5Lunpack_eli=
nk_val.patch
>> new file mode 100644
>> index 000000000..0f77f745a
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Properly-c=
ast-arguments-to-H5Lunpack_elink_val.patch
>> @@ -0,0 +1,27 @@
>> +From 9ed4f80fd482e135119086fb2015ca97dce306ae Mon Sep 17 00:00:00 200=
1
>> +From: Orion Poplawski<orion@nwra.com>
>> +Date: Thu, 15 Feb 2024 20:47:50 -0700
>> +Subject: [PATCH 2/2] Properly cast arguments to H5Lunpack_elink_val
>> +
>> +Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2380/com=
mits/704e13ac83b42898514610c4df9f32f367e767e4]
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + h5py/h5l.pyx         | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
>> +index 60b252fa..af725bdb 100644
>> +--- a/h5py/h5l.pyx
>> ++++ b/h5py/h5l.pyx
>> +@@ -184,7 +184,7 @@ cdef class LinkProxy:
>> +             if info.type =3D=3D H5L_TYPE_SOFT:
>> +                 py_retval =3D buf
>> +             else:
>> +-                H5Lunpack_elink_val(buf, buf_size, &wtf, &ext_file_n=
ame, &ext_obj_name)
>> ++                H5Lunpack_elink_val(buf, buf_size, &wtf, <const char=
 **>&ext_file_name, <const char **>&ext_obj_name)
>> +                 py_retval =3D (bytes(ext_file_name), bytes(ext_obj_n=
ame))
>> +         finally:
>> +             efree(buf)
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.b=
b b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
>> index 8a9158525..d557a8188 100644
>> --- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
>> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D113251d71fb=
0384712c719b567261c5c"
>>   SRC_URI[sha256sum] =3D "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea=
4ba733d099605045c049"
>>
>>   SRC_URI +=3D"file://0001-setup_build.py-avoid-absolute-path.patch \ =
-=20
>> file://0001-Fix-Cython-3-compatibility.patch"
>> +file://0001-Fix-Cython-3-compatibility.patch  \
>> +file://0001-Use-libc.stdint-instead-of-numpy.patch  \
>> +file://0002-Properly-cast-arguments-to-H5Lunpack_elink_val.patch  \
>> +"
>>
>>   inherit pkgconfig pypi setuptools3
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111389):https://lists.openembedded.org/g/openembed=
ded-devel/message/111389
>> Mute This Topic:https://lists.openembedded.org/mt/107411257/3617156
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------H678q0bvTSeIHF8T1DlN2sCA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46J0NF8F017264

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 7/18/24 16:29, Martin Jansa wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdxdvV57g-E2RcvmhktjYDhTd=
LHfzK2AOrqBGi72NQw6w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

You should remove the -Wno-error flags from:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/diff/meta-python/recipes-devtools/python/python3-h5py_3.=
11.0.bb?id=3Df0c767407d033e3f39ceeccc2f7e03a1ca7a6443">https://git.openem=
bedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/pyt=
hon3-h5py_3.11.0.bb?id=3Df0c767407d033e3f39ceeccc2f7e03a1ca7a6443</a>
if your change fixes it.</pre>
    </blockquote>
    <p>You are right,&nbsp; this can be removed.&nbsp; I will send anothe=
r patch
      for master to remove this.<br>
    </p>
    <p>3.11.0 already contains the fix. This patch is for scarthgap
      which still 3.10.0.</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdxdvV57g-E2RcvmhktjYDhTd=
LHfzK2AOrqBGi72NQw6w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

On Thu, Jul 18, 2024 at 5:17=E2=80=AFAM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Backport two patches to fix following compile error:

h5py/h5l.c: In function =E2=80=98__pyx_pf_4h5py_3h5l_9LinkProxy_12get_val=
=E2=80=99:
h5py/h5l.c:8152:107: error: passing argument 4 of =E2=80=98__pyx_f_4h5py_=
4defs_H5Lunpack_elink_val=E2=80=99 from incompatible pointer type [-Winco=
mpatible-pointer-types]
 8152 |       __pyx_t_2 =3D __pyx_f_4h5py_4defs_H5Lunpack_elink_val(__pyx=
_v_buf, __pyx_v_buf_size, (&amp;__pyx_v_wtf), (&amp;__pyx_v_ext_file_name=
), (&amp;__pyx_v_ext_obj_name)); if (unlikely(__pyx_t_2 =3D=3D ((herr_t)(=
(herr_t)-1L)))) __PYX_ERR(1, 187, __pyx_L5_error)
      |                                                                  =
                                        ~^~~~~~~~~~~~~~~~~~~~~~~
      |                                                                  =
                                         |
      |

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...001-Use-libc.stdint-instead-of-numpy.patch | 27 +++++++++++++++++++
 ...ast-arguments-to-H5Lunpack_elink_val.patch | 27 +++++++++++++++++++
 .../python/python3-h5py_3.10.0.bb             |  5 +++-
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001=
-Use-libc.stdint-instead-of-numpy.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0002=
-Properly-cast-arguments-to-H5Lunpack_elink_val.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Use-li=
bc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python/py=
thon3-h5py/0001-Use-libc.stdint-instead-of-numpy.patch
new file mode 100644
index 000000000..3c55fa697
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Use-libc.stdi=
nt-instead-of-numpy.patch
@@ -0,0 +1,27 @@
+From 434e1bf4ab9fa53ec1293cde86f4dbec6784e50f Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
orion@nwra.com">&lt;orion@nwra.com&gt;</a>
+Date: Thu, 22 Feb 2024 08:41:17 -0700
+Subject: [PATCH 1/2] Use libc.stdint instead of numpy
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/h5py/h5py/pull/2382/commits/387a22b8c1513800c0401f496b4e=
d512c1639798">https://github.com/h5py/h5py/pull/2382/commits/387a22b8c151=
3800c0401f496b4ed512c1639798</a>]
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ h5py/api_types_ext.pxd                   | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
+index 91acb128..55a239f5 100644
+--- a/h5py/api_types_ext.pxd
++++ b/h5py/api_types_ext.pxd
+@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, strnc=
py, strcmp,\
+ ctypedef long size_t
+ from libc.time cimport time_t
+
+-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_=
t, int64_t, uint64_t
++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, u=
int32_t, int64_t, uint64_t
+
+ IF UNAME_SYSNAME !=3D &quot;Windows&quot;:
+     cdef extern from &quot;unistd.h&quot;:
+--
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Proper=
ly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-devt=
ools/python/python3-h5py/0002-Properly-cast-arguments-to-H5Lunpack_elink_=
val.patch
new file mode 100644
index 000000000..0f77f745a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Properly-cast=
-arguments-to-H5Lunpack_elink_val.patch
@@ -0,0 +1,27 @@
+From 9ed4f80fd482e135119086fb2015ca97dce306ae Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
orion@nwra.com">&lt;orion@nwra.com&gt;</a>
+Date: Thu, 15 Feb 2024 20:47:50 -0700
+Subject: [PATCH 2/2] Properly cast arguments to H5Lunpack_elink_val
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/h5py/h5py/pull/2380/commits/704e13ac83b42898514610c4df9f=
32f367e767e4">https://github.com/h5py/h5py/pull/2380/commits/704e13ac83b4=
2898514610c4df9f32f367e767e4</a>]
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ h5py/h5l.pyx         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
+index 60b252fa..af725bdb 100644
+--- a/h5py/h5l.pyx
++++ b/h5py/h5l.pyx
+@@ -184,7 +184,7 @@ cdef class LinkProxy:
+             if info.type =3D=3D H5L_TYPE_SOFT:
+                 py_retval =3D buf
+             else:
+-                H5Lunpack_elink_val(buf, buf_size, &amp;wtf, &amp;ext_f=
ile_name, &amp;ext_obj_name)
++                H5Lunpack_elink_val(buf, buf_size, &amp;wtf, &lt;const =
char **&gt;&amp;ext_file_name, &lt;const char **&gt;&amp;ext_obj_name)
+                 py_retval =3D (bytes(ext_file_name), bytes(ext_obj_name=
))
+         finally:
+             efree(buf)
+--
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb b=
/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
index 8a9158525..d557a8188 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" =
href=3D"file://LICENSE;md5=3D113251d71fb0384712c719b567261c5c">&quot;file=
://LICENSE;md5=3D113251d71fb0384712c719b567261c5c&quot;</a>
 SRC_URI[sha256sum] =3D &quot;d93adc48ceeb33347eb24a634fb787efc7ae4644e6e=
a4ba733d099605045c049&quot;

 SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-setu=
p_build.py-avoid-absolute-path.patch\-file://0001-Fix-Cython-3-compatibil=
ity.patch">&quot;file://0001-setup_build.py-avoid-absolute-path.patch \
-            file://0001-Fix-Cython-3-compatibility.patch&quot;</a>
+            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Fix-C=
ython-3-compatibility.patch">file://0001-Fix-Cython-3-compatibility.patch=
</a> \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Use-l=
ibc.stdint-instead-of-numpy.patch">file://0001-Use-libc.stdint-instead-of=
-numpy.patch</a> \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://0002-Prope=
rly-cast-arguments-to-H5Lunpack_elink_val.patch">file://0002-Properly-cas=
t-arguments-to-H5Lunpack_elink_val.patch</a> \
+&quot;

 inherit pkgconfig pypi setuptools3

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111389): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/111389">https:=
//lists.openembedded.org/g/openembedded-devel/message/111389</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107411257/3617156">https://lists.openembedded.org/mt=
/107411257/3617156</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------H678q0bvTSeIHF8T1DlN2sCA--


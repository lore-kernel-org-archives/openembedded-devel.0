Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027C6C41513
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 03:31:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.52085.1715571056802539112
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 20:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=586379d1a0=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D3F1J0025195
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 03:30:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn51adw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 03:30:55 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44D3UtPN013993;
	Mon, 13 May 2024 03:30:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn51adv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 03:30:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgEYfnpB5nW4w/o7+CcGxDVwBE1iDfPs6Zb7fJtyVl2qEUA5NbV+4C2wTAejEEZIDLo6TDDB18EcXDI17eoFkaQNyg0EmxNgUY93agETRtEYd/rZtmrEIlLZNSpaDfAxGes0GCvh0vz1YFWKCG3zQw+Qr1soy1FQfCv1cezNjhDQav76yehwXakYexqeb04R3WoI3VFJaP0QrCWU47o9+zpkSNUUBob+ziGK5JK1TUr40VgEQnng8veOjLLNkx88F3OPBsdfywSELFcsvHccVSzKEPzDApfN+1/gthBGomIpC8Sgv/KREDOB6847Vw8dBBasvqZbSZsUc/J0hHppOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOJ7ukcP4j1vp699pSNGSA/lzFi9BIsabjVNX+AX+Yc=;
 b=i7XuILd8FNAzej765EVnarWxhIHdCozDPEzqG8YMtYonN9FQgR0R6MC/MNmc9COgkhERrqsQQbwuSFrQh5VFQpHzDp3qyifzjtIEjnuihkLlZsTEcbV2JLLmdEcPITSsRw9RQf6iq+anCsO0ldIytLb/NJCRTr1t4HGpW478U9SQYCyAH25y3drjo04uLpQRoQ48FQ4VBAn0NPPJF5vTZYv88UhT9fuQj6DvhJ7DGeTQhqbdw1l+fnYEMl0pLdJyN9TKdEvIFraKCE7RI7Yyn/WWJdEXyxQIDEyTrteAAPy0/6drmmwAdpOZdr93B09OduGogQ0hyk5AudsOshM/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.48; Mon, 13 May 2024 03:30:50 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::7247:1ac4:ce30:b5c2]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::7247:1ac4:ce30:b5c2%7]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 03:30:50 +0000
Content-Type: multipart/alternative;
 boundary="------------yQ5ugJKlwcYR0RHbFGVcrALT"
Message-ID: <17619a5b-7ded-43d6-ab8b-626b428a7023@windriver.com>
Date: Mon, 13 May 2024 11:29:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] apache2: fix multilib file conflicts
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <17CD719EC1248206.5708@lists.openembedded.org>
 <20240508070649.1657864-1-kai.kang@windriver.com>
 <DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: e33fb124-c64a-4876-1908-08dc72fd1631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlJ0NEpWOGczdG9qcmxKSFFmWDBRNWkwTGdBRTFEU3VTSlNXVWMxNDZhd0RP?=
 =?utf-8?B?S2JtK0VYUisyTnNRRVJYVkpDU0FGTEh2ei9WVFY0OWxHS3FXNGNjWCtnZnk4?=
 =?utf-8?B?K0xWODRPbVdHWXBXc0Z2UEtwcFo1MDMrVnZUdTljMGNPNjZ1dCs5K3c3SDNK?=
 =?utf-8?B?YzczV1lnU2kxcXRlQUtFUElCMzI2L3VJMWtLcEVXK0FXVkh1bis4VXRiamRk?=
 =?utf-8?B?ZmcvZXR2ZWtLdUVvNHF4OWVsOTkrbWxLTHhXbXo3YXJjNStzUE1HdnhxVm5m?=
 =?utf-8?B?M04vSjJoeCtKOENBTFpRblFmdGFJYzJVZUhyRjJvQStmRUF2WWUvNllGTXM0?=
 =?utf-8?B?UWNDL0g0TzlHeDh0Z2tnYWZndUJGeDRteEh2U0w4czNpSU50bDhxWGt3UWc1?=
 =?utf-8?B?VUhhcTVyN2Q2cVNKdGhneEVpaU1SUmJPN25RVWIvVFBBNFZRMG1qOVBQdkYv?=
 =?utf-8?B?TitUR0EvTTFHUFpNbDltVThMeTNMRHM5NTdSTnNYV0kzTVE4Q3RxS25aaUJK?=
 =?utf-8?B?OTFTWnBkUnF2cW9vaFVYYkVUUkJVdTdkM3Z5Uzc1Y0Y3UDU1c1NYQXRCTmpt?=
 =?utf-8?B?SGxkY3BrNWpENXBsRGQ3cURqczNwK2NqVE12R2Z6S3hwTW16RElYRXJyR055?=
 =?utf-8?B?a0JENHJOdDkyQ1RINno5dGpMSnhCditKRUpKaUNyOTk5ckt3aGp0Y3BYMHFp?=
 =?utf-8?B?UHpoMkZJamwzWTl5RWZ0dlJmbWZFaG43ZmRJemJzQ2pMOXhqVFNMcGpYQWFG?=
 =?utf-8?B?Q3Q3UnMwN3pqRTBDbUxrZC9tNkg2eDhWUzRRL0xrUmtpZEVyc1Z5Z0VPWUdm?=
 =?utf-8?B?VlZIVk1Nak9oVlNvaDlTNkJtVk84aituYThTMmQ3M2c0ZnBnOWhFZktwMFVx?=
 =?utf-8?B?KzdYN2J3dGV5VjRYTktFVkFvZnF5V1crWDJYdzNZMXVMUmxyb3FJYk5wNyt1?=
 =?utf-8?B?T2tTdGJ6b280UGZHRlBHdlNrdTFLbVpzeldXcEIvekw0Y1llTVpwN05rWkRR?=
 =?utf-8?B?SUpnZXlyYm5MQW14WnZuT1AwTTZCRTJOU0laUkVrU1lOZE5Ic3c4V3FsV0Vl?=
 =?utf-8?B?VnVmVnlDVHo2RTZQb2ZHOTI5SWNkYUs0YXRMVUlhMGJaRldzL3RuL3BJRmZY?=
 =?utf-8?B?aFRTN1JaaURqS3p6ZzRRRjRXT3BIQkN4WjRRVXg0bDZ6ZWpjemF6bDJ3MHE3?=
 =?utf-8?B?NSs1dGswQWVwald4aFpIMWVGTkxQUzlwTXU4cU1wc3ZRelpPNTlobHdLbnZp?=
 =?utf-8?B?eUZDdjhRRTE1ZTN2S0wzVVVRZDU1QjkrdHVpYTdnNjlxdmw0MktMZzF6KzZS?=
 =?utf-8?B?MWZDL2ZKSjRDS005M0hNREFQMzkyVkhFdDVnSEVMQ1J3WDdod3p1ekJxb0k4?=
 =?utf-8?B?ZkhjRHBWVVBuUWNPU09MM25VWm1vN0RIZTRQbnkyYmx0V254VTNDd2RZTzdB?=
 =?utf-8?B?QjBob3ZKUXhGTFhiSVhtNnZUdHpKTVcvK0FVTS9FK21mWDFTcTB1ZjhYRFZ3?=
 =?utf-8?B?azc5SFZldXZHakdkcVpOUlFjNm9hNjFYV2RCbEU5ODhlMlAyaGJRZjErbW8z?=
 =?utf-8?B?K1BoNHBRcXU5NDJFT2huZUhZK1RHQ2hzMUdPWElHNk8zL2tvTnNKVEhEbXAx?=
 =?utf-8?B?TDdQcUpXSHlQa21IU2JkcVNJZ0tWdlE3Z3VkSnFsbXk5dHREejBnbkp2MnZa?=
 =?utf-8?B?aGlGUXlBbjhwcytoei9DU3Z1UEZwVk9tNUF2V0ZGZHEvUHFCUk9MRGJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bW50SHJPQWFqMXBDV0ZYeHY5VGUwSGVTUEJobVRHNGFBbWxXUFhlVjY3WW9Y?=
 =?utf-8?B?R3UxQzJ6cGlHcWVGMVQ4YXFjbS9sMWFuODZHTFZrMU9aSWNxVXk5WWF5WGdY?=
 =?utf-8?B?bFVOeml3YXpsWWp1VnkwU3pFNkl5dk40QXl1bm12Y0pZRFh6V3Vld0d3WUx1?=
 =?utf-8?B?ekpCUjhqQW1WVVMvTzNnNitpdDRsRHllUDZzK3pER3crNEZCejZPdFJUeFFT?=
 =?utf-8?B?SXZINkRFR0g2Z1FDaUhqRCtzNjlqVnJjekhaWGVSeXBtbVBDOXhEallieDc5?=
 =?utf-8?B?eFIrdmdDNkFFekVvdDZGTnRnYm5FaHZ5N052YTRqU0xiS0ZFa2J2dWxLeEpE?=
 =?utf-8?B?dGJuV1RHbTNaSDB6b1F4QXhFVTR0NUF4SlcxQmxhMS9vUlVrTWZPK3QzeWZy?=
 =?utf-8?B?RWcvYW9sTUV1ekQ0WEFlMms2Rmk2bHBsY3BFWEF2UmJBNm9Dam93dXpCYUJQ?=
 =?utf-8?B?SkpHNmZ2YXJxMTJONHgzMUZQUDU2UUlFUjFvNzhRWGlxTTRCSVFIT0pMTGx1?=
 =?utf-8?B?UXdVRDdpcDA0M1lkS3A0ODV2OUFtVkVQZW1sTVZWMjBwYnFXOThsMWxmSlR6?=
 =?utf-8?B?TUk3ckwrcTFHUzl1Zk9ua3NNc0UxTG56MVNxd2FhQlBMU3VzU1k4cGJnYjlN?=
 =?utf-8?B?OEFiWEtPc3NqQlVNM1l2ZFI5Vk1LT2drTDVPY1J2cXUxaUJ3WEVDME54S2dy?=
 =?utf-8?B?aGRSc0VsM2h5d1ZmVllvOUZTTkxPUXpiOFFtRmZsN1d1RW9zRDRQQ1VpbnM2?=
 =?utf-8?B?a3NYMkhTZ3B1UmpnRG5nM2wyRWVvbFJlS0lkd3BqdFJoRnIxYmRKaVM2NW9Z?=
 =?utf-8?B?ZWZQbHl0Smd1MFpMZjU3MVNJSWw4YWcxN3JDdy94S2pIY1NwRW9ra283Rm14?=
 =?utf-8?B?Qld4MjRVcURVQmwxWmRnSEVFY1RJUUl4SFd2N3FYcmRQc1lIcDZmTk1tRkEr?=
 =?utf-8?B?Zk9yMGhaajAwYjNsa3l5NnNXaGRYWmdJYnUyS2daN1ZURUJHeXZnaDU0TG1p?=
 =?utf-8?B?K25NbnFvUUo1ZmZWak9NckluWk5DLyt6YnJGSXV4VzkybDk5NlN4bmVmeHEr?=
 =?utf-8?B?cGwrTmtpMk1ZZU1abGdQV0o3djBWTy9nSWhtRGZkL3drd2dPM2t0aXVPVmdR?=
 =?utf-8?B?cTFtVEZ0VXRyc0FDc3VwRlkrbFI2RzhtVktTaVhBaEluQjRVaGkzSkNIL3Ew?=
 =?utf-8?B?RWptc1NVamFNR3JpMDVZN284Njd2R29wRWdCUVZnK0UzUXdGVXNKTVJOeEJo?=
 =?utf-8?B?STFSaXFFdWJEcUVMdW81MXVJMDBQamt3M20yN1JFQ1VkZjVuY3NTdEhJcnpK?=
 =?utf-8?B?VEI2dy80bEg4Y0o2OUJOTWNFMkJiZGFqL1lKUUtWZ3VxRnR0bjRsWDBob05u?=
 =?utf-8?B?TVZSU1VWbEJjUHN6T0xFeGlrSi9EdGMwOE04aXpsbFpQRk9VWTBYTWZ3VHo1?=
 =?utf-8?B?NUh1SzUyWkdxNkVoMEtVOUx4dDUxRzZWT0tKcmF6Uk1SZ2ZORndxMjl0UEZN?=
 =?utf-8?B?UFdrNGY3c1dqekV4c3BTU1JGRVZkK00rWHFHVHBGNWxvK1pNRFZMS2NXZjBM?=
 =?utf-8?B?TGZvNmZpdFRLSG1HTXA4cTA3SENkcUJ2L1VSVnJ6eDRqR0V1L2dQRnBVZG43?=
 =?utf-8?B?UVlNU2pBdVpKbGdXUWtBRTdvSFY3Zm95SzkzV3NOT0s3R3Q5dmdscWliNVFX?=
 =?utf-8?B?MC81NlpyaExXYm0xSzV6cWJzV1lFN29rYk5WYmNJK3U5VldRczZyWnptYkxW?=
 =?utf-8?B?MWd6REwwU1QwOEs5UE9wRHgvTUFFY2VVTEJQQVlIUjU4VW44djNiZ1FrVk1o?=
 =?utf-8?B?S2RIZ3NqRFZ0Z0Vscng0Z3ZpNnYzd05FaUlQSHhCMWcyZjZTRDdHV0lzYm45?=
 =?utf-8?B?MW02RFc2WmJ5NC9vSFhhM2VDSTIzWDJhWG9UM2hGc0I2S0FRUTdvdW01QXlo?=
 =?utf-8?B?ckloK0k0ZmVITHI4ZERrRXVMajZxdzJSckVIU3NkYXNKcitLSlFWWHJlUVVv?=
 =?utf-8?B?L0twMVh4UStxcmJ2anNqZDdRQ01MS0kybVBvUVNsWDlXbkF0TDJveUlNUStP?=
 =?utf-8?B?NWpiRkpRN3QveVYyOHl0VVdXdWxUcFl2NVgrb2p2VmowREgzWCt4bGhBTjNp?=
 =?utf-8?Q?Y2aKySKhR26KEuLpRNML563wK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33fb124-c64a-4876-1908-08dc72fd1631
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 03:30:50.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRIkKFu+tU5/XjkCyQzsoyFhTzAX28hfU8bs52L18CGnXL6ejQ06eeubus7AjnTl0dUUMMBvTsG/crwt3OMkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
X-Proofpoint-GUID: 5kTbALmUrpsSX4JYBJiQykhMIWzDyyTe
X-Proofpoint-ORIG-GUID: Om17Hb_MjsUQBqEOrpuDDzZlH7wFSnY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_02,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 03:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110330

--------------yQ5ugJKlwcYR0RHbFGVcrALT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/24 21:59, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From:kai.kang@windriver.com  <kai.kang@windriver.com>
>> Sent: den 8 maj 2024 09:07
>> To: Peter Kjellerstedt<peter.kjellerstedt@axis.com>
>> Cc:openembedded-devel@lists.openembedded.org
>> Subject: [PATCH v3 1/1] apache2: fix multilib file conflicts
>>
>> From: Kai Kang<kai.kang@windriver.com>
>>
>> There are file conflicts of apache2 when multilib enabled:
>>
>> Error: Transaction test error:
>>    file /usr/share/apache2/build/config.nice conflicts between attempted
>>      installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>    file /usr/share/apache2/build/config_vars.mk conflicts between
>>      attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>
>> Install the 'build' directory to ${libexecdir} by setting
>> 'installbuilddir' to fix the conflicts. ${libexecdir} is not populated
>> to sysroot by default, but command apxs requires these files, then add
>> the dir to SYSROOT_DIRS to populate them.
>>
>> And inherit bbclasses multilib_script and multilib_header to fix follow
>> up conflicts:
>>
>>    file /usr/bin/apxs conflicts between attempted installs of
>>      apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>    file /usr/include/apache2/ap_config_layout.h conflicts between
>>      attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>
>> Since multilib_script inherits update-alternatives, remove it from
>> inherit line for beautification.
>>
>> Fix buildpaths warning as well:
>>
>>    WARNING: lib32-apache2-2.4.58-r0 do_package_qa: QA Issue: File /usr/share/apache2/build/config.nice
>>             in package lib32-apache2-dev contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Kai Kang<kai.kang@windriver.com>
>> ---
>>   .../recipes-httpd/apache2/apache2_2.4.59.bb   | 37 ++++++++++++-------
>>   1 file changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
>> index b96e8b4e1..59db22310 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
>> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e
>>
>>   S = "${WORKDIR}/httpd-${PV}"
>>
>> -inherit autotools update-rc.d pkgconfig systemd update-alternatives
>> +inherit autotools update-rc.d pkgconfig systemd multilib_script multilib_header
>>
>>   DEPENDS = "openssl expat pcre apr apr-util apache2-native "
>>
>> @@ -80,7 +80,9 @@ EXTRA_OECONF:class-native = "\
>>       "
>>
>>   do_configure:prepend() {
>> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
>> +    sed -i -e 's#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#' \
> I do not know if this was intentional or not, but the above changes the
> location of the CGI directory for all layouts, where it previously only
> changed the path used by the Debian layout.
>
> It is not a problem for us as we do not use it anyway (we actually
> remove it in our bbappend), but if it was intentional, it should be
> mentioned in the commit message, and if it was not intentional, then
> it should be reverted.

It is indeed to change `the CGI directory` and it has been done a long 
time ago for all layouts.
It is just update the sed pattern to make it more clear this time.

>
>> +           -e 's#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#' \
> This now works for us while using the RedHat layout.

Thanks for your feedback.

Regards,
Kai

>
>> +           ${S}/config.layout
>>   }
>>
>>   do_install:append:class-target() {
>> @@ -119,14 +121,15 @@ do_install:append:class-target() {
>>              -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
>>              -e 's,${HOSTTOOLS_DIR}/,,g' \
>>              -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
>> -           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
>> +           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${libexecdir}/${PN}/build/config_vars.mk
>>
>>       sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
>>              -e 's,${DEBUG_PREFIX_MAP},,g' \
>>              -e 's,${RECIPE_SYSROOT},,g' \
>>              -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
>>              -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
>> -           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
>> +           -e 's,${WORKDIR}/recipe-sysroot/,,g' \
>> +           -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/build/config.nice
>>
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>>           install -d ${D}${sysconfdir}/tmpfiles.d/
>> @@ -143,6 +146,8 @@ do_install:append:class-target() {
>>
>>       rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
>>       chown -R root:root ${D}
>> +
>> +    oe_multilib_header apache2/ap_config_layout.h
>>   }
>>
>>   do_install:append:class-native() {
>> @@ -152,20 +157,22 @@ do_install:append:class-native() {
>>
>>   SYSROOT_PREPROCESS_FUNCS:append:class-target = " apache_sysroot_preprocess"
>>
>> +SYSROOT_DIRS += "${libexecdir}/${PN}/build"
>> +
>>   apache_sysroot_preprocess() {
>>       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
>>       install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}
>>       install -d ${SYSROOT_DESTDIR}${sbindir}
>>       install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
>> -    sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>> -
>> -    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> +    sed -i 's!\(my $installbuilddir = \)"\(.*\)"!\1"${STAGING_DIR_HOST}\2"!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>> +
>> +    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>>   }
>>
>>   # Implications - used by update-rc.d scripts
>> @@ -178,6 +185,8 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
>>   ALTERNATIVE:${PN}-doc = "htpasswd.1"
>>   ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
>>
>> +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apxs"
>> +
>>   PACKAGES = "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
>>
>>   CONFFILES:${PN} = "${sysconfdir}/${BPN}/httpd.conf \
>> @@ -200,7 +209,7 @@ FILES:${PN}-utils = "${bindir}/ab \
>>   # We override here rather than append so that .so links are
>>   # included in the runtime package rather than here (-dev)
>>   # and to get build, icons, error into the -dev package
>> -FILES:${PN}-dev = "${datadir}/${BPN}/build \
>> +FILES:${PN}-dev = "${libexecdir}/${PN}/build \
>>                      ${datadir}/${BPN}/icons \
>>                      ${datadir}/${BPN}/error \
>>                      ${includedir}/${BPN} \
>> --
>> 2.34.1
> //Peter
>

-- 
Kai Kang
Wind River Linux

--------------yQ5ugJKlwcYR0RHbFGVcrALT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/12/24 21:59, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a> <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
Sent: den 8 maj 2024 09:07
To: Peter Kjellerstedt <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com">&lt;peter.kjellerstedt@axis.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
Subject: [PATCH v3 1/1] apache2: fix multilib file conflicts

From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

There are file conflicts of apache2 when multilib enabled:

Error: Transaction test error:
  file /usr/share/apache2/build/config.nice conflicts between attempted
    installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
  file /usr/share/apache2/build/config_vars.mk conflicts between
    attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp

Install the 'build' directory to ${libexecdir} by setting
'installbuilddir' to fix the conflicts. ${libexecdir} is not populated
to sysroot by default, but command apxs requires these files, then add
the dir to SYSROOT_DIRS to populate them.

And inherit bbclasses multilib_script and multilib_header to fix follow
up conflicts:

  file /usr/bin/apxs conflicts between attempted installs of
    apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
  file /usr/include/apache2/ap_config_layout.h conflicts between
    attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp

Since multilib_script inherits update-alternatives, remove it from
inherit line for beautification.

Fix buildpaths warning as well:

  WARNING: lib32-apache2-2.4.58-r0 do_package_qa: QA Issue: File /usr/share/apache2/build/config.nice
           in package lib32-apache2-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 .../recipes-httpd/apache2/apache2_2.4.59.bb   | 37 ++++++++++++-------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index b96e8b4e1..59db22310 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] = &quot;ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e

 S = &quot;${WORKDIR}/httpd-${PV}&quot;

-inherit autotools update-rc.d pkgconfig systemd update-alternatives
+inherit autotools update-rc.d pkgconfig systemd multilib_script multilib_header

 DEPENDS = &quot;openssl expat pcre apr apr-util apache2-native &quot;

@@ -80,7 +80,9 @@ EXTRA_OECONF:class-native = &quot;\
     &quot;

 do_configure:prepend() {
-    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
+    sed -i -e 's#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#' \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I do not know if this was intentional or not, but the above changes the 
location of the CGI directory for all layouts, where it previously only 
changed the path used by the Debian layout.

It is not a problem for us as we do not use it anyway (we actually 
remove it in our bbappend), but if it was intentional, it should be 
mentioned in the commit message, and if it was not intentional, then 
it should be reverted.</pre>
    </blockquote>
    <p>It is indeed to change `<span style="white-space: pre-wrap">the CGI directory</span>`
      and it has been done a long time ago for all layouts.<br>
      It is just update the sed pattern to make it more clear this time.<br>
    </p>
    <blockquote type="cite" cite="mid:DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+           -e 's#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#' \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This now works for us while using the RedHat layout.</pre>
    </blockquote>
    <p>Thanks for your feedback.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+           ${S}/config.layout
 }

 do_install:append:class-target() {
@@ -119,14 +121,15 @@ do_install:append:class-target() {
            -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
            -e 's,${HOSTTOOLS_DIR}/,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
-           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
+           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${libexecdir}/${PN}/build/config_vars.mk

     sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,${DEBUG_PREFIX_MAP},,g' \
            -e 's,${RECIPE_SYSROOT},,g' \
            -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
-           -e 's,&quot;.*/configure&quot;,&quot;configure&quot;,g' ${D}${datadir}/apache2/build/config.nice
+           -e 's,${WORKDIR}/recipe-sysroot/,,g' \
+           -e 's,&quot;.*/configure&quot;,&quot;configure&quot;,g' ${D}${libexecdir}/${PN}/build/config.nice

     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
@@ -143,6 +146,8 @@ do_install:append:class-target() {

     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
     chown -R root:root ${D}
+
+    oe_multilib_header apache2/ap_config_layout.h
 }

 do_install:append:class-native() {
@@ -152,20 +157,22 @@ do_install:append:class-native() {

 SYSROOT_PREPROCESS_FUNCS:append:class-target = &quot; apache_sysroot_preprocess&quot;

+SYSROOT_DIRS += &quot;${libexecdir}/${PN}/build&quot;
+
 apache_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
     install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}
     install -d ${SYSROOT_DESTDIR}${sbindir}
     install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
-    sed -i 's!my $installbuilddir = .*!my $installbuilddir = &quot;${STAGING_DIR_HOST}/${datadir}/${BPN}/build&quot;;!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
-
-    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!\(my $installbuilddir = \)&quot;\(.*\)&quot;!\1&quot;${STAGING_DIR_HOST}\2&quot;!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+
+    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
+    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
 }

 # Implications - used by update-rc.d scripts
@@ -178,6 +185,8 @@ SYSTEMD_AUTO_ENABLE:${PN} = &quot;enable&quot;
 ALTERNATIVE:${PN}-doc = &quot;htpasswd.1&quot;
 ALTERNATIVE_LINK_NAME[htpasswd.1] = &quot;${mandir}/man1/htpasswd.1&quot;

+MULTILIB_SCRIPTS = &quot;${PN}-dev:${bindir}/apxs&quot;
+
 PACKAGES = &quot;${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}&quot;

 CONFFILES:${PN} = &quot;${sysconfdir}/${BPN}/httpd.conf \
@@ -200,7 +209,7 @@ FILES:${PN}-utils = &quot;${bindir}/ab \
 # We override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
 # and to get build, icons, error into the -dev package
-FILES:${PN}-dev = &quot;${datadir}/${BPN}/build \
+FILES:${PN}-dev = &quot;${libexecdir}/${PN}/build \
                    ${datadir}/${BPN}/icons \
                    ${datadir}/${BPN}/error \
                    ${includedir}/${BPN} \
--
2.34.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
//Peter

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------yQ5ugJKlwcYR0RHbFGVcrALT--


Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ECDC25B75
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 08:43:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14980.1716281007731323814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 01:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=58718d8e6a=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L6w55H031741
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 01:43:27 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y8hueg8nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 01:43:27 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44L8hQFg013265;
	Tue, 21 May 2024 01:43:26 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y8hueg8nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6syYMO5g6WNgVjWBJxzu8gGucTUZv2DW36OeDg4v5ZTZjdU6vcb35dHXYNeAaNc9hc3VhFSEkDjjMAOdBtNF2u56lnh/5lF44JUaz+OuJbbVOxE31/h6mebU5vhEUYks3Oj7UAtEB/GG0xuWJuy1CiZmnyS4X+hcNXwIHpDi4o43ZBgf9E4LQskY01ZVp8JygC48cpEcd3+WCBQKysOSIjg0dAR+FnetP0IyKiVpWsr92L2/S7vxqHPM0aSgFiA0ezdYrVvML3UfX0Hem1eHN2CG/ueMqU6HnlPFmA3M3sJbTf8GqJUETMnekf5YPVUFqBUdHPjCwZh4VpLwdyZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct5gzVCMjDGqEUVyoQnxmI0AZsy7P6zxxagG3Ly2cM4=;
 b=PNn2fKMZoH+/r2+qIoQBpiyFg5c5FaEJywNvHgNMjR7FgppfrjjGFmJ8PmcnSh+Sh+XSPLUL3PEVIP/sNPwRNmD68LLbfos6G3pOoSTf8xdbic6Ql0sEbyPDV/Tb59/8S3v548Xz595nbPOLYprMw6m4L53eQ+e33OgLrGNZ6yL6d8eSefg6Fi5M7q1xMgwSD9GHayBUcYzPF+c0sv1PV0PO2XwwFrZhOqrTkZrh9QWR00TBjEo0jNh4jLmN8vyoqwrtNaX6Y4TEsvyJxi7yEreR2x2tCuSO0lL7eUBivnP3uZ5/xnKmryPzMA97x1PO3oxFAZ64cm/u6pVP32eRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.36; Tue, 21 May 2024 08:43:23 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::7247:1ac4:ce30:b5c2]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::7247:1ac4:ce30:b5c2%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 08:43:22 +0000
Message-ID: <3dd16eb6-c13b-4a89-8228-7a982705d8d2@windriver.com>
Date: Tue, 21 May 2024 16:43:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] apache2: fix multilib file conflicts
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <17CD719EC1248206.5708@lists.openembedded.org>
 <20240508070649.1657864-1-kai.kang@windriver.com>
 <DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <17619a5b-7ded-43d6-ab8b-626b428a7023@windriver.com>
 <DB5PR02MB10213E03D862E6062165BDECDEFE22@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <DB5PR02MB10213E03D862E6062165BDECDEFE22@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caf771b-13b1-4a71-c5ff-08dc7972127a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXhPSGxHSVNXUjBoQS9hMmRZc1ZKRjVpWk9KQUNKZVFIVkNFa3NxYncwMUN3?=
 =?utf-8?B?RElYWVJhbWo4dSt4SjdxNmJlVnNYNERqbWxZN2JSNXVnVGVwS05ZbExqYmxP?=
 =?utf-8?B?R1ByaXRJWlVkNjdqWjFFZEpFTlVXYU9idFg5OWxSUDlJUi82Q0dKN1k2anU3?=
 =?utf-8?B?WUI4QngzNzY0NVppQ2lPTXJmNUZENGxDSStKSXhDODZFcTR0bzIyaCtlTjN2?=
 =?utf-8?B?TnVkSFpCMHoyTlFERm0rZG5yVEZINFlFTmdqSmoxS1liS0VYbVFWcnlBbmN2?=
 =?utf-8?B?YjlJd0hqa3ROT1l2QTFuL0tSWFFUUElRdTVqbkJHelNKMzBCUFhJVXNYTFU2?=
 =?utf-8?B?YTdGRFlSQW1kOUJGUldlSEhFS0R6aFJKUSt0aHg1Qm1mdFEvbEtsY0ltNStI?=
 =?utf-8?B?M2E2dE1BYVZKNkl2RUhrbHFsT2ZiYXBrT2c3WEJzSzBvZDFUZ3dQTFJEQTg4?=
 =?utf-8?B?SXMvbUJQNDMrcXM2S29INjdiZXptNkdnWk81TThYV1RIbE5SNk5VSVVFVXcr?=
 =?utf-8?B?WkxXRUduajlTYjlMTVoxU2FSNmtnaE9Id0RYOVBORDJBanFrc2dKdHVvKzdT?=
 =?utf-8?B?MmxoQkhEdGFoR3ljTFJOSmxpMjJLT256enV6TWRjbWFDZkUyR2tub2tKbFEv?=
 =?utf-8?B?VENMSDdML2ErZkpjQXZ6Tk5yZ2hyaU4rcW1FYi9GNitwVjY2VkhQOUtyUDZz?=
 =?utf-8?B?eklQVzYzSC9sajBWU0ZZY3NoTjdFaWtadjBkSWV3UWp0N2RHQjE2WXlFV3ZM?=
 =?utf-8?B?eDlHWjQwRHpWTE03a0wyUHZta0Z0cnJQaHN6MkVOaUlHbzc3WFhnWEx5SkJp?=
 =?utf-8?B?RksyN21odGxBQlBTYXdwK1cxZEp1cGJla2FIVlZVWENlQlZZcGJiUGdvemxX?=
 =?utf-8?B?NFQ4clhaWWtHcDNQTGVhdHA0ZzdKRFRPZEN1NkNuTHdTSEwwaUpSRmRRM1ZZ?=
 =?utf-8?B?WmptOGhQU3oxakYzclVOVDNrdDJJL0dhT0l3WEpJNnQzWTFMQW5HcnFIYTE4?=
 =?utf-8?B?UUdoU0ZtajczTVJRZnMvQjZ4TWJ1NHBGdHVlRUx6WU5lRkxORmJqY0VtYm00?=
 =?utf-8?B?M2dtZitzN0I3QXYrbElqMTNjd1FORXZ5RjRIRUVGS3dZaFZrbjQ3cVp4dlNm?=
 =?utf-8?B?a2lWUE9OL2Q2eXBvbDV0WWZ4WllySUJLd1p2SmZYUSt2MzJJTmVLUWR0algy?=
 =?utf-8?B?cDZLZmQyMG1PL2h0Q0Y1T0JOTVltUkNZSnlDditidEhnZUVacEVSVFZwbFRE?=
 =?utf-8?B?Q21maVpVTWJpQzBRalpGaGV6TVRXN3JoRzl5b3B4VUZwcTRTVXB1aHMvTGNz?=
 =?utf-8?B?ZEg1TVpmYXNZbEpVblJjMHJoN2Q3amlQRmY4NzkwSzFXdmJELzhwZGxDNnhx?=
 =?utf-8?B?UXFXa1pRYW1Gb0R4M044WmRxMjBHYVlXNXdDbzUvT2FNYTlPbVVTSmVVQzlo?=
 =?utf-8?B?VFM1MWdqT3haempSQWI2TGgwY3VobEd6NXBxellrbCsycWpjZTdWMTVsSnpQ?=
 =?utf-8?B?WVJSaWo0V1lZRm41dFdzRDVONHZaY0liS0VMRFFuWG9KRkxxSFlFeEF6QktB?=
 =?utf-8?B?blhnQVNheGRPMDFJUmp0blVQdU80SWUyblA3SGQ4OGYvTkhVT1p1NmNld2pV?=
 =?utf-8?B?NS9wd0l3Wnd4TXFzdVBFSXE0Z0FaY2FHYU9mZ0NmdGl3ZElKTE0yNlprbmFE?=
 =?utf-8?B?SmtITERIZ2NoZkcvdk5XTzZpRUpRek4xeUREWW9WQXcwY2kxU3RpUFlRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGZDQkhXdGVPYVNWQXJ5QjJJMnNMTkxiYVVlRENhQWpBWWFCUEpnUWEwdUc2?=
 =?utf-8?B?R2Y3WEF3ak1nWVlOQUZmMVNIVEQ2TG1ZRXBTTGZUdmx0V2RKMHFBdFJrWlpi?=
 =?utf-8?B?T1FKNkc3RWc3VDA3TFcxUm9IM2ZQak02cFErbGprNzMwSjBNdFd3S3VnL1cr?=
 =?utf-8?B?OXpwVkJwVGsra3NaSGlvMDdhVEZMU3BCTW82R09XRXhxMjhoeXdrczNkeWlQ?=
 =?utf-8?B?ZmlqZU9UNUlGeVBaa3kwRy94SjcyQnc5Rmp4WmtrWndZUXlEbXl6dU9OMUoy?=
 =?utf-8?B?S2FWWWR6aUpMelF4NFIwOFM1VVdzSnNwazMxNEhtd0dBN0dHeUl5am1tUlFz?=
 =?utf-8?B?NGx3aldkdGsrRjNMdGd4aytZOFR2Y3RHUDVQMnRySlljUnU5MVJhUFhKYjBJ?=
 =?utf-8?B?MlRmMWNMQ1Q0WW9ZOEFnMG9ubFkvTUdlN3gzL3hxdVNUTFNKc0tUVGc3c1VV?=
 =?utf-8?B?QWxJdExaVmlEMzRockM1eVVvOWFjemVVQXlEVHp6N2lNb3VhWkEyTkd1NFpw?=
 =?utf-8?B?U1A1LzBNQ3RTTTJPMWk4UW1LRkQwNEZ5cjBQTXN1ejBxcXlNUnB3S2xBK3hm?=
 =?utf-8?B?S1d2VVJ4cFR1WFBxbTJKcVE3OTR3a2NoZnNabmtlbXJ6MUNMTU9qejVTMjg5?=
 =?utf-8?B?SHNEMTRvRlV2TFF3NFh5cHR3TWVaUGsyOEZaUnhnUVh2Qzg2RytPdEF2WGNx?=
 =?utf-8?B?ZVc4ckNvNWZRbXUvbnkwWTNYaHpvSHFpUVBYMUIrNjdEeGlXUWJSZHFTZ0gr?=
 =?utf-8?B?U1pCVEgrL3BVTFRQZGI0akFETitjTlVwTmQ3cFhHYWRQN0tPTHRtZlV4LzB3?=
 =?utf-8?B?RE1yZ0FmQmdrU1NPb1dRZkhlT1ZUZVdXRSs0WWlxeUt0S1hBUmQ0M1lsNjFq?=
 =?utf-8?B?THoyTWRwRmNHQkJzdERFUVFpWWRuWmFJL2dTYVQ0V1h4clZ0VDFyaElnODJX?=
 =?utf-8?B?eS9zZlh1YnlGRHJ2R0dwQjdzOVBBdXh4WFZDSmNUMlN1ZVFyRTN0OFRzQnEw?=
 =?utf-8?B?VzVSZEZhOWZtVzJNU1R1WGlmZWQxVnNLbjA0UFRCVVJ1TFhzK1E3WFZvK2VJ?=
 =?utf-8?B?TmVjL1h1V3hOMFBNd2ExMlErelZvUVRlUWMraDhkL2VKdm5Hb1Njc2Z3U1Q1?=
 =?utf-8?B?TFNWOUl5OFNaWUFoQW9UdkkyYWdmc3dESTd2MG9IcmRRU2djNU1TSjdLTzlM?=
 =?utf-8?B?SHh2aS9xUmJQaU96V3ZTbUI2ZDlSenA1UEExczJHQjRzSmZWWHh0dTg4dWVj?=
 =?utf-8?B?ZWRZS2M4UUgvNWY1ZW9FeXlsZE5aeUgvMENPN2Q1QjdNTy9zNW13TmNteXFp?=
 =?utf-8?B?NlJsT2xmNmdFWXR4cjhrYW5ScDNraUsyZDZNRmxhNUN1YThVQmUyMjlvS2w5?=
 =?utf-8?B?N3JqK2NyYllsd3JONzZVT1o0a2JkaFZxT0R4bnREd3loa09vNGRvbTExQWFz?=
 =?utf-8?B?WHNiY3dDbCs4aTJZd2dLYzVXVDQ4UUxpcU54UEUzV0hKMFNoMWtZbHVndnFJ?=
 =?utf-8?B?ZjZoTDRFOFkvYmRidE53cWd1NHp0VEdTZTloUmZvNysyajBUaG9KZmlPektO?=
 =?utf-8?B?c1doNlE4bGJZTTR5aGlLelVvWWJzbElHdjBCbVAweHE3dUtaUTAxeVduV2Fa?=
 =?utf-8?B?YlRiYzJnek56NGN6Q3FCaEF3MmRSRlcyTk1VTmZaeElaOFRqY3NMZ2g3cEJl?=
 =?utf-8?B?RHU5OEo2YVRKRUMwdm8wTTdPOE1XK21NRm5KNlRSL1NQZW5kMUF2S3lyc3Bp?=
 =?utf-8?B?blQxK3pNMWsvY3ZUbmZuYkFheWpnOHVEK2JWdU5ycVl2dFpDcm5wNys3ZFNL?=
 =?utf-8?B?YU5iRElTcU5oVW9JMEE0RGN4eWk4Tm5pSE5ac0pEbG1UVVlHUGlGYWtzQXdF?=
 =?utf-8?B?NjhSVDFHYUF5alh5UmY0OXpUcjJ0Vy9KWkYveFFFd3FqVnhwcUxNM3ZDWmJG?=
 =?utf-8?B?NHFpWXI5ZlAybUR2TVNnUVhrcDVaZmZMc1orVzdCQjU0V3JBN2piVWVGdVF0?=
 =?utf-8?B?dk9LYVJMVklvK0wrb3VPVEN5MUdoUjJHMUI1ODJXbGZrTmFFRGpJdnZUZWRF?=
 =?utf-8?B?RHZoWU1OUzBYaSs4WUhvYWo4ZFk2SGZLVEUxbTdsSjV3ZXZKdE1NVVJQTzZj?=
 =?utf-8?Q?QO3h7N/MPyjvLj0TBBh5tEKwf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caf771b-13b1-4a71-c5ff-08dc7972127a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 08:43:22.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNAPQ95F5JIpT/V0+3c1l0PtUpEFDr6G6BJOehfj5MYmCPjcTFnfgUr5rXI88d4VSXBuRaRqNLPSYFXH+aT3vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-Proofpoint-ORIG-GUID: 1W9cnHk-AZNSf0eEX2brwviS7nBR8doM
X-Proofpoint-GUID: wNQXotMBPJVnasRnmu2IizSMt559AxbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_05,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405210064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 08:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110444

On 5/13/24 18:03, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Kai <kai.kang@windriver.com>
>> Sent: den 13 maj 2024 05:29
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [PATCH v3 1/1] apache2: fix multilib file conflicts
>>
>> On 5/12/24 21:59, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: mailto:kai.kang@windriver.com mailto:kai.kang@windriver.com
>>> Sent: den 8 maj 2024 09:07
>>> To: Peter Kjellerstedt mailto:peter.kjellerstedt@axis.com
>>> Cc: mailto:openembedded-devel@lists.openembedded.org
>>> Subject: [PATCH v3 1/1] apache2: fix multilib file conflicts
>>>
>>>> From: Kai Kang mailto:kai.kang@windriver.com
>>>>
>>>> There are file conflicts of apache2 when multilib enabled:
> [snip]
>
>>>> @@ -80,7 +80,9 @@ EXTRA_OECONF:class-native = "\
>>>>       "
>>>>
>>>>   do_configure:prepend() {
>>>> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
>>>> +    sed -i -e 's#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#' \
>>> I do not know if this was intentional or not, but the above changes the
>>> location of the CGI directory for all layouts, where it previously only
>>> changed the path used by the Debian layout.
>>>
>>> It is not a problem for us as we do not use it anyway (we actually
>>> remove it in our bbappend), but if it was intentional, it should be
>>> mentioned in the commit message, and if it was not intentional, then
>>> it should be reverted.
>> It is indeed to change `the CGI directory` and it has been done a long time ago for all layouts.
> It may have been the intention, but until now, the path was only changed
> for layouts that use `${prefix}/usr/lib/cgi-bin` as cgidir, which only the
> Debian layout does. So it definitely needs to be documented as a change.

Yes, you're right. I'll revert this modification.

Regards,
Kai

>
>> It is just update the sed pattern to make it more clear this time.
> You also change `$''{libexecdir}/cgi-bin` to `${libexecdir}/cgi-bin`. This means
> that the modified file now contains the expanded value of ${libexecdir} rather
> than the unexpanded string as it did before. I do not think this is a problem
> per se, but you may as well continue to use $''{libexecdir} above and below to
> maintain the formatting of the file.
>
>>>> +           -e 's#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#' \
>>> This now works for us while using the RedHat layout.
>> Thanks for your feedback.
>>
>> Regards,
>> Kai
> //Peter
>

-- 
Kai Kang
Wind River Linux



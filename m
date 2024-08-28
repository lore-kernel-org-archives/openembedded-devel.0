Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87782C54799
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:40:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9573.1724838011944562959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8970467c12=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S6XbYu027352
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 09:40:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419pw2gm4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 09:40:10 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47S9eA92012151;
	Wed, 28 Aug 2024 09:40:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419pw2gm4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:40:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M430vQbtQTko1ieAMuHyN2OS4xA2dV9meHrQfoHs8dLe2n8LG3IlfTq+tUXMKelrFZa6asRuA7hdtUeitCWpdSYTNcD+i99yp9d9pTx094eoGqA1c1AhnZtd96qPxHciArPEwMN8lQJmgAWLmdUC3CMPqiC0LxieYakdvHDxjYJ1B2EYpr/KTTdmahDt5g+2Bfmg4Y2yRwY8U5X03slsVOinVwgHAL8cgNB8A4Bj0enB32Dm8x8E/ROCwLF4meuVJX849PEiMeYx30rBypV51wD2Z0myHJJRRc2+9DSiPiSgyhSbTZjPR8y4Gf2b4zxkUfWaZUmJk/OfrPU26eNH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2jg2Y5e9poe4Ld3Fy/vQqkgARvqv891jjaIA69HZhA=;
 b=Nm49Qeu1Btod7OS6wyH0BVdTkcNVqC1mvsnLLMv1noQLFy4uauhqllTDzlWAE6mhirca3F04yBHSiJLi1qEXGbrQWYClQveY8EYvysjopN7iOL8Oh9NFHQIO8CQBe2R9vHBSfvTEFwqQSijdROT9ThFYZpjoLa+of60OI2hE8bSXEsnxdmVaURGkEyoRex2tGwSxCwiEBeIKkUa2L5ZH0uEAyVhwOiU2RBe6zwmi859oAr7u2Nj+90sbaMPc12JY2wq/p3IRDIvI4JdFiZTnGBeHnQBNl1Wt45ozHFpZWYOtLxkt6cWxmzoeqem2Xz702BdJ+jai7pyVdbV+4mBwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.23; Wed, 28 Aug 2024 09:40:05 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7875.019; Wed, 28 Aug 2024
 09:40:05 +0000
Message-ID: <1565c9b9-7793-4abe-8848-4bc8c52ad4b3@windriver.com>
Date: Wed, 28 Aug 2024 17:39:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] lastlog2: use update-alternatives to solve
 conflicts with util-linux
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <1724833587-2225-1-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <1724833587-2225-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0082.apcprd02.prod.outlook.com
 (2603:1096:4:90::22) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec385f0-3fea-4dd5-b3de-08dcc74565be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjZUSFVFSTBENlZXbXhoQ0NLNUtGREc3U09Mb3YwU0w2UlNaMU1yeUswTWtY?=
 =?utf-8?B?cFdOakRkRE9xTDZCS3ppYlZjTWZpS05XZENvbkhqNFNTcXBzVHMxa2hzQVJR?=
 =?utf-8?B?dEp6Z3dpYjJuVnJDb203Yk90bG5kUGhxb0J5My8veitUWHVEV0tYQ2FXV1Y3?=
 =?utf-8?B?L0UxSG9QODg2UUI1anRtODN0Z20ya083QTV5aVRoYmhXRks2VzhxamYyVHZp?=
 =?utf-8?B?RTczbkFiQ2I4eUgyd0Jkc3htUVJUZXlha2VwTE5WT0p3NFRxd1FyQzUzWncv?=
 =?utf-8?B?eGQvUnhJb01DejJvc0N5eVR4N0hUSE1TNStlRmU0aC9XTVZ5eEJwMll0ZXA5?=
 =?utf-8?B?WVVuajYyNVJRSzhsUG9OZVB6N25rRkUweG04cjE0QlNqVlZEQXVkQlV2anh5?=
 =?utf-8?B?akMvaUQvdWlqcDRBd1g4QTM2R3R1TzE3Q0NWZ2FRNEYxRjdJbnNvY3hQWndr?=
 =?utf-8?B?cUNzNmZDS0FDUmdkRGNsSElld2JWbjYvbU5pRDByeTNwTEcyZEhOU0prTWVU?=
 =?utf-8?B?Q3pVVzlQYWIxUzZDM3NXUDkxVmkyYVJmQnU3KzhvS25Qa1BJTEttYnJJNWJB?=
 =?utf-8?B?bzR5ZlRFSUJMMVdsTlpLbzJndDlabmd5cnRaY1dQVEpkQmo3OU1mOFNQSzBa?=
 =?utf-8?B?dDdtdTh6ZXhVdFhHdlZXYzA1QzdLdm5na2NOQ2MyR1F6dTd6QUw1andSYjk3?=
 =?utf-8?B?cXF0LzhnTytyK1Rqb2RZRlJkbzVwVElVZ2ZDTTE0ZUFyNEdmOE9xZDMxaVpG?=
 =?utf-8?B?Mnd1aEprN0pubHVuSzlZOHdwd1I3K2Q4dFJyTWl1MjN4QTJoWWZpSTI4d2k5?=
 =?utf-8?B?QkpEL0hwem5NUEN3b0swckQvdnhnVWQ0WG8rNWVSRmNMa2lPSVJCMm1iZmdy?=
 =?utf-8?B?cnVLV2trVU1RSlJhdXU2SVREOGMwVnJib21mYWZkMktodmE5KzJDb25IaWxQ?=
 =?utf-8?B?SVFYbi93aUlScTU3SmtJbGVBTDAzRXVEL2VpU20zZkFPek1oQXdTeTdteHMy?=
 =?utf-8?B?RlNCTWpWYjdNeUVJb2FjZkMrcWJ4cXoyUmgvckZMRitPOEthZnd0R2lwSDFV?=
 =?utf-8?B?NlZXdzNmUXFMNG1RYkVSWG1xVkluRDFENktUN25XS1V3YVlPSmE1S09NR2ox?=
 =?utf-8?B?TjB6bzZhdGFiU3dnZlFRc0dCZEhGNEV1dS9NV0JyY1ZFL0MxK1ZYbWQwZ3hQ?=
 =?utf-8?B?cWs0U25sQVRmamxDU1FCSGFKMVJWZldyeGh0UXpiWGdFbGFzbVdRYkhwcUhM?=
 =?utf-8?B?ZHBUeWZqZVJ2SFlSaTFUdzNKMHlENFFLdFVKQ09na1pyRFJocEsrcGtDd3l3?=
 =?utf-8?B?TmF5MzZZRlc0R3BidmZqVmRtSlZCYUxNMkRrcm1hZ0RENGtUOVlZVklRQUJL?=
 =?utf-8?B?WWowK2l5dmRsSHlPKy8xQ3NPdlhVcFlFeEV0UnNQWTIwTU9HNm82bGlaeWhT?=
 =?utf-8?B?YzcvVEw4Q3BZT0Z2dUNhRTRRZDVmWk92c0JwWG5LdmJvYlZCdzVkOHRzaThS?=
 =?utf-8?B?RHYyWVBYMlNlUVRiRVN4WktPWFpxdzVSREZ0MThidWhtNjhuQ1diYVBKVDhF?=
 =?utf-8?B?UjFTaVVadlFXbjhicUdGb1J3NFpBOWFiNzZuUmZvTEMvY0plQnBEd3lBaFdr?=
 =?utf-8?B?MTJTSVl5K2FnVURkYzFuRnZIUVMyeVQ2Ukg2b3NjUHZKK1hDNytRWmpUdWNU?=
 =?utf-8?B?VWVkbG5hRFhKb1VqM3laOUFuOG1YTFQ4T1VpZ1ZqSmRvWG8rbGJnRWtUanVJ?=
 =?utf-8?Q?ypSdbypmliiHiXqFnI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzZRZlc4bmRWd2NCYkdsbjg3TVNzeXpHUjRxTDJhem5Rc1h3VGUrd3hZSW5t?=
 =?utf-8?B?OFJoMmd2SmgycDdGWTFkUVpZSFYxQXdRaTZ6SkVIY0k0YzRjVGhWK1RaSEFC?=
 =?utf-8?B?YnA3QVBlcjJ0M3NEbGozTFlYV080QkRIbkQ0azJCN3liWHAxTEhYV0YvTzV2?=
 =?utf-8?B?QkR3UHRpaUNvdmdyZmo4R0tjZThLSGJuaitsSFlETmN3Y1lXNkxsZG0wcWx2?=
 =?utf-8?B?VlZyb3FiNDVLL014WXFjWjh5SERYYW9zRG1vd29rcmg2cS9GdWxuaFhjM21S?=
 =?utf-8?B?T2x2ZUxMR1VuQXFhbVJoNmZhR0RpK2hKVkNUYmYxdzNLTHRrcEpsVlRRRXhh?=
 =?utf-8?B?QkhJWUpPdVA1MzNFaURGL3RwUUZtME82VG1FTjc0QkdobldSakpQa1NqZEMx?=
 =?utf-8?B?Q2JQZDZzUDdBb2FtMzZDUTZCLzdqbDdmTDFXa0lUU1BTd0hjL2JTb3EyWUo2?=
 =?utf-8?B?NFkrUFEwV2JVb3gxRU1EbXlMeVdXMzdlZTB0YVZJNzY3QVVNQUJGbEQvUUZ4?=
 =?utf-8?B?RFJQaWt1eXpJRFJHeGk1TUJscERaRXdOTFc5eVd4UG9oYUZjS1AwSU53SWp4?=
 =?utf-8?B?eVFpa09US1VXWUU0Uk9pbmJNUnpBYTlXOWlzVEc1NjFVRER3YUd1b2REWnN5?=
 =?utf-8?B?T3dKQ2VjVWpkWk12NVZBK09ENjBEbkZFUm43eTU0dzNqeXJ3NXZXNmNkT0cz?=
 =?utf-8?B?amFMY2pua2laU0p1b0pONEp5VXNCWElYMXZNWFhJc2RiQS9jakZINWthUlZN?=
 =?utf-8?B?cldLSXlkVDZPZjU4c1ZZSWpXVytDQkpIMXN5YnNQZ3F6dkdKazVnb0NBNkdv?=
 =?utf-8?B?OU04aTAxRkxxUGJUQTJCUnFLSThPYnBMV0dyQ2luanhienRrclJPeFlMVDAw?=
 =?utf-8?B?YTBTanJjbkd2Q3RQU3o5TUVwOHhlOXdUZWFNWlVLQjllaWRJR3ZmVVArREtD?=
 =?utf-8?B?c1pJc1FxdlRKY3RmSXdKNWRKYjYwdDd6c3lzU0p0aWVhdjkrdnlKSk40bHZj?=
 =?utf-8?B?RTE5eVhsb2kxNDNlSFhQRkwrMVlzMjNTRTZDRngzR21xUmhzSzdNb21udlE2?=
 =?utf-8?B?WmVmMjdkN0NDM3RGeWVmMzRONEpHUDk4MXV3UUtSRjlYL2VDd01ZT3JJamJS?=
 =?utf-8?B?MU1DWmg2TzkvK0RpZ2dkdmc1d3JmUFNJcTJsUVhuMTJ4K3NyWkJKWUpKQjZ6?=
 =?utf-8?B?YnlCQzR4MWhBbTljMVcvS1JxUHFSQjhLR2wzb2drL0FjL25la1NITlRaQmtU?=
 =?utf-8?B?dlh1dUxxVlJGNllBb09tdytUZ2NES2ZkVDFWSlBrczVubTNVd25ZSzFCaDZp?=
 =?utf-8?B?bFA4Z2NjTW9BNXVuRDNzNVkybVRDSEVXRFZ3bjhOOHBrNE10bXA0L0FqNG9v?=
 =?utf-8?B?clQ1WXJIRjFSL0ZXU0w3SVYvZ0VKNnpza3d0czcvV0pPc004bDVqNmwrUlh0?=
 =?utf-8?B?dlp3RjR0NUlkOUliRWVVbVFTQkM3TzRkZTRGSzhGZDZlcFNMNy9wS1NPd1BE?=
 =?utf-8?B?L0tSMDhzRmtkaWZ0eVZUSGY0SnRNN2QxeEV5cVFjWDNxeks5YUJnWnF6Qi9u?=
 =?utf-8?B?b3lNUUFhVVF1SWxBNGJSM0tBZkRWUGRZUWNqc2NCTjl6ek1NckxZRk9VS3ND?=
 =?utf-8?B?Ym93U1c4dnFjZGJDaWR0NlIzWU9ZOURIMWwzTndjSERPZHc0QWdtZkxvRHJ0?=
 =?utf-8?B?VU1kYitVbGR4WkNLUTBuendMdHJtTk8rVis0TnZ1c2wxbkFBSDBjYk5hUlpI?=
 =?utf-8?B?SHAzUGx0VkhXcGIrN1pSU0VTZ00ydWhjNElJdTZMb3RwWFR5dlNSQTNhN3RW?=
 =?utf-8?B?WnZHWnFNTTNzUG0xZHg4WW9pWXREWFJ1S0dvSDVyc2R6MjRVZnJ2SjBsTVJX?=
 =?utf-8?B?UmdJTGlpdUVhcmhwZWRzWTdrR3dMOEh1UGpKQVJLNmcwSEZpQ3VuNU9RVWlC?=
 =?utf-8?B?UnNkSEd3L1ZGa1ZhcDdDblVuVElpUEYwZ0UvSFoxMUdFTFp6S043dHYwM2ZY?=
 =?utf-8?B?dG4wcHpMQ0Vsd3RoMU53aWxkOVBXWGszREV2Y1lBNldkSWgvUXlTMkcxekkr?=
 =?utf-8?B?MHFEYm9GZDMvQm5wd0RrT250M0J3VUd4MzZHckV5SWU0dWlndjNyTTRGMDQ4?=
 =?utf-8?Q?6buDdLrR8C+ytnP4IAA9or76I?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec385f0-3fea-4dd5-b3de-08dcc74565be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 09:40:05.6454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF7lJlg9VQL36y/+ofjnzG8JFUNmyJBIoFC7Uzc+ZtT5FyzYcknPbYBBSlATeeU2DpIvtuAwTDs75adkRshxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-Proofpoint-ORIG-GUID: q_sENUbCPRCLhwAxDaYj_SXg3Tv1JcrV
X-Authority-Analysis: v=2.4 cv=Kucf2nWN c=1 sm=1 tr=0 ts=66cef07a cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=ei9DB_hSmLARitqlza4A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3m0cI8R8mjgJB-Sz74DFqAD5sUwt_-qU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408280069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 09:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112027

Hi,

I think we can drop this recipe as it has been merged into util-linux 
2.40. As the maintainer said: 
https://github.com/thkukuk/lastlog2/blob/main/README.md


//Yi


On 8/28/24 16:26, wangmy via lists.openembedded.org wrote:
> Error: Transaction test error:
>    file /usr/bin/lastlog2 conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64
>    file /usr/lib/security/pam_lastlog2.so conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64
>
> util-linux also uses the file '/usr/bin/lastlog2' and '/usr/lib/security/pam_lastlog2.so'.
> util-linux has a priority of 80.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
> index ebabcfd40..fb7d877e2 100644
> --- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
> +++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
> @@ -22,6 +22,15 @@ SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
>   
>   EXTRA_OEMESON = " -Dpamlibdir=${base_libdir}/security"
>   
> +inherit update-alternatives
> +
> +ALTERNATIVE:${PN} += "lastlog2 pam_lastlog2"
> +ALTERNATIVE_LINK_NAME[lastlog2] = "${bindir}/lastlog2"
> +ALTERNATIVE_TARGET[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
> +ALTERNATIVE_LINK_NAME[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
> +
> +ALTERNATIVE_PRIORITY = "100"
> +
>   do_install:append () {
>         if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
>             # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112025): https://lists.openembedded.org/g/openembedded-devel/message/112025
> Mute This Topic: https://lists.openembedded.org/mt/108138518/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


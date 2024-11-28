Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2561D6D25B
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 03:30:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.87413.1732764594242449045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 19:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=106256c687=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS2m0jt028116
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 19:29:53 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719rjc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 19:29:53 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AS3Tr9C022451;
	Wed, 27 Nov 2024 19:29:53 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719rjc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 19:29:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vphV85nSB1OCuYMjaGSjECSc3hxitL6DCebOmshZU9qaGbvzG5qcj2O29uz+YxTV+Zj8PvOr9DrDO3DnxiIEoSUfvr/+AdqppZXPQLkPy+MhG6rT8YRIiPj6Zrwm4h4lrLZ2s80hAkdnAyNyq/doDsP75Y9ia3ZlLA9/INyirDTThu0PARgGPJR5jFZEp5mo/p7uEC1vCrd69kj0kTdmftAlWY/NIzgLWA5SxKrCfDAJtHs2qMlrggBWdCvsoeMIo5MBUbPp4UzuGSqrGMRYB5SxCH5tzkHNKE79lGh8bVvJxmB4JmMNg2uXLp4o0enEZyaTKj0VFn5pWc7r4UuavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNunt4ohvyaigLAjWJ/p8n8cvp0Ecjz9oegG3W02nYg=;
 b=KpE6HKWVQkR9nqOp9P3gNLrq0dwPqhe2KTeixZPt1Cm5cC/jdQIGQOQuheD3nBo5cVq19wx1Fxcrfc2Z5DRJXrf0b4I5yWF4oY/GBpYRSJt/te7+rwqMq94e0Oe5lvUtW/QHwKmTfUlQZZ5ngDQyqnNeipoJG6KVX6wWu32ZPGUkAzUkM+TRoBLBAr3/3uickyznAP9+L4StHUNC1euVgvzR3r9rpRsQojNijh55moB7+pPGuhtHdv4MHM9Q9B07R+LMAeyDJyrZTF+w+W/CUP+Sk0/yVVfin3imdC/oVJ2/eOIUCAMLOFhwiIscOLTnHp0tSVx5P5BTDEp3sXl2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by DS0PR11MB8162.namprd11.prod.outlook.com (2603:10b6:8:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 03:29:48 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 03:29:48 +0000
Message-ID: <a3a50dd2-bb9a-45e9-a376-505dc7dfd04a@windriver.com>
Date: Thu, 28 Nov 2024 11:30:06 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
From: Bin Lan <Bin.Lan.CN@windriver.com>
Subject: new objtool warnings with gcc-14.2
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|DS0PR11MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bd0814-765c-4e38-589b-08dd0f5ce941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGJxcjg4K1R6bmpnbXp4TytqK1pieEc3VjIwcVk2WklJaEVoVitod0lEU0hJ?=
 =?utf-8?B?MDBqWXJBNEdPRFdXcVpqNFM0cmsvTVk2aDJYNG9tNVlNK3NyZFBnbmNvbzZi?=
 =?utf-8?B?Z3IyTlJZemNBM2lvNWpMMEJkRmJ3UVl0a3FQWElPd3Azc3dIMVpyUlo0cmlF?=
 =?utf-8?B?THkxUHRZTjNyemJtanIyYnYxb3c1MmpaazAxS3lFZjFWVm9pdkRPR2x4OHdD?=
 =?utf-8?B?K3pyZy9SRHQxUlhnTE9wYnhwU25WaERIRGxNMHJld3haWENhMDYyWmlSMnFs?=
 =?utf-8?B?TWgzR3lSNS9tdFh5L1FuZGkyZWZvQUNxa2luVnRTamJVdk9FamV4N0M5cWRr?=
 =?utf-8?B?dXRLN0FVSkRjZ2xjK3ZCcXJCY2VFM2dscWhMdGNmLytJN1JQNzJYZjNtN3BD?=
 =?utf-8?B?NnFPLzVGMUtqYWJUM29jOXpzbERuMFRndGZLd0pBYlV6UDhENUFHdzllaUVq?=
 =?utf-8?B?ZkszOXBzRjRUYkJXT3k4UFFsVWNOWU5EQmxYVjRJWFRKSzA2WFl3VVBVMG5w?=
 =?utf-8?B?ZHdkWGFLazAwQThOdHFIN2UxVWM4ZlFoWFlHSlRwcy8yanBTL0pFR0IvdWZY?=
 =?utf-8?B?dTdHZk1zOTgxME4yMTg0bVp2UFl5OEl4MkZlSER4N1NoT3VmTVJtWHE0VHR1?=
 =?utf-8?B?Um00dEthdU1tZ3pjV3B0VFlhT1ZLdVBSK0NSeDBnSjROLzNJY1doRk1HNEVQ?=
 =?utf-8?B?YW5lRlVmQnBnek1YNS8wRFJiekQ4dWdybDFYTDR3bkFZOGg1RWZIM0wwNzN5?=
 =?utf-8?B?ZVpBV3l0QzJDUkRpVVl1TGdndFA4UWE2bzBucDMrQkVOQzc1WFpPUlNZUmZV?=
 =?utf-8?B?ZUNUU3Y1elI5Y1NEeERFaWhZNGlxa2pRcllmNHdmR1FOOThCMGVqK2FDdEVS?=
 =?utf-8?B?cXR4ZTZZSjVTLzRHOGJWY25Zc2h0Q2svU2JXSHVjbE95K3d4MmQ5L3VRWXlY?=
 =?utf-8?B?dDF4SEU2Q3o5NGRUenUySEFnZUJXT2ZWV2pndGFEY3NteEFzZXY2RjY2NUts?=
 =?utf-8?B?T0hvK2RIVHRxcnJJRmFpRUN0WXJncWFsZm9TODUzeDdxeU9iSHEvUVFWaER5?=
 =?utf-8?B?b0wwRm5QdWFZYXlLZ2F1RnhtLzY2ZEYxbnRZRjM2bk1VYzY2Mng4QTQrMjNs?=
 =?utf-8?B?dzdsUFJERnVtamNpWitYTEo3VDZuSTZoYlhHcmxpbGhtbjkxcXVBaE84a1pB?=
 =?utf-8?B?a3pqT2lxK1JUTGsyM2tuQXMvWkZQTEhMOU9ESSticDlnQ1BhbGhRK3ZiUE56?=
 =?utf-8?B?cUhKcTJ4M1lOeHc3dlJmMFFodFJsUXFlcTY5RExXaFlaQ1NhRThKTmpBWmN2?=
 =?utf-8?B?ekNTL2lVR2pqUWd6QUk3bTl1R0M2Mnl1UlhkUzVmV3V3TkNLMFFWb2tjcTVt?=
 =?utf-8?B?MEpLM0lqY0IrYWt4R3BHME8vbWJPR2tXd0hYME1NVDRkSjhQbkZIaHFEME1h?=
 =?utf-8?B?aENHN0YyakRPU1EzVTVod2hXRU9nQm1Vb0ZTWmlwYUJHVk11a1U5SGRuREpO?=
 =?utf-8?B?RkdlU2U3bjh5RUYrZ3B6QVdhbTVKZ1BRN3hoMk1OK3BtVE1WalIvVFJkamJs?=
 =?utf-8?B?c2MvRDM4TS9qVkxMc3NyS0VyRlNISXdyK0lKM1FheXFHMDZSdUFXZEZ4dnBx?=
 =?utf-8?B?UzlMSFV6MmcrMmN6cktxUzhGZS9nSmRvMzErQ1dXUWU2ekZtWkVSdTUySzJG?=
 =?utf-8?B?MmtYRnI5bjNIQVhkd0c0cGY3Rm5pWDhEODNnMEZzQ3h3WDNPUVFRT2wzc3hX?=
 =?utf-8?Q?fvsO/R7/iocgRDVceQKyytpimRUwwFTLB1MUhv8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDhNd0hDQ3A4SlpsSnN1bjZTYmxsMGtuSWVEOUM5VmJHMEI0RzBwR091REpC?=
 =?utf-8?B?b0ViUnNaQ3BpZE1XelZPMDFpNnJJb2s1UzFqM1hZRDFPdEhDMXlpWHdUV3Uv?=
 =?utf-8?B?ZXFGSkdvLzExem9ucVUxc0pxdysrK1RVUlBxZ0xaTkU1ZjgvRVFpYTdqc2hQ?=
 =?utf-8?B?NFo4YXlGNkkrMGNTZlJ4SUJ4TXBtZDhhRU9pVGltVjNwWnNLdHlrdmpKSERr?=
 =?utf-8?B?WjFtMnRXTmxQT0FIQVZLRXlyRzhXZmpteE1XbmJrVHZYdjM1NWlTMjdaeU5i?=
 =?utf-8?B?TnFwdk5QR2FNc00wNGU2ZDhYYVFHZU5LMElZYm5sck45QlJaeFZGbktHVkho?=
 =?utf-8?B?aUpRd21BTUxuVHNyNy9XMnorS09IZVZBTHc5VndGMjRQVVZZeVR6ci9aZStE?=
 =?utf-8?B?RUI5aWEwSFl0cHJEZ0k4Z1J3Q0ErRDd1WVdRUkNkWWhvVHBjVVNvN250WSs0?=
 =?utf-8?B?UnBMZTZRSFdFaFFmREFFYWl5UEhPNlpLbTA0UFFLK2Q0Z3lxYXRGUFpBS3dP?=
 =?utf-8?B?alRHQkhNQUI4UXZxaTAxY3FESVBaZlR3NEZuUkpNbzgyUTN2RHpCYWJIb3hn?=
 =?utf-8?B?MW1YMEI5bFNYWFlqNWdIQ25iRExYMlVPUFdhOGxnSlYwUnNuQzh6cDc1VHNR?=
 =?utf-8?B?anFXOFdYOFNWTVc1eXNnbFIvUWNmTkdnK3JMak5VYUV2b3lBWjNMRHE2aDdw?=
 =?utf-8?B?d3BUVmhmaWJhZmxDVlF0MVNCS0psZnEzTjN3dnI2ZDhFbTNWQzRyU04vSE5M?=
 =?utf-8?B?eXlVMTNPSlJyNG1Za2s0L3dSV1h1ZGh2cFhTWStnRGpvdUV4cnQ3dHRlN1pw?=
 =?utf-8?B?TFU1MmlmTlJqWlJwcDZ0Qzc2Y1VGL1NZckpXcmY0dCtJekt2a2gzUmVTaU4y?=
 =?utf-8?B?S1B2RVpnc0FhQ0FrRkpLOVg3ODROQ1JBZUlQQWVlQ1R2NHJnd2VTQlY2QW9w?=
 =?utf-8?B?ZmtnNmVyMWFQWWNOVG14N0RXUCsvZjJielY4NU9WSVhsOVhmdUlFWWwwVUo4?=
 =?utf-8?B?alAwMm5ueXZxK0VtMkVlcmRId0MxaW9FWjBSQ090dm5HcjRReXdFQWJvaGlk?=
 =?utf-8?B?YTJuUDA4bmpaNDY3d2xvRWV1MHlKWEhGVFhORkRVanY5NlpaYnR3bW9RVEJh?=
 =?utf-8?B?KzdPRHoxeWdKZm9OQ2F2SlQ4dVFxejArbnVlYjIwSldSbDZYMDJVUzV4b280?=
 =?utf-8?B?TkFNN2x3cFdmUE5EL3dQb2FVeWQreXpZTWN6anNLRENtUkR2VkFqWThuckVO?=
 =?utf-8?B?dDdtOUlrUjRsL0YzcXhNYXNXMjlsbnNiSUxWRFkrTHh1MnUwRU9DTXEvTm9M?=
 =?utf-8?B?RWRleHFvSDl5QTlYemtlNGRwYkxxS2UybGs2Vmw2Rk9qQm92VFBSL3VTYVp3?=
 =?utf-8?B?TExFZGJHNkxtNHRVMWtDQlkzaUdFZWRIdmMvd01RNklJaU4rcjdyZFZ5NWxy?=
 =?utf-8?B?WlREcWZDMEFpK1ovbU5tY2NOUVhNSXhOYU1QNm5MMVJMUEtIN0kvV1o5c3Vh?=
 =?utf-8?B?VTE4RnE1WWxra2kvT0N0N05oSjZ5SGcrdmc4bVBJbWtlQmFGbUlpNWYyY0lu?=
 =?utf-8?B?MCtYMDRPQ1h4OGF5WW13ZVJadjZUTlRISEV4ZkdYZmR4djhubXNUU0QreVV5?=
 =?utf-8?B?WHJYRDNEQ1I1bmJsN0g5QS9UVWJOczMvTDJ6Y3RLL1BNNWRKaVoyckJoNTlI?=
 =?utf-8?B?b3lVS0J1QVdJVHBpWC9jR01iVjV3SU5qMVZDY0tIbmQ2VUVYRWNPU3hwYy91?=
 =?utf-8?B?RWZKZHZPRmZaKzBqU3pTY3libXdGc0ZkLzZDZ1hRT29sNGVQdnk1SkFxempU?=
 =?utf-8?B?bXU5VmMrYmRGMlR0YmNmWHlaK1ZuTWYwOUFRK0VHTlNWcEFrdUFhbkFaTkRH?=
 =?utf-8?B?ZEx4V2ZVa2d3NndxNnhnQjhxZzErb3JyZm96VG4rVXFzZDJWeGRqT3lDSlVT?=
 =?utf-8?B?dGZaNzNVdDNLRExGQlNISFlCZUtwKzNoSFVsazBlYkRpZVVjMUk5ekRhbFc5?=
 =?utf-8?B?NzlNb0JBV3ZISmZYbTRQd284VUJVWHU1N1lVV3F5NEZQTWpGak9NVmtaRHFZ?=
 =?utf-8?B?Qmk3bHEzNUgzb3FmUWs1ZUp1STNYbnJVbEMzSW0zdjV2QzBuUi9TTHBmZ2JO?=
 =?utf-8?B?RFNYbU9JS1BpWFZtMzBJekE4VEdEbDhKVVVDSFhLT01weWlacnZrYUhybytG?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bd0814-765c-4e38-589b-08dd0f5ce941
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 03:29:48.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLQL9pr3hEJLdZNwsD3DQc2W8YSoBRNIVyR6lRxf0XVoudJCawZ1mOQA7rQ0vn/vKz13ziRzFxR7e+4z1JuT7pHWmsBnRzMeEQQnDPDpCrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8162
X-Proofpoint-ORIG-GUID: -zbto6qHVqRcnNCwS-Ur63eNNEPuGf-6
X-Proofpoint-GUID: 1si4u99PrrsGl7ZeR3B7gPo-nKjhf8If
X-Authority-Analysis: v=2.4 cv=Z/8WHGRA c=1 sm=1 tr=0 ts=6747e3b1 cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=VwQbUJbxAAAA:8 a=WsHKUha7AAAA:8 a=mDV3o1hIAAAA:8 a=CtaXQbtfXXB-df8k0XIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=H4LAKuo8djmI0KOkngUh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_02,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=515 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2411280026
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AS2m0jt028116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 03:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114101

Hi,

When building linux-yocto-6.6.y with defconfig on x86-64 with gcc-14.2 ,=20
I got the following error:

 =C2=A0=C2=A0=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-in.a
 =C2=A0=C2=A0=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.a
 =C2=A0=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o
 =C2=A0=C2=A0=C2=A0 vmlinux.o: warning: objtool: .export_symbol+0x332a0: =
data=20
relocation to !ENDBR: stpcpy+0x0
 =C2=A0=C2=A0=C2=A0 OBJCOPY modules.builtin.modinfo
 =C2=A0=C2=A0=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 modules.builtin
 =C2=A0=C2=A0=C2=A0 MODPOST vmlinux.symvers

This is caused by gcc. Refer to=20
https://lore.kernel.org/lkml/20240802093552.GG39708@noisy.programming.kic=
ks-ass.net/T/

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116174#c6

The issue is fixed in GCC14.3 and GCC15.

Can we upgrade yocto gcc to 14.3? Thank you.

B.R.

Bin Lan




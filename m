Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E75FC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 07:58:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8511.1741161486107014556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Mar 2025 23:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51590ea975=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255qYXp008976
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Mar 2025 07:58:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0c4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 07:58:04 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5257w4Lo030100;
	Wed, 5 Mar 2025 07:58:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0c4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 07:58:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YejX9K3yb1RDy9YQ/N3AWQ3Bdvu0wJedYWLXoEblw1aKNyzJlzg2rmv602NQFqxxpUC32Y4qZAfvTJeVh9ZALYSl0yeGNwpwQ4hgBsWlYCX7FtQtskSa69cdFQ//242tfFGZI65MgrwKiJkTCDmpPGK/GOpoN5+EVvGzSM17/Wyv4YIYko7CC8qWjcgGm+dsJhmJYZ5JagR8mWmQx8SJ8x2aZfO3aHqlcNhhp3pLvsPSh0x8R+L7RRBNEXhPfFnYWZJGM6BCyo7CA7LSpwI7epiIJJ5FcBtNHCiq1nRBPvQpIlqOCn4lQXOa9euikM2uwwV3asHYLr/llRNn/q+nWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHVyuMN4Hw5Iik/ijsuJ131PZPkyzASh5gDwTWDTCXI=;
 b=Ypi5Q5zb2u/dfDR9lgPnySHMJn8Hihzd5wX2F5GorMkap+JaSI8eeoS0zKFMb6aUZbAGGlOpLtKLD+hplPNGv4hc6O1Ryf9g3nCP72ReVqro9H6zB6QG982ATW6r3cvAy7gkOBNj/CznoweEIlP7u5nT6c6T9/luW5YcKS+yqtJs/vKTt16pzjNy0YqIL2cdx6QtGyT8ry9HFN6LhkSdfjCKfujS4JbyvD8CntXJcZgIePS1v+VUri4M8ifcMjj4akEqbTSp1TMXpnkRhlZ3b1iqDJP2hWe+Y8tv2AEv6W1xDlRhmER6G7U5OlCjVo2c+n7zkRdsl2LWQb+p7rgLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.16; Wed, 5 Mar 2025 07:57:59 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%7]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 07:57:59 +0000
Message-ID: <1de5ac33-7f40-4cb8-9b0f-d95c5139870f@windriver.com>
Date: Wed, 5 Mar 2025 15:57:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 ->
 1.0.14
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250225034557.2148517-1-liezhi.yang@windriver.com>
 <20250225034557.2148517-2-liezhi.yang@windriver.com>
 <CA+chaQc87vMUKzdBsCe5amkpMuqsbgwQaM+F+uN6SknWvS=uJQ@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CA+chaQc87vMUKzdBsCe5amkpMuqsbgwQaM+F+uN6SknWvS=uJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DS7PR11MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 547dbfdf-b33c-4692-8f23-08dd5bbb726c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ckYrMTlKaTRsWS9iN2hBL2pmVzRrYTZvVklJRzBQaE1XQ3JubUw0UWxOOWwv?=
 =?utf-8?B?UmxlNkp4WkJXMGpiK2NBa0JRM0Exa1g0ek5Dd0JwMzROWUtLcjgvNkpOaHFQ?=
 =?utf-8?B?dE9MdVAyOHE1MyszeFdjSGdkdGcydUQ5OFRFU3orKzQvdnNjdTNmdXdGdG9p?=
 =?utf-8?B?Y2VYbkFaMk51aHpadE5KdmVxbFFTYUlVZWRzUTZDaitJa21nWkxFUlE2V2lD?=
 =?utf-8?B?S0xWcVNjaTlkaVpETVVPaXI1SWV2VWZScGhleWk2TjU2eW9xQkoyOTVTclVP?=
 =?utf-8?B?eGNpbFh3dmk1bnpRN24wc1BORFdSYlp1VXp0b1J6ejZiM2FsNlcxc1hTdVVH?=
 =?utf-8?B?M2t5K3h3dlhWazFydTN0UmpoRWJUc241SWJSVlk4S21iSU9GZ3dEaGVpQ0hI?=
 =?utf-8?B?eCtFVzB3dVNCUldRaUl4OCtXQ0tUYXUwdS9mam51UVpVcVJUSnd6czhobjZ2?=
 =?utf-8?B?YmE3UmZldmRQT29aY1h3QVZTYzBGMTVTREFBWEEvTGVrNnMrenNySHkxcUgz?=
 =?utf-8?B?OFdKcEdlKys2WUlzNmQrTUxZc0dBdjhiRXJqeXp3R2ZmWm1EbDlNdHE2UVpn?=
 =?utf-8?B?dWpHekE1YmJVbjh2TU9BNGZXdXhiZFhSR2o0RWZLOXE0d2FTVW00WkNTaWFl?=
 =?utf-8?B?QlZYc3hWeGk1NWVwZFh1ZVR4N21naGhjdE5ld21FdW9nbHZVbkc5Sy8wS2Jj?=
 =?utf-8?B?OSt3TjhsSGg0ZE9mOGVZNFFDMW9vZ3pybmNvNE1HMXBlYzRlMXAydUkzTm5Z?=
 =?utf-8?B?MUZuY1U0d3kra1N1eWQzZVZVOElDVUhDWGdrV3U5MTFmejRnZWU3ZlMvdURV?=
 =?utf-8?B?YW1mSGMzdm9pU0tqdlRIS3pNa1d2aTdDWDJsdzFlTktWRkZLZ3F2d2tpcVdY?=
 =?utf-8?B?TEU5dmFaOFFvb2tFMVRFWHZJanNoWmFhZ0xFOVJiaTN2U0FSWTFtSjIrN0dt?=
 =?utf-8?B?aXpES2VZYXZNUzZNVU5zcjZUR1BoNEphRU1iNHNtU25wcENGc2h6MGxOTUJT?=
 =?utf-8?B?VlEwT3RtbThxQ2E5NS9ZTEwzOXVkQWpvL2d6VXNKb0pkUmxBSkQ2cFJtR1Q4?=
 =?utf-8?B?dk5LVzgxc3FBWEQ4TGxCL0NTV1dqbjcwb2JvMXJEUDI0Yjc5azVqa2tEMkcr?=
 =?utf-8?B?Wm12UlpDWG5JSjNTQnFHL0tTZnZVVVNyejFHZTdIMktpcnV3VEZ4SmZaYmN1?=
 =?utf-8?B?L0NpQzlqV0dSSGpJRDN5aWJKblE1Q1V2M1k2MGJQMzBQQWZrSkF0UVorcWxW?=
 =?utf-8?B?cUNXT3lkMWdsU1dEN0RXeXdOVXh6T2Y5bHNITHQ3OTBCL3V3OGNPSkkwczNY?=
 =?utf-8?B?djRYQzh4d1RRL3JxMnAyanUxSDlseG5oSHJNYTgrcDZJb1hTaEQ1NjBYYkhx?=
 =?utf-8?B?ckE0bWw3Q3NhbHBFSlY4c0hCT2pJbVhRNEpTWWJ0Rm5tWm90SDNMWVc5SzdX?=
 =?utf-8?B?QWZGWTVjVFdBa2poU3dTM2wwR3R5UDJKUGl5SWNDQ3dvSDVaTXI2OUlORkxi?=
 =?utf-8?B?ZFFOcHJVMFU1Wm5mZXNmZHZEcWVJV3d6d1htNVpTWXBqQ2YwUHBnMUx6bVAr?=
 =?utf-8?B?dFM0N1NyUVlHK1ZYUkkxckRnMy9qUE5mZ3pPRUpmZlRDLzF4c2RobHIyaEs1?=
 =?utf-8?B?UUM3VHdJNTUvSERsYTVKaUJEaytHSGx5d0VLZW4yMm9CbEpzK2hscXpwcGdD?=
 =?utf-8?B?YVhhTjN0cU8zYjRJUFRoT2ZGTFZFZlZTbkFadzdTbFBMR2JaU3RTTkg4VU52?=
 =?utf-8?B?ZHZJRGIxTGJRakZNZ2dVWW96UUpVZk5yNklPWlE2TEFMbW9aQ244RmhIRnZu?=
 =?utf-8?B?MWtaOXcwV09kZzFMSFB6ZXBVZEhzSVN0MmN5N1lKTXpQdkhhMkxNMTRIS2g3?=
 =?utf-8?Q?HxqAM6LHG3+Lo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2JuNFhkWWVkYWxvTENMUVlrSUh0STZtWmFQYVRBVjBsM2FBTHFGUk9Ob0Zh?=
 =?utf-8?B?eWNIYmN2aWFQMUV0cDlwZG9NempkU2U0MXRaV1ZTRGg3VjBmS01lR0RGWUZP?=
 =?utf-8?B?YWxOMUV2bEdjcWV5T2ROdWJtOEZqdGF3Y3kzTkxIRklLYVZWUFk5QTQxanQ1?=
 =?utf-8?B?N1NlVXZ2Wi9GLy9RZis4R0lBSUcyUzNHSjRqOVJIRHBkbTMyeHE4azNpQytC?=
 =?utf-8?B?Wm5VMlg2ZS90SW1oQytUOVhyQ2lST0dmL2VGeE9hT2F3b2hoWFY1cjZSRzF0?=
 =?utf-8?B?STFlOWdNY05ZdjhKanRBWlZ0dVVKb2U2dktzSlRVSXRCbWxOSm1Vbkw1Y3Mz?=
 =?utf-8?B?V05oK2JoNDNqNkQrNGIyZWpRT25Jc0FmbjdxVjdza0RtUUVnMEJGOFdtSnYv?=
 =?utf-8?B?KzFIc09WYUtxNVE5V0R5cEJwRFV6ckZrWEpLaVlRWVp3WVRGRDJaR2hFVFAw?=
 =?utf-8?B?dFhZakJsbnpGQis5czFkc2M1Y1ptS2dkNlNVNW42a3RNMlFhY252cXBSS1hR?=
 =?utf-8?B?U0tKVDBmdWxPNlBXc1pONlBpdTBYd09odmFlQUtJMkZ3ZkRIZ3hzcUhLRHd4?=
 =?utf-8?B?TXdwYzZnN1h2VWxNbytubUdsZS84eWdRNUxkMXE1QmtDL3l2dys5ZlkxNzBP?=
 =?utf-8?B?ZUFNdEZWMldWQWIyVUhHTXpwanFVSWlUNkVITnQ3LzVucDZZQmRjcElIU2tO?=
 =?utf-8?B?ckJESXBmOWtZd0Z1M0hvQ2V6RHZYaHh2Vm9YV0VzWHdtYlBMQTIzOGFmZUZq?=
 =?utf-8?B?TkFBNlZ6YjFlUHFER0pOWU80aTV0UDVLaHNpcWFTUDB2OVQ5V1lmTHlXbHZ1?=
 =?utf-8?B?TW4rTndYenlwYmZSQ3c3ZWVtd1AyRHZCL1ZFdGR6RGhlYXU4SGJtbStuelBI?=
 =?utf-8?B?Z1hYQm1oZTlJdWh4bjFoMnhWMG55Z09VRG8yUFVCR2JFckZlWVJldnFoQkJZ?=
 =?utf-8?B?QjQ5cm1HaDkyaUNLaHhzdXVLZ05Rb1Q1cnVaeEN1aEhsVXZJN21wTThZT0s0?=
 =?utf-8?B?NUYzcHVKZERZbU56OVVuUUduSEpiMjFXNmFWN2gxUDFSTGl5TGQ0WFUzUmJC?=
 =?utf-8?B?RDVBT2ZQVXJ4WlYyZ2Z2WllkTG9qUi9GckYzdVNtdWx1WXhYTFFLOUV4a2tC?=
 =?utf-8?B?NDJTOXUyTzRGczh1M2l6dVcxcEYxWVhtemlmbTdXZkdxeUlYbmZYdU81MC9z?=
 =?utf-8?B?TWRNVStVYlFCemJlZ1RaNE1FMFpwRmF4dnFqbXBONFNaNmZBQnh0dnYxbHE4?=
 =?utf-8?B?T01xT1FHYXlSVTEzMHdwbi8rM0hCSHNJWGV2eDJGMTZWUDZUaU9Xc3ZvZkd6?=
 =?utf-8?B?dlpzcUtNVjlIOVBsQjhDVFdoclhibHhrZmpiTGFOZ2ZYV2pPVFcyaWM0Z1h5?=
 =?utf-8?B?V0dWZjk1WG1kOWs4bDNXdUE3RmJMK1dSQUdnbzdySGd4THlQZXdFeXdYa0pH?=
 =?utf-8?B?dTQ4UUR0T2wvUkNCMzhkOGxIWUNSeTAvUEZsdzEwM0RHUnFUaWEzYm9KNW5Z?=
 =?utf-8?B?NHBoQjdHeWVHQ25EemhjQndIYWR0SXArMmpGYlRMMUNEd3JnaXdlaDl3Zmxi?=
 =?utf-8?B?dE5LdjViOWl4amxaNTM4RVJaZlJHb1krNWE2aVViLy9KRFEzYWcrazR5SXhu?=
 =?utf-8?B?WUxkc0kyYnJPV1k0MzNUZWRSM1NRM2hONzJxRk90QVg2NEM1UkkzL3h4YXJo?=
 =?utf-8?B?SVdrQk83ZVNqK0FCNkllelVCeW12SmQ2a1dIWmRkSm94cXo2dXFEamVqenZm?=
 =?utf-8?B?Y29hd1BsQVFKQVkzaU8rZGlNMzFtMDcySmp6dVJHMHdjbVZISmN5TDBGR25a?=
 =?utf-8?B?Zmc2Q3c3QjBZSVp3dWRKM0dabnJLd3JmY0JQTWJrNzVJdHdoZTVKZ2FERnhD?=
 =?utf-8?B?cFg0WDIzeUVjUmVPOFNqTVVwVm9yNkhodnhnU09ocmhqR1VpV3J2UHNKOVBz?=
 =?utf-8?B?eGxaK2JQQ2wvMmE3aUd1OUpSdmk2enFPak1uZko5dS94Zjd5S1g1d1FlKzRO?=
 =?utf-8?B?NFpFbTQwMjFNOHl5VDZySkVjYUlFeGE0alk0STUzWisxeDVhVVRRYUpTNkN5?=
 =?utf-8?B?YkdCOHI1ZER1eS9QZ1ZoYjNPVjZPUUFXZ1JYSTRzSURaSG8xWGg0NHVla1JS?=
 =?utf-8?B?c0xmaWpmN0NyMmpqajJTbEdIaVJ4TTFBQVRUWTBWQUpsRG5RM1Z4SE5DQ1pY?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547dbfdf-b33c-4692-8f23-08dd5bbb726c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 07:57:59.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7ZI+CGyZkQnIQHjppCe90BicXgq2VTtzSxiMsyWDSJiwzar75X9WLxNktkmeGyRjgnWDuGOU2P++b/D1yo1LsPEiDelg855edoKjYx5O0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
X-Proofpoint-GUID: Ot_X7n1cFnpScvvwusOS_wZGRdFjJkRQ
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c8040d cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=fK6GX2QT4jZu5QzpFe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7O8B1b76aXhuaknpsgUOF-oG0-tNPH2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5255qYXp008976
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 07:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115743

Hi Martin,

On 3/4/25 03:13, Martin Jansa wrote:
> On Tue, Feb 25, 2025 at 4:46=E2=80=AFAM Robert Yang via lists.openembed=
ded.org
> <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * License-Update: Update links in GPLv3 (http -> https)
>>
>> * It need depend on pkg-config, udev and clang-native to build
>>
>> * Move it to dynamic-layers since now it depends on meta-clang.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../thin-provisioning-tools-crates.inc        | 124 +++++++++++++---=
--
>>   .../thin-provisioning-tools-git-crates.inc    |   0
>>   .../thin-provisioning-tools_1.0.14.bb}        |  10 +-
>>   3 files changed, 102 insertions(+), 32 deletions(-)
> ...
>=20
>> rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provi=
sioning-tools_1.0.13.bb
>> rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-prov=
isioning-tools/thin-provisioning-tools_1.0.14.bb
>> index 1d3c797244..e5a683aa0f 100644
>> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisionin=
g-tools_1.0.13.bb
>> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.0.14.bb
>> @@ -4,17 +4,23 @@ HOMEPAGE =3D "https://github.com/jthornber/thin-prov=
isioning-tools"
>>   LICENSE =3D "GPL-3.0-only"
>>   SECTION =3D "devel"
>>
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e=
440464"
>>   S =3D "${WORKDIR}/git"
>>
>>   SRC_URI =3D " \
>>       git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain=
;protocol=3Dhttps \
>>       "
>>
>> -SRCREV =3D "116c05345bed5fe727992c3458311606d5443ff6"
>> +# v1.0.14
>> +SRCREV =3D "6be3e0937800cb947f1be7c0150825f155cfca14"
>>   UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>>
>>   inherit cargo cargo-update-recipe-crates
>> +inherit pkgconfig
>> +
>> +DEPENDS +=3D "udev clang-native"
>> +
>> +export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
>=20
> This path won't be correct for multilib builds where target ${libdir}
> might be e.g. /usr/lib32 while native libdir is /usr/lib.
>=20
> Is there a reason why you haven't used STAGING_LIBDIR_NATIVE variable
> which uses correct ${libdir_native}?

I copied it from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0=
.0.29.bb.

How can I reproduce the multilib errors, please? I tried to build=20
lib32-thin-provisioning-tools with poky, it works well.

local.conf:

MACHINE =3D "qemux86-64"
require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"


// Robert

>=20
> Regards,
>=20
>>   require ${BPN}-crates.inc
>>   require ${BPN}-git-crates.inc
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115557): https://lists.openembedded.org/g/openembe=
dded-devel/message/115557
>> Mute This Topic: https://lists.openembedded.org/mt/111371873/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


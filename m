Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ED9C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:37:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78023.1749526671067259747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82562db7a4=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A303ab005589
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Jun 2025 20:37:50 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm281t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 20:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF4zzigzAnATrxDOh7SYN2ILpNXL3fy5p4TiY8AF2THjUijKqzdKF7WhqyghSIyaM1PjHdTJK6YJNOJfZtmUh8d5QcveKGdg+cB6dqw9JkKNDXuGAAa0VYJhLRnCnzSr/PQfBAlt7JY8nMjPcJo4ruInNCmwMSst9cplXpR8DW37h5uiIQTdtbjcN2EKj+mibwEAHszTMbz93zHGYYx2FxNAbYaU7fH9jOmU69GJ8XO8ABJ+e9cXDkA2R4A6cyOwwgO787l8WH7ho6GDHeV2GkHLwOSTYXesOZHcF7hB9jPXJfAXfxn/dGbBFmyL5pCZnBedYlfE/lhaMAZKNMZVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug7+jbpBeUeQ4B6ueh9Xj7mPS+DysxSofDZAM0rvsiw=;
 b=Rim0J/KfloGuAL2b94fzpf8FXfHjrlrsc3Uz0MIKCQjOKfikOB8zdrv1pqimwHs+xVbt7jKLIlQtfXBpKBXtVYtghnx5oNDAOMha5T/fHAA7TZIfLHhB0S1v4fwsMjcVa7W44ohrzuW7w5zEbPy9jIQQiBdiNroibySloYakCorTgsuTWTza5NrixytQsGKWIyXYz5j/HJC8F/DMbFCciV2cAJiGHVSqztSiGqhz+TbmHVYT6pO8+9VAaqyBPhOUXSy97keJBirg/0kmuS0NTX69yF/Ifk2n+bj4/sSkKiEsZcb3dYTV0KtBAyEgVJO7+Xm6QJci6uH5vNJVBRw8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 03:37:45 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Tue, 10 Jun 2025
 03:37:44 +0000
Content-Type: multipart/alternative;
 boundary="------------BPw42IJQGiqP8m5vB2TCCU92"
Message-ID: <759ac1dd-2bef-44b0-9f73-dc8324d5f029@windriver.com>
Date: Tue, 10 Jun 2025 11:37:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-oe][PATCH] abseil-cpp: upgrade 20240116.2
 -> 20240116.3
To: openembedded-devel@lists.openembedded.org
References: <1827F55A89124964.16252@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1827F55A89124964.16252@lists.openembedded.org>
X-ClientProxiedBy: TY4P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c435f9f-2e08-4ba2-074a-08dda7d02946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnBMdVEwejlkaVVsdG9HMzh5cFNWRFpFN25RejFXWXdmdVVDS08wWXNINTha?=
 =?utf-8?B?U0Jtb2NEVDJkTWhtUnh0YlB2QlNEdWhqMFp0ZGxGeEdNRW1nRXNISmw4VmUy?=
 =?utf-8?B?dHRMQWQvcDFWY0RrSU9kNW1VbnJKdllNbGx0M3UyVG1wVngveUJKTWovOEtP?=
 =?utf-8?B?MEhDTFVXTG5QajJZOUZjQzdJYXo2Q0ZzSThVeHdiS2ZwcEZ4YWFlQXozcDZR?=
 =?utf-8?B?bDhTcFFlTklTMnFsNXpUeFpsbWJFLysxam93eGNITHErLy9tME85VG50UEJx?=
 =?utf-8?B?enQ1L0FmOGQ2REgvS2Z3aGt0SG0zWDQyelJDUEduVzVtTkhZUUt5d2RkMnlm?=
 =?utf-8?B?NnQwTjNwU0Q2VEVqYndDbk9CUjc3cWFJTjBNUXhPa2RuSlZZcGNaQW5YaW0x?=
 =?utf-8?B?N3ZlMDFpTXVzUVRxVU8wbW10YWxNTkpKU2RzRUNUYWZUVVppVVBqT3lLRVlQ?=
 =?utf-8?B?ejZ4THpvOFlhYkl6QzlHclJ2OHlNaU5BU00rSVpyTCtoSEZDV0IvN1F2dnZB?=
 =?utf-8?B?cHlJSCtZVEU5WE1kZnVsbGJWMW9ROE1OdnlvcEhWWFhJb05zSDByOHVxR0Yv?=
 =?utf-8?B?NnR6emREdU9FdXlmMlJ5dDFuRzJ6SXFuVWRCcndvQ1ZuR0M3MzgyM3RhQ0tD?=
 =?utf-8?B?SUJuNEpEQnJIQ3JKRDVmeWo4Qy9LNjdqUWx1bnZ1eFlvWlN6VkJyeVI0cVZy?=
 =?utf-8?B?YnI2OEtFUFVXTDNCeGRXREQ5eUhFT0ptWlFzNGxGL1NsOUJERG05QU93VnF1?=
 =?utf-8?B?TWZWVWZnbUJSd2tqQW1hdmdNRW9DbllWTFlvK01oTWtjNHB1OWRSak4yaG5L?=
 =?utf-8?B?V2ZhSTIwblhCMTdtNVo2WEpWMU5abmxDMk5YQ1hsWUYyM2Mxbk40QlpUVWxH?=
 =?utf-8?B?ekwzbUZuMmZmclhMdW83MC9nR2pqR3VuNm1CMXJtOTlSN0NtZnRGdEQ1ZG9u?=
 =?utf-8?B?T1dUSUx1a1loWms5MWx2a0lwdzkwYVc1TWpLVERXeHFlbmN2cGlDM3dpdzBv?=
 =?utf-8?B?WTNCTW1OaGtheGtmM05kYWoxQVM3d0dnK2VLNVNjSGVvR1FuMlZvWkFRcTg5?=
 =?utf-8?B?b0dhajM3TnI0d1NhbXJMZXdFNVh5K2pkb1c1c3B5V1pRbU1YOXZDY1dvbVZS?=
 =?utf-8?B?alJsSlpoOHIvT1RSaHRRSmhLMXg4Z1BjNmNoY1JHWkRNU0dhODI2QmtmSHZS?=
 =?utf-8?B?clRlZDllbUpRSkRWdnJScmh3a3lPRGlqQm0yZFNzam05NkpqV05uWjBDcGNX?=
 =?utf-8?B?azV1dWZtbmJpWGtFUmV4djdzYTNGTnBWVTV4TE5NZ1JaMmNwV3J3c1VBcmwy?=
 =?utf-8?B?UHZmdStnMzEyNXZMRENaNnZocWJkRGdqNkhYZExYRjJSb3MvTmwyV2NLRzZV?=
 =?utf-8?B?RjVvTFdGUHdFRTdVakNEN2ZUTExXZk5QVG1oUjZtTlNHOGVKWGVyRTVhZDdk?=
 =?utf-8?B?ODAyN2Y4aGxHckZ0d1VsMy9HTjhFVG5tank3dHhnMmxpVFdDZlNFSmRGNlpW?=
 =?utf-8?B?UDR1VGRzMFAxdjhUQk52NUFVN2s5QlBiVnJHYW9Id1NJdEp4eklTN01MUkZV?=
 =?utf-8?B?ajR0L2tlclFEcnlUK0dVeVhBbDJmak9CcDdsbFNhVVBrdnByTHJvZ2VTN1kv?=
 =?utf-8?B?TDJhYy90VjhIK003dUdPOGorbjUwNWtiUitBU2kreFhSTXhXeHhPQkh2Wmcw?=
 =?utf-8?B?dU9tQ0JiRE5TRFgvb2tJVVB0M2hBWGVLN2xtdmlyVy8wMmNEZHVQSzl5REYz?=
 =?utf-8?B?VW9BSHVQTEV0UEtXQWhZTE5tUlpwWUpBWUZUaTRpajh4NUJmdURrd1NoL0Zq?=
 =?utf-8?B?T1BGZ2RPSGZnY0puYUM3R3c1K1YwdDJpbUlEcUJlcE5UcmQzSGFqK1JKNStU?=
 =?utf-8?Q?z2yaE9k4OT8SQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aEdOVFZxSDFvaTA1OWNsdTFuSzdWcXByMWFuWVlPTmx1dTloL1Q0cC9FQith?=
 =?utf-8?B?WlVtc0tDT2F0R1dpZUc5NnZDOFBBN09qQlMyWE5ONXB4OWhGank5V08vdWQ1?=
 =?utf-8?B?MzcvaDRCbWEwOWYxeEhGTmZyai8rR01mVkNYT05CcFQxOEpjQ1NYUk40YVl0?=
 =?utf-8?B?Z3dQVDlKMVRGV1YrK2xVNVFJcjFSRVByeXZYTG52VnA2MFZtdEJxRVl5NGZv?=
 =?utf-8?B?TTkzdWkwMWRhczBzM0NUQWJVdmFRWlNjWnFEa3J3bXNLRUkxdmtUTDY2TkE1?=
 =?utf-8?B?M3F4S09nVzJMMXllY25pTWtqZHJmOXBmZGUxUzZVcForM0FzcDlwTUNJSGJn?=
 =?utf-8?B?Q0Z1eXFrbjl6V1MyUHZqaXRDRU1GRHZoNXF1ZmVyZjR5TG1DdlNkOGFFUVp4?=
 =?utf-8?B?SXgyRVh5bjMyZUxYNTR0QjNYbnEzWGo3QmNqWWRUYVJ6ZFhUK2VZaVhFTVBs?=
 =?utf-8?B?emNrb09yN2JLTm9ZUFpQeGkxK2szeTJVVklldTE1U1BaTXV4bFAySGpsLytn?=
 =?utf-8?B?RTdJU2hGTlY1RXNlOXdaTXdEVlZqK0trQ3psRkNIN3N6Zjc3RmN5aG16SDdO?=
 =?utf-8?B?MFNTQ2hWVUoxQ0dvVUJjK1BpSVJLdGQvSDFMcE45aGt4ZGsyckN0NUhkOUo2?=
 =?utf-8?B?YXpWMk9EZXJpcjZZNW11QzRvRUh4QUx3cTNLRGUzNlQwRlZWQThoSUo4bTlI?=
 =?utf-8?B?TzlYMTR5YXNDcHRRdzhKSXpkZmJzRkdLSStENnhwK3lqUDZ4TFBUcDlpelBS?=
 =?utf-8?B?Sk5CQW1URTFyT2NIMzdmeERZR1VvUzE5c2xmd0Rxck1wRWxHRzJuZXprOU1u?=
 =?utf-8?B?R3ViNXgxZ1BJZXh1M0w1WGwrWlk2Uit5L1ZpTjJCTjBKS0tnZGVpUVl4VzNp?=
 =?utf-8?B?QWlCWndnbjdhdjFyUElLb3J5YUxCZCtFeW9OY3lEK0VFallkeGtOVEpLbGVz?=
 =?utf-8?B?TmNudVhlRTQwUWIyTjBhb3Z3RnZOTUVIeE5NSDBVaFp3ZjNhVkFrUTdOLzZk?=
 =?utf-8?B?NVh3azIzME1XZ3pYb2tQR0xGOSt2QnkvTDEzNnpUdTNlNjVidmtPVVRCYlZH?=
 =?utf-8?B?ak5jMWZDRWsyY0tINElPUng1cHFVZ25WWTIrclhiS05qblQrQWlBc3QzemFy?=
 =?utf-8?B?SnBDOUxlWm9QUjRkSllJZDhYRlpiRVB1bEt0WXdvemM1V0x5VURvQ0RuRUk0?=
 =?utf-8?B?NHRwQlJsZUI1UTlTbGhsSXJLZHRXS2RhSDBxeG1ZcCtpRURYREY2aWIvZEor?=
 =?utf-8?B?dzdMaHk2Qm1BbmNpb00rWE51TTNVVnJkN1IzNXRPd0tGT01LTFFRU3RIeEV2?=
 =?utf-8?B?cnNmQ2NRYnB4UTh1YXM5cDVSb3lvZVlUYTY0ZFR3RGo5Z3hTMG5hazh1NE8z?=
 =?utf-8?B?YTZZdkFvUkNLMjNZeWFqcHQwRGc5cmxoanlvaXBmSFhnZGpoaUhCR005aHhZ?=
 =?utf-8?B?UVd1Vk11ZU5BSlFBc0p0L1NPd2RVWTNYaEd4STM3cEVLWVhxNkVybHByc0Ji?=
 =?utf-8?B?d1YwTW5QNGhQUTVWcWUzcWRlK2doamJtUTF4ekg2VjFUeFBuSkJXc0RNOHlG?=
 =?utf-8?B?REFLNDdVTU53ZklvcGtENGZXSDhRQWFSanVxTTN0aUI1bmFrN01VZkI5c0Z4?=
 =?utf-8?B?dVZVMkFLWHJPUUk1T0I2bU5yTjd6eWl3THFrSHVyclVxUmNPRytRNGh5NUlt?=
 =?utf-8?B?UFRldUxVNWlLeVBkaVZ1RTZlRDZ3bGhjT3RSWjYrdzNZc081NFE4Qkdwck5w?=
 =?utf-8?B?SHE0dmVFd2RRdmFFMXBjVHo2eitjOFZRZE5tb2NXZW00bDd5ZXd2c05pYjlp?=
 =?utf-8?B?SHVPTjlDQldSSlRYbHkrdGNKc20xbm9Vd2FObTE1aDluNnF1dHZYZGdlTThI?=
 =?utf-8?B?UE9WWXcrOGpVZE13dFg3Q2cxVnV2S085Z2ZIcnMwRUN2QURmOW5WYU9sWEg5?=
 =?utf-8?B?TUt4czZBTVVwbkxVNllzSmtRVDJYS1Q2d05PM2NzbnhwZEpoSXpDTVYzWWNt?=
 =?utf-8?B?bzJSOGU2dk1yYnB0RE95eisrMGM2YmJxMjNRTFlkVkJoSjBMYWxvUGkzdWVi?=
 =?utf-8?B?d1pzamdSaVhMU1NnSDFpK3hNcnk0TFFSNlYzYmUyM3d1OUtXRzhpVno0Vnh2?=
 =?utf-8?B?aDhjZVUyQkM5R01QOEFIOUo3QUhvUU9CS1JReUJ0dzdYZHJiRWl2WDBvSytq?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c435f9f-2e08-4ba2-074a-08dda7d02946
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 03:37:44.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAo5e1uQIEaepekmSpU9DsU6PF3+7Bm3CBkEctpw/F4SaQ2GiP/6D5DdMpcabaH7LdByeoFZMQ5j0KLylxZoJeBFeqnxRVYthg2f7IhJ/gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
X-Proofpoint-GUID: eui39qDtmNOtSw-nmaoIYSCzf1rbJchs
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6847a88e cx=c_pps a=pU1/Lrj//ghxQlUxDlr5kg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=jw4tRSXxQ7Pzcs_geYIA:9 a=QEXdDO2ut3YA:10 a=wcLvRPt3l180-6s7sB8A:9 a=OXn1xlaRnwgk79kz:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAyNiBTYWx0ZWRfX4Ku37WjXDHwA 42UVEuS4/6lfUYjRLZT8rIpCnlKUzIs3nMgv2x8h37ROgjHrMoYvZzmkLw7g1h2OGluZ2MfYCl2 KgPovu/sAo6Vnaoq7xTIw9TU6fzsaPu4PGTzl8AKfUQE8H3Vz+IPeGpE/HVO2E1lmqK73EHasj/
 8/H2WLlT6a47vUiGxRVHLXIjr/1AzBaQdEmPELSFHDJw4/IAs15njTpVAKVHiu57u5lGxAKq7ee IYfy68Mboo5Cs8CYuaV5ajD5Il/g4vtEJyDhPUA4bCWuk/klPtlgxe7kINeejyMf/aiw1pajxy4 1RvGvzfyebppbMF2ZECN0o/Jz0pBg6qvCmCI8wM3MvC+Lc/r3xnSgOAn/mkB6/cerHWDAQmbqDh
 bFZaBNz1EUNq653xuSLvk1xjrsv6mkWQqer8tV7FjYrvIHvGr6D0fP/tf8u40ltGxnmtLjuy
X-Proofpoint-ORIG-GUID: eui39qDtmNOtSw-nmaoIYSCzf1rbJchs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117858

--------------BPw42IJQGiqP8m5vB2TCCU92
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 2/27/25 12:12, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> This upgrade include security fix for CVE-2025-0838, refer:
> https://github.com/abseil/abseil-cpp/releases?page=1
>
> git log:
> 54fac219 (tag: 20240116.3) Fix potential integer overflow in hash container create/resize (#1812)
> d7aaad83 (tag: 20240116.2) Abseil LTS Branch, Jan 2024, Patch 2 (#1650)
> 2f9e432c (tag: 20240116.1) Prepare 20240116.1 patch for Apple Privacy Manifest (#1623)
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
> rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
> index 87ab239311..11f4f3f9b7 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
> @@ -7,7 +7,7 @@ SECTION = "libs"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM ="file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
>   
> -SRCREV = "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
> +SRCREV = "54fac219c4ef0bc379dfffb0b8098725d77ac81b"
>   BRANCH = "lts_2024_01_16"
>   SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
>              file://0001-absl-always-use-asm-sgidefs.h.patch              \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115684):https://lists.openembedded.org/g/openembedded-devel/message/115684
> Mute This Topic:https://lists.openembedded.org/mt/111410177/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------BPw42IJQGiqP8m5vB2TCCU92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 2/27/25 12:12, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1827F55A89124964.16252@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

This upgrade include security fix for CVE-2025-0838, refer:
<a class="moz-txt-link-freetext" href="https://github.com/abseil/abseil-cpp/releases?page=1">https://github.com/abseil/abseil-cpp/releases?page=1</a>

git log:
54fac219 (tag: 20240116.3) Fix potential integer overflow in hash container create/resize (#1812)
d7aaad83 (tag: 20240116.2) Abseil LTS Branch, Jan 2024, Patch 2 (#1650)
2f9e432c (tag: 20240116.1) Prepare 20240116.1 patch for Apple Privacy Manifest (#1623)

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../{abseil-cpp_20240116.2.bb =&gt; abseil-cpp_20240116.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb =&gt; abseil-cpp_20240116.3.bb} (97%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
similarity index 97%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
index 87ab239311..11f4f3f9b7 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
@@ -7,7 +7,7 @@ SECTION = &quot;libs&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915">&quot;file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915&quot;</a>
 
-SRCREV = &quot;d7aaad83b488fd62bd51c81ecf16cd938532cc0a&quot;
+SRCREV = &quot;54fac219c4ef0bc379dfffb0b8098725d77ac81b&quot;
 BRANCH = &quot;lts_2024_01_16&quot;
 SRC_URI = &quot;git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            <a class="moz-txt-link-freetext" href="file://0001-absl-always-use-asm-sgidefs.h.patch">file://0001-absl-always-use-asm-sgidefs.h.patch</a>             \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#115684): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/115684">https://lists.openembedded.org/g/openembedded-devel/message/115684</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111410177/3616873">https://lists.openembedded.org/mt/111410177/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------BPw42IJQGiqP8m5vB2TCCU92--


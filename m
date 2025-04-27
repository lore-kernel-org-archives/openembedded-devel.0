Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30499C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 07:40:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22741.1745739608402480752
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 00:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62127ed986=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53R5KqOI027633
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 07:40:07 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf91cud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 07:40:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnZn+anCIDN0TJd7KBBP4RckuMYiktw7gW1IeN74n/C8p7VwTax/Tu+lVWXo3RL1265Lvcl32qSd27qjxZPJz7JzIYqyAMB520NZX0sSQ7EViO2lcsUN7J7qO1C88A6pEuXqaNFM4EJfiqXkwK3rhbFdtGshvn6QYtU3hRcs8be/Kc+7n0/KOqRUG68IX1k2r+1LhdSxjFMenD7FsrM176MoZSbVX4OD8uvZoY7eJREP8N10WFqZn2qTOeM6/LlmKccOghJmX5uqTC1kQkZukBw25tpiGmsEATpS+eupOtydWiuXQbHnTw+lV009LFOZNdCHnjf2HqLiAJilfhguPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQu0E4UM4SiZQw0GG1gSZxwm7XqBMHTQMDcN0D+BRVg=;
 b=BHdAMBIKpSI2toUD1oo08iCF9v1EJfL52zTB0eSOyrJHuEiv2IyAOOxxRaM6FYGhDCzEVlXmPKv7uZpREGZltws3RLRARH9EVS6x8rERDOTrsfVQWQybmtHIFVWcPJwcchW42tF3jX1hptyVDTv1NgEpwV8q0WjPuvZNhFO0tt7Mx2uPSYqnEvLSptXIHUNtwfZiQ4Ke+J3X2lOMEceSh7+yAg7IJHThq6NgTSKLlhuLpliGKvMzUDQG+9C/rR5+3APVduln61hLgUEZrzKNyXIibPHZAWN6ASlpRVOE/VrJ56D/hpyXcGpFyrovXNXGIA64Dqt1V32wpiahsV4lzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Sun, 27 Apr 2025 07:40:03 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 07:40:01 +0000
Message-ID: <382f1864-39e5-4c5f-8407-296c64cc7155@windriver.com>
Date: Sun, 27 Apr 2025 15:39:54 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Yi Zhao <yi.zhao@windriver.com>
Subject: About Nmap License
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: bda9e1e2-a442-452f-5ef3-08dd855eb788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWdKNTJMVjkyZnpOUlg4SVZJZUFPVzIrTzBCQ0tVN3duZEh0OUZFNWlVVHdP?=
 =?utf-8?B?WU9mOGJ0QUNUWkxNZ3JGWGJlMkc5M1JzUldqUGhsbENWaWdKVUxjSFhjZDZT?=
 =?utf-8?B?UGVOR1h0cDRxbnpUMkZTQi9iT010VzJpbFRVK1FQTWtLeTBQWU1DWU1GVjh6?=
 =?utf-8?B?WC9yZ3dYQWswYU50YjgrSUtIZ1JLK2hWWGNhRGZqS25PZlM1Q0xsdzBRRjk0?=
 =?utf-8?B?bStyN1c2bmcwZEFvcnJCcUs5alJzc3Nnb2ZQK245M2czRUhOdUNtbU9vS1pm?=
 =?utf-8?B?N1cyVmliZUVpSDFYdmdocEM3Wmp2K2ZoZkZDTUxVcURZUWJOZ3g5YkV3My9M?=
 =?utf-8?B?T1J2NXpOSFJSalY5WnJRb2FPSE5WRmZuRVFaVWF2Z3dYSmk1TkFXY3ovSEVZ?=
 =?utf-8?B?TUpoMU53cVA4cWxxalJGczdwSVlVN1lJc2MxQ3NRTGdraDg5SVBOSkwzeEk3?=
 =?utf-8?B?LzFLYVIrZU5HNWdxdzF3NjFRSUpLWE0xLzdXL3NqK1ZwaTV5VU04aEpIampQ?=
 =?utf-8?B?UDQrd2ZiL1ptTExPYlBrZEZhUU5KUTU2MkxQeUFxZFFLcVJua1VlV1J0d3dL?=
 =?utf-8?B?ZlM5UVhqejlVUGsycitWa2d4L1NVNTFCRFFqa1VQZy9RNHlKV3FNM3lmcGxk?=
 =?utf-8?B?b0V1Wm91WXd5cTFlUVJRS0FxLzZGZ2svVS9hVHVBdVlwWlZKYzVUZk5pZTVm?=
 =?utf-8?B?ZkpYY1gzRDlhMmFBWklwZWR4YWdIR0l1ckVhZ1hPZEhIUDZLWStwNFZoc21h?=
 =?utf-8?B?V040RDM3aEdsT1FOODJ0REVJZFNtVUk2Y2tiN0htY2tZdmNqOFl2YnhSM2VJ?=
 =?utf-8?B?djcwV3NTSmJXVUxmclBkakIwbzJTRVVDbHRJRFNzU3o0aEpDM2U0cGFvOU4z?=
 =?utf-8?B?SUduR3ptQTQ1WUZJSWdsRmdYSWVVMXNsTUQ0OERSeEdDQ0RId3NzRk81T2Fi?=
 =?utf-8?B?NnZnRzU1RmUySjNZdWc1YkJmNkpBMEpzTGZrcThEUmswUWRqbDRZMWNGb1k2?=
 =?utf-8?B?Zzh2K005RTFkM3FtZzNEd1UxdmxjemRoRno2cEd6UEh1dThPRS9jSUZNQ0Ux?=
 =?utf-8?B?bFJZcVZHTFVGcVpIR3ZaMmFqVmFFSGJIVHpBWXhDUFdMckpsYVN5UE5jaVJ5?=
 =?utf-8?B?Wnp0ZGg0MkROZVJFY1hnYXZwYkk5SkxEbnB4QTZQZFk2YWxiaWcrdE5sQndH?=
 =?utf-8?B?cjlFY1ZiOTJFZ3Q3UTF4VUpGQVpKMWxjZlFsbks5UUZYWWVvOVN4bWNPQTFH?=
 =?utf-8?B?SUVEZjh2WEgzN1JwWjV2YUhiK28zUlArbFhPNHl6blhyOFlZajB0Yk5sVVFP?=
 =?utf-8?B?SXhMdlNrcmFWQmxydEFwRk5VSjhZYnBIT2tabDh6L3Z3SVNHWTNQQ1padEp6?=
 =?utf-8?B?dSs1Y0ZHT0VGOVVVM3JOd1hOMGJhbTgzNEhpQ08wYVIxYmFwWkdzTFcvNElp?=
 =?utf-8?B?TnA5d0pQMHdxWXkxSUVtWEFMZGtBTmpuS2t3SnBPZWpveUNTRFRTa0FMV2FQ?=
 =?utf-8?B?a1ZsazlibXp5NE5FTUZtQjhGUWdRTSs1ZmM4Y1RDZnVtNHV0VFhCSWh3K2R0?=
 =?utf-8?B?Ymx1Mk9xSmp4VEJQOGRyWkxrb0RXcnhrc1J4WHprdDRaR1JNTE5wTXVhT0xW?=
 =?utf-8?B?R0ExKzR5bjV2WnhIczJDUURpZXFibU1KdEcwb2crb1JZL0xFMFFqOGVpWXpk?=
 =?utf-8?B?VkErbGx5dGNoL1lZei9yMjl2RGxIL01QMnBjNTl2YThCWmhqS2VSWkFGaWVR?=
 =?utf-8?B?Yk9RY29aekJwQUwwcXJkWEhqS3RwbHZON3FrOUd2bEhDcUpVakJOSE5PaURC?=
 =?utf-8?B?ZXJBYlBNRmVqUitEOWpncFFzNzJQeC9DaVQrbTRCTlYzYXdsU0JhSmlqQ3di?=
 =?utf-8?Q?Z9boyo+xR3C9z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzEyN2MxcmV4ZkxqdmJQSk9VNzBVSXFXVC9IOUVUakVacGRxbFFUTEx4ZHZw?=
 =?utf-8?B?UkUyaXc2TWthQS9YMEtCNWZicDkrVytSK0tKdllCWWNlTmh5U3UwWU1nMVNL?=
 =?utf-8?B?Sytnd1BwVElOZ2pGUjJWOGhWclRiVml2aWRNOGhSWnE1N1BqZEwrYzRicHVW?=
 =?utf-8?B?NlJDa1hEL0hJbDhDV1pxWFh5TG1pZmZPOTdPNW5KdThTbHVKZmtkeEZIODJX?=
 =?utf-8?B?U2E0Vk9nZ2pVQU5RRFZ2ZzN4Y1NiVUhIL0lSQmhid0RyTUZ5VFRFT3h5MzVJ?=
 =?utf-8?B?MERja0lLTHlDY1o1aVlqRmZmVE5vOUdyNSs3TFEyekxLUDY0TlFRRHJGaFJn?=
 =?utf-8?B?VE9wTUxtK3ZoRnF1UTduUCtvbzZIMksrNVN2VDVwRDdkTGZHd2NKREl5Wk5S?=
 =?utf-8?B?WjdMenRPTHhBbmt3cXJHeWl4b204Yk9EbkpWYkV3ZXZ3cjJLbU5KSmFBZUxn?=
 =?utf-8?B?SlBUa21rQ2xFY2tTUWNZYzZ5VTkrVENETFErTkJjOTE1ZzJmYVdVcUI2OG9n?=
 =?utf-8?B?ekxlZDFlUUtVZG1WYTcwS3JGRGlwdmd2Q1lPZWR5VHJVcmlzbFZTZU1GOUNF?=
 =?utf-8?B?VFRFeEtTemJoYVdsU3dsRWFsb3lUcjdKUVY4bkZ3UURRT1ZpeWUzWVBNNEhH?=
 =?utf-8?B?bURkVHExeURTbEdBY0pGVEE2MCs4aVRXVVArUE4ram1tU1pqN2cwMXFmY3NZ?=
 =?utf-8?B?aENKS0tmYjFXS0xpZTRFWEliZUlTRExXejZzVkNpQVBqTDUxeHI0LzhmUzdJ?=
 =?utf-8?B?ZCswbTZtS2lUdEMvV0JTNEhENk5PdGN5SW9UUG1WVmh6dndtaFRtWXlaeFdF?=
 =?utf-8?B?UENNVVBaRS8wWkFMQlR5VHRtOVVlNzdCSTM3UVNjQ0pXN1ZmdHI0SU95VmR1?=
 =?utf-8?B?NWtuNEltQ0U3ejNzZ25aVDlid2VsM2wrNjJKY29PMWZOVFZLQk40b2labG9V?=
 =?utf-8?B?VzJRallOOFBiZG94SEFKbVBsN2o4Ymo0QTlkZHhCOHRNNEdZelpqTDIyby91?=
 =?utf-8?B?TFErRXB0ZUxhV0ZnRzhQamZmUEVUNGMxNndqV0d6c3RkSktxZU4yK1NDN2pF?=
 =?utf-8?B?RzYwMzJrUDVJLzA3RExLQXFUeGlYZjlBWFVXZVh1c0dZNzFKT1MvMVdYT2gx?=
 =?utf-8?B?aVF4WTZYSjkzdDgyLzM4U3kwOWJoK3dWb3A2MkxZbGJxdW5kY0pHYVhPdGVu?=
 =?utf-8?B?QTU4d0hqMmJuU1VDTFlyenNuSlMrcDRlZnJqcEZmdFhId0tsOTluQnZqK3Rt?=
 =?utf-8?B?Q3BtVnllSmNUUzFvazNHY2M0S3BkMTlaYktPYkUyeFM4enIzSElPeHNlZisv?=
 =?utf-8?B?WStCUEU1THRMQWhTb3MyanFkS3dpWkkxa211SGc4QWRYeENwUDFNQUdHTjBD?=
 =?utf-8?B?bFdGR1JRdDQ2TGVjaERHaUFMOFozWGtVOXFlbS9ZOEFPcGErdEs4R0E2K1VN?=
 =?utf-8?B?NWlqbXBxbUlkVGhycmt5bmZsdlQvT2dRakxIMVNmTi9mbHBaQURPTDBFM2Mw?=
 =?utf-8?B?ODlBREtoQ0R4bUF5UTNXZy83OTlmVDBUcnVsTFZXNTVIVC9YRHc4bk5KUjQ0?=
 =?utf-8?B?V0FOeGlEckQ0UGdzQW5hcGU1M1B6ekMxNWtERzBCaXRwbmphbG16T0p5SCt2?=
 =?utf-8?B?alE2QmxFSHJrdFRaOFAxV1BINU9XQXNaWlljTS85UDBuUDk1SUc1WkI2K1c0?=
 =?utf-8?B?S1NSSFBhU1g4SVE0RVl5WW9PeHA5VFBHclgxWWZNNUh2d1pzUFN0ZHhKZ0Jn?=
 =?utf-8?B?VXd6NWtHQVRDZlJwd2Y3UVdxeUFyRmZBNkpkT0hHdW1NcDNoVjE0ZXJ1WFpP?=
 =?utf-8?B?cjZlZUtlZS9sdEdIWDVFcjVVMmdMVHpSYUpia1ZGc0JUUmV0eWdiYUN1cmxp?=
 =?utf-8?B?WlBRUFpac2Fza25JT0pYWXdTUnZKaDgvN1d6QW42b25leXZ0WG1la21DaU1V?=
 =?utf-8?B?WW1iNUp2SFJ2Y0Y1QW9IWXI3QmZ6L0VscXBZRVUxSXlxanNZbnh4di8zVFQx?=
 =?utf-8?B?L20vSGdldVM0YitDV2NlVGwxS3h2WTcvcTFnYjBQNDEwamkrM2lKNmVjTmZ5?=
 =?utf-8?B?dnVTR3l1TVRCS28rNVh0N1JJMThQZzIwWDBUNXBpNkZkRC9mR1k2L3YxUjhU?=
 =?utf-8?Q?O5iGI9KGzI1bDnTY4ekeJHE0P?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9e1e2-a442-452f-5ef3-08dd855eb788
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 07:40:01.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYhaCuik7fH/gltOAKYHwDdn/N/kgA1znbch8kvIYYke2UC08EzNX73iygTB6zzlnxFkWKp97Bai4jul6Jobvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-Proofpoint-GUID: BP4J3RbwxTw16gWnFJbcxY1O8NglI0eK
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680ddf57 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=auHYCxwYAAAA:8 a=07d9gI8wAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=KSb9T-wMAAAA:8 a=C5UaFJxsodUB9lOZFG8A:9 a=QEXdDO2ut3YA:10 a=sqfIHldIKiMA:10 a=67XU6oJk2Lrwzah0vfu5:22 a=e2CUPOnPG4QKp8I52DXD:22 a=KF4VuIdXkMyp4E_ug72i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA2MCBTYWx0ZWRfX3JZCqSLxjFCj 7JOkIPzplnvT+ccisqtxsWqfE+1IUqNgGD3C6tspowr/dC4N5AsH8m9C58LelMWJLIaGmn8K3Cu PlRjIfkUsCFOvYx+X7E6ccDV3KdJXoZA9Bp9P9sYWvyURrMd4bVz9iElBC0CWIAl1On8vnrWooi
 PjzUR77saACKjBaEXfSq8aGoHbAkGllzxTEkmfam4iC+hvEjZa+MsQs14b+N6n9fLZpq4OmADZH 1MglcmTaYA/ZUlag9kHoN1biWKJX0YSpSAna8wObx/xUSqr2XhkmaJD/CrPDJU08A3IZWfkRtWW 2h9rTfieFmQ1jSLuRC5HxS0nfZ1uPtMpGJXUQx1suT1Cavsk5dCV/+R2LGk6QKukuf6AouEB7Od
 RMMKBrUU8xXyGDuXMrh9rDn1QpXRF/g0qQtOidXYEu3ATxw0cSgqSFHqLBAiLdjY2pdmcAWi
X-Proofpoint-ORIG-GUID: BP4J3RbwxTw16gWnFJbcxY1O8NglI0eK
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1031
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 07:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117158

Hi all,


The nmap has changed its license to NPSL (Nmap Public Source License) 
since 7.90[1][2]. This has caused a lot of discussion, as NPSL is no 
longer considered a FLOSS license[3].

According to [1] and [4], 7.92 is the last dual-licensed version:
"Note that some releases of Nmap may fall under a previous version of 
this license, or a different license entirely. The exact terms for a 
given version of Nmap can be found in the included LICENSE or COPYING 
file. To ease the transition to the NPSL, the first three Nmap releases 
made under that license (Nmap 7.90, 7.91, and 7.92) may also be used 
under the previous Nmap license terms by anyone who prefers those. "

For other distributions, Fedora has kept nmap at 7.92[5]. Suse has kept 
7.92 in OSS repo and moved 7.93+later to Non-OSS repo[6].

So do we need add a recipe for 7.92 and set it to default build?


[1] https://nmap.org/npsl/
[2] https://lwn.net/Articles/842436/
[3] https://github.com/nmap/nmap/issues/2199
[4] https://nmap.org/changelog.html#7.92
[5] https://bugzilla.redhat.com/show_bug.cgi?id=2296006
[6] https://bugzilla.opensuse.org/show_bug.cgi?id=1211571


Thanks,

Yi




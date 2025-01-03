Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026D4E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 09:10:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26759.1735895418066728869
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 01:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3098ebf39c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038acKn006217
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jan 2025 01:10:17 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43tdg7cvtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 01:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b73voYfjsO9xuZAv9smdw1SFD+MBg88b4ke1/MtAKAillXySKD+fRcopSeWxVyEhPAoBzRz+Q1OSPSGqLvHUg8+okIORN0Vd5R2wmaqb5yJkfWGYKPHKxX4AjGIKr3gnFr3/KPWF0EKTryBnADOiCXapAFXRXgalXtSpSFLhmAct5XTEvT8SqjwWDKshDW18hJvwvSfTrCK8+PjwW6UnqElIUxDmSV7dZieG7Ch8A+quvyWKZ9/Ckw0D81nBYEbCPgG9wCQv9/qyFTCHH8MM5NZe/ZZI9gLnvJ5+NUC5FofY8CQyNmhwAaGM2n+10gz0fizJ5+vQpe5PA1Y20BMsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GhxIlQDKDS+63zhCbIJ6KB+CRCR9bI0jp0se/Ruehs=;
 b=BLANgO3Pv+hDpcqRKEx7v4as3Bl1o7BqC5jba5PiN6HNn6WtAyDo7hFg+rpyVtS4rktb5CTnvilhgx9i/RTS0tI4XSyeeT7XfG/uhcbk6QSlZzd50xZH1rTUeP4Yg5hSYdxyVooHtwmTTFgSCDdDtIF87Qnqm/0Fc2RkR8Rpe7Sb1PiGxZ0JTrXTEIH+8QY5qfL17VEcEe4Ir7nGUD3XobrzrmdgqxMBNMQWcX1xGwOt+3hn99/PdhyyVAEPAj0iOi5yV0sFNHVkTVWwZXeljq8ohggNGXAWGgX8I/CzogqmQeTpXEhqVrF+ZkEB8GWCRnkTABgntXTTV3kIglE2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 09:10:08 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 09:10:08 +0000
Content-Type: multipart/alternative;
 boundary="------------P4dh0njcschyqeUrWlbESQZ4"
Message-ID: <3710f9eb-7f24-4ecc-8513-e715d8e50328@windriver.com>
Date: Fri, 3 Jan 2025 17:10:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] lapack: fix TMPDIR reference in
 do_package_qa
To: openembedded-devel@lists.openembedded.org
References: <18172257FA34270B.1259@lists.openembedded.org>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <18172257FA34270B.1259@lists.openembedded.org>
X-ClientProxiedBy: TYAPR01CA0223.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::19) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 0062a7ac-ff38-4834-1788-08dd2bd66b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjlRZU5aUjMyTmpHMnlCbjhmZjU3WkRlUng2OXNyVHU5YW1IU3c0OFRORjdt?=
 =?utf-8?B?VmZ2RnhtMnVFbDhLT1RtbEV4eDRabEJteFhGQUNsTnI4Wm9GMnZ1L0FzU1pZ?=
 =?utf-8?B?Y0I4amgxL3RvZHdFUGNHZDhRa1M1YVMzYTRxaGdlaEhFNkZaRFJta0VIZmV1?=
 =?utf-8?B?TUJPRHBRSUVFUXNZR3J3ejBzVS9wdDFrMnBmQVB5bjA4cVN0Vy9MOTAyemN6?=
 =?utf-8?B?ZVRsVVcrdTY4dGFvcDRHUlZ1OG0xWGVON2dKZHJpd1MrUXc3Sm4rR0lqazI3?=
 =?utf-8?B?RWdvT2pCMkd6ZVpBOHFSS2lOQW80MzF4THlzU25kdUxYZHZpeVd4dDJKNVpz?=
 =?utf-8?B?YW9INE5HQ1N5TUJtQUI2aDJsdXd2cFRBSVczZWs1cHl3Z2pCenhpWUhxWk9Q?=
 =?utf-8?B?Zlc2MWI2OXpnL2dvQ0JIZ3NIWGRIcUlrRmRTNW8zcmowdjFQSzB5M1NqWWkz?=
 =?utf-8?B?UHV4TDhWVWxRL1I1VjRVTWsyRTQwdUlSdHJUcXpHdzFyQ1ZKbndEdW13RTFl?=
 =?utf-8?B?RlhsNWNkeWoxUEx1TjlGeWgvUzBqSGZCd0d2RDBoN0c5cm9IeHhLR1R1SnVa?=
 =?utf-8?B?QUFMbGUrOGk4ZDE4dko3N2xoRzhWenh3cmNXVWEwdEdHNmFIMGFLZGZsKzBm?=
 =?utf-8?B?TmNUY0gvVGVEVUowdFhZQ3RvMXcxNThLQmRNQXFyd2hZK3kyU251a2VIb3Jh?=
 =?utf-8?B?amEzNjFaRjJsOCtUOUV6cUpCTFZCZEIrOHlwM2hBdm12UDNDMDhWdzU0bU9w?=
 =?utf-8?B?U3g4a0g0bHNWTG83UWkyRERMVEhNNnJWZTM4WS9HN1FUblIzNXZ0N0hVR0hq?=
 =?utf-8?B?K3ppelpHL1lUMnUvSVAxckRzdE94aFh0N1BvZkFSUENDTkNtUUFiYVVtcWZj?=
 =?utf-8?B?bnZCZ0Q2TTJTTyt3NU9ubSs5dEpreVUzb2N5aGhubjNaRDdJMzg4aCs4SUtr?=
 =?utf-8?B?SU51L2M4empqb2ZSZTU2TzJoQm9DWEZyditmYnVCY0ZWSVFleWdGSFpocDdR?=
 =?utf-8?B?T256cUdRdVdiZHc3NkM2U29zYzI1ZzNxekJNWDF1cklEYnI3TG9kd1RSNlBu?=
 =?utf-8?B?RUQ5Q0tHY2JxRXpDOEFNZlF0RzliNElEb0xKM1dvamhJMVNUVDh4RVRMN045?=
 =?utf-8?B?SEt0SXRsRElubUxybVRsVXhlM2hsMDRDaWhvT1VhVGkxeXdqYlM4aTFlMGhx?=
 =?utf-8?B?eG1EdzdCZDR4Z2JTbjVDY0hCVThBMTk5MmlHdW9hTCtVTjdFUURlNFJYOGor?=
 =?utf-8?B?TUROSEFQa2N1M2lQUDN1UDBYUGNlLzhhdUdBMG9WMkJaNDhrQldTTXZVbjFj?=
 =?utf-8?B?K0FIWFp3dEZGSnVtR1BiSmJsbWlJU3I1NzlXL1F1UXVDL2Z1MmpMNUN5Yko0?=
 =?utf-8?B?U3dKQi9rb05ZMzc3bGJXV0tMVDZibzBqSFlwS0NnQlFRNlp6SElWc0RGWm5l?=
 =?utf-8?B?TTdVZklQcWRTRUNpQ3BQVWdrQ3diSnRuRnFSYzFjVnRQKzNtVk1reWlTcEZw?=
 =?utf-8?B?dXQrblBQMkNvTGZMbVBrZFYrRkk3ajk4VlM4Z0kxSHpSa0srMXBzamtRMzFr?=
 =?utf-8?B?a2NFcTZ6Tm5DdHRLS2Raby9LNHJXVGRYRXhrbWhTV3ZGazZKc3NLSngwazln?=
 =?utf-8?B?ZGZ6dUx0VW9oZVhkcUNNWGcxejhxbEpaYWYrbTljYkg5SUMzcEtVVmRpZ3Y2?=
 =?utf-8?B?akRMSEdydTkrbjljWlROUXhLQlM1OTJtWFNJazRnM0xOOW5LWXpsNnppUitP?=
 =?utf-8?B?K204YkJTUkZ5bktaZzgxeGp3a1FIVVhVaVpIZXpsOWJyQXpzZ3MvakFWWFNs?=
 =?utf-8?B?akdhSTZPMlBDSFJueFIzc1AzUXdsQWJNc0JZYWNHMkQweFZJNHdUN2lPcUFy?=
 =?utf-8?Q?sdqA77MEXsZTe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekZ3em5BVGNzMHV2eHV0aTJDWWxHT25ZL2c5dXhSUDcrdDQ3d2pkTzlLMkFx?=
 =?utf-8?B?aFNOQVJwZVBXQjdpcmQ0VzhyZno3dzVIYmxnTVYwSmdTcXZMSFBFOThMSi9T?=
 =?utf-8?B?bTY0dHZjMFpFd1F1cCt6dVhWc3N0YllSZSsrOVlGeXROVkMzeUNHeDRWVUoz?=
 =?utf-8?B?aFIvcVFWV21BaVRNK05JT1JYTTN6TDc5UFdISnJaYnBuRGpYemVoRnVlQjRV?=
 =?utf-8?B?YW1lSEdWd2M1YXlJeUNsUnBlOUYxZm9BTFYrN0R2b1lTWE5ybnhGSnNjdnN2?=
 =?utf-8?B?UXQ5S3F1YmFQVlJMYVVVMUNMU251U01UVEpqZXJJN3UrcU9FVnAyZ2x0QjZ3?=
 =?utf-8?B?c3Nsd3UwY1BRVXlHTWJwUjd0VXFMNlRPcDQxcWZnUU1YRktRSWYrUzYyTVdY?=
 =?utf-8?B?MkdLck0vby9xdXhUT2hzZzJNWXVxZ0gyL09DMytQaytCVzJFWVZRclRKb0ln?=
 =?utf-8?B?cUJhYTlIMHYrSUlCczFDd1huSk5WNVp5NFkwZUFPV2JzZHkvNDlCYU1YWWhB?=
 =?utf-8?B?UE9kUnY3MmJtTUZicU5EVmdnU0hNUVhsY3JXVXA2OWRacDUwVmY2RzJiZTVI?=
 =?utf-8?B?Tk02V3RUTXZzdGZhN1VrTU1FdlZUeWhLMCtHcmxVaW95YXlvcHIrVDJuZmE0?=
 =?utf-8?B?T1EzZXZTZ2kyREtQeUJhRHhUZHcrZzBucCtjUUZ0clJET2JMUlUvbXpvVU5m?=
 =?utf-8?B?bDMwRjl6S3MyNFdlM2ZmVnFzYVJzOEtua202VEZLems1alFEcGNlSkMwcm5F?=
 =?utf-8?B?NElhYVZNeXNSbkNaZVhMajBqYk1Id3B6dVVhbjIySEdBaE5zeFVrbmtjeDVM?=
 =?utf-8?B?R0RhU2pqSTJsMlZMTEJQdjBxaEFpSkdyM21qM3dMcDJxbWtuTHBydWUrSTFv?=
 =?utf-8?B?Rk16cG1qMmRUTHNJc3BKTkhCWCtGT093ZitvOGVYWWEwT0FLMm42ZSthWitU?=
 =?utf-8?B?S2lnV3RPZ2kwT0lNdytWSVpQZDlLK2pUQzQxZzJPQVY4eGRPWmd2UWE1N0lv?=
 =?utf-8?B?YWgxV01IUVcreTF3eDV6WWNSTUhFbzRwYTBlVnloZ3R6c0FqUzlidHdTdGxJ?=
 =?utf-8?B?OVMzVHRBb1NJSTZyNUtoSlZ0MUw1dVNGTWJCQkFkWXZkcTc3aFBPL3BFd08x?=
 =?utf-8?B?MUdDbElheER6TThvRURzS0RCbjBnTENPTnVoMEdGTDVhT0grR0g3RCtKQmNX?=
 =?utf-8?B?U3hqM0JNdVFLVXdWZUg1L3gyc1RnWS84NUk1UHl5TUt1ZzhjYm5lSXhwYzJm?=
 =?utf-8?B?aGhmcXQwVW5xMUJoMEtrYU5qcUM5QXdJdXJIRnBEVVVQV3B1UHVtbGpxZW9K?=
 =?utf-8?B?QXJJdENpQ09VQmJvVWpvaXBJZDRQMndXMHB2ck9VSmhDb3dlMnpxTldyeUlJ?=
 =?utf-8?B?SXdqcDhqcmozYTduaGk5NElKR1JjNkRrV3pNTjJzOU1wOXdjZEZ1MGphZjZ2?=
 =?utf-8?B?Um10V3lXWXJHekhsejU3bUNETVhkYjJ1MlZuTFcxcnltQllkV2dJckROWGw5?=
 =?utf-8?B?dFRXcXJrajZBdFBmYnhhaUJJc3NmS3RmWE5HaXRyUlJjcWRPMGZxbGdZWkpJ?=
 =?utf-8?B?RWV0R1RiSmtzc3BYREY2eDlWYzlnLzV4am0yOVFCWlMvckhueDFqbllNOGZs?=
 =?utf-8?B?UDFBMTJlS3RteUhOYzJnMkNPRjRHeWJyWnh4VENIL3VJUXh3TVgvdzU3Q0Fl?=
 =?utf-8?B?Vi93dEZGdkp6UmtvUExvUFJCcDNkNXg4ZXFIbWRPYlI2YjMxNm1IOFN4VmZZ?=
 =?utf-8?B?dnVBdXdjRkhVajFVWmhBNHVXakYvdHpiSzc2U1M5QzRRS1BYZWFlMFhvMUh3?=
 =?utf-8?B?dUYvdHR0YjhJVExrZWFOOE9CSWYrUG5sQ3NXR0tKU21aZVlvbGVrbG9vREJV?=
 =?utf-8?B?YTErM0UvYjJtY3VTcm9HZWN5cFVZNUtYUG9Zd2ZSTUxVRWNMYkZkN3ZmeEo4?=
 =?utf-8?B?MFBSbFV1NTBXOW93R215TU10TjFkQ2RVWWo1Y0s5djJkb1lHSHlLdy9WTGlp?=
 =?utf-8?B?MFhCRlE1QllGM0NPRTFuQVY5NWhzRFFVWlNvTHVjWjl6Q2NQM1ZwREJSMDkr?=
 =?utf-8?B?eFc2MDNlbDdYSHFnZXR5RldlWDFPZmYyQ3p4ZURsclI1b3JDRkl4TkEvWHd1?=
 =?utf-8?B?aGpKQzl0cGRSUVcxZENxdlJiOTJhM2FtOTUxNjB2aUdXNTdMT0dJS2lVL0FD?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0062a7ac-ff38-4834-1788-08dd2bd66b3f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 09:10:08.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnCY2q93b1lThEU2uiFWNMVNc56Bf8Nlyi/MW1wwgQNo2y1kOAZaQf0N7hLta7r04qzaeFvL8lXcZhkjmdO3YcVgw1e+Mnb8NZE+pTEzDUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-Proofpoint-ORIG-GUID: 1SvohyuvzDlCovOM78E-wVdBOhbEd3eZ
X-Authority-Analysis: v=2.4 cv=AokU3P9P c=1 sm=1 tr=0 ts=6777a979 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=8j-71gdG9Mvw45WkTJwA:9 a=QEXdDO2ut3YA:10 a=UeBFM8ahQKyzkizZ_EwA:9 a=Hhm41dVATCIBrBmN:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1SvohyuvzDlCovOM78E-wVdBOhbEd3eZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501030079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 09:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114624

--------------P4dh0njcschyqeUrWlbESQZ4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/3/25 16:45, Zhang, Peng (Paul) (CN) via lists.openembedded.org wrote:
> From: Zhang Peng<peng.zhang1.cn@windriver.com>
>
> When building the `lapack` package, the following QA error occurs:
> "File /usr/lib64/libblas.so.3.12.0 in package lapack contains reference to TMPDIR [buildpaths]"
>
> The issue arises because the `xerbla.o` object file embeds the absolute host path of `xerbla.f`.
> This occurs during compilation, where the build command in `build.make` (generated by CMake) specifies:
> `gfortran -c <absolute path>/xerbla.f -o`.
>
> As a result, the absolute path is included in `xerbla.o`. Unfortunately, `gfortran` does not support
> flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such paths.
>
> To resolve this, the fix involves replacing the absolute path of `xerbla.f` in the generated
> `build.make` file with a relative path before the compilation step. This ensures that the
> resulting `xerbla.o` does not contain any references to TMPDIR, passing the `do_package_qa` check.
>
> Signed-off-by: Zhang Peng<peng.zhang1.cn@windriver.com>
> ---
>   .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
> index fef9d3a80e..ef5726eeaa 100644
> --- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
> @@ -33,6 +33,29 @@ OECMAKE_GENERATOR = "Unix Makefiles"
>   inherit cmake pkgconfig ptest
>   EXCLUDE_FROM_WORLD = "1"
>   
> +# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the options
> +# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfortran does not support them.
> +# To address this issue, we manually replace the absolute path with a relative path
> +# in the generated `build.make` file.
> +#
> +# An issue has been reported:https://github.com/Reference-LAPACK/lapack/issues/1087,
> +# requesting a fix in the source code.
> +#
> +# This workaround resolves the TMPDIR [buildpaths] issue by converting the absolute path
> +# of `xerbla.f` to a relative path. The steps are as follows:
> +#
> +# 1. Locate all `build.make` files after the `do_configure` step is completed.
> +# 2. Compute the relative path for `xerbla.f` based on the current build directory.
> +# 3. Replace the absolute path with the calculated relative path in the `build.make` files
> +

While the current implementation resolves the immediate issue 
effectively, I recognize that the approach may not be the most optimal 
or elegant. I believe there might be a better way to address this issue
If anyone has any suggestions, alternative ideas, or feedback on how to 
improve this solution, I would greatly appreciate your input.
Thank you for taking the time to review and share your thoughts!

//Peng
> +do_configure:append(){
> +    for file in `find ${B} -name build.make`; do
> +        sed -i -e "s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbla\.f' $file | awk -F'cd ' '{print $2}'| \
> +                awk '{src=$1; sub(/.*-c /, ""); sub(/xerbla\.f.*/, ""); obj=$0; print src, obj}' | \
> +                while read src obj; do echo "$(realpath --relative-to="$src" "$obj")"; done)\2#g" $file
> +        done
> +}
> +
>   do_install_ptest () {
>       rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
>             --exclude CMakeFiles \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114623):https://lists.openembedded.org/g/openembedded-devel/message/114623
> Mute This Topic:https://lists.openembedded.org/mt/110403421/8576101
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [peng.zhang1.cn@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------P4dh0njcschyqeUrWlbESQZ4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/3/25 16:45, Zhang, Peng (Paul)
      (CN) via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:18172257FA34270B.1259@lists.opene=
mbedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Zhang Peng <a class=3D"m=
oz-txt-link-rfc2396E" href=3D"mailto:peng.zhang1.cn@windriver.com">&lt;peng=
.zhang1.cn@windriver.com&gt;</a>

When building the `lapack` package, the following QA error occurs:
&quot;File /usr/lib64/libblas.so.3.12.0 in package lapack contains referenc=
e to TMPDIR [buildpaths]&quot;

The issue arises because the `xerbla.o` object file embeds the absolute hos=
t path of `xerbla.f`.
This occurs during compilation, where the build command in `build.make` (ge=
nerated by CMake) specifies:
`gfortran -c &lt;absolute path&gt;/xerbla.f -o`.

As a result, the absolute path is included in `xerbla.o`. Unfortunately, `g=
fortran` does not support
flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such paths=
.

To resolve this, the fix involves replacing the absolute path of `xerbla.f`=
 in the generated
`build.make` file with a relative path before the compilation step. This en=
sures that the
resulting `xerbla.o` does not contain any references to TMPDIR, passing the=
 `do_package_qa` check.

Signed-off-by: Zhang Peng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:peng.zhang1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>
---
 .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/rec=
ipes-devtools/lapack/lapack_3.12.0.bb
index fef9d3a80e..ef5726eeaa 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -33,6 +33,29 @@ OECMAKE_GENERATOR =3D &quot;Unix Makefiles&quot;
 inherit cmake pkgconfig ptest
 EXCLUDE_FROM_WORLD =3D &quot;1&quot;
=20
+# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the o=
ptions
+# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfor=
tran does not support them.
+# To address this issue, we manually replace the absolute path with a rela=
tive path
+# in the generated `build.make` file.
+#
+# An issue has been reported: <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://github.com/Reference-LAPACK/lapack/issues/1087">https://github.com/R=
eference-LAPACK/lapack/issues/1087</a>,
+# requesting a fix in the source code.
+#
+# This workaround resolves the TMPDIR [buildpaths] issue by converting the=
 absolute path
+# of `xerbla.f` to a relative path. The steps are as follows:
+#
+# 1. Locate all `build.make` files after the `do_configure` step is comple=
ted.
+# 2. Compute the relative path for `xerbla.f` based on the current build d=
irectory.
+# 3. Replace the absolute path with the calculated relative path in the `b=
uild.make` files
+</pre>
    </blockquote>
    <br>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"e2aQR=
6WA3B" class=3D"null"><span data-slate-string=3D"true">While the current im=
plementation
            resolves the immediate issue effectively, I recognize that
            the approach may not be the most optimal or elegant. </span></s=
pan></span><span data-slate-node=3D"text"><span data-slate-leaf=3D"true" da=
ta-sent-id=3D"eEJMY6dldV" class=3D"null"><span data-slate-string=3D"true">I=
 believe there might be a better
            way to address this issue</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"BowNm=
xDj4B" class=3D"null"><span data-slate-string=3D"true">If anyone has any su=
ggestions,
            alternative ideas, or feedback on how to improve this
            solution, I would greatly appreciate your input. </span></span>=
</span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlMmFRUjZXQTNCJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTE2JTJDJTIyc3JjJTIyJTNBJTIyV2hpbGUlMjB0aGUlMjBjdXJyZW50JTIwaW1wbGVtZW=
50YXRpb24lMjByZXNvbHZlcyUyMHRoZSUyMGltbWVkaWF0ZSUyMGlzc3VlJTIwZWZmZWN0aXZlb=
HklMkMlMjBJJTIwcmVjb2duaXplJTIwdGhhdCUyMHRoZSUyMGFwcHJvYWNoJTIwbWF5JTIwbm90=
JTIwYmUlMjB0aGUlMjBtb3N0JTIwb3B0aW1hbCUyMG9yJTIwZWxlZ2FudC4lMjAlMjIlMkMlMjJ=
kc3QlMjIlM0ElMjIlRTglOTklQkQlRTclODQlQjYlRTUlQkQlOTMlRTUlODklOEQlRTclOUElOD=
QlRTUlQUUlOUUlRTclOEUlQjAlRTYlOUMlODklRTYlOTUlODglRTUlOUMlQjAlRTglQTclQTMlR=
TUlODYlQjMlRTQlQkElODYlRTUlQkQlOTMlRTUlODklOEQlRTclOUElODQlRTklOTclQUUlRTkl=
QTIlOTglRUYlQkMlOEMlRTQlQkQlODYlRTYlODglOTElRTglQUUlQTQlRTglQUYlODYlRTUlODg=
lQjAlRTglQkYlOTklRTclQTclOEQlRTYlOTYlQjklRTYlQjMlOTUlRTUlOEYlQUYlRTglODMlQk=
QlRTQlQjglOEQlRTYlOTglQUYlRTYlOUMlODAlRTclOTAlODYlRTYlODMlQjMlRTYlODglOTYlR=
TYlOUMlODAlRTQlQkMlOTglRTklOUIlODUlRTclOUElODQlRTMlODAlODIlMjIlMkMlMjJtZXRh=
ZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiU=
zQSUyMldoaWxlJTIwdGhlJTIwY3VycmVudCUyMGltcGxlbWVudGF0aW9uJTIwcmVzb2x2ZXMlMj=
B0aGUlMjBpbW1lZGlhdGUlMjBpc3N1ZSUyMGVmZmVjdGl2ZWx5JTJDJTIwSSUyMHJlY29nbml6Z=
SUyMHRoYXQlMjB0aGUlMjBhcHByb2FjaCUyMG1heSUyMG5vdCUyMGJlJTIwdGhlJTIwbW9zdCUy=
MG9wdGltYWwlMjBvciUyMGVsZWdhbnQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJlRUp=
NWTZkbGRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTE2JTJDJTIyc3JjJTIyJTNBJTIySSUyMGJlbG=
lldmUlMjB0aGVyZSUyMG1pZ2h0JTIwYmUlMjBhJTIwYmV0dGVyJTIwd2F5JTIwdG8lMjBhZGRyZ=
XNzJTIwdGhpcyUyMGlzc3VlJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2JTg4JTkxJUU4JUFFJUE0=
JUU0JUI4JUJBJUU1JThGJUFGJUU4JTgzJUJEJUU2JTlDJTg5JUU2JTlCJUI0JUU1JUE1JUJEJUU=
3JTlBJTg0JUU2JTk2JUI5JUU2JUIzJTk1JUU2JTlEJUE1JUU4JUE3JUEzJUU1JTg2JUIzJUU4JU=
JGJTk5JUU0JUI4JUFBJUU5JTk3JUFFJUU5JUEyJTk4JTIyJTJDJTIybWV0YWRhdGElMjIlM0ElM=
jIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYmVs=
aWV2ZSUyMHRoZXJlJTIwbWlnaHQlMjBiZSUyMGElMjBiZXR0ZXIlMjB3YXklMjB0byUyMGFkZHJ=
lc3MlMjB0aGlzJTIwaXNzdWUlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYW=
dyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMkJvd05teERqN=
EIlMjIlMkMlMjJwYXJhSWR4JTIyJTNBMTclMkMlMjJzcmMlMjIlM0ElMjJJZiUyMGFueW9uZSUy=
MGhhcyUyMGFueSUyMHN1Z2dlc3Rpb25zJTJDJTIwYWx0ZXJuYXRpdmUlMjBpZGVhcyUyQyUyMG9=
yJTIwZmVlZGJhY2slMjBvbiUyMGhvdyUyMHRvJTIwaW1wcm92ZSUyMHRoaXMlMjBzb2x1dGlvbi=
UyQyUyMEklMjB3b3VsZCUyMGdyZWF0bHklMjBhcHByZWNpYXRlJTIweW91ciUyMGlucHV0LiUyM=
CUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNSVBNiU4MiVFNiU5RSU5QyVFNiU5QyU4OSVFNCVCQSVC=
QSVFNSVBRiVCOSVFNSVBNiU4MiVFNCVCRCU5NSVFNiU5NCVCOSVFOCVCRiU5QiVFNiVBRCVBNCV=
FOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5QyU4OSVFNCVCQiVCQiVFNC=
VCRCU5NSVFNSVCQiVCQSVFOCVBRSVBRSVFMyU4MCU4MSVFNiU5QiVCRiVFNCVCQiVBMyVFNiU4M=
yVCMyVFNiVCMyU5NSVFNiU4OCU5NiVFNSU4RiU4RCVFOSVBNiU4OCVFRiVCQyU4QyVFNiU4OCU5=
MSVFNSVCMCU4NiVFOSU5RCU5RSVFNSVCOCVCOCVFNiU4NCU5RiVFOCVCMCVBMiVFNiU4MiVBOCV=
FNyU5QSU4NCVFNiU4NCU4RiVFOCVBNyU4MSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJT=
NBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIySWYlM=
jBhbnlvbmUlMjBoYXMlMjBhbnklMjBzdWdnZXN0aW9ucyUyQyUyMGFsdGVybmF0aXZlJTIwaWRl=
YXMlMkMlMjBvciUyMGZlZWRiYWNrJTIwb24lMjBob3clMjB0byUyMGltcHJvdmUlMjB0aGlzJTI=
wc29sdXRpb24lMkMlMjBJJTIwd291bGQlMjBncmVhdGx5JTIwYXBwcmVjaWF0ZSUyMHlvdXIlMj=
BpbnB1dC4lMjAlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJ=
TJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMlYwd3FNUmJYcmUlMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMTglMkMlMjJzcmMlMjIlM0ElMjJUaGFuayUyMHlvdSUyMGZvciUyMHR=
ha2luZyUyMHRoZSUyMHRpbWUlMjB0byUyMHJldmlldyUyMGFuZCUyMHNoYXJlJTIweW91ciUyMH=
Rob3VnaHRzISUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNiU4NCU5RiVFOCVCMCVBMiVFNiU4MiVBO=
CVFNiU4QSVCRCVFNSU4NyVCQSVFNiU5NyVCNiVFOSU5NyVCNCVFNSU5QiU5RSVFOSVBMSVCRSVF=
NSU5MiU4QyVFNSU4OCU4NiVFNCVCQSVBQiVFNiU4MiVBOCVFNyU5QSU4NCVFNiU4MyVCMyVFNiV=
CMyU5NSVFRiVCQyU4MSUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdG=
ElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyVGhhbmslMjB5b3UlMjBmb3IlMjB0YWtpb=
mclMjB0aGUlMjB0aW1lJTIwdG8lMjByZXZpZXclMjBhbmQlMjBzaGFyZSUyMHlvdXIlMjB0aG91=
Z2h0cyElMjIlN0QlNUQlN0QlNUQ=3D"><span data-slate-node=3D"text"><span data-s=
late-leaf=3D"true" data-sent-id=3D"V0wqMRbXre" class=3D"null"><span data-sl=
ate-string=3D"true">Thank you for taking the time to
            review and share your thoughts!</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlMmFRUjZXQTNCJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTE2JTJDJTIyc3JjJTIyJTNBJTIyV2hpbGUlMjB0aGUlMjBjdXJyZW50JTIwaW1wbGVtZW=
50YXRpb24lMjByZXNvbHZlcyUyMHRoZSUyMGltbWVkaWF0ZSUyMGlzc3VlJTIwZWZmZWN0aXZlb=
HklMkMlMjBJJTIwcmVjb2duaXplJTIwdGhhdCUyMHRoZSUyMGFwcHJvYWNoJTIwbWF5JTIwbm90=
JTIwYmUlMjB0aGUlMjBtb3N0JTIwb3B0aW1hbCUyMG9yJTIwZWxlZ2FudC4lMjAlMjIlMkMlMjJ=
kc3QlMjIlM0ElMjIlRTglOTklQkQlRTclODQlQjYlRTUlQkQlOTMlRTUlODklOEQlRTclOUElOD=
QlRTUlQUUlOUUlRTclOEUlQjAlRTYlOUMlODklRTYlOTUlODglRTUlOUMlQjAlRTglQTclQTMlR=
TUlODYlQjMlRTQlQkElODYlRTUlQkQlOTMlRTUlODklOEQlRTclOUElODQlRTklOTclQUUlRTkl=
QTIlOTglRUYlQkMlOEMlRTQlQkQlODYlRTYlODglOTElRTglQUUlQTQlRTglQUYlODYlRTUlODg=
lQjAlRTglQkYlOTklRTclQTclOEQlRTYlOTYlQjklRTYlQjMlOTUlRTUlOEYlQUYlRTglODMlQk=
QlRTQlQjglOEQlRTYlOTglQUYlRTYlOUMlODAlRTclOTAlODYlRTYlODMlQjMlRTYlODglOTYlR=
TYlOUMlODAlRTQlQkMlOTglRTklOUIlODUlRTclOUElODQlRTMlODAlODIlMjIlMkMlMjJtZXRh=
ZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiU=
zQSUyMldoaWxlJTIwdGhlJTIwY3VycmVudCUyMGltcGxlbWVudGF0aW9uJTIwcmVzb2x2ZXMlMj=
B0aGUlMjBpbW1lZGlhdGUlMjBpc3N1ZSUyMGVmZmVjdGl2ZWx5JTJDJTIwSSUyMHJlY29nbml6Z=
SUyMHRoYXQlMjB0aGUlMjBhcHByb2FjaCUyMG1heSUyMG5vdCUyMGJlJTIwdGhlJTIwbW9zdCUy=
MG9wdGltYWwlMjBvciUyMGVsZWdhbnQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJlRUp=
NWTZkbGRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTE2JTJDJTIyc3JjJTIyJTNBJTIySSUyMGJlbG=
lldmUlMjB0aGVyZSUyMG1pZ2h0JTIwYmUlMjBhJTIwYmV0dGVyJTIwd2F5JTIwdG8lMjBhZGRyZ=
XNzJTIwdGhpcyUyMGlzc3VlJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2JTg4JTkxJUU4JUFFJUE0=
JUU0JUI4JUJBJUU1JThGJUFGJUU4JTgzJUJEJUU2JTlDJTg5JUU2JTlCJUI0JUU1JUE1JUJEJUU=
3JTlBJTg0JUU2JTk2JUI5JUU2JUIzJTk1JUU2JTlEJUE1JUU4JUE3JUEzJUU1JTg2JUIzJUU4JU=
JGJTk5JUU0JUI4JUFBJUU5JTk3JUFFJUU5JUEyJTk4JTIyJTJDJTIybWV0YWRhdGElMjIlM0ElM=
jIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYmVs=
aWV2ZSUyMHRoZXJlJTIwbWlnaHQlMjBiZSUyMGElMjBiZXR0ZXIlMjB3YXklMjB0byUyMGFkZHJ=
lc3MlMjB0aGlzJTIwaXNzdWUlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYW=
dyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMkJvd05teERqN=
EIlMjIlMkMlMjJwYXJhSWR4JTIyJTNBMTclMkMlMjJzcmMlMjIlM0ElMjJJZiUyMGFueW9uZSUy=
MGhhcyUyMGFueSUyMHN1Z2dlc3Rpb25zJTJDJTIwYWx0ZXJuYXRpdmUlMjBpZGVhcyUyQyUyMG9=
yJTIwZmVlZGJhY2slMjBvbiUyMGhvdyUyMHRvJTIwaW1wcm92ZSUyMHRoaXMlMjBzb2x1dGlvbi=
UyQyUyMEklMjB3b3VsZCUyMGdyZWF0bHklMjBhcHByZWNpYXRlJTIweW91ciUyMGlucHV0LiUyM=
CUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNSVBNiU4MiVFNiU5RSU5QyVFNiU5QyU4OSVFNCVCQSVC=
QSVFNSVBRiVCOSVFNSVBNiU4MiVFNCVCRCU5NSVFNiU5NCVCOSVFOCVCRiU5QiVFNiVBRCVBNCV=
FOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5QyU4OSVFNCVCQiVCQiVFNC=
VCRCU5NSVFNSVCQiVCQSVFOCVBRSVBRSVFMyU4MCU4MSVFNiU5QiVCRiVFNCVCQiVBMyVFNiU4M=
yVCMyVFNiVCMyU5NSVFNiU4OCU5NiVFNSU4RiU4RCVFOSVBNiU4OCVFRiVCQyU4QyVFNiU4OCU5=
MSVFNSVCMCU4NiVFOSU5RCU5RSVFNSVCOCVCOCVFNiU4NCU5RiVFOCVCMCVBMiVFNiU4MiVBOCV=
FNyU5QSU4NCVFNiU4NCU4RiVFOCVBNyU4MSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJT=
NBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIySWYlM=
jBhbnlvbmUlMjBoYXMlMjBhbnklMjBzdWdnZXN0aW9ucyUyQyUyMGFsdGVybmF0aXZlJTIwaWRl=
YXMlMkMlMjBvciUyMGZlZWRiYWNrJTIwb24lMjBob3clMjB0byUyMGltcHJvdmUlMjB0aGlzJTI=
wc29sdXRpb24lMkMlMjBJJTIwd291bGQlMjBncmVhdGx5JTIwYXBwcmVjaWF0ZSUyMHlvdXIlMj=
BpbnB1dC4lMjAlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJ=
TJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMlYwd3FNUmJYcmUlMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMTglMkMlMjJzcmMlMjIlM0ElMjJUaGFuayUyMHlvdSUyMGZvciUyMHR=
ha2luZyUyMHRoZSUyMHRpbWUlMjB0byUyMHJldmlldyUyMGFuZCUyMHNoYXJlJTIweW91ciUyMH=
Rob3VnaHRzISUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNiU4NCU5RiVFOCVCMCVBMiVFNiU4MiVBO=
CVFNiU4QSVCRCVFNSU4NyVCQSVFNiU5NyVCNiVFOSU5NyVCNCVFNSU5QiU5RSVFOSVBMSVCRSVF=
NSU5MiU4QyVFNSU4OCU4NiVFNCVCQSVBQiVFNiU4MiVBOCVFNyU5QSU4NCVFNiU4MyVCMyVFNiV=
CMyU5NSVFRiVCQyU4MSUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdG=
ElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyVGhhbmslMjB5b3UlMjBmb3IlMjB0YWtpb=
mclMjB0aGUlMjB0aW1lJTIwdG8lMjByZXZpZXclMjBhbmQlMjBzaGFyZSUyMHlvdXIlMjB0aG91=
Z2h0cyElMjIlN0QlNUQlN0QlNUQ=3D"><span data-slate-node=3D"text"><span data-s=
late-leaf=3D"true" data-sent-id=3D"V0wqMRbXre" class=3D"null"><span data-sl=
ate-string=3D"true"><br>
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlMmFRUjZXQTNCJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTE2JTJDJTIyc3JjJTIyJTNBJTIyV2hpbGUlMjB0aGUlMjBjdXJyZW50JTIwaW1wbGVtZW=
50YXRpb24lMjByZXNvbHZlcyUyMHRoZSUyMGltbWVkaWF0ZSUyMGlzc3VlJTIwZWZmZWN0aXZlb=
HklMkMlMjBJJTIwcmVjb2duaXplJTIwdGhhdCUyMHRoZSUyMGFwcHJvYWNoJTIwbWF5JTIwbm90=
JTIwYmUlMjB0aGUlMjBtb3N0JTIwb3B0aW1hbCUyMG9yJTIwZWxlZ2FudC4lMjAlMjIlMkMlMjJ=
kc3QlMjIlM0ElMjIlRTglOTklQkQlRTclODQlQjYlRTUlQkQlOTMlRTUlODklOEQlRTclOUElOD=
QlRTUlQUUlOUUlRTclOEUlQjAlRTYlOUMlODklRTYlOTUlODglRTUlOUMlQjAlRTglQTclQTMlR=
TUlODYlQjMlRTQlQkElODYlRTUlQkQlOTMlRTUlODklOEQlRTclOUElODQlRTklOTclQUUlRTkl=
QTIlOTglRUYlQkMlOEMlRTQlQkQlODYlRTYlODglOTElRTglQUUlQTQlRTglQUYlODYlRTUlODg=
lQjAlRTglQkYlOTklRTclQTclOEQlRTYlOTYlQjklRTYlQjMlOTUlRTUlOEYlQUYlRTglODMlQk=
QlRTQlQjglOEQlRTYlOTglQUYlRTYlOUMlODAlRTclOTAlODYlRTYlODMlQjMlRTYlODglOTYlR=
TYlOUMlODAlRTQlQkMlOTglRTklOUIlODUlRTclOUElODQlRTMlODAlODIlMjIlMkMlMjJtZXRh=
ZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiU=
zQSUyMldoaWxlJTIwdGhlJTIwY3VycmVudCUyMGltcGxlbWVudGF0aW9uJTIwcmVzb2x2ZXMlMj=
B0aGUlMjBpbW1lZGlhdGUlMjBpc3N1ZSUyMGVmZmVjdGl2ZWx5JTJDJTIwSSUyMHJlY29nbml6Z=
SUyMHRoYXQlMjB0aGUlMjBhcHByb2FjaCUyMG1heSUyMG5vdCUyMGJlJTIwdGhlJTIwbW9zdCUy=
MG9wdGltYWwlMjBvciUyMGVsZWdhbnQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJlRUp=
NWTZkbGRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTE2JTJDJTIyc3JjJTIyJTNBJTIySSUyMGJlbG=
lldmUlMjB0aGVyZSUyMG1pZ2h0JTIwYmUlMjBhJTIwYmV0dGVyJTIwd2F5JTIwdG8lMjBhZGRyZ=
XNzJTIwdGhpcyUyMGlzc3VlJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2JTg4JTkxJUU4JUFFJUE0=
JUU0JUI4JUJBJUU1JThGJUFGJUU4JTgzJUJEJUU2JTlDJTg5JUU2JTlCJUI0JUU1JUE1JUJEJUU=
3JTlBJTg0JUU2JTk2JUI5JUU2JUIzJTk1JUU2JTlEJUE1JUU4JUE3JUEzJUU1JTg2JUIzJUU4JU=
JGJTk5JUU0JUI4JUFBJUU5JTk3JUFFJUU5JUEyJTk4JTIyJTJDJTIybWV0YWRhdGElMjIlM0ElM=
jIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYmVs=
aWV2ZSUyMHRoZXJlJTIwbWlnaHQlMjBiZSUyMGElMjBiZXR0ZXIlMjB3YXklMjB0byUyMGFkZHJ=
lc3MlMjB0aGlzJTIwaXNzdWUlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYW=
dyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMkJvd05teERqN=
EIlMjIlMkMlMjJwYXJhSWR4JTIyJTNBMTclMkMlMjJzcmMlMjIlM0ElMjJJZiUyMGFueW9uZSUy=
MGhhcyUyMGFueSUyMHN1Z2dlc3Rpb25zJTJDJTIwYWx0ZXJuYXRpdmUlMjBpZGVhcyUyQyUyMG9=
yJTIwZmVlZGJhY2slMjBvbiUyMGhvdyUyMHRvJTIwaW1wcm92ZSUyMHRoaXMlMjBzb2x1dGlvbi=
UyQyUyMEklMjB3b3VsZCUyMGdyZWF0bHklMjBhcHByZWNpYXRlJTIweW91ciUyMGlucHV0LiUyM=
CUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNSVBNiU4MiVFNiU5RSU5QyVFNiU5QyU4OSVFNCVCQSVC=
QSVFNSVBRiVCOSVFNSVBNiU4MiVFNCVCRCU5NSVFNiU5NCVCOSVFOCVCRiU5QiVFNiVBRCVBNCV=
FOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5QyU4OSVFNCVCQiVCQiVFNC=
VCRCU5NSVFNSVCQiVCQSVFOCVBRSVBRSVFMyU4MCU4MSVFNiU5QiVCRiVFNCVCQiVBMyVFNiU4M=
yVCMyVFNiVCMyU5NSVFNiU4OCU5NiVFNSU4RiU4RCVFOSVBNiU4OCVFRiVCQyU4QyVFNiU4OCU5=
MSVFNSVCMCU4NiVFOSU5RCU5RSVFNSVCOCVCOCVFNiU4NCU5RiVFOCVCMCVBMiVFNiU4MiVBOCV=
FNyU5QSU4NCVFNiU4NCU4RiVFOCVBNyU4MSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJT=
NBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIySWYlM=
jBhbnlvbmUlMjBoYXMlMjBhbnklMjBzdWdnZXN0aW9ucyUyQyUyMGFsdGVybmF0aXZlJTIwaWRl=
YXMlMkMlMjBvciUyMGZlZWRiYWNrJTIwb24lMjBob3clMjB0byUyMGltcHJvdmUlMjB0aGlzJTI=
wc29sdXRpb24lMkMlMjBJJTIwd291bGQlMjBncmVhdGx5JTIwYXBwcmVjaWF0ZSUyMHlvdXIlMj=
BpbnB1dC4lMjAlMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJ=
TJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMlYwd3FNUmJYcmUlMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMTglMkMlMjJzcmMlMjIlM0ElMjJUaGFuayUyMHlvdSUyMGZvciUyMHR=
ha2luZyUyMHRoZSUyMHRpbWUlMjB0byUyMHJldmlldyUyMGFuZCUyMHNoYXJlJTIweW91ciUyMH=
Rob3VnaHRzISUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNiU4NCU5RiVFOCVCMCVBMiVFNiU4MiVBO=
CVFNiU4QSVCRCVFNSU4NyVCQSVFNiU5NyVCNiVFOSU5NyVCNCVFNSU5QiU5RSVFOSVBMSVCRSVF=
NSU5MiU4QyVFNSU4OCU4NiVFNCVCQSVBQiVFNiU4MiVBOCVFNyU5QSU4NCVFNiU4MyVCMyVFNiV=
CMyU5NSVFRiVCQyU4MSUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdG=
ElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyVGhhbmslMjB5b3UlMjBmb3IlMjB0YWtpb=
mclMjB0aGUlMjB0aW1lJTIwdG8lMjByZXZpZXclMjBhbmQlMjBzaGFyZSUyMHlvdXIlMjB0aG91=
Z2h0cyElMjIlN0QlNUQlN0QlNUQ=3D"><span data-slate-node=3D"text"><span data-s=
late-leaf=3D"true" data-sent-id=3D"V0wqMRbXre" class=3D"null"><span data-sl=
ate-string=3D"true">//Peng<br>
          </span></span></span></div>
    <blockquote type=3D"cite" cite=3D"mid:18172257FA34270B.1259@lists.opene=
mbedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+do_configure:append(){
+    for file in `find ${B} -name build.make`; do
+        sed -i -e &quot;s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbl=
a\.f' $file | awk -F'cd ' '{print $2}'| \
+                awk '{src=3D$1; sub(/.*-c /, &quot;&quot;); sub(/xerbla\.f=
.*/, &quot;&quot;); obj=3D$0; print src, obj}' | \
+                while read src obj; do echo &quot;$(realpath --relative-to=
=3D&quot;$src&quot; &quot;$obj&quot;)&quot;; done)\2#g&quot; $file
+        done
+}
+
 do_install_ptest () {
     rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
           --exclude CMakeFiles \
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114623): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-devel/message/114623">https://li=
sts.openembedded.org/g/openembedded-devel/message/114623</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/110403421/8576101">https://lists.openembedded.org/mt/110=
403421/8576101</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.open=
embedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/op=
enembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"m=
ailto:peng.zhang1.cn@windriver.com">peng.zhang1.cn@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------P4dh0njcschyqeUrWlbESQZ4--


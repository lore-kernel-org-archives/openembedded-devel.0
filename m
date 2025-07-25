Return-Path: <Bo.Sun.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CB5C83F26
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 08:52:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15183.1753433530478101452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 01:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9301b54a2b=bo.sun.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56P8TC1i3155194
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 01:52:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4846f3g0h0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 01:52:09 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56P8q8hT3193701;
	Fri, 25 Jul 2025 01:52:08 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4846f3g0gy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 01:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsjgf1Ny2guljiIDHpZYiM6hFeRiR3E0aYVe9y/nPO6GorXwdefnSFmfzbyS3eIB+4LyZ+69sBI+yUz9HocLGx6l4HDQi7IHN0s+iBQEVGvUj9So/kkwNYmxVfSV8YXXgvdTEjNW9wUHzqND9MK9+mk9/HwXOO4B3qGBiBNBW6aEVIp3TrfOyEeY4Dg0for/qmqV9NBlRlPFk+QlqAHCtrg/kV4LhVQEWPEapEtzZFRWZGehI1S5a/wS0Ivu1or3vzCUbW5m/WhcMz2cXfldu7g0UcNdKZzoqm9Du1MbbpJ2g54Qv1NzdZvNcuErUkzjC7TlTIWpVMvDvVop+pfwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FdXCBDhqvNpBZ7xmnKh9QcHHjz+YdOMzFcvvw2lBDQ=;
 b=RGjS3NqD+IBZfx8QcgzyXfNKmfeXCJiD7+phVTeIAFNr2GuPb2C89WbIDspCjUP6UZykAdSKzKY4P9yUcLQcqgUpVcMBzghOYc9Ut8U7m4OkzB3vpmF0DH+gDtdj2Q77PC/7S+Gx5S6wKR/sP/NUnxNllTsFUhlcp8JczLabBr/xfIFr9PTN4RRUiOqw5QbrtHIM09P39pQROB5phfreCQESFdXM6lfJanR69ArwOETETXsqY7JqiBPPA+h6K022SCi78tKf91Ie46/1q8P3rJGghj5xs9sFgtmXQQxW85Y/F1MwnHdCqyAzFaidVrsoV2rBk908kM+EmuMxzuj/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) by
 DM3PPFA69606334.namprd11.prod.outlook.com (2603:10b6:f:fc00::f42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 08:52:06 +0000
Received: from DM4PR11MB6214.namprd11.prod.outlook.com
 ([fe80::31e7:4eb1:db78:8446]) by DM4PR11MB6214.namprd11.prod.outlook.com
 ([fe80::31e7:4eb1:db78:8446%6]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 08:52:06 +0000
Message-ID: <e214e651-b3c3-473f-ac38-470929fd0bdf@windriver.com>
Date: Fri, 25 Jul 2025 16:51:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][walnascar][PATCH] thin-provisioning-tools: fix
 bindgen build error with clang on octeontx2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250724074411.2903317-1-bo.sun.cn@windriver.com>
 <CAMKF1sq63BjGgAdbnD=KD3N7tvt3vzXTivTPobB4O=TO1MaNvw@mail.gmail.com>
Content-Language: en-US
From: Bo Sun <Bo.Sun.CN@windriver.com>
In-Reply-To: <CAMKF1sq63BjGgAdbnD=KD3N7tvt3vzXTivTPobB4O=TO1MaNvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DM4PR11MB6214.namprd11.prod.outlook.com
 (2603:10b6:8:ac::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6214:EE_|DM3PPFA69606334:EE_
X-MS-Office365-Filtering-Correlation-Id: d9477a65-ff1c-415b-8846-08ddcb588827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UFVwTHkxWmlLRVJSaUgzdGJ4SW00UWJuVWQvaXBEM3ZaWXRPNnN3cHN2VDdV?=
 =?utf-8?B?SE0xdU1KSmZ1VnRhQms0UHVLK29EMEdiNnhwbjI2M0hhVmJzY2dwemZCWkFD?=
 =?utf-8?B?TUNJTHBDNng0OFVSVFFVcERQaGNKcm1UcHh3UWpxUUdkTFBsaFJaUnNPZ2Ji?=
 =?utf-8?B?KzBCZjJUV1hDRFlRS3VscGw5azMyMHBHdVUvVmdDKzRYeWNQNy9jMGprZDgw?=
 =?utf-8?B?YVRvMy9iaXZMRWdCY3V2OE5GRWJNaWVlVmQ0Y0JMNTJZMGw4eGY0N2VrYk5G?=
 =?utf-8?B?ZTBoaXViWWVTWjV0dVFOOFlISVJKOGJkWUtVQmE5K2wvVmJSRW5Xamlwekpq?=
 =?utf-8?B?WG8yT00vSVFpR3c5V1VJU1ZhRXRBMnNZRS83QTUyZUxIZVVRWWhFSlVQYUcy?=
 =?utf-8?B?TXBHdm1BVERWU3V0SVV6RWdtNmVkSEs5eUljQ2FqNFRkVFd5c3FvejZaaGxZ?=
 =?utf-8?B?UTZxeDlaOEhGeHovVmxZK2s1U3A3WVNsdC8yR3l6ZGdJS0wvcWs4S0kvbmxY?=
 =?utf-8?B?TW5qTlBvK0dVUXRTVzRlSnpkREYyMzBsTFAySFB3R0RtRUpuRlI4RHlVcWc2?=
 =?utf-8?B?K0FrZ00rT2pjdXhSa3BPcmQ3dGlUVUVVUXhpb3VIZVJLT21sanFobEpGdXJq?=
 =?utf-8?B?Rk5qMDhPYTE5UDlFbFZrY0NXcUxPYys5Zk5SVEo5Y2JYZUt2UlJLcDNtVmF1?=
 =?utf-8?B?VzBGRkhDRmREaDR0MzZyWC8wcXg2QVlTRWhJSE5mbTZtNzBRRTFPTDRxU29T?=
 =?utf-8?B?aGVRaTlzMUY2QzdqM1dKMnlLOTBkMEZhQnBPS1ZqR3BmbWVzemgvUzVuSTJy?=
 =?utf-8?B?V2JDd0ZPUFRuWTFjK0FvbnhYNnVueU4zKytIM3FpcFhKbkVwbWpSQ3d0UDVk?=
 =?utf-8?B?SzN2dWt2ZHI2RHIrNHFQUStJWHV6Y3hlNzlNVnBrWnF1a2lsZldWdkRXNmMx?=
 =?utf-8?B?WHNMTVEzb0g4b1B6QlhkR3RwcUxrVmRYZ0s2ZWh5RDFIVmtaeHp4NmVNTmQ5?=
 =?utf-8?B?MWFiWkJtdmJXd3l4dUljSWRsMlh3Qm5KR0EwU1NmVHk2d0pNM0RVVTV1WDZU?=
 =?utf-8?B?UzVPVzVCc0krSlRjMFNPZVpILzZZeWdRMXBWVWNITnNEMVl4OG9teDIzZnNJ?=
 =?utf-8?B?THpzVitGTk1lMkZ5MzZpVG9rRmtpVnZVdTdNWHY4d2tGUUNDVWw2VjJRVDNP?=
 =?utf-8?B?UWhsbFB4aDZiZzN5WkRTM0tqUlF3ZnBtbGIrUm5pQzVxQ1MrNnU4M09TOEpk?=
 =?utf-8?B?VEt3RGlKaldDNXZoUjd1V2hzdmZ2QjhsY0ZqV1NuZHlHYXdUd1FOZWs2eVNy?=
 =?utf-8?B?UU1NQkRsMGliY09xRjBRbTlwL3pGd25qUS8vK2YwbEhYMjNMRlRlb3JPZ1dM?=
 =?utf-8?B?UjBQY3lMTno1SENNdTZTVE4yaHFLRUVNM2U0VXRTa0N1RDd4czRUL3JkVXRQ?=
 =?utf-8?B?dktRVThlWDBJd093OVZQQk5VODc0c2xpWHNWSkdwUFUwUFpTZ003VS84dWN3?=
 =?utf-8?B?Wk1OMUF6Z2NuWEN6WTdNQkcvNUQxekxiRHNFZXZ5encyTHNTclFOY0VveStQ?=
 =?utf-8?B?dzdtNTBMdW5YczVGVkVZd0l4SHpBZHNZeHBtUnVRdlFZYjBOYTVPcVBTSjBn?=
 =?utf-8?B?bzd0YXNGM05tZFJnRFEzUnRvM2M5bVBFZnpRMkZaNVBuYlFjd0p6VW1kYXpl?=
 =?utf-8?B?NFVVUXJrcUFGOTRTRFJqeGRwNjFycjd3eTdxTUc0czA1NmovOHgrUVlhNXlt?=
 =?utf-8?B?Nk1seUwwdlJHL0RmNVNEYU1KUGIvWEw1ZmZnNmVUNDdVWmNGN1p3TWxKd2Fa?=
 =?utf-8?B?WFdxMUxhWFZHZGt4ZFY4L1ZEZmhrallpSVB1RlFjRXhWSnlUa20vcnl3S2xs?=
 =?utf-8?Q?pdbX+83YlvPBb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3poSEROQlNCREN2d3M1QkErcUQ2bHlRY3FiRTZja1lkVTZkM1oyM3RsTndV?=
 =?utf-8?B?empLTUtnQkVVMGt0RDlIOWoyNDJNUC9tMW5KRk9XOWtBaHl6eUNnb3Azc3di?=
 =?utf-8?B?bW4wNjF4UUQwcTNLdmZPTlpQakozL1RmeVB0S1RKL1lFUlRtZFdyeTZhODJu?=
 =?utf-8?B?eGZ5ZzJkaHlyWExiNktXTjE2ZnlpRUZOSWNxcGhmZ1AzSTlrR2xVN1dZa2xq?=
 =?utf-8?B?bGU0R1JXdU93dE1IMDB5TE9haGd6WkJHQWd0QXRCK3pweldjQ281QkVqLzg3?=
 =?utf-8?B?OG42aDMwZkdRam8xaWRsQTNnWDNIUjN0ZmVVUkFtaUdUMnVXU1FTWjk5QytM?=
 =?utf-8?B?YzlVNVpFRjd4ZUlGY1lNSGpDVStaMVU2VFA3ZjYrS2hrRVp6MlRNYVkzOGxw?=
 =?utf-8?B?ME1wWElSMlIxVTM2Q2tubEN1bzhYT1dDQUpEbG51TkRSREp4ZDBvYlRxaEsv?=
 =?utf-8?B?cnZLdlJ4b3NBR3lLalBWeUtlTE95M1hzeGtvbmxFMy85RTdsQTR1YU04SDJy?=
 =?utf-8?B?ekxtcjAxUjJhK1Q2OUUwWjhYQzZoamhwL2JkejNIWjBuVWFvQ0cyT0lOL2U4?=
 =?utf-8?B?RCsxd0R5NFQySmJWSGFnY1EzOFpEeDcrcVY2TFJVdWpEMThnNTVaWjdWWTVM?=
 =?utf-8?B?Nk4xaHJvbXhnZkZhU25xa25lV0hlQmFld0dLaVBLcGlxNlZjcHBnelp2MzlS?=
 =?utf-8?B?SFlwVlZWbmxHZVVFdlhFWE5tOGE1SjUxTTQ3eHdmS2d2aWVyZm0rOFdPbVdr?=
 =?utf-8?B?WXo1Z2gzdTFCaFZWSnJtSHZ3dUlaaFQ1L3loQ2ZQbDd0UmREa01IZFZnaGQ5?=
 =?utf-8?B?OHlRMU10MzA1THNBN1ZuZktZaCt1aUg0eVZpOTRXek1vUit4WkVacVNwRXY0?=
 =?utf-8?B?d09YWHFheGpnbG1xM0tLVEx4Q0t0OGxLamZ0cU9UemRTK21pZVhsVlZKUHh2?=
 =?utf-8?B?WUM2KzlmbnRKZUY1RDh1RXgrS1R3TnJGOW5qdnlLVk5TRFVaai9lc2JueXNU?=
 =?utf-8?B?Y0lJRWh4L3Y0eFVHelM0QmZuN1FLbWgvZkQ0T1Z4QThGTDdvZHFMcXNGVnIv?=
 =?utf-8?B?RkJ4ckpPQUxkZlpjeXd5UVc0blY0Y29mUWJtVUVibll1d0Mvbkp1TnYzVkFE?=
 =?utf-8?B?MG92eEVqS1NPNWNUYk1TTDBrZTFmQjlXOUhoZExaOWZtSGZ6dDZWbnBsVG1t?=
 =?utf-8?B?SUY1WHZnL1VsL0d0c2d0TUlDU21MdUtRcGtsRFcyczlPS2lrY3ZkbGpEWnpw?=
 =?utf-8?B?alQrblhTaURHY0kwcFZJMEhwVENxb1lBQWlYbXJkMHo5NkJvb3NZU2N6UlFt?=
 =?utf-8?B?TnRNTnEyTkJKWm5TbG9wbmw2SGZkWFFWVzVQVjR4cWN5KytORWdXNjMxeHZ3?=
 =?utf-8?B?dnNFeUJtREdqcTFFLzJxTUFQWlJvWVBMV3pqQVB1WSs5SEoxV2NBWk9xbkQw?=
 =?utf-8?B?bTZEVWZJRkJxTDZ0OVJLc09Pb2d6NitFV0Jaa1lzcDR5VHpINHVCeHJqdVlr?=
 =?utf-8?B?bjBEbDNqdGJpOTBSaW0rREg1dGN3aGNsOXQvanU5Q2lxTFAyOVdsTkhiWDBO?=
 =?utf-8?B?Q1llZTdBU2FmSFFJR3RGMDc3K3RPVDBBRGltYWNjTzljNXNXN1BkYjVQbTMz?=
 =?utf-8?B?YjM2TVNDQVJodDZnN21oWk8yeUU1clRVQWlwVEtJUnMrT3hRN3FLMjdHc0pL?=
 =?utf-8?B?Um9ZdDJsdUo0d2I0QlZjbGtCNW00TlhERXBoN1VKZVZlSzhDL1lIdGsrdjl2?=
 =?utf-8?B?Yi9yTFJaT1cvUmRGYUhyT3ovV0srbmwrTllrVWgvQXRQdUhFTFlHc3gyK2xk?=
 =?utf-8?B?b0d1V0FyWjNWajZueS8ycElHQWJrLzllRGxwOXhBRUEwbjY1QjRCM2xhS2Zj?=
 =?utf-8?B?TkhRazBONWFsaUZIbGRXZGE2QkxnTi9oZktRRUJBM3NpdjhYZisyaU5COVVZ?=
 =?utf-8?B?ZHMzai9FL2lkY2xlYkdsR0gwbFg4SW1VTFJFN0I1MnJNdXMxTTdGL2Z1OHJC?=
 =?utf-8?B?RWdxdFc2Ymlmazk0cWdVTDhLRnkyL2VuOVU4YTdpS2RkTjlFMTNPbFhIYmp0?=
 =?utf-8?B?L0FxemN0Yk4rVVRkbzVGbTU2UG9Uc3RCR3ZFWGFZSGs5aFVUSmpYOUlUd3ZH?=
 =?utf-8?Q?iNcDGhoOtOolnSBzMHdlakN9Y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9477a65-ff1c-415b-8846-08ddcb588827
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 08:52:05.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/WlJw5fMMhiAvVeL2EUUaq13alcYIbUIuNuDTds2FLv0WThbVVuKaJpg/SJdaDSNROBYjlYGvvedKWRZRcJKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA69606334
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3NSBTYWx0ZWRfXyXDNy4Q+jYU6
 zjf/SyPAwBTMDv1zbfy/E4VvPiqi0ebWdYmJPwkd7bXWfv0S+d3/npZCy4nW7CfNaO6v6XWr/jX
 4PWXM16baD4A+eJRxnLo2zutAjhyXRZ+VUQFNYS3ID2MFGd+I1l/8YiBM+3g61SowvEVZg0cnWh
 9UZr6lqB4IhS7WVRGqAaZbHv6nz4ZAGK3VoFGJHgA3h4oNNhpMRb5A3zgpAc3cG1lVuCibrY5ME
 vZ7+C2E3qpIjwMFD5URbs6j0IGJutokFhKPhgLlOH4WfL7B8WLrWB0Uc6AizxeyGeZjgWWMRNx3
 C1/DQAAXVkIOoht23QW8dgUu+aGAce0iAAh3Oss1S2ZZu1LJiVZcuMnHNVNs+AXyedkqd8FrEmD
 nP5usfmz
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=688345b9 cx=c_pps
 a=l8vyuyoHTbRxBAwLcDSn/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=3k6vbe9wm2EHNt9jSuMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nqXPt62OdeW9NkFYVFFcM7Q1tWmmv_BU
X-Proofpoint-GUID: B_tZGVkERru-sY16AejgrMAKoC0Fr8Oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56P8TC1i3155194
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 08:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118726

On 7/24/25 23:55, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> while this fixes it for one recipe, we have to fix it as tune level in
> oe-core so remove it globally if we are using clang compiler. so
> perhaps adding it to clang.bbclass might be a good idea

Yes, this fix does resolve the issue for this specific recipe. However,
I think fixing it at the recipe level is still a reasonable solution.

Looking at the bindgen code, BINDGEN_EXTRA_CLANG_ARGS is parsed and used
directly by bindgen at runtime, not by BitBake:

https://github.com/rust-lang/rust-bindgen/blob/de9627ffa4860c6ed56cd40470=
fc7a96afc09d44/bindgen/lib.rs#L300

fn get_extra_clang_args(
     parse_callbacks: &[Rc<dyn callbacks::ParseCallbacks>],
) -> Vec<String> {
     // Add any extra arguments from the environment to the clang=20
command line.
     let Some(extra_clang_args) =3D get_target_dependent_env_var(
         parse_callbacks,
         "BINDGEN_EXTRA_CLANG_ARGS",
     ) else {
         return vec![];
     };

https://github.com/rust-lang/rust-bindgen/blob/de9627ffa4860c6ed56cd40470=
fc7a96afc09d44/bindgen/lib.rs#L337

         // Add any extra arguments from the environment to the clang=20
command line.
         self.options.clang_args.extend(
             get_extra_clang_args(&self.options.parse_callbacks)
                 .into_iter()
                 .map(String::into_boxed_str),
         );

Additionally, base on the build.rs for devicemapper-sys, I believe we
can safely remove ${HOST_CC_ARCH} from this recipe.

https://github.com/stratis-storage/devicemapper-rs/blob/master/devicemapp=
er-rs-sys/build.rs

$ git diff
diff --git=20
a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb=20
b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
index a60ca11244..e8173c9b14 100644
---=20
a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
+++=20
b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
@@ -23,7 +23,7 @@ inherit pkgconfig
  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"

  export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
-export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}=
=20
--target=3D${TARGET_SYS}"
+export BINDGEN_EXTRA_CLANG_ARGS =3D "${TOOLCHAIN_OPTIONS}=20
--target=3D${TARGET_SYS}"

  require ${BPN}-crates.inc
  require ${BPN}-git-crates.inc

I propose submitting this patch to master in v2, from where it will be
backported. Let me know if you agree or have an alternative suggestion.


Thanks,
Bo

>=20
> On Thu, Jul 24, 2025 at 4:44=E2=80=AFAM Bo Sun via lists.openembedded.o=
rg
> <Bo.Sun.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> Remove unsupported '-mcpu=3Docteontx2+crypto' from BINDGEN_EXTRA_CLANG=
_ARGS
>> as clang does not recognize 'octeontx2' as a valid target CPU, causing
>> bindgen to fail when generating Rust bindings.
>>
>> Since bindgen only parses headers using Clang, CPU-specific options
>> like -mcpu are generally unnecessary.
>>
>> Fixes build failure:
>> |   error: unsupported argument 'octeontx2+crypto' to option '-mcpu=3D=
'
>> |   error: unknown target CPU 'octeontx2'
>>
>> Signed-off-by: Bo Sun <bo.sun.cn@windriver.com>
>> ---
>>   .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb | 5 +++=
+-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-p=
rovisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-laye=
rs/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-=
tools_1.1.0.bb
>> index a60ca11244..4ed885f8b3 100644
>> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.1.0.bb
>> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.1.0.bb
>> @@ -23,7 +23,10 @@ inherit pkgconfig
>>   DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>>
>>   export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
>> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIO=
NS} --target=3D${TARGET_SYS}"
>> +# Remove octeontx2 specific CPU flags that may cause issues with bind=
gen
>> +BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --t=
arget=3D${TARGET_SYS}"
>> +BINDGEN_EXTRA_CLANG_ARGS:remove =3D "-mcpu=3Docteontx2+crypto"
>> +export BINDGEN_EXTRA_CLANG_ARGS
>>
>>   require ${BPN}-crates.inc
>>   require ${BPN}-git-crates.inc
>> --
>> 2.50.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#118723): https://lists.openembedded.org/g/openembe=
dded-devel/message/118723
>> Mute This Topic: https://lists.openembedded.org/mt/114317423/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>



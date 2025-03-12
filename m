Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CFBC282EC
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:41:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27596.1741743696050855419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 18:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5166245db1=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C1YZF4004919
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:41:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emr0pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:41:35 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52C1fYxh014964;
	Wed, 12 Mar 2025 01:41:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emr0pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 01:41:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFcA9z0NIQVnL9ZqvjpImr7o64gKTVMyqsvGQiXgf0ELGmIPPbtUoDLdXlMEIf5XHLpkS4BjtBpiW1wrWKUiKRmla1+eg3YZSawhMKj8oHLvErWa+1W+RBeEhWPU1MfLfld2b4REXV5ARwfVD97j6dMZgG0a6itYjg/FoJZd9IXw1bOPDi6MyIXShso0KegkS0yXD9pqw19Y2/w/L7wYHpQeAGZNcZaZFMsXB3aPtd5vczEKPdtA/WOdouEv45/Mla4AsIodgXbvo9VYY5T2qD8pSDxcIcqMZ0w4SfMc8z6Ff7+1HVMHgyEtbyBO5W+Wk/K1IHEbHOtUi04uC16MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYDhJyigT/oaM/+olfp/Qg7i/Ca9DwCKJ6tuUQdtp8E=;
 b=RvjXUFIo0R9RxLIkFloVK9wy01ftMd02BSMzRri6k5svmxiS8S+3XhmgP6U11fxeoklPsQWdGryJURXcQdvjPXERWYaHt6xDW891S5/tjkdFYTrejc7rSZxLJ0xP5Cc5OP6d2E7KHWJSqZYCpr4LTE3LrTzyGU6KyrMn6/G/wyf6CdL9GbMiA8SNqxIZW2oMSy4sscRL/hQ14NiXAYcEjVQ+KsieesqB8j4ry20m1IbkRpfqcpDr5r72PVp+1AWbwXJaPXSPFscZexQoo51LEo2yxVrRgjzwnYZ7SGpGzrXgWhLLEENYrSndDfBgUskmsRTMCizGrqlSGhin1yChDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 01:41:30 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 01:41:30 +0000
Message-ID: <fe3b373e-8e1e-4343-ba80-0b49920bcc29@windriver.com>
Date: Wed, 12 Mar 2025 09:41:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pykickstart: fix
 options parse error
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250311085756.1136319-1-kai.kang@windriver.com>
 <CAMKF1srN0CvRNrfA4bm=jMbLwTN5va3kb9Nt-8KqVv7oYDWAVA@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1srN0CvRNrfA4bm=jMbLwTN5va3kb9Nt-8KqVv7oYDWAVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 330e6f38-7364-4410-2490-08dd6107030a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MU9BNG9HUlcxZThkb3UxTlg2dUpjYnRLTkVEWHhQYXRsT29OMExpQnVJbjJ0?=
 =?utf-8?B?TDhHMFhQM0EwbWp0Yk1FeCtNbDBJWm0xcjl2ZG15Z3VCTFVRL0VCc0Y4Qmwy?=
 =?utf-8?B?anBPYzNEUU84NHdJMGllMlN1U2ptL2I5M0FNWEkwbkdRYXhQQzZwK1I0L1BY?=
 =?utf-8?B?ZUsvTXoxT1pGTGpEa1E0RlRJZUVYQ3duUTFPZFE2V1RaRHNxY1VscmVnYXd6?=
 =?utf-8?B?YlduUHJnSXc0ZnovcVBObGpiRXU2VlEyS2YwQUc4TG5BTmlsb2daUDVjMGYx?=
 =?utf-8?B?U09KazdqemhIaTA5SG5pbTZTaDloWHhuNlUxNThlTXlmYkhUbHFtZXR4amVo?=
 =?utf-8?B?QWRDMGxsUmIzZWxuU0hFZUxyN2pmdnVaWDRJeUlHMytZMVZkV0J3Nm8xdE1k?=
 =?utf-8?B?Q3JFZE84U1B6WkZaaVl6eFJIeGZZQ0prTGJzbTZoNnVwZHpwL3NYUXJsWjF2?=
 =?utf-8?B?QTVJVzNYZC9iS05nOHdmbEdyM3JnQUFST1ppdmFFbDY2N1VrRjN4YlFJWC82?=
 =?utf-8?B?Q2dJbUVnNUVscXo3aHVJeDFFaXgrblMwZnY4dTVmbXhUMVNkVmlJRXAwbW1J?=
 =?utf-8?B?QWkyUE84cWVRYjFJSDZLWWhBMzE4cmlVL2hKc3BSUWdTMGtnWXBnTk9MSjgx?=
 =?utf-8?B?blJLUlBsSHlxNVFZaFNBZGxQV2tZOVRqTjM2RkhWVXJMa1hFQkROYzFiU0Uw?=
 =?utf-8?B?MGJEdHVjYlBhejB0dlZsem5JS3djbDd5bnFmRWs5T1lqWnJaTzA0VnlEc3Jq?=
 =?utf-8?B?S0JYc2NaZ3ptbFI2eUxGZVhScytBdTZVcXd6NmxSY3NiWGl5YWVJRXozemN2?=
 =?utf-8?B?ZzFLWDJnQ0orY3BwK0w1aW0xZTN1L2s3N0hlUXg3Z3BHak1EWXBFTHRSM3ZH?=
 =?utf-8?B?dCtzb051T1ZLNkJERTV6ZXZYOS9BcGFZTkFrTnJXKzQvVkg3bWo0Vmwra01I?=
 =?utf-8?B?bm9malhZY0NPaWRYZWREMFIyM093WmlibDVvVi9MZXgyM3pCS01xQ2Zrb1M2?=
 =?utf-8?B?QzRNK3g4bnVUTWtrOXFKalBjZjViY3daWjh6YUp5YzZXaXRyTk5nZ3c5QWlZ?=
 =?utf-8?B?UHJQSVZFZm1HZDdQbnBCU0xGWWUvUkRjbm1iaTk1cDlCbDZJdkY0NHA0cnNE?=
 =?utf-8?B?RnMvUTZveWs1WWVLTHBLK1JqUjlQYkpEK0drL1BXSU1CVDZRNXUwMldrZkdt?=
 =?utf-8?B?cjZISHN0aFlsSDZ1ZW5jU2FwSHR5ZUs5QW1zRkpKTFArSDhncVhmeG05NEJs?=
 =?utf-8?B?YlFnU2JNWmZuUUNZMWhaTW9nT201Y1ZCMzFuQnQyYVRwNkJCL3h5MUlrODdh?=
 =?utf-8?B?UkZvUXJsN3o4eW9acExRMlBKdGdVSE5KSUhNTGZWUGVhRDJxWFcydS9GUGxE?=
 =?utf-8?B?Q0Y3MW91Q3NPSG1tc3lIb0l0akdlL2pSZVZHZlV3eVdDNEJPKzJQTXNCeWsx?=
 =?utf-8?B?QkxQU3RoeXdoTGM1VnNubnF0dEtTVVMydzc2TkYzaVVkcXVXUTVpbHV2MEQx?=
 =?utf-8?B?VTJrM2xZOVM1bk5nZm1wK2VhLzB0TUJxcWJSKzNsay9IMTMvM0VzeEdtaTFK?=
 =?utf-8?B?UFpNOWJ6Sy8wSlQxQzJ3TmR0cnBleURHdnYzN2hodnU4MmpFdWpZSEkrdi9Q?=
 =?utf-8?B?UzFZSWV2RGdvUXQ5QmlGVTNvRFphRVFXT0szZWJiVXcyNXV3Qjg5a2NQcmkx?=
 =?utf-8?B?Ni9WR3dlSnovVE5HNDRUN2d2V1M3U1dPOGkrUG53dHlKbThxSENUN2Rteks5?=
 =?utf-8?B?V1dVZ2N1N2RLY09uQkFJdEtzS09HeVFXUVJ3bnp6NEtiSkN2d2xhcGltUUNq?=
 =?utf-8?B?VHdVU3A5L0ZneXkrOWU5dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkZHKzcrSEFmbzhWRVRiQUQ2Um9nUkMxUGNqbFAyeUljRVNCVGM2enBaSVVy?=
 =?utf-8?B?bHZhZDZTTml0RG1BRXk4bUhPQ0NvamZvQ3RmaWkzOUtaTDZtUjVFT00vWXlR?=
 =?utf-8?B?bmlOOHVYczJURlZWYjlZRnRheDVDaGtNazg1RzRMVTNlUkVwclYzK3g4QlJz?=
 =?utf-8?B?TXFvMXJiZXZFNmk4MFpPSko0TDYwKzhMNHNYR2libHBCM1dKK3dWRTJjWVV2?=
 =?utf-8?B?TE5JUGpoU1RId2FMRitCRlRUVkV6OWQ2NjI3azJWNlRmQnQ1UHdyaEhwQ0wy?=
 =?utf-8?B?MGJlbDhTb1NhYmFYZHJrT2E4cEZpNVh0WXVROVpsaG9JZjdQSFFOKzMrVDg1?=
 =?utf-8?B?RXVoaDViV1ZrYnQ2TmhrcDYzeXpLc1MrZExqTGp2dCtMcWlCSG8rOSsxdjBZ?=
 =?utf-8?B?NS9pVlFEamZYekJYR3o1OXBPT1k3eEtBZFpFUTJGcTR2dkI3dWpDeVdiVjJa?=
 =?utf-8?B?V3l0YkxmTmdSbUZNTzZ1RHZjR1g2UWQ5RlE5U2VXZmtwbE5LL3doRndsTENH?=
 =?utf-8?B?RWtRVHB1anhYOE5Zd0tJdkIwUzA2SEd4cWQyK2hMT3hrRWVEa2NsNFkvQmdv?=
 =?utf-8?B?VFVsc1JYT3h0Y2JEdmZYT3JueW5NZmwxQjNJWGUxUXdqbkRPWFhaVU0rUWd1?=
 =?utf-8?B?V3hxbml0V2dYbkJ2UENJK0NrWFVFSzNlRHBjTGVtZzlyeVp1UVN2elIyY2FV?=
 =?utf-8?B?dmVxdzhicnNRUGRnZ0VuLzdTbmx0U29kT0llZ25sbkZiQ1NEODFQdEpqK1hH?=
 =?utf-8?B?WmF0Wk1RTTA5Z3E4UTFhUHpKdnBXRlZZTTM0K0NkeElaYWlheitkbWY3VFAv?=
 =?utf-8?B?WFJYaW5ZYVdUQW1uczY5bzZsb1dwUUkzZWJkbWpkM1hUeTQ5QVhzYTBObUE0?=
 =?utf-8?B?U0k5WGVJc1RGR3BWWFVrM0JzZ1c1Y2l0VklhaCtWVWI5ekFDU2kzcGJrZWZN?=
 =?utf-8?B?UWgzS014Z2pQbTZUN1JxQW8rdnZFcC83ZkxXSFBXZjFQVFNpYlpCcllLbDcx?=
 =?utf-8?B?bkN0dFFCcDVMV1JkR0hUY0tQTmwxOTRJYSszYTVyQTdTaVhhYmZwbGxRSkl0?=
 =?utf-8?B?cGFERFloakhxVkJBOGFzZ3lzbWl2SlU5U28rZ0pNWmJRTWQrb0h1ci9nbUJB?=
 =?utf-8?B?YUk3TjRVbDlhdFI0cVZaYVgyVEgwd3I3THErSmVNb3c3K2RJOWhtb1BrWW1u?=
 =?utf-8?B?Q1JWbFpsWWJPTXFVamlEbmc0cC80c211SkVkdGxMSWQ3dHMyc0tqaXk0YjU1?=
 =?utf-8?B?dUVCbDN1RHBYYkhKRHFpWEVHS3FCNDNHN21mRUhTanZ4bVRjNUF6SzB4ZEFh?=
 =?utf-8?B?S0FCWkJUem1XSmorRFU5QzNDMGJZdUZhZlVtWkxaYVAvaCtmeExjNEQ5Tzcv?=
 =?utf-8?B?MnNNQUU5YXJNQ0ZVdzVVOEhCVENDL2N2aGJWRTNxczYwdS9rQWYrTkZJcndU?=
 =?utf-8?B?TjloUkNaTVFadkRFWlV5ZUYzekVNcUw4SWV1dEI4KzMyb1RlczVYbFMwYmVa?=
 =?utf-8?B?V2M4TnljYWE0L3lDNDVMMURoT1E4c2xWeUhtSjdZNkNoVmxRRTBnTkxHMVB3?=
 =?utf-8?B?cTVTbFZZdUhKMHBYT2YveUlkZGsxRDQwb3pYVzRnNmRWelVwdms5eElOMy9Y?=
 =?utf-8?B?TzAwRkpML2JhRmtoU1doYzdML2xHVGhnUTlUTTV3UGhYY1I0dWRvTHM5MFRM?=
 =?utf-8?B?OFhWUk55ZThBaFJ5bGpobFlMNjRiSHBYamVkVEV1UlZqRVZMMlJYYjZOeGtM?=
 =?utf-8?B?dFR2RFllNlFEdVpjUkZLaFZRL2hYMDBjV2pjSks0Sk1kQ3pVUE1WQi9nT3o5?=
 =?utf-8?B?UVlhanlTbHEyRkprcGpPRE82eWk1bHFldm50RU02cnVFK0E1ajM0WDU0MWFp?=
 =?utf-8?B?RWwwTzg0bmljVXZEcFc0b0pWaHVMbGNGNFQ1d1ZWSytBNUk2NWcxMDlrTHZ1?=
 =?utf-8?B?REMrbjJsUmtxK1dOVWxocEVVaVUrU09xeVMwRVdkUVFLM0lLYnVEazhBT0hM?=
 =?utf-8?B?YjJjUFdhL01DUzJoNi9vM2ZkR1lpVHBveTBYb2VjVEI5cG5VR09wWmFPTW41?=
 =?utf-8?B?NE9zYTd5OStFWGlRSnh3WjBEZjlvcHNPQlQ2ZzJXaklCSnpXcWVVUkFuSm5q?=
 =?utf-8?Q?tTuaiYI4LwN311SdsdER7GYYc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330e6f38-7364-4410-2490-08dd6107030a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 01:41:30.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wglq8XzrWo8xqZsRk9L3/xqCY+YV3EZ7IdpSbztZ+00wthhg6gBUEA5otAImcUBgii02RBPJGYziLu8HsDNQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
X-Authority-Analysis: v=2.4 cv=J6Gq7BnS c=1 sm=1 tr=0 ts=67d0e64f cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=MLnUaL4y6OnqkPwl_6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wbPLauWW1G-252VeCxukjdQhVshUPbCk
X-Proofpoint-ORIG-GUID: nLdxEsFxFIYTZsR198Z8mSAeRrqDAaPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52C1YZF4004919
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115907

On 3/11/25 23:44, Khem Raj wrote:
> This is needed on master as well. Please add [master] to the subject
> line as well in future, else I might end up ignoring such patches
> accidentally thinking they are backports to stable branches.

I didn't verify this patch on master since I planned to upgrade it on=20
master. And I'll consider master first next time.

Sorry for inconvenience.

Kai

>
> On Tue, Mar 11, 2025 at 1:58=E2=80=AFAM Kai Kang via lists.openembedded=
.org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Backport a patch for python3-pykickstart to fix option parse error:
>>
>>      File "/usr/lib64/python3.12/site-packages/pykickstart/options.py"=
, line 185, in _parse_optional
>>        option =3D action.option_strings[0]
>>                 ^^^^^^^^^^^^^^^^^^^^^
>>    AttributeError: 'tuple' object has no attribute 'option_strings'
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...o-behavior-change-in-upstream-_parse.patch | 71 +++++++++++++++++=
++
>>   .../python3-pykickstart_3.48.bb               |  1 +
>>   2 files changed, 72 insertions(+)
>>   create mode 100644 meta-python/recipes-extended/python-pykickstart/f=
iles/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
>>
>> diff --git a/meta-python/recipes-extended/python-pykickstart/files/000=
5-options-adjust-to-behavior-change-in-upstream-_parse.patch b/meta-pytho=
n/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavi=
or-change-in-upstream-_parse.patch
>> new file mode 100644
>> index 0000000000..e2b34ab937
>> --- /dev/null
>> +++ b/meta-python/recipes-extended/python-pykickstart/files/0005-optio=
ns-adjust-to-behavior-change-in-upstream-_parse.patch
>> @@ -0,0 +1,71 @@
>> +From f753d4d6ad1f4846d14735beb3d1b157b9914b51 Mon Sep 17 00:00:00 200=
1
>> +From: Adam Williamson <awilliam@redhat.com>
>> +Date: Wed, 2 Oct 2024 09:48:39 -0700
>> +Subject: [PATCH] options: adjust to behavior change in upstream
>> + _parse_optional
>> +
>> +In Python 3.13 and 3.12.7, the behavior of _parse_optional has
>> +changed. It used to raise an error on multiple matching actions
>> +itself, and only ever return None or an option tuple. Now the
>> +"raise error on multiple matching actions" code was moved out
>> +into consume_optional, and _parse_optional returns either None
>> +or a *list* of option tuples, which contains more than one if
>> +multiple actions match. See:
>> +
>> +https://github.com/python/cpython/pull/124631
>> +https://github.com/python/cpython/issues/58573
>> +
>> +This adapts to the change in a way that should work on both older
>> +and newer Pythons.
>> +
>> +Signed-off-by: Adam Williamson <awilliam@redhat.com>
>> +
>> +Upstream-Status: Backport [https://github.com/pykickstart/pykickstart=
/commit/f753d4d]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + pykickstart/options.py | 20 +++++++++++++++++---
>> + 1 file changed, 17 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/pykickstart/options.py b/pykickstart/options.py
>> +index 2e3a0721..ca0e18af 100644
>> +--- a/pykickstart/options.py
>> ++++ b/pykickstart/options.py
>> +@@ -177,9 +177,23 @@ class KSOptionParser(ArgumentParser):
>> +         self.lineno =3D None
>> +
>> +     def _parse_optional(self, arg_string):
>> +-        option_tuple =3D ArgumentParser._parse_optional(self, arg_st=
ring)
>> ++        # Before 3.13 and 3.12.7, this returned None or a single
>> ++        # option tuple. From 3.13 / 3.12.7 onwards it returns None
>> ++        # or a *list* of option tuples
>> ++        option_tuple_or_tuples =3D ArgumentParser._parse_optional(se=
lf, arg_string)
>> ++        # all we want to do here is a custom warning if the action i=
s
>> ++        # deprecated. we can only safely do this if there's exactly
>> ++        # one matching action
>> ++        if isinstance(option_tuple_or_tuples, list):
>> ++            if len(option_tuple_or_tuples) =3D=3D 1:
>> ++                option_tuple =3D option_tuple_or_tuples[0]
>> ++            else:
>> ++                return option_tuple_or_tuples
>> ++        else:
>> ++            option_tuple =3D option_tuple_or_tuples
>> ++
>> +         if option_tuple is None or option_tuple[0] is None:
>> +-            return option_tuple
>> ++            return option_tuple_or_tuples
>> +
>> +         action =3D option_tuple[0]
>> +         option =3D action.option_strings[0]
>> +@@ -191,7 +205,7 @@ class KSOptionParser(ArgumentParser):
>> +                             "kickstart. Please modify your kickstart=
 file to remove this option.")
>> +                           % {"lineno": self.lineno, "option": option=
}, KickstartDeprecationWarning)
>> +
>> +-        return option_tuple
>> ++        return option_tuple_or_tuples
>> +
>> +     def add_argument(self, *args, **kwargs):
>> +         if "introduced" in kwargs:
>> +--
>> +2.47.1
>> +
>> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-p=
ykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/pyth=
on3-pykickstart_3.48.bb
>> index 953068f7c3..657d0df539 100644
>> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickst=
art_3.48.bb
>> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickst=
art_3.48.bb
>> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/rhinstaller/pykickstar=
t.git;protocol=3Dhttps;branch=3Dma
>>              file://0002-pykickstart-parser.py-add-lock-for-readKickst=
art-and.patch \
>>              file://0003-comment-out-sections-shutdown-and-environment=
-in-gen.patch \
>>              file://0004-load.py-retry-to-invoke-request-with-timeout.=
patch \
>> +           file://0005-options-adjust-to-behavior-change-in-upstream-=
_parse.patch \
>>              "
>>   SRCREV =3D "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115888): https://lists.openembedded.org/g/openembe=
dded-devel/message/115888
>> Mute This Topic: https://lists.openembedded.org/mt/111636553/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux



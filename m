Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F276C83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 10:32:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19204.1751538727338055557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 03:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927955dfc7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634bSjY024995
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jul 2025 03:32:06 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm5605-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 03:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7/rYyGEKMrg7FDW8uWjXCli/BgOSVA7Zm4hJdmEPtX8TqZiYPnFEpgsLoEQnl0OKYPZ8R58M1ydd8lIdrZfcLG57gOSWKGpzB9wVVpGpEP5EgVF9eIBugBFPLHa/XNTEkDCdZTmmDs0lgZlwK85bF6SB90945ICbqW7aaHRpCkELeYtj+8PW624Nxq1Q2oqSihNbbdhH5ZIDV4hZTruqff2OX0ASTLEUaPiggL3pqbG/KVmyCbcoqOKwobugGewe8Al8PFLTZs8y2db0kB9718jWZ46li/DwLFw467azze/t+zFOmA55AYrjPkGhtf25S68BUiylw3We7pu4a2GMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mshpRVDdqkjheXQFpp+rCVg5NzyezbWu7l9Uklh8vz4=;
 b=I8F4aTariWRD39/JKSXkx5Ve+PASn6o7HZ/a+yLSIj4A/4iiOXqkLRInlqp6QZB9zXxgl2Sp3QMHD87x14KgDbOQrGw/ml1oNCBUVxYe8SJkIQY/9tMLLNF6VgPmmlAfzuL8RdVPKVUcQAsiY6g4ArHhDjuoZX8OAcPrjPMR1Ow/YCZ68beNkgpFEUvVz/4x9/cdZfvnTt+h0xKhKIcOL4WiZU6UYR9kdTLeFMypL9fGi6+GeXWZwssyu3dmksvXw2M9XBqvHG5dIgM+x0p9/uodGzovBKOWeonkDgSO4MQ3CLKoBO6LOSFGvB4vSCBUcFogrSCTOSWW84LAHDJ9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:32:02 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::c173:acfb:56ef:8120]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::c173:acfb:56ef:8120%6]) with mapi id 15.20.8880.034; Thu, 3 Jul 2025
 10:32:02 +0000
Message-ID: <2aef6621-1d92-43d6-96f9-990703d32efd@windriver.com>
Date: Thu, 3 Jul 2025 15:57:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: upgrade 10.11.9 ->
 10.11.12
To: openembedded-devel@lists.openembedded.org
References: <1843F8DCEBEB5409.8712@lists.openembedded.org>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <1843F8DCEBEB5409.8712@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: fe443f03-7deb-4ec9-5d83-08ddba1cd8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmRIb0xaSFV5Q1JsVlNJVVRRMVZlK1VsazJ6R0dtQTN2dXhZVzFvbFkwZDA1?=
 =?utf-8?B?YUx4aWZIRXc4VTExeFVuYXkvd295ZHErODBoYjV1NVNabGt1djVFN3RqV3Z4?=
 =?utf-8?B?d0VydVM5VUhhRWo2bGovcjRzKzRMdWNML0Q4a1hJYng0ZGMrUHNqOVVSbW1L?=
 =?utf-8?B?aTA4OUdwMlBxcVJQckM2UFpXeXJrdncvV2dQVE1qZittUEJWdEwrY09JVGFS?=
 =?utf-8?B?TjJQVUl0UDFEZUZmUm53c1ZHcUFwS20xRWEwRnRITENRWnVSWjhMeEFWazFW?=
 =?utf-8?B?NUE4bTZwbjVESHVYSkRsektIbDhVQmJaOWpKK1NyRUxrT3QxU1hNT05SRWV1?=
 =?utf-8?B?QlF5akdsaEZQaXQ0b2FOZ2NETWNqajJCRzVQN0p0M3BqVHBIeXNlclIxR1Z3?=
 =?utf-8?B?WE5xNEEvQURuZ2pjNGhXWXlZQTlIeW9QUzVEb2swdE5nZ0dWSmRkcnU2OHd1?=
 =?utf-8?B?NVJkRkswYkFWS3B6SHZ5WnhkeWVDcXEzZnBnOFdobEJveXlidnJOK3VBVDZt?=
 =?utf-8?B?T0o0WGptYjhrOFlpZ080VTRyMGtzUjNwVUMycEtMZkVPVmVreFRYdEtnYkxT?=
 =?utf-8?B?aU85VEVUc1AvWXJrcTQ3MzhjNWVIM1oyNDlrL2o3Q0huRTBQRnVzc2ZKM2xR?=
 =?utf-8?B?RThjaVJHNllVNVNwWGZtSENPTXE3aTh3QmdxUTNrUnZweGxMaDFkcFdXNWIv?=
 =?utf-8?B?Vm1tYnBoWHpQdHArekdJOUxxeUhPV0d4WEU3UVM1RWtZR3VSMWJkNGd2RUJJ?=
 =?utf-8?B?K3NxSFdwUFVPb0VpQWdkdUVVcm1WTm0rbTNwYUo2OTBJblRlZ0JyNVpwOExh?=
 =?utf-8?B?NGcvbUdJamdmWklIdzVPcE1aeDI1MlhIWS9kTTVpNmVqdURCc0NqVkZWcW1m?=
 =?utf-8?B?MCtBakNBK2ExMldUcGp6emsxNEEzWUFjNExjMmZMYmxVMjVSMDQ1bm1rTU5i?=
 =?utf-8?B?NEs5T3J4dlpCU2NpeitoVzdydUlaZnhpNm1xbTB0d2xQV2RYYUtxUkdRVEo0?=
 =?utf-8?B?Y2JtMzFOcyt3akhjTVJ0MU9yZ1RPOTVYVGxLUDhScDRJSzJTS0k4Mzl6WGVy?=
 =?utf-8?B?NzRpbzVCYkZITjRrQ2l6eVlxN0NBNjg4a3VYNksyZ2FmbGlqYTVNb01kUEx1?=
 =?utf-8?B?dzAwazBZNk5na3haK0xMem9HMnUwUjBHYkRFdTZldHc0MnQyZnhlTVZpQzJq?=
 =?utf-8?B?c1pmbzMyMmhySUpnc0Frd0hlbUtRd3N4U0phOXhSZ3VkNHRmbEpQbkFSQXhK?=
 =?utf-8?B?UGlaUkRNVU5xeUZFSFUxSlBRL0xWV3gxRjVkaUdpQWJGYjlQc0VLb1BQYWJ3?=
 =?utf-8?B?aUZPNzY3cEZURHo1QzBOVlJYQWttUjJqZk9hcCs5eDdUQVZiL0dBbjA1Q2pT?=
 =?utf-8?B?N0hDcVlJMzgwWFBkSnFkUkNrNjJmdFlHcVVqN0FxSGRVdTlBK25GcDBWQ2E1?=
 =?utf-8?B?TFNSd2NxZkVCMFl5RlVuS29qZWdjRE82VVYzRjBlSmJBNkFzTnpRRmNmWDE5?=
 =?utf-8?B?YUZiY0FYdmpGRkRWdTlKZHFVQ0JDY1hoc1pVNzJyRHJsTzk3aytiUjdiTTdT?=
 =?utf-8?B?Y3UyU0pJZ1l3VTFlNGQ1azhZRWQ3YW9QeDlSdTBRbWprWlRwdFI0R2lhcWJ2?=
 =?utf-8?B?TUptSEZad0NRZmluYkxQU243VmZtRkVyTGFBYXNDVldoOVl0a1pMcXF6Nm9L?=
 =?utf-8?B?ZmVEaTMrb0lybU5ZcWJ3dW5henN5amthTlJFOVVCTGRWazVPaE9KUHFpNW5q?=
 =?utf-8?B?NU5CT1Z5bm16RjNlclJZWXhvYjFyaGQ1anUxTWNQRHhkZ1A1ck0rSWp3WndS?=
 =?utf-8?Q?ldIkBbyyiiK2IY1MQdz89G4cLcCoRtRqC1nQM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHBzTjFjS1lCaEpUbEFFNDd2SDRLeS9rT1NrV24xdzJyTG05TlRiRDRneHpC?=
 =?utf-8?B?dzdYYnJSb1pJMXkydjBDWGpScGFxMjJuS2NaRElXZFF1OFpBUWdVemovZzEw?=
 =?utf-8?B?WGU3RGtlbVlwN1BIZDJ0VVZFMWhEaDFxdVBEWWpPMlNCRWJUZU83dllMcDJu?=
 =?utf-8?B?dWJVZm4yOFJsekV4OGdkTER1NmsyMTNrNmRkTmg0c21VUkJWRnl3K0JiN3RD?=
 =?utf-8?B?TUw2NHR1Mm9kbzcyM3YvSHF2VkdsRTRTNmsvZ3FDQ29XMkNTcTJ0SmZ6K3dz?=
 =?utf-8?B?UUx3WmJ5TFNvN2dERGJacGRvcDBGTlg5cDR6NFJSMlVwWjZwZXVvclpWYStR?=
 =?utf-8?B?eklnL0FkMlhpQzNIUHQ0NDNEZGsyYjVVVk1GcnBJcjVKVkZ5bHhTZ2FMcDdz?=
 =?utf-8?B?ZnBONmlFaTVsUW1uUjR4cGwvNXpSODdpT3h6eDNhVk1RdUxvc1hKSWlRTVZU?=
 =?utf-8?B?QTJYRURNWVJtREk2QVpqaUo3T0VRR1RpUVhWSFZERlpnVEVKUzhjQUFxcWF2?=
 =?utf-8?B?SkQ3VHRGRG9ZU0o1bzlJckJpWHQvN0x5T1cyV2RqSDBjb3ZFS0VFWE1odWZL?=
 =?utf-8?B?YkRZNW1QWllCek5weHI4blB6Y1A4M1ord1dwcjI1b3gvN0cveGMwcHd6Z21j?=
 =?utf-8?B?UkJZS09RWDI1b1J5akRuVWRpajJZMDV2Q3U5VHFuQzRMZE4wdlViU2VmOGNR?=
 =?utf-8?B?RktGclVhUjdIai9tNDFlM0NYL3YrOXVMOTZJZzVGTS9hNjY3VzNPMHJYeVRp?=
 =?utf-8?B?V2Erc01jNmZQYW4zSFdyNkRFa2dDZ2pUSGphWkVRZlpYYm00dTVqNFJzTllQ?=
 =?utf-8?B?Zk55bzlxSUQvNGJ5ZEhNWkJHWjFvMTZUdlJZQ1VvV1JReE0zakIxT1FCbHdN?=
 =?utf-8?B?MyswUXRPSjZyanpNTU05cDdxd0FqSDNGT1orTmp6RGloUHMveW9LSzRYQnRQ?=
 =?utf-8?B?UGxzZjB1OHk1cXlFUVF5UWdoUmdVZk5XZzM4RkljV1Yva3JsYzhPc3dBUG9Y?=
 =?utf-8?B?dmVCeGYxc3VCWEpWWFB3T0xnT1lNMStiZy9CUFRhZmhMc2Z5YU9JaHBRck1u?=
 =?utf-8?B?MUhJSkdSZG16WjZBQytWUXZGZ0c5Q0JjRkRvWFpsOUhmcHlGN3VlQzJuQ0xM?=
 =?utf-8?B?R2V5UUNzTU5WbGs5TzJXTi8vZFM2QkJ2YTVKZVlQR25hV2lSS0JsRFprNm0y?=
 =?utf-8?B?bEh0azlxR280ZXpCZlJKZXhFL0FlTzJtRWVKd3lmNWRZQTdRcjA1V1BZYmtF?=
 =?utf-8?B?Yzl3Nk5qVmZiUHNWQWF4M2FKR1hUeDcwdHZUR2JOSG12TGNFaHo0ZUJMQWUw?=
 =?utf-8?B?MTdwR2dyL3h0WnNPVGhFY1N4QlRIcHJVRUZaTzE5SW05KzV4emFaSXZ5V21i?=
 =?utf-8?B?OCtRdkVrL3U1dWdvSnpwcTBpbW5qS3N0a0xremxSY3hQYkdtLzBzN0ozMWpQ?=
 =?utf-8?B?SFM2d0xaNFd6MjFmOUlvV3djdkRYMnQzM3dmYjM5Q09YK1A0SExzRXNHcTE0?=
 =?utf-8?B?QUNad2hDYUJuWmgrVjVhbkNjSDd1MDdvc0ZoNnJ3eGgvb3pWb3hrWTBkT0NS?=
 =?utf-8?B?aTdyMmUyeVdtemJjcEJvcnlMN3dSaTREdnFYMjlDVTVMaGx1SUhQLzlQZHZG?=
 =?utf-8?B?ZmFBcU5HNE1KWGN3bUtDVytxUEFJRm1IdFVXUmgvcFBHWlJIMXpCSkNXRTc5?=
 =?utf-8?B?Q2tzcEs3VlJHVkpCT1ZaUkppUVNLaGc3Mnd6b0FIc3lMd0s1TTVGYVUvZ0JZ?=
 =?utf-8?B?VSt4NklWNTFNdXNjTVExTzRJMzJXd0tVZVE4V0ZhbVgrZ1ZEcEV2cHlTKzg1?=
 =?utf-8?B?MFpva1NzclJRMFBiM3RZUkNnRU45Z2ZQUzRvNlhRRUNtdWpQSGNqTUx5K2NY?=
 =?utf-8?B?M1h3cGg5dEFBbVZxTUlkN1p0R1pZOTlDNllNcURJUE14OEh1S25EMjN0NWZi?=
 =?utf-8?B?VndndVRZSENvcnhGTkxDQ2RZYlRaQnJyNnlyQzR6Qno5QVBtbjlDek5ma0l1?=
 =?utf-8?B?TWNNc3dEZWFpYXFqQzcxcUUxczlnV1J0ZU9oV1p6UHdmTVk2VmtieGNGejVM?=
 =?utf-8?B?NC83SWIvMmU2TWV2OUQ3V2NDREp3UGE0REVmcjV4SXJtNG5mUVVndkRMdHNW?=
 =?utf-8?B?M1h4ejhOUG1mcStaYnVsMFJGUmhHUzZCK1VrRWNuVWN4VE1WQkZRSFBFbGc5?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe443f03-7deb-4ec9-5d83-08ddba1cd8dd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:32:02.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8tnYwiX6Q30aoPMJ1eHMbQ8ti3BPqIKfTFgOMJmkpebX+zvcDEepAmt4v6u1hkDILUzrVBBOwCTSWbLB0kF5VCvEwJ3pmvOOC/H7gVZgfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=68665c26 cx=c_pps a=2h7+rz15EAxDzAjAtcO37Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jpp-Wi3FAAAA:8 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=kmYkUENqAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=amQgE9w9eMv-prNCX5AA:9 a=QEXdDO2ut3YA:10 a=3HWhRrkoiJongTt84g_J:22
 a=NA03pvyaApPJG5valX87:22 a=p9kz6gysRiz6SGr9lVkz:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4d53BxrAbSL9jb3MEwUqsPBqyr4WGZEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4NiBTYWx0ZWRfX9u19rS7tVR7W cZVD3hpym4VUDQZDDS2aoW2Vpk56olQkmI5u4h5t9iVXWBbIgo4AjqGUBraYopvUnCU4vmas7XV qCotG9O8u8GKWZeW8ImtMbtdhMgXSTwHAnpcWOKUTvv2B7uIBABwFtFGpgrWVdFZD+f4YB+jNnJ
 K7jc2kEUPmTwn0xt5bSXryJxTY4Enda+7Uy1NWYXAjTRNn2dWM5xb0j7FBOpvtOnJm4cA1Nu4mg +8Tm+ZiJOGFLUq/UwELIt5xanBhwziMJE+tMid5jb7wbwnNAhJ2t6fvwiEUaDcG6V5qsLrY4lUv O5Rs7mk4e3XsGL9RbCmDOb5nP+OGc+Uv6RnUOjLF8geLu4+bD3CQHuTVmiwIYYnzsWgki2DC9gD
 gUK1Xzg+1h6FQiTE/amUfgf8CFNy0EZW7C97YFCa+W34EVMoU06tkvNaQFCCvQQTFjt3MJpO
X-Proofpoint-ORIG-GUID: 4d53BxrAbSL9jb3MEwUqsPBqyr4WGZEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 10:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118219

Gentle Reminder!


On 29-05-2025 16:01, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This upgrade includes fix for CVE-2023-52969, CVE-2023-52970
> and CVE-2023-52971
>
> Changelog:
> https://mariadb.com/kb/en/mariadb-10-11-12-changelog/
>
> refresh 0001-Add-missing-includes-cstdint-and-cstdio.patch and
> ppc-remove-glibc-dep.patch
>
> Droped mm_malloc.patch as this changes available in 10.11.12
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   ..._10.11.9.bb => mariadb-native_10.11.12.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
>   ...-missing-includes-cstdint-and-cstdio.patch | 43 +++++++------------
>   .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ------
>   .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 26 +++++------
>   ...mariadb_10.11.9.bb => mariadb_10.11.12.bb} |  0
>   6 files changed, 26 insertions(+), 59 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.9.bb => mariadb-native_10.11.12.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.9.bb => mariadb_10.11.12.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index f52947f359..51f56d4d11 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -17,7 +17,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>              file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>              file://ssize_t.patch \
> -           file://mm_malloc.patch \
>              file://sys_futex.patch \
>              file://cross-compiling.patch \
>              file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
> @@ -25,7 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>              file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>             "
>   SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
> -SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
> +SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>   
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
> index f8ccb998be..fa580d039a 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
> @@ -11,27 +11,14 @@ Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   ---
> - .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
> - storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
> - storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
> - 5 files changed, 5 insertions(+)
> + storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
> + .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
> + storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
> + storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
> + 4 files changed, 4 insertions(+), 1 deletion(-)
>   
> -diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
> -index 963c1d8e..73487edd 100644
> ---- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
> -+++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
> -@@ -5,6 +5,7 @@
> -
> - #pragma once
> -
> -+#include <cstdint>
> - #include "rocksdb/rocksdb_namespace.h"
> -
> - struct CompactionIterationStats {
>   diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
> -index c7f93b4c..3c2ab805 100644
> +index 7fb9d489..f7b4e6f0 100644
>   --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>   +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>   @@ -8,6 +8,7 @@
> @@ -55,20 +42,20 @@ index f356395f..32152217 100644
>    #include <vector>
>    
>   diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
> -index 6db11cc9..c26b6a21 100644
> +index 3c3656de..b18d7f5d 100644
>   --- a/storage/rocksdb/rocksdb/util/slice.cc
>   +++ b/storage/rocksdb/rocksdb/util/slice.cc
> -@@ -8,6 +8,7 @@
> - // found in the LICENSE file. See the AUTHORS file for names of contributors.
> +@@ -12,7 +12,7 @@
> + #include <stdio.h>
>    
>    #include <algorithm>
> +-
>   +#include <cstdint>
> + #include "rocksdb/convenience.h"
>    #include "rocksdb/slice_transform.h"
> - #include "rocksdb/slice.h"
> - #include "util/string_util.h"
> -
> -diff --git a/util/string_util.h b/util/string_util.h
> -index 55d106fff02..11178fd1d7b 100644
> + #include "rocksdb/utilities/object_registry.h"
> +diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
> +index 7794dbb0..b480177e 100644
>   --- a/storage/rocksdb/rocksdb/util/string_util.h
>   +++ b/storage/rocksdb/rocksdb/util/string_util.h
>   @@ -6,6 +6,7 @@
> @@ -80,5 +67,5 @@ index 55d106fff02..11178fd1d7b 100644
>    #include <string>
>    #include <unordered_map>
>   --
> -2.25.1
> +2.40.0
>   
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
> deleted file mode 100644
> index 6aa6c84882..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Pending
> -
> ---- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
> -+++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
> -@@ -5,7 +5,7 @@
> -
> - #pragma once
> -
> --#if defined(__clang__)
> -+#if defined(__clang__) && defined(__GLIBC__)
> - // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
> - // declaration does not. There is a hack in clang to make its re-declaration
> - // compatible with glibc's if they are declared consecutively. That hack breaks
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> index 3787b74ad1..ab66d77019 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> @@ -4,16 +4,17 @@ Remove glibc specific function dependencies
>   
>   Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/my_cpu.h | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
>   
>   diff --git a/include/my_cpu.h b/include/my_cpu.h
> -index f2e26fca..94599b74 100644
> +index 2b34e03f..27c6c227 100644
>   --- a/include/my_cpu.h
>   +++ b/include/my_cpu.h
> -@@ -24,17 +24,16 @@
> - */
> -
> - #ifdef _ARCH_PWR8
> --#include <sys/platform/ppc.h>
> +@@ -27,15 +27,15 @@
> + #ifdef __GLIBC__
> + #include <sys/platform/ppc.h>
>    /* Very low priority */
>   -#define HMT_very_low() __ppc_set_ppr_very_low()
>   +#define HMT_very_low() asm volatile("or 31,31,31")
> @@ -31,13 +32,6 @@ index f2e26fca..94599b74 100644
>   +#define HMT_medium_high() asm volatile("or 5,5,5")
>    /* High priority */
>    #define HMT_high() asm volatile("or 3,3,3")
> - #else
> -@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
> -   __asm__ __volatile__ ("pause");
> - #endif
> - #elif defined(_ARCH_PWR8)
> --  __ppc_get_timebase();
> -+  __builtin_ppc_get_timebase();
> - #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
> -   /* Mainly, prevent the compiler from optimizing away delay loops */
> -   __asm__ __volatile__ ("":::"memory");
> + #else /* GLIBC */
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117654): https://lists.openembedded.org/g/openembedded-devel/message/117654
> Mute This Topic: https://lists.openembedded.org/mt/113359604/7312273
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


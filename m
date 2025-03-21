Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E48C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 14:36:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1416.1742567798219362558
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 07:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5175011b82=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5vN90004034
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 14:36:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h97akr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 14:36:36 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52LEYdWn016151
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 14:36:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h97akq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:36:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bM44jbKYzY5/8kKmyGMXhbY9XCF9TTPLp/IbWknjrtB/MszBAawfu8Q6/qwX+5gj8b1vVb/fG0FM0HLVKpKcStwJ0q5zmCXkjvnsnlzec90V6oslVfcK7GzaxyUmVFOl8RYX5EB1AWlhDt1VQrVWapW7n5eDB1fgL989TcbHN//GDH9EFvw1EC4DiHLUTT41OXHxpHDmLWvujBZ/Q+IhaUr8A8Lehu6+Qr3PhkBm87pa9iIEKOOTd0BJvDiqSeWGrbGmR9z+8aKadhQljBYihh9KJJVK5lFm/3KBMdGTHQB1Ie5VyWonABxzKnrEfGo2J7EXGlqjROAnjGf8bhpzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVvAnQT9ktQSeSCj/BMudIvTYrk0kk/HsCksRLcIDuc=;
 b=nbVe7FVFwJ0sGJLzo0SfcAUFTKlwSgBv4RIqJzpNMTgrCrHWQaBOwfmX1Oc96W4x88H/6OBudzb00CDp3rHa6HUR61McnK0TlU1wpSwpg1YCzR2JdukXegnlKGen625BDHhNhKMdvFX0VvwRETuKD+hggU23ryENADsk3RUnZ0XJTYWccfWDYO1ivWKyu7oy1HVrYEJDMSJ/hfhJl2OzUlbwnOlDfdOKchvoSZevcVY/qoZC/IZH+XowVhaOcOh+P+sic9IlWPg9Mvah1G6Zq9aIN4VAaiCXdaQNiw6qPP/2iLmZDdFi5WUXo0AArJG1Wcy00ItW8qfz3tJtczb4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 14:36:34 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 14:36:34 +0000
Content-Type: multipart/alternative;
 boundary="------------6jl0odtVoG3uh6KtkYFwja00"
Message-ID: <b2aa089e-7ead-425a-9c7f-5a2030724b01@windriver.com>
Date: Fri, 21 Mar 2025 10:36:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] chromium-x11 build error with Rust enabled
To: zboszor@gmail.com,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>,
        Otavio Salvador <otavio@ossystems.com.br>,
        Max Ihlenfeldt <max@igalia.com>
References: <2f55c72d-7519-4a8b-82fd-385cfef64f95@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <2f55c72d-7519-4a8b-82fd-385cfef64f95@gmail.com>
X-ClientProxiedBy: DM5PR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:4:60::42) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d54272d-df2b-4379-8d5c-08dd6885c736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDhqQVJXVXJ6Z3BpYnN5TFhuS014c3I3ejFJZFV2Y0V4blc5UVhzclRDMkRZ?=
 =?utf-8?B?T2pGbk03c2pUUGRvMFFFcys3MmtNdVlURVJVQ2E1NkRTTTVwbEJNeUxDaGZq?=
 =?utf-8?B?ZmZiSVdRK1FBekh3azBNMVFGayszU2JtY0RrY3AvbndMWWR3ZnBCTGs1Q0lp?=
 =?utf-8?B?L3BkN2FUY3MxcHk4Vy84Y1RndlFzRVRXUVpVTXhlL293VmdCT0tNU2MvejFt?=
 =?utf-8?B?ejlJRk5PbEdYLy9KWmZWb3NkNlRsVDVSUTlNZWNjUC9iQU1nZUdqN2pqV2w1?=
 =?utf-8?B?TEU5Z2ZCNzRFdGh2ZzU1K21mR1EzRUJzSnFrRzRmV2FOREpwcWh2VEQ0RWtZ?=
 =?utf-8?B?SlhpMzJDTUVXVzB2TkQ5cEViY1RPRGZuMXpPL2k4Sk8vbHNoVUY0bUQzbUdW?=
 =?utf-8?B?cW1LTkhHVTcyZHdHZExydzN4Y0E5ekVRYlVkczM5T25PRk1YZ0hDdGpRSko4?=
 =?utf-8?B?M3Q0b1RRdlpjeDRUcUdMcDgxSVFtdXZUMVBsemhHc1NaWG4zdkFoZko4ZDgw?=
 =?utf-8?B?MXRPaEplUEhqcWlxUXRqNisvSyswRHB3ZE1NS2JsTXM1SzVOQmVDZTdHR1Jh?=
 =?utf-8?B?SEFURC9KZ1RQQmVPTVd3RENpMFpKQTBkVDZxSWVocWcxNEM0SHBUZyt4ZUZa?=
 =?utf-8?B?eVBiOG5rcHVvbXBLU3JGV2l6V3daRFFEL085MVUwZkJhVVh4bFdHblQvV0pT?=
 =?utf-8?B?Wk04c0dXbW1wRUdaUmRMMDNhRG1OMHdkZCtSZ2VadVFucTg4NEgyS3g1a3lz?=
 =?utf-8?B?QjNxczVIb0orQ1F2RUhLR3E4ZUZoc1pqcE96TWMzUkdIakdqSGRYeGVoczc2?=
 =?utf-8?B?d0JicFFTOEFNZFV6QUl4ZE9Eb29jYktudUZ0RGd5Tk9WOUEyWm9jSE81UHZl?=
 =?utf-8?B?Um1lM2Vtems5QUdUM1VOV2gxam9XY0dWVzZicjIvZVFPaHhLTFBkV0RUYnU0?=
 =?utf-8?B?QnI1M2lPcEJNd3JVYkxhdjNHbWJGa2V2VDVGc2lTQjRQSFdWYXQyLzlPeWxP?=
 =?utf-8?B?MFBnZ1BnbjhqNlZ3QTVMZ2EyR0dubGFJcEl0cXppVy9LUkd5eVpNWlNFODgw?=
 =?utf-8?B?dGJaVm5pREtFV001QXFEYjBJdDlrZXZTNVQyN3AzUGsrMVd3QXEvdGoxVCtM?=
 =?utf-8?B?bktxNkxhbU8vclBVLzU0MU53SzdWdzdQZVdyMGt5NmtwUkh6a25yeE4zM09S?=
 =?utf-8?B?c2p3MVYwRXFNeXFiUXdzRU5TMHBXaVdxdm1NOWp3Nmp3ZkdWbzNxeE52UXNk?=
 =?utf-8?B?SkIrUGtWdUZwZEd3eC9XZ0M3aTRXSmw2cnRlZEpudWNwcis1ejBsSkE0VG9B?=
 =?utf-8?B?TU1SRE1DcldwWmhkN0tsUUV4aTlsd1hUODZaTk5PVkVac0tNV2FPV2IzdUl3?=
 =?utf-8?B?VUVGU3UrQW55dzdnZEhGdEZmVERJWjIxR3ZFY282N00vK3RyOHY1bnFZbXVo?=
 =?utf-8?B?SDNEVWZMNXdGVm1qVmFrUFROdis5VUJUVFlpQ2lBbzY5eUtnQnNKUHZZeFA1?=
 =?utf-8?B?NGR4ejc2VkVSV01SQ2o4VUdWRmFmUFlJemlGQnEwc2VDM21kUUs0N2lQR0U5?=
 =?utf-8?B?K1NaQlRxczFiZWxlL0RMZ3BiRmt3NHJ6UXlMcnNJVjJMMzBKUU1PVVNpRjNF?=
 =?utf-8?B?ZDM5SEd3NHQ4eXNtUHNDU1JnRjljR2szQi8vK3VjWGFiRldHMXBGaTFLcjFR?=
 =?utf-8?B?cVdZSGdmVHZhL3hvVUZ6NFpYcWcySzRoNXZYeU5sdGpMWkJxa0pjWlE1NVZB?=
 =?utf-8?B?UVlJcTN0ajJjNlVJcDJsL1RyOGZvREFoOVlHR29oaS92bkhwdlFvbmRQQm1O?=
 =?utf-8?B?QWhtcUp0S1FqblV1d2IzQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZE9CSWh2am5SMnV2aVpwRStLUi9KbjhaNDU3K0dCdWlnbEpPNzZnREdWSURz?=
 =?utf-8?B?V0piVEJvVmc0MDRnZDZ0TDFRRmRrck55b2R4c1J0c25hTlBKM1V3SE1MRnNv?=
 =?utf-8?B?ZzFSNFFVU25sWTFBOTdrZ2lDaHoxUGlyQW9JcC85T3Y2Q3FkZlcwbkVsaFps?=
 =?utf-8?B?VE5CZVNmSzV6L0gyMURGMmpyNDhmbFF5ZURBYUpLR2lwRDJiWWM3dEEyeXdh?=
 =?utf-8?B?QlBzY0dZbThsZ3NVNDBoZWpQRmZQbkYrNkphYmFxam5NMTNxVWV0Y1AvcmRO?=
 =?utf-8?B?SGdjWFNMRXlXL3V0dkExNHg2NmN4VnVKck8yc3pNNHJ3T1pWbXdGUGV1aXdT?=
 =?utf-8?B?aUszZE9PUHorSGV5RVI2TTc5bU1aU29iR2JyUGdJWEVwN2VTWEVNUHN0RlVW?=
 =?utf-8?B?SjVkRG5RZ2xIUGM1aHV5Wi9naVFRM3J6RzVuSmxVaVo3ckNrZTFCeXUySDJ5?=
 =?utf-8?B?cU1FUVpFL2xSSWtVWis1ODdtN1I2MlBhRzNBeWRlOHR2Z0ZNUEJ5TGZmNnVZ?=
 =?utf-8?B?Z3VBb1RDUzV4NGcxOFJQMFhmdWJVdStHMmdkOEpJTHQwTTdUZ0R1U1o1M1kx?=
 =?utf-8?B?QnZmNTVtM3F0bU1BcTFpTGI0V01ra0Evd0o3YWFHSWhERjAwMVdCRjZPdlZ0?=
 =?utf-8?B?THBZUzQvUnhzcExpWXNvbXRnSHdIeUVzN3c1Z1NGVWVCN1RWTEN0RDFJdHQv?=
 =?utf-8?B?T1R4TFd6R3Y0NURUZVBMMHo2dTlrdzVZVXlEN29DTVBKZlh4NG00Vld6U2s4?=
 =?utf-8?B?blBzbWtVTXcvaEQrblczWVpFZDhFeGszUlZZQVgwVFJ3cG1VM3hJNmJ6TGg3?=
 =?utf-8?B?Q3RnWDk5TkI5ejNTZEszRCsyNTYwQ25TblpES0xjd2tRSVlWdFhxYjdpSlE5?=
 =?utf-8?B?MTg1TDRJVGZOeENUZnp6Z3AxQ21kdGR5MzBEa2VPaitoRXkzTkJEeUVCbVk5?=
 =?utf-8?B?RXo2Z1FiNWVDdnlDVVFNVzQzeXFTVzNOVHFEMlhYdWRSMlZCMnZSTlBKT0ZP?=
 =?utf-8?B?UXdVdm1CQlJpQ0ZQK1I1c2dyNVlxZkM1eWF1aWd0SnpYQkhPVDk2UmgxbE5N?=
 =?utf-8?B?d1lOV01UZ0NrT2M5bytoVEtVZXRRd1REdlNpUWJRNUVnL0s1S3JCZVNkWkhr?=
 =?utf-8?B?QjFNSmRDQ1djcDgwdTV4OTVnek42MW14a25mUEtBNG1Mc2tUdmVlZkZCVmJr?=
 =?utf-8?B?TEs4eFhlOHUzdmdnckJtV1NYaVZTSWdBUFZlak9MdVI5NlVkQUprYnpQMlQ0?=
 =?utf-8?B?bk1PS2lhWTdTQ3lKSG1xak5DSkJXbWlRcHJUYlI2Sm5WSVEzS3k2eVcrekdB?=
 =?utf-8?B?MGRHQU03d2NTTi80RVNBZnp2a09WWWJETEh5YzZmNktNemNmS3lSL0I2Q0Qr?=
 =?utf-8?B?cGcvRUhqQmhtZldXcG1qUmhPZWduWkowdGdUc3gyYUlhQlEwQk1iTWNmdGYy?=
 =?utf-8?B?YzFtWjNjZ1Fxa3AzTkpZUGw3MXBDN1NtcEthZnliQk52UmtDeU05YmprVFFx?=
 =?utf-8?B?a01DQ0dWNnpUVWpzS3Blc0xkTkJmeHlwUkZxRlpjNFU0Z2M2YVFxM04vTkFK?=
 =?utf-8?B?SG15WERNcGRscDlJTUxPRVh6OU9FNmdobHplVWFGOXNSckJockpsYUN3dVh4?=
 =?utf-8?B?UU5Rbmg5SmNFbk5ObjVZTmN1SkUvWlFFT2FENGFKTGZUdlFENWdQNHR5SEhm?=
 =?utf-8?B?TUNIOEVwYmFVQnUzNmUxKzE5aVl3cm1Wd1lDenVvZnV3U3oyaVRDbDBmTnc5?=
 =?utf-8?B?WXVPR3IyNlQxY1BsbkJLMUhTaHFlaFlUYktVeXhDcENnRkc2QmEwWWpSN29l?=
 =?utf-8?B?b1VjTFBiYW9zNEg2NDRLSjR2bkRhaUkyaFlybTd6aFpKYkxVYWFIM2htSkp4?=
 =?utf-8?B?MzZ3cGZqRVRHUm1rb1BSYTlaR2JEelpRTWUrditGOWNsNXVqMXhZK0RPeGJJ?=
 =?utf-8?B?bkZYU3VUeVBqWloraHpJNWZScVN3SjRTZnUwdEtWU1VwbWFENisrZlNLTlpW?=
 =?utf-8?B?Wnh6TmQ3MjM0WXFrMVhtY1o3MXgxSHNDODZuaUNVeHZRRjJBV2RGcHR1UnR2?=
 =?utf-8?B?WXhTeC9ZSnU5cGhITTBXRXYrMVNPUVpkaUdVZGhWOUJQM2hVRkVoWXlIejdm?=
 =?utf-8?B?NWgrY00zVVdvY2pDcjJCbzRVWFpyQ3ZmZ0JDOXNNUndEckpKUGlhNURwY1hI?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d54272d-df2b-4379-8d5c-08dd6885c736
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 14:36:34.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkAzwTx+S2KvzL/k1jqAQ1HtACJrp12vi4Gz87FmOcS3WzmY0LK9vP4D3pvhoV3qMh913zsLCAIpbsv3iynQa+yrBquJXqIn92rbZHlcCjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
X-Proofpoint-ORIG-GUID: kzuo_SA7cojS8cmpx-oVIcxTdiDYbKPY
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67dd7975 cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=vTr9H3xdAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=QgR7A8S-Wq_T0ItztGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=yon6TPD-r5AN654tGUAA:9 a=0es-qM8gYt9WSgtX:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PA8lmga7p-WC9JnDZOVrhrSaLv2WllvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116188

--------------6jl0odtVoG3uh6KtkYFwja00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52L5vN90004034

Hi Zoltan,

On 2024-02-23 4:15 a.m., Zoltan Boszormenyi via lists.openembedded.org=20
wrote:
> Hi,
>
> since commit 0438fba4e773824fd2b41ded2728076deeeedeb1
> ("chromium: Enable Rust") in meta-browser, I get this error
> on several different chromium-x11 builds (i.e. Fedora 33 and
> Fedora 39 hosts, mickledore and nanbield Yocto versions):
These releases of Fedora are no longer supported by the Fedora community:
https://docs.fedoraproject.org/en-US/releases/eol/

Also mickledore and nanbield are no longer supported :

https://wiki.yoctoproject.org/wiki/Releases

Both scarthgap and kirkstone require a rust mixin layer.


Please let us know what you figure out.

../Randy



>
> | FAILED: obj/build/rust/std/target.json=20
> obj/build/rust/std/lib/libstd.rlib=20
> obj/build/rust/std/lib/liballoc.rlib=20
> obj/build/rust/std/lib/libcfg_if.rlib=20
> obj/build/rust/std/lib/libcompiler_builtins.rlib=20
> obj/build/rust/std/lib/libcore.rlib=20
> obj/build/rust/std/lib/libgetopts.rlib=20
> obj/build/rust/std/lib/libhashbrown.rlib=20
> obj/build/rust/std/lib/liblibc.rlib=20
> obj/build/rust/std/lib/libpanic_abort.rlib=20
> obj/build/rust/std/lib/libpanic_unwind.rlib=20
> obj/build/rust/std/lib/librustc_demangle.rlib=20
> obj/build/rust/std/lib/libstd_detect.rlib=20
> obj/build/rust/std/lib/libtest.rlib=20
> obj/build/rust/std/lib/libunicode_width.rlib=20
> obj/build/rust/std/lib/libunwind.rlib=20
> obj/build/rust/std/lib/libaddr2line.rlib=20
> obj/build/rust/std/lib/libadler.rlib=20
> obj/build/rust/std/lib/libgimli.rlib=20
> obj/build/rust/std/lib/libmemchr.rlib=20
> obj/build/rust/std/lib/libminiz_oxide.rlib=20
> obj/build/rust/std/lib/libobject.rlib=20
> obj/build/rust/std/lib/libprofiler_builtins.rlib=20
> obj/build/rust/std/lib/librustc_std_workspace_alloc.rlib=20
> obj/build/rust/std/lib/librustc_std_workspace_core.rlib=20
> obj/build/rust/std/lib/librustc_std_workspace_std.rlib
> | python3 ../../build/rust/std/find_std_rlibs.py --rust-bin-dir=20
> ../../../recipe-sysroot-native/usr/bin --output obj/build/rust/std=20
> --depfile obj/build/rust/std/stdlib.d --depfile-target std=20
> --rustc-revision custom --target x86_64-oe-linux-gnu
> | Traceback (most recent call last):
> |=C2=A0=C2=A0 File=20
> "/home/zozo/test-yocto-4.2-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/c=
hromium-x11/120.0.6099.224-r0/chromium-120.0.6099.224/out/Release/../../b=
uild/rust/std/find_std_rlibs.py",=20
> line 139, in <module>
> |=C2=A0=C2=A0=C2=A0=C2=A0 sys.exit(main())
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^^^^^^
> |=C2=A0=C2=A0 File=20
> "/home/zozo/test-yocto-4.2-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/c=
hromium-x11/120.0.6099.224-r0/chromium-120.0.6099.224/out/Release/../../b=
uild/rust/std/find_std_rlibs.py",=20
> line 104, in main
> |=C2=A0=C2=A0=C2=A0=C2=A0 (crate_name, metadata) =3D RLIB_NAME_REGEX.ma=
tch(f).group(1, 2)
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> | AttributeError: 'NoneType' object has no attribute 'group'
>
> Obviously, using the previous commit works.
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109009):https://lists.openembedded.org/g/openembedd=
ed-devel/message/109009
> Mute This Topic:https://lists.openembedded.org/mt/104525282/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------6jl0odtVoG3uh6KtkYFwja00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52L5vN90004034

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Zoltan,<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-02-23 4:15 a.m., Zoltan
      Boszormenyi via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:2f55c72d-7519-4a8b-82fd-385cfef=
64f95@gmail.com">Hi,
      <br>
      <br>
      since commit 0438fba4e773824fd2b41ded2728076deeeedeb1
      <br>
      (&quot;chromium: Enable Rust&quot;) in meta-browser, I get this err=
or
      <br>
      on several different chromium-x11 builds (i.e. Fedora 33 and
      <br>
      Fedora 39 hosts, mickledore and nanbield Yocto versions):
      <br>
    </blockquote>
    These releases of Fedora are no longer supported by the Fedora
    community:<br>
    &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://docs.=
fedoraproject.org/en-US/releases/eol/">https://docs.fedoraproject.org/en-=
US/releases/eol/</a><br>
    <br>
    Also mickledore and nanbield are no longer supported :<br>
    <p>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://wi=
ki.yoctoproject.org/wiki/Releases">https://wiki.yoctoproject.org/wiki/Rel=
eases</a></p>
    <p>Both scarthgap and kirkstone require a rust mixin layer.</p>
    <p><br>
    </p>
    <p>Please let us know what you figure out.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:2f55c72d-7519-4a8b-82fd-385cfef=
64f95@gmail.com">
      <br>
      | FAILED: obj/build/rust/std/target.json
      obj/build/rust/std/lib/libstd.rlib
      obj/build/rust/std/lib/liballoc.rlib
      obj/build/rust/std/lib/libcfg_if.rlib
      obj/build/rust/std/lib/libcompiler_builtins.rlib
      obj/build/rust/std/lib/libcore.rlib
      obj/build/rust/std/lib/libgetopts.rlib
      obj/build/rust/std/lib/libhashbrown.rlib
      obj/build/rust/std/lib/liblibc.rlib
      obj/build/rust/std/lib/libpanic_abort.rlib
      obj/build/rust/std/lib/libpanic_unwind.rlib
      obj/build/rust/std/lib/librustc_demangle.rlib
      obj/build/rust/std/lib/libstd_detect.rlib
      obj/build/rust/std/lib/libtest.rlib
      obj/build/rust/std/lib/libunicode_width.rlib
      obj/build/rust/std/lib/libunwind.rlib
      obj/build/rust/std/lib/libaddr2line.rlib
      obj/build/rust/std/lib/libadler.rlib
      obj/build/rust/std/lib/libgimli.rlib
      obj/build/rust/std/lib/libmemchr.rlib
      obj/build/rust/std/lib/libminiz_oxide.rlib
      obj/build/rust/std/lib/libobject.rlib
      obj/build/rust/std/lib/libprofiler_builtins.rlib
      obj/build/rust/std/lib/librustc_std_workspace_alloc.rlib
      obj/build/rust/std/lib/librustc_std_workspace_core.rlib
      obj/build/rust/std/lib/librustc_std_workspace_std.rlib
      <br>
      | python3 ../../build/rust/std/find_std_rlibs.py --rust-bin-dir
      ../../../recipe-sysroot-native/usr/bin --output obj/build/rust/std
      --depfile obj/build/rust/std/stdlib.d --depfile-target std
      --rustc-revision custom --target x86_64-oe-linux-gnu
      <br>
      | Traceback (most recent call last):
      <br>
      |&nbsp;&nbsp; File
&quot;/home/zozo/test-yocto-4.2-gh/tmp-sicom-glibc/work/corei7-64-oe-linu=
x/chromium-x11/120.0.6099.224-r0/chromium-120.0.6099.224/out/Release/../.=
./build/rust/std/find_std_rlibs.py&quot;,
      line 139, in &lt;module&gt;
      <br>
      |&nbsp;&nbsp;&nbsp;&nbsp; sys.exit(main())
      <br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ^^^^^^
      <br>
      |&nbsp;&nbsp; File
&quot;/home/zozo/test-yocto-4.2-gh/tmp-sicom-glibc/work/corei7-64-oe-linu=
x/chromium-x11/120.0.6099.224-r0/chromium-120.0.6099.224/out/Release/../.=
./build/rust/std/find_std_rlibs.py&quot;,
      line 104, in main
      <br>
      |&nbsp;&nbsp;&nbsp;&nbsp; (crate_name, metadata) =3D RLIB_NAME_REGE=
X.match(f).group(1,
      2)
      <br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      <br>
      | AttributeError: 'NoneType' object has no attribute 'group'
      <br>
      <br>
      Obviously, using the previous commit works.
      <br>
      <br>
      Best regards,
      <br>
      Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
      <br>
      <br>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#109009): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/109009">https:=
//lists.openembedded.org/g/openembedded-devel/message/109009</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104525282/3616765">https://lists.openembedded.org/mt=
/104525282/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------6jl0odtVoG3uh6KtkYFwja00--


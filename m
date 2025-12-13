Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4F0D59F73
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 06:29:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1087.1765607352909240462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 22:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=WhAW/fAx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44421a18bf=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD6K3Ur3085997
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 06:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=gC3wWNxeMV82MosFpFnpIv
	HoQa9REYSiBwWmdC9Efng=; b=WhAW/fAx/CfEjvPp22rK6eOldM+EarJdId+rme
	vy89yMWor3TYQcrPdQ3y5Y421lnaM3IR9iITqHRU2jNcvsSA/pPE/DSQnMIbstLh
	yHpATfgWiwYAEx8K/b7t6HIWgaD4ad10fc1obpVuiO4MWeqYYKo3+Rizmq+2eOh9
	N/CnFhDlHyBXwzNHr7ODf2hIChkdxaMJsONr6EqHPFEYOQpYOwgd4ONaQmVznQR7
	xzhfLDi5IC5ueizEFQoEzdIbSMPl2uLFdVFSR8G/O4pk1FomiSg6beFV14novmt8
	hesaX0DrcOrJPnq3XlJ9uSh5vM6Zq22r+MXOPrTsFY5awu2g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0g5we-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 06:29:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grTllHtNoXHS6waOTxtKDM0v7EaqTtdcm1f2Qq6rKeexI4mkse7PPJebBUWCPK4+qTwZNqo9/kEjHuHkTSYfgPkx+gKgJ4xO9pe/zxMZNDa94UoX810g3Vyh3knSjJ3nKJqafYxOH9ttYuLca+epztj7lyZ+wcf0a6fbRGqdJdDgdeHcytit5kppF5Jg+t+9KW9ayvjRYnxNpJVz/0eDFFAjukfCQO7CIHWx66ikDuL4M5zYBCC1PB73maoVEXVt9Dsdrsc0RNWtJuHDg/AwnTIRLG7BTEcXo/jLMzQXiyHCCSwbcKD9YMrLs3sfeBYXSm0TlDMpDnXRuuoq7/fO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC3wWNxeMV82MosFpFnpIvHoQa9REYSiBwWmdC9Efng=;
 b=URktTHFtHIRG9MFT0xk9XaRQQGONzFTVyC6kQWr/Ri0CRoFScbcJiRnt6OW/oe2BhgB+zHKeJ+MBuacAo459L/7qzq0q0pm2vLkPwKxNeuRHXhOjdwg1fLmjr5Eo2vyX+MtGwTFjVHnhhtbG4wJ5XhTH8YSFGw/aMHs+JPgeOdObYModfR/F2XUId+otbPmExbF7p8G5x6hYGYACUALTfsJ/88y/cdHjFz/MzyIciQx7dDOSB0NlZ8OwhJHvJgRbaZzrcDiEr333ATorDdih6+JowXF0Rpe7yKHhUKmgxVbx8M7rbSWJq2BA1ZpN52FW4Gw2jCOWXIrlQlZ9fKMv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Sat, 13 Dec
 2025 06:29:08 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 06:29:08 +0000
Content-Type: multipart/alternative;
 boundary="------------oRTWNSR5NkLWHcUSnm0QpKSM"
Message-ID: <f8f1c588-36c1-40bc-abbc-793fbfdbb14f@windriver.com>
Date: Sat, 13 Dec 2025 11:59:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] ripgrep: limit libstd-rs DEPENDS to
 class-target
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251213041635.3859879-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1sqSCyza=QFo=jhA-FWTj2pM14CPVDP8cg2ZAvSg6uTYgw@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1sqSCyza=QFo=jhA-FWTj2pM14CPVDP8cg2ZAvSg6uTYgw@mail.gmail.com>
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 051e9c64-2bca-42dd-69ab-08de3a10eb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S25XeFZoVWpvMEQ4ZW9abHpocU9XVTZkV1VWMEQvT0dVM0lRclcwWkVweGdL?=
 =?utf-8?B?UUd1WVppQUhVKzZ5TVdJeWZuT1lWUHRXdTQ5NU51clp4eFZqQVZwYWpPdEJ5?=
 =?utf-8?B?TXhpTDM0UnFNMStiYm5UMEZodEgwbkV0UG9sNzUxeCtQUk9HQzN1Rys0cjVO?=
 =?utf-8?B?MHFDUU41WkdYbHhONUowcGZzekNJR29FTzRPU1FKbGpJT015bXArLzZla3cx?=
 =?utf-8?B?YXc5SGtzRDBQZk1MWW9OOW9zSkhRY3FEOWxpaC9wbXdGaUZ5OXNwYno3RU9G?=
 =?utf-8?B?WHN2ekNJRXRMRUkrRitOTit3b0NqR2kvMmlHdmVxVXAwaUZNejQ1VnJyZHI5?=
 =?utf-8?B?NTJEazljaitlU2dMYjR4WHRNcVZ5OFdUL21tZHFaZ1hlczc3b3VESVVTY1RN?=
 =?utf-8?B?WmxweGQrS1FWVFdzOTdEVzdQc0Y2MnZ5bVphdm1IQ2JxVjVqdkFOVlNESzRJ?=
 =?utf-8?B?c1d6OGc4RFhnZWNMc1FlUEVsZXRLeHhCVXdFaXArUHh2dmJUTDZrb3dTQnB5?=
 =?utf-8?B?RCtZYWIyQ1lYaGFVUmpUZVZocmUzaEN0Skt3Nm1pdGRlbkFqWEFwUnV1bkJC?=
 =?utf-8?B?SG5xdUdhajFtMXZ1aUtSc3NaOVhKREgzMTFGMmd3b285L1dodm1DYlhtd2dI?=
 =?utf-8?B?U0pJbXdzYTdza2VEMWw1QXREV3NlREpDL2luODFEcGYrZkNkL0xUK1JHZ3pq?=
 =?utf-8?B?YzdUeVNMTnlOcy9OSUJJZDYyNHZaT1VGTDlZT0dpcDVnd2xBQkFCWW5ZbjRu?=
 =?utf-8?B?eHVKZVk3OXZlTUZGd0ZBOHZ3ZFlDTkxSTjV4YkllalV1ZWdRdDJLbkc3NmR5?=
 =?utf-8?B?WXdiamk1YzZIbzNMVVlicVJYRlhUT1BvTG9EOWdkdDVya3dheUg3NVdranpx?=
 =?utf-8?B?cGpqTmZONWJRWXVYTGI2VDh1UDBqU1VEektvaFdZYzFIOU1RM2dBQ21XYkxW?=
 =?utf-8?B?d2E4cGYvSkV5dGxvSUF1MFpWUGdZZE1uSkwxdzJ6MGZxQ1dBNVRsU2gzVDZz?=
 =?utf-8?B?empLcExLMm1mTllXSUdUajBlOElCTHhTVnJ1RTZOLzNqcDB3M1ZYd3hkTmVW?=
 =?utf-8?B?ajliVTJLaDAwWlR3NFJTbENGeTFqNk1VWHpMOWZiZjlYWnVqRjE5dXhBYjFX?=
 =?utf-8?B?Z29xV0JGekIwY21lUWp6eGJmS0xic1p1blJuaSs2WTV3ZytVeG5PRDVqc0VT?=
 =?utf-8?B?NEUxeFBaaTRiS0xmUGJ6THd3Slk4WWFuQUVPTzU4ZE1Vejl0dC9SaGxhbmZP?=
 =?utf-8?B?UkxOMzFUWUMyZFQ1S0hyaEV6SFBmbVFHM0Z1MlFTSDc0aEwrTlZVbGdoQmhR?=
 =?utf-8?B?NE56RkMyZCtmUXRlVFBnNnY4YnIyMStSbGdaWWdVZkdsM203bjVxVFAzNnRX?=
 =?utf-8?B?MUpFT1hYTzljMHRmOFpoRGRyMkdNYWdoRkl6bVprMEc0NWxMeThRaHdhRFFM?=
 =?utf-8?B?RDRBdG9lUEFBQnRUOTcycmNwbzZVTWhRY0J1cnVxd2VBZXZVMTcwbmJuR2Zy?=
 =?utf-8?B?Q2VpcEtxeWtJR1BmbkZhL0dNTWllQkpTdzRGWkp1SEZHc0JXS1ppUFZvWDU5?=
 =?utf-8?B?UXhEN0xPMDgzdDhuOTVGblN4bnVzQUlnSy81d09iS1djREVWandCZ080M1Fw?=
 =?utf-8?B?K0pqczBDWjlDZUJZbENIMmlnNFEyK0c5SjNJWmxVNTFqcmZsVEplU3d4OVgy?=
 =?utf-8?B?RTZoTW9RWEh0WVl3OGUySFVFemdLMitsSjM2TlNGRVZTeDhwa0hpOWVwWkFI?=
 =?utf-8?B?SHl3eGxENjJoRWhTblQ1UlJiVmpZQ3Ira1hPbm1qS1o4Y3VIcXJyekZjQnFv?=
 =?utf-8?B?NjVPOGQyb3dkZ08yWmw1K3pDUnhkMkJCT29RaTluLzlrL0EwU0k4TFJkSVlO?=
 =?utf-8?B?NXZ6c1BBdGxoVEJmeHBqR0tOUkxCVDQzeGpOeDVTcTFLZUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWk4SnJ4RkNzcndxUWtPSEdnYlo2dzdLV21CRnh2dnNmWUVoVDI3YnlvME05?=
 =?utf-8?B?eEM3eS9XUjNwZHR2SGZhc0pJcS9qckNTSEdFWG1CdWg0OXNzakxteENkT2hm?=
 =?utf-8?B?dm83VTRLZDh5dWF1empPSzAxdWVnLzEzMUpJRW92RlZoRzBxOE43NjVYSUxt?=
 =?utf-8?B?T0RkMVUwTE02bFJhdzd3VjlRSERlcVgyeTVMSVdWZWM2YlZkSjI0dlZNNFBY?=
 =?utf-8?B?ZVBBU0JwR1dqblpsbEpoU2pJbTZEcUhlSDRWOHE4cldlYnc0NUtOY3k0VlZw?=
 =?utf-8?B?c2sydnBHWkZuY3FPc01Wb2R5Rk40WVgvaittSGN2U1kyMnJ6TmlVZHlaWWdV?=
 =?utf-8?B?OElhWlhsbCtKczJNR05Zc0R5Y0NHQlRtS1liYVJ3QWVzOFNkTnM4MEpZVktI?=
 =?utf-8?B?SytkZmdGY3dsbmQvMzhNZHRiT201YVNYbUhJdUp5RUZCM1BOYUVRNFZUdS9k?=
 =?utf-8?B?WjY2L0RmZDBETnFvMjhvUUhsQzZtQjFlbU9NWDczU2I3U0x2RWQ3WGlaUTNH?=
 =?utf-8?B?Wm8wY2xpOGhQWTZ2c29LQnNsTEpQelU0WjFoLzFDUU1YbTJSUjIzMGEvbTQ3?=
 =?utf-8?B?QTRXYlltRmd0V3RiK3VNRThkMDF2eG1jb1JlUGNSWGxpbGpYZ3ZsdHRleWlC?=
 =?utf-8?B?eWZjaGd2ZzUwUE9BYzVIaTBMZGRETzNDSFJVS2dmaXdmcTJnRFNpYUlveHdU?=
 =?utf-8?B?WG1yL1lIcWg5a1pvVTQwVWdzRkZwaWJxc04yWEJhUkZFaTgrRDgyNDh4Wmxn?=
 =?utf-8?B?bDR1YXZQdnR0TEt5dTVGbHQ3dnhCZnlMZ1Qza1JhM2g1NXN1M3g2TDBrWWd1?=
 =?utf-8?B?RlhnQjhBRVZ0L2FTQ0F2R0VoZFV4OUNLLzNUeFdOZEdRUDdudFBvSXhkOUVX?=
 =?utf-8?B?L0xyVk9XQTBTQlVXdXQzVElBSUF4UHU5TTJFbmNGRGt6WXcxVTdpckZYbTFt?=
 =?utf-8?B?ZElGdVJ6NUpFMGdSTTJoK3B0QXZBZ21GR2NvUkRmSjlJTHVYczFRYWxqYVc2?=
 =?utf-8?B?eUxvTnNKSkZwL2hxMm8rSUduWkovenBoeXFxN0p4SWpMNTVsUjdORUYzb01G?=
 =?utf-8?B?RDczeFhiRkxEeHdoMTdxWEJZWDJ6U3dpTW4xdmNUOExuTS8weFM0N3NLRmto?=
 =?utf-8?B?SWdDYWtySzZMWS9mTWt1bmVKRGdlYTk1QVp2bUxMdlMvcVdMRlNPdjZhY0pV?=
 =?utf-8?B?WTNzVk9EcjFLWDdTRTF5bEpLU3ZXNkc0SXhmL2V1YzhZdEZZaWd2TmZZRGJF?=
 =?utf-8?B?aFpRc041YmFQck9XRllEd2lWcktCOWRiVVRmL2ZHM3NRT1h3b3k0azZwbmU3?=
 =?utf-8?B?QW9sU1U2Zm9ac1FvYWwwajlMM0xoNEtRajI4MWdYWVh0TnUzU0krekFlekN5?=
 =?utf-8?B?U0pCRHlpZFJKbFhqWUpIVlhNTWVvZWZmS0FHUWFFVXFuSzZYTFRpbXJDREZ6?=
 =?utf-8?B?am1vL2N0V0xrdjdmRW5GMGhmZStQc1VEaTNFUS8xVTBrZWZ2VkZyNGVDR3BQ?=
 =?utf-8?B?MGJWdjNOWE5UT2lWSWYxQzNiWjRneFBnY0JjL0w4WjlQUW9lMVhnVnhOT0Zh?=
 =?utf-8?B?bmYycDJDRUhPM0ZhTVl2Z2MvT0M4S3pOelhTTGxWckZCa0Y1L3lhcVRZcGVW?=
 =?utf-8?B?enNvZGZUVW9teFVhT25IZHczWCt0cExYK3VIYW9EQnFJRklacVZJakVzWDBa?=
 =?utf-8?B?M1Y4WjVuOVd6T1ZqOFJNOUM0TkZZQUJUaUZ4SHFHQmxzdzNkREIxSW1Cb21T?=
 =?utf-8?B?ZWV0ZCtINlVpcmJpUm9IWnRHMEtUT0VJekUwQjhxMHlLNGZ1SHA2M3RQSVVh?=
 =?utf-8?B?WXA1bXhhNWJidXpoYnBQOXh0MUJ5MjFhL0tqa09JcExwR3ZjSzlHTTltTE1Q?=
 =?utf-8?B?NVhKNHd2a0ZhVUVqK2FXUTNNcmZ1ZytsOGJINDgyOENmdmxWUVpRS2RuK1Mv?=
 =?utf-8?B?NFdKcDhaN0tBTG82YlhETTBpUHBPdW11aEZpT1VhQ0FpV0VzdUtCMUFSemtW?=
 =?utf-8?B?L1cxWjVWVnpKK2kzSUh5Tm4rZzJaYUxFbktiSW5mR3FpQVdycVp1d2FrM011?=
 =?utf-8?B?OCt1NHU0RUs0UkMzWjFKYXNyZEJha1ZZOE5mVFJBWktkVjdteTZGWFhUTHVM?=
 =?utf-8?B?T0VtRXhER1FRejFxV2RrTk5DK3A2NFhWdDZyaDByeWZIZnV4UTIvQ0thaE1k?=
 =?utf-8?Q?g19JWLME+NbDI9En2GZSVDI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051e9c64-2bca-42dd-69ab-08de3a10eb6d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 06:29:08.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkxEeSACkkjmP4v+EevkmO0/mhbMs+qS0HZdTYBGOlq4Lk/cMdC14o/gnXyZDknzzgJo97qHEUXmO4/n7AtOEg0C/y25LC6UzWpR+x+g4RIeSenfcRHWEUS+PCLjJhO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDA1MiBTYWx0ZWRfXwTIniRIwuC2Y
 2gEH98/B47D1JUcZSt+MXWsjh9llE+h5PfLANeGiAk3jAU7x4aWzGtB9ZvsZyx3jrQRLPnPPhRb
 HtSsMp80M0WNd5xHXFMFDjtTXIj0JJmIgcAWdjZh1FiQ/4gVYwo5f8DMOpoXUFgUsJidZNk2h1f
 at29IGbXg2ZanAYk9340b1/64sJ74vF7i7zt36+x9VTn2AKFHJw1IwRQV5TamXZBMayampO0Seh
 LX/Fm4PFUI8iXuKE+H+UGnVAhOM3aw7/GAJuHZJlCHpl96G42RXrpPOAj/NHYX3hkyMK88kNUj/
 j/+Pmvh4Su2qJks9b33yb8FoFP6+XKTFsFdCv9w7rni7WwQJ8oL71ZqcAFCZPZgZK/Qdpvu+zlB
 2lPMSY2G1Ji0R2Pshoz9h7CmxSkK7g==
X-Proofpoint-GUID: XYg7EOwaEU9etq3Izq_P0U68vH2zIfNf
X-Proofpoint-ORIG-GUID: Zxqnz2kKpTDGRa-7Y9RE5Odh5Dd9CU0N
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=693d07b7 cx=c_pps
 a=BKMVb8u7xwlFrvPG8etDZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=0zhiEtMHAAAA:8 a=X3SPiHJlAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=h4kmNEKQJKRWg_pL_hIA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=wrW8lPoja7HPujlG7uEA:9 a=B3qjuTtnPXtNlhAi:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=v7CeC1Rd8Ef7gCqLsajQ:22
 a=N1QK_MHYhnLX6gsKyPlA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-13_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 06:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122632

--------------oRTWNSR5NkLWHcUSnm0QpKSM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BD6K3Ur3085997


On 13-12-2025 11:56, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Fri, Dec 12, 2025 at 8:16=E2=80=AFPM Varatharajan, Deepesh via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0=
SED8ulFvh1rGZflKP8xaQ8$>=20
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
>     Avoid pulling in a non-existent libstd-rs-native dependency by
>     restricting libstd-rs to class-target builds.
>
>     Signed-off-by: Deepesh Varatharajan
>     <Deepesh.Varatharajan@windriver.com>
>     ---
>     =C2=A0meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>     <https://urldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8E=
vQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0S=
ED8ulFvh1rGZflxnWLEIA$>
>     | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>     <https://urldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8E=
vQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0S=
ED8ulFvh1rGZflxnWLEIA$>
>     b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>     <https://urldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8E=
vQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0S=
ED8ulFvh1rGZflxnWLEIA$>
>     index 7bb6be1cb6..0ef671cf04 100644
>     --- a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>     <https://urldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8E=
vQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0S=
ED8ulFvh1rGZflxnWLEIA$>
>     +++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>     <https://urldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8E=
vQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0S=
ED8ulFvh1rGZflxnWLEIA$>
>     @@ -15,7 +15,7 @@ S =3D "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}=
"
>
>     =C2=A0inherit cargo cargo-update-recipe-crates
>
>     -DEPENDS +=3D "libstd-rs"
>     +DEPENDS:class-target +=3D "libstd-rs"
>
>
> This should be DEPENDS:append:class-target =3D " libstd-rs"
Sure Khem, v2 incoming.

Regards,
Deepesh
>
>
>     =C2=A0require ${BPN}-crates.inc
>     <https://urldefense.com/v3/__http://-crates.inc__;!!AjveYdw8EvQ!d8P=
JoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulF=
vh1rGZflv2nwesw$>
>
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#122628):
>     https://lists.openembedded.org/g/openembedded-devel/message/122628
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/122628__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGu=
OLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZfl-I0LkNQ$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/116758522/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1167=
58522/1997914__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5Gz=
frdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflhMf5ol0$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRg=
hko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflWolZFfs$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------oRTWNSR5NkLWHcUSnm0QpKSM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BD6K3Ur3085997

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 13-12-2025 11:56, Khem Raj wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqSCyza=3DQFo=3DjhA-FWTj2=
pM14CPVDP8cg2ZAvSg6uTYgw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 12, 2025 at
              8:16=E2=80=AFPM Varatharajan, Deepesh via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdE=
boxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflKP8xaQ8$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a =
href=3D"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org=
</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Va=
ratharajan@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">Deepesh.Varatharajan@windriver.com</a>&gt;<br=
>
              <br>
              Avoid pulling in a non-existent libstd-rs-native
              dependency by<br>
              restricting libstd-rs to class-target builds.<br>
              <br>
              Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:D=
eepesh.Varatharajan@windriver.com" target=3D"_blank" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">Deepesh.Varatharajan@windriver.com</=
a>&gt;<br>
              ---<br>
              &nbsp;meta-oe/recipes-extended/ripgrep/<a href=3D"https://u=
rldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8EvQ!d8PJoSdVRi1qP=
3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflxn=
WLEIA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">rip=
grep_15.1.0.bb</a>
              | 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/meta-oe/recipes-extended/ripgrep/<a href=3D"ht=
tps://urldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8EvQ!d8PJoS=
dVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1=
rGZflxnWLEIA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">ripgrep_15.1.0.bb</a>
              b/meta-oe/recipes-extended/ripgrep/<a href=3D"https://urlde=
fense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5=
K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflxnWLEI=
A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">ripgrep=
_15.1.0.bb</a><br>
              index 7bb6be1cb6..0ef671cf04 100644<br>
              --- a/meta-oe/recipes-extended/ripgrep/<a href=3D"https://u=
rldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8EvQ!d8PJoSdVRi1qP=
3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflxn=
WLEIA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">rip=
grep_15.1.0.bb</a><br>
              +++ b/meta-oe/recipes-extended/ripgrep/<a href=3D"https://u=
rldefense.com/v3/__http://ripgrep_15.1.0.bb__;!!AjveYdw8EvQ!d8PJoSdVRi1qP=
3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflxn=
WLEIA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">rip=
grep_15.1.0.bb</a><br>
              @@ -15,7 +15,7 @@ S =3D
              &quot;${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}&quot;<br>
              <br>
              &nbsp;inherit cargo cargo-update-recipe-crates<br>
              <br>
              -DEPENDS +=3D &quot;libstd-rs&quot;<br>
              +DEPENDS:class-target +=3D &quot;libstd-rs&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>This should be DEPENDS:append:class-target =3D &quot;
              libstd-rs&quot;</div>
          </div>
        </div>
      </div>
    </blockquote>
    Sure Khem, v2 incoming.<br>
    <br>
    Regards,<br>
    Deepesh
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqSCyza=3DQFo=3DjhA-FWTj2=
pM14CPVDP8cg2ZAvSg6uTYgw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              &nbsp;require ${BPN}<a href=3D"https://urldefense.com/v3/__=
http://-crates.inc__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRgh=
ko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rGZflv2nwesw$" moz-do-not-send=3D=
"true">-crates.inc</a><br>
              <br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#122628): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1226=
28__;!!AjveYdw8EvQ!d8PJoSdVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBP=
j1x2N2mRx1iJbJ0SED8ulFvh1rGZfl-I0LkNQ$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/122628</a><br=
>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/116758522/1997914__;!!AjveYdw8EvQ!d8PJoSdV=
Ri1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1rG=
ZflhMf5ol0$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">
                https://lists.openembedded.org/mt/116758522/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!d8PJoS=
dVRi1qP3Ht5K8VhfFqCYGuOLwDzBcRghko5GzfrdEboxekBPj1x2N2mRx1iJbJ0SED8ulFvh1=
rGZflWolZFfs$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------oRTWNSR5NkLWHcUSnm0QpKSM--


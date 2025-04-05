Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FF0C3601E
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 00:39:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2162.1743813560394837769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 17:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6190b36320=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5350ASL2014141
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Apr 2025 00:39:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1g0nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 00:39:19 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5350dIQi021984
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Apr 2025 00:39:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1g0nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Apr 2025 00:39:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwsB5gp0gTNKmNT28VR1+ISRxa8IZ6gyV8UHyHRbhkFqT2zs0a0xkcBKifqTEwdEd5kMQOOuv4NyfFzIXAEfQERYgIFKtNAeOTtXl25IH8CDDT7xa/cMGtalhGg+rdu5jLIIR1LihSBlDqzpdSuHIAI3A9lp8/fF8nqMupA2Dj8oMU4kvONl4anWyn2Mdv5kpiMqpQR2mnWltQjjvlxlslYBlPDLp9XW2kK4uZh5dvnLxRNzTVHzga1hutaVo604RtcLB6wZBeBx6U81J6rqza2EDZoH3VO+YuJ2JMa5Z0uetedoGk43NEhCRvNrXtg9r6AlJGG60vmQ2gZruCN28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prSIMBNdjqITuZObfCMyO6t0JArg4W60TQyV5snrscc=;
 b=bkVk2DCVLhs6iNx9pLOcZdbfkGV1Vin4EtU9cePfY3PBrVPlJQ0OkntUrqCeQ412Uqur0gw/Z5VZEAO/wBlU2nwWAN9SgpSB0NiknoktxYw/NOu/rHukmpNLCFDBRgOXYj0o9coN5csy7xpusUJXI8c4I3ODlZA/7HvwPimxh1e86mGNx9JJc48W4gT1r0ZRIxJrXKX2Nej+DoTgseE3emZzDb1HzJIKvc7md03y0Mqg9v6Gw3QgbGbQQuL03MEGVqVRaLmFI2RUGhAqcbcFoZ8XR1DQqkHqB0sqF90MiuxL1xndr2z6KwRGJDPeitSnho694jNS2scZwQha/Y6uCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH0PR11MB8213.namprd11.prod.outlook.com (2603:10b6:610:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sat, 5 Apr
 2025 00:39:14 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8583.041; Sat, 5 Apr 2025
 00:39:13 +0000
Content-Type: multipart/alternative;
 boundary="------------yCgDqAsvRdjRB08y0s2kCt0w"
Message-ID: <8ca87591-cd1c-4a55-b0d9-7e24c8c52602@windriver.com>
Date: Fri, 4 Apr 2025 20:39:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2] nano: update from 8.3 -> 8.4
To: Anders Montonen <Anders.Montonen@iki.fi>
Cc: openembedded-devel@lists.openembedded.org
References: <20250404003320.1703471-1-Randy.MacLeod@windriver.com>
 <FC376EA8-6664-4B03-8334-5E852F65545C@iki.fi>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <FC376EA8-6664-4B03-8334-5E852F65545C@iki.fi>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH0PR11MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c12d25c-3437-482d-06d2-08dd73da49f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bW1nSk0weEtieVgxM1RBMy9ERG5XSExnZWZERDRGcHYwNzJWSWcvWXkzOWRG?=
 =?utf-8?B?MHgvdm1OaUxvdFhpays5UWNSN0UyM1FCSE1lOE9ZTHRkR0QrTVFRVXl5Ym5I?=
 =?utf-8?B?Ulk2WnNkZEFSSGtHUFJjWlA1ZitQeGJkM1FDek94V1hUc0N1Tkw3Zk5ZKzVn?=
 =?utf-8?B?U2p1VUFSWkRWVm1NNGVHZThXTTRWUFZ3VmVIRnhBSjc4N0p5by93N2E5T2pJ?=
 =?utf-8?B?WHRkOHIrSkpCcVQ2MWMzNXhRd1pLUnlTWnVSTUVaVG1hUzFTMEszWG1rVDA0?=
 =?utf-8?B?NGowcmJWQjZyU1IybWhZMkhqTTI5M1ZYWWVWODNXT0FqdnlBRlBWKzZ4b3V5?=
 =?utf-8?B?N056OERhT2ZtVWlKNzdIejNzd3k2UVBWZTRsUHVmNVBMT3FKRFdFUERJbzhB?=
 =?utf-8?B?VDBoOHZFOVBFeXhXT2gwNXRCS2xoMEdDL3V3cVAyWjRDZzRZQnpzSFZDY2M2?=
 =?utf-8?B?OCtqOEdNd2lHTE1ZVVNxbTJkNzQvN3Q1dlNUQXRzLzRCV0s5TkRxdElUZWRD?=
 =?utf-8?B?Y3cvdUQ2TmZYdXpVV0lud0FsYzVpeXg4czdzNlJ4U29FNENTYXQrRGk3aG5p?=
 =?utf-8?B?Q2FUMkZMY2VBc2ZjRG5WZ2dxaHNQUGlSOTZRMVBSSDlGYjhJQUdZSnlsN1ZR?=
 =?utf-8?B?dFNadHJGSUxlL0pZZElYQ2xvSEdodEJhcUswYUZkMHZ1ckl6eWxaa0crc2tZ?=
 =?utf-8?B?MWphQWM5Nmc0SE9Rd3p4UEYrcEo1RXVJdmhjdnMzZS9POFFkWG1YOUd2c0V0?=
 =?utf-8?B?QnBzODA5RWJYM1BZWGdBdXNxUEcxMTdQSk5VQ3lsUEtkckZnY1BuS2hXV0d6?=
 =?utf-8?B?YksrY29UcjkvTGpHMG4yQVNCQnY5ajFxUDhlbFZ0c296QkdNTlAwb08yemYx?=
 =?utf-8?B?bllQMGJXNUNMdnpwVVNyeDhRMmIweVk2UWlEblQ3NFdBL1AxNkpxajFFK3FZ?=
 =?utf-8?B?ZFltOU9tQmRsODFFc294SjdlL242K2dndlpOMkcrbUxEWDJzbTBrbHBEU2x0?=
 =?utf-8?B?d3ZLQmJDYUQzdDVwZjZ0STlQRFMrUGptaU90UHF6Nm1rV2lPL2NQU2dLS3Av?=
 =?utf-8?B?cStoNDB4aE45SkdUWXl5S2FtU3J2L2twL0VCUFN6MFdaRFcwRGNZRnYvbmM1?=
 =?utf-8?B?QTRORjBFUlE4TDV5QmJDdWc2eDJmTHVJNGhJZjVMdWkyUElweFc3cm5MZzl5?=
 =?utf-8?B?MTRza0lYM3BwcUNrSWJOc2taNDhpbDdjQk5hZ0F6Wk5vaEkrNmtSSlpmeGNR?=
 =?utf-8?B?eHAyZ2dMYWR6N1Jkc1RtUTZHaWgvQ2QvWVZHalBaZ093R0I4WHFUTGZnMDZP?=
 =?utf-8?B?V0swcTZETmZVNWFoMGswN1BHbUp0SkN5S3hUS1JON2I3aUJGakdtZ25TRStP?=
 =?utf-8?B?ZXZIVDgwdlJhVlBiZFY3N3NmQks4UWtaTmhXZnBFb3NYaWI1d0hCWEoxOHY1?=
 =?utf-8?B?MFR0VXI4L0orVVhxRWpDRHc5NUtJQ2N1dklmRlEyMXJsV0NzTklnekt1MzFq?=
 =?utf-8?B?L1dOOCt0TWFoQ0ZneC93QThWbU14R2tSSlIzRHdyVi9Mci8zKzVDcXBIdXJW?=
 =?utf-8?B?RzRKT1pOMGxzTVV3ZkM0WUFVOWZCYTZVWVFLSE5PcmxKbnVjcjJhdFFZODQy?=
 =?utf-8?B?UjNWUk5EZEcxeDl0Yzl3OW55dlg5MHNTNHZ4K1ZRS0tUNWZLUXVNWk5DdFls?=
 =?utf-8?B?RjJEbTlsUC8wRkE0SE9CY1cxcVkwcmlBTTViRTJsWW9GMGxxQjR4Y01OaG9I?=
 =?utf-8?B?alIxZVRsRXdJSEdIeGNYQUpwUGZ4T0ZtaHZ4aHY4YkRVaG9MWk9qWnJPSkdw?=
 =?utf-8?B?S3pkdCtaUmhWMy82VFlkRDdyKzkvZ1dYL3IwZS9tL05LSzZQYUYxS2R0SEFP?=
 =?utf-8?Q?oJ2G9OUkODO2I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWxvN2RMWUtQOGNUZG45VUpNbExCVjd4VG1mRHBJRVRzblQrM3JsTE5pNWVo?=
 =?utf-8?B?UXNjbmFaUG5pbVFPWlZiZ0J3K0xLTkVLZjJFeTJ5aTNqZTV2RFlrY2NLY0Nl?=
 =?utf-8?B?Rmxzb1BabnRPT0RjUk5TQ3R3cDZsMW9QSS90QzVFUDdXdkRUZzBFZWJtMmM5?=
 =?utf-8?B?T1ExNUU1RUtPRWJMTGpnQVFnVzhCN01wVzdiWnM4c21OZGhzUEpCWGRIUHU3?=
 =?utf-8?B?a0t6RE5XeFBWV2ExNUkwRGl4R2tVQkxWa0FUeUl6U3RTWGR4dlNBWjVLdHow?=
 =?utf-8?B?Skh4cG5TWDlIU3hDSGhqR2tteHhkS2RTdld6THd2SzJBU1VjQTVhaDR3NGgy?=
 =?utf-8?B?dFhrbWYyTHBhUTZ5OTJ0L0R3MWpRL3BobzVqb3RsdGJXaEhsd1c4eW9CaUpZ?=
 =?utf-8?B?OWZGVDNXS1B0UWZqRXRJVUs3dGZuaHcrOHlrWGVySS9haGMveFpYSGtFUldZ?=
 =?utf-8?B?K1RFcGo0RnNtc3lISGFibnVFZ0xNcnFiSjVwbXdHanJWZkFLUzVxWnVaWm0y?=
 =?utf-8?B?NHZWazVoRXJSZFJJd3NqQ2dlQVFRb1A1clp2NVMwZ0U2SGdXeHAva0R0V09u?=
 =?utf-8?B?cndoR1B2OTFGdjhzNnJqRndTemdMUFljKzhBempvekNGb1FhRVZDcFN3bWVa?=
 =?utf-8?B?VVlaTWFXeDBaQUYzR3grM0pkbC9MNXZqcVpwSjcyb2hvRkxvMU5VTzZtNDB5?=
 =?utf-8?B?SUovQ3ZsK0djaFd5TGthTW9sMllxTFhPNys5czlYeHB4dDkydnQ4SWZ6N2pn?=
 =?utf-8?B?NE1veU8zRkRGZGlmNlpvNWhiMHNGN0RVVzhMNmU2TElpM0NWclZ2eVd0cFlr?=
 =?utf-8?B?MllHNHh4YkN0N1ozQUdpaStJdXUvSlBHdW5zSUxBYmlIamNUV2RsSm81WTVF?=
 =?utf-8?B?Q3M5TGpaR0lPVXA5R0xQSTVUd2VGK1p3WjlxcTRpZDU4QkptcTE1VXdaamNK?=
 =?utf-8?B?R1I3NHZIbTBNaDhkNTQ0ckNjTUQveXpnNFZZZk9iTFZqTnNsUjNuUGRidi9o?=
 =?utf-8?B?L3ZxNFo1N1FXREJQcG9mYmZEWkVrTTFtYkhGVFpQOFF2b2VkZkNzQjhGdkFK?=
 =?utf-8?B?cTdyWUhDVWkrdXVROW1QVktqaXVTVkJrTDdjc2NTaUpzendkREt4OUN5NmN5?=
 =?utf-8?B?aGNIYjJsakhFbmpWZjRwWCtldHVtZ2hHNm9YOC9CTDh0S3RrdjV1OVlFeUla?=
 =?utf-8?B?cnBCUC9lU1k0REI2bjRKQStUOU13c1dWOHphYXpWQ0VEUlpPU1hJdi9lM3Jk?=
 =?utf-8?B?Ly9Oc0VaemRQUzRWUjVjYTNDN2pabkNDVHpyNHN3bXNNU2VReStaOGtINmpy?=
 =?utf-8?B?Qkl4MXBJZkVOU0VhZEloQ3l0cVppcjlEQ1hkS0JuU0VaVWNFTEppYjJqYk9o?=
 =?utf-8?B?VHZMYjlaQjc1UytyL2tiVVBXZkFpNlBCUTBjQ0xKc0EwSXFpKzdOdzBxRFZo?=
 =?utf-8?B?ZmVReU5kaVdFWmZoN3BMYkduTUdBMG9nYnkxQ2JDWWpubXcwbkd6NHArU2xZ?=
 =?utf-8?B?Znk2QkVyZ0x3cFNEdndqdUtKTmlUUFFCbFUyZEVneW1ESkJmbStqb2h4VEVj?=
 =?utf-8?B?SjlEUTlWZmJzYmJtRS85b2ZxdkZhclFjbmFobVdjcHVyWnlDenhtb0tzM2t3?=
 =?utf-8?B?TFVLdFZiSXE1QzRIQUxXeitXS0JtdzhWK0VjdmNva1hmaFZYM3BRUEpwVFlu?=
 =?utf-8?B?dGJPTEtobkZFUElnd25EUC9HWU9xRDk2SDJzaStKQ2JYYlFSVDNiTG92Ty9G?=
 =?utf-8?B?UzFBOHcyMFBMZVRjejdmVU5RaVBzckl4M3ptNk0vb0toU2JqeXR3Q1RkenBC?=
 =?utf-8?B?dm1xT25sdTY5Uyt4VHFBUmF1SUE0YnRlbDRWT0ZtSEEwaGIrc0J0SDk2eFpa?=
 =?utf-8?B?dkxwUGgveDcrYjdZL0RBbnhBakh0TlVYY21Ed2VTZ1RubXI4NG9rQmZZWHdM?=
 =?utf-8?B?cG1zdDF4djJXRjBMa1JOTjRwa0hxNDVuUkhyZDJCdlFpamxueGF4cTZwUE93?=
 =?utf-8?B?Qjc0S1lIR3pnNFdabXJPY0l2YktIL1JTT0lvQTIrcTkvM1lsdCtGVmpEdEhP?=
 =?utf-8?B?aHJ2SGI3aVpYRUJqKzdEWDRWZjB1OTJOeUhTSzJHM2UvTmZCVUFmNlpjc0ZV?=
 =?utf-8?B?QmxhaWxNYmNRbm5hbGZvWUR6ODBScG8zenh5VWw3V0dLMWJIV1dEWWlYcTJz?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c12d25c-3437-482d-06d2-08dd73da49f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 00:39:13.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdmozkxaoOqrs45jAbmpkXzf2MAURs/jbhl00Ekd8hMfWo4TKCPW+cQMzQ2zWQTJrA87H1FXtaNRBPmeVrW+uHyp/KmlVMn0Nie6G3bRIw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8213
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f07bb7 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=mDV3o1hIAAAA:8 a=BjMif5yZAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=4vBlSWGCDJ2oVAZ-KVAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uaMc_peoTw8A:10 a=YNtWCMH1SBZecQ5mBMYA:9 a=zes7Sc9wSR14tG7N:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ftVT4cx30j6SLCxtN1ED:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QhQlm7fmVmofP-ox4GFGYJ_LeUW8e3q2
X-Proofpoint-GUID: 0yF_N0HX3BANJzYitJ8VPVLvbui69Qm-
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504050002
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 00:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116595

--------------yCgDqAsvRdjRB08y0s2kCt0w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5350ASL2014141

On 2025-04-04 6:58 p.m., Anders Montonen wrote:
> Hi,
>
>> On 4 Apr 2025, at 3:33, Randy MacLeod via lists.openembedded.org<randy=
.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> Release notes:
>>    https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00001.html
>>
>> The license file checksum changed because upstream added the line:
>>    SPDX-License-Identifier: BSD-3-Clause
>> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
>> which have been in glibc and musl for > 10 years so it's sensible to
>> default to yes.
>>
>> Adjust the patches using devtool and manually munge the Upstream-Statu=
s-es.
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> =E2=80=94
> The commit message doesn=E2=80=99t fully match the contents, there=E2=80=
=99s no license file changes nor updated patches.


Yikes. I can't possibly have messed up that much, can I?
Anyway, I'll check and send a v3.

Sorry for the noise, I may eventually learn to double, triple check my wo=
rk
before sending commits in the rush to branching.

../Randy


>
> Regards,
> Anders
>
>> .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 +++++++=
+-
>> 1 file changed, 8 insertions(+), 1 deletion(-)
>> rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} (75=
%)
>>
>> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipe=
s-support/nano/nano_8.4.bb
>> similarity index 75%
>> rename from meta-oe/recipes-support/nano/nano_8.3.bb
>> rename to meta-oe/recipes-support/nano/nano_8.4.bb
>> index d1af89ef8d..1aae49d3b6 100644
>> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
>> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
>> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>> PV_MAJOR =3D"${@d.getVar('PV').split('.')[0]}"
>>
>> SRC_URI =3D"https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.x=
z"
>> -SRC_URI[sha256sum] =3D "551b717b2e28f7e90f749323686a1b5bbbd84cfa13906=
04d854a3ca3778f111e"
>> +SRC_URI[sha256sum] =3D "5ad29222bbd55624d87ea677928b3106a743114d6c6f9=
b41f36c97be2a8e628d"
>>
>> UPSTREAM_CHECK_URI =3D"https://ftp.gnu.org/gnu/nano"
>>
>> inherit autotools gettext pkgconfig
>>
>> +EXTRA_OECONF =3D " \
>> +    ac_cv_func_strcasestr=3Dyes \
>> +    gl_cv_func_strcasecmp_works=3Dyes \
>> +    ac_cv_func_strcasecmp=3Dyes \
>> +"
>> +
>> +
>> PACKAGECONFIG[tiny] =3D "--enable-tiny,"
>> --=20
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116553):https://lists.openembedded.org/g/openembed=
ded-devel/message/116553
>> Mute This Topic:https://lists.openembedded.org/mt/112076927/3618057
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[Anders.Montonen@iki.fi]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------yCgDqAsvRdjRB08y0s2kCt0w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5350ASL2014141

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-04-04 6:58 p.m., Anders
      Montonen wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:FC376EA8-6664-4B03-8334-5E852F6=
5545C@iki.fi">
      <pre wrap=3D"" class=3D"moz-quote-pre">Hi,

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 4 Apr 2025, at 3:33, Ra=
ndy MacLeod via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:randy.macleod=3Dwindriver.com@lists.openembedded.org">&lt=
;randy.macleod=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:

From: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Ran=
dy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Release notes:
  <a class=3D"moz-txt-link-freetext" href=3D"https://lists.gnu.org/archiv=
e/html/info-gnu/2025-04/msg00001.html">https://lists.gnu.org/archive/html=
/info-gnu/2025-04/msg00001.html</a>

The license file checksum changed because upstream added the line:
  SPDX-License-Identifier: BSD-3-Clause
Add OECONF to avoid build-time checks for strcase[str|cmp], both of
which have been in glibc and musl for &gt; 10 years so it's sensible to
default to yes.

Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
=E2=80=94
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">The commit message doesn=E2=80=
=99t fully match the contents, there=E2=80=99s no license file changes no=
r updated patches.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yikes. I can't possibly have messed up that much, can I?<br>
      Anyway, I'll check and send a v3.<br>
      <br>
      Sorry for the noise, I may eventually learn to double, triple
      check my work<br>
      before sending commits in the rush to branching.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:FC376EA8-6664-4B03-8334-5E852F6=
5545C@iki.fi">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Regards,
Anders

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">.../recipes-support/nano/{=
nano_8.3.bb =3D&gt; nano_8.4.bb}    | 9 ++++++++-
1 file changed, 8 insertions(+), 1 deletion(-)
rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D&gt; nano_8.4.bb} (75=
%)

diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-s=
upport/nano/nano_8.4.bb
similarity index 75%
rename from meta-oe/recipes-support/nano/nano_8.3.bb
rename to meta-oe/recipes-support/nano/nano_8.4.bb
index d1af89ef8d..1aae49d3b6 100644
--- a/meta-oe/recipes-support/nano/nano_8.3.bb
+++ b/meta-oe/recipes-support/nano/nano_8.4.bb
@@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D &quot;ncurses-terminfo-base&quot;
PV_MAJOR =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@d.getVa=
r('PV').split('.')[0]}">&quot;${@d.getVar('PV').split('.')[0]}&quot;</a>

SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://nano-edito=
r.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz">&quot;https://nano-editor.org/=
dist/v${PV_MAJOR}/nano-${PV}.tar.xz&quot;</a>
-SRC_URI[sha256sum] =3D &quot;551b717b2e28f7e90f749323686a1b5bbbd84cfa139=
0604d854a3ca3778f111e&quot;
+SRC_URI[sha256sum] =3D &quot;5ad29222bbd55624d87ea677928b3106a743114d6c6=
f9b41f36c97be2a8e628d&quot;

UPSTREAM_CHECK_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https:/=
/ftp.gnu.org/gnu/nano">&quot;https://ftp.gnu.org/gnu/nano&quot;</a>

inherit autotools gettext pkgconfig

+EXTRA_OECONF =3D &quot; \
+    ac_cv_func_strcasestr=3Dyes \
+    gl_cv_func_strcasecmp_works=3Dyes \
+    ac_cv_func_strcasecmp=3Dyes \
+&quot;
+
+
PACKAGECONFIG[tiny] =3D &quot;--enable-tiny,&quot;
--=20
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#116553): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/116553">https:=
//lists.openembedded.org/g/openembedded-devel/message/116553</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/112076927/3618057">https://lists.openembedded.org/mt=
/112076927/3618057</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:Anders.Montonen@iki.fi">Anders.Montonen@iki.fi</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------yCgDqAsvRdjRB08y0s2kCt0w--


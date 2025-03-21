Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B9DC28B30
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 03:34:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13261.1742528076398187527
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 20:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517513f68b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L3QTdb026417
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:34:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jxgan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:34:35 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52L3YYdT005091;
	Thu, 20 Mar 2025 20:34:34 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jxgam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 20:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt11JlKL6NcCRk/cVPcrt90gjNYvz7TtADI7lA4/cJ+XF64S4IuzkR6fiKCKKJifDlCuoc0FpWA0loDfWit+1xo2surgnrjC6ojoR3Z90MhnZtHEygHvR8K1utOMOUTHuRAkykBMh1yO/fIfDQQrcQHE1I/1ckpkgLEWfytFqZM803is3tzVF6yv+pNgRq6CfAXgoymE2lbL8byCb9ojUxYhVpuyN8ZFW58h21hCpkHHsA2kzyGlzcT4OBGD3rhxTrDbwbK2x42saEWeWYsApzUEFx99jca2xYZ9j75D09TTtQXMKH3eO5LAL8K0B62M8rukW4Uc5pstb1wdi+HKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CYcsMO4qMaU0FIZSJf3BIrESQRm3jhwkJVwS5S0E4I=;
 b=hrrfkWoYNKIrSSInaRZJ1k43JWRhDPHvDkmuEXVhpjO7uJnjSDfb8tl6echOYTdIFcDCK2+GEPW4vhT//r6eGc11DNzTgZrhfprvDCxMZsUAOkdvymJGhHlCvByYdscajuOvdvvoXL9M/S9D0SMe+eLrK2l88pjycLS4i9lJzF/lV5BvRM9Iz1nPze7QWYKvQX/xDKdtDEL5m+/qsivdqyYq0inpmu3sf+WEP5ec1YUMd7u/0bCjxHy3FWprH3Oc3ehDMv1UZetK/9tnncUjM8hDTZ9EvjUCvKNeHTF9rNeZwlI4FOTS8QQyMosSP2FrM7mLchEy+lXJVv8ttuA+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 03:34:29 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 03:34:29 +0000
Message-ID: <4a53f36c-3d93-440d-9500-1683e8c90722@windriver.com>
Date: Fri, 21 Mar 2025 11:34:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v4] protobuf: 4.25.5 -> 4.30.0
To: Khem Raj <raj.khem@gmail.com>, "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <CAMKF1spcbP58H+KjOHdkWOyicPAozdtM_02Q_PXTGDBK7cq0mQ@mail.gmail.com>
 <20250317060612.4111152-1-hongxu.jia@windriver.com>
 <10d699be-2918-4dd3-b892-ef87b8e0a7be@windriver.com>
 <CAMKF1sqNMaLry1AWr0XsZRkh0Vr_qr+qcJRLSFMWUA5VP=LJCg@mail.gmail.com>
 <AS1PR10MB5697D5A271991AFC78DF53BAFDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1so6gnmAjrvshqqSDYY=LFX-TQnSgXTecG9M88+PZ4FzQg@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1so6gnmAjrvshqqSDYY=LFX-TQnSgXTecG9M88+PZ4FzQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MEWP282CA0027.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1e2::10) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: e851a911-820a-4a6a-a0d0-08dd68294973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aFcra0s1YlRHVHhGVlpWTDF3dHhJdHRrNFJsQWtkQWsrWFdqRm40aXNTekZm?=
 =?utf-8?B?ZlYydGxIL0JFZTRPdjlHZlZwcTh3ckdvMmJrQ3E0Y2ZKZ0hmcjJDSnBpNXND?=
 =?utf-8?B?VnVtRC9maHV0RE1OMU5Id2JQRWlsN0x2c1I2ZzYxemhHeVZlYUk3dHdkMVBk?=
 =?utf-8?B?dC9BV2JaVkJuK2R5UUE3c0VrbXN1S3pwem4rUGE5Qk1PZnFMR2dPT2RsLy9F?=
 =?utf-8?B?bXRSUmNJZnpOR2srTCtSbjBDektDZC83VHVKbGlWaFVab01IeTFTLzBLbGJH?=
 =?utf-8?B?U1lnZmFLMm1RMGYzZ2Z5VVRCQ09PYUNBd1VELzBBZFo2aFIyV2ZJa1ZHS2Za?=
 =?utf-8?B?Z0FLNFZ5MjdBNGMwWFpLcHQxSGdqM3Z4TWdQODdUd09HYTRqUysrenpacE9s?=
 =?utf-8?B?TWFPbjZLcFVxeWhOQVdhU2F4OTd6Y3pFcklySDd4clBOMDNPcXVqMHZmNTg0?=
 =?utf-8?B?aDd4Q3lDOVNoT2NQSjVmSXFLbXFTOExVWWR4a1FmOGJ0SFM3L3NsaEJBOGxt?=
 =?utf-8?B?Z1k0RDJpa0VFaTFhcEFUeS9HUUxJSktmWjhaS0dvcHVXeWVpUHBpa0tjcUVZ?=
 =?utf-8?B?eU1qd05IWEVlcSt3NkQ0SWVyN0hGTFVYUVh0REsyVnNta2ZwbUlDMGNZekpz?=
 =?utf-8?B?YTA5aEg5SXNFVEpIcENHakJ5ZWgvaUdjdmFWRlphTjN3KzRwWlQrOVJxZUJO?=
 =?utf-8?B?cUZLd1NCRVNkRDJRRGk2OG1LcjFJaE96U1dpM1ZkT2ZOVkU3U3AraUpWRzh0?=
 =?utf-8?B?Q1BMbS9HanFRUVhRQ3k5VmlmTDJQcGo1dzhvYjUwWGE1Um5Qa2dSL2xRMnQ5?=
 =?utf-8?B?RWR1Rnp4SmZoUGVJM2ZuSnVoblZON3NJSCtud0ZDNmxMVVR1S1pmT0J5Z3Nv?=
 =?utf-8?B?R1RORUY3WloxaFQ4cjlyeExkVk1lNWRIODUzQVlNVkJBeG1HRWFDYUg5eDgz?=
 =?utf-8?B?a01WSXpET2NBZGxvZG1UZm9aaWwvOXlRZGsvSm9HK3pVK2lqeitXY1JVS1Z4?=
 =?utf-8?B?dldGQ0JqN2FSN3hoSklGRVBiUFFGakR4TEdNdGl5cnV5YnRtVkNYblpzUDhw?=
 =?utf-8?B?TmpvaGhJeENHVG5tNXlEMlRhZ3crb3piRGFpODl3NHZxZS9mMUQrZWtQV3JK?=
 =?utf-8?B?TlRHYmk1QlpKejUyMmw4NWFaNXJ1ODhXeGRNNUZxNkpwZjVIaVhJMC9BQ0RX?=
 =?utf-8?B?d0ZIZkFxRE5HOGd5cGxBQ0Z4dktEamRpWFN6WGxzSDRWQXgwTVkxaVAyTG4v?=
 =?utf-8?B?TGxBOTBhWEE0QlA3LzRtRVE1dE5WRXJKZnBrTzZWUFBFNWlaN2FIVXBQRDV2?=
 =?utf-8?B?MC91ZmxJamJva0RNU3JEVUJ3V2huUVJwNkJkcVh4ckVTbW9kQVBxeDVXaDRD?=
 =?utf-8?B?NGE5Tk5UcjltUGo4RWp0UkVNTy8rODBUS1NBUjYwRUpod1c5QlBoRENqdXRa?=
 =?utf-8?B?cGN1MGI5WGpkU01VdzdxQ1EvNzZWZ3NHNEVXWmNQajQvTjZDZ2lLN3BSbFYr?=
 =?utf-8?B?bnVHVmJpYnJwSHg1UGF4ek4zVXdJU3NaUUx4Y2tscXY0NFNNYlBLNit5ekJM?=
 =?utf-8?B?OFRWcVZHQnVMNTRPSkpVdFphVDFPZG1uYTN1QkFPTHBnUUU1YTRVd2xSeWxK?=
 =?utf-8?B?emI2UCtFMjBpUmM1dWhLUU1QQ0ROcGNxejErUXNXdFZMM0g2Qk9MOVAyTUwz?=
 =?utf-8?B?WU5ZRm0rN3NrKzBLaS9wVWVEWk5PSGpqYVVtN2R2dS9scFVwVDdEbE5uSUNB?=
 =?utf-8?B?NHpZU0NET2VJVlVZWFExMUhqUFhDdEIrWlA0V3ppcWs3eXU3dm05MzhzMWdo?=
 =?utf-8?B?aEZqTVcvTWhIL2RjR0tLZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1pTS29EUTNRT0VWREpiWm1hTkV3VFRyYVF1K25qSjJiM245V2pxV2ExRkI2?=
 =?utf-8?B?LzZrL0x5UnNSQTRuSTl6MkcxZnV0cmExUDE3L2ptRzllU0R0anNrWTBsRjZK?=
 =?utf-8?B?NWNKUUNMT3c1eGNYcjNJODFJUHJSTCtBbThaZ0xzcTBsd284NFlaNFdIZW1n?=
 =?utf-8?B?VlFRR1Fhb2h1WnY4VGZ0N3BzVTFpS2lPcjFBekxoc2VDUnlwRHpQWTZMRVFy?=
 =?utf-8?B?S3ZzSW9WckQrSkZiVndqTW5TaFoxaGJ0eGZ5dWFyRElIdlpHd0tPMCtEcWJv?=
 =?utf-8?B?Y2N5Z0V6ZmtWZ0VFN1RuT2lXYUI5Vm1LSThsMmdESnlDQnFBUGtmcGZqRmtI?=
 =?utf-8?B?M0pjL3hnRE9QMFdMS09wOWdTU2xzVmo5RFlwWk5jcHRWZ1dCQ1ExUWpPY0I5?=
 =?utf-8?B?UFRQYTVSV2kxTGYycExLTEMxRFI5eUpERnJKVUYzRTdaRGNoenJuRVUyV2dR?=
 =?utf-8?B?MG1ET3VwZXhHUHRCMWpQdkY4aFR3UTdsTmVCTmhVQTFiZ2FieVRaSTI1Z0ky?=
 =?utf-8?B?bVF3Q2xleTVWNmJnVHgvenhaUXZaNkNVYlpRdFBPaXNoTXZFWi9NdkF4ODZr?=
 =?utf-8?B?NlM4WVdnTXpyR3h3WTdxMlFZN0dHS0hLTVdGaUZXUVp0OExqM0tsdVdLOTNW?=
 =?utf-8?B?ZnNzcS8xWHo0NDFkWktRem9GekYzTks4NWdRWlVWc3BHTUxvWDc2SFNXdDd6?=
 =?utf-8?B?M0JCZS92cjJ2NExCRy80NXNLY2xva3YwVnA0aCtNdzE2YURGTkVMeSs5ZkJx?=
 =?utf-8?B?MWx4ZmtscHhTZ3JEeFA4d1ZUNHk5YjZ0K2diYTNrNmJEa0wrVTFRTGVLdjVZ?=
 =?utf-8?B?eERXOWxTWExXcDkrQ0JBa2dMSXk5b0RKL0dNZ2tkclNUZUd2NGNBNGxuMzFa?=
 =?utf-8?B?NFd3cVZNUjZ2dS9LVHpsV0NXVm42QXh1R09qOU9JWVhsb2dVZTRrTmtiQVFQ?=
 =?utf-8?B?T2pRcFFLSSthRkNwR1I2ZDYyalZ6ejlTR3dHdzIvUE9EUTlhT1d6Y0kwV0tu?=
 =?utf-8?B?V09RWFU2b1E5cG5SbUlzRlJKWHJoT1JBSjBhMU81aWljbDJDeEV1V3UyUmxH?=
 =?utf-8?B?M0FlSmFuMXZDc2YyTk5DRGNZN0pxajhVU09WdUIyOWVUTXozeFdPdDVBZkpE?=
 =?utf-8?B?WjJLSnpwTmVFdjUrcUlIVEZ0QTEwM2RlNVp1bWJDMXJYcG9VR0IrWFhyL2hC?=
 =?utf-8?B?SXdkcG95STlDbXJRVnVQMmlKKzRLYndxU2hmVThBZnFxbHhvWmJXa2FrMVd4?=
 =?utf-8?B?R1h4Z2dMY1g2Z0g1Q2JSSGU2QWRuczNjZ1JXYUJUZ2VVZlZRaTV2MTFaMDBt?=
 =?utf-8?B?eGIxcklLb1QvOVdTcCsrUFdzSDBqTjdXZ0RtM0xtSXNvYWJEOURyS29ZUHg0?=
 =?utf-8?B?cDhaakd1ZGdHZ1QvY2dkeUlTdXdHL09FUFRDcE8rNVVqTVl2R3VZTWpoNnZx?=
 =?utf-8?B?dmk4ZTlzNHJyckZBWm9ScUxmY0E3SE4wRFZWZ3dPZVlCRC9YYW54TlJlZE9O?=
 =?utf-8?B?VEp6eHBUd0ozTG13TWFudkhJTTZmbTB4WlpIU1laTzFwc21XUG9Dck0xRVdk?=
 =?utf-8?B?Y2pMNndSd1B3ZWY0WlpkTkkya2UwZ0pnRzVyNVlCZ21LVHNHUUd6aENyc1Y5?=
 =?utf-8?B?OXp5UnJ5L2VicHRUcU10R2REU1pxSVNhQWRHYXY2YWhoU0VYT2xRVGtYUUkz?=
 =?utf-8?B?WmhTZjM3TzV4OWJhNmVRRmsvMG8zUWVtMEd2dERWVGlVRVNwWDhobmhpalIv?=
 =?utf-8?B?QzEyMTBaMGlMYzhaSDljZU5yNWM1dE1hTXRjWDdBcmMwLzU2Um40NmpKVTI5?=
 =?utf-8?B?OG9HVmZHcFJsb21EMXZUVml6WkJBUHNUT2ZjK2lEMWRkdVdyLzM2Z2JKUWxE?=
 =?utf-8?B?eHNYZ1BxekNlbGtQZ2VmS00yaXhqUUs1WmFYUnF3d0MzVVNld040eENvakNE?=
 =?utf-8?B?RkxMMk50ekdSdkZueWcyMDZUUlREc3JnY1I0dVVUMUMzY01oNjVONG9ySzFZ?=
 =?utf-8?B?bVVNSHhuMnNUclpOY2hteUlDRzlGUkxORWhnaElxVlp3OVZaYXIrS3ZZTzZk?=
 =?utf-8?B?VTRlVFFnZmlpREtpQzFpZlNjUHpaY2dzQnA5THlOaVl5RGtXQmFnTmp6QmZp?=
 =?utf-8?B?dHNaR09zVFhEOWdOVTdBUnloYnl2RFRHTlVxNWtZeUN1ZCt3QmNiUUhCRmpO?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e851a911-820a-4a6a-a0d0-08dd68294973
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 03:34:29.3318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK1XWw56RW2AiEMF+G1aUj+owxjfA0ASf9L0c8AEzr70z8kRDjgO2GIPjDZqPsKPwpZNWVH3E1NHbFiyhFVsU3onjZ6S5liMagWx6k/RO0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67dcde4b cx=c_pps a=p6j+uggflNHdUAyuNTtjyw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=PlsyGhjiAAAA:8 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=a_U1oVfrAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=Y2qIQ1IhM0gpPnV8S20A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ES-fD_9M07-1p2amA5gm:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: cAtk3nRJH1aR-U7JvImfzPTMzHrcojAS
X-Proofpoint-GUID: z6xz3KkqAOqwYuPHIDjpVxqSrzx6gLeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52L3QTdb026417
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 03:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116155

On 3/21/25 02:22, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Mar 20, 2025 at 6:04=E2=80=AFAM Marko, Peter <Peter.Marko@sieme=
ns.com> wrote:
>> This version update is imho wrong.
>>
>> 4.30.x is not a C++ tag, please check https://protobuf.dev/support/ver=
sion-support/#cpp
>> We should either take 5.29.4 to have "new LTS" (patch releases for 1 y=
ear)
>> or 6.30.1 to have the latest and greatest (patch releases for 3 months=
)
>> I think 5.29.x is the correct choice, but since next Yocto LTS is stil=
l 1 year ahead,
>> 6.30.x is also acceptable with risk that dependent components may get =
broken a lot.
>>
> Thanks for sharing the release schedules, while I would like to see
> 6.x in master at some point
> and perhaps get 6.33 into next yocto LTS in Apr 2026, it might be
> better to stick with 5.29 in this
> release since there still is good 1 year before the next LTS
Copy, I will upgrade it to 5.29.4, v5 incoming

//Hongxu

>> Peter
>>
>>
>>> -----Original Message-----
>>> From: openembedded-devel@lists.openembedded.org <openembedded-
>>> devel@lists.openembedded.org> On Behalf Of Khem Raj via
>>> lists.openembedded.org
>>> Sent: Thursday, March 20, 2025 4:12
>>> To: Randy MacLeod <randy.macleod@windriver.com>
>>> Cc: hongxu.jia@eng.windriver.com; openembedded-
>>> devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-oe][PATCH v4] protobuf: 4.25.5 -> 4.30.0
>>>
>>> btw this breaks qtgrpc from meta-qt6
>>>
>>> | /mnt/b/yoe/master/build/tmp/work/x86_64-linux/qtgrpc-
>>> native/6.9.0/git/src/tools/qtprotobufgen/qprotobufgenerator.cpp:205:8=
2:
>>> error: could not convert
>>> =E2=80=98file->google::protobuf::FileDescriptor::dependency(i)-
>>>> google::protobuf::FileDescriptor::name()=E2=80=99
>>> from =E2=80=98google::protobuf::internal::DescriptorStringView=E2=80=99=
 {aka
>>> =E2=80=98std::basic_string_view<char>=E2=80=99} to =E2=80=98std::stri=
ng=E2=80=99 {aka
>>> =E2=80=98std::__cxx11::basic_string<char>=E2=80=99}
>>> |   205 |
>>> internalIncludes.insert(utils::removeFileSuffix(file->dependency(i)->=
name())
>>> |       |
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~^~
>>> |       |
>>>                      |
>>> |       |
>>>                      google::protobuf::internal::DescriptorStringView
>>> {aka std::basic_string_view<char>}
>>>
>>> On Wed, Mar 19, 2025 at 10:46=E2=80=AFAM Randy MacLeod
>>> <randy.macleod@windriver.com> wrote:
>>>> On 2025-03-17 2:06 a.m., hongxu via lists.openembedded.org wrote:
>>>>
>>>> Refresh local patches
>>>> - 0001-Fix-build-on-mips-clang.patch
>>>> - 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>>>>
>>>> Fix protobuf-native build failure with gcc 10
>>>>
>>>> Changelog:
>>>> https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> ---
>>>>   .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++----
>>>>   ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 25 +++++------
>>>>   ...buf-native-build-failure-with-gcc-10.patch | 43 +++++++++++++++=
++++
>>>>   ...{protobuf_4.25.5.bb =3D> protobuf_4.30.0.bb} |  5 ++-
>>>>
>>>>
>>>> Ping Khem:
>>>>      Does that fix the ubu-20.04 problem?
>>>>
>>>> Also, Hongxu, should the python package also be updated?
>>>>
>>>> =E2=9D=AF fd protobuf_4
>>>> meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
>>>> meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
>>>>
>>>> ../Randy
>>>>
>>>>
>>>>   4 files changed, 76 insertions(+), 23 deletions(-)
>>>>   create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001=
-fix-
>>> protobuf-native-build-failure-with-gcc-10.patch
>>>>   rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D>
>>> protobuf_4.30.0.bb} (97%)
>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-bui=
ld-on-mips-
>>> clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-bui=
ld-on-mips-
>>> clang.patch
>>>> index 9f6116c4c4..6db22c26d3 100644
>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-m=
ips-
>>> clang.patch
>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-m=
ips-
>>> clang.patch
>>>> @@ -1,6 +1,6 @@
>>>> -From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2=
001
>>>> +From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00
>>> 2001
>>>>   From: Khem Raj <raj.khem@gmail.com>
>>>> -Date: Sun, 31 Oct 2021 23:39:44 -0700
>>>> +Date: Mon, 10 Mar 2025 19:59:19 -0700
>>>>   Subject: [PATCH] Fix build on mips/clang
>>>>
>>>>   clang13 crashes on mips, until its fixed upstream disable tailcall=
 on
>>>> @@ -10,17 +10,25 @@ https://bugs.llvm.org/show_bug.cgi?id=3D52367
>>>>
>>>>   Upstream-Status: Inappropriate [Clang workaround]
>>>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +
>>>> +Rebase to v4.30.0
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>>   ---
>>>> - src/google/protobuf/port_def.inc | 2 +-
>>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> + src/google/protobuf/port_def.inc | 1 +
>>>> + 1 file changed, 1 insertion(+)
>>>>
>>>> +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf=
/port_def.inc
>>>> +index 35f49afb4..e9597af0d 100644
>>>>   --- a/src/google/protobuf/port_def.inc
>>>>   +++ b/src/google/protobuf/port_def.inc
>>>> -@@ -255,6 +255,7 @@
>>>> +@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
>>>>    #error PROTOBUF_TAILCALL was previously defined
>>>>    #endif
>>>> - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
>>>> + #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) =
&&  \
>>>>   +    !defined(__mips__) && \
>>>> -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
>>>> -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
>>>> -     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
>>>> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                  =
    \
>>>> +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
>>>> + // Compilation fails on ARM32: b/195943306
>>>> +--
>>>> +2.25.1
>>>> +
>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-example=
s-Makefile-
>>> respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-
>>> devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS=
-
>>> variables-fix-.patch
>>>> index 7c4bf260eb..1b68c24c96 100644
>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makef=
ile-
>>> respect-CXX-LDFLAGS-variables-fix-.patch
>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makef=
ile-
>>> respect-CXX-LDFLAGS-variables-fix-.patch
>>>> @@ -1,13 +1,12 @@
>>>> -From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2=
001
>>>> +From 9d50661003d78a4debfc7eda532f0b53df51fd7c Mon Sep 17 00:00:00
>>> 2001
>>>>   From: Martin Jansa <Martin.Jansa@gmail.com>
>>>> -Date: Fri, 28 Jun 2019 13:50:52 +0000
>>>> -Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, =
fix
>>> build
>>>> - with gold
>>>> +Date: Thu, 13 Mar 2025 10:54:01 +0800
>>>> +Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
>>>>
>>>>   * move pkg-config call to separate variable, so that the final ver=
sion
>>>>     of the whole command so it's shown in log.do_compile_ptest_base
>>>>   * add ../src/google/protobuf/.libs/timestamp.pb.o when linking
>>>> -  add_person_cpp otherwise it fails to link with gold:
>>>> +  add_person_cpp otherwise it fails:
>>>>     i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mf=
pmath=3Dsse --
>>> sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O1 =
-Wl,--hash-
>>> style=3Dgnu -Wl,--as-needed add_person.cc addressbook.pb.cc -o add_pe=
rson_cpp
>>> `pkg-config --cflags --libs protobuf`
>>>>     /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2e=
proto:
>>> error: undefined reference to
>>> 'scc_info_Timestamp_google_2fprotobuf_2ftimestamp_2eproto'
>>> /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eprot=
o_dep
>>> s: error: undefined reference to
>>> 'descriptor_table_google_2fprotobuf_2ftimestamp_2eproto'
>>>> @@ -25,12 +24,14 @@ Upstream-Status: Pending
>>>>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>   Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>>>
>>>> +Rebase to v4.30.0
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>>   ---
>>>>    examples/Makefile | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>>   diff --git a/examples/Makefile b/examples/Makefile
>>>> -index ef7a4ef58..7206e14e1 100644
>>>> +index 5290fdb03f..3b9545bf2a 100644
>>>>   --- a/examples/Makefile
>>>>   +++ b/examples/Makefile
>>>>   @@ -2,6 +2,8 @@
>>>> @@ -42,20 +43,20 @@ index ef7a4ef58..7206e14e1 100644
>>>>    all: cpp java python
>>>>
>>>>    cpp:    add_person_cpp    list_people_cpp
>>>> -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
>>>> +@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
>>>>
>>>>    add_person_cpp: add_person.cc protoc_middleman
>>>>    pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
>>>> -- c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cp=
p `pkg-
>>> config --cflags --libs protobuf`
>>>> -+ $(CXX) $(CXXFLAGS) $(LDFLAGS)
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
>>> addressbook.pb.cc -o add_person_cpp #$(CXX) -std=3Dc++17 $(PROTOBUF)
>>> add_person.cc addressbook.pb.cc -o add_person_cpp
>>>> +- c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config=
 --
>>> cflags --libs protobuf`
>>>> ++ $(CXX) $(CXXFLAGS) $(LDFLAGS)
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
>>> addressbook.pb.cc -o add_person_cpp
>>>>    list_people_cpp: list_people.cc protoc_middleman
>>>>    pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
>>>> -- c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_=
cpp `pkg-
>>> config --cflags --libs protobuf`
>>>> -+ $(CXX) $(CXXFLAGS) $(LDFLAGS)
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.c=
c
>>> addressbook.pb.cc -o list_people_cpp #$(CXX) -std=3Dc++17 $(PROTOBUF)
>>> list_people.cc addressbook.pb.cc -o list_people_cpp
>>>> +- c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-conf=
ig --
>>> cflags --libs protobuf`
>>>> ++ $(CXX) $(CXXFLAGS) $(LDFLAGS)
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.c=
c
>>> addressbook.pb.cc -o list_people_cpp
>>>>    add_person_dart: add_person.dart protoc_middleman_dart
>>>>
>>>> ---
>>>> +--
>>>>   2.34.1
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-pro=
tobuf-native-
>>> build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/protobuf/p=
rotobuf/0001-
>>> fix-protobuf-native-build-failure-with-gcc-10.patch
>>>> new file mode 100644
>>>> index 0000000000..d7c9f38eff
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-n=
ative-
>>> build-failure-with-gcc-10.patch
>>>> @@ -0,0 +1,43 @@
>>>> +From 03dabf4b153071ec1bdcd2c278461984cc6f1714 Mon Sep 17 00:00:00
>>> 2001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Mon, 17 Mar 2025 13:28:13 +0800
>>>> +Subject: [PATCH] fix protobuf-native build failure with gcc 10
>>>> +
>>>> +Build protobuf-native failed on ubuntu 20.04 which has gcc 10
>>>> +
>>>> +protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
>>>> +error: static assertion failed: Protobuf only supports C+
>>>> +   =E2=86=AA +17 and newer.
>>>> +   |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus >=3D x)
>>>> +   |       |                                   ~~~~~~~~~~~~~^~~~~
>>>> +   | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-
>>> native/4.30.0/git/src/google/protobuf/port_def.inc:119:15:
>>>> +note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
>>>> +   |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
>>>> +   |       |               ^~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +---
>>>> + CMakeLists.txt | 4 ++++
>>>> + 1 file changed, 4 insertions(+)
>>>> +
>>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>>> +index ae3c324..eda19aa 100644
>>>> +--- a/CMakeLists.txt
>>>> ++++ b/CMakeLists.txt
>>>> +@@ -14,6 +14,10 @@ endif()
>>>> + # Project
>>>> + project(protobuf C CXX)
>>>> +
>>>> ++set(CMAKE_CXX_STANDARD 17)
>>>> ++set(CMAKE_CXX_STANDARD_REQUIRED ON)
>>>> ++set(CMAKE_CXX_EXTENSIONS OFF)
>>>> ++
>>>> + if(protobuf_DEPRECATED_CMAKE_SUBDIRECTORY_USAGE)
>>>> +   if(CMAKE_PROJECT_NAME STREQUAL "protobuf")
>>>> +     get_filename_component(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR}
>>> DIRECTORY)
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/=
meta-
>>> oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
>>>> similarity index 97%
>>>> rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
>>>> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
>>>> index a470a7c643..0d6123dfa0 100644
>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
>>>> @@ -14,11 +14,12 @@ LIC_FILES_CHKSUM =3D " \
>>>>   DEPENDS =3D "zlib abseil-cpp jsoncpp"
>>>>   DEPENDS:append:class-target =3D " protobuf-native"
>>>>
>>>> -SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
>>>> +SRCREV =3D "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
>>>>
>>>> -SRC_URI =3D
>>> "git://github.com/protocolbuffers/protobuf.git;branch=3D25.x;protocol=
=3Dhttps \
>>>> +SRC_URI =3D
>>> "git://github.com/protocolbuffers/protobuf.git;branch=3D30.x;protocol=
=3Dhttps \
>>>>              file://run-ptest \
>>>>              file://0001-examples-Makefile-respect-CXX-LDFLAGS-varia=
bles-fix-.patch
>>> \
>>>> +           file://0001-fix-protobuf-native-build-failure-with-gcc-1=
0.patch \
>>>>              "
>>>>   SRC_URI:append:mips:toolchain-clang =3D " file://0001-Fix-build-on=
-mips-
>>> clang.patch "
>>>>   SRC_URI:append:mipsel:toolchain-clang =3D " file://0001-Fix-build-=
on-mips-
>>> clang.patch "
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> # Randy MacLeod
>>>> # Wind River Linux




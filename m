Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADDEC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 03:12:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11669.1724209946818041654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 20:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8963e5002e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L38hAW014424
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 20:12:26 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q543fvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 20:12:25 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47L3CPMt021195;
	Tue, 20 Aug 2024 20:12:25 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q543fvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 20:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAksZz6/SJ9edRbpWkDDBIfF8yoy2PNfhxGflloLWfdysUpYRGz8csNepH4QL2PBinBrYHpRqJbpcrRe4DgNLfOBfr60FL4eHeIUhmC5wv+Ts0DCW3GF08HL9Y39sU/HkJ3lYZeAX+WH1YXSDaRnPpZDwsKn4rskzMLMQZGhoKJMlbPYgQwYJqqcpIxP49PonI2wx1t6dIcWCgf1z+leLst4FnNgBAQUjHtxvECXQde2A34fEDeP/Gr8dQynZ/MEIsIrvYrnm6/I2QfiqhnDW2PfLlngZoodSga8gIyFt4nIveSeFeDDKxnLjtg5OzDnRPxFCmzqFx5NVDCMfTM1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDynnlcFjbssuO3b2vS4cTuItPKg9EgmLg/oFASP+44=;
 b=JcL6gyhXM+ebrBhIc/WOZVbXf1UuudYgSNfML43ysXoe5C7wBER7RlzOnqgmUVtupU29NEb7BzFmzf2V7AZrMrcQfFD4p0i56Ns7fOJPq07LHXmzsWtujqOvDsTw7rhe0jXCzbxeB8Wzd1ISnOWRAkiTx2VnwRY8ZVvfRTgbK1CEHNAra89OXBNRiEXlvx8TCPkByx7WixylhXn4c8o4anNEnKtnr6mazFbm+zytdVPfkbozWVhY0HaXJkoJLxgSSJ72kPVW3iJr0dt+xv8UYlh1AuOXmkhTGLiqgRwbDMzXQsQFce2eAgNbZRkeYGms/TROP4s4LNwnCc0vBZoDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 03:12:21 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 03:12:20 +0000
Content-Type: multipart/alternative;
 boundary="------------Mpazoz5Vb9ueGwQEBCebmBlK"
Message-ID: <32cbbea5-28bb-42be-84a0-0675258690b2@windriver.com>
Date: Wed, 21 Aug 2024 11:11:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: support cross compile without qemu
 user conditionally
To: Khem Raj <raj.khem@gmail.com>, hongxu.jia@eng.windriver.com,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240819022906.999604-1-hongxu.jia@windriver.com>
 <CAMKF1sqjP5f3KWZUi-=Y+ueH1iVahdLHmU4Ww47-pnYv6o_U=A@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1sqjP5f3KWZUi-=Y+ueH1iVahdLHmU4Ww47-pnYv6o_U=A@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f7bfeb-29b5-4fc9-96da-08dcc18f11e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VnBmL3cwRDdZbHJBZ2lpa1VkaURUaThIT3VGOWRiU1NBWXBoYVJlcll0WkVt?=
 =?utf-8?B?Q0g1YkE1OWlVK1d4ZlUwT1BrcDVXMkg3Mzk0emhBU0ttMmlkWmNsZ3hSTW5j?=
 =?utf-8?B?SGs5cEVvc2JRL1BjZ2ZrWTM4T3J3dXZFN0NESlcwMmJoeUZ3K0NGeWZjS2tu?=
 =?utf-8?B?ZzFud2JFTkxFRFhpNmNGWFJiVGlUZ3FpMUIxRk5PbjdMaXVVL296K1REL0ZD?=
 =?utf-8?B?MTZKZHliSnNIUzlhcldOd09tZFZBZlVvVUFFSkNjajdlQWJyYjNYc2tJVUZu?=
 =?utf-8?B?Z1lqUG5iVEF2cVE2c1N1WmVLdUtjOVdtb1RBMktvOW41cE9EcWxZQ2k5bzE1?=
 =?utf-8?B?VVRWeE4yYnNFKzIweUVCZFZyYk1BRURGaHVSdzVTaFVFekY5VjFodWNpdVFR?=
 =?utf-8?B?RWpiQWovNkJKMHBJeDlEWGExbEJZVnl0akVnVTd4bTY5T0VEUW05L0RBU2Fz?=
 =?utf-8?B?QVhIb05wTTlmWTg2bXFHbHV3eGZXVFVXdnhIbjI4L3V5cElTVFBrcVcrZUFk?=
 =?utf-8?B?Z2YrbDlnL0gycW5mNnlmYzBkMVcxYjdIQjFidzM0T1JyT3F2cW1BZDh3Skd3?=
 =?utf-8?B?VkhIbFJWTUdYUXZDbE5HY3NhRUtXMEJZZUZsRG9XV1FxMGk0NWtqQTl5ZGRq?=
 =?utf-8?B?U1U2UzYrcUdWeDk0RER1YkNON3VYbnFmWnNwdC9Pc29PazFkUitDUHNBYW1R?=
 =?utf-8?B?eW5KUGJPanoyYkpWTFFjQmNqQ1FuQzViK1hSbmx0TUp5TmdYZ0RqMGxkd2hR?=
 =?utf-8?B?Y2dhT1MvWXcrQ0JGUW0waUJhQjl6MzNkbFAyOU9QMmMydXlRbVNUajVYeUlB?=
 =?utf-8?B?a1docDdiRkRUWHc3cmJPa0tsK25ySmxseTNsM0pMNlUxdDErMS8rMzBxVytZ?=
 =?utf-8?B?VGM2d2FDbTlhZmh1WExWNjJEVzdtWWgrZ2NLek1OelBLbHFwU0h6ZzY2TTVv?=
 =?utf-8?B?NVRzQ2kyb29QZ2RVM1ZtQ08yT1hVdGM4QmJNcW05Qjhld0NPdnA4OXluZ3cv?=
 =?utf-8?B?UHBETnlHUWhITWhNWG03d1dYL2FLTGxWQldScm12d09kNTQyZU5MejJQbkdh?=
 =?utf-8?B?R3BUK2VaSStJU0g1YjNiTzcweTM0Vjk2eW9pQy9VM1BaNU9GY2ltQjlkT080?=
 =?utf-8?B?NUtiL2JtQlZYVlFlQXVQUHNEeGFoRlZvakRuZXBTRUxwdjZDRFRrYi9MNWV2?=
 =?utf-8?B?cmdtcDNzdDJqTEh1OWUwZElMSE5JcFJucnRFT0F2ZlBVcmlEVmNueitHUDlU?=
 =?utf-8?B?VEdPaFVsSDh4M3RqYTBaMU5ReGtnRTVpalJBQ3JzNk5HMW9WOXBDaXoyQWl3?=
 =?utf-8?B?RmdXelQzaGNqd1ZBKzZpTlNlM0swUTNobHhNcUVCaWROMWs4MGFYR29GaUpl?=
 =?utf-8?B?ZlpLS3ZXa2RUSmMxMEF5K2ppbWdtMHozZUMvdW1CRWs3WFYrNkxqd3RQZ3lx?=
 =?utf-8?B?Rk9CU0pxNStQYmUrY0F1Q3ZvSW1GSnltbHBpUldjM28ySWs1cDVjTDRQSUZE?=
 =?utf-8?B?dmdDZWNvcXRFZXhkOVRweGZJTG53RHdxejhvdmIveGZ2cVRFVXdCcHdRd2x4?=
 =?utf-8?B?M2E2S2FWejlUc3BJNzFXdU1sUk84OTI5SlFFelM0bC9zaENtcDROV3puY3VP?=
 =?utf-8?B?dENTbkhtbFFSbFBxYkRzUFNBL014VEtSVkQ0Y2IySHVCMGRDUWpFMFdVbFoy?=
 =?utf-8?B?K1Z5anZ6UTVWck41YlNPdDB2aUxJMWhzOGRla3Z6aEhxK3VIV3dHUnN1YXor?=
 =?utf-8?Q?32NICPfb+hNCgAwnXA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDhGZ0c0NmlrOHNnTHYxd1lncUxRK3RwWlhoamU1ZUt4MkhRUmo0NEhrV3Fr?=
 =?utf-8?B?Sm8ySkp2RCtXNzI3RWRFaFpQaDBpWm5uSDAraW5pdzVIbVhZUUR5amZNUjcw?=
 =?utf-8?B?a1Z5TEcxbEt5MWhhdHoydFIxYnJETlVuajkxS2tYeUVjMTRuSXdPS2xFUUlo?=
 =?utf-8?B?R1QxMTVqdEc0dGVOb3JWNXVHL2d4VHcwV0t3WGt6US9PNkMvTEJRaFZHRk1s?=
 =?utf-8?B?SE9vZVNsUXR3ZHlJZkNtK2lZQjB6Ylp0YWh5RUY2T2J6VkhnZzRiczNjRFZa?=
 =?utf-8?B?aFQyczcvdzRuSzZLb1FicE9Qa3J0M1NLcHBTTEVyUXRLTEp6NzNDYXpXVFlI?=
 =?utf-8?B?ZHlMaFNNeXVlaXAxZHl2WklhQ0VFSTcwRXpRSktYZ0RZOUZNb3dHZkcvRXpo?=
 =?utf-8?B?aWZnc2V1cjFHOW1RZlkrVzZYUkJSTGJxZVV2MXh4VExKVWE3SG5POGdrV2ZI?=
 =?utf-8?B?UUZML2RocWsrVWtzRFdJcE9JZGU0RzJLT0hFRDE3cHpMbmdlYkxkc1U4SG9w?=
 =?utf-8?B?V20ySnlEMEhjVHlHZzdadlhVOUJGTWNBYXRPQzVGNVlnRTdYQzg1VjBTU0hH?=
 =?utf-8?B?V2FMb201aXlpN0hkQ0F2SU1oQkpJdDB2ajB6VVM0ZTFSR09tYmRrencyYklu?=
 =?utf-8?B?WG9ueUdoeDFud2hJdlFDM2pGYmM1UjkrNm9YaW5RRVMwa0o1alp1dE1TQ2Ja?=
 =?utf-8?B?Z3NEbU9tR3hzMy8vTy9QTFVTekw5clBMemFBV1VoUU9aeStBMTQvai9WQzVB?=
 =?utf-8?B?QTNxb3dzcWN5bm9KdU5EZmlNaExIT3VtYXEzclZpK3JDN0ZjZHhBbCtKNXo0?=
 =?utf-8?B?ZEY5ZFdVcVZ0M2d2bFNQaTFYMzFuKzZKZTNSTWhNbXJpN1ZyZXVyWjZ3bm90?=
 =?utf-8?B?bmFzcTBtYjA5RU96VmxTVnhNVk94ODNTOHJsRzZIZytvaWRGNzFWY1czNk42?=
 =?utf-8?B?Vk53VCtQRjJoRExWeWxacFJnSG4ycjhOTmJ3ZDBzNGt0Z1d5dE96YTZpQTNL?=
 =?utf-8?B?dmNQYmV1NE9YZlM4YTdhdFlnQlN2aElnMkJER0ZaeFZtK29FL1FKbjNvMmZ4?=
 =?utf-8?B?cHBXMk0yRlVmQ0p2WU9vTTNFYmwzMFh2elI5NW9VeGpOQ2JJdlprR1hMaTgv?=
 =?utf-8?B?OWNOMW1BeG9nTUVaMCtXbWJncXNITFdLU3IrZVkvai9OWU9PK1NCVlBZTmRL?=
 =?utf-8?B?am9VaGdWVjNCSlRVdXpad2lMd0paSDc4UXV1Zjd6bEliREdTSnBDbVJMT1cx?=
 =?utf-8?B?ZVQrYkNhKzhOR3ZmWlBadGQvM2dVNXVDZW5sdDRSR1pZUTRhdGVZcis2WkVX?=
 =?utf-8?B?c1ZYRWhxeXRSbTM1ZEMyS2VoWUpOdURSL2U5bzR2N2t3TDd2WjdkZURwdXVx?=
 =?utf-8?B?dVBRUUVGWm8wTXJzV1hEdFdxY01SYis5aGsvWXRHUWpId0RueHUwMUNkT3ZJ?=
 =?utf-8?B?bXZuVVZMZXNTZTRFNnFEUURRd0lTWTc5bUloVUxKREFkRGJYcGEzNTlhMys1?=
 =?utf-8?B?OXhXU0xSZlZwVzNZUHllb2xiTzVTYldXL0RyUVl4ZWpKNStseUhFMmorK2Vk?=
 =?utf-8?B?b0xMQmFnaWNBR0xyTjNOaUxnNVQvNTBjYXM0Zm94NmZDbmpuSXJ5cXNFQ0pD?=
 =?utf-8?B?by84d09pbm0wY1RxVXYxc0dpaEozSEgxMk4raml6aGVzYmNESFVuMHJaYkRi?=
 =?utf-8?B?ZFNTdWg0RE5LMEJqcTgwSC82aWphdWlQdFpJY29EK2tiaW93aStOUDFvcVFt?=
 =?utf-8?B?eHBNUmIrdEhLVGdNU1gvemdTem1PSUVvRmorQnpNZjNRay9qUHplaHhETFZP?=
 =?utf-8?B?OTRtVHIzTmdjWjVUUk5GeXl4RHlmMXcxbVFrQ0thRy81Z01FN2RZdWZJWkYy?=
 =?utf-8?B?SHVpT0EzN1lTc3RZRm9vNGd0QTRhRlNpbC9RSXpPcGRPc2gwcll1NjJmQm03?=
 =?utf-8?B?WURtdnlONzVVdTBsa1F5dFFQclVOSThjaERpS0pMVnhlb0pCMlVYd3E0aUFD?=
 =?utf-8?B?S1Vac3ROcHExTjJPeTkrZnhQdXhlWkdpa0Fmc3VTekQ5aitHbkJ6RVA5SGhC?=
 =?utf-8?B?bGloZGJyVWEra1dlRmlhbEd6REF0K3J0Umwrb1pOczlLUVJ1blJaeTBXTVpr?=
 =?utf-8?B?OFduSnl1Z21pbG9MSFZVWFViTWMyelhKaHkrbTlEcE9tTnYxejlzZXZ2VXRh?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f7bfeb-29b5-4fc9-96da-08dcc18f11e9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 03:12:20.6667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSYWhgugKDYH+rro09eco9hPZ/x/pwGy3PGihIW5WrdbwENa6XEUREnnZRiuh0VnveevMIv5gS+hcMrn+1Hr2iwEkyieLinS9pgv19AFTVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-Proofpoint-GUID: po_999JwOQnvMCTi_PLJn9fkG2CmpgXd
X-Proofpoint-ORIG-GUID: TdRfXR74pIGnHz6eIkG1MAL-jDUfbrIu
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c55b19 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=-LCu6K_DAAAA:8 a=ms0xyESw_v4PT-qG5CMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=j9Gkw3vXnVuGLMuZa8UA:9 a=UoNeVONGr1_HZC0j:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=J-JL0wFkX4TZ9yyCLs2E:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408210022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 03:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111874

--------------Mpazoz5Vb9ueGwQEBCebmBlK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47L38hAW014424

On 8/20/24 00:05, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org>  wrote:
>> Due to the scope of supported BSPs by qemu-user is limited, such
>> as a segment fault on armv9 after qemu apply commit [target/arm:
>> Convert LDAPR/STLR (imm) to decodetree][1]
>> ```
>> |tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.1=
/out/
>> Release/v8-qemu-wrapper.sh: line 7: 3179613 Segmentation fault      (c=
ore dumped)
>> PSEUDO_UNLOAD=3D1 qemu-aarch64 -r 5.15 -L tmp-glibc/work/neoversen2-cr=
ypto-wrs-linux/
>> nodejs/20.5.1/recipe-sysroot -E LD_LIBRARY_PATH=3Dtmp-glibc/work/neove=
rsen2-crypto-wrs-linux/
>> nodejs/20.5.1/recipe-sysroot/usr/lib64:tmp-glibc/work/neoversen2-crypt=
o-wrs-linux/
>> nodejs/20.5.1/recipe-sysroot/usr/lib64 "$@"
>> ```
>>
>> Upstream nodejs have cross compile support, but it needs host and targ=
et
>> have same bit width (e.g. a x86_64 host targeting arrch64 to produce a
>> 64-bit binary). So:
>> 1. If host and target have different bit width, build with QEMU user a=
s usual;
>>
>> 2. If host and target have same bit width, enable notejs cross compile=
 support:
>> - The build tools of nodejs is GYP[2], set CC_host, CFLAGS_host,
>>    CXX_host, CXXFLAGS_host, LDFLAGS_host, AR_host for host build
>>    which is separated with target build [3]
>> - Add missing native packages to fix library missing on host build
>> - Rework libatomic.patch, explicitly link to libatomic for clang
>>    conditionally
> Does this mean that upstream has stopped supporting 32bit hosts ?

The nodejs does not support to build 32bit target on 64 bit host for=20
cross compiling.

but the normally non-cross compiling, the 32bit build still supported by=20
nodejs.

For GYP, while enabling cross compile, it simple duplicates sources as=20
host and target,

so the bit specific source could not work if host and target have=20
different bits

Ideally, nodejs should split bit source conditionally along with arch tes=
t

> if so, than I would follow the suite and disable building for 32bit mac=
hines
> nodejs build in OE is quite unwieldy and this just makes it a bit
> more. Is there a way
> to improve qemu-user ?

For qemu-user solution, it is just a workaround for cross compiling, and=20
force the build depends on qemu

which made the maintainer of nodejs become a qemu expert.

For the segment fault on armv9, although I found the issue was caused by=20
the commit via git bisect

https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f7585d=
c7

But it is hard to debug and fix it. The qemu rework it, no minor change

Another similar issue is=20
http://errors.yoctoproject.org/Errors/Details/766923/

Although I do not met the issue on my build, but we may have similar=20
issue on other BSPs

# http://errors.yoctoproject.org/Errors/Details/766923/ #=20
TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/out/=
Release/v8-qemu-wrapper.sh:=20
line 7: 252447 Illegal instruction (core dumped) PSEUDO_UNLOAD=3D1=20
qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfalse -L=20
TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot -E=20
LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/=
recipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.=
12.2/recipe-sysroot/usr/lib=20
"$@" # TODO: Fix with gcc-14

//Hongxu




>   and why does riscv64 not work with existing
> mechanism. if it is new
> then separate that out into a different patch.

I could move riscv64=C2=A0out

//Hongxu

>> BTW, enable riscv64 build
>>
>> [1]https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600=
f7585dc78
>> [2]https://github.com/nodejs/node-gyp
>> [3]https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumenta=
tion.md#cross-compiling
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++--=
--
>>   .../recipes-devtools/nodejs/nodejs_20.16.0.bb | 81 ++++++++++-------
>>   2 files changed, 121 insertions(+), 46 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
>> index cb0237309..bc51f99d8 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
>> @@ -1,21 +1,77 @@
>> -Link mksnapshot with libatomic on x86
>> +From 15e751e4b79475fb34e4b32a3ca54119b20c564a Mon Sep 17 00:00:00 200=
1
>> +From: Hongxu Jia<hongxu.jia@windriver.com>
>> +Date: Sat, 17 Aug 2024 21:33:18 +0800
>> +Subject: [PATCH] link libatomic for clang conditionally
>>
>> -Clang-12 on x86 emits atomic builtins
>> +Clang emits atomic builtin, explicitly link libatomic conditionally:
>> +- For target build, always link -latomic for clang as usual
>> +- For host build, if host and target have same bit width, cross compi=
ling
>> +  is enabled, and host toolchain is gcc which does not link -latomic;
>> +  if host and target have different bit width, no cross compiling,
>> +  host build is the same with target build that requires to link
>> +  -latomic;
>>
>> -Fixes
>> -| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123Execu=
teCompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8C=
ountersEiNS2_19CompileBaselineOnlyE+0x558): un
>> -defined reference to `__atomic_load'
>> +Fix:
>> +|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/R=
elease/node_js2c: error while loading shared libraries: libatomic.so.1: c=
annot open shared object file: No such file or directory
>>
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +Upstream-Status: Inappropriate [OE specific]
>>
>> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> +---
>> + node.gyp                 | 13 ++++++++++++-
>> + tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
>> + 2 files changed, 24 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/node.gyp b/node.gyp
>> +index b425f443..f296f35c 100644
>> +--- a/node.gyp
>> ++++ b/node.gyp
>> +@@ -487,7 +487,18 @@
>> +         ],
>> +       }],
>> +       ['OS =3D=3D "linux" and llvm_version !=3D "0.0"', {
>> +-        'libraries': ['-latomic'],
>> ++        'target_conditions': [
>> ++           ['_toolset=3D=3D"host"', {
>> ++             'conditions': [
>> ++               ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=3D=3D"0"', {
>> ++                 'libraries': ['-latomic'],
>> ++               }],
>> ++             ],
>> ++           }],
>> ++           ['_toolset=3D=3D"target"', {
>> ++             'libraries': ['-latomic'],
>> ++           }],
>> ++        ],
>> +       }],
>> +     ],
>> +   },
>> +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
>> +index b23263cf..dcabf4ca 100644
>>   --- a/tools/v8_gypfiles/v8.gyp
>>   +++ b/tools/v8_gypfiles/v8.gyp
>> -@@ -1436,6 +1436,7 @@
>> -     {
>> -       'target_name': 'mksnapshot',
>> -       'type': 'executable',
>> -+      'libraries': [ '-latomic' ],
>> -       'dependencies': [
>> -         'v8_base_without_compiler',
>> -         'v8_compiler_for_mksnapshot',
>> +@@ -1100,9 +1100,18 @@
>> +         # Platforms that don't have Compare-And-Swap (CAS) support n=
eed to link atomic library
>> +         # to implement atomic memory access
>> +         ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "ri=
scv64", "loong64"]', {
>> +-          'link_settings': {
>> +-            'libraries': ['-latomic', ],
>> +-          },
>> ++          'target_conditions': [
>> ++             ['_toolset=3D=3D"host"', {
>> ++               'conditions': [
>> ++                 ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=3D=3D"0"',=
 {
>> ++                   'libraries': ['-latomic'],
>> ++                 }],
>> ++               ],
>> ++             }],
>> ++             ['_toolset=3D=3D"target"', {
>> ++               'libraries': ['-latomic', ],
>> ++             }],
>> ++           ],
>> +         }],
>> +       ],
>> +     },  # v8_base_without_compiler
>> +--
>> +2.35.5
>> +
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb b/meta-=
oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
>> index fe7121156..34ec8ad80 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
>> @@ -5,17 +5,16 @@ LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3Dcef54676c5=
47a5bbab44aa8be3be9ef7"
>>
>>   CVE_PRODUCT =3D "nodejs node.js"
>>
>> -DEPENDS =3D "openssl file-replacement-native python3-packaging-native=
"
>> +DEPENDS =3D "openssl openssl-native file-replacement-native python3-p=
ackaging-native"
>>   DEPENDS:append:class-target =3D " qemu-native"
>>   DEPENDS:append:class-native =3D " c-ares-native"
>>
>> -inherit pkgconfig python3native qemu ptest
>> +inherit pkgconfig python3native qemu ptest siteinfo
>>
>>   COMPATIBLE_MACHINE:armv4 =3D "(!.*armv4).*"
>>   COMPATIBLE_MACHINE:armv5 =3D "(!.*armv5).*"
>>   COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
>>
>> -COMPATIBLE_HOST:riscv64 =3D "null"
>>   COMPATIBLE_HOST:riscv32 =3D "null"
>>   COMPATIBLE_HOST:powerpc =3D "null"
>>
>> @@ -24,15 +23,12 @@ SRC_URI =3D"http://nodejs.org/dist/v${PV}/node-v${=
PV}.tar.xz \=20
>> file://0004-v8-don-t-override-ARM-CFLAGS.patch \=20
>> file://system-c-ares.patch \=20
>> file://0001-liftoff-Correct-function-signatures.patch \ +=20
>> file://libatomic.patch \ file://run-ptest \ "
>> -
>>   SRC_URI:append:class-target =3D " \
>>              file://0001-Using-native-binaries.patch  \
>>              "
>> -SRC_URI:append:toolchain-clang:x86 =3D " \
>> -file://libatomic.patch  \
>> -           "
>>   SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>>              file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patc=
h  \
>>              "
>> @@ -66,28 +62,14 @@ ARCHFLAGS ?=3D ""
>>
>>   PACKAGECONFIG ??=3D "ares brotli icu zlib"
>>
>> -PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
>> -PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli"
>> -PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
>> +PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares c-ares-native"
>> +PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli brotli-native"
>> +PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu i=
cu-native"
>>   PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>>   PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
>>   PACKAGECONFIG[shared] =3D "--shared"
>>   PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
>>
>> -# We don't want to cross-compile during target compile,
>> -# and we need to use the right flags during host compile,
>> -# too.
>> -EXTRA_OEMAKE =3D "\
>> -    CC.host=3D'${CC} -pie -fPIE' \
>> -    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
>> -    CXX.host=3D'${CXX} -pie -fPIE' \
>> -    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
>> -    LDFLAGS.host=3D'${LDFLAGS}' \
>> -    AR.host=3D'${AR}' \
>> -    \
>> -    builddir_name=3D./ \
>> -"
>> -
>>   EXTRANATIVEPATH +=3D "file-native"
>>
>>   python prune_sources() {
>> @@ -110,9 +92,11 @@ do_unpack[postfuncs] +=3D "prune_sources"
>>   # V8's JIT infrastructure requires binaries such as mksnapshot and
>>   # mkpeephole to be run in the host during the build. However, these
>>   # binaries must have the same bit-width as the target (e.g. a x86_64
>> -# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
>> -# depending on a third Yocto toolchain, we just build those binaries
>> -# for the target and run them on the host with QEMU.
>> +# host targeting ARMv6 needs to produce a 32-bit binary).
>> +# 1. If host and target have the different bit width, run those
>> +#    binaries for the target and run them on the host with QEMU.
>> +# 2. If host and target have the same bit width, enable upstream
>> +#    cross crompile support and no QEMU
>>   python do_create_v8_qemu_wrapper () {
>>       """Creates a small wrapper that invokes QEMU to run some target =
V8 binaries
>>       on the host.""" @@ -120,6 +104,10 @@ python do_create_v8_qemu_wr=
apper () {=20
>> d.expand('${STAGING_DIR_HOST}${base_libdir}')] qemu_cmd =3D=20
>> qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), qemu_libdirs) +=20
>> + if d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "1":
>> +        qemu_cmd =3D ""
>> +
>>       wrapper_path =3D d.expand('${B}/v8-qemu-wrapper.sh')
>>       with open(wrapper_path, 'w') as wrapper_file:
>>           wrapper_file.write("""#!/bin/sh
>> @@ -138,6 +126,14 @@ addtask create_v8_qemu_wrapper after do_configure=
 before do_compile
>>
>>   LDFLAGS:append:x86 =3D " -latomic"
>>
>> +export CC_host
>> +export CFLAGS_host
>> +export CXX_host
>> +export CXXFLAGS_host
>> +export LDFLAGS_host
>> +export AR_host
>> +export HOST_AND_TARGET_SAME_WIDTH
>> +
>>   CROSS_FLAGS =3D "--cross-compiling"
>>   CROSS_FLAGS:class-native =3D "--no-cross-compiling"
>>
>> @@ -179,8 +175,31 @@ RDEPENDS:${PN}-npm =3D "bash python3-core python3=
-shell python3-datetime \
>>   PACKAGES =3D+ "${PN}-systemtap"
>>   FILES:${PN}-systemtap =3D "${datadir}/systemtap"
>>
>> -BBCLASSEXTEND =3D "native"
>> +python __anonymous () {
>> +    # 32 bit target and 64 bit host (x86-64 or aarch64) have differen=
t bit width
>> +    if d.getVar("SITEINFO_BITS") =3D=3D "32" and "64" in d.getVar("BU=
ILD_ARCH"):
>> +        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
>> +    else:
>> +        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
>> +
>> +    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "0":
>> +        # We don't want to cross-compile during target compile,
>> +        # and we need to use the right flags during host compile,
>> +        # too.
>> +        d.setVar("CC_host", d.getVar("CC") + " -pie -fPIE")
>> +        d.setVar("CFLAGS_host", d.getVar("CFLAGS"))
>> +        d.setVar("CXX_host", d.getVar("CXX") + " -pie -fPIE")
>> +        d.setVar("CXXFLAGS_host", d.getVar("CXXFLAGS"))
>> +        d.setVar("LDFLAGS_host", d.getVar("LDFLAGS"))
>> +        d.setVar("AR_host", d.getVar("AR"))
>> +    elif d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "1":
>> +        # Enable upstream cross crompile support
>> +        d.setVar("CC_host", d.getVar("BUILD_CC"))
>> +        d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
>> +        d.setVar("CXX_host", d.getVar("BUILD_CXX"))
>> +        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS"))
>> +        d.setVar("LDFLAGS_host", d.getVar("BUILD_LDFLAGS"))
>> +        d.setVar("AR_host", d.getVar("BUILD_AR"))
>> +}
>>
>> -#http://errors.yoctoproject.org/Errors/Details/766923/
>> -# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.=
2/out/Release/v8-qemu-wrapper.sh: line 7: 252447 Illegal instruction     =
(core dumped) PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=3D=
false -L TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sy=
sroot -E LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs=
/20.12.2/recipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/n=
odejs/20.12.2/recipe-sysroot/usr/lib "$@"
>> -# TODO: Fix with gcc-14
>> +BBCLASSEXTEND =3D "native"
>> --
>> 2.27.0
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111853):https://lists.openembedded.org/g/openembed=
ded-devel/message/111853
>> Mute This Topic:https://lists.openembedded.org/mt/107974157/3617049
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [hongxu.jia@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--------------Mpazoz5Vb9ueGwQEBCebmBlK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47L38hAW014424

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 8/20/24 00:05, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1iVa=
hdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM hongxu via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hongxu.jia=3Deng.windri=
ver.com@lists.openembedded.org">&lt;hongxu.jia=3Deng.windriver.com@lists.=
openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Due to the scope of supported BSPs by qemu-user is limited, such
as a segment fault on armv9 after qemu apply commit [target/arm:
Convert LDAPR/STLR (imm) to decodetree][1]
```
|tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.1/ou=
t/
Release/v8-qemu-wrapper.sh: line 7: 3179613 Segmentation fault      (core=
 dumped)
PSEUDO_UNLOAD=3D1 qemu-aarch64 -r 5.15 -L tmp-glibc/work/neoversen2-crypt=
o-wrs-linux/
nodejs/20.5.1/recipe-sysroot -E LD_LIBRARY_PATH=3Dtmp-glibc/work/neoverse=
n2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot/usr/lib64:tmp-glibc/work/neoversen2-crypto-w=
rs-linux/
nodejs/20.5.1/recipe-sysroot/usr/lib64 &quot;$@&quot;
```

Upstream nodejs have cross compile support, but it needs host and target
have same bit width (e.g. a x86_64 host targeting arrch64 to produce a
64-bit binary). So:
1. If host and target have different bit width, build with QEMU user as u=
sual;

2. If host and target have same bit width, enable notejs cross compile su=
pport:
- The build tools of nodejs is GYP[2], set CC_host, CFLAGS_host,
  CXX_host, CXXFLAGS_host, LDFLAGS_host, AR_host for host build
  which is separated with target build [3]
- Add missing native packages to fix library missing on host build
- Rework libatomic.patch, explicitly link to libatomic for clang
  conditionally
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Does this mean that upstream has stopped supporting 32bit hosts ?</pre>
    </blockquote>
    <p>The nodejs does not support to build 32bit target on 64 bit host
      for cross compiling.</p>
    <p>but the normally non-cross compiling, the 32bit build still
      supported by nodejs.</p>
    <p>For GYP, while enabling cross compile, it simple duplicates
      sources as host and target,</p>
    <p>so the bit specific source could not work if host and target have
      different bits<br>
    </p>
    <p>Ideally, nodejs should split bit source conditionally along with
      arch test<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1iVa=
hdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
if so, than I would follow the suite and disable building for 32bit machi=
nes
nodejs build in OE is quite unwieldy and this just makes it a bit
more. Is there a way
to improve qemu-user ?</pre>
    </blockquote>
    <p>For qemu-user solution, it is just a workaround for cross
      compiling, and force the build depends on qemu</p>
    <p>which made the maintainer of nodejs become a qemu expert.<br>
    </p>
    <p>For the <span style=3D"white-space: pre-wrap">segment fault on arm=
v9, although I found the issue was caused by the commit via git bisect</s=
pan></p>
    <pre class=3D"moz-quote-pre" wrap=3D""><a class=3D"moz-txt-link-freet=
ext" href=3D"https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941=
d4f9600f7585dc7">https://github.com/qemu/qemu/commit/2521b6073b7b4b505533=
a941d4f9600f7585dc7</a>
</pre>
    <p></p>
    <p><span style=3D"white-space: pre-wrap">But it is hard to debug and =
fix it. The qemu rework it, no minor change</span></p>
    <p><span style=3D"white-space: pre-wrap">Another similar issue is </s=
pan><span style=3D"white-space: pre-wrap"><a class=3D"moz-txt-link-freete=
xt" href=3D"http://errors.yoctoproject.org/Errors/Details/766923/">http:/=
/errors.yoctoproject.org/Errors/Details/766923/</a></span></p>
    <p><span style=3D"white-space: pre-wrap">Although I do not met the is=
sue on my build, but we may have similar issue on other BSPs
</span></p>
    <p><span style=3D"white-space: pre-wrap"># <a class=3D"moz-txt-link-f=
reetext" href=3D"http://errors.yoctoproject.org/Errors/Details/766923/">h=
ttp://errors.yoctoproject.org/Errors/Details/766923/</a>
# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/ou=
t/Release/v8-qemu-wrapper.sh: line 7: 252447 Illegal instruction     (cor=
e dumped) PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfals=
e -L TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroo=
t -E LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.=
12.2/recipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodej=
s/20.12.2/recipe-sysroot/usr/lib &quot;$@&quot;
# TODO: Fix with gcc-14</span></p>
    <p><span style=3D"white-space: pre-wrap">//Hongxu
</span></p>
    <pre class=3D"moz-quote-pre" wrap=3D"">



</pre>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1iVa=
hdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D""> and why does riscv64 not wo=
rk with existing
mechanism. if it is new
then separate that out into a different patch.
</pre>
    </blockquote>
    <p>I could move <span style=3D"white-space: pre-wrap">riscv64</span>&=
nbsp;out
      <br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1iVa=
hdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
BTW, enable riscv64 build

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/qemu/qe=
mu/commit/2521b6073b7b4b505533a941d4f9600f7585dc78">https://github.com/qe=
mu/qemu/commit/2521b6073b7b4b505533a941d4f9600f7585dc78</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/=
node-gyp">https://github.com/nodejs/node-gyp</a>
[3] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/=
node-gyp/blob/main/gyp/docs/UserDocumentation.md#cross-compiling">https:/=
/github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumentation.md#cross=
-compiling</a>

Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++----
 .../recipes-devtools/nodejs/nodejs_20.16.0.bb | 81 ++++++++++-------
 2 files changed, 121 insertions(+), 46 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/met=
a-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index cb0237309..bc51f99d8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -1,21 +1,77 @@
-Link mksnapshot with libatomic on x86
+From 15e751e4b79475fb34e4b32a3ca54119b20c564a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hongx=
u.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Date: Sat, 17 Aug 2024 21:33:18 +0800
+Subject: [PATCH] link libatomic for clang conditionally

-Clang-12 on x86 emits atomic builtins
+Clang emits atomic builtin, explicitly link libatomic conditionally:
+- For target build, always link -latomic for clang as usual
+- For host build, if host and target have same bit width, cross compilin=
g
+  is enabled, and host toolchain is gcc which does not link -latomic;
+  if host and target have different bit width, no cross compiling,
+  host build is the same with target build that requires to link
+  -latomic;

-Fixes
-| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123ExecuteC=
ompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8Coun=
tersEiNS2_19CompileBaselineOnlyE+0x558): un
-defined reference to `__atomic_load'
+Fix:
+|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/Rele=
ase/node_js2c: error while loading shared libraries: libatomic.so.1: cann=
ot open shared object file: No such file or directory

-Upstream-Status: Pending
-Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Upstream-Status: Inappropriate [OE specific]

+Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+---
+ node.gyp                 | 13 ++++++++++++-
+ tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/node.gyp b/node.gyp
+index b425f443..f296f35c 100644
+--- a/node.gyp
++++ b/node.gyp
+@@ -487,7 +487,18 @@
+         ],
+       }],
+       ['OS =3D=3D &quot;linux&quot; and llvm_version !=3D &quot;0.0&quo=
t;', {
+-        'libraries': ['-latomic'],
++        'target_conditions': [
++           ['_toolset=3D=3D&quot;host&quot;', {
++             'conditions': [
++               ['&quot;&lt;!(echo $HOST_AND_TARGET_SAME_WIDTH)&quot;=3D=
=3D&quot;0&quot;', {
++                 'libraries': ['-latomic'],
++               }],
++             ],
++           }],
++           ['_toolset=3D=3D&quot;target&quot;', {
++             'libraries': ['-latomic'],
++           }],
++        ],
+       }],
+     ],
+   },
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index b23263cf..dcabf4ca 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -1436,6 +1436,7 @@
-     {
-       'target_name': 'mksnapshot',
-       'type': 'executable',
-+      'libraries': [ '-latomic' ],
-       'dependencies': [
-         'v8_base_without_compiler',
-         'v8_compiler_for_mksnapshot',
+@@ -1100,9 +1100,18 @@
+         # Platforms that don't have Compare-And-Swap (CAS) support need=
 to link atomic library
+         # to implement atomic memory access
+         ['v8_current_cpu in [&quot;mips64&quot;, &quot;mips64el&quot;, =
&quot;ppc&quot;, &quot;arm&quot;, &quot;riscv64&quot;, &quot;loong64&quot=
;]', {
+-          'link_settings': {
+-            'libraries': ['-latomic', ],
+-          },
++          'target_conditions': [
++             ['_toolset=3D=3D&quot;host&quot;', {
++               'conditions': [
++                 ['&quot;&lt;!(echo $HOST_AND_TARGET_SAME_WIDTH)&quot;=3D=
=3D&quot;0&quot;', {
++                   'libraries': ['-latomic'],
++                 }],
++               ],
++             }],
++             ['_toolset=3D=3D&quot;target&quot;', {
++               'libraries': ['-latomic', ],
++             }],
++           ],
+         }],
+       ],
+     },  # v8_base_without_compiler
+--
+2.35.5
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.16.0.bb
index fe7121156..34ec8ad80 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
@@ -5,17 +5,16 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"file://LICENSE;md5=3Dcef54676c547a5bbab44aa8be3be9ef7">&quot;fil=
e://LICENSE;md5=3Dcef54676c547a5bbab44aa8be3be9ef7&quot;</a>

 CVE_PRODUCT =3D &quot;nodejs node.js&quot;

-DEPENDS =3D &quot;openssl file-replacement-native python3-packaging-nati=
ve&quot;
+DEPENDS =3D &quot;openssl openssl-native file-replacement-native python3=
-packaging-native&quot;
 DEPENDS:append:class-target =3D &quot; qemu-native&quot;
 DEPENDS:append:class-native =3D &quot; c-ares-native&quot;

-inherit pkgconfig python3native qemu ptest
+inherit pkgconfig python3native qemu ptest siteinfo

 COMPATIBLE_MACHINE:armv4 =3D &quot;(!.*armv4).*&quot;
 COMPATIBLE_MACHINE:armv5 =3D &quot;(!.*armv5).*&quot;
 COMPATIBLE_MACHINE:mips64 =3D &quot;(!.*mips64).*&quot;

-COMPATIBLE_HOST:riscv64 =3D &quot;null&quot;
 COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;
 COMPATIBLE_HOST:powerpc =3D &quot;null&quot;

@@ -24,15 +23,12 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz\file://0004-v8-don-t-ov=
erride-ARM-CFLAGS.patch\file://system-c-ares.patch\file://0001-liftoff-Co=
rrect-function-signatures.patch\+file://libatomic.patch\file://run-ptest\=
">&quot;http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
+           file://libatomic.patch \
            file://run-ptest \
            &quot;</a>
-
 SRC_URI:append:class-target =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Using-=
native-binaries.patch">file://0001-Using-native-binaries.patch</a> \
            &quot;
-SRC_URI:append:toolchain-clang:x86 =3D &quot; \
-           <a class=3D"moz-txt-link-freetext" href=3D"file://libatomic.p=
atch">file://libatomic.patch</a> \
-           &quot;
 SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-ppc64-=
Do-not-use-mminimal-toc-with-clang.patch">file://0001-ppc64-Do-not-use-mm=
inimal-toc-with-clang.patch</a> \
            &quot;
@@ -66,28 +62,14 @@ ARCHFLAGS ?=3D &quot;&quot;

 PACKAGECONFIG ??=3D &quot;ares brotli icu zlib&quot;

-PACKAGECONFIG[ares] =3D &quot;--shared-cares,,c-ares&quot;
-PACKAGECONFIG[brotli] =3D &quot;--shared-brotli,,brotli&quot;
-PACKAGECONFIG[icu] =3D &quot;--with-intl=3Dsystem-icu,--without-intl,icu=
&quot;
+PACKAGECONFIG[ares] =3D &quot;--shared-cares,,c-ares c-ares-native&quot;
+PACKAGECONFIG[brotli] =3D &quot;--shared-brotli,,brotli brotli-native&qu=
ot;
+PACKAGECONFIG[icu] =3D &quot;--with-intl=3Dsystem-icu,--without-intl,icu=
 icu-native&quot;
 PACKAGECONFIG[libuv] =3D &quot;--shared-libuv,,libuv&quot;
 PACKAGECONFIG[nghttp2] =3D &quot;--shared-nghttp2,,nghttp2&quot;
 PACKAGECONFIG[shared] =3D &quot;--shared&quot;
 PACKAGECONFIG[zlib] =3D &quot;--shared-zlib,,zlib&quot;

-# We don't want to cross-compile during target compile,
-# and we need to use the right flags during host compile,
-# too.
-EXTRA_OEMAKE =3D &quot;\
-    CC.host=3D'${CC} -pie -fPIE' \
-    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
-    CXX.host=3D'${CXX} -pie -fPIE' \
-    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
-    LDFLAGS.host=3D'${LDFLAGS}' \
-    AR.host=3D'${AR}' \
-    \
-    builddir_name=3D./ \
-&quot;
-
 EXTRANATIVEPATH +=3D &quot;file-native&quot;

 python prune_sources() {
@@ -110,9 +92,11 @@ do_unpack[postfuncs] +=3D &quot;prune_sources&quot;
 # V8's JIT infrastructure requires binaries such as mksnapshot and
 # mkpeephole to be run in the host during the build. However, these
 # binaries must have the same bit-width as the target (e.g. a x86_64
-# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
-# depending on a third Yocto toolchain, we just build those binaries
-# for the target and run them on the host with QEMU.
+# host targeting ARMv6 needs to produce a 32-bit binary).
+# 1. If host and target have the different bit width, run those
+#    binaries for the target and run them on the host with QEMU.
+# 2. If host and target have the same bit width, enable upstream
+#    cross crompile support and no QEMU
 python do_create_v8_qemu_wrapper () {
     &quot;&quot;&quot;Creates a small wrapper that invokes QEMU to run s=
ome target V8 binaries
     on the host.&quot;&quot;<a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:@@-120,6+104,10@@pythondo_create_v8_qemu_wrapper(){d.expand('${STAG=
ING_DIR_HOST}${base_libdir}')]qemu_cmd=3Dqemu_wrapper_cmdline(d,d.getVar(=
'STAGING_DIR_HOST'),qemu_libdirs)++ifd.getVar(">&quot;
@@ -120,6 +104,10 @@ python do_create_v8_qemu_wrapper () {
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
     qemu_cmd =3D qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
                                     qemu_libdirs)
+
+    if d.getVar(&quot;</a>HOST_AND_TARGET_SAME_WIDTH&quot;) =3D=3D &quot=
;1&quot;:
+        qemu_cmd =3D &quot;&quot;
+
     wrapper_path =3D d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
         wrapper_file.write(&quot;&quot;&quot;#!/bin/sh
@@ -138,6 +126,14 @@ addtask create_v8_qemu_wrapper after do_configure be=
fore do_compile

 LDFLAGS:append:x86 =3D &quot; -latomic&quot;

+export CC_host
+export CFLAGS_host
+export CXX_host
+export CXXFLAGS_host
+export LDFLAGS_host
+export AR_host
+export HOST_AND_TARGET_SAME_WIDTH
+
 CROSS_FLAGS =3D &quot;--cross-compiling&quot;
 CROSS_FLAGS:class-native =3D &quot;--no-cross-compiling&quot;

@@ -179,8 +175,31 @@ RDEPENDS:${PN}-npm =3D &quot;bash python3-core pytho=
n3-shell python3-datetime \
 PACKAGES =3D+ &quot;${PN}-systemtap&quot;
 FILES:${PN}-systemtap =3D &quot;${datadir}/systemtap&quot;

-BBCLASSEXTEND =3D &quot;native&quot;
+python __anonymous () {
+    # 32 bit target and 64 bit host (x86-64 or aarch64) have different b=
it width
+    if d.getVar(&quot;SITEINFO_BITS&quot;) =3D=3D &quot;32&quot; and &qu=
ot;64&quot; in d.getVar(&quot;BUILD_ARCH&quot;):
+        d.setVar(&quot;HOST_AND_TARGET_SAME_WIDTH&quot;, &quot;0&quot;)
+    else:
+        d.setVar(&quot;HOST_AND_TARGET_SAME_WIDTH&quot;, &quot;1&quot;)
+
+    if d.getVar(&quot;HOST_AND_TARGET_SAME_WIDTH&quot;) =3D=3D &quot;0&q=
uot;:
+        # We don't want to cross-compile during target compile,
+        # and we need to use the right flags during host compile,
+        # too.
+        d.setVar(&quot;CC_host&quot;, d.getVar(&quot;CC&quot;) + &quot; =
-pie -fPIE&quot;)
+        d.setVar(&quot;CFLAGS_host&quot;, d.getVar(&quot;CFLAGS&quot;))
+        d.setVar(&quot;CXX_host&quot;, d.getVar(&quot;CXX&quot;) + &quot=
; -pie -fPIE&quot;)
+        d.setVar(&quot;CXXFLAGS_host&quot;, d.getVar(&quot;CXXFLAGS&quot=
;))
+        d.setVar(&quot;LDFLAGS_host&quot;, d.getVar(&quot;LDFLAGS&quot;)=
)
+        d.setVar(&quot;AR_host&quot;, d.getVar(&quot;AR&quot;))
+    elif d.getVar(&quot;HOST_AND_TARGET_SAME_WIDTH&quot;) =3D=3D &quot;1=
&quot;:
+        # Enable upstream cross crompile support
+        d.setVar(&quot;CC_host&quot;, d.getVar(&quot;BUILD_CC&quot;))
+        d.setVar(&quot;CFLAGS_host&quot;, d.getVar(&quot;BUILD_CFLAGS&qu=
ot;))
+        d.setVar(&quot;CXX_host&quot;, d.getVar(&quot;BUILD_CXX&quot;))
+        d.setVar(&quot;CXXFLAGS_host&quot;, d.getVar(&quot;BUILD_CXXFLAG=
S&quot;))
+        d.setVar(&quot;LDFLAGS_host&quot;, d.getVar(&quot;BUILD_LDFLAGS&=
quot;))
+        d.setVar(&quot;AR_host&quot;, d.getVar(&quot;BUILD_AR&quot;))
+}

-# <a class=3D"moz-txt-link-freetext" href=3D"http://errors.yoctoproject.=
org/Errors/Details/766923/">http://errors.yoctoproject.org/Errors/Details=
/766923/</a>
-# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/o=
ut/Release/v8-qemu-wrapper.sh: line 7: 252447 Illegal instruction     (co=
re dumped) PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfal=
se -L TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysro=
ot -E LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20=
.12.2/recipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/node=
js/20.12.2/recipe-sysroot/usr/lib &quot;$@&quot;
-# TODO: Fix with gcc-14
+BBCLASSEXTEND =3D &quot;native&quot;
--
2.27.0




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111853): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/111853">https:=
//lists.openembedded.org/g/openembedded-devel/message/111853</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107974157/3617049">https://lists.openembedded.org/mt=
/107974157/3617049</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a=
>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Mpazoz5Vb9ueGwQEBCebmBlK--


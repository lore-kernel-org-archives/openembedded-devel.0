Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1283A103E2FD
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 01:49:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12583.1773280143264458017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 18:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=metrb5Qe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75313bcc0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C01UMs2488706
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 01:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=GVs8G+rAkhBc8OUOc6eUxdKH6bEWrSrcnawMdPx1lJY=; b=metrb5QeEX8y
	KQzdFGzSWuCVIWLtLJtfAepK+xcg235txXagonzFI6F5HXXLbKM03V6Q38VgGJLW
	IxM9gl8a1l67rewEyJ0gzrPFn6vHlNOof/aP7mNJHyIAQ+sOdJ0lTQqwngGM20qj
	GXFR1Td2/If1mgeyrweXb/93Z5ZbEg4JeAXMm+qFnMRLbEtUb1xs8m+/kvTAWSKv
	fPdjXeQwhTodNzHN4pRmy7NGkcxX8tr7iSBblcy+lCqLattzZhONi634xU6+wu26
	oQE8Xjv6/Rmv2z9lobCI1eRCTHdYvvaQdM0OkMz/xAEenugU2bPGXr9rk0y8M4dg
	lYS+syJF/g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78g4dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 01:49:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVZDAHab64BqBSISL4nyGxKCFM1uvLWYwstZQ2Z9wweoVVCtrQp9C4gpWhjJ64X323wVXhw1Fu5UdlTTYIiWicaLAvVc3MFAqzTYsccZxyWceqwhhpOuq5gexPOyD6JqDWq78w0SBU3F8QmDKlRXxfXUmND4fD4dB6nERgqDW+u8FutehkhZLerO5b6hqK6rxRSpKniRUizpINUSDp8gMbd9K8QtsQU4utSF3iGvfVkKIo17VKjT6Hldx8bKUW9KavT+ZFRKx+mzdCq5H4o6BrIgqLkwRvFK08g21zX9IgT+tTh3LwGmtbCH20oz5f5mk4pK64IKNekPtw9rg//S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVs8G+rAkhBc8OUOc6eUxdKH6bEWrSrcnawMdPx1lJY=;
 b=ji3ASJvhzhQx50AgC3qlR7graxgOiUf/wuoblBAmuNepV8tdxGR/WLljgvXiqgXxtKyqOG9jlKQiZXBsUg+Fy8WHi75MGRlGuoEh8Mq/9iaiFD04DMBKL/oUhdDfh4cL34aKF2z38y3g0+4CR1YThGZN7oqB31eR+nro3bU70RrQ8ioOZQD8RpyVFp8SLKjhFns710Pyp7NpYLaaWGXjWjbV5mP8X8x26mFiXHTwLF6Nwe2U51rXx8Sarrbk6kDD1dIJk7jXJeU+aAJSmG67mpkCDfUUWAn6tteGrS5t2qW5yE4QHo3ZAWuoHO9tMqTX7SEkBrZNtMLvuD5lc/hZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Thu, 12 Mar
 2026 01:48:57 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 01:48:57 +0000
Message-ID: <43345c2a-ac53-4fee-ba13-d5232d596b2c@windriver.com>
Date: Thu, 12 Mar 2026 09:48:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH V2] libssh: upgrade 0.11.3 -> 0.11.4
To: gijs.peskens@munisense.com, openembedded-devel@lists.openembedded.org
References: <20260311082153.258506-2-gijs.peskens@munisense.com>
 <20260311091051.262976-1-gijs.peskens@munisense.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20260311091051.262976-1-gijs.peskens@munisense.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 7511effe-ac13-47a6-ea1c-08de7fd98620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bOYNK/zkEKRtCBUqIU3QR2LfWntqMtF3qCS2g/XXqI1uPzzLU6uu8m8Vjt22pCSz0UADlw4Zfme4IOB7q5Rsmi1YmMKFzDsKTGFXdAe356WuPzsa3HSFW57fvv92NR7eO9O8xidXiJic9gFgvh4dqT/O5XID2/ZPDbU3lTTUbadbOUd202cVQWrHQ9Ym/HexRhWTEuBq9io5C3yfMjOr0gaeoh1Q4R8RhFtdeP3g1/n3dwhCWhi31RLIxD48OdESbIR8MiUNx0qARiyWSDP9OfY2GG/VKLczqc8V4qbippTahjEym4zLflu2wh6VL0166SjCJ9YnEaV86p9eEwrh8Dgz8rTr/M0dBsoyh9S6YRL6s2RI2LxuZTdo95ytV8i40VZ0tcw42kFJdkMuSnD8UHsDRR1XnmBGet1uWi3PZtIndTy9zJnIHmvubqCVWDCihOxPMy4zLAEy26O+wlZ0O38+BkRAQ2rHXLwIJF5OGuHeHAJlAhtSPiZ2FuoEEIjxTfdOdESjR/0LX/GFcEewyONbBwOHOXYPuTS4g32iDc+wnqWt2lXDlsvY4rrlrSGHBX+ZV/q4Nxw2Vgl3YC1somOIoJld/fg0t4mDjOlfbXfwRgxM3aAFBcEop16rPX5GgzzvYiYnD8XxlIxZYlmTBxUzTMcPXDcQ5TNbfOkMykZ55jXFEnJZmUcKE5XhDQud
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXdWQmYrTWsrV3ZQS1NSWmdER1NpSHhFeEpxTk9tdWRqMHVOcGd4bXN6ZHFi?=
 =?utf-8?B?YzBESGZ1b3ZrSWpkcm40UHJwVDdFUklwS0lvMyt0SkFJVTAzQ0F2Z2M2eEEz?=
 =?utf-8?B?ak5jSldHeXZzMktYSHRaVU1VQ3JvZTQ4Qmx4L1ZaUGVlZjRaV1hyS0w0Vk13?=
 =?utf-8?B?Q1plQ0pOMXJWUDhOSjJ3WkFjMnJGci9CRnlKVWh5VkRibXZvNm10cXRWMWNQ?=
 =?utf-8?B?aEFMbUdnSkEzcUlSWHh6N2ZyNW9sNGxueTkwNFJaYlVMV3VzMGtnZWdLRnls?=
 =?utf-8?B?dVk1TTUzT3NsZ3ZPazB6OHFLeFdkUzByUXJuTDBPbGxFVjIwNUd0S1g0dHpE?=
 =?utf-8?B?bXM1NEhrU29NTmhjTFVJa2ViVzcxQ1h0QXJGVGhwbEVmVGdvN3hSNFlPZlFm?=
 =?utf-8?B?YzB5L0pkUHo2UE1FVitqNElxaTg0eFlaNnlRNEhycE4rblV4eHZwWFpKanZ6?=
 =?utf-8?B?OHBsSis4WlFPOTdES0lRSUh4R2xsYVJ4NHc3YlRNMm5WK1FyOFFTWmpxZG5D?=
 =?utf-8?B?VG9SU09wcnJvNUZZRGs5UU0wZzNRVUFZOCt3dmhENXFVNkhUb01wUTlJRzBB?=
 =?utf-8?B?V3dSQ1pWYVhiNjlRLy9GL0w3RnllM0syNU95NSsxK3JuakRYYmJaZWFKVDV5?=
 =?utf-8?B?WnRQTTRhYXM0aGxNclB1WU8rTXRZcHMrRzE3L2pzd3hNNGoydXpzdmpNeWRE?=
 =?utf-8?B?ODlRalRCN1VpSW5nWDViS0djNUJSTlluWGdFUTVNUjhVZGF3eW9qcGxVRHYv?=
 =?utf-8?B?NE8zQkFNNUlpM2VZL201Y2s0NEZNRlhXYjVYM0FMdjhnZ2JVNGpiK0g1Q0I1?=
 =?utf-8?B?b24yNmxBVzFIWWNQcjA1MUFQQlczQUJ2cmVlOCtTQnNreEt0MVVpSzM0Zk9T?=
 =?utf-8?B?OWZIM2p1TGl4VVpUVW5qV0RTSmF2SmZYUE1YUVRiSjJPK0NIaTlZZVpuUTUr?=
 =?utf-8?B?TGl5ZDBkNXhuSWh4bFVhVzZSTnNhOWQ5a3k4K3BucHBUQ0NibEZDVEpMMDRE?=
 =?utf-8?B?VFdSek1haUtxV3dqeFhFLzFOdVhudmRxcmd3TTJsd0pFcnFRbDArQ3dsUE9R?=
 =?utf-8?B?OWpuZlpCaVIvdkJKYk14Ny9nVmM3a083RWFxR1hVbWFjaHNJM1RwbVRRR01D?=
 =?utf-8?B?ME1LeWNnbUdqSkRzWXRFSW9yOUEyT3UvZTIvb1Z5Y2NZOGsrQkFHVFNqVWE4?=
 =?utf-8?B?aHpDeSsrWDBEQ21wRVlRdXpLUUV6TGRKM05EK1Z2UHZMbUdVeHhGemR1VWNV?=
 =?utf-8?B?OHpodHhFRUtqZnRwdE1UdFJ2ZUtvS1dENEpUV1BtaEpDdG5rZGFpeUd3dmNm?=
 =?utf-8?B?bG9pT3BwbE5tZmw1RGJmOWNIUG9HeHBCcjNZcFIwM2NRSGNSeVc4emwzUStZ?=
 =?utf-8?B?cTQ3U0FJeWdYd0t6akxuVnIyaHlVNjNoWHNGN3FiOURKa3NDU3ArV2VVZGtj?=
 =?utf-8?B?R29LeHM0THZDMWM3aGhTakpBWEw5SUtOWGhGa0UyZW5QUHV1THloYURCVUda?=
 =?utf-8?B?NllndVRHSlE2ZThBcGlmbm1uMkdEUGVwQ1drSG1xVEZDcnhrSkxyWDl6dHl6?=
 =?utf-8?B?cmtzSWRQaUpkOXlZOXRjL1pvaGMxdjBUc3l0NFFxemZUMEdES2FOUytxNENC?=
 =?utf-8?B?SDdUeFZMQmFUdHZNSUJ5NDRSSGg2djV4ZjcrVDBMTTNkSnA2Y3lnZTQrWTlL?=
 =?utf-8?B?c1IxTWlRc25sUU9HNlhhNFhRY0VnSldrU1FhNkh0L2FKMmthZitmQzZ5d09u?=
 =?utf-8?B?U3IwVHBhamFSS0NKQnpLZGxVdklOb01Xc2FMb3hGVHBKK3ZSUUZpc2xZamNK?=
 =?utf-8?B?WEg2V3Z6Wlh1S1dYRzVtbWppMlFJRE9pbUFjT1d2VlpaakFDMUVsTVZJVXVz?=
 =?utf-8?B?Qlc1RVExWHEzaE9KbCtEREtIY0ljT1l6czdZdUFCckZiZTg0N1FBcVVmcjJN?=
 =?utf-8?B?cFZXdXhldFYzUlQ2WTMxT29TM3MwamJOSFNtRm5OTEN6MEw3SmJDOGxoeGJl?=
 =?utf-8?B?Q0FHTjFRVCs1N2F4a1hpYnRxT3RjZ055eUwzUCtUSTI1SUhTeXJxd2pwWG41?=
 =?utf-8?B?MWhRNTFpcjRGK0plcXJXZ1pIdmpHTXJoSkFVNnR2M1hNT2lENnp6cWVXRzBi?=
 =?utf-8?B?L1BQK2ZiS1MxM2JLTFNkb2Q3T1RmcU05SDNOeWhnTUNYQU43ck1YTThMa3dX?=
 =?utf-8?B?Q2pkWGo4bnVrUnppRGc5bE1MbjZqNnFKVkI2VHlia2h3M2NPcHBVaHVIYjBi?=
 =?utf-8?B?V1MyVEkyNnBlSGJBbzgvSkZZd1hHeHZUOER3U2ZSVFhTZ2c3QTRTaVVyL2Vh?=
 =?utf-8?B?VnNqcWc2dHYwZTluQ0dGRG9WZ253cUphcmZNOGR1ZVorQklqaUxSZz09?=
X-Exchange-RoutingPolicyChecked: 
	RC0oYgIxLvTgc4AylZUXZVnLm8wF4+qs+ek+FvMEZOgXjd6ZNYv0W1UZp4+ooC1EjC+zR4tlOSfashNHOC/XlIKUNc8ytLO5CBBmAR6EegEygHQKAeUdD2H17pFCozs/ESZi5sVfM805orNJKcnFEsw6yVkLfCD+wszxbVe9Pgx6EfLNQd35HNfPnQINicx+hKXByOTptBod77MUteSLZF9doGUYukgapat+dzqtDT39eu1ZokXx2FxRAmsLgMh0/Ap15QyP4x6X8OtU6RjjdGU0JYqOt1k9tihqRtSpREYHFMmgUP+3Es6tU+xgy7KY//wc0xbHrMHAJE7vHuKfcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7511effe-ac13-47a6-ea1c-08de7fd98620
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 01:48:57.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzxH+/JOEiDfqeNmiRdfLQIFtDwwZg+QOGMpLRBU9okS5WhuxIgT/Oxls0Tx/ZwQorx9jJjRVHKjAs7ySQ2P1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b21b8e cx=c_pps
 a=mU5w9pKRZvfSuQy63jiYzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Q4-j1AaZAAAA:8 a=D4FRcbXYAAAA:8 a=nar8ntqeAAAA:8 a=t7CeM3EgAAAA:8
 a=i41DmhJZssHxdSeRrIUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=iiWfIM-muJKaQ-WMpyLy:22 a=RptMqvEBejqe73AKBt4K:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxMyBTYWx0ZWRfX3TI3g3HR3kfv
 qopy6xfSxlKZk/vXt9v0hiXB2PC2wjvCRwFxJccYY/wnUAlCHw5Jc+OSHYhO5a5vcluxmMi9vcN
 cUKV5F/CXBtOQu5abW97XKO4SlKBsKT56YHRtTlSARYl3uCILlO9ZZJviAVplo5yZTfJjrGYp9M
 nI/udtrIy7rUrWs1fjJ/X5mdJeo8f3TdLwi6kqSlLttO/7sOZiHW4SONXMQhw7How1n27eRrbxC
 dQnqATY5L2MbRWkcjVQdtXaHS25lqU8MvkMlmDQlYXWlI0hlClM+Be9AHKAQaNnW0VeokX7HUjv
 6+DHRxBDJEMdKnIEKla4SQ88pdxamree3mqMr2O8yZ9hZit1mo7i6FAxu/kKG7SLL47JBSpp+vr
 33ELcR92pLg+tQ+Rs/QpJgZTq0C2UAiKDBvIA6bn4qH5xz2H6WXp3h5fXCoI1d6IgUl7TnS8qfM
 +Njcmbma8eR/Oa7WQrw==
X-Proofpoint-ORIG-GUID: v5yt4m_uasucTAV_PsxGNiCNjOqgRfqE
X-Proofpoint-GUID: qRz7i21FX0_6ogzr2MjuQxDVlrRcFtHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 01:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125095

The libssh 0.12.0 is also released. Do we need to move to 0.12.0? I will 
send another patch to follow up.

Thanks,

On 3/11/26 17:10, Gijs Peskens via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> Signed-off-by: Gijs Peskens <gijs.peskens@munisense.com>
> ---
>   .../libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb}               | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb} (97%)
> 
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> similarity index 97%
> rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> index 5928581312..fb131c3490 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> @@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
> 
>   SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
> 
> -SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
> +SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
> 
> 
>   inherit cmake ptest
> --
> 2.43.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125074): https://lists.openembedded.org/g/openembedded-devel/message/125074
> Mute This Topic: https://lists.openembedded.org/mt/118256967/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



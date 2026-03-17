Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8311CF3381F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:18:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71872.1773739132741447367
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Zc4jqOw1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7536a35c2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H567XL523385
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+7Ico3Mr2DsE6KuuSCEovJurYxohGuuNnPwp9ZmLGPI=; b=Zc4jqOw10G1/
	Ufn11BHgmr75BfYPO9qHdz/+T8KZHZLkf3dB9W42WKqfpsTehmzB37nEdb6DdGCE
	MxFAQhkEbqqb70tqLcp93rkQesrU+cX5pxgJALwXy8cmRuH9nD6dsdm18HP2xwD+
	rdkvrroM2O+967JWQ2eNm6MpxiJLdEnr+9gZe4evemIBFn9hF9dFEgShhMcI8X3s
	Z0qf7+iFt1+QJYxIGVRhiwt7HR2esigCDxBGqqM6wLU+jJZjb/f/HcmWg/tv1TAv
	VjH1I8BvpWZrPj8EbO/ULS6yXZB9ZKGPnmVCKP19npBwH4h64LanIlLpYlKDdgX4
	UD/X9kt4Hw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyk6w2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 09:18:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdXm6x5X0nggpX4zGWlz++fNuXcds8pmbOuzT0Qm2oSCAQZvn2b2ey6KPXG3PFo2AWhmauAhtrysdozZ6qalTMmEBhpH89NVdIrSjieGAOw9qW5VnUru+Fm7SPOhiUYxo85Etl/FyW8nsX6E1qLGna76GSDXXKKgyklyj1biwPUXkYR04a6WYoOLI6RfsU3P+/gCLEGaUNk3jHW3vi51oH61pnq4AHiDkQWOHm/lqgp4bcgAn1f4/diTXyI1xPbIs+FGzwfwuYteWGdbyr3pBf1gPwdm6eWeS8QLuKjIq+lQ/jvnkBPPhwhq4sBMWi7JMNtqn0yFo6yaO5SAlD/Tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7Ico3Mr2DsE6KuuSCEovJurYxohGuuNnPwp9ZmLGPI=;
 b=VA7AC3jWE273+TgX6zSn44rPk2bZ+P4nBbgB2YlD7cOzPv0+ewcMqwdnarqRr4BoZLvMeDMWRpSgBrAr+BFFN92x6ajMqSKk+4ZtsKPWfYWBj2ol3uFI7bueODZEl1pjIyUgS4t9o6HnWe7hFX0TlYc+MvNrHxMbJxhZDzqLt9JAIDJ0cApsEvWcclfuA8iyvgDSMAqWqZSvQI4ouudHhE77AiaNF9WFXxO88DjtLy/1Qtxik65oM0wvVDhLqiJgzphRhyMvEnthBe1d02yY2V3/kO9XNYayIYJJiltCKmM43iidJTwYWHfUIVRfFExZKQIUtqK3kJ0kmPLrEaK1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 09:18:48 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 09:18:47 +0000
Message-ID: <9b56a22c-533a-4c4f-a85f-e84049f86788@windriver.com>
Date: Tue, 17 Mar 2026 17:18:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260316083826.1550599-1-changqing.li@windriver.com>
 <20260316083826.1550599-6-changqing.li@windriver.com>
 <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 2071d5d9-744a-4da4-596d-08de840631e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	HUUYp4wYDk5PiehNmfyvXBHnj3om4d6XPZmgXP0YCvU+2IPOSofivXY5UbbvEfTXVFT1ZVzlAXVu93IF7STDaCvxV1ObKAxLxDS+kgn4DsxGASLtH0g+L4aK/JnEEWiex4/GVKi6vTIl5Tfa6fKG3id4RggIyoWG/H1EkDedYyPZjHRXCk+YfxQ0Hm/uSav+OmWSATmgJW6IjsdRRzhuxy0Cc9gWq82UnUYr3tcR9aBxQSLIN0x3PxUE3sEhvoOfYtYkI98kLgcFvgAX+M8sA+KaobTvwMTOGTmudRmC7OB3CGkdMnZWXGRlf6I7S1r+S4UiXqDcw+ZvIrA1NMkU+n9678PGoy4SiujUjgc5WbO3YE/qJrZcTwDg5XGdo2uWpZ7ZHzCQj7nIZ7FLs4j2KJR+ZBknrOJCh3Xb+0Pw0SzteMgOCeJhT6N5Gx1S3HGKGNPn+/UeL6cPu3YwaC2cNEZEvO+RpeOep+o8bpQKs+roZEH5ScHEERTaKosg1+iVH1oCvnz6oyqfPACJHHRUxs8jIhzKhp/6Q8ZDfdSk+crgRe9ZRGsauK1kbNS27I+nXvJUwe32uGV88pPxSXH+h8tyq/va6RAH6so9xk0T7bAzrHFMOb7Dp6rI+D9vxfAfCymmEuKYBSGYTMd+qsFVbhHz2b2PYh7dTBHq3JSRdUYu2K4j2QCI1VfcXIgKMYU+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDZQQWtlY2RZdkd0eXdodkdmUm1yZldYbmp2Q0RMTG9kQUMyanlJUGZOWGhp?=
 =?utf-8?B?ckl2N2VyRE9pY0F2Z1JEbjd4SW11WTlnYWNENjhQek9MTkpRM1dxdWs3RVVa?=
 =?utf-8?B?UHlVUFVKWS9PUDVSTDFUSTl5bE9OMVNvdURHdWtSUVViZjF0ZzJXd3o2c3VX?=
 =?utf-8?B?WGQzcWtBay9nU29wa29CekZsTG1zMHNla3JycW81K3ZZYUM2QmVadTZiaFB1?=
 =?utf-8?B?ekpVbkZVZ0c4MkJORzFHbjhmQnpXbzB1c3FtcGZ2bHdXa0xicEtpUm9zd3Zp?=
 =?utf-8?B?MW5aUnZpckx2Nzc0LzByVEpTVjRnbkxQMmJHTy9LdnRYOThZbVNmM0VPMVZ3?=
 =?utf-8?B?a2wxcDh0VllVSDJtVFFJLzZWZE9RR1RrT0pZaWFDOVF4YmNtdFM0V2VqT0xO?=
 =?utf-8?B?a2JHUGlvWStqSEE5MC81NXRlR0F6K1dSZ2tHUE9US1BVYWQ2bllWTldWV0lC?=
 =?utf-8?B?eVdPSEZ6TVVkL3dOZjVPME9kQm9POVFramd4OEllVklmQVMvbEtmRjVGTHdD?=
 =?utf-8?B?YWJVVWhSUWI4cHlNaVduajlhMGxKa1BsY2xsNitpelJhNXpjV1ZuZTI5WmVP?=
 =?utf-8?B?TUtZSmE3WUg2ZEFKNDFVZHU1MXc0WnlXbm5makd1OGphYk9YNG1wdUZjUmZW?=
 =?utf-8?B?Y3VheG41RWp4NXhpRi92cUdSZSs1eE53eGliRXFyeGpUQy9iQVAwUlRxVEFE?=
 =?utf-8?B?UFNwN1cvZml3aGxMZWZ6Z1ZrSGdNNUhRR3JybGNySTFRbnU1SWRBUXRNdXl0?=
 =?utf-8?B?Uk83VG5FR1RNb1VXNTdRam1kbXR6aDBuSWZiaUdBRHZFdTVMd011STNCVGVy?=
 =?utf-8?B?dE44UGo5dWUvZmlWajZwMFFjdXFFajg3ak1CQmQwZ0U3bHgvRmIrb1BOUXl3?=
 =?utf-8?B?RVlaYjVoSHMyYjEyV1hZOGdKcHRtcjZzZ1RVLy9LeGpNamFjcitva1BsbVNW?=
 =?utf-8?B?NVRaUkxnNlk2S2w0RWcreFFFR3BPd09qV25SSkM5SzdnYkZwNFFiU2tsZHYr?=
 =?utf-8?B?L1BBSVRSaWYwY0ZSMXN1YVlyenJIZTRINjVwN2Y4TGFYVUN4V0tXQ1B5VTdl?=
 =?utf-8?B?cjRNNFE2Y2NEVEdHUVZpNUpsOTBMTVpwSzZLeXhqaVRRSzFkU0QzbWtTV0cv?=
 =?utf-8?B?VEsyZUJ2VVFOWVJaZ082MlJHeDBzZlZjQU1NMCtXZ3pYM0k3Nzh2ZTNZRHBt?=
 =?utf-8?B?dG9sbFNSbVI4UjFXaVdyb3BLREo0Y1JhamhZa0svMGpoK083cWhXZnl3Zitk?=
 =?utf-8?B?emJwVzJVdlpZWGplbERqc0JnNzNEL1FQaGUzNkdVeWZtTzVOcFRnL2RVaDh1?=
 =?utf-8?B?L0lLaUNadUpRZ2ZqR1BjTEw5Y0NCZ2l2a0RhSWJBaWRPcmxYREptOFpVelVW?=
 =?utf-8?B?amgrV1F4dEdMQjZPK0M3ay9nKy8yVCtHcUNZYlZLU3VXdkRKdVNxWDBHVlRz?=
 =?utf-8?B?dUN0YTVMb0hraTZUa2YyazI0dWtsUWFRWnFKbjllWlh1UDZFOU44eUdXbFlw?=
 =?utf-8?B?aVpnSC9PVlBlOUVQanFqZ3FNQVZCVW9KTFlGbnlxU2xwejR2TG9JVjEwQUJ3?=
 =?utf-8?B?bDh3MTFwckR2R2JLOTliOXFKQUZKRERyTk16MmVESjBOY1Z6ZVpKc0hHdGNT?=
 =?utf-8?B?RUt4MkFtZjNLZHlVT2o4cU92ZTA2YXh0WHBLUnpNaldzZXB3MkwxMiszbFhQ?=
 =?utf-8?B?RXhBbmhtaTcwNytDNUJSaDdMSXlJbkF6UVpuWWNqdkZCVXBjblVsZ2sra1lY?=
 =?utf-8?B?aXgyQ2daSVA5bGoxL3RIMkRjekhPS3NaaXJPbHFSVmVUYW5MbDQrQUlGVUtG?=
 =?utf-8?B?d3ZNdUlxay9BYlUxM3FFNFFROE94ck51amRsc1hYYmhsSkhWSG5tWkZXMDhq?=
 =?utf-8?B?OWlDK3g4ajN6aE5wOVRhWGN6bE9wdEZYMWFXb2lydzlEL1ZrcWUzazE1YjU5?=
 =?utf-8?B?aWF6SUY2b25hUjNmUzRvZGNxaUhpUjErYUVvS2FSZEVVSzNWdkJKb3BsdXlW?=
 =?utf-8?B?TUpiY2NQSjFYTGZwaUJnL1JhT3Vhbk05TnlnT1YyVlVUUDd3OWZELzdtRFl1?=
 =?utf-8?B?Q2tZa2wxN3AxdjUzT3hlT0J5d2xZSG9GMVBwNnRJZGJpM2w2NEtFT29WbGNV?=
 =?utf-8?B?TmZXZnlmVXJVZGtkZmN2YndJc2huc3VqclBrRjN5alk5N3djVktUbXRxTEhE?=
 =?utf-8?B?RkVOY2FnNG9kZWdHalM2NEQyRjMvczU3dngyUW9nZjdNT3NaT0VwWldHcnpK?=
 =?utf-8?B?QU1ZZjFCWkZnWFY1YUltMHdzQ0pnQUVpWjg0eXFvaHc2enQzRVc5akk1MWhr?=
 =?utf-8?B?ckhGeEhmOUo5aUx4ZFJRa0drcEZWdEJ6ckE5M2ZBY0poTXVIRkZMbmN3QXRk?=
 =?utf-8?Q?Qd2EelrTw3yQ/Gvk=3D?=
X-Exchange-RoutingPolicyChecked: 
	VFXarXPGxW049jIkzKMSHYumM8nGfNe7EYfR3MGG2e4j0R1rhj2IY2Oxy8wR4Fl+pa5KRJIr7CLkn0kgcwiNBRRu5UD+VhAkSKigEomKB+iCxsEDEvdQTEQlm4X//2GdfEhUGAqsM7m4lTx+RIRFaaevyhUwm0q5abe8frxPzaeWeoSiJy/9mxxiFXQ1B7rYTqrZR2I0WPFdh1IVDuvHoq1r73Xom07zD36KUImXyj5GkGpYcPmfN52DZDlOEemgrldo2bSm8sGkDTxhMoE7TuwQaWlhjsFQo5FVl4v4m9O83P6/J2iB5Tr/25CisaKrrDkWyded0bAKKAfhGbq8XA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2071d5d9-744a-4da4-596d-08de840631e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:18:47.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: If3b74KH5FPLKKb2EH0839J/98GKeESDFvMiYvPanqFBOmjN6r3h1hT3FxOaB0WVPdNxTuORKa9Ggm8fE6j3bd0YFdxl2X8Z0Fviph/wTnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b91c7b cx=c_pps
 a=5NePcLBJi4TpPzNSyn8y/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=XMC4lU5bAAAA:20 a=BiqsqxNzAAAA:8 a=NEAV23lmAAAA:8 a=pQs5aej7AAAA:8
 a=rPClnSe_AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=xNf9USuDAAAA:8 a=-kTf5OY-Cqy4IMSsvhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3c_bh9JCJ1R8RpoZksgJ:22 a=npGTQlmte4lqeLD-QWPy:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MSBTYWx0ZWRfXyoiGkA9dsbkR
 XTv37tws19PkVT/VANHRCAvfyP0dAMTft1CrzgM4h5pr95/1+sHY8NKW8VlU0U/pKQjSKdzDHcb
 cFgf7dVE9GJBfstc4vGPF8Bp3j1froF6VEEnUxKe7fXK0eCCKu/mfp1f99IjamdrJuCXPvZpDyq
 1l3xLAQEJiswZ490cy9GTSwgr4CwE1t82Ji+ZYORT8wYIzQEeVRJu0A4XX8V9UmSyJoExu5vvCi
 734Fga1q7PM2vPO7NRByLEwvNopwXXHDUggvUNTIK8HXP57fRLsZrn9hRdS8AXRaOUPYLeKhSRS
 Rj4mrvz1IKCwrtIfXVfSzcmSd68vFHR2uLQSOO5CznXvlaGzt4RoGv0rtjx1yirV0m5FcHCs0yK
 gBMxDApeDf2Hv/uiJCjy+nEDAbDgYbPKm6X05RtPGbfMptzMBRMimKRwsSx7YuQiad2zV4bOnM2
 Ibl3acAIoEbT2X2uCRw==
X-Proofpoint-GUID: 6lUzyXD0iKKiqCIDQYQUGZAlGHq8hzr4
X-Proofpoint-ORIG-GUID: Oce4vbwLDTmtR7KqbeZ6hGq71JslGFNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H567XL523385
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125306


On 3/16/26 16:57, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3/16/26 09:38, Changqing Li via lists.openembedded.org wrote:
>> Changes:
>> https://github.com/COVESA/dlt-daemon/releases
>>
>> Remove patches already in 3.0.0:
>> 544.patch
>> 567.patch
>> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>> 0003-allow-build-with-cmake-4.patch
>>
>> Add 3 patches to fix build failures
>> 0001-Fix-compile-failure-related-to-gzlog.patch
>> 0001-Fix-kinds-of-build-failure.patch
>> 0001-Fix-build-failures.patch
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-
>
> Is this glibmm change intentional in this patch?
>
No, it is added by accident. I will fix this in V2. Thanks.

//Changqing

>>   ...e-DLT_WatchdogSec-can-be-set-by-user.patch |  40 --
>>   .../dlt-daemon/0001-Fix-build-failures.patch  | 360 ++++++++++++++++=
++
>>   ...Fix-compile-failure-related-to-gzlog.patch |  69 ++++
>>   .../0001-Fix-kinds-of-build-failure.patch     | 174 +++++++++
>>   .../0003-allow-build-with-cmake-4.patch       |  99 -----
>>   .../dlt-daemon/dlt-daemon/544.patch           |  80 ----
>>   .../dlt-daemon/dlt-daemon/567.patch           |  36 --
>>   ...-daemon_2.18.10.bb =3D> dlt-daemon_3.0.0.bb} |  10 +-
>>   9 files changed, 610 insertions(+), 262 deletions(-)
>>   delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/00=
01-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>>   create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/00=
01-Fix-build-failures.patch
>>   create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/00=
01-Fix-compile-failure-related-to-gzlog.patch
>>   create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/00=
01-Fix-kinds-of-build-failure.patch
>>   delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/00=
03-allow-build-with-cmake-4.patch
>>   delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/54=
4.patch
>>   delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/56=
7.patch
>>   rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.10.bb =3D=
> dlt-daemon_3.0.0.bb} (91%)
>>
>> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb b/met=
a-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
>> index 621a85456d..b0c83f7eba 100644
>> --- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
>> +++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
>> @@ -2,8 +2,8 @@ SUMMARY =3D "C++ bindings for the glib library"
>>   HOMEPAGE =3D "http://www.gtkmm.org/"
>>   SECTION =3D "libs"
>>   LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec7527aac53b7a=
89d1d8 \
>> -                    file://COPYING.tools;md5=3D751419260aa954499f7aba=
abaa882bbe"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5=
e0ae21 \
>> +                    file://COPYING.tools;md5=3D570a9b3749dd0463a17788=
03b12a6dce"
>>
>>   DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
>>
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMake=
Lists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch b/meta-oe/recipes=
-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-=
can-be-set-by-user.patch
>> deleted file mode 100644
>> index 335872c40f..0000000000
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-t=
xt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li <changqing.li@windriver.com>
>> -Date: Fri, 13 Dec 2024 16:37:24 +0800
>> -Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set by u=
ser
>> -
>> -In my test env, WatchdogSec default value 2 is not enough, manually
>> -changed to 3 is ok. This makes dlt.service/dlt-system.service start
>> -failed during boot time. So, make DLT_WatchdogSec can be set by user,=
 so
>> -user can set them to proper value at build time, then service can sta=
rt
>> -successfully in boot time.
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> -
>> -Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/pull/=
720/commits/bc03f142507da92add8ba325fdf8187d47a7d719]
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ----
>> - systemd/CMakeLists.txt | 8 ++++++--
>> - 1 file changed, 6 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt
>> -index 16cbe86b5..659378d16 100644
>> ---- a/systemd/CMakeLists.txt
>> -+++ b/systemd/CMakeLists.txt
>> -@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)
>> -     set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD_UNITDIR} )
>> -
>> -     if(WITH_SYSTEMD_WATCHDOG)
>> --        set( DLT_WatchdogSec 2 )
>> -+        if(NOT DEFINED DLT_WatchdogSec)
>> -+            set(DLT_WatchdogSec 2 CACHE STRING "Watchdog timeout in =
seconds")
>> -+        endif()
>> -         message( STATUS "The systemd watchdog is enabled - timeout i=
s set to ${DLT_WatchdogSec} seconds")
>> -     else(WITH_SYSTEMD_WATCHDOG)
>> --        set( DLT_WatchdogSec 0 )
>> -+        if(NOT DEFINED DLT_WatchdogSec)
>> -+             set(DLT_WatchdogSec 0 CACHE STRING "Watchdog timeout in=
 seconds")
>> -+        endif()
>> -         message( STATUS "The systemd watchdog is disabled")
>> -     endif(WITH_SYSTEMD_WATCHDOG)
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-b=
uild-failures.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001=
-Fix-build-failures.patch
>> new file mode 100644
>> index 0000000000..6cfa3a5482
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-fa=
ilures.patch
>> @@ -0,0 +1,360 @@
>> +From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Mon, 16 Mar 2026 13:28:40 +0800
>> +Subject: [PATCH] Fix build failures
>> +
>> +Fix the following similar build failures, some of the build failure
>> +reproduced with arm64/riscv64, some of the build reproduced with 32bi=
t
>> +x86/arm.
>> +
>> +dlt_daemon_common.c:2785:26: error: conversion to 'int8_t' {aka 'sign=
ed char'} from 'char' may change the sign of the result [-Werror=3Dsign-c=
onversion]
>> +
>> +src/tests/dlt-test-multi-process-client-v2.c:302:49: error: format '%=
lld' expects argument of type 'long long int', but argument 2 has type 't=
ime_t' {aka 'long int'} [-Werror=3Dformat=3D]
>> +  302 |     printf(" Time running (seconds)        : %lld\n", time(NU=
LL) - stats.first_message_time);
>> +      |                                              ~~~^     ~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +      |                                                 |            =
    |
>> +      |                                                 long long int=
    time_t {aka long int}
>> +      |                                              %ld
>> +
>> +src/lib/dlt_user.c:5109:60: error: format '%lld' expects argument of =
type 'long long int', but argument 4 has type '__off_t' {aka 'long int'} =
[-Werror=3Dformat=3D]
>> + 5109 |             dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ll=
d]\n", __func__,
>> +      |                                                         ~~~^
>> +      |                                                            |
>> +      |                                                            lo=
ng long int
>> +      |                                                         %ld
>> + 5110 |                      st.st_size);
>> +      |                      ~~~~~~~~~~
>> +      |                        |
>> +      |                        __off_t {aka long int}
>> +
>> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull=
/827]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + src/daemon/dlt-daemon.c                      |  8 ++---
>> + src/daemon/dlt_daemon_client.c               | 32 ++++++++++--------=
--
>> + src/daemon/dlt_daemon_common.c               |  4 +--
>> + src/lib/dlt_user.c                           | 18 +++++------
>> + src/shared/dlt_common.c                      |  2 +-
>> + src/shared/dlt_multiple_files.c              |  2 +-
>> + src/tests/dlt-test-multi-process-client-v2.c |  8 ++---
>> + src/tests/dlt-test-multi-process-v2.c        |  2 +-
>> + src/tests/dlt-test-multi-process.c           |  2 +-
>> + 9 files changed, 39 insertions(+), 39 deletions(-)
>> +
>> +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
>> +index 523bf33..2ae5bc9 100644
>> +--- a/src/daemon/dlt-daemon.c
>> ++++ b/src/daemon/dlt-daemon.c
>> +@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal *daemon_loc=
al)
>> +
>> +     if (n < 0 || (size_t)n > sizeof(daemon_local->flags.loggingFilen=
ame)) {
>> +         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s=
\n",
>> +-                __func__, n, daemon_local->flags.loggingFilename);
>> ++                __func__, (long int)n, daemon_local->flags.loggingFi=
lename);
>> +     }
>> +     daemon_local->flags.enableLoggingFileLimit =3D false;
>> +     daemon_local->flags.loggingFileSize =3D 250000;
>> +@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()
>> +     n =3D snprintf(tmp, DLT_PATH_MAX, "%s/dlt", dltFifoBaseDir);
>> +     if (n < 0 || (size_t)n > DLT_PATH_MAX) {
>> +         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s=
\n",
>> +-                __func__, n, tmp);
>> ++                __func__, (long int)n, tmp);
>> +     }
>> +
>> +     (void)unlink(tmp);
>> +@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon *daemon, =
DltDaemonLocal *daemon_local,
>> +         dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon,daemon=
_local,
>> +                             msg.headerbuffer, sizeof(DltStorageHeade=
r),
>> +                             msg.headerbuffer + sizeof(DltStorageHead=
er),
>> +-                            (size_t)(msg.headersize - (int32_t)sizeo=
f(DltStorageHeader)),
>> +-                            msg.databuffer, (size_t)msg.datasize, ve=
rbose);
>> ++                            (int)(msg.headersize - (int32_t)sizeof(D=
ltStorageHeader)),
>> ++                            msg.databuffer, (int)msg.datasize, verbo=
se);
>> +
>> +         free(msg.databuffer);
>> +     }else {
>> +diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_c=
lient.c
>> +index 50d8f19..20a512b 100644
>> +--- a/src/daemon/dlt_daemon_client.c
>> ++++ b/src/daemon/dlt_daemon_client.c
>> +@@ -551,8 +551,8 @@ int dlt_daemon_client_send_message_to_all_client(=
DltDaemon *daemon,
>> +     return dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon, da=
emon_local,
>> +                 daemon_local->msg.headerbuffer, sizeof(DltStorageHea=
der),
>> +                 daemon_local->msg.headerbuffer + sizeof(DltStorageHe=
ader),
>> +-                (size_t)(daemon_local->msg.headersize - (int32_t)siz=
eof(DltStorageHeader)),
>> +-                daemon_local->msg.databuffer, (size_t)daemon_local->=
msg.datasize, verbose);
>> ++                (int)(daemon_local->msg.headersize - (int32_t)sizeof=
(DltStorageHeader)),
>> ++                daemon_local->msg.databuffer, (int)daemon_local->msg=
.datasize, verbose);
>> +
>> + }
>> +
>> +@@ -771,8 +771,8 @@ int dlt_daemon_client_send_control_message(int so=
ck,
>> +     if ((ret =3D
>> +              dlt_daemon_client_send(sock, daemon, daemon_local, msg-=
>headerbuffer, sizeof(DltStorageHeader),
>> +                                     msg->headerbuffer + sizeof(DltSt=
orageHeader),
>> +-                                    (size_t)(msg->headersize - (int3=
2_t)sizeof(DltStorageHeader)),
>> +-                                    msg->databuffer, (size_t)msg->da=
tasize, verbose))) {
>> ++                                    (int)(msg->headersize - (int32_t=
)sizeof(DltStorageHeader)),
>> ++                                    msg->databuffer, (int)msg->datas=
ize, verbose))) {
>> +         dlt_log(LOG_DEBUG, "dlt_daemon_control_send_control_message:=
 DLT message send to all failed!.\n");
>> +         return ret;
>> +     }
>> +@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int sock,
>> +
>> +     /* Allocate buffer for response message */
>> +     resp.databuffer =3D (uint8_t *)malloc((size_t)resp.datasize);
>> +-    resp.databuffersize =3D (size_t)resp.datasize;
>> ++    resp.databuffersize =3D resp.datasize;
>> +
>> +     if (resp.databuffer =3D=3D 0) {
>> +         dlt_daemon_control_service_response(sock,
>> +@@ -2572,7 +2572,7 @@ int dlt_daemon_control_message_buffer_overflow(=
int sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2633,7 +2633,7 @@ int dlt_daemon_control_message_buffer_overflow_=
v2(int sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2686,7 +2686,7 @@ void dlt_daemon_control_service_response(int so=
ck,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2732,7 +2732,7 @@ void dlt_daemon_control_service_response_v2(int=
 sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2779,7 +2779,7 @@ int dlt_daemon_control_message_unregister_conte=
xt(int sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2842,7 +2842,7 @@ int dlt_daemon_control_message_unregister_conte=
xt_v2(int sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2909,7 +2909,7 @@ int dlt_daemon_control_message_connection_info(=
int sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -2962,7 +2962,7 @@ int dlt_daemon_control_message_connection_info_=
v2(int sock,
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int soc=
k, DltDaemon *daemon, DltDaemonLo
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -3072,7 +3072,7 @@ int dlt_daemon_control_message_timezone_v2(int =
sock, DltDaemon *daemon, DltDaemo
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int sock,=
 DltDaemon *daemon, DltDaemonLoca
>> +
>> +     if (msg.databuffer =3D=3D 0) {
>> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
>> +-        msg.databuffersize =3D (size_t)msg.datasize;
>> ++        msg.databuffersize =3D msg.datasize;
>> +     }
>> +
>> +     if (msg.databuffer =3D=3D 0)
>> +diff --git a/src/daemon/dlt_daemon_common.c b/src/daemon/dlt_daemon_c=
ommon.c
>> +index 2f08c6a..65b264a 100644
>> +--- a/src/daemon/dlt_daemon_common.c
>> ++++ b/src/daemon/dlt_daemon_common.c
>> +@@ -2782,7 +2782,7 @@ int dlt_daemon_user_send_log_state(DltDaemon *d=
aemon, DltDaemonApplication *app,
>> +     if (dlt_user_set_userheader(&userheader, DLT_USER_MESSAGE_LOG_ST=
ATE) < DLT_RETURN_OK)
>> +         return -1;
>> +
>> +-    logstate.log_state =3D daemon->connectionState;
>> ++    logstate.log_state =3D (int8_t)daemon->connectionState;
>> +
>> +     /* log to FIFO */
>> +     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
>> +@@ -2811,7 +2811,7 @@ int dlt_daemon_user_send_log_state_v2(DltDaemon=
 *daemon, DltDaemonApplication *a
>> +     if (dlt_user_set_userheader_v2(&userheader, DLT_USER_MESSAGE_LOG=
_STATE) < DLT_RETURN_OK)
>> +         return -1;
>> +
>> +-    logstate.log_state =3D daemon->connectionState;
>> ++    logstate.log_state =3D (int8_t)daemon->connectionState;
>> +
>> +     /* log to FIFO */
>> +     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
>> +diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
>> +index 6d0098d..e432e26 100644
>> +--- a/src/lib/dlt_user.c
>> ++++ b/src/lib/dlt_user.c
>> +@@ -5106,8 +5106,8 @@ DltReturnValue dlt_user_log_send_log(DltContext=
Data *log, const int mtype, int *
>> +                 return DLT_RETURN_ERROR;
>> +             }
>> +
>> +-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n", _=
_func__,
>> +-                     st.st_size);
>> ++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n", =
__func__,
>> ++                     (long long int)st.st_size);
>> +             /* Check filesize */
>> +             /* Return error if the file size has reached to maximum =
*/
>> +             unsigned int msg_size =3D (unsigned int)st.st_size + (un=
signed int)msg.headersize +
>> +@@ -5115,8 +5115,8 @@ DltReturnValue dlt_user_log_send_log(DltContext=
Data *log, const int mtype, int *
>> +             if (msg_size > dlt_user.filesize_max) {
>> +                 dlt_user_file_reach_max =3D true;
>> +                 dlt_vlog(LOG_ERR,
>> +-                         "%s: File size (%ld bytes) reached to defin=
ed maximum size (%d bytes)\n",
>> +-                         __func__, st.st_size, dlt_user.filesize_max=
);
>> ++                         "%s: File size (%lld bytes) reached to defi=
ned maximum size (%d bytes)\n",
>> ++                         __func__, (long long int)st.st_size, dlt_us=
er.filesize_max);
>> +                 dlt_mutex_unlock();
>> +                 return DLT_RETURN_FILESZERR;
>> +             }
>> +@@ -5612,21 +5612,21 @@ DltReturnValue dlt_user_log_send_log_v2(DltCo=
ntextData *log, const int mtype, Dl
>> +                 return DLT_RETURN_ERROR;
>> +             }
>> +
>> +-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n", _=
_func__,
>> +-                     st.st_size);
>> ++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n", =
__func__,
>> ++                     (long long int)st.st_size);
>> +             /* Check filesize */
>> +             /* Return error if the file size has reached to maximum =
*/
>> +             unsigned int msg_size =3D 0;
>> +             if (st.st_size < 0 || st.st_size > UINT_MAX) {
>> +-                dlt_vlog(LOG_ERR, "%s: File size (%ld bytes) is inva=
lid or too large for unsigned int\n", __func__, st.st_size);
>> ++                dlt_vlog(LOG_ERR, "%s: File size (%lld bytes) is inv=
alid or too large for unsigned int\n", __func__, (long long int)st.st_siz=
e);
>> +                 return DLT_RETURN_FILESZERR;
>> +             }
>> +             msg_size =3D (unsigned int)st.st_size + (unsigned int) m=
sg.headersizev2 + (unsigned int) log->size;
>> +             if (msg_size > dlt_user.filesize_max) {
>> +                 dlt_user_file_reach_max =3D true;
>> +                 dlt_vlog(LOG_ERR,
>> +-                         "%s: File size (%ld bytes) reached to defin=
ed maximum size (%d bytes)\n",
>> +-                         __func__, st.st_size, dlt_user.filesize_max=
);
>> ++                         "%s: File size (%lld bytes) reached to defi=
ned maximum size (%d bytes)\n",
>> ++                         __func__, (long long int)st.st_size, dlt_us=
er.filesize_max);
>> +                 return DLT_RETURN_FILESZERR;
>> +             }
>> +             else {
>> +diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
>> +index 6ad354b..aa0aaaa 100644
>> +--- a/src/shared/dlt_common.c
>> ++++ b/src/shared/dlt_common.c
>> +@@ -1220,7 +1220,7 @@ DltReturnValue dlt_message_header_flags_v2(DltM=
essageV2 *msg, char *text, size_t
>> +             for (int i =3D 0; i<5; ++i){
>> +                 tt =3D (tt << 8) | msg->headerextrav2.seconds[i];
>> +             }
>> +-            snprintf(text + strlen(text), textlength - strlen(text),=
 "%ld.%.9u ", tt, msg->headerextrav2.nanoseconds);
>> ++            snprintf(text + strlen(text), textlength - strlen(text),=
 "%lld.%.9u ", (long long int)tt, msg->headerextrav2.nanoseconds);
>> +         }
>> +         else
>> +             snprintf(text + strlen(text), textlength - strlen(text),=
 "---------- ");
>> +diff --git a/src/shared/dlt_multiple_files.c b/src/shared/dlt_multipl=
e_files.c
>> +index c4019e5..65529ff 100644
>> +--- a/src/shared/dlt_multiple_files.c
>> ++++ b/src/shared/dlt_multiple_files.c
>> +@@ -257,7 +257,7 @@ ssize_t multiple_files_buffer_get_total_size(cons=
t MultipleFilesRingBuffer *file
>> +             if (((unsigned int)res < sizeof(filename)) && (res > 0))=
 {
>> +                 errno =3D 0;
>> +                 if (0 =3D=3D stat(filename, &status))
>> +-                    size +=3D status.st_size;
>> ++                    size +=3D (ssize_t)status.st_size;
>> +                 else
>> +                     fprintf(stderr, "file %s cannot be stat-ed, erro=
r=3D%s\n", filename, strerror(errno));
>> +             }
>> +diff --git a/src/tests/dlt-test-multi-process-client-v2.c b/src/tests=
/dlt-test-multi-process-client-v2.c
>> +index 2bb1158..ec99720 100644
>> +--- a/src/tests/dlt-test-multi-process-client-v2.c
>> ++++ b/src/tests/dlt-test-multi-process-client-v2.c
>> +@@ -299,10 +299,10 @@ void print_stats(s_statistics stats, s_paramete=
rs params)
>> +     printf(" Messages received             : %d\n", stats.messages_r=
eceived);
>> +     printf(" Broken messages received      : %d\n", stats.broken_mes=
sages_received);
>> +     printf(" Bytes received                : %d\n", stats.bytes_rece=
ived);
>> +-    printf(" Time running (seconds)        : %ld\n", time(NULL) - st=
ats.first_message_time);
>> +-    printf(" Throughput (msgs/sec)/(B/sec) : %ld/%ld\n",
>> +-           stats.messages_received / ((time(NULL) - stats.first_mess=
age_time) + 1),
>> +-           (stats.bytes_received) / ((time(NULL) - stats.first_messa=
ge_time) + 1));
>> ++    printf(" Time running (seconds)        : %lld\n", (long long int=
)(time(NULL) - stats.first_message_time));
>> ++    printf(" Throughput (msgs/sec)/(B/sec) : %lld/%lld\n",
>> ++           (long long int)(stats.messages_received / ((time(NULL) - =
stats.first_message_time) + 1)),
>> ++           (long long int)((stats.bytes_received) / ((time(NULL) - s=
tats.first_message_time) + 1)));
>> +
>> +     if (params.messages_left =3D=3D 0) {
>> +         if (stats.broken_messages_received =3D=3D 0)
>> +diff --git a/src/tests/dlt-test-multi-process-v2.c b/src/tests/dlt-te=
st-multi-process-v2.c
>> +index 44a8622..1d3a54a 100644
>> +--- a/src/tests/dlt-test-multi-process-v2.c
>> ++++ b/src/tests/dlt-test-multi-process-v2.c
>> +@@ -393,7 +393,7 @@ void *do_logging(void *arg)
>> +
>> +         sleep_time =3D mksleep_time(data->params.delay, data->params=
.delay_fudge);
>> +         ts.tv_sec =3D sleep_time / 1000000000;
>> +-        ts.tv_nsec =3D sleep_time % 1000000000;
>> ++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
>> +         nanosleep(&ts, NULL);
>> +     }
>> +
>> +diff --git a/src/tests/dlt-test-multi-process.c b/src/tests/dlt-test-=
multi-process.c
>> +index 016c8b4..00fb11c 100644
>> +--- a/src/tests/dlt-test-multi-process.c
>> ++++ b/src/tests/dlt-test-multi-process.c
>> +@@ -370,7 +370,7 @@ void *do_logging(void *arg)
>> +
>> +         sleep_time =3D mksleep_time(data->params.delay, data->params=
.delay_fudge);
>> +         ts.tv_sec =3D sleep_time / 1000000000;
>> +-        ts.tv_nsec =3D sleep_time % 1000000000;
>> ++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
>> +         nanosleep(&ts, NULL);
>> +     }
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-c=
ompile-failure-related-to-gzlog.patch b/meta-oe/recipes-extended/dlt-daem=
on/dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch
>> new file mode 100644
>> index 0000000000..f9692d9f4d
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-=
failure-related-to-gzlog.patch
>> @@ -0,0 +1,69 @@
>> +From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 12 Mar 2026 19:37:11 +0800
>> +Subject: [PATCH] Fix compile failure related to gzlog
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +* In commit [1], gzlog is changed from gzFile to gzFile*, this cause
>> +  failure:
>> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21: err=
or: passing argument 1 of =E2=80=98gzclose=E2=80=99 from incompatible poi=
nter type [-Werror=3Dincompatible-pointer-types]
>> +   88 |         gzclose(data->gzlog);
>> +      |                 ~~~~^~~~~~~
>> +      |                     |
>> +      |                     struct gzFile_s **
>> +compilation terminated due to -Wfatal-errors.
>> +
>> +so change gzlog back to gzFile, so that all the gzxxx function can wo=
rk
>> +well.
>> +
>> +* Change to gzFile causes the following failure, since fileno need
>> +  FILE*, according to code "config->gzlog =3D gzdopen(config->fd, mod=
e)",
>> +  seems we don't need to use fileno, just use config->fd is ok.
>> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1=
133:48: error: passing argument 1 of =E2=80=98fileno=E2=80=99 from incomp=
atible pointer type [-Werror=3Dincompatible-pointer-types]
>> + 1133 |                         if (fsync(fileno(config->gzlog)) !=3D=
 0) {
>> +      |                                          ~~~~~~^~~~~~~
>> +      |                                                |
>> +      |                                                gzFile {aka st=
ruct gzFile_s *}
>> +compilation terminated due to -Wfatal-errors.
>> +
>> +[1] https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576ed=
adeccf614c9dab1b9b3
>> +
>> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull=
/826]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + src/offlinelogstorage/dlt_offline_logstorage.h          | 2 +-
>> + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/off=
linelogstorage/dlt_offline_logstorage.h
>> +index fe38687..09ea5ce 100644
>> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>> +@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig
>> +     FILE *log;                      /* current open log file */
>> +     int fd;                         /* The file descriptor for the a=
ctive log file */
>> + #ifdef DLT_LOGSTORAGE_USE_GZIP
>> +-    gzFile *gzlog;                  /* current open gz log file */
>> ++    gzFile gzlog;                   /* current open gz log file */
>> + #endif
>> +     void *cache;                    /* log data cache */
>> +     unsigned int specific_size;     /* cache size used for specific_=
size sync strategy */
>> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c =
b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>> +index f17fbb2..ff09c9e 100644
>> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>> +@@ -1130,7 +1130,7 @@ int dlt_logstorage_prepare_on_msg(DltLogStorage=
FilterConfig *config,
>> +                     (config->sync =3D=3D DLT_LOGSTORAGE_SYNC_UNSET))=
 {
>> + #ifdef DLT_LOGSTORAGE_USE_GZIP
>> +                     if (config->gzip_compression =3D=3D DLT_LOGSTORA=
GE_GZIP_ON) {
>> +-                        if (fsync(fileno(config->gzlog)) !=3D 0) {
>> ++                        if (fsync(config->fd) !=3D 0) {
>> +                             if (errno !=3D ENOSYS) {
>> +                                 dlt_vlog(LOG_ERR, "%s: failed to syn=
c gzip log file\n", __func__);
>> +                             }
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-k=
inds-of-build-failure.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-dae=
mon/0001-Fix-kinds-of-build-failure.patch
>> new file mode 100644
>> index 0000000000..403d1089e2
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of=
-build-failure.patch
>> @@ -0,0 +1,174 @@
>> +From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 12 Mar 2026 20:06:34 +0800
>> +Subject: [PATCH] Fix kinds of build failure
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Fix kinds of build failures caused by -Werror=3Dsign-conversion,
>> +-Werror=3Dcast-qual, -Werror=3Dconversion etc.
>> +Eg:
>> +src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error: unsigne=
d conversion from =E2=80=98int=E2=80=99 to =E2=80=98unsigned int=E2=80=99=
 changes value from =E2=80=98-1=E2=80=99 to =E2=80=984294967295=E2=80=99 =
[-Werror=3Dsign-conversion]
>> +  129 | #define DLT_LOGSTORAGE_GZIP_ERROR               -1 /* error c=
ase */
>> +      |                                                 ^
>> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36: n=
ote: in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERROR=E2=80=99
>> + 1303 |         config->gzip_compression =3D DLT_LOGSTORAGE_GZIP_ERRO=
R;
>> +
>> +      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error=
: conversion from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98long unsigned =
int=E2=80=99} to =E2=80=98int=E2=80=99 may change value [-Werror=3Dconver=
sion]
>> +  851 |         return gzfwrite(ptr, size, nmemb, config->gzlog);
>> +      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +src/console/dlt-control-common.c:922:25: error: cast discards 'const'=
 qualifier from pointer target type [-Werror=3Dcast-qual]
>> +  922 |     json_object_to_file((char*)filename, json_filter_obj);
>> +      |
>> +
>> +Use explicit type conversion to make the build can pass
>> +
>> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull=
/826]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + src/console/dlt-control-common.c                       |  2 +-
>> + src/daemon/dlt-daemon.c                                |  4 ++--
>> + src/daemon/udp_connection/dlt_daemon_udp_socket.c      | 10 +++++---=
--
>> + src/examples/dlt-example-multicast-clientmsg-view.c    |  8 ++++----
>> + src/offlinelogstorage/dlt_offline_logstorage.h         |  2 +-
>> + .../dlt_offline_logstorage_behavior.c                  |  4 ++--
>> + 6 files changed, 15 insertions(+), 15 deletions(-)
>> +
>> +diff --git a/src/console/dlt-control-common.c b/src/console/dlt-contr=
ol-common.c
>> +index 2aeea280..4f9e95b4 100644
>> +--- a/src/console/dlt-control-common.c
>> ++++ b/src/console/dlt-control-common.c
>> +@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter *fi=
lter, const char *filename, int
>> +     }
>> +
>> +     printf("Saving current filter into '%s'\n", filename);
>> +-    json_object_to_file((char*)filename, json_filter_obj);
>> ++    json_object_to_file(filename, json_filter_obj);
>> +
>> +     return DLT_RETURN_OK;
>> + }
>> +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
>> +index 97af1cd9..94024eb4 100644
>> +--- a/src/daemon/dlt-daemon.c
>> ++++ b/src/daemon/dlt-daemon.c
>> +@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal *daemon_loc=
al)
>> +
>> +                         if ((longval =3D=3D MULTICAST_CONNECTION_DIS=
ABLED)
>> +                             || (longval =3D=3D MULTICAST_CONNECTION_=
ENABLED)) {
>> +-                            daemon_local->UDPConnectionSetup =3D lon=
gval;
>> ++                            daemon_local->UDPConnectionSetup =3D (in=
t)longval;
>> +                             printf("Option: %s=3D%s\n", token, value=
);
>> +                         }
>> +                         else {
>> +@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal *daemon_loc=
al)
>> +                     }
>> +                     else if (strcmp(token, "UDPMulticastIPPort") =3D=
=3D 0)
>> +                     {
>> +-                        daemon_local->UDPMulticastIPPort =3D strtol(=
value, NULL, 10);
>> ++                        daemon_local->UDPMulticastIPPort =3D (int)st=
rtol(value, NULL, 10);
>> +                     }
>> + #endif
>> +                     else if (strcmp(token, "BindAddress") =3D=3D 0)
>> +diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c b/src/=
daemon/udp_connection/dlt_daemon_udp_socket.c
>> +index 4c40cda8..b3408773 100644
>> +--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
>> ++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
>> +@@ -66,7 +66,7 @@ void dlt_daemon_udp_setmulticast_addr(DltDaemonLoca=
l *daemon_local)
>> +     struct sockaddr_in clientaddr;
>> +     clientaddr.sin_family =3D AF_INET;
>> +     inet_pton(AF_INET, daemon_local->UDPMulticastIPAddress, &clienta=
ddr.sin_addr);
>> +-    clientaddr.sin_port =3D htons(daemon_local->UDPMulticastIPPort);
>> ++    clientaddr.sin_port =3D htons((uint16_t)daemon_local->UDPMultica=
stIPPort);
>> +     memcpy(&g_udpmulticast_addr.clientaddr, &clientaddr, sizeof(stru=
ct sockaddr_in));
>> +     g_udpmulticast_addr.clientaddr_size =3D sizeof(g_udpmulticast_ad=
dr.clientaddr);
>> +     g_udpmulticast_addr.isvalidflag =3D ADDRESS_VALID;
>> +@@ -224,17 +224,17 @@ void dlt_daemon_udp_clientmsg_send(DltDaemonCli=
entSockInfo *clientinfo,
>> +
>> +     if ((clientinfo->isvalidflag =3D=3D ADDRESS_VALID) &&
>> +         (size1 > 0) && (size2 > 0)) {
>> +-        void *data =3D (void *)calloc(size1 + size2, sizeof(char));
>> ++        void *data =3D (void *)calloc((size_t)(size1 + size2), sizeo=
f(char));
>> +
>> +         if (data =3D=3D NULL) {
>> +             dlt_vlog(LOG_ERR, "%s: calloc failure\n", __func__);
>> +             return;
>> +         }
>> +
>> +-        memcpy(data, data1, size1);
>> +-        memcpy(data + size1, data2, size2);
>> ++        memcpy(data, data1, (size_t)size1);
>> ++        memcpy((int*)data + size1, data2, (size_t)size2);
>> +
>> +-        if (sendto(g_udp_sock_fd, data, size1 + size2, 0, (struct so=
ckaddr *)&clientinfo->clientaddr,
>> ++        if (sendto(g_udp_sock_fd, data, (size_t)(size1 + size2), 0, =
(struct sockaddr *)&clientinfo->clientaddr,
>> +                    clientinfo->clientaddr_size) < 0)
>> +             dlt_vlog(LOG_ERR, "%s: Send UDP Packet Data failed\n", _=
_func__);
>> +
>> +diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c b/sr=
c/examples/dlt-example-multicast-clientmsg-view.c
>> +index c00537e5..f8920453 100644
>> +--- a/src/examples/dlt-example-multicast-clientmsg-view.c
>> ++++ b/src/examples/dlt-example-multicast-clientmsg-view.c
>> +@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct clientin=
fostruct *clientinfo, DltRece
>> +     /* wait for data from socket */
>> +     unsigned int addrlen =3D sizeof(clientinfo->addr);
>> +
>> +-    if ((receiver->bytesRcvd =3D recvfrom(clientinfo->fd,
>> ++    if ((receiver->bytesRcvd =3D (int32_t)recvfrom(clientinfo->fd,
>> +                                         receiver->buf + receiver->la=
stBytesRcvd,
>> +-                                        receiver->buffersize - recei=
ver->lastBytesRcvd,
>> ++                                        (size_t)(receiver->buffersiz=
e - receiver->lastBytesRcvd),
>> +                                         0,
>> +                                         (struct sockaddr *)&(clienti=
nfo->addr), &addrlen))
>> +         <=3D 0) {
>> +@@ -177,11 +177,11 @@ int main()
>> +         dlt_receiver_receive_socket_udp(&clientinfo, &(clientinfo.re=
ceiver));
>> +
>> +         while (dlt_message_read(&msg, (unsigned char *)(clientinfo.r=
eceiver.buf),
>> +-                                clientinfo.receiver.bytesRcvd, 0, 0)=
 =3D=3D DLT_MESSAGE_ERROR_OK) {
>> ++                                (unsigned int)clientinfo.receiver.by=
tesRcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_OK) {
>> +             dlt_receive_message_callback_udp(&msg);
>> +
>> +             if (dlt_receiver_remove(&(clientinfo.receiver),
>> +-                                    msg.headersize + msg.datasize - =
sizeof(DltStorageHeader))
>> ++                                    msg.headersize + msg.datasize - =
((int32_t)(sizeof(DltStorageHeader))))
>> +                 =3D=3D DLT_RETURN_ERROR) {
>> +                 /* Return value ignored */
>> +                 dlt_message_free(&msg, 0);
>> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/off=
linelogstorage/dlt_offline_logstorage.h
>> +index 09ea5ce4..cfb70f33 100644
>> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>> +@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig
>> +     int overwrite;                  /* Overwrite strategy */
>> +     int skip;                       /* Flag to skip file logging if =
DISCARD_NEW */
>> +     char *ecuid;                    /* ECU identifier */
>> +-    unsigned int gzip_compression;  /* Toggle if log files should be=
 gzip compressed */
>> ++    int gzip_compression;           /* Toggle if log files should be=
 gzip compressed */
>> +     /* callback function for filter configurations */
>> +     int (*dlt_logstorage_prepare)(DltLogStorageFilterConfig *config,
>> +                                   DltLogStorageUserConfig *file_conf=
ig,
>> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c =
b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>> +index ff09c9eb..ae8f4442 100644
>> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>> +@@ -848,10 +848,10 @@ DLT_STATIC int dlt_logstorage_write_to_log(void=
 *ptr, size_t size, size_t nmemb,
>> + {
>> + #ifdef DLT_LOGSTORAGE_USE_GZIP
>> +     if (config->gzip_compression =3D=3D DLT_LOGSTORAGE_GZIP_ON) {
>> +-        return gzfwrite(ptr, size, nmemb, config->gzlog);
>> ++        return (int)gzfwrite(ptr, size, nmemb, config->gzlog);
>> +     }
>> +     else {
>> +-        return fwrite(ptr, size, nmemb, config->log);
>> ++        return (int)fwrite(ptr, size, nmemb, config->log);
>> +     }
>> + #else
>> +     return (int)fwrite(ptr, size, nmemb, config->log);
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow=
-build-with-cmake-4.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemo=
n/0003-allow-build-with-cmake-4.patch
>> deleted file mode 100644
>> index ac5fec5684..0000000000
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-=
with-cmake-4.patch
>> +++ /dev/null
>> @@ -1,99 +0,0 @@
>> -From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00 200=
1
>> -From: Alper Ak <alperyasinak1@gmail.com>
>> -Date: Wed, 9 Jul 2025 18:18:33 +0300
>> -Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake=
 4+
>> - compatibility
>> -
>> -Fix:
>> -
>> -| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
>> -|   Compatibility with CMake < 3.5 has been removed from CMake.
>> -|
>> -|   Update the VERSION argument <min> value.  Or, use the <min>...<ma=
x> syntax
>> -|   to tell CMake that the project requires at least <min> but has be=
en updated
>> -|   to work with policies introduced by <max> or earlier.
>> -|
>> -|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring a=
nyway.
>> -|
>> -|
>> -| -- Configuring incomplete, errors occurred!
>> -
>> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull=
/755]
>> -
>> -Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>> ----
>> - CMakeLists.txt                   | 2 +-
>> - examples/example1/CMakeLists.txt | 2 +-
>> - examples/example2/CMakeLists.txt | 2 +-
>> - examples/example3/CMakeLists.txt | 2 +-
>> - examples/example4/CMakeLists.txt | 2 +-
>> - 5 files changed, 5 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 94185b8..2a0f619 100644
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -14,7 +14,7 @@
>> - #######
>> -
>> - # Set minimum Cmake version and setup policy behavior
>> --cmake_minimum_required(VERSION 3.3)
>> -+cmake_minimum_required(VERSION 3.5)
>> -
>> - if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION} VERSI=
ON_EQUAL "3.20")
>> -     cmake_policy(SET CMP0115 OLD)
>> -diff --git a/examples/example1/CMakeLists.txt b/examples/example1/CMa=
keLists.txt
>> -index 60644a1..44cd053 100644
>> ---- a/examples/example1/CMakeLists.txt
>> -+++ b/examples/example1/CMakeLists.txt
>> -@@ -17,7 +17,7 @@
>> - # DLT example implementation
>> - #
>> -
>> --cmake_minimum_required( VERSION 2.6 )
>> -+cmake_minimum_required( VERSION 3.5 )
>> - project( automotive-dlt-example1 )
>> -
>> - #
>> -diff --git a/examples/example2/CMakeLists.txt b/examples/example2/CMa=
keLists.txt
>> -index 66a4f24..a8efbcf 100644
>> ---- a/examples/example2/CMakeLists.txt
>> -+++ b/examples/example2/CMakeLists.txt
>> -@@ -17,7 +17,7 @@
>> - # DLT example implementation
>> - #
>> -
>> --cmake_minimum_required( VERSION 2.6 )
>> -+cmake_minimum_required( VERSION 3.5 )
>> - project( automotive-dlt-example2 )
>> -
>> - #
>> -diff --git a/examples/example3/CMakeLists.txt b/examples/example3/CMa=
keLists.txt
>> -index 45b7467..4d4958d 100644
>> ---- a/examples/example3/CMakeLists.txt
>> -+++ b/examples/example3/CMakeLists.txt
>> -@@ -17,7 +17,7 @@
>> - # DLT example implementation
>> - #
>> -
>> --cmake_minimum_required( VERSION 2.6 )
>> -+cmake_minimum_required( VERSION 3.5 )
>> - project( automotive-dlt-example3 )
>> -
>> - #
>> -diff --git a/examples/example4/CMakeLists.txt b/examples/example4/CMa=
keLists.txt
>> -index 53a4fad..161c333 100644
>> ---- a/examples/example4/CMakeLists.txt
>> -+++ b/examples/example4/CMakeLists.txt
>> -@@ -17,7 +17,7 @@
>> - # DLT example implementation
>> - #
>> -
>> --cmake_minimum_required( VERSION 2.6 )
>> -+cmake_minimum_required( VERSION 3.5 )
>> - project( automotive-dlt-example4 )
>> -
>> - #
>> ---
>> -2.43.0
>> -
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch =
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>> deleted file mode 100644
>> index 3699b8c83a..0000000000
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>> +++ /dev/null
>> @@ -1,80 +0,0 @@
>> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull=
/544]
>> -
>> -From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 200=
1
>> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Date: Thu, 28 Sep 2023 12:54:23 +0200
>> -Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non=
 amd64
>> - and i386 arcs
>> -
>> ----
>> - src/core_dump_handler/dlt_cdh.h         |  2 ++
>> - src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++=
++
>> - src/core_dump_handler/dlt_cdh_crashid.c |  2 +-
>> - 3 files changed, 36 insertions(+), 1 deletion(-)
>> - create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
>> -
>> -diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/=
dlt_cdh.h
>> -index d572ecf3..8608c6c4 100644
>> ---- a/src/core_dump_handler/dlt_cdh.h
>> -+++ b/src/core_dump_handler/dlt_cdh.h
>> -@@ -55,6 +55,8 @@ typedef struct
>> -     uint64_t pc;
>> -     uint64_t ip;
>> -     uint64_t lr;
>> -+    uint64_t sp;
>> -+    uint64_t fp;
>> -
>> - } cdh_registers_t;
>> -
>> -diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_=
handler/dlt_cdh_cpuinfo.c
>> -new file mode 100644
>> -index 00000000..03509fda
>> ---- /dev/null
>> -+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
>> -@@ -0,0 +1,33 @@
>> -+/*
>> -+ * SPDX license identifier: MPL-2.0
>> -+ *
>> -+ * Copyright (C) 2011-2015, BMW AG
>> -+ *
>> -+ * This file is part of COVESA Project DLT - Diagnostic Log and Trac=
e.
>> -+ *
>> -+ * This Source Code Form is subject to the terms of the
>> -+ * Mozilla Public License (MPL), v. 2.0.
>> -+ * If a copy of the MPL was not distributed with this file,
>> -+ * You can obtain one at http://mozilla.org/MPL/2.0/.
>> -+ *
>> -+ * For further information see http://www.covesa.org/.
>> -+ */
>> -+
>> -+/*!
>> -+ * \author Gianfranco Costamagna <locutusofborg@debian.org>
>> -+ *
>> -+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n
>> -+ * License MPL-2.0: Mozilla Public License version 2.0 http://mozill=
a.org/MPL/2.0/.
>> -+ *
>> -+ * \file dlt_cdh_cpuinfo.c
>> -+ */
>> -+
>> -+#include "dlt_cdh_cpuinfo.h"
>> -+
>> -+void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)
>> -+{
>> -+/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct =
*)prstatus->pr_reg;
>> -+
>> -+    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
>> -+
>> -+}
>> -diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_=
handler/dlt_cdh_crashid.c
>> -index bca44e0e..8dd98d70 100644
>> ---- a/src/core_dump_handler/dlt_cdh_crashid.c
>> -+++ b/src/core_dump_handler/dlt_cdh_crashid.c
>> -@@ -30,7 +30,7 @@
>> - #include <stdio.h>
>> - #include <string.h>
>> - #include <errno.h>
>> --#include <asm/prctl.h>
>> -+#include <sys/prctl.h>
>> - #include <inttypes.h>
>> -
>> - #include "dlt_cdh.h"
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch =
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>> deleted file mode 100644
>> index fd36480456..0000000000
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull=
/567]
>> -
>> -From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00 200=
1
>> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Date: Mon, 13 Nov 2023 12:37:23 +0100
>> -Subject: [PATCH] dlt_cdh:
>> -
>> -Make sure on 64 bit we read an ELF64 structure.
>> -Otherwise we get a read error, and the context file is missing some g=
ood
>> -to know information
>> ----
>> - src/core_dump_handler/dlt_cdh.h | 7 +++++++
>> - 1 file changed, 7 insertions(+)
>> -
>> -diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/=
dlt_cdh.h
>> -index 8608c6c4..3dac480a 100644
>> ---- a/src/core_dump_handler/dlt_cdh.h
>> -+++ b/src/core_dump_handler/dlt_cdh.h
>> -@@ -45,10 +45,17 @@
>> - #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
>> - #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
>> -
>> -+#if ((__SIZEOF_POINTER) =3D=3D 4)
>> - #define ELF_Ehdr    Elf32_Ehdr
>> - #define ELF_Phdr    Elf32_Phdr
>> - #define ELF_Shdr    Elf32_Shdr
>> - #define ELF_Nhdr    Elf32_Nhdr
>> -+#else
>> -+#define ELF_Ehdr    Elf64_Ehdr
>> -+#define ELF_Phdr    Elf64_Phdr
>> -+#define ELF_Shdr    Elf64_Shdr
>> -+#define ELF_Nhdr    Elf64_Nhdr
>> -+#endif
>> -
>> - typedef struct
>> - {
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
>> similarity index 91%
>> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
>> index 82edde6c9d..838a619a42 100644
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
>> @@ -17,12 +17,11 @@ DEPENDS =3D "zlib gzip-native json-c"
>>   SRC_URI =3D "git://github.com/COVESA/${BPN}.git;protocol=3Dhttps;bra=
nch=3Dmaster \
>>              file://0002-Don-t-execute-processes-as-a-specific-user.pa=
tch \
>>              file://0004-Modify-systemd-config-directory.patch \
>> -           file://544.patch \
>> -           file://567.patch \
>> -           file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set=
-by-user.patch \
>> -           file://0003-allow-build-with-cmake-4.patch \
>> +           file://0001-Fix-compile-failure-related-to-gzlog.patch \
>> +           file://0001-Fix-kinds-of-build-failure.patch \
>> +           file://0001-Fix-build-failures.patch \
>>              "
>> -SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
>> +SRCREV =3D "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
>>
>>
>>   PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd=
', ' systemd systemd-watchdog systemd-journal ', '', d)} \
>> @@ -71,4 +70,5 @@ FILES:${PN}-doc +=3D "${datadir}/dlt-filetransfer"
>>
>>   do_install:append() {
>>       rm -f ${D}${bindir}/dlt-test-*
>> +    sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}/usr/lib/pkgconfig/automot=
ive-dlt.pc
>>   }
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125263): https://lists.openembedded.org/g/openembe=
dded-devel/message/125263
>> Mute This Topic: https://lists.openembedded.org/mt/118341597/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


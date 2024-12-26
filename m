Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67414E7718B
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 01:25:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15852.1735176338772975525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Dec 2024 17:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2090c9c6a3=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ1AjdA021668
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 17:25:38 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2pbqeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 17:25:37 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BQ1LjjB003870
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 17:25:37 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2pbqeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 17:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMShXJJWAjyMYY7lAlLIV/OvxGvh3EcA2lGqXKXnROMQq7wngXbVIHEaK2dw5+VjvZhKr6tqLQz4D2Fe3dFaV/9YwKQqqzbY5NEpnmosuVKRTcpXJlVNo1PmMy0NmtaRTXjIS5iIdjpH8UNX/m2pqzI72eCfzuoKijz41eDrmAgK9Rn/3Kzxj+E2pIYGN42CTAvkcnFWQEhby5nEKl1YjxzfWxmT/N/OERfEoVCzIhNDIEQ1H/brdmzg2aAFwwJ06Oi+2ESr86Act5wfwMT8s6+g6JZhHkCM9lIPqfAwzAaDp1Z4CRrsurVdutfNnIClUOHjvHzbZhi/4aNPLiLiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBuPvTwLuBFdI/+PchHcso/d6h4gw/OBDwvQCtSCvrE=;
 b=nwXC+O8zJOalOVa5n2qR/DbR/ay6VBM9qqfya5vZKbuj+Khl9cE/7P/KpB5ymAV7K4eHE5ay8RwtiXf0B8IjXxMCWYmAwEsMB+DcMSP3Q/xw5weI51ZuxDMqX+cMti3QlegV4fYsCQjmNxMiiHOQq6PIQnlmlhX9fINUwHsKsnzfaKvtuxcEOmh0l0y9N9JzYVi641O7xiUNQ+p0vhCJRJ0BpRVJbwueTDU++TCIaqGjxBD92G/GUCq0IuHRiAe2fU3I7YE4NdE9VcaQfd6mjw9X8z0S1Q7dKbVV3PpHaoO7QlcjtZPPOeUditdX73/a047+PpzP8ebThQZ3PG8yOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Thu, 26 Dec
 2024 01:25:29 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%6]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 01:25:29 +0000
Content-Type: multipart/alternative;
 boundary="------------7nnCStohuZpwm6L0aBncyB5P"
Message-ID: <ce05b6f6-a7fd-457e-a04b-5e41891f394e@windriver.com>
Date: Thu, 26 Dec 2024 09:25:23 +0800
User-Agent: Mozilla Thunderbird
From: Changqing Li <changqing.li@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] asio: Add ptest support
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        "Yu, Mingli" <mingli.yu@windriver.com>
References: <20241010063553.2075150-1-mingli.yu@windriver.com>
Content-Language: en-US
In-Reply-To: <20241010063553.2075150-1-mingli.yu@windriver.com>
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 3838a3d7-0478-46d3-7bd5-08dd254c2e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1Y0YzU2MG5kTE91NWlaUGtHdXJhbHovT05STG53bXUvak5PdDdJMXhtaU9V?=
 =?utf-8?B?U0JYMGgxcHBhUWZ3Z2lKRW1MTlAveVhvOG5CSWtLVkx2TmkvT2FYdXVNN3BQ?=
 =?utf-8?B?SFRBQ2ZEdGdZeE0rSFNOTFhBcU0vQkh3L25IY3hleCtpWGRHUWgwMXhYK2F3?=
 =?utf-8?B?UzU5alQwNjRMWkhvSW5nbEFBOGxsWjZXZk1SMWU4QjJhRXhpandIbHZqNDZX?=
 =?utf-8?B?Rzk5Mk5Xck5uaVZXbTl0TEJuSzZIR2pZbjhvYWVhUkdENWQ1TlkvQTN2c0dq?=
 =?utf-8?B?K0xWejMwNG1SV01KNzNiV01lMXRhMlhLUHpOckthZ3VNOEIxcGg0Q3k5ODla?=
 =?utf-8?B?dUs4bjhENXhqQm5ueGxOMkl5RUcxNHpNMlhaRk5Fc0Rmcms2UUZoeVdua2w0?=
 =?utf-8?B?TXBFZkQ2UXpoRWszOWRqNDNjS0dZWk9HbVhKKzhrMXZhMVhMbkpEdGIwZDZh?=
 =?utf-8?B?THFEQXp5UDE3eER2TW9xRXRZajRFTkpmTUlHUDZzdFN2RDErOHVIeWdJQk1N?=
 =?utf-8?B?eXMvQ2UrdFhINzJaUlFGYVo4VjdYMjRQeW5URVNnZ3djT3VJMFc0SjMxUE5r?=
 =?utf-8?B?QzErTEE5LytMbTFhMHh3UmJ1MFFaUUZFN0M1MkYzdWZKSk93QkwyeDdzdktE?=
 =?utf-8?B?bmx1bExPaTlPK2JDNlFyNlllamRWUmVHSnlTd3dRZjlBalVoVFNaanlkblVO?=
 =?utf-8?B?UXhjNEhTSU1LNGhnTnY2MXIxZnlCSkZCV3Irb2JIYUc2dzlCd1VpRE5uR3lW?=
 =?utf-8?B?UWZLZjhRY3RrMS9TSlFNa3hLRExyVW9VcGlzWjBxUlorM2c3YUMzSmFmbE9a?=
 =?utf-8?B?MVc1Vlh2cVVNOU4wOVhndkdCNjVOd3NpSHZWcUpDbWhwSFZMOGc5ZUhEQXZa?=
 =?utf-8?B?emhCZzNXbnZqbDdPNklrd1hCWkhkM2NONitibXlYQ3FvUEhkTnlUdlVwL0FO?=
 =?utf-8?B?N2FWTTJlMWxHdURFSUxPOGFpZHdOY1VneFd6SFFkUUhkNWZGTHVpa1I4Y1JN?=
 =?utf-8?B?ZWV3dW90VGwzOGxjZGtRa293MnZLd3o5bGg1ZUFtbWgwc2o2bjdObTJvZWRy?=
 =?utf-8?B?dmdUUXl4OGtocmpsMVBNSWZOVnlqZCtDK3FNakhRdE95NFd2UUxkMVA2MHNo?=
 =?utf-8?B?Q3VqLzRKRi9ObjdWdW9rTVpsYnFmVFRiZWE2YzBCNElhK2JyU3JySTZSazZH?=
 =?utf-8?B?cFFFRm9aR0FCbDlnNllxUkhpaFl1NUxjSTVVTE9zNlhibEV1TFVnbW9PMG9U?=
 =?utf-8?B?NHRuVVNXTkk5NFhxR1UwaW9WM0VVaUJKajRFMFI3MG5Tam01QjlmOG9HQ1ln?=
 =?utf-8?B?VkxwMXdTQklKVlJSVjAzVGl2S2c4U3U3NlVOOGN5UG9GeEFhbTRQTXVNRDNM?=
 =?utf-8?B?VUh4d2tVTHZsVjNHOHdVQnRLQUVVcVk0MFl0MlhvQXpGa0c1ZmRnVktSaGRu?=
 =?utf-8?B?cTRLNi92S2JyRjNXYUNrV3kybVlWUndKUC9PZjhrZXJYQnFiUkdrV1dPc2t4?=
 =?utf-8?B?UHJEdk9NYmlNNytMb2dZcElkbVVDOFFuTDJ0VW1iME4wVkxJZXRSODhSb3da?=
 =?utf-8?B?L1RSQ3BscjlzQmdvWTFPditHbnhTWEhXOTVtREhDdWJkM3o1ZzV1N2dHOElF?=
 =?utf-8?B?T3VDMGpEbXVyeG94RWtTQnpjWTRLdUxybkxOdTRJSFBCOFZHbTFteXZCazQr?=
 =?utf-8?B?RjVMa1FCQ2tub05lUHIxZU45ZUdHbUhtRjhuNFFwU282T0V2VlI2eWZmblRs?=
 =?utf-8?B?ZEEvaHFVVzFSNWJRWlZVbkhCZjhGdi92RTNucnEveDFXQ2dIYVJRa3ZRNnhP?=
 =?utf-8?B?cUpCcnRaY2JBNlhKRzZvZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elo3S015eWN0UzJWK1FVNGYwYWREL2tUYlFsWFBsVmE0VGdTazgzcWhUMkVp?=
 =?utf-8?B?MzZNNkk3eFFVUEpzZ2hZaDArV1UxTUd0VnZBdkdFUG5GTXFUY1d1YzlsT1U2?=
 =?utf-8?B?WWFIazFEOWNOeGo5MGtTUDdYQ3pxb2lPSjRLa0ZJcC8xOGF2aVdBYmdZRDNZ?=
 =?utf-8?B?eE9DMC81QWZ4alNZRzgvY0FYOEpRQ29QL2tzZmg5SWhyWTlkSzhSRStFd2Rv?=
 =?utf-8?B?RXdzQ2k3dEdZU0xWSWRvNTB4QVU2RzRNTG5NaU1Td21LeUxId2YxSFFzU1c4?=
 =?utf-8?B?a3QxNHhJRVNXN1g2UHl2U2FvQ1dMdEsrOEk5dGh2NmRGS0tYSXFPMkgwM3Vk?=
 =?utf-8?B?czhFRFJVUzJnZ2lxdzJaZWd1Yzdrc0YvZ0Z1dGF0aDFWcnU0TlRhdVZ3cG4w?=
 =?utf-8?B?NzV0VWZoSWl1WUFEc1pVK2RPNDlIZWNwS1ZoSFZQYXRSZzJ3Ykc5c0FzOC9q?=
 =?utf-8?B?L0ZTNDNsOU9mTUpMZm9wUHIrUXJHRXBzcnpqUVQwdmZyRWR2KzZwWFZDSFBN?=
 =?utf-8?B?c1dLUVBlZVA0Y2xIeGNsVDg0ZW9yeDZIQUU5ajYremtjWHMways3bStRU28x?=
 =?utf-8?B?cGdxR3ZETTVRUy9acXQ0RkVDeUUya04rOG5mOTVRVTZxM01XV05RS0pQZDhO?=
 =?utf-8?B?VXJ4WU9RQUlBSTJQdG43eDhEMFl2NWxzSFRxNzNENDkvSDFpQWVieVN4UnR4?=
 =?utf-8?B?NXFIRUtwWnhmZW9wZnpDc1RkTWpxSURmRk9XODk0ejdNTFhZaTQxekViLzdC?=
 =?utf-8?B?bndvRDgrbk1OMjM2OFBzaGszaUNKT3NHZE54SDA2M1h1NHozZGhNZUFUK0lk?=
 =?utf-8?B?K1FqR2srNTNHSFEwOWQyb0EzdVp6eWVZVWJ3Vlh4R0t2L2JudUJZNVFBZjJX?=
 =?utf-8?B?VWZzRmRHKzRqTUZPQ2V6M2ozMmxpRWhsVkI1YmIwY3lKbGtJVVpGeUxTY3h5?=
 =?utf-8?B?SzJNQUJmMFdTK0VDL2VLZmVsbEx6ZzJOMSswRFVlT1JBRHlMVHhEaFZ3NHFm?=
 =?utf-8?B?NGk3UkFPck1NenJtK3dGdWViNExwNkhmVEJmZ0ZrbDB1T1RQSFZKaGFqV00z?=
 =?utf-8?B?YzRMZUpVLzdkRFgva0VwSnk1c25hamUxd1A1N2xmM3NRcUlsU0ljdlUrRFl0?=
 =?utf-8?B?UGxMZC8wa2V3bGI1ZXdvUU14MW5Qc2wrOXo2YWV4eHc3V2kwam05YTdYbmQ0?=
 =?utf-8?B?NDAwUnorZ3drdzllTFpDZnVXTjdKOCs3RHpaRTZKcVE2dVpUMFRuS2RZV3oy?=
 =?utf-8?B?QWNOdXJEQkpBYjJ4MlVLRkptTkgxWW4rb1prYUpsYXZTNm9PS3ZVY2dqYTNZ?=
 =?utf-8?B?bkhlNE5qQUVMM3NHNnFTbXUwOEpyai9VRUY5OXYwMllZcEw5Zm9PUERnQWFM?=
 =?utf-8?B?TkUwOTJuQWpnRTdyMnFGUXhjeWVSVlpKK01QUU9xMkpFTjMzQ3Z4b3R1Wkgx?=
 =?utf-8?B?WDZSVWorMHRLWGoyZ045QkttckhkdkdSTEtFRFZaVjRpazJNVEkybnlibDJV?=
 =?utf-8?B?MC8yVzl5elBGdnNlaHlJT0V4dmI1N25HTTB2Mm9LUUFqMDREeUVhQnJUNkZ3?=
 =?utf-8?B?WW40aXBvOFM4YTBRMHhZTjhuMk12dUFvdW05Y0RCdHJGeVh0ZlB1ekZBQUY2?=
 =?utf-8?B?MDY2ekxVcFJDbTRMVHljZ0xBdzRXaGhFa0JqYTFHQ0VjS2hjRmd4ZitEb1Nw?=
 =?utf-8?B?MXR0ZERROGFKeVFBRHY4dys0OHBBek5BaU5RUDZZYzE2WnFkWE9GMnR5S01Q?=
 =?utf-8?B?VXY4OEJBa1lPVnZEcm5yWWJLZi9obWlTeU1jdURqRnVaUzlMdlFZR1FhYTJ2?=
 =?utf-8?B?UkZEUmY1MGh0d25kR0V4NWZhVDdORVcyRzVHOG9PZ1VyaTd2VGl2NkVGUS9r?=
 =?utf-8?B?MGgrdUhZVHZwUm1KdUM2aExwNE5yQlZvRHZaK2ErNFZ1NDlIczJDT29WeTlu?=
 =?utf-8?B?WElnMWxrSlQxR2NDR0dsazg4V1lDa3Fadk9NRmc3QXZkVG1adVNPT1htdnRV?=
 =?utf-8?B?UG1WSlZyLzhoVXgvd1c3S0dnQ1hnZS80OUV3ZEkyTnY1VS9hRUpuRGRvREFk?=
 =?utf-8?B?ZjdHdloyT2p5U2FCMHRHZTUyWWFUQ0M1azZHVTBycWQrV2hNcCtpWUduWFpZ?=
 =?utf-8?B?Y0ZJM3N5Q2Z1VHNHWnIwdDVYTy9SWGdTYTRid2NoS0lKaDlnWFVOQnR2MkU4?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3838a3d7-0478-46d3-7bd5-08dd254c2e73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 01:25:28.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcKxi8bfjsmrKqF6jg47Y7feOcYnWxHOeWUhBLHKq/CyNU6gU/xG3sDqvbX5zzFrPt7D7rS15UtWfsXNYlhUKQMQUUTBSVEQMrjqoXfg0Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
X-Proofpoint-ORIG-GUID: _Aeu2w6uGsO4SZVISaPrH8jsuPOBogyq
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=676cb091 cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=Q24paGs-jzpXxyqpAn4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tbGGNF_Nib-f-6Ykcm8A:9 a=rpeyWesrnzGxNGrY:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o9IjJH2i4sUyz_uNxGk6c-RxybrNLgUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-25_08,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412260009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114550

--------------7nnCStohuZpwm6L0aBncyB5P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BQ1AjdA021668

Hi, Armin

Could you please cherry-pick these 2 patch into=C2=A0branch scarthgap? I =
have=20
tried that it can be picked successfully, and compile successfully, Thank=
s

Regards

Changqing

On 10/10/24 14:35, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu<mingli.yu@windriver.com>
>
>   # ./run-ptest
> PASS: address
> PASS: address_v4
> PASS: address_v4_iterator
> PASS: address_v4_range
> PASS: address_v6
> PASS: address_v6_iterator
> PASS: address_v6_range
> PASS: any_completion_executor
> PASS: any_completion_handler
> PASS: any_executor
> PASS: any_io_executor
> PASS: append
> PASS: as_tuple
> PASS: associated_allocator
> PASS: associated_cancellation_slot
> PASS: associated_executor
> PASS: associated_immediate_executor
> PASS: associator
> PASS: async_result
> [snip]
>
> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> ---
>   ...tests-Remove-blocking_adaptation.cpp.patch | 37 ++++++++++++++++++=
+
>   meta-oe/recipes-support/asio/asio/run-ptest   | 19 ++++++++++
>   meta-oe/recipes-support/asio/asio_1.30.2.bb   | 19 +++++++++-
>   3 files changed, 73 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-support/asio/asio/0001-tests-Remov=
e-blocking_adaptation.cpp.patch
>   create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
>
> diff --git a/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocki=
ng_adaptation.cpp.patch b/meta-oe/recipes-support/asio/asio/0001-tests-Re=
move-blocking_adaptation.cpp.patch
> new file mode 100644
> index 000000000..5aa502916
> --- /dev/null
> +++ b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adap=
tation.cpp.patch
> @@ -0,0 +1,37 @@
> +From 7d76513b82a67e117d195a1b5a0d6c2e8591488b Mon Sep 17 00:00:00 2001
> +From: Mingli Yu<mingli.yu@windriver.com>
> +Date: Thu, 10 Oct 2024 13:58:38 +0800
> +Subject: [PATCH] tests: Remove blocking_adaptation.cpp
> +
> +The test failed to build with clang as below.
> +../../../asio-1.30.2/src/tests/../../include/asio/execution/blocking_a=
daptation.hpp:216:13: error: call to 'query' is ambiguous
> +  216 |             conditional_t<true, T, P>::query(static_cast<P&&>(=
p))
> +      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +../../../asio-1.30.2/src/tests/../../include/asio/execution/blocking_a=
daptation.hpp:213:29: note: in instantiation of exception specification f=
or 'query<asio::execution::detail::blocking_adaptation::allowed_t<>>' req=
uested here
> +  213 |       static constexpr auto query(P&& p)
> +      |
> +
> +We can add the case back once the above build failure resolved then.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> +---
> + src/tests/Makefile.am | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
> +index 04f8a03..eab2d56 100644
> +--- a/src/tests/Makefile.am
> ++++ b/src/tests/Makefile.am
> +@@ -68,7 +68,6 @@ check_PROGRAMS =3D \
> + 	unit/error \
> + 	unit/execution/any_executor \
> + 	unit/execution/blocking \
> +-	unit/execution/blocking_adaptation \
> + 	unit/execution/context_as \
> + 	unit/execution/executor \
> + 	unit/execution/invocable_archetype \
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/reci=
pes-support/asio/asio/run-ptest
> new file mode 100644
> index 000000000..d37db0b31
> --- /dev/null
> +++ b/meta-oe/recipes-support/asio/asio/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +ptestdir=3D$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +tests=3D$(find * -type f -executable)
> +
> +rm -rf test.log
> +
> +for f in $tests
> +do
> +    if test -x ./"$f"; then
> +        if ./"$f" > test.log 2>&1; then
> +            echo "PASS: $f"
> +        else
> +            echo "FAIL: $f"
> +        fi
> +    fi
> +done
> diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/reci=
pes-support/asio/asio_1.30.2.bb
> index 6930381ec..1f492b71e 100644
> --- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
> @@ -8,9 +8,12 @@ LICENSE =3D "BSL-1.0"
>  =20
>   DEPENDS =3D "openssl"
>  =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
> +file://0001-tests-Remove-blocking_adaptation.cpp.patch  \
> +file://run-ptest  \
> +"
>  =20
> -inherit autotools
> +inherit autotools ptest
>  =20
>   ALLOW_EMPTY:${PN} =3D "1"
>  =20
> @@ -22,4 +25,16 @@ PACKAGECONFIG ??=3D "boost"
>  =20
>   PACKAGECONFIG[boost] =3D "--with-boost=3D${STAGING_LIBDIR},--without-=
boost,boost"
>  =20
> +TESTDIR =3D "src/tests"
> +do_compile_ptest() {
> +    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
> +    oe_runmake -C ${TESTDIR} buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    # copy executables
> +    find ${B}/${TESTDIR}/unit -type f -executable -exec cp {} ${D}${PT=
EST_PATH}/tests/ \;
> +}
> +
>   BBCLASSEXTEND =3D "native nativesdk"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112758):https://lists.openembedded.org/g/openembedd=
ed-devel/message/112758
> Mute This Topic:https://lists.openembedded.org/mt/108924492/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------7nnCStohuZpwm6L0aBncyB5P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi, Armin</p>
    <p>Could you please cherry-pick these 2 patch into&nbsp;branch scarthgap?
      I have tried that it can be picked successfully, and compile
      successfully, Thanks</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 10/10/24 14:35, Yu, Mingli via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241010063553.2075150-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

 # ./run-ptest
PASS: address
PASS: address_v4
PASS: address_v4_iterator
PASS: address_v4_range
PASS: address_v6
PASS: address_v6_iterator
PASS: address_v6_range
PASS: any_completion_executor
PASS: any_completion_handler
PASS: any_executor
PASS: any_io_executor
PASS: append
PASS: as_tuple
PASS: associated_allocator
PASS: associated_cancellation_slot
PASS: associated_executor
PASS: associated_immediate_executor
PASS: associator
PASS: async_result
[snip]

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 ...tests-Remove-blocking_adaptation.cpp.patch | 37 +++++++++++++++++++
 meta-oe/recipes-support/asio/asio/run-ptest   | 19 ++++++++++
 meta-oe/recipes-support/asio/asio_1.30.2.bb   | 19 +++++++++-
 3 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
 create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest

diff --git a/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
new file mode 100644
index 000000000..5aa502916
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
@@ -0,0 +1,37 @@
+From 7d76513b82a67e117d195a1b5a0d6c2e8591488b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Date: Thu, 10 Oct 2024 13:58:38 +0800
+Subject: [PATCH] tests: Remove blocking_adaptation.cpp
+
+The test failed to build with clang as below.
+../../../asio-1.30.2/src/tests/../../include/asio/execution/blocking_adaptation.hpp:216:13: error: call to 'query' is ambiguous
+  216 |             conditional_t&lt;true, T, P&gt;::query(static_cast&lt;P&amp;&amp;&gt;(p))
+      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+../../../asio-1.30.2/src/tests/../../include/asio/execution/blocking_adaptation.hpp:213:29: note: in instantiation of exception specification for 'query&lt;asio::execution::detail::blocking_adaptation::allowed_t&lt;&gt;&gt;' requested here
+  213 |       static constexpr auto query(P&amp;&amp; p)
+      |
+
+We can add the case back once the above build failure resolved then.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ src/tests/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
+index 04f8a03..eab2d56 100644
+--- a/src/tests/Makefile.am
++++ b/src/tests/Makefile.am
+@@ -68,7 +68,6 @@ check_PROGRAMS = \
+ 	unit/error \
+ 	unit/execution/any_executor \
+ 	unit/execution/blocking \
+-	unit/execution/blocking_adaptation \
+ 	unit/execution/context_as \
+ 	unit/execution/executor \
+ 	unit/execution/invocable_archetype \
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/recipes-support/asio/asio/run-ptest
new file mode 100644
index 000000000..d37db0b31
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+ptestdir=$(dirname &quot;$(readlink -f &quot;$0&quot;)&quot;)
+cd &quot;$ptestdir&quot;/tests || exit
+
+tests=$(find * -type f -executable)
+
+rm -rf test.log
+
+for f in $tests
+do
+    if test -x ./&quot;$f&quot;; then
+        if ./&quot;$f&quot; &gt; test.log 2&gt;&amp;1; then
+            echo &quot;PASS: $f&quot;
+        else
+            echo &quot;FAIL: $f&quot;
+        fi
+    fi
+done
diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/recipes-support/asio/asio_1.30.2.bb
index 6930381ec..1f492b71e 100644
--- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
+++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
@@ -8,9 +8,12 @@ LICENSE = &quot;BSL-1.0&quot;
 
 DEPENDS = &quot;openssl&quot;
 
-SRC_URI = &quot;${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2&quot;
+SRC_URI = &quot;${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
+           <a class="moz-txt-link-freetext" href="file://0001-tests-Remove-blocking_adaptation.cpp.patch">file://0001-tests-Remove-blocking_adaptation.cpp.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+&quot;
 
-inherit autotools
+inherit autotools ptest
 
 ALLOW_EMPTY:${PN} = &quot;1&quot;
 
@@ -22,4 +25,16 @@ PACKAGECONFIG ??= &quot;boost&quot;
 
 PACKAGECONFIG[boost] = &quot;--with-boost=${STAGING_LIBDIR},--without-boost,boost&quot;
 
+TESTDIR = &quot;src/tests&quot;
+do_compile_ptest() {
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' &gt;&gt; ${TESTDIR}/Makefile
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    # copy executables
+    find ${B}/${TESTDIR}/unit -type f -executable -exec cp {} ${D}${PTEST_PATH}/tests/ \;
+}
+
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112758): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/112758">https://lists.openembedded.org/g/openembedded-devel/message/112758</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/108924492/3616873">https://lists.openembedded.org/mt/108924492/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------7nnCStohuZpwm6L0aBncyB5P--


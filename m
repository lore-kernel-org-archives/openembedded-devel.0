Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915FDC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 06:46:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2893.1741675581058365494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 23:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51653d9f7a=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B5dJbX017999
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:46:20 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27au30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:46:20 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52B6kJkQ023091;
	Mon, 10 Mar 2025 23:46:20 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27au2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 23:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUKXtWl3RkvRxflrnNmrHxuBqPz5tritUv8tAUy5TXKncQavPm2EqWEXeOQCzICYX2G67rVAG+GrA1CGTKlN+ZoGISTVjFmLJeJvtsK3RKE/lOo9yCIexN+0N8IQfkdi2B4POTb+o+nBaQutM5qwggoMrdMDLvqQTlB5h8eZaVGJKrt6GgCXzPAS+MZLb1RLHwjg5RefRCXkdl49wOo4+cjWrrPPNBTdjEIQvDNFwiQYVYdnPzB78/8Aimgkww3daqdBmy7UUeWqiFNy+elBZ2S9cCfZ061YKKKVt7XBVTOTHWoKph7729Sp/t8dEfT4wPX9iD/jFNS2FpPb8wET4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea3IJBfsiAZrLIWvqo+zTGmN8lZKqRiygWab8IL+xS8=;
 b=J6R26RVHV8kBSdcOpS930CUktElSzzlLuZO6GChBMmI4rdMvYdX6OO6gKVnxhGBRnRAqzi9GoAj3XhMxNVw9z5TQRHMNFfgTHZV2AV1pYMO4+AKSAT8rUxNBVd/IjITxdXAci/u/Y2KTpjNvyznSw1uYrGwNcZAJ/UfwOMWcfMLlAUguISiNJEexKY7IYavc2Ykf1BmblE2pLCAUDjZ+vLIGn8vrWObBm9VVdXnnT3hCC56c5EjHqDoKLgONxfYAit4AtZv6q9qntdhfeCc7gYuBoO6yf640rpYQCpPUACqOFLbKMlG8ENFnStlQA3956kb5dijc4lDAQjfmKPgAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:46:17 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 06:46:17 +0000
Message-ID: <87c244ae-a200-429a-8768-5a6e90649958@windriver.com>
Date: Tue, 11 Mar 2025 14:46:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-networking][PATCH] net-snmp: fix memory
 leak
To: Gyorgy Sarvari <skandigraun@gmail.com>, piotr.l.lewicki@hitachienergy.com,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "akuster808@gmail.com" <akuster808@gmail.com>
References: <1825C99274128577.23135@lists.openembedded.org>
 <388ca5e6-0384-42ca-9f1d-3ed83b2ec644@windriver.com>
 <AM6PR06MB4262D2FB372E059E4DBEBE48ABD62@AM6PR06MB4262.eurprd06.prod.outlook.com>
 <e0a79027-7cec-4081-b061-f254e895e60b@gmail.com>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <e0a79027-7cec-4081-b061-f254e895e60b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|SA3PR11MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da4fa9e-30e3-47b2-e6f8-08dd60686c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjNtbkZVTmd2OFdqZWE5cmhwWmZPSzJlRmlJTE5WK0cwZktxSzVWaHpPeXpv?=
 =?utf-8?B?bzNmQTI5RUhVWDFlMFBFRzEwNUFVWnJtUEdwZVdNU29DbTU0ODZ2cFQyelpX?=
 =?utf-8?B?QUZDQmRjbWFKM0Zvbk9CbzlSSTlQTjNsNTR1TFRDNjNGMnhXWWhHYmliQXFB?=
 =?utf-8?B?TmxxTkFySU56T0lEOHd2am1DTG43cFpuUmJ5Ti9zTXArcGRZYTNPTFVrVGR5?=
 =?utf-8?B?cCtrdjNJcjg3ZG5lM3Q0aTBlVUZsUUZIMXFFZTQzRy9QWHp6a3h1Vmd5WFM1?=
 =?utf-8?B?U0IwRXpITUY4NTE2OFlsdndTSW5pZk52Y3hIT1FMNTU5cUhlZDdTbDA1K3RY?=
 =?utf-8?B?T3QrZXg4MjloV3pWalNEMUYramZFNkxnR3E4d0ZyR2sxRkU1eEs3RjR4clQ4?=
 =?utf-8?B?dDN6aXZDSXpSZ2lWRVZPRERWV1l3ZVZDckhQL3Q4SDQyeTR5NkIxb2IrZERa?=
 =?utf-8?B?V0NXUFJKRFYwaDdua3NCakVQUXQ4ejQ1UVM4Q0E4NWhxQ2paU3BLMCtEWHpV?=
 =?utf-8?B?dEU0SzZoNklYRG8rem9pc3hsak1FVEdUb3B3TEtSTW9qZ2R5blNOMm43cUs2?=
 =?utf-8?B?NElmY2o1ZGVoa3BQTUVaLy9sOVhXT3lTNkI1OGZqaWJPMlQvc1FyUkRIY2h6?=
 =?utf-8?B?cFd3YVk4YkVheFlid2tEUEZ2bDczTXZaNzJqS05JUjVHQ0QrMWpuQ2cwa2xU?=
 =?utf-8?B?QjhtNW9EUTdCZHc1TFFIaGFCelFPemxQbzNBOHNVMVNUNC9hV1hUNjV2eDJk?=
 =?utf-8?B?RnZ5a1gzZG5DV3dFcnQrdHE5TGZUb1JXUURjdkxrTmhWQWMyUXAvczNBWFZm?=
 =?utf-8?B?d0E0L3NJNFJ0TlFPMG9GU1Jmc2dIVzBRRWljckVCNnd5TTFLY2J3aHRUcTFK?=
 =?utf-8?B?WnRwU3BZK2RZYXgrVTEyd0gvd0xFSWRLOFZycnEvVUhwVk5TK0tZbmxBem1a?=
 =?utf-8?B?ZkFGNm9DZXB5VVkxTDJlWmEySGU3a0VlM2pqK3U3ZklzNmxvQWc5M2d1VlZs?=
 =?utf-8?B?amE3UHEveVU1UWt0cUViWmk0RjdOeWg2UCttVzhmc2Uyb2pxTU91WXdBT3lk?=
 =?utf-8?B?cUllVXZvTUhwN1ZMQmIzcHNJTlVNb2EvZE0vZ0IwU0RFa1VyeXcwcDEyclNR?=
 =?utf-8?B?S3hzNkJRRFZ5c1pHYWltdkJPcTJUOHAxTk51bSsxWHlTYXAwenhYbkx6RzVW?=
 =?utf-8?B?L3cyNENqQUFxWS9TZFJUelRHeFlUbFZpMUZrczYzeUxjSVFma0xZazNxblRm?=
 =?utf-8?B?V1p5S01DREM5MkFVa2k5bjdEL2tCdjFiYmt3QmEzMysxS05xcFlKMWJUM0hh?=
 =?utf-8?B?VkdpQjZOUG0vTG1YOVJORXVxeXg2NDc2aHJxQXROb29kN3JPZnl0VUJLMGI1?=
 =?utf-8?B?RnhtUWQyMmJkeHN1bjhzV2ZOWWJJd05RSUVwTlpVeDc5QXcyUHorcFV2TFNh?=
 =?utf-8?B?a2I3RExsV3BXM01MTjNUWDY2Q3ZDVVRwUVErWWx2aS8wMGlSQ1A4c0JJRUdU?=
 =?utf-8?B?Q0YwMVdEbmFKdWZaWFlYbGhsR1NtR1d3U2VlekxhTWRxenVTWkNZVFY3Nm9M?=
 =?utf-8?B?ZGh3cGx0N2x5R2NwcTFCQ1JsdFFndEJ5M1FQM0xGemZsRWNHWU0vR2F2OSty?=
 =?utf-8?B?NHpaZ2w4blhhTUIxQ2I3VmUzTEsvQXJqcGQwRHNpWHlHYjB0MVp5djN4TVZ2?=
 =?utf-8?B?SWNid2d3bVI2Q2hJd09wYktnNnB1S3NNTENpTk1jMFo1V3hVMlA5UXNSeUg3?=
 =?utf-8?B?ZWd5Zm04ME9uQjZ0cHZaeEtObXNKSkdycFk4b09FdEhyUFBTbHFRZ1ovZGlx?=
 =?utf-8?B?bFExMkZmUmh2cFZNd3dOdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTdqVGs2NE0yTDNmcWI1U1dXTVZHTmZMenZmR0NpT1JZK0MzM29rT1pkRkhr?=
 =?utf-8?B?UUhMaE1CZUVWWEVuZlhZNnMvUjZJMHJ3a20zYmJFQldIZEtERktjTjFiaGlT?=
 =?utf-8?B?VDducGFJc0VtWGtqazJPTE5rajE2ZHF4aHZQRXhxbVo2Ui82ZGEvMWhWMDNF?=
 =?utf-8?B?WTd0MENoTGxmS3REK3FITmJhWWttbTlXeXA0RUxzaVByRGg2U0FIcGRPWlpi?=
 =?utf-8?B?a3JwNWdPWXdhUyttUUEwRXNuOGlJMWZlTnIxUUtSSm01TlllT2M3SG1Ec0kx?=
 =?utf-8?B?TCtCWE9jZFlTME85aFJ5ZlJJM2tUZ3JOWlZ3cnBWSm5PcS9mWmNwNHNGSGV0?=
 =?utf-8?B?K3QwQjcwazhGQzZ0OUVicGJTdkw5UkE0anA3QlNKcUdpanMrM3ptZUhPN1Ns?=
 =?utf-8?B?YXQwTmg1ZWNIcEk5bmdBajhyNmdiS2o1RityRWRVclZSNEhscDU1WVVuZVdZ?=
 =?utf-8?B?N1BLRmZoZ3ZpV2pJVktnTGxaRVpuNklHaWhoMUhidXlKVDJ3QXYzMkpKdytK?=
 =?utf-8?B?ZVZFQy9LNWZ0Q3crbmtER0p3a3pZY2RVa2FYMmZ2NDhud3l1dGFEU0tpUUdM?=
 =?utf-8?B?bU9RbmwvbjR3WHluazhkSFBVcEdiZkxxam1jT3BmOG1UMTRaaEJ5T3hJemxH?=
 =?utf-8?B?NzhabHJOUVo5ZElkWEhkU1ZXNzFvaXlnc29DS3gydWhSVEw3dkZBdXdkdmJY?=
 =?utf-8?B?YlM0K25HWU1sL05zSUQ3c21wNGNPc3Z6SmJHb3grRzlTRFRkeW1ic1JzVjRv?=
 =?utf-8?B?RmJjUVFtS3hBNityYVdyRDdxdXJUWjJpcFl3c1pISmVMV1FyY2VUUlRITVdw?=
 =?utf-8?B?WjhNZEtDS0lSdEVydU93bnpVSEZRVVk0NjV4emUvNldVTzFWZzIreWZ2djlv?=
 =?utf-8?B?YitCZVhvbzRxRDBnalpLRXNyQVBrSnN0MGt5Y0o1cXJHKzY3NmNRVVQ5UDZ1?=
 =?utf-8?B?VXpFVnFPUnFORjBCK1l2VVhtVXlWeEZIOUtBZE9OWTBablRrY1QwZnF2ZlM3?=
 =?utf-8?B?RTBDazBOMHVETHczb0svb29mMFdhSWlIbHFCbWQxN2ZTcmdRTkpyUi9KazJ1?=
 =?utf-8?B?WjQxaFFodyt2Z3A4YysrdTZyM04yQXpDMzZtZ0o4bTFuNGtYTGQ4UTZuZ2k0?=
 =?utf-8?B?RFdkVUxvR2QwbHBxQzUzZjVXcjVZa3FSdEZXdzNURXdBTWJmRWVzVjltdjJW?=
 =?utf-8?B?RlE4R1N1d3dPVmZkcjdvdVIzN2REVnJMY2VRZ1FzeHpja05LTVNrYjRWZURP?=
 =?utf-8?B?MnY0TXZscExHRnBvRnEyQS9jWk14NWVvUkNkWFdCN0hHajlMYnFYL0c1WHY2?=
 =?utf-8?B?VnowRy94RUtla2ZnbGM3d2hzUXhFNmJVNkcrZXVSdVdVNE9teithY1RwZUg0?=
 =?utf-8?B?Q1hheHVWbzF6V0FlMitYZVZORGVZQy8xMGxvNnpCVlVYYWFEcnFISUo2R1Rj?=
 =?utf-8?B?ZysrZTR2aHpsZGpVUUlUd3BwRlhZbGo5Ny9EeXorVFFCaGlnMGtWcmR5blFT?=
 =?utf-8?B?V1hIRDNXWWJNaXB0czNZSGFPWStCRDBlZW4wREtQV0dWSm52UExQTlA4Yzh6?=
 =?utf-8?B?UDY2K0ltempsVVZxbmswWTNlWUIwZk1vTkxENWpsQlNZNzc4TGlTT3lkM3JI?=
 =?utf-8?B?YWRmZ09SS0dLeE5YbW9DYWRGN1ZRWndkYXZod0c1RUVwSHpoWGhxOWwyOFNa?=
 =?utf-8?B?NHZRcjNQckdCWFM2Y1p6elJ3YjM3RHlBMCtDYjNKVnBoR1dYZnFjTXlNM1F2?=
 =?utf-8?B?eUtGZWl1aVNTSVlGSE4wVGViTkVWbVh0a01ZK2tJUGY2eTdrTEMwVFljMEZj?=
 =?utf-8?B?VWtZZ2grRmdwQUI3QWRtand4dm9SdHZHcjlvbDZjSFViemRjeEdHY20vMlZy?=
 =?utf-8?B?Y2hzNG9CK0toQmN4alhkeUFLM2VtTDM1cU9XaUtWL04rLzJjWlNqTG95UlVs?=
 =?utf-8?B?SnN3TUh2eWFIcjcwa1ZlTVZhdFZrV3BuUVJIeFg2ckF3ZW81ZldDOUZybkpH?=
 =?utf-8?B?K3VOYzlrKzQ0ZmFRWG5ENlJiVWYvQ1NwZXozbUhNa1BoMFRSWW1MTHVQblZj?=
 =?utf-8?B?ZFFxR2Q3YjFBdE9COGd5NEYzMjUrNmE3TEVGYjUzZ2VwaExxa3VIZ3pwMEVU?=
 =?utf-8?B?WGExaUR5Y0RXUWdKcVNNYmlJSTM0d1R0QkhXQ21jUU5hMzdmVjBLWjcrVG01?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da4fa9e-30e3-47b2-e6f8-08dd60686c72
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 06:46:17.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4D93f37g7tcGtl0Jgvsm1jf8FgR7ldJ9YZRgCHH6xrnamietwmZ3tELz7/oQyrYV/ROdQVHCyd05mly8Rfc5YKdgkAOqQJNkTvok81ab0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
X-Proofpoint-ORIG-GUID: TdwAl-HMAKbzZDuugsOrjUKPNxdYmYeQ
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67cfdc3c cx=c_pps a=YTelpZo7+Gv92UPfPuytLw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=_EeEMxcBAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=ThMX_IV2AAAA:8 a=LN_l4lcLAAAA:8 a=j85yC5G_q9asFnJ-TD8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=0jcnvs3wCqEDeep41k2a:22 a=V6Cww4xsrPVQPwKtnwcs:22
X-Proofpoint-GUID: INIkmGX-Firw_J_gJT8qUsrgzG6S7KUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503110044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52B5dJbX017999
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 06:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115843

Thanks for all your suggestions.


I tried to send my patch via "git send-mail", but every time after I=20
saved my patch email, it failed to patch the *.eml in the git repo.

So could you please merge my pull request:

https://github.com/openembedded/meta-openembedded/pull/947


Thanks,

Jinfeng

On 3/10/2025 6:56 PM, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> That character change in the comment doesn't look material for the fix
> to take effect, it could be even left out of the backport completely.
>
> On 10.03.25 10:29, Piotr L Lewicki via lists.openembedded.org wrote:
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@li=
sts.openembedded.org> on behalf of Wang, Jinfeng (CN) via lists.openembed=
ded.org <Jinfeng.Wang.CN=3Dwindriver.com@lists.openembedded.org>
>> Sent: Monday, March 10, 2025 08:01
>> To: openembedded-devel@lists.openembedded.org <openembedded-devel@list=
s.openembedded.org>; akuster808@gmail.com <akuster808@gmail.com>
>> Subject: Re: [oe] [kirkstone][meta-networking][PATCH] net-snmp: fix me=
mory leak
>>
>> [You don't often get email from jinfeng.wang.cn=3Dwindriver.com@lists.=
openembedded.org. Learn why this is important at https://aka.ms/LearnAbou=
tSenderIdentification ]
>>
>> Warning
>>
>> This email comes from outside of Hitachi Energy. Make sure you verify =
the sender before clicking any links or downloading/opening attachments.
>> If this email looks suspicious, report it by clicking 'Report Phishing=
' button in Outlook.
>> See the SecureWay group in Yammer for more security information.
>>
>> Sorry for interupt.
>>
>> Please revert my patch.
>>
>>
>> After I rebase the latest codes from kirkstone. I found my patch had a
>> bad character. This caused net-snmp do_patch failure.
>>
>> After some tries, I still failed to resolve this.
>>
>>
>> The cherry-pick in my side picked copyright change. But after sending
>> the patch via git send-mail, the character changed.
>>
>> Sorry again.
>>
>>
>> Thanks.
>>
>> Jinfeng
>>
>>
>> On 2/20/2025 10:27 AM, Wang, Jinfeng (CN) via lists.openembedded.org w=
rote:
>>> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>>
>>> Backport patch [1] to fix memory leak by freeing tclist
>>> [1] https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307=
aef5ee1ccc69f7e3b62
>>>
>>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>> ---
>>>    ...bs-fix-memory-leak-by-freeing-tclist.patch | 40 +++++++++++++++=
++++
>>>    .../net-snmp/net-snmp_5.9.3.bb                |  1 +
>>>    2 files changed, 41 insertions(+)
>>>    create mode 100644 meta-networking/recipes-protocols/net-snmp/net-=
snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
>>>
>>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001=
-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networkin=
g/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-lea=
k-by-freeing-tclist.patch
>>> new file mode 100644
>>> index 0000000000..3632881501
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload=
_all_mibs-fix-memory-leak-by-freeing-tclist.patch
>>> @@ -0,0 +1,40 @@
>>> +From 4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62 Mon Sep 17 00:00:00 20=
01
>>> +From: JanSoundhouse <jan.sondhauss@wago.com>
>>> +Date: Mon, 5 Sep 2022 11:25:58 +0200
>>> +Subject: [PATCH] unload_all_mibs: fix memory leak by freeing tclist
>>> +
>>> +tclist is always allocated in netsnmp_init_mib_internals, when doing=
 multiple init_snmp("")/snmp_shutdown("") this memory is never free'd.
>>> +
>>> +Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/comm=
it/4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62]
>>> +
>>> +Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>> +---
>>> + snmplib/parse.c | 5 +++--
>>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/snmplib/parse.c b/snmplib/parse.c
>>> +index b3e2f3ae5c..71bdf75ff8 100644
>>> +--- a/snmplib/parse.c
>>> ++++ b/snmplib/parse.c
>>> +@@ -28,7 +28,7 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PE=
RFORMANCE OF THIS
>>> + SOFTWARE.
>>> + ******************************************************************/
>>> + /*
>>> +- * Copyright =EF=BF=BD 2003 Sun Microsystems, Inc. All rights reser=
ved.
>>> ++ * Copyright =C2=A9 2003 Sun Microsystems, Inc. All rights reserved.
>>> +  * Use is subject to license terms specified in the COPYING file
>>> +  * distributed with the Net-SNMP package.
>>> +  */
>>> +@@ -4215,7 +4215,8 @@ unload_all_mibs(void)
>>> +         if (ptc->description)
>>> +             free(ptc->description);
>>> +     }
>>> +-    memset(tclist, 0, tc_alloc * sizeof(struct tc));
>>> ++    SNMP_FREE(tclist);
>>> ++    tc_alloc =3D 0;
>>> +
>>> +     memset(buckets, 0, sizeof(buckets));
>>> +     memset(nbuckets, 0, sizeof(nbuckets));
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.=
3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
>>> index eb8e1599fb..88466c94b4 100644
>>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
>>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
>>> @@ -27,6 +27,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snm=
p-${PV}.tar.gz \
>>>               file://reproducibility-have-printcap.patch \
>>>               file://0001-ac_add_search_path.m4-keep-consistent-betwe=
en-32bit.patch \
>>>               file://CVE-2022-44792-CVE-2022-44793.patch \
>>> +           file://0001-unload_all_mibs-fix-memory-leak-by-freeing-tc=
list.patch \
>>>               "
>>>    SRC_URI[sha256sum] =3D "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d39=
98dbe02f9462a413a2ef0a"
>>>
>>>
>>>
>>>
>> Hello,
>> The 0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch file =
needs to be slightly adapted to be working.
>> See my patch below:
>>
>>  From 54ba004a7c12cddcbcb020878fb03bbf52db2855 Mon Sep 17 00:00:00 200=
1
>> From: Piotr Lewicki <piotr.l.lewicki@hitachienergy.com>
>> Date: Mon, 10 Mar 2025 10:18:27 +0100
>> Subject: [meta-oe][kirkstone][PATCH] net-snmp: Adapt patch that fixes =
memory
>>   leak
>>
>> In commit d0c2a3d383dac9fe7e85b7d87784b7f5b5c62c5e the patch that fixe=
s
>> a memory leak has been backported to kirkstone branch, but it was not
>> adapted. This commit adapts the patch to apply properly on this branch.
>>
>> Signed-off-by: Piotr Lewicki <piotr.l.lewicki@hitachienergy.com>
>> ---
>>   ...all_mibs-fix-memory-leak-by-freeing-tclist.patch | 13 ++---------=
--
>>   1 file changed, 2 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networking=
/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak=
-by-freeing-tclist.patch
>> index cc498c7fc9..39f8ba1d61 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_=
all_mibs-fix-memory-leak-by-freeing-tclist.patch
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_=
all_mibs-fix-memory-leak-by-freeing-tclist.patch
>> @@ -13,19 +13,10 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windr=
iver.com>
>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>
>>   diff --git a/snmplib/parse.c b/snmplib/parse.c
>> -index b3e2f3ae5c..71bdf75ff8 100644
>> +index 9406f4f..2f9a201 100644
>>   --- a/snmplib/parse.c
>>   +++ b/snmplib/parse.c
>> -@@ -28,7 +28,7 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE OF THIS
>> - SOFTWARE.
>> - ******************************************************************/
>> - /*
>> -- * Copyright =EF=BF=BD 2003 Sun Microsystems, Inc. All rights reserv=
ed.
>> -+ * Copyright =C2=A9 2003 Sun Microsystems, Inc. All rights reserved.
>> -  * Use is subject to license terms specified in the COPYING file
>> -  * distributed with the Net-SNMP package.
>> -  */
>> -@@ -4215,7 +4215,8 @@ unload_all_mibs(void)
>> +@@ -4225,7 +4225,8 @@ unload_all_mibs(void)
>>            if (ptc->description)
>>                free(ptc->description);
>>        }
>> --
>> 2.34.1
>>
>>
>>
>> Hitachi Energy Services Sp. z o. o. z siedzib=C4=85 w Warszawie, adres=
: Warszawa 04-713, ul. =C5=BBega=C5=84ska 1, wpisana do Rejestru Przedsi=C4=
=99biorc=C3=B3w Krajowego Rejestru S=C4=85dowego prowadzonego w S=C4=85dz=
ie Rejonowym dla m. st. Warszawy, XIV Wydzia=C5=82 Gospodarczy Krajowego =
Rejestru S=C4=85dowego pod nr KRS 0000787719, nr REGON: 383431370, nr NIP=
: 9522196923, nr BDO: 000147611, kapita=C5=82 zak=C5=82adowy 14 403 850,0=
0 z=C5=82.
>> ________________________________
>> Hitachi Energy Services Sp. z o. o. with registered seat at 1 =C5=BBeg=
anska Street, 04-713 Warsaw, Poland, registered in the Register of Entrep=
reneurs of the Polish Court Register maintained by the District Court for=
 the Capital City of Warsaw, XIV Economic Department, under KRS No. 00007=
87719, REGON No. (statistical number): 383431370, NIP No. (taxpayer ident=
ification number) PL9522196923, BDO No. (WEEE registration number) 000147=
611, share capital: 14 403 850,00 PLN.
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115826): https://lists.openembedded.org/g/openembe=
dded-devel/message/115826
>> Mute This Topic: https://lists.openembedded.org/mt/111282761/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


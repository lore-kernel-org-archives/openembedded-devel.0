Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC0E1091914
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:32:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8983.1773999150445595474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=idqQkV77;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753978af84=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K8adZ8947177
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 02:32:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zD2fjU/5n8iAvJzFAkgQ9APE94kemOlDc54iQI5a2+c=; b=idqQkV773TXz
	Vw/by9vvLSJaNCZ5RKwYier5TX1dtx1AL0o2uYF/i7Y04w+8H+dIIqu2qpYlTUdK
	8wY61E3j5TXXF0wdZYZ/gSCdetF2DsOv85khmKLWTdjnDJ5Uz21+SdozXf5aTisp
	eikU8zMVTjCtOHeTJYrqYGyc6FkEso1xRiudjzYld53h3aCg6PR+De0pi4I46hdt
	o/s4Mi64UvdJmLtrsWOz4bmOg5SghwwQYRo7zrL0acUo//WhzuaGcvNvW0WL3+pr
	PtjhTOmTQaZhHq8ue6KiDR4DmTBTUwDU6TlODSlgasg+iY8aWoJax9qr2FZmR1B6
	Vjh+QT+iow==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y17tdg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 02:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFCJnByTihMSHfQpNQftst7DfKD2jg2KktjGSAkxSfu2uMFzdQfaf7nEDPC+8Y64uWmxleeT/5CuikpFPu7V8km/QT35ackR236x/NSgTD898wyo4Y+iJTXuKrX6jnxzGpT30q/JrACKw0Ta6w9KvMVlF/rdipWM00pxgFl2v1il5k4QL6z7iDc9HQoK6h9ZUZhrftuXfiGlQhAckZJIsgR+HhLrNDimYXwe4dsnooLuiivul0T2t/CfubGwc28Sa4wePg07de3aVM0ZU7YTY+riEZCrod/HqrE3TVbLwS34IHMx6Sf/Mg6QCoru51soOHk9u+2Th/7M3XW0qQtzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD2fjU/5n8iAvJzFAkgQ9APE94kemOlDc54iQI5a2+c=;
 b=mliuMyqm0xHBxfQVct17JjbmX2eVMMQ/4BP/GD9Y7aWDNNZrd8NqHgzjWMLTdmsiCJy4A7KbzkYbViGatgVlyItEvZg8mqBmjvuMhQyZ5mZj4R1XkYQhCCZAuQz9KFPSKSPKUWoKeuRZ1tlvhTcHJ8GURISnucOo1uXEsaUCIncW3XZIi/253YdqzwD0QSvStc4YIdcTGihKTdaVdXMnloUDwRIqOpCTRG5WrhSXBiI0JDO5mji+huoLJXBGBzD3gInBsCOFqL1twzuUKN9xzQ3VMw2EG4FTarv9PMYA0h29PgPqtnrXyWoRQKNGDHw9j+aHSWibu6AW1faEjNDouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.10; Fri, 20 Mar
 2026 09:32:27 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:32:27 +0000
Message-ID: <c4b0aba8-c1f1-485f-93b9-136e586a7f1d@windriver.com>
Date: Fri, 20 Mar 2026 17:32:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH 7/9] xfce4-screensaver: upgrade 4.18.4 ->
 4.20.2
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
 <20260319095547.3614749-7-peng.zhang1.cn@windriver.com>
 <f5b55363-531f-4a9e-8b14-5341d99bda78@gmail.com>
From: Zhang Peng <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <f5b55363-531f-4a9e-8b14-5341d99bda78@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::33)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: f69dd0b0-4c89-4dca-6e75-08de8663998c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	efr2J+vIRiarJaPjy7IV/RV6NvX+u1a9LRGEA1xTiWrE9xrLOjZkwHKkAz1OVrAzsSaYonYuHFYi/hQo7xlRBPMH22SGdjoeosDPHgTNcN+bFZyurzQabWZGa8zapDVBUb4RBLOLCBxAgnShldjVziQJO6ROxmM33qv7jpsJxoNMOD5Huog+3+6zzRRI5hunn6MgWeWcIJN+yewU0ZjzZTVtKlcEgFQJSvjryhpLNWE/Jzw9EzFHv5bW4+e9MRnCFl40lRjhqophSrsjgCHJd2tW74QzsLrPtwWAfXq6OWd5NO1mLV8DwDIG8dKQboCYlPBIyqP7aJKvzi6zAvqZDahPiLVgwW9nEgFBSBSWcZpjf806GxAljFqewI6QgNgubn+rMlYUeCaex/oR+5AHeksgr75Z+RcKq3qn5cJe3xmZ/mTJCOPdHm+58nfeCnB3t0thCBAhDJNj0MH/ipQHYJBT5/kKaJL2ArW6uLbk02ngL2YM7I5kqblxm0R378k0704wqIoiHSjyWTF9lk8MozD049TFyr2q+b/t3BbTIA4F6BfEaijvWnQfAz++wcuFYBXXfGUWlxzALjlmKXeeu/JHTS+MZvQP0cuyI6SBAI4XFdPCtYnsiMkpPByJ9XfLGqOvMAE89wzrrOTPAlX4FLdfP3CKGl57o6GaTfDEErG1achzXpBRvPdNaEAKmXTQhdKML/Yp1efwjZ9VK4Uhkce07xI3Gukt2IB+LPsBHtM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1UzUTV1T2VMNTBXaWV2eW1nenduSjNYNzVuQmw0S3ZIUlk1Y3NtLzV5UVp6?=
 =?utf-8?B?eUpkL09ZRmM3Ykc1a0hoZ21tZ1FpQnFLS1hqWCs0MTBPcTl0SmVwRmJJZDBk?=
 =?utf-8?B?ZTdXRGdUNk4wTzJnRE02dW81c3BqRjVuSzlJNnM1bXZPeU9RM0hxL1gwYmRj?=
 =?utf-8?B?dW5HemdIUVpncTkyZW8rb0dNb0JvYjVpcHlhM0RubGRXRVAwNUZZVUExRTFT?=
 =?utf-8?B?aTBDbjBKSytId0ovbWVjMm1JLzN3UzE0MGxWTk1Rbkt4MjJKcXhUWEJtM3cr?=
 =?utf-8?B?U29WbXNYZmJBREZxb21VNlU3RktxN2JxTnVuclk5VlNYU1NodHlJKzNnUFlK?=
 =?utf-8?B?RXNNWTFDMmgrdnNNYkk4cE1LOGtBUjJxOXFIazMrR1BaVlBtcGM2NjNNUWtY?=
 =?utf-8?B?WUhPK1BldWtaRXhCMk5EVmJ2RmNsV0IxVk5JcWJLL0FmU1NpbFo0MzdBRXRX?=
 =?utf-8?B?NEJFK21CSm1lREw2dlkzazUvbGROMkFtcHJTVGVSYmVnQUZ6YjRmcHVZdHFW?=
 =?utf-8?B?OThJSS94aGkwbXJiQnVVZFFUYW9qUnJxOTMxWkRnNi9HYlNGMjRRSzJ3a2Jx?=
 =?utf-8?B?RlZsUjJOdUV3MEdwZzlEOGhGMGQ0MVBVVkdzQlNHUEZjYUVpVUlqRXJGSkVD?=
 =?utf-8?B?VWlPRU9UUndRT3ljNHpxK0FCYytjcTZzM1ByZDU5UTA4QWdYelUydVdxc1hU?=
 =?utf-8?B?UVFCcHYwa3lOQnNRRTc4WVBCNjBOYzJWcWdtczF4NnlJQ3N0cEYyMWRxWXN2?=
 =?utf-8?B?djljT1hKbDE1YU9vVG5BSGYvY1Nya2pCeXVhRTNRYzFhd0QyU3phSFVwc3Nt?=
 =?utf-8?B?RHpSSVRwTGt1UDdVZDd2bTBHbHBoWnRjVTdWSVBJaEx3WFZkUVhZaTR2ck80?=
 =?utf-8?B?dStPTitVemNQMG5yZFdWcTdvUURQNFdKOWhpeU5PZ3FWZmRGeU1GcmNLYk1Y?=
 =?utf-8?B?ck9JaW10REI2Y1h0YlhRV3pnOFQyQmo2aFZvTDlGZnZLeE5ZSkVtbmYvR1l2?=
 =?utf-8?B?ME8yczEzUzVQV1JpcEx2cVgvcjBiVVE4NHhyc2VtUjdVNndjeVhHdXZjZGNv?=
 =?utf-8?B?dDA2Y2xtdlJncTJvc3I0WmI5S0hSMFY5Z0R5ZmFpNFZGeURFa2EwSlVJK1BF?=
 =?utf-8?B?NEdHWXp4WVg2RitDVjYxTndhK3J4anc4bzE1eEx5YjV5RVVLYnZIc3MxNmls?=
 =?utf-8?B?UStMc3RsbHVkcVZ2U01WVGlsb1lIWlBmQ1FCVjJ6aW5Pb0ZZazQyOHA5R0oy?=
 =?utf-8?B?QTBWb05TME43c2dwNVRsdkljL1haU0xrVmhPNEdoZEdFa3k4Ykcrb0d5NEx5?=
 =?utf-8?B?OWppMzhxZW5pME1KdGFIamtzVXNTbEVRU2RTWWdaN0ZiU0FzZlBYTjFFY0Rv?=
 =?utf-8?B?OFkzdkhNRGVnRFZJMHQvMVNJaDQvSHZlcFpmS2JXeWNCRXZ3Tk1udGVFTzdX?=
 =?utf-8?B?ejB3c0NoK0NzWlZwby84NFVHVys2dzdNbW4wZmNUTEU5K0lXaEw0ZkJLeG5q?=
 =?utf-8?B?TEtZS0lydzdEdFJEcDlvVzB1YlZvczFTK0drc0FaNFV2TmtSeitZMjdlRlV0?=
 =?utf-8?B?M1JjUjFxWVc2eW5MaVd3ZzJsbjVDWEh6VFpOa3FqSHg4UXV6Y0lUakxHSTVL?=
 =?utf-8?B?MDhMVlRXVHBkcXorM1NkZnc4eVpMM015UFZDZG5EaHdoWVpTQTNZaklnSEJW?=
 =?utf-8?B?ZDBBZjVibEl4RWZPMWUzbUVPVE9XWDNDL1U0aE80MGdLblYvZ1k4NjNjVFln?=
 =?utf-8?B?Ym5HSmdnRFJmR2QrN20xUmdJbjFYemJXQk1ZMGw5Yysvck5qVmpWWmdOQmVw?=
 =?utf-8?B?cUJKZkhZaGlCK3FJNVRaWFhYVmZWMDdpMUsvWUZ6b3h5U2QxR2NlS3RQMGsv?=
 =?utf-8?B?UDZIODdBMGdraHNZQzg0bEgwTndkaGI3K0RwS09jSVpqVVBmbWd4VDhXcy8y?=
 =?utf-8?B?b3ltRmZ1Q1ZBbS9Jc1QreXB5ZW0zbFZLeEdHUlVRS3dzWENhTmRyZmdreTFG?=
 =?utf-8?B?Z3Nud1NpNlZzM3djSHlyd3QyRnB5TUVRdmJBRGRpczZxYWJZS1ZjajQ0ODVV?=
 =?utf-8?B?a05xMjRET3ZVaGlHbklnTUNsb1h2OFVMSUM3bTlYNi83UHpjMWZuSmN2TXpD?=
 =?utf-8?B?bkNMaUpGL2grZFRUMUhjVGJ2aStCazZIcFZBMmxIZ0dER3VZTmgzUnZuMGlu?=
 =?utf-8?B?UURLdHEwT0FKREF6VWkwNUQ3M21QK2dGbjBuYk9USDJKUVFqRmZlRHJ4dGx5?=
 =?utf-8?B?blk2Ylp6N3dKclpKVWllSGFGVUNvYjloWXU1cit4aVk2U3JkVE9ockxNUVBF?=
 =?utf-8?B?dWlzQ01kV3NHY0FoNkRzNlE2Y1JIZjg2STdlV3ZuRENjNDhqdGYvQUpneWtV?=
 =?utf-8?Q?wq1XPjhXhL72r1F32JHl/jL0RKjdKPogmmEN7kNC68Ggq?=
X-MS-Exchange-AntiSpam-MessageData-1: ItlEIxre4KDSyOeGeNRU8CmcnvCj1EZPQ4s=
X-Exchange-RoutingPolicyChecked: 
	Bfqc8uQBZNJLvpK6GgMFUEliddelJRiphWHBXaAFVf0ldmfTw/4sQ1haUJfbJWs6sJ1+6CqLd1NGHuLCpDXlTexFqFCNFAkNKlQCTO8FE74nLV17uTABgh2lwfUHbC7mWtjM8nngJch5Sbom+iSQ8iM8k0J69eUkLfeqQ89RNoKv55oHOO47XfruEoPDRuCJDeZ9piMjhbFcqF0C7FGQ/rky3qVPGV+SGNvbJEcQ8ymko1jVCsyIVyLybrQg9jcAWU180xdPsHVfh8lCWFSZCicdO3Sdm+XhLEPnFm0rWT632q/z/vVEvKI9oBt1SgemtWmaDSHuDI7NSPsWgKxS7A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69dd0b0-4c89-4dca-6e75-08de8663998c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:32:27.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuRK4UrpnN42UHZuiZgk6Mk1i+hfsXKvWuWV1FNtQGY1BYC4anIfkGISz2JfxyGGaSmv6YK7PCTqV8qF+8BnifjDAAilWLcWHKsuX3jf/YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bd142d cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=O24Aq5uEAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EwElvh6-mvmWLwHrEvMA:9
 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA3MyBTYWx0ZWRfX1V9V3iOLZUWd
 QeDOiWL1mtsRHadxIiMJTO36Fi5aUwcKgKSkxYVAFoktzqBCVMFSZ1gcYMYXOlMaYyXcG9QWdxH
 R+FUjO/XBBiETWuSTOEpgrtqZpS1usga40f9trdpEZPJ6zpiWZfZHwyunkfDxFUtIkMPLpWGYvM
 Mprw2mOzckXtuX9y/VQwXRXgtNYakFWaI94W929mxvJikXuV3P08RQV+ImRMO9XfT8kQKlyS+Ae
 HkzYaEKO8iyn9hqrpW//TZZwZgCOovF53LLQTzPgVn1SXyueI67VFmQul7CwhayDWhM/DVHUBhj
 gRhqF4vbb6cvyO1kvRPRGN5kBBZdnzlCXYADLrO1DPY1gPN3lJF6hYFlhcwy+w4hutL0V4StZSG
 3HkJHzMYIkQ3Mptt23yCxnXq2hqNrowN/xZCJZ5b+yGdeMGZBe3ObrHxkbf7OYilbj0FkU3rjFR
 1fLj6IlGy7OqLt+Gmvg==
X-Proofpoint-GUID: YGOc8oLwpsLXgWc7cKBunRMRDzyRHgfK
X-Proofpoint-ORIG-GUID: cQyWiO7144UjBwN_S8dvxKQ1X6rbLqGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125429


On 3/19/26 20:14, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 3/19/26 10:55, Zhang, Peng (Paul) (CN) via lists.openembedded.org wrote:
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> Changelog:
>> https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.2
>> https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.1
>> https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.0
>>
>> Removed the patch which is no need, when changed to meson.
>>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> ---
>>   ...ce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>   rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} (85%)
>>
>> diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
>> similarity index 85%
>> rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
>> rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
>> index 7322dedc29..2033eb082f 100644
>> --- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
>> +++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
>> @@ -7,13 +7,14 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later "
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                       file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
>>                       "
>> +XFCE_COMPRESS_TYPE = "xz"
>> +XFCEBASEBUILDCLASS = "meson"
>>
>>   DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
>>
>>   inherit xfce-app
>>
>> -SRC_URI:append = " file://fix-cross-compile.patch"
> Could you please also remove the dangling patchfile?

sure, v2 send

//peng



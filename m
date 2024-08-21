Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2315AC531DF
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 03:36:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12136.1724211351765462934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 20:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8963e5002e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KNi5iR013342
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 20:35:51 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q543gdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 20:35:50 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47L3ZoHr021457;
	Tue, 20 Aug 2024 20:35:50 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q543gdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 20:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkruPND4ccj6ePBGhgFxgGKBuI/G8Z99XmnFedCFr1WfeVLnNtUtZ9+281Jcn2WTeYyDPd1ILMCrzT9YngI+LJUrCuO58oOpGH6qedJgQI8xlwXlw+qmZtdOBUW7m/kXjow2XVV3SFmCK79Z4Iukk49r3s3fLKYWlr1jJLdfmZkWJilwd524BJFloFcUKTYBh4UW44D+ntyG/3+6tovvSjWxByToFERJKQ2lMF2JYhdSSQGfrqjRaboSZduy/5R/1LWwHM+m6jrTEhldCxCTrTdXKPL/FSbQ5cMRpQzQ84vkqKKikfwGqMkYXXEieiPqs/TTmue8QSrkoISnRxfGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFrjKq6vFr9QY1HjOogJrtiVsCLPjrKdM72OsmafVko=;
 b=LUvdqv/dCidCfAcJlr42ElFOWQIqzuHvENSVxNZ8BQrGk1PUnjNC1eMCkt/cz+ZAUnqbJqRKu+idVn1gOmgc5mtHHyfT7vIGTALgcXBDFV6dS1gdNVmcI8yOqzQweMHGHgI5povZNpUcbgHpEw+FfhcSJpsZym2cI6n5kSaBoCvHzukSDQ5TWI35RYj2lezukSHwCpK56ipXeeNyDs5KCUrHCUe1IgtLjbN1wvDklr0le1Iubq85K2LtAuayrUbS0sy76CcO1rzPEVl+UbA8XGDxVdtebkMH8FmXQo4yE+j7ey1M+2NdDqYJyP/nfXeBHxUX/2QWBmlrz0REWMMwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 03:35:45 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 03:35:44 +0000
Content-Type: multipart/alternative;
 boundary="------------H2yor0CX6wY5o92HbaRWxZau"
Message-ID: <201313bf-9654-42e9-9a8a-ed82f94c1b0a@windriver.com>
Date: Wed, 21 Aug 2024 11:35:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: support cross compile without qemu
 user conditionally
To: hongxu <hongxu.jia@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240819022906.999604-1-hongxu.jia@windriver.com>
 <CAMKF1sqjP5f3KWZUi-=Y+ueH1iVahdLHmU4Ww47-pnYv6o_U=A@mail.gmail.com>
 <17ED9FCFBD78C1BE.18027@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <17ED9FCFBD78C1BE.18027@lists.openembedded.org>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: c1272f1f-c114-4af1-db1e-08dcc19256a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEY0UzBRcG1lT3Z5NFdSSHZCN244Z25BVC9YQjhWRUdIa1JHeHBvOGdPLzVM?=
 =?utf-8?B?dVI4SGdWTUFKRTIrTDA0clp2T2dDSExIaUhJRjczUEZOa3F5UUl3MFZ0QUUy?=
 =?utf-8?B?cno0dUdLYWhaNGVhQzNMVjAyd3Y2ZDVmdm0rZ3J3a2NUMmxTRUk1OENvaWlF?=
 =?utf-8?B?MVRLRDArcW16SXdvVnVVaTBVNFQzbXVqNW54bDNCQVNmaEU1WHpBUjhLZEhH?=
 =?utf-8?B?aW5hOGtMRUZyWlo1My9kNXRyNFgxaDNUVFVDcVJDRlQ3djVKOWl1RkFjQWdU?=
 =?utf-8?B?ME12ZVRXNWltYXFXTWFMNGUydVRTcHl2ckprb1gvd000SVlONWF3L3hNT1M5?=
 =?utf-8?B?REFvdjlIL1pwbnhQSDJyMENTNmdaYXRLR2dCejVDYUxSMnJqMTVGejFvWVFs?=
 =?utf-8?B?dXAyM0w5ZzJsb0Q4TjhPZGc4dVU0NEtJSkNyRzVjWkdIZUF1TzdnbTJ4YWFn?=
 =?utf-8?B?WkluWE1DRlM4eEZPdnI2T1JaZzUyZG84dWE5eGVrekUwWit6MWFodGJvWlZ5?=
 =?utf-8?B?RDVieU8xOGRieDFhMFpQZDdvd1ZSRUlPaS9GVmtyVG5KdStuRlZyMWZWNHM1?=
 =?utf-8?B?UVVVdmt4Q2JxcTAzNDJ2aGRPVUx3M0MyYnM0aGk3Q3czR2NYZHorYVdzWTJR?=
 =?utf-8?B?T1hnSFNRc0JBcktMYzVsK2xONS85MXFpSEZCTlM4SFlkdm5KZXdUdUtDN000?=
 =?utf-8?B?NHdYZzJ3alVyUlBTajdDeFNHNkoxR1dTSGpZck5QUU5YY09VUitvVXZrY092?=
 =?utf-8?B?RktUdFNsTDBCdTdwZW5KMHJOZkR6RXlrVXlheVErS3VFaU1HSVlvQkZlc2dV?=
 =?utf-8?B?NlJ0TE40QWZRZDY3SXYwUHllZ1hOTlZGNVRYYjdxTXE3TzVHZHpuLzBCRWNr?=
 =?utf-8?B?ZDNwcXNnYzV0ektjdXBFUDluOFNxUWdxS2o3SlY1ZEZLbzZRR1hCMU9pTlh3?=
 =?utf-8?B?RGthbXFCbUtYREkvZzVtd3VUa3pQalZyeE1wUjgrVGJOeW85RWFkeThickpU?=
 =?utf-8?B?WG4wbTI0Z3I4aFlPNVdPdFRWZUdhTmt4bUpLR0F1SDFCbDJYbGcyclVOQ2M5?=
 =?utf-8?B?Vlg2MEV2K2htWHI3OEFOMTRRSnJpU1dxOThkaXlIcWR2OFlHbEc5cXVvL1Fk?=
 =?utf-8?B?YVNpOUNwU0xScUxBT2I2RnoxS2JFUkVCdGl0TEZyaFhmUXNmaHdCNkZKbzNK?=
 =?utf-8?B?Mk03K09iOURWVVhhSytPSVpSUTMvR2RKTGk0cFVKa3VBbFRERUtHV3RpT25N?=
 =?utf-8?B?cElYSDFEd1ZLWENHc0hUcFJhRlp1enZwWWZDQVE0cTd5VFUvUmxNMm8rQXRM?=
 =?utf-8?B?S05CSjZ0aWZ3c3gwRFprN3RXcVlaUy9ydkh3QTNBL2JBcTZqaU54SERwUm9i?=
 =?utf-8?B?OGp3WjFvQUVDZ3R0MWZSU0JTT0xUNm9GY2Nid3hOcks3NzFFaXhVK0ZwTm1h?=
 =?utf-8?B?MXpvL1FIYjV0YXNiK0FoQmNPb29SUVlCR2pGOS9uSy9WZmc0V3pDUHdTajFu?=
 =?utf-8?B?UHR2VmRxcFdYT2FrRW1kSng4dXJrcEFvOHduN1p3UldJejZ5QThBZVhZVXpn?=
 =?utf-8?B?YVJjbXdoU01NRWJWYkFuaTJiSjVzYkkrVTB1ZlVqbnZLVkpXSnFGblIrN0c5?=
 =?utf-8?B?cXd5QWNXMWhBbXE5bWM2RlNxZ3pHQ3hkNTVuTGN2bk51UGwvbXVScnVNMUYx?=
 =?utf-8?B?TFdKaFRTRmNQVEI5N0VmN1RZaHkwSGY0K0ZwY0ppcmQ5NjB6VkRqYk5RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STVaOUFDT0h2OVZrYzFXWVp6dkZhaEhXRGtTTkVKbVZncS91cUhXSFRxdmNx?=
 =?utf-8?B?c1pCSmpUQjRMem11aG8zVUhENmIrQXh2bXZpT2NsZTU0UnhUTWlLckZKZnVX?=
 =?utf-8?B?WGRUNTFjME1EcVpIZUJaM0Ezc0tyRFVSMXhrcy9RT3paU3NmMnFYUGVtWDha?=
 =?utf-8?B?ak5xcldYbmg2YkJYdWtyemZFQ2tZL0s4T2NkSGVqbkpsMjFoRTZ1OXdtUFdL?=
 =?utf-8?B?Qm45T08ydnAyOEdTZFBUemJjTDFlSjhWOHZYNXkxM0RZZXFxZDdodEhYOGh4?=
 =?utf-8?B?Y3NWOTE4ckM1elgwK2diQWttRFlUQmt0MzU4SGNKZ3VhOHR0djlCUnZNUWsy?=
 =?utf-8?B?NGJUY3B3c1U0bmdTV2Y3RXpTdmVyZWxmN2VpQmxGYkVlRDAwTEpGbUhmV004?=
 =?utf-8?B?RmNSSnJnL0hBb3JoZUc1dUxIclcyKy8wdjJMUmNYWHJEVDVJUVF1RFhMSTVz?=
 =?utf-8?B?a2p0TjYzNkF6RDMzRG10dDFaVGNXQmhZVW1sMG9DZFl6Y2hqRFB4UmszQThG?=
 =?utf-8?B?cEhaTlZZKysyanhMZG5hZkZTZDJuNzl3Skk0TVE3Z011VnJiWGdmaWJRSjVy?=
 =?utf-8?B?dTFldGVIT3lYaG1VYWZpRXdlU01rL2lUcUZGc2hhOXU4Z3BoNmJER1ZydmdB?=
 =?utf-8?B?M1NDSW0xVHBYSCtWOXBpMSs2VHRKNWdiT1d5bFNtejFSb2QwbHo4N1ptaDhI?=
 =?utf-8?B?MG9BaW9Hb2JPR1VtZkhacFcxckNVSHc2bGFtZEtpY2p2OUZZdFRuSE5MVFEx?=
 =?utf-8?B?bGJMWDNjQnJzbWRTWVZ1VVZkdFN5aGxNMmtYTmc5OTMvaFZLNTBpbEJYcXQw?=
 =?utf-8?B?VGhWVE4zeU5YSmkzS0E5UHJ2cWJ5Y2xNMXBBb0JjaTFxUEpJOXdhdTAwTnoz?=
 =?utf-8?B?ZHZRUlF4L0IxbnVmaDNuWXdGV0MrbzE5TVdpckVBOFgwaGtxTWI0ZUVBZTda?=
 =?utf-8?B?UWhqTTBwNlMrMVRjWXdQYnp1OEJMbTNSQVA2L1V3MzNZRGgvU2pKSmx1TjBQ?=
 =?utf-8?B?dU9QdndpQ0wvb2ZOMUYxOFJOLzJ2WjE0b1Q4Z1h1YUg3TGtDS05zVi92Z2pJ?=
 =?utf-8?B?a1FpVjMwcGZOZzFkWGlOa3UzK3FsU0YyREVxZnRyWldVL00ya3VwVW5iUTJV?=
 =?utf-8?B?enNJbXFCcXN5ZlBPMEZoaEFKSDdPVXJzcmZHaUlYMm9YNHV5ZUU5ZktDQmFo?=
 =?utf-8?B?NFJJRXBQdnZHUmJkU3BobzVia2FYbUlzbitqbFhuQzh1ZnMvZmc1Z1NUL2hJ?=
 =?utf-8?B?SGhjUVd2MWt3eTdXM2ZoS1Y4dDRuRzBQWGxmM28yeE5kZC9LazNLTkNyVGV5?=
 =?utf-8?B?eHdZVWZOTS9FS1ZDUUF1aERHQ1NPQWg1RHZDWWxFY1htSHVjUVMzR2tLSUo0?=
 =?utf-8?B?SXB4WitVSm1ER2pwcFVSTTQxRWZQVyswbXZueVJldm9UcDlUVFRkbGpxQkpT?=
 =?utf-8?B?RHRvRDhIKzB4ZTFXeEVjQ0QrYXRLNjhDMGZvdnNZT1daWWgycndTTEh3ZWh6?=
 =?utf-8?B?OCtCTk1IRThNRit2NFpxc0VROW54eWd2Vjc0eW52SXhBdEYzb3FOYjdFN1lz?=
 =?utf-8?B?WXAvZ0ovbzlyRGc5WFYwUFQ5aTNmazFsZkxJY2F3YmRNRStWYkplMXB0bTlG?=
 =?utf-8?B?MXk0aUhham1QT25hbGNKc3JZYXBmWmZwRkg0UnM2WEV0ZGEyYzVjMDFDcWw5?=
 =?utf-8?B?L1AxdkpRTFI3d2QrdEN5REVZQ04rckJzbkFZQXJ1dnQ0TGNvMmZpbzMrRVJm?=
 =?utf-8?B?OFZwdmV0S1NkbUdRNmFHV21MbnNGTTdONCsyNVB1N040bG84WVFYZ3hwVlVT?=
 =?utf-8?B?Y2NRcmV6QlVQSjIyRE90ZjlwbHVxUytQWmZKSjBNOVRjYkFXMTBRK1dTVUFX?=
 =?utf-8?B?clUrZ3NSMnNveXJjL0loVnRwMUQ3eTU4YzkwOEZHSVpLSEN2Nmt0b1ZwNTdJ?=
 =?utf-8?B?VXRnRDB1dTdPblVNZm5qQmlLcEpxMmlKQTB2NyszVXBBRDREZWpvaXJ0WjJl?=
 =?utf-8?B?Ri9qSGNxRWlZVWY5cjdBeWQxbjNmZEZod051L0lXM2l4VXVrN3NRTk5tTS9s?=
 =?utf-8?B?ckl1d1g1OGRsbHp4Wlg0UHhMSWJxdmpSdnd6MGhLdkpVcWhtMFZIWFFWa1JZ?=
 =?utf-8?B?Tkh5WVdjTS9vejJPeVpSK2tWSUIxdTFocFJuRFlZKzY2ZndjbnZzck1pRjRM?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1272f1f-c114-4af1-db1e-08dcc19256a9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 03:35:44.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mxJ7qxoWrp3md0uRjtg4E2MzamviPrSJA7taiMqWRlVo7yppI+6Ts03SlD+FsyiPsFKvSOhnx/Gb1Osvia9FgqrYcpc0iWwdrVkAJoTfEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-Proofpoint-GUID: 0-ufn9LFYYhRg-W4k4O1vwd4pVJkba-x
X-Proofpoint-ORIG-GUID: swEKyBu_4nokK3alDxHaguENesI9xHjg
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c56096 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=WYZvPtRHAAAA:8 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=0zhiEtMHAAAA:8 a=p-fMqMODAAAA:8 a=pGLkceISAAAA:8 a=-LCu6K_DAAAA:8 a=yigSqEJhrGRFTXaxDWQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=j9Gkw3vXnVuGLMuZa8UA:9 a=SRXrZtiwKtT68Crb:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VVrakiNAArlq0Xo2wcCj:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=rdB-ylHQV3P45KssraYS:22 a=J-JL0wFkX4TZ9yyCLs2E:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408210024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 03:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111875

--------------H2yor0CX6wY5o92HbaRWxZau
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47KNi5iR013342

On 8/21/24 11:11, hongxu wrote:
> On 8/20/24 00:05, Khem Raj wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM hongxu vialists.openembedded.o=
rg  <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYd=
w8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_G=
u85xnqCX1nTow58E4wb4a6jMO27Z59Q$>
>> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org>  wrote:
>>> Due to the scope of supported BSPs by qemu-user is limited, such
>>> as a segment fault on armv9 after qemu apply commit [target/arm:
>>> Convert LDAPR/STLR (imm) to decodetree][1]
>>> ```
>>> |tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.=
1/out/
>>> Release/v8-qemu-wrapper.sh  <https://urldefense.com/v3/__http://v8-qe=
mu-wrapper.sh__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0=
aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPia2TlrQ$>: line 7: 317961=
3 Segmentation fault      (core dumped)
>>> PSEUDO_UNLOAD=3D1 qemu-aarch64 -r 5.15 -L tmp-glibc/work/neoversen2-c=
rypto-wrs-linux/
>>> nodejs/20.5.1/recipe-sysroot -E LD_LIBRARY_PATH=3Dtmp-glibc/work/neov=
ersen2-crypto-wrs-linux/
>>> nodejs/20.5.1/recipe-sysroot/usr/lib64:tmp-glibc/work/neoversen2-cryp=
to-wrs-linux/
>>> nodejs/20.5.1/recipe-sysroot/usr/lib64 "$@"
>>> ```
>>>
>>> Upstream nodejs have cross compile support, but it needs host and tar=
get
>>> have same bit width (e.g. a x86_64 host targeting arrch64 to produce =
a
>>> 64-bit binary). So:
>>> 1. If host and target have different bit width, build with QEMU user =
as usual;
>>>
>>> 2. If host and target have same bit width, enable notejs cross compil=
e support:
>>> - The build tools of nodejs is GYP[2], set CC_host, CFLAGS_host,
>>>    CXX_host, CXXFLAGS_host, LDFLAGS_host, AR_host for host build
>>>    which is separated with target build [3]
>>> - Add missing native packages to fix library missing on host build
>>> - Rework libatomic.patch, explicitly link to libatomic for clang
>>>    conditionally
>> Does this mean that upstream has stopped supporting 32bit hosts ?
>
> The nodejs does not support to build 32bit target on 64 bit host for=20
> cross compiling.
>
> but the normally non-cross compiling, the 32bit build still supported=20
> by nodejs.
>
Here is the check for supported combinations of host and target=20
architectures in nodejs

https://github.com/nodejs/node/blob/main/deps/v8/include/v8config.h#L923

//Hongxu

> For GYP, while enabling cross compile, it simple duplicates sources as=20
> host and target,
>
> so the bit specific source could not work if host and target have=20
> different bits
>
> Ideally, nodejs should split bit source conditionally along with arch t=
est
>
>> if so, than I would follow the suite and disable building for 32bit ma=
chines
>> nodejs build in OE is quite unwieldy and this just makes it a bit
>> more. Is there a way
>> to improve qemu-user ?
>
> For qemu-user solution, it is just a workaround for cross compiling,=20
> and force the build depends on qemu
>
> which made the maintainer of nodejs become a qemu expert.
>
> For the segment fault on armv9, although I found the issue was caused=20
> by the commit via git bisect
>
> https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f758=
5dc7
>
> But it is hard to debug and fix it. The qemu rework it, no minor change
>
> Another similar issue is=20
> http://errors.yoctoproject.org/Errors/Details/766923/
>
> Although I do not met the issue on my build, but we may have similar=20
> issue on other BSPs
>
> # http://errors.yoctoproject.org/Errors/Details/766923/ #=20
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/ou=
t/Release/v8-qemu-wrapper.sh=20
> <https://urldefense.com/v3/__http://v8-qemu-wrapper.sh__;!!AjveYdw8EvQ!=
etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnq=
CX1nTow58E4wb4a6jPia2TlrQ$>:=20
> line 7: 252447 Illegal instruction (core dumped) PSEUDO_UNLOAD=3D1=20
> qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfalse -L=20
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot=20
> -E=20
> LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.=
2/recipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/2=
0.12.2/recipe-sysroot/usr/lib=20
> "$@" # TODO: Fix with gcc-14
>
> //Hongxu
>
>>   and why does riscv64 not work with existing
>> mechanism. if it is new
>> then separate that out into a different patch.
>
> I could move riscv64=C2=A0out
>
> //Hongxu
>
>>> BTW, enable riscv64 build
>>>
>>> [1]https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f960=
0f7585dc78
>>> [2]https://github.com/nodejs/node-gyp
>>> [3]https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocument=
ation.md#cross-compiling
>>>
>>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>>> ---
>>>   .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++-=
---
>>>   .../recipes-devtools/nodejs/nodejs_20.16.0.bb  <https://urldefense.=
com/v3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t=
84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jOOF7bs=
3A$>  | 81 ++++++++++-------
>>>   2 files changed, 121 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b=
/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
>>> index cb0237309..bc51f99d8 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
>>> @@ -1,21 +1,77 @@
>>> -Link mksnapshot with libatomic on x86
>>> +From 15e751e4b79475fb34e4b32a3ca54119b20c564a Mon Sep 17 00:00:00 20=
01
>>> +From: Hongxu Jia<hongxu.jia@windriver.com>
>>> +Date: Sat, 17 Aug 2024 21:33:18 +0800
>>> +Subject: [PATCH] link libatomic for clang conditionally
>>>
>>> -Clang-12 on x86 emits atomic builtins
>>> +Clang emits atomic builtin, explicitly link libatomic conditionally:
>>> +- For target build, always link -latomic for clang as usual
>>> +- For host build, if host and target have same bit width, cross comp=
iling
>>> +  is enabled, and host toolchain is gcc which does not link -latomic=
;
>>> +  if host and target have different bit width, no cross compiling,
>>> +  host build is the same with target build that requires to link
>>> +  -latomic;
>>>
>>> -Fixes
>>> -|module-compiler.cc  <https://urldefense.com/v3/__http://module-comp=
iler.cc__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4yb=
zOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPcGtwzAw$>:(.text._ZN2v88interna=
l4wasm12_GLOBAL__N_123ExecuteCompilationUnitsERKSt10shared_ptrINS2_22Back=
groundCompileTokenEEPNS0_8CountersEiNS2_19CompileBaselineOnlyE+0x558): un
>>> -defined reference to `__atomic_load'
>>> +Fix:
>>> +|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/=
Release/node_js2c: error while loading shared libraries: libatomic.so.1: =
cannot open shared object file: No such file or directory
>>>
>>> -Upstream-Status: Pending
>>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> +Upstream-Status: Inappropriate [OE specific]
>>>
>>> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>>> +---
>>> + node.gyp                 | 13 ++++++++++++-
>>> + tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
>>> + 2 files changed, 24 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/node.gyp b/node.gyp
>>> +index b425f443..f296f35c 100644
>>> +--- a/node.gyp
>>> ++++ b/node.gyp
>>> +@@ -487,7 +487,18 @@
>>> +         ],
>>> +       }],
>>> +       ['OS =3D=3D "linux" and llvm_version !=3D "0.0"', {
>>> +-        'libraries': ['-latomic'],
>>> ++        'target_conditions': [
>>> ++           ['_toolset=3D=3D"host"', {
>>> ++             'conditions': [
>>> ++               ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=3D=3D"0"', =
{
>>> ++                 'libraries': ['-latomic'],
>>> ++               }],
>>> ++             ],
>>> ++           }],
>>> ++           ['_toolset=3D=3D"target"', {
>>> ++             'libraries': ['-latomic'],
>>> ++           }],
>>> ++        ],
>>> +       }],
>>> +     ],
>>> +   },
>>> +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
>>> +index b23263cf..dcabf4ca 100644
>>>   --- a/tools/v8_gypfiles/v8.gyp
>>>   +++ b/tools/v8_gypfiles/v8.gyp
>>> -@@ -1436,6 +1436,7 @@
>>> -     {
>>> -       'target_name': 'mksnapshot',
>>> -       'type': 'executable',
>>> -+      'libraries': [ '-latomic' ],
>>> -       'dependencies': [
>>> -         'v8_base_without_compiler',
>>> -         'v8_compiler_for_mksnapshot',
>>> +@@ -1100,9 +1100,18 @@
>>> +         # Platforms that don't have Compare-And-Swap (CAS) support =
need to link atomic library
>>> +         # to implement atomic memory access
>>> +         ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "r=
iscv64", "loong64"]', {
>>> +-          'link_settings': {
>>> +-            'libraries': ['-latomic', ],
>>> +-          },
>>> ++          'target_conditions': [
>>> ++             ['_toolset=3D=3D"host"', {
>>> ++               'conditions': [
>>> ++                 ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=3D=3D"0"'=
, {
>>> ++                   'libraries': ['-latomic'],
>>> ++                 }],
>>> ++               ],
>>> ++             }],
>>> ++             ['_toolset=3D=3D"target"', {
>>> ++               'libraries': ['-latomic', ],
>>> ++             }],
>>> ++           ],
>>> +         }],
>>> +       ],
>>> +     },  # v8_base_without_compiler
>>> +--
>>> +2.35.5
>>> +
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb  <http=
s://urldefense.com/v3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfO=
j3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow5=
8E4wb4a6jOOF7bs3A$>  b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb =
 <https://urldefense.com/v3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!et=
Ok8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX=
1nTow58E4wb4a6jOOF7bs3A$>
>>> index fe7121156..34ec8ad80 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb  <https://url=
defense.com/v3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDM=
MofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a=
6jOOF7bs3A$>
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb  <https://url=
defense.com/v3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDM=
MofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a=
6jOOF7bs3A$>
>>> @@ -5,17 +5,16 @@ LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3Dcef54676c=
547a5bbab44aa8be3be9ef7"
>>>
>>>   CVE_PRODUCT =3D "nodejs node.js"
>>>
>>> -DEPENDS =3D "openssl file-replacement-native python3-packaging-nativ=
e"
>>> +DEPENDS =3D "openssl openssl-native file-replacement-native python3-=
packaging-native"
>>>   DEPENDS:append:class-target =3D " qemu-native"
>>>   DEPENDS:append:class-native =3D " c-ares-native"
>>>
>>> -inherit pkgconfig python3native qemu ptest
>>> +inherit pkgconfig python3native qemu ptest siteinfo
>>>
>>>   COMPATIBLE_MACHINE:armv4 =3D "(!.*armv4).*"
>>>   COMPATIBLE_MACHINE:armv5 =3D "(!.*armv5).*"
>>>   COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
>>>
>>> -COMPATIBLE_HOST:riscv64 =3D "null"
>>>   COMPATIBLE_HOST:riscv32 =3D "null"
>>>   COMPATIBLE_HOST:powerpc =3D "null"
>>>
>>> @@ -24,15 +23,12 @@ SRC_URI =3D"http://nodejs.org/dist/v${PV}/node-v$=
{PV}.tar.xz \=20
>>> file://0004-v8-don-t-override-ARM-CFLAGS.patch \=20
>>> file://system-c-ares.patch \=20
>>> file://0001-liftoff-Correct-function-signatures.patch \ +=20
>>> file://libatomic.patch \ file://run-ptest \ "
>>> -
>>>   SRC_URI:append:class-target =3D " \
>>>              file://0001-Using-native-binaries.patch  \
>>>              "
>>> -SRC_URI:append:toolchain-clang:x86 =3D " \
>>> -file://libatomic.patch  \
>>> -           "
>>>   SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>>>              file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.pat=
ch  \
>>>              "
>>> @@ -66,28 +62,14 @@ ARCHFLAGS ?=3D ""
>>>
>>>   PACKAGECONFIG ??=3D "ares brotli icu zlib"
>>>
>>> -PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
>>> -PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli"
>>> -PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
>>> +PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares c-ares-native"
>>> +PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli brotli-native"
>>> +PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu =
icu-native"
>>>   PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>>>   PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
>>>   PACKAGECONFIG[shared] =3D "--shared"
>>>   PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
>>>
>>> -# We don't want to cross-compile during target compile,
>>> -# and we need to use the right flags during host compile,
>>> -# too.
>>> -EXTRA_OEMAKE =3D "\
>>> -    CC.host=3D'${CC} -pie -fPIE' \
>>> -    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
>>> -    CXX.host=3D'${CXX} -pie -fPIE' \
>>> -    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
>>> -    LDFLAGS.host=3D'${LDFLAGS}' \
>>> -    AR.host=3D'${AR}' \
>>> -    \
>>> -    builddir_name=3D./ \
>>> -"
>>> -
>>>   EXTRANATIVEPATH +=3D "file-native"
>>>
>>>   python prune_sources() {
>>> @@ -110,9 +92,11 @@ do_unpack[postfuncs] +=3D "prune_sources"
>>>   # V8's JIT infrastructure requires binaries such as mksnapshot and
>>>   # mkpeephole to be run in the host during the build. However, these
>>>   # binaries must have the same bit-width as the target (e.g. a x86_6=
4
>>> -# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
>>> -# depending on a third Yocto toolchain, we just build those binaries
>>> -# for the target and run them on the host with QEMU.
>>> +# host targeting ARMv6 needs to produce a 32-bit binary).
>>> +# 1. If host and target have the different bit width, run those
>>> +#    binaries for the target and run them on the host with QEMU.
>>> +# 2. If host and target have the same bit width, enable upstream
>>> +#    cross crompile support and no QEMU
>>>   python do_create_v8_qemu_wrapper () {
>>>       """Creates a small wrapper that invokes QEMU to run some target=
 V8 binaries
>>>       on the host.""" @@ -120,6 +104,10 @@ python do_create_v8_qemu_w=
rapper () {=20
>>> d.expand('${STAGING_DIR_HOST}${base_libdir}')] qemu_cmd =3D=20
>>> qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), qemu_libdirs)=20
>>> + + if d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "1":
>>> +        qemu_cmd =3D ""
>>> +
>>>       wrapper_path =3D d.expand('${B}/v8-qemu-wrapper.sh  <https://ur=
ldefense.com/v3/__http://v8-qemu-wrapper.sh__;!!AjveYdw8EvQ!etOk8rfOj3A-X=
DMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb=
4a6jPia2TlrQ$>')
>>>       with open(wrapper_path, 'w') as wrapper_file:
>>>           wrapper_file.write("""#!/bin/sh
>>> @@ -138,6 +126,14 @@ addtask create_v8_qemu_wrapper after do_configur=
e before do_compile
>>>
>>>   LDFLAGS:append:x86 =3D " -latomic"
>>>
>>> +export CC_host
>>> +export CFLAGS_host
>>> +export CXX_host
>>> +export CXXFLAGS_host
>>> +export LDFLAGS_host
>>> +export AR_host
>>> +export HOST_AND_TARGET_SAME_WIDTH
>>> +
>>>   CROSS_FLAGS =3D "--cross-compiling"
>>>   CROSS_FLAGS:class-native =3D "--no-cross-compiling"
>>>
>>> @@ -179,8 +175,31 @@ RDEPENDS:${PN}-npm =3D "bash python3-core python=
3-shell python3-datetime \
>>>   PACKAGES =3D+ "${PN}-systemtap"
>>>   FILES:${PN}-systemtap =3D "${datadir}/systemtap"
>>>
>>> -BBCLASSEXTEND =3D "native"
>>> +python __anonymous () {
>>> +    # 32 bit target and 64 bit host (x86-64 or aarch64) have differe=
nt bit width
>>> +    if d.getVar("SITEINFO_BITS") =3D=3D "32" and "64" in d.getVar("B=
UILD_ARCH"):
>>> +        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
>>> +    else:
>>> +        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
>>> +
>>> +    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "0":
>>> +        # We don't want to cross-compile during target compile,
>>> +        # and we need to use the right flags during host compile,
>>> +        # too.
>>> +        d.setVar("CC_host", d.getVar("CC") + " -pie -fPIE")
>>> +        d.setVar("CFLAGS_host", d.getVar("CFLAGS"))
>>> +        d.setVar("CXX_host", d.getVar("CXX") + " -pie -fPIE")
>>> +        d.setVar("CXXFLAGS_host", d.getVar("CXXFLAGS"))
>>> +        d.setVar("LDFLAGS_host", d.getVar("LDFLAGS"))
>>> +        d.setVar("AR_host", d.getVar("AR"))
>>> +    elif d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "1":
>>> +        # Enable upstream cross crompile support
>>> +        d.setVar("CC_host", d.getVar("BUILD_CC"))
>>> +        d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
>>> +        d.setVar("CXX_host", d.getVar("BUILD_CXX"))
>>> +        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS"))
>>> +        d.setVar("LDFLAGS_host", d.getVar("BUILD_LDFLAGS"))
>>> +        d.setVar("AR_host", d.getVar("BUILD_AR"))
>>> +}
>>>
>>> -#http://errors.yoctoproject.org/Errors/Details/766923/
>>> -# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12=
.2/out/Release/v8-qemu-wrapper.sh  <https://urldefense.com/v3/__http://v8=
-qemu-wrapper.sh__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i27=
3l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPia2TlrQ$>: line 7: 252=
447 Illegal instruction     (core dumped) PSEUDO_UNLOAD=3D1 qemu-x86_64 -=
r 5.15 -cpu Nehalem,check=3Dfalse -L TOPDIR/tmp-glibc/work/core2-64-oe-li=
nux/nodejs/20.12.2/recipe-sysroot -E LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/w=
ork/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot/usr/lib:TOPDIR/tmp-gl=
ibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot/usr/lib "$@"
>>> -# TODO: Fix with gcc-14
>>> +BBCLASSEXTEND =3D "native"
>>> --
>>> 2.27.0
>>>
>>>
>>>
>>>
>>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111874):https://lists.openembedded.org/g/openembedd=
ed-devel/message/111874
> Mute This Topic:https://lists.openembedded.org/mt/107974157/3617049
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------H2yor0CX6wY5o92HbaRWxZau
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47KNi5iR013342

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 8/21/24 11:11, hongxu wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:17ED9FCFBD78C1BE.18027@lists.op=
enembedded.org">
     =20
      <div class=3D"moz-cite-prefix">On 8/20/24 00:05, Khem Raj wrote:<br=
>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1i=
VahdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes =
from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM hongxu via <a href=3D"https://url=
defense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!etOk8rfOj3=
A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E=
4wb4a6jMO27Z59Q$" moz-do-not-send=3D"true">lists.openembedded.org</a>
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hongxu.jia=3Deng.windri=
ver.com@lists.openembedded.org" moz-do-not-send=3D"true">&lt;hongxu.jia=3D=
eng.windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Due to the scope of supp=
orted BSPs by qemu-user is limited, such
as a segment fault on armv9 after qemu apply commit [target/arm:
Convert LDAPR/STLR (imm) to decodetree][1]
```
|tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.1/ou=
t/
Release/<a href=3D"https://urldefense.com/v3/__http://v8-qemu-wrapper.sh_=
_;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIU=
b5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPia2TlrQ$" moz-do-not-send=3D"true">v8-q=
emu-wrapper.sh</a>: line 7: 3179613 Segmentation fault      (core dumped)
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
        <pre class=3D"moz-quote-pre" wrap=3D"">Does this mean that upstre=
am has stopped supporting 32bit hosts ?</pre>
      </blockquote>
      <p>The nodejs does not support to build 32bit target on 64 bit
        host for cross compiling.</p>
      <p>but the normally non-cross compiling, the 32bit build still
        supported by nodejs.</p>
    </blockquote>
    <p>Here is the check for supported combinations of host and target
      architectures in nodejs</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/node=
js/node/blob/main/deps/v8/include/v8config.h#L923">https://github.com/nod=
ejs/node/blob/main/deps/v8/include/v8config.h#L923</a></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:17ED9FCFBD78C1BE.18027@lists.op=
enembedded.org">
      <p>For GYP, while enabling cross compile, it simple duplicates
        sources as host and target,</p>
      <p>so the bit specific source could not work if host and target
        have different bits<br>
      </p>
      <p>Ideally, nodejs should split bit source conditionally along
        with arch test<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1i=
VahdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">if so, than I would follow=
 the suite and disable building for 32bit machines
nodejs build in OE is quite unwieldy and this just makes it a bit
more. Is there a way
to improve qemu-user ?</pre>
      </blockquote>
      <p>For qemu-user solution, it is just a workaround for cross
        compiling, and force the build depends on qemu</p>
      <p>which made the maintainer of nodejs become a qemu expert.<br>
      </p>
      <p>For the <span style=3D"white-space: pre-wrap">segment fault on a=
rmv9, although I found the issue was caused by the commit via git bisect<=
/span></p>
      <pre class=3D"moz-quote-pre" wrap=3D""><a class=3D"moz-txt-link-fre=
etext" href=3D"https://urldefense.com/v3/__https://github.com/qemu/qemu/c=
ommit/2521b6073b7b4b505533a941d4f9600f7585dc7__;!!AjveYdw8EvQ!etOk8rfOj3A=
-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4=
wb4a6jNktBMCeQ$" moz-do-not-send=3D"true">https://github.com/qemu/qemu/co=
mmit/2521b6073b7b4b505533a941d4f9600f7585dc7</a>
</pre>
      <p><span style=3D"white-space: pre-wrap">But it is hard to debug an=
d fix it. The qemu rework it, no minor change</span></p>
      <p><span style=3D"white-space: pre-wrap">Another similar issue is <=
/span><span style=3D"white-space: pre-wrap"><a class=3D"moz-txt-link-free=
text" href=3D"https://urldefense.com/v3/__http://errors.yoctoproject.org/=
Errors/Details/766923/__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7a=
oC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPD2XpLtw$" moz-do=
-not-send=3D"true">http://errors.yoctoproject.org/Errors/Details/766923/<=
/a></span></p>
      <p><span style=3D"white-space: pre-wrap">Although I do not met the =
issue on my build, but we may have similar issue on other BSPs
</span></p>
      <p><span style=3D"white-space: pre-wrap"># <a class=3D"moz-txt-link=
-freetext" href=3D"https://urldefense.com/v3/__http://errors.yoctoproject=
.org/Errors/Details/766923/__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ2=
9Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPD2XpLtw$" m=
oz-do-not-send=3D"true">http://errors.yoctoproject.org/Errors/Details/766=
923/</a>
# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/ou=
t/Release/<a href=3D"https://urldefense.com/v3/__http://v8-qemu-wrapper.s=
h__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimx=
IUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPia2TlrQ$" moz-do-not-send=3D"true">v8=
-qemu-wrapper.sh</a>: line 7: 252447 Illegal instruction     (core dumped=
) PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfalse -L TOP=
DIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot -E LD_=
LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/rec=
ipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.=
2/recipe-sysroot/usr/lib &quot;$@&quot;
# TODO: Fix with gcc-14</span></p>
      <p><span style=3D"white-space: pre-wrap">//Hongxu
</span></p>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1i=
VahdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
        <pre class=3D"moz-quote-pre" wrap=3D""> and why does riscv64 not =
work with existing
mechanism. if it is new
then separate that out into a different patch.
</pre>
      </blockquote>
      <p>I could move <span style=3D"white-space: pre-wrap">riscv64</span=
>&nbsp;out
        <br>
      </p>
      <p>//Hongxu<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqjP5f3KWZUi-=3DY+ueH1i=
VahdLHmU4Ww47-pnYv6o_U=3DA@mail.gmail.com">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">BTW, enable riscv64 buil=
d

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/=
__https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f758=
5dc78__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzO=
TimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jNHWdaQIw$" moz-do-not-send=3D"true=
">https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f758=
5dc78</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/=
__https://github.com/nodejs/node-gyp__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWA=
P2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jNdW=
9jNSg$" moz-do-not-send=3D"true">https://github.com/nodejs/node-gyp</a>
[3] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/=
__https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumentation=
.md*cross-compiling__;Iw!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7ao=
C3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPMycS3Zg$" moz-do-=
not-send=3D"true">https://github.com/nodejs/node-gyp/blob/main/gyp/docs/U=
serDocumentation.md#cross-compiling</a>

Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:hongxu.jia@windriver.com" moz-do-not-send=3D"true">&lt;hongxu.jia@wind=
river.com&gt;</a>
---
 .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++----
 .../recipes-devtools/nodejs/<a href=3D"https://urldefense.com/v3/__http:=
//nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3=
i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jOOF7bs3A$" moz-do-no=
t-send=3D"true">nodejs_20.16.0.bb</a> | 81 ++++++++++-------
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
u.jia@windriver.com" moz-do-not-send=3D"true">&lt;hongxu.jia@windriver.co=
m&gt;</a>
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
-| <a href=3D"https://urldefense.com/v3/__http://module-compiler.cc__;!!A=
jveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTR=
nRK_Gu85xnqCX1nTow58E4wb4a6jPcGtwzAw$" moz-do-not-send=3D"true">module-co=
mpiler.cc</a>:(.text._ZN2v88internal4wasm12_GLOBAL__N_123ExecuteCompilati=
onUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8CountersEiNS=
2_19CompileBaselineOnlyE+0x558): un
-defined reference to `__atomic_load'
+Fix:
+|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/Rele=
ase/node_js2c: error while loading shared libraries: libatomic.so.1: cann=
ot open shared object file: No such file or directory

-Upstream-Status: Pending
-Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:raj.khem@gmail.com" moz-do-not-send=3D"true">&lt;raj.khem@gmail.com&gt;=
</a>
+Upstream-Status: Inappropriate [OE specific]

+Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:hongxu.jia@windriver.com" moz-do-not-send=3D"true">&lt;hongxu.jia@win=
driver.com&gt;</a>
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
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldefens=
e.com/v3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP=
2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jOOF7=
bs3A$" moz-do-not-send=3D"true">nodejs_20.16.0.bb</a> b/meta-oe/recipes-d=
evtools/nodejs/<a href=3D"https://urldefense.com/v3/__http://nodejs_20.16=
.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzO=
TimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jOOF7bs3A$" moz-do-not-send=3D"true=
">nodejs_20.16.0.bb</a>
index fe7121156..34ec8ad80 100644
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldefense.com/v=
3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ=
29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jOOF7bs3A$" =
moz-do-not-send=3D"true">nodejs_20.16.0.bb</a>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldefense.com/v=
3/__http://nodejs_20.16.0.bb__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ=
29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jOOF7bs3A$" =
moz-do-not-send=3D"true">nodejs_20.16.0.bb</a>
@@ -5,17 +5,16 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"file://LICENSE;md5=3Dcef54676c547a5bbab44aa8be3be9ef7" moz-do-no=
t-send=3D"true">&quot;file://LICENSE;md5=3Dcef54676c547a5bbab44aa8be3be9e=
f7&quot;</a>

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
"https://urldefense.com/v3/__http://nodejs.org/dist/v$*7BPV*7D/node-v$*7B=
PV*7D.tar.xz*5Cfile:/*0004-v8-don-t-override-ARM-CFLAGS.patch*5Cfile:/*sy=
stem-c-ares.patch*5Cfile:/*0001-liftoff-Correct-function-signatures.patch=
*5C*file:/*libatomic.patch*5Cfile:/*run-ptest*5C__;JSUlJSUvJS8lLyUrLyUvJQ=
!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5=
YTRnRK_Gu85xnqCX1nTow58E4wb4a6jNYkFHgOg$" moz-do-not-send=3D"true">&quot;=
http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
+           file://libatomic.patch \
            file://run-ptest \
            &quot;</a>
-
 SRC_URI:append:class-target =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Using-=
native-binaries.patch" moz-do-not-send=3D"true">file://0001-Using-native-=
binaries.patch</a> \
            &quot;
-SRC_URI:append:toolchain-clang:x86 =3D &quot; \
-           <a class=3D"moz-txt-link-freetext" href=3D"file://libatomic.p=
atch" moz-do-not-send=3D"true">file://libatomic.patch</a> \
-           &quot;
 SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-ppc64-=
Do-not-use-mminimal-toc-with-clang.patch" moz-do-not-send=3D"true">file:/=
/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch</a> \
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
'STAGING_DIR_HOST'),qemu_libdirs)++ifd.getVar(" moz-do-not-send=3D"true">=
&quot;
@@ -120,6 +104,10 @@ python do_create_v8_qemu_wrapper () {
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
     qemu_cmd =3D qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
                                     qemu_libdirs)
+
+    if d.getVar(&quot;</a>HOST_AND_TARGET_SAME_WIDTH&quot;) =3D=3D &quot=
;1&quot;:
+        qemu_cmd =3D &quot;&quot;
+
     wrapper_path =3D d.expand('${B}/<a href=3D"https://urldefense.com/v3=
/__http://v8-qemu-wrapper.sh__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ=
29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPia2TlrQ$" =
moz-do-not-send=3D"true">v8-qemu-wrapper.sh</a>')
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

-# <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/_=
_http://errors.yoctoproject.org/Errors/Details/766923/__;!!AjveYdw8EvQ!et=
Ok8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTimxIUb5YTRnRK_Gu85xnqCX=
1nTow58E4wb4a6jPD2XpLtw$" moz-do-not-send=3D"true">http://errors.yoctopro=
ject.org/Errors/Details/766923/</a>
-# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/o=
ut/Release/<a href=3D"https://urldefense.com/v3/__http://v8-qemu-wrapper.=
sh__;!!AjveYdw8EvQ!etOk8rfOj3A-XDMMofWAP2t84WiQ29Av7aoC3i273l0aTZ4ybzOTim=
xIUb5YTRnRK_Gu85xnqCX1nTow58E4wb4a6jPia2TlrQ$" moz-do-not-send=3D"true">v=
8-qemu-wrapper.sh</a>: line 7: 252447 Illegal instruction     (core dumpe=
d) PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfalse -L TO=
PDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot -E LD=
_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/re=
cipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12=
.2/recipe-sysroot/usr/lib &quot;$@&quot;
-# TODO: Fix with gcc-14
+BBCLASSEXTEND =3D &quot;native&quot;
--
2.27.0




</pre>
          <br>
          <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        </blockquote>
      </blockquote>
      <p><br>
      </p>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111874): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/111874">https:=
//lists.openembedded.org/g/openembedded-devel/message/111874</a>
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
    <p><br>
    </p>
  </body>
</html>

--------------H2yor0CX6wY5o92HbaRWxZau--


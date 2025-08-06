Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7443DC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:40:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21510.1754473195948023912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0313cf4b72=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5766Wt5q3093746
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Aug 2025 02:39:55 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy9rpj7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 02:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9btk9/r+oCixw83dcp9NSaPv0SjDMFa+C1k31QafPRIW7PY1AuDnMm0QmJmeXGoeWOw9HxyLxiGurUU4oKmuTC+ZzKQm6aA+/dIZjF1uHeuQ6Rs31ppQb7oft+4mZKT+Vq26Y8UbnrFNPZY9MSAklNve7zB6I86t2l3oQLenrxeZKwOTzBDenj3H/Bqk+/NpNYy9FHn3gadeziq9FQFQ5PBTA/ORuVZnMH5+mGxaf/ZkVn3BSoIa5Q/oV8llzrrkLLVlz2UjOYcFwfzCBqjfyuOzM4++mkx6qYW9PwTIWEqV97mcXdjy7nurgtHsFeo1lEX436YlBHGIYFtRGB9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1vs1KZhuRC/0nrwdJU15AywYgPy1sCIz0qkflxHjSQ=;
 b=X1Mg5hZp6TihY6svsgDzq4WlYFHsF9KzvAoQU3/Gvng46EREdqep+xUKUhDpRrK5X/FDLQVf1ssHe1pLQYRikOrPyN8DmnmYgSpqrpMsefVbUVA82An4nCiCGPL2RWOlqYH8rKzq3Sk7ItTw0apHftd8Ao8g1fg0PKwKY/xPwr4WtPERZ1uwk102unvXNnHGc5n9eV3rCduKmIbyv7ajMS45Fqy5ygSsu8qqiNFdSFnzLXjCFsf2w7KbrlQiAqzpKShFP+turk1qoij4mf5hvWN3OlHwi3fscLLb56/SQQFBQoZ11BNEW9ZHXKWBrc8Zey3I8I79mUZMiUW2X4baRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 09:39:51 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 09:39:50 +0000
Content-Type: multipart/alternative;
 boundary="------------fDM7Yz6iXMblj17eSxK0Zsos"
Message-ID: <3a17e4d6-e215-45d0-bbb5-e9a5beeb4afb@windriver.com>
Date: Wed, 6 Aug 2025 17:39:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] luajit: fix CVEs
To: openembedded-devel@lists.openembedded.org
References: <185920C7B2EC82CE.26265@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <185920C7B2EC82CE.26265@lists.openembedded.org>
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: c80bd7f7-013c-4829-cce8-08ddd4cd3098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SlZmL3dubWdlb1ByV2dKbGdnc0hHb1paLzkyRnY3MWJ3ZnJYWmhoNTI3emRD?=
 =?utf-8?B?U0QvK1FXcHdBOGVhbndLR2FoNTFkY2dtSTFXSHY2MGhKdUNpWDFrdVJxYkNr?=
 =?utf-8?B?TklSSVcrWFQwT1U4b21iK1I0VEg3MWhoaVN6eDg2Y0VWbVpwanZJT1NWdWdK?=
 =?utf-8?B?ZngzZUJvbjcyRkw5dGRyRnhqcDN5WFUybk5UT1dESW5YZlZhQTBKSVZQaEll?=
 =?utf-8?B?MS9BbE1ucERCZUJoTnRBVnZBNjBqc0lKY2pCSkNQMGhpMmRrNzExamROVUdk?=
 =?utf-8?B?S01YdVE5VCtNMEl6aFBjakpLOTR5Znh6b3hLUlhTRXJmYnorTURBRnBFR1Zu?=
 =?utf-8?B?alZONDh6ejMvTzBZWFY0S1BFd09CUDRObXltajM4enFqdk1MWGZKM1BBRVFD?=
 =?utf-8?B?WjlsOGFQRWRzeUNQU212Zi9XQUxCbERPYXIweXQyQnZCVGdvbU5IUEdBMU96?=
 =?utf-8?B?bW5yNHFpZDBBbmR3U1poTzR2V1g1UXoydGJMZzdpaGtGU21LWXY0ZzRscGxH?=
 =?utf-8?B?Zm9heVRYRzFkdmpPQ2EvK28xcjFWNlhKT1Y0RmpGTWpJVWhrWlBpTCtQZFU4?=
 =?utf-8?B?bU5vTXBrSW80YWlnRVBKSkVBSDVVeEpYZzdmWExkc2J0WEVtbzVqK0REN1o0?=
 =?utf-8?B?aG1yN0s3K1F0My9tUVAvZDFKdHBxTW5zalMrOSt1bUgwVlJNd25oTllCTW8v?=
 =?utf-8?B?SHFCWEFyTldUcnZySUcvQXRmaU5kcEQ0RmgrUEp1eXZqNGRCYklEYjgzY1FS?=
 =?utf-8?B?OXBCTkpTVFU2SlhIOWFnYVQwMlFDbDFtditxN01OZXU1dTV1VjdtTC9aLzlN?=
 =?utf-8?B?MmRtTGFSc1FaMCtjYVVmaDF3RkNMSFUzQkpQWnkvS0dYOHRLS29FQnloNkRV?=
 =?utf-8?B?L3RnL1E0a3p1L2xPTDg2bE1nZW1wQTZsNEFXMzZkR0pjQ2tQMFRsV0J1OVlU?=
 =?utf-8?B?R201SlRmNXNGb3kyWThtWWZpNU0ycy93SXdqam9JbVFQdDh6amFlYnZuekNz?=
 =?utf-8?B?N0dMS01mcmtnbW42eUVrSXJtcFg1ZVlLa2l5RVVwaXltUHprR2t1MEVFR05F?=
 =?utf-8?B?NlZ6V053cHJhMlRxZlk3OWVMT1UzbEk5SWY3SEhxdm9nQVhyNGZxRjVWVXNU?=
 =?utf-8?B?MFpWeDlFWVNWbEpHeW5sS28rem5tcmNiVXhXc0NvMWdQbFJsV3FOMFhqUkZV?=
 =?utf-8?B?WXJsSE5Gcll4cHU2TFhyZzExZ0FRME5PN0ZaSlloR2h3L0VFTytiMmxWcTl6?=
 =?utf-8?B?N3hNUzIyUVJNWDNzV0RQZjNKRDJQMUErV1NPQnVLQmNPa1BjTndXejltS3Rh?=
 =?utf-8?B?KzV5aWliSklQUklnWW03UHFTN1Z5UFNnVEdjUTFpVXU5UlM2cXRUZEk2UmFt?=
 =?utf-8?B?Z0NoRVYrbVNKSjd6OWQzbWhLTkgwQkZXaE1zRTZ3V0xTc2h2YVhzbUowQmlW?=
 =?utf-8?B?RUhuOVo1aUtIeHFiQWpFRWZNRlB6dGJNQlhMSXU3em9HVk5jeGFzaE01SU1n?=
 =?utf-8?B?K3htQzBTMk5WNm5Zdng5aUVacjhESytJMVVCRFFoc05JUldnY2xUM1ZFM1RB?=
 =?utf-8?B?YmJTSWpQbW5XTlZYL0xwcEdXSXZNRFR6Q2RwVTIvRWVJWDhZUU5nbHEyOUha?=
 =?utf-8?B?Sk1kbm5qODBaSlloMktLU1lyU0NreE1IaUp3SEdmNS9LZmdPYURYVVUzV3c2?=
 =?utf-8?B?b20xK0RNdUdSOGhhL0NLR3c3djRvcmNLSVIvNWR1c3NsZXZVc0g5clZhWmkw?=
 =?utf-8?B?VnM0Ujk0WmRvclBMcHgxeWxKdmtHMlQ4dEdnQW5GbmpUSXYxWm8wM0FITE5W?=
 =?utf-8?Q?tFau9bxCScrceRaVeU6YbcqMIGxz9hvUD0THY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ym9jKzZnTXVBR3FnVUdqSnd3RmhUS21uVlh4U25mWGYwVm9JSGExTThPQlQ0?=
 =?utf-8?B?VkVnTytXRWJpNzd1RVNQU3BsZzROc0JhTVRNaWwrbk5PMDNqMndSemRXY2VI?=
 =?utf-8?B?K0p2bnRwaXZSSllpMTI2V3dtMXV4TzFTdFRyVC9kV0V5Y2xlRFNPdzFQem5h?=
 =?utf-8?B?cGFYRUJZQUxINWUxSnN6TktPOTFUMk5EYVdsVmJpcXFzblJXdUR4elpBd2k2?=
 =?utf-8?B?azBGblI2alUzVGZEVkhOK3NjL3N3enRwcEhNNU5nY3cxMUVpeGJWMkNWYmZn?=
 =?utf-8?B?M3ZiR1NqbVJLUWh4OEFyZ3JCbWlFZUxIYzY1L09Tb2lPS0E3SmwveU4xSm9v?=
 =?utf-8?B?cWlxUjhhcmhRK3FMOFIycUEwQkN0aWpVTjJ0anJGb2pQa09MclJ4SkI2T2dZ?=
 =?utf-8?B?ZGswL0gzL1VDRndEbStZSGRhNFhSTXJ2MzNoNWwrQTlMZ2pPMHE4ZDFCanF4?=
 =?utf-8?B?dVZMUHo3d3FSbWVzaWsySlptMnB6aTZXMzlpVGtWbTExcENMcG1Jbll6a1RX?=
 =?utf-8?B?QnlxYSt4S29QR0dRTjZOcHJqM1hjSXpJS1QvZGFKOU43dm1VVmtMaVArOGxp?=
 =?utf-8?B?bVV3eHVBVStYTU1hNXVnUkJUU010V0V5YmJEQjExUXhCRHV2RnRoTHI4aDBW?=
 =?utf-8?B?ekx3NWN3NmJYYUlGSTZPaVRiL0VXaGJBYjkxNFdZVjNrVlM1Z2MxQ0p2VHNR?=
 =?utf-8?B?Q2FHZGNRdXUvalMzWXo3YTZuU1hJdzh2WS94bmVYK2hadFB0L0ZaNWRkdGor?=
 =?utf-8?B?cGszMFJyZlVnSmJKQktEUzlCbjZOOXQ5V29LdG5GTmwrOEhFYjhFS0RtSlVw?=
 =?utf-8?B?cXl3a0R4VGFRYVVjcFhxNlBSUy9BVzlHMWMySHNEejZodlZMOTRrU3JlU1Q5?=
 =?utf-8?B?MEZGUm9mWWxmVGh4RHJ1QklrN2VLblRNSUxXYkpPSHFuVUt2S096aXp3TXNi?=
 =?utf-8?B?Zm1tNkZ2R1ArdGs3bUxIcDE2c1RUYjFKWXI4Wm03Z0xzd0RSSlRsVnUycnBD?=
 =?utf-8?B?T250S0U3MFNhRmg4U1RtRENHTVlNang5TTNxM0xaU1lMSURTWWg1MGYrcjNq?=
 =?utf-8?B?OHA1aXhObDN0MW5sb05JV1I3QWdmR1l6VEQrUVZyanIzZXAvVWF3aFV4eUZN?=
 =?utf-8?B?YkZ5UGFjTlMzQVJ1T3ZZd09qNTh1V1hoSExXWHo3ZER1L2p2NWNoZlEyc0tu?=
 =?utf-8?B?aFZQLzRnR2RXd0Y0ZHFpTXJobi9Zbm9TcnpHc09tTndTdG5qb1Vzb2xTNk8y?=
 =?utf-8?B?d1JLbkY4N0N5ODlXQlZJMnFzTllsWFBlY2QyTGxmWFFySGFpTDFCdS9kMUZ0?=
 =?utf-8?B?bjRQMUVvNE4zdWQrVmx0dGRNbyswY1hKemdjMXRwOXVyeCthZERWcHk3a0tV?=
 =?utf-8?B?VnJFVFZ4cS9uamZSTUpER0F3UU80N2ovbUV2R3NNN2E0dWJpSEFkaHExUHpx?=
 =?utf-8?B?K2FHVGxaMHJBdkFXdmd5NmFZQ1ZRcUE1bVZRdHBnOWxxL0hQaGp5d2FXMTNa?=
 =?utf-8?B?V1NxMDJGeVR4QVkwZEk4M2h0eWl2UWpodmI0aDFLU3hWQnFEaThuL293cko3?=
 =?utf-8?B?WHFQTGFQcElheExvQmtNcjZHQmVvM05rY3RYN1NETU51dFBXQzM5N0pyckpv?=
 =?utf-8?B?L1NoVW55Z3NsZ2hJNzN2RW5pM2c0Wll3Vi9pd25XVHd0ajd5QndWRmp1WjB1?=
 =?utf-8?B?RUpvNC93RktQclFMOHU5c0lXb1N3UDlXTVZwUDF5eDA0eWpScmM2WFd3aXJL?=
 =?utf-8?B?d0FWKzBrbDNOaHlLU0JMVmVlRDN1ZmhZNWRLQS9WS2MvT1g5TStiYWc5czh2?=
 =?utf-8?B?NkVxUHhKZGpqc25rUjVZK1h1WE8xNFViVXl5WFdpRE1JYjlnNkN3QlhLdUk3?=
 =?utf-8?B?bGt4a0pWT3VvQ0FuWTI5cUF3QnFrcldsalFLbWc3RVZweXZUZFFyWmdJL20z?=
 =?utf-8?B?QmJLbnVEZHRKK3h5VkNLVzFwYnZWdDJhWllHbEJnQVdGS0xsdUVLU1BkRTh6?=
 =?utf-8?B?em1BaUxYbzNQM1I5WFdFUEJ0eWNtYitjbllDYlpoaDROYXZHelFWN2xqTVB3?=
 =?utf-8?B?akdHbHJVanV6SEJFbjRFOUJPajVDd2R2WldHZ1N1Z3R2SERhZGtMZ0pZRDI1?=
 =?utf-8?B?Tlh4dE55Vnd1REp4K01DWllxdkJpWE5tVldKY0RnRkVYU09rcnVUWExYYTcy?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80bd7f7-013c-4829-cce8-08ddd4cd3098
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:39:50.9048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Evhd3tTkHNtX5j58nt8dpCzEJphY07ZCCTiF2Hck0sxQTBPSvpzcUxdhbseoDNoQN5ib1sxWmvlEx4tqkf1e1SmtUipEz0iNyG3t0Z9FUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=689322eb cx=c_pps
 a=OUM1w/RX8+2X2JTftP90HQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=nm2HxRzrAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=AGxDhnMDzjEI3nDh67IA:9 a=QEXdDO2ut3YA:10
 a=0lYOTdnTn9GiLJxzAXUA:9 a=SwhD4MGoUrhn5OLG:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=xTkba3CB784Yst2QIEaM:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: w4NfjL5VLOQW2UKTWJX97VPNTqWDonYh
X-Proofpoint-ORIG-GUID: w4NfjL5VLOQW2UKTWJX97VPNTqWDonYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA1OSBTYWx0ZWRfX4WKuDgbDGzG1
 prxEPViYVZsl+e+QjDSAf0HXh7IAUKz76bXcGQT5XPAcrpMwHKUlh673Z5lKznwaRAChZKCQk3q
 TFwMf2OJMHzvYuRC+zTJ0R2UwRTslEncKugBPA934LN75oFBdeVXPTZTtEfdSESrt1I14dLmCS6
 551shNVOz7f4g57j4CYp61hKP5JvzQ8ilDwEOnU9o3AQ1xAB6mcxWHsKqlWA/qm1C50CDAyFAmb
 sfH/ZlfKiL+ATkJRRP+oH00Vpq6I6T7SGg/eJuQMpdgbuNg3EJyJ2XBtJNZtuHlj3hC1xj/78lB
 qqYGyvrcJtRXPia285mPFoGeZy3/SDAbNefkM+6tv6iiSrmK47OOUaYHQTtk9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 09:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118891

--------------fDM7Yz6iXMblj17eSxK0Zsos
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this mail, I will send a V2 later.

Regards

Changqing

On 8/6/25 16:39, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> fix CVE-2024-25176, CVE-2024-25177
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../luajit/luajit/CVE-2024-25176.patch        | 32 ++++++++++++++
>   .../luajit/luajit/CVE-2024-25177.patch        | 44 +++++++++++++++++++
>   meta-oe/recipes-devtools/luajit/luajit_git.bb |  2 +
>   3 files changed, 78 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
>   create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
> new file mode 100644
> index 0000000000..7dba4e8239
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
> @@ -0,0 +1,32 @@
> +From 810bf18ff0ddbae9b2ceb30dd8b9c901cc634d1f Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Tue, 5 Aug 2025 14:49:06 +0800
> +Subject: [PATCH] Fix zero stripping in %g number formatting.
> +
> +Reported by pwnhacker0x18. #1149
> +
> +CVE: CVE-2024-25176
> +Upstream-Status: Backport [https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc]
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + src/lj_strfmt_num.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lj_strfmt_num.c b/src/lj_strfmt_num.c
> +index 3c60695c..41214894 100644
> +--- a/src/lj_strfmt_num.c
> ++++ b/src/lj_strfmt_num.c
> +@@ -454,7 +454,8 @@ static char *lj_strfmt_wfnum(SBuf *sb, SFormat sf, lua_Number n, char *p)
> + 	    prec--;
> + 	    if (!i) {
> + 	      if (ndlo == ndhi) { prec = 0; break; }
> +-	      lj_strfmt_wuint9(tail, nd[++ndlo]);
> ++	      ndlo = (ndlo + 1) & 0x3f;
> ++	      lj_strfmt_wuint9(tail, nd[ndlo]);
> + 	      i = 9;
> + 	    }
> + 	  }
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
> new file mode 100644
> index 0000000000..73ad9837aa
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
> @@ -0,0 +1,44 @@
> +From c8421200e9accf5a10a52768bb3dca2f555bd092 Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Tue, 5 Aug 2025 15:05:07 +0800
> +Subject: [PATCH] Fix unsinking of IR_FSTORE for NULL metatable.
> +
> +Reported by pwnhacker0x18. #1147
> +
> +CVE: CVE-2024-25177
> +Upstream-Status: Backport [https://github.com/openresty/luajit2/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f]
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + src/lj_snap.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/lj_snap.c b/src/lj_snap.c
> +index 4140fdb7..d7027875 100644
> +--- a/src/lj_snap.c
> ++++ b/src/lj_snap.c
> +@@ -453,6 +453,7 @@ static TRef snap_replay_const(jit_State *J, IRIns *ir)
> +   case IR_KNUM: case IR_KINT64:
> +     return lj_ir_k64(J, (IROp)ir->o, ir_k64(ir)->u64);
> +   case IR_KPTR: return lj_ir_kptr(J, ir_kptr(ir));  /* Continuation. */
> ++  case IR_KNULL: return lj_ir_knull(J, irt_type(ir->t));
> +   default: lj_assertJ(0, "bad IR constant op %d", ir->o); return TREF_NIL;
> +   }
> + }
> +@@ -882,9 +883,13 @@ static void snap_unsink(jit_State *J, GCtrace *T, ExitState *ex,
> + 	if (irk->o == IR_FREF) {
> + 	  lj_assertJ(irk->op2 == IRFL_TAB_META,
> + 		     "sunk store with bad field %d", irk->op2);
> ++	if (T->ir[irs->op2].o == IR_KNULL) {
> ++	  setgcrefnull(t->metatable);
> ++	} else {
> + 	  snap_restoreval(J, T, ex, snapno, rfilt, irs->op2, &tmp);
> + 	  /* NOBARRIER: The table is new (marked white). */
> + 	  setgcref(t->metatable, obj2gco(tabV(&tmp)));
> ++	}
> + 	} else {
> + 	  irk = &T->ir[irk->op2];
> + 	  if (irk->o == IR_KSLOT) irk = &T->ir[irk->op1];
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> index 3f3939eeb4..52126d2790 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -6,6 +6,8 @@ HOMEPAGE ="http://luajit.org"
>   SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>              file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
>              file://clang.patch \
> +file://CVE-2024-25176.patch \
> +file://CVE-2024-25177.patch \
>              "
>   
>   # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118890):https://lists.openembedded.org/g/openembedded-devel/message/118890
> Mute This Topic:https://lists.openembedded.org/mt/114562825/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------fDM7Yz6iXMblj17eSxK0Zsos
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Please ignore this mail, I will send a V2 later.<br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 8/6/25 16:39, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:185920C7B2EC82CE.26265@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

fix CVE-2024-25176, CVE-2024-25177

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../luajit/luajit/CVE-2024-25176.patch        | 32 ++++++++++++++
 .../luajit/luajit/CVE-2024-25177.patch        | 44 +++++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_git.bb |  2 +
 3 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
new file mode 100644
index 0000000000..7dba4e8239
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
@@ -0,0 +1,32 @@
+From 810bf18ff0ddbae9b2ceb30dd8b9c901cc634d1f Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 5 Aug 2025 14:49:06 +0800
+Subject: [PATCH] Fix zero stripping in %g number formatting.
+
+Reported by pwnhacker0x18. #1149
+
+CVE: CVE-2024-25176
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc">https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc</a>]
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ src/lj_strfmt_num.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lj_strfmt_num.c b/src/lj_strfmt_num.c
+index 3c60695c..41214894 100644
+--- a/src/lj_strfmt_num.c
++++ b/src/lj_strfmt_num.c
+@@ -454,7 +454,8 @@ static char *lj_strfmt_wfnum(SBuf *sb, SFormat sf, lua_Number n, char *p)
+ 	    prec--;
+ 	    if (!i) {
+ 	      if (ndlo == ndhi) { prec = 0; break; }
+-	      lj_strfmt_wuint9(tail, nd[++ndlo]);
++	      ndlo = (ndlo + 1) &amp; 0x3f;
++	      lj_strfmt_wuint9(tail, nd[ndlo]);
+ 	      i = 9;
+ 	    }
+ 	  }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
new file mode 100644
index 0000000000..73ad9837aa
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
@@ -0,0 +1,44 @@
+From c8421200e9accf5a10a52768bb3dca2f555bd092 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 5 Aug 2025 15:05:07 +0800
+Subject: [PATCH] Fix unsinking of IR_FSTORE for NULL metatable.
+
+Reported by pwnhacker0x18. #1147
+
+CVE: CVE-2024-25177
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/openresty/luajit2/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f">https://github.com/openresty/luajit2/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f</a>]
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ src/lj_snap.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/lj_snap.c b/src/lj_snap.c
+index 4140fdb7..d7027875 100644
+--- a/src/lj_snap.c
++++ b/src/lj_snap.c
+@@ -453,6 +453,7 @@ static TRef snap_replay_const(jit_State *J, IRIns *ir)
+   case IR_KNUM: case IR_KINT64:
+     return lj_ir_k64(J, (IROp)ir-&gt;o, ir_k64(ir)-&gt;u64);
+   case IR_KPTR: return lj_ir_kptr(J, ir_kptr(ir));  /* Continuation. */
++  case IR_KNULL: return lj_ir_knull(J, irt_type(ir-&gt;t));
+   default: lj_assertJ(0, &quot;bad IR constant op %d&quot;, ir-&gt;o); return TREF_NIL;
+   }
+ }
+@@ -882,9 +883,13 @@ static void snap_unsink(jit_State *J, GCtrace *T, ExitState *ex,
+ 	if (irk-&gt;o == IR_FREF) {
+ 	  lj_assertJ(irk-&gt;op2 == IRFL_TAB_META,
+ 		     &quot;sunk store with bad field %d&quot;, irk-&gt;op2);
++	if (T-&gt;ir[irs-&gt;op2].o == IR_KNULL) {
++	  setgcrefnull(t-&gt;metatable);
++	} else {
+ 	  snap_restoreval(J, T, ex, snapno, rfilt, irs-&gt;op2, &amp;tmp);
+ 	  /* NOBARRIER: The table is new (marked white). */
+ 	  setgcref(t-&gt;metatable, obj2gco(tabV(&amp;tmp)));
++	}
+ 	} else {
+ 	  irk = &amp;T-&gt;ir[irk-&gt;op2];
+ 	  if (irk-&gt;o == IR_KSLOT) irk = &amp;T-&gt;ir[irk-&gt;op1];
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 3f3939eeb4..52126d2790 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -6,6 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://luajit.org">&quot;http://luajit.org&quot;</a>
 SRC_URI = &quot;git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            <a class="moz-txt-link-freetext" href="file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch">file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch</a> \
            <a class="moz-txt-link-freetext" href="file://clang.patch">file://clang.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2024-25176.patch">file://CVE-2024-25176.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2024-25177.patch">file://CVE-2024-25177.patch</a> \
            &quot;
 
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#118890): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/118890">https://lists.openembedded.org/g/openembedded-devel/message/118890</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/114562825/3616873">https://lists.openembedded.org/mt/114562825/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------fDM7Yz6iXMblj17eSxK0Zsos--


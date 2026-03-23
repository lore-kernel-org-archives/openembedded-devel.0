Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1BDEC01D8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15349.1774266130086127136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lY1+9uaU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5kqHF3731459
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5sIKmZaKgHQADWFlwzqkzyoD+o/NGsxzGLHayzltHY8=; b=lY1+9uaUuaFT
	sf2ekJkh2nxd5iYFsMsLnj4dOpa6AhGE5JVNFqJMTyVzc3jE5NwhUzUI4XMesUPe
	2MWfS1bkcfngKag4PdMAE0JyM40HcyjBet7AZBGwBTEmpPIFzP2/gtUQ/KsrmBG9
	4Tmzaw8sS2GaP5QBLkx+SF7XOMMw1zEZ9sSKiBiZQma8pN/9MvEkixlXVYCZ6OIC
	EaJkCJKPimeNkJIE77a5g8ifsxjdanpvPmR2iROc6tgGtJzClgk30SHIwj9m/0Pa
	Q94F2jXdnzzwRxAGdJ4GM1sNrQXufvg+ndLkhCOTqFDoRfqhLX8uMCstef2JwbLu
	vt2V2ZVS0w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2h-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAXENSOq2pZyIC5TJGtSgmZ/0WP9Awfw72jNemrecdVTqT9O/oQJHLPEB5mbEbrRwodFu+FXlzabNCi+3YDFWw8fciZ5jXAtr8w8G+Wetvuht3lJNPtNCucm1ykUH+mpNQPA/erzEfcYHYybZEdG7kgeptyOvotxQD45mqs5ugOavWQ4PXF3qAQVwQTvX4yNNrvb4WsbdBJFmbRxFh+VOMn9hHE8YDUL6FWEr4DzivtiUBfDh/nbcYkWH4ZuCMxJSx3bhPnZ8F1P6ZWhyJhUNQDMv3gXj3k9n+nb/cG8D+1Z2Owk0mbt+wy7k6SXHF2cxtCdjd0g2+64OFEBqwngdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sIKmZaKgHQADWFlwzqkzyoD+o/NGsxzGLHayzltHY8=;
 b=MVuzm4Lw0DjtZOnYgxLb5RIApUXH3nFUoy8haHyZnmAF3d/aNzjTVEfvBPW6hee9xOQGXFNpaP+AC7Mdcc2R4J+tPAbMnjYH7iHlxCqwvM3iAcwxZUbiUWna+l7EME2SxKZa175U+V8dWmmZnbw+sUahw+V8z7p69RyYfcVGMKYR0mW9SqPxT1sDWUJ6d5YEENM+v4ft2XzviCz/qs6/ZPJIFqeiiMdEmkjPWVzBYb4+gRb4lteXIciJfPLYBxMZIBO+kllS2VtHB7RHYgh6wjeqB8OMAB0GTEzLBcy5D7Zyis3VnGdR+zR70cr0ZaZOTpnIqB8WKDjWIsZ2bfqMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:06 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:06 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 02/15] garcon: upgrade 4.20.0 -> 4.21.0
Date: Mon, 23 Mar 2026 19:41:39 +0800
Message-Id: <20260323114152.4178269-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cc5e90-dfaf-469e-c43b-08de88d1355a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Rm3aB19rxklSdGo4+V8TU+7FWMwVNo61uDDxRKHJkd43nqgh2WhxFBKhWkrU6awUa9uTUlbf71fwxnp8x7ITLL+GQd5W44nb8zN6ujPgjDcnLPvtmJHWBx1cByE63/hqXEb63G93cWUtnNNUMusFQ7BCuVmJEeSZdL29AJbMkPi6fsZ/m55b/UU+jIkyANGMHlUm5u3tGDI0iutlHzIBIwF4dHqFc5n8PBgNRTQHE7anGKVU1K+S2JxxFjUWHDrLFjKX53L0B9pdRFgN1b4iP0w0ZkKm07Jf+pykoqe2K4Y8S/YWiwohUfwVg5QhhwQv6eXbBpGzr9rBHyO/oUwJGR9k43BK7JkkLCmpl7l8d5ijgV3v4KOJxDnzVed0+rBUyg4vTL5zsw4947EF8RAnxGRxr0aD5fuIgLldmMenPPQ9HyclkxBhTXwFLGa1NtjDB+caXZPc3Z29fUU5vNMqV1+KU+2Whc6aTPhF1YmWEl5DpieXBxxIxyT7hnqLGuONEACDxPQTaST/LSnlrM4HgZQ0odOJAA/22ktPbLubvt54B5b4MrXg3VQhqH9zYRoPmDtf5v6zA5m3FwG6d09BUZV39NNsgdFOD7SX4vX3uGhEsaMujaZ+1jh4FYoUgdmRWs3ED1rdZPHzAZTI4IEvAqwILj6IWebp8li85JlTXiIuBU49hKcQBJaPToAHavfF8kWoO61PGA8o0tCHV84q2MvQjrupxlhjbEeyVh0RUJQc1lpYkZfSTm0HlOjaT4Yl8D6iDQvYfwtb6GzPel0nS3WRzG8qSOA2Xkivwnx8Z6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDBuVlJaWnlveUo5YU9ETVU3a0JYRkNrWDhRKy9VY1owRUVycUZWckJIT05r?=
 =?utf-8?B?bjNQS1oxWGU2YVlJSnRGQkU1Um1JM2E5czEzdy83aThhY2E4cDZrTHcxQVJ3?=
 =?utf-8?B?MUFXNkxmQUNleU9hTjFrdWh1WndDUnlZZ0VGNGs4YkZnVFZYckluT0lJUFpr?=
 =?utf-8?B?UzY0MVJmZTM1TjREOFNTYkNUYk5XSkM0OHRqZWluS3ZYdGdHWE9mc1VzeGZk?=
 =?utf-8?B?R0ozWGFJVDdldU56NkVoOW5zeHhOK0NvLzFHY3VpVnNsWmc0N3ZZbWhPamZo?=
 =?utf-8?B?d08xa2cvdGpzTDFLOXVPN2JwQmlEOUkyaXU5aFFFZ2dTVENqU2hJendOK0gz?=
 =?utf-8?B?UGdWY1dMLzVQM2RVd0tsRWVyc0Q3YStNZkdBVGZBTHVsV1prelRZSXNyTnJW?=
 =?utf-8?B?WTBpYytnM1NYNDlMbXdVc3Bua1NzVlNmOVhKQU1qZ2t1TDczcitZN0NZR1py?=
 =?utf-8?B?encvMnF6K29iNVc3SHBXcXcvdlBnQW5oaWEzakdNWXgrSkd0TWN4eThkMC9N?=
 =?utf-8?B?RkpBb1RTZWZXdzllRzdSaVlUeFY1aUVoaXh4S0tJYmtxeUo0akZvOHdqQzJU?=
 =?utf-8?B?cEN6L1Z2MHVSL2V6TW9QL1N5OFVwM2FSTmlScGpNdERObVRQdTlIS003eWha?=
 =?utf-8?B?eSs3bVVkUENzSGovL0FVcmJwSlJvVFBwU1UzRFdsSTBkN2FOc2xIZ1FueWk1?=
 =?utf-8?B?Q0pvU0U4MVArYWVnNTRhWEdCYjdGRkl6ejV3VHZuT053SG5NRlRqUkY3Vk1S?=
 =?utf-8?B?c3ozbWI4S0JnWVV2b01vdlpOVnRLMTN4ZzJTOGI5ajYvbU9xNThFYWEwQUFT?=
 =?utf-8?B?cTFEalgwZ1Mwd0ltZVAvMnp1WVozYTVnenlEVkV2Y2ZXSFlkTUFtczZRczY0?=
 =?utf-8?B?SHBRQkh2YVFaRGdvVUhQL1N3VWVxRkpYaGNvRXZtVGQyZ3NlVTNmS2ZVUWhx?=
 =?utf-8?B?bHFSdzVaSk1CejY4R2g1L0tMcUk2Nk4wTkxESGpSMUhxRi9JZ2hmRDRPRDU0?=
 =?utf-8?B?UEVlblAvVHd3enBGa092Qkc1TU55ZkN1RmRtdWRhZ0lITHZQSlVOYm9sQkIv?=
 =?utf-8?B?bGxpMzZ4Nmw5UE1KM2FSRFdITGhEdU4vL3ByZko5ZjcxTlZwYTJVcWRISFR3?=
 =?utf-8?B?SUpHcHpsSndCK1RVQTNLN3paeW1qSjRyMGxYYklBTVpzYmNsMVIzNzNFQkNr?=
 =?utf-8?B?OEx1M21WRi9pcjFZaWtpQXlSWjdTWmlCVjlzNElSWEEwYkNORTlNdHdGV3U2?=
 =?utf-8?B?Skl1dno0emhKdWx2dUYwRzNVK1B5V2VLZ3IyK3R2KzRZSU1jZU04ZTIrZmZU?=
 =?utf-8?B?cEdIdEFpbjBMdEVVTkp3ZXRmaFloTSt1SVdwOXgxdlA3M2dFWGhOMGF0Y1Zk?=
 =?utf-8?B?RDQ1aG0xRTl2bklkd2NVUGFaekUyN1hYdzR1UTQ4RlF4SGdmQXdPd1BpQVpZ?=
 =?utf-8?B?TzdzTUFseVVhQTl1R1E0aXlOSmZuS3YwZmplRW84V0Jka1pvNTVsem45bmlR?=
 =?utf-8?B?QzlQOEdSbVRoWjZ2WU91NFo1d0hDVmNtN05Id3pmRzBIamxNWDFsc0dhMW5i?=
 =?utf-8?B?dWRMRStpVDdvaEd3MmFyOUtqVGk5YVNvRWkxa253ZDVzRTFIdys4NUhPSHoy?=
 =?utf-8?B?Um5xclZrSXVBZFZsSlVWUE8wZXpSSUVSSzRlWUgweUlmVHg5ZHdYVEJ3NTEy?=
 =?utf-8?B?K0IvQ0RVOFVsdEw1SXVXcVRBZE1DUlVDVXNSSWFTaThVRElPWGdUc29xdXFF?=
 =?utf-8?B?REpESFNpd29iVzFmOGd6THV5L3B1TzVqb01DTzVaWm54M3dvSlBkYkFpUHk0?=
 =?utf-8?B?OUh4eU5mNWlaZnhYeDkvdFlVc3R4ZGJBTGMyRFJEbnZyMHVZMnZ4aWUwdmhL?=
 =?utf-8?B?Wk8rd1UzNGRkUWpwTjAydy8vZmIrZ2xydnlib2l5STZMbGZrMHVyOWw0NHdl?=
 =?utf-8?B?bFRPZzc4a3R1UEFOZE1XUk9KVlhxaHcvWWNHcEp2QjN2REgzeWdJOWNHVUxh?=
 =?utf-8?B?ZTZUM0ZLWlltYitQUm80M0xkcnMwYUU0K2ttcFQ4emFEQ2tkbkgwb2hGdmZ0?=
 =?utf-8?B?d3YxVXNqQ2pKbjJ4L0NsUWk0d2RLaXdIK21ZMDBOUGxZb3dDcjVrb1ZhRlFL?=
 =?utf-8?B?ZGFLWVNnNlRlTGVIQ3BtdCtzNnFsNEM2UkU5ZFB0aHNEV0ppQStYakpWT2w4?=
 =?utf-8?B?NDhmYkRKeTRKZjFsS3hZbktReUJaR085NHhLZGtLamx4YTl1L3M3YnhBdnVy?=
 =?utf-8?B?U0tzTWFNVi9GcUZKTEdmZ0lhenRkb3FlUlNFVzBhbDV2eXFtbzdZdjllSFNP?=
 =?utf-8?B?YUt1cThGMVpScFl5V2V4MkllMVRwOXJNTXdtejkyengzME00SFgzZ0tkaVN3?=
 =?utf-8?Q?TIYctS41bvL9+kKo=3D?=
X-Exchange-RoutingPolicyChecked: 
	XDqSuRTvni/1v6vDxf2jnZhaSEv9X8xDElWe9T0c268LxaPdb5lCuCkcTv8nb3jgl8/Tx27Bvau3xiCgsTe6YghNFiKhybTfJOXdLHZAq4plFNlj2U5Axe5lYsioBiIMvjSHTd79CylahMOUNNHaKmmIyd5Q+ymf9Ek1nUQWxEfvm1weTvK+1V/OA1uNDqyjhr6Zmq0vLWN5U6GL+G7JfqeoEZyIHwwXtOmsHJdp06eE6mTpf3HLGZGqvcqTtkLKipsE5Xp1o0xLBagA2ASB5lIG0m+grpa6BtdXtAwJtuc8T/BKcnfVgrr6AlrHNuJ/ELXx4eoqZn+ulCMyxy6k6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cc5e90-dfaf-469e-c43b-08de88d1355a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:06.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paoAjEu8rK8kbV/XUkTfrQKj/62xbHj5GuC5XhP5hOd6jBD+eXm31MCts5dpMICfkBZQmEG/XvaZfH9jVbzKjx7R+s4N8hk4GqpkBwSIGks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX5Gm8fTiIcSo3
 8U6TW0xg5GwgbqhE9sL2xjK54HTXT/U3MDnZfqIou0vyHBwazls2gpLqJKspdRxHf/xH4FyHFIa
 JtnSLE3tU259FpuyIPthoEmrN4K+G4PXOyZj+SsmYLIRNDUZvOjpalRcYwc7+n31sDFuJPbTZ1X
 t93ZHOujzd+I4MNH8wTIa2gFANxIQ8FVksVoFoZakGFtZjjedjnWssNcSqjunVZxnMcut8JdYyb
 8JqiktsOWUW2YdJkov4Vj35gbC8yGxUCVptxCdCiroXiJNX1gJLLe+i4u0KZo0N/edxEd8NQRxe
 6f1kv3VYxRQS5zBS67S25jcEz9/xZLZA/24QZf34hWcdVr7AsTDvR/ffTgSPc6NiblfuOFARTx8
 yGA5lrXNeHBtvt7lzaBSUdstUGJw/HqD2qaN9gasQYE6f81eG4YRA+gETCIMPQaZasd8isgPEjd
 rZpzoBh/IXKzS3CNZtg==
X-Proofpoint-ORIG-GUID: VUDtmFYFWin77oMLmUxHdCisSmx6iiZT
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12711 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=4ETO1KklNzmHfn55AIEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VUDtmFYFWin77oMLmUxHdCisSmx6iiZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62N5kqHF3731459
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125505

From: Zhang Peng <peng.zhang1.cn@windriver.com>

4.21.0 (2025-03-23)
=3D=3D=3D=3D=3D=3D
- build: Automate copyright year management
- build: Define xfce4 min version >=3D 4.18
- Replace deprecated exo with libxfce4ui 4.21.0
- meson-build: Add tests option
- meson-build: Use SPDX license expression
- meson-build: Update debug/optimization flag management
- autotools-build: Fix EXTRA_DIST redefinition
- Add meson build
- Set up GNU symbol visibility
- garcon: Remove include guard from private header
- garcon: Don't install garcon-marshal.h
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian, Armenian (Armenia), Asturian,
  Basque, Belarusian, Bengali, Bulgarian, Catalan, Chinese (China),
  Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Esperanto, Estonian, Finnish, French, Galician, Georgian,
  German, Greek, Hebrew, Hindi, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kabyle, Kazakh, Korean, Lithuanian,
  Malay, Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian,
  Uyghur, Welsh

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../garcon/{garcon_4.20.0.bb =3D> garcon_4.21.0.bb}         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.20.0.bb =3D> garcon_4.21.=
0.bb} (68%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb b/meta-xfce/r=
ecipes-xfce/garcon/garcon_4.21.0.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
index 5d7282ecbf..06ad0b9fbc 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
@@ -5,6 +5,8 @@ LICENSE =3D "LGPL-2.0-only & GFDL-1.1-no-invariants-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D04a01abcbdabffae1ca26335a2932=
76b"
 DEPENDS =3D "xfce4-dev-tools-native libxfce4ui intltool-native"
=20
+XFCE_COMPRESS_TYPE =3D "xz"
+
 inherit xfce gtk-doc gobject-introspection features_check
=20
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
@@ -12,12 +14,16 @@ inherit xfce gtk-doc gobject-introspection features_c=
heck
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-xfce-applications.menu-don-t-bloat-settings-me=
nu-by-.patch"
-SRC_URI[sha256sum] =3D "7fb8517c12309ca4ddf8b42c34bc0c315e38ea077b5442bf=
cc4509415feada8f"
+SRC_URI[sha256sum] =3D "3acc3f6b81059199f4e6646da7b6ca39edf84ea90dd3ff87=
088ffca6aa108269"
=20
 EXTRA_OECONF =3D "--disable-gtk-doc"
=20
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH=3D"${B}/garcon/.libs"
+    # g-ir-scanner needs garcon/garcon-config.h but it's generated in ${=
B}/garcon/
+    mkdir -p ${B}/garcon/garcon ${B}/garcon-gtk/garcon
+    ln -sf ${B}/garcon/garcon-config.h ${B}/garcon/garcon/
+    ln -sf ${B}/garcon/garcon-config.h ${B}/garcon-gtk/garcon/
 }
=20
 FILES:${PN} +=3D "${datadir}/desktop-directories"
--=20
2.34.1



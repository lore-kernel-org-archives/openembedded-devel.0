Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4029CC02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:46:47 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web10.16014.1736927196728926960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=lH2xHkVv;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736927196; x=1768463196;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=y7lhsFkCJ18IYtuNJOxhQBMddiamf1xngPJ6hWGXUx0=;
  b=lH2xHkVv6S4CTV8qmuMVaAKv67WM0HVR1oaVvg03BxoYz/3ibxiw0gA6
   qrZEZ6OUUcA1cgXgU9C8n0OgH+47qoRLbhCJgX+40IjaOG7n3n0rOsyU3
   /RV3zaRruSE9EEMcz91CCbSSQ1jgKp91yS80mOWQl6nsBC9ewWUngt3nj
   62hqwRXi/h3zWFRLYjJiL8tGDXOxjegbLcOJdFTogVeZGlOwpG89ACTAq
   X6WCXZsjUyCoO3qIhqJoCP91rTHiEHSgHaPsBSfmy+LdO5OhdYB/tb2kE
   CEdmxvdpJrw7ptnNN4UAgsXcKx0V1ky3bPyJwDDN3gdp2YGoOi2v3pHix
   Q==;
X-CSE-ConnectionGUID: AJJfju4uQrilQcrXV8CpcA==
X-CSE-MsgGUID: OojZnKnQQvaVBCCqikCNMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="143038683"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="143038683"
Received: from mail-japaneastazlp17011028.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 16:46:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxY4o8erX6lZvdc1IXrX77ytHOHELT9W1RJX6Pva8WJDUjenDgPwwSVQNLxfdYwCDt99lqS3VzD4iehi2GYXThbWRUDr5eshI31pCByziv7hx3OpqH1VwSCsT3/I5Kj9O1VWDupCpDkP5X+QGKUr9dyvOOdqYyfEMjTLSYyWvnXHF8GiUW2eHvAoG9tK6fstRdS8b2HKa4LPW26gdSCNEWaFUoDwfQ/DcCKVdB00v7dFeLbz8wvc5xfVy0yKPOxbmc4bGl5lJi4bQ0cTtvzbm3svOY7vf0WLLdAyoHwMgCE1bqksHpeLJYief+CDtKkGepSXw9I8cn31QKjUPVVTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7lhsFkCJ18IYtuNJOxhQBMddiamf1xngPJ6hWGXUx0=;
 b=Zk9QeytGnAxxBiSQB6leIeiHMwp42b0ZLH3ekG2PlRD9U/pz5vogA7eCN4I99obHzkraEqAztxLBeMfC1gUg0UNiIbz0MMrjYAR6SFRu50YFygPMlPmImgkZhsYY8TXuaz0TmqFJ0oaWvMVcn+glk9zQfWY+h49eegMiXZhRlSav6qjUUgrGJEFB0lz+849e3w9k5ftvuFq7bjZYDkzy/8um0qHOoJZdwqHQMWKXKq0WxIBXWGzZMMyFFVJygKEILor50UGvrNMfOa43rXKXBp7FEQj34zO5h8m4ZVZYfRQdHroCg85oVenT6Gq19Dx7zVITgT5/+TChd6roGcmTEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OSCPR01MB13470.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 07:46:31 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:46:30 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: ChenQi <Qi.Chen@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
Thread-Topic: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
Thread-Index: AQHbZYTRuZA0RPztTUWnE4i0KTk24rMXQcuAgAA2PjA=
Date: Wed, 15 Jan 2025 07:46:30 +0000
Message-ID: 
 <TYWPR01MB11861397A8D3E76C13151E6E6DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736749897-27279-1-git-send-email-wangmy@fujitsu.com>
 <5540bea7-e33a-4e2a-9429-71323d819deb@windriver.com>
In-Reply-To: <5540bea7-e33a-4e2a-9429-71323d819deb@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZjkzMmRiM2QtMTZlNi00MzJlLWE5MWEtYzFhNzQ5MjAw?=
 =?utf-8?B?NGIxO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTE1VDA3OjQ2OjI2WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OSCPR01MB13470:EE_
x-ms-office365-filtering-correlation-id: 3ac3c1a8-aa83-4ba2-f5ae-08dd3538b9b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VTU2SzRTNXBiclZNVFFPek1kRS9yU3RpckdhRjRCRDdsQ3FIQThGMXF5VmQr?=
 =?utf-8?B?VXl3bzZTTGxnOFdQQVhzOWcvazd5bTlEb0hVWWNSMmwvWG56WHR5OEMxSjRw?=
 =?utf-8?B?dVQyT2NVVy9PQmxwSk04Y0hTbXVLc0dhM2JHZkRaWG5EdmxyZWJscXd0SVdI?=
 =?utf-8?B?Z01EM21DM2VXdWx1aDhXakFTdzk5SHRkU3pqWksxUmFuNldVOVlUcDk0cnZo?=
 =?utf-8?B?a01KVTZHYXBIRDVhRytJNWNOOXlVOEpZUEowUlQ5ZDBxY0d1Qkw1aXVtZ204?=
 =?utf-8?B?NUtaRG43TUZDd2RiSVB1NlJqWms3MGxsTGVoWE1vU0R0VUlXdFA1cEpsb2hs?=
 =?utf-8?B?ajRLamhyK1hLZ0lMRUhsand5c1g4aTJpZmYzTnhkQ3lnWnlLM2UzYWh3c3Jh?=
 =?utf-8?B?OHQzQzRrL3QvVm1YUERqRnpSYmx0K2ZSOE00QjYxcGxxSG9RUWJ6VUFzampn?=
 =?utf-8?B?K1J5VlArN2Y4L2RueG9IRHd6aWUwaC9XMVlraC8wemZZaGFPdWdBMy9sTzJX?=
 =?utf-8?B?aUE1Z1VQaVh6Q1B0RkRnV0R0amhiZHFjVVlSdWYxWlNJYzdXQzZkcm80Q3ow?=
 =?utf-8?B?ak1UUWVVQmNjSkJUblg4RUpKaDJZdXk1TzJZdEo1VlRvWFh0SlJFN3RsZFE5?=
 =?utf-8?B?R3pzVjBNa3hoMk5uUjU4a3JFRlJLTWVsN21udXhtUnBGSjVVOE1lM2M4YXZP?=
 =?utf-8?B?L1FacHVhZDFNdE1GV1d1SnN6S1NndzN5TGNaRXdtbEtvMVVxWGVrS1VKcjNQ?=
 =?utf-8?B?RTkxTUUyRzhiNGR5SzYzMXM2SGVoS0w4WDBiRHk0Q2lFdUI0ZUtza002aSti?=
 =?utf-8?B?QXk4dk50ZVVGL0Q1VUFWOVpoZFllWk9IY0c0eXRXT0cxcllxQnMxZnpjSE5v?=
 =?utf-8?B?UkhVSkdxWllFaVBlT1M2OVhlbGQ0VkFRWlJibDNnYnZqOFh6cVhtdzVkbU14?=
 =?utf-8?B?VDZ5KzFXaHhQVWZ5c2dlbVhyelFFdzNkSllVWVppZzFVL3NFWDBLc1JRUFJp?=
 =?utf-8?B?bVdPSlUvRXNib0FwaS9hSThKR21RM3Zmc0RyVE0xeldtdnc5elRuSWhCMjI5?=
 =?utf-8?B?ajYxcERKL0VWc1F0Q0Z0cm11R1MvSGhHS05LaFBTTFF4b09kM09jamdOL1hx?=
 =?utf-8?B?cnNCSE4vV09XVUs4T3ZjVVlKeHBvM2JJK2ZzM1VJYXBYMVB0bEdTR0ZzNm13?=
 =?utf-8?B?NjRxb3FjMVg2S09iZWhIZDVBc1N0U2Z0OERWN0xZL0xhVHgvS3lsWjV6N3Zt?=
 =?utf-8?B?bGt3Y2xkV1R0OVAyNHhGcXN5NFVPWU40T0l0QVNnUldORldqdDVQRWV5WGdm?=
 =?utf-8?B?bWpPalFQNDg4d3RDcjFBUUpWbjI3dEMzM2tzVEVJUWhHcStka0N1L0lTdk5m?=
 =?utf-8?B?dnZQYUpKTzRGbkpqVVJVWmZVemp5UHRjb2J0cTR1NWtOZ0FiSTdjK2YvR2R1?=
 =?utf-8?B?VjRLbjI5N2I3MVB1SVFWN0kxZzM3NXVBc0hSL1pSeXUxOG1IZXRFSFBkMVpJ?=
 =?utf-8?B?SlkwWk1DQlFOYnJzNmdLVnYzVEZVVEtZb28xbjlWWW9KdFpCTHJ3WldtdTFT?=
 =?utf-8?B?QjlXT1lZYnNPOTRRdldKRHhDd2llM1ZhSno1dHE1UXR6MU1CRlRqdytRL29X?=
 =?utf-8?B?ZEdHT0ZMM1RqcGw5VXRJbHBZZ3Jta1JxdE90RDErVmVFZFczaGJkTUZEMk9P?=
 =?utf-8?B?Qjg3S005UEhYZ0NMZDZSWDNpc0tTcmFDOGpkYkRCQS83a2Vjb2phMG0xMURv?=
 =?utf-8?B?RTN6VkR3cGg1ZENnMEZiWktPSE5uR1ZEWFFtZ0VVSVhaVklNLy82Q0pnMHVR?=
 =?utf-8?B?Wko5Ry9nU2lwT3VtOTFDK0hXU3VuSDd1ZXZKOFBmZndYVzhnUzRwdXQ3OVV2?=
 =?utf-8?B?Ulp1dXJGWVliSEdUaW9tbEt3RGhDUXQ5NGFycHNwa2JxTHM4YlVpRk50UDJP?=
 =?utf-8?Q?QrYeiScdIoE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cVNLMktxS25NYkhoWnBlenpvbjRsTW1sank1d2ljRmJCVWZ3dzN5UFNCVkN1?=
 =?utf-8?B?eUNTdHVic3ZUdVpjVnlvQmJXci9HYzRETm0zNDU0R1N6M053TVkwVTVaaXdB?=
 =?utf-8?B?SDVTRHBZQ2ZWY2ZOZlRjem1MV3JPRVhJNk41c1dmaFBEUVc5eXRHNnhkRUJN?=
 =?utf-8?B?aHczRXYwU2o1amhLazRWU1hOKytYS2QyWUZYdUV2OUcvSzJxSi9zdlVveUlM?=
 =?utf-8?B?MlcyM3g3K1ZnanpWQTlka0xUakgrb1FjVmZrOW1sNmcwSGF0b055NHk5TlFo?=
 =?utf-8?B?cnBYTmlLN0VURWFOUjVTNUN0NDZUMnZReDIvTEFGTlpTclhyZjBvNHFUWEdQ?=
 =?utf-8?B?V2dUajhFR2ZrOEE2TVBHVHBhczV0YzBiMHpCZ0k2UjRDOE1rR2tNUXJZREFj?=
 =?utf-8?B?OFlkRU93NVZudzhqdjBpbjg0SnljSUpPdUJwNkVDdnhSSERBUW5QaG9Lc2pj?=
 =?utf-8?B?U0FzNVZ5SmRFYWZTVjhzMk1XQm8xeWkzaHhHaW8rRFFhM1BlQzFkS1N0WFd2?=
 =?utf-8?B?Z2F3U1NtVlVUajdqTFA5L2NpMWthNVNjQUdpUWJsc0ZxQUJJN21MWmVTUVdz?=
 =?utf-8?B?a0d3U2x4STY2NEsvRVJDb1AxSGJaYVRpZjAvOFI4cTI1TDlMUFNIb01qNHA5?=
 =?utf-8?B?MUtrb0FoeTVqWStkcWZZaGN3SE91M0pNUTJSWENLY0t2OWhmVFNGd2dXQkYx?=
 =?utf-8?B?S25CUHJzOHd6V3dFMlNzT0RCTzNGZVQvQ3BTRmZUUGl1aGRwNDNMZHJtYncz?=
 =?utf-8?B?WC9lajRwRWRTeUowQjdXeVB1TGZrcHNScTE0T2swZjdWaS9tNXJJVW5pd0tk?=
 =?utf-8?B?WnQwRUpxUnVta1dEQldieUZiNnhpY2o3ckJsckNOemwzTDlvR2RMOE5WMUdk?=
 =?utf-8?B?RGQ3QUtRY2h1eTNtQXoybU1ZSnhobFA0YkVRbmNFTENPVUJjNnZQUEFLSStK?=
 =?utf-8?B?VGZCb3lDVWJabG10TlpxQmh6bFlhZVlRSFJUVFM5ZEdQak9kaktWaGFOb01X?=
 =?utf-8?B?SGtocjMvMk9BN1hOelkrZ0Q3UFJxVzZSK0cxbmxSSTRkMVhUbWNoWEpKQjNO?=
 =?utf-8?B?aDFCdlYvV1UxVDY3N2RJU044WUVva0JkTVM5dkdoUmY1NmNvZ0phT2w2eHFp?=
 =?utf-8?B?T09XWmQ1cTNsSEMwZmw0S3lVazYyWVFnY2dFZnZCRXBWMS8raXB1WXA5QXZ5?=
 =?utf-8?B?bVErMk9LLzNsRVJSemx6VllFZWV4Q1F6cC9SclpBMHNyVnl2ekhyYXZkNy8z?=
 =?utf-8?B?UnYzSUpOeUNHa0hVQlZUblk0UTVhNHZYeDY5dHJ3dGZud0d3bVZ2RmhXSGpP?=
 =?utf-8?B?VmpoTzFQazlGQnJ6WlBFZTk4Wk9wNk9aU1pldmNERFl6QWdxUStGMm16Z2tW?=
 =?utf-8?B?aVZJZ0I0SGM4RFA3YVNxT3RLU3kyT0lmQ1Z3SUFvOGV2RzZmWGtEbEpYY2d4?=
 =?utf-8?B?bTJYM3AzWUhvK0NKTEJIUDNBMFUxQ3RZQkpDYnF6d3J4UmhkdjUrQ0kyMXdo?=
 =?utf-8?B?RHNHQ2drRUhQMm9oTlJ5enlwaHFmZGVFOHNsL0dmNzNVNys1Q0ZGRFkydnBk?=
 =?utf-8?B?KzJVSCt5allNTUN0L0ZqTit0dTZVVmRQQXozQlRzN0hiZDNia25QdS93WTVa?=
 =?utf-8?B?Q2lIQW9RUk9PT2VtTHFtcnNsbmV2RGNZVGdWUUw1dEV6aHBjTEI1Z09tVXlS?=
 =?utf-8?B?OEtnd3B1amNFOXV3YnA4b2YwTUtIaktDL2Y1NmR6OVFldnM3ZVZDcXQ1OXMw?=
 =?utf-8?B?UGlHWlVFVGVaSm13NmFvbm9sM29pUkxXVkMzWjhqdkdYMGhMcTBFL1RwWG5z?=
 =?utf-8?B?MGpLV2p3Q0pYNlJVMnF0QkUyK3cyVnZEM0lNODN3MVNiUWtEWGFOa1VsMjVm?=
 =?utf-8?B?aXJScGRid0tnV21Fa2RDRFZqSlhuS1lrSWhodGRJemJiQ3YxOGkwL1cycW5m?=
 =?utf-8?B?a1FvTmVKK0lIdFNZdXdkcWI5cnc3SFpHLzI4MjZnQmRZSUVxUlVITmpVaWpy?=
 =?utf-8?B?dGY0VXdlT1ZMRTVRNC9SdWlQZnFVWUE3MzFteHB0Q1R2R1JZcTRsLzdNTnpw?=
 =?utf-8?B?RzZEOC9SQVFUY0tKdFFrR1NjeGI3QU1COG5kOE9sUXRNWkR5TGFSR1JCSHhH?=
 =?utf-8?Q?uIeGuI/PXI7yFf+I8hUN8seS6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ZcnYuDum95KIUP+IObgvpfJw+LR+twYwcJm90OB36vDfWyxPMm7RFlVPmBXVfqMCmZKALMlgNq4X6nSnlYvsdu+QicV6PtceIW/pvpb4zfs3QR1eplZCej4FfrhsWSOcXhMxEw8+7PKVFq2q5iHZl0qrr9GIvR+B3kja/Qno31ZmNConoTu3ZxSeR6V0tl4zAJ+p9i3pkkkS1JZxSEyT2hNY5JZ8qmvEqXepUaOe83eq0SynvlTGhN6hmNpNymMbmL4lN9WL+fdr6RZhfnYE5qL1LqJzFdxDkjHuXuoEe9jzurC+Cu6P9wAwjY2XHNyZqoi4k78btLU10a0FjBJQ5S5GA9ZmsbvnoWjApZHmlDey95vyhg3i2Q25Yjgmr8ss8+H84rT65/inOY5lV7A7wuFIHvZjI6yuiqk8oXLp0+u/hpQK2eALD+Q1V0xW1yVD3COQ5OlD/Idzg2+9rfKj9m7IDCPdMBh7CkY9MeiS+d4bzKIC8xpE3wyX3XGJOWwCEgn99mn/Qq+uBUWktIUyUAhdKTRdlr95/JfABouvDqPgaw/q7GSac+ihYmYjdoXLDmQuDWmqFYSZqL8MYTHh+dpdwmiHjLe0gtnaGt7e3ke7uoETXj0SgL4isBXgP48P
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac3c1a8-aa83-4ba2-f5ae-08dd3538b9b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 07:46:30.6334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gMU4V8ezdfDG910YWLP7NAxjTCusuHOMVUNO2K+nij1jmkWh7ABDFqY37jNLjQGaXQpRunrSWwSzhote48H/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13470
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114893

SSBzZWFyY2hlZCBhbmQgZm91bmQgdGhhdCB0aGlzIHNldHRpbmcgaXMgYWxzbyB1c2VkIGluIG90
aGVyIGJiIGZpbGVzLiANCk1heSBJIGFzayBpZiB0aGlzIHNldHRpbmcgaXMgbm90IHJlY29tbWVu
ZGVkIGFuZCBpZiB0aGVyZSBhcmUgYW55IGRyYXdiYWNrcz8NCg0KICAtLQ0KQmVzdCBSZWdhcmRz
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldh
bmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4g
KEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUzvvJor
ODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2
ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IENoZW5RaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEphbnVhcnkgMTUsIDIwMjUgMTI6MzIgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg
6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV0gW1BBVENIXSBt
YXJpYWRiOiBFbmFibGUgbmV0d29yayBkdXJpbmcgZG9fY29tcGlsZQ0KPiANCj4gQ2FuIHdlIGF2
b2lkIGRvaW5nIHRoaXMgYW5kIHVzZSBzb21lIG90aGVyIHNvbHV0aW9uPw0KPiBlLmcuLA0KPiBB
ZGQgYmFjayBhIGZtdCAxMS4wIHJlY2lwZSB3aXRoIGEgZGlmZmVyZW50IHJlY2lwZSBuYW1lIG9y
IGFkZCB0aGlzIGZtdCB0YXJiYWxsDQo+IGluIFNSQ19VUkkgYW5kIGNoYW5nZSBzb21lIGNtYWtl
IGNvbmZpZ3MgaWYgbmVlZGVkLg0KPiANCj4gUmVnYXJkcywNCj4gUWkNCj4gDQo+IE9uIDEvMTMv
MjUgMTQ6MzEsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBG
cm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gZml4IHRoZSBl
cnJvciB3aGVuIGRvX2NvbXBpbGU6DQo+ID4gQ01ha2UgRXJyb3IgYXQgbGliZm10LXN0YW1wL2Rv
d25sb2FkLWxpYmZtdC5jbWFrZToxNjMgKG1lc3NhZ2UpOg0KPiA+ICAgIEVhY2ggZG93bmxvYWQg
ZmFpbGVkIQ0KPiA+DQo+ID4gICAgICBlcnJvcjogZG93bmxvYWRpbmcNCj4gJ2h0dHBzOi8vZ2l0
aHViLmNvbS9mbXRsaWIvZm10L3JlbGVhc2VzL2Rvd25sb2FkLzExLjAuMS9mbXQtMTEuMC4xLnpp
cCcgZmFpbGVkDQo+ID4gICAgICAgICAgICBzdGF0dXNfY29kZTogNg0KPiA+ICAgICAgICAgICAg
c3RhdHVzX3N0cmluZzogIkNvdWxkIG5vdCByZXNvbHZlIGhvc3RuYW1lIg0KPiA+ICAgICAgICAg
ICAgbG9nOg0KPiA+ICAgICAgICAgICAgLS0tIExPRyBCRUdJTiAtLS0NCj4gPiAgICAgICAgICAg
IHRpbWVvdXQgb24gbmFtZSBsb29rdXAgaXMgbm90IHN1cHBvcnRlZA0KPiA+DQo+ID4gICAgZ2V0
YWRkcmluZm8oMykgZmFpbGVkIGZvciBnaXRodWIuY29tOjQ0Mw0KPiA+DQo+ID4gICAgQ291bGQg
bm90IHJlc29sdmUgaG9zdDogZ2l0aHViLmNvbQ0KPiA+DQo+ID4gICAgY2xvc2luZyBjb25uZWN0
aW9uICMwDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0
c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS1vZS9yZWNpcGVzLWRicy9teXNxbC9tYXJpYWRi
LmluYyB8IDMgKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRicy9teXNxbC9tYXJpYWRiLmluYw0K
PiA+IGIvbWV0YS1vZS9yZWNpcGVzLWRicy9teXNxbC9tYXJpYWRiLmluYw0KPiA+IGluZGV4IGQz
MTkyY2M1OWMuLjk4MmM4MmNkNTkgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRi
cy9teXNxbC9tYXJpYWRiLmluYw0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kYnMvbXlzcWwv
bWFyaWFkYi5pbmMNCj4gPiBAQCAtMzEsNiArMzEsOSBAQCBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0K
PiA+ICIwYTAwMTgwODY0Y2QwMTYxODdjOTg2ZmFhYjgwMTBkZTIzYTExN2I5YTc1ZjkxZDY0NTY0
MjFmODk0DQo+ID4NCj4gPiAgIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGh1Yi5j
b20vTWFyaWFEQi9zZXJ2ZXIvdGFncyINCj4gPg0KPiA+ICsjIG5ldHdvcmsgaXMgcmVxdWlyZWQg
YnkgZ28gdG8gZ2V0IGRlcGVuZGVudCBwYWNrYWdlcw0KPiA+ICtkb19jb21waWxlW25ldHdvcmtd
ID0gIjEiDQo+ID4gKw0KPiA+ICAgQklOQ09ORklHX0dMT0IgPSAibXlzcWxfY29uZmlnIg0KPiA+
DQo+ID4gICBpbmhlcml0IGNtYWtlIGdldHRleHQgYmluY29uZmlnIHVwZGF0ZS1yYy5kIHN5c3Rl
bWQgbXVsdGlsaWJfc2NyaXB0DQo+ID4gbXVsdGlsaWJfaGVhZGVyIHBrZ2NvbmZpZw0KPiA+DQo+
ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExNDgy
Nik6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL21lc3NhZ2UvMTE0ODI2DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvbXQvMTEwNTgzMDQ0LzczMDQ4NjUNCj4gPiBHcm91cCBPd25lcjogb3Bl
bmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNj
cmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVs
L3Vuc3ViDQo+ID4gW1FpLkNoZW5AZW5nLndpbmRyaXZlci5jb21dDQo+ID4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gPg0KDQo=


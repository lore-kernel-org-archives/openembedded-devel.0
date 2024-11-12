Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C9FD41D47
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 01:57:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.76979.1731376620354461346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Nov 2024 17:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1046b79d90=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC1fVBH024101
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 01:56:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42svy0jghk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 01:56:59 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AC1uwbJ014199
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 01:56:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42svy0jghj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 01:56:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdTO0ovMoxDRNCpRZgtFRUaueh/JY9aX8VO3gF8ID/YeXaGISX4FccNMcnLSXxPhq1WMUS7HPo4lvu3XPGxK7h1300mMlhUqvS58CxNz2XW7HCjyvqDl2gKWsHS7RzwyYsXYUGlwin4X+4oeWn+Pw//XOMO2VhGLZr42VSBkWvT86nDzOCkcqhdscbd5BNppopmgGAyoc0Ehf8wom9cLKLc6Q38YP5pgRISUh7jqPbnZP9DcWSmnYN9rTTcZh852hjFWE0gRWzqOSRp2WJoc2csIoo4HtrTZre7V6yv5X+LDgVO+nrIwZ8t4/wKCxAPLs252rtrbc4OmarXuCicDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz9VIZm7KNsL8/q6zs4QtCq6aAHX3cQIXBsMmHsGfHc=;
 b=uQjg4uCb1MkgUb8j5qPkyEiHdaRNEC4kLMvYCCIDXCCdCckQjugu8JWTvkmyx/g3cOQgfLLPBY25rQgAFGlXuEJwKBf+3Zm8uV7vwXSdQVRyNXC2WlXfdvniQEU+UiEp9ZaZFwlFrKvLTDM17PUqjzbws0yTMJ8nYHPkQUmsC3lG29uTN9IZJePRklDM6OSz/+j92L/NW6k3pPig3yTVkHUTRWRQxzAjGCwbwkmoJsm8MrPzCzPHBXZJV+qCmi4TxT5u8CUS0TKk4XUZzG1cYwmcnf7wpyvXa3LhuxfDDFLPCLmWperEQjfJfRYIrBSU4HSp6GrmUWMJ73rZtN7lQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 01:56:52 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 01:56:52 +0000
Content-Type: multipart/alternative;
 boundary="------------W7rbDYB4Aq1MFX0VXMJrh9kC"
Message-ID: <2cf51717-a77c-408e-a920-aeab52dc32a5@windriver.com>
Date: Tue, 12 Nov 2024 09:56:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
 <DB5PR02MB10213B19461D7A24EC043E886EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <618765bd-fbef-4207-b882-597be23f8162@windriver.com>
 <DB5PR02MB102130AB0E82C16162F5A1081EF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <DB5PR02MB102130AB0E82C16162F5A1081EF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: TYAPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::30) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 04aea123-c1d2-43f4-9bf2-08dd02bd46fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L212dlVUMGU3M0d6aXpXTmxIcEliQlgxejdNR09LbkNXdGxsbFgyOUcySGNU?=
 =?utf-8?B?SHJ5U21qYmFSUHM3MktWSG41Mzl0VDFyWXZYUFJjZklmMVozTjZnVEwvZHcz?=
 =?utf-8?B?UlloMlJZbDhDY1RBekRVOTlsaFlZY0dJaHpzckRQK3dlL2pwMnYzNUJ3QWxa?=
 =?utf-8?B?ckpaZlAvMTlYYjdUNzR4Z1VBakwwUVpKS2p0VTlvQTlSM0dHeU1WWHFBL2k0?=
 =?utf-8?B?eGJMWU56SFQvczIwbXJVMEYrQk84UUFLZmhDY1dxUE5PcTN0VitJNDg2cTRK?=
 =?utf-8?B?NTBOZ3M5UU9jdWw4eU5EdFFWdTJla0lUYy8vZFNtSCtEc0JZZWd1YUZlZU95?=
 =?utf-8?B?WXdWSVIwVUptdytIL2dZMVAzQktYWWIrRU1hSEFtZDZGSUU3SklKS0NJNDc1?=
 =?utf-8?B?VkgrbUVOa3NJN0Z0eW9TdWx5WXQ5ek1leFZ1UC9QNTl6Z09Zbm42d1l1OXI3?=
 =?utf-8?B?Uk9sMkdYM2w2M0lUTEZFd3NJejd5S1doOEpaWk9uOUQwSkdJdndrT0ZCNzMy?=
 =?utf-8?B?cU1FZFZqK3lDSGZlVW9aanFRUzZ0NElyUFpYZnE1UENER2k1WVk5anVnQ0hw?=
 =?utf-8?B?eTV4Tm5IeWZER1lZQklJS3J3SmU5R0YwVERqZmhHYW5OSXp0ZC9odThWclBR?=
 =?utf-8?B?Nnp6ZzNvSmoxOHJZSVBHY1lISVI3THBGSVRPTXJsbDJhSE51TEpTMnc0Q0Np?=
 =?utf-8?B?M0V1dklVUXQ4QkpXd2p4citiQlFhU0p2a29yUzExMGRhay9LeGZPZUVkUTEw?=
 =?utf-8?B?TVFHdmFZTEMyZDlrNkt0S3NoSGRrOVZBWThLcitQSlBjcXJSVXpkWWk0cEVK?=
 =?utf-8?B?T1c2Q2xRa2J6aFZkZGVVZmFjZkR0QkRSZ1R2NnYzZzNuVEo1RE5YWFBBQ2JV?=
 =?utf-8?B?SnNGVDYwbEpCL0RhM3hSbXgxeXE1KzQ0R2F6TDZTM1JXTFdDYlpVYkZpczF5?=
 =?utf-8?B?eVRMbEFGM2s3UVJJTUNXU0NHQ1RVTUlwQnRYcm1SSmEyZFRPSFBBNVF5UnRR?=
 =?utf-8?B?RHNHS3dqM25MaWg5K0JZQkJyQS9BU3JVV0phbXpJVzNQcFN0bW1GL0wxK3Ro?=
 =?utf-8?B?WjFjNUZzM2hXc09vZUQrTVpJTUIzQnhNTnFLMXN1N2xRRkFpSGhyWFU1eUNr?=
 =?utf-8?B?cnJObFdNaG5sbXZacHJVY3dYck1DVWZwSkF3QVNuSlpKdXFqeXhCRmx1cTlZ?=
 =?utf-8?B?aUZwaVJkWnRQVWYxNDhpSGxSb1VHbllDSXNhUEJNd0ZsR2hTMmNCdVN0THFH?=
 =?utf-8?B?MzVoclRNeTJlaXg2a0NVUHBpNDZMazYwenZ1UzIwdWR1V2U1VisvaWNhSWxJ?=
 =?utf-8?B?czIzdFBSUG9QQ2tOWnFCcHl5aVZvelUrTXBqMkhxUXhsWkdYOXF6aDZGZU9W?=
 =?utf-8?B?OWszWDRtR2dJSzlMKzl1VG9MRWxWSTZCTGE1WnVjN2RvYzlxdjBUbWRjbnFn?=
 =?utf-8?B?LzAzaXhQWTZUR3Y3WnNQVkNYS2ZXaFpUTVV1L2xrSEoxUEJlZEF3NEFOMnor?=
 =?utf-8?B?MlZ0M0k2ZnNHWkFoZzROMWQyVnNhYVpHK2dSWnNBdUxLcFZEa0VBMWg4cldx?=
 =?utf-8?B?WTlQSnFvRU5mRmJ4NEtoRUhDbG9NWjNvbTRCT2FvTkw0U005Y0pJTDcyWHJt?=
 =?utf-8?B?UlRwKzMrRzgzNHR3NTNmMDlCVGwvRkFIdUtXd0RRUkpqdjU1UEwwcEhzbzhU?=
 =?utf-8?B?WEg2NkROeWJqa04zNklCMkFXVTVUZ3QxS3VsWkJlY1ppYk9JUUlEcjRBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHlFeGdRTG1TNkpFNjRxMDBRZU50ajZwcktyWlVXS0FjYWJDY1ZQUzFpVnBp?=
 =?utf-8?B?bk5WSzZ6ZDhLZFJENnJEQnB2Q3ZSL3d1cWEwQTNCcUVJcHdnUW4xNzRTMnhT?=
 =?utf-8?B?RExDbi9XTHZ6TlJ2R2JCMm9YZmZzWXFGNitHRjdscE9JeVZLVU0yYi92SENv?=
 =?utf-8?B?S1ZnSGdCSVdBbnJCdWUzOFpnbTQrVkpqdVJ1eG5BNm5MN2lINm9tbVBmcWFL?=
 =?utf-8?B?YldyeVhRQWt4dXNVUEt0RDVyUnVVUWdjNW82R3VjcmFyNUFXT3Y3TjMvWEo0?=
 =?utf-8?B?Y1U5TkIrOFg1RkZFTjU3MEFSdXdSajN2bWN6aTArekl3T2tpMUp0Q0w4T3Bk?=
 =?utf-8?B?UmF5Qlh3d2p2L3A1SnlWNGVvd0RzaldwNjlScXE4T0U5Ny9CQXUrdTJDZVVh?=
 =?utf-8?B?WWNKeXp5UStRYW14SnBHS0oxUWV6aUY0MHNpaFVKNTJwUHVKMlFISTk5bzM0?=
 =?utf-8?B?SHBRR0Nua2dxSnVqZGZ5YlVnRmY4ZnVGNXo1T0wvQ0dzMzJKQ2RYODV4TTVQ?=
 =?utf-8?B?RGtiTzVOb3FxdTNPSm1HQ2ZZZUdLRGRUeFpiMjVrdjByakRMYU4wbUNLc0kv?=
 =?utf-8?B?VmVyYkRId283YVhiZEFyWVhNUXRtQzF3NHZOYy9JZ2EyMkMvdkg0dk1QVE5N?=
 =?utf-8?B?Rkt6WnNseGFBQ3VDUEVXaVlQQ1RDTVI4UktBeDZ0dEZsTjNYMTJJK3ZISXV0?=
 =?utf-8?B?Z2xjbFQydURWMk5vZkRoU1J3YmNJVzdjK3p4WXdyTGF6bnRjV3JpQ3VMd3B4?=
 =?utf-8?B?Z0lnb2dITUU5a2lIREZKRkhwOStVZHh1UEcrY3JYcUJ3TDdhOWVBNElzMkw3?=
 =?utf-8?B?cGJNbExlZ2w3QUFycWZ4VTQvdzU5Uk9RQUl6Q0lHRzE1TWZ6bHBUN2hpZ0RV?=
 =?utf-8?B?aGRjUlZuOWVUa3YwMGxaSjBJRkZQNkI5UmVyL0wzZUVYcUoyajNhazh6QzYv?=
 =?utf-8?B?UDNiRXRONVRDU3dsa2tCTmxKRUFJYlRjdVg3WUtKQWlyQXAzdllKaVdRaVlX?=
 =?utf-8?B?dG1Fd1NpWDZSZXNqVmlid0hPeG1uanRyTW9DN0hZM2NrdDBScEdOZGFlZnFR?=
 =?utf-8?B?VlUwMGhPbW9FcDR6Mi81MXdjZEtUL2o3ek40U1FFNnZUTWFOdDg1VEUxYS93?=
 =?utf-8?B?blNyMGlFYXVYWE1aRlkvSkhsVEZoUktqS28wL0tjbkR1cE45YytvcWkyOG5q?=
 =?utf-8?B?Vzh6eVF1OTVlWEVxS3RhZTUwVzFkS0VlZUF0S0N5NlhQZWJqWjBmcE5NOUJX?=
 =?utf-8?B?OWN1Vyt6bDc4TGxtdEx5RldEdlA0Y090akJzdDNlQ1lyZERPV0U2M2JZTFNo?=
 =?utf-8?B?SExNVGo3aytlZXQvTUE1VitrdnV0ZE9MYXdtdlQ3anNjaU9aQU0wRzFSSnBF?=
 =?utf-8?B?S3Iyd2xVYVRSWE9iVDFYRGlMN3JMSnZTSzJMVDJSaUJLM3NZd0tJcDdQZWNH?=
 =?utf-8?B?dHEvUW1RZnRyaCtNano3ZS9pNzMwNXAxL01sUC96ZXJaN0tqbW4rSVE3MEJK?=
 =?utf-8?B?empLNXVPSFZFQUtQQ1JPUm9sSm5meU9HUFZwam4vT1NkWUZBa3Y1QUxUV1Bh?=
 =?utf-8?B?TVlWRXo2YUZnQUVUM2VJUXBGei9DVlJESDZrY0xNRjJtUnkrTUxTU0x5bjdM?=
 =?utf-8?B?aFFqV3QzaDlCUHhsQ2VaUEhnUEMrZnpKK0RMVDN6WFVzNTZ4WXhPbG9WdThW?=
 =?utf-8?B?MUpZSnNCbC9sWStpRE9XK1pJOVRZNkFsTjg5bzVoM0k3bThtRVBJMUQ5TkQx?=
 =?utf-8?B?UWk4WldmRkt4WUZOKzZJL0QzR0lTZE9DbHFZSWpPRmt3eTREcmNudmQweHpF?=
 =?utf-8?B?MkNjOEtBaUVCbFRnSUVpVks4TXVXa1pkSjh6MW9ENTNWYThBSXNlVzlkd3Bl?=
 =?utf-8?B?TXRaeE1CZFBYMjVRYld6bHpIcnI4N2hlenJ0dVBnb2dHTUgzZ2o2MVZiWk9O?=
 =?utf-8?B?L0JZMTZFeG0zTjF5L1lUSklOakowVkpLODN5K0c5LzJtdTYzYTVRTHgxVnJ1?=
 =?utf-8?B?TlRBZUh0VUZlNmQ0OXo2UWppVTVXZm02UTdPTzE3RTlmUmlQWkduNVRBZG9h?=
 =?utf-8?B?SXUxOTNQVUdMMWlVTEFvc28zbU9MNkZnVHFycG1hejdtMzMwWHNSMytmVjRv?=
 =?utf-8?B?VTIxQXMrclNsT1JTQ05qZlZwN1hKT2NnU1FZdnBqZDk1VExGQnVEcmZvdGgz?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04aea123-c1d2-43f4-9bf2-08dd02bd46fa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 01:56:52.2457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeEZAO2cfIoOXVwOgbNKfdbgK1vmsRv7ljL1BB1Jsx+xH90rOQqHOolYoWO9FkK9DwEt6hJIBjtwSRPXUBR9n6QImeQmNXmC9B0ocVsGudk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
X-Authority-Analysis: v=2.4 cv=Zv+/KM7G c=1 sm=1 tr=0 ts=6732b5eb cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=v8g0944mAAAA:8 a=mDV3o1hIAAAA:8 a=VWWGIrUjF7NIlUifeg8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=8c359dwyUVDxdXFFmIQA:9 a=mogkfcbfPAQc-36p:21 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=0kEK_xeG5Ye6eAo9Pzkn:22
X-Proofpoint-GUID: Fv69nQlX3e0aAG5fic1ahNkfOcDhwBJC
X-Proofpoint-ORIG-GUID: MpBnz3y0cDFN-I_-PbN4f54Xd9Dbxgsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411120015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 01:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113790

--------------W7rbDYB4Aq1MFX0VXMJrh9kC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AC1fVBH024101


On 11/11/24 05:29, Peter Kjellerstedt wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> [ I cannot answer inline due to the use of HTML mail. ]
>
> * There is no reason to add DEPENDS +=3D "perl"as it is not needed=20
> during the build.
>
removed in v5
>
> * My list of runtime dependencies is based on the modules that the=20
> parallelscripts actually use. It is possible that your list will=20
> happen to work due to Perl modules depending on other Perl modules.=20
> Regardless of which, please sort the runtime dependencies.
>
gnu parallel 20241022 provide paralle/parcat/parsort... to use. so my=20
rdepends is only work for parallel, updated in v5 for all
>
> * We only use parallel-nativein our environment.
>
Ok, updated

//peng

> //Peter
>
> *From:*openembedded-devel@lists.openembedded.org=20
> <openembedded-devel@lists.openembedded.org> *On Behalf Of *Zhang, Peng=20
> (Paul) (CN) via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WW=
IXbJmaZMtd4pHcXe-_rffjlZZAlxA$>
> *Sent:* den 9 november 2024 14:56
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>;=20
> openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU=20
> Parallel
>
> On 11/8/2024 7:04 PM, Peter Kjellerstedt wrote:
>
>     CAUTION: This email comes from a non Wind River email account!
>
>     Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>
>         -----Original Message-----
>
>         From:openembedded-devel@lists.openembedded.org  <openembedded-d=
evel@lists.openembedded.org>  <mailto:openembedded-devel@lists.openembedd=
ed.org>  On Behalf Of Zhang, Peng (Paul) (CN) vialists.openembedded.org  =
<https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIX=
bJmaZMtd4pHcXe-_rffjlZZAlxA$>
>
>         Sent: den 6 november 2024 12:03
>
>         To:openembedded-devel@lists.openembedded.org
>
>         Subject: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU =
Parallel
>
>         From: Zhang Peng<peng.zhang1.cn@windriver.com>  <mailto:peng.zh=
ang1.cn@windriver.com>
>
>         This recipe adds the parallel package, a shell tool for executi=
ng jobs
>
>         in parallel using one or more computers.
>
>         Signed-off-by: Zhang Peng<peng.zhang1.cn@windriver.com>  <mailt=
o:peng.zhang1.cn@windriver.com>
>
>         ---
>
>           .../parallel/parallel_20241022.bb  <https://urldefense.com/v3=
/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqB=
hvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 29 +++++++++++++++++++
>
>           1 file changed, 29 insertions(+)
>
>           create mode 100644 meta-oe/recipes-extended/parallel/parallel=
_20241022.bb  <https://urldefense.com/v3/__http://parallel_20241022.bb__;=
!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B=
28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$>
>
>         diff --git a/meta-oe/recipes-extended/parallel/parallel_2024102=
2.bb  <https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYd=
w8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4=
WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$>  b/meta-oe/recipes-extended/parallel/pa=
rallel_20241022.bb  <https://urldefense.com/v3/__http://parallel_20241022=
.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWN=
ENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$>
>
>         new file mode 100644
>
>         index 000000000..e3cf0a6a7
>
>         --- /dev/null
>
>         +++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb  <=
https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!a=
rus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJm=
aZMtd4pHcXe-_rffhDX-r87g$>
>
>         @@ -0,0 +1,29 @@
>
>         +SUMMARY =3D "GNU Parallel - A shell tool for executing jobs in=
 parallel using one or more computers"
>
>         +DESCRIPTION =3D "GNU Parallel is a command-line tool for execu=
ting jobs in parallel on one or more computers. \
>
>         +It allows users to run multiple commands simultaneously, makin=
g it easier to process large batches of tasks."
>
>         +
>
>         +HOMEPAGE =3D"https://www.gnu.org/software/parallel/"  <https:/=
/urldefense.com/v3/__https://www.gnu.org/software/parallel/__;!!AjveYdw8E=
vQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWI=
XbJmaZMtd4pHcXe-_rffhQ_pd9hA$>
>
>         +LICENSE =3D "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-lat=
er"
>
>         +
>
>         +LIC_FILES_CHKSUM =3D"file://LICENSES/GPL-3.0-or-later.txt;md5=3D=
8da5784ab1c72e63ac74971f88658166
>         \  <file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63=
ac74971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb2=
48a4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc=
8a2e50b1d450fea66b7/+>
>
>         +=C2=A0=C2=A0=C2=A0
>         file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f03=
e89ea4b8\<file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac74=
971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4=
f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e=
50b1d450fea66b7/+>
>
>         +=C2=A0=C2=A0=C2=A0
>         file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e50=
b1d450fea66b7\<file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e6=
3ac74971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb=
248a4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62d=
c8a2e50b1d450fea66b7/+>
>
>         +"
>         <file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac7=
4971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a=
4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2=
e50b1d450fea66b7/+>
>
>         +
>
>         +SRC_URI =3D"https://ftp.gnu.org/gnu/parallel/parallel-${PV}.ta=
r.bz2"  <https://urldefense.com/v3/__https://ftp.gnu.org/gnu/parallel/par=
allel-$*7bPV*7d.tar.bz2__;JSU!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXb=
UvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffjl7oCJbQ$>
>
>         +SRC_URI[sha256sum] =3D "6de22bf1c67f7f316670d21ed1a2a32f1214df=
bd3e420939ba937925c0a57a12"
>
>         +
>
>         +inherit autotools bash-completion
>
>         +
>
>         +DEPENDS +=3D "perl"
>
>         +
>
>         +RDEPENDS:${PN} +=3D "perl \
>
>         +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl-module-ipc-ope=
n3 \
>
>         +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl-module-getopt-=
long \
>
>         +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl-module-file-te=
mp \
>
>         +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl-module-filehan=
dle \
>
>         +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl-module-file-gl=
ob \
>
>         +"
>
>         +do_install:append() {
>
>         +=C2=A0=C2=A0=C2=A0 rm -rf ${D}${datadir}/zsh
>
>         +}
>
>         --
>
>         2.34.1
>
>     Based on the above, and a corresponding recipe we have, I would
>
>     suggest the following instead:
>
>     SUMMARY =3D "GNU Parallel - A shell tool for executing jobs in para=
llel using one or more computers"
>
>     DESCRIPTION =3D "GNU Parallel is a command-line tool for executing =
jobs in parallel on one or more computers. \
>
>     It allows users to run multiple commands simultaneously, making it =
easier to process large batches of tasks."
>
>     HOMEPAGE =3D"https://www.gnu.org/software/parallel/"  <https://urld=
efense.com/v3/__https://www.gnu.org/software/parallel/__;!!AjveYdw8EvQ!ar=
us123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJma=
ZMtd4pHcXe-_rffhQ_pd9hA$>
>
>     LICENSE =3D "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
>
>     LIC_FILES_CHKSUM =3D " \
>
>          file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f0=
3e89ea4b8\  <file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4=
f03e89ea4b8/>
>
>          file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e5=
0b1d450fea66b7\  <file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62=
dc8a2e50b1d450fea66b7/>
>
>          file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac7=
4971f88658166  <file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e=
63ac74971f88658166>  \
>
>     "
>
>     SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
>
> will change in v4 version
>
>     SRC_URI[sha256sum] =3D "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e4=
20939ba937925c0a57a12"
>
>     inherit autotools bash-completion
>
>     PACKAGES +=3D "${PN}-zsh-completion"
>
>     FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
>
> will add in v4 version
>
>     RDEPENDS:${PN} =3D " \
>
>      =C2=A0=C2=A0=C2=A0 perl \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-file-basename \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-file-path \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-file-temp \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-getopt-long \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-io-select \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-ipc-open3 \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-posix \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-symbol \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-thread-queue \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-threads \
>
>      =C2=A0=C2=A0=C2=A0 perl-module-threads-shared \
>
>     "
>
> I think the DEPENDS +=3D "perl" is necessary to add into recipes,=20
> because the parallel build depends on perl.
>
> for RDEPENDS, i insist the my sets, after testing, RDEPENDS your=20
> provided is not make parallel run normal in target.
>
>     BBCLASSEXTEND =3D "native"
>
> I think "parallel" is more often using on targets. but i will add this=20
> config in v4 version.
>
> Thanks very much
>
> //Peng
>
>     //Peter
>
--------------W7rbDYB4Aq1MFX0VXMJrh9kC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/11/24 05:29, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DB5PR02MB102130AB0E82C16162F5A1081EF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <strong>
      </strong>
      <div style="border:solid #9c6500 1pt;padding:2pt;background:#fcfc03"><strong><class="msonormal" style="line-height:11pt"><span style="font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class="msonormal"></strong><br>
        <class="msonormal" style="line-height:10pt3"><span style="font-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class="msonormal"></div>
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US">[ I cannot answer inline due to the use of
              HTML mail. ]<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US">* There is no reason to add
            </span><span style="font-size:11.0pt;font-family:Consolas;color:#943634;mso-fareast-language:EN-US" lang="EN-US">DEPENDS += &quot;perl&quot;</span><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"> as it is not needed during the build.</span></p>
        </div>
      </div>
    </blockquote>
    removed in v5 <br>
    <blockquote type="cite" cite="mid:DB5PR02MB102130AB0E82C16162F5A1081EF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US">* My list of runtime dependencies is based on
              the modules that the
            </span><span style="font-size:11.0pt;font-family:Consolas;color:#943634;mso-fareast-language:EN-US" lang="EN-US">parallel</span><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"> scripts actually
            </span><span style="font-size:11.0pt;font-family:Consolas;color:#943634;mso-fareast-language:EN-US" lang="EN-US">use</span><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US">. It is possible that your list will happen
              to work due to Perl modules depending on other Perl
              modules. Regardless of which, please sort the runtime
              dependencies.</span></p>
        </div>
      </div>
    </blockquote>
    gnu parallel 20241022 provide paralle/parcat/parsort... to use. so
    my rdepends is only work for parallel, updated in v5 for all<br>
    <blockquote type="cite" cite="mid:DB5PR02MB102130AB0E82C16162F5A1081EF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US">* We only use
            </span><span style="font-size:11.0pt;font-family:Consolas;color:#943634;mso-fareast-language:EN-US" lang="EN-US">parallel-native</span><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"> in our environment.</span></p>
        </div>
      </div>
    </blockquote>
    <p>Ok, updated</p>
    <p>//peng<br>
    </p>
    <blockquote type="cite" cite="mid:DB5PR02MB102130AB0E82C16162F5A1081EF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"><o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US">//Peter<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
          <div style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
            <div>
              <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
                <p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif" lang="EN-US">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif" lang="EN-US">
                    <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
                    <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-devel@lists.openembedded.org">&lt;openembedded-devel@lists.openembedded.org&gt;</a>
                    <b>On Behalf Of </b>Zhang, Peng (Paul) (CN) via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffjlZZAlxA$" moz-do-not-send="true">
                      lists.openembedded.org</a><br>
                    <b>Sent:</b> den 9 november 2024 14:56<br>
                    <b>To:</b> Peter Kjellerstedt
                    <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com">&lt;peter.kjellerstedt@axis.com&gt;</a>;
                    <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a><br>
                    <b>Subject:</b> Re: [oe] [meta-oe][PATCH v3]
                    parallel: Add recipe for GNU Parallel<o:p></o:p></span></p>
              </div>
            </div>
            <p><o:p>&nbsp;</o:p></p>
            <div>
              <p class="MsoNormal"><span lang="EN-US">On 11/8/2024 7:04
                  PM, Peter Kjellerstedt wrote:<o:p></o:p></span></p>
            </div>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>CAUTION: This email comes from a non Wind River email account!<o:p></o:p></pre>
              <pre>Do not click links or open attachments unless you recognize the sender and know the content is safe.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>-----Original Message-----<o:p></o:p></pre>
                <pre>From: <a href="mailto:openembedded-devel@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">openembedded-devel@lists.openembedded.org</a> <a href="mailto:openembedded-devel@lists.openembedded.org" moz-do-not-send="true">&lt;openembedded-devel@lists.openembedded.org&gt;</a> On Behalf Of Zhang, Peng (Paul) (CN) via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffjlZZAlxA$" moz-do-not-send="true">lists.openembedded.org</a><o:p></o:p></pre>
                <pre>Sent: den 6 november 2024 12:03<o:p></o:p></pre>
                <pre>To: <a href="mailto:openembedded-devel@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">openembedded-devel@lists.openembedded.org</a><o:p></o:p></pre>
                <pre>Subject: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>From: Zhang Peng <a href="mailto:peng.zhang1.cn@windriver.com" moz-do-not-send="true">&lt;peng.zhang1.cn@windriver.com&gt;</a><o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>This recipe adds the parallel package, a shell tool for executing jobs<o:p></o:p></pre>
                <pre>in parallel using one or more computers.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>Signed-off-by: Zhang Peng <a href="mailto:peng.zhang1.cn@windriver.com" moz-do-not-send="true">&lt;peng.zhang1.cn@windriver.com&gt;</a><o:p></o:p></pre>
                <pre>---<o:p></o:p></pre>
                <pre> .../parallel/<a href="https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$" moz-do-not-send="true">parallel_20241022.bb</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 29 +++++++++++++++++++<o:p></o:p></pre>
                <pre> 1 file changed, 29 insertions(+)<o:p></o:p></pre>
                <pre> create mode 100644 meta-oe/recipes-extended/parallel/<a href="https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$" moz-do-not-send="true">parallel_20241022.bb</a><o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>diff --git a/meta-oe/recipes-extended/parallel/<a href="https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$" moz-do-not-send="true">parallel_20241022.bb</a> b/meta-oe/recipes-extended/parallel/<a href="https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$" moz-do-not-send="true">parallel_20241022.bb</a><o:p></o:p></pre>
                <pre>new file mode 100644<o:p></o:p></pre>
                <pre>index 000000000..e3cf0a6a7<o:p></o:p></pre>
                <pre>--- /dev/null<o:p></o:p></pre>
                <pre>+++ b/meta-oe/recipes-extended/parallel/<a href="https://urldefense.com/v3/__http://parallel_20241022.bb__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhDX-r87g$" moz-do-not-send="true">parallel_20241022.bb</a><o:p></o:p></pre>
                <pre>@@ -0,0 +1,29 @@<o:p></o:p></pre>
                <pre>+SUMMARY = &quot;GNU Parallel - A shell tool for executing jobs in parallel using one or more computers&quot;<o:p></o:p></pre>
                <pre>+DESCRIPTION = &quot;GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \<o:p></o:p></pre>
                <pre>+It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks.&quot;<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+HOMEPAGE = <a href="https://urldefense.com/v3/__https://www.gnu.org/software/parallel/__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhQ_pd9hA$" moz-do-not-send="true">&quot;https://www.gnu.org/software/parallel/&quot;</a><o:p></o:p></pre>
                <pre>+LICENSE = &quot;CC-BY-SA-4.0 &amp; GFDL-1.3-or-later &amp; GPL-3.0-or-later&quot;<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+LIC_FILES_CHKSUM = <a href="file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7/+" moz-do-not-send="true">&quot;file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 \<o:p></o:p></a></pre>
                <pre><span class="MsoHyperlink"><a href="file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7/+" moz-do-not-send="true">+&nbsp;&nbsp;&nbsp; file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8\<o:p></o:p></a></span></pre>
                <pre><span class="MsoHyperlink"><a href="file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7/+" moz-do-not-send="true">+&nbsp;&nbsp;&nbsp; file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7\<o:p></o:p></a></span></pre>
                <pre><span class="MsoHyperlink"><a href="file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166/+file:/LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8/+file:/LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7/+" moz-do-not-send="true">+&quot;</a></span><o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+SRC_URI = <a href="https://urldefense.com/v3/__https://ftp.gnu.org/gnu/parallel/parallel-$*7bPV*7d.tar.bz2__;JSU!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffjl7oCJbQ$" moz-do-not-send="true">&quot;https://ftp.gnu.org/gnu/parallel/parallel-${PV}.tar.bz2&quot;</a><o:p></o:p></pre>
                <pre>+SRC_URI[sha256sum] = &quot;6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12&quot;<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+inherit autotools bash-completion<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+DEPENDS += &quot;perl&quot;<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+RDEPENDS:${PN} += &quot;perl \<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-ipc-open3 \<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-getopt-long \<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-file-temp \<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-filehandle \<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-file-glob \<o:p></o:p></pre>
                <pre>+&quot;<o:p></o:p></pre>
                <pre>+do_install:append() {<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp; rm -rf ${D}${datadir}/zsh<o:p></o:p></pre>
                <pre>+}<o:p></o:p></pre>
                <pre>--<o:p></o:p></pre>
                <pre>2.34.1<o:p></o:p></pre>
              </blockquote>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>Based on the above, and a corresponding recipe we have, I would<o:p></o:p></pre>
              <pre>suggest the following instead:<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>SUMMARY = &quot;GNU Parallel - A shell tool for executing jobs in parallel using one or more computers&quot;<o:p></o:p></pre>
              <pre>DESCRIPTION = &quot;GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \<o:p></o:p></pre>
              <pre>It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks.&quot;<o:p></o:p></pre>
              <pre>HOMEPAGE = <a href="https://urldefense.com/v3/__https://www.gnu.org/software/parallel/__;!!AjveYdw8EvQ!arus123lfJoMqW9PcIe-48HHqBhvXbUvrKbpNsAXHkEOYPGTLMGWNENgZ6B28bL4dq4WWIXbJmaZMtd4pHcXe-_rffhQ_pd9hA$" moz-do-not-send="true">&quot;https://www.gnu.org/software/parallel/&quot;</a><o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>LICENSE = &quot;CC-BY-SA-4.0 &amp; GFDL-1.3-or-later &amp; GPL-3.0-or-later&quot;<o:p></o:p></pre>
              <pre>LIC_FILES_CHKSUM = &quot; \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; <a href="file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8/" moz-do-not-send="true">file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8\</a><o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; <a href="file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7/" moz-do-not-send="true">file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7\</a><o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; <a href="file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166" moz-do-not-send="true">file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166</a> \<o:p></o:p></pre>
              <pre>&quot;<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>SRC_URI = &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.bz2&quot;<o:p></o:p></pre>
            </blockquote>
            <p class="MsoNormal">will change in v4 version<br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>SRC_URI[sha256sum] = &quot;6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12&quot;<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>inherit autotools bash-completion<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>PACKAGES += &quot;${PN}-zsh-completion&quot;<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>FILES:${PN}-zsh-completion = &quot;${datadir}/zsh&quot;<o:p></o:p></pre>
            </blockquote>
            <p class="MsoNormal">will add in v4 version<br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>RDEPENDS:${PN} = &quot; \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-file-basename \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-file-path \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-file-temp \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-getopt-long \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-io-select \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-ipc-open3 \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-posix \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-symbol \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-thread-queue \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-threads \<o:p></o:p></pre>
              <pre>&nbsp;&nbsp;&nbsp; perl-module-threads-shared \<o:p></o:p></pre>
              <pre>&quot;<o:p></o:p></pre>
            </blockquote>
            <div>
              <p class="MsoNormal">I think the DEPENDS += &quot;perl&quot; is
                necessary to add into recipes, because the parallel
                build depends on perl.<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal">for RDEPENDS, i insist the my sets,
                after testing, RDEPENDS your provided is not make
                parallel run normal in target.
                <o:p></o:p></p>
            </div>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>BBCLASSEXTEND = &quot;native&quot;<o:p></o:p></pre>
            </blockquote>
            <p>I think &quot;parallel&quot; is more often using on targets. but i
              will add this config in v4 version.
              <o:p></o:p></p>
            <p>Thanks very much <o:p></o:p></p>
            <p>//Peng<o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>//Peter<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------W7rbDYB4Aq1MFX0VXMJrh9kC--


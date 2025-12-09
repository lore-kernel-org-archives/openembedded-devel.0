Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B34AD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 08:57:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3347.1765270624035748452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 00:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q9qqnNZ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438979ad4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B96mxqC2003186
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 08:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=giL1JWDXbFQTCW4Ttp3VshUF6P27IGTjqDFtIPQi1Mk=; b=
	Q9qqnNZ0cAPxTCVpDQQEsPChst5DlEPiNqNkjIHgcMa2scKLSvKODx6GkJyW5pcL
	7G1oKN07vpvj/yrjqhQwpIkO+wcbyclUANWAveRp7+cgxBiTy3Def9RlNf73Q4yc
	fzfbmRT7ln8IPnQB9ohlAZyl1yvQRbvHywXZOck5vCVXH+UUbH1+E7FQiNlrjX0C
	q1Pa7WA3e9tTa+xIN8Gr1mwuUVZepPYcBik9uZ9KDg+C9UzVDAkbkfpGVP4EqF5X
	JctDLQtYsSUO1DJ7cOxIOY9Xe5tlKP9mssOWgdrpACf7e1FcPpxA3kZyo00pvFSq
	ZPnQx5jmEE2Mr3a55Gm3oA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742ruu-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:57:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEc05+BdQ1u0Xx8kfymXkylk7t5U63F+FvuNoD7vSjuvUExx2xdO0TLAY/5JT/HQs8ZYne5of8BuXf9+EF+GvEUCRWtNz6A2uEyuv9t1aA7WmWEydO3vUzx3Y3SQfHRWT9M0j22wQNIWw7PX6lP4ygbF2+dFqKQcho1t4d+TcWVni95lrycZpZ9g/qs85gy4Vudis6NMKef6fFPTKd4TetLUlQ/w/7LZjRMlL0SL6fU+NoMrE+2xzP0hPSim60wXbWpAQCA6tac02l3G33p3dZZAmFeGoqooR+iapXzqP6FSD4zf9j7sd0Ocxk3mdu/7drmqElVFFXWTP800l0t6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giL1JWDXbFQTCW4Ttp3VshUF6P27IGTjqDFtIPQi1Mk=;
 b=RM96ZuQ5ScG/w4bB7Pmu6KKwRq6V0FWhP7pLbplIOl/82/ZsC5HeAgogQNWSHXzXk3s0GPORsctX1to5C1/QRz5bATx9Y0LaxZnvRvMXsf3aZdVzkXLWleL4humyCITVH323NYa4rAQb8MXIPZ/THHjy4qBBhoQ9SxYpv8+hmzKf74ucFTRKJ+JNdPpjo5cMET1prbgOfn0TLeHGlEzbkjdwxbnVrDILhB4OOiXR2Aj6DV969xU9SDSWAW26azFDF6ir3cV5W/6GLsKRtSbdFfjyLRgh8pEOoQIGgC7oAXPcDbN+yRnHgjfFjRCWez/TM6VN8n0USdARIbC6kRn8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 DM3PPFCA3BFC2BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 08:57:00 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::2f29:a2b4:343b:80eb]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::2f29:a2b4:343b:80eb%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 08:57:00 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH 2/2] ripgrep: Add ripgrep recipe
Date: Tue,  9 Dec 2025 00:56:45 -0800
Message-ID: <20251209085645.1437344-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
References: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|DM3PPFCA3BFC2BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9865a8-077e-4a94-9caf-08de3700ea0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bDM5Skl4VUFnakNpaURrK2ZhV2VhWWM3S0RPYk9TaG5pSndMMFlEYnk3bnlZ?=
 =?utf-8?B?ZEk3Rm9nMVRtbGtmelVMZmRVanNGUjJUeWl2VnRpL3pYWTQ2c2JXRklJOTlV?=
 =?utf-8?B?S0lLNmZWbUtnV1hKSFJGdW9JOC9PSGFXdDZ0MlhEV1RCRzVaZkFmbGNQTmts?=
 =?utf-8?B?elNFZTlKd1VYdU5DdmxTT1FtNHRJVzNXaHh1elY3VlVlc3Y3clh3TmNsYXVh?=
 =?utf-8?B?SVlZYjl5ZmpyaXdud3JJcW02OUVaMTE5S0lCY0wveVUzUGpqSXBOS0l6WXpC?=
 =?utf-8?B?S1FRZlNtZHVjZGZOQ29VSmFocWhNd0V1bEFiczdHdFR3NDZ2YVFZeFBzTzMw?=
 =?utf-8?B?N0pBU1hPbHdkU0RqK3RDUDZhemhFUXp1eHE3YXlHTktsU0ROTDYwYjZQOWNI?=
 =?utf-8?B?M3JPNno0eEZvK200ZGJrMWhqcTRYREV6Z29iR2NEMTFVc29DNDN4S0NLUStw?=
 =?utf-8?B?S2hYQituZm9jQWR0dGtWQ3lhVytKY2dOZW9LWUZ4U2xzbVU1M1E1aW4yU3Fz?=
 =?utf-8?B?ZGZrVnVQSG5Ta3NlMlByUTdOU2g3M2t5bElQWHd2cEFWeFBXTUhvVENrOG5t?=
 =?utf-8?B?ckx3ek1GVXd1VUtDOUJ1VWs1VHlWdXVhYTM0YW1VR21KQXIrbXc4MWZDZzBE?=
 =?utf-8?B?aHdzaFBxTm1pUnNLeThlNUhsK0NLNUNrWkFuZUNnOW80RFhpbDFHU2wyWUZi?=
 =?utf-8?B?eGttZTVmSzJmZktaUzExWDA1bVRKaUNlUktTVERMZ3JEWTRDdGRMWk9GUVhS?=
 =?utf-8?B?MVp5U2FMYXdlOWNDdWk1Zmk3UnB5dGZlbmZMMmJjQmJsUjJUNjFtY1VIZ3Ji?=
 =?utf-8?B?U3doVjRsemZlVFpwQ0NDbll1bHFLWDNxcTg5S1BNUCtMNEZVZDlweWo3dUFJ?=
 =?utf-8?B?MURaMzQ4RzRVZjg4K3VmT0EzUGxTQmp2ZlFvWHk2Zk9wbWg2ekxZZXk2d3k1?=
 =?utf-8?B?VEZNbGwvNmNFTjJpakVSREo0eGU2QkF1OGwrSjZJY3kzWnAyQm9mbW1sOHY1?=
 =?utf-8?B?UXl5Y0Z2S2hCbjN0MlBQdnpIaDZGUXNoamhBNDlOZWxKTFhmZXhOdWFtYlV5?=
 =?utf-8?B?dGZYc2V2dnJsNmNTM29OSG05Tk1tb3owNFdDcm5CTjJtM1ZSOXJvM1hYZFRr?=
 =?utf-8?B?T3o1SFJEOWZjT0Fta0l3N2hsN01aa1NQb2NlWklJbHdmczRiTzVIWlZkSnFm?=
 =?utf-8?B?eWlNa0hNaXJkdFRLSTZNN2tpUm1rRllyNUhwQ2U1K1NReVp5dzhmaGl5OVEw?=
 =?utf-8?B?d0phSzJWbXRMNXd1YW5zOGg0YnRJdThkY1laSzhYekt3YTB1dHRCT0FMejhw?=
 =?utf-8?B?cXBPSlhFNWN5WWEvTGRZeHFJOXYyaFh0N21uYVZzUDQ5bG1lSnhTZFdNbHBk?=
 =?utf-8?B?OFVBMk1QWFc3ZGJ0K0tyZ2V4WmJkSEdGZFJoNy9Mc0wvNmdHc2RnN3M3WEU3?=
 =?utf-8?B?YVJseFpOTFVoTUxJMmUrbUQyTEsydnBIdzVVU2JJVVZZNDlIb1BFdmlQTVly?=
 =?utf-8?B?UEp5aDV6VU5WdEYzS01XcU5pNm5TMTI5d3FON0YzbDNLNytsK2ovRkw4Y1h4?=
 =?utf-8?B?OUlONXhjRllhMVlzbzE1Skc4WUtlMmtEdzFLUVdUUUhobVZtYmlKamlkQU84?=
 =?utf-8?B?UHJCbTJjUWVYeWNXNnhHcjlVQUdKS3BrcXZQWGoyVFQzTkJPTnlaNmxKSzZk?=
 =?utf-8?B?UFMvS3BjSzIzRzBIVXZ4OGRlUWJyaG5CT2tnZ1VFUW1ZUzhVUnlVUENFenlB?=
 =?utf-8?B?WDJoZkFMQXdsNEZaNGw0RERLZG9rUG80WVhwaUxWN0NQQkZBb2NRQmFGb3FY?=
 =?utf-8?B?b2NxZ0ZjVkNjbEE1OXV5UytYZXpzdCtzYWkyRDBwcU92ME1WYzIySUd6ZGhP?=
 =?utf-8?B?aDJna1YzVEM3b2gyTzZpUitCQjFIN1dqeGxicW4rZGU2c2NBbDlyMEJQcXdT?=
 =?utf-8?B?VC9ERGNqN2RDd0E5ejRFR1FTZXlFRlZiR3Q1WEpSQUt2L1VvUnQ5Y2pWQVdQ?=
 =?utf-8?B?cVoxbmYwVFNXS3E5eWhCOU9ybmtQYWZoUjlrbWFnTVU1bHcySnBPOE5sb2dM?=
 =?utf-8?Q?kDJm9I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGlXYlNnVFVROXdyZTV5bFdZTm9lMkZuQXVnZXVyVzhUcWJmNE5zZEFCSVNE?=
 =?utf-8?B?a0VTRnNES1pvemV2dHRXbGpuM0pPMG5WZURLSGQ5RHZZRHZrUWtHUHJwK0kw?=
 =?utf-8?B?ODV6cjdRTEdPeXpzMGJzODVNejBhRE5uQXJEUEFxaDBRbGZYK1FxNEs1REIw?=
 =?utf-8?B?T1FxdENvTmpxL1BmSTJYaXJPUloyMDFlRUVjTkZxc0I3R01HNTFzcGFyNnQ4?=
 =?utf-8?B?a3pBTXBWQkJ3dFJUQnBoMWlqOTFwOVR1eStvTEJwTk1aRWpaZVJQdHNOSUVu?=
 =?utf-8?B?LzBTL1E4OHcyZ1E4L1lTdkNUdDBTdWgwQXpIVnlHQ1ZLQk9CZUF5RmRJWElH?=
 =?utf-8?B?YllGNUo5ZVhHdjQ1TWZJVU9UWUpiNkF6REZCUk9tQlVNdjBPRUIzSDIwQUhT?=
 =?utf-8?B?ekNyWlpxV1hjS1hZeHJreFVjSEcwd2FFKzc1NitNZ3BvVkJsc214NzBIUW1u?=
 =?utf-8?B?N2h2OGs2NGZWL3B6WE5MWkc3dU1GTnJUQWxuRG8zZWNLU094TDZBRXc5ODVk?=
 =?utf-8?B?dTRPVU9DZjNieHNQaVhWMW0yMmF3cWxRVGFLZ2NkRzUySW80eUhCdHZLbXFy?=
 =?utf-8?B?cFBQVE95b2pQL0t0a1BJaWRJOTFOK24vRjRSSUlGS1QzaDRPbFdSOXFXV0Ry?=
 =?utf-8?B?ZzM1a0J6bXlEQnRXdWJBOVRHTnpCS0JrYUxqMFMvVXBLMUl0YmRSM3I0d1p5?=
 =?utf-8?B?c3FuRG5ZS3dUa1IzcHllV21VTEp1Rmp6N0Iza1F2NkNNZk4rN21ENm9qOGY4?=
 =?utf-8?B?WStidUhZc0YwellzVHRDVzhYb2VHRzlZM05wM09Eenl5VXNlWTNwRmJGTWRs?=
 =?utf-8?B?OG9zcHFnWlpKVnZvM29sYjJudWJvSUw1TmNBWTRxbUEwMjhKSll3T1RtWEJZ?=
 =?utf-8?B?N0dxYVRwb0JMRGlCTHBSdEZuelYwbldOcjJNZFVka2VCNkhVdnBnQ3loVEIy?=
 =?utf-8?B?eWV1em53UWdqRGRQZHNEY05wMVlTZWtrOHJkemw2MTRxTkQ5cHdLSVNBLy8r?=
 =?utf-8?B?cXkwaGN5eFMxZzRkWVRXYWR3SnltMElpSlh3eDgwaHBBOG12K3hTSE9ISnZZ?=
 =?utf-8?B?VmVDQ3JsVys0TnBobUZYN1d5UWc2eGN2VVQvWnJyZ0ZHczI4WUFnWGZhdDQw?=
 =?utf-8?B?RWwwNzRmZFFaZUFBbDlLaUR2djVtWHJid1Y2TGdFTnhwZEowN1QySmJnWkgw?=
 =?utf-8?B?ajdBRzdRcittb2xIV280c3lHOWIrbFlxRURzM0hKZysyc2JoMzVZZUJLSnRU?=
 =?utf-8?B?ZUFhUlVEWlN4bVhpTFJxMTNoeFJpS2ZzS0d4a0phUWhNTysyWGVSTENpYW1t?=
 =?utf-8?B?K2J5dVFucUtDOUhKRTRPTldneXZRdGZHNGxFWmF3RENvVi9IVGEzQUkxWXNy?=
 =?utf-8?B?Yll5ZnVSRmZ3YkJKUkg0a1lwenA5MkRwSFdrMG5HWTB6YWRVMDdFTUNzT0FL?=
 =?utf-8?B?RjJNbGtGSjZzSnJ6T05RdG1EdWoza3p5eTVaZjFCOElrZGdIaW9CTjR3ZlR5?=
 =?utf-8?B?MVhxL2o1YkNKTE9BY0E0ZTNaaUIzSkk4N3BncjJHSVk1NDRXTFdjcDhyeXJz?=
 =?utf-8?B?QzJ6OHJaSWozVHk1U1BDZTJvY1FKM1JEQklaU2E4ZGFDSWVYOGp0Q2ExdW5Z?=
 =?utf-8?B?aGV1NjViZ0JpdjUxR3NiVjdnZThOcXVOMGpjVW1uSk4wekZhNWJHM1hXdGNJ?=
 =?utf-8?B?ZytPU3lreDE1cFEyNE5uOGRkTWZmTWM4SmUyNFREMDBiUXVGWjluL0NxTk5S?=
 =?utf-8?B?NFViTWhxODdRM0ZsY2p3bmJpbDZiVWQxVlVxckd0eEZLMG1sdTVGY3BBdFlE?=
 =?utf-8?B?LzBReFBLWHR5TjR5RTV5dnNoeVRkTkc4Q2V3L0ZsZld5K0YxenM2eGxRWHR0?=
 =?utf-8?B?RVZ5QnZtNWFJcGZlQW85UnZnOXBwMlZlYTlXZ0tLc3k0Ym5NZTZjUDNmTlov?=
 =?utf-8?B?RjFMVXkzYmJIOVRKbjA1UUxTa1ozWEZlV0hnUHg2Ymh5WnU1dE0yZ0dNUHIv?=
 =?utf-8?B?S0s3RkJVOEdleE1abXVkblIvV3UwalhYZ09hUk8yTm9YSmt0OHBmZlNPY2RB?=
 =?utf-8?B?K3dDbzd6QzhmVHRRQmlYRDhaamtSUzd6VG9QL3ZrbFRkNk1KdGNOaWdoalBh?=
 =?utf-8?B?SDJLWFY0djJ1S2dEWlZPUEF4Zy9pK0Z4aWhjU2RUQTFhaUFhMllKQTFFUVV4?=
 =?utf-8?Q?YW6IwqXgjF3WkLPM8VKQcLk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9865a8-077e-4a94-9caf-08de3700ea0a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 08:57:00.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WapPFfr6AYssfjk3JNof+2q6Sd668qObE8J5ZnZtqDYD3af/EsRKDS3/gAYUYbN0y3NKhTVG05M+sGr0FXBb1IynDcPd9xgrGgtXMYGUsbplNG2SP81jSyFqYQIGHEeb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA3BFC2BF
X-Proofpoint-GUID: Xqjub7tjJr2wJ2ySLqiSl-b7y_0fQBih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MyBTYWx0ZWRfX/NPW8fdajY+a
 oamm0NJJcqznCR/UF5QHzyyX/uwF8jeF94vU2FXFJ53DNjWpu4m9KWsU+9ZvKuq8CiEMQqjOKEU
 tawb3qw2SOYwnotd1nz957iSByL74IQNksy+qb3orChpyTLjY/K0LuQoLjjL1W7MI9vURd08qbN
 GpsHLU8oihcf3CoTAEo+W5eNunuXGsrp72ALUemFVgX3cmjgE5Agyg91fSFcHFjPIudttsVYFQW
 xLNODYBfB2KfMV9eCMQgTXJPfwwVqx6zHtPSmXianBvQPzkhUg6JDq/nTzstY8C7z9sM5Sp5qQE
 hJRFfWKUmf8SmY6+mIqOLyl98jfJcZOOiXk80j1YPOTtRTf/DZ0tG3yVgtmTTtNV0Yk1RCJ45iY
 lgr+n5fqXKXq3rIGKnZvxzH6ofA0hA==
X-Proofpoint-ORIG-GUID: Xqjub7tjJr2wJ2ySLqiSl-b7y_0fQBih
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=6937e45e cx=c_pps
 a=jAY+Yiv4fe/m5iF0AiXt4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OcE5tU-iAAAA:8 a=t7CeM3EgAAAA:8
 a=rPf5-_RF6rDuMq0BAdcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=qwkNQZnGtIHGNKTLT1RO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B96mxqC2003186
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122403

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

ripgrep is a fast, line-oriented search tool written in Rust.
Add recipe for the latest release (15.1.0)

- Recursively searches the current directory using a regex pattern
- Respects .gitignore rules
- Provides first-class support on Linux
- 'rg' is significantly faster than grep

More information: https://crates.io/crates/ripgrep

Upstream Benchmarks:
Task                                 ripgrep               GNU grep      =
         Speedup vs grep
Basic search (Unicode)          536 lines, 0.082s       536 lines, 0.273s=
       ripgrep ~3.3=C3=97 faster
Ignoring gitignore files        447 lines, 0.063s       447 lines, 0.674s=
       ripgrep ~10=C3=97 faster
Large single file (~13GB)       7882 lines, 1.042s      7882 lines, 6.577=
s      ripgrep ~6.3=C3=97 faster

Bechmarks inside qemu (ripgrep built from this recipe):
Tool & Command                      Real Time    User Time    Sys Time   =
 Speedup vs grep
ripgrep (rg "printf" /usr)           0.496 s      0.511 s     0.604 s    =
   3.1=C3=97 faster
grep (grep -R "printf" /usr)         1.533 s      0.633 s     0.897 s    =
        =E2=80=94

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../ripgrep/ripgrep-crates.inc                | 116 ++++++++++++++++++
 .../ripgrep/ripgrep_15.1.0.bb                 |  22 ++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
 create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb

diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc b/meta-o=
e/recipes-extended/ripgrep/ripgrep-crates.inc
new file mode 100644
index 0000000000..aa7e3f9dd2
--- /dev/null
+++ b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
@@ -0,0 +1,116 @@
+# Autogenerated with 'bitbake -c update_crates ripgrep'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/anyhow/1.0.100 \
+    crate://crates.io/bstr/1.12.0 \
+    crate://crates.io/cc/1.2.41 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/crossbeam-deque/0.8.6 \
+    crate://crates.io/crossbeam-epoch/0.9.18 \
+    crate://crates.io/crossbeam-utils/0.8.21 \
+    crate://crates.io/encoding_rs/0.8.35 \
+    crate://crates.io/encoding_rs_io/0.1.7 \
+    crate://crates.io/find-msvc-tools/0.1.4 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/grep/0.4.1 \
+    crate://crates.io/grep-cli/0.1.12 \
+    crate://crates.io/grep-matcher/0.1.8 \
+    crate://crates.io/grep-pcre2/0.1.9 \
+    crate://crates.io/grep-printer/0.3.1 \
+    crate://crates.io/grep-regex/0.1.14 \
+    crate://crates.io/grep-searcher/0.1.16 \
+    crate://crates.io/ignore/0.4.24 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/jobserver/0.1.34 \
+    crate://crates.io/lexopt/0.3.1 \
+    crate://crates.io/libc/0.2.177 \
+    crate://crates.io/log/0.4.28 \
+    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/memmap2/0.9.9 \
+    crate://crates.io/pcre2/0.2.11 \
+    crate://crates.io/pcre2-sys/0.2.10 \
+    crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/quote/1.0.41 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/regex-automata/0.4.13 \
+    crate://crates.io/regex-syntax/0.8.8 \
+    crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_json/1.0.145 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/syn/2.0.107 \
+    crate://crates.io/termcolor/1.4.1 \
+    crate://crates.io/textwrap/0.16.2 \
+    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9=
847cc330696e02839f328f7 \
+    crate://crates.io/tikv-jemallocator/0.6.1 \
+    crate://crates.io/unicode-ident/1.0.20 \
+    crate://crates.io/walkdir/2.5.0 \
+    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+    crate://crates.io/winapi-util/0.1.11 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/wit-bindgen/0.46.0 \
+"
+
+SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[anyhow-1.0.100.sha256sum] =3D "a23eb6b1614318a8071c9b2521f36b424=
b2c83db5eb3a0fead4a6c0809af6e61"
+SRC_URI[bstr-1.12.0.sha256sum] =3D "234113d19d0d7d613b40e86fb654acf95891=
0802bcceab913a4f9e7cda03b1a4"
+SRC_URI[cc-1.2.41.sha256sum] =3D "ac9fe6cdbb24b6ade63616c0a0688e45bb5673=
2262c158df3c0c4bea4ca47cb7"
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef35111825=
727b38d33286ef986142615121801"
+SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6ae36=
1660ee5853c9af73f70c3c2ef6858b950e2e51"
+SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f02=
0e1402edd5753411d7737aa39c3714ad1b5420e"
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
+SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780965=
a8c7e8e285a5ecb86713e63a79c5b2766f3"
+SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D "1cc3c5651fb62ab8aa3103998da=
de57efdd028544bd300516baa31840c252a83"
+SRC_URI[find-msvc-tools-0.1.4.sha256sum] =3D "52051878f80a721bb68ebfbc93=
0e07b65ba72f2da88968ea5c06fd6ca3d3a127"
+SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ece=
c138e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[globset-0.4.18.sha256sum] =3D "52dfc19153a48bde0cbd630453615c815=
1bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[grep-0.4.1.sha256sum] =3D "309217bc53e2c691c314389c7fa91f9cd1a99=
8cda19e25544ea47d94103880c3"
+SRC_URI[grep-cli-0.1.12.sha256sum] =3D "cf32d263c5d5cc2a23ce587097f5ddaf=
db188492ba2e6fb638eaccdc22453631"
+SRC_URI[grep-matcher-0.1.8.sha256sum] =3D "36d7b71093325ab22d780b40d7df3=
066ae4aebb518ba719d38c697a8228a8023"
+SRC_URI[grep-pcre2-0.1.9.sha256sum] =3D "667bb90a3ee51f8f6e2aadf1d0f106e=
a42efca4cf28f0e71f0fdec1137d7f9b0"
+SRC_URI[grep-printer-0.3.1.sha256sum] =3D "fd76035e87871f51c1ee5b793e321=
22b3ccf9c692662d9622ef1686ff5321acb"
+SRC_URI[grep-regex-0.1.14.sha256sum] =3D "0ce0c256c3ad82bcc07b812c15a45e=
c1d398122e8e15124f96695234db7112ef"
+SRC_URI[grep-searcher-0.1.16.sha256sum] =3D "ac63295322dc48ebb20a2534814=
7905d816318888e64f531bfc2a2bc0577dc34"
+SRC_URI[ignore-0.4.24.sha256sum] =3D "81776e6f9464432afcc28d03e52eb101c9=
3b6f0566f52aef2427663e700f0403"
+SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7ccefe7=
1f97f96e50151fb991f267928e2c"
+SRC_URI[jobserver-0.1.34.sha256sum] =3D "9afb3de4395d6b3e67a780b6de64b51=
c978ecf11cb9a462c66be7d4ca9039d33"
+SRC_URI[lexopt-0.3.1.sha256sum] =3D "9fa0e2a1fcbe2f6be6c42e342259976206b=
383122fc152e872795338b5a3f3a7"
+SRC_URI[libc-0.2.177.sha256sum] =3D "2874a2af47a2325c2001a6e6fad9b16a53b=
802102b528163885171cf92b15976"
+SRC_URI[log-0.4.28.sha256sum] =3D "34080505efa8e45a4b816c349525ebe327cea=
a8559756f0356cba97ef3bf7432"
+SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc86238e=
165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[memmap2-0.9.9.sha256sum] =3D "744133e4a0e0a658e1374cf3bf8e415c40=
52a15a111acd372764c55b4177d490"
+SRC_URI[pcre2-0.2.11.sha256sum] =3D "9e970b0fcce0c7ee6ef662744ff711f21cc=
d6f11b7cf03cd187a80e89797fc67"
+SRC_URI[pcre2-sys-0.2.10.sha256sum] =3D "18b9073c1a2549bd409bf4a32c94d90=
3bb1a09bf845bc306ae148897fa0760a4"
+SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[proc-macro2-1.0.101.sha256sum] =3D "89ae43fd86e4158d6db51ad8e2b8=
0f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[quote-1.0.41.sha256sum] =3D "ce25767e7b499d1b604768e7cde645d14cc=
8584231ea6b295e9c9eb22c02e1d1"
+SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
+SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b3db=
b938e512c55c6831a10f3e6ed1c93b84041f1c"
+SRC_URI[regex-syntax-0.8.8.sha256sum] =3D "7a2d987857b319362043e95f5353c=
0535c1f58eec5336fdfcf626430af7def58"
+SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c5dd=
4bc44d8bb0c1c632c8d6829481f"
+SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
+SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91436=
180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c39=
83b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab=
66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_json-1.0.145.sha256sum] =3D "402a6f66d8c709116cf22f558eab2=
10f5a50187f702eb4d7e5ef38d9a7f1c79c"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[syn-2.0.107.sha256sum] =3D "2a26dbd934e5451d21ef060c018dae56fc07=
3894c5a7896f882928a76e6d081b"
+SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1c=
b24cd2c6c79397ab15774837a0bc5755"
+SRC_URI[textwrap-0.16.2.sha256sum] =3D "c13547615a44dc9c452a8a534638acdf=
07120d4b6847c8178705da06306a3057"
+SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum] =3D "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7=
cbc1716405d852a3b"
+SRC_URI[tikv-jemallocator-0.6.1.sha256sum] =3D "0359b4327f954e0567e69fb1=
91cf1436617748813819c94b8cd4a431422d053a"
+SRC_URI[unicode-ident-1.0.20.sha256sum] =3D "462eeb75aeb73aea900253ce739=
c8e18a67423fadf006037cd3ff27e82748a06"
+SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c345=
a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e6c3=
c3ee5c05081c9a00739faf7503aeba10d22"
+SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa916=
3bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df61=
766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586de76=
4dabcc06133f7f1d55dce5cdc070ad7fe59"
diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb b/meta-oe=
/recipes-extended/ripgrep/ripgrep_15.1.0.bb
new file mode 100644
index 0000000000..7bb6be1cb6
--- /dev/null
+++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "ripgrep - Fast, recursive search tool like grep, written in=
 Rust"
+HOMEPAGE =3D "https://crates.io/crates/ripgrep"
+DESCRIPTION =3D "ripgrep recursively searches directories for a regex pa=
ttern \
+               while respecting .gitignore. It's fast, safe, and written=
 \
+               entirely in Rust."
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE-MIT;md5=3D8d0d0aa488af0ab9aafa3b85a7fc8e12 \
+"
+
+SRC_URI =3D "crate://crates.io/ripgrep/${PV};name=3Dripgrep"
+SRC_URI[ripgrep.sha256sum] =3D "f388c4955f85477c28a8667355819844a06614b0=
83c23517f0e86bd1d6d82b73"
+S =3D "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
+
+inherit cargo cargo-update-recipe-crates
+
+DEPENDS +=3D "libstd-rs"
+
+require ${BPN}-crates.inc
+
+BBCLASSEXTEND =3D "native"
--=20
2.49.0



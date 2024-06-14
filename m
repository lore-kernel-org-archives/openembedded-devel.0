Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4573C27C4F
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 01:05:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1029.1718327096546073923
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 18:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6895a578d0=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E0v7bI021349
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 18:04:56 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg5kvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 18:04:55 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45E14tXv000348;
	Thu, 13 Jun 2024 18:04:55 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg5kvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 18:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V33hnr5MXjSgUmbwE63EOhU1FAFmGlsh7Ml0SMmzINtrZMemF+4YIkEJs7VeFXsLD98qwpfTfe92gIHh1GtQc41o4ixgfuzoCiaJpmqiizKpvPiRCsNGfBIsCFy4W5lTtlvPJscJ38Tnro1IkXbq0agQQ8p0lp3F+u24yRe8oWTspCF6zI0f+Xyh3otIJyHsObwQk+d2b61GDtiDByY68pXWv9j3Ns00l3Ex36wr2gtyXgnrr6DIi3sAHGYC8/Spmmu06QOU6GHlEPrg2wG1OjepSNNoClXg8pbiZ9ZTQgQCH9cFrDpvjtd5Iag9Zq0zEFQ6OtISAn8NPkjaZXXmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYiOgvY0M0V1K/R0N4sG/U3lHbaplVXeUtyWZ4kx4mc=;
 b=PYovC/7OVVBn50BhQ3BnLtmDN9RAsstbn/ZrG72dTrpUMpzXfqLqyucpVL8vuCM8Z4Qf7gICnusIPGFn+oPmYUDjY8BFifvLcbJOAPH3vJdjrJ33nyib1K22lS6GEGD+QH6H3+0DPOVcwVnX/AmrIY3hoKAL2FYb6ydKbDmfl7bpJcbPfF1uP7J8dtImLp46EpVsZhXxOocIXijfUiQVZ1ew75oANKl6biA6NwVTHZPOcy+o5Bzi1E7P+gNdrepsmyemSuPsKXxzT2f+7m1sTzmmh0vdXt/QuFaL0laqpNAjd9FxHLmX7tTJSEvhYXSxfoahLdOH7KB+sVctfOiYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB7756.namprd11.prod.outlook.com (2603:10b6:208:420::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:04:50 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:04:50 +0000
Content-Type: multipart/alternative;
 boundary="------------Nqba08S5P1DO0PydTBFFln4n"
Message-ID: <e8e54688-f2e4-4d4b-9b87-2ba555b7d7af@windriver.com>
Date: Fri, 14 Jun 2024 09:04:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] tnftp: Disable
 incompatible-pointer-types warning as error
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240613084703.1858419-1-changqing.li@windriver.com>
 <CAMKF1sozZLs+7XkTZnmoxJmuSz+pqBcVaDn5-G3M2hv7Ak=L1Q@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1sozZLs+7XkTZnmoxJmuSz+pqBcVaDn5-G3M2hv7Ak=L1Q@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0342.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6122d6-6212-4869-78a0-08dc8c0dfdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|4022899004|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WS9HUG8rSldrTVd3NUk0UXRISXZwK1VRUWQvVE5Ld05yaml2K3VMeDE0cGJH?=
 =?utf-8?B?WHpqL3A3ZSttaTRLam1FVEhBK0M0bkJ4NDRxaUhrWGdDR0w2ZUdBYlFCZzZl?=
 =?utf-8?B?aXRxcUkxWkZWU2dUOXhHMUQya0ZUaVFrQlZtMWUrUGo5Ri91M0JQSGQ5R3dF?=
 =?utf-8?B?SlQ3dWpQaWw5b01qOEswODhpNlZIeC9SQWdRYUY4WThzVFhDektFSHlwdDRn?=
 =?utf-8?B?TmVzSHFoWkhubFlTT0hYSnM1a0cxclp2czY4NmFFZ3ZEM2twWDZBNGVOWDZu?=
 =?utf-8?B?V2p2MFVoeFhvckpXYjRMUnhlcms2NTRpaXpEY3M1RUJpbGJXU0JDUnlna1NF?=
 =?utf-8?B?eENsUHhoSW9VSW5SQTR2ajc0UFRiUGMwVHpSd0pZUUMxaUlDVmVEazJmMUZT?=
 =?utf-8?B?RUh3ZkRKMzR6Wmx3MXpvUzh2dkdvc2xoSWhvM1RnR3BmTlhaRjJPMHlCbDZX?=
 =?utf-8?B?SWRrUEpjTTJhLzZockdWVUJLYzQvdW0zSFNkeDhCVE41emhGTkNpZW10dzU2?=
 =?utf-8?B?RnVBTTFzeGswOTRTSVMwczBnR3dIMWJDK0RheUwxMkU2Ri9kbWlKRURGTDVX?=
 =?utf-8?B?QW16bG9nUUFqNXlZK3UrelBRcEx1akhoRm8zZ0xhMnlnQ0Izdy9uKy9JcGJR?=
 =?utf-8?B?ajhJQkxhWDBrUDllRHFTWnhYT09vbmNxOVJaMkpKbG5oOHFlUTJGYlBUcGx2?=
 =?utf-8?B?MmE0N2pVUGIvTnhnNmIwQS9uOVZhdWdTNVp1Nm5sYzAxc0NoN1BETWNpa1ZS?=
 =?utf-8?B?dTQ1b0Jpc0FOYUFEaWtrdDhVSm9rM2pZMlFlcER3bmpXZlRsYTJTS3NJczR4?=
 =?utf-8?B?a0RTdnl6QXlObDJiQ1M5UFdjNDljVWpubVJ1LzNqZzlWdFFKamRCVzdEb29p?=
 =?utf-8?B?bHgxWVk4c1VvQ1pQNlg4VzdyZll4QzVjWGNHTHpjRHRHYWRSQ1YrcG5URG5S?=
 =?utf-8?B?akY5NVBJcWpBODUxSkJIejdzcnZ0S2hxTmtMblhQbFpkM1o5YWVUMWpZNSs0?=
 =?utf-8?B?bHYzQ1drVnVNeFRlUDlQNFZuODBkY2tQREFIL0o3Z0dnMmhqVnEyVEk4WGs1?=
 =?utf-8?B?NnlOcC96Yld6aDQxT3NhSzhWUEE3Zk1kZEZudkRXOE4vT2Zpc2JnMFFzVGlW?=
 =?utf-8?B?OUlDMGxEWVd6S0JaaVV1dERGYzBTM2hNY1Bmb0ZPWXBWZVkvOHJQUjBiQmhm?=
 =?utf-8?B?aTl3eDRNY0EyeTh1ZzZ1cHpBZ2RDRDRZenlKVDBWWHZ2UUZ2NHZBLzZsNkUy?=
 =?utf-8?B?V0MrNkRQVXYweHRuWnpnd0R0KzNmZkNzaldrL29jNlZ5aTNFcW0wODB0RVhh?=
 =?utf-8?B?YkRDeFFFcDZLaVhWcTNUODBzbFNuVTJBRXdHOTRDWG9UQWc3V3hkdTFQV1dG?=
 =?utf-8?B?cDFPTUlqS0FSVGtGbFJVWlRLbFlOS0xOSTlHOXJGUmw0UVc1eFhLc3ZpUFdL?=
 =?utf-8?B?SjkrNzlEekQ4azVNaVV3ZythdGNIMWxQMDI1SnQvK0l4dXZNbStnc2FiaVBk?=
 =?utf-8?B?elJJcXg4TmJ5QjBrckpHY2ZTeW1WMi81UnM2R01nRFd5T2pZaXJhNEFhWnBX?=
 =?utf-8?B?NlNmZU1weEF3amZMYXdlWEtZcEJmVllvYUdFdXhoWXYzKzB3V28yVXNMQmJ0?=
 =?utf-8?B?dDNjcVVPSEdSZUp1QXRXNmdWVXFDSmw3SlZ5eFh5V2gvVFBsQkxhbW12cmZv?=
 =?utf-8?B?djFjQVNVR3dYWVZMai9ORVRGNTNERXNVSjROZnM0YkMzL3NwQnl6M3J3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(4022899004)(1800799019)(366011)(376009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1pybTJhbXRKVldrQWdDZUFld3o0cXhEUGw1TEFKdVo0Z08xd1gwWHBXRWtO?=
 =?utf-8?B?RUpuanhtSUFoRTVYMFpwRDM3aEc2OG4wcFBubmNGV2t4aFVTM1c3TnBhRzdK?=
 =?utf-8?B?WkMwTVNubnhCd1ZqVXM3bktqbzJHU2liOFRLU3ZxaGxqNkxFaUt0eUcwR1R6?=
 =?utf-8?B?b21IR3Jwd093SUMwMGkvQllESmNoQlZPVUNoRGxNK1k1WWYwNEZ4RFQ0SXVh?=
 =?utf-8?B?aU9EbHRJcXM4WkhEN3E1YlhpNjB2OGNrZlZrNFZzalBydmIyc1hXM1ZrQTRz?=
 =?utf-8?B?dExsbG4wdkVab1orL0pyYzRqaE9pejlESFhta1E3VUxMZ25xc3lUeWgwZmxa?=
 =?utf-8?B?MG5vaXB0YjFkeHMrdzdjdEFjd25uS0dOMWpaQzlhendkb29ZUndZZDR1RmdN?=
 =?utf-8?B?WmZPYTNpQm12TlNPdyt1bW1PZTU0YXB0OG1ZT2xzYisxLzhreTBjZCs5a1Rn?=
 =?utf-8?B?QlVKLy9wdFNLTys3N3pRNFlESGlheDlnM1RuY1NVUVpDVVh0NkFLSTNhY3lO?=
 =?utf-8?B?R3ZwcFI2TGQrU2pCbStzb3BldlB5T1p3aVNTS0w3LzVoczNnS29HdUV0S0E2?=
 =?utf-8?B?cDQyeWtvYW9BdlBaUmgwN1FUdS9XK3VZeFlob3pEN1NyaVFLVEkzdE9Beksr?=
 =?utf-8?B?eFFJbHZseGwxR2pDdXp0M3FKWjU3ZWQ1c1dLT3pKS1dYYTVCTjl3MlA1emJk?=
 =?utf-8?B?S1RPbHI3eWFnbDRUSk92em1JRHgrU0pCbG5yWkNpWkx2TVNrZU5sUWpZQnlB?=
 =?utf-8?B?KytxZFVoWUxLT09meEszLytJeGo3NmFnQjhOR1pReFBrcjMzVXRhRVhBdW1K?=
 =?utf-8?B?ZUpDUXhITnkxbWROQmN2UndieUkyZkV4aUJIOWJ5VU0wSjh3MDg2UjAxWmtI?=
 =?utf-8?B?dFZ0aEtZbDVJVUJ0VnVQbzQ1bmlSaFJMRm1BTGh5ZzBzRFd6bHhMOG55QkE5?=
 =?utf-8?B?OHB6N3BJVUhMTTd5a2dTLzRqLzhBL0FiZVMyaXFEYm93NXRNZTlXelI5dXg3?=
 =?utf-8?B?Qnp0Zm9YNTkvdUNDdzlEUklHeGdOUjJHamp0QmU3Q2xQakgzVTloZFhueW5O?=
 =?utf-8?B?QVBpamlQaE4weHJnQjQ0WGhVUHRKMyt0MlB0OEJkUm5GMXZwcmJhRk1Lc2Vr?=
 =?utf-8?B?YWJMRnU4Y04wMjc2ZUNnZUZHRHJXOEk5b0drdnhEc3Y5SlcyUXRWbnYwRE5X?=
 =?utf-8?B?YlFiSWdEamR6VTlmdGx2QjFJVjFSKzhrWUpJQk1VTnZYUTN1QW1JaDR6NVI2?=
 =?utf-8?B?ZDBERW52bVN4UVFQQUxUZGNlMGNpMVczUHkxSUFNMjc2VTlmNEhDcmgvRlF0?=
 =?utf-8?B?U2xSdDUrNzdFVWNPOWhDK1VKSkV6a2hrMWtwVDJSVjAyVDV3SkpFV2E3aExC?=
 =?utf-8?B?NUdSN2xGUkxOeXYvazNEVVE4RHY0ZHdIOVVFa3RYSkw0a2I0cnRLME8weUJ4?=
 =?utf-8?B?M21OZG5BVXRUQVllNk9xdE1JYWc3WVVyUUNEOXZLYm5iYkhhRVowK3NPSC9C?=
 =?utf-8?B?R1lVak04bW4yQnJUWmMwb1lxT3FtOGJ4ZVNvamRRbEVIV1BIRjF4aXJwZmZk?=
 =?utf-8?B?Y2N3QzJGbURGWVlBbEdnalM0ZWoxYXk0emJuODJjQ2IyL2JNdWxhV0pzQzQ2?=
 =?utf-8?B?ZENpQ09iUWNqZlpwdDhDWkg0a2ptTURjUk9vQnEvQVhBTzErbmZMbEtuMU81?=
 =?utf-8?B?V3ZpVTJsZXBLRHB6TWkwK2xRbTJSdFp5THdTRVA0SUprZFdiTDR2bWNSN0pO?=
 =?utf-8?B?Zk1NR1RCM29TdWJCdkhpREQzVW9mdTNDb2xWRys0ZksvL0dRSUM1bys4MHZy?=
 =?utf-8?B?NXBHQ3RqaG4yZnN0NWZaNUc1c01OSGQ3dkpmMHdERktKN0Q1T09odHNEMHlq?=
 =?utf-8?B?RzEvanV6RmdLcFRVekNjOHdIUStCdEN2d2RRRGVHWUx6am80cmxqVGRsd0hV?=
 =?utf-8?B?R3U3WDlIL0l3ejJoNG1SNmdzeHowMlNMRDFsTGFFTklnU01YK3EwQ01sQk9I?=
 =?utf-8?B?RzNoaUExQ3FlblBsV1ljVEREM2UrR2hhOVE5ZVFZV0ltZ2x4NVhYUnc3bjJE?=
 =?utf-8?B?UFgrTEtBM3RqMG1Gem1SYkVpblNKRUh0aFZPWEs0bExFOWJIMVQzaGFJVnRw?=
 =?utf-8?B?LzVCVW5KTTgwOWRLdEF3TTVDdGN2TG51TEduTGRSZC9GRGNnRzJsN2x1WEhN?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6122d6-6212-4869-78a0-08dc8c0dfdce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:04:50.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsu1pUFfAGcHdYdXglnBTSL2bp8Hd89f7X8IdttRDVqmqsqhQ+8QH81OG6WIHHLRHbJ6UF4FjT98sQo1Z6kCfammPGZ3xqXuBdDw04GFHfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7756
X-Proofpoint-ORIG-GUID: ph604rHNGK_3DbOumezcgbaUMh4Eo2PX
X-Proofpoint-GUID: xVHDtrhKxQ8U0si4R60ZnCLN369RSw2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406140003
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 01:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110898

--------------Nqba08S5P1DO0PydTBFFln4n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45E0v7bI021349


On 6/13/24 23:39, Khem Raj via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Jun 13, 2024 at 1:47=E2=80=AFAM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Fix lib32-tnftp do_compile failure with gcc-14:
>> ../../tnftp-20230507/libedit/terminal.c:597:56: error: passing argumen=
t 2 of 'terminal_overwrite' from incompatible pointer type [-Wincompatibl=
e-pointer-types]
>>    597 |                                 terminal_overwrite(el, &el->e=
l_display[
>>        |                                                        ^~~~~~=
~~~~~~~~~~
>>        |                                                        |
>>        |                                                        wint_t=
 * {aka unsigned int *}
>>    598 |                                     el->el_cursor.v][el->el_c=
ursor.h],
>>        |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>> ../../tnftp-20230507/libedit/refresh.c:114:38: error: initialization o=
f 'wchar_t *' {aka 'long int *'} from incompatible pointer type 'wint_t *=
' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
>>    114 |                 wchar_t *firstline =3D el->el_vdisplay[0];
>>
> there is a new release available
> https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftpd-20231001.tar.gz

This new release is for ftp daemon,=C2=A0 and this recipe is for ftp clie=
nt,=C2=A0=20
so no new release

avaiable,=C2=A0 but I will check if we can fix the the problem or check i=
f=20
there is fix upstream.

Thanks.

//Changqing

> it might be good to upgrade it while here, and check if the issue is
> fixed upstream or not.
> secondly, it would be good to see if we can fix the problem or explain
> it what's going on.
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-networking/recipes-support/tnftp/tnftp_20230507.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb b=
/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
>> index bdd9759f2..da4466794 100644
>> --- a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
>> +++ b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
>> @@ -36,3 +36,6 @@ PACKAGECONFIG ?=3D "openssl \
>>   "
>>   PACKAGECONFIG[openssl] =3D "--enable-ssl, --disable-ssl --with-ssl=3D=
no, openssl"
>>   PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>> +
>> +#fix lib32-tnftp do_compile error with gcc-14
>> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110895):https://lists.openembedded.org/g/openembed=
ded-devel/message/110895
>> Mute This Topic:https://lists.openembedded.org/mt/106648104/3616873
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [changqing.li@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------Nqba08S5P1DO0PydTBFFln4n
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45E0v7bI021349

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 6/13/24 23:39, Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sozZLs+7XkTZnmoxJmuSz+pqB=
cVaDn5-G3M2hv7Ak=3DL1Q@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Jun 13, 2024 at 1:47=E2=80=AFAM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Fix lib32-tnftp do_compile failure with gcc-14:
../../tnftp-20230507/libedit/terminal.c:597:56: error: passing argument 2=
 of 'terminal_overwrite' from incompatible pointer type [-Wincompatible-p=
ointer-types]
  597 |                                 terminal_overwrite(el, &amp;el-&g=
t;el_display[
      |                                                        ^~~~~~~~~~=
~~~~~~
      |                                                        |
      |                                                        wint_t * {=
aka unsigned int *}
  598 |                                     el-&gt;el_cursor.v][el-&gt;el=
_cursor.h],
      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
../../tnftp-20230507/libedit/refresh.c:114:38: error: initialization of '=
wchar_t *' {aka 'long int *'} from incompatible pointer type 'wint_t *' {=
aka 'unsigned int *'} [-Wincompatible-pointer-types]
  114 |                 wchar_t *firstline =3D el-&gt;el_vdisplay[0];

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
there is a new release available
<a class=3D"moz-txt-link-freetext" href=3D"https://ftp.netbsd.org/pub/Net=
BSD/misc/tnftp/tnftpd-20231001.tar.gz">https://ftp.netbsd.org/pub/NetBSD/=
misc/tnftp/tnftpd-20231001.tar.gz</a></pre>
    </blockquote>
    <p>This new release is for ftp daemon,&nbsp; and this recipe is for f=
tp
      client,&nbsp; so no new release</p>
    <p>avaiable,&nbsp; but I will check if we can fix the the problem or
      check if there is fix upstream.</p>
    <p>Thanks.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sozZLs+7XkTZnmoxJmuSz+pqB=
cVaDn5-G3M2hv7Ak=3DL1Q@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
it might be good to upgrade it while here, and check if the issue is
fixed upstream or not.
secondly, it would be good to see if we can fix the problem or explain
it what's going on.
</pre>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sozZLs+7XkTZnmoxJmuSz+pqB=
cVaDn5-G3M2hv7Ak=3DL1Q@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Changqing L=
i <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windrive=
r.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-networking/recipes-support/tnftp/tnftp_20230507.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb b/me=
ta-networking/recipes-support/tnftp/tnftp_20230507.bb
index bdd9759f2..da4466794 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
@@ -36,3 +36,6 @@ PACKAGECONFIG ?=3D &quot;openssl \
 &quot;
 PACKAGECONFIG[openssl] =3D &quot;--enable-ssl, --disable-ssl --with-ssl=3D=
no, openssl&quot;
 PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&quot;
+
+#fix lib32-tnftp do_compile error with gcc-14
+CFLAGS +=3D &quot;-Wno-error=3Dincompatible-pointer-types&quot;
--
2.25.1




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#110895): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/110895">https:=
//lists.openembedded.org/g/openembedded-devel/message/110895</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106648104/3616873">https://lists.openembedded.org/mt=
/106648104/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Nqba08S5P1DO0PydTBFFln4n--


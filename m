Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71A1D0BB69
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 06:59:35 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.89])
 by mx.groups.io with SMTP id smtpd.web11.8651.1729753171995147419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 23:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=eGSl3A4b;
 spf=pass (domain: os.amperecomputing.com, ip: 40.93.201.89, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7FwmtsYse2+xPJjL4Jhha1vRFEOAXBij+swKNELzShTJ0nE7BiwDryg8ByAR1lwNMSCBqENcW8uLB4MWBb3XG8RmytTCAaEt7T1p+5KTv3JHty59z5MTzYlOM5UGPuF+mrrUkGEz8ErPjaQuPYFq4pH4aBz7RipWdz/Iy5awOqyewfxzbJmzkDytsTT0IEJMytXUvAawHY/iPgtxLanOA+wpnxZ9ERZsBoFkZaV7JY5+q4EnNp9XPyRwgrcr8gpsFX1zKRrdZHhJFC/XpuF8+XlmMv+QUmf1Xuzx7/xKXxG4fVyz6AtSbEDSVazO8cRtTzp5gcWwftvBKG2AKUdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iBLHqcU+N/MJIfkqIf6KKmpSSgJEma1JBVwNXnrHnQ=;
 b=TL0EJhEdrOCLUoc6UhdIQBIpB+qwyEOermfan5i1KEDi8X4O4HUzVLaA5jPMjSeO6iCjAOHC0HGROyqCqa4Kn61D9bwbLhZZtozkmPGgiJcNN9eH+a1KbUOt9cBloOfEg6/Geov1bB4hB6W2U7A4vzy+5vetavKJVRJSpfBkKPvYp0vjTBqY7G/tv8s1FsSrjIJ5Ty27qcMZkrsi1MAnypHL3lwO8pdl13VMHdV00mEyI1tu1aNq1O+55IVVoRzpQDLg6s5VxwfBSSu/0WoXNVEofFRJ/8NgolC+NBiFjXQT36lah7pFIpxsusYV/06XMwv49DDpHw1IygBbtTlGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iBLHqcU+N/MJIfkqIf6KKmpSSgJEma1JBVwNXnrHnQ=;
 b=eGSl3A4b57c8Kzy1+I558l0iopSUDqdEGZCIkQbNeOGz6UlvbqdJ7/XOsFkjQHF5CivNyX3WDIF24Sx5zX5FDaXXHIRwalwpbSurLRwgAvizIkV8xVLvgZefEfewaa1cFybOMToIxrvcCsoQOf9iyHvsC27SFQEloDT90gsf6+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL3PR01MB7100.prod.exchangelabs.com (2603:10b6:208:33b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.17; Thu, 24 Oct 2024 06:59:29 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:59:29 +0000
Message-ID: <c776c565-64a2-4cad-b2e3-b331e087b7dd@amperemail.onmicrosoft.com>
Date: Thu, 24 Oct 2024 13:59:21 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Khem Raj <raj.khem@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Thang Nguyen <thang@os.amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <b58d251a05b10d3e155e199a22b4b67a0149a4ff.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <b58d251a05b10d3e155e199a22b4b67a0149a4ff.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL3PR01MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 548c5462-12aa-4038-ad13-08dcf3f967d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aFE1UGl2eVFvaE1NL0tCUlhnRU5Pd3BEREJxMmRBYnFEN3hsbmh5WW8vNDZz?=
 =?utf-8?B?SlM4Z1RwSHZNVVNDQ2swYWFJNFBmNDM1a3VyNFJKaWw0LzlFalpjbGVtdTB6?=
 =?utf-8?B?d2FEclEyTE5RcDJiMUdmZHVjRDgvS0xSRDIyTzUyLytlTHU4U3gybHlkNDY2?=
 =?utf-8?B?c2llY3YzRXl3a1dWWXh5WlpaVW0xejZ2MDhPTCsraThIbkFJUXBiaStnam9v?=
 =?utf-8?B?S3g4Y2VFeWF5b2xLejNCb21SVHRrZnhQMGcvaUtWN3NpRmt6VUJNZXFWWmVl?=
 =?utf-8?B?ZW84cFA3VU45cUdJc3hoS1dVQ0RmQ0loeXFtU3VkUHJLaExLNzNTY2FsK3hn?=
 =?utf-8?B?WGpJVk54Kzhvekk1NHhWWHBETkdBOVBKQkt3TjhmTTlzRWJ1cHpvZUgxTXJF?=
 =?utf-8?B?ZXdZV1J2N3JwMC9VeE1yeXM4QThNK1N5d05xSGp4QU4vRFJ5QnZMU2lhOE4x?=
 =?utf-8?B?TFZxMGhUcUVQL3Qwd2Rxdk9RYjVsWXAxSVVuRzJsRjhDZXBTcUJIeEx0ek85?=
 =?utf-8?B?ZTVFQVVvbTE5ekNNWWF4aHdjNEE3cVFjRURVZ1dDUmNqdXVzVTl0NHFVRWV1?=
 =?utf-8?B?b3hkWFBhQ1UyMnFhQTAxZGdYMGJTbjZOOXBhdFNKd3hhZU5scGQ5aTJYMi9U?=
 =?utf-8?B?WHR2QkltTGZZYlg3enNQNnVaWjB2anR4Z3NWTlVaR1lyZFkra09qNWJ6bFdI?=
 =?utf-8?B?MWUzWjhhcHZJR0lTWGxsK1c0aWdaaTNLY3pXVGxiOWtZQm5wTGc4MmxYcWNz?=
 =?utf-8?B?anJoSlU2Wkd5T1haNGhHMFFwS0R1cit3QkU4Ukc0WVpodUlabWpOZGNuUDNU?=
 =?utf-8?B?TmpXSWNWNmwvRGN0d00zUzJCdEFBcVkvb3VEMUU1T2h2YmU1dk9FYzNxUm53?=
 =?utf-8?B?MURhR1NTSFdWb3JaTi9DTkY5OUZ4YlVWcWhkNldEYno3YktDVVNqUmo0UWpH?=
 =?utf-8?B?SEwyUGZIN2F2eitTUGNzZnNoVmxraHlKR3M4Ry9ocE04c2k2emJSaEFPaWtO?=
 =?utf-8?B?VlRQZXEwU0hmQTlkemw5c1NTbnAxaUlxYWVmZEtpdEtHVFRaaXdZZUN4eHFq?=
 =?utf-8?B?dHVrZG05RUovRXJZR3RvZ21KWjRONWNlQ2xCakUyREVnYTNRZGpPTzJLaGFQ?=
 =?utf-8?B?b3JkRlFjaFpZT1h1OUlMVVdoeFZpZ3JIVVJYWS8rcWFybE9mTmQxb1RyNjBV?=
 =?utf-8?B?ZTBWZ3ZkRTBaQ2JuSGRrNVBCemJ0QlFzcnJoZGIzT1J4KzNGaEg0V1lJVkg2?=
 =?utf-8?B?SmhjU2FTVFkxbm5PWElRWm9wdnAyWkxKY0dNWUpxbWZPRWJDTTg1eE5QdE9E?=
 =?utf-8?B?UmppZGhXNE9tVjUrNUlBYjR1ZWs4MDJpaTJTUFBzSm9ZYzBLRGUveXVBcUhU?=
 =?utf-8?B?eW5GZ0Uwd0twNDdZQTBwbHFJTVB0OGpSWVNxMEJNcGpKazViYmEwMmc4dEhr?=
 =?utf-8?B?N1FiSXJWUmR3TXlJclh2K3hiTFg4YUxMaE1DbUtvd0VNUnVIRXorVXVJeVo5?=
 =?utf-8?B?WnUwY0paS0JTckVqSkt0b1E4WlV4UGxMdHRpMjdNZ3lqZk10ektDRlhWZEZa?=
 =?utf-8?B?MjhnNThjeXNRMm1WN3pyVmRDb2x0eHBPSytUMjliWEZVdTRUVk9EQzMxSW9I?=
 =?utf-8?B?Q0gvdGtGN1Y4N3AwMG9RblBjYU5RUU96QUZucHpSK0E5ellrbWliTFNPRkZ0?=
 =?utf-8?B?YjRZMCt5N0M1aEwyOEhMa1dvTDcvTTVKc29GbE5oQTVjbmY0eUpzUzdYTDR5?=
 =?utf-8?Q?9mZm9X1xjKKF1WKqOure1sqNtFXOefMT21Y/TfY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFV2Wm5UMlFrNFV2ditJOXZmSnZKSWZLOEJVTjdoRmVRdStNb3JXdVBVMkxk?=
 =?utf-8?B?cWdiZ3h5TUNqRVpMSG52aTZnZ05RTUp5OFl0bnBsYUJPSjlJdU1DVUR1MWtR?=
 =?utf-8?B?TkpFdWs2blV2UmZnQy9BME03dXRTa3VaN3J6dHZ1WkxScDBvQlhuZWFEaG9Q?=
 =?utf-8?B?Q04xTlBpNlRZRnBuOGd4bHVaamFQMHlwQTJnMDlBQVJiblhKYTlYMTQ5M29m?=
 =?utf-8?B?WWhmNEY3N0FIaGJuM3l4cnBWblpPRThNNkU3OHo3cXAvZzVuZFR5cUl5b0Uw?=
 =?utf-8?B?MFV5WG1qVWN2b0hYVnQ3aDBnd0NNcmdzeFR6eEhXZlF0N0FKcCtNK3RLWTNX?=
 =?utf-8?B?UFdxOUlmOXBYaDVubnZEMEhHNVZTSGxWTlk4aDlDaFFtejBzSThUcmtKMmE3?=
 =?utf-8?B?K2NDKzk0cVI1TlBBMWxRWFFzOHF0Q1RtYzNaYnVsQ2dwKzE1M2F4c2tkdzY3?=
 =?utf-8?B?N1gvWFJaTy9nSnB4K1hjbDl5bSt3RnVoa1ltSThOdTZ3cGFJK0xOMFlVSFRl?=
 =?utf-8?B?OGJKcFhTL1AxNE95MlRxN282anBmTkM0TW1MRmJreG5LOGJ6Y0Q4a1FlZlJP?=
 =?utf-8?B?dWw4bENuRXNlNTgyRHg1bVF4TGxSajhqb2I0ZkdpZU1yWVh6bnZQSU1WVW1L?=
 =?utf-8?B?czhwUi9XekhPemx5dHpjc2xqd1JVR1V5QnEwbDdoWnZiQmE0ZWZJYkVDWDJQ?=
 =?utf-8?B?S0Vzai9zYXh4bGlRbXJqbUNDaEZ5T3hUSjVRQ3E5UXg1RWVKeHFyV1poV0l1?=
 =?utf-8?B?Vm5QQWtzdjB3dUlabTQra1RxZFZob3RuVVMrM1pVVDI2N3J4b2RJQmxMeGNs?=
 =?utf-8?B?L3hXNzlpeWxqMnVjL25xZVJSNk1OMk05UjN3Mlh0VitPaDUyWkgzN3VZcnNy?=
 =?utf-8?B?Q1pBLzBoQWhIUndJR3ZhaTJGK0NTdllTZHE2R2QvZVI5ZVN1czI0amVRMXA1?=
 =?utf-8?B?TG1oL0pMSVhsSWV6Z1lhRFI3anpRa1V3Q0RSSml5Y1ZCVm50UnZBRlVzWEVQ?=
 =?utf-8?B?emZ2bGFBU1RiaWdpNFkxdXozbVk5VGh5RE9sN1JJbEcyNXhybUExczd4eDRK?=
 =?utf-8?B?UzFHTytDanE2MUJBNE85Qy8yUTBkZHdGYklFcFhodzBCa1psUjBLM0JRVzlM?=
 =?utf-8?B?ZHNSTjZJbmxGaVRIZ0pUWjNVRHo5QW1WWjFGMlBqaVJMNHI4Yis2YThtNXNu?=
 =?utf-8?B?K3phcjhNOEZvOTZ4c0c0NnJZR3E0S2NuNUxLc2lBM0hXZ1poeHFubFk2WTRP?=
 =?utf-8?B?blZVVWNYS2h2aWdydTkwNnJaalVmUnZTS0xIWUlpcVR2a1NyeHZSN2dqV2tH?=
 =?utf-8?B?eHROdXpSUlV2MXdIRm5HMHgweFdHOUlvN3FYZE9qcXhBcDhJblUzMGFuVkU0?=
 =?utf-8?B?VFZkbTUrK1B3M3FMR3MxM1NXMitzQWYyT0hyMVVOb2ROeDVMNHhvNDZqQlAr?=
 =?utf-8?B?UUtMbnMzdy9UQ0wvd0lFa28xRVlUbFdaMDJzQlNmcGZIc3hrc2tRcVZQWDBV?=
 =?utf-8?B?M2ZxRGEzWUk0MVMzREZYYWp2NHc4ak9heGo2WnIveU85V1I2ektkeUFlMUZE?=
 =?utf-8?B?ZDFEUzNGSkdMcVZQTVBMcVNNMiswR3pQKy9qczNsZWtnTWc0MkhiOEhiRG0v?=
 =?utf-8?B?ODI2aWhQbzlhK3gyNG1yVzFwVk1ZVFVCekZSK0tCS0swYU0vd3N5VEJ4QU5w?=
 =?utf-8?B?RGtmYmJTL0NLS01BZUFjUUhNNWJpL0QvTlV5M0NaWjlWUnRCNGVHcEt0bndQ?=
 =?utf-8?B?VVo5aUlVOHo5SDZZQ0JBYWk3anlRVk04Q1lwcVhOalVIcnB5MHpnaEJFbEth?=
 =?utf-8?B?NktvSmpVdjdwRHFhTk1hQUo5VS9BYUxZS3J3eFR6dzRML3RMbHQ4aHVibE50?=
 =?utf-8?B?OEhkeEZLSTVLSjhOcVBONlJzMnFKTS9abE1pTXJMVmorSUV5NzY2NVRXWURh?=
 =?utf-8?B?N0pFZ3FlUWJjNHo2OTVBcy9MOGt4eHQ2b3VPZk5RVk1aQzI4ZkUwajVPUitU?=
 =?utf-8?B?NnpOMFU2dXdNVGdja3BiblVTaEFaZzJ0MFNLVDZaZ1FxOS94UDZMd0dUakVT?=
 =?utf-8?B?RnB2dlA3VThoRndVRGRPYmpmVHpHUTBaN0szNzZsekQzUFhVMk11QlhFSFM1?=
 =?utf-8?B?WDNyMXFGRktGUXpqVktLZUx4aUh1Rm9INWdQNVlpendUa2MzQkwrdVZGU0hW?=
 =?utf-8?Q?1BszoflFX0kVy9lvyW7bS8E=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548c5462-12aa-4038-ad13-08dcf3f967d9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:59:29.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucczA3/8cY4Z84/igIsFP9SXkjQ6LjV0gtZwJPwbJmS2Pc1d7B0sbNZ9x0KTGz/juBRqI3/hL2eN48hOuVY6jYhUStbcGMM4yba5DIWX0HQ5qWxjrLqjED9TyC/rcgJQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB7100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 06:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113162



On 24/10/2024 13:55, Jeremy Kerr wrote:
> Hi Chanh,
>   
>> -SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
>> +SRC_URI = "git://github.com/CodeConstruct/mctp;branch=dev/cross-fixes;protocol=https"
> 
> Note that that this (dev/cross-fixes) branch will not live for long;
> it's just for getting you a set of fixes to test.
> 
> I assume you are sending this change just for a CI run, so this won't
> matter. But just to be clear, this isn't suitable for an upstream
> merge.
> 

Yes Jeremy,

This is only a temporary patch. It helps check CI build errors on the 
MCTP repo.

Hi Khem, Please don't merge this patch. When the CI builds completely 
without any errors, I will push a new patch with the latest version on 
the MCTP master branch.

> Cheers,
> 
> 
> Jeremy



Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03592C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.91])
 by mx.groups.io with SMTP id smtpd.web10.9994.1744977172711870924
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@victronenergy.com header.s=selector2 header.b=L5D6g1St;
 spf=pass (domain: victronenergy.com, ip: 40.107.130.91, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5TCY2fF6eO+xRWt81kEWNopnzysPYIjCuuOfwa0rW3h7iw5+0FREFlXd6kyfckHSM6dxYNQOqNO2lKPvxqG6iz+RxeaLJszvbLk/nOsoEXPkznOI1VdSZuZfjROOxpFJLmn5vWatCzpnX7uOhtXrtQmhJqRedW+IWiIqpMzR4pSZywrJ9ke95SH5q3bo4b9s3JeebhFNBivJTvutnNE6XuDXxFuaLYH0xDURNy4nR4WCyoqOl5iBBIdoJNmfLaV+DlCVsWjwQ1LracMu4sTLSnAUguzeWUDDM2Ya5YWFfDOGPci7c9XuzYG1sHqeJMWA9IBAqdXivOB5PQ6ioTaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RfQEgzJlJE31CClv+2mcndOFCylkGG7asvhzeyhaY4=;
 b=oRKiH02fkUCjHJxdfgipLoEXryOyWk7DxeDiiq5oZZcSRlfegZCV97fiaUkizWC41k1FJSokbSSADsgoTKa55lgzVtO2qL6e8pUGyx6hjGuQbQzhEMrBkZmKl57mN8QX9HIYItIyXXQqCv6J0TXPePrAvVYYW+2nnXkrhhzipS/8ZDF6rgq0pC0za5/3YI1YLsttA5tpe6RoaMwhlabU5Jbpr5JZnS1cVGGXdGQNDVJAiP5uZyUc/p6AGNxLigM2dav8Il4mlZ07jndMQiEDPf/5IW5ZkdpkpxP2L2kv3PvX9vjtA+md90FqG2CITrLMaRmSxXgvKl5wiZWP5b4KUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RfQEgzJlJE31CClv+2mcndOFCylkGG7asvhzeyhaY4=;
 b=L5D6g1StxeiuagU/7TdRYmmUbcWN9+K5V9Rgtcrfb6nIaDS3rIZL68Og5pvvQXRi0vvYvR6inluA0n2dCMYDobLPOpZLJTUx54q2WhpERvSb8urrzkhhfziDzKVp9HfgaEs2bQWqQuB6gK5UKI79sXL066ebN+bS/SBj0X/9x/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com (2603:10a6:10:30e::14)
 by AS2PR07MB9230.eurprd07.prod.outlook.com (2603:10a6:20b:5e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 11:52:48 +0000
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6]) by DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6%5]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 11:52:48 +0000
Message-ID: <4e0908d4-2ace-4f30-b1c0-4af5393b55d5@victronenergy.com>
Date: Fri, 18 Apr 2025 13:52:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap] can-utils: Upgrade 2023.03 -> 2025.01
To: alb3rt0.m3rciai@gmail.com, akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <aAISd7n7umT8UHQ9@alb3rt0-ThinkPad-P15-Gen-1>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <aAISd7n7umT8UHQ9@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0158.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::25) To DB9PR07MB8679.eurprd07.prod.outlook.com
 (2603:10a6:10:30e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB8679:EE_|AS2PR07MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: d9252545-4e00-4031-f088-08dd7e6f8a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVNvY1ZkME55ZWZrcS96UG55NXltdlVoaFVrK2k2QXZaMVZkVERDc3lPNTZn?=
 =?utf-8?B?engzbXZWR1EwYjRHY2dnbVFTS1Y5K3A5Y3I1N3JqSHJMSjFxNXZLMHYxdzZS?=
 =?utf-8?B?MjErVlJubDM4YUdkTVhiRVM5VlZDbHZvWGpWTHZvUlpNdUExMkF2NGtKQUFB?=
 =?utf-8?B?TmpVRDdBOHNaZzFrTjNLMSswVFAwdkhMcWFpSWdwQTRyMGtzQ3E0aXBmRE43?=
 =?utf-8?B?QWsycmFXVG5FVHFRems1eS9Ga2xPVzRnOU5zOWp0c242RjkwZG1lNEt0K0p6?=
 =?utf-8?B?TkdoT3JibUlucGwvbWVwTTJoeTFRR0o1ejJ1Skl6N24xNHZRT2hUc25hREJJ?=
 =?utf-8?B?WDMra0ZSUkVvei8yMmNzazJBVmVqTTNYcU15ZVRYT0xRRzJ3YlNQUXNSZUd4?=
 =?utf-8?B?SjJ2VUhXOEptV0YvL1NFVTZIODM3Wmd2M2RkeXRNNHVQczN3MWEzekVMeHJY?=
 =?utf-8?B?dkg0Y3J5R0hlenlsandtbERsNEZMUWRrYXVzSzJhWDhHTnZDNFdHQXIyeVEx?=
 =?utf-8?B?TGpTWUcyNHRWL085MFk4UmJlbTZkaUE0N1Z3THNBOCsvTW4zM2E0aFVtQmR1?=
 =?utf-8?B?ZXBRR3lnQWptMnNTU2pVTmRpQzVWRnFnUjJsNXhHWUIxYjMxRU9uV2ZwRzFi?=
 =?utf-8?B?WWVZZndNNjVnRnM2b05oOXJQajJyOVVDZWpiN2hHWVhad1pkQ3hkZXdSbVlR?=
 =?utf-8?B?VVo0NXlWUlRRSkk5Qng2L2VrL3pJUitFWHBoVElxRW1IZjNudWJQaXp6dTk5?=
 =?utf-8?B?SVJmaGlrMCt0S05nS0lsM3Y0VG1Ib3JnSTJITFlwRVREYmh2OWRPa1ZXSUJl?=
 =?utf-8?B?bXBxUVVTNVBuL1Y3NUtySzFjdXZucldENXYyQlJueFR0dE1OaU9MZE02ZmRo?=
 =?utf-8?B?bG9WYjlSdndiNXhFMmdHSG1ldzd2WDJHYm0rT0dDTmFOU2loUkJxTXlwZVhP?=
 =?utf-8?B?TFVpRTBiYlA5TGszc2VNRlZudmdzU1p0MG8ycXd0TUxKMjFTL3I5UkU5RFRa?=
 =?utf-8?B?S3lLOU9URVZSbEhBaUZpbFU4TDRIVVQ1dVNUejJ4M2RDUzJ6WjRzNGZMQk14?=
 =?utf-8?B?cW90WjhCYmxKbFJKSlVOOUF5TW5JMWVjOXl1R0I0R09tVGtOZTNFckNJY0FG?=
 =?utf-8?B?bjVycjlTS1g2ZHRCZWhSNnl1amwyQjFScW1WUVpwK1lLZ25lNlZKVzd5SnF0?=
 =?utf-8?B?Z0pCVjVDTG5oNUh5SXNrOHBzVklLeFl4UStpR1hzNTViYTczQndDQjUwRE5n?=
 =?utf-8?B?TWlURWN3cEtJbDBLc01rNitoam5qY2R4aks0Q21TRGpPdHNsVVBEbytzRC9E?=
 =?utf-8?B?anB6QkM2THJKUkVmTmRTNHNUem1kRmZXU1RQSjZtZmg0Ny9qcnNjRGlUdGRm?=
 =?utf-8?B?S3RmSStUeXlXL2lkcFhIVFI5bi9JS0NUeG9WcDBZT3A2VkxNeTNUL3Z3dU5F?=
 =?utf-8?B?dWVXcndUckNRU2dXZ2RBUTNxb3hraDJzbExURlBCMVpyaUNEc3Z5UzVFY2w0?=
 =?utf-8?B?dzhVbGRLaXJBNDhSeTRQRDJwOGZrbXNmeUg4Z1dTa0VNLzY3ZmxNNzAySCtz?=
 =?utf-8?B?MnY5dmNJSUdYbXlvcHJCUFRITHpBbmFxMUtqUHFGRHM5WnhoWGFYZEJNaitV?=
 =?utf-8?B?V2hPZWxnWEdUR0xSSGN1b05pYmxqTjV5Tk94VU9NeWUyOXpIQjg1aGtWT3BV?=
 =?utf-8?B?Y1FPTEpTOXN1U0V0OHdtcHl3R0s3THV1NjZtdGFLMWNRS1B6TmdsemVTZ1ND?=
 =?utf-8?B?dHJRZ2RSVi9nR3lOQVhZWEQ4eFZ3MDBkd2dtZysxZFVMQUNIYWVoS1ZZN0dU?=
 =?utf-8?Q?lwaq7qR9yJZtJBEEAHR29FNMs5oWRrApOhtM0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8679.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RndBWk1qbWlBZURsYktoZFJwRWc0dWE0aEdjNzlhejRvQUIxQVNMbjhrR1gw?=
 =?utf-8?B?a3pSbXlHVE9Za1dubzYvVGpKYyt3N2dFL0FkT0pzcDNBdk04VHI3OVBxTkhC?=
 =?utf-8?B?VHhodWpyNzkxWUczcms4aHZNd1lSZG1VN3Z2WXRMQ29zdm9MM3p6WXhSdEZ1?=
 =?utf-8?B?NjJrSlZ3YnFiUkI1VEVBaUM3bmtRR1V6cjV0L0lIUFdHWnlVVWlHaXh1SDIx?=
 =?utf-8?B?dVBsSk1GVWxOOUY2NXRVZzJwK2NSak5QYTB4eEFnTkQyOUxkdVNMRWxFQW9m?=
 =?utf-8?B?TXltZW1FeXVrZHdWQ0w5WEVUSCtZd0ZIK1FlQWxiWDhKdFh6TjVpL3hZekpV?=
 =?utf-8?B?bDJHSVZOZE1kSk0zSDI1L2R5SW14ZzZLdkQ3TVhNM2dQbmova1dyU0M5V1J4?=
 =?utf-8?B?cXlvTUZWbEJEZ0IyaWd6dGZ3em5rZUFBWnBKZmMxRDBPRitNZVV5aDNwUVZC?=
 =?utf-8?B?eGgwWCsveWZMTEk0ZFV2ZUhrd0NnVzBXVUtXV1p3K1dVeUQrMm03RnFWZG9t?=
 =?utf-8?B?aDFoM0hZQ2tQam00bXlRR0JQS2FLcU9YMVZpSkwzWXFIblhKemZjWmY5Nnp4?=
 =?utf-8?B?dmJiOGdLNUgzaEdOZE56YnpERzdUUXViSzZHbjByVVhZR0JoMDF4M3VHd2tk?=
 =?utf-8?B?ZkF6ZWxJQ0ZJUVA2c2sydUR6djAxU1JBM3RqcndTRW5oNUZNazFKZE9ZNmov?=
 =?utf-8?B?UmUvQm85K1RybUNGOEF2MVlNRVRqRU11WDM3THVydEhxclNMdmsvWDRxZytO?=
 =?utf-8?B?VDdDd0JKd29JRkd4dEVKVmFiMGlWNUEvc2E1M3phMDhhcVIxY1Z2T0FuTEM3?=
 =?utf-8?B?ZXdCZ0c1S2Nncy9kM2N5ZmtnMHRZcnNIWnI5WlBTb3FpUVRnOEZ0RG9pWnp5?=
 =?utf-8?B?aEpVQ0JUZjAvVnRtNGxaeGxsejJMYnJ1TWp4ZmJsbW5LK01yVmlPay84WkNU?=
 =?utf-8?B?bGh3V0E5eU9ReUEwWmxnY1dySkxESUY4UmNRNnBudE15d04rUk9TRmIxWkxU?=
 =?utf-8?B?VHNTTUVDa0hyYjh1VmtFbC8xb0hRMFFWWGVxVHBXc0VVaHZoNmJqWk0xQUJV?=
 =?utf-8?B?RTlodkJiWnphV2M5dmtkcXFJbVJqZ3VSS0tZRG8wRTBQYTJzbktIYzY2N2dU?=
 =?utf-8?B?V2p2MURFaERKeHVwWnRWMWU1QVBEQms3YWVzbERQV1F6L3VOQmdvSElUanRZ?=
 =?utf-8?B?bWJvd0MxRStRdHYrckNOWTVhNlFrMDZKc2p2clg2TEVXVDZZTUhIVlptTEND?=
 =?utf-8?B?eDJHWkRLeWxpZUpnN1YxZ1V6TEdBMW50ZTJVRXlBK0FsRHVBMW9FdWhYYjVi?=
 =?utf-8?B?S1dLQ2QwR1d2UGs1Z2gwM0dQblFSZGw2bkMxS2I1UjdvSkxSSTRPNlNHd0Vz?=
 =?utf-8?B?aXpUT2ZWZkQvaVQvdnF5a1hJbVNHVVFJK0JlOG5lTHZMejZDV1lwd055bTJL?=
 =?utf-8?B?OHRoeFN3TW9uM0NuUWwyb0dLWUU0czdXWGRyMVZOZ3BKbTF3Q3BYbFRBcHcw?=
 =?utf-8?B?SEl5d3FHanBEKzMzOVhIbk1OU0Q4RnFkVUNQRkJjVkVPeE9URmtyRzRCSWxR?=
 =?utf-8?B?VDN3bk04ZFNwVU13cW95cHBFL2J5SW9hK1RTcC9PdzRXcjFaVFBqWTlETnAy?=
 =?utf-8?B?SkxjaHJoUXR6VmNtdEJwcHpoUllrc3Q0Zk5JbTg5cTNQVm8xS3BqWGFiRkFR?=
 =?utf-8?B?RjkvZFZ1dU40Sk0yYVRrOWhOQ1cxWFh4MlZ2elk1cUR0YThiNWpDd21iT25n?=
 =?utf-8?B?OTdiaUNqaEtvbjRJT0VBbVlPU0VIdnhTSGhQcjVGNUFiekwvQjlZWUhlRWQv?=
 =?utf-8?B?QS9YK1M1Z240VkRiUXdPaUVxdlE1NXZBZ1hUNWkyVGdSbGZHMGc5MWZ1Syta?=
 =?utf-8?B?MjZSUjkyL2djYkxaTjlqb3JSazJzREcrWWk4TXYxc3JxbkVvZER4VjJyNzJC?=
 =?utf-8?B?clRIRGk5UlJONmkxR2l1VlhKMHN3Vk95Qkt1QXlkcytiV3pHRHlMbkp2WlRJ?=
 =?utf-8?B?aGpkNmN0aXVGUHFtU09VSURsTjRsbE1ML3JsY3pSM0xkenltc0lWejRkQ2Qr?=
 =?utf-8?B?bkMvRWVVcTYwcmRNd3lTYXdjSmt2UzArSFpsZHM3cEVNNVNydE1tMWYvYXYx?=
 =?utf-8?B?aFhEZkJNdjE1ODhBU1FXUy9YWjltUHdRVE5qbXVCSWVmRnpGTDliTGxUTUI0?=
 =?utf-8?B?aFFjL3F1ajBCN0x1SmU2Z0JNMHZvVzZ0d1NZcGsvN0FjUFkzSUlLZys5UDFN?=
 =?utf-8?B?ajI5RnhYdlBnWnJrSWtDVk1SYXl3PT0=?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9252545-4e00-4031-f088-08dd7e6f8a59
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8679.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 11:52:48.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vbZg3zbq720GDxu3WMluba1dGuznv2DArEd9LdligjZe02JG/4az6kabcUdDjUtpNkwilou+zYom72Y0R9JN0IcfW6rn/F/CLBrUFADTbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9230
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116964

Hello Alberto,

On 4/18/25 10:51, Alberto Merciai via lists.openembedded.org wrote:
> Hello,
>
> I notice that master already include can-utils_2025.01 however scarthgap
> is not.
>
> Is there any specific reason why we don't update to can-utils_2025.01 in
> scarthgap branch?
>
> I found that using 2023.03 on scarthgap the following command will always show the
> same msec:
> candump -tA can0
> due to that cast:
> https://github.com/linux-can/can-utils/blob/cfe41963f3425e9adb01a70cfaddedf5e5982720/candump.c#L237
>
> Let me know, If not I can share you changes for that.

Below patch should fix the timestamps.

https://github.com/victronenergy/meta-openembedded/commit/46106ae5ce38a35cffa86c68a862c05dc1273397

I can send it, if needed.

Regards,

Jeroen


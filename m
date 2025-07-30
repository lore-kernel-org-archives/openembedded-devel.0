Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB35DC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:08:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.135])
 by mx.groups.io with SMTP id smtpd.web11.43796.1753902522520275062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@victronenergy.com header.s=selector2 header.b=JWgjQxN0;
 spf=pass (domain: victronenergy.com, ip: 40.107.159.135, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb9douNYseOrd46JAi0sJ9PndgsGji8D7RUX3Sb6HyC8BpFxUbVM+fN5GZacmMBM5iXOoEWjkLhLTchNkb6t9zxhaZrRuBV5q9d3elSOeqIAzUnwGDm80e5+AwRH4+sxyWu9KkI8hLHHv/EF0mJHTWR6iEkxsQ6B8Hs7htWLN0cHFBmJZIGmSk8TDZmXTU3pa96mSODhhsCKMHQohLxRA+gjkNch0jU6lQtHUS7rohl8Rd/kfy7V52PowzZoKEVUz9gg633ZzcZrkCgnJH8aeESCYVEkttFiZ09l0b2JAT09ludWIIscZATLsXLgqpDhIlD4VXKUWo0VIZS7HwM59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dDKRFpHcXJ/a+7JeWeSJMaXIo/BJJibMDM6ujQ0X3o=;
 b=UrgGqR90xIAmjMWsOMbI/N6Zv728/th1MvoyVr0jm3uxn/qvQoFNenswXaHsdoTJ72mzvNymK8I6J6o1lUHj9WrGwSMpktgrd9UZ6HHckVHTlZziqpkVEJTzP1Hd5Cw2sEpZRW+ZAKsDirhQ8fWP1CrEI7y5SUC8WT5JhidLgZ3WqdwoZwJcZaMDAAd0Nks1zpca8FVg8RZEGg5VuKuEnjwJ/bTcNGsj7OFbMcx9C/mW54X1T6tpIUNfjgemVnLoWfSQt3vi2oBuCM9EH28gA2sSr9Q6brVWkQrYpxbkTjEsYc3GHa0MMDNhZA6/QiriPpu9ar/Jvsb2PbEOYiuN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dDKRFpHcXJ/a+7JeWeSJMaXIo/BJJibMDM6ujQ0X3o=;
 b=JWgjQxN0xWGZekfAcgGOP9ge/TBN1Atao579tZgRnZ4zCvni8MN3Cfglh24b6EOuCmDP1hPHTe7okYMR0SUVhXr/hEss57YPrh2Jtq1aN4Nl1rRnnv9mF2UR6SV67H4J+UFmYm7UhSI5ejhAVLicelf1FQe66+iynSD4/1l2ZHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com (2603:10a6:10:30e::14)
 by DB8PR07MB6329.eurprd07.prod.outlook.com (2603:10a6:10:137::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 19:08:38 +0000
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6]) by DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 19:08:38 +0000
Message-ID: <ccd7c43f-835a-4115-bbd9-6fd5a632d88f@victronenergy.com>
Date: Wed, 30 Jul 2025 21:08:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECONFIG
 options
To: Praveen Kumar <praveen.kumar@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20250730123111.3858530-1-praveen.kumar@windriver.com>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <20250730123111.3858530-1-praveen.kumar@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::15) To DB9PR07MB8679.eurprd07.prod.outlook.com
 (2603:10a6:10:30e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB8679:EE_|DB8PR07MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cfec81-ee49-455d-08ec-08ddcf9c7d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1k4RDNmMkFGK3R3TjZVRDFVeWppdThHVG16bjYvMXVlTEVXT09yZ0YzbEZ0?=
 =?utf-8?B?c2hHQWxRR3RxeEUwK2tMWFphZDExV09JdVVjZ3ZBUFhwdXVWTE5QLzRyNVV2?=
 =?utf-8?B?UG95UVZ5WFJVU2pwNldTMTd1ei9TcDE1R01ua0VRaVlQb0JFMHRScWFlcCsx?=
 =?utf-8?B?VktNUmhvMkIvYXcvRmdHRVhoSC9uVDFtS2tYYjUwbGU1TUU5T3hwRC9jZ1dB?=
 =?utf-8?B?KzBFS2QrK2hST0JIZnBMTDRzU1BuZGhZYVV1N3NHKzVmSU9rQStjTUpsZVN3?=
 =?utf-8?B?RlZwT2lpK2Ftek5QeWZDL3lDOCsvSi9jT3luZitHT016bXpuRnZacWk0R1ZN?=
 =?utf-8?B?ZjJ4dnR5all1ZzhzUDRxUERvU1lUQ25xLys3WVhDV0ZIK0xWbFZRZXVJYmVL?=
 =?utf-8?B?MjFGT1o1c2NDN0JLbzNBUXRpcEJRc2pWU29qTmkwTWVpYVJOYmZPTEpyTnFE?=
 =?utf-8?B?RHpGeWxxTk9jV2IwZXJlWFFuMXphWlQyVHpKbk1VSkZ4RHJuOVZEZkhaNTVa?=
 =?utf-8?B?cEtkWTBPYVFCSGYvNTc4QTYvMHVpZ0w2Rk5jVnZTMFR2T3JCTzBwS3BmeVU5?=
 =?utf-8?B?RDRCTGxKN28zTTdLeXN4UVJYNVdTZHdKR0hLTy9MNHZNeGxGdi9tb3o0Uk1Z?=
 =?utf-8?B?cHVaUTB6UjFsTzBrTFNLVmFEN0JYaUMvSlVRamUyekU3anMvc0QrZ1JQeEZy?=
 =?utf-8?B?NlFTeDFZV3Y2N25IL0RzdGhMeWEwTVBMU0l3MUZLMVNnYys1b0Qyald6T0Fo?=
 =?utf-8?B?dG1PRzJPa3lxVUYzYjh5dkpURzduNi9ScXMweVVZVHJ4K3VGcmtDdnVPbm5E?=
 =?utf-8?B?NjgvUjFnRjBtam9kR29WV3lJZGhIenVlUnNBQ1Q2bEFXMlBxNHg2cTh0a3Bx?=
 =?utf-8?B?Z2ZndEYvNzZMQXpwWHZqZ1F3UFJaU2NVTmNtYi9hUkRxbU8xWHJOa2g3OTd6?=
 =?utf-8?B?ZnVqTGFHcnFRWUNNNVFnY0M0cXdtZWltVG05Vlc0NHJYSXdTbGNrbldWS29T?=
 =?utf-8?B?T1ZOSEdYbUJMbzUydmVlcWd0dlk1M3EzWjZMTkZoenE1U2NvQ0NRcEtKR3VW?=
 =?utf-8?B?dXlLM1dhMURHdjVqMEhseU5CeXh2NlhBYTVJYUVaZHlBcnRYOVRqdEtKUTVo?=
 =?utf-8?B?WCtmMGRxRGhHcDMxQWxTdkRldXkvdCs0eGo2dVlleWtNK2xRMjJMc1BGaXhh?=
 =?utf-8?B?SkhlT0VNRlZjSXIvWk9GbGhKOE9SVzJBTTkyc1FVVGdkS2ljMW1JTmRSNnNR?=
 =?utf-8?B?VU5PVVRnMG1vSGIrcVNLeHE0NnZPeDBNcG1SVzJ0UVVrRzEzSUNrNDZJRnZw?=
 =?utf-8?B?UklyZFVKckExQ3R1a29sQXJUb3hJcGxkTlRtVVNUZFp5bFVYN3RDTU1rMjhr?=
 =?utf-8?B?dXQ4c2NCRHRDY3o1cTRxOUtLejVwQ2IycmNBYmUzN1Z3cWNLenE1dzVhdVEv?=
 =?utf-8?B?bG9QYXJ2MHNlU2h0L2o0ZzY2dEh0U213ZlZRU3pudGxlbUJnRTNVZFZNUXdI?=
 =?utf-8?B?d0s5amp5WEh4bVVHOTVINnZJclFlZEgvZCtxQjdoRTBiTTVqMzFyNzRROXBm?=
 =?utf-8?B?Q2JBUkpXa3FNZDdZREM3TUJMYkNvYzZ1aWx1bFJOVE1NZTdXanRwTzlMV1E1?=
 =?utf-8?B?WHM1UGhtR0ZSR253R2gvQjV2VnYzcW9GdTV2U1N5TGg1Z0xRM1JscmdNNVlO?=
 =?utf-8?B?OUpWbGJ2OFJnSithMXlUNFZiVzlTeFBmYkIwbXZYRVZ4N3RjRE1iWDhXaEVj?=
 =?utf-8?B?eXJMa3d3OTRKUGdYY0UrNmdUQzdzN0tiZzYxWW1yQXN0MUJZNUI2QUdhc1pa?=
 =?utf-8?B?STJySkd2MDhNUndGN3NBa2E0ekVXMGNZV1gybU85LzRtdEZVd0g2clQrR01O?=
 =?utf-8?B?UW5IWVZaT1VJM2J5SVJZbEc4QW5RWXNqbUg1MmpGNG56R3d2ZmdjZ1J6OVJu?=
 =?utf-8?Q?dnOAx5pqgPg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8679.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGFSNnBvcDBQNzNMYTU5Q1hBcUVTeVFiRHpKLzdNaWpXRndseVhwV01welI1?=
 =?utf-8?B?R1kwZXhMRGY0UmZuUVFHMTE1V2l0cWh5SUt2TjlSUW1hZ243QTlDaVJ0TXli?=
 =?utf-8?B?ZG5kczRpd0dvTFFzK1d6MGJxZHFnRzdUcFRiTGVMbG1jQW1laGlDWjJHc2NH?=
 =?utf-8?B?Rlg0NDVsZ1lXSXk4WGtHcUVJbFpPaTY0d3Jud2J1aHM2bGJSelRGS3plSnRa?=
 =?utf-8?B?WGRRbElNdXVWcWlaeWNzTnRGSVlrWnlUZVR5eTNxZGtabFBEK1FPZFNSV0xm?=
 =?utf-8?B?VjlZMEVuSWxyOXpEL3hFOE93WHdPZG9SVVRkY2l2SmxUKzBjZ1d3SEZndHNB?=
 =?utf-8?B?VHk4R1FSUmdaK0VIa01EVmI3Nk83UGM0MzdzQVUwY2tSb1FtaUl3c2MyV2p5?=
 =?utf-8?B?V1lJMDc1K0dub2xuNHB1RnE0Mi9VdFhreVRkUEJXa21DdXZ0QWlialNHY09n?=
 =?utf-8?B?ZDluV1N5MTU0SzRIaFl1SzVISVM0YlhPWHpQRllDa2ZpT2N0QTFQY0hpaU9s?=
 =?utf-8?B?dnhGRkt1SHFFQmhjK1NHWG1YOERNRXVLSW1CckZHdStJMmlRck1JVWcybmlY?=
 =?utf-8?B?TXJnOEZlR1I3bTFGM3NxZ3JIcHpBM1pYSEJyU2lMckpxdmpyOWZPeGs5UVds?=
 =?utf-8?B?c2l6cE42dXk5R0c3Z0RDY0xmT0ozOEx5QytrdUlubzR1eWQ2WjZyLzVucm9E?=
 =?utf-8?B?TTRuM0tvaHBJNkdZdFlvRGl3aUVWdURTZHRIN1N0cnB2Z0Y1aVM4T1N5L3RO?=
 =?utf-8?B?UE9GWEwxM0JqamdBN1NyZSttWlVwYUVGWkg2c01ZNFRmcFc4VlA0dzZQdTQ3?=
 =?utf-8?B?ZUNjMjhxdzBEQThCZ3ByVXVNOFFubmV1RXliNlVtRk03MEovU3h2anRjTFpo?=
 =?utf-8?B?RWZpZmF6cWxXV1VNTkJmY3I4TlgzbWRkR1RGR1dWZ3JqQ1RiUUJ3MW9vOG9l?=
 =?utf-8?B?T2xacis5SUkwd2FIUVdmY3ZKc2xJT3lWUkxDalhJdUtFOS9KS2hQSFp3NVZo?=
 =?utf-8?B?ZFJyRVg1bnVydHJXazlQZ3c2Q3ErMHpRNG5QaG1MUlNGVGYyeHB4Tk5CQXZZ?=
 =?utf-8?B?RU5iQ0ZyMjhPSjA3S1haV2RDOVFtblg4bmx4VUxaVEhqZEUvVHRyaFV6UFBX?=
 =?utf-8?B?RVI3NXdoNXQvczFOLzMzUGdhcm5aMG0rM1RtK3RjK0NXV1ZXTVRhM2lwb1RZ?=
 =?utf-8?B?cTZ4NWQ5R1FwTkZQZnVJaHhlaUVmSkpJV2pBVHdDdy8zVktpOG5rcjNqZ05C?=
 =?utf-8?B?MUNsYWs0c0xpUTJsY3JMWGpoUmhZMi9jazBVTTVFS1JrWGZDaUpjL3BBOWF5?=
 =?utf-8?B?RjRnSHc4VzVQMkNOc21kczJpMUh1SFhuaHNXZHpvcHZPL1lhbXJTOUJzdUtW?=
 =?utf-8?B?RGIyU1UxY2FybzEzZWZYdkQ3aTdJNkxEUmVWMmNzRnpBa3RCT0Q4bXhjUnBC?=
 =?utf-8?B?cHZ1VWVqS1RWVmoxOUJrbUZaTUUvMlh6NXFHV3JiWXhaKzJOalZFRmFma0JX?=
 =?utf-8?B?MDdGNjQvWXhxVVpsK3c1RCtJa01nRmtraXFJZStKNHJMWjlSU2RtVHdJa3lU?=
 =?utf-8?B?MTZYRklaZ21oK3luLzVkMFVSL3JFeDdKbStMZUVrdmRVNHJHdU5XQ0ZyTVNH?=
 =?utf-8?B?cW5ZSFlrWklOd0VOM1FnejVwZlQxT0ZmcDNUUDhQWklxcjdRYnNSRjF4QW4x?=
 =?utf-8?B?QWJSTnFKUzVPcHcxYU1kSGhhZDFiWmkwZFlJVVI4V0lUQit2UlFORGFUamlV?=
 =?utf-8?B?Rm83cnN1dTR6cmlzMDhzalNla296Y29HZXZ0TFo1QS9ja0Y3WTR3UTVESVlI?=
 =?utf-8?B?Uy9MRjdmMVRxTmNjVmNoeTBtYWNmVTZWdis3QlRHTW1ub1MyS1o0U0d6T3VZ?=
 =?utf-8?B?dGhBTHhtdE9Qa2t6dVB3Wml5bmVJZFQxZFR1YTRQdm9oeTFxVFJuZE1MZTRK?=
 =?utf-8?B?SE5aUFZPRy9SSGpUczVsY2NuKytHNDU2VGJySzN1b0lCaHVrZU45T0RtVDVI?=
 =?utf-8?B?ZHRDYTRIUjhCSVFPUW5LYkQ3TEIyT3E4cHhHNmR6L21yTFVXQ3AvTm5PTWVp?=
 =?utf-8?B?S1BZL2NraTdrZXdQNmtHU3VualYwa1NOZG9zRC9tNmhLSUtkeDVONURNek1M?=
 =?utf-8?B?QWhXdWt5Nys2UkZTSHMrZUJPYU5yaHl2YUpiOGRzV0puaExSYVNqTkVERjhE?=
 =?utf-8?B?eGZUMHV1RjBkK25RT1ZNRUxWY1hnMnNxcjlVNUhvNXRuemg2K3FSN2phYyto?=
 =?utf-8?B?a2Evcnl1dWZzejRwQ0diKytkZjR3PT0=?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cfec81-ee49-455d-08ec-08ddcf9c7d45
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8679.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 19:08:38.2526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbAm355ASjFjxF+vJq/gieKTV9jF2m4+4wJVviobKd9slrP7CS5dRcHduQbzMBmfIL6NW60Tes/nsO/dmPdwAaV384RMVRq8LOVB1BcEeMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6329
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 19:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118799

Hi Praveen,

On 7/30/25 14:31, Praveen Kumar wrote:
> [You don't often get email from praveen.kumar@windriver.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>
> This backports commit bb896f6b6f92 ("php: sort PACKAGECONFIG options"),
> which was missing in 8.4.5 and helps in reducing unnecessary diffs in
> future upgrades.

This isn't missing anything. Cleanups like this are not
supposed to be backported.

With kind regards,

Jeroen



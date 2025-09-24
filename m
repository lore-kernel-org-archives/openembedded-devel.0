Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6D3CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:27:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.89])
 by mx.groups.io with SMTP id smtpd.web10.24514.1758745665461921460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@victronenergy.com header.s=selector2 header.b=Aqhxb4G/;
 spf=pass (domain: victronenergy.com, ip: 52.101.70.89, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrsJWK236KdGx4gkcDr3II0hswIWNowhSxg3bLQ7cAfuknZOF3vXbKr6M3RYkM009U6pirLh3NEc7voCQAPEsYLE0ErlZOd4wg03ZI85tiDYPYQcCsnFX7V8s+K7SITm1zlF70q5zegp53hcaSpHWPpBCBLebEm5siy6lWlgMj5oYv857TbhdppMxaGbHR+e77gxUPgvU6e5mqLPQqsEAfhp4/bl9UHgCyFCBKgRp7u/EvemvmuqDyI4EPjsxWsHa14toTvgb9fwKAEiYiBFIilmTeY7ACWveqEgj7h/8OoPKngEke/sK2qXP3CRh357Z085nQlmAuAU0eomWpz/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aMhJn9H28EZpTnYaVle/9a3cpUl1yEQZcVBSueiWgs=;
 b=DVpGjoTJ5MCWrChakEt8dXLlBM2deARmEmOtuPFglZEGIq8XgH5uFhZsGl2wBLY1N0ck9g2Ji4o1u79f0xh6oDLEQsD7NHtJDpfTG6T44UzPHU5xGNWS+JjGbBikoJIN5l0K/K6MP7xPQh/ZJmCMKi2s/nQB0JnvC/vn5k+ZL8BfXDDZxwUF1vgO1EvU52OP6cgSVHf54fKT4i1qtLt8A1YbCTWVfN+vPXG7robKVXuqAs9xUkARrHgWr0wTlv6gG8CJ1yEznRt1V1Ku0Lxke6EVxN+UYc9aZZxHfSYuoRU+hr1VKS+QvxlDegE+EYjp0K8kSyW4jmMjVp67Falhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aMhJn9H28EZpTnYaVle/9a3cpUl1yEQZcVBSueiWgs=;
 b=Aqhxb4G/VHKrPZS6Y3hml8hhw/PQN+2Fjmf01EasIxIMu5T22OWMqEwSfC2Do37HaHJCwJBwVmQDvAPAy4lFJvbt2ChJIgAs0kdefvJOvuvbg4aoErqt7fsssxN6poFb0rtDWgjMF1nItgLR6AWSubh7nqhOvptBluu11pPZ9I4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB7817.eurprd07.prod.outlook.com (2603:10a6:10:2a9::16)
 by VI1PR07MB6702.eurprd07.prod.outlook.com (2603:10a6:800:188::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 20:27:39 +0000
Received: from DB9PR07MB7817.eurprd07.prod.outlook.com
 ([fe80::8ea4:2070:e379:fb78]) by DB9PR07MB7817.eurprd07.prod.outlook.com
 ([fe80::8ea4:2070:e379:fb78%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:27:39 +0000
Message-ID: <8ea6f816-1616-407f-ae9e-259e4e4cfe41@victronenergy.com>
Date: Wed, 24 Sep 2025 22:27:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [walnascar][PATCH] cjson 1.7.18: Fix CVE-2025-57052
To: Gyorgy Sarvari <skandigraun@gmail.com>, jeroen@myspectrum.nl,
 openembedded-devel@lists.openembedded.org
Cc: Shubham Pushpkar <spushpka@cisco.com>, Anuj Mittal <anuj.mittal@intel.com>
References: <20250924194549.1753501-1-jeroen@myspectrum.nl>
 <dca664b0-a6fb-41f7-aba5-5cadc39905a4@gmail.com>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <dca664b0-a6fb-41f7-aba5-5cadc39905a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To DB9PR07MB7817.eurprd07.prod.outlook.com
 (2603:10a6:10:2a9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB7817:EE_|VI1PR07MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ad5e50-7355-46e3-2193-08ddfba8ce74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OS8xUXB5ZHlEeEExOThMNkt1dGIvU3UxcUt3QkxMeDlSL1Q5N013TVJoTllH?=
 =?utf-8?B?YjQ5cHB6SjZmT1NreFFiL1RUQ0RXNVd0VDBFTktCWnpUM2YvVmQ0TUpnY0gw?=
 =?utf-8?B?MVRkLzQzcVVoYUwrV0duaGJQWk9lYkd3dkZJRE9KdDdibEhoSTU3aU9kalpz?=
 =?utf-8?B?YlROVzdGUlJVRHl6dThJQzZ5d3dGQkhicjRNQnRZbVBPS0NjajJqeTFrcVZP?=
 =?utf-8?B?ZndHclN1K0FsOEQwU2IrdzNDSEVLQjhtTE5oQk1XZWRoRmF6eTk0UjJXcVha?=
 =?utf-8?B?V2NmT2Y3YkhHL2Z0RUl1RTR5Mm1uZVJCSkZqTTUybGYxRTB6MERNYzM0aEdQ?=
 =?utf-8?B?NU9PWHVaSXNSb3BIMEZ4RXhWUjMyZXpYdFhDM09EYldQOU5KZ1hLakVmNy9q?=
 =?utf-8?B?V2RIb25pT05PbFZZOTdBYnF1Wk9UR2dhd25ZeHRxTDRVRnlrYzlNSmg5Yit5?=
 =?utf-8?B?T1RXU2g1UlIzNzlVM1FWOHpJbCtwcVh4ZHhweGRNVEdRTEVEZE1pM1Y4dTJr?=
 =?utf-8?B?NVBhUHU5VHFqU3NTelRlNCtlVGdVaHMrdlFEdkpIbUt4YjBnOUlEaTQxdWpP?=
 =?utf-8?B?MU9Ld1JVTWNhK1M2N2JRS0xkZGZrSUVKK25pMkZZUGZiRlNncVQvZi96Nk9S?=
 =?utf-8?B?OHhjNGZMc041cVBxalBKOWREOFo0a0VqcTl4bWs2eUhwb2tVVW1GSVRSK2VU?=
 =?utf-8?B?WUh5Y25BMGY1dG0zZC9oVnFhSHJpdEd2Z1lWYUV1R1BSK3k1Uk1TNDNUSHM1?=
 =?utf-8?B?cVlvTm5BWERyOWRObndJY3haSUxsaXJUTk5YRWFnNTUvUVBHaWFrV25haDJt?=
 =?utf-8?B?Y2t5R0M1azBrYVZnVnFKVkZFb2g1ZTI3MjlZR0I2Y1BYNTB1VXh5eEs1OS9V?=
 =?utf-8?B?citSZnd1a0ZWaWI3TnIycFVRVDFpZjM1ZW1XSCtFZ001SFhhV28wQ3EzRVRk?=
 =?utf-8?B?UnFTckt2MEEwNnVVeVpRYjFjbW5kaHFUVEdmeCs2SElPcnQwL3IwWndsaHlo?=
 =?utf-8?B?RmtaVVhPSW1kQytBU3BQUGdvblpnRHc3dnFYMzZUNjc1UEs4ZDNWV0hVcGlY?=
 =?utf-8?B?Y2FEVTAyS2NPUzFzTFpXNWk4UHZucEd3Wit5Qk1MM3B3b0praGsyenNRRDZW?=
 =?utf-8?B?L2hwbVBhT0RvcUlMSVBNMmVRQ00zQ0hmOUNGWmVhU3cvOGVGUGtRWUFiZi92?=
 =?utf-8?B?UjVlc1VXY2VISEY0VFpVQnpjTTIxQ0ROSXlNZXdRVjRMUzdydjNmRk0vdVJh?=
 =?utf-8?B?Qll1ZzBVMTNPOENRYm1Obk1zVERMSC9BVjZpUHBPZmRKVFJ0QmF0MGNVVGJz?=
 =?utf-8?B?TzdNNjlWaG9yb2ZDZXphc1A5aytXSFpJU3AvcWJoc1NlcWh6bTZMemdYemhV?=
 =?utf-8?B?bmZyeDgvQUEwMllVYXI3Z3dUMGkwQnZZYkZIczRkQW9TM0N2OE5Lbllhek9H?=
 =?utf-8?B?OXZGdHZCM2dJRUUrRjNLaEVxd0M0Vnd4OEEwZlJaMU9xTDllNGlrRjZBbS9S?=
 =?utf-8?B?ejByZmFwYTZnaHFxL3d3L3VUREYwL0RqRjB6VzhXZTRmSExYQU13aEZrN3hD?=
 =?utf-8?B?dXJGcENmU2NhUk1ZVTRlaXZYR1VXMDdEaU1hb0FTS3p6ZXZWMVdsTkowUFhw?=
 =?utf-8?B?Wk12d0dHNXBzdUpmckNCMDRLTVFSVU8rSU03ZVVmblRaOEpTQnNhTWNSYlIy?=
 =?utf-8?B?MkNzTlVoVXU0SnRZUWVDYTkwUVB5b1VqSHVGbVp0L0t3bi94TzZRaUpSdTRN?=
 =?utf-8?B?LzU5SWUvZ2xJS2l1L2cvZ01VTDZxcXZaU1JVVFlkaUpRcnErY3hJaUkrMGwv?=
 =?utf-8?B?TVdvYXNKa212MFdnNTAwQ3Q3VXBnblUwelVuZVpXNjJQTS9QZ2hjbVZXRUhK?=
 =?utf-8?B?elF3MnpTT0c0czRCQVFITlh5VWd3TVV6dmZCM2dXT2d5Ync9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB7817.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWhHaEVZNWF2NTQ4WUphUCs4K1I3NXNjY0NJNlQ0dm1qZUpJdDJyWGptTzZU?=
 =?utf-8?B?dVRvVUxEZ212WTg4YmxvZTloS3dhTkFMMUIvc2dURU1jbDJCaWc5WFUvR0Zp?=
 =?utf-8?B?dnlrOGRwVlIyR3pXc2hEK216SjVReUh6ZkNzL21xN0k3d005d01sMTUxZXBo?=
 =?utf-8?B?WWZMaE1jSFNoS3NOVVBNYTFFVUhlYU1BbEhpdUhmcTQrRThUR2VsS1RuWmhZ?=
 =?utf-8?B?SWtXdyt3ci9MY1FqcTFqdnJ2eWJ1dnFHdTRaZXk2aFpZNkpicmd6M0lrOVZ1?=
 =?utf-8?B?dWlZRHZDc3dKUnB2bThwMXEybExUOUtIQy8xR1hRL1lXTzZQSmlJTDQzcm00?=
 =?utf-8?B?WFJjNnFkazd2WnpvdkpJdG0yS09ScWs0QUozaSsvTkN1VFRuRTBTYjBidlpr?=
 =?utf-8?B?YzV6YUd0WXFkOHBMN2NXTzIrRjUvS3hFQ2JqK1VwSzdWZFNDRkkxNjcrTmVm?=
 =?utf-8?B?Y1Mwb1NxUTNIaHRMRGJzUjhYYkp1TS9QZENKeHFNWWlBdFB4dEFQY1hhdjlJ?=
 =?utf-8?B?dUZaVThVWC9UTzc0MVdUWFZvVTQwaStMeVFvWjllNUdmZjZwSEFTTG1Na1NJ?=
 =?utf-8?B?Y1BHY1VTcW1xL3R4bERacnFNeFVUaXMwM3hnKzVVb0xZczIrb3RnNTJjeTNL?=
 =?utf-8?B?UjJPbnFNVkhPWHVLekMxWEpaa2YxNU1uM3JINHFWK04yZE9RNjdZZS9XbG92?=
 =?utf-8?B?SGFQb2RQbzl5Q1pvQmpUalJ2YUpheXRMSzBpQjlybmVNRjFKMTlGRVd2R3Vs?=
 =?utf-8?B?eFBRaldxYmtkZUUrWVdNdFpWMUprZENRdEZYUGIwK1NmZE9pU3RibzQ1aldG?=
 =?utf-8?B?UkQ5M0dpMDA4cDA4b0d6RFYzVTJYbDRONFRFRHBzMFlmclpCTWJmOEg2N2Jr?=
 =?utf-8?B?NkhzazhpM1FmVUdLWjYza1p4bzZiaEprdkhTOGhVeS9aeTUvYUZBSEh0WDlU?=
 =?utf-8?B?K1dlSkthRHJHMzJIOWpGWVkrMjAyMVBGbTRzWTVVUGdHbVk3SndhMlBoRGhS?=
 =?utf-8?B?bi94d2VtWWpCZTFMdnpuUXVabmJlMkZxTDViQTY4SDdsNVN1SCt6TGZiMUo4?=
 =?utf-8?B?dmdoYmpBMmdXMGlKdnlybW5IRHlocUJzU1B2OTE0b1BnRHJtK0Ewa29zcm9U?=
 =?utf-8?B?Z1JnS1NvZVdPMmJBSERReHI5OFUzWDBHRk9kaTdkanFkdnRyZmVaTW9DNi9Q?=
 =?utf-8?B?YU9MOHMvOU92Z1hSVnl4NVBEZm5vMzNkMzBQV2hrNktTRW1LKzBBbGhVNWZk?=
 =?utf-8?B?QXBuSkJCd2dkekYxeVlmY0pkVTJFdzVSanpLNDkyL0Q3djRsS0haYVpSSUpt?=
 =?utf-8?B?RXQ5TzRFQzlsY1FrNkxITTc1dVF2a21wNElNMWw1elJiTGNKdnVzWGFPVmN0?=
 =?utf-8?B?cTA4NjBYTFg3S2hPSzVKc3lTeDNGVElrcmRsUE1OdkhmblFsbVJwa044OExQ?=
 =?utf-8?B?NlRjU2JPRGtQUUMxbjc2Q1d4TW1LTVdiYnV5cWZkTTJuZytCdmFNOS9UM0xR?=
 =?utf-8?B?NnNNazRhak5TQm00dWQwTGhhZUw4MFUxRG1xWGpkcEI4OC9kMHhabE16TFRL?=
 =?utf-8?B?elpHL2lHZDZ6OWx4NnJwelRRL2RaYlBFSGhTUVNiTnVWTHFxWldtaFB6N2Z1?=
 =?utf-8?B?MWN1QWNxa3VNaDlCTUZQTEVBK0JjMEt2MUF4MnRBd2xMRmNaTHc0dFFobi9W?=
 =?utf-8?B?b2hveXdOdHNIdCtqUFQ4MlpYeVk1MVdWYmd0b0VjVFFLUUxEU2g5cnM4cm5i?=
 =?utf-8?B?T2NIMDE2NVZKTy8ySHVRUUhHclprOGNyTllQc1NtcFFIamZmR2lXTElyZFVk?=
 =?utf-8?B?b3IwYkJTc1ZKOHhibjF5WFlLNjlHVWZHU2xiQ1lZOC9XNGtVUGV4S29oYlcz?=
 =?utf-8?B?WkV5akdvTDF2MFJUVFBDZW9HeHV2b0RXRnhhaU4vNktyNEluaVEvY1lnQ2sv?=
 =?utf-8?B?RERIZTNGUnhaVE41Rzc0dEwzSTNXRGcxUGxpSUZFTjhOZU03VUxIVmM0NVFJ?=
 =?utf-8?B?V0orYmdUdVRFelpoWWtxS2xQY2NtV0J6N2ZHRGR0clNBSy9wb3dOM0J5NzFW?=
 =?utf-8?B?MS8rVVQ1UGk3WHMwSnlzL2MzOU9IVzZ6WWpzNXAyaWdzaVg1ZWNJZ2hBdWpG?=
 =?utf-8?B?MlNlTEVnSDRpMGFvNVVvL0hCbUJuVGR3cjQ4YnlHaVp6Wjl3bHFaVmtmZlpK?=
 =?utf-8?B?b0dlbXhqbnFrbU5QSXNXNXBBMmxjSTVtQ0lxeG1kTUJEKzdrVEZZSVFxaExw?=
 =?utf-8?B?b3F3QnJ5WXcvbGFLclBKd0dBUHBBPT0=?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ad5e50-7355-46e3-2193-08ddfba8ce74
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB7817.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:27:39.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP96jCjiwdg/vXw0oYvCP3qbzoLruU7CQZMfpIubdq+Zp8sT21U2Z8q8yjonTG4OV1UapGydefN2suIeBLwIjN8aoy927g/XJz6gajoFxOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6702
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119843

Good, as long as it gets fixed.
I marked the patch as rejected, since there is no "duplicate" option.

Regards, Jeroen

On 9/24/25 22:06, Gyorgy Sarvari wrote:
> [You don't often get email from skandigraun@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> This has been submitted for walnascar just a few days ago:
> https://lists.openembedded.org/g/openembedded-devel/message/119628
>
> On 9/24/25 21:45, Jeroen Hofstee via lists.openembedded.org wrote:


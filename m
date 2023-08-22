Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA25EE49A5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 07:12:46 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.130])
 by mx.groups.io with SMTP id smtpd.web11.3082.1692688359623377163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 00:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mysnt.onmicrosoft.com header.s=selector2-mysnt-onmicrosoft-com header.b=DL/R8NuF;
 spf=pass (domain: kontron.de, ip: 40.107.105.130, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRWLf1c7MBT9PZn7gY+/MboNLAj0RN3SIkn7FJfWmyj3RBoKPzeXg8SJCMiQb+VBcv1JcrEwVC0DudQzkoooKfXLvXVKA4vY1miSqg18IpS0pSJM87PxcQwzMMiHZpyHcn+lEdktTn+ouULzmorGUKaQTUUY0djC8mO0+qDrYGey1zDN8Drt9WkXxvS9jkix8RNHBKRpW2eeYlt6heHApxdZCOUd6UnYzJfq7u3rHs1tLHERc5Az5OF7GH9SLz4iPLcL6UAbezo40jZa5px5ZA7cf940wIQAwGzHQyor0b72slrJ2Y8BZNKB+/n4EBZRRumISaLS1fMozHNEEQkJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnJ1pbUvxDL3HvNWctZkKAv2yFSEJZLAn8DnE36WhS8=;
 b=ieWDOK+HmpNDxGP2CbwqZ2peglY5F94A9qu5Uv7b2QaFVViaInq3fcfu08xJVS1STs5TPwuf1hZEB1s3Xq//5B8QVszUSLKEQEH+hPwfRqoVCeXm7Dz3CiDwKCKLXffdPevT5LwEy+2W8lYGIpGH6AQVV+lVtsUiHm2QJTjSXLr1dQxZdz50D49JYQOli6iHzOseObDcvtaoTxCgBN4EhEcMeBWIjfBDmeQRAGC2XneOJVQ3bg+YcCD24LLalNhBxIJ/DVNPn2OyHeuoix5LOG3D3qNqYoe4gXHcH/0izNoiHfHW5TGLQ/vjiGrBYKaGsxxhqZvL3mWXOBWSwyMo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnJ1pbUvxDL3HvNWctZkKAv2yFSEJZLAn8DnE36WhS8=;
 b=DL/R8NuFy4nwZULV3y6abqSTiXwhDdR1jV1bza2iK+YuRDkdsB0Dz6nKPhkvH+X1iplw/CskIFvvFz+abOQHVJAeQiFWakP13x0YKcKxNZk22O7on7KWnFUzbMu6NWa1KFwaPSoZuMp8Njp6ethECBCaEd/cmDjYa1s23QE/cP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAXPR10MB5326.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 07:12:35 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 07:12:35 +0000
Message-ID: <b5fdfa09-af2c-46dc-98ea-d50a134bf05b@kontron.de>
Date: Tue, 22 Aug 2023 09:12:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-python][PATCH v2] python3-can: Update runtime dependencies
To: Khem Raj <raj.khem@gmail.com>
References: <20230817092034.26410-1-frieder@fris.de>
Content-Language: en-US, de-DE
Cc: openembedded-devel@lists.openembedded.org,
 Frieder Schrempf <frieder@fris.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230817092034.26410-1-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0296.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAXPR10MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe484d3-5571-48d8-779b-08dba2df28cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9V8hePOUkhzSEf0wd88vTdIwqw4vZrohFfYkVA6lpr2XFEpJbbjy71VeR2MKHIMr7vAOny3LLITTTAqL6wAZKVWbbZFTcAtVg4Qn4Q1CP7JQ4s4gari0ywih4weZN8QtVfgBmm+2XxPoI4FbLb0ttAFmkoptZsrglTaokuk3XAdOMySk1pUItJJTZGo6IRHkgKJ8n/hdFrG9JQ5yN0iCPk9ZjzlkgNytMUS2l4OcvNfdi4yHJBVu10dmqfFy2Bkbd4qlg82hX6mBmUCGgFrBV8sh/xiLwZ2VxS0AbkZbXI4Nm7E4YuLE5DTplNcXOzsXgaqXkLiwInJtOSZedv2wG9khDkF2jnERAblkLn0BmbwcJDQsDKROdI575uUfDyQgcOgXyIgqwrEiv0SN31OQ1ZAIomaIINLYoOe/gph0dv6FoUQibaZ+rDHZx7rlMUOHSVa5myKvP/LT6PpcV1IybNMBaWvRwK+qXcdNi9DpujDtXysK4JdT9nxu1JF597dkjirI0uh/y8gRV2QOQgs3dQU85kV5qnKfrWwfovpqDIk7m62KiBGBRwTiPk8luwATs8AL2EzuKgck1lSZsfAGDpQ2bumlvSYZ3thXEdLaGQVwdFHx1t2RmaPdewanSlg3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(186009)(1800799009)(451199024)(86362001)(31696002)(36756003)(31686004)(316002)(66556008)(66476007)(6916009)(966005)(41300700001)(38100700002)(478600001)(66946007)(6486002)(6506007)(6666004)(6512007)(53546011)(26005)(4326008)(2906002)(83380400001)(66899024)(4744005)(8676002)(2616005)(15650500001)(44832011)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDFwLzVkNnZwdjRVQlNqeWxFOUxVZklBS3cyYWhIeGFkaXV2VVJEV0t1SURR?=
 =?utf-8?B?QW1XV1UwbnJyUzZUNU9RTjh5ODA5SHpiSmthYTUvK1FJbkNiNlBQRk80em5E?=
 =?utf-8?B?VWVWWk82MU9zbk0xRi9TdjVSTHFXL0ZaM3hReGIxYkw2MFN5cVZzQWtwRmFR?=
 =?utf-8?B?OUR4TFBxQnpyVUJxNEhuWTh2bUZVQm5aRmd6cjdHdWF5dEVtVmxZbk84V0p0?=
 =?utf-8?B?cUdDOWJGVE9TUGZRd1BGSWhBMXZQNkFFYWNwckIyOTFYaENySitENSt3Nlkr?=
 =?utf-8?B?QndBN0tsUlArdzkvUER6TTZGa2x1OXozWDhBVlk5Q1NLL0JDbmk0bFhzOTlL?=
 =?utf-8?B?QksrUitFcGdlVnB5Y25VMWJKdmVkSS95MXJhOS9WUGU5RXliYXhCaUk2UHlh?=
 =?utf-8?B?SzhBYU04MHFEbXNtRzlpMElpQWJjTzRlQWRMSER1SzEwaFFLc0J6cnZ6SXdp?=
 =?utf-8?B?aytORDUvZnlRVitiUHBNaEVZMkcwSjJ6OGRFUlNGWUxiK0p3S2p3SlVEdE05?=
 =?utf-8?B?SjZFWjdHWjBQUlQwS2NNZjJ3cjJqU09LcEdicW0xdTFtRTl1ZU03TjV2OXJL?=
 =?utf-8?B?TkVlbFpETzJyaE14eUM0MFh5SFdoV293UE9pTHh0M29jY2ZnanhjaC9ZVlNS?=
 =?utf-8?B?QWw0RWc5WVJ3eXB4VkR5b0xjR0Z3QW5vUDdPZFhmYzlhVXZqaW4xcXlZZkRW?=
 =?utf-8?B?eXBCK2pTMlU4UVdXMWlVUjUwd0dpa1M5V1Nsa3ZnL1gwTTI1ckhmMXBJckds?=
 =?utf-8?B?WWJZSVNKSUVuLzVqYjFGNW9WdkpyL1ZSS25IV2kvOWNtekVUN3VoL1orT0Nj?=
 =?utf-8?B?Z2VzRkpzUS9BOGhFd01zOWIrN0tkU2pjODFqVTBCZ2kyelNhdVNHeXJ6Uk9R?=
 =?utf-8?B?aVExV1EreXpxcnBCb3FOaGZRcXphWFhudkFuNEI3bU5RTUt4WWNFZ25JU0JR?=
 =?utf-8?B?aCtreXdiMmR3NnQ3QVIrNUpoT3RXbFNlTnl1bmEwR1huRmJKeGJpQzBjZWhx?=
 =?utf-8?B?N3RvMkhmV01vRGdudUxPTzZ0bTM4K0o1eUZVQjFBaDZPM2U3T2JUU00rSkxU?=
 =?utf-8?B?OUU0MW5MNm1EOEdwbDhPTDNneUFCOHRHSGhYUzJML2VvL3pqUzRHVmI1c0w0?=
 =?utf-8?B?Z1ducWtEY2Z4N1dJZnFoSU9qWnk1WnZyRkg2VGQ5cDFoQ3lkT1hWRWgzTEo1?=
 =?utf-8?B?V3hqQmNIN0ZESFZyUzZ6YTlqaXBkTXJ1bDV0RU5vOEEvREczalpNU21pbTFU?=
 =?utf-8?B?MGxuSm1FY0JzVkZ0Z2Z1alFsU1Fvcmk5K0hVdWxqRnJrR1NwQnNVWS9OUFJV?=
 =?utf-8?B?TUJIbks3MUQ4cTNheUpKRXloZldkM3hnT2pqNlFYMUc5RXp3NVkrMEVTSDBx?=
 =?utf-8?B?ZW1TeXFqQ000Z3JJZjAyazQ3UkcvbkpYQ29FRnBNUUc4MGFnMkI1eDVYcjRs?=
 =?utf-8?B?Um04YjdoZ3psdWZXalJ5ZllQK0REYUI2WXlocERBZmIybXVlTFYwL3Y3MTQ0?=
 =?utf-8?B?ZHVTKzlBcVBKOVRvc3R1b1cwblVzSGFiRnZ5bzJzTzU3Z1ZWdWVUTk84Sm1H?=
 =?utf-8?B?VkxmY2JLVVZ2NzdYZ2tPTVJYMk1uVElVOVFDek1tdkJpZUVyajdHQ3ZFSEMz?=
 =?utf-8?B?SHNJOG9BaGdUSWQ2MFVKUDlVZTlwdW9EbWp0T0hDTXBLUmVVK1hLUUwwYktW?=
 =?utf-8?B?ZHVuTzFyOEw5bEJIZVVzSVZEeElPU29rYW55L0ZONXQ4ZlU5cktVTVEvQjdr?=
 =?utf-8?B?WFhhWUlWRnFjSzV0ekJ1UTFnUjdnV1BiYzFBTGRLVXVTaDdxK0dMcnZNMXl0?=
 =?utf-8?B?WVUyMVlNbDVYZHgveDlKaGRUMzhndzRWajlsbDhDOXNldVNMTXZMV0FZRkhX?=
 =?utf-8?B?V2pOV0N2by9TdUdaVHJxZmRTN2xZTEVoaCtVRzQrTkNobC9NMWJ1UHllbFlX?=
 =?utf-8?B?SEZkM0hjZVVEU0ZPMG1jeXV0eHQxTkxmZXRvUlZ4dERlZ29OT1lOeDVxZ0VC?=
 =?utf-8?B?K1ZyckYvQ0NBcU9kVFVEMlRNRThTSklzTU9OZFQxWERyRW5uRWJOMEtYV2d5?=
 =?utf-8?B?UnNxUTZKdlYweDFycW9UTUZHTTZSUmtNR0RFNE1xbjFkamdnL3BhY21xMGFV?=
 =?utf-8?B?V05XdWNIOFF0dkdIRXRqR20zT1k2eW92VkliaVhoNi80bWUrM2NXelp3NjZB?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe484d3-5571-48d8-779b-08dba2df28cd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 07:12:35.1075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd1+Gl6COPsjnYPp7Xh3I9hjkxFIo9UIjY6BM6wX18IhMdCySCRDg1K9+TI1blfXoOf2WG7oM0VI2YOxap2n+pn35pknVfa1CfzG6CGyd8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5326
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 07:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104517

Hi Khem,

On 17.08.23 11:20, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> According to the setup.py of v4.2.2 [1] the following runtime
> dependencies are currently missing. Add them.
> 
> * packaging
> * setuptools
> 
> Also the aenum dependency was droppen in v4.0.0 [2], so let's
> remove it.
> 
> [1] https://github.com/hardbyte/python-can/blob/4.2.2/setup.py
> [2] https://github.com/hardbyte/python-can/commit/13625ea2cc18e3283b8111bec7e139ed9b6c7f48
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes in v2:
> * Drop unused aenum dependency
> * Update subject and commit message
> ---

I've sent this v2 a few minutes after the v1, but I see v1 was applied
on master-next. It's not a big deal but I still want to ask if there is
anything I can improve to avoid this in the future?

Thanks
Frieder


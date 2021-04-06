Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.71])
 by mx.groups.io with SMTP id smtpd.web10.14.1617753574502487485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 16:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a4U9yaA6;
 spf=pass (domain: windriver.com, ip: 40.107.223.71, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBJQNKO7TICHUuon4uy0IqpQ6XbleuojqBA2AkxeTt33ZooaSSwzbhD/bSknzvtOMudb6f5NphkxoRsFS4EY1DaWh/bKL+ibL9dl0tUHicEkRC/B2LkeIQGUOmv8PPwu8cRWogG8yZ+uyGO+tlbhetkarmVFda4ka/pWSN6E7ZJgkG/QZv+T6jkYGS3n+quj/Iew7nXcGHlAEBBOz861BOOjmt2jbKtLLklAYO5NDieedbz2jwpzHWyQqYem0ufSmsv7yhL/bk7PGQKpzWgm3UgPosV7tVx0JVsDOn2vU5WqQTt7fIY+o3Y+G5t86tCGI/9jZ8bmHf59i8qzDt6Jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5VUfroKUQy3Wge5y8P8ZsZwiWTsHU7rfSiAmljkiLQ=;
 b=HAT3B+k5EQ2HjkqD809KQVpIl91Osqr2zG3B7bm9DdsJXwt4VWZDolN20ptjbB+FdMymKnDsYlhHSOzMlecatYMsUZhdoiGWlyOBhPO2gXFoSli45CgMgNLatZWuHlciwb281GGcKUNLMSrPT/IlJ0Rqu+IU5BcGi0mBQ2WoUYjAum2//LT6e+7BqdtnkNQ8w5cJr3Zrj8tdsoyCb/mvRlRD8Kg7lL1jURYACVcsRh1I+JKqZceWpyhwPfByUuktgp/yqEDuESk62qX5Ckbxrk12HwdIacDbBF828ISgyI/3t1dAwRlLHVPzxm8akDg8T6ij9tJ/OIUY7gK/sPzqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5VUfroKUQy3Wge5y8P8ZsZwiWTsHU7rfSiAmljkiLQ=;
 b=a4U9yaA6CpvlL1gL2jb90j7BqZ9OI/rhqxJeZTvMy4rDwsli+87y7Kt5CiJvW1PVyCoCMYnUdk7Jlhho1zbSBKpdLJ8KG+k0FFN/DzrhoTn4TWjZlFgnIIM9z4/LTsNiIFxDDacpksxRRhmWLFLoLN6Oe0Lbv9nnRUo9gMzYSfc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB0027.namprd11.prod.outlook.com (2603:10b6:4:6b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 23:59:32 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 23:59:32 +0000
Subject: Re: [oe] [PATCH] doxygen: Upgrade 1.8.20 -> 1.9.1
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <167369E961644282.7917@lists.openembedded.org>
Message-ID: <1377fa19-183d-293c-d3c8-9c9b11782c12@windriver.com>
Date: Tue, 6 Apr 2021 19:59:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <167369E961644282.7917@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR11CA0098.namprd11.prod.outlook.com (2603:10b6:a03:f4::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29 via Frontend Transport; Tue, 6 Apr 2021 23:59:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3140dbcb-119a-4064-3192-08d8f95805a0
X-MS-TrafficTypeDiagnostic: DM5PR11MB0027:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB00276EC5DE3C612246C41B22F8769@DM5PR11MB0027.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OZCSlv4iEtAwROT2KsW7jL0SQmtdH+5lynUnieEpsanHuEa8W8QyCH01/h6HAX9p7zj/VO+jq5MGv13srYNjqutZQPYBvqB/Hh9SDMh5hIF6oZxsWqJOPT+KOaSxD6VsRL7PHDJtiujp1vXjMVbUMsSRwZosUSZqbjkQdAtkqUFQcna4X8B9NJYBlar64EWH/jrBZec9+HjiRoAvIY9aTTOrDeSeHCIjoT7xqB1WXUfnTGvTCTEDyx0337csO+quLyxrAHJD+chYywtjUAac8RmABfcWK+xIzSVUTcFzHTYQ/3O2lC71Hl0/oYW5uR1coQQ7efRoBOrBtcX0kvbcZ/oYhHpNOd3T9NiqlxS17wZUXhtdkmpBhvwHuUMevp8J7JQRt6KtNXnNslMJcPOkwsMISkzFy/Tfb+3DmKx54XdMhgfvuolZjc2HATuMyfHMZXffkwzIHh3/rjptPlm/GW5u8TvcpMzVckj1n2nWKdrpbR7wbD3cRt39m1ik2v7i1RMBmsCcNnlEZ+wn+3KZ2GacLjqieE3yYnyJ3qBrGnU4MDmuOSSOvhZ9ua1vI7IE3t2HKVtxWIc90sTxJfAzq2uq2kL8p+/kIgYHTWnj6M6vMeRQfYJGzpoVgMF2qgTviwVxwW/6BaqmizdT+DX0+kNtGXr1TRsGspPKc5drdFYsrXQPqpAwI+rupXEkrPw6NNUDYGmJYToMTUutXl5sbTsQ2AT/3xbk0LH9pO2bv1BWCwXZu7eoZyk9u8WP1rik
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(8936002)(66556008)(956004)(2616005)(31686004)(5660300002)(4744005)(86362001)(478600001)(16576012)(52116002)(38350700001)(26005)(36756003)(38100700001)(16526019)(31696002)(66476007)(8676002)(2906002)(316002)(6916009)(6666004)(66946007)(6486002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NnFXY2lzWm9qS3RzREVDUXp5blhHTXh6MDUyMDBaREJoenpiUkt4ZnpQSDBT?=
 =?utf-8?B?bFpFOWhoanRzMEVjbkdZQjdoZDRkRm50bDhaR0hlSGZDQXlKR1REMHFyeE5z?=
 =?utf-8?B?RCtQS0liS21vNGVKMFVjanA0VlF2U0xsdlgxNTBsbWtzTzdPcklzdXR1VXRD?=
 =?utf-8?B?bjdGaXY4K0FCWmk4aXVsZ2h6Q0V5dkRhTWd3aHpQTXVaZThVSnlGaUZzOXBw?=
 =?utf-8?B?Z3AveWF1SUhBK1RNSUFEUlllMW13alF5Y3lnbnNRQndmQU5GTUdob01UeDQv?=
 =?utf-8?B?RnBVaGtFQWcyTXM1azA2VzUwSVJtcE95QXBrdjJZZ3BJb2QyTnh4T1BtZ1lY?=
 =?utf-8?B?RjZxbVVJUGI4Sm1kcHBtU25aWHVFYVVxUHR1TEVCOUMvcllVWHl2M1ZmQlR1?=
 =?utf-8?B?c3ltaFdXVE91NEppRzcxQktIS3VPVHRiTmc1QjZzODVEVS83S3h4ckNsOWMr?=
 =?utf-8?B?UWQ4NFFoQndSMzN6QTVLVGd2V1ErWjYvMWNOWXZ6d3QzMlpWZlBFWTNvUTdq?=
 =?utf-8?B?UDJnQXgwUFVUalk5OGVrb09zT2tjZ2s2aUtKY214ZjRqUXoyU2FERjF1TUJY?=
 =?utf-8?B?MXQwSDZoOTZGSmx6MVhlU2ptYmpaajRlc0FieC9mWG1sUU5IUFN2UkNKRHJY?=
 =?utf-8?B?Uk1GdVNvQkdENm1QSENMcjR6ZytWVXFlTmdRZEpGTy9LZFNaVWJDWlFkS2g0?=
 =?utf-8?B?WG5wOTJOb2Q4YTBadWg4NHFBckNCemZ4aTdGNU5UT0d2bUIrcWRZOFFhK01Y?=
 =?utf-8?B?RWt5YU1tbHJkdmcyRWdudDU2b1N3cmgxdjdMZTNkZzYvVzNJSWZPUHZCTnc4?=
 =?utf-8?B?NlNmUjQvS2VTMFJXRW9MNERldUdHaFdZZHE2N0ZPbmtINVpGVjdXZE40ME1B?=
 =?utf-8?B?MWwyWWxNVzVrdEVQd01hbWhQUlRYUmpJbll6UE1qaTlRM0tLSzJHN3FQTEpw?=
 =?utf-8?B?dHpHTFlsbERVN3FmTDY2bms0Nmo2YmtGbHcyd291UWdXWmdjV0YzZTM4UzRo?=
 =?utf-8?B?TjVHaWswVUFFN1Y1ODdaZ254M1Fkb28rdGZsTWwrVUVBZnNaVzRLSysvMUhk?=
 =?utf-8?B?bEd5cU1sQXYrWVBXemNmQ0Q5SVRGNENXTW1mamRpcmxoUkVDUUd3NlVMaXVZ?=
 =?utf-8?B?VmZ0U1lwRUUwMkF0ZlVHTWpEUTNqOGxuRUhQTS8vNmZ0WmFsd2JGSk9aMWpv?=
 =?utf-8?B?Rjk1RnZ0NVRHQmdaenpGTmcwbWZkZ0pTbmZ1cGJHa29aRS80RVlBZm5PTVox?=
 =?utf-8?B?ekMzRW5oMFhIOTJ6WnlEUTN2YTdkSUdRa2J4aWJyejQvclpFa2J0OU1KYVdM?=
 =?utf-8?B?RERpRkZHcUxTb25LdDRqN0pUSGJHNUxoSmNHWkxHeWpWSkF3VmFWOXpiS29B?=
 =?utf-8?B?NVpuZHBGOXRLUmNXY29NQmlvVk0vWVFqaE5jT3R6RDArcVVCaUY4Ni9jNTFx?=
 =?utf-8?B?Z3JscTNVQU12UEtDMEZORFF2dWcwcklOSWhjNzREc1pOaG13cGlEUXIvZWFz?=
 =?utf-8?B?ME5BTzdsMnFrOU1YWDQveGhLUngydGFUeWkrYzJubVBCRVpvSG9UTUpZZjg3?=
 =?utf-8?B?bWNRUWxXUVhaeWQ4dlBpKzZPYnNYejRteEFpRjJkellGQ1RHWmd6SXBzNnZR?=
 =?utf-8?B?Si9NV1c4a0ZnTUJsdStkR1hqbVE4UzNRaXprK2hVT3ZqZXA1TE5acVE3V0hh?=
 =?utf-8?B?Y0hRajZsYSt0b1BjUk9oaXBQemQrb2RsZkt4SFFzYTZuS2RvUXZnUld1aUxV?=
 =?utf-8?Q?55M/meIjei6vaeLvdUXHgCsh+vVrMtsTSEvaPbD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3140dbcb-119a-4064-3192-08d8f95805a0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 23:59:32.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2Lzhr6hXMrSTMmu6Zb5WnC1e1GDXAdq0q4GdKHnWUG1f2W01U3gy4TgxxRHZO5+cCxhmU+0z4IikCJX6LHAkQrKUp1TPxlURsIZ3Mk918I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0027
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Build results haven't changed since 1.8.20

$ cat doxygen-buildall.log
BUILDALL-QEMU LOG FOR doxygen
START TIME: 2021-04-06_07:45:55
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-67-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
[musl]
FAIL: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
FAIL: qemuppc64
PASS: qemux86
===============
PASSED: 20
FAILED: 2


../Randy


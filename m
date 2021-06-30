Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3450.1625089321718587666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 14:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i+YEF1fB;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2815b49594=tony.tascioglu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15ULYBuM022092
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 14:42:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a8172x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 14:42:01 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15ULg0Xp003250
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 14:42:00 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a8172u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jun 2021 14:42:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQfCzzt1dlvc47B72Ii9CxL4ObE3PT/546qKY9oA4lU9ZguNfUgQnQyYW0/69kHleLh5qK6PsDEkFKsunu857ekUy1tE898XPgXLTJ+lfOuoxnbEQHnz7x8TyjqR5IZUlCVznnvMvdcEuiayPdLXISyaZsrWKhkXG/qQe/ZTrgg5jmK0X5emkWu0Yt9HIxarz60FiuIeNfuJcCTj/nTOeV324yiNZuF0kHcRLmxWaRU/611w480w22tHMAegZN+tVZV1alKzVuRTZlTA5up1Kw6J7i6bVCNnRyomrmfFQHJK4Z65IA9wBQRMAd+XjU8jrmIfhlIMcCIcujZ73qC07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9BNG8CoPTbPq+5gs/SqlSs0BmuotGaivza6rr8J1Jo=;
 b=cBPCmh08j9pJpGKUp+/tAi1nqEN3rcaRgZ/FRUrCGJFVbYv7xZiGcEuQAY1SKB8yTwWoCg05En/MnkQS3FGPJLyMF3pWKXWxdRzdvRa+oMJU+FFigoBTl92ejQz+sJtcE0DK767lb73fSAWvQ0m+iuNwVRwtiDWK3ePwm7g7rbcSx3RZAUU9vhV0QBnhpeqY9GXCAUX2n4+o5jQmAgQINSZk/I1Q0QCbJSF8wjYjeM25h+zUUGOiphEQKLiUBPEZIlutF/exSsHgTXj0ZNBIW89hHOW51fUlJ9JXSBzs/hlK18XhvA0qxmXD/hnr/D8Xg6cwElANnmwZDSdOWAUW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9BNG8CoPTbPq+5gs/SqlSs0BmuotGaivza6rr8J1Jo=;
 b=i+YEF1fBW9xRkrDac4lMTJn6NcxrPDtGrZpt80/LwckplSDVCjs7R/I8RNiu3JRiHJ0S9kTGR6L8uaZr9GYiqO2Lvj2jQcn4fOnm7OftmKRAWqNUjwGE7fTFGN96P1oQx9XT3GLRwcc+Mu8ZR1w2qj/S9NM+Uq2KW3Oi56WFJiQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8)
 by BYAPR11MB2933.namprd11.prod.outlook.com (2603:10b6:a03:90::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 21:41:58 +0000
Received: from SJ0PR11MB4783.namprd11.prod.outlook.com
 ([fe80::643a:dbcb:bf31:3596]) by SJ0PR11MB4783.namprd11.prod.outlook.com
 ([fe80::643a:dbcb:bf31:3596%7]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 21:41:58 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] libyang: create recipe for libyang
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210630143719.166267-1-tony.tascioglu@windriver.com>
 <20210630165516.71817-1-tony.tascioglu@windriver.com>
 <e4f53a3a-e043-d394-4889-333c6e2e0852@gmail.com>
 <d1d63abb-ca8e-3bc5-35be-2507446184ea@windriver.com>
 <CAMKF1sr2xtS09tXhrhbQ8PT_A5mBNPqjAcd_nkqoK5Kbbq3G7A@mail.gmail.com>
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
Message-ID: <e05ed396-3cba-d435-b750-365eae98df19@windriver.com>
Date: Wed, 30 Jun 2021 17:42:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMKF1sr2xtS09tXhrhbQ8PT_A5mBNPqjAcd_nkqoK5Kbbq3G7A@mail.gmail.com>
X-Originating-IP: [5.25.166.245]
X-ClientProxiedBy: MN2PR18CA0024.namprd18.prod.outlook.com
 (2603:10b6:208:23c::29) To SJ0PR11MB4783.namprd11.prod.outlook.com
 (2603:10b6:a03:2af::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.108] (5.25.166.245) by MN2PR18CA0024.namprd18.prod.outlook.com (2603:10b6:208:23c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend Transport; Wed, 30 Jun 2021 21:41:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ac6521-b9ba-4169-e90e-08d93c0fe2e0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2933:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2933BC880C70AF906EA0689484019@BYAPR11MB2933.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wSzYsNFNYn9dE1qTzOzQmvsk+EeC97wImdsH84Cbs2YEQLvDqxdgLpPX/pyRpjYGNEDJFwZbkjQZGVOfL+AMwRuPi+BgwCbSwpK33uFYVd4+6QnRsqUnM3ZpQBDWqUfAJfVEowkjdY/o1I92jWf0TVSXzEC5koI/bp7STtxHbPlpLfsEkBDcExzSnZ4DuCdfJawknopd9lefK6CfTXScGOmNTssYIAJb0jWAslB4KbzW8pZU2awuDNLa8IqYYWrjQ/2oAPtgQQQac8Zc+P0VDUOsc8vVJxxv9OAY1tKJQSdL5wAOQ344EiQnbOxeBxKHH+cVJwA/Rxp2UbxIE0jt4k1e8b9BIjh7op8R1pgIvDkD1oNEYjprD6TRI3YlT+edLfJUNjAknEe8vYl/EikAi/Qx4P2nyhvqtog2IdTSgQtFoM+SwsgHlvjBqBF47E+rAyJPD6E0UHJwA8PEtcl6TavgIElnzhLXpIOwDeChvO07UHfTCw7/hX4FQ85+hNXxFx0hKgY8V+0RI+WfKUHwt2NFQwE7a5d86CAb9ESYTxTW7xdjs8sVl8gDmw6hJKo5M9kt2tf5N4tkmmQfWeq5IFTUQh9QmFnfUoiC4fqSWOy0KFce+nHW1hbyg8SiT4+htDsGQmezawHbE/+IHQU+RMYgCC7n1KjQlgQFIrIitVjrBN4fJM+nh8/RQVFmDc0bsdYxYNvrVblA06v8ZT5xh2qiZJObPKsll/MK6dU4u/5z/sAN1U70fK5VZMMIngBUpLhfFtBdYz9emckXnLU9fc9S1i3jvjY8QFYEQNEGvXlKh4bAOsOrqvWKhGXKNXwuhKuXiwRVHPEbLM7jzTeyCqHEn21mqVjRoaHVKkSk8m98vAmoFG5EmfgJ1/NooAv0f6bcpE/ZjMqOMPCx9lxd8UuTdYcuV92iSU+BQ4fwwTR7NMEXxRIxf7Masgv9A4a4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(346002)(136003)(396003)(31686004)(86362001)(186003)(16526019)(4326008)(8936002)(30864003)(6486002)(31696002)(2616005)(26005)(83380400001)(44832011)(8676002)(36756003)(966005)(66476007)(316002)(52116002)(6916009)(956004)(38350700002)(38100700002)(66556008)(6666004)(66946007)(478600001)(16576012)(2906002)(53546011)(19627235002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjZtMTUzaDFKaUZjaUZqMWtuQTBUVGtialZ0SUNkN3R3NXpYbFVJVkptYlBy?=
 =?utf-8?B?Wm9oSWNRSWVSclZ2cndYcnZqNnZWYTcwcWhIc0tEMzhPdlNaeUNzTzFoeWRl?=
 =?utf-8?B?SW1oMU10R1lGQ2d4R0l1TEpyeVFTZ05DaTlWRTN4VHptclhUQUl1RmRLdzVG?=
 =?utf-8?B?Qlo3TmwrdkZUU1FhM21OWDFUN0J6YzZBdUl2bEFIWDlHdUt3dGEvSnczU3RR?=
 =?utf-8?B?d2kwN25jVFBvQVNoYU5BSzN1SVFJNDJSY3g2U05CZE9FZm0yd2E2QVRJdXh6?=
 =?utf-8?B?QUFra1V2OXkramRyQWoyT2lNR1MxaDRLVDNBdjhUS2JLTzhMUWo4MExkNnhD?=
 =?utf-8?B?Y2NlbnNVQjc0WmZqTlhMVXpJeUVzZlZXa1BFaGpmZ01saHdGb2d2ZnZNOEpy?=
 =?utf-8?B?TkloZ1NKR3FwUXk2YUZ6MzBvQzV1K0V4NS8xemdwWEVuNHNmWm5XcFZLRmRi?=
 =?utf-8?B?Z0FzRHZMTTJETjJLRUg2d0dLNVB1c1RBRWd5UFNNZWZCd0lFZEdBREpmUk1u?=
 =?utf-8?B?M1BGK2QvU1hBdVhiV2UwekR3U0NHV2FBQWFmcWhhVFRiOEExczJCTkp0eWNK?=
 =?utf-8?B?clF5YTBhMllmdkNOWDgzT1hLMnIzMzhFV3ZnWVJMRnZrbUlaQlhQaHBPMHd4?=
 =?utf-8?B?RVVsNzNKaEN0QXJWSkdwVXhMQ1lrdHFja1ZYbWN4Q0QwaEhmR1pxdVVhUnNR?=
 =?utf-8?B?TDNhd2pyTUhobEgzTUxGMmtYc2NaQ1haTERBU0s3ZVJVZ1Z2UDBhZEdMVUpC?=
 =?utf-8?B?dFNsbUhvMGxSeE5wTnN5WlRWUW5mNWtiTXltRUdRL0lON0FEcWNUQjRoN3BR?=
 =?utf-8?B?VUFoU2NycGFET2NkaVpZT1p1Z1BiaExJZHNXNTd0dHU5emJrL1FiOFZxeFRV?=
 =?utf-8?B?VUlmeFVKY2xTZnlWZTNodGJ2aWtwUStVUjFqWkxHNzROeldtM1FBaVY0L2Z1?=
 =?utf-8?B?SGU5ZzE0cTRoMFFlU1FrK1UzQU5OOWhRNHdYZjZvWVJOYm1sZUxrZVlCNGhi?=
 =?utf-8?B?NGVIUUs3cWtyaWhwbnJxYWR5QlZXYkFKSE5ZODRST29BMThJYmJ5Vk1sd3VJ?=
 =?utf-8?B?RGFYNFJQalBVeVl1QTlzb2dhdTkydFByM3JJNjlUa2lwSm1aRzBWaGRtMktV?=
 =?utf-8?B?bFMzaVI2WU9DMUxRQXg5TWtUNTViRVNqNEtFVHVyRldUd3B6S2hhN0QyeGo2?=
 =?utf-8?B?NXd2djFrUE4reVNQSnYvclJsNHhhNXhIRlc2SmE4TVp6bStiaGFWcnp0Vnh5?=
 =?utf-8?B?S2RXaVhhUnllQnU2NmlhcXIrR2hPcndMemN1R2R3ODBFZUs4UkhpOGVva1N6?=
 =?utf-8?B?K1JHWTVZS3dpY0w5ZldPaERzRmd4c1Q4ZFZ3ZnlONm5BSTE2MGpRazhmcHBz?=
 =?utf-8?B?OWlJem8xdGUyK0hQUDJheFQxWXNxaXRmVjNwTGwwODkxZkhKam00b0RCTWs1?=
 =?utf-8?B?VG5HN0FGTk9WNUJ0RS9Rb0YrQXpDdUl4YTBnN2tmSnFMTUlybEdXVXVlY2Fu?=
 =?utf-8?B?bVFyNHZUb2Jobm1LMGJBRGdPWW05MUZvVkV2VCtLQ2ZRNDBwY3R6bzZ0M3hP?=
 =?utf-8?B?SUJZYnpUT2ZseFdXaGtGdVBKUWkzQ1NBVCtaTW5rUmxLYnhzaytuekhrMHRM?=
 =?utf-8?B?ckladXJqYUV2cVlKTmJ5Ymk0TWV3eVd3MUw5d24xNGRFSEgxT3hHWHpoK20w?=
 =?utf-8?B?UUY3YWxSeVJ0YnpQRHRCL3RtWUs3Yjg2Qk1oem11M0NwckEreDUyUWVpc2xu?=
 =?utf-8?Q?/0X4//w9Ixv9ZBHAuyfjfQA2ITOWbE+qOUoga28?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ac6521-b9ba-4169-e90e-08d93c0fe2e0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 21:41:58.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQ9u2fdiz2F62dU/xmf3Qo7b4kKI8/XMWKvbmKoKKlPF902OdqV2fjZ8f5UN1spLjU7UngeIK81g7/0Ys/L8fjihzvdE9Pp9lYOTqCmUp/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2933
X-Proofpoint-GUID: OM7RMhMqCwHKo_KZOwxGfz3goN-f2e4o
X-Proofpoint-ORIG-GUID: nG1FVUop1qdmH5X1RF919VV3aE4DhoFY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_12:2021-06-30,2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300119
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I tried building it without ptests, and bitbake still seems to find the 
ptest rdepends for valgrind and skips the build.

Not sure if I'm missing a parameter, or if bitbake just looks at all the 
rdepends.

Alternatively, I could also add the COMPATIBLE_HOST based on 
bb.utils.contains having ptest, like I did for the cmocka dependancy.

Would that be preferred?

Thanks, Tony

On 6/30/21 5:38 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, Jun 30, 2021 at 12:20 PM Tony Tascioglu
> <tony.tascioglu@windriver.com> wrote:
>> Hello,
>>
>> rv64 is also incompatible with valgrind, which is used for the ptests.
>>
>> ERROR: Nothing RPROVIDES 'valgrind' (but libyang_2.0.7.bb RDEPENDS on or
>> otherwise requires it)
>> valgrind was skipped: incompatible with host riscv64-poky-linux (not in
>> COMPATIBLE_HOST)
> right I should have also looked at COMPATIBLE_HOST list in valgrind,
> since valgrind dependency is
> only needed for ptests, we should still allow to build it when ptest
> feature is not in distro.
>
>> So far, the only obstacle for other architectures has been the ptest
>> runtime dependency on valgrind.
>>
>> Thanks, Tony
>>
>> On 6/30/21 2:26 PM, Khem Raj wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On 6/30/21 9:55 AM, Tony Tascioglu wrote:
>>>> Add a new recipe, patches, and ptest coverage for libyang.
>>>>
>>>> The recipe follows from upstream, using the cmake build system.
>>>>
>>>> There were 2 small changes needed to get the package building:
>>>>     - Remove call to pcre2-config
>>>>     - Add missing import statement
>>>>
>>>> The recipe has a dependency on libpcre2, which satisfies the minimum
>>>> requirements for libyang. In addition, for tests, cmocka is required
>>>> during build and runtime, and valgrind is required in the runtime for
>>>> some tests.
>>>>
>>>> Due to the way the library by default builds in a debug mode, release
>>>> mode was specified. However, this disables building the built-in tests,
>>>> so an EXTRA_OECMAKE was added based on whether or not ptests are enabled
>>>> to specifiy the required extra flag.
>>>>
>>>> Binconfig-disabled is inherited since using pcre2-config directly is not
>>>> suggested anymore. Cmocka as a dependency depends on whether ptests have
>>>> been enabled. Since ptests are built with the main package, we need
>>>> cmocka installed before the test are compiled if they are needed.
>>>>
>>>> Ptest coverage:
>>>> The ptests come from the original tests included with the library.
>>>> Ptests are in ctest format by default, so we compare the return code to
>>>> print it in Yocto format. However, as each "test" target executable has
>>>> multiple tests in it, the full stdout and stderr logs are saved for
>>>> troubleshooting.
>>>>
>>>> Currently, several of the tests fail due to hardcoded paths in the
>>>> executable binaries generated, this is an issue we will take upstream.
>>>> For now, only the tests which work on a different target are enabled as
>>>> the ptests. The list can be updated in the run-ptest script, which is
>>>> portable shell compatible, without requiring bash.
>>>>
>>>> The recipe also has libyang-bin as a split package, which includes
>>>> yanglint should it be needed.
>>>> This recipe was tested using buildall-qemu as well as from within qemu
>>>> in x86_64 and arm64.
>>>>
>>>> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>> ---
>>>>    ...byang-skip-pcre2-config-add-stdint-h.patch | 55 +++++++++++++++++++
>>>>    .../libyang/libyang/run-ptest                 | 46 ++++++++++++++++
>>>>    .../recipes-extended/libyang/libyang_2.0.7.bb | 37 +++++++++++++
>>>>    3 files changed, 138 insertions(+)
>>>>    create mode 100644
>>>> meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
>>>>    create mode 100644 meta-oe/recipes-extended/libyang/libyang/run-ptest
>>>>    create mode 100644 meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
>>>> b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
>>>>
>>>> new file mode 100644
>>>> index 000000000..e3b2d0e02
>>>> --- /dev/null
>>>> +++
>>>> b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
>>>> @@ -0,0 +1,55 @@
>>>> +From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
>>>> +From: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>> +Date: Mon, 21 Jun 2021 12:34:22 -0400
>>>> +Subject: [PATCH] libyang: fix initial build errors
>>>> +
>>>> +This patch addresses build errors seen when integrating libyang as a
>>>> +recipe.
>>>> +
>>>> +The call to pcre2-config has been commented out. *-config calls are
>>>> +being replaced by pkgconfig, and we want to avoid the binary config
>>>> +calls. This call can safely be discarded since it is used to check
>>>> +the version of libpcre2 on the system, and all recent YP builds meet
>>>> +the minimum required version (v10.21).
>>>> +
>>>> +There is a missing include statement for stdint.h in utests.h which
>>>> +causes build problems. stdint.h is required to be imported by cmocka.h
>>>> +prior to the cmocka file. Adding the stdint allows it to build the
>>>> +tests correctly
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>> +---
>>>> + CMakeModules/FindPCRE2.cmake | 2 +-
>>>> + tests/utests/utests.h        | 1 +
>>>> + 2 files changed, 2 insertions(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/CMakeModules/FindPCRE2.cmake
>>>> b/CMakeModules/FindPCRE2.cmake
>>>> +index 8f60daa2..ad014f14 100644
>>>> +--- a/CMakeModules/FindPCRE2.cmake
>>>> ++++ b/CMakeModules/FindPCRE2.cmake
>>>> +@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
>>>> + FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
>>>> +
>>>> + # Check required version
>>>> +-execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE
>>>> PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
>>>> ++# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE
>>>> PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
>>>> +
>>>> + # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to
>>>> TRUE if all listed variables are TRUE.
>>>> + INCLUDE(FindPackageHandleStandardArgs)
>>>> +diff --git a/tests/utests/utests.h b/tests/utests/utests.h
>>>> +index 5bea0459..a256120c 100644
>>>> +--- a/tests/utests/utests.h
>>>> ++++ b/tests/utests/utests.h
>>>> +@@ -23,6 +23,7 @@
>>>> + #include <stddef.h>
>>>> + #include <stdlib.h>
>>>> +
>>>> ++#include <stdint.h>
>>>> + #include <cmocka.h>
>>>> +
>>>> + #include <string.h>
>>>> +--
>>>> +2.32.0
>>>> +
>>>> diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest
>>>> b/meta-oe/recipes-extended/libyang/libyang/run-ptest
>>>> new file mode 100644
>>>> index 000000000..1c9f8f47f
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
>>>> @@ -0,0 +1,46 @@
>>>> +#!/bin/sh
>>>> +# Valid tests to run
>>>> +tests="utest_binary \
>>>> +       utest_bits \
>>>> +       utest_common \
>>>> +       utest_hash_table \
>>>> +       utest_inet_types \
>>>> +       utest_int8 \
>>>> +       utest_json \
>>>> +       utest_list \
>>>> +       utest_merge \
>>>> +       utest_metadata \
>>>> +       utest_parser_yang \
>>>> +       utest_parser_yin \
>>>> +       utest_pattern \
>>>> +       utest_printer_yang \
>>>> +       utest_printer_yin \
>>>> +       utest_range \
>>>> +       utest_schema \
>>>> +       utest_set \
>>>> +       utest_string \
>>>> +       utest_tree_data \
>>>> +       utest_tree_schema_compile \
>>>> +       utest_types \
>>>> +       utest_xml \
>>>> +       utest_xpath \
>>>> +       utest_yang_types \
>>>> +       utest_yanglib"
>>>> +
>>>> +# cd into right directory
>>>> +ptestdir=$(dirname "$(readlink -f "$0")")
>>>> +cd "$ptestdir"/tests || exit
>>>> +
>>>> +# Run specified tests
>>>> +for f in $tests
>>>> +do
>>>> +    if test -e ./"$f"; then
>>>> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
>>>> +            echo "PASS: $f"
>>>> +        else
>>>> +            echo "FAIL: $f"
>>>> +        fi
>>>> +    else
>>>> +        echo "SKIP: $f"
>>>> +    fi
>>>> +done
>>>> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>>>> b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>>>> new file mode 100644
>>>> index 000000000..8e9e8cc02
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>>>> @@ -0,0 +1,37 @@
>>>> +SUMMARY = "YANG data modeling language library"
>>>> +DESCRIPTION = "libyang is a YANG data modelling language parser and
>>>> toolkit written (and providing API) in C."
>>>> +HOMEPAGE = "https://github.com/CESNET/libyang"
>>>> +SECTION = "libs"
>>>> +LICENSE = "BSD-3-Clause"
>>>> +
>>>> +LIC_FILES_CHKSUM =
>>>> "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
>>>> +
>>>> +SRCREV = "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56"
>>>> +
>>>> +SRC_URI = "git://github.com/CESNET/libyang.git \
>>>> +           file://libyang-skip-pcre2-config-add-stdint-h.patch \
>>>> +           file://run-ptest \
>>>> +           "
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +COMPATIBLE_HOST_riscv32 = "null"
>>>> +COMPATIBLE_HOST_armv5 = "null"
>>>> +COMPATIBLE_HOST_riscv64 = "null"
>>> what issue do you see on rv64
>>>
>>>> +
>>>> +# Main dependencies
>>>> +inherit cmake pkgconfig lib_package binconfig-disabled ptest
>>>> +DEPENDS = "libpcre2"
>>>> +DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '',
>>>> d)}"
>>>> +BINCONFIG = "${bindir}/pcre2-config"
>>>> +
>>>> +# Ptest dependencies
>>>> +RDEPENDS_${PN}-ptest += "valgrind"
>>>> +
>>>> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
>>>> +EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1',
>>>> '-DENABLE_BUILD_TESTS=ON', '', d)}"
>>>> +
>>>> +do_install_ptest () {
>>>> +    cp -fR ${B}/tests/ ${D}${PTEST_PATH}/
>>>> +}
>>>> +
>>>>
>>>>
>>>>
>>>> 
>>>>

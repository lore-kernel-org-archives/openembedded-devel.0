Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.43])
 by mx.groups.io with SMTP id smtpd.web10.21665.1585166347914328716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=EgUv4mR9;
 spf=pass (domain: xevo.com, ip: 40.107.94.43, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZQYYZMN97ih+3HhJsGeklzj6ib35der2kReW0T4+trlSyfuVgQrUSjJ5+pAcn5KP9UWzT22yLmzTnEpuxhU7n3aw5njnDYLgZuzWBk7XhxmoIqYB2uf7jN+6H1jpcRLGq5rrT40hZdVcbarD3aBGLVQe21czHYq2GLPAQdQIF+cVWP+M20vOW0OT5mzthDZzj0d2uasecYw2vuxwaETD7ap3fyhePzstp0jn8PJGRFThE4rExVv8hX/vo8kx4CKKdbAfIdfgMGnYf3JWke8NgsmpBwZ/EagmIxH67RIBnGwkoOKSxmJtE4IZJY6yrdGvcYX03BtIAwT/8CvkjSA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJmjQ24pgTYjRgktdLhW8ygq/kOTf+iEsd3WMGiZWHE=;
 b=Ka96vVYLE1mlBKTYdCywG8jXsR8HD0fXMpG6rXiVwSKnsT4kgTqA6Y1BhtlFe2lCpKSeHM19LxVdCG67nx8aslrrMlC2ADWEf899+pmfWYxdw6j3lqQaNjJmAIYkhQ9Zo7li3dyTliDZs124YBSb0sxmIcb9DVLQfYVlto2BsaD4fI3zPQuzWntUj0r08KaAb8CtgSHWDulm7mB46keoFjauLzFz3L1EPCY6NvgX/WzqXJdSPSuMO42RB8BN2R2wqX1V6gMQwcFP2OzMQzA9jGOQd1UiWZHQGmqf5N56W/FYh7f4epj4QYzwV07N465x2dgQDlNT75uQ8tYRj340kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJmjQ24pgTYjRgktdLhW8ygq/kOTf+iEsd3WMGiZWHE=;
 b=EgUv4mR9tF+ngMGJwFsa5rWXJuOFogQ6x4XQeCblqVzzIicOHfH7Wsa6mYfFZ1OO03L26SYGYuNA82Asr59iMM/BIWz3+6NAazEsXDgPIIrCbOZio9PCxm34o7XkF4Nw4K5OcuWuc4jZzUhDB6oG/ME3qXsPgL5//ptUtKzvl+E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2090.namprd18.prod.outlook.com (2603:10b6:907:b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 19:59:05 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 19:59:05 +0000
Subject: Re: [oe] [meta-python][PATCH v2] python3-pint: upgrade 0.9 -> 0.11
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200325164838.977493-1-mkelly@xevo.com>
 <a2bc1b96-73b0-8caf-7d3a-e49c1ddd5436@gmail.com>
 <1f54cb63-78ec-58fa-c430-b70dde91dbea@xevo.com>
 <CAMKF1sp4Drht0XEi9qRB0GH1BmnguvkZZLvbfST3ETciP+2gpg@mail.gmail.com>
From: "Martin Kelly" <mkelly@xevo.com>
Message-ID: <58e3e678-af81-8675-1eb2-a435bb472457@xevo.com>
Date: Wed, 25 Mar 2020 12:59:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <CAMKF1sp4Drht0XEi9qRB0GH1BmnguvkZZLvbfST3ETciP+2gpg@mail.gmail.com>
X-ClientProxiedBy: MWHPR1601CA0009.namprd16.prod.outlook.com
 (2603:10b6:300:da::19) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.254.27] (50.35.85.47) by MWHPR1601CA0009.namprd16.prod.outlook.com (2603:10b6:300:da::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend Transport; Wed, 25 Mar 2020 19:59:05 +0000
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72b18288-43d2-40b0-ccf5-08d7d0f6f8f3
X-MS-TrafficTypeDiagnostic: MW2PR18MB2090:
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2090AED222643ED81658E589ABCE0@MW2PR18MB2090.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(376002)(346002)(366004)(136003)(6916009)(5660300002)(66476007)(2906002)(26005)(66556008)(66946007)(53546011)(81156014)(31696002)(36756003)(86362001)(8676002)(81166006)(8936002)(6666004)(4326008)(2616005)(478600001)(956004)(16526019)(186003)(16576012)(52116002)(6486002)(31686004)(966005)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2090;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Xc4ZnEbEOP0kP+douPTqGzM4JE4a9DoqAMy+MGopBIuPz3fe0z4BI5xk+mBfEpdq+aj/yGyjDN+3B9jh6dDvBbWfnT5qmMOvVXNvzV1jgg5EhccqgtNbgp6rHOO0jE++p3qUbz7X9tvy00Y4BubAemAz9Eq9mjA5jRTU5HahyOcZy/xS2Cc3eZSjvdeJ1kK/DuqkEHvA1LF+WizNwtJgT/y5Rk7sZCAKIvNNogmqXP1uxwMsFNwFM4WQODcfaGNmf+SSp2nZRllUnGkhrQtzN2n24X7ZN81Md4fPxDgq/gFoG+uACdxBAmqOS25N9qREiIat7tK9uwIpWCtqxxguO0YwoZ21tRPL6XqykO5weBzS2FLkUPTOfvas+AWMT8Do0RWxo14PndKtOjZX4qbucBQzhqrwxSr+jJDpGfSC6syzQnpzc+SMscnoT5wPgTwJt+YyN1E+GBPxiTf64qB1Ft0KOBFyP1UctClDXU8JSkXiebtHkVi8avD7AW0yyv2Sa4m72UY4dZEOeZVbZt/ew==
X-MS-Exchange-AntiSpam-MessageData: 
	UJKcTPzH+Q5z+QaXGgnrj88LCTcUXyHA+k/7thaT9HKjYKJxEGaaKneZe2vcaMhFa5fm1NNAeqAFNqb4PeWBzdEJJEOlPfCMsPubvrmFaEwkAyfJ67RnHucm+Ph+Mq9VJmwDK5ArVXOMi79ess4dMg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b18288-43d2-40b0-ccf5-08d7d0f6f8f3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 19:59:05.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX0Ao9t3r1LzpeZ2DQuPY3EEuf+cEdjZD1uswbEGHDdPNTElpLJtZiWVxTNJ9Ues
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2090
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/25/20 12:46 PM, Khem Raj wrote:
> On Wed, Mar 25, 2020 at 10:11 AM Martin Kelly <mkelly@xevo.com> wrote:
>>
>> On 3/25/20 9:59 AM, Khem Raj wrote:
>>>
>>>
>>> On 3/25/20 9:48 AM, Martin Kelly wrote:
>>>> Also add a dependency on python3-setuptools-scm-native to make this
>>>> build with the newer version.
>>>>
>>>
>>> Can you rebase it on master-next please ?
>>>
>>
>> I just did, and it applies cleanly with no changes (applying on top of
>> cfa5f5689: "python3-matplotlib: update to version 3.2.1"). Would you
>> like me to send an identical v3 anyway?
>>
>> That aside, I will make sure to base future patches on master-next.
>>
> 
> 
> Description: [meta-python,v2] python3-pint: upgrade 0.9 -> 0.11
> Applying: python3-pint: upgrade 0.9 -> 0.11
> error: patch failed: meta-python/recipes-devtools/python/python-pint.inc:9
> error: meta-python/recipes-devtools/python/python-pint.inc: patch does not apply
> Patch failed at 0001 python3-pint: upgrade 0.9 -> 0.11
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 'git am' failed with exit status 128
> 

I see now, it appears that git am is pickier about auto-merging than git 
rebase is, as it's failing while git rebase worked fine. I sent a v3 
rebased onto master-next, and I confirmed that git am succeeds.

>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>> ---
>>>>    meta-python/recipes-devtools/python/python-pint.inc         | 6 ++++--
>>>>    .../python/{python3-pint_0.9.bb => python3-pint_0.11.bb}    | 0
>>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>>    rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb =>
>>>> python3-pint_0.11.bb} (100%)
>>>>
>>>> diff --git a/meta-python/recipes-devtools/python/python-pint.inc
>>>> b/meta-python/recipes-devtools/python/python-pint.inc
>>>> index 0900d91d7..4a9300900 100644
>>>> --- a/meta-python/recipes-devtools/python/python-pint.inc
>>>> +++ b/meta-python/recipes-devtools/python/python-pint.inc
>>>> @@ -9,7 +9,9 @@ PYPI_PACKAGE := "Pint"
>>>>    inherit pypi
>>>> -SRC_URI[md5sum] = "d0681cb7cfaca9fc68ce7edab0d08d88"
>>>> -SRC_URI[sha256sum] =
>>>> "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
>>>> +SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
>>>> +SRC_URI[sha256sum] =
>>>> "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
>>>> +
>>>> +DEPENDS += "python3-setuptools-scm-native"
>>>>    BBCLASSEXTEND = "native"
>>>> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb
>>>> b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
>>>> similarity index 100%
>>>> rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
>>>> rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
>>>>
>>>>
>>>>
>>>>
>> 

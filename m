Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.73])
 by mx.groups.io with SMTP id smtpd.web12.26032.1600976612800649653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HfNgSJcc;
 spf=pass (domain: windriver.com, ip: 40.107.223.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFtmMPUZnTTZehxx2uw7lfrfpKsPkauMZyky/+n+SbQU9jv17k7lH3EEy9/GBJ31W+CprwmwGte9EpkXG8EhT5AeOMVVMZMwtFjt1kgwLzFLqykD8fxP/k2GkLBnzhDfPx3OEdUJREp35RGC8wJXGcfQEcXNoUn8Vr/wIVAVflw1OVd9y62CdVqAx0mpIsFtG1ZMzazAyApe7UImY5vAzOCbGeN6HmXSFkautBb6+HsVxddv3aep8CY8tS6o5gimCNkYh5qFgArEr+oBUeWRbuVtrdlnAz9hzz+QtFkEzyNadRHC96YCmRZWfH9Ld7wFW7VKbqKCtM3Cxq+Dvj+eEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaovujJAm7oh3sX5IeFufI1WqEUyDlzeKs0MWtdI05g=;
 b=hgictoTuRk/QQPMLfKZx7KgfbJLF4M0BTdAcwQGpO89LRSkCzGHYXL7ppGNdxGhJFWr9i1p8Q1CzS8ASaay2nGKgtkbppnwklsTFIQaDyS588yuKOJb5faEa2cf+Oxtd2ir1UQ4tcb0Ead1kYkw0Wi/bIlNwjjl/oGNuTK7nHd5+WJ12FRLhTk7509seyjk9a8bk5OesDEqC7Tpdm5yeiY7aLz3e9SfCkdHhQS9tiEB2fSl5sLDpZqbfBTaW5ynyVc0dlGz6SZvBRPhHvPyGbiFbCHFxHhmq9OsbClQKLibp3VUgJQ5+hqX4N7SWBrO4aU45xz4lGZ4z6/Aj117GFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaovujJAm7oh3sX5IeFufI1WqEUyDlzeKs0MWtdI05g=;
 b=HfNgSJcc5TKvPK/Bu52cmQ4byWTA5jKbImPERRBO9sUBgF7UUlFTZXo96r9qm9T8Pf8dmZJldGCppCcO0kkCVgg2yHAy90wCEc3e2r4/Boj8RPtlwQ/FdgiiyI2xOzvHBc58jY+0FBg3Tk24W5Z1YKhbIIlULcOw0vqcNkc+imE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 19:43:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:43:28 +0000
Subject: Re: [meta-python][PATCH] python3-dateutil/python3-pykwalify: add nativesdk support
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20200923071214.39852-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <99be805b-35ee-830d-3c1a-30448c8528ae@windriver.com>
Date: Thu, 24 Sep 2020 15:43:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923071214.39852-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 19:43:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1476a86d-5ab6-4684-b7bb-08d860c21b98
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2839EB74F46981CBCC825CE39F390@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OXiBacU+5XOhDanFnVzB6VeVhkkqxVIZ0MI5yxJoDQNRqW8PoXaQoEwiAlUA8JMpY73A6BC+Ni8+1EG8OL4/LBnKxzOAmf1vxFaFijMgN/ZdPTws+GUMfyhwCcl4whfSgNt9jRUdrIi4xXhA+u9vDw+VXcX1fCVWz2TQJLtWtUgV0kt03D739gi3YeA4IU3WXODZ02fotH6gSjiO2seQOKMYxyw3YdjpI6VkPoIaDDjMtE0zsPZqrWtnj2ZvrWOo+23bmQ6CnZyT/BG22iWKhHMp4wUrpugFm9svtQB9/0iZbiY5hNWOfypWN/ffNBxThbuJWPvOKuuWNyqyJV0DurMOIxU2Izgax48Mnm9jM5hScyHScHS036boFfvbwOas
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(16576012)(83380400001)(2616005)(52116002)(66946007)(478600001)(26005)(53546011)(6486002)(316002)(44832011)(36756003)(16526019)(4326008)(186003)(8676002)(66476007)(6666004)(956004)(66556008)(86362001)(8936002)(31696002)(2906002)(5660300002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LYjjAv+L4geBTZtPXKimYiwA5N1gSYQGnLQ8w0atOnzoFGu3Hf5DFCkuOiAfazemJ06BZq5tKvDX54TtVQweC13UqQKn0gNyTgOzW++MLlCKibBUvJh9WMAPC+OGeP0yGXfWFRp4hL0HuVjhnKZQYnZPo23/0wAPtJ7q8s0x8EiEt+XOuuMgV4hjaq1nl9BRnb3z5cZTdYTZnewnZcE2BotWuwyKmM6WVRLLmvuwgdBritj593++HtmroYSgDC56N0IEzI4Dcl5ttahnbV86nOm62Nwbi8dBGXorHvmRpoJG5ZM+LqP/kMwolPSH2YguGYF9ruOvcHcaq3txEfM6TTWPo9tTpPEqIMQL6WqUTNspXv/dTR4KnsnktnbaYdMv93qrJ4H3Nc58hbBotULI62PZBw0BJl+wz7ZAI5OdCg6fyW0WOK28c5S6xy7JujnoUVWJliuy3Qk+2bpJehtz5Aa7E84er61jiGvFWf5cgPUfkQ5ZDGTv9E3B5R3dNZhUzJ7bVWoxnrwFbVzyb4nh4Cm+FWPWL6QXcLJ9ls9Z+1T3kkXM+o8vnyWJS1wQ9mYsSsROgGf6ceMO2UTq9uGVSWD+crOKgINDaxnVXsI1JsP6di+bfRYuuS4T0oa1qBvKMJNszvYKkDNFzQaAltii/g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1476a86d-5ab6-4684-b7bb-08d860c21b98
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:43:28.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeD0B3GffFoB5/UX3Sm8EbzoJZH8629p5Oh3X2f7oCyRa1Ix/NrNFPnpG8WdsMhPUHXL1qguJU2PuV1lPWyTeFuCt/x0aHmM48lGjpvXn6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/23/20 3:12 AM, Hongxu Jia wrote:
> Call pykwalify module in SDK
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

It'd be good to split these out in the future. OK for this time.

Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>

> ---
>   meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb  | 2 +-
>   meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
> index fb7db162c..5326924e6 100644
> --- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
> @@ -22,4 +22,4 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-stringold \
>   "
>   
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> index 5d029bd76..4440723d3 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> @@ -16,4 +16,4 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-pyyaml \
>   "
>   
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"

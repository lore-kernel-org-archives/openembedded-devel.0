Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.51])
 by mx.groups.io with SMTP id smtpd.web09.19182.1606484960087087345
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DPz/G87T;
 spf=pass (domain: windriver.com, ip: 40.107.237.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SluH81zQlyTcTK9LOX0qeT1Y9eprb+s6vwHpS/cJb9Hvsm5Uo5m84VPfOwoufidELJ1AGI9zqb5+vukcSxrfMQBEyE2jBe/mK5rn1jP8AmRN+pRDCjrJCu9gRq6RqRBO5/YPz78OYpJrsgOz1pM4nR/HXBhRblQsDRPeJTabwVbfMylK5/8NE4NDBdMBOwMrWPo44Ypg0i+w8gaeIUr35YxA5hCt0VfYE09GyX4meJTwqW8FCxp6yVy0o/6vcipTxDdolPYdUhRxtL+lfHZB6/gxPQHhHhEC9w+3ALKZ6X3290KXFFC+v2w+gX+zULut6umF7Sgpit5/ihIXU6i96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbsYlzqPGpsi2/sZ0UTgPpe37P07/gsxy6veufTFw60=;
 b=cD2R0a5HySFhoQpjvhyXhFuZsZc5oYRkaLiboAmarwdMUypJL+sQuU6FQLDFR6Zh6aW9cT7yng3afVACd2JTzmjKiaGjkUee4PaMSrkj/jnbXjqeNKkAe1KZmsI5bvKUbeJxU4wTMBzrngJnZc+WIZhKV4EUwfQdI5M99s1JjQrSx+4lUYBrQD5+BPUWuwhLweFMut9SapxxB0/gYRuThe7z3Boi4jziUQG4qGh1jp45tYXsjyHQ5/0HXXjbA5Ms0zeXoJ0LBPltsa9XyRILIBbUWV+y+pntTHOAWNopuh9dADt99QLjrDgNUHdvNIU7+H5GqBfp3xlP3MokSkfXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbsYlzqPGpsi2/sZ0UTgPpe37P07/gsxy6veufTFw60=;
 b=DPz/G87TuPxN2lRNxbyjWQA0QGmkJOLkAbbt9fukjNDvYV23JfOEcDP0giv9q6tIWbrQSggvBgRX2FRIpAVFIxcTd7lnctvrH8ysv1WHcca4d1M/zwTm4VMwP7kLaBooumyze4vhnkHiCFcn5p0K9cm6TfTzYoT/kgkFGwAdV0s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:49:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:49:18 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-yarl: Upgrade 1.6.2 -> 1.6.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
 <20201126180347.13763-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8d75dafe-51d6-aa5c-9416-ebd602cbdc59@windriver.com>
Date: Fri, 27 Nov 2020 08:49:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126180347.13763-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:49:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b380ae-fda8-4e3e-66be-08d892db3c95
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB259882C5ADFD1D98BCE13C729FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lUupn0iNGsFF5i4vOtJ6R5cwbE9EpWjc66k54K3C/SGLMcP+NkzY2fYFjfnRXsWn0MIwZ6p3ilEni2ugQqczKsPfBZkrUvEmrOW1x6XK9M1/Hu8GjIXwZ3pIX5rUQtJGIOggjJ8eswbrZptNNmQhqg21QFnSzSiFfn6BqB+UN0cvj6Em5tcMwrBiTnhb7YqFv04fHgRVRSNrJ2979hIVfCwPyLGNelNkNuCT/SMPpVy3EvuFd+xc7sOznrMWzeLxcR4L1x1yCCwfEmI0C4XS6DO2VxB/xMuL3HIwFcf9Y0P3+p+aAzNpv56hEaFCSqU0eLZzA28EnujzMRt3WzlsfQKpNTuIVd+Ni+eV9Gcnj42ngN5X6LbYnnheVvqwrTQiZXef0UGv5TlxK2v7Tr82aCORTrpHP/yoi2G3eOpiUJSQ8aPHIk07msmOYyZtAwY9xv/XULSIZ7cOHsTkOMCUWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Rk10ayt1TkJxN2FibDZIaVZST0JaNzNoQ0w1a2hKOHJaMWlzSXBrcFZDZDJF?=
 =?utf-8?B?dXFuenZkRVArUm9tTEl3cFpSM3hBQzlVNU5iVjU0M09qYXFFcjExVnYzM2pt?=
 =?utf-8?B?NFV5bUlKVzRJN2xqb3JBNkV2NDE1ajh5YXJVRFdBRVN5eUczNENMc1M1bkRK?=
 =?utf-8?B?dFUrQllLTWxmWWhoSk9XWUlKOHdtY2p1N25BYVpabGY3MmlucEI0KytrZXJx?=
 =?utf-8?B?b3F4K2toKzBLYnBWZ0I4MDJHMWgrcktzRlJPanBHWEhKcHBCYzJqYnY5SURB?=
 =?utf-8?B?MkZGeCtJNm02MzJtWnBSTStIKzE5dG5RNlRaYmlTbDZlVGFkVTZ5UUVVV3JI?=
 =?utf-8?B?eW9ya2ZZR3owNmlBdk9ueVZ6dWVFV2tKR2xzbXVyREIzdnJwanU5cDYzQy9l?=
 =?utf-8?B?SDQ4bkRTZmVLMkhaNFI2cFpQb2NRaDZ0WHc4RjhRSnF2Rkd4SmljYVdXS0p2?=
 =?utf-8?B?YllDQ0xWQ1JrNU1SNE94NFd4eWFwcy9UM0VGWkhyblhrRTNaVlRxRkZDb0NK?=
 =?utf-8?B?RWp5eFlmeDZGTHVSR1VQWWxoYS9QSXlYR3lXcHdNWUFHdnVoaFRLaUJwcGt5?=
 =?utf-8?B?YWY4THNRaU84aXVyV3hSUlFPSlliK2I4ZFhkT0JSZ3VOaVB4RUloZFZUM0lr?=
 =?utf-8?B?dTVBdUpBTTFhZEhENGk4UGxRajFkUFMvNXN1aERIeXM2U01NUTBGSkZ4MDVQ?=
 =?utf-8?B?Z3YvT0dCeUFCZ1ZtMEZEQy9RcndCU3VPZWlXMENMa3I0RXl2N1hLTHArNmFo?=
 =?utf-8?B?aUJkd0JCQlJaN3VWSXhFMEp4RDQvMUZob0hhNzFmMUVWbFllbFVodGdVeStv?=
 =?utf-8?B?QnpsdCtWQnZlTUkrRXRZUWd5U2FWb1FwVHFKWjZpRHZRSUoyMnZsVDdSY2dP?=
 =?utf-8?B?cldXSkF0THVpdHhzMkZZR0t6Y2JQSEhyVTNNV0czVkZzaVN2cDF1bmxpbEtw?=
 =?utf-8?B?OHBHNUg5RWdJZzFXaGxNNmlpNWt5WjhTMFVNM3gvMDl5WWg2b0MxcmNWZHV4?=
 =?utf-8?B?SmlRM0FlblZqeW5LL3FYWUVMZ2RSWGpXS0FIUVhldkpBeE1VTklzWncyNzRM?=
 =?utf-8?B?VmMvQmY3Vk4yWFN6eUJzd3pxTG82TGFXTEpyUFVFTkt2OXF1NlczSDZKdEpl?=
 =?utf-8?B?UXBxcFV2Lzc2TDBxZ1BrNElEdW9CZTY3Yzd4OUlFV05vdjVDK2FlNkJCNHBK?=
 =?utf-8?B?cWphY0pLQXBiMVNNQTZXeEdDQVErRzVJZVEzRm5SbU5JREpwT05BQUJkOEVS?=
 =?utf-8?B?Qm1hKzMzMkdTeUJzYW5EUXliVHUvdzRiSEV4SUFCcEZnV2R3RmNOTnAraEEx?=
 =?utf-8?Q?4rT3zugHyOHISIftjnk8ky43S/FDYoyPKw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b380ae-fda8-4e3e-66be-08d892db3c95
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:49:18.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91/6fGrPlhAGPEOE2GnJC0r87denRCClNMfdQ7p4vVgDpFpi2uOy0ye7NlLHgCwXONey0LbEuteio4+y2wNvtjnB1VHXnrfeGyaIGAFvVyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------4FFB84CD85BE6EFF9910507D"
Content-Language: en-US

--------------4FFB84CD85BE6EFF9910507D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 1:03 p.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.6.3:
>
> - No longer loose characters when decoding incorrect
>    percent-sequences (like %e2%82%f8). All non-decodable
>    percent-sequences are now preserved.
> - Provide x86 Windows wheels.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-yarl_1.6.2.bb => python3-yarl_1.6.3.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yarl_1.6.2.bb => python3-yarl_1.6.3.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
> index dbb5d23bd2..01682a46d4 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
>
> -SRC_URI[md5sum] = "65c3346f694e37f45045f4e29a60d280"
> -SRC_URI[sha256sum] = "c45b49b59a5724869899798e1bbd447ac486215269511d3b76b4c235a1b766b6"
> +SRC_URI[sha256sum] = "8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10"
>
>   SRC_URI += " \
>       file://run-ptest \
> --
> 2.17.1
>
>
> 
>

--------------4FFB84CD85BE6EFF9910507D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 1:03 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126180347.13763-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.6.3:

- No longer loose characters when decoding incorrect
  percent-sequences (like %e2%82%f8). All non-decodable
  percent-sequences are now preserved.
- Provide x86 Windows wheels.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126180347.13763-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-yarl_1.6.2.bb =&gt; python3-yarl_1.6.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.6.2.bb =&gt; python3-yarl_1.6.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
index dbb5d23bd2..01682a46d4 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/yarl/">&quot;https://github.com/aio-libs/yarl/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b">&quot;file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b&quot;</a>

-SRC_URI[md5sum] = &quot;65c3346f694e37f45045f4e29a60d280&quot;
-SRC_URI[sha256sum] = &quot;c45b49b59a5724869899798e1bbd447ac486215269511d3b76b4c235a1b766b6&quot;
+SRC_URI[sha256sum] = &quot;8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10&quot;

 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4FFB84CD85BE6EFF9910507D--

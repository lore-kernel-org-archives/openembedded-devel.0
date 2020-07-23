Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.84])
 by mx.groups.io with SMTP id smtpd.web11.2302.1595522852010086733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HrqgggLH;
 spf=pass (domain: windriver.com, ip: 40.107.94.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmzK14GHp9XXKYn6jAlBB9HEkuPtr1UUNge/NdBJKciA8+P5dIKjUnwSJQFAcLU3RVzuAl0aL74fxS/TxAZ6ub7N0JtRfLr6fy2GwEFupKeQVED4Ps360XgW3v/CG8CTXq9hYQGOtgdUxnRMBNq/GlUs9DUge7yGvIwbIZDWtQ/zfj0SHQHcRRvrgQ9C2d84zsb6IWVoPYik4+Ce5BYm643JgYJFGaYl55fXvg51i7XWPl9HX/BpmaHEKViNRN9pV/GAZ6Oytyo7pX5qQKatGiU1wUB/9VRRAlSMBgJQMf2nl2XC1huukUmKTTQRuqBL2yS4kd5cZtQSX6QxF5NvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajVqkW7syE9BgTotFgZTH0ttQC9EHomynLmNjGVrN7w=;
 b=H5zNZ/9tTk0+binMNOaDLp1oIMHS3yyStnvqHyBPK/CVXV6BtQ8vHBTawyR1YrYUOT/hVETL0J0nHCjkKT/EtMoiyUG+sfeUarPKTTsSvaeBXbl0nJ6EPYRQJyglX4yTnwJThLaANXH15hYSKN9bkdkdAHzdwreLvrPBUSaJxcQh1vAU43fHPrvtCIi7Ya5kh0UjbLEtIbMBfrk5u2KPGPAWmsyAQpC7Am/YWnTBgWIuDAJonnbXy1d/5jb63M77y/zhN+xkn/EBmQSZ1WPSjkxeIbaFZntZnRxFmiUhAMgCQ3KjbvXleKUt+nNdPkEBCJNHxMsFpEo8Yo5+NACzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajVqkW7syE9BgTotFgZTH0ttQC9EHomynLmNjGVrN7w=;
 b=HrqgggLH0ruMefpFjQVKaZpaYyc3iG5Nz5cLqh2dgtC3FT+lWySMVOmzPFFb/f6VQ7tjzlq5Woro3uj/99J1FWXuuYxDH4eO+vcjwJ7iduWNG9Vv/ZmbacdqvEKeKvCH90risxlnBZAF2ykMSACO8dUs8WuzrsYbQddLcqkbsuU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:47:30 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:47:30 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-simplejson: Upgrade 3.17.0 -> 3.17.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
 <20200722104905.15499-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fbf0b6db-a96f-6842-0b54-eae8c0b2796f@windriver.com>
Date: Thu, 23 Jul 2020 12:47:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 16:47:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a2fe918-b2f2-49c6-8dec-08d82f281710
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB413182DDFBB7A6BE64E2FB449F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	loedSpom3GGAanDRpwMyxVjSUBMNQ7DbNL+DcQMrz5E41vzigRjpX4klUBfE4KjD8WyTeVxSojRjNQQOKOyzbJJB1H6bX7KOpjbnb9HxO1T5BB6sTwbll1W2K2HPMawixBCo3ysSH2w1/n9BmTFGBJN0QzkUwsh3AiNUdr/HT98qfDX0d3o5auUqWfAwX4jHXlC9sLF4yzMl0RrqPfqewaUpAKdhQUSkftLkTdENSgiHz5d30aXmyFKsztv04q5/uslDgaO4QsD69ZxNQaT/90cZfShhR3fo6oXRwtms7ge8H2Ak85q15k8J8hI5xPV/v4CY4TkdMHlVH/YpGiIOgnRpAp3VsAB3qKmRYVdS5gHiuRHFBht3xdsRPXlY3G5tmFKBmhy39M2Q9GPksmzrJt6UwfBvlkc3YsNDnCWIXvI43lj2KEcHS5BqtFrfDcohlAI/IlmUjpN3fH+AJFR0Im6HCs+jXQCSqcwSCNK/Iqs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(19273905006)(66476007)(31696002)(86362001)(166002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LyUCp4WJfcsZqJi2UdbPxi1ErWUsNWlTcDbd5ltFXr8nMPI8ulkv9LI0AqEOiGobBc/0+HSTT47bDFpIsRiq5wEsx4BAsz/vITavAtWQ1hA3CPs04dYmoAojfmNx6dRBRJUsVCxsrJNJhYFCIGGujWQJJa/iqM9PdpmRC0qqC86lKkDtgGDczZTzuu1UBpuuGlyWhDwre5O3jPkXKEd5JVM1QxHukvNUGyNUuKg0ZTdP6UO7dnpseddVnoi/K2nGgBWq8cLl9T7IgFZfJA/D9p1uDWdSu73kZtyaBUF2G43gJ1jseFIk30hNYhRhfEA/No/1L7F/gR7KaHePUPq95x3eu9KsFao7MbfwVC7XieYmuF0zkM2JzbNHDEWODG1RinyjCdUCXmKwh/OZUbQ82n/y6qByh0yEFdUR3tJ4TtvVypRcJLQvNqPfwEAGU+IHRmlRfjUq4z21AsqPd7qeSAVd+15DgHBxDN+5mw753QA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2fe918-b2f2-49c6-8dec-08d82f281710
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:47:30.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eXnlq9KY4iEuTO13VWoB4eAHEcwFGN0otMBSD7nlGKi5soXEFV5G4v5z+olcexOwK3mPr1P6XPYSZXfbXXwAalEpnrkHRapDUWE61wnJME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------49DC1AE57611CBB48DADD439"
Content-Language: en-US

--------------49DC1AE57611CBB48DADD439
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:49 AM, Leon Anavi wrote:
> Upgrade to release 3.17.2:
>
> * Added arm64 to build matrix and reintroduced
>    manylinux wheels
> * No more bdist_wininst builds per PEP 527
> * Minor grammatical issue fixed in README
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-simplejson_3.17.0.bb => python3-simplejson_3.17.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.0.bb => python3-simplejson_3.17.2.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
> rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
> index b76ae5299..cab0da6a1 100644
> --- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
>   
> -SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
> -SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
> +SRC_URI[md5sum] = "27fba3bc75a32318bd3b163b8a31aa7e"
> +SRC_URI[sha256sum] = "75ecc79f26d99222a084fbdd1ce5aad3ac3a8bd535cd9059528452da38b68841"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------49DC1AE57611CBB48DADD439
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722104905.15499-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.17.2:

* Added arm64 to build matrix and reintroduced
  manylinux wheels
* No more bdist_wininst builds per PEP 527
* Minor grammatical issue fixed in README

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722104905.15499-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-simplejson_3.17.0.bb =&gt; python3-simplejson_3.17.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.0.bb =&gt; python3-simplejson_3.17.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
index b76ae5299..cab0da6a1 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://cheeseshop.python.org/pypi/simplejson">&quot;http://cheeseshop.python.org/pypi/simplejson&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e">&quot;file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e&quot;</a>
 
-SRC_URI[md5sum] = &quot;8a5ed75c367b90fedc3d685742e2a1c7&quot;
-SRC_URI[sha256sum] = &quot;2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81&quot;
&#43;SRC_URI[md5sum] = &quot;27fba3bc75a32318bd3b163b8a31aa7e&quot;
&#43;SRC_URI[sha256sum] = &quot;75ecc79f26d99222a084fbdd1ce5aad3ac3a8bd535cd9059528452da38b68841&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------49DC1AE57611CBB48DADD439--

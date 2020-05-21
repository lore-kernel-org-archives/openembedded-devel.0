Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.40])
 by mx.groups.io with SMTP id smtpd.web12.2297.1590098409331375249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 15:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ys15RVyj;
 spf=pass (domain: windriver.com, ip: 40.107.69.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EACAKt0B3mcl3syOdG0ZPVx0mqJ6JR7PgOecP7Ur8moRAJ2xz4vahFnVYIsW+Wkv8VzRJaiDw5hz4G5XLXr9szwxfQ9zBLetrPTiqKn3l5VOkImsgjPEQax54Qng0rdIE5nsr8XHykeAZ7VdQHhltrOenL6mHTnQfeZpAv4R85wJtyXsiB8OUOmt1f8iGIoefL27G3Lskii2kKICDTu9bCZ0DlSaqO55trKS7xOVzrOSE1Q+BPDuTzmFLy0dq0iFUOQyH3BDqfn8s9BHPDvCeQ3bpdNwL9fMuzut7cHRDqaL2k5HK7Rp042wJEaLdCeiQLiyRbqUBdqNyY9D7uzVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwnFoa1ZxlbRlDBY/uDepx78LhAJAC/FcOvoRFA2jSg=;
 b=fNWpOdhrkOv0zZQn2w7RByN+n7L1iJO7LbQd8gYtZnjwfEDyE4q7M3l3Wij34SdI7E/dzyvO30mEc4UPXXDSGIYgxB9yel5PhmnRU6/MTsPXxjsyUGs5BbixqMsYQiM7uZluXor38qeXtmuLttxu8FuhiMoiyKykdMy5nIjLrCClhIPG3ce96vBhk0kkaIyqHi3aTTYY9pGRv0WescPu6hniDfJSPSckxkzt2BPAB73WB0FpUkGAFvUWQl5AJcgys9RuBgg+tJSPgynEZD+e8CjCU7xyfkk2M0KuZ3ciR1/pPJhlF+aOhZo+HEz49OxfeyQ58/1AhokzH+Bb1bXEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwnFoa1ZxlbRlDBY/uDepx78LhAJAC/FcOvoRFA2jSg=;
 b=Ys15RVyjKXAgJ1gVRzzwxA5WFrrP7m+qMdfb4/y0OgecoUKJEyXOtmXltOjGgpH8QwJ1B3kQNRvsbTsBpUjNCkRq6UvRP1/P/n3tC3vwllU+jDfyRQgCyzGfFHVXJPT5eNeiXXshG/5FIHiKRKRRI/IgnOBCk5gANusY7SQgyNM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1265.namprd11.prod.outlook.com (2603:10b6:404:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 21 May
 2020 22:00:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 22:00:08 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pycparser: upgrade 2.19 -> 2.20
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1590057006-40833-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d6897895-36a0-a535-42fc-ba2bd623dfdb@windriver.com>
Date: Thu, 21 May 2020 18:00:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1590057006-40833-1-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25 via Frontend Transport; Thu, 21 May 2020 22:00:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c690d15b-ac5d-4f81-7393-08d7fdd2535d
X-MS-TrafficTypeDiagnostic: BN6PR11MB1265:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1265BB62B12B4117574AE2EF9FB70@BN6PR11MB1265.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gzegwMlMPFTY5tOry4/RC2yGVqiLHcH/JAVTdmvYOHG+PFKiHek+QJjmhIJ3AmNQIN8eaJkgxnJQZFkKDsWgraLQQdehVuutfRYnXgcQGOmh/DdnkTC4nBO0MPec7p1EEHWF1aeVfJ6Ujge5SC0orSw726cW4w58toyLQJXTWjPDUzCVsamw+gYTZDbd/WyS1Dxlz70ED9JwB7O/3lzfmWpDH4Yqn9YTZCVXSLq6linSvLxyurq161Tw2FEAnPvhAAWYyGGkkXtDWAAn52qX0lR1O7P2srTq+ti0EU2proyYkro4VZJ+Jld8X+ylT+bNREEr1Bv5Ptvgyy62aW7fZNGNdIhcBOEebD5xH6Pz3JKTYuK2xTUfTlSFqEXe1qoRMoyf4gdcjpfNEo8f8/ITQ8p9V7H9AoLi0fr0bZNjqDkgTsaus5fNQ96bJjc6rXAQfKxGY0Bimh2cBKFPEDAXPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(376002)(396003)(39850400004)(66476007)(16576012)(2616005)(6486002)(52116002)(66556008)(966005)(956004)(36756003)(44832011)(316002)(166002)(31696002)(8676002)(2906002)(478600001)(33964004)(86362001)(5660300002)(53546011)(66946007)(16526019)(186003)(26005)(31686004)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZhtdjhA51JRz3DlKh3ZoM+3+R7Uw4PanfjANeSSYIFAahk6HMcbYXKTYoKtRGCf9iy0TrSFkBHChJinxrArCZLfONv4KuXePs6Kif/fSo1eqN3hTnHjH4eQNr/iE9tjgQRDXwOgfXmSf2uPqAGBoMT0+T1myvQmRla4F8zUvPcLYIjRxImVRv1o17kfDNVLBVllezMLqmqgxrFCCIij3okAOHr+l9Vt7y8GjYOK4oJCjL+UQDdFFzLQmlUl2eGrfuyYsxgnl5VxSmwu72hw+MxxPgsNS+8zaXh3GAp2QebImL77+azkmv8SHH5cjyKcdRLXDKTmYVaUEXlyDFZ6nVZx+dOBxi6IV5Lr8BWG5RAId+fP9R6ql+idKObNrmKLIc4Z9TFnQXoICnpdIjPvv2VBBV7cRECwi5vA2K54nOzfoLDneU1eZS/CYrl6TQ9iyqhwyo+khgHNPvEEVrQdJoGEQa9OI0QoBJIFRF7sN9oyCLA5/LUCr07fenvxCVv/+
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c690d15b-ac5d-4f81-7393-08d7fdd2535d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 22:00:08.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Li+hUSSwGSil+gceHj20FKBWvrHbJ3LBPvdnyipaqLp1EYcyXVmlvvd5IqaVYCGm00yHHVTGTgRmRA7ox4KQWBUKpvWtm5KgzDCe3DZ2/Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1265
Content-Type: multipart/alternative;
 boundary="------------0070D78B6F822A22D037E576"
Content-Language: en-US

--------------0070D78B6F822A22D037E576
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/20 6:30 AM, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
> rename to meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
> index 35ed93e09b..2a5f414b2f 100644
> --- a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
>   
> -SRC_URI[md5sum] = "76396762adc3fa769c83d8e202d36b6f"
> -SRC_URI[sha256sum] = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3"
> +SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
> +SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------0070D78B6F822A22D037E576
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/20 6:30 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1590057006-40833-1-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1590057006-40833-1-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pycparser_2.19.bb =&gt; python3-pycparser_2.20.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb =&gt; python3-pycparser_2.20.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
rename to meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
index 35ed93e09b..2a5f414b2f 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eliben/pycparser">&quot;https://github.com/eliben/pycparser&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169">&quot;file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169&quot;</a>
 
-SRC_URI[md5sum] = &quot;76396762adc3fa769c83d8e202d36b6f&quot;
-SRC_URI[sha256sum] = &quot;a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3&quot;
&#43;SRC_URI[md5sum] = &quot;b8f88de737db8c346ee8d31c07c7a25a&quot;
&#43;SRC_URI[sha256sum] = &quot;2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0070D78B6F822A22D037E576--

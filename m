Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.68])
 by mx.groups.io with SMTP id smtpd.web10.34366.1613999983130494546
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=af3AFO6M;
 spf=pass (domain: windriver.com, ip: 40.107.92.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIDaYNd09ANKoLN0JbaAIP0jfAM/8xGVs+xAsIZrldpplxa413Wfxj9Xqeio+4YlLhe+aD4pRMbUCLnJTjCaPycqXc9A5KnL48y5grEnasptynAhkddNq3/6Rz6wQX+Y9L6MHZXLcin3QBKjnwrTZ8nqlfuKZlZIbUTBjK9EwTbroB3bgqKXisORdvonVMt+vfenafFAOVpLfOpoXLGrbXaZAhDj88fS1S0MMYHXOmWfFoU7SYYZpdpJWbnu0eE5SeoVv9hpSYYfmn+nLmNijzpdpG1n9FYXN5Ef0evJvRbFg7z8SBJQWyX0kLWmXsxD+p04/+c4Re+4aj9+nZ7FSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5NFaEKR+22EAd451DDocpRQJYiYZUO0GIqW1aOcpsA=;
 b=TMexKmkB66XWJnt6+8qPUxNIR4v0ksYy9nv/PHY1Q8KaB+qEN/wvcOzdHzaMlMpK6qR2pGINyriwF4VUTKk2vNxwDxoFPYYoz9/7qgMFMJFuvdJk4LRiZp2bq7ht7FHH1EsfJTSukRQzkqaJYC6n4xK4eyDC7nJAm34mDJ4ivQiFH4xX/naLKM/RzC/7BvPKzXWeHEpPPL96xOPvirkSK8NkWWaC07bi4FZCd2RMsV9rxZ7GOp/RxluY94w3fsfDRtmR9w8yeSRP9O/U9BToXBCtB+o0QHaPj/oAOSFtZ4UTdTxQbin+16JXORvgzPRf0KGP7mzcBKwfI5OWhYtyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5NFaEKR+22EAd451DDocpRQJYiYZUO0GIqW1aOcpsA=;
 b=af3AFO6MCaZEC/BKOYFCEmuaTzJgUEjcP/HchI66ushccjNGV9ne4ATgSJuv3Xfgxa4ShkS8+dU53vo3/UfQ67HAHUMRMS3EKZIy12vnE+Cfzwstq7yegD05/K/1xmtr2mrDpVEqB/R40sO64L4VFVjNkz5Sux364cbAhM6v+7k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:19:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:19:41 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-astroid: update to 2.5
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215611.2368885-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6d9e5077-3666-c47e-515f-06965af8e005@windriver.com>
Date: Mon, 22 Feb 2021 08:19:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215611.2368885-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0457.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0457.namprd13.prod.outlook.com (2603:10b6:208:2c4::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.12 via Frontend Transport; Mon, 22 Feb 2021 13:19:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e69efd53-df2d-4c2f-2f7a-08d8d7348359
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3893819BF6797523D4FBE9429F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y9Nyq6r9Y66iE7irZSkyz1AsKBGTyRdbxrtaBroXVVoEpnJiUsu1e5KYsEepF4s1qE4hFD1c7q4kl2hVAwBNJEoT3QX2fBmOClPCFSNr0XsauwQdBvxPAIG2pjKqNnJMUMgnhNFCiMuGcasmAdhYSa++b99DzjOnmk1rKZS6mVk1m1SYRLid5lpwudY0fEEWTV7AqZLChjhIRoda09afw2lIfRZ1HOE/+09szNludIOqkAyfoOBQxba18NLCCwYiWdjGQJ7GKs1o1wW4FYvXJlumQ2tIJ0omRBSq0NdLfkGTEAA4VIlFe5uPWJoPkkZUiu9sv43F99PnvbQKccDxHDs5x3B0ig3kc4pDJxa6FcjfgIljXmqAy4C3C90Df+AupsTWhtG2y1eqptzR/+RDyMJ7QpsLvFux5hIG4VvruxllIvYQNShKDgeccGhX/Slak2ZmqMTOAi1g8FK6hiW8k0X41XZKJv7P90xNJgfHldNUFgbS6zeuoFjZ3hXbO8AYkN3YixECnw24HB+QYgxa87UjQopiLAUVmAPQTwlULjbaY7PBo5yFJdxblMXDXT1Kr/JQ24ie8URfVoEJHQMekedrCNPoswyGxanZBl6lREWnH89a1G0QWDoBwXE8NHJDufb/TAO1d06gELwtHAJgaGBmBzbSPF7iEP7+g4M15xS4DKRv/lzxNclmmvQuQkQo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NGlocGY1UnZaQnRTbkpYK09JMU1wRE50aEc3RGZKNlI2bGZqRjhsVm5uMGJk?=
 =?utf-8?B?dENSSWdwSE14WC9CUWl1NFpjbzdTUUpSSVFHQUltdHR2T3U0YStSY2pWUU05?=
 =?utf-8?B?L0xXWmNsbTNhMXNhcm4rdnNpenBZZ2VRM3VoaXF6K0hFZ3BpblFUZlRDUm81?=
 =?utf-8?B?dGhnWWg3ekpFSjlzN3FVeWh5dWJ3aGFvckxVY1ZnZFlHR3hPeDg0aFd3ZEtn?=
 =?utf-8?B?K2lnUjUyVzk4R1E5WjNvQWs3aU5HQ2xwdXB0L2s3bWlPSEZjSE16bG9halB5?=
 =?utf-8?B?aWZmWm9HakpQWHNPU0IzclExRVM4VFJPeXczWkx6UUhtb0d6OVJMaW0vODdX?=
 =?utf-8?B?MXJFdXJjcHVJWnFqUGh1OFVZZmFOUHJESnpBM3JtT0VOeCttSkhKdXl0VVVO?=
 =?utf-8?B?THYrbW00aU8wZlR6UVNCSmpCMjRvZXlxT2VldmRsUDlOTlNnRU1hSGMwNGJz?=
 =?utf-8?B?NlUreGMzanpRUmhYaDRsME42V3RJSHlQUFhrRnhwUHBHTTBjMTRrSTNsZ0Fi?=
 =?utf-8?B?VzBjVllIbVVBdHZ5M2lFZkM0TVVCV3h0d2VnQ1kwOWdNemxIUHhzZkJhVUV2?=
 =?utf-8?B?a0FCSFFOWVJOQ1JCSmVCcGxEcUJQVk9uWVFMbDB3Z3A4am5BdFNEb0tTQkpU?=
 =?utf-8?B?Uzk0aWJaWE9JeHROckVkbGJlNGlvUkUrdXBHVmhacWtOZmxMWnpuUUdZejVl?=
 =?utf-8?B?WXZSbG9WeEhsOXJpeUpWTUM5QjdvVE5BRmtHaURQK0E0NzdUNGM5QlJJWEVR?=
 =?utf-8?B?M09HZjFFckdJK1ZLYzJITXozWVJTMmNBbXErK0lYQ3ZkN2JQUmlZR2pWS0NP?=
 =?utf-8?B?VC9jSGhQQW5zM0t0TzJ1Q3VleWxrbWNRajI5NzBpOGZkb1doRFlrbzNpVm56?=
 =?utf-8?B?VG93R3JhbjVPNjRZK2t4M1lKeXpzMWNqY24vTmcvbXNJcEpMMVJMbUFFa1Qv?=
 =?utf-8?B?b2VLSE1ML2FINUthTllVM3EvVHRpU0FTQ1VMVWUzVWc5SDVtL1VLbXk4MndZ?=
 =?utf-8?B?dEQxY3JOTUVzVklQYVdxUXlzb2UyOUFJbHpIRC90RXg0dVFKN0lSZjJ1L0FL?=
 =?utf-8?B?SndMQkJNdnBVeWFYQ2JCOWNLM3VsZmRmVWZYWlZxU2FCaktXSEFlbytnUzJE?=
 =?utf-8?B?N3FKa0k4THFzNUJpM2FMN1k3NTRtSnh3MnZJVEFqcWVWVEZ1cDJBNnU2b3JJ?=
 =?utf-8?B?dDBFUmo1MFArNXdSUWx3QzkxMWVmazlRaU1GZDM3d0FVTCtWYWdadWtoUHJ3?=
 =?utf-8?B?RTZyalFrcDdvKytNYVFkZHhRU3pHV3VLSlZ4NElDd013NFdvVmtwanRmcUVx?=
 =?utf-8?B?N0Q4a0htSXA1ejhwRkQ0Mi9qdXlKYTlLRUFBUlRldzEwMGhZTDViKzhYaS9l?=
 =?utf-8?B?Y3BVMG5ZTXBDZjFtblRBWnVSeStWME9pUHFDWGE1WXFpL3RaV3drK2REUnZL?=
 =?utf-8?B?dERKTnBPSjAyRXV2RXpMUmEya0RSNXVvL3VyNTZFWU9VS1pwSmJXWXYwZElE?=
 =?utf-8?B?NjV4UmxHdG9ISUh4eFJBRXFwYkJEZkdCcmMweWRSZUlDdUhQaityMjQ0T0FP?=
 =?utf-8?B?dWNGUDlKTWFaZXJhNG14Q1NnNlZlRU9XV3QxQUJKbTgvWFJsQVJaM3lpalZq?=
 =?utf-8?B?YU9JczNwTFVzWnVOdFRUcUJ4YW5CWDFVRWg5dFJvMzR4Sks1ZktDWGdSY2x0?=
 =?utf-8?B?Z0pwN29qVC92ekxHdTZBN215a1N3SGQxN2xaQlBiSWlSYXRmeEhncWFYditC?=
 =?utf-8?Q?9ia9l1gZSe+zVsX0gFCmhZc/4gYXDvwYR8fAnrU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69efd53-df2d-4c2f-2f7a-08d8d7348359
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:19:41.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpjAOvP1ShwuLPmQhpyPo1uF12cZ8wliv+YG9H1wvWSkuywMvLcj+c/CnOvpWeoUqx0vaknrxC7qdGI4mgkBsR/F4pTJWIHpBJpayD9kAyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------5534FFEF17EB747BF8F6C598"
Content-Language: en-US

--------------5534FFEF17EB747BF8F6C598
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:56 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-astroid_2.4.2.bb => python3-astroid_2.5.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-astroid_2.4.2.bb => python3-astroid_2.5.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-astroid_2.5.bb
> index 677cec7ac..f69d85015 100644
> --- a/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
> @@ -4,8 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRC_URI[md5sum] = "b54e1325995d3a9abd84bac91d4d5867"
> -SRC_URI[sha256sum] = "2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703"
> +SRC_URI[sha256sum] = "b31c92f545517dcc452f284bc9c044050862fbe6d93d2b3de4a215a6b384bf0d"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------5534FFEF17EB747BF8F6C598
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:56 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215611.2368885-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215611.2368885-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-astroid_2.4.2.bb =&gt; python3-astroid_2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.4.2.bb =&gt; python3-astroid_2.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.bb
index 677cec7ac..f69d85015 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
@@ -4,8 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;LGPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe">&quot;file://COPYING;md5=751419260aa954499f7abaabaa882bbe&quot;</a>

-SRC_URI[md5sum] = &quot;b54e1325995d3a9abd84bac91d4d5867&quot;
-SRC_URI[sha256sum] = &quot;2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703&quot;
+SRC_URI[sha256sum] = &quot;b31c92f545517dcc452f284bc9c044050862fbe6d93d2b3de4a215a6b384bf0d&quot;

 inherit pypi setuptools3

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5534FFEF17EB747BF8F6C598--

Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.72])
 by mx.groups.io with SMTP id smtpd.web12.2175.1591114404047564913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 09:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EfMAVmQ4;
 spf=pass (domain: windriver.com, ip: 40.107.236.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czHrtJglbymiFXJWpNfLquVyLKiFKRFd2Cf1sVjxuxAFFKt7M1q/kRtiRuVZIqIZLmrBAdiCdliUAMQ6wrPvcC7hYgPNmgFJfYWh/f4yqFMIqGvNIp/5GRea70Iy9pDX6/1ekPXZovUWQjVFdBn/0VWVjbE7eMzHiT/fuSDJgrpZ67Gsce7hiJNwcfj4Sx7IQcIUpNyQHGsWUeFqhAqd1omombqgCD14S0f0sODtKhAceXraObDH3IlH4yx3mSrCGrW6kEd0oUQWnd3g9a5J/SbGnyoFvviCLNFVZF06o02VKgBormcvKUt6pYm8jgQ4OHe6b7UniE177BwObDaw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMCWWC6artoGkZf0RqTkQbkUY4kdVU1Trt+00SWpet4=;
 b=f+jr1XVzZXRtc5p94whEH3eY68SVJ31Y0Jr4NmTaA4Q90wW6Osglp122cFpSRH7JDdgzz/Uli1XkRY6Zc7xs9pGOs0+jtJmh284XrvSG2QqAadxCJf13Nx9UMW2aXh3H2NE8gG1JX9BTJsk5SskmB1BdvScOsv6qW8DvQGhkzofULp+npVhRrd1lF71joQOoS1vGOgRuBZz/b9AdEOheTRQP+uyr7QiiNri/82v+jxfOnvTJYOVmePMU7YN1vKJ37X849+PqtUCUUQk8c0f9Ja7KuNLJ6yBVcVu2kQjc4SB/shIqIxfJV2i4HmQ3KC3Ly8UVq/qtkxiMcXp8NrMQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMCWWC6artoGkZf0RqTkQbkUY4kdVU1Trt+00SWpet4=;
 b=EfMAVmQ4mPzaEa+0sOs/YP0TlBLDD+PCP07KwNCkyE0BqcgSEZtHqIiKp09FkzHlwmTRinNp03Ah38zPovCQcxqB4/WCOYRVBTvvNkaz/dGALFWOYjS41s1R9GK5kRFbIoqYSK2ZPHt0daJ9ExGQuYAY4vPlHLqJFbCi2shW4WE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3922.namprd11.prod.outlook.com (2603:10b6:405:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 16:13:22 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:13:22 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-gast: Upgrade 0.2.2 -> 0.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200601130531.27509-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2edfd6e8-7c43-c7e7-42d6-bc41303fd429@windriver.com>
Date: Tue, 2 Jun 2020 12:13:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200601130531.27509-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::12) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 16:13:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38bc0952-21f4-4135-14b8-08d8070fdef1
X-MS-TrafficTypeDiagnostic: BN6PR11MB3922:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3922C71C87CD7941E5E5FE149F8B0@BN6PR11MB3922.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cvuA+NYXchdaKzAbE7VNJaGY2AHbNr7o+f75GzbkjD4yQIzYCPiK/ivFnbUfFa6aKKyuat/Cm43rL0BQAiCCzG7pwgFcHJOFcbov565UIg9m2mviCWsCJ1uMzzvuPCrHs9L3KKTpKBS/HLRSxwYib6WNdFQwmQ5PyE6AXdadd7CWghXDsyuHgbolkfFlleUzm1FCLnK2I6rOLfxKpymULF/6bvGl75koOtTd2c57XLKsqaS/q0jp9KNDj9z/G9fpyTxSzGUYXAEtp6CmvyzkhanQUoPC/Z1cYSnre1F5qSD0PvQCV5sEQZ5+u7NweI3WmVJPbS2guwh3PXs2Kq7q6y6njoq7+3e/JUtDG+okHDR64T8rjbeMWDR3SSoNDaX6LBKifnUNQ54HSttfwGVGPpNVp7WWFt9r1hOaxx1qRYrvo/F0vEo6+Cz16v8T4IIxNWaHNUDalHkbzCF+8koxdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(346002)(366004)(376002)(136003)(8676002)(966005)(31696002)(83380400001)(166002)(52116002)(36756003)(478600001)(316002)(8936002)(86362001)(6486002)(44832011)(2616005)(31686004)(956004)(66556008)(5660300002)(16576012)(16526019)(53546011)(66476007)(66946007)(33964004)(2906002)(26005)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0WOh7yAY7beJMtAw+FyNT2cdn3P0Vg+EPxhAVeKppoPZMgeQEIFi8CW7aqvQ/EsMHp5H4RaJNSIFfOorW81kj8YScyktqUmmn4RTSeF15F6zVlSEGbvmCVJkRlUVXI6c4zfGvQebNsPH7k6A2ZgbG06uyBIRC5FwbTT85R7gRYlzfBK8zvGsMyZdpRW0yYZQ6hB7CO0jgtMpUFOhd2u3qJCT6a4cLxv2Dko0Rox19Np/w4MS9+6t+PBpTXQJ496pq1Nve0wMwvrJ9NeBHZpdDVpdgoWjYfgUAmcsdXqQNnrNYl2l5p9PQrQSuq0TCndAYpKgl2Djl9eEGJgKKXC7XI3WNAOZE38QIBbA23J/UwpYHnxflldERV4Dwr/7FeTHRSwT58aL5FphXykUouEHVUmuSR3VoWDyrM7UwOBF2DWi9jAob55B0BrbFZh6G4vEhNLWhjhSdQWeZwfNe+V+79z1DARwETt/ZyafnOydyEQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bc0952-21f4-4135-14b8-08d8070fdef1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:13:22.2294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxqfBkSBEQYb2nq98wtMnLOZuh/0ZX8ZAnUHucO5EaR/7b7WdIlMxezKU+Mo6JXiSUivLtzJ7JLcbOLYfv3guTT0SKEoKOPxBtZkxrce9Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3922
Content-Type: multipart/alternative;
 boundary="------------F72979339CD99DB03F6AC368"
Content-Language: en-US

--------------F72979339CD99DB03F6AC368
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/20 9:05 AM, Leon Anavi wrote:
> Upgrade to release 0.3.3.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-gast_0.2.2.bb => python3-gast_0.3.3.bb}      | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gast_0.2.2.bb => python3-gast_0.3.3.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gast_0.2.2.bb b/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
> index 6e08a1994..9d24ddc3e 100644
> --- a/meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
> @@ -4,11 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
>   
> -SRC_URI = "git://github.com/serge-sans-paille/gast.git"
> -SRCREV ?= "ed82e2a507505c6b18eb665d3738b6c0602da5e7"
> +SRC_URI[md5sum] = "213b1820f576db14ed4fdf57efbfa67f"
> +SRC_URI[sha256sum] = "b881ef288a49aa81440d2c5eb8aeefd4c2bb8993d5f50edae7413a85bfdb3b57"
>   
> -inherit setuptools3
> -
> -S = "${WORKDIR}/git"
> +inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native"
>
> 

--------------F72979339CD99DB03F6AC368
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/20 9:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200601130531.27509-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.3.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200601130531.27509-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-gast_0.2.2.bb =&gt; python3-gast_0.3.3.bb}      | 8 &#43;&#43;&#43;-----
 1 file changed, 3 insertions(&#43;), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.2.2.bb =&gt; python3-gast_0.3.3.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.2.2.bb b/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
index 6e08a1994..9d24ddc3e 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
@@ -4,11 &#43;4,9 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90">&quot;file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90&quot;</a>
 
-SRC_URI = &quot;git://github.com/serge-sans-paille/gast.git&quot;
-SRCREV ?= &quot;ed82e2a507505c6b18eb665d3738b6c0602da5e7&quot;
&#43;SRC_URI[md5sum] = &quot;213b1820f576db14ed4fdf57efbfa67f&quot;
&#43;SRC_URI[sha256sum] = &quot;b881ef288a49aa81440d2c5eb8aeefd4c2bb8993d5f50edae7413a85bfdb3b57&quot;
 
-inherit setuptools3
-
-S = &quot;${WORKDIR}/git&quot;
&#43;inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F72979339CD99DB03F6AC368--

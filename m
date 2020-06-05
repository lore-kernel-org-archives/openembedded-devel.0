Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web11.177.1591377989362000726
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HGWM60DO;
 spf=pass (domain: windriver.com, ip: 40.107.220.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJOr9XW+avfj30R09iGvLmpJG+NRGB74huA0X57o1+Paf/IgXs+oSgdr1Dh3QEcbSp05v+RNhtvlnwoRLPJaUBQaia/pLtxkA4BGKtBSDY1LnXsfpWL6OoEVQfRp6DPA/UbCSr89mI6XRppoVM1jNcEH10vpk32oZrOsNtljd+qNmF7l4TKswGgqsELtVKu43JX7aeR9KD0iun+7UDNpaq+9vZi+7cszXvY5B+Rx8F594zS9ggsspB9MlAGi8GJNknS/+32nG0Zm7qqLtYxViWnvIg+oFMAOEo+ZhnQD1Qrvnjflw+TJlmvu1Q17UQkLcBGfkEYVn5LPmTXN3sYVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WWNyfcxMpaALFP0oytiZQ3wWF9zyNRSlS5OCotcZLM=;
 b=UO3G9unWmuf2h+Iz5+sfZc5/sRtyldwbfkxqh3HSdtr1W3BxhcBk41zAIs3fZYYJxyfU7OYrmY2uBr5W7QrNpYa1NlqZJmaxIj/TJkYYU8EHjwkVv/Q9H6Y/hX2IVt2FCeeuafQUovNUOQmfLnIQA0WXBfph3R0jao/3Ehy8/SWj+DXRzJYwJOMxShZFkGXUKdUyw/PFnYzkfaYa7txioVP7Ufcf4FrdGLkh9al+ysEHKfNtvCvrzU0DaeIaoi2mpin3RfhnDpgVYaDPjZOVgM5VPw/+8VyqaoiqEH1pLrirARXHl/XzJ91y2uWL/nG5ZOXiDxr8jqf5eNXd9EwNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WWNyfcxMpaALFP0oytiZQ3wWF9zyNRSlS5OCotcZLM=;
 b=HGWM60DO7M6PgHzuzXo/ujQtzWA4U7vxPVu9HWVs7k1UoFz2d0EszP98D8MdUcdLENOrRp8kKHzcjLtB/YOWIh61Pj3DmzwG0/RUoLoTDWd06pOxjbAlya2RRGu70WRU1UPZAppedZLV/YbbraNjvj3EhHB3T1YVZQYwa6XQR9g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1874.namprd11.prod.outlook.com (2603:10b6:404:107::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Fri, 5 Jun
 2020 17:26:28 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:26:28 +0000
Subject: Re: [oe] [meta-python][PATCH 4/6] python3-requests-futures: Upgrade 0.9.5 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
 <20200604121223.3818-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f7ec7d08-1d95-cda6-4b07-be1a5ea48639@windriver.com>
Date: Fri, 5 Jun 2020 13:26:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604121223.3818-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:26:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26cabdb2-16a1-4665-5b38-08d80975948a
X-MS-TrafficTypeDiagnostic: BN6PR11MB1874:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1874509327C415573814A7B39F860@BN6PR11MB1874.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3AXC5jWKT/MnEQfIQFLI3eYyrhEUlQyt+31LSsdg0VecgyAembj4/i7VkQdwT6OJBPfMMX7GnWZjIEGPYUijmdhGP5PiJehN6V5+ISucIJ37wndeWyqYZeN2aEEaI4PEyWyM776uImt2ahYY6y8QkkILsCa7mOuWSkvl7/p3URpf63lAofxeoIt++9uB0vmyk91UAoCFDBIiF6xYo3aKPVhqABCi5cHmUay7tQXz+4mpiLZS9e+4ik23DK3PErHn6egNSHRxnTnTJbMITQeTNMeP0FDgmlRp2prtlCQhZ57n7DuUyaug+GfzT7LyaMygVaUdxEC7T5ZZXvsGHBnvLl5iOIszzAq/HF9egW7RaoPRkMDK2mSGArlAc5P0SFm/0vontuy4wkFJwaIZTzdvEXNlaLj7rVukztpqe5M4tgz1uxY8YXEyjxz7KYbqdI+p6ikRF84iSF4AA9ongnxnyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39850400004)(2616005)(66476007)(186003)(66946007)(86362001)(16526019)(316002)(16576012)(8936002)(26005)(52116002)(44832011)(6486002)(53546011)(33964004)(956004)(31686004)(8676002)(31696002)(36756003)(2906002)(66556008)(966005)(166002)(83380400001)(5660300002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NBOhzp3EwG3ANayVFd1ZE6YEVEQ377Fj2qoihe4CYoNaihKWssJZ9miHpSPYJaH1q9vnOVaVDwDi3VbHV5OIw48Jp4xJXIrq8To70yflAjZVXyKMb9g8nve1xF00QSDLjftHkSo9yMoQD3fTzxbQfZOvOdeylMBmU6pTKktrGX2GTO+O6bYsyP4Ef4LD/vbnUFrKWOO36L+1Ybg5eoFkQgL1JUUQZeYu1b4osZJQ/khJzMjI6D169B/mtk4rO06kZBt8SZeKB+QO5VcwCn3OauxBUh7SXw/Ml7dcoYZd9VRo/OntqgTg1BQdoJ5TdijKfxw71Snmc/HIBfAgxMYMTV8XlMaHwtZLqSScT1Ki9aaFtBgc45yVSVL8YMtQ/Ammx9zFaS1WXvRBCIsfolpzQcZN7+23PbruWP5YqsBaMGIr4Z5oQ8JQFqxLvGUWI8pyGdUGJ48COp5aHDELs+FNtERRxPi7IE0cYPQsKyEQWOE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cabdb2-16a1-4665-5b38-08d80975948a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:26:28.3312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ec8gjYa5uTdcqc9etFGGikvC10lz4rRd5ZX28U6oneGAv4E91WzJfOhbfYzjcgZuSA9nwz7TgiCVlbVeGZiECBLRTdQZ3LxAKlp71lAuPEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1874
Content-Type: multipart/alternative;
 boundary="------------471244323804A9017BE96B8B"
Content-Language: en-US

--------------471244323804A9017BE96B8B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 1.0.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...sts-futures_0.9.5.bb => python3-requests-futures_1.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-requests-futures_0.9.5.bb => python3-requests-futures_1.0.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
> rename to meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
> index b94929d8c..2372ffa45 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ross/requests-futures"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5"
>   
> -SRC_URI[md5sum] = "e20dc6f063c70888a7f8225e349b6682"
> -SRC_URI[sha256sum] = "33aa8a3b7892850701707d7e094b1e1ce7c4f7a36ff2a1dcc2da4e01a1a00f7e"
> +SRC_URI[md5sum] = "601b5e90413bb00e06148752d31f0cc7"
> +SRC_URI[sha256sum] = "35547502bf1958044716a03a2f47092a89efe8f9789ab0c4c528d9c9c30bc148"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------471244323804A9017BE96B8B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200604121223.3818-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200604121223.3818-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...sts-futures_0.9.5.bb =&gt; python3-requests-futures_1.0.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-futures_0.9.5.bb =&gt; python3-requests-futures_1.0.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
rename to meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
index b94929d8c..2372ffa45 100644
--- a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ross/requests-futures">&quot;https://github.com/ross/requests-futures&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5">&quot;file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5&quot;</a>
 
-SRC_URI[md5sum] = &quot;e20dc6f063c70888a7f8225e349b6682&quot;
-SRC_URI[sha256sum] = &quot;33aa8a3b7892850701707d7e094b1e1ce7c4f7a36ff2a1dcc2da4e01a1a00f7e&quot;
&#43;SRC_URI[md5sum] = &quot;601b5e90413bb00e06148752d31f0cc7&quot;
&#43;SRC_URI[sha256sum] = &quot;35547502bf1958044716a03a2f47092a89efe8f9789ab0c4c528d9c9c30bc148&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------471244323804A9017BE96B8B--

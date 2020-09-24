Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.87])
 by mx.groups.io with SMTP id smtpd.web10.26249.1600976771488406631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ftqOdFu8;
 spf=pass (domain: windriver.com, ip: 40.107.223.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kzd18fl+0RKWvDPVgm4ekoGEZi8b/wKbPKjwMYiN0Ubunk98vlyONgh8rX78dSbI6hymstUDzFXm6T7Bdj5Z0Ff1quAMiduRQqqQ7hxA9iRr5QBwlHuznguKhW57ZDI+/pMcmyKQn4wCjdm9AfaQ85QIHsC54nPgk3ov9Ivd2LqUMx+wxPipKo8jQ7yAoU1y6yrESNngYQYFdODa9/6QGBctA1xvXrUGgEytGpIjt/j40c+Lm8OVA+LiQtQ3kBa8tXy4/zT5a7p+bhoOCzmvcvgDxocDwvI4NBjRLJ8sAk+LdJgtyI/f0OTHRdc+RHaqkznKMM55euyq1x6DhlcZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td6gqZsg+/JdPMB+lQk19azaYFLhwLN8vj2yHHOjEfI=;
 b=gcHRCkDEPbtVAhExUm2/mdEVJxFEGp87qKaLAUCZRXrcDa/WOekdJBNvF5oxKyHFTLkVvs1EVAdV2T2aQlxGkausAOA7ZOtlclu9pdQTCqkI0v2yxdtD086OxsoieGa5HB4lVRU+8YaLiOQH4r2IjjikZSPro7lsLz54SmQEVg5+DRB098tYketfvnUIsk/pM8ynrzLi5l//ZAvfWHZU6mFA1ywiFKlVNtkNEIYQ2BobeD1yGxG9xeNbQ5Ulsrf8NvH4f8uR2G+6SA+R0qMJ0TDhcsVDuBPWf03nhs2Ifq9pGhkmrA0JB4eVr0lnJm8anMzZotvq3jk5gfGAyBrzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td6gqZsg+/JdPMB+lQk19azaYFLhwLN8vj2yHHOjEfI=;
 b=ftqOdFu8Z762Hs/AhNaSIHDP3bxgelgWd/NnjkS4O+8p9uN0LPm7JyK67UVErgOzhjdlnfGbRIFOYDfZ++0ao2KXGkIqkmgOm83kzjnpoUXN4fi1OdPmXQZhQyMQ0073Ef5YolgBjbcb3mWURN2Jkywt9lRROC3QGGPdFuS0ohg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 19:46:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:46:10 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-zipp: Upgrade 3.1.0 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
 <20200923075830.30859-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <abc6aae0-bc25-5234-f06e-227fa770cc32@windriver.com>
Date: Thu, 24 Sep 2020 15:46:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 19:46:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c59534a-b01e-467d-fcde-08d860c27c54
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB283970A2D3CED3B52169BD7E9F390@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6RxCilWP8/28KeIRCVc9ZQRHbAxcmA7hWeU5tOYwAiie8SYB+7TQvZ73RIkoUVwOcyCxLE3ZWlGWX62pBKg43NuKe+xKsE/kt78rzNKRRZK5yi7Hg0jnZro51R11omnqe63ToVN6J6lo0XQQ7EThW3aJymvk28ggW50w7wGbDi1oafSqaLeCU9kN5g6aLuJfTpUH2LlGJxgDTGfWh4/BWskXa6/jV00+DOTUl556CJ61QncgK0DydWEpYnqvVb1IorYCLAik8+ZiEI4n3YdijCJl1g5uevGeI1G9N0Yyi2ZSbrFq26N5CnSqhIhX35rBQYiNePX17pJok22ZBJW830eY2Yg3NKqPQT9yoi1CI+FtQBLyKLASiGjL4QwIAWd6+nL2Bn4HN4ButO76M+Q8apw70li/mL1PVgqw35R15N89vaqXwU2l/6PpeH3zlArC/FANEJbCXUhCerfWcPVcZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(16576012)(83380400001)(2616005)(52116002)(66946007)(478600001)(26005)(53546011)(6486002)(316002)(33964004)(966005)(44832011)(36756003)(16526019)(186003)(8676002)(66476007)(6666004)(956004)(166002)(66556008)(86362001)(8936002)(31696002)(2906002)(5660300002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	C96ROpApCprgl2SHeaGzehuAjntaV1EaSw/uruOS3g9eHDwKzl+9c7u/EbE7lbJ3yjw1b90YEA/QbfN3VztbJd1euhJFBC25LoXm4Ib+buxpoaiMQ5O/HjCQu6zhBDDvMM3HOFL2mwN2hS7iJNyo0h46R7TJO7/sEEyYF3QiJvgb+6n8c7KDc6wbrmvsPzAjAjUFhscUynHzU2z7l02fiX3ckG5nSGj6W42zGr+nBsha0YpBAXHWkC/5YVkWZh/CIbDJ5dNEPqmrJ5NXwNFfM7yL5r+hlmCVcslAxU0Ja6FHl5Ond3OxL6UBLQCaHLscdAWfvcfB8aJiO9p3UKC89hmhbfeO8uh+O1YyZI9WcpLAcrXbcIXOC7lH4tzPwuCX+X0bOQ2dA7qIph44osXOA9cO4IJOY/9RrpUqm7FzR6K128hu0hiOLtFcz+qIrhkly9eoeIH0Xzb7ckoSa/OJSj9BZHcjx/2aDTQoRsTKAllJTNy4hKthLKN3MK/Dzk9w0LdAfB/tS52DOakmVUkccAii8x04TjZe9uCAiArQU3Xz8jsClcA+HFb9EyayeuLn5q3ctS6jsL9cf1pEfr20nDyAAaj4d9Ah7HgbzZ4f4qQlr6xCL64JCAaerbj0RYjFz6GAI5Ev6jHTtnl+1PAqyQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c59534a-b01e-467d-fcde-08d860c27c54
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:46:10.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+aGm66iiRugN4L4Mbyj5VUjA7DleNvC/aNaJXBYIxR6MOsdzchB+iSswdrYgFCtEnEGUyz8kNLayItHpcqSWv4bvfSqLlZY2GXmuYpOgQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: multipart/alternative;
 boundary="------------730B01140E5BDEF72AA30441"
Content-Language: en-US

--------------730B01140E5BDEF72AA30441
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 3.2.0:
>
> - Mutate the passed ZipFile object type instead of making a copy.
>    Prevents issues when both the local copy and the caller's copy
>    attempt to close the same file handle.
> - Path._next now honors subclasses.
> - Path.is_file() now returns False for non-existent names.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-zipp_3.1.0.bb => python3-zipp_3.2.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-zipp_3.1.0.bb => python3-zipp_3.2.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
> index a29e2981f2..59d71500d5 100644
> --- a/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>   
> -SRC_URI[md5sum] = "199da7385f080ec45da6c1942e2b5996"
> -SRC_URI[sha256sum] = "c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96"
> +SRC_URI[md5sum] = "321a0dfa1080d58e5de0800a26565452"
> +SRC_URI[sha256sum] = "b52f22895f4cfce194bc8172f3819ee8de7540aa6d873535a8668b730b8b411f"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
>
> 
>

--------------730B01140E5BDEF72AA30441
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.0:

- Mutate the passed ZipFile object type instead of making a copy.
  Prevents issues when both the local copy and the caller's copy
  attempt to close the same file handle.
- Path._next now honors subclasses.
- Path.is_file() now returns False for non-existent names.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-zipp_3.1.0.bb =&gt; python3-zipp_3.2.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.1.0.bb =&gt; python3-zipp_3.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
index a29e2981f2..59d71500d5 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jaraco/zipp">&quot;https://github.com/jaraco/zipp&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6">&quot;file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6&quot;</a>
 
-SRC_URI[md5sum] = &quot;199da7385f080ec45da6c1942e2b5996&quot;
-SRC_URI[sha256sum] = &quot;c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96&quot;
+SRC_URI[md5sum] = &quot;321a0dfa1080d58e5de0800a26565452&quot;
+SRC_URI[sha256sum] = &quot;b52f22895f4cfce194bc8172f3819ee8de7540aa6d873535a8668b730b8b411f&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------730B01140E5BDEF72AA30441--

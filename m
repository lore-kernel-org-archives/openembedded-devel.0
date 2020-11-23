Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web12.42095.1606165067789441661
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OTWn/U1F;
 spf=pass (domain: windriver.com, ip: 40.107.100.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGoxYnElw/+vQV65zoEwhvxPxajDzm9pUI7qOUaXOOBn7960YhTTT1NzlsKTJIYk4HkkjxeX8xc/PjUXi3fFfyuc2xH3pkIAxJQU2AzUk/pu050cS4wJsHpDghqDYB7A+vKoVccfzPov+u2rHbS0KlKCI4n1Y5V6yEt2EZO4lR3hXAD5CODjTwg4z1qESIEbdLKXtLJwZPkF9Dy5EJsVNrIGgisO4t/fqSSRRMyD1XVHUJZMJHS1F6IiidMoIb7PHYGXO2Qzrw9LzfYpb1AlfWkYNe6ntvxY9TAPYZIRYwZjLQPYAxNs60KjinbTuxagRV9XTM5CtMiMq9XQcuurpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMc2FPcbpBzX0Ar56+vu3vTtum0vnQzcrghifomEQyw=;
 b=XC02knYJcexOYNcurjl1kfI/nwHaWTnpS43GC7+mTvudZ4mw/6jdvyIhDdBIiIWUTIs4H9LJLigbjBHFpDoPaoLMEwQDgs67AbRhAWniXOQTQDeJLvfG8GXfB+Pyn+SbdzmBXL71imqD9r17MU6NNd6Qw+2m2TSkBnUWP5jxpqlU6xbjxP3sc8KNn0TRgMBccYmUZi38qqHezAJtbu1H0bwtNYypLAjyzLIc9N/bsx2mpFBcEc5Rw0jDz6aYFO0U655MVLsU0XOn4eJMudceceN/otdJWUXxfnCq05cG6lEz9n6Pe51EBVEiVKsmXgtcsG6ByIqv20MUvoxHxMS7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMc2FPcbpBzX0Ar56+vu3vTtum0vnQzcrghifomEQyw=;
 b=OTWn/U1FyGdf9Lzeka0unMYeAT+QoP633BrNrYDc0y/ufPLjjUArreqKRBnJjMetaqSIOpzuvUDni1cbRYeo/T85+WdydT9FqwGdsBGoPrFc+6lGzGJiK2xQtlqaeJT9BhUrqZ/CclGLFRUpBeQUpEHP3x8M8y7kC/Fno54b/XM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2727.namprd11.prod.outlook.com (2603:10b6:a02:c7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 23 Nov
 2020 20:57:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:57:45 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-cantools: Upgrade 35.3.0 -> 35.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201120092910.30736-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3a06e1ca-d684-dde9-2b77-fb77a7547b16@windriver.com>
Date: Mon, 23 Nov 2020 15:57:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201120092910.30736-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:57:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca7a2ebc-71aa-4bca-7264-08d88ff26d37
X-MS-TrafficTypeDiagnostic: BYAPR11MB2727:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2727E5E709FE48BD5BB125079FFC0@BYAPR11MB2727.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OMJm50ZnhvcSMSxAESDZJPwzuPvGueeoh8gNsnGiYzDbHJa84K+v1++p2fvr+ZCYwg3+X3vffXR5tmc2rMukXDuFUGLxXbVGLT+8FloglozLUucSJesYcG5ZA1RrPNIDnB7vLTZ15wIyWDtik+90BhtiTspu0mX+DQL4j7HDQvPalCt8e7lQTOfcEldSwaCmy4vyhcfPBpr6thpIkqZrsS35za9z/6+r8FepfAdmddvU9TgUrgbUm1U/rXkKYb5T7zuK3v0IibfIB4BaMA2uWoB3+e1LJXiMKUHPSj95WypzZEYSMpvQiffkGIWVdkalhQjbzN2g9Bn0xTUXvoqZexqkWaeh40wE5nGRLwelurLZgeVzEALEudIVtRK8UY6g6ojSaH8mseBl/mKCem9F9eF32fpiVde8WJqdUvz4uZrDYRFCMyDIMb/LQBdNct3Iqp1MkcvRO3TD5ebQ0aE3PQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(83380400001)(53546011)(26005)(33964004)(31686004)(52116002)(44832011)(16576012)(166002)(316002)(36756003)(2906002)(966005)(8936002)(8676002)(6486002)(956004)(186003)(16526019)(2616005)(4001150100001)(31696002)(5660300002)(86362001)(66946007)(66476007)(66556008)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/zp5ebsSnT0Cu4d3/HjAWSX0QNkSFh1Nq578zu4YkUpUIvsW0kpDUbSC0D+bXgJeDoIZ9ieYTGwHFyvom8wML9673Yhp/ornh32oWbCBV4IpUviINBgYS5lXRw6VZJjgw5nGsmoJI+6+1/OpZTkwBB/LQvej9nT+h1FRmVg8rOG+RI1VK2hoGZwHQwYs9mFZon4QcxmjAlPx6ZLybdqWbKxfwYmH/0PQkZdnP/b+bUwuYc96SBEKwcgXWYQjhWooD17z+GMLUf7rvFCmVtw3LLxN1O4X/vs34nXOd3veGyIzh9IzGxqD7QHTQXk+lzziYyYQBAc4zfE2uF04M44aGQn5QgBCrw5DvoWUURp5iIn1IxbnDpeZkLxf1Y7bdqBWyziN3KM+5kIHGD2YG7K0gPdnBLkFiyI0j5UtvuMkBF3PQB3AWqBmmDrBzmysB+7iPtjq+ex8gF5dhjvqnePqupY8jq5246RewO1gJit6NHTny9i0KbZzrvjOY8i07S6GGBL/amH5gj5G8eFuASH0DcUmU51gSHpr9Tyv8SIH55NpKM/oLm7sqSnLjKdzbDyD2AuAUYsX+Qy+zwStLwzChdZ6Y9mlkwB4P0jOFuRarywWQkRBAoyW33odVxt2jG4hLy3LOFdaRHHQdoySfT+sNaK+VgeXEP3gCssSq99QGy27w52X1A3TxgLBp4cmz3UNtLgPIB9s/j6rf2fnkHUW+MWxXlL8cPm45HGKDfHgeng3UOAMs/2C1Yl7qzuBi3SRU1sOZasrCumutTD1a0qt+zCTYiEdbr4amrJd/OFQ0Hym/QZ35IcF925O1QSVs4u1+dm5AHlEcz7gLRJVKA1queyY8mBfDwvna6CFeOUwTpogdJbnHVTBAHm+fsh/3zAycQTQLUnoTz0BpQs2Tzy+FA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7a2ebc-71aa-4bca-7264-08d88ff26d37
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:57:45.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4v7qmBOb+T30iJxb9rm+ngFqunKFPIUfXMn30fzSu4s87OWc3OORb4vRR2kSAQh7F3A1bYWXtFd+gnPFpz698aJpBoRFclC6JA6KSppyYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2727
Content-Type: multipart/alternative;
 boundary="------------E377885F66F46B3C1F5D02FA"
Content-Language: en-US

--------------E377885F66F46B3C1F5D02FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-20 4:29 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 35.5.0:
>
> - Added support for CAN FD in monitor.py cli tool
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-cantools_35.3.0.bb => python3-cantools_35.5.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cantools_35.3.0.bb => python3-cantools_35.5.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
> index c79e51e33a..cb70ed3188 100644
> --- a/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
>
> -SRC_URI[md5sum] = "068514ac776e03ebaa8b2d02dd16fc77"
> -SRC_URI[sha256sum] = "5e3a6f679ad3dcb31142e388e052187d5fc5bd481c4fc3b2791eaa1e681cca98"
> +SRC_URI[sha256sum] = "ce26ab5d54762c314bedc35b407d498b8ae11069ab4d9251f8ac83f2956438f9"
>
>   PYPI_PACKAGE = "cantools"
>
> --
> 2.17.1
>
>
> 
>

--------------E377885F66F46B3C1F5D02FA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-20 4:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201120092910.30736-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 35.5.0:

- Added support for CAN FD in monitor.py cli tool

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201120092910.30736-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-cantools_35.3.0.bb =&gt; python3-cantools_35.5.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_35.3.0.bb =&gt; python3-cantools_35.5.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
index c79e51e33a..cb70ed3188 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/cantools">&quot;https://github.com/eerimoq/cantools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>

-SRC_URI[md5sum] = &quot;068514ac776e03ebaa8b2d02dd16fc77&quot;
-SRC_URI[sha256sum] = &quot;5e3a6f679ad3dcb31142e388e052187d5fc5bd481c4fc3b2791eaa1e681cca98&quot;
+SRC_URI[sha256sum] = &quot;ce26ab5d54762c314bedc35b407d498b8ae11069ab4d9251f8ac83f2956438f9&quot;

 PYPI_PACKAGE = &quot;cantools&quot;

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

--------------E377885F66F46B3C1F5D02FA--

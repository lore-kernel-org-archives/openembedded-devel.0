Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.79])
 by mx.groups.io with SMTP id smtpd.web10.1834.1592508669329515234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 12:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OkSqX4Lg;
 spf=pass (domain: windriver.com, ip: 40.107.236.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5+wW5HgSPO5xXQTzxe6x3zrdLVIfzOeYKDzyYTpvxkwMHR/HPza1/yS4Bv3os0AyjorR/lVvNVkG9sUq6z6GDhJB5O8p9kVSbxN2iCrJaDpkRalii4Gl1hwgIjn6axyPhn6dHlAcNYj+oQPNp4AK/HlFcjc4uJ2mdzW5zD4bP0XVX8Cs5eWAAUYPRYpg7q36dt0qZQCUAv8Kn3YtLH8dpRaqXkzHDU7keD8fV9pS/RfnS9/kd2ePKjbp9geLyZSry5Fzp9UAFXl9/h1M5dLpmFx2m1gw6ufxOPlVOMJK7iMBcSxce5GDmQM/wAFoZKLkFXx3/3Z9a2bG5qdpHz/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uchzzPUBYMsCZNXPQVg+UY1Byarz6OjPhyZi8VjUgTA=;
 b=Q2koKaOkKkLQrlrdTMk1XsVF9XfrxPgiZf7BcykTr5gyjrLuC8buf12JAsc2eOu9/lG52SU/iSA7k2XvxOB20bv5uUXar7V+lKysWYOICtgeJIgpKllxp+Y3VMB4wPLfoM29vEAdN0lBuo1KonNhSIRcNHCbNdeL+xQDEGv61JH7ObOOMUABqyV7ON+Q3sGJ3OVENXHN5y+Rqag+jjvwy7Tr/V0I4140LSnhpuPxXaQA2LugSvyRq1FHC4dbtmnozEWgkbiDdax22nD4TSaPYdBWehp6tvAra7g4tlkaAfnfX25edIgnIYnesqKJMZTa+RVv5MPtR8oYeRav8O9ubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uchzzPUBYMsCZNXPQVg+UY1Byarz6OjPhyZi8VjUgTA=;
 b=OkSqX4Lg3pZUcdjSugHbkOWkKnDr76WaK3qiyC22U1Q6Z5tm5YCiHyzXKkp1aptJMlh06mVWgecXIvapgcFBwSRpuBQ5AzfVsd2t1InrFhF+EHV3tX3PCVgWJ6GMXQdz6jEFM1RTcRrqMp+qprupkrFIpHZIuOCjNaA3dHO9g9c=
Authentication-Results: xevo.com; dkim=none (message not signed)
 header.d=none;xevo.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 19:31:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 19:31:08 +0000
Subject: Re: [oe] [meta-python][PATCH v2 1/2] add python3-dynamic-dispatch
To: Ryan Rowe <rrowe@xevo.com>, openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com, mkelly@xevo.com
References: <20200617191551.49812-1-rrowe@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0c702979-ca1c-aa71-a3a9-64a57b69a167@windriver.com>
Date: Thu, 18 Jun 2020 15:31:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200617191551.49812-1-rrowe@xevo.com>
X-ClientProxiedBy: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 19:31:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cd4e9e6-ba5e-485a-dedb-08d813be2633
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB205009C6F828DC56589067459F9B0@BN6PR11MB2050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TF2fgbLdwdyeofEf7GfmAnxcQ6wiBD3wUo6imb8rSYBefjVIMyTxMyT3UiI+7sTx/7LhhwQE/asnXC4RKOOng1Ab3QhY8RP+SkujCPWWz63afRPrrFm6YW36nRZBNncBP7f19nFuhnYSzYQBmnc7zli8Qzx0LE1H1g1TA4zFGpqfCH1R6dP/RTd8cIHOGvi3Z2sriIrwxfruNXV15ezPphvwCuCUQ/kg1SL5VPSgcT7TvCYvpQ+H26Oq5rKdurokZCSFohH1FhbwpA+UNoZfpg+7t7fEiK4qWG+30ImXz/3ZSmMmxZVh2uo9gxbQ+Ua25GHhKSWYq+0rgpIzAENBDaDXvkvni9TqTivAHl8U8PwZylTOHypcVBLaqU20HyoofZlPfpsDz+bJv17b/k14/tNoYIOES+MZgwj8K652nLnBgMUrfWqNZ0rHARdDE08jrsUTUoBdVC3XsEuoQCq4pQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(39850400004)(376002)(366004)(44832011)(6486002)(33964004)(956004)(166002)(83380400001)(2616005)(36756003)(478600001)(86362001)(31696002)(53546011)(31686004)(8676002)(8936002)(16526019)(26005)(966005)(2906002)(316002)(66476007)(66556008)(4326008)(5660300002)(16576012)(52116002)(186003)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FIRnNdVh7aUZkJw0RQD9iBVe0n2ju4Led2hVhvBsA7fHrjODRflSeDM/WllL28y1f6EHwqHHqsY/00Q8heDTOWiC/p417Ih9SVmNGaKWFwLD0vJ+noTf9fLWRsI9mktdfWJqM/Y43Gy2qILMUDtv8JcQJNB6WUvcAAgOo9sz78woS6OKl+/2tVy77DJ3AS2ptJahs4o2HuyJPPUKQZManHT+4JWGhEFJ+v+ou2jp6tbvpD+4XtV0ukSpKjtuvTKXUGfP2hD1ZLjogsv/tb5KLxxR6+ASKnVRZXOY8ojjzhVZwoYCTcED24B6mMWkMXoI4TGUGEkJs7Ual3zYO5AsB32dihVMVYX9Fu/y7YA7pdaEabYvwYL8zEOYwdKkmS4ez+zPKmpG/C+fNDLOZbkDg9XCu3aSk/xn/OPGeDss64UZapYL61OUx0m1twHYLchcRH4lXH49CL+b7Yf4JsMaUPzqJsuaDt9NH2DaxjsoBu3AyjVHsZdPEduWct2JSaYJ
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd4e9e6-ba5e-485a-dedb-08d813be2633
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 19:31:08.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZvUREXSV60Gcg8uzJqSckYS6s2+mzTG4T5+1oTJMOw5rLBvHmSTe59n2UNhbMOjs/CxAorsMeQBdkZdsFQmWAyCV5rkEx5lDUBrFn8PbEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
Content-Type: multipart/alternative;
 boundary="------------EFF82E24A2180A6768E00AAB"
Content-Language: en-US

--------------EFF82E24A2180A6768E00AAB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/17/20 3:15 PM, Ryan Rowe wrote:
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-dynamic-dispatch_1.0.2.bb   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
> new file mode 100644
> index 000000000..6485f9d57
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "dynamic dispatch decorator for classes and functions"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "0e29d2afa806b9b87dadfbed6a0afd6d"
> +SRC_URI[sha256sum] = "ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d"
> +
> +PYPI_PACKAGE = "dynamic_dispatch"
> +
> +DEPENDS += "python3-setuptools-scm-native"
> +RDEPENDS_${PN} += "\
> +  python3-typing \
> +  python3-typeguard \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------EFF82E24A2180A6768E00AAB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/17/20 3:15 PM, Ryan Rowe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200617191551.49812-1-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Ryan Rowe <a class="moz-txt-link-rfc2396E" href="mailto:rrowe@xevo.com">&lt;rrowe@xevo.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200617191551.49812-1-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-dynamic-dispatch_1.0.2.bb   | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 18 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
new file mode 100644
index 000000000..6485f9d57
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
@@ -0,0 &#43;1,18 @@
&#43;SUMMARY = &quot;dynamic dispatch decorator for classes and functions&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face">&quot;file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;0e29d2afa806b9b87dadfbed6a0afd6d&quot;
&#43;SRC_URI[sha256sum] = &quot;ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;dynamic_dispatch&quot;
&#43;
&#43;DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;  python3-typing \
&#43;  python3-typeguard \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EFF82E24A2180A6768E00AAB--

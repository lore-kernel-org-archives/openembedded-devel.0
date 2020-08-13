Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.72])
 by mx.groups.io with SMTP id smtpd.web10.13169.1597334073711978312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Dw6deB+M;
 spf=pass (domain: windriver.com, ip: 40.107.220.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcL8bNbLoXOxuMjPdHRKPF4RDAMQYZzLDhT9C08H7abVsIKN4FZJrGiBrWguf7kqFasNC2THMVoMmtDISFQMgjtIdJMMgAGiH2MYHLXbzWdbB4ucOzKUetF0UihJ0I1uKmFl7Sj2azGAae0UnPeLgWtQ0HsqCfQogI/NsXQjiu99AQlZ5FCyyEF2DBAQBs0zGxSCLZdPXiQIZ346QxJwlFsbDyJtzoKt92KTioShuO8e/Yt8M88JjMAAauzqQQXbj47iKXCNgQMANn12ejGW0JMAWmNOsKkL2/vs4BF2AHIz3hQV8hlukLEp3U4yn3eykZ5wKHo4rPVLZ07DWmHc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XpbuqSguRZaPhxJG1lVlBsrexmEmzmqtUyixqIqwmU=;
 b=KzGCggGMRf6c9otudQgtAE1Iu+HBakMk8hLDr7dA0ok8u7UOPD2ph+MdmyLHuTX74oX+Y3f+pOG1zsrQecaDwqVfykv+fuvXjY8g31B2X4JeCtCZW+QhOeUQFZ9cM8O+8CCyx4F/TPckusKekdN+qN9kqrcaZ7Ds0E4qoMqkl7h2Kv5tV/n3WGGSsNUKlucgQIyKWL8yl2tQDXiL2iPrm4+Z6jGfVISC+TwL2P3xrjuAL+3toa5G+fL+d3xPV98UBTAoPcwbtVmrzoqawhqIOUCrVtOd5m0gDk7prHtJ5z1J0pJfcA1yEEMI2g3oNVx3T3dwCq0NPwt4SEEqcxVNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XpbuqSguRZaPhxJG1lVlBsrexmEmzmqtUyixqIqwmU=;
 b=Dw6deB+MS+e6hkgrN+UfKla8mJUIde0J7IfIwK8iCu/1saFOFLU45Nu606NSX+shtFmqLTYD7YFCf7bueqenjWlaT4G+YsulNw7fjB5KcJ+xpBivzCNldIEuIdDmhB5/Qtg1+iTdmSp0gXA6eveSU9eTwuHPsgbdTxAjLYr7K+U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 15:54:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:54:32 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-tqdm: Upgrade 4.48.0 -> 4.48.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8bcb17fe-4893-5744-e266-628bc468ff31@windriver.com>
Date: Thu, 13 Aug 2020 11:54:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:54:31 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e895b46-62db-44bc-4e55-08d83fa12b43
X-MS-TrafficTypeDiagnostic: BY5PR11MB4183:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4183199A6112C835EDA09DA69F430@BY5PR11MB4183.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sjrTMG+GUaL38AaOoNMdSXpD+0JbiXZx3HCM35s4yH2yJC09VNaxhIkoLYTnehD0JkVzGKYXLB/f+SFFAYSQgDslRZro7ctGT32xCcr5TGerUTJ9pwDgbWOz63UR7H+fdtObFsnDYTN/5GbejjW3McPBvUV4cMftnyqi96eMHxFjOggsS1yWlydDx2T/IPFe1Yc0g0XKgw+ZB0CQexlI2EgM0HV3m5L1ObjC7UNVq3ApDNKhipkk/Wt1/9n1OWrvvUCAPV8K/ydsgsULNk5e3V9fv8afEKgUok89HtipO6t6BJ5rBHSRe/HRfjnu+wSNVzZ4QdQVyqVCpZNvLgOA+eUmzMT/gMqNaf8X85lDOXeZt2QYgJ+NpYxfJtjWtKmW30r1cLCW0bdbAzufZ81ZbDJ2enYoTfg0bu0sMzc/ueZ2orAHmGhyRges6ar7uuv7VLJrEqrO0k3/O7xxK9bulw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(346002)(136003)(366004)(396003)(316002)(2616005)(16576012)(956004)(66476007)(478600001)(166002)(36756003)(83380400001)(66946007)(66556008)(6486002)(186003)(31696002)(8676002)(966005)(52116002)(5660300002)(86362001)(31686004)(33964004)(44832011)(8936002)(16526019)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7Cs4tTV5mWyJBrHab8u6+TYeCfMlriakmUl5t2llQ+ClxKBGvJHbXuNnR1OJPYMQMjdGAyhAvSPwgQxIyq0kBK0/Z7nROiGcGUE1J6vrdVHCw4ZyQphybS2mNGPbPa+PSIgaaFHsfdlauZnRvtlQetEJtICMoOIxzvo0+G55JsplnotGRBW1q256rDnpRXH9+aPujjkrW/BvOFEeWPM2ldswsuKV3bvUgSQC4RVVyO7r2HokKysto8na1EyYdx43w6cGr7J80CYUcuZfaAKz3yQXd9fOUEPp52WogX4Ia0zhlhXEfqA/n9nhhMLtyBVOsddJpGsx6j86PuRx+44FlK/Po0MMti8OxVt3dzFjSRYztpdenOZzCbcBdvg9B73PJKrhhTa8QSeLsnKjnIEuZGmBwzJHiUBf18MFu2L/VGyBZ56SpHp1ipcmuBxeoTn2d4gtc5C0TdQXGAgJq9bwhQM9Syto6mbOPEWiVfYw3QGnj1MRv/Gh1MvfAJP8yzq3dYI3n5NDeh85ICdTPpQtOpwdzXYKeRK2aq4fTfI0JTECaQwFwgATbh8IVVbmUxRVuikyyFxOoeAOHm7cuMi7vj1p8C0xHChpZXd39k36sdSBZkelRG6HsdCj9Ot104QXV1Qkur16cIOpRTpZU2RWZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e895b46-62db-44bc-4e55-08d83fa12b43
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:54:32.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MphS8ElBOoorOCUXWXf+YMu8ftd7aFXu4m3RJZXbTW45l4oX5ZLWLpT93ARScXQVdlKlbOJQkxRW2I2PT/luKvWSaac+E/lIMCBuL1Gqb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Content-Type: multipart/alternative;
 boundary="------------F833F131D32CCE37CBC2B961"
Content-Language: en-US

--------------F833F131D32CCE37CBC2B961
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 4.48.2:
>
> - fix notebook formatting
> - fix ANSI escape codes breaking tqdm.write
> - fix long-lived strongref
> - fix cli --version crash on missing git/refs/heads
> - fix contrib.tenumerate ignoring total
> - fix potential deep => shallow kwargs copy issues
> - improve notebook display for unknown total
> - make asyncio inherit from std rather than auto
> - make auto multi-inherit from autonotebook, asyncio on Python3.5+
> - misc documentation & examples updates
> - mention docker-compose requirements
> - misc linting & tidy
> - misc minor testing framework updates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.48.0.bb => python3-tqdm_4.48.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.48.0.bb => python3-tqdm_4.48.2.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
> index 428bdb59e..831468095 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "89dbe66a10f78900e4e7be729ddd28ca"
> -SRC_URI[sha256sum] = "6baa75a88582b1db6d34ce4690da5501d2a1cb65c34664840a456b2c9f794d29"
> +SRC_URI[md5sum] = "d29c836d74d2f2ec6a10d052937f7371"
> +SRC_URI[sha256sum] = "564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------F833F131D32CCE37CBC2B961
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.48.2:

- fix notebook formatting
- fix ANSI escape codes breaking tqdm.write
- fix long-lived strongref
- fix cli --version crash on missing git/refs/heads
- fix contrib.tenumerate ignoring total
- fix potential deep =&gt; shallow kwargs copy issues
- improve notebook display for unknown total
- make asyncio inherit from std rather than auto
- make auto multi-inherit from autonotebook, asyncio on Python3.5+
- misc documentation &amp; examples updates
- mention docker-compose requirements
- misc linting &amp; tidy
- misc minor testing framework updates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.48.0.bb =&gt; python3-tqdm_4.48.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.48.0.bb =&gt; python3-tqdm_4.48.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
index 428bdb59e..831468095 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
@@ -5,8 +5,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
 
-SRC_URI[md5sum] = &quot;89dbe66a10f78900e4e7be729ddd28ca&quot;
-SRC_URI[sha256sum] = &quot;6baa75a88582b1db6d34ce4690da5501d2a1cb65c34664840a456b2c9f794d29&quot;
+SRC_URI[md5sum] = &quot;d29c836d74d2f2ec6a10d052937f7371&quot;
+SRC_URI[sha256sum] = &quot;564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F833F131D32CCE37CBC2B961--

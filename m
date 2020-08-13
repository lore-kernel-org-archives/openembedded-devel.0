Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.70])
 by mx.groups.io with SMTP id smtpd.web12.13131.1597334266689390951
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p4HrDpGb;
 spf=pass (domain: windriver.com, ip: 40.107.220.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlTeTLmj0RQUmv3R8KwnYi96/0CUgcOVi6SYQaEan/RH65ZI3F7Xd2Pg/3+1jdaywi5+qOsA9f0qmYgs9z+Y9ccRfXr5CdgoJ4jdr3AliBdR4SMo8oDuFMqrGhLBySrkfgjHohe9RVjFfmWM3SsKL+AVC8yOaNo8Wv5mH1Tq8Al1t7PHmwdiKlZ4y/Iw1YXFZUv/+ufFsoI1+0XEcakbKt4jci1gnp6He+LLHXjBjzN5rAD/CBa8IA/hDxA99SnEIP+uDioCLsLtxm0rUYU6ztlM1K29Ig2B+52Rhmh4H5F8ECzYxc1rgCX5P8eJc0u+QyGGa1Z+/OYgqfqkX04nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/1tG0cGL1LQEtL45UVVmUCk68gLmAnrdmLhrGfJ6Tg=;
 b=L/5E4qtN4F+nWADPi0Z5ytLjahLzzdhXw5UcGUczP05Vg33O+laW1ISZhQZfN3JKPf3LwUhQbgkKbMD9F5iWY81YmMce3EbBblBIx+qh5AGKJWcfaIHuX+AmxgIny+FQcvib/LWlDCVlr4+aCYWO/6MAXOeciPMrRSUcOYOmYAPFHkNoiwvCVhDSO+GGiWBwNhEK0swCSWvX7tGS4Wc611SGUT3fKIj8G0aWLqRhz9lD1rVLQwdkY0xWdEup5UCJUfJzIIaAMDJya5qkvxCRfFq9dpa0Aj/4OKJvb4hjU5IqhmO7VYcQJSJR8Ffehbc91QqsuLh+QjIz54SUPOmnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/1tG0cGL1LQEtL45UVVmUCk68gLmAnrdmLhrGfJ6Tg=;
 b=p4HrDpGbOmJwW1Y4bGlt9Kwy5ApA7k0kPQfJZ4XJTjl5cV16GZmERT5Qt+/aGGWGTZH39LrmN/l9n+pv/dsCyXeNHGeaXmMcE36FhJfPTvqn0Rz8y6b2jgiMNI5v12Ao9HWaDUcQflCQdEu3Lb7lKxDzQMuWfXMwQZ4vP4+tBOk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:57:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:57:38 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-coverage: Upgrade 5.2 -> 5.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
 <20200812164335.24599-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d4e04a61-95ea-8e57-2855-d91e45c40905@windriver.com>
Date: Thu, 13 Aug 2020 11:57:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812164335.24599-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:57:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b1de05d-e6c5-445e-591f-08d83fa19a58
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3606322BBF4CEC62429293109F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xfmb1wo26tHfbaYtO0/1HuS5Syog4LVHH6VNSIUlVl+J4PMa7fOcSN5n4qMSOu4pBJev0L54NI4plu00xw+kVa2/4OHvcbdl0hUpSvrZs1YgVyo2mN+inmICDkiEis3pUzTyPEhLoD2xiYXIuTc6AY2k57Wkn6eESOhr6LRYDEmtrJRQ1Ng62OIyVeuC4hLJ9Whu3twCrRHqxWsbxKI5yakJjs8P6nhy+BfLt1xzqncnplOyG/zsKsz7wTHsC63AtaT4Oec2d0/R/KHKLqiyQafhHKmxWElQ8DDg5tGaljfx5iSRA+6iiktLSyvvbVsxZ5ej/zKsvvGM6WXkAEPD8FWpkndy+anXWTDumYW5WoXRXMS20YOeWRTo+42OiCD1VDSPLMmnKahxoSaRnYzVMMLHDal81jD0TE8gxWRy3VBtSoHxa4gO6ixbumof9Num1duPsZSIeIpnVNeqczgRZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SQMRXdDFFgKUNwFa8gguZBdE0QZX34m7Jc7N9fyzn0g0VPGood2KsOCiYhbo0/cECOLNaIJLoxDZ0zDvKZ0T96cVX43Y+aNCM7ID1l+s9AaH9pVeQT5Rn0IAMMsiJjGeyw4DZR9MjRAx8m7h2thZk0kvBJmU4Bfmpg/Sbm23KkUs/5o7yZ1Q+jEwvm9lTnJ3Ws2BZki9llB2dQZ87i/UjuiJGisq9KyAcriBoTWvJDRyOTZjsSpdou/xyL+VQwFy9zoyMFMp3n560aWu6+Yv3GxU5rFFhWaHwfoL6GAcDv8Omb7ff4qoMtODGeEYq7hTqiYF7WKNxYPe9Ti1UXfWkH6ZXPSnJAbNKljOZ8o24yzX8YGGrLC1VTBdyrfNH9nQOyyb8H7WtsEBhz2hdJ8aKblel+uKn/VSWntYUTqPy8fZ2vjo/yU4iExBc8W91WsMdGNxqfQjCLqQXWw7sxsT8BchICh+m8UD7GT6/dU4JWvrwo3I9zj9zVlzbY57a4ZLp6nEHnkI1Htt3BfNZoRJA/HBv/4TfPFwDppmI47Oo4W2dyvGLPPDp39/8MSKgkp/nKxD94cK7EdZAxKGHRzQ4c0Q4RjeZT1NIn0HBNPZHg5/02YpLCHKVWtPxfPshon47z3L9bSK0jXS97iKU0WTzg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1de05d-e6c5-445e-591f-08d83fa19a58
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:57:38.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87a4FxYvJpK4L1U4j7/SEQia6nI6aEzIctDCpqIbKmrI77o9Sj3ogSEnLIvIBByLctesk6HXR5dfgPGgt3hvurXeFlk2CoPO97X2RbpKjZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------7CA602365CAFBE98B13FE10B"
Content-Language: en-US

--------------7CA602365CAFBE98B13FE10B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 12:43 PM, Leon Anavi wrote:
> Upgrade to release 5.2.1:
>
> - Fix: the dark mode HTML report still used light colors for the
>    context listing, making them unreadable.
> - The time stamp on the HTML report now includes the time zone.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-coverage_5.2.bb => python3-coverage_5.2.1.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coverage_5.2.bb => python3-coverage_5.2.1.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.2.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
> index 72558e10c..48e352c1d 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "bfe80a336636160a3916467f55842bc5"
> -SRC_URI[sha256sum] = "1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404"
> +SRC_URI[md5sum] = "9e6165146b9bda60a779953c79e8ca54"
> +SRC_URI[sha256sum] = "a34cb28e0747ea15e82d13e14de606747e9e484fb28d63c999483f5d5188e89b"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------7CA602365CAFBE98B13FE10B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 12:43 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812164335.24599-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.2.1:

- Fix: the dark mode HTML report still used light colors for the
  context listing, making them unreadable.
- The time stamp on the HTML report now includes the time zone.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812164335.24599-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-coverage_5.2.bb =&gt; python3-coverage_5.2.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.2.bb =&gt; python3-coverage_5.2.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.2.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
index 72558e10c..48e352c1d 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coverage.readthedocs.io">&quot;https://coverage.readthedocs.io&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[md5sum] = &quot;bfe80a336636160a3916467f55842bc5&quot;
-SRC_URI[sha256sum] = &quot;1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404&quot;
+SRC_URI[md5sum] = &quot;9e6165146b9bda60a779953c79e8ca54&quot;
+SRC_URI[sha256sum] = &quot;a34cb28e0747ea15e82d13e14de606747e9e484fb28d63c999483f5d5188e89b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7CA602365CAFBE98B13FE10B--

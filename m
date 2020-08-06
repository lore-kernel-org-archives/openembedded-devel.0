Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.61])
 by mx.groups.io with SMTP id smtpd.web11.5968.1596718983895678601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WdhJ5A+F;
 spf=pass (domain: windriver.com, ip: 40.107.223.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3WvZzui2PSsv39yKyYH8QMm6vQ1CCTfsYhdBckkvh/gbu/xyr/nitrX/SSHDDgZiq2A0zLMZ1iegikAEN7TO5A9ejqvmuC/8yflbDn/xk5pRWOhAeXdkK8LWdVKazgBACmotlcY39F5mUAFWt5+3hXN8jqQ4mVTIYjruR3sY5y6wGWVTehwVOJOH1feybQjDy6IrxEcFGWfmHmlMW4MbHa678q6/qSyX321j7YMZdFElbfY2jfTPc8pjXJMN3jDMtrlz3+NZawHhwh0qch9cuFJjHyHsIQT7BIdbhj/35tw/+SiS8ZNRrieQNQyDoX14xVYxCqML2yREWV2/KGQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxAW7By9Pf+OvZcGasTyxJyQEOS3LKuP8NmZH/4VEts=;
 b=J5Sbi/k90Ma2YDmJyfc01j+aiPLpybCyccawVLTpvrdcLpUKi7ub37ahkzVRUVytCsTDv+JB4QkEd341RHBCuH41XIroB05sIF9xsUL7GqU7KehBPevzuSPIY1OSQ/dwf8B/hyi4uhyOzjxWoyqUEvF9yF/EY1ugCYYU7WO727TSnm2naM4BgzFdcgKmk+TC2bZ5MhDrmybE/dpFMEp0e68PgQ+w1tf7ZT8adKPJuezn4dorAYuzVqYpu2bBfUr2mrGuGpOBy0yEt869QwOeNKCk6PV65C9U7eLJNcUFYE4RekaoD6BCPihI0lP3xloVXVuS+K4S4mlHAHGSrFDBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxAW7By9Pf+OvZcGasTyxJyQEOS3LKuP8NmZH/4VEts=;
 b=WdhJ5A+FxvUfiqjWzAq6NU74WZRxm2lT+Ee1IMsxeKhNjXHz1NZ8jvbguLAdHfiOd4K8qvanirwIZwKGLrFa2srneMP+QDTUCWsX4gQhvETYqd45dqYFZ1NV/03/5TPElf7LK2AxleV6DvIOr1KaW4tb/98c/VB7GjBHMIpoXQM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:03:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:03:02 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-lazy-object-proxy: Upgrade 1.5.0 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
 <20200803140520.23250-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <caea2354-b86d-28a1-c673-d029b330924b@windriver.com>
Date: Thu, 6 Aug 2020 09:03:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:03:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eeb92df-063a-471f-ddf5-08d83a090d5d
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430570A8AE04D867653DC7509F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wl9bNqcu92bhFcsUb/UwpLQaDYUEXvuILh71VeHZr2dqba9s3Pn0a3AfaCHUxkCUcMI74EiKGWFX+EtV1P4H+eZl+PGd+EwFfdR2AEJTZnFIEmiFaufWBu4bmA25jSOAgw+Tp35YfDfpYXqSa22jN0JNL5RgtWx41zEAEvfYW3eCOqfPiRhsjDFZRHhLISHm7JUDtudEpDSw/FlS3l6zZXtFxW2lzHWDWy9fDDHesxbgu0ZE39NiGqo1rY5Z2JLijkm7YSWbas2eNzRyFRQSs8VCTrrRj4nDWTIEdqkYm89IC0m8yly6PyqY4ft+YqQE4S4GOgHogIEu/aJzvdOsbOKidhgbKxd614exFplt5MPvmBSNv5x3Psj1V2BSlD+JTB7RpVmZa+YZaNGZe/mX0VsEyXAdfD3pq8BW5tPj8OhZsCPBckPg/9d8GeaAWkYwJrhyMizJBYrErFtNwWKrFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AnaOpq+Q4yJyhHt1pm55CMzV9WQvJC1jx/IKW+AsEP4PFPqdxBivp1kKUOAxp9Qum69oiypa4cpMmDyK+vXjjqwyoONdPfxil983nHThSoAf8PUFAWOV3720T8Us+d3Z9WaVlizq7veEStBHv/fa7Y+71FbXWP5dAaPi2saYAjIVOFOlhPfjnlsTV4YNU6rVab8QgXEWM578VZ4jjfgM/3zxyQHveIs1ujbqLp9Q9MuUTX9Otlsn8NjUJg8YK3CrP5nuCFpg3kdkVtYxwdRLBGctwcWJu0y7D77BlYhgMS3m48cFL6mg5j8a+zVpJvwYrywmHHHsi60wbFEBCk1WfKwXSMQg1RndlQeEsTGBvJLA0dDhNMQD7b+Z3OM/KHEVyEhyaC2k76qY6+79rhIxm/dzvsWTqercFYgBG3+RzrfZTGAxDgRDri0ZYWDZ/1AeqyR6H6HvbnjnKgRUeQLqf+y/qfaQLz3p9uzJgOwBiLUYwzrpMY0YVXyIAB1uYVtAG7u+D6Z9eP8Oz4VCaNM8Tug32R4S94zPcA+Gw7b6bzdEMneN2uuAAChz2CcYSsbRmszG3vH69LwB/pwrC5uWkC7Ad8ypw3nwcQW+kBp6fR2C70Y1ZhohABF912OnxXn38tyUwHHUR1g08VdKcLf99Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeb92df-063a-471f-ddf5-08d83a090d5d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:03:02.8296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8x6jIZK50MvcV3asFi6f2xPOaNqYZbxkiQ6F2JVE/RJK4wD7oTfwmaS+s4/9k+/tWtD3RSxdoPEa3LoiVUnBGZmjc6vTLielBjLQ29dz3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------C1AE5D1706F4D1777D92D329"
Content-Language: en-US

--------------C1AE5D1706F4D1777D92D329
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 1.5.1:
>
> - Added ARM64 wheels (manylinux2014).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ject-proxy_1.5.0.bb => python3-lazy-object-proxy_1.5.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.0.bb => python3-lazy-object-proxy_1.5.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
> index 60d0e169f..4ba947923 100644
> --- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "ea5c009f1995d86942d024714096624e"
> -SRC_URI[sha256sum] = "a0aed261060cd0372abf08d16399b1224dbb5b400312e6b00f2b23eabe1d4e96"
> +SRC_URI[md5sum] = "c168cec73acdec25a49f6f467f5b1eaa"
> +SRC_URI[sha256sum] = "9723364577b79ad9958a68851fe2acb94da6fd25170c595516a8289e6a129043"
>   
>   inherit pypi setuptools3
>
> 

--------------C1AE5D1706F4D1777D92D329
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.1:

- Added ARM64 wheels (manylinux2014).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ject-proxy_1.5.0.bb =&gt; python3-lazy-object-proxy_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.0.bb =&gt; python3-lazy-object-proxy_1.5.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
index 60d0e169f..4ba947923 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf">&quot;file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;ea5c009f1995d86942d024714096624e&quot;
-SRC_URI[sha256sum] = &quot;a0aed261060cd0372abf08d16399b1224dbb5b400312e6b00f2b23eabe1d4e96&quot;
+SRC_URI[md5sum] = &quot;c168cec73acdec25a49f6f467f5b1eaa&quot;
+SRC_URI[sha256sum] = &quot;9723364577b79ad9958a68851fe2acb94da6fd25170c595516a8289e6a129043&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C1AE5D1706F4D1777D92D329--

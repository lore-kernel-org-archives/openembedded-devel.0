Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.56])
 by mx.groups.io with SMTP id smtpd.web12.13109.1597334200211406864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eQODqt6c;
 spf=pass (domain: windriver.com, ip: 40.107.93.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVsEObNQdybXc36lnFyD3OnzxAie7Y0p1laWnT9OZ5xOCpaApf4NW5dogOfV7McV11/AFoNLz8H/Xy07z/nrinoa1cMFv620PXd60rahYNngkyl+FQfW2946y28vnjftcqJczw1NoVHIaYR58mqhYE7V/vJ19tVDY2vJG0iOQI4/QQ1/7nqh2oPrTYxdQj9pY5o4A9JfqPEDKxLpg27RCwUKBTKYzWjVXLMtC2bTMWlNQD5vTUMnTdhXVcr66oUeDgjS6z0c6ddp0OyKLlovJ+z2zM19ceEYHXZjR/l+A5saA5eMeXnNVGPLUiNvlxkDxY9+OvvvAJOryOofeNYK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K40T7W1JK0qNOQA6Yuzll5xeqpgbUfqdhE53YW/YDME=;
 b=DkhQjfKX8sHL+TtYN+f/rnnB7QMYkqeEsPjUwIE/PS0xCJOxpBqUkgfjdm49+hJtrwaVn+ahok/LQsSmnXlIFoaVJM0NCegnlee+1ciLYjb5XiRXyuXdxzDLJ0q72UXQ1iUeJ9glbVKs/V9xeNMWQmbNAxBPbJUiWaeOt+mQFX5Kdsv8K9x8MO6nhRNdcXDOUXZnXrm+AmT6mtfVPigx26mii24Jy3urGsSbaY4wyxq6WksJo6BRGhFrQPhjNxTskSl482URlH4hJymBksbGiDyrA7nLWUo1cavIa67yB0g+DKecZY6RwEcee662+hzbcbYy4bNNZFC6SpbBeuYqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K40T7W1JK0qNOQA6Yuzll5xeqpgbUfqdhE53YW/YDME=;
 b=eQODqt6ch0Tl+5fcTarj2Tq0mKOH5ivOGOqrt4M7Wg2MMxG7elyL5+60Zhynu2K7JnOJjed+oSQKOccO1Kd99odYVExGtF51U79PelxiAM+r83kooxBi8Jv58rX/x9aulkFIqkrpRqr/jCCaNvQj6B0MCpVyJvoQXF6XoKiBLRg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:56:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:56:38 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-u-msgpack-python: Upgrade 2.6.0 -> 2.7.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
 <20200812102726.4376-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9400fbd0-b0d3-3ecd-13b2-fd06b99d603f@windriver.com>
Date: Thu, 13 Aug 2020 11:56:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812102726.4376-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:56:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9aded46-1510-4807-53c1-08d83fa17692
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814E80AB1450B73275576849F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ynp81bYr4GD/Ho+B/4eieIqYLYIRdzdlHuT/kEeGg6C0VzjDCmgEReIbU928USKVHt+z/N2xUt+b2jpCED0ksEdTy5AJnpL/0z8v15l/L0+gO/XaD1hjfiTavfZ/u6fm/ucO6LvblEkC755e4tqQnXxd7Qi6WHyNs+5XfFbAo4OsvavqbtWyd/feVBveJAjQ3zB6X2wBVW9kclm4flqsF92j7mOvBm6IqPXsvsLBNh/gb6B7DLr6kR4IZYpuv1OuBuWCe+i9tmyAeIWK6GZS3h/51eR1QUnIgLcSCAFUIC0WjYc6+q5GOAabvjfzHwDOksGcWN8CG1OFvWVdMuBKS89PWiKV3SR06VZskdi1qSi1jurHRxMionHwEYjpkshRoWz98W7UbyNlrKxsQfw1nR7sK1es35FK4eot5FEp5UYDrfZDJvnbYIxFmsBE2NN2IZi2PrblYS+UhqX6JMS6AA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	q23sPqdVgmKQiWpPxC0S9juusynqNKvA3qlFaXTCD9z6apK/ekprapIjTiG8TjVG6FRgIYj150m24T6in1x23VU7mkpDChpJWduURZ1bTb6SMWBhslazD8mYulfbcQWloIVdMFVH7z0heG4HExsIDQiN27XdkDNoVd7TPsWEW+yeiGNqNlS2wFy3p+32EcF4W4RjI+algNfscAHyYjI5EnhMefDxyuGGjfga7KRyGTMby+R9wt7LIMVjJ/cpFLvQDy6mFYy6dNZaM2r385H9IRv29L4YfIlKalaL8VDIoHw/KfXcs95cBqQYOa8Dw6zq+2rN2e7eAh4DhTXAQFiUVTT5zsbY7hHYz15oODVZ9HyDJgd+SPqEML1yOTvm1Se5CMOw14u2ZkEJVUtgwhr4hGa63IaTXFiP4o/1v9dXZ7ArsrE5K8OVcYDpaULjSkGUYl4FsjTvXHJZTBcbc3sdgyUULm33NtVXzDfPM7eW9AkmG6uNW6M5L6912UFal+4EyI/LQeYqjVi8dzja0zAD+99HjxsBnoNUdlVpEG9TSS+MYIhLw8i6/mZCV3Us56X+SVjhZxXCOs7kBV8TnylULy/qfwQdaLGzg4oeTIzBuDe5r7P0bt2oMxA2tDVQQ74+Yv0ZBfA00SBi1RvIAENPPw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9aded46-1510-4807-53c1-08d83fa17692
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:56:38.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c7tUHHg4/W1gB11TQEr2bXoyCT9COiWlaunxN5RsjshelQIjI8T+oW2MAwwDHrGQh8VxYji0LLNJrlX4MQpLuueF9qWYiRbtVpw/m6sj1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------F0F0E1225ECFC73555361FE7"
Content-Language: en-US

--------------F0F0E1225ECFC73555361FE7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 6:27 AM, Leon Anavi wrote:
> Upgrade to release 2.7.0:
>
> - Add support for packing subclasses of ext_serializable()
>    application classes.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...gpack-python_2.6.0.bb => python3-u-msgpack-python_2.7.0.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.6.0.bb => python3-u-msgpack-python_2.7.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
> index f3f321e18..4797a3535 100644
> --- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
> @@ -3,7 +3,8 @@ DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer w
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
>   
> -SRC_URI[sha256sum] = "754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c"
> +SRC_URI[md5sum] = "231609d87aa58459a1491c8f5df4e4cd"
> +SRC_URI[sha256sum] = "996e4c4454771f0ff0fd2a7566b1a159d305d3611cd755addf444e3533e2bc54"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------F0F0E1225ECFC73555361FE7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 6:27 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812102726.4376-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.7.0:

- Add support for packing subclasses of ext_serializable()
  application classes.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812102726.4376-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...gpack-python_2.6.0.bb =&gt; python3-u-msgpack-python_2.7.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.6.0.bb =&gt; python3-u-msgpack-python_2.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
index f3f321e18..4797a3535 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
@@ -3,7 +3,8 @@ DESCRIPTION = &quot;A portable, lightweight MessagePack serializer and deserializer w
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594">&quot;file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594&quot;</a>
 
-SRC_URI[sha256sum] = &quot;754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c&quot;
+SRC_URI[md5sum] = &quot;231609d87aa58459a1491c8f5df4e4cd&quot;
+SRC_URI[sha256sum] = &quot;996e4c4454771f0ff0fd2a7566b1a159d305d3611cd755addf444e3533e2bc54&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F0F0E1225ECFC73555361FE7--

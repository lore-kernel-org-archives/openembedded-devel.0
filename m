Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.40])
 by mx.groups.io with SMTP id smtpd.web11.20572.1593442276671518022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BbVjrOD7;
 spf=pass (domain: windriver.com, ip: 40.107.92.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPVtiCiVI8dA8IBwkzo1c88o/JOuTbBiz+AIU0HlekyekymaB/cBCOyAL6HqlIHWSu+pikkyRZUPFmISbfKDpWqGIfS2O9nlesV9p6c5M0wIyGlrWx3LdmLtj9BA4WDiOPODKTb170WQcp6/NqmgRUwFvwkRPSiyGTgeu+7e+Mkq1Gp9/zBRXLEh/4lRJ62Kjj6iZmlEnsjdVYf5B2h9nQTuuX3T2vW88Bphqkltgvu3zQe7V581nnqBXFOnTvvDKwPGzHkNfE6yIpJ5bfRrZ2a7fqR+QQwpmGLz05CZA40syN8eEwsJMfMDDYTyitr5+qYF/V2oAIbOeawgyexAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA1QU94ipu4PPkabB+u/8dKq/zzgV5Spcb0RVCZlRro=;
 b=QCdzNa3+sSVvoMwlDESaZIcl2x+vlQRGDHYFTlKiESdtT5GrrXRtdqgDeLOgHbsNg9UrrtvCfmVvdp19+EzVSql1Lc+UsuqmCc5Lzsy5KD4kIkSLxWaEi0K9od4maMX04auvCVWSn2w3IOL0QkEQCj8SJ48SKzoEZavqKDdcNv43PF/EjMX4ECn52MLwkUttn1zFGHY3w9Wi273hDFkY6uHMPKgZQX85OttbQa7F4Va3fHYGui7ALXR+vy8+61lfAc+yMrSKVbWT+VpYzn1K0UiVD0ZM6DehSvsXnZsKjhcJ9HpY0arl5n+y+tK2ZzudjAjv/T9S9HsVQseJD06VTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA1QU94ipu4PPkabB+u/8dKq/zzgV5Spcb0RVCZlRro=;
 b=BbVjrOD7mT7BVDJAwwQb2HzRuA64196uUG6kWa+PKqHj6wrpdJA4D0Dhr6Ho7zs+yJn1hgWDSL/D0Zjw+YA/7eW2OYXj6yZZXytVb0RZQvI4kZsRwM65PyZaLhMqymCTtZintCml2XcyuHfv6prYLA80v7YMEv446RL4sO6VrBM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:51:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:51:15 +0000
Subject: Re: [oe] [meta-python][PATCH 03/12] python3-httplib2: Upgrade 0.17.3 -> 0.18.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <82e3e946-cede-fb3d-2940-12d9de0988b8@windriver.com>
Date: Mon, 29 Jun 2020 10:51:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:51:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f55e91a4-5bdb-4c87-1bf7-08d81c3bdf75
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19885C902E15245AFBD50B089F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R4O2d3bUQ+JqPg8qu7RcrwdIYBhqP0Wyqy687LY/l+IKiNIHoFGPXt8RdLo+FF9sg8UBgUwygd0j3UzCmCYKwRcQi5xWVAhvrsvgrQRWwAvApjP2dhZHAo7sRAxtOdi0Wo1yMb+WO+4rGGCzSLoA5fFz1ODq5GtuYCdrEtpLiJ4hKpkbYESUZzc6A1RP4vNrp8bOo+7DnOiJl6ycJGBA/amdkTaPVQUCnzYWwpq9CWCLmU4AXXQ67NLk9zRHRWJlDFcft+cvKFgYGmRXwZtT6EzsacWYmSpWRUZ+tIa81j7NES/b81sSz85NNR6pPGuQJAY8mh41JmgWrJuQ3SCTnR7CNaQSlQMuWRS9c9pA6H7NbP5CS58k7MEP7KTTQFk6Hsny0IxWef0tibCqLm6RgKM2vZwTo1UvJMJxdkjmcpRVgqamlwWXgtVUoL6eC5m8Ly+CJVn9wCRkaN42AbvHUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(21615005)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dlI/1p6+nrWd+vAEBCN0ycULNWnKjDGqHtw2J2cNLZWTZbDD/su1GkpQIuZlY+AAHeLIArA1JzhnseebZwQbip8sw8soC2heZRIz99T1a0ybPXNFehmJNLITHNqmlGgLg9U3mMS2jbOWGG3xaAytBeWKGKK5C2t5fd3Wc9rTn797ZUqUsrRGXv+5TnETf2iTyxx2Ls8SgiBzHiAs/IcKkXKg8qQP9Cyp39TSbOa07gVyKn1RPFPJ7Ry7m5E6eXTfBmLogNDMWaMow3ih22FuJVqPRjXLxw2WuHpLDdUoNOKtkmHAtoOYFxve/jzLKyRI/ht1uetm/+VajkUaMe14HSrl4r+lzcVuAq9O4LVVUtEZRODXQjSi2AzIL5xdM0fWPGy3Zguag7QW1E9OypbIRiW9M9Sms8I8yOqUKOHt5FIMCPJM9T4VAW/EQ6f3tbFEq3hqM0pkEdl6YfIi0DQ+CAKcf0vbYQFZ1bjoThifvDQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55e91a4-5bdb-4c87-1bf7-08d81c3bdf75
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:51:15.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEeILo0a+kxasUvdoFAVZ5UufHIuztFUjOta4YcOG/YPZg2TKOiL8ud2EwwcJ1ISeRFmRFUF4yQz6HPAenRTNC0oJfv7ks0I4QoZzAhEjHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------96AAF2C25DA015B01C3CF892"
Content-Language: en-US

--------------96AAF2C25DA015B01C3CF892
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 0.18.1:
>
> - explicit build-backend workaround for pip build isolation bug
>    "AttributeError: 'module' object has no attribute '__legacy__'"
>    on pip install
>    https://github.com/httplib2/httplib2/issues/169
> - IMPORTANT security vulnerability CWE-93 CRLF injection
>    Force %xx quote of space, CR, LF characters in uri.
>    https://cwe.mitre.org/data/definitions/93.html
>
> PKG-INFO md5 checksum changed, the license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-httplib2_0.17.3.bb => python3-httplib2_0.18.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-httplib2_0.17.3.bb => python3-httplib2_0.18.1.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
> rename to meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
> index 57047c9ac..9c9b6c5b0 100644
> --- a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
> @@ -2,9 +2,9 @@ SUMMARY = "A comprehensive HTTP client library, httplib2 supports many features
>   HOMEPAGE = "https://github.com/httplib2/httplib2"
>   SECTION = "devel/python"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4edb3f072a9d815734530f608039a167"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2"
>   
> -SRC_URI[md5sum] = "5730490cfe83350477b54b0a8a190c8a"
> -SRC_URI[sha256sum] = "39dd15a333f67bfb70798faa9de8a6e99c819da6ad82b77f9a259a5c7b1225a2"
> +SRC_URI[md5sum] = "0b331f96cdb2ae0e0342d4ea0f5f0502"
> +SRC_URI[sha256sum] = "8af66c1c52c7ffe1aa5dc4bcd7c769885254b0756e6e69f953c7f0ab49a70ba3"
>   
>   inherit pypi setuptools3
>
> 

--------------96AAF2C25DA015B01C3CF892
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.18.1:

- explicit build-backend workaround for pip build isolation bug
  &quot;AttributeError: 'module' object has no attribute '__legacy__'&quot;
  on pip install
  <a class="moz-txt-link-freetext" href="https://github.com/httplib2/httplib2/issues/169">https://github.com/httplib2/httplib2/issues/169</a>
- IMPORTANT security vulnerability CWE-93 CRLF injection
  Force %xx quote of space, CR, LF characters in uri.
  <a class="moz-txt-link-freetext" href="https://cwe.mitre.org/data/definitions/93.html">https://cwe.mitre.org/data/definitions/93.html</a>

PKG-INFO md5 checksum changed, the license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-httplib2_0.17.3.bb =&gt; python3-httplib2_0.18.1.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.17.3.bb =&gt; python3-httplib2_0.18.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
index 57047c9ac..9c9b6c5b0 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
@@ -2,9 &#43;2,9 @@ SUMMARY = &quot;A comprehensive HTTP client library, httplib2 supports many features
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/httplib2/httplib2">&quot;https://github.com/httplib2/httplib2&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=4edb3f072a9d815734530f608039a167">&quot;file://PKG-INFO;md5=4edb3f072a9d815734530f608039a167&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2">&quot;file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2&quot;</a>
 
-SRC_URI[md5sum] = &quot;5730490cfe83350477b54b0a8a190c8a&quot;
-SRC_URI[sha256sum] = &quot;39dd15a333f67bfb70798faa9de8a6e99c819da6ad82b77f9a259a5c7b1225a2&quot;
&#43;SRC_URI[md5sum] = &quot;0b331f96cdb2ae0e0342d4ea0f5f0502&quot;
&#43;SRC_URI[sha256sum] = &quot;8af66c1c52c7ffe1aa5dc4bcd7c769885254b0756e6e69f953c7f0ab49a70ba3&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------96AAF2C25DA015B01C3CF892--

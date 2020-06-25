Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.42])
 by mx.groups.io with SMTP id smtpd.web11.9879.1593089929143478019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O/+emDbH;
 spf=pass (domain: windriver.com, ip: 40.107.237.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcIhoebGHlQiB/T4iOOp4Pelwnt29H6PHzik7kNqQRJs6avrl2tuzLChfIMxVPv7EgZNLMw0tswWgXkW137aDDvHS07yCj/Z3XIU0LlwqKUmGKfJrVgDfCENS/3bOz/fNgZj81ddQGkNSledrMFMRR4o5w851da87YOF+LZaH9acRATlCzvKuGsQjUl99FYcOVlBsDwJdqM7eMqHN+4kHMXFANN9RgW/sz6TP4Dxe39ZpLcl+EUmixByixsG7t+veLRipBBV0F/WT2ZzHMcBaWIMoX1uZWm3WNmEjgdOFGJvXdte2F9rwBFEehtAh7C9MkaYf15JAnE1daXMlFGMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ1AqKINsnrEtWxlYI1m5ASxOnz8GBfhjtEl9UzPOXY=;
 b=FPhbo3cTJRY4nfgbvAo432KU35XNPkCt6RwDXladRZ3jHm38lcfFOvZBLh2XfgY0LoK4hqBSX+CDl8mTuFAOZI0R7RlBLdckFXgcwR/vM6gze5qq2UOiVzIkZ+KNGCwMgErqmh8js9YFpOCGxm9Dk+JDzHop0zUissXkoj1znY6a2pBafcQJLfIQ09NrKwfN+oukp6fSU9oclQWhODQ7qAWR5F125xsNwcPkS6Y5xMwpc2s1SDY7DcbdeYERO3N9qh368rmS6iE7qecIqnDEaSlbmkc7e0icHPB0xJE+3MP61XuZOj4G9ECCMniJ97bj2X9LbbBdaU308squt8Pazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ1AqKINsnrEtWxlYI1m5ASxOnz8GBfhjtEl9UzPOXY=;
 b=O/+emDbHaowDAl1pCkeURV5jYeffGKAK7FEH5ux2DSFd2n+f909wXZK0LSotEoXHhehJaFrnEGzxbpzU6DJWDBP8RYu35bJeFJPGdTz7y23iQFzlxyjPIftAl+SH78cN18QCcdVxyw9w1O/F32XLdioy6RRq3yisfy6nFnei+5c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:58:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:58:47 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-wcwidth: Upgrade 0.2.4 -> 0.2.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4ab402fa-97b3-ccd4-8e7d-60061a5ae3cc@windriver.com>
Date: Thu, 25 Jun 2020 08:58:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 12:58:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b47d10a-4ff7-48c1-fc0a-08d819077ff5
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954B02CCA3767B9E5DDEBAB9F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VVPtm8UXAjSQojbz07XzIcvfAiHxWMga+fAiC4+v8btiN2gTQ2Wnoh6eLLQwiFzhbgDJBWNWNGcAxONRSnVE9tsepKbMtjEJOVpTb97S3+lz7rQY8mKyh+jpayS9zhKLxANIHACevUt3+f2YLV42tYt6B4OAmbdweL/zWHvvGKWxSb9+jD4E4JZOGKQuYv7Qfv3ChsgF8748plzjH6pXzc8JMyrvDm/Whe+rHWkuZNTpMc/ua85aOSAaEvN7MkNh4G9ScU5tQRVsH413f91lxCAaFa/koZezf/e5m+rh7ccwYUdN1tuwsNjN3ZGFITbj+f26xKX/UAU6Dmhrj/b7J+Q4adc5ZFgw/gwJt4toNJ2l9LRy3vrpIIrZjqyB7LSQo+OZ3xVb66rVWftpo5lmc0R/llrsiTdEkQbkV0lVMDUl1FMz0xjUJAHPgKMRxdCmj7eGWycdmS+I55mVd80VGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vKkxjkbNGZgnwIlQm3Nkh4lituhEhxYB3loEX1i18gYAC4rAodvwrM0Ot9yZro7m5E5jTAbo0HwTziNuaGTPfHoc8pr3xyACFAWo3A5h/MbrwtliCgO+So7JpP4i9jrg8dyqtcfjzgH0VBlhS8gGlRNUFTt/v3PBxKzuD9d1Bg2xjp3SKyk8Dx2pHdqL4ZBknDzA0ptKto34s4XwemaKpdaz8GxMH4uwhlUZOsOB/CsFX9y+ObdL2nxe8xGcIe41htvDLeM8RYvMiSdC05vUpdkk5z3iZim9Q3BX8QEg8dMOUR3P5J22rUgEVYy5PfqUCUigpdE7ZE26p1Qwt1+P9hWSFP60sN/AGmO4ZoJWedGXSstGOh+Dii1lErFw+tAWQxRQjARjwWOziTXw3O7dTsT9yvvX0QKIda2IIEvSItU6kULVD0vgjCxMeZUo3p4sBRbn0kpLV9DC3yvPnRwZEZsBlJv8ra6DVc25Ejonx2V7eO4SdTgw6F/jAzJwmV7t
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b47d10a-4ff7-48c1-fc0a-08d819077ff5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:58:47.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0BaefRn0M+YMV5+79dj78a1K5s7ferkEJA9wLt0/ujCs6cXOlWeJGvw1uzkaMbcGhpiaxCEnh69euBNLW+pqrB+MXmZOZ9vymVMAcu5tBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------CF62F9242E253B2EA68D6D80"
Content-Language: en-US

--------------CF62F9242E253B2EA68D6D80
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Upgrade to release 0.2.5:
>
> - Do not depend on pkg_resources module for list_versions()
>    function.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-wcwidth_0.2.4.bb => python3-wcwidth_0.2.5.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-wcwidth_0.2.4.bb => python3-wcwidth_0.2.5.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> rename to meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> index 48ff37654..710b35913 100644
> --- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
>   
> -SRC_URI[md5sum] = "5e6cd8cd008a7ad2c2578ac49a9d87a1"
> -SRC_URI[sha256sum] = "8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f"
> +SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
> +SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------CF62F9242E253B2EA68D6D80
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.2.5:

- Do not depend on pkg_resources module for list_versions()
  function.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-wcwidth_0.2.4.bb =&gt; python3-wcwidth_0.2.5.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wcwidth_0.2.4.bb =&gt; python3-wcwidth_0.2.5.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
rename to meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
index 48ff37654..710b35913 100644
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jquast/wcwidth">&quot;https://github.com/jquast/wcwidth&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb">&quot;file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb&quot;</a>
 
-SRC_URI[md5sum] = &quot;5e6cd8cd008a7ad2c2578ac49a9d87a1&quot;
-SRC_URI[sha256sum] = &quot;8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f&quot;
&#43;SRC_URI[md5sum] = &quot;a07a75f99d316e14838ac760c831ea37&quot;
&#43;SRC_URI[sha256sum] = &quot;c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CF62F9242E253B2EA68D6D80--

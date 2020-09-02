Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web12.10246.1599060662638961547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nY+45OnP;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKnj1/+S8iTbz1yxB502e4LXRzQrZYSw3o6bPKKIWhQWkxFAkfKsf7ZfWbZmA289VJfpb/I0hEodwXNhGSmyphSc82n3oAnHDjOTXIxFl91v4OQwT54BIty7T9FnJWoUR/56R+FUhxsWkBD8j7Y3ihzdOkFz53mvQU1TfF0P43NY+zNCpiFJwfJqGzwf05X0DF0Z5i6HWO4YSVKJR1WDAo8zv4OPJj7ha7z7FVT68OtSDWvGyEzdE9ZDFfcMSLH5WP4gP5K9SUyQw38dAJOIqfll7PB3v3NvMPMCR+f9LLVXXk2ZosanRwPPJk7cC5l8hm/ZYg1ehFghXZJjVEcY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6Ry+mGKzM6uzcj+iLE5x5JReQjyASO5qEbJNWoCM40=;
 b=kl64YngJLbCGzNU7lpp6CMmcHVZiphwCYXYctJNrDiv7b1gSLaJv6kI0EUKQY0AuPaG3Co3Ew29wcHWia8X9n6DBy0OfM5wWhUNaMbtiwbrm1prThVBEQbcezobITh0PVj4BmUwAO42ZzclolI0BIwV+tuUF1OnQmqs71KdxephcV0SE3TbwSlF0IZxUBiQiTwmXB/HLSi+FyGZxxm1p6OOTn4fiIzLaGPDv7i2tplCccPH4p3UzIRQC3vZ0sF0xzehoHlj6jsm9P8Jb3Wqrf9bx/IGsbHQb44Arr+oy3PWFmnlMbk1lsc6tmNJUnLqUSb/lI5UR/zg/M+h2YYjMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6Ry+mGKzM6uzcj+iLE5x5JReQjyASO5qEbJNWoCM40=;
 b=nY+45OnPDD9JW4+5+mTW0KmPOhXyWXVkeho3bw5Eok2roeYyfPu8qAkFbIvH5kE5GvpNihR45A2xMb+dZFCeXgKVESS1HJRNS5oKfJctC8Ih+rT5sKcF6gkvkKFecq4ao7Z0dAH0nGuy2+0eIZ7vd7IQWXwnmxF+0xDiAuI1tx4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3815.namprd11.prod.outlook.com (2603:10b6:a03:fa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 15:31:01 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:31:01 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-luma-core: Upgrade 1.16.0 -> 1.16.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <afb2e4c4-62aa-7016-718c-c29c1bba007f@windriver.com>
Date: Wed, 2 Sep 2020 11:30:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901081147.13556-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:31:00 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b76ae2-b263-42cb-beca-08d84f553280
X-MS-TrafficTypeDiagnostic: BYAPR11MB3815:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3815222FEA80E5773418C9B69F2F0@BYAPR11MB3815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DnoI1tdK2cbCWVwNkw+NPgD45kAg1XXj4OPUegV31szHugrWZvXvoWN+ltOjvMTTjbjJUP51nmknRJDyZ+1Q6fooJNLMER2hzjQGdWRI+n10bopAF7Xp6jbuq5fiRy9hVXUGxCmwKEy4Y9aISM2mpATizX6mvneD7hSPS1DUURh9yanWwQESupuOhoBcjsDNypFL3/35/cSgtDYog5TDSAqARJNiFMxe/Lsx0NEIFvN0sWI9N3w7r3j7HZU6xlyIWT1d5qbRBLaiPLdcbM9HRAGOu2nZhKOprQBCpXZXSfwJHHgQXdSg3fLJnt93I1Ieilc0y3J976errvH+aQIzEGUk3w+ggKa8XS2WN98jasOE1Y6xqsNGeqmGc7IjFJFiT4hqe1+J6Z9TvCxOd68qA37VHNTYzf/2w5wNEKzalwle4kdGPvN5VGF39Nw30UowfpnmIrfJMZiD58iAvAibAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(316002)(186003)(33964004)(966005)(83380400001)(6486002)(166002)(8676002)(956004)(44832011)(16576012)(26005)(53546011)(2616005)(52116002)(478600001)(31686004)(8936002)(2906002)(31696002)(66946007)(66476007)(66556008)(36756003)(5660300002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jzFl8z2dEzXSuR3FPdphzK0SnKmkLdPofVnT3geuNV3FY0rC9xfNRO++dzQyJny+atoB8chv3QcHzxRZ2lY9wA4T7Eb6W5GB44kFR2sfERluNcqE/FARqj0m4NUUetv1w5ujzthneYB3KQN6NMHI1eOAxe1XFrJPZbW52WjxSqNg/cBIR0ppQ+vsnkKfcuIFB6ae8ET5maMLbm3Pn9CHKo22kMZyhSSawERyTZ+iR/gVXDtvlatAaUCM+qgKkge3XXLyvJRWqn4VKHaTP4Oawz+cWCndXbWY8bK9KrtDDpiLU83cHPpT9G0/PgT9ProKFUrD2C2wl4BwQEeE8wrlkwK1nWePr3qn4in8/LvzgkyPFIF6CGMu3Gg9w50QEC9DdOBfdlq+dOWEfDOEArbjkUaIlPsQj8rVUfA/P+9faZB0VPz3vzY7dHqYAJUFR7rP0BF7429YDvJzJptpaTqkp/QhYX3e9lFaXAcso4pG1LGP7Ra9Vb6VQO15Zhv+mhwsxvzrPOuiVt5eQtQxEtpEbBnBru1NQHYYnZDfhP/+MzGUUqqP5+qQL+lWXpOAQGvwJPiTP7KobbvQS2eG+INVyvB83CvepnqechHUK9wDr3a5wggiE2CSoZ60TO4QNSS4DH3HeSfn0tb7qQYDPTFAYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b76ae2-b263-42cb-beca-08d84f553280
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:31:01.3726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Do7AhXwLhgo5bQ31WB19cfe+OHTCxxZOhYXa6SCWJvFGvd/hcS/rNrM9gj7D+RVj0oHqBQFyNembf9sO7XCDjXg8XEWBBRcpeKTSCS9/qbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3815
Content-Type: multipart/alternative;
 boundary="------------6E55C893F2B23EA52A777C52"
Content-Language: en-US

--------------6E55C893F2B23EA52A777C52
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 4:11 AM, Leon Anavi wrote:
> Upgrade to release 1.16.1:
>
> - Fix bug in bitmap_font: glyph_index now computed correctly
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.16.0.bb => python3-luma-core_1.16.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.0.bb => python3-luma-core_1.16.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
> index ce1e7ba03..3428dbe9f 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "52ab2cdce4222aa71d9ac254a806dccc"
> -SRC_URI[sha256sum] = "ca523f606f8fff2c9843d48b415a0a748bb2c96270eccac97d9caa9ae6810c94"
> +SRC_URI[md5sum] = "de7bda49c4146ba242923a88c587cd7a"
> +SRC_URI[sha256sum] = "2181a60906fea3104dcfa3923f9654928502cd7541ff9b4d76c6ae29c6a9d9fc"
>   
>   CLEANBROKEN = "1"
>   
>
> 

--------------6E55C893F2B23EA52A777C52
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/1/20 4:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200901081147.13556-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.16.1:

- Fix bug in bitmap_font: glyph_index now computed correctly

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200901081147.13556-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.16.0.bb =&gt; python3-luma-core_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.0.bb =&gt; python3-luma-core_1.16.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
index ce1e7ba03..3428dbe9f 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;52ab2cdce4222aa71d9ac254a806dccc&quot;
-SRC_URI[sha256sum] = &quot;ca523f606f8fff2c9843d48b415a0a748bb2c96270eccac97d9caa9ae6810c94&quot;
+SRC_URI[md5sum] = &quot;de7bda49c4146ba242923a88c587cd7a&quot;
+SRC_URI[sha256sum] = &quot;2181a60906fea3104dcfa3923f9654928502cd7541ff9b4d76c6ae29c6a9d9fc&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6E55C893F2B23EA52A777C52--

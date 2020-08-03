Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.51])
 by mx.groups.io with SMTP id smtpd.web10.6862.1596491763067603865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HkaDbCHJ;
 spf=pass (domain: windriver.com, ip: 40.107.223.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwskxB5gLyuqE2HTaJHUuHyRF93n3fnsAkWjIalT77BO6WsXPqGpdIf8YJkECzGxoToe83xLalg0b8V5+MFsgwGN9C+fNw2Rds8AD1Nm4Y/NtWtNw+mfjZ6yuMjLY40jy9yVecHnlR6OiEXIVUu9p3Z6giSskucR9UqOIfH2pjLs12OMo0mdf0WZPcF3+2ARLfu3QSNjzCxzmuYskvYc/20NU61fYkAOUNqxNeE33B+22DrQlvzgC/c/P6H/5pD0rabJZvTNTpRV43VPGkbQesAvDKNIDnFqCj2hhDhXktBdO6L2NC63DJs4YtyBfGZo9G/OY9LzFwvVPWWiirsfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvnMn/s4UgCDklWrjK4YvXeRrx5txMljk1KSDFchv2k=;
 b=mly4eyKSRma+CDpCe2jJSKfLQDzPjzPzAbDPULna8F7L7JIzIuJqoMgU3lY/qJQBr9vZktVt9xTeFVyWwWT42qBhsbTcYexZ7Dg+yqM04a+lObGVxuwoipSZtn7EZZvLK5y953vvcABOfiLRAZgv0N6qpfCwyG43K1rviRi/qjFkeOGE//V+YhT2auoxdEGhMk8j9rhW4fSIOdQWCO5GcRarpHRSYqx1hxE/3lkKwgHuf4td0/0EnWmC4QZdPO3G7dbpkH1g6BWKtyYZhD5HcetU9giSbGJ6ivwgeVxzFBzH9Sh6SKMwmWLGE0lXAKfZz6w0rC8UX6QBcrvX/VgPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvnMn/s4UgCDklWrjK4YvXeRrx5txMljk1KSDFchv2k=;
 b=HkaDbCHJ9pxGzTeBL5cf0H1qnold4PbIqqst6FmSKMAWHIWxksIIHuhNWzsao32vHIZ1wYnqOtBN4cO6Z0fkUM/HIMMtfMMlaB5HO+w4jA6j8GJRqdJKp8SEqMvbDBAikPWs1PttEQaqIzOpMB/34oOSWdMqfp7gMg3kCMX9suQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:56:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:56:02 +0000
Subject: Re: [oe] [meta-python][PATCH 13/15] python3-pandas: Upgrade 1.0.5 -> 1.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-13-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4dbbebe7-9c57-8fcd-7378-b95ac62f3975@windriver.com>
Date: Mon, 3 Aug 2020 17:55:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-13-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:56:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d534f7f-f08e-49ae-0cfa-08d837f80319
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41513E6011B6334062833B079F4D0@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kmaiQBfckQ8pAl2t4jJpy158TZAWkoe5hc22FSkbRvwqdCGIss9ARtU7dav1u1HAibVfHzfy68rT41tMMZMZEPwKDY4aEYF71UyeSeju/3mtLzGtb2PVks1x8JJquI7CQbwdRkvTgSf0m4VIyaPGDjYQriDE1HO+KFA9DqXD+8S1gmJv/Nny5twJNK7Ij8lX53FcflfwUEfXsexdh/dgqFMwDz41CeqZXpiTgXxj5ycWTb/MR4tYNCpPLa/ZFKiEZWgqO+jgGzC6eAzuClws/S+whV7L5r5k1k1h4LZsHD9kh52SbzKoegE207edCTLf1VnPr/6V823BSp/nx7bP3TLmV8fz6V7qiWAnjsQRrnyvl3xsmNyV5p86jGpk8m3MpdY0cI3tQhgMQEWoHUO8Y/EnKG80bsbhMHWLSsObPqtNZmXQ6jLjJkA0XR4GhoCgwn3oMIeSFsCpbLD4FseytA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(36756003)(16526019)(2906002)(26005)(966005)(478600001)(186003)(86362001)(31686004)(16576012)(83380400001)(5660300002)(21615005)(53546011)(166002)(2616005)(66556008)(66476007)(956004)(44832011)(33964004)(31696002)(6486002)(8676002)(316002)(8936002)(66946007)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	utTtt6KmUPOGzBCYjT3uJDedSPfgCL0Y7HCYbK+KtOVcfJvHdvuvvCXpHtEs+pkCsJdQDVvSamQSyPvhg1oiDC3A1HTFK9Ubjbi8FFr6vGbqd5wGSvyIzrBqVQN07+ejbhXjr31CMZ4bxTNTNsYD0SxlX0xSCpvQOAy40XgyaUsAcuEmYpAJW4BpnDpiZN9nP/sYAkcB76/OVIzZEkeC9sLtu62ghgNx5SS7UHxHSNd8gWpUdR7slUZoL0YGJ0xSgx+3oCSeNbXwb6ZMhGbngbDu1VG674UubS+ANu4bIx6l1qfaQz2ZVYqFKGORtOWq3o3zn3ej4JTSzmH1A/LXGJ3RKPomONwYPxLIKooe++o0CHPVckqepsgstdPznpbX9GLrVim9WJid7c3qzJs4AdrFYL2/sGKdK2acRqR0IZrxjwykKwq3AndeplPizyc6hgBKW5Typ7hmo8hPS6QzOuzmKj7l2SGRkEWgyUwppMRnadrzNBOnM9YMR1fSvZesXox7xRPs+pjGuYN0RC9punqmdNb3fxkEATD98UseOABZBZOMxT9Nvc3fLBSaFmBzqp/I1qC5yJm+JBHt3K3oG7Ku76BiBznzNgV+U12g9oBGSS/Y62Rp5q8zLSSGv1fJ4ptBeFcoMV23IaTpi/65hg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d534f7f-f08e-49ae-0cfa-08d837f80319
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:56:01.7984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTi9Wn18WVu19hBQ1TUAWpK2iD+Zw8LAJE9PdBKN0pArxZtZG3gw8H3LscZqPEh8oufohsH3xuYKqf4112RyvQXVlaqI5qJKV0RnMAIkPNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Content-Type: multipart/alternative;
 boundary="------------447B12DFAFE3B712956FE6E0"
Content-Language: en-US

--------------447B12DFAFE3B712956FE6E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 1.1.0. This is a minor release which includes
> some new features, bug fixes, and performance improvements.
> For more details have a look at:
> https://pandas.pydata.org/pandas-docs/version/1.1.0/whatsnew/v1.1.0.html
>
> License-Update: Updated years. The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.0.5.bb => python3-pandas_1.1.0.bb}    | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.0.5.bb => python3-pandas_1.1.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> index d8db4cef3..f100677ca 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> @@ -4,10 +4,10 @@ high-performance, easy-to-use data structures and data analysis tools for \
>   the Python programming language."
>   HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>   
> -SRC_URI[md5sum] = "5183db713194e6fbc96c45f30a0d1311"
> -SRC_URI[sha256sum] = "69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8"
> +SRC_URI[md5sum] = "512da48424b85bf198002bdbdf38af5a"
> +SRC_URI[sha256sum] = "b39508562ad0bb3f384b0db24da7d68a2608b9ddc85b1d931ccaaa92d5e45273"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------447B12DFAFE3B712956FE6E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-13-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.0. This is a minor release which includes
some new features, bug fixes, and performance improvements.
For more details have a look at:
<a class="moz-txt-link-freetext" href="https://pandas.pydata.org/pandas-docs/version/1.1.0/whatsnew/v1.1.0.html">https://pandas.pydata.org/pandas-docs/version/1.1.0/whatsnew/v1.1.0.html</a>

License-Update: Updated years. The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-13-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.0.5.bb =&gt; python3-pandas_1.1.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.0.5.bb =&gt; python3-pandas_1.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
index d8db4cef3..f100677ca 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
@@ -4,10 +4,10 @@ high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11">&quot;file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>
 
-SRC_URI[md5sum] = &quot;5183db713194e6fbc96c45f30a0d1311&quot;
-SRC_URI[sha256sum] = &quot;69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8&quot;
+SRC_URI[md5sum] = &quot;512da48424b85bf198002bdbdf38af5a&quot;
+SRC_URI[sha256sum] = &quot;b39508562ad0bb3f384b0db24da7d68a2608b9ddc85b1d931ccaaa92d5e45273&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------447B12DFAFE3B712956FE6E0--

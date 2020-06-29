Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.50])
 by mx.groups.io with SMTP id smtpd.web10.20524.1593442286568930414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fRLxjx2V;
 spf=pass (domain: windriver.com, ip: 40.107.92.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXH8m0b+DPTNqidnhSU07AE0FT5Ae5q6Jv3awW7k+X9SdPzZatRPBNokwDuxOLw6NB4tadiAYJvWWQzTbNhE8kw+XbL+jdvJT825isTQ/BoFKVIctIlGIiVYgQRsydRFCySxihyTgcRyqwPOIgt/Zg3blsGj40iCGriZIWqED/4aEi6r4XyYacwBgFYyl5XJyCjLS25SrfFf5Amid2xADiw1SgJIppoM5MWXWYsI5Z/23BxlZcp0VCVv822N1NnGlUYQ/+O6wZD3qUnVz7Kft9YpAUD4g587kABbM+muMhlxD+UMNAFxmnJzzZFP4E6EeQjO9h9PUiVnJxkNF5Lh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btI9dk2JeDLD6pocHfJHJ+bqO6eX3KVOIpogpYx+fic=;
 b=oJbPlU5CgBVlSJjcTbb9pcR5jx7eofOnCPNTqEWDwQbjCTIdwuw72nDlgFecEs6CCGBuUjFAFQwkp/+Ek9ez2eAwK5xLfYLhQji69x8U0d4U1Y7tXgmwwYTA6W5JnrIItlvEYmAocWtJ4Y2AMc01izH1jbH1lxJvDh8ENzygqZnGO4hvzxH3doasUebfgqm6bOvUt0XpgEIdNKrEl3u3ImNd+mc6Go3wKKbyr4gbKkCRdtHAO30KkK0O5wqYnYw94WfKylEM4BgHPNvpj9+7h8ejNfZFH0BucVNMVJ7xOCUC2D83apSFJ6Q4zTkUJDM+Z2IFYh73AksV69mEW3Bw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btI9dk2JeDLD6pocHfJHJ+bqO6eX3KVOIpogpYx+fic=;
 b=fRLxjx2VHDHDnEbWxO0HzGJsTjjQz/3eO3aNpnhFEtxY7f3dcMGXQJYJ3n55WThl3F9xSFrnpgZKMJZMu6bjQWX+49icipb7W4b5c7tCqx6n0zL7T1QrPIFDD6D7CCMJhYNuOGp3iQ1hUOP2iOot0OdgK45EjxHZ+IGNBmtsuZ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:51:25 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:51:25 +0000
Subject: Re: [oe] [meta-python][PATCH 04/12] python3-cppy: Add new recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d980497f-5e3b-c152-dc38-ebb34e69949b@windriver.com>
Date: Mon, 29 Jun 2020 10:51:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:51:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20106c1b-463e-4c80-7e00-08d81c3be550
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988B696B96D6749F878F7C19F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3bB2h7EZXK+1fPDAGtOyAstSYBYhWIXyMnmdo7bY7KsHXURS+kRUBQE9UolWCTu82KyUvbhYmuj+FF0xR2fVoxshBU187r2s0Ig9lXYY81T0kc52WPvPQZAsuk0gnj8Sy7ycB6Ycbm27USOeFxl24qYUt1jJCbu3DdziAowda77yuZ/oLowj5B1AaIEQLdt/tyaQTyfabVbZ7IybidlUwJ37xMapzaldpnm79EsCTwvh1lSH43Zy/OmRYT5fIZN4hqvKbM3D6OfK/8R5NDqxxh1P2RbYQgb2Xo0XzdzKgo75FxnqRFk0bHBwBs2kMGhh5FHwjDfsqmarwl0cD1MvXv6yrePRU9tcqCoc4kmdZT9LAedGShVV1C70pMqwYDzfAhUXxLqGCbAH0GCOUN2ex7HUyvAMs4zEYcEaOSiofOJ6ExF8DLgB1du/y8wOEd9iZB7zh3r0DYxbjWSGHyt+pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8QofS9141708kc3jktYBOqFn1vXZh/sQEdl2ZzANp2O6egoHX8OTFWFG5ckgWXCuNMX7bpo1fkzALuel/GvSiF8bwbSOE4OUVerKGKaAup1cAxEAJdFJWIBygNVRz7aqU6bTrbbnRC4+H14KITxc3RM6FGyFasSQqfnsdTeuwHoV36JeGpXfIgEw97RUK7kQsJ1M+GYyypnWgdLSXEIaT2+cNI/slgi5fcOzb3w8OIXYip0iklrpgB47AgCFfx+Q4IP0f/IYZU2vb2mBQ5vWRYWXMbwN/zbga1NDWr4UywyqVvx+TTidT+DIMX5WU3cVoPzsYOTSXPySkbIa2DOSSsC016Fc5TdeEdqfDxxXi1fv+pfncVnX9BK83I5VljnGPqN0wc+OdBoa/n+rRYiOZCaZenXXFXZFAZr8JVbRAou0icbZCJ7AU1eYLcTcpP7YmLIoe82bRzVU20oiD4mFzrBEbb2aEl0d/OjG11lH8sM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20106c1b-463e-4c80-7e00-08d81c3be550
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:51:25.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+C5JR0F8BEBKva20HrldbgMAhydB5QvPaYmgQwvgQWPxZXOa/CnS83FeGSnthxsmK0pv4cJ7py2hmG/bs4U4LNqqGEzRe1dQbmy1jGqdJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------2406988AFA5F5A8EEB75B52A"
Content-Language: en-US

--------------2406988AFA5F5A8EEB75B52A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Add cppy release 1.1.0: C++ headers for C extension development.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-cppy_1.1.0.bb     | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
> new file mode 100644
> index 000000000..79ddbed7c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "C++ headers for C extension development"
> +HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
> +
> +SRC_URI[md5sum] = "2110891d75aa12551deebba1603428c6"
> +SRC_URI[sha256sum] = "4eda6f1952054a270f32dc11df7c5e24b259a09fddf7bfaa5f33df9fb4a29642"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------2406988AFA5F5A8EEB75B52A
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
    <blockquote type="cite" cite="mid:20200626112944.25569-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add cppy release 1.1.0: C&#43;&#43; headers for C extension development.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-cppy_1.1.0.bb     | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 11 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
new file mode 100644
index 000000000..79ddbed7c
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;C&#43;&#43; headers for C extension development&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://cppy.readthedocs.io/en/latest/">&quot;https://cppy.readthedocs.io/en/latest/&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371">&quot;file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;2110891d75aa12551deebba1603428c6&quot;
&#43;SRC_URI[sha256sum] = &quot;4eda6f1952054a270f32dc11df7c5e24b259a09fddf7bfaa5f33df9fb4a29642&quot;
&#43;
&#43;inherit pypi setuptools3
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

--------------2406988AFA5F5A8EEB75B52A--

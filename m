Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web12.14844.1600180042382816203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bYcBg52x;
 spf=pass (domain: windriver.com, ip: 40.107.237.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYdtvZZBJZkP4ytAt2zOCKaL27pF1YPnLRZzPeH0cBCHP1UYrBA6axfROHZXZmpXhodLSFXLWUV2rYIGtx13ywPQ5Ce6UdHBgiRDy1KdgMie6qAAbcdJUuBVou9s/OIHR3p8DaFf/9ELetEkzfS/aXrfftOAhhVo4Ibyhk4Hd3Xz4hUOvsvfWbdNCN3lYcmS75gwVLkdnMWqZ8YwAI3TJ4ecr5m2tCFYzGFoymro8FWF/xB3b/PuVmtr3HWHO3QWfM2mYigeP9MvQw4vdXzw2hCeDT/DeVnZAXxYoyxm65rDd00r6KeKCSMeGzW1/CelocV9bYCrwIm+/Mn6N4sXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWHymjeyJNSOwktvDOBz9V72fCh8CDGqhGTiP54oWbI=;
 b=jI/FnOI1ZT6usZxnLOiUzE3zr6ObX8veeK8HOQbWhLa2xMhM0HTTUhMmNWWsid0Xunfa3VmmKKHi5AYtG3RazXUKGRRY6l0aD4aLpfCrG4XK1WZeURTVkRvK9npA9BPcS4Gvi6nl2Qf1uoka+1Qab50EuWCBdlTSTvh7IFDx0/fAJXOAQfFLmXZth4aYIQ7Gny8fwzoajv1Vv0sxHU4ZCvd15Vvm+OGLPPEAlqXAHmgoecqXY9ovrEbVcrC6+Y6FA6hKr8lXPoZLlTHIvoilzQQlWf6jaOEX/8qBZHjjxOHSibjsbzo3JaAUPhbhChNExNQpyNocKxcmqSgjuIWKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWHymjeyJNSOwktvDOBz9V72fCh8CDGqhGTiP54oWbI=;
 b=bYcBg52xqlK02qvnuvK7YC9fTCGJh8WdpiY+13fcxAKtdoETdwIWrlG3+NmwwSTcc/dnxTHBcHP+zYOYb5SCa8tjoWnxVv22nTKG8m+LOUYDDoFADBFGg1PB/omHVR7C+3GDOz3cjtUBRKnHyMU/OferhBxWbXl5wA11bGP9hrE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:27:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:27:21 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-tqdm: Upgrade 4.48.2 -> 4.49.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3afab88f-5f66-f90f-a817-8b9692ee2ada@windriver.com>
Date: Tue, 15 Sep 2020 10:27:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:27:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9a53619-7fcc-4db6-332e-08d8598374af
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37674C74AA8053FFD08493769F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B/n/SclQeuj5gmvI/JIdmqdGH2qIYGVpIdEESGzjs/nl/vOwZX7SDO7ILCk5LHS3kW9Tan7nb3QyDg/EaPDKwHK+PHhzGeoE9ecgs1cubz30JEO4/IptVY+cfDKCatkkws5YkB8Y5l8hA3S66L0dhdqKKpP+91V4JUKQngPlrHDhlDDo4moRPqZUt6Esi581HtcZlUDtwEE5VPew+UaCE3EdMfiIcObKj1bfmT6kJCCJhXRf4vxC87hhczl2USdqE7vE0c294R84OH6rXBh7ciUzqpmF3mqxOIB5cwV4sz8g2Ct7X6Hu/QtaAtNSPBRLwJAeatVJs0pxttgNAEtM/JI+/t63p5juvTwsdGhrqHHDvBi4PMqMO5MuNlVP3G08N9YYfcU5SBCK55+TQyhjkj4cCu/fTf9fCKL7BZbgnohhpDFJENAwTkQHdvSPAuQ4os0VQOmrdvg8vHTIYe6NhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zAfrXGq7hSrYL3UQ3JfmrL5XwjzUM39qQC6+3sCQN93yIvWNiXo4IzS6OtGszuXwhAKL+KxH0gkjAQgXRQtar/KjSSb19W9xBFA18DMvy4OrsgSfjX/aBiheSFSyHNtxCkGojOWjS/MidPvR3blu263/S6i+tpA7S4mIyf2Oq7//XcmjZBHD/s6a64A3HbGSvH6C5EVija3hA+aRBrbU+1tlxjg+FnDVIWGIQrKyCsdnRux85sb87VbkjXgXTTQHiWyHFwEtwg8xS+CO+fkaATv8GBKSJiNU8qlYdGUuiKxIi8xHFnY2QiQHAWIN3cVuoAtc0DOM0nH8x2MytjOBa11RXXszSR46hHkATNK+IvSN6vgmq8hJZUYgncSzFMJhkgtaVr1gSIDOMMaF9VMtF1+cuQcJFws5Q+0WK9jum4ngVn+M7O0mYdEji8slxKQ3U5jpdxaSfHDbZEZiFAh/vYwjrwE4FXW7qyqrIJaJKztJBmyEGA2OVo5sl8eZqLQ91GZIsNDrmCCNze6QbLT1GmfPZ0/aZxAJKL/Ptp24nSVkDZoFkmY4/R+WVXTIao0UJyuq3r16f89WWFj11z5+vFHPNp9b/YRubppQPgWkh1oz55AA+YwVqIjSCZQ/gMZZFdB9Za+GONv6hMmYOMG3rA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a53619-7fcc-4db6-332e-08d8598374af
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:27:20.8500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bejZ2G5mhHGLe0WtBdkJtjrw0Rc8rgUgThwkfjZDwGnH5j71/wgzp3Nqx+FXfPNtoLaBw9j3A/XOp0e/fxTGqYcQNFpDevZStDfko/8YJdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------856D22167D33B4844EF10441"
Content-Language: en-US

--------------856D22167D33B4844EF10441
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 4.49.0:
>
> - CLI: add --tee
> - CLI: add --update and --update_to
> - CLI: add --null
> - CLI: accept - instead of _ in options (e.g. --update-to)
> - make update() return True on display to ease efficient use of
>    custom callbacks
> - fix py>=3 CLI --delim encoding error
> - fix py>=3.5 version detection in tqdm.auto
> - fix final ETA when using initial
> - update documentation
> - add & update tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.48.2.bb => python3-tqdm_4.49.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.48.2.bb => python3-tqdm_4.49.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
> index 831468095..26eb1073d 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "d29c836d74d2f2ec6a10d052937f7371"
> -SRC_URI[sha256sum] = "564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21"
> +SRC_URI[md5sum] = "c2afde3f1d5aa108376fdd0f4b20821d"
> +SRC_URI[sha256sum] = "faf9c671bd3fad5ebaeee366949d969dca2b2be32c872a7092a1e1a9048d105b"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------856D22167D33B4844EF10441
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.49.0:

- CLI: add --tee
- CLI: add --update and --update_to
- CLI: add --null
- CLI: accept - instead of _ in options (e.g. --update-to)
- make update() return True on display to ease efficient use of
  custom callbacks
- fix py&gt;=3 CLI --delim encoding error
- fix py&gt;=3.5 version detection in tqdm.auto
- fix final ETA when using initial
- update documentation
- add &amp; update tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.48.2.bb =&gt; python3-tqdm_4.49.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.48.2.bb =&gt; python3-tqdm_4.49.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
index 831468095..26eb1073d 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
@@ -5,8 +5,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
 
-SRC_URI[md5sum] = &quot;d29c836d74d2f2ec6a10d052937f7371&quot;
-SRC_URI[sha256sum] = &quot;564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21&quot;
+SRC_URI[md5sum] = &quot;c2afde3f1d5aa108376fdd0f4b20821d&quot;
+SRC_URI[sha256sum] = &quot;faf9c671bd3fad5ebaeee366949d969dca2b2be32c872a7092a1e1a9048d105b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------856D22167D33B4844EF10441--

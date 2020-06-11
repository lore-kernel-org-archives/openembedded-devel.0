Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.75])
 by mx.groups.io with SMTP id smtpd.web11.7212.1591881814028854922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Df+E0imw;
 spf=pass (domain: windriver.com, ip: 40.107.69.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqNM3wmMpdYedHqg1+zRj8RlOoJlPUnM8XHIRNZvdUQipFb4SJ+ddcGaxnBL5UzSwCwxl9B9gzyQWDiyr+ZIdH5RQ8XKpendc9iueR222CqJ1Jv8+ZsZ0re/kUoKxWKf/5MdBZ9Euzx8qbliOMcdymidk28/ovJR2G42+Y2t08kMtmyK/9brnnnKiTk9qbqG9v8ChYIMFbPH0wll7ycJqPdc61nC6KIDDbAymHsJ2hxCJVEIYU9B7i6WyauTu0QWd+yEIYs6s9TUpOwRvPHGxp6T/LDLe8qysgOM4bL99PuXsJ4xxrliq+WMxWoW77HNZdWgoOKDn1le2JTjGKOqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeWdvqrxnxI3NOaAnl1nazEA3l+j75VcdzA2JUx9nvM=;
 b=WsfKhRMFCB0PiV2OdWn6ejGa0ItocF3AIPM4dT0GyRjPDB5hAb5oJDvk0bJp8VtVENiQe/iW7b0QBeqcvapslZXKKVWo/Xa4NfYak5ETrJenml2ZwadfYQP2rv/h5rtbsM686wCWc8N6MQKgXr7fohAjkfGZR9BT9KGgbzaQ6CW6YaaRMHD6jhEKMACqhXz7ACRK2fOWa4VENdlrH+4EchAhM14aixGMlWiSevF3XQuDKoihdyBKHx5appiu3Qwbo1j/7NY/lEQcC3kqiUjGH2bhmw676L1pMz68Y7kdqgmzUrYi0vTKkUr8COnPKwRl5dJidZ5PZxtTzR454Qq5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeWdvqrxnxI3NOaAnl1nazEA3l+j75VcdzA2JUx9nvM=;
 b=Df+E0imwwAVLrBmOfWW6ov7HlCgKj9xX5lp5zNHDAzdl+vDfOqqmGxHcN5993maXgeZD9yqszKQWdncnIO0L0/BFXB/0xWU0lYsCd5r/LOqdo+4c1jpZiSkP8lsOw0JBBGRfVPueg/Lr43XhotbEUbjV9n+MaiS2uTshSSiN4Ec=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Thu, 11 Jun
 2020 13:23:33 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:23:33 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-more-itertools: Upgrade 8.2.0 -> 8.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
 <20200610131536.31426-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bb8052ab-753b-99f1-4de8-2a44eb88643b@windriver.com>
Date: Thu, 11 Jun 2020 09:23:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 13:23:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc67a66-630c-4969-3d0f-08d80e0aa379
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1780C8A07EEC4357018F66D99F800@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fTNM94Rf7EPFMw2YCbUIQc8A+qAzRXMAbPfbenvszt40oaIyG/YsAG78S+mM894j1YrYjphXgnwYDcwTypZp0LrZyl5UBjjEFSB2p+vAAIDupTSTsi5H30Yx8D3RY0ZNDzYrcvQdkP6dtqBQj0dTv7XSIHdSE7j1PUDOFnP1XPkO6ZAf248FHZPlirgGQWZmgLzX9NgszrPrPuMKMAhS0pFw7Y2h83iEemjgPBoehTxmjVHdxw9caBBHvH3ERuLk2jyVeg3n2kiup3rpA+zdPwx5W3OcXj3rubtw7QttmMqexzwDgpC9mVL7woVz3cgUlshprB3nZT+t6YitK5Wmhj3yogz5RlzvD1XUDpKk/ABs4/Jz25h0IAYOng836+JHY4oWF4S/bAjNh1tO3WXXO0YALWOVC+a1fElDfVDve4ydq4pWlpHoUbcBNtEWYKn1GCK0cDIl711pE7BFLkbHEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(16526019)(186003)(5660300002)(2906002)(86362001)(6486002)(66556008)(66946007)(66476007)(52116002)(33964004)(16576012)(31696002)(316002)(53546011)(31686004)(36756003)(956004)(8676002)(478600001)(2616005)(8936002)(26005)(44832011)(966005)(83380400001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sXNQkPxYbY5/3pUN9mJw0pSZRgL7L5K+ZcYw+zE6UDeqwTzxEcty0ikphbYnwJpv4206Pp0A2ufn/ZqvNPjZ5aqERR2M1ZBu0+Qv7qdbfR7DJwSW40expeUO4PuOhXIsR5t+2D5/szxr71jkQBnZJaDsjpxMstVhevNAp5458QQcr+6CFmHqlIV9ghiPl09GaKIshLL+ukQCASFfWi8NAyLqogNDPeThUPmEUvu+ETXr1r8i5+EjvKLRb70/flCxk7PTvZXUYJizyVecf/HbXqQoePZAC/w9I12ZqqXW7MaglKSZoEmAzkYh8XZdV2x8Ua29cNGV4ak5u3MeqizAHVK3vuzafE/pbnboGL1mRRAeFUwbP5KNKZ9vUm++3MD2hqVRsuA9Zw0LwZF5yr4HifTQL5JQbXNVnHKJSnW5HT7j2mQ4j3cdwRaQ3IhXyof5a3njMnlm0t0M8t2GMbokBtOK3gwtNhBfShpdp80MlQ1JJrE3irw58XWaUTKrIQTO
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc67a66-630c-4969-3d0f-08d80e0aa379
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:23:33.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujbO5vDG5mvfV1oVVkHbrD3GE7Up665oNvkmmnS89K6jtRLEYXVnuCzny9qM/P2GV7MJz1DgLFbYEeOFeZeWvdTC79hg4MuQXsEFUDinGOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------3DA85D7A214774DA140D922B"
Content-Language: en-US

--------------3DA85D7A214774DA140D922B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 8.3.0:
>
> * New itertools: :func:`zip_equal`.
> * Changes to existing itertools.
> * Type stubs are now tested with stubtest
> * Tests now run with python -m unittest
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ore-itertools_8.2.0.bb => python3-more-itertools_8.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-more-itertools_8.2.0.bb => python3-more-itertools_8.3.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
> index 1718fdf93..97393d050 100644
> --- a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
>   
> -SRC_URI[md5sum] = "55e7e0a5eabc5a57bc8353c65c6f9965"
> -SRC_URI[sha256sum] = "b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507"
> +SRC_URI[md5sum] = "03dbc82ec1c4e814733d84abf79f43f0"
> +SRC_URI[sha256sum] = "558bb897a2232f5e4f8e2399089e35aecb746e1f9191b6584a151647e89267be"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------3DA85D7A214774DA140D922B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 8.3.0:

* New itertools: :func:`zip_equal`.
* Changes to existing itertools.
* Type stubs are now tested with stubtest
* Tests now run with python -m unittest

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ore-itertools_8.2.0.bb =&gt; python3-more-itertools_8.3.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-more-itertools_8.2.0.bb =&gt; python3-more-itertools_8.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
index 1718fdf93..97393d050 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/erikrose/more-itertools">&quot;https://github.com/erikrose/more-itertools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5">&quot;file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;55e7e0a5eabc5a57bc8353c65c6f9965&quot;
-SRC_URI[sha256sum] = &quot;b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507&quot;
&#43;SRC_URI[md5sum] = &quot;03dbc82ec1c4e814733d84abf79f43f0&quot;
&#43;SRC_URI[sha256sum] = &quot;558bb897a2232f5e4f8e2399089e35aecb746e1f9191b6584a151647e89267be&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3DA85D7A214774DA140D922B--

Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web10.13175.1597334089893689827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BU465AOs;
 spf=pass (domain: windriver.com, ip: 40.107.220.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0sOPLPVIJwpOCxOe6cXgkmNaWvOavxquaGKPeSU8ejh6ThUmoD1actK3NkGAWDqj7ui1YNjtca9/5Xx6fsUDZp3aa8fX+dAwV/RCC7XFVT+TQbJwNHTmJUtSuGwIoct6CBTpgJP99r/u5/ObsdSMtm/4u9BQU2LRehLR3opaPnuyRJv21NqVOhHRqeDyGmHYjv1NB0JTSkCLsXCDXYrW1egbfyV66yb03O62Fi9vE1qenw9smG51RmO62jnPK4ZpOL+8H6M79p9xiQ2/limbDUdsVoVWX8f5ITUgbesiT+WEJeln/+Bcc5Z9SRYmEqirITo7wSQ/U9RyXvmvkmHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzFf9kjVR/0fjpvLWxoAEPs9lz26qlaTrYdGBTWQiQI=;
 b=Jyfkf0Q3pIsr5TkYsj+ugJ3qgzY41zJ0aJv0MfB0g1uADXBCJg8ZV1SkA4Naf6BtdLx/60vLBdx+YJKMe8IQuf2YC6j5yIsSDgz8fUlN//23OXMoU/8Nj2dqrAMevDENN7CZJL5zd+I+wRgjUxbiprEDSg/WFQbp4EbQpQoV8taCLBbUBy/RlAmsz6r1tRFXgEDxPQ+uwqnB3uDx6HCaAX6UNgO0+koTRtWjfXBu/6FcCB8oo7Pahv0gHxJLxmrLB0coC2qIkEhiAgHi2XCUrwsmExHfkExRNKkxFbOWu4TbDkbynzxsW+d0k/msVxj9jtXu0WFhDdjLRVUp4C8jYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzFf9kjVR/0fjpvLWxoAEPs9lz26qlaTrYdGBTWQiQI=;
 b=BU465AOs5SJ4SZI8MTcMk08gAa/I4E/5LTFgdfOktHwoz9I9MK02Pkym39jcL9jNORIO81YGskyOeTSL1XjCv4yi+zQHIAxehcH3Ktd7LI79sGizWqeMnGEkqOUGH31167N7hyOSdVcr2singNwc9tHWIdvfrkYm/AbcK4vY+KM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:54:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:54:44 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-sympy: Upgrade 1.6.1 -> 1.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ccbe5e95-3bb7-fa11-79db-e7f6157f8342@windriver.com>
Date: Thu, 13 Aug 2020 11:54:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:54:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9d46109-7879-464a-62b8-08d83fa13232
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36060CF71DC6BBD352A3D2449F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IylscpRJdBD6Zy2XVL8K7CvmObgIE49SIO0eJ6SWSfRwq4oZibw0rHef0yhSI5IPwG/EHZihZnPX12Y3bNqTDIK3hrPOzk0uHynoZVL77z6IF3iyaK8jnzOo48NzBRkM48o6znegfTwnxMGALetfJWxkDtULz4W0PUGtTeRph7T9BId40RWhmjNa4CQ3RtOoyug5p+Gs4AGnnTBntsvMGThUC/gR+sZ3KNo240dICCV5rJUJyiENRG6JlzTcRJhThOvGcd45OSsPX42WLQ4RotwzezuRGUhZbCSkkxhNdrYgUsji1b9Pd+K6cIx4bSiQ9/2YmJhC6akrPDRCQMfZWaCIyFQmho3heP1TfxGTXJC2s973SFgvPPNb8lbzcpci+k1u4oZ1WxFE4YHDXvc9AaPAAXunYovVXjcZSLqFVBk4Csb0inwzWQixa5ZBPNltjiLPbU15Dn3SYm7kO0sATg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HMm6QWw9pbZp/qf2Zv6LZ8IpjQv1QzJ3WVPx9KQTb5owSTC/+YjGhkce7TQjHiajizRpJqsH0KjgskgmUu5KEJRAKcNILmoMxImBaLL1eQ0TvXvCX3kWl5UTy3tNdyygexE/5pZ0jZzawGBJfb8woSkY/qhGkep9JWKosNG8pEsg92OFCMH++Cdzq3Hye+4MktkqunYzUOL2ok2/HdW9fnDSh7DkUWdx6dDNJj7UQ06zBHe3Tll7H6yRxftxZFqYXuKRiXQztnNyoLm3O5iRH8VGbjD7bST5eA5zcJCi+GaJEc10ia7ziQFX9DYrB1UNXtZEYfPKNTM0Kva9/txapScPCZzHW9JS1v6KZOfRQovUu0JDPsbgUv6T1UVv0krQ9KipDnncU9qVHiyGxhhUdNuQWFJe38SFyIodqKgNFn+zHMcMAGqXPd6u24hQTTGfwx9Yw4nocpYcqQsMQ0UMqGHb8B1LiRB43XWtU0607vlW6Lh7vgoLuB6VD1XSV1o+QaS9cZvN8Dy/j55/x4h2DGGRK8+fkbSl1ghdr4+lN3MGkb6e/OXT4n5HEnv8O40cq8wAMn/xzofVCgDaj9DxU0bMnM08CLErthiB4BM/yLHuPnnco67aFdoHXFyozCnr5FKhOG4CrNmugxZKlVfd/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d46109-7879-464a-62b8-08d83fa13232
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:54:43.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EebniriCd7KytMAwTCEtdJTlIRlWQbs44MD6RlCnhrAwiHz3NxzK5hDn/+MC3ynQ6NT2yVJpNxAPVjwPquedcK8Su+SDfRWraFSC+h+mLto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------6FBB04D4AD3D6FBFF03911AB"
Content-Language: en-US

--------------6FBB04D4AD3D6FBFF03911AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 1.6.2:
>
> - Fixed a bug that made matrix operations fail in a multithreaded
>    application
> - Using factor with the extension argument no longer hangs in some
>    cases
> - Calling preview with viewer="file" no longer looks for a file
>    executable (a regression in 1.6.0)
> - The deprecation of calling preview with viewer="StringIO" is now
>    expired instead of forgotten (a regression in 1.6.0)
> - intersphinx links to :mod:`sympy` no longer point to the
>    documentation for Immutable Matrices
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sympy_1.6.1.bb => python3-sympy_1.6.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sympy_1.6.1.bb => python3-sympy_1.6.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
> rename to meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
> index fafd591a8..428b40c3b 100644
> --- a/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
>   
> -SRC_URI[md5sum] = "8bdf8473751722fd1714aa7125b1478b"
> -SRC_URI[sha256sum] = "7386dba4f7e162e90766b5ea7cab5938c2fe3c620b310518c8ff504b283cb15b"
> +SRC_URI[md5sum] = "50d6b69b1de36b757484b9ff833a9e0a"
> +SRC_URI[sha256sum] = "1cfadcc80506e4b793f5b088558ca1fcbeaec24cd6fc86f1fdccaa3ee1d48708"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------6FBB04D4AD3D6FBFF03911AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.6.2:

- Fixed a bug that made matrix operations fail in a multithreaded
  application
- Using factor with the extension argument no longer hangs in some
  cases
- Calling preview with viewer=&quot;file&quot; no longer looks for a file
  executable (a regression in 1.6.0)
- The deprecation of calling preview with viewer=&quot;StringIO&quot; is now
  expired instead of forgotten (a regression in 1.6.0)
- intersphinx links to :mod:`sympy` no longer point to the
  documentation for Immutable Matrices

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sympy_1.6.1.bb =&gt; python3-sympy_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.6.1.bb =&gt; python3-sympy_1.6.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
index fafd591a8..428b40c3b 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/sympy/">&quot;https://pypi.org/project/sympy/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4">&quot;file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4&quot;</a>
 
-SRC_URI[md5sum] = &quot;8bdf8473751722fd1714aa7125b1478b&quot;
-SRC_URI[sha256sum] = &quot;7386dba4f7e162e90766b5ea7cab5938c2fe3c620b310518c8ff504b283cb15b&quot;
+SRC_URI[md5sum] = &quot;50d6b69b1de36b757484b9ff833a9e0a&quot;
+SRC_URI[sha256sum] = &quot;1cfadcc80506e4b793f5b088558ca1fcbeaec24cd6fc86f1fdccaa3ee1d48708&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6FBB04D4AD3D6FBFF03911AB--

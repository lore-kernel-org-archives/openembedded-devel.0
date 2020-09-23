Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.49])
 by mx.groups.io with SMTP id smtpd.web11.13255.1600866650634756031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 06:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZRk2v4k7;
 spf=pass (domain: windriver.com, ip: 40.107.237.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwBmOsQrpwStezf+aSR0QGUSf6TPNQcq49LiJJ9bGhNty2D3WjreJ1JyjG3/QpQkHWo/t4/zy4sBQaVdwKuGPSq4xHseUJhN7bbFuE5270EFY8+ZHLvBLXYISyfWjExD6xGcye8F5C6ZDWczVb39O3FrAmoRJ4KRk3M8sTF3ftLZbxmm1oCSjmGgRsxogHRZKEI5dgsNX2604zcImXIpIHt/5d3z25gtt7z2QuiuNDsXQb+KNTUksA+H6fgfu3FPfMTCNi4xl/bh7cBBg/kDAUSRHY5j5YFhox+UFml0+jOPYHQnkkOH8GruVKnWyzT4L5nh7ZppbmMgZykuK9KTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82/cmzG/uT5tKZyXEvwbigRAbUPrOOPNJ516ultizg4=;
 b=HOGWAQLCjjPqFy8QOE/CJzNaSPwTLS9nOm5oAAOiUg6fDrNxUojJKU9rfJf4xbMHvjy1aj1HHAOq2QbEku2iXz9I+J74NvALPYyYerzSzDlV90cZAVRY4b2we1dxqj8HbzmcUDa1Je2ny3mfGLwFANdADpBrUTRPxT9//Y3Yezj2WU9HJWqRUffLb9/qb5KRTiD/u672zELD0tcUop82SSQfA0HyHiKtAwioLMLwnEvIC7uv3JGuiyEBmZmNJXGCiv4h4CKxsP0vftFAZIzslpxt6dFAcNG6QuhXwllG0HJmOVpmik+8pvok7nvWNVA1YLfXNrKZoZdfGx01sgEhaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82/cmzG/uT5tKZyXEvwbigRAbUPrOOPNJ516ultizg4=;
 b=ZRk2v4k7FHbg/D4JLgFBmMbG07bf2E6BW1W/5dskECrdS4/D5LZ89veS64E1SvNDeX5jzzFQXxffXJI1AgZ0L1iSh2qNQc7GoNUs94lSwUr+xC4+FP7Y2LDYhoTEzD99RDWaErPHIPUlln5wWyelSnajImC7xRmxaPdNwTG6IZU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 23 Sep
 2020 13:10:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Wed, 23 Sep 2020
 13:10:47 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-h2: Upgrade 3.2.0 -> 4.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200921134405.676-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <000693c8-d3ca-2759-2cfb-7f4b4008a850@windriver.com>
Date: Wed, 23 Sep 2020 09:10:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200921134405.676-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 13:10:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5e2ea29-a390-4f08-a2d7-08d85fc2161f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952596FF23F3E35A695AF9E9F380@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P0QEvCoBpP0KBFoYVrao1LZ274M+8XQqrKhnFy7AHvpsyX9VcInG6VrCqOoPhVZ1pT7j+jTJcPVQKakNPfPtNQp1k5hSq4FIuc8DdEkUeGgWBjHl/98TCnPUbWtOIwRlaQU0jlttvXYUj/ohBCvVmVMda01wyaLmLDy3pG+oq2FeWoHqYix+7PzsB8o/XZzzMLxfwJ2UT86C3CjUyeEPYEjk+gafZwxAWs1K+/qRerbnsn2NBrdO4G74xMckmb5MVur40C7epjlW2v9eQzCaa8jzqAn62VEGupLC9Djg9X4cLsUwNdA7cMpk3Uu/KyoVNTKS+UkmQvcbK9/vDVEYUl6yJPqcKcfBi/AenNQfPyrxm6i5wfP+FoyigcnbmMZ7NUM3f4Dwl7HKD+S0oMh84EtsFRlucmOiM4+b3hdn4HlGiwq4g/9h+piiJY2Zfys+XcTovrc1KFJorluhEcWowQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(52116002)(2906002)(33964004)(26005)(53546011)(66556008)(2616005)(16576012)(66946007)(16526019)(44832011)(66476007)(478600001)(186003)(5660300002)(316002)(36756003)(956004)(31686004)(83380400001)(6486002)(6666004)(966005)(86362001)(8936002)(31696002)(166002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+4N2ilb9O5z8xZwAVf1ZIsezjLZZVHXR3izlvyskSn7QUIyc2L3eGWXwb7KpBWmqxL5YAQ7bxw6qI9vvS23pn3aXpu9pC/fcGZYyr0aoNqls0surMM8vudR03y6vP3Pvw42gS0yf1IECttmw7gzWBRfKuxELjYN1kUwL2Q+wmrZjBC9VhXKDvyLjgUYcHHq6ieP6WN0ssDAhD1wkGG5CBqR7E0Yw1I8l4OO1IE39ATx9BiwzHsmr7E7VbZy5XLDJtmRrJHbctLU7Zy3B+sjj1m3NFeMzRaisG3x8/PKz9DTlylC6nF8IxCaafNBL3utuX0LAQqyydUhYQ3Bk+Ivj6/6lbTE0RJEmYVEiJWWc23hJebkFofZxVSOmFXV9OLeKxk3KKKWAtSy8J3VtcX1mMV9wDQLlWbLpoFwsR4pPpVf4Lx81z2VfYNoz34uvK7tftl2qF3SGGRoNH9ceH/uyQrpsRwzz9UrQWBzkLlFY5xAQejpsOJ75a4KvIOwGdCpzWS9stP5AFmksmLeGFoaKPMrk+k+vixd5Rt9o1mljfvKsLmZdsNYOBpaNwXzxCtyUUqI0vbOCoZL4legrIxnB+0dTvsI42GTcxQiNvd6bGcIAmLzrUg2R/iW9lay+1WBBBqonVNCzjB8fHdU3NUGy5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e2ea29-a390-4f08-a2d7-08d85fc2161f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:10:47.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQ7mdo+lA0rZaqDYPsA0uq650Ud1TRumzh+J37waeb0qbpNZ3khKFt2p6QoCO5fci0ROvMLXltK/d6r+Susx/6q8qbNlPRfG6pftNzUzgKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------19B033548CA1CD3C54C62851"
Content-Language: en-US

--------------19B033548CA1CD3C54C62851
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/20 9:44 AM, Leon Anavi wrote:
> Upgrade to release 4.0.0:
>
> - Support for Python 2.7 has been removed.
> - Support for Python 3.4 has been removed.
> - Support for Python 3.5 has been removed.
> - Support for PyPy (Python 2.7 compatible) has been removed.
> - Support for Python 3.8 has been added.
> - Receiving DATA before HEADERS now raises a ProtocolError.
>
> License-Update: Update copyright year to 2020.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-h2/{python3-h2_3.2.0.bb => python3-h2_4.0.0.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-connectivity/python-h2/{python3-h2_3.2.0.bb => python3-h2_4.0.0.bb} (51%)
>
> diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
> similarity index 51%
> rename from meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
> rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
> index bdc110fb6d..ff1d20a89e 100644
> --- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
> +++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
>   HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
>   LICENSE = "MIT"
>   
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
>   
> -SRC_URI[md5sum] = "197a99c09f344a0dd987fab9801dc8d0"
> -SRC_URI[sha256sum] = "875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14"
> +SRC_URI[md5sum] = "d086f6a9746a5f4eeb63bb3d0a482e1f"
> +SRC_URI[sha256sum] = "bb7ac7099dd67a857ed52c815a6192b6b1f5ba6b516237fc24a085341340593d"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------19B033548CA1CD3C54C62851
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/21/20 9:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200921134405.676-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.0.0:

- Support for Python 2.7 has been removed.
- Support for Python 3.4 has been removed.
- Support for Python 3.5 has been removed.
- Support for PyPy (Python 2.7 compatible) has been removed.
- Support for Python 3.8 has been added.
- Receiving DATA before HEADERS now raises a ProtocolError.

License-Update: Update copyright year to 2020.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200921134405.676-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-h2/{python3-h2_3.2.0.bb =&gt; python3-h2_4.0.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_3.2.0.bb =&gt; python3-h2_4.0.0.bb} (51%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
similarity index 51%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
index bdc110fb6d..ff1d20a89e 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = &quot;HTTP/2 State-Machine based protocol implementation&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyper-h2">&quot;https://github.com/python-hyper/hyper-h2&quot;</a>
 LICENSE = &quot;MIT&quot;
 
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851">&quot;file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1">&quot;file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1&quot;</a>
 
-SRC_URI[md5sum] = &quot;197a99c09f344a0dd987fab9801dc8d0&quot;
-SRC_URI[sha256sum] = &quot;875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14&quot;
+SRC_URI[md5sum] = &quot;d086f6a9746a5f4eeb63bb3d0a482e1f&quot;
+SRC_URI[sha256sum] = &quot;bb7ac7099dd67a857ed52c815a6192b6b1f5ba6b516237fc24a085341340593d&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------19B033548CA1CD3C54C62851--

Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.60])
 by mx.groups.io with SMTP id smtpd.web12.20343.1593442316802941118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ozr6BheD;
 spf=pass (domain: windriver.com, ip: 40.107.70.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEpoG1myqF0Q9XPvKtxsacCPrtLLexZV9rbbIw5O6Cl39lmefYcp+SFNcJTP373POgVlIciOqVznrm9/EmVSxTVHZCVHvNIqGqPOwOv8BO10F5bF2uQvnI+mCr9nGQ+u+f9obfnzJvzbjWcEc1OFG+yEPR/LI06nEEcG619Jvf1rve4tk0+IJAWCTI8wl/USsmZo+rYqUrsoDTbmAi6Vh1VLxOUHe4/Ldz78+Lqce4tBhq2xY0YUU1zKK0ceQAbeIkn5NtdjNf3qNH1PTgmfrGhCFBwRDGWmntjyz0bAd/R5py4OHiYX9uiAXjkwACOrogmK6TheJDe5pKzLcx4Qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crBGQmYceKSODMiO7rTcAt85br6aohQAm8j0dLwIVEE=;
 b=GexUtXaekiGyF1HWh5lyVQN58KoBSU6kqIGRW5Q8jLObaCKtZnaD7e2nC/DvZm2CgwMhTrrfMn2fqJl1rH1jic7cYxmMJpEMNsRtxRBUkIfOnAlR8DgRCgvsy0z1s8KTVn7OkQimTcIdzNA/hyJ0GgOsDVQOmi7a9XrgmGeeGD4oOTNSemKXvWYCj/fI3oNL+LlcllaGixqMkBXlOhxr0DI6Lunijt9Ool+19kbx4z0H65Xm1cmdquYPtrTo8OLmNUEcU/e0jXPz99/p9ys7mN5LipQ31LkQNSMpfdRZH/ItkVDeqhTcv8PiJj+YT7bXzQ+j3vOjw6yLd2b+wVZ/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crBGQmYceKSODMiO7rTcAt85br6aohQAm8j0dLwIVEE=;
 b=ozr6BheDZqTb8Jmyh/IZpk99TkKlS0lPe4uWg8IlEkw4B/AoqACXydKLfQ2oCXJCdbBI0lmLkNG4+U3C3vPmlmMYf1wW0Ku+wU2zm76SF+ycsMqYPQtlwYNRhQloPSXkoWEXcZTljl9H6LGtFS5q1Y3sFQCKq31yW7x5qG0Dn+E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2577.namprd11.prod.outlook.com (2603:10b6:406:b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 14:51:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:51:55 +0000
Subject: Re: [oe] [meta-python][PATCH 07/12] python3-greenlet: Upgrade 0.4.15 -> 0.4.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7fcb492f-4f8d-a351-0954-7f3f50578e87@windriver.com>
Date: Mon, 29 Jun 2020 10:51:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:51:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e515d5b2-c8d2-432a-0a95-08d81c3bf775
X-MS-TrafficTypeDiagnostic: BN7PR11MB2577:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB257705FACFF14D3B882412E69F6E0@BN7PR11MB2577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GkgeX+uqPIUxLFuolZLir7iBMxg1aEjYytvtM0akWSqUjWvK29pjiFthYff+EWu2qKukH6Xx50gS9KL6Hx5kGPlfSPrxEFX4rycS61QvndBq5/DWlcemVtwgbp4g1UKKQIPYtXSV/lic0L9PZ9adTdzxxNxgXIfUFpN67imFahL/gil9MebkIgIhJRhkV0vP+QSTnN78t6WysyDQFzlErfDdDnXl8KgM1LzMs09rqQrxxJqv2ZjR2WpPmI7UmM6qRycLcoDqd/yhgC6LL1Dio2U+OSB+F6UUTht/48i3GkxsnWOhQl/wSE9L3kIagw7mYCw2Enx5Ok+5A2Y2RYB4FNPSykZFsQNym8QCYVBanbGj8T+pe0DjyQdhd+K7w3KWk8mVeli22tBvPoL9Jg3Pm039k2OSs5BTD9aZNdpETQ8oopVuIzNzzY+usp8PDFMLgAFKKs7jCUjxx9onlhTbbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(366004)(396003)(83380400001)(66556008)(86362001)(31696002)(66476007)(166002)(16576012)(316002)(186003)(53546011)(16526019)(52116002)(8676002)(33964004)(478600001)(956004)(5660300002)(36756003)(2616005)(31686004)(6486002)(66946007)(8936002)(44832011)(966005)(26005)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	L7vDF0AwhqXAC33oEe9JWZsFSSJHZ2CXQir8Ts6LPUO4Aa5fj3DjufLjT7U6wnpWtfmpM59V5apxIIa0DmqI2e1eJtOJIAKVpqE41BSJpR41kDcNzfqE98xS71dNVSES6NbkgGR5OA7ODrDI58K63qpA6nCfmlImWz4fZp4vcE/xWEbvxqMlQileAwtmiK/neaIQgg+OL5s1rSGoVT6oqd12M5uKPnBZ2GsApOBh8MtC2FJNTpcmJe8j6Ik6HZ/doWuQRFb0ZuaJfuIvB7OIlgvV5NAOqh+Zm0Kd2ByEwC7zkyLhbhzjJZWUXWRDRi5xCOz1C2+5z2DSRTk1ZK5CZwGv2aq0hpg10nxAhdnVuByBqlqwqWodPyfIqqevBwcy8o+jPfXXPmUnckOSNU/ZmH+S7wxsB40cLkd81eOAI17vs/urJVwypQagi8zd3RrX5f/T4fk92ZvENJpNZHW2DD2j+WNKoVjjSgbCzprILSI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e515d5b2-c8d2-432a-0a95-08d81c3bf775
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:51:55.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CwkLQogdlYsDqVQLHIgqZtYLbFBpAT6nhBBXxDcEOmlaxG4ggcUdD/9HGaKXx9bVOkXoJ/tDtQxdq4CpFeKYPbnEn+pTsU5RUZ08cmBZhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2577
Content-Type: multipart/alternative;
 boundary="------------9DD2D3979F502FE9D747E327"
Content-Language: en-US

--------------9DD2D3979F502FE9D747E327
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 0.4.16:
>
> - Support for DEC Alpha architecture
> - Support for Python 3.9
> - Support for Python 3.10a0
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-greenlet_0.4.15.bb => python3-greenlet_0.4.16.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.15.bb => python3-greenlet_0.4.16.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
> rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
> index f9c862118..4556d499f 100644
> --- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                       file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
>   
> -SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
> -SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
> +SRC_URI[md5sum] = "9aebea08f7beb6b87143d0588578c984"
> +SRC_URI[sha256sum] = "6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c"
>   
>   inherit pypi distutils3
>
> 

--------------9DD2D3979F502FE9D747E327
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
    <blockquote type="cite" cite="mid:20200626112944.25569-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.4.16:

- Support for DEC Alpha architecture
- Support for Python 3.9
- Support for Python 3.10a0

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-greenlet_0.4.15.bb =&gt; python3-greenlet_0.4.16.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.15.bb =&gt; python3-greenlet_0.4.16.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
index f9c862118..4556d499f 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
@@ -3,7 &#43;3,7 @@ LICENSE = &quot;MIT &amp; PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36\file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a">&quot;file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a&quot;</a>
 
-SRC_URI[md5sum] = &quot;10fa304f673fc18b28fa6d8c6658cb80&quot;
-SRC_URI[sha256sum] = &quot;9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc&quot;
&#43;SRC_URI[md5sum] = &quot;9aebea08f7beb6b87143d0588578c984&quot;
&#43;SRC_URI[sha256sum] = &quot;6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c&quot;
 
 inherit pypi distutils3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9DD2D3979F502FE9D747E327--

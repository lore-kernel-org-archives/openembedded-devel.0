Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.81])
 by mx.groups.io with SMTP id smtpd.web10.7108.1592399253390107686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V7Yu4uwH;
 spf=pass (domain: windriver.com, ip: 40.107.77.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boIZc0o24lq005OjVKVf9w/y96xHogAuSeX+VgWsm1fUPgyHUovMUkVWx1xn+3uFYkbw3y7pxr0w9Z+1PslP801EdBf4w6uFC1SEYRrrtEedeizQMWaR5iPIfmK9iMoiHPjv4HQpmeU1Hwsp0yMkTgF2JlrjzN8CPX1u9HIQVSOASs78aHX9+HQgUziuqFz1F7Ia4J9cNMY5XvxMZxwawldKuD5ih9wWIo9kyVXd0m9XurgQZRVr3Sh7oWnKlumewHWCG2YgIbrPnUGmz0VFHs8KPK4J+zjQXqdPflWlVI5tiT9qcMSPt7EaksUMT2NagiKwtyiqU68M+Fq4en9kAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhJNRG4kGLN0rvh27cwqwJWiKmM4MwzlgOFDNuAoKQY=;
 b=cryLDE7OObQmXJ1NwxmsuOlM5vrGLxpdx+HyPtKjgb8jrWFz4DeW0A4BlNbLRjpJuMYdjL/qDlW3cR6G/RK5aftPJfuCW+Oia2OjZZw8HLaY/LzvzwLNdDtaLvwjgM1/D4CeSRz0UvpNHr2nPO4g879eV1U1SL9yXdHKGfneDOdR3NB6HSpw75bzLxbjw0jLFDPSqabQYylXyQJCFzDQxCaAPeiG3Rz/Yjt0ae56BS+gFgMCNqnD89I8H5HzuO+tXplvd0wBJtnQ/xLz/MHjleXDN22e5rydli5DAzKGL+wt/Ew6RkTxCVO+cspKtI/WF7l45Josiu6JxaqHs10lNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhJNRG4kGLN0rvh27cwqwJWiKmM4MwzlgOFDNuAoKQY=;
 b=V7Yu4uwHt2aB8TGtF6iqHHv7FTDq5xLM/4hALaOm5EHaAO8RahPjUIJYaN3dgNB9YI3DlVAY2TrcJ0PkSbHSATMhP34ItixINAURzBEaT2zUFR7Kkrw1m++hAIjf9OtfcTvXhklqaaTo85kzz54c/OtEUxKjyu6Q51yrHLuzaHo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:07:31 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:07:31 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-iso8601: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c20a5e97-91a6-3216-ab8a-a69ef51f9d77@windriver.com>
Date: Wed, 17 Jun 2020 09:07:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:07:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce179157-030b-4ed9-eab1-08d812bf6473
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB358842E891FB3C60269130DF9F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	taTufd8gRQdIsBlWXUxgU2PVTyPSQQH/w0C8zJAdc2SsUYdOzckc8uFb70cggWuzqghgmowMOV55VS27p6uSwimnnYwCZrXFfq7oYyKKR2h/U6gzK3nbhDkciz0qI+N6XoQ4TBQ6NmnuIJYiQXrvm+pSGIOfVd94ta5rGMQp7UDlh+Yvh9uGkKe3VDJkmMGGneVKp8K5F/LLcvkoWvcOOZxMy2RATGFBOssr3J/m50gf9hGwnAWw65Ikw0xQk90dhhjbpj3nwQfeECBUORpRoGAhZ9ltuAe2JYUP+95sI9U3Tmt7aW5IDE5dQg1M8KfTBNW2oGxZJccvHdgEyFaXDkuDGph/SZ3AveJ+3FgUbJJI6IiVX3Udbt2JGnxmSx3Zov8bN1XciNnFfao++q6SpdTybn0hC5z8AoBU2lqB22hHQQ2+9avVbiT1F7ssYHbDfaDuLSKIQj3qmD58KUrOcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39850400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	v3QuPIj1LFjhMU3qW3UGAySuSrYdrXBnho5coleE9ZiCu0gZB4GT602UL0Lk6WoESrWFZG81pX0brB7h2Acbo3FDZoZ0cwvSSxget5lHxr6i66/l9k9TOY+ywRLJoZ2GJGdVbilegEl5x4EN105/pedgr8/Bs/X2EugTV9KNK+eOFnQUI8RVI96vY14s4f+BwCX2N1if7fO3AUl1ge7aeiXHci56kqJz7Xusud4zLkli8db/Yu8sb3yjcZiulJ+Zi3giDvDgHIQEXJNXUl2geUvx7XU7lBgyI42xOpP90IRlHm0HuKsUYiOKhLMjs8QRIhTMZY61lHdqmUUm6EXJkfAYLsCApkjqWoEWYbQ3QOHwwP6ebDmUywv9iiSZqByzAi3DVksZ62/lFkmXaXr4qw8T63MryYHd4bAqOx1oUMv3iaCey3DvE5OzxG/vJ+AJd/DMujqulbqezU0JqmPqx3p73PsosGcX3dSyn12J2ms=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce179157-030b-4ed9-eab1-08d812bf6473
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:07:30.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XifWkznMBVTpUiwdzlqcM5bmfNPn7Un1pfWj3riXeI/x0hB6odSgCA9I+KT4gp+u8axlM+z829e/fMgOAGBehArYAdKfnLbIY40Yj0HpqPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------506D63F37EB3649544992C30"
Content-Language: en-US

--------------506D63F37EB3649544992C30
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-iso8601.inc   | 14 --------------
>   .../python/python3-iso8601_0.1.12.bb             | 16 +++++++++++++++-
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-iso8601.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
> deleted file mode 100644
> index a70843ead..000000000
> --- a/meta-python/recipes-devtools/python/python-iso8601.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "Simple module to parse ISO 8601 dates"
> -HOMEPAGE = "http://pyiso8601.readthedocs.org/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
> -
> -SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
> -SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-numbers \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
> index 4a332b53b..74b5bdcb8 100644
> --- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
> @@ -1,2 +1,16 @@
> +SUMMARY = "Simple module to parse ISO 8601 dates"
> +HOMEPAGE = "http://pyiso8601.readthedocs.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
> +
> +SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
> +SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
> +
>   inherit pypi setuptools3
> -require python-iso8601.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-numbers \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------506D63F37EB3649544992C30
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 6:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615103017.2714-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200615103017.2714-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-iso8601.inc   | 14 --------------
 .../python/python3-iso8601_0.1.12.bb             | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 15 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-iso8601.inc

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
deleted file mode 100644
index a70843ead..000000000
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-SUMMARY = &quot;Simple module to parse ISO 8601 dates&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyiso8601.readthedocs.org/">&quot;http://pyiso8601.readthedocs.org/&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844">&quot;file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844&quot;</a>
-
-SRC_URI[md5sum] = &quot;4de940f691c5ea759fb254384c8ddcf6&quot;
-SRC_URI[sha256sum] = &quot;49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82&quot;
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
index 4a332b53b..74b5bdcb8 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
@@ -1,2 &#43;1,16 @@
&#43;SUMMARY = &quot;Simple module to parse ISO 8601 dates&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyiso8601.readthedocs.org/">&quot;http://pyiso8601.readthedocs.org/&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844">&quot;file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;4de940f691c5ea759fb254384c8ddcf6&quot;
&#43;SRC_URI[sha256sum] = &quot;49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82&quot;
&#43;
 inherit pypi setuptools3
-require python-iso8601.inc
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-numbers \
&#43;&quot;
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

--------------506D63F37EB3649544992C30--

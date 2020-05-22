Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.40])
 by mx.groups.io with SMTP id smtpd.web11.14136.1590158185511349098
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 07:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OkrjrUYi;
 spf=pass (domain: windriver.com, ip: 40.107.93.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX9WFNFjZM38IoJPYJfkCwkLiGbbUB48KBFfNV/5T+psJEaZU1x7r53E5v/PhCBRK+usiGodTxP5p30J3zBhpF7ByeeTYGibsFrbi4F3B/XjreKMpHtLVVwJR0sdLpcAIZySsQywORP6N2y86g9Uf01cjBd3v1dhgy2FSpKdeI5u9O5Jmaa6uyqAqoUPIq5kaTyr6hw5Vd/gmR742/M9aIK80rlOgsyQ5hJDnPJRf8IF9n8wwJiI8NJz9BpkAIN392aS1WkpHJsIcN7uNknVTXnRccvt/3D+il9W3LAgZYxFHsFZXe1qgEMDLgsIcDZtJUq/vZTGoYxwxAvyvpY//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O26lhpqg39U9n+CkqXX1prVVla9Y4Oa/UCrriL4PPk=;
 b=dSbMaMbZqMc+/tOkrwAb6XzwlokDxrOrEyhtXZyGmll9WB9Wmt3fqdGBweiDFzIOAxqQSVekbWxHtPiTmOEkmmNViaUbtoRWPw/dxga3vEI8VQ56zb4077GNX7mGC1j/uG82vmF9AY40XXLyXe4UKRSVITeU80Xiv0dbWa591cFTcK1h/ZxssvZez6OQ1PX65Yey12rlI6uX8HO4VklyBNn82n1ifIRnhN1Rxf2opVVOKZ1kTeqAn/QmaI33PZbwB6eK6z8SNKubAF+vq2cBbjpuSWdUDvuH+DmeZYdNw6hyj4GDqkcHATz8DEoLcnXEBQkpcT3y+x4g+HEOwmCiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O26lhpqg39U9n+CkqXX1prVVla9Y4Oa/UCrriL4PPk=;
 b=OkrjrUYi8khIZw/LErzAZJ4FslXam6q3P2EVMAug9FJrgJGVrViVDLRhcA50z/54pS6MDEvKilOKD0I3+UIZnXJLUtcLBgnmRF2FWAhO8IY4+xE8RyWfCirkeCkfPy94hKdGm/LQbMhhW5HKk7o2JjqCeqYwlcbPuJEEPj0h5/g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3876.namprd11.prod.outlook.com (2603:10b6:405:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 14:36:21 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 14:36:21 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pandas: Upgrade 1.0.1 -> 1.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200521231325.685-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0301a154-9797-b38b-85bc-6dbec8606466@windriver.com>
Date: Fri, 22 May 2020 10:36:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200521231325.685-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 14:36:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d448fe03-081f-496a-569d-08d7fe5d7f41
X-MS-TrafficTypeDiagnostic: BN6PR11MB3876:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3876E29FB5C9091E4562EA6A9FB40@BN6PR11MB3876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aCSANtPCck62vtrhPhSeZz6zGQNJ3AqOAQMJqBdK/jMo1OG5PTEC22feiJstTxEuJd5+xhDL+KY7/qO8PCjIM+TePnBWUGvUKHUwZXJ38gDIkJhFo9eSYM566ykQNnM8ubzMRvhJQgRIpWWlIRbI0Gn85VWiCrCp6vWk73D5z/lTVkuUy4ybFSAyGMNKgEwyA7Mt9uOYGrl0wUtIV/Y7D/E0qS9fOUufF+SCa+qbWfnGnANh3opLYegWIgpkspBT46eLt+nL8md8GOX1DaHU5QMRNChlOtMjSTwsTxH7vYM/hTzfUduJ7izQqkk0ex2zn/DMzIBGvEou5C2JaT6E3ybZfJxoK0STrq7HodSjk6aolocDrH3VJ1PeEoDyLmWqcfcO3zh5K2mm2P3fG+ydmdCxf8DhCZgTtPCbJC+tcSQ3fjwgiwwKp60cGxXbc3vpY0dQOIpYEO7yizNKPxtnrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(31696002)(966005)(86362001)(66476007)(66556008)(66946007)(5660300002)(36756003)(33964004)(16576012)(52116002)(2906002)(31686004)(316002)(44832011)(2616005)(956004)(16526019)(53546011)(478600001)(8676002)(166002)(186003)(26005)(6486002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gHTOfhZvD1csbZpTkc19rq9iWi3tgyZHhv4gGUgKJTYkxdnjr7pmgxLi8eBimqITAJMqVk7LTzsxVPa59Xs9DE6CT2hc4TMzy4YyTp3uB9cc+R3UuBekp13hkm4WYEi5y6Ed1rkzjl2FxKg4rIpSD9QS8ZuGnoi287TyaA6MmeyjB4p0fb4fxHpqJf8UqlQG3B/FRpyKyfEpZnZpdrTB5mufTDcR+ffZIvXoNpREZhxe+xIo/gK34b8A1URs3azf5FplcV6MEDBjSWBCDCooRQoHZIdEjsSr4Tf+GYk85BceXlJiSEFlFdlS4rP//JXWr14Fy7wonP4EYMXbq4p2+i+p07jpRegiB6anH4lWMkuzN1xEeBn30ESTYK/Q/snb5+FiBnVAFuq/BcY03GvJrOubQr0LX6CuSoab0ptZS+n+ZLnHt3u1rO6FmcYfGu9pyBD6/HsDgcOIrpGjtcWEtbnXsREpeMgPOAkAErsVzF6utOS7Alh/7Vl0/2CTwhj9
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d448fe03-081f-496a-569d-08d7fe5d7f41
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 14:36:21.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c9afLchTxItiNrBHyjCH2Zb8hF7XpDzotTCosC0Sy9uekRzysi9im8sCWwQGyZWYChyaneGJ+H77pi6XrigIyGxAyFkI5UP/0NRGGU3nu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3876
Content-Type: multipart/alternative;
 boundary="------------06FE7C2BE0F4E0E2900DE549"
Content-Language: en-US

--------------06FE7C2BE0F4E0E2900DE549
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/20 7:13 PM, Leon Anavi wrote:
> Upgrade to release 1.0.3 and consolidate into a single file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb | 2 --
>   .../python/{python-pandas.inc => python3-pandas_1.0.3.bb}   | 6 +++---
>   2 files changed, 3 insertions(+), 5 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
>   rename meta-python/recipes-devtools/python/{python-pandas.inc => python3-pandas_1.0.3.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
> deleted file mode 100644
> index b5dd5e092..000000000
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-pandas.inc
> diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python-pandas.inc
> rename to meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
> index 9342cedfb..099e035e1 100644
> --- a/meta-python/recipes-devtools/python/python-pandas.inc
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
> @@ -6,10 +6,10 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
>   
> -SRC_URI[md5sum] = "628ffa1dd5768e0be70236596cee8d6b"
> -SRC_URI[sha256sum] = "3c07765308f091d81b6735d4f2242bb43c332cc3461cae60543df6b10967fe27"
> +SRC_URI[md5sum] = "a3ea90326c5b55944d369bef87740a72"
> +SRC_URI[sha256sum] = "32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586"
>   
> -inherit pypi
> +inherit pypi setuptools3
>   
>   DEPENDS += " \
>       ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
>
> 

--------------06FE7C2BE0F4E0E2900DE549
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/20 7:13 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200521231325.685-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.3 and consolidate into a single file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200521231325.685-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb | 2 --
 .../python/{python-pandas.inc =&gt; python3-pandas_1.0.3.bb}   | 6 &#43;&#43;&#43;---
 2 files changed, 3 insertions(&#43;), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
 rename meta-python/recipes-devtools/python/{python-pandas.inc =&gt; python3-pandas_1.0.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
deleted file mode 100644
index b5dd5e092..000000000
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit setuptools3
-require python-pandas.inc
diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-pandas.inc
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
index 9342cedfb..099e035e1 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
@@ -6,10 &#43;6,10 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11">&quot;file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11&quot;</a>
 
-SRC_URI[md5sum] = &quot;628ffa1dd5768e0be70236596cee8d6b&quot;
-SRC_URI[sha256sum] = &quot;3c07765308f091d81b6735d4f2242bb43c332cc3461cae60543df6b10967fe27&quot;
&#43;SRC_URI[md5sum] = &quot;a3ea90326c5b55944d369bef87740a72&quot;
&#43;SRC_URI[sha256sum] = &quot;32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586&quot;
 
-inherit pypi
&#43;inherit pypi setuptools3
 
 DEPENDS &#43;= &quot; \
     ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------06FE7C2BE0F4E0E2900DE549--

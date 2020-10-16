Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.79])
 by mx.groups.io with SMTP id smtpd.web11.21165.1602868384565739763
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BmvzqPyJ;
 spf=pass (domain: windriver.com, ip: 40.107.94.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/58/jcorV8HDWNa/jWebN60NIMjfORi8IIH6bjc52esObcXKadt59E5zAVu5Ye/BU1cbobKkhVnj6kXRGR2TvTcf8QiYfQtTg0QTcwctJFtCAlZCPs+DqmClvjIEOWzkJlYdsltTMjABsjG3FtdxCzONR/fd16Yh9sUwY0QqdCNa+Ibg3NJQw+bnYWE5VZhHPaYQNXgT8uqqIiHUbcrcJEjgbMoSydqFszHV8X1ImivshfDSb3sSXDDLM0e47BWw24sAsJXg0B+13Bu7oODsO8RQEO6YVt0sVD7KN8PCx+xcAXcDDlzYAAOkFp1zPNv7zPlcyfuBKf2cKM9ZBY4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgs/529LSX+4nWUKQTwqVh//k8fAlBK6CrXzVQIhvUA=;
 b=lmjr7hzHN1tJ2v2PPrqfV1Tc3Mbcbpk2jkvxOKCMMwckOU1D5NAEQbZ8Bc+8Lz3LAWyYmnyf2hT0lcJjsBi8VAR344W2MQA8u+4doJCDoV6Jnep8STHG+dt2zJKdv+gocrxVxMtm5+VzVkeZ/THw/eR+RDelgjA04ME8isyqYJ5JNleF1Gm8XdRwhfsKsS6IHEwhUiV/hpBDm3Ake4f3YC3Xtpq4qkPK4bnS5iaDEGRK2ctlJiLJy7BKUw0fu6JT0j9FD0fVL0007jtVGV9mKBE9yVc1WpIWr5N3iArI53xJLRjpas5incxCLOSxGyh+EW9+Ucfh2ZiOigGcK8syJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgs/529LSX+4nWUKQTwqVh//k8fAlBK6CrXzVQIhvUA=;
 b=BmvzqPyJwfkeDELVjax/JeA69Ldk/2i6VegzDx0koskQmWtbmXHNN2YGcxf6JEWrrj0mUSsH20DS1tIQJI2aIwC9m4lSUAreFZsZN/VPiwfWWn35j6yOnRZf1jGQxQBmp7G49j8ON7rcbAmJ7x21fhjVmJfPya9iH9r6S3a8f6I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 17:12:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:12:52 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-passlib: Upgrade 1.7.2 -> 1.7.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
 <20201013085914.31580-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <44244a52-cf29-3d4c-cbce-0d2f4027fd5d@windriver.com>
Date: Fri, 16 Oct 2020 13:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY3PR10CA0012.namprd10.prod.outlook.com (2603:10b6:a03:255::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 17:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2073370-351b-4ee5-badd-08d871f6b6eb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4182:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4182DFCEA7F963BB3422C8399F030@BY5PR11MB4182.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	89uVv0BON4m+p1BqUjxiQYGqh8XWFihbw1NdnGzVIsz0y0pwgKjabO3n/K1S48wqWX67RwWK21z5HS7LKDjGRBYQ5fOFuiJ8gL91+ashAOyhug5p4bnbVOegXTVty9+dgg51lWc0vL09eo2i7dUNW4Z+tQQs3ayWC3E2V+zXbrI7kSYJnJMk0i6vS1MU8cTicTF+l9TgAuQuiGtLmw8reTmskwlzxEMoGwp/QHStlQN5g22b8/wbhsa1X16WPYw8Ch6Ils7A3IPJri8AULqV78i9hXxhTjPUXqy3Eg29fXygcTdEptWDuiNUSoBS8eJzozc7vaB23vLZbt/xyLVuUduqh6LBL7Rc7WEMIKcHCYe+lMGWg1kPOzo4QA5E3moDly2boAwqWpD+sRlfq3HwpxVdusAZFhenI1c8kdkzYrHwb4cFHqFL6Giithqsd8ea+eeq5QyJ8w3i37VG5LHgoO24oReYh0NjdfhNDSPNIrymnEbLngubace0ntTUB0CR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(966005)(66476007)(66946007)(2906002)(2616005)(66556008)(86362001)(478600001)(53546011)(33964004)(16576012)(36756003)(52116002)(16526019)(956004)(26005)(8676002)(316002)(5660300002)(166002)(8936002)(83380400001)(186003)(34490700002)(31696002)(6486002)(44832011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rDJc8RW4Cko3H2XJ3dYgo3iF4na9QHr5DmUyFmnRMFwd6ysgO2+a6mMfAeBNAkEK5TSLpwsMrj0y9UxDmg6aPhCK6gTLyeLlx/2cYU/j2ZjahtqAg07fs0979tLAjdiIb6z3eyH9PyXjGO4VHJyh4f6xDKxTx497BEE5JpYt/7nn1v1NzE0IDWGxrq6w6vd7n+Qp7znCylXuwomFZJkPOl8BB4S1fnn/NxUWQu4AGewmkQKWO0ER/H0wzMfMFV51biluc5AU4uST8HAjHtNqb4IzgLXwcyNgtS/OcgEqe12+4qIhKvsA7yqPI7b5lurzDyLWw5a5mlOHCE/6NTdf//vV7fz0aCoXhxUhUffVB4jj65pHufFV78pJl3ipiiCoV6j1Dxksbb6ioofbv4lrg3s2+9BDnW0YPuY2NNW10k+RWbdc6/33i4uR1MKW3xH0mSEEfhnZdPIO4iZSsGw0J6eLcOYrW+TcwaqrKEO9RMDi4U3FF5XKUCtJKiXbpAv2D80XuVIpJuhE7axqvg52jaaRP9I2rhRZ0YL8wTMgHXrkPnszBD3d92IEwaogJqJF81je2SavkuBYwYj1PtcheCK6FOJdsiDBNrxZtR+8+AlKnf4rIV3yhiG+rw/VNMiGuLRf0rATfAacOEYY50OlXA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2073370-351b-4ee5-badd-08d871f6b6eb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:12:51.9349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjGviIc/j4hPtlBM/7HfblEXuIShnRKvhm73TB7cdfpzYhZHLbD+z2VwHFnaoTVK0OxSjVx0QRl8Z7Yr/hSAQkJDgjMSwn78iBvHw5zKFf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4182
Content-Type: multipart/alternative;
 boundary="------------274CDDBC4F2A0519DD90176D"
Content-Language: en-US

--------------274CDDBC4F2A0519DD90176D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> Upgrade to release 1.7.4:
>
> - passlib.ext.django – updated tests to pass for Django 1.8-3.1;
>    along with some internal refactoring of the test classes.
> - CryptContext will now throw UnknownHashError when it can't
>    identify a hash provided to methods such as CryptContext.verify().
>    Previously it would throw a generic ValueError.
>
> License-Update: Updated URLs, styling fixes, bumped copyright year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-passlib_1.7.2.bb => python3-passlib_1.7.4.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-passlib_1.7.2.bb => python3-passlib_1.7.4.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
> rename to meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
> index b347163aac..fd26f3a764 100644
> --- a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
> @@ -7,10 +7,10 @@ tasks, from verifying a hash found in /etc/shadow, to providing full-strength pa
>   hashing for multi-user applications."
>   HOMEPAGE = "https://foss.heptapod.net/python-libs/passlib/wikis/home"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c8449c5e10474d113ab787ed2753bafe"
>   
> -SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
> -SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
> +SRC_URI[md5sum] = "3a229cbd00dfb33e99885b43325e0591"
> +SRC_URI[sha256sum] = "defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------274CDDBC4F2A0519DD90176D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 4:59 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013085914.31580-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.7.4:

- passlib.ext.django – updated tests to pass for Django 1.8-3.1;
  along with some internal refactoring of the test classes.
- CryptContext will now throw UnknownHashError when it can't
  identify a hash provided to methods such as CryptContext.verify().
  Previously it would throw a generic ValueError.

License-Update: Updated URLs, styling fixes, bumped copyright year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013085914.31580-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-passlib_1.7.2.bb =&gt; python3-passlib_1.7.4.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-passlib_1.7.2.bb =&gt; python3-passlib_1.7.4.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
index b347163aac..fd26f3a764 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
@@ -7,10 +7,10 @@ tasks, from verifying a hash found in /etc/shadow, to providing full-strength pa
 hashing for multi-user applications.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://foss.heptapod.net/python-libs/passlib/wikis/home">&quot;https://foss.heptapod.net/python-libs/passlib/wikis/home&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179">&quot;file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c8449c5e10474d113ab787ed2753bafe">&quot;file://LICENSE;md5=c8449c5e10474d113ab787ed2753bafe&quot;</a>
 
-SRC_URI[md5sum] = &quot;b908529cfd4c33057c244324c692eae7&quot;
-SRC_URI[sha256sum] = &quot;8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8&quot;
+SRC_URI[md5sum] = &quot;3a229cbd00dfb33e99885b43325e0591&quot;
+SRC_URI[sha256sum] = &quot;defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------274CDDBC4F2A0519DD90176D--

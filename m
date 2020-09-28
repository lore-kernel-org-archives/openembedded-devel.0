Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.56])
 by mx.groups.io with SMTP id smtpd.web10.35898.1601297998684438152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q/mHC8Ta;
 spf=pass (domain: windriver.com, ip: 40.107.223.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGGR+qcWr/YKnWhzi4QKVMlE0fHM/jHTXU/Ji+iqz0ZfULcv1jdznWR9OBfhJj4EfWCg8ELrBCbWnKjmwFikBmkn/UTFqWUxgZsIIOpqOuQCaXBhGYnnjT8ml0NiyyuPI+j6VCD8BuFmywABpkjCvV4Pag/BS9wepCMzuLvk715DOCVbFViVwqBp0tC+p4lnA4y+f0KsU00yVZiI5dCviEjfU1wTDLh6rqCqevxjdE7Qcjk2r0Xv3eHEN49PEAWnikCCPvSr/c6kBhiJ7SKZB55dlHFDBOApMrTquIp/JbasBHXgdQR5JogN6eMELNvQvYri1xJrjl/WPvuZ9RO+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPDIsh4gScNMEOHCi/wWsTM+Vgoxl+5i/pE3ThD6DXA=;
 b=XFDAjiPEaPIPLfeiB50b+GRkHUWglZvpVa9oH9c3w6R92MaK3S645glP/yuEjaC4jw+Pkw6rAE+ZasVU+HkNs8wnuDNDkRq22X/6z5XwMJWgoXVgBa19s6NlIjyXTMmDc3LYanYj/tzErd866R9a06h1hP7ychPHohn93puxhx6OcI0rFEh2k4Of8Bg9q6S1Vy3sZ5Hp20DgeMQ9p9dgj9kj67NUt3DyLfVkKd7WDsGPlvfG/w9MlPMe+pLG28RBDiZVyCjJZCVyVwwyd62PLCbg1Hu6iNpmI2dERANdm81+BipLNv2dkPWb9KCiHNSEH1ySXTGgTqKPSbafynkuog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPDIsh4gScNMEOHCi/wWsTM+Vgoxl+5i/pE3ThD6DXA=;
 b=Q/mHC8Ta9QDObbUeBy2TAqmdluBa2l4V6T1ygdYLK1NzuDKV3wQGVxeIXkHlN22tRKudT2wF/l/R5+Y6zQt1RYRW37Cz+ulwwwWyxz5olHL159dvYrMUVJ/0+7HYrV7KOq/zsLm720pu6/ss1AqF8COt0vbt1cjd+EOV7mHmVAk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 28 Sep
 2020 12:59:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:59:57 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-google-api-python-client: Upgrade 1.12.1 -> 1.12.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
 <20200924132122.30697-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f0579e8b-4faa-2197-fbb2-adbb968b42ab@windriver.com>
Date: Mon, 28 Sep 2020 08:59:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924132122.30697-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 28 Sep 2020 12:59:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d699b9d-346d-47c6-b428-08d863ae66a4
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32564DBEEDF40AD50E9826099F350@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Qizti+fLtcPSHsAp9wxGLFm3j1OBuns7V0VIoDgKXlXnNNWGC9If5usu2IQnrdAUcxwpZXTr5hOzUJeDVN3DEHEntZXQb7WbUeCxoenY6x+aDuOdPEWqhemnUNkGxdauVZJMA/Ydy0bjZLEHy6u6usQIGVduWMZmjZ7kGQoAiI8/M+rTihisYCvo3Nj1yrRL7BCaHhRlaT1N8FzhJ3i7Vr+EsZEdvQre7x4YtfPrUOXQT/MYH+OWowPuaFNnNnd6lq4+hN8Utvipuri419QriAWRd3NUQYwyjezTZXQfIZU2/skngkMZDWcauy1btj5Mm1PzwIDZ2VaF8VTVtXCORQf3/nYX6+zqlx0pk+8mY+X6SjOU4AONf8RyEfmPC1TmCtdomaPzAKOZlzE/vjabW2HHCxpHsPzUiQ5WQo3vyym5INsCDXsqa8l1YSJ1Tj+gvL2SdjvzJncfeUkGXoIkrBOf3c2/U3qnuOSzhdImTbGzMo2htx+f3wBddnKeD1m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(478600001)(66946007)(186003)(53546011)(26005)(16526019)(31696002)(8936002)(966005)(52116002)(33964004)(8676002)(36756003)(16576012)(316002)(2616005)(166002)(5660300002)(83380400001)(956004)(6486002)(2906002)(44832011)(31686004)(66476007)(66556008)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	a3qiPEzWvDIZVvV5uqQflnaYM4MdE3/BFbg23rGWayF9xGMeOZJsY6Z09M+gK187/onh53kWuvP5dAFni8aZkfLjwow9CKAEJ+4t8wf7RrdG1EBpiMd7lHO8VDEHUQ0J9dYs+Q0SjQR+ya6tl9KDbtvcbMvFKhFybE9yPhrf6jtofWDo88GJtXzQWdySZeTtL0++XK/nl/tWqIZ7eH+9/shSTWIRcnUtIEgzq7B3UKcnQXUkpmEXmCKPK+FteKjmslkDvMWdHEe9o/nqnE0YHPltA6Z+pN5MJ0W7Ege0SsddlDwd6lHA6sy/6I8nmcIOdNxZZO5a2iV3nGEuJZ4Ww1gG7buS6e1r6KjxASKENHzBmlHrrUNRxOPYlcfk4NzDl9d/eypStuD59aoIvvjfO9zc775xXkZtB/oCi8D4/1fhPgmNe01zaQKzZLjrVQksQRZ3nuyr6rviSBDULm4HvtcP0M5O/SpAbUVNXrF6R7Qspx8/sMJQhF9lmraggMfU0siFlBekpakShlEAQk58wQU6D79uQa7/Aw4xLHLqD6DamqXGhGH/QWfr0N0SPnzynkt62THDkT4SZclbGwupcSiyzy9mIsFCDJGahRg114zEWEXApL702XdZrNpYyAmXQprgWAycECUetSSwkMVKIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d699b9d-346d-47c6-b428-08d863ae66a4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:59:57.3422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htpTUjVWTk5lZLVrVPRJLfohqYmKL7YTHHgMsS3Wr/y9pxP2LC71So4h6Kw56cAfqrJA5uguIFRMEp9sSt4Qle7VDAM+wh6UTOwJqXcW2vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------1D327B83D8F8BC90DC5C1400"
Content-Language: en-US

--------------1D327B83D8F8BC90DC5C1400
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/20 9:21 AM, Leon Anavi wrote:
> Upgrade to release 1.12.2:
>
> - add method to close httplib2 connections
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.12.1.bb => python3-google-api-python-client_1.12.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.1.bb => python3-google-api-python-client_1.12.2.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
> index d79ac3c397..4fcdb66b0d 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "92106822131f76ca77b77009674e78e4"
> -SRC_URI[sha256sum] = "ddadc243ce627512c2a27e11d369f5ddf658ef80dbffb247787499486ef1ea98"
> +SRC_URI[md5sum] = "94d58d98a32b85cf455d8b4f0737b4b5"
> +SRC_URI[sha256sum] = "54a7d330833a2e7b0587446d7e4ae6d0244925a9a8e1dfe878f3f7e06cdedb62"
>   
>   inherit pypi setuptools3
>
> 
>

--------------1D327B83D8F8BC90DC5C1400
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/20 9:21 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200924132122.30697-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.12.2:

- add method to close httplib2 connections

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200924132122.30697-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.12.1.bb =&gt; python3-google-api-python-client_1.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.1.bb =&gt; python3-google-api-python-client_1.12.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
index d79ac3c397..4fcdb66b0d 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;92106822131f76ca77b77009674e78e4&quot;
-SRC_URI[sha256sum] = &quot;ddadc243ce627512c2a27e11d369f5ddf658ef80dbffb247787499486ef1ea98&quot;
+SRC_URI[md5sum] = &quot;94d58d98a32b85cf455d8b4f0737b4b5&quot;
+SRC_URI[sha256sum] = &quot;54a7d330833a2e7b0587446d7e4ae6d0244925a9a8e1dfe878f3f7e06cdedb62&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1D327B83D8F8BC90DC5C1400--

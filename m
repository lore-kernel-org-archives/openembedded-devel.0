Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.85])
 by mx.groups.io with SMTP id smtpd.web12.12562.1598359492660992237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f7cZ76tY;
 spf=pass (domain: windriver.com, ip: 40.107.237.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQfuPbDDYMWqVGBle4J364hKrk9XcTUHvER2spp/gReMQsOP6xFNUfF4hL6Wtpn8CPpJWu4sh8fDk1bwGV6AG8GSnMMvzx7qkl5ShrAIzyYUsw/0orQ8SWhEKYfCRVkxAXhidoNvKgR8qtJVxYEzRcfSWsOsUxpOC0k5lsGlyXtA09fUKsE23NYbQk5F6i7zL0koquuBj7IVCYPhtT9a4Aw+41HQLKswB/nY/bDroqR5jgR2kYIpjn+Q6pfbq6CiwAz93vLNpplh2hIECh6U0Vorhq0Q85A2JzQ2NWFYJDnOd0eOK8yqNXLdNmoFISLJsP6080j7xmu8Jppqr6c46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKsgoMH0cmKZOrh2Jvhiofm2m9HZ6byFOCMyy4BI4Vo=;
 b=hTNvdsZFhm08Z9FV5hBK1iEX36DYtnlyepTIQ40dRG0IT60AmaQz/kCeiY/69ydBv2rThUpK3kAPCAL2/aghEewKTlYMy/BehwB3UEcKBJJW0pmf8yOiaE+rxy09/4rmJIfsagvdqfn685pBkmwefpUBH6Th3E0y8EM2Q4WrfMsMIrS6NTNOppue3f+qvLGBJ+s4MnvSlhA0t76P1ZHmfIPouj4//SFtF0hD2E3nnQT9516I6vNPy+DOmrr64zowS7tt6EuP7FogGNBKxuDycl2zWSW5KCjRQpIUO3fUcdhaUTq5DoG3Ud5GJI0H78RuWgADSpAlnbjY+Mq8nI8p9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKsgoMH0cmKZOrh2Jvhiofm2m9HZ6byFOCMyy4BI4Vo=;
 b=f7cZ76tYROMlwyDw/4/wmaicrEAQ25jJMTakzPYdtpFLutoAmNRpCNJcN6e3rlh4i6KrqEIm2wu9ag3VEsxwnGuNX9LmqEtoyXIkcF4BeXsxyVdadATRadwiwJgfejNpLcLO2DiXXMg62fF1ljXgz8E/uxjurl2mTmIn9xalxYc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:44:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:44:51 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-attrs: Upgrade 19.3.0 -> 20.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
 <20200824091457.3360-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7dd24acb-64b8-55eb-eca6-3ff21c822517@windriver.com>
Date: Tue, 25 Aug 2020 08:44:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824091457.3360-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:44:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d642f582-4b35-4fb8-411a-08d848f4a882
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766CA31167A5E1C16E820A59F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x5B4cn5AeQSatB7xFd9aLzdvjFrVMx27gL0Q5zLbuaH/2IgkjrJ5Nt4oagMF60uZuHJ1/4oIJc6xCTHAR+uabGIjsi3MNe8p0yRGBN9hBb2KnuqLOvTCvYQ7DBGDfUFMd1P8wZmx50KeBYNgWN/Zu12f93EjpNTwUnZ+r/T6gtjzOI3LYZOZ29NKzGGEBNu4tkOWyrkNOY9ZNb/n4DV6XnRQ5MGnEsyQS7qmvFy0ZVJMcIC1aV439s2zdt5HTFXRrd/N2A1bWVUC8k5UAq+YqjNvsSWj5YnShBcILuVHSushYl2UUFOIj+XVHyJ2lb2w+tQ1XlAUkzsaL/ffzmgCyV3DrFQHjcCx0wnHs0jwDX1MZG5IZ1qxdjxFR6eAtTwZkR5ULiwWQf60mHXOimhZryNwpFWyiTZLJQLT+Jm+syTjp3Xnh9DRd2bTU7kdQ3IFlsT/GTu3wMIdd01xLtIRCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FjSBDfZqOsoWttbiXxjCdKAktj5d0jJOoyuVfQLJrwfA5Jjv0Ej3mr8lRGmJRkBaZchsWfsJqC5etmGKcceOODZyiLkkJnLgXjtmsSqu16r6EqIROARDDOnHZR2jt9Bg2deaOR4+coRzAVjcRxIk7jQqw3xaGkcJqoF/FN1L7D4HpNvQeTSC7DTD+UJu33FZrRLH8zFPbYtuIZRbusNTlzs53brvOSy3Ab8J/kpaILGBIHORkFgl7KT+xlLiiE4Oz5Mq3kPJHusQaPS/UPZPR02VE8+s1nQGiDO37aRCAron/dArorQsBe1Yc7evYdgJpPjlQwt2uKNGzI4R2v9KNpA9K4b4CBQvhTtZAjMOVBzg9UOC+pFAalYn8Vcc8JIgOdrF7MzJIk9LSWD0JbKV3MN758jOt7tbsGolUgT/jJyj6QF4gWiQA0/cgnJThOyNHBM1EhVVI1vOkwuQVsm6ou3ysW2Fak9cv9dHo2Yoly+XBu3+38+Bd5lUFB/Y1F5BNKmh359QTpJOryb1I2d5NHbTex/lRsy5jyVYZwkJTzZy7e8uUbkkCrFbmMhkoDrEKTbWMPLZx1TJHyBTOHVSZViZ4O4hKJRhT8297jcYXsHBQQUSmkdVR28F4OlaepqGFGciUxKjXpqR/uT4wJ35xQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d642f582-4b35-4fb8-411a-08d848f4a882
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:44:51.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMgyLffBlMwuiFg5CpLBNj4cn60gzG5XPsKpji/IMSWsSJ7STWoDnznmBgIBzo/94NLLfyngdG2KqB0yH8HwSdFdbedSw6jN7p8p2vSmP94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------34810CE1630F930523C21FAD"
Content-Language: en-US

--------------34810CE1630F930523C21FAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 5:14 AM, Leon Anavi wrote:
> Upgrade to release 20.1.0:
>
> - Python 3.4 is not supported anymore.
> - Added attr.resolve_types(). It ensures that all
>    forward-references and types in string form are resolved
>    into concrete types.
> - Added @attr.s(collect_by_mro=False) argument that if set to
>    True fixes the collection of attributes from base classes.
> - On Python 3, all generated methods now have a docstring
>    explaining that they have been created by attrs.
> - Fixed a ValueError: Cell is empty bug that could happen in some
>    rare edge cases.
> - Added attr.converters.pipe(). The feature allows combining
>    multiple conversion callbacks into one by piping the value
>    through all of them, and retuning the last result.
> - Provisionally added attr.field() that supplants attr.ib().
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-attrs_19.3.0.bb => python3-attrs_20.1.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-attrs_19.3.0.bb => python3-attrs_20.1.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
> index 7ff8049e5..371f1f042 100644
> --- a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
>   
> -SRC_URI[sha256sum] = "f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72"
> -SRC_URI[md5sum] = "5b2db50fcc31be34d32798183c9bd062"
> +SRC_URI[sha256sum] = "0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a"
> +SRC_URI[md5sum] = "ab7533fc91c5db3d5b65e66be907444e"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------34810CE1630F930523C21FAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 5:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824091457.3360-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.1.0:

- Python 3.4 is not supported anymore.
- Added attr.resolve_types(). It ensures that all
  forward-references and types in string form are resolved
  into concrete types.
- Added @attr.s(collect_by_mro=False) argument that if set to
  True fixes the collection of attributes from base classes.
- On Python 3, all generated methods now have a docstring
  explaining that they have been created by attrs.
- Fixed a ValueError: Cell is empty bug that could happen in some
  rare edge cases.
- Added attr.converters.pipe(). The feature allows combining
  multiple conversion callbacks into one by piping the value
  through all of them, and retuning the last result.
- Provisionally added attr.field() that supplants attr.ib().

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824091457.3360-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-attrs_19.3.0.bb =&gt; python3-attrs_20.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-attrs_19.3.0.bb =&gt; python3-attrs_20.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
index 7ff8049e5..371f1f042 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.attrs.org/">&quot;http://www.attrs.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff">&quot;file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff&quot;</a>
 
-SRC_URI[sha256sum] = &quot;f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72&quot;
-SRC_URI[md5sum] = &quot;5b2db50fcc31be34d32798183c9bd062&quot;
+SRC_URI[sha256sum] = &quot;0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a&quot;
+SRC_URI[md5sum] = &quot;ab7533fc91c5db3d5b65e66be907444e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------34810CE1630F930523C21FAD--

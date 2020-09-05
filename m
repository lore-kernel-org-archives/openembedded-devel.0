Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.47])
 by mx.groups.io with SMTP id smtpd.web11.5540.1599332494444711155
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m6E2IAhB;
 spf=pass (domain: windriver.com, ip: 40.107.102.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krunzDvFpeD+fsVW3QUe5CtHQzOWWfORLD17/lR9l1Sri/OAOwfpKe50qVuOROCvtnBtimjkEB3d4rARI20vWtEe7AUx2ZhdMUO7KxdGGjlmcrQX/UMJltNeiaD1sP7uHdOc5+8SwQUgtRO5Yv4BHN29xsgN3idQ4uIeaTpNx/DvdDmfR1Kdq/LTVxAh2fuCo3kKgKCWdbmHFHUY39uCxPrtVjVlfRtLASF0hJByrxD+8Hhrbhkk5dw2thHb52KfnrCvSpPxAkgswq7wR92gfGHH2ZXK9SGofaGe9jx6wWZasIuTvgPNdDUAYg3yfa+rZcRx4JomISpjlaEE7mze0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkhsWcVZgn3x07Go0kC0DWiFe+my3eInkAAtv9EQTms=;
 b=TX3yhVq95JPfmbmI2rEEHGxy62bnTnTkvL2YtP+TlMhXnP4KZUcV9u/o3ju4iizGNDWEb4sAaYBJDKE9xtd9Fdk1/UTg6ZQvis6kH9kZLTNWbV8SbAsxmEaljLvqK+PnzV124Jjnx8hwcEBnMqd37Iph/SSNFFYQ2LO93swYv3NStcEfIl3EuPEcIKEZaRe0pPlVOPEWLMvbGmfG4nOSo6C2A8AZ0fX6wAg7Wv1872GsosmdOOm9GpSWNObULNN4Xx5VY5NiBF2K7f5UoevktKKSQ22TahEzcf3+eOBSx0BgZcT2RNeNm8hCCKlvl20e1tED1Hjz+eEVxc85xNhtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkhsWcVZgn3x07Go0kC0DWiFe+my3eInkAAtv9EQTms=;
 b=m6E2IAhBXzKirVM9k95LE53C8S23g5TZGwY0tnyxyGG6zRctcnE0S/iRPxiqKvIpQRYYVg5BaNiYwTEzfVIiZCakSzQoRUxwTB8VGQZu3zwy+JsGwfa/mufy1JmpS40wRuy2dmA5c//cbIwicsMmHge0hME1mWWKWbdvQtPI0lQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:01:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:01:30 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-sentry-sdk: Upgrade 0.17.1 -> 0.17.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
 <20200902083342.22101-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a1d96821-3327-e080-c20a-7f83abf5a5b9@windriver.com>
Date: Sat, 5 Sep 2020 15:01:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902083342.22101-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:01:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59cbd773-35b6-4da4-385c-08d851ce1976
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295269397DB401694E130CA89F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xSC09MPrW4PMKYiqa17/yzfYk0ugXz1IMTpeJJmL9cySu7hb2GPKTB11Y4AhaWfrZod4QvM8TXB3gHiNm1O/IhMq9wuEMN+o02FSryuZJM8wsFxPWbIah2U2+lniKAP1rw5Y0OMFFVonZNojd/fKGZxnQlZZWsgWYQW8iettbcjMcUkxsZtbMntLoGrLT3F5CDzHDfMKzmNRmGjG7P0Lp5LHD7IuhZez8RNZ87Yduw/kDrdyzgC+N32sdKQ9AurjPe2AF5dQizpv5D4FerKUh+D34aTwDgcd904h/+72zhvQiBn2ow8DXMVj9g9fVbAdBGFvqJ8lXH9A3v4Atz2UlTynTKeXz+rZO7apmCkzFp+87/AVUzLXDH3ccScfuENz2kX8i3pe4XtlGhUUeJiGKTm1wb/AvuZ3T0dzBV/ccX9yFDBmg3/j47rA/GNcqbir2FSKUYMTcSzDytwK+ERYuw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pMOUGn042HGToyodz7GON7S7k8KGbnZuMiJ1WlWo3ggLLhSHdrY7aXO54pVEmVRhSmGqX50y7h2QwvUcrSI8HKVUB/f/j5243C0mYdrxGk1Y1OIMf9bvnkWiDRA0ojOgsJV/Sp33IOFXFZqFqyKFdYUhY6+gMB8Lc1Bi8pSOZWHgr76rH7TSrEtFMxkElvuTRDqb+DRAkfJTNKFoI5b3jpS5R414CAb0BraGHZwQ6vPi1vbUVMmFBt3bhK65fuU0Nv8vMd1qTcJ7C6OEl/kHIZAmITw+AfV5ExTib7JM73e8b7Ctw67srkG04KACtDUcbQg21uxaa3NDHf/Go8MpQtQ4N0ptPdmU2u836Ri1k+DRPh8/ejCO5xzahy3ahr0b2C3/m9wKIUZqTQVhjB+JNhyd+mbgy2O6CVrukgiCEmZD8tu8Cm0T0uH0GGUaBF6tTr7Jwke+pPPS/h5Poer4wRxuQdl9lF+ffNZ1omUUq1Xnpy65wUYGJjZvP55C5lDX+zhAneSPixxjPYnAuS71AssmuRSXVig9VC8ChL4/8l8jDNV+vorDot3zPVqDojhhlHZ/ePoVz0jBHFtu+dt6AJzD3qFvaxvBV2M5E5FYHONtXqlpuNVMO5EFN1aFWahV0eAkFFFlFxFnd+soewrjKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cbd773-35b6-4da4-385c-08d851ce1976
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:01:30.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyIGdJ4wnxzABcPoxpCZTLWzHT+amw5Dpn5X4Shod2PzCMALKMa0zYDyo0SjyOwiIsPF4zD9sekOsYb4KfRqeJ4lCOo7WYtZLx7jHzucRLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------2ACF15312FE541C48C58CB3C"
Content-Language: en-US

--------------2ACF15312FE541C48C58CB3C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 4:33 AM, Leon Anavi wrote:
> Upgrade to release 0.17.2:
>
> - Fix timezone bugs in GCP integration
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.1.bb => python3-sentry-sdk_0.17.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.1.bb => python3-sentry-sdk_0.17.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
> index 730286303..9eddbbfdd 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "ae5d718ad6fca0bf33960825544caae6"
> -SRC_URI[sha256sum] = "2c770e7bf72d6419bb82b3bb950f3789fc24bd6a0ba191369607a96289acd63b"
> +SRC_URI[md5sum] = "a9d68b19c457d6a9ff70396ab341fca2"
> +SRC_URI[sha256sum] = "bbfe5633aee4dacb53d79d303ab6bfacf1749fb717750c112fb1658e5accce0d"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------2ACF15312FE541C48C58CB3C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 4:33 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902083342.22101-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.2:

- Fix timezone bugs in GCP integration

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902083342.22101-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.1.bb =&gt; python3-sentry-sdk_0.17.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.1.bb =&gt; python3-sentry-sdk_0.17.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
index 730286303..9eddbbfdd 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;ae5d718ad6fca0bf33960825544caae6&quot;
-SRC_URI[sha256sum] = &quot;2c770e7bf72d6419bb82b3bb950f3789fc24bd6a0ba191369607a96289acd63b&quot;
+SRC_URI[md5sum] = &quot;a9d68b19c457d6a9ff70396ab341fca2&quot;
+SRC_URI[sha256sum] = &quot;bbfe5633aee4dacb53d79d303ab6bfacf1749fb717750c112fb1658e5accce0d&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2ACF15312FE541C48C58CB3C--

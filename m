Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.72])
 by mx.groups.io with SMTP id smtpd.web12.10239.1599060648188076335
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DvmyEo4A;
 spf=pass (domain: windriver.com, ip: 40.107.236.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRjYo7vzYzpmDXzn6v2TqpMi/JhqoH3t6YGVLHw6fJWb5oOlWWd/lEXuZ/JlNdUb6DBDwDbkhUOvDhdCUgHqU7G5gThHNsbMhTLu+mNuZJua+iiqsm94VVJla6T8kqMIKacv3ZUqOl2WnqUs5bz7ijUpntKdCg82JY1WktLaUpCc8QGTkS99TPK6LlWOkFmo85LgA/zqumTFjSk0Y0JlXpcF8SgdrEsutIOA7dwQzg0oa1dLAk9ZY1ih/j9YF4JR0UJnOwluV0prwNyI3Yj5PKXSXQ+fLw2mm3+jkz9xxM+fS0qWlgva6QFTgWzLnoCpDYeJV9qZXyT2ReyA9+8rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQT8636C8V/Gj0oUNdabhFeWes5UelHtWgCiWEvcMvo=;
 b=mpFeHEuvd9cVTdCHhTkYUSZc2WDuCvWa4tJPLbKTWmHQd8rg9ZD1Li/wb/Rua/DUbzoeNMZ74hBEB3qHZbr8xlgRfAHHXZn4sbr0QBzeVasacNNpSxKvjYOLwz5ZalkaRrbVcfKhBd+ZsVBbA/9DK1UX1tlBrqXLe9x/vTIcuEibkpCF6dFCJswqKx7QaPfBhMy4pRw42TnntNwyAkD2h4vab7JRV7+OvOPdXkXlKqitqdeEiFUAYd+1ZaRzO/TFD4XhPtYFG3TRWVYev22pZqU+pwIPSTZXa8yKMlss2303aaOSsH+NGQ28lAg/P/lJnWSRpTdEkrzJjIgMAANtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQT8636C8V/Gj0oUNdabhFeWes5UelHtWgCiWEvcMvo=;
 b=DvmyEo4AFUYlEH3i6LzzjodEOLsj8tc1L4mPOeyzSjcj5wcbnzbW56OZfc1UoKAT/lw/C331vKZsw3sudukNyyiEcYbZT6TW6R+F1TC+RPXvQbyfhbx+J1mpIvMat0OE/KFqYKdPuNZbQd0S09YZZyZ+W25OW55g1Bapfcqf17c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:30:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:30:46 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-sentry-sdk: Upgrade 0.17.0 -> 0.17.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cdc07fc9-4d54-43ef-0402-958ec6c30e48@windriver.com>
Date: Wed, 2 Sep 2020 11:30:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:30:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e2e3472-8597-4476-ab1e-08d84f552988
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030BEB85EABA86235153B7F9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YZeJK3GiRSUTC4kQm+sDabpaco+HFOcrf4yQkLceNJBplowRwu4LJFAmr755l7rrKGKhgIBVHMZYjkkbcOinmwZJR/WY2DoKUtqLt8rhYsCzgc7+shhlcJpCxoi3udbFUJuIPy4hBpLAaWuhlNCvErq34Ud5nAeNp+bjdluSf1ucI7+9mErHdD+KwjpSx7WpQGbFK6k+fmmOlumGoj1iq7QPGZA1SVuJLmNXYEzg/JkgEff9TXgt3TKXY8HDrM71rhmkjegkO+16lwHC3cjACwBJOUh7VInMdcaMU7oi74PzMbNJ/2kE3Kpl/V1B9HAv2OVcHUSpLTg0vxnRG5ieSf2LVZppiouKVhfVSk+vVxZvfM7gsPU0zQUD5G8ZSF6PmLyaWWIKn+GZsd03pmgBrZ+YkdemgpMF1nGLZPgwp51XF1xlVvy2au/ZmryGOIlvHJ73ZjgHPvDJBiYBj0Jf5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DBUBQ9cCrpsFJP3JjaOqw5vOwMfSvqrpmEYhaSRFiSCAX+d4L94DTxPsk8RUaT4uPfmmYYM3D+c7GgL4aXG7oSET9s+sVI6xQy5KpSrMC5eLsznZZUyzTFODMlrYhP+BBVYqo1QYzYiKOimu1eMdZDjgl9i8SreB4hoyymZ1AYrHLLH2KljkbiAVXZyKnZO9nCFQ/m6HoYwAWJ3c05lrACwjewmDtgDaeaaODFp7UCtBfiskur6ZAeKuH5zuioDZQu4iLChBoL5BxmqBtcFTuSNR+MlUV/+n6OvZDdruPwTk3/YfbhTDgrM1PCuh/g4yj5qjbJ2HZcT+LqnhNxgjCceuuAlaaw4qVGqUw0KW+/K/4LiaG/GnQo3C5PZOK1tPGa6tUxVz0k3iKTg9tLL9x6md/p/ZpQzhofaoORaT7UShOQ+k4atZhxIjn5YwlSidOkEmGHCnzO4gb0L+Dpv4x58TzkVERNofgKDgzOVouBXfgYhEbS1HQi7ojtzmzW3XUWWMA04ArxQfSSo9U3AmNuQYEwWW2NxR/aFX80T6v+89tHP7bGb3ySjnmjSBKng934ZG8awi1AqIq6Kk5MWcpsdZi9b8+7hcLKPT5Q0cPA94YeRjNtAU9cRxOjNdCJ074TRmQrd4RLLYoYLH0o6NMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2e3472-8597-4476-ab1e-08d84f552988
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:30:46.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wPX2hC9OWfJJZlbYSGBByASt+XmiEuMOJguzbLMxigPYNmarwxuKOf+I0haR/wYTsO3htmMvYvvQCo1s1chsXxb6xGoJAHC7LU0eaa/wdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------E0AEB726940643971C15C8CD"
Content-Language: en-US

--------------E0AEB726940643971C15C8CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 0.17.1:
>
> - Fix timezone bugs in AWS Lambda integration.
> - Fix crash on GCP integration because of missing parameter
>    timeout_warning.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.0.bb => python3-sentry-sdk_0.17.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.0.bb => python3-sentry-sdk_0.17.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
> index 340b5fed5..730286303 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "5806e450b2a4e341478411bc5d5cef31"
> -SRC_URI[sha256sum] = "09cbc253c827a88064c5ed548d24fb4294568bfe9b1816a857fa5a423d4ce762"
> +SRC_URI[md5sum] = "ae5d718ad6fca0bf33960825544caae6"
> +SRC_URI[sha256sum] = "2c770e7bf72d6419bb82b3bb950f3789fc24bd6a0ba191369607a96289acd63b"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------E0AEB726940643971C15C8CD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.1:

- Fix timezone bugs in AWS Lambda integration.
- Fix crash on GCP integration because of missing parameter
  timeout_warning.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.0.bb =&gt; python3-sentry-sdk_0.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.0.bb =&gt; python3-sentry-sdk_0.17.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
index 340b5fed5..730286303 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;5806e450b2a4e341478411bc5d5cef31&quot;
-SRC_URI[sha256sum] = &quot;09cbc253c827a88064c5ed548d24fb4294568bfe9b1816a857fa5a423d4ce762&quot;
+SRC_URI[md5sum] = &quot;ae5d718ad6fca0bf33960825544caae6&quot;
+SRC_URI[sha256sum] = &quot;2c770e7bf72d6419bb82b3bb950f3789fc24bd6a0ba191369607a96289acd63b&quot;
 
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

--------------E0AEB726940643971C15C8CD--

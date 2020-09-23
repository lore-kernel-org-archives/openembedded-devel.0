Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.66])
 by mx.groups.io with SMTP id smtpd.web10.13110.1600866721036224231
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 06:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JtPH8fU6;
 spf=pass (domain: windriver.com, ip: 40.107.93.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bkz6wUe73KfqhU5czteGbM8rAbREJgaYbcdbJB8roK2Qjo8EieqqIyqo1Z9c9TubGkB/LeOCSTt8ExgCt2aYtstVhVv9ihZixaolBRJ+gOjq3hiT2vjl7e/CdUrFykaKJXY20IT7OizIdx8zjTxKTcznrsykSt5b/3P4WXKDWgPQGN+067wE1HXOyrFKp4oHVMJN7LKf8ugPJiA8RCZIoI1H0FzXjwiRy7HQtE2LXmPw9NrUAC/InzY8Qcwcadh21viKXbaiPjGsd3jC/hkja0NYjEogwRGQiCoLXRQdpqL3lqc3rQ4JlpnZfTHpx5ROrkBB5/JZNS4KOoKvcpWOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qi1yumISUANvMXTfxnXj7uofqNl67ZljFlK3DD0leo=;
 b=nU9gCtek5/0hkF8siMcrnPbLi1XISzaIQTyV1X8ampfjANk/xwbLiZByg7+RJNOW0lQOw+FmQYdcxVtJ4szqqH/Jv1vr3GPKFDUee94zKhZ1yP375dkwHVxXLJNXFAZicvyJJnWPdqJ45HZEnqtEJIR9NC6E8s5KOCJrsZ2Nipnsc1GM2/ClmN8zPraF/swk/PN6nAgee4drQus1R5QG6mG5X8gJ3CjWdslNWkA4QU3QYeBu3M+FlOerRmc8Rpk8Ad6uhgTb9nptQB5QtH4LeIhjwjbthwYdNE+mTjMvg0j7dmIhvS1nBklstw7NjbWYpzelGaqf3QVTgeFrOiO98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qi1yumISUANvMXTfxnXj7uofqNl67ZljFlK3DD0leo=;
 b=JtPH8fU6WdIZZNrtWlVoyX+/sCd4So4MK0kQ/Y75khmxwSPyRzsfVzdjZINW2hE0Sx8hG6CCVl6fvKto0e54vs+A9asjA20ZLYNitBK7v7Q05mabfISvDeW8tfCahdJTXZCvup12dMgs+r+czHPOlmiPortUaixU2mP+We4Viog=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 13:11:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Wed, 23 Sep 2020
 13:11:59 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-xlsxwriter: Upgrade 1.3.3 -> 1.3.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200921134405.676-1-leon.anavi@konsulko.com>
 <20200921134405.676-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4efb1255-6a8c-8121-cbeb-943bf9909570@windriver.com>
Date: Wed, 23 Sep 2020 09:11:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200921134405.676-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 13:11:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95be0649-f1d1-4b6b-645b-08d85fc2410d
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41035706210CFA6D9C72E5B09F380@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c8MZlXhymJMBnn46164tfD++YzSlS2iE0nZisaMXcVuazxPh0IGKW7+wGyRq/54XalTNWUxrkRyCqjzU6xTKOvPUbXBHv9HX3n6m9tRuW9nx2KPnapHuTTjKUVqFvNLWVRwfIE8J8SUJrLsHNtN/xHO5hKuv3SB5JoAYzOdgl+ubQ5fdJOG8nk2phhe1CddSEg+RXNq7rnUJ4iOxHlO2ixJe4jM+wx045xJJhP7lA7XVVQ4rfv2VNiaQpknL7xLAyeHe9THB4u/Wf2ksO83TI5uFBjZWGyJ8m79n9k4XXI8Ia3vpYBQYxy32lg3OIJBcdwomPLSWVSxddlhumaFHoUvnSrMLtD3rjG4bcrQYTg8fw7xKmaTYRCQiDmGZfVmbLzeJ9fAFOAAS2y+ugWO2OZNshE+sSCFPs8zONAFmJmz8EAaWcWuwm5Ndo9OvkwToAmSX/nA8IlV+4hWQxnulmaPMQ4xdwi6WbUhNgst0kJnC5DNIBn2Ccwm73QwNHAJI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(33964004)(316002)(16576012)(5660300002)(36756003)(478600001)(52116002)(66946007)(66476007)(8676002)(66556008)(83380400001)(53546011)(966005)(956004)(31686004)(86362001)(2616005)(6486002)(31696002)(8936002)(44832011)(166002)(186003)(16526019)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eJjAjKd20Q/9Ci8AfwLdLLOB1Ozmip0tDI/DTeulNRSUXeAYn6bEZsrHVd6tu2zLzTcKtSV2qajaK5QOrA5gMSuCwjKY43rS4iHi1LYk5iYBB0CDpr/h/QGvuhyS9RaRUtoMVcYw3hHPNo1oEvJlhxn6++fxWUrWYEpFwls97APrpjv9TN/ZB2yqqHR4xgp4F9NES33y7dp82YZUy+Lw0L8ig1EMkFwmvRu2n64/WsYsYol7yoKqG6NptZJXiytkEy3KrU5WTzVqISxIEvjlIbJmPsd6JXXgNQrm21dOGbr6RRYlyYQs66+CxM++mngw0edkYmjhVlk7y4cGszqUzFgJn3OamGxoF5tx/eDn4YZxJ//hBxal2NeoOiUAnG5oytqPFRhuiDGZOsHmKCx152rAcWbM1STLZS1UJ9sI/rmmmVWhZyX/w0ccc71ePEcoK0e0g7Y+xCPdGbpA9mufeiBkj6sDEI5MTaSC1rZ9taQwcWpDDUgvDHhaIDgcycLfUqr506rXLId2XzWQLr4EGIObYdbQuUrJbhXrjmTYNuKkm+kD4tc0xwPjE9OOHQJnveuSCJSKRvVRXWyh5I2yTSLmWTdYw14NR+xCZFDXZSxxJxrgEUx3v6QCgu2vrwd3bjQgj6DAcJCMNTbanb8TxQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95be0649-f1d1-4b6b-645b-08d85fc2410d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:11:59.4594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LKdc7mViBqSAn07xeumL/ISiE+h4EJzh/XZK/gP8wmwt8md1Ll2DheiLdNVO5qA/0QppKFpq0PHvRh983Aq4Ge5oJzMlQ6w7OAMsziWVic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------B7F9DCA6C1DB4E83BF32E324"
Content-Language: en-US

--------------B7F9DCA6C1DB4E83BF32E324
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/20 9:44 AM, Leon Anavi wrote:
> Upgrade to release 1.3.4:
>
> - Replaced internal MD5 digest used to check for duplicate images
>    with a SHA256 digest to avoid issues on operating systems such
>    as Red Hat in FIPS mode which don't support MD5 for security
>    reasons
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.3.3.bb => python3-xlsxwriter_1.3.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.3.bb => python3-xlsxwriter_1.3.4.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
> index e2a304437d..61a9c69b51 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "7c7191afe3149e41dca0e17d535421fb"
> -SRC_URI[sha256sum] = "830cad0a88f0f95e5a8945ee082182aa68ab89e7d9725d0c32c196207634244b"
> +SRC_URI[md5sum] = "7ea11261cbd5c763d106eea64471cf2f"
> +SRC_URI[sha256sum] = "d804881beb944c4fd73deed0ef2666b84437f30d72bdc1b3a6f0230458facbfd"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------B7F9DCA6C1DB4E83BF32E324
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
    <blockquote type="cite" cite="mid:20200921134405.676-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.4:

- Replaced internal MD5 digest used to check for duplicate images
  with a SHA256 digest to avoid issues on operating systems such
  as Red Hat in FIPS mode which don't support MD5 for security
  reasons

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200921134405.676-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.3.3.bb =&gt; python3-xlsxwriter_1.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.3.bb =&gt; python3-xlsxwriter_1.3.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
index e2a304437d..61a9c69b51 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;7c7191afe3149e41dca0e17d535421fb&quot;
-SRC_URI[sha256sum] = &quot;830cad0a88f0f95e5a8945ee082182aa68ab89e7d9725d0c32c196207634244b&quot;
+SRC_URI[md5sum] = &quot;7ea11261cbd5c763d106eea64471cf2f&quot;
+SRC_URI[sha256sum] = &quot;d804881beb944c4fd73deed0ef2666b84437f30d72bdc1b3a6f0230458facbfd&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B7F9DCA6C1DB4E83BF32E324--

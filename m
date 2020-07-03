Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.63])
 by mx.groups.io with SMTP id smtpd.web10.10846.1593785000131531920
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TOyFQnNL;
 spf=pass (domain: windriver.com, ip: 40.107.94.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvMbrzkrH4t/8/L8Z1z6LtMqBihquvvagR1ylHdTulJ4nfrIXhAqCkPEiLGdoUk//3oOwANb+eUO7Jz6zhe6vBqA6C1n2Oh0VgYYeOH43RipW19RoULeAaYJTlBc/XvilBhaTggGrF6HGXE8c7d1QaKNtQ8NahnUAV5VkzeqHTBmJhZ+p+P+5dBKNso5F4SVB16sqQIedrq5NMpyjdIGwzJsGfIY5NkVdb8tQRebV7DIIYb7t5w4Fx+b4D8GhJcHdCD3gyQptderiEmCN1GBurUXmgKzJicuaaUslvMku9boHl66Wxn95rtlwxOZl/j7bqqriN8zVdAkplJJxg19mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7xZZU1ZfSCsEHTY7H0MjwApdmP3Z2k9Z1T0TOZjO0U=;
 b=V4Ne9yS8dryhGaUG4d8QdSAAsvCzRaLIcFR3t64YKrM20BYNWabKK6/vDihX6qgzd2ksBkyPqREGG3uKFq9BxQQtdvaAmkAfedMPQE7hqENSKihXvcP9JnSoXr8q1RBfwC0kEibBPs+Fe/XvBbIZV9NCdppK38vj84uQ87QX2Z3SMkHoqUIoxBfbqLMbNEddoDKUchWWE+tyh8azrpy5tmcxCTUB5ToJF02mJifo4wDRU05+1X221pmoEZVHmX2xUADiZFs4wFPvbbb/PksD+CDonGijDgCVkc5DaJBE92t05KYR7tQQsTDM8eMUV1eroXAlk4qRPOnHGvn4506Xrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7xZZU1ZfSCsEHTY7H0MjwApdmP3Z2k9Z1T0TOZjO0U=;
 b=TOyFQnNLv0t3BvO3OE3T4GyWHzOYowIHIPlrpSw2H22dXbLXcUmQr/+8B1lijaRGSg6n79SNRs2n02I5tbKna2+WUQfOGDKpC7NqI+r7a93kFPKho3Wt12DamwSJzSa25eu2hsg7m9wTF98MiIk0IJVRERSQgwiBDnX2w4krJxQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:03:19 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:03:19 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-html5lib: Upgrade 1.0.1 -> 1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
 <20200629171853.18608-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7cbc0b5e-deca-f959-8ece-f27987a4113a@windriver.com>
Date: Fri, 3 Jul 2020 10:03:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 14:03:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0738a715-7e8d-464f-d17c-08d81f59d6b1
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628C1B111B4731908B449CF9F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LDL6juTVEI7ESQVY7YcoXCGk55IAis4bxKgXIKM06ryEshT2TqoGzflPOUt1M4ymE60Hv5Vyw7b4HKCskRY8/zmgni7LKKTRKIj+n8+2QiEB0gu1H9Fkx8QvHTNKpY96o7UsI/k5VMAt1BHzDREMNM//jq8gOoJTKBxSt0j363cVHHRJQV7D9C8JV7mnstLi8pYpaH4lWbrJsshQQJhqx1tH8oW7uXs71EnTP4xnTP760TWk9mX5GUEJ/ShVTCuLzzzX5fIN83uU2t4FQ6FwYUJ+k5g3NS+BpHf9+PQS/mojpbLWwfsq8fYtvO8YsbinknfvHjPbHXCBv6LnLyKFnOFsP/FocfkVqqeY6ExjF6f6ktoV+Yup5kVFVKtRcer1M/hNOcninj+uL0QRjKqMlkJV9Ehwl+C5vl8FYpI1S6UsVPCKsnUXWx+kVfpCuieAoxZljWMw6sKWeXsJklGiYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YPJJv9+H/4aRJdvMlBvE5WQueN7lnj9oo1NvECykaALTSN/nTj2V8c5zwdD+fuHVtz5b+Lci5eYs0LHtix2cGgmxzmelLjNIXKIoDtQIEB3EiaIVL0YRZ6pvp6IcaYza1CS1lRa/Q12QtwkPE0rik58OV5vg15XQjm+doy9Rtood/HQo+bJWi/c5pQn9WdA5i8LnvJkh3GkK3IUEsAkfyq2lv3U4SSsnL1HgAOA5ey81JJAVAZ3h5hlq+TQ7uyAHAB1X5S3MiUMsIcGXfbNtiR1TyJHcK+j2G2Z0kVFGx7QOZmkxXQCFp3DD2mZxxsU5SbJOe3w/RPsef2HxGclalyEpTCSjdoiaBveW2I3FewsNJMIg7HXy8++0cVPFDhfqcINeB3tZFmkUbBl3AjdX2jcuisWo5OAACi2jnPEYgj5mZLuCpm1Enh2RHeBKzY4uWGTnWBJOjSJF/38MXua5pP1bFrgAJPduRI8nkHGu7Xo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0738a715-7e8d-464f-d17c-08d81f59d6b1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:03:18.9981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J4okLpd0dW7xcV07DSOEVAkhSnvLLuIC/Y8PHiWsHJ3onX4/gQQg7cJOFdh3IAbW5XgQK2JF0BwpF9JVrK4i+gHYOX+/sJKeESi0VgJpw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------2B95AEF782DE5B5ACD4FDBD8"
Content-Language: en-US

--------------2B95AEF782DE5B5ACD4FDBD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Upgrade to release 1.1:
>
> - Drop support for Python 3.3.
> - Drop support for Python 3.4.
> - Deprecate the html5lib sanitizer (html5lib.serialize(sanitize=True)
>    and html5lib.filters.sanitizer). We recommend users migrate to
>    Bleach <https://github.com/mozilla/bleach>.
> - Try to import from collections.abc to remove DeprecationWarning
>    and ensure html5lib keeps working in future Python versions.
> - Drop optional datrie dependency.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-html5lib_1.0.1.bb => python3-html5lib_1.1.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-html5lib_1.0.1.bb => python3-html5lib_1.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
> index 98ee56b2e..59f3cc945 100644
> --- a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
> @@ -2,8 +2,8 @@ SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
>   
> -SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
> -SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
> +SRC_URI[md5sum] = "6748742e2ec4cb99287a6bc82bcfe2b0"
> +SRC_URI[sha256sum] = "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2B95AEF782DE5B5ACD4FDBD8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1:

- Drop support for Python 3.3.
- Drop support for Python 3.4.
- Deprecate the html5lib sanitizer (html5lib.serialize(sanitize=True)
  and html5lib.filters.sanitizer). We recommend users migrate to
  Bleach <a class="moz-txt-link-rfc2396E" href="https://github.com/mozilla/bleach">&lt;https://github.com/mozilla/bleach&gt;</a>.
- Try to import from collections.abc to remove DeprecationWarning
  and ensure html5lib keeps working in future Python versions.
- Drop optional datrie dependency.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629171853.18608-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-html5lib_1.0.1.bb =&gt; python3-html5lib_1.1.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-html5lib_1.0.1.bb =&gt; python3-html5lib_1.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index 98ee56b2e..59f3cc945 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -2,8 &#43;2,8 @@ SUMMARY = &quot;HTML parser based on the WHATWG HTML specifcation&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c">&quot;file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c&quot;</a>
 
-SRC_URI[md5sum] = &quot;942a0688d6bdf20d087c9805c40182ad&quot;
-SRC_URI[sha256sum] = &quot;66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736&quot;
&#43;SRC_URI[md5sum] = &quot;6748742e2ec4cb99287a6bc82bcfe2b0&quot;
&#43;SRC_URI[sha256sum] = &quot;b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2B95AEF782DE5B5ACD4FDBD8--

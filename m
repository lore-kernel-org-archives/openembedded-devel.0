Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.60])
 by mx.groups.io with SMTP id smtpd.web11.4287.1605188743399632129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 05:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hJ6T4qUO;
 spf=pass (domain: windriver.com, ip: 40.107.220.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHyl3NrD84ddtkZlYDSHK7jCiS3qipjtTMYAuz/XvfnP+h9bJStxtcUC+uv0qAMOfiQxLek5TwRh2rfgfvpHbWCjgDkAUVUeVKzA++XcZqKKBkfwPzNQ04AzDKP1Gtnhb9coOnMcWOrL2gksA4quIWjS+r8cT8a/UmOYrlepdsPK97ygL5zPvGiwi/OKqC5hqBGShZV/8uyfmj+PLe609t37pwA53lU+n8O+iOtWA1lUIiudFPvDf0pzZ6xjBIcz0zB6W1sS40lNVDV4wPkF9IQeNkoeEZK0cjmODe1czb+ervjZ5CXu5p8hZgrJ7LFI3NSIOAM6e3qQyShwtenWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RLJ4as0ZJvECaRckdiWwnqywab11ljLTYgyeNZ4K6U=;
 b=PRTlKW10Qhz4553EfSuBxfXgz0wSAdqvij3oHTdJwkjQn76naik6ZLZVQNufp5wm269xeDckae2u7cYFs9Q05LGNlFtXeQibFb0Ez4I/2E9ydhCjoEBjRXNS0SEkcoOXbx31zjkWbe4zbmCfuHzk5T08yGASXMlxaLntTwOYCiF8RoPYkpdBAq+49WzwUk8p47dC7N9u/piFsUphKEE+qnU5kUXcGUytlsn06tO1wobZ5MUEiris8NffvnPw5iFtdTVDHTJEfslUY6tkTUfT8qVsRca+sztW6RMy6PAspWatl6zPa5TQLEPAevbCjrCcil8WykKbesFgLGt/zC3PRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RLJ4as0ZJvECaRckdiWwnqywab11ljLTYgyeNZ4K6U=;
 b=hJ6T4qUOzoCpXI01NXnRKnP/EPaclK+cpoyhhwZu1/UUlV4Y/eoTv2NXdQpc2AwBYlACbSGIB3GgnQXwCJS9lX0v1xrZIjPx0VhsNdVLeslWZSnBzegLFo6Xuw7l+J4PaMT3zGrOT/hPgYcCrh5wb4QHySJM6IbD1WYE1WItEs4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 12 Nov
 2020 13:45:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 13:45:39 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-icu: Update to 2.6
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201110191114.2682229-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4cb913fe-1cda-5cbb-9726-9ca6187f8853@windriver.com>
Date: Thu, 12 Nov 2020 08:45:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201110191114.2682229-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 13:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0e2f240-f628-4ad1-07df-08d887113de8
X-MS-TrafficTypeDiagnostic: BYAPR11MB2631:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26312D63573B0562C23919709FE70@BYAPR11MB2631.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CjIa7StVGPTT29eUbsAzRH9bPhhMoFE6XI0qGZ5dYvxj7VplvPrLY9BiGe9mRV2LwNpz09FpJV11Cj+uxuqOIFSIJU1GQ+/6aeM8iMae24i3s/VLXDHx13Ll1EoTWvmTIM98l6UeTRbuMR4QjkZ2sIDZdTiSf4vKvvQw5fZi9+2w+B7fAHFz8pKkvqc/8UoYOFQ88d0HKxHsH744WmK2R7pMm8kJ0E/lO872AuW0XsKeYt006AKlS75DtFrsayuqh3jthj8dG2l6va8raSmJ/47NiUd7MDi6IGOd+LKiDbVs8OApqSMmZMc6iYWFBqqp6PqUIdvP0eZBzP6CkypBsj/aSwBJSUaFaVKuqiyKyLDEkMTpVHWs29wlSkdt2VEoi0qlQoxOzk2ubrmAMIhJoE2EjnhKJM04qq1RScopVKt0W8F0reLKYjJmsxa3HREYXpxo8Yy4WQWMfpl1Izpayg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(5660300002)(15650500001)(33964004)(53546011)(52116002)(478600001)(86362001)(31686004)(31696002)(36756003)(8676002)(2906002)(8936002)(166002)(316002)(66946007)(44832011)(16526019)(66556008)(186003)(966005)(6486002)(956004)(2616005)(6666004)(26005)(16576012)(66476007)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hf3BN4l9G8mvzyv0/TC51NvlKebifrc3lN4Sxcjc3HamXSjJbEEIfCPb4LCCc67RVLmNt56U4gDvSRYnNRoMAKJUHBiB3baLv/Ui78Ztpl2Lue5JUAn+RpazI49/0cbcJY6Rsvb8egUEwxzMpaoWD6uPao1GDHEytHKnEkOSGH/ykKaS6zAf+vQLS77n+JtW2ym+cO1bRGLi5um6Lsfy4Gh8hlUpd2sa3z5MqR6P5L2+NOTl8ysPOvvBbsab9Z921IbxP1RREFGX3sgcUZSM1jOrDveupglJJzcWoKi/aeVRpzVI8mtIVpw8bSfXRE6ahsVKu4WGhhnSm5Tj/9Ux3Rg9tyTlB1XaKdzRvn9eWk7Ng/vF4iM/MTOHqsnfMYQ5A2AITE/u6BzZd01hLdPul13bod4ao48BY/t+5Y1W/3phRz8yDHUmnTHoSHa2pQZssGlHyUHQF0D6HYLuHQQsu7wAsPyPvbAcHmBJ5w8eqTFGYzqsKVH17dBiIc0BjoMNkjz+fRYbOoXcL6fCBfkN20VaxG8tRa6RbWHFMIX778S32/LalGry6HdZR+zb3ZAo1bRUI44yWWO+v8TC/B8LlhXfqGnseyaHyNYIt8vD8SWpAAEyE3QqPaybhzWCOhSVdpM06ulPFumP/+b01d+XPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e2f240-f628-4ad1-07df-08d887113de8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 13:45:39.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBRH7scMaf3JYJ48GIjgeUsGI4hvxDoey4h/0L99ToiRaBWbJDn3fHtKQhLFLmZjQTxSEW2rspQOL0JY4rlXpI3P8PcKIPIMgfbe6MXU3CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
Content-Type: multipart/alternative;
 boundary="------------AB9910A5CDCA72BC76F73530"
Content-Language: en-US

--------------AB9910A5CDCA72BC76F73530
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/20 2:11 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Among others, it supports latest ICU 68.x release

My build pipeline is encountering this error:

|ERROR: python3-icu-2.6-r0 do_package_qa: QA Issue: 
/usr/lib/python3.9/site-packages/_icu.cpython-39-x86_64-linux-gnu.so 
contained in package python3-icu requires libicui18n.so.67()(64bit), but 
no providers found in RDEPENDS_python3-icu? [file-rdeps]||
||ERROR: python3-icu-2.6-r0 do_package_qa: QA Issue: 
/usr/lib/python3.9/site-packages/_icu.cpython-39-x86_64-linux-gnu.so 
contained in package python3-icu requires libicuuc.so.67()(64bit), but 
no providers found in RDEPENDS_python3-icu? [file-rdeps]|

Looks like something needs to be added as part of the build?

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../python/{python3-icu_2.5.bb => python3-icu_2.6.bb}           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-icu_2.5.bb => python3-icu_2.6.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-icu_2.5.bb
> rename to meta-python/recipes-devtools/python/python3-icu_2.6.bb
> index 5e8c8a3a02..58f5e563bf 100644
> --- a/meta-python/recipes-devtools/python/python3-icu_2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
>   DEPENDS += "pkgconfig icu"
>
>   PYPI_PACKAGE = "PyICU"
> -SRC_URI[sha256sum] = "a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc"
> +SRC_URI[sha256sum] = "a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371"
>
>   SRC_URI += "file://fix_host_include.patch"
>
> --
> 2.29.2
>
>
> 
>

--------------AB9910A5CDCA72BC76F73530
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/20 2:11 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201110191114.2682229-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Among others, it supports latest ICU 68.x release</pre>
    </blockquote>
    <p>My build pipeline is encountering this error:</p>
    <p><code>ERROR: python3-icu-2.6-r0 do_package_qa: QA Issue:
        /usr/lib/python3.9/site-packages/_icu.cpython-39-x86_64-linux-gnu.so
        contained in package python3-icu requires
        libicui18n.so.67()(64bit), but no providers found in
        RDEPENDS_python3-icu? [file-rdeps]</code><code><br>
      </code><code>ERROR: python3-icu-2.6-r0 do_package_qa: QA Issue:
        /usr/lib/python3.9/site-packages/_icu.cpython-39-x86_64-linux-gnu.so
        contained in package python3-icu requires
        libicuuc.so.67()(64bit), but no providers found in
        RDEPENDS_python3-icu? [file-rdeps]</code><br>
    </p>
    <p>Looks like something needs to be added as part of the build?<br>
    </p>
    <blockquote type="cite" cite="mid:20201110191114.2682229-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 .../python/{python3-icu_2.5.bb =&gt; python3-icu_2.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.5.bb =&gt; python3-icu_2.6.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-icu_2.5.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.6.bb
index 5e8c8a3a02..58f5e563bf 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59">&quot;file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59&quot;</a>
 DEPENDS += &quot;pkgconfig icu&quot;

 PYPI_PACKAGE = &quot;PyICU&quot;
-SRC_URI[sha256sum] = &quot;a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc&quot;
+SRC_URI[sha256sum] = &quot;a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371&quot;

 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://fix_host_include.patch">&quot;file://fix_host_include.patch&quot;</a>

--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AB9910A5CDCA72BC76F73530--

Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.82])
 by mx.groups.io with SMTP id smtpd.web10.1310.1603410196323319618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mG9oBqud;
 spf=pass (domain: windriver.com, ip: 40.107.77.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7l233z8uOwiHhO4jKkq/JdL96aHaUt58G0jeytUGlBvpqWH5WajSiQHCINJK+sh4fKXZXDfXcsRzb2DpTtm4MkcI1DyZZ2j9XRXYVaPAJ6kDsFvQPWtJU7jdfAg4jFOX8w/pRrW54pdnx9YavZkhgpRIEu3W1AllaI4v9GAznzsZot/OAW53wRJyNgVVwDfCsBRO+gkVXqhAgbsNd5dGy0UcBFe2/zQIOOLmjDZpcI4BuRFlh2m+K1kfzpJhI3/RmGtZwyVvuFGeAvMsWWEs8d3CYtOsRL77iZxEmE2MpzAiZbH8CrUhN7AAwO7PIt10YNdh/uw2TjCHiUY705DLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=147zlLQvRY1eYxtVnHSHTt9idQNWEH24wq/n/4bK8no=;
 b=KMmH2Fqzz2Q1mcE47MPLe+UwnrkflitIJQkbZcO7ZNEWzEAzZ4qpszhQw3FzZezbeeDOy1QCHGiPbyTvspqA7e+DmfAbSBVhTA2wY9GC1PMDOQS5EUqYmMXmUOfgoVSsINjIxm+ojVnLXyKDnAwqLK4G/70dnwD6BHm5ryJZLUNthBIw78UHneahT/q+rTrLzdv0gi94LfSOKy/qsC0ym7K+hcjsMGqu6kgDAVtAHmPDfTv/cmAjgDRcGVV/ZKfIMqMD4wiEeYIMX6Obe19vV8bdOX/IDPLsa2AbO7yAkQS6rL3YzBIRH33meOeJ+pP43xrptcuZNEEMBeHH5Yu7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=147zlLQvRY1eYxtVnHSHTt9idQNWEH24wq/n/4bK8no=;
 b=mG9oBqud/oga7FN5Oar+zMR/vGw8konTIsVAlzCB8CUOHtuPOlArzOPOwVIBPYy62EtwQkEOX7gjSufYNN7G7O0EKS019l8pJV/G8HcRfLQV55MQUjBt0jkKjiin5XXjrVpSSQ26ZB9iDygrGScQAeymaaPfM9mwUF6WMsb9ZKc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:43:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:43:15 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-colorama: Upgrade 0.4.3 -> 0.4.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201020152601.26261-1-leon.anavi@konsulko.com>
 <20201020152601.26261-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5acced5b-3305-0106-d705-546254dc846e@windriver.com>
Date: Thu, 22 Oct 2020 19:43:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201020152601.26261-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Thu, 22 Oct 2020 23:43:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d79b10d-1df5-4115-e5d8-08d876e43e8d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48965CD3A20EC63ABBCD36729F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I+ob2Rf6sL7idXs0wfrMVpDJilobrRncjk4ixIi0gbE0iM3vAgTXujhDtXci4Fn0zw92V5RjixgIHzYeERIaDKcQLw3cJsig0hxwz++YwQqzNI/qPnB+TVbAsfKQn7xKd6Cfn6DUDHluomalvHJo/cFqyegrug0M961d5yrnDTOdRuZRrdzuqxAGGebT09/+3EEd2IV5m0t1esCIwEvvxaZmBnV/lYxeEuH1mDxX1fhj67r6TpGqOnoI/A7Nl99SKwhRYi3snmDeS1j5gtvSA0QU1R6PHK3BX+jyUP/CNS6zWjLn+6fTaKhAJy5MCp/m1PMj3WMv8P2Msh56XK699thVjIHzh7C7pbUA+mdEH1fc/v2+t86kI9fpNcGJISI7dB1UMMO5kKvEYm5l0p8g0uISTtdn65JnY1AyWFCpXrVTsM4jMTK+q0igPB2bBdJvba8SSsYB7/DqV6HCr7AYDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kTEjsdGsMo8QqWVUQiq8i6SZGBJCJYPqwC25NW0GNmoSri9jCdej9BpLmbYvailt4KBOe7qzEunT6A8Vi8w1JGZD9OWg7NF7vKU5Ja/2gU4xcG9zlIUgCsofHlLCNr84/kWU051juf9vDQkDdsEC42iL4VmSvl2US++R29FRR1lkzdOdupZR03uQQ2Iv1q7OYUkgz23ybfNRtHzLqRKQkDVCRWuUxgh/C6OXOKuvnlumAj2J/YRff9H2+bgxE4L9d1VKZeej/k1Yj/O/m9rlp/mub5DyMXCxMK/7T58CE1+i3chhNhxHpxeNyiLhvYLwVJLwm0QSAbT+qy4AAgj79l7epghdXDbHnHuFO3d4XWVCiX5pzWgSRK3PSD2lSRZ5Vz3rXAvPA1IZRg0Y5CZ0xAVNLZr5WwCPViTqGV8uykGA+MxYWoPSBJrHJlBf3cHI39tuOJrI1BG2EOxk/xNgMxt/pu6y8UkVhiZFYWSuU/aEjLU0Lqt6PJ21+U22epvcOWNrGVG59ElaEJDPYd5WCbRxfiVlBlBfIVMXfSDLR8vmxoXE+jcBqofymyC/CoYPKc6kKzYlojic6Qh2hccxHHNmlZ3oQPtxc/GQWpA7ZO99SlAdXqwgLeo5fbaeiSDJGpaJjY6ixx8Q2oA9XeE8kA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d79b10d-1df5-4115-e5d8-08d876e43e8d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:43:14.9271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7zc1mTcUYJdpcJKvTLOJsduEdfWp1Mr7PPyuNpThZuaS3Ch4HT9UT7SXk9VA4AToEST8OkhuHXCoEwAVTQMs7KXCRkWUO0RJDh414oFH6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------2619E76D6EE49FD24A26D2BA"
Content-Language: en-US

--------------2619E76D6EE49FD24A26D2BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/20 11:26 AM, Leon Anavi wrote:
> - Re-org of README, to put the most insteresting parts near
>    the top.
> - Added Linux makefile targets and Windows powershell scripts to
>    automate bootstrapping a development environment, and automate
>    the process of testing wheels before they are uploaded to PyPI.
> - Use stdlib unittest.mock where available
> - Travis CI now also builds on arm64
> - Demo06 demonstrates existing cursor positioning feature
> - Fix OSC regex & handling to prevent hang or crash
> - Document enterprise support by Tidelift
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-colorama_0.4.3.bb => python3-colorama_0.4.4.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-colorama_0.4.3.bb => python3-colorama_0.4.4.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
> index 31a523b0c1..54640de04e 100644
> --- a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
> -SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
> +SRC_URI[md5sum] = "57b22f2597f63df051b69906fbf310cc"
> +SRC_URI[sha256sum] = "5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------2619E76D6EE49FD24A26D2BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/20/20 11:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201020152601.26261-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Re-org of README, to put the most insteresting parts near
  the top.
- Added Linux makefile targets and Windows powershell scripts to
  automate bootstrapping a development environment, and automate
  the process of testing wheels before they are uploaded to PyPI.
- Use stdlib unittest.mock where available
- Travis CI now also builds on arm64
- Demo06 demonstrates existing cursor positioning feature
- Fix OSC regex &amp; handling to prevent hang or crash
- Document enterprise support by Tidelift

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201020152601.26261-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-colorama_0.4.3.bb =&gt; python3-colorama_0.4.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.3.bb =&gt; python3-colorama_0.4.4.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
index 31a523b0c1..54640de04e 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26">&quot;file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;02daee502863d24112a8c05a5d69a612&quot;
-SRC_URI[sha256sum] = &quot;e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1&quot;
+SRC_URI[md5sum] = &quot;57b22f2597f63df051b69906fbf310cc&quot;
+SRC_URI[sha256sum] = &quot;5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2619E76D6EE49FD24A26D2BA--

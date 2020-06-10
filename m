Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.78])
 by mx.groups.io with SMTP id smtpd.web12.3075.1591818758974063869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MPNUBjpD;
 spf=pass (domain: windriver.com, ip: 40.107.237.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thh0F3UADTv4kDWv6WbBZCeflYIvg7+eJFhF5hAd1NTDANi31QprWTN3Og4cmjEOUI80iqbKkAQ9dJSoM5T28NN6SK5ZifzWra6KKLp7+EHeH6UHH1HuDDTSesRBI9hGh+OL2A0facXydddoZRqbH6qYltIfDgeOyd6WYDwFi4cedQdWyTkngPhY7rT/Y4uG+DOwoPnD1wlPxt9my26vdAZlmhloNXWC6cbx6dG7Fr2lcIOEmDzdKFdWtcaLe+2qyEhAQb8CzuKuRJ5BzcuNsSUzrASg9IIt8yuy5r+lUro//g+5oJX97HwsTHDCVpnl+Bw7lELHyNWeNl/Rn8YRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z9qJTJWZDHlX3yZyvnYGqLUnYqVQSk8rueCYAIiurk=;
 b=Kk+2tvuD4r0ifoqT3d51JZjqNGs78v0aGwBgerMW6Muru5JmDxBA3Tmxga3QvE9O9vFUjbln5jOxv/vJo5mZtgNC8E3fGn/V0gpqUsPykuGgEpeFrP9sIK4IcZD8gBKLXWokJE5BRVPXOYN7fokzVwTqdXiozcDw69rwfORO+5Rknkqll7SZz3pC/PkU9Baa4wwyn2ztLOIGp+p7KGCqD7hTq0gS+LCvoa4FeGDkzov6W85s4yDjAj9SRaiBYJgay1WEP8YwvcatRCozERPw3o78hm7Is6LLmdMdqLMQQf31K5aI+8N5hf7vvZlC4Nj8YxpqE5NJkwOoMpBOZp38Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z9qJTJWZDHlX3yZyvnYGqLUnYqVQSk8rueCYAIiurk=;
 b=MPNUBjpDvXi+hNtJMaYGP5mdL/T4FAWyj3L41qiwcFNIlHOe/DZ+eyRxB3i7xb3OGktT8N59lYkEHNC4XbtrS7UpMYsXHfAV8CRTlSpMoTJzBMYue2qYLcrVJ8YyNlSejdzl5cFPj3SS4dWeqiF+wRuLCpe4SvBB7CPoxvWaURw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1522.namprd11.prod.outlook.com (2603:10b6:405:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 19:52:37 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:52:37 +0000
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-wheel: Upgrade 0.33.6 -> 0.34.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
 <20200609111050.32307-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3c3318c9-ec94-7f4e-93e4-edc60c6dcc81@windriver.com>
Date: Wed, 10 Jun 2020 15:52:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609111050.32307-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::36) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 19:52:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d6a3c68-1fa7-425e-19ad-08d80d77d396
X-MS-TrafficTypeDiagnostic: BN6PR11MB1522:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB15220BD7FCA347A2B759C3399F830@BN6PR11MB1522.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PLGnNRrQVnTSduI793+0swtezHhupiKQYiG+POtWLckCMNNgh7oMcdpgNhkPbIzhLXo0UFI92+AgX2fBeDlgDAkBh38nrbZds0isibLKntuEWOkxDqNSHnwrZt2Hgy5sBvPqHV8lJuq7iY88xGzB17mSERlijsH9xMxhxzWTYeGpDyb+rLuZ8CDtSzaog/WpIhMMc34ESq6Fm3Psx7ACDpRq7NqAtjrdZrHNS7mINCVyHbJSiPIBi/pK634rSWt8UXYPnhfQ90xAb9Kprnym71/suK6dxx6Eaq2N9Z0ptuE/pGXPUnvXaGRGcJWBz3wUxIqF6LOOyv/G0CN5K6rW9LDNS+5vdZDiHWcu8Th2Mt5egPcBFiR0pEy/rFfTHq8rXOOzP1lEoXb2E2oDaTmFIRHEtqh6yznOx9NXUFnQ2qo0tyQ/+MeT1kGlQj5CQFyObH0BtcLug32UQ9IlHV34ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(956004)(166002)(8676002)(8936002)(2906002)(31686004)(16526019)(16576012)(6486002)(83380400001)(2616005)(186003)(316002)(36756003)(33964004)(5660300002)(66946007)(66556008)(478600001)(966005)(66476007)(31696002)(44832011)(52116002)(86362001)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TmwZq1TNIf8elAWM1JDahTQSF9TufKBDr19mQaneGGu+A2rH9CyJhimw21JV1NUajI6MzCrWHTkCxu+NTSgum5i6z50/nHta9rsjOH4yc+3ckOs/cQAD7A748Da831F5nSz7+gCKHhWU+fjYDC8eHvICIdJAriijl1GO+RBiY5vl5LSFPMhgFTsJpSycOxLUM7ilpHdi4mJZCXQgSI0Z0JvZQ6IfP2/IZJbhJGcUEbMQ8phabuceX7pJW0N+n1fsxNNXuySIzXDYV7sB7UozFiYX08qZbQP1q/rVIet/TUv+GU6jNrCF20qVO2HM4BMy5IuWJ0sqNVpEnRDRC8o3AAyY/D67HilJyA/Dfl8hoB5JR1X8qROCZnE8hxy5rPHLdrZFZMeX22xbztk+a1fwhnGCMETxEu0ogM1g7l8PEHAHb3HCW2FUSlc8z8TVccxv3vAwlrFGyjQcAZJwCs9Uo5gOPaV3oPsAyGSAhQTdVrm+qBiIcxDoyUhY/V9espLw
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6a3c68-1fa7-425e-19ad-08d80d77d396
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:52:37.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY+EZgG+aHkQbui1krRFnM1cQLefFI+RjYSHeQzPmX5zDt2/++H0OFnDtwIkvns4JX4lPCrmxOD3ps5xm0BDgSeKUaZg6ZuopMXxjLR4x3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1522
Content-Type: multipart/alternative;
 boundary="------------5B27D1F5FE9D4E4066490134"
Content-Language: en-US

--------------5B27D1F5FE9D4E4066490134
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 7:10 AM, Leon Anavi wrote:
> Upgrade to release 0.34.2 and inherit pypi.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-wheel_0.33.6.bb => python3-wheel_0.34.2.bb} | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-wheel_0.33.6.bb => python3-wheel_0.34.2.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
> rename to meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
> index 025b2eea9..8633a4fc9 100644
> --- a/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
> @@ -4,13 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752"
>   
> -SRC_URI = "git://github.com/pypa/wheel.git"
> -SRCREV ?= "b227ddd5beaba49294017d061d501f6d433393b0"
> +SRC_URI[md5sum] = "ce2a27f99c130a927237b5da1ff5ceaf"
> +SRC_URI[sha256sum] = "8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96"
>   
> -
> -inherit setuptools3
> -
> -S = "${WORKDIR}/git"
> +inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native"
>   
>
> 

--------------5B27D1F5FE9D4E4066490134
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609111050.32307-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.34.2 and inherit pypi.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609111050.32307-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-wheel_0.33.6.bb =&gt; python3-wheel_0.34.2.bb} | 9 &#43;&#43;&#43;------
 1 file changed, 3 insertions(&#43;), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.33.6.bb =&gt; python3-wheel_0.34.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
index 025b2eea9..8633a4fc9 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
@@ -4,13 &#43;4,10 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752">&quot;file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752&quot;</a>
 
-SRC_URI = &quot;git://github.com/pypa/wheel.git&quot;
-SRCREV ?= &quot;b227ddd5beaba49294017d061d501f6d433393b0&quot;
&#43;SRC_URI[md5sum] = &quot;ce2a27f99c130a927237b5da1ff5ceaf&quot;
&#43;SRC_URI[sha256sum] = &quot;8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96&quot;
 
-
-inherit setuptools3
-
-S = &quot;${WORKDIR}/git&quot;
&#43;inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5B27D1F5FE9D4E4066490134--

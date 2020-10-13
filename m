Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.77])
 by mx.groups.io with SMTP id smtpd.web10.9290.1602632669606568535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WeBxm43J;
 spf=pass (domain: windriver.com, ip: 40.107.77.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNB7puX5NWgbrOP3v/v2fxwA21q6yzzY9m5iLM9hRtYRcurkc4DK3X/+7oa1ZMIlg9oDuP1Wj2tgxLo83jnWYXmo5J3XsNiGtvp2FASoxZthQ5B4hfVd9AKFc/SlEcnv407aSJ78nJbHO/CDD6oW/mSnjfi0FV3hHnKF3itq3xpd+4fL/xdLy9dGUXUnv1HGYt+0UWKPp3QyLGVn8oxEqieWP/NKcZtFlLjPFNPPHvM9KAnxYNJeJZffTwBSnvds/yRCFbeCk+En2caXAbxPENRXdi01MaqxpeVnFuE1gaGEPTTwJ2Njc7uaP0kUOg1WFiSRtmh30GR+HQ0mw/0diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woO0x4RxW6lgHFBhT2bvLA9cT/zTJKblIPvtdsPPNgM=;
 b=FU4zE5aSTIt1G7P4IVBoq7zUHuR587I0xr2MYkm1J6NkLh4K2qkqNnF8PVDl7Pjtdpv9MABaQIkSP2omYBS7NNX+WsGH8lC5BpkdRSQ7DX7klHe5kOjyq0kfTJ6auwtSov8PbYrs4nA1vHLA9EePI+6dKodPd1IWfPdLsNt5gGtyru9Ipyt9VJ733JFUWuwU86xmADScE9CkFD9Obo7FoBagWUw77NVwawu7yLiHT/GiWzJqwazz/oyIfmQn/paeSE91AS5NS5ehYEKp8eSD99WUHSe4w7eGJ/nqNyswFMAgYcx0qQ0Em1ZPFH8r9futdUsOz8+qu2SVrbxGu4Manw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woO0x4RxW6lgHFBhT2bvLA9cT/zTJKblIPvtdsPPNgM=;
 b=WeBxm43J/KP2xGpQPbf7mWfq+TaqOuYNif8IaCJ70Mphuk0M6jMv0vj424csLN2qbl4ATboOE8CeHdiVE9xIse8mG8QGTRdDPkBULYoHnaVOH65Qf/mY1SPhkNVHegulcrbgylRPZcEbGEvjdkmcyTPL4QcG+esI0kinoe6OgIc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:44:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:44:27 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-tqdm: Upgrade 4.50.0 -> 4.50.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
 <20201009103535.31339-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <16d8d927-888e-acfc-929f-09c10299a8a6@windriver.com>
Date: Tue, 13 Oct 2020 19:44:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201009103535.31339-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR11CA0037.namprd11.prod.outlook.com (2603:10b6:a03:80::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 23:44:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b950867-6cd7-4784-36e6-08d86fd1ec3b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816013A28F5D1C4659E2BBB9F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LniscgxKHMuw6FD/kgxB9aa++hAFOTF+5cRxAzdN3OglGw4VcdGr8jmNE39zFg/jk4ePNF31hCoBTPQO0kPridyRMhcUpiboNPshbYcFavt18c8KcbmVqRdkHP9UvebIYbzpTAqIY4k6MNrphsCjSNes+zBRfwgaQiuxSs+MlTUzVEVtQlm4UhClIlLX93utJtqN8JrN6qzWw4ypnTwEejxsC05Ts6ae3Y0EaYolR9Da5TrPLOrnyyk7vJvuU8Okypgdqt+rxS/CDU/CJ1tJLNLU6eI0pmOpjdHk/TJROApbZlnBfqv7AzB2g66vrEzoCO+gAyAfn3XWDsVGdUkKNj3j3tYAU4f4d0zJorlN27HCZfWm9XQweIW0M1URiehTX3vH6VWT44rbf5nsl2CN+dQlciu8dQkSMxt/GpdO5mvT2wN2NIH4TNn06vO9eEns6GlOKuwCNpfI7LfehVZwuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	J5bhrXNzNP0HoboUQJgM+eZRxMbqagttIJSQWVoH50h8/xPOcXCoZ3PKA3Q7QlsGmHu0pCyYrCyWVcrEUAVqfDtVbwMwWxOrpcTTkoacnRdC40hCtiHApY30vOiuJwsrrpcIgFYO8Kp68w+BKWc6Bxw7kWDZPh4Pi1edTsk6NVBGySj2x/aWZnYszHsdl+ypZL6MepOxlO+zmw0H8Y78jnWbfYK3Qp6DCdwvnlLNS3AHkHnktqAbVaY7WUj2cfCWQvnH7BAGISwq0uD2v4p250a0kDhXuORExtkU2PIiuHnfR674WNg4MJYLIi1K8jnG9PEZHEnSLP8+w8pf2mBrEgT/D7PESlhvUUWDNtusbqnDWsGgLwYJfH810sD/JpwlC8HgO8zApRBTKUsA4Bqqe2OFDjaiD1CjYvtptRcke72CuWKRd/nuf0LwND2DRm3aR4w3Yqm8LJXBndgdmRvXGN4wWybjY9aTouK0Qp8tUF3G/AbdYVmTH/PMu5Ejhy6cm7kGwPA+gOwm4I0qtULNVDHAL6toTDySpN2umoVn7/Gi44w5HuS8/3V1llmf0dQteGKwGsKdbZiCQK1LGhB1tRC4nXotSaYsMS2Q32h3o20vnoTDZl22h1/9IRuW0rFWJF1d8eUAp5ooXWrqoM146g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b950867-6cd7-4784-36e6-08d86fd1ec3b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:44:27.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHaJ0xQH3D3rBjpDpYn++8l2wP6EnC7qJbH5DYX1373a7vESRhLxX//kkouWxMFsfXaA4+fcBrUrsOo3tChkfNdaMeTr19JoBdPgw5NOhJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------1646834215FB338FEA44E640"
Content-Language: en-US

--------------1646834215FB338FEA44E640
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/20 6:35 AM, Leon Anavi wrote:
> - fixed platform.system() causing fork() warnings
> - fixed contrib.concurrent.process_map pickling error with
>    threading.RLock
> - updated documentation & examples
> - updated CI framework
> - updated tests
> - misc code tidy
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.50.0.bb => python3-tqdm_4.50.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.50.0.bb => python3-tqdm_4.50.2.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
> index bf0385410e..9c2d06ba94 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "4352d89e2c6d6b017f40f244baddfc51"
> -SRC_URI[sha256sum] = "93b7a6a9129fce904f6df4cf3ae7ff431d779be681a95c3344c26f3e6c09abfa"
> +SRC_URI[md5sum] = "2e56a15d28aa1fa06eeb31031c16c1f3"
> +SRC_URI[sha256sum] = "69dfa6714dee976e2425a9aab84b622675b7b1742873041e3db8a8e86132a4af"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------1646834215FB338FEA44E640
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/9/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201009103535.31339-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- fixed platform.system() causing fork() warnings
- fixed contrib.concurrent.process_map pickling error with
  threading.RLock
- updated documentation &amp; examples
- updated CI framework
- updated tests
- misc code tidy

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201009103535.31339-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.50.0.bb =&gt; python3-tqdm_4.50.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.50.0.bb =&gt; python3-tqdm_4.50.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
index bf0385410e..9c2d06ba94 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
@@ -5,8 +5,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
 
-SRC_URI[md5sum] = &quot;4352d89e2c6d6b017f40f244baddfc51&quot;
-SRC_URI[sha256sum] = &quot;93b7a6a9129fce904f6df4cf3ae7ff431d779be681a95c3344c26f3e6c09abfa&quot;
+SRC_URI[md5sum] = &quot;2e56a15d28aa1fa06eeb31031c16c1f3&quot;
+SRC_URI[sha256sum] = &quot;69dfa6714dee976e2425a9aab84b622675b7b1742873041e3db8a8e86132a4af&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1646834215FB338FEA44E640--

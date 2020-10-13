Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.76])
 by mx.groups.io with SMTP id smtpd.web11.9159.1602632583003429866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c18lqHJD;
 spf=pass (domain: windriver.com, ip: 40.107.244.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krdSc5u/s/X+WbhWCxuQliiTt49fd8LTCIPnZ6CxG6++tQkt4iNr8zB3mhfJD8dQAR+tgdoO2TTKPBZL6Bu5gTGND8PuKDbu6Vw1XiE6MjqFXtTX++prUYpdbNFgbZwxqiGrWgPuV2RpTbLXRcug9rSCHkzJNHfgbkHNSOgXX7ir338dDX0e8LPpq1/LTb/iLSWc+c+NB2w/8M/11xbdKOwbCL1LB7+URL4LMCcREiIIPdvpAQL8U/08Ih/4BjGPzlI+8nQCxRgZ4YpYcOWIQXzCsaz5H0gk3CvExnJoFWy6jiA4BOjW5/zVL1hZA32w/a8JxuVpz3Yc/lOg7Iw6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23NoQebcsm2+Xg1zRuH99Z/1TBZrolJ1xrZr+l/Qg44=;
 b=Ckz37SIOmQOjn0C0GUXaA8xj7WiXvqrCvT+Cu7kHy/dVK+rI3feMue8OZgVAUS11YwL3vkFWPrptwoV/THMe60fwHnFmOCLNMwZgF4R29lRXoMjpD4qAhmYfwlCceXja9FWzcIMjYkcQsAMIUcYz5XCtGU1GNXhiOFab8C+2cTD9HYCoWKkQv5NfqP/hkJerJs9VTH9RbYxcwlAKaWtijSAcFGoCgeNfg5XYOy2H/N7vb4gIAx0inQyqJI+hmUQERaP7HIsQEEPrFc0lcEeaL2WDbQm2b3yBVd3JysWssuuXeiHiAVNrMObbgDn5WDxrWt7Q+WYKcZXg2cfKf7Vmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23NoQebcsm2+Xg1zRuH99Z/1TBZrolJ1xrZr+l/Qg44=;
 b=c18lqHJDOKdGymnXbvi9BKLbfJWpcRo+GYnqBf3FSlYxUefRFYfkDCmmCNEtjBSPWJ1Xa81qQMgHAn4ogUHRkmQlK9u6RVuRRXGwvH8KAOS9uZUL7hXStVJ5+dY6mUqzVBbeoo2lKOYlPnS6oZ5AaYG0EYIZDioIa90Fjo7V8f4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:43:01 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:43:01 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pyperclip: Upgrade 1.8.0 -> 1.8.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
 <20201012140022.15761-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8ca70955-8d10-7b91-c561-9a24324956b4@windriver.com>
Date: Tue, 13 Oct 2020 19:42:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201012140022.15761-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:1d0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 23:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551aa638-f40b-4553-4785-08d86fd1b8e8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816C7AD9FD8D33255ED92369F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q+vsrHwV9Nacc2AhTeEwVkyS+DsxkV79EvBSAlyp1Fu+Vhe6VJDEFi6H2eHvNxwq8Ll2x1uCdsvULCWD5ze2USzE1TL8ojx9eF/ApgDbWtSTE7aBTrtqcdKgcXHmFqTq8rrVUlwvybsqFWgi3tNYIMp9BBQTitECJOtFvDWJuBtmdmzpdG3Z0AyjXycqMsqfr+ZJL/mIODW1eLimni8AhF4OcByDRbrJvqrIQRIHCxNfro77UbXZB3gK/rphFEpJM8o+q3DaFrTD7Mocxp569XOoxHJlTxWe1ZCZwzIoIMom5+DOyL1S0TFTGoqBpjza+Sjx0F6YcAFHPrAyfLccO10XuO9Gw5ngc5sN5laVhpUgD7Ix2J+cdd3y945a8tnSK6f0+2tudkeLav7QZzkNH8rYUe5Z4HE73lz76t2LI6bzMP1k24BTWbldMoh/AVPqsnE5CqtA1+1OJsMS54tzZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xH2/A+E4qsygFRybvncAtKNPPlLkP79wrovZOqX9Ig94qqsAaq+ksVPMrWUdCRg6odm8PaJIxFyeY4BbcB6XLv5bxanYblTPXX4efhKcPqbiq4i6fg4/Ok+i4f9TSDWoj8G21+5iG01Orrw9+KHCzmMOssbaUhfInWcFRkhY0MX2DcavcpJrPDrI2VB7fOmpaVhIhmmcDp42usx3nsDHOwBDiqieWJHVYRaqKE+urbtHm2CLaIa8LklpjOJXRQAbDqIW02KsgBs9/KOD61Gt5rDQ9G94jusSByAPtjVxdtNCp3OihMQRX/lcsOpGvjKclOfLooFqJP9yMNGdddLexNwPcK0oSuRc6aGwPsC28/MnYbqHBaWodZIsu4Nu4d3VHorLgLanKDnsCbZl7Nzzi57eID1D/vEP9aSF+joaGwdEO7+lG+NDSrgeHPMqzcOmFo4GeZj5X687OhSi7bJ/4I3NdaV2bORqBW5eJIikCOFfSb5YZa8FD4avYzhiY3mKOP9LCmoUqAULpGbaC9P7zjouWYnhZBPdpTGjz8BuMCkKPdkhkshNGCtArVLy6a+qW6MxZ/BMGsS8P4kFxS5NtyVn8t0QfcPL6XagEqalDhEl/cAaVtkiEadFVFYdha28sw4m7ZdUeKv8+cOwH9yR0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551aa638-f40b-4553-4785-08d86fd1b8e8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:43:01.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4R8S7jp1F511qi5flffwEmX08GaxeDG8QofBJ7LnQBOvZYzWFWjpCqoE0HpELqpnXSikextCtyqBSI2ydUk4xMs8q8viiQx7r948qF/iHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------5D99B975C0C18963388494C7"
Content-Language: en-US

--------------5D99B975C0C18963388494C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/20 10:00 AM, Leon Anavi wrote:
> - Get rid of trailing whitespace.
> - Updated supported python versions in the setup.py file
> - Added the ability to copy text from the command line.
> - Fix for WSL2 and Ubuntu LTS 20.04
> - Made PyQt checks in tests more specific
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pyperclip_1.8.0.bb => python3-pyperclip_1.8.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.0.bb => python3-pyperclip_1.8.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
> index 8f331529a6..211580b37c 100644
> --- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/asweigart/pyperclip"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
>   
> -SRC_URI[md5sum] = "c2564a74b909b6fc32401afd619de83d"
> -SRC_URI[sha256sum] = "b75b975160428d84608c26edba2dec146e7799566aea42c1fe1b32e72b6028f2"
> +SRC_URI[md5sum] = "0ac879899da5c2af755a834245ca6a0f"
> +SRC_URI[sha256sum] = "9abef1e79ce635eb62309ecae02dfb5a3eb952fa7d6dce09c1aef063f81424d3"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------5D99B975C0C18963388494C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/20 10:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201012140022.15761-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Get rid of trailing whitespace.
- Updated supported python versions in the setup.py file
- Added the ability to copy text from the command line.
- Fix for WSL2 and Ubuntu LTS 20.04
- Made PyQt checks in tests more specific

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201012140022.15761-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pyperclip_1.8.0.bb =&gt; python3-pyperclip_1.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.0.bb =&gt; python3-pyperclip_1.8.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
index 8f331529a6..211580b37c 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/asweigart/pyperclip">&quot;https://github.com/asweigart/pyperclip&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632">&quot;file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632&quot;</a>
 
-SRC_URI[md5sum] = &quot;c2564a74b909b6fc32401afd619de83d&quot;
-SRC_URI[sha256sum] = &quot;b75b975160428d84608c26edba2dec146e7799566aea42c1fe1b32e72b6028f2&quot;
+SRC_URI[md5sum] = &quot;0ac879899da5c2af755a834245ca6a0f&quot;
+SRC_URI[sha256sum] = &quot;9abef1e79ce635eb62309ecae02dfb5a3eb952fa7d6dce09c1aef063f81424d3&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5D99B975C0C18963388494C7--

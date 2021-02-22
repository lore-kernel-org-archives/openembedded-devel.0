Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.63])
 by mx.groups.io with SMTP id smtpd.web10.34348.1613999920663581562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YnO2Aklf;
 spf=pass (domain: windriver.com, ip: 40.107.92.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUH8NaYIkFP4iCHU4DjRYNnaaWDWagi+F2b7hy9mfvytmN0VNcqIE7UJ2aBQXoseBxVLPeCG4tSirJPHPSSREjhMrGX3dR4ODsx790hznwCfinm2a+670kf3mxRYsdABC7Iysn81mvfPce1isZehHBvsNGDLk0JW0kCyVINUmr/jPFk+YztVqM2KWQmKL4a247AiDMryvx5CE4G6R+1UpOmqoLHMWC54zEuhfsFMBvYyMbsBYXKw8icjaLXUMlK8l3XbEjIk3TPyso2DkoYFg+8ixwT1s3JIRwe+nayeveRcUdV5W5APrXlG/XxUA125grbsOBRMjbTAo33RUrISZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJtn1Sz748gaiJ74lJ14knOgNf7jzsZ4NZF4TUOT2X4=;
 b=GuU5+EOrQPl1q6RteS7yxkwJI2x5aA6OXUNdhR9ehD2PinjRIn4JxGLlVmPIbeiMdJQtmLJsCgU+Vs91i/tmHqpJhkRGAUv+A6W1TDWEvFEl3tXGJoDOPXJHHhRGvTqZRTsEKEor5e4i67SZAcd6F7nWWYE3IOLnpXziQaFGGnyLgBAIjs+Xp/K/P7EQCIrec2sshVZpOpl7pWvFU2cdgE32nhmoi3fjjh7fNFwhGJnZkjQR7Ki94KbOIJvyZvEQhSS6FFQ5J6TrZSNXeOHf9lnuA79uXqL/oRlBMJbg9u7RY4hjOeibrB37kDRixdM/4E4nPxuuVDDGgYPSMQzI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJtn1Sz748gaiJ74lJ14knOgNf7jzsZ4NZF4TUOT2X4=;
 b=YnO2AklfnxDk0JUeOEAx9qYqBxI/DrqdmfDYlPR5BM+7TMd5b52TudwZH/iYAUIXAWArynJxNt6mYLUzcP088xAHAa+lBeNq9PpuaZ98pPuuhkqXcO2NLWQJvVM0R9tLuBiAtx/SmWNtXdk5KzrbuZnbVcWRLSQSFQ8+a+GJBRM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:18:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:18:39 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-soupsieve: update to 2.2
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215436.2368058-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <581a2165-9c6d-5bf4-b673-95a133bb650b@windriver.com>
Date: Mon, 22 Feb 2021 08:18:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215436.2368058-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:208:134::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:208:134::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c6590ba-46e0-4fc3-0472-08d8d7345dfb
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3893BF4B715987314B6155CC9F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+w0hqgnoe9rFVT5ZivLYAi+lxeTpFvLBSbXOFqWo06sQeNCHPX3PW48olhQJaTUV9MYVCTkIfDBXWGlInht+a8NviBIUbQfejQ7vxb4GpX8tiXYaQKssNBqKF7HJheRSImo68t4MJw9iJg/BMUAGfUkuaUJEI+EV7jJ4c/t+wKJvNTbCcOX/qLkfCwHa86l3yvtNzW6I7EIXVZhIlXApttDZ/E8hp74z1pk+e3sYeJfcN12xewDH390tXJgCs73PYmnToKw5ezrGbQtMclNJLQn40iv4N95B9nbDrHzIuYIP4qGrAfKnkFPGbQ4ajwXHjgZ/lyrGadWoEYN7NAkvl17LlRtt9no143mkPL9cYDmaLSiWz6OO3Oxvi/KJ0I8LLOZAlGF0owN5jCkkveWWmyb0GT9ifWtqj+Om8tMwLndCmslDu2DjEWLhATP50wAe8FJEPPS35s/JiEk68xLAuKQmvu8zlsLrrN/Spo0wAnnz3Q8rnhaIDNQecWaKWoMX2o07fSmFp66z+sx/a1rTsxmk/skE0FbRK5RvlgEeBU+70laHb9Xu6FHBTNDV9RPD2W++zvKt0Ek5QbU8HfevkmQ5l98URLT7yYzAI/E5jsVndApXFPQhN+u1NryP3w+KYL8VBuRs12iicRfJgFMpEyfd3oScFi5Rfc3FCPa6+J9RIg9BN+IRg1b2plX5sCTM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aG96VXpFNGx5Z1QzRHlWRENtU3R0RjBnWDhob2UzcFgrbHROWXNRRFdIRWNO?=
 =?utf-8?B?NTczWDY5dEJ3Z1hFN01MaFFReTBvamlSZEU3YVdGaXBpSm1HS1Vvb2FDREVa?=
 =?utf-8?B?RmpXS1pzdDY0NDRCakt1L1dMbDFuSHVlNXk5azhlN1VCak1KaTR5Ui9UQUo3?=
 =?utf-8?B?YlVYQ3pNOThPRUtac2xNK21rYXJSRk9xTFl1dSt4bXhhSjh6UVlzRkg3Qjg1?=
 =?utf-8?B?bmxXZjU3NEdOcWdvVXRpZXhaTDNFd3dIbjlYQ2lpQVZ3S1FFbmZRUThKbmR0?=
 =?utf-8?B?bjJFZGFMWExQdDJiOG51ZzdLNStiY0FCVGRZWXpyWkNka2tUeVhRUVU2dWcz?=
 =?utf-8?B?dDR0dm5YYS80MDhnVjhHTGdSd09KVnVja05CMzlQdlg2S2owWG5rczBMVXlt?=
 =?utf-8?B?ZXZiM285THJCV09NWjA5TkFLOVJzRDduSG15YWxTQ0VxdWJETWY4ZWFRcEEx?=
 =?utf-8?B?a2hDMHJUN3pqRHRzeGJYVUNabzZNdUpURC9HOENxVHFIb2hmdnRqemQzS3Jn?=
 =?utf-8?B?YUN5QnZ2N2MyNm5HNWNLN1ZMYlh0eFNVdGoxMFZhL3VRcUxuTWtzMVYxN0Qv?=
 =?utf-8?B?K1BPZDkxRjFURkNyMVZaUEtKQkhPTkZLQVFZRDVpQnhJTDRsRjJGS2NCY1Vv?=
 =?utf-8?B?b0sveDhtSDV3MXBPSzdVd0dBYnR4a1Jpd25KbW9xSk1XSjZtRmM4bEZGZEp4?=
 =?utf-8?B?eElqMjd5U3RPZWt2OWJWeC9CMUVIQktPamlUSXRzZkZ1d3VLUXQwNTVYRVBW?=
 =?utf-8?B?MzFLSnEwcVJEQzVFOGtSSDVkRHltOWVTRGVpZUtlU1BpcU5Db2JocUdSMnpF?=
 =?utf-8?B?cUR5Wnp4Z0YxS3F5c25PL1BpdmVmaHh1MUV0MUNYK0tkcnBKd1dxTzFLSDhx?=
 =?utf-8?B?V3NzQjN4NWkxb2FEZWYvWjZpNVpPZ0JzUmJpei8rRE93ZlV6ZTBEZXYrd1p3?=
 =?utf-8?B?cWQrSTRFT3BtNGR5MG44M0toQzJoUm1LV3duZThqK3c5Ui85VXNwRTJtZlQw?=
 =?utf-8?B?SU13aVZrOVlMNFBLNXhmaGpmZ2x4ZXJtS0NEc1l5VmpVUFVCb1BkZ0MrT0Vp?=
 =?utf-8?B?a3Q4OXpiRG1vZVhiQWdBWTdSRDFFcy84YStKUGY5K2E0M0pYVmdaU0lvYXRx?=
 =?utf-8?B?Y1dmYzNHWU9xL3RVdDBybjlJSmpZWXV0NFAxb0VMRlRhMjNxVHQwbFNod1Ji?=
 =?utf-8?B?cWR4STBNZmtVdjRjTjVIeEJjUlVXZVVIelZtRTRadTAyZ3ZtZmwxcUhqQVJw?=
 =?utf-8?B?TWNUS29TRnFsZHFMMDMzbm45WEprdVlEYXA4ZXBTcVlUQlQrd0tLeFY0bld2?=
 =?utf-8?B?MmFyRVdZeTNSbDlucEZxZEhxcmZVMjE5U1ZaL0xnNHNqN1JRSTd0M1Q3RkFP?=
 =?utf-8?B?QVlzd09iZ1NCek5RRk1lbzkzaEFEbFloRHBUUXlIV1hPUjFJRjc0RXczbHF6?=
 =?utf-8?B?WVAxaWNTYkpyTWM2T0Fac09ESWFnQ1I2dittTXd0QTk5RFdHQVFKRytQZVBB?=
 =?utf-8?B?RjFFY3IxenIwSVJGa1cwa05yMUZIczUzdWVZd1pCUjN5dGk5eEpBRGUxREJJ?=
 =?utf-8?B?UGZBR1BaZ2lmekhOamNiRWFNeHlNSHdHKzhXUEpEakFaNTRaU3dzdXE2N3Rz?=
 =?utf-8?B?Qk1hNlVzZ1p1M1pFWjFZWEpUTjcvOWVxZHJFZnFZcG85Q20rQjR1Y1lpMlNs?=
 =?utf-8?B?TmozTkdaU2lxcjVZYkRJOHJsVUovZFNFMEpvRC9nT2RQdktSYW1XczZkOTln?=
 =?utf-8?Q?b5gW1Gqd9h+P/o1rOmCyyUxK/1cyjrvlZu0Wxbt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6590ba-46e0-4fc3-0472-08d8d7345dfb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:18:39.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8G2UkoWxIHl32V4SHFcRFy9kEqUFrNS7oUiBthjySwCrg3nCPgw9PEgHoKdaRJo42VAWQwbhzuNvq9nyB2QQr3CphipYkCeBuIV4soYKFAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------FCF1498EF6263026F7E7AA1E"
Content-Language: en-US

--------------FCF1498EF6263026F7E7AA1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:54 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: copyright years.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-soupsieve_2.1.bb => python3-soupsieve_2.2.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-soupsieve_2.1.bb => python3-soupsieve_2.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
> rename to meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
> index 7cb0efbf9..9507f60d7 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
> @@ -2,9 +2,9 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
>   HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67"
>
> -SRC_URI[sha256sum] = "6dc52924dc0bc710a5d16794e6b3480b2c7c08b07729505feab2b2c16661ff6e"
> +SRC_URI[sha256sum] = "407fa1e8eb3458d1b5614df51d9651a1180ea5fedf07feb46e45d7e25e6d6cdd"
>
>   inherit pypi setuptools3 ptest
>
> --
> 2.25.1
>
>
> 
>

--------------FCF1498EF6263026F7E7AA1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:54 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215436.2368058-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215436.2368058-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-soupsieve_2.1.bb =&gt; python3-soupsieve_2.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.1.bb =&gt; python3-soupsieve_2.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
index 7cb0efbf9..9507f60d7 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
@@ -2,9 +2,9 @@ SUMMARY = &quot;CSS selector library for python-beautifulsoup4&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/facelessuser/soupsieve">&quot;https://github.com/facelessuser/soupsieve&quot;</a>

 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5">&quot;file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67">&quot;file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67&quot;</a>

-SRC_URI[sha256sum] = &quot;6dc52924dc0bc710a5d16794e6b3480b2c7c08b07729505feab2b2c16661ff6e&quot;
+SRC_URI[sha256sum] = &quot;407fa1e8eb3458d1b5614df51d9651a1180ea5fedf07feb46e45d7e25e6d6cdd&quot;

 inherit pypi setuptools3 ptest

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------FCF1498EF6263026F7E7AA1E--

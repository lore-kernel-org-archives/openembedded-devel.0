Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.57])
 by mx.groups.io with SMTP id smtpd.web12.7349.1613480302168519946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JbMigfOi;
 spf=pass (domain: windriver.com, ip: 40.107.93.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATODShD8TZgePmwtHdddnJDkHp2grJKqD3ANIlBE675ISE5QnLOcND7eDX+zowpslV6YubWLKqSfQtP25RNt9oHXNHnhKEEfo+osWB+ryCEqzgom0Bzpnklj8pKPVT9a8w38tS8cLWGJiBDzMbRkENlqh99bs6/U9JA3J0zvvkMJd3DpwYOl6GtYtmPfqsbD+1CuAKt4pVnJIyhHojvvLR0SQdJVriGWfEaax1azpAmONGTAxQ0RsInD+JqzhLuSX2sDF2uyKJjNMlb/E84dwvSk7BeVOpGvQkPdfjTf3f1q96R1tGW21OU2MgXzqp9i7UhaNafOY1VZqayChCOFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h75xoxjLU6VCIEBfcfxp+QBxEf9QBItTkzGBaAroOYY=;
 b=JdgajtRQO5zUkRP1+hKGMfINUsKqfMhD4EeDBu6mzu6kR/0XcBB18K0CfhZWLa+apMO+BruWSnm5d+XkBUWqMAmf9K82IUJKlNh8uAdaR/kNvCKMob8pxz8v5XlTix6eYkLVgNSRj76ZGJBOzp3vaY+0x58gfethh+5WYa9AqEDUGqGFms4UDzIbSdKvz8eDML6RzzphfgmlJRtS1fm6tSq1JMqIdPLdEZxVcllLYhFYvlnFYpM/Zz4QxTnOLkNYJlHVwA20WvzfqmzNk0bJF+gplYiC2QLYc07zm4CMxPj08PlUO4fsd5s03FAbw64xw0fyhy5zAavmu7QIsEVrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h75xoxjLU6VCIEBfcfxp+QBxEf9QBItTkzGBaAroOYY=;
 b=JbMigfOiD8YPHowv98dipaHwUkjMTF9Ek5jtjnpQYzYPi2Dp59S4Ruat6YKSWzqt9pEhgKB8IYC0uW3vUgCHxgSKLp5QN56myppQ2AhN8by4CjvVa1XcSCNnbw4lj46KumbXE95AE5BWconJLBroNT4b5dpWTUq+IXnaThbbR1w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 12:58:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:58:20 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-aiohttp: add missing RDEPENDS on python3-typing-extensions
To: =?UTF-8?Q?Enrico_J=c3=b6rns?= <ejo@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
References: <20210212005841.25534-1-ejo@pengutronix.de>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5da02166-2dcc-b544-cb88-092e8aa0e9b2@windriver.com>
Date: Tue, 16 Feb 2021 07:58:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210212005841.25534-1-ejo@pengutronix.de>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:208:15e::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR17CA0023.namprd17.prod.outlook.com (2603:10b6:208:15e::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 12:58:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9242d48-131a-41bc-209d-08d8d27a891d
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4418736EB3B912520A83CD3C9F879@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4EKMLvKOpv2T/OoQCthBhcxJWGJBiJy0J3U5F8tdN/jaVeTPiPpI8NPjsJ2GJp68pyGRvu8Qgfn8h/PaZMK3ippEpgGc3ZGXs3ChzGWI319OOa/Hw/Gb8CUcX9mnQewzsmz98Mf0NcQyNMrhbJrtEATDxL+syqPURhD7JXkVWgyosXdTSkzqURaSxIgXTyVAFEUzvtI6ou/B4Iwe6KTWYZQkFWvtXUzH1WPAp+8/hbChOH56fYkHZs8SqsmVE7OXdrYvftioYrlejeY6JtY205eDy+OwH4d5546tQee6lMEKD+s6361Kgmnsm4V64qzE5LDBm9DHGCLSqv0pfr2yoBgCX/JpJYVnGP7286w806o/b63HUUrGjB2qjQrS/hzHSn58MBbb3WAoiUkrC3ScihtgmERswntGJ3pcJ7BMEzzxB1o9auhK60jOHREevFJyometNJUz1d5gBrcqE7IZypwpMcONCQ8dk4PaDZCjx+KGolJ4qZdsXbkOYaKT2o8djT3vs1zWUuTask4hoHbkyZoyuj538NVMyalPrNRdVNkvNxVRVLaP0Z8Qmd8BbBY9Kf19l0yBMeB3ms9NCKS6oMruEzs3KrBxCP5CM3aN5n4NbnZ1syo+kfihsuWVmVlkdDeug7i07yVM2B+S7uW2LeVnDAxuFxcWkMZ0eI4Ko02UNemMY0ZseEN55n3BVtuU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(44832011)(2906002)(2616005)(186003)(478600001)(86362001)(33964004)(53546011)(31696002)(6486002)(52116002)(36756003)(31686004)(16526019)(8676002)(316002)(16576012)(8936002)(66556008)(66476007)(166002)(26005)(66946007)(66574015)(966005)(5660300002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UTI5VHV5WmdlY0liTUJ0SDF2VUJOb0UvaHNnNE83aVplaHR2RER3bnMyS1I5?=
 =?utf-8?B?OU54U1hxYVVQNEdOVnptbnhYUG9peFcrUXNoWDl1elJmUXg1dnVHSzlQTmxP?=
 =?utf-8?B?Nlh1S0ZIWkJHdXVWK1lIek5MUlZZbjE2NmRuZXFRWmlwS0RVSldCdFhzZjNY?=
 =?utf-8?B?VnI4dXk1UzZETDdhbVEvTEl3NUxnK3kySm11bG8zcjBET044NURTaW5Eb2pm?=
 =?utf-8?B?dmtmMmR2U1NYYXUrb0t0ZTR4RjVPaVZEU3UrbG1YaGVlRkhFUG0vMFZEYngy?=
 =?utf-8?B?Z1NqakpHaWVYZHUvUk8yd1YvaW1nYnQxNncycHVPbDNRa1RDanZMZ2U5TDRI?=
 =?utf-8?B?MzlQZ3kzVEYxY1NmSWtLR2FFUkRyZ013YlY3c3FmRXN3bWlQcHBHbld0aEZl?=
 =?utf-8?B?cG92MG9kNVk0a0lkM013SHM1ZTE0RU1VVkp0a2dRYjAxaldWcEVZZXhYbnlS?=
 =?utf-8?B?Y2NGQlBLWUNJZ29MNFZETVhOL2FJZmhFVHpwRmtZcFBMSkxiSEVyN3lpN3g5?=
 =?utf-8?B?ZytBeVpLUVJwdWhScHZiV1Qycm9laGpJOW1KbG5kK3gzS0o5SzNOd3pGTEFk?=
 =?utf-8?B?eksrRFE3OGJVTnZ0OFpSWlpYOXlWS2lnZlhlZWdDTWJNdXJoWnkySlhRNzlM?=
 =?utf-8?B?ZDR1NHVHc3ZncjI5MWg2T1RBdUpOK05FOHF3T3NVK1RmZU1CUHEyTklRVXAv?=
 =?utf-8?B?L3BFdVFUMXhSaGxDTVlGVWQwRFlFSUF1OUFrSm9qZnI1MWJyVkU4dEhIamd3?=
 =?utf-8?B?R01jQ3RWQ0tCcW1Cclgzd003cHZaMW5xSXVYV25vMWhqcloyQ1ZzdlJPSXRE?=
 =?utf-8?B?clZRUHFUSUY5bFpYV0tQVVQydlFXQ3R1cDl3QXFrRElUWUJnWm9nMXVBL1pi?=
 =?utf-8?B?cFJGWGR2NlppaHM1bnAwKzN3clRBWm1iU2VpdXBZNjNxRmVsMzgwOVlYaGhX?=
 =?utf-8?B?czhhNG9HdW85L2hZbGJ0TVFJZGVEb25WV2JjRFNxTnJRUnZHK3BCc01jYWdW?=
 =?utf-8?B?M0M4L3RyZDJiY055RXdDV2xJTjRrQXNKdmo4blZmZ01oUzJ1blpCSlVSaTF5?=
 =?utf-8?B?dWI1cXAxcDgxZUMyQ3Q3WWI1NVJWWnRiMzRNR01wWFRQeExuczd6OFlLbTRn?=
 =?utf-8?B?WDljSng5ZGZPZ3ZYY2FxMC85WVJyTjNXdmtRNHZyL3J1cGh2UTMySkZDWUVk?=
 =?utf-8?B?TEM5R210RHZuTnAwVFY4S1J5bTZQdFRqTmpCdkFpUW5CRFNSY0pBaUxob3ZJ?=
 =?utf-8?B?a25xdGRRbXh0UkgrN0Z2eUsrVjdkQmY2NXdlejEyYlJNK3hqamtvSllyRTcw?=
 =?utf-8?B?SDJDS2xiS2ZUaVhUZEs4YWhOZU1kdW8rQkxJZk1Zd2F0ZzM3RTc3K3dXUWZY?=
 =?utf-8?B?NktJUnhPekxmRHNnRUJrdkxoNmU4N3pNMWxsalBNaWxjQjN1L2xCVit0TVhO?=
 =?utf-8?B?QzlCQ2dZRTVMK3kzU25QN0pQUTZGZ1JyYlpHck1ndGlHbzZPeWtvV3FYSDZ4?=
 =?utf-8?B?Q0s0NXM1ZnlQaGhDdFBJcUVWSnRJSEMyV2JwNGV1S1hxYkNXamhjN1NyV3lz?=
 =?utf-8?B?NFh6bC9oTWxiQm9UMXFxeVVsb3gxdVpISUx6VGZvaWtuMFB6aStTRFJVNGkw?=
 =?utf-8?B?VTcyNWNQTC9Ha24xbFg1NVNtU0ZmMzM4dmxwOWhaZlF4TTFlTXpaY1JsNTk2?=
 =?utf-8?B?YjltaWVHTC9TR2x2YlFmTWJrVTNuTy9wTWJBMi9SL3krMnlia0RPbkZIRFlF?=
 =?utf-8?Q?fX1AAX6/Cc4hDx4Rmv8t/EmrRm+DPOtGoaun7ug?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9242d48-131a-41bc-209d-08d8d27a891d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:58:20.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QSQ6MkA86PqguIPFTKCrXFirurHRDVWGqottAVtP46mssayxaNNg3dsu21w21alPyOIKA70DM8P5yc7HBjrK93D8siwiz9AazXSRezHP1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------92F5B474474E27718BCB3425"
Content-Language: en-US

--------------92F5B474474E27718BCB3425
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-11 7:58 p.m., Enrico Jörns wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Since aiohttp PR #5078 was backported to 3.7 release
> (https://github.com/aio-libs/aiohttp/pull/5079), aiohttp depends on
> 'typing_extensions' python module [1], provided by python3-typing-extensions
> package in meta-python.
>
> [1] https://github.com/aio-libs/aiohttp/blob/v3.7.2/setup.py#L74
>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> index bccbd4b0e..5d62e0676 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> @@ -18,5 +18,6 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-misc \
>       ${PYTHON_PN}-multidict \
>       ${PYTHON_PN}-netserver \
> +    ${PYTHON_PN}-typing-extensions \
>       ${PYTHON_PN}-yarl \
>   "
> --
> 2.29.2
>
>
> 
>

--------------92F5B474474E27718BCB3425
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-11 7:58 p.m., Enrico Jörns
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210212005841.25534-1-ejo@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Since aiohttp PR #5078 was backported to 3.7 release
(<a class="moz-txt-link-freetext" href="https://github.com/aio-libs/aiohttp/pull/5079">https://github.com/aio-libs/aiohttp/pull/5079</a>), aiohttp depends on
'typing_extensions' python module [1], provided by python3-typing-extensions
package in meta-python.

[1] <a class="moz-txt-link-freetext" href="https://github.com/aio-libs/aiohttp/blob/v3.7.2/setup.py#L74">https://github.com/aio-libs/aiohttp/blob/v3.7.2/setup.py#L74</a>

Signed-off-by: Enrico Jorns <a class="moz-txt-link-rfc2396E" href="mailto:ejo@pengutronix.de">&lt;ejo@pengutronix.de&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210212005841.25534-1-ejo@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
index bccbd4b0e..5d62e0676 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
@@ -18,5 +18,6 @@ RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
     ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-typing-extensions \
     ${PYTHON_PN}-yarl \
 &quot;
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

--------------92F5B474474E27718BCB3425--

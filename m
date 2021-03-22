Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.84])
 by mx.groups.io with SMTP id smtpd.web09.13360.1616422473403882262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pGxCPyZO;
 spf=pass (domain: windriver.com, ip: 40.107.93.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAMwkQPxLQ10zhFOoRkYoBS8UR30wRWN+5ho3a7KpEdf3eCy/uQbv1hMycrk5YwcqDcjSI2rThLf31FKsP8O2le/F/K6NH+5WrmgepLTREfUq6ojphVSOGSEx1kxQHDlwc73JC2iLt7ttMLCjnLpLpqTtr7t5qBbaoCoImQ1qin4zr8qGH6KNlaFtR7i1iAlKFjITs7bVeeJw9uriNrzg9zI5WU+mfd1CeR9JwRuQNwNUqWhBtEsVWny4cU2rFex7IWuQ+kdOk8kpWTnnsfyAlgCC5HP0ZaoSkJKd2f4JyO+tFrlhLWni2ahZMhuWZtY5DxI7my1hTCxYukq5FU1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LYbhW8cedG8VMDTw4ny97AyehlwIMyQfvFoC99ZssU=;
 b=XGF2GR/DqVy+1pMUB9ACtRGNzoKxPx4x3C8VlKl1S8QH+8UbmvqpABr5vQObuW9s/NXlgpABCn60Azl1IuRRTiAujWVJHO1Q4fjXFIjXecwjjsdLBB5gehrFyKsm4w7ZeAdq9pAxGPmo94C4ATexYMsXv8ZGBnh5IBhrx4v/1CSF/b3bl6usGNDBz3vgX3LFxo3ojfIuM9UjN6c4EOb3RaehbBukWYdjQwZZ0r984poYAZC6usdLYChKl09JiULPnKdVZoXkKja1PCtM8vgA0b0uwdI3jaEg1lWTAuKysbHtPTOoVCGD2Q2l699uZuk6JH0zwEo/61ULYpeNDZ9fgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LYbhW8cedG8VMDTw4ny97AyehlwIMyQfvFoC99ZssU=;
 b=pGxCPyZO2rcbOm5ZN+K5SPyykzNQ/1+xXAJNGILSIT6n9/TzthsCE+HTVB2Gris6XYxHHfQ1gK6bL8eY1gFE/aMSbGaoCiZKR/HLScLObZXyKT6hNitjHhrU6MRioLgBmiyNzF9WmJf/Xcsf56SGo5EFx8lYcpb7C/9hH35oXWU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:14:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:14:32 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-werkzeug: Clarify BSD license type
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210318064853.1268-1-raj.khem@gmail.com>
 <20210318064853.1268-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2083490a-656a-e607-6970-df8166c7958d@windriver.com>
Date: Mon, 22 Mar 2021 10:14:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210318064853.1268-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0856.namprd03.prod.outlook.com
 (2603:10b6:408:13d::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0856.namprd03.prod.outlook.com (2603:10b6:408:13d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:14:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 831102b3-c7ff-466a-fbaa-08d8ed3ccff4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053D26A596D8BC2111D14829F659@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:140;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XkuzPWVCSbcR2px4DmlUG5J0eXfUIWv+1WU7OFza21D1yn7JsPEZ1Er7xbw9aiTwBJLZCpTrvTa6CiWWstJOIYL3a7xv6qgGQFgzsqli8ZF2LsFBFSiFOyv12F+3AnP5WojtXVMlXVnSoG1zSe6WraqJBJC794lXM1BKdmG3LshaJAtl0gqAilDbR0Fr41n+5rJwGMhuqjPaFI6Ar1Fp1jIOciyViD6Oih0KEMa8iURMHRmqj08u3u8PjyouvH4zn6p8NrSDJDwjqL+aErq2XfcarQZFJ0A8Wgu16kcWanfoEnchXzmLe2aF3Wo3KbMlW58MSZ5zwFwTeL9ACgN7YByKGodtQb+5U/2B3hircKNGsrYNvHogsu7ehwpY7itIbydggu55j1lx/SloI+NFwg1TjNXTjNHdj3c97D8PMwYZatwScFTooE+3wVP+Xjb0dnTYBih3xhvwz7diHFlmIu7jaA30eOL0o3hVCVkTMKzIep2Qp7lKmUCIYMSfL4zNt6/CMVRGpgRfSa83QE2+quRd8lqSMGLdgPc+56BbDEe1Fpa84GyKfCJIvQyzkLtM86+QGB4HtAjmtsl0lMdlEerXKYVr3W/Kf5yl5nh83BfFpiOP3/zM7pMnB9sHVIDCDf6QixW+4csmwNklvsdc8qo9U0F1fb1YDbSVjaeYvVboZh9eslxxocGVCKZDnDfUF9ZFPxnEvvxXMuNh8Jd3SwmvpFBQytGskRg1NCBk7JlLpLp5RWTxNcru+Y8IcwUyANh5TevSg4TDPTbFJ+BlnBloZUDV+vgrRKePSh6NIrM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(5660300002)(66946007)(166002)(26005)(186003)(6666004)(478600001)(66476007)(2906002)(66556008)(956004)(966005)(2616005)(16526019)(31696002)(86362001)(8936002)(44832011)(33964004)(8676002)(16576012)(31686004)(316002)(6486002)(83380400001)(36756003)(53546011)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UUt5NlY2L0ZHcjhEUGdmS2JZbkRkVXFhbzh3T3c5S2JCY0dlaGI5WHBMUHJT?=
 =?utf-8?B?WlgvQXBpQWorMHVGTTFxWEtJRmR5Slh3K1NWVWtjU2hZamxTMnc1cE4vanJ5?=
 =?utf-8?B?dkpJSGgvWDZxbXYxQnhWcmVVczBzOEExdGZiQkNzQzVuRWJCOVVPc2hoYTF4?=
 =?utf-8?B?WS9TcGYwbkhkSWtEaVFKMHlWbXUyOGJrMVJXODIzUkh3eEdkSUdxb1p3ZzIr?=
 =?utf-8?B?Sjh4SE1LdjYwd1FDOERCSFc0S1hqOWZobGtkRlNJcldUdWFGcW5rWVBNT1V2?=
 =?utf-8?B?dmdWQ0JzYUt6dHN6RTk5aXVsS09HSk5ZcEZsbGEwOCtjVXlYdGx6TlNtWXFU?=
 =?utf-8?B?dzVocWw4dFdHV3MrbS9JZWRpbEZhOEJkQW9qSHBEb01ONHYwMG8xUElMb29U?=
 =?utf-8?B?K1BKdWMvTWNaYzFKaWN1Y09obng3NFJWb3hpVVdGd3kveVFtVFlpYTR4aFB6?=
 =?utf-8?B?LzFhU1BIMEhHU3VheHJZZ3NFblg3UWdiWmhhMVl5emtHRDJ2T1hiMzZRZXRI?=
 =?utf-8?B?UHJhS3ZDUHBIQnNqWTh5OGx0cnBTRmRBR3hYb2NKMVdzZEQ2V0dSaUVsbTFJ?=
 =?utf-8?B?b2VVMTE2WnhxYmdxcWhwcEJPK3RsRzF4TUhqa1VxOHFNM3JBTnZGYTNPRkJo?=
 =?utf-8?B?VVgrSUZvdGduNjBucnpTczFXVUI0L0dlZjY5cmZ6dGZyV0VSSTl2cHAxZklY?=
 =?utf-8?B?TjBBOUtRelZpU2krMDZGa2ZwVWxBL0NtRHRSNzJwc3NGcFFrc0VHOTdRYzVN?=
 =?utf-8?B?bUw4bmlaVERlUUliS0YwWE83ajNMMzc2QVRna3R3MEV2QVBCdDN5Y0tueUNs?=
 =?utf-8?B?SFg5WUlLSDQ5SGp3ZzJ1Z1VhdExLOXRZaXhZcFp4RnhGNFdXYUVDcWc2V1M2?=
 =?utf-8?B?dmRFN3lwaTQvUjUwS1hlYUJSL013aE5vaDd1R3dKSXRub1NxWXdKK3A0cHRN?=
 =?utf-8?B?a0ZyR3czRHZXL0hUZE80YmQxak9uMkM5UUI1ZlY3NUNRZVMrdzNQT0g4R2xo?=
 =?utf-8?B?SHY1NnBUL3hrRE1FdjlETUxSMjFtOGVycHo1OE9udXY1ZFRUcmxQT2IzRUMw?=
 =?utf-8?B?cWZ3MnlqN0tjaGRVdG5UeUh3cnRYbUtMZkFQdGxmNjNra0ZRYTBoMmJWL29E?=
 =?utf-8?B?MUJSQTRDWTBKWlFTVmZTUGlMN01GWTlSandrN2FYeHZaZG0zQTlpaFJid2NL?=
 =?utf-8?B?MFlKVm5nL2kwK25WRHhpcWc1VkZpOE5JYlF0TGFqOC9CRUNCNWo4NHNLMnl0?=
 =?utf-8?B?NThWS2Fqck5xd0ZvVURqMENPa3hNZU43aEpPNEU4K2RBcDJGRVFEc0RLYjFI?=
 =?utf-8?B?anVKTTkzSTlGUDVwSEl0NEFzRXNvVDFwTklDSmMxNHpXRVpQU3hSRWg4Wmhx?=
 =?utf-8?B?R3pBUG1aOWFIQW9peWRwaVVMTUV2RmRGdjhRaFpHV0JITlErYzFxQXl3TmJr?=
 =?utf-8?B?dVozWVVkN0g0MVFtdTduZytCSng5MW51cVZCTG83d25sZlJ3NXFNRTdqdFNF?=
 =?utf-8?B?THVGYUFlWk1BRWdCemtIRmgrYndxcWhaT0ZjanEvWVIxaHMxY0svZmFlQmVI?=
 =?utf-8?B?cUwvdURRM2lNRjZKL0ZnbXRTNCtHMEFyK1RqR1ExUHppV2JVeGZUYk1RMW9l?=
 =?utf-8?B?QzNtb3Y0MmNrRzRCTjI4TUZGTGVzQ0QzRFBBcjVSOGFnNmwrVVBZeDJ5Uzc4?=
 =?utf-8?B?NlVlK3lwSmtxUjBJOG02OU4wUWZ6UXlxdU9Yd1BhbmhLb0hCOXdTUGVpWUdV?=
 =?utf-8?Q?zoTkSS01h+5KGeo6TfOSaITE9nmRd+8VrbCN6rv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831102b3-c7ff-466a-fbaa-08d8ed3ccff4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:14:31.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlWpTLAtKd9/GoEn5zemXhMDRHUiz+F1u5slwDFiVF7M0/q4K0JlbJY8DJBiXgmlCJbgaJfxOeglhwdODFnS3oo2xhaAiwAEQBooUdaWatA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------9847674042C1F95D9DA9C652"
Content-Language: en-US

--------------9847674042C1F95D9DA9C652
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-18 2:48 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
> index 58735c1c02..8af0fef60c 100644
> --- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
> @@ -7,7 +7,7 @@ HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
>   cookie handling, file uploads, a powerful URL routing system and a bunch \
>   of community contributed addon modules."
>   HOMEPAGE = "http://werkzeug.pocoo.org/"
> -LICENSE = "BSD"
> +LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
>
>   PYPI_PACKAGE = "Werkzeug"
> --
> 2.31.0
>
>
> 
>

--------------9847674042C1F95D9DA9C652
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-18 2:48 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210318064853.1268-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210318064853.1268-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
index 58735c1c02..8af0fef60c 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
@@ -7,7 +7,7 @@ HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
 cookie handling, file uploads, a powerful URL routing system and a bunch \
 of community contributed addon modules.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://werkzeug.pocoo.org/">&quot;http://werkzeug.pocoo.org/&quot;</a>
-LICENSE = &quot;BSD&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462">&quot;file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462&quot;</a>

 PYPI_PACKAGE = &quot;Werkzeug&quot;
--
2.31.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9847674042C1F95D9DA9C652--

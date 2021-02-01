Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.70])
 by mx.groups.io with SMTP id smtpd.web10.33796.1612186537176066411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AMI03IZ+;
 spf=pass (domain: windriver.com, ip: 40.107.75.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpsaA7m57xyzHNHKO2yek3RkEDWnXvTkLVJ2U90p7FUpOEZ8AaOQhTJzCewX1kX7F8BlWPojFuAq0zQ1XkP0z7l3mOkItrL4S2xg+MAwItKAfILbnsb5in32lly3IQf+FsJzPjQFATrJm5clDppL4beitnKbtF3CUATWbC5pJpEkahxZye/R2A32nsn1pa+9W2QouMTzSGOaYICKX2abfqQ3FulhS1LAE8IRN5E5UODFWZ6kC1JeZoByoPCG0Fal92BMdYya3y/yxGJNN/NQp47iMidMyLQTsoVW1pkRM9KZBIHe65OfyPy/vEPD9GgfXT2Hw8jfVnHZdVFac7qXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4x4MxSY0go0hhs7m9U63tQlbb4RrByfffntT8zX1qw=;
 b=lTQEMwdk7cMw9ywKL/gqmlXtMNBJrqxUMGp3xMqTCmP3f9BudcPudAoYzcmJmpMrSVg48c32i2przRYzeyCb5/0QSYahjn0oeyF2YHikU2HIn6xd94isz2hdH6AvI2/P5myad/HU4m8h24djCuTo26swza1lnpFyVGNkqVMeHAYB7V+hOJHwivgnRGgYZO6XUcdrpGbPlPMO7w3XFkF9+hVH4Fpbe1hISc+QcEAsJQa//I+Z0Zi8delHJAWedaCUhe9XujjilBElvna21YHGbCtRE6NrgUeHHt+hI2Cq/5d3KtBjrb2i4n4V3TKuk8KAwIxU9CbNJPEUhtbmyBJZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4x4MxSY0go0hhs7m9U63tQlbb4RrByfffntT8zX1qw=;
 b=AMI03IZ+aUeb6Pd5wfwAmMVfGWju5wfJ8o4KakEqabQ3LjU5gKAlqAFM0YY2+EroMiZT9Sz3f6nWLjWzYIcd8Td2y2WViR4e01/VALi9M0hQNlzA3EGeTzP/w9pO5xHsSc4AhMqkXcNEPjaXZrAYuTpyjLTJR655Wl30GwRobQg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:35:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:35:35 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-aiohttp-jinja2: Upgrade 1.2.0 -> 1.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
 <20210129131029.2163-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ac484da3-c85a-3dde-9459-b8c2f28e995a@windriver.com>
Date: Mon, 1 Feb 2021 08:35:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210129131029.2163-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1101CA0016.namprd11.prod.outlook.com
 (2603:10b6:405:4a::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1101CA0016.namprd11.prod.outlook.com (2603:10b6:405:4a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 13:35:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff1f2f15-ffe2-426c-b311-08d8c6b64153
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4308DA67B740A710B5EB13F29FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LhxauTL73lUyGnlNhsvnLbVJslxQjgAxRkQ5Tt4qWe+kMxRnIWGnstZsDO0Pa43fMlGyGoD6WiHz7qkyy3nyh3X7BWhgi/yI1qnK2I9cz4MxQ1SLhmDzajCtP5d7Eu2P87uXgzIkNXmUBgmwIyRmiqeZO15QCCRLdlxaKIDdTvd6EDk4dXO91tYRmVOLRkSB64FOBprr71FdleavSu8CGaI5RdnLmB6rcq+Qa/Jf1rzbKmVEvmh5XYRr8pZ7jh47rdFqYjEFA1zvKv9pcd0sL2/kGAb0OITwq3SQmnn+LpXI1JG8/6LGd+NVNyWt2LCnXDLgT/pjg7QOAOmMrWrOeweoUPYAxDkAXlrs/iR+0+ScqdSnQp+JvZXR3xa5Ms/4NR6JDSaLNFsbLhE6RKQZcBrq6cEmQ2aSD6z/S+LpM44q/QJEKutTl2X7UZbLvuLFiYpPxlBcaoGzUlx7J8Nj67RGAvND0LRS6aAFNZq5DrcW2kMG1yL7+2t+5447ttqLTCGa0Kw7va73nyvQOHSp6eCsbGOYpLPZsLwC3fDYCYEN77jI1Ry2xvgAo474Wy9bQknfxeoBjQc6IRU+q7zIF+1slCyO8pCzYYWc0/d6bXMGc+tsn9pe401P1CDgUFT0SuHgKDlkXa46NfmSjvIpa1IrG8hF/baSCVTeIMLv3gEiIhgMwE9+QiwBX0M0+eDl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cU1sMVBFR3NOZTh3OEFqS1V0VXh5QSsycHh1RmdsNTdRaTZYQ3pMdUN0TzNT?=
 =?utf-8?B?Vjk5LytYbTA4M1ZOUDBaR1BvWHJ3YVVMMS8xbkJnZXhzTVBTRGEzcHBaSTAv?=
 =?utf-8?B?bC84OGhyKzVpNFVNWnAvSDB0b1d5cGM1S09lbnlmUFVKTlNmYVpYSmR1Qk8v?=
 =?utf-8?B?WXFFUlNFMGhPSjlyRnRSME9wcytDMWI0eWF2VDRQVlF5NkNzVk9DdjNyUTJ0?=
 =?utf-8?B?VVN1TmhhSkZxWHpYQ3ZyQWlpMXVtcmxxNXBPL2VlMEs1cWN4RWZEaCt5clZy?=
 =?utf-8?B?TVJ1OVB1c3l6NmRxYWFucTBKOXB2d0l3Q2ZkV011eUxDRUxWVCtoaEdOVEpj?=
 =?utf-8?B?a2lqR3QzRDE2b0RsUUR6ZTd3NkVrUEdrb1RmTEl3TWZqWVEvVzQ3M0huV0R0?=
 =?utf-8?B?NStzaTAvM1ZoWDJSeDdoUUJYL3hvZWlVYzJhRmpVVHZweXU3aExxYVVnc3pL?=
 =?utf-8?B?allsQy92VUlDRURqMEtlUkxUUGNNbk9rRVAxcHBUM1lSR3BvOCt2YTAwd1Zp?=
 =?utf-8?B?S015bkNrblhGWTk3T2ZENTBIRU1sSytKZnB6Zm9VV1k4WXdvZDE5bG9jSTBh?=
 =?utf-8?B?bloyanpGdk5IUGg3bVkwOTN5V25qR3UxOXk4TUlCOXZ5Si83MVdyTzhudG4v?=
 =?utf-8?B?T09jbS82N1B6TENVbnZsdlRsMHVoeU5vbGoyRktrN2VpWlNBY0ZUeVZXWUNw?=
 =?utf-8?B?TnNJVFJHbXA1T2ZpWmFPZ0J1ZG1zSldwYjJjeVJnQXpqb1p0VzBsdytvNHJM?=
 =?utf-8?B?QTJXYWo5dE4xdU1KTkcxUTc1aVMzUERhQjFBY0k2OEo4eDZNSjE2NTVPMis1?=
 =?utf-8?B?UXhPT1RJUVlJejR5dmNRNkFzMDZtcHRtNXVzOFhFZTJXcVRBeUg5M2Zjci9F?=
 =?utf-8?B?czlHL29qNUpwNzZqNC92NjRyMzNIODVzazJEeCtqcnY1QlRmVWpiZ25Md2VI?=
 =?utf-8?B?Q3dRZHQ2VzVEY2w0UlNIYllzNEYvbWFZcVZIN0xaVFlBTDVvY05KVzhFMEtI?=
 =?utf-8?B?cXdSUi81Q1FiOFVic2k1SVF6ZHBZd0NkYUVCeFMyNXRpaVUzZVhBUGc2bjk0?=
 =?utf-8?B?SFVrK2llL1A1cENkbzNnWWtCTDhBcU9YYjdJNHEvSjlTRE85bkx0YjNIVDhE?=
 =?utf-8?B?ZzExbU5VSXZDNitLQll6L1VQK09tNGtsMjE2ZG9jdGVoeXpzZTkzTW5pZ0U5?=
 =?utf-8?B?ZWpkM2RTSkF5a0dPSVcwQVovQ3llQVBPdG1wZGcwVnkrL0dHK2oyZGVSNWk0?=
 =?utf-8?B?R0ZCLzNNL1Zsb2JlVHpuVUd1WnNkb09JNHpqa09mSjBHVjJlNGJyZWZyRWhn?=
 =?utf-8?B?eDhNTjhjdnNBYTNGdld3SVRRQkV0eU11WGRKQSswUERsa09VTDJKZXhaQnY2?=
 =?utf-8?B?NHJHaXdYeEdxNDlEZ1JZN28wbmFKY1RLVTMxc2lyaHZsZHB3b21iOGU3UEx0?=
 =?utf-8?Q?U9Hz7cUI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1f2f15-ffe2-426c-b311-08d8c6b64153
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:35:35.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcZA0EdciRn2Ya38FF855Nkwfqnut75s+CzDSh98pirrKo1QsTkwRaI6yCy/8pKG2vk8OiJoqKOcvU9P4rphcDhxBO0XJ66UWFqEE6Hk4SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------F8BC7C74F17FAF6AAA4648E0"
Content-Language: en-US

--------------F8BC7C74F17FAF6AAA4648E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-29 8:10 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.4.2:
>
> - Fix type annotation for context_processors argument
> - Bump the minimal supported aiohttp version to 3.6.3 to avoid
>    problems with uncompatibility between aiohttp and yarl
> - Add async rendering support
> - Document async rendering functions
> - Add CHANGES.rst to MANIFEST.in and sdist
>
> License-Update: Remove an empty line at the end of the file
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...iohttp-jinja2_1.2.0.bb => python3-aiohttp-jinja2_1.4.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp-jinja2_1.2.0.bb => python3-aiohttp-jinja2_1.4.2.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
> index de336af22..05afed8b6 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
>
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c82758543767c96574b6e29fc478fb73"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=29dca541e03964615590ca7b50392d97"
>
> -SRC_URI[sha256sum] = "2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79"
> +SRC_URI[sha256sum] = "9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------F8BC7C74F17FAF6AAA4648E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-29 8:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210129131029.2163-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.4.2:

- Fix type annotation for context_processors argument
- Bump the minimal supported aiohttp version to 3.6.3 to avoid
  problems with uncompatibility between aiohttp and yarl
- Add async rendering support
- Document async rendering functions
- Add CHANGES.rst to MANIFEST.in and sdist

License-Update: Remove an empty line at the end of the file

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210129131029.2163-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...iohttp-jinja2_1.2.0.bb =&gt; python3-aiohttp-jinja2_1.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp-jinja2_1.2.0.bb =&gt; python3-aiohttp-jinja2_1.4.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
index de336af22..05afed8b6 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = &quot;jinja2 template renderer for aiohttp.web (http server for asyncio)&quot;

 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c82758543767c96574b6e29fc478fb73">&quot;file://LICENSE;md5=c82758543767c96574b6e29fc478fb73&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=29dca541e03964615590ca7b50392d97">&quot;file://LICENSE;md5=29dca541e03964615590ca7b50392d97&quot;</a>

-SRC_URI[sha256sum] = &quot;2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79&quot;
+SRC_URI[sha256sum] = &quot;9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F8BC7C74F17FAF6AAA4648E0--

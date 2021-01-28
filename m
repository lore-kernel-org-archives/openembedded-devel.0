Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.71])
 by mx.groups.io with SMTP id smtpd.web11.24034.1611839394045774110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iNamGWrU;
 spf=pass (domain: windriver.com, ip: 40.107.223.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPuMr637OCynJyYPqzqyfzqDnMYUnUgGIVPniEFijiKvE5g5CplXNwC6H1Gtf59l6m55kWwwLXcnX0YEwUlQY7NFOuHoeMxCFUEHNxjkA3WNICJFn5BfOirkjP8nQvKPiDzOOozxcLoHA0s0+z+yyj95jE/HyMy0Uy8LWup2vwgk1IuhUCTdbs0ZtBOIDuz2jo6XPp19JRphZvoRSNoTsRRyzn2cp5S9pWA3+oH3WXGpYO7anfF6NSJc+q6KUtYhI2m6rdrvg7bXEZZTgAupwujXPEV/GErITVsHd5lEsYCiQ+jF40Nw3gNvzrVaCYZiHqvov4NHgVZGHDPXmCMLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0+0iwM2rpvP0+3GvFIpWy34xV8awJaIDtUskie9fiI=;
 b=eTTpuw9bdExlfO8z8hixeZD2eOtmXkQ/sPvWOCGQf/NC8reXuXPbTfJ7KjGk0lQZVUp7Y+TJfEesFe3YJlXbQCStIjnbdOucjmuTZYggMW6K+bSenyWyLTlv5zulh/9d/D3Rh5WEO+6WYPHVwZafLT+PL8VYwNSrfjkRvJpxHd0YW2VHttWbGRGDGoIX0j0uZwTUF8kFh5xAZepoeOZTgMqTgCCxN/hEnwoGQ2FwU90vkP+EZ15LWY50VSGh2w9l3O7ClCditjeie/5NK+xiFVVkf2bFjWmGDXEGwkIm31GOOStXLR5/4Ijn0iiXk73cPI0U0IO0a1W2/FikgBVuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0+0iwM2rpvP0+3GvFIpWy34xV8awJaIDtUskie9fiI=;
 b=iNamGWrUCw4KOLlNB9QCY6xOzNAsNZykf1w2pSGfFSYF8MQ/+jAP/X1k390hV3i9e3pl3ZasdHhWcCKLnY5yeWEN4HqpcsOtil5p/hA5/98R2V1/RJ67CeJzaB+6QUPPQYubgvL833lTQHYENxWNWi2KVgq0/2ENZaG6GtHjgs4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:09:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:09:53 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pyzmq: Upgrade 21.0.1 -> 21.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
 <20210127155538.12229-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <04cd987d-6d5c-e727-9b48-f2ca1f2dc3c9@windriver.com>
Date: Thu, 28 Jan 2021 08:09:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210127155538.12229-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0102.namprd13.prod.outlook.com (2603:10b6:208:2b9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 13:09:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d74cea4-3d27-4f07-b45b-08d8c38e001c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295121CD4C230F30CAB1BCE39FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rya6jiCZSJcj/8GnVhpUnIXUK3WKvpFduZqH5WDWzF9Xv9dv5BPJBEh9c3daH3yl+tZdA2394c4FVzwmbfkx9RCdFe/DipsPNhoGDTQyv7Bop8sPDQplmRn4c4xbiMBfuI1IeUcx6vpOR0C43lrZynRQ38z1krmPNLUrHvbis/edGI84oLXWYPZnYo8I3+qPGOm3u7lSFzb1wtH9FvZkKDJIIRkWWAEKBxZu9SzUGDJmBFCL9x9or5a5YjSaiL4esLXxeghXYDdrwGmF9beJRazBPccgzCN5Zorg1LCpkMC7KH/KPooA6820TSG8X+dlCg0+DnmPOyzS71KLCJ3PwoliQLdbgsY+jI+mKRULqAgOQa/ClpH33YCDu505GMZQ2yudSaykktQVgixcrW+/KHXQRmMFLwHPhFfZEPAfQHiks2awJbH0aVkZ4S478rmkRjlbMOr46r9zCraS4sF+vSbGKgKqHbTS9u2krO1LPwsDoqVdg1klpO2VhqubKEsRSgWhpoKeogqPf4iKXbh2s3M1jHmgPpAuMYxbAeoFTyElMLN40X6LOe5AkTRH9b3Oo38uysUm2FCgkINevg5/A4Uytdy5MHSx+Jm7i8vNTOXLpAzDZJ4FyM69UeaRKVwKSEQLXqBYTmHD4iFCBkkDnPRrRbgvJfGhfYxaJ6EIpNDQP756tWdRb6v7fwYjLYvT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WTI1VkduZFQxa3pHVFpIcXFNc2FBNWpwT3Q3aXFsdzhlMHZ0OC85aTJlNkVj?=
 =?utf-8?B?R1ZGRm9PbzgrQll2dklMei9HUjlma2prVWJhYzZGZktjdmlvZEpQVGNwWVpk?=
 =?utf-8?B?SkhqSkUrOS9SVkE1K3RqWmsvNHp0dlFXdVg5eTluZkdVVjl3anU4TzMxWTBa?=
 =?utf-8?B?bnduM2VXSzYwb2Z4cmF3ZC8ycFVtNElaREtnY21makpOd1VRY0wvMU5IcmxX?=
 =?utf-8?B?UVc0MUpQR1JKZnZJazVKbVYrcUxLVFVhZnozNzlQZXgyaDBPZlBobFYvVFBW?=
 =?utf-8?B?d1dVaVJYU25EM1ZZK0NPdnlxSnpWRW44Q2psZzJNd0xNT2xJSVM5K1JNWTFP?=
 =?utf-8?B?TzUvWTlzdzlNK1g5RG4rWTJJbHVIajJUSThtY015WFp5WEgwdkF4dGV2N3JO?=
 =?utf-8?B?OEtwRnVJeXZEaS9LSjU5STZpVTcyczNya1YzdzFNTm9zZktkN043OXJjaXNJ?=
 =?utf-8?B?clptYzlyenJxeThIZUF2M1ZrOEFvbFFUNndEcmFPVFgwRFBxYnFaN21Sc3RB?=
 =?utf-8?B?eDVPVGE2ZU9LUGF6azQ3ejhjRERpRmVqbzFRcnpvT282VndjTzU3M2RkNHZX?=
 =?utf-8?B?aWJOdHlsRlB2UVM4ZklZeHB3Vk5uR0ZtMUFFY0RJN0xIS3UvSDV5Z0hpUG9M?=
 =?utf-8?B?ay9SbkQyaWJUVFB1RVpuUE83WmNPeEt4dEpiU3RkZzA0UHNuNUJJTStEclZr?=
 =?utf-8?B?a2ZVZXVaSFBvaU9zNGJEbUtybVk4OTkyOXExNkVDMkI2SzFsUGJ1cjRNc2lw?=
 =?utf-8?B?SjdzeVBwNVpjbERkc1BLRmRZTlUwRHo4STVYczlrWTYyS2tiTHpIaE5MdHlM?=
 =?utf-8?B?MzJrdThkbnljVysvdlAzZlIrQXFCbGdVNjBlVXBCdW81UW5kRmY3bldZaWI4?=
 =?utf-8?B?NmZYR0pYR3dQQ0wra3dXZEV4dG45WWNSYnVLdk83ZG9Qa1Z1S0NmcG5DZ1hF?=
 =?utf-8?B?Um5LMVNQZGNQVElXT29RR2xOS25zTUUxbWZZNEVYTE1hQlJhTkhJb0Rsd0g1?=
 =?utf-8?B?WDBwV2NWaER5RUpnNDZEWXlnMWVyMWcxVng4ZzhIYTBvZHZ0SW1Cbnl4U2c2?=
 =?utf-8?B?c1A3MW5lTHJ3Qkw0S3pKL1ZPbXV6TFV3NnVPNjd1RGFoeEdsalFJeUR4WStX?=
 =?utf-8?B?VkJyQ21nRGVlaUFnZlVST0ZCeTRyVnVBRStXRWxXMGlNNHhveDJoV3VWcDVX?=
 =?utf-8?B?eHBvY3ZBMEtnKzYyVW0wa2dFejNSRUE5TUFLV1VWOERCWnRLL250N3ZqU2NE?=
 =?utf-8?B?T2pBZUpaL3pJcytzbjhtYjdLWWZGUFg5bXZpTlM0TnFnMjkwVStVMGJ1Y1N6?=
 =?utf-8?B?ZGU4VFRNMlBPQmhDSEN0U3RzbFFLTVhOa0tyVi9rSUxLSnJRUFZZWTFOaEFi?=
 =?utf-8?B?a0IzVXpBOUttaGlraWpNTmRwQXVzdXJVSHdxN0dSeVpwRU5MclljU2YwMnU5?=
 =?utf-8?Q?fGX0L1Bj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d74cea4-3d27-4f07-b45b-08d8c38e001c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:09:52.8738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKbZteVZE+7Yezmw+CWFmeJLCvm/C48bBPln5QGY3EyOEBPZ7IctQWuD2OxFZTdtei0Qrc4dIRfmFZaM78J9jd4ZVJJayuVsxxR+mutjayE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------C2199DE7D91B0F3817F4B12F"
Content-Language: en-US

--------------C2199DE7D91B0F3817F4B12F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-27 10:55 a.m., Leon Anavi wrote:
> - Fix wheels on macOS older than 10.15 (sets
>    MACOSX_DEPLOYMENT_TARGET to 10.9, matching wheel ABI tag).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pyzmq_21.0.1.bb => python3-pyzmq_21.0.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_21.0.1.bb => python3-pyzmq_21.0.2.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
> index d6b741460..8bde98247 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
> @@ -8,7 +8,7 @@ DEPENDS = "zeromq"
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
>   
>   SRC_URI += "file://club-rpath-out.patch"
> -SRC_URI[sha256sum] = "c3a630dd7716e8e127d43b22598e256a2d11a847b8cc3310350528960037fa06"
> +SRC_URI[sha256sum] = "098c13c6198913c2a0690235fa74d2e49161755f66b663beaec89651554cc79c"
>   
>   inherit pypi pkgconfig setuptools3
>   
>
> 
>

--------------C2199DE7D91B0F3817F4B12F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-27 10:55 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210127155538.12229-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix wheels on macOS older than 10.15 (sets
  MACOSX_DEPLOYMENT_TARGET to 10.9, matching wheel ABI tag).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210127155538.12229-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pyzmq_21.0.1.bb =&gt; python3-pyzmq_21.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_21.0.1.bb =&gt; python3-pyzmq_21.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
index d6b741460..8bde98247 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
@@ -8,7 +8,7 @@ DEPENDS = &quot;zeromq&quot;
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pyzmq:&quot;
 
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://club-rpath-out.patch">&quot;file://club-rpath-out.patch&quot;</a>
-SRC_URI[sha256sum] = &quot;c3a630dd7716e8e127d43b22598e256a2d11a847b8cc3310350528960037fa06&quot;
+SRC_URI[sha256sum] = &quot;098c13c6198913c2a0690235fa74d2e49161755f66b663beaec89651554cc79c&quot;
 
 inherit pypi pkgconfig setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C2199DE7D91B0F3817F4B12F--

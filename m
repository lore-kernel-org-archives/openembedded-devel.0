Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.82])
 by mx.groups.io with SMTP id smtpd.web12.233.1615993239707879479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 08:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gAmS4reJ;
 spf=pass (domain: windriver.com, ip: 40.107.220.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMDC2727PntICP3U8Ty+97cTzrTjlpkZZ6OcTvJI6ae//9JjacYhUq1ROqZbBb7hMchcDY8fjMBI/k58Q4LkE0vRov+ynpouwnI881xziLTjCre5X214v3HlQRbX0Ksjt7+XgmoZanr0TQdgKGjf+zsjeFkny6brOhA0zH28rUm7ddA4rQaeZIzHbr+iUAbmVATSmJsI0Ws8P2LQriZ1tgolu4pdfgKT3Xbgv/JURn78/3Ep7K/LxQoM+hjXOHsi5/j4ex6T7YfswRndmvMZxsLcE1JM8nmiVw0WH6GKWll3Lm58f/9RMMDfNXX6baEotvFogwDvbHh23E1IhcOVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mutDnU7eLUUL5hdCHLTyvTsD25pMkfP4Ji0K2+58F9M=;
 b=HE4GpOT14cUdrSM3lC7ZQnq7QogeOIY0d9de+04qNAJFVSEfclGTkbxgW2p73I19gi9sejw9ZmCC8drOVj8VGF+W/QulMssio5r9PlTBzbZNqCiof8I+JUcjUIu0A7zdcZjFX2icrCk0QZz2LGi0TWx3f8lnvbkth1SNVzXqg5z0xBs1GyaOKakxy6LeHHNSWU1RwS9agwkIFEWSfVrJLWCX9DdE8fJHZpctor8NDVW4KtYLuMU9OC1RZOhN76hBia5yQVI4F6O58B7oXYholwPXh66R6qn+HV/nu93fPfM1gCEnyU9wXgE78e1sMKFpHpabBws21/J7tcJ7yRv0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mutDnU7eLUUL5hdCHLTyvTsD25pMkfP4Ji0K2+58F9M=;
 b=gAmS4reJhbq0Bde9aBOND+BzGiK8vsncFGrK1tRO22rEG/b4s7rkxeaC1o+eiUhw2GVInp7u9Zl4dW7aNKDZ3oO5RsoORp3JpXa7CVNpnGtZ63+zPAde7OHst6Is6h1PC38QOfYSiV460XgAtMRbCzQQlwV+iaHx0kDTeBaeFWE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 15:00:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:00:36 +0000
Subject: Re: [oe] [meta-python][PATCH 4/6] python3-twine: Upgrade 3.3.0 -> 3.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
 <20210316083744.17558-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f2c8cd65-1a1a-6adf-ed4b-380428c12fd6@windriver.com>
Date: Wed, 17 Mar 2021 11:00:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316083744.17558-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN1PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:408:e3::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN1PR14CA0024.namprd14.prod.outlook.com (2603:10b6:408:e3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:00:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2860b95c-32cd-4f3a-5501-08d8e9556bca
X-MS-TrafficTypeDiagnostic: BYAPR11MB3253:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32538A0F214B6E07651449029F6A9@BYAPR11MB3253.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X1DcZ9VGUCqN08k4MhD1IC34yLpuiV4rwD6Dnpa+LEpurIMhRu8sXbizrCJvmBL5VOKerzx/Q6THdCGMr2Qo7ZS8OZzwHKi9oD2DRYRFGMhfoPXJ1C+TaV2JzwvLN4Ow5kvGQYb9bO+/Wg+aatVxUMuD6Rg7Ak2hG9exCGs5RVuNxJQFd4offhbDkNVq6GsYTjgxlOuCuYyzDYeC23INKTVOpST9Yl8C+7OE5fq+lemlbv6pBuz7S7ZotPsl2mB+wBV3fTwcDkCZdbeqYPilptv4g6dLtmEOsOR0f5n1XNmov7M5zXevlKDyowWNiQRjPT5mHb30sGWUOUa3RVTm/NLHcMwCKzQO42zoqCc0gEHM+mllcyXLLj6qUlSANThb4G46Q3pKGadLDxJ8ETJD95BD8D9PT204ScxAixJWNl8kCOxKyv3IAuO1zAwWUmfi79JTZSXLZan299GVz5hPRU/AvRjCZ/jtyhorO6O05muJQS1Dho8P6+ZfM7kZcD0K/SLUUfTOF4tZuavx/4z4kYFusW5CT/jMVhYyIAeVxY+tE9fROpZVmj8Z0JzZivh7BsOigRg7GE15G52LZYVwr6YYV3g5QvUZih5ptcmBjhxP+1TgMJxYlWkyJasHZlAJp06FBTPTMcMyDJFE0lRLg+eHLwHG7U4UYmheWmwstozgwTZF8+ghjTLBm9jpcoW19dAfqirPMqey1tcz25WxdxC7Ul0W1+rkcOq8CVyNBTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(6486002)(956004)(86362001)(44832011)(2616005)(186003)(16526019)(26005)(36756003)(966005)(478600001)(31696002)(53546011)(33964004)(66556008)(66476007)(5660300002)(66946007)(8936002)(166002)(31686004)(8676002)(2906002)(83380400001)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?N3JKTG5LV1I4ZThhRmdrNVFOMCtMTUNvZmVqM3VaZnE1RnNtRmgxMDNaeDYy?=
 =?utf-8?B?MDh6aTJqU0RrcnAvVDJxNUl1YlMzcXlOaGZqNkJhTmxzMUl6dlZuajczRVhG?=
 =?utf-8?B?MUE3bVR1M01PdWFRWUJRSGl2VVl2TFc5WlNuZGRFaThLOE1Lc1Vnd1krYm85?=
 =?utf-8?B?cHo5V3orQ2hBcU0rTnVTcmVMbGoySWFGWkFtTlg0UlFqc0xqWHlaYS9JMXVp?=
 =?utf-8?B?ZG81V1RrOHJrRHEzbzcxUmY2K3hwUlppbWFKcWd3Z2lpL1F4Q3dWeU50UnJm?=
 =?utf-8?B?c1dxT1ZUQklrK0xaQkNqTXRJUG4xNWlHVXFwMklERmI5c2RiVFZGQUwzMFAv?=
 =?utf-8?B?RGpzQ1J1VUt2NTkzL0dBOW1tZUMycHhMQzMwNlF2ZzVZRkFUVitURFdFMmgr?=
 =?utf-8?B?VHMrQUJScS84bE9HWG5iNlpJNWp5cDRhWnhpVzl3dXk0UzMzZkt0OENxV0dM?=
 =?utf-8?B?UWRIaUJoN1FmWm93MHBMb3ZWMEtoTUwrOFFpNVhrZllidG1QcFIrNW95ZWlm?=
 =?utf-8?B?ZzVkVTlOa3RtazUvaEdTcndDN3ZLY29uV2QwN2QwWC8yWkNJYkE3dUV3RXZR?=
 =?utf-8?B?L3ZxNDBzQ3pXUStWK1BCRjQwQUpMNFJ3WmdxeUl3Q3U2K1FhaTZPOUtaakpS?=
 =?utf-8?B?azFONEtBTmU5ajlxazQzMVVLNTJQaHhVS1dmUFU3R1NPSDlhYjNnSllQTUxF?=
 =?utf-8?B?bCtIRUxoSTZKY0tnTlloQjFzdWJBa2VwNHg5WUptWlhYU3pmbVlZTGtsM1Rj?=
 =?utf-8?B?RkpYNFVYNTduZGVWYnU0Qkh3WUtMY3JmV25DZGNJZWVIY1c1aUtpVTlKWFB2?=
 =?utf-8?B?OFVDOWx6bGMzUTBSYzQ5WGVqZjhvdFdha0lrdG81WUx0a2VDUEVmcGlxUzZM?=
 =?utf-8?B?L1NDTDhJL3dJeGVjMjlPM2ZiNHZwbkFNeWNiSkQybHZFSW1KbFRIdnorNlFH?=
 =?utf-8?B?ditMVVMrVEFEcFpHTXRISW1yTTJ4d2x1RVIxU2t0Yjd2Y3BnQU9PbmRaUzRV?=
 =?utf-8?B?WHpIc2dDamR4UVRDRTdaZFc3SC9Tc3ROOXhlc3NNaGtVU25hVkVDaXcvNDJB?=
 =?utf-8?B?WG8xVTBYYjRyL25hQVUwRWQ5d0xTK09pSXRlV0RDYzBtS2tNMUZHaUVTSm9l?=
 =?utf-8?B?N0RkcGRqdVZwcTVkNlRhV3hRME9UMm03NXR5T1czdFJlYUVKVHZXVGFEa2NZ?=
 =?utf-8?B?WFdiVzFqMHdUbzB3bmRSS1FjcUNZSVp2TG9ubUlPWnJPQkM1ME9UZXJCMXpr?=
 =?utf-8?B?Z21oTk1kTnlxTVN2MEwzanBuQXBkcjFhWTFlQ0Y2MUxBS1Z5RUVOc3ptNUJr?=
 =?utf-8?B?ZG05TGI5Z05sSlMvRXgwOGJCbjFwL3RpbnVxcURid29DYlU2TGUveC9WM3U5?=
 =?utf-8?B?eDY1U09HUURCbFpFZU1iTE9FUy94eFprODlsVFZuenJidkRGY2hJZGR3NVhW?=
 =?utf-8?B?NThOdzRBK2V1dCtOSC9XQTVINWJyY0RrYk96MG9KZ1g5Um1KN2ZmQ3Jjc0lw?=
 =?utf-8?B?Um9abXhzcG4wMnFMN2dNQXg5WVkxWlNkaVBjay9saVh2ZUZYNjEyMHNWVG43?=
 =?utf-8?B?ZjdxRENmR2VvOXFCdlErQm5GTm1qdHUvTE5tcldzK2VPZk9McFZrWk5ERGYy?=
 =?utf-8?B?QjRpTjB3ditvYUN1dFNZN2RISVUzSk9DcE9vMGZEODcwbmVTN2t4ZThyV3Uy?=
 =?utf-8?B?UUZYRXRIaVJMS0dBQ3hGajdaYVdKOGQyMkFvZk01SzhiSlQwVmFwd0dFVHg0?=
 =?utf-8?Q?maP6zGBtC1A4dRy2PWD+s0ujA6wouP9kk1nuYkf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2860b95c-32cd-4f3a-5501-08d8e9556bca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:00:36.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZWIGJdksBVEyltf9GjfzZtuojCAMlbsEeFfF92lQa67zUQOR/Q+wo/JAcG5TE61BmmajIGvD+rcMPLRUtecFN/ndcmOXkuUtQA4y83jozk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
Content-Type: multipart/alternative;
 boundary="------------435A4CFAC6A874C67089CAA6"
Content-Language: en-US

--------------435A4CFAC6A874C67089CAA6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-16 4:37 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.4.0:
>
> - Prefer importlib.metadata for entry point handling
> - Rely on importlib_metadata 3.6 for nicer entry point processing
> - Eliminated dependency on Setuptools/pkg_resources and replaced
>    with packaging and importlib_metadata
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-twine_3.3.0.bb => python3-twine_3.4.0.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-twine_3.3.0.bb => python3-twine_3.4.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
> index 0bc199992..2cbf16876 100644
> --- a/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
>
> -SRC_URI[sha256sum] = "fcffa8fc37e8083a5be0728371f299598870ee1eccc94e9a25cef7b1dcfa8297"
> +SRC_URI[sha256sum] = "101f1c43ea4587ab19261d09157c63b6f37a0e55b215f0dd26304df1d49b620c"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------435A4CFAC6A874C67089CAA6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-16 4:37 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210316083744.17558-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.4.0:

- Prefer importlib.metadata for entry point handling
- Rely on importlib_metadata 3.6 for nicer entry point processing
- Eliminated dependency on Setuptools/pkg_resources and replaced
  with packaging and importlib_metadata

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210316083744.17558-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-twine_3.3.0.bb =&gt; python3-twine_3.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.3.0.bb =&gt; python3-twine_3.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
index 0bc199992..2cbf16876 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://twine.readthedocs.io/">&quot;https://twine.readthedocs.io/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c">&quot;file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c&quot;</a>

-SRC_URI[sha256sum] = &quot;fcffa8fc37e8083a5be0728371f299598870ee1eccc94e9a25cef7b1dcfa8297&quot;
+SRC_URI[sha256sum] = &quot;101f1c43ea4587ab19261d09157c63b6f37a0e55b215f0dd26304df1d49b620c&quot;

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

--------------435A4CFAC6A874C67089CAA6--

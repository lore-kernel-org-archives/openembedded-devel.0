Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.81])
 by mx.groups.io with SMTP id smtpd.web10.11184.1610468004702047029
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QCPnfF4M;
 spf=pass (domain: windriver.com, ip: 40.107.243.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8qEfl1nItvIUX0DkSCy+TIfikIlu+0Ziur1+rRzm2NQo2bmgYeUKo+mTOEadHAyEeaNAQCo0yZWWeYg2qekodZPJot4aRyk1jd80uPoCbpTnpJkY3KJ+NXqvI1dnBM2fawdUg1Tv+S3hMVi8j30IHZMpeOiwaNfFeCiwWzzG1zlsT/pECH5oi97Mcod00T/l2/EnOX9X0X9fpWdIfZdKcdgjA/3H8RtwYE7oaGCUIWypWMe+0f7SOOmM9yG1GJN2W0dPnPzSpGfNPEBHlR583YqK35cugOO23mwMCoTixCPwDBvPKBLeeJEJ85I5QH6YjwTmMdqdWHUUlZ82oPWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9TIlFr88o2uTpL/9xjn4GGNFvMbhRwxs1O98Eg19h0=;
 b=gdN8BK3pQvwP+0fQat2TCGrQ10FqBSfdEkSL9AAdfBi8TQWADEUwNjPY8uzWaaCALH0w2qfWBG0ju/KsxVZf59AM6m3SW7lQYm6v60zZUFk4CXLgka65jSRhuYSNt3hwBxWSlEaaz8FT9VhkWorjLaE8kkK6MvqBVfnoA9KBfhoHBKw903yJpEPQW41p3ZU+UXtnjpisM3IAEMwZ4NNckh8JoQUq24xMTiBd07WaiPESpotkbt8bp1F/urgDg/3IOlt/qQ4Ye4C5v03VMfx884L4qT/oTqGLv0Rs+0nuP474L4kHF9YjYs5jMwaPzoXbwadn1yBTY6nk88DXb3IdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9TIlFr88o2uTpL/9xjn4GGNFvMbhRwxs1O98Eg19h0=;
 b=QCPnfF4MtoDp8y7wEh1DUZ0j/KxzD6LfTiMpzlzs38ZiSIZreCDFn87FFmUs8I4BZeadkjHvm0Aok/vv77lNhpbVTq1IZ3p+yImnWBPI5R9VQtFFuoy4UYjleti/803ItY+dmeVBLy7eQPKHfGyOT+pg5ThbELAOnv3f8SRziKk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:13:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:13:23 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-pychromecast: Upgrade 7.7.1 -> 7.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2ad1908c-2a54-d201-f1d0-d4a7163575eb@windriver.com>
Date: Tue, 12 Jan 2021 11:13:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:208:fc::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR02CA0036.namprd02.prod.outlook.com (2603:10b6:208:fc::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 16:13:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aaab2ff-27d3-45e9-5612-08d8b714fc92
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807164F8FBE014CB2626D889FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ftsp1MbnqY07lvKgp+8yRh26zTN1vAQ4WOCkL+ZXkxHHAZP0nL+jd4wJTheUbuHKhwaddGH2MCmuFY+Sz+Df0nSF1z7sAfpTduojggdyKC15IAnZ0vWeF55LxeoB5Tg2ro80ZTBBrLyFjaUeWfCr6D4MRsodc5fr8Z/LWYQH9WS6MqW87OVMNXVKKchS93+FyPY0T8yECDdxbUVwpYEZBXuRKzhBgSZnUj+Mh3P2zhboElJIloyGQRYTevVfMDp6163YK4D0kYvhKqpn0B2QiukDmvwfZfgyk0t2Ti59uhm+sg3OBHYEVe6mbEFq/tXr3ldrdRF4CzUblkbouYQZhKgAV8wMXpKKL8RF3Y7N8HUapzmrL73DcJjavaly6B7qF26GxcVO2JgvRgk4uvrIhwVLAzryVmeaka2xTmDBTr9XiV+rreo0ifbO2qRpvmZTnahDQReQAnOXJUX4BUZOjEkdHa+nOSIf7BRzHXeQcuHI+/zxHPeodlTwdH1Y9ULxVC3kU3U6Y7R8uN1InSQ7DpeA2ziDM0KeA13NaRpI5wLLpMNYx67/G+mzTsSeic7e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(966005)(2616005)(8676002)(6486002)(66556008)(316002)(16576012)(186003)(52116002)(956004)(8936002)(2906002)(26005)(44832011)(5660300002)(31686004)(86362001)(31696002)(166002)(66946007)(83380400001)(16526019)(36756003)(53546011)(66476007)(33964004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VWpIZHlxcm5WcDJKd1M3cUM1RVcwbFoxeDBYSGdRelE4b245QzYzZy91eEJK?=
 =?utf-8?B?SmVjNy9Vem1CU0pHemxQNk1ab0lER1pXNzh0RXRtWjFkYTFWcld4YWtsRDhW?=
 =?utf-8?B?TUYvMXA3d2xDck1WbjMrODVQbVZCV1AzT2dnOTZaN1ViSlNEa2pTeDZHQVBQ?=
 =?utf-8?B?N0prb0lVRWpoRXNHTTUwWks3RDN6eVZDK0g4RzBOTXZScXZDRzI5UXNvck83?=
 =?utf-8?B?c0Q4YnY3RkZlNmUwbUJ2L0tzK0o3THJlZ2N5blErK1VMOWN3YkhkNHRnc0xl?=
 =?utf-8?B?UDhUQjNQclVXUDA2VGVSdEh3Nml1dER5ZGVBRmZrem1ZZExJREdPTnpDamd2?=
 =?utf-8?B?eDBPeXVCYzgrNWZHQXZkZ29XSzRlR3NXNUVxRFBlUkJ4NlR3SElpWXNuSmpj?=
 =?utf-8?B?UDEwRDNadFVoaWtVdnBJUzJoanpQTkJncldhanZEMm1nNUhKM25LSTZva0g3?=
 =?utf-8?B?RHBQdG1UM2d5aXJrOFRVV0QzeFk1WXZEd2xQcnhrdlNlQmhvc3RDMXZrdnpu?=
 =?utf-8?B?K0JjOGZkVk5WbS96R0tuSVVVOXB1UzlwMGhpTi9Xb3RZSUZGdGJJZzJOYzdv?=
 =?utf-8?B?dFpHbEFka2FTRTV3WHlWZHYvcFVwZ1Z6c3dPbWRBRWJUT0M0MXJKMGdDUkox?=
 =?utf-8?B?SWZFWHFqdVVOSDYwYlV4TEtyOWtMWnpZcXd2WmVDU3JBb1JJaEV1TTc2Skpk?=
 =?utf-8?B?VnF0ZERVMHVlMFlhZG1WamV4U3lQeFUzbEJLeDc1aks5c1YvSjRha3BGbnNW?=
 =?utf-8?B?Tm93NVovS0hkNEVudGFNZHRpNjF3S0FKZlQvUzZXaDZFUDlrRVErY1plblV0?=
 =?utf-8?B?ZEYxdmJWcERIZXg1ak9BWkRHZHU2TnV1VjlDMWRCNUxSVlZHei9OaHc3NVBi?=
 =?utf-8?B?ZjBsK1plYmVXdmJSbWtHSCtTKzBxaHlDeGp1dVJaWGU0a0VnMVpNUXc4MEhL?=
 =?utf-8?B?cU84WGFtNHA5RXRnY1NHNHlXOFYxRGVia3BYNFRLR0E5c2Mwa3pHMXpNVUVx?=
 =?utf-8?B?SjluaThGNUJZUHQ2S0lZR0IvM01KYUgyazZpd29MZmpJZEk1YnkvNmRxZ3V4?=
 =?utf-8?B?bHR0R1FOb1lheGN3eFZlczZiSnJjUkJQR0VRMUhLdHNSY0kvRTNxV1ZOTW9F?=
 =?utf-8?B?MVpjR2tNWHRGYlN4dkVCWXB0NkM0VUxMbU9HcnFPRFYzNUlRaGM1K1dod3Ew?=
 =?utf-8?B?WVdyeWhZbnZ4dVNyVE9sZUtHTWVhTlJyVEtRNi9iNld3UC9GUFkwVXMxM2x0?=
 =?utf-8?B?ZUk2SkEvZjgvMEVKSk1NSitDU3dpNVFqeDZZaStkUkg5ODNJRnFEWUNndjhI?=
 =?utf-8?Q?I6gAi6wjEiBFJTwQfWlCrDM+Ez+CsrrvVQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:13:23.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaab2ff-27d3-45e9-5612-08d8b714fc92
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DENwYcQ1asFie4UyGEG68z2BJ+0W8CiRW+4yxFDElXuQtsh1uPLDFvjZX2TjnEctW79OcU6okF2vJ2/VBEHCvoTRFMvmwjVRpmfdo5YhQtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------E6DBA684BFE888E887AD77E8"
Content-Language: en-US

--------------E6DBA684BFE888E887AD77E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Use urllib.request instead of requests
> - docs: fix simple typo, neeeded -> needed
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pychromecast_7.7.1.bb => python3-pychromecast_7.7.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.7.1.bb => python3-pychromecast_7.7.2.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
> index ca55740ba..c0ff58cfd 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[sha256sum] = "d6fd0382395303b3260ea7a89a850c8c9e5c83e7ce71a5fbd793bb157cf8ad26"
> +SRC_URI[sha256sum] = "aad4b145cb8c76b629c700877e49c418810aaabb26ace5035c49940f9657f2f0"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 
>

--------------E6DBA684BFE888E887AD77E8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Use urllib.request instead of requests
- docs: fix simple typo, neeeded -&gt; needed

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pychromecast_7.7.1.bb =&gt; python3-pychromecast_7.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.7.1.bb =&gt; python3-pychromecast_7.7.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
index ca55740ba..c0ff58cfd 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[sha256sum] = &quot;d6fd0382395303b3260ea7a89a850c8c9e5c83e7ce71a5fbd793bb157cf8ad26&quot;
+SRC_URI[sha256sum] = &quot;aad4b145cb8c76b629c700877e49c418810aaabb26ace5035c49940f9657f2f0&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E6DBA684BFE888E887AD77E8--

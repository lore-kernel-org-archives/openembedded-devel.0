Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.46])
 by mx.groups.io with SMTP id smtpd.web11.32.1612303819771447904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 14:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Td9EiCB8;
 spf=pass (domain: windriver.com, ip: 40.107.93.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdalt5W81rNQQY502/032aQJAsZjO2cqj1Fy8Un8Zg7WBWGtDxTAg2wTVM1W5hIsWWrAyb6QWEvWCWxYBEkcMkvQhRs4ZD4hlQt3G5D1cbcmcTI0wTkcFec6WuoSe4PdPeYc3hxr8PIxwoDFiKd7daPR411fjJtuat2v6BzrKfUBejYzdrLdbGtkQAl1wrJgdcMVFxNp5URJLma2zgfH5O4wBhiqNPt3vonHg7gIf9XoUlkzB7WNHCcIzb+BbKKXN6SL1TVA3yuJuMlF+wEBvSsfpWoKRg+CCWe24dgwa4M46247zI+fNZxnW1oFi5EEbdOHRqHpH1bAdo0U53nH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90pO+HV5Rl4kmMpIr0C93ort2a6z2BtTRa88JMRHlFM=;
 b=DT4iwcykwFEJhwCNTxkvP5/sa2icn+CLfqKLvham2Nbbr0JXKSHB2stvjfJNC5DMlOnX+jHi9UBD5R6slUAbD6n+KVv0X8DQ3WevcxpRhVYcwMwv/Q/i/K9hHRz3oB5QOTLo2qoQl+EaL/SCapmCfFG37R2VA9jZuLD3x9l1AS75Z6lYFS2x6sAZaDj0KsiPnT9PaNIF7AB8hFeXeEXsjB8DuitRQmCNv0ZIqMKMR6Pm10MyrdQnGBrFxjylUaLr2UlQUUWOk+HiB+IBZ5AyE1kuthMuCJk/89ScYBhVJ0O61YFwyGSNZIAELX7oAsJEWV16VyFhNCNI5mRSPH5e1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90pO+HV5Rl4kmMpIr0C93ort2a6z2BtTRa88JMRHlFM=;
 b=Td9EiCB8yNzjEMBU5hnnTl7E2/GUOLsaUOrTDumNcRgO52zJ6YdIXXZrnCzF8hQMG9Bi9ZcE2Hav3tIsExcx8liKXdDDZ0i0EmTR6u97k+LidiL4SemwxhIGYMOQfFVwvWNtsxxqny7L+Hn2a67j1ZHVV9HE3oYiS0zMU7KwTtw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 22:10:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 22:10:18 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pychromecast: Upgrade 7.7.2 -> 8.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
 <20210201124516.30135-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <adab054a-548b-9b88-775c-dc255211e093@windriver.com>
Date: Tue, 2 Feb 2021 17:10:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201124516.30135-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0647.namprd03.prod.outlook.com
 (2603:10b6:408:13b::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0647.namprd03.prod.outlook.com (2603:10b6:408:13b::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Tue, 2 Feb 2021 22:10:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45ddeb0a-c3ca-46d3-e7a0-08d8c7c7535d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3448:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3448B874FDBAB9963123BDDA9FB59@BYAPR11MB3448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2eQ8Jy6IpY4TFQ1uyOrNj2jdGhNW5IHcmRnLlM9s/w+re6pG+R7iSl6qbXgx69ACoL764YKsvQkNHAxpvWNBKxmjQAx+1NjstgzH87ESzO2tfmoelXZynRDKHB2ma9QMR9VLQCCBMbIaPbtwFlvrZwhI4o1xEjIMxIGLb5zqOJvRyjSgz8qb2v0gyyq4vOWzxw/GXzQXzGLi8CDGbu+7bOmmUFdrhpppfk64F73YVEuq3+Ar42QwAqXVVYxO6wZGxDN2Nl+xMk9O5EL3sSVrB6/JOs3UTX2KU29A4BoGnSJSjgo5dIkgaHJ0QyRFHXbNlgOdwrqLCYltA16zBkj0oqHGgUCwpmxxMM5UdJK3rUc+4DVXo9SDg/Nl4sx4fGm4cFvvmIPxg1gryz5n0pk1F8dS2MfynvJj7hb8U4NVXBcUbPv7NeB/R+yjt4fNoZ4hQosbruFiPWgRegf68lFLDF5WnZ2UNsf/aSTBJ68AintHYlN+cE7jxo2u4Jppd5d3oYUNpPOzMbmeRXnKaHhoP/Dn6spCIJ5KVhatusRNTl9GtpGxc6RRj01SPATQNbZVOhscFcPNrMdUKHrlum3sWYdRs9+raycUvrY8as25ScpfIfGvafDeEdmv0Iseuz1sCX7vINqEJVKFMCFrEc0SncdkaWelcsuimIpLaIENRJcmM/Ppd7IR2a9UKPxW34zp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(66946007)(31696002)(186003)(86362001)(26005)(33964004)(8936002)(31686004)(8676002)(478600001)(52116002)(83380400001)(316002)(16526019)(966005)(5660300002)(956004)(2906002)(166002)(6486002)(2616005)(53546011)(16576012)(66556008)(66476007)(36756003)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eE10YzVMODNhTUQvclVISUxaNiszeU1zSlNIcnM2Y252Sk5EeFoxaGtEd0xL?=
 =?utf-8?B?VFBmUjNVblVCSk1ITDQ2NnBDV0l6anNMb0FpYlExS3p1c1FjSTYxQlE1aURo?=
 =?utf-8?B?SXd2Y2NzcUdWTlVQUVNyQktOT2FnbzJnRzdjSENZSEh0SmZiNWkyY1h1Y2Rm?=
 =?utf-8?B?aVBmU1kvcEt3UnJsYThMWTdmZVlNeFhpdGRRVzMzUHA1eHJRSU9OSU9jaUF6?=
 =?utf-8?B?WTFJMWpyTUhGeTI5bUxoclN5K3FxS1pCbGtVdlNmbTNEbHlGMDUzbjJ0WnVo?=
 =?utf-8?B?ZG44UG5EWWtXb0NwMk5peWFMazUzb0psRXltNWhiZE1ab3RNSW9wbkVsZGps?=
 =?utf-8?B?TW85MGRzcjNMUVlIaE02SW91UC9mLzVFdUtCR01UOFNVQjlnV3BCektOWGZN?=
 =?utf-8?B?SjNzNUxSQUNCdTlTYWxheEtVajB5NEdDM2o1OW8xTnlWTXI3VnJIRUNFY0pL?=
 =?utf-8?B?dlB1UkZJeUkvdUdSQ3JpSmFTTmpiWnhmdHlHY3d1ekhhdVFuc2ZzenB2RGFP?=
 =?utf-8?B?aUN6em5JTklXbFlkL2tGblJGVmxVVllsTFdZRVNXeFo0bktVNDFPZG4yTjND?=
 =?utf-8?B?YkRST3p2R2lUM3hKd3R5RzBiOWhobW10ZHBSclBHYnVUWXV0cjVwcHZlVG9s?=
 =?utf-8?B?NUtWbGlLY25ZRktSM2k4eDVZNTdGSW0vMkM2ZUcxQ1lISWtMbm93SGlMTmc0?=
 =?utf-8?B?R09oa3FlM2kwU1hQdGExemJSbElvRW1ialJQdXcvUDUwaWVmZmhFQUd1Njc2?=
 =?utf-8?B?TndHQ0FhZVgyaVA4dnN3V0srOGxSU0Y2eFo2aEdCRkNSYTJBUXV3Y2VmNmxG?=
 =?utf-8?B?Q2tQRzIvRHg5MEFEbWpBTUNUeHA1NVNIRitmOXU1SitOY3ZmRXc2Q2NmeEhY?=
 =?utf-8?B?KzNSd0JHQmFSR1lFcmovQWwwdllydStNSThYb3czYkFLSEU3anRuVnZSaytF?=
 =?utf-8?B?TXdCR0hSa3hkaDllRUJxU3BZNGsveW9tUlpCR3JsaWxlMFcyblJzQ3JBWWNX?=
 =?utf-8?B?c2dCMVJZaE9od0JtbDRaUXBJVjBMaFNFVjdlLzJ6elNSNDhTd3JCODRGRkZi?=
 =?utf-8?B?OTkxYlhTYUVFSC9KaldpSG1HcEZJdGFCc2FBcWozWDBYOGdxNzJPS3BmeWNB?=
 =?utf-8?B?RWVGdXZvWUcwbGFRMjJINHZjTUNQMkg4Qlg3TENaMDRtd2tYTTRUbHNsUFZ3?=
 =?utf-8?B?UEYvUnNBUXV3bTZ0eEZpYUhBTWdTck9WTElKeDhUeTZycXJDZ0JrY0IvSWNj?=
 =?utf-8?B?OEIyUytBeDVsMC9Jc2crVEFQK2VQajNUeEhvQ3Q4dG1pQ0xTWUxjSXdvYTZE?=
 =?utf-8?B?R2U3TDFnalRLZExUOHhicDVBQmdnd1cwaTM0U3dFZjdjK09PTFNVR1BtWmFs?=
 =?utf-8?B?QldYbGl4dDkrUTI5d2o3dFk5SWFTaXRyZnFPODZOZTVQeG01YWhWY3REdmZS?=
 =?utf-8?B?NFE0dU41NW16L2RZTFd6UDBxT0RJRHN4djRMc2VnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ddeb0a-c3ca-46d3-e7a0-08d8c7c7535d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 22:10:18.6196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6uGuelkoWUP0+i2yAJUp3LE9HhZKSQEKyW+xbc6QuIjkdvOl8pbunKFoRMH/YG3zbqauDbUcErKNQYSTyxiL8++ZlD6yrXIyZ4RGyJFkjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3448
Content-Type: multipart/alternative;
 boundary="------------8D444BB0BDC346B4F1B0EDE0"
Content-Language: en-US

--------------8D444BB0BDC346B4F1B0EDE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-01 7:45 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 8.0.0:
>
> - Infer contentType from playQueue items
> - Lint example scripts
> - Revert "Lint example scripts"
> - Lint example scripts
> - Bump pylint to 2.6.0
> - Remove unintended 'async' from listener interfaces
> - Update BubbleUPNP example
> - Refactor listeners and controllers as ABCs
> - Add more google devices to consts
> - Make current_time optional when loading or queing media
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pychromecast_7.7.2.bb => python3-pychromecast_8.0.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.7.2.bb => python3-pychromecast_8.0.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
> index c0ff58cfd..939db5768 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>
> -SRC_URI[sha256sum] = "aad4b145cb8c76b629c700877e49c418810aaabb26ace5035c49940f9657f2f0"
> +SRC_URI[sha256sum] = "21e9295b2e8088a7f19f82b22c7abcc07ab329914d647cc5dcac08790a7c9d36"
>
>   PYPI_PACKAGE = "PyChromecast"
>
> --
> 2.17.1
>
>
> 
>

--------------8D444BB0BDC346B4F1B0EDE0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-01 7:45 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210201124516.30135-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 8.0.0:

- Infer contentType from playQueue items
- Lint example scripts
- Revert &quot;Lint example scripts&quot;
- Lint example scripts
- Bump pylint to 2.6.0
- Remove unintended 'async' from listener interfaces
- Update BubbleUPNP example
- Refactor listeners and controllers as ABCs
- Add more google devices to consts
- Make current_time optional when loading or queing media

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210201124516.30135-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pychromecast_7.7.2.bb =&gt; python3-pychromecast_8.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.7.2.bb =&gt; python3-pychromecast_8.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
index c0ff58cfd..939db5768 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>

-SRC_URI[sha256sum] = &quot;aad4b145cb8c76b629c700877e49c418810aaabb26ace5035c49940f9657f2f0&quot;
+SRC_URI[sha256sum] = &quot;21e9295b2e8088a7f19f82b22c7abcc07ab329914d647cc5dcac08790a7c9d36&quot;

 PYPI_PACKAGE = &quot;PyChromecast&quot;

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

--------------8D444BB0BDC346B4F1B0EDE0--

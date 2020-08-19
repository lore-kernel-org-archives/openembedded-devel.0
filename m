Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.60])
 by mx.groups.io with SMTP id smtpd.web10.94359.1597860416409951844
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DhKqpJ8d;
 spf=pass (domain: windriver.com, ip: 40.107.94.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/irB/7qeduadWZaoauEhhA3mfWINcYtvDyeabHGKFiCgnqXp8Xcr0dV1ROicxF7f6Z9r4ZDnTOKnZCTrZYLl0mfgTEW4238L7HvlV7E8/tx8muRPpcnTHUZ7Ztctma1DNSn1l/i46WuvgmJwcxB2dFuPgFOxM33fhJNgZTLWJeokq3f9B/0IBmiW89uGcGUWeeNuV9i5hm8MfP8XDfwvVC7URwLGg/Nv4Lwmjf/CyPKIXtDy4EkLKG11jCZei3fZAaQIaB/EEQACUqZcKRAgrDOG0RQoVhO1nyUK5TI6nxVjWB9uTxJMhda77dC/ruz0MhSz9LcPAkFZ2SqCrSl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwcYadT0OcSmJdjoHGrqC67mC63O8W8XjXdDmpRBfKA=;
 b=dnrqD7kUHASEpb4HsirlgZrg0O0mYnzOXSrEHQsqvSifh+iCBieh1eRR7NY/3uj3nnq0IM2S/J8MufYU4MSW6EeayhHHJubDLgE2yGfRA0gmWhTkKmlCfHvk01V8HMimfsfPSlJElC8fxBvWu0eXvVonymwekZxsHEGMeZ0H5FAKiuNfSWHOrDJLcvtjfg3bMMv6UY2ovHWNBsKmpP/SYaZm8a1aH8QdseSNGWKQ7Bsho/M7Nxb2MBl/etNsPpA7QOeCWHfISxlfLjl6AYnhWa9nd3P8+HKsjRrS3JzZxr7q18TmwjAtNcnrAmDSamzpIqenfHWM+E/xpuuAbQnRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwcYadT0OcSmJdjoHGrqC67mC63O8W8XjXdDmpRBfKA=;
 b=DhKqpJ8dXXTOOSnosBBoR0kJAJfC3P52QdzoTBt+SNW6dMoF6bwdvTnHppsphVrbZD/8/IJevBBP6cEAmemKiepxBSaoVgD7twgjJIv6/9FN6leFlFyrAgspBtywSD5u1ScF8sWjCViJjBvzu9WIIqi4O9x4c7MnhO0+tvslo50=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB0073.namprd11.prod.outlook.com (2603:10b6:4:67::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.28; Wed, 19 Aug
 2020 18:06:52 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:06:52 +0000
Subject: Re: [oe] [meta-python][PATCH 4/6] python3-pytest-asyncio: Upgrade 0.12.0 -> 0.14.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
 <20200818153444.15728-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e09f85f3-d2b4-786f-9666-69a84c1798cd@windriver.com>
Date: Wed, 19 Aug 2020 14:06:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818153444.15728-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 18:06:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e64f8929-7d66-40f5-79eb-08d8446aa690
X-MS-TrafficTypeDiagnostic: DM5PR11MB0073:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0073DA787318D1C0B6D988509F5D0@DM5PR11MB0073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UPhg6vqPG9neHqHMquw90Qij2AqsmrqG0T8y4ve4qo+yVa6vcqbDtv/MxCZ2ui+uowg73s1zwmvePoJJohRESI3B3lGrP3H4z4tFyOloKxunM1t1V/51F9qyIcaWfqdTtnRnFllWYrFuD3N9v2rzgdDptVEELYt1y/HLZyFXNPybJ/xN+3TdR/ky4xcD8wmphGn5A9BjX8tvbG8PncyqeM/A6Y/2GcDDRZ2sbWLk0wSPBSDBul85PrRPADyHtmL5WavplbrIioWa2K4ioKc5TGtfKHwJ3/u3nOo39XhtWq7RdIZruKeryPy4c58+fkcmSQ98yUWw3QxD4DDPMudcBgPePcxUkqWSD+b+zFk2RSR/LanNCMxsLyeqya6mVw6sI2oI3IbLR2mZIXVT2pyh4ifhyCaeomH+gDIXutxtlIAXOqZJ4TiY9cYXspkFPilidfQlDoNo7NKzPfFFZVJShKgYv+hVgE3lk01sS0s658O24wiHLs5Q2OCDkK5ln9H2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(39850400004)(396003)(44832011)(36756003)(966005)(33964004)(6486002)(16576012)(186003)(5660300002)(110011004)(31696002)(478600001)(53546011)(2616005)(83380400001)(956004)(66476007)(26005)(66946007)(86362001)(8676002)(8936002)(6666004)(316002)(66556008)(166002)(2906002)(31686004)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2H9676q+/HJFryZBqJ2HDWR0nmQtuHXRRhh/WlDO+/nGzHtfB+kIYxItk2w+osbeBp4kq36XJV4kL1krUzVHMmMO9cE5V1igUcUjQxAARVXFgQbQLpLo877UZfGO0WTp+B8mOYYB1cfXeHVuwEw4L2xxdbca9jHaMEcQoMgzrW+ycxnzAd1qM/8S2r1kDg72h2aoR6Gwp1iQn4PCgDUBLYjzoxqyukfD2oPJEYIIXY45o1eZTWRsqZ9kvW63TcR7UCIt+N0UsV1zh7bHRH0+HewjLo1CxId/AfJ/SN7G0lddbeAoHaKfTTsJO2Ts0G6fJdE9q/WPAWN/t3zi0xh1U/6FPMl0ojXcAjL5gPKDk9vhd4W1rpbVLv5qG8GCc/HJsVlnXFPH2NSEZkLbn0X5ePSyD5k8zo0+FCQaacLpko8OA23xMybaMG5P+muxqdjxxKkt+J9BFIRgdhW9f+qu51BEuQmVbviSZ66uvL6ppXXoNU1p9X7+n7HSCrPYzwQFefLEYvApBCSJjNknNRlI4KF9ovVfxm+qp750OUiW/z7SPuhCgfKyDDHNeMBvqsrX1ERDB56sAEbSL23n4+MPwNumDnf5GDqio61V+RQMtmTF+bMuxtXzt1G/nJ/M9B38GKjQZ7qDE1bO/FxgYr/T1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64f8929-7d66-40f5-79eb-08d8446aa690
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:06:52.5882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttik69HdejjgHIzSFKZUvgm59ofxbvLXFoT6+YUhBDNV3yFBvrh5LlTQfV/2GTrbJ5tOdA8WmPR2nOaIWl+nnrcKrpC3mifziF1Pik2brrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Content-Type: multipart/alternative;
 boundary="------------920073F4193AA6C7073EEE23"
Content-Language: en-US

--------------920073F4193AA6C7073EEE23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/20 11:34 AM, Leon Anavi wrote:
> Upgrade to release 0.14.0:
>
> - event_loop fixture behavior now is coherent on all scopes.
>
> License-Update: Use file LICENSE to check the license.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...st-asyncio_0.12.0.bb => python3-pytest-asyncio_0.14.0.bb} | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.12.0.bb => python3-pytest-asyncio_0.14.0.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
> index d83c42de3..1e94c25f7 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
> @@ -1,9 +1,10 @@
>   DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
>   
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>   
> -SRC_URI[sha256sum] = "475bd2f3dc0bc11d2463656b3cbaafdbec5a47b47508ea0b329ee693040eebd2"
> +SRC_URI[md5sum] = "b63593bc08f445f6e3f14c34128a68ed"
> +SRC_URI[sha256sum] = "9882c0c6b24429449f5f969a5158b528f39bde47dc32e85b9f0403965017e700"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------920073F4193AA6C7073EEE23
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 11:34 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818153444.15728-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.14.0:

- event_loop fixture behavior now is coherent on all scopes.

License-Update: Use file LICENSE to check the license.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200818153444.15728-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...st-asyncio_0.12.0.bb =&gt; python3-pytest-asyncio_0.14.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.12.0.bb =&gt; python3-pytest-asyncio_0.14.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
index d83c42de3..1e94c25f7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = &quot;pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest&quot;
 
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75">&quot;file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314">&quot;file://LICENSE;md5=d2794c0df5b907fdace235a619d80314&quot;</a>
 
-SRC_URI[sha256sum] = &quot;475bd2f3dc0bc11d2463656b3cbaafdbec5a47b47508ea0b329ee693040eebd2&quot;
+SRC_URI[md5sum] = &quot;b63593bc08f445f6e3f14c34128a68ed&quot;
+SRC_URI[sha256sum] = &quot;9882c0c6b24429449f5f969a5158b528f39bde47dc32e85b9f0403965017e700&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------920073F4193AA6C7073EEE23--

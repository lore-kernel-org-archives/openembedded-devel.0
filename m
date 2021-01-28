Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.50])
 by mx.groups.io with SMTP id smtpd.web08.7732.1611839157455947217
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mdHwWfr+;
 spf=pass (domain: windriver.com, ip: 40.107.244.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4MhjGdcWhYGTcu2ilY0wprUYs8c0/389dj3ZOj/IDCDT9rWO4rWc8k+ifKKPuJf/kxjq9cZqdryHfG+bKkUvEmu1e84Zqqq+YdUgICFmZLwvl3BROwt6jVTgKKtl2aRkIszutKY/EJlk42F7HevhA7CWVCR529+mm29Xv2jKea+6UcURKCoGDoDyjN5ONnCRd8eO2LuG293eCCuK9hf5ZFv5V/LvObc40Sk2ccfW75G+J43F72qM9f56+juRox9u1FalNxub62gE4exSO4s3K1Or2qrbEn5lIVlp/6KnIYGJlrEAgVNGV1AjnHzANui5RhBMq7Q29lwf/gZxI/ADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRBCeUdCSCFCsgVMz65R734GgEbEHeRucVsG98RUfq4=;
 b=VbjAaojw/odd7yipAioENaQbBw7WC+3rzdSp4lfJlS77VGUI28zZrZVRls5tGeS6Vt5k47vadk9i2JC+e0NYEGiyhgtVV+96hoRMpG2dMZ1NpPQWjod0r9FbtGjWcMQo5Gg9+QC8J9fHw1WGKyZ95g5DOBCRf3vcrX494h6ySoXYS5HjyHCV0OMX5I1eJ2mllYqCfuvi/44TkydTtDUQJdFTIlWKOhmi5chJuN+EOHRqewyhWN1GGPwSW/nAMmk1M38UZV1qFkPDuZpI83aZH2x+nma0aWEwO1NZbh0kIpXI3vxrUP/5v2XOTg0P2E1eejnPiahiraOgjdL9OTv18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRBCeUdCSCFCsgVMz65R734GgEbEHeRucVsG98RUfq4=;
 b=mdHwWfr+eNNimAAcqS3bNawUeEXdD+qIghBiePGAh5hUb/8kPpYRHK9/0ss39kAEtqxwshpeaz+cvFr9EnYqyel8RRI6xppXGZGzktvaLXZqdJGqMngOTFC7UEnqUgiSjNQfubwGS+mrnKXuG3yXcxCxmozdV8ohsqlvGGDbJ/Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:05:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:05:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-natsort: Upgrade 7.1.0 -> 7.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6039cfab-f991-9430-6edd-df8cea63513a@windriver.com>
Date: Thu, 28 Jan 2021 08:05:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125152337.20937-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0053.prod.exchangelabs.com
 (2603:10b6:208:25::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0053.prod.exchangelabs.com (2603:10b6:208:25::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:05:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65cf5e2-55d7-45de-7aa6-08d8c38d71d5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29515654433C3705EB4003AE9FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+uqOjd18n/6LqgcFFguuo9dDnnQJ/nu5eCzF9jD8g8esEMMsaG7QOkYSREXbnpyBAO+ILPhT0XlUUPvB7QpwsNfyNTWhJ1Vu5Z9Gw1WUqHk/cMAcRNvsw8Etpk8wDXptaXD1xW8ua/cA1jAhtEcrJjdHdGmIblG9K6nPQdpx3RqXnKkfKZMlUc9VcmbHv9n8ObXWFYRDNwiLrzylF2jV7lfru7eYx01xwIXIBM+A/MkPpgec8O9TyDql8jUKSeePgZD1yiVwucoAfW8fOGfpfCxrn2X78oae0hYPuS7K5BD3LdHgJWqNzE5hg+SwTshi0qtLK8R2WHyGLSGQ4KtN+KOEF4+qyJzUvS0oNerzZJURfOjIvkQ2NT0x8RcJBIMyGF1umfsMAO/DfpAIXfnobV56PA/5M3C7GsybH+fwMjkXN3zws6nWHYAAf0DZeLzj4FjU7r2iy4yo2P0PooooGq0uL6Wecl8vUM7zfpOOGVHEDSKelAtpeagm1ZC6fKOfHKzZg8OiCdRZaZ2XZrOfTPsPAI0dDDzkCtY7iZwRDrZgoeVDfve2BgIHoY6NJAcwYdp3Jd/sAnXBljTDTd+If9v8dChv7Spx5NaubMcy+42ptxKplUquzgZnQKXv3wuH7Df+3Wnqiv3mrpfhpXnBHwFyvbQDhlvGDeOop1DKp2o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QnNaZDQvS2JsNlZERDIwNHU4QWFZdTVQU1BmWEJYNXA5VE9DWG5wbWx3NnJO?=
 =?utf-8?B?K2c0RER1NCtJY0h0aG5YSDN6aW01RG5jSXUzRUJlK2VKdGgxeXdzQTR5ekRl?=
 =?utf-8?B?VUZsYklJU0syWUlmYUlqVGFkM3UwcnJGREpMMUMxZXlIRjQrRTBrMFdWbjNV?=
 =?utf-8?B?aUhCYkpOZEpTTnhDVkVod29PMmZjZDdXQi9wV0lnMmt6YS9TY3RyN3c1UlBi?=
 =?utf-8?B?enhzWVZRUXJhdU5GZ3UwdDdzaWhhMVV3ckRHd1FYc3Q1VDhqbXpHL3N6SzMr?=
 =?utf-8?B?YnNBWlpacFRQVmxPeVluTHk5dlRBdFU4ZkcxTmxWSjhpeXNXTDV0bGxRYUtz?=
 =?utf-8?B?bnFnZTQvS25yemNzZlYxMXlWZFpMM3RqZXI5b2NrdHJ2eFBxTnNZVXg5MVcr?=
 =?utf-8?B?aUoxd0h4MmFvUGxod3RGTjRXb0pFd3ZGU2N4aVprK093bW5BY0c3Z2NjT0lw?=
 =?utf-8?B?cnRNcHJFbmtCekRPbjJ6R1NBRU5pYkJZZ3pGNjV4ckVPL3Ixc05meHM2dFhW?=
 =?utf-8?B?NjdLQ0w0MTJ6ZmRTOCtGc2plWXdHeG9Nc01OemxiZDg1YmhCdVJodHAva2sx?=
 =?utf-8?B?eVA2QXJ6dFM4WmY5R2ZsSmRaV1hvZW1RWElwSWJLN25KRVYrVTFOOGlWTUN2?=
 =?utf-8?B?eSt3R1RqRzZ0RHk2WXlrN3NZRml0Ry9nQ1V1dUs1ZTB5NTVtaTdqNDVldUV2?=
 =?utf-8?B?UlRnQ3phb2IyUGJIWTBWdXpENHNKR0tRMVQ2N2dHdEVhdDVqOE81MDA0WTgw?=
 =?utf-8?B?OEF2c2Z3c29YZVAvV21iZGJ6dTExVHBackVyeitOeGNEVmZqL3BucXI5YWs0?=
 =?utf-8?B?UENGVHUzUEowck1vV0tNSE5CMzNSMkVKVjNWOFlEUlZPaDVzU1NIVlFLcitW?=
 =?utf-8?B?MWYzUUF1MFovQ09vWEhORG9YQ0ZiK3p3eTlxM1BvT3FoZk1oeFNlSEdwc3pq?=
 =?utf-8?B?bFBvVngzckhuWWZsNHZTZ09WVzlHeG5nN25iMG1QSGVOWXUrWnJFeDhHYUxS?=
 =?utf-8?B?WW1PYkNhU1BvRDhiS09mVFU5RW9tRE5lMWZDeVZSOHZ5eitYaVJuTS9DaW5C?=
 =?utf-8?B?YUVjbUVyNCt6MWQ1cXY1TTRmUmEzZjQza1BidERoQmpvYUdHOHd1YVV1S0Fp?=
 =?utf-8?B?dzZ3emJvRkN2YzV6ZEVUOGc2SUIxQzNYcVpGK01Oa053RUFYb3JXOExJMjB4?=
 =?utf-8?B?UTAxM0Z2Qm9qelJuSU1SeCtNUW5lOUx1Uk1HaVpEYXZWRTNuQmNEcjVhbmlV?=
 =?utf-8?B?Wm1mMGIyczdpQmEwVE1BVDRTcWlEUHNGZlBFY05IeTBKdFlQR3BRU0MwSDlr?=
 =?utf-8?B?Skw0cmVtZ1VCNzdTM095Y1ROdS9OYUNrUVV5eUM1KzQ1eDZlNmlnRkl3NTBD?=
 =?utf-8?B?RW9CK1B0WmJEQm0xZzFBc1h4Z1lhZi9UY1lYWDVQSmp4OFBQczVsRjFpU0Nw?=
 =?utf-8?B?ZHdwU1FnUFBZRjV6RFZsbmt2ZnBJQWV1NHU5VjRBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65cf5e2-55d7-45de-7aa6-08d8c38d71d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:05:54.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxaYGT5jXA0YYSlnpFiJAsptD2HTpP/UKXYGq/Q/fPOiBTuPIepywU3l2EFvGG9POV75q77t2T7+rcFFGRBlwXu5L4RdQz0v2aznqvWQ5FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------5D9DE34770507C908E523CBB"
Content-Language: en-US

--------------5D9DE34770507C908E523CBB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 10:23 a.m., Leon Anavi wrote:
> - Use GitHub Actions instead of Travis-CI
> - No longer pin testing dependencies
> - Correct a minor typo
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-natsort_7.1.0.bb => python3-natsort_7.1.1.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-natsort_7.1.0.bb => python3-natsort_7.1.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb b/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
> index c890ae243..89df3dc38 100644
> --- a/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
>   
>   PYPI_PACKAGE = "natsort"
> -SRC_URI[sha256sum] = "33f3f1003e2af4b4df20908fe62aa029999d136b966463746942efbfc821add3"
> +SRC_URI[sha256sum] = "00c603a42365830c4722a2eb7663a25919551217ec09a243d3399fa8dd4ac403"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------5D9DE34770507C908E523CBB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 10:23 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125152337.20937-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Use GitHub Actions instead of Travis-CI
- No longer pin testing dependencies
- Correct a minor typo

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125152337.20937-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-natsort_7.1.0.bb =&gt; python3-natsort_7.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_7.1.0.bb =&gt; python3-natsort_7.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb b/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
index c890ae243..89df3dc38 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517">&quot;file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517&quot;</a>
 
 PYPI_PACKAGE = &quot;natsort&quot;
-SRC_URI[sha256sum] = &quot;33f3f1003e2af4b4df20908fe62aa029999d136b966463746942efbfc821add3&quot;
+SRC_URI[sha256sum] = &quot;00c603a42365830c4722a2eb7663a25919551217ec09a243d3399fa8dd4ac403&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5D9DE34770507C908E523CBB--

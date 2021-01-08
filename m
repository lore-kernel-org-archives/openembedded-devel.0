Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.50])
 by mx.groups.io with SMTP id smtpd.web11.1946.1610122073516345904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iRvY/q+m;
 spf=pass (domain: windriver.com, ip: 40.107.76.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdXLMBk6c/cXOpoeLTLN9v14x+Wl0F2mv4i6Eloltzbz5qP53gUqGWMJwIsoNNWmgKM7V8NTz30hFaASB8YKT1cVr73MUXGesyy+hIFMxK33/itqnwvacRQvQYppxGlQQr+oAjWtnXfNIxcfBOHZdj1vtAGBpV6eZCAOJUFy8sPnjD3W4KeyGS5CBmpvh4VY6wDjvn5rnEZEbC96eOD+ynGm0jJKE2gym0OTPk9iLJXkazGSMkviAMZgZArZo1Y0Dj904szg2VLmwrmiA22l0d512EtQfFou72ET/ru13PnIIwaVFISHjBN4neTTMI4XJ712nKdtS2QOw7CClisXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUsS4OGhmw8+FrhJu++F1Z+utdv3MZswhaZQzO6UApg=;
 b=XhJLDuytP0w0yqSUsnsk0a0JRZe+aGOkD5xKgdEUIsKU4MnBgnfST1vxkirXF2F5tIXFMKvD8kIYnyAZN2S+vIlqGs4yNqocej2EhVk5SmTb2OozhK32upoFP6Ot5rbq2BksGw0QVKeeBWjrB2KO6iuX5+bMM+oPiSPbgQjMDVGhECWEAju0HwV1pR/AnEYmo30Q3W77hOepVQS1iUvm9dXvs2eT1sPuy1zpDrPZrEefC+xoGe0CME8HPnYdHWxOYnWHzIPoI3oB98B9x+YUasrE+ktFPiKrEAmntVuEqQY1NWB256fNLhS6uYgIZlWYYpHWEAx+Scqx8nXGgD/ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUsS4OGhmw8+FrhJu++F1Z+utdv3MZswhaZQzO6UApg=;
 b=iRvY/q+mMgUTsuMcDNwaSfmViL/MlroF60vZgjikpkFwYeQ4dX6FmeT+WTZwgzX9tO2j23l79zZwWhYovi/rythcI7JQGS7UcB7N8yhcTfiIyDXKPswnBVRxV+/pkmSjNGkxhElFaUmRksDtq0DssJzJCYlLML6PVn3iynQAbLc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:07:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:07:52 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-sentry-sdk: Upgrade 0.19.1 -> 0.19.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9f412683-d763-aac7-655a-3aa3b619c1ef@windriver.com>
Date: Fri, 8 Jan 2021 11:07:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0052.prod.exchangelabs.com (2603:10b6:208:23f::21)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0052.prod.exchangelabs.com (2603:10b6:208:23f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d1d66c5-3afe-4e02-d5eb-08d8b3ef8d8a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41503FE76A513F8974300E029FAE0@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CfYy7G15imrbX6BE/pYRwGY4XhxZZcTe4n1ZgS7dWQb+V38Mxyk8T47K14I6rL9AD7j365+S1j2YwP88zgFhsp9s2CMeq4Lecc3d/PgeRxg7PJU/EdekbwjXyhkqmVeXzjAM2d9EuzoPwRSeGJYnybHaSXPmI3VpcvK78fnYTw/9LM8Ha+JObur60sGCz0uJsODFmiem/iyPK2K6Yp6JnBOXyvv/SPhdxQZ3DL9C5tNheECsWY+lOwKHy203BIwndv4+FpEQz7xHnmGR99GakI8dCvKg0n6A2q8Lph+j6P9KSiOK8dV3wCL0kFKhlKKNAWywvkdVmY7tQ9DJ/hIq29HiUn0gpdm8rp0JPRebV+VFMMMINsSNWMtIQNCgaVaYI59ehrXPAHutVNvHKc1teqNpCfj5O6lA0A8tE+844v6tZK19xPGuQzUDeItE9w0W0S3paPb53FSzN3ROjcEVbMfQV7r3THEsQGbiZGqxXaYgh6iBSJoB+mJjkzRFXNBxkoTKgIP4/WizigGySGkrXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(956004)(2616005)(66946007)(16526019)(66556008)(31686004)(44832011)(53546011)(66476007)(33964004)(31696002)(186003)(36756003)(83380400001)(52116002)(8676002)(6486002)(478600001)(16576012)(166002)(2906002)(5660300002)(86362001)(26005)(8936002)(966005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZmNPOEJ0b0pQZndZbkkwQ1lNcFMzN0Q5d2tKeTlIY0VkK2VLTUxJTm9PdFE0?=
 =?utf-8?B?MTNyelVORU9IKzVmc2lZV3ladU9adGs0MUVFZmI3cmhpN0VwN0R6VFgyUEU3?=
 =?utf-8?B?OXFVVXRRWDBNMktEWndPZXdrTnE1QzYrNlN4Z1BQMkNwbWFQVmM0RklUckdm?=
 =?utf-8?B?NDJidmN2RTNBL1Zid0czUzMrUWs0cFBSQ1dSbDdydnhQVEdxSGkyRTREMHVw?=
 =?utf-8?B?MzJ6TnJBNTh5OG5JWVNMenYxMzczWUdxMnd6Q04zZk1hbjVpRmJ2UVNxeGYy?=
 =?utf-8?B?SHNwMUJHSzA0NzlSRmxzRXB6dVhvZ2huZFRrdVJlQ1ZNZTJxMnNkMWd1clNt?=
 =?utf-8?B?YlFwY0tVRHNVUU9EdzFONit5TElObkNCZXVWaWwyL1hoemxSaVl6c2hKVlJs?=
 =?utf-8?B?NTRKSXg1QXY2Q1RSQUxTU21EaEhzNGxmYmVMRXpUb0tERmdoV0RpVXVjbVNP?=
 =?utf-8?B?WGFYQi92dFpDQ2FUQ1A0UkpWSm53RmF2MzhmdmZ5bDJNaHFSdzR1WVIwVm85?=
 =?utf-8?B?eTNtNHQvTTR3ZnZua0Z5YjgyZjFvWGpWTmNlTXpmOHdxR0g5RVozOW9nSi9V?=
 =?utf-8?B?UEdZdDlkWlo3VDN3U1ZzaUVwVEtmRW1iREFWWWt0c29FT3VYZ2ZrbFdwL1Rl?=
 =?utf-8?B?K1pDQkVDVVpseGlOYUhyMWZ0MXhaZEdscm1jWWRJL2FZQko5T1MwS1M2NTFj?=
 =?utf-8?B?Y3AybGVXc1p1VlpNUG00bWpKR2lnV3NxYUR4bUo3Rk1UK3oxRjJhOWx5WDE3?=
 =?utf-8?B?bkVyR0E1d0VJdEw0OXVBVE83aDlGZy8vb0tlTXlEMjNueHFROSt6dWxRbHJZ?=
 =?utf-8?B?UU51NWZYM2NMdGgvcXBhZHFHK2dqN3Y5ZENEaHBCa3ltdm5xRkZsRXVGVVNq?=
 =?utf-8?B?czlEVlg2QzF4aUpGTVJ6dmh6bGpGeXhwRmZEZUZGVlNHczA1YnBqU2tPMkdG?=
 =?utf-8?B?Q0JlU2Y5OGlLYnlPeXFnbG10SjNRbHg5R1VyN3dza0tUM0ZTYjdoVVNoazMx?=
 =?utf-8?B?TWhQblR6MTN5bGVsYW5YazNrNVhRS2JsOGZpR3kvRUF2QlIzYlRlcEtEZTlk?=
 =?utf-8?B?UlFadnJ1SHJDdXk0cHB5NEVnUXh1aDhxWXFpL2lVNDdySEpaUk9yWUd6TXFz?=
 =?utf-8?B?dTVOTEQvekxWT3hFUTgxVlZaR3pNTHhEWG9DRDV1Wk9FY1lnalZlU0VkZ04y?=
 =?utf-8?B?eHpGVnorYlFpbkVVRTQ3TXlIdFJLVTY2QjdaQnBrQjU5VUpLYSsrODJxelVB?=
 =?utf-8?B?YVNkSG84MlhYdHhqbnpwTzZ4ZUQ4K0dxTytDUjIrOHYyZy9CSEwxQzVoSlQr?=
 =?utf-8?Q?9rko60egqp9ednmG4CPrB/rtc6wvdGbubZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:07:52.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1d66c5-3afe-4e02-d5eb-08d8b3ef8d8a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qorTuG2b189ZCf/+26Q7CAhEsuzQKX7VecRY4ztW2FCrcsxvCae6PlB3Tvo/FfjT3v5CL66r3eDCdJpm4qhPQWe11QEAIIdAiZE+Yf1xfQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
Content-Type: multipart/alternative;
 boundary="------------3AF654726EBE4F812939D464"
Content-Language: en-US

--------------3AF654726EBE4F812939D464
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:07 p.m., Leon Anavi wrote:
> - Fix two regressions added in 0.19.2 with regard to sampling
>    behavior when reading the sampling decision from headers.
> - Increase internal transport queue size and make it configurable.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-sentry-sdk_0.19.1.bb => python3-sentry-sdk_0.19.5.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.1.bb => python3-sentry-sdk_0.19.5.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
> index 2da9908e34..bb960eed09 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
> @@ -5,8 +5,7 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "1e6aabe30f4c86356d1d85a9beb0b05a"
> -SRC_URI[sha256sum] = "5cf36eb6b1dc62d55f3c64289792cbaebc8ffa5a9da14474f49b46d20caa7fc8"
> +SRC_URI[sha256sum] = "737a094e49a529dd0fdcaafa9e97cf7c3d5eb964bd229821d640bc77f3502b3f"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 
>

--------------3AF654726EBE4F812939D464
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:07 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix two regressions added in 0.19.2 with regard to sampling
  behavior when reading the sampling decision from headers.
- Increase internal transport queue size and make it configurable.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-sentry-sdk_0.19.1.bb =&gt; python3-sentry-sdk_0.19.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.1.bb =&gt; python3-sentry-sdk_0.19.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
index 2da9908e34..bb960eed09 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
@@ -5,8 +5,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;1e6aabe30f4c86356d1d85a9beb0b05a&quot;
-SRC_URI[sha256sum] = &quot;5cf36eb6b1dc62d55f3c64289792cbaebc8ffa5a9da14474f49b46d20caa7fc8&quot;
+SRC_URI[sha256sum] = &quot;737a094e49a529dd0fdcaafa9e97cf7c3d5eb964bd229821d640bc77f3502b3f&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3AF654726EBE4F812939D464--

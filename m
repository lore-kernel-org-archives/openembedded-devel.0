Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.43])
 by mx.groups.io with SMTP id smtpd.web12.15201.1609774279485551657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DU47xpL4;
 spf=pass (domain: windriver.com, ip: 40.107.77.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ttdf72SMGDul38NPKpig64q+QBb2apgK/PXn07QggJUh3TfgDQHs8/h830UY2XpRVlS274bc8ixJktfhUC712+9MpxQzcuwBpczgOJ07pIdCemhzKjT5HVi9kiY24+j9lyboHg2zjMOdkTi/ExXS5u8ogTaZ7ot1IB8bVk1QeLIGbh7tBUQcjhdr+KM3AE2cTHcvgKFomYL3Bk0ZxIhmkBXer5ibK8gbcS1LvCFkGW3AdEafrbytYGiVSCt1b6iVbzVNjfmvAYYz1/STAGXLzl3GmlIT0BbacXLtEqvIzylOkEj1LvpR9VUFiuu5OCXxXZyTpkRtTbx/yWLzWtL2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NTPpDjwERMWKEG76keG948fbvQ6P4yG653Z6aCjVH8=;
 b=LW/mAoVUYGM1Ug0hUPbCSnFKLvRZnGXYPQxO45N6B9M82XB+0CPM4KdCsHR9Cx2goor/CrBMz/Baxr9IY/UJBx+IICF3/+60XvWddPvxprVsClZ0psBQIJMKMzbdAQqq00EkxmKhcfonOFNFOBfDzlxwNrUZo3LoTsSif5Ezj+mGl8rQ3nb+74yrmIdaEwRm6ELpoJ9YSh9vn1uDU00+BKVpXxy6yzph0PaKprTuG6q36fRpsSzZYBIZnERQ2wsKFMA06vpuj3FIIBcqiMJI9KKcN2292+OiPYBnTFbziL2Y7wjF7NVzB2gsf2YBp1BrNxDSghFc3x4u9RPOqsVM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NTPpDjwERMWKEG76keG948fbvQ6P4yG653Z6aCjVH8=;
 b=DU47xpL4oDzBQmfSIMP47uzA+yHqHqhqU89arDbAZrXL58UmJpbaCrdm9E7s8Vi+bgn38NV676ScY7/ilcHe6IOXqu3WcVYgs7HlsHNR93hGvq8MW/wdlKYL2k0EZf1RqeRxN4OYMLcl/l52QR/gK3dbABZSHt4fwZ+4qpUnMfM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3222.namprd11.prod.outlook.com (2603:10b6:a03:79::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 15:31:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:31:17 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-chardet: Upgrade 3.0.4 -> 4.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201222011459.14452-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <92e6852e-b195-2bf7-4d98-353fa369496c@windriver.com>
Date: Mon, 4 Jan 2021 10:31:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201222011459.14452-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0423.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0423.namprd13.prod.outlook.com (2603:10b6:208:2c3::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bea0956-0b67-42d4-9f9c-08d8b0c5c73c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3222:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3222E7F436CDF212F8F05BF69FD20@BYAPR11MB3222.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	udFVlwC3YNeAYcHoxUKk0YLkxosap42iByioSjsEdZPN+i1Jcb7Acjw3+XCVdYSyxgV5TqL5uKkvZa+DIBXVOPwUtt1z/GqEjHbDWWfPedHt8+UGO3yAIVVMDgKdxOPYLZa3ZpCbaEOxJidJH35PpOi2I6iCcMD5hEBUazBMDrEnDBDxKKatKw8fqwsRHLZQPnONzJvw1hxnZgVrroW6DakSpBIA9KiKpoEquYYVkh2VgYeaR9e8itCL7I/jnLxi5JWQa5n4EXI6uhwBg98gEV8JaO17OH74K5EZxek9VdQhUvFLRxE8m+sll8NCa9oE15i9PVt0nDUdpfV/36KPRpdCEminHiqcQVpyb8lEWUxlATpxdpN9GaQ8CgEL1o1XDvWWppBY/qYaPJEgeax0YsrfS2dGRhxh2za/tHBzlaPs8SAXVfgep4tk5XTXLRKzcWU2lkzxzxySqq4LtYZ4uZYudKIas5EICHxdb9BXxZAuP+YJxCloYJnrIsS1z5byWErAXw3EvHi26HxfXnWCVY0/H7VFiIi0+6LTUXhq9hQ0XzUGjNhcHrX19xUJKgPW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(26005)(36756003)(8676002)(66946007)(66556008)(66476007)(316002)(16576012)(4001150100001)(44832011)(2906002)(31686004)(16526019)(52116002)(31696002)(186003)(6486002)(2616005)(83380400001)(956004)(33964004)(966005)(53546011)(478600001)(8936002)(86362001)(5660300002)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OEtOTTcrS0hDWEhnVmlLbzhKN1dXWlozUmNTd2MzQnU0WXd0dm5jMzlzc3Mv?=
 =?utf-8?B?djVuNENVOEJnRTJ0TUxLM0p5YnBaN3ZrRjhIUXo4b3laaStvdk1LeW1Jdk5r?=
 =?utf-8?B?bjdpT0h4QW50MlNOeENCU1VTVXgwM0dkM1hvWVkrdVp4VFd4TnhEeHYvRjA4?=
 =?utf-8?B?YUhWN1h2VWEwRnN2R2RybUN1WGFqY2FNK05SMUtEV01zcmw0dFpBK1dQdDRh?=
 =?utf-8?B?bHNsemY5MUFvV2Nmb0NueGFJYk9DNFRVQ0J4MXlqNzJ1b0NNSElpdWdGcEx1?=
 =?utf-8?B?SUJ5dlpnWmErNlBNbHg4alA0MjBlcXRlbGtHTWlXSFc0bUtsUDhFRXhnVTNF?=
 =?utf-8?B?bjVERDBqcSt5Qk1ETHFiTUtldjRYL0VlZUF5U29GUlgvUll2Tnc1ck5DZU56?=
 =?utf-8?B?TGNlTmtMV1hjSk9nN00rV0NERjBjb2hRYmp4RWlVd3c2SGJuOE1zSDJPQ2w0?=
 =?utf-8?B?QU91Q0FvdXdyQ0RYcnFkenpGVThwYlBoRVBUUktYdWxQSmlneVVXVHZsQWZX?=
 =?utf-8?B?Qythc2puWkpzN0wwOXNvY1R1NVhpdjdvdGsrWVZyT2Jtb3JORGVLeDRoSzdq?=
 =?utf-8?B?OEdLTE9YRjJTTlpXNnFncCtLNWwyYjJGb3YwQUhSQWlrZWtEVWdxNjhPVDQ5?=
 =?utf-8?B?c2x1SklWZ290cVZsbURkQklnK0h3MjFZZnp5eTlDd09pRjlwY2laRnVSVDNI?=
 =?utf-8?B?Ukh5U2JsOENJVmJtRVpTZmIrYWxSVGRDN0ZXejBTQXRNUElvWTFsRFl6MU9s?=
 =?utf-8?B?ZEk4cVUzTXpFVUU3eWJZVkprdHlId3ZCWXhSNWtMa2ZPRndYVlZoWk5Lc1hz?=
 =?utf-8?B?U2lPN3VQK0hqU096dDI1SW5Rd2Q4dlh2Mis5VyszZzY5UGtoaytaSFRVY0RD?=
 =?utf-8?B?Qjh3UWgvVFZCTkYyUnhGMzdEbUMvb0pDUGpJbFdKb2s1dGtENDNDanpxUnpT?=
 =?utf-8?B?TGU0ei9zT0wzd0RCMVVKUGNRT0JHYVF5VXdiSndNd0tjS28waHNoN1B0QnYv?=
 =?utf-8?B?MmZ2RDBYVU1VVkxCbGQwdGRFVzY2cnlwOTl3a2V1bmhDZE9xV2g4WG9STldu?=
 =?utf-8?B?OW11cE0rTWdRdXBkTURIczVlaStxVUUzMXo3WGZBS2VoV3RWVUxHdTRBSVNz?=
 =?utf-8?B?cFJ5NGlkYS9Bb2d4Z210QXFuTEFOdjBDU1Z3WjNrYlkrcG80aDNMMGdUWkZE?=
 =?utf-8?B?MHV0SXpIZWpHVlVDOVQ1emtDTW5kVGFYZEhBM25tb1Q2RER6eVUxSmJOanlN?=
 =?utf-8?B?TGQrNDB3UzRReFpYUURibHhvVEZaSUJEeWdhbnNMZ1gyYzhyOHEyVk4vdzFM?=
 =?utf-8?Q?x5qVm9KAH7qWE9biwl3rMmeiWpemdG7gyQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:31:16.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bea0956-0b67-42d4-9f9c-08d8b0c5c73c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOS848ueglDdSkLio7XA0gvB9sKxvbIcmuo5fNBNbh+yaFnkIe3m6b9hxRlWkAITk0NqfUFa8/pxi1f8BhyOOsun5ok0+0+r0I2zKAhug7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3222
Content-Type: multipart/alternative;
 boundary="------------1DE5B3549746EE536FDF0566"
Content-Language: en-US

--------------1DE5B3549746EE536FDF0566
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-21 8:14 p.m., Leon Anavi wrote:
> - Single-byte charset probers now use nested dictionaries under
>    the hood, so they are usually a little faster than before.
> - The CharsetGroupProber class now properly short-circuits when
>    one of the probers in the group is considered a definite match.
>    This lead to a substantial speedup.
> - There is now a chardet.detect_all function that returns a list
>    of possible encodings for the input with associated confidences.
> - Support for Python 2.6, 3.4, and 3.5 was dropped as they are all
>    past end-of-life.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-chardet_3.0.4.bb => python3-chardet_4.0.0.bb}     | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-chardet_3.0.4.bb => python3-chardet_4.0.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
> index 80785b8d4e..4caf33cb25 100644
> --- a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
> @@ -2,8 +2,7 @@ SUMMARY = "Universal encoding detector for Python 2 and 3"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
>   
> -SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
> -SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
> +SRC_URI[sha256sum] = "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
>   
>   # setup.py of chardet needs this.
>   DEPENDS += "${PYTHON_PN}-pytest-runner-native"
>
> 
>

--------------1DE5B3549746EE536FDF0566
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-21 8:14 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201222011459.14452-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Single-byte charset probers now use nested dictionaries under
  the hood, so they are usually a little faster than before.
- The CharsetGroupProber class now properly short-circuits when
  one of the probers in the group is considered a definite match.
  This lead to a substantial speedup.
- There is now a chardet.detect_all function that returns a list
  of possible encodings for the input with associated confidences.
- Support for Python 2.6, 3.4, and 3.5 was dropped as they are all
  past end-of-life.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201222011459.14452-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-chardet_3.0.4.bb =&gt; python3-chardet_4.0.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-chardet_3.0.4.bb =&gt; python3-chardet_4.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
index 80785b8d4e..4caf33cb25 100644
--- a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
@@ -2,8 +2,7 @@ SUMMARY = &quot;Universal encoding detector for Python 2 and 3&quot;
 LICENSE = &quot;LGPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343">&quot;file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343&quot;</a>
 
-SRC_URI[md5sum] = &quot;7dd1ba7f9c77e32351b0a0cfacf4055c&quot;
-SRC_URI[sha256sum] = &quot;84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae&quot;
+SRC_URI[sha256sum] = &quot;0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa&quot;
 
 # setup.py of chardet needs this.
 DEPENDS += &quot;${PYTHON_PN}-pytest-runner-native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1DE5B3549746EE536FDF0566--

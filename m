Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.88])
 by mx.groups.io with SMTP id smtpd.web11.24016.1611839274820144731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Gbx+KTsg;
 spf=pass (domain: windriver.com, ip: 40.107.70.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2LRD9q8pb7cWaBkl/IFXkgBXxV+SMEg1lT9Ix12AVGpIUNOx3hjPSXWgtn857QxQVLesi/ndApRxtu60HE+KoyZwpUK4y/LAYQgC7ssjPwzgziCw3vl2gW9jmbqhzaW3JaaRYEujaR6351Lye7E3gHJkYhT8hitZhKPV1J4Q71vkzun1KKD/rb8DO9+wLliuN4/bbUpFX6Dgi6H+tGQCW7zHwo5P3KhiknwEBieNdMO+rqDhgKyEkAKW8qrCB8NJjX8Oz0FiZcKoqTLDCuUgyDOt1a6Ao6LMvQKsjTEIjoaj/5jij1kMQ8KZBjkDxU3nInDBME4CAmjdARpj+WqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3cBjld8f07SKtp6YF0tEW/vPB5sxcqEuW2x9tM2Ddw=;
 b=Tnhs63TqpDDr5A0aOuESWBJN6G7GICydS/9Alwqqw3GZP7TvhSYvtI443viCD80lrW/rFAf0gyXaJ4zZttAdt7jvd8NVzrc6NG+eKmXyHSgs3O36C6uwJx0PZlYCUqCz9ayGYWFV0BfabukwZr7Hs4fLs1BGOpLEdqPv4OqukATD057zTr+vsaLFvAQGGbfm4xrcOmw/+bVuS49WeJEItvjGtRqc0pelivfes589GPZ/Br6Qh7Q69/UhH1I13hjz8K42ecM+WSNIWBt378pzNdCO3ZfE1UWbvFFu9/EQaArpLoR2MPT+qh6bK/4Gj4B+wCk8AxCJBSkfH3dKj+tOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3cBjld8f07SKtp6YF0tEW/vPB5sxcqEuW2x9tM2Ddw=;
 b=Gbx+KTsgrPqrwSuYsr4wzWmYWz70SdjYIwQsBZSgJxAnyiH7AAPuzslyYrPqqGiV/vtWi7v9+z6h1qlllJPefwOKAg8rQ4NHBn15mDE2Filj5RK2wXivKxmRJjAK4UsEXq7Zf01yn2Ut7CDspgGBUpXI26d/D9NyQV0B9O0CgUk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 13:07:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:07:53 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-coverage: Upgrade 5.3.1 -> 5.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
 <20210126125003.27620-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6b01c20e-0a0b-2707-5761-744d27e93588@windriver.com>
Date: Thu, 28 Jan 2021 08:07:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210126125003.27620-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:07:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10c40ced-5672-459c-3873-08d8c38db8ea
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4184A8133E901C1C3CE2CFC79FBA9@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QV/XJPgcpn3hX7So/nA4JuyJ+rLrsCf05iOQT2qS7HbfZFNWW/8kSiZxSWegapmsDstsCvyK9MIcLpVfZiuL27U3PSV898LkPJY/lmFWUGG8e5oy8Q/yQ5Yzj3yaOpA/AC15R22ijwdBeTb5ntHeOYadd2IQqv/gDizI9CPgy2VVxk0HzmPEz+kEe5sek2w/M2dCXVgQSxf+Pzawkjh4quZ5Z4IT0xqm3SFccPGO3cqLfDK0adWbgu44+YH/CVOVi/lbhLxnl9s+ORqV1r+MB3i/OmEw05K5MxW9h0zdM82tjfeQEbD5Xr5YAhwRNpyEL0KDg558js7KvVA9D+PIJ4Iy/LBsiVo86e3RTvEiwD68dXlUQkFdDrQWR7drRAFLTmN6m0sxYZaCV5i4k6wFwulV+U8qV9dyrKOiNzYPed1LRijy3OFiTmxN7J2VyucUQdqA6GeXWTiYxpQyXzMAEGfe3C0sveJrHrW/7wcChqcV++kNK0h2dSDUBMiyXi4uBLjDOfabhh3M0Wn1BOU/ravM6a56jSAz2bqVQkuesdcR9WBAU7LPXtzq32dfDSDcr7A222J9QGSpP53cZ98hNZP4/i/UBCuUS9DMmdOMyn09JI12h2a2129XqgJpRTmmBU8qdSRBZHOqc6+VQCmU4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(2616005)(66946007)(966005)(53546011)(6486002)(2906002)(66476007)(33964004)(8936002)(166002)(478600001)(52116002)(5660300002)(44832011)(83380400001)(26005)(31696002)(16526019)(86362001)(8676002)(186003)(31686004)(36756003)(16576012)(316002)(956004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?STNxS1djdG5JRHh3ek1pdThHcjcva0grTnc3N0VFWkRuVWgxREs1NVdTem11?=
 =?utf-8?B?VW91cjhkU3RnWmxDYlhJeU5sbEtnUlRLNDM3aEZwWVRDTDF2czdEYU5zb0lq?=
 =?utf-8?B?WWJRc2JiZDlFSmcwTmZ0N0o4Y1I3aFVJVHZ5TzZGZDV5amRXdFBTeXpFVXJU?=
 =?utf-8?B?YnJyenhUWERKc21FaE1ycTBMUlBiMlhoZXNDcGFHaWNTOTM3RzZoOHZHeTdz?=
 =?utf-8?B?RGVGY2l5VG1CYTZ0K3BDU0dyWkc5YnZ3dlVvVkZTZjBsT2hHUk9jN084TFNH?=
 =?utf-8?B?dkkvNjBpNHRWTE9KNmM5djhVcjFXV0RWOGcrVW1QbjRJM1lERzR2MGNtQlpP?=
 =?utf-8?B?MmJpMFlxcEFSUmxMc3dOOUE2emFuWHlCUWdrTnVFbHBkeWQzc2YyZ25pK0tD?=
 =?utf-8?B?Z0tGWWk4bFR3K2p0dll0VjY0K2RicGtONlNJU2hmalNnY3N4ZFhwNmNzczU4?=
 =?utf-8?B?RXFuK2htNm1weTJsN1VKRFR0TVd1S3JwTERDZWFZMHhlUStGejRMSFVGSkRp?=
 =?utf-8?B?Zmg0bEViUjRLMlp6L1NjRjY0c0FNWnIxaTZuRVpTR21rU0gxNTBkaTRXY1NQ?=
 =?utf-8?B?Q1grRXJzb3BxYlVPcVRLTjZrSWdHSUlPZ0VqUEJ6OWhNT0FNdTBRQUhLRERB?=
 =?utf-8?B?amZpMHB1bUZCUTFMUGU5bGN5a3dXQmd1QnZtSlJ6d0xzSEw4bXJVd1pzaU1T?=
 =?utf-8?B?RGgwcS91WmdpempuQnc5UFpUMEFXemJPNnRwUFJFYy96RWw2ODZYMDk1WGZi?=
 =?utf-8?B?cVpwRlVFMG1Jcnozb0t6QW1aWGJJR2w4ZEV1WVpHeXpBUzVRdGZzRUZXQnNP?=
 =?utf-8?B?UUJ0K2hFZHBMNWVzdTZ5aFQ0ak5zSEtkZ1dXaGFkYjZXWXdtNndrZVhTOGkw?=
 =?utf-8?B?WXlVTEZlM01XLy8yOWdlUldISGdnSWozTVZJR0V1WmpJa0NIeHl0WTg3SXd4?=
 =?utf-8?B?L0d1VzF1aFo5RWNCMXpUdkxEQVdIenM3cDNBV1FSMU1vY2pyS0NsUmxrKzh6?=
 =?utf-8?B?VkpLNDdTMmVUcW5ZMXhHa0dmUUt6RGpWbU90ditTcGRlWU1JMEhmOVBlMW9F?=
 =?utf-8?B?S2FacFVNZVVHcjZ1SWFJQmRwR2Vpa0N6OWU0WXVISGxGZ3V2MjNTTmxOa1BN?=
 =?utf-8?B?RnZSZVhXRTZzWFZzVDBoTk9DZi9lOGh6VkQrRDVJVzRxeTQyNk1lUnhHTnJJ?=
 =?utf-8?B?NTJoRmJ4elJYMUc3MmpNd1Z6TmRyYyt0c3pEZzhqSzZzWTVxWGQ4a2Rxa21r?=
 =?utf-8?B?WnJjempYOVpmMkFLS3U0QnRpVk9COW9LN0hyaVQzcnN0cXYvOGhvQ2xJZnBm?=
 =?utf-8?B?Ny85blpxanloUC90KyswRVlVZWxXS1k1bmZBL1lzY293LzVwSittNjl3ZVhS?=
 =?utf-8?B?dmxmT2s4c2hHdXdtMU5ESW1rUkZXMFhScTJXeHlQZXUxbWxoKysvcjl1TXpu?=
 =?utf-8?Q?zTH4Ohjc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c40ced-5672-459c-3873-08d8c38db8ea
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:07:53.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX4+Lr1LpbNClMW4vhPBxH5IO5e9QM4OekLwWG/kAJe+JQD9Z2y8jNKW/zUf95eMc3gRmSeQK28Ap69LvLebuZCgPz1xgfRdQAqFUMvWKyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Content-Type: multipart/alternative;
 boundary="------------25048D7724A19BCDAFEA466F"
Content-Language: en-US

--------------25048D7724A19BCDAFEA466F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-26 7:50 a.m., Leon Anavi wrote:
> - The text report produced by coverage report now always outputs
>    a TOTAL line, even if only one Python file is reported. This
>    makes regex parsing of the output easier.
> - The skip_covered and skip_empty settings in the configuration
>    file can now be specified in the [html] section, so that text
>    reports and HTML reports can use separate settings. The HTML
>    report will still use the [report] settings if there isn't a
>    value in the [html] section.
> - Combining files on Windows across drives how works properly.
> - Fix an obscure warning from deep in the _decimal module.
> - Update to support Python 3.10 alphas in progress, including
>    PEP 626: Precise line numbers for debugging and other tools.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-coverage_5.3.1.bb => python3-coverage_5.4.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-coverage_5.3.1.bb => python3-coverage_5.4.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.4.bb
> index 14d29a247..4ea9b6a19 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[sha256sum] = "38f16b1317b8dd82df67ed5daa5f5e7c959e46579840d77a67a4ceb9cef0a50b"
> +SRC_URI[sha256sum] = "6d2e262e5e8da6fa56e774fb8e2643417351427604c2b177f8e8c5f75fc928ca"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------25048D7724A19BCDAFEA466F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-26 7:50 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210126125003.27620-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- The text report produced by coverage report now always outputs
  a TOTAL line, even if only one Python file is reported. This
  makes regex parsing of the output easier.
- The skip_covered and skip_empty settings in the configuration
  file can now be specified in the [html] section, so that text
  reports and HTML reports can use separate settings. The HTML
  report will still use the [report] settings if there isn't a
  value in the [html] section.
- Combining files on Windows across drives how works properly.
- Fix an obscure warning from deep in the _decimal module.
- Update to support Python 3.10 alphas in progress, including
  PEP 626: Precise line numbers for debugging and other tools.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210126125003.27620-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-coverage_5.3.1.bb =&gt; python3-coverage_5.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.3.1.bb =&gt; python3-coverage_5.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.4.bb
index 14d29a247..4ea9b6a19 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coverage.readthedocs.io">&quot;https://coverage.readthedocs.io&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[sha256sum] = &quot;38f16b1317b8dd82df67ed5daa5f5e7c959e46579840d77a67a4ceb9cef0a50b&quot;
+SRC_URI[sha256sum] = &quot;6d2e262e5e8da6fa56e774fb8e2643417351427604c2b177f8e8c5f75fc928ca&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------25048D7724A19BCDAFEA466F--
